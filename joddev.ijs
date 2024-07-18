NB. sha256:a6c714bbca28e0b31f742d9562c6f0e7fe16f3b265466010ef02a334e635213d
NB. JOD dictionary dump: 18 Jul 2024 08:36:09
NB. Generated with JOD version; 1.1.3 - dev; 4; 17 Jul 2024 10:36:06
NB. J version: j9.6.0-beta13/j64avx2/windows/commercial/www.jsoftware.com/2024-07-02T10:16:57/clang-18-1-6/SLEEF=1
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


ERR032=:'hash does not match ->'

ERR033=:'invalid dump file ->'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.3 - dev';4;'17 Jul 2024 10:36:07'

JODVMD=:'1.1.3 - dev';4;'17 Jul 2024 10:36:06'

OK011=:'hash matches ->'

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
NB.   NB. NIMP: check dump script hash
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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H-F7+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P\p1a"M18U=!)6tpO\ATDBk@qB.gEb-@c
:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX
:IK;CDesJe:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)
Bl8$(Eb8`iALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\
8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'t
@;BFk@;BFq+A*bt@rc:&FE7                                                   ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o3$9q03&YV^CLp%FF(f&sCK#(gCLo1R:-pQ_D..3k87?RQ@q]XVD/X3$0JFVk/M/(n
D..3k.3N;4F(c\+BOt[h+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>>5e.!0$AFD>`)0JP"!A8,OqBl@ltEd8d=G\M5@F!+n/A0>T-+Dbt)A7]9\$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JYJ"F_ick%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*
-[nZ`6rZTR<$r+^%16T`@s)g4ASuT4C2[X)ATMs0De!3lAKW?d5s]?rCLp%FF(f&sCK#(gCLo1R
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm
@rsjp+=D8BF*)/8A2#_c%13OO0fL4<+@nds87,e?De*2a$4R>;67sBpDK]H)Bk/>pEbBN3ASuU2
%16uaEZd(q+DkP&AKW?J%16uaEZd(q+DkP&AKWZ9$>sEq+>GetD..3k+=D#7CLnW*Gp$X+Gpa%.
DImi20fL4l@;BEs@6+i)DImi20fL4l@;BEs-Y#1jFD,B004np7AM7b=05YEEF(oN)05b3/@4l8/
F!hD(DImi20fL4l@;BEs?SN[E3ZodmFD,B0+DGm>F*VV3Des,t-OgE#ATAnO2Du[p@;BEs-SJqI
D_GdBD_GR6FCSu:Bkh]:%13OOATAo3A0<rpFC])qF:AQd$;No?+CoV3E$/\*@ruF'DIIR2%16WX
4ZX^&@;BEs-RT?1%15is/g+Y;ARfKuBOPsq%16Ze+@nds87,e?De*2tD..3k+?Op2A7c8X%15is
/g+S=FCfJ8A9Da.+D,>(AKWQIGA1l0+Cf(nDJ*N'BOPsq%16QiFCfMV3ZrHS@:UKBHTG\L%13OO
:-pQU@q]:gB4W3,Df'&.@X3',Et&IcH$!V=4ZX]5.OQ>e5;=i7,9S4?H$!V=.=E=JH$!V=%14g4
>9IC#FCfM9GB.D>AKX']3b2h3$4R>;67sBo@<6*)GA1l0+Du*?Ci=3(ATAo1@<?!m%16uaEZd(q
+DkP&AKX']3b2h3$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?XaWF*)5:@ps1b?YO7nA7#                          ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;2+>Pro@;BFF@<6*lBPUO`Deio<0IUdHCLnq;BOPsq+Cf(r@r!3.D/X3$+EV19FE7~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`;d;+>Y,p2'=Xs0ekIE2BXb/+>P&o1,(FC+>GSn1*AA/1c?I20H`+n1-%3J0d&2*+>P&o2)@06
0f^@3+>GQ*2'=V4+>P&o1H%$]:IINL8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp+6+A-'[+>PW+1a"M03\`BN2)5LG$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[
1,(I?+>G]61,CsH0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU0f^@K@;[2C0JYI-0f(jI1HI6E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg3?Uq&DBL\g1,L+.1HIBO3]/f&$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.;+A-'[+>PW+
1a"M13]/lX2)#@E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0ea^m6t(1K3Zp13+A-'[+>PW+1a"M.3\`TT2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp13+A-'[+>PW+1a"M.3]&QP0K'7F$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp13+A-'[+>PW+
1a"M/3]&QP1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f'pp6t(1K3Zp14+A-'[+>PW+1a"J43\`HP1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp14+A-'[+>PW+1a"J43\iNQ0KBII$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+A-'[+>PW+
1a"J43]&NO0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fC-s6t(1K3Zp14+A-'[+>PW+1a"M,3\W6K1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp14+A-'[+>PW+1a"M-3\r]U2)bjL$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+A-'[+>PW+
1a"M-3]&fW0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp14+A-'[+>PW+1a"M/3]&QP1c,OH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+A-'[+>PW+1a"M/3]/`T1,TCG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp14+A-'[+>PW+
1a"M03\rHN1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp14+A-'[+>PW+1a"M03\r`V0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+2+@]pO+>PW+1a"M13]&WR1,0+C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+3+@]pO+>PW+
1a"M-3\iEN1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,U0s6t(1K3Zp+3+@]pO+>PW+1a"M-3\iWT0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+3+@]pO+>PW+1a"M03\iBM1-#[K$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+3+@]pO+>PW+
1a"M03\rWS1H>dL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,pC!6t(1K3Zp+3+@]pO+>PW+1a"M03\r`V1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp+3+@]pO+>PW+1a"M03]&`U0ej"B$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp+4+@]pO+>PW+
1a"M,3]&`U2)kpM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1GL!p6t(1K3Zp+4+@]pO+>PW+1a"M-3\`<L0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+4+@]pO+>PW+1a"M03\iZU0fTLI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp+4+@]pO+>PW+
1a"M03\rNP1H,XJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heCj6?R!YA0=WiD.7's3Zp48+<X'\
FCdKU0JstBARZc;0JYI-0KD0O1HI6L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&
:3CD_ATBgS1Gp9t6t(1K3Zp+6+@]pO+>PW+1a"M,3\`BN1cPgL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heCj6?R!YA0=WiD.7's3Zp4:+<X'\FCdKU0JstBARZc;0JYI-0ebXC2``WK$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqf3$:\%@N[E[
1,L+/0fh!K3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp+9+@]pO+>PW+1a"P.3\rQQ0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#
+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>bt7V-$O1,(I?+>PZ42)dQM3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0K:1EARZc;0JYI-
1,:mG2**KH$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3Zp@(
+@KX[ANCqf3?Ue&@N[E[1,L+-3BB#X3]/o)$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8
Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+:+@]pO+>PW+1a"M-3]/oY1boCF$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>>eu7V-$O1,(I?+>GW4
0JY[G0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg
0H`hr@N[E[1,L+.0fh-I3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`F_tT!
E]P<t0d%T,@<?'A+>GPm7V-$O1,(I?+>GW40JPUG1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f1"BARZc;0JYI-0ebXC2**HL$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1a#8!@N[E[
1,L+.0KLsK3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Y,_6t(1K3Zp.6+@]pO+>PW+1a"M,3\rNP1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GVo6#^ie1,(I?+>>f:0f1pK1("?q:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0f'qH@<itN0JYI-
0ek^D3'&`J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp='
+@KX[ANCqh2]th'Gp"jr1,L+.0fh*J3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8
Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp+4+A-co+>PW+1a"M/3]/ZR1,0+C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>PVn8p,"o1,(I?+>G`7
1GV!J1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU1,0nDF`&<W0JYI-0K;*N0KM'I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU1,0nDF`&<W0JYI-0K;*N2EEWQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,0nDF`&<W0JYI-0KD0K
1cdEN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\
FCdKU1,0nDF`&<W0JYI-0KD0K1cdEN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,0nDF`&<W0JYI-0KD0L1HIBR$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,9tEF`&<W0JYI-0ebXB
3BAuU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\
FCdKU1,9tEF`&<W0JYI-0ebXD0KM$L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0K(%GF_i0U0JYI-0f;!L0fh*E$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0K(%GF_i0U0JYI-0fD'H
1-.6J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\
FCdKU0K(%GF_i0U0JYI-0fD'I2EEQN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0K(%GF_i0U0JYI-0fD'J2**NQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0K(%GF_i0U0JYI-0fD'K
1-.3G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU0K1+HF_i0U0JYI-0ebXF3'&`L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0K1+HF_i0U0JYI-0ebXG3BAiM$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K1+HF_i0U0JYI-0ek^C
1-.9O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\
FCdKU0K1+HF_i0U0JYI-0ek^H0KM!K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0K1+HF_i0U0JYI-0ek^H1cd<M$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+HF_i0U0JYI-0fD'J
1-.0G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\
FCdKU0K:1IF_i0U0JYI-0ebXC2EETO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0K:1IF_i0U0JYI-0f(jG1HI?Q$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0ea_BF_i0U0JYI-0ebXC
3BAuR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\
FCdKU0eskDF_i0U0JYI-0ebXG2EETM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=
6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0f'qEF_i0U0JYI-0fD'J1-.6J$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q8p+qm1,(I?+>>f:2)[KM0FA-o
:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqg1a#D5C`kJe1,L+.0KLpH3\`T$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(+@:3bCh+Y`
F_tT!E]P=!+<X'\FCdKU0f1"FF_i0U0JYI-0ek^C0fh$K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt6+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G\q8p+qm1,(I?+>GT30etdG1^XQs:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP151*@]+F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.6+A-cm+>PW+1a"M-3\`NR
1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"Ol6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1a#D5
C`kJe1,L+.0fh'G3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP7)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp.8+A-cm+>PW+1a"M/3]&NO1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/i+V%+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get8p+qm1,(I?+>>f:0f(jH1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0fL4IF_i0U
0JYI-0KD0O1-.3F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt7+>"^HATf1=6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqg2]t_8C`kJe1,L+.0KM!J3\WH!8l%iS:JXY_6<-TN6qBmJ<)6Cp1,TCG:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>Yq
8muT[1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[1,(I?+>G]61,CsH0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Gl!8muT[1,(I?+>GZ5
1c%0I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[1,(I?+>G`72)mWS0FA-o:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp13
+A-'[+>PW+1a"M.3\`TT2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0H`trDBL\g1,L+.1-.6H3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,'hC@;[2C0JYI-
0f(jI0fh'I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp14+A-'[+>PW+1a"J43\iNQ0KBII
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[
ANCqh0d'(sDBL\g1,L+-3BAuN3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nD@;[2C0JYI-0ebXB0KM!K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>PYo8muT[
1,(I?+>GT31H.?P3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0fU9u6t(1K3Zp14+A-'[+>PW+1a"M-3]&fW0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'(sDBL\g1,L+.1HI?I
3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>PYo8muT[1,(I?+>G]61GCjH0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp14
+A-'[+>PW+1a"M03\r`V0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf0d&qs@N[E[1,L+.2**QM3\iDs$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0JXb?ARZc;0JYI-
0ek^E0fh-H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+3+@]pO+>PW+1a"M03\iBM1-#[K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqf1*B%t@N[E[1,L+.1cdEM3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI3'&fS$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>Pn7V-$O
1,(I?+>G]61c@BL0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1GBpo6t(1K3Zp+4+@]pO+>PW+1a"M,3]&`U2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqf1E].u@N[E[1,L+.0fh$C
3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp46
+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>So7V-$O1,(I?+>G]61GV!I2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp+6
+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqf2'>A"@N[E[1,L+.0KLpD3]&f'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp+6+@]pO+>PW+1a"M,3\`QS
0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^
6t(1K3Zp+9+@]pO+>PW+1a"P.3\WQT1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp+9+@]pO+>PW+1a"P.3\rQQ0JNnA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp+9+@]pO
+>PW+1a"P.3]/iW0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp+9+@]pO+>PW+1a"P/3\iQR1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+:+@]pO+>PW+1a"J43]/oY
2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp+:+@]pO+>PW+1a"M-3]/oY1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+:+@]pO+>PW+1a"M.3\W<M1b]7D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0ea_>ARZc;0JYI-
0ek^G1HI9M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*F_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqg0H`hr@N[E[1,L+.1-.*D3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#8!@N[E[1,L+.0KLpG3\`K!$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1a#8!
@N[E[1,L+.0KLsK3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3Zp4$+@KX[ANCqg1a#8!@N[E[1,L+.0KM!F3\r`&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*Al%EZd+k1,L+-3BAlO
3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp:&
+@KX[ANCqg1E]D#Gp"jr1,L+.0fh$K3\W8q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]th'Gp"jr1,L+.0fh*J3\rJt$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf1E];4
DBL\g1,L+.1HIBK3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!Y
A0=WiD.7's3ZpC)+@KX[ANCqh0H`u1DBL\g1,L+.2**NK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh0d')2DBL\g1,L+-3'&oN
3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,0nDF`&<W0JYI-0K;*N2EEWQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PYo8p,"o1,(I?+>>f:0f1pI2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp14
+A-co+>PW+1a"J43\`HP1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh0d')2DBL\g1,L+-3BAoO3]/o)$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,9tEF`&<W0JYI-
0ebXB3BAuU$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t2'=#0@<?'A+>P\p8p,"o1,(I?+>GQ21,(aG3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+7+A-cm+>PW+1a"M13]/WQ1GB.C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[
ANCqf2BYV7C`kJe1,L+.2EENI3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0K(%GF_i0U0JYI-0fD'I2EEQN$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>>\r8p+qm
1,(I?+>Gc81,V*K3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS1,'gn6t(1K3Zp+7+A-cm+>PW+1a"M23\rNP1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf2]t_8C`kJe1,L+.0KM$M
3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU0K1+HF_i0U0JYI-0ebXG3BAiM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>_s8p+qm1,(I?+>GT30JY[H2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+8
+A-cm+>PW+1a"M-3]/TP1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqf2]t_8C`kJe1,L+.0fh0K3\WQ$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0K1+HF_i0U0JYI-
0fD'J1-.0G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u2]s52@<?'A+>>bt8p+qm1,(I?+>GQ20fD'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+9+A-cm+>PW+1a"M/3\iKP1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[
ANCqg0H`u1C`kJe1,L+.0KLpK3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^H
ATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0eskDF_i0U0JYI-0ebXG2EETM$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>GYp8p+qm
1,(I?+>Gc81,:mI1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!nBl%<&
:3CD_ATBgS1GU'q6t(1K3Zp.6+A-cm+>PW+1a"J43]/fV0ej"B$;No?+B*Q,FCf;M+A,Et<)6:`
;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>G\q
8p+qm1,(I?+>GQ21c%0I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,+<X!n
Bl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.6+A-cm+>PW+1a"M-3\W9L0fTLI$;No?+B*Q,FCf;M+A,Et
<)6:`;]n1b@rH4$ASuU$A3N1"+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A
+>G\q8p+qm1,(I?+>GT30JY[C1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/i"P$+Co&,
+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp.6+A-cm+>PW+1a"M-3\`BN1GfFG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00eP4(/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yr!+@KX[ANCqg1a#D5C`kJe
1,L+.0fh$I3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt6+>"^HATf1=6?R!YA0=Wi
D.7's3Zp4<+<X'\FCdKU0f1"FF_i0U0JYI-0ek^E1HI9G$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0fC.HF_i0U0JYI-0f(jI0KM!D
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0fL4IF_i0U0JYI-0KD0K1HI<J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP151E\7l
A7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0fL4IF_i0U0JYI-0KD0O1-.3F$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP151E\7lA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0fL4IF_i0U
0JYI-0ebXE2EENN$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6tA1hh=B.4s2
8l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NT
Bl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'J
AKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.S
Ec6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/
6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1
Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&
ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(IAS5^p/TboA
Dd?`[$4R=s/g+Oa?ZpX-AT]jh3+t<2GVOD`EHc2:D`D2_FC.4>+@C'bF(o/rEZeq<E,Tf3DJ()&
F_u(?F(96)E-*49@<6*)@q]F`CND$LAM.UJ/.Dq/+<Z,^IXV_5+<Ve%67sBjBOt[h+CoV3E$043
EbTK7+Cf>-FCf?3F!+n(@;0V#F<G7*F(c!i+<Vd]2]uRIC`mJ3@<?0*-[nZ`6pt$L:fB#iFD5Q4
/no'A-OgD*+<Z,^IXV_5%14jC+CI<=3&5"uDKTK70l8[YD`B\!1jC]rGr]JPG[EXB+@C'bF(o/r
EZee$A8,po+CQC)DfT]'FD5W*+E)4@Bl@l3FDi:0D..3k?m'Q)@<<W)ASu("@<?(%%144#+Co2,
ARfg)A7]@eDJ=3,Df-\0DfT]9+EqL1DBNe)CM@[!+EM%5BlJ08/g+,,AKYMtEb/a&+Co%qBl7X,
Bl@l3AoD^,%144#+DGm>D/XH++D#A#B45\"+CT.u+D>2)+EV:.+Dtn'AKYSr@<?X4AKYo'+<k?-
EHQ2ABl7Q-+EM77B5D-%Ch[cu+D#e:Ch[BnFE8uUAM.UJ%144#+F\cgILQW,+<XEG/g,.VDffQ$
+EMX5DId0rA0>H.E,95uBljdk+<VeIF*;)*@m)jq1E\_$-XC+.:/st]9gMZM,$uca/gr,!;H$Uk
<D6(8-7q8-9KFjM4?G0&1+"V;+?V_<?SWaL-OgD*+<XEG/g+\8+D,P4D%-gp+<Y]GG%>/oA7Rha
+FAGX?!o'U<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=4"akq-8%J)4?G0&1*CibI=2P3
+<VeUIXZ_T$6UH6<+ohc@rH7.ATDj+Df-\0Ec5e;F*(i.A79Lh+D#e:Ch\-.F<G[D+Co"*BlbD<
FE1f(B4uC!DfU&1Eb$;$F!,:;DJ'Cc+<Ve8F!,R<AKYMpAnc-sFD5Z2+CoD%F!,@=F<G^IAKYE!
Gp%$;+A+#&+ED%7ATDs*A0><$B6A'&DKI"=@;TRs/.Dq/+<Y'7+EelE+DtR>+<Wrm@q]:gB4W3%
Bkq9&FD,B0+EqaHCh+YsCiaM;Bl.ft@rri$C2[X!Blmp,@<?'g+C]J8%144#+E)F7Ea`d#+EqaH
Ch+Z*@;BEs8g%V^A7Zm$Bk(^p+EVNECi=6-+DGpM%13OO1G0eX4C9mREB/2&H#n'`EHO'Z2DTSm
@r,j72eR;@5%#L.ATo87F_t]1Bk&8r@<>q"H#R>9+CT.u+CQC&Df0`0EcYr5DBO(DBl%L*Gp$L)
/mof1Eb-A&ASH$p%144#+CSekARlotDBMOo3A*34-o*J31hpH:0JY("G@_n7Dg*=;@<Q2k$6UH6
?nZ53FCf)rE\T4]DKKH&ATBOZBl8$(B4Z*?04o$=@<?4$B/2,PCi<a(Bl7Q?04o$=@<?4$B/);P
+EqL1DIn!&EZfI;ATD?)@<,og$6UH6@q]:gB4Z-,FDi:2Bl7@"Gp$g=FCfK1@;L!-BlkJ3D/`on
FE8Qs:IHfX+A!r(AKYDtEb/ZiGp$d7F<G!7@rH7.ATDj+Df-\:Eb/`pF(oQ1+D#S6DfRH>$6UH6
<+ohcF(KB+@;I&sF_u(?AoD^,@<<W7F*1o-Cj@.IDfTW7+D5V,DJ()(DfU&1Eb$;%F`\`t+CT+0
@rH6pATD["A0>;iDfp.E@rc-hFD5W*%144#+CoV3E$043EbTK7F!,R<@<<W9Bl%T.DJsV>Ci<`m
+DG^9DerrqEZdssG%G]8Bl@m1/g+50Cht5-@<Q3)FDi:4AThd/AKZ&4D.Oi2@q]FjAISth+<YcE
+Cf>/AM,*#:K0bD+EM+*D0$hAD]i_%G%De*AS#a%AncL$A0>T(+DbJ.ATAnc+?;&4+C\o(@<4%1
$4R>!/g+Oa?T3:E1H0)0CM[`CGAC`.C,@VRH?4(DD)bld?m%gTDKBN&ATAo%A7TClB-:V*BOPsq
+E(_(ARfg)Amo1`Ch\!:+EV:*F<GdACht58FDl22+CQBk83ng_2)ZRj@<6*)GA(Q*+E2IFFD5W*
%144#+E(_(ARfh'/g*_.@;R-/BPD@"Bl7Q+@;^"*BOu3,DfBf4Df-\-De*E%?njTJ+EV:*F<GdG
F_kS2D.R-n+EMXCEb-A%+D>2)BHV52%144#+CK/2FC650EZfI8F*&O5+D>2)BHV52+CJhnFC5Ob
+<VeUIXZ_T$6UH6+AP6U+EqaEA0>T-+E2IF+CT.u+CQC+@<6*)BlbD<FDl22A0>T(+CQC5ATMF'
G%G2,F)5c:/e&.1+<Vd\+>GetE-67F-[0KLA1%fn+<VdL:-pQUBOPsq+DGm>@rH4'@<,pi+EVNE
G%#30AKZ#)FE2),G%G2,/KeVFEc5t@BkAK)@<?!m+D,%rCi_3<$6UH6+>=om2]uaEF<DrTDfTA9
%144#+F\cgILQVn$8jFY?p%e*DffhPF>A#MFE]ZXFCd@GCO(2>0JPD-?Tqj?8ge[&Anc'm+Eh=:
@WNZ/@<iu/@;]^#GA(Q*+CSbiATMp,DJ()9Bl7I"GB4m=Bl%@%+E)-?A9)C-ATJu&@q0(kF(Jl)
@X/Ci+<Ve-:ei-CDf0H(@ruF'DK?qEBOu'(<_uO6BlbD8AnEY<<+oi`ALDOADJsV>D09?%+A,Et
+Ceht+CoC5AoD]4D..C&ARlo3Ch7^1ATB/0A17rp+<Ve;EbT].F!+q7F<Ft'AU%p1FC65&G%GQ5
F^]*&Gp%-=FEMVAF!*.ZAoD]4<_uO6F(f!&ATJu1Bkq9@%144#+F\cgILQW,+<Ve=AU%p1F<Dqa
05>*?A7]p<1bWo`@<,q#05>E905>E905>]LEb'5DBkh6-%144#+F\cgILQW,+<X9P6m,uXF_kS2
A8`T!+E;O<@r!2uG\M5@ASu!h+Cf(r@r!3*DBO.;DId[0F!,OLF*(u1F!,[?ASrW)F<GX9ATJu:
DJ`g$E+NPh$6UH6F(f!&ATJu%0/%BbD.PAABOPpm04eg105>]LEb'5DBkh6f/g)99BPDN1GA1l0
+Du+>+D>>&E$/b2EZeCZ:*=C^E,]B!+CoM,G%G_($6UH6GA(Q*+BD<6+DGm>De<T6%13OO2D-+[
4C9m!F?!fLApA-;E-6;3Ao)O4DfI]q1iRD@5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BE
DIal+Bl8'</g+,;ART?sBkAK*AS#C`A1e;u%15$H+<Y&S?T0o^H=_8>BQ/9?B5r!*EcjB"3G;lA
E&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7BDf-\6
@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>$4R>%
/g)8Z+CI<=A2.V:Antp31jO%`CghF'@q[W:@5V_BDdP\9+@C'bF(o/rEZee,Ci=N3DJ()"IP5(O
@<3Q"+E1b2BHV87AS,Y$+E)-?D.-pM;]oLdA0=Q[DKU1HF*VhKASlK@+B3#c+D>\1AKYMtEb/a&
DfU+G@rH7.ASuU(Df-\9DBO%7ATME*F*VhKASlK2BlbD;ATMg%@ru9m+C]U=?t<tl?nMlq%16KI
ASu$1FDk].?!n*KBPDO0DfU,<De(U^B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hnt7+>"]aGA2"F+E_RBASbpdF(Jkk$4R=b
.NfjAD..3k?m'?*G9CC/ARfLs+CoV3E$043EbTK7+Cf>-FCf?3F!+n(@;0V#F<G:>F!,.)F(d08
$4R=b+<VdL+<VdLA7dtc+DkP&AKW?J+<Ve%67sBkF_u(?@;Ka&GAhM4F!,C=+E1b2BFP:k+<VdL
+<VdL0fL4l@;BEs4*s#!Afr3k67sBjBOt[h+CoV3E$/S%@;0V#F<GC2@:X(iB-:krF(c[*$4R=e
,9n<c/hnt6+>"^.F_l=G0f1F(1,(I?+=L&tEc#6&ASuT49Q+ELCh4_XA8-."Df.!5$4R=b.Nfj+
:IH=CDg*=EAT;j,Eb0;78ge[&@:jUmEZfO:EcYr5DBLql0JY7'3A*!@+DG_8Ec5K2@qB0[$6UH6
+Co2,ARfg)A7]@eDJ=3,Df0VK+B*2qAKXT@6m-\lEb'56DJs_AF`V+:A8-'q@rri(AS,XoBln'-
DK@E>$4R=b.NfjAC2[X$DI=SqDIaktC2[X$Amc`p@<Q3)@V'+g+Cf(nDJ*Nk+EVNEBOPdhCh4`.
ATDWrDIm^-%144#+<YK=@ps1bF!,17FE2;1F^nun+DG^98g$,H2D-+[C2[X$AnGEnDJpY6Df03!
EZen(F*)G@H#k*#:IGX!+<VdL@r,RpF!,:;@ps1bF"SS,F<GI>G9Cs@D/a<:+Cf5+F(KD8DfB9*
+Co1rFD5Z2@<-'nF!+n/A0>o(D/XT/Et&I!+<Ve7BkhQs?n<FBBOr;Y:IH=>DKKH1Amo1\+Dbt+
@;KKtAo_g,+EV:.+C\c#AKYr#FD*9L?tsUjDf/ql$6UH6+ED%7FDl22F!+k)C2[Wj+EVNEFD,5.
@UX=h+E1b2BJ(E,BOr<(Dg*=CATDWrDIm^-+A,Et+Cf4rF)qct+<VdLCi<flCh7Z1-t$IuDe(D-
C2[WnDdk8+C2[X"@;BF*@;9^kF*)>@ALq8)De*s.DesJG@;9^kF`_>6?muNl+<VdL@<,p%DJsV>
@q]:gB4YTr@X0)(C2[X$DI=SqDIaktC2[X$AnGF'+:SZ#%144#+<XX%+CfG'@<?''DfQt@AS,so
F(c[g:IH=8CghC++Dbt+@;KLr+F.mJ+Dl7BF?0j<%144#+<VdL+<VeCDdd0!-YI".ATD3q05>E9
-OgCh#p9Za+<VdL<+oue+Cf(nDJ*N'BlbD+@:O(s@<,m$@rH4'@<?3mCh4_tDIal1F`)7CBl5%c
-Z^D>AS,k$AKWuc2D,FG#n74a.Nfj.@;^?58l%htFCfN8+EM%5BlJ08+E_a:+DtV)ARlp"De!3l
ATKIH<+oig+EqC;AKYK'ART[lA1S/s+<VdLFEqh>@ps1iGp$pA@:Wq[+EqOABHToC6m*mjATT@K
F"AGFG\(B-FCeu6+CT.u+EV:.DBNJ$Ch7^"A.8kg+<VeKD]iP+ARTI!F`8IFATMr9@<-I(Amo1k
F"SS7BPDN1E+*j1ATDZ2GA1l0+Du+>+EqaECER>/+A*b:/iF.G+<VdL@<3Q-De!3lATJu&Eb-A4
ATDWrDIm^-+E_R<ATMo8AU&01Bk(k!Cj@.5Eb/[$ARlolF!,R9D/aE6@<-WG%144#+<XWsAKYGj
@r$9sEb$;&Df'H%FD53#AKWC9De*g-De<^"AM.\3F"&5TATD6&-u*[2FCfN8Ci<flCh5%<%144#
+<YN0Bl8$$Bl7u7FD,B0+E1b2FCfK1+CT.u+DkP)Gp%3?F*&OG@rc:&FE8R5F?0j<%144#+<VdL
+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[X*DJ=2%$4..K
+<VdLBl%U.F*)G2FCcS/FE8RIF(HsH6#:?[8l%htFCfN8+EM%5BlJ08+CT;%+Co2-FE2))F`_2*
+DG^&$6UH6+DG^9FD,5.@")NpA8c@,05"j6ATD3q05>E9F)Q2A@qB$j@:WneDCuA*%144-+<Y&Z
9LV6F<_l%\?YO7nA7&^e@ps6t@V$[)F(Jl)FDi:3Df0Z;DepP>ATMs-B45U!8l%htDdmHm@rr.e
+<VdLEb0*+G%#20A9Dp,DJ().Ddd0t/g*`'+ECn2AKYJkF(KD8FD,5.G%G]'+CJ\qARTV&Ddmcq
+Dkh*BQO[j+<VdLF(K0!@rri2F_tT!Eb/c(F`V,7+Dbt+@;KLr/g+,,BlbD2F!,F1Ecc#*F_kK,
Bl&&;Ch[ZrCj@.;Ado(i+<VeKBOr</F(KA7Ci<flCh4`'F!,%2E--@X+@:>rF(KH8Bl7Q+?pdUV
5uL`Z6;q87FDi9U+DG^9%144#+<W(IDe*g-De<^"AM.\3F"&5(:IH=LBl%T.DJsV>Eb0*+G%De>
ATMs-B45U!Ci<flCh7Z?+BN9!BHR`k+<VdL?pdUV5uL`Z6;q87F(KG9FDi9U+ED%4ART[lA0<::
Ddd0!-YI".ATD3q05>E9-Rg0SDdd0t+EqO9C`j/o+<VdLDfTf1@;[2[:IH=D@VTIaFE9&W6$"/Y
Des6(F(oQ1F!,[@FD)e>F(KA7Ci<flCh7Z1@<,p%F`)#0CLq=-%144#+<Yc>AKYMpAmoguF<G:=
+>GJX$4."]%13CJ+:SZ&,9n<c/hnt5+Q@p8+@]pOEckf2Gp"gq/0H]%1,L+%:2_^nEa`["ATAnf
ARQ]kF_l#*+@TgTFD5Z2.1HUn$6Uf@+@.,fATo8)De*5uDfBf4Df-\9E+Np.+EV:.+D#G4Bl[c-
E-67FA8,OqBl@ltEd8dH@<?08+B3#gEt&I!+<Ve@F!,OH@qZun+EV=7ATM:'Bl7Q+DJq+9Ea`["
ATAnb-Z'u;D.6poEaa$1ARloqDfQt<Dfd+DBPD@"Bl7Pm$6UH6+E(j7BlkJCARTV#+CSo$/e&-s
$6UH6+<VdL+<WQbDe't<@:X7d-Ql/N/g,(OASuQ3@;Ka&Df-[G@:X7d.3NS<FD)dK+DkP&ATJtB
@:X7d.3NSPF:AR"+<VdL+<VdL2BZpK+?MV3B5ho7F)?&4+E_d?Ci^sH:-pQUDfB9*F!+n-C`mY6
+=LlAF"&5N@<?0*/Ken=CLqQ0-tdL?.3NSPF<D\K+:SZ#+<VdL+<VdLDe3lpBkhQs?TgFm2C<?Q
+<XEG/g+\9Anc-o+D>2$A9f;=BQ%p5@s)l9Bl5%c:IH=>DKKH1Amo1\+Dbt+@;KKt+:SYe$6Uf@
+AQKl+EV19F<G(%F(KD8@;]Tu@q]:gB4Z-,FDi:0C2[X)ATMs)EaU#3D]in*CLnW1ATMs7+Dl%;
AKYr1Ecb`!Ch54.$4R=e,9n<c/hnt4+>"^*AR]\&@<-W92(Tk*0JYI--qIcfBR(^p@n:$LBP([_
AKXEPBln'-DCH#%%144-+CI`+;b1:I+CIl35u(f1@;]Tu?s6,l?m';p@rcK1DfBf4Df-\-De*F#
+CSekARmD&$4R=b.Ni,0E-#T4?m'Q"CLqQ0@3BH!G9CgCFD5Z2+CIZ7;F<lI5uU`O;G]YY873Q^
BOQ!*AoD^"ATJu9BOr:q$6UH6+E1b2BHV#,+EV:.+DkP.FCfJ8Anc'm+DG_8D]j.8AKYr7F<G+.
@ruF'DIIR2+D#_-D@Hpq+<Ve@Afu2/AKYr7F<G+.@ruF'DIIR2+DGm>?rBEZ6r-QO=^Wj)<+ohc
D..-r+E_a:+E(j$$6UH6+CIZ7;F<lI5uU`O;G]YY873QSF!,RC+ED%7ATT&:BOr<#DKKH1DII?(
E+*j%F!,17+CJ)95t"LD9Nba4$6UH6+Co1rFD5Z2@<-'nF!,R<@<<W*@<Q3)@V'+g+Dl%?ARmD9
6"Y4MEZet4Earg$B-;/%FD,_<%144#+<Yc>AKYMt@ruF'DIIR2+Dl7BF<G%(+Cf5+F(Jl)@;]Tu
Eb00.ASu'i/e&.1%144-+<XTsA7]7ZEZet.Ch7Z1De:+j83ng_2)ZRj@<6*nF!+n3AKYl/G9D*M
BlnH.DBNJ4EbTE(+:SZ#+<Ve9@:O(qE$/P-@:O(`?m'B,ATD4$Bl@m1/g)9+DfQt0@:O(qE$-tm
+EV:.+D,>(AKY].+CI#]C1q$sBOu6;FEhn8%13OO+=\KV5p1&VG9C:&DJW]'DfBf4Df-\2@<3Q#
AS#a%Bl.g*ASl!rFCeu*FDi:3BOt[h+C\bhCNXS=Anc'mEt&I!+<Ve8B45LlF*&OHBOr<"@<6*n
F!,OGDfTE"+DG^9FD,5.F(o/r@psC#Anc'm/e&-s$6UH6+<VdL+<WBt+C]5)+=Ach+<XEG/g)l-
+?^i<5uU;`$4R=b.NfjAEb0<6A7-NtDg*=EATMs3Eb0;7E+*d/Bk):%@<*K"@:O(qE-!.9DKBo2
@:UL!Afti2F*&N6$6UH6+EV:.+DbJ-F<G%$@r$4+/g*GrF)NTP@UWb^F`8I8Bl%@%+CT;%+Cf(r
@r#Xd+CSnkBl8!6%144#+<Yc>AKYYpF(f-++DG^9FD,5.@rHC.ATMg/DIdI!B-;80A7]7ZEZet.
Ch4_tDIal3BOr:q$6UH6+ED%7FDl22+DGm>@:F.qFCeu*BkAJrDL!@<@<6*nF!,"3+Du+>+DkP/
@q[J($6UH6%144#+<VdL+<VeIATMs(+=C];@;TR'+<VdL+AP6U+ED%7FDl22+DbJ-F<G%$@r$4+
%144#+<VdL+<VeIATMs(+=C];@;TR'4#&H4+AP6U+ED%7FDl22+C\bhCNXS=0ej+E+<VdL+<VdL
+ED%7FCZLAA8YgmALBPo0d&20+<XEG/g,1GF*)>@AKY]"DJsQ0DJ()$@:O(qE$/h&F(f-+%144#
+<VdL+<V+#%14=),9S]n0J5+<+@0seBl"nK/0H]%1,C%$;fHbkDJ((`DIdHkFDYT,FE8QnA8-."
Df.!5$4R=b.Ni,:ATqZm+Du+A+EV%-ATJu%A8lU$F<Dr/78uQE:-hB=-Ta%j+CT.u+CJ`!F(KG9
-UCZu8P(m!-Ta%j+CT=6A7]@]F_l/@%144#+<YlAASrW#Eb/[$Bl7Q+DIn#7A8,OqBl@ltEbT*+
/e&-s$6Uf@+@.,fATo89@<,dnATVL(+CI`+;b0;V9i,4?BOPs)@V'+g+CSekARlp*D]iG&De*fq
Ec#kMBkh]s/g+,,AKYMpAmoguF:AR"+<Ve@F!*1g+EVaHDBNk0Afu;3FD)dN/g+5/ASrVF+CQBk
83ng_2)ZRj@<6*)BlbD9Eb/isG\(D.FDi:DBOr<-FCB33+E(j7A9Da.%144#+<Y`8EbTK7F"SS7
BOr;uDes6.GA1r-+EV19FE8R:DfQt2F_u(?F(96)E-*4:DKKH&EbTW@3XlE*$6UH6+<VdL+<Y0-
CM7-tBOkt!?X[\fA7$H,IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A7T7p/no'A-OgCl$6Uf@
+@.,fATo86@:O=r+E;O4Ch[KqATAo$8PiPb6=:pGDe*E%BOPs)@V'+g+CSekARloqDfQsmF`;VJ
ATAo2DffQ"Df9E4/g*o-FCep"DegJ-Bl%@%%144#+<Y0&DBND"+EMXCEb/c(@<3P`:IH=B@:O=r
F!,[@FD*]E$6UH6+<VdL+:SZ#+<VdL+<VdL:-pQUEb/Zi+Du+>AR]RrCER&'A0>r8DfTCu$6UH6
+<VdL+<YB;H#@(S3ZrQeAiLoRART*l-Z3jEAR]RrCG'=?H#@(=%144#+<VdL+<Vd`+E2IF+=D&F
FCep"Dei]oE-Z>1-Tamr=\_:j@;9^k?TVt@H#@(#$4R=b.Nfj5BOr<*F`\a:Bk)7!Df0!(Gp%'7
FD)e2F!,@=G9CU;+EV:.+D>=pA7]d(@rH4$ASuU2+E(j78l%ha$6UH6+CoV3E-!WS7W3;iAU%X#
E,9).FD,5.?tsUjA7]pl+Co1rFD5Z2@<-W9BOPs)@3BMtFD*]E$6Tcb+<VdL+<VdL+?MV3C2[Wn
ATf22De'u5FD5Q4-OgCl$6UH6+B3#gF!,F1FD)e@@<3Q/Dfd+@Eb0E.Dfp,;Gp%0ADg-(O+:SYe
$6Uf@+@.,ZF_;h2DKKo;A9DBnA0>T(+Eh=:F(oQ1+=Jrs0J5+:.3N;4F!+q'ASrW#DfTl0@ru9m
/g*G&A7]@]F_l./$6UH6+Dk\2F(&]m+Eq78+DG_'DfTl0@ruO4+EM+9+DbUtA8,po+EVNE?n`]]
2Du[sF`\`R-[0KLA1&a4+D,%rCisc0F!)l08Ol<#/e&.1+<VdL+<V+#%14=),9S]n0J5+;+@]pO
Eckf2Gp"k%/0H]%1,C%$;fI")6=F\HDf9M97:^+SBl@l<%13OO+=\L++?;&.1a$gMDIIBnA0>u4
+A*b:/i4\ZDIal3BOr<&@<ld6F<GL6+?:T+0f1"s@<3Q$BOPdkARlp*BPDMs$6UH6Eb065Bl[cq
+CQC&BOPdkAKZ)5+CJr-DI=T2BPCsi+Cf>,E-686F!+m6Ao)BoFD5W*+Eh=:F(oQ1+Du==@V'R4
%13OO+=\LA6r6QK9hA;l+Eq78+C]J1E+NQ&F`8IFD]gqp/g*_t+F.mJ+Dtb%A0>`-Eb-A8BOPd$
2DcOeBk)7!Df0!(Bk;>p$6UH6Df-\CDfp(C8l%htE+*j%+F.mJ+CT;%+CoD)DJ()5Df''-BPD?s
+EqjEDJ(+8%13OO+=\LAE-688F'p,!A867.FCeu*FDi:3BOt[h+C]&&@<-W9@rH4'@<?3mBl%L*
Gp"[]D/"'4ARlp*BPDN1Bl5&4EbTH4+Eh=:F(oQ1/e&-s$4R=e,9n<c/hen51E]:uDKTB.Gp"k#
/0H]%1,C%$7qHRKATAn_CisH&+@TgTFD5Z2.1HUn$6Uf@8g$,H0Jk.u+E_a:+E(j7>=VCa>psB.
FDu:^0/$sTE,95t/oPcC0.A#UDfQt3G][M7A7]9oE,oN"Ble!,DBNY2FCf)rEcW?4$6UH6BOPs)
Bl8$5De+!#ARlol+C]&&@<-W9Bl7F!D/`p*BjtdmBlnVC@V'Y*AS#a%8g$,H0Jjn\DIal/EbTH4
+Eh=:F(oQ1F!,C5+A+6q$6UH68l%htF*)>@ATJu*G][M7A7]9oE,oN"Ble!,DBNY2FCf)rEcW@;
DBNJ(@ruF'DIIR2+C]&&@<-W9?ts:fCh7Zq/g*b/3A*!B%144#+Ceht+ED%%A0>f,A7]d(AU&<.
DId<h+DG_8AS5RpF!+q7F<G:0+A*b:/hf+)GB.D>ATJu*G][M7A7]9oBl8$(B4Z+)+EVNE?ts:f
Ch7Zq%144#+Cf>,E,TW*DKKqBDerrqEZdt%F!+t$DBNh8+ED%%A0>],DJ*O$+EV:.D(Zr1BPDN1
G%G]8Bl@l3@:Wni+Cf(r@r$-.FDi:0E-681/.Dq/+<Y')Ci<d(?m&lqA0>8jE-#T4?m'Q0+E2@4
G%GQ5+EV:.+Dkh6BOPdhCh[d"+E(j7DIn#FDerr,@VK^gEd8d<@<>p#Bl5&(Bk)7!Df0!(Bk;?<
%13OO+<Ve.5uLHL:.I>fFDi:EE+a3"A7Zm*D]j.8BlbD?ATDj+Df-\9Afs]A6m-M]F(KG9H#IhG
+A,Et+DkP.FCfJ8Anc'm+C]UW%13OO+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn%144#+<VdL
+<XEG/g+V3@r$4++F.mJEZek7EcP`/FDQ4FEb/ltF*(u6ARlooBk)7!Df0!(Bk;?.@;]TuF(f]<
+A*beDg-(.$6UH6+<VdL+=JreE+rft+>k9[A0<6I.3N5HEbTW,+DPk(FD)dEIUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X'AS5^uFCfJFBkh]:%144#+<VdL+<V+#+<VdL+<VdL:-pQUEb0<6@<-H48g%P[
A0>H(@<6!&FD,5.Anc'mEt&I!+<VdL+<Ve=ATD4#AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E9
05>?4F*(u6/no'4-OgD*+<VdL+<Ve=ATD4#AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9
/no'<-OgCl$6UH6+<VdL+AP6U+ED%0Ddd0!FD,5.Eb/ltF*(u6ARlooBk)7!Df0!(Bk;?.E++$+
DJ()#FED)3FD5Z2+:SZ#+<VdL+<Ve%67sC&D]iJ+Gp$R1DIIR2+DG_'Df'H%FD52uCh\!:+Dk\2
F(&]mEt&I!+<VdL+<VeCDdd0!-YI".ATD3q05>E9-OgD*+<VdL+<Vd\+Z_;20d&SnE+*j%+=DVH
A7TUrF"_0;DImisCbKOAA1q\9A9)6oBleB-E\;'@F!hD(%144#+<VdL+<XEG/g,7S+E_a:+E)(,
+=L]1AoD^$+?;&.1asPXBk)7!Df0!(Bk;?.H#IgJGA1l0+D>2,AKZ)5+EM+9+EV:.D'08p+<VdL
+<VdL:-pQU;FNl>:JOSd+DG^9@;[3+Ch.*t+Eh=:F(oQ1+E(j78g%P[A0>u-ASrW2AS5^uFCfJ8
Bl5%c+?;&.1^sd$$6UH6+<VdL+AP6U+EM+9+Co1rFD5Z2@<-W9;FNl>:JOSd+DG^9@;[3+Ch.*t
+DM>m+<VdL+<VdLDe't<DerrpBk)64%144#+<VdL+<Y36F(KG9-W3B!6r-QO=XOXc%144#+<VdL
+<XEG/g,7LASrW)DBN@1DIn#7-qYUB/hf+4.3M5*Eb/ltF*(u6+:SZ#+<VdL+<VeIAS5Nr-Z<g3
A8,Oq-T`\c3\P\jATD?8H#IhG04\d,F>%?L-OgCl$6UH6:/=hX3Zr-K+F.mJ+CT;%+E).6Gp$g=
FCfK(F*(u(+DG^9Ecl8;Bl7Q+@s)g4ASuT48i\LX1a$4EA0>c$G@be($6UH6G%G]8Bl@m1+E(j7
8hM5hDfm14@;[2uF_u(?H#IhG+Co1rFD5Z2@<-'nF!+n4+CoV3E$043EbTK7F!+n/A0>o(Ci<`m
%144#+EV:.D'3P1+Dtb7Cj@.5Eb/[$ARloU+?;&.1a$=C@ruF'DIIR"ATKIH<+ohc8l%htD..=)
@;I&tG]7J-Bl7u7BQ&);FDi:4D]j.8Bla^j+<Ve@DBO%7AKWI%F`MA6DJ((a:IH<nF_u(?;e'i^
E-*4%EbT$!F"/;@E,]B+A8-9@+:SYe$6Uf@8g$,H0Jk.u+Cf(nDJ*O%+EVNEFD,5.F`V+:De:,6
BOr<,AS6.%@<*K%G]7\7F)u&6DBNb0@WGmtGp$Kk6W-?.?m''"EarZk+EMI<AKVEh+<Ve8A867.
FDYT,FE8RHD]iG.G]R7F+B<;n@rGmh+Cf(nEa`I"ATDi7@<,p%FEMVAARlp%AnE00Bln#2?ugL7
FCmKT0OQ#BEbTH4%144#+EVNE?ugL5?m'N%@<,jkATKIH<+ohcF(KH8Bl7Q+F(fK7Ch+YtAKZ#)
F*)>@ARlolAoqU)+CK57F'p,2F`)7C@Wcc88K`4qF_kRt$6UH6@:XOqF(HJ(BOt[hBl7Q+AoD]4
@rc:*Bk(Rf+Cf>#AM,*)F`MA6DJ()1AnE/cDJ<U!A7Zm#@<iu3Bl.R++A,Et-Z^D=@VKXmFEnu<
$6UH6FDi:4ARTBtGA2/4+EMI<AKYN%@s)X"DKKqB@Wcc88ge[&<GlM\De*E%F*2G@DfTqBBOPs)
@;L-rH#k*I@<-I(@;IP*$6UH6%144-+CI&LDe't<-X\'*A867.FCeu*FDi:CDfTqBEb/ltF*(u6
ARlooBk)7!Df0!(Bk;?<%13OO+=\L3AS5S!+D#S6DfTnA-tRF>DfTnABl5&8BOr<,AS5S!+D#e:
Eb0<5Bl@l<+Du+A+:SZ#+<YcH@;p0sA0>;uA0>Au@<-'oBk:g9+=AX_Ec5i.-QmGSF!,l`+CoA+
+=ANG$6UH6:i^8gEZdtM6m-YaEcYr5DK?q:ATT&8AS5S!+D#S6DfTnAB5\o7D]j.8AKZ)5E$/t.
G%GJ4FE1f//e&-s$6pc?+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*-r4\o@rcL*+BDokBjkn$
+@TgTFD5Z2.1HUn$6Uf@+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj
/oY?5?k!GP$6Uf@+CK>5ARo7q?m'Z%F!,17@rHC.ARfguGp$[C@r-9uBl7Q+DIIBnF!,[@FD)dE
?RHt1DBNt2F*2;@F"SRE$4R=b.Nfj%Bl[cpF<Ft<HXIsK/hS8SI=5KGA7]@eDJ=3,Df0V=DJs_A
F*2G@DfTr2A0<HHF(Jo*?tsUj/oY?5?m$R$$6Tcb+=\KV7:^+S+Cf>,D..<mF!,"-F)Yr(H"CM/
AoD]48k;l'FDi:BASl.!A0?#9ATDi7FDi:1Ci"$6+C]A0GB7>9+E27<+E_XE/e&-s$6pc?+>GK&
/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."
Df.!5$4R=b.NfjAC2[X!Blmp,@<?'g+E1b,A8bs29OUn3=<M']F(Jl)A8bt#D.RU,@<?4%DBO%>
DepP=E+EC!ARm>7F(JoD%13OO+<VdL>?,`YDJ(),De*ZuFCfK$FCe`+BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$
FCd(=E-Z>1.1HUn$6Uf@+AQKl+@0jQH>d[DE,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums
+@KpRFD5Z2@<-WB>A/,#E-"&n06_Va/n&U*H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#g
F!,1<+CQC%Df9D6G%G]8Bl@l3De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73
F<G[D+EM[EE,Tc=%144#+<X9P6m-#OG%GK.E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/
GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%rCi^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0
+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C
?k!GP$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5
$4R=b.Ni,6De*@#@V%0+@rG`t@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJAS!nF
?tsXhFD)dEIP5,?A8c@,05"j6ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4F(KH8
Bl7Q+:K&BM@rH7++EV:*F<G%5@;]Tu8l%htA8-'q@ruX0Bk;?<%13OO+=\KV.!&sA@WcC$A7TCp
F"&5KDe*QoBk:ftFDi:3Eb/[$AKYDtC`mh5AKYMtEb/a&DfTQ'Et&I!+<VeIAT;j,Eb/c(@X0)<
BOr<'@:O=r+=L]ABl%<pDe*BmF*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt%144#+<Y`:FED57
B-;>9+Dtb7+DkOsBPD?qF!,(5EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRE$4R=b.NfjA@:WnbDdd0t
@rc:&F>7/GDJs_ABl8!7Eb0;7F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'oFa
+<VdLBOQ'q+CHg9C3*c*AU&<.DKBN1DK@EQ%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC
+=K]j@<?X4AKX?YD/a<&FCcRmASbpdF(Hd0$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuul
C2[W8E+EQg+BN9!BHVD1BlbD*A7TCrBl@l3@;K`h$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8F!+n3
AKYK$D/a<&FCd'I7WNEa+Du+A+E)-?8l%ha$6UH6+Cf(nDJ*O%+EqO9C`m5+DKBN5F<GL6+C]J+
+D,>4ATJu&DIal.E-,f2BmO30Bl@m1/e&.1+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/e&-s
$6Uf@>@:oQATV<&8p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.
DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?%13OO
+=\LTDf'&.D.-ppDf[%0DIal3ATMs7+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI5
$4R=b.NiV?G9C:&B4Z0m+EV19F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5$4R=e
,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC%13OO+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8FCB33
F`8I8@;0P#Eb-A*DfQsm+?;&.0d'q:FC?b7+CT.u+C\o-Df0)<%13OO+=\LA9gMlV5tsdU+DG_'
Eb/[#ARlp*D]gbi3$;gRDf$UT0J4JIBPDN1E+*cqD.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'F_qQp
+<VdLCh7KsFD)e8Afth2DIIBnF!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['
ATT&:D[d$r+<VeM@;L'tF!+q'FE_;-DBLYV@;]Tu1,UpA%13OO+=\KV?ug*l/0J>@FECn5@:X+q
F*(u(+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=e,9n<b/ibOE3B/-5+@]pOEckf2
Gp"gu/0H]%0f^@)<affUDKKT1ALDOA6t(?i%13OO+=\LAEd2Y5+DG\3Ch7HpDKKH#+>"^WARuul
C2[W8E+EQg%13OO+=\L<?ugL5?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL0L^5*
Eb0<5Bl@m1/no9MDIP%($4R=b.Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a:IH=A@:F:#
F(JoD%144#+BqH66m-;S@N]Q,FCep"DejE"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A1r%FAS!N3@<6O%E\D0GA8Z=-AR]RrCNCp6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*
3"63($6Uf@?u9dt?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@?tFFf+CSeqF`VY9
A0>u4+E_a:+CJbkBlm]sBQINg+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk+CK"u?n<F.C2[X$
DI=T/D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha9LW>3F(KG9Bl5&$
E,ol/Bl%?5Bkh]s+>"^YF(Js+C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1iDKB`4AM.P=ARHWl
A8-.(E\7e.%144-+CIf?:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4DBO%4G]Y'<De*F#
+CSekARmD96#:?[8l%htD.-ppD[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<ATKIH<+ohc@rGmh
+DGm>@3BAp@V'@.+A$Z&F!,UHAS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:EeaF!+n4+CIf?6W-KP
<+$hjAU&;>BlbD.G\(B-FCeu*GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0%14=),9SZm0J5@G
2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSekARlok9hAGU6r-iP
;ICVbDfoq?FDi:0DIIBn@psJ#?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B.aW#%144-
+D,>.F*&Ns:IH=GASbpdF(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^EE-"&n05#!@
BQ[c:@rH3;C3+<*FE_/6ALSa1A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P1E\7l9jr;i
1,1=&1,(FB+=M>CF*&OCAfs]eDe=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ@<Q@'F`JUCAftJl
E-#T4+=C&_:K0eZ9LM<I-T`])6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtBD]j.8BlbD;ASbpd
F(HJ7ASbdsBm+&1Ec5l<+D,P.A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3BOu'(@:Wn[A0>u4
+EV:.+CK8#EbTK7F!)iR-X\'5BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5@rc:&FE:h4Ch[cu
F!,:5CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iA
F(96)E-*a4AQWPb=)`D$CbBF:Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2
+EMXFBl7R)+CT;%+Du+>+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"DIml3
Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$6UH#$6UH6
<+oue+Cf>-AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL%144#
E,9H7+<VeU@:WneDK@IDEa`p#Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16EZdss
2D-[<+D#G$ARlolDIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_ADf-\6
BkCp!F*2G@DfTqP%13OO+=\LADIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.
@<6L(B5VQtDKI"4EcQ)=/e&.1%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:
@WNZ.Bkq9&FD,B0+:SZ#+<VdL+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqP
+<V+#+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,ATVU(
A3k6KF_t]-FE8lo/g)hW$6UH6+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,+<V+#
+=\L"+Dtb7+DtV)AKYE!@;L41BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc
@<?Qu+EVN2$6UH6Dg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%
D..Nt+A*bq@<?U&Ec*!/$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1+<V+#
+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%67sB/
A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)?S[$^
Bm;'L/1)u5+@K1-8Q\>T%144#+<VdL+<W(CDCI_0+Cno&%144#%144#+B3#c+E2@4G%kl;F!+t+
@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu+<Ve?
@<Q3)@V'+g+CSekARlp*D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP+<V+#+<VdL+<VdL
+<V+#,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"A867.FCeu*FDi:2
ATW$*EZfFGE,]`9F<G.*Bln',B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$C1D1"F)Pl+/nK9=
?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:CARuutDg*=GD]iP.
DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)G]Y'>A8-.(EZfIB
+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n
+<VdL+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"
A0>K&EZccF@rH7+Deru9AU%c8%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^Je
Ea`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@+CJr&A1hh3Amca(
E+EC!ARmD&$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b.Ni,1
FC65"A867.FCeu*FDi:CF`;;<Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt+<VeF
E+Np.+DG^9?u]pqA7]-kARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl$6UH6
FDi:CF`;;<Ec`FGBPDN1An>CmF`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i%144#
+<VdL+<Y6++=DAOEb'&rD.P(($6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%
$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065
Bl[cm%144#+<YN0Gp%!CF<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5
-RT?1+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6
+<VdL+AP6U+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE
+E(d5-RT?1+<VdL+<VdLEb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL
+>,9!/e&-s$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)
AKYf'F*)IGBl.g*ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NfjOATo8=
ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO
+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/is
GT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?
+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!
B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],
@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1
ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2
+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)
0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU
<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%
BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/
ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNE
Eb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u
+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8
Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&
/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'o
BHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o
+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL
+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tp
F<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL
+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL
-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E.
/ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5Fn
Bm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq
+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?
F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3
@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=
+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H
+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdk
ARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL
+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY
1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs
+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$
B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`
%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF
0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!
F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3
E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5
$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W
<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(
Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlom
AS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0
AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.
Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!
AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3l
ARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0
@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7
Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RB
Dg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm
@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b
:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(
?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f
+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j
+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'
DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6
Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5
DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7
ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKr
ATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG
/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL
+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4
BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u
+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7
?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)s
A7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*
@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgT
FD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=
D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:
%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>
@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7
DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,
Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8
+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr
+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>
E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9
Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7
C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*
+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#
+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>
DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3
Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!
ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,18
1,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*
0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)
D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL
+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6
@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&
F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&
1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:
Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R+
+D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<
3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],i
Eb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f
+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,
BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@
Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO
+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@
BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'
F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-
FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"
+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC+
+D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8
$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
Ddt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`
A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/
D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!
F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)9
5t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP
8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL
+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9
$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7
G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?
G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]
B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)
+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*
FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6L
DJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3
I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's
+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI
6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLg
DKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%?
?n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7
BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#
+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.
D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!
+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/
Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$
FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGu
DeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0
;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7
Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8
DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!
F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(
FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+
FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!
Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8
DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc
+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV
6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9
G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:
BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY
9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p
$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#
$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e
%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*
D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(
A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%
Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0
FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm
@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+
+EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(
A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX
%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]o
F*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6
@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3m
Ch4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&
H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZ
F:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:
E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb
+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&
A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5
?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2
Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*
AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653
ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)
D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A
@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa
@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=)
,9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6
F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL
2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*
0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg
%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*
A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*
Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1
+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9
E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7
BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In
6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8
AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.
@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*
ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E.
/i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#
@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%p
CLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1u
An?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LV
E+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&
0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6
Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)
Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?
6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/
ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%
0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@
EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,
05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%
DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*
FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!
F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+
FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZK
Dg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8s
G[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et
+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'
AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-
+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=
D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:
@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!.
/KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7
<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LS
AT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$
%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!
$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX
$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9
@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-
G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloq
Ec5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;
AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>
+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5
?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oE
D]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,
@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7
+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-
+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-
/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$
5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LL
EZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%
DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8
BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LL
EZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/
AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm/
/Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])
+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/
+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&
FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9m
AKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,
B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@
Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;
AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSek
ARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?8
3\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@
D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb
,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e
$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm
0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J517
0H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#
Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s
+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-
+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)
3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<
+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR
6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=
F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd
:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*
FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m
/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>
A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7
Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g_g@;]dkATMs.De(UX:-pQUD..<rAn?%*
+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP15
1E\7lA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+
DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16ig
A8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<c
CG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%
Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16ig
A7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2C2[X%A7dH9
G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"
FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKi
Cggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0r
ATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb
+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1r
FD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-
FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'm
F"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-
@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F
$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-
DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet
@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRL
Ea`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.
9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,
05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.
+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De't5%144#+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA7TUg
F_t]-F>%TDAn5gi05>E9/oY?5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:
DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5.
/i+V%+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P
6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`
F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iA
ATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm
:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi
$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5
Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?16q($A
;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,
ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+
Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;
@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9
A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'
B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"B
Dfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.
De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]
Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5./i+V%+Co&,-OgDP:J=/F;E[&gB4YslEa`c;
C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)
Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c
$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qA
ATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oia
AKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)
E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u
+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.
Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7
:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"
+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2
C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9
FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(
Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(
A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P
%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#
+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.
Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2
F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJ
Eb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$3       ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H?R9+>P&o2'=Y6+>PVn1G^..0d&2,+>GSn1-$I33?U(6+>Get1Gqd#6pamF9LMEC;cHOj=`S(`
ASuT48l%ht@WcC$A0>Q"F*)>@Gp$pAB1brf<)6:`;aOJU9LMEC;cHOj=`S(`ASuT48l%iS:JXY_
+C]J-Ch+Z%BleB7Ed8dDDeE$F6r./^:IJQ,A4fWc+EVO4D]ik1F*)8-DJ<]oF*)/8A8kseD..<)
D..<rAn?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-FDYH(BkCptF<G16EZdtM6psg<
<D>nW<,H&]BkCptFD>`)F)Q2A@qBUf@r5Xl+DkP)BkCptF<G16EZdtM6rQl];F<kq@:WneD?  ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE BYTESIZE CNMFDLOG CNMFMARK CNMFPARMDEFS CN'
zz=:zz,'MFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF DEFAULT DEPENDENTSEND D'
zz=:zz,'EPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMI'
zz=:zz,'T ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ER'
zz=:zz,'R010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019'
zz=:zz,' ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 ERR'
zz=:zz,'029 ERR030 ERR031 ERR032 ERR033 EXPLAIN FREESPACE GROUP HASH HASHFS'
zz=:zz,'X HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IPYNB I'
zz=:zz,'zJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME JODPR'
zz=:zz,'OF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF MACRO'
zz=:zz,' MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS NVTABL'
zz=:zz,'E OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK009'
zz=:zz,' OK010 OK011 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS '
zz=:zz,'PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEXT UNION U'
zz=:zz,'TF8 WORD XML ZIG abv afterstr alltrim badappend badblia badbu badcl'
zz=:zz,' badfl badil badjr badlocn badobj badrc badreps badsts badunique be'
zz=:zz,'forestr bget binverchk bnl boxopen catrefs cd changestr checknames '
zz=:zz,'checknttab checknttab2 checknttab3 chkhashdmp clearvobs createjod c'
zz=:zz,'reatemast ctl datefrnum dblquote decomm defzface del did didnum dnl'
zz=:zz,' dpset dptable empdnl fex firstone fod fopix gdeps get globals glob'
zz=:zz,'s grp gsmakeq guids guidsx host hostsep isempty islocref jappend jc'
zz=:zz,'r jcreate jderr jdmasterr jnfrblcl jodinit jodsystempath jpathsep j'
zz=:zz,'read jreplace justdrv justpath jvn lfcrtrim locsfx make makedir mar'
zz=:zz,'kmast mnl mubmark nc newd nextbaknum nlargs now nowfd obidfile od o'
zz=:zz,'k packd plt put quote read readnoun readobid regd remast restd rv r'
zz=:zz,'xs rxsget rxssearch saveobid second sha256 tc trimnl tslash2 tstamp'
zz=:zz,' uses valdate wex wrep write writenoun''),<<;._1 '' jodon jodoff jodo'
zz=:zz,'n''                                                                 '
zz=:1811{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&q+>Yc-2'=b!2`#2eA55HD+=_,EA0>A6/Ken=Bl5%c:IH=9Bk)7!Df0!(Gp$U5@<6KB
%15is/e&._67sBHCht54FD,6++Co1rFD5Z2@<-W9@r,RpF(KD8@<,p%AU&<.DKBN1DK?q=Afu2/
AKYMt@ruF'DIIR2+Cf4rF)rrC$;No?+B3#cGp$O3C`mkAAKZ&9@;]UaEb$;&Df0W<@;^1.+CT.u
+Eh=:@WNZ&AS,XoARlotDBO%7BlbD,CghC+/e&._67r]S:-pQU6ZQaHFD5W*+CQBb:IH=D@VTIa
F<G+*Anc-oF!+m6-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is/g*PnF*)G@H"h//+CQBb:IH=D
@VTIaF<G.8@<6"$+EV:.+=Lr=De(:>Ci<flCh4`'DKKH1Amo1\/e&._67r]S:-pQU6Z6ja@;0V#
3ZqsI@ruF'DIIR2+E_d?Ch\!*ATKCF@rH7+FCB'/F"AGJDKKH1Amo1\+Eh=:@WMtc:-pQB$;No?
+A$HmATDBk@q@\D.!B0B@WNZ/@:Wpl@<Q'nCggdhAKYH-+DGS/A0>],@ps1b.1HVZ67sB'+CS`&
+<VdL+CT)&+C\bhCNXS=G%G]8Bl@l3DIIBnF!(o!:-pQU+<Y-+ATT%;+<Y<.F<GL2C1UmsF!,(8
Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+F!(o!:-pQU+<Y-2C`jiC+<Y-%@r$4++DtV)AKYf'F*)IG
Ao_g,+E1b2FCfK1Et&IO67sB'+Co&"+<VdL+Co&"ATVK+GAhM4F"AGUATMs7/0JSGDfp#?/0Je<
@rcL//0JMG+Ceu)ATD2g$;No?+<Ve;Bk/>/+<Ve;Bk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2%15is
/g)8ZA8Z3++<VdLA8,OqBl@ltEd8dF@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;E-#T4
+<VeJATVu9A8,OqBl@ltEd8dH@<,dnATVL(Et&IO67sB'+D54rE-!-E+Dbb5F<G4:Dfp"A@;]Tu
F*22=AKYMpE+NotASuU2%15is/g)8ZB4Z0-+<VdLB4Z0-GAhM4F"AGUATMs7/0Je<@rcL//0JMG
+Ceu)ATD3%Ao_g,+Co1rFD5Z2@<-W&$;No?+<Ve>Ci<d(+<VeNDfTA2@;]TuFCfN8+D5M/@UX'q
DIIBn+ED%*ATD@"@qB]j$;No?+<Ve>Ec<-D+<Ve:Eb/[$AKYE!A0>l7ATE&=B6%p5E-!.1DIal2
F_Pr/Et&IO67sB'+DkP&AKW*<+D58'ATD4$AKXSfF(96)E--.D@;]TuA79Rg@UX=h+CoV3E,uHq
:-pQU+<YN=C`jiC+<YN0DL!@8Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU
+<YQ5G@Vg=+<Y07ART[l+Dtb7+Co1rFD5Z2@<-W&$;No?+<VeFA0<!;+<VeFE+Np.+CT.u+Cf5+
F(KD8A8,OqBl@ltEbT*+%15is/g)8ZE+*6lA0<!;E+*6l+Co1rFD5Z2@<-'nEt&IO67sB'+E2IF
+<VdL+E2IF+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+DG_8D]iS)@ruF'DIIR2%15is
/g)8ZEb/lo+<VdLEb/ltF*(u606M/QAS5^uFCfJ8@3B)p@ruF'DIIR2%15is/g)8ZEb0<6A0<!;
Eb0<6DfTD3CghC,+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA17rp:-pQU+<Y]LF!)SJ+<Y]9B6A$!
EZeq<E,oN2F(oQ1+EM+&Earbl$;No?+<VeLF(KD8+<VeNDfTB0+E_a:A0>?,+EqaEA9/l%DIal3
ATMs7%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'+D#S6DfTnA0JG14
0Jkd=%13OO@rGjn@<6K4+=CT4De(4)$=e!gDKBB0F<DrFC2[W1%13OO:-pQUFCB6++CSekDf-\6
Ddd0fA0>JuEcZ=FAoD]48g$,H0JO[Z$?B]tF_Pl-+=Co9Bl%@%+ED%+AU#RF+:SYe$;No?.V*+0
ASu$iDKKqBGV(KiGAhM4F!,")Anc-oA0>T(+EV:2F!,O8@ruF'DBNV$G%De:ASbdsARlooAS,Xo
Bln'-DK?6o%15is/g+hGF*&OGE+NNnAnb`tH6@$B@ps1b+Du+?DK?qAATT&*F`M26B-9ehE,ol/
Bl%?'Ci<`mBl7Pm$;No?+=J]g4ZX]W7TW/V+B;0&9gp0r7S-BS%13OO:-pQUCh[cu+D,1rA1Sj5
@<-C&@:s-oEb0?8Ec*ENFCAW$@;]TuCh[cu+D#G$Et&IM7Qide0RI4\%15I#4ZY;RHXSN9$<0;X
4ZYTM@4hur6W-TI4ZYr./5/MB$4R>;67sBt@:O=r+EM%5BlJ/:DfBf4Df-\-De*F#+>"^XD]iJ!
A0>`-Eb-A%A7Qfk+Dtb7+E(_(ARfg)@rGmh%15is/g+S?A0>`-A8,Y$+EV:.+D,P.Ci=N3DJ()&
AS,XoBln'-DBNk0+AG-h;GU7p:dkg#8lJ)T8PiAL3\iE!$;<`b79D]61,9:G85r;W4ZY>S%1633
9KbEl1^sdk79EMP3\iQ%$:7lp76N[e2@U!f5uL?D:KL:S3\iW'$<:%p3'B;X3"63k=]@pf:-CWn
3=Q<o;+s,61GB7F8lJM\4ZYAR%15['=\_:H3\rN#$;<lS:-CWo1CX[p8Okp)1GfOJ%15is/g,">
@rcK1FCf]=+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@
9gMZM6r-lZ/6,Y=3%Rm/<(Ke[/5oD>/4ri::+St5=\_:79LV6B/6YV8%13OO:-pQUDdmHm@rri'
De*F#%1604;FEZ/0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQU
A8,OqBl@ltEd8dKASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu
@r,RpF"AGEAT23uA90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3
<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB
6W?fJ%16QQA8bpl4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*
A7]RkD/"*'EZek*@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*
+A#%(8PUCT+=AgI-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%W
ASkmfA0<O1+Cf(nEcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI
-n$K87TW/VHRE&O-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,
+E;O4Ch[KqARloqBl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P
-TWV%4XhL'/g+@Z+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3
F(KA7Ci<flFD5Z2Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0
%15is/g,=KEag/*F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dE
C2IC#FCfJ?%15^'6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90
C2[X(H#n(=D/`p*BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X$
DGEMN.V`m4Df-\=/M/)aCgggbF!)lGDe*d(.3N&:A0<:8De*cuAgnj:DBO6JCi<flCh54.$4R>P
De!p1Eb0-1+=DI_%13                                                        ~>
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
zz=:zz,',<<;._1 '' jodsmoketests abvSmoke00 addgrpSmoke00 bgetSmoke00 bnlSmo'
zz=:zz,'ke00 bnlSmoke01 bnlSmoke02 compjSmoke00 compjSmoke01 didSmoke00 dis'
zz=:zz,'pSmokeUnicode00 dnlSmoke00 dnlSmokeMacroTexts docSmoke00 dpsetSmoke'
zz=:zz,'00 edSmoke00 etSmoke00 gdepsSmoke00 globsSmokeAssign000 globsSmokeD'
zz=:zz,'D00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00 jodonSmoke00 makeH'
zz=:zz,'ashchkSmoke00 mnlSmokeArgs00 newdSmokeBadArguments00 odSmoke00 odSm'
zz=:zz,'okeArgFail00 putMaxnameSmoke00 restdSmoke00 rxsBadSmoke00 rxsSmoke0'
zz=:zz,'0 rxsgetSmoke00''                                                   '
zz=:485{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkiU;D9m^+@T1+0JbL-8U=!)6tpO\ATDBk@q?cSH:gt$FDl)6F!+&#8l%it
FD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r:IJ5X6m,8u0JP:)D..3k-RgSp4=iTBD..3k87?RQ@q]XV
D/X3$0JFk'/1<VC4"akp+=A:HDe'u*De*d(-RgSp4=iTBC2[X(D/X3$FCfN8F!iCf-p0UR/mg=U
-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,A:IIuc8l%i^D.Fc&BleB7Ed;D<
A0>_tDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ..4cl01*AS&
1,(I?0K1^F/i5@A0f_3M1,^m11,(I?0K1^F/i5@B3&!0G0eb=)1,(I?0K1^F/i,ID1b^gI2Dd<7
1,(I?0K1^F/i,ID1b^gI2Dd<71,(I?0K1^F/i,ID1b^gI2Dd<71,(I?0K1^F/i,ID1bg[B1,Cd1
1,(I?0K1^F/i,ID1b^jD1,:X.1,(I?0K1^F/i5@D3B8iP1G_!51,(I?0K1^F/i57>1H7*L1GUs5
1,(I?0K1^F/i5@A0f_3M1,^m11,(I?0K1^F/i5@B3&!0G0eb=)1,(I?0K1^F/i5C>2`*BK2)7'4
1,(I?0K1^F/i5C>2`*BK2)7'41,(I?0K1^F/i5C>2`*BK2)7'41,(I?0K1^F/i5C>2`*KM3AEK9
1,(I?0K1^F/i5C>2`*BN0Jtj51,(I?0K1^F/i5@D3B8iP1G_!51,(I?0K1^F/i5@E2`!9F1GLU5
/1<V90JYI=2_d6D2Dd3L0K:jE2)-U8/hf"?2`WiQ3B&cN2)$jE1,LaB.VULj+>G;r-p07-1*eV/
1,L[D0fL^A0KCpE2`EQJ2]sk01,L[D0fL^@3&NQL1c[EL1E\G,1,L[D0fL^A1H@0F0fM'I3$9t1
1,L[D0fL^@3&NQL1c[EL1FXk'4>JTG1b^jC2_I!F1bpgG2`WfR.pk%c1,L[D0f:RA1c-sC3&`iV
1b*2l0d&5#/1<V9+?(Q$0JYI=2_d6D1H73J0ebL@1Gp:10JYI=2_d6D1H73J0ebUJ2BXb/1,L[D
0fL^A0JPL@3&`WR1a"P-1,L[D0fL^C2E3QL3&ilW1a"P-1,L[D0fL^@3&EHG2E3TO2BXb/1,L[D
0fL^@3&EHG2_m-D1E\G,1,L[D0fL^@3&EHG2_['I1*A>+1,L[D0fL^A1bgpG3&<QL3$9t11,L[D
0fL^A1bgpG3&`ZS2'=Y.1,L[D0fL^A0JPL@3&`WR1a"P-1,L[D0fL^C2E3QL3&ilW1a"P-1,L[D
0fL^A1bgpG2)R*K2BXb/1,L[D0fL^A1bgpG2)d3H3?U(21,L[D0fL^A1bgpG2)R*K2CU1*4>838
-p014/1<V7.4cl00e"Y90E                                                    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
