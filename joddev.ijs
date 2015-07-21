NB. JOD dictionary dump: 21 Jul 2015 16:23:04
NB. Generated with JOD version; 0.9.980; 11; 21 Jul 2015 11:13:31
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|232590103446231617475144735166094174823|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


IzJODinterface=:<;._1 ' bnl del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.980';68;'21 Jul 2015 11:13:31'

JODVMD=:'0.9.980';11;'21 Jul 2015 11:13:31'

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

TESTYAMMER=:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


compressj=:3 : 0

NB.*compressj v--  removes  all  white  space  from  J words  and
NB. shortens local names. This process reduces the readability of
NB. code and should only be applied to production code.
NB.
NB. monad:  cl =. compressj ct
NB.
NB.   compressj jcr 'verbname'
NB.
NB.   NB. call in object context
NB.   compressj__UT__JODobj jcr_ajod_ 'compressj_base_'

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. check for presence of obfuscation tag
if. o=. 1 e. OBFUSCATE E. ,y do.
  NB. local names less J arguments
  l=. ;(<1;1){m
  l=. l -. JARGS__MK
else.
  NB. local names less any single char names
  l=. ;(<1;1){m
  s=. l #~ 1 = #&> l
  l=. l -. s
end.

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

if. o do.
  NB. form obsfucated name replacements - drop trailing _ in (NAMEALPHA)
  bnr=. (<:#NAMEALPHA)&#.@((}:NAMEALPHA)&i.)^:_1
  r=. ' ' -.~ ,'/' ,"1  (>m) ,"1 '/' ,"1 OBFUSCPFX ,"1 bnr (#m)?OBFUSCCNT   
else.
  NB. form replacements from any remaining chars !(*)=. SHORTNAMES
  NB. J arguments m n x y u v are not on SHORTNAMES
  if. 0=#r=. SHORTNAMES -. ,&.> s do. u return. end.
  if. (#r) < #m do. 
    NB. we have more replacements than available SHORTNAMES
    NB. form base (#r) numbers using SHORTNAMES digits
    bnr=. (#r)&#.@((;r)&i.)^:_1
    r=. r,<"1(#r) }. bnr i. #m
  end.
  r=. ; '/' ,&.> m ,. (#m) {. r
end.

NB. replace tokens
r changetok u
)

getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)

lg=:3 : 0

NB.*lg v-- make and load JOD group.
NB.
NB. (lg) assembles and loads  JOD group  scripts. The monad loads
NB. without  the  postprocessor  and  the  dyad  loads  with  the
NB. postprocessor.
NB.
NB. monad:  lg clGroup
NB.
NB.   lg 'groupname'  NB. no postprocessor
NB.
NB. dyad:  uu lg clGroup
NB.
NB.   2 lg 'group'    NB. no postprocessor
NB.   lg~  'group'    NB. postprocessor

NB. (/:)=: obfuscate names
2 lg y
:
if. x-:2 do.
  NB. 2 _2 make assembles entire group script
  NB. with preamble regardless of where the
  NB. group appears on the JOD path
  msg=. OK00404 NB. okmsg: group loaded
  t=. 2 _2 make y
else.
  msg=. OK00405 NB. okmsg: group loaded with postprocessor
  t=. 2 mls y
end.
'r s'=. 2{.t
if. r do.
  curr=. 18!:5 ''   NB. current locale
  18!:4 <'base'     NB. run script from base
  try. 0!:0 s
  catchd.
    18!:4 curr      NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  18!:4 curr        NB. restore locale
  ok (y),msg
else.
  t
end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

rm=:3 : 0

NB.*rm v-- runs J macro scripts
NB.
NB. monad:  rm cl|blcl
NB. dyad:  pa rm cl|blcl

NB. (/:)=: obfuscate names
0 rm y
:
if. badrc uv=. MACRO get y do. uv return. end.
uv=. rv uv

if. *./um=. JSCRIPT = ; 1 {"1 uv do.

  scr=. ;({:"1 uv) ,&.> LF
  curr=. 18!:5 ''

  try.
    NB. run from base, (display default, suppress x.-:1) stop on errors
    18!:4 <'base'
    if. x-:1 do. 0!:100 scr else. 0!:101 scr end.
    18!:4 curr
  catchd.
    18!:4 curr  NB. restore locale
    (jderr ERR0256),<13!:12 '' return.
  end.

else.
  NB. errmsg: not J script(s)
  (jderr ERR0252),(-.um)#{."1 uv
end.
)

rtt=:3 : 0

NB.*rtt v-- runs J test scripts
NB.
NB. monad:  rtt cl|blcl
NB.
NB.   rtt 'runmytautology'
NB.   rtt ;: 'run these tautology tests in order'
NB.
NB. dyad:
NB.
NB.   0 rtt 'tautology'
NB.   1 rtt 'silenttautology'
NB.   2 rtt 'plaintest'
NB.   3 rtt 'suite'   NB. make and run tautology test suite
NB.   4 rtt 'suite'   NB. make suite and run silently

0 rtt y
:

NB. HARDCODE: option codes (/:)=: obfuscate names
if. (3-:x) +. 4-:x do. 
  if. badrc uv=. (SUITE,_2) make y do. uv return. end.
  scr=.rv uv
  x=. x-3 NB. run option
else. 
  if. badrc uv=. TEST get y do. uv return. end.
  uv=. rv uv
  scr=. ;({:"1 uv) ,&.> LF
end.

curr=. 18!:5 ''

NB. run from base, (display default, suppress x-:1), stop on errors
18!:4 <'base'
try.
  if. 0-:x     do. 0!:2 scr
  NB. Note: silent execution that fails suppresses all output
  elseif. 1-:x do. (] [ 1!:2&2) 0!:3 scr 
  elseif. 2-:x do. 0!:001 scr
  elseif.do.
    18!:4 curr
    jderr ERR001 return.
  end.
catchd.
  18!:4 curr
  (jderr ERR0256),<13!:12 '' return. 
end.

NB. back to original locale
18!:4 curr
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&Mg52'=Xs0f1"11*A;*+>Yer0fC.01E\D,+>Y_p2BXb1+?:Q#0d&J!2)ud>+>Ykt0ea_+1*AS"
2DH=/0H`2-+>P&p1E\Y"1H$@2+>PVn1E\D48U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\
+EqaEA9/kF+Dbt)A7]9oBl8$2+=Lr=De(:>Ci<flCh61a8l%isDf9H58l%iS:JXY_+=Lr=De(:>
Bl8$(Eb8`iAKZ28Eb'56+A$lO:IK>IBl8$(Eb8`iASQ-oF`_>6+DG_8ATDBk@q?d,DfTB08l%iS
:JXY_<_YtS:IJ/X:J=\0G%G]8Bl@l?+DkP&AKYE!A0>DkFCe'?6rm#MG%G]8Bl@l?+DkP&AKYE!
A0>DkFCe677TEAS5u^9k@V0b(@psIj+Dbt+@;I'#A7]Y#BkD'jEcW@F@:rA&7TEAS6V^Tu@;TQu
Ddm=$F(8X#Bl@l3Ch[a#F<E.XBPD*mATAo:@;L'tF!,:1F)rI?Bkq9rGp%3I+Cf4rF(e?97TEAS
:e"Q*@V0b(@psInDf-\6De!3l+DG@tDKKT)Bk;<-E,oN%Bm<TG;cHmc9he&SFCfN8+Dk\2F(&]m
+EMa@FCSu,/KcbjDf-[O+E(k(@rH4'Eb0<5C3!m&Dg#]5+CT)&+EqL5FCcS9E+*6f+D,Y4D'2Fn
GAhM4F!+n/A0>r,DfTr2DK?q:De!3l+DtV)ATMKqFDc2AFCB$*B4Z0-DIIBn/0JGCART[pDf-\+
DIal+@<6N5E-67FFD5T'F*(i-E-#i.D..3k+CT.u+Dbt)A0=K?6m-,_Dfp#<F`_&.Cij`;F`_[I
@;Ka&FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mOD/sc:F!+'tD.-ppD]j+2EbTK7F)lAEEcl8@
+A*buATMr9F(96)E--.                                                       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$73+>P&o1*A>+1bp1.1*A>41,9t,0H`))1,9t,0H`,-1,U100d&8,3AG#^D/a5gD/X3$0JH6g
/h1@LD/a5gD/X3$0JFVk/M/)eATMr9-t@14E,$gEDIIBn+E(_$F`V&$FD5Z2/e&._67r]S:-pQU
=(l/_+EV:.+<Y`IEbTE(+=Jm(.6T^7+CT5.ARTV#+<YB9+<Y)88g#7#DfTA2+=L`<D/a5=+EqO9
C^g_H67sC!@V0b(@psIj+CT/5+<YK=@ps0rDIIBnF"SS2@V0b(@psIjA0>buD.Rc2+C\npBl5%9
GA2/4+EV:.%15is/g,+RAS,Y$+<W(.6:OsR6Vp6S.3KaADIak4+D#G$+<YlBFD)d>Ea`irDf$U>
@UX=h+<XEF9gq?A:e3k]$;No?+EM[;AncL$F!)SJ@rH7,Ec5c1ARlo+@X0(=-r30!<Du7P:/iYp
+<VdtBkM*jEZcJIG%#30ATJt:De9Fc:-pQU-r30!<Du7P:/iYbB4YslEaa'$+Dbt6B4Z*+@;]Tu
Ch7[/+Dbb-AScW7FDi:3CghBu+DtV)ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8Z
0e"5RF)uJ@ATJu9ATMr9A8,OqBl@ltEd8cUFCfN8C2[W:.3N2HBleB;%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>I2[p*h67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2
?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K
+=D8BF*)/8A2#AR>9G^EDe't5-RT?1%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2
+E(j7C*7_=Eb'5B+CehrCcW[]C1D9,-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la
+Z_J'4:MW,$;No?+Co%qBl7K)GAhM4+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$
3Zp*c$;No?+=Jm(.6T^7Ddm=$F(8X#AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/
A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo
$6UI8+?_>"BakD\DIb@/$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP
.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3
Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^
+CT.u+Co%qBl7K)GA2/4+E(_$F`V&$FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):
Ap&0)@<?'tAM>J@$4R>;67sBsDe!3l+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,
HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr
,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$
+>=63-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo
$6UI8ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*
Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eX
D/X3$3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1
D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>
Ecbl1D.PCK%13OO:-pQUCi<flC`me4DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc
0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc
$8EZ-+EM47GApu3F!,::@;TRs+=o,fF)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%
$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,
@rH4'C/\tfCLo1S:-pQ_@rH4'C/\tfCLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2
AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0I\,TBk)7!
Df0!(Gp"4P+:SZQ67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JG2%AT0=X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R1E^gZA79RkA0>K&EZdtM6m+093A*-=%15is/g)l+
C3=>J0d(LJDIIBnA0>K)Df$UF@rH4'C-l?MBk&S7@;]Tu@:X+qF*(u(+D,P4+A*b9/hf+)%15is
/g)8Z+<VdL+<Y*1A0>c$G9A;TD/X3$/7N%/Bk&]1@<-!l/9>oRATMoD@rc^5BIP'GATMs-DJ()4
AS5^oAIStU$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.
;cH%\<.->-$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#A?
$4R>;67sBpDKBB0F<GXCD.Oi2FCB&t@<,m$GAhM4F!,RC+Cf>,E,oN2Et&IMDf02_@;TRs6#pO7
ARTCkGt;@aA5mJHH#R=X3Zp4$3Zp*c$4R>ODf6a]/g,1G@;Kb*Ci=3(DIIBnF(&s(Dg?22+?_>"
FD,62@<,pfF*VVAFDl"=4Y@j2%17#cAU%crATMp,G%G`:@;]UaEb'564Y@jdDf6'l%172j@<>pu
ARTXj@;TFcBl7QlF)Go;FCB&t@<,meFCB!%+?_>"@W-0-.Nj!G$4R=i<(02H:K:=9;,pCk7787n
5tsdH+@/mo+@/\":EW#&<DGnP7787d:KL:=+?_>"@W-/o$4R=i7nc]F5tk3"79DoN<CB8D-TsL5
@W-/o$7QDk%16Ze+EVI>Ci<f+E-67F-VSGrB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@ooEap4r
+=D2>+EVjM-TsL5@rH4'C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B%14g4>9J!(Dfp/@
F`\aJG]XB%%17/iDfTq_3Zp4$3Zp*c$;No?+DtV)ATJu&Ci"-'@:XX+Df0,/@q]:k+>"^RDfd+3
BOPdkARl5W@6H5g%17AD/n#kP+>OB5H9Elh+=\LZ+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=D5D
DfTqI%17,c+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.M)0d'[CF)>i<FDuAE+EVjM%13OO%17#_
C1UmsEb/j(4ZX]A+?CW!%16fXD-pXg@VTIaF?M6!Gp#jK/g+\C+Du+>+Cf>,E,oN2F!,C1C1Ums
Et&ImDf^#-?YOCb?Z0CgARfgh?Xn"lAp&0/Df.]j+>OB5%16W[Eb/a&?[-g??Tg"aGp#jK/g+\C
+Du+>+Cf>,E,oN2F!,:;@ps1bEt&I*%13OOATAo8D/a<0@j#`5F<DrL@VTIaFE1r)F!hD(Eap4r
+=D2>+EVjM-TsM#Df'H.+=D):C1UmsEb/j(-OgD;+Bot0D/XQ=E-67FFEhm:$4R>TCi<ckCiX*!
F$2Q?+?CW!%16`aDdm-kF!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5+F+D'.1HUn$>"6#FDYu5
Ddso/F`\`RB5DKq@;KsqAof=/$?BW!>9G;6@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=/$8EZ-
+EMC<F`_SFF<G[MF:AQd$4R>QARfObEb/d&@rH<tF$2Q,1a"h%0F\?u$;No?+Co%nCgh?qA0>r'
DfB9/+CT;%+EVOE@q^-1DIIBnF!+n/A0><$AISuA67sBlG[kQ4A7]9oAo_g,+EV:.+Cf>,E,oN2
F(oQ1+E2@>@qB_&%13OODg#]4EbT&q4Z[4lDdm-kF$2Q,GT\,(67sZ9.6T:+Dg#]4EbT&q+D5M/
@UX(o%13OO@W-0J/nf0A4YChpD`o]q0d%S]+<Ve%67sB/.OdMA+C]8-+D>\3+EVO?%13OOAoD]s
DIIBnF"SS\+CoCC%144#+<Y-3D]gMPDIIBnF'iX!A7^!.+AP6U+DG\3Ch[BnF<G16E\8JNDe!3l
F!,@=F<G(,@;]^hA.8kg+<VdSG@_n0ATT&)Ecl80BOt]sDfp.EDe:,'G\M5@ASu!h-QkQ)+DtV)
ATJtD+DtV)ATJ:fASu$2%144#+<V+#BQ%f3.Nj!G$7QDk%16Ze+EVI>Ci<f+E-67F-Y-duCgh?q
A927!E+O)<%17,c+Bos9Eap56G]Y;r3ZqpND/a54-Y-duCgh?qA927!E+O)<%14g4>9J!(Dfp/@
F`\aJG]XB%%16rdG\(E,@rH<tF$2Q,1E\_$0F\?u$;No?+Dbt+@;I'#F!+n4F(o9)ARlp"De!3l
+CT.u+D5M/@UX'^$;No?+EqL1DBNA*Gp$s<G\(D.F(9--ATJu&Eb-A(ATVKnFCeu*Df0B:%15is
/g,@OBlmo/F)YPtAKY].+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7lu:-pQU@;]TuBk1dmFD5?$
ATJu2Bm=3"+EM%2E+O)"$4R>YDe!3l4Y@k&+<Vd9$>aWj@;J(f+>P&h+Dbt+@;I&/+:SZ,%13OO
ATAo8D/a<0@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044+Cf>,E,$LCD/"6+A927!
E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A+?CW!%13OO:-pQUBkAK0
BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?+Dbb-AKYK$DJ"$4ARlp)
@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0+DGm>FD,5.F(&ZlF*&OH
BPD?s+EVNEA8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5DIal1AT2R.FE8R7Df000
F(Jl)A7]7e@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&Ci<ckC`k;P
B5\o)BkMR/AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ceD`o^^Df6aJ+F,(P:-pQU
-n6Z/3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!hD(Eap4r+=D2>+EVjM
-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!hD(%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<2A5d>`
CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<CLnW1ATMrG%15is/e&._67sBhF)uJ@ATKmT
%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:
@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z
+<VdTFCfN8C2[W:/0K%GF*)/8A2,VXFCfN8C2[W;0J">gATMs.De(RV0I\+R$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JG2%AT0=X%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,
A7]7*3?VgMDK]T3FCeu*FDi::2D-[=+A,Et%15is/g)l'DJs\Q3$<?_A79RkA0>K&EZdt502-(t
Fa+?&:-pQU0f<]gCbRjlEb0,sD.R6#-tI%&;f-GgAM>ee+D,Y4D'16;Bk0P=F(o,<0JP"!%15is
/g)8Z+<VdL+<Y]IDBNY2+DQ%:CERG3@ps1b%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+Bosu
De3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrD
Df9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g,7LAKYMt@ruF'DIIR2+DG@tDKKT)
Bk(RnBl@l3G%G]'+=Lc7A18X8B5VX.ATJu.F=2,P@<-"'D.RU,F"Rn/ATAo3A0<7AATMs.De(OL
%16Ze+Co1s+>=63%15is/g,%SD.7's+E(j7A8,OqBl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn
$8EYd+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3FCfN8C2[W;+EV19FD>`)0ea_lATMs.De(RV0II;:
%14p74WkslI4cXQBk/>?%13OOATAo94ZX]>+Co1s+>=632'>%),9S]`E+rft+E\eL:-pQUBl7Es
F_#')+D>=pA7]cj$4R>REZd.\De'tP3[]#\F*)/8A2#-JATMs.De(RV0II;:ATAo94ZX]rBk/?8
+>=631E\h',9S]`E+rft+E\,#%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<7Cf>1hCLo1R:-pQ_
A8Z3^D/X3$0JFVk/M/(nA8Z34+EMC<CLnW1ATMs7/e&._67r]S:-pQU6YL%@CNCU@@;Ka&+EV:.
+Eh10Bk/>/@<-"'D.RU,+<Y0&F(KD8+E(j7+=Lc<CagtZ+AR&rATD^3Et&IO67sB)DIm6sCj@.5
DfTl0@rrn;Bl8*&Ch[E&@psFiF!+n3AKYDtF)N1CATMs)A1e;u:-pQB$;No?+CT>4F_t]23XlEk
67r]S:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbd[R$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.
$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/
DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$>"6#De't<FCfN8C2[W:
-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4
>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sC!
DJXS@E-67FA8,OqBl@ltEd8dAF!,C=+EV:.+E1b2BFP;(+?^hlA8,Qs0F\?u$;No?+Co1rFD5Z2
@<-W9BlbD.D/aTB%14d34Wkt5+>G!c+>=pKDJUFC-OgD:+?^hl4s2R&HQY$cA8Z3+-RT?10H`M$
,<d5)+F>4d+CoA++=ANG$8<Sc+<s&m0d(fc1E^4GC`k)Q%14d34Wkt5+>G!c+>b3ODJUFC-OgCl
$;No?+DG_7ATDl8F)Po,+Eh=:@WMtcG&C`*ATL!q+=CWBEb$jH@Wuj'0d'qLEb$pJ@Wuj'1FEV=
@Wuj'0KhH>4Uha-GB.4K4ZX];%16QgEb$pg3Zp4$3Zoep+=\LZ-OgDlGB.4M4ZX]?1E\_$-[6ac
+>P&h+F,=D$9g.jFDYu5Ddso/F`\`f3d,CLD.Rbt$4R>;67sBpDKBB0F<GXCD.Oi-Dfor=%16uj
@;TRs4ZX]5DKg,30Hb7WEb$mIDKg,31*CIYEb$sKDKg,31a`_>-p'J-DIIBnF"'75+=JU[B5Di9
@rHR#Dg?CO.6Aql/g)nl1FYC60ebgH0I](33&r*-+?q_+1*ee;.6BY73[]&fBk)'lAKYi$+C]A0
-OgDH0RInYE,9H&+E2IF+?MW%DIIBnEt&Hc$4R=jA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a
4$%7s@;TRs%14L;+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnEt&Hc$7ISN0d("E
C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;3Eb/isGRY!.
0H`+nA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+DG_*
Bm:'o-nlc"+CoA++=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaE
A0>r9AnGb%%13OO-nlbu+CoA++=CWBE[N:Y/NP"/+?L]-3d,CLD.Rc2+<VdL+<Ve%67sC)DfTA2
E,oN%Bm:'o-nlc!+CoA++=Aun.3L3'+>G!#+?MV3DKg,31aaCg+<VdL+<Ve%67sC)DfTA2Bl7Ns
GRY!.0H`.oA8Z3+-Y+qZ.3L3'+>G!#+?MV3@Wuj'0d(@XEb$mP+<XEG/g,@VEb$;6F_56"GRXuh
$>sEq+>=ol+CoA++=ANZ:-pQUEHP]+BkD'jEZeq6Ec5u>%16uaEZd%Y1a$=HC`k)Q%16uaEZd%Y
0H`%lA8Z3+-RT?1%14L;+>Fum+CoA++=ANc+>#Vs0d&P#4$%7s@;TRs+<VdL+<Ve%67sBlD/aTB
+EqaEA0>i3AS,Y$+=M,GF`)7L%14L;+>Fum+CoA++=D&NEb%!S.3L3'+>G!#+?MV3DKg,31aaD@
67sC)DfTA2E,oN%Bm:aKDJsZ8F"%P*-nlc!+>=pKDJUFCEb$sR.3L3'+>G!#+?MV3DKg,31FF:f
+AP6U+EqaEA0>T(AncK4-uNsGDK@69$7ISN1E\@oA8Z3+-Y+qZ.3L3'+>G!#+?MV3DKg,30de(d
+<XEG/g,@VEb$;6F_56"GT\DPDfor=.1HUn$>sEq+>=op+>=pKDJUFCEb$O?+AP6U+E;O4Ch[Kq
ATAo)EcQ)=Et&IoATAnI+>b2s+CoA++=D2?-QjN@$>sEq+>=ol+>Y-NDJUFCDJpm3$>sEq+>=ol
+>G!LDJUFCGB.V>B.",qDImi20H`%l1*C+FC`k*6B45Ll-OgD*%14L;+>Fup+CoA++=ANc+>#Vs
0d&P#4$%P&@;TRs+<VdL+<Ve%67sBlD/aTB+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;+>Fup+CoA+
+=CWBEb$sR.3L3'+>G!#+?MV3@Wuj'1FF;?67sC)DfTA2E,oN%Bm:aKG%G]'F"%P*-nlc!+>Y-N
DJUFCEb$sR.3L3'+>G!#+?MV3@Wuj'1FF:f+AP6U+EqaEA0>T(AncK4.!B0B@WNt-$7ISN1E\Ir
A8Z3+-Y+qZ.3L3'+>G!#+?MV3@Wuj'0de(d+<XEG/g,@VEb$;6F_56"GT\DXATD7$.1HUn$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDF)>i2AN;b2?Zg<u@<?'qDe*BmF*)G:@Wcd,Df/<:/h2!_A79RkC2[WnBleB:
Bju4,Bl@l3F"JsdF`:l"FCfM9Anc'mF!,17+A,Et+Co2-FE2))F`_>9DCuA*:-pQU%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+AZKhDdm9u+>PW)2%9mf67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0K<oXGqq?%Eb0*+G%G2,Bl8!6@;Ka&@UXA"+CT.u+EM%5BlJ08+>"^WBl.g*
BkD'jF!+(@9H\1\Bl8$(DIIEmAISuA67sB73-/YM1,L+^A7T7^+D>J1FDl2F/p)>[+EVNEA8-+,
EbT!*FCeu*Anc'mEt&IO67sB80kP!+0f1"_DeX*1ATDl8-Y[=6A1&L.A7T7^/8B*6/oY?5+ED%1
Dg#]&+D,Y4D'4.=E"*.L67sB'+<VdL+<Ve>Df99)AM7P3A7]^rAU#>.Bl[cpFDl2F+E_X6@<?''
Eb0*+G%G1n$;No?+>GT_AR[AQ+DPh*E+EQ5FEhmMA8-'q@ruX0Gp%'B@:Nk^DerrqEZee$A7]9\
$;No?+>GTf@<jRe+DPh*A8bs2Ch[d0G]%GAATKJGG]Y':A7T7^%15is/g)l(C3=DL0H_cbATVZq
A7TUrE+*j%F"&5?A7T7^+D,P4+EqO;/0JbCDKU1T+DkOs+E1b2BFP;D67sB812:rL1,9t\A7T7^
+=M)8@r?4,ATM3X=B$^l%15is/g)l(C3=DL2'?LLEarg$B-;#)DIjr%DIdf2.!0B".1HVZ67sB8
12:rJ0K1+aDfBtEA8-+,+F7a@+EVNEA9)U-@W-K6AoDKrATA4e:-pQU0f3WfDDF'lEb0*+G%De,
Ec5o+Dg3C:DerrqEZek1E-Vm":-pQU0f<fVE\THpEb0*+G%DeBAnc'mF!*%WAnc'mF!,RC+>,9!
05>E9A7]p;@;KXhDD-'Q@<?'6/hSb!A8-'q@ruX0Bk;>p$;No?+>G`gF_ici+ED%1Dg#\7-u*[2
Bl7HmG[F!@9hZuYCgh?sAKYo#F)Pl+FCcS5@VTIaF:AQd$=e!aF`MM6DKI!K@UX=h-OgDmDe!Tl
F)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb0&u@<6!&A8,OqBl@ltEbT*+%16TfEcO<(+Co1s
+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065
Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6
-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:4tq=U:IJ5X6k'J4$;No?+A,Et+EMX5B5)6r+Co2,
ARfh#Ed8dMDId=!+E2IF+Co1rFD5Z2@<-'nF!+n-Bk;0)A8-'q@ruX0Gmt*Q:IJ,\5t=@38Q%]4
+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$
6uQOL.4cifFCAfn05>E90..29%15is/g,4FEbTK7F"AGM@:F:#@;]Tu@UXA"%17/m4ZX]5BPDO0
DfU,<De'u)DKBo.Ci!j)A0>o(F(KH.De'u*De*fqEc#k?C2[X%Ec5Q(Ch4`+@;]dkATMs.De'u,
@:Eem@;Tt"AM>em+DPh*Bl8$5D]ie5A7Th"E$l)%F)4!#+EM?M-Ql)k@RP?UE$/n6A7B+kF<G:8
F*(i,Chdm!@UX@$Eb0<'FD>`)@UX@$C2[X%Eb]G6C2[X*F(KB%Df00$B4>:b-OgE(Ccsg%4$"L*
Cb-qVC2[X%A7f1J=B$DZBl8'<DJsW.F'hmK<$6$d@r?4,ATM3X=B$XW$4R>_@j"tu-ZW]>C2[X(
@r`q[3Zp7%B4Z0-F)29m%15is/g,4HF<GX7EbTK7Et&I)HS-Ks+DPh*F(95>4ZX^43[-:$C2[X(
@r`"c%15is/g,1WDBMP;9H\1\DJ<]oF*%iu-n$bm3\`?C.3LZ4+>>i*+DkP)BkCptFD>`)%13OO
:-pQUF`:l"FCcS,Bl%@%%14dO.!0B"+DPh*E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)e
C2[X%@<-4+/no'A-OgD:4=G;i8g%keA8lR-Anc'm.3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YdR1
E,ol/Bl%?5Bkh]:%14dO.!0B"+D>J1FDl2FC2[W3+<VdLAp890FCcRe:IJ,\5t=@38Q%)eBPDO0
DfU+UFEhmT%14dO.!0B"+DPh*E,ol/Bl%?0+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2
De*g-De<^"AR](`/no'A-OgD:4=G;i8g%keA8kstD0%-K+<VdL+D,h<Blmo/8l%iR<'a#C6qL9-
-YdR1@UX%*C2[X%@<-4+@UX%)Bkh]:%14dO.!0B"+DPh*F`V,7@rH6sBkLm`CFLAKAp890FCcRe
:IJ,\5t=@38Q%)eC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh]:%14dO.!0B"+DkP)BkCptFD>`)
.3K`UAp890FCcRe:IJ,\5t=@38Q%)eD..<rAn?%*/no'A-OgD:4=G;i8g%qY@V'dmD/a<&0JG41
+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo05P'+AU%X#E,9)>0JP1oC3(a3$8=RjFDjbo9OVBu
F_u(H+<VdL+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2=@:EbiD/_+AC3(a3$8=RjFDjbo
C2[WsDKKo;.3K`U+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*R"FE2:PBkh`;%14dO
.!0B"+DPh*A9Da..3K`U+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WnF_u(MBkh`;
%14dO.!0B"+DPh*@V'V&.3K`U+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WlATMrG
Bkh`;%13OO:-pQUAThX&FEM#.Cj@.3DJsW1ATAo4Ec5](@rri1@;]LdATAo0@:C@'Bl%T.@V$Zj
A7T7^+:SYe$;No?+EMXCEb-A,FDYh:Bl7HmGT\R\DffZ(EZf:<Ch[cu+D,>(ATJu&@q0(kF(Jl)
G%kA-Bl8$(Ec,H1+Dbb0CNBpl:-pQU0K^b*Db;-eDe*R"A7^!m85r;W.3N5HEbTW,+A,Et;cH%Q
779^F/151NA7TUg05,HECh.Ho05>E9Bl7HmGV3ZOD/:R/$4R>;67sC%FDl22+DPh*E+EQ5FEhmM
E,8rmAKYZ)Ch.*t+D,P4+DPh*/oY?5+>"^EG%#*$@:F%a+E).6Bl7Jk$8=RjFDjboC2[X%A7f1J
=B$^lAp890FCcRe:IJ,\5t=@38Q%)eC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[-OgCl$;No?+EMXC
Eb-A0Bl8'<05Y--+EML5@qfOh@j#Z-FCfM&$8=RjFDjboCh[d0G]%GAATM3X=B$^lAp890FCcRe
:IJ,\5t=@38Q%)eC2[WnDdtG:Bl8'<DJsW.F"VQZF=.M)0K^b*Db;-h@:O1nFCfN#<*3*K+<Ve=
GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kV\-@r?4,ATKJGG]Y;B$4R>;67sC$AT)O!D@Hq:0RGSu
De't<-OgDH0RI_K+FPkPF`ML3$4R>`D/XQ=E-67F-YdR1+EMX5B4W2rBl[cpFDl2F+E_X6@<?'k
-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3       ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1*A>4+>GVo1Gg4/0H`).+>GPm0fL410d&8.@rH4'C/\tfCLo1RFCfN8+=L`<D/a5=
+DtV)AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+
F*)J6Bk1.ZDeio<0IUIGA18XBD/X3$+EV19FC]9*;f-GgAM>edA8Z34+EMC<CLnW1ATMs7F`:l"
FCf3*A7TCqFE2))F`_>9DKTo/@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df,           ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*A;01,0n,0H`+n0fD$G+>GSn1*A>+3&;[30H`+n0f1mE1a"M/+>P&p0Jt^1
0fL41+?2>;+>Get1*AJ11a"M-+>P&o1cR030f^@3+>l)5+>Get1*A;.1Gh^"6pamF9LMEC;cHOj
=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35
F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cPgL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f:(G
F_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K'7F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Get8p+qm1,(F?+>GW41bh$H
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fL4I
F_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iDs$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0d')2C`kJe0f:(.0fh$F
3\rJt8l%iS:JXY_6<-TN6qBmJ<)6Cp1,Vfn/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:
+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI9F%13FL:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2)l^$6t(1K3Zp='8p+qm1,(F?+>GT3
1,M$I2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2)ud%
6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>tnr+@KX[ANCqg2'>M6C`kJe0f:(-3BB#U3\iW$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=8+<X'\FCdKU0f:(GF_i0U0JPF-
0ebXB1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
1*@]-@<?'A+>Get8p+qm1,(F?+>GQ22)mWO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2DZHu6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K0=G$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u&!+@KX[ANCqg2]t_8C`kJe
0f:(.1-.6H3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp=<+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2BX,1@<?'A+>Get8p+qm1,(F?+>Gf90JPUC2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E)a$6t(1K3Zp14+A-cm
+>PW*2'=V.3\WKR1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>u2%+@KX[ANCqh0d')2C`kJe0f:(.0fh$F3\rJt@WcC$A86$nBkh]E0ht%f.UmO7Ch.:!
A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%FCeu*C2[WsC3(M=@rc:&FE8QIBl5%9C2[WqBlj\W67sBk
Bl[cpFDl2F/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<
+<Ve%67sC!@WZ$mDBMPI6jc[U/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&
DL!@CE+No0A8,OqBl@ltEbT*+$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q:-pQUDfB9*
+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/$:-pQ?:-pQU+<WB]EbupH@WcC$A86$n
Bkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ305i9H:-pQ?:-pQU
@<6L4D.RcL$;No?$;No?+AQhtATDg0EZek*ARfLiDJ(R/:-pQU;IsijBl[d++EMX5DId0rA0=Je
E,ol/Bl%>f:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F;C3=DJ
1($cC/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+$;No?+>GTcF`&ll+CSekARlouDe*g-De<^"AM.\3F!,49A8kstD0%=DC3(M4De+!3
ATD:!DJ!Tq@UX%)Bkh\r:-pQU0f<BYE\K6kEb0*+G%G2,H=gl-ATJtG+E)CEE-67FA8-'q@ru9m
+EVNEC2[WqBlkJ?DId=!+CT)#ASqh^@rGk"EcP`/F<Dr?@<6!-$=e!aCghC++EVI>Ci<fj5s[eY
Eaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OO@%Bl8!'Ec`EO
BkhQs-OL2U67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'n
Esci(D`p-(I4cXQBk/>?$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OL2U67sBmATVEq
+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?/,D/a<0@j#DqF<Gua+D5_6
+=CW@Bl%<pDe(4&C2[X+ATDj+Df.^!+=o]1HV.(%<_Ysh$;No?+CT)#ASrW*De*QsF!,"-Eb/a&
DfU+18l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.
:dJ&O?XH`2?XHE$6uQOL$;+)^7nHZP:IIcH;c#bZ83K!VC2dU'BQIa(+A,Et7nHZP:IIcH;c#bZ
81Z-'De*KpF>%BIA8,e"0..)6:-pQUB4YslEaa'$+Cf>,D.RU,ARloU:IH=8CghC++EM%5BlJ08
$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;
C2[X$DC5d+De*HoCh7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$Es`7L67sC$ART*l@r,RpF!,(/
Ch7Z1@UWb^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Yp$;No?
+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7d:Eap55EapI[3Zp7%B4Z0-4$"a(De*g-De<^"
AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"$7L6R+u(3]EapO]3Zrc1+u(3]EaoF`:-pQUF`:l"
FCcS*Bl[cpFDl2F+D,>(ATJ2J8PDQO4ZX]6C1D'gF)to6+=nX^/g<"mF)kb>+=nil4s2s8/no'A
-ON=79LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO$8=SWDe*BeF<D\K+<Ve=GB.D>
AKX&gHU^S#78jOI4DJeFF*)>@ARo4k+D,h<Blmo/4#)(O8PDQO$8=SWDe*Bs@Urnh+<Ve=GB.D>
AKX&iHU^S#78jOI4DJeFD..3kA79R&+D,h<Blmo/4#;4Q8PDQO$8=SWDe+!4Bl%<gF<D]<GB.D>
AKX&kHU^S#78jOI4DJeFFDl)6F(A^$+D,h<Blmo/4#M@S8PDQO$8=SWDe*d(A79R&+<Ve=GB.D>
AKX&mHU^S#78jOI4DJeFE,ol/Bl%?'+D,h<Blmo/4#_LU8PDQO$8=SWDe*fqEc#k?+<Ve=GB.D>
AKX&oHU^S#78jOI4DJeFF`V,7@rH6sBkLm`CEOa3GB.D>AKX&pHU^S#78jO#F)>i<FDuAE+=CZ;
D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RIE+EC!ARm.qF)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ8.#]!
67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+$?'GtDf9P:>9G^EDe(4C$4:9]@s)g4ASuT4-XpM*
AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FRBPDO0DfU,<De(U^%16`ZDImisCbKOAA0<HH
@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B/]8
/Ke.t=:GT[+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'
BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)
@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL
/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o
+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3
D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=
+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe
$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s
$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3
/mo+q%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5
$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"
DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,R
DImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(
ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'
F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?
BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*
DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7
ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P
@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%
+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL
+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17
+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=
%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9
$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.
DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-
+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4
F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6
DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(
Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=
Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+
A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(
ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6
DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.D
D]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBk
F_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1
%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]
/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(
+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrp
DerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$
B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C
@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5
Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$
AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(
Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^
DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9
$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_a
Ch.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQt
DJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO
+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4
?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5
Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1
F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9
@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S
/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=
+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm
@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1
+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg
+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*Qo
Bk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*
H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0
F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)
Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&
F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa
@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`
F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#
F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu
+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L
+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*
B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5
.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlot
DBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*
1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE
1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7
ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>
BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE
+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!4
0d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`
DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"
Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&
A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9
+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`
>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%F
D]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.Ge
BOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%
FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;
@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5
B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1
+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG
%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:
BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(
+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#
+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT
4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4
DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkT
Ec<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#
+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13
E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"
@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+
3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.
H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''
-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/
A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXF
Bl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_o
F)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,
AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,
+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@
?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPp
BlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImis
CbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO
+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj
+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jk
Bl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';
Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33
Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D
+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',
+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*
1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<
@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ
+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=D
C3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB
/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>
F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/
DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8
Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCq
Gp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(
H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'
ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$
ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@lt
EbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.
FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<
Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu
+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].
F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&
@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et
;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"
DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:
+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d+
+A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs
@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(
A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt
%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(
C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5
DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb
+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@
Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&n
De*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P
/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LA
C2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#
+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'
+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/
FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0-
-RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34
/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1
+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloq
Ec5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'
/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFC
AT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4
+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)
?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9
$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];
Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1
+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5
F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[
A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&
FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%p
CLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os
+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2
BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<
1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.
DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,
F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?
De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3l
GA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>
+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-
+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#
+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu
+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'
ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-
G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.
Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T
-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?Ke
Fa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4
DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_t
F`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.
GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u
+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.
GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=
$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F
0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1
F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@o
A7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*K
C2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8
ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ
+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm
+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>
A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6
G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&
A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0
Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu
+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT
+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai
<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-
+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A
?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:
F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsm
Eb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7
F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5
ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)
BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNE
Ci=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#
.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA
%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3
Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1
Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m
+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^V
ARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LS
AS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZU
F_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og
/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3
D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4
C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?
+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"
%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5
E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE
?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO
0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U/
/KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB
%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>
A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2
AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgL
FCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t
@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$
DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5
B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3
DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL
%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibjH+>"^.F_l=G
1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"
+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[E
E,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y
$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=
+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!
EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57
@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G
0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#
.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;m
Bl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7
F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@
+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]4
8g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5
BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=)
,9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb
+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0
Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<
ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2
F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B
05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*
ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?
+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6
Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&q
FD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD3
8l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeK
D]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZ
AKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#Oj
E*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?
@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNE
F`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNE
Ci=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16r\CLoh@F(o,V:IJ/nF*)IY0ht%f
.W&U0AO9gHBk'b26r[`=FE8RG/M/)^@;BEs8l%ht@UX=l@j#l)F*&OG@rc:&F=n"0:-pQB$;No?
+B3#gF!,O6EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+C\c#
Bk%SZ:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5
B-:o++<Yc>AISuA67sB/@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16
Eb/rtDK@E>$;No?%15is/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\K
BlbC>+Cf>-FE2;9Ch7-"+C]U*$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlot
Afr3E<(0_b6Vg]W<%/r$G[k;rA9/l8BOqV[:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[Wl
@<6-mFCfN8F"&5QF_Pr//e&._67r]S:-pQU@<6L4D.RcL%15is/g)8Z%15is/g)8Z0e"52+Cf>-
Anbn#Eb/c(8g%YYEb/a&DfU+GIS*C(<(0_b%15is/e&._67sC(ATD6gFD5SQ+EVNEF`V+:A8aL<
$;No?%15is/g)8Z:-pQUB4YslEaa'$+EM%5BlJ/'$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6
F!i)7+>Y-YA0<6I%15is/g)8ZEbupHD..3k6=FqL@nKNb<+U,mF!hD(:-pQU%15is/g)8Z:-pQU
Ecl7BBljdk:-pQU+<W'd+Z_A-+?XCX@<?0*-[nZ`6rZTR<%gRHF(o,V:IJ/nF*)IUBkh]:%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>H3=Q<j67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE!Ddd0!-YdR1FCfN8ATB.-$>j3eAQ*GaCLp+66r[`=FE92l
:-pQ_D..3k;f-GgAP,`d<+U,mF!,NU/Ken=CLnV\:IH=HD/X3$+EV19F<GX7EbTK7/db??/db??
/g+,,BlbD<@rc:&F<G4-DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m-Pf
Deink:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2AKW+9F`&`Q+EMX5Ecc#5
B-:o++<Yc>AI;1!/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4
ASGdpF"Rep67rU?67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>
+<Y04DKKo;Ci!Zn+<Y-=$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%+<Y]9E+NI"ARlotAfr3E
<(0_b6Vg]W<%/r$G[k;rA9/l8BOqNG67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*p+Deip+
ATMs7.3N\SBlmo=$;No?$;No?+CT>4F_t]23XSVK/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?C3=>H3=8MJ/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4
-XpM*AL@h$Ddd0!-YdR1FCfN8ATB.*D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj
5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6-SR/5/ibmF-OgDZ9L2WI
:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B
;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$K
C3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'a
CG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARl
De*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.
Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;
De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk
.1HV^78--9;aii1-YbOn0d(3h0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!0:%15Kl:dn,I;a!/a
0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc
@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+EVO?Cb?i&:IH=>F!(o!@3Bc4Eb$;2EbT*&FCeu*
A79Rg@UX=h+D,P4+CT)&+EVmJATJu4Afs\gDdmHm@rucE+A,Et+:S[!F`;;<Ecc@FCh[d&ARloo
Bk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+EVO?Ci^_2DfQs0$=n'bF_t]-FD5W*+CT.u
+EV19FD5W*+A*bdDe*E3+:SYe$;)F"/hhN'3%cn0+A,Et+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0r
ATK:C@:WneDCuA*:i^8gEZfO:EcYr5DK?q=Afs\gD..3k+=Lu:Bl%@%.3N&B@;0Od@VfTuAo_g,
+EMgLFCf;3F(96)E--.R%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%
A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M
9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;i
D/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7B
FD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172j
AKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8la
DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU
@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTu
Df-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.L
BOrc1De(G=@:s.)%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!
6U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-SR/5/ibjH-OgDZ9L2WI:Jsnc
4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&Ii
BleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8X.1HV^78--9;aii1+=Cn^0JO\b2D?m/C,[h$+DNki
0d(3j0JXbc3&!-2C,dn(-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$
F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>3DfQt;DfTD3Bl7O$
Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y
:IH=%@:s-o@<=O>$4R>UFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_*
$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'k
CbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U
<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0J5@<3B/]?%15p*
5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1
+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3
Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki
1a`_>6q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14Lu
De*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2
A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%G
F*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88
@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYet
EbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2
@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,
+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;)F"
/hhN'3%cn0+A,Et+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!&.EbTH4+:S[$ATDj+
Df0V=De:+a+DkP&AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;+)^
+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7
AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sI
C3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A
.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S
@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;7
7qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(
+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;
%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'n
CggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:06Cl=/S]37/T>-2AM4K".1HU                                             ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o0d&>/+>Get1,^702]sk6@WcC$A86$nBkh^3E+EC!ATJu(Df'?&DKKH#+DPh*Bkh]3
F(96)E--.DBl5&.De*KpF<G+.Eb/a&DfU,?@;BF@@<6-m8l%iSATMs7D..3k+A,Et+C\c#Bk&9-
ATMr9F(96)E-,r*CLpF]DeioV:IJ/nF*)J?@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&F8       ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ER'
zz=:zz,'R004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR013'
zz=:zz,' ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR'
zz=:zz,'023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GROUP HTML'
zz=:zz,' IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILES JDSDI'
zz=:zz,'RS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVERSION LA'
zz=:zz,'TEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NVTA'
zz=:zz,'BLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK0'
zz=:zz,'09 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUTBLACK R'
zz=:zz,'EFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML afterstr'
zz=:zz,' alltrim badappend badblia badbu badcl badfl badil badjr badlocn ba'
zz=:zz,'dobj badrc badreps badsts badunique beforestr bnl boxopen catrefs c'
zz=:zz,'d changestr checknames checknttab checknttab2 createjod createmast '
zz=:zz,'ctl datefrnum dblquote decomm defzface del destroyjod did didnum dn'
zz=:zz,'l dpset dptable empdnl fex firstone fod fopix gdeps get globals glo'
zz=:zz,'bs grp gsmakeq guids guidsx host hostsep isempty islocref jappend j'
zz=:zz,'cr jcreate jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jr'
zz=:zz,'eplace justdrv justpath jvn lfcrtrim locsfx make makedir markmast m'
zz=:zz,'ubmark nc newd nlargs now nowfd obidfile od ok packd plt put quote '
zz=:zz,'read readnoun readobid regd remast restd rv saveobid second tc trim'
zz=:zz,'nl tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '''
zz=:zz,' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS '
zz=:zz,'DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 E'
zz=:zz,'RR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 OK201'
zz=:zz,' REFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyfiles cre'
zz=:zz,'atedl dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropbakdi'
zz=:zz,'r dropdir dropinv dropnc dropref gettstamps justdrvpath libstatus l'
zz=:zz,'oadbakdir loaddir loadnc loadref loadstamps maxback movefile nummas'
zz=:zz,'k packdict packspace puttstamps renamefiles restdict restspace save'
zz=:zz,'dir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake DUMP'
zz=:zz,'MSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPTAG ERR0150 ERR0151 ERR0152 ERR'
zz=:zz,'0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAI'
zz=:zz,'NFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCHARS'
zz=:zz,' SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl '
zz=:zz,'clearso clfrbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumphead'
zz=:zz,'er dumpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap'
zz=:zz,' fmtdumptext fromascii85 getallts getascii85 halfbits htclip jnb js'
zz=:zz,'cript jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep '
zz=:zz,'opaqnames parsecode putallts rlefrnl sexpin sonl tabit toascii85 uq'
zz=:zz,'tsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore '
zz=:zz,'CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK C'
zz=:zz,'NPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 '
zz=:zz,'ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR0'
zz=:zz,'62 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 E'
zz=:zz,'RR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR08'
zz=:zz,'2 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ER'
zz=:zz,'R092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101'
zz=:zz,' INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 '
zz=:zz,'OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 O'
zz=:zz,'K063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx a'
zz=:zz,'llnlsfx apptable appwords badcn bnlsearch bnums checkntstamp checko'
zz=:zz,'pen checkpath checkput closedict createst defwords delstuff delword'
zz=:zz,'refs didstats dnlsearch freedisk freedisklinux freediskmac freedisk'
zz=:zz,'win fullmonty getdicdoc getdocument getexplain getgstext getntstamp'
zz=:zz,' getobjects getrefs gslistnl inputdict invappend invdelete invfetch'
zz=:zz,' invreplace islib iswriteable iswriteablelinux iswriteablewin jdatc'
zz=:zz,'reate jwordscreate loadalldirs loadallrefs loadwords mainddir newdp'
zz=:zz,'arms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendi'
zz=:zz,'ct pathnl pathref putdicdoc putexplain putgs putntstamp puttable pu'
zz=:zz,'ttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub''),('
zz=:zz,'<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00'
zz=:zz,'402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUIT'
zz=:zz,'ES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK0040'
zz=:zz,'1 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WAR'
zz=:zz,'NING00400 WORDTESTS addgrp addloadscript addloadscript1 allnames al'
zz=:zz,'lrefs betweenidx createjodtools dayage delgrp firstcomment firstper'
zz=:zz,'iod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obname'
zz=:zz,'s onlycomments pr refnames revonex today todayno updatepublic usedb'
zz=:zz,'y yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK C'
zz=:zz,'WSONLY DOCUMENTMARKS DYADMARK EDTEMP ERR0250 ERR0251 ERR0252 ERR025'
zz=:zz,'3 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterface '
zz=:zz,'MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251 OK0'
zz=:zz,'252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRIPTDO'
zz=:zz,'CCHAR VERBATIMMARK blkaft changetok compclut compj compressj create'
zz=:zz,'ut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 doctex'
zz=:zz,'t docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfreader '
zz=:zz,'qt reb revo rm rtt textform2''                                      '
zz=:5255{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`-1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+APL&:c]_.@:O(qE$0%,D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN
@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ
67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$
F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u
+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGF
F<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k
+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]Tu
F*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*
$;No?+<VeDDJUF<+<Ve%8PN#B+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlom
Gp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX
6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,
Eb-@@C1_0rATJu7AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R"
;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hV$;EfR;GU7p:dmN.8lJ)T
8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q:ha%15is/g,(AC1Ums+Cf>#
ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=
@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!
@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H
:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhs
Ch[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W
7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA
@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk
-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&
-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:
EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j
:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@
@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=r
A93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA7TUf
:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA92j2
Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"
ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q
@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)
@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'
F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;
An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8Z
A8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(
GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL
+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs
%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL
+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#
Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+DIal+@<6O0F`\a:@<?''FD5T'
F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F%15is/g)8ZCi<`mDIXe3+<VdL
Ci<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeCDdd0sAS*&-+<VeCDdd0!Eb/io
Eb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-E,uHq:-pQU+<YW3@r#Uh@rrh9
+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&F!+m6@UWb^F`7cs:-pQU+<YW3
@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@@:NjX$;No?+<VeGF`__HFCB$*
F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67FFD5T'F*(i-E,uHq:-pQU+<Y]9
F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#Uh@rs./
$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4Eb0<6DfTD3F)YPtAISuA67sB'
+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&AS*&-+<VeJ@<Q3)Eb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IJ`3@N]]"DJ*N'1,(C6
1,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.A92j2Eb-U-$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o%15is/g+\=Eb/a&DfU+GDJsZ8
+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]-
%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(D..O.ATDi$$:Iil8Q\>T4ZY\e
/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=
Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&+FH3m6qL9O9iE/c-8%J8+@K1-
8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/F`&=>@;TRs%15Kp;GKSB3]oJV
?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#C1UmsEt&IE8Q&GU:-CX#4"akp
+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5
DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN+AtWt6V]!X4ZX]J+u(3f3Zpg^
;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7De*]nCLp7-/g)WYDe*]nCLnVu
/M/)d@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._
67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:
Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]Li
H$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\
+Du+?DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is
/g)8ZD..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0
Gmt*U67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE
@;TRc@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL
+E2IFF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeN
DfTA2@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs
+D,Y4D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k
+ECn.B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;
67s`uAT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is
/g,7EB6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K)
.X`ZR$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0
BFP;M;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m
+E(_(ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)
+ED%&F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;
-Qm&BE$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"
EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56
Bl5&8BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A
9LUK[-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1
+EV:*F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng
4ZXr5E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1
Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?
D.7'sARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX
<'a"`$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl
+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!
CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(
ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'
@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\
3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dAF!,C?ASqqa:-pQU
+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!Df0!(Gp%'7FD)*j
:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!+m6E-67F
A8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<Y07
ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+Ap806A9/k9+<Ve;
AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu:-pQU+<Y3/A92j$
FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%D@HqJ67sB'+CoA+
F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"F_t]-F<D]=ATT&5
@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=AKZ&(EbTK7+EV1>
F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1
@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*AS-!++<VdL+D58-
+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/DIIBn+Dbb5FE7lu
:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gmt*U67sB'
+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#ATVK++<Ve;ASbq"
AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9ARloo@<>oe$;No?
+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4AS5Of@rrh9+CfG'
@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9+<VeFE+No0@3B)p
@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is/g)8ZE-686G]7J-
Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688F!)SJ+<VdL+EMXC
Eb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2@;TR,+CfG'@<?4%
DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`IDfTD3-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<+<VdL+EMXCEb-A3
@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'+E2IFGAhM4F!)SJ
+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/@UX'qEb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2DfTD3Ea`iuAKWZa
0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P90G<i+<VdL+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H;cGn@1a!n`+<Ve%
67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO:fBM<2'="a+<XEG
/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO:-pQUD..-r+Co2,
ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^/430":JFYa%13OO
6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4rF)rIBEZf4-@rcK1
FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,C1Ums+Eq78+D,>.
F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$D/aE2ASuTN+EM47
Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr6IF*&OHBl.E(
DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cmDf'H3DIm^-+EV%$
Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h+E1b2BHSlL-tI%&
DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKXH=\4;Afu#$C1Ums
+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(Bl%?'@rH4'Df0-(
FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%8PW;b<Cp.Y;a!/a
8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/rCh4`!Df'H3DIm^-
Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F
%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&@1<Q8:0(=_;cH[Y
3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO:-pQUFE2)4+ED1/BQP@F
FE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY
/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(FDl)6F&#%S.V`m4
FDl)6F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB
$;No?+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5
E%c9TBlmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat
@;TRs+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(
ARfh'+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D
+ED%1Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-
E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Ve;Ble60@<iu6DJX$)AKXT@6m-/SCiCL>+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD
@;BEsCi<`m+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/
G]4cJ+<Y]9FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL
+D58-F!,@/D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+
8l%ht@rH7.ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9
EHPh8F)Q)@ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL
+<VdL+<VdL+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4J
Ed8d@@;]V$+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8
F)Q)@ARlp(AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1Ums
F!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJ
DfTA2AU&01@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE
<(pF;@ps1i+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41
F)tc&ATJtBC2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcm
Eb$;:BPDR"F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!
C2[X*FD5Pd67sB1C2[X*FD5P6@kB8T@3B&uCi!ZmFD5Z2+E(j78l%htF`_>6BlnVCGAhM4F#kFT
G][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu&+EM+9+E(j7
BOPdhGp%6OBl%L*ATJu9BOQ!*F`V+:FD,5.@rHC!%15is/g+b7@qfanFD5<-+E(j78l%htFDi:@
ATDC$Ebuq@@<64*+E(j7B4YslEa`c,F`V+:FDi9o+E2@>B6%EtD.Ra//e&._67r]S:-pQU8T&W]
Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z@rH4'C*4WA+D#e>Eb0*!+Cf>,E,oN2F(oQ1+E(j7
A8,OqBl@ltEd8dODfTB0%15is/g)8ZA7Zl++<VdL+CoM2E$/_4Ec5t@@rGmh+D,Y4D'2GH6m-M]
F*2;@Et&IO67sB'+Co2-E$-8G+<Y3/F)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'%15is/g)8ZA8bs#
+<VdL+D,P4D..N/@rH4$ASuU2+DG^9GAhM4F!+n/A0>E$@s)X"DKKq/$;No?+<Ve<A0<!;+<VdL
ARoLs+E(_(ARfh'+D,Y4D'2GH6k'Ju67sB'+D#X;+<VdL+<Y6+BlkJ>AU&;+$;No?+<Ve>F<D\K
+<VdLB4Z0-FCf]=+E)CE+E(j7ARoLs+EqO;A8c[5%15is/g)8ZEb0E4+<VdL+Dbb5F<GU8@qBP"
Cj@.DAThd/ARlp%@VTIaFE7lu:-pQU+<Y]A+<VdL+<VeIF`&==@:O=rEt&IO67sB'+EDRG+<VdL
+<Y]IDBO%0F`_P<DeF><FCfN8Et&IO67sB'+DPh*BOu"!+<Y-6Dg-86+AbHq+E).6Bl7K)BOu"!
%15is/e&._67sBUDffQ33XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'
0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,!F/KeS8E+NotASuT4GAhM4F!(o!%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4
+CT>4F_t]2%15C";cQO\;b]PU90G<`@<6L4D.RcL-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@<H[*DfQ9o5uglT:JsnQ;G0/6-Xh.>BQ%oP-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@rc-hFCetl$:@][5u^9@9gMZM4ZXs#Eb/[$ARmhL%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt2H!t5+BQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f6s2fD9gMZM4ZXs$H!t5E-OgCl$;No?
+CoD#F_t]-FCB9*Df-\7@<--+AoD]4D/X<#A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15g*:-h9B
5uL?=3[\c_DII':-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4G%G]'@<?4#%16-);F3ZK
8PMoF;G0/6-[''A@UX@mD)s$R$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfC@Dfd+GDfTB0
%16!/:K1Ck;FFGX5uL?=3[\rdDfg2AEb'5P-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<-.)+>"^H
AT23uA9/l3DBNk>BOu3,D..I#Et&IE:IA,V78?fV5uL?S4ZX]O;c?[j78loH;G0);<E)Lb;GBGT
905L=76smA6qosF905OE5t"F5;G0)G:JO2D9gMZM4'"dJ6:"RB9hdoO906$I:K1Ck;FFGX5uL>b
$4R>;67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuTN+DPh*+<`-_.6T:+A7B@pF`2A5
+:SZtF?MZ-?!q2PCiOT9FCd]i8OccQ:(7O>$;No?.V3L.A7]^kDId<rFE7lu              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.3+>P&q+>Pes2BXh8+?(E#1E\Y"1b^%3+>bks2]st6C2[X"@;0U%8l%htA8,OqBl@ltEd8d;
CghC+C2[WnDdm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3
F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u
+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a
:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2Bl@l3De:+?C2[W3                             ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 compjBasic delBasic001 dpsetBasi'
zz=:zz,'c01 globsBasic001 grplitBasic01 putNameTimestampsBasic00 restdBasic'
zz=:zz,'01''),(<(<''jodcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._'
zz=:zz,'1 '' jodsmoketests didSmoke00''),<(<''jodstresstests''),<0$a:          '
zz=:258{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o1E\D-1c9#dA7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPk
F(o,,8l%htFCfN8F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MW
ATMs.De(ON+CT.u+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/
:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z
1+==oC2[X)ATMs)E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@lt
EbT*+3ZrKTAKZ)+F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sC$F`&=GBln#L
%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn:-pQU+<YT5+?MV3C2[WnATf22De'u5
FD5Q4-QjNS%15is/g)8Z1E^^[F<DrGDe*<cF(o-+ATMs7-OgDX67r]S:-pQU@rc-hFCeuD+>PW)
2f<PW1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@:Wn[A0<:<Dffo:AStIYF*)IW0JP"!FDi:CF_Pr/
%15is/g)i,A7]7*1*C"9A7]9o-tI439jqOPDcC:mFE8lRFDi:CF_Pr/+>"^878m/g5tt'B;E[&p
%15is/g)i,A7]7*3?T_\Bk0P=F(o,<0JP"!@:Wn[A.8l@67sB73,`;K0K1+rF`MA6DJ()1DBO.:
Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FGATMs7%15is/g)l'DJs\Q3$<?_A79RkA0>K&
EZdtM6m+093A*-=+EV19FD5W*%15is/g)l(C3=>H2'?UME,ol?AKZ#9DBNY2F*)GF@ruF'DK?6o
%15is/h1CCE+NotASuU2+>"^XATMr9De:+?B4PRmF"&5DDfQtAF_Pr/+D>=pA7]cj$<0Gm<)>kY
9e\:b3\V!M<(0_b=[>bV78c90<(0_b:dIuR0JO[m+<Ve%67sC%ATT&:D]gbWAoD]4@;Ka&D.Rd0
@:s.m%15is/h1FMA7T7jASu$iDKKq/$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''-u*[2FCfN8
ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>+0RGSuDe't<-QjNS+<VdL+<XEG/g+Y?Df]J4@;^?5
DfB9*+Co1rFD5Z2@<-'nEt&I?0RI_K+=D8BF*)/8A2#AR+<XEG/g,(OASrW3FCB&t@<,m$;FNl>
=&MUh73F"#ATMs.De(ON%13OO-oiG31bgF%0d%T667sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5
Bl@l3Df-!k%13OO                                                           ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1E\M4+>GYp1c?I21E\P6+>GYp2)$.-1a"Y0C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7
+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7@rc^5BHVD.F*)IG
/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A8G[pB4Z0rF*)J>@<-!l+D,1nF(o*"
AKZ)+F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W2pF`\a<ARTXo@VfTuA79RgC2[X(D/X3$FCfN8F)u2:
CLnW1ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'6+De*p2Eb0<5FCfN8
F)uGDATMo8FCfN8F!*%WFCfN8F!,[@FD)e5@<-!l+EVNEG%G]>+DbJ,B4W2r@<>o          ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
<)6:`;cZU\+A,Et<_Yt):I7NN;aWiM73GAm7TEAS6V^T':I7NN;aXAN=<LR3;cHmc9he&S+Cf>,
E,oN2F(uh1ATVg3F*(i-E$/t0+E2IF@;Kb%F!,L?+EDRG-RgSp4?P\X?SNZN+Cf>,E,&<gDeio<
0HakDD/a5gD/X3$0JO\\Bk1.ZDeio<0HanDCf>1hCLo1R+E_X6@<?'qDe*BmF*)G:@Wcd,Df-pO
/1<VC4"akp+=A:HDe'u*De*Bs@N]E(A8PajAKY`+A92j2Eb-A.De*s.DesJ;C2[X*FD5P=.4cl0
4?G0&0d%hdC2[Wl@<6-mFCfN8F!,49A7KY&F(fZ,F*)IGC2[X!@<-!lFCfN8F!,49A92U+CLqU!
F*)IGC2[X(FE1r6F*(u7FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP
84c`Z:Jt=<@WcC$A86$nBkh]3BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DkP&AO9gHBk'b26r[`=
FE8RA@;BFQD/X3$8l%iSATMs7+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCpt
FD>`)F)Q2A@q@#:/1<V9+>G`!1,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_[!>2D[9I0f1jJ1*A>+
0f:XD0JY7=1H.'D1cRBK+>PW*2)$sC1+kI@2_m-E1b^a/1,(F?0K1[@/iGLE1,1XB2)cX50JPF=
2_d6D1H7*K3&NEL2'=Y.0f:XD0fL^A0K(mG1c-sB+>PW*2)$sD2_HmG0f_6N0K1a01,(F?0K1aA
/i,CB1,q0H1cHO40JPF=2_d6D1H76J3ArWQ3$9t10f:XD0K(O?1c7'L1-%3H+>PW*2)$sD2_HpE
2E<ZU0f:m41,(F?0K1[@/iGOB1c$pA2E2g70JPF=2_d6D2)7*N2Dm0J+>PW*2)$sD2_HsC2`3BO
1c7*41,(F?0K1aA/i5IF2_d<H2DZI20JPF=2_m*?1c@9O0f^pG1E\G,0f:XD1,1C<2E*QL3A<?I
+>PW*2)$sE0eP:@2`EKO3B8r>1,(F?0K1aA/i5IF2_m'D3B&'90JPF=2_d6D1H7*K3&NEL2'=Y.
0f:XD0fL^A0K(mG1c-sB+>PW*2)$sD2_HmG0f_6N0K1a01,(F?0K1aA/i,CB1,q0H1cHO40JPF=
2_d6D1bgmJ2E!<N2'=Y.0f:XD0K(O?1c7'L1-%3H+>PW*2)$sD2_HpE2E<ZU0f:m41,(F?0K1[@
/iGOB1c$pA2E2g70JPF=2_m*?1c@9H1,h-J0d&5*0f:XD0fL^B1,h'H3A`TM.4cl01*AG"1,(F?
0K1^F/i5@>3AifU2E;m80JPF=2_m*?1c76I1GUmG1a"P-0f:XD0KCaC1GCdG1GUsM+>PW*2)$sE
0J5:A1G_$N2Dd<71,(F?0K1^D/i5:C0JtjM0f'q-0JPF=2_d6D1c7-K0JtjM1a"P-0f:XD1,1C<
2)mQT3A`QK+>PW*2)$sC3A*0F1bggI0JGC-1,(F?0K1a@/iYOF3&*0H0Jst.0JPF=2_d0B1bh!E
2*!WN1FXk'4>J$;,Vh&.2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA1-%*M2)-4/0JPF=2_[-B
1c@0E0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K1Gq*61,(F?0K1[D/i5IF
0f^sB2`Mp80JPF=2_[-B1c73M3&WNJ3$9t10f:XD0K(O?2)@!J1-%3H+>PW*2)$sC2D-gE1b^X@
0JYR01,(F?0K1[D/i5CC2D[$G1,g=20JPF=2_[-B1c@6G2E3KM2]sk00f:XD0fL^A0f(aD1,C^E
.4cl01*AG"1,(F?0K1[G/i5FE0fUsF2)cX50JPF=2_[6E1c7*H0JYXE3$9t10f:XD0KCaB2)I!I
1c[QV+>PW*2)$sC3A*-G1H@6K2`3E71,(F?0K1[G/i5FB1,(^B2DZI20JPF=2_[6E2)@$D2`E]R
3$9t10f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH3B9)B1,(F?0K1[G/i>FC2)7*G2E;m8
0JPF=2_[6E1c7*F0KCgF1FXk'4>J$60I/D-0f:XD0JY7=1H.'E1GCgD+>PW*2)$sC1+kI@2_m-F
1H@H<1,(F?0K1aA/iG[D1c%'L2`W!90JPF=2_[$?3B/uU3&E?I1E\G,0f:XD0Jb=A3B&iO0ebI?
+>PW*2)$sD0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g70JPF=2_[!>2D[9I0f1mM3$9t1
0f:XD0JY7=1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPF=2_m*?1c@9O1,h-I0d&5*0f:XD
1,1C<2E*QN0JGCE+>PW*2)$sE0eP@D0fV-J2DlU40JPF=2_d6D2*!BM2`NfV0d&5*0f:XD0Jb=A
3B&iO0ebI?+>PW*2)$sD0J51<0JY==2Dd-21,(F?0K1^?/i5:@2)$gC3&Mg60JPF=2_m*?1c@9O
0f^pG1E\G,0f:XD1,1C<2E*QL3A<?I+>PW*2)$sE0eP:@2`EHO0K(^9/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
