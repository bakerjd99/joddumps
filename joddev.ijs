NB. JOD dictionary dump: 07 Mar 2023 15:27:34
NB. Generated with JOD version; 1.0.25 - dev; 2; 07 Mar 2023 15:14:28
NB. J version: j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1
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


DPLIMIT=:64

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.25 - dev';2;'07 Mar 2023 15:14:29'

JODVMD=:'1.0.25 - dev';2;'07 Mar 2023 15:14:28'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. NOTE: the format of  the string returned  by 9!14 has changed
NB. without warning over  the years. The latest change (feb 2023)
NB. has  been   to  a  (version.major.minor)  layout.  This  verb
NB. computes a floating version number.
NB.
NB. monad:  fa =. jvn uuIgnore
NB. dyad: fa =. cl jvn uuIgnore
NB.
NB.   v0=. 'j9.4.0-beta13/j64avx512/windows/commercial/www.jsoftware.com/2023-02-23T08:08:24/clang-15-0-7/SLEEF=1'
NB.   v1=. 'j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1'
NB.   v2=. 'j10.12.53/jwhatever'
NB.   v3=. 'j8.05/oldsys'
NB.
NB.   v0 jvn_ajod_ 0
NB.   v1 jvn_ajod_ 0
NB.   v2 jvn_ajod_ 0
NB.   v3 jvn_ajod_ 0

(9!:14 '') jvn y
:
NB. for empty version strings return
NB. 0 we don't know the version
if. 0=#x do. 0
else.
  NB. extract J version from (9!;14) string
  ver=. (x i. '/') {. x ,'0/'
  if. '.' e. ver=. (ver e. '0123456789.-/')#ver do.
    NB. version.major.minor layouts
    ver=. ver {."0 1~ ({. , <./@}.) ver i. '.-/'
    (0 ". 0{ver) + 0 ". '0.',((] }.~ (i.&'.')) 1{ver)-.'.'
  else.
    NB. version layouts before j9.4
    100 %~ , 0 ". (ver i. '/') {. ver
  end.
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
    y=. boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. boxopen ,y
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
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

putgs=:4 : 0

NB.*putgs  v--  stores  dictionary groups  and  suites.  Prior to
NB. calling this verb  names, path and put dictionary status have
NB. been validated.
NB.
NB. dyad:  (bacl ; ia ; ia) putgs blcl
NB.
NB.   ((<'6');WORD;GROUP) putgs ;: 'group and members'

'DL code gtype'=. x  NB. directory object !(*)=. DL

NB. check binary compatibility of target dictionary
if. badrc msg=. binverchk DL do. msg return. end.

if. badrc msg=. pathnl code do. msg return. end.
y=. /:~ ~. }. y [ gn=. {. y
if. *./b=. y e. ; }. msg do.

  NB. change/create group -- insure group directory is ready
  if. loaddir__DL gtype do.
    jderr ERR054  NB. errmsg: unable to load directory
  elseif. do.

    NB. depends on first char of index list matching (cP_DL) nouns
    fc=. {. ix=. (>dnix__DL gtype),'__DL'
    cn=. (>dncn__DL gtype),'__DL'

    NB. groups/suites are either new or replacements
    uv=. (".ix) i. gn
    dfopen__DL fc
    gp=. ".fc,'P__DL'

    if. uv=#".ix do.

      NB. group is new - create

      NB. EDGE CONDITION?? if another group with the same
      NB. name exists on the path copy the group/suite text
      NB. of that group to this new group.  Use of this system has shown
      NB. that this is desirable behaviour because of the common
      NB. practice of "regrouping" in the put dictionary new versions
      NB. of the same group that are deeper on the path.
      if. +./uv=. (<gn) e.&> }. pathnl gtype do.
        if. badrc uv2=. gtype getgstext gn do. uv2 return. else. uv=. (1;0 1){::uv2 end.
      else.
        uv=. '' NB. default script is empty
      end.

      gdat=. <gn , uv ; < y       NB. (cn)   name, script, contents
      gdat=. gdat , <gn , 3$<''   NB. (cn+1) name, latex, html, text, et cetera

      NB. append group
      if. badappend apcn =. gdat jappend gp do.
        jderr ERR058 [ dfclose__DL fc return.  NB. errmsg: append failure
      end.

      stamp=. nowfd now ''
      uv=.  stamp;stamp;<a:
      uv2=. CNPUTDATE,CNCREATION,CNEXPLAIN NB. NIMP group append
      if. badrc msg=.uv invappend gp;uv2 do. msg
      else.
        NB. update directory
        uv=.  (".ix) , gn
        uv2=. (".cn) , {. apcn
        if. badrc (gtype,gp) savedir__DL uv;uv2 do.
          jderr msg [ dfclose__DL fc return.
        else.

          NB. stamp good directory change
          (<(#".ix);now '') jreplace gp;CNMARK
        end.
      end.

    else.

      NB. group exists - update
      apcn=. uv { ".cn
      if. badjr uv2=. jread gp;apcn do.
        jderr ERR088 [ dfclose__DL fc return.  NB. errmsg: read failure
      elseif. gn -: 0 {>uv2 do.

        NB. update group list - group script is not changed
        if. badreps (<(}:>uv2),<y) jreplace gp;apcn do.
          jderr ERR056 [ dfclose__DL fc return.  NB. errmsg: replace failure
        end.

        uv2=. uv;nowfd now ''
        if. badrc msg=.uv2 invreplace gp;CNPUTDATE do. msg return. end.

      elseif.do.
        jderr ERR055 return. NB. errmsg: directory-data inconsistency
      end.
    end.

    dfclose__DL fc
    uv=. ,>dnnm__DL gtype
    ok(uv,' <',(>gn),'> ',OK059);DNAME__DL
  end.

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)6:7+>P&u+>Y\o0f1"21E\D++>u"u0fC.01E\D,+>Y_p2BXb1+>Y,p2BXat1-$I7+>YlC:eXGT
8Q9P8G\M#;D'3A'@ruF'DIIR2+E1b2BHV,&DJ+')8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1
Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;CDesJe
:IJ/X:J=\0Bl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`i
ALU2s8l%itFD5W7ATDBk@qBCnA9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_
+Eh=:F(oQ1/0Je<CLnVsDIal#@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'qG&BnpG%G]8
Bl@l3DKTf*ATD^"DfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nF)Z8DB6/-9DfTE1+Co1rFD5Z2
@<-W9B6%p5E-!.1DIal2F_Pr/Er                                               ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3Ahp>+>Y,p2'=Xs0ebL?1E\G,+>P&o0KCmF+>P_q1*AP33B83:0d&4o1,CaD+>GPm1*A>/2_m96
3$9t!1,^g?+>GSn1*A;/1H6L33?U("0eb=B+>Get1*A;-2De$%6pamF9LMEC;cHOj=Y_iD$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2n$;No?+BE&oF(oQ13Zp.00J5+'+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0KC7NDg!6Y0JY=)
0K;*K0KLmF%13OO%15is/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp.4+AQiu+>PW+0H`))3\iHO1H,aM%13OO:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i#:,
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg3$:t7Fs&Oo1,'h*1-.-G3\iW'$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,U1LDg!6Y
0JY=)0etdH1HI?J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,U1LDg!6Y0JY=)0f;!K2```K$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,^7MDg!6Y
0JY=)0etdF1cdEJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=#+<X'\FCdKU1,g=NDg!6Y0JY=)0ebXD1cd?O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1-.9P$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,g=NDg!6Y
0JY=)0ek^F1cdHQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^G0fh$J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,g=NDg!6Y0JY=)0etdD0fh!B$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN
1,(I;+>GQ20f(jI0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp.6+@KdN+>PW+0H`&/3]/ZR1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg3?U_$@j!N\1,'h*2EENH3\W;r$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0ejeL
AT/bI0JY@*0etdI2``fQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>PYo:LeJh1,(I<+>G`71,_0L1^XQs:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+AZKh+>PW+0d&2.3\rZT1c5UI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh
0d'8%F<E=m1,0n+2**QL3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.9+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K1cd?O$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo:LeJh1,(I<+>G`71cRNM
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K
3Zp14+AZKh+>PW+0d&2.3]/WQ0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%no
F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'8%F<E=m1,0n+2**TM3\iT#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0JXb=ARci<0JY@*0etdD
3BAiJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-
@<?'A+>>Pn6tKjN1,(I<+>GZ51H%9O2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,
+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+3+@KdN+>PW+0d&2-3\r`V1c,OH$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg0H`bp@j!N\1,0n*
3BArM3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp18
+<X'\FCdKU0ea_<ARci<0JY@*0ebXC1-.9H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>GSn6tKjN1,(I<+>>f:2)REM2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp.3+@KdN+>PW+
0d&2*3\iTS0JEh@$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Po!+@KX[ANCqg0d&kq@j!N\1,0n+0fh*N3\iN!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0eje=ARci<0JY@*0f;!G0KM!I$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>GSn6tKjN
1,(I<+>G`71,q<M3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS1GL!p6t(1K3Zp.3+@KdN+>PW+0d&2.3\rQQ1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>GSn6tKjN1,(I<+>G`71cRNO2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9sp6?R!YA0=WiD.7's3Zp47+<X'\FCdKU1,9t?ARci<0JY@*0f;!I
3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\8[ATf1=6?R!YA0=WiD.7's3Zp."+@KX[
ANCqh1*Atr@j!N\1,0n+2**NM3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=
6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh1*Atr@j!N\1,0n+2**NP3\`Dt$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh3$:V#@j!N\1,0n*3'&oU
3]/l($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[
ANCqg0d'(sDBL\g1,9t+3BB#X3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg1E]:uDBL\g1,9t,1cd<I3\W8q$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh1E];4C`kJe1,9t+3BAiS
3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[
ANCqf1E]J'F<E=m1,9t,1-.*D3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=
6?R!YA0=WiD.7's3ZpC)+@KX[ANCqf1a#S(F<E=m1,9t,0fh$F3\iN!$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1a#1t@j!N\1,9t+3BAlK
3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU0K:1I@;[2C0JYF,0etdE2EEZL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Ghu8muT[1,(I>+>GT30f1pJ0a\6p:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.:+A-'[+>PW+1E\D-
3\rHN1c>[J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp
+@KX[ANCqh1*B1tDBL\g1,C%-0KLpF3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,9tE@;[2C0JYF,0ebXG2``ZQ$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>P\p8muT[1,(I>
+>Gc81,q<L0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS
0fC-s6t(1K3Zp16+A-'[+>PW+1E\D+3\WNS0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1E]:uDBL\g1,C%-0KM$K3\`N"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,C%F@;[2C
0JYF,0ebXF3'&lQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t3?TG4@<?'A+>P_q8muT[1,(I>+>GT30JPUE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp16+A-'[+>PW+1E\D03]&ZS0K'7F$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh1E]:u
DBL\g1,C%-2**QP3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=Wi
D.7's3Zp16+<X'\FCdKU1,C%F@;[2C0JYF,0fD'M3'&iO$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>P_q8muT[1,(I>+>Gf90KD0K2@9cu
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp18
+A-'[+>PW+1E\D-3]/]S1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*+@:3bCh+Y`F_tT!
E]P<u2BX,1@<?'A+>Pht8muT[1,(I>+>GQ21,V*M1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,C$q6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1,^7I@;[2C0JYF,0f(jE2``cU$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51E[f,F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqh2BYV#DBL\g1,C%-1HI6L
3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp19
+A-'[+>PW+1E\D/3\`KQ2)#@E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*+@:3bCh+Y`F_tT!
E]P=!0H_K+@<?'A+>Pht8muT[1,(I>+>G`70f;!H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,L+aATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqf0d&qs@N[E[1,C%-0KLpH3\rJt$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+;+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>Mm7V-$O1,(I>
+>GQ20f_9N2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,L+aATf1=6?R!YA0=WiD.7's3Zp4$
+@KX[ANCqf2'>A"@N[E[1,C%-0KM'F3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+;+Co&,
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pku7V-$O1,(I>+>GW41,_0M0FA-o:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,L+aATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2]tS$@N[E[1,C%-2**QR
3\iN!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+;+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>Pku7V-$O1,(I>+>Gc80JY[D3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,L+aATf1=6?R!Y
A0=WiD.7's3Zp@(+@KX[ANCqh3$:\%@N[E[1,C%-0KLmH3\`As$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+;+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Po!7V-$O1,(I>+>GQ21,(aG1C=Hr:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,L*r6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh3$:\%@N[E[1,C%-
0KM'K3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp."
+@KX[ANCqf1a#M$EZd+k1,C%-2**TM3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+<+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqf2]th'EZd+k1,C%-2**HK3\iZ%8l%iS:JXY_6<-TN
6qBmJ<)6Cp1,TLJ:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r
@V'R@+?1Jd6t(1K3Zp+:+AQiu+>PW+0H`&/3\iBM0Js:H%13OO:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&o
F(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.4+AQiu+>PW+0H`))3\iHO
1H,aM%13OO:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's
3Zp.2+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp18+AQiu+>PW+0H`)*3]&WR1boCF
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,U1LDg!6Y0JY=)0f;!K2```K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pht:2b:u
1,(I;+>GW41,M$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp1:+AQiu+>PW+0H`)(3\iNQ0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh*G
3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1cdHR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pku:2b:u1,(I;+>GT31bh$G3!p!":-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:
+AQiu+>PW+0H`)*3\W9L0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=ARci<0JY=)0ebXC1HI?J$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.6+@KdN+>PW+
0H`&/3]/ZR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.4+<X'\FCdKU0f^@EARci<0JY=)0fD'H0fh!F$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.3+B)ij+>PW+0d&2+3]/lX
0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.7
+<X'\FCdKU1,0nI@rrhK0JY@*0f;!J2EEZP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14+AZKh+>PW+0d&2.3]&TQ0K9CH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU
1,0nI@rrhK0JY@*0f;!K1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,
+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+AZKh+>PW+0d&2.3]&fW0KBII$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,0nI@rrhK
0JY@*0f;!L0fh$C$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&
:3CD_ATBgS1,'gn6t(1K3Zp14+AZKh+>PW+0d&2.3]/ZR1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0JXb=ARci<0JY@*0etdD
3BAiK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1,9sp6t(1K3Zp+3+@KdN+>PW+0d&2,3\rZT2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JXb=ARci<0JY@*0f1pI3'&lQ$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K
3Zp.2+@KdN+>PW+0d&/13\rHN1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0ea_<ARci<0JY@*0ebXC1-.9H$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp.3+@KdN
+>PW+0d&/13]/cU1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1:+<X'\FCdKU0eje=ARci<0JY@*0ek^E2EENG$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.3+@KdN+>PW+0d&2*
3\rcW1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp1<+<X'\FCdKU0eje=ARci<0JY@*0f;!G0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp.3+@KdN+>PW+0d&2.3\iZU1,oUJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp45+<X'\
FCdKU0eje=ARci<0JY@*0f;!J1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9sp
6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0eje=ARci<0JY@*0f;!K3'&iQ$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9sp6?R!YA0=WiD.7's3Zp47+<X'\FCdKU1,9t?ARci<0JY@*0f;!I
3BArQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>P\p6tKjN1,(I<+>G`71Gh-K2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp15+@KdN+>PW+0d&2.3\r]U0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh
3$:V#@j!N\1,0n*3'&oU3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0ejeC@;[2C0JYC+0KD0O3BAoR$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,C%)+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GYp8muT[1,(I=
+>G]60JkgE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r
@V'R@+>t>b6t(1K3Zp16+A-cm+>PW+1*A823\WQT1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+:+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqf1E]J'F<E=m1,9t,1-.*D3\`K!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\
FCdKU0JjnJ@rrhK0JYC+0ek^D1HI9J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,C%)
+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>G\q6tKjN1,(I=+>>f:0ebXC2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqf3$:h%
DBL\g1,C%-1-.-J3]&Pu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>Ghu8muT[1,(I>+>GT30f1pJ0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg3$:h%DBL\g1,C%-
1-.3F3]&`%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t1E[f.@<?'A+>P\p8muT[1,(I>+>GQ20f1pF2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1*B1tDBL\g1,C%-0KM'M3\`T$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0
@<?'A+>P\p8muT[1,(I>+>Gc81,q<L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1E]:uDBL\g1,C%-0KLmI3\`N"$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>P_q
8muT[1,(I>+>GQ21c@BL2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh1E]:uDBL\g1,C%-0KM$M3]&Z#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>P_q8muT[1,(I>
+>GT30JPUE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r
@V'R@+>PVn+@KX[ANCqh1E]:uDBL\g1,C%-2**QN3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>P_q8muT[1,(I>+>G`71c@BL
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p
+@KX[ANCqh1E]:uDBL\g1,C%-2EE]T3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>P_q8muT[1,(I>+>Gf90KD0K2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh
2'>M"DBL\g1,C%-1-.9K3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>Pht8muT[1,(I>+>GQ21,V*M2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2BYV#DBL\g
1,C%-1HI3K3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<u2]s52@<?'A+>Pht8muT[1,(I>+>GZ50fM-I1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqh2BYV#DBL\g1,C%-1cd?K
3]/W!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u
3?TG4@<?'A+>Pht8muT[1,(I>+>G`70f;!H2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqf0d&qs@N[E[1,C%-0KLpH3\rJt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A
+>>Mm7V-$O1,(I>+>GQ20f_9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqf2'>A"@N[E[1,C%-0KM'F3\rJt$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>Pku7V-$O
1,(I>+>GW41,_0M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Yhs+@KX[ANCqh2]tS$@N[E[1,C%-2**QR3\iN!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!2'=#0@<?'A+>Pku7V-$O1,(I>+>Gc8
0JY[D3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Ynu+@KX[ANCqh3$:\%@N[E[1,C%-0KLmH3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A+>Po!7V-$O1,(I>+>GQ21,(aG1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#4*/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yu"+@KX[
ANCqh3$:\%@N[E[1,C%-0KM'K3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen52'=In
A7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0JjnH@<*JG0JYF,0f;!L1-.0L$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>>_s9jr&b
1,(I>+>G`70f1pH3=8AS6sjkAF(KB8ARo.ZEcQ)=F'j$6F>>^K67s`[:IJQ.@WQ+$G%G2kATDg0
EcW@E/M/)SF_;h5DeC2$DIal1ATMg/DKBB1/e&-s$;No?+FA0O@<-HADe:S>@WQ+$G%G29ATDg0
EcZX<$4R>;67tA`-o!.n@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8EbBN3ASuT4-u*[205<?u
1ark@:-pQU1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/
Ec5tZ+Du"*FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?4[(8K.3N5:GWHsaDe*Qo
Bk:ftFD,5.G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)+CT/5+Du=<C`me1@<,jk
+Dbb5FE8RDEc5o.Ebp"DDfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.
CER2/Ec5t@/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4
E+*j1ATD[0/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q
+D,%rCh7-"%15is/g)8q+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*
+CTA6ASlC.Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=@ruF'DIIR2/g)99BOu3q
+DGm>@3BW0D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)/KeS<@ruF'DIIR"ATJu(
Eb/[$ARlomGp#^%2(gR>+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%
A0>K&EZf4;Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)ATo8;Dfp/9DImlA%15is
/g)o0+AH9b+>PW)2'=V13\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!>\[\fA8,OqBl@ltEbT*+
>]++pD..-r>\[\fDImp,@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z
+DP8(ART*lBKKf8$4R>;67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn
+EV:;Dfo]++CT-s$;No?+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.
G%GJ4@rHC!%15is/g*b^6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99BPDN1ATDg0EZfR?Cht58
FD5Q-+E(b"F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>
E+O'+Gp%3L@;p0sA1e;u%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?De3u4DJsV>E,ol9ATDU4
+Co2-E,8s.+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeL
A3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9
$6UH6E-67F-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ
_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;
%144#+D58-+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:Oe
ZSB>'0d([YEb$S>.3N/4Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYs2e$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#
+:SZ#+<Y3/F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3
DJ((a+Cf>-G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCi
F`M'1ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYs2e$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j7
8g#].FCfN8+Cei$AKYMtF)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9+D#S6DfRl]FD,6+AKY].
+CQC/Df021F*(i.A8,po+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9FD,*)%15is/g)9IARfOb
Eb/c(F(9--ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4+:SYe$;No?4[(8N.3N5:
GWHrV$4R=O$4R>;67tA`-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$B-;;7+D58'ATD4$AKYW+
Dfp#?+EqL1DBO%7AKYMpE+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G
$4R=b+E(d5-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAOEb&d#Ec#6,Bl@l:%13OO
:-pQr4t&9;+D,>43ZqpG@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?
4?Y)N.3N2=E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'
@psM$AKYW+E$-NG@;TR'4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg+DtV)AM,)7$4R>;67tDb
-oNLsAncKN+=LlDD..3kE@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRl
BleA=@V'.iEb,[e:-pQU@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f%13OO:-pQq4X`6<+D#S6
DfRl]-u*[2@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=
@<-"'D.RU,Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6C2[WkB4W25A92j$F=/1R
:-pQU@s)m7+DtV)AIT"+P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufT
ifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-
Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQ
P^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%*+<VfdP_(YE0K1[G
0ek:;+<VdLifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*+<][.Ji>\4+<VdL+<VdL
+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifof>$6UH6%13OO+>P&^C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$m
F!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$(
$K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;
P_.nZJmoiF+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@
1bg*qifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&-QjO,67sC!CER5-EZf14
F*)I4$4R=u+DPh*@:s-oI4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et
+CoV3E$043EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)E--.1$;No?+EqOABHV2(
G9D!AD.Rd1@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1
Bl8#%$;No?+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8XDe(M9De*g-G%>`4E-![L
AT089C3(a3$4R=b/hSb/+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+
A8b[\4Y@j"+<X'I5tsdT?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$
Bk)7!Df0!(Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q
.3N2BEc5tZ+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC
+E_RAF`2A5A.8l@67sBpDIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;i
AU%X#E,9)H+:SZQ67sB73?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&BOu3q+CT;%+Du*?D/"6+
A0><%F(o9)D.RU,F!(o!D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\
D.RU,F"'7)+>=63-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@
D/"6+A0><%F(o9)D.RU,Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfR37$4R>;67tDb
-oi_!AncKN+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i
1,(FA+>GZ51c%0M2[p*'$4R>;67tA`-o!D)+D#S6DfRl]Ch[cu+Dbb/BlkJ/G[k;rA7]9oCi<`m
Bl7Q+Derr,8l%htA9Da.+=L]/BdjJu:-pQU0JjnH@<*JG0JYF,0ebXG1cdEQ%15is/e&._67sBL
DJ*[$ANCrK3A*-@0e[9"1gtQP1,!0HEd)58%15is/g*K'Bl%<@+Cf>,D.R`tBjkg21,(I>/MJq3
1,i/e2**KN3\WKG@r,RkB.Yhp/MJb102kP577KEp%15is/g*i%@WGmtGrd'./i5190F\@a67sBX
F<F.C762PH/hen60/bF</i4t7/i#%9.1HVZ67sBWCghEtDfT\U+@KXYGA1q;2DbjM:-pQU8T&Tk
@;KakE]P=X3A*-2Bl8!6@;K`h$;No?+A$HlFCB!%:gnHZ3Zp(uF(KB505>E=DIR$iATBG=2Dd(%
3A*,t$;No?+@C'bFCA[$3ZrWjG:mWODe=*8@<,p3@rH2n$4R=b+<X*J?URq2@<ld6FC-a^0K1aF
4ZY;V2DcO30I/#?7863X84c0D-T`\S6;p3X8OOpf-V[$(7:/DT-T`\S6;p3X9L2TV?VWm]741/E
;aODL?UdUb;cI+!5tscq4"!Nr7oE\c6mk&D6Z6jaEa`I"-T`\S6;p3X9g_lX?WK`p-T`\S6;p3X
;FNr@?URj@4"!I!6UY9Q6mk&D79DoF?W0Kk;H."&79EM:4"!`k78.&W7Rg`Q<$saT9gqKE?U[X[
7pf4u:dl`n-V[#u9OCL]<)R($;be]%-VZs-;I;g\;aVoo-UC^1=^O`g-T`\A<)Zq,6q($A-T`\R
AT2R.F@0tWAOCKL@<?'K@<?'.4"!p;E,Tc=6Z6LH9OW!a<H)JWFCcg]-nlo#.6An3<C]#=2)7Ng
2)cmE-SR5.0JG=C1G^C?-S[J62`ETJ0df%17VQaMBI>kh9jr'VCjBnG4!u^:0JG170JOq:-V,sJ
2)$C>-nH`E-Rh,)0ek=92_Qp?0fL401-.*C3\W6?0JG1'5tr^g-RUu':2b4s6$%*]B5V9k-T`\1
0/5+80JPO00etdD0KLmA/het5+@/^L4"!ot-T`\E:,O^Q4"!Hl2)$.N77g5sG:u=,Eb?L]Ebd$a
-RUu'-T`\'4!uC;-nlo#.6An6;)C4)7Q<b<2DQXA-SR5.0JG:?2)6O@-S[J80K(UB0df%16"G6g
4"!F)Ec5bA4!u^:0JG170JOq:-V,sJ2)$C>-nH`E-Rh,)1G:LB0/>493$9q23\W6K0JG+50JFV8
9d`"M75[%P4"!rq:`sdi3Zp_)C`lMqBOu3,;ajM*7<W6[FE8QQ9gKn?DJXSI-T`\40/5+80JPO0
0etdD0KLmA/het5+@/^L4"!Bd-T`\E<%p!R4"!Hr0JFV$+@^BiD'2euF_)[^Cis;:4!uC;-RUu'
-T`\'4")d.0I](22H3($7oD96<A6<Y4!u^90JG491bgm94!ua?1c7*G2)-I?-UD9g-T`\H@<?U*
ALBPe0JP780JG18-T`\H0f([@-T`_--W;BA4!ug;1,gjA0JPO00etdD0KLmA/het5+@/^L4"!HS
3%$d8;ajM*Eb.9S6#:?[:NU8]EZe:L:`r2MASuU2+=KrM+E).6Gpt+&-T!J20/>493$9q23\W6K
0JG+50JFV89d`"M6V&Rd-Ugug0IJq078trp+>"^*Ec5e;<-!+m+@9meALBPe-T`\'4!uC;-RUu(
0I/>$4!ua_2`<rk1fd.+1+,.20JG170f1aH0IJq00f:jC0JkC7/e&/8Ch[a#F<G.8Ec5tL+D#e/
@s)m-DJ()/Df/uo+>=s"0JO"DHsn.=H#n(=D'3Y/D/")7G@>P8AU%]rARo@_%17J*+<VdL+<W?]
3\W9NC2dU'BIA7$:IJ#W<^]q^:fB#V@qdQ0C3(a3$@H&02Dnb_06M>IEcWmKDeO#t@;BFp05>E9
05>E9E,p,4F_u)=04JF*/no'A%13OO%13OO:-pQUHY%)*/T55QDdmd!Ecu#)/S/sCDfToI%16'1
6r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgiDe(J>DJ(C@?qO3_?m&EE6r+7!4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/r
Eb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_F)to6/e&.eBOr;q@<6!&1H$@G<CoS$
CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$&'6?7!gF(HJ9BOr<,AThd/
Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKI5$:/KLD_*#OART*l>@;,Y
F*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9
BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C+Acl_DK?q2
D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI@V'1dDCosKA8ba]%13OO0eOSV4C;PV
AoM98D/M.H2D\caCO0nS2JG*n2.8LP5%#L)DI[L*A7Zm*BOr;Y:IH=6DIak^+EMgLFCf;3G%G]8
Bl@m1+DG^9FD,5.Eb0<7Cige<AftJ=+E(d5-RW:EBlkJ2ASc=,%144#+EVNECMn'7+EqL-F<G(6
ART[lA0>u-AKZ#)B5)F/Eaa'(Df.0:$4R=t/g+Oa?SX<ND_Pg=3H&A:BJj[E2.prA1Lt$9AN*s[
?m&E^AKYT'Ec#6,+CI2Q3\`I!+Cf(nDJ*Nk+D,P4+A*b:/i51'?tsk&?m&rtD/aW>ATJ:f+<Ve8
DBNY2@rHC.ARfg)G%G]8Bl@l3DKTf*ATBCG7rN*ZB-:f)Ed(r4A0=JeBlbD>F(oN)+EV:.+CKA(
EcYr5DD#d7C2\,FD/!m+EaU#+@<ld6F=n"0+<VdoDf0`0Ec`FIATDj+Df-\-BOt[hBl7Q+Bl5%c
:IH=8De*E%FDi:EF(HJ8FE2)5B-8RF/o<4Y-QmML+Co&*ARfg)@q]:gB4Z-:+@pEeA0>f&Ado(i
+<YfEFD5P6FD,B0+D,P4D..N/F*(i"Bl%L0ATKIH-q%ukAKYT'EZdss3A*-;%13OO1G0eX4C;Q9
FDWgU13R2MG;j5XAN"=>H$O*X0f4&\5%#L*-Z^DBBl%?'G%G]'F!,=.Gp$d/DJ()9BOu'(@:NeY
F)u&5B-;D4DId[0F!,(/Ch7Z1Df-\.EbT].F!+n$@qB_&ARlomGmt*'+<X]]:*=%bDJj#qFD5Z2
F!,[?ASrVk:ei-IF!,C5AhG3*BOu3q-Z^DJDfd+=F^o)-8l%ht@ps6tA8`T&DfQt;@;p0sA0<::
ATW$*E[PF/.1HV,+<Y38Bm+'/+C]J8+CJemG\M5@?m'$(ASuU4@;Kb*+ED%8F`MA@+>=pMDfQt$
:ei-SBOPpmF!,:5CLoO9$6UH6IXZ`p%144#+<Y9-G\M5@+=AfqC1_NtATfaa06:f8Eb0;FC2[W9
C2[W9C3OT:A90A;C1\h&$6UH6IXZ`p%144#+A,Et+Cf>4Ch+Z!D]iI2EHPu*CER25BleB-DI[6#
@q]F`CERP5+EqO;A8c[5+EMgLFCf<1+EqL1DBNY8+EM+*F!,UCD..C&ARl5W+<VeJBOPpmF!+jD
06;&KAM8+<@<,p4AS>a1C3OT:A90A;C1^j++<XWsBlbD@Bl%T.DJsV>BOu"!+D,P4+BD<6+DkP+
E+NQ&A9)C-ATJ:f+<VeNBOu'(<_uO6BlbD8AnEY)$4R>!/g+Oa?SH2*AU/*<AN"(B1cKSlD/jk]
Ec5_N@qf:6?m&0PCLnW0F`M%9?tsUjCh\!&Eaa'$?m'Z3Ebf_=AoD]4A8-'q@ruF'DBNJ$Anc-s
FD5Z2F"AGTAS!nF+Br5Q:IIucC2[X!Blmp,@<?'5D.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<)5nX?YXLiCh\!&Eaa'$/o>,J/e&-s
$8jFY?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?<+U,m+CJr&A8Gt%ATD4$ARHX!DBNe)
@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>#/g+Oa?T0o^H=_8>BQ/9?B5r!*EcjB"
3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3Ecl7B
Df-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5DK@E>
$4R>$/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7
@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%15'I
+CI<=1h'p*H$4.@2g@9'2)I+13-oBsG&B!J3F=sX+@C'bF(o/rEZee$A8,po+CQC#@Us1oE*sf3
ATD6&FD,*)+EqaHCh+Z4DfTV9Ch[Zr+CJ_oF)YM0@Wcc8F(fK9+E(_(ARfh'+DG^9@UWb^F`;CS
%13OO3A)Es?p%e,0k>B<CLf.VH#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2
045o2F!+m6E+*j%+E2@4AncK4Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,
ARfh#Ed8d;Df0`0DKKT2DBNk8+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s
$=I(LDIb>@De*cl?k!HVBleB7Ed;D<A26(Q$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen52'<>8%144-+CK(uG@Y)(DJs_A
FCArrF!+k$E-#T4+=C&U<'a)N5t=?k4#(+c@;]Tu?t=4tATT%B5uU-B8N8RT4#(+c@<3Q%AS,@n
Cij_-$6UH6+EqL1DBNG0ART[pDJ()0ATo8-Bk)7!Df0!(Bk;?<%13OO,9nEU0eP.41,L+CAR]\&
@<-W91,pg-1,(I>+=L0-Gp#F^Ci"$.DBMAYBln'-DCH#%%144-+A*b:/hf+)Eb0,sD.R6#FDi9o
+?;&2+CT.u+EV:.+DbJ3Dfp.EDe:+P+Z_>7+Eq78+Cf(nDJ*Nk+EV:2Et&I!+<Y]9EHPu9ARlol
+Cf(nDJ*N'FDi:0C3FK&+EqL5@qZupDf'H9FCfM9@3B/uDdda%DJ()8ATDj+Df-\8F_tT!E\7e.
%144-+CIT69M%rM<+$hm@<3Q#F_u)/A0?#6+EVNE2Dd$/8S0)jDfm1?AS#BpD/XH++EV:*DBLho
+Co1rFD5Z2@<-'nEt&I!+<YT?+F.mJEZdtM6m-GWFD)eBDfm12Eb-A(DeX*%+EMI<ATVU"DJ()9
Ec5i.+Wq4$%144-+CK/2FD#Z&+CSeqF`VY9A0>u4+Cf(r@r!2rBl7@"Gp$U8D/`p*BjtdmBlnVC
/KenEF)to'+EV:2F!,17+E2@8DfQtDATDj+Df.0:$4R=O$6pc?+>GK&/i#4*8muU[@<-W91,^[+
1,(I>+=K`kDId=!+@^0iBk/>TA8-."Df.!5$4R=b.Nh>+3A*!B-Z^DQF(HJ4Aft;J9i,+DBQS?8
F#ks-B5MU(Bjr]5Eb@$S+D,P4+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+:SZ#+<Y?+F!,17
FE2;1F^nun+CQC%Bl7@"Gp$g=@rH4'@<?3mBl%L*Gp$R-FE_;-DBMOo3A*!B+CT.u+E2@8DfQtD
ATDj+Df0V=De:+a/e&.1+<X9P6m-PmDfTE1+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)+DG^9
A8,OqBl@ltEd8d:Bl7@"Gp$L0Anc'mF'pUC8g$,H0Jj4G+<Ve:@;[3.ART*lDerrqEZeq<FCf?#
ARlotDKKH&ATDi7@Wcc8BkAJ[+?;&.1a%!_Blmp-+D#e>ASu$iA0>T(FCf)rEcW@FD]iG&Anc'm
F'oFa+<Ve:Df'H3DIm^-F!,C;A7]d(8ge[&@ps6tDJpY<ART*lCi=3(ATAo8BOu$5+B3#gF!,X;
EcYr5DBN@uA9/l'BOt[hF!,RC+CK/2FC6X/$6UH6?tX:o@WPp"@;]Tu?t=4tATV<&FDi:@Eb0E*
DKI"CBOr<'BldrrDIdQtDJ()1Aftu&G;!lNA0>>qDIIR2+Cno&@3B9%+Co1rFD5Z2@<-'nF"Rn/
%144#+BLj,:.\2N3ZrN_+E_X9Ea`Ki+EVNEFD,B0+Eh=:F(oQ1+E(j78l%htEb0<'F<GjIF`JTs
:IH=B@<6O%EZet.Ch4_uGrcBA%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%13OO+<VdL+<VdL
:-pQU@UWb^F`8IKDfp(C@s)g4ASuU+Gp%-=B5)F/ATD?m+Co1rFD5Z2@<-'nF!+n/A0>r,F`\`u
+CoD7D@Hpq+<VdL+<VdT0d(FL@r!2E+E(d5-RU>cAp890FCcS0E+*j%+=DVHA7TUrF"_0;DImis
CbKOAA1q\9A9)6oBleB-E\;'@F!hD(+<VdL+<VdL%144#+<VdL+<XEG/g,1GF*(i2F<F0u@;]Tu
ATD4#AKZ).AKYT!Ch7Ys$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9
D..L-ATBD;C1\h&$6UH6+<VdL+D,2*@<6!&C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De(J7
C2PC.$4R=b+<VdL+<Ve%67sC$ASc9nA0>u-AKZ#)B5)F/ATD?m+Co1rFD5Z2@<-'nF!,F1H"h//
+CTA6ASuU(Df-[,$6UH6+<VdL+AP6U+EVNE@;^?5@VK^gEd8dADI[U%E+*j&@VKXmFEo!GATMp$
B4Z,n$6UH6+<VdL+Dbt)A0<74ASu("@;IT3De(4)$6UH6+<VdL+>=s"0JG4(4DJhDFD)dEIUQbt
Df0VLB4YslEa`c;C2[W9C2[X'AS5^uFCfJFBkh]:%13OO+<VdL+<VdL:-pQUFDi:EF(HJ4Ch+Y:
@V'.iEb-@R/hf+2+Co1rFD5Z2@<-'nF!,aHFWbmBCht5-@<Q3)FDi:CATT&:BOu$'%144#+<VdL
+<XEG/g+%\5t"LD9N`KPDBNA*+E)(,ATAo:ATDj+Df-\9Afs\g@;]TuFD,6'+ED%+BleB-EZf(6
+A*b:/hf*k$4R=b+<VdL+<Ve%67sC%ATT&*Bk)7!Df0!(Gp$!R5t"LD9N`KPDBNA*+E)(,ATAo.
%144#+<VdL+<YT5+=D)DA7TCaF=.M)+<VdL+<VdLA8lU$F<Dr/76s=;:/"e<%13OO+<VdL+<VdL
:-pQUFD,6'+DG^9@3BH!G9A;++?;&.1b1!t8g&.cB5)F/ATAn&$6UH6+<VdL+ED%+A0<7<Ch.'j
@rs([-Y#1jGA(Q.AM8=IF`K-GBk)6<BlbX2$4R=b+<XET<(/hjBkAK5Dfm12Eb-A3DJXS@Bl8$(
Eb0<6ARlotDBNtBDJj0+B-:],EcP`/F<F19/hf+)@;]TuDIn$'EX`?u+<Yi=EcYr5DK?q=Afs\u
+B`W*+Ceht+CoV3E$0FEF`JU8Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.D@;]TuEb0'*@:TfS
+<VeKBOu$'Bl5&2ATqs9+CfG'@<?'k+A*b:/hf+)A8,OqBl@ltEbT*+/g+,,AKXT@6m->TDKTB(
+D#e:Cgh$qF!,.7G9D!G+CoC5FD,B0%144#+DG^9FD,5..TCP2DJ=!$+A,Et+@L?hE$/(hEbTK7
+B3Aq@r$-8+CT5.ASu$mGV1*J$4R=b.Nh>+3A*!B-Z^D?BOPdkATJu9D]j.8AKZ,:AKYo'+EV:.
+ED%+F_kK,+D#e:Eb0<5Bl@l3Ch[@!@<-W9?r03g75A6nAoD^"ARlp)Df'&.%144#+CSeqF`VYA
ASuU2+EVNE?ugL5?nNR%DJ<U!A7ZlnBOPpi@ru:&F!+n3AKZ);Ec,H!+E(k(+EqOABHU]'G]e+?
3$9n_+E2@8DfQ9o+<VeKD]iG.G]R78F(Jd#@q]Fp/g+,,AKZ&*FED57B-;8/Dfol,+C\n)Eb0<6
DfTE"+CSl(ATAo$Ed2Y5+EDUBF!+q7F<F-tGAhV?A.8kg+<Y*'G%l#/+Cf(r@r#drB-:f)EZek4
Bln'!@;I&rDe*E3+B3K(DJ=!$+E(k(+B<;n@rGmh+DkP4+Dbb/BlkIi:IHRO+CS_nCh\!:+:SZ#
+<YcE+Co%lC`mq9FD)e<Df'&.A8bt#D.RU,F!+q7F<F1'F!+J#Bk)'lAKZ&:E,]`9F<G7*F!+n-
G@>c<+E1b0FD50"/e&.1+<V+#+=\LA2'?gJ+=AOE+CSeqF`VY9A0>u4+EMIAF<GU8B5)F/ATD?m
+Co1rFD5Z2@<-'nF"Rn/%144-+Auc`AU#>/EcQ)=F!)lBEcQ)=F!,17+EV:.+ED%+AU#>/G]7\7
F)u&6DCH]GDg*<5$6UH6FE1f/E+NQ&@;]Tu@r,RoBkD'jA3(h\.X,oODJ(=>Ed2XJI4cXQDJUFC
-OgD*+<XL$BlA#78l%htG%G]8Bl@m1+DbV2+ED%+AU#>/EcQ)=F!,+6+EVNEFD,5.FDl+@Ch7d$
C`mh?@;mh.$4R=e,9n<c/hen51*A.k6tKk>D.7's+>GT%+>PW+0d%l?D/!L#Df-[u@<-'jDKI!i
A8-."Df.!5$4R=b.NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>
A7f3Y$4R=b.NfjAF`V,)@X2?(G@>P8Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD
+DG^9Eb0<7Cij_N+:SYe$6Uf@+@KpaARfg)@!d6.+>,9!+CKVG?m&ukAnc-sFD5Z2F!,@=G9CsL
E,]`9FCeu*/Kf+GAKYAqDe(J>A7f3l+:SZ#%144-+<X*`BlkJ-Df'?"DIdf2A8-+(CghU#A0>K&
EZdtF;]p1#+ED%1Bl7H(F`V,7F!,RC+CT)&Dg*=5Ec6/CATAo4Df?hAE-!W@$4R=e,9n<c/hen5
+>"^2Dg#]/@V'R&3@l:.0JY=)-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2
.1HUn$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa<+T/S@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6
+E_X6@<?'k/0K"FANC8-%144#+<XlgF(oN)+DPh*Ch\!&Eaa'$>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$
/no9MDIP%($4R=b.Nfj/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-DBNk0+EV:.+=Ki):L\'M@rrh]
Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P9eo@.9hn)^/e&.1+<Ve+BPDN1
BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00
FDi:CF`;;<Ec_`t+<VdL8l%htA7]pqCi=90ASuT@+Cf>-F(o/rEZf=DEarckF(oN)+CQC&DfBtS
+A$/fFD,5.E,oN"ARoLmB-;#)DJLA,@;0P!%144#+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0
DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./J!
$4R=e,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn
$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/e&.1+<Vd9$6UH6+EM+*3ZqgF
E+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXn$4R=b+<Ve,F(Js+C`m>.EZfF7FED57
B-9uK+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Rn/%144-+<W(RATVC(Bl%<jBl\8D
+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>p$6UH6+ED%5F_Pl-A0>?,+EV:.
+DkOsEc3'K@WcC$A86$nA8-+,EbT!*FD5Z2.4u`BBPDN1F(oK1Ch[KqATJ:f+<VdLF(KH8Bl7Q+
F`8I@ATo86@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:SYe$6Uf@+CJVgA8H0mA927$
BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s%144#
+<Y?+G%De(/no'A?m'$*FCf?2Bl@m1/g(T1%14=),9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)
7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6Uf@?t*b[FC65*D/a<&D.RU,ARlo8+EM+*+CJr&
A1hh3Amc`_Bln#2FD,B0+CSekBln'-DBNA(C^g^o+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%
@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI6k'JG+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/
Bm=31+CT.u+E)4@Bl.R1@<?4%DK@E>$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP*$4R=b
.Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl
05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OV`n%144-
+EMI<AKYhu@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/e&-s
$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/e&-s$6pc?
+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144-+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC
+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33A1e;u%144-+CIo0=AD.V7:76PDI[]u
@<6!j+EVNE0et^2Ao_g,+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0%144#
+<YK3DJ+')+E(j7C*7D&D.Rc2FD,*)+Ceht+C\n)F*)>@ARlotDBMPI6nTTRF<G(%DBND"+EM+9
+EVN2$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f=F%144-+<Y'4D."n;?ug@2?m&lgC3=T>
ARlp*D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144-+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&
A1hh3Amc&T%144-+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0N)IpF_kK,,r./CG]7\7
F)u&6DK@FEE-Z>1.1HUn$6Uf@8p,)uFCfJ8DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8
ANC8-+<Ve28l%htCggcqDJsW.@W-1#F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9
FE1r(05Y-=FCfJGC2[X#DffQ"Df9E4.1HUn$6pc?+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNr
$4R=b.Ni,9DJW]'Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Ni,1FC65"A867.FCeu*
FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3e$4R=b.NfjDBOPdkARlokChI-,+CJr&A8c?n
+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+f6pjaF;bp(U?m'N%F<G:8+CK//
De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&A0>8p@rH7+Deru;AU%co+D#(t
FDl1P%13OO+=\LA8lJM\?n<F.:g$ag:JP:K+CJ,F9OJu[@:O=r+E)4@Bl@l3FCf]=+Cf>#ATJu&
A7T7^/g*GrC`l>G6m->T@rcJs$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7Zlt
F!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e/$6UH6+EV:.+DbIqAScE1@<3Q!8lJ)T8PiAo
+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL%13OO,9nEU0J5%33B8r>
/KdbrGp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+=\LBA7T7^+CIo8=@GVR<^fno
+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ctFCAf7%13OO+=\LG
Bl\9:+A,Et+ED%0ARTXk+EVNEFD,5.DIn#7>=rsTAor6*Eb-@`Bllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(fXFDe=*8@<,p.+CSekDf-\<AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8l</KdbrGp"js
/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH%13OO+=\L#AS>LqBlA-7+E(j7?t=4t
ATT%B;GU(f7Sc]G78bKp-[nBU:Icd?+Cf(nDJ*Nk/g(T1+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk
+ED%0@<?4,AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h%144#+CT.u+EV:.DBN@uA7]9oFDi:D
BOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^&$6UH6?uoguBlJ08?m'9"DIml3
Ch[Zr3XlE=+<VdL+<Vd9$6UHjAQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TE
EbTK702uLbAo^slG\q7LBkh\u$6UH6+<VdL+:SZ#+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^C
FE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:SZ#+<Y'5@rc:&FE:h4Ch[cuF!,:5
CLoO9$6UH6+<VdL+:SZ#+B2oSAo^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Et&I!+:SZ#+<XWs
BlbD,Df00*Ec#k?FDi:8Dg*=3F(96)E--//+D>2$A8Ggu+CSekDf0VK%144#+<VdL+<V+#+<YW>
Dfd*E+F[a0A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\u$6UH#$6Uf@;g!%uDfTqBAoD]48g$#E
0JO\]DId<h+CT.u+CT)&+Eh=:F(oQ1F!,FBBlA#7FDi9o+?1u-2]uOLAISth+<YQ?G9CgA+Dbb(
AKZ&:E,]`9F=n"0%144-+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%
F(o9)D.RU,+D#S6DfRH>$6Tcb+<VdL+<VdL:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$
+Dbb-AKZ).BlbC+$6UH6+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"SRX
%144#+<VdL+<YN8G\(DWDIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=63+<VdL+<VdL-r"8pBQ%EI
EbBN3ASuU2.6T:+0F\@3+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf>n%,`+<VdL+<VdU%144#%144-
+@.,fATo87@;TQu@;]LiH#m\@+EV%)+CHT[3[m3Q?m',kF!+q'ASrW!A7T7^+EVNE?uBCiARf.j
F'p,4D[d$r+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#
FCcRe+E1b2FCfK1+:SZ#+<YB>+E_a:A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@4$6UH6%144#
+<VdL+<XEG/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$6UH6+<VdL+AP6U+=Lc<
.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^g^o+<VdL+<Ve;DETTp-p1ilI4f5Y
.3L/g/j:CG<)Z@j6V\'t+<VdL+<VdL-tI3E4ZX]r@<;qc+<V+#+<Ve+BOr<*Eb0E.Dfp+D@q]:g
B4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2%144#+D>2,
AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+FD,B0+E1b2FCfK1/g)8Z%144#+<VdL+<VdL
%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2[p*'$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(
FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et%144#+<YB9+CJqoDf0W7Ch551G\(8*
F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s%144#+<YcE+EM+*+D>\;+EVNE@rH6s
BkMR/AKYK$D/E^!A0>]&DIjr%A8-.(EcWiU%13OO+<VdL+<VdL:-pQU<+U;r+D#(tFDl1BFDi:E
F(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%144#
+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ft
AoD]4-u*71DKB`4ALqD;ALS&q+<VdL+<VdL779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!
D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$4R=b.NfjAC2[W8E+EQg+E_X6
@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/FD55r.1HUn$6Uf@?tFFf
+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=+Du+A%144#+E)41
DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7A79RkA.8kg+<YcE
+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1A7Z2W+<VdL
+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b
.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9
ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I
%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL
+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-Y
A0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ
/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQu
Ch[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@+Dtb7+EV19
F<GX7EbTK7F!+n%A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMlq%144-
+CJr&A1hh3Amca(E+EC!ARloqDfQt.@W$!i/e&-s$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4
Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P9$4R=e,9n<b
/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!t
BmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9+CQC:DfTA2Ci<fl
C`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i
/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-@V0b(@psInDf-\-
@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)E--.DGA2/4+CHlH
3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1F!,:5CLq=-/g+,,
AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4%144#+Co&)@rc9m
AKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8DId='+ED%1Dg#]&
+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3
A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJF=A>@DIak<
DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5
DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W4"akp+=A:PAR[8I
0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,
@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp1#0d'q<ATT%W
4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>b3MB4Z0-
4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$@rr.e%144#+<VdL
+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs%144#+<VdL+<W%P
@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd$4R=e,9n<b/ibOE
2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO+=\L"+Dtb'@<?4,
AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71?m'Q0%144#
+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%+CoV3E$043
EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums+CfG'@<?4%DBNA*
A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;
F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rMDfd+G
BOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(nDJ*Nk
/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)%144#+<VdL
+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[
B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<
Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%67sBmCi<a(Bl7Q+
Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q%13OO
+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#+<VdL+<Vd\+C?i[
+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-+@.,fATo8)A8lU$
FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;Deoji+<Ve;F_u)3
DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:SZ#
+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,
AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9
E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*++CfG'@<?'k+C\no
DfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.
D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8
Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''
FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4?tsUj/oY?5?m'#k
Bln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dn
ATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4F_u(?F(96)E--.1
$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A
+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b.Ni,9Ci`u,@q]:g
B4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq+<Ve.BOu'(?rBcr
<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g+<Ve=DerrqEZeb,
Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKrATBC4$6UH68S0)Q
;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlokC2dU'BODrp
DerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@lt
Ed8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9
C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA
+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9
FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$B6A6+A0>K&Ch.*t
%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO+<VdL+<VdL:-pQU
B4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrqEX`?u+<VdL+<VeD
Ci^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+AoD]4D..=-+CJnu
De*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@?upO'G[MY&DIakt
Cijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.DKBo2@:UL!AftK&
G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?k!GP$6Uf@6Z6LH
+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;@:WplAoD]4@q]:g
B4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."
Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1
/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Rn/
%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,
ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-DesQ5AKZ&.H>.80
+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=@;0O#ASuU(Eb0'4
+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!
Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<
ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8DIal(F!,@=F<GO@
Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1r
FD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A
?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!Df0!(GsldlE*sf&
F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg@N]`'ANC8-+<Ve2
C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR
05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg
/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6>=q[Z+B<Ak@<?'A
+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=
05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In8p,#_+>Pf*+>PW*
1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQt
DKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO?n*9.$6UH6+<VdL
+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#
@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144-+CJc&?m'T2
A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+m
/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>
+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5GB4m8+Dbb/BlkJ/
EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1%14=),9SZm3A*<I
+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4
+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+GA(]4ATMg!@q?ck
DIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIjCERG-DIkFC<+oue
+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%@<3Q*F<GXIE,]i/
F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%/0H]%0f'7G%144-
+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1BqFEDJC3\N.!Bln$2
@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H
%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA18X2Df0Z*
Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc@:Wn_FD5Z2@;I&s
Bl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9
Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2F(Jl7+q4l%
+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg
.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9o
FDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL+<Vd9$6Uf@:3CDb
Ec6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#+<V+#+=\LAA8lU$
FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:gB4Z-,Df-\*;FNl>
:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])+CQC#;FNl>=&MUh
7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL+<VdL%144#+<VdL
+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l$6UH6+<VdL+:SZ#
.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q%144#+CKG%
+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&+$6UH6DJs_A
A8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I+?:QTBle59I4f/Q
E$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*
BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<lBlbD*+E_d?Ch\!:
+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>
@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl
/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,
DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf
+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,
Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59-Zip@FE;PH@OGP7
%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[+<Ve=Bl\9:+Cf(n
Ea`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2Bl\8I%143e$6UH6
+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!?n<F.D00/:+CK&$
?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi$$6UH6
@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3De(M9De*g-De<^"
AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@?tsUjCh\!&Eaa'$
?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6@;]TuFD,5.@Vfsq
+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:
0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!%13OO+=\LA9gMZM
6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(+=AOE+Du+A+Co2-
E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+=\KVD/!m+
EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*+EV:.+E2@>@qB_&
+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6Bl7EsF_#3(B-;;0
BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F%144-+Co1rFD5Z2
@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ%144#+CT.u
+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`/gk$L%144#
+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT56WHiL:/jVQ
6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ+EMXCEb0;7FCf]=
/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI$4R=b.NinGF*),/
Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&34$6UH6;bp(_
6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#ARlolF<G[=AISth
+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Et&I!
+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO<M
+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNE
FCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds
@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$
+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.+DkP.FCfJ8E+*j%
+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1Ums
F!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9
D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)
@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(kF!,F1FD,_J+<V+#
+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*
+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4@:WneDCH]NE+EC!
ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d@j#9"D/`p*Bjtmi
+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'
DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm:
$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlolF!+m#$6UH6F(K<!
Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc+<YcE+E2.*@q?cj
C2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUjBOu"!?nNR0C2[Wr
ASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f4%
+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@Ch[cu+D#G$F!,17
+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIqF!,UEA79RkA0>K&
EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%Eb]GDBkh`t+ED%1
Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/
DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUjAoD^*?m'?*G9CC(
Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9+DkP$DBMOoCh[@!
@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(@ps1b%13OO,9nEU
0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq+CT.u+EM+9+E2IF
+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ%144#+<VdL+<WNa
E-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(ARci;1+XP'0JP9k
$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amc&T
+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$DBN\4A0>Ds
@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:CE*t:@<+oiaAKYT!
Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[%144#
+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=
@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9Cj@.IBPDR"+EML1
@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5
Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=),9SZm3A*03/KdGm
@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7
@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9$6Uf@AncL$A0>;u
+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEuEccGC/no'A?m'#u
FE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&$4R=e,9n<b/ibO@
+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNEEb/ioEb0,uAKYK*
EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k
?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!D.OhuDIal#BkCsg
Eb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99$6UH6%144-+E_X6
@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%+A-co+>GT%+>PW*
0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)
AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)
@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7AoD^,@<?QO+AbHq
/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9C`m1u+ED%:Bldir
+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;
%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\DKU1HG%G]8
Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?
+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4
+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3F(oQ1+E2@>@qB_&
+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0
ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.FDs8o06_Va/n/aD
/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1HF)Y]#BkD'h+D#e+
D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9Afu;2@<<Va:IH=>
F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E8l%htGA1l0+C\n)
D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9A1euI%13OO+=\LU
BPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je2_He/+EMgLFCf<1
/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=AftYqBlkJ@ATD6&
?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO,9nEU0J5@<0H_qi
7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu8k2iR
/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=$6UH6%144-+ED%4
CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+E!
+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:SZ#
+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAISth
+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.+EV:.%144#+C\c#
AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0
Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4
D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78+C]U=Amo^&FD,5.
Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3Y$6UH6BlbD7
Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3Y
$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2E+EQkDdtG.+EVNE
AStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</
Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p@rcK1F(96)E-*44
De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI?n!];$6Tcb+=\LA
6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#+:SZ&,9n<b/iYI;
+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK6
6V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:@<5pmBfIsmAoD]4
FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3
B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*
DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8@<5pmBfIsmAoD]4
8l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.F(or3+E(j7FD,5.
A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1E\7l
:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c
:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LGBm=3"+CQC)ATo8=
H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63($6Uf@@rH4'Ch7^"
A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3lFDi:4ATM@%BjtWr
@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/A0>r3D.Oi+@<-!l
+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-H=[Nm+:SZ#.NibC
E,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7
C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/ioEb0,uATJu&A7T7^
+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:>psB.FDs8o
06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHq$4R=b.NiSB
DJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:SZ#%14=)
,9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl5W+:SZ#
.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm2(gR*/KdZ.C`kGl
/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth%14=),9SZm1bLI)
/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*
A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)
DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'1,(CA%13OO+=\LN
Bl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1@<itO0e=G&0JGHq
$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^$6pc?+>>E(/iFh(
+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:WneDCoRKARlu-8l%ht
/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6
@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et
+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4
+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<
ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%Df'?"DIal/Ec5K2
@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2F
C2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$>OKiE+*d(F##IF67sa&De*fqEc#k?F"Jsd
A7]@]F_l.BA8,OqBl@ltEd8dH@<,dnATVL(F"Rn/:-pQB$;No?+B3#gF!,(/Ch4`'F!,UHARlp*
D]j+4F<D]JBOr;/A7]@]F_l.B+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQUFCAWpAKW+0DBO%7
AKYhuF*(u6+D,>(AM,*,BOu'(+CQB8DIn#7A8,OqBl@ltEd8dAF!+t5ART[lA.8l@67sC&BOr;/
E+*cqD.Rg#EcW?GBl5&8BOr;/D..L-ATAo*Bl%?'@<,p%F`V,)+EVNEF)Y]#BkDW5+EV:.%15is
/g,+AEa`frFCfK6+D,P4+CQC3@<-I(@s)TrEZen,@ruF'DIIR2/g+,,AKW+=ATD6&-tI:<ATT@D
@ps6a$;No?+C\n)+<YfJARlo+FDi9E+Dl%-BkDW5+E1b0@;TRtATAn9F(KH8Bl7R)+<Ve@DBL&E
Bl7HqG%kK0@;HA[:-pQUA8,OqBl@ltEbT*+/g)92@<6O%EZcK:Bl%?'E+*cqD.Rg#EcW@5@;[3+
DJXS@@V$ZlBOPdkARlomGmt*U67sBlA8-."DJ()6BPDN1Anc'm+CT.u+ED%'Eb/[$Bl7Q+FD,5.
D..L-ATAo*Bl%?5%15is/e&._67sB[BOr<'@<6O%EZet.Ch4`!@;[2sAKZ#)@rc-hFCeu*GA2/4
+EV:.+CehrCcW"4:-pQB$;No?+CfG'@<?'t@<6Nt@;9^k?Q_s85uU`O;I<jIDe*2a$;No?%15is
/g+4];GKeY7lhc$Cht59BOr;/E+*cqD.Rg#EcW@5F`MM6DKK]?+Dbb5FCeu*@<,p%Eb065Bl[cq
+C]U*$;No?+EV:.+A,Et+EMgLFCf;A+A$/fH#IgJEb0*+G%De)DL!@CAfu2/ASiP^:IH=LBl%T.
@rc"!BJ(E1DflKr:-pQU@ps6t+ELt'AScW7@:Wmk@:Wn_FD5Z2@;I'*@<,dnATVL(F!+q7F<D]O
Dfm0F@ps7mDfd+C@:j(eGmt*U67sC$ASl@/AKYK*EcP`/F<GO2Ea`frFCfK6/e&-s$;Efb<(0\]
5uLEU4ZX]>+?CW!%13OO:-pQU<+ohcAoD^,@<<W1Afu2/BlbD9@<,dnATVL(+D,>(AKY].3XlEk
67sB'+<VeADIIBn+?L\oFEqh:.3N/4F(96)E-,f4DBM"`G%#30AISuA67sAi$;No?+<VdL+DPe&
D.Oi(F!+m6G%#3$A0=JeDIIBn%15is/g)8Z+<W(SH#R=D+Co&)@rc:&FD5Z2+CoD#F_t]-FE8RH
BOr<*@<,dnATVL(+>"^XH#R=;BlbD;AT;j,Eb/bj$;No?+<VdL+<VdLDf0B:+=JaSDKKH&ATB4B
BlbD,F`MM6DKK]?+D#e/@s)m)A0>f4BOu3,FEqh:F!,[@ChsOf:-pQU+<VdL+<Ve9AKYr#F)to'
+CT=6@q]:k@:OCjEZf14F*)IG.!&s2+CoG5@:F%a.4u&::-pQU+<VdLG%#30AKY].+CT.1AU%cr
F`_&$Ch4_]+D#e:Eb0<5Bl@l3FD,*)+E2@>A9DBnF!+m6G%#30AIStU$:.TX8P(m!+<VdL4!5q%
Bl8$(B4Z*4+EqL1DBLYVF`V+:@<5pmBfIsmBl5&(F_u)=+=JodDfQsT.3K`U+<VdL+<VdL+?L]#
+<V+#6VgN]7R9C@:Jr;s+=JaSDKKH&ATB4B@rH4'Df0-(FE8R7DfBE%A0>T(+E)./+Dbt7E$0+.
F)rHH-o!i04>J`I.3K`U4!6730F\@W:IA,V78?fM8OHH"4!5q%Bl8$(B4Z*4+EqL1DBLYVA8,Oq
Bl@ltEd8d<De!p,ASuT4BlbD9F`\`S0Hb:S+>G;f+<Vdg+>F<46r-0M9gqfV=%PeZ80Bu:-nB"L
FCf)rE[`,TBk2=!+E(j7C3=T>BkD'jA0>E$@s)X"DKI"CAU&;>+=K!!4F'%E2)Qg*4!6F9%15L'
9i+;F6W?iZ+?L\o.qrmCAS5Rp.3NP<C1UmsF!,"9D/a&s+DG^9Df0,/Ci=62+E1b1F!)kc4F'%E
1b^@$+<VdL+<W`g2)#IH7n$BH5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,L7FE2),G%G2,Bl5&3
DIjr,Df9S;E+*g/+=Jru4F'%E0Jka<+<VdL4!6:90F\@c<E)FR6W?iZ+<W`g-nB"LFCf)rE[`,T
DfTB0+EMXCEb/c(Bl5&3DIjr,Df9S;E+*g/+<W'e0KaVC1,(OE.3K`U+<Vdg+>GQ(%16!%<'a)N
5t=?d+?L\o.qrmCAS5Rp.3NhJASrVF+EV=7ATMs%D/aP=@<,p%F('6'A0>T(+CoV3E-!-M0Hb:S
+>G;f+<W`g0b"I!$;No?+Au!2<(9YW6q'urBlbD.D/aTB+C]U=A7]@]F_l.P+A$/fBlkJ3F!,O8
F<G[D+CQB@C2dU'BIP&r+Cf>-Anbn#Eb/c(%15is/g+bECh.*t+Au!2<(9YW6q'urDg#]4EbT&q
F!,"-@ruF'DIIR2+Dbt+@<?4%DK?q4DfQsKD/=8B+D58'ATD4$ARlp)@rc:&FE8Q6$;sYq<(9YW
6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7-uEdA.3N\AEbTK7F!,RC+A*bgDerrqEZdFd%13OO
:-pQUFEqh>@ps0rDJsE(D/aTB+EM+9FD5W*%15is/g+%f:K0eZ9LM<I+?L\o@q]:k@:OCjE[`,O
ARoLqARfh'+=M)CF"&5Q@rc:&FE8RHD]hXpAoDKrATAnT+F\HSATBG=De*m,Dfd*2$4R>;67sBH
DL!@5A7T7^+E1b0@;TRtATDi7@<,p%F*)>@ARlotDBO%7AKYhuF*(u6+D,>(AKZ21ASqqa:-pQU
@rc-hFCeu*@;]TuA8-+,EbT!*FCeu*FDi9o:IH=9Bl[cpFDl2F+E(_(ARfh'/g)8G$4R>;67sB^
5uLHL:.I>fGA(Q*+Co%qBl7X&B-9ehAU&07ATMp,Df0V=@V$Zl@<,pkF_i1/@W-C2+EV:.+?L]U
BOPpi@ru:&+:SZQ67sC&BOr;Y:IH=8De*E%-tI:=@:F%a.3N_G@<<W2@<-F#F!,R<BlbD<FE2)5
B-:o0+EDU8Bl.F!FCB38/e&-s$;No?+@Aq$=].g]85p]n+=L`5@<,ddFCfJA+?L]3Cht57BkM+$
F!,L7F(KB8ARl5W:-pQU9j(:Y;F+#G<(0\-4!5q%Bl8$(B4Z*4+EV:.+CT//G@be;4!6@8%14Nn
$4R>Z@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums
+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP.41,U1++Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1
%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3h
BkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-
De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3
/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8A7Kak
AM.q>B+52_De*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm
@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARl
De*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z
-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^
+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7Wj
FDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)
%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe
$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G
6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSek
Df-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,
@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%
ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[
8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>
+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)
FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])
AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#
+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ#+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Ado(r%16r\DJ<]o
F*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<n
De!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"
DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+
@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eqCh.6tB1brf
6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1
F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'
6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5%17&bAn5gi
03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$/oY?5
%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$
F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4
@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;
Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONg
FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,
Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%
@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/
B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>U
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8
B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^
$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP.41,U1+
+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*
Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gk
C2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9
;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!
%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!
-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh
/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pq
Ci=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3
AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1r
FD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#
E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s
$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'
DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe
$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1
BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-
AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'
6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h
@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!
DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y
:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%14Nn$3                                                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ZR;+>P&o2'=Y6+>PVn1G^./1E\G-+>GSn2E)a50H`,1+?1K!3?U%2+>Pr"0f^@42]sh6+>YlI
:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X8PDNC8Q/Sa
;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<rY:IJQ.@WQ+$G%G2kATDg0EcYT0G][D;
B-;#/B-:W#A0>o(F)Z&8F(KDl:IIuc8l%i^D.I^+F`Lu'+D,P4+D>k=E-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r./^:IHgPA8#[uFDl2FC2[WqASu("@;IT3De'tB
+Cf(nDJ*N'BPDO0DfU,<De*fqEc#l.AS,@nCige1Bk)7!Df0!(Gp%'7Ea`frFCfK6D..<rAn?%*
C2[X%@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU/@:O._DBNe)
DJ<]oF*&O:DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AT2'fD..<)D..<rAn?%*
+D,P4+A,Et;bpCk6U`,+A7TUr                                                 ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
1E\P#-p0UR/mg=U-QkfR9M%rM<$4bY8l%ihDKKH1Amo1\+A$lO:IK;CDesJ;8U=!)7!3TcDKKH1
Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)C3FJ;De'u0F`_8;-RgSp4>8$7.4cl00I/>$/1<V7,VUYu
-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,7:IJQ.@WQ+$G%G2k
ATDg0EcYT0G]Y'-:IIuc8l%i^D.Fc&BleB7Ed;D<A0>W*A8kstD0$h:@;]dkATMs.De'u-@;]dk
ATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$>,Vh&/1GCR>2_I!F2E3QS0fCmF
+>PW+1GCR<2(g^C0fLpJ2E<ZT+>PW+1GCR<2(g^C0fLpJ2E<ZT+>PW+1GCR<2(g^C0fLpJ2E<ZT
+>PW+1GCR<2(g^C0fLsE0f^sD+>PW+1GCR<2(g^C0fLpK1GU^E+>PW+1GCR>2_HsB2`WfP1,V!5
1,(I>0JbCA/iGLB1,:^I1,h!31,(I>0JYCC/i5:A1,UmK1GU^.1,(I>0JYCB/iGOE3&N]N2Dm95
1,(I>0JbCA/iGLC0Jt^E0f:a01,(I>0JbCA/iGLC0Jt^E0f:a01,(I>0JbCA/iGLC0Jt^E0f:a0
1,(I>0JbCA/iGLC0JtgG1,1L+1,(I>0JbCA/iGLC0Jt^H2`<T;1,(I>0JYCB/i>@B3B&]K2)cX5
0JYF<1GCa?2D[0F1,V'I2_uR30JYF<1,:gA1bgpE2)I<L1,::0-p01/0I\P$4>8$7.4cl00I/>$
/1<V9+?:]&0JYF<1,(R<1c7!H2)-dE2E;m80JYF<1,(R<1c7!H2).$L1Gp:10JYF<1GCX<2D[3H
0JtO?2)ud70JYF<1,:X<2)@!G1c7-E3&Vm70JYF<1,:d@2Dm<H1GCRC3$9t11,CU?0JkC?1bpjE
2D@-M2]sk01,CU>0JtI>2).$H2`NcQ0d&5*1,CU>0JtI>2).$H3&*3I1a"P-1,CU>0JtI>2).$H
3&!6J2]sk01,CU?0K1UB1GpjD3&*EM1a"P-1,CU?0K1UB1GpjD3&iTP0d&5*1,CU?0JkC?1GpsB
2)$gD3?U(21,CU?0JkC?3&WWK3B/oO1*A>+1,CU?0JkC?1c@3N2*!EM1a"P-1,CU?0JkC?1bpjE
2D@-M2]sk01,CU?0K1UB1GpjD2)RBJ1a"P-1,CU?0K1UB1GpjD2)dHP2]sk01,CU?0K1UB1GpjD
2)RBJ1ast(4>838-p014/1<V7.4cl00I\P80E                                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
