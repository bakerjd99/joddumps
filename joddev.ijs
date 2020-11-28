NB. JOD dictionary dump: 28 Nov 2020 12:52:48
NB. Generated with JOD version; 1.0.22 - dev; 9; 27 Nov 2020 12:01:00
NB. J version: j902/j64avx2/windows/beta-n/commercial/www.jsoftware.com/2020-11-21T12:09:32/clang-9-0-0/SLEEF=1
NB.
NB. Names & DidNums on current path
NB. +------+--------------------------------------+
NB. |joddev|53396629426474297605411326776785356433|
NB. +------+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22 - dev';9;'27 Nov 2020 12:01:00'

JODVMD=:'1.0.22 - dev';9;'27 Nov 2020 12:01:00'

OK0256=:'jod.pdf not installed - use pacman to install the addon general/joddocument'

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit setjodliterate wordlit'

WRAPPREFIXTEX=:'\RegionMarkerTok{)}\KeywordTok{=.}\RegionMarkerTok{)}\KeywordTok{=.}'

jodliterate_hashdateurl=:<;._1 '|3611fa8d907f0907fe42926889c483a5d28f10294f66c4fd18cdf8f45c6937f0|28 Nov 2020 12:09:05 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


abv=:3 : 0

NB.*abv v-- all backup version names.
NB.
NB. Returns all  valid backup  names  matching  name prefix  (y).
NB. Names are listed from most recent backups to older backups.
NB.
NB. monad:  (paRc ; blclBNames) =. abv zl|clPfx
NB.
NB.   abv 'ch'  NB. all words in all backups starting with 'ch'
NB.   abv ''    NB. all words in all backups
NB.
NB. dyad:   (paRc ; blclBNames) =. il abv zl|clPfx
NB.
NB.   2 abv 'jod'  NB. all group names in all backups starting with 'jod'
NB.   4 abv ''     NB. all macros in all backups

0 abv y NB. word default
:
if. badcl y do. jderr ERR002 return. end. NB. errmsg: invalid name(s)
if. (1 < #,x) +. badil x do. jderr ERR001 return. end. NB. errmsg: invalid option(s)
if. -.isempty y do. if. badrc uv=. checknames y do. uv return. else. y=. rv uv end. end.
if. badrc uv=. x bnl '.' do. uv return. else. bn=. }.uv end.

NB. names matching prefix in all backups
pfx=. (<a:) -.&.>~ }.@(x&bnl)&.> (<y) ,&.> bn
b=. 0 < #&> pfx

NB. return backup names from most recent to older backups
ok \:~ ;<"1@;"1&.> (b # pfx) ,"0&.> <"0 b # bn
)

createmast=:3 : 0

NB.*createmast v-- creates the dictionary master file.
NB.
NB. The master  file holds the  master  dictionary directory  and
NB. dictionary parameters.  The master  file  tracks the state of
NB. dictionaries.  In  this  system  only  one task  can  open  a
NB. dictionary read/write. When opening a  dictionary  the master
NB. file is  checked  to determine if  the  dictionary  has  been
NB. opened read/write by another task. Dictionaries can be opened
NB. read/only by any number of tasks.
NB.
NB. monad:  createmast clFile
NB.
NB.   createmast_ajod_  JMASTER_ajod_  NB. recreate master

fn=.  hostsep y
if. IFWIN do.
  syp=. PATHDEL ,~ (justdrv , ':'"_ , justpath) fn
else.
  syp=. PATHDEL ,~ justpath fn
end.

if. badappend jcreate fn do.
  jderr ERR011 NB. errmsg: error(s) creating dictionary master file
  return.
end.

fn=. jopen_jfiles_ fn
cn=. (<0;now '') jappend fn     NB. c0 use bit and last change
'jodversion jodbuildcnt'=. 2{.JODVMD
cn=. cn, (<jodversion;jodbuildcnt,didnum 0) jappend fn  NB. c1 version, build #, unique id
cn=. cn, (4 0$'') jappend fn    NB. c2 dictionary directory
cn=. cn, (4 0$'') jappend fn    NB. c3 directory backup
cn=. cn, (3#<'') jappend fn     NB. c4,c5,c6 RESERVED

NB. parse parameter settings --- sets (MASTERPARMS)
try.
  0!:0 <syp,PARMFILE
  parms=. <dptable MASTERPARMS    NB. created by 0!:0 !(*)=. MASTERPARMS
catchd.
  jclose_jfiles_ fn
  (jderr ERR027),<syp,PARMFILE return.
end.

cn=. cn, parms jappend fn       NB. c7 active dictionary parameters
cn=. cn, parms jappend fn       NB. c8 active parameter backup
cn=. cn, parms jappend fn       NB. c9 default parameters
cn=. cn, (i.0) jappend fn       NB. c10 dictionary log
jclose_jfiles_ fn
if. 0 > <./cn do.
  jderr ERR011
else.
  ok {: cn  NB. return last component
end.
)

firstperiod=:3 : 0

NB.*firstperiod v-- returns the index of first sentence period.
NB.
NB. monad:  firstperiod cl

NB. first period in at most 500 chars
y=. (500<.#y){.y

NB. inflected names have been long deprecated in J
NB. there is no need to mask them in later code 
NB. args=. ;&.> , { (<<"0' ([{'),<;:'m. n. x. y. u. v. *.'
NB. y=.' ' (I. _2  (|. !. 0) +./ args E.&> <y)} y

NB. first period
y i. '.'
)

jodhelp=:3 : 0

NB.*jodhelp v-- display PDF JOD help.
NB.
NB. monad:  jodhelp uuIgnore
NB.
NB.   jodhelp ''  NB. display JOD help - start PDF browsing 

jodpdf=. jpath '~addons/general/joddocument/pdfdoc/jod.pdf'
if. fex<jodpdf do.
  NB. jod.pdf is installed and local
  pdfrdr=. pdfreader 0
  if. UNAME-:'Darwin' do.
    NB. require 'task' !(*)=. shell
    ok OK0255 [ shell pdfrdr,' ',qt jodpdf NB. msg starting PDF reader
  elseif. fex<pdfrdr do.
    NB. spawn PDF browse task - requires configured PDF reader on host
    ok OK0255 [ jodfork pdfrdr;jodpdf
  elseif.do.
    (jderr ERR0260),<pdfrdr NB. errmsg: PDF reader not found
  end.
else.
  NB. jod.pdf is not installed advise user to download joddocument addon
  ok OK0256 NB. msg: jod.pdf not installed - use pacman to install the addon general/joddocument
end.
)

jodon=:3 : 0

NB.*jodon v--  turn  JOD on  result  is 1  if  successful  and  0
NB. otherwise.
NB.
NB. Tests the  current J environment and creates or activates JOD
NB. objects.
NB.
NB. monad:  paRc =. jodon uuIgnore

NB. format of (9!:14) has changed without warning in the past
jvn=. 9!:14 ''

NB. first value before '/' is the version number (we hope).
jvn=. , (jvn i. '/') {. jvn
if. #jvn do. jvn=. 0 ". jvn #~ jvn e. '0123456789' else. jvn=. 0 end.

NB. allow older system to run but nag the user to upgrade
if. jvn < 801 do.
  0 0 $ (1!:2&2) 'WARNING: JOD works best with current J 8.0x-9.0x systems - upgrade!'
end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  NB. J's before 6.02 are beyond the pale
  msg=. 'JOD requires J 8.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 8.0x-9.0x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN' do.
  msg=. 'JOD depends on core J load and class utilities.'
  0 [ sp msg=. msg,LF,'Load J with a standard profile to use JOD.'
  return.
end.

NB. HARDCODE: JODobj_ijod_ ijod ajod
jodob=. nc 'JODobj_ijod_'          NB. name class of JOD object pointer
jodco=. (<'ajod') e. 18!:1 ] 0     NB. JOD class status

if. (0=jodob) *. jodco      do. 1  NB. JOD is loaded
elseif. (_1=jodob) *. jodco do.
  NB. jod is off and classes are loaded - create objects !(*)=. conew
  JODobj_ijod_=: conew 'ajod'
  if. jodcs=. createjod__JODobj JODobj_ijod_ do. 1 else. 0 [ ex 'JODobj_ijod_' end.
elseif. -. jodco do.
  NB. JOD classes absent load and start system !(*)=. load
  ex 'JODobj_ijod_'
  NB. JOD load now requires addon path
  load 'general/jod'
  0 = nc 'JODobj_ijod_'
elseif.do. 0 NB. utterly screwed up system state
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3A;R12'=Xs0esk12'=V1+>u"u1,9t21*A;*+>u"u0fU:72]sh5+>P_q0eje,0d&@s1,9t-0H`/.
+>GYp2_cF2+>Pbr0ea_+1a"M-+>bhr2]sk0+>k9!1IP#+<D>nW<)#YV9.4\%.3N24BlkJ>AU&;>
FCf<.CghEs+>"^WFDl22A0>T(+EV:2F!,(5Ebuq@D]j">ATMF'G%De-D.7'eA7]9o@rH4$ASuU2
8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*
.!&sAC2[WsDKKH1Amo1\.7nhX:IJo7FCfK)@:NkI<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et+DG_8
ATDBk@q?c7+E_a:A0>?,+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$FDl)6
F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)
@:Njt8U=!)7!*?cCi`NS5u'g6;FGSJ@;]UaEb$;&DfTD38l%iS:JXY_+DG_8ATDBk@q?c7+E_a:
A0>?,+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$F`_>8FCfK)@:Nk`De+!4
Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk
8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk;GU(f=&2^^;eg5]Ch\!&Eaa'$Ec5l<+EqaEA9/l*
DfQsKC2[X!Blmp,@<?'0+D5_5F`:D[5u:BU77KjN<(0o.@;]Uo@j"HR<+T/SAo_<mD.RU,+D,Y4
D'16.;F+,U;FO&H==G@E+EV:.F(HJ8FE2)5B6,24F`VXI@rHC.ATMg/DId0bG%#3'+C\bhCNXS=
G%G]8Bl@l3DIIBnF(96%@<?'t@<6O#Eb/[$ATJu9BOr;sBk)7!Df0!(Gp$s4F*(u6+D,>(AS,Xs
F*)A4EbTH&Eb0?8Ec,q@FD,5.Bl7HmGT^p:+D,>.F*&OGASuU$DI[6#E+O'(De*U$A8#OjE+E[(
E,8s.+AbHq+A,Et+D>>&E,'<%Df0Z>Ec*!l:IH=DDBNt2F*2;@+DGm>0d(1B+EM[8@qB_&Ap%o4
@;]Tu0Hb:UBOu4.Bldh                                                       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0H`,,1cJiPG#N6rCLo1R:-pQ_@:FCYD/X3$0JFVk/M/(n@:FC/+CT;'F_t]-F<GXA
Deio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU.3N/8
@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)
0JFj`$;No?%15is/g)8Z1+==oC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+0Q(fP1,]RK:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@s)g4ASuT4-XpM*AL@oo%15is/g,">CLnW'De*s$F*(u6+D,Y4D'2GH6m-#SF*)G:@Wcd,Df-\.
Bk)7!Df0!(Bk;>p$;No?%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX
67sB'+Dkq9+=CoBA9;C(FCfJ?%16oi@:UK.C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;R
Deio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;R
Deio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQQ:-pQU4#%j#:-pQUH!tQ,ATAo3DBKAq%172fBk)6J3ZoelATMs.
De(OU-OgCl$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC#F`2A54ZXr<-RU5l5U\01-RU8h.6o:+
INUg85U\cB-RU8h.4G]5:-pQB$;No?+AP6U+D58'ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=LZ-
Ft"PBEbBN3ASuT4E+*j1ATD[0%15is/e&._67sBqDIYgj+AY<r771$L6XO8:De*2a$;No?%15is
/g*nU/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE8QV+DG_'Cis9&DJ()'Ch[EkA0<:F.1HVZ67sBs
@<-!D3Zoh5BeD(g+=nW`4<cI%C2RN1+:SZQ67r]S:-pQU:-pQUG%#3$A0>o,B4uB0.![6a@<-"'
D.RU,+E1b2FCfK1F!*%WE,8rsDBMOoDIIBn+E2@4AncK4@;]TuASlC.Gp"I^%15is/g,1CEb@Nr
+=D&8D.P(;+?L\n-RU8h-Qij*:-pQB$;No?+AP6U+Eh10Bk/>7@:FC/+CT;'F_t]-F<GO2FED)7
DK?6o:-pQUC12-q4ZX]J+u(3%+u(2a3[QIC+>Fum+>P'd+u(2_4s279-Qli,Fs&.]+=nX/3Zp."
/0K9^-p2<SEb?gD/0I&'EHQ2AAL9#n+FQ:k@<-!0+=nX^3c\YLB+51W$;No?+<Y*%Fs&/M@;TR'
+:SZQ67sB'@:FC&-RU#Z+<Vd9$;No?+>=pH@WikADIIBn-OgDX67sB7+CS`&+=ANZ+<Vd9$;No?
+>G!I@WikADIIBn-OgDX67sB8+CS`&+=ANZ+<Vd9$;No?+>P'J@WikADIIBn-OgDX67sB9+CS`&
+=ANZ+<Vd9$;No?+>Y-K@WikADIIBn-OgDX67sB:+CS`&+=ANZ+<Vd9$;No?+>b3L@WikADIIBn
-OgDX67sB;+CS`&+=ANZ+<Vd9$4R>+0RI_K+EV..@rrht+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'
Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh
/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&@;^?5@UWb^F`;CE
%15Ks4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@EZd\794)$o9IqP@
/no'4-OgCl$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bhCNXT;+>"^IG]75(
FCeu*ATDg0EX`@nATAo%@WikA-QjNS+<VdL+<Ve%67sBuDffZ,DJ'CcDImi2@:FC&-Zj9JAS!4u
$>sEq+CS`&+=Ci6Eb-U-$4R>[ATAnK+CS`&+=ANZ+<VdL+AP6U+EMX=Cht53@:WdU$>sEq+>b3L
@WikAH#IgQ+<Ve%67sC"ATDj+F*),6B-7WjDImi20d'n6Fs&/FBm+'1E$l)%%15is/g+YEART[l
+EV:;ARuun@:O(qE,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI
@r#TtFC])qF:AQd$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+
?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6lA0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+
Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])q
F:AQd$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:F                                   ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;*+>Pi`@Wk[eDeio<0IU@=Ft"PBEbBN3ASuT4F)>i2AKZ)+F*)I~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1[/0f1"/+>G_r1*A;02`Mp80H`+n0fLpL+>GSn1*A;.0K:101E\Fq1,M!F+>PYo1*A;-2DlU3
0H`+n1,1U@2BX_1+>P&u1GCg30f^@3+>GQ,3?U%5+>P'"2`Dj60d&4o0f1dD+>Gl!1*A;*0f^@2
2]sju0f(^E+>t>t+>GT.3$9q4+>P&o1GCUW:IINL8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mp/hen5+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>>eu:2b:u1,(I;+>>c91,(aC2%9m%
$4R>;67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg1*B>1
Fs&Oo1,'h*0fh'F3\r]($4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u1,(I;+>GW41c%0L
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+>Pes:2b:u1,(I;+>GW42)I?M1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pku:2b:u1,(I;+>GQ21,M$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;+>GT31GV!K3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A
+>Pku:2b:u1,(I;+>GT31bh$G2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Pku:2b:u1,(I;+>GW40JPUB0FCEJ6rZrX9N+8X8PDNC8Q/Sa
;HYb4%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU0KC7NDg!6Y0JY=)0K;*K0KLmF%13OO%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY
0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0eskHDg!6Y0JY=)0ek^E1-.3M%13OO
%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO1,fXL$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,U1LDg!6Y0JY=)0etdH1HI?J$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pes
:2b:u1,(I;+>GW42)I?M1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp18+AQiu+>PW+0H`)-3]&cV1GB.C$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2BYb5Fs&Oo1,'h*
1-.0I3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=#+<X'\FCdKU1,g=NDg!6Y0JY=)0ebXD1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;+>GT31GV!K3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K
3Zp1:+AQiu+>PW+0H`))3\rTR1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`T$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,g=NDg!6Y
0JY=)0etdD0fh!B$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6tA1hh=B.4s2
8l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NT
Bl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'J
AKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.S
Ec6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/
6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1
Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&
ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(IAS5^p/TboA
Dd?`[$4R=s/g+Oa?Xkp+A3"T`F`D4OE&)ZOF)3aS3HAh[A7o75?m&E[F*&O8Bl[cpF<G+*Anc-s
FD5Z2-Z^DED/`onF<GL>+A,Et/g+,,AKYl%G9CF1Eb/a&+Co%qBl7X,Bl@l3Amo1`Ch\!:+DG^9
8g%hcFE2;1F^o!(%144#+CQC1ATo8-BkMHpE+gA%H[B-C@"!H2+Co&"Bl.R+ARlp#ARTIt+E(j7
A7]@eDJ=!$+DG_0Bl7K)DJsZ8F"AGWATD7$/0JA3G%G]'F!+n/A0>B#DJF<3@ruF'DK@E>$6UH6
9jqgK+EM[GAKXT@6m,uJDBNV$DIdQp+CT)&+EV:.F(HJ3ATo8/DfT]9/e&-s$8O4V?p%dMBk:k$
CjKYNA9KdgG%kf5H8oq`CGfU9?Tqj?;e^)_Cgh@#Gp$s4CLnW0F`M%9?tsUjCh\!&Eaa'$?m'Z3
Ebf_=AoD]4A8-'q@ruF'DBNJ$Anc-sFD5Z2F"AGTAS!nF+Br5Q:IIucC2[X!Blmp,@<?'5D.I$[
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6
<)5nX?YXLiCh\!&Eaa'$/o>,J/e&-s$8X:W?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?
8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc
+EMgLFCf<1/g*hr@WMtc+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$8a@X
?p%e+AS!`F0JmTfB/agI3,LWbBQ,maF_Z(W?Tqj?6Z6j`Bk1dq+CSekBl7Q+?t!Mf?m$k+Cht5'
@:O(qE$0=8EcYr5DK@6LFDi:08l%isDf9H5?nNR$BPDN1G%G]'+DGm>E,ol?Bl7Q+F)N17@;]V$
+DGp?F(fK7Ch+YtAKYr#Ec`FBAfu2/AKZ&9@;]UaEb$;6ATW'6/e&-s$8jFY?p%dSCM%="@W6L"
2JHrJH=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bBD]iG&De(J>
A7f3lA7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO?s@2[A1_nAA8ba]%16QeBl%<p
De*ZmFCf\P0ht%f.UmO7Ch.:!A8G[rAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr
+A,Et+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.
@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/F<Ga<
EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL+Cf(r
@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,
Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
1,*QRGq^urEb0E.F(Jl).!g2cC2[X"@;0UdFCf\G%15is/g)o'D..]E1*@ukH?s=EA8PahDD#C,
F=A>@A7T7^%15is/g)o'D..]E1E\)"@r,^bDKKH7/7N%0.3N&0A7]9\$;No?+>PWf@<jRe+Co2-
E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/$;No?+>PWgDg!ln+CSekARlo3C2[WiDg#i+
G@,H'GUX(/%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-+<W%HDe*ZuFCfK$FCcg/$=e!aCghC+
+EVI>Ci<fj5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eODe*ZmFCf\W3B8H0>9IEoATD4#AKX)_5s[eO
De*ZmFCf\W3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;
67sBmATVEq+<Y-9Bl%<&F`_>6Blmp-+CT.u+A,Et+DG_8ATDBk@q?d!BleB;%172oE,9H&+D58-
+?MV3Eb/Zi+Eqj?FCcS(AS,k$ATMs6+Cf(nDJ*O%FE/Kr:IJ5X6m,'I8l%ihDKKH1Amo1\;cH%X
6pX^=+A$lO:IK;CDesJn<'a8I5uL)n8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=-OgCl$;No?+CfP7
Eb0-1+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$A8bs@3Zpgd6XO22Ddjhn+CoD"
4ZX^43dWJI:dJ&O?XH`2?XHE$6uQOL%14ITDeO#26nTTK@;BFp-QmJAFD>`)Ch\!&Eaa'$+CoD#
%13OOEc5l<FCf\[3ZoerH?s=EA8PahDC5l#%15is/g)NfH?pq]D..3kF!,R<BlbD/Bl\9:+E)-?
Eb0E*EcYe7A8-'q@ruX0Gp$^5Ch4`,@;TQuF)Q)@Et&I(Eap56AU#Rc3Zq-_6W-]e@;9^k?Q`um
F<GUBDfg)4GUt4LFCf\E%172gGWe)14*s">FCf\+$?Tj(4ZX]6-SH]nINs#IEcYr5DBjUZ,;1Dq
4"u"R:IJ5X6n'6gBOPdkATMs6+EV1>%14M*Db;-oAU#XHGB.D>AKYN%@k;Y=Dfg)4GUt3pFCf\E
%13OO:-pQUAn?'oBHV5:ATDs.ATo85@<?(*+CT.u+Cf5!@<*K)DKKH1Amo1\+EV1>F:AR)Eap51
G'%;?-TsL59gM-E:L@OFDe*2tB4Z0--YdR1?Z1+%ATqL'AU#R3$>F*\@qBajB0A9u-Tin0HtmS1
BkCd`AUH']4spdHDg$56GWe)1-u!:%@qBajB-:YpAoD^$F*)FF4*s">Dg$56GUY1XAmo1\FCAek
$4R>;67sBhE,]B+A0>B)EcP`/F<G:8FCfK)@:NjkF(Jj'Bl@ku$>O0]@q@ea+>5d)+FYq7H:gt$
Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%isDf9H5;cH%X6pX^=/4k.[:IK>IBl8$(Eb8`iAQ)Po:..BG
6k'KAG'%;?4ZX^(G'%;?/1<7u9L^H^-t[C<D/!Tj@qBanGT^a5@:Njt/2AGD7L]\QFDjboDg$56
GUXbZEbTW,+CoD#/15aiC2[X$G%kN3/p(ZL-OgCl$;No?+A,Et+Cf4rF)to6%16i[Ccsg%4$"a(
De*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!hD(Cijnb3Zr'U
Dfp#8@<?(*-8%J)C1D&h$4R>;67sC%ATT&/DKKH1Amo1\+D?%>ATDg&Afu2(EbAs*Et&ImFEfr0
+DPLs@q@!.ATVWu@:Nkj@<-"%-8%J)Cijn2$4R>;67sC'F(HIAH?pq]E,oN%Bm:bBD]iJ3DeW`)
@r,RpBOu6-GA2/4+=CoBA1&KP/h^aR@s)X"DKI"5Bl%@%%172gG\1Z+ATL!q+=K?_Ddt4=/1)u5
+=K?"H?pqf+=nil4s4TMC`k8U/j:C?-SBLPGUFUC$>ag/+Eqj?FCcdO4s4rYG\1Z+ATJ:f%15is
/g+eIDfp"A@WcC$A0>>iFCSu,F(96)E-*3S+DbJ.AU#>?FD5Q4+EV:*F<G(3D/a3*AKYVsDImis
FCeu*Anc'mEt&IkCgqO$Ch.X!GWdZ%-mpZs,CX9GDfp#J,CV9n/95ZIFED)=.3N,6@;]^hF*)FF
8k_QO8PDNO79C!+.!0Au:K(48C2@@%Bl%=%AU#XHGB.D>AKY`(@WcC$A7Ath4Y@jfDdt>=Df9`>
AU#aR/n/72-OgE(D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$3
67sBW6q/;/Df'H-Ch4_u@<;qc%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9
GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]>DK^+L4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc
-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>AKYN%@k8u]0Onp1@;^0uGV3H6F=.M)%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZmFCf\W3B:GUF_PZ&C2[X!Blmp,@<?'s@<?(*
1,2Nj/h1=QBl%<pDe*ZuFCfK$FCf8sFCf\>F"Jsd+D58'ATD4$ATJu8H#@_4GT^[6B4u*qB4uBu
A0>W*A8Gt%ATD4$AKZ&4F`Lu'+A?3CAQUPo$;No?%15is/g*VtCh7Z1@<,p%GB.D>FCf>4FDi:D
BOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#D.RU,+Co2,ARfh#Ed98H$;No?%15is/g+SDF*2>2F#kFR
F`MM6DKI"EATDj+Df0V=De:,2@;]Uo@j!1=@;]Uo@j!NZ3A*$=0d(CT+DbJ.ATB4/$;No?+<VdL
+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO:..lF.1HVZ67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#
:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JY>!@<jR]%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PWf@<jR_+EM47G9CgACj@-OC2[X!Blmp,
@<?'5@UX@-%15is/g)o'D..]E3$;aGF)Yr(Gp$R=Bl%<&@UX@$AoD^,@<?U&A0>u4+EDUB%13OO
@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0@p_Mf
6#(=KCghEsGW@cE?Q_Km+=BH@6#(=KCghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEsGW@cE
-OgDmDeX*1ATDl8+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$;No?+CfP7Eb0-1
+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$A8bs@3Zpgd6XO22Ddjhn+CoD"4ZX^4
3dWJI:dJ&O?XH`2?XHE$6uQOL%14ITDeO#26nTTK@;BFp-QmJAFD>`)Ch\!&Eaa'$+CoD#%13OO
B6%s/@;TR=3ZoebDe*ZuFCfK$FCcg/$4R>;67sBnASu("@<?''B6%p5E$/t*FCf\+$>OBiASsXl
+D5_6Ch[u6B6%s/@;TQb$7Bk(0Hb+HEc5l<+DP_7Bln0&+DP_2G%kN3+DP_&De*E%C2@@%Bl%<h
@<<k[3Zr0RB4Yri$4R>;67sBo@;]V$+C\c$@q[!+@rc:&F<G[=@<<W4ASl@/ATJu9AU#kE@<?(*
+EV13E$/b,Ch7Ys$7Bk(0d(@WF=044+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+$7L"7
85E/`+?Op2/8fWQ.3NhTBlmo/A8bs/-SR5aCh7$mFCf\L@UX@+%13OO:-pQUDIIBnCh7[/+Eh=:
@LWYm1E\_$0I\,b@k]#T/g,1E0b"J(AhG2\/NS/"A8a(0$6UI4D/XQ=E-67F-Z`s4Cht4A-RUGn
A7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$367sBW6q/;/Df'H-Ch4_u@<;qcAScF!/e&.1+EMC<
F`_SFF<Dr";Gp:g3Zr'HDImisFD5W*+A?3CAQU',4s247B6%s/@;TQb$>"*c/g)8G$7QDk%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZmFCf\W3B:G[BleB7Ed;D<A26(Q
$4R>TASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`-$6pc?+>GK&/i#1)/KcHcBlGL1$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0
A7]9o/Kf+GAKYAqDe(J>A7f3Y$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D
8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo
@kUMa<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)
+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u6
05>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=
Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/
DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-
FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90
ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!
%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUp
DfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+
0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#
@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9
De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#S
Eb/a&DfTQ'F"Rn/%144-+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.
A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2
.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po
+A,Et+CSekDf0VK+:SYe$6Uf@+CJVgA8H0mA927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%
A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s%144#+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1
%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn
$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(
C^g^o+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG
+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6
+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP*$4R=b.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N
0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OV`n%144-+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.
FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&-s$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M
%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88
DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1
Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht
+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nB
A0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`
+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10
%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ8
9OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]Rr
CND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8
DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn
$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+G
AKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4
;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;
1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8
Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(tFDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K
+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>
F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-
E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(
EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`
+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.
@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LGBl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7
>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/
Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7
<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4tATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(n
DJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)
AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1
Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$
C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL
+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^CFE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7
CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>
+FZXN:Id';AQWPb=)`D$CbBF:Et&H_#n74a+<XWsBlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//
+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+##mkQeDfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXO
Ci=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FB
BlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4
@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL
:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^X
BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"Rb*%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.
DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EIEbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$
.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%13CJ%144-+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[
3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.jF'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4
BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(
+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4
BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&p
DIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E
4ZX]r@<;qc#mh%J+<Ve+BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et
+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UH
Bl7Q+FD,B0+E1b2FCfK1/g(H,%144#+<VdL+<VdL%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,
+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUB
DJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq
@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6sBkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU
%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"
F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(
Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL
779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.
E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk
+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_
/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5
/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9
$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=)
,9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#
AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-
FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(
Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1
%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s
@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI
3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8
E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1
ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i
/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)
Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#
$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=
@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)
Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4
EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8
BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn
+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg
+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+
FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+
DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1
A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe
$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL
+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL
+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(t
F:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_
/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]Tu
ARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/
0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,
F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@
-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$i
DI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g
+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(
FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%
F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)
/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7
ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIa
FE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6
@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1G
G&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL
:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,
F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo
/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!
Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF
+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)
+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;
7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0
@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU
?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5
G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,
@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc
+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3
Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7
ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9
-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U
+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O
%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq
+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dn
ATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'
@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08
+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OC
EZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D
@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]
+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(
Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%
BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2
<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$
4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*M
BlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEe
Dg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUj
E,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&
+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G
+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8
E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-
+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*
D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&
A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*
2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q
:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7
Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-
+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b
.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?
1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(
GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,
B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457p
FCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A
?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1
F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8
AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dC
CLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?
%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTr
FDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL
+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>
BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<
3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLs
DfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdk
ARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]Ua
Eb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#
+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+l
E,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2
/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIj
CNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+
C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?
+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%
Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>
A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:
@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?
Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL
8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.
AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)
F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"
ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'n
CggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5
B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@lt
EbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY
?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL
+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59
H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(n
DJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-
FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2
/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:
DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*
+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(
F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>
Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c
.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k
@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0
ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5
@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+
Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K
+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&
A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlot
DBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKh
Ddm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(
+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8
A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSek
ARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'
DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."
Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#
D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](
@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<
3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuq
A0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(
+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cq
D.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0
BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM
8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=
Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)
ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-
:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr
?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@
?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm
+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)9
5t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4
$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,
%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6
F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@
ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)
A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSek
ARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0
B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi+
+>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:
F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VL
B4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlol
DIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%g
ATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.
F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s
$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8s
DJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0
AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+
Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#
+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[
+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNE
BOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6
B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@
?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*
+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(
Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>
ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-
F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-
BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.
+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6t
DJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*
+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:
Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=f
ARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+
@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'
DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;
AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk
+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k
+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4
+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'
DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8
F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2
+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlom
Gp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"
A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeF
AnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]
@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#
AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0
AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3
/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUj
BOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4
D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.
EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,
+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6
A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t
@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@lt
C`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4
DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(
@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\A
Bl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%
0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u
+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ft
FDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@
+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1
Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+
AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'
+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs
?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9
$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2
DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje
/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7
FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*Nm
CiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,
05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po
/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdk
ATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9Vi
ASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[
A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9o
DIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+
%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h
%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&
$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#
+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*+
+EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.
G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2
BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&
De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,
/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#
.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI
1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dL
D]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et
+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij
+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=
A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&
,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@
?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-
+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9
?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,
ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9
@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<Cggcq
ARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb
,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'
Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<
C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8
Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0
+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08
/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPE
BPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL
>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+
D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL
+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6
FDYh'$>OKi?Z1+%ATqL'AU#sc,p6Z;Bk:m!Dg#]4G%kN3+E(j7FD,5.8l%htF*VhKASj%B%14C(
GA(],AKYE&F)PQ&@<?'k+EqOABHVD1AKXT@6m-,_Dfp"AFD,B0+E)F7Ecu/.G9@>%,p6W8E,96"
F!,RC+EV:.+D#G4Bl[c-8l%htF*VhKASiQ2AS!!+BOr<'@:O=r+=L]ABl%<pDe*ZmFCf\G%13OO
>]XIdFD5Z2HV.(%+A[/lEcu/.GC9o-%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+C&T#
AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA:8es+CSek
Df0tU%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8WBl89/DKTf-Eaa'$I16Ng
Blmp'%144_BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7
E+*Bj07A1HBOr;Y:IH=%@:s/"/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I16N+>]+J#D..7%BmO>"$=%:eAShk`
+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdtG0Ci<c9D..L-ATBG=De(J>
A7g7:<+ohc8l%htD..=)@;I&kFCf]=FEDkEDe(J>A7g7</e&.1>]XCqBlJ08BmO>"$6WSrEbp)9
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdtG0Ci<c9D..L-ATBG=De(J>A7g6!$6WSk
DfT]'Cia<:AISuOASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL4uO6m,KNATAnbDKKH1Amo1\
+BNK%A93/.$4R>@Df'&.De:,6BOr<#DKKH1Amo1\+EqaEA9/l0BleB-A0>PsEb-A%Eb-A2Dfd+4
De!p,ASuU$A0>T(+EV:.+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdtG0
Ci<c9D..L-ATBG=De(J>A7g7:8l%htD..=)@;L?E+:SZKAU,gLF)Z/6DJO'&DJ()5Dfp)1AKYK$
A7Zm-Bln#2?sn+pA8bt#D.RU,ARloqART\'Eb0;>-Qli8A0>8f7:C7ZATAn^B4l95-Qm#>EZee4
FCf?3Bm+&1Eb/ZiATDi$$>FQ(@3BB)DJ+$4@;]UiDJ()5De=*8@<,p%A7]pqCi=90ASuT4>\.bk
BR=<.FD55rD.RU,I4bs9%14C(AoDL%Dg,o5B-:]&A7ZlrASu("@<?'k+C]UW+D,P4D/!Tj@qBan
GT\Y#INX(l8U=!)6tpO\ATDBk@qAS<5u'g6;FE'-H:gt$FDl)6F&Q%(:..BG6nCoU8l%itFD5W7
ATDBk@qAS<5u'g6;FCs$,p5<#.su)MA8,Xa@qC$>/NsUN%16?LAS5^pHW+TdA7];"%16?LAS5^p
HUqj`BP_BqBQRs+B73ui%16?RH#R>8Ch[d&HXUB,I=#3oDfT]'CfG=gHXUB,+<VdL+<Z)\>?l,U
B4Z*pAp\6(@le%-G(!X=>XNFHD.RU,<,ZQ!@;Ka&@UWb^F`8IHATDj+Df-\8@;TRsI16NgBR+Q.
EboH-CO9K#A7oq%I=#3oDfT]'CfG=gHXUGqB6%r6+<Z)\>?l,UB4Z*pAp\6(@le%/A7oq%I9dt#
6Z6gYASuThDej].A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=AUP!p>\JD%ATDU$DJOT-Ci!ut
D.Rd:HX'<aEc#6$<,ZQ!@;Kat@;TRs+FSZB>]=+aATD?oHYI)%3ali@DIIBnF+%=:>XNFHD.RU,
<,ZQ!@;Ka&DIIBnF!,(8Df$V>F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$
DJOT-Ci"-'AoiBI>Y]3XD..6[Dej].Ci"-'Aof(;I=5=)E+*BjEb/j0BkCj9@;Kb#AS-"3>p*B>
Df'?&DKJirCO9K+C`mV6DJX6$@;KKtDIIBn+ED%*ATD@"@qB^B+CT)&Eb/j(+?MV3Eb0?8Ec*":
Gp%-=An?!oDI[7!-[cF2>\JD%ATDU$DJOT.B4Z15HX'<aEc#6$<,ZQ!@V97o+<VdL+FSZB>]=+a
ATD?oHYI)%3au`5FF@F;>XNFHD.RU,<,ZQ!Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V9F`\a:Bk)7!
Df0!(Gp$R)@r$4+F+"K)>\JD%ATDU$DJOT.DJX`J>Y]3XD..6[Dej]/DJUF<+<VdLI=5=)E+*Bj
Eb/j0BkCj9@W$"1>p*B>Df'?&DKJirCO9l3F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&
@:EYdAKYGj@r$4++D,>(ATN8/$=%7iE+O'+Bl7^5@rH4'C41G6:2b/i@;Jn]CO9Q0D/a54+<VeT
I9Trq@:s.lAS-:'An*l3Df'H.I9dt#6Z6gYASuThDej]0Df'H6ATMp(F!,@=DJjB8DK?q0Gp%-=
D/XT3DJ()9BPDR"+EML1@q?ckDIal2BQ%p5ASu4"B-;#/@ps0rBk1dmFD5?$ATDj?%16?RH#R>8
Ch[d&HXp]9HX'<aEc#6$<,ZQ!A7Zl++<VdL+FSZB>]=+aATD?oHYI)%3b2fM>p*B>Df'?&DKJir
CO9T+F)Yr(Gp#^T6m-M]F*2;@+EqOABQ&$8+ED%8F`M@B@rGmhI16NgBR+Q.EboH-CO9T'CjgY8
:2b/i@;Jn]CO9T'C`jiC+<VeTI9Trq@:s.lAS-:'An*l4AScd#+C%9PD/Ej%FB!0oHXp](ATVL)
+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF+"K)>\JD%ATDU$DJOT0ASc""E.*(<
:2b/i@;Jn]CO9T'ChId-+<VeTI9Trq@:s.lAS-:'An*l4ASc""E.)"7>XNFHD.RU,<,ZQ!Eb0*+
G%De?DfTB006CcHFE8R:Ec5e;B6%p5E-![RF_Pr/F+"K)>\JD%ATDU$DJOT0Bk2X=>Y]3XD..6[
Dej]1Bk/>/+<VdLI=5=)E+*BjEb/j0BkCj9A8,S&>p*B>Df'?&DKJirCO9T+@ruF'DIIR2+DG@t
DKKT)Bk(RnBl@l3@;]TuF*(i4BleB1@rm&-$=%7iE+O'+Bl7^5A8-+(I=#3oDfT]'CfG=gHXpi3
E$-8G+<Z)\>?l,UB4Z*pAp\6(@le.7F)ZP5+C%9PD/Ej%FB!0oHXpi3E,8s.+Co1rFD5Z2@<-W9
DdmHm@ruc7@<3Q5AU&<F%16?RH#R>8Ch[d&HXq#1I=#3oDfT]'CfG=gHXq#1+<VdL+<Z)\>?l,U
B4Z*pAp\6(@le.<CjfS3>XNFHD.RU,<,ZQ!Ch[s4+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe
@<6!&Anc'mF+"K)>\JD%ATDU$DJOT0De"3B>Y]3XD..6[Dej]1Ddsn4+<VdLI=5=)E+*BjEb/j0
BkCj9A8bt+>p*B>Df'?&DKJirCO9Z3Ec#6,F!,"3@s)X"DKI"CAU&;>F`V87B-;;0AKYK$DK]T/
FD5Z2F!,C5+EV:.+=Lc=@q0U0+Eh=:@XS[m>\JD%ATDU$DJOT0E-#T4I=#3oDfT]'CfG=gHXq):
ATT%;+<Z)\>?l,UB4Z*pAp\6(@le.>F(KHA>p*B>Df'?&DKJirCO:,6F<G+.@ruF'DIIR2+E1b0
@;TRtATDj?%16?RH#R>8Ch[d&HY$`9HX'<aEc#6$<,ZQ!ARlo++<VdL+FSZB>]=+aATD?oHYI)%
3b;iM>p*B>Df'?&DKJirCO9W'BlkJ.Bk)7!Df0!(Gp%$7C1UmsF+"K)>\JD%ATDU$DJOT1FFAL@
:2b/i@;Jn]CO9W7+<VdL+<VeTI9Trq@:s.lAS-:'An*l5FF@F;>XNFHD.RU,<,ZQ!ARoLs+EV1>
FF=T*>\JD%ATDU$DJOT2F(K6;HX'<aEc#6$<,ZQ!AohO$+<VdL+FSZB>]=+aATD?oHYI)%3bEGE
DLGe5>XNFHD.RU,<,ZQ!Anc:,F<G+4@s)X"DKI"BASuU$DI[7+%16?RH#R>8Ch[d&HY6l#E-$GS
>Y]3XD..6[Dej]4A7]_$+<VdLI=5=)E+*BjEb/j0BkCj9B4PRmF+%=:>XNFHD.RU,<,ZQ!B6%p5
E$/S,A0>r9Blmo/A7]^kDId<rFE;j>$=%7iE+O'+Bl7^5B4Z15HX'<aEc#6$<,ZQ!B4Z0-+<VdL
+FSZB>]=+aATD?oHYI)%3bN#GI9dt#6Z6gYASuThDej]?ATVs,AThX++E(_(ARfh'+D,Y4D'3A'
@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&HY6o3Ed3"Z>Y]3XD..6[Dej]4ATVs;
+<VdLI=5=)E+*BjEb/j0BkCj9B4Z1*G^Wj?>XNFHD.RU,<,ZQ!B4Z0-Eb065Bl[cq+EVNEAU%cr
F`_2C%16?RH#R>8Ch[d&HY7/5@WQsE>Y]3XD..6[Dej]4Ci<d(+<VdLI=5=)E+*BjEb/j0BkCj9
B5DKqF+%=:>XNFHD.RU,<,ZQ!@;]LiH$X$Q+ED%4DfTqB@;]TuF*)>@AKYW%Ddm-k+DtV)ATN8/
$=%7iE+O'+Bl7^5B6%s>HX'<aEc#6$<,ZQ!B6%r6+<VdL+FSZB>]=+aATD?oHYI)%3bNJPI9dt#
6Z6gYASuThDej]0Eb/[$AKYE!A0>`-A8,Y$+D5_5F`;DM%16?RH#R>8Ch[d&HY7GKHX'<aEc#6$
<,ZQ!B657=+<VdL+FSZB>]=+aATD?oHYI)%3bNP_>p*B>Df'?&DKJirCO9]*F<F0uF(96)E-*4E
AU&;>Ao_g,+A*buASlB/A8-'q@ruX0H$p,/>\JD%ATDU$DJOT4CiF9.I=#3oDfT]'CfG=gHY@57
DJUF<+<Z)\>?l,UB4Z*pAp\6(@le:>E,KK?>p*B>Df'?&DKJirCO9T+F)Yr(H#k*LBQ%p5+Co&)
@rc:&FD5Z2F!,C5+E(_(ARfh'+E)-?.![7i%16?RH#R>8Ch[d&HYRJ0@:s/"HX'<aEc#6$<,ZQ!
C2[WkB4W2.+FSZB>]=+aATD?oHYI)%3biSD@:s/">p*B>Df'?&DKJirCO9T#H#k*LBl7El+DbJ-
F<G(,@;]^h+CT.u+CfG'@<?4%DBNk0+A,Et+E(_(ARfh'I16NgBR+Q.EboH-CO9f7A8#OjE.*(<
:2b/i@;Jn]CO9f7A8#OjE$-9OI9Trq@:s.lAS-:'An*l:De*NmCiFf.+C%9PD/Ej%FB!0oHXpi3
E,8s.+A,Et+D>>&E.&0&>\JD%ATDU$DJOT8B75,3:2b/i@;Jn]CO9l1+<VdL+<VeTI9Trq@:s.l
AS-:'An*l<B74&.>XNFHD.RU,<,ZQ!D..3k+CT.u+Dbt)A0=K?6m-,_Dfp#I%16?RH#R>8Ch[d&
HYdV1B6%s>HX'<aEc#6$<,ZQ!Ci<frEc<-D+FSZB>]=+aATD?oHYI)%3c&_EB6%s>>p*B>Df'?&
DKJirCO9l3F*&O;Ec6)>F!+n/A0>r9Blmp-+EqOABHV2$D.S,)$=%7iE+O'+Bl7^5D..3kI=#3o
DfT]'CfG=gHYm2,AKW*<+<Z)\>?l,UB4Z*pAp\6(@leI8CLqp"+C%9PD/Ej%FB!0oHYm2,ATJtd
+EM%5BlJ08I16NgBR+Q.EboH-CO9o7F+&C?:2b/i@;Jn]CO9o7F!)SJ+<VeTI9Trq@:s.lAS-:'
An*l=Cib#1+C%9PD/Ej%FB!0oHYm2,AKYf-@:UL%@rc:&FF=T*>\JD%ATDU$DJOT9DJX`J>Y]3X
D..6[Dej]:DJUF<+<VdLI=5=)E+*BjEb/j0BkCj9D/O0<>p*B>Df'?&DKJirCO9l3F*&OC@VTIa
FE8R=DBNA(C`mb0B5)F/ATD?m+Co1rFD5Z2@<-'nF+"K)>\JD%ATDU$DJOT:ATq[5HX'<aEc#6$
<,ZQ!DIn$&+<VdL+FSZB>]=+aATD?oHYI)%3c8MQA:7`+>XNFHD.RU,<,ZQ!@rc-hFCfM9@3BH!
G9CF1@ruF'DIIR2I16NgBR+Q.EboH-CO9r;AU&0BHX'<aEc#6$<,ZQ!DJs*2E$-8G+FSZB>]=+a
ATD?oHYI)%3c8kIG]8(:+C%9PD/Ej%FB!0oHZE\>F`MA@+CQC/BleA=De:,1@VTIaFE8RKBln#2
DJpY/G]7J-DIIX$Df0WE%16?RH#R>8Ch[d&HZ!bDB6%s>HX'<aEc#6$<,ZQ!DJsW0Ec<-D+FSZB
>]=+aATD?oHYI)%3c8kXB6%s>>p*B>Df'?&DKJirCO:8DEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATN8/$=%7iE+O'+Bl7^5DKL;R>Y]3XD..6[Dej];
F<D\K+<VdLI=5=)E+*BjEb/j0BkCj9DKL;4+C%9PD/Ej%FB!0oHY$`%F<G!7DIn#7FCfN8+EM%5
BlJ/:F`V87B-9fB6m,uXDK]T/FD5Z2F+"K)>\JD%ATDU$DJOT:GC=gC:2b/i@;Jn]CO9rC+<VdL
+<VeTI9Trq@:s.lAS-:'An*l>GC<a>>XNFHD.RU,<,ZQ!ARoLs+CQC1ATo8.G]7J5@qg$-GAhM4
+E_a>DJ((a:IH=8Df0`0DKKT2DKC48$=%7iE+O'+Bl7^5DdmTmD.Rd:HX'<aEc#6$<,ZQ!DdmTm
D.Rc2+FSZB>]=+aATD?oHYI)%3cAJF@;TRsI9dt#6Z6gYASuThDej]<@VTIaF>%HK@ps1b+DtV)
ATJu+Ec5e;F`V,83ZoPRCi!utD.Rc21GL"pF(KD8-Z3@0ALDm8$=%7iE+O'+Bl7^5De+9C>Y]3X
D..6[Dej]<A0<!;+<VdLI=5=)E+*BjEb/j0BkCj9De+9%+C%9PD/Ej%FB!0oHZ*k7DK?q/DIal"
Ci=B+F!,"-@ruF'DIIR"ATN8/$=%7iE+O'+Bl7^5E+*6lA:8f0:2b/i@;Jn]CO:#/@r#Tt+<VeT
I9Trq@:s.lAS-:'An*l@@:O(`I9dt#6Z6gYASuThDej]/@:O(o+E_WG@;]TuEb/a!G%G]8+Eq78
FCeu*F)YPtAKY])+Co1rFD5Z2@<-W9Anc'mF+"K)>\JD%ATDU$DJOT<Ed`:>:2b/i@;Jn]CO:#@
+<VdL+<VeTI9Trq@:s.lAS-:'An*l@Ed_49>XNFHD.RU,<,ZQ!E-67F@;]Tu@rcL/F!,L7An?!o
DI[6#GAhM4I16NgBR+Q.EboH-CO:#CFFAL@:2b/i@;Jn]CO:#CF<D\K+<VeTI9Trq@:s.lAS-:'
An*l@F``%;+C%9PD/Ej%FB!0oHZO:IEb0;7DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+
Bl%@%I16NgBR+Q.EboH-CO:)5Ao;$oATN9H>Y]3XD..6[Dej]?AS,ggD.Rc2I=5=)E+*BjEb/j0
BkCj9Eb/j#@;TRsI9dt#6Z6gYASuThDej]?AS,LoASu!hA0>c.DJX6$@;KKtDIIBnF!,(8Df$V>
F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT>AS5P%HX'<aEc#6$<,ZQ!
Eb/lo+<VdL+FSZB>]=+aATD?oHYI)%3c\eEA:7`+>XNFHD.RU,<,ZQ!Eb/ltF*(u6+CT.u+E_RB
AS5^uFCfJ88l%htA8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO:)5F*(r@HX'<aEc#6$<,ZQ!Eb0<6
A0<!;+FSZB>]=+aATD?oHYI)%3c\eQFC]f*+C%9PD/Ej%FB!0oHZE\=FDl22F!,R<AKYi.F*&OF
ARf:hF<G%$@r$4++CfG'@<?'k+C]U=-u`U)CLelB%16?RH#R>8Ch[d&HZE\@Dgct;:2b/i@;Jn]
CO:)5G&JKG+<VeTI9Trq@:s.lAS-:'An*lBATi!?>p*B>Df'?&DKJirCO:)5@qBP"Cj@.DAThd/
ARlp%@VTIaFE;j>$=%7iE+O'+Bl7^5Eb0E4DIn'@HX'<aEc#6$<,ZQ!Eb0E4DIn&8+FSZB>]=+a
ATD?oHYI)%3c\eTDf0-2I9dt#6Z6gYASuThDej]?ATW'8DK?q/+Dbb5F<GL6+E2IF+Co1rFD5Z2
@<-W9DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1I16NgBR+Q.EboH-CO:)=I=#3oDfT]'CfG=g
HZEsG+<VdL+<Z)\>?l,UB4Z*pAp\6(@leXII9dt#6Z6gYASuThDej]?F`)7C8g%tZ@rcK1F(96)
E--/L%16?RH#R>8Ch[d&HZF4MI=#3oDfT]'CfG=gHZF4M+<VdL+<Z)\>?l,UB4Z*pAp\6(@leXP
FF@F;>XNFHD.RU,<,ZQ!Ecl8@+A*buATMr9F(96)E--/L%16?RH#R>8Ch[d&HZF@PI=#3oDfT]'
CfG=gHZF@P+<VdL+<Z)\>?l,UB4Z*pAp\6(@leXTF+%=:>XNFHD.RU,<,ZQ!Eb/m+Cgh?,AU&07
ATMp,Df-\=ARTUhBRL<s>\JD%ATDU$DJOT?G@c#IHX'<aEc#6$<,ZQ!F*D2?+<VdL+FSZB>]=+a
ATD?oHYI)%3cfLVG^Wj?>XNFHD.RU,<,ZQ!AU&<;@:OC%F(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3
Ao_g,+EqaEA0>Ps@:Wqi+Cf>,D.RU,+CT.u+ELt7AUP!p>\JD%ATDU$DJOTAF(JlkH$t$E:2b/i
@;Jn]CO:2FARo7q+<VeTI9Trq@:s.lAS-:'An*lEF(JlkH$rs@>XNFHD.RU,<,ZQ!Eb0?8Ec,q@
@3BB#F*&OCAfu;9Eb'56Ao_g,+=MLa+EV:*F<EtC;FNrP9N`KJ@;Ka&GAhM4F!,C=+=MI`I16Ng
BR+Q.EboH-CO:2FATN9H>Y]3XD..6[Dej]BF(KD8+<VdLI=5=)E+*BjEb/j0BkCj9F`V,8I9dt#
6Z6gYASuThDej]?ATW'8DK?qEDfTA2Eb/ioEb0,uATN8/$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[
A:%6g@:Wq[I;3\2Ch\!&Eaa'$<HD_lCLqd41,Vfn/g,.U+E_a:Ebf63F!+t2DJ!Tq+D,P4+E2@>
C1Ums+=M2LC2.ZtCh\!&Eaa'$.4u&::-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'
/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*
FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsA
E"*.L67r]S:-pQU7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID
@;TRs05YE@ATN',AT24$06LuQA1hS2F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z
-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._
67sB)6Zd?b.n2E@%15is/g)?*FE21J;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#
$;No?+<j0pEbm6q2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$;No?%15is
/g*nb<(/hj@rH7.DesQ<ARlo34==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<+CTG3Bk29-F`V+:
De:+>4!u.\BOPpi@ru:&%13OO7P[%[4&TX,@;BEs6ZmEiASuTOCi<`m+=CoBA8Gt%ATD4$ALAU)
+>G!ZFEAWQ@WcC$A86$nCh\!&Eaa'$-QlV9@r,^bEZc_W%15IEEbm6q1-73P;e:%n6ZmEiASuTO
EcW?NE,o].De*ZuFCfK$FCcgB>9Iip-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-QlV91E^UH
+=ANG$:AoUCb&FtBkDH;7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:F=.M)7Pd+\4&TX0F_Pl-+A,Et
4*"nPF_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#AKXT@6ouf3De*d(+=nXMDe*cu
AgniW%16$IBkDH;7Pd+\4%`::+@p'[E'%fQA8#OjE$-hD$:Zj60KV[6@Wc<+;KZk=A7BS%DBL;S
%15Q_4#&frATMr9;f-GgANOpSF<DrGDe*ZuFCfK$FCeBfDeio<0II;:;eTlWF=Tg=4#&frATMr9
6=FqL@ln=DE,961+=CoBA8Gt%ATD4$AQ3\gF^f/u9jqgKEcWTN>9IuuFD>`)Ch\!&Eaa'$+=AOO
De*g-C/o=dEbf63F##UJ67sC#F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A19,?
$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`C3+<*FE_/6AM.J2D(fXJBkqE97s/NVATKLlDf00$
B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*XFDs8o05>QHAor6*Eb-k5Df%.?Bln0*F*''TFD58s
/n\m?04Ja9@P;S,F*(u605P?304J@2AM81IATDQtH#kTJE,Z6n:-pQB$;No?+@UN`D/a<&F#ja;
:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.IUQbtDf0VLB45XgF"_BEDImm5AS#glE\DQLG@W=?
C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT@WHC2F(J]n?RKN/FDs8o06_Va/o#HGAor6*Eb-k5
Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7-OgDX67r]S:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b
.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;:-pQU,"=L8%15is/g)?*FE21J7Q2M#$;No?+<j0p
Ebm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA%15is/e&._67sBU:K0bD+Cf>-G&M2>FCeu*-p/kl
De*BiFse^i-p/klDe(4E/3G;&FD5Q4-Qli@DeWa'+E_a:+E(j7-T`[u@q]:k@:OCjEX`?b$:Zd4
0fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<>9Is'+=CW@Bl%<pDe*BmF*)G:@Wcd,
Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=DO+=K?"C2[WnATfFM/1<V.C2[W1
.4dS/F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?
$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]
:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`a
AR]dp+B!?"4(Mf@F`&<L-OgDP2ENWT<+U,m+B*,qCLoSJFEAWQ@:FCYD/X3$0JFj`$<(VPAooOm
2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16
EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/i#1)
/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB
+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%
@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*
C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*
Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[Wn
DdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[
%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5
D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm
@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%
%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bq
Ec5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!
Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(
DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:
+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)
+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZl
DKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*
DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq
,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImis
C`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT
@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y
:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5r
EbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
+<V+#.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg
:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen5-OgDP:J=/F;E[&gB4Ysl
Ea`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j
@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0Nf
A8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0Nf
A8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^
F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[
A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-X
F_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO
8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#
F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q
@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;i
D/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>
F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`
F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@
EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:
DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U
:JO&6-S[5-/i#1)/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29
-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+
@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOT
Bkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS
:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?
D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%
@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3
F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LG
D/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'
+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.
@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i6
8g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%ht
F)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.
+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>
Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<
+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq
+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBk
ASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*
Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*
$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$
@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%17&pC2.Zt1,2Nj/h1g\C2.Zt+EK+d+DPh*+E2@>
C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD
+B)ijFCf;uATAnK0JGEp$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3o[F>5]s@:Wn[A0?21Bl%@%
%15is/g)i-De!lD0d'n8A7]9o5uU-B8N8RMA9Da.Et&IO67sB73,`;K0f1"eDKBB0FCeu*5uU-B
8N8RMF(KH8Bl7Q+Bl8$2+DPh*A7]p,C2[W*F`_>6F!,F1Ea`frFCfK6%15is/g)l/A7]7)2B[$O
GB.D>FCf>4AoD]48g$,H0JO[Z$;No?+>PWgDg!lo+CSeqF`VY9A0>K&EZdss3A*!@+:SYe$=[O[
@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ci]De*BiFs(O<A0?#:Bl%i<
+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6DKI"FDfTW-DJ())Ec6)>+>"^X
G@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%J\+=CoBA1%fn%15is/g+YHEcP`/F<GdGEbfB,B-;8<
Blmo//Kf.ZART?s@<3Q/AS#C`A.8l\De*orBkhQs?TgFm-YdR1F)>i2ATVL)FE8f=$4R>;67sBs
Ddd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is/g)NUC2[W1+D58-+FPjbB6%r6-YII=@r,Rp
F*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7B+pF=.M):-pQU-Y[=6A1&L4ATT&C/g+eI
E$-N=ATqg%FCf3.@rc:&F=.M):-pQU-Y[=6A1&L4ATVs;+?MV3FE8R:B6#,/An*22%13OO:-pQU
E-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ft8l%htGAhM4F!,17+E(_(ARfg)Ci<flCh4%_6r-0M
9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/nDfp/@F`\aFEZc`VISP??-OgDoEaa$#+=DMb
:4@U=%14L2@4*U@De*KfBkhQs?R[+1ATT%BH[\_=I4#I2.1HUn$;No?+EM+9+A,Et+E_a:EZf./
H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)
-OgD2FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%BC2[X%Eb\TqATDQtH#k>^+Eqj?FCcS0E+*j%
+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R8l%htE,ol3ARfg)F(KH9E$l)%H?smP
De*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XHCghEsGT^U4Ch54A%14Bj$7-fe
:IH=HDfp)1AKY].+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4rF)to6/g+,,Bla^j,p6f6Ch4_t
F)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..NtEbSru%14C(Bl8$2+CQC6Bl7R"
AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+FD,B0+D,>(AKZ#)EHPu9ATJu5
A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='
+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"
@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YN0
CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%14C(+<YKC@;K@oAU#=?
H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%"^FD,T5HV/3i
DBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6IXWLa8l%j'+B*3$EarZ'6Z6LH
+C&.o>\7nmFDc#=ATMR3AKY6#Ebp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(
05Y-=FCfJGC2[WsC3+f.DJsQ4@;L"!H=_L6$4R=g+Cf>,D..<mF!,(5EZee$C3=T>Bl7Q+A8-+,
@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'Ecc#5B-:V*Ecl20%16?]ATVa"DJ+')HX('!
CisT4F(K<=HS]5MI16NgF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%16?^GAgu0CisT4
%13OO>[h8WBl89.De!p,ASuU<%13OO>]!nbATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%16?YDIm<r
CisT4%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d0Bk;K@FCf]F%13OO>]++sE+*Bj%16?SDK'`?
H[:!QDe*d(/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[W8FCf]F%13OO>]++sE+*Bj%16?S
DK'`?H[:!QDe*p2DfTDAFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*]nCLo,?AU&V4$4R>I
DIn$2@:s-\$=%:_E-68LH?s=EA9E!.CbBg@G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/FDl)6
F"VQGG^U#.%14CdDIn$2@:s-\$7/qqDIm<rCisT4%14CdBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9
G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgr
Df0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16M     ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&_s71a"Or0f:(/3$9t1+>Yer0eje/2]sh2+>bqu1,0n/1E\D++>Yer0f'q/1a"M5+>c#"0f1"/
3?U%2+>Pr"0f^@42]sh6+>Ykt2BX_5+>G\q1H%j$6pamF9LMEC;cHOj=`S(`ASuT48l%ht@WcC$
A0>Q"F*)>@Gp$pAB1brf<)6:`;aOJU9LMEC;cHOj=`S(`ASuT48l%iS:JXY_+C]J-Ch+Z%BleB7
Ed8dDDeE$F6r./^:IJQ,A92[3EarZ'AoD]4BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
04Ja9@P;S,F*(u602t_8:L?^i6nW=e@WcC$A86$nCghEsG\:T*ATD4$ATJu8H#@_4GT^[6B4u*q
B4uBuA0=K?6m-PhF`Lu'+A?3CAQWDaBl%<pDe*ZuFCfK$FCf8sFCf]0ASu("@<?(%+EMgGFCBD:
BPD*mCh[NqFCeu*C2[X!Blmp,@<?''F)Q2A@q?cV@8pf?BPDO0DfU,<De)I96m,oKA8c?.BPDO0
DfU+UFEhmMBl5&1@<--oDg-)6De*3nG%kN3?Z]k(8l%htDg#]4G%kN3+A?3CAQU'rAS!!$@:O=r
+=L]ABl%<pDe*ZmFCf\GC2[X!Blmp,@<?'\F(KB-AU/?:F<G^IATDQtH#k*<Df00$B-:f)EZf=A
De`inF<DuNEb]?-A8Gt%ATD4$ALVA4A8lR(<HD_lCLqd4EHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>
Ec5](@rrhAE,o].De(;6@;]dkATMs.De*fq@r5Xl+DkP)BkCptF<G16EZdtM6m,oKA8c@&@;]dk
ATMs.De*Bs@s)X"DKKi+@r5Xl+DkP)BkCptF<G16EZdtM6psg<<D>nW<$5U[A8c@&@;]dkATMs.
De*p-F`Lu'E+*6n@;[3)@;]dkATMr9AoD]48l%iR:K::[73H#LA8c@)Eb]?-A86$n+E2@>C1Ums
+EM+9F`;YQH>7A/D..-r?Z]k(9jqaR+A,Et+=MP^H>7A/D..-r/p(ZL.3NG8FCf\>Anc'm    ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ER'
zz=:zz,'R003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012'
zz=:zz,' ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR'
zz=:zz,'022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GRO'
zz=:zz,'UP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface'
zz=:zz,' JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRI'
zz=:zz,'PT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXE'
zz=:zz,'XPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK'
zz=:zz,'006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDE'
zz=:zz,'L PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEX'
zz=:zz,'T UNION UTF8 WORD XML abv afterstr alltrim badappend badblia badbu '
zz=:zz,'badcl badfl badil badjr badlocn badobj badrc badreps badsts baduniq'
zz=:zz,'ue beforestr bget bnl boxopen catrefs cd changestr checknames check'
zz=:zz,'nttab checknttab2 checknttab3 createjod createmast ctl datefrnum db'
zz=:zz,'lquote decomm defzface del destroyjod did didnum dnl dpset dptable '
zz=:zz,'empdnl fex firstone fod fopix gdeps get globals globs grp gsmakeq g'
zz=:zz,'uids guidsx host hostsep isempty islocref jappend jcr jcreate jderr'
zz=:zz,' jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv j'
zz=:zz,'ustpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc ne'
zz=:zz,'wd nlargs now nowfd obidfile od ok packd plt put quote read readnou'
zz=:zz,'n readobid regd remast restd rv rxs rxsget rxssearch saveobid secon'
zz=:zz,'d tc trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),'
zz=:zz,'(<<;._1 '' jodliterate ALERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJODH'
zz=:zz,'EADER BEGINJODPOSTP BEGINNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDIND'
zz=:zz,'EX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKENS IFACEWORDSPFX IFACEW'
zz=:zz,'ORDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLCLEANTEX JLCODEFILE JL'
zz=:zz,'DEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE '
zz=:zz,'JLOVIEWSUFFIX JLOVIEWTEX JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLit'
zz=:zz,'eratePreamble LATEXTMP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNHEAD '
zz=:zz,'MARKDOWNTAIL MARKDOWNTMP PANDOCTOKPAT ROOTWORDSjodliterate STRINGTT'
zz=:zz,'OKPFX TEXTQUOTESINGLE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLI'
zz=:zz,'MIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenstrs'
zz=:zz,' boxopen changestr charsub ctl cutnestidx cutpatidx dbquote dbquote'
zz=:zz,'uq fboxname ferase fexist firstones formifacetex formtexindexes fsi'
zz=:zz,'ze fuserows gbodylatex gheadlatex gpostlatex grouplatex grplit ifac'
zz=:zz,'emarkd ifacesection ifacewords ifc indexgrouptex indexwraplatex jpa'
zz=:zz,'thsep jtokenize latexfrmarkd long0d0latex markdfrghead markdfrgpost'
zz=:zz,' markdfrgroup markdfrwords markdj markgassign markgnonj patpartstr '
zz=:zz,'ppcodelatex read replacetoks rtrim setifacelinks setifacesummary se'
zz=:zz,'tifacetargs setjodliterate seturlsha256 srxm tlf toJ tslash2 utf8 w'
zz=:zz,'fl winpathsep wordlatex wordlit wrapQtlatex wraplix wraprgidx wrapv'
zz=:zz,'rblong writeas''),(<<;._1 '' jodliterateTroubleMakers IFACEWORDSjodli'
zz=:zz,'terateTroubleMakers MASTERPARMS ROOTWORDSjodliterate ROOTWORDSjodli'
zz=:zz,'terateTroubleMakers jodliterateBadBoy writetd2''),(<<;._1 '' jodtools'
zz=:zz,' AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR0'
zz=:zz,'0404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJODtools JOD'
zz=:zz,'LOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 OK00403'
zz=:zz,' OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 WORDTES'
zz=:zz,'TS addgrp addloadscript addloadscript1 allnames allrefs betweenidx '
zz=:zz,'createjodtools dayage delgrp firstcomment firstperiod fsen getrx hl'
zz=:zz,'pnl jodage lg locgrp mls noexp notgrp nt nw obnames onlycomments pr'
zz=:zz,' refnames revonex swex today todayno updatepublic usedby yyyymondd'''
zz=:zz,'),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY DOCUM'
zz=:zz,'ENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 ERR0253 '
zz=:zz,'ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterface MO'
zz=:zz,'NADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251 OK025'
zz=:zz,'2 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRIPTDOCC'
zz=:zz,'HAR VERBATIMMARK blkaft changetok compclut compj compressj createut'
zz=:zz,' ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 doctext '
zz=:zz,'docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfreader qt'
zz=:zz,' reb revo rm rtt textform2''                                        '
zz=:4181{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1bg+1+>P&q+>Y`20H`))+>GW02)$..1a"M-0f^@9+>Gl92'=h#0f:sJC2[WX67sB1C2[W*@kB8T
D..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5
@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&
F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?
%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`i
AM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8
ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN
+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu
@X0)1C2[W*Ci<flCh5%)$;No?+<Ve8@Wik:+<Ve8Cht5'@:O(qE$0=8EcYr5DBNh*D.Rc2%15is
/g)8Z@V97o+<VdLB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;CE%15is/g)8Z
@W$!)+<VdL@UWb^F`8I@@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;AS`J3+<Ve;ASbq"
AKZ28Eb'5B+EV19FE8uUB6%p5E-!QQD.-ppDf[HPATT&)ATVL(@1<Q=67sB'+Co1s+<VdL+Co1r
FD5Z2@<-W9Bk1dmFD5?$@psInDf-!k:-pQU+<Y34C`jiC+<Y3/@ruF'DIIR2+DtV)AKYf'F*)IG
Ao_g,+E1b2FCfK1Et&IO67sB'+CoG4ATT%;+EM+9F!,"-@ruF'DIIR2+E1b0@;TRtATDi$$;No?
+<Ve>A7]_$+<VeCBleA=B6%p5E$/S,A0>r9Blmo/A7]^kDId<rFE7lu:-pQU+<Y<.F<D\K+<Y<.
F<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)ATVL(@3B0&Df$V-Bk)7!Df0!(Gmt*U67sB'+D5M/
@WNY7+EqaEA0>;uA0>u*F*&O;Ci<ckC`mV(D.Oi1AS,LoASu!hEt&IO67sB'+D5_6+<VdL+CfG'
@<?''@;]TuEHPi5Gp$a?Dfp#?+CT.u+EM[>FCfM&$;No?+<VeD@;BEs+<Ve>ASu("@<?''8g&1b
EbTK7F!+n/A0>DkFCAWeF(HJ)F_u)=%15is/g)8ZD/O/4+<VdLD..=-+Co1rFD5Z2@<-W9DIIBn
+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZDIn$&+<VdL@rc-hFCcS4ATo8-Bk)7!Df0!(Gmt*U
67sB'+E(d5+<VdL+E)41DK?q/DIal"Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<YW3@r#Tt+<YW3
@r!2tBk)7!Df0!(Bk;>p$;No?+<VeGF`\`K+<VeGF`\aMDfTB0/0K%GF*)IS+DkOsEc6"M+D#X;
@qBanEa^))DKKe>A8,OqBl@ltEd8*$:-pQU+<Y]9B4N,-+<Y]9B5)F/ATBGHDK9<$BleB-EZed5
A8,OqBl@ltEd8*$:-pQU+<Y]9F*(q8+<Y]9F*)>@AKYetF*&O6@:O(qE$/Y2ART[lA0>?,+=M2;
@r#U(%15is/g)8ZEd2XJ+<VdLEb/m+Cgh?,AU&07ATMp,Df-\=ARTUhBFP;D67sB'+E_a:F!)SJ
+EqaEA9/l9F(Jl)@X0)?DfTB0+CT.u+EV19FE7lu:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=
+Dk\2F(&]mF!)l':IH=:EcQ)=F!*.j0J+t83@PCE%16T`@r,RpF!)SQ@;9^k-OgDmDeX*1ATDl8
-Y[=6A1%fn%15is/g,7EF))n,A7TUr+Dbt)A7]9oAnc:,F<G16EZdss3A*!?+:SZuAT;j,Eb-@@
C1_0rATJu7AS5S!-QjN@$4R>;67s`uAT23uA7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$Bl5&8BPDN1
F(Jj'Bl@l3BOQ'q+ED%0@<?'k+Co%qBl7X,Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh@j$(?Ci<fl
Ch4`,Dfor=+EM+9+CoV8Bl7Q+8g&(nDe<^"AKYf-@:X(iB+52C67sB/.OdMA+A#%(8PUC.:-hTC
+A#$o:K%]0%15is/g+tEDIjr&AS#C'+Cei#EbSrpAKZ#)FEMVA/0K%C@N])sA0>]&DIjr%DIdet
$;<oP3\`=8@4hur6W-'.0f+/b/e&.e5sd^q3I>0e%15I#9L_0+6W,I/7L]\6$;No?+DkOsEc3(A
@rc:&F<GL@FD5Z2+Cf>#ATJtG+EVNE@:WmkD/XH++CSek+CQC1ATo88@VTIaF<G(3A7Z2W:-pQU
@;]TuD/Ws!ApGM@BOr;uDes6.GA1r-+Co%qBl7X,Bl@l3De:+d5snOG<*<$d%15^+6W-KP<'<8t
0b"I`5u^9T4ZY>R%15X*9h[]21,B@H=A;IP3\iN$$<0Gr<'<8t2%9mZ=]@gQ3\iT&$;Efa912QW
:-CWn2[p*o<(8i13\iZ($;al)85DuD3\i])$<'eq4ZYAQ%15^+:JO&61GK=G%15is/g,">@rcK1
FCf]=+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM
6r-lZ/6,Y=3%Rm/<(Ke[/5oD>/4ri::(7O>$;No?+E(_(ARfg)@rGmhEt&IX:JsSD3\V!M<(0_b
4ZY;,$:dui<DYh>1(=Rh<Cp.Y4ZYA.$;EfR;GTG:1^sd$$;No?+Co1rFD5Z2@<-W9F(K0"+ED%*
ATD@"@q?)V6qKaF8P`)I;HZ.D2%9m%$;No?+E(_(ARfg)DIIBn+Cf4rF)rlTA7]^kDIdfL+BM?:
6nD;+;cG;<;GU:h/5oP?<(/?45snOG%15lt8ju*H:.%0*=&2^^/6#&:<%LO;:K:4B;cQCg74_/!
6W-\h$4R>;67sBi@:UL!@VTIaF<G(3A7[;7A7]^kDIdfL+AY<r771$L6OaB3@:X:cC-=U^3Zp",
+BplL.P<@s><3lX+C-+$/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&
+=84M@<?0*E-6&.FEM#6Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O
6V(*R4ZXr53\E!3/5SW3845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^k
DIdI!B-;,1+D>\7F<F@X%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h
4Wn#ZI45U4%15is/g+_MFE1f"FE8RCDJXS@FD,5.E+*j%+D,Y4D'3h@@;KXiBk:ftAnc'm+DtV)
ATJ:fC3=T>E+*j%4ZZe.+FQ9n>p(A@+=LGT+>#2g><3lW/h^H^+=B2t-9We#.P;iJ3Zoq*03g+P
:dJ&O6q'cr4Uh`-$;No?+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQU
C2[X(H#n(=D/`p*BHV#1+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,Xo
ARlotDBN\4A8c?<Bkh\u$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.
C2[X(H#n(=D/`p*BHS[;De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*
F(KB%Df00$B.dn5F!hD(%15is/h1FMA7T7jASu$iDKKq/$>OKiCh\!&Eaa'$:-pQ_C2[X!Blmp,
@<?''F"JsdB4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfguGp$^>
Df$Uh:IH=<Ec6)>F"Rn/:-pQB$;No?+Eh=:@UX@mD)re\AS!!+BOr;uDes6.GA1r-+C]/*B-;/3
F*)IG@;]TuB5)I$F^cJ*Bl%@%%15is/e&._67sBoFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5r
EbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(L1$;No?+D>k=E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*m
Ch[NqFD5W*0+A7`67sBoFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7c8X:-pQUBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=
E-Z>1%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU+B1m';c#bT6r-/m+<VdL/KeYJCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD)*j:-pQU+D,P4D/!Tj@qBanGT\+O/KeYDEc#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"
B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4Et&IO67sB'B6%s-BlkI?+<VdL+<VdY+DkP&AKYetFCf\>
AoD]4B6%p5E$-QS.1HVZ67sB'BkCd`ATMEmFD5Z2+<VdY+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(
Ed8dKFE2)5B+52C67sB'BkCit+<VdL+<VdL+<VdY+D,P4D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:
G]XB%:-pQU+EM+9C2[X!Blmp,@<?''/Kf"QAT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CD
F<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfTb$;No?+<YlHEb'!#F<D\K+<VdL+>"^Q@;BEsCghEs
GT^U=Df$V@DfTA2Ch[s4+=MLa%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zp130f!ZWF>,EY$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GWi@rsC\+=MI`
+D5_6Ch[u6@<-"'D.RU,+CSekARlp*D]j+DE,]i/F)rIEDf9_?FCf\>Dg#]4GB.D>ATJ:f:-pQU
0f!ZWF>,NoB6%p5E$._A5sn(B:JsSZB6%p5E,K*$AKYZ3E+O'+Bl7]tA.8l@67sB812gZE0Jstn
AT2Ho@qB0n4$"L'@<-F'DJ()9Bln#2.!K9>.3L2bBOPdhCh7Z1@UWdiC*7#)A7Z2W:-pQU0f!ZW
F>,Zs@:Wn[A0>H(Ec5t@BOPdhCh[d"+>"^VAT2Ho@qB0n.!K]GFCcmDGA2/4+=MGSBlmopF"%P*
:-pQU0f!ZWF>5Km@:X+qF*(u(+A?3CAQU'oEb/Zr@VfTu/KeP:@;]^lDJ()/Df0K*Df0Z<%15is
/g)l(De!lD1*C"9A7]9o.!&j>Deip%F"&4`+E_a:Ap%o4AoD]4@;]LiH$X1BB-:]&A7Zm*AU&;+
$;No?+>GWi@rsFa+CSekARlo3GB.,2G&h&.Df02:+>"^PDf021F)Q2A@q?d!Bl7L'+Du+A+Eqj7
E,]B!%15is/g)l)A7]7+3?Va@A7]9oFDi9MC11UfF"&5%Bllmg@N]]&E,Tf3FDl2F%15is/g)o'
D..]D2]uO>C3=T>ARlp-DfTA2AoD^,@<?4%DBL?OAo&n=AoD]48g$,H0JO"D:-pQU1,*QRGq_3#
F`:l"FCeu*AoD]4@s)g4ASuT4-u`U4A8bs,+Eh=:F(oQ1Et&IO67sB90PY`J0K1+_A7T7^+=Li?
Ec#N&@:NkjAU#XHFDi:9DKKH1Amo1\+EqaEA9/1e:-pQU1,*TaFtbWn@:Wn[A0>N*@;omo@ric$
DIal(DI[L*F(oQ1F!,OH@Us1nARfh#Ed8dLD]j">ARTFbCh4%_:-pQU1,*TaFtbWn>[h8WBl89.
De!p,ASuU<+Dl%?ARlp*D]j(=Dfd+6Bl%?'AoD]4:Ng;i9P%XE/n8g:%15is/g)o'DJs\P1a"2f
ATV[*A8Gt%ATD4$ALSa3Ch7$mATAo7@rc:&F=\PCF`_;8E[YuX/0JM@@;0O#@:Wn[A.8l@67sB9
0Q(fP0esk"E,]<*A7]RcFCf\G+CSekARlp*D]iJ!C3=T>+Cf>+DfTQ0B-;,)+Eqj7E,]B!+Dbb0
ATJ:f%16T`@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/h1CCE+Not
ASuU2%15is/g+\9@r,RoARlorCi<ckC`mD&Eb-A8D]iJ3DeW`)@rH6sF`V87B-9lV<+T/SDIIBn
F!,[@FD)dh+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_78u]X+A,='<_5_]<(0n38k_QO8PDNO79C[)
9LhuW9M&2_79C[)9NP"f6qg0O<(0n3%15is/g)Pl.6T^78l%iKBlmp,@<?'WEb/Zr@VfTu8k_TG
76s[J79CZA$4R>;67sBYDeEX%+@pWh-Z^DSDfTA2AoD^,@<?4%DBO"B@<?''D.-pfBl7K)/Kf+K
D/!g#@<*K4D]h,&+C]J8%15is/g,+AEcYf5+EV1>F<GdAFD)dj7WU+'Eb0?$Bl7u7GA(]4ATMg!
@q?ckDIal'@;]UlATJu4E+No0EHQ2AATKI5$;No?%15is/g,=KEaiI!Bl,mRDJsW.+Co1uAn?!o
DI[5e$;No?%15is/g)8Z+EqF6-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO:-pQU+<Vdg3[ZF2
+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$4R>;67sBoBk1ctF(96)E-*4=De!3lF!)VS.OdM5+Dk_,
+EM.2+:SZpAo'U_+>Pf4,VU>`+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g+7=DffZ(EX`@mAo'U_
+>Fu]-oihe/nlpc+=AT\+<VdL+<VdLI;NS4+<XEG/g+(8GA(]4ATMg!@q?c2F)YPtAKYE!A0>Q(
EbTi<DKK<'+EV%$.1HW$Ao'U_+>P&^-nHcT/nlpc6"),i.kbTh1,^R(I;NS4+<XEG/g*G&5qQ7_
@4cdJAU%^$F_#3(B-9ql64F9=Ao'U_+>Y,_-t+`B/gjCA.3K`U+<VdL+<VdLI;NS4+<XEG/g*n3
FD,5.Ch7^1ATAng%16raCcsBn1a!nh@4l7H-UK10+<VdL+<VdL+<VeTD.[T,+AP6U+@72mBOr<&
ATW$*EZd[X$>jBk4Y@j7+<W(@/nlpc0JP==1c70M3&t=n.3O%UAo&S4:-pQU3?VjHB5)I/+CT.u
+C>QbD.[TI/g*%p+=LYNBeCbc-Rg/\+<VdL+<VdL+FS*=C`jiq67sBK+>+*1D.[TI/g*(q+=LYN
BeCbo-Rg/\+<VdL+<VdL+FS*=C`jiq67sBJ+?Br=D.[TI/g*+r+=LYNBeCb\-RU>c+<VdL+<VdL
+FS*=C`jiq67sBX+E;OBFCbmgD.[TI/g*.s+=Js#.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBJ
;@NtMAo'U_+>GPm-o!D)+<VdL+<VdL+<VdL+<VdLI;NS4+<XEG/g*hW%13OOF(T5O/g+LV?!JR.
+FPjd/it[m1*@u!+?CW!.1HV3+BTa/+<Ve*+<VdL5p.9m+AO%%+<Wun+<Vde+<VdL6m*Tp+@@7o
+<XN(+<Vdo;BR))+<X?I+<W%;0F\@30d&1n+>GVo0d%So+>Fu]1E\Cp+>P&o+<WQb0d%Sn+>Fu]
0d&1n+?(Dt+<WBm+>Fu]+>Fun+<Ve%67sB7+<YB9Bln&tC^g^o0d&4o+>GVo1*@\p+>P&^1E\Fq
+>P&p+<WQb1*@\o+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8+<YTEBOu2n$6V&G1*@\o
1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>P&^
@;Km9DKTe*$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jp+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*
+<Vd]+>P&^+AP6U+>Y,_:(7OQ0d&4o+>GVo1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jq+>=o\0d&.m
+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB;+<XEG%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu
+<WB]0H_Jm+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*"o+AP6U%1444+>b2`0f'q++<WQb0H_Jr
+>=o\2BX[r+>t>r+<WQb0H_Jm+>=o\2]sq"+>GPm1*@\^0d&4o+<XEG/g*%p+Du==%144:+>=o\
+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\3$9mt+>GPm1*@\^0d&4o+<XEG/g*(q
+=@U*+>Fuo+<WBn+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc0H_Jm0H`+n+<WB]
1*@\^:-pQU3$9=k-OgD*3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu
+<WBm+>P&^+>Fuo+<Ve%67sB@+<Y04D/Ej%F:AR"0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb
1*@\o+>P&^0d&4o+?(Du+<WBm+>P&^0eje)+<Ve%67sB80H`_\%1444+>P&^0eje++<WE^1*@\r
+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l'+@B%#7L]\I0d&4o
+>GVo0H_Jn+>P&^1E\Fq+>P&p+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8
1*CXW@:NjX$6V&G1*@\o1E\@o+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u+>P&^0ea_*
+<Vd]+>P&^+AP6U+>GYpF)YPtAKYDnFCfJ8DKTe*$7QDk%15is/g,@VEb$;)DfT]'FD5Z2+D,P4
+Dbb0ATJ:fG@kYS3Zoh)4*,"M4)JSG.3Kr[4$!fX%15^$6qL9F6W?iZ=Zneg-RT?1%15is/g,@Y
@;p0sA0>]&DIjr0Eb/isGRY!];F+,Q76s=)3[[*D/j:Wl$4R>;67sC"@;]Uo@j#l6@;^-uDfT]+
A0?):@;p0sA0>]&DIjr,ART*lFDkr+D@Hq=9LViY<)6.g;F+,B3ZoeT6#:+QFB!0oHRC@G;F+,Q
76s<m-[d?O$;No?.V3L.A7]^kDId<rFE7lu%13OO:-pQq4FVa.INWt[/g+V3F<Gu@$4R>;67sC%
BOu!r+EM%5BlJ/:FD,*)+D#S%F(KD8FCf<.DfTl,Ed8d$@8pf?+D,>(ATJ:f:-pQU:.\/V3Zr'H
DImisCh\3,+D,P4+Dbb0Fa,QV@:O4s+:SZM9LDKB5u(BJ=?S\f0H`D!0F\A0ASiQ1ASl@/AKYet
FCf\MFCf\>FCf<.+D,>(ATJ:fA7]R".P>.PGRY!jAS`J=/n/:+%16WWC`k2[A9MYr$=m^a+=]!_
Et&IeAS`J=/nnj@%16WWC`k2[Dfp.2$=m^a+=]![DeBLdA7]R".P>g]@grcUAS`J=/o5H<%16WW
C`k2[Ci=,!$=m^a+=]![DfcEqA7]R".P>FQA.8lVAS`J=/no-7%16WWC`k2[@VfZd$=m^a+=]!V
H4:3lAS`J=/n]JY@Wca;.1HV5%15is/j;IJIXZ_T$4R=O$;No?4?S(AIXWDd+>.J=FCf\>I16Mm
$;No?+D5_5F`8IFBln0&+CT.u+CTD7BQ%o6/Kf+V@;]UaEb$:tD..3kFD5i5AISu=9N4S_9LVoL
=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8E\&>TBln0&/0JkMFD5Z2@;I'/Eblk,DIal'@<6)k$=%"^
FD,T5H[[2g@<H[*DfU:OINTqA>R_#d>[.^F-!YM.@;Ka&>]k('H[[2gBkh^3Ebp1LIXN>D>R_#d
>\7nmFDc#=ATMR3AKY6"AU&<=FF-qW5qOiL2EDt0,CX]I@59\uINs;i+C&f&Ec#6$F(or3%17Lm
$=%[eFDPN8>]aP%FEDVOINs;SEc6)>INs;i+@gHjF`;a<$7QDk%15is/g+eIDfp"ADg#]4G%kN3
+D>=pA7]cj$;*uf<_5_]<(0nP3Zp+!3Zp*c$7-g:BPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%16?]
ARfgrDf0o,FCf]=FEDkY,CX9GDfp#J,CY%`:Ng;iG%kN3I16N4%13OO:-pQUCghEsGT^X>Dfp"A
@WcC$A0>r'EbTK7+:SZM9L;`N9LMiK=?S\f0H`D!0F\A0ASiQ2AT;j(DI[6#De:,.@<?(*+Cf>,
D..<mF!,R<@<<W)ASu("@<?'':ddb^$?B]p+CT>4F_t]2+DbJ.AU#>/G\(q=@<,p%Df-\>BOr<1
DfTW-DJ()2@<?/l$?Kd#Ci<flC^g_]A0<O9+=2JIE%h_.Cis0&@<?(*+<Z+XIV3\>F`;dSILQX$
@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9G
Dfp#J,CU(/ASu$pDe!3l%14Nn$4R>;67sBnEc6)>+EDC=F<G[:GT\R\@rH1+D/OD;D..]4DImBi
+CSeqF`VY=DJ'Cc8k_`Q:eXG[<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''-tdR>Ch[u?
+DbJ.AU#>0Bl%?5+=LlCE,961.3N87DImisFCfM9,%kq7F`8N6$7-g4@;TRd+Eh=:F(oQ1F!,C5
+EV:2F!,(/Ch4`$DfQt3@:Nsn8l%htB6%p5E$/k:+E2@>@qB_&ATKI5$4R>IBl7m4FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U#.%16?LAS5^pHXq&)F_t]-FF=T*%16?SDK'`?H[[2gB6%p5E.0$\
FD5i5AM/(9G^U#.>]!nbATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%13OO>]++sE+*Bj%14C(@rH4$
@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*
+CQC5F_kUu$7/quATVa"DJ+')HX('!CisT4F(K<=HS]5MI16N0>]XIuCh7KsFD-#+@rH1+D/OE+
E,p);AUSnZ/i@TiI16N0>]b1.@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CXQSBk;K@FCf]F%13OO
>]++sE+*Bj%14CdDf0,rDesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%
B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO
4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO:-pQUGAhM4+Dbb6
+EDC=F<G[:GRY!P9NP"f6qg0O<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''.!KTMA8Gt%
.3NG8FCf\>Anc'm/g(T1%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71
A8bt#D.RU,I16Mm$=%I[GApu'AIStU$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V
,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;
AT3'E1M(EO%14CdF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@Hp^
$7/qqDIm<rCisT4%16?SDK'`?H[[2gFCf]7@;TS),CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`
@;^1*D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]
AU&V4$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$4R>;67sBt@;0U%C2[X!Blmp,
@<?''9OUn3=<MR'ARTFbCh4%_8l%iKBlmp,@<?'WEb/Zr@VfU=3Zp+!3Zp*c$7-g0De*ZuFCfK$
FCcS2@<?(*+E2@4@;TIiAM,)7$7-f($7-foBPDN1Anc'm+DGm>@3B5tB4u+,+CfP8FDl#1H=^V0
G%G]8Bl@l3De:,6BOr<*Eb/Zr@VfTb$7-g3@<?($Bjkg#B4YslEaa'$A0>?,+E1b,A8bs*F!*&U
+E)4@Bl@l3GA(Q*+E2@>A9DBrDJ(($$7-fIFCf\>Dfp/@F`]5YE+*WpDdso'BkM*qBkM+$Bl7Q+
BlbD8G%G]7Bk1acDBNA*A.8kl+EV:.+EMX5DId0rA0>T(A7^!.BlbD;ARo@aBl7Km/g(T1%16?N
De!p,ASuU"CghC+>;7mPFBs6%Ecc#*Ch8#($4R>IF`V,5@:O(]B4Y:`@;]Us@ps=f?$g3qDf''-
Ed<'B$=%^pAT2'fCLLje>A.SVA8,poF'X-)F_kl5@:s/"%16?_F(K<!@r#LcAUA61De*F"DLDs$
>]k+!E+*6l@:s.u@;U(,H#7"A@;U(&@<?12%16?_F(K<!@r#LcAUA-'G\(u.GV!Q@Cis0.AU&V4
$4R=g+E2@>G%kJuF!+_0AU&<<F^fE%EbTK7%16?_F(K<!@r#LcAUA$'G\hJH11bkV%13OO,p6i@
@;omo@ric,DI[L*F(oQ1Et&I]F`V,5@:O(]B4ZF&Ea`p#Bk)B=F*1r(BkMR/AUP!p>\A(cE+irq
F)YQ0BR>(Y055<6Cisf5Df0VLI=2P3%14C(F`V+:D/!L#Dfg8DAKY]!+CTG%Bl%3eCh4%_>Y/Ns
Bl%?LG\M5@F*hb<@rcL0H#R=IF*)\UHX(]7AT2'fCLLjeHYmJ,Ec6&FE+OHGH[Q>1>\RefF_r6T
>\RepATVL.+>I,5Bj>@aCis0.AU#=P>\7\50H_YaBkAK,A7fppGRY!&+C'&1AT2'fCLLje>BP%"
3*glFDK'`?ASu"+%16?OCia/1,p6o6+Dc1/FCf\>DfQtFASbdsAU"Xk+<Xp3F(K<!@r#LcAUA$-
DKKr=ARg,t$6UHrBkDU$FCf\+$6UH6+C'&1AT2'fCLLjeH['@KG][t7/9l;TBk)'lAUP!p+<Xp$
BakCl+C&GgAmoguFCoH/FCo)mFEMV8F*gViE,]N/B0C?JGV+#KG]YK8@ps1b4\]@,@q\PSG@bf)
@<6".%144#,p75>E,8rmAKXEA;GU:[+EqOABHVG8Bk)'lAKYQ,Ec3(1BOPpi@ru:&+:SZ#+=/.E
AfuA;FWbR5ARlp*BPDN1@q]:k@:OCjEZcqVFD,5.E,oN2ASu!h+E(j$$6UH;+EV:2F!,O<DJ*cs
+Cf(nEa`I"ATAo-DBO%7AKYr4ARTFbCh4`$DfT?!F!,UHAKYo'+F%I6@<?(*/0JbO@;K@oARl5W
+<Vt8DIn$%Df'?"DIe*!AT`$3I="C_;GU:[I39XT%144#,p6]+DBO"3F<GLDBOu3,D/X<1F)YPt
AKYT'DKKqBBkAK0BOuH:Eb-A%G%#*$@:F%a%144#,p5c%Eaa''ATAo0Bkq9&;f?f!@q?cMDe*E%
:i^IsF(JoD%144#,p6lCFDs8o04Ja9B6,\6A8bpg/n8g:06DJY@VfsqEa`p#GqUp,0etC93A5Gl
F`Lu'/Rr^0AM%kAD_>^FD/9Xg+<Vt8F(KH1Df0K*Df0ZD7WN'O9lFofI16N++=196ATVd-DJs-*
DKL5(Dfp)1AKX?YA7Zl[Ec6@8$=%1W%13OO,p6)sA7]@eDIjr,@:EeaGA1T0BHUo*EZf14F*)Ib
+E)@8ATE!/F(HmFFD,5.ASuX-ATD4$AKYr#@r#LcAKZ22Cht5(@<HX&%14C(D..I#ATDi7FDi:5
G][M7A0>>mH#IS2+EV:.+DbV$F<GF/EbB*(/e&.mD..3k@<?<sFED)7>X<HuAS5^p6uQRXD.RU,
HR0+.+<Xp0ASu('@rH4$@;]V&>X3+>F*),E%144#+<Z#9F(KH0ASu.&BR=!#@:EeaGA1T0BRP4a
ASljD%17MgD..3k@<?F0BOu2n$=%^pAT2'fCLLjeHY%);D.R`rFCfk0$4R=g+EV=1BQS')F*&O7
Df'?"DIal%DfQt:BleA=F)YPtBl7Pm$=%OjDg#i*ARfXqD..<mHX(Z,B4uC'BleBEHR0+.+<Xp1
ATVa"DJ+')HX(9,ASlL"E.*'eE--M5F(KH0ASu.&BR=!'@<-F)BlJKI0Q;,^I16Mm$7-g(F_PZ&
+CoD#F_t]-F<G:8A7]up$=%^pAT2'fCLLjeHYm2,ASG\"I16Mm$7-g)Des?4Et&I]F`V,5@:O(]
B4ZF"Des?4I16NgA7]@eDIm<rCi=?@F(eumARfXpDfU8Q;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/
Df0Z;DepP;FE2M6FEMV8F!(o!>\%DXBl7KlDes?4HY[2<G@PQ-DfU8QEbAj0HS@',1Ft441-$m>
/i>G5%14C(C*7)4E,95uBlkJ+EbBN3ASuU2+F##S+Di6=+E\fM%16?NAS,XoARfXpDfU28@<>pf
Des?4I=$!I@XWSW/ho.50J5+@/2/\61OT]>,p6qFDKTf*ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJ
C^g_VA7]@eDIm<rCi=?@A7]7o@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%
EdM8(F(K6!Des?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HY.)4@<?!tCi=?B
HZEb.I=!Y#0JG%3/het10J5=>I16N0+DN$8De!3l+CT>4BkM=#ASuU2%16?NAS,XoARfXpDfU27
BOPpkDes?4I=$!I@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HZO:LBl7QnDes?4I=$!I
@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HXgu2D.RU,@rH1%Ed`:TB4?:90J54@/2/\4
2(UF60JRtb$7-g6EbTB)FD5o0+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4
HZ+">ATD:!Ci=?BHZEb.I=!Y#2)[!>/i,@90J5%6I39XT%16?NAS,XoARfXpDfU2CFD,6+@rH1%
Ed`:47m_WN0J"n/1,Uq;%14C(B5DKq@;I&pF)u&.DJ`s&FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0
Ci=?BHZEb.I=!Y#3A`9@/ho780J5(<I16N0+E2@8D/"*+G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBn
Et&I]A7]@eDIm<rCi=?@Ap&!$@rH1%Ed`:TB4?:90J5%5/2/\10J"n10JInt+<VdL%13OO>]k+!
E+*6l@:s.uAmoReH$44;I16Ng6tKtEDIla[DfTr#ATD6a@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH
%16?.AS,XoAQEA_@UX@mD+/>cBl\-0D.RU,HUqj`BP_BqBQRs+B75,-ATD6gFD5T?HXgu2D..<m
@q]:kF$3c5>^K_(I16N0+@0OK+=A^PDf0Z<BmO>R>]XajChtIAAoD]4D/XH++Cf(nEa`I"ATDi7
E+O&4Ch[cu%13OO,p7/8DIdZq+D58'ATD4$ARlp)H#@_4GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>
D.Rbt$7-g'Eb-A*Bm=3"+DG^9B4YslEaa'$A0>B#A7ZlmF`\a:AS,XoBln'-DK?q;@<it)$7-g(
AKZ&*F<G[D+CT/5+Eh10Bk/?.AU&;>AoD^,@<?U*DJ()%Df'?"DIa1`>]k+!E+*6l@:s.uAo_<s
ARp2u$=%I[G@bZ8Bl\-0D.RU,HW+TdA7];"H[U6h%16?XATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA
?$fguAU&<,Des?4HY[2<G@PQ-DfU8Q>]aP%FCJj/HQt7nI=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4
+B*3$EarZ'6Z6LH+Ad)s%14CdDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5
H$<b:Ci=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&sIFCA-oE+N!eCOKDA?$fguAU&<,Des?4HXpQ,
@:O4lDfU8QHQt7nI=2P3-!Y>!G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmn
Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QLARebLCfG=gI9SF3H[?tlI=34I$=%I[G@PQ.D..<m
HX&mGF(J*GDejc*0jT-2FCf]=@rH1%EdM8(F(K6!Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QN
Ci<a(<,ZQ#>;9E1>]aP%FCT6*DfU2:Ci<a(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6YKnK
<,ZQ#>;9E1>]aP%FCT6*DfU27BOPpkDes?4I=#4@AU&<+Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!
;fm%oDJ)peCOKDA?$fguAU&<,Des?4HZO:LBl7QnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QK
Df'?&DKJirCOKDA?$fguAU&<,Des?4HXgu2D.RU,@rH1%Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s
@rH4$@;]V&>YfHTATCagCOKDA?$fguAU&<,Des?4HZ+">ATD:!Ci=?BH[?tlI=6Md%16?XATqX&
D/E^!A:%QICh7X/<,ZQ#>;9E1>]aP%FCT6*DfU25Ch7X/@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3
-!Y>!G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$fguAU&<,Des?4HY.D<@q0FnDfU8QHQt7nI=2P3
>]++s@rH4$@;]V&>XijR@ruF'DH(OiI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>Z,-GBl@l`@<--p
E`?smI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>X`[RDfSfqCOKDA?$fguAU&<+Ap\kL0n"Iu%16?X
ATqX&D/E^!A:%QVDfT]'CfG=gI9SF3H[?tlI=2P3%14C(8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;
Df'?"DIdf2AoD]4E,Tf>+E2@>@qB_&Bl7Q+E+*WpDdso&ASu("@<?'k+DbJ.AU"Xk>]++sASu[*
Ec5i4ASuU:8l%iFEc6)>87c4?ATE3GI=$AO$=%I[G@bZ8Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2
Ed`:_H[Q>1%16?_F(K<!@r#LcAUA#tDI[s*A9*)-$=%OYB4Z.+H#.&=AmoReH$p,/%14C(A79Rk
+D"tkBHV8&B4VMZ>]OFpDfg>2ASlC"HX(Z2A79b3I16Mm$=%:WG\(u.GRY!&+C'&1AT2'fCLLje
>B=@tE+*BjF(or34_A,=F(HmF,p7/8B4W3,BmO>5A7]@eDIm?$@X0)@ATVL.%144#+<VdL+<VdL
+<VdLF`(o'De*EBAmoLsALnrH+<VdQ+E_R9@rGmh+C]A&@;Bp,GA(Q*+E_a:A0?)1FD)eAATVL.
%144#+<VdL+<VdL+<VdLG\(u.G[5Z0H#R>8Eb/j2%16?OCia.s$6UHrF`V,5@:O(]B4Y:iDJ<U!
A7[oGEckr!HY@\DATDg&Apk*q>\7[Z$4R>IBR+Q.EcYf6F`;\:Eb/ZpCh[d&F$4VcF_**5$6UH6
+<VdL+<VdL+C]8-CMdL#CNDX\EckqE%144#+<VdL+<VdL+<YW6Amoh(BQ%oSH[RFS$6UH6+<VdL
+<VdL+E1k'FD5i5ANbBg/.Dq/+<VdL+<VdL+<Ve:Des?4Ch[d&F$4VcF_**5$6UH6+<VdL+<VdL
+E_^@@rH1%E]mlJF_**5$6UH6+<VdL+<VdL+Dbb0CL_:!DfS!X@:s.hFC?^0$6UH6+<VdL+<VdL
+E1k'@W-9tATBq\0H`%l0R\?Y$=%X`FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%16?]ATVa"DJ+')
HX(MuEcZ#1E.*'kE-*4ACiseA12q=XD/!m1F!*2VFF=T*>]XIuCh7KsFD-#+ASl"!B4YsjH#n(J
ATVEqI=!b]D1*NL,p7/IAThX&F<GLFATDC*Cht51Bl7L'%16?]ATVF#F`);4EdMk=@r?F+A7]_%
BRP4]I16Mm$7-g8ATMF)+DbJ.AU#>3DId='+EVNEF`V+:FD,]+AKYK$CisT4F!*%WA7]@]F_l.B
BlbD=GAdot,p7DFBk(g!Eb0<7Cij_@Bl5&0Dfg%CDe:,9@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3l
F(8WtAIStm+AP^3762Q"A867.F<G:0+DG_(AU#>8@;TRs+EDUB+EVO7ATVTsEZbeu,p6f?Df%NX
BQS?83\N.1GBYZU@<?(*/Rr^9D09`1FEoKWEb@%KBk;L1DfBE#/oYKC5A!&8-?MC*2`!<#$=%^p
AT2'fCLLjeHYmnAFD56'Cjca">]!nbART[sATW$*EX`@\Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7Hm
G^U#.+<Z#9BkBVPGAgu0CisT4%144#+<VdL>X3=@F*)><ARfXpAmoLsAISth+<Xp#Cia.s$6UH6
+<Ve35]UFWFDl&.@rH1*Eckq&$6UH6>\7[Z$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ
E--L;$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h2/mYc%144#+=/.?BOPdkAKWcOFDi:4ATMR+
ARlp$F_tT!EZf:4+DG_(AU#>-DesQ5DK?6o+<Ve3@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2
.XPE7DId='DIIBnI9d9h+<Ve3D..I#@W-@%HX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6
+<VdL+<VdL+F@?f@;BFSE,]B/@psFi>\S(dAU&*$D.S,A%144#+C'#%Ble6%B4Z.+H#.&=E,8rs
DLDs$+<Ve3F(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*+<Ve3F(KH0ASu.&BR=!'@<-F)BlJKI
0Q;+VE,9Z<+>>E(E--L;$6UH6>]OCl@<`4g+<Ve3Ch7]nBlmp'>X3"6G\M82D1*]>$6UI<>\.e`
HYmnAFD56'Cib#0BkBVNATMs3DIm<rCg:mrARfXpF_u#$AScF!>[qS]@<-<qB4Y=[BmgEt>]!nb
ART\!FD,6+%13OO>]!nbASH$mAU"Xk%14Nn$;No?5!FFEIXZ$MA8Gt%ATD4$AQ3\gF^f/u9jqgK
EcVZs%15is/g+4];GKeY7lhc/Df021Ch[cu+C]A&@;BRpB-9]B:K:4684>g478b7EBl7L'+CoC5
DJsV>GB.,2+E2@>E+O'+Gp*V(:-pQU8K_GY+Cf(\Df]W1B-;)1F<G[D+<kE3GTn8PBPDN1@V'%X
F`V+:BOtU_ATDi7D..]4DImBi+Eh=:Gp$pADJ().Bl7L'+EMI<ATVX'ATKI5$4R>;67sBPAfuA;
F`JU<ART+\EZf%(F!,[I@;p0o@VfTuCh[cuF!,R<BlbD*A867.F<G[=ASiQ!AS,k$AKZ,:Bl7Q+
C2[X!Blmp,@<?'(%13OO%15is/g+S=C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'
Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>
+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2
C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg>c-C`mq?Ebce+DIal-
Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'
F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'
A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?
@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-O#Cht5<DfTV9
@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N$$4R>;67sBp+CoC5GA(E,+A!\dD]iM#@psM$
AKY\0@;R-2BOQ!*Bcpi$+<YA@A8`T7BOQ!*8K_P^+C\nl@<HX&+DDs,D'4%9@<<W++CT+0+DDs/
D]j7;@<<V`+CoC5@V'%XF`V+:Bcpi$+EqL-F<G9?@;R,0Bcpr)+EqL-F<F-tA8`T"ARf.kF(HJ.
+CT+0GA(E,+DDs,D'08p%16oiDJ+$4F_55K3ZpOH/hnIr+DGp?BOPs)@rH3q+EVNED0[74FED)3
FD5Z2+EV:*F<GC<DJ())Ec6)>+D>=pA7]d(Ch[cuF!,"3+Du+>+Eqj7E$-_TFD,B0+DGm>H#IhG
+E2@>@VfUmD]gVSDJsV>C2[X!Blmp,@<?'.-Z^C^+<ki;Ap%U!FCfJ:+>"]aBlk^MF!+m6GAhM4
+A!\jF`VXI@rc-hFCeu*BlkdH/Kf=WF`JU5@W-:#ASuT4@rGmh-YdR1FDl)6F&#%S.V`m4FDl)6
F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB$;No?
+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5E%c9T
Blmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat@;TRs
+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(ARfh'
+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D+ED%1
Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-E,8s.
F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a
:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Y3/F)Yr(Gp#pO7Nb<!6m-/SCiCL>+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD@;BEsCi<`m
+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/G]4cJ+<Y]9
FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2
Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL+D58-F!,@/
D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+8l%ht@rH7.
ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9EHPh8F)Q)@
ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL
+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4JEd8d@@;]V$
+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8F)Q)@ARlp(
AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ
67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7
D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJDfTA2AU&01
@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i
+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtB
C2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcmEb$;:BPDR"
F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!%16igA9E!.
Ced;L+=_,EA9E!.C`m4>/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'
Df-\9AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8
F`_>6Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,
+EV%5CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:Njk
DJsZ8F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'
DIIR2+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-
$;No?+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=
DfT]'F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9
@VTIaFE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.
F<G[:G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:
Bldir+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7B
FCB<6Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;4ASc;p$;No?%15is/g*o-
FCfMS%15is/g)8ZATDg0EZc\ODegJ4ATMp$B4Z-,-u*[2F`_>6+ECn.B4W2>0JYL>/MJk73B8Mt
$4R>PDe!TlF)rHO@;9^kF`_>6-OgDmDeX*1ATDl8-Xgb.A1%fn%15is/h1CCE+NotASuU2+Cm&U
+Co&&ASu$iDKI"FDfTB0+:SYe$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4@<6L4D.Rbt$:.Th
<D>n\9gMZM4ZXs!F)uJ@ATKm[%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F`_;8EX`@A
<E)Lb;GBGT90G<`@<H[*DfRld%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt1Eb/[$ARl5W
6W-?=<(02L5uL?=3[\EXART[lA3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZen<@:UKo
F`(i#EbSs"+CT.u+D#e+D/a<&Et&IE=[>GM5uL?=3[\H`@:VDH%13OO:-pQUA8bt#D.RU,@<?4%
DBNe)Ebce0DfQt;Df/uo+D>n8B45gp@;[2rDIal$G[YH.Ch7Ys$;F;k5t"F5;G0/6-Z*d>@:VDH
%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQtDATD6gFD5S$$<BSn6:"RB9hdoO90G<`G%G]'
@<?4#3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+EDC=F<GdGEb'5#$;sYq<*)jn6rQfG
;G0/6-ZX-DFE_YDA90dZ%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebf_=/KeS8E+NotF!,C=+E)@8
ATAo1@<-.)%15L!6WHiL:/jqR;G0qO3Zp^e;cQO\;b]PU905F><(Ke_9gMZM4$un75u^9@9gMZM
4%*4;6qosF905jD:-h9B5uL?;<^fnQ5u^EM9gMZM4&SjM<*)jn6rQfG;G.H+%15is/g+YBD/E^!
A0>]&DIjr1F`2A5F!+7W+Co&&ASu$iDKIo^C2[W*+Xefh4Y@jf@Vg%,DffP5%17)s4ZX]k?t<__
EHQ2AAO%k>7TW/V%13OO:-pQ_ASu$hAT23uA7]Y#Et&H                              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GBq/+>P&q+>Pes0eje/2'=Y2+>ttt3$:%6+?(E#1MUi=D..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F)#W(Ch\!&Eaa'$B4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfgu
Gp$^>Df$Uh:IH=<Ec6)>F)#W(Ch\!&Eaa'$<,uo"@VfUM@;BFpF($2$Des6$@ruF'DBNk0+EqaE
A9/l8BOQ!*,%kJ)ATD4$AKY].F*2&8+s:K9EZccFDe*ZuFCfK$FCcn9De*s.DesK*ATDL.ARlp*
Df9H5+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA9E!.Caj+;A9E!.CgeGrDes6$@ruF'DBNk0+A,Et
+E_d?Ch\!:+EqaEA90dSAU&<.DKBN1DBNk0+=LuCA17                               ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&q+>G]50PYN:?tsUj?m'0)+EV:.+EDC=F<G(0@<6K4De:,6BOr;Y:IH=HH#n(=D(Zqs
Cht54FD,6++A,Et%16T]@<6L$F!+n3AKYAjDeX*1ATDm#ARlotDBN>%De*6.+<Xa!ASrW,Ddd0f
A0>8pDe*5uBla^jE,8rmARlotDBO%7AKYAhC2[Wj+Dbt+@;KL-+:SYe$=%Xp@WQ*jFD5Z2HV.(%
+@BsRF)rHqDKKH1Amo1\I16Mm$@[GQINWt[/nuMW%16NQFs%nM+AP6U+CT)&+C\bhCNXS=G%G]8
Bl@l3DIIBnF!)S7$=[XZF<D\K:-pQUB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^
F`;CE+:SZeDJUF<+<XEG/g+tEF*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj
@r$4++D,>(ATJt:%16WWC`jiC+AP6U+Co&"ATVL)+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe
@<6!&Anc'mF!)SJ+<VdL+<Vd9$=mj]+<VdL:-pQUA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*
A0>r8@<?4)FD56++<VdL+<VdL+<VdL+<V+#A8Z3++<Ve%67sBsBleA=DdmHm@ruc7Bl5&(Bk)7!
Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<VdL+:SZgE-#T4+<XEG/g,4HF<G+.@ruF'DIIR2
+E1b0@;TRtATDi7+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%16`YAT2]5+AP6U+D5_5F`8I3
DIal2F_Pr/+Co&&ASu$iDKKqB+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$>3pl+<VdL:-pQU
Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<V+#B5DKq
F!)T#67sBhDII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF!)SJ+<VdL+<VdL+<VdL
+:SZjEc<-D+<XEG/g+YEART[l+CT.u+Dl%-BkDW5B6%p5E-!-E+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%16r\CLnV2+AP6U+DkP&ATJtd+EM%5BlJ08+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$>sF!A0<!;:-pQU@rc-hFCfM9@3BH!G9CF1@ruF'DIIR2+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#De't5+<Ve%67sC!E+Np.+CT.u+Cf5+F(KD8A8,OqBl@lt
EbT*++<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZs@:O(`+<XEG/g+V3@r$-.F`8I3DIal1ARfY%
ATDi7G@>Q7ARlp)E+*6f+DG^9A8,OqBl@ltEd8d>Bl%@%%17&sF<D\K+AP6U+EMXCEb0;7DdmHm
@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<Vd9$?B]jA0<!;:-pQUEb/lt
F*(u6+CT.u+E_RBAS5^uFCfJ88l%htA8,OqBl@ltEbT*++<VdL+<VdL+<VdL+<V+#Eb0<6A0<!i
67sC$ATMs3Eb0;7FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.3K',Ed2XJ
+<Ve%67sC$AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk+<VdL%176!ATJt:+AP6U+ED%8F`MA@+EqaE
A0>o(An?!oDI[7!+<VdL+:S[,IXZ_T$4R=O$6Tcb%13OO%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13                                                                  ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bnlSmoke0'
zz=:zz,'1 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke0'
zz=:zz,'0 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 globsSmokeDoc00 '
zz=:zz,'grpSmoke00 jodageSmokeDays00 mnlSmokeArgs00 newdSmokeBadArguments00'
zz=:zz,' odSmokeArgFail00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''          '
zz=:325{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>Y]dDe*p+Deip+ATMs7F)>i2AKZ)+F*)IG/Kf4JEd8d:@<6-m+EV19FE7~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkfQ6WHiL:/jqR;G/-(H:gt$Bl8$(Eb8`iAKXQj8l%ihDKKH1Amo1\;cH%X
6pX^=+A$lO:IK;CDesJ;8U=!)7!*?cCi`NS5u'g6;FDX!H:gt$F`_>8FCfK)@:Njk8l%iS:JXY_
<_Yt)8l%iU9gg+"9/&+Y2BYmn:K1Ck;FFGuDe*ZuFCfK$FCcRr;F+,U;FO&H=B%^k+CS`&+CfG'
@<?'t@<6N5Anc:,FDtf3Bl@N)C2[WrASc<.C2[X!Blmp,@<?'fBOPsqA79RkF`M:@C2[X$DC6ka
-p0%C-XgJ-;f-GgAM>ec.4cl04?G0&0d%hdC2[W*C2[X!Blmp,@<?''C2[X!Blmp,@<?'[Ec6)0
Ch6=LCLqO-+DPh*FDl)6F!,49A9E!.CaUY_-p0%C-YdR1F)>i2ATVL)FE8fY/1<VC4"akp+=A:(
:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<<)5nX?V4*^?Ys<r@WcC$A86$nCghEs
GT^I<Bl%<pDe*ZuFCfK$FCf8sFCf\>BPDO0DfU,<De'u*De*3nG%kN3?Z]k(+DPh*Ch\!&Eaa'$
<HD_lCLqd4+DPh*E,o\nF(KB-AU/>>D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<r
An?%*C2[X(Dfp)1AKYr4C2.Zt+F8?[C2[X"@;0UdFCf\E.4cl01*A;1,Vh&/0JP:;2_HpH1bggI
3A`EG+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP:;2(gaB1c%*I3B/cN+>PW+0JP::3%d'B3AWKJ
3&ilU+>PW+0JP:;2(gdA0JYC;2)dHP+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP::3%d'B3&i]K
3&ruW+>PW+0JP::3%d'B3&3EJ2)-4/0JY=:0et[?1c76Q1Gq!C2DH=00JY=:0et^@1cI?P0JGLH
1,9t-0JY=:0et^@1cR3G0JtaE2DlU40JY=:0etU=2).!E2)@0I3Ar!80JY=:0et[?2)-d>1cR3G
2`Mp80JY=:0et[?1c[EM2)-dD2`Mp80JY=:0et[?1c@$D0fCmE2`;d60JY=:0et^@1cIBO3&i`L
1Gg400JY=:0et[?1c$jH2_d0I+>PW+0JP:;2_HpH1bggI3A`EG+>PW+0JP:;2_HsA0K(pN3AE9L
+>PW+0JP:;2(gaB1c%*I3B/cN+>PW+0JP:;2_HsA0K(pN3AE9L+>PW+0JP:;2(gdA0JYC;2)dHP
+>PW+0JP:;2_HsA0K(pN3AE9L+>PW+0JP:;2_HsA0K1[?2DR!B+>PW+0JP:;2_HsA0K(pO0KD!I
+>PW+0JP:;2_HpE3&rcP1b^gB+>PW+0JP:;3%d$H2`EEE3B/cL+>PW+0JP:;3%d$I0f(L@2D[6K
+>PW+0JP:;2_Hp@1c.'I3&NQN+>PW+0JP:;2_HsB0JbC:2)@!11,(I;0ekFB/i5RH2)$jG3AE62
1,(I;0ekFB/i5I?1GLdF1,h*61,(I;0ekFC/i>=@1GLjJ0JbL-1,(I;0ekFB/i5@?1,:O;2)mND
/1<V90JY=:0etX>2)@$G1Gh*N2`<0?/het90JkUH2`<?L2)I'F1bpjB1+Huj1*A;#/1<V9+>kE"
0JY=:0etU=2).!I1GUaG2)ZR40JY=:0et^@1cI<H2E!HP3&i$90JY=:0et^@2)-pJ0fLpD3&Da5
0JY=:0etX>2*!NM3AE6H3AM^40JY=:0et[?1c7*G3AWZP2)ZR40JY=:0etU=2).!L2`NNH1cQU5
0JY=:0et^@1cI?L1GLgG2`2^50JY=:0et^@2)@$I3&riS0JXb+0JY=:0et[?1c70J0K(gD3A_j6
0JY=:0et[?1c7*G3AWZP2)Zm7-p07=1,(F;1,^aB1H7?N1cR0D2(N#h0JY=:0etR<2)@3O1c.0G
0f:Fp/hnJ(.4cl01*A;.,Vh&/0JP::3%d'B3AWKM2Dd9I+>PW+0JP::3%d'B3AWKN1,1LA+>PW+
0JP:;0J51:2)-d?1GCU-1,(I;0ekF@/iGL@2_d!D2`Wi?1,(I;0ekFC/i>@;2)dHO1,:U-1,(I;
0ekF@/i5CD3&`NG2_m961,(I;0ekF@/iGIB0Jk^J0f1U-1,(I;0ekFC/i5LB0f:pG2`3H81,(I;
0ekFA/i>OH1c-pD1c@?:1,(I;0ekCB/i>=C1GgpB0f:a01,(I;0ekCB/i>=C1GgpB2)7$31,(I;
0ekCB/i>=C1GgpB1,^s31,(I;0ekFA/i>IC0fD$I0JGF.1,(I;0ekFA/iGCA3&<<G1cIB:1,(I;
0ekFB/i>=:2_ZsD1,pC30JY=:0et[?2)$^C0JY=?0K:110JY=:0et^@1c[HN2E<KM2DH=00JY=:
0et[?1H@EO2_ZpE0JXb+0JY=:0et^@2)-dB2`ETL1,9t-0JY=:0et^@2)$aE3B&lP3B83;0JY=:
0et[?1H@0M3&<KP1H$@20JY=:0et^@1cREQ2D[*K2E2g70JY=:0et^@1c[<G1,q3L3&Da50JY=:
0et[?2)$^B3B8cI2BXb/1,(F;1,ggC0JGCF3A<6L2'=Y.1,(F;1,ggC0JGCF3A<0H1*A>+1,(F;
1,^aB1c7!G3AN9B2]sk01,(F;1,pmC3&rlV1cR3J1ast(4>838-p014/1<V7.4cl00e"Y90E  ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
