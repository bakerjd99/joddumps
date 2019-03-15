NB. JOD dictionary dump: 15 Mar 2019 15:41:37
NB. Generated with JOD version; 1.0.0 - dev; 10; 15 Mar 2019 14:15:39
NB. J version: j807/j64/windows/release-c/commercial/www.jsoftware.com/2019-02-24T11:18:30
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

JODTOOLSVMD=:'1.0.0 - dev';10;'15 Mar 2019 14:15:40'

JODVMD=:'1.0.0 - dev';10;'15 Mar 2019 14:15:39'

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
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's header

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
3$9pu1*AS"2)8ZTARfLb@:O(pATMr9AoD]4FD,5.E,oN2ASu!h+E(j7E-67FA8,OqBl@ltEd8d:
@:O(qE$/b,Ch7Y                                                            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o2]sh00f`lXF@9hQFCf]=;f-GgAM>f567sa#ATU=S@ru:,FAm$pCLo1R+ET1e+DGY.
F`VYF@<?''-td+5.3N/8@ruF'DIIR2+EV1>FE9&D$;No?%15is/g+,,BlbD=ATMr9Bl%U.F*)G2
FCfM9F)Po,+<koA@r#Y$/RiX:+s8:Y.3N&>B6A'&DKI"2De*F#+E(j$$;No?+=Ll6F=A>VBOu'(
An?'oBPD?s+EV:.+<Y3/@ruF'DIIR2+<Y35@s)X"DKIKR<+ohcA8,OqBl@ltEd8*$:-pQUA8bt#
D.RU,+DGm>@3BW*DJ*cs+Cf41De:,$H$!V=/e&._67r]S:-pQU<+oiaAKYK$A7]g)A7]dqG%De.
Ec5e;DffZ(EZccCATT@DDfBf4Df0VK+A!\cDfol,+CSek+Cf>#AISuA67sC&D]g6EAS6.%@<-(.
AKi7=BPDN1+C]J8+CT=6FD,6,AKYE%AKYDtC`mD"Ec#W(F)rI<F=2,P+Du+>%15is/g,@VEcbt;
Blks:$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(
Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FCD..H>2%9mf67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&
?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5FCfN8
C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBhCht59BOu6r+D,2,@q]Fp+D58-
+EV:.+ELt.AKYMt@ruF'DIIR2+EV1>F:ARgEZd4^B4Z0--RT?1ATAnN+?(EUATT%B-OgDoEZd4^
2]sgtB4Z0--RT?1ATAnN+?(Ds+D58-+=ANG$4R>[ATAnN+?(Du+D58-+=ANZ+AP6U+ED%8F`MA@
+D#S6DfQ9oDImi22'?6b+<Y<.F<DqY%16uaEZd4^2]sn!B4Z0--RT?1%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$.-UF(dQo3F;                                                             ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO7+>Y,p2'=Xs1,q9M3?U(2+>P&p3&i`N+>GPm1*AJ62E2g60d&4o0f1X?+>Gl!1*AG62'=V4
+>P&o1H%$]:IINL8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&
:3CD_ATBgS2)cX#6t(1K3Zp7%8p+qm1,(F?+>>K10f(jF3=Q<&$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>t?7F_i0U0JPF-0ek^E1cdBL$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg2'>M6C`kJe0f:(-
3BB#T3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Y,_6t(1K
3Zp.7+A-cm+>PW*2'=S53]/fV1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS1a!o/@<?'A+>G_r8p+qm1,(F?+>GQ20JkgH1^XQs:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0fL4IF_i0U0JPF-0ebXG3'&cM$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp='+@KX[ANCqg2]t_8C`kJe0f:(.
1-.3N3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(Dc6t(1K
3Zp.9+A-cm+>PW*2'=V/3]&QP1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS3$9>3@<?'A+>Get8p+qm1,(F?+>G]61,M$K1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$G$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,0nDF_i0U0JPF-
0ek^C2``]K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.3+<X'\
FCdKU1,0nDF_i0U0JPF-0ek^D1HI<H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp.4+<X'\FCdKU1,C%FF_i0U0JPF-0ebXG1HI<O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,C%FF_i0U
0JPF-0ek^E1HI<I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.7
+<X'\FCdKU1,L+GF_i0U0JPF-0f;!J3'&lU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K0KM!K$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K3BB#R
$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t
3$9>3@<?'A+>Pbr8p+qm1,(F?+>Gc80f1pF1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>Po!8p+qm1,(F?+>G`71cRNM1C=Hr:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>Po!8p+qm1,(F?+>G`72).-H
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>Pr"
8p+qm1,(F?+>GQ20JY[E2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<u1*@]-@<?'A+>Pr"8p+qm1,(F?+>GQ22)mWP1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-3'&iO3\r`&$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1E\u+
B-8r`0f:(.0KLsI3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp4$6$6f_1,(F?+>GT30f_9N1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G3\W;r$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1("?q
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1E\u+B-8r`
0f:(.2**EJ3]/]#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?1Jd
6t(1K3Zp4$6$6f_1,(F?+>Gc81bq*G3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3b
Ch+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c5UI$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp:&6$6f_1,(F?
+>Gc81H@KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1*@]-
@<?'A+>t?.F_;gP0JPF-0KD0J2EEQI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3Zp.5+<X'\FCdKU2BY;.B-8r`0f:(.0KM$N3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ1,TCG$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp='6$6f_1,(F?
+>GT31,M$L2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2BX,1
@<?'A+>t?.F_;gP0JPF-0fD'M1HI3M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3Zp.9+<X'\FCdKU2BY;.B-8r`0f:(.3'&iN3\`N"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f04E$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp@(6$6f_1,(F?
+>PZ41c%0J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u0H_K+
@<?'A+?:Q1F_;gP0JPF-0ebXD1-.9K$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+?:Q1F_;gP0JPF-0ebXD3BAiM$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp15+<X'\FCdKU3?UV1B-8r`0f:(.
0KM'H3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>GPm6$6f_1,(F?+>>c91c[TO1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp1#+@KX[ANCqg0H`Z(B-8r`0f:(-3BAlN3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2BX,/F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*2'=V-3\iBM1boCF$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0eje:F_;gP0JPF-0K;*M
2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4
+@1-_+>PW*2'=V13]&]T0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=!+<X'\FCdKU0esk;F_;gP0JPF-0f1pJ3'&cS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.";e9nj1,(F?+>Gc81Gh-H1("?q:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg+B)ij+>PW*2'=V33]&QP1c,OH
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m
0f:(.1cd?H3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>GPm7V-$O1,(F@+>G]60f(jJ2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3ZpC)+@KX[ANCqg1a#M$EZd+k0fC./1-.*J3\iGt$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&]T1c#IG$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>G\q9jr&b1,(F@
+>GZ51cIHL1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU1,'hF@<*JG0JPI.0ek^F0fh'K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!Y
A0=WiD.7's3Zp7%+@KX[ANCqh0Ha(uEZd+k0fC./0fh-L3\`W%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ0K0=G$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU3?Uq&DBL\g0fL41
0fh$L3]/Z"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+?:Q:@;[2C0JPL/1,1gF1HI6J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>Y,_6t(1K3ZpF*8muT[1,(FA+>PZ41GCjD2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F3\`Dt$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pes7V-$O1,(FA+>G]61bh$I
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2'>A"
@N[E[0fL401cdKJ3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Pes7V-$O1,(FA+>G]62)REP2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402**EF3\i]&$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pes7V-$O1,(FA+>Gc81-%BO3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,U1DARZc;
0JPL/0fD'K0KLpB$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>GSn
+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS0esjo6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp1:+@]pO+>PW*2]sk03]&WR1c#IG
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp1:+@]pO
+>PW*2]sk03]&]T2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS
0f:'r6t(1K3Zp1:+@]pO+>PW*2]sk03]/WQ1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH
+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[0fL410fh$C3]/c%$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,pCGARZc;
0JPL/1,1gE1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_
ATBgS1*@]-@<?'A+>Y-7@<*JG0JPL/0fV3M2EEQJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GVo9jr&b
1,(FA+>G]61,(aE0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.4+AH9b+>PW*2]sh33\rTR1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*B;"EZd+k0fL401cdEN3\iZ%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0eskG
@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+>GVo9jr&b1,(FA+>G]61c%0K2$sZt:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.5+AH9b+>PW*2]sk33\W6K0KBII
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg
1E]D#EZd+k0fL411HI3K3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GYp9jr&b1,(FA+>P`61,1gH
3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[
ANCqg1E]D#EZd+k0fL411HI9K3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>GYp9jr&b1,(FA+>P`61H@KR2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL41
1HI?K3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+>G\q9jr&b1,(FA+>PZ40ek^C2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg1a#M$EZd+k0fL410fh'I3]&f'$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>G\q9jr&b
1,(FA+>PZ41,h6K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>G\q9jr&b1,(FA+>PZ41H.?O3=6*#
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqg
1a#M$EZd+k0fL410fh-F3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t3?TG4@<?'A+>G\q9jr&b1,(FA+>PZ42).-H2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0I
3\iGt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,
@<?'A+>G\q9jr&b1,(FA+>PZ42)dQP0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqg1a#M$EZd+k0fL411-.*E3\`>r$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>G_r9jr&b1,(FA
+>PZ41,1gE0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL410fh-K3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GVo9jr;i1,(FA+>P]50f1pI0a\6p:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg2'>V%
Gp"jr0fL402``fU3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u2]s52@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J1^XQs:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lR3\iDs
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A
+>Gbs9jr;i1,(FA+>Gi:1cRNQ1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqi+A-co+>PW*2]sh13]&`U1H5^K$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD
1cdHK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q
6t(1K3Zp1<+B)ij+>PW*2]sk03\W9L1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU2'>M"DBL\g0fU:13'&fK3]/Su$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+>Pht8muT[1,(FB
+>P]51c%0K0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@
+>Fu]6t(1K3Zp19+A-'[+>PW*3$9t33]/ZR1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:21HI3G3]/Z"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,g=J@;[2C
0JPO00etdG3BAiN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS1a!o/@<?'A+>Pku8muT[1,(FB+>GW41cRNM2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp17+@]pO+>PW*3$9q03\WBO0f]RJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b
+>PW*3$9n83]/`T2)u!N$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp@(+@KX[ANCqg2'>V%EZd+k0fU:13'&cO3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU2]tD*EZd+k0fU:10KM'M3]/`$$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU2]tD*
EZd+k0fU:10fh!G3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp@(6#^ie1,(FB+>GT30etdD3=6*#
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqm
+@0se+>PW*3$9q13\`KQ1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.5+<X'\FCdKU2]tD*EZd+k0fU:10fh$I3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB+>Gi:0ek^F
0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[
ANCqg0H`Z#EZd+k0fU:13'&cN3]/]#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>Gl!6#^ie1,(FB+>Gi:1Gh-I0a\6p:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1E\u&EZd+k0fU:2
1HI6L3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[
ANCqh0d'2!Gp"jr0fU:13BArS3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&
+AR&r@V'R@+>Gl!+@KX[ANCqh0d'2!Gp"jr0fU:20KLmG3\WAt$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'2!Gp"jr0fU:20KLsI3]&f'$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp16+AH9i+>PW*
3$9t23]&WR0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-
@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3b
Ch+Y`F_tT!E]P=!+<X'\FCdKU1,C%I@<itN0JPO01,:mF2**NP$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh1E]D#Gp"jr0fU:21-.0F3\iAr$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp16+AH9i+>PW*
3$9t33\iWT0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3b
Ch+Y`F_tT!E]P=%+<X'\FCdKU1,^7L@<itN0JPO00fM-I3BAoQ$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2BY_&Gp"jr0fU:13'&fM3\WH!$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:+AH9i+>PW*
3$9q83\`NR0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp1:+AH9i+>PW*3$9q83\iNQ1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS0ejdn6t(1K3Zp1:+AH9i+>PW*3$9q83\r]U1,0+C$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1:+AH9i+>PW*3$9q93]/WQ1b]7D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpL+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp1;+AH9i
+>PW*3$9n83]/fV2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.5+<X'\FCdKU1-$IO@<itN0JPO00fV3K0KLsK$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp44+AH9i+>PW*3$9q83\`?M1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU
1GL"H@<itN0JPO00fV3L2EENN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!n
Bl%<&:3CD_ATBgS0f:'r6t(1K3Zp45+AH9i+>PW*3$9q93\`NR0Ja%C$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1*B23DBL\g0fU:10fh0P
3\iN!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52
@<?'A+>P'3F`&<W0JPO00etdD3'&iT$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp1#8p,"o1,(FB+>GW40f1pF1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh1E];4DBL\g0fU:1
0fh'G3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<u
0H_K+@<?'A+>P_q8p,"o1,(FB+>GT31bq*L2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh2BYV7DBL\g0fU:13'&oN3\`N"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqi0H`u1
DBL\g0fU:11-.*F3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&
+AR&r@V'R@+>P_q+@KX[ANCqo+A-cm+>PW*3$9q83]&]T0K9CH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3ZpF*8p+qm1,(FB+>Gi:2)%'F
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u2'=#0
@<?'A+?:Q:F_i0U0JPO00f_9L0KM!H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
/S6+J6?R!YA0=WiD.7's3Zp19+<X'\FCdKU3?Uq:C`kJe0fU:13BAlT3\`W%$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNbF_PZ&+AR&r@V'R@+>Pku+@KX[ANCqh3?UV1B-8r`
0fU:12```N3\iGt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNbF_PZ&+AR&r
@V'R@+>Po!+@KX[ANCqi+AZKh+>PW*3$9q33\iKP1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpM+>"^HATfY@+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp4$:LeJh1,(FB+>GZ51,h6O2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8FtIJP+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A
+>t?<@rrhK0JPO00f(jF3'&fP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO
6?R!YA0=WiD.7's3Zp45+<X'\FCdKU2BYe*F<E=m0fU:11HI9H3\iAr$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+?1K>@rrhK0JPO00fV3M
1HI6E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1G^-r
6t(1K3ZpF*:LeJh1,(FB+>Gl;1,1gG1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqo+AZKh+>PW*3$9q93\iQR0f9:F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0eskI@rrhK0JPO0
0fD'K3'&lQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS
1H$?u6t(1K3Zp.4+AZKh+>PW*3$9q73]&WR2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM
+>"^HATf1=6?R!YA0=WiD.7's3Zp4;+<X'\FCdKU0eskI@rrhK0JPO00fM-N3'&lQ$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1H6L"6t(1K3Zp.4+AZKh
+>PW*3$9t43]&iX2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+<X!nBl%<&:3CD_ATBgS
1H?R#6t(1K3Zp.5+AZKh+>PW*3$9n73]/lX1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM
+<X!nBl%<&:3CD_ATBgS1b^$p6t(1K3Zp.6+AZKh+>PW*3$9q13\iWT2)P^J$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpM+<X!nBl%<&:3CD_ATBgS1bg*q6t(1K3Zp.6+AZKh+>PW*3$9q13]/TP
0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+<X!nBl%<&:3CD_ATBgS1bp0r6t(1K3Zp.6
+AZKh+>PW*3$9q43\`<L1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqh2]tn+F<E=m0fU:12**KN3\WN#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU2BYb5Fs&Oo0fU:11HI?L3\rc'
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU
3$:h%DBL\g0f^@13BAoS3]&]$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3b
Ch+Y`F_tT!E]P="+<X'\FCdKU0ejeC@;[2C0JPR10f(jE1cd<M$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GSn8muT[1,(FC+>Gc81GV!H
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K
3Zp16+A-'[+>PW*3?U%73\W9L0K0=G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh1a#D!DBL\g0f^@21HI6M3\iAr$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,pCK@;[2C0JPR10f1pI
2**NN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4
@<?'A+>Po!8muT[1,(FC+>G]62*!]P1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh3$:h%DBL\g0f^@22**EF3]/i'$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Po!8muT[1,(FC
+>Gc80JbaD0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqh3?Uq&DBL\g0f^@23'&oR3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>GSn7V-$O1,(FC+>GT31c7<J2@9cu:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqg0d&qs
@N[E[0f^@22EEQH3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`
F_tT!E]P<t2'=#0@<?'A+>GVo7V-$O1,(FC+>GT30JGOA0FA-o:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1*B%t@N[E[0f^@21cdHI3\`K!
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A
+>GVo7V-$O1,(FC+>Gi:1,1gI2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqg1a#8!@N[E[0f^@13'&cQ3\iDs$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P3$9>1F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqg1a#8!@N[E[0f^@21-.-I3\WDu
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9>1F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#8!
@N[E[0f^@21-.-L3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9>1F_PZ&+AR&r@V'R@
+>PYo+@KX[ANCqg1a#M$EZd+k0f^@20KM!I3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*3?U%13]&ZS2)5LG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>G\q9jr&b1,(FC
+>GT30etdH2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!
+<X'\FCdKU0f1"I@<*JG0JPR10ek^D2``fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1a#M$EZd+k0f^@23'&fT3\W8q$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.6+AH9b+>PW*3?U%9
3\r`V0ej"B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>G_r9jr&b1,(FC+>>c92)mWS2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J@<*JG0JPR10KD0K2EEQN$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg2'>V%EZd+k0f^@21HI6F
3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp.7+AH9b+>PW*3?U%43\rKO0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0ea^m6t(1K3Zp.7+AH9b+>PW*3?U%53\`KQ1H>e7:IJ/X:J=\R<CokP84c`Z
:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\
FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U0JPF-0ek^E1cdBM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3?TG4@<?'A+>G_r8p+qm1,(F?+>>f:
2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2D?6r
6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6C`kJe0f:(.0KLmE3\rZ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=9+<X'\FCdKU0fL4IF_i0U0JPF-
0ebXG3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
1E[f.@<?'A+>Get8p+qm1,(F?+>GW41H7EL2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2DcO!6t(1K3Zp.9+A-cm+>PW*2'=V/3]&QP1,fOI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u)"+@KX[ANCqg2]t_8C`kJe
0f:(.1cdBK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2]s52@<?'A+>PYo8p+qm1,(F?+>GT30K2$J1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E2g%6t(1K3Zp14+A-cm
+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>u5&+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@8+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0d%T,@<?'A+>P_q
8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm+>PW*2'=V23\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?))!+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r`&
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@<+<X'\FCdKU
1,L+GF_i0U0JPF-0f;!K3BB#S$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=%2'=#0@<?'A+>Po!8p+qm1,(F?+>G`71cRNM1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`;d$6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ
0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)5%+@KX[
ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fP$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-3'&iO
3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqi+@1-_+>PW*2'=S53\`QS0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$6$6f_1,(F?+>GQ21,_0L1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArR
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU
1E\u+B-8r`0f:(.0fh*G3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.3]&]T0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp4$6$6f_1,(F?+>G`70JkgJ1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y-+
F_;gP0JPF-0fD'L1-.*L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU2'>2-B-8r`0f:(.2EETP3]&`%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU2'>2-
B-8r`0f:(.2EEWS3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU2BY;.B-8r`0f:(.0KM$N3\`Gu$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU2BY;.
B-8r`0f:(.0fh$H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp.7+<X'\FCdKU2BY;.B-8r`0f:(.0fh'H3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU2BY;.B-8r`0f:(.2EE]O3\`;q$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU2BY;.
B-8r`0f:(.3'&iN3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU2]tD/B-8r`0f:(/0fh-I3\i]&$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp13+<X'\FCdKU3?UV1
B-8r`0f:(.0KLsE3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KM'H3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*2'=S43]&iX0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GPm6$6f_
1,(F?+>>f:0f(jH1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmL+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0eje:F_;gP0JPF-0K;*M2``]R$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`
0f:(.1cdHN3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp.4+@1-_+>PW*2'=V13]&fW1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<G+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K1cd<H$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg+B)ij+>PW*2'=V3
3]&QP1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>k9;@rrhK0JPF-0f1pG1-.-D$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0H`hr@N[E[0fC./1cd?I3]/f&$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#M$EZd+k0fC./1HI?O
3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqh0Ha(uEZd+k0fC./0fh*F3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&
6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh0Ha(uEZd+k0fC./0fh-L3\iAr$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh0Ha(uEZd+k0fC./0fh0H
3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K
3ZpF*8muT[1,(FA+>PZ41,(aC2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU3?Uq&DBL\g0fL410fh'G3\`N"$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3ZpF*8muT[1,(FA+>PZ41GCjD2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,U1D
ARZc;0JPL/0f1pF0fh$I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqh2'>A"@N[E[0fL401cdHJ3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp18+@]pO+>PW*2]sh33]/TP1GoLH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pes7V-$O
1,(FA+>Gc81GCjF2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1,U1DARZc;0JPL/0fD'L1cdBN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2'>A"@N[E[0fL402``WK3]/l($49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,g=FARZc;
0JPL/1,(aG1HI?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!
E]P<t0d%T,@<?'A+>Pku7V-$O1,(FA+>PW31c7<O2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1:+@]pO+>PW*2]sk03]/WQ1H,XJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A
+>Po!7V-$O1,(FA+>PZ40ebXG2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^H
ATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[0fL410fh$G3\rT"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-7@<*JG
0JPL/0fV3M2EEQL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Y,_6t(1K3Zp4$9jr&b1,(FA+>Gi:1c7<L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1*B;"EZd+k0fL401cdBG
3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*B;"EZd+k0fL401cdEN3\iZ%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A
+>GVo9jr&b1,(FA+>G]61H7EP1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg1*B;"EZd+k0fL401cdHL3\rZ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>GYp9jr&b
1,(FA+>P`60JGOB0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp@(+@KX[ANCqg1E]D#EZd+k0fL411HI3K3]/`$$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>GYp9jr&b1,(FA+>P`6
0fD'M1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg1E]D#EZd+k0fL411HI9G3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.5+AH9b+>PW*2]sk33\iQR1GB.C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,
@<?'A+>GYp9jr&b1,(FA+>P`61H@KR2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f'qH@<*JG0JPL/1,CsJ1HI6I$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg
1a#M$EZd+k0fL410fh$D3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b+>PW*2]sk13\iQR1cYmM$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>G\q9jr&b
1,(FA+>PZ41,h6K1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.8+<X'\FCdKU0f1"I@<*JG0JPL/1,1gG1-.9N$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqg1a#M$EZd+k0fL41
0fh*L3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0fU9u6t(1K3Zp.6+AH9b+>PW*2]sk13]&NO1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>G\q9jr&b1,(FA+>PZ42)73J
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI2```L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqg1a#M$EZd+k0fL411-.*E3\`As$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K
3Zp.7+AH9b+>PW*2]sk13\iEN0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>GVo9jr;i1,(FA+>PZ41c7<M0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0eskG
@<itN0JPL/1,:mF1cdEI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqg2'>V%Gp"jr0fL402``fU3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp.8+AH9i+>PW*
2]sh73\rQQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<u2]s52@<?'A+>Gbs9jr;i1,(FA+>Gi:1c7<L0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0fC.K@<itN0JPL/0fV3N
3'&lQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pr"+@KX[ANCqi+A-co+>PW*2]sh13]&`U1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>Po!8p,"o1,(FA+>PW30f1pJ1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\
FCdKU1-$IUAT/bI0JPL/1,(aC0fh'E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqk+A-'[+>PW*3$9q83\iBM2),FF$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,^7I
@;[2C0JPO01,:mI1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp19+A-'[+>PW*3$9t33]/ZR1G]@F$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,^7I@;[2C0JPO0
1,CsF1HIBL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r
@V'R@+>Y,_6t(1K3Zp1:+A-'[+>PW*3$9q23\rcW0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,g=J@;[2C0JPO00etdH3'&`P
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a
6t(1K3Zp17+@]pO+>PW*3$9q03\WBO1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1E]D#EZd+k0fU:03BB#T3\W5p$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>G_r
9jr&b1,(FB+>Gi:0f;!L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*3$9q03]/iW2)P^J$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU2]tD*EZd+k0fU:1
0fh!G3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS0ea^m6t(1K3Zp@(6#^ie1,(FB+>GT30ebXE2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU2]tD*EZd+k0fU:10fh$E3\`;q
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0esjo
6t(1K3Zp@(6#^ie1,(FB+>GT30f;!K3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU2]tD*EZd+k0fU:10fh$I3\rZ$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.2
+@0se+>PW*3$9q83\`?M1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>GPm6#^ie1,(FB+>Gi:0f1pK1C=Hr:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f^@BE,m'V
0JPO00fV3M1cd?H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh1E\u&EZd+k0fU:21HI6L3\`;q$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nG@<itN0JPO00f_9N2EEZN
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A
+>PYo9jr;i1,(FB+>PW30K(sG2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!n
Bl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*3$9t13\iTS1cYmM$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp16+AH9i+>PW*3$9t23]&WR
0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp16+AH9i+>PW*3$9t33\W?N1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp16+AH9i+>PW*3$9t33\`KQ1H,XJ$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp16+AH9i+>PW*3$9t33\iEN
1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>k8a6t(1K
3Zp16+AH9i+>PW*3$9t33\iWT0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-
F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp17+AH9i+>PW*3$9q83\iWT1cYmM$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp19+AH9i+>PW*3$9q73\WQT
1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?1Jd6t(1K
3Zp19+AH9i+>PW*3$9q83\iHO0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-
F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:+AH9i+>PW*3$9q83\`NR0ej"B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]th'Gp"jr0fU:13'&fO
3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3Zp.3+<X'\
FCdKU1,g=M@<itN0JPO00fV3M2``]L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i1,(FB+>Gl;2).-K0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpL+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp1;+AH9i+>PW*3$9n8
3]/fV2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!
E]P<t1E[f.@<?'A+>Pr"9jr;i1,(FB+>Gi:0ebXD3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1GBqG@<itN0JPO00fV3K0fh*G
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q
+@KX[ANCqi0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp45+AH9i+>PW*3$9q93\`NR0Ja%C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A
+>P'3F`&<W0JPO00ek^H3BAoQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh+A-co+>PW*3$9q23\WNS1H>dL$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>P'3F`&<W
0JPO00etdE1cd<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gl!+@KX[ANCqh1E];4DBL\g0fU:10fh'G3\iAr$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp16+A-co+>PW*3$9q1
3]&TQ2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!
E]P<u0d%T,@<?'A+>Pht8p,"o1,(FB+>Gi:2)%'G2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp44+A-co+>PW*3$9q23\W?N
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@
+>P_q+@KX[ANCqo+A-cm+>PW*3$9q83]&]T0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqo+A-cm+>PW*3$9q83]/TP0JWtB
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pes
+@KX[ANCqo+A-cm+>PW*3$9q93\`<L1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqo+A-cm+>PW*3$9q93\`WU1,'%B$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNbF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqh3?UV1B-8r`0fU:12```N3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3
+Co&,/SQ=M6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU1E]J'F<E=m0fU:11HI9I3\iJu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU
1E]J'F<E=m0fU:11HI9M3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
/ScIO6?R!YA0=WiD.7's3Zp44+<X'\FCdKU2BYe*F<E=m0fU:11HI6M3\iT#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's3Zp45+<X'\FCdKU2BYe*
F<E=m0fU:11HI9H3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!n
Bl%<&:3CD_ATBgS1GU'q6t(1K3ZpC):LeJh1,(FB+>Gi:1G_'H0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU3?V+-F<E=m0fU:1
3BAoM3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_
ATBgS1Gg3s6t(1K3ZpF*:LeJh1,(FB+>Gl;1,V*I2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0eskI@rrhK0JPO00fD'K3'&lR
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ynu
+@KX[ANCqg1*BA&F<E=m0fU:12``cO3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp.4+AZKh+>PW*3$9q73]/lX1c,OH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!3$9>3@<?'A
+>GVo:LeJh1,(FB+>P`61c[TS1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+<X!n
Bl%<&:3CD_ATBgS1H?R#6t(1K3Zp.5+AZKh+>PW*3$9n73]/lX1,fOI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BX,/F_PZ&+AR&r@V'R@+>bbp+@KX[ANCqg1a#S(F<E=m0fU:10fh'K
3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!&6?R!YA0=WiD.7's3Zp76+<X'\
FCdKU0f1"K@rrhK0JPO00ek^H0KLmB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
+@:3bCh+Y`F_tT!E]P="1*@]-@<?'A+>G\q:LeJh1,(FB+>G]60ebXE0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2]tn+F<E=m
0fU:12**KN3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&
:3CD_ATBgS1*@]-@<?'A+>t?;Dg!6Y0JPO00f(jI1cdEQ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3ZpC)8muT[1,(FC+>>f:1,h6N
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp7%
+@KX[ANCqg0d'(sDBL\g0f^@21HI3H3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GSn8muT[1,(FC+>Gc81GV!H1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh
1E]:uDBL\g0f^@22EENH3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,
+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pbr8muT[1,(FC+>GZ50fV3L0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh3$:h%DBL\g
0f^@21cdEM3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>Po!8muT[1,(FC+>G]62*!]P2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,pCK@;[2C0JPR10f;!G
0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GSn+@KX[ANCqh3$:h%DBL\g0f^@22EENJ3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1<+A-'[+>PW*3?U%93]/`T0f04E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.
@<?'A+>GSn7V-$O1,(FC+>GT31c7<J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO
+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0eje?ARZc;0JPR10fD'I0KLsH$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqg
1*B%t@N[E[0f^@20fh!B3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,
+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.4+@]pO+>PW*3?U%53]&NO0fB@G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>GVo7V-$O
1,(FC+>Gi:1,1gI2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.:+<X'\FCdKU0f1"BARZc;0JPR10K;*J2``]K$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B9&A+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>G\q7V-$O1,(FC+>GW40f;!G
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K
3Zp.6+@]pO+>PW*3?U%33\`TT0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*3?U%13\rWS0fKFH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*
3?U%13]&ZS2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.6+AH9b+>PW*3?U%23\`BN1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.6+AH9b+>PW*3?U%23\`QS2)5LG
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp.6+AH9b+>PW*3?U%93\i]V0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.6+AH9b+>PW*3?U%93\r`V0es(C$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.7+AH9b+>PW*
3?U"83]/lX2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.7+AH9b+>PW*3?U"93\`NR0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.7+AH9b+>PW*3?U%43\`?M0f04E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp.7+AH9b+>PW*3?U%43\rKO0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg2'>V%EZd+k0f^@21cd?K3]&MtC2[X%Ec5Q(Ch5@V
:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#
E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUr
F"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOABHVD1AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S
:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'
+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(C
A7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/
+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCn
G%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C
67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*
FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*o-
FCcS:D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p
$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)
+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?%15is/g+SFFD,T53Zq%5BPnq\/g*JhCLqMq$;No?+D#Cu
Bl#gQ+C\bpATDNr3B9?;D..-p/n8g:%13OO:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2
+E)-,$997j1bg+W+>F<4%15is/g,"FDJ<s1D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47G9D0VH$O7D
A7Qfn@<?(%+=M;BAKY`+A79+^.1HVE+Z_>4+BosJ%13OO:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+
Deru-F(or3+>"^EF`_P=@<?3n+D,P4+Dbb0Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;
67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et+DG_7FCB&s
AISuWE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*
+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7
EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l
$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1
F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.
De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%
+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[
+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaECER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo
%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>
+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn
+=LuCA92*lC2[Wi.3NMHF<GX9F=.M):J48O:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:Wmk
A7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$
+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k
?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\
C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A
+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6i
De*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC
+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6
%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)
+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/
$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(
+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:
DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+
8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2
FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5
F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4
D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@
-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$
4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<
@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is
/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX
%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eI
E"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIa
FE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?
+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC
3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5
+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KP
ASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:
DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&
Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.
Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7
DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7
C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YF
HQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%
4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//
-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAO
Eb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo
:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@
$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'
+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.
@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\f
A7$Hs4Y@jtAThu7-RU$ID_</M+ED%8F`M@P+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"E
Ddmc74s4`+/q#?i%14Nn$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[
FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa
%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k
4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8
+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;%13OO:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(n
Ea`I"ATDi$$?0p(FCSumEcXB)><3le+Z_P)-S$\t.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"
GB4mCF^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+
2]sMW/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g2
3ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.
+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e
@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%
0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*
@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MAS
Bl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(
HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-
0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>
F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2
-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT
/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n
.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU
@:O=rF!+n/A0><%F)PQ&@<?''@rGmh%173!4ZZjk4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG
/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K
:-pQU.P>RHEbf3(GA[isD/h^">p)3O1GC"[+D`05F<D\K:-pQU.P>d^C^g_gGWe)n+?L]$1*U'J
4!80X+<Ve%67sB1/p(ZL%13OO:-pQUIW]^CE\DNGD/^V9@VTIaF<G[:G]Y&[+Co%q@<HC.+DN$?
@rc:&F:ARqF$2Q,-Y[=:-RL*"+?CVn><3mAE+*j%+=DV\F(KAFFCf<.0..kn+=JT[-QjunINVoF
+=nW_/ghbm+=A9Z+>#3p+Bp9($6Tcb:-pQUEb/Zi+EV1>F<G19Df$V3+E_a:EZfI8D/^V.Bl[cp
FDl2F%16il4ZZe.+ED%%A0>f3%143e$;No?+<YK=@:UKq+EM%5BlJ/:Ao_g,+DN$AF(KA7FCf<.
%16id4ZX]60HiJ2.6qWi%13OO:-pQUCi<`m+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>V0E+*j%
%16ih4ZX]i3Zp+"3\V[\3ZpO-C2dU'BFP:X$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,
+Eh16BlA-8+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP
:I7uC3Zp.2%13OO:-pQUGA(Q.AKYDu+A!\uF(Jl)@X0);Df'&.D.-ppDf[%E@;L'tF!)iSDfTV@
+E)9C-YRF8AL@oo:-pQU=%GbX76sX>4ZX]5GAhM;-OgCl$;No?+CoV3E$/\3Bm+&1/Kf1WARlom
Gp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM
$4R>;67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'
DKH<p:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E9
05>E9E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K
@:O=r+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+A,Et
+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?@<6!-
%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBoDg*=G
D]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9+E_WG
@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is/g)kk
EbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<+BosE
+E(d5-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1D..<rAn?%*C2[W<
0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`
78d&U:JO&6-S[5-/heD"+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],c
DBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!
%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7
Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16ig
A7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--
DJsW.F"VQZF:ARlDe*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&Ik
De*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9B
F:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G
76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c
$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0
B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8
A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@
+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,
C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k
+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#
D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,
+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2
+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45
+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/C
AKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZ
AKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=
+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"
+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-
F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2
-OgD`78d&U:JO&6+=Aiq3A*<P3%#.B7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ9L2WI
:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9B
Et&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8X.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\
4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<
AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m
%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A
@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(
Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.Q
Bl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70J5%%/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9
F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImis
CaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iC
Bkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`Z
DImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+
@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)
F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08
/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(
CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m
+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%ht
F*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:
ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5
Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG
+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A
@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC
-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1
%14j>+B!?"+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P
6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>
F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<
@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3
Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%13           ~>
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
<)6:`;cZU\+A,Et<_Yt)@V97o+C\tpFC])qA8bs#@V97oA8bt#D.RU,+C\tpFCf]9Cgh$q+C\tp
FD#Z:AU&;>@V97oDdmHm@ruc7@V9auBleA=@W$"'ARTUhBHUeuARfLb@:O(#.4cl0/3G:mATU=S
@ru:,FAm$pCLo1R-RgSp4=iTBC2[X(FDl22-RgSp4>8$7.4cl04?G0&0d%hd8l%iA<CokP84c`Z
:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+DPh*E,ol/Bl%?'D..<rAn?%*C2[W*D..<rAn?%*C2[Wn
De!p,ASuT4D..<rAn?%*C2[X(Dfp)1ALAoX-p07-0f1.20JPRA1GL^=2`EWP1,:^F3?U(20f^pD
0f1LA2`<NK1,UsM+>PW*3A<6D1bL^G2Dm6F2)[H;1,(FC0JbF?/iP^I2)7-G0JO\*0JPRA1GL^=
2`EWP1,:jF2]sk00f^pD0f:R@1GUmI3A<6L+>PW*3A<6D2(gaG1GgdD2_[!01,(FC0JbF@/i>UG
3&<9K1,pC30JPRA1GLa>2)mEI2)I'I0d&5*0f^pD0f:R@3&`cV0JkaH+>PW*3A<6D2(gaG0f:jD
3&E?41,(FC0JbF@/i>XC2`*EL0d&5*0f^pD0f:R@1c[9N2)mQU+>PW*3A<6D2(gaC2D?mC3A`H5
1,(FC0JbF@/i>XG1,1LA2E2g70JPRA1GLa>2*!KK0ekRE3$9t10f^pD0f:R@3A`KG0fCpL+>PW*
3A<6D2(gaH1bpdC2Dd<71,(FC0JbF@/i>XG1,1O<1H-F30JPRA1GLa>2*!HM0etXB3$9t10f^pD
0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG2)mBH3&3H91,(FC0JbF@/i>UH0JG=C2_lL20JPRA1GLa>
2)mNR3A<9L2'=Y.0f^pD0f:R@3&<?I1,:aJ+>PW*3A<6D2(gaH3&`NH1cI971,(FC0JbF@/i>RE
2`EQQ2DH=00JPRA1GLa>2)[-D1,:R@0e"Y%4>JTF3A<6D2(gdD1GL[?0JYX=0J5%51H.<M1Gh$K
1,_-J1c7!E3%AVp1*A;#/1<V90JPRA1GLa>2)I3J1H@3E0e4q10Jk[C1H7<P1,V!F0K:sM3&E+!
/i"P(.4cl00I/>$/1<V=+>P2t0JPRA1GL^=2`EWP1,h3J2'=Xs1,(FC0JbF@/i,IE3AiZN1,g=1
+>PW*3A<6D1bL^G2Dm6F2`*?61E\G,0f^pD0f:R@3A`KG2)[9L+>P&p0JPRA1GLa>1H76P2)R3G
2]sgt1,(FC0JbF@/i>XG1,1LC2'=\(/1<V7.4cl00I\P$4>838-p014/3GW               ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
