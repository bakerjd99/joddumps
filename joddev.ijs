NB. JOD dictionary dump: 19 Dec 2020 15:09:22
NB. Generated with JOD version; 1.0.22 - dev; 11; 14 Dec 2020 08:52:29
NB. J version: j902/j64avx2/windows/release-a/commercial/www.jsoftware.com/2020-12-05T13:36:01/clang-9-0-0/SLEEF=1
NB.
NB. Names & DidNums on current path
NB. +------+--------------------------------------+
NB. |joddev|53396629426474297605411326776785356433|
NB. +------+--------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC formifacetex grplit ifacesection ifc setjodliterate uwlatexfrwords wordlit'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22 - dev';11;'14 Dec 2020 08:52:29'

JODVMD=:'1.0.22 - dev';11;'14 Dec 2020 08:52:29'

OK0256=:'jod.pdf not installed - use pacman to install the addon general/joddocument'

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit setjodliterate wordlit'

WRAPPREFIXTEX=:'\RegionMarkerTok{)}\KeywordTok{=.}\RegionMarkerTok{)}\KeywordTok{=.}'

jodliterateVMD=:'0.9.98';6;'02 Dec 2020 10:59:45 MT'

jodliterate_hashdateurl=:<;._1 '|70d39e3f637fcc6d047d151ac3a5c53111669ae5ab332eb6039d9ae596a0fd52|02 Dec 2020 10:59:45 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


abv=:3 : 0

NB.*abv v-- all backup version names.
NB.
NB. Returns all  valid backup  names  matching  name prefix  (y).
NB. Names are listed from most recent backups to older backups.
NB.
NB. monad:  (paRc ; blclBNames) =. abv zl|clPfx
NB.
NB.   abv 'ch'  NB. all words in all backups starting with 'ch'
NB.   abv ''    NB. all words in all backups
NB.
NB. dyad:   (paRc ; blclBNames) =. il abv zl|clPfx
NB.
NB.   2 abv 'jod'  NB. all group names in all backups starting with 'jod'
NB.   4 abv ''     NB. all macros in all backups

0 abv y NB. word default
:
if. badcl y do. jderr ERR002 return. end. NB. errmsg: invalid name(s)
if. (1 < #,x) +. badil x do. jderr ERR001 return. end. NB. errmsg: invalid option(s)
if. -.isempty y do. if. badrc uv=. checknames y do. uv return. else. y=. rv uv end. end.
if. badrc uv=. x bnl '.' do. uv return. else. bn=. }.uv end.

NB. names matching prefix in all backups
pfx=. (<a:) -.&.>~ }.@(x&bnl)&.> (<y) ,&.> bn
b=. 0 < #&> pfx

NB. return backup names from most recent to older backups
ok \:~ ;<"1@;"1&.> (b # pfx) ,"0&.> <"0 b # bn
)

createmast=:3 : 0

NB.*createmast v-- creates the dictionary master file.
NB.
NB. The master  file holds the  master  dictionary directory  and
NB. dictionary parameters.  The master  file  tracks the state of
NB. dictionaries.  In  this  system  only  one task  can  open  a
NB. dictionary read/write. When opening a  dictionary  the master
NB. file is  checked  to determine if  the  dictionary  has  been
NB. opened read/write by another task. Dictionaries can be opened
NB. read/only by any number of tasks.
NB.
NB. monad:  createmast clFile
NB.
NB.   createmast_ajod_  JMASTER_ajod_  NB. recreate master

fn=.  hostsep y
if. IFWIN do.
  syp=. PATHDEL ,~ (justdrv , ':'"_ , justpath) fn
else.
  syp=. PATHDEL ,~ justpath fn
end.

if. badappend jcreate fn do.
  jderr ERR011 NB. errmsg: error(s) creating dictionary master file
  return.
end.

fn=. jopen_jfiles_ fn
cn=. (<0;now '') jappend fn     NB. c0 use bit and last change
'jodversion jodbuildcnt'=. 2{.JODVMD
cn=. cn, (<jodversion;jodbuildcnt,didnum 0) jappend fn  NB. c1 version, build #, unique id
cn=. cn, (4 0$'') jappend fn    NB. c2 dictionary directory
cn=. cn, (4 0$'') jappend fn    NB. c3 directory backup
cn=. cn, (3#<'') jappend fn     NB. c4,c5,c6 RESERVED

NB. parse parameter settings --- sets (MASTERPARMS)
try.
  0!:0 <syp,PARMFILE
  parms=. <dptable MASTERPARMS    NB. created by 0!:0 !(*)=. MASTERPARMS
catchd.
  jclose_jfiles_ fn
  (jderr ERR027),<syp,PARMFILE return.
end.

cn=. cn, parms jappend fn       NB. c7 active dictionary parameters
cn=. cn, parms jappend fn       NB. c8 active parameter backup
cn=. cn, parms jappend fn       NB. c9 default parameters
cn=. cn, (i.0) jappend fn       NB. c10 dictionary log
jclose_jfiles_ fn
if. 0 > <./cn do.
  jderr ERR011
else.
  ok {: cn  NB. return last component
end.
)

firstperiod=:3 : 0

NB.*firstperiod v-- returns the index of first sentence period.
NB.
NB. monad:  firstperiod cl

NB. first period in at most 500 chars
y=. (500<.#y){.y

NB. inflected names have been long deprecated in J
NB. there is no need to mask them in later code 
NB. args=. ;&.> , { (<<"0' ([{'),<;:'m. n. x. y. u. v. *.'
NB. y=.' ' (I. _2  (|. !. 0) +./ args E.&> <y)} y

NB. first period
y i. '.'
)

flipQtwraps=:3 : 0

NB.*flipQtwraps v-- adjust tokens within quoted latex.
NB.
NB. This verb scans wrapped latex and marks quoted text. The mark
NB. crosses wrap breaks. Tokens within strings are set to string.
NB.
NB. monad:  clNeTex =. flipQtwraps clTex

NB. scan text and mark quotes
b=. ~:/\ TEXTQUOTESINGLE E. y

NB. index table marking start and end of quotes
t=. (I. firstones b) ,. (I. lastones b) + >:#TEXTQUOTESINGLE

NB. split into quoted and normal
c=. (1 p} 0 #~ #y) <;.1 y [ p=. 0,,t

NB. flip tokens in quotes
q=. p i. 0 {"1 t
;((STRINGTTOKPFX;ALERTTOKPFX)&replacetoks&.> q{c) q} c
)

jodhelp=:3 : 0

NB.*jodhelp v-- display PDF JOD help.
NB.
NB. monad:  jodhelp uuIgnore
NB.
NB.   jodhelp ''  NB. display JOD help - start PDF browsing 

jodpdf=. jpath '~addons/general/joddocument/pdfdoc/jod.pdf'
if. fex<jodpdf do.
  NB. jod.pdf is installed and local
  pdfrdr=. pdfreader 0
  if. UNAME-:'Darwin' do.
    NB. require 'task' !(*)=. shell
    ok OK0255 [ shell pdfrdr,' ',qt jodpdf NB. msg starting PDF reader
  elseif. fex<pdfrdr do.
    NB. spawn PDF browse task - requires configured PDF reader on host
    ok OK0255 [ jodfork pdfrdr;jodpdf
  elseif.do.
    (jderr ERR0260),<pdfrdr NB. errmsg: PDF reader not found
  end.
else.
  NB. jod.pdf is not installed advise user to download joddocument addon
  ok OK0256 NB. msg: jod.pdf not installed - use pacman to install the addon general/joddocument
end.
)

jodon=:3 : 0

NB.*jodon v--  turn  JOD on  result  is 1  if  successful  and  0
NB. otherwise.
NB.
NB. Tests the  current J environment and creates or activates JOD
NB. objects.
NB.
NB. monad:  paRc =. jodon uuIgnore

NB. format of (9!:14) has changed without warning in the past
jvn=. 9!:14 ''

NB. first value before '/' is the version number (we hope).
jvn=. , (jvn i. '/') {. jvn
if. #jvn do. jvn=. 0 ". jvn #~ jvn e. '0123456789' else. jvn=. 0 end.

NB. allow older system to run but nag the user to upgrade
if. jvn < 801 do.
  0 0 $ (1!:2&2) 'WARNING: JOD works best with current J 8.0x-9.0x systems - upgrade!'
end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  NB. J's before 6.02 are beyond the pale
  msg=. 'JOD requires J 8.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 8.0x-9.0x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN' do.
  msg=. 'JOD depends on core J load and class utilities.'
  0 [ sp msg=. msg,LF,'Load J with a standard profile to use JOD.'
  return.
end.

NB. HARDCODE: JODobj_ijod_ ijod ajod
jodob=. nc 'JODobj_ijod_'          NB. name class of JOD object pointer
jodco=. (<'ajod') e. 18!:1 ] 0     NB. JOD class status

if. (0=jodob) *. jodco      do. 1  NB. JOD is loaded
elseif. (_1=jodob) *. jodco do.
  NB. jod is off and classes are loaded - create objects !(*)=. conew
  JODobj_ijod_=: conew 'ajod'
  if. jodcs=. createjod__JODobj JODobj_ijod_ do. 1 else. 0 [ ex 'JODobj_ijod_' end.
elseif. -. jodco do.
  NB. JOD classes absent load and start system !(*)=. load
  ex 'JODobj_ijod_'
  NB. JOD load now requires addon path
  load 'general/jod'
  0 = nc 'JODobj_ijod_'
elseif.do. 0 NB. utterly screwed up system state
end.
)

markdfrwords=:3 : 0

NB.*markdfrwords v-- markdown text from word list.
NB.
NB. This verb takes a  blcl of JOD word names and returns a UTF-8
NB. encoded cl of  word source  code in markdown format. Markdown
NB. is  a simple but versatile  text markup format that is almost
NB. ideal for documenting program source code, see:
NB.
NB. http://daringfireball.net/projects/markdown/
NB.
NB. monad:  clMarkdown =. markdfrwords blclWords
NB.
NB.   markdfrwords ;:'go ahead mark us up'
NB.
NB.   NB. markdown text from JOD group words
NB.   mtxt=. markdfrwords }. grp 'jod'
NB.
NB. dyad: clMarkdown =. paWrap markdfrwords blclWords
NB.
NB.   mtxt=. 0 markdfrwords }. grp 'jod'  NB. suppress wrapping

1 markdfrwords y 
:
NB. require 'jod' !(*)=. WORD_ajod_ NVTABLE_ajod_ badrc_ajod_ get wttext__MK__JODobj
if. badrc_ajod_ src=. (WORD_ajod_,NVTABLE_ajod_) get y do. src return. end.

NB. commented source code (name,source) table.
if. badrc_ajod_ src=. 0 0 1 wttext__MK__JODobj >1{src do. src
else.
  src=. x&markgassign&.> {:"1 >1{src
  NB. similar to (markdj) but faster here
  utf8 ; (<LF,MARKDOWNHEAD,LF) ,&.> src ,&.> <LF,MARKDOWNTAIL,LF
end.
)

markgassign=:3 : 0

NB.*markgassign v-- mark j code for latex indexing.
NB.
NB. This  verb  tokenizes  j   code  and   replaces  all   global
NB. assignments with syntactically incorrect j strings that  will
NB. be transformed by pandoc into  easily located  latex  strings
NB. that will then be  converted by a post pandoc processor  into
NB. valid  latex  index commands. This works  because regex based
NB. pandoc coloring does not "understand" j's parsing rules.
NB.
NB. monad:  cl =. markgassign clJcode
NB.
NB.  jcode=. 'markgassign=:' , 5!:5 <'markgassign'
NB.  markgassign jcode
NB.
NB. dyad: cl =. paWrap markgassign clJcode
NB. 
NB.  0 markgassign jcode NB. suppress long line wrapping   

1 markgassign y
:
if. 0=#jcode=. y -. CR do. y return. end.
if. 1-:x do. jcode=. WRAPLIMIT wrapvrblong jcode end.
jtokens=. jtokenize jcode

NB. only interested in global assignment lines
if. #gix=. I. ; (<'=:') e. L: 1 jtokens do.
  jgl=. gix{jtokens
  jshp=. $jat=. >jgl
  jix=. I. jat = <'=:' [ jat=. ,jat
  NB. extract global assignments 
  NB. ignoring interleaving blanks
  jat2=. (jat -.&.> ' ') -. a:
  anames=. (<:I.(<'=:') -:&> jat2){jat2
  NB. (0{FAKETOKENS) and (1{FAKETOKENS) are invalid in j
  faketoks=. (0{FAKETOKENS) ,&.> anames ,&.> 1{FAKETOKENS
  jat=. <"1 jshp $ faketoks jix} jat
  jat=. (#&> jgl) {.&.> jat
  NB. adjust last LF
  (-LF={:y) }. ;;jat gix} jtokens
else.
  y
end.
)

ppcodelatex=:3 : 0

NB.*ppcodelatex v-- post process generated source code latex.
NB.
NB. This verb applies final adjustments to generated LaTeX source
NB. code In particular it alters the syntax coloring of long J (0
NB. : 0) character nouns, long wrapped quoted 'long ....' strings
NB. and wrapped comment lines.
NB.
NB. monad:  clNewTeX =. ppcodelatex clTex

NB. adjust any 0 : 0 text
'idx strs'=. (LONGCHRBEGPAT;LONGCHRENDPAT) cutpatidx y
if. #idx do.
  lg0strs=. long0d0latex&.> idx{strs
  y=. ;lg0strs idx} strs
end.

NB. adjust any wrapped alert lines
if. ALERTTOKWRAP +./@E. y do.

  NB. all code lines and start/end table of wraps
  wrgx=. wraprgidx +./@(ALERTTOKWRAP&E.)&> rlns=. <;.2 tlf y  
 
  NB. classify wrapped lines: comment, quoted string
  cm=. {.&> (COMMENTTOKPFX,'NB.')&E. &.> (0 {"1 wrgx){rlns
  qm=. *./"1 +./@(TEXTQUOTESINGLE&E.) &> wrgx{rlns

  NB. comments override quotes and normals
  if. +./cm do.
    cx=. cm wraplix wrgx
    rlns=. ((COMMENTTOKPFX;ALERTTOKPFX)&replacetoks&.> cx{rlns) cx} rlns
    if. *./cm  do. ;rlns return. end. 
  end.

  NB. quoted text - works for simple forms
  NB. a general solution requires re-pandoc'ing
  NB. line breaking nouns - especially complex 
  NB. boxed arrays that mix strings and other types
  if. +./qm=.0 (I. cm)} qm do.
    qx=. qm wraplix wrgx
    y=. ;(wrapQtlatex&.> qx{rlns) qx} rlns
  end.

end.

y  NB. adjusted latex
)

ppcodelatex2=:3 : 0

NB.*ppcodelatex2 v-- post process generated source code latex.
NB.
NB. This verb applies final adjustments to generated LaTeX source
NB. code In particular it alters the syntax coloring of long J (0
NB. : 0) character nouns, long wrapped quoted 'long ....' strings
NB. and wrapped comment lines.
NB.
NB. monad:  clNewTeX =. ppcodelatex2 clTex

NB. adjust any 0 : 0 text
'idx strs'=. (LONGCHRBEGPAT;LONGCHRENDPAT) cutpatidx y
if. #idx do.
  lg0strs=. long0d0latex&.> idx{strs
  y=. ;lg0strs idx} strs
end.

NB. adjust any wrapped alert lines
if. ALERTTOKWRAP +./@E. y do.

  NB. all code lines and start/end table of wraps
  wrgx=. wraprgidx +./@(ALERTTOKWRAP&E.)&> rlns=. <;.2 tlf y  
 
  NB. comments override quotes and normals
  cm=. {.&> (COMMENTTOKPFX,'NB.')&E. &.> (0 {"1 wrgx){rlns
  if. +./cm do.
    cx=. cm wraplix wrgx
    rlns=. ((COMMENTTOKPFX;ALERTTOKPFX)&replacetoks&.> cx{rlns) cx} rlns
    if. *./cm  do. ;rlns return. end. 
  end.

  NB. normal and quoted text(s)
  if. +./qm=. 0 (I. cm)} 1 #~ #wrgx do.
    qx=. qm wraplix wrgx

    NB. remaining wrap blocks
    wb=. 1 (qx i.(-.cm) # 0{"1 wrgx)} 0 #~ #qx
    wx=. wb <;.1 qx [ wj=. wb <;.1 qx{rlns
   
    NB. quit if remaining code quote free
    if. 0 = +/wb=. +./@(TEXTQUOTESINGLE&E.) &> ;&.> wj do. ;rlns return. end.
    
    NB. remove blocks without quotes 
    wx=. wb # wx [ wj=. wb # wj

    NB. flip tokens in quotes and move to first position
    wj=. flipQtwraps&.> ;&.> wj
    rlns=. wj ({.&> wx)} rlns [ rlns=. (<'') (;wx)} rlns

    NB. adjusted latex
    y=. ;rlns
  end.

end.

y  NB. adjusted latex
)

uwlatexfrwords=:[: latexfrmarkd 0 markdfrwords ]

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(d31,C%.+>GVo2`2^50d&84+>G\q2DZI21*AM2+>GPm2DZI13$:.=+>Gbs1,C%-0d&8,+>t>t
1*A>++>Yhs0f'q20d&7p1,L+.0H`/.+>GSn1bp1.0d&8.+?(Du0H`),+>Yer2'=b4+>GVo1,pC2
0d&8++>GSn1b^%,1*AD-+>G\q2D@Np6WHiL:/jqR;G/EUG:=YGA8--.FCf]=+EV13E,8s)AKWQI
F*)>@ARlotDBO%7BlbD/DfT\;FDi:@Eb0<'Ecu":ASkmfA7T7^+Cf>,D.RU,F%Jhe6Ub'P;FFGu
De*ZuFCfK$FCf0(FCfK)@:NjkGAhM4F!,(5EZccFDe*ZuFCfK$FCcmDB6%p5E(P@J:IJo7FCfK)
@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(
Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@6m-2]FCfK)@:Njk/Kf1W
ARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)7!*?cCi`3E6rZrX9N*'J
DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\.7nhX:IK;C
DesJn<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et<)6:`;]odlFCfK)@:Njk/Kf1WARlomGp"MVATV[*
A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`i
AKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+
Df.*KD..3k+CT.u+Cno&APu<"<*)jn6rRi=A8Gt%ATD4$ATD^-F<GdGEb'56AoD]4-u*[2Ch\!&
Eaa'$.3N8DDfp##;F+,U;FO&H=B%^kE+*WpDdsn`@8pf?+D,Y&B5M3tF<G19Df$UF=&M=\:f9_O
8Q[Da/Kf.KATME*F*)G:DJ+#5D09oA+Cf>1Eb0<2Df0)o@Wl0rC`m1q@r$4++Eh=:F(oQ1+DtV)
ATM@%ART[lD..L-@rc-hFCfM9FD,5.A8,OqBl@ltEd8dE@<6O%EZet.Ch73mEcZ>AATDL'A9)7'
F`MA@+EV:.+DG_(AU#>9Aft]"EcZ=FF(K62ASu!h+E1n4Bl@NoCh[icFE_b6E-#GuC3=T>+EVO;
ASuQ3GA2/4Bl5&5F`2A5A0>\sFCf]3De*NmCiEp!F)Yr(Gp#pO7Nb<!6m-/SCiF--A8Gt%ATD4$
AQDMnC2[X!Blmp,@<?''G%G]8Bl@l3D..3k+CT.u+Cno&ASQ-oDf0Z>Ec*!l:IH=DDBNt2F*2;@
+DGm>0d(1B+EM[8@qB_&Ap%o4@;]Tu0Hb:UBOu4.Bldj&@<--oAo`*6Eb'6.@<--oDg-(AFCf]=
+D,Y4D'4%@Eb$;/BleB5@<--r@<6L(B5VQpEbce4+Cf>#AKYT'EZf1,FCf\>Bl7HmG\M&.E,]<*
A7]RcFCf]9Df^"CE,ol,ATMo8B4YslEaa'$A0>r3F`Lu'+Cf>#AKYetFCf]9E+<fsASbdsAU#tL
Df^"CE,ol,ATMo8B4YslEaa'$A0>r3F`Lu'+Cf>#AKYetFCf]>GAL]0AU%g-GAhM4F*2AEEa`p+
ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@+9       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=3+>P&o0H`/,2`2^42BX_22`Mp71a"S70f*6IG#N6rCLo1R:-pQ_@:FCYD/X3$0JFVk/M/(n
@:FC/+CT;'F_t]-F<GXADeio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dE
IS*C(<(0_b06CcHFD>`)0JFj`$;No?%15is/g)8Z1+==oC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5
BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+0Q(fP
1,]RK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo%15is/g,">CLnW'De*s$F*(u6+D,Y4D'2GH
6m-#SF*)G:@Wcd,Df-\.Bk)7!Df0!(Bk;>p$;No?%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?
Ci^sH>9G^EDe't<-OgDX67sB'+Dkq9+=CoBA9;C(FCfJ?%16oi@:UK.C2[X)ATMs)E[M;'%16T`
@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]
CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1
$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN8
0ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`
CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQQ:-pQU4#%j#:-pQUH!tQ,ATAo3DBKAq
%16QUAoD^$F*)Fc3Zq]NHS0ai0d\;_/q,67-sIf_/g+FK%13OOFC])qF?MZ--Zip@FD>`)0JFj`
$4R>;67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr-RU8h-7hD1/1)_l-RU?.-mO0`4utqW
4XMO(-RU>l%15is/e&._67sBU67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@:FC/+CT;'
F_t]-F<GO2FED)7DK?6o:-pQB$;No?+DPe(4ZX]]6:s[6<),ef@;9^k?O[?;67r]S:-pQU:-pQU
G%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2+>"^MDI[L*A8,po+D#A'A7]9o.!R0M$;No?+DbJ,B0A9u
-p22r0I\+q+=K>r0Hb+J@jrN0$;No?%15is/g*nU/g,=GCh[E&EbT0"F<DuW.3N&>B6A'&DKI"?
@<?U&Ec,q@/Kf"K@;0U%8g&"[D.Oi/Eb/isGT^F4A0>H#E--@J-RT?1:-pQUEaa!$4ZX]5DIIBn
-QjNn+=ANa-RU8a%15is/e&._67sBU67sC(@;KXg+=LZ-Ft"PBEbBN3ASuT4E+*j1ATD[0%15is
/g+n;Eb@Nr+?Ui&+?Lc%+<iin/j:C4+>=on+F>:e+<Wij-p/k"@:FC&-Rg/h+A=g=0d&"iHQX_!
Cgh?s.3L/a4=G2lDffP;/j:D+3c\YLB.4rS+F?.i@<,ui$4R>;67sB'@:FC&-Z3@0ALAT0$;No?
+<Y*%Fs&.[+<VdL+:SZQ67sB7+CS`&+=D&8D.P(($;No?+>=pH@WikA-QjNS+:SZQ67sB8+CS`&
+=D&8D.P(($;No?+>G!I@WikA-QjNS+:SZQ67sB9+CS`&+=D&8D.P(($;No?+>P'J@WikA-QjNS
+:SZQ67sB:+CS`&+=D&8D.P(($;No?+>Y-K@WikA-QjNS+:SZQ67sB;+CS`&+=D&8D.P(($;No?
+>b3L@WikA-QjNS+:SYe$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaE
A90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1
+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)
+F?.r/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&
$4R>;67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(
Ec5t-$>sEq+CS`&+=ANZ+<VdL+<VdL+AP6U+Du+>BPD?s%16uaEZee"Fs&/SDf]K$-OgE#ATAo%
@WikABOu3q-OgCl$>sEq+>P'J@WikA-QjNS+<Ve%67sC%FD5Q-+DtUu@1<Q]ATAnM+CS`&+=DGQ
FXJ:S+AP6U+E1n4F(o];Bl7Q+%16uaEZd(Z@:FC&-YI.:AT_r>%13OO:-pQU@rc-hFCcS:BQ@Zq
+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.jE+*6lA0>u)
Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1f
Ddd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])qF:AR"%15is/g,7LBl[`,DdmHm@rri'Des6$@ruF'
D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$9g.jE+*6lA0>u)Bk)5o$4R>;
67sC(@<-(#F`S[>DK]H)Bk/>pEbBN3ASuU2%16uaEZd4^@:FC&-RT?1DImi2@:FC&1boLIDImi2
2ek2m@:FC&-RT?1DImi2-YddFF<GdJDf028+CS`&+=D)C-OgCl$;No?+Eh10Bk/?*@<?U&Ec,q@
GA2/4+CfP7Eb0-1+C\bhCNXT;%13OO:-pQU@:FC&-RU#Z+AP6U+DG@tDKKT7Gp%<EASrW.DffZ,
DJ()#A7T7^+CSl(ATAo0@<6N5@UWb^F`7cs0H`M$,9SC_/g+\BC`k)Q.3L2p+=Ach-=UOuDfTE1
FE/]\4s49CFseXH$4R>;67sBh@WikADIIBn-OgD:+F>:e+=Jd%-ULU)9L2WR9d_A474o]H+FPjb
@:FC&-ULU)9L2WR9d^AW%15is/g)hj@:FC&-Z3@0AL@oo0Hb]d0d%kq3[\WZF=/L[74o]H+FPjb
0Hae5Fs&/HDKI68$4R>;67sB8+CS`&+=ANG$8<Sc+<r!WI4cWs+CoA++=ANc+>#2g-S?bn@V'.i
Eb0<6E[ED&+>G!I@WikA-OgCl$;No?+>G!I@WikADIIBn-OgD:+F>:e+=Jd%-Za-CCLnkB+@Rn*
4s58++>G!I@WikAF)>i2AL@oo%15is/g)nl@:FC&-RT?10H`M$,9SC_/g)nlA8Z3+-RU>c/M8.n
/ghuTAS,k$ATMs6-8%J)1*C"7Fs&.[%13OO:-pQU1*C"7Fs&/M@;TR'%14d3HQk0e-nID,Bl8$6
D/X3$-Rg0,/g*>#I4cWt+CS`&+=Cl@FE;;;CLnk&$4R>;67sB:+CS`&+=ANG$8<Sc+<r!WI4cWu
+CoA++=ANc+>#2g-S?bn@V'.iEb0<6E[ED&+>Y-K@WikA-OgCl$;No?+>Y-K@WikADIIBn-OgD:
+F>:e+=Jd%-ZaEEFCcgK+@Rn*4s58++>Y-K@WikAF*22=AL@oo%15is/g)tn@:FC&-RT?10H`M$
,9SC_/g)tnA8Z3+-RU>c/M8.n/ghuTAS,k$ATMs6-8%J)1a$49Fs&.[%13OO:-pQU1a$49Fs&/M
@;TR'%14d3HQk0e-nID,F)>i2ALAoL74o]H+FPjb1a$49Fs&/RD/X3$-OgCl$4R>;67sB4HW3F4
<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5
De!-?5s]R/DeioE3B:GUF_PZ&C2[X!Blmp,@<?'U67s`sF_PZ&C2[X!Blmp,@<?''F"Jsd@WcC$
A0>;uA0>DsF*)G:@Wcd(+DPh*Ch\!&Eaa'$/no'A%15is/g(T1:-pQU@rc-hFCeuD+>PW+0Q1HC
0Js:H:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$;No?+>PWh@rsC^+C]J-Ch+Y:C2[X!Blmp,@<?'0
+CT.u+Co2-FE2))F`_1($;No?+>PWh@rsCb+=LuCA8Gt%ATD4$ARB+ZF(f)mFCfT8CagK8A7T7^
%15is/g)o'DJs\P2]sM`De*ZuFCfK$FCeg"Df9_H+CSekARl5W:-pQU1,*6M@k]V[-u*[2Ch\!&
Eaa'$<_Yt2+CSekARl5W%16T`@r,RpF!,RAE,9H&?U6tDC2[X!Bll$h3F=p1-UC$aC2[X!Bll$h
3@>qR+Cf>$Eaa$#+?V#;5s]7(A8Gt%0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$4ZX^6/nA[,
+>=63%159QHZ*F;4$"c<-Y[F/GUFUc3ZpL<HZ*h@.3g3SD.Rr>.4chhC2[WnATf22De'u5FD5Q4
-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+EM4)1,Us4F(fK9E+*g/+EV[H
@;Ts+C2[X!Blmp,@<?'fBOPsqA79RkF`M:@C2[X!Blmp,@<?'fEc5l<+DPh*Ch\!&Eaa'$<_Yt0
%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!)iFDe*ZuFCfK$FCcg/$?BW!>9G;6@j#Z!F=0449gM-E
:L@OFDe*2tB4Z0--WEl0:L@jTA8Gt%ATD4$ARB:b-OgCl$;No?+E_X6@<?'';b0202)ZRj@<6*)
@;]TuA79Rk+=M)FF`);0Bl5&8Bl.E1+<`-_.6T:+C2[X!Blmp,@<?'fBOPsqA79RkF`M:-$><jh
BK\C!F(eu;2)ZRtART*lAnc'm%16QT@<?'D3ZohmF*(i-E$-MU.4chh9iNJL$>OKiCh\!&Eaa'$
?YEkhBOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=RDe*ZuFCfK$FCefm@<6*m@<?('Ebl0l
4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm@<6*m@<?('Ebm*4$4R>;67sC'E+EC!AKZ/5A0<$D
.OdM5+DPh*Ch\!&Eaa'$<_Ysk$>OKiCh\!&Eaa'$<_YtF3ZoOn-pB[74u%D!De*ZuFCfK$FCeKI
6n(3,A79Rk.3L#n+>PBo+DPh*Ch\!&Eaa'$<_Ysk$9g.jFDYu5Ddso/F`\`RC2[X!Blmp,@<?']
9gg?<$4R>;67sBkAS,@nCige?Df9_?/KetTATDg*A7T7h+C]U=A8,OqBl@ltEd8dN@;L't%15is
/g+nIA8Gt%ATD4$ARBIrDfe-'+=CY[05>E90..29%14L>+?CW!.3N5:Ch4%_BkAt?An?4$F*(c(
?Qa90F?M6!-u*1#CNDX"C2[X!Blmp,@<?'fEc5l</151@@r$-=C2[X!Blmp,@<?'6-RgSoC2[X!
Blmp,@<?'5Bkh]:+CoCC+:SZ#+=M8A@:UL+.3NhTBlmo/F(fK9E+*g/+E)CE%144#-p'220RI\I
F=A>VEbTW,+EM47GApu3F!,4+@r$-:-WEl0:L@jTA8Gt%ATD4$AM.h1-OgDoDIb@B%14Nn$4R>+
0RI_K+E)1:+BosE+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K
Ch[uF3B:FU$>40n@WPIbDeioP6ng;i67sa#Ci<d(;f-GgAOJp?0HbHh/KeS<Eb/a&+Co%qBl7X,
Bl@l3-td@7@WNt@F)>i2AKZ)+F*)IU%15is/e&._67sBKBl[cpF<Et_Anc-sFD5Z2+=Ll=Ddmc:
+EMC<CLnW1ATMs7/g*b^6m-AUD.OhuDII@,F(o\<De:+a%15is/g,@VEb'56+<Y04DKK<$DJ=!$
+<Ve;Bl[cpF<D\K+Co%qBl7X,Bl@m1+<VdLGA1l0+<VdLEb065Bl[bo$;No?+Dl%-BkD'h@<?4%
DCuA*:-pQB$;No?+Eh=:@UX@mD)reWATo7b6m-MmCh7Z1AoD]4Ci<flC`m/(A0>N$Ddm-k+DtV)
ATKI5$;No?%15is/g)l$+AQ?^ATJu.DBO:Q+>,9!+FSY\@<,p%Ci<flC`mh<+EV:.+@JU?@;]Tu
@<,og$;No?+<VdLAT;j,G%#2uDKI"CD]iq+D.Rc2Bl5&'@;KakA0?)7Eb'5D+B*2$-td@7@WNt@
D09oA%15is/g)8Z+D#e-Cis9"+CT)&+Dbt+@;Kb*+CT>4BkM<pA0=9.+DtV)ATJu+Ec5e;Dfp/5
EX`@N67sB'+<Y`8DfB81Ci<flC`m/-F(o9)D.RU,F"SS7@;BEs@psCh+EqL1D@HqJ67sB'+<Z#X
+>,9!+FSY\DIIBnF!,=.FCSu,DIIBnF!,17+EV:.+E)CEATAo7@rH<t/e&._67r]S:-pQU+<Ve&
F`_28=)W+i4ZX]A+?CW!%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z+AP6U+=LrA6prIH
BlbD5De!3l+EVNEFD,5.6pr/+DIal-Dfd+3Df0W1A7]dmA.8l@67sB'+<XEG/g+RFCi<flC`mY.
+=L$.FCfJoDfTA;+EqL5Ch4_;Dfp.s@;TR)+DGm>@3BB)@ps0_$;No?+<VdLDfp.s@;TR=/g,Lf
+F,(Z+DG^]6p3.F1bp2%I3<5V+>Y,s%15is/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?
%15is/g)o%+B<;fF)u&.DIm?$DIIBn+ED%*ATD@"@qB^(@<<W#DL!@8AT2a)+DG^96pu)=GA1l0
+C\n)@rH7+Bk1dqARl5W:-pQU+<Ve>Ci<ckC`mb0An?!oDI[7!+DG^9-r4u-ATE!5Eb$UO%15is
/e&._67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL
:-pQU.!B0B@VK^J6n'6mF!,RFART[lA0>]&CLnVs+D5M/@UX'qEb/ioEb0,uAKY])+=L$.FCfJo
DfTA;%15is/g)8Z+E)CE:18!N4Y@j"GT^<8H[@LjH[?l[+=eRXATD6oDF?l8Gp%N`+tt-b+=\LJ
/g)l&+FSY\2%9mf67r]S:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is/e&._67sB:/g*ntD.Rc2
Ci<flCi"A>@<6L(B5V9k+DG^9F`;;2EZf^U+>,9!+FSY\F(9--ATJu&Eb-A2Dfd+3Df0W1A7]dm
A.8l@67sB'+<Y<5Ddm-k+ED%*ATD@"@qB^(BkAK0BOuH3@<,p%Eb/ioEb0,uARlotDBNb6G@be;
F(9--ATKI5$;No?%15is/g)8Z+A[-%ATCjjEb%<o+>b3%+>=63:-pQU+<VeJD/XQ=E-67FGmt*U
67r]S:-pQU+<Ve%67sB/A7]=k;flGiALSa9F!,L7An?!oDI[6g+DG^9@3B)lAT24$+EM%2E+L/6
BOPd$FD,5.Df0+q$;No?+<VdL:-pQUBl8-.Bk(g!BlbD@@<3Q-De!3lCj@.3F)u&.DIm?2+B3#g
F!+n1E+*cuDKI"6Ci<ckC`mb0An?!oDI[5e$;No?+<VdL:-pQUBlbD*@ruj%Ci"A>@3BB)@ps1b
+ED%*ATD@"@q?)V:-pQU+<VeFF`^AeD.Pj_+<YnO?6FTA1*Cpj+FAHGAS#gZFCB9&+>"^\+=\LZ
+FSY\.j/A6AT1Ri@<?'D/g,=KEaia#6pr/C+FSY^0HbW`.NiFX+>GPmI=34q%15is/e&._67sB'
+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is/g)u'+@g6d@UX'qDIIBn+CT>4BkM=#ASuU2+DG^9
6pu)I+CT@7@;^?5DImm2Bl7Q+A7]_%BIjT":-pQU+<VeNBl%T.@V$[(Eb/[$ARlolF!,+3Ddm-k
+CT>4BkM=#ASuU2+E(j7-r4u-ATE!5Eb$UO%15is/e&._67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c
$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL:-pQU-tHn#E)UjeFCcmDBlbD=Eb/[$ARlp"
Bkq9&@3B3!Ddm-k+CT>4BkM=#ASuT4De:+?:N^bjE`[1"A17rp:-pQU+<VeFF`^AeD.Pj_+<YnO
?6FTA1*Cpj+F#"Z+Co%pE)UjeFCdTr+Eh=:@VK^J6m-atI=3:n+F,(Z+DEGN0ea_uI3:BV$;No?
%15is/g)8Z+E)CE:18!N%15is/g)8Z+=Ra,:-pQB$;No?+>kbo8S0)R+DtV)AKY].+CT>4BkM<p
A0>],@ps1iGp$g=+CT.1F`;;2EZfF5DfB81@;]TuB5DKq@;Kb*+DG^9@3?!d:-pQU+<VeCDg,c5
+EM%2E+L/6BOr<!Ci<ckC`m/-F(o9)D.RU,+E)F7EcPl)ATJu9BOr<&De!3l+CT.u+DGm+$;No?
+<VdLFE1r$FCeu*@<3Q"+D5M/@UX'q@<6L(B5VQtDKI">AfrKtF`_28GAhM4F"&^N$;No?%15is
/g)8Z+A[-%ATCjjEb%<o+>b3%+>=63:-pQU+<VeJD/XQ=E-67FGmt*U67r]S:-pQU+<Ve%67sB/
A7]=k;flGiALSa9F!,+3Ddm-kCj@.3F)u&.DIm?$Bl5&%+Dbt?ATAo7@rH<t+EV:*DBO%7AKYo/
AISuA67sB'+<XEG/g+kGGA(]#BHV#1+Eq78+Dbt+@;Kb*+CT>4BkM<pA1f!(BPDN1BlbD=Eb/[$
ARlolF!+m6B5DKq@;I&pF)u&.DJ`s&F<GL6+=M/NFCfK:DfTA;/e&._67sB'+<YTFFA?7]AN_Xg
+F##8+FAGj+FAGXH[B:7AT1Ri@<?'D3ZrYi.Nj!ZI=34g+Co%pE)UjeFCdTf+Eh=:@VK^J6m-at
I=3:n+F,(Z+DEGN0ea_uI3:BV$;No?%15is/g)8Z+E)CE:18!N%15is/g)8Z+=Ra,:-pQB$;No?
+>thp8S0)R+DtV)AKY].+CT>4BkM<pA0>N$Ddm-kCj@.;DBNA*+E_XBATAo7@rH<t+CT.u+Dbt+
@;Kb*+DG^9@3?!d:-pQU+<VeCDg,c5+EM%2E+L/6BOr<&De!3l+CT>4BkM=#ASuT4BlbD=Eb/[$
ARlol+D5M/@UX'qEb/ioEb0,uAKYo'+=L$.FCfJoDfTA;/e&._67r]S:-pQU+<Ve&F`_28=)W+i
4ZX]B+?CW!%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z+AP6U+=Lc3AT1Ri@<?'0+DGm>
B5DKq@;Kb*+CT>4BkM<pA0>T(+CT.1F`;;2EZfF5DfB81@;]TuCi<flCi"A+$;No?+<VdL:-pQU
Bl5&%+Dbt?ATAo7@rH<t/g+,,AKYl!D.Oi(F!,RFART[lA0><%+CQC*Ci<ckC`m/-F(o9)D.RU,
+E(j7-r4u-ATE!5Eb$UO%15is/g)8Z+E)CE:18!N4Y@j"GT^<8H[@LjH[?l^HXp]!E)UjeFCcS>
+=\LZ+FSY\.j/A6AT1Ri@<?'D3ZrTWEaia#6pr/C+FSY^0HbW`.NiFX+>GPmI=34q%15is/e&._
67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z
0e"5WBl\9:+EV19F<G"5F*2>=FD5Z2%15is/g)8Z1+=>eARfXrA0>u*F*&O5F)uJ@E-,f4D@HqJ
67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW+0P"a)0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>;67sC&ATMr9Bl5&'Ch7$q+C\c#AKY]!+EV:2F!,(2@:p]sF!,FBATMF#F<G"0A0>r)
F<G[D+>F<4:-pQU0H`M$-o<).0I\,,-V@0&6VKp7;GTqmBkhQs?RH9i:-pQU0d&&/+<iEc8l%iB
9LV6F:J5&/C2[Wi-OgDX67sBjCh7$q+=ANG$4R>;67sC&ATMr9Bl5&8ASlC)Eaa!6+DQ%:CERG3
@ps1b+>"^RDfd+1Cht4d:IGX!:-pQUFCfN8F!+t$DBND"+E1n4AoD^,ARlotDBN\:DJLA2De!3l
ATJu8Df'&.D09oA+EDUB+DG^9@UX=h%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$a
F)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8
C2[W:0II;:%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,                             ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,0n-+>P&o0H`,/+>Gbs1GU(-1a"S5@:FCYD/X3$0JFn`@Wj1C@<-"'D.RU,+EMC<CLnW1ATMs7
@WcC$A86$nCh\!&Eaa'$@WcC$A0>;uA0>DsF*)G:@Wcd(+DPh*Ch\!&Eaa'$B5DKqF&QpoCLon%
0JI$OEb/a&+Co%qBl7X,Bl@l3-td@7@WNt@F)>i2AKZ)+F*)I                         ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUs30fU:3+>G_r1*A;32D?7/0H`+n1,(O>+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>G],3$9q9
+>P&p1GLj30f'q-+>Pc60H`,*+>P&o1H%*50ea_*+>PZ.1,^701E\Fq2`!-J+>Gl!1*A;-1GU(.
0d&4o3Ar]K+>G\q1*A;+1Gp:00d&4o0f1dD+>Gl!1*A;*0f^@22]sju0f(^E+>t>t+>GT.3$9q4
+>P&o1GCUW:IINL8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>>eu:2b:u1,(I;+>>c91,(aC2%9m%$4R>;67sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+
Df.TY0eP.41*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg1*B>1Fs&Oo1,'h*0fh'F3\r]($4R=O
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU
0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u1,(I;+>GW41c%0L1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pes:2b:u1,(I;+>GW42)I?M
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pku:2b:u1,(I;+>GQ21,M$H
3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>Pku:2b:u1,(I;+>GT31GV!K3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pku:2b:u1,(I;+>GT31bh$G
2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A
+>Pku:2b:u1,(I;+>GW40JPUB0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0ea^m6t(1K3Zp+3+@KdN+>PW+0H`)(3\`EO1bf=E$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t@j!N\1,'h)3'&oP
3\i]&8l%iS:JXY_6<-TN6qBmJ<)6Cp1,TLJ:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+:+AQiu+>PW+0H`&/3\iBM0Js:H%13OO:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.4
+AQiu+>PW+0H`))3\iHO1H,aM%13OO:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp18+AQiu
+>PW+0H`)*3]&WR1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,U1LDg!6Y0JY=)0f;!K
2```K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp1:+AQiu+>PW+0H`)(3\iNQ0f]RJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh
2]tk6Fs&Oo1,'h*0fh*G3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1cdHR$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pku:2b:u1,(I;
+>GT31bh$G3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+?:Pe6t(1K3Zp1:+AQiu+>PW+0H`)*3\W9L0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=ARci<0JY=)0ebXC1HI?J
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp.6+@KdN+>PW+0H`&/3]/ZR1-#\<:K(5"C2[X!Blmp,@<?'90b"Ib67u)1;cI+=De*Zu
FCfK$FCcS6Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is
/g)QWDe*ZuFCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!FD)dK+E_a:
+=M2;DIdZq.3N>:+E)-?F(f-$C`m\*FD)*j:-pQUAoD^,BkCd`ATVL.+<VdL:-pQUAoD^,@<?Q5
BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?+D5_6Ch[u6+<VdL
+<VdL+AP6U+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HVZ67sBpAmo1\F(Jj'Bl@l3+<Ve%67sBp
DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+DGFt+<VdL+<VdL+<VdL+AP6U+D,P4
D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G]XB%:-pQUF(KH.De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%
9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA67sC'
GAL]0AU%g-GAhM4F!)T#67sC'DKg,0E,]B!+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4
F!*P*-[0,EGB.,2+E_=5Gpa%.:-pQUGAhM4Ch[u6+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0Ec5e;
GAhM4+Dbb5F<DuW.1HV5%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$
AL@oo%14L>+?CW!.3Kuc%172tGqKO5:-pQUF`V+:@;^?5E+*WpDdso2ATT&/DBO%7AKXT@6m-Gh
De<^"AKYT'EZfI;BlbD6@:NtbDIj7aBkAt?G@c#+@;9^k?Q_HY:f9_O78d#P6r60E6r-0WBkhQs
?RHt,D_</384c`V5u'gD6XO8:De*ZuFCfK$FCefB3Zq6s77K^D;FNuM5u'gD6XOPBDe*2tASu$2
%16f]/g)Ys00gp5E+*WpDdt.A74p#3E+*X-ATBpd+?M9(+?V_<?SWaGCh=e<F(f-$C`l\J8Q/GO
:..lF?X[\fA8Gt%ATD4$AR?u9+>#0gATDj+Df-pO+>#2g6W,%;D_;J++<Y`BDfp/@F`\`R:/=hX
3ZqjAC3=T>+E1b,A8bs#E+*j%+DGF1@s)g4ASuT4G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>
5!:#D/ibO=/hn^_$>"*c/e&.t@<?!m/e&.1+EMC<F`_SFF<Dr";Gp:g3ZrBMDIdZq+Du+>+EM+9
+>"^EA867.F<FOR8Q/GO:..lF?X[\fA8Gt%ATD4$AR?eo$>"*c/e&.:%16'16r./^:IITH6XO\@
1,fXL+^8]"A7TUg+EVO4D]ik1F*(\9C2[WqEa`p#Bk)3;FDk].?YXLi/oY]@.3N"j:IITH6XV$9
:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IITH6XVMU$<1\M+C\c#
AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<62n$=Rg_+DkP4
+CT5.ARTU%Bl5&3FD,6++B2-):EXIfF*)IU%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=ASQO-
E+^q@G%,&lG@P]3@WaDB0JkaJG$dF@+@C'bF(o/rEZf(5E,ol?Bl7Q+AoDR/+EqC2B4uC.+DG^9
E,oZ1FCeu*A8bt#D.RU,F"SS7BOr;uDf0Y>F`V,)%144#+D,P4+EMIDEarZ'@rGmh+Cf>4Ch+Yt
AKYD(Ch\!5Ch4_uDerrqEZcqVATMg%@qf@fCj@.FBOr;rDes?4ARlp*AU&<</e&-s$8O4V?p%e,
H"_5=E]7uIBJ_JcC2>hMF*K]ZEbAi@?Tqj?87?OUDf098AKYK$A7ZlnDes?4F!+n/A0>K&DKKqB
@:O=rF)rI3Cia]7BleB1DJ+#u+CT.u+CK.sDIdZq?m'N9DKK<3+Cf>+DfTQ0B.aW#+<VdoF`MM6
DKK]?+EV:.F(HJ5@:O(]B4Z-,F`V+:A8,XfATD@"F<G16DKKqB@;]Tu@rH1%EcWiB$4R=u/g+Oa
?T)pY3GgcoEG0YRD.,@\FEDbPBQ@s!BQ7BC?m&?YG%kN3+D>\;+EVNEAp%p+Gp$[8@V''m@;Ka&
Eb/ioEb0,uARloqDf0Z<+DG^9E,oZ1F<FCJ7WU0k$4R>!/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@
2_]AhFu<Vj?m%gTDKBN&ATAo%A7TClB-:Sj@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+A,Et
6r-0&%13OO2(g"Z4C:!^Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#
+Dtb7+CT5.ASu$mGT_*H+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D
$4R>M>@h\_/TboADd?`[$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6tA1hh=
B.4s28l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO
:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF
%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+
/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^h
F"Rn/6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7
E,9*&ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(IAS5^p
/TboADd?`[$4R=s/g+Oa?Xkp+A3"T`F`D4OE&)ZOF)3aS3HAh[A7o75?m&E[F*&O8Bl[cpF<G+*
Anc-sFD5Z2-Z^DED/`onF<GL>+A,Et/g+,,AKYl%G9CF1Eb/a&+Co%qBl7X,Bl@l3Amo1`Ch\!:
+DG^98g%hcFE2;1F^o!(%144#+CQC1ATo8-BkMHpE+gA%H[B-C@"!H2+Co&"Bl.R+ARlp#ARTIt
+E(j7A7]@eDJ=!$+DG_0Bl7K)DJsZ8F"AGWATD7$/0JA3G%G]'F!+n/A0>B#DJF<3@ruF'DK@E>
$6UH69jqgK+EM[GAKXT@6m,uJDBNV$DIdQp+CT)&+EV:.F(HJ3ATo8/DfT]9/e&-s$8O4V?p%dM
Bk:k$CjKYNA9KdgG%kf5H8oq`CGfU9?Tqj?;e^)_Cgh@#Gp$s4CLnW0F`M%9?tsUjCh\!&Eaa'$
?m'Z3Ebf_=AoD]4A8-'q@ruF'DBNJ$Anc-sFD5Z2F"AGTAS!nF+Br5Q:IIucC2[X!Blmp,@<?'5
D.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,
@<?'6<)5nX?YXLiCh\!&Eaa'$/o>,J/e&-s$8X:W?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B
?Tqj?8SrEeDg#\7@;]TuAU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.
ATAnc+EMgLFCf<1/g*hr@WMtc+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s
$8a@X?p%e+AS!`F0JmTfB/agI3,LWbBQ,maF_Z(W?Tqj?6Z6j`Bk1dq+CSekBl7Q+?t!Mf?m$k+
Cht5'@:O(qE$0=8EcYr5DK@6LFDi:08l%isDf9H5?nNR$BPDN1G%G]'+DGm>E,ol?Bl7Q+F)N17
@;]V$+DGp?F(fK7Ch+YtAKYr#Ec`FBAfu2/AKZ&9@;]UaEb$;6ATW'6/e&-s$8jFY?p%dSCM%="
@W6L"2JHrJH=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bBD]iG&
De(J>A7f3lA7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO?s@2[A1_nAA8ba]%16'1
6r.0)De*ZuFCfK$FCefrA26(Q$6`VgDe'u,Blmp,@<?''Ch[g*>psE)@r-:/Bl@m105>E9Ch\!&
Eaa'$Ch[g*Ch\!5Ch55<DJ(D+C2[X!Blmp,@<?'g+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=
ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$FCei4%13OO?tsUjCh\!&
Eaa'$?m'0)+CQBs8hWe46sV3SFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?
AM%Y8A1_b/B4W_F+Cf4rF)rI:Ec6)>+EV:*F<GOCDg#i*ATJ:f>AS"qATD4$AKYr4DeF*!D/F!)
B3cp!FEDI_0/%-UFCfK$FCfE3DeF*!D/F!)B.d\4D(fU@A7^!<BQS*-.3N\SE,]`9F:ARhDfQsm
+Cf>#AKZ&9DfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&-s$<1\QF!,"3@s)X"DKI"CEa`HnF!,F5
DIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$<1\M+C\c#AKWce
+Cei$AKY])F(K61Bln'4AKXKC8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)
FCB6+/g*`-+E_R9EHPi/Gmt*s@:EeaF!,%&@q[!,@<63,@;]TuD..3kF!,1=+E27?F(o*"AKYK$
D/a3*AKYMpFCAm"ARlonBOPdkAKYZ#F*)>@Bk;>p$=\9'FE2;9Ch[d"+E)F7EZfI;AKZ/-EcYr5
DBNV,F*)>@Gp%$;+EV:2F!,(/Ch54.$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dRGr9DI2.q)H
B6JS[G]n1P11Dq[1GCL=?Tqj?;It#cF(HJ&DIal3ATMr9AoD]4A8-'q@rri(AS,XoBln'-DD!&(
+?;&.1*C:KFE2;1F^nun+Co2,ARfg)A7]@eDJ=3,Df0V*$6UH6FD,*)+CT;%+Co&"Bl.R+ARlom
Gp$LAHXIt(I=5KU+B3#c+Co2!Ea`p#F!+n3AKYE!+D#e-AT2a*Df-\>D]hY"Et&I!+<YB9Ao)$g
FD5Z2+EM%+ASl!$@;]TuGA1l0+ED18E,9).FD,]5F_>A1@;Ka&8g%V^A7Zm&@<-F'DJ()6Df9H5
+DG_'Cis9&DJ'Cc+<Ve7C2[X!Blmp,@<?'g/e&-s$8O4V?p%dT1NmDPEAVepH$;&QD/FE00f<HO
ARTn,?Tqj?8T&]_F*),/@<?''GA)7EF`(`$EaiHt+Cf(nEa`I"ATDi7+CJPa+DG^98l%htB6%p5
E$0%,D.Rc2@WH$gCEQ;Z<+T/SE,ol,ATMp,DJ(RE7W3;iDJs_AC3=T>%144#+CoD.-ZgJRF(HJ:
DId=!@UX:"@q]:k@:OCjEcW@;DBNS4Dfp"ADIIBnF"Rn/%14mD+CI<=2KW\DG\Jrf3-/nL1H.(+
@;^(.AN+$W@:)3++@C'aD.RU,F!,[@FD,T8F<Gd@Blmp-E+*6f/0JLVB.b<7:-pRND]j+?@:Njk
AS>ab+DkP4+Du+>+Cf>+DfQt>Ec5o.Ebp"R+B<JoEZeab67sC%E+*6f+E2..@<6!f/e&-s$8a@X
?p%e*203tOF_Z)1Gr0_fH$4:CGAB&m1M1-5?Tqj?;gE8&@<`o)Des?4Bl7Q+De:,9Ea`p+ARlom
Dg5i(+D>>.ATD^%ASuF/F!+n3Eaa67+DkP4+Du+>+C\n)@rHC.ARfg7%144#+F\cg%144#+<VdL
-ZO9IFCeu*F*)G:DJ(=>4!5q9+>PVn1,'t.0JFpu4!6UG-ZO9IFCeu*F*)G:DJ+#5GA2/4+Du==
ATDKpF!hD(+<VeUIXV_5%14sF+CI<=ChPP?D_X.m13.LnBl,\DFuM-jDg,Z6?Tqj?;e^)_Cgh@#
Gq:(^Ea`p+Bl7Q+DJsE1Dfor=+EqOABHV,0DJ()'D.7'eA7]9oEHQ2AARlp)FE2)5B6,24@<iu5
Dfd+3Des?4+E2@>E+O'+GrcBA+<VeUIXV_5+<VdL+<XEG/g*_a6;B*e1E^1@ARfLsF_qQp+<VdL
+<VdL+C@)^+C/4pA8-+(+=CkX1LjrC%144#+<VdLBe_DRA3Dt$0KD*O2Dm<I1,1IC3&``Q1c$mA
0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1c$mA0KD*O2Dm<I1,1IC
3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl
$6UH6+<Vde3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O
2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1aaDm+FYFf+>Y,p+>Y,p+>Y,p
+>Y,p+>Y,p+>Y,j0-Dks+=Ait1,CaE2E*TU-Qm+U+C,E`+<VeUIXV_5+<Ve%:K0bD+A?]kB-;#)
DIml3@<,p%GB.,2E+NQ&@V'.iEb-A+DeX*%+EVNEE+*WpDdtCB<+oue+Ceht+DbUtA0>u4+E1b,
A8bre$6UH6@<6L(B5VF$B-:o+@:NeiEaa'$+EVO;ASuQ3FD,*)+CehtDJsV>@V$Z3ARTXoCj@KQ
E+*iuBOt]s@:jUmEd(r4A90@G7VR)V$6UH6FD,6,AKY])Ao_I&F_,H4+E(_(ARfh'+EqOABHV/#
DKTB(+A?3CAQU'dA8-.,3ZrKTAKYB'GAL]0AU%g-GAhM4F'pU0$4R>M>@h\_/TboADd?`[$=\-l
Ch.:!A8G[rAU#sb:-pQ_@WcC$A86$nCghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[Nq
FCeu*8l%htF)Q2A@q?cV@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF
+Co1rFD5Z2@<-W@F!,"3@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1
+Eh=:F(oQ1F!,C5+E1b,A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL
@q]F`CERM5F`&<M<(KSZ:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'
EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB90Pt6D0JXbkAThd/ARlo3H?smPDe*]nBl7:"AU#X5$;No?+>PWf@<jR_+=MP^H>7A/D..-r
/n/72.3N&0A7]9\$;No?+>PWf@<jR`+=JpRCh7$mFCf\J@UX@-+CSekARl5W:-pQU1,*QRGqh9$
A8-+(CghT3@WcC$A0>>iF<G16Ec#6,FCeu*FDi:BF`%Wq:-pQU1,*TaFttot@:Wn[A0<:8De*3n
G%kN3?Z]k(.1HUn$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn
@<6K4FDYu5De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;
5s]7(A8G[rAU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo
%15is/g+b;FCSu,+C]J-Ch+Z2FD5Q*FCfM9@;]Tu8l%htBl8$(Eb8`iAKYf'F*)I4$?U-(Ci<f+
B4Z0-4$"a0ART*lGB.D>AKYGnAoD^$F*)FF@q]:gB4Z.+EZdtM6rm#M+A$lO:IJo7FCfK)@:NkI
<'a8I5uL)n8U=!)7!*?cCi`NS5u'g6;FDX!H:gt$F`_>8FCfK)@:NkI<'a8I5uL)u%13OO:-pQU
@s)g4ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\kt
A8bp?3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''
A8bre$4R>_Df9`>AU$@!+=DJ]H>7A/D..-r-OgCl$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/EcZ=F
Df-\<AThX*F(HJ)Bl[cpFDl2F+D,>(AKYl!D.Oi2DfTr@%14J'@j#l)GUGX8+AG-h;GUY.C2[Wi
+D58-+EDC=FED)=/14eHAU#R3$?Tj(4ZX]IHTE^"AU"XkFCf\[3Zogu0-bpp,BdX=F(oQ1,CY(d
0./;40RHDf6rm#M.3N,6@;]^hF*)FFFCf\+$7L"78g&4eGUXbZEbTW,+CoD#/95ZIFED)=/13&l
AU#R3$4R>;67sBmATVEq+E)F7Ecu/.G9C^1FCf\>@;]Tu@r,^bEZf(6FCfK)@:NjkFCf]=%14J'
@j#]5FCf\E4ZX][5snOG?X[\fA7$HlATT%BC2[WiDg#i+G@,H'GUEq-BkCd`ATV?n4ZX]54=_q0
C2[WsAmo1\Hn?p6-OgE$G'%;?4ZX]6BkCd`ATV?n+C\noDfTE1FE/KcHTE]rG'%;?.4f1F@:Nkj
@:p#V%15is/g+SAE+Not+CfP7Eb0-1+DG_8ATDBk@q?d(ARfgrDf-!kC1^maAN`'s004P)IP+3<
8l%ihDKKH1Amo1\;cH%X6pX^=/4k.[:IK;CDesJn<'a8I5uL*%8U=!)7!3TcDKKH1Amo1\;cH%X
6pX^=%17#sFCf\[3Zr?aFCf\J-o*#@7O]l:AoD^,BkCd`ATVL.+DPLs@q@)?1*]I^%14M*Db;-j
G'%;?.3NhTBlmo/A8bs/-[L)RDe*d0Bk;K@FCf\E%13OO:-pQU8l%ht@r,RpF(KD%$>O'e4ZX]I
3[\Z\A8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5-OgE!FEfr0
+D5_5F`;/*FCf\D/j:Cm@r)S]%15is/g,4HF<G:8FCfK)@:NjkBR+Q.EcP`'+EV%4B4Z1+%16on
GWe)1C1^maAL;J0FD5>q@qBajEbBG?/j:CoFEe6%%15is/g,:XAKW@HH7'hSEb/isGT_*H+CTG3
Bk/>rCghBuATJu<Bln#2-YdR1-Qk#o04]!2F_t]-F<G10Ch7Ys$?Tj(Anc'mF$2Q,-p2$Y@jrNO
-8%J)-p/l'H7(-a/1)u5+DPD&+=nil4s2s8/p(ZL-Qij*CijnEGB.D>AL9#n+EV1>Anc'mEt&Hc
$;No?+D5_5F`8I4F_PZ&+C\c$@q[!+@rc:&F<E.XCghEsGT_-NBl%i5FD,*)+Cf>,E+s-"+D58'
ATD4$ARloqBl%@%%16id@WcC$A9;C-4Y@j*-SKonIV3\>F`;dSIP3'"Ec5l<FCf\G+Cf(nDJ*O%
FE/Kr9L;`N9LMiK=:GTcFDj]G;cFlSCgqO$Ch.X!GUXbZEbTW,+DP_%F_PZ&@UX@A/g+\C@k;Y=
Dfg)4GUt3p@UX@+%17/nDfp/@F`\`RF(f-$C`k)Q-S-ZV@W?O/FCfT7+DP_%F_PZ&@UX@-/12em
-Ql/N/g*tY7Nc2ZD/a3*AKYGjF:AQd$;No?+D>2$A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5
+EV1>05P'=AU#>>ASlB/Anc'mEt&I(Eap50G'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](
@UX@+%14M*Db*Z&<$48L3\5/lF=A>VEbTW,+CoD#/13,*@r,^bDKKH7/n/72-OgCl$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$FCf8s
FCf\P0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbdsAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_Bq
BQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4
D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]2
3ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU
+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!
/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QRGqgu^$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGqh&sF(fK9+E).6Gp"MMDe*Zu
FCfK$FCd(6@<<q-$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&
?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*
3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQU@s)g4
ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?
3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''A8bre
$4R>TEc>o)D.Pjk+=CoBA8Gt%ATD4$AL@oo%15is/g+e<DImisFCcS-Ec6)>+DbJ.AU"XkC2@No
DEU$'B6%s-BlkJ1Ec>o)D.O.`-ZW]N+DP_5Df9_?C2A!+FDPM2C2@g3Bk;K2C2@BuA7ZluCgqO$
Ch.!`F=044+DP_*ASqqa%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9GV<lA
FCf\>FCf<.+D,>(ATJ:f-ZW]O+Du@E-TsL59gM-E:L@OFDe*2tB4Z0--Y$t(@;^0uG[FogF=.M)
.!0Au:K(484*s">DK^+N+Eqj?FCcS*Ddt=G0JI!QARTIuAU#h:@<<k+$4R>;67sBu@;TRlATMo8
G%G]'%14L>+?CW!.3NY@0H_ht+ECsH%16f]/g)l#3dDiYD_;J++<Y`BDfp/@F`\`RF(f-$C`k)Q
-S-ZV@W?O/FCfT7+DP_%F_PZ&@UX@-/12em-Ql/N/g*tY7Nc2ZD/a3*AKYGjF:ARgCia/?%144#
F)>i<FDuAE+=BTU;GU1O+D58'ATD4$Bl7Q+9OUn3=<K1Z+=B6`Ec>o)D.O.`ASu$2+<V+#.1HUn
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?H6F*)>@H"q8.
1,fXL%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO,9nEU0eP.41,9t(+=MGJE%)5'%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF
+CSekARlo8+EM+*+CJr&A1hh3Amc&T%14=),9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%V
Df-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+=\KV?tsUjCh\!&Eaa'$?m'Ds
DIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu6+EM+*3XlE*$6UH6+Bqie
Bl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=
FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OV`n%144-+<XEjG9B1g@<uj0
+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@
@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.
A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$
DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4t
Bl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D
0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=),9S]n0J5(&/KdbrEarc*1,pg-
1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&
A7KakAM.q>B4,.YA7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOA
A1q\9A7TUg-X[Aj%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et
+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59
BOr;sBl[cpFDl26ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,
Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&
Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08
+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK
+:SYe$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/
%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2
+CT)&%144#+<YW>@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et
%144#+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/
+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDkl
B-f;e8l%i$1,)%'@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%
C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$
+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*
3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4
BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue
+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*
@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF
+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE
?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`
.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJ
ATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.
@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJ
ATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC
%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8
+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(
?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB
3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtA
ATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf
:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdL
FCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<
+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-
FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#
6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;
ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(
ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2
E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'
+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e
@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<
Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,
BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuST
E-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL
+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(
ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)
D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&
FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`G
F>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1
+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.j
F'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL
+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU
/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"X
F(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(E
F`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)
?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.
@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)
+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.
@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<fl
C`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdT
A8WhZ3ZqsAF:AQ`#n74a+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^9
8l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0
+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>`$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W9
1,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(
Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*
Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96
F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B
@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/
@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL
+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kB
DffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/Kdbr
Earc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pq
A7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*
Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1
+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe
$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^
+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=
ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:
@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3
De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4
-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_
F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAq
De(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-
F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!
DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOA
BHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI
+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2
F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,
+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(K
G%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4
F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3
@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>
A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1
Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,
B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-
+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH
%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#
+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*
+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]Tu
ARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+B
ART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0
DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^
ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@
FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+
-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^k
DId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#
AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSru
BmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?
A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%
D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)
FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3
C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/
@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua
+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL
+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;u
Bl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[P
D.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.
@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[
E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.
BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN
8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(
ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE
?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?
F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#g
F!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f
+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj
/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>
D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4
ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL
:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=
-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*
Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'Ds
Ea`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6
?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)
E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1
F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&
FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G
78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'
DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N
/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9
;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G
78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A
+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*
D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuul
C2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.
Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-
G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%
De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N
1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79Rk
A0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE
?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'
1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:
77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.
FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s
$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/
%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2
Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'
DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6
Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&
@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrG
Bkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/
Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!
+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n
04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC
2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdk
ARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL
+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6
+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b
/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^
A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o
@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5
DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm
$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA
@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&
DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_u
Cgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UH
AS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO
,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A
@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'
BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-
FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL
+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL
+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o
9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%ht
D..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2
@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4
G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;Kau
GA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!
Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4
+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6
+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8
F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1
@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#
D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"
DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJ
FE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*
FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXF
Bl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsC
FD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;
A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&
BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4
+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5
B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]Rk
D/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F
+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;
?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-o
A0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In
:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QT
Ble59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH6
8l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$
/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku
@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1r
FD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSek
Bln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9
De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TR
De`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b
/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,
@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m
+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89
@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<
BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL
:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&
F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$
De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@
/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cu
Am]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO
+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=
Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6
?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO
=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%
+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-
Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7
DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/
G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=
@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5
?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b5
1,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNS
G%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:Wne
DK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79Rk
A0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%
B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26
ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4
@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$
+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNE
Ch[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+
EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj
$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p
8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/
FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?
Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO
+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2
/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'
DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*
D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#
D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).
AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9
FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o
@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6
Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1
AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#
D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'n
F!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0n
Bl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@
D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6
@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%
D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;
Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4
ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=I
ATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</
Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3
A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0
Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth
+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*
ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*
Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\g
EZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eB
FCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!
C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4
AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"
H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,
ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<
+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1
+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."
Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].
+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7
@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=
DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s
+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm
@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,Xi
ARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1A
F`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])
FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.F
BQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.
@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$
C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k
+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/
FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l
@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3
Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&
A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbt
Df0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/Zi
Bl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,
@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep
+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7Zll
A7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSek
ARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0
BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=
+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;Kak
EZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#
+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(
Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0
+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0n
E+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9
E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU
0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc
%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'
E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(
Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,Ib
Ea`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi
;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7
+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq
%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb
+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63(
$6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*
Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu
@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7
Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:
@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa
+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#
ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD
+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:
+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:D
BPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)
E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H
+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL
+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;i
AU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6
+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<
A1hP;D/9XgC2[WiDg#i+G@,H'GVV$#+C]A*AS*''G%G];Bk;K2De:,6BOr;Y:IH=HH#n(=D(Zq?
$7-g=BPD9o+CT>4De!KiFCeu*GA2/4+EV:.+A,Et+D5_5F`8IFBPDN1Dg#]4G%kN3+:SZ(+CT5.
Ch[I%+EVNEFD,5.ASuU(Eb-@c:IH=HH#n(=D'3n2AKZ).AKYhu@rcK1-t7=5Ch.:!A8G[rAU#X5
$4R>IF(Jj'Bl@m98l%ht:Ng;iG%kN3I16Mm$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m6
>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R/
@:WneDLF,H$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/
%16?SFCf:u$6WSeEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1
De(G=@:s.)I="q,AKXT@6m,<7B4ZKD+:SZ#>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`E%144_DJsQ4@;L"!H=[Nm>\S:k
D%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0G
A1hh3Apo#*BOr;Y:IH=B@;^3rC`lu)AU&<=FF.b@A1hh3Apo([%144_F(96)E--/8H=[Nm+C'&0
CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0GA1hh3Apk*q
+C&f&Ec#6$F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HV.(%+B<JoEZdqkFCfK)
@:Njk=)W+iF+"K)%16$PD.Oi.Afu2/AKY])FCfK)@:NjkGAhM4F!,:5F*(u(+D>>,AKYE%AKYl/
F<G+4@s)X"DKKH#+DG^9FD,5.>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs
@kV;-DdkA:@<6O%E\D0GA1hh3Apo"u:IH=B@;^3rCjdoY%15X;Gq:(ZE,oZ1CM[^&B-;86F`Lu'
+Cf>#AKZ22FD)e)@!-?tDe!p,ASuU$A0>Jq@<?X4ATK4H+CT.u+CJSG@<6O%EZde`B6,FJ+D,P4
+CTA6ASuU(G%De:ART+\EcVZsBlbD*+Dbt6B6/0'DIdI!B-;86Aor6*Eb-A(AThX$DfBQ)DKI"+
ASlC"HY%):Bk(^kASuU</e&-s$7-g,Des6.GA1r-+Cf>#AKYVsDImisFCeu*@X1!WAoD^,BkCd`
ATVL.+>5d)+FYq7H:gt$Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%isDf9H5;cH%X6pX^=/4k.[:IK>I
Bl8$(Eb8`iAQ)Po:..BG6k'JL+?V/)HtmS1BkCd`AUH']4q.i.$=%%OB5)71;eTTMARp2u$=%%O
B5)71882^MCh[NqFD5W*I9Ttd$=%7iE+O'+Bl7^5@:FD.HX'<aEc#6$<,ZQ!@:FC&+<VdL+FSZB
>]=+aATD?oHYI)%3alK@I9dt#6Z6gYASuThDej].Cht5'@:O(qE$0=8EcYr5DBNh*D.Rd:%16?R
H#R>8Ch[d&HXUGqB6%s>HX'<aEc#6$<,ZQ!@:Wn]Ec<-D+FSZB>]=+aATD?oHYI)%3alQ0B6%s>
>p*B>Df'?&DKJirCO9K#A0?)7Eb'5EFCfN8F!,RC+D5_5F`9!TF_Pr/I16NgBR+Q.EboH-CO9K+
Ci3ZuATN9H>Y]3XD..6[Dej].Ci!utD.Rc2I=5=)E+*BjEb/j0BkCj9@;Kat@;TRsI9dt#6Z6gY
ASuThDej].Cht53@;TRs+D,Y4D'3tBATKmT+CT)&DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.
EboH-CO9K+CiX*!F+&C?:2b/i@;Jn]CO9K+CiX*!F!)TRI9Trq@:s.lAS-:'An*l1Ci"-'AoiB+
+C%9PD/Ej%FB!0oHXU`,+Du+8Ci<flCh4`,@;TQuEb/ioEb0,uATKmT@;Kb#AS-!+4$"a0ATW'8
DBNeA+ED%*ATD@"@qB^/I16NgBR+Q.EboH-CO9N'ATW?I>Y]3XD..6[Dej]/B4Z0-+<VdLI=5=)
E+*BjEb/j0BkCj9@V97oI9dt#6Z6gYASuThDej]?ATVs,AThX++E(_(ARfh'+D,Y4D'3e?F<G+.
@ruF'DIIR2+C\bhCNXT;I16NgBR+Q.EboH-CO9N.CjgY8:2b/i@;Jn]CO9N.C`jiC+<VeTI9Trq
@:s.lAS-:'An*l2DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+E2IF+Co1rFD5Z2@<-W9
A79Rg@UX=h+C\bhCNXS=Anc'mF+"K)>\JD%ATDU$DJOT/Df'H.I=#3oDfT]'CfG=gHXgu2E,$L<
+<Z)\>?l,UB4Z*pAp\6(@le+<D/a6<>p*B>Df'?&DKJirCO9Q0D/aN,F)to6+Du+8DJsZ8F!+q;
+ED%1Dg#i4B-;D3Blmo/F)YPtAKYE!A0>r,DfTr2DJ=!$+Dbt+@;I'#A7]Y#BkD'jEcZX<$=%7i
E+O'+Bl7^5A7^19>Y]3XD..6[Dej]1AKW*<+<VdLI=5=)E+*BjEb/j0BkCj9A7^0p+C%9PD/Ej%
FB!0oHXpi3E,8s.+A,Et+ED%7F_l.BGA2/4Dfp.EEb0?8Ec*"0De*F-%16?RH#R>8Ch[d&HXp](
I=#3oDfT]'CfG=gHXp](+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.3CjfS3>XNFHD.RU,<,ZQ!A7]Rg
FCfM9DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%I16NgBR+Q.EboH-CO9T'ChId-
I=#3oDfT]'CfG=gHXp](B6%r6+<Z)\>?l,UB4Z*pAp\6(@le.3ChId-I9dt#6Z6gYASuThDej]?
ASl@/AKZ28Eb'5EFCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-I16NgBR+Q.EboH-CO9T+A:8f0:2b/i
@;Jn]CO9T+A0<!;+<VeTI9Trq@:s.lAS-:'An*l4Bk2Wt+C%9PD/Ej%FB!0oHXpi#FD5Z2@<-W9
Bk1dmFD5?$@psInDf-\+DIal2FCB9*F*),+F+"K)>\JD%ATDU$DJOT0Ble6AHX'<aEc#6$<,ZQ!
A8-+(+<VdL+FSZB>]=+aATD?oHYI)%3b2rGE.)"7>XNFHD.RU,<,ZQ!A8-+(CghT3A8,OqBl@lt
Ed8dG@VTIaFE8R5F!,R9G]\?C$=%7iE+O'+Bl7^5A8Z43HX'<aEc#6$<,ZQ!A8Z3++<VdL+FSZB
>]=+aATD?oHYI)%3b3,EI9dt#6Z6gYASuThDej]9BleA=DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+
FCAWeF(HJ+Bl%@%I16NgBR+Q.EboH-CO9T1@sr]/:2b/i@;Jn]CO9T1@ium:+<VeTI9Trq@:s.l
AS-:'An*l4De"3$+C%9PD/Ej%FB!0oHY.2:D..O-+CoD#F_t]-F<G[:G]Y'NF(oN)+EV:.+Cf>-
G%GQ5Bl@m1+E(j7FD,5.-tI7+@rs.BG%G]'I16NgBR+Q.EboH-CO9T2F(KHAHX'<aEc#6$<,ZQ!
A8lU$F<D\K+FSZB>]=+aATD?oHYI)%3b32NATW?++C%9PD/Ej%FB!0oHZNb?+Co1rFD5Z2@<-W9
E+*cqD.Rg#EcZX<$=%7iE+O'+Bl7^5ARp49>Y]3XD..6[Dej]2A0<!;+<VdLI=5=)E+*BjEb/j0
BkCj9ARp3p+C%9PD/Ej%FB!0oHY$`%F<G+.@ruF'DIIR2+E(_(ARfh'I16NgBR+Q.EboH-CO9W7
I=#3oDfT]'CfG=gHY%:A+<VdL+<Z)\>?l,UB4Z*pAp\6(@le1CI9dt#6Z6gYASuThDej]2A8--.
FCf]=I16NgBR+Q.EboH-CO9Z7ASupC>Y]3XD..6[Dej]3F(K53+<VdLI=5=)E+*BjEb/j0BkCj9
AohO$I9dt#6Z6gYASuThDej]3Bl\9:+CoD#F_t]-F<GX9DKKH-@qC&t$=%7iE+O'+Bl7^5B4PRm
F+&C?:2b/i@;Jn]CO9])AT2]5+<VeTI9Trq@:s.lAS-:'An*l7A7]_$I9dt#6Z6gYASuThDej]4
Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#F+"K)>\JD%ATDU$DJOT3ATW?I>Y]3XD..6[Dej]4ATT%;
+<VdLI=5=)E+*BjEb/j0BkCj9B4Z15>p*B>Df'?&DKJirCO:)5FE2),G%G_;DdmHm@ruc7Ao_g,
+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5B4Z1*G^XpD:2b/i@;Jn]CO9]*
FE2UK+<VeTI9Trq@:s.lAS-:'An*l7ATVs;I9dt#6Z6gYASuThDej]4ATT&8AT;j,Eb/c(FDi:5
G\(B-FCfk0$=%7iE+O'+Bl7^5B5DKqF+&C?:2b/i@;Jn]CO9]1Ddmc1+<VeTI9Trq@:s.lAS-:'
An*l7Ci<d(I9dt#6Z6gYASuThDej].DII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBn
F+"K)>\JD%ATDU$DJOT3Ec?GR>Y]3XD..6[Dej]4Ec<-D+<VdLI=5=)E+*BjEb/j0BkCj9B6%s>
>p*B>Df'?&DKJirCO9Q3ART[l+CT.u+Dl%-BkDW5B6%p5E-$F:$=%7iE+O'+Bl7^5B68QK>Y]3X
D..6[Dej]4F<D\K+<VdLI=5=)E+*BjEb/j0BkCj9B68Q-+C%9PD/Ej%FB!0oHY6o3+A*bt@rc:&
F<G[:G]Y'?Ec5e;8g&4eD/^V.Bl[cpFDl2FI16NgBR+Q.EboH-CO9`2E,KK?HX'<aEc#6$<,ZQ!
BP_X*C`jiC+FSZB>]=+aATD?oHYI)%3bW>KDJX`,+C%9PD/Ej%FB!0oHXpi3E,8s.F!,O;DfTqB
A7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGq".N$=%7iE+O'+Bl7^5C2[WkB4ZL<>Y]3XD..6[
Dej]7De*9hAKW*<I=5=)E+*BjEb/j0BkCj9C2[WkB4ZKs+C%9PD/Ej%FB!0oHXpQ1F!,O<DI[6#
CghC,+Cf(nDJ*N'@;]Tu@rc-hFD5Z2+E(j78l%htDdmHm@rud?%16?RH#R>8Ch[d&HYRJ0BOu"!
I=#3oDfT]'CfG=gHYRJ0BOu"!+<Z)\>?l,UB4Z*pAp\6(@le@CA8#OjE.)"7>XNFHD.RU,<,ZQ!
A8-+(CghT38l%htBOu"!I16NgBR+Q.EboH-CO9l1I=#3oDfT]'CfG=gHYd=;+<VdL+<Z)\>?l,U
B4Z*pAp\6(@leF=I9dt#6Z6gYASuThDej]:@;BEs@;]TuCi<`m+A,Et+D5_5F`;a<$=%7iE+O'+
Bl7^5Ci<frEc?GR>Y]3XD..6[Dej]9De!F#E$-8GI=5=)E+*BjEb/j0BkCj9Ci<frEc?G4+C%9P
D/Ej%FB!0oHYdD;F<G4:Dfp#?+CT.u+EM[>FCfM9GA2/4+DtV)AUP!p>\JD%ATDU$DJOT9@;BG&
HX'<aEc#6$<,ZQ!D..3k+<VdL+FSZB>]=+aATD?oHYI)%3c/;@AURi,>XNFHD.RU,<,ZQ!D..3k
F!+'tF(96)E--/L%16?RH#R>8Ch[d&HYmS?I=#3oDfT]'CfG=gHYmS?+<VdL+<Z)\>?l,UB4Z*p
Ap\6(@leICF+%=:>XNFHD.RU,<,ZQ!D..3k+Dbt)A0>r'EbTK7I16NgBR+Q.EboH-CO9o9CjgY8
:2b/i@;Jn]CO9o9C`jiC+<VeTI9Trq@:s.lAS-:'An*l=DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2
C1UmsF!,17+CT)&+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO9r1G@Z,K>Y]3X
D..6[Dej];ATqZ-+<VdLI=5=)E+*BjEb/j0BkCj9DIn$&I9dt#6Z6gYASuThDej]0Eb/[$ATJu&
+Dtb7+Co1rFD5Z2@<-XA%16?RH#R>8Ch[d&HZ!b5G]8(X>Y]3XD..6[Dej];De404+<VdLI=5=)
E+*BjEb/j0BkCj9DJs*2E.)"7>XNFHD.RU,<,ZQ!Eb0?8Ec,q@@3BB#F*&OCAfu#$C1UmsF!,[@
FD)e7D]iV9E,8s#@<?4%DKC48$=%7iE+O'+Bl7^5DJsW0Ec?GR>Y]3XD..6[Dej];DffW4E$-8G
I=5=)E+*BjEb/j0BkCj9DJsW0Ec?G4+C%9PD/Ej%FB!0oHZsCKA9/l3EZfI8F*)IGAo_g,+=MLa
+EV:*F<G"4AKYl/F<G:8+D5_5F`;CEDfQtAF_Pr/F+"K)>\JD%ATDU$DJOT:FFAL@:2b/i@;Jn]
CO9r@+<VdL+<VeTI9Trq@:s.lAS-:'An*l>FF@F;>XNFHD.RU,<,ZQ!ARoLs+CQC1ATo8=ATMr9
F(96)E-*4FF(oN)+A,Et+Cf>-G%GQ5Bl@m1I16NgBR+Q.EboH-CO9rCI=#3oDfT]'CfG=gHZ"$M
+<VdL+<Z)\>?l,UB4Z*pAp\6(@leLOI9dt#6Z6gYASuThDej]2A8--.@3BH!G9CIAE,95uBlkJA
DfTA2F`V87B-9fB6m,uXDK]T/FD5Z2F+"K)>\JD%ATDU$DJOT;@W#UkATN9H>Y]3XD..6[Dej]<
@W#UkATJt:I=5=)E+*BjEb/j0BkCj9DdmTmD.Rd:>p*B>Df'?&DKJirCO9u/C1Ums05PQ:@;KKt
DIIBnF!,(8Df$V>F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT;A:8f0
:2b/i@;Jn]CO9u1+<VdL+<VeTI9Trq@:s.lAS-:'An*l?A:7`+>XNFHD.RU,<,ZQ!DfB9*F!+n/
A0>AuDf]K2+Co1rFD5Z2@<-'nF+"K)>\JD%ATDU$DJOT<@:O(`I=#3oDfT]'CfG=gHZ3D'CLeP1
+<Z)\>?l,UB4Z*pAp\6(@leR;@r#V'>p*B>Df'?&DKJirCO9N!@r$-.F`8I3DIal1ARfY%ATDi7
G@>Q7ARlp)E+*6f+DG^9A8,OqBl@ltEd8d>Bl%@%I16NgBR+Q.EboH-CO:#@I=#3oDfT]'CfG=g
HZ4!J+<VdL+<Z)\>?l,UB4Z*pAp\6(@leRLI9dt#6Z6gYASuThDej]=F`\a7DIal"Ec6#?+ED%*
ATD@"@q?d,DfTB:%16?RH#R>8Ch[d&HZ4+LI=#3oDfT]'CfG=gHZ4+L+<VdL+<Z)\>?l,UB4Z*p
Ap\6(@leROFF@F;>XNFHD.RU,<,ZQ!F*)>@ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYd
AKYT!Ch7[9%16?RH#R>8Ch[d&HZE\0DIIBnF+&C?:2b/i@;Jn]CO:)5Ao;$oATJuBI9Trq@:s.l
AS-:'An*lBAS,ggD.Rd:>p*B>Df'?&DKJirCO:)5An?!oDI[6g+Du+8Ci<flCh4`,@;TRs+D,Y4
D'3tBATKmT+CT)&DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO:)5B4QF;>Y]3XD..6[
Dej]?AS5Nr+<VdLI=5=)E+*BjEb/j0BkCj9Eb/loI9dt#6Z6gYASuThDej]?AS5^uFCfJ8@;]Tu
F`)52B5)F/ATAnc:IH=9Bk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZE\=FC]fH>Y]3XD..6[Dej]?
ATMs(+<VdLI=5=)E+*BjEb/j0BkCj9Eb0<6A:7`+>XNFHD.RU,<,ZQ!Eb0<6DfTE1+EV:.+Dl%<
F<GU8@qBP"+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA1;p9$=%7iE+O'+Bl7^5Eb0E4I=#3oDfT]'
CfG=gHZE\@D]g/F+<Z)\>?l,UB4Z*pAp\6(@leXAG&Me7+C%9PD/Ej%FB!0oHZE\-ASuU+Gp%-=
G%l#/A0>f"C1UmsF+"K)>\JD%ATDU$DJOT>ATi!0AU&WM>Y]3XD..6[Dej]?ATi!0AU#=?I=5=)
E+*BjEb/j0BkCj9Eb0E4DIn'@>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7E-67FA8,Oq
Bl@ltEd8dG@VTIaFE8RKBln#2DJpY/G]7J-DIIX$Df0WE%16?RH#R>8Ch[d&HZEtOHX'<aEc#6$
<,ZQ!EbupA+<VdL+FSZB>]=+aATD?oHYI)%3c](c>p*B>Df'?&DKJirCO:)EDK?pm+DkOsEc3(A
@rc:&FE;j>$=%7iE+O'+Bl7^5EccDOHX'<aEc#6$<,ZQ!EccCG+<VdL+FSZB>]=+aATD?oHYI)%
3c]=aI9dt#6Z6gYASuThDej]?F`)7C8g&4eF*&OG@rc:&FE;j>$=%7iE+O'+Bl7^5Ed2YRHX'<a
Ec#6$<,ZQ!Ed2XJ+<VdL+FSZB>]=+aATD?oHYI)%3c]IdI9dt#6Z6gYASuThDej]?AS6.%@<*K%
G]7\7F)u&6DBO"3@<,jkI16NgBR+Q.EboH-CO:,HAU&WM>Y]3XD..6[Dej]@G@c"A+<VdLI=5=)
E+*BjEb/j0BkCj9F*D2?I9dt#6Z6gYASuThDej]2G][t7@rri7Bl7R"AKYf'DIjr%G]7J-DIIX$
Df-\0Ec5e;GAhM4+D>=pA7]d(@rH4$ASuT4@;]TuF('6'I16NgBR+Q.EboH-CO:2FARo7qI=#3o
DfT]'CfG=gHZaC@A7Bg,+<Z)\>?l,UB4Z*pAp\6(@leaRARo7qI9dt#6Z6gYASuThDej]?ATW'8
DK?q/+Dbb5F<GL6+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<DfTB0+E)-?.!R1h
%16?RH#R>8Ch[d&HZaC@F+&C?:2b/i@;Jn]CO:2FATJt:+<VeTI9Trq@:s.lAS-:'An*lEF(KE@
>p*B>Df'?&DKJirCO:)5FEMVAF!,[FEb$;5AS,LoASu!hF+"K)>\.e`HUqj`BP_BqBQRs+B713r
>\.e`HW+TdA7];"C2[X!Blmp,@<?'\F(KB-AU/>P2,6Ij+E;KGF`V,7CLqd4+Cf>-Anbm#AoD]4
E,ol3ARfg)-ua3AC2[X!Blmp,@<?'0/e&._67r]S:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8
@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$
F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4
/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUr
F"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86
?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?
%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-
2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/hAooOm2^/\<:-pQB
$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH@<QR'A9/l9
F(HJ4AfrH_-Qlo4@<,ddFCfJ%$4R>;67sBOASuO6-Z^CS@Wcd7/Tk]BGp4@k/hf%'GAhM;@<-:/
DIdet$;No?+?:T+1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b3ZpF+3\iZB
-Rg/h+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a-RU8h%15is
/g*.t3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT
+Z_A:,VTZ7%15Q[4#&fpASkjkAKX?_EcP`/F?=;W@:UK.C2[X!Blmp,@<?'.+BosC+EDRG+=CW@
Bl%<pDe*ZuFCfK$FCcgB>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=Ma+=D,KC2.Zt
Ch\!&Eaa'$-QlV9De(7Y-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH>9G^EDe't<-OgDMFE21J
;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@
B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlW
F=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i^$0j?X]3\iWAA7BS%
DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ77Q*=_4&fd4F<FM!
DeioGEccCG-YdR1Ch\!&Eaa'$;f-GgAM>ec%16$IBkDH;7Q*=_4&fd4F<EnYF(o,GB6%s-BlkIF
C2[X!Blmp,@<?'[Ec6)0Ch6=LCLqO--QlV9F(KH.De*ZuFCfK$FCcRB-YdR1Ch\!&Eaa'$?Z1+%
ATqL'AU#sc,p7;CBlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*Zu
FCfK$FCfkC:Ng;iG%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5
BlJ/:FD,*)+D58'ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[
Eaa'$?Z:%(B6%EtD/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;>\J.hAp\35
FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8IY8l%htA8,Oq
Bl@ltEd<'UB6%p5E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4
F_t]1@<?(/%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8Bl7Q+C2[X!
Blmp,@<?''DJsW.@W-1#I4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5
BlJ?8@XS[m+C&f&Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/HW>-$
DJ(),De*ZuFCfK$FCcRk6q2SW%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4
Apk*q+C&f&Ec#6$F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0
Ch\!&Eaa'$I3;+!FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3
>?q[F>\JD%ATDU$DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O8Q/GO:..lF+<VdL+FSZB>]=+a
ATD?oHYI)%3`JXA;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;
DIdZq.3N>:+E)-?F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,BkCd`ATVL.I=#3oDfT]'CfG=g
HY.2:D/!Tj@qBanGT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`ATVL.I9dt#6Z6gYASuThDej]3
DfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA93/.$=%7iE+O'+
Bl7^5B6%s-BlncM>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE,961
I9dt#6Z6gYASuThDej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m
@ruF'DLHk::2b/i@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+aATD?oHYI)%3b`27@qB^m@ruF'
DLGe5>XNFHD.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-
CO9c-@sr]/:2b/i@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3b`29I9dt#6Z6gY
ASuThDej]3DfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&
Eaa'$I=#3oDfT]'CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*BjEb/j0BkCj9F(KH.De*ZuFCfK$
FCfl++C%9PD/Ej%FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#
Ed8dOEbTW,F!,FBARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/Ed)GBA930G>Y]3XD..6[Dej]B
GAL]0AU%g-GAhM4F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?DfTB0I9dt#6Z6gYASuThDej]B
DKg,0E,]B!+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpe"L
$=%7iE+O'+Bl7^5GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6+<VdL+<VeTI9Trq@:s.lAS-:'
An*lGDfTB)Blnc/+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGq".N$=%.[
A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&
Eaa'$I3;s9A0=K?7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2
F!+n#Dfp.EFD,5.8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@
ATKmA$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OG
DfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+CoD#
F_t]-F<G19@:sFgDKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>ASl.-AUP!p+<Xp'FCf;39jr'X
A8c[0+D5_5F`8I>Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'
FCf;3>YJR*AQW1[F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+
G@,H'GUIkJ$6UHrASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$
DIm?$FDi:DBOr;Y:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3
D..]4@V$Zn@<6!j+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<Q
GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7
HX(uI%14C(+<Y-6@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%
Df0`0DKKT2DK@E>$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*
AQXCkDe*E%FD,*)+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?
%14C(:-pQq4FVa.INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJ
IXZ_g%14C(>\.e`HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2
DJ((sFCf]=FEDkEDe*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8p
A8c[5/0IW#DKU1H@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&
Eaa'$I3<`JCht57F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!
Blmp,@<?(/+F.mJ+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,
C`l>G6nSoU+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("
@;IT3De+9C8l%j'+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j
+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?S
FCf:u$6UH_DKBo.Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2
D(g*ICM>FfA7TUrF"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bb
A7TUr/g*`'F*(i,C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!
+<Y3/@ruF'DIIR"ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$
Et&I!+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+
Df-\9Aft>lEb/j0BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt+
+Eh=:F(oQ1+C'#"G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.
BkM*qBkM+$Bl7Q9+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97
Ci"$6Bl7Q+@Vfsq+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/
DKTf-Eaa'$I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ
@;]Uo@j"]qDKK<3+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?
H#@_4GV*TCB4u*qB4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-
/TZ2TFCBDGBPD*mCh[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r
#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL
+C&f&Ec#6$F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bs9
#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#+<VdL>]+J#D..7%BmO>"$4.gt
>\.e`HY%);D.R`rFCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=
FF.b@A8Gt%ATD4$AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5
F`;CS+B38%D..3k+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$7-g"@V'1dDL6P<EaiI!Bl/8-
$7-g8AT;j,Eb-@@B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<
-OgD/+Dkq9+=CoBA8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?L
AS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi<ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9u1+FRKf
AU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'
AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;
+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[
Dej]:Ci^_I>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-
DJ*csH[U;O$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#:N0l_+EV:.
+A,Et+Co1rFD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB
%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G
:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXI
A7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!
1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'
B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHbDdd0!>]aP%
FEDVOC2[X!Blmp,@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2s
AISth+Dbt)A7]9oCh[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(Ci<`m
+=CoBA8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`
BP_BqBQRs+B73ui%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA
C2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+Td
A7];"%16?SFCf:u$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/
+D58'ATD4$ATJ:f+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8
AKYMtEb/a&DfU+GF)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO,p6H%
AS5^pHZit@@UX@mD1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U+CfP7Eb0-1+A,Et+E2IF+Co1r
FD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL
+<VdL+<XEG/g,@PDId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBs
Bl8'<%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3
>?q[F>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA
>]aP%FE)GAFCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2
@<-W9A8bt#D.RU,+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5
B2iebHX(Z(G][qJDffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I<9%;E*RKrG][qJDffQ3Bl7R"
AUAiR+<VdL+<VdL+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)>Y]3XD..6[Dej]@ATV[*A8Gt%
ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@AM7e:BPoJFASlBkFCf]=EHQ2A
ATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>\.e`HUqj`BP_BqBQRs+B713r>\.e`
HW+TdA7];"%16?SFCf;3;e:%nDfBf4Df0!"+CTD7BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkN
ATV[*A8Gt%ATD4$AUQ0?$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MO
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[S4hFDYH(>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]
CO71FATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(o
CghBuH[T@3FCSa&AR'=gG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S
@<H[*DfR7I.3N_DG]Y':DIal#Bl[cpFDl2FI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTM
ARp2u$=%:eAShk`+<XR)DBN2+AU&<=FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4
De!p,ASuTB+C'#"G]\%LHY7A<Ch\!>%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28
EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"A
DIIBn/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g-Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3k
F!,49A8Gt%ATD4$AM/(9GT[G&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^p
HUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHY7A<Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-
DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/
De*ZuFCfK$FCd(HAU#>G%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp
+B<Jo+C%TK<+T0\FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961
/q"iO$4R=b+@.,Z@<?!m+C'#"G]\%LHX^E*I3<T@EbTK7+DGm>GB.D>FCf>4FDi:DBOr;kFCf]=
FEDkNATV[*A8Gt%ATD4$AUP!p+<Y3/Eb/a&DfU+GFD,*)+EM47GB4mKBOr<-AT;j(DI[6#De:+s
9OUn3=BltYDf'H-CghF"Df-\-Df'?"DIdf@%144#%144#7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(
A0?)1FD)e%FCf]=FEDkKA7fXdFCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5
CghEsG^V1e=`8G'+Cf)'Bk(]sGA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHk
DJ<U!A7ZlnBOPpi@ru:&F"SS)DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth
+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H
$=%.[A:%m*F_t]1@<?(/%13OO<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>
@;^00FDi:1A867.F=n"0%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=
FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&
+Cf>+F_u#;/g+,,AKYMpAmoguF<G:=+EV:;ARuunF`\aJBPDN1D..]4Eb0<7Cige6DBO+6Ed8dD
Df021DIIBnF!,LGDJj0+B+51j+EVO7ATVTsE\8J6D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='
+Cf>+F_u#;+Cf(nDJ*NA%13OO>[h8WBl89@ATD6gFD5T?%16?LAS5^pHYmnAFD56'Cib#O1OWJ4
F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%-GASu%*G%G]'@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!
Blmp,@<?(/+Eqj7E-!.<Df021F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;
Ci!Zn+C]U=>]aP%FEDVO=&M=\9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/
+<X$b@;]^h+EV:2F!,X7Cis;3BkAK5Dfm14BOPdkAKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!
+Dbb0ATJu&Eb,[e+<YWDARf:_A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`J
FD)e-AS,@nCig*n+<XoTCh7X/<,ZQ!>]aP%FEDVO4t\HOI=3^W$4R>IBlmp'+:SZ#+C'#"G]\%L
HYRJ0Ch\!&Eaa'$I3<B8Gp$g=@rHC.ARfguGp$d7B4u*qB4uB0>\.bkBR=rD@;p0sA:5S0Dg5i(
+A*boDfor=+EV:*F<G(3DKK<$D@Hpq+Dkh;FEMV8F!,C5+EMXFBl7R)+CT.u+E)@8ATAo3FD,6+
+EVmJATKIH<+oue+CT)-D]i_3Ch.T0AoD]4GB.,2E+NQ&DJsE1Dfor=+EV:*F:AR"+Cf>-FCAm$
+Dbt6B-:c&@V'(\ARlp)FE2)5B6,[J<+ohcG%G]'+C'#"G]\%LHZaOK@<?(*Ao`*6Eb'6>/0K"F
AKYr#B4ZNsE+*BjEb/j0BkCj9Fa%Y1FCf]/Ed)GBA93/M%144#@ps6t@V$[)F(Jl)FDi:7ASu("
@<?''>\.bkBR=l>GB.,2E+NR.+C%TK<+T0:+D,P4+EM[8BHVM;Eb'56FD,*)+Ceht+C\n)D..=)
@;Kb*+Eqj7E,]B!+CT.u+DG_7ATDm(A.8kg+DG^9FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=
FEDkEDe*ZuFCfK$FCfkQ+B3B,+CT=6G@_n6BkM+$+EMI<AKYhuDKTB(+D#(tFD5W*%144#BlbD*
Cj0<5F!,@3@qB_&@<-W9GA2/4+C%TK<+T/a%13OO>\.e`HY%);D.R`rFCfk0$>OKiE,o\nF(KB-
AU/>P2,6Ij+E;KGF`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3AC2[W3/e&._67r]S:-pQU
;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`<HD_l
94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";Ci<c9
D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q
9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX67sB'
6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&
De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@
%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+qAooOm
2^/\<:-pQU,#`/hAooOm2^/\<:-pQB$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0
-YdR1-RgT/-ZsNFCi^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4@<,ddFCfJ%$;No?+@\1L0KV[6@Wc<+
;KZk=A7BS%DBL;S+ED%4CgggbA0?)1FD)dW/hf%'GAhM;@<-:/DIa1`%15Q[4#&fpASkjkAKX?_
EcP`/F?=;W@:UK.B4YslEa`c;C2[W1+Bot/D'138F_PZ&C2[WnBleB:Bju4,Bl@l:+BosuCh7$q
+=ANG$:AoUCb%t14#&fqATT%^F`MM6DKIsYA0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH
>9G^EDe't<-OgDMFE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,
Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K
+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%
3\i]<-o!.n>9GpL3\iW:-Y-\,F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK
+Z_A;+=ANa+=nW`-mO0`><3lj3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDP2ENWT<+U,m+B*,q
CLoSJFEAWQ@:FCYD/X3$0JFj`$<(VPAooOm2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@
D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc
@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/i#1)/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ
9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!
7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]o
F*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(
Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZ
F:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02
DJ'CcC2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2
C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!
@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?1
6q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM
+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)
Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["
Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'
6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>
F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.
8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*
Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,
-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et
+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9
AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__D
DBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-
D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQU
D..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb
8P`)E3Zoe)/hen5-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@
GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs2
8l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQk
DdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_
E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4l
Eb0<5Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?1
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuq
De!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-
ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt
:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q
05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8
BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"
DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dk
ATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M
@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-/i#1)/KeS8Fsd_+7Sc]G78c90-YI".
ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y
3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A
%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>
+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*
Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X
+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&
+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI
6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RH
BOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P
%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf
@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7
A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;
E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q
05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9o
D.Rg&De(IC-u*[2F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?
+EDUB/e&.1%14j>+B!?"+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y
+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#
+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#
+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e
$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#
+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%17&p
C2.Zt1,2Nj/h1g\C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JGEp$;No?+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU0K3o[F>5]s@:Wn[A0?21Bl%@%%15is/g)i-De!lD0d'n8A7]9o5uU-B8N8RMA9Da.
Et&IO67sB73,`;K0f1"eDKBB0FCeu*5uU-B8N8RMF(KH8Bl7Q+Bl8$2+DPh*A7]p,C2[W*F`_>6
F!,F1Ea`frFCfK6%15is/g)l/A7]7)2B[$OGB.D>FCf>4AoD]48g$,H0JO[Z$;No?+>PWgDg!lo
+CSeqF`VY9A0>K&EZdss3A*!@+:SYe$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT
,:@2BAU#=F.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;
67sBjF`MM6DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%J\+=CoB
A1%fn%15is/g+YHEcP`/F<GdGEbfB,B-;8<Blmo//Kf.ZART?s@<3Q/AS#C`A.8l\De*orBkhQs
?TgFm-YdR1F)>i2ATVL)FE8f=$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is
/g)NUC2[W1+D58-+FPjbB6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-K
A7B+pF=.M):-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M):-pQU-Y[=6A1&L4
ATVs;+?MV3FE8R:B6#,/An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ft8l%ht
GAhM4F!,17+E(_(ARfg)Ci<flCh4%_6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/n
Dfp/@F`\aFEZc`VISP??-OgDoEaa$#+=DMb:4@U=%14L2@4*U@De*KfBkhQs?R[+1ATT%BH[\_=
I4#I2.1HUn$;No?+EM+9+A,Et+E_a:EZf./H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,
FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)-OgD2FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%B
C2[X%Eb\TqATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@
F`\`R8l%htE,ol3ARfg)F(KH9E$l)%H?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]n
Bl5PFAU#XHCghEsGT^U4Ch54A%14Bj$7-fe:IH=HDfp)1AKY].+Cf>,E,Tf/A0>f&+CQC1F_tT!
EZf:4+Cf4rF)to6/g+,,Bla^j,p6f6Ch4_tF)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7
DfU+GD..NtEbSru%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9
D/a3*Bl7Q+FD,B0+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEs
GT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=E
A8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<Q
Cis0&@<?(*+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*
+<YuVH>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$
:i^,UD.7<m/p(ZLI16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(d
G%G]8Bl@l6IXWLa8l%j'+B*3$EarZ'6Z6LH+C&.o>\7nmFDc#=ATMR3AKY6#Ebp)9FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[WsC3+f.DJsQ4@;L"!H=_L6$4R=g
+Cf>,D..<mF!,(5EZee$C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'
Ecc#5B-:V*Ecl20%16?]ATVa"DJ+')HX('!CisT4F(K<=HS]5MI16NgF(KH0ASu.&BR<uoDesQ5
DKBB.Ecl20I=!Y#2/mYc%16?^GAgu0CisT4%13OO>[h8WBl89.De!p,ASuU<%13OO>]!nbATVX.
Ch4%_>]aC`Ch7Ns@rH7,ASuU2%16?YDIm<rCisT4%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d0
Bk;K@FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d(/p(ZLI16Mm$=%I[GApu'AISuOBl7m4
FF/=[C2[W8FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*p2DfTDAFCf]F%13OO>]++sE+*Bj
%16?SDK'`?H[:!QDe*]nCLo,?AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA9E!.CbBg@G^U#.
%16?XATr*%B4VMZ>\S(pF`_tVH>7A/FDl)6F"VQGG^U#.%14CdDIn$2@:s-\$7/qqDIm<rCisT4
%14CdBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku
$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1
A7]up$4R>IASu%*A8bt#D.RU,I16M                                             ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekC*0fU:2+>G_r1,pC30H`/-+>Gbs1,^701a"P-+>GSn2E)a53?U(7+>GYp1c6C20d&>0+>GPm
1G^..1E\M2+>Gl!1cHO40d&50+>G\q1H?R40d&53+>Gl!1H-F22]sn6+>t>s2]sh3+>YoJ:IINL
8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X8PDNC8Q/Sa;H\$O
@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<r_:K(5"C2[X!Blmp,@<?'qDe*ZuFCfK$FCcS6
Df^"CE,ol,ATMp2E`>h&:L?^i6psg<?Ys=gDe*Bs@j#VsEbf3(GA\O&:IIuX:IIuc8l%i^D.I^+
F`Lu'+D,P4+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r./^
:IHgPA5l>m:L@jTA8Gt%ATD4$ARB:bC2[X!Blmp,@<?''D..I#A8c[0+B2-):L\H\Ch.:!A8G[r
AU%j!DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T0@F_PZ&C2[X!Blmp,
@<?'s@<?(*B4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3
=D2DiFDl2FC2[WT:IH=6A7TUr+D>J1FDl2F/p)>[+DG^9D..I#A8c[0C2[WiDg#i+G@,H'GY1b"
+E)F7Ecu/.G9BRf<+T/SF(Jo*D.-ppD]gH;F_PZ&C2[X!@<?(*.;Ed3Ch\!&Eaa'$<HD_lCLqd4
EHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].De*ZuFCfK$FCcn9De*ZuFCfK$FCeft
G%kN3?Z]k(C2[X!Blmp,@<?''Dg#]4G%kN3+A?3CAQW\cA8lR(<HD_lCLqd4EHE=GF(KB-AU/>>
@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].De(;6@;]dkATMs.De*fq@r5Xl+DkP)BkCptF<G16EZdtM
6m,oKA8c@&@;]dkATMs.De*Bs@s)X"DKKi+@r5Xl+DkP)BkCptF<G16EZdtM6psg<<D>nW<$5U[
A8c@&@;]dkATMs.De*p-F`Lu'E+*6n@;[3)@;]dkATMr9AoD]48l%iR:K::[73H#LA8c@)Eb]?-
A86$n+E2@>C1Ums+EM+9F`;YQH>7A/D..-r?Z]k(9jqaR+A,Et+=MP^H>7A/D..-r/p(ZL.3NG8
FCf\>Anc'm                                                                ~>
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
zz=:zz,'T UNION UTF8 WORD XML abv afterstr alltrim badappend badblia badbu '
zz=:zz,'badcl badfl badil badjr badlocn badobj badrc badreps badsts baduniq'
zz=:zz,'ue beforestr bget bnl boxopen catrefs cd changestr checknames check'
zz=:zz,'nttab checknttab2 checknttab3 createjod createmast ctl datefrnum db'
zz=:zz,'lquote decomm defzface del destroyjod did didnum dnl dpset dptable '
zz=:zz,'empdnl fex firstone fod fopix gdeps get globals globs grp gsmakeq g'
zz=:zz,'uids guidsx host hostsep isempty islocref jappend jcr jcreate jderr'
zz=:zz,' jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv j'
zz=:zz,'ustpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc ne'
zz=:zz,'wd nlargs now nowfd obidfile od ok packd plt put quote read readnou'
zz=:zz,'n readobid regd remast restd rv rxs rxsget rxssearch saveobid secon'
zz=:zz,'d tc trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),'
zz=:zz,'(<<;._1 '' jodliterate ALERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJODH'
zz=:zz,'EADER BEGINJODPOSTP BEGINNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDIND'
zz=:zz,'EX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKENS IFACEWORDSPFX IFACEW'
zz=:zz,'ORDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLCLEANTEX JLCODEFILE JL'
zz=:zz,'DEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE '
zz=:zz,'JLOVIEWSUFFIX JLOVIEWTEX JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLit'
zz=:zz,'eratePreamble LATEXTMP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNHEAD '
zz=:zz,'MARKDOWNTAIL MARKDOWNTMP PANDOCTOKPAT ROOTWORDSjodliterate STRINGTT'
zz=:zz,'OKPFX TEXTQUOTESINGLE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLI'
zz=:zz,'MIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenstrs'
zz=:zz,' boxopen changestr charsub ctl cutnestidx cutpatidx dbquote dbquote'
zz=:zz,'uq fboxname ferase fexist firstones formifacetex formtexindexes fsi'
zz=:zz,'ze fuserows gbodylatex gheadlatex gpostlatex grouplatex grplit ifac'
zz=:zz,'emarkd ifacesection ifacewords ifc indexgrouptex indexwraplatex jod'
zz=:zz,'literateVMD jpathsep jtokenize latexfrmarkd long0d0latex markdfrghe'
zz=:zz,'ad markdfrgpost markdfrgroup markdfrwords markdj markgassign markgn'
zz=:zz,'onj patpartstr ppcodelatex read replacetoks rtrim setifacelinks set'
zz=:zz,'ifacesummary setifacetargs setjodliterate seturlsha256 srxm tlf toJ'
zz=:zz,' tslash2 utf8 uwlatexfrwords wfl winpathsep wordlatex wordlit wrapQ'
zz=:zz,'tlatex wraplix wraprgidx wrapvrblong writeas''),(<<;._1 '' jodliterat'
zz=:zz,'eTroubleMakers IFACEWORDSjodliterateTroubleMakers MASTERPARMS ROOTW'
zz=:zz,'ORDSjodliterate ROOTWORDSjodliterateTroubleMakers jodliterateBadBoy'
zz=:zz,' writetd2''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 E'
zz=:zz,'RR00401 ERR00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00'
zz=:zz,'408 GROUPSUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF O'
zz=:zz,'K00400 OK00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX'
zz=:zz,' TESTSTUB WARNING00400 WORDTESTS addgrp addloadscript addloadscript'
zz=:zz,'1 allnames allrefs betweenidx createjodtools dayage delgrp firstcom'
zz=:zz,'ment firstperiod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp'
zz=:zz,' nt nw obnames onlycomments pr refnames revonex swex today todayno '
zz=:zz,'updatepublic usedby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHOR'
zz=:zz,'MARK CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ER'
zz=:zz,'R0250 ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR02'
zz=:zz,'61 ERR0262 IzJODutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT'
zz=:zz,' OBFUSCPFX OK0250 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREAD'
zz=:zz,'ERMAC ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok com'
zz=:zz,'pclut compj compressj createut ctit de dewhitejcr dewhitejscript di'
zz=:zz,'sp doc docct2 docfmt2 doctext docword ed et exobrefs gt jodfork jod'
zz=:zz,'help ljust obtext pdfreader qt reb revo rm rtt textform2''          '
zz=:4211{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1bg+1+>P&q+>Y`20H`))+>GW12_Z@01a"M-0f^@9+>Gl92'=h#0f:sJC2[WX67sB1C2[W*@kB8T
D..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5
@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&
F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?
%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`i
AM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8
ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN
+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu
@X0)1C2[W*Ci<flCh5%)$;No?+<Ve8@Wik:+<Ve8Cht5'@:O(qE$0=8EcYr5DBNh*D.Rc2%15is
/g)8Z@V97o+<VdLB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;CE%15is/g)8Z
@W$!)+<VdL@UWb^F`8I@@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<Ve;AS`J3+<Ve;ASbq"
AKZ28Eb'5B+EV19FE8uUB6%p5E-!QQD.-ppDf[HPATT&)ATVL(@1<Q=67sB'+Co1s+<VdL+Co1r
FD5Z2@<-W9Bk1dmFD5?$@psInDf-!k:-pQU+<Y34C`jiC+<Y3/@ruF'DIIR2+DtV)AKYf'F*)IG
Ao_g,+E1b2FCfK1Et&IO67sB'+CoG4ATT%;+EM+9F!,"-@ruF'DIIR2+E1b0@;TRtATDi$$;No?
+<Ve>A7]_$+<VeCBleA=B6%p5E$/S,A0>r9Blmo/A7]^kDId<rFE7lu:-pQU+<Y<.F<D\K+<Y<.
F<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)ATVL(@3B0&Df$V-Bk)7!Df0!(Gmt*U67sB'+D5M/
@WNY7+EqaEA0>;uA0>u*F*&O;Ci<ckC`mV(D.Oi1AS,LoASu!hEt&IO67sB'+D5_6+<VdL+CfG'
@<?''@;]TuEHPi5Gp$a?Dfp#?+CT.u+EM[>FCfM&$;No?+<VeD@;BEs+<Ve>ASu("@<?''8g&1b
EbTK7F!+n/A0>DkFCAWeF(HJ)F_u)=%15is/g)8ZD/O/4+<VdLD..=-+Co1rFD5Z2@<-W9DIIBn
+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZDIn$&+<VdL@rc-hFCcS4ATo8-Bk)7!Df0!(Gmt*U
67sB'+E(d5+<VdL+E)41DK?q/DIal"Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<YW3@r#Tt+<YW3
@r!2tBk)7!Df0!(Bk;>p$;No?+<VeGF`\`K+<VeGF`\aMDfTB0/0K%GF*)IS+DkOsEc6"M+D#X;
@qBanEa^))DKKe>A8,OqBl@ltEd8*$:-pQU+<Y]9B4N,-+<Y]9B5)F/ATBGHDK9<$BleB-EZed5
A8,OqBl@ltEd8*$:-pQU+<Y]9F*(q8+<Y]9F*)>@AKYetF*&O6@:O(qE$/Y2ART[lA0>?,+=M2;
@r#U(%15is/g)8ZEd2XJ+<VdLEb/m+Cgh?,AU&07ATMp,Df-\=ARTUhBFP;D67sB'+E_a:F!)SJ
+EqaEA9/l9F(Jl)@X0)?DfTB0+CT.u+EV19FE7lu:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=
+Dk\2F(&]mF!)l':IH=:EcQ)=F!*.j0J+t83@PCE%16T`@r,RpF!)SQ@;9^k-OgDmDeX*1ATDl8
-Y[=6A1%fn%15is/g,7EF))n,A7TUr+Dbt)A7]9oAnc:,F<G16EZdss3A*!?+:SZuAT;j,Eb-@@
C1_0rATJu7AS5S!-QjN@$4R>;67s`uAT23uA7]Y#F!,]Z/Kf7UEb'56A7]@eDIm?$Bl5&8BPDN1
F(Jj'Bl@l3BOQ'q+ED%0@<?'k+Co%qBl7X,Bl@m1%13OO:-pQUBQ%s6+EML5@qfOh@j$(?Ci<fl
Ch4`,Dfor=+EM+9+CoV8Bl7Q+8g&(nDe<^"AKYf-@:X(iB+52C67sB/.OdMA+A#%(8PUC.:-hTC
+A#$o:K%]0%15is/g+tEDIjr&AS#C'+Cei#EbSrpAKZ#)FEMVA/0K%C@N])sA0>]&DIjr%DIdet
$;<oP3\`=8@4hur6W-'.0f+/b/e&.e5sd^q3I>0e%15I#9L_0+6W,I/7L]\6$;No?+DkOsEc3(A
@rc:&F<GL@FD5Z2+Cf>#ATJtG+EVNE@:WmkD/XH++CSek+CQC1ATo88@VTIaF<G(3A7Z2W:-pQU
@;]TuD/Ws!ApGM@BOr;uDes6.GA1r-+Co%qBl7X,Bl@l3De:+d5snOG<*<$d%15^+6W-KP<'<8t
0b"I`5u^9T4ZY>R%15X*9h[]21,B@H=A;IP3\iN$$<0Gr<'<8t2%9mZ=]@gQ3\iT&$;Efa912QW
:-CWn2[p*o<(8i13\iZ($;al)85DuD3\i])$<'eq4ZYAQ%15^+:JO&61GK=G%15is/g,">@rcK1
FCf]=+EVmJATJ:f9gM-E:K1In76N\(;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM
6r-lZ/6,Y=3%Rm/<(Ke[/5oD>/4ri::(7O>$;No?+E(_(ARfg)@rGmhEt&IX:JsSD3\V!M<(0_b
4ZY;,$:dui<DYh>1(=Rh<Cp.Y4ZYA.$;EfR;GTG:1^sd$$;No?+Co1rFD5Z2@<-W9F(K0"+ED%*
ATD@"@q?)V6qKaF8P`)I;HZ.D2%9m%$;No?+E(_(ARfg)DIIBn+Cf4rF)rlTA7]^kDIdfL+BM?:
6nD;+;cG;<;GU:h/5oP?<(/?45snOG%15lt8ju*H:.%0*=&2^^/6#&:<%LO;:K:4B;cQCg74_/!
6W-\h$4R>;67sBi@:UL!@VTIaF<G(3A7[;7A7]^kDIdfL+AY<r771$L6OaB3@:X:cC-=U^3Zp",
+BplL.P<@s><3lX+C-+$/g*qV8ju*H:.$44%13OO:-pQUE+*j%+Co&"Bl.R+ATAo'BOPpi@ru:&
+=84M@<?0*E-6&.FEM#6Bl@l3@q]:k@:OCjEcVZs:dJ&O6q'd43Zq!`=%Q.0HQX[h>UKsf:dJ&O
6V(*R4ZXr53\E!3/5SW3845m?%13OO:-pQUE+*j%+Eh=:@WNYD+D#D!ARlo:>TdNi@<-E3A7]^k
DIdI!B-;,1+D>\7F<F@X%16ceF*)J7E'66)-qQm08PXU[03fkR-7C8j8OccQ:4"?n0./1k8M37h
4Wn#ZI45U4%15is/g+_MFE1f"FE8RCDJXS@FD,5.E+*j%+D,Y4D'3h@@;KXiBk:ftAnc'm+DtV)
ATJ:fC3=T>E+*j%4ZZe.+FQ9n>p(A@+=LGT+>#2g><3lW/h^H^+=B2t-9We#.P;iJ3Zoq*03g+P
:dJ&O6q'cr4Uh`-$;No?+Co%q@<HC.+DkP.FCfJ8E,ol/Bl%?'F`V,7+Dbt+@<?4%DK?6o:-pQU
C2[X(H#n(=D/`p*BHV#1+DbV$F<G44Ddm-k+D>>,AKYE&+EV:2Et&IO67sC(ATD6&BlbD-AS,Xo
ARlotDBN\4A8c?<Bkh\u$;+#Y;cH1`4Z[=rA93$;FCf<.@<?0*-YdL,F*(u6-OgDT:IJ#W:I[K.
C2[X(H#n(=D/`p*BHS[;De*g-De<^"AM.\3F!hD(8l%iT;ajSI3biSDF*VhKASlBpFD)dEC2[X*
F(KB%Df00$B.dn5F!hD(%15is/h1FMA7T7jASu$iDKKq/$>OKiCh\!&Eaa'$:-pQ_C2[X!Blmp,
@<?''F"JsdB4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfguGp$^>
Df$Uh:IH=<Ec6)>F"Rn/:-pQB$;No?+Eh=:@UX@mD)re\AS!!+BOr;uDes6.GA1r-+C]/*B-;/3
F*)IG@;]TuB5)I$F^cJ*Bl%@%%15is/e&._67sBoFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5r
EbT].CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(L1$;No?+D>k=E-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*m
Ch[NqFD5W*0+A7`67sBoFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7c8X:-pQUBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=
E-Z>1%15is/e&._67sBpDKKH1Amo1\+EqaEA12LJ3Znk=:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU+B1m';c#bT6r-/m+<VdL/KeYJCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD)*j:-pQU+D,P4D/!Tj@qBanGT\+O/KeYDEc#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"
B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4Et&IO67sB'B6%s-BlkI?+<VdL+<VdY+DkP&AKYetFCf\>
AoD]4B6%p5E$-QS.1HVZ67sB'BkCd`ATMEmFD5Z2+<VdY+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(
Ed8dKFE2)5B+52C67sB'BkCit+<VdL+<VdL+<VdY+D,P4D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:
G]XB%:-pQU+EM+9C2[X!Blmp,@<?''/Kf"QAT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CD
F<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr@VfTb$;No?+<YfNCghEsG\1u?DfTB0+>"^YDKg,0E,]B!
+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpa%.:-pQU+EqaE
A8Gt%+<VdL+<VdL/Ken=CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![6N$;No?+<V+#:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*12gZE0JO"D:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0f!ZWF>,Kn.!R0`B6%s-BlkJ+EbBN3ASuT4@:Wn[A0>u4+EM[EE,oN2F!,LA
Dfd+DAU#>9G%G]<EbTW,Et&IO67sB812gZE0JjnbEc6)>+A#$g6Ub'P;FFGrEc6)>DIIBn+D?%>
ATDU$DJNfo%15is/g)l(De!lC2'?pNE,8rmARloF3ZrBMEcYr4B-;D4FD)dFG@kY?+>"^L@;]Ul
ATJu'@:UKq+Cf>#AISuA67sB812gZE0K:1`A7T7^+D#S6DfQt6@;]UlBl7Q+/Kf(FE,8rmARlo3
GB.D>ALSaGBln#2.!K]GFCem%.1HVZ67sB812gZE0ejeZA867.FCeu*9OUn3=<MR'ARTFbCh4_@
+Cf(nDJ*[$B-;&0DJs-*DKKq/$;No?+>GWi@rsF\+CSekARlo3F(060CLqC).3L2bF`V,+F_i14
DfQt/DII@,H>.80+Cf>#AKZ)+G]XB%:-pQU0f!ZWF>5]s@:Wn[A0<:EEa`p1Eaij'DJ(C@/KekJ
DJ()5Dfp)1AKYf'DIml3DJs_AGB.,2E+NPh$;No?+>GZ_ARdJU+CSekARlp*D]gHC@:O(o.3M,p
F@^O`+ED%4Df]W7DfU+4$;No?+>PWf@<jOc+CSeqF`VY9A0?)7Eb$;)DfT]'FD5Z2+=MGGCagK=
DfQsm+?;&.0b"Ib67sB90Pt6D0K:1tE+EC!ARloqDfQt1F`MM6DKI!LE+*WpDdt4=G%G]8Bl@m1
%15is/g)o'C3=DJ2]uO>A7]9o-t[C<D/!Tj@qBanGUXbWD]ib3FCfK)@:NjkGAhM4Et&IO67sB9
0Q(fP0JO\YA7T7^+D5_'E+irqF!+n/A0>T(@r-:/Bl@m1+EM[7A8-'q@ruX0Gp%3I+E2@4@;TIi
AISuA67sB90Q(fP0JO\T@V'1dDL5o4@s)X"DKL:LD/XT/A0>u4+EDC=F<G10Ch4`$DfQsrG%G\f
ART1'@rH2n$;No?+>PWgDg!fk+=M;BFD>`)Ch\!&Eaa'$.3N,:ARTIfEZfF5EbTK7/0JADFD,T5
.!$gg+D#CuBl"o#A7T7^%15is/g)o'DJs\Q1*@uaE+<fsASbdsAU#XH@:Wn[A0>u4+CSeqF`VXI
@rH1%EbTE(+E(j7GB.,2E+NQ&Ch[cuEt&IO67sB90P"a)0JO[uFa%Y1FCf]/Ed)GBA901B@:Wn[
A0;<g%16T`@r,RpF!)SQ@;9^kCh\!&Eaa'$-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/h1CCE+Not
ASuU2%15is/g+\9@r,RoARlorCi<ckC`mD&Eb-A8D]iJ3DeW`)@rH6sF`V87B-9lV<+T/SDIIBn
F!,[@FD)dh+DtV)ATJ:f:-pQU-n6Z/3Zq$g<(U%_78u]X+A,='<_5_]<(0n38k_QO8PDNO79C[)
9LhuW9M&2_79C[)9NP"f6qg0O<(0n3%15is/g)Pl.6T^78l%iKBlmp,@<?'WEb/Zr@VfTu8k_TG
76s[J79CZA$4R>;67sBYDeEX%+@pWh-Z^DSDfTA2AoD^,@<?4%DBO"B@<?''D.-pfBl7K)/Kf+K
D/!g#@<*K4D]h,&+C]J8%15is/g,+AEcYf5+EV1>F<GdAFD)dj7WU+'Eb0?$Bl7u7GA(]4ATMg!
@q?ckDIal'@;]UlATJu4E+No0EHQ2AATKI5$;No?%15is/g,=KEaiI!Bl,mRDJsW.+Co1uAn?!o
DI[5e$;No?%15is/g)8Z+EqF6-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO:-pQU+<Vdg3[ZF2
+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$4R>;67sBoBk1ctF(96)E-*4=De!3lF!)VS.OdM5+Dk_,
+EM.2+:SZpAo'U_+>Pf4,VU>`+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g+7=DffZ(EX`@mAo'U_
+>Fu]-oihe/nlpc+=AT\+<VdL+<VdLI;NS4+<XEG/g+(8GA(]4ATMg!@q?c2F)YPtAKYE!A0>Q(
EbTi<DKK<'+EV%$.1HW$Ao'U_+>P&^-nHcT/nlpc6"),i.kbTh1,^R(I;NS4+<XEG/g*G&5qQ7_
@4cdJAU%^$F_#3(B-9ql64F9=Ao'U_+>Y,_-t+`B/gjCA.3K`U+<VdL+<VdLI;NS4+<XEG/g*n3
FD,5.Ch7^1ATAng%16raCcsBn1a!nh@4l7H-UK10+<VdL+<VdL+<VeTD.[T,+AP6U+@72mBOr<&
ATW$*EZd[X$>jBk4Y@j7+<W(@/nlpc0JP==1c70M3&t=n.3O%UAo&S4:-pQU3?VjHB5)I/+CT.u
+C>QbD.[TI/g*%p+=LYNBeCbc-Rg/\+<VdL+<VdL+FS*=C`jiq67sBK+>+*1D.[TI/g*(q+=LYN
BeCbo-Rg/\+<VdL+<VdL+FS*=C`jiq67sBJ+?Br=D.[TI/g*+r+=LYNBeCb\-RU>c+<VdL+<VdL
+FS*=C`jiq67sBX+E;OBFCbmgD.[TI/g*.s+=Js#.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBJ
;@NtMAo'U_+>GPm-o!D)+<VdL+<VdL+<VdL+<VdLI;NS4+<XEG/g*hW%13OOF(T5O/g+LV?!JR.
+FPjd/it[m1*@u!+?CW!.1HV3+BTa/+<Ve*+<VdL5p.9m+AO%%+<Wun+<Vde+<VdL6m*Tp+@@7o
+<XN(+<Vdo;BR))+<X?I+<W%;0F\@30d&1n+>GVo0d%So+>Fu]1E\Cp+>P&o+<WQb0d%Sn+>Fu]
0d&1n+?(Dt+<WBm+>Fu]+>Fun+<Ve%67sB7+<YB9Bln&tC^g^o0d&4o+>GVo1*@\p+>P&^1E\Fq
+>P&p+<WQb1*@\o+>=o\0d&.m+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8+<YTEBOu2n$6V&G1*@\o
1*A=p+>P&n+<WE^0H_Jn+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*+<Vd]+>P&^+AP6U+>P&^
@;Km9DKTe*$6V&G1*@\o1*A=p+>P&n+<WE^0H_Jp+>=o\1*A7n+>Fum+<WB]0H_Js+>P&^0ea_*
+<Vd]+>P&^+AP6U+>Y,_:(7OQ0d&4o+>GVo1*@\p+>=o\1*A7n+>P&n+<WE^0H_Jq+>=o\0d&.m
+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB;+<XEG%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu
+<WB]0H_Jm+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*"o+AP6U%1444+>b2`0f'q++<WQb0H_Jr
+>=o\2BX[r+>t>r+<WQb0H_Jm+>=o\2]sq"+>GPm1*@\^0d&4o+<XEG/g*%p+Du==%144:+>=o\
+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Js+>=o\3$9mt+>GPm1*@\^0d&4o+<XEG/g*(q
+=@U*+>Fuo+<WBn+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc0H_Jm0H`+n+<WB]
1*@\^:-pQU3$9=k-OgD*3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu
+<WBm+>P&^+>Fuo+<Ve%67sB@+<Y04D/Ej%F:AR"0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb
1*@\o+>P&^0d&4o+?(Du+<WBm+>P&^0eje)+<Ve%67sB80H`_\%1444+>P&^0eje++<WE^1*@\r
+>P&^1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l'+@B%#7L]\I0d&4o
+>GVo0H_Jn+>P&^1E\Fq+>P&p+<WQb0H_Jm+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB8
1*CXW@:NjX$6V&G1*@\o1E\@o+>P&p+<WH_1*@\p+>P&^2BX[r+>Fuo+<WB]1*@\u+>P&^0ea_*
+<Vd]+>P&^+AP6U+>GYpF)YPtAKYDnFCfJ8DKTe*$7QDk%15is/g,@VEb$;)DfT]'FD5Z2+D,P4
+Dbb0ATJ:fG@kYS3Zoh)4*,"M4)JSG.3Kr[4$!fX%15^$6qL9F6W?iZ=Zneg-RT?1%15is/g,@Y
@;p0sA0>]&DIjr0Eb/isGRY!];F+,Q76s=)3[[*D/j:Wl$4R>;67sC"@;]Uo@j#l6@;^-uDfT]+
A0?):@;p0sA0>]&DIjr,ART*lFDkr+D@Hq=9LViY<)6.g;F+,B3ZoeT6#:+QFB!0oHRC@G;F+,Q
76s<m-[d?O$;No?.V3L.A7]^kDId<rFE7lu%13OO:-pQq4FVa.INWt[/g+V3F<Gu@$4R>;67sC%
BOu!r+EM%5BlJ/:FD,*)+D#S%F(KD8FCf<.DfTl,Ed8d$@8pf?+D,>(ATJ:f:-pQU:.\/V3Zr'H
DImisCh\3,+D,P4+Dbb0Fa,QV@:O4s+:SZM9LDKB5u(BJ=?S\f0H`D!0F\A0ASiQ1ASl@/AKYet
FCf\MFCf\>FCf<.+D,>(ATJ:fA7]R".P>.PGRY!jAS`J=/n/:+%16WWC`k2[A9MYr$=m^a+=]!_
Et&IeAS`J=/nnj@%16WWC`k2[Dfp.2$=m^a+=]![DeBLdA7]R".P>g]@grcUAS`J=/o5H<%16WW
C`k2[Ci=,!$=m^a+=]![DfcEqA7]R".P>FQA.8lVAS`J=/no-7%16WWC`k2[@VfZd$=m^a+=]!V
H4:3lAS`J=/n]JY@Wca;.1HV5%15is/j;IJIXZ_T$4R=O$;No?4?S(AIXWDd+>.J=FCf\>I16Mm
$;No?+D5_5F`8IFBln0&+CT.u+CTD7BQ%o6/Kf+V@;]UaEb$:tD..3kFD5i5AISu=9N4S_9LVoL
=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8E\&>TBln0&/0JkMFD5Z2@;I'/Eblk,DIal'@<6)k$=%"^
FD,T5H[[2g@<H[*DfU:OINTqA>R_#d>[.^F-!YM.@;Ka&>]k('H[[2gBkh^3Ebp1LIXN>D>R_#d
>\7nmFDc#=ATMR3AKY6"AU&<=FF-qW5qOiL2EDt0,CX]I@59\uINs;i+C&f&Ec#6$F(or3%17Lm
$=%[eFDPN8>]aP%FEDVOINs;SEc6)>INs;i+@gHjF`;a<$7QDk%15is/g+eIDfp"ADg#]4G%kN3
+D>=pA7]cj$;*uf<_5_]<(0nP3Zp+!3Zp*c$7-g:BPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%16?]
ARfgrDf0o,FCf]=FEDkY,CX9GDfp#J,CY%`:Ng;iG%kN3I16N4%13OO:-pQUCghEsGT^X>Dfp"A
@WcC$A0>r'EbTK7+:SZM9L;`N9LMiK=?S\f0H`D!0F\A0ASiQ2AT;j(DI[6#De:,.@<?(*+Cf>,
D..<mF!,R<@<<W)ASu("@<?'':ddb^$?B]p+CT>4F_t]2+DbJ.AU#>/G\(q=@<,p%Df-\>BOr<1
DfTW-DJ()2@<?/l$?Kd#Ci<flC^g_]A0<O9+=2JIE%h_.Cis0&@<?(*+<Z+XIV3\>F`;dSILQX$
@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9G
Dfp#J,CU(/ASu$pDe!3l%14Nn$4R>;67sBnEc6)>+EDC=F<G[:GT\R\@rH1+D/OD;D..]4DImBi
+CSeqF`VY=DJ'Cc8k_`Q:eXG[<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''-tdR>Ch[u?
+DbJ.AU#>0Bl%?5+=LlCE,961.3N87DImisFCfM9,%kq7F`8N6$7-g4@;TRd+Eh=:F(oQ1F!,C5
+EV:2F!,(/Ch4`$DfQt3@:Nsn8l%htB6%p5E$/k:+E2@>@qB_&ATKI5$4R>IBl7m4FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U#.%16?LAS5^pHXq&)F_t]-FF=T*%16?SDK'`?H[[2gB6%p5E.0$\
FD5i5AM/(9G^U#.>]!nbATVX.Ch4%_>]aC`Ch7Ns@rH7,ASuU2%13OO>]++sE+*Bj%14C(@rH4$
@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*
+CQC5F_kUu$7/quATVa"DJ+')HX('!CisT4F(K<=HS]5MI16N0>]XIuCh7KsFD-#+@rH1+D/OE+
E,p);AUSnZ/i@TiI16N0>]b1.@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CXQSBk;K@FCf]F%13OO
>]++sE+*Bj%14CdDf0,rDesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%
B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO
4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO:-pQUGAhM4+Dbb6
+EDC=F<G[:GRY!P9NP"f6qg0O<(0nP3Zp+!3Zp*c$7-fh@;0U%C2[X!Blmp,@<?''.!KTMA8Gt%
.3NG8FCf\>Anc'm/g(T1%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71
A8bt#D.RU,I16Mm$=%I[GApu'AIStU$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V
,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;
AT3'E1M(EO%14CdF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@Hp^
$7/qqDIm<rCisT4%16?SDK'`?H[[2gFCf]7@;TS),CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`
@;^1*D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]
AU&V4$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$4R>;67sBt@;0U%C2[X!Blmp,
@<?''9OUn3=<MR'ARTFbCh4%_8l%iKBlmp,@<?'WEb/Zr@VfU=3Zp+!3Zp*c$7-g0De*ZuFCfK$
FCcS2@<?(*+E2@4@;TIiAM,)7$7-f($7-foBPDN1Anc'm+DGm>@3B5tB4u+,+CfP8FDl#1H=^V0
G%G]8Bl@l3De:,6BOr<*Eb/Zr@VfTb$7-g3@<?($Bjkg#B4YslEaa'$A0>?,+E1b,A8bs*F!*&U
+E)4@Bl@l3GA(Q*+E2@>A9DBrDJ(($$7-fIFCf\>Dfp/@F`]5YE+*WpDdso'BkM*qBkM+$Bl7Q+
BlbD8G%G]7Bk1acDBNA*A.8kl+EV:.+EMX5DId0rA0>T(A7^!.BlbD;ARo@aBl7Km/g(T1%16?N
De!p,ASuU"CghC+>;7mPFBs6%Ecc#*Ch8#($4R>IF`V,5@:O(]B4Y:`@;]Us@ps=f?$g3qDf''-
Ed<'B$=%^pAT2'fCLLje>A.SVA8,poF'X-)F_kl5@:s/"%16?_F(K<!@r#LcAUA61De*F"DLDs$
>]k+!E+*6l@:s.u@;U(,H#7"A@;U(&@<?12%16?_F(K<!@r#LcAUA-'G\(u.GV!Q@Cis0.AU&V4
$4R=g+E2@>G%kJuF!+_0AU&<<F^fE%EbTK7%16?_F(K<!@r#LcAUA$'G\hJH11bkV%13OO,p6i@
@;omo@ric,DI[L*F(oQ1Et&I]F`V,5@:O(]B4ZF&Ea`p#Bk)B=F*1r(BkMR/AUP!p>\A(cE+irq
F)YQ0BR>(Y055<6Cisf5Df0VLI=2P3%14C(F`V+:D/!L#Dfg8DAKY]!+CTG%Bl%3eCh4%_>Y/Ns
Bl%?LG\M5@F*hb<@rcL0H#R=IF*)\UHX(]7AT2'fCLLjeHYmJ,Ec6&FE+OHGH[Q>1>\RefF_r6T
>\RepATVL.+>I,5Bj>@aCis0.AU#=P>\7\50H_YaBkAK,A7fppGRY!&+C'&1AT2'fCLLje>BP%"
3*glFDK'`?ASu"+%16?OCia/1,p6o6+Dc1/FCf\>DfQtFASbdsAU"Xk+<Xp3F(K<!@r#LcAUA$-
DKKr=ARg,t$6UHrBkDU$FCf\+$6UH6+C'&1AT2'fCLLjeH['@KG][t7/9l;TBk)'lAUP!p+<Xp$
BakCl+C&GgAmoguFCoH/FCo)mFEMV8F*gViE,]N/B0C?JGV+#KG]YK8@ps1b4\]@,@q\PSG@bf)
@<6".%144#,p75>E,8rmAKXEA;GU:[+EqOABHVG8Bk)'lAKYQ,Ec3(1BOPpi@ru:&+:SZ#+=/.E
AfuA;FWbR5ARlp*BPDN1@q]:k@:OCjEZcqVFD,5.E,oN2ASu!h+E(j$$6UH;+EV:2F!,O<DJ*cs
+Cf(nEa`I"ATAo-DBO%7AKYr4ARTFbCh4`$DfT?!F!,UHAKYo'+F%I6@<?(*/0JbO@;K@oARl5W
+<Vt8DIn$%Df'?"DIe*!AT`$3I="C_;GU:[I39XT%144#,p6]+DBO"3F<GLDBOu3,D/X<1F)YPt
AKYT'DKKqBBkAK0BOuH:Eb-A%G%#*$@:F%a%144#,p5c%Eaa''ATAo0Bkq9&;f?f!@q?cMDe*E%
:i^IsF(JoD%144#,p6lCFDs8o04Ja9B6,\6A8bpg/n8g:06DJY@VfsqEa`p#GqUp,0etC93A5Gl
F`Lu'/Rr^0AM%kAD_>^FD/9Xg+<Vt8F(KH1Df0K*Df0ZD7WN'O9lFofI16N++=196ATVd-DJs-*
DKL5(Dfp)1AKX?YA7Zl[Ec6@8$=%1W%13OO,p6)sA7]@eDIjr,@:EeaGA1T0BHUo*EZf14F*)Ib
+E)@8ATE!/F(HmFFD,5.ASuX-ATD4$AKYr#@r#LcAKZ22Cht5(@<HX&%14C(D..I#ATDi7FDi:5
G][M7A0>>mH#IS2+EV:.+DbV$F<GF/EbB*(/e&.mD..3k@<?<sFED)7>X<HuAS5^p6uQRXD.RU,
HR0+.+<Xp0ASu('@rH4$@;]V&>X3+>F*),E%144#+<Z#9F(KH0ASu.&BR=!#@:EeaGA1T0BRP4a
ASljD%17MgD..3k@<?F0BOu2n$=%^pAT2'fCLLjeHY%);D.R`rFCfk0$4R=g+EV=1BQS')F*&O7
Df'?"DIal%DfQt:BleA=F)YPtBl7Pm$=%OjDg#i*ARfXqD..<mHX(Z,B4uC'BleBEHR0+.+<Xp1
ATVa"DJ+')HX(9,ASlL"E.*'eE--M5F(KH0ASu.&BR=!'@<-F)BlJKI0Q;,^I16Mm$7-g(F_PZ&
+CoD#F_t]-F<G:8A7]up$=%^pAT2'fCLLjeHYm2,ASG\"I16Mm$7-g)Des?4Et&I]F`V,5@:O(]
B4ZF"Des?4I16NgA7]@eDIm<rCi=?@F(eumARfXpDfU8Q;Fa'%HSRE;/2B%A/2B%AI16N0+DN$/
Df0Z;DepP;FE2M6FEMV8F!(o!>\%DXBl7KlDes?4HY[2<G@PQ-DfU8QEbAj0HS@',1Ft441-$m>
/i>G5%14C(C*7)4E,95uBlkJ+EbBN3ASuU2+F##S+Di6=+E\fM%16?NAS,XoARfXpDfU28@<>pf
Des?4I=$!I@XWSW/ho.50J5+@/2/\61OT]>,p6qFDKTf*ATDi7/KeJ<C`mhFE+O)5F(Jo*C+aaJ
C^g_VA7]@eDIm<rCi=?@A7]7o@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%
EdM8(F(K6!Des?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DXBl7KlDes?4HY.)4@<?!tCi=?B
HZEb.I=!Y#0JG%3/het10J5=>I16N0+DN$8De!3l+CT>4BkM=#ASuU2%16?NAS,XoARfXpDfU27
BOPpkDes?4I=$!I@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HZO:LBl7QnDes?4I=$!I
@XWSW/i,450J57;/2/\1149T=>\%DXBl7KlDes?4HXgu2D.RU,@rH1%Ed`:TB4?:90J54@/2/\4
2(UF60JRtb$7-g6EbTB)FD5o0+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2Et&I&>\%DXBl7KlDes?4
HZ+">ATD:!Ci=?BHZEb.I=!Y#2)[!>/i,@90J5%6I39XT%16?NAS,XoARfXpDfU2CFD,6+@rH1%
Ed`:47m_WN0J"n/1,Uq;%14C(B5DKq@;I&pF)u&.DJ`s&FE7lu>\%DXBl7KlDes?4HXU`%Ecbf0
Ci=?BHZEb.I=!Y#3A`9@/ho780J5(<I16N0+E2@8D/"*+G%Ddg+Eh=:@WNZ#DIal-Dfoq?DIIBn
Et&I]A7]@eDIm<rCi=?@Ap&!$@rH1%Ed`:TB4?:90J5%5/2/\10J"n10JInt+<VdL%13OO>]k+!
E+*6l@:s.uAmoReH$44;I16Ng6tKtEDIla[DfTr#ATD6a@rH4$@;]UcBOPq&4^;5sHX(u)HX(rH
%16?.AS,XoAQEA_@UX@mD+/>cBl\-0D.RU,HUqj`BP_BqBQRs+B75,-ATD6gFD5T?HXgu2D..<m
@q]:kF$3c5>^K_(I16N0+@0OK+=A^PDf0Z<BmO>R>]XajChtIAAoD]4D/XH++Cf(nEa`I"ATDi7
E+O&4Ch[cu%13OO,p7/8DIdZq+D58'ATD4$ARlp)H#@_4GT^L7Ci=?.DJ()%Df'?"DIdf2/Keq>
D.Rbt$7-g'Eb-A*Bm=3"+DG^9B4YslEaa'$A0>B#A7ZlmF`\a:AS,XoBln'-DK?q;@<it)$7-g(
AKZ&*F<G[D+CT/5+Eh10Bk/?.AU&;>AoD^,@<?U*DJ()%Df'?"DIa1`>]k+!E+*6l@:s.uAo_<s
ARp2u$=%I[G@bZ8Bl\-0D.RU,HW+TdA7];"H[U6h%16?XATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA
?$fguAU&<,Des?4HY[2<G@PQ-DfU8Q>]aP%FCJj/HQt7nI=6MQ$7-g=DfTW7+C\o(FCfJ8GA2/4
+B*3$EarZ'6Z6LH+Ad)s%14CdDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2FCf]=@rH1%EdMS5
H$<b:Ci=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&sIFCA-oE+N!eCOKDA?$fguAU&<,Des?4HXpQ,
@:O4lDfU8QHQt7nI=2P3-!Y>!G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1>]aP%FCT6*DfU28ARfmn
Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QLARebLCfG=gI9SF3H[?tlI=34I$=%I[G@PQ.D..<m
HX&mGF(J*GDejc*0jT-2FCf]=@rH1%EdM8(F(K6!Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QN
Ci<a(<,ZQ#>;9E1>]aP%FCT6*DfU2:Ci<a(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6YKnK
<,ZQ#>;9E1>]aP%FCT6*DfU27BOPpkDes?4I=#4@AU&<+Ap\kL0n"IuI16NgDIn$%Df'?"DIe*!
;fm%oDJ)peCOKDA?$fguAU&<,Des?4HZO:LBl7QnDes?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QK
Df'?&DKJirCOKDA?$fguAU&<,Des?4HXgu2D.RU,@rH1%Ed`:>FCf]=Bln]K,;FUpI=2P3>]++s
@rH4$@;]V&>YfHTATCagCOKDA?$fguAU&<,Des?4HZ+">ATD:!Ci=?BH[?tlI=6Md%16?XATqX&
D/E^!A:%QICh7X/<,ZQ#>;9E1>]aP%FCT6*DfU25Ch7X/@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3
-!Y>!G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$fguAU&<,Des?4HY.D<@q0FnDfU8QHQt7nI=2P3
>]++s@rH4$@;]V&>XijR@ruF'DH(OiI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>Z,-GBl@l`@<--p
E`?smI9SF3H[?tlI=2P3>]++s@rH4$@;]V&>X`[RDfSfqCOKDA?$fguAU&<+Ap\kL0n"Iu%16?X
ATqX&D/E^!A:%QVDfT]'CfG=gI9SF3H[?tlI=2P3%14C(8l%htDfTQ'DKKH#+CTD;Bl%KlEd8d;
Df'?"DIdf2AoD]4E,Tf>+E2@>@qB_&Bl7Q+E+*WpDdso&ASu("@<?'k+DbJ.AU"Xk>]++sASu[*
Ec5i4ASuU:8l%iFEc6)>87c4?ATE3GI=$AO$=%I[G@bZ8Bl\-0D.RU,HV.(%:iCDs:i^JaATMp2
Ed`:_H[Q>1%16?_F(K<!@r#LcAUA#tDI[s*A9*)-$=%OYB4Z.+H#.&=AmoReH$p,/%14C(A79Rk
+D"tkBHV8&B4VMZ>]OFpDfg>2ASlC"HX(Z2A79b3I16Mm$=%:WG\(u.GRY!&+C'&1AT2'fCLLje
>B=@tE+*BjF(or34_A,=F(HmF,p7/8B4W3,BmO>5A7]@eDIm?$@X0)@ATVL.%144#+<VdL+<VdL
+<VdLF`(o'De*EBAmoLsALnrH+<VdQ+E_R9@rGmh+C]A&@;Bp,GA(Q*+E_a:A0?)1FD)eAATVL.
%144#+<VdL+<VdL+<VdLG\(u.G[5Z0H#R>8Eb/j2%16?OCia.s$6UHrF`V,5@:O(]B4Y:iDJ<U!
A7[oGEckr!HY@\DATDg&Apk*q>\7[Z$4R>IBR+Q.EcYf6F`;\:Eb/ZpCh[d&F$4VcF_**5$6UH6
+<VdL+<VdL+C]8-CMdL#CNDX\EckqE%144#+<VdL+<VdL+<YW6Amoh(BQ%oSH[RFS$6UH6+<VdL
+<VdL+E1k'FD5i5ANbBg/.Dq/+<VdL+<VdL+<Ve:Des?4Ch[d&F$4VcF_**5$6UH6+<VdL+<VdL
+E_^@@rH1%E]mlJF_**5$6UH6+<VdL+<VdL+Dbb0CL_:!DfS!X@:s.hFC?^0$6UH6+<VdL+<VdL
+E1k'@W-9tATBq\0H`%l0R\?Y$=%X`FDPN+B67g6>]=+lBl7HmDKL;R0Q;,^%16?]ATVa"DJ+')
HX(MuEcZ#1E.*'kE-*4ACiseA12q=XD/!m1F!*2VFF=T*>]XIuCh7KsFD-#+ASl"!B4YsjH#n(J
ATVEqI=!b]D1*NL,p7/IAThX&F<GLFATDC*Cht51Bl7L'%16?]ATVF#F`);4EdMk=@r?F+A7]_%
BRP4]I16Mm$7-g8ATMF)+DbJ.AU#>3DId='+EVNEF`V+:FD,]+AKYK$CisT4F!*%WA7]@]F_l.B
BlbD=GAdot,p7DFBk(g!Eb0<7Cij_@Bl5&0Dfg%CDe:,9@<6O%A0>i"B4W3,E+*6f+DG^9Cgh3l
F(8WtAIStm+AP^3762Q"A867.F<G:0+DG_(AU#>8@;TRs+EDUB+EVO7ATVTsEZbeu,p6f?Df%NX
BQS?83\N.1GBYZU@<?(*/Rr^9D09`1FEoKWEb@%KBk;L1DfBE#/oYKC5A!&8-?MC*2`!<#$=%^p
AT2'fCLLjeHYmnAFD56'Cjca">]!nbART[sATW$*EX`@\Eb0-"G@bZ8Bl\-0D.RU,HZWq4Bl7Hm
G^U#.+<Z#9BkBVPGAgu0CisT4%144#+<VdL>X3=@F*)><ARfXpAmoLsAISth+<Xp#Cia.s$6UH6
+<Ve35]UFWFDl&.@rH1*Eckq&$6UH6>\7[Z$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ
E--L;$6UH6>]XIuCh7KsFD-#+@rH1+D/OE+E.*'h2/mYc%144#+=/.?BOPdkAKWcOFDi:4ATMR+
ARlp$F_tT!EZf:4+DG_(AU#>-DesQ5DK?6o+<Ve3@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2
.XPE7DId='DIIBnI9d9h+<Ve3D..I#@W-@%HX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6
+<VdL+<VdL+F@?f@;BFSE,]B/@psFi>\S(dAU&*$D.S,A%144#+C'#%Ble6%B4Z.+H#.&=E,8rs
DLDs$+<Ve3F(KH0ASu.&BR=!'@<-("A7]Y#I=!YeFF=T*+<Ve3F(KH0ASu.&BR=!'@<-F)BlJKI
0Q;+VE,9Z<+>>E(E--L;$6UH6>]OCl@<`4g+<Ve3Ch7]nBlmp'>X3"6G\M82D1*]>$6UI<>\.e`
HYmnAFD56'Cib#0BkBVNATMs3DIm<rCg:mrARfXpF_u#$AScF!>[qS]@<-<qB4Y=[BmgEt>]!nb
ART\!FD,6+%13OO>]!nbASH$mAU"Xk%14Nn$;No?5!FFEIXZ$MA8Gt%ATD4$AQ3\gF^f/u9jqgK
EcVZs%15is/g+4];GKeY7lhc/Df021Ch[cu+C]A&@;BRpB-9]B:K:4684>g478b7EBl7L'+CoC5
DJsV>GB.,2+E2@>E+O'+Gp*V(:-pQU8K_GY+Cf(\Df]W1B-;)1F<G[D+<kE3GTn8PBPDN1@V'%X
F`V+:BOtU_ATDi7D..]4DImBi+Eh=:Gp$pADJ().Bl7L'+EMI<ATVX'ATKI5$4R>;67sBPAfuA;
F`JU<ART+\EZf%(F!,[I@;p0o@VfTuCh[cuF!,R<BlbD*A867.F<G[=ASiQ!AS,k$AKZ,:Bl7Q+
C2[X!Blmp,@<?'(%13OO%15is/g+S=C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'
Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>
+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2
C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg>c-C`mq?Ebce+DIal-
Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'
F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'
A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?
@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-O#Cht5<DfTV9
@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N$$4R>;67sBp+CoC5GA(E,+A!\dD]iM#@psM$
AKY\0@;R-2BOQ!*Bcpi$+<YA@A8`T7BOQ!*8K_P^+C\nl@<HX&+DDs,D'4%9@<<W++CT+0+DDs/
D]j7;@<<V`+CoC5@V'%XF`V+:Bcpi$+EqL-F<G9?@;R,0Bcpr)+EqL-F<F-tA8`T"ARf.kF(HJ.
+CT+0GA(E,+DDs,D'08p%16oiDJ+$4F_55K3ZpOH/hnIr+DGp?BOPs)@rH3q+EVNED0[74FED)3
FD5Z2+EV:*F<GC<DJ())Ec6)>+D>=pA7]d(Ch[cuF!,"3+Du+>+Eqj7E$-_TFD,B0+DGm>H#IhG
+E2@>@VfUmD]gVSDJsV>C2[X!Blmp,@<?'.-Z^C^+<ki;Ap%U!FCfJ:+>"]aBlk^MF!+m6GAhM4
+A!\jF`VXI@rc-hFCeu*BlkdH/Kf=WF`JU5@W-:#ASuT4@rGmh-YdR1FDl)6F&#%S.V`m4FDl)6
F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB$;No?
+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5E%c9T
Blmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat@;TRs
+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(ARfh'
+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D+ED%1
Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-E,8s.
F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a
:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Y3/F)Yr(Gp#pO7Nb<!6m-/SCiCL>+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD@;BEsCi<`m
+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/G]4cJ+<Y]9
FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2
Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL+D58-F!,@/
D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+8l%ht@rH7.
ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9EHPh8F)Q)@
ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL
+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4JEd8d@@;]V$
+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8F)Q)@ARlp(
AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ
67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7
D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJDfTA2AU&01
@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i
+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtB
C2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcmEb$;:BPDR"
F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!%16igA9E!.
Ced;L+=_,EA9E!.C`m4>/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'
Df-\9AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8
F`_>6Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,
+EV%5CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:Njk
DJsZ8F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'
DIIR2+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-
$;No?+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=
DfT]'F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9
@VTIaFE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.
F<G[:G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:
Bldir+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7B
FCB<6Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;4ASc;p$;No?%15is/g*o-
FCfMS%15is/g)8ZATDg0EZc\ODegJ4ATMp$B4Z-,-u*[2F`_>6+ECn.B4W2>0JYL>/MJk73B8Mt
$4R>PDe!TlF)rHO@;9^kF`_>6-OgDmDeX*1ATDl8-Xgb.A1%fn%15is/h1CCE+NotASuU2+Cm&U
+Co&&ASu$iDKI"FDfTB0+:SYe$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4@<6L4D.Rbt$:.Th
<D>n\9gMZM4ZXs!F)uJ@ATKm[%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F`_;8EX`@A
<E)Lb;GBGT90G<`@<H[*DfRld%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt1Eb/[$ARl5W
6W-?=<(02L5uL?=3[\EXART[lA3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZen<@:UKo
F`(i#EbSs"+CT.u+D#e+D/a<&Et&IE=[>GM5uL?=3[\H`@:VDH%13OO:-pQUA8bt#D.RU,@<?4%
DBNe)Ebce0DfQt;Df/uo+D>n8B45gp@;[2rDIal$G[YH.Ch7Ys$;F;k5t"F5;G0/6-Z*d>@:VDH
%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQtDATD6gFD5S$$<BSn6:"RB9hdoO90G<`G%G]'
@<?4#3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+EDC=F<GdGEb'5#$;sYq<*)jn6rQfG
;G0/6-ZX-DFE_YDA90dZ%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebf_=/KeS8E+NotF!,C=+E)@8
ATAo1@<-.)%15L!6WHiL:/jqR;G0qO3Zp^e;cQO\;b]PU905F><(Ke_9gMZM4$un75u^9@9gMZM
4%*4;6qosF905jD:-h9B5uL?;<^fnQ5u^EM9gMZM4&SjM<*)jn6rQfG;G.H+%15is/g+YBD/E^!
A0>]&DIjr1F`2A5F!+7W+Co&&ASu$iDKIo^C2[W*+Xefh4Y@jf@Vg%,DffP5%17)s4ZX]k?t<__
EHQ2AAO%k>7TW/V%13OO:-pQ_ASu$hAT23uA7]Y#Et&H                              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GBq/+>P&q+>Pes0eje/2'=Y2+>ttt3$:%6+?(E#1MUi=D..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F)#W(Ch\!&Eaa'$B4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfgu
Gp$^>Df$Uh:IH=<Ec6)>F)#W(Ch\!&Eaa'$<,uo"@VfUM@;BFpF($2$Des6$@ruF'DBNk0+EqaE
A9/l8BOQ!*,%kJ)ATD4$AKY].F*2&8+s:K9EZccFDe*ZuFCfK$FCcn9De*s.DesK*ATDL.ARlp*
Df9H5+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA9E!.Caj+;A9E!.CgeGrDes6$@ruF'DBNk0+A,Et
+E_d?Ch\!:+EqaEA90dSAU&<.DKBN1DBNk0+=LuCA17                               ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&q+>G]50PYN:?tsUj?m'0)+EV:.+EDC=F<G(0@<6K4De:,6BOr;Y:IH=HH#n(=D(Zqs
Cht54FD,6++A,Et%16T]@<6L$F!+n3AKYAjDeX*1ATDm#ARlotDBN>%De*6.+<Xa!ASrW,Ddd0f
A0>8pDe*5uBla^jE,8rmARlotDBO%7AKYAhC2[Wj+Dbt+@;KL-+:SYe$=%Xp@WQ*jFD5Z2HV.(%
+@BsRF)rHqDKKH1Amo1\I16Mm$@[GQINWt[/nuMW%16NQFs%nM+AP6U+CT)&+C\bhCNXS=G%G]8
Bl@l3DIIBnF!)S7$=[XZF<D\K:-pQUB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^
F`;CE+:SZeDJUF<+<XEG/g+tEF*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj
@r$4++D,>(ATJt:%16WWC`jiC+AP6U+Co&"ATVL)+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe
@<6!&Anc'mF!)SJ+<VdL+<Vd9$=mj]+<VdL:-pQUA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*
A0>r8@<?4)FD56++<VdL+<VdL+<VdL+<V+#A8Z3++<Ve%67sBsBleA=DdmHm@ruc7Bl5&(Bk)7!
Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<VdL+:SZgE-#T4+<XEG/g,4HF<G+.@ruF'DIIR2
+E1b0@;TRtATDi7+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%16`YAT2]5+AP6U+D5_5F`8I3
DIal2F_Pr/+Co&&ASu$iDKKqB+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$>3pl+<VdL:-pQU
Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<V+#B5DKq
F!)T#67sBhDII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF!)SJ+<VdL+<VdL+<VdL
+:SZjEc<-D+<XEG/g+YEART[l+CT.u+Dl%-BkDW5B6%p5E-!-E+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%16r\CLnV2+AP6U+DkP&ATJtd+EM%5BlJ08+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$>sF!A0<!;:-pQU@rc-hFCfM9@3BH!G9CF1@ruF'DIIR2+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#De't5+<Ve%67sC!E+Np.+CT.u+Cf5+F(KD8A8,OqBl@lt
EbT*++<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZs@:O(`+<XEG/g+V3@r$-.F`8I3DIal1ARfY%
ATDi7G@>Q7ARlp)E+*6f+DG^9A8,OqBl@ltEd8d>Bl%@%%17&sF<D\K+AP6U+EMXCEb0;7DdmHm
@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<Vd9$?B]jA0<!;:-pQUEb/lt
F*(u6+CT.u+E_RBAS5^uFCfJ88l%htA8,OqBl@ltEbT*++<VdL+<VdL+<VdL+<V+#Eb0<6A0<!i
67sC$ATMs3Eb0;7FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.3K',Ed2XJ
+<Ve%67sC$AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk+<VdL%176!ATJt:+AP6U+ED%8F`MA@+EqaE
A0>o(An?!oDI[7!+<VdL+:S[,IXZ_T$4R=O$6Tcb%13OO%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13                                                                  ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bnlSmoke0'
zz=:zz,'1 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dnlSmoke0'
zz=:zz,'0 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 globsSmokeDD00 g'
zz=:zz,'lobsSmokeDoc00 grpSmoke00 jodageSmokeDays00 mnlSmokeArgs00 newdSmok'
zz=:zz,'eBadArguments00 odSmokeArgFail00 rxsBadSmoke00 rxsSmoke00 rxsgetSmo'
zz=:zz,'ke00''                                                              '
zz=:340{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>Y]dDe*p+Deip+ATMs7F)>i2AKZ)+F*)IG/Kf4JEd8d:@<6-m+EV19FE7~>
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
1E\P#-p0UR/mg=U-QkfQ6WHiL:/jqR;G/-(7R9C1=&2^^;eg5]Ch\!&Eaa'$+A$lO:IJo7FCfK)
@:Njk8U=!)6tpO\ATDBk@qAS<5u'g6;FDX!H:gt$FDl)6F!+&#8l%isDf9H5;cH%X6pX^=+A$lO
:IK>IBl8$(Eb8`iAKXT@6rZrX9N+td6m,)t6rm#M+AYWa1,Us4;GU(f=&2^^;eg5]Ch\!&Eaa'$
+BMH,:f(%Y7S-]]79C[@@Wil(Eb/[$ASkjsF<G10EcZ>AATDL'A0>K#BlHpkGB.,2F!,49A8#Oj
E$/n6A8Gt%ATD4$AQDMn+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Df-\7@<--oAo`*6Eb'56
D..I#B45k&BkM<+E,]<*A7]RcFCf\>E,]<*A7]RcFCf\P+E_mE@<?(*Ao`*6Eb'5=.4cl04?G0&
0d%hd@:FCYD/X3$0JFVYF_PZ&C2[X!Blmp,@<?''B5DKqF&QpoCLon%0JFk'/1<VC4"akp+=A:H
De'u*De*ZuFCfK$FCcS0De*ZuFCfK$FCeElDfoN*APHTKATDi7C2[X)Df9H5+DPh*F`_>6-RgSp
4=iTBC2[X(D/X3$FCfN8F!iCf-p0UR/mg=U-Ql#W6pamF9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC
8Q/Sa;HY,=:K(5"C2[X!Blmp,@<?''<)5nX?V4*^6r-0WD.Fbg:IIuc8l%i^D.Fbg:IIucC2[X!
Blmp,@<?'fD.FbuF_PZ&C2[X!@<?(*+C]J-Ch.:!A8Gt%ATD4$ASbdsAU#>2BleB7Ed;D<A0>W*
A7'7uBk;KqFCf\>C2[X!Blmp,@<?'\F(KB-AU/>>C2[X!Blmp,@<?'fDg#i+G@,H'GT^a>A8lR(
<HD_lCLqd4+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A@q?d%
Eb]?-A0?2EH>7A/D..-r?Z]k(-RgSp4>J$72'aq21,(F;1,ggB3&E?H3B8oM1E\G,1,(F<0JP1:
0KCsL1bg[C+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP:;2(gaB1c%*I3B/cN+>PW+0JP::3%d'B
3AWKJ3&ilU+>PW+0JP:;2(gdA0JYC;2)dHP+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP::3%d'B
3&i]K3&ruW+>PW+0JP::3%d'B3&3EJ2)-4/0JY=:0et[?1c76Q1Gq!C2DH=00JY=:0et^@1cI?P
0JGLH1,9t-0JY=:0et^@1cR3G0JtaE2DlU40JY=:0etU=2).!E2)@0I3Ar!80JY=:0et[?2)-d>
1cR3G2`Mp80JY=:0et[?1c[EM2)-dD2`Mp80JY=:0f(L91cI9L2`3HI0Jjn-0JY=:0et[?1c@$D
0fCmE2`;d60JY=:1,(F81bpsC1GLdJ0JO\*0JY=:0et^@1cIBO3&i`L1Gg400JY=:0et[?1c$jH
2_d0I+>PW+0JP=:0eP::0K;!O1GUmE+>PW+0JP=:0eP7B2)R0E3AE6F+>PW+0JP:;3A*-J3&r`O
0fCdG+>PW+0JP:<0J54@2DR'D2*!BO+>PW+0JP=:0eP::2D[$@3&NWR+>PW+0JP:;2_HpH1bggI
3A`EG+>PW+0JP=:0eP::3A`]P0ebO/1,(I;0etI?/i,CG2`NWL0f(^11,(I;0ekF@/i>FA1H70N
3&3<51,(I;0etI?/i,CG2`NWL0f(^11,(I;0ekF@/iGF<1,:O@2`EW;1,(I;0etI?/i,CG2`NWL
0f(^11,(I;0etI?/i,CG2`N`N1GC[/1,(I;0etI?/i,CG2`NWM2`!E91,(I;0ekFB/i5FF3AWNL
0K(X.1,(I;0ekI</i>RA2*!BG1G^a.1,(I;0ekFC/i5OB1GC[E1H%*51,(I;0ekFB/i57=1c7-M
2)R661,(I;0ekFB/i>@;1GCL?1GU(.0JY=:0et[?1c[HO0Jk^K0eje+0JY=:0f(L91cI9M2`*6F
1H-F30JY=:0et[?1c@$D0fCmE2`;d60JY=:1,(I91c76I2_[!C0f1".0JY=:1,(I91c76I2_[!@
3ADX30JY=:0et[?1c$pC1,(C>3&_s80JY=:1,(F81b^UC2`WZL2_lL20JY=:1,(F81H@?Q1b^X<
1E\G,1,(F;1GCF=2E<WQ2`EKH1E\G,1,(F;1GCF=2E!<H1,V'H3?U(21,(F<0JP1:0K(^@0K:pK
2^p:+4>J$8,Vh&/0JP:;2D-jC1GpsF3B&lT+>PW+0JP=:0eP:=1bpjB0JkaJ+>PW+0JP=:3A*0J
2_ZsE0fCsH+>PW+0JP=:2_HpD1Gq0P1c.3J+>PW+0JP=:0eP:=2)@6K2)R0F+>PW+0JP=;2(g^A
0f^sC2E!EQ.4cl01*AG"1,(I;0ekF@/i>@A2D[*E3&NT:1,(I;0ekFC/i5LF0K(gI2`Nc>1,(I;
0ekFC/i>@?3AEHL0fV!41,(I;0ekFA/i>XH1H@0E2E<N81,(I;0ekFB/i5FB1H@6O1c7061,(I;
0ekF@/i>@A3B&oP0f1j41,(I;0etF;/i5=A2`EEF1H@<81,(I;0ekFC/i>F@2`NfT2D?m/1,(I;
0ekFB/i5FD1b^gG0f_'51,(I;0ekFB/i5FB1H@6O1c70?/1<V90JY=:0etX>2)@3O1c.0G0f:I@
1G1@>0JP:;0f:gK2`!HK0f(:n/i"P(.4cl01*A;2,Vh&/0JP::3%d'B3AWKM2Dd9I+>PW+0JP::
3%d'B3AWKN1,1LA+>PW+0JP=:0eP:<3&E?E2`EEK+>PW+0JP=:0eP=B2)mNP1c.3Q+>PW+0JP:;
0J51:2)-d?1GCU-1,(I;0ekI</i>OE2_d<P3&<Q;1,(I;0ekF@/iGL@2_d!D2`Wi?1,(I;0ekFC
/i>@;2)dHO1,:U-1,(I;0ekF@/i5CD3&`NG2_m961,(I;0ekF@/iGIB0Jk^J0f1U-1,(I;0ekFC
/i5LB0f:pG2`3H81,(I;0etF;/i5C@2`!EM3&3K:1,(I;0ekFA/i>OH1c-pD1c@?:1,(I;0ekCB
/i>=C1GgpB0f:a01,(I;0ekCB/i>=C1GgpB2)7$31,(I;0ekCB/i>=C1GgpB1,^s31,(I;0ekFA
/i>IC0fD$I0JGF.1,(I;0ekFA/iGCA3&<<G1cIB:1,(I;0etI?/i,CG2`N`M2_[671,(I;0etI?
/i,CG2`N`R1,1^11,(I;0etF</i5F?2)[BO3B/f;1,(I;0etF;/i>RF3&`]O1c[Q=1,(I;0ekFC
/i5RH1c@?K2E!941,(I;0etF=/i>RB3ANKN0K;!61,(I;0ekFB/i,LI1cI*B2_[!01,(I;0ekFC
/i>@;2)dHO1,:U-1,(I;0ekFC/i>=;3&roV1-%?;1,(I;0ekFB/i,LB3B/fR2`!?71,(I;0etF=
/i5RE2)$mH0fCg11,(I;0etF</i5IF3&39M1c6C20JY=:1,(I91bq'O1H.9O3AVd50JY=:1,1U<
1H%6P3&EEG2`W!90JY=:1,1U<1H%6P3&EEJ0Jah,0JY=:1,1U<1H%6P3&EEH3ADX30JY=:0etX>
2)I0F2E<NH0K1+00JY=:0et^@1cRKR3&ETL2Dcj6-p014/1<V7.4cl00I\P$4>8384>6      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
