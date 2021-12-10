NB. JOD dictionary dump: 10 Dec 2021 09:43:29
NB. Generated with JOD version; 1.0.22 - dev; 24; 10 Dec 2021 09:30:42
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


DDEFESCS=:;:'{{}})'

DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC formifacetex grplit ifacesection ifc setjodliterate uwlatexfrwords wordlit'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22 - dev';24;'10 Dec 2021 09:30:42'

JODVMD=:'1.0.22 - dev';24;'10 Dec 2021 09:30:42'

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

ddefescmask=:3 : 0

NB.*ddefescmask v-- direct definition escape token mask.
NB.
NB. Returns  a  bit mask  of direct  definition )? tokens.  These
NB. tokens  would  be  seen  as globals  if passed  to  JOD  name
NB. analysis verbs.
NB.
NB. monad:  pl =. ddefescmask blclJTokens
NB.
NB.   toks=. 3 pick parsecode__MK__JODobj jcr__JODobj 'ddef00_base_'
NB.   toks #~ -.ddefescmask toks  NB. escape tokens

p=. >:I. (0{DDEFESCS)=y      NB. first token after ddef starts
b=. (2{DDEFESCS) e.~ p{y     NB. ddef )? escapes
0 ((b # p),b # >:p)} (#y)#1  NB. escape token mask
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

parsecode=:3 : 0

NB.*parsecode v-- parses J word code.  Normal result  is a  three
NB. item boxed list of boxed lists containing declared  names and
NB. parsed tokens. Will return  an  error if  given syntactically
NB. invalid J code.
NB.
NB. monad:  parsecode cl|ctJcr
NB.
NB.   parsecode jcr 'wordname'

if. 0 e. $parsed=. tabit y do. ok'' return.
NB. possible quoted single line explicit
elseif. 1=#parsed do. parsed=. uqtsingle parsed
end.

NB. end with a blank and compute comment mask
parsed=. parsed ,"1 ' '
mask=. masknb parsed
locs=. gbls=. ''

NB. if any declared names extract them
if. 1 e. '(*)=' E. , parsed do.
  'locs gbls'=. mask opaqnames parsed
  olap=. locs -. locs -. gbls  NB. intersection
  NB. errmsg: confused declarations
  if. 0<# olap do. (jderr ERR0150),olap return. end.
end.

NB. blank comments, clear mask and remove blank rows
mask=. 0 [ parsed=. parsed jnb~ -. mask
parsed=. parsed #~ parsed +./ . ~: ' '
parsed=. (;: :: 0:)&.> <"1 parsed  NB. parse code
if. parsed e.~ <0 do.
  jderr ERR0151  NB. errmsg: word syntax
else.
  if. (0{DDEFESCS) e. parsed=. ;parsed do.
    NB. remove any direct definition escape tokens
    parsed=. parsed #~ ddefescmask parsed
  end.
  parsed=. ok(<gbls),(<locs),<parsed
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
0f:d11,^71+?1K#2]sh1+?)/#1,0n-3?U%5+>u"u1,9t21*A;*+>u"u0fU:72]sh5+>P_q0eje,
0d&@s1,9t-0H`/.+>GYp2_cF2+>Pbr0ea_+1a"M-+>Ykt0eje-1*A;++>Yer2]sk0+>G\q1G^.2
+>kqt0esk,3$9q1+>Y\o3?U%9+>GSn1b^%,1*AD-+>G\q2D@Ne77K^E6W7N0Eb/a&+Co%qBl7X,
Bl@l3ATM?iE+L/6Deip%F!*%WDfTB"EZf4-FED)7F$rek<D>nW<)#YV9.4\%.3N24BlkJ>AU&;>
FCf<.CghEs+>"^WFDl22A0>T(+EV:2F!,(5Ebuq@D]j">ATMF'G%De-D.7'eA7]9o@rH4$ASuU2
8Oc!579<8_6rRi=A8Gt%ATD4$ASH%(ATDBk@q?d,DfTB0+D,P4+=LuCA8Gt%ATD4$ALSa7Ec6)>
8U=!)6tpO\ATDBk@qB.gEb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*
.!&sAC2[WsDKKH1Amo1\.7nhX:IJo7FCfK)@:NkI<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et+DG_8
ATDBk@q?c7+E_a:A0>?,+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$FDl)6
F%T4r<)6:`;]odlFCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)
@:Njt8U=!)7!*?cCi`NS5u'g6;FGSJ@;]UaEb$;&DfTD38l%iS:JXY_+DG_8ATDBk@q?c7+E_a:
A0>?,+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$F`_>8FCfK)@:Nk`De+!4
Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk
8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk;GU(f=&2^^;eg5]Ch\!&Eaa'$Ec5l<+EqaEA9/l*
DfQsKC2[X!Blmp,@<?'0+D5_5F`:D[5u:BU77KjN<(0o.@;]Uo@j"HR<+T/SAo_<mD.RU,+D,Y4
D'16.;F+,U;FO&H==G@E+EV:.F(HJ8FE2)5B6,24F`VXI@rHC.ATMg/DId0bG%#3'+C\bhCNXS=
G%G]8Bl@l3DIIBnF(96%@<?'t@<6O#Eb/[$ATJu9BOr;sBk)7!Df0!(Gp$s4F*(u6+D,>(ARo=_
An?$nD..L$A8-'q@rri(AS,XoBln'-DBNM3@ps=f+EVO;ASrW-@<63rBl\9:E+O'(De*m"FEMVA
F!,R<AKY])A7^!.De:,(Bl\9:+EM+3FCf?"AKYr'EbTH&Ao)1#;07#&@;p9rA867.F<G[DCLqC)
+EqOABPD?,EHQ2AARlp"@<?(*C2[WrASc<rBle60@<itl6q/:k:IH==ASc=#De*ZuFCfK$FCeKI
6u$XNCh\!&Eaa'$+Eh=:F(oQ1+DkP&AKYE!A0>DkFCf3*A8c@-F`M@B8l%htDf-\<ATN!1F<G:=
+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0D..I#A7fk+DfTB0D..I#A8c[0+EV1>F<G19
Df$V@DfTA2Ch[s4D..I#B45k&BkM=#@<--+C*7#)A7ZlqDfQt:@<?(*+DG_(AU%p,B5h:"F(Jj"
A7]^gEcYf5+A*c#DfTA2@rGmhE,]<*A7]RcFCf]9Df^"CE,ol,ATMo8B4YslEaa'$A0>r3F`Lu'
+Cf>#AKYetFCf]9E+<fsASbdsAU#tLDf^"CE,ol,ATMo8B4YslEaa'$A0>r3F`Lu'+Cf>#AKYet
FCf]>GAL]0AU%g-GAhM4F*2AEEa`p+ARlp"@<?(*+D,Y4D'4%@Eb'5P+E_mE@<?(*Ao`*6Eb'56
4$"a5AKZ2;@;m?3B5Di@+9                                                    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gp:3+>P&o0H`/,2`2^42BX_22`Mp72BX_42E)a51a"S70f*6IG#N6rCLo1R:-pQ_@:FCYD/X3$
0JFVk/M/(n@:FC/+CT;'F_t]-F<GXADeio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi
$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b
4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?%15is/g)8Z1+==oC2[X)ATMs)E[`,FF!+m6
Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW+0Q(fP1,]RK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo%15is/g,">CLnW'De*s$F*(u6
+D,Y4D'2GH6m-#SF*)G:@Wcd,Df-\.Bk)7!Df0!(Bk;>p$;No?%15is/g)8ZDe'tP3[\Z\A7T7p
+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX67sB'+Dkq9+=CoBA9;C(FCfJ?%16oi@:UK.C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9
F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0T
D/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX
+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQQ:-pQU4#%j#:-pQUH!tQ,
ATAo3DBKAq%16QUAoD^$F*)Fc3Zq]NHS0ai0d\;_/q,67-sIf_/g+FK%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R>;67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr-RU8h-7hD1/1)_l-RU?.
-mO0`4utqW4XMO(-RU>l%15is/e&._67sBU67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7
@:FC/+CT;'F_t]-F<GO2FED)7DK?6o:-pQB$;No?+DPe(4ZX]]6:s[6<),ef@;9^k?O[?;67r]S
:-pQU:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2+>"^MDI[L*A8,po+D#A'A7]9o.!R0M$;No?
+DbJ,B0A9u-p22r0I\+q+=K>r0Hb+J@jrN0$;No?%15is/g*nU/g,=GCh[E&EbT0"F<DuW.3N&>
B6A'&DKI"?@<?U&Ec,q@/Kf"K@;0U%8g&"[D.Oi/Eb/isGT^F4A0>H#E--@J-RT?1:-pQUEaa!$
4ZX]5DIIBn-QjNn+=ANa-RU8a%15is/e&._67sBU67sC(@;KXg+=LZ-Ft"PBEbBN3ASuT4E+*j1
ATD[0%15is/g+n;Eb@Nr+?Ui&+?Lc%+<iin/j:C4+>=on+F>:e+<Wij-p/k"@:FC&-Rg/h+A=g=
0d&"iHQX_!Cgh?s.3L/a4=G2lDffP;/j:D+3c\YLB.4rS+F?.i@<,ui$4R>;67sB'@:FC&-Z3@0
ALAT0$;No?+<Y*%Fs&.[+<VdL+:SZQ67sB7+CS`&+=D&8D.P(($;No?+>=pH@WikA-QjNS+:SZQ
67sB8+CS`&+=D&8D.P(($;No?+>G!I@WikA-QjNS+:SZQ67sB9+CS`&+=D&8D.P(($;No?+>P'J
@WikA-QjNS+:SZQ67sB:+CS`&+=D&8D.P(($;No?+>Y-K@WikA-QjNS+:SZQ67sB;+CS`&+=D&8
D.P(($;No?+>b3L@WikA-QjNS+:SYe$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"
+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e
/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+
F!(o!6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=
-Rp`_C1\h&$4R>;67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:
ARfgnA0>H(Ec5t-$>sEq+CS`&+=ANZ+<VdL+<VdL+AP6U+Du+>BPD?s%16uaEZee"Fs&/SDf]K$
-OgE#ATAo%@WikABOu3q-OgCl$>sEq+>P'J@WikA-QjNS+<Ve%67sC%FD5Q-+DtUu@1<Q]ATAnM
+CS`&+=DGQFXJ:S+AP6U+E1n4F(o];Bl7Q+%16uaEZd(Z@:FC&-YI.:AT_r>%13OO:-pQU@rc-h
FCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.j
E+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*
3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])qF:AR"%15is/g,7LBl[`,DdmHm@rri'
Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$9g.jE+*6lA0>u)
Bk)5o$4R>;67sC(@<-(#F`S[>DK]H)Bk/>pEbBN3ASuU2%16uaEZd4^@:FC&-RT?1DImi2@:FC&
1boLIDImi22ek2m@:FC&-RT?1DImi2-YddFF<GdJDf028+CS`&+=D)C-OgCl$;No?+Eh10Bk/?*
@<?U&Ec,q@GA2/4+CfP7Eb0-1+C\bhCNXT;%13OO:-pQU@:FC&-RU#Z+AP6U+DG@tDKKT7Gp%<E
ASrW.DffZ,DJ()#A7T7^+CSl(ATAo0@<6N5@UWb^F`7cs0H`M$,9SC_/g+\BC`k)Q.3L2p+=Ach
-=UOuDfTE1FE/]\4s49CFseXH$4R>;67sBh@WikADIIBn-OgD:+F>:e+=Jd%-ULU)9L2WR9d_A4
74o]H+FPjb@:FC&-ULU)9L2WR9d^AW%15is/g)hj@:FC&-Z3@0AL@oo0Hb]d0d%kq3[\WZF=/L[
74o]H+FPjb0Hae5Fs&/HDKI68$4R>;67sB8+CS`&+=ANG$8<Sc+<r!WI4cWs+CoA++=ANc+>#2g
-S?bn@V'.iEb0<6E[ED&+>G!I@WikA-OgCl$;No?+>G!I@WikADIIBn-OgD:+F>:e+=Jd%-Za-C
CLnkB+@Rn*4s58++>G!I@WikAF)>i2AL@oo%15is/g)nl@:FC&-RT?10H`M$,9SC_/g)nlA8Z3+
-RU>c/M8.n/ghuTAS,k$ATMs6-8%J)1*C"7Fs&.[%13OO:-pQU1*C"7Fs&/M@;TR'%14d3HQk0e
-nID,Bl8$6D/X3$-Rg0,/g*>#I4cWt+CS`&+=Cl@FE;;;CLnk&$4R>;67sB:+CS`&+=ANG$8<Sc
+<r!WI4cWu+CoA++=ANc+>#2g-S?bn@V'.iEb0<6E[ED&+>Y-K@WikA-OgCl$;No?+>Y-K@WikA
DIIBn-OgD:+F>:e+=Jd%-ZaEEFCcgK+@Rn*4s58++>Y-K@WikAF*22=AL@oo%15is/g)tn@:FC&
-RT?10H`M$,9SC_/g)tnA8Z3+-RU>c/M8.n/ghuTAS,k$ATMs6-8%J)1a$49Fs&.[%13OO:-pQU
1a$49Fs&/M@;TR'%14d3HQk0e-nID,F)>i2ALAoL74o]H+FPjb1a$49Fs&/RD/X3$-OgCl$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]R/DeioE3B:GUF_PZ&C2[X!Blmp,@<?'U67s`sF_PZ&C2[X!Blmp,@<?''
F"Jsd@WcC$A0>;uA0>DsF*)G:@Wcd(+DPh*Ch\!&Eaa'$/no'A%15is/g(T1:-pQU@rc-hFCeuD
+>PW+0Q1HC0Js:H:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$;No?+>PWh@rsC^+C]J-Ch+Y:C2[X!
Blmp,@<?'0+CT.u+Co2-FE2))F`_1($;No?+>PWh@rsCb+=LuCA8Gt%ATD4$ARB+ZF(f)mFCfT8
CagK8A7T7^%15is/g)o'DJs\P2]sM`De*ZuFCfK$FCeg"Df9_H+CSekARl5W:-pQU1,*6M@k]V[
-u*[2Ch\!&Eaa'$<_Yt2+CSekARl5W%16T`@r,RpF!,RAE,9H&?U6tDC2[X!Bll$h3F=p1-UC$a
C2[X!Bll$h3@>qR+Cf>$Eaa$#+?V#;5s]7(A8Gt%0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$
4ZX^6/nA[,+>=63%159QHZ*F;4$"c<-Y[F/GUFUc3ZpL<HZ*h@.3g3SD.Rr>.4chhC2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+EM4)1,Us4F(fK9
E+*g/+EV[H@;Ts+C2[X!Blmp,@<?'fBOPsqA79RkF`M:@C2[X!Blmp,@<?'fEc5l<+DPh*Ch\!&
Eaa'$<_Yt0%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!)iFDe*ZuFCfK$FCcg/$?BW!>9G;6@j#Z!
F=0449gM-E:L@OFDe*2tB4Z0--WEl0:L@jTA8Gt%ATD4$ARB:b-OgCl$;No?+E_X6@<?'';b020
2)ZRj@<6*)@;]TuA79Rk+=M)FF`);0Bl5&8Bl.E1+<`-_.6T:+C2[X!Blmp,@<?'fBOPsqA79Rk
F`M:-$><jhBK\C!F(eu;2)ZRtART*lAnc'm%16QT@<?'D3ZohmF*(i-E$-MU.4chh9iNJL$>OKi
Ch\!&Eaa'$?YEkhBOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=RDe*ZuFCfK$FCefm@<6*m
@<?('Ebl0l4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm@<6*m@<?('Ebm*4$4R>;67sC'E+EC!
AKZ/5A0<$D.OdM5+DPh*Ch\!&Eaa'$<_Ysk$>OKiCh\!&Eaa'$<_YtF3ZoOn-pB[74u%D!De*Zu
FCfK$FCeKI6n(3,A79Rk.3L#n+>PBo+DPh*Ch\!&Eaa'$<_Ysk$9g.jFDYu5Ddso/F`\`RC2[X!
Blmp,@<?']9gg?<$4R>;67sBkAS,@nCige?Df9_?/KetTATDg*A7T7h+C]U=A8,OqBl@ltEd8dN
@;L't%15is/g+nIA8Gt%ATD4$ARBIrDfe-'+=CY[05>E90..29%14L>+?CW!.3N5:Ch4%_BkAt?
An?4$F*(c(?Qa90F?M6!-u*1#CNDX"C2[X!Blmp,@<?'fEc5l</151@@r$-=C2[X!Blmp,@<?'6
-RgSoC2[X!Blmp,@<?'5Bkh]:+CoCC+:SZ#+=M8A@:UL+.3NhTBlmo/F(fK9E+*g/+E)CE%144#
-p'220RI\IF=A>VEbTW,+EM47GApu3F!,4+@r$-:-WEl0:L@jTA8Gt%ATD4$AM.h1-OgDoDIb@B
%14Nn$4R>+0RI_K+E)1:+BosE+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6#(=KCh[uF3B:FU$>40n@WOkEF(o,P6tKsa0MXqe.VER9@WOkEF(o,P6tKsa0HbHh/Kc0F
@<6-m+Co2,ARfg)A7]@eDJ=3,Df-[GB5DKqF"&5RATMs7/db??/db??/g*JhF(o,,FCfN8F!,C5
+A,Et-Z^DD@;]UlBl7Q+De:,0ATo7F8g$,H0JXbZDIaku@W-F$.3N/8Eb/a&+Co%qBl7X,Bl@lA
$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB811Xs+0ea_kFCB33+E(j7
FCfN8+Cei$ATJ1c$=e!aF`MM6DKI!K@UX=h-OOm*EHPu9AKW@8De*s$F*(u6-OL1f@rGjn@<6K4
FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I
$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=
5uL[1/IDhqA7]@,0KhHQ+?CW!$49Np/h1CBAS*VM+Ef=g+EqaEA0?)1FD)e-Bl[cpF<G+*Anc-s
FD5Z2EsbZ//db??/g,"LDII':+<Y3*AS*VM+E_fuB5VX.AI8c^A7]@93dZ2r+FSY\$4:Z]AS*\\
3dZ2r.<Zh^I38k(DId<j1HddGHQXbI$6XbF+:8HnA7]@04Z[q:.:aQLI0p<V67sC&BQA$8+A*bf
EcQ)=$;No?+DtXsA3Du#HRX/ZDf039I0p<l@:VMR+FAGXGT\LZGp%N`+:<1,Dfp/@F`\`\0Han7
A0<T^$4:ikDfp/@F`\aQHQ[SV.j/;;?Z\F`+F.9L+FSY\Bf[@l+>GPW$>j]u4ZX^4HQXbS$7J#!
-YII2@<?.&@;]U'4*`8:-p/kiEa`ir-TcT&4*_rsI38l<D/XQ=E-67FD/X86-Z*dDBOu33$4:Wg
D)+78+FAGXGT]'jD/X86D/X86Gp%N`+:<1,Dfp/@F`\`RH!t5l-Qm8ED)*4]D/XN0ATB.*$>aWj
D/X8S/g,Lf+=K?7-Z!^2@;K:`Eb/[$B6%EuA1'Ha.6Aq?-Z!^2@;K:`Ea`ir-TcT&4*_rsI38k(
:-pQUE+rft+E_WGCi<flC`mn4EafAmDf%9n/g,Lf+E]:ZFY4e^+FSY\$?L'&F`_SFF<GC<@r6.$
+Dl%61E\&]De!3l?Ys_'BOu33$4:igF$2Q,H[?k`FW`I_.Nj!c+?L\oFW`F^.Nj!c+?L]g+F,)X
I38l<D/XQ=E-67FF(o\<BeCMc$4:igF##m>+FAGX.!7-b1E\.iGpsjt+=M@b+>P&h+F,CY4!8Yu
+F,)XI38l<D/XQ=E-67FF(o\N+>"^M/g+LW$4:TjBlcEu+FAGX.:W^+D/XQ=E-67F-Y[H@Cia<3
-OOR*Cia<34Y@j4+=\LY$=mdVG@`ouA7o7XEb.BpA7o7^Ci<ckCcsg%-Y-b!Aft`&Ddm-kF!h</
DJXB.F!*Oe."!WiGpsjt+EelN+EelM+F+;:I=34FF)>i<FDuAE+=o,f2'=:t0-G(PBlbCI3[l1c
/g)o'$4:6\DeO'-4Z[q:+=Uh.F)>i<FDuAE+=Cl@+C]8-BQ%f:$=[gYDJsV[/n/X(Eb/ZqCjA/r
@VfCfDe!3l4YC2[?Z^3nA7T7`0JGXB-Xq",F`S[ADe!3lF!h<>+=\LZ+=eR[$6XbF+:<1,Dfp/@
F`\`]+C]8-BQ%f31^XS2D/XQ=E-67F/1r%q03fW@BlbD2/g)o'$=\$o4ZX^4HQXbJ$6UH6+<VdL
+EMC<F`_SFF<DrFDBND/D^Pl7+<VdL+<VeO+=eR[+=\LZ+=eRZ$6XbF+:<1,Dfp/@F`\``+C]A0
+>aE40d'4X/g*q_$7Q;h$=m[YAhYn]-RT74EZfF:Dg-//F)rHY0d(+FDdmc1-Y-b!AhYnd$47,8
67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIV
FDYu5De!-?5s\sgF(o,E3B:FRB5DKqF&QpoCLon%0JH6g/h1LMDdmcdD/X3$6pr^_+ET1e+Co2,
ARfg)A7]@eDJ=3,Df-[GB5DKqF"&5QD/X3$+EV19FE9&D$;No?%15is/g*PrEb/a&+@KdQBl7X,
Bl@l3-td@7@WNt@F)>i2AKZ)+F*)IU+A,Et+DtV)AKYE!@;L41BlbD8Afs\T$;No?+EqaEA9/k9
+Cf>-FCAm$Bl7Q++<Y3/Eb/a&+<VdLA7]@eDJ=3,Df0V=+<VeNBl%T.+<VeIAT;j,Eb,[e:-pQU
D/Ws!Anba`FD5Z2/e&._67r]S:-pQUG%G]'@<?4#3Zr<OG9B:A+EDU@ATJu+DfQt:De!3l+CT.u
+D5M/@UX'qDIIBnF"Rn/:-pQB$;No?+>GJk:18!NF!,17+FAGX/hSb!I=35HEb-A0De!3l+EVNE
FD,5.6pr/+DIakuEb,[e:-pQU+<Ve<EHPu=@;KLmF<G[D+DtV)ATJu.DBNFtCi!Zn+EqaEA90@G
;f<d,B5DKqF"&5KF`VX6$;No?+<VdLAU%^$F_#&+@;Ka&Ci<flCi"A>@<6L(B5V9k+@JU?DIIBn
F!,(8Df$V8F`_28%15is/g)8Z+EM%2E+L/.De!3l+CT>4BkM=#ASuU2/g+,%CLnVu@<,p%GA(Q*
%15is/g)8Z+FAGX/hSb!I=35U@;TRs+DkP/@q[!&@;TRs+DG^9FD,5.Dfp/5EZfF5DfB8?%15is
/e&._67sB'+<XI&FCfJoDfTAO3Zp4$3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL
:-pQU-u!Qe6n'6mF!,:;@ps0rFDi:DBOr;S6m,oUA0>c.F<G(3DKBN&ATD?m%15is/g)8Z+AP6U
+CQC/De!3l+E(j7-r4u-ATCjjEb$UAGA(],AKWC>F`^AeD.P.=BlbD*+Dbt+@;HA[:-pQU+<VeF
F`^AeD.Pj_+FAGXGp"RZBl6=,4Y@j61*D!n+DEGN1E\L`$;No?%15is/g)8Z+E)CE:18!N%15is
/g)8Z+=Ra,:-pQB$;No?+>PPl<Gl5dF(o9)ARlp$@;TQuEb/ioEb0,uATJu&F<G"0Gp$X/E-,b9
Bl5%]6usJpBl%T.@V$ZlDf0W1A7]dmA.8l@67sB'+<Y<5Ddm-k+ED%*ATD@"@qB^(Bl5%A:N^bj
Ed)GBA19,?$;No?%15is/g)8Z+A[-%ATCjjEb%<o+>b3%+>=63:-pQU+<VeJD/XQ=E-67FGmt*U
67r]S:-pQU+<Ve%67sB/G%G]'Bl6=,.3N>G+EVX8@<?'k+Dbb-AKYD(B5DKq@;I',AS,LoASu!h
+DG^9-r4u-ATCjjEb$U.$;No?+<VdLDfp.s@;TR=/g)9]+C61;HSQ^jHQ[PU.j0"HEaia#6pr/C
+FSY^0HbW`.NiFX+>GPmI=34q%15is/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is
/g)r&+AQ?^ATJu1De!3lCj@.3F)u&.DIm?$Bl5&9E,]B/+FAGX/hSb!I=35Z@rH<tF!+n3AKYl/
F<G(3DKBN&ATD?m%15is/g)8Z+D5M/@UX'qEb/ioEb0,uATJu.Afu2/AU,D,Eb-A6AS,LoASu!h
A0>T(+Dbt?ATAo7@rH<tF"Rn/:-pQB$;No?+<VdL:N^bjE`[1"A3Dsr1a"h%0F\@a67sB'+<Y`B
Dfp/@F`\aO%15is/e&._67sB'+<XEG/g)QQAS#gZFCB9&.3N>G+ED%*ATD@"@qB0nBl5&%+Co%p
E+O&4F(9--AKZ).@;[30BOr<)DIj7a:-pQU+<Ve%67sBpDKfc.@q[!!F!,[8F!,:;@ps1iGp$O:
F(o9)ARmD9<+oue+CT5.@<,psF<G44Ddm-k+ED%*ATD@"@q?)V:-pQU+<Ve%67sBpF!+n$FEM#.
Cj@.3+Dbt+@;KKtEb/ioEb0,uAISuA67sB'+<YTFFA?7]AN_Xg+F##8+FAGj+FAGXH[B:7AT1Ri
@<?''/Kf9\.Nj!ZI=34g+Co%pE)UjeFCdTf+Eh=:@VK^J6m-atI=3:n+F,(Z+DEGN0ea_uI3:BV
$;No?%15is/g)8Z+E)CE:18!N%15is/g)8Z+=Ra,:-pQB$;No?+>b\n7r3*Q@;I'(@;TQu@<6L(
B5VQtDKKqBBl5%]6usn%@<<W#DL!@BATMs-DJ()&AT2a)/.Dq]67sB'+<YlBCht5'AKZ)8ART[l
A0><%+D5M/@UX'q@<6L(B5VQtDKKqBDe:+?:N^bjEd)GBA19,?$;No?%15is/g)8Z+A[-%ATCjj
Eb%<o+>b3%+>=63:-pQU+<VeJD/XQ=E-67FGmt*U67r]S:-pQU+<Ve%67sB/A7]=k;flGiALSa9
F!,RFART[lA0>]&CLnVs+D5M/@UX'q@<6L(B5VQtDKI">AfrKtF`_28=)W+i.1HVZ67sB'+<YTF
FA?7]AN_Xg+F##8+FAGj+FAGXGT\LZA7]=k;flGiAN`'sG%G]'Bl6=,+F,)XI3L?fGp"RZBeCM_
0Hbdl+>jT8:-pQB$;No?+<VdLDfp.s@;TQb$;No?+<VdL.1HVZ67r]S:-pQU2(g"CAftM)DIIBn
+DGm>@<6L(B5V9k+Dbt+@;Kb*+DG^9@;[31E,]B/+EM%2E+L/#DIal&Ci<ckCi"A>Bl5&%+:SZQ
67sB'+<YK=G@be;F(9--AKZ).AKYW%Ddm-k+CT>4BkM=#ASuT4Dg#]4EbT&qF!,R<AKYf-@ps0r
@;]TuBla^j:-pQU+<VeKEb/[$ARlolF!+m6B5DKq@;I&pF)u&.DJ`s&F<GL6+=L$.FCfK:DfTB0
.4u&::-pQB$;No?+<VdL:N^bjE`[1"A3Dsr1a"h%0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._
67sB'+<XEG/g)QQAS#gZFCB9&.3N>G+D5M/@UX(hGp$O:F(o9)ARlotDBN@1Ci=N/EZfF5DfB81
FD,*#+EV:.+E)./%15is/g)8Z+AP6U+DG_;BPCsi+DGm>G@>P8Ci<flCi"A>@<6L(B5V9k/g+,,
BlbD2F!,RFART[lA0><%+CQC*Ci<ckC`m/-F(o9)D.RU,+E(j7-uX6MATE!5Eb$UO%15is/g)8Z
+E)CE:18!N4Y@j"GT^<8H[@LjH[?l^HXp]!E)UjeFCdTr+F#"Y+F,)XI3:$_A7]=k;flGiAN_Xg
G%G]'Bl6=,+F,)XI3L?fGp"RZBeCM_0Hbdl+>jT8:-pQB$;No?+<VdLDfp.s@;TQb$;No?+<VdL
.1HVZ67r]S:-pQU2D-+DAftM)DIIBn+DGm>@<6L(B5V9k+D5M/@UX(hGp$g=+CT.1F`;;2EZfF5
DfB81@;]TuCi<flCi"A>Bl5&%+:SZQ67sB'+<YK=G@be;F(9--AKZ).AKYf-@ps0r@<6L(B5VQt
DKI"8F!,RFART[lA0>;'B5DKq@;I',AS,LoASu!h+E(j7-r4u-ATCjjEb$UO%15is/e&._67sB'
+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL:-pQU-tHn#
E)UjeFCcmDBlbD0Ci<ckCi"A>@<6L(B5V9k+DG^9@;[31E,]B/+EM%2E+L/#DIal+De!3lCj?Hs
:-pQU+<Ve%67sBpDBN@1Ci=N/EZfF5DfB8?+B3#c+DtV)AKY].+EVX8@<?'k+CT=6@3B3!Ddm-k
+CT>4BkM=#ASuT4De:+?:N^bjEd)GBA19,?$;No?+<VdLDfp.s@;TR=/g)9]+C61;HSQ^jHQ[Z^
A7]=k;flGiAKZ4?.Nj!ZI=34g+Co%pE)UjeFCdTr+Eh=:@VK^J6m-atI=3:n+F,(Z+DEGN0ea_u
I3:BV$;No?%15is/g)8Z+E)CE:18!N%15is/g)8Z+=Ra,:-pQB$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3N5:EcZ=FFCfN8+CT>4F_u)>Bl@ku$;No?+<Vd^.3N\C@rH6q+EV19F<G"5
F*2>=FD5Z2%15is/g)8Z+<VdL+<VdL/hSb/%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(I;A7]7)3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%15is/g,7IF*&O=DBNG*ARTU%@UX=h+DGF1FD,B0+D,FuB-:o0+E2@4
F(K62+CT.u+EM+9+EVNE0b"Ib67sB7+?^hq1a+n6.3L`#8l%iB9LV6F:J5&/C2[Wi-OgDX67sB8
+>#Vs+tb68:IIQD76sgI94)CJDe*3&%15is/g+Y?ARTU%-RT?1%15is/g,7IF*&O=DBO%4D/aE6
@<-W9C3=E0+Dbt+@;KKt/KeqLF<G".C`l>G6k'Ju67sC&ATMs7+Ceht+C\n)E+O'%DfT]+A0>T(
+DQ%:CERG3@ps1bF!,OBD.Oi,F`VXIEcl7BBl5&&@<5uh$=e!aCghC++EVI>Ci<fj5s[eXD/X3$
3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6
A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172f
Bk)6J3ZoelATMs.De(OU-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:F               ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&o0H`,/+>Gbs1GU(-2BXe7+>G\q1H/`OG#N6rCLo1R-t-S..3N&>B6A'&DKI"BD/X3$
+EV19FE:o6Bl%<pDe*ZuFCfK$FCep(Bl%<&@;]TuA8-+,EbT!*FCcS0De*ZuFCfK$FCf*$DdmcS
@<6-m6ptTu0JHsEF(o,,A8-'q@rri(AS,XoBln'-DBL??Ci<d(.3N_DF*)J9Ci<d(;f-GgAOJp?
0P"m<ARfg)A7]@eDJ=3,Df-[GB5DKqF"&5QD/X3$+EV19FE7                          ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,(L,1,'h,+>G_r1*AA33AVd50H`+n1H.<M+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>P]+0H`)1
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
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW40KD0J0FA-o:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp+3+@KdN
+>PW+0d&2,3\rZT2)bjL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P_q+@KX[ANCqf1*Atr@j!N\1,0n+1cdEP3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0ea_<ARci<0JY@*0KD0M0KM$G$;+)^
<)6:`;aOJU9LMEC;cHOj=Y_iD$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=
6?R!YA0=WiD.7's3ZpC)+@KX[ANCqf3?V(8Fs&Oo1,'h)3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1*B>1Fs&Oo
1,'h*0fh'F3\r]($4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+>Ghu:2b:u1,(I;+>GW40f(jG2[p*$$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo1,'h*
1-.6J3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp19+AQiu+>PW+0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y
0JY=)0ek^F1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&
:3CD_ATBgS2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW+0H`))3]&QP
0fTLI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqh2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN1,(I;+>GQ20f(jI1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg
1a#1t@j!N\1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN1,(I;+>Gc80JPUB1^XQs:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg0d'D+E$-ni
1,0n+1-.9P3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh0d'8%F<E=m1,0n+2**QL
3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'8%F<E=m1,0n+2**QR3\WQ$$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A
+>PYo:LeJh1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh0d'8%F<E=m1,0n+2**TM3\iT#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN
1,(I<+>GW40KD0J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P\p+@KX[ANCqf1*Atr@j!N\1,0n+1HI<M3]/l($49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]6
1H7EP1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pbr+@KX[ANCqg0H`bp@j!N\1,0n*3BArM3]&T!:et"h?YXLiCh\!&Eaa'$1,04F:-pR0:K(5"
C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&DfQsK/M8J83XlE*$?L'&F`_SFF<F.E5sn((3Zoh)+?CW!
.1HVZ67sB/C2[X!Blmp,@<?'0+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^67sB[84c`V5u'gD6QdKo+<Ve%67sBmF_kk:E+*WpDdso/@<?0*
/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?/l$;No?+D,P4D/!Tj@qBanGT\+O+AP6U+D,P4
D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0%15is/g+eIE,961
+<VdL+<VdL+<XEG/g,">CLnW)@<?(*+D,P4+D5_5F`8HOGps10:-pQUBkCd`ATMEmFD5Z2+<VdL
:-pQUBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g+k?@ium:+<VdL+<VdL+<XEG
/g+bEEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;+$;No?+EM+9C2[X!Blmp,@<?''+AP6U+E2@4
E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_
:-pQUFa%Y1FCf]/Ed)GBA9/k9:-pQUF`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dSFa%Y1FCf]/
Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@B;$;No?+EqaEA8Gt%+<VdL+<VdL+AP6U+DkP&AKYetFCf\>
Ao_g,+EqaEA0>]&F*&NQGps10.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDeX*1ATDl8+=CT4De*Zu
FCfK$FCcg/$4R=j1E\_$0I\+l-OgE)Ed98H$;No?+E_a:+CT/5+E1b,A8bs#F(KG9Bl5&8BOr;Y
:IH=EEc5Q(Ch4`$DfQtBBPDN1D.-pfBl7Jk$>F*)+EqCA?X[\fA7$HA-W!]07R^3Q779s<:..lF
?YO7nA7$],A8a(C<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f4ZX]^;FO&D;GoqO:dIiE:IAK'C2[Wi
+D#G$/e&/%AhG2V/h]I<-ZEL3A8bs*-:KO9+E1b,G%G\W/g*50HQYF4/mg@VFDPP3.!''5Cht4n
84c`V5u'gD6XO8:De*ZuFCfK$FCef1-QjumG%G]8Bl@l:.3L2p+@B$LA8a(0$6UI4D/XQ=E-67F
-VdH:762Q"A867.F<GO2DIdZq+E1b2BHV#$+CfP7Eb0-1+Eh=:F(oQ1+=JTgE+*X-ATB=L.3N>G
+Du+>+?hq21+kR>0eP1.%16ZaA1e;u@psIhBJ'`$+<Y`BDfp/@F`\`R78d#Z;E>q>@;]Uo@j#Z-
F<GX9F<E.X@:X+qF*&O(84c`V5u'gD6XO8:De*ZuFCfK$FCef,%16ZaA1e;u.1HV`:IIuc8l%iC
:IAK+A26(Q$6`VgDe*Bs@j#l3A8`T,BleB%-u*[2B6%F"BPCst06D,CDdR6tA1hh=B.4s28l%iC
:IAM4<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%iC:IAMB%16'J
AKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+%16N]
A0>_tGp$O7E+NHu+DG^9DffZ(EZe=W6r+qABleB;/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa
?Y*tuCiF#BC3F&u@<Z4&DIR`CD(me+2g/Ol?m%gTDKBN&ATAo-D/aN6G%ki,+D,P0F<Gd=BkM+$
F!,17+E2@8DKKH#+CoD#F_t]-FE9&W<+ohcAoDR/+E_a:A.8kg+<Y97EZfFAF`Lu'+Cf>#AKYK$
F_kS2@V$Zj+Dbb6FDPM2@W-'nATAnF+D#V5ARfF_Ci"A>FD,5.@rH1%Eb/c(FCf]=F"Rn/%14jC
+CI<=A9hj/EcO*Y@V@SRF)#MMF)uRdBl[iq3+"jW+@op]D/X<+H=\4/De*E%@rH1%EcW@3DIal%
Df0Z<+CSc#Df]tB?u0n+Ch[s4Bl7R)?m&lqA0>9!@;]Uo@pgF#H#@_4GT^L7Ci=?.DJ(R2$6UH6
6ZmEiASuU+Gp%3BATME*E+*6l@:s.m+E_a:+Co1uAn?!oDKI"5Df0Z<+CT.u+Cf>+DfTnO%13OO
1G0eX4C:!e0KEu1DK0?912UGY20<qbG\D,7@VBag5%#L2AThd!G9CR;G9D!G+D,b4Cj@.7D.7'e
+CT)&+ED%*ATD@"@qB0nAoDR/F!,17+E2@8DKI!t6q25M%13OO1bKnY4C;T0AMncf1i.8H2fW[o
D)c$=E&TInC3DIA5%#L#Df0W1A7]d(@:Wn_DJ()"@:FCf+=LZ7C`m1q@r$4++Eh=:F(oQ1F"&5R
D]hYJ6psg</e&-s$8jFY?p%dSCM%="@W6L"2JHrJH=qPD0l8pm3FR&>?Tqj?6Z6j`Bk1dq+CSek
Bl7Q+@3BH!G9C=5E+NotBm:bBD]iG&De(J>A7f3lA7]glEbSusDJ()*Dg*=GD]j(CDBMPI6m-S_
F*)IU%13OO?s@2[A1_nAA8ba]%16'16r./^:IJQ,A26(Q$6`VgDe'u4De*c/Ch[s4>psf5A8bgi
De(J>DJ(C@?qO3_?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qO3_?m&lqA0>T.F!,OH@Uj4_
F)to6/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#
+EV%5CG$&'6?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,
BOPdkATKI5$:/KLD_*#OART*l>@;,YF*)>@GqNrE?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+UD.G()$?U2/F(Jo*GA(E,+=^f0FEM#.Cj@.9
Dfd+9D/a<&D.RU,ARm8C+Acl_DK?q2D]iq9F<GI4@qB_&@<-'uGp$s4FCfK,@;KY(AM+E!%16KI
@V'1dDCosKA8ba]%13OO0eOSV4C;STBOj,B0m.JP0Q8dlBQIuJEB/&RH=UYq5%#L4ATMr9A8-'q
@rri(AS,XoBln'-DC9KJBl.ft@rri3DBMPI6nTT]BOr<(ATo8-Bl[cpF<G+*Anc-sFD5Z2+D,%l
Bl%L*Gp$g=+A*bjDKKo;A9DBnF!+m6DIn#7A8,[s@;om&@!d6.+CKVG?m&ukCh[a#FCeu*D.R-n
F!,C5+Co%qBl7X&B-:o+Ch[cu+Du+?DK@?OG%G]'F"AGBA9MO)@WNZ#DIal"Df0<4DI[d&Df0VK
+AH9[AKZ&:Eb-@c:IH=8@;[3$@;]UlAKYDtC`mh5ATME*DIn#7AoD^,F"Rn/%14jC+CI<=0PP*0
H#.e<2Iptf2g/nPEI'TbDeh4?BjX&3+B)ukBl%3uCj@.?@;BEsF*2M7+CJr&A8Gt%ATD4$ARHX)
DfTW7+D,P4+Co2,ARfgrDf-\.AS,XoBln'-DK@?OF(JoD+<Xlr<)5nX?YXLiCh\!&Eaa'$/o>-,
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$
02t_8:L@jTA8Gt%ATD4$AM.h1.4u&:%14mD+CI<=1GNu2A8c()CjBuBF^\luF*DPB2`NX5E*ke:
+B2onF<Ft+De*ZuFCfK$FCei&Df-\7@:N)3+CT.u+Dbb0Fa,M]<-Mn^CER>'+Dtb%A7]:(%13OO
1bKnY4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5
Cggdo+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdk
ARlotDBNt2@qBP"+A*c"ATDj+Df0VK%13OO2(g"Z4C;T0AMncf1i.8H2fW[oD)c$=E&TInC3DIA
5%#L#Df0W1A7]d(@:Wn_DJ()"@:FCf+=LZ7C`m1q@r$4++Eh=:F(oQ1F"&5RD]iF[:IK;CDesK&
/g+,,BlbD?ATD6&BlbD9Ec6,8DJ()5D]i_%DIe#8BlkJ=BQ&$0A0>>m+E1b0F<GL6+EV:.+EMX5
DId0rA0>r)FEMOT%13OO2D-+[4C:!^Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(
@:Wn_DJ()#+Dtb7+CT5.ASu$mGT_*H+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et
+EV19FE9&D$4R>$/g+Oa?T'TS2JR#JEGIQkBPB83FYS2f@rc'oD),H^?m&E^AKYB'FD5Q4?m'W(
Eag/!AnQ-l+=Li9DIal&Ec6)>+EDC=FE8lRA8c%#+Du+>+CT5.ARTU%FDi:8@;]UlAKXSfDIIBn
F!,[@FD)e>DId=!F(9-/ATJu%?XP!qEc5o.Ebp"R+A$HoATMs-B45mn+CT.u+D,>4/g*nb<(/hj
?tO%l?m'0)+Du+>+CQC3@<-H4De:+a:IH=7F`\a?F!,X;Ed8d@@;]V$+EqL1DBNG0ART[pDJ()#
DIal,@;0V$@;0UnDJ((A@r,RpF!,+9Dfp#?.P;/;%15'I+CI<=@rjGJA8O;GDDs:]Cj9N3@qKO2
1iIOpBO<r2+@C'bF(o/rEZee$A8,po+CT.1@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m
+D>\;+ED%*ATD@"@qB^(Bl8!+A7ZloBl[cpF<G+*Anc-sFD5Z2F!+n3AKYYpDIdQpA1e;u%15*J
+CI<=1h'p*H$4.@2g@9'2)I+13-oBsG&B!J3F=sX+@C'bF(o/rEZee$A8,po+CQC#@Us1oE*sf3
ATD6&FD,*)+EqaHCh+Z4DfTV9Ch[Zr+CJ_oF)YM0@Wcc8F(fK9+E(_(ARfh'+DG^9@UWb^F`;CS
%13OO0eb4&?p%e,0k>B<CLf.VH#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&Dg,o5B-:T2
045o2F!+m6E+*j%+E2@4AncK4Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohcBQ%a!+Co2,
ARfh#Ed8d;Df0`0DKKT2DBNk8+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(A8-'l/e&-s
$=I(LDIb>@De*cl?k!HB:IIucC2[X!Blmp,@<?'fD.GC\%147_C2[W*Ch\!&Eaa'$+Dbb1DI"Z)
DI[L*F(oQ1F"_9HA8Gt%ATD4$ASc(!DJX$/FDPM@E,K;;?tsUjCh\!&Eaa'$?m&EE6r+7!4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.C2[X!Blmp,
@<?'g/e&-s$=IUeA8Gt%ATD4$ARHWpF!+m6>=pP@:IJJ:BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.).3N,:@<6K4B6%p5E$079@<<W2Ec6,8A7]fk$<q=\
FCfK$FCcS6Ec5T2@;TjqDJ*6'BQS?83\N.&Blmp,@<?("Ec5T2@;TjqDJ(S3Df%.ADId='/nf?D
CagKJF`;;<Ec_`tAoD]48g%V^A7Zm)FDl22A0>T(+A,Et+Co1rFD5Z2@<-'nF"Rn/%16'JBlbD-
De!p,ASuT4FE1f"CNCV;ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$
FCei4%16'JAKYGjF(HIM2BZL<F(HJ.DKBB,F(o`1G%Ddd<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8
BOr<&BkCpuBl.E(De:,#+EV%5CG$`$F<G^DBlS9,Cj?HsCggdaCi^_1@:NsnFCB6++CT.u+DkP&
ATJu.F<GO@F)u&)Ch4`!Df'H-Ch4`"ATV?pCh7-"@q]:gB4W3!BleB7EbT*+%16Qi+EVXBCi!g'
B-;,9ATAo8BOr<0ATDj+Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?5%13OO?s@)OB5)68FDk].?!n*K
%14gB+CI<=20h&q@PqeABkMU82gBLfFu!M\FYb^*1LE=R+AucoBldi.@;]TuFCfN8+D,P4+Co2,
ARfg)A7]@eDJ=3,Df.0M8g$,H0JXbbDKKo;A9DBnA0>DsEb/a&+Co%qBl7X,Bl@m1%144#+EV:*
F<G"4AKYMpCh[a#FCeu*@X0)(H[B-C@"!H2/g+,,AKYMtB6%F"BQG;)Eb-A%DBNM8@qBV$Bl@l3
FDi9o-Z]_(+<Ve@DJ!]r@ruF'DBO"1BOu$l+CT.u+EqO9C`mb4E,]W)+EV:;Dfo]++CT)&+A*bd
De*E%E+*d.Bl7Q+FDl)6F!,17@r-9uBl7Pm$6UH6?tsUjCh\!&Eaa'$?nMlq%14jC+CI<=2`#Vi
F)a$Z1jO:$@;Tk(Be_JTA7]1qFC.4>+A$HoATMs-B45mn+EqLE+E_R4ATD6gEZek*@<,ddFCfK6
+<Y'!?m'0$+A,Et+D5_5F`8I@@;TRs+C]A&@;?uZ@8pf?+E2@>@qB_&Bl7Q9+@^9i+Du+A+DQ%?
F:AR"+<Y35DC9NKF`V+:F`(`$EaiHt+Cf(nEa`I"ATDi7Bl5&+Ec6)>+DtV)ATKI5$4R=u/g+Oa
?T*"@@sD]D0K=,iBJVS&D..=%G%EU@3+6/X?m%gTD/Ej%FE8RKBln$,F`\aMBPDR"F)YPtALns8
/nZdZ?qs$@DJpY=E+*6f+D#5"?m';pGp%!CF<G(3Ci=>:E,ol9ATDU4/g+/8ATAo$:-pQUF)YPt
AKYr.ARTXk?nMlq%14pE+CI<=@Pr4N@s)O0A9g"UFa8.PBQn5L1c&`RCgTA6+B*Q'FCBD:@rH1%
EbTE(+E(j7GB.,2E+NQ&@W-L&A0>PsFCfK2B4Yt!F`S[6EcPT6F!,=.Gp%!CF<G%(+Cf>1Eb/a&
/e&.1+<Z,^ILQW,+<VdL+=D/ODffQ$+EMXFBl7Q2+?L\o59M^8+>PVr0eb:1+?L]-3[\oiDffQ$
+EMXFBl7R)+EqOABHV28D.Ra%@rj",$6UH6IXZ_T$4R>"/g+Oa?YjC1D/V-eFY[u[1ML\_D0@im
C2\<*G$dF@+B)ukBl%3uCj@QSGB.,2E+s3&+Du+8DJsZ8F!,[@FD)e5Df021ASkmfA7T7^+E;OB
FCeu*F*)G:DJ+#5D..]4DJsV>@rH1%EZf=ADfB9.CjA&N$6UH6IXZ_T$6UH6+<Ve%67sBP;aO52
0f'q^BOt[hF*2=/$6UH6+<VdL+<Y#N0HaY++Co2-E$-NB0f*<M-OgD*+<VdL+DEPd@q7_`-SRP?
2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=%144#+<VdL3B/rU
2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU
2)I*E0ebUI2`<NM1GU[=%144#+<VdL3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM
1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=%144#+<VdL3B/rU2)H['
HQ[b[0d&7p0d&7p0d&7p0d&7p0d&7p0d&7p.k`"t.Ng)m0etOA2)[BQ3@>q`/g+F/$6UH6IXZ_T
$6UH6:/=hX3Zq+7DJ().Bl7L'+CT;%+Eqj7E,]B!+C\noDfTD3B5_L%B-;;7+E1b,A8bs1+B3#g
F!+t$DBNb,@:UL&D]j"-DIdZq%144#+CT>4BkM<tDJ()+DII$bF`Lo4AKZ)5CLqC)+EV:*F<G(%
DJjB7+C\n).V3%0Bl&&E+E1b2@q]Fa+CSl(ATE!'Eb'5D+@^'i%144#+EV:.F(HJ.DJ!p#EHPi1
F<GL2C1UmsF!,[@FD)e6@;^3rC`lD[<+T/SARoLsF#kFbARuulFa%Y1FCf]/Ed)GBA92-2%13OO
?s@2[A1_nAA8ba]%16QeBl%<pDe*ZmFCf\P0ht%f.UmO7Ch.:!A8G[rAU#>=/M/(fB4YslEaa'$
F!,OLDKK<3+D>J%BP_BqBQRfr+A,Et+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;
EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?
+CT>4F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEs
E[_G):-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@
@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGq^urEb0E.F(Jl).!g2cC2[X"@;0UdFCf\G%15is/g)o'
D..]E1*@ukH?s=EA8PahDD#C,F=A>@A7T7^%15is/g)o'D..]E1E\)"@r,^bDKKH7/7N%0.3N&0
A7]9\$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNEEcl7/$;No?+>PWg
Dg!ln+CSekARlo3C2[WiDg#i+G@,H'GUX(/%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-+<W%H
De*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eODe*ZmFCf\W
3B8H0>9IEoATD4#AKX)_5s[eODe*ZmFCf\W3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1ATDl8
+=CT4De*ZuFCfK$FCcg/$4R>;67sBmATVEq+<Y-9Bl%<&F`_>6Blmp-+CT.u+A,Et+DG_8ATDBk
@q?d!BleB;%172oE,9H&+D58-+?MV3Eb/Zi+Eqj?FCcS(AS,k$ATMs6+Cf(nDJ*O%FE/Kr:IJ5X
6m,'I8l%ihDKKH1Amo1\;cH%X6pX^=+A$lO:IK;CDesJn<'a8I5uL)n8U=!)7!3TcDKKH1Amo1\
;cH%X6pX^=-OgCl$;No?+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$
A8bs@3Zpgd6XO22Ddjhn+CoD"4ZX^43dWJI:dJ&O?XH`2?XHE$6uQOL%14ITDeO#26nTTK@;BFp
-QmJAFD>`)Ch\!&Eaa'$+CoD#%13OOEc5l<FCf\[3ZoerH?s=EA8PahDC5l#%15is/g)NfH?pq]
D..3kF!,R<BlbD/Bl\9:+E)-?Eb0E*EcYe7A8-'q@ruX0Gp$^5Ch4`,@;TQuF)Q)@Et&I(Eap56
AU#Rc3Zq-_6W-]e@;9^k?Q`umF<GUBDfg)4GUt4LFCf\E%172gGWe)14*s">FCf\+$?Tj(4ZX]6
-SH]nINs#IEcYr5DBjUZ,;1Dq4"u"R:IJ5X6n'6gBOPdkATMs6+EV1>%14M*Db;-oAU#XHGB.D>
AKYN%@k;Y=Dfg)4GUt3pFCf\E%13OO:-pQUAn?'oBHV5:ATDs.ATo85@<?(*+CT.u+Cf5!@<*K)
DKKH1Amo1\+EV1>F:AR)Eap51G'%;?-TsL59gM-E:L@OFDe*2tB4Z0--YdR1?Z1+%ATqL'AU#R3
$>F*\@qBajB0A9u-Tin0HtmS1BkCd`AUH']4spdHDg$56GWe)1-u!:%@qBajB-:YpAoD^$F*)FF
4*s">Dg$56GUY1XAmo1\FCAek$4R>;67sBhE,]B+A0>B)EcP`/F<G:8FCfK)@:NjkF(Jj'Bl@ku
$>O0]@q@ea+>5d)+FYq7H:gt$Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%isDf9H5;cH%X6pX^=/4k.[
:IK>IBl8$(Eb8`iAQ)Po:..BG6k'KAG'%;?4ZX^(G'%;?/1<7u9L^H^-t[C<D/!Tj@qBanGT^a5
@:Njt/2AGD7L]\QFDjboDg$56GUXbZEbTW,+CoD#/15aiC2[X$G%kN3/p(ZL-OgCl$;No?+A,Et
+Cf4rF)to6%16i[Ccsg%4$"a(De*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6
+DPh*FDl)6F!hD(Cijnb3Zr'UDfp#8@<?(*-8%J)C1D&h$4R>;67sC%ATT&/DKKH1Amo1\+D?%>
ATDg&Afu2(EbAs*Et&ImFEfr0+DPLs@q@!.ATVWu@:Nkj@<-"%-8%J)Cijn2$4R>;67sC'F(HIA
H?pq]E,oN%Bm:bBD]iJ3DeW`)@r,RpBOu6-GA2/4+=CoBA1&KP/h^aR@s)X"DKI"5Bl%@%%172g
G\1Z+ATL!q+=K?_Ddt4=/1)u5+=K?"H?pqf+=nil4s4TMC`k8U/j:C?-SBLPGUFUC$>ag/+Eqj?
FCcdO4s4rYG\1Z+ATJ:f%15is/g+eIDfp"A@WcC$A0>>iFCSu,F(96)E-*3S+DbJ.AU#>?FD5Q4
+EV:*F<G(3D/a3*AKYVsDImisFCeu*Anc'mEt&IkCgqO$Ch.X!GWdZ%-mpZs,CX9GDfp#J,CV9n
/95ZIFED)=.3N,6@;]^hF*)FF8k_QO8PDNO79C!+.!0Au:K(48C2@@%Bl%=%AU#XHGB.D>AKY`(
@WcC$A7Ath4Y@jfDdt>=Df9`>AU#aR/n/72-OgE(D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5
E?K"4@WcC$A7Ath.4cho-RU$367sBW6q/;/Df'H-Ch4_u@<;qc%15is/g+h9DIe#8@UX@gBHVA+
EbTK7+EV:*F<GU8D/XT/F!,R9GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]>DK^+L4ZX][5snOG?X[\f
A7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>AKYN%@k8u]0Onp1@;^0u
GV3H6F=.M)%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*ZmFCf\W3B:GU
F_PZ&C2[X!Blmp,@<?'s@<?(*1,2Nj/h1=QBl%<pDe*ZuFCfK$FCf8sFCf\>F"Jsd+D58'ATD4$
ATJu8H#@_4GT^[6B4u*qB4uBuA0>W*A8Gt%ATD4$AKZ&4F`Lu'+A?3CAQUPo$;No?%15is/g*Vt
Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUA8bt#D.RU,+Co2,ARfh#Ed98H
$;No?%15is/g+SDF*2>2F#kFRF`MM6DKI"EATDj+Df0V=De:,2@;]Uo@j!1=@;]Uo@j!NZ3A*$=
0d(CT+DbJ.ATB4/$;No?+<VdL+<VdL+<Y0-ARfKuDJsZ8+=L2[8Q/GO:..lF.1HVZ67r]S:-pQU
:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>i$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JY>!@<jR]%15is/g)_t/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>PWf@<jR_
+EM47G9CgACj@-OC2[X!Blmp,@<?'5@UX@-%15is/g)o'D..]E3$;aGF)Yr(Gp$R=Bl%<&@UX@$
AoD^,@<?U&A0>u4+EDUB%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW*<-YdR1Ch\!&Eaa'$
-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=KCghEsGW@cE?Q_Km+=BH@6#(=KCghEsGW@cE-QlV9@rGq!
@<6!&4=<E\6#(=KCghEsGW@cE-OgDmDeX*1ATDl8+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&
Eaa'$-OgCl$;No?+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,+Co2,ARfh#Ed8*$A8bs@
3Zpgd6XO22Ddjhn+CoD"4ZX^43dWJI:dJ&O?XH`2?XHE$6uQOL%14ITDeO#26nTTK@;BFp-QmJA
FD>`)Ch\!&Eaa'$+CoD#%13OOB6%s/@;TR=3ZoebDe*ZuFCfK$FCcg/$4R>;67sBnASu("@<?''
B6%p5E$/t*FCf\+$>OBiASsXl+D5_6Ch[u6B6%s/@;TQb$7Bk(0Hb+HEc5l<+DP_7Bln0&+DP_2
G%kN3+DP_&De*E%C2@@%Bl%<h@<<k[3Zr0RB4Yri$4R>;67sBo@;]V$+C\c$@q[!+@rc:&F<G[=
@<<W4ASl@/ATJu9AU#kE@<?(*+EV13E$/b,Ch7Ys$7Bk(0d(@WF=044+AG-h;GUY.C2[Wi+D58-
+=CZ8ARTIuAU%Qk@<<k+$7L"785E/`+?Op2/8fWQ.3NhTBlmo/A8bs/-SR5aCh7$mFCf\L@UX@+
%13OO:-pQUDIIBnCh7[/+Eh=:@LWYm1E\_$0I\,b@k]#T/g,1E0b"J(AhG2\/NS/"A8a(0$6UI4
D/XQ=E-67F-Z`s4Cht4A-RUGnA7BP$DffQ5E?K"4@WcC$A7Ath.4cho-RU$367sBW6q/;/Df'H-
Ch4_u@<;qcAScF!/e&.1+EMC<F`_SFF<Dr";Gp:g3Zr'HDImisFD5W*+A?3CAQU',4s247B6%s/
@;TQb$>"*c/g)8G$7QDk%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*Zm
FCf\W3B:GWAS,@nCiiZuATDQtH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZAS!!.BkqE*
E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?
+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C
@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)
ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le
7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@0
01ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`t
BkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB)
;eTlWF=Tg>+q4kg$;No?+@p']Ed9$R+<k9;FEB*WB5Di;+?;&.1*CdZEbf*(Dfor.Et&IO67sB@
+Z_A=+=Jrn+BosK+Z_A;+=C]/Ecl7B,VU?F+?:T+1-$I*-Qjr_-mC\p3?^F=3%$(&+=nW_.3Mh;
3?^F=2]sIq-Qjr_-n$<h+BplL4usf6-RU8g4XhL6+Z_A:-RU>c/0H;f-RT?1:-pQU3?^F=3F+@D
3?^F=2^`-FEcl7F0O$O\3\i^$-S-Yi3]S?E1,pO5.4ciN3?^F=2^^.rF`2A5+?:T+1,^C3%13OO
7P[%[4&TX,@;BEs6ZmEiASuTO-Vd6-:`sdiD..3k+CfP7Eb0-1-OgDMFE21J7P[%[4&]^4+@C9l
Eb0-14"!cp9i)sRATT&)F`MM6DKI68$:AoUCb&FtBkDH;7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:
F=.M)7Pd+\4&TX0F_Pl-+A,Et4*"nPF_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#
AKXT@6ouf3De*d(+=nXMDe*cuAgniW%16$IBkDH;7Pd+\4%`::+@p'[E'%fQA8#OjE$-hD$:Zj6
0KV[6@Wc<+;KZk=3?^F=3F+@D3?^F=2^`-FEcl7F0O$O\3\i^$-S-Yi3]S?E1,pO5.4ciN3?^F=
2^^.rF`2A5+?:T+1,^C3%15Q_4#&frATMr9;f-GgANM878PN#(F)>i2AKZ)+F*&c=$<(VPAooOm
2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@BPDO0DfU,<De(U^$4:EWDImisCbKOAA0<HH
@q]:gB4W3!BleB7Ed8!T4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq8$6pc?+>GK&/i#1)/KcHc
BlGL.$6Uf@+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?j[5`
.NfjAF`V,)@X2?(G@>P8Bl7F!EcP`$FDQ4FAU%^$F_#3(B-;)#D.Rc2GA2/4+=CMD+DG^9Eb0<7
Cij_N+:8Gu.Nfj%Bl[cpF<Ft<HXIsK/hS8SI=5KGA7]@eDJ=3,Df0V=DJs_AF*2G@DfTr2A0<HH
F(Jo*?tsUj/oY?5?m$R!$6pc?+>GK&/i"P$+AQiuASkmfEZd@n+>PW+0H_c0D..a/DBMOo:L\'M
@rrh]Bk)7!Df0!(Gp#FlDegIaA8-."Df.!2$6Uf@+CJr&A8Gt%ATD4$ARHX"@;]Uo@kUMa<+T/S
@UX=hA0>E$@s)X"DKK</Bl@l3FDl)6+E_X6@<?'k/0K"FANC/*+<VdL>?,`YDJ(),De*ZuFCfK$
FCe`+BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$
FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1.1-D).Nfj/ATo7_D..a/DBNn=Bl8$(A0>GoBln'-
DBNk0+EV:.+=Ki):L\'M@rrh]Bk)7!Df0!(Gpus2FEDJC3\N.1GBYZJD..a/DD#F;D(fF=01%?P
9eo@.9hn)^/d`^D+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj
/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:'-5+<X9P6m-#OG%GK.E,B0(F=\PEDf0W1A7]d(
E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%rCi]q++<VeJARTUhBHVS=
F`JU@De!3l+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,
CLqc6?pZP,9eo@.9hn)a$48"&,9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&s
Bl7Q+7:^+SBl@l<$47n*+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e33+<Vd6
+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[8g+<VdL<HD_`F_i14
DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI2$6Uf@+=M;BFCKB,
Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ2$+<VeIAT;j,Eb/c(
@X0)<BOr<'@:O=r+=L]ABl%<pDe*BmF*)G:@Wcd,Df.!V+B3#gF!,O<D/a<*Anbgt$6UH6+EM+9
FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(K.+=\KV?t!SVCi<`m
F(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bi
+<VdLBOQ'q+CHg9C3*c*AU&<.DKBN1DK@EQ$48"&,9S]n0J5%%/KdGm@qBLdATAnR/0H]%0f^@)
7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1-D).Ni,.B4Z0m+DG\3Ch7HpDKKH#+>"^WARuulC2[W8
E+EQg+BN9!BHVD1BlbD*A7TCrBl@l3@;K`e+<VdLE,8s#DIm?$8l%htAn>CmF`M&7+CT;%+Cf>,
E,9*-AM,)pEc5e;DJs_ADf-[i:IGO4+<Ve:BOPdkATJu<Bl%T.@rH7+BleA=De:,$F_;h/Bm=31
+CT.u+E)4@Bl.R1@<?4%DK@E;+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?&%+=\L<?t*b[
FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u6
05>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9MDIP%%$6Uf@F)Po,+DkOs
Ec6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:$47n*+Dtb7+CJYk
ATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'nF"Re,,9nEU0J5@<3B9)B/Kd?%
B6A9;+>Pr.+>PW*3=6*9.Ni\=FCSu,Eb0&u@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss
3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@,$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;
2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\&+<VdLCh7KsFD)e8Afth2DIIBn
F!,R<@<<W%@;[2sAKZ&9DfTE"+DG^98l%i-+A$Yt@ps6t@V$['ATT&:D[IU0+<Yi9Cis<1+C\o(
G@b?'+>G!IDIakF2)Qun$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%
+EVNE?njVa3](4s$48"&,9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu
@<j:/$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?j[5`.Nhr'Ed2Y5+A-cqH$!V<
+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"
DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OVWk+=\L+F`;VJATAo2
DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XQuP+BqH66m-;S@N]Q,FCep"DejE"-tm^E
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1r%FAS!N3@<6O%E\D0GA8Z=-AR]RrCNCp3$6pc?
+>>E./ibpM+>"^3@ruWuATAnJ1b9b)0JPNo$6Uf@?u9dt?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj
/oY?5?j[5`.Ni,1FC65"A867.FCeu*FDi:EF(HJ%ARoLs?YX7q?XP"!DId=!+CIf4;d_3b$6Uf@
+Cf(nDJ*Nk+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/d_q..Ni+f
6pjaF;bp(U?m'N%F<G:8+CK//De<^"AM.\3F'p+B+E_a:Ap%o4AoD]4F(KH8Bl7Q+E,oN%ATDg&
A0>8p@rH7+Deru;AU%co+D#(tFDl1P$47n*+CIf?:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=
E-,f4DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%htD.-ppD[IU0+<Yc;G]Y'BF!,OGDfTE"+CT=6
@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=$6UH6+EV:.+DbIq
AScE1@<3Q!8lJ)T8PiAo+EV1>F<G:=+D#e/@s)m)A0?)0Bl%?'DffZ(EZfILE+O)5@<,p%DJsVL
$48"&,9SZm0J5@G2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALRrn+=\LBA7T7^
+CIo8=@GVR<^fno+Du+?DBO%>+CK(qD.R3cFE:h4/KenEG\(D.@<6L(B5VQtDKI">G%G]7Bk1ct
FCAf7$47n*+D,>.F*&Ns:IH=GASbpdF(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI-tm^E
E-"&n05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1A7TUr+ED%4Df]W7DfTQ'F"Re,,9nEU0J5@<3B8l<
/KdbrGp"js/0H]%0fU:(FCfN8+E(j78ono_FE_/6AKXK7<$63mE,TeH$47n*+@9XQ@<Q@'F`JUC
AftJlE-#T4+=C&_:K0eZ9LM<I-T`])6;10F-X\',BOPdkARmD9$6UH6:i^8gEZfIB+EV:2F!,L7
Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA-sG%+CT.u+EV:.DBN@uA7]9o
FDi:DBOr;oF(96)E--.D-[$kF+Dbb5F=n\8BPDN1Eb0<7Cij6!+DG^#+<Ve7F(96)E--//+Dbb0
ATJu1Bkq9@$6UH6+<VdL+:8D]<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E
@rc:&F>$U)=CuSTE-Q59/no'A$6UH6+<VdL+:956+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieS
EbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9$6UH6?uoguBlJ08?m'9"DIml3Ch[Zr
3XQuP+<VdL+<V!t#ukJ<Ao^slG\q7>+FZXN:Id';AQWPb=)`D$CbBF:Es`3[$6UH6<+oue+Cf>-
AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"ReB+<VdL+<Vd6#mkQeDfd*E+F[a0
A8c@,05#<6E+irqF"_KKDfdXOCi=DJBkh\r+<V"6.NhZ4E,]`9F<G16EZdss2D-[<+D#G$ARlol
DIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,od+<VeEDg*=BDBNb0An<*+F`;;<Ec`o@
$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0
E\7\A$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1$6UH6
+<VdL+AP6U+>"^XBOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F"Rb*$6UH6+<VdL+Dkh;ARnAM
A8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0FApF+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hT+<VdL
+<VdL-t[U>@jsQ%+Bos=+>=of+C,<s+<VdL+<VdU$4."G+=\L"+Dtb7+DtV)AKYE!@;L41BlbD=
@:p]j-p0O>4ZZsnBOPs)@V'+g+CSekARlp*D]iG*@;TRc@<?Qu+EVN/+<VeFG%G]7Bk1ctD/"6+
A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBK9/+<YB>+E_a:
A0>T(+CQC1F_tT!EZf:4+A,Et+EqaEA90@1+<Vd6+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlol
F)u&.DJ`s&FE8QQ4?=oS3XQuP+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r
@;]TuB5DKq@;H8n+<VdL+<Ve;DETTp-p1ilI4f5Y.3L/g/j:CG<)Z@j6V[t2+<VdL+<VdTA8WhZ
3ZqsAF:&<\$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uX
A7[A9:Ng;iEbT&q+Cf>,D.RU,Esa$4+D>2,AKYGnASrW!A7T7^+EVNE8l%htGAhM4F!,UHBl7Q+
FD,B0+E1b2FCfK1/g(H,$6UH6+<VdL+<Vd6,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKn
$6Uf@?tFFf+CSeqF`VY9A0>u4+C\o(FCfJ8F*2G@DfTqBARoLsBl7Q+GA(Q*+EDUBDJ=!$+A,Et
$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bi
+<VdLFDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(K.+<VdL+<VdL
:-pQU<+U;r+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH
+BN8pA8c[5+EMgLFCf<1$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>
ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1.1?+<VdL+<X*@6VgHU:J=2a@;9^k
F`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OL2'
.NfjAC2[W8E+EQg+E_X6@<?'k/d_q1,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1
@q@(r$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*FCf]=
+Du+A$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6
@<?'k$6UH6FDi:CF`;;<Ec`FGBPDN1An>CmF`M%G$6UH6$6UH6+<VdL+AP6U+D#(tF<G:8+E;.1
A7Z)j+<VdL+<Ve<A0<7DDfTB+@;TR'$6UH6$48"&,9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEl
$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065
Bl[cm$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I$47mu+<VdL+<VdL+>G!XBk(p$2'?gJ+=AND
+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z#+<VdL+<VdL
:-pQUEb065Bl[c--YI".ATD3q05>E9-OLt=+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-YA0<6I
$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OLt=+<VdL+<VdL+<VdL+>,9!/d_q1
,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEl$6Uf@?t+"i?m&oe@r$4++DtV)AKYf'F*)IGBl.g*
ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_39$6Uf@+Dtb7+EV19F<GX7EbTK7F!+n%
A7]9oFDi:0C2[X(Dfp)1ARHWkBk)7!Df0!(Bk;?.AoD]4?t+"i?nMcn+=\LAC2[W8E+EQg+E_X6
@<?'k+D,P4+CJYrCg\k&$6Uf@?uKR`+CSeqF`VY9A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,
D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9-X\P6$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2$tHK$6Uf@5p1&VG9D!9B-:S1001OF3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5f
DBO%7BlbD=@:p]sF!,FBATMF#F:'-5+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIj
A0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:956+B3#c+EV%)+CHTL/h&qE
?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ1-+<YlH
Eb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq
+DtV)AKYK!@<6*nEsa$4+D,&&+DbV1F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8
E+EQg+D>2)+C\nnDBO(@A79RkA0>u4$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(K.+=\LP@WQI(
ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-$47n*+DbJ,B4W3'
Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+;s+=\LAARo0k
DJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(K.+<VdL
+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs$6UH6+<VdL+=D2>
+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43$6UH6+<VdL+D#(+
DI[bq$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs$6UH6+<VdL
+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>.V+<VdL
+<Ve<A0>c"F:&?t+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,m+<VdL+<VdL
-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN$6UH6+<VdL
+D#(+DI[bq$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$
A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U*+<VdL+<VdLARlp$@rr%b
$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCGo"+=\L"
+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu?uU71
?m'Q0$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9
A9Da.+EM%5BlJ08$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$
Bl@l3@;]TuCghC,+Cf(nDJ*Mf+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7
+DGm>Ecl7N+DGp?Eb0<'FE7d3+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS+EDUBF!)rM
Dfd+GBOu'(FD,5.A8,OqBl@ltEd8!7+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:g
B4YU+.Nfi@$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Esa$4+<VdL
+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OLt=+<VdL+<W%P@j#E+F!j+3+>P'H0f1"c
ATT&C/g)nlEb0E4+=AND$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4
+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa(s+<VdL+<Ve%67sBmCi<a(Bl7Q+Ao_<i
FD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7AKZ&*@rH6q$47mu+<VdL
+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-/+<VdL+<VdL0Ha^W1a$a[F<GdL
F!(f4+<VdL+<Vd^+C?i[+E2IF+D5e;+<V"6+<VdL+<Vd6+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRt
ATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9$6UH6A9Da.Bl7Q+FD5T'F*(i-
E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#e!+<Yc?D.Rd1@;Tt)
+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.+EM%5BlJ08/g+,,AKYMpAmoguF:'-5
+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u
+EqO9C^M:-+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+
Df.07+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$
@<6O%E\;'@Amc_g+<Ve8DIal1ASc9nA8,po+Co1rFD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R
+B)i_+CJr&A1hh3Ambrg+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt
+CSekDf-\>D]i\(F<Co5+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:956+:956+<VdL
+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Es`6s+<VdL
+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Esa$4+<VdL+<Y36F(KG9-W3B45tOg;
7n"de0a\71+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*
Esa$4+<VdL+<YN0CLnV9-OL2'.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dn
ATVL(+CJ)C:K0eZ9LM<I?nMd/+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXh
FD,&)8g%V^DJ!TqF`M&(+:956+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RH
D]j.8AKYAqE+*j%?m''"Ch.*t/d`^D+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7
F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA,#+<Y<.DImisFCeu*F(96)E--.D@<,p%
GB.D>FCf>4FDi:CFCB&t@<,m$A8,OqBl@ltEd8d>DerrqEcWi?+<Ve7;GU(f7Sc]G78dM9BlbD*
CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@.L/+Co1rFD5Z2@<-'nF!+t5
ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S$47mu+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67F
A8,OqBl@ltEd8dH@<,dnATVL(+EM+9FD5W*Es`6s+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("
+CQBb+Cf>-Anbn#Eb/c(AoDKrATA,#+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9
Ec5l<-OL2'+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.
8g%_aCh.*t$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(%$6Uf@8SrEeDg#]&+D#S6DfQt6@;]Ul
Bl7Q+AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/d_q.
.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!
+DG_7FCelk+E(j7?upO'G[Lk$+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3
F'o=^+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.
A7ZlqDfQt1BOPdkATJu9D]hYJ6nSfR,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ8
7;$6U7:^+SBl@l<$47n*+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1H
F*VhKASlK@$47n*+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdk
ATKI2$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?$47n*+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3
BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q;+<Ve-DesQ5AKZ&.H>.80
+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa(s+<Y9)Bl"o'DKKT5AScW7
Df-[A@r-(+A0N.8CghEtDfT]9/d_q..Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'
+AH9S/0IW#DKU1HF*VhKASlK@$47n*+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/
A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:'-5+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a
/d_q..Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;D..-r+A,Et+Co1rFD5Z2@<-WG
+B3#gF!,O<DJ*cs$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043
EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@
ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD$6UH6>AA(eFCfN8/no'A
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9B
F"%G'+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:8Gu.Nh3!EZf4;
Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>$6UH6>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?
>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8
Bl@l@0J,::3B&T?$6UH6$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBk$6Uf@?tFS)F(9--ATM6%
@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+F`(_4@<6L(B5VQtDKKqBCh[Zr3XQuP+<VdL+<V"6
+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:956+<VdL+<W%>D/XH++D#5"-Ts(),@Dc($6UH6
+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI2$6pc?+>>E.
/iba2/KdZ.DIjqF1b9b)0JPBk$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(
EcWi?$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?j$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4
+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI2+<VdL<+ohcF*(i.A79Lh+A*be
AS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ';!+<Vd^2)QLd
BOPpi@ru:&F"SRB$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=$47n*+CJ\tD/a5t+Cob+A0>;k
A7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5$6UH6@rH4$ASuU2/0JnPATMF'G%G_;
Ch7$cBl7Q+GA(]4ATMg!@q?ckDIal1ARopnATJ2$+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?
DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df,n)+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po
+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC1$6pc?+>>E./ibU./KdYoDKTB.
Gp"h%/0H]%0f'.D+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI
-tm^EE-"&n05#!@BQ[c:@rH3;.4trM+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XG
Eb03.F(o`7EbT*+3XQuP+<V"6+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9.3N,=DKK<$DK?qBBOr;uBl%@%$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDl
A8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?
6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.E,oN2
F(Jl7+poG8+<VdL+<V"6+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnDdt4=BQ%]tF!+n-C^M:-+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3
ARo@_+EVNE@WcC$A0>u-AI9P&+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMd/+<VdL+<V"6.NhK/
D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPF+:956+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(KD+<V"6.Ni,0E-#T4
?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA,#+<Y0-@;]^hF!,C=+CJ)95t"LD
9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt$+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;
F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRB+<VdL+<VdL$6UH6+<VdL+CoG4
ATT%B;FNl>=&MUh7402b+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0a]$G+<VdL+<V"6.Ni>;G\(D.
D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\ABOu3q$6UH6@!H'%BlbD2DBN>$
/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#e!+<YQ?G9CF1F)Yr(H#k*L
BQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUq+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(
H#k*EDf021A8bt#D.RU,F"SRB$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/
@q[!,BOqMn+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqMn
+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/d`^D+B3#c+EV13
E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>gIXPTT+CKPF7"0Pl/0G9B+<Y*1A0>9,IT&X`
I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A-sG%+EM47Ec`F7@<?''
-t%=GD/X<&A7-i=$6UH6$6Uf@?uC'o+Cob+A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:956
+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2$6UH6FD,*)+CT;%+CT5.Ch[Hk
+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;X-+<Y*)FCfJ8FCf<.CghEs+EMXF
Bl7R)+CT;%+E2@>@qB_&ARmD9<+ohM+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"
Bl.R+Esa$4+ED%4CgggbD.RU,+E1b'EcWi?+:956+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,
F<DrKATr6-F*&c:$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUj
FDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVR1+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9
@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(K.,9nEU0J5@<3&Mg1+AZKhDdm9u
+>GZ'+>PW*1("@2.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!
Blmp,@<?'.?j\#!+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AI9P&+A,Et>psB.FDs8o
04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS$6UH6
AoD]4A7]jkBl%ht$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:($6UH6$6Uf@
?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
@<?4%DCu8=$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/d`^.+=\L4FCB33
Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4$6UH6FCf]=+EVNE
>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:956
+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>m^o`,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1("@2
.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(
?j\#!+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\F<Dq`
/gk$L$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX
<D>nW<(';F<+$%U+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22
F!,R9G]YP\<+ohM+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L$47n*+Eh=;
FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuO,+<XTY
9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4m
+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/)#
+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhKASlBpFD,$-?XO3`
+<Y*1A0>9$BQ&*6@<6KsH=(&4$47n*+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19
F<Gd@ATVTsEZf4-F*(u6$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=De:,5FDl22A0>Ds@ruF'
DIIR2+E1b2BQGdK7W3;i$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA
+DkP/@q[J;7W3;i?rBEZ6r-QO=^VRZ+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho
@qB^(FD,5.F*)>@ARlp&@<?0*Bl48#+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/
AU,D/BkCsgE\8J6BPDN1@;KauGB4l6+<Ve7;FNl>:JOSd?m&uo@ruF'DIIR"ATJu9D]iM#+E2.*
@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd)+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@I
F(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:956+CSbiATMo8E+*j%F"SRX$6UH6$6Uf@6q'p@
:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl];F<kqD..<rAn?%*+EM%5BlJ08/d`^.
+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/d_q1,9n<b/ibOC
2'=In8p,#_+>Pi++>PW*1("@2.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]
BOr;\@:LF'ATDj+Df,n)+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:8Gu+<VdL+<VeU
@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]X98+<V"6.Ni,6De(J>A7f3lF`:l"
FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&
?tX%gATD3q05>E9A8bt#D.RU,?j\#!+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26
ATJu8ARTUhBOt]]+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/
D@.L/+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(KD+<V"6.Ni>;G\(D.@3ArgBle6$+DbV,
B67f0ATDg0E\8IA+:95@+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&
AS#Bp9L]@3$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?.-
$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A-sG%+EVNE@;[3+
Ch+Y:E,oM42_Hd=.3NSMDe`inF<GF/DII0hE\8IA+<V"9,9n<b/ibOC+>"^.@;[2B2Cot+0JP9h
$6Uf@?tsUjAoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdk
AI9P&+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4
+CKM'+Dbt+@;KK^$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej"B+=\LAB4Z09+E2IF?m'?*G9CL/
FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/d`^.+<VdL+<VdL2'?OCF<DqY
+:956+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^A$6pc?+>>E./iFh(+@KdN
+>GW&+>PW*0a\71.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0+CJr&
A1hh3Ambrg+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r
+DPh*+Co1rFD5Z2@<-W#+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,
ATME*Anc'mEsa$4+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U
+:956+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1
De(G=@:s.).4trM+<V"6.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9
E+*6f+ED%1Dg#Q*+C]U=$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>
ATD?)Bl5&8BOr<.AU&;>De9>!+<Y*1+D#e:Ch[BnF<GdGEb$d0+<Vd6,9nEU0J5@<2'=In6tKjN
1b9b)0JP9h$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0?m&l#E+*j%+E(j7@;K`e
+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/d`^D+:95@+D,>4ARlolDBN>(Ci`u,
@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)$6UH68l%ht?upEuEccGC/no'A?m'#uFE2),F!,C=
+A?KeFa,MG+<Vd6+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/d_q1,9n<b/ibO@+>"^2Dg!6Y2(Tk*
0JP9h$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$
De!p,ASuTuFD5Z2$6TZu.Ni>;G\(D.@3Arp@;BF^+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1
DBO.AEb'56GA2/4+EV:.$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6
+EqC;AKYr4ATMF#F<GL>$6UH6FD,5.E+*j%/d`^D+:95@+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+
8l%htFCfN8F"ReB+<V"9,9n<b/ibO?+>"^.F`&<V0e=G&0JP9h$6Uf@Df0B*DIjr$De!p,ASuTu
FD5Z2+ED%:Bldir+CT.u+D#e>ASu$iA1f!(BOr<)DJX$)AKYN%@s)X"DKKq,+<Ve8Eb-A,Df^#3
A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)9-+<Ve;Dg-)8
Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c$6UH6
De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa
@UWb^/d_q1,9n<b/ibO>+>"^1@<itN3@l:.0JP9h$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4
ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33
A0>r)ANCq@$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]X9"
+=\LPDJX$)AKYN%@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;X-
+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E$6UH6
<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-$6UH6
8K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<Co5+<XlrC2[W8
E+EQg>psB.FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>=+<Ve;De3u4DJsV>F(fK9
+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^M:-+CT.1@:NeiEaa'$+Co&)@rc:&
FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=mn-+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@s
Dfp.E8l%htGA1l0+C\n)D.-sd$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(,f7+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1
Bl%<4+<V!u+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je
2_He/+EMgLFCf<1/d`^D$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;$47n*+Dkh1DfQt4Bm:b=AftYq
BlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@$48"&,9SZm
3A*!./KdMo@N[Bb/0H]%0ej"B+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&8k;l'@;]Tu
8k2iR/g+,,BlbD?ATDj+Df,n)+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"ReB+<V"6.NibC
E,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8"
+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*De<Th+CT.u+:956
+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\$6UH6
GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqMn+<Y-%F(HJ1
De!3lALDOAF(Jd#@q[!(@<?/i+<Vd6+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*
FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"ReB$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;r
DfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?j\#!+Eq78+C]U=Amo^&FD,5.Cgh?sATMr9
E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>A7f3V+<Ve@F!,@=G9C@8Dg-86
A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Ambrg+<Y*1A0>i-
@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a$6UH6
Ci<flC`lPB7Nc__@:X(iB.aN6+<V"6.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*
D]j(3Ao)$gF<G(,@;]^hF"ReB$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4
D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f$6TZu.Ni+c=]@gt+DkOsEc3(A@rc:&
F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:94u,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA$47n*
+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;
GA(Q0BOu2k+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.
+DGm>0J3\T+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%
Ch7W0$6UH6A9Da.+D,>(ATJu'F`\a?F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/d`^D
+:95@+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"
ATJu9D]fB0+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@1+<Vd6+=\LNBl7j0+D,>4
ATJu.DBN>%De(J>A7f3V$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA$47n*+D,P4@qB0nE+*j%+Cf>,
E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-
C1Ums-X[9($6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3AmbrQ,9nEU0J5::1*A.k;e9nj
1,UU*1,(CA$47n*+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/^+:95@+E_X6@<?'k+CJr&
A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ1c,9nEU0J5::0d&%j;e9nj1,LO)1,(CA$47n*+ED%1
Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m
+EM7CAI9Oe+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(
F^o!(+EM7CAKYo'+DP;&A1hh3AmbrQ,9nEU0J5::0H_qi;e9nj1,LO)1,(CA$47n*+ED%*ATD@"
@qB^(@:Wn[A0>u4+CJr&A1hh3AftIg+:95@+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i
-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@.Kn,9nEU0J5790H_qi6$6f_0fU^,1,(CA$47n*
+Dkh1DfQt8De'u3@rc:&F<G.*BlnD'+:95@+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;4%$6pc?
+>>E*/hnJ#+A-cm+>PZ&+>PW)3!p!8.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9Y+:95@+CJhm
AT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg$6T[#,9n<b/i>78+>"^.F_i0T3%Q1-0JGHn
$6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"$6T[#,9n<b/i517+>"^.F_i0T0J">%
0JGHn$6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@L=4b
+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)
E--.RBkh]s$6T[#,9n<b/i,+>+>"^1@<itO0e=G&0JGHn$6Uf@D/!m+EZfLDA79Rk+EVNECghC,
+DbIq+EM+(FD5Z2$48"&,9SZm1G1U//KdbrGp"mt/0H]%0K9CH+=\LCF_;h/Bm=31+DG^9Cggdo
+>"^ECht51@:F:#@ps6t@V$[&F`%Nn,9nEU0J5.62BXRo9jr;i1-$m.1,(CA$47n*+D,>.F*&OF
ASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EXEp3+EVNEFD,B0
+ED%0ARTXk+D>1o+EVNE@V$[!@;^3rCi"A>Bl8!6@;KakA0>?,+:956+CSe4BQ%B'F(96)E--.R
+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/d`^D+:94u>@'$i3ZoPEBPDN1
A8bt#D.RU,+Ceht+C\n)@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d(+<VdL+<Ve2E+*Wp
De!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL\+<VdL+<VdrDfQt3G[YH.Ch4`2
BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE8+I+<VdL+<V"6+<VdL
+<VdL+<VeG@;]Uo@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh$C2[Wi
Dg#i+G@,H'GVV$#+C]A*AS*''G%G];Bk;K2De:,6BOr;Y:IH=HH#n(=D(Zq?$7-g=BPD9o+CT>4
De!KiFCeu*GA2/4+EV:.+A,Et+D5_5F`8IFBPDN1Dg#]4G%kN3+:SZ(+CT5.Ch[I%+EVNEFD,5.
ASuU(Eb-@c:IH=HH#n(=D'3n2AKZ).AKYhu@rcK1-t7=5Ch.:!A8G[rAU#X5$4R>IF(Jj'Bl@m9
8l%ht:Ng;iG%kN3I16Mm$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m6>\J.hAp\35FDu:^
0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R/@:WneDLF,H$4R>@
AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/%16?SFCf:u$6WSe
Eb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I="q,
AKXT@6m,<7B4ZKD+:SZ#>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*
FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`E%144_DJsQ4@;L"!H=[Nm>\S:kD%-gp>\J.hAp\35
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0GA1hh3Apo#*BOr;Y
:IH=B@;^3rC`lu)AU&<=FF.b@A1hh3Apo([%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0GA1hh3Apk*q+C&f&Ec#6$F(or3
%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HV.(%+B<JoEZdqkFCfK)@:Njk=)W+iF+"K)
%16$PD.Oi.Afu2/AKY])FCfK)@:NjkGAhM4F!,:5F*(u(+D>>,AKYE%AKYl/F<G+4@s)X"DKKH#
+DG^9FD,5.>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%
E\D0GA1hh3Apo"u:IH=B@;^3rCjdoY%15X;Gq:(ZE,oZ1CM[^&B-;86F`Lu'+Cf>#AKZ22FD)e)
@!-?tDe!p,ASuU$A0>Jq@<?X4ATK4H+CT.u+CJSG@<6O%EZde`B6,FJ+D,P4+CTA6ASuU(G%De:
ART+\EcVZsBlbD*+Dbt6B6/0'DIdI!B-;86Aor6*Eb-A(AThX$DfBQ)DKI"+ASlC"HY%):Bk(^k
ASuU</e&-s$7-g,Des6.GA1r-+Cf>#AKYVsDImisFCeu*@X1!WAoD^,BkCd`ATVL.+>5d)+FYq7
H:gt$Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%isDf9H5;cH%X6pX^=/4k.[:IK>IBl8$(Eb8`iAQ)Po
:..BG6k'JL+?V/)HtmS1BkCd`AUH']4q.i.$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[Nq
FD5W*I9Ttd$=%7iE+O'+Bl7^5@:FD.HX'<aEc#6$<,ZQ!@:FC&+<VdL+FSZB>]=+aATD?oHYI)%
3alK@I9dt#6Z6gYASuThDej].Cht5'@:O(qE$0=8EcYr5DBNh*D.Rd:%16?RH#R>8Ch[d&HXUGq
B6%s>HX'<aEc#6$<,ZQ!@:Wn]Ec<-D+FSZB>]=+aATD?oHYI)%3alQ0B6%s>>p*B>Df'?&DKJir
CO9K#A0?)7Eb'5EFCfN8F!,RC+D5_5F`9!TF_Pr/I16NgBR+Q.EboH-CO9K+Ci3ZuATN9H>Y]3X
D..6[Dej].Ci!utD.Rc2I=5=)E+*BjEb/j0BkCj9@;Kat@;TRsI9dt#6Z6gYASuThDej].Cht53
@;TRs+D,Y4D'3tBATKmT+CT)&DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO9K+CiX*!
F+&C?:2b/i@;Jn]CO9K+CiX*!F!)TRI9Trq@:s.lAS-:'An*l1Ci"-'AoiB++C%9PD/Ej%FB!0o
HXU`,+Du+8Ci<flCh4`,@;TQuEb/ioEb0,uATKmT@;Kb#AS-!+4$"a0ATW'8DBNeA+ED%*ATD@"
@qB^/I16NgBR+Q.EboH-CO9N'ATW?I>Y]3XD..6[Dej]/B4Z0-+<VdLI=5=)E+*BjEb/j0BkCj9
@V97oI9dt#6Z6gYASuThDej]?ATVs,AThX++E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bh
CNXT;I16NgBR+Q.EboH-CO9N.CjgY8:2b/i@;Jn]CO9N.C`jiC+<VeTI9Trq@:s.lAS-:'An*l2
DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+E2IF+Co1rFD5Z2@<-W9A79Rg@UX=h+C\bh
CNXS=Anc'mF+"K)>\JD%ATDU$DJOT/Df'H.I=#3oDfT]'CfG=gHXgu2E,$L<+<Z)\>?l,UB4Z*p
Ap\6(@le+<D/a6<>p*B>Df'?&DKJirCO9Q0D/aN,F)to6+Du+8DJsZ8F!+q;+ED%1Dg#i4B-;D3
Blmo/F)YPtAKYE!A0>r,DfTr2DJ=!$+Dbt+@;I'#A7]Y#BkD'jEcZX<$=%7iE+O'+Bl7^5A7^19
>Y]3XD..6[Dej]1AKW*<+<VdLI=5=)E+*BjEb/j0BkCj9A7^0p+C%9PD/Ej%FB!0oHXpi3E,8s.
+A,Et+ED%7F_l.BGA2/4Dfp.EEb0?8Ec*"0De*F-%16?RH#R>8Ch[d&HXp](I=#3oDfT]'CfG=g
HXp](+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.3CjfS3>XNFHD.RU,<,ZQ!A7]RgFCfM9DdmHm@ruc7
Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%I16NgBR+Q.EboH-CO9T'ChId-I=#3oDfT]'CfG=g
HXp](B6%r6+<Z)\>?l,UB4Z*pAp\6(@le.3ChId-I9dt#6Z6gYASuThDej]?ASl@/AKZ28Eb'5E
FCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-I16NgBR+Q.EboH-CO9T+A:8f0:2b/i@;Jn]CO9T+A0<!;
+<VeTI9Trq@:s.lAS-:'An*l4Bk2Wt+C%9PD/Ej%FB!0oHXpi#FD5Z2@<-W9Bk1dmFD5?$@psIn
Df-\+DIal2FCB9*F*),+F+"K)>\JD%ATDU$DJOT0Ble6AHX'<aEc#6$<,ZQ!A8-+(+<VdL+FSZB
>]=+aATD?oHYI)%3b2rGE.)"7>XNFHD.RU,<,ZQ!A8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE8R5
F!,R9G]\?C$=%7iE+O'+Bl7^5A8Z43HX'<aEc#6$<,ZQ!A8Z3++<VdL+FSZB>]=+aATD?oHYI)%
3b3,EI9dt#6Z6gYASuThDej]9BleA=DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%
I16NgBR+Q.EboH-CO9T1@sr]/:2b/i@;Jn]CO9T1@ium:+<VeTI9Trq@:s.lAS-:'An*l4De"3$
+C%9PD/Ej%FB!0oHY.2:D..O-+CoD#F_t]-F<G[:G]Y'NF(oN)+EV:.+Cf>-G%GQ5Bl@m1+E(j7
FD,5.-tI7+@rs.BG%G]'I16NgBR+Q.EboH-CO9T2F(KHAHX'<aEc#6$<,ZQ!A8lU$F<D\K+FSZB
>]=+aATD?oHYI)%3b32NATW?++C%9PD/Ej%FB!0oHZNb?+Co1rFD5Z2@<-W9E+*cqD.Rg#EcZX<
$=%7iE+O'+Bl7^5ARp49>Y]3XD..6[Dej]2A0<!;+<VdLI=5=)E+*BjEb/j0BkCj9ARp3p+C%9P
D/Ej%FB!0oHY$`%F<G+.@ruF'DIIR2+E(_(ARfh'I16NgBR+Q.EboH-CO9W7I=#3oDfT]'CfG=g
HY%:A+<VdL+<Z)\>?l,UB4Z*pAp\6(@le1CI9dt#6Z6gYASuThDej]2A8--.FCf]=I16NgBR+Q.
EboH-CO9Z7ASupC>Y]3XD..6[Dej]3F(K53+<VdLI=5=)E+*BjEb/j0BkCj9AohO$I9dt#6Z6gY
ASuThDej]3Bl\9:+CoD#F_t]-F<GX9DKKH-@qC&t$=%7iE+O'+Bl7^5B4PRmF+&C?:2b/i@;Jn]
CO9])AT2]5+<VeTI9Trq@:s.lAS-:'An*l7A7]_$I9dt#6Z6gYASuThDej]4Ec6)>+CT.u+EM[>
FCcS*AT23uA7]Y#F+"K)>\JD%ATDU$DJOT3ATW?I>Y]3XD..6[Dej]4ATT%;+<VdLI=5=)E+*Bj
Eb/j0BkCj9B4Z15>p*B>Df'?&DKJirCO:)5FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9
A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5B4Z1*G^XpD:2b/i@;Jn]CO9]*FE2UK+<VeTI9Trq
@:s.lAS-:'An*l7ATVs;I9dt#6Z6gYASuThDej]4ATT&8AT;j,Eb/c(FDi:5G\(B-FCfk0$=%7i
E+O'+Bl7^5B5DKqF+&C?:2b/i@;Jn]CO9]1Ddmc1+<VeTI9Trq@:s.lAS-:'An*l7Ci<d(I9dt#
6Z6gYASuThDej].DII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF+"K)>\JD%ATDU$
DJOT3Ec?GR>Y]3XD..6[Dej]4Ec<-D+<VdLI=5=)E+*BjEb/j0BkCj9B6%s>>p*B>Df'?&DKJir
CO9Q3ART[l+CT.u+Dl%-BkDW5B6%p5E-$F:$=%7iE+O'+Bl7^5B68QK>Y]3XD..6[Dej]4F<D\K
+<VdLI=5=)E+*BjEb/j0BkCj9B68Q-+C%9PD/Ej%FB!0oHY6o3+A*bt@rc:&F<G[:G]Y'?Ec5e;
8g&4eD/^V.Bl[cpFDl2FI16NgBR+Q.EboH-CO9`2E,KK?HX'<aEc#6$<,ZQ!BP_X*C`jiC+FSZB
>]=+aATD?oHYI)%3bW>KDJX`,+C%9PD/Ej%FB!0oHXpi3E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1
+E(j7DdmHm@ruc7Df-[GGq".N$=%7iE+O'+Bl7^5C2[WkB4ZL<>Y]3XD..6[Dej]7De*9hAKW*<
I=5=)E+*BjEb/j0BkCj9C2[WkB4ZKs+C%9PD/Ej%FB!0oHXpQ1F!,O<DI[6#CghC,+Cf(nDJ*N'
@;]Tu@rc-hFD5Z2+E(j78l%htDdmHm@rud?%16?RH#R>8Ch[d&HYRJ0BOu"!I=#3oDfT]'CfG=g
HYRJ0BOu"!+<Z)\>?l,UB4Z*pAp\6(@le@CA8#OjE.)"7>XNFHD.RU,<,ZQ!A8-+(CghT38l%ht
BOu"!I16NgBR+Q.EboH-CO9l1I=#3oDfT]'CfG=gHYd=;+<VdL+<Z)\>?l,UB4Z*pAp\6(@leF=
I9dt#6Z6gYASuThDej]:@;BEs@;]TuCi<`m+A,Et+D5_5F`;a<$=%7iE+O'+Bl7^5Ci<frEc?GR
>Y]3XD..6[Dej]9De!F#E$-8GI=5=)E+*BjEb/j0BkCj9Ci<frEc?G4+C%9PD/Ej%FB!0oHYdD;
F<G4:Dfp#?+CT.u+EM[>FCfM9GA2/4+DtV)AUP!p>\JD%ATDU$DJOT9@;BG&HX'<aEc#6$<,ZQ!
D..3k+<VdL+FSZB>]=+aATD?oHYI)%3c/;@AURi,>XNFHD.RU,<,ZQ!D..3kF!+'tF(96)E--/L
%16?RH#R>8Ch[d&HYmS?I=#3oDfT]'CfG=gHYmS?+<VdL+<Z)\>?l,UB4Z*pAp\6(@leICF+%=:
>XNFHD.RU,<,ZQ!D..3k+Dbt)A0>r'EbTK7I16NgBR+Q.EboH-CO9o9CjgY8:2b/i@;Jn]CO9o9
C`jiC+<VeTI9Trq@:s.lAS-:'An*l=DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+CT)&
+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO9r1G@Z,K>Y]3XD..6[Dej];ATqZ-
+<VdLI=5=)E+*BjEb/j0BkCj9DIn$&I9dt#6Z6gYASuThDej]0Eb/[$ATJu&+Dtb7+Co1rFD5Z2
@<-XA%16?RH#R>8Ch[d&HZ!b5G]8(X>Y]3XD..6[Dej];De404+<VdLI=5=)E+*BjEb/j0BkCj9
DJs*2E.)"7>XNFHD.RU,<,ZQ!Eb0?8Ec,q@@3BB#F*&OCAfu#$C1UmsF!,[@FD)e7D]iV9E,8s#
@<?4%DKC48$=%7iE+O'+Bl7^5DJsW0Ec?GR>Y]3XD..6[Dej];DffW4E$-8GI=5=)E+*BjEb/j0
BkCj9DJsW0Ec?G4+C%9PD/Ej%FB!0oHZsCKA9/l3EZfI8F*)IGAo_g,+=MLa+EV:*F<G"4AKYl/
F<G:8+D5_5F`;CEDfQtAF_Pr/F+"K)>\JD%ATDU$DJOT:FFAL@:2b/i@;Jn]CO9r@+<VdL+<VeT
I9Trq@:s.lAS-:'An*l>FF@F;>XNFHD.RU,<,ZQ!ARoLs+CQC1ATo8=ATMr9F(96)E-*4FF(oN)
+A,Et+Cf>-G%GQ5Bl@m1I16NgBR+Q.EboH-CO9rCI=#3oDfT]'CfG=gHZ"$M+<VdL+<Z)\>?l,U
B4Z*pAp\6(@leLOI9dt#6Z6gYASuThDej]2A8--.@3BH!G9CIAE,95uBlkJADfTA2F`V87B-9fB
6m,uXDK]T/FD5Z2F+"K)>\JD%ATDU$DJOT;@W#UkATN9H>Y]3XD..6[Dej]<@W#UkATJt:I=5=)
E+*BjEb/j0BkCj9DdmTmD.Rd:>p*B>Df'?&DKJirCO9u/C1Ums05PQ:@;KKtDIIBnF!,(8Df$V>
F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT;A:8f0:2b/i@;Jn]CO9u1
+<VdL+<VeTI9Trq@:s.lAS-:'An*l?A:7`+>XNFHD.RU,<,ZQ!DfB9*F!+n/A0>AuDf]K2+Co1r
FD5Z2@<-'nF+"K)>\JD%ATDU$DJOT<@:O(`I=#3oDfT]'CfG=gHZ3D'CLeP1+<Z)\>?l,UB4Z*p
Ap\6(@leR;@r#V'>p*B>Df'?&DKJirCO9N!@r$-.F`8I3DIal1ARfY%ATDi7G@>Q7ARlp)E+*6f
+DG^9A8,OqBl@ltEd8d>Bl%@%I16NgBR+Q.EboH-CO:#@I=#3oDfT]'CfG=gHZ4!J+<VdL+<Z)\
>?l,UB4Z*pAp\6(@leRLI9dt#6Z6gYASuThDej]=F`\a7DIal"Ec6#?+ED%*ATD@"@q?d,DfTB:
%16?RH#R>8Ch[d&HZ4+LI=#3oDfT]'CfG=gHZ4+L+<VdL+<Z)\>?l,UB4Z*pAp\6(@leROFF@F;
>XNFHD.RU,<,ZQ!F*)>@ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?R
H#R>8Ch[d&HZE\0DIIBnF+&C?:2b/i@;Jn]CO:)5Ao;$oATJuBI9Trq@:s.lAS-:'An*lBAS,gg
D.Rd:>p*B>Df'?&DKJirCO:)5An?!oDI[6g+Du+8Ci<flCh4`,@;TRs+D,Y4D'3tBATKmT+CT)&
DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO:)5B4QF;>Y]3XD..6[Dej]?AS5Nr+<VdL
I=5=)E+*BjEb/j0BkCj9Eb/loI9dt#6Z6gYASuThDej]?AS5^uFCfJ8@;]TuF`)52B5)F/ATAnc
:IH=9Bk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZE\=FC]fH>Y]3XD..6[Dej]?ATMs(+<VdLI=5=)
E+*BjEb/j0BkCj9Eb0<6A:7`+>XNFHD.RU,<,ZQ!Eb0<6DfTE1+EV:.+Dl%<F<GU8@qBP"+C\bh
CNXS=@rc-hFCeu*@X0(EE+*6lA1;p9$=%7iE+O'+Bl7^5Eb0E4I=#3oDfT]'CfG=gHZE\@D]g/F
+<Z)\>?l,UB4Z*pAp\6(@leXAG&Me7+C%9PD/Ej%FB!0oHZE\-ASuU+Gp%-=G%l#/A0>f"C1Ums
F+"K)>\JD%ATDU$DJOT>ATi!0AU&WM>Y]3XD..6[Dej]?ATi!0AU#=?I=5=)E+*BjEb/j0BkCj9
Eb0E4DIn'@>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7E-67FA8,OqBl@ltEd8dG@VTIa
FE8RKBln#2DJpY/G]7J-DIIX$Df0WE%16?RH#R>8Ch[d&HZEtOHX'<aEc#6$<,ZQ!EbupA+<VdL
+FSZB>]=+aATD?oHYI)%3c](c>p*B>Df'?&DKJirCO:)EDK?pm+DkOsEc3(A@rc:&FE;j>$=%7i
E+O'+Bl7^5EccDOHX'<aEc#6$<,ZQ!EccCG+<VdL+FSZB>]=+aATD?oHYI)%3c]=aI9dt#6Z6gY
ASuThDej]?F`)7C8g&4eF*&OG@rc:&FE;j>$=%7iE+O'+Bl7^5Ed2YRHX'<aEc#6$<,ZQ!Ed2XJ
+<VdL+FSZB>]=+aATD?oHYI)%3c]IdI9dt#6Z6gYASuThDej]?AS6.%@<*K%G]7\7F)u&6DBO"3
@<,jkI16NgBR+Q.EboH-CO:,HAU&WM>Y]3XD..6[Dej]@G@c"A+<VdLI=5=)E+*BjEb/j0BkCj9
F*D2?I9dt#6Z6gYASuThDej]2G][t7@rri7Bl7R"AKYf'DIjr%G]7J-DIIX$Df-\0Ec5e;GAhM4
+D>=pA7]d(@rH4$ASuT4@;]TuF('6'I16NgBR+Q.EboH-CO:2FARo7qI=#3oDfT]'CfG=gHZaC@
A7Bg,+<Z)\>?l,UB4Z*pAp\6(@leaRARo7qI9dt#6Z6gYASuThDej]?ATW'8DK?q/+Dbb5F<GL6
+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<DfTB0+E)-?.!R1h%16?RH#R>8Ch[d&
HZaC@F+&C?:2b/i@;Jn]CO:2FATJt:+<VeTI9Trq@:s.lAS-:'An*lEF(KE@>p*B>Df'?&DKJir
CO:)5FEMVAF!,[FEb$;5AS,LoASu!hF+"K)>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"
C2[X!Blmp,@<?'\F(KB-AU/>P2,6Ij+E;KGF`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3A
C2[X!Blmp,@<?'0/e&._67r]S:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-
BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:
05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._
67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!
F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J
7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$Hm
Cb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/hAooOm2^/\<:-pQB$;No?+AP^3762Q$
Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4
@<,ddFCfJ%$4R>;67sBOASuO6-Z^CS@Wcd7/Tk]BGp4@k/hf%'GAhM;@<-:/DIdet$;No?+?:T+
1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b3ZpF+3\iZB-Rg/h+=AT\>9GpL
3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a-RU8h%15is/g*.t3\i^$0j?X]
3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ7%15Q[
4#&fpASkjkAKX?_EcP`/F?=;W@:UK.C2[X!Blmp,@<?'.+BosC+EDRG+=CW@Bl%<pDe*ZuFCfK$
FCcgB>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=Ma+=D,KC2.ZtCh\!&Eaa'$-QlV9
De(7Y-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH>9G^EDe't<-OgDMFE21J;eTlWF=Tg94#&fb
F_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1
%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<r
ASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`
-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ77Q*=_4&fd4F<FM!DeioGEccCG-YdR1
Ch\!&Eaa'$;f-GgAM>ec%16$IBkDH;7Q*=_4&fd4F<EnYF(o,GB6%s-BlkIFC2[X!Blmp,@<?'[
Ec6)0Ch6=LCLqO--QlV9F(KH.De*ZuFCfK$FCcRB-YdR1Ch\!&Eaa'$?Z1+%ATqL'AU#sc,p7;C
BlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;i
G%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5BlJ/:FD,*)+D58'
ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%Et
D/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;>\J.hAp\35FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8IY8l%htA8,OqBl@ltEd<'UB6%p5
E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/%16?S
FCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=
De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8Bl7Q+C2[X!Blmp,@<?''DJsW.
@W-1#I4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U
@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XS[m+C&f&
Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/HW>-$DJ(),De*ZuFCfK$
FCcRk6q2SW%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apk*q+C&f&Ec#6$
F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!
FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$
DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O8Q/GO:..lF+<VdL+FSZB>]=+aATD?oHYI)%3`JXA
;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,BkCd`ATVL.I=#3oDfT]'CfG=gHY.2:D/!Tj@qBan
GT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`ATVL.I9dt#6Z6gYASuThDej]3DfT]'FE8R<H#R>8
Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA93/.$=%7iE+O'+Bl7^5B6%s-BlncM
>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE,961I9dt#6Z6gYASuTh
Dej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk::2b/i
@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+aATD?oHYI)%3b`27@qB^m@ruF'DLGe5>XNFHD.RU,
<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-CO9c-@sr]/:2b/i
@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3b`29I9dt#6Z6gYASuThDej]3DfT]'
F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3oDfT]'
CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*BjEb/j0BkCj9F(KH.De*ZuFCfK$FCfl++C%9PD/Ej%
FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FB
ARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/Ed)GBA930G>Y]3XD..6[Dej]BGAL]0AU%g-GAhM4
F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?DfTB0I9dt#6Z6gYASuThDej]BDKg,0E,]B!+DbJ.
AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpe"L$=%7iE+O'+Bl7^5
GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6+<VdL+<VeTI9Trq@:s.lAS-:'An*lGDfTB)Blnc/
+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGq".N$=%.[A:$j]B4u*qB4uC$
DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?
7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.EFD,5.
8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I@V'1d
DL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+CoD#F_t]-F<G19@:sFg
DKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>ASl.-AUP!p+<Xp'FCf;39jr'XA8c[0+D5_5F`8I>
Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*AQW1[
F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ$6UHr
ASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y
:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j
+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5F_#DB
E+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(+<Y-6
@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2DK@E>
$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)
+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq4FVa.
INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(>\.e`
HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=FEDkE
De*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#DKU1H
@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57
F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/+F.mJ
+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU+<Xp&
Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'
+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?8
F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_DKBo.
Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUr
F"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,
C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'DIIR"
ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"G]\%L
HYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0
BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1+C'#"
G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9
+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+@Vfsq
+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$I16Mi
+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+8
0/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]qDKK<3
+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*q
B4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*m
Ch[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC9
3A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3
%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<
0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bs9#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:
0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#+<VdL>]+J#D..7%BmO>"$4.gt>\.e`HY%);D.R`r
FCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$
AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g8AT;j,Eb-@@
B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+Dkq9+=CoB
A8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_Bq
BQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi<
ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)
Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2ieb
HX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]:Ci^_I>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[
A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#:N0l_+EV:.+A,Et+Co1rFD5Z2
@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%13OO,p6H%AS5^p
HZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g"ASu%*G%G]'
@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO9u1
+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?
Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=g
HQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`
HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!Blmp,
@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)A7]9o
Ch[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(Ci<`m+=CoBA8Gt%ATD4$
AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'c
FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u
$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJ:f
+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+G
F)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO,p6H%AS5^pHZit@@UX@m
D1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG/g,@P
DId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBsBl8'<%14C(>\.e`
HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[
Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-
DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I<9%;E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL
+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@AM7e:BPoJFASlBkFCf]=EHQ2AATMR'B5D.+I=34\
>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?S
FCf;3;e:%nDfBf4Df0!"+CTD7BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkNATV[*A8Gt%ATD4$
AUQ0?$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MOEbTE(<,ZQ!>]aP%
FE)GAFCfN-DJ*csH[S4hFDYH(>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]CO71FATV[*A8Gt%
ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(oCghBuH[T@3FCSa&
AR'=gG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S@<H[*DfR7I.3N_D
G]Y':DIal#Bl[cpFDl2FI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`
+<XR)DBN2+AU&<=FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB+C'#"
G]\%LHY7A<Ch\!>%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&
DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn/e&-s$7-g"
@V'1dDL6P<EaiI!Bl/8-$7-g-Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$
AM/(9GT[G&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?8DfT]'CfG=gHY7A<Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%
ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/De*ZuFCfK$FCd(H
AU#>G%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B<Jo+C%TK<+T0\
FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961/q"iO$4R=b+@.,Z
@<?!m+C'#"G]\%LHX^E*I3<T@EbTK7+DGm>GB.D>FCf>4FDi:DBOr;kFCf]=FEDkNATV[*A8Gt%
ATD4$AUP!p+<Y3/Eb/a&DfU+GFD,*)+EM47GB4mKBOr<-AT;j(DI[6#De:+s9OUn3=BltYDf'H-
CghF"Df-\-Df'?"DIdf@%144#%144#7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=
FEDkKA7fXdFCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5CghEsG^V1e=`8G'
+Cf)'Bk(]sGA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHkDJ<U!A7ZlnBOPpi
@ru:&F"SS)DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth+C'#"G]\%LHV.(%
9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H$=%.[A:%m*F_t]1
@<?(/%13OO<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>@;^00FDi:1A867.
F=n"0%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=FEDk%:IIljFCfK$
FCe9hARTFbCh55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&+Cf>+F_u#;/g+,,
AKYMpAmoguF<G:=+EV:;ARuunF`\aJBPDN1D..]4Eb0<7Cige6DBO+6Ed8dDDf021DIIBnF!,LG
DJj0+B+51j+EVO7ATVTsE\8J6D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='+Cf>+F_u#;+Cf(n
DJ*NA%13OO>[h8WBl89@ATD6gFD5T?%16?LAS5^pHYmnAFD56'Cib#O1OWJ4F(Jj'Bl@l=HX(9&
A7^"'@;TS(>n%-GASu%*G%G]'@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+Eqj7
E-!.<Df021F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;Ci!Zn+C]U=>]aP%
FEDVO=&M=\9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/+<X$b@;]^h+EV:2
F!,X7Cis;3BkAK5Dfm14BOPdkAKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!+Dbb0ATJu&Eb,[e
+<YWDARf:_A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig*n
+<XoTCh7X/<,ZQ!>]aP%FEDVO4t\HOI=3^W$4R>IBlmp'+:SZ#+C'#"G]\%LHYRJ0Ch\!&Eaa'$
I3<B8Gp$g=@rHC.ARfguGp$d7B4u*qB4uB0>\.bkBR=rD@;p0sA:5S0Dg5i(+A*boDfor=+EV:*
F<G(3DKK<$D@Hpq+Dkh;FEMV8F!,C5+EMXFBl7R)+CT.u+E)@8ATAo3FD,6++EVmJATKIH<+oue
+CT)-D]i_3Ch.T0AoD]4GB.,2E+NQ&DJsE1Dfor=+EV:*F:AR"+Cf>-FCAm$+Dbt6B-:c&@V'(\
ARlp)FE2)5B6,[J<+ohcG%G]'+C'#"G]\%LHZaOK@<?(*Ao`*6Eb'6>/0K"FAKYr#B4ZNsE+*Bj
Eb/j0BkCj9Fa%Y1FCf]/Ed)GBA93/M%144#@ps6t@V$[)F(Jl)FDi:7ASu("@<?''>\.bkBR=l>
GB.,2E+NR.+C%TK<+T0:+D,P4+EM[8BHVM;Eb'56FD,*)+Ceht+C\n)D..=)@;Kb*+Eqj7E,]B!
+CT.u+DG_7ATDm(A.8kg+DG^9FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkEDe*ZuFCfK$
FCfkQ+B3B,+CT=6G@_n6BkM+$+EMI<AKYhuDKTB(+D#(tFD5W*%144#BlbD*Cj0<5F!,@3@qB_&
@<-W9GA2/4+C%TK<+T/a%13OO>\.e`HY%);D.R`rFCfk0$>OKiE,o\nF(KB-AU/>P2,6Ij+E;KG
F`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3AC2[W3/e&._67r]S:-pQU;e9M_GA1i,+E1b%
AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=
F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)
@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&O
Ci<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*
F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(
Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#
.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/h
AooOm2^/\<:-pQB$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNF
Ci^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4@<,ddFCfJ%$;No?+@\1L0KV[6@Wc<+;KZk=A7BS%DBL;S
+ED%4CgggbA0?)1FD)dW/hf%'GAhM;@<-:/DIa1`%15Q[4#&fpASkjkAKX?_EcP`/F?=;W@:UK.
B4YslEa`c;C2[W1+Bot/D'138F_PZ&C2[WnBleB:Bju4,Bl@l:+BosuCh7$q+=ANG$:AoUCb%t1
4#&fqATT%^F`MM6DKIsYA0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH>9G^EDe't<-OgDM
FE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,
Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4
;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i]<-o!.n>9GpL
3\iW:-Y-\,F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK+Z_A;+=ANa+=nW`
-mO0`><3lj3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDP2ENWT<+U,m+B*,qCLoSJFEAWQ@:FCY
D/X3$0JFj`$<(VPAooOm2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@D..<rAn?%*C2[W<
0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`
78d&U:JO&6-S[5-/i#1)/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7
Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!
0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0
DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&Ik
De*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-
@r?4,ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>
A7f@j@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!
$>OKiCggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.
Ch5:S0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!
3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.Q
Bl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<
Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-
Ch.6tB.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9
BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:
Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7
+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX
%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=
.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5
A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.
BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR
%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9+<V+#.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4
+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe)/hen5
-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c
4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j
@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs28l%iAATMriEa`I"
Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQkDdtFm:IIlb@WQ7$
8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_E+EPi$?0NfA8bs2
<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4lEb0<5Bl@m1/oY?5
%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E
3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.
+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+a
F`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#
F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,
05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`
AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_
FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].
+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'
1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(
Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-/i#1)/KeS8Fsd_+7Sc]G78c90-YI".ATD3q05>E9F)Q2A
@q@"s$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!
7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u
$>OKiF)Q2A@qB^mFEMOTBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImis
CbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(
ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?
F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=
A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEs
A0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1r
FD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhK
ASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*
D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:
+CSekDf.0M%13OO8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>
F#ja;%14g=+B!?"+EV:.+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.
De*p-F`Lu'F(KH9E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2
F)Q2A@qB^mFEMOTBkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>
+B!?"+EV:.+A,Et+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S
@WNZ#Eb-A-DBO%7AKWBkASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*
8l%htCggdo+Dbb5FCeu*Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7
Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$
Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,
CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%17&pC1Lmf@<HC.1,2Nj
/h1g\C1Lmf@<HC.+EK+d+Co%q@<HC.+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp+<V+#:-pQU@rc-hFCeuD+@KdNASkmfEZd+k1,'.E:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$;No?+C\kq@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ci]De*Bi
Fs(O<A0?#:Bl%i<+:SZQ67sC!A0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6DKI"F
DfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5W:-pQUC2[Wq?YO7nA7%J\+=CfBDfp"H%13OO
:-pQU@s)g4ASuT4GAhM;Bl7Q+F*22=AKWQIFE_;)CER&,+Dtb%A7]9\$;No?+DPh*F'iWrDe*3<
3ZoekF_Pr/-OgCl$;No?+CfP7Eb0-1+EqaECM@[!+Dbt+@;KKt/Kf.ZART?s@<3Q/AS#C`A.8l@
67sC&EbB3,@p`qbDe*3<3ZoedDe!3lAL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=
De(:+$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C
/g+eIE$-N=@V'e+-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.
BkhQs-Qm&5FE2UK4$"a$B6#,/An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ft
GAhM4F!,17+EV%4B4Z0-Ci<flCh4%_6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/n
Dfp/@F`\aFEZc`VISP??-OgDoEaa$#+=DMb:4@U=%15is/g,7VB5DKr?YO7nA7$HlATT%BH[\_=
I4#I2.1HUn$;No?+EM+9+A,Et+E_a:EZf./H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,
FCbmgF)>i<FDuAE+=D;QATCFTH#k*KATMF)+>"^VATMs%Ec`Er+D,P4+Cf(nDJ*O%-OgD2FDj]G
;cFl$+F?-l/0HYiE+rft+>b3RATT%BA7]@]F_l/"F(KB-AU/>E.3NhTBlmo/C2dU'BHS[O@rH6s
BkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-Y-e#@<HC.+E2@>C1Ums+EM+9F`8];$?1$#C2[W<
0ht%f.WBECC2[W*F"JsdC2[W*E,ol3ARfg)F(KH9E%VS,:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE;e9oiASkmfEZd+k0K0FJ:-pQU/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^
67sB72fE2J0fL4`A7T7^+F7X6Ch7Ys$;No?+>>cn@rsF[+CSekARloL;aX,J3&MghF_u)=%15is
/g)i-De!lD1a$LMF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+DKKe>C2[WnATf22De'u5FD5Q4+E1b0
@;TRtATDi$$;No?+>GleARdDP+ED%;EbTW;ASrW&DfQsm+?;&.0d$o4:-pQU1,*TaFttru@:X+q
F*(u(+D,P4+A*b:/hf%'%13OO@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/
GT\@_/151NA7T7p+DPh*+E_d?Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YH
EcP`/F<GdGEbfB,B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l\De*KfBkhQs?TgFm-YdR1-OgCl
$;No?+CfP7Eb0-1+EqaECM@[!+EM[>FCcRH+EVg=@;?uoF!,@3ARo@_%16igA92*lC2[Wi4ZX]5
C2[X(D/X3$FCfN8F!hD(%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<
De(4<B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+
-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.BkhQs-Qm&5FE2UK
4$"a2F!,(-EZf(.@j`B.$4R>;67sC"F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARloU:IH=LDfTB0
+DG^9DdmHm@rri0De!3lAISu7:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SF
F<GOC+=DMb:4@U=%16Ze@<6!&-[U;;IXNRQ$7I91-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgD3
%13OO:-pQUF(KG98l%htF`V,7+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISuf
D/XQ=E-67F-ZsKAE_BthF!,L7F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrGDe*g-
C/o=dEbf63F!iCZGB.D>AKY`,@<?0*-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<Dr'
:IH=EEc5](@rri7ATW'6-OgE/H?s=EA8PahDI7KsGVV$#+AH9YDBMPI6m*n(H?s=EA8PahDD$$B
GUXbO@<?(*+D,>(AM,)7$7-,g,p5fU6m-PhF`Lu'+DGm>@rH4'Df]K#+E(j7@3BH1D.7's+E(j7
@r,RpF(KDF+B3#gEt&I&+D,>(AKYE&F(K2tCh7Z18l%ht@r,RpF(KD8@;]TuAU&04F(o`7Ed8dE
@<?($Bjkfe$7-g/DKKe>@3BW*DJ*cs+EMIDEarZ'@rGmh+CoD#F_t]-F=n"0,n12-+Cf>,E+s-&
DJ()6BPDN1Anc'm+ED%5F_Pl-F!,F4Ao(mtAU#aKG\(]"FCf\+$7-,g,p4<QE+EQs@<?(*+<YuV
H>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QE+EQs@<?(*+<YuVH>7A/D..-r
%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,n12-+CT).ATDZsFD5o0Cj?Hs,n12-+<VeCF^])p
FCf\>+F8?[C2[X"@;0Tg$7-f;+DkP&ASH$mAU#>DH?s=EA8PahD@Hq!+<VeCF^])pFCf\>+F8?[
C2[X"@;0Tg$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hp^$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr
@VfU.FCf]F%13OO>[_bsBQ%p<8oJB\+@Ih)6=FY@Ed\B(>]a\%Ch7ruFCf]=FEDjSIXWMbATDj+
Df-eKINot-:IKUR;f?f!@q?cMDe*E%>[/CVAoDU0DJsW.F(or3+C'&0CjTi;FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*QsF+%;2DfT]'Cia<:AUP!p%14C(@rH4$
@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*
+CQC5F_kUu$=%X`FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%16?]ATVa"DJ+')HX('!CisT4F(K<2
F_kW;HS@'0E--L;$=%[sDe!^%F_u"*$4R>I@V'1dDL5o4@s)X"DKL:9$4R>ID..3kFD5i5AISuO
FCAWpAT)0jDf0Z.DKKq/$=%LeARfXpF_u"*$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8cX*ATobK
AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8c?<FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!Q
De(JBAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA92j2Eb-kFAU&V4$4R>IDIn$2@:s-\$=%:_
E-68LH?s=EA8PajAM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F`_>6/p(ZLI16Mm$=%I[
GApu'AISuOBl7m4FF/=[C2[X)Df9H5/p(ZLI16Mm$7/qpATr*%B4VMZ-!YA+ARfXpF_u"*$7/qk
DK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k>[_/R
@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'AU"Xk
%16?ODIe*)De!p,ASuU<%13                                                   ~>
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
zz=:zz,' writetd2''),(<<;._1 '' jodmake DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 D'
zz=:zz,'UMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ER'
zz=:zz,'R0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EX'
zz=:zz,'PPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCL'
zz=:zz,'EAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clear'
zz=:zz,'so clfrbtcl createmk ddefescmask dec85 dumpdictdoc dumpdoc dumpgs d'
zz=:zz,'umpheader dumpntstamps dumptext dumptm dumptrailer dumpwords extsco'
zz=:zz,'pes fap fmtdumptext fromascii85 getallts getascii85 halfbits htclip'
zz=:zz,' jnb jscript jscriptdefs makedump makegs masknb namecats nlfrrle no'
zz=:zz,'unlrep opaqnames parsecode putallts rlefrnl sexpin sonl tabit toasc'
zz=:zz,'ii85 uqtsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jo'
zz=:zz,'dtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR0040'
zz=:zz,'3 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJODtoo'
zz=:zz,'ls JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 O'
zz=:zz,'K00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 W'
zz=:zz,'ORDTESTS addgrp addloadscript addloadscript1 allnames allrefs betwe'
zz=:zz,'enidx createjodtools dayage delgrp firstcomment firstperiod fsen ge'
zz=:zz,'trx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames onlycomme'
zz=:zz,'nts pr refnames revonex swex today todayno updatepublic usedby yyyy'
zz=:zz,'mondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY'
zz=:zz,' DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 ER'
zz=:zz,'R0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterf'
zz=:zz,'ace MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251'
zz=:zz,' OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRI'
zz=:zz,'PTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj cr'
zz=:zz,'eateut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 do'
zz=:zz,'ctext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfrea'
zz=:zz,'der qt reb revo rm rtt textform2''                                  '
zz=:4924{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1cQU9+>P&q+>Y`20H`))+>GW12_Z@01a"M-0f^@8+>Gc.1*AP!0f_3N+?(Dt2*!L.De)U0/g)WY
De'u#/M/)^@;0U%8l%htA8,OqBl@ltEd8d;CghC+/e&._67r]S:-pQU6#:?[DffZ(EZen,@ruF'
DIIR2+Cf4rF)to6+CT;%+D#e>ASuR'Df0V=De:,6BOr;sBk)7!Df0!(Gp$U5@<6KB%15is/g+,,
AU,D,Cht5:F(HJ8FCB&t@<,m$@rH7+FCB'/F!+n/A0?&,Eaj)4A7]@eDIm?$Bl5&8BPDN1@r,Rp
F"Rn/:-pQB$;No?+@C0\@<?4$B-:V*8l%htDdmHm@rri(AS,XoATJu&+=Lr=De(:>Ci<flCh4`'
DKKH1Amo1\/e&._67sBKATMs6Dg?&7B-:V*8l%htDdmHm@rri)Eaa$#F!,R<AKWC8C2[W3+Dbt+
@;KKtBl8$(Eb8`iAM+E!:-pQB$;No?+@C'bFCAm$F#kFSBk)7!Df0!(Gp%6OBl%L*Bk;?:+Cf>-
F*(i.FE8uUBl8$(Eb8`iAKZ/-Eaj)!$;No?%15is/g*`'FCfK)@:Nk0+=MDEEaj)4D.-sd+CTG%
Bl%3eCh4_uGp$g9De'u,De!3lALS&q:-pQU+<Y*%Fs%nM+<Y*/C`m1q@r$4++Eh=:F(oQ1+DtV)
ATJt'$;No?+<Ve9B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2
$;No?+<Ve9DJUF<+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC
+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs
+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn
+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#
EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-
+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is
/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6
+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImis
FCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@lt
Ed8dF@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'
DIIR2%15is/g)8ZDe't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!
CLeP1+E1b!CER/%@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-pp
Df[HPATT&)ATVL(@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/lt
F*(u6+CQC'Bk)7!Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k
+C]U=-u`U)CLek'$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8Z
F`V,8+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU
+<X*nEc5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,e
EHPu9AKW@8Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?
+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=
<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/
0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dK
ASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23u
A90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F
<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl
4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*
@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI
-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(n
EcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O
-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloq
Bl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z
+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2
Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*
F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'
6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X!Blmp,@<?'U67sa&
De*ZuFCfK$FCcS9/M/)XASu("@<?(%+Dbb6ATD4$AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q
@ruO4+D,Y4D'2GH6m-,_Dfp#?/e&._67r]S:-pQUG%G]'@<?4#3ZrKTAKZ).AKYT'Ci"$6Bl7Q+
@Vfsq+E27?FE8R5DIal&Bln$2@N]8sCh7Ys$;No?%15is/g+hLFDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1nB!:-pQUBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF
@<aA;BkM*qBkM+$Bl7Q:%15is/g+hLFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9
@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Ado)B67sBoFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%
ATD4$AM.\9H#@(#$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB'<(KSZ:dIiE:I?6I+<VdY+D,b4C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,
+DGF1Df-\=BOu!r+E1b2BFP;D67sB'AoD^,BkCd`ATVL.+<VdY+D,P4D..O-+D?%>ATDU$DJNfo
+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0%15is/g)9LEc>i/F<D\K+<VdL+<W6YD..3k
+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g)9NAmo1\F(Jj'Bl@l3+<W6YBl8$(Eb8`iAKZ&*@ruF'
DBO"CD/E^%Gp%0MEbTE(%15is/g)9NAn)r++<VdL+<VdL+<W6YAoD^,@<<W+DKKH1Amo1\+Cf>,
D.RU,+EV1>F:ARP67sB'F(KH.De*ZuFCfK$FCcRH+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cK
F(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQU+E_mE@<?(*Ao`*6Eb'56/Kf1R
GB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX
67sB'GAhM4Ch[u6+<VdL+<VdY+DkP&AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGps10:-pQU+:SZQ
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F<De!lC0b"Ib67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB812gZE0Jah"GUXbJEc>i/F<G"4B6A'&DKI"0A7T7^+EVNEF*2G@
Eb0<5+EDC=F<G[:GT^pJATE!8Blmp-%15is/g)l(De!lC1a$FODfp"A8Oc!579<8_6rR`=Dfp#:
@;TQuBR+Q.EboH-CLq#c$;No?+>GWi@rsC^+ED%4CgggbA0<rp+E1b0F(oN)+EqOABHS^IAo&n=
/Ke_8DIdQpF!+q#A0>V0@rGmh%15is/g)l(De!lC3$;X?A7]9oATDg0EZf%(DIdQtDJ((D+ED%4
CgggbA0<:EEbTW,.3NhKFD)dFGB.D>ARTX/%15is/g)l(De!lD0d'n8C3=T>ARloW@8pf?+E2@4
@;TIiAKWQI@q]:gB5)6r+Dl%7De<p*FE7lu:-pQU0f!ZWF>5Nn@:Wn[A0<:A@WZO(ASuQ<+>"^Y
F(Js+C`m>.EZee.@;L48Bl7Q+@rGmh+EV1>F:ARP67sB812gZE0fL4`A7T7^+=MGS@;pC1@Vft#
B.4rT+Dbt6B-;86F`Lu'+Dbb0ATJu3Dg*=JEa`p+ARl5W:-pQU0f*?O@kp%e@:Wn[A0>u4+=Lu5
@r$-7+@g-f89JAaEb03.F(o`7Ed8*$:-pQU1,*QRGq_0"@:X+qF*(u(+EqaEA0>K&Ec#6,Bl@l3
.!K9>.3N5@EZdss3A*!?%15is/g)o'D..]D3$<?_A79RkA0>K&EZek7EcP`/F<DuN@;]Uo@jrOD
ATDj+Df0V*$;No?+>PWcF`&ll+CSekARlo3AoD^,BkCd`ATVL..3N_N+DG_8ATDBk@q?d,DfTB0
%15is/g)o'DJs\P0d'n8A7]9oB6%F"BPCst+CT.u+DG_'Cisf5Df0V=F*1r&Bl[cpFDl2F+EVNE
E,oMuD.7<m%15is/g)o'DJs\P0d'_1AS5^pHXq&)F_t]-FF>9KDg#]&+EVNEEc5l<+D,>(AKYT'
EZe/$ATCIU@:h-%Df#pj:-pQU1,*TaFtb`q.!&sAC2[X!Blmp,@<?'0+Cf5!@;]Xs+EM%5BlJ/F
+CTD7BQ%o>F"&X_ASkjiC`m.sA7]9\$;No?+>PWgDg!ij+=M2J@rGmhCghEsGUXbDA7T7^+EVNE
@:X+qF*&O7Des?4Bl7Q+De:,9Ea`p+ARlp"Bl7L'%15is/g)o'A7]7)0d%leGAL]0AU%g-GAhM4
F"&5?A7T7^+:SYe$=e!aCghC++<W%?C2[X!Blmp,@<?'.%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?
.V*+0ASu$iDKKq/$;No?+Co%nCgh?qA0>N$Ddm-k+D>>,AKZ)5+CTG3Bk/>rDf000F(oN)+A?3C
AQU'm@;TRs+EqOABHTniDIIBnEt&IO67sB/.OdMA+A,=,8Q8AP<(0n38k`#]8OZ][79C[)9L;`N
9LMiK=<L407oE/W8Q8YX=<L40=&2^^9M&2_79CZA$;No?+=J]g4ZX]X:IIljFCfK$FCe9hARTFb
Ch4_]9LDKB5u(BJ=<J%[%15is/g+&1B4Z*+89JVoF!,[FEb$;)DfT]'FD5Z2+EMX5FCcS3@:Ntb
DIjqB+EM76Bl%KlEZfIB+?MV,@Wcc%$;No?+E1b0F(KD8FCf]=+EqOABHTu<F"AGSATV?pDK?qE
BPDR"F)YPtAKYE!A0>PoDIdQpF!,C?ASrW1F`2A5F"Rn/:-pQB$;No?+Eh=:@UX@mD)reWDffP5
A8,XfATD@"@q?)V:-pQB$;No?+<VdLG@kY=.k`#Z/g)o*+>k\m-RV\d78=t&<DQR_-OgDX67sB'
+<Wa,-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO%15is/g+hAA7Zm)@rc:&F<GC<@ps1p+<`-_
.6T:+D.[T,F(T52%16raCcsBn1,Us80H_J\+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+BTb)FD,6+
%16raCcsBn0d%Se3@nSkBeCbU-Rg/\+<VdL+<VeTD.[T,+AP6U+B'D,BPDR"F)YPtAKWCBE+*6f
+CT.u+D>\6BmO]8FCAu.FCAW-%16raCcsBn1*@\f/1=pZBeCc!@4*KS053$o2CTbsD.[T,+AP6U
+@.,9/Qs9*/UAONG[kQ4A8,po+AO%G%16raCcsBn1E[eg@4l7H-Vc$<+<VdL+<VdL+<VeTD.[T,
+AP6U+AO&$BOr<&ATW$*EZe*d$>jBk4Y@j6+<W(@/nlpc6743)+<VdL+<VdL+<Z)LAo&S4:-pQU
66LA`AKYf#FED)7+@6MED.[TI/g*"o+=LYNBeCbe0etOA2)[BQ3F=-_+FS*=C`jiq67sB@+Co2!
BlnD=@;]Tu?O[?ZAo'U_+>t>b-t+`B/gi8!.3K`U+<VdL+<VdLI;NS4+<XEG/g*P)/e&/)Ao'U_
+?(Dc-t+`B/gi\-.3K`U+<VdL+<VdLI;NS4+<XEG/g*M(3XlF5Ao'U_+?1Jd-t+`B/gi"o-Rg/\
+<VdL+<VdLI;NS4+<XEG/g+"6EHQ2AAISu`Ao'U_+?:Pe-o!M,+<VdL+<VdL+<VdL+<VdLI;NS4
+<XEG/g*MZ%16raCcsBn0ea^u0eb%!+<VdL+<VdL+<VdL+<VeTD.[T,+AP6U+A>66$4R>`Ao'U_
+C?m0>TtmFI4c]r4"akq+=Jod3Zp+*%14I*=<J_/+<XT*+<Vdm+<VdL:*:Z%+@71n+<WZe+<Vdp
+<VdL6QdKo+Aj7(+<X$L+<VdL+A>6I+=CGK%1444+>Fu]0esk++<WE^0d%Sp+>Fu]1*A:o+>t>s
+<WB]0d%Sn+>Fu]2]sgt+>GPm0d%S]0d&1n+<XEG/g)hj+DG_-FD50"%1444+>P&^0esk,+<WE^
1*@\q+>P&^1*A=p+>t>t+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)kk+E)@8ATA4e
+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\0d&.m+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^
:-pQU1*@]JCiD%FF_qQp+>Fuo+<WBo+>P&^1*A7n+>P&n+<WK`0H_Jn+>=o\0d&.m+>Fum+<WTc
1*@\o0H`+n+<WB]1*@\^:-pQU1E[f8%1444+>P&^0esk,+<WE^0H_Jn+>=o\1*A7n+>P&n+<WNa
0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)tn+AP64$6V>O0H_J\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+>Fum+<WB]0H_Ju+>=o\0ea_*+<Vd]+>P&^+AP6U+>k8a:-pQB$6V&G1a!nq1E\@o
+>t>r+<WQb0H_Jr+>=o\2BX[r+>t>r+<WB]0H_Js+>b2`0ea_*+<Vd]+>P&^+AP6U+>t>bDKTe*
$6V8M0H_J\2]sds+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Jt+>=o\0ea_*+<Vd]+>P&^
+AP6U+?(Dc-OgD*0d&4o+>GSn1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>P&^0d&4o+?(Ds+<WBm
+>P&^+>Fuo+<Ve%67sB?+<W$Z%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*.s+Cf>,D.RU,%1444+>P&^0eje++<WE^1*@\r+>P&^
1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\o0d&.m+<XEG/g)l&+@B$9$6V&G1*@\o0d&4o
+>P&p+<WK`1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GSn6W-TI
%1444+>P&^0esk*+<WE^1*@\q+>P&^1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o
+<XEG/g)l(+EML1@q?)V+>Fuo+<WBp+>=o\1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc
1*@\o0H`+n+<WB]1*@\^:-pQU0f'qnE+*6f+CSl(ATAo2F_qQp.1HUn$;No?+EqaEA0>K&Ec#6,
Bl@l3AoD]4Ch[cuEt&J#Ao'Uk+=Jp*F(T5MD.[T5+=83m3XlE*$;*u[8Q%uE<)6Cp4ZX]5-OgCl
$;No?+Eqj7E,]B!+Dbb0AKYr4AS,Y$%16075u:6D5t!js-U'.84spdH%15is/g,+ADIdZq+EVX4
DKBE.Ec#Au+Eqj7E,]B!+Dbb0AKYf#@:UL&Deip%%15Bp78d)a:J4be5u9^*+=CD[Ch7X/<,ZQ!
-S/=s5u:6D5t!7OI4#I2:-pQ_ASu$hAT23uA7]Y#Et&Hc$4R>;67tA_IXZ`p+F>4`+C\c$+FO\+
%15is/g,4KASc0*F(96)E-*4EBOQ!*ATD4#ATJu9ASlC)EcPT/Gp#dh<+T/SAnc'mEt&IO67sBU
8PN#B+D58'ATD3qBmO>5AoD]4Ch[d0GV<oB@rHE2%15^$6VKp7:/jYa4ZX]>+?CW!%17,eD'3k1
D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IeAS`J=/n&mI%16WWC`k2[@Ua-_$=m^a+=]!SG%hBm
A7]R".P>[]%16WWC`k2[Bk2Gt$=m^a+=]!^F`\'"A7]R".P>OUB+52YAS`J=/p)#A%16WWC`k2[
Ci<np$=m^a+=]![DeojiA7]R".P>OUF:ARfAS`J=/no36%16WWC`k2[Bl%Dk$=m^a+=]!QChF1a
A7]R".P>@[%16WWC`k2[B6kt8F`VgW%14Nn$;No?5!FFEIXV_5%13OO:-pQq4FVa.INWt[/o4s<
AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0rA0>,o@;BFrBln0&%15^$
<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;FD,T5/0K%KFDPM>+E)4@Bl@ltC`mk@C`m/(A0>Po
F(c!i>[_bsBQ%p<INs;MF`_;8Edf6^+=18t%14Cd>R_#d>]XajCht5!F`M;FINs;UC3+N<CjmUX
I3;d"%14CdAoDU0DJsW.F(or3+C'#"G]\%LHW*I$/M]1A3ZrkrIWK121,Ut=,CY%`>]+J#D..7%
BmO>"$@N?j>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&.1HUn$;No?+D5_5F`8IA
G%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3De*ZuFCfK$FCcS5G%G];
Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:%14Nn$4R>;67sBs@<?(*
+D5_5F`8I4F_PZ&+EM%5BlJ/:%15^$6<-TN6rZTW4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$Aftnu
FCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3
DBO%7AKZ28EbfB,B-;/%FD)*jF(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>+FYPaB6%p5
E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*
+<Z+XIV3\>F`;dSILQWqDIdR%@ps0_$7QDk%15is/g+eIDfp"AEc5l<+EV1>+>"^GDesQ5DK?q;
@<iu5AS#Bp@:X+qF*),6B+52?9LhuW9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRC
B6%s-BlkdHCghEsGT^U4Ch54A-tdR>Ch[u?+D58'ATD4$ATJt<B6%p5E$>_u,p7)6D.R6#G%G]8
Bl@m1+E(j7FD,B0+D,>(AKYT'EZeq%@qZuW:IH=<Ec6)>+DGp?E,ol,ATMp(F"Rn/%16?SDK'`?
HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%:_E-68LINs;S
Ec6)>INs;`Bln0&/p(ZLI16NgD..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$4R>IDIn$2@:s-\
$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(
F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uo
DesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIW'CDATobK
AU&V4$4R>IDIn$2@:s-\$7/qqDIm<rCisT4%16?SDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm
$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:
FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%14Nn$4R>;67sC)
DfTA2Ch[u6Ec5l<+EV1>%15^$=&2^^9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRC
GAhM4Ch[u?+DbJ.AU#>0Bl%?5+:SYe$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO
>[h8WBl89.De!p,ASuU<%13OO>]++sE+*Bj%13OO,p6]9D/E^!A9/l*DfQt/A867.FD5W*+Co2-
FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,DJ()#+EDU@AIStm>]XIuCh7KsFD-#+
@rH1+D/OE+E.*'hASli)$7/quATVa"DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;$7/r!GAgu0
CisT4%13OO-!YA+ARfXpF_u"*$=%:_E-68LINs;`AU&*$D.S/@IUd;,AM/(9G^U#.%16?XATr*%
B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO
4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO%15is/g,">Bl5&.
De*ZuFCfK$FCcRg@8pf?+E2@4@;TIiAISu=:IIljFCfK$FCe9hARTFbCh5aj+>=p!+>=63,p6r@
A8Gt%ATD4$AKYetFCf\>E,oMuD.7<m/g(T1,p3X(,p60#BlbD/Bl%?'BlbD*+D>J%BP_r:@s)j7
Df'37ARlp,ATDj+Df-\9Afu2/AKYr4ARTFbCh4%_,p7&5FCfK,@;I'!ASu("@<?'k+C]U=E+*Wp
Ddt/9+>%XWDfBf4Df-\ABOu'(E,ol-F^o-'B-7Wj,p4g^AU#>9F`_SFF=n\T@;]Uo@j#H!B4u*q
B4uC$DJ()+F!,CEATDg*A7T7h+CT.u%14C(FD,5.F*(i.A79Lh+DG_(AU#>3F!,L7A7]@eDIm?2
+:SYe$=%+[@s)X"DKKB)@<6Ko0f!]i?$g"#FD56$AUP!p%16?_F(K<!@r#LcAQrtZDIdfu@;od`
HY6o.D.Rg0H$p,/>]k+!E+*6l@:s.UBOtU_Bl7R)?$g1+Ci"'!B4ZK#$=%^pAT2'fCLLjeHYdP;
A7]e!I16NgF`V,5@:O(]B4ZEuD0'cDD.5&)D0'Q&FD-(3$=%^pAT2'fCLLjeHYI):ATVL./88^4
F^]B'G^U#.%14C(E,ol?Bk1dr+C'#"G]\"L@WQ%"BlJ/'$=%^pAT2'fCLLjeHY-u:CijnWAUP[1
$4R=g+D5_'E+irqF!,17@r-:/Bl@m1%16?_F(K<!@r#LcAUA'1@;omo@sBPGF^ersB6A6+I16Ng
B6%F"BPCstE+*j%H[@@uBl7EsF`V88DK@IZI16Mm$7-g;F(HJ2Bk)1%FEqh:+DGF1@<Q'nCggdh
AISuO8S1G+Ch6%[BleB;HYmJ,Ec6&FE+LYCFEr:]>]k+!E+*6l@:s.uD/!L#Dfg8DAUSuRI16Ng
BkD7*D'1N;BkDU$FCf\>0jJ=)>\RedF^]B'GT\_GAnaC^+=/.EAfu&'AoqU/%144#>]k+!E+*6l
@:s.UF`_4T?$g:'E-686DI\)($=%.YF(HI?+DGF1Cis0.AU#>9EZfU<CghEsGRY!&+C'&1AT2'f
CLLjeHY.26FE;D4@sndn+<Xp'Ap@m/AU"Xk+<VdL>]k+!E+*6l@:s.uG\hJHFE1e@G]dn<@rGmh
I16N++C&Mm%144#>\%DX@<HC.AoDR/An>CmF`M&7HVIpfE+s3&4`k7[/TbQKF=^@#@;KL<9jr-R
BM<>gATD9hF(Kb/$6UH;+ED%4Cgggb+@T:.:K9b)GA2/4+E_R9@rGmh+D#\9D]iP'@<,ddFCfJ8
%144#,p6o6+F.mJ+Dtb%A0>u-BlbD,BOPpi@ru:&+>"^XBOr<*Eb0<'DI[6#De9Fc+<VsQFD,B0
+EM77B5D-%@q]:k@:OCjEZf(6+EV:.+E2@4@;TIiAKYT'Ear[%+E_a:+E(j7G\(]"FCf\J+Dc1/
CghEsA.8kg+=191ATqX&D/E^!A:%QmF`MDKHUUq4:K9c1+<Vd9$6UH;+Ceht+EM+9+E)@8ATAo1
Df0K7E+*6f+D,P0FE8R=Afu2/AU,YDAKYE)@;0Od@VfTb$6UH;+A!\r@<?0oEZf14CLnVeDfp)1
AKX?YA7Zl[Ec3(AAS!n3$6UH;+D>k=E&oX*@VfsqF"Um3Ddm91@rH3;FEqh7Ci<s,@;on*0/>49
1+t=A06;&SEarZ4@rGmh/T>`K/nf?DC^g^o+=196ATVd-DJs-*DKL4pEb/fVDf0KA%144#-!YM&
FDYr6De<p*FF-r)F`Lu'+@C'XAKXfiDg`'%>\7[Z$4R=g+Auc]AS,XoAKYet@V'A"Bk2=!+D,P4
+Dbb5FE9MdDffZ(Ed)5=ALnsGBOr;tDKTf-Eaa'$+E1b!CLLje+EqO9C`m4rF`V+'$7-g3@<--p
EcW@FD]iV9FCf?#+C\o-Df0).FD,5.Ch74#+DkP-B5)69%16?W@;BF_FDPN1FCfJt6$,G)B5)6O
De!p,ASuU:,n12(+C&quDIn$%Df'?"DIe*!5\t.UFD6.4$6UH6+F@@7ATVa"DJ+')HX(Aq@V'A"
Bk2=!I=!e^D1-gA$@Q/r@;BF_FDl87ATA4e>]k+!E+*6l@:s.uASuX-ATD4$AUP!p%14C(FD5B$
FDPZ4F<G(3D/E^!A0>K&EZf14F*&OGE+*6jDJ'Cc>]=_%G%kJu@rH4$@;]V&>]a[mBQS')F*)hW
,n12(+C&u!FDPN+B67g6>\S:kD0'9-I=!YeFF@D8ATVa"DJ+')HX(MuEcZ#1E.*'eE--MV%13OO
,p6Z>Bl%<&A8bt#D.RU,+DG_(AU"Xk>]k+!E+*6l@:s.uD..3kBk2I:%13OO,p6]9Ci=?8%16?_
F(K<!@r#LcAU@p*Ci=?B%16?NAS,XoARfXpDfU2GBOPF_@rH1%Ed`:47m_WN1,LsA1,LsA1,Lt=
%14C(C*7#)DKKo;C`me@Eckl6F`M&7+:SZ_A7]@eDIm<rCi=?@CLqd8@rH1%Ed`:TB4?:90J5(9
/2/\33@lj:2)BXi$7-g0+D#e:Ch[BnF<G"4B6A'&DKKqBGT_8SD'3^=FWbi:$=%+QAnc-o@rH1%
EdM>*FCAZtCi=?BHZEb.I=!Y#0f(@7/i#F<0J54=I16N0+DN$:F_tT!EcW?T+CT)&+EVmJATJu8
AS!!!/pM5L%16?NAS,XoARfXpDfU28ARfmnDes?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DX
Bl7KlDes?4HX^E)ASu!rCi=?BHZEb.I=!Y#0JG%3/het10J5=>I16NgA7]@eDIm<rCi=?@Ao)Bo
FCT6*DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%14C(C*7>2@ps0r@<6L(B5VQtDKKq/$=%+QAnc-o
@rH1%EdM;0@<,jrCi=?BHZEb.I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@F*)G:DJ*Ht
Ci=?BHZEb.I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@@rH4$ASuU"Des?4I=$!I@XWSW
/i>O<0J5.=/2/\10msK<,p7/IBl.R+Bm+&1@:XOmEaj)4@;]Tu@rH7"F`(]2Bl@m1%14CdA7]@e
DIm<rCi=?@DffZ(Eas$(DfU8QEbAj0HS@'02CpO71Gp^;/hf#.+<Vd9$=%+QAnc-o@rH1%EdM_H
BOu3oDes?4I="j^6@F27/2/V12)Tdk$7-g-Ci<ckC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@
@;KLqFCT6*DfU8QEbAj0HS@'41b:=50fCR:/ho84%14C(E,oZ0Bln'4AKXSfG%G]'F!+n/A0>c.
F`&=>@;TRs%16?NAS,XoARfXpDfU2:F`(]!Des?4I=$!I@XWSW/het10J5%5/2/\10RY&d+<Vd9
$4R>IF`V,5@:O(]B4ZF%@;]S#G&h&?%16?.AS,XoAQ*8\Ecb>nEai6_Df'?"DId6j@<-EP>[1N\
>^]n)>^Ur/$=#u1Anc-o<b6;\@<?4#7;d9_Ec5i4ASuU:882^MCh[NqFD5W*I=#"+EaiI!Bl/9F
@rH4$@;]UcBOPq&4^;5sHX(uI%14C(6"FLK-S/kJDKKr6H=]6EF)>?%CaU?;DfQt;DfTD3@q]:k
@:OCjEcW@BATAo0Bl7Jk$4R=g+E1b,A8bs#B4YslEaa'$A0>r=DKK<3+Cf>+DfTQ0B-:]&D/E^!
A9/kF+DtV)ATJ:f,p6W:AKYT!G\(D.Bl5&+ASu("@<?'k+Cf>#AKYH)F<G+*Anc-sFD5Z2F!,=.
Gp!P',p6Z.+EM+9+EVNE@;^?5G%#3$A0>u*G]Y'?DfT]'FED57B-:]&D/E^!A.8lNF`V,5@:O(]
B4ZF%Ea`frA:4mo>]++sASu[*Ec5i4ASuU:;eTTMARp49I=$AO$=%I[G@PQ.D..<mHX'3TH$=1I
A5mJ_I9SF3HX(Z(G][G6Ci=?@CLqd8@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3,p7DMEbf_=@V'Y'
ATAo;Bln#2;f?f!@q?cMDe*E%:i^I`$7/qpATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,
Des?4HY[2<G@PQ-DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XW"B@8qMkAQ3S`I9SF3HX(Z(G][G6
Ci=?@A79Rg@rH1%Ed`:],;FUpI16N0>]++s@rH4$@;]V&>XW.5<affDDejc*0jT-2FCf]=@rH1%
EdM>.@s2@#Ci=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1HQt7nI38t+>]++s
@rH4$@;]V&>XDk?APQ3CCOKDA?$fguAU&<,Des?4HX^E)ASu!rCi=?BH[?tlI=6MQ$=%I[G@PQ.
D..<mHX'$VDdd`eDejc*0jT-2FCf]=@rH1%EdMD7Ddd`tDes?4I=$;c0n"Iu%16?XATqX&D/E^!
A:%QKBOPp\Dejc*0jT-2FCf]=@rH1%EdM;0@<,jrCi=?BHX(Z(G][D,H[?tlI=6Nl%16?XATqX&
D/E^!A:%Q[FE2)5B2iebI9SF3HX(Z(G][G6Ci=?@F*)G:DJ*HtCi=?BH[?tlI=6MQ$=%I[G@PQ.
D..<mHX&pVD/Ej%FB!0oI9SF3HX(Z(G][G6Ci=?@@rH4$ASuU"Des?4I=#4@AU&<2FF/?Z0n"Iu
I16NgDIn$%Df'?"DIe*!:NU8]E`?smI9SF3HX(Z(G][G6Ci=?@DffZ(Eas$(DfU8QHQt7nI=34I
$=%I[G@PQ.D..<mHX&jQATDllDejc*0jT-2FCf]=@rH1%EdM52ATDm&Des?4I=#4@AU&<+Ap\kL
0n"IuI16N0>]++s@rH4$@;]V&>XijR@ruF'DH(OiI9SF3HX(Z(G][G6Ci=?@Ap&!$@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!7WiTYFD5Z2<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!;IsKT
Df/9XEbf6,<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!7<3EeE`?smI9SF3HX(Z(G][D,H[?tl
I=6MQ$=%I[G@PQ.D..<mHX'<aEc#6$<,ZQ#>;9E1HQt7nI16Mm$7-fe:IH=DEbT*&FCeu*@<Hg/
Ch[<uGp$U8D/E^!A9/l*DfQt>Df^"CE,ol,ATMp,DJ()2@;]Uo@j#DqDImisFCeu*CghEsGRY!b
DIn$'DK]`7Df0E'DKL4t:II]nDfp"iART+\Ed`:_H[Q>1>]++sASu[*Ec5i4ASuU:8l%iODf^"s
Ec5H!F)u8?I=$BhI16Mm$=%^pAT2'fCLLjeHY-](@sM`uEd\B(>]=+aATMs=Ch7s*@;]S#I16Mm
$7-g*@<?''ART(^+E1b%AISuOEb96.FF.8(D/a08>]amp@<m9L%13OO>\RepATVL.%144#>]k+!
E+*6l@:s.UF(KH4@:s.mBmO>RAmoLsALnrM+E1b%AKZ&.H=\40AS,XoARlomGp%?CFCf\+$6UH6
+<VdL+<VdL+<VeLDJ<U!A7[o9@;L!r/0H&X+<VsQF`(o'De*E%@WH$gCNCVBBOu'(F`V,)+EqOA
BHVP2FCf\+$6UH6+<VdL+<VdL+<VeOATVL.?$g71E+O'1AS-?"$=%.YF(Gdf+<Xp3F(K<!@r#Lc
AQs:pBk)'lANb-UF_+j*BR+Q.EcP`'I16NgAn_\]%16?RH#R>8F(KH9E-l&7ART@jBl7^-4`k^e
ALn8t+<VdL+<VdL+<VdL@W-1#D..I#F$4VcF_**5$6UH6+<VdL+<VdL+E1k'@<H[*DfS!fI4Pg7
+<VdL+<VdL+<VdLE+ER&Bln0&4aVT.%144#+<VdL+<VdL+<Y04Ci=?1Bl7^-4`k^eALn8t+<VdL
+<VdL+<VdLF`M;.Des?44^r5MALn8t+<VdL+<VdL+<VdLCh[d&@rH1%E]n8JB4Yt&@4Vip+<VdL
+<VdL+<VdLE+EQiDfTB"E]nb'+>=olI=2P3>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$=%X`
FDPN+B67g6>]=+lF),K/I=!kkF<GO=F`SZ\E-*4>Bl8'7+>IhWI16NgF(KH0ASu.&BR<uqD.Ra#
ASu"'F*)G6FCT!4HS]5MI39XY+E2@4G%GQ5+E)F7Eb9H1C`mP.DImku$=%X`FCT63DKKH1HZNb.
DKTf,AT2a)I=!Yr%13OO,p75>F(KG9CghEsGT^^<A7^!.FDi:EF(HJ9BQ@Zq+Cf>+F_u#;+>"^H
AS,@nCige6F!,RKD[d%"+EqL5@q[!*ATN!1FE8R=DBNb6FE8RCAfu;+F*(u(+E1b%AKZ&5@:Njk
Bl5&0@;]Us@ps=f%14C(:/=hX3ZqjAC3=T>+DGF1Bl7HmGT^m4D.Rc2Ecl7BFDkf'FD,6++:SZ(
+D,Y4D)reQFEDI_0/%NnG:m]?FCf\K@rH4$F`(o8GqO#UB.nFBATr67E+rf7E+j2TAj%stF?M?;
1GoUK>]k+!E+*6l@:s.uD09Z:Bk)'tI16NgD..3k@<?<sFED)7%16?\ASu('ASu[*Ec5i4ASuU:
FD,6"DId='I16N++F@@-AjCH^De!^%F_u"*$6UH6+<Ve35]UFWFDl&.@rH0q@;L!r%144#+C&Jo
F(Gdf+<VdL+<XoSEb0<6Df0,rDesN9F_)!h+<Ve3An_\]+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.
Ecl20I=!YeFF=T*+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.I=!b-E--L;$6UH6,p6]2@;]^h+>Y-^
D]iS%F(oZ+A0>c4D.7's+E(j7Bl7HmGT^L7CisT4Et&I!+<XouAS5^pHYmnAFD56'Cib#O1OWJ4
F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%,`+<Xp+@<--mDffZ>>YSXBAQ<\gATD9hF(JTjDId='DIIBn
I3f=0+<VdL+<VdL+<VdLHX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6>]aXnF)YQ#ATMs=
Ch7s4Cgh$qI16N++<Xp1ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16N++<Xp1ATVa"DJ+')HX(Mu
EcZ#1E.*'eE-*4ACiseA0J5/#FF=T*+<Ve3Eb0&qGRY!&+<Xp*ATV0kFCf;o5\XbRBlmp'I3f=0
+<Z#9ASu%*D09Z:Bk)'tF+%;-AjCBJF*)><ARfXp>]4Lk@rH1+D/NTiCia/m@r,^bEc>H"AR&h]
I16NgD..3k@<?F0BOu2n$4R>ID..3kBl7HmGRXuh$7QDk:-pQs5(7s0IVNe3Ch\!&Eaa'$<,uo"
@VfUM@;BFpEt&Hc$;No?+BLj,:.\2N3Zr6WDJ().Bl7K)@WH$gCM@[!+@f=*<DXf/76s=1;BTdi
DIml3A8`T.Dfd+GEa`o0E,ol9ATDU4+UncR67sBP+CT+0@q\YVF(oN)+Du+>+EVNE,%bP6+s:u@
BlbD+ARf.kF(HJ-ART+\EcW@?@<iu5AS#BpG%G]>+Dbt6B-;#)DIml3F)Po,FD5T'F"Rn/%15is
/g*_t+F.mJEZf%,@:Wqi+D>2)+Eqj7E,]5pCh4`*Bl7L'+EV:2F!+n%C3=T>+EV:.D'3;!AoD^$
+E_a>DJ(),De*ZuFCfK$FCcU)$4R=O$;No?+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-
+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9
@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0
C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*H!tN*+EqaE
CER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3k
F!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&
GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4
@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg>c-
C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg;d!%15is/g+jNA8`T7BOQ!*8K_P^
+C\nl@<HX&+DDs,D'4%9@<<W++CT+0+DDs/D]j7;@<<V`+CoC5@V'%XF`V+:Bcpi$+EqL-F<G9?
@;R,0Bcpr)+EqL-F<F-tA8`T"ARf.kF(HJ.+CT+0GA(E,+DDs,D'0s8+CoC5GA(E,+A!\dD]iM#
@psM$AKY\0@;R-2BOQ!*Bcpi$+:SYe$>aWuB6/0;AnF1e+?V_<0d%hdBlkJ2@<3Q$Df'&.FDi:=
Gp$O;FCf?3Bl@l3FD,*)+Dbt6B-:i-Dfp"ABOtU_ATAo0Bl7L'+CoC5DJsV>GB.,2+>"^XBPDN1
BlbDBDfp(CE,ol+Ch7I%+>"^RDfd+:De*ZuFCfK$FCcgIF!*%W,'%7,F^o3/ATAt;/KcHUF=/GW
+CQC:DfTA28K_bjF*&O7Eb/[$ARlotF=A=a+F.mJEZee"DfTN&DKI"2De*E,C2[X"@;BFL67sB1
C2[X"@;BEs@kB8TF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7
-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu:FD5Q*FD5<-+D,P4+DkP&Bl7Q+
F(96)E--.DAo_g,+:SZQ67sBnEc6)>F!+n/A0>r9Blmp-/g)9.F<G".F)N12Df0Z*Bl7u7@rGmh
+D,P4+CT.rCjC>@DJ(($$;No?+DtV)AKZ#)An?!oDI[7!+DG^98g&=rEb'5D+:SZQ67r]S:-pQU
8T&W]Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8ZB4Z0nCi"37+<VdL+<Y<.FE8R5Cht59Bl.F&
FCB$*Et&IO67sB'+DkP&ARoq#E$-8G+<Ve;F_u)=+E(_(ARfh'+E)-?E+*j%+EVNEE-67FA9Da.
+Co2,ARfh#Ed8*$:-pQU+<YN0CLq."+<VdL+<VdLD..3k+D5_5F`8I3DIal2F_Pr/+EM%5BlJ08
%15is/g)8ZDIIBn@psJ#+<VdL+<Y01@<6L(Anbgt+DtV)ATJu.DBMOo@rGmh%15is/g)8ZE-682
Ci"37+<VdL+<YWGFE8R5Cht59Bl.F&FCB$*F!*%WF(Jo*-td+5@;Kb%F"%P*:-pQU+<YlMFCf]=
+<VdL+<VdLGAhM4+CT.u+EV19F<G[:G]XB%:-pQU+<YlKA7o^s@UX(o+<VdLAU&<;@:OD#+D5M/
@UX'qDIIBnF!,(8Df$Uh+Cf>#AISuA67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m
+=LuCA8PajAKZ#%DJ*N'0f:X:0f_6C%13OO@rGjn@<6K4-Xgb.A8PajAL@oo@rH(!F(KB6+<W%?
C2[W1%13OO:-pQ_A7]^kDId<rFE8RL/M/)`@VTIaFE8RKBln#2A7]@eDJ=3,Df-\.AT23uA7]Xg
Bk;>p$4R>;67sC&@:sX(8l%htA9Da.+EM%5BlJ/:Eb/^&Bl%<&@rH4$@;]Us%15L'9i+eT7m/m\
+AP6UHR_W`6n3U4%13OO:-pQUCgh?sAKZ)+G]Y'PEa`o0FCf<.DfT9,Gp%!CF`&=>@;TQu@;]Tu
Ch[cu+EqO1FD)*j=&M=\<)$1j8OP^&-[L(d4#T#,$4R>;67sBlG]7\7F)u&6DBO%7@<<W%Ch7$q
F!,O6Eaa'"BHV5&C1Ums%16$06VKp7;E[&g+tdqT@r,^bE[ND+<D?:h5t;@k%15is/g+_ME,oN2
F(oQ1+EV:*F<GU8@WcC$A9/l+Ec6)>F!+n/A0>r9Blmp-+D,Y4D'3n0@<?!m+E(_(ARfg)A79Rg
%16$07oE/H3[Z%_Ec<?h+<iE\+tauc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@
ATJu<DfTB0+DG^9FD,5.F(96!FCSu,DdmHm@rri-DBMPI6k'K%:Jb%j4ZXs3DfBi@+<iEc-Z3a-
-RUHD:J=PO5tj]u-RW7DBeD4i-QlV9@rGk"EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBl
G]7\7F)u&6DBO%7@<<W5FDl22F!)lK@;TR,FCf]=.3N_@@VfUs+DG^9F(96!FCSu,DdmHm@rr.e
;bp4i<)c:g<'<8i+E2IF+<iE\+tb5j-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K
-QlV9@rGk"EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5GA2//
BOu6-FDi:>F_tT!Eb/c(F(96!FCSu,Ci<flCh4%_;bp=n8Q8&J4ZXs#De!p1Eb0-1+B)'C?V4*^
DdmH//4<K4:fK_N%13OO:-pQ_ASu$hAT23uA7]Y#Et&Hc$>OKiFDl)6F&#%S.V`m4FDl)6F!+sE
/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB$;No?+A$Hm
ATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5E%c9TBlmo/
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat@;TRs+Cf>,
@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(ARfh'+E)-?
DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D+ED%1Dg#\7
GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-E,8s.F!,O;
DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a:IH=D
@VTIaFE7lu:-pQU+DPh*BOu"!+<Y3/F)Yr(Gp#pO7Nb<!6m-/SCiCL>+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD@;BEsCi<`m+EM%5
BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/G]4cJ+<Y]9FEMVA
F!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2Dfd+9
DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL+D58-F!,@/D.Ohu
DIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+8l%ht@rH7.ASuU(
Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9EHPh8F)Q)@ARlp%
@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+:SZQ
67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4JEd8d@@;]V$+CT=6
@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8F)Q)@ARlp(AS,Lo
ASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9
E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJDfTA2AU&01@;0Uf
FD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'F`V,)
@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i+EqaE
A9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X)
Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcmEb$;:BPDR"F)YPt
AIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!%16igA9E!.Ced;L
+=_,EA9E!.C`m4>/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'Df-\9
AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8F`_>6
Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,+EV%5
CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:NjkDJsZ8
F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'DIIR2
+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-$;No?
+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=DfT]'
F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9@VTIa
FE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.F<G[:
G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:Bldir
+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7BFCB<6
Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;4ASc;p$;No?%15is/g*o-FCfMS
%15is/g)8ZATDg0EZc\ODegJ4ATMp$B4Z-,-u*[2F`_>6+ECn.B4W2>0JYL>/MJk73B8Mt$4R>P
De!TlF)rHO@;9^kF`_>6-OgDmDeX*1ATDl8-Xgb.A1%fn%15is/h1CCE+NotASuU2+Cm&U+Co&&
ASu$iDKI"FDfTB0+:SYe$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4@<6L4D.Rbt$:.Th<D>n\
9gMZM4ZXs!F)uJ@ATKm[%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F`_;8EX`@A<E)Lb
;GBGT90G<`@<H[*DfRld%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt1Eb/[$ARl5W6W-?=
<(02L5uL?=3[\EXART[lA3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZen<@:UKoF`(i#
EbSs"+CT.u+D#e+D/a<&Et&IE=[>GM5uL?=3[\H`@:VDH%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt;Df/uo+D>n8B45gp@;[2rDIal$G[YH.Ch7Ys$;F;k5t"F5;G0/6-Z*d>@:VDH%13OO
:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQtDATD6gFD5S$$<BSn6:"RB9hdoO90G<`G%G]'@<?4#
3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+EDC=F<GdGEb'5#$;sYq<*)jn6rQfG;G0/6
-ZX-DFE_YDA90dZ%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebf_=/KeS8E+NotF!,C=+E)@8ATAo1
@<-.)%15L!6WHiL:/jqR;G0qO3Zp^e;cQO\;b]PU905F><(Ke_9gMZM4$un75u^9@9gMZM4%*4;
6qosF905jD:-h9B5uL?;<^fnQ5u^EM9gMZM4&SjM<*)jn6rQfG;G.H+%15is/g+YBD/E^!A0>]&
DIjr1F`2A5F!+7W+Co&&ASu$iDKIo^C2[W*+Xefh4Y@jf@Vg%,DffP5%17)s4ZX]k?t<__EHQ2A
AO%k>7TW/V%13OO:-pQ_ASu$hAT23uA7]Y#Et&H                                   ~>
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
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 globsBasicDDef00 mnlBasic00 putNameTimestampsBasic00 restdBa'
zz=:zz,'sic01''),<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bn'
zz=:zz,'lSmoke01 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dn'
zz=:zz,'lSmoke00 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 globsSmok'
zz=:zz,'eDD00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00 mnlSmokeArgs00 n'
zz=:zz,'ewdSmokeBadArguments00 odSmokeArgFail00 rxsBadSmoke00 rxsSmoke00 rx'
zz=:zz,'sgetSmoke00''                                                       '
zz=:481{.zz
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
1E\P#-p0UR/mg=U-QkfF77K^E6W5*q:IA,V78?fV5uL>u8Oc!579<8_6rRi=A8Gt%ATD4$AKXQj
8l%ihDKKH1Amo1\+A$lO:IJo7FCfK)@:NkI<'a8I5uL)n8U=!)7!*?cCi^^jH:gt$FDl)6F&Q%(
:..BG6m,'I8l%itFD5W7ATDBk@q?cT:IJ/X:J=\f9gg*r:IJ5X6m,8u0JYLD+Au!2<*)jn6rRi=
A8Gt%ATD4$AKY&P5u:BU77KjN<(0n3@:FC&@rc-hFCf;tF*&O8A7]@aF(9&qF))n1Bl\9:E+O'(
De'u&Ch[icFE_b6E-!.:De*NmCiCM3De*ZuFCfK$FCeKI6m-5_A8Gt%ATD4$ARB+ZF(f)mFCfT8
C`mJ2A8Gt%ATD4$ARBIrDfd+:De*d(+DkP-CLh$tGAhM4F!,=.Ebf;rF)u&.DBNn,EcYf%De*E%
E,]<*A7]RcFCf\>E,]<*A7]RcFCf\P+E_a:A7Bg,Fa%Y1FCf]/Ed)GBA90+I/1<VC4"akp+=A:?
@Wk[eDeio<0HahIBl%<pDe*ZuFCfK$FCcS-Ci<d(6=FqL@mi^rAhYn]B5DKqF&QpoCLon%0JFk'
/1<VC4"akp+=A:HDe'u*De*ZuFCfK$FCcS0De*ZuFCfK$FCeElDfoN*APHTKATDi7C2[X"@;BEs
C2[X)Df9H5+DPh*F`_>6-RgSp4?P\X?SNZN+DPh*@UX=l@ru:'FE8R>De*p+Deip+ATMs7-RgSp
4?P\X?SNZN+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=WgO:;cI+=De*ZuFCfK$
FCcRo:IIuc8l%iC:IAK+A0=iI6r./^:IJQ,A0=iI6r.0)De*ZuFCfK$FCefrA0>?(Bl%<pDe*Zm
FCf\>@WcC$A86$nCh\!&Eaa'$CghEsGT^O.AmoguFB*BnEbf63F!,.1F*)>@H"q8.+DPh*?Z1+%
ATqL'AU#>4De*ZuFCfK$FCeHnATDQtH#k*CDe*ZuFCfK$FCeftG%kN3?Z]k(+DPh*E,o\nF(KB-
AU/>>D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*C2[X(Dfp)1AKYr4C1Lmf
@<HC.+E2@9C2[W*H?smPDe*]nBl7:"AU#RO/1<V9+>Y\s1,(I<0etI;/i,F?3&NHI2)-j/1,(I;
0ekFB/i5OE0f1mN1b^^.1,(I;0etF;/i57B1cR<H0K1+00JY=:0ekX?2)%$H1c%*N3&Vm70JY=:
0etU=2)@'F3&<QS1,L+/0JY=:0ekX?2)%$H1c%*N3&Vm70JY=:0etU=2DHm@1,(RE2`;d60JY=:
0ekX?2)%$H1c%*N3&Vm70JY=:0ekX?2)%!L1GLjL3Ar!80JY=:0ekX?2)%!F2_m6F+>PW+0JP:;
2_HpE3&rcP1b^gB+>PW+0JP:;3%d$H2`EEE3B/cL+>PW+0JP:;3%d$I0f(L@2D[6K+>PW+0JP:;
2(ga@2DR-G2`!HP+>PW+0JP:;2_HsB0JPCD0f(aJ+>PW+0ekF<0J5.?0f(gL0f(gK+>PW+0JP:;
2_HpI2)I0F0K1pM+>PW+0JP:<0J51@2)R<M2)-dA+>PW+0JP:;2_HpF0JbFA2)7*K+>PW+0JP=:
0eP:<2D?pA2E<HG+>PW+0JP:;3%d$H3&NZT1bgdC+>PW+0JP:;3%d'G0fV0O1,^mJ+>PW+0JP:;
2_HpC0f_0I2)QL30JY=:1,(F81b^UC2`WZL2_lL20JY=:1,(F81H@<M1GLmE0f1".0JY@;1,1I8
1H.'C1H@3G2'=Y.1,(F;1-$sD3&ioR2).!E2]sk01,(F;1GCF=2E!<H1,V'H3?U(21,1IC0ek:<
1H@BL2`ETN3?U(21,(F<0JP1:0K(^@0K:pK2]sk01,1L=0eb492_[3K1,CdB1*A>+1,(F;1,ggB
3&E?H3B8oM1E\G,1,(F<0JP1:0KCsL1bg[C+>PW+0ekF<0J5.A2D[*J2DR*F+>PW+0JP:;2(gaB
1c%*I3B/cN+>PW+0ekF<0J5.A2D[*J2DR*F+>PW+0JP:;2(gdA0JYC;2)dHP+>PW+0ekF<0J5.A
2D[*J2DR*F+>PW+0ekF<0J5.A2D[-C2`WcO+>PW+0ekF<0J5.A2D[*J2E3WS+>PW+0JP:;2_HpE
3&rcP1b^gB+>PW+0JP:<0J54A0JtjF0f(U?+>PW+0JP:;3%d$I0f(L@2D[6K+>PW+0JP:;2_Hp@
1c.'I3&NQN+>PW+0JP:;2_HsB0JbC:2)@!11,(I<0etI;/i,F@1H@EL1H@B:1,(I;0ekFB/i5RH
2)$jG3AE621,(I;0ekI</i5LE2E*HI1G^s41,(I;0ekFB/i5I?1GLdF1,h*61,(I;0etF</i5FF
0fLdA1GL^/1,(I;0etF</i5FF0fLdA0KCj11,(I;0ekFC/i>L@3&rlP2DR981,(I;0ekFB/i5@?
1,:O;2)mN;1,(I;0etF;/i5793&`iR1,gs21,(I;0etF;/i,LG3&E<D0Jah,0JY@;1,1I81H.'C
1H@3G2'=Y.1,(F;1GCF=2E<WQ2`EKH1E\G,1,(F;1GCF=2E!<H1,V'H3?U(21,1IC0ek:<1H@BL
2`ETN3?U(21,(F<0JP1:0K(^@0K:pK2^p:+4>J$9,Vh&/0JP:;2D-jC1GpsF3B&lT+>PW+0JP=:
0eP:=1bpjB0JkaJ+>PW+0ekF<0J5.A0f:[C0fV!F+>PW+0JP=:3A*0J2_ZsE0fCsH+>PW+0JP=:
2_HpD1Gq0P1c.3J+>PW+0JP=:0eP:=2)@6K2)R0F+>PW+0ekF<0J5191,q$K0JbO.1,(I;0etI@
/i5@=3AE6H2DmKD/1<V9+>tK#0JY=:0etU=2).!I1GUaG2)ZR40JY=:0et^@1cI<H2E!HP3&i$9
0JY=:0et^@2)-pJ0fLpD3&Da50JY@;1,1I81H.*D1bppH1cQU50JY=:0etX>2*!NM3AE6H3AM^4
0JY=:0et[?1c7*G3AWZP2)ZR40JY=:0etU=2).!L2`NNH1cQU50JY=:1,(F81bpsJ2_ZsB3Ahp7
0JY=:0et^@2)@$I3&riS0JXb+0JY@;1,1I81H.*H3&ilO1,U100JY=:0et[?1c70J0K(gD3A_j6
0JY=:0et[?1c7*G3AWZP2)Zm7-p07-1*eV/1,1L=0eb493ArQF0KD*P3$9t11,(F;1,^aB1H7?N
1cR0D2'=Y.1,1L=0eb493ArQF0KD*P3$9t11,(F<0KCaC3B0#V2E<WR2(:()4>J$70I/D-1,(F;
0fUdC0KCpG2E!BL1E\G,1,(F;0fUdC0KCpG2_m*B2BXb/1,(F<0JP1:1,q*F0fM$F2BXb/1,(F<
0JP1;2`3QR2)I-M3?U(21,(F;1,(=;0f:[>1,CU?+>PW+0JP:<0J54@2)d6M3&i]S+>PW+0JP:;
2(gdC1,gpA2)dNT+>PW+0JP:;3%d'C0JtdJ2)6pB+>PW+0JP=:2D-dG2_m9I1c79R+>PW+0JP:;
2(g^B2`N`M0fLjG+>PW+0JP:;2(gdB2)$jG3&*6E+>PW+0JP:;3%d$H1,1XG1,h'J+>PW+0JP=:
0eP:>1H.*L1cR6N+>PW+0JP:;2D-jF3&EHH1c.*N+>PW+0JP::3%d'B3AWKK0JPF@+>PW+0JP::
3%d'B3AWKK0JtUC+>PW+0JP::3%d'B3AWKK0JYOC+>PW+0JP=:2D-g?2)7'D2DdBO+>PW+0JP:;
2D-jD2).!L1,(C@+>PW+0JP:;2D-mA2E3KJ1Gh$M+>PW+0ekF<0J5.A2D[-C2`NZ;1,(I<0etI;
/i,LG1G^a>0f_081,(I;0etF</i5F?2)[BO3B/f;1,(I;0etF;/i>RF3&`]O1c[Q=1,(I<0etF<
/i>ID3&NEJ1Ggp21,(I;0etF=/i>RB3ANKN0K;!61,(I;0ekFB/i,LI1cI*B2_[!01,(I;0ekFC
/i>@;2)dHO1,:U-1,(I;0etF@/i5:;2_[$I3B8r>1,(I<0etF</i>L?1H7BT3B&l>1,(I;0ekFB
/i,LB3B/fR2`!?71,(I;0etF=/i5RE2)$mH0fCg11,(I;0etF</i5IF3&39M1c6C20JY=:1,(I9
1bq'O1H.9O3AVd50JY@;1,1I81H@?L1,q0M0fC.00JY@;1,1I81H@?L1,q0N2DlU40JY@;1,1I8
1H@?L1,q0M3?U(21,(F<0K(O?0et^C2DR9O1E\G,1,(F;1,^aB1c7!G3AN9B2]sk01,(F;1,pmC
3&rlV1cR3J1ast(4>838-p014/1<V7.4cl00I\P80E                                ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
