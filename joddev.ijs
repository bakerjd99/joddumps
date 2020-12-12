NB. JOD dictionary dump: 12 Dec 2020 08:41:14
NB. Generated with JOD version; 1.0.22 - dev; 10; 02 Dec 2020 10:13:41
NB. J version: j902/j64avx2/windows/beta-o/commercial/www.jsoftware.com/2020-12-01T13:07:37/clang-9-0-0/SLEEF=1
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

JODTOOLSVMD=:'1.0.22 - dev';10;'02 Dec 2020 10:13:42'

JODVMD=:'1.0.22 - dev';10;'02 Dec 2020 10:13:41'

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
1,g=3+>P&o0H`/,2`2^42BX_22`Mp71a"P00K3ELG#N6rCLo1R:-pQ_@:FCYD/X3$0JFVk/M/(n
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
ATKI5$;No?%15is/g)l$+AQ?^ATJu.DBO:Q+>,9!/g,Rj+CT;%+Dbt+@;I'.D]j.8AKXB/+CT.u
+CT;%%15is/g)8Z+D#P8Bm*p$ASuT4FDi:>@;TRs+DG^9@ps1iARlp-DfTB0/g+)2+=Ll=Ddmc:
+Dl7BF:ARP67sB'+<Y6?@r-9uAKYDtC`mP4@ps1iGp$O:F(o9)ARloO6m-AUD.Rc2Ao_g,+E)CE
ATA4e:-pQU+<VeJ@rH<t+Dbt+@;I&pF)u&.DJ`s&FE9&W<+0QR+Cei#AKZ21ASqqa:-pQU+<VeR
HQXpn/g,Rj+DtV)ATJu2@<?!m+DtV)ATJu.DBO%7AKYo6FCfJ8F(9--AM+E!:-pQB$;No?+<VdL
:N^bjE`[1"A3Dsr1E\_$0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG/g)QVDF?lA
+DGm>Ci<flC`mh<+EV:.+@JU?@;]TuDJsV>@rH7+Bk1dqARl5W:-pQU+<Ve%67sBh+Dbt+@;I')
AfrKtF`_28=)W+i.3NhJBl%?'-uX6M:18!N.3N>G+CQC/De!3l%15is/g)8Z+E)CE:18!N4Y@k(
HQ[SV.NiGC6ps0j+>bhrI=35P/g)qm1^sde67r]S:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is
/e&._67sB9/g+/3@<6L(B5V9k+DtV)AKZ#)An?!oDI[7!+CT@7@;^?5A7]_%BHV#,+@JV=+EqO9
C`m1u+Cf>-F(o/rEb/bj$;No?+<VdLEb/ioEb0,uATJu.DBO%7AKYo6FCfJ8F(9--AM+E!:-pQB
$;No?+<VdL:N^bjE`[1"A3Dsr1a"h%0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG
/g)QcATD6oDF?lA+DGm>FE1r$FCeu*Ch[Zr+CQC*Ci<ckC`mb0An?!oDI[6#Bl5%A:N^bjE`[1"
A17rp:-pQU+<VeFF`^AeD.Pj_+<YnO?6FTA1*Cpj+F#"Z+Eh=:@VK^J6m-atI=3:n+F,(Z+DEGN
0ea_uI3:BV$;No?%15is/g)8Z+E)CE:18!N%15is/g)8Z+=Ra,:-pQB$;No?+>YVm7r3*Q@;I'(
@;TQu@<6L(B5VQtDKKqBBl5%]6usn%@<<W#DL!@BATMs-DJ()&AT2a)/.Dq]67sB'+<YlBCht5'
AKZ)8ART[lA0><%+CQC1Df.s2+D5M/@UX'q@<6L(B5VQtDKKqP%15is/e&._67sB'+<XI&FCfJo
DfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL:-pQU-tHn#E)UjeFCcmD
BlbD=Eb/[$ARlp"Bkq9&@3B3!Ddm-k+ED%*ATD@"@q?csDBL?'F`_28=)W+i.1HVZ67sB'+<YTF
FA?7]AN_Xg+F##8+FAGj+FAGXGT\LZA7]=k;flGiAN`'sG%G]'Bl6=,+F,)XI3L?fGp"RZBeCM_
0Hbdl+>jT8:-pQB$;No?+<VdLDfp.s@;TQb$;No?+<VdL.1HVZ67r]S:-pQB$;No?+CT>4F_t]2
3XlEk67r]S:-pQU+<WBf+D,>.F*&OHATMr9@<6L4D/aT2Df-!k:-pQU+<WEg+EM+(Df0).FCfN8
+CT>4F_u)>Bl@ku$;No?+<VdL+<VdL+<VdZ/hSac$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JY=mARdDS%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$;No?+EV19F<G:8+Cf5!@<*K"@<6!&BkAK0BPDN1Ao(mg+DGm>
E,oN2ASuT4@;]TuF(KG9FDi9V%15is/g)hj4Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&%15is
/g)kk/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$;No?+Cf5!@<*J<-OgCl$;No?+EV19F<G:8+EV13
E,Tc*Ed8dBF`(t;Ci<flCh4_@+Du+>+CT)&+A,Et%15is/g,7IF*)IG@ps6t@V$[$ATDC$Ec#Au
+DG^9C3=E0+Dbt+@;KLr+EMI<AKYi4F*&OFF`&=9DBNCsF(Gdf@rGjn@<6K4FDYu5De!-?5s]R/
DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F;           ~>
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
1,(L,1,'h,+>G_r1*A;20f^@30H`+n0fV0N+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>G],3$9q9
+>P&p1GLj30f'q-+>Pc60H`,*+>P&o1H%*50f:(/+>GQ03$9q0+>P&p0f1XD+>GYp1*AM30KC71
3?U("0f(U@+>PYo1*AS81bg+-1a"Or0ekIA+>GSn1*A;.2DQC03?U("0eb=B+>Get1*A;-2DcO2
0H`+n0ebOD+>t>t+>GT.3$9q4+>P&o1GCUW:IINL8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mp/hen5+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>>eu:2b:u1,(I;+>>c91,(aC2%9m%
$4R>;67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*@]+F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg1*B>1
Fs&Oo1,'h*0fh'F3\r]($4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+<+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU0fU:NDg!6Y0JY=)0etdE1HI9M%13FL:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u1,(I;+>GW41c%0L
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+>Pes:2b:u1,(I;+>GW42)I?M1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pht:2b:u1,(I;+>GW41,M$J
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pku:2b:u1,(I;+>GQ21,M$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;+>GT31GV!K3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A
+>Pku:2b:u1,(I;+>GT31bh$G2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Pku:2b:u1,(I;+>GW40JPUB0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+3+@KdN+>PW+0H`)(3\`EO
1bf>0:IJ/X:J=\R<CokP84c`Z:Jt=N2%9mf67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i"P$
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu:2b:u1,(I;+>>c91,(aC2%9m%$4R>;67sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GVo
:2b:u1,(I;+>GT31,:mH2[p*'$4R>;67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg3$:t7Fs&Oo1,'h*1-.-G3\iW'$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u
1,(I;+>GW41c%0L1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp18+AQiu+>PW+0H`)*3]/`T1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2'>Y4Fs&Oo1,'h*2**QQ
3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,^7MDg!6Y0JY=)0etdF1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pku:2b:u1,(I;+>GQ21,M$H3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:
+AQiu+>PW+0H`))3\rNP2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh*I3]&i($49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,g=NDg!6Y0JY=)
0ek^G0fh$K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS3?TG4@<?'A+>Pku:2b:u1,(I;+>GW40JPUB0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqf1*Atr@j!N\1,'h*0KLpE3]&T!
:et"h?YXLiCh\!&Eaa'$1,04F:-pR0:K(5"C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfQsK/M8J8
3XlE*$?L'&F`_SFF<F.E5sn((3Zoh)+?CW!.1HVZ67sB/C2[X!Blmp,@<?'0+DG_8ATDBk@q?d,
DfTA:F"'-Z$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB[84c`V5u'gD
6QdKo+<Ve%67sBmF_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?/l
$;No?+D,P4D/!Tj@qBanGT\+O+AP6U+D,P4D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr
+DG_8ATDBk@q?d,DfTB0%15is/g+eIE,961+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5
F`8HOGps10:-pQUBkCd`ATMEmFD5Z2+<VdL:-pQUBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0M
EbTE(%15is/g+k?@ium:+<VdL+<VdL+<XEG/g+bEEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;+
$;No?+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE
+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQUFa%Y1FCf]/Ed)GBA9/k9:-pQUF`)DD@;p0s
A0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@B;$;No?+EqaE
A8Gt%+<VdL+<VdL+AP6U+DkP&AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGps10.1HUn$=e!aF`MM6
DKI!K@UX=h-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R=j1E\_$0I\+l-OgE)Ed98H$;No?
+E_a:+CT/5+E1b,A8bs#F(KG9Bl5&8BOr;Y:IH=EEc5Q(Ch4`$DfQtBBPDN1D.-pfBl7Jk$>F*)
+EqCA?X[\fA7$HA-W!]07R^3Q779s<:..lF?YO7nA7$],A8a(C<(KSZ:dIiE:IAJtC2[X!Blmp,
@<?'f4ZX]^;FO&D;GoqO:dIiE:IAK'C2[Wi+D#G$/e&/%AhG2V/h]I<-ZEL3A8bs*-:KO9+E1b,
G%G\W/g*50HQYF4/mg@VFDPP3.!''5Cht4n84c`V5u'gD6XO8:De*ZuFCfK$FCef1-QjumG%G]8
Bl@l:.3L2p+@B$LA8a(0$6UI4D/XQ=E-67F-VdH:762Q"A867.F<GO2DIdZq+E1b2BHV#$+CfP7
Eb0-1+Eh=:F(oQ1+=JTgE+*X-ATB=L.3N>G+Du+>+?hq21+kR>0eP1.%16ZaA1e;u@psIhBJ'`$
+<Y`BDfp/@F`\`R78d#Z;E>q>@;]Uo@j#Z-F<GX9F<E.X@:X+qF*&O(84c`V5u'gD6XO8:De*Zu
FCfK$FCef,%16ZaA1e;u.1HV`:IIuc8l%iC:IAK+A26(Q$6`VgDe*Bs@j#l3A8`T,BleB%-u*[2
B6%F"BPCst06D,CDdR6tA1hh=B.4s28l%iC:IAM4<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dq
ARlonBOPdkATJu+DfQt.8l%iC:IAMB%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7
EZfI;AKYf'An?'uD.Oi.AftM)FCB6+%16N]A0>_tGp$O7E+NHu+DG^9DffZ(EZe=W6r+qABleB;
/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa?Y*tuCiF#BC3F&u@<Z4&DIR`CD(me+2g/Ol?m%gT
DKBN&ATAo-D/aN6G%ki,+D,P0F<Gd=BkM+$F!,17+E2@8DKKH#+CoD#F_t]-FE9&W<+ohcAoDR/
+E_a:A.8kg+<Y97EZfFAF`Lu'+Cf>#AKYK$F_kS2@V$Zj+Dbb6FDPM2@W-'nATAnF+D#V5ARfF_
Ci"A>FD,5.@rH1%Eb/c(FCf]=F"Rn/%14jC+CI<=A9hj/EcO*Y@V@SRF)#MMF)uRdBl[iq3+"jW
+@op]D/X<+H=\4/De*E%@rH1%EcW@3DIal%Df0Z<+CSc#Df]tB?u0n+Ch[s4Bl7R)?m&lqA0>9!
@;]Uo@pgF#H#@_4GT^L7Ci=?.DJ(R2$6UH66ZmEiASuU+Gp%3BATME*E+*6l@:s.m+E_a:+Co1u
An?!oDKI"5Df0Z<+CT.u+Cf>+DfTnO%13OO1G0eX4C:!e0KEu1DK0?912UGY20<qbG\D,7@VBag
5%#L2AThd!G9CR;G9D!G+D,b4Cj@.7D.7'e+CT)&+ED%*ATD@"@qB0nAoDR/F!,17+E2@8DKI!t
6q25M%13OO1bKnY4C;T0AMncf1i.8H2fW[oD)c$=E&TInC3DIA5%#L#Df0W1A7]d(@:Wn_DJ()"
@:FCf+=LZ7C`m1q@r$4++Eh=:F(oQ1F"&5RD]hYJ6psg</e&-s$8jFY?p%dSCM%="@W6L"2JHrJ
H=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3BH!G9C=5E+NotBm:bBD]iG&De(J>A7f3l
A7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_F*)IU%13OO?s@2[A1_nAA8ba]%16'16r./^:IJQ,
A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgiDe(J>DJ(C@?qO3_?m&EE6r+7!4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:g
B4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_F)to6/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<
FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$&'6?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0
DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdkATKI5$:/KLD_*#OART*l>@;,YF*)>@GqNrE
?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+U
D.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9Dfd+9D/a<&D.RU,ARm8C+Acl_DK?q2D]iq9F<GI4
@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI@V'1dDCosKA8ba]%13OO0eOSV4C;STBOj,B0m.JP
0Q8dlBQIuJEB/&RH=UYq5%#L4ATMr9A8-'q@rri(AS,XoBln'-DC9KJBl.ft@rri3DBMPI6nTT]
BOr<(ATo8-Bl[cpF<G+*Anc-sFD5Z2+D,%lBl%L*Gp$g=+A*bjDKKo;A9DBnEt&I!+<Y)8DIn#7
A8,[s@;om&@!d6.+CKVG?m&ukCh[a#FCeu*D.R-nF!,C5+Co%qBl7X&B-:o+Ch[cu+Du+?DK@?O
G%G]'F"AGBA9MO)@WNZ#DIal"Df0<4DI[d&Df0VK%144#+AH9[AKZ&:Eb-@c:IH=8@;[3$@;]Ul
AKYDtC`mh5ATME*DIn#7AoD^,F"Rn/%14jC+CI<=0PP*0H#.e<2Iptf2g/nPEI'TbDeh4?BjX&3
+B)ukBl%3uCj@.?@;BEsF*2M7+CJr&A8Gt%ATD4$ARHX)DfTW7+D,P4+Co2,ARfgrDf-\.AS,Xo
Bln'-DK@?OF(JoD+<Xlr<)5nX?YXLiCh\!&Eaa'$/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$02t_8:L@jTA8Gt%ATD4$AM.h1.4u&:
%14mD+CI<=2`GZ$ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4+CT.u+D#e>ASu$$?qO3_
?m'8o@WNZ#DIal(DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1F"SS/@:F9e$6UH6BOQ'q
+Cf(nDJ*Nk+DG^9Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%14pE+CI<=@qB4/H8%0lFD!OPD)cAl@q]g?
0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^F`8IHATDj+Df0VF+EVNE?qO3_
FDl)6F'pUC<+oue+Eh=:@N]B++E2@>G%ki,+EMHDBOPdhGp$gC+EM47F_kS2@V$[$@<-H4De:,6
BOr<-FCB&t@<,m$F(KH9E%VS,%14sF+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP@UD<,+@C'b
F(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);FDi:B
F`&<o:IH=IATMs7/e&-s$=I(LDIb>@De*cl?k!HB:IIucC2[X!Blmp,@<?'fD.GC\%147_C2[W*
Ch\!&Eaa'$+Dbb1DI"Z)DI[L*F(oQ1F"_9HA8Gt%ATD4$ASc(!DJX$/FDPM@E,K;;?tsUjCh\!&
Eaa'$?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdk
ATJu+DfQt.C2[X!Blmp,@<?'g/e&-s$=IUeA8Gt%ATD4$ARHWpF!+m6>=pP@:IJJ:BQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.).3N,:@<6K4B6%p5E$079
@<<W2Ec6,8A7]fk$<q=\FCfK$FCcS6Ec5T2@;TjqDJ*6'BQS?83\N.&Blmp,@<?("Ec5T2@;Tjq
DJ(S3Df%.ADId='/nf?DCagKJF`;;<Ec_`tAoD]48g%V^A7Zm)FDl22A0>T(+A,Et+Co1rFD5Z2
@<-'nF"Rn/%16'JBlbD-De!p,ASuT4FE1f"CNCV;ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^h
F!,(5EZeb)De*ZuFCfK$FCei4%16'JAKYGjF(HIM2BZL<F(HJ.DKBB,F(o`1G%Ddd<CoS$CLqc6
BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5CG$`$F<G^DBlS9,Cj?HsCggdaCi^_1
@:NsnFCB6++CT.u+DkP&ATJu.F<GO@F)u&)Ch4`!Df'H-Ch4`"ATV?pCh7-"@q]:gB4W3!BleB7
EbT*+%16Qi+EVXBCi!g'B-;,9ATAo8BOr<0ATDj+Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?5%13OO
?s@)OB5)68FDk].?!n*K%14gB+CI<=20h&q@PqeABkMU82gBLfFu!M\FYb^*1LE=R+AucoBldi.
@;]TuFCfN8+D,P4+Co2,ARfg)A7]@eDJ=3,Df.0M8g$,H0JXbbDKKo;A9DBnA0>DsEb/a&+Co%q
Bl7X,Bl@m1%144#+EV:*F<G"4AKYMpCh[a#FCeu*@X0)(H[B-C@"!H2/g+,,AKYMtB6%F"BQG;)
Eb-A%DBNM8@qBV$Bl@l3FDi9o-Z]_(+<Ve@DJ!]r@ruF'DBO"1BOu$l+CT.u+EqO9C`mb4E,]W)
+EV:;Dfo]++CT)&+A*bdDe*E%E+*d.Bl7Q+FDl)6F!,17@r-9uBl7Pm$6UH6?tsUjCh\!&Eaa'$
?nMlq%14jC+CI<=2`#ViF)a$Z1jO:$@;Tk(Be_JTA7]1qFC.4>+A$HoATMs-B45mn+EqLE+E_R4
ATD6gEZek*@<,ddFCfK6+<Y'!?m'0$+A,Et+D5_5F`8I@@;TRs+C]A&@;?uZ@8pf?+E2@>@qB_&
Bl7Q9+@^9i+Du+A+DQ%?F:AR"+<Y35DC9NKF`V+:F`(`$EaiHt+Cf(nEa`I"ATDi7Bl5&+Ec6)>
+DtV)ATKI5$4R=u/g+Oa?T*"@@sD]D0K=,iBJVS&D..=%G%EU@3+6/X?m%gTD/Ej%FE8RKBln$,
F`\aMBPDR"F)YPtALns8/nZdZ?qs$@DJpY=E+*6f+D#5"?m';pGp%!CF<G(3Ci=>:E,ol9ATDU4
/g+/8ATAo$:-pQUF)YPtAKYr.ARTXk?nMlq%14pE+CI<=@Pr4N@s)O0A9g"UFa8.PBQn5L1c&`R
CgTA6+B*Q'FCBD:@rH1%EbTE(+E(j7GB.,2E+NQ&@W-L&A0>PsFCfK2B4Yt!F`S[6EcPT6F!,=.
Gp%!CF<G%(+Cf>1Eb/a&/e&.1+<Z,^ILQW,+<VdL+=D/ODffQ$+EMXFBl7Q2+?L\o59M^8+>PVr
0eb:1+?L]-3[\oiDffQ$+EMXFBl7R)+EqOABHV28D.Ra%@rj",$6UH6IXZ_T$4R>"/g+Oa?YjC1
D/V-eFY[u[1ML\_D0@imC2\<*G$dF@+B)ukBl%3uCj@QSGB.,2E+s3&+Du+8DJsZ8F!,[@FD)e5
Df021ASkmfA7T7^+E;OBFCeu*F*)G:DJ+#5D..]4DJsV>@rH1%EZf=ADfB9.CjA&N$6UH6IXZ_T
$6UH6+<Ve%67sBP;aO520f'q^BOt[hF*2=/$6UH6+<VdL+<Y#N0HaY++Co2-E$-NB0f*<M-OgD*
+<VdL+DEPd@q7_`-SRP?2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM
1GU[=%144#+<VdL3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E
0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=%144#+<VdL3B/rU2)I*E0ebUI2`<NM1GU[=
3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=
%144#+<VdL3B/rU2)H['HQ[b[0d&7p0d&7p0d&7p0d&7p0d&7p0d&7p.k`"t.Ng)m0etOA2)[BQ
3@>q`/g+F/$6UH6IXZ_T$6UH6:/=hX3Zq+7DJ().Bl7L'+CT;%+Eqj7E,]B!+C\noDfTD3B5_L%
B-;;7+E1b,A8bs1+B3#gF!+t$DBNb,@:UL&D]j"-DIdZq%144#+CT>4BkM<tDJ()+DII$bF`Lo4
AKZ)5CLqC)+EV:*F<G(%DJjB7+C\n).V3%0Bl&&E+E1b2@q]Fa+CSl(ATE!'Eb'5D+@^'i%144#
+EV:.F(HJ.DJ!p#EHPi1F<GL2C1UmsF!,[@FD)e6@;^3rC`lD[<+T/SARoLsF#kFbARuulFa%Y1
FCf]/Ed)GBA92-2%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*ZmFCf\P0ht%f.UmO7Ch.:!A8G[r
AU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+A,Et+EMIDEarZ'9OUn3==t$i:-pQB
$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q
@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq
+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is
/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGq^urEb0E.F(Jl).!g2cC2[X"
@;0UdFCf\G%15is/g)o'D..]E1*@ukH?s=EA8PahDD#C,F=A>@A7T7^%15is/g)o'D..]E1E\)"
@r,^bDKKH7/7N%0.3N&0A7]9\$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))
+EVNEEcl7/$;No?+>PWgDg!ln+CSekARlo3C2[WiDg#i+G@,H'GUX(/%16T`@s)g4ASuT4-XpM*
AL@ooEb065Bl[c-+<W%HDe*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eODe*ZmFCf\W3B:Fh
4ZX]55s[eODe*ZmFCf\W3B8H0>9IEoATD4#AKX)_5s[eODe*ZmFCf\W3B8Gr$=e!gDKBB0F<D\R
BkhQs-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;67sBmATVEq+<Y-9Bl%<&F`_>6Blmp-
+CT.u+A,Et+DG_8ATDBk@q?d!BleB;%172oE,9H&+D58-+?MV3Eb/Zi+Eqj?FCcS(AS,k$ATMs6
+Cf(nDJ*O%FE/Kr:IJ5X6m,'I8l%ihDKKH1Amo1\;cH%X6pX^=+A$lO:IK;CDesJn<'a8I5uL)n
8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=-OgCl$;No?+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,+Co2,ARfh#Ed8*$A8bs@3Zpgd6XO22Ddjhn+CoD"4ZX^43dWJI:dJ&O?XH`2?XHE$6uQOL
%14ITDeO#26nTTK@;BFp-QmJAFD>`)Ch\!&Eaa'$+CoD#%13OOEc5l<FCf\[3ZoerH?s=EA8Pah
DC5l#%15is/g)NfH?pq]D..3kF!,R<BlbD/Bl\9:+E)-?Eb0E*EcYe7A8-'q@ruX0Gp$^5Ch4`,
@;TQuF)Q)@Et&I(Eap56AU#Rc3Zq-_6W-]e@;9^k?Q`umF<GUBDfg)4GUt4LFCf\E%172gGWe)1
4*s">FCf\+$?Tj(4ZX]6-SH]nINs#IEcYr5DBjUZ,;1Dq4"u"R:IJ5X6n'6gBOPdkATMs6+EV1>
%14M*Db;-oAU#XHGB.D>AKYN%@k;Y=Dfg)4GUt3pFCf\E%13OO:-pQUAn?'oBHV5:ATDs.ATo85
@<?(*+CT.u+Cf5!@<*K)DKKH1Amo1\+EV1>F:AR)Eap51G'%;?-TsL59gM-E:L@OFDe*2tB4Z0-
-YdR1?Z1+%ATqL'AU#R3$>F*\@qBajB0A9u-Tin0HtmS1BkCd`AUH']4spdHDg$56GWe)1-u!:%
@qBajB-:YpAoD^$F*)FF4*s">Dg$56GUY1XAmo1\FCAek$4R>;67sBhE,]B+A0>B)EcP`/F<G:8
FCfK)@:NjkF(Jj'Bl@ku$>O0]@q@ea+>5d)+FYq7H:gt$Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%is
Df9H5;cH%X6pX^=/4k.[:IK>IBl8$(Eb8`iAQ)Po:..BG6k'KAG'%;?4ZX^(G'%;?/1<7u9L^H^
-t[C<D/!Tj@qBanGT^a5@:Njt/2AGD7L]\QFDjboDg$56GUXbZEbTW,+CoD#/15aiC2[X$G%kN3
/p(ZL-OgCl$;No?+A,Et+Cf4rF)to6%16i[Ccsg%4$"a(De*d(+DPh*+DPh*F*)>@AKY`+A7TUf
+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!hD(Cijnb3Zr'UDfp#8@<?(*-8%J)C1D&h$4R>;67sC%
ATT&/DKKH1Amo1\+D?%>ATDg&Afu2(EbAs*Et&ImFEfr0+DPLs@q@!.ATVWu@:Nkj@<-"%-8%J)
Cijn2$4R>;67sC'F(HIAH?pq]E,oN%Bm:bBD]iJ3DeW`)@r,RpBOu6-GA2/4+=CoBA1&KP/h^aR
@s)X"DKI"5Bl%@%%172gG\1Z+ATL!q+=K?_Ddt4=/1)u5+=K?"H?pqf+=nil4s4TMC`k8U/j:C?
-SBLPGUFUC$>ag/+Eqj?FCcdO4s4rYG\1Z+ATJ:f%15is/g+eIDfp"A@WcC$A0>>iFCSu,F(96)
E-*3S+DbJ.AU#>?FD5Q4+EV:*F<G(3D/a3*AKYVsDImisFCeu*Anc'mEt&IkCgqO$Ch.X!GWdZ%
-mpZs,CX9GDfp#J,CV9n/95ZIFED)=.3N,6@;]^hF*)FF8k_QO8PDNO79C!+.!0Au:K(48C2@@%
Bl%=%AU#XHGB.D>AKY`(@WcC$A7Ath4Y@jfDdt>=Df9`>AU#aR/n/72-OgE(D/XQ=E-67F-Z`s4
Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$367sBW6q/;/Df'H-Ch4_u@<;qc%15is
/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]>
DK^+L4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>
AKYN%@k8u]0Onp1@;^0uGV3H6F=.M)%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eODe*ZmFCf\W3B:GUF_PZ&C2[X!Blmp,@<?'s@<?(*1,2Nj/h1=QBl%<pDe*ZuFCfK$FCf8s
FCf\>F"Jsd+D58'ATD4$ATJu8H#@_4GT^[6B4u*qB4uBuA0>W*A8Gt%ATD4$AKZ&4F`Lu'+A?3C
AQUPo$;No?%15is/g*VtCh7Z1@<,p%GB.D>FCf>4FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#
D.RU,+Co2,ARfh#Ed98H$;No?%15is/g+SDF*2>2F#kFRF`MM6DKI"EATDj+Df0V=De:,2@;]Uo
@j!1=@;]Uo@j!NZ3A*$=0d(CT+DbJ.ATB4/$;No?+<VdL+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO
:..lF.1HVZ67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=Je
E,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JY>!
@<jR]%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>PWf@<jR_+EM47G9CgACj@-OC2[X!Blmp,@<?'5@UX@-%15is/g)o'D..]E3$;aG
F)Yr(Gp$R=Bl%<&@UX@$AoD^,@<?U&A0>u4+EDUB%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=KCghEsGW@cE?Q_Km+=BH@6#(=K
CghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEsGW@cE-OgDmDeX*1ATDl8+=Cl<De(4)$=e!g
DKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$;No?+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
+Co2,ARfh#Ed8*$A8bs@3Zpgd6XO22Ddjhn+CoD"4ZX^43dWJI:dJ&O?XH`2?XHE$6uQOL%14IT
DeO#26nTTK@;BFp-QmJAFD>`)Ch\!&Eaa'$+CoD#%13OOB6%s/@;TR=3ZoebDe*ZuFCfK$FCcg/
$4R>;67sBnASu("@<?''B6%p5E$/t*FCf\+$>OBiASsXl+D5_6Ch[u6B6%s/@;TQb$7Bk(0Hb+H
Ec5l<+DP_7Bln0&+DP_2G%kN3+DP_&De*E%C2@@%Bl%<h@<<k[3Zr0RB4Yri$4R>;67sBo@;]V$
+C\c$@q[!+@rc:&F<G[=@<<W4ASl@/ATJu9AU#kE@<?(*+EV13E$/b,Ch7Ys$7Bk(0d(@WF=044
+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+$7L"785E/`+?Op2/8fWQ.3NhTBlmo/A8bs/
-SR5aCh7$mFCf\L@UX@+%13OO:-pQUDIIBnCh7[/+Eh=:@LWYm1E\_$0I\,b@k]#T/g,1E0b"J(
AhG2\/NS/"A8a(0$6UI4D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho
-RU$367sBW6q/;/Df'H-Ch4_u@<;qcAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr'HDImisFD5W*
+A?3CAQU',4s247B6%s/@;TQb$>"*c/g)8G$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eODe*ZmFCf\W3B:GWAS,@nCiiZuATDQtH#k_u:-pQUF`V,7CLqd4/n8L+%15is
/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k
;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0
F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?
+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:
%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;
C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&Ft
BkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J
;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4kg$;No?+@p']Ed9$R+<k9;FEB*WB5Di;+?;&.1*CdZ
Ebf*(Dfor.Et&IO67sB@+Z_A=+=Jrn+BosK+Z_A;+=C]/Ecl7B,VU?F+?:T+1-$I*-Qjr_-mC\p
3?^F=3%$(&+=nW_.3Mh;3?^F=2]sIq-Qjr_-n$<h+BplL4usf6-RU8g4XhL6+Z_A:-RU>c/0H;f
-RT?1:-pQU3?^F=3F+@D3?^F=2^`-FEcl7F0O$O\3\i^$-S-Yi3]S?E1,pO5.4ciN3?^F=2^^.r
F`2A5+?:T+1,^C3%13OO7P[%[4&TX,@;BEs6ZmEiASuTO-Vd6-:`sdiD..3k+CfP7Eb0-1-OgDM
FE21J7P[%[4&]^4+@C9lEb0-14"!cp9i)sRATT&)F`MM6DKI68$:AoUCb&FtBkDH;7P[%[4%+4.
E$.u"F?=Ma+=C]BD/aH:F=.M)7Pd+\4&TX0F_Pl-+A,Et4*"nPF_Pl-+=Cf5DImisCbKOAA1%fn
6Zd?b.n2<V0fr9E@sMR#AKXT@6ouf3De*d(+=nXMDe*cuAgniW%16$IBkDH;7Pd+\4%`::+@p'[
E'%fQA8#OjE$-hD$:Zj60KV[6@Wc<+;KZk=3?^F=3F+@D3?^F=2^`-FEcl7F0O$O\3\i^$-S-Yi
3]S?E1,pO5.4ciN3?^F=2^^.rF`2A5+?:T+1,^C3%15Q_4#&frATMr9;f-GgANM878PN#(F)>i2
AKZ)+F*&c=$<(VPAooOm2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@BPDO0DfU,<De(U^
%13OOB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]%14=),9S]n0J5+9+>"]aGA2"F%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?
A7T7^+>"^WARuulC2[W8E+EQg%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0
+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$FCei&E+*Wp
DdtFo@8pf?+C\c#ARlooDe!p,ASuTuFD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b+<Ve2<HDkl
B-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl6#C%VDf-\:
EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!
Df.1;Df%.<E%aO33))/$6;:3C>qQQn+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMt
F*)G:@Wcd(A0>8pDe(J>A7f4%+A$/fH#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(
D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCi
Et&I!+<VeJARTUhBHVS=F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA
?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%
1,'h!;f?/[@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[Wm
F^eo7E,K;r@:Wn[A1e;u+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9
C2[WnDdt/&%13OO+<VdL<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9
Bl[cpFDl26ATKI5$4R=b.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.
+Co2,ARfh#EbT*+%144#+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9
DCI1\<+oue+EM76E,96#Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6t
B-9fB6m,oKA8c@,/g(T1%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5
A7T7^+EVNE@")U(DJ!Tq>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE
$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q
%144-+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+
ChsOf+<VdLE,8s#DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!
+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#
+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q0
1,)<r6mXTB6=FA>F`8W^0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+q
F*(u(+EVNEF*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.
DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs
$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8
@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9
@<,dnATVL(+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%
DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!I
DIakF2)Quq$4R=b.NfjAEc#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB
3$C=>?nMlq%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2
$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<
+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"
DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<
+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*
%14=),9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^W
ARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^
85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa
3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9
FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug
/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;
G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1
E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8
ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,S
Gp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"
+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7
+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.
F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`
8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm
@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf+
+D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue
+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)
D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL
+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7
F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59
+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08
?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DK
E,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>
EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu
+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL
+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_g
FD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]
B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>
@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S1
4?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%
F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlot
DBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%
F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r
@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<
.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI
6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9
F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$
/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtB
DJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$
B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO
+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71
DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4
Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL
+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%
AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'P
BHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i
?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0
F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6
%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e
,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlok
Eb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%cr
F`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3
Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9
-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc
-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;
+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj
/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A
@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i
?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2
?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#
%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1
FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(
@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7
EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56
FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)
AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5
?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(
ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l
+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LA
ARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1
%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL
+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6
+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>Go
Bljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjb
A1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd
/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4
Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*G
AL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+Not
ASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nn
DBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(
@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4
ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*
F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>
D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm
@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6
ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_
AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL
+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.
F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/
A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,Oq
Bl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[
F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',k
F!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N
5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$
+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@
+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>
AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1
@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j
$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>
A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNE
B4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4
+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG
/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de
0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*
$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cq
D.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3Arm
E+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7
F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=
DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08
+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I
?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@lt
EbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQU
F(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW
:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I
-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=J
EbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$Eh
Ec6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&
A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5
?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0
/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj
/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9
/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*
FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&
De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%
0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD
;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6
DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b
.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO
+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=
+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@lt
Ed:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/
EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\
H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9B
F'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,
DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?
AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC
.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk
+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL
+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeK
BPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E.
/iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(t
FDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:g
B4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t
@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j
+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\t
D/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,
F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].q
DJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+
F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=)
,9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;
@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].
+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:
Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdL
BQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL
+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO
<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->T
DKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(
Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%
Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3
DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2
@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B
-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL
+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(
+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+
@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"
DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,
F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXF
Bl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(
A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5
B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?
FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r
?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(n
Ea`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0
FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)
+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#
FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,
F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$
De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$
Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!
FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-
E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P
6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=
De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>
A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!
Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCr
Bl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#
F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3
ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E.
/iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEq
ARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlot
DBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0
@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1
FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV
6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:
Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6r
Ch7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ
8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<Tg
H=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-
+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(
AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i
76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu
%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2
D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;Kau
GB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(A
DImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q
+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%
A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l
-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d
/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+
EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,
05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*
@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhn
DImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*+
+EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.
%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)
ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1
DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8
Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg
+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYo
DBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5
+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7
DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-
+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:
$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@lt
Ed9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNE
DIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"
DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.
F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7
AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht
+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5
B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8
E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%p
CLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.
AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(
@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSH
Eb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!
AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku
$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOA
BHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2
ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19
FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%
DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*
@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58
@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6
De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa
@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3m
Ch4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C
@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.
F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&
A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16
Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>
ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-
F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#
+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r
@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2
@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75
Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPo
FC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?
GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,
0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4
A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge
+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUB
F!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(
Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;
AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,
?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@o
A7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6
%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(
Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#Lc
AM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])
F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[Wr
ASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUr
F"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(i
B.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:g
B4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)
Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSek
ARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^
+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTs
EX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN
/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0
%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9
$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'n
F!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4
Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"
FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0
C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm
2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb
+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj
1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9
FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUh
D'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'
E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83
De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb
,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-
+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b
.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(
+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#
D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7
+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq
+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e
$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(
FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^E
Cht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OF
ASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2
F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7
F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N
<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL
+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<
@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL
+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8
BQS*-%16igA7'7uBk;KqFCf\P1*n&PEbT)s+E)F7Ecu/.G9Cg9+EV:.+A,Et+EMgLFCf;A+:SZ(
+EqL5Ch4_tF)u80Bjl*pA0?)1FD)e=BOr;Y:IH=<Ec6)>+EV:2F!,CEATDs.ATo7+$7-g'E,]W-
ATJu9D]j.8AKYQ%FD5c,+A,Et+EMgLFCf;3F(Jo*FD,5.D.-ppD]gH;F_PZ&C2[X!@<?(*.1HUn
$=%X`@ruF'DL4uO6m,9KATDs.ATrP3$4R>7:IH<R8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3Afg
Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8g%PQ
A8c@6/e&-s$<(MI+EV:.+D,P.Ci=N3DJ()(DfQt2ATV?pCi_WH$=%%OB5)71ASuX-ATD4$AUP!p
>\S:kD%-gp>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37
/T>-2AM8IY<+ohc8l%ht:gn!JI4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n04Aa,CjC><
FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj07=9:+C&f&Ec#6$F(or3%16?SFCf:u
$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs2@Vfsl05Y-=FCfJGC2[W8
E+ER/HW4Zi+A,Et+DkP)F^])/>]aP%FEDVOC2[W8E+ER/I4bs9+C&ttEbTK7F(or3%144_F`M;F
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs2@Vfsl05Y-=FCfJGC2[W8E+ER/%144_
DJsQ4@;L"!H=[Nm>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0no:IH=*F(KA78T&W]Eb8`i
AKY&mEb'6>%13OO;f?Ma+E(j7FD,5.Bl8$(Eb8`iAKZ28Eb'56Ch[s4ARlosATD?)@<,p%DJsV>
A8bt#D.RU,ARlotDBO%7AKY5kEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs2
@Vfsl05Y-=FCfJGC2[W8E+ER/HV.(%+DkP)F^]*7/g(T187d&t+EMLBBl7^&Bl7Q+F)Q2A@q?cm
De*E%GA2/4+CJT"DIdZqF_t]-FCeu*An>CmF`M&7-RU$FDIakt?q"LFFCfJ87;$7S-RU$KDfQt/
FED)3FD5o0+ED%%A7]e&%16fj+CQC/Df03/FCB&tBl7Q+F)PZ4G@>N'+Co&,ASc:(D.RU,+C&Jp
E+jT0DKKT&ASl!rFF>bN$4R=g+D,P.Ci=N3DJ()%De*E%B4YslEaa'$A0>?,3Zr$QEc#N&@:Nkj
AU#=N3dr3#/kL@]:IJo7FCfK)@:NkI<'a8I5uL*%8U=!)7!*?cCi`NS5u'g6;FE'-H:gt$F`_>8
FCfK)@:NkI<'a8I5uL)[$7-fW.k?!^De*Qo@:Nkr/M0-q$4R>I@V'1dDL5;q@:Wq[I16Ng@V'1d
DL4ogB4u*qB4uC$DJ+B%>n%-GBR+Q.EboH-CO9K!G("^B:2b/i@;Jn]CO9K!Fs%nM+<VeTI9Trq
@:s.lAS-:'An*l1@Wm0*+C%9PD/Ej%FB!0oHXU`,+C\bhCNXS=G%G]8Bl@l3DIIBnF+"K)>\JD%
ATDU$DJOT-A7T=nE.*(<:2b/i@;Jn]CO9K#A7oq%+<VeTI9Trq@:s.lAS-:'An*l1A7T=nE.)"7
>XNFHD.RU,<,ZQ!@:WmkGAhM4F"_WHF*)IGFDi:7Ec6)>06;8MFCfk0$=%7iE+O'+Bl7^5@;Kat
@;TRsI=#3oDfT]'CfG=gHXU`,DIIBnF!,mZ>?l,UB4Z*pAp\6(@le%7Ci3ZuATN9*+C%9PD/Ej%
FB!0oHXU`,+DtV)ATJu+Ec5e;F`V,83ZoPRCi!utD.Rc21GL"pF(KD8-Z3@0ALDm8$=%7iE+O'+
Bl7^5@;Kb#AS-"3HX'<aEc#6$<,ZQ!@;Kb#AS-!++FSZB>]=+aATD?oHYI)%3ali@Eb/j(I9dt#
6Z6gYASuThDej].Cht53Df0B0@ps1b+DtV)AKZ#)An?!oDI[7!3ZqjICiX*!F!*P*-ZWd?F`M@B
D0[7EAS,LoASu!hF!lAF$=%7iE+O'+Bl7^5@V97oI=#3oDfT]'CfG=gHX^W!F<D\K+<Z)\>?l,U
B4Z*pAp\6(@le(3ATW?++C%9PD/Ej%FB!0oHZE\>EbT*.ATJu4@VTIaFE8R:Ec5e;E-67FA8,Oq
Bl@ltEd8d:@:O(qE-$F:$=%7iE+O'+Bl7^5@W$"1HX'<aEc#6$<,ZQ!@W$!)+<VdL+FSZB>]=+a
ATD?oHYI)%3auuCI9dt#6Z6gYASuThDej]9BleA=DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+
FCAWeF(HJ'@:O(qE$/b,Ch7[9%16?RH#R>8Ch[d&HXgu2E,'fJ>Y]3XD..6[Dej]0Df'H.+<VdL
I=5=)E+*BjEb/j0BkCj9@rH4'C40A1>XNFHD.RU,<,ZQ!@rH4'Eb0<5ATJu3Df0H2F`)7C@X0):
ASl@/Bl7Q+GA(]4AKZ&5@:Njk@;]TuF(fK4FCf?(DJ().De!3l+DG@tDKKT)Bk;=+I16NgBR+Q.
EboH-CO9T'I=#3oDfT]'CfG=gHXp\1+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.3I9dt#6Z6gYASuTh
Dej]1Ble60@<itf:IH=GATN!1F<GdAFD,T8F<GU8FEMVA+Cf>#AUP!p>\JD%ATDU$DJOT0AScdA
>Y]3XD..6[Dej]1AS`J3+<VdLI=5=)E+*BjEb/j0BkCj9A7]S*>p*B>Df'?&DKJirCO9T'Ch7^"
F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5A7]RiEc?GR
>Y]3XD..6[Dej]1ASc""E$-8GI=5=)E+*BjEb/j0BkCj9A7]RiEc?G4+C%9PD/Ej%FB!0oHZE\7
Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATN8/$=%7iE+O'+Bl7^5A8,S&HX'<aEc#6$
<,ZQ!A8,Qs+<VdL+FSZB>]=+aATD?oHYI)%3b2r8I9dt#6Z6gYASuThDej]1Bk)7!Df0!(Gp$g3
ASuU(Anba`FD5Z2+CT.u+EMX5FD5f<Bk)44%16?RH#R>8Ch[d&HXpi3E.*(<:2b/i@;Jn]CO9T+
F)W6E+<VeTI9Trq@:s.lAS-:'An*l4Ble6A>p*B>Df'?&DKJirCO9T+F)Yr(Gp$X3@ruF'DIIR2
+E(_(ARfh'+CT=6FCf]=I16NgBR+Q.EboH-CO9T0CjgY8:2b/i@;Jn]CO9T0C`jiC+<VeTI9Trq
@:s.lAS-:'An*l4DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg
@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5A8bt+HX'<aEc#6$<,ZQ!A8bs#+<VdL+FSZB>]=+aATD?o
HYI)%3b3/=I9dt#6Z6gYASuThDej]3DfT]'FE8R8De!p,ASuT4FCf]=+E_a>DJ()6BOr;rDf0`0
DKKT2DK?q=Afu2/AKWC3De!:!.3NeFEajG+$=%7iE+O'+Bl7^5A8lU$FFAL@:2b/i@;Jn]CO9T2
F(KG9+<VeTI9Trq@:s.lAS-:'An*l4E-#T4I9dt#6Z6gYASuThDej]@ATT&*Bk)7!Df0!(Gp%'7
Ea`frFCfK6I16NgBR+Q.EboH-CO9W'I=#3oDfT]'CfG=gHY$_1+<VdL+<Z)\>?l,UB4Z*pAp\6(
@le13I9dt#6Z6gYASuThDej]2A8--.A8,OqBl@ltEd8dG@VTIaFE;j>$=%7iE+O'+Bl7^5ATW?I
>Y]3XD..6[Dej]2F<D\K+<VdLI=5=)E+*BjEb/j0BkCj9ATW?++C%9PD/Ej%FB!0oHY$`%F<G[:
G]\?C$=%7iE+O'+Bl7^5AohO$I=#3oDfT]'CfG=gHY.>1DBL&E+<Z)\>?l,UB4Z*pAp\6(@le4C
ASup%+C%9PD/Ej%FB!0oHY-u4F*&O8De!p,ASuT4F(K62ASu!hI16NgBR+Q.EboH-CO9])AT2^=
HX'<aEc#6$<,ZQ!B4PRmF!)SJ+FSZB>]=+aATD?oHYI)%3bMu7E-$G5+C%9PD/Ej%FB!0oHY7A;
F`8I3DIal2F_Pr/+Co&&ASu$iDKKrJ%16?RH#R>8Ch[d&HY6o3I=#3oDfT]'CfG=gHY6o3+<VdL
+<Z)\>?l,UB4Z*pAp\6(@le76FF@F;>XNFHD.RU,<,ZQ!Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-
Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%I16NgBR+Q.EboH-CO9]*FE2VSHX'<aEc#6$<,ZQ!B4Z1*
GT\+O+FSZB>]=+aATD?oHYI)%3bN#GEd3"<+C%9PD/Ej%FB!0oHY6o3+ED%5F_Pl-A0>u4+D#e/
@s)m)I16NgBR+Q.EboH-CO9]1Ddmd9HX'<aEc#6$<,ZQ!B5DKqF!)SJ+FSZB>]=+aATD?oHYI)%
3bN8I@WQs'+C%9PD/Ej%FB!0oHXUf#CjC></0JtEE,Tc=+CT.u+EMXCEb-A+Ci<ckC`mV(D.Rd:
%16?RH#R>8Ch[d&HY7A<I=#3oDfT]'CfG=gHY7A<+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE.)"7
>XNFHD.RU,<,ZQ!@rc-hFCcS'DIal,De*QoGp$a?Dfp#?I16NgBR+Q.EboH-CO9]9I=#3oDfT]'
CfG=gHY7FC+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7EI9dt#6Z6gYASuThDej]4ATT%e+EM%5BlJ/:
FCf]=+D,Y4D'2FnFCf<.+Co2,ARfh#Ed<'B$=%7iE+O'+Bl7^5BP_X*CjgY8:2b/i@;Jn]CO9`2
E,KJ7+<VeTI9Trq@:s.lAS-:'An*l8CiF9.I9dt#6Z6gYASuThDej]1Ble60@<lo:F(fK4F<G+*
F(96)E-,f4DK?q=Afu#$C1UmsF!,C=+=MLaI16NgBR+Q.EboH-CO9f7A79+^I=#3oDfT]'CfG=g
HYRJ0@:s-o+<Z)\>?l,UB4Z*pAp\6(@le@CA79+^I9dt#6Z6gYASuThDej]1@<lo:F(oN%AKYet
F*&O7BOPdkAKYE!A0>B&ART[pDf-\9Afs]A6m-DWC1UmsF+"K)>\JD%ATDU$DJOT6De*NmCiFfL
>Y]3XD..6[Dej]7De*NmCiCL>I=5=)E+*BjEb/j0BkCj9C2[WrASc=6>p*B>Df'?&DKJirCO9T+
F)Yr(Gp#^T6m-/SCiFe3$=%7iE+O'+Bl7^5ChJ0C>Y]3XD..6[Dej]9B-8<>+<VdLI=5=)E+*Bj
Eb/j0BkCj9ChJ0%+C%9PD/Ej%FB!0oHYm2,AKYE!A0>],@:UKQ:IH=<Ec6)>I16NgBR+Q.EboH-
CO9l9@qTh$I=#3oDfT]'CfG=gHYdV1B6%r6+<Z)\>?l,UB4Z*pAp\6(@leFE@qTh$I9dt#6Z6gY
ASuThDej]9BleA=B6%p5E-!.1DIal2F_Pr/F!,[@FD)e7@;TS(%16?RH#R>8Ch[d&HYm2,AUSo1
:2b/i@;Jn]CO9o,CLnV2+<VeTI9Trq@:s.lAS-:'An*l=@;BG&>p*B>Df'?&DKJirCO9o,CLqQ0
8g&1bEbTK7F+"K)>\JD%ATDU$DJOT9Cib#O>Y]3XD..6[Dej]:Ci^^A+<VdLI=5=)E+*BjEb/j0
BkCj9D/=9A>p*B>Df'?&DKJirCO9o,CLnW)Ddd0!F(96)E--L;$=%7iE+O'+Bl7^5D/O0<HX'<a
Ec#6$<,ZQ!D/O/4+<VdL+FSZB>]=+aATD?oHYI)%3c/bNI9dt#6Z6gYASuThDej]9BleA=DdmHm
@ruc7Bl5&%Cht57AS5^uFCfK(A0>Ds@ruF'DIIR"ATN8/$=%7iE+O'+Bl7^5DIn$&I=#3oDfT]'
CfG=gHZ!D=A0<!;+<Z)\>?l,UB4Z*pAp\6(@leL=G@Z,-+C%9PD/Ej%FB!0oHXh)-@<?(%+CQC1
ATo8-Bk)7!Df0!(H$p,/>\JD%ATDU$DJOT:De404I=#3oDfT]'CfG=gHZ!b5G]4cJ+<Z)\>?l,U
B4Z*pAp\6(@leLGAU&0B>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4
+Du*?AU&01@;]LqBl@m1I16NgBR+Q.EboH-CO9r;FD#W5I=#3oDfT]'CfG=gHZ!bDB6%r6+<Z)\
>?l,UB4Z*pAp\6(@leLGFD#W5I9dt#6Z6gYASuThDej]DDfTB0+E)9CFCfN8F!,(8Df$UFGpskX
BOQ!*@<,p%DJsV>Bl5&+Ec6)>F!,CA+EM[>FCfNA%16?RH#R>8Ch[d&HZ!qRHX'<aEc#6$<,ZQ!
DKI!D+<VdL+FSZB>]=+aATD?oHYI)%3c9%f>p*B>Df'?&DKJirCO9W'BlkJ++Dtb7+EV19F<GX7
EbTK7+E_a>DJ((a:IH=8Df0`0DKKT2DKC48$=%7iE+O'+Bl7^5DKgMU>Y]3XD..6[Dej];G9A"N
+<VdLI=5=)E+*BjEb/j0BkCj9DKgM7+C%9PD/Ej%FB!0oHY$`%F<G!7DIn#7AU&01Bk(k!+EqaE
A0?#9Bl7Q+8l%ht@rH7.ASuU(Df0WE%16?RH#R>8Ch[d&HZ*A2@;TRsI=#3oDfT]'CfG=gHZ*A2
@;TRs+<Z)\>?l,UB4Z*pAp\6(@leO;DIIBnF+%=:>XNFHD.RU,<,ZQ!DdmHm@rsA?De!3lAKYl!
D.Rc2Ao_g,+E_a:F#kEd@;Kat@;TRs+>Y_pF`V,8+=D&8D.P)C%16?RH#R>8Ch[d&HZ*GCHX'<a
Ec#6$<,ZQ!De't5+<VdL+FSZB>]=+aATD?oHYI)%3cAPW>p*B>Df'?&DKJirCO9u=ASuQ3@;]Tu
@r-()ATJu)Bk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZ3D'CLhj?>Y]3XD..6[Dej]=@:O(`+<VdL
I=5=)E+*BjEb/j0BkCj9E+*6lA:7`+>XNFHD.RU,<,ZQ!@UWb^F!,UE+CT.u+ED%'Dg#]4F!,[8
F*(u(+EML1@q?csDBNJ(@ruF'DIIR2+D,>(ATN8/$=%7iE+O'+Bl7^5E,pAR>Y]3XD..6[Dej]=
EZcJI+<VdLI=5=)E+*BjEb/j0BkCj9E,pA4+C%9PD/Ej%FB!0oHZ4+L+CT.u+CfG1F)rIEAS,Lo
ASu!h+EqaEA:4mo>\JD%ATDU$DJOT<F``%Y>Y]3XD..6[Dej]=F`\`K+<VdLI=5=)E+*BjEb/j0
BkCj9E-68N>p*B>Df'?&DKJirCO:,EDfTE1+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe@<6!&
Anc'mF+"K)>\JD%ATDU$DJOT>AS,ggD.Rd:HX'<aEc#6$<,ZQ!Eb/j#@;TRs+FSZB>]=+aATD?o
HYI)%3c\eDDIIBnF+%=:>XNFHD.RU,<,ZQ!Eb/ioEb0,uARlp$Df0B0@ps1b+DtV)ATJu+Ec5e;
F`V,83ZoPRCi!utD.Rc21GL"pF(KD8-Z3@0ALDm8$=%7iE+O'+Bl7^5Eb/loI=#3oDfT]'CfG=g
HZE\1A0<!;+<Z)\>?l,UB4Z*pAp\6(@leXAB4QEr+C%9PD/Ej%FB!0oHZE\1BleB-EZee.A0?#4
Eb/ltF*(u6+A,Et+Co1rFD5Z2@<-'nF+"K)>\JD%ATDU$DJOT>ATMs(I=#3oDfT]'CfG=gHZE\=
FCZL:+<Z)\>?l,UB4Z*pAp\6(@leXAF*(r@>p*B>Df'?&DKJirCO:)5F*)>@ATJu9BOr<'Df^"C
Eb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#U(I16NgBR+Q.EboH-CO:)5G&MeU>Y]3XD..6[
Dej]?AThu7+<VdLI=5=)E+*BjEb/j0BkCj9Eb0E4I9dt#6Z6gYASuThDej]?ARf:hFDQ4FEb0E.
F(Jl)DdmHm@rud?%16?RH#R>8Ch[d&HZE\@Df0-2I=#3oDfT]'CfG=gHZE\@Df0-2+<Z)\>?l,U
B4Z*pAp\6(@leXAG&M80G^Wj?>XNFHD.RU,<,ZQ!Eb0?8Ec,q@@3BB#F*&OCAfu&8F<G+.@ruF'
DIIR2+E(_(ARfh'+EqOABHV22+D#e:Cgh3iFD5Z2F+"K)>\JD%ATDU$DJOT>D1-b9:2b/i@;Jn]
CO:)=+<VdL+<VeTI9Trq@:s.lAS-:'An*lBD1,\4>XNFHD.RU,<,ZQ!Ecl8@+A*bn@:O=r+EM%5
BlJ08I16NgBR+Q.EboH-CO:)DFFAL@:2b/i@;Jn]CO:)DF<D\K+<VeTI9Trq@:s.lAS-:'An*lB
FEDq:+C%9PD/Ej%FB!0oHZF7HF!+'tFCfN8+EM%5BlJ08I16NgBR+Q.EboH-CO:)HF+&C?:2b/i
@;Jn]CO:)HF!)SJ+<VeTI9Trq@:s.lAS-:'An*lBG]S:=+C%9PD/Ej%FB!0oHZE\1F_kK,+D#e:
Eb0<5Bl@l3F(Jd#@q^9"$=%7iE+O'+Bl7^5F*D2?I=#3oDfT]'CfG=gHZOCBGT\+O+<Z)\>?l,U
B4Z*pAp\6(@le[TAU&W/+C%9PD/Ej%FB!0oHY%GDEa`I"+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2
+D,Y4D'4%@Eb$;+ART+\EZek1D/Ej%F<G"0A0>r%G%H(2$=%7iE+O'+Bl7^5F`V,)@X3BK>Y]3X
D..6[Dej]BF(JlkGp"4PI=5=)E+*BjEb/j0BkCj9F`V,)@X3B-+C%9PD/Ej%FB!0oHZE\>F`MA@
+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i+EqaEA9/l3DBL?P.=DX4
>\JD%ATDU$DJOTAF(KE@HX'<aEc#6$<,ZQ!F`V,8+<VdL+FSZB>]=+aATD?oHYI)%3d#LTF+%=:
>XNFHD.RU,<,ZQ!Eb0?8Ec,q@GAhM4+ED%*ATD@"@qB_0%16?ODIe)bBkM*qBkM+$Bl7R3%16?O
DIe)mBOPF_A:832A8Gt%ATD4$AQ<e_Ebf63F##UJ67sC#F<G^IATDQtH#k*<Df00$B-:f)EZf=A
De`inF<DuNEb]?-A8Gt%ATD4$ALT5@$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`C3+<*FE_/6
AM.J2D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*XFDs8o05>QH
Aor6*Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2AM81IATDQtH#kTJ
E,Z6n:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.IUQbtDf0VL
B45XgF"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT@WHC2F(J]n
?RKN/FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7-OgDX67r]S
:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;:-pQU,"=L8
%15is/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA%15is/e&._
67sBU:K0bD+Cf>-G&M2>FCeu*-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-Qli@DeWa'+E_a:
+E(j7-T`[u@q]:k@:OCjEX`?b$;No?+@p']Ed9$R+<k9;FEB*WB5Di;+?;&.1*CdZEbf*(Dfor.
Et&IO67sB@+Z_A=+=Jrn+BosK+Z_A;+=C]/Ecl7B,VU?F+?:T+1-$I*-Qjr_-mC\p3?^F=3%$(&
+=nW_.3Mh;3?^F=2]sIq-Qjr_-n$<h+BplL4usf6-RU8g4XhL6+Z_A:-RU>c/0H;f-RT?1:-pQU
3?^F=3F+@D3?^F=2^`-FEcl7F0O$O\3\i^$-S-Yi3]S?E1,pO5.4ciN3?^F=2^^.rF`2A5+?:T+
1,^C3%13OO7P[%[4&TX,@;BEs6ZmEiASuTOCi<`m+=CoBA8Gt%ATD4$ALAU)+>G!ZFEAWQ@WcC$
A86$nCh\!&Eaa'$-QlV9@r,^bEZc_W%15IEEbm6q1-73P;e:%n6ZmEiASuTOEcW?NE,o].De*Zu
FCfK$FCcgB>9Iip-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-QlV91E^UH+=ANG$:AoUCb&Ft
BkDH;7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:F=.M)7Pd+\4&TX0F_Pl-+A,Et4*"nPF_Pl-+=Cf5
DImisCbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#AKXT@6ouf3De*d(+=nXMDe*cuAgniW%16$IBkDH;
7Pd+\4%`::+@p'[E'%fQA8#OjE$-hD$:Zj60KV[6@Wc<+;KZk=3?^F=3F+@D3?^F=2^`-FEcl7F
0O$O\3\i^$-S-Yi3]S?E1,pO5.4ciN3?^F=2^^.rF`2A5+?:T+1,^C3%15Q_4#&frATMr9;f-Gg
ANOpSF<DrGDe*ZuFCfK$FCeBfDeio<0II;:;eTlWF=Tg=4#&frATMr96=FqL@ln=DE,961+=CoB
A8Gt%ATD4$AQ3\gF^f/u9jqgKEcWTN>9IuuFD>`)Ch\!&Eaa'$+=AOODe*ZuFCfK$FCeftG%kN3
?Z]k(1,:-uFD,B0+DPh*Ch\!&Eaa'$+E)F7Ecu/.G7=m*>]XIdFD5Z2HX(Z(G]\%LHYRJ0Ch\!&
Eaa'$I3;=/ATDs.ATrP3$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCBlbD*+A*c!FD5Q*FEo!M@rc:&
F<G[=@<<W)ASu("@<?(%%16?REb/j0BQS?8F#ks-ASs,EBkqF%ARoL`/oPcC06_,GBeN.oFCfK$
FCefuEc5T2@;TjqDJ+BECh\!&Eaa'$I3<'=@s)X"DKKqBA8-'q@ruO4+D,Y4D'3(sEb/j0BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I="R^6m-#S@ruF'
DIIR2I3<0CDfp#?/e&-s$<(MI+EV:.+D,P.Ci=N3DJ()(DfQt2ATV?pCi_WH$=%%OB5)71ASuX-
ATD4$AUP!p>\S:kD%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9
@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIS$@<HDklB-:r-A8Gt%
ATD4$AKYl/FCep"DejbR+:SZ#>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9
H#@)>%144_DJsQ4@;L"!H=[Nm>\S:kD%-gp>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apo#+F(oN)
+DPh*Ch\!&Eaa'$+AbHqI4bs9+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/
%144_DJsQ4@;L"!H=[Nm>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*Zu
FCfK$FCfkC8T&W]Eb8`iAUP!p%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?RH#R>8Ch[d&HW3O-;c#bT6r-0uHX'<aEc#6$<,ZQ!<(KSZ:dIiE:I?6I+<VeTI9Trq@:s.l
AS-:'An*l$84c`V5u'gD6[`5_>XNFHD.RU,<,ZQ!Ap%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*Wp
Ddt4=BkAK+DBO"6ASc0*E+*j%I16NgBR+Q.EboH-CO9Z3Ec#N&@:NkjAU&WM>Y]3XD..6[Dej]3
DfT]/Amo1\FCf\>+<Z)\>?l,UB4Z*pAp\6(@le4?Ec#N&@:NkjAU&W/+C%9PD/Ej%FB!0oHY.2:
D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0I16NgBR+Q.EboH-
CO9]7E,961I=#3oDfT]'CfG=gHY7A<Ch[u6+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9B6%s-Blnc/
+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>AoD]4B6%p5E$-QS.=DX4>\JD%ATDU$DJOT5Amo1\F(Jj'
Bl@m;HX'<aEc#6$<,ZQ!BkCd`ATMEmFD5Z2+<VeTI9Trq@:s.lAS-:'An*l9Amo1\F(Jj'Bl@m;
>p*B>Df'?&DKJirCO9c5FCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ+A,$=%7iE+O'+Bl7^5
BkCk'HX'<aEc#6$<,ZQ!BkCit+<VdL+<VdL+<VeTI9Trq@:s.lAS-:'An*l9An-6p+C%9PD/Ej%
FB!0oHY.2:D..N/Bl8$(Eb8`iAKYK$D/Ej%F<G[:G]\?C$=%7iE+O'+Bl7^5F(KH.De*ZuFCfK$
FCflI>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZDL>?l,UB4Z*pAp\6(@le[BFD>`)Ch\!&Eaa'$
I9dt#6Z6gYASuThDej]=Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F
+Eqj?FCfM9E,oMuD.7<mI16NgBR+Q.EboH-CO:2JCghEsG\1u?DfTB0I=#3oDfT]'CfG=gHZaOK
@<?(*Ao`*6Eb'56I=5=)E+*BjEb/j0BkCj9Fa%Y1FCf]/Ed)GBA930)+C%9PD/Ej%FB!0oHZa4M
Ea`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'564$"a5AKZ2;@;m?3B5Di@I16Ng
BR+Q.EboH-CO:8DEb'!#FFAL@:2b/i@;Jn]CO:8DEb'!#F<D\K+<VdL+FSZB>]=+aATD?oHYI)%
3d5L_A8Gt%I9dt#6Z6gYASuThDej]:@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLaI16NgASu%*
882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$
FCfkC@;]Tu8l%j'%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DkP&ATJu8Df'&.@<6L4D/aT2Df0V=
@:F.tF<G[=AKXSf@rGmh+CT.u%16Wa@s)X"DKI"CAU&;>BlkJ:Ec5H!F)to6/g*`-+CT>4F_t]2
3XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@0g[+EMIDEarZ'@rGmh+DGm>F*)>@
ARlotDBMPI6m-#S@ruF'DIIR"ATKI5$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\3De!p,
ASuT4Ao_<mD.RU,F!+n3AKYPuFD,6+3XlE=+C&AeB5)71Blmp'BmO?=%144#>\S:kD'2P]Ebf3(
GA\O9Ec6)>+Dbt6B-:`'@s)X"DKKq\+C')$EajDO+?:QTBle59-YII<F`;5,D.P)B%144#>\S:k
D'3(W@8pf?>Te*1AnGb%ARlp#@:O=rF#kFKG%G]'Ho)sVBle59-YII<F`;5,D.P(G-XUe8Bk;Kq
FCf\EHjpE*+C&JqA:&$4ASl.-AUP!p%14C(>\S:kD%-gu+<Ve%Df..!+Cf>#AKY].+Cf>-Anc-o
A0>u4+EV:.+A,Et+D5_5F`8I:ART+\Ea33pDffl8FCfeuBPDMs$7-f;+<VeCBl.R+@<?4%DBNe)
Gp$R-+D"u&ARlotAftf0+C\nlDf'',+CQC+Bl7I%@;]Rd/q"jNDIal(F!,=.Ebf5s%14C(+<YlB
FD)e9F(KK)D_5p:DIdZq+Co&"Bl.R+ATDiE+@UHbEd;b?Bl7Q+Bl5&'F`M;D+C'#"G]\%LHX(o&
I=2P3,p4<Q@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*mCh[NqFD5W*+Cf>-
G%GQ5Bl@m1/e&.6+<Ve3FCf]=FEDkEDe*ZuFCfK$FCfkJF!,.-@:Wqi+Cf>-FCAm$F!+^]@8pf?
IUd;,AKZ).@<<W+F!,=.Ebf5s+Dbb-AIStm+<VeKBPDN?%13OO,p6H%AS5^pHZit@@UX@mD1)j#
,p5rL/j)7FIXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%14C(:-pQs5(7s0
INT(,,p6H(DIe*;ATD6gFD5T?%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HW#!(DJ=!$
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I=2P3%16?^AU&<=FF.b@A8Gt%ATD4$AUP\AF`)7CDf-\!Bl7I"
GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=Ado)>/mN",Dffl8FCff(FCf]=FEDkEDe*ZuFCfK$
FCfkCGA1l0+EDUB+E)-?8g$)G0JO\YDIal!AU/33A1i9>$4R>AD]j1DAKY6"AU&<=FF.b@A8Gt%
ATD4$AUP\HDfm1>F`VXc%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#8T&Tk@;Ka&
8l%i-%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q
05>E9I="R^7"$1lF!+m68du+M+CSekDf.0M8TZ(hF!,UHF^]*&Gp$g=F*(i,Ch7-"GA2/4%144#
>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeN:k@r5XlI=#pA@r5XlI4bs9>\S:k
D%-gp+A$HlFCB!%+A,Et;bpCk6U`U:$6UHrBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;
GA1i,00s,ZDf0VLB4YslEa`c;C2[X(Dfp)1AUSnt:IJ,W<Dl1QI16N++DGm>@;L"'+CQBb+CSek
Df.0M8T&Tk@;Ka&BlkJABln#2>]aP%FEDVOE+*6n@;^KG+A$Yt@rH7,@;0V#+EV:.+A,Et%144#
A8,OqBl@ltEbT*++ED%5F_Pl-A0>u4+C]J-Ch+Y\:IHfX8l%iR:K::[73H#TF)N12Df0Z*Bl7u$
$6UHrFCf]=FEDkEDe*ZuFCfK$FCd(Q%16?SFCf:u$6UH_DKBo.Cht5&+CfP7Eb0-1+Eh=:F(oQ1
+E(j7>\J.hAp\35FDu:^0/%9QDIdZq/oPcC07A1d@;]Uo@sos=$6UHrFCf]=FEDkK@;]Uo@soJC
ATDj+Df-\&FCf]=FEDjb/ibO=/hqbs@;]Tu@V'h'DIak!$6UI4F`;;<Ecc@F8g&2#DKK<3+D>J%
BP_BqBQRs+B.b<'EbTH4+Eh=:F(oQ1F!,L7EHPu9ARlp#De*QoBk(RnBl@lA+B3#c%144#AoDL%
Dg,o5B-:Z"DeC23Df^#A+E2@>G%kJu+Dl%;AKY])AoD^,@<?4%DE846+<VdL+<XouAS5^pHY%);
D.R`rFCfk0$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:I="\,Eb-@c+AcKa
A8bs#;gE8&@<`ncBkM*QBkM+$Bl7R3%13Ca+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2T
FCBDGBPD*mCh[NqFD5W*07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp'FCf;3>\J.hAp\35FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkY
H#@_4GV*TCB4u*qB4uC$DJ(VNHVe-gA8bs#@UX=hA0=Je;gE8&@<`ncBkM*qBkM+$Bl7R3%13Ca
+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJB
DfTJD1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3
DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.l"o0etC:0J>+706:]ABe=.8FCfK$FCd%=De(MLHW+KmBe<"mFCfK$FCcRe:IKU`%13Ca
+C&ttEbTK7F(or3%144#+<VdL>]k('HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJB
DfTJD1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707=9:+<VdL+<Xp,DfT]'Cia<:AIStQ+<Xp#
DIe**DKTf-Eaa'$I16NgBlmp'%144#6?R!YA0>-!AU&<=FF.b@A8Gt%ATD4$AM/BR>]aP%FEDVO
C2[X!Blmp,@<?(/+DGm>@3A/bB6%p5E%W8*:IGX!+<YN0CLqQ08g&1bEbTK7F!,(8Df$V0Ec6)>
F"SS7D]in*CLnVnFCf]=FEDkEDe*ZuFCfK$FCfkCA8aL<$4R=g+C&AeB5)71G%G]'@<?4#I16N0
+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$7-g3Ci^^HC2[X!Blmp,@<?'.%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8W
Bl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]?AT;j,Eb-AA>Z5`bBl7Q_Dej])FCf]=EHQ2A
ATMR'B5D.+I:m,/ATD3q05>E9>]aP%FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!De'u=>YAXR
GAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[WnATf22De'u5FD5Q4>]aP%
FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc>Y]3XD..6[Dej\BDe'u=
>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=g
HYmS?+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)
Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XI!ASrW4BOr;Y
:IH=9Bk)7!Df0!(Bk;?.@rH7,@;0UnDJ()6BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#F_t]-F=n"0
%14C(>[h8WBl89@ATD6gFD5T?%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/
+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>E
Ec#6$<,ZQ!De'u=>YAXRGAhM4<,ZQ!4$%dp;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[Wn
ATf22De'u5FD5Q4>]aP%FE)GAFCfN-DJ*csH[U;b>YAXRGAhM4<,ZQ!>C@W!6tKk/@;Jn]CO7jc
>Y]3XD..6[Dej\BDe'u=>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"
AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+A?]^A0>-!AU&<=
FF.b@A8Gt%ATD4$AM/BR6"Y4MEZf4-CM@[!+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6G+Ceht+C\mk
$6UI-Ddd0fA0>]&CLnVsDL!?s+EM%5BlJ/H%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p7#B@:UK.
C2[X!Blmp,@<?'.%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*q
BkM+$Bl7R3>?q[F>Y]3XD..6[Dej]9Ddd0!I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXI
A8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_
A:4mo>\S:kD%-gp+B)in+CQC:DfTW-DJ()&Bl[cpFDl2F/g+D@AU&<=FF.b@A8Gt%ATD4$AUP\6
ASu("@<?(%%144#>YJR*AQXCnBl%@%/g*GrC`meA@qZusBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.
A8-'q@ruX0Gp%0IARfFdBk:ft@X/Ci+<Xp2AU&<=FF/(?FD>`)Ch\!&Eaa'$/q"09%14C(>[h8W
Bl89@ATD6gFD5T?%14C(F(KH.De*ZuFCfK$FCcRB-QjO,67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!
Df0!(Gp$X9@s)X"DKI"3Bl[cpFDl2F%13OO,p78?FD>`)Ch\!&Eaa'$+=CY[>]aOoE$lbN+<VdL
+<VdL:-pQUGA1r*Dg-73$7-g9ATV[*A8Gt%ATD4$AKW?RBQ%a!05>E=DD-*CD/^jF+AP6U+Dbb0
Fa+?&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@
AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBjF`MM6DKI!n:IH=EF`\a:Bk)7!Df0!(
Gp$X9@s)X"DKI"3Bl[cpFDl2FI16Mm$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I:G<CFCf]=@UWb^F)59+BR>/LASlBkFCf]=EHQ2AATMR'B5D.+
I=34\+<VdL+<VdL>XNFHD.RU,<,ZQ!:-pQUGA1r*Dg-8N%16?8DfT]'CfG=gHZNb?C2[X!Blmp,
@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[RP\Df'&=C2[d'06CcBE*RKrG][qJDffQ3
Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g+tEDKU2P%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)m
BOPF_A:4mo>\S:kD'2bgF<GL@FD5Z2@;I&pF`_;8E[YuX+EqOABHUi2@:X(^+C'#"G]\%LHZNb?
C2[X!Blmp,@<?(//e&.m@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA6=FtQ@;]=lAU&<:F`2A5F(oN)Ch7sAI9]NcEc#6$<,ZQ!
+EM+9C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#
F(foK@UX@g@<Q3eFCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQUF(KG99OUn3=<M$p
FD,T5.!$g[FCf]=+CT.u+Co2,ARfh#Ed<'B$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[
I16NgBlmp'%144#;KZk">]aP%FEDVOB6%s-BlnbGDf-\>BOr<!Ec6)>+F.mJ+Eq73F<G[D+CoD#
F_t]-F=n\@FCf]=FEDkBEc>i/FF=T*+<Y<.DImisFCfM9>YJR*AQXCnBl%@%+DG^9FD,5.GAhM;
Bl7Q+A8-'q@ruX0GqL4=BOr<,Df9_?>YJR*AQXCnBl%>i$6UI*F!,+0G%GP6FD,5.B6%p5E$0%,
D.P=/$4R=g+C&AeB5)71G%G]'@<?4#I16N0+D5_6Ch[u6-YdR1Ch\!&Eaa'$-Ql/N/g,">CLqQ0
C2[X!Blmp,@<?'5FCf\>%14C(>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88g
BkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]4Ec>i/F<H!:;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)
Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=35C6Z6gYASuThDej\p67sBt@;BFq+DPh*
Ch\!&Eaa'$/p(ZL+FO\+>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHk
F(HJ!9OUn3=FP@1+Cf>,E+s-"+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOB6%s-BlktU
+:SYe$6UHW+C\c$@qZuiFCf]=FEDk=@<?o?F(96)E-*4:F!,[IBlnH.DBO%>+EV:.+C'#"G]\%L
HZNb?C2[X!Blmp,@<?(/%144#A8-'q@ruX0Gp%3B@<<W5BQ&*9+EV:.+EM+6F_,H#AKYo'+C%TK
<+T0:+Cf>,E+s,sFD5Z2+Cf>,D..<mF"Rn/+<V+#+<X-fCh7Ys$6UI.@<iu)AKYr4De!@"F(Jl)
GA2/4+C'#"G]\%LHZ3M-CghEsG^V+c>]aP%FEDVOG\(]"FCf]F+E)90$6UHrFCf]=FEDkGF^])p
FCf]F/g+;8F`JU7BQ%TpAKZ22Cht5'AKYMt@ru.$ARlomGp%3BAKYr4ATMF#@q?d$Ado(i+B<;n
@rGmh+Cf(nEa`I"ATDiE+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYr4ARTFbCh4`$Bl%>i$6UHr
FCf]=FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGBl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/e&.m
ASu%*ASuX-ATD4$AUP!p%16'JATD?)@<,p%F)Po,+C%TK<+T0\F(KH8Bl7R)+F.mJ+DkP4+Eq73
F<G[D+CSeqF`VXW%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#7:^+S+C'#"G]\%L
HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<WM+Cf(nDJ*N'FD,5.DKTf*ATAo3Aftf*A7]up$6UI$
DesQ5DK@EQ<+ohcA7]@]F_l.BBlbD=BQ@Zq+C]J8+EV:2F!,=.Gp%-=F*2;@+DG^9G%G]>+Dbt6
B-;)#D.Rc2Ecl8;Bl7Pm$6UI5DeEX'BOu3:+B38%A7]7kARTXk+E)9CBl7F$ARTXk+DG_(AU#>-
DesQ5DK?q1BOPdkANC8-%16?LAS5^pHZit@@UX@mD1)j#>[h8WBl897F_l/6@rH1)I=!bu>?l5\
@ruF'DCU!<Bl7HmG]$r,AURhn$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<Xp2AU&<=FF.b@A8Gt%
ATD4$AUP\FEa`p.+Dbt6B-;86F`Lu'+Cf>#AKYf'DImlA+BNSlE,]N/B-:o0%144#@rH7,Ec5c1
ARlomGp$@6AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(nEa`I"ATDiE%144#
6YKnGB4W3-BPDN1G%#30AKY]!+F.mJ+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7CAM,*,Ea`p+ARlp"
Bl7L'+CT;%%144#E,oN"AS#C`A0?)1FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e5u:6D5t$,DGA2/4
+Co%q@<HC.%144#>X<1;Ecb9!CO9<.AU&<=FF-2(/j=]3/e&-s$=%:eASiP!$6UHrFCf]=FEDkE
De*ZuFCfK$FCfkCD..]4Bl7F!EcP`$FDQ4FBPD*mCh[NqF<Fh"D/a08GB.,2E+NR.+C]86ARloU
+Du+?DK?qBBOQ!*@rH7,@;0Tg$6UI.Bm=`BEb0;7De:,5FE2)5B6,2(DIal.FD,6++E)@8ATAo8
H#R>9/g+,,BlbD*CiaM;BQ%]tF!,(5EZfRH@;p0sA0>c.DJjB8DK?qBBOPul$6UI$Df0Z*Bl5&0
Df021ASkmfA7T7^+EMXFBl7R)/g+,,AKZ/-Eag.rFCf]=FEDkPGAL]0AU%g-GAhM4F+#S^F(Jo*
E+*BjIU$i#B4Z*pAp\6(@leaVCghEsG\1u?DfTB0I4Pg7+<Y0&DBND"+E_a:A0>u4+D58'ATD4$
AKY5hD/a08F`)DD@;p0sA:5S*9OUn3=Blt\DfQtAF^o)-GAhM4F!,R<@<<W%@;[2sAKYhuDKTB(
Cj@.IEa`p+ARlolDIal(DKBB0FCetl$6UI*DBO%7AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%L
HYRJ0Ch\!&Eaa'$I4cXAEd8d9F!,[<+Dkh*BQPA<Df'&.D..=)@;I&tA8-."DJ'Cc+<YB>+CT)1
@<lo:DIm<hF)tc1Gp%<FFD)e%9OUn3==t$i%16?ODIe**DKTf-Eaa'$I16NuDe*g-C/o=dEbf63
F##UJ67sC#F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A19,?$;No?%15is/g+)(
AKZ22CM=o1@:s-oGB\6`C3+<*FE_/6AM.J2D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFT
H#jE%:-pQU@;L"'3Zr*XFDs8o05>QHAor6*Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,
F*(u605P?304J@2AM81IATDQtH#kTJE,Z6n:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*D
DImm5AS#glE]\)U@:UK.IUQbtDf0VLB45XgF"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$n
Ebm6s4"r`dCi=B9@<-WT@WHC2F(J]n?RKN/FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$
@:F@q@<-WH7r3*bF('*7-OgDX67r]S:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;
:-pQU,#`/hAooOm2BiS;:-pQU,"=L8%15is/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA
%15is/g)?:BPD(#.n2HA%15is/e&._67sBU:K0bD+Cf>-G&M2>FCeu*-p/klDe*BiFse^i-p/kl
De(4E/3G;&FD5Q4-Qli@DeWa'+E_a:+E(j7-T`[u@q]:k@:OCjEX`@N67sBM1cmBQ6tKhMB-:)p
DEDB<Ecl7B-RU$WAT2Ho@qB0nGA2/4+?;&.1*CdZEbf*(Dfor.%13OO7P[%[4&TX,@;BEs6ZmEi
ASuTOCi<`m+=Cf5DImisCbKOAA1&L(+ED<A-Xq44Ch.:!A7TCqFE2))F`_>9DC6Q2+Cf5!@<*J<
-OgDMFE21J7P[%[4&]^4+@C9lEb0-14)\XP-p/klDe*BiFse^i-p/klDe(4E/3G;&FD5Q4-QlV9
1E^UH+=ANG$:AoUCb&FtBkDH;7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:F=.M)7Pd+\4&TX0F_Pl-
+A,Et4*"nPF_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#AKXT@6ouf3De*d(+=nXM
De*cuAgniW%16$IBkDH;7Pd+\4%`::+@p'[E'%fQA8#OjE$-hD$:Zj60KV[6@Wc<+;KZk=3?^F=
3?T_).3Mh;3?^F=2]sJY@WHU/+=&W`>9GpL3\i]<-mp,g+=JEp+?:T+1,pX/.3L/a-Rg0B+?:T+
1,g='-RU#f+=JW_INViU+?hh/-RU8h-9We#3?^F=2CBk$+=nW_-RU8N$:Zp80fr?GF*&O'D/X3$
4*#Fb+=CT,G#N6rCLo1R-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1p6
DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.Q
Bl@ltEd9#A$<BSn;b9b[4ZXrF/hen51*A.kA7]p3%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^
<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr
9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*
/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm
@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:
$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@
%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9H
A7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`
F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl
:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX
@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE
+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)
Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%ht
Eb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?
BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI
6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2
+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&
DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A
@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*
8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>
FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'
FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=
E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">
DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._
:-CW\-S[5-/i"d`$:[fb6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV
5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+U
FEhm:$?0NfA8bs2C2[W8E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM
6pbI+FAR!d@ruEpATLOR@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi
01o#.9OVCOBl6OcE-ZP:E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1
Ado)dA7f@j@kUi'Bl7QU:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7
F)u&6DK@FLA7c8XE+EQkDdtG#F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J5uU383Zodt%15Kl
;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#
F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;@rH7,@;0V#+E1k'+Eh=:
F(oQ1F!,C5+A-cqH$!V<%16ukFCep"DejD:FD,*)+EM47G9CR;G9D!G+E_a:+Eh16BlA-8+A,Et
+D,%lBl%L*Bk;?<%16$FAKZ).AKYMtEb/a&DfU+a%13OOC2dU'BHS[O@:WneDK@IDASu("@;IT3
De*Bs@s)X"DKIONA7f@j@j_]m%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*
E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^0/$aO
@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#D.RU,
+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3hBkCpt
FD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums
+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrF/hen51*A.kA7]p3%15R#9LM<I4ZXs'ASu("
@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen
7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gk
F`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!
+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$
F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`B
BOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0
@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht
@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*
F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*
%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^
+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/
FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WG
Bl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3
De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#
FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:B
F`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI
$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;
D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9
Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc
$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDkE,o](
AS,@nCihEe:-pQ_E,o](AS,@nCige@/M/)UAS,@nCige=Ec5](@rri7ATW'6/e&._67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i$ARf:g@V'R&1,(I;%15is/g)_t
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>;67sBiA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F+
+=ATh-YdR1A7]p,C2[W*F`_>6F!i(>$;No?+E(d5@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?
+CfP7Eb0-1+EqaECM@[!+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%15is/g+nIA7o7`C2[Wi4ZX]5
B6%p5E$l)%%15is/g+YHEcP`/F<GdGEbfB,B-;8<Blmo//Kf.ZART?s@<3Q/AS#C`A.8l@67sBq
De*orBkhQs?TgFm-ZaEEFCcg/$4R>;67sBjF`MM6DKI"FDfTW-DJ().De!3lAKWQIFE_;)CER&,
+Dtb%A7]9\$;No?+EVX:Ci<fjBkhQs?TgFm-Z!^2@;KL&%13OO:-pQUCi<`m+E_a:Ap%o4F`_>6
F!,17FDi9MBkhQs.1HVZ67sB.BkhQs-Qm&5F<Gua+D5_6+=CfBE+<]mF)uJGBl%i<%15is/g)NU
C2[W1+D58-+FPjbB6%r6-Y-[tG]Y;B$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7]suBlmp$F(96)
E-*H:$;No?+=Cl<De(4<B4Z1*GT](/-Y@"3+DGFt-Qij*%15is/g,+UF>%lZAS*&:+DG_7ATDm6
+Dl%-BkD'jA0?)7Eb'56Bl5&8@<-!lF<GC<@ps1b%15L!6WHiL:/jSV9hdoK6sjYCDe*2t4ZX]6
0H`D!0I[G<F)>i<FDuAE+E2?D-[U;;IXNRQ$>"6dF(HIAH[\_=I4#I2:-pQUFE2#1De!-gC2[Wi
+D58-+=DMb:4@U=%14Nn$4R>;67sC%ATT%e:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m
+EVNE@:OCnG%#K(%17/nDfp/@F`\`RF`V,794`Bi+ED%7ATT%H+ED%7FCB33+A*bgDfQt1BOPdk
ATK4.$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=C]2AmoguFB*BnEbf63F!iCZGB.D>AKY`,
@<?0*-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<DrAAS,@nCige=Ec5](@rri7ATW'6
-OgE%Eb]?-A25l767sa,Eb]?-A0>qF/KeeHA0>i3De`inF<GX9FEMOT%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C@%15is/g)_t/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>>`m@rsFa+CSekARlp0Anc'mEt&IO67sB73,`;K0ejeZA7T7^+@/pn8P(m!
+CoV3E,uHq:-pQU0K<u\F>5TpBl8!'Ecbl'+@/pn8P(m!+EM+9FD5W*+DG_8D]ie5A7T7p+DPh*
+E_d?Ci^_<@<,dnATVL(Et&IO67sB83Fl]20K(%oATr0/FED)3+D,P4+A*b:/hf"&%15is/g)o'
DJs\R2BZF=C3=T>ARloqDfQsm+?;&.1*@#5%16QTBk)3kBkhQs?TgFm4$"c<-Y[F/GUG((4u%Cp
Bk/>?.3g3SD.Rr7-RgSoC2[WnATf22De'u5FD5Q4-Qij*De'u"A8,Op?YO7nA7$H`+>Y-YA0<6I
%13OO:-pQU@s)g4ASuT4GAhM;Bl7Q+B6%p5E$-_TFE_;)CER&,+Dtb%A7]9\$>OKiB4#@fDe*3<
3ZoebDe(4)$4R>;67sBjF`MM6DKI"FDfTW-DJ()5F_Pr/+>"^XG@b2u+CT=6DImBiARl5WC2[X(
?YO7nA7%J\+=CoBA92U+CLqU!F*)IN%13OO:-pQUCi<`m+E_a:Ap%o4F`_>6F!,17FDi9MBkhQs
.1HVZ67sB.BkhQs-Qm&5F<Gua+D5_6+=CfBE+<]mF)uJGBl%i<%15is/g)NUC2[W1+D58-+FPjb
B6%r6-Y-[tG]Y;B$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7]suBlmp$F(96)E-*H:$;No?+=Cl<
De(4<B4Z1*GT](/-ZjDPAnQ-,BkCj&+:SYe$;No?+E2IF06hMKAfrZJBl8!'Ecc@FD/Ws!Anbge
+A,Et+EqaEA9/l-DBNk,C1Ums+Dbt+@;KKa$:IZW<D>nW<'sGU9gMNB?YO7nA7$HB3Zoh)+?CW!
.1HW*D/XQ=E-67FE,m'KH[\_=I4#I2ATD4#AKW@IISP??-OgD2-XeARC2[Wq?YO7nA7$c.B4Z0-
-[U;;IXNRQ$7QDk%15is/g,4HF<F1O6m-VnATAo/AU/>>/Kf(FEHPu9ATJtd+ED%0Ddd0!FDi:1
@ruF.@<?&i$?L'&F`_SFF<DrRF(KAbAU/>>Eb0<'F=.M).!0Au:K(484!8l2+=nWi+E2%)CEPGV
B4Z0--YdR1E,o\nF(KB-AU/>E.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L@qK@$+:S[!
D/XQ=E-67F-V@0&+E2@>C1Ums+EM+9F`8];$@7#EC2[X"@;0UdFCf\P1*n&;@;0U%8l%ht.!g2c
C2[X"@;0U3FCf\G+DbJ.AU#>0Bl%?5+:SZ(%14C(8l%htF)Q2A@q?csF!+t2D/aE7ARlp%AftM)
DKTf*ATAo3AftT"@<6L$F"SS7BPDMs$7-g,Bl%?'@<6L$D.7<mF!+(N6m,uU@<6L$F!+n/A0>H.
E,Tf3FDl2F+DkP/ATDKnC^g^t+DG_8D]iI2F(oN)Ch4`1Dfp)1AKYK$A7ZloDe!p,ASuTB%14Bj
$7-g)Df'H-Ch[d"+EV:2F!,(/Ch4`0AT;j,Eb0;7E+EQs@<?(*/0K1KCghEsGRY!+%14C(+<YW6
Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QD..3kBl7HmGT_<YH>7A/D..-r%14C(+<YW6Ao(mtAU#=?
H?smPDe*]nBl4@e,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14Bj$7-g'Cij6/DIIX$G%GK8%14Bj
$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+Dc1/
CghEsGT\,TH?s=EA8PahD@Hq!+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg$4R>IBl7m4FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U#.%16?KF`_;8EdLDsBPnq\/g*JhCLqO7%16?^Bln0&HX(Z(G]\%L
HR!ug,BdX=F(oQ1,CY(d+A,EtI3;I,F`Lu'+@C'XAKY5_+C&MsDffl8FCfN-H=\4(F`M;FBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9Bkh^;>]+J#D..7%BmO?=
%13OO,p6]9D/E^!A9/l*DfQt/A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u
+DG_7ATDm,DJ()#+EDU@AISuOF(KH0ASu.&BR<uoDesQ5DKBB.I=!b]D1)j#>]XIuCh7KsFD-#+
@rH1+D/OE+E,p);AUSnZ/i@TiI16NgFE_Y5DesQ5D@Hp^$=%%OB5)71A8bt#D.RU,I16Mm$=%FV
CLqU%FDPLt$=%[]@VfUoAn,asFCf?3Et&I]Df0,rDesQ5D@Hp^$=%I[GApu'AISuOBl7m4FF/=[
C2[X$G%kN3/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X$DD$$BG^U#.%16?XATr*%B4VMZ
>\S(pF`_tVH>7A//p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X(FDl22/p(ZLI16Mm$=%I[
GApu'AISuOBl7m4FF/=[C2[X"@;BF,FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe+!4Bl#DD
AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA9;a.Ci_4NAU&V4$4R=g>]++sE+*Bj%14CdDf0,r
DesQ5D@Hq!>\S(pF`_tZ,CX9GDfp#J,CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*D0'8u
FD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4$=%Oj
Bl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*                                       ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0etO-1,'h++>G_r1,pC30H`/-+>Gbs1,^701a"P-+>GSn2E)a53?U(7+>GYp1c6C20d&>0+>G_r
1c-=00H`/-+>GYp1c-=03?U.;+>PYo1,^701a"S7+>GSn1-$I33?U+:+>Get1Gp:00H`,-+>t>s
2]sh3+>YoJ:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<r_:K(5"C2[X!Blmp,@<?'q
De*ZuFCfK$FCcS6Df^"CE,ol,ATMp2E`>h&:L?^i6psg<?Ys=gDe*Bs@j#VsEbf3(GA\O&:IIuX
:IIuc8l%i^D.I^+F`Lu'+D,P4+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:
@<6O%E\CBf6r./^:IHgPA5l>m:L@jTA8Gt%ATD4$ARB:bC2[X!Blmp,@<?''D..I#A8c[0+B2-)
:L\H\Ch.:!A8G[rAU%j!DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T0@
F_PZ&C2[X!Blmp,@<?'s@<?(*B4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+DPh*Ch\!&Eaa'$
+EMIDEarZ'9OUn3=CbuT@<HC.<HD_lCLqd4EHE=GF(KB-AU/>>AoD]4A7]@]F_l.BE,ol3ARfg)
-ua3AA7]@]F_l.KBPDO0DfU,<De)I96m,oKA8c?.BPDO0DfU+UFEhmMBl5&1@<--oDg-)6De*3n
G%kN3?Z]k(8l%htDg#]4G%kN3+A?3CAQU'rAS!!$@:O=r+=L]ABl%<pDe*ZmFCf\GC2[X!Blmp,
@<?'\F(KB-AU/?:F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A8Gt%ATD4$ALVA4
A8Gt%ATD4$ARBA!Bk;KqFCf]3De*ZuFCfK$FCcS5G%G];Bk;K29OUn3=DDbbE,o\nF(KB-AU/?:
F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A1;A(DJ<]oF*)/8A8kseD..<)D..<r
An?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-FDtYuD..<)D..<rAn?%*+D,P4+A,Et
6r-0M9gqfV+CSekDf0E#DJ<]oF*)/8A92[3Ear["@:O._DBNe)DJ<]oF*&O:DfQsm:IJ,W<Dl1Q
+CSekDf0N7C1Lmf@<HC.A7]@]F_l.QFCf<.CghEs+E2@>C1UmsE,o].De*U$A0>i3De`inF<GX9
FEMPKH?s=EA8PahDI7KsGYMU\DBMPI6m*n(H?s=EA8PahDD$$BGUXbO@<?(*+D,>(AH       ~>
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
Blmp,@<?'fD.FbuF_PZ&C2[X!@<?(*+C]J-Ch.:!A8Gt%ATD4$ASbdsAU#>.AS,@nCiiZuATDQt
H#k*ABleB7Ed;D<A0>W*A7'7uBk;KqFCf\>C2[X!Blmp,@<?'\F(KB-AU/>>C2[X!Blmp,@<?'f
Dg#i+G@,H'GT^a>A8lR(<HD_lCLqd4+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)
BkCptFD>`)F)Q2A@q?d%Eb],rAmoguF<GOCC2.Zt+F8?[C2[X"@;0UdFCf\E.4cl01*A>0,Vh&/
0JP:;2_HpH1bggI3A`EG+>PW+0JP=:0eP::3A`]P0ebO/1,(I;0ekCB/i>=C1GgmI3&if=1,(I;
0ekF@/i>FA1H70N3&3<51,(I;0ekCB/i>=C1GgmI3&if=1,(I;0ekF@/iGF<1,:O@2`EW;1,(I;
0ekCB/i>=C1GgmI3&if=1,(I;0ekCB/i>=B3&<9K3B8u?1,(I;0ekCB/i>=B1,gsG0d&5*1,(F;
1,ggB2)mTP2)I!F0d&5*1,(F;1,pmC2`EZL0KD*J1*A>+1,(F;1,pmC3&*3C2)[6K2'=Y.1,(F;
1,U[A0fCdE1H.*M2BXb/1,(F;1,ggC0eb==3&*3J3$9t11,(F;1,ggB3AiWN0ebOF3$9t11,(F;
1GCF<2`3HO2)R*B1a"P-1,(F;1,ggB2D?pA2Dm6K2BXb/1,(F<0JP1:1,^gB0fD$G0d&5*1,(F;
1,pmC2`NZS3&E?G1a"P-1,(F;1,ggB1GLmK0f:g21,(I;0etF;/i5793&`iR1,gs21,(I;0etF;
/i,LF2)?sI0ekL-1,(I;0ekFD/i5OI3ANHH2DR361,(I;0ekI</i>OF1,C[C3AEN:1,(I;0etF;
/i57?1GCLB2)dH:1,(I;0ekFB/i5OE0f1mN1b^^.1,(I;0etF;/i57B1cR<H0K1+00JY=:1,(I9
1bpsD2`WfR1c$700JY=:0etU=2)@'F3&<QS1,L+/0JY=:1,(I91bpsD2`WfR1c$700JY=:0etU=
2DHm@1,(RE2`;d60JY=:1,(I91bpsD2`WfR1c$700JY=:1,(I91bpsD3&3BJ3&r*:0JY=:1,(I9
1bpsD2`WiS3&Vm70JY=:0et[?1c76Q1Gq!C2DH=00JY=:0f(L92)d3H3AE6E1GL"-0JY=:0et^@
1cR3G0JtaE2DlU40JY=:0et[?1b^aC2)R?N2)QL30JY=:0et[?2)-d@0JG@?1*A>+1,(F;1,ggB
3Ar`K1cIEL0d&5*1,(F;1GCF<2`3KP1bgdB2]sk01,(F;1,ggB2D?pA2Dm6K2BXb/1,(F<0JY7;
2)m<L0JYF=1a"P-1,(F<0JY7;2)m<L0JY=B0d&5*1,(F;1,ggB1G^dA0JG@D2]sk01,(F<0JP1:
0JGIF3AWEL1*A>+1,(F<0JP193AriR0JP7;+>PW+0JP:<0J54@3Ai]R2_m*D+>PW+0JP:<0J54@
2DR'D2*!BO+>PW+0JP=:0eP::2D[$@3&NWR.4cl01*A@u1,(I;0ekFA/i>F@2)@'L2`EW;1,(I;
0etF;/i5@@1,C[>1cRE:1,(I;0etFC/i>RH0JPI?2E*E71,(I;0etFA/i5C@2*!WQ1c[<61,(I;
0etF;/i5@A1H@6K2)@!11,(I;0etFC/i>XH3&3BL1b^X5/1<V9+>kE"0JY=:0etU=2).!I1GUaG
2)ZR40JY=:0et^@1cI<H2E!HP3&i$90JY=:0et^@2)-pJ0fLpD3&Da50JY=:0etX>2*!NM3AE6H
3AM^40JY=:0et[?1c7*G3AWZP2)ZR40JY=:0etU=2).!L2`NNH1cQU50JY=:1,(F81bpsJ2_ZsB
3Ahp70JY=:0et^@2)@$I3&riS0JXb+0JY=:0et[?1c70J0K(gD3A_j60JY=:0et[?1c7*G3AWZP
2)Zm7-p07=1,(F;1,^aB1H7?N1cR0D2(LXB/hf1;0ekF<2)RBQ1H@0E1Fd)k1*A;#/1<V9+>PVr
1,(I;0ekCB/i>=C1Gh!J1c7'31,(I;0ekCB/i>=C1Gh$G0ekR/1,(I;0etF;/i5=C1bg^D2_[-4
1,(I;0etF;/i>RF3&`]O1c[Q=1,(I;0ekF;/i5:?0eb@=0Jah,0JY=:0f(L92)[<N0f_3Q1H?R5
0JY=:0etU=2D[*I0ebID3B/-:0JY=:0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1H@BL2D[0I3B83;
0JY=:0etU=1c.-N2_ZsF1,^710JY=:0etU=2DR-D1cIBK1bg+.0JY=:0et^@1cI0E2)m?M2)QL3
0JY=:1,(F81c.!I1H73N1-$I40JY=:0etX>2)[EN1bggD2E;m80JY=:0ekX?2)%$H1c-m@2)?@1
0JY=:0ekX?2)%$H1c-mD1,U100JY=:0ekX?2)%$H1c-mA2DcO30JY=:1,(U=1b^dB2D@$G3&Vm7
0JY=:0etX>2)I0F2E<NH0K1+00JY=:0etX>2D@$K1GUaC2`Mp80JY=:1,(I91bpsD3&3BG2)?@1
0JY=:1,(I91bpsD3&3KO0fU:20JY=:1,(I91c7!F2E*NS3&;[40JY=:1,(F82)dBP2`3EK3B83;
0JY=:0et^@1c[HN2E<KM2DH=00JY=:1,(L:2)d6M1,_$E3&_s80JY=:0et[?1H@EO2_ZpE0JXb+
0JY=:0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1bg^D0Jb[K3Ahp70JY=:0et^@2)$aE3B&lP3B83;
0JY=:0et[?1H@0M3&<KP1H$@20JY=:1,(L:1c[?L0JtdD2DZI20JY=:1,(I91c@9P1,CpI2'=Y.
1,(F<0JY7;1-%?N2`N]U1E\G,1,(F<0JY7;1,^jG3B/]K3?U(21,(F<0JY7;1,^jG3B/cP1E\G,
1,(F<0JY7;1,^jG3B/`N0d&5*1,(F<0K(O?0et^C2DR9O1E\G,1,(F;1,^aB1c7!G3AN9B2]sk0
1,(F;1,pmC3&rlV1cR3J1ast(4>838-p014/1<V7.4cl00I\P80E                      ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
