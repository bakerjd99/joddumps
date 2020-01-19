NB. JOD dictionary dump: 19 Jan 2020 10:14:40
NB. Generated with JOD version; 1.0.1 - dev; 3; 19 Jan 2020 10:08:40
NB. J version: j901/j64avx/windows/release-c/commercial/www.jsoftware.com/2020-01-11T13:27:52
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|225346394776877887587393570006481670086|
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

JODTOOLSVMD=:'1.0.1 - dev';3;'19 Jan 2020 10:08:42'

JODVMD=:'1.0.1 - dev';3;'19 Jan 2020 10:08:40'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


updatejoddistribution=:4 : 0

NB.*updatejoddistribution v-- updates files in JOD distribution.
NB.
NB. dyad: blVersion updatejoddistribution blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 08may28 removed install bats and scripts - simplifies JAL maintenance
NB. 08sep24 added history.txt to distributed files
NB. 11feb14 coinsert 'ijod' added,jod.pdf removed from zip
NB.         google/codeplex directory update removed
NB. 11feb17 jodpdf.txt directory placeholder added
NB. 11may18 joddoc/linuxnotes.txt added
NB. 12jun20 (setjaddonpaths) added for win, linux, mac path
NB. 12jun22 added (macnotes_TXT) 
NB. 12jun25 forcing line ends (toJ)
NB. 12jul07 copy dist zip to dropbox folder
NB. 14jun25 remove dropbox folder copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/state/... directories
NB. 15jul15 remove (jodindex_HTML) large obsolete object
NB. 17mar14 converted to verb
NB. 20jan19 added code to add icon files: jodcube.ico, jodcube.png

'JODSTAGEDIR JODGITDIR'=. y
jodversion=. ,>0{x

NB. scripts, labs and bats
NB. !(*)=. historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump
NB. !(*)=. LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak jodpdf_TXT linuxnotes_TXT macnotes_TXT 
sl=. 'historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump'
sl=. sl,' LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak'
sl=. ;: sl,' jodpdf_TXT linuxnotes_TXT macnotes_TXT'

rc [ 'rc jodscr'=. 4 get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests manifest script 
((0!:110) :: 0:) manifestjod

NB. update files
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodparms.ijs'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodprofile.ijs'
assert. 0<(toJ historyjod)    fwrite showpass JODSTAGEDIR,'history.txt'
assert. 0<(toJ historyjod)    fwrite showpass JODGITDIR,'history.md'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodbak/jodprofilebak.ijs'
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodbak/jodparmsbak.ijs'
assert. 0<(toJ joduserconfigbak)  fwrite showpass JODSTAGEDIR,'jodbak/joduserconfigbak.ijs'
assert. 0<(toJ manifestjod)   fwrite showpass JODSTAGEDIR,'manifest.ijs'
assert. 0<(toJ labexample001) fwrite showpass JODSTAGEDIR,'jodlabs/labexample001.ijs'
assert. 0<(toJ LabDump)       fwrite showpass JODSTAGEDIR,'jodlabs/labdump.ijs'
assert. 0<(toJ jodintro)      fwrite showpass JODSTAGEDIR,'jodlabs/jodintro.ijt'
assert. 0<(toJ joddump)       fwrite showpass JODSTAGEDIR,'jodlabs/joddump.ijt'
assert. 0<(toJ jodbest)       fwrite showpass JODSTAGEDIR,'jodlabs/jodbest.ijt'

NB. store jodpdf.txt place holder for jod.pdf - available online
assert. 0<(toJ jodpdf_TXT) fwrite showpass JODSTAGEDIR,'joddoc/pdfdoc/jodpdf.txt'

NB. store linux/mac specific notes
assert. 0<(toJ linuxnotes_TXT) fwrite showpass JODSTAGEDIR,'joddoc/linuxnotes.txt'
assert. 0<(toJ macnotes_TXT)   fwrite showpass JODSTAGEDIR,'joddoc/macnotes.txt'

NB. copy jod icons from *.tex document directories - these binaries are not stored in JOD.
assert. fexist png=. jpath '~JOD/joddev/document/jodgraphics/jodcube.png'
assert. fexist ico=. jpath '~JOD/joddev/document/jodgraphics/jodcube.ico'
assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'


smoutput 'JOD staging directories updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GU(1+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P]DH:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]
FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!*?c
Ci`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1
Amo1\.7nhX:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS:JXY_<_YtS:IJ/X
:J=\0G%G]8Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCb      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DZI6+>Y,p2'=Xs2)m?H+>PVn1*AG63B/-90H`+n1,(O@3$9q1+>P&o1c@'20f^@3+?;G9+>Get
1*A;-2D[s$6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,'gn6t(1K3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N
0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K
3Zp1<+AH9i+>PW*3?U%73]&NO1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,C$q6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GB.C$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*3?U%23\rKO1H>dL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_
+>PW*3?U%33\`HP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWR$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@21HI?J3\rZ$
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_
+>PW*3?U%53\rZT1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+>>So:LeJh1,(FC+>>f:2*!]T1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg0d'50Fs&Oo
0f^@20fh$J3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+?:Pe6t(1K3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBII$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*
3?U%43]/]S0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0esjo6t(1K3Zp+3+@KdN+>PW*3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4+@KdN+>PW*
3?U%13\iWT0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B7E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*
3?U"93\iZU1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fU9u6t(1K3Zp+6+@KdN+>PW*3?U%33]/iW0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0fTLI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp+7+@KdN+>PW*
3?U%13]/oY0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,0mo6t(1K3Zp+7+@KdN+>PW*3?U%23]&NO0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+7+@KdN+>PW*3?U%43\`EO0Jj+D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*
3?U%53]&NO0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,L*r6t(1K3Zp+7+@KdN+>PW*3?U%53]&QP0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8+@KdN+>PW*
3?U%43]&QP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0fTLI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0K:1CARci<0JPR10KD0N
2``]R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp+9
+@KdN+>PW*3?U%13\`BN2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's
3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC2``]O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp+:+@KdN+>PW*3?U"93\iNQ0f]RJ$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6G
$47,867sBZH#n(=D)re3:IH<f4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Yhs
+@KX[ANCqg1*Atr@j!N\0f^@21HI6I3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@KdN+>PW*3?U%23]&]T0es(C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get6tKjN1,(FC+>GZ5
1GV!H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU0f^@K@;[2C0JY=)0ebXB3'&lM$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"EZd+k
0f^@22``]M3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp14+<X'\FCdKU0Jjn<E,m'V0JPR10f_9K1HI6E$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i1,(FC+>Gc81b^sI
3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q
6t(1K3Zp1:+@1-_+>PW*3?U%23\W6K1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/B-8r`0f^@20fh*F3]&Mt$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU1,g=A
F_;gP0JPR10etdE1cd?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u2BX,1@<?'A+>Pku6$6f_1,(FC+>GW41,:mE2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*3?U%4
3\rZT1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp1<+@1-_+>PW*3?U%43]&TQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1H,XJ$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+4+AZKh+>PW*
3?U"93]/oY2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.3+AQiu+>PW*3?U%13\`HP1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS1,oUJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp1<+AQiu+>PW*3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh3?V(8Fs&Oo0f^@22**QS3\WQ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0JXb=ARci<
0JPR10f(jJ1HI3H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX
1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q
+@KX[ANCqf1E](s@j!N\0f^@20KLsJ3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0Jah>ARci<0JPR10f1pI3'&lV$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>>Vp
6tKjN1,(FC+>G]60f;!I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1boCF$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqf2'>:u@j!N\0f^@2
1-.9O3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp.;+<X'\FCdKU0Jst@ARci<0JPR10f1pF1-.-M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3Zp+7+@KdN+>PW*3?U%23]&NO0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqf2BYD!@j!N\0f^@21HI6H3\WDu$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0K(%AARci<
0JPR10f1pJ0KLsC$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1a!o/@<?'A+>>\r6tKjN1,(FC+>G]61bh$G0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR
1cGaK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht
+@KX[ANCqf2]tM"@j!N\0f^@21HI?I3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0K1+BARci<0JPR10f(jJ2EE]P$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>>_s
6tKjN1,(FC+>Gf91Gh-I3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=Wi
D.7's3Zp1<+<X'\FCdKU0K:1CARci<0JPR10KD0N2``]S$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf3$:V#@j!N\0f^@20KLpD3]/c%$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp+9+@KdN
+>PW*3?U%13\`QS1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!
E]P=!1*@]-@<?'A+>>eu6tKjN1,(FC+>>f:1,M$I0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heCj6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6H$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0f1"@
ARci<0JPR10ek^G2**HI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU0fL4CARci<0JPR10f(jH1-.0L$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f^@K@;[2C0JY=)0ebXB
3'&lO$>=-pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen4+>"]aF`)52Ch7$rA18W1$4R=b.Ni,6De*@#
@V%0+@rG`t@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJAS!nF?tsXhFD)dEIP5,?
A8c@,05"j6ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4F(KH8Bl7Q+:K&BM@rH7+
+EV:*F<G%5@;]Tu8l%htA8-'q@ruX0Bk;?:%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC
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
F!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iA
F(96)E-*a4AQWPb=)`D$CbBF:Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2
+EMXFBl7R)+CT;%+Du+>+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"DIml3
Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$4."J$6UH6
<+oue+Cf>-AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL%13CJ
E,9H7+<VeU@:WneDK@IDEa`p#Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16EZdss
2D-[<+D#G$ARlolDIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_ADf-\6
BkCp!F*2G@DfTqP%13OO+=\LADIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.
@<6L(B5VQtDKI"4EcQ)=/e&.1%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:
@WNZ.Bkq9&FD,B0+:SZ#+<VdL+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqP
#mh%J+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,ATVU(
A3k6KF_t]-FE8lo/g)hW$6UH6+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,#mh%J
+=\L"+Dtb7+DtV)AKYE!@;L41BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc
@<?Qu+EVN2$6UH6Dg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%
D..Nt+A*bq@<?U&Ec*!/$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1+<V+#
+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%67sB/
A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)?S[$^
Bm;'L/1)u5+@K1-8Q\>T%144#+<VdL+<W(CDCI_0+Cno&%13CJ%144#+B3#c+E2@4G%kl;F!+t+
@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu+<Ve?
@<Q3)@V'+g+CSekARlp*D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP#mh%J+<VdL+<VdL
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
Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9$6Tcb+:SZp@;]dk
ATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2
@<-W@%16-);H$._:-CWc0eP.40d&%jA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]
9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A
%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)
Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKi
A8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16ig
A7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"
E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<
@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I
;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIa
F<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et
+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2
DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065
Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1
BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<
<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4
+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f0
6?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#
@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%ht
Cggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1
@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2
+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]o
F*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\
-S[5-/heX^$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)
<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:
$?0NfA8bs2C2[W8E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+
FAR!d@ruEpATLOR@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.
9OVCOBl6OcE-ZP:E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)d
A7f@j@kUi'Bl7QU:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6
DK@FLA7c8X.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2
Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-X
F_t]-F<G".F)N12Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*
F(fK9+D>\;+EVNEF`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T
$4R>WE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])
AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c
+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;
C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$
3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`
Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR
:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX7
0J5(&/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0
Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrG
Bkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk
;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\
0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&
FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p
$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q
+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&
FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ
6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!
+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1
F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A@q?cn
Bk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&
F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6
<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&
DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq+<jER6m,EH
F`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8
Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>BOr;[
@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbt
Df0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?
FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJB
DfTJDFD,5;C2[W7E+*Bj0+A7;%13                                              ~>
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
zz=:zz,'RR099 ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGR'
zz=:zz,'OUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 '
zz=:zz,'OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 O'
zz=:zz,'K064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsf'
zz=:zz,'x apptable appwords backupdates badcn bchecknames bgetdicdoc bgetex'
zz=:zz,'plain bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit chec'
zz=:zz,'kback checkntstamp checkopen checkpath checkput closedict createst '
zz=:zz,'defwords delstuff delwordrefs didstats dnlsearch dupnames freedisk '
zz=:zz,'freedisklinux freediskmac freediskwin fullmonty getdicdoc getdocume'
zz=:zz,'nt getexplain getgstext getntstamp getobjects getrefs gslistnl inpu'
zz=:zz,'tdict invappend invdelete invfetch invreplace islib iswriteable isw'
zz=:zz,'riteablelinux iswriteablewin jdatcreate jwordscreate loadalldirs lo'
zz=:zz,'adallrefs loadwords mainddir mnlsearch newdparms newregdict nlctn n'
zz=:zz,'lpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdi'
zz=:zz,'cdoc putexplain putgs putntstamp puttable puttexts putwords putword'
zz=:zz,'xrs rpdtrim rplctable rplcwords sortdnub splitbname''               '
zz=:1526{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P'!+>bc,12:`<F*)>@APPQE.V`m4F*)>@AKYJ7/Kf+VDfT9!AKYo#C1Ums+Cf4rF)sAb
AU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g*]!A7]g)FD,5.F`(`$Ebp#8DJ()&@<>pe@<6!5
Anc'm+EMgLFCf;3F`V,)+EVNEF*)>@AISuA67sBkBk)7!Df0!(Gp%$7C1UmsF"SS5AT2Ho@qfgn
+EV:2F!+t/@<6K4BlbD*Cht59BOQ!1Et&IO67sC$AT;j,Eb/c(FDi:3BOPdkAKZ).AKYMt@ruF'
DIIR2+EMXCEa`Tl+EMgLFCf;A%15is/e&._67sB]ATD6&Bl8$(Eb8`iANC8-:-pQU+<Y-'BOt[h
DIIBnF!)T8BOt[hF!+q#@r$4++DtV)AKYr#FED)7DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oA8,OaDdsn4+D58-+C\bhCNXS=G%G]8
Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d<De!p,ASuT4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<V+#:-pQU+<Y-+ATVL.E,8rsDBL'7ATT&(@:O(qE$0=8EcYr5DK?q=Afu/.DfTqBDdmHm@rri)
G]7J-DIIX$Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oB6/0+G]Y&N
+D58-+C\bhCNXS=G%G]8Bl@m1+E(j7B6%p5E%c9TBlmo/BOtU_ATDi7+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFDkW'ARfh'+<Y<.F<GL2C1UmsF!,(8Df$V+@:O(q
E-!-E+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU
+<Y-2Cia/rEarc*+<VeJARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;+D,P4
+EM76E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,q-$;No?+<Ve9DKTf;+<VdL+<VdLEb0?8Ec,q@
F`(o5F_)\)@:O(qE$0(>A7]dmA0>]&F*&OCAftVu@ruF'DIIR2+C\bhCNXS=DKTf*ATDi7+<VdL
+<VdL+<VdL%15is/g)8Z@q]F`CN"0'DBL&E+Cf(r@r$-.BkAJrDL!@8Bk)7!Df0!(Gp$gB+E)41
D@HqJ67sB'+Cf(r@r$$lFD)d>+<Y0-ARfLs+CfP7Eb0-1+E1b2BHU_r@;0V#F<G+.@ruF'DIIR2
+E1b2BFP;D67sB'+Cf(r@r$%+F<D\K+<Y0-ARfLs+DGF1Anc:,F<GO2FD)e-Bk)7!Df0!(Gp$gB
+CQC3F`\a:Bk)7!Df0!(Gmt*U67sB'+Cf5+F(Jlr@rrh9+<Y01Df]K2+Co1rFD5Z2@<-'nEt&IO
67sB'+CfG'@<?(%F<D\K+<YB9Bln&tCh\3,F!,OGDfT9!AKYo#C1UmsEt&IO67sB'+Co%qGAhM4
F!)SJ+<Y3+Anc-o+EqaEA9/1e:-pQU+<Y3+Cia]@AnE/.+<Ve;ASbq"AKYo#C1UmsEt&IO67sB'
+Co1sF*(i4F!)SJ+<Y3/@ruF'DIIR2+EMX5FD5f<Bk)3,@;]TuE+*j%+DG_*DfT]'FD5Z2%15is
/g)8ZA8Z4)ARTUhBHSE?+EM+&Earc*AoD]4DIIBn+E1b2FCfK1Et&IO67sB'+D58-A8bt#D.RU,
+<Y<.F<GL2C1Ums+CoD#F_t]-FCB9*Df-!k:-pQU+<Y<.FCf]9Cgh$q+<Ve>ATT&9BQ%p5+E(_(
ARfg)AU&01@;]LqBl@m1%15is/g)8ZB4Z0tF*(u<F<D\K+D58-+D5_5F`8I3DIal2F_Pr/+EM%5
BlJ/:FCf]=%15is/g)8ZB4Z1&FE;P4D/^U?+D58-+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF
+EV=7ATMs%D/aP*$;No?+<Ve>ATVj"C1UmsF!)SJB4Z0-DdmHm@ruc$$;No?+<Ve>ATVs(Aof(;
+<VdLB4Z0-Eb/ioEb0,uATJ:f:-pQU+<Y<<Ch[s4DJUF<+<Ve>Ec6)>+CT.u+EM[>FCcS4@;TQu
Ch[s4Et&IO67sB'+DG_4F`_/.@rrh9+<Yc;F*&O:DfQt=@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2
%15is/g)8ZBl8*&E,]B+A0<!;+CT5.ASu$$Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:A7]RgFCcR;
+<Y3+Ch7^"+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%P<-@qZu-+<Ve=ATVEq+DG_:ATDm(A0>Dk
FC>Uc:-pQU+<YB9G&h/5Cgggb+<VeLE+EC!AKY])G%G]9ARloo@<>oe$;No?+<VeEATr0+B4P^d
F<D\K@rc-hFCcS4ATo88EZfC6B5)F/ATAo(Bk)7!Df0!(Gmt*U67sB'+E)41DIdHkF<D\K+<YTA
ASrW!+Co1rFD5Z2@<-W&$;No?+<VeG@<?1#C`jiC+<VdLE+*j%+DtV)AKYf'F*)I4$;No?+<VeG
F`_2>E,8rsDBL&EF*)>@AKZ&-DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<VeGF`_8;+<VdL
+<VdLF*)>@AKYW+Dfp#?+CT.u+EM[>FCfM&$;No?+<VeGF`_MCF*(i-E$-8GF*)>@AKYl!D.P7@
@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1@;Tt)%15is/g)8ZE-68E@:F%a+<VdL+EMXCEb-@A
DIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Ys$;No?+<VeGF`__:G]\!L+<VdL
F*)>@AKYo#C1Ums+CoD#F_t]-FCB9*Df-\+DIal&Ec6)>06;8MFCcS:AU&<<%15is/g)8ZE-68H
DfTB0+<VdL+EMXCEb-A;DfTB0%15is/g)8ZE-68HDfTB5EcW?G+EMXCEb-A;DfTA2B5DKq@;I',
AS,LoASu!hEt&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuCA92j2Eb-A6
@;]^h+>>Z,/MT(B.1HUn$=e!aCghC++<W%?C2[X(FDl22-OgDmDeX*1ATDl8-Xgb.A1%fn%15is
/h1CCE+NotASuU2+F#Ii+A,EtF*)>@AKYMpE+NotASuT4A7]@eDKKT2DK?6o%15Ht9gMZM4ZY8>
+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+Cf>4DKI"0DIal3Bl.F&FCB$*+DkP-CCLV<:/"5X<'<9!
+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G:8A7^!.Ch[s4%15Ht6VgEQ;a!0!
+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+Cf>,E,TW*DKI";BleA*$4R>;67sBt
@;0U%A8-'q@ruX0Gp$^5Ch4`!Df'H3DIm^-+Dbb5F:ARE:..ZO4ZYr*9gMZM/430+8Q/S>6V^!E
9i+at$4R>0:.%]@;c>h?2BX+b+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrWbEb$;1@;TQu@r,RpF!,CA
+DkOsEc3(BH#R=($:@QU;FNlN8P`)E3]J6):-pQUAnc'm+Cf>,E,TW*DKIo^GA(Q*+E(_(ARfg)
G@>P8Anc:,F<G(6ART[lA.8l5:..Z@6r-053\hg#+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'
DIIR2+CoD#F_t]-FCB9*Df-[L+=M8AB4NG#$:@QW=AV[W8PVE00ejdn:-pQUAnc'm+Cf>,E,TW*
DKIo^F(fK4F<G.>E,8s#@<?4%DK?6o6V^HD;GC(Q3\qm$+<Ve%67sBmBl%?'@rH4'Df0-(F?1OT
Bk)7!Df0!(Gp%'7Ea`frFCfK6%15Ht:fUI_5u^993]A0(+AP6U+D,>(AKYK$D/aE2ASuTN+DbJ-
F<G[>D.Oi.@VTIaF<Gd9F!)lMF`]&A$:@Qd77KF$2(NAn1*A=p:-pQUEb/ioEb0,uAKYK$D/aE2
ASuT4FCAWpAISu6:/XnS<(K/50f^@!+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrHSAn?!oDI[6#E+*j%
+>"]aA8,RlF_rQMCh[s4%15Ht;b:.]4ZYSG+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EM7CAKYo'
+E(_(ARfg)Bl5&&H$!V=%13OO:-pQUBl8**Ecbl'+D5_5F`8I3DIal2F_Pr/+Cno&@3B/rCh4`!
Df'H3DIm^-Et&IJ:0'k_:K:4i4ZX]Q:/Fqi6pXd@/430";FNlN8P`)46V^'P:eX/H:(7P%:0(:n
8Q8,W4ZX]W:0'k_:K:4i%13OO:-pQUBl8**Ecbl'+DkOsEc3(/DIal6DfTA2A79Rg+D,>(AKYK$
D/aE2ASuU2%15[%<_YkI;GU4S3Zpdb6VKdE;_1:2:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$
79EA[5tOf\$;!un=&2^^;a!/a+A#=/9gM-E:K%]0%15is/g+kGG%G]9ARlp*ATMr9A79Rg%15[%
<`DLd<)Yq@+@An#<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%%15is/g,%?D.P>;
+E)9CDIIBn/oG*7AKZ&*E+*cqFDl1B@q]:k@:OCjEX`@N6r-cF3[ZO-+:SYe$;No?+EVX<D'3k5
B4uB0.!0K<Bl%L$B.4sB@<?0*A7]RkD/"*'EcW?H-n6Z//g*tV<(KDG9FV>LE+F'2Bl-!o>p(A@
+BplL/M8/M3Zon)03g+P:dJ&O6q'cn?Q_KS>n%,M$;No?+EML<BlkJ,@:O(qE$0%,D.Oi/@<?U&
Ec*"0C^g_mE,961@W#UkAN`'s-r*0+<$l'cAoD^$F*)FF4!79d:K/ZLAoqU)F*)FO%13OO:-pQ_
ASu$hAT23uA7]Y#Er                                                         ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&n+>GZ41hpr>A7]p,/KdY]6m-#OG%GK.E,B0(F:AR?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>MC2[WnAThH(BlbD=BOr;Y:IH=9AThX$DfBQ)DKI!NE-67FA8,OqBl@ltEd98e>@'$i
%15[K+DGm>FD,5.Anc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+E(j78l%ha$=e!bAKYMt@ruF'
DIIR"ATKI5$4R=b+<VdL+<VdL+<Y3/A0<QK+:SZ#+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$6UH6+<VdL+FGnkC2[WnATiH9De+6<FD5Q4HjpE*+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$4R>ABPDN1E+*j%+DGm>FEqh>@ps0rDe:+a:IH=9AThX$DfBQ)DKIKR:1\Vl@;]Tb$?g?(@<?4"
AKYK$A7ZltF!,OGDfTE"+DG^9@3@%=F`\a:ATfOGA8,OqBl@ltEd98H$;GGZAKZ&9@:F%a+EMgL
FCf;3@rGmh+DGm>AoDg0A0>T(+<k?-AT24$+s:<7@q]S"@;I%q$=mj\FD5Z2@<-'nF!+n/A0>Ju
DII?tGp$U8D/F3/+D58'ATDKp+E_d?Ch\!*ATJ:fFCfK0Bl7@$AKZ).AKYr#FD*99$4R>ABPDN1
@<-BsDJ*NtASuT4@WH1#B6,24@;^?5@V'FgAnc@./g*_t+F.mJ+D#(tF:ARc+EqaEA0>u-@<<W+
F!,")Anc-oA0>DoAT24$+E)-?FD,5.E+*j%+EV:.+:SZrEbT0#DII?(GAhM4+DGm>Eb0?$Bl7Km
+=_MO@q]:gB4YU+.Nh-%D/aPI+:SZe@:O(qE-!.1DIal1AM%q6An?!oDI[BuB-;,3ATD4$Bl@m1
+CT;%+Dl72BHUnqF*(u6%16Nb+EV:.Gp$O9AKZ28EbfB,B-;D4FD)e5ATMo8D..NtEbSru/g*Gt
A1Sj;AfqNiH#IgJF(KG9@;Ka&@Wcc8FD,5.E-67FA8,OqBl@ltEd8d8;FNl>:JOSd?n<FGDflKr
E,oN5ASuT4@:Ne]A7]Y#@;I&rBOPdkATJu9D]j+C@:F%a+Cf>#AM+E!%16'JAKYMt@ruF'DIIR2
+CoV3E-!.0C2[WnAThH4+CJr&A7-NgDIaktF`_>6F'oFaA8-+,EbT!*FCeu*@X0)<BOr;oC2[X(
Dfp)1ARHWhA7TUr+D>2,AKYo#C1Ums%172kD.Rd1@;Tt)+EVaHDIm?$De<T(FDi:BARopnAKYT!
Ch4`1BmO>C%16-IEcYr5DK?qEBln#2DdmHm@rri8Bl.F&FCB$*F!+n3AKYE)@;0Od@VfTu%17#k
+@g-f89JAaF(JoD%13OO0eOSQ?tsUjA7]pl>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl05Y-=FCfJGC2[WnATf\?C3(g5$4R=t/g+A+C2[Wj>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGC2[W8Bkh]<%13OO1G0eS@!-R*Ci`ui
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A
.1HUn$4R>H?85_H+B3#c+D,>.F*&O8Bk)7!Df0!(Gp%$C+CQBb:IH=E@<?0*BlbD,@;KakA0;<g
+<VdL+<Yc>AKWIAF`\a:Bk)7!Df0!(GqLQ                                        ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql!,8l%ihDKKH1Amo1\+A$lO:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et
<)6:`;cZU\+A,Et<_Yt)F`:l"FCf3*A7TCqFE2))F`_>9DC6ka-p01/0I\P$4=iTBC2[X(FDl22
-RgSp4>8$7.4cl04?G0&0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+D>J1
FDl2FC2[W*D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*C2[X(Dfp)1ALAoX
-p07-2C(%30f^sD0f1L>3&roQ1G^gB+>PW*3AE9D1bLUE3B&]L1G^d/1,(FC0etI?/i5OJ2_m0F
1GU(.0JPRB1,1U<1cRKS1-%'E0d&5*0f^sD0f1L>3&roQ1H%6M+>PW+0JG493A*-C3B/fO1b^p4
1,(I;0JP:B/i5==2E3]P1H-F30JY=90ek[@1bpgE3&r`M2]sk01,(C:0f^jC1,:aI3ANBL+>PW+
0JG493A*-D1,gmH2_m<71,(I;0JP:B/i5==2E3]T0K(%/0JY=90ek[@1bpg@1H%3K3@QL-4>8$7
.4cl01,(FC0etIA/i>IB2`<EH3%J>k0JPRB1,1U<2)I-K2DR$I.VULi+>PAs-p01/0I\P$4>J$;
,Vh&.3AE9D1bLUE3B&]R0etI+1,(FC0etI?/i5OJ2`!-A1,C%.0JY=90ekI:2`NQH3A`KJ3$9t1
0f^sD0f1L>3&roQ1GpmH+>PW*3AE9D1bLUE3B&]L2E<T:1,(FC0etI?/i5OJ2_m0H0fU:20JY=9
0ek[@1bpgF0K;!H2]sk01,(C:0f^jC1,:dC0JPLB+>PW+0JG493A*-B2)@0M1Gg400JY=90ek[@
1bpgE3&rfN1E\G,1,(C:0f^jC1,:aI3ArQL+>PW+0JG493A*-D1,_*P1bpj9/1<V7.4cl00I\P$
4>A99-p014/3GT                                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
