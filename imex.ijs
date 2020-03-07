NB. JOD dictionary dump: 05 Mar 2020 10:58:23
NB. Generated with JOD version; 1.0.1 - dev; 5; 12 Feb 2020 10:06:07
NB. J version: j901/j64avx2/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:17:19
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|262210418022445021663373283974631637170|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


SMUGPYTERCOLORS=:<;._1 ' 0_aliceblue 0_antiquewhite 0_aqua 0_aquamarine 0_azure 0_beige 0_bisque 0_black 0_blanchedalmond 0_blue 0_blueviolet 0_brown 0_burlywood 0_cadetblue 0_chartreuse 0_chocolate 0_coral 0_cornflowerblue 0_cornsilk 0_crimson 0_cyan 0_darkblue 0_darkcyan 0_darkgoldenrod 0_darkgray 0_darkgrey 0_darkgreen 0_darkkhaki 0_darkmagenta 0_darkolivegreen 0_darkorange 0_darkorchid 0_darkred 0_darksalmon 0_darkseagreen 0_darkslateblue 0_darkslategray 0_darkslategrey 0_darkturquoise 0_darkviolet 0_deeppink 0_deepskyblue 0_dimgray 0_dimgrey 0_dodgerblue 0_firebrick 0_floralwhite 0_forestgreen 0_fuchsia 0_gainsboro 0_ghostwhite 0_gold 0_goldenrod 0_gray 0_grey 0_green 0_greenyellow 0_honeydew 0_hotpink 0_indianred 0_indigo 0_ivory 0_khaki 0_lavender 0_lavenderblush 0_lawngreen 0_lemonchiffon 0_lightblue 0_lightcoral 0_lightcyan 0_lightgoldenrodyellow 0_lightgray 0_lightgrey 0_lightgreen 0_lightpink 0_lightsalmon 0_lightseagreen 0_lightskyblue 0_lightslategray 0_lightslategrey 0_lightsteelblue 0_lightyellow 0_lime 0_limegreen 0_linen 0_magenta 0_maroon 0_mediumaquamarine 0_mediumblue 0_mediumorchid 0_mediumpurple 0_mediumseagreen 0_mediumslateblue 0_mediumspringgreen 0_mediumturquoise 0_mediumvioletred 0_midnightblue 0_mintcream 0_mistyrose 0_moccasin 0_navajowhite 0_navy 0_oldlace 0_olive 0_olivedrab 0_orange 0_orangered 0_orchid 0_palegoldenrod 0_palegreen 0_paleturquoise 0_palevioletred 0_papayawhip 0_peachpuff 0_peru 0_pink 0_plum 0_powderblue 0_purple 0_red 0_rosybrown 0_royalblue 0_saddlebrown 0_salmon 0_sandybrown 0_seagreen 0_seashell 0_sienna 0_silver 0_skyblue 0_slateblue 0_slategray 0_slategrey 0_snow 0_springgreen 0_steelblue 0_tan 0_teal 0_thistle 0_tomato 0_turquoise 0_violet 0_wheat 0_white 0_whitesmoke 0_yellow 0_yellowgreen'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


colorkeyfreq2=:3 : 0

NB.*colorkeyfreq2 v-- frequency of color keys in mirror database.
NB.
NB. monad:  bt =. colorkeyfreq2 clDb
NB.
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   colorkeyfreq2 trg

NB. fetch all key frequencies from (mirror.db) 
(0 {"1 d)=. 1 {"1 d=. 'OnlineKeyword' fsd y

NB. only color key frequencies !(*)=. Keyword KeyFrequency
k=. Keyword #~ b=. Keyword e. SMUGPYTERCOLORS
f=. b # KeyFrequency

NB. insure keys sorted by desc freq
k=. g{k [ f=.g{f [ g=. \: f

NB. cummulative frequencies againt unique image total !(*)=. ImageCnt
(0 {"1 d)=. 1 {"1 d=. 'select count(*) as ImageCnt from OnlineImage' fsd y
k ,. <"0 f ,. 100 * (f % ImageCnt) ,. (+/\ f) % ImageCnt
)

printkeyfreq=:3 : 0

NB.*printkeyfreq v-- frequency of print size keys in mirror database.
NB.
NB. monad:  bt =. printkeyfreq clDb
NB.
NB.   trg=. 'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   printkeyfreq trg

NB. fetch all key frequencies from (mirror.db) 
(0 {"1 d)=. 1 {"1 d=. 'OnlineKeyword' fsd y

NB. only print key frequencies !(*)=. Keyword KeyFrequency
k=. Keyword #~ b=. Keyword e. SMUGPYTERSIZES , NOPIXELSKEY;NORATIOKEY
f=. b # KeyFrequency

NB. insure keys sorted by desc freq
k=. g{k [ f=.g{f [ g=. \: f

NB. cummulative frequencies againt unique image total !(*)=. ImageCnt
(0 {"1 d)=. 1 {"1 d=. 'select count(*) as ImageCnt from OnlineImage' fsd y
k ,. <"0 f ,. 100 * (f % ImageCnt) ,. (+/\ f) % ImageCnt
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o2'=\4+>GYp1bp1.1*AD4;b^7^:g$ad;F=5R:Jt,$Des?4+DYP6F!,UHARlomGp#q/
FD,T1+EMCBB5i-<ATD:!Ci=?0AU.m.AT9J;Eb065ASu"'+E(j7@rH1%EZf./H#k*BDBNe1EcQ)=
+Cno&@:EYdAT2[(DKKZ*H"M).EFs6&EHPi1@sK28Afu&5Bl8#8F(or3+DYP6F!,17+Dkh5Ec5t@
A79Rg@UX=h                                                                ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' ResizeKeys NEWSMUGPYTERSIZES NOPIXELSKEY NOPRINTKEY NORAT'
zz=:zz,'IOKEY SMUGAREAROUND SMUGASPECTROUND SMUGPRINTDPI SMUGPYTERSIZES ass'
zz=:zz,'ert charsub dpiarearatio fsd lastones printsizestable resizekey rou'
zz=:zz,'nd sizekey sizekeychanges sortprintsizes''                          '
zz=:242{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&o0H`2/0N)J'BmO>`AU/>l67s`cATMR3AP6T[F!,NU/Kf1XBl%i5F`V,)+EqL1DBNG&
@;]^lDJ()2EbTE5+EM7CAKYc"Gp$p;F*'#A:-pQ?:-pQU8K_\TG%De;Ci=N6Gp"5DDI[]u@<6!j
+EV:.+Du==@V'R&De:,2EbTE5+DYP6F!,UHARlomGp%3BAI;1!/g*u9FD,T1+=M;JF_>Z=FCfJA
+E2@>B6%Et/g)9<BOu'(FD,5.F(or3+<YK7F*&O7BOPdkATJu8Df'%m:-pQUAU%p1FD5W*+<YH2
H#k)N@q]:gB4W\<+B3#gF!)T<Ec6)>+D>>&E-!-EAnc-nF!)T>D..'gF!)T>D@0-*/g)QZBl\64
E\:m3.3N_G@<<W0AS#BpBl8!2ARfgrDf.07:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g+YEART[l
A3(hg0JY>!@<+%Y$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O]$?B]tF_Pl-+=C].FC?hDEGT?2AL@f                    ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-Ql>^<C]kg<(0\P:J=P^;]oRgCi=?0AU.m.AT9IJE,oZ1FDGH5Ao_I&-RgSp
4>8$7.4cl0/3G:XATMR3AP6T[F!iCf-p01/0I\P$4>8$7.4cl01*A@u1,(I;0JbC?/i5FB2D[0L
1,g=20JY=91GC[=1c.0M1,1I<+>PW+0JG::2(g^A1c7'J3&i$90JY=91GC[=1c7*J1Gh'H2]sk0
1,(C<0JtI>2)I0I3&NNI+>PW+0JG::2(g^A1c7'J3&i?<-p01/0I\P$4>JTG0JG::1bLUB1Gq'M
1Gq-B?SX;j0JG::1+kC@1Gq'M1Gq-ABeD+_1+=b&4>8$7.4cl00I/>$/1<V7.4cl00I\P$4>A99
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
