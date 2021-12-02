NB. JOD dictionary dump: 02 Dec 2021 13:12:38
NB. Generated with JOD version; 1.0.22 - dev; 21; 02 Dec 2021 12:09:00
NB. J version: j903/j64avx2/darwin/beta-v/commercial/www.jsoftware.com/2021-11-16T22:02:28/clang-13-0-0/SLEEF=1
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|252166421225834138836701553615461867713|
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

JODTOOLSVMD=:'1.0.22 - dev';21;'02 Dec 2021 12:09:01'

JODVMD=:'1.0.22 - dev';21;'02 Dec 2021 12:09:00'

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

usedby=:4 : 0

NB.*usedby  v--  returns  a list of words from (y)  that DIRECTLY
NB. call  words  on  (x). The  result of this verb depends on JOD
NB. dictionary references being up-to-date.
NB.
NB. dyad:  cl|blcl usedby blcl
NB.
NB.   'wordname' usedby }. dnl ''
NB.   ('word';'names') usedby }. revo ''
NB.
NB.   'putgs__ST' usedby }. dnl ''

NB. (uses) is expensive for large word lists.
if. badrc uv=.uses y do. uv
else.
  uv=. >{: uv
  wnames=. boxopen x

  NB. BUGFIX: 21sep10 - was not returning names like: EMCS_END_CHECK_sql
  NB. search object and locale references if _ occurs in any name
  NB. col=. >: +./ '_'&e.&> wnames
  NB. ok /:~ ({."1 uv) #~  ; (col {"1 uv) +./@e.&.> < wnames

  ok /:~ ({."1 uv) #~ +./"1 ;"1 (1 2 {"1 uv) +./@e.&.> <wnames
end.
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
1,(L,1,'h,+>G_r1*AA/2_Z@00H`+n1G^mG+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>P]+0H`)1
+>P&p1GLj30f'q-+>Pc60H`,*+>P&o1H%*50f:(/+>GQ03$9q0+>P&p0KD!G+>GYp1*AM30KC71
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
6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f^@EARci<0JY=)0fD'H0fh!D$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>GSn;e9nj1,(I<+>GW4
2)dQR1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q
6t(1K3Zp14+AZKh+>PW+0d&2.3\iTS1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh0d'8%F<E=m1,0n+2**NO3]&]$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nI@rrhK0JY@*
0f;!K1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+AZKh+>PW+0d&2.3]&fW0K9CH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'8%F<E=m
1,0n+2**TL3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp13+<X'\FCdKU1,0nI@rrhK0JY@*0f;!L1-.0K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW40KD0J0FCEJ6rZrX
9N+8X8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P=&+<X'\FCdKU0KC7NDg!6Y0JY=)0K;*K0KLmF%13OO%15is/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI
67sB]ATDj+Df.TY0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0eskHDg!6Y0JY=)
0ek^E1-.3M%13OO%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41,U1++Co&,+<X!nBl%<&
:3CD_ATBgS0ea^m6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO1,fXL$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1,U1LDg!6Y0JY=)0etdH
1HI?J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>Pes:2b:u1,(I;+>GW42)I?M1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp18+AQiu+>PW+0H`)-3]&cV1GB.C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh
2BYb5Fs&Oo1,'h*1-.0I3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,g=NDg!6Y0JY=)0ebXD1cd?O$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;
+>GT31GV!K3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp1:+AQiu+>PW+0H`))3\rTR1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`T$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU1,g=NDg!6Y0JY=)0etdD0fh!B$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+3+@KdN+>PW+0H`)(3\`EO1boCF$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f1"@
ARci<0JY=)0K;*N1-.0N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+@KdN+>PW+0H`).3\W9L0Jj+D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0ejeLAT/bI0JY@*
0etdI3'&`I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS0f:'r6t(1K3Zp14+AZKh+>PW+0d&2.3\rZT1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K1-.*K
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t
6t(1K3Zp14+AZKh+>PW+0d&2.3]&ZS0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K3'&`R$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp14
+AZKh+>PW+0d&2.3]/WQ0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nI@rrhK0JY@*0f;!L1-.0K$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+3+@KdN+>PW+
0d&2+3\WQT0JNo2:K(5"C2[X!Blmp,@<?'90b"Ib67u)1;cI+=De*ZuFCfK$FCcS6Df^"CE,ol,
ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is/g)QWDe*ZuFCfK$FCcmD
Bl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD)*j:-pQUAoD^,BkCd`ATVL.+<VdL:-pQUAoD^,@<?Q5BR+Q.EboH-CLq$!@;]Tu
BPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?+D5_6Ch[u6+<VdL+<VdL+AP6U+DkP&AKYet
FCf\>AoD]4B6%p5E$-QS.1HVZ67sBpAmo1\F(Jj'Bl@l3+<Ve%67sBpDKKH1Amo1\+EM+(FD5Z2
+EM[BD..I1+EMXFBl7Pm$;No?+DGFt+<VdL+<VdL+<VdL+AP6U+D,P4D..N/Bl8$(Eb8`iAKYK$
D/Ej%F<G[:G]XB%:-pQUF(KH.De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%9OUn3=<MR'De!@"F(oN)
+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA67sC'GAL]0AU%g-GAhM4F!)T#
67sC'DKg,0E,]B!+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5
Gpa%.:-pQUGAhM4Ch[u6+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW.1HV5
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%14L>+?CW!.3Kuc
%172tGqKO5:-pQUF`V+:@;^?5E+*WpDdso2ATT&/DBO%7AKXT@6m-GhDe<^"AKYT'EZfI;BlbD6
@:NtbDIj7aBkAt?G@c#+@;9^k?Q_HY:f9_O78d#P6r60E6r-0WBkhQs?RHt,D_</384c`V5u'gD
6XO8:De*ZuFCfK$FCefB3Zq6s77K^D;FNuM5u'gD6XOPBDe*2tASu$2%16f]/g)Ys00gp5E+*Wp
Ddt.A74p#3E+*X-ATBpd+?M9(+?V_<?SWaGCh=e<F(f-$C`l\J8Q/GO:..lF?X[\fA8Gt%ATD4$
AR?u9+>#0gATDj+Df-pO+>#2g6W,%;D_;J++<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>+E1b,A8bs#
E+*j%+DGF1@s)g4ASuT4G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=/hn^_$>"*c
/e&.t@<?!m/e&.1+EMC<F`_SFF<Dr";Gp:g3ZrBMDIdZq+Du+>+EM+9+>"^EA867.F<FOR8Q/GO
:..lF?X[\fA8Gt%ATD4$AR?eo$>"*c/e&.:%16'16r./^:IITH6XO\@1,fXL+^8]"A7TUg+EVO4
D]ik1F*(\9C2[WqEa`p#Bk)3;FDk].?YXLi/oY]@.3N"j:IITH6XV$9:IItf$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#
DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IITH6XVMU$<1\M+C\c#AKWce+@fF'6m-8VGp$gB
+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<62n$=Rg_+DkP4+CT5.ARTU%Bl5&3FD,6+
+B2-):EXIfF*)IU%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=ASQO-E+^q@G%,&lG@P]3@WaDB
0JkaJG$dF@+@C'bF(o/rEZf(5E,ol?Bl7Q+AoDR/+EqC2B4uC.+DG^9E,oZ1FCeu*A8bt#D.RU,
F"SS7BOr;uDf0Y>F`V,)%144#+D,P4+EMIDEarZ'@rGmh+Cf>4Ch+YtAKYD(Ch\!5Ch4_uDerrq
EZcqVATMg%@qf@fCj@.FBOr;rDes?4ARlp*AU&<</e&-s$8O4V?p%e,H"_5=E]7uIBJ_JcC2>hM
F*K]ZEbAi@?Tqj?87?OUDf098AKYK$A7ZlnDes?4F!+n/A0>K&DKKqB@:O=rF)rI3Cia]7BleB1
DJ+#u+CT.u+CK.sDIdZq?m'N9DKK<3+Cf>+DfTQ0B.aW#+<VdoF`MM6DKK]?+EV:.F(HJ5@:O(]
B4Z-,F`V+:A8,XfATD@"F<G16DKKqB@;]Tu@rH1%EcWiB$4R=u/g+Oa?T)pY3GgcoEG0YRD.,@\
FEDbPBQ@s!BQ7BC?m&?YG%kN3+D>\;+EVNEAp%p+Gp$[8@V''m@;Ka&Eb/ioEb0,uARloqDf0Z<
+DG^9E,oZ1F<FCJ7WU0k$4R>!/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@2_]AhFu<Vj?m%gTDKBN&
ATAo%A7TClB-:Sj@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+A,Et6r-0&%13OO2(g"Z4C:!^
Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CT5.ASu$mGT_*H
+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D$4R>M>@h\_/TboADd?`[
$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6tA1hh=B.4s28l%i_+B2-):CRXo
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+
Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'JAKYGjF(HIM2BYLi
8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.SEc6/CAKZ).AKZ#)
G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/6#:U\/0JtE@:UKb
?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=
De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&ASuU$A1B2S:i'QX
F!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa
?Xkp+A3"T`F`D4OE&)ZOF)3aS3HAh[A7o75?m&E[F*&O8Bl[cpF<G+*Anc-sFD5Z2-Z^DED/`on
F<GL>+A,Et/g+,,AKYl%G9CF1Eb/a&+Co%qBl7X,Bl@l3Amo1`Ch\!:+DG^98g%hcFE2;1F^o!(
+CQC1ATo8-BkMHpE+gA%H[B-C@"!H2+Co&"Bl.R+ARlp#ARTIt+E(j7A7]@eDJ=!$+DG_0Bl7K)
DJsZ8F"AGWATD7$/0JA3G%G]'F!+n/A0>B#DJF<3@ruF'DK@EQ9jqgK+EM[GAKXT@6m,uJDBNV$
DIdQp+CT)&+EV:.F(HJ3ATo8/DfT]9/e&-s$8O4V?p%dMBk:k$CjKYNA9KdgG%kf5H8oq`CGfU9
?Tqj?;e^)_Cgh@#Gp$s4CLnW0F`M%9?tsUjCh\!&Eaa'$?m'Z3Ebf_=AoD]4A8-'q@ruF'DBNJ$
Anc-sFD5Z2F"AGTAS!nF+Br5Q:IIucC2[X!Blmp,@<?'5D.I$[-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<)5nX?YXLiCh\!&Eaa'$/o>,J
/e&-s$8X:W?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?<+U,m+CJr&A8Gt%ATD4$ARHX!
DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>!/g+Oa?T0o^H=_8>BQ/9?B5r!*
EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7Eb-A8BOuH3
Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr@;]^hA0>T(+ED%'ASuT48g&:gEcYr5
DK@E>$4R>"/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@2_]AhFu<Vj?m%gTDKBN&ATAo%A7TClB-:Sj
@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+CIf;7!*?cCi`u:+B3#gF!,X;Eag/*F!,FBDg#i4
B-;86+D>2$A9f;3F<GX<Dfol,+C\n)E+*d/+E(j7FD,5.F*(i.A79Lh+EM+9F`8rB$4R>#/g+Oa
?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI+
+EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%15$H+CI<=2DAr*
C27j0CH44bBes4@0m\+TEarj$11*4Q+B3#c+CK>6Bl%iu+Eh=:@N]&jB6%B&-t[12A0>N*Dfp"A
Ec5l<F"&5BDe3u4DJsV>@;p0s@<*K4D]i_%DIdQp+A*bo@;TRs+EqOABHVG8A7]e&@rHC!F!+jt
?m'E/DfB9.Cj@WU8T&]_F*),/@<?''@;]TuAncKB+AP^3762Q!AnQ-l+DGm>DJsV>@3BMtEc`FB
Afs]A6m,r]F<G:=+Eh=:Gp$d/DIe#8GA(Q*+CfG'@<?4$B-:W#A0>_tBl8$$Bl7X&B-8[6CghC+
+D5_5F`;CO/e&-s$90X\?p%e+F#.oKD)cNQ2_el[G\(o*Ao'.XDg"!O?Tqj?6Z6j`Bk1dq+CSek
Bl7Q+@;[2rE,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);Eb/ioEb0,uATJu.DKBN&
AKYMtEb/a&+Co%qBl7X,Bl@m1+CT;%+D>2$A8Ggf/e&-s$99^]?p%dQ@U`noG&V.SGW0_%1c'24
H>GB\DD5cb?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3AreA8-+(?m'W(Eag/5BOQ!*GAhV?A0?)7Ebce6
Bkq9&?t<tmE*setF`\aIBQ&);DdmHm@ruc7Bl5&&@:O(qE-!W@$4R=s0J4JU4C;VRA9;F!A2,od
E-?&+FDbT%12pYZBQnB%5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*E,oN%Bm:b=
DBNe)@o$#G@;]Tu9PJBeGT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/FD5Z2+E)-?
FD,6,AKZ&>F*(u1F!,1<+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]%16'16r.0)
De*ZuFCfK$FCefrA26(Q$6`VgDe'u,Blmp,@<?''Ch[g*>psE)@r-:/Bl@m105>E9Ch\!&Eaa'$
Ch[g*Ch\!5Ch55<DJ(D+C2[X!Blmp,@<?'g+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$m
DJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$FCei4%13OO?tsUjCh\!&Eaa'$
?m'0)+CQBs8hWe46sV3SFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8
A1_b/B4W_F+Cf4rF)rI:Ec6)>+EV:*F<GOCDg#i*ATJ:f>AS"qATD4$AKYr4DeF*!D/F!)B3cp!
FEDI_0/%-UFCfK$FCfE3DeF*!D/F!)B.d\4D(fU@A7^!<BQS*-.3N\SE,]`9F:ARhDfQsm+Cf>#
AKZ&9DfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&-s$<1\QF!,"3@s)X"DKI"CEa`HnF!,F5DIdI!
B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$<1\M+C\c#AKWce+Cei$
AKY])F(K61Bln'4AKXKC8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+
/g*`-+E_R9EHPi/Gmt*s@:EeaF!,%&@q[!,@<63,@;]TuD..3kF!,1=+E27?F(o*"AKYK$D/a3*
AKYMpFCAm"ARlonBOPdkAKYZ#F*)>@Bk;>p$=\9'FE2;9Ch[d"+E)F7EZfI;AKZ/-EcYr5DBNV,
F*)>@Gp%$;+EV:2F!,(/Ch54.$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dRGr9DI2.q)HB6JS[
G]n1P11Dq[1GCL=?Tqj?;It#cF(HJ&DIal3ATMr9AoD]4A8-'q@rri(AS,XoBln'-DD!&(+?;&.
1*C:KFE2;1F^nun+Co2,ARfg)A7]@eDJ=3,Df0V*$6UH6FD,*)+CT;%+Co&"Bl.R+ARlomGp$LA
HXIt(I=5KU+B3#c+Co2!Ea`p#F!+n3AKYE!+D#e-AT2a*Df-\>D]hY"Et&I!+<YB9Ao)$gFD5Z2
+EM%+ASl!$@;]TuGA1l0+ED18E,9).FD,]5F_>A1@;Ka&8g%V^A7Zm&@<-F'DJ()6Df9H5+DG_'
Cis9&DJ'Cc+<Ve7C2[X!Blmp,@<?'g/e&-s$8O4V?p%dT1NmDPEAVepH$;&QD/FE00f<HOARTn,
?Tqj?8T&]_F*),/@<?''GA)7EF`(`$EaiHt+Cf(nEa`I"ATDi7+CJPa+DG^98l%htB6%p5E$0%,
D.Rc2@WH$gCEQ;Z<+T/SE,ol,ATMp,DJ(RE7W3;iDJs_AC3=T>%144#+CoD.-ZgJRF(HJ:DId=!
@UX:"@q]:k@:OCjEcW@;DBNS4Dfp"ADIIBnF"Rn/%14mD+CI<=2KW\DG\Jrf3-/nL1H.(+@;^(.
AN+$W@:)3++@C'aD.RU,F!,[@FD,T8F<Gd@Blmp-E+*6f/0JLVB.b<7:-pRND]j+?@:NjkAS>ab
+DkP4+Du+>+Cf>+DfQt>Ec5o.Ebp"R+B<JoEZeab67sC%E+*6f+E2..@<6!f/e&-s$8a@X?p%e*
203tOF_Z)1Gr0_fH$4:CGAB&m1M1-5?Tqj?;gE8&@<`o)Des?4Bl7Q+De:,9Ea`p+ARlomDg5i(
+D>>.ATD^%ASuF/F!+n3Eaa67+DkP4+Du+>+C\n)@rHC.ARfg7%144#+F\cg%144#+<VdL-ZO9I
FCeu*F*)G:DJ(=>4!5q9+>PVn1,'t.0JFpu4!6UG-ZO9IFCeu*F*)G:DJ+#5GA2/4+Du==ATDKp
F!hD(+<VeUIXV_5%14sF+CI<=ChPP?D_X.m13.LnBl,\DFuM-jDg,Z6?Tqj?;e^)_Cgh@#Gq:(^
Ea`p+Bl7Q+DJsE1Dfor=+EqOABHV,0DJ()'D.7'eA7]9oEHQ2AARlp)FE2)5B6,24@<iu5Dfd+3
Des?4+E2@>E+O'+GrcBA+<VeUIXV_5+<VdL+<XEG/g*_a6;B*e1E^1@ARfLsF_qQp+<VdL+<VdL
+C@)^+C/4pA8-+(+=CkX1LjrC%144#+<VdLBe_DRA3Dt$0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O
2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q
1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6
+<Vde3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I
1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1aaDm+FYFf+>Y,p+>Y,p+>Y,p+>Y,p
+>Y,p+>Y,j0-Dks+=Ait1,CaE2E*TU-Qm+U+C,E`+<VeUIXV_5+<Ve%:K0bD+A?]kB-;#)DIml3
@<,p%GB.,2E+NQ&@V'.iEb-A+DeX*%+EVNEE+*WpDdtCB<+oue+Ceht+DbUtA0>u4+E1b,A8bre
$6UH6@<6L(B5VF$B-:o+@:NeiEaa'$+EVO;ASuQ3FD,*)+CehtDJsV>@V$Z3ARTXoCj@KQE+*iu
BOt]s@:jUmEd(r4A90@G7VR)V$6UH6FD,6,AKY])Ao_I&F_,H4+E(_(ARfh'+EqOABHV/#DKTB(
+A?3CAQU'dA8-.,3ZrKTAKYB'GAL]0AU%g-GAhM4F'pU0$4R>M>@h\_/TboADd?`[$=\-lCh.:!
A8G[rAU#sb:-pQ_@WcC$A86$nCghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[NqFCeu*
8l%htF)Q2A@q?cV@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF+Co1r
FD5Z2@<-W@F!,"3@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1+Eh=:
F(oQ1F!,C5+E1b,A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL@q]F`
CERM5F`&<M<(KSZ:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9
ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB9
0Pt6D0JXbkAThd/ARlo3H?smPDe*]nBl7:"AU#X5$;No?+>PWf@<jR_+=MP^H>7A/D..-r/n/72
.3N&0A7]9\$;No?+>PWf@<jR`+=JpRCh7$mFCf\J@UX@-+CSekARl5W:-pQU1,*QRGqh9$A8-+(
CghT3@WcC$A0>>iF<G16Ec#6,FCeu*FDi:BF`%Wq:-pQU1,*TaFttot@:Wn[A0<:8De*3nG%kN3
?Z]k(.1HUn$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo@rGjn@<6K4
FDYu5De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#+?V#;5s]7(
A8G[rAU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%15is
/g+b;FCSu,+C]J-Ch+Z2FD5Q*FCfM9@;]Tu8l%htBl8$(Eb8`iAKYf'F*)I4$?U-(Ci<f+B4Z0-
4$"a0ART*lGB.D>AKYGnAoD^$F*)FF@q]:gB4Z.+EZdtM6rm#M+A$lO:IJo7FCfK)@:NkI<'a8I
5uL)n8U=!)7!*?cCi`NS5u'g6;FDX!H:gt$F`_>8FCfK)@:NkI<'a8I5uL)u%13OO:-pQU@s)g4
ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?
3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''A8bre
$4R>_Df9`>AU$@!+=DJ]H>7A/D..-r-OgCl$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/EcZ=FDf-\<
AThX*F(HJ)Bl[cpFDl2F+D,>(AKYl!D.Oi2DfTr@%14J'@j#l)GUGX8+AG-h;GUY.C2[Wi+D58-
+EDC=FED)=/14eHAU#R3$?Tj(4ZX]IHTE^"AU"XkFCf\[3Zogu0-bpp,BdX=F(oQ1,CY(d0./;4
0RHDf6rm#M.3N,6@;]^hF*)FFFCf\+$7L"78g&4eGUXbZEbTW,+CoD#/95ZIFED)=/13&lAU#R3
$4R>;67sBmATVEq+E)F7Ecu/.G9C^1FCf\>@;]Tu@r,^bEZf(6FCfK)@:NjkFCf]=%14J'@j#]5
FCf\E4ZX][5snOG?X[\fA7$HlATT%BC2[WiDg#i+G@,H'GUEq-BkCd`ATV?n4ZX]54=_q0C2[Ws
Amo1\Hn?p6-OgE$G'%;?4ZX]6BkCd`ATV?n+C\noDfTE1FE/KcHTE]rG'%;?.4f1F@:Nkj@:p#V
%15is/g+SAE+Not+CfP7Eb0-1+DG_8ATDBk@q?d(ARfgrDf-!kC1^maAN`'s004P)IP+3<8l%ih
DKKH1Amo1\;cH%X6pX^=/4k.[:IK;CDesJn<'a8I5uL*%8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=
%17#sFCf\[3Zr?aFCf\J-o*#@7O]l:AoD^,BkCd`ATVL.+DPLs@q@)?1*]I^%14M*Db;-jG'%;?
.3NhTBlmo/A8bs/-[L)RDe*d0Bk;K@FCf\E%13OO:-pQU8l%ht@r,RpF(KD%$>O'e4ZX]I3[\Z\
A8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5-OgE!FEfr0+D5_5
F`;/*FCf\D/j:Cm@r)S]%15is/g,4HF<G:8FCfK)@:NjkBR+Q.EcP`'+EV%4B4Z1+%16onGWe)1
C1^maAL;J0FD5>q@qBajEbBG?/j:CoFEe6%%15is/g,:XAKW@HH7'hSEb/isGT_*H+CTG3Bk/>r
CghBuATJu<Bln#2-YdR1-Qk#o04]!2F_t]-F<G10Ch7Ys$?Tj(Anc'mF$2Q,-p2$Y@jrNO-8%J)
-p/l'H7(-a/1)u5+DPD&+=nil4s2s8/p(ZL-Qij*CijnEGB.D>AL9#n+EV1>Anc'mEt&Hc$;No?
+D5_5F`8I4F_PZ&+C\c$@q[!+@rc:&F<E.XCghEsGT_-NBl%i5FD,*)+Cf>,E+s-"+D58'ATD4$
ARloqBl%@%%16id@WcC$A9;C-4Y@j*-SKonIV3\>F`;dSIP3'"Ec5l<FCf\G+Cf(nDJ*O%FE/Kr
9L;`N9LMiK=:GTcFDj]G;cFlSCgqO$Ch.X!GUXbZEbTW,+DP_%F_PZ&@UX@A/g+\C@k;Y=Dfg)4
GUt3p@UX@+%17/nDfp/@F`\`RF(f-$C`k)Q-S-ZV@W?O/FCfT7+DP_%F_PZ&@UX@-/12em-Ql/N
/g*tY7Nc2ZD/a3*AKYGjF:AQd$;No?+D>2$A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5+EV1>
05P'=AU#>>ASlB/Anc'mEt&I(Eap50G'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$mFCf](@UX@+
%14M*Db*Z&<$48L3\5/lF=A>VEbTW,+CoD#/13,*@r,^bDKKH7/n/72-OgCl$=e!aF`MM6DKI!K
@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$FCf8sFCf\P
0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbdsAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr
+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;ASrW4D]j.8
AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4F_t]23ZqpT
EcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G):-pQU+<VdL
+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._
67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp131,*QRGqgu^$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGqh&sF(fK9+E).6Gp"MMDe*ZuFCfK$
FCd(6@<<q-$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/$4R>P
De!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tD
C2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!@<?(*3B9)I
%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQU@s)g4ASuT4
E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\ktA8bp?3Zrc1
HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''A8bre$4R>T
Ec>o)D.Pjk+=CoBA8Gt%ATD4$AL@oo%15is/g+e<DImisFCcS-Ec6)>+DbJ.AU"XkC2@NoDEU$'
B6%s-BlkJ1Ec>o)D.O.`-ZW]N+DP_5Df9_?C2A!+FDPM2C2@g3Bk;K2C2@BuA7ZluCgqO$Ch.!`
F=044+DP_*ASqqa%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9GV<lAFCf\>
FCf<.+D,>(ATJ:f-ZW]O+Du@E-TsL59gM-E:L@OFDe*2tB4Z0--Y$t(@;^0uG[FogF=.M).!0Au
:K(484*s">DK^+N+Eqj?FCcS*Ddt=G0JI!QARTIuAU#h:@<<k+$4R>;67sBu@;TRlATMo8G%G]'
%14L>+?CW!.3NY@0H_ht+ECsH%16f]/g)l#3dDiYD_;J++<Y`BDfp/@F`\`RF(f-$C`k)Q-S-ZV
@W?O/FCfT7+DP_%F_PZ&@UX@-/12em-Ql/N/g*tY7Nc2ZD/a3*AKYGjF:ARgCia/?%144#F)>i<
FDuAE+=BTU;GU1O+D58'ATD4$Bl7Q+9OUn3=<K1Z+=B6`Ec>o)D.O.`ASu$2+<V+#.1HUn$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?<.AmoguFB*BnEbf63
F##UJ67sC'F(KB-AU/>L@qK?_$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`C3+<*FE_/6AM.J2
D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*XFDs8o05>QHAor6*
Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2AM81IATDQtH#kTJE,Z6n
:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.IUQbtDf0VLB45Xg
F"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT@WHC2F(J]n?RKN/
FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7-OgDX67r]S:-pQU
,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;:-pQU,"=L8%15is
/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA%13OO:-pQU87c[Z
GpdYU,%>\:F=hWJCj@3I3A*!@+EqaECLM7%F`(`2%15is/g*.t3\i]<-o!.n>9GpL3\iW:-Y-\,
F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK+Z_A;+=ANa+=nW`-mO0`><3lj
3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDX67sB@+Z_A=>qoPD+Z_A;-Y-\,F`&HY><*if1-&Vf
/1;]'3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=2C'sc$4R>31-73P;Is]RCLnVUF`MM6DKIrf
:.\/V+ED%1@;BEs@s)g4ASuT;%15IEEbm6q1-73P;e:%n6ZmEiASuTO-Vd6-:`sgjF<G(9EcP`/
F=.M)6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:
Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l
.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9$+Z_A=>qoPD
+Z_A;-Y-\,F`&HY><*if1-&Vf/1;]'3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=2C'sc$:Zp8
0fr?GF*&O'D/X3$4"!cp9i)sRD/X3$+EV19F=.M);eTlWF=Tg=4#&frATMr96=FqL@ll&58PN#(
@UX=l@j#l)F*&dCBleB7Ed;D<A26(N$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@GmZ\t4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs,Z,9nEU0eP.41,9t(+=MGJE%),$+=\KV?t!Mf?moH"C`m1q
@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuulC2[W8E+EQg$47n*+<Y'7F(JlkH!hb=@<3Q*DI[U*
Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1FE9&W$47n*+<X'dEb/a&+CKPC
?m%'S/g+PMI:+1.AS,XoBln'-DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg+<V!u,9nEU
0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&V
Bln'-DCGo"+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>
Df9G7F`:l"FCeu6+EM+*3XQ3:+<Ve2<HDklB-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$
AM.\9H#@(?$47n*+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc
@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?$6UH6+B3#gF!,1<
+CQC%Df9D6G%G]8Bl@l3De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D
+EM[EE,Tc=$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*@rH=3/g*_t
+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEsa$4+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%VDf-\0DfQt.
8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.:./Is$6pc?
+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!2$6Uf@?tsUj
@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/d`^D+<V"6+<VeJAS!nF?tsXhFD)dEIP5,?
A8c@,05"j6ATD3q05>E905>E9A8bs*?j[5`+<Ve,F(Js+C`m>.EZfF7FED57B-9uK+DG>(DK?qB
BOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Re,+=\KV.!&sA@WcC$A7TCpF"&5KDe*QoBk:ftFDi:3
Eb/[$AKYDtC`mh5AKYMtEb/a&DfTQ'Esa$4+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!
A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#Bk;>m+<VdLF(KH8Bl7Q+F`8I@ATo86@:NtbDIml3
AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:8Gu.NfjA@:WnbDdd0t@rc:&F>7/GDJs_ABl8!7Eb0;7
F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'o=t+<Ve?@<Q3)?nQ/.F'p,%G][M7
F(oQ1F"SRB$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU
@<6!/$47n*+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."
Df-\+ChsG$+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7Dg*=BDBMPI
6jb%Z+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"ReB
+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/d_q..Nhr'@V97o?m&'aE-ZP:EZe%a@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E403*(-DJ(7N
0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OVWk+=\LTDf'&.D.-ppDf[%0DIal3ATMs7+CSeqF`VY9
A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI2$6Uf@DIn#7?t*b[FC655ATMr9@psFiF!,17+A,Et
+EMIDEarZ'A8,OqBl@ltEbT*+/d_q1,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC$47n*+E1b2
@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88DIal!AU/33
A1e2r+=\LA9gMlV5tsdU+DG_'Eb/[#ARlp*D]gbi3$;gRDf$UT0J4JIBPDN1E+*cqD.Rg#EZek1
DKKo;Ci^_@BOr<'@<cL'F_qI.+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(
Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb2(f4C+=\KV
?ug*l/0J>@FECn5@:X+qF*(u(+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpC$6pc?+>>E.
/ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps(-+=\LAEd2Y5+DG\3Ch7Hp
DKKH#+>"^WARuulC2[W8E+EQg$47n*+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0N)Ip
F_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1-D).Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+Df0V=De:+a
:IH=A@:F:#F(JoD$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%G',9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n
/0H]%0fTLI+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg$47n*+CJc&?m&lgC3=T>
ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMcn+=\KV@q]:gB4YTr?u0I`/0J>8De*d(
?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s$47n*+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)
Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLs
DfRH;$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[
A1eujCht4d:IH=B@:O=r$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$A7ZltF!+m6
CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e,+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=
+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT=$6pc?+>>E%/ibpL+>"^1@<itN
3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1-D).Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE
?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2"$6Uf@Anc:,F<F1O6m-M]
Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4
G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/d_q1,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9
De:+aF)PZ4G@>N'+@f"&+ED%4Df[?7$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$
4"#JD9M\/+?m&rm@;]^hA1eu3+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,AKZ#3Dfd+6
DerrqEcW@IATD?)AU&0&DId<h$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?
Ch[s4/g+,,BlbD;ATN!1FCeu*Bl48#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO6+<VdL+<VdL$4.#<
AQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^slG\q7LBkh\r
+<VdL+<VdL$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>+D#e:@;]Ue
A0>o(F*2;@Bl7Q+Bl5%#+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@$6UH6+<VdL+:8D]<+T0DE`[4)
D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A$4."G+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08
?m',kDIdQpF!+n%A8c@,/d`^D+<VdL+<V!t$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TL
DfdUGC3'_)+:95@+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4
+EVNE8g$)G0K1+_Eb,S#+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=mn-+=\LADIIBn@psJ#?m&rm@;]^h
A0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=/d`^.+<VdL+<VdL:-pQU-td@7
@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC(+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%
DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgk+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B
+?CW!$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=-F+<VdL+<VdTAp&!$.6T^7>9GF=0H_hf
>m_\s+<VdL+<W*?#mgq].Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%
@:Wn[A0>u4+CK(qD.R3cFE:h4FDhL/+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2/g+,,AKYT'
Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:956+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%ht
GAhM4F"ReB+<V"6+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q$6UH6
+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^M:-+<VdL+<Y34
4Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:'r*d+<VdL+<W(CDCI_0+Cno&$4."G+<Ve+BOr<*Eb0E.
Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct@rH4$ASuU2
$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+:/>]+<VdL
+<VdL+<V"9,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKFH+=\LAATV<&@:X+qF*(u(+EVNE
@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%h^+<VdLBl5&$C1D1"F)Pl+/nK9=
?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'o=t+<VeKD]j+4AKYZ)G9D!G+Cf>-
Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:8Gu+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1D
AKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJq+<VdL
+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&
EZccF@rH7+Deru9AU%c8$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,V
Bl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H$47n*+<Y',De(J>A7f3lF`:l"FCeu8
$48"&,9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALRrn+=\LAATV<&@:X+qF*(u(
+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_++<VeFE+Np.+DG^9?u]pq
A7]-kARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCeti+<VeKD]j+DE,]`9F<G[=
BlbD/ART\'Eb-j1+<Vd6+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAI9P&+<VdL+<Y6++=DAOEb'&r
D.P(%+<Vd6$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9:F+=\LADe*5uEb/ZiC3=T>ARlo8
+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vc+<VdLD..]4DJsV>@;L-r
H#k*>G\(B-FCd'3$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT6D+<VdL+<Ve%67sBQ:IH=GAS5^u
FE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,O^+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;
C2[W1$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=AND+<VdL+<VdLEb/lo+=D;RBl%i<
4""N!05>E906MANCi_6W$6UH6+<VdL+<VdL+<VdL/hSb/$48"&,9SZm3A*<O2'=In6$6g_F*&Nb
/0H]%0f9:F+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5
?m''"EZen(FCAm"F"Re,+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo
@ruF'DIIR"ATJu+DfQt.@W$!i/d_q..Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMcn+=\LA
De*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@
B4YslEa`c;C2[W1?nMcn,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?$6UGu+=\L"+Dtb7+EV%)
+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62
$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*l
De:,$ASH$p+EM47Ecbl1ARmD9$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psIn
Df.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EXEp3+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,
F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+$6UH6Amo^&
Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k
+EVN/+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:8Gu.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8
DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfB$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6
Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/d_q..Ni,1A7-NtDg*=;@;]UlATJtBDIIBn/9GHJ
F=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:8Gu+<VdL+<Ve%67sBmATVEq+C\bhCNXS=
G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hd
Eb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?d+<VdL+<VdLARlp$@rr%b+<VdL+<VdL:-pQUAn?'o
BHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-
4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OLt=+<VdL+<Y6++Dt\2$47mu+<VdL+<XEG
/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBlj\)+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<
?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8]8+<VdL+<VdLARlp$@rr%b+<VdL+<VdL:-pQU
An?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBlj\)+<VdL+<VdSEap50@rs(]
3Zp+!0ea__ATT&C/g+\BC`k*GAL@g-+<VdL+<Ve<A0>c"F:&?^,9nEU0J5@<3B&`:/KdZ.Cj@-[
/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1-D).Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh
+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN/+<VeJF`;;<Ec`FGBl.F&
FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--..+<VeNBln#2
?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VDm
+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Esa$4
+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(
GmYZ:+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V!u+<VdL+<VdL:-pQU
DIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FB
F<Gua+ED%:D]gDT$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT6.+<VdL
+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.
Anc:,F<GUBG9C=3A-sG%+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[P
D.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(m$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,Oq
Bl@ltEd8dLBl.F&FCB$*F!(f4+<VdL+<Vd\+C?i[+E2IF+EqpK+:956+<VdL+<WE^?SOA[E-67F
B682;+:956+<VdL+<V"6.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'
ASrW!A7T7^+EVNE@rH7,Ec5b$+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.
AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:956+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIaku
E,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.$6UH6G%#30AKY].+CHm2/g+P"78uQE
:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0$6UH6DJsV>AU%p1F<G:8
+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCu8=+<XWsBlbD,@;[2sAKYJr
@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#e!+<Y*1A0>o(
Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?j\#!+D,P4
+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:956+EV:.
+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M$6UH6$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=C
F`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)$47mu+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)
+EVNEA9Da.+EM%5BlJ08$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O$47mu+<VdL+<XEG/g+\I
D/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)$6UH6+<VdL+DkP&AKW?J$47n*
+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/d`^D
+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c($6UH6
AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6
$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/ARlok
C2dU'BODrpDerrqEXEp3+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'
Bk)7!Df0!(Gp$^;Ch.*tF"ReB+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%
DIal6Bl%T.DJsV>AU%p1F<G:8$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:
F(oQ1/g)8D$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8
F(KH8Bl7R)$47mu+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrq
EXEp3+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F$47mu+<VdL+<XEG/g+e<
DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cg+<VdL+<VdLD/=89
-YdR1B6%p5E,K*$AL@fl+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0
@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8$47n*+CK87AU%T*@;]Tu?u0q0?m'K$
D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??j\#!
+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?j[5`.Nh)sA7ZlqDfT]'FD5W*
+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et
/d_q1,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!2$6Uf@8l%ht
Cggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<:$6Uf@9keK`EZek*
@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Re,,9nEU0J5@<3B&'4+AH9b
@qZu?1+XP'0JPEl$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1
DBN=V;FO#Q:dIH;?m'0)+F7U>D_;A>+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.A
DBNh.FE_YDCERe=CisT+F!+n/A-sG%+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM
$47n*+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<:
$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3
DBL_j+C]&,$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.$47n*+CJ/[F*'fa@ruF'DIIR2
7!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,d+<VeC@<-!l
+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',
F"SRB+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!
G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n0+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1-D).NhW#G%l#3Df0V=D.-sd
+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56$47n*+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGu
DeC23Df^"-+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTe+<Vd6,9nEU
0J5@<3Ahp2+A-coAKW`c/0H]%0f04E+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OB
FCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@$6UH6+<VdL+:956+<VdL+<W%>FD,B0+DGm>Deg^`
3Zoq\/RU%N$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH'd+<VdLFD,B0+C]J++ED%7F_l/2A0>T(
+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Re,,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f04E
+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Re,,9nEU0J5@<3AVd0+AQiu
ASkmfEZd+m/0H]%0f'.D+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5
EZfO:Ed8dDDf021DIIBnF"ReB+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#
D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB*ob(+<WEs2'?CB@<,ddFCfK6/g(K.,9nEU0J5@<
3AM^/+AH9b@qZu=0e=G&0JP?j$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.+?MV3GAhM4
+Dbb5F=1H=Eb0*+G%G_%+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!
A0>o(A9DBnEsa$4+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;
AT2[$F(K62@<?4%D@.L/+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(
F!+t2D/Ej%F<G(0F`__:E\7\+,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1C=I3.Nfj+:IH=H
Dfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V
/d`^D+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H$6UH6+:956
+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!
Ch7Yp+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0
De*QsF'p*t+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-
FCB&t@<,lc+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;$6UH6+<VdL+:956+<WEl
+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&$6UH6
+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.$6UH6
+<VdL8l%htD..=)@;I&oC2[W8E+EQg/d`^D+<VdL+:95@+AR&rATD^3F!+(N6m,]XDfTW-DJ()&
Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN$6UH6@<,p%
DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:956+:95@+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"
Ci"$6Bl7Q+E+*cqD.Rg#EXEp3+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpR
FD5Z2@<-'nF!(f4+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$
F<DqY?m'DsEa`frFCfK6/g(KD+<VdL+<Vd6+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qia=+<VdL
+<Ve;E-#T4+=BHR6V0j/2((I?$6UH6+<VdL+:95@+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I
?m&luB6A'&DKI">E-,f4DBO.:ATD>h+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdk
AKYA9+?1KSBle59I4f/QE$m#@+:956+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqB
C3=T>+Dbb-AKV=&+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(K.
+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AI9P&+EMXFBl7R)+E(j7
?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AI9P&+Co2-FE2))F`_2*+A,Et+Co1r
FD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgW
IT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:956+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5
/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!]8+<Vd6+=\LA
DKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7
F*)G:DJ()4AT2Ho@qBLgDKKq,+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuul
A8-+(+=D8BF*)JFF^c_+/.*LB+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(
BOqMn+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5$6UH6Eb03+@:NkcASuT4
E+*I$F"ReB$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.D&+=\LAD.d6-
+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.
CiEs+Esa$4+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9
C2[X%Ec5Q(Ch555C3*c8+:8H#,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<$47n*+CJr&A8Gt%
ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-$6UH6@;]TuFD,5.
@Vfsq+E27?F<FddASl-59PJT[Eaa'$$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"N+<Ve=DfQt2ATV?pCi]pj+=\LA9gMZM
6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD#+<Vd6+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60
@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/d`^.+=\KVD/!m+EZeb)
De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK$6TZu.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%
DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!.+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3
Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]$6UH6Bl7EsF_#3(B-;;0BlbD-De!p,
ASuTB>@'$i$48"&,9SZm3A*9F+>"^.F_l=G0et:&1,(F<$47n*+Co1rFD5Z2@<-W9A8bt#D.RU,
F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ$6UH6@;]Tu?o9'>ATT%B-X\'*
Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&(+<Ve@F!+t2DKKo;Ci!Zn
+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?j\#!+EV:*F<G+*
FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqMn+<Y3+Amogu
F<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPF$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3
E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.*LB+B)'0:I@EA7:1@J/0K"PE-680H=(&&
@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqMn+<Y65A0>f&+CoV3E$043EbTK7
+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Esa$4+DG^9FD,5.H6@$B@ps1b3ZqgF
De*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?j\#!+CT.u+CK8(Dg-//F)t]7?XPJn
$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ"+<Ve=
Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs-+<Ve7
;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd
?j\#!+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2
D@.L/+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6
F!(f4+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.
FE_YDCENs,+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMt
AnGUpASuT4$6UH6@:NeYF)rIC@<?1(/g)8D+<Vd6+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4
+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R$6TZu.Ni,6De(J>A7f3l-td+/ATD3q
05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8$48"&,9SZm3A*6J+>"^.F`(b51,^[+1,(F<$47n*
+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@.L/+ED%5
F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF$47mu+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9
A7TUg05Y--DJsW.F"VQZF:'-5+:95@+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,
ARlolF!+lu+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt
$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl,j+<Y-=+CJr&
A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.$6UH6Df0B*DIjr6ATDj+Df-\9
AftJrDe(J>A7f4%+:956+:95@+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(KD$6Uf@Ch[cu
+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7LC7F+=\LM@:F:#F`:l"
FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Esa#s+=\LM@:C?eC2[X%Eb]GDBkh`t
+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums
+DkP)@:s.l/g(KD+:9><,9SZm3A*65/KdYoDBLYl/0H]%0ej"B+=\LAC2[WpDfTW$+Du+A+Cehr
Ci^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h$6UH6Bl5&1@;0U%8g%qa@WGmt
GqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh3q\,9nEU0J5@<
2DlU/+@KdN+>Gl-+>PW*0a\71.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!
Df0!(Gp$X9@s)X"DKK</Bl@lA$6TZu+<VdL+<Vda+D58-+=ANZ$6UH6+<VdL+>k9\F`\`RA8bt#
D.RU,+EV:2F!,"-@ruF'DIIR2-Qia',9nEU0J5@<2BXRo6tKjN0et:&1,(F;$47n*+CJr&A8#Oj
E*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?j\#!+@T+*/0In\=<M$i
A0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8!7+<YcE
+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%$6UH6@<,p%@<Q'n
CggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[$6UH6;e9M_>?#9I+A,Et+AcKZ
AR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/d`^D+:95@+CJ\t
D/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0('+<Ve@
DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdTY'
+CT.1AU&01Bk(k!+EqaEA1e33+<V"9,9n<b/ibOA+>"^(ARci>/0H]%0ej"B+=\LGBm=3"+CQC#
D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsG$+<Y64E--@JA8,OqBl@ltEbT*+
+D,%rCh7-"FDi:=@;BF,$6UH6$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'
DfTl0@rrh#+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0=G+<V"6.NiSHEb-A8
ATMr9@psFiF!+n%A7]:($48"&,9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej"B+=\LVE+EC!AKYAqDe*R"
A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@kr+:95@+D,>4
ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4m+<VeK
BOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-)+<VeK
BOr<*@<?08$6UH6$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/d`^D+:9><,9SZm
3A**1/KdZ.DBLYg/0H]%0ej"B+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.
DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7d3+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2
+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ1-+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;
+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohM+<VeFAnGjnDIjquC2[W8E+EQg+EqO9
C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*$48"&,9SZm3A*'0/Kdbr
Gp"k&/0H]%0ej"B+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKXZ\
DKU1HG%G]8Bl@kr+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znb:+<VdL+<VdLIUQbt
Df0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:&?t.NiYICh[cu+CoD#F_t]-FCB9*
Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.*LB+D>2)+C\nnDBNG-DK]T3FCeu*
FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[C+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"
F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;#+<Vdu+CT+0F)5c=Cj@.8Bm=?0B-;;0
ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:956+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KD
DImoCF(f!&ARmH,@;9Cs2)&ZQ0I[>O+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.
Ch7Z1@Wcc8BlbD<FD5Q-$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*
Cht5&@W-C2/d_q..Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpV
+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1.1?
+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:8Gu.NihHBlbD?ATDj+
Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@$6UGu,9nEU
0J5@<0d&%j9jr;i2_6(,0JP9h$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?
DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<:$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0a\71
.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@.L/
+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/d`^D+:95@+ED%4CgggbA0=K?6mm$u@!Z3'Ci<fl
Ch4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+<4+<X9P6m-AcG9CF-Anc-oF!,C=
Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8
BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjU+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9
?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AI9P&+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)"(
+<V"6.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5
Bl@m1/d`^.+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje
/g)9EC2[W8E+EQg$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6
@;Ka&E+*6l@:s.(+CJr&A1hh3Ambrg+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!
?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?j\#!+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;
DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfT_+<VeCDe!3l+AbHq+ED%%A8,po/d`^D
+:95@+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/d`^.
+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&
1,pCgDfQt.<E)FI?n!]8+:95@+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10
F_)[N2D-*p$6T[#,9n<b/iYI;+>"^3@rrhL0e=G&0JGHn$6Uf@@:Wn[A0>c$G9C:.De*fqEc#kM
Bkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA,#+<Y3;D/^V0Bl%@%
+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/d`^D+B3#c+CT>$Bk]Oa
+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn#+<Ve;F_u(?Anc'mF!+q7
F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6$6UH6$6Uf@?tsUjF)Q2A@qB$jF`V,8
+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:956+ED%(F^nu*FD,5.
F(or3+E(j7FD,5.A8c[0Ci<`mF"ReB+<V"6.NiSBDJsP<AncL$F!,17+CJr&A1hh3AmbrQ,9nEU
0J5::1E\7l:LeJh2_6(,0JGHn$6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$
AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?j\"`+=\LGBm=3"+CQC)
ATo8=H#R\C+DG^9?tsUj/oY?5?j[5c,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHn$6Uf@@rH4'Ch7^"
A0>E.@:X(^+Cei$AKYo'+CJ_u@pfWd$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr
@;]^hEs`7!,9n<b/iPC;+>"^7AT/bI1b9b)0JGHn$6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKK
Bl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3$6TZu.NibCE,8rmARloU
:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7C1(sj/oY?5
?j[5c,9n<b/iPC:+>"^7AT/bI1b9b)0JGHn$6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE?tsUj/oY?5
+CGO!$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35
+D#(tFD5Z2$6T[#,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHn$6Uf@D/!m+EZf+8A0>r'EbTK7+D#(t
FE7d3$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:94u,9nEU0J5480d&%j8p+qm1,1=&1,(CA
$47n*+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl,j$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlot
DBN>%De(J>A7f3V+:9><,9SZm2(gR*/KdZ.C`kGl/0H]%0K9CH+=\LAC2[W8E+EQg+CoD#F_t]-
FCB9*Df-\-Df'H0ATVJj+:9><,9SZm1bLI)/KdZ.C`kGd/0H]%0K9CH+=\LJDKBr@AKYE'+DbUt
F*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq$6TZu.NiSBDJsP<CggcqARoLsF!*%W
Eb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bi+:9><,9SZm1G1X0
/KdbrGp"mt/0H]%0K9CH+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@kr$6pc?+>>E(
/iOn)+AH9i+>Y`'+>PW)3!p!8.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9
D@-^q,9n<b/i,+<+>"^1@<itN3@l:.0JGHn$6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:Wne
DCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhu
DKTB(Cj@.;DKBo.Ci!Zn+C]U=$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'
@;]UlATJtd:IH=>DKBo.Ci"/F$6UH6$6T[[?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0
Ecbl'+EVNED..=-+D,P4D..O-+EqOABHRX)+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.i
Cgh3m/oG6B05t?;A8bs2.4trM+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]Tu
E,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XQuP+<VdL+:956+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0
DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9PoDe*3nG%kN3?Z]k(1,:-u@WH0oAfu#8
ATDs.ATo88Afu2/AKXT@6m-PrF*(u1/g(T1,p7DFBl%?'@<6L.@qf@nARlp-Bln#2FD,5.8l%ht
B6%p5E$079BlbD8G%G];Bk;K2%14C(@;p1%Bk;?.FDi:DBOr;tDKKT5AKXT@6m-PrF*(u1+EM+*
+EV:.+DkOsEc3'K@WcC$A86$nCghEsGUX(/%16?]ARfgrDf0no:IH=$G%G];Bk;L:%13OO8l%ht
-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBtBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;
GA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV,DhA7TUrI4bs9%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4
A7]jkBl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHW4Zi+A,Et+AcKZAUQ0R%144_F(96)
E--/8H=[Nm+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37
/T>-2AM8H@$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I="q,AKXT@6m->TDKTB(+C'#"G]\%LHYRJ0
/oY?5I=3^W$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A7TUg04Ja9@P;S,F*(u605>E9/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/%13OO
>]Y$sF(Jj'Bl@m98l%ht<HD_l+A$HmATDBk@q?caDfTB0I16Mm$<(k[AKYo'+EV:.+DG_8ATDBk
@q?d,DfTB0+Dbb5FCeu*BOu3q+CT;%+Du+>+CoD#F_t]-FCeu*Bl5&8BOr;kBQ@ZrHY@MCE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I="R^6m->TDKTB(
I4cWO$:n`R/0K"QEbTE,Ch[d"+EMIDEarZ'@rGmh+EqOABHU\jF`(`.@s)X"DKKH#+D,1nFEMV8
F!i=X@;]Tu?slE3F*(u6+@TpUF!i=XAoD]4@<?U&DKKT9AKZ#)@:WqiEt&IjF!+m6Ci=3(F*(i.
A8,po+EMI5FE_/6AKYMpG%GK.E,B0(F<Fh"D/a08ASuU(@qBLgDKL:Z%13OO,p6f<Ci"$6Bl7Q+
@rGmh+D58'ATD4$ARlomGrd'[DfT]/Amo1\FCf\>004P)IP+3<8l%ihDKKH1Amo1\;cH%X6pX^=
/4k.[:IK;CDesJn<'a8I5uL*%8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=%14C(4=_q0C2[WsAmo1\
Hn?p6%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$DJOT-
@Wm0H>Y]3XD..6[Dej].@Wik:+<VdLI=5=)E+*BjEb/j0BkCj9@:FD.>p*B>Df'?&DKJirCO9K+
C`m1q@r$4++Eh=:F(oQ1+DtV)ATN8/$=%7iE+O'+Bl7^5@:Wn]Ec?GR>Y]3XD..6[Dej].A7T=n
E$-8GI=5=)E+*BjEb/j0BkCj9@:Wn]Ec?G4+C%9PD/Ej%FB!0oHXUGq+EqaEA90DGATMs7+EVNE
B6%p5E%c9TBlmp7%16?RH#R>8Ch[d&HXU`,DIIBnF+&C?:2b/i@;Jn]CO9K+Ci3ZuATJuBI9Trq
@:s.lAS-:'An*l1Ci!utD.Rd:>p*B>Df'?&DKJirCO9K+C`mV(D.Rc2Ao_g,+E_a:F#kEd@;Kat
@;TRs+>Y_pF`V,8+=D&8D.P)C%16?RH#R>8Ch[d&HXU`,Eb/j(I=#3oDfT]'CfG=gHXU`,Eb/j(
+<Z)\>?l,UB4Z*pAp\6(@le%7CiX*!F+%=:>XNFHD.RU,<,ZQ!@;Ka&DJsE/De!3lAKYl!D.Oi1
AS,LoASu!hF#kFPCi"-'Aof(V3[\rZFEMVA+DlBHEb/ioEb0,uATK5I%16?RH#R>8Ch[d&HX^W!
FFAL@:2b/i@;Jn]CO9N'ATT%;+<VeTI9Trq@:s.lAS-:'An*l2B4Z15>p*B>Df'?&DKJirCO:)5
FE2),G%G_;DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;DM%16?RH#R>8Ch[d&HX^l/
I=#3oDfT]'CfG=gHX^l/+<VdL+<Z)\>?l,UB4Z*pAp\6(@le(:CjfS3>XNFHD.RU,<,ZQ!Ch[s4
+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8d<@<>pe@<6!&@UWb^F`8I8Bl%@%I16NgBR+Q.EboH-
CO9Q0D/a6<HX'<aEc#6$<,ZQ!@rH4'C*4WA+FSZB>]=+aATD?oHYI)%3b*)FE,'f,+C%9PD/Ej%
FB!0oHXgu2E,oN2F(KD8DJsE1Dfor=+C]U=Eb0*+G%ki,+EqL5FCcS9E+*6f+CT.u+EM47Ecbl1
Bl7Q+Ci<flC`mG&ASuU(AnbgsF+"K)>\JD%ATDU$DJOT0AUSo1:2b/i@;Jn]CO9T'+<VdL+<VeT
I9Trq@:s.lAS-:'An*l4AURi,>XNFHD.RU,<,ZQ!A8-+(CghT38l%htEb0<7CigeDBln$,F`\aH
ATW'8DBNG-A7^/u$=%7iE+O'+Bl7^5A7]S*HX'<aEc#6$<,ZQ!A7]R"+<VdL+FSZB>]=+aATD?o
HYI)%3b2f<I9dt#6Z6gYASuThDej]1ASbq"ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYd
AKYT!Ch7[9%16?RH#R>8Ch[d&HXp](B6%s>HX'<aEc#6$<,ZQ!A7]RiEc<-D+FSZB>]=+aATD?o
HYI)%3b2f<B6%s>>p*B>Df'?&DKJirCO:)5D/XT/+EqaEA90DGATMs7+D,Y4D'3J3Dfp#?06;8M
FCfNA%16?RH#R>8Ch[d&HXpi$I=#3oDfT]'CfG=gHXpi$+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.7
A:7`+>XNFHD.RU,<,ZQ!A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*A0>r8@<?4)FD56+I16Ng
BR+Q.EboH-CO9T+F)ZPS>Y]3XD..6[Dej]1Ble59+<VdLI=5=)E+*BjEb/j0BkCj9A8-+(I9dt#
6Z6gYASuThDej]1Ble60@<iu+Bk)7!Df0!(Gp%$7C1UmsF!+n4+EV1>FF=T*>\JD%ATDU$DJOT0
DJX`J>Y]3XD..6[Dej]1DJUF<+<VdLI=5=)E+*BjEb/j0BkCj9A8Z43>p*B>Df'?&DKJirCO9l3
F*&OC@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&HXq&)I=#3o
DfT]'CfG=gHXq&)+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.=@sqW*>XNFHD.RU,<,ZQ!AoD^,@<?Q5
A8bt#D.RU,+EV1>F<G^IBl7Q+FD,5.@rH7.ASuU(Df0V=De:,6BOr;7A8bsfF=A>UATD7.%16?R
H#R>8Ch[d&HXq):ATW?I>Y]3XD..6[Dej]1E-#T4+<VdLI=5=)E+*BjEb/j0BkCj9A8lU$FF@F;
>XNFHD.RU,<,ZQ!F(KG9A8,OqBl@ltEd8dH@<,dnATVL(F+"K)>\JD%ATDU$DJOT1A:8f0:2b/i
@;Jn]CO9W'+<VdL+<VeTI9Trq@:s.lAS-:'An*l5A:7`+>XNFHD.RU,<,ZQ!ARoLs+Co1rFD5Z2
@<-W9DdmHm@rud?%16?RH#R>8Ch[d&HY%;IHX'<aEc#6$<,ZQ!ATT%;+<VdL+FSZB>]=+aATD?o
HYI)%3b<D]>p*B>Df'?&DKJirCO9W'BlkJ>AU&<F%16?RH#R>8Ch[d&HY.>1DLHk::2b/i@;Jn]
CO9Z7ASrV5+<VeTI9Trq@:s.lAS-:'An*l6F(K6;>p*B>Df'?&DKJirCO9Z-EcZ=FA8bt#D.RU,
+EM+3FCf?"AUP!p>\JD%ATDU$DJOT3A7]_$I=#3oDfT]'CfG=gHY6l#E-!-E+<Z)\>?l,UB4Z*p
Ap\6(@le75AT2^=>p*B>Df'?&DKJirCO9]7Dfp"A@;]TuF*22=AKYMpE+NotASuU2I16NgBR+Q.
EboH-CO9]*FFAL@:2b/i@;Jn]CO9]*F<D\K+<VeTI9Trq@:s.lAS-:'An*l7ATW?++C%9PD/Ej%
FB!0oHZE\>EbT*.ATJu4@VTIaFE8R:Ec5e;A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF+"K)>\JD%
ATDU$DJOT3ATVs;I=#3oDfT]'CfG=gHY6o3Ed/]L+<Z)\>?l,UB4Z*pAp\6(@le76FE2VS>p*B>
Df'?&DKJirCO9]*F<GU8EHPu9ARlp*D]iV9ARfk)AUP!p>\JD%ATDU$DJOT3Ci<d(I=#3oDfT]'
CfG=gHY7/5@WNY7+<Z)\>?l,UB4Z*pAp\6(@le7=Ddmd9>p*B>Df'?&DKJirCO9K-@;L48ALnsE
AT2R.F<G"0A0>r8DfTD3B5DKq@;I'(@;TRsI16NgBR+Q.EboH-CO9]7E.*(<:2b/i@;Jn]CO9]7
E$-8G+<VeTI9Trq@:s.lAS-:'An*l7Ec?G4+C%9PD/Ej%FB!0oHXh)-@<?''@;]TuD/Ws!ApGM3
Ec6)>F+"K)>\JD%ATDU$DJOT3FFAL@:2b/i@;Jn]CO9]9+<VdL+<VeTI9Trq@:s.lAS-:'An*l7
FF@F;>XNFHD.RU,<,ZQ!B4Z0-8g&1bEbTK7+EV1>F<G19Df$Uh+EV13E$/\*Eb/a&DfU,O%16?R
H#R>8Ch[d&HY@57DJX`J>Y]3XD..6[Dej]5CiF9.+<VdLI=5=)E+*BjEb/j0BkCj9BP_X*CjfS3
>XNFHD.RU,<,ZQ!A8-+(CghU1+EM47Ec`F7ATM@%BlJ0.Df0V=De:,1@VTIaFE8RCDBL?Q.=DX4
>\JD%ATDU$DJOT6De*9hAUSo1:2b/i@;Jn]CO9f7A79+^+<VeTI9Trq@:s.lAS-:'An*l:De*9h
AURi,>XNFHD.RU,<,ZQ!A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a:IH=D
@VTIaFE;j>$=%7iE+O'+Bl7^5C2[WrASc=6HX'<aEc#6$<,ZQ!C2[WrASc<.+FSZB>]=+aATD?o
HYI)%3biSDBOu"!I9dt#6Z6gYASuThDej]1Ble60@<itf:IH==ASc=6%16?RH#R>8Ch[d&HYd>C
HX'<aEc#6$<,ZQ!ChFk5+<VdL+FSZB>]=+aATD?oHYI)%3c&GW>p*B>Df'?&DKJirCO9o,CLnVs
DIal+Ddd0!8l%htB6%p5E.&0&>\JD%ATDU$DJOT8De!F#E.*(<:2b/i@;Jn]CO9l9@qTh$+<VeT
I9Trq@:s.lAS-:'An*l<De!F#E.)"7>XNFHD.RU,<,ZQ!Ch[s4+D5_5F`;CE@;]TuF*22=ATJu<
Bln#2DIIBnI16NgBR+Q.EboH-CO9o,CLqp@>Y]3XD..6[Dej]:@;BEs+<VdLI=5=)E+*BjEb/j0
BkCj9D..3kI9dt#6Z6gYASuThDej]:@;BFq+A*bt@rc:&FE;j>$=%7iE+O'+Bl7^5D/=9AHX'<a
Ec#6$<,ZQ!D/=89+<VdL+FSZB>]=+aATD?oHYI)%3c/\SI9dt#6Z6gYASuThDej]:@;BEsCi<`m
+EM%5BlJ0B%16?RH#R>8Ch[d&HYmY:I=#3oDfT]'CfG=gHYmY:+<VdL+<Z)\>?l,UB4Z*pAp\6(
@leIECjfS3>XNFHD.RU,<,ZQ!Ch[s4+E(_(ARfh'+DG^9@;Ka&Eb/ltF*(u6ARlooBk)7!Df0!(
Bk;@6%16?RH#R>8Ch[d&HZ!D=A:8f0:2b/i@;Jn]CO9r1G@Vg=+<VeTI9Trq@:s.lAS-:'An*l>
ATq[5>p*B>Df'?&DKJirCO9Q3ART[lF!+m6DIn#7A8,OqBl@ltEd<'B$=%7iE+O'+Bl7^5DJs*2
E.*(<:2b/i@;Jn]CO9r;AU&/:+<VeTI9Trq@:s.lAS-:'An*l>De404I9dt#6Z6gYASuThDej]?
ATW'8DK?q/+Dbb5F<GL6+E(_(ARfh'+EqOABHV22+D#e:Cgh3iFD5Z2F+"K)>\JD%ATDU$DJOT:
DffW4E.*(<:2b/i@;Jn]CO9r;FD#W5+<VeTI9Trq@:s.lAS-:'An*l>DffW4E.)"7>XNFHD.RU,
<,ZQ!GAhM4F!,CA+EV19FE8R:Ec5e;.![6aFD,*)+CT;%+Du+>+DG^9B6%p5E-!.?EZfFGBlmp-
I16NgBR+Q.EboH-CO9r@I=#3oDfT]'CfG=gHZ!pJ+<VdL+<Z)\>?l,UB4Z*pAp\6(@leLLI9dt#
6Z6gYASuThDej]2A8--.@3BH!G9D!=F*&OG@rc:&F<G^IBl7Q+8l%ht@rH7.ASuU(Df0WE%16?R
H#R>8Ch[d&HZ"%UHX'<aEc#6$<,ZQ!DKd3G+<VdL+FSZB>]=+aATD?oHYI)%3c9.i>p*B>Df'?&
DKJirCO9W'BlkJ++Dtb7+D#e:Ch[BnF<GdGEb$;8F(oN)+A,Et+Cf>-G%GQ5Bl@m1I16NgBR+Q.
EboH-CO9u/DIIBnF+&C?:2b/i@;Jn]CO9u/DIIBnF!)TRI9Trq@:s.lAS-:'An*l?@W#UkATN9*
+C%9PD/Ej%FB!0oHZ*A.ARfg8Ci<flCh4`,@;TRs+D,Y4D'3tBATKmT+CT)&DIIBnF!*7n+E_a:
F!)iJ@;TR'I16NgBR+Q.EboH-CO9u1I=#3oDfT]'CfG=gHZ*F;+<VdL+<Z)\>?l,UB4Z*pAp\6(
@leO=I9dt#6Z6gYASuThDej]<E+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+I16NgBR+Q.EboH-
CO:#/@r#V'HX'<aEc#6$<,ZQ!E+*6lA0<!;+FSZB>]=+aATD?oHYI)%3cJM;CLhj!+C%9PD/Ej%
FB!0oHX^DnCNCV@E$/S,A0>o(@rHO%EcW@I@<6O%A0>r4@:NjkBl5&(Bk)7!Df0!(Gp$^5Ch7[9
%16?RH#R>8Ch[d&HZ4"RHX'<aEc#6$<,ZQ!E,m'D+<VdL+FSZB>]=+aATD?oHYI)%3cK+f>p*B>
Df'?&DKJirCO:#CF<G"0A0>B&Df]tBEb/ioEb0,uAKZ28Eb'S-$=%7iE+O'+Bl7^5E-68NHX'<a
Ec#6$<,ZQ!E-67F+<VdL+FSZB>]=+aATD?oHYI)%3cK4`I9dt#6Z6gYASuThDej]@FDl22F!,C1
C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5Eb/j#@;TRsI=#3o
DfT]'CfG=gHZE\0DIIBnF!,mZ>?l,UB4Z*pAp\6(@leXAAo;$oATN9*+C%9PD/Ej%FB!0oHZE\0
ATD@"@qB0nDJsE/De!3lAKYl!D.Rc2Ao_g,+E_a:F#kEd@;Kat@;TRs+>Y_pF`V,8+=D&8D.P)C
%16?RH#R>8Ch[d&HZE\1A:8f0:2b/i@;Jn]CO:)5B4N,-+<VeTI9Trq@:s.lAS-:'An*lBAS5P%
>p*B>Df'?&DKJirCO:)5B5)F/ATAo%DIal4DK9<$BleB-EZdtM6m-#S@ruF'DIIR"ATN8/$=%7i
E+O'+Bl7^5Eb0<6A:8f0:2b/i@;Jn]CO:)5F*(q8+<VeTI9Trq@:s.lAS-:'An*lBATMs(I9dt#
6Z6gYASuThDej]?ATMs3Eb0;7FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`
.=DX4>\JD%ATDU$DJOT>ATi!?HX'<aEc#6$<,ZQ!Eb0E4+<VdL+FSZB>]=+aATD?oHYI)%3c\eT
Dgbn6>XNFHD.RU,<,ZQ!Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'I16NgBR+Q.EboH-CO:)5G&M80
G^XpD:2b/i@;Jn]CO:)5G&M80GT\,WI9Trq@:s.lAS-:'An*lBATi!0AU&W/+C%9PD/Ej%FB!0o
HZE\>F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%
DKC48$=%7iE+O'+Bl7^5Ec$5O>Y]3XD..6[Dej]?D'0rD+<VdLI=5=)E+*BjEb/j0BkCj9Ec$51
+C%9PD/Ej%FB!0oHZF7HF!+'tD.-ppD]j+2EbTK7F+"K)>\JD%ATDU$DJOT>FEDqX>Y]3XD..6[
Dej]?FEAWJ+<VdLI=5=)E+*BjEb/j0BkCj9EccDO>p*B>Df'?&DKJirCO:)EDK?pm+EV19F<GX7
EbTK7F+"K)>\JD%ATDU$DJOT>G]S:[>Y]3XD..6[Dej]?G]OuM+<VdLI=5=)E+*BjEb/j0BkCj9
Ed2YR>p*B>Df'?&DKJirCO:)5B6A$!EZeq<E,oN2F(oQ1+EM+&Eard2%16?RH#R>8Ch[d&HZOCB
G^XpD:2b/i@;Jn]CO:,HAU#=?+<VeTI9Trq@:s.lAS-:'An*lCG@c#I>p*B>Df'?&DKJirCO9W;
FE1f"F<GX=DJ*cs+Dbb0AKYQ/E,8s#@<?4%DBNP3Df$V@DfTA2BOtU_ATAo'Df'?&DKI"0DIal2
@<Q41%16?RH#R>8Ch[d&HZaC@A7Bh4HX'<aEc#6$<,ZQ!F`V,)@X0(=+FSZB>]=+aATD?oHYI)%
3d#LTA7Bh4>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7GAhM4F!,(8Df$UFGpskXBOQ!*
6qL9F6W?`^+CehrC`mq?Eb'56Df-[GGU\%M$=%7iE+O'+Bl7^5F`V,8I=#3oDfT]'CfG=gHZaC@
F!)SJ+<Z)\>?l,UB4Z*pAp\6(@leaRATN9*+C%9PD/Ej%FB!0oHZE\>F`MA@+EqaEA0>o(An?!o
DI[7!I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp4(De*ZuFCfK$FCeHnATDQtH#k_u
:-pQUEHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].De*ZuFCfK$FCcmR%15is/e&._
67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04Hk
F(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>
DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-0
4#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is
/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-
BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;
7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlW
F=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM
/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e%15is/g*\rDK:"M
F!)Z9F`_^WF_>N9+s8lu0JXbpDfTW%Ec6)<A9/1e:-pQU3?^F=3?T_).3Mh;3?^F=2]sJY@WHU/
+=&W`>9GpL3\i]<-mp,g+=JEp+?:T+1,pX/.3L/a-Rg0B+?:T+1,g='-RU#f+=JW_INViU+?hh/
-RU8h-9We#3?^F=2CBk$+=nW_-RU8N$;No?+?:T+1-&Vp><*if1,gRk@WHU/,VWF_+Z_A=>ph0O
,!%_-3\iZ?0I\P#><*if1,gR3EHQ2AAKWuV3\iT=0F\?u$:Zd40fr9ED..3k+@C9lEb0-14)AhD
A0<77De*ZuFCfK$FCcgB>9GXCEccCG-Xq44Ch.:!A8Gt%ATD4$ALAU)+Cf5!@<*J<-OgDMFE21J
7P[%[4&]^4+@C9lEb0-14*#Bb-ZF*@C2[X!Blmp,@<?'.+Bot,A10PfC2[WnATfFM/1<V.C2[W1
.4dS/F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?
$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]
:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`a
AR]dp+B!?"4#nHF1-&Vp><*if1,gRk@WHU/,VWF_+Z_A=>ph0O,!%_-3\iZ?0I\P#><*if1,gR3
EHQ2AAKWuV3\iT=0F\@Y2ENWT<+U,m+B*,qCLoSJFEAWQC2[X!Blmp,@<?'ZD/X3$0JFj`$<(VP
AooOm2ENWT<+U,m+@9LXBk'5;Ec>i/F<DrGDe*ZuFCfK$FCeElDfoN*APHTKATDi>+Bot0ATV[*
A8Gt%ATD4$AKW?JC2[X!Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.
ATnRj-!YM&@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO>]aP%FEDVOC2[X!
Blmp,@<?(/+DGm>@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]BQ@ZrHY@MCE-"&n
04f#RGA1i,E+NQo@4lJ=B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<ATD4$AUP\3De!p,
ASuU2+Co2,ARfguGp$^>Df$V%BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJB
DfTJDFD,5;C2[W7E+*Bj07A1>:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/%16$FAKZ).AKYT'Ci"$6
Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]
A8Gt%ATD4$AM.\9H#@)>HW>-$DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>/g(T1+C&ttEbTK7F(or3
%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*Zu
FCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#
AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$
AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g7:<HDklB-:r-A8Gt%ATD4$AKXf;7XZlu$6WSp@rc:&FE;/B
AISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!
Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1@<?(/
%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&t$4R>I@V'1dDL5;q
@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-GBR+Q.EboH-CO9#O8Q/GO:..lFI=#3oDfT]'
CfG=gHW3O-;c#bT6r-/m+<VdLI=5=)E+*BjEb/j0BkCj9<(KSZ:dIiE:IBP9+C%9PD/Ej%FB!0o
HY.D:C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BRL<s>\JD%ATDU$
DJOT2DfT]/Amo1\FCf]FHX'<aEc#6$<,ZQ!AoD^,BkCd`ATVL.+<VeTI9Trq@:s.lAS-:'An*l6
DfT]/Amo1\FCf]F>p*B>Df'?&DKJirCO9Z3Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"B4u*qB4uBu
A0>T(FCfK)@:NjkGAhM4F+"K)>\JD%ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7E,961+<VdL
+<VdL+FSZB>]=+aATD?oHYI)%3bNJPCh\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*+D,P4+D5_5
F`8HOGq".N$=%7iE+O'+Bl7^5BkCd`ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m@ruF'DBL&E
I=5=)E+*BjEb/j0BkCj9BkCd`ATMEmFD5Z2I9dt#6Z6gYASuThDej]6DKKH1Amo1\+EM+(FD5Z2
+EM[BD..I1+EMXFBl7R3%16?RH#R>8Ch[d&HYI)%I=#3oDfT]'CfG=gHYI)%+<VdL+<VdL+<VdL
I=5=)E+*BjEb/j0BkCj9BkCk'>p*B>Df'?&DKJirCO9Z3Ec#6,+DG_8ATDBk@q?cmDf'?&DKI"C
AU&<F%16?RH#R>8Ch[d&HZNb?C2[X!Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC
I9Trq@:s.lAS-:'An*lCATV[*A8Gt%ATD4$AURi,>XNFHD.RU,<,ZQ!E,oN/@<,p%9OUn3=<MR'
De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAUP!p>\JD%ATDU$DJOTA
GAL]0AU%g-GAhM4F+&C?:2b/i@;Jn]CO:2JCghEsG\1u?DfTB0+FSZB>]=+aATD?oHYI)%3d#X_
@<?(*Ao`*6Eb'6>>p*B>Df'?&DKJirCO:2AGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEs
G\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-[cF2>\JD%ATDU$DJOTCDfTB)BlncM>Y]3XD..6[Dej]D
DfTB)BlkI?+<VdL+<Z)\>?l,UB4Z*pAp\6(@legPEb'!#FF@F;>XNFHD.RU,<,ZQ!D..3k+DbJ.
AU#>0Ec5e;GAhM4+Dbb5F<DuW.=DX4>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%13OO
>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%LHYRJ0Ch\!&
Eaa'$I3<B8CLqQ0F)Po,+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lVDe!p,ASuT4
FCf]=+DGp?E,ol,ATMp(F"SS,F<G"5F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:e
AShk`+<WsdC`me;F`Lu'+Cf>#AKY].+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<%16?SFCf:u
$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCA8bt#D.RU,+D,Y&B5M3tFE8R5Eb-A)Bln$"E]OX:+<Xou
AS5^pHYIS5D/"<-I16N++C&W&ASiPa@<--oDg-(AB6%p5E$/t8DJ()&De!p,ASuU23Zq[NATD7-
1*AS"A8-+(+=CfBDfp#:@;TR'HjpE*+C&W&ASiPp9OUn3=BltiF_56"G\(D.D.-ppDf[r^>]s\!
@XL!TA8-+(+=CfBDfp#:@;TR'/14eCG%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'H=_L6$4R=g+C&W&
AShk`,p4<Q:2b#%8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_ATD$fDf9`8
DffQ;<+oue%14C(+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3qF!+m6BPD?p
Ea`iqAM/BR@;]TuBlbD6@<--pA.8kl+<VeNBln#2E-#T5A8a&=@;]Uo@j#;nCh[a#FCfK6/g*T+
ATE'<BPD?s+DG^9@s)g.Gp$@6AU&<=FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5Ci"$6F!,F1DIdZq
+EMIDEarZ'@rGmh+D>J%BP_BqBQRs+B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%FEDVOC2[X!Blmp,
@<?(/-Z^DDART+\EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&CLmq^,p4<Q
FD,B0/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-fi67tA_IXZ`p+F>4`CghEsGT^mHD.7's9PJBU
F!,OG@<-HZEc5eX+u(8aI16N0+AP6U5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#I16NgASu%*ASuX-
ATD4$AUP!p%16?]F^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9$4R>IFCf]=
FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+Df0V=De9Fc
8hO@\Df9`8DffQ;>]aP%FEDVOC2[X!Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&@;]Tu@V'h'
DIbAJ%13OO<,Wn%F(HJ!FCf]=FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XlE*$=%%OB5)71ASuX-
ATD4$AURc;/mSnn>\S:kD%-gp+A$HlFCB!%+A,Et/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*
FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA:8es:IKURBlbD*+A*(M+<Y*'A8c?<+A$Yt
BlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABFP:k+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2
D(g*ICM>Fu@:O._DLHkN@:O._DLF,H$=%:eAShk`+<X6nF*(i,C`l>G6rQl];F<l*%144#>\J.h
Ap\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9F)Q2A@qC(8
8l%iR:K::[7=>UP+<YB>+CT)-D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+C'#"G]\%LHZ3D'
D..=1/g*`-+Cf>-FCAm$F!,R<AKXT@6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*D]iM3Bl%<&
8l%i-+A,Et;bpCk6U`,+CiaM;@rH7,@;0V#%144#>]aP%FEDVOC2[X!Blmp,@<?'5I16NgBlmp'
%144#8T&Tk@;Ka&@3B'&EcP`/F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*@;]Uo@kM\?B.n[[
E+*WpDe"2J%144#>]aP%FEDVOE+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/+CT.u+C\o-
Df0).%144#F*2G@DfTr@+A*btH#@_4GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:EcYr5DK?q@AT;j,
Eb/c(D/Ws!Anba`FD5Z2/g+,,AISth+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*AKYi.Eb-A-
DJ!g-D..O#Df.TF$6UH6+<Ve3@V'1dDL5r4F_t]1@<?(/%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n
04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5DIdZq/TZ2T
FCBDGBPD*mCh[NqFD5W*07A1ADfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*I16Mi+<Xp1
@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC
0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6+<Ve3DJsQ4
@;L"!H=[Nm#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!DIdZq+C\c#
ARloU+B*Q'FCBD:882^MCh[NqFD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.@<6!j/SZkY
H#@_4GV*TCB4u*qB4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<Blmp,@<?'4
C2[W9I="n(D.tRqBlmp,@<?''8l%j'/e&-o+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8
A1r??$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp+@:3bCh+Yn
FCf]=FEDkEDe*ZuFCfK$FCd(Q+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5F`8rU8l%ha
$6UI.@;BFq+A*bt@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!Blmp,@<?(/
+CoCO%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p75>EHPu9AKW@5ASu("@;IT3De(4)$7-g5A0<rp
-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14C(D/=89-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2
EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!
Eb065Bl[c-I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TO<DImisCbKOAA6a4fG][qJDffQ3
Bl7R"AUAiR%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2A
ATMR'B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@
>XW.5<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@
AU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9o7F!,m9;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)
Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`
HW+TdA7];"%16?SFCf:u$6UHeE+No0FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$Bl7Q+FD,5.
B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"DKIK?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+E(d54$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"
%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR
+C%QNH$=1IA5mJ_HWtn@>XW.5<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%
FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*
;eTTMARp2u$=%:eAShk`+<X?r@:UKcFCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1@;BRpB-:H$
AU&<=FF.b@A8Gt%ATD4$AUP\8F<G(%DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1bEbTK7/e&-s
$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g2Ddd0!-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2EaiI!Bl/8-
$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!Ci<`m+FRKn
FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI16Ng
ASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XToF<G!7GAhM;Bl7Q+A8-'q
@ruX0GqL4EFCf]=FEDkEDe*ZuFCfK$FCfkCB4YslEaa'$Et&I!+C%TK<+T0\Anc'mF"SS$Cht58
F^o)-Anc'mF!+n3AKZ2;BlnH.DBO%>+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge+C]U*$6UHrFCf]=
FEDkNATV[*A8Gt%ATD4$AM/B?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+EM+9C2[X!Blmp,@<?''
-RU#Z:-pQU@s)g4ASuT48l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt)i$7-g9
ATV[*A8Gt%ATD4$AKW@13a?c<D/^jF+<VdL+<VdL+AP6U+EqO;A8c[5%14C(F(KH.De*ZuFCfK$
FCcRB05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU15$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q
@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKn
FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=34\>XNFHD.RU,<,ZQ!
:-pQU@s)g4ASuT48l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0H$p,/%16?8DfT]'
CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb>]aP%FCJZg
CNF<#F(foKFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b+<VdL+<VdL+C%9PD/Ej%FB!0oHVQm[+EqO;
A8c[5I16Ng:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"
AUAhYBQ%a!05>E=DD-*CD/`a%AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sBsBl8'<
I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eASiPgATT&5E-,f4DII?(@<H[*
DfR7I.3NhKFD)e-H!t5t@j##uAU&<=FF/(?FD>`)Ch\!&Eaa'$I4bs9>[h8WBl88rBOPF_A:4mo
>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I6q@aD..<e
FCf]=EHQ2AATMR'B5D.+I=5?qDfT]'CfG=gHQ[B@FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(
G][qJDffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I:?W,@psOl>]aP%FE)GAFCfN-DJ*csH[U;b
+C%9PD/Ej%FB!0oHVQm[+EM+9+A?3CAQU'`F`_;8E[YuX+EV1>F<G"0A0>DsEb/a&DfU,O%16?O
DIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B!?"+C'#"G]\%LHY7A<Ch\!>
+E)-?FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4$6UI(ASu("
@<?(%+C%TK<+T0\Anc'mF!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<+C%TK<+T0\
Anc'm%144#BlbD0Bm+'*+EV:.+D5_5F`8I@@;TR.%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p6i@
E,961+=CoBA8Gt%ATD4$ALATq67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ(+C&JqA:&K2EaiI!
Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!B6%s-
BlkJG>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*cs
H[U;b>XNFHD.RU,<,ZQ!:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT_DD$=%.[A:$j]B4u*qB4uC$
DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#<HD^o>YJR*AQXD'D]iP.D/a3*AKZ).AKYT!Ch7Z1
B4YslEaa'$A0>?,+C'#"G]\%LHY7A<Ch[uDI38t+%144#5p0WFFCSu,>]aP%FEDVO@UXA,+EM%5
BlJ/:BlbD@EbTW;ASrW4D]j.8AKY6"AU&<=FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,ARfh#Ed8dL
BOQ!*F(fK9F!,R<AKZ&*EHPi1@q?d$Aft>P@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!A90@4$6UH#
$6UH\Bl%@%%144#D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS+C'#"G]\%L
H['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.@V$ZmBk)6n
FCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;Eb-A(ATV?p
Ci^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F
+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5>\.e`HY%);D.R`rFCfk0$4R>ABOu3q+CT;%+EMI<
AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71ASuX-ATD4$
AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]VD]iP'
@;]^h+EV:.+Du==@V'R&De:,+DId='%144#@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>FD,]+AKYH)
F<G[=BlbD6@<iu9ATN!1F<G:8+Eh=:Gp$pADJ()0@;TRs+EDUBDJ=!$%144#FDkf'FD,6+/g+,3
+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1dDL6P<EaiI!
Bl/8-$=%%OB5)71D09Z:Bk)'tF+&BkI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?ODIe*;ATD6g
FD5T?%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1AKYK$A7Zm"
Bl7L'/g+59@;p1"DJ()+Et&I!+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcUI4cXABOr;s
AS,@nCige6F!*1l0Hak=@<,ddFCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;FWb1-@;]^h
+D,P0F<GLB+E1b%AKZ&.H=\]O=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-Bln#2FD,5.
F*)G:DJ((sFCf]=FEDk2;F+,Q76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])FCf]=FEDjn
/hT>9I4bs9%16?SFCf;3%144#>]aP%FEDVOC2[X!Blmp,@<?(/+DkP4+DG_'DfTl0@ruO4+D>J%
BP_BqBQPA%ASlC"HZsL=E,]B!I3<!;G\(D.8g&"iF`)7CFD,*)+Cf>-FCAm$%144#D/"6:F`M&7
+E(j7F*)G:DJ+#5@;]TuDffZ(EZf:BBOu3,FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*DfQtEEa`p+
ARlp$Df0H2F`)7CFD,*)%144#@rH7,@;0U%Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7BOr<0ATD6&
>]aP%FEDVOFa%Y1FCf]/Ed)GBA93/M+EM+*+E1b%AU[m'@:s.lAS-:'An*lEGAL]0AU%g-GAhM4
F+#SK$6UI$@;[2sAKZ,:ARlp*D]i\(DImisFCcS"ASlC"HZa4MEa`p+ARp33>YJR*AQW1[AoD]4
F*1u++EqaEA9/l8BOQ!*@ps6t@V$[!@;^3rCi"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'%144#Bl5&8
BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8AKYi(B4uB0
F)Po,+DkP)F^])/ARoLsBl7Pm$6UI*F!+n-G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*AQUPo$4R>I
ASu%*ASuX-ATD4$AUP!pC2[X%Eb\TqATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>
Ec5](@rrhAE,o].De(:L%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.B
GA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3
@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?
%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMA
Bl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_
0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0p
Ebm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)
6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S:-pQU:/=hX
3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u
+Cf(nEa`I"ATA4e:-pQU7Pm1\4%*XhF_;gpF`'9O@WHU/+=ANZEb03+@:NkZ+EqOABHT;f0JXbp
DfTW%Ec6)<A.8kT$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<>9Is'+=CW@
Bl%<pDe*BmF*)G:@Wcd,Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=DO+=K?"
C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^Uo
F`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoU
Cb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDIN
De*NmCiCLN%15Q]4"r`aAR]dp+B!?"4#nHF1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=
+=JT[/0H>b3ZpF+3\iZB-Rg/h+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+
1,^L-.3L/a-RU8h%15Q_4#&frATMr9;f-GgANOpSF<Dr>@Wk[eDeio<0II;:;eTlWF=Tg=4#&fr
ATMr96=FqL@ll&58PN#(@UX=l@j#l)F*&dH@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et
%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP.41,9t(+Co&,
-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL
+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kM
Bkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fq
Ec#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`
CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVS8
A7KakAM.\,D[d%gDe*Bs@kVS8A7KakAM.q>B+52_De*Bs@kVe3An5gi05>E9E+EQ5FEhm:$>OKi
AU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;/no'B
%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`F"_?<
@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!
D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds@ruF'DIIR2
+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"DKKT1B-:W#
A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:Wne
DD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*BOQ!*H#Ig7
$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)%16feF*(i,
Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3Bl7O$Ec#6,
Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&@:C?'8l%ht
Cggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\ATD3q+DbIq
+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.+A?3Q+Dk\-
F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7
B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W*+:SZ,
%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\
4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'ASu("@;IT3
De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a
0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&bAn5gi01'eq
Ch.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8XE+EQkDdtFm
:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8XE+EQkDdtFm
:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(qE(=J]/oY?5
%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDklB1d)QCh\!&
Eaa'$/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,
+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>7:IH<n
De!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"Df9E4+EV:*
F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;sBl[cpFDl2F
3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3DfQt;DfTD3
Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIs
BOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?
AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa
@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQ
CLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM
6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc
0eP.41,9t(+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;
Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]o
F*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk
.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\
4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043
EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59
BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk
$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043
EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2
+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+
Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgL
FCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1
AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1b
EbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO
+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#
+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!
+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImis
CagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7
AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU
@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTu
Df-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-
AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$?1$#A7]@]F_l.T0ht%f.WBECA7]@]F_l.BF"JsdA7]@]
F_l.BE,ol3ARfg)F(KH9E%VS,:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBj
Eb/[$ARmhE6tKk>D.7's+>PW+0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO:-pQU@Us1_F'iWrDe*3<
3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p+DPh*+E_d?Ci^sH%15is/g,(C
+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-Dfp"A/Kf.ZART?s
@<3Q/AS#C`A.8l@67sBqDe*KfBkhQs?TgFm-YII<F`8];$4R>;67sBjF`MM6DKI"FDfTW-DJ()5
F_Pr/+>"^XG@b2u+CT=6DImBiARl5W:-pQUC2[X(?YO7nA7%J\+=D5QBlmo6%13OO:-pQU@s)g4
ASuT4GAhM;Bl7Q+Ci<flCh4_@+EVg=@;?uoF!,@3ARo@_%15is/g,7VB5DKr?YO7nA7%J\+=CuD
@ps1b-OgCl$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C
/g+eIE$-N@Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NU
C2[W1+D58-+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[\NPEZf(.
@j`B.$4R>;67sC"F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARlp-DfTB0+DG^9FCB3&ATT&2De!3l
AISu7:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb:4@U=%16Ze
@<6!&-[U;;IXNRQ$;No?+EVX:Ci<fjBkhQs?Q`umF<DrXISP??-OgD3%13OO:-pQUF(KG98l%ht
F`V,7+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKAE_Bth
F!,L7F(KG9/Kf(FF*(i2F<F0uAoD]4@q]:gB4Z-3%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FB
F<DrAAS,@nCiiZuATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/n
Dfp/@F`\`RA7]@]F_l.BE,ol3ARfg)F(KH9E$l)%E,o].De(UX:-pQ_E,o].De'u3/M/)[De'u0
Ec5](@rri7ATW'6/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[l
A3(i3AT2a&D.7's+>PW)2[p*h67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,De!lD2]uO>A7]9oH=gl-
ATJ:f:-pQU0K<u\F>5Km@:Wn[A0=0:6V0j/2'?FPD/aP*$;No?+>>cn@rsF^+DG_7ATDm(A0=0:
6V0j/2'?sOFED57B-:o+FDi::De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU0f`cU@k]e`
Eb0H8BlnH.DBNP0EZdss3A*!?+:SZQ67sB90Q(fP1,^7`A867.FCeu*AoD]48g$,H0JXa[$4R>O
A8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F++=ATh-YdR1A7]p,C2[W*F`_>6
F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?+CfP7Eb0-1+EqaECM@[!+D5_5F`8HT
+EVg=@;?uoF!,@3ARo@_%16igA7o7`C2[Wi4ZX]5C2[W1%13OO:-pQU@s)g4ASuT4GAhM;Bl7Q+
F*22=AKWQIFE_;)CER&,+Dtb%A7]9\$>OKiF'iWrDe*3<3ZoebDe*p+Deip+ATMs7-OgCl$;No?
+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N@Ec>N)
@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1+D58-+FPjb
B6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt-Qij*%15is
/g,+UF>%lZAS*&:+DG_7ATDm6+Dl%-BkD'jA0=K?6m-\lEb'56Bl5&3@VTIaF<GC<@ps1b%15L!
6WHiL:/jSV9hdoK6sjYCDe*2t4ZX]60H`D!0I[G<F)>i<FDuAE+E2?D-[U;;IXNRQ$>"6dF(HIA
H[\_=I4#I2-mrFN/8B*6B4#@fDe*3(+D58-+=DMb:4@U=%14Nn$4R>;67sC%ATT%e:IH=JF(KA7
CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m+EVNE@:OCnG%#K(%17/nDfp/@F`\`RF`V,794`Bi+ED%7
ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=CoBA8lR(<HD_lCLqd4-Rg0^EbTW,+DPk(
FD)dEIUd;6Anbm2F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+=BcW6m-GhDe`inF<GX9FEMOM%17E-
H>7A/D..-r?Z]k(1,:-u9jqaR+A,Et+=MP^H>7A/D..-r/p(ZL.3NG8FCf\>Anc'm/g(T1,n12-
+A,Et+EMIDEarZ'BlbD,Df'H3F(Jl)De:,#+Du==@V'R&De:,%CghC+ATKIH<+oue%14C(Anc'm
+CT>4ASkmmATJtd:IH=8CghC+ATJu&DIal$G]7SBBln96Gp$s4FCfK,@;HA[,p6o>FDi:1+EM77
B5D-%F)Q2A@q?cmDe*E%A8bt#D.RU,/e&.6%14C(@rH4'Bl%L$B-;;0BlbD/Bl%?'Eb065Bl[d+
+E1k'CghEsGUst^ASbdsAU"Xk,n12-+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+DkP&ASH$m
AU#>DH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=E
A8PahD@Hq!%14C(@;L$sEc,<-Bm+'(Gmt*,%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<Q
D..3kBl7HmGT_<YH>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<QCis0&@<?(*
+<YuVH>7A/D..-r%13OO>\S(pF`_t&:IIljFCfK$FCe9hARTFbCh55@AU&V4$4R>I@<H[*DfU1s
DeO#26nTTK@;BFpI16NgFD5i5AU@[(AU&<=FF,6]INs#IEcYr5DBjUZ,9TTS7"$1VDfp)1AKX?Y
A7Zlg>Td9`Df9`8DffQ3BmO>5>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%F
AS!N3@<6O%E\D0GA8,e"I9^Z.Ec#6$F(or3I16Mm$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!
F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIuCh7KsFD-#+
@rH1+D/OE+E.*'hASli)$=%X`FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*>]b1.@rH1+
D/Kdi%16?LAS5^pHXq&)F_t]-FF=T*%16?W@;BFrBln0&%16?^@:F%aDe<KtDKKH-FE7lu>]4Lk
@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Dg#i+G:muKG^U#.%16?XATr*%B4VMZ>\S(p
F`_tVH>7A/Df.1LAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?XATr*%B4VMZ
>\S(pF`_tVH>7A/F*)>@AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k/p(ZLI16Mm
$=%I[GApu'AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*s.
DesJIFCf]F%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>INs;ODe*E3
FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.
FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$3  ~>
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
A8c?.D..I#A7fk+DfTB0+DkP-CM.'sF(o9)+E2:0De*Eq@<?(*+E2:0De*Eq@<?(*1*C^\ARo7q
+E_mE@<?(*Ao`*6Eb'5=.4cl04?G0&0d%hd@:FCYD/X3$0JFVYF_PZ&C2[X!Blmp,@<?''B5DKq
F&QpoCLon%0JFk'/1<VC4"akp+=A:HDe'u*De*ZuFCfK$FCcS0De*ZuFCfK$FCeElDfoN*APHTK
ATDi7C2[X)Df9H5+DPh*F`_>6-RgSp4=iTBC2[X(D/X3$FCfN8F!iCf-p0UR/mg=U-Ql#W6pamF
9LMEC;cHOj=Wg=46rZrX9N+8X8PDNC8Q/Sa;HY,=:K(5"C2[X!Blmp,@<?''<)5nX?V4*^6r-0W
D.Fbg:IIuc8l%i^D.Fbg:IIucC2[X!Blmp,@<?'fD.FbuF_PZ&C2[X!@<?(*+C]J-Ch.:!A8Gt%
ATD4$ASbdsAU#>.AS,@nCiiZuATDQtH#k*ABleB7Ed;D<A0>W*A7'7uBk;KqFCf\>C2[X!Blmp,
@<?'\F(KB-AU/>>C2[X!Blmp,@<?'fDg#i+G@,H'GT^a>A8lR(<HD_lCLqd4+DkP)BkCptFD>`)
+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCptFD>`)F)Q2A@q?d%Eb],rAmoguF<GOCC2.Zt+F8?[
C2[X"@;0UdFCf\E.4cl01*A>2,Vh&/0JP:;2_HpH1bggI3A`EG+>PW+0JP=:0eP::3A`]P0ebO/
1,(I;0ekCB/i>=C1GgmI3&if=1,(I;0ekF@/i>FA1H70N3&3<51,(I;0ekCB/i>=C1GgmI3&if=
1,(I;0ekF@/iGF<1,:O@2`EW;1,(I;0ekCB/i>=C1GgmI3&if=1,(I;0ekCB/i>=B3&<9K3B8u?
1,(I;0ekCB/i>=B1,gsG0d&5*1,(F;1,ggB2)mTP2)I!F0d&5*1,(F;1,pmC2`EZL0KD*J1*A>+
1,(F;1,pmC3&*3C2)[6K2'=Y.1,(F;1,U[A0fCdE1H.*M2BXb/1,(F;1,ggC0eb==3&*3J3$9t1
1,(F;1,ggB3AiWN0ebOF3$9t11,(F;1GCF<2`3HO2)R*B1a"P-1,(F;1,ggB2D?pA2Dm6K2BXb/
1,(F<0JP1:1,^gB0fD$G0d&5*1,(F;1,pmC2`NZS3&E?G1a"P-1,(F;1,pmD2).'N2DR0G3?U(2
1,(F;1,ggB1GLmK0f:g21,(I;0etF;/i5793&`iR1,gs21,(I;0etF;/i,LF2)?sI0ekL-1,(I;
0ekFD/i5OI3ANHH2DR361,(I;0ekI</i>OF1,C[C3AEN:1,(I<0KCjB/i>FF2_m<N2)I<91,(I;
0etF;/i57?1GCLB2)dH:1,(I;0ekFB/i5OE0f1mN1b^^.1,(I;0etF;/i57B1cR<H0K1+00JY@;
1,(I92)$pD2D@'M2`)X40JY=:0etU=2)@'F3&<QS1,L+/0JY@;1,(I92)$pD2D@'M2`)X40JY=:
0etU=2DHm@1,(RE2`;d60JY@;1,(I92)$pD2D@'M2`)X40JY@;1,(I92)$pD2DR6K1,^710JY@;
1,(I92)$pD2D@*L0f^@30JY=:0et[?1c76Q1Gq!C2DH=00JY=:0f(L92)d3H3AE6E1GL"-0JY=:
0et^@1cR3G0JtaE2DlU40JY=:0et[?1b^aC2)R?N2)QL30JY=:0et[?2)-d@0JG@?1*A>+1,(F;
1,ggB3Ar`K1cIEL0d&5*1,(F;1GCF<2`3KP1bgdB2]sk01,(F;1,ggB2D?pA2Dm6K2BXb/1,(F<
0JY7;2)m<L0JYF=1a"P-1,(F<0JY7;2)m<L0JY=B0d&5*1,(F;1,pmD2).'N2DR0G3?U(21,(F;
1,ggB1G^dA0JG@D2]sk01,(F<0JP1:0JGIF3AWEL1*A>+1,(F<0JP193AriR0JP7;+>PW+0JP:<
0J54@3Ai]R2_m*D+>PW+0JP:<0J54@2DR'D2*!BO+>PW+0ebUB0eP=>3B&]P2`3EP+>PW+0JP=:
0eP::2D[$@3&NWR.4cl01*A@u1,(I;0ekFA/i>F@2)@'L2`EW;1,(I;0etF;/i5@@1,C[>1cRE:
1,(I;0etFC/i>RH0JPI?2E*E71,(I;0etFA/i5C@2*!WQ1c[<61,(I;0etF;/i5@A1H@6K2)@!1
1,(I;0etI@/i5@=3AE6H2DmKD/1<V9+>kE"0JY=:0etU=2).!I1GUaG2)ZR40JY=:0et^@1cI<H
2E!HP3&i$90JY=:0et^@2)-pJ0fLpD3&Da50JY=:0etX>2*!NM3AE6H3AM^40JY=:0et[?1c7*G
3AWZP2)ZR40JY=:0etU=2).!L2`NNH1cQU50JY=:1,(F81bpsJ2_ZsB3Ahp70JY=:0et^@2)@$I
3&riS0JXb+0JY=:0et[?1c70J0K(gD3A_j60JY=:0et[?1c7*G3AWZP2)Zm7-p07=1,(F;1,^aB
1H7?N1cR0D2(LXB/hf1;0ekF<2)RBQ1H@0E1Fd)k1*A;#/1<V9+>PVr1,(I;0ekCB/i>=C1Gh!J
1c7'31,(I;0ekCB/i>=C1Gh$G0ekR/1,(I;0etF;/i5=C1bg^D2_[-41,(I;0etF;/i>RF3&`]O
1c[Q=1,(I;0ekF;/i5:?0eb@=0Jah,0JY=:0f(L92)[<N0f_3Q1H?R50JY=:0etU=2D[*I0ebID
3B/-:0JY=:0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1H@BL2D[0I3B83;0JY=:0etU=1c.-N2_ZsF
1,^710JY=:0etU=2DR-D1cIBK1bg+.0JY=:0et^@1cI0E2)m?M2)QL30JY=:1,(F81c.!I1H73N
1-$I40JY=:0etX>2)[EN1bggD2E;m80JY=:0ekX?2)%$H1c-m@2)?@10JY=:0ekX?2)%$H1c-mD
1,U100JY=:0ekX?2)%$H1c-mA2DcO30JY=:1,(U=1b^dB2D@$G3&Vm70JY=:0etX>2)I0F2E<NH
0K1+00JY=:0etX>2D@$K1GUaC2`Mp80JY@;1,(I92)$pD2DR6I1H?R50JY@;1,(I92)$pD2D['F
3AM^40JY=:1,(I91c7!F2E*NS3&;[40JY=:1,(F82)dBP2`3EK3B83;0JY@;1,(I92)I3N2)-sE
1c-=10JY=:1,(L:2)d6M1,_$E3&_s80JY=:0et[?1H@EO2_ZpE0JXb+0JY=:0et^@2)-dB2`ETL
1,9t-0JY=:1,(U=1bg^D0Jb[K3Ahp70JY@;1,(I92)R'D3&ruZ2`Dj70JY=:0et[?1H@0M3&<KP
1H$@20JY=:1,(L:1c[?L0JtdD2DZI20JY=:1,(I91c@9P1,CpI2'=Y.1,(F<0JY7;1-%?N2`N]U
1E\G,1,1L=0JY7<0K([E0K:mE0d&5*1,1L=0JY7<0K([E0K:pK+>PW+0ekF;1+kF<2DR0E3&EWQ
+>PW+0JP=:2D-g@1,q!H1-%9L+>PW+0JP:;2D-jD2).!L1,(C@+>PW+0JP:;3%d$I3AriR3&*<J
.4cl00I\P$4>838-p014/1<V7.4dS8                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
