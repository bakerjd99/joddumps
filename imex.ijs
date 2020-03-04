NB. JOD dictionary dump: 04 Mar 2020 11:02:59
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


NEWSMUGPYTERSIZES=:<;._1 ' 2x2 2x2.5 2x3 2x4 2x5 2.25x4 2.5x2.5 2.5x3.5 2.5x4 3x3 3x4 3x5 3x7 3x9 3x12 3x15 3x18 3.5x3.5 3.5x5 4x4 4x5 4x5.3 4x6 4x8 4x10 4.25x5.5 4.5x8 5x5 5x6 5x6.5 5x6.7 5x7 5x8 5x10 5x30 5.5x7 5.5x8 5.5x8.5 5.5x14 6x6 6x8 6x10 6x12 6x14 6x15 6x18 6x24 6x30 6x36 7x10 8x8 8x10 8x10.6 8x12 8x16 8x20 8x24 8x32 8x40 8.5x11 9x12 9x15 9x16 9x21 9x36 10x10 10x12 10x13 10x14 10x15 10x16 10x20 10x25 10x30 10x40 10x60 11x14 11x16 11x17 11x28 12x12 12x15 12x18 12x20 12x24 12x28 12x30 12x60 14x20 15x18 16x20 16x24 16x32 18x24 18x32 20x20 20x24 20x28 20x30 20x40 24x36 30x30'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


sizekeychanges=:3 : 0

NB.*sizekeychanges v--  images with  size  key changes when  size
NB. list changes.
NB.
NB. Note: this verb  is  similar to (resizekey) but  looks at all
NB. images not just the ones with  (NOPIXELSKEY, NORATIOKEY) size
NB. keys.
NB.
NB. monad:  sizekeychanges clDb
NB.
NB.   trg=.  'c:/smugmirror/documents/xrefdb/mirror.db'
NB.   sizekeychanges trg

NB. the new list must contain sizes the old one doesn't
'no new size keys' assert 0 < # NEWSMUGPYTERSIZES -. SMUGPYTERSIZES

NB. !(*)=. OriginalHeight OriginalWidth OnlineImageFile Keywords
d=. 'select OriginalHeight, OriginalWidth, OnlineImageFile, Keywords from OnlineImage' fsd y
(0 {"1 d)=. 1 {"1 d

NB. new and old size keys
ns=. (SMUGPRINTDPI;SMUGASPECTROUND;<NEWSMUGPYTERSIZES) sizekey OriginalWidth,:OriginalHeight
os=. (SMUGPRINTDPI;SMUGASPECTROUND;<SMUGPYTERSIZES) sizekey OriginalWidth,:OriginalHeight

NB. where they differ
b=. ns ~: os

NB. changed images
(5 s: b # os,.ns) ,. b # OnlineImageFile,.Keywords
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;.+>klpBmO?+AU.d!@;]^hF(oK"B4Z-,GA2/4+EM7CAKYc"Gp$U1@;]^hF!,[?ASrW3
BmO>5Ch[s4+Cf(nDJ*O%                                                      ~>
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
1E\P#-p0UR/mg=U-Ql/Q=&Vgn7o3>f78d&U>")@4F(or3CLqd$BOPdkATK4J/1<V7,VUYu-p0%C
-W4MsBmO>`AU/>E.4cl00I/>$/1<V7,VUYu-p07-1*eV/1,(C<0JkC=0Jb[B2`<EO+>PW+0JG::
1bLUA1Gq-J3&EB51,(I;0JbC>/i57<3&!9L1-$I40JY=91GCX<1c7-I2`<BN0e"Y%4>8$7.4cl0
1,(I;0JbC>/i5FA2)[EM2)m*n1,(I;0JbC</i5FA2)[EM2)m("/hnJ(.4cl00I/>$/1<V7,VUYu
-p014/1<V7.4cl00e"Y%4>8384>6                                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
