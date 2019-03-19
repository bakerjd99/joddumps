NB. JOD dictionary dump: 19 Mar 2019 16:46:06
NB. Generated with JOD version; 1.0.0 - dev; 12; 19 Mar 2019 10:47:38
NB. J version: j807/j64/windows/release-d/commercial/www.jsoftware.com/2019-03-18T13:21:35
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|133248494607860607601639321371617972897|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.0 - dev';12;'19 Mar 2019 10:47:38'

JODVMD=:'1.0.0 - dev';12;'19 Mar 2019 10:47:38'

MAXNAME=:128

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bget=:3 : 0

NB.*bget v-- retrieves objects from put dictionary backups.
NB.
NB. (bget) implements  a subset of (get). (bget) fetches  objects
NB. from either the last backup or particular backups.
NB.
NB. OBJECTS ARE NOT DEFINED IN LOCALES for the simple reason that
NB. backup fetches may return many versions of the same object.
NB.
NB. Only put  dictionary backups  are searched there is no backup
NB. path.  Also,  there is no corresponding  (bput)  because  the
NB. files  read  by (bget)  are backups that, once  created,  are
NB. never altered by JOD.
NB.
NB. Also,   certain  objects  are  not  fetched,  name   classes,
NB. timestamps and sizes.
NB.
NB. monad:  bget blcl
NB.
NB.   NB. collect from must current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.
NB.   NB. three versions of a group's header - similar to (get) where
NB.   NB. (2 get 'group') returns the group header
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's word list

WORD bget y
:
msg=. ERR001

if. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. are backups present?
if. badrc uv=. checkback__ST {:0{DPATH__ST do. uv return. else. bn=. rv uv end.

NB. NIMP are the requested backup names valid?
NB. NIMP are the requested backups present?

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (WORD,0) bgetobjects__ST y
    case. EXPLAIN  do. WORD bgetexplain__ST y
    case. DOCUMENT do. WORD bgetdocument__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST y
    case. EXPLAIN  do. TEST bgetexplain__ST y
    case. DOCUMENT do. TEST bgetdocument__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. GROUP bgslist__ST y  
    case. DEFAULT  do. GROUP bgetgstext__ST y
    case. EXPLAIN  do. GROUP bgetexplain__ST y
    case. DOCUMENT do. GROUP bgetdocument__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST y
    case. DEFAULT  do. SUITE bgetgstext__ST y
    case. EXPLAIN  do. SUITE bgetexplain__ST y
    case. DOCUMENT do. SUITE bgetdocument__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST y
    case. EXPLAIN  do. MACRO bgetexplain__ST y
    case. DOCUMENT do. MACRO bgetdocument__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

bgetdicdoc=:3 : 0

NB.*bgetdicdoc v-- get backup versions of the dictionary document.
NB.
NB. monad:  bgetdicdoc ??
NB. dyad:  ?? bgetdicdoc ??

ok 'NIMP bgetdicdoc'
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok 'NIMP bgetdocument'
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get backup versions of short object explanations.
NB.
NB. monad:  bgetexplain ??
NB. dyad:  ?? bgetexplain ??

ok 'NIMP bgetexplain'
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. monad:  bgetgstext ??
NB. dyad:  ?? bgetgstext ??

ok 'NIMP bgetgstext'
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. monad:  bgetobjects ??
NB. dyad:  ?? bgetobjects ??

ok 'NIMP bgetobjects'
)

bgslist=:4 : 0

NB.*bgslist v-- get backup versions of group/suite lists.
NB.
NB. monad:  bgslist ??
NB. dyad:  ?? bgslist ??

ok 'NIMP bgslist'
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. maintains argument compatibility with (dnl)
bv=. DEFAULT ~: 2{x
if. bv *. (0{x) e. TEST,GROUP,SUITE do. jderr ERR001 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. badrc uv=. checkback DL do. uv return. else. bn=. rv uv end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

if. (,NDOT)-:alltrim y do.
  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. bfile=. ({.x) dbakf__DL rbk
        NB. errmsg: jfile read failure
 
  badjr uv=. jread bfile;(1{CNDIR),CNCLASS do. (jderr ERR088,' ->'),<bfile 

elseif.
        ol=. uv{ol [ uv=. /: ol [ 'ol oc'=. uv 
        NB. reduce object list for words and macros if class specified
        if. bv *. (0{x) e. WORD,MACRO do. ol=. (oc = 2{x)#ol [ oc=. uv{oc end.

  isempty pat do. ok ol  NB. return sorted last backup name list

elseif. 0=#ol do. ok ol  NB. nothing left to match
elseif. do.              NB. match prefix, infix suffix
  select. 1{x
    case. 1 do. ok ol nlpfx pat 
    case. 2 do. ok ol nlctn pat
    case. 3 do. ok ol nlsfx pat
    case. do. jderr ERR010
  end.
end.
)

checkback=:3 : 0

NB.*checkback v-- return list of put dictionary backup numbers.
NB.
NB. monad:  ilbn checkback baObj
NB.
NB.   checkback {:0{DPATH  

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__y do. jderr ERR103 else. ok bn end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)6:7+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P\p2]sn5+>b2t2'=n%2`;d=+>koGH:gt$
Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.
De*R"FCfK)@:Njt8U=!)7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs
.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,
DfTB08l%iS:JXY_<_YtS:IJ/X:J=\0G%G]8Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?
+DkP&AKYE!A0>DkFCe04=AD.V7;ZIXBl/!0+DbV,B67f0De:,&Bk)7!Df0!(Gp%!5D.RctB4Z1*
ATVs,AThX++E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;@W$"'ARTUhBQI`nEarco
F!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtABl.g*AKYJr@<,ddFCfJ8Ch[s4
+E1b2FCfK1F(8lp@r#O^@r$0tF*&O:DfQtBBOr<*Eb0<'DI[6#De:,2F`\a:Bk)7!Df0!(Gp$R)
@r$4++D,>(ATI                                                             ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fU:2+>P&o2]sh00f^@22]t(=2.pKB6tp.QAU&;qD/X3$0JH6g/h1LFF@9hQFCf]=;f-GgAM>e\
F=f'eBl%U.F*)G2FCcRCB4Z06+Co1rFD5Z2@<-W9FCf]=F"Rn/:-pQB$;No?+B3#gF!,R9F*&O=
Ci"68FE1f3ATJu8Df'&.,'7O/CLqcC@W-0/+=MI`+CT;'F_t]-F<G(3A7]g)De9Fc:-pQU-td+5
.3NhJASrW&ATVEqBl7Q+FD,5.+Co1rFD5Z2@<-W9+CoD#F_t]-F=n\8BOr;sBk)7!Df0!(Gmt*U
67sBkDe!p,ASuT4BlbD*+EM77B5D-%@r*9+AftQ.FCfMG%15is/e&._67sB[BOu6r+Cf>#ATJu)
ATDL.AKYT*Df$V8FD,6++=Ll6F=A>NE-,f4DK@EQ8K_M]F_kS2@:Wmk@rGmh%15is/g,7S+<ki;
B6A$!EbTi2+s:u@BlbC>@Wcc8@<3Q5BOu6r+CT;%+CT)&+D>2(D/<d)F!,1=-Z^CQDJsV+$;No?
+EqaEFD)e2F=n"0:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU.3N/8
@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)
0JFj`$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPS)@<+([
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC+
+EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2
-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6J
3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+S=C`mh5ATME*An?'o
BOu6-B4Z0-FD,5.F(&os+Co1rFD5Z2@<-W9FCf]=%16Ze+>k9SATT%B-OgDoEZd4^2]uaEF<DqY
%16Ze+>k9#+>G!OATT%B-OgDoEZd4^2]sdsB4Z0--RT?1%16uaEZd4^2]sjuB4Z0--RU#Z:-pQU
Eb0?8Ec,q@ATDg0EX`@nATAnN+C@&M+D58-+=ANG$>sEq+>k9#+>Y-QATT%B-OgCl$;No?+>%q>
78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDFE1f2BK8(5?Z:.09jr9a@;TRSD/X3$0JH6g/h1g_FA61gDIIBn;f-GgAM>e\F=f'e
FCfN8+AG.(:-hTC+DbV,B67f0@q]F`CG$&':-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+>"^WAS!!+ATMr9@rc-hFCfQ*F*(r,@ruF'DIIR"ATJ:f
:-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/g)8Z
+<VdL+<VdL/hSb/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(FCD..H>3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_
5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+EVaHDBO45D/Ej)+E)-?%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6mk&N%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%16Ze+CoG4ATT%B;FNl>=&MUh74/NO%15is
/g,">CLnW+@;TQuFDl(?Ci=3(+CT.u+CT>4BkM<+@W,n%F!,X7Cis:u$=[^^CjA0)+=CW4B5Dj2
@;TR'/58E4:-hTC?X[\fA7$Q/;^W"]-t6n'Cj@Hm3Zr,h+>P&p%13OO:-pQU@<?U&D/aS>FDi:@
F`\`X+EM47F_kS2AmoCi%16uaEZfI@E,9H&+E2IF+C]%tCj@-4$4R=O$;No?+>%q>78m/.;cQ1P
78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
FE1f2BK8(5?N                                                              ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`2^:+>Y,p2'=Xs1-%*E3?U(2+>P&p3AE<G+>GPm1*A;33&*950ea_*+>u280H`))+>P&o1bpd.
0f^@3+>l,9+>Get1*A;-2D[s$6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<
3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H
3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7
+A-cm+>PW*2'=S53]/cU1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N
3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9
+A-cm+>PW*2'=V/3\r`V0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS2]s52@<?'A+>Get8p+qm1,(F?+>GW41bh$H2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI
3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh
0d')2C`kJe0f:(.0fh!I3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>GSn+@KX[ANCqh0d')2C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.
0fh'E3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[
ANCqh1E];4C`kJe0f:(.0fh'G3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>G_r+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe
0f:(.2**QS3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp.:+<X'\FCdKU1,L+GF_i0U0JPF-0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U
0JPF-0f;!L0fh$F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14
+<X'\FCdKU1-$ILF_i0U0JPF-0ebXB1-.0L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP
0JPF-0KD0K2``WL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$
+@KX[ANCqi+@1-_+>PW*2'=V-3\iTS1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArQ$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0JWtB$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Y-+F_;gP0JPF-
0ek^G2**HI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[
ANCqi+@1-_+>PW*2'=V23\WBO2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)5LG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc8
1,h6N2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A
+>k9-F_;gP0JPF-0fD'K3BAlQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f'.D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT3
0f;!I2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A
+>t?.F_;gP0JPF-0ek^E1cdKQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp.8+<X'\FCdKU2BY;.B-8r`0f:(.2EE]O3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fB@G$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp@(6$6f_1,(F?+>>c9
1,CsG1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A
+?(E/F_;gP0JPF-1,1gH1HI9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp13+<X'\FCdKU3?UV1B-8r`0f:(.0KLsE3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$
ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KLsL
3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqo
+@1-_+>PW*2'=V-3]/ZR0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0K;*M3BAlM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.2+@1-_+>PW*2'=S53\`EO1G]@F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)
B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>GVo6$6f_1,(F?+>G]61c7<J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*Al*B-8r`0f:(.1cdHQ3\`W%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<G+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K1cd<G$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?
+>Gc81bh$J1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[
ANCqk+AZKh+>PW*2'=V13\`BN0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`
F_tT!E]P=%+<X'\FCdKU0ea_>ARZc;0JPI.0f1pG1HIBN$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.6+AH9b+>PW*2BX_03\WKR1,91D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(F@+>GZ5
1c7<N1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
0f1"I@<*JG0JPI.0f(jI2``WL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=Wi
D.7's3Zp4$+@KX[ANCqh0Ha(uEZd+k0fC./0fh*F3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U0f]RJ$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>PVn9jr&b1,(F@+>GT3
2).-G2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqo
+A-'[+>PW*2]sk13\`WU2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU3?Uq&DBL\g0fL410fh'G3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp18+@]pO+>PW*2]sh33\W9L0f'.D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1DARZc;
0JPL/0f1pJ0fh*M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b
6t(1K3Zp18+@]pO+>PW*2]sh33]/TP1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0f1pK2**TP$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp18+@]pO+>PW*2]sh43\W6K1-#[K$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,U1DARZc;0JPL/
0fD'J3BArU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>GPm+@KX[
ANCqh2'>A"@N[E[0fL402EEWJ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&
:3CD_ATBgS0ejdn6t(1K3Zp18+@]pO+>PW*2]sh53]&ZS1,fOI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pes7V-$O1,(FA+>Gf90JbaI3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Pku7V-$O1,(FA
+>PW31c%0L1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1a!o/
@<?'A+>Pku7V-$O1,(FA+>PW31c7<O2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`<L
2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[
ANCqh3$:\%@N[E[0fL410fh$G3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`As$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1E]D#EZd+k0fL403'&lR
3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\
FCdKU0eskG@<*JG0JPL/0f1pH0KLsC$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh3
3\rZT1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp7%
+@KX[ANCqg1*B;"EZd+k0fL401cdEP3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0eskG@<*JG0JPL/0f1pJ1HI<L$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>GYp9jr&b1,(FA
+>P`60JGOA3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg1E]D#EZd+k0fL411HI6K3]/]#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsH0fh-O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0ea^m6t(1K3Zp.5+AH9b+>PW*2]sk33\iQR1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#T$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.5
+AH9b+>PW*2]sk33]&WR0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.5+<X'\FCdKU0f1"I@<*JG0JPL/1,1gE0fh!H$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b+>PW*2]sk13\iQR
1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\
FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.6+AH9b+>PW*2]sk13\rNP2)YdK$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0f1"I@<*JG0JPL/
1,1gG2``cU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
0fU9u6t(1K3Zp.6+AH9b+>PW*2]sk13]&NO1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI0fh$H$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp.6+AH9b
+>PW*2]sk13]/ZR1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp14+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI2```K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0ej"B
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU
0f:(J@<*JG0JPL/1,1gF0fh$D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,L*r6t(1K3Zp.4+AH9i+>PW*2]sk13]&]T1,oUJ$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0eskG@<itN0JPL/1,:mF
1cdEI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t
6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3M1HI<K$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.8+AH9i+>PW*
2]sh73]&]T1,0+C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp1<+<X'\FCdKU0fC.K@<itN0JPL/0fV3N3'&lP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3$:h9
DBL\g0fL410KLpF3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!1*@]-@<?'A+>Pr";e9nj1,(FA+>PW30JPUD0FA-o:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqk+A-'[+>PW*3$9q83\iBM2)#@E
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU
1,^7I@;[2C0JPO01,:mI1HI<H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp19+A-'[+>PW*3$9t43\W?N
2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqh2]t_$DBL\g0fU:11-.3O3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,g=J@;[2C0JPO00etdH3'&`O$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ2
0JkgF3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b
6t(1K3Zp4$9jr&b1,(FB+>>f:2)I?O3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.7+AH9b+>PW*3$9q83\`KQ1cYmM$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*3$9q0
3]/iW2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqm+@0se+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU2]tD*EZd+k0fU:10fh$C3\r]%$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+?(E/E,m'V0JPO0
0ek^D1-.*L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
0esjo6t(1K3Zp@(6#^ie1,(FB+>GT30f;!K3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0ea_9E,m'V
0JPO00fV3K0fh*F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS0f:'r6t(1K3Zp.2+@0se+>PW*3$9q83\`HP2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f^@BE,m'V0JPO00fV3M1cd?G$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16
+@0se+>PW*3$9t43\`QS0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&:3CD_
ATBgS0fU9u6t(1K3Zp14+AH9i+>PW*3$9q93\rZT1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp14+AH9i+>PW*3$9t13\WHQ0Jj+D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*3$9t1
3\iTS1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>P_q9jr;i1,(FB+>PZ41c%0H0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`
F_tT!E]P<u+<X'\FCdKU1,C%I@<itN0JPO01,:mE1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3A_j$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh1E]D#Gp"jr0fU:21-.-I3\r]%$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp16+AH9i+>PW*3$9t3
3\iEN1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>P_q9jr;i1,(FB+>P]51,h6J1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`
F_tT!E]P=$+<X'\FCdKU1,L+J@<itN0JPO00fV3L2``cT$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3A_j$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2BY_&Gp"jr0fU:12``WQ3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp19+AH9i+>PW*3$9q8
3\iHO0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A
+>Pku9jr;i1,(FB+>Gi:0fD'H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>Pku9jr;i1,(FB+>Gi:1,M$J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Pku9jr;i1,(FB+>Gi:1H.?M0a\6p:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i1,(FB
+>Gl;2).-K0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.
@<?'A+>Po!9jr;i1,(FB+>>f:2)[KQ2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh3?V%)Gp"jr0fU:13'&cJ3\iZ%$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Y\o9jr;i1,(FB
+>Gi:0ek^F0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@
+>G\q+@KX[ANCqi0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C=Hr:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh+A-co
+>PW*3$9q13]/oY1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.9+<X'\FCdKU1*B23DBL\g0fU:11-.*K3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>P'3F`&<W0JPO00etdE1cd<I$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16
+A-co+>PW*3$9q13\iKP0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU1,C%FF`&<W0JPO00ek^G1-.9O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp19+A-co+>PW*3$9q83]/TP
0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,9sp
6t(1K3Zp44+A-co+>PW*3$9q23\W?N0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^H
ATfY;+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3ZpF*8p+qm1,(FB+>Gi:1c7<J3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+?:Q:F_i0U
0JPO00fV3O0KLmC$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/S6+J6?R!YA0=Wi
D.7's3Zp18+<X'\FCdKU3?Uq:C`kJe0fU:13BAlK3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqo+A-cm+>PW*3$9q93\`WU0f]RJ
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K
3Zp1<+@1-_+>PW*3$9q73\rQQ1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>
+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp4$:LeJh1,(FB+>GZ51,CsH1("?q:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?/KeS8FtIJP+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Y-9@rrhK0JPO0
0f(jG2``fR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU2BYe*F<E=m0fU:11HI6M3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCql+AZKh+>PW*3$9q33\iHO1,'%B$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU3$;",
F<E=m0fU:13'&iO3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`
F_tT!E]P=!1E[f.@<?'A+?:Q?@rrhK0JPO00f_9M0fh*G$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3ZpF*:LeJh1,(FB+>Gl;1,V*I2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqg
1*BA&F<E=m0fU:12EEWR3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3b
Ch+Y`F_tT!E]P=!2BX,1@<?'A+>GVo:LeJh1,(FB+>Gf91c%0M2@9cu:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yr!+@KX[ANCqg1*BA&F<E=m0fU:12``fU
3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!3$9>3
@<?'A+>GVo:LeJh1,(FB+>P`61c[TS1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3b
Ch+Y`F_tT!E]P=!3?TG4@<?'A+>GYp:LeJh1,(FB+>>c92)mWP1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="0H_K+@<?'A+>G\q:LeJh1,(FB+>GT31,h6O2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="0d%T,@<?'A+>G\q:LeJh
1,(FB+>GT32)%'F0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="
1*@]-@<?'A+>G\q:LeJh1,(FB+>G]60ebXD3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1:+AZKh+>PW*3$9q53\iTS0K9CH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCql+AQiu+>PW*
3$9q33]&ZS1H>dL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqn+A-'[+>PW*3?U"93\iWT1c5UI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO
+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg0d'(sDBL\g0f^@21HI3H3\WN#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0ejeC@;[2C
0JPR10fD'K1-.0G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+>P_q8muT[1,(FC+>Gc80JPUB2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp17+A-'[+>PW*3?U%43\`TT1,'%B$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh3$:h%
DBL\g0f^@21cdEM3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`
F_tT!E]P='+<X'\FCdKU1,pCK@;[2C0JPR10f1pK3BAlO$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1;+A-'[+>PW*3?U%63\W6K2)bjL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU
1,pCK@;[2C0JPR10fD'H1HI3E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!n
Bl%<&:3CD_ATBgS0esjo6t(1K3Zp1<+A-'[+>PW*3?U%93]/`T0f04E$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0eje?ARZc;0JPR10ek^G
2**EL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q
6t(1K3Zp.3+@]pO+>PW*3?U%73\`<L1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0esk@ARZc;0JPR10ek^C0KLmA$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.4+@]pO+>PW*
3?U%53]&NO0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU0esk@ARZc;0JPR10fV3L0fh0L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp.6+@]pO+>PW*3?U"83\`QS1,0+C$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp.6+@]pO+>PW*
3?U%33\`KQ0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+<X!nBl%<&:3CD_ATBgS1,'gn
6t(1K3Zp.6+@]pO+>PW*3?U%33\`TT0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*3?U%13\rWS0fB@G$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(FC+>GQ21c.6N
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
0f1"I@<*JG0JPR10ek^D1-.6L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!Y
A0=WiD.7's3Zp4$+@KX[ANCqg1a#M$EZd+k0f^@20fh$J3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.6+AH9b+>PW*3?U%93\i]V0JNnA
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>G\q
9jr&b1,(FC+>Gi:1H7EM0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P=$+<X'\FCdKU0f:(J@<*JG0JPR10K;*N3'&oS$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2'>V%EZd+k0f^@13BAlQ3\`N"$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.7+AH9b
+>PW*3?U%43\`?M0f04E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS3?TG4@<?'A+>G_r9jr&b1,(FC+>GZ51GLpF2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>G_r9jr&b1,(FC+>G]60f;!J3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>G_r9jr&b
1,(FC+>Gc82)dQO3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t1*@]-@<?'A+>Gl!9jr&b1,(FC+>GQ21cIHO3!r8R6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm
+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QS$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+@<?'A+>G_r
8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU
0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ
1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[
ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm1,(F?+>GT3
0f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E;m&
6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-
0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%
1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh1a#D5C`kJe
0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm
+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_
1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*
2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.
2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V3
3\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo
+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.
3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r
+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V5
3\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu
+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-
3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo
+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K
1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\
FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibU.+@:3b
Ch+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)
F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Js1E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b
+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r
@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C
0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL40
1cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a
6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0fD'K
0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[
ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[0fL410KM$H
3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\
FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,pCGARZc;
0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR
3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM1,91D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0eskG@<*JG
0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF
0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH
@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*
2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF
2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3
@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg
1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b
1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/1,1gH2**NI$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL41
1-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J
2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1:
+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lU3]&Z#$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K
3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3?V73
E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2BYV#DBL\g0fU:2
1-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:21HI3G3]/]#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.
@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]t_$DBL\g0fU:11-.6O3\WK"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr
7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*3$9n83]/cU0JEh@$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J@<*JG0JPO0
0fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r
@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se+>PW*3$9q13\WEP1,oUJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0e`qA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+?(E/
E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB
+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K1cdKM$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,EZd+k0fU:13'&iP
3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'2!Gp"jr0fU:13BArS3]&W"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,0nG@<itN
0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!
E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ41c%0H1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>P_q9jr;i
1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P_q9jr;i1,(FB+>P]51,1gF0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i
1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pht9jr;i1,(FB+>Gf90KD0L2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pht9jr;i
1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+AH9i+>PW*3$9q83\iNQ1H#RI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh2]th'
Gp"jr0fU:13'&iS3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU1,g=M@<itN0JPO00f_9P0fh-G$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i1,(FB+>>f:2)[KQ2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU1-$IO@<itN0JPO00fV3K0KLsL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqi0Ha(uGp"jr0fU:13'&cK3\rMu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp45
+AH9i+>PW*3$9q83\iTS0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,
+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C=Hr:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1*B23DBL\g
0fU:10fh0P3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&
:3CD_ATBgS0fL3t6t(1K3Zp1#8p,"o1,(FB+>GW40K;*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1*B23DBL\g0fU:11-.-H
3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp16+A-co+>PW*3$9q13\iKP1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P_q8p,"o1,(FB+>GT31bq*L2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU1,^7IF`&<W0JPO00fV3O0KLpI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Y\o8p,"o1,(FB+>GW40JbaD2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3ZpF*8p+qm1,(FB+>Gi:1c7<J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^H
ATfY;+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3ZpF*8p+qm1,(FB+>Gi:2)%'F1("?q:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3ZpF*
8p+qm1,(FB+>Gl;0ebXE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;
+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3ZpF*8p+qm1,(FB+>Gl;0f_9M0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_
+>PW*3$9q73\rQQ1,B7E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNb
F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqi+AZKh+>PW*3$9q33\iKP1,B7E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqi+AZKh+>PW*
3$9q33\iWT2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&
+AR&r@V'R@+>Y\o+@KX[ANCql+AZKh+>PW*3$9q33\`TT1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCql+AZKh+>PW*3$9q3
3\iHO1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!
E]P=!1*@]-@<?'A+?1K>@rrhK0JPO00fV3M1HI6F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqo+AZKh+>PW*3$9q93\iEN1G]@F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/
@<?'A+?:Q?@rrhK0JPO00f_9M2**HM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqg1*BA&F<E=m0fU:12EEWR3]&]$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp.4
+AZKh+>PW*3$9q73]&WR2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,
+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A+>GVo:LeJh1,(FB+>Gf92)mWR1^XQs:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp4<+<X'\FCdKU0eskI@rrhK
0JPO01,CsJ3BB#S$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!
E]P=!3?TG4@<?'A+>GYp:LeJh1,(FB+>>c92)mWP2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+<X!nBl%<&:3CD_ATBgS1b^$p6t(1K3Zp.6+AZKh+>PW*3$9q13\iWT2)YdK$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BX,/F_PZ&+AR&r@V'R@+>beq+@KX[ANCqg1a#S(
F<E=m0fU:10fh0G3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!&6?R!YA0=Wi
D.7's3Zp77+<X'\FCdKU0f1"K@rrhK0JPO00f1pG0KM!D$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1:+AZKh+>PW*3$9q53\iTS
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU2BYb5Fs&Oo0fU:11HI?L3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?1K9@;[2C0JPR10KD0L2``cQ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.3
+A-'[+>PW*3?U%43\WBO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0ejeC@;[2C0JPR10fD'K1-.0G$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp16+A-'[+>PW*
3?U%73\W9L0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`
F_tT!E]P=%+<X'\FCdKU1,L+G@;[2C0JPR10f(jF3'&fK$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1;+A-'[+>PW*3?U%53\rWS
1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P='
+<X'\FCdKU1,pCK@;[2C0JPR10f1pK3BAlP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh3$:h%DBL\g0f^@22**EF3]/i'$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K
3Zp1;+A-'[+>PW*3?U%73\W?N0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dq
A7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pr"8muT[1,(FC+>Gi:2)I?K1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0eje?
ARZc;0JPR10ek^G2**EL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%no
F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg0d&qs@N[E[0f^@22EEQH3\iQ"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp.4+@]pO+>PW*
3?U%23\W6K0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`
F_tT!E]P<t2BX,1@<?'A+>GVo7V-$O1,(FC+>G]61b^sF2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0esk@ARZc;0JPR10fV3L
0fh0M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Ghu+@KX[ANCqg1a#8!@N[E[0f^@13'&cQ3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3B/-(6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"BARZc;0JPR10etdE2**EK$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>G\q7V-$O
1,(FC+>GW40fV3K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(FC+>GQ21Gq3J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(FC+>GQ21c.6N
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>G\q9jr&b1,(FC+>GT30etdH2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G\q9jr&b1,(FC+>GT30fM-N1("?q:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G\q9jr&b
1,(FC+>Gi:1-%BL0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+>G\q9jr&b1,(FC+>Gi:1H7EM1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>G_r9jr&b1,(FC+>>c92)mWS
2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>G_r9jr&b1,(FC+>>f:0fD'I2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>G_r9jr&b1,(FC+>GZ50ek^D1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>G_r9jr&b
1,(FC+>GZ51GLpF2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0ea^m6t(1K3Zp.7+AH9b+>PW*3?U%53\`KQ1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg2'>V%EZd+k0f^@22EE]S
3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.4
+<X'\FCdKU0f^@N@<*JG0JPR10ebXF2```S$>=-pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^G
BOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen3+Co&,
+>"]a7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*
+CJr&A1hh3Amc&T+:SZ#.Nhr'@V97o?m&'aE-ZP:EZe%a@U1B2%13OO+=\KVEc#28+CK53FC65"
A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIo0=AD.V7:76PDI[]u
@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#
+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9
+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+EMI<AKYhu@rcL/+CT.u+EV19
FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s$6pc?+>>E%/ibpO+>"^*AR]\&
@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*
+CJr&A1hh3Ado(V$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).A
E,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo
+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5%33B8u?/Kdi!FDkW"EZd(n/0H]%
0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>
ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUj
Df/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9
?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*
ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmh
F!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#
AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS
:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<
3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP
78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b
.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sP
FD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i
+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"
A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u
@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*
D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0
ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!
06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(
.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'
+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ%144#
+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SYa
$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm
+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?
Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"
+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6
Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2
/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[
De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$4."J
$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn
@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!
Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9
$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU
-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl
/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+F`S[8
BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6
BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6+<VdL
+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE
@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=
ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3
Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtB
D]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt
$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-
ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZ
B6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3l
F`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LA
ATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6
DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#
+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth
+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI
%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufgu
F_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ
+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#
+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV9
1E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL
+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,
D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7
FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s
$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%
Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'
DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/
De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2
DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%
DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2
?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE
+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]gl
EbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+
G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0
+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:
A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:
F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@
@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,
@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tp
F<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL
+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?
ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6
+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL
+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm
3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHh
FD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2
$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.
+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2
+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:
F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8I
F<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:g
B4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6
+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H
0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%a
F!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%
DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p
$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\
?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(
E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;
D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3
%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R
+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@lt
Ed8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*
@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6
BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*+
+D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JW
FCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg
+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7
Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&
FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.D
DJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#
BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu
;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t
+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<Vdu
AftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%
?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!
Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]Tu
GA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+
Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8
F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.
A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%
67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL
+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5
?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lq
A0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&
+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$
De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1
BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WR
Bln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhK
ASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%
/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>
+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7C
Bl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5
AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?
DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:Wne
DBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>
+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%ht
A8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8
Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c
?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=
+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkAD
Bl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>
A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JW
FCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>
0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*
1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.
DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL
+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#
F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf
+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's
+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtD
ATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#
F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E.
/ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5
DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPt
AKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)
BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[E
E,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#
$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sP
FD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26
ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=
DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@lt
C`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,Rp
F!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;
%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBi
ARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/
F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0
E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b
76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C
;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6
+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL
%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6
@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeE
Dg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M
/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(
F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6
BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59
-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>j
IXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c
.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9
+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:Nkc
ASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6
-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F
@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb
+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB
?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs
+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-
Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,
@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;q
Ci<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n
5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_A
A8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjN
Bl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,
ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7
BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po
+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,Oq
Bl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6
@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+
$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW
<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9
AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;
FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*
:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.
%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0
%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m
?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ft
FDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"
+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4
AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4
@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(
ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'n
F!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&
ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK
+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dk
ATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbP
A79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&
@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0
AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJG
G]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJ
AT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rm
AKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:
De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3
Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"
+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k
+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+
Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums
+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A
+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bm
Bju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e
,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9
E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL
+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%
0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5
?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*
+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r
+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K
$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8
A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/
F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5
GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'
+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*
De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"
+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s
+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm
3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h
+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<
@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>Ds
AnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@
F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%
1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/
Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"
+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc
:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.
F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.
0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$P
ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUr
F"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*
Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'
+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,
ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.
+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`
@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`t
AU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O
6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.
@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b
.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhK
ASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<
Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<
+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^
7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@
Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\
/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu
%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\
%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6
@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2
DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,
Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4
BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@
F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3
Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44
FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-
FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&
F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#
.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm
3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8
?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&Mgj
DfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*
Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;
FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&Mgj
DfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6
BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=
+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.
DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/n
G9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0
ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)
@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYet
EbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-
+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5
De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%
A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^E
E&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-
+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e
$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg
%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm
+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)
/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7p
Ci<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A
?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b
.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%
0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.6
2BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g
:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;
DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z1
8l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'
+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%
AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3
De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0
DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL%143e$6TcbC2[X%
Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?
+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is
/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOABHVD1AKYl!D.Oi)De*g-De<^"AM.\3
Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9
+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)+E_a:A0<":D]g0DATT&;
E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,
:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8AKW*f:IH=I@<63,Bla^j
:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*
Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4
D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?
%15is/g*o-FCcS:D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7
+A*b!FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaW
Dfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?%15is/g+SFFD,T53Zq%5BPnq\/g*JhCLqMq
$;No?+D#CuBl#gQ+C\bpATDNr3B9?;D..-p/n8g:%13OO:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2
ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g,"FDJ<s1D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47
G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+A79+^.1HVE+Z_>4+BosJ%13OO:-pQUF(KG9C2n><GA1r*
Dg-7F@rH7+Deru-F(or3+>"^EF`_P=@<?3n+D,P4+Dbb0Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.
+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et
+DG_7FCB&sAISuA67sBtF_l/6E,9).8l%htBl8!6@;]RdF!+n3AKYr'Ec#N4FCeu*@Wcc8DJsV>
Eb/a!D/Ej%A7]9\$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]a
BkhQs.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)
$4R>;67sC!G%G]7Bk1ct779L=:/aq^73F0)F(KG9-u*71DKB`4AM.P=ALSa5A8-.(EZcqVF`V+:
Ap%p++E1b2BFP;D67sBU8PN#B+CfP7Eb0-1Cj@-l6pjaF;bp(U+DGm>GA1r*Dg-7FDf0B:+>"^W
AS!!-ATD6&-tRKL+:SZH6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Zm9ke*X
Df]i/F<FU_+@C'XAR&_`A7[B)G\&'H%15is/g*SN6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZ
B6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%15is/g,:XARlomGp%0H
D.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDX67sB^84?EF5tsp6
3Zoe`Df'&5%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>
Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4
F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(
%15is/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"BF_Pr/
%16NV4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7F(HsH
C1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*o:+CoCC+=LuCA90gg.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@/
$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA
-YdR1F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$
/g(T1.1HV,+<V+#:-pQUEb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.lGWe)1
1E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8
F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2
%14LlCi"-'Aof(;I4cXTDCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6Ec6)>
+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%
?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq
+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImisFCcS)
F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi
+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk
%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.F(oQ1
+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D@<H[1
Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@
-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673
$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*
C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:
+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQU
D.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4
GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8
DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(C
G9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&
E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028
+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U
+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUh
BHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k
?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[
4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2
%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8
DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'
+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,
67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c
$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&C
DIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("
@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)
+C\biEarHbC2[Wi+Ds=p+ED%:D]gDT+CoCC+Dr<BATW'8DD!&CDIb@/$7KdC/orHa,CUae/itb6
+u(3]4YAE2B5DKqF!a'nDETV#/oD+*.1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iu
E]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp
+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4
?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1
ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8
Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M
$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\
EcXB)><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL
:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'm
Et&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C
1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/
DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])
ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,
ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^
+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,
-o3V*5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0
Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+
1*Bk14?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_
/h%uO.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_
/h&+q/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZur
A8--.FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_
+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;
,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N
3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^H
AS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`
-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7
FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3
+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#
Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'
+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1
E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g,@OATD?)@;R,Y+E_a:A0>?,+EMI<AKYhu@rcL/+Eh10
F_,V:-[0KLCF:6CEZc`CDf'&5%15is/g+4d78cQ?9h@K/+=DAOEbd$3$4R>;67sBkF_u(?A9)C-
AKWQIF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T
;H>qA+=Ch`-OgCl$;No?+CoV3E$0+.FD,_</Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA
.3N>:+E2@4F(K62%15is/g*P^9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[
<(K/5+=AgWDe(M9De*g-G%>`4E-!Z[%13OO:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,
+=MASBl%i>+DkOsEc3'K@r,^bEc?/C.3N>:+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a
$4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`@s)g4
ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+JDg-73
$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".$4R>;
67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>DsF)Yr(
Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;D09J6
F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I%16r\
DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.Q
Bl@ltEd9#A$<BSn;b9b[4ZXrF/hen3+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S
7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrG
Bkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i
@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%
C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.
DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2
C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u
$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^
:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]Tu
Eb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$
+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+
8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hP
H#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59
BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0Oh
A0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).
AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=
FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U
+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.
+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!
@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f
89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1
De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*
C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-X
F_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50J5@<3B9&H%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"
DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+
@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN
78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(
@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%ht
GA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#
F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\
DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$
@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP.40H_qiA7]p3%15R#9LM<I4ZXs'
ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O
=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7
C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60
+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-
FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4
.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-
Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%
8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08
+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtB
DCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7
$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.
+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9
+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("
@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$i
A0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHD
FDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08
/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr
+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ
+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`
Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#
+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPL'
zz=:zz,'AIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ER'
zz=:zz,'R050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059'
zz=:zz,' ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR'
zz=:zz,'069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 '
zz=:zz,'ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR0'
zz=:zz,'89 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 E'
zz=:zz,'RR099 ERR100 ERR101 ERR102 ERR103 ERR104 INVGROUPS INVMACROS INVSUI'
zz=:zz,'TES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 OK0'
zz=:zz,'56 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT RE'
zz=:zz,'ADSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwords b'
zz=:zz,'adcn bgetdicdoc bgetdocument bgetexplain bgetgstext bgetobjects bgs'
zz=:zz,'list bnlsearch bnums checkback checkntstamp checkopen checkpath che'
zz=:zz,'ckput closedict createst defwords delstuff delwordrefs didstats dnl'
zz=:zz,'search dupnames freedisk freedisklinux freediskmac freediskwin full'
zz=:zz,'monty getdicdoc getdocument getexplain getgstext getntstamp getobje'
zz=:zz,'cts getrefs gslistnl inputdict invappend invdelete invfetch invrepl'
zz=:zz,'ace islib iswriteable iswriteablelinux iswriteablewin jdatcreate jw'
zz=:zz,'ordscreate loadalldirs loadallrefs loadwords mainddir mnlsearch new'
zz=:zz,'dparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx open'
zz=:zz,'dict pathnl pathref putdicdoc putexplain putgs putntstamp puttable '
zz=:zz,'puttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub'' '
zz=:1473{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P'!+>Y`33GNJCF*)>@APPQE.V`m4F*)>@AKYJ7/Kf+VDfT9!AKYo#C1Ums+Cf4rF)sAb
AU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g*]!A7]g)FD,5.F`(`$Ebp#8DJ()&@<>pe@<6!5
Anc'm+EMgLFCf;3F`V,)+EVNEF*)>@AISuA67sBkBk)7!Df0!(Gp%$7C1UmsF"SS5AT2Ho@qfgn
+EV:2F!+t/@<6K4BlbD*Cht59BOQ!1Et&IO67sC$AT;j,Eb/c(FDi:3BOPdkAKZ).AKYMt@ruF'
DIIR2+EMXCEa`Tl+EMgLFCf;A%15is/e&._67sB]ATD6&Bl8$(Eb8`iANC8-:-pQU+<Y0-ARfLo
E+No0+<Ve:BOt[hF!,1/+CT/5+Co1rFD5Z2@<-W9BlbD8E+Nnr$;No?+<Ve:BOt[hE+*j%+<VdL
@q]F`CNCV.F`MM6DKI"?@<?0*@:s"_DKBnBA8,OqBl@ltEd8dH@<?/l$;No?+<Ve:BOt[hE-67F
+<VdL@q]F`CNCV4Aft]"EcZ=FE+*j%+Co1rFD5Z2@<-W9BlbD*+E2IF+Co1rFD5Z2@<-W&$;No?
+<Ve:Ci=B+A8,Oq+<VdL@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<Ve:Eb/[$ATMr9+<VdLBl7X,
BjkglH=_.?F*)>@@:s-oDdmHm@ruc$$;No?+<Ve;AS-.)Eb'56+<VdLA7]@eDIjr7DfTB0%15is
/g)8ZA7]RuFEM2-+<VdL+Co&"ATVK+DdmHm@ruc$$;No?+<Ve;Bk2:,@<?Q5+<VdLA8,OqBl@lt
Ed8dKFCB9*F*),+F!+n/A0>i"FD)e2DJ!g-D..O#Df-!k:-pQU+<Y34Cia/rEarc*+<VeJARTUh
BHUo*EZf7.D.Oi/@<?U&Ec,q-$;No?+<Ve>ATVI$@s)X"DKI!DB4Z0-DdmHm@rri(De!p,ASuTu
FD5Z2%15is/g)8ZB4Z0rG]7J-Bl5%9+D58-+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU
+<Y<.FD#Z:AU&;>+<Ve>ATT&-Ec6)>+CT.u+EM[>FCcS9@rc:&F<G[:G]XB%:-pQU+<Y<.FDc2A
FCB$*+<Ve>ATT&4@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+D58-
DdmHm@ruc7+<Y<.F<GL2C1UmsEt&IO67sB'+D58-Eb/j(+<VdL+<Y<.F<GU8An?!oDI[7!%15is
/g)8ZB6.m'F*);9+<VdL+D5_5F`8I3DIal2F_Pr/+DtV)AKYf'F*)I4$;No?+<Ve@DK'`?A8,Oq
+<VdLFCfN8+D,P4+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8*$:-pQU+<YB9G%#?/ASu$$+<Ve8
E,]B+A0>T(G%G]9ARloo@<>oe$;No?+<Ve@DK]Q%Ch7^"+<VdLA7]RgFCcS/DK]T3FCeu*A79Rg
%15is/g)8ZBl8*+ATVEq+<VdL+D,2,@q[!!DK]T3FCeu*A79Rg%15is/g)8ZBl8*7AT2Ho@q?c*
+E_X6@<?''Bl8**Ecbl'+Cno&@1<Q=67sB'+Dtb7Eb/loBk)6-+<Y07ART[l+Dtb7+E)9CEb/lt
F*(u6+Co1rFD5Z2@<-W&$;No?+<VeFE+NotBk)6-+<VdLDfB9*+CQC'Bk)7!Df0!(Gmt*U67sB'
+E1b2BPqW/+<VdL+<YW3FD)e7@;TQuCh[s4Et&IO67sB'+E2IFAU&01@;0U%+<Y`IDfTD3F(fK4
F<GL2C1Ums+D#e:Cgh3iFD5Z2Et&IO67sB'+E2IFB6,1<+<VdL+<Y`IDfTD3B6%p5E-!.1DIal2
F_Pr/Et&IO67sB'+E2IFDKKrA@;Ts++<Y`IDfTD3DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67F
FD5T'F*(i-E,uHq:-pQU+<YWGFECr#Ch4_3+<VeJFDl22+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.
CghC+/9GHJF=A>S@:F%aEt&IO67sB'+E2IFFCf]=F!)SJ+<Y`IDfTD3DdmHm@rri(De!p,ASuTu
FD5Z2+CT.u+D5_5F`9!TF_Pr/+EV1>FE7lu:-pQU+<YWGFE_YDA9/k9+<VeJFDl22+EqaEA9/1e
:-pQU+<YWGFE_YDA9`-9+<VeJFDl22+EqaEA0>N$Ddm-k+ED%*ATD@"@qB]j$;No?%15is/g*o-
FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X(FDl22+ECn.B4W2>2)$U:1cZuo$4R>PDe!Tl
F)rHH-Xgb.A92j2Eb-U-$=e!gDKBB0F<Dr>C2[W1%13OO:-pQ_A7]^kDId<rFE8RL/M/);:IK8G
DfTD3A7]^kDId<rF<G+*Anc.)Bl@m1%13OO6V^?A;G0/60H_J\+<Ve%67sBmBl%?'@rH4'Df0-(
F?1OSDfor>+CT.u+EV=7ATMs%D/^V7@<-,m$:@Q^8Q/SO3]%s%+<VdL:-pQUAnc'm+Cf>,E,TW*
DKIo^D..-r+E(_(ARfg)Bl7HmGT^g:F*%iu6V^!E9i+bO3]/$&+<Ve%67sBmBl%?'@rH4'Df0-(
F?1O]@;0U%DdmHm@rri'Df'H3DIm^-+Dbb5F:AQd$;No?+DkP$DBNJ(Eb/a&DfU+GAnc'm+Cf>,
E,TW*DKI";BleA*$:@QV8Q%]46V^?A;G/Q.:/"5X<%LC36VgEQ;[j'C$:@QU9L2TU4ZYJD+<VdL
:-pQUAnc'm+Cf>,E,TW*DKIo^GAhM4+DtV)AKYK!@<6K4DfQt;@:O=r+EVmJAISu6:.%oJ5u^EO
:-CWt+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrW[ASrW/@VTIaF<Gd9F!,(/EcZ=F@rc-hFCetl$:@QV
8OGmA6TmIc+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@ltEd8d<De!p,ASuTuFD5Z2+>"]a
Eb/lo.1HVO:.88]9L26F4ZY;P+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKWDfTqBAU&01@;]LqBl@m1
%15Ht:dIuR;a!/t+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs
6V^HX<('#O76N[j+<Ve%67sBmBl%?'@rH4'Df0-(F?1O\@<6N5FD5T'+E(_(ARfg)G@>P8-ua<N
.1HVO:/XMM4ZYGNBeD.`1*B=Y/g,1GAn?!oDI[6#@rH4'Df0-(F<G[6@VfTb$:@Qd:dJ&O4ZY;X
+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^Eb/ioEb0,uAKYr#FD)dK+=Lc7A8ZO,.3NG@F*%iu6V^QO
>"(S83?TFe+<Ve%67sBmBl%?'@rH4'Df0-(F?1OcBmO>5De:,1@VTIaF<G:8+C]V<ATJ:f%15is
/g+kGG%G]9ARlorEc6)>+CT.u+EM[>FCcS*@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un7oE,_:fBM<
+@An#<E)@P<(/?*:.%oJ5u^EO:+Sb-79EA[5tOf\$;!un;cQCg78l?1+A#=/7oE,_:f@f1%15is
/g+kGG%G]9ARlp#@:O=r+CT.u+EqaEA0>DkFC?;(Bl%?'@rH4'Df0-(FE7lu8PW;\5snOG;a!/a
6V^!B5uU]56V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7P%:0(Fl;FFGH3ZoP:
:0((T6W-]Y%13OO:-pQUBl8**Ecbl'+EV19F<G+&FC>Uc8PW;c78m/a4ZX]Q:/Fqi6pXd@/430"
;FNlN8P`)46V^QO>"'u0:.88]9L26F+:SYe$;No?+EVX<D'3k5B4uB0.!0K<Bl%L$B.4sB@<?0*
A7]RkD/"*'EcW?H-n6Z//g*tV<(KDG9FV>LE+F'2Bl-!o>p(A@+BplL/M8/M3Zon)03g+P:dJ&O
6q'cn?Q_KS>n%,M$;No?.V3L.A7]^kDId<rFE7                                    ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql!,8l%ihDKKH1Amo1\+A$lO:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et
<)6:`;cZU\+A,Et<_Yt)9gMlV5tscj@V97o+C\tpFC])qA8bs#@V97oA8bt#D.RU,+C\tpFCf]9
Cgh$q+C\tpFD#Z:AU&;>@V97oDdmHm@ruc7@V9auBleA=@W$"'ARTUhBHUeuARfLb@:O(#.4cl0
4?G0&0d%hdB4Z0QBk)6rG]Zl$Deio<0Hb=WFA61gDIIBn;f-GgAM>ec.4cl0/3G:pDe*p2DfTD:
.4cl00I/>$/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<BPDO0
DfU,<De'u*De*g-De<^"AKYhuDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8
A92[3EarZ..4cl01*A;/,Vh&.3A<6D1bL^G2Dm6F2)[H;1,(FC0JbF?/iP^I2)6pE2E;m80JPRA
1GL^=2`EWP1,:^F3?U(20f^pD0f1LA2`<NK3&**A+>PW*3A<6D1bL^G2Dm6F3ANN91,(FC0JbFC
/i>XJ1Gq$H2DZI20JPRA1GLa>2)@!H2E<HI3?U(20f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG
2)mBH3&3H91,(FC0JbF@/i>UF0f:dC2_cF10JPRA1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&*9K
0fV!E+>PW*3A<6D2(gaH0K1gH1bg+.0JPRA1GLa>2)I<J3AicU3?U(20f^pD0f:R@1c@$C1c[BI
+>PW*3A<6D3A*-F3B&cQ0f:p51,(FC0JbFD/i5CF2`*EI2)l^60JPRA1GLmB1c.3O1c@'G3$9t1
0f^pD0f^jC1c[KO3B8rR+>PW*3A<6D3A*-F3B&cQ1Ggp21,(FC0JbFC/iGRC1,([F3B/-:0JPRA
1GLa>2_d0K1H%!K2BXb/0f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG2)mBH3&3H91,(FC0JbF@
/i>UH0JG=C2_lL20JPRA1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&<?I1,:aJ+>PW*3A<6D2(gaH
3&`NH1cI971,(FC0JbF@/i>RE2`EQQ2DH=00JPRA1GLa>2)[-D1,:R@0e"Y%4>J$7,Vh&.3A<6D
2(gdD1GL[?0JYX21,(FC0JbFC/iGUB2DHsE2)ud70JPRA1GLa>2Dd<P1,LdG2BXb/0f^pD0fUdD
2_ZsH3A<?I.4cl01,(FC0JbF@/i>ID1c%-I0JP(3/hf+?1,CmK2_m6L0ebRF3&i`EBeD.`0e"Y%
4>8$7.4cl01*AM$1,(FC0JbF?/iP^I2)7*N0f:(/0JPRA1GL^=2`EWP1,h3J2'=Y.0f^pD0fUdC
3B&WI2D@!F+>PW*3A<6D2(g[E2*!NO1bq!41,(FC0JbF?/iP^I2)6pG1c-=10JPRA1GL^=2`EWP
1,:dF1a"P-0f^pD0f1LA2`<NK1,h$H+>PW*3A<6D3A*-F3B&cT3AiW91,(FC0JbFD/i5CF2`39I
3&Da50JPRA1GLjA2Dm<H2_d9M1E\G,0f^pD0f^jC1c[ER3&!6L+>PW*3A<6D3A*-F3B&cQ1Ggp2
1,(FC0JbFD/i5CF2`*EK1c-=10JPRA1GLmB1c.3O1c@-H1ast(4>838-p014/1<V7.4cl00I\P8
0E                                                                        ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
