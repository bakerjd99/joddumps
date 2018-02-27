NB. JOD dictionary dump: 27 Feb 2018 15:49:32
NB. Generated with JOD version; 0.9.993 - dev; 5; 28 Jan 2018 15:09:28
NB. J version: j806/j64/windows/release/commercial/www.jsoftware.com/2017-11-06T10:03:54
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


b36fd=:36x&#.@('0123456789abcdefghijklmnopqrstuvwxyz'&i.)^:_1

b36guids=:'_>`' ,"1~ '`<_' ,"1 [: b36fd guidsx

guids=:3 : 0

NB.*guids v-- create guids as 16 byte strings on supported J systems.
NB.
NB. This verb taken from ~addons/general/misc/guids.ijs returns guids
NB. on Windows, Linux and Mac systems. 
NB.
NB. monad:  guids zl | ilShape
NB. 
NB.   guids ''    NB. create guid as a 16-byte character string
NB.   guids $0
NB.   guids 3 4   NB. create 3x4 array of 16-byte strings

NB. standard J profile !(*)=. IFWIN UNAME
if. IFWIN do.
  cmd=. 'ole32 CoCreateGuid i *c'
else.
  cmd=. ((UNAME-:'Darwin'){::'libuuid.so.1';'libSystem.B.dylib'),' uuid_generate n *c'
end.
>{:"1 cmd 15!:0"1 0 <"1 (y,16)$' '
)

guidsx=:256 #. [: x: a. i. guids

tagtodo=:3 : 0

NB.*tagtodo  v-- tag items in  TODO section  with  case insentive
NB. base 36 guids.
NB.
NB. This  verb  parses  the  text   between   `[begin-todo]`  and
NB. `[end-todo]`  in  markdown  TODO  files and prefixes untagged
NB. items with base 36 representations of GUIDs. The intent is to
NB. produce a stable key for each task on the list.
NB.
NB. monad:  clTagTodoText =. tagtodo clTodoText
NB. dyad:  ?? hashtodo ??

NB. preserve any preamble and suffix
bdo=. '`[begin-todo]`' [ edo=. '`[end-todo]`'
if. -.(+./bdo E. y) *. +./edo E. y do. y return. end.
pam=. bdo beforestr y [ sfx=. edo afterstr y

NB. extract item text
t=. '`[end-todo]`' beforestr '`[begin-todo]`' afterstr y
t=. ];._2 tlf t -. CR
t=. (*./"1 ' ' = t) <;.1 t

NB. all blanks
b=. 0 = #&> (,&.> t) -.&.> ' '
if. *./b do. y return. end.

NB. strip redundant blank lines from nonblanks
q=. I. -.b
t=. (rebrow&.> q{t) q} t

NB. guid tagged
g=. +./&> ('`<_'&E.)@,&.> t
b=. b +. g
if. *./b do. y return. end.
t=. ctl&.> t

NB. collect item numbers and following text
q=. I. -.b [ c=. '. '
r=. c&beforestr&.> q{t [ s=. c&afterstr&.> q{t

NB. should have only positive integers
'markdown item syntax invalid' assert 0 <: _1&".&> r

NB. tag untagged nonblanks
u=. r ,&.> (<c) ,&.> ,&.> (<"1 b36guids #s) ,&.> ' ' ,&.> s
t=. u q} t

NB. insert one blank line between items and return text
t=. }: , t ,. <2#LF
;(<pam),(<bdo),t,(<edo),<sfx
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*ALu2*#beB68'&DffE#+DGq/D0$h6DBMnS6r+qHARfgrDf-\ABln#2@psFi+DG_7ASuU(
G%De*@<6!&1H$@gF_PB-                                                      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f'q,+>Y,p3?U("1,h*G6?R!YA5d>fB2*)\Ec5u*FEhm_2*uG"Ch+YsDIaka@;0V$@;0U%@;[2`
DJX$)AKXQ]@:s-o9keWgDfQ9o%15RCEZfX=@<-E38K_\TG%De*AS#a%@<?U"@q]RoB-:\mE-,f4
DK@?OA79RkF"AGLAU/K<Eb'5B+CT.u+Dbt+@<?4%DK?qBD]inB+E).6Bl7Jk$?0]hFEMV8F"SRX
6t(1KF!+n/A0>],@psInDf0V=@<,p%FEqh>@ps1iGp$[8@V'(\ARlotDBNY1@:s-o79E,N01eu>
6Qg)\AoD^,@<?4%DCuA*87c[KALnrq+D>2,AKYMlFCfM9@;]TuCi<flFD5Z2F!,OGDfTE"+E(k(
Ch[cu+DG^9D0[7CBk)7-Eb0;7A8-'q@ruX0Bk;?<+A!\kAS#fi$>jp%FD5]1AKYK$E+rm)+E(j7
D0[7CBk)7-Eb0;7Df-[t;aMU;EbT].F"SS6Df'&.De:,6BOu6r+CoM,G%G_;@<,p%F*)>@ARlot
D@HqoARfk'AKZ,5A8-*pCi=B+A0>],@psInDf0V=@V'%XF`V+:,'e*L-ZWc@ASH7"ATAo&@:O(a
A0?#6+E)9CAp%U!ARlp+E$6D7$4R=d6Xb"H+EVNEB5\o2G%G\:FD,5.DfBf4Df0V=@:s"_DKA#d
%13OO<+ohcF(&os+DGm>DJsV>FE2M8+E(j7@ps=uBl@m1+CT.u+DYP6GAhM4F"SS,DBNt2@qBP"
+F.O,EcW@?Gp$U*E-,f4DK?q6@<Q3)ATi!.G%G1n$>FC"D]iI2AoD^,+E(j7D/!g&BjtmsB4kpr
B.b<+D]iOuE--5CAKYE!A0>_tBl8$$Bl5&%Cht59BPDN1Bl7O$Ec#6,Bl@l38K`(r@<-I$A.8lV
AThX$DfBE.B-:V*F(KB+ATJu4Afs]gE-ZP:EZf7<FCep"DejD:@;]Tu:jI.rDf-\=@rc:&FE8RH
BOQ!*Bl8$(Ea`I"+EqOABHVD1AISuFD09JcF_;g_:e<8^8K`(cFED>1A0>f.+Ad?*BQ%c2@V'%X
F`V+:Blk_D+CQC9ATE&=Eb/Zi@:F%a+CfG1F)rICCghEtDfT\G+E)41DBO"=F`Lu'/0JPFAS!D%
$?1$(B6%EtD/!m#+DbJ(B6@WqAKZ22FD)e.G][M7F(of/+Dbb$Eaa!&ATKIH8T#Yi@<-I(@s)Tr
E\&>IF<G7*F!+n/+D#e-ASc0oDKI"!78m.p$:.K[+Dbb$Eaa!6+EV:*F<G4:ART[sGp%0BD/a<*
Anbgt+EV:.+E)./Ec6)A+Cf)'Eb-@k78m/.5u:,qE,ol0Ea`g%Bl7Q9%13OO8K_GY+EqC5C`mG0
FDi:2F_PZ&Bl7Q+D0[7BDJX$)AKYi(EcQ)=+Co2,ARfh#Ed98[=(l/_+Cf>,E,9*-AKXPeGA1l0
+D>2,AKYE!+D"u&Bl&&;D..-rFCAm$ARl5W@;]TuG%G]8Bl@l3@rH7,Ec5c1ARlooBl[cpFDl2F
+E(jQ%13OO0eOS?D..'g+Dk\3@:Weg@3A,a@psCh+CS_tF`]/WBeEsL/0H'F@;p=&Df0VI+Cno&
ATKCF7o3,,@rH:+A8,piFCfME+DG\$B4W2rBl.F!F(oQ1F"AGBDIal2D]iY1Ecbt;F*)>@ARlot
DBNM!F(oH9%144#+ED%%A0>;uA0>Q"B4u+,+CoV8@:F%a+B1Wn+Co&"Bl.R+ARlp*AU&;>Anc'm
F"Rn/+<Vd9$8O4V;IsffATMF#FCB9*G%De<BQ\0$DII6q+DG\$B4Z-,De:,7E,9H$A7]9oE+rg(
F`M&7/g*_.@;R-+Cgh4!Bl7Q+Df-\.Dg-)8Ddd0jDJ()#DIal,@;0V$@;0UnDJ'Cc+<VeJD..6s
+Eh=:F(oQ1F!,C5+DlBHF`;/8@:Wq[+DG\$B4Z-:+A$Z&F!,UCDIm<fATMp$Ed8dLD]i\(F<G[=
AKYT-Cht58BmO>5G%G]8Bl@m1/g*_.BOQ'q+EV:.+E):7B5)6lCi^$m+<Ve@DBNeA+E2%)FEMV8
+Co2,ARfh#Eb0;E+@pEpAThX*/0K%JAKZ&2@;Ka&Bl.9kATJu<Bl%T.@V$[)F(Js+C`m>.EZf(6
@r-9uBl7Q+Bl5%e@8pf?+CoD#F_t]-FE8uB$6UH6@rcL/F!,L7An?!oDI[BuB-;D4FD)e8EbT0#
DII@&/0JA=A0>B#D/aW>Bl7Q+A8c=!DIIF)+Cf>+DfTnO%13OO1G0e9+CoD#F_t]-FE8R6Ea`iq
BHVD1@<<W9Bl%T.@rH7+Des,u@<?''Bl.9kAKYi$FCA]gFC?;#DIal2D..6s+DG\$B4Z-,Bl5&%
+D,%rEbp"D@rH4'BQ@ZtASuR'G%D*i+<Ve#@8pf?02P&++CoD#F_t]-F=n[Y8K_McEcP`/FDQ4F
BOQ'q+E)F7EZd1i1,(C)Bl.9kATJu4DBMkpF_=EkB.b;u+D#e:ARfg)FD,B0+CoD#F_t]-F<GdA
ChsOf+<Ve9AKYZ/DIdd!A90:EE+O''@;p91FD,T8F(&rsF"AGPAfu&$B4Z-,Ci=3(+EqL1DBNG-
D/a3*ARmD97<W6[FEM#.Cj@-p+EqO9C`m\;Bl8#8FD,B0+DkP/ATDKnC^g^o+<Y*6+CQC*Df9//
Derr,AmoaoBl@lt@VfTuCi=3(/S'!E@<?4%DCoC;@s)X"DKI"1Df9DD%13OO1bKn:DBNM6DesT2
DJ()%Ec6#?+ED%*ATD@"@q?cn@<>pe@<6!&FD,*)+EqO9C`mP.DJLA3Bl\64EZf(5@:s.m+EqOA
BHV56BkM-t@;L!;+A[/lEZfI;AKZ80@<-Du$6UH68K_\TG%De:AStpnARlp#@;^?5De:,6BOr;u
Bl%@%+A!\uE,9H$A7]9oFDi:?DJX$)AKYr+@ruj6AKZ&.FCfMG+A!\dBk/?.BPDN1@V'%XF`V+:
;f-Yi9m((X$6UH6E+*d.ATJu+Bl%?'DIIBnF!+n/A0>H.FE1f"FE8R9D.7'eA7]9oGAhM4F!+n4
+DYP6GAhM4F"SS6D_*#FAfuA;FWb@+G%De/Df9//Anc'm+DtV)ATJu>DflKr+<Ve>ATT&*ARf:h
F<G@1H$=1IA9/l*DfQt4Eb/f7+<X5u@;L"'+ED%2@;TRd+D,>(ATJu9D]j">DffQ#F<GO6DfBN(
F!,@/D.Rc2@;]TuFDi:6Bm:bBBOqV[+<Ve8G@ku6+D,>(AKYl!D.Rc2A8,[jFCAu.@ps4cEaa#3
@;]TuF(8WrDImj0+D58'ATD4$AM,**DJ!g-FEMJ0FCf96/0JA;C`mh5BlbD;AStpnBl7Q+BOPrk
$6UH6D.-sd+DGp?A8,XfBk):%F<G[D+EVX4@q?ckDBNk8Ch[cu+DG\$B4W2p@:O'qFDi:9FE8RC
EbT0#DII?6+B3#c+<Y07Df]tBEb/ioEb0,uAISth+<YlBCht58FCB33+Dbb0CM@[!+E).6Bl7K)
Bl.9kATJu9D]j.8ASH0-F)Q2A@qB^6+<Vd9$6UH6%13OO%13                          ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' todo CR LF afterstr assert b36fd b36guids beforestr ctl g'
zz=:zz,'uids guidsx rebrow tagtodo tlf''                                    '
zz=:98{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QlkS2J-JB@P]oTF_PB-+D5h2A9/l+F_PB-GT_*:B68'&D^Qtb-p01/0I\P$
4=iTBFDk].-RgSp4>8$7.4cl0/3G:HF_PZ&;f-Yi9keWgDfT3,G]Y;^/1<V;+>P2t0JPO@1,:d@
2).*I2`WiU1*ACr1,(FB0JYCB/i>IF2E*?I2E;m7+>PW*3&!*C2_HsB3AWTS3&WN71a"P-0fUjB
1,ggD1,q$L1,q!F+>G;r-p01/0I\P$4>JTF3&!*C2_I!D3A<?L1,1U90J5%50JbU@3B&`K2`WZN
0JbUB2)Qjt/i"P(.4cl00I/>$/1<V90JPO@1,:O92E<ZO1cI<M.pk%c0fUjB0fUdD3ArZM2`<NC
BeD+_1+=b&4>A99-p014/1<V7.4cl00I\P80`                                     ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
