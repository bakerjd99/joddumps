NB. JOD dictionary dump: 25 Apr 2021 12:34:54
NB. Generated with JOD version; 1.0.22 - dev; 12; 19 Dec 2020 16:01:02
NB. J version: j902/j64avx/windows/release-b/commercial/www.jsoftware.com/2021-02-18T12:08:29/clang-10-0-0/SLEEF=1
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


DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC formifacetex grplit ifacesection ifc setjodliterate uwlatexfrwords wordlit'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22 - dev';12;'19 Dec 2020 16:01:04'

JODVMD=:'1.0.22 - dev';12;'19 Dec 2020 16:01:02'

OK0256=:'jod.pdf not installed - use pacman to install the addon general/joddocument'

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit setjodliterate wordlit'

WRAPPREFIXTEX=:'\RegionMarkerTok{)}\KeywordTok{=.}\RegionMarkerTok{)}\KeywordTok{=.}'

jodliterateVMD=:'0.9.98';6;'02 Dec 2020 10:59:45 MT'

jodliterate_hashdateurl=:<;._1 '|70d39e3f637fcc6d047d151ac3a5c53111669ae5ab332eb6039d9ae596a0fd52|02 Dec 2020 10:59:45 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

jodliterate_root=:'C:/jod/'

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
1,(L,1,'h,+>G_r1*A>,0JO\*0H`+n1,1aI+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>Gi01E\D4
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
1bf=E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqg1a#1t@j!N\1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f^@EARci<0JY=)0fD'H0fh!D$;+)^<)6:`;aOJU9LMEC
;cHOj=Y_iD$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqf3?V(8Fs&Oo1,'h)3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5
DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1*B>1Fs&Oo1,'h*0fh'F3\r](
$4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!E]P<t
0H_K+@<?'A+>Ghu:2b:u1,(I;+>GW40f(jG2[p*$$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.6J3]&T!$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp19+AQiu+>PW+
0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F1-.9P
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW+0H`))3]&QP0fTLI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2]tk6
Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN1,(I;+>GQ20f(jI1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t@j!N\1,'h)
3'&oP3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t1*@]-@<?'A+>Gl!6tKjN1,(I;+>Gc80JPUB1^[&T;cI+=De*ZuFCfK$FCd3^%15is/l5>B
<*sBYA8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?+=Jfo.6T^$$4R>`D/XQ=E-67F8Oc!576N[S-nlc)
+>>5R$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT6r-/m+<VdL+AP6U+D,b4C`m\*DIdZq+E1b2
BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sBmDfT]/Amo1\FCf\>+<Ve%67sBm
DfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA9/1e:-pQUB6%s-
BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g+k?@:NkiARfgrDf-[?
+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQUBkCit+<VdL+<VdL+<VdL
:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sC%ATV[*A8Gt%ATD4$AKW*j67sC"
Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?FCfM9E,oMuD.7<m
%15is/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEs
G\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sC)DfTB)BlkI?+<VdL+<Ve%67sBt@;BEsCghEs
GT^U=Df$V@DfTA2Ch[s4+=MLa%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R@;9^k
Ch\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$?U<6/e&._67sC'F(HJ&DL!@D@;]Uo@j#i(F<G:8+EV:.
+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAISu\AhG3MAU%QjC2[Wi+?V#J;FO&D;GoqO:dIiE
:IAK'C2[Wi-Qlr</g++a8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+Abs)7R^3Q779s<:..lF?YO7n
A7$HjDIb@/$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^@;^7"E]l#t4"u"(4?G0&1*C[TAfrLCBOu!r
+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-WEcYr5DC6kU/M8/5;BTLg/e&.1+EMC<F`_SF
F<Dr+:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAJtF`MM6DKI"EATDj+Df-[G-S04FDK]T3/12kh
BlbD7Dfd*c4WlL43A*$=0ddD;ASu$2%16TRFCSu:%144#F)>i<FDuAE+=BTU;GU1O+E1b,A8bs#
DJsV>F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?RH9iASu$2%14Nn$<0eh:L?^i
6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0De*L$@;omo@rj;FDe*cnC2[W8E,K;;+CIf;
6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CIf;6psg<?nMlq
<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F))3l
@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5FE9&D$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U
?p%e-C3j]8B/44F@V0%m@rlNsFYR_e1cRF;?Tqj?6Z6j`Bk1dq+DG\3Ec6,8DJ()(Df0Y>G@bK$
BQS;<Bl5&4EbTE5ARlooDe!p,ASuU2/g+,,AKYT'DKI"DF(Jkk$6UH6AoD]4F)Q2A@q?cmDe*E%
@rHL+A0>>m+CQC/BlnH5AKYH#Ch.*t+>"^IF)Y]#BjkgoGp%3BAKYK$Ci=?*A0>u*G]\!Z%13OO
1+j\W4C;WEBQA-62fW;?1bs,eCc?EVGWBJYB4<i-5%#L(@<-4'DJ=E.+Cf>#AKYK$Ci=?8+CT.u
+D,P0FE8R5@rcL/F!+k,F*)54F*),6B6.H'@;]Tu?uTOlA8bsc+EMgGFCBD:@rH1%EbTE(/e&.1
+<X$oEcP`/FDQ4FFD,6,AKYr#@r#LcATJu:F(HJ)BkCsgEb0-1+D,P0FE8R5DIal"Des?4F"Rn/
%14mD+CI<=2KCK3D)lKRBR2FN@5g&cFEi%DEc#9!EF1n;+AucoBk;K2BQ&);FDi:6F_kl>+D#D!
ARlolCht57AS,LoASu!hA0>K&DKKqBBl5&4EbTE5+AbHqF"Rn/%14pE+CI<=@qB4/H8%0lFD!OP
D)cAl@q]g?0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^F`8IHATDj+Df0VF
+EVNE8l%iC:I?`D$4R>"/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%
A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%ht
FCfN8F"Rn/%16KIASu$1FDk].?!n*K<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4D]ik1F*(\9FDk].
?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5@;]TuBlnD=F*1r%
CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'
+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/Ch4`2D]j(3G%kN3
+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21@<<VA@:OD%@;Kb*
+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..NtEbSruBmO>C%13OO
?s@)OB5)68FDk].?!n*K%14gB+CI<=@l.k03H-]qEGR=J13dJRCc68nEbTi1B4!i1+B2onF<G+.
Eb/a&+Co%qBl7X,Bl@l:F!,16E+*6u+E)-?8l%i-+B3#c+Dtb7+Co2,ARfg)A7]@eDJ=3,Df-\0
@:O"fBlnVCBl5%c+DG_8Ec5K2@qB^(@3BH!G9CF1B6%F"BHU]0HXIt(I=5KGA7]RkD/"*'A0>`#
@;^-/De:,&AS,XoBl7Q+Bl7a$DIjr.Dfor=/0K+IEaj)@+CSf(ATD7$+CT.u+Cf>-C3=E(FD5Z2
F"SS0@;BEsF*2M7+A,Et+Ceht+D>2$A8Gg"@;Ka&FD,6,AKYl%G9CL9Ec#kM%13OO1+j\W4C9dV
AS$.'H=]!FFu2.$Bl.j93-&qQ2.L?-5%#L3Bl.R#@<-10+DkP&AKZ&:Eb-A$C2[X!Blmp,@<?'g
+EqaECNCV1DfQt2Bl[cpFD5Z2+Co%qBl7X,Bl@m1/0K"FANCqV>@:E+6r.0)De*ZuFCfK$FCd(A
A7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$
FCd+):IIucC2[X!Blmp,@<?'5D.G(J%13OO1G0eX4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?
5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEs
EZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdkARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO1bKnY
4C;T0AMncf1i.8H2fW[oD)c$=E&TInC3DIA5%#L#Df0W1A7]d(@:Wn_DJ()"@:FCf+=LZ7C`m1q
@r$4++Eh=:F(oQ1F"&5RD]iF[:IK;CDesK&/g+,,BlbD?ATD6&BlbD9Ec6,8DJ()5D]i_%DIe#8
BlkJ=BQ&$0A0>>m+E1b0F<GL6+EV:.+EMX5DId0rA0>r)FEMOT%13OO2(g"Z4C:!^Anl6nE->\K
Bkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CT5.ASu$mGT_*H+CJr&A1hh3
Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D$4R>#/g+Oa?T'TS2JR#JEGIQkBPB83
FYS2f@rc'oD),H^?m&E^AKYB'FD5Q4?m'W(Eag/!AnQ-l+=Li9DIal&Ec6)>+EDC=FE8lRA8c%#
+Du+>+CT5.ARTU%FDi:8@;]UlAKXSfDIIBnF!,[@FD)e>DId=!F(9-/ATJu%?XP!qEc5o.Ebp"R
+A$HoATMs-B45mn+CT.u+D,>4/g*nb<(/hj?tO%l?m'0)+Du+>+CQC3@<-H4De:+a:IH=7F`\a?
F!,X;Ed8d@@;]V$+EqL1DBNG0ART[pDJ()#DIal,@;0V$@;0UnDJ((A@r,RpF!,+9Dfp#?.P;/;
%15$H+CI<=@rjGJA8O;GDDs:]Cj9N3@qKO21iIOpBO<r2+@C'bF(o/rEZee$A8,po+CT.1@;p0s
DIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+ED%*ATD@"@qB^(Bl8!+A7ZloBl[cpF<G+*
Anc-sFD5Z2F!+n3AKYYpDIdQpA1e;u%16KIASu$1FDk].?!n*K<)5nX?YXLiCh\!&Eaa'$?Ys=/
2[p*;>AA(e+Dbb6ATD4$AKYf'Df/i/Bl7EsF`V88DK@IGDe*ZuFCfK$FCf9&Df0B*FED>1/oY]@
.:?n/A8Gt%ATD4$ARHW[:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/r
Eb/c(@q]:gB4Z-,AoD]4?tsUjCh\!&Eaa'$?nMlq%16KXDe*ZuFCfK$FCei&BlbD*+BqGk8l%i\
-tm^EE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0.A#RCghC+
+D5_5F`8IFBOQ!*E,ol?Bk1dr%16<UBlmp,@<?''E,ol0Ea`g%Bl7Qh-tm^EE&oX*Ch\!&Eaa'$
E,ol0Ea`g%Bl7Q9@rH3;Bl7HmGV3ZOD/:XDF*2G@DfTq/$>+3s+A*bdDe*E%F*)>@ARlotDBMPI
6m-#S@ruF'DIIR"ATKI5$4R>ABPDN1A8bt#D.RU,+EVX4@r$-.E+NotBl7Q+@;]Tu@rH7+Bk1dq
ARlonBOPdkATJu+DfQt.C2[X!Blmp,@<?'g/e&.eBOr;q@<6!&1H$@c@<6!&Bl8!'DKBN6Bm+&1
7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*BN8TZ(tDJ=*5AScW$
$>a-[AScE1ART(^+EV%5CER&'A0>_tCLqQ0BlkJ:Df]u6@VfTu@rH4'Bl%?'A7]jkBl%?k+Cf(n
DJ*N'BPDO0DfTQ'Et&IcGp%3LDes6(DJ()1G%G\:FD,5.G%G]8Bl@l3BPDO0DfU+GDe:,6BPDN1
Anc'm/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa?T!*dCgo87G%kT4H8g(lFETEK0Qf0*0Jd'"
?m&?YG%l#/+CT.u+EV19F<G16EZen,Eb/a&+Co%qBl7X,Bl@lA+A*b:/hf%'Bl8$5De+!#ARloo
Bl[cpF<G+*Anc-sFD5Z2Et&I!+<Yc>@<<W#Eb-A(ASc'tBlmos+C]U=@!d6.+CKVG?nNR$BOr;s
BkMHpE+j;8@<,p%@;[3!G[k<(FD5Z2+EVNE8geZh$6UH6Bl7O!ARfgrDf-\=@q]FjAKYE!A0?)1
Cht57BlJ$-AKZ).Ec6)5BHU`"C`l=m@rGmh+E1b0F(oN)+EVO?Ci^_5DI[L*A8,po%144#+CJr&
A8Gt%ATD4$ARI,"$4R=t/g+Oa?T0caB6/&LFYnAf1LY-;F_NQf@q9.ZH?<LX?m&$YG%G`:BkLjr
AKZ21Gp%6IA7]dj@<*K#BOPpi@ru:&F!)T5?XP!jDBMPI6m-,_Dfp"ADIIBnF!+q4ART?s9OUn3
=<MR'De!@"F(oN)/g*W%EZf7<G9CXCF*%iu+<Ve;Df-qE+E_a:+E_R4ATD6gEZek*@<,ddFCfK6
+DG^9B6%p5E$0%,D.Rc@%13OO1G0eX4C:!gC1DL&1GCe0ChPU`12UH;EHYnP@5q\&5%#L#Df'?&
DKKqBGA2/4Dfp.EGA(]4ATMg!@q@26AM.UJ+CIr2/oGSMF)YPtAKYPtBODs"@<iu5Dfd+3Des?4
+E2@>E+O'+GqL4>F(KA7?qs$@+EML1@q?d%Ch7$rARI,"$4R>!/g+Oa?Xbm6G@Pc1G%>kTGBJ1S
FD,l62)I+$@r,L9?m&BnDKK<3+Cf>+DfTQ0B-;,)+Eqj7E,]B!+C]86ARlosATVL(DeEX!Dfp+D
@<-BsH#k*F@<iu5Dfd+2AKYK$EcP`$F=n"0+<VeUIXV_5+<VdL+<W%OF`2A5A0>r8EbTE(-QkJn
-pJh00H`,),V^u,.3L\p4$"a/F`2A5A0>r8EbTE(F!,[@FD)e7F_t]1Bk)33%144#+F\cg%13OO
2(g"Z4C;o<0l:h`2K^cqFYd`K1i7Cp0ktWN@Wl*B?m&B^D/!fpEbp"P+Eqj7E,]N/B-;)1DJjB8
DK?qEBln#2Ci=3(+D#D!ARo=_A0>l7DffQ$+EMXFBl7R)+DkP4+Du+>+Cf>+DfQt>Ec5o.Ebp"^
%144#+F\cg%144#+<VdL:-pQU8Q.rN/MT%(@q]F`CNFW8%144#+<VdL+<Ve63%uI\>TdQkF)W6L
Be_DRA1%fn+<VdL+<YAQ1LjrY3[ZUA3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I
1,1IC3&``Q1c$mA0F\@3+<VdL+?;D?2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA
0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0F\@3+<VdL+?;D?2Dm<I1,1IC
3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC
3&``Q1c$mA0F\@3+<VdL+?;D?2Dm<=+F>5[+>Fup+>Fup+>Fup+>Fup+>Fup+>Fup+=f)f/h.tk
0JP==1c70M3&r?/BeCN6%144#+F\cg%144#+AP^3762PbDf021Ch[cuF!+n3AKZ2;@;p0sA0>>m
AoD^$+D5V,DJ()6D]j"-DIdZq/g+,,BlbD,@;[3(ART*lFDi:@@;]Uo@grbf+<Y*6F(o9)Bl7Q+
Bl7?h@s)g#FCcS:Deip%F!,R<@<<W%@;]t$F<G%(+=^r2F(oH9.Ni\=FCSuqA0>;mFCfK:@<,n"
/g*VtGRY!&+<Yc>ATME*Bl7O'AT;j(DKI">@VTIaFE8RKBln#2D..=)@;I&[@8pf?+D#(tFE9Jc
F(Jo*@!-[0@<?(*Ao`*6Eb'6!/e&-s$=I(LDIb>@De*cl?k!HPF_PZ&C2[X!@<?(*1,2Nj/h1=Q
Bl%<pDe*ZmFCf\>F"Jsd+D58'ATD4$ATJu8H#@_4GT^[6B4u*qB4uBuA0=K?6m-PhF`Lu'+A?3C
AQUPo$;No?%15is/g*VtCh7Z1@<,p%GB.D>FCf>4FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#
D.RU,+Co2,ARfh#Ed98H$;No?%15is/g+SDF*2>2F#kFRF`MM6DKI"EATDj+Df0V=De:,2@;]Uo
@j!1=@;]Uo@j!NZ3A*$=0d(CT+DbJ.ATB4/$;No?+<VdL+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO
:..lF.1HVZ67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=Je
E,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PWf@<jO^+ED%:Bldir
+=MP^H>7A/D..-r?Z]k(.1HVZ67sB90Pt6D0esk"H?smPDe*]nBl5P4@<<q@@:Wn[A.8l@67sB9
0Pt6D0f'q#0Onp1@;^0uGV!<4F=A>@A7T7^%15is/g)o'D..]E3$;aGF)Yr(Gp$R=Bl%<&@UX@$
AoD^,@<?U&A0>u4+EDUB%15is/g)o'DJs\R2'?=<A7]9o-u*[2?Z1+%ATqL'AU#X5$4R>PDe!p1
Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tDC2[X!
@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*3B9)I%16T`
Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQUAn?'oBHSF,F_PZ&
+E_d?Ch\!&F!+n/A0=K?6m-2]FCfK)@:NjkCh[s4Et&IuD/a<0@j#DqF<EY+-ZWd,A0?):Blmo/
@V'.iEb0<6EZek*@;]^hF*)FF8l%iU9gg*qH:gt$Bl8$(Eb8`iAQ)Po:..BG6m,'I8l%isDf9H5
;cH%X6pX^=+A$lO:IK>IBl8$(Eb8`iAQ)Po:..BG6miEN%15is/g+YHEcP`/F<GOFF<G+.@ruF'
DIIR2+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp">9IHp@QcapHTHL+6r60K87,_&
<*s!):IK,1C(1Lt8oJB\+@Ih)6=FY@E[MuNATV[*A8Gt%ATD4$AKYN%@grbS$?C''FED)=4ZX]5
H?smPDe*]nBl5:-$4R>;67sB.H?slb+DkP&ATJu9BPDN1Anc:,F<GL>+ED%:ATDj'+Co2,ARfh#
Ed8d>Bl%?'DIIBn+EMIAFE7lu-ZW]>FCf\E4ZX][5snOG?X[\fA7$HlATT&8Df9`>AU#aR?Z]k(
-OgE)AU$@!+?Op2/9GHJ%172gGWe)1-mpYmIXWMbATDj+Df-eKINpKn/3>P48l%iU9ggEQ@q]:g
B4Z.+EZfI8GRY!.FDjboFCf\G+Eqj?FCcS*Ddt>=Df9`>AU#aR/p(ZL-OgCl$;No?+D,2,@q[!'
G%G];Bk;K2CghEsGT^F4A0>AuARTU%Bl8$(Eb8`iAKZ)+G]XB%-ZW]>Dg$56GUGX8+AG-h;GUY.
C2[Wi+D58-+=CoBA7'7uBk;KqFCf\E%16f]@:Nkj@:q_a+=B9%.su)MA8,Xa@qC$>/NtNk$?(*0
AU$@!+=Lr9@:Nkj@:p]lAS,k$ATMs6+?Op2/8o]RAU#XTBkCd`ATV?n%13OO:-pQU@;p0sDIal"
F`MM6DKI"8DKKH1Amo1\+EM+(FD5Z2%16i^@:Nk33Zp(:INX(l8U=!)6tpO\ATDBk@qAS<5u'g6
;FE'-H:gt$FDl)6F&Q%(:..BG6nCoU8l%itFD5W7ATDBk@qAS<5u'g6;FCs$Dg$56GWe)1Dg$56
GUt6u,>:QU/1>+KEc#N&@:NkjAU#>4Amo1\.4d5!9L]Hu.!0B"+E)FFAU#XHGB.D>AKYN%@k9!R
H>7A/Dg#i+G:muKGUEq-%15is/g*b^6m,uU@<6L$Et&Ik@r+:h+?MV3C2[X$DBN\4A0>W*A92j2
Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^s5$>ag/4ZX]uEc6)>CghEsGU>%,+DPD&
%13OO:-pQUF(KG9Bl8$(Eb8`iAKYZ3E+O'1AS*',@<-!lFE7luCijnb3Zr0L@:NjqF(KH-Amo1\
FCB3&F!`M'+Dc.E%13OO:-pQUF`V+:-[L(d+E2@4AncK4FDi:1G&M)*+Cf4rF(f-++EqOABHS[;
De(4</hSefDe!p,ASuT4Anc'mEt&IuAU%g$Ch7ZN3Zoh5A8bs,+=nil4s279-[L(d.3L/g/j:Cm
@r*8=-8%J)4=;b'AU#RF%16onGT_3NBlmo5/j:D"AU%g$Ch7Ys$4R>;67sBnEc6)>+C]J-Ch+Yt
@<?!m+EM%5BlJ/:/Kek<FCf\>F`_>6F!,R<@<<W%Df'H-Ch4`%ASu("@<?'k+D,>(ATJ:fC2@@%
Bl%=%AU$?j+=JTjINs;SEc6)>INs:p-S0:VDfg)4GUXbFBOPdkATMs6+A,<o<CokP<(0mu$7L"7
85E/`+DP_%F_PZ&FCf\G+Eqj?FCcS0CgqO$Ch.!`F?M6!A8bs/Ec5l<FCf\J-SAk:F=.M)F)>i<
FDuAE+=D5DASc0*-RU8m-tHe,F`2A5F`AO=CgqO$Ch.!`F=Aag-RU8a:-pQU:ddbq@rH4'Bl%?'
@UX?f$4R>;67sBo@;]V$+C\c$@q[!+@rc:&F<G[=@<<W4ASl@/ATJu9AU#kE@<?(*+EV13E$/b,
Ch7Ys$7Bk(+Du@E-TsL59gM-E:L@OFDe*2tB4Z0--Y$t(@;^0uG[FogF=.M).!0Au:K(484*s">
DK^+N+Eqj?FCcS*Ddt=G0JI!QARTIuAU#h:@<<k+$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDC2[X!@<?(*3B9*,@WcC$A86$nCh\!&Eaa'$CghEsGVV!K67s`sF_PZ&C2[X!
Blmp,@<?'s@<?(*+EK+d+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARlouDe*ZuFCfK$FCcS9
Dfp)1AKXZT<+T/a%15is/e&._67sBMBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@lt
Ed9$R+CoD#F_t]-F<G+.Eb/a&DfU+U%15is/e&._67sBhF)uJ@ATKmT@s)g4ASuT4G%G]8Bl@m1
+E(j7E+*WpDdsn<E+*WpDdsnF/ibO=/hnJeEZf1,FCfJA%15is/g)8Z+<VdL+<Ve:BOt[h+Du+?
DBL?,84c`V5u'gD6R`HO:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG
@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE1,(I;D..]E0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g)o'D..]E1*CXODg*=BDJXS@-u*[2Ch\!&Eaa'$/n/72.1HVZ67sB9
0Pt6D0fU:dBle60@<iu)F_PZ&+C\c$+D,P4D..O.ARlp*D]j(CD@Hp^$=e!aF`MM6DKI!K@UX=h
-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A8G[rAU$3q3F<ml
3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(A8G[rAU$3q3@>7C@rH(!F(KB6+<W%G
C2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%15is/g+YHEcP`/F<GOFF<G+.@ruF'DIIR2
+CoD#F_t]-F<G+.Eb/a&DfU+4$=n'b4ZX]R:IAJrA8bp">9IHp@QcapHTHL+6r60K87,_&<*s!)
:IK,1C(1Lt8oJB\+@Ih)6=FY@E[MuNATV[*A8Gt%ATD4$AKYN%@grbS$>4BuDIIBn4ZX]5C2[X!
Blmp,@<?'.%13OO:-pQUB4YslEaa'$+D5_5F`8I>@<?(*%16idB4YsD3Zr'UE,961+D5_6DIIBn
%14J'@k]$?CiXH4F<G=7FD5i5AKY`(Dg#i+G9CX:@rGmh+DP_%F_PZ&@UX@+4ZX^#ChI<s%13OO
:-pQUBOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>D/^V0Bl%@%%14J'
@kf*DG'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](@UX@+%14M*Db*Z&<$48L3\5/lF=A>V
EbTW,+CoD#/13,*@r,^bDKKH7/n/72-OgCl$;No?+DtV)ASbq!F!,X;EafIb-o2u,+>>5eEapdG
.P;ia@keE"BkAt?0eGG3+CoCC%144#F)>i<FDuAE+=D5DASc0*-RU8m-tHe,F`2A5F`AO=CgqO$
Ch.!`F=Aag-RU8a:-pQU:ddbq@rH4'Bl%?'@UX?f$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;E>q5
ASu("@<?4$B-9lV<+T/S/Nt:)4(iSQDIIBn%16ZaA1euI%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDC2[X!@<?(*3B9*,A7]@]F_l/"F(KB-AU/>P2,6Ij+E_a:Ebf63
F"Us7B+52C67r]S:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr
010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s4
06))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.
Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&C
F_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4
G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?
+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS
67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/hAooOm2^/\<%15is/g*\rDK:"MF!)Z9F`_^WF_>N9
+s8lu0JXbpDfTW%Ec6)<A9/1e:-pQU3?^F=3?T_).3Mh;3?^F=2]sJY@WHU/+=&W`>9GpL3\i]<
-mp,g+=JEp+?:T+1,pX/.3L/a-Rg0B+?:T+1,g='-RU#f+=JW_INViU+?hh/-RU8h-9We#3?^F=
2CBk$+=nW_-RU8N$;No?+?:T+1-&Vp><*if1,gRk@WHU/,VWF_+Z_A=>ph0O,!%_-3\iZ?0I\P#
><*if1,gR3EHQ2AAKWuV3\iT=0F\?u$:Zd40fr9ED..3k+@C9lEb0-14"!cp9i)sQASkjkAKYK*
EcP`/F=.M)6Zd?b.n29U0fr<FF<EqnEcP`/F?:jF8PN#(F(KG9@s)g4ASuT;%15IEEbm7)BPD(#
.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("
@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V
0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp+B!?"4#nHF1-&Vp><*if1,gRk@WHU/,VWF_
+Z_A=>ph0O,!%_-3\iZ?0I\P#><*if1,gR3EHQ2AAKWuV3\iT=0F\@Y2ENWT<+U,m+B*,qCLoRT
:.\/V+EMC<CLnW1ATMr@%16$IBkDH;7Q*=_4&fd4F<EnYF(o,G-Vd6-:`s4UF(o,,FCfN8-YR48
FDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen51*A.k.!KBE.1HUn$6Uf@+CJVeG$l_,Cht5'@:O(qE$0=8
EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+
0H_c0D..a/DBMOo:L\'M@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!5$4R=b.NfjAC2[X!Blmp,
@<?'g+E1b,A8bs29OUn3=<M']F(Jl)A8bt#D.RU,@<?4%DBO%>DepP=E+EC!ARm>7F(JoD%13OO
+<VdL>?,`YDJ(),De*ZuFCfK$FCe`+BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1.1HUn$6Uf@+AQKl
+@0jQH>d[DE,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums+@KpRFD5Z2@<-WB>A/,#E-"&n
06_Va/n&U*H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3
De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D+EM[EE,Tc=%144#+<X9P
6m-#OG%GK.E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+
Ch[d&+D,%rCi^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL
2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?k!GP$6pc?+>GK&/hnJ#+AH9b
@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!5$4R=b.Ni,6De*@#@V%0+@rG`t
@;]Tu?tsUj@s)6l/oY]@?t!SVARmD&$6UH6+:SZ#+<VeJAS!nF?tsXhFD)dEIP5,?A8c@,05"j6
ATD3q05>E905>E9A8bs*?k!GP$6UH6+B<JoAp%o4AoD]4F(KH8Bl7Q+:K&BM@rH7++EV:*F<G%5
@;]Tu8l%htA8-'q@ruX0Bk;?<%13OO+=\KV.!&sA@WcC$A7TCpF"&5KDe*QoBk:ftFDi:3Eb/[$
AKYDtC`mh5AKYMtEb/a&DfTQ'Et&I!+<VeIAT;j,Eb/c(@X0)<BOr<'@:O=r+=L]ABl%<pDe*Bm
F*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt%144#+<Y`:FED57B-;>9+Dtb7+DkOsBPD?qF!,(5
EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRE$4R=b.NfjA@:WnbDdd0t@rc:&F>7/GDJs_ABl8!7Eb0;7
F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'oFa+<VdLBOQ'q+CHg9C3*c*AU&<.
DKBN1DK@EQ%13OO,9nEU0eP.40H_qi6tKk>D.7's+?:tq1,(FC+=K]j@<?X4AKX?YD/a<&FCcRm
ASbpdF(Hd0$4R=b.Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg+BN9!BHVD1BlbD*
A7TCrBl@l3@;K`h$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8F!+n3AKYK$D/a<&FCd'I7WNEa+Du+A
+E)-?8l%ha$6UH6+Cf(nDJ*O%+EqO9C`m5+DKBN5F<GL6+C]J++D,>4ATJu&DIal.E-,f2BmO30
Bl@m1/e&.1+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/e&-s$6Uf@>@:oQATV<&8p,)uFCfJ8
9OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]Rr
CND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?%13OO+=\LTDf'&.D.-ppDf[%0DIal3
ATMs7+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI5$4R=b.NiV?G9C:&B4Z0m+EV19
F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI5$4R=e,9n<b/ibOE3B836+@1-_F`VXI
1-$m.1,(FC%13OO+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8FCB33F`8I8@;0P#Eb-A*DfQsm+?;&.
0d'q:FC?b7+CT.u+C\o-Df0)<%13OO+=\LA9gMlV5tsdU+DG_'Eb/[#ARlp*D]gbi3$;gRDf$UT
0J4JIBPDN1E+*cqD.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'F_qQp+<VdLCh7KsFD)e8Afth2DIIBn
F!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['ATT&:D[d$r+<VeM@;L'tF!+q'
FE_;-DBLYV@;]Tu1,UpA%13OO+=\KV?ug*l/0J>@FECn5@:X+qF*(u(+EVNEF*2G@DfTqB@q]:g
B4Z-,FDi:00fU=;1ghpF$4R=e,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1
ALDOA6t(?i%13OO+=\LAEd2Y5+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\L<?ugL5
?m&'aE-ZP:EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG
C2[X#DffQ"Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL0L^5*Eb0<5Bl@m1/no9MDIP%($4R=b
.Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a:IH=A@:F:#F(JoD%144#+BqH66m-;S@N]Q,
FCep"DejE"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8Z=-
AR]RrCNCp6$4R=e,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6Uf@?u9dt?m'0#E,9*&
ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@?tFFf+CSeqF`VY9A0>u4+E_a:+CJbkBlm]sBQINg
+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,@;]^h
F!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha9LW>3F(KG9Bl5&$E,ol/Bl%?5Bkh]s+>"^YF(Js+
C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1iDKB`4AM.P=ARHWlA8-.(E\7e.%144-+CIf?:JP:K
+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%htD.-pp
D[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<ATKIH<+ohc@rGmh+DGm>@3BAp@V'@.+A$Z&F!,UH
AS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:EeaF!+n4+CIf?6W-KP<+$hjAU&;>BlbD.G\(B-FCeu*
GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0%14=),9SZm0J5@G2'=In9jr;i1,pg-1,(FB+=Krq
D/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSekARlok9hAGU6r-iP;ICVbDfoq?FDi:0DIIBn@psJ#
?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B.aW#%144-+D,>.F*&Ns:IH=GASbpdF(HJ9
D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^EE-"&n05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1
A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB+=M>CF*&OCAfs]e
De=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ@<Q@'F`JUCAftJlE-#T4+=C&_:K0eZ9LM<I-T`])
6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtBD]j.8BlbD;ASbpdF(HJ7ASbdsBm+&1Ec5l<+D,P.
A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3BOu'(@:Wn[A0>u4+EV:.+CK8#EbTK7F!)iR-X\'5
BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa
#ukJ<Ao^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iAF(96)E-*a4AQWPb=)`D$CbBF:
Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>+D#e:
@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<
AQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7LBkh\u$4."J$6UH6<+oue+Cf>-AoD^,F!,RC+D>\;
+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/+<VdL+<VdL%13CJE,9H7+<VeU@:WneDK@IDEa`p#
Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4E,]`9F<G16EZdss2D-[<+D#G$ARlolDIakuCht5;
ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og$6UH6DJs_ADf-\6BkCp!F*2G@DfTqP%13OO+=\LA
DIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=/e&.1
%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:@WNZ.Bkq9&FD,B0+:SZ#+<VdL
+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqP#mh%J+<VdL+<VdLD/"6+A4^ZL
Bl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hW$6UH6
+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6+<VdL+=Ra,#mh%J+=\L"+Dtb7+DtV)AKYE!@;L41
BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc@<?Qu+EVN2$6UH6Dg#]4EbT&q
+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!/$6UH6
BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=LDfTB0/e&.1+<V+#+<VdL+<VdL:-pQUDg#]4EbT&q
+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#
FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL+Co@Q/g)Q)?S[$^Bm;'L/1)u5+@K1-8Q\>T%144#
+<VdL+<W(CDCI_0+Cno&%13CJ%144#+B3#c+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<
F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$D/Ej%FE7lu+<Ve?@<Q3)@V'+g+CSekARlp*D]hYJ
6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP#mh%J+<VdL+<VdL+<V+#,9nEU0J5@<3B8c9/KdMo
@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"A867.FCeu*FDi:2ATW$*EZfFGE,]`9F<G.*Bln',
B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$C1D1"F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUj
F`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu
+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB
6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n+<VdL+<VdL:-pQU;,f2@85gX@
Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&EZccF@rH7+Deru9AU%c8
%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.
E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@+CJr&A1hh3Amca(E+EC!ARmD&$4R=e,9n<b/ibOE
3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1@q@(u$4R=b.Ni,1FC65"A867.FCeu*FDi:CF`;;<
Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*G]Y'GDg)Wt+<VeFE+Np.+DG^9?u]pqA7]-kARoLs
DfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCetl$6UH6FDi:CF`;;<Ec`FGBPDN1An>Cm
F`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.Bl5&5C2%3i%144#+<VdL+<Y6++=DAOEb'&rD.P((
$6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%$6Uf@?uKR`+ED%%A867.FCeu*
/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065Bl[cm%144#+<YN0Gp%!CF<G".
G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT?1+<VdL+<VdL:-pQU8l%ht
Eb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6+<VdL+AP6U+ED%5F_Pl-+=Cf5
DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE+E(d5-RT?1+<VdL+<VdLEb/lo
+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL+>,9!/e&-s$6pc?+>>E./ibmK
+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IGBl.g*ASl!rFCeuD
+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NfjOATo8=ATMr9F(96)E--.D@:Wn[A0>u4
+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k
+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"
DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'
BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)
@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL
/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o
+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3
D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=
+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe
$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s
$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3
/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S
@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$
A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&
/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\
EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qD
D_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?
@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p3
0KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@
DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-
I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF-
-qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF
?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*
+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%p
CLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6
FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6
DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2
%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG
/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[
+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1
%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.
DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD
.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk
+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL
+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN
8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5f
DBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7
ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30
AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0
%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:
$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-
ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6
ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/
@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL
+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b
+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U
<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>
D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!
F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/
A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$
ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3
Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$
A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i
:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#
+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$
F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%
67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/
:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D
@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P((
$4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB0
3ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;
?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2
AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4
A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?
+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo
+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:g
B4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b
@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<
BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4
Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"
Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgL
FCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$
AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]Y
F@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)
Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).
Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%
De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b
.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3
A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]
BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5
DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/
?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL
+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>
%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/
%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er
+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&s
G%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL
<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-
AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m
$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!
+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;
FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq
+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiA
ATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%
BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohc
F)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!
A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6
+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*
%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0r
A.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5
De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL
+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL
+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+
A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5
AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!
@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+
/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h
+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV
-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1
GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!
BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5
F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(
+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1
AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;
BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&
@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_
?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''
-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+
$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.
Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)
AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:
DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8
DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/
A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*
+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm
3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_
+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$
FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<
Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<
De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&
E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=
@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<
F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h
/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q
%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9
@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/
G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=
@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(
D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B
?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3
E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e
+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)
E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9
+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7
?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%
EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%
EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.
;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@
ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG
<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+
CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)
+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m
@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LA
C2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1
/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]
BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL
+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg
+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'
F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMt
Eb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7
CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol
+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1
F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<
025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&
An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b
/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl
/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4
@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.
0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0
+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,
Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB
9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3
A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od
@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/
Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#
+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$
$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;
G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,Oq
Bl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOC
De+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1
+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!
$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,
ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(
GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8
G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!
B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#
F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5
AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o
+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=
+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+
F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<
+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd
+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2
Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.
+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ
@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8
ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;
7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG
0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-
%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-
+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a
+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/
F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et
+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#
+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82
BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-
+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#
+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(
@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'
+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)
Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-o
A0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*
E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u
+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSek
Df-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/
AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu
+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3
DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_
6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*
Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP
2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7
+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63(
$6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;
Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ
@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(
+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&
De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.
@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#
.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@
AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8
+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"
A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,
/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'
@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#
Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b
/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e
$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(t
FD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(t
FE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&
1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#
D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8
E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO
+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@
D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08
/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-
F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17
+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b
.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o
+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'
Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#
%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4
+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL
+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5
DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-
F*)>@H"q8./nf?DC^g_dDe*3nG%kN3?Z]k(1,:-u@WH0oAfu#8ATDs.ATo88Afu2/AKXT@6m-Pr
F*(u1/g(T1,p7DFBl%?'@<6L.@qf@nARlp-Bln#2FD,5.8l%htB6%p5E$079BlbD8G%G];Bk;K2
%14C(@;p1%Bk;?.FDi:DBOr;tDKKT5AKXT@6m-PrF*(u1+EM+*+EV:.+DkOsEc3'K@WcC$A86$n
CghEsGUX(/%16?]ARfgrDf0no:IH=$G%G];Bk;L:%13OO8l%ht-qYUX@VTIaF<Etc@ruF'DIIR2
.3N>G+CQBtBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;
C2[X2HV,DhA7TUrI4bs9%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);
D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W`EHW4Zi+A,Et+AcKZAUQ0R%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8H@$6WSkDfT]'Cia<:
AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,
F*(u605>E9/oY?5I="q,AKXT@6m->TDKTB(+C'#"G]\%LHYRJ0/oY?5I=3^W$6WSp@rc:&FE;/B
AISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9
/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m98l%ht<HD_l
+A$HmATDBk@q?caDfTB0I16Mm$<(k[AKYo'+EV:.+DG_8ATDBk@q?d,DfTB0+Dbb5FCeu*BOu3q
+CT;%+Du+>+CoD#F_t]-FCeu*Bl5&8BOr;kBQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I="R^6m->TDKTB(I4cWO$:n`R/0K"QEbTE,Ch[d"
+EMIDEarZ'@rGmh+EqOABHU\jF`(`.@s)X"DKKH#+D,1nFEMV8F!i=X@;]Tu?slE3F*(u6+@TpU
F!i=XAoD]4@<?U&DKKT9AKZ#)@:WqiEt&IjF!+m6Ci=3(F*(i.A8,po+EMI5FE_/6AKYMpG%GK.
E,B0(F<Fh"D/a08ASuU(@qBLgDKL:Z%13OO,p6f<Ci"$6Bl7Q+@rGmh+D58'ATD4$ARlomGrd'[
DfT]/Amo1\FCf\>004P)IP+3<8l%ihDKKH1Amo1\;cH%X6pX^=/4k.[:IK;CDesJn<'a8I5uL*%
8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=%14C(4=_q0C2[WsAmo1\Hn?p6%13OO>[h8WBl88rBOPF_
A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$DJOT-@Wm0H>Y]3XD..6[Dej].@Wik:
+<VdLI=5=)E+*BjEb/j0BkCj9@:FD.>p*B>Df'?&DKJirCO9K+C`m1q@r$4++Eh=:F(oQ1+DtV)
ATN8/$=%7iE+O'+Bl7^5@:Wn]Ec?GR>Y]3XD..6[Dej].A7T=nE$-8GI=5=)E+*BjEb/j0BkCj9
@:Wn]Ec?G4+C%9PD/Ej%FB!0oHXUGq+EqaEA90DGATMs7+EVNEB6%p5E%c9TBlmp7%16?RH#R>8
Ch[d&HXU`,DIIBnF+&C?:2b/i@;Jn]CO9K+Ci3ZuATJuBI9Trq@:s.lAS-:'An*l1Ci!utD.Rd:
>p*B>Df'?&DKJirCO9K+C`mV(D.Rc2Ao_g,+E_a:F#kEd@;Kat@;TRs+>Y_pF`V,8+=D&8D.P)C
%16?RH#R>8Ch[d&HXU`,Eb/j(I=#3oDfT]'CfG=gHXU`,Eb/j(+<Z)\>?l,UB4Z*pAp\6(@le%7
CiX*!F+%=:>XNFHD.RU,<,ZQ!@;Ka&DJsE/De!3lAKYl!D.Oi1AS,LoASu!hF#kFPCi"-'Aof(V
3[\rZFEMVA+DlBHEb/ioEb0,uATK5I%16?RH#R>8Ch[d&HX^W!FFAL@:2b/i@;Jn]CO9N'ATT%;
+<VeTI9Trq@:s.lAS-:'An*l2B4Z15>p*B>Df'?&DKJirCO:)5FE2),G%G_;DdmHm@ruc7Ao_g,
+E2IF+Co1rFD5Z2@<-W9@UWb^F`;DM%16?RH#R>8Ch[d&HX^l/I=#3oDfT]'CfG=gHX^l/+<VdL
+<Z)\>?l,UB4Z*pAp\6(@le(:CjfS3>XNFHD.RU,<,ZQ!Ch[s4+E(_(ARfh'+DG^9E-67FA8,Oq
Bl@ltEd8d<@<>pe@<6!&@UWb^F`8I8Bl%@%I16NgBR+Q.EboH-CO9Q0D/a6<HX'<aEc#6$<,ZQ!
@rH4'C*4WA+FSZB>]=+aATD?oHYI)%3b*)FE,'f,+C%9PD/Ej%FB!0oHXgu2E,oN2F(KD8DJsE1
Dfor=+C]U=Eb0*+G%ki,+EqL5FCcS9E+*6f+CT.u+EM47Ecbl1Bl7Q+Ci<flC`mG&ASuU(Anbgs
F+"K)>\JD%ATDU$DJOT0AUSo1:2b/i@;Jn]CO9T'+<VdL+<VeTI9Trq@:s.lAS-:'An*l4AURi,
>XNFHD.RU,<,ZQ!A8-+(CghT38l%htEb0<7CigeDBln$,F`\aHATW'8DBNG-A7^/u$=%7iE+O'+
Bl7^5A7]S*HX'<aEc#6$<,ZQ!A7]R"+<VdL+FSZB>]=+aATD?oHYI)%3b2f<I9dt#6Z6gYASuTh
Dej]1ASbq"ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&
HXp](B6%s>HX'<aEc#6$<,ZQ!A7]RiEc<-D+FSZB>]=+aATD?oHYI)%3b2f<B6%s>>p*B>Df'?&
DKJirCO:)5D/XT/+EqaEA90DGATMs7+D,Y4D'3J3Dfp#?06;8MFCfNA%16?RH#R>8Ch[d&HXpi$
I=#3oDfT]'CfG=gHXpi$+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.7A:7`+>XNFHD.RU,<,ZQ!A8,Oq
Bl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*A0>r8@<?4)FD56+I16NgBR+Q.EboH-CO9T+F)ZPS>Y]3X
D..6[Dej]1Ble59+<VdLI=5=)E+*BjEb/j0BkCj9A8-+(I9dt#6Z6gYASuThDej]1Ble60@<iu+
Bk)7!Df0!(Gp%$7C1UmsF!+n4+EV1>FF=T*>\JD%ATDU$DJOT0DJX`J>Y]3XD..6[Dej]1DJUF<
+<VdLI=5=)E+*BjEb/j0BkCj9A8Z43>p*B>Df'?&DKJirCO9l3F*&OC@VTIaFE8R=DBNJ(@ruF'
DIIR2+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&HXq&)I=#3oDfT]'CfG=gHXq&)+<VdL+<Z)\
>?l,UB4Z*pAp\6(@le.=@sqW*>XNFHD.RU,<,ZQ!AoD^,@<?Q5A8bt#D.RU,+EV1>F<G^IBl7Q+
FD,5.@rH7.ASuU(Df0V=De:,6BOr;7A8bsfF=A>UATD7.%16?RH#R>8Ch[d&HXq):ATW?I>Y]3X
D..6[Dej]1E-#T4+<VdLI=5=)E+*BjEb/j0BkCj9A8lU$FF@F;>XNFHD.RU,<,ZQ!F(KG9A8,Oq
Bl@ltEd8dH@<,dnATVL(F+"K)>\JD%ATDU$DJOT1A:8f0:2b/i@;Jn]CO9W'+<VdL+<VeTI9Trq
@:s.lAS-:'An*l5A:7`+>XNFHD.RU,<,ZQ!ARoLs+Co1rFD5Z2@<-W9DdmHm@rud?%16?RH#R>8
Ch[d&HY%;IHX'<aEc#6$<,ZQ!ATT%;+<VdL+FSZB>]=+aATD?oHYI)%3b<D]>p*B>Df'?&DKJir
CO9W'BlkJ>AU&<F%16?RH#R>8Ch[d&HY.>1DLHk::2b/i@;Jn]CO9Z7ASrV5+<VeTI9Trq@:s.l
AS-:'An*l6F(K6;>p*B>Df'?&DKJirCO9Z-EcZ=FA8bt#D.RU,+EM+3FCf?"AUP!p>\JD%ATDU$
DJOT3A7]_$I=#3oDfT]'CfG=gHY6l#E-!-E+<Z)\>?l,UB4Z*pAp\6(@le75AT2^=>p*B>Df'?&
DKJirCO9]7Dfp"A@;]TuF*22=AKYMpE+NotASuU2I16NgBR+Q.EboH-CO9]*FFAL@:2b/i@;Jn]
CO9]*F<D\K+<VeTI9Trq@:s.lAS-:'An*l7ATW?++C%9PD/Ej%FB!0oHZE\>EbT*.ATJu4@VTIa
FE8R:Ec5e;A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF+"K)>\JD%ATDU$DJOT3ATVs;I=#3oDfT]'
CfG=gHY6o3Ed/]L+<Z)\>?l,UB4Z*pAp\6(@le76FE2VS>p*B>Df'?&DKJirCO9]*F<GU8EHPu9
ARlp*D]iV9ARfk)AUP!p>\JD%ATDU$DJOT3Ci<d(I=#3oDfT]'CfG=gHY7/5@WNY7+<Z)\>?l,U
B4Z*pAp\6(@le7=Ddmd9>p*B>Df'?&DKJirCO9K-@;L48ALnsEAT2R.F<G"0A0>r8DfTD3B5DKq
@;I'(@;TRsI16NgBR+Q.EboH-CO9]7E.*(<:2b/i@;Jn]CO9]7E$-8G+<VeTI9Trq@:s.lAS-:'
An*l7Ec?G4+C%9PD/Ej%FB!0oHXh)-@<?''@;]TuD/Ws!ApGM3Ec6)>F+"K)>\JD%ATDU$DJOT3
FFAL@:2b/i@;Jn]CO9]9+<VdL+<VeTI9Trq@:s.lAS-:'An*l7FF@F;>XNFHD.RU,<,ZQ!B4Z0-
8g&1bEbTK7+EV1>F<G19Df$Uh+EV13E$/\*Eb/a&DfU,O%16?RH#R>8Ch[d&HY@57DJX`J>Y]3X
D..6[Dej]5CiF9.+<VdLI=5=)E+*BjEb/j0BkCj9BP_X*CjfS3>XNFHD.RU,<,ZQ!A8-+(CghU1
+EM47Ec`F7ATM@%BlJ0.Df0V=De:,1@VTIaFE8RCDBL?Q.=DX4>\JD%ATDU$DJOT6De*9hAUSo1
:2b/i@;Jn]CO9f7A79+^+<VeTI9Trq@:s.lAS-:'An*l:De*9hAURi,>XNFHD.RU,<,ZQ!A79b)
+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a:IH=D@VTIaFE;j>$=%7iE+O'+Bl7^5
C2[WrASc=6HX'<aEc#6$<,ZQ!C2[WrASc<.+FSZB>]=+aATD?oHYI)%3biSDBOu"!I9dt#6Z6gY
ASuThDej]1Ble60@<itf:IH==ASc=6%16?RH#R>8Ch[d&HYd>CHX'<aEc#6$<,ZQ!ChFk5+<VdL
+FSZB>]=+aATD?oHYI)%3c&GW>p*B>Df'?&DKJirCO9o,CLnVsDIal+Ddd0!8l%htB6%p5E.&0&
>\JD%ATDU$DJOT8De!F#E.*(<:2b/i@;Jn]CO9l9@qTh$+<VeTI9Trq@:s.lAS-:'An*l<De!F#
E.)"7>XNFHD.RU,<,ZQ!Ch[s4+D5_5F`;CE@;]TuF*22=ATJu<Bln#2DIIBnI16NgBR+Q.EboH-
CO9o,CLqp@>Y]3XD..6[Dej]:@;BEs+<VdLI=5=)E+*BjEb/j0BkCj9D..3kI9dt#6Z6gYASuTh
Dej]:@;BFq+A*bt@rc:&FE;j>$=%7iE+O'+Bl7^5D/=9AHX'<aEc#6$<,ZQ!D/=89+<VdL+FSZB
>]=+aATD?oHYI)%3c/\SI9dt#6Z6gYASuThDej]:@;BEsCi<`m+EM%5BlJ0B%16?RH#R>8Ch[d&
HYmY:I=#3oDfT]'CfG=gHYmY:+<VdL+<Z)\>?l,UB4Z*pAp\6(@leIECjfS3>XNFHD.RU,<,ZQ!
Ch[s4+E(_(ARfh'+DG^9@;Ka&Eb/ltF*(u6ARlooBk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZ!D=
A:8f0:2b/i@;Jn]CO9r1G@Vg=+<VeTI9Trq@:s.lAS-:'An*l>ATq[5>p*B>Df'?&DKJirCO9Q3
ART[lF!+m6DIn#7A8,OqBl@ltEd<'B$=%7iE+O'+Bl7^5DJs*2E.*(<:2b/i@;Jn]CO9r;AU&/:
+<VeTI9Trq@:s.lAS-:'An*l>De404I9dt#6Z6gYASuThDej]?ATW'8DK?q/+Dbb5F<GL6+E(_(
ARfh'+EqOABHV22+D#e:Cgh3iFD5Z2F+"K)>\JD%ATDU$DJOT:DffW4E.*(<:2b/i@;Jn]CO9r;
FD#W5+<VeTI9Trq@:s.lAS-:'An*l>DffW4E.)"7>XNFHD.RU,<,ZQ!GAhM4F!,CA+EV19FE8R:
Ec5e;.![6aFD,*)+CT;%+Du+>+DG^9B6%p5E-!.?EZfFGBlmp-I16NgBR+Q.EboH-CO9r@I=#3o
DfT]'CfG=gHZ!pJ+<VdL+<Z)\>?l,UB4Z*pAp\6(@leLLI9dt#6Z6gYASuThDej]2A8--.@3BH!
G9D!=F*&OG@rc:&F<G^IBl7Q+8l%ht@rH7.ASuU(Df0WE%16?RH#R>8Ch[d&HZ"%UHX'<aEc#6$
<,ZQ!DKd3G+<VdL+FSZB>]=+aATD?oHYI)%3c9.i>p*B>Df'?&DKJirCO9W'BlkJ++Dtb7+D#e:
Ch[BnF<GdGEb$;8F(oN)+A,Et+Cf>-G%GQ5Bl@m1I16NgBR+Q.EboH-CO9u/DIIBnF+&C?:2b/i
@;Jn]CO9u/DIIBnF!)TRI9Trq@:s.lAS-:'An*l?@W#UkATN9*+C%9PD/Ej%FB!0oHZ*A.ARfg8
Ci<flCh4`,@;TRs+D,Y4D'3tBATKmT+CT)&DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-
CO9u1I=#3oDfT]'CfG=gHZ*F;+<VdL+<Z)\>?l,UB4Z*pAp\6(@leO=I9dt#6Z6gYASuThDej]<
E+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO:#/@r#V'HX'<aEc#6$<,ZQ!
E+*6lA0<!;+FSZB>]=+aATD?oHYI)%3cJM;CLhj!+C%9PD/Ej%FB!0oHX^DnCNCV@E$/S,A0>o(
@rHO%EcW@I@<6O%A0>r4@:NjkBl5&(Bk)7!Df0!(Gp$^5Ch7[9%16?RH#R>8Ch[d&HZ4"RHX'<a
Ec#6$<,ZQ!E,m'D+<VdL+FSZB>]=+aATD?oHYI)%3cK+f>p*B>Df'?&DKJirCO:#CF<G"0A0>B&
Df]tBEb/ioEb0,uAKZ28Eb'S-$=%7iE+O'+Bl7^5E-68NHX'<aEc#6$<,ZQ!E-67F+<VdL+FSZB
>]=+aATD?oHYI)%3cK4`I9dt#6Z6gYASuThDej]@FDl22F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9
A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5Eb/j#@;TRsI=#3oDfT]'CfG=gHZE\0DIIBnF!,mZ
>?l,UB4Z*pAp\6(@leXAAo;$oATN9*+C%9PD/Ej%FB!0oHZE\0ATD@"@qB0nDJsE/De!3lAKYl!
D.Rc2Ao_g,+E_a:F#kEd@;Kat@;TRs+>Y_pF`V,8+=D&8D.P)C%16?RH#R>8Ch[d&HZE\1A:8f0
:2b/i@;Jn]CO:)5B4N,-+<VeTI9Trq@:s.lAS-:'An*lBAS5P%>p*B>Df'?&DKJirCO:)5B5)F/
ATAo%DIal4DK9<$BleB-EZdtM6m-#S@ruF'DIIR"ATN8/$=%7iE+O'+Bl7^5Eb0<6A:8f0:2b/i
@;Jn]CO:)5F*(q8+<VeTI9Trq@:s.lAS-:'An*lBATMs(I9dt#6Z6gYASuThDej]?ATMs3Eb0;7
FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.=DX4>\JD%ATDU$DJOT>ATi!?
HX'<aEc#6$<,ZQ!Eb0E4+<VdL+FSZB>]=+aATD?oHYI)%3c\eTDgbn6>XNFHD.RU,<,ZQ!Eb/`l
DKK]?+ED%:Bldir+E(_(ARfh'I16NgBR+Q.EboH-CO:)5G&M80G^XpD:2b/i@;Jn]CO:)5G&M80
GT\,WI9Trq@:s.lAS-:'An*lBATi!0AU&W/+C%9PD/Ej%FB!0oHZE\>F`MA@+CQC/BleA=De:,2
F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%DKC48$=%7iE+O'+Bl7^5Ec$5O
>Y]3XD..6[Dej]?D'0rD+<VdLI=5=)E+*BjEb/j0BkCj9Ec$51+C%9PD/Ej%FB!0oHZF7HF!+'t
D.-ppD]j+2EbTK7F+"K)>\JD%ATDU$DJOT>FEDqX>Y]3XD..6[Dej]?FEAWJ+<VdLI=5=)E+*Bj
Eb/j0BkCj9EccDO>p*B>Df'?&DKJirCO:)EDK?pm+EV19F<GX7EbTK7F+"K)>\JD%ATDU$DJOT>
G]S:[>Y]3XD..6[Dej]?G]OuM+<VdLI=5=)E+*BjEb/j0BkCj9Ed2YR>p*B>Df'?&DKJirCO:)5
B6A$!EZeq<E,oN2F(oQ1+EM+&Eard2%16?RH#R>8Ch[d&HZOCBG^XpD:2b/i@;Jn]CO:,HAU#=?
+<VeTI9Trq@:s.lAS-:'An*lCG@c#I>p*B>Df'?&DKJirCO9W;FE1f"F<GX=DJ*cs+Dbb0AKYQ/
E,8s#@<?4%DBNP3Df$V@DfTA2BOtU_ATAo'Df'?&DKI"0DIal2@<Q41%16?RH#R>8Ch[d&HZaC@
A7Bh4HX'<aEc#6$<,ZQ!F`V,)@X0(=+FSZB>]=+aATD?oHYI)%3d#LTA7Bh4>p*B>Df'?&DKJir
CO:)5FEMVAF!+m6Ch[s4+E(j7GAhM4F!,(8Df$UFGpskXBOQ!*6qL9F6W?`^+CehrC`mq?Eb'56
Df-[GGU\%M$=%7iE+O'+Bl7^5F`V,8I=#3oDfT]'CfG=gHZaC@F!)SJ+<Z)\>?l,UB4Z*pAp\6(
@leaRATN9*+C%9PD/Ej%FB!0oHZE\>F`MA@+EqaEA0>o(An?!oDI[7!I16NgASu%*882^MCh[Nq
FD5W*I16NgASu%*;eTTMARp4(De*ZuFCfK$FCeHnATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6s
BkJQ#DfQt>Ec5](@rrhAE,o].De*ZuFCfK$FCcmR%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R
/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"S
FEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"I
F(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!
-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le7r3*bF('*7
4(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1
Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"
$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>
+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)=
G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e%15is/g*\rDK:"MF!)Z9F`_^WF_>N9+s8lu0JXbp
DfTW%Ec6)<A9/1e:-pQU3?^F=3?T_).3Mh;3?^F=2]sJY@WHU/+=&W`>9GpL3\i]<-mp,g+=JEp
+?:T+1,pX/.3L/a-Rg0B+?:T+1,g='-RU#f+=JW_INViU+?hh/-RU8h-9We#3?^F=2CBk$+=nW_
-RU8N$;No?+?:T+1-&Vp><*if1,gRk@WHU/,VWF_+Z_A=>ph0O,!%_-3\iZ?0I\P#><*if1,gR3
EHQ2AAKWuV3\iT=0F\?u$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<77De*ZuFCfK$FCcgB>9GXC
EccCG-Xq44Ch.:!A8Gt%ATD4$ALAU)+Cf5!@<*J<-OgDMFE21J7P[%[4&]^4+@C9lEb0-14*#Bb
-ZF*@C2[X!Blmp,@<?'.+Bot,A10PfC2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)7+>Y-YA0<6I
%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#
EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ7
0b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp+B!?"4#nHF1-&Vp><*if
1,gRk@WHU/,VWF_+Z_A=>ph0O,!%_-3\iZ?0I\P#><*if1,gR3EHQ2AAKWuV3\iT=0F\@Y2ENWT
<+U,m+B*,qCLoSJFEAWQC2[X!Blmp,@<?'ZD/X3$0JFj`$<(VPAooOm2ENWT<+U,m+@9LXBk'5;
Ec>i/F<DrGDe*ZuFCfK$FCeElDfoN*APHTKATDi>+Bot0ATV[*A8Gt%ATD4$AKW?JC2[X!Blmp,
@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.ATnRj-!YM&@ruF'DL5W1AU&<=
FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bF`_>6
BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]BQ@ZrHY@MCE-"&n04f#RGA1i,E+NQo@4lJ=B.nIC
CM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<ATD4$AUP\3De!p,ASuU2+Co2,ARfguGp$^>Df$V%
BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj07A1>
:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO%16?L
AS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>HW>-$
DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*Zu
FCfK$FCd(=E-Z>1I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(D
A7g7:<HDklB-:r-A8Gt%ATD4$AKXf;7XZlu$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&
Eaa'$/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m9>]aP%
FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&t$4R>I@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*q
B4uC$DJ+B%>n%-GBR+Q.EboH-CO9#O8Q/GO:..lFI=#3oDfT]'CfG=gHW3O-;c#bT6r-/m+<VdL
I=5=)E+*BjEb/j0BkCj9<(KSZ:dIiE:IBP9+C%9PD/Ej%FB!0oHY.D:C`m\*DIdZq+E1b2BHSlL
F`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BRL<s>\JD%ATDU$DJOT2DfT]/Amo1\FCf]FHX'<a
Ec#6$<,ZQ!AoD^,BkCd`ATVL.+<VeTI9Trq@:s.lAS-:'An*l6DfT]/Amo1\FCf]F>p*B>Df'?&
DKJirCO9Z3Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4F+"K)
>\JD%ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7E,961+<VdL+<VdL+FSZB>]=+aATD?oHYI)%
3bNJPCh\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5F`8HOGq".N$=%7iE+O'+Bl7^5
BkCd`ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m@ruF'DBL&EI=5=)E+*BjEb/j0BkCj9BkCd`
ATMEmFD5Z2I9dt#6Z6gYASuThDej]6DKKH1Amo1\+EM+(FD5Z2+EM[BD..I1+EMXFBl7R3%16?R
H#R>8Ch[d&HYI)%I=#3oDfT]'CfG=gHYI)%+<VdL+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9BkCk'
>p*B>Df'?&DKJirCO9Z3Ec#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&<F%16?RH#R>8Ch[d&HZNb?
C2[X!Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSCI9Trq@:s.lAS-:'An*lCATV[*
A8Gt%ATD4$AURi,>XNFHD.RU,<,ZQ!E,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.E
A8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAUP!p>\JD%ATDU$DJOTAGAL]0AU%g-GAhM4F+&C?:2b/i
@;Jn]CO:2JCghEsG\1u?DfTB0+FSZB>]=+aATD?oHYI)%3d#X_@<?(*Ao`*6Eb'6>>p*B>Df'?&
DKJirCO:2AGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0
F_>N9-[cF2>\JD%ATDU$DJOTCDfTB)BlncM>Y]3XD..6[Dej]DDfTB)BlkI?+<VdL+<Z)\>?l,U
B4Z*pAp\6(@legPEb'!#FF@F;>XNFHD.RU,<,ZQ!D..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW
.=DX4>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVO
C2[X!Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,+CT>4
F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lVDe!p,ASuT4FCf]=+DGp?E,ol,ATMp(F"SS,
F<G"5F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<WsdC`me;F`Lu'+Cf>#
AKY].+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$
FCfkCA8bt#D.RU,+D,Y&B5M3tFE8R5Eb-A)Bln$"E]OX:+<XouAS5^pHYIS5D/"<-I16N++C&W&
ASiPa@<--oDg-(AB6%p5E$/t8DJ()&De!p,ASuU23Zq[NATD7-1*AS"A8-+(+=CfBDfp#:@;TR'
HjpE*+C&W&ASiPp9OUn3=BltiF_56"G\(D.D.-ppDf[r^>]s\!@XL!TA8-+(+=CfBDfp#:@;TR'
/14eCG%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'H=_L6$4R=g+C&W&AShk`,p4<Q:2b#%8g%V^A7Zlt
F!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_ATD$fDf9`8DffQ;<+oue%14C(+<VdLCh[a#
FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--p
A.8kl+<VeNBln#2E-#T5A8a&=@;]Uo@j#;nCh[a#FCfK6/g*T+ATE'<BPD?s+DG^9@s)g.Gp$@6
AU&<=FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq+EMIDEarZ'@rGmh+D>J%BP_Bq
BQRs+B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%FEDVOC2[X!Blmp,@<?(/-Z^DDART+\EZek1DKK<$
DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmq^,p4<QFD,B0/e&-s$7-g"@V'1dDL6P<
EaiI!Bl/8-$7-fi67tA_IXZ`p+F>4`CghEsGT^mHD.7's9PJBUF!,OG@<-HZEc5eX+u(8aI16N0
+AP6U5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#I16NgASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'
DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@
+E)-?=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9Fc8hO@\Df9`8DffQ;>]aP%FEDVO
C2[X!Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&@;]Tu@V'h'DIbAJ%13OO<,Wn%F(HJ!FCf]=
FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XlE*$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp
+A$HlFCB!%+A,Et/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUr
F"_0;DImisCbKOAA:8es:IKURBlbD*+A*(M+<Y*'A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn
+EqOABFP:k+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>Fu@:O._DLHkN@:O._
DLF,H$=%:eAShk`+<X6nF*(i,C`l>G6rQl];F<l*%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4
G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(88l%iR:K::[7=>UP+<YB>+CT)-
D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+C'#"G]\%LHZ3D'D..=1/g*`-+Cf>-FCAm$F!,R<
AKXT@6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*D]iM3Bl%<&8l%i-+A,Et;bpCk6U`,+CiaM;
@rH7,@;0V#%144#>]aP%FEDVOC2[X!Blmp,@<?'5I16NgBlmp'%144#8T&Tk@;Ka&@3B'&EcP`/
F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*@;]Uo@kM\?B.n[[E+*WpDe"2J%144#>]aP%FEDVO
E+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/+CT.u+C\o-Df0).%144#F*2G@DfTr@+A*bt
H#@_4GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:EcYr5DK?q@AT;j,Eb/c(D/Ws!Anba`FD5Z2/g+,,
AISth+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*AKYi.Eb-A-DJ!g-D..O#Df.TF$6UH6+<Ve3
@V'1dDL5r4F_t]1@<?(/%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07A1A
DfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0
CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+80/5I?D/XH+/SZkV
@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#
AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0
@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#ARloU+B*Q'FCBD:882^MCh[Nq
FD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VN
%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9I="n(D.tRqBlmp,@<?''
8l%j'/e&-o+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1r??$6UH6+<Ve3DJsQ4@;L"!
H=[Nm#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp+@:3bCh+YnFCf]=FEDkEDe*ZuFCfK$FCd(Q
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5F`8rU8l%ha$6UI.@;BFq+A*bt@rc:&FE8R:
Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/+CoCO%13OO,p6H%AS5^pHZit@
@UX@mD1)j#,p75>EHPu9AKW@5ASu("@;IT3De(4)$7-g5A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA0<6I%14C(D/=89-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTM
ARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Eb065Bl[c-I9]]mEbTE(<,ZQ!
>]aP%FE)GAFCfN-DJ*csH[TO<DImisCbKOAA6a4fG][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=g
HZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*
F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5<affDDej\UI9]NcEc#6$
<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI16Ng
:2b/i@;Jn]CO9o7F!,m9;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'cFCf]=
EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHe
E+No0FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$Bl7Q+FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/
@s)X"DKIK?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE
+E(d5-RT?1,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'
B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5
<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:
F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<X?r
@:UKcFCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1@;BRpB-:H$AU&<=FF.b@A8Gt%ATD4$AUP\8
F<G(%DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1bEbTK7/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-
$7-g2Ddd0!-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%O
B5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Ci<`m+FRKnFE2)5B2iebHX(Z(G][qJDffQ3
Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16Ng
ASu%*;eTTMARp2u$=%:eAShk`+<XToF<G!7GAhM;Bl7Q+A8-'q@ruX0GqL4EFCf]=FEDkEDe*Zu
FCfK$FCfkCB4YslEaa'$Et&I!+C%TK<+T0\Anc'mF"SS$Cht58F^o)-Anc'mF!+n3AKZ2;BlnH.
DBO%>+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge+C]U*$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B?
$4R=g+C&AeB5)71G%G]'@<?4#I16N0+EM+9C2[X!Blmp,@<?''-RU#Z:-pQU@s)g4ASuT48l%ht
E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt)i$7-g9ATV[*A8Gt%ATD4$AKW@13a?c<
D/^jF+<VdL+<VdL+AP6U+EqO;A8c[5%14C(F(KH.De*ZuFCfK$FCcRB05,9@AM7e:BPoJFASlB6
+<XEG/g+tEDKU15$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*q
B4uC$DJ+B%>n%-G:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3
Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!:-pQU@s)g4ASuT48l%htE-67F
A8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0H$p,/%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZgCNF<#F(foKFCf<.>]aP%FE)GA
FCfN-DJ*csH[U;b+<VdL+<VdL+C%9PD/Ej%FB!0oHVQm[+EqO;A8c[5I16Ng:2b/i@;Jn]CO:,6
FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAhYBQ%a!05>E=DD-*CD/`a%
AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBsBl8'<I16NgASu%*882^MCh[NqFD5W*
I16NgASu%*;eTTMARp2u$=%:eASiPgATT&5E-,f4DII?(@<H[*DfR7I.3NhKFD)e-H!t5t@j##u
AU&<=FF/(?FD>`)Ch\!&Eaa'$I4bs9>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3
>?q[F>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I6q@aD..<eFCf]=EHQ2AATMR'B5D.+I=5?q
DfT]'CfG=gHQ[B@FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi83a?c<
G][D'@r$.%@<6+/I:?W,@psOl>]aP%FE)GAFCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+EM+9
+A?3CAQU'`F`_;8E[YuX+EV1>F<G"0A0>DsEb/a&DfU,O%16?ODIe)bBkM*qBkM+$Bl7R3%16?O
DIe)mBOPF_A:4mo>\S:kD%-gp+B!?"+C'#"G]\%LHY7A<Ch\!>+E)-?FD,5.B6%p5E$0FEFWbm:
DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4$6UI(ASu("@<?(%+C%TK<+T0\Anc'mF!,17
+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<+C%TK<+T0\Anc'm%144#BlbD0Bm+'*+EV:.
+D5_5F`8I@@;TR.%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p6i@E,961+=CoBA8Gt%ATD4$ALATq
67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ(+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u
$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!B6%s-BlkJG>Z5`bBl7Q_Dej])FCf]=
EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;b>XNFHD.RU,<,ZQ!:-pQU
D..3kF!,49A8Gt%ATD4$AM/(9GT_DD$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16Ng
Blmp'%144#<HD^o>YJR*AQXD'D]iP.D/a3*AKZ).AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%L
HY7A<Ch[uDI38t+%144#5p0WFFCSu,>]aP%FEDVO@UXA,+EM%5BlJ/:BlbD@EbTW;ASrW4D]j.8
AKY6"AU&<=FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1
@q?d$Aft>P@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$
Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%
FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#
De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTu
Anc'm%144#>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q
@ruX0GqKO5>\.e`HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aH
FWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgT
F<Fh1AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+
DId='%144#@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)F<G[=BlbD6@<iu9ATN!1F<G:8
+Eh=:Gp$pADJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#
AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!Bl/8-$=%%OB5)71D09Z:Bk)'t
F+&BkI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6gFD5T?%16?SFCf:u$6UHrFCf]=
FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Et&I!
+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;sAS,@nCige6F!*1l0Hak=@<,dd
FCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O
=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.F*)G:DJ((sFCf]=FEDk2;F+,Q
76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn/hT>9I4bs9%16?SFCf;3%144#
>]aP%FEDVOC2[X!Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%BP_BqBQPA%ASlC"HZsL=E,]B!
I3<!;G\(D.8g&"iF`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7+E(j7F*)G:DJ+#5@;]TuDffZ(
EZf:BBOu3,FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+ARlp$Df0H2F`)7CFD,*)%144#
@rH7,@;0U%Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&>]aP%FEDVOFa%Y1FCf]/Ed)GB
A93/M+EM+*+E1b%AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+#SK$6UI$@;[2sAKZ,:ARlp*
D]i\(DImisFCcS"ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4F*1u++EqaEA9/l8BOQ!*@ps6t
@V$[!@;^3rCi"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8BOr;uBl%@%+D58'ATD4$ARlom
Gp$@6AU&<=FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0F)Po,+DkP)F^])/ARoLsBl7Pm
$6UI*F!+n-G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>IASu%*ASuX-ATD4$AUP!pC2[X%
Eb\TqATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].De(:L%15is
/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k
;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0
F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?
+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:
%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;
C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&Ft
BkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J
;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[Wn
ATfFM/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e:-pQU7Pm1\
4%*XhF_;gpF`'9O@WHU/+=ANZEb03+@:NkZ+EqOABHT;f0JXbpDfTW%Ec6)<A.8kT$:Zd40fr9E
D..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<>9Is'+=CW@Bl%<pDe*BmF*)G:@Wcd,Df-pF
>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=DO+=K?"C2[WnATfFM/1<V.C2[W1.4dS/
F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg5
0fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8m
C2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp
+B!?"4#nHF1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b3ZpF+3\iZB-Rg/h
+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a-RU8h%15Q_4#&fr
ATMr9;f-GgANOpSF<Dr>@Wk[eDeio<0II;:;eTlWF=Tg=4#&frATMr96=FqL@ll&58PN#(@UX=l
@j#l)F*&dH@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=
C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP.41,9t(+Co&,-OgDP:J=/F;E[&gB4YslEa`c;
C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u
$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2
De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2A
DffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8
A7KakAM.q>B+52_De*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&Ik
De*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9B
F:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G
76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c
$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0
B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8
A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@
+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,
C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k
+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#
D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,
+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2
+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45
+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/C
AKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZ
AKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=
+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"
+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-
F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2
-OgD`78d&U:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]
9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u
$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8X
E+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1
Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^
E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/
F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&Eaa'$/oY?5%14Nn$;s;d76sj@
4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85
GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$
F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)
EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VL
B4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.
8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>U
FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?
+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$
%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_
:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0eP.41,9t(+Co&,-OgDP:J=/F
;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)
<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gk
C2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@
:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'
.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6
F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$
/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-r
FCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1b
EbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?
ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);
8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-
F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2s
AKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VL
B4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXq
D.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5
EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(h
EbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/f
H#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.
9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9
De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>
$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)
%14Nn$?1$#A7]@]F_l.T0ht%f.WBECA7]@]F_l.BF"JsdA7]@]F_l.BE,ol3ARfg)F(KH9E%VS,
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE6tKk>D.7's+>PW+
0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO:-pQU@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$
+>>5h-Y[F/GT\@_/151NA7T7p+DPh*+E_d?Ci^sH%15is/g,(C+C\kq@rl!kC2[Wi+BosE+E(d5
-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l@67sBqDe*Kf
BkhQs?TgFm-YII<F`8];$4R>;67sBjF`MM6DKI"FDfTW-DJ()5F_Pr/+>"^XG@b2u+CT=6DImBi
ARl5W:-pQUC2[X(?YO7nA7%J\+=D5QBlmo6%13OO:-pQU@s)g4ASuT4GAhM;Bl7Q+Ci<flCh4_@
+EVg=@;?uoF!,@3ARo@_%15is/g,7VB5DKr?YO7nA7%J\+=CuD@ps1b-OgCl$;No?+Dbt)A0?#9
AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@Ec>N)@<6L4FD5Q4
-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-+FPjbB6%r6-Y-e4
BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[\NPEZf(.@j`B.$4R>;67sC"F`]9]Eb/i*
/KebFF(KB6F!,=<A8,XiARlp-DfTB0+DG^9FCB3&ATT&2De!3lAISu7:IA,V78?fL:JFPL:./H'
C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb:4@U=%16Ze@<6!&-[U;;IXNRQ$;No?+EVX:
Ci<fjBkhQs?Q`umF<DrXISP??-OgD3%13OO:-pQUF(KG98l%htF`V,7+DYP6F!*%WEb065Bl[d+
+A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKAE_BthF!,L7F(KG9/Kf(FF*(i2F<F0u
AoD]4@q]:gB4Z-3%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrAAS,@nCiiZuATDQtH#k>^
+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`RA7]@]F_l.BE,ol3
ARfg)F(KH9E$l)%E,o].De(UX:-pQ_E,o].De'u3/M/)[De'u0Ec5](@rri7ATW'6/e&._67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i3AT2a&D.7's+>PW)2[p*h
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)i,De!lD2]uO>A7]9oH=gl-ATJ:f:-pQU0K<u\F>5Km@:Wn[
A0=0:6V0j/2'?FPD/aP*$;No?+>>cn@rsF^+DG_7ATDm(A0=0:6V0j/2'?sOFED57B-:o+FDi::
De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU0f`cU@k]e`Eb0H8BlnH.DBNP0EZdss3A*!?
+:SZQ67sB90Q(fP1,^7`A867.FCeu*AoD]48g$,H0JXa[$4R>OA8,Op?YO7nA7%J\+?MV4-mr_G
AU#RS3^,9FA8,Qs0I\4oBl.F++=ATh-YdR1A7]p,C2[W*F`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t
>9G^EDe't<-OgCl$;No?+CfP7Eb0-1+EqaECM@[!+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%16ig
A7o7`C2[Wi4ZX]5C2[W1%13OO:-pQU@s)g4ASuT4GAhM;Bl7Q+F*22=AKWQIFE_;)CER&,+Dtb%
A7]9\$>OKiF'iWrDe*3<3ZoebDe*p+Deip+ATMs7-OgCl$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5
DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs
-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A
%15is/g)NUC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt-Qij*%15is/g,+UF>%lZAS*&:+DG_7ATDm6
+Dl%-BkD'jA0=K?6m-\lEb'56Bl5&3@VTIaF<GC<@ps1b%15L!6WHiL:/jSV9hdoK6sjYCDe*2t
4ZX]60H`D!0I[G<F)>i<FDuAE+E2?D-[U;;IXNRQ$>"6dF(HIAH[\_=I4#I2-mrFN/8B*6B4#@f
De*3(+D58-+=DMb:4@U=%14Nn$4R>;67sC%ATT%e:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.c
Ci<`m+EVNE@:OCnG%#K(%17/nDfp/@F`\`RF`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr
0d(FL@r!2D+D58-+=CoBA8lR(<HD_lCLqd4-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7CLqd4
/n8L+-Qij*F)>i<FDuAE+=BcW6m-GhDe`inF<GX9FEMOM%17E-H>7A/D..-r?Z]k(1,:-u9jqaR
+A,Et+=MP^H>7A/D..-r/p(ZL.3NG8FCf\>Anc'm/g(T1,n12-+A,Et+EMIDEarZ'BlbD,Df'H3
F(Jl)De:,#+Du==@V'R&De:,%CghC+ATKIH<+oue%14C(Anc'm+CT>4ASkmmATJtd:IH=8CghC+
ATJu&DIal$G]7SBBln96Gp$s4FCfK,@;HA[,p6o>FDi:1+EM77B5D-%F)Q2A@q?cmDe*E%A8bt#
D.RU,/e&.6%14C(@rH4'Bl%L$B-;;0BlbD/Bl%?'Eb065Bl[d++E1k'CghEsGUst^ASbdsAU"Xk
,n12-+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+DkP&ASH$mAU#>DH?s=EA8PahD@Hq!+<VeG
A7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!%14C(@;L$sEc,<-
Bm+'(Gmt*,%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<QD..3kBl7HmGT_<YH>7A/D..-r
%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/D..-r%13OO>\S(p
F`_t&:IIljFCfK$FCe9hARTFbCh55@AU&V4$4R>I@<H[*DfU1sDeO#26nTTK@;BFpI16NgFD5i5
AU@[(AU&<=FF,6]INs#IEcYr5DBjUZ,9TTS7"$1VDfp)1AKX?YA7Zlg>Td9`Df9`8DffQ3BmO>5
>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8,e"I9^Z.
Ec#6$F(or3I16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-
CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+@rH1+D/OE+E.*'hASli)$=%X`
FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+D/Kdi%16?LAS5^pHXq&)F_t]-
FF=T*%16?W@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ
>\S(pF`_tVH>7A/Dg#i+G:muKG^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Df.1LAU&V4$4R>I
DIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F*)>@AM/(9
G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[
C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.DesJIFCf]F%13OO-!Y>!GApu'
AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?Z
BOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!
A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3                           ~>
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
E$/n6A8Gt%ATD4$AQDMn+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0+DPh*Ch\!&Eaa'$?ZL('F<G=:
A8c?.D..I#A7fk+DfTB0+DkP-CM.'sF(o9)+E2:0De*Eq@<?(*+E2:0De*Eq@<?(*1*C^`CghEs
G\1u?DfTB0-RgSp4?P\X?SNZN+CS`&;f-GgAM>e\@WcC$A86$nCh\!&Eaa'$+D5M/@WPIbDeioP
6ng;B.4cl04?G0&0d%hdC2[W*C2[X!Blmp,@<?''C2[X!Blmp,@<?'[Ec6)0Ch6=LCLqO-+DPh*
FDl)6F!,49A9E!.CaUY_-p0%C-YdR1F)>i2ATVL)FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa
;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<:et"h?YXLiCh\!&Eaa'$+B2-):L?^i6psg<?Ys<r<)5nX
?V4*^?Ys<r<)5nX?YXLiCh\!&Eaa'$?Ys<r@WcC$A86$nCghEsGT^I<Bl%<pDe*ZuFCfK$FCf8s
FCf\>A7]@]F_l/"F(KB-AU/>>BPDO0DfU,<De'u*De*3nG%kN3?Z]k(+DPh*Ch\!&Eaa'$<HD_l
CLqd4+DPh*Ch\!&Eaa'$?Z1+%ATqL'AU#>4De*g-C/o=dEbf63F!,=.DJ<]oF*)/8A0>_tDJ<]o
F*)/8A7TUgF_t]-F<GF/DJ<]oF*)/8A92[3EarZ'E,o](AS,@nCige=Eb]?-A0?2EH>7A/D..-r
?Z]k(-RgSp4>J$72C(%31,(F;1,ggB3&E?H3B8oM1E\G,1,(F<0JP1:0KCsL1bg[C+>PW+0JP::
3%d'B3AWKJ3&ilU+>PW+0JP:;2(gaB1c%*I3B/cN+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP:;
2(gdA0JYC;2)dHP+>PW+0JP::3%d'B3AWKJ3&ilU+>PW+0JP::3%d'B3&i]K3&ruW+>PW+0JP::
3%d'B3&3EJ2)-4/0JY=:0et[?1c76Q1Gq!C2DH=00JY=:0et^@1cI?P0JGLH1,9t-0JY=:0et^@
1cR3G0JtaE2DlU40JY=:0etU=2).!E2)@0I3Ar!80JY=:0et[?2)-d>1cR3G2`Mp80JY=:0et[?
1c[EM2)-dD2`Mp80JY=:0f(L91cI9L2`3HI0Jjn-0JY=:0et[?1c@$D0fCmE2`;d60JY=:1,(F8
1bpsC1GLdJ0JO\*0JY=:0et^@1cIBO3&i`L1Gg400JY=:0et^@2)R*J3ArWN1-$I40JY=:0et[?
1c$jH2_d0I+>PW+0JP=:0eP::0K;!O1GUmE+>PW+0JP=:0eP7B2)R0E3AE6F+>PW+0JP:;3A*-J
3&r`O0fCdG+>PW+0JP:<0J54@2DR'D2*!BO+>PW+0JP=:0eP::2D[$@3&NWR+>PW+0JP:;2_HpH
1bggI3A`EG+>PW+0JP=:0eP::3A`]P0ebO/1,(I;0etID/iGUH1H7BQ2DdB91,(I;0ekF@/i>FA
1H70N3&3<51,(I;0etID/iGUH1H7BQ2DdB91,(I;0ekF@/iGF<1,:O@2`EW;1,(I;0etID/iGUH
1H7BQ2DdB91,(I;0etID/iGUH1bgjD1cHO40JY=:1,1dA2E!KM3A<3B3&_s80JY=:0et[?1c76Q
1Gq!C2DH=00JY=:0f(L92)d3H3AE6E1GL"-0JY=:0et^@1cR3G0JtaE2DlU40JY=:0et[?1b^aC
2)R?N2)QL30JY=:0et[?2)-d@0JG@?1*A>+1,(F;1,ggB3Ar`K1cIEL0d&5*1,(F;1GCF<2`3KP
1bgdB2]sk01,(F;1,ggB2D?pA2Dm6K2BXb/1,(F<0JY7;2)m<L0JYF=1a"P-1,(F<0JY7;2)m<L
0JY=B0d&5*1,(F;1,pmD2).'N2DR0G3?U(21,(F;1,ggB1G^dA0JG@D2]sk01,(F<0JP1:0JGIF
3AWEL1*A>+1,(F<0JP193AriR0JP7;+>PW+0JP:<0J54@3Ai]R2_m*D+>PW+0JP:<0J54@2DR'D
2*!BO+>PW+0JP=:0eP::2D[$@3&NWR.4cl01*A@u1,(I;0ekFA/i>F@2)@'L2`EW;1,(I;0etF;
/i5@@1,C[>1cRE:1,(I;0etFC/i>RH0JPI?2E*E71,(I;0etFA/i5C@2*!WQ1c[<61,(I;0etF;
/i5@A1H@6K2)@!11,(I;0etI@/i5@=3AE6H2DmKD/1<V9+>kE"0JY=:0etU=2).!I1GUaG2)ZR4
0JY=:0et^@1cI<H2E!HP3&i$90JY=:0et^@2)-pJ0fLpD3&Da50JY=:0etX>2*!NM3AE6H3AM^4
0JY=:0et[?1c7*G3AWZP2)ZR40JY=:0etU=2).!L2`NNH1cQU50JY=:1,(F81bpsJ2_ZsB3Ahp7
0JY=:0et^@2)@$I3&riS0JXb+0JY=:0et[?1c70J0K(gD3A_j60JY=:0et[?1c7*G3AWZP2)Zm7
-p07=1,(F;1,^aB1H7?N1cR0D2(LXB/hf1;0ekF<2)RBQ1H@0E1Fd)k1*A;#/1<V9+>PVr1,(I;
0ekCB/i>=C1Gh!J1c7'31,(I;0ekCB/i>=C1Gh$G0ekR/1,(I;0etF;/i5=C1bg^D2_[-41,(I;
0etF;/i>RF3&`]O1c[Q=1,(I;0ekF;/i5:?0eb@=0Jah,0JY=:0f(L92)[<N0f_3Q1H?R50JY=:
0etU=2D[*I0ebID3B/-:0JY=:0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1H@BL2D[0I3B83;0JY=:
0etU=1c.-N2_ZsF1,^710JY=:0etU=2DR-D1cIBK1bg+.0JY=:0et^@1cI0E2)m?M2)QL30JY=:
1,(F81c.!I1H73N1-$I40JY=:0etX>2)[EN1bggD2E;m80JY=:0ekX?2)%$H1c-m@2)?@10JY=:
0ekX?2)%$H1c-mD1,U100JY=:0ekX?2)%$H1c-mA2DcO30JY=:1,(U=1b^dB2D@$G3&Vm70JY=:
0etX>2)I0F2E<NH0K1+00JY=:0etX>2D@$K1GUaC2`Mp80JY=:1,1dA2E!KN0f:[D0K1+00JY=:
1,1dA2E!KN0fV$N3ADX30JY=:1,(I91c7!F2E*NS3&;[40JY=:1,(F82)dBP2`3EK3B83;0JY@:
1bpp@2)6sJ0JP783&)O20JY=:1,(L:2)d6M1,_$E3&_s80JY=:0et[?1H@EO2_ZpE0JXb+0JY=:
0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1bg^D0Jb[K3Ahp70JY=:0et^@2)$aE3B&lP3B83;0JY=:
0et[?1H@0M3&<KP1H$@20JY=:1,(L:1c[?L0JtdD2DZI20JY=:1,(I91c@9P1,CpI2'=Y.1,(F<
0JY7;1-%?N2`N]U1E\G,1,(F<0f^jE2E*EO3B/lN0d&5*1,(F<0f^jE2E*EP0JG7;1a"P-1,(F<
0f^jE2E*EP0JG7;1a"P-1,(F<0K(O?0et^C2DR9O1E\G,1,(F;1,^aB1c7!G3AN9B2]sk01,(F;
1,pmC3&rlV1cR3J1ast(4>838-p014/1<V7.4cl00I\P80E                           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
