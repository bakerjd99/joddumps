NB. JOD dictionary dump: 11 Feb 2020 19:31:20
NB. Generated with JOD version; 1.0.1 - dev; 4; 22 Jan 2020 17:52:55
NB. J version: j901/j64avx/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:15:50
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

JODTOOLSVMD=:'1.0.1 - dev';4;'22 Jan 2020 17:52:58'

JODVMD=:'1.0.1 - dev';4;'22 Jan 2020 17:52:55'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets/creates paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore
NB.
NB.   NB. the monad returns the locations of JOD directories.
NB.   setbuilddirs 0
NB.   
NB. dyad: blcl = uuIgnore setbuilddirs uuIgnore
NB.
NB.   NB. the dyad creates all the directories
NB.   NB. required to build the JOD addons.
NB.
NB.   'test' getrx 'setbuilddirs'
NB.   1 setbuilddirs_test_ 0

NB. mask locale references to enable:  getrx 'setbuilddirs'
NB. !(*)=. jpath_j_ JODobj_ijod_ DPATH__ST__obj locsfx__JOD__obj

NB. assumes JOD is loaded with (JODobj) visisble to (ijod)
0 setbuilddirs y
:
obj=. JODobj_ijod_
locx=. locsfx__JOD__obj {.{:"1 DPATH__ST__obj
aliendir=. ".'ALI',;locx
JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath_j_ '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath_j_ '~addons/general/jod/jodexts/'

NB. main build directories required by (buildjoddistribution)
corebuild=. JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR

if. x -: 1 do.

  NB. create build directories under (alien) - some dictionary directories exist
  stagedirs=. corebuild -. JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
  stagedirs=. stagedirs,<jpathsep aliendir,'stage/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/'

  NB. core addon directories
  stagedirs=. stagedirs,<JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodbak/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodlabs/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/pdfdoc/'

  NB. class source 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodijs/'
  
  NB. unit tests 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/smoke/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/basic/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/large/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/stress/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/crush/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/prepare/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/purge/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/extend/'
  
  NB. creation order matters
  showpass 'created directories'
  showpass >stagedirs=. /:~ stagedirs
  makedir"0 stagedirs 
end.

corebuild
)

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
1H6L8+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P\p0esk.1.cda:IJo7FCfK)@:NkYDfTD3
8l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s
8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*
A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td
6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk
F(KH&F_PZ&A8-(*F(KH704T$6@<?(%+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaEA9.      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*AG72DH=/0d&4o2_[!01,'h++>to11*A;++>P&t0JPF-0eje++?2/7+>GSn
1*A>01H?R40H`+n1,(UA1*A;++>P&o1c@'20f^@3+?;G9+>Get1*A;-2D[s$6pamF9LMEC;cHOj
=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K
3Zp15+AH9b+>PW*3?U%83\iKP1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0K9CH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp1<+AH9i+>PW*3?U%73]&NO
1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K
3Zp1:+@1-_+>PW*3?U%23\W6K1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&
:3CD_ATBgS1,L*r6t(1K3Zp1:+@1-_+>PW*3?U%23\rKO1H>dL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fB@G$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pku6$6f_1,(FC
+>GW41,:mE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU1-$ICF_;gP0JPR10f(jH2EEWR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!Y
A0=WiD.7's3Zp7%+@KX[ANCqh3?UV1B-8r`0f^@21HI?J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1<+@1-_+>PW*3?U%53\rZT1GoLH$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>>So:LeJh
1,(FC+>>f:2*!]T1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg0d'50Fs&Oo0f^@20fh$J3\iZ%$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1<+AQiu+>PW*
3?U%63]&WR1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0ea^m6t(1K3Zp1<+AQiu+>PW*3?U%63]&iX0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S0Ja%C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp+3+@KdN+>PW*
3?U%53\rHN0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f'pp6t(1K3Zp+3+@KdN+>PW*3?U%53]&iX1GK4D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp+4+@KdN+>PW*3?U%13\iWT0fTLI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*
3?U%53\r`V1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0fC-s6t(1K3Zp+5+@KdN+>PW*3?U%53\`KQ1,B7E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp+6+@KdN+>PW*3?U"93\iZU1bf=E$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp+6+@KdN+>PW*
3?U%33]/iW0JNnA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp+7+@KdN+>PW*3?U%13]/oY0JNnA$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+7+@KdN+>PW*
3?U%23]&NO0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp+7+@KdN+>PW*3?U%43\`EO0Jj+D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%53]&NO0f]RJ$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp+7+@KdN+>PW*
3?U%53]&QP0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,U0s6t(1K3Zp+8+@KdN+>PW*3?U%23]/ZR1cGaK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+8+@KdN+>PW*3?U%43]&QP0fB@G$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*
3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,pC!6t(1K3Zp+8+@KdN+>PW*3?U%83\rTR0fTLI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj
6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0K:1CARci<0JPR10KD0N2``]R$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp+9+@KdN+>PW*3?U%13\`BN2)P^J
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<
0JPR10ebXC2``]O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1GU'q
6t(1K3Zp+:+@KdN+>PW*3?U"93\iNQ0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!Y
A0=WiD.7's3Zp47+<X'\FCdKU0KC7DARci<0JPR10ek^C1-.6G$47,867sBZH#n(=D)re3:IH<f
4C`;HD.RU,ARmtg+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Yhs+@KX[ANCqg1*Atr@j!N\0f^@2
1HI6I3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]
6t(1K3Zp.6+@KdN+>PW*3?U%23]&]T0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,
+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Get6tKjN1,(FC+>GZ51GV!H2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0f^@K@;[2C0JY=)0ebXB
3'&lM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[
ANCqh1*B1tDBL\g1,'h*2``fO3]/c%8l%iMDffQ3?Ys=/2[p+%8l%iMDffQ3?m'0)F*2&806Co<
CND.<F_>bK@VKpoBOu6-GA2/4+CfP7Eb0-1+A,Et+EMgLFCf<1?k!H+4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:2b5cF!+n#Dfp.E
@s)g4ASuT48l%ht@:WneDK@EQ<+oue+CoD#F_t]-F<G:=%14S(Eb/`lA7]g3+CJksF*)>@H"q8.
?nNQE?ta7qFDl2FC2[Wj+Du+>ATJu&@ruj%C`m5$@;]^hF"SRE$;#;[F_,V:DJsW.A0>PsEb-A1
@<iu5AThX*+C\n)@:WnhATMp(A1eurF)uJ8F!,R<@<<W/BkM+$%16QU+CSekEb0<5ARlp-Bl%T.
@V$ZuDeE]oA0>T(+B2-):NJQ>F(JoD%13OO0eOSV<)5nX?V4*^?Ys=]+DGm>>A/,#E-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r,FPA6gTsFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX/o>,J/e&-s$4R>;DffQ3+CT5.ARTU%Ao_g,
+ED%'ASuT4FDi:?Ch.*uF<G"0A0>o(An?!oDI[6#FD,5.@s)g4ASuT4DfQt<AU&;>8l%htEb0&u
@<6!4%13OO,9nEU7V-%LF^]<9+>GQ$+>PW+0H_Jm/hen4+>"]aF`)52Ch7$rA18W1$4R=b.Nh2p
GT^C'B4Z0m+EVmJD]ib3+DPh*/oY?5+CINSFD)e=@;BEsCh[s4F!,C5+DtV)ATKJ3%144#+<V+#
+<Vd9$4R=b+<Vd9$4R=b+<Ve!:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf9
1,CsJ0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@22EEZK3]&f'$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU
1,g=AF_;gP0JPR10ek^C0KM!F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,
+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_1,(FC+>GT31GLpI0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*
3?U%33\`HP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pht+@KX[ANCqh2]tD/B-8r`0f^@21-.0G3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWS
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
1-$ICF_;gP0JPR10f(jI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3b
Ch+Y`F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR10f1pI2EEWQ$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0JahI@rrhK0JPR10KD0O
3BB#R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D2``]R$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IP
Dg!6Y0JPR10f;!K1HI?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC+>G`71c[TN3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%4
3]/]S0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqf1*Atr@j!N\0f^@21cdEH3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A
+>>So6tKjN1,(FC+>GQ21,h6K3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cYmM$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\
0f^@21cd?K3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L3'&lO$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>Yq6tKjN1,(FC+>GW42)dQM
1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!
6t(1K3Zp+6+@KdN+>PW*3?U%53\W<M0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf2BYD!@j!N\0f^@20KM'O3\W8q$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%A
ARci<0JPR10ek^G0KLmJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1*@]-@<?'A+>>\r6tKjN1,(FC+>GZ50f(jE2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%5
3]&NO1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pbr+@KX[ANCqf2BYD!@j!N\0f^@21cdHJ3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A
+>>_s6tKjN1,(FC+>GZ51bh$G2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,
+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\
0f^@22```O3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS
1-$I"6t(1K3Zp+9+@KdN+>PW*3?U"93]&cV1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5%%+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>bt6tKjN1,(FC+>GQ20etdI2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR1
0ebXC2``]P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Ybq
+@KX[ANCqf3?U_$@j!N\0f^@13BAoP3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp+:+@KdN+>PW*3?U%23\W<M1bf=E$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@KdN+>PW*
3?U%23]&]T0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.9+@KdN+>PW*3?U%43\rNP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+A-'[+>PW+0H`)(3\WNS1boCF
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp15+A-'[+>PW+0H`)/3]/ZR2)kq=9LMKK6r%ZBATKUa:-pF+9LMKK6r%ZBATJu9/M/)@Ch+Y\
:IH=9AThX$DfBQ)DKI"=DffQ3/e&._67r]S:-pQU@rc-hFCeuD+>PW)2.U9.0eje&%15is/g+Y;
@;]^hA3(hg0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^%13OO;e9M_-q[9':2b5cF"&5D
DfQt;DfTD3Eb/`lDKI"=DffQ3/g*GrF)N1BARuu4BPDO0DfU,<De(:L%16'JATME*DJsW.F!+n3
AKYo-A0>;uA0>u-AKY].F*2&8+D>2,AKYGnASrW,@<-!lCj@.3A7T^lF)to'%17#o+CS_fDId['
ARmD98K`%bFCAm$+EV:2F!+q'@psM$AKWC0A0>;'D/!g&ASu3jC`mS/B4uB0F('>C+D>J1FDl2F
+Unbf$;bb]@VfUmF!,[@FD)e=BOr;rF`MM6DKI!n:IH=HH#n(=D(Z8)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%A2'>:u@j!N\
0Jst-0fh!D3\W8t$4R=s.3M3"@rH4'Ch7^"+E2IF05"j<+EMgFD.Rg0GqL3^E-67F@;]TuB4Z0-
@<,p%AmoCoCj@.EH#7D0FE2)*@;HA[+<VeNBln#2@3B/nG9C=3DJsf7DJ()'G[k<(FD5Z2F#ja;
%144#+>P&o+D58-+=D8BF*)AAARTFbCh4t'$6UH6+<WE^E-67F-Zip@FDu83@;TIiALBPe/hSb/
+EV1>F<E1g/ghbN$4R=b+<Wrm@rH4$@;]TuEb/cmF(o9)+EM47F_kS2F*)G:G%De.DfQt1Df'H0
ATVK+E-67UB4Z0-F*VV>ATVs<+>"^RD]iV9@qBV$Bl@m13t2N+$8O%Q8TZ)!@<3Q"+Dkh6FCArr
+Du+>+EVNEBl7EsF_#&+E,Tf>@;TIiATJu.DBO%7AKYMpAnc-sFD5Z2+E(j7B6%p5E,uHq+<Ve8
DIal2F_Pr/F"SRX<+ohcC2[X)Df9G7-uEdA.3N>G+C\c#Bk(RfCj@.3+DYe9A7oHrFDhTq+<Ve>
ATT&'Ec6)<A0>u-BlbmL+AcutFCB#qCh7Z1GAhV?A0>T(@rc-hF(HJ8H#7D0FE2XL@;]Tu%144#
+EM76E,96#Gp$s4Bl8$$Bl7X&B-9ehF*VhKASlK2Bl5&+Ec6)>F"SRE$4R=b+<W6YFDi:6Bm:bB
BPDN1Eb065Bl[d++Cf(nDJ*O%+DG^9@rH4$@;]TuDfBf4Df0V=@;]TuFD,5.@VK^gEd8*$+<VdL
+DbJ3Dfp.EDe:,6BOr</DId=!CjB`4B-:]&D/aE2ASuT4Anc'mF!(o!%14m?+B3#c+DG_(AU#S:
DJ()5H#n(=D'3tBATJu'Dg5i(+Dbb5FE8RCAfu;9Eb$;1@;TRs+>"^YF(oN)+EMgF@W-((%144#
+EqaHCh+Z6Bk;*k+C]%t+E1n4AoD^,@;]Rd+C]8-F*)IGAoD]4Cgh?sAKYMt@ruF'DIIR"ATKI5
$4R>!.3M,lDImisC`m\*FED)7DBNe)FCSuuDJ()5BQ&$0A0>o(E,8rmAKZ).AKYr4AS,Y$06;8F
F*)G:DJ(VDF_56"GT[G&+<VeD@<?!mBl7Q+DJs_O%13OO2(9Y6+EM76E,9).Ch[cu+EV1>F<G+*
Cij).F*VhKASiQ2BQ&$0A0>>m+CSekARloqDfQtEDfTB0/e&-s$8s=U5p0fVDdm-k+=M)8DL!@8
Bk)7!Df0!(Bk;?7+EqaEA1qb;@psInDf.4NF(KD8@rcL/F!,L7An?!oDI[6#%144#+DGm>DImBi
ARmD&$4R>$.3Lo!E-624+A*bH<Cn<FEc5i;+D#G$+DGm>DImBiARmD&$4R>%.3M5Y6m->hF*&OF
F`&=?DBND,FD)e@Bl7I"GB4m8DIal+Bl8'<+EMgLFCf<1%13OO3@Q(C:IH=CAS#Cn+CQC+ASc<.
G%G]'+EV:*F<GL@ASuQ3F`8I6ATV?pCh7-"BQS*-+EMXMCh4`&ASc<.AoD]4%17;tEb'5D%13OO
+<VdLC2[WrASc<.-ZF3M-OgCl$4R=O$;bY^F(o*"AKX?R@;]^hF!,RC+A,Et/e&.>/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%14jF
+@KdN+>PW)2'=S53\r]U0JO"D%13OO0e"5>@;BEsF*2M7+B<;n@rGmh+DGm>E,ol9ATDU4+D>2$
A8Ggf+DG^9E-67MF!+n/A0>MrF=2,^%13OO1+=>5Df0W1A7]d(BOPdhCh[d"+B<;n@rGmh+CT=6
@3BZ'G]Y'MH#R=;Bl5&(De!p,ASuTuFD5Z2/0JLVB.aW#%144#+>b3[F`\`RF`(o'De*F$AU&;E
4&o$I6Vg*=4!u.'/hSb/+E_R9@rGmh+EV1>F<E1g/hSL\$4R=u.3LoeA0<"'+EM76E,9).@q]:g
B4W2qDfor>+D,P4+E(_(ARfh'+DG^9FD,5.A79Rg@UX=h/e&.1+<Xa!ASrW2AT2Ho@qfgn+EqaE
A90DB@VTIaFE8RHBOr<-H#n(=D'3>2EcP`/FDQ4FEb/ZiEt&I!+<Yc>AKZ)'EbAs*ARlonDf'H3
DIm^-F!+n/A0>AqARfLs+EV:.+DG_'Df'3+B-;)#D.Rbt$6UH6GA2/4+EV:.+EV%4B4Z0-DIIBn
F"SRX9lG)p+E(j7FD,5.AU&0*DKBA3De:,#DBO(@A79Rk%144#+E(b"F`MOGGA2/4+EV:.F(HJ7
ART+j/e&.1+:SZ#+<X6f+CQC5AT2Ho@q?cmDfor>+Eq78+CSekARlp*D]j.8AKZ#)E,8rmARlp)
FE2M6FEMV8+CP]d+<VeDBl7X+@s)U!+CT,*F`):DDe:,1G%G]-ART*lGAhV?A0>>m+CSekARlp*
D]iP.F`):DBQ&)($6UH6D..=-+EV=7ATJu&DBNk,C1Ums+D>2)+C\nnDBNt2E,8rmARmD9+B3#g
F!,1<+CQC.AU+^l+<VeJFCB9*F*),+/g)99BPD?sF!,R<@<<W)ATT&)BOPdkARlol+Dbt<+CT;%
+E_aJ@;Kb*3XlE*$6UH6+<VdL@4<=.F_>?4+CT=6BOu!r%144#+<VdL+CZcBDJsV>G@bT,+Co&)
BkM<pA.8kg+<VdL+<V+#+<VdsATW$.DJ()9DfTA2Ch7d$C`m5$@;]^h+Cf>4DKKqBDfp.EDe:,6
Ea`KmFD5Z2@;I'0ATDj+Df-!k+<Ve:Df0Z;DepP;H#n(=D0$h6F!+n-F)N10+E1b'DD!%S<+oue
+EqaHCh+Z*@;BEs8l%ha$6UH6D/XH++E_a:Ap%o4GA2/4Dfp.E@3BW*B5VEqBk(RhF<GLFATDHq
@:UKpDI[]u@<6!4%13OO+<Ve+BPDN1@q]:gB4W30Dfol,+ED%5F_Pl-+CQC&BOPdkAKZ)5+EV:.
+C]&&@<-W9CghU-F`\aEAdo(i+<Y3'FCAWeF(HJ+Bl%@%+ED%2A7]dqDJ()2Eb0E.Dfp+DA79Rg
@UX=hF!,UCEb/Zi@:F%a/e&.1+<X5uGAhV?A0>PoG%De<D]i\2+EV:;Dfo]++CQC'F_u(?@;]Tu
Eb0<6DfTDA+<V+#%13OO1asP7Df0W1A7]d(@:Wn_DJ()+DBNA*DffZ(EZf=DF<GL@FD5Z2+EV:*
F<GdGF_kS2F*)>@AKZ)+G]Y'=AScHsEt&I!+<YB9+EV:.+CoD#F_t]-FCB9*Df-\-Df'H3DIm^-
+E(j7DdmHm@rucE+<XWsBlbD8E-,f4DBO.AF_kRt$6UH6Df0B:+C\n)AU%crF`_2*+EqL1DBNt2
EHPi6FCeu*@X0)<BOr</F(KAE+<X6t+EqaHCh+Z&DI[]u@<5uh$6UH6FD,5.F*VhKASlK2@rGmh
+EM7CAKYH-+DkP4@V$Z;0J,+8+Dbb0ATJu'F`\aMDfol,%144#+Du+>+CSek+CT/5+E)41Eaa'(
Df0!"+E)F7EbK#mA0>K&EZeq7FCAWpBlds!A0>f0ATD4$Bl@m1/e&.1+<XWsBlbD=H#R=;De:,1
E-,f4DII?(A7]S!@3B/j@qfanFEo!CF!+n-F)N1<DfTD3Bl5&8F`(b"$6UH6GA2/4+EqL-F<F-t
A7]=h+E_a:Ap%oB+<XBsF*&OJATDj+Df-\-Df0Z;DepP;H#n(=D0$hAEa`Hn+:SZ#+<Y*/C`m5$
@;]^hF!,RC+Cf>#AM,)J9lG)p+Cf(nDJ*O%+CT;%+EVX<G%kB$+CT.u+DGk:ASbq$@;^0>%144#
+@1&kFD5T'+D5V(F!+q;+CT)&+EV:.F(HJ9G@b2uF!,")B6%EkAKZ).AKZ,;Bl%L*Gp%$;%144#
+Cf>#AKYZ#F*)>@GqKO5%144#+B3#gF!+t+@;]^h+EqaHCh+Z/AT;j,Eb-A%+DbJ3Dfp.E@q]:g
B4W3-D]j.8AKXB:6V1$E<$6'sF`%Wq+<Ve9F`\aMDfol,+Du+>+DG_8Ec5K2@q?ckDL!@6Bl7@"
Gp$X+FCAWeF(HJ.DI[U%E+*j&@Vfb#Bk;?<%144#+:SZ#+<X'`Cij).@rGmh+EqaHCh+Z%@<Q3)
FDi:8@;]UlAKZ).AKYl%G9CsKEckl6F`M%9@;]TuAU%p1FD5W*%144#+CoD#F_t]-FCB9*Df-\-
De*E%GAhV?A0>PoG%De<D]iM#+Cf(r@r#Xd+CT.u+E27?F(o*"Gp$O+C3=T>ARmD&$4R=O$;tGF
ASuT46YKnGB4Z-,FDi9o:IHfE$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=1,pCODg!6Y0JGF.0f(jH3BAuV%13OO%15g<DL!@7
BOPdkATKmT/KdV-G@>P8DJsV>F`:l"FD5W*+EV:2F!,"3@s)X"DKI"BD]in8F*%iuDe:,6BPDN1
GAhM;+Eq78+Du+>+Du+>+Du+>ARmD9+A!qsC`mM)AT/c$ATW$*EZf7<FCfM&$>FB#FD,5.Ap&3<
Eb-jG+@p'aAKYE%AKZ&4D.Oi'BkM*qBkM+$F#ja;%14g=+@C'bG%G]9ARlp*D]hXp2D-[=+>"^X
BPDN1G@>P8@3BDqC2\,8E+*Hu+CT=68ge[&@UX=l@grcREbBN3ASuT4F*VYF@<`o=@<3Q$BOPdk
ARmD9+B3#c+Cf>#AKZ2*F!+t2DK]T3FCeu8%13OO1+=>ADJX$)AKYYtCiCM*A7T7^+=LuCA8#Oj
E%)5'%14m?+@:3`F!,(/G\(D.Bl5%AA8Z34+=L`<D/a5=+CT.u+E)@8ATAo;DfTB0/g(T1%14p@
+@KpbFE2))F`_2*+E).6Bl7K)@X0)<BOr<$+>ti+1*C"9A8c?.E+*6l@:s-oD..<jB4Z*+@;]Tb
$=S$!<+ohc8l%ht:gn!JF"Rn/%14sA+@L-XF_t]-FCB9*Df-\?DId=!B5_L%B-:c1FCf?2Bm+&1
Eb-h6A8--.FDi:BAS,ai@rri8BOr<'@;^?"$=daXDJ*O%+E)F7EZfI;AKZ80@<-EA%13OO2CTbD
Dg*=FFDl26DJ()#Cht4d:IH=HDfp)1AKY])+EV:.+Co1rFD5Z2@<-'nF!+n/A0>MrDImisFD5W*
%16N[C`m8&F*)G:@Wcd(A0>JuCh7Z?%13OO2^okA:IH=HDfp)1AKY].+Du+A+E1b0FDQ4FF`(`$
EZe;'@Wl='F(oQ1+Cf>-FE2;9/g(T1%15'D+AHcbBkD'jA0<:;@;BF'+=M)CF"&5RD]j">De!@"
F!,")E+NotASuT4@rGmh+EM+(FD5Z2Et&IjDBNS4Dfp"A@;]TuF*22=AKYYt@:WqiF"Rn/+:SYe
$4R>ABPD?sF!,RCA8aL<$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%14g=+@C'aE,9*-AKYN%@s)X"DKK</Bl@l3Eb0E.F(oQ1
/g)9.+CT+0E,8s#DJ=!$+EVgG+Eh=:F(oQ1Et&IpAfs]A6m-#Y@s)X"DKK</Bl@lA+<XWsAKYo/
Ch[cu+Eh=:F(oQ1+EV:*F<G:=+Du+A+E_R4ATAo'Df0W<Eckl6Bl@ku$>FQ(@s)g4ASuU+Gp$d=
F*(u(+C]U=7rN<YCh4u8+E).6Bl7K)A8bt#D.RU,+EVO?C`k--EbTW,Cj@H^+<XWsATMDl$=n'b
F_t]-FE8R7@;[2sAKYN%GA_58@:Wq[+CT=685r;W/g)9<BOu'(FD,5.85r;W+CoD#F_t]-FD5Z2
+DGm>DIm6sCj@-4$=e!kE,9*-AKXPeGA1l0+Eqj?FCcS9Df'&.8g%V^A7Zm*D]iP.DK]T3F<G:>
+EVNE9OUn3=>FG?+<XWsAKXZT<+T/SGA1l0%16QU+E_a:A0>u4+D58'ATD4$AKYD(F(oN)Ch4`"
AS,XoBln'4AKXf;7Nc5[@s)X"DKI"CBOQ!*GA1l0+C\n)A8-+,EbT!*FCetl$>FB#FD,5.@UX=l
@j"B>6m-#SF*)G:@Wcd,Df.0M+AZlkBl7K)A8bt#D.RU,F!,[@Cht53Dfd+2AKYMtF*)G:@Wcd(
A0>?(F:ARuBl.g*Gp%-=An?!oDI[6g/e&-s$8O%Q6Z6jcATDl8-u*[2FDl)6F"&5CEcQ)=+CT.u
+Dk\2F(&]m+D>2$A8GstB-;;7+EV:.+EM%+ASl!$F`V,)+C]U=FD,4p$?($"ATAnc:IH=8CghC+
ATKI5$4R=u.3LoeA0>u-AKYT'Ci"$6Bl7Q+DIn#7GAhM4F#ja;%144#+CQ]A.!TWG.3L2o+Dbb-
AKYN$C`m20F<GX9@<,jkATJu&Cht57AS5^uFCfK(A0>Ds@ruF'DIIR"ATJu+DfQt<@;TRs/e&.1
+<Y,B+=L]:CagJY/KekDCLnW!DJUG)F`\aIARTUhBOu6-@;Ka&@s)g4ASuT4E-67FA8,OqBl@lt
Ed8d:@:O(qE-!.6DfQt<@;TRs/e&.1+<Y/C+=L]3ATT@D+>#/fAU&<;@:OD#+=M,9D.P8A@;L't
.3N&:A0<:<@;TR,@r,RpF"DKCCis;<+EV%$Ch7Z1Ao_g,+C\bhCNXT;%144#+<VdL+<VdL+<VdL
+EV:.Eb-A;Bl%T.@V$["D]gH;E-67O+EM77@q?cl@:O(qE-!-r<Duj>:.82P;BS:p+@/\#78cQB
/e&.1+<Y2D+=LcBF"&4`/Kf(FB6A$!EZeq<E,oN2F(oQ1+D,b4C`mh2G]Y'LARTUhBOu6-@;Ka&
@;Ka&DdmHm@ruc7Df-\:@<?08%13OO1asP5A7Qg"DfTD3Cggdo+>"^RAS#Bp@3A0<6m+g-F*&O$
Ea`I"Bk(^q/0IP\6m,HIDepOmEc5T2@;TjqDJ(R2$4R>".3M>nCLnVsDL!@7BOPdkATJu7AT;j,
Eb/c(FDi:CF`;;<Ec`F(<(8hiFCf]=+=L`<A7Zl=2CTb_DBNe)@rcL//e&-s$4R>A:IIuc8l%i^
D.GC\?qO3_?m&EE6r+7!4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%
+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"SRE$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5
@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+:SZEEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7
Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"SRE$:/KLD_*#OART*l>@;,YF*)>@GqNrE
?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+U
D.G(<%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4/g*u,@;^-/A8`T.Dfd+>
ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>3DfQtGARTV#+A!\h@<Q3)D..-rFCAm$ARlol+E2@8
G%#K(+E2@>C1Ums+Dbt/+EV:*F<G:8@r-9uATJ:f?qO3_?m'Z3Ebd9M8K_n^G%G\:,&h[6Ch[s(
ARlu-FD,B0+CoD#F_t]-F<G16EZfI;AKZ&.D/a<&+ED%%F)Pq*$?TriF<F-tA8,Rl-ZgJT@;^00
FDi:9D/a<:+EV:*F<F-t@;R,sDf'?*FED57B-;;7+CT/5FD,B+B.b<%Dg*<q+CT+0@rH4$BlnH2
DJ'CcFDi:6Bl7X+BPD?s+EV:.+D,2/+ED%1@;0UnDJ()"8l%i_+D,1nFEMV8F"SRE$4R>M>@M/V
Bl5MEDe*cl?k!GP$8F.U?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]Tu
AU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr
@WMtc+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$=I(LDIb>@De*cl?k!HP
F_PZ&C2[WsC3)-b:-pQ_@WcC$A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlouDe*QsF!,O6
EbTK7F!)T>DBL':De*KpF:ARP67sBkBl[cpFDl2F/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S
:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-YA0<6I
+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'+E(d5
4$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<
@rc:&F:ARP67r]S:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuic
F`;;?ATMp(F!,16E,95uBlkJ305i9K$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+AQhtATDg0
EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;C3=DJ1(=Rc67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80ktiK
0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`CG'=9Et&IO
67sB82.:HE0JXbkASl@/ARlp0Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*FDi::De*KpF<G^DA7]d(
@;KXhD@HqJ67sB83,WYX0KC7fBl7?q+Cf(r@r!3/BOQ!*GB.D>FCf>4Anc'mF!,%=BleA*$;No?
+>PWc@;[hW+EM47G9D*MBlnH.DBNP*Ch4`.@<?1(%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*
+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA1&`6$4R>;67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?
DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4
$;No?+CT)#ASrW*De*QsF!,"-Eb/a&DfU+4$;+)^7nHZP:IIcH;c#bZ83K!V+tb6/9M$T_4)AhF
F(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C(1MB:II]E<(]qS8P2oX5u^B<
3Zr0V@<?1(AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U%13OO:-pQUB4YslEaa'$
+Cf>,D.RU,ARloU:IH=8CghC++EM%5BlJ08%16i[CghC+ATL!q+?MV3C2[W*C2[X(FDl22+DPh*
A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5+DPh*Df-p3$>OKiAnc'mF$2Q,-p07-?SNuPD..3k
-9`Pe@r,RpF(KD%$4R>;67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^%14Lu@r,RpF(KD8/1)u5+?V#^
@<<kG4ZX^+ART*r/j:D)3[-:$C2[WpBl%@%%13OO:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2
EbTK7Et&I(Eap55EapI[3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq
@UX%"%14M1/g<"mF)kb>4ZX^43[-:$F)kb"$4R>;67sC'E+EC!AKYMtEb/a&DfU+GAnc'mEt&IG
8PDQO4ZX]6C1D'gF)to6+=nX^/g<"mF)kb>+=nil4s2s8/no'A-OgDP8PDQO4ZX]64A&C;7nHZP
:IIcH;c#bZ81>Z4-8%J)7S-9B;[j'f4DJeFA79R&+<VdL+D,h<Blmo/F(fK9E+*g/+?M9(7S-9B
;[j'f4DJeFF*)>@ARo4k+D,h<Blmo/F(fK9E+*g/+?M<)7S-9B;[j'f4DJeFA8bpf@<<V7+D,h<
Blmo/F(fK9E+*g/+?M?*7S-9B;[j'f4DJeFD..3kA79R&+D,h<Blmo/F(fK9E+*g/+?MB+7S-9B
;[j'f4DJeFF`_>6A79R&+D,h<Blmo/F(fK9E+*g/+?ME,7S-9B;[j'f4DJeFFDl)6F(A^$+D,h<
Blmo/F(fK9E+*g/+?MH-7S-9B;[j'f4DJeFDf0)oF<D\K+D,h<Blmo/F(fK9E+*g/+?MK.7S-9B
;[j'f4DJeFE,ol/Bl%?'+D,h<Blmo/F(fK9E+*g/+?MN/7S-9B;[j'f4DJeFE+*d(F!)SJ+D,h<
Blmo/F(fK9E+*g/+?MQ07S-9B;[j'f4DJeFF`V,7@rH6sBkLm`CER55EbTW,+EM47GApu3F!*P)
HU^S#78jX&%15is/g+Y;ARfKuFD,*)+D,>(ATJu*G\M5@+DG^9AU&0*@ru9m+Co2,ARfh#Ed8*$
-o2u,+>>5e7S-9B;[j(JAhG2U/h^Zs/g+b;G\M5@+F,)?D_;J++<Y`BDfp/@F`\`R@rH4$ASuU$
A0>W*A8,e"+EM%5BlJ08+E_X6@<?'k-OgD*+EMC<F`_SFF<F1O6q9gJ8l%iH8lJPP<(IH*AScF!
/e&.1+EMC<F`_SFF<Dr";Gp:g+>"^QBle?0DJ()%Df'?&DKKH#+DPh*Bkh]3F(96)E--.D/NtO)
4!8ek,CUae/n,7s+<Y*6F(KB6/g)hj:-pQUGA(o'+Cf>6@W-N8%16ZaA1e;u.1HUn$;No?+ED%7
FDl22+E)41DBNJ(@ruF'DIIR"ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?UBleB7Ed;D<A26(Q$4R>TASu("@;IT3De'tB
+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK&/hnJ#
+=MAMEb0&u@<5s.+:SYe$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/e&.1
+<Vd9$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,
F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/%144-
+<W(RATVC(Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6
+ED%5F_Pl-A0>?,+EV:.+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[Kq
ATJ:f+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+<V+#
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
FDYh'$6UH6+<VdL+<VdL+:SZ#%143e$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!
6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZX70J5(&/KeS8Fsd_+
7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#
9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A
%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+
@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0
C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8De*@#
@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-
F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARl
De*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:Ebi
D/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]
6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;Tjq
DJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+
FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3
ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M
%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16fe
F*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8
A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2
+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq
+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/h
FCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"C
F`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o
@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#.1HW$
@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc
8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen3-OgDP:J=/F;E[&gB4YslEa`c;C2[Wn
De!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!
+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<o
DJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iH
DKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iR
Dfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)d
A7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO
8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"
DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5
DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M
@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[Wn
De!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%
ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXC
F`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8
A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc
@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP.40d&%jA7]p3%15R#9LM<I4ZXs'ASu("@;IT3
De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRL
Ea`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6
F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63
B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8
EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r
+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&
FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]Tu
Eb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<
@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'
6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)
F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;
Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8
GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-
F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'
/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@
$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH6
8l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9
F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/C
AKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZ
AKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk         ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&o0d&A1+>GSn2D\-&6qU6C:2b5cF(96%@<?'k3Zp130K!BP@kf\\/KeP:@;]^hA3(hg
0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^<)5nX?V4*^?Ys=pDfp)1AKYT'EZf%;FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG':IIu2D.E                ~>
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
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),<<;.'
zz=:zz,'_1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN C'
zz=:zz,'NLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 '
zz=:zz,'ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR0'
zz=:zz,'60 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 E'
zz=:zz,'RR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR08'
zz=:zz,'0 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ER'
zz=:zz,'R090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099'
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS '
zz=:zz,'INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052'
zz=:zz,' OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 '
zz=:zz,'OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx app'
zz=:zz,'table appwords backupdates badcn bchecknames bgetdicdoc bgetexplain'
zz=:zz,' bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit checkback'
zz=:zz,' checkntstamp checkopen checkpath checkput closedict createst defwo'
zz=:zz,'rds delstuff delwordrefs didstats dnlsearch dupnames freedisk freed'
zz=:zz,'isklinux freediskmac freediskwin fullmonty getdicdoc getdocument ge'
zz=:zz,'texplain getgstext getntstamp getobjects getrefs gslistnl inputdict'
zz=:zz,' invappend invdelete invfetch invreplace islib iswriteable iswritea'
zz=:zz,'blelinux iswriteablewin jdatcreate jwordscreate loadalldirs loadall'
zz=:zz,'refs loadwords mainddir mnlsearch newdparms newregdict nlctn nlpfx '
zz=:zz,'nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc '
zz=:zz,'putexplain putgs putntstamp puttable puttexts putwords putwordxrs r'
zz=:zz,'pdtrim rplctable rplcwords sortdnub splitbname''                    '
zz=:3129{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`-3?U:(1b^X>C2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9
B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2$;No?+<Ve9DJUF<
+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaE
A90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@lt
Ed8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;
E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-
AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaE
A90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJ
GAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'
DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08
+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@ltEd8dF@;TQuCh[s4
F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'DIIR2%15is/g)8Z
De't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!CLeP1+E1b!CER/%
@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)ATVL(
@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/ltF*(u6+CQC'Bk)7!
Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k+C]U=-u`U)CLek'
$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4
F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0
@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,eEHPu9AKW@8Anc'm
F!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlotDBO%7BlbD<ARfgr
Df-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h+F5/HDe!3lAKYl/
F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ:*<P35tscj8Oc9I
;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0AKYQ%A9/1e9L_0+
0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQUD.-ppD]j+2EbTK7
+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#AISuA67sBhDIal,
De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a;Fs\a4ZY>Q%15cp
<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK9gMZM6r-lZ4ZY>W
%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?+DkOsEc3(BAU&;>
FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B
<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/0F\@g78m/K3\_'N
7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dKASbs$Eb/ioEb0,u
AISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23uA90dS=&2^^/6#&:
<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/
%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl4ZZe.+>#2g><3lV
/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*@<,ddFCfJ8-6R89
FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI-OgDZ5u^BB85`AL
3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(nEcW@6AT23uA8,po
+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O-Rg00/jMH\+C-FE
.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloqBl%?'DIIBnEt&Ik
F`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z+=f&t>V7-q5u^BC
78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2Et&IO67sBqDe*p7
F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*F!,")Anc-oA0>T(
+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'6r6cW7QieIDe*p7
F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*BHS[;De+!3ATD:!
DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXC
Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</
DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2
+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*
D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1
Amo1\3XlEk67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2FCfK1F!)SJ+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0qBk([l
@ium:B4Z0-@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9@s)X"DKI!D+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFCf]9Cgh$q+<Y<.F<G%$@r$4++Eh=:F(oQ1
F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9
$;No?+<Ve9B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\
EcW?G+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oDdmHm@ruc7+D58-
+E(_(ARfh'+D,Y4D'3:r@r$4+F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'+C]5)F(Jd#@qZu-+<Y`:@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)
@r$4++DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DK?6o:-pQU+<Y-2
F_u1B+<VdL+<VeIATW'8DK?qCDJ=*5AKYGj@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9
@UWb^F`8I@F_tT!EcW?G+<VdL+<VdL+<Vd9$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"
Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%
+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:
+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+
F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(
ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+
Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/
@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0
%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01
@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-
B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGC
ART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIa
FE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;
Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1Ums
F!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg
%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?
+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>Dk
FC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is
/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*
DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%
DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2A
FCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeG
F`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f
:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=
AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJ
F*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;
ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`
Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,Xo
FD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1
@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(
AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'
Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>
3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN
+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'
Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(
AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm
0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQU
Anc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'7
67sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2
ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm
+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,
A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE
:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+
A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*
:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:
ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P
:eX/H:(7O>$;No?+DtV)AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<
-S?bh%13OO:-pQUFE2)4+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'
845m?%17,pA9;j+D*9pc+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0
F<G%$@r$4++DtV)AKYr#FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#
<$l$cFCfK6FE/f>$4R>;67sa!DId9hE+NotASuU2                                  ~>
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
<)6:`;cZU\+A,Et<_Yt)F(KH&F_PZ&A8-(*+E_X6@<?'qDe*BmF*)G:@Wcd,Df-pO/1<V7,VUYu
-p0UR/mg=U-Qm/BA0>W*A92j2Eb-UI/1<V7,VUYu-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=4
6r%ZBATM3qA0=K?6rZrX9N+8X8PDNC8Q/Sa;HY,<9LMKK6r%ZBATJtn:IIuc8l%i^D.FbuF_PZ&
C2[WsC3(M2BleB7Ed;D<A0>_tDJ<]oF*)/8A0>_tDJ<]oF*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8
A92[3EarZ..4cl01*AM$1,(FC0etI?/i5OJ2_m0F1GU(.0JPRB1,1U<1cRKS1,C^B1*A>+0f^sD
0f1L>3&roQ1G^gB+>PW*3AE9D1bLUE3B&]R0etI+1,(FC0etI?/i5OJ2_m0I3A_j60JY=90etL:
2`*?L1Ggg@+>PW+0JG493A*-C3B/fO1b^p41,(I;0JP=</iPUE0K;$L0K(%/0JY=90etL:2`*BG
3&icL2BXb/1,(C:1,:I@1c6sH3&NBJ+>PW+0JG4:1+kLB2)-j?2E<Q91,(I;0JP=</iPUE0K;'Q
2)6:00JY=90etR<3&*BN2`<BM0d&5*1,(C:0f^jC1,:R?2E3KQ.4cl00I/>$/1<V9+>P2t0JY=9
1,1L93&*-A3&E?E+>PW*3AE9D2D-jD1cI<J1,pC30JY=91,1L93&*-A3&E?E+>PW*3AE9D2D-jD
1cI<J1,p^6-p01/0I\P$4>J$60I/D-0f^sD0f1L>3&roQ3AE9D+>PW+0JG7:0J5.@3ArWN1Gq!3
1,(FC0etI?/i5OJ2`!-A1,C%.0JY=91,1I81H%-L2)?sC2]sk01,(C;0eb493AN<J2)dHO+>PW+
0JG4:1bLaC0JYUC2)6s11,(I;0JP:</iPaF0KCsF1cQU50JPRB1,1U<1cRKS1,CdB3$9t10f^sD
0f1L>3&roQ1H%6M+>PW*3AE9D1bLUE3B&]L2).'51,(I;0JP=</iPUE0etF?1,9t-0JY=91,1I8
1H@?L2`<EN2BXb/1,(C:1,:I@1c7!C1Gq-O+>PW+0JG7:0J5.?0JYUG0ekC*1,(I;0JY@:/i,LC
0fLsK2`2^50JY=90etR<3&30C3&3?H1E\G,1,(C:1,(=>2E3KO2*!?H+>PW+0JG4:1+kLB2)%!L
2E3H71,(I;0JP=</iPUE0K;'O2E;m80JY=90etL:2`*BG3&roU3@QL-4>838-p014/1<V7.4cl0
0I\P80E                                                                   ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
