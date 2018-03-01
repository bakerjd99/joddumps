NB. JOD dictionary dump:  1 Mar 2018 16:05:25
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
NB. 
NB.   todo=. read 'c:/mp/jupyter/smugpyter/todo.md'
NB.   tagtodo todo

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
msg=. 'markdown item syntax invalid'
msg assert 0 < #&> r;s
msg assert 0 <: _1&".&> r

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
0eje*+>P&o2BXb01,X/^B68'&DdQs^F(o,k0JH6g/h1sOB68'&DdQs^F(o,k0JFVj/M/)S@<6-m
+=M>?B68'&D^cfNATMs7/e&._67sAi$;No?+CfG'@<?'k3Zp130fWcV@PTkO$;No?+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/Os%13OO:-pQUASlC.Gmt*.-Qk!%+EV%)FDk].+=ANG$4R>;67sBuD]iM#B5)6+
ASu$$FCAg'%173%F?MZ--Qm;FF<G%<+EV:.+D>1tEZf:4+DlBH@q]RoDL!@7BPD?,@q]Ro-OgE)
G]Y&[3ZrNQB68'&D]j.HF:AQd$;No?+E).6Gp%$CAKYMpCh[a#FCfJ%$?UN74ZX]5FD,B0+DGm>
F)N1/>@h\_/TboADd?`nGB.V>B.",qFEhmM/NP"r@:s\#A8`T4G]XB%%15is/g+\9Ch[a#FCfK6
+CSeq@:NkdF:AS!G]Z)0+=CQ$@V'1dDCosKA8ba]?s@2[A1_nAA8ba]-OgE)G]Y&[3ZrNQB68'&
D]j.HF:AQd$;No?+>b2m+Co&"Bl.R+ATDi7@Wcc8DJpY>AU&;+$?UN74ZX]60H`D!0I[G<%15ZL
A8`T7BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT*r$4R>M>@M/VBl5MEDe*cl?k!GP$4R>M
>@h\_/TboADd?`[$4R>ABOu3q+CT;%+Du*?Blmp'F!,RC+EV%)%13OO.1HW+G]Y&[3ZrNQB68'&
D]j.HF:AQd$;No?+CT)&+DGq/D0$h.CiX)qA9f;>@:s4aA.8lfG]Z)0+=Jod3Zp+*%13OO=(NL_
Eb-A%CiX)qA9f;>@:s4aA0>;uA0>r,Dfol,+Du+>%16QU+CT).ATD?m/g(T1%16KI@V'1dDCosK
A8ba]%13OO0eOSV4C9mi0Q^i=H"D%T0K=;7B6nf53&=uU12CW35%#KU@s)g'+Ceht@qBZi$4R=O
$8O4V?p%dTFuaY_B6[i>GVX"mCc4"VBQRrKDfL%W?Tqj?+EqaECh+Z-ART([%13OO?s@2[A1_nA
A8ba]%13OO6tp0SH#IgJFDl;3BHV/'59N^>FCcS:BOr;tG][t7+C].qDJLA2Bl7Jk$7QDkFEhmM
/NP"r@:s\#A8`T4G]XB%%15is/g+\9Ch[a#FCfK6+DG^9GB.V>B-;,5A7]cj$?UN74ZX]60H`D!
0I[G<%15ZLA8`T7BOQ!*8K_P^+C\nl@<HX&+A!\aD'4%9@<<V`+CT*r$4R>M>@h\_/TboADd?`[
$8F.UE-626AKYr'Df0V*$4R=t/g+VGGp$R1FCT6'DK?6o?s@)OB5)68FDk].?!n*K%14Nn$?UN7
+>#VsFCAg(De*c/FEhm:$4R>;67sBkASc'tBlmp,F!,17+EqjEDJ()1Eb&a%+>"^RD]j.5G]XB%
FEhmj3ZoeX>@h\_/TboADd?aY>@M/VBl5MEDe*cl?mcBjFEhmM/NP"r@:s\#A8`T4G]XB%%15is
/g,%M+C].qDJLA2Bl7L'+C\o(G@b?'+DGq/D0$-nFEhmj3Zoh)+?CW!.1HVU+CoC5GA(E,+A!\d
D]iM#@psM$AKXPe@;R-2BOQ!*8K_GY%16KI@V'1dDCosKA8ba]%14gB+CI<=@q0[pH=_,21im\\
F#@`E12p_]E&_lS2d\aV+ED%0ARTXk+:SZ5/g,7LAKYc/@;BFl%16KIASu$1FDk].?!n*K<+ohc
F(Jj"DIal(FCf;3BlbD7Dfd+D@:s4aA1e;u.1HW+G]Y&[3ZrNQB68'&D]j.HF:AQd$;No?+D,b4
Cj@.F@:s4aA0?)1FD)e7D]iM*@;]j'Ch[cuF!+q'FE_;-DBNY8ASlJt$?UN74ZX]60H`D!0I[G<
8K_P^+EqL-F<F-tA8`T"ARf.kF(HIc+CT+0GA(E,+A!\aD%-h[>@M/VBl5MEDe*cl?k!Gt/g+Oa
?XmShB6n-0Bf'mOG&oNVAMS472K1WrCc>]b?m'K$Ch7$rAKVEh1+j\W4C;YVF),Q$Ecc#>0P>*3
3GreI2g/nLFCoW%5%#LTBOr<%Ea``pD@Hq\>@h\_/TboADd?`[$?Tj(F<G:=+Du+>+CT).ATD?m
/e&.:%173%F<E.r+EV%)FDk].+EVjM%13OO:-pQUBl8*&Ch[E&DKTf*ATD?m+DGq/D0$gO+EV:;
Dg-7F@<6L$Ecc#6D@HqpG]Z)0+=Jod3Zp+*%17B!FWb@+G%De<D]iM#+E2@>E+O'+Gp%!ID.7's
ARlopBP7h^?s@)OB5)68FDk].?!n*KG^+Hc+E_R>F_tT!Eb/c(Blmp'%13OO2E!HG+EMHDF)N1F
Ec5i.%16KIASu$1FDk].?!n*K.1HV4FCAg(De*c/3]\B<3[l0oFEhm:$4R>;67sBpDK]H)Bk/?(
F_tT!Eb/c(Blmp'F!*%WFD,]5GB4m8F)to5FD5Z2%173%F?MZ--nlc)+>>5R$@-Q4+D>2,AKZ)5
+C\n)E,ol9ATDU4+Du==@V'RkA0>GsBFP;V>@M/VBl5MEDe*cl?k!HcDJjT6@V'RkA0>T.AShk`
F*),4C`mqBDf01s$=I(LDIb>@De*cl?k!Gl%14M*@:s\#A8`SO3Zp.<.3N_WF:AQd$4R=     ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>Y-#+>P&o3AaQ.;cI+GDe*cA0ht%f:et"h?Z^3sD]j";F*&ODEc5H!F)u8?/g(T1%17/n
Dfp/@F`\`[+?CW!%15is/g+kGFCfK)@:NjkGAhM4.!$gu%15is/g,7EB68'&D]g/t67sC&@:p]s
FCf<1+DG^9<)5nX+EM+(FD5Z2+EqOABHUenF(HJ.DKBB,FD5o0+C\c#AKWce+D5h2A9/1e.1HUn
$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=D8LA8`h)$4R=                         ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' todo CR IFACEWORDStodo LF ROOTWORDStodo afterstr assert b'
zz=:zz,'36fd b36guids beforestr ctl guids guidsx rebrow tagtodo tlf''       '
zz=:127{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ACr1c7:8De*c]67sa0De*c/F"JsdF`_>6Bln'#F!,(5EZf4-F)tc&Bl7Q+D..I#A8c[0
+B2-):EXIfF*)IU%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/(f+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+EV%)FDk].+<W6f+C].q
BHUc#@;$c++<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g+YEART[lA3(hg
0JPO]@<+%V%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P++:SYe$=e!aCghC++=D8LA8`h<%13      ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0%C-Zid0FDk].-RgSp4=iTBFCAg(De*cn@UX=l@p^oD-RgSp4=iTBFDk].-RgSp4>8$7
.4cl0/3G:V:K(5"FDk].-RgSp4>JTF3&!-B0eP@B1c-sC1H76B?SX;i3&!*J3A*3J1c-sC1H76A
BeD+_1+=b&4>JTF3&!-B0eP@B1cR3I2)R9B?SX;i3&!*J3A*3J1cR3I2)R9ABeD+_1+=b&4>JTF
3&!-B0eP@B3A<0A1H.$=0J5%50eb::0K:mG2D[<K1cI<J2C`Dn1*A;#/1<V7,VUYu-p07=0fUjC
0JP1<2E*KJ1,1LD.pk%c0fUjB3B8]M2E*KJ1,1LD.VULi+>PAs-p045/1<V8.4cl00I\P$4>838
4>?                                                                       ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
