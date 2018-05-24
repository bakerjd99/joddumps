NB. JOD dictionary dump: 24 May 2018 15:22:31
NB. Generated with JOD version; 0.9.994; 7; 24 May 2018 09:09:20
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-16T14:58:11
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


namecats=:4 : 0

NB.*namecats v-- extracts and classifies names in J code.
NB.
NB. dyad:  pa namecats ctJcode
NB.
NB. name classifications
NB.   global           global reference or assignment
NB.   local            local reference of assignment
NB.   declared global  names marked with global comment tag (*)=:
NB.   declared local   names marked with local command tag (*)=.
NB.   override mixed   allow mixed assignments (<:)=:
NB.   for. local       implicit for. locals
NB.
NB.  0 namecats jcr 'wordname' NB. only globals
NB.  1 namecats jcr 'wordname' NB. full classification

if. badrc parsed=. parsecode y do.
  parsed  NB. parse error
else.
  'dgbls dlocs parsed'=. }. parsed

  NB. handle quoted assignments and implicit for. locals
  'mgbls mlocs flocs'=. extscopes parsed

  NB. declarations override other scopes
  mgbls=. mgbls -. dlocs [ mlocs=. mlocs -. dgbls
  gbls=. dgbls,mgbls [ locs=. dlocs,mlocs

  NB. pick out assignments
  parsed=. parsed -. ;:')'
  uv0=. parsed #~ 1|.parsed = <'=.'
  uv1=. parsed #~ 1|.parsed = <'=:'

  NB. forbid names from being both local and global
  uv1=. uv0 -. uv0 -. uv1
  
  NB. errmsg: mixed scopes
  if. 0 < #uv1 do. 
    NB. check for mixed assignment override
    if. -.MIXEDOVER +./@E. ,y do. (jderr ERR0159),uv1 return. end.
  end.

  uv1=. parsed -. uv0
  gbls=. gbls , (jnfrblcl uv1) -. locs,JARGS

  if. x do.
    NB. complete name classification
    locs=. locs,jnfrblcl uv0
    uv1=. (<gbls),(<locs),(<dgbls),(<dlocs),<flocs
    ok <GLOBCATS ,. (/:~)@:~. &.> uv1
  else.
    NB. return only unique sorted globals
    ok /:~ ~. gbls
  end.
end.
)

testenvironment=:3 : 0

NB.*testenvironment v-- sets up the (ijod) locale for running test cases.
NB.
NB. monad:  testenvironment (clTest ; clSystemname ; paYammer)
NB.
NB.   testenvironment 'bad';'JOD'    NB. yammer is off (default)
NB.   testenvironment 'bad';'JOD';1  NB. yammer is on

'type system yammer'=. 3 {. y , <0

NB. control display of (testpass) !(*)=. TESTYAMMER_ijod_
TESTYAMMER_ijod_=: yammer

NB. record any open dictionaries and close 
NB. require 'jod' !(*)=. did od OPENJODDICTIONARIES_ijod_
OPENJODDICTIONARIES_ijod_=: }. did 0
3 od ''

NB. display or pass !(*)=. testpass
testpass_ijod_=: ]`showpass@.(TESTYAMMER-:1)

NB. test utils !(*)=. err er ner
er_ijod_=: err@:testpass  NB. expected result
ner_ijod_=: -.@:er        NB. negative expected result

select. type
case. 'bad' do.
  err_ijod_=: [: -. 1: -: [: > {.
  1
case. 'good' do.
  err_ijod_=: 1: -: [: > {.
  1
case.do.
  0 [ showpass 'TEST ENVIRONMENT SETUP ERROR'
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1".+>P'!+>Z##0f:(13,W/AARf.jF(KT<Ea`I"F!+n/A0>Au@<6L(Anbgt+DtV)ATJu.DBMOo
@rGmhFCfN8ASu[*Ec5i4ASuU2ATVu9F`8IFBOr;7BkhQs.3NGF@ps1b+D,P4+EDUBDJ=!$+EV19
F<G(%F(KC                                                                 ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.1+>P&o3?U(33Ar!72'=V-1c$7/1a"M00eje1+?25<B5DKqF&QpoCLoeQF(o9)0JG1U67sa#
Ci<d(;f-GgAO1BYBkM<;0JFUl+ET1e+<Ve@DIdI%ARfg)+CT>4BkM=#ASuT4+E(j7+<Y<5Ddm-k
%15is/g,:SEHQ2AARlp$@;TQuCh[s4+Du+?DK@E>$;No?%15is/g*T'Ec5t@A8-*pDg#]4ARloo
F`M26B-;><AKYo'+A,Et+E)-?0KC7O@rrhK0JPF-0etdI1cdHJ%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?De!lC3=Q<j67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB82f2uK0esk`
Bl7?qCj@.8Bm:bBBPDN1DKTZ7@;]Rd%15is/g)l-D..]E2'?=<A0>f6ATDg*A7Zm*@:p]2?90Mu
3XlEk67sB83,N)L1,C%_BOPdkAKYo7ATDg*A7Zm*@:p^)D]gGj3[m3Q+>"^WAS!!%Dfoq?9hAGU
6r-iP;@NsB$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4
<$5+=5uL[1/I`$r$;No?+Du*?D/"6+A0><%F(o9)D.RU,Et&InBm=3"8T&'QEb/a&6$%*]B5UL\
0KhHR+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@r$?Q/g)NfDfp//;g2Y_?RH9i-t[U>
@jsQ%+Bos=+>=of+C,E`@6H4c3"64(4ZX]D2DuZe$7QDk%15is/g,%M+Dkh;ARlolF)u&.DJ`s&
FE8R5DIal1ARoq$A79@t+E1b0ASuU'ATMF(%16rdG\(DWDIdI%ARfgJF)u&.DGP%&4ZYDB3Zp*c
$7I;sATVU(A3k6KF_t]-FE8l[4Y@j2%16]iDI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL
.j-Mg.Ni"+$7I;N-t7=8Cage^.6T^7-Y%(=@W-N>%14Nn$4R>;67sBtBm=3"+CT>4BkM=#ASuU2
+=LiEDIY+<BlbD>F(Jl)@W-@%+Dbt+@;Kb*+CT.u+D5M/@UX(hGmt*tBm=3"8T&'QEb/a&6$%*]
B5U.YEc5tP4ZYDB3Zp*c$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn
$4R>;67sC&BOu3q+CT;%+Dkh;ARlolF)u&.DJ`s&FE8R6ARf.kF(HIBAp&!$.3NM:D.O.`:-pQU
BlbD+DffY8Ci<flCi"A>@;]TuB5DKq@;Kb*+CT>4BkM<pA0>u-BlbD2F!,C:%15is/g+kG+A*bc
F`\aICi=93Gp%!5D.Oi4F(HJ&F!,('EZee3+A,Et+DGm>@rH6pATD["A.8l_Bm=3"8T&'QEb/a&
6$%*]B5U.YEc5tQ4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$4Y@j)H>dqJ?W2/W
B4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15mSATDg*A7\>MA8-'q@rt"XF(o9)0g.QS+?CW!
%15is/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$7JV[FD,T'6#pU\D.RU,F"'7)
+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15is/g+eCDdmc1
Ci=6-F!,(5EZfREEb$;9@;L'tF!,17+C\c#AKYf-@ps1b+:SZQ67sBiGp$X/AmoguF<GC<DegJ0
DBO%4F*&O@De!3lAKYT'EZfI;BlbD=ATMr&$4R>;67sC$ATW'8DK?q1DfTl0@rri6ATN!1F:ARg
EZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9):MVXk5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/@WNY>
D/"6+A4^ZLBl[cpF?sthBkM<ZCG9*]5s]R/DeioE3B:Fo%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cp
F?sthBkM<ZCGB0^5s]R/DeioE3B:Fo%16Ze+>GSnB5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\
0jd446$$m]CLoLd3F=-C$4R>;67sBkATVKnF<GF7G\(D.Bl7HqEb/a&+CT>4BkM=#ASuT4DIIBn
+E_a:%16uaEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE\Lid5s]R/DeioE3B:Fo%16ua
EZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE\Uoe5s]R/DeioE3B:Fo%13OO:-pQUDg#]4
EbT&q+Dkh;ARlolF)u&.DJ`s&FE7luATAo+Ci<d(+=Bs.ATDg*A7\>MA8-'q@rt"XF(o9)0jd44
6$$m]CLoLd3F=-C$>"6#0eje`Ci<d(+=Bs.ATDg*A7\>MA8-'q@rt"XF(o9)0jd446$$m]CLoLd
3F=-C$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GZCi<d(;f-GgAOLHH0JH6g/h1LMDdmcdD/X3$
6uQQh0HbHh/KcHSCi<d(.3N/>@s)X"DKI"5Ea`TtASuT4FCfN8/g(T1:-pQB$;No?+B2onFCeu*
D..NtEbSru+E(b"F`MOGBl5&.De(J>A7dG:8T&TlEb-A-F<GdGEbf_K%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FBD..]F1^sde67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2
?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>ZBm=3"
@<6L(B5VQtDKJ$&+>Y-$+>=63:-pQU8K_\TG%De)+Dkh;ARlorCi<ckC`m/(A0>],@ps0r@<6L(
B5VQtDKIKR<HE:kCi"AJ+EV:2F!,1<%15is/g,+ODfQt<@;TQu@q]dp@q?clF`\aJBOu3q+CT;%
+D5V2A0>o(@<6@)F!,(5EZfFG@qZunF)u&.DJ`s&FE9&D$>s9hATL!e+?MV3G@_n*Eb-A+DeX*%
+EVNE@V$ZpCi<ckCi^s5$7Ke#D.Rc;4ZX]J-Y$t$DId="FD5W(+D5M/@UX(#%14Nn$4R>PDf000
F(oN)4ZX]A+?CW!%15is/g+S=Ci=M?D/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%17/dDfB9(ATMoU
/g*8(@qg!kF(9--Bl7QjBldX&DdRX)?[$F(AL@oo.!&m:E+NisF)rcn3ZrKRDfB9(ATMo%$7QDk
%15is/g,"FG\(D.@<6L(B5VQtDKI"CEbT0!ATDi7ATDg0EX`@nATAo+Ci<d(+=D#?G\(DoF)u&.
DJ`s&FC.="6$$m]CLoLd3F=-C$4R>;67sC!G%G]7Bk1ctFCAf)@;KauGB4mDBm=3"+CT>4BkM=#
ASuU2%16Ze+D5M/@WNY>@rH6sF`V87B4!qj6$$m]CLoLd3F=-C$4R=O$;No?+>%q>78m/.;cQ1P
78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
F)>i2AN;b2?YjXhA5d>`CLqU!F*'*267sa(Ddd0TD/X3$FCfN80H_K[/M/(fCi<`m+CQC6D..6s
+Cf>+Ch7*uBl@l3De:,1@VTIaFE8QIBl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#g
F!,R9F*&OG@rc:&F<G:=+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%FD,6++EV19F<GX7EbTK7F"Rn/
:-pQU8TZ(rBQ&$0A0>c.F<D]7Cij6/+<Yc>AKW+9F`))2DJ().De!3lAKYYtDI[6#BlkI?Cgggh
F!,R<AISuA67sC'F*1o-+EV19F<GX9FEMOF@;]TuFCem$+CoD7DCuA*:-pQB$;No?+CT>4F_t]2
3XlEk67r]S:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPFnF_<Bd%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$p[
A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%159QHZ*F;
-Zip@FD>`)0JFjs>9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$:7Na9L2WR
9e\^k+>=636;LBN5u^WS0g.Q?0b"IV:JXYX8Q/SO3ZpX>+>GQ(,;K]86;LBN<'`iE76N[S5;"'9
+>GYp,TniO$4R>6:/jMY:JEN+3Zp-d$;!ul<'`iE76N[S5;"'9+>Y8t0JEqC%15Qu:I.rR8Q/SO
3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>083p-I8Q/SO3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPe
A8`T7BOQ!*8K_P^-OgCl$<()%<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*
F<G:=+D,>*AL@oo%15Et=Ar1!7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^.4dS[=\Vj]64F82
$;No?+EMXCEb-A0De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgDsAhG2NDJWZG5s]R/
DeioE3B:FhBeD4bA8a(0$6UHT0RG055s]R/DeioE3B8H0E-67FDJWZG5s]R/DeioE3B:FhBeD4O
$>"$pASGa/+<tc?+DEGb+CoCC%144#4tq>&F`\aDC`mFE1^se'Cia0%AhG3:D_;J++<W?\+:SZh
DIb@/$7QDk%15is/g+RFFCfN8%159QHSHX^F`\`RF)>i2AM@(pF*')`4!ua*4WlI%:-pQUFCfN8
+EM%5BlJ/A%13OO:-pQU@3B/nG9CO=Dfp#?%159QHY7A<+=CW:DesK3Deio<-T`G43[[6i:J=&R
:JEMc6;LBN5u^WS0d&eY:J=_R6;0fq%159QHY7A<+=Cl@FE;;;CLo1I4!6UG-V7'45u^WS0H`q^
<)c.M9LU<<$4R>;67sC%Df'&.D.-ppDfZ?p4tq=?+E2IF+=D5IDeio<9jqOPD_NP#1,1j<BeCM`
1FEV=4tq=?+E2IF+=D5IDeio<9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8+E(b"F`;UK
F)YPtAM,)s+CT+0@3BB#@V'RgC`t/8$4R>;67sBsARTan+Co1rFD5Z2@<-W9DfB9*%172gF*)JF
F^e*4/h23s<.96<F=f'eFCfN8+=MSc<.96E+EMXI@P/!_67rU?67sB[BPDN1FCfN8+>,9!/hS8Y
DfT]'FED))+EV1>F:(c0/db??/g+SDF*2>2F#jY'67rU?67sB'+AP6U+EM+9+DQ%:CERG3@ps1b
+DtV)AKZ)5+EV19F<G[NE+KAO67sB'+=Ag.5s]U5@<6*B3B8`Y5s]R/DeioE3B8H0DKI!KDIn$6
ATMr@$;No?$;No?+<Vd].3N5:EcZ=FFCfN8+CT>4F_u)>Bl@kr:-pQU+<WEg+EM+(Df0).FCfN8
+CT>4F_u)>Bl@kr:-pQU+<VdL+<VdL+<W9h/hRK+67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EXGQ./g+YEART[lA3(i[IRJX5$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OOm*EHPu9AKW@8De*s$
F*(u6-OL2U67sC&ATMr9Bl5&'Ch7$q+C\c#AKY]!+EV:2F!,(2@:p]sF!,FBATMF#F:(c0/g*b^
6pjX:5uLKO?YO7nA7#[=67sBjCh7$q+=AND$;No?+EV19F<G:8+EV13E,Tc*Ed8dBF`(t;Ci<fl
Ch4_@+Du+>+CT)&+A,Et$;No?+EV19FE8R7@;[2sAKYr'Eb961D.R6#Bl5&.F`(t;Ci<flCh7Z1
F)Po,+Dl7BF<GUHDBNY2+C\c#AI;pc@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&$;No?+>%q>78m/.;cH%\<.->*$?Tfm@rsjp+=D8BF*)/8A2#\b$47+I
:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.sDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,                                                 ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^73+>P&o3?U19+>G_r1GBq+1a"Y1+?1Ju2eQrF@WPIbDeioMF)u&.DD3auBl7HqEb/a&+CT>4
BkM=#ASuT4De:,)Ci<ckC`mk<EHQ2AARlp$@;TQuCh[s4+Du+?DKBH,DdmcdD/X3$6uQQh0IURM
Ddmc:+CoD#F_t]-F<G19@:sFgDKI"CATMs0Ddd0TD/X3$FCfN80PkZ9A0>;'F)>?%C`m5+Ci!Zm
FD5Z2+E(j7DdmHm@ruc7Bl8$2+=M>CF*)/8A2#\dFCfN8F*)P6FCfN8+=MSc<.96E+EMXI@K  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 grplitBasic01 putNameTimestampsBasic00 restdBasic01''),<<;._1'
zz=:zz,' '' jodsmoketests compjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 ed'
zz=:zz,'Smoke00 globsSmokeAssign000 globsSmokeDoc00 grpSmoke00''            '
zz=:256{.zz
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
0f:(/+>P&o1E\M4+>GYp2)8obA7AtgBk)6rF*)J4@<6-m+EV19FE8QV+EMC.Cht59D]in.A8-1'
+EM%$Ch4`2ATMr9@psFiF)#W(F)>i2ATVL)FE;M?Deio,FCfN8F!*%WF)>?%C`mh2F*&O7@<6"$
+Cf(r@r#drB-:]&Eb-A;DfTB0$46                                              ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Qm;8D.R3cFE8RHATMs)DK]`7Df0E'DKI6T/1<VC4"akp+=A:ECi<d(;f-Gg
AO1BYBkM<;0JFV^Ci<d(;f-GgAOLHH0JFVcDdd0TD/X3$FCfN80HbIKF*)JFF^c^I/1<V7,VUYu
-p0UR/mg=U-Qm/BA7AtgBk)6rF*)IGC2[X(D/X3$FCfN8F!iCf-p01/0I\P$4>J$7,Vh&.3&!3F
1bLRC3&EQQ0JYO/1,(FB0JtUB/i5@>2)%$J1H6L40JPO@2)7!@1H.9M2`EEG2BXb/0fUjE1,LU?
1bgmF0JPF6/1<V9+>b?!0JPO@2)7!@1c$sE1,:OB+>PW*3&!3F1bLX?2)7$E2E*B61,(FB0JtUB
/i>I>3AE?J0JXb+0JPO@2)7!@1H.-I2)R3M2'=Y.0fUjE1,LU?1H70J2)I*K+>PW*3&!3F1bLX?
2)7$E2E*B61,(FB0JtUB/i>XK1b^pM2)HF20JPO@2)7!@1H.6K3B/oQ1+=b&4>8$7.4cl01*A=t
1,(FB0JtUB/i>F?3ArWP1,U100JPO@2)7!@2).!C1c$j?0d&5*0fUjE1,LU@1GUsK1,q$H+>PW*
3&!3F1bLX?2D?sD0eb=2/1<V7,VUYu-p014/1<V7.4cl00I\P$4>8384>6                ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
