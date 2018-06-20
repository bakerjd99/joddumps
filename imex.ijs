NB. JOD dictionary dump: 20 Jun 2018 14:27:26
NB. Generated with JOD version; 0.9.996 - dev; 20; 19 Jun 2018 10:38:50
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
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


JSON=:31

PYTHON=:29

SQL=:30

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


insqltd=:4 : 0

NB.*insqltd v-- insert table array into sqlite table.
NB.
NB. dyad:  iaRc =. baObj insqltd (clSqlTable ;< btclData)
NB.
NB.   db=. sqlopen_psqlite_ jpath '~temp\dntest.db'
NB.   dat=. readtd2 'C:\Users\john2000\j64-807-user\temp\dn_dv.txt'
NB.   db insqltd 'dntest';<dat

'tab dat'=. y
st=. sqltables__x ''
'missing database table' assert st e.~ <tab
cl=. sqlcols__x tab
'missing table column(s)' assert cl e.~ 0{dat
sqlinsert__x tab;(0{dat);< <"1 |: }.dat
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*ALu1H&rbF)c#<A8,q&ATDl8FCAWpAKYE%Eaa59Bl8$2+EMO=Blmo/FCAWpAH~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<(<''jod''),<0$a:'
zz=:16{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&q+>Y`32JR/@:-pQU.V`m4+CcuT+DkP$DBMPI6m-#S@ruF'DIIR2+Cf4rF)rrC$;No?
%15is/g*GrC`mY<BOu3,A8,OqBl@ltEd8d;CghC+ATJu&Eb-A)G][M7F(oQ1F!,C5+EV:.+Co1r
FD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig+CT)&+E_a:+EMX5DId0rA0>B#DKBo.DKKqB@;]TuG%G]'
F!,")Anc-oA0>T(+EV:2F!+t/@<6KB%15is/e&._67sBJEb/[$Bl7Q+@3A0<6m-DWC1Ums+Co%q
Bl7L'+CQB@BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?+@Kd^FE2;FBl7Q+@3A0<6m-DWC1Ums
+D#S%F(KD8FD,5.-u!F7A18X;De!3lAKY])FCfK)@:Nk$%15is/e&._67sBJDf0Z*Bl7uQ+Co1r
FD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<@;^1./0JYEFCfK)@:NjkG%G]'Et&IO67r]S:-pQU8T&W]
Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$@:F%a+C]U=BkhQs+Dbt+@;KL(%15is/g)8Z@V97o+<VdL
:.\/V3Zr'HF<GL2C1UmsF!,(8Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+F!(o!:-pQU+<Y-2C`jiC
+<XEN9i*kn@UWb^F`8I@@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;AS`J3+<Ve;ASbq"
AKZ28Eb'5B+EV19FE8uUB6%p5E-!QQD.-ppDf[HPATT&)ATVL(@1<Q=67sB'+Co1s+<VdL+Co1r
FD5Z2@<-W9Bk1dmFD5?$@psInDf-!k:-pQU+<Y34C`jiC+<Y3/@ruF'DIIR2+DtV)AKYf'F*)IG
Ao_g,+E1b2FCfK1Et&IO67sB'+CoG4ATT%;+EM+9F!,"-@ruF'DIIR2+E1b0@;TRtATDi$$;No?
+<Ve>A7]_$+<VeCBleA=B6%p5E$/S,A0>r9Blmo/A7]^kDId<rFE7lu:-pQU+<Y<.F<D\K+<Y<.
F<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)ATVL(@3B0&Df$V-Bk)7!Df0!(Gmt*U67sB'+D5M/
@WNY7+EqaEA0>;uA0>u*F*&O;Ci<ckC`mV(D.Oi1AS,LoASu!hEt&IO67sB'+D5_6+<VdL+CfG'
@<?''@;]TuEHPi5Gp$a?Dfp#?+CT.u+EM[>FCfM&$;No?+<VeD@;BEs+<Ve>ASu("@<?''8g&1b
EbTK7F!+n/A0>DkFCAWeF(HJ)F_u)=%15is/g)8ZD/O/4+<VdL:.\/V3Zr9JDL!@8Bk)7!Df0!(
Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<YQ5G@Vg=+<Y07ART[l+Dtb7+Co1rFD5Z2
@<-W&$;No?+<VeFA0<!;+<VeFE+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8ZE+*6l
A0<!;E+*6l+Co1rFD5Z2@<-'nEt&IO67sB'+E2IF+<VdL+E2IF+EqaEA90:EFCfN8F"AGN@:O=r
F"AGFF<G()FCfK$+DG_8D]iS)@ruF'DIIR2%15is/g)8ZEb/lo+<VdLEb/ltF*(u606M/QAS5^u
FCfJ8@3B)p@ruF'DIIR2%15is/g)8ZEb0<6A0<!;Eb0<6DfTD3CghC,+C\bhCNXS=@rc-hFCeu*
@X0(EE+*6lA17rp:-pQU+<Y]LF!)SJ+<XEN9i*knEb/m+Cgh?,AU&07ATMp,Df-\=ARTUhBFP;D
67sB'+E_a:F!)SJ+EqaEA9/l9F(Jl)@X0)?DfTB0+CT.u+EV19FE7lu:-pQB$;No?+AQisATKmA
$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IH=:EcQ)=F!*.j0J+t83@PCE%16T`@r,RpF!)SQ@;9^k
-OgDmDeX*1ATDl8-Y[=6A1%fnEb065Bl[c--Yd7-Ch7Z1Eb/lpGT_*:F)*-4$4R>;67s`uAT23u
A7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$Bl5&8BPDN1F(Jj'Bl@l3BOQ'q+ED%0@<?'k+Co%qBl7X,
Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh@j$(?Ci<flCh4`,Dfor=+EM+9+CoV8Bl7Q+8g&(nDe<^"
AKYf-@:X(iB+52C67sB/.OdMA+A#%(8PUC.:-hTC+A#$o:K%]0%15is/g+tEDIjr&AS#C'+Cei#
EbSrpAKZ#)FEMVA/0K%C@N])sA0>]&DIjr%DIdet$;<oP3\`=8@4hur6W-'.0f+/b/e&.e5sd^q
3I>0e%15I#9L_0+6W,I/7L]\6$;No?+DkOsEc3(A@rc:&F<GL@FD5Z2+Cf>#ATJtG+EVNE@:Wmk
D/XH++CSek+CQC1ATo88@VTIaF<G(3A7Z2W:-pQU@;]TuD/Ws!ApGM@BOr;uDes6.GA1r-+Co%q
Bl7X,Bl@l3De:+d5snOG<*<$d%15^+6W-KP<'<8t0b"I`5u^9T4ZY>R%15X*9h[]21,B@H=A;IP
3\iN$$<0Gr<'<8t2%9mZ=]@gQ3\iT&$;Efa912QW:-CWn2[p*o<(8i13\iZ($;al)85DuD3\i])
$<'eq4ZYAQ%15^+:JO&61GK=G%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R";Fs\a
/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hu:g$ag:JNH>;+rN5;bp-t$;EfR
;GU7p:dmN.8lJ)T8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q;qq=]@pf
:+T=@9Ire7:JM?+%15is/g,(AC1Ums+Cf>#ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O
;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\
5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF
8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdi
DdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@
AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhsCh[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%
FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([
<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#
;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBl
G][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\
3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is
/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2
F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A
%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dE
C2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=rA93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3
$4R>;67sa!DId9hE+NotASuU2%13                                              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql#[:JN$/=]@pf:*<J49H\%eF)c#<A1&fW-p01/0I\P$4=iTBC2[W1.4cl0
0I/>$/1<V7,VUYu-p0=/1*eV/0fUjF0f^jC1cREP1,1IB+>Y,q0JPO@2DQs=2)[BO0fV0N3?U%!
1,(FB0K(XG/i5CE2`<EG0K:12+>PW*3&!6G0J54C1GgsJ1cZ[5.4cl00I/>$/1<V90JPO@2DI3E
1c.*M1GgjB2(N#h0JPO@2DI-C1c.*M1GgjB2(E;m0d&5#/1<V7,VUYu-p01/0I\P$4>A99-p014
/1<V8.4cl00I\P80E                                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
