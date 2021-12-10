NB. JOD dictionary dump: 10 Dec 2021 15:46:06
NB. Generated with JOD version; 1.0.22 - dev; 25; 10 Dec 2021 10:12:50
NB. J version: j903/j64avx2/windows/beta-v/commercial/www.jsoftware.com/2021-11-16T21:47:12/clang-13-0-0/SLEEF=1
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


DDEFESCS=:;:'{{}})'

DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC formifacetex grplit ifacesection ifc setjodliterate uwlatexfrwords wordlit'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22 - dev';25;'10 Dec 2021 10:12:50'

JODVMD=:'1.0.22 - dev';25;'10 Dec 2021 10:12:50'

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
0f:s61,g=2+?1K#2]sh1+?)/#1,0n-3?U%5+>u"u1,9t21*A;*+>u"u0fU:72]sh5+>P_q0eje,
0d&@s1,9t-0H`/.+>GYp2_cF2+>Pbr0ea_+1a"M-+>Ykt0eje-1*A;++>Yer2]sk0+>G\q1G^.2
+>kqt0esk,3$9q1+>Y\o3?U%9+>GSn1b^%,1*AD-+>t?#1a"M0+>toA6q'R6;aXJoBl[cpF<G+*
Anc-sFD5Z2+D#V(@;od#FDkr+DK?pP+E):2ATAo1@<?U&EcXWE6WHiL:/jqR;G/EUG:=YGA8--.
FCf]=+EV13E,8s)AKWQIF*)>@ARlotDBO%7BlbD/DfT\;FDi:@Eb0<'Ecu":ASkmfA7T7^+Cf>,
D.RU,F%Jhe6Ub'P;FFGuDe*ZuFCfK$FCf0(FCfK)@:NjkGAhM4F!,(5EZccFDe*ZuFCfK$FCcmD
B6%p5E(P@J:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ
+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@
6m-2]FCfK)@:Njk/Kf1WARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)
7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[Ws
DKKH1Amo1\.7nhX:IK;CDesJn<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et<)6:`;]odlFCfK)@:Njk
/Kf1WARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)7!3TcDKKH1Amo1\
C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u
+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APu<"<*)jn6rRi=A8Gt%ATD4$ATD^-F<GdG
Eb'56AoD]4-u*[2Ch\!&Eaa'$.3N8DDfp##;F+,U;FO&H=B%^kE+*WpDdsn`@8pf?+D,Y&B5M3t
F<G19Df$UF=&M=\:f9_O8Q[Da/Kf.KATME*F*)G:DJ+#5D09oA+Cf>1Eb0<2Df0)o@Wl0rC`m1q
@r$4++Eh=:F(oQ1+DtV)ATM@%ART[lD..L-@rc-hFCfM9FD,5.A8,OqBl@ltEd8dE@<6O%EZet.
Ch7-fAS,Lp@r5XqCLh."ARfg)A7]@eDJ=3,Df-\/F(8WtAKZ)5CLqB+D..L$Anc:,FDtf3Bl@O&
ATW'8DK?qBBOr<#DId='+E(j7Anc:,F<GX9DKKH-@q?d%ATDL'A7fXlE)C_$Ea`p.@:X+qF*&OH
Deip%F!,[@FD,B++E;OBFCeu*CghEsG\V/-BOu"!A8-+(CghT3:ddbq8l%htBOu"!C2[X!Blmp,
@<?']9gi`7A8Gt%ATD4$AKZ/-EcYr5DBNe)CLnVsDIal#@<?'qDe*d(FEMVA+A,Et+E)-?Eb0<7
Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QKDffZ(Ed)5=ASkjrCLh$tGAhM4F)>?+CLh@-DBO%4
G]Y'?Ec5e;GAhM4+Dbb5FDYH,CM.'sF(o9)D..I#+DN$/De*E%AoD]4CghEsGT^^<A7^""DJ*os
EcYf%De*Eu@<-F#F!+'tGAhM4+Cf>#AT2TuDe*Eq@<?(*E,Tf>+E2@>@qB_&+D58'ATD4$ARlp)
Dfp)1AKYK$A7Zm"@<?(*E,]<*A7]RcFCf\PE,Tf>+E2@>@qB_&+D58'ATD4$ARlp)Dfp)1AKYK$
A7Zm"@<?(*F`V,)@X3!*FEMVAF!+m6Ch[s4+E(j7GAhM4F!,(8Df$UFGpskXBOQ!*6qL9F6W?`^
+CehrC`mq?Eb'56Df-[GGU[cZCghEsG\1u?DfTB0F`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dS
Fa%Y1FCf]/Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@BN                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gp:3+>P&o0H`/,2`2^42BX_22`Mp72BXb42)cX41a"S70f*6IG#N6rCLo1R:-pQ_@:FCYD/X3$
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
@p_Mf6#(=KCh[uF3B:FU$>40n@WOkEF(o,P6tKsa0MXqe.VER9@WOkEF(o,P6tKsa0HbHh/KeM2
F(o,,A8-'q@rri(AS,XoBln'-DBL??Ci<d(.3N_DF*)IU%15is/e&._67sBI@<6-m+EV19FE8QI
De:+a:IHRO+D>2$A8GstB-8=8Afr46ATo7>-qYU)3A*!@+CT.u+<Y*%Dg#\@%15is/g+\=Eb/a&
+Co%qBl7X,Bl@m1/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0f!9N@kfY[F*(i2F<GL6+EV19F<G(%F(KD%$4R=O$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0
>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-Ql/N/g*51+AP6U+EVNEF(fK9+EV19FDtZ0F!,L7F*2;@Et&IO67sB4HW3F4
<$5+=5uL[1/I`$r$=m[YAhYo%3\qm>+>=63%15is/h1CBAS*VM+Ef=g+EqaEA0?)1FD)e-Bl[cp
F<G+*Anc-sFD5Z2Et&IO67r]S:-pQUD/X<#A3(hUA7T7`0JFVlF\-4`DfTCu$4R>;67sBQ:IH=A
De!3l+Co%nCgh?mFD5Z2%15is/g+mOE,ol/Bl%?'+Xefh4Y@juD/XQ=E-673$4R>[A7]@93dZ2r
+FSYI$4R>[A7]@.4Z[q:+=VIVI=2P3%16u`AS*_]3dZ2r.:Weo+FSYI$4R>[A7]@04Z[q:.:aQL
I16Mm$;No?+EV:;Dg*<r+D#S6DfQ9o:-pQUDIR$b4Z[q:.<ffNDJ+BG%13OOA79"3/g,Lf+F#"Z
+F,)XI16O*ATMs4@<6K40ea_\@:UK81(=R"$?Tj#FDtZ0F!,gV+F,([+C].oF?M6!H!W9LI=35P
3Zp1#0ea%D%16rjD*9p&H[?kaD%-h#4?P!(Eb/[$B6%EuA1'Ha.6Aq?-YII.DIb+VGpth#+FSYI
$?Tj#FDtZ0F!,=<D'13CDffZ(E[M;'%16rjD)+78+FAGXGT]'jD/X86D/X86Gp%N`%172gF*)A0
F)rHOH!t5l-Qm8ED)*4]D/XN0ATB.-$4R>YDe!X&D*9KoH[?k`4?P!-De!3l?Y=Cj@<?.&@;]U'
4*`8:-p/knDe!3l?Y=CfDIb+VGpth#+FSYI$4R>;67sC"Bk(p$F`8I>De!3l+Eh=:@LWZ]Df%9n
/g,Lf+E]:ZFY4e^+FSYI$?Tj#FDtZ0F!,:;@r6.$+Dl%61E\&]De!3l?Ys_'BOu33%13OOF(o\Y
3Zrcr+=M@T1E\.iGpsjt+=M@T1*A%hGpsjt+E\fP+FSYI$?Tj#FDtZ0F!,O<F!,0L+>jT8%17/j
F##m>+FAGX.!7-b1E\.iGpsjt+=M@b+>P&h+F,CY4!8Yu+F,)XI16O*ATMs4@<6K4F(o\N+>"^M
/g+LW%13OOCia<34ZX^4HQXbI%172gF*)A0F)rHOBl5&0F(o\C%16feCia<34Y@j4+=\LY%16WY
?[$'E3b2l1@<,pB3b2l1B5DKq@;J(f+=C]1AS*&tCi<ckCi^s5$>FBoF(o\<4!5r!/g,Eg+?L]h
+EelN+E\fP%145+I16O*ATMs4@<6K4/1r&&+=J`n+Dc+5F!)to.3N=W+>PV[$4R>ODf9<-D`p..
HQXbJ%172gF*)A0F)rHOBl5&&Df9<-D^Pu$@VfChDfe,p@VfClARTCkGs*chCgV!s@ps1:/n/X(
FDkMsA7]@,0Kh$9@W,n%F!,:;@ps1p-OgE-+=\LZ+=eR[%145+I16O*ATMs4@<6K41*C%EDeO'-
+>aN7%172gF*)A0F)rHT/g)Yt>Te*%F!,0L+>PV[$=\$o4ZX^4HQXbJ%144#+<VdL+<Yc;F*)A0
F)rHOBl5&&Ec3<7$6UH6+<VdL+F#"Z+F,(Z+F,([+F">&+FSYI$?Tj#FDtZ0F!*=_@WHB01^sd$
$:\rS?Z]sm?YjY(ARB@f?Uo$F?VPHVFE1r6DfRunH[?2/.:`kp@psFo4Y@j4%17;nDIksl+FAGX
-mC]s.4f`qF)YPuAN_Xn+Ceu"ASuT;I=2P3Bl.g3DJ=3<4Y@j=3[\TP+D>1o+DGp?@rH3uDJ(=+
$>+3s?Y4+m@kJm<D/aW8BlnVCA8a(0$6UI5ATMs4@<6K44(`;I@grcVDIb@/$?LE&ATV:"AThX&
B4X4e+Cei$CERh8DIjq<G@bkD%17N3%13OO0d'4X/g*q_%14Nn$4R>2G]75(FCeuQCi<ckCi_a#
+>5d)+?MV3DId<j+Dt_$AhkKHA7]@/+Dt_$Ai(WIDf$V6Df%6PF(o\<F(o\N+Dc+5F!+q1DeO'-
+C]A0+Co+lG@_n-B4#(fAKYMr?Y=1n@UX'qGA1r++EMa<ATV:"AThX&B4W3-ATMs4@<6K;%15OK
E+NO$ARnJQ@ps1p4ZX]=3dr253[\HHA0>>t?Z[E-Df%9Q@VfChDfd+9DJXB.F!,:;@r6.$+C].o
Eb/ZqCj@.4CgV!s@ps0r@VfCnDdR$cAS*VM+EMC<F`_SFF<G(%F))n4D/aW8BlnVCF)YPuAKYT$
DdsnZDfT3,BOtOeDg#]!De<?HDe*3LDf0Z;ATMd1-OgCl$=m[YAhYn]-RT?1%15is/g,1GAn?!*
FDi:4AS,XoBln'-DBNY2+EV19F<GC<@ps1b%16Ze+EV19FDtZ0F!*thDdmccATN!1F?MZ-0eje`
Ci<d(+=C]1AS*VM?RICHD/a<0@k9!7-OgCl$;No?+Cf(r@r!3)@;TQuCh[s4Et&IHCi<d(;Isol
Cihg$+?hN,7r3*QF&HRjF_l./$:T2YARfgnA4LHS@UX(o+>#Vs004P)4#)(9HUhmj@WPFYF*2;@
%15OKE+NO$ARnJQ@ps1p+>#Vs004P)4#)(:HUhmj@WPFYF*2;@%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG
@<6-m3B9*,%16`aDdmcdD/X3$6pr^_:-pQ_B5DKqF&QpoCLon%0JFVk/M/)UBl[cpF<G+*Anc-s
FD5Z2+=Ll=Ddmc:+EMC<CLnW1ATMs7/e&._67r]S:-pQU6tp[Q@rrh]AS,XoBln'-DBL??Ci<d(
.3N\KDeio,FCfN8F"SS-:IH=C@;TQu@;]LiH#m\@+E(j78du,&67sC)DfTB0+<Ve:Df0Z*Bl7X&
B-8<>A8-'q@rrh9+<Y3+Anc-sFD5Z2F!)SJ+EqO9C`jiC+ED%5F_Pl-%15is/g,"LA8,Xi@psIn
Df.0:$;No?%15is/g,=KEaiI!Bl,mRDIn#76pr/<F_kW1+D,P4+Dbt+@;I&pDIal&Ci<ckC`mV(
D.Rc@%15is/e&._67sB8/g*ntD.Rc2Bl5&?HQXpn/g,Rj+CT;%+Dbt+@;I'.D]j.8AKXB/+CT.u
+CT;%%15is/g)8Z+D#P8Bm*p$ASuT4FDi:>@;TRs+DG^9@ps1iARlp-DfTB0/g+)2+=Ll=Ddmc:
+Dl7BF:ARP67sB'+<Y6?@r-9uAKYDtC`mP4@ps1iGp$O:F(o9)ARloO6m-AUD.Rc2Ao_g,+E)CE
ATA4e:-pQU+<VeJ@rH<t+Dbt+@;I&pF)u&.DJ`s&FE9&W<+0QR+Cei#AKZ21ASqqa:-pQU+<VeR
HQXpn/g,Rj+DtV)ATJu2@<?!m+DtV)ATJu.DBO%7AKYo6FCfJ8F(9--AM+E!:-pQB$;No?+<VdL
:N^bjE`[1"A3Dsr1E\_$0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG/g)QVDF?lA
+DGm>Ci<flC`mh<+EV:.+@JU?@;]TuDJsV>@rH7+Bk1dqARl5W:-pQU+<Ve%67sBh+Dbt+@;I')
AfrKtF`_28=)W+i.3NhJBl%?'-uX6M:18!N.3N>G+CQC/De!3l%15is/g)8Z+E)CE:18!N4Y@k(
HQ[SV.NiGC6ps0j+>bhrI=35P/g)qm1^sde67r]S:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is
/e&._67sB9/g+/3@<6L(B5V9k+DtV)AKZ#)An?!oDI[7!+CT@7@;^?5A7]_%BHV#,+@JV=+EqO9
C`m1u+Cf>-F(o/rEb/bj$;No?+<VdLB5DKq@;I',AS,LoASu!hF!,17+=L$.FCfK:DfTA;/e&._
67r]S:-pQU+<Ve&F`_28=)W+i4ZX]B+?CW!%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z
+AP6U+=MDEEaia#6prIHBlbD=Eb/[$ARlp"Bkq9&@3B3!Ddm-k+ED%*ATD@"@q?csDBL?'F`_28
=)W+i.1HVZ67sB'+<YTFFA?7]AN_Xg+F##8+FAGj+FAGXGT\LZG%G]'Bl6=,+F,)XI3L?fGp"RZ
BeCM_0Hbdl+>jT8:-pQB$;No?+<VdLDfp.s@;TQb$;No?+<VdL.1HVZ67r]S:-pQU1G0eF@;TRs
+Dbt+@;Kb*+CT>4BkM<pA0>T(+E_XBATAo?HQXpn/g,Rj+EM%2E+O)5@<,p%DJsV>@rH7+Bk1dq
ARl5W:-pQU+<Ve>Ci<ckC`mb0An?!oDI[7!+DGF1FD,62+CT;%+ED%*ATD@"@qB0nBl5&0Dg,c5
+EM%2E+O)C%15is/e&._67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D'
:-pQB$;No?+<VdL:-pQU-tHn#E)UjeFCcmDBlbD;AS,LoASu!hA0>T(+CQC'AS#glEZfF5DfB81
FD,*#+EV:.+E)./%15is/g)8Z+AP6U+DG_;BPCsi+DGm>G@>P8Ci<flCi"A>@<6L(B5V9k/g+,,
BlbD*E,]6+ASuT4B5DKq@;I',AS,LoASu!h%15is/g)8Z+AP6U+DGm>@:OD%@;Kb*+CQC/De!3l
AKZ#)An?!oDI[5e$;No?+<VdLDfp.s@;TR=/g)9]+C61;HSQ^jHQ[Z^A7]=k;flGiAKWQIGT\IY
Gp%N`+=eRFAS#gZFCB9&4Y@k#ATD6oDF?l8Gp%N`+tt-b+=\LJ/g)l&+FSY\2%9mf67r]S:-pQU
+<VeFF`^AeD.O.`:-pQU+<VdU%15is/e&._67sB;/g*Z#Ddm-k+DtV)AKYE&F(o9)D.RU,F!,17
+@JV=/0JAC+CT/5+Dtb3FD5W*+Co&&FD*37$;No?+<VdLGA1l0+C\n)FE1r$FCeu*@<3Q(Ci<ck
C`m/-F(o9)D.RU,F!,C5+=L$.FCfK:DfTA;/e&._67r]S:-pQU+<Ve&F`_28=)W+i4ZX]B+?CW!
%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z+AP6U+=Lc3AT1Ri@<?'0+DGm>FE1r$FCeu*
Ch[Zr+CQC*Ci<ckC`m/-F(o9)D.RU,+E(j7-r4u-ATCjjEb$U.$;No?+<VdLDfp.s@;TR=/g)9]
+C61;HSQ^jHQ[PU.j/A6AT1Ri@<?'D3ZrTWEaia#6pr/C+FSY^0HbW`.NiFX+>GPmI=34q%15is
/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is/g*#(+A$/f@3BGrD.Oi(F!+n4F(o9)
ARlp"De!3lCj@.;DBNA*+E_XBATAo7@rH<t+CT.u+D5M/@UX(hGp$g=+CQB%$;No?+<VdLCi=N/
EZfF5DfB81FD,5.B5DKq@;I&pF)u&.DJ`s&F<GLFATDg*A7]g)FD,5.Ci<flC`m/(A0>T-%15is
/g)8Z+EVX8@<?'k+CT=6@3B3!Ddm-k+CT>4BkM=#ASuT4De:+?:N^bjEd)GBA901P%15is/e&._
67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL:-pQU
-tHn#E)UjeFCcmDBlbD0Ci<ckCi"A>@<6L(B5V9k+DG^9@3BB)G@be;F(9--AKZ).@;[30BOr<)
DIj7a:-pQU+<Ve%67sBpDKfc.@q[!!F!,[8F!,:;@ps1iGp$O:F(o9)ARmD9<+oue+DGm>FE1r$
FCeu*@<3Q"+D5M/@UX'q@<6L(B5VQtDKI">AfrL?F`_28GAhM4.4u&::-pQU+<VeFF`^AeD.Pj_
+<YnO?6FTA1*Cpj+FAHGAS#gZFCB9&4ZX^1+=\LZ+FSY\.j/A6AT1Ri@<?'D/g,=KEaia#6pr/C
+FSY^0HbW`.NiFX+>GPmI=34q%15is/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is
/g*&)+A$/f@3BGrD.Oi(F!+n4F(o9)ARlorCi<ckCi"A>Bl5&%DBO(@E+O&4F(9--AKYE!A0>],
@ps1iGp$g=+CQB%$;No?+<VdLCi=N/EZfF5DfB81FD,5.Ci<flC`m/-F(o9)D.RU,+DGm>FE1r$
FCeu*@3B3!Ddm-k+ED%*ATD@"@q?d$AfrKtF`_28=)W+i.4u&::-pQB$;No?+<VdL:N^bjE`[1"
A3Dsr1a"h%0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG/g)QQAS#gZFCB9&.3N>G
+D5M/@UX(hGp$O:F(o9)ARlotDBNA*+E_XBATAo7@rH<t+CT.u+Dbt+@;Kb*%15is/g)8Z+AP6U
+DG^9@3BB)G@be;F(9--AM,*)BOr<(@;TQuBlbD=Eb/[$ARlolF!+m6B5DKq@;I&pF)u&.DJ`s&
F<GL6+=L$.FCfK:DfTA;/e&._67sB'+<YTFFA?7]AN_Xg+F##8+FAGj+FAGXH[B:7AT1Ri@<?''
GT\IYGp%N`+=eRFAS#gZFCB9&4ZX^/ATD6oDF?l8Gp%N`+tt-b+=\LJ/g)l&+FSY\2%9mf67r]S
:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>G;fAnc:,F<G[:F*&O5F)uJ@E-,f4D@HqJ67sB'+>PAgF(Jj"DIal3ATMr9@<6L4D/aT2Df-!k
:-pQU+<VdL+<VdL+<W9h/hRS?:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp131,*6M@k]nP$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO:-pQUFCfN8+DG^9@r,^bEZeh"F(HJ.Afu2/BlbD/Cggs!BlbD9Eb0<'DKI"0DIal2
ATT&:D]gbD$;No?+>=p$+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$;No?+>Fuj3ZoV!-V@0&
6VKp7;GTqmBkhQs?RH9i:-pQU@r,^bEZc_W%13OO:-pQUFCfN8+DG^9FCf<.DfT9,Gp$jEDJLA2
De!3lAKWQIDJsV>@;Ka&8l%ha$;No?+EV19FE8R7@;[2sAKYr'Eb961D.R6#Bl5&.F`(t;Ci<fl
Ch7Z1F)Po,+Dl7BF<GUHDBNY2+C\c#AISuVDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@
6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?N                           ~>
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
1,(L,1,'h,+>G_r1*AA51Gg400H`+n1H@6O+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>P]+0H`)1
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
0J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0ea_<ARci<0JY@*0KD0M0KM$G$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GPm
6tKjN1,(I<+>GQ20etdI0FCEJ6rZrX9N+8X8PDNC8Q/Sa;HYb4%15is/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]
ATDj+Df.TY0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0KC7NDg!6Y0JY=)0K;*K
0KLmF%13OO%15is/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41*A.kA7]p,+@:3bCh+Y`F_tT!
E]P='+<X'\FCdKU0eskHDg!6Y0JY=)0ek^E1-.3M%13OO%15is/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+
Df.TY0eP.41,U1++Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO
1,fXL$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU1,U1LDg!6Y0JY=)0etdH1HI?J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Pes:2b:u1,(I;+>GW42)I?M1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp18
+AQiu+>PW+0H`)-3]&cV1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=
6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2BYb5Fs&Oo1,'h*1-.0I3\rMu$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,g=NDg!6Y0JY=)
0ebXD1cd?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS2BX,1@<?'A+>Pku:2b:u1,(I;+>GT31GV!K3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1:+AQiu+>PW+0H`))3\rTR1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[
ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`T$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,g=NDg!6Y0JY=)0etdD0fh!B$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp+3+@KdN
+>PW+0H`)(3\`EO1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU0f1"@ARci<0JY=)0K;*N1-.0N$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+@KdN+>PW+0H`).
3\W9L0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp.5+<X'\FCdKU0ejeLAT/bI0JY@*0etdI3'&`I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp14+AZKh+>PW+0d&2.3\rZT1c5UI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU1,0nI@rrhK0JY@*0f;!K1-.*K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp14+AZKh+>PW+0d&2.3]&ZS0f]RJ$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nI
@rrhK0JY@*0f;!K3'&`R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp14+AZKh+>PW+0d&2.3]/WQ0e`qA$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nI@rrhK0JY@*
0f;!L1-.0K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_
ATBgS1,0mo6t(1K3Zp+3+@KdN+>PW+0d&2+3\WQT0JNnA$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0JXb=ARci<0JY@*0f(jH2EE]T
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q
6t(1K3Zp+3+@KdN+>PW+0d&2-3\r`V1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0ea_<ARci<0JY@*0KD0M0KM$G$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.2
+@KdN+>PW+0d&2)3\`BN2)#A6:K(5"C2[X!Blmp,@<?'90b"Ib67u)1;cI+=De*ZuFCfK$FCcS6
Df^"CE,ol,ATMp2EZcb^/h&qE%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is/g)QWDe*Zu
FCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g++a8Q/GO:..lF+<VdL+<XEG/g+bKCht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq
.3N>:+E)-?F(f-$C`m\*FD)*j:-pQUAoD^,BkCd`ATVL.+<VdL:-pQUAoD^,@<?Q5BR+Q.EboH-
CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'5#$;No?+D5_6Ch[u6+<VdL+<VdL+AP6U
+DkP&AKYetFCf\>AoD]4B6%p5E$-QS.1HVZ67sBpAmo1\F(Jj'Bl@l3+<Ve%67sBpDKKH1Amo1\
+EM+(FD5Z2+EM[BD..I1+EMXFBl7Pm$;No?+DGFt+<VdL+<VdL+<VdL+AP6U+D,P4D..N/Bl8$(
Eb8`iAKYK$D/Ej%F<G[:G]XB%:-pQUF(KH.De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%9OUn3=<MR'
De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAISuA67sC'GAL]0AU%g-
GAhM4F!)T#67sC'DKg,0E,]B!+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,E
GB.,2+E_=5Gpa%.:-pQUGAhM4Ch[u6+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5
F<DuW.1HV5%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%14L>
+?CW!.3Kuc%172tGqKO5:-pQUF`V+:@;^?5E+*WpDdso2ATT&/DBO%7AKXT@6m-GhDe<^"AKYT'
EZfI;BlbD6@:NtbDIj7aBkAt?G@c#+@;9^k?Q_HY:f9_O78d#P6r60E6r-0WBkhQs?RHt,D_</3
84c`V5u'gD6XO8:De*ZuFCfK$FCefB3Zq6s77K^D;FNuM5u'gD6XOPBDe*2tASu$2%16f]/g)Ys
00gp5E+*WpDdt.A74p#3E+*X-ATBpd+?M9(+?V_<?SWaGCh=e<F(f-$C`l\J8Q/GO:..lF?X[\f
A8Gt%ATD4$AR?u9+>#0gATDj+Df-pO+>#2g6W,%;D_;J++<Y`BDfp/@F`\`R:/=hX3ZqjAC3=T>
+E1b,A8bs#E+*j%+DGF1@s)g4ASuT4G%G]8Bl@l3-mpQb@;^7"E\&Re+DGm>DJsV>5!:#D/ibO=
/hn^_$>"*c/e&.t@<?!m/e&.1+EMC<F`_SFF<Dr";Gp:g3ZrBMDIdZq+Du+>+EM+9+>"^EA867.
F<FOR8Q/GO:..lF?X[\fA8Gt%ATD4$AR?eo$>"*c/e&.:%16'16r./^:IITH6XO\@1,fXL+^8]"
A7TUg+EVO4D]ik1F*(\9C2[WqEa`p#Bk)3;FDk].?YXLi/oY]@.3N"j:IITH6XV$9:IItf$9^O8
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=
ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IITH6XVMU$<1\M+C\c#AKWce+@fF'
6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<62n$=Rg_+DkP4+CT5.ARTU%
Bl5&3FD,6++B2-):EXIfF*)IU%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=ASQO-E+^q@G%,&l
G@P]3@WaDB0JkaJG$dF@+@C'bF(o/rEZf(5E,ol?Bl7Q+AoDR/+EqC2B4uC.+DG^9E,oZ1FCeu*
A8bt#D.RU,F"SS7BOr;uDf0Y>F`V,)%144#+D,P4+EMIDEarZ'@rGmh+Cf>4Ch+YtAKYD(Ch\!5
Ch4_uDerrqEZcqVATMg%@qf@fCj@.FBOr;rDes?4ARlp*AU&<</e&-s$8O4V?p%e,H"_5=E]7uI
BJ_JcC2>hMF*K]ZEbAi@?Tqj?87?OUDf098AKYK$A7ZlnDes?4F!+n/A0>K&DKKqB@:O=rF)rI3
Cia]7BleB1DJ+#u+CT.u+CK.sDIdZq?m'N9DKK<3+Cf>+DfTQ0B.aW#+<VdoF`MM6DKK]?+EV:.
F(HJ5@:O(]B4Z-,F`V+:A8,XfATD@"F<G16DKKqB@;]Tu@rH1%EcWiB$4R=u/g+Oa?T)pY3Ggco
EG0YRD.,@\FEDbPBQ@s!BQ7BC?m&?YG%kN3+D>\;+EVNEAp%p+Gp$[8@V''m@;Ka&Eb/ioEb0,u
ARloqDf0Z<+DG^9E,oZ1F<FCJ7WU0k$4R>!/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@2_]AhFu<Vj
?m%gTDKBN&ATAo%A7TClB-:Sj@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+A,Et6r-0&%13OO
2(g"Z4C:!^Anl6nE->\KBkqd9B6nPPD)l\u@<H$d5%#L#Df0W1A7]d(@:Wn_DJ()#+Dtb7+CT5.
ASu$mGT_*H+CJr&A1hh3Amc`lATM@%BjtdoB-:l+G9D!G+EDUB+A,Et+EV19FE9&D$4R>M>@h\_
/TboADd?`[$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4A8`T,BleB%.!0B<DdR6tA1hh=B.4s28l%i_
+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+
@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_+CT.u+DGq=+EM[7@r,RpF(KDF%16'JAKYGj
F(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+/e&.SEc6/C
AKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/6#:U\
/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9
D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&ASuU$
A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/ATDKnCh\3,/e&-s$=I(IAS5^p/TboADd?`[
$4R=s/g+Oa?Xkp+A3"T`F`D4OE&)ZOF)3aS3HAh[A7o75?m&E[F*&O8Bl[cpF<G+*Anc-sFD5Z2
-Z^DED/`onF<GL>+A,Et/g+,,AKYl%G9CF1Eb/a&+Co%qBl7X,Bl@l3Amo1`Ch\!:+DG^98g%hc
FE2;1F^o!(+CQC1ATo8-BkMHpE+gA%H[B-C@"!H2+Co&"Bl.R+ARlp#ARTIt+E(j7A7]@eDJ=!$
+DG_0Bl7K)DJsZ8F"AGWATD7$/0JA3G%G]'F!+n/A0>B#DJF<3@ruF'DK@EQ9jqgK+EM[GAKXT@
6m,uJDBNV$DIdQp+CT)&+EV:.F(HJ3ATo8/DfT]9/e&-s$8O4V?p%dMBk:k$CjKYNA9KdgG%kf5
H8oq`CGfU9?Tqj?;e^)_Cgh@#Gp$s4CLnW0F`M%9?tsUjCh\!&Eaa'$?m'Z3Ebf_=AoD]4A8-'q
@ruF'DBNJ$Anc-sFD5Z2F"AGTAS!nF+Br5Q:IIucC2[X!Blmp,@<?'5D.I$[-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<)5nX?YXLiCh\!&
Eaa'$/o>,J/e&-s$8X:W?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?<+U,m+CJr&A8Gt%
ATD4$ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>!/g+Oa?T0o^H=_8>
BQ/9?B5r!*EcjB"3G;lAE&(ca?m&$XE,ol?AKYE!A0>H.FCf?#+CIf;6sq-R@:F:#@;]TuBl8!7
Eb-A8BOuH3Ecl7BDf-\6@<?($+A*btH#n(=D0%<P9OVCO+D>2,AKYJr@;]^hA0>T(+ED%'ASuT4
8g&:gEcYr5DK@E>$4R>"/g+Oa?XmYY20pr5Cij;KEG[[P3+HW@2_]AhFu<Vj?m%gTDKBN&ATAo%
A7TClB-:Sj@Wl-%-t-q.+C\bhCNXS=G%G]8Bl@m1.3N_N+CIf;7!*?cCi`u:+B3#gF!,X;Eag/*
F!,FBDg#i4B-;86+D>2$A9f;3F<GX<Dfol,+C\n)E+*d/+E(j7FD,5.F*(i.A79Lh+EM+9F`8rB
$4R>#/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7
@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%15$H
+CI<=2DAr*C27j0CH44bBes4@0m\+TEarj$11*4Q+B3#c+CK>6Bl%iu+Eh=:@N]&jB6%B&-t[12
A0>N*Dfp"AEc5l<F"&5BDe3u4DJsV>@;p0s@<*K4D]i_%DIdQp+A*bo@;TRs+EqOABHVG8A7]e&
@rHC!F!+jt?m'E/DfB9.Cj@WU8T&]_F*),/@<?''@;]TuAncKB+AP^3762Q!AnQ-l+DGm>DJsV>
@3BMtEc`FBAfs]A6m,r]F<G:=+Eh=:Gp$d/DIe#8GA(Q*+CfG'@<?4$B-:W#A0>_tBl8$$Bl7X&
B-8[6CghC++D5_5F`;CO/e&-s$90X\?p%e+F#.oKD)cNQ2_el[G\(o*Ao'.XDg"!O?Tqj?6Z6j`
Bk1dq+CSekBl7Q+@;[2rE,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+BQ&);Eb/ioEb0,u
ATJu.DKBN&AKYMtEb/a&+Co%qBl7X,Bl@m1+CT;%+D>2$A8Ggf/e&-s$99^]?p%dQ@U`noG&V.S
GW0_%1c'24H>GB\DD5cb?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3AreA8-+(?m'W(Eag/5BOQ!*GAhV?
A0?)7Ebce6Bkq9&?t<tmE*setF`\aIBQ&);DdmHm@ruc7Bl5&&@:O(qE-!W@$4R=s0J4JU4C;VR
A9;F!A2,odE-?&+FDbT%12pYZBQnB%5%#L#Df0W1A7]d(@;KauGA1r-+CKXO?m&m!+CQC3@<?0*
E,oN%Bm:b=DBNe)@o$#G@;]Tu9PJBeGT_'QF*(u1F"SS7BOr<"Df'&.A8-'q@ruX0Gp$U8DK]T/
FD5Z2+E)-?FD,6,AKZ&>F*(u1F!,1<+ED%7E+NO$ARlomGp$L*Bl[T6%13OO?s@2[A1_nAA8ba]
%16'16r.0)De*ZuFCfK$FCefrA26(Q$6`VgDe'u,Blmp,@<?''Ch[g*>psE)@r-:/Bl@m105>E9
Ch\!&Eaa'$Ch[g*Ch\!5Ch55<DJ(D+C2[X!Blmp,@<?'g+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZeb)De*ZuFCfK$FCei4%13OO?tsUj
Ch\!&Eaa'$?m'0)+CQBs8hWe46sV3SFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W_F+Cf4rF)rI:Ec6)>+EV:*F<GOCDg#i*ATJ:f>AS"qATD4$AKYr4DeF*!
D/F!)B3cp!FEDI_0/%-UFCfK$FCfE3DeF*!D/F!)B.d\4D(fU@A7^!<BQS*-.3N\SE,]`9F:ARh
DfQsm+Cf>#AKZ&9DfTE"+DG^98l%htA8,OqBl@ltEbT*+/e&-s$<1\QF!,"3@s)X"DKI"CEa`Hn
F!,F5DIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$<1\M+C\c#
AKWce+Cei$AKY])F(K61Bln'4AKXKC8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.
AftM)FCB6+/g*`-+E_R9EHPi/Gmt*s@:EeaF!,%&@q[!,@<63,@;]TuD..3kF!,1=+E27?F(o*"
AKYK$D/a3*AKYMpFCAm"ARlonBOPdkAKYZ#F*)>@Bk;>p$=\9'FE2;9Ch[d"+E)F7EZfI;AKZ/-
EcYr5DBNV,F*)>@Gp%$;+EV:2F!,(/Ch54.$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dRGr9DI
2.q)HB6JS[G]n1P11Dq[1GCL=?Tqj?;It#cF(HJ&DIal3ATMr9AoD]4A8-'q@rri(AS,XoBln'-
DD!&(+?;&.1*C:KFE2;1F^nun+Co2,ARfg)A7]@eDJ=3,Df0V*$6UH6FD,*)+CT;%+Co&"Bl.R+
ARlomGp$LAHXIt(I=5KU+B3#c+Co2!Ea`p#F!+n3AKYE!+D#e-AT2a*Df-\>D]hY"Et&I!+<YB9
Ao)$gFD5Z2+EM%+ASl!$@;]TuGA1l0+ED18E,9).FD,]5F_>A1@;Ka&8g%V^A7Zm&@<-F'DJ()6
Df9H5+DG_'Cis9&DJ'Cc+<Ve7C2[X!Blmp,@<?'g/e&-s$8O4V?p%dT1NmDPEAVepH$;&QD/FE0
0f<HOARTn,?Tqj?8T&]_F*),/@<?''GA)7EF`(`$EaiHt+Cf(nEa`I"ATDi7+CJPa+DG^98l%ht
B6%p5E$0%,D.Rc2@WH$gCEQ;Z<+T/SE,ol,ATMp,DJ(RE7W3;iDJs_AC3=T>%144#+CoD.-ZgJR
F(HJ:DId=!@UX:"@q]:k@:OCjEcW@;DBNS4Dfp"ADIIBnF"Rn/%14mD+CI<=2KW\DG\Jrf3-/nL
1H.(+@;^(.AN+$W@:)3++@C'aD.RU,F!,[@FD,T8F<Gd@Blmp-E+*6f/0JLVB.b<7:-pRND]j+?
@:NjkAS>ab+DkP4+Du+>+Cf>+DfQt>Ec5o.Ebp"R+B<JoEZeab67sC%E+*6f+E2..@<6!f/e&-s
$8a@X?p%e*203tOF_Z)1Gr0_fH$4:CGAB&m1M1-5?Tqj?;gE8&@<`o)Des?4Bl7Q+De:,9Ea`p+
ARlomDg5i(+D>>.ATD^%ASuF/F!+n3Eaa67+DkP4+Du+>+C\n)@rHC.ARfg7%144#+F\cg%144#
+<VdL-ZO9IFCeu*F*)G:DJ(=>4!5q9+>PVn1,'t.0JFpu4!6UG-ZO9IFCeu*F*)G:DJ+#5GA2/4
+Du==ATDKpF!hD(+<VeUIXV_5%14sF+CI<=ChPP?D_X.m13.LnBl,\DFuM-jDg,Z6?Tqj?;e^)_
Cgh@#Gq:(^Ea`p+Bl7Q+DJsE1Dfor=+EqOABHV,0DJ()'D.7'eA7]9oEHQ2AARlp)FE2)5B6,24
@<iu5Dfd+3Des?4+E2@>E+O'+GrcBA+<VeUIXV_5+<VdL+<XEG/g*_a6;B*e1E^1@ARfLsF_qQp
+<VdL+<VdL+C@)^+C/4pA8-+(+=CkX1LjrC%144#+<VdLBe_DRA3Dt$0KD*O2Dm<I1,1IC3&``Q
1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1c$mA0KD*O2Dm<I
1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I
1,1Hl$6UH6+<Vde3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1IC3&``Q1c$mA
0KD*O2Dm<I1,1IC3&``Q1c$mA0KD*O2Dm<I1,1Hl$6UH6+<Vde3&``Q1aaDm+FYFf+>Y,p+>Y,p
+>Y,p+>Y,p+>Y,p+>Y,j0-Dks+=Ait1,CaE2E*TU-Qm+U+C,E`+<VeUIXV_5+<Ve%:K0bD+A?]k
B-;#)DIml3@<,p%GB.,2E+NQ&@V'.iEb-A+DeX*%+EVNEE+*WpDdtCB<+oue+Ceht+DbUtA0>u4
+E1b,A8bre$6UH6@<6L(B5VF$B-:o+@:NeiEaa'$+EVO;ASuQ3FD,*)+CehtDJsV>@V$Z3ARTXo
Cj@KQE+*iuBOt]s@:jUmEd(r4A90@G7VR)V$6UH6FD,6,AKY])Ao_I&F_,H4+E(_(ARfh'+EqOA
BHV/#DKTB(+A?3CAQU'dA8-.,3ZrKTAKYB'GAL]0AU%g-GAhM4F'pU0$4R>M>@h\_/TboADd?`[
$=\-lCh.:!A8G[rAU#sb:-pQ_@WcC$A86$nCghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*m
Ch[NqFCeu*8l%htF)Q2A@q?cV@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.
+E2IF+Co1rFD5Z2@<-W@F!,"3@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7
Eb0-1+Eh=:F(oQ1F!,C5+E1b,A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL
+<VdL@q]F`CERM5F`&<M<(KSZ:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is
/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB90Pt6D0JXbkAThd/ARlo3H?smPDe*]nBl7:"AU#X5$;No?+>PWf@<jR_+=MP^H>7A/
D..-r/n/72.3N&0A7]9\$;No?+>PWf@<jR`+=JpRCh7$mFCf\J@UX@-+CSekARl5W:-pQU1,*QR
Gqh9$A8-+(CghT3@WcC$A0>>iF<G16Ec#6,FCeu*FDi:BF`%Wq:-pQU1,*TaFttot@:Wn[A0<:8
De*3nG%kN3?Z]k(.1HUn$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA8Gt%ATD4$AL@oo
@rGjn@<6K4FDYu5De!-?5s]7(A8G[rAU$3q3F<ml3Zoe95s]7(A8G[rAU$3q3@>qR+Cf>$Eaa$#
+?V#;5s]7(A8G[rAU$3q3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$
AL@oo%15is/g+b;FCSu,+C]J-Ch+Z2FD5Q*FCfM9@;]Tu8l%htBl8$(Eb8`iAKYf'F*)I4$?U-(
Ci<f+B4Z0-4$"a0ART*lGB.D>AKYGnAoD^$F*)FF@q]:gB4Z.+EZdtM6rm#M+A$lO:IJo7FCfK)
@:NkI<'a8I5uL)n8U=!)7!*?cCi`NS5u'g6;FDX!H:gt$F`_>8FCfK)@:NkI<'a8I5uL)u%13OO
:-pQU@s)g4ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^
@N\ktA8bp?3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,
@<?''A8bre$4R>_Df9`>AU$@!+=DJ]H>7A/D..-r-OgCl$;No?+=DJ]H7'hP@;BFq+EV:2F!,(/
EcZ=FDf-\<AThX*F(HJ)Bl[cpFDl2F+D,>(AKYl!D.Oi2DfTr@%14J'@j#l)GUGX8+AG-h;GUY.
C2[Wi+D58-+EDC=FED)=/14eHAU#R3$?Tj(4ZX]IHTE^"AU"XkFCf\[3Zogu0-bpp,BdX=F(oQ1
,CY(d0./;40RHDf6rm#M.3N,6@;]^hF*)FFFCf\+$7L"78g&4eGUXbZEbTW,+CoD#/95ZIFED)=
/13&lAU#R3$4R>;67sBmATVEq+E)F7Ecu/.G9C^1FCf\>@;]Tu@r,^bEZf(6FCfK)@:NjkFCf]=
%14J'@j#]5FCf\E4ZX][5snOG?X[\fA7$HlATT%BC2[WiDg#i+G@,H'GUEq-BkCd`ATV?n4ZX]5
4=_q0C2[WsAmo1\Hn?p6-OgE$G'%;?4ZX]6BkCd`ATV?n+C\noDfTE1FE/KcHTE]rG'%;?.4f1F
@:Nkj@:p#V%15is/g+SAE+Not+CfP7Eb0-1+DG_8ATDBk@q?d(ARfgrDf-!kC1^maAN`'s004P)
IP+3<8l%ihDKKH1Amo1\;cH%X6pX^=/4k.[:IK;CDesJn<'a8I5uL*%8U=!)7!3TcDKKH1Amo1\
;cH%X6pX^=%17#sFCf\[3Zr?aFCf\J-o*#@7O]l:AoD^,BkCd`ATVL.+DPLs@q@)?1*]I^%14M*
Db;-jG'%;?.3NhTBlmo/A8bs/-[L)RDe*d0Bk;K@FCf\E%13OO:-pQU8l%ht@r,RpF(KD%$>O'e
4ZX]I3[\Z\A8c?.C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5-OgE!
FEfr0+D5_5F`;/*FCf\D/j:Cm@r)S]%15is/g,4HF<G:8FCfK)@:NjkBR+Q.EcP`'+EV%4B4Z1+
%16onGWe)1C1^maAL;J0FD5>q@qBajEbBG?/j:CoFEe6%%15is/g,:XAKW@HH7'hSEb/isGT_*H
+CTG3Bk/>rCghBuATJu<Bln#2-YdR1-Qk#o04]!2F_t]-F<G10Ch7Ys$?Tj(Anc'mF$2Q,-p2$Y
@jrNO-8%J)-p/l'H7(-a/1)u5+DPD&+=nil4s2s8/p(ZL-Qij*CijnEGB.D>AL9#n+EV1>Anc'm
Et&Hc$;No?+D5_5F`8I4F_PZ&+C\c$@q[!+@rc:&F<E.XCghEsGT_-NBl%i5FD,*)+Cf>,E+s-"
+D58'ATD4$ARloqBl%@%%16id@WcC$A9;C-4Y@j*-SKonIV3\>F`;dSIP3'"Ec5l<FCf\G+Cf(n
DJ*O%FE/Kr9L;`N9LMiK=:GTcFDj]G;cFlSCgqO$Ch.X!GUXbZEbTW,+DP_%F_PZ&@UX@A/g+\C
@k;Y=Dfg)4GUt3p@UX@+%17/nDfp/@F`\`RF(f-$C`k)Q-S-ZV@W?O/FCfT7+DP_%F_PZ&@UX@-
/12em-Ql/N/g*tY7Nc2ZD/a3*AKYGjF:AQd$;No?+D>2$A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1
Dg#]5+EV1>05P'=AU#>>ASlB/Anc'mEt&I(Eap50G'#)p3Zq-_6W-]e@;9^k?Q`umF<Dr@Ch7$m
FCf](@UX@+%14M*Db*Z&<$48L3\5/lF=A>VEbTW,+CoD#/13,*@r,^bDKKH7/n/72-OgCl$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?6<Bl%<pDe*ZuFCfK$
FCf8sFCf\P0ht%f.UmO7Ch.:!A8Gt%ATD4$ASbdsAU#>=/M/(fB4YslEaa'$F!,OLDKK<3+D>J%
BP_BqBQRfr+DPh*Ch\!&Eaa'$+EMIDEarZ'9OUn3==t$i:-pQB$;No?+@^']ATJu&Eb-A;EbTW;
ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^D@De!p,ASuT4A8-'q@ruX0GqKO5:-pQB$;No?+CT>4
F_t]23ZqpTEcP`/F<Ga<EcYr5DK?q=Afu&$DIdZq+=M2;DIdZq+>PQ0/hnt5+E)9CCghEsE[_G)
:-pQU+<VdL+<VdL+Cf(r@r!3)Dfoq?-r``/;c#bT6r-0!%15is/e&._67sBUD]iV3Ec5t@@q]F`
CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,*QRGqgu^$;No?+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,*QRGqh&sF(fK9+E).6Gp"MM
De*ZuFCfK$FCd(6@<<q-$;No?+>PWf@<jRe+Co2-E,8s.+C]J-Ch+Yt@<<W(DfT]'FED))+EVNE
Ecl7/$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+<VdSC2[X!Blmp,@<?'.%16T`@r,RpF!,RA
E,9H&?U6tDC2[X!@<?(*3B9*,+?_b.-UC$aC2[X!@<?(*3B9)I+BosuDe3rtF(HIV-UC$aC2[X!
@<?(*3B9)I%16T`Bl8!'Ec`EH-Y[=6A1%fn@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.%13OO:-pQU
@s)g4ASuT4E-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0Gmt*kDdtpk+@K!m?XI>^@N\kt
A8bp?3Zrc1HS.]_5u^B^?W0p2?V4*^DdmGj$7AGaBPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''
A8bre$4R>TEc>o)D.Pjk+=CoBA8Gt%ATD4$AL@oo%15is/g+e<DImisFCcS-Ec6)>+DbJ.AU"Xk
C2@NoDEU$'B6%s-BlkJ1Ec>o)D.O.`-ZW]N+DP_5Df9_?C2A!+FDPM2C2@g3Bk;K2C2@BuA7Zlu
CgqO$Ch.!`F=044+DP_*ASqqa%15is/g+h9DIe#8@UX@gBHVA+EbTK7+EV:*F<GU8D/XT/F!,R9
GV<lAFCf\>FCf<.+D,>(ATJ:f-ZW]O+Du@E-TsL59gM-E:L@OFDe*2tB4Z0--Y$t(@;^0uG[Fog
F=.M).!0Au:K(484*s">DK^+N+Eqj?FCcS*Ddt=G0JI!QARTIuAU#h:@<<k+$4R>;67sBu@;TRl
ATMo8G%G]'%14L>+?CW!.3NY@0H_ht+ECsH%16f]/g)l#3dDiYD_;J++<Y`BDfp/@F`\`RF(f-$
C`k)Q-S-ZV@W?O/FCfT7+DP_%F_PZ&@UX@-/12em-Ql/N/g*tY7Nc2ZD/a3*AKYGjF:ARgCia/?
%144#F)>i<FDuAE+=BTU;GU1O+D58'ATD4$Bl7Q+9OUn3=<K1Z+=B6`Ec>o)D.O.`ASu$2+<V+#
.1HUn$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]7(A8G[rAU$3q3F?<.Amogu
FB*BnEbf63F##UJ67sC'F(KB-AU/>L@qK?_$;No?%15is/g+)(AKZ22CM=o1@:s-oGB\6`C3+<*
FE_/6AM.J2D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'3Zr*XFDs8o
05>QHAor6*Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2AM81IATDQt
H#kTJE,Z6n:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U@:UK.IUQbt
Df0VLB45XgF"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9@<-WT@WHC2
F(J]n?RKN/FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*bF('*7-OgDX
67r]S:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm2BiS;:-pQU
,"=L8%15is/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#.n2HA%13OO
:-pQU87c[ZGpdYU,%>\:F=hWJCj@3I3A*!@+EqaECLM7%F`(`2%15is/g*.t3\i]<-o!.n>9GpL
3\iW:-Y-\,F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK+Z_A;+=ANa+=nW`
-mO0`><3lj3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDX67sB@+Z_A=>qoPD+Z_A;-Y-\,F`&HY
><*if1-&Vf/1;]'3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=2C'sc$4R>31-73P;Is]RCLnVU
F`MM6DKIrf:.\/V+ED%1@;BEs@s)g4ASuT;%15IEEbm6q1-73P;e:%n6ZmEiASuTO-Vd6-:`sgj
F<G(9EcP`/F=.M)6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;Isij
Bl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?.
/0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9$
+Z_A=>qoPD+Z_A;-Y-\,F`&HY><*if1-&Vf/1;]'3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=
2C'sc$:Zp80fr?GF*&O'D/X3$4"!cp9i)sRD/X3$+EV19F=.M);eTlWF=Tg=4#&frATMr96=FqL
@ll&58PN#(@UX=l@j#l)F*&dCBleB7Ed;D<A26(N$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@
GmZ\t4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs,Z,9nEU0eP.41,9t(+=MGJE%),$+=\KV?t!Mf
?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^WARuulC2[W8E+EQg$47n*+<Y'7F(JlkH!hb=
@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1FE9&W$47n*+<X'd
Eb/a&+CKPC?m%'S/g+PMI:+1.AS,XoBln'-DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg
+<V!u,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2
+@:!bCEQ&VBln'-DCGo"+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-
FCB9*Df-\>Df9G7F`:l"FCeu6+EM+*3XQ3:+<Ve2<HDklB-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]
A8Gt%ATD4$AM.\9H#@(?$47n*+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX
@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?$6UH6
+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3De:,6BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ
+Eq73F<G[D+EM[EE,Tc=$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#B-:V*
@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEsa$4+<Y`:@<,jk+F.mJEZf1:@ps0r6#C%V
Df-\0DfQt.8Q.rN/MT%B+?;A@/N>UF1c[<G0ekUpDfQsdD..a/DBM5D8PUCDAU,D+681An1.sr.
:./Is$6pc?+>GK&/hnJ#+AH9b@qZu?3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!2
$6Uf@?tsUj@s)6l/nng6?m&lqA0>8pDe*@#@V%02DJ*?cA7T7^/d`^D+<V"6+<VeJAS!nF?tsXh
FD)dEIP5,?A8c@,05"j6ATD3q05>E905>E9A8bs*?j[5`+<Ve,F(Js+C`m>.EZfF7FED57B-9uK
+DG>(DK?qBBOQ!*@WGmpA0=K?6m-#SEb/a&DfTQ'F"Re,+=\KV.!&sA@WcC$A7TCpF"&5KDe*Qo
Bk:ftFDi:3Eb/[$AKYDtC`mh5AKYMtEb/a&DfTQ'Esa$4+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1
-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#Bk;>m+<VdLF(KH8Bl7Q+F`8I@ATo86
@:NtbDIml3AoD]4@WcC$A8,po+A,Et+CSekDf0VK+:8Gu.NfjA@:WnbDdd0t@rc:&F>7/GDJs_A
Bl8!7Eb0;7F(96)E--.D@:Wn[A0>u4+CKY.Df00$B3]M"@<-I4E%Yj>F'o=t+<Ve?@<Q3)?nQ/.
F'p,%G][M7F(oQ1F"SRB$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0
ATVK+;IsZU@<6!/$47n*+CJYkATV<&Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2
F!+n%A8-."Df-\+ChsG$+<VeGCgh4!ARloU:IH=;ART\'Eb0;7@<,p%@rH4'Ch7^"/g*W(Df$V7
Dg*=BDBMPI6jb%Z+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)
FD5Z2F"ReB+<Ve*FCAWmCh\!:+DGm>DJs_AFD,5.B5_3p/d_q..Nhr'@V97o?m&'aE-ZP:EZe%a
@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"Df9E4
03*(-DJ(7N0M5,/,r./@@:O(qE$[7n7qHcpBlJ?8@OVWk+=\LTDf'&.D.-ppDf[%0DIal3ATMs7
+CSeqF`VY9A0>u4+EM[EE,Tc=+>Gi!3]%shBOPdkATKI2$6Uf@DIn#7?t*b[FC655ATMr9@psFi
F!,17+A,Et+EMIDEarZ'A8,OqBl@ltEbT*+/d_q1,9n<b/ibOE3B836+@1-_F`VXI1-$m.1,(FC
$47n*+E1b2@q[!*ASbpdF(HJ+Bm=31+EMX5EccGC+D,%rCisc0+D,P4+A*b:/hf"&@V'Xi/SH88
DIal!AU/33A1e2r+=\LA9gMlV5tsdU+DG_'Eb/[#ARlp*D]gbi3$;gRDf$UT0J4JIBPDN1E+*cq
D.Rg#EZek1DKKo;Ci^_@BOr<'@<cL'F_qI.+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"
+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D$6UH6+Eh10F_,V:@V'Y*AS#a%0d'nBA0<Wb
2(f4C+=\KV?ug*l/0J>@FECn5@:X+qF*(u(+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpC
$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps(-+=\LAEd2Y5
+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg$47n*+Br5oG]R788p,)uFCfJ89OVC9-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA8Z=-AR]RrCND./F(oN),r./H
:IHKa0N)IpF_kK,,r./CG]7\7F)u&6DK@FEE-Z>1.1-D).Nh?+E-ZP:EZf7<FCep"DegJ=ATDj+
Df0V=De:+a:IH=A@:F:#F(JoD$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%G',9nEU0J5@<3B8u?/Kdi!
FDkW"EZd(n/0H]%0fTLI+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg$47n*+CJc&
?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMcn+=\KV@q]:gB4YTr?u0I`
/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s$47n*+CIW+6VgHU:J=2b+EM+9
+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551
G\(8*ARoLsDfRH;$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3
A7]g)@:Wn[A1eujCht4d:IH=B@:O=r$6UH6+EV1>F<G:=+EMXCEb/c(@<3Q#H$!V=/g+,,AKYK$
A7ZltF!+m6CggdaCb?i%F=2,PF`V,+F_i1BD]iJ-E,9e,+<VdLFD,5.CggdaCi^_-F!+j_;aXGS
:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT=$6pc?+>>E%/ibpL
+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1-D).Ni/1A7]9o?qj3p779pP78dM9
DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2"$6Uf@Anc:,
F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5
Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/d_q1,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*
3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?7$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9
<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu3+<Ve'EbTH4+EVNEFD,B0+ED%0ARTXk+ED%0@<?4,
AKZ#3Dfd+6DerrqEcW@IATD?)AU&0&DId<h$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&
FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl48#+<Y'5@rc:&FE:h4Ch[cuF!,:5CLoO6+<VdL
+<VdL$4.#<AQWPb=)`D$C`jif3\OKSATDiFC2[d'1,(C905>E904]!2F"_TEEbTK702uLbAo^sl
G\q7LBkh\r+<VdL+<VdL$6UH6:2b>!?tsXhFD,&).V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>
+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%#+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@$6UH6+<VdL+:8D]
<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A$4."G+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);
?uoguBlJ08?m',kDIdQpF!+n%A8c@,/d`^D+<VdL+<V!t$#j^!F<D\KIUQbtDf0VLB6%F"BPCst
05t`GF>%TLDfdUGC3'_)+:95@+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5
DK?q>EbTH4+EVNE8g$)G0K1+_Eb,S#+<YQ?G9CgA+Dbb(AKZ&:E,]`9F=mn-+=\LADIIBn@psJ#
?m&rm@;]^hA0>u4+D,>4+DG_(Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=/d`^.+<VdL+<VdL
:-pQU-td@7@WNt@G@>P8AmoCiBl7Q+Df-\@ATD7$+Dbb-AKZ).BlbC(+<VdL+<VdL:-pQU/Kf.K
ATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/dVgk+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=4ZX]B+?CW!$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=-F+<VdL+<VdTAp&!$.6T^7
>9GF=0H_hf>m_\s+<VdL+<W*?#mgq].Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D
@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhL/+<YTGATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2
/g+,,AKYT'Ci"$6Bl7Q+Ch76nFD5T#FCcRe+E1b2FCfK1+:956+DGm>F`V,)+DG^9@3BH1D.7's
+E(j78l%htGAhM4F"ReB+<V"6+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn
3[m3Q$6UH6+<VdL+AP6U+=Lc<.3N&<E+NHuF!,RC+C\n)@W-@%+Dbt+@;I&pDIal&Ci<ckC^M:-
+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:'r*d+<VdL+<W(CDCI_0+Cno&$4."G+<Ve+
BOr<*Eb0E.Dfp+D@q]:gB4W2sG]7SBARlp*BPDN1Ble?<AKY])+A,Et+Cf>#AM,*$G%G]7Bk1ct
@rH4$ASuU2$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@
+:/>]+<VdL+<VdL+<V"9,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKFH+=\LAATV<&@:X+q
F*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%h^+<VdLBl5&$C1D1"
F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'o=t+<VeKD]j+4AKYZ)
G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:8Gu+<VdL+<Ve%67sB[AU&;>ARoLs
DfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhK
ASlJq+<VdL+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7
E,96"A0>K&EZccF@rH7+Deru9AU%c8$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIK
Ec5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H$47n*+<Y',De(J>A7f3l
F`:l"FCeu8$48"&,9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALRrn+=\LAATV<&
@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_++<VeFE+Np.
+DG^9?u]pqA7]-kARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)F`:l"FCeti+<VeKD]j+D
E,]`9F<G[=BlbD/ART\'Eb-j1+<Vd6+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAI9P&+<VdL+<Y6+
+=DAOEb'&rD.P(%+<Vd6$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9:F+=\LADe*5uEb/Zi
C3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vc+<VdLD..]4
DJsV>@;L-rH#k*>G\(B-FCd'3$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5-RT6D+<VdL+<Ve%67sBQ
:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,O^+<VdL+<Ve%67sC$AT;j,Eb-@@
B4YslEa`c;C2[W1$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=AND+<VdL+<VdLEb/lo
+=D;RBl%i<4""N!05>E906MANCi_6W$6UH6+<VdL+<VdL+<VdL/hSb/$48"&,9SZm3A*<O2'=In
6$6g_F*&Nb/0H]%0f9:F+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*
?tsUj/oY?5?m''"EZen(FCAm"F"Re,+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-
F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/d_q..Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i
?nMcn+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'
AT;j,Eb-@@B4YslEa`c;C2[W1?nMcn,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?$6UGu+=\L"
+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0
+E2@4F(K62$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'
Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4
@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EXEp3+EqaEA9/l8BOQ!*Ecl7B
B4YslEa`c,F(96)E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+
$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g
+E_X6@<?'k+EVN/+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:8Gu.NiY=F)Pl+FCcS&85r;W?m&uu
@s)X"DKI"8DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfB$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,
Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/d_q..Ni,1A7-NtDg*=;@;]UlATJtB
DIIBn/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:8Gu+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-
4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?d+<VdL+<VdLARlp$@rr%b+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,m+<VdL+<VdL-ZW]>DI[c94ZX]@
+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OLt=+<VdL+<Y6++Dt\2$47mu
+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBlj\)+<VdL+<VdSEap50@rs(]3Zp7%
@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8]8+<VdL+<VdLARlp$@rr%b+<VdL
+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBlj\)+<VdL+<VdS
Eap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@g-+<VdL+<Ve<A0>c"F:&?^,9nEU0J5@<3B&`:
/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1-D).Nh#"DImHhFD5o0+E)4@
Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN/+<VeJF`;;<
Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--..
+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5
@q]:gB4VDm+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.+EM%5BlJ/:BlbD;F`&`QBlkJ<
ATMF)Esa$4+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;s
Bk)7!Df0!(GmYZ:+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V!u+<VdL
+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1@;Tt)$6UH6+<VdL+=D2>+EqpK-TsL5
0Ha^W1a$FBF<Gua+ED%:D]gDT$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7
-RT6.+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs
+DG^9FD,5.Anc:,F<GUBG9C=3A-sG%+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MI
F=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(m$6UH6+<VdL+AP6U+E_X6@<?''
E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(f4+<VdL+<Vd\+C?i[+E2IF+EqpK+:956+<VdL+<WE^
?SOA[E-67FB682;+:956+<VdL+<V"6.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=
?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b$+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm
5tOg;7n$f.AU%p1FE8R5DIal(F!,O8F<G[D+CHp3+:956+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(
ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.$6UH6G%#30AKY].+CHm2
/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0$6UH6DJsV>
AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCu8=+<XWsBlbD,
@;[2sAKYJr@;]^hA0>?,+ED%'Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#e!
+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5
?j\#!+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-
+:956+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M$6UH6$6UH6+<VdL+CoG4ATT%B-Ql/N
/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)$47mu+<VdL+<XEG/g+S5A0>u.
D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O$47mu+<VdL
+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)$6UH6+<VdL+DkP&
AKW?J$47n*+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW
6q(!]/d`^D+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#
Eb/c($6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j
+D,P.A7]d6$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6s
BkMR/ARlokC2dU'BODrpDerrqEXEp3+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C
@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"ReB+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0
@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3
FD,B0+Eh=:F(oQ1/g)8D$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7
Ea`frFCfJ8F(KH8Bl7R)$47mu+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/
ARloqDerrqEXEp3+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F$47mu+<VdL
+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cg+<VdL
+<VdLD/=89-YdR1B6%p5E,K*$AL@fl+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5
?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8$47n*+CK87AU%T*@;]Tu
?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"
F*D2??j\#!+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A?j[5`.Nh)sA7Zlq
DfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^h
F!,RC+A,Et/d_q1,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7ZATAn^B4i>UA8-."Df.!2
$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<:$6Uf@
9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.@N]/o@;]^hF"Re,,9nEU0J5@<
3B&'4+AH9b@qZu?1+XP'0JPEl$6Uf@?uBP"A7-NiBOPdkARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2
BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;A>+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;
E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A-sG%+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@
@<?+"Ec#kM$47n*+A,Et+C]J-Ch.T0D/Ws!Anbge+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$M
H#n(=D0%<:$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$
AT23uA9/l3DBL_j+C]&,$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.$47n*+CJ/[F*'fa
@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,d
+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1
D.R?g@X3',F"SRB+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(
F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n0+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9GA1qR05>E9FCfN8/no'A.1-D).NhW#G%l#3
Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56$47n*+@^9i+Dl%;AKYMpFCAm"F!,O8
AKZ).AKYGuDeC23Df^"-+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*
ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTe
+<Vd6,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f04E+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%
DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@$6UH6+<VdL+:956+<VdL+<W%>FD,B0
+DGm>Deg^`3Zoq\/RU%N$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH'd+<VdLFD,B0+C]J++ED%7
F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Re,,9nEU0J5@<3A_j1+A-coAKW]a
/0H]%0f04E+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Re,,9nEU0J5@<
3AVd0+AQiuASkmfEZd+m/0H]%0f'.D+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/
EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"ReB+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;
Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB*ob(+<WEs2'?CB@<,ddFCfK6/g(K.
,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?j$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6Df'H.
+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_%+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"
F)YPtAKYE!A0>o(A9DBnEsa$4+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu
/g+,,BlbD;AT2[$F(K62@<?4%D@.L/+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=
F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7\+,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1C=I3
.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$
F^ct5Df%-V/d`^D+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUEAT2R/Bln96Bk;?H
$6UH6+:956+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$
F!,R<AKYT!Ch7Yp+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q
@ruX0Gp$L0De*QsF'p*t+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#+A,Et+Cf4rF)rI9Bl%@%
/g)99BOr<-FCB&t@<,lc+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;$6UH6+<VdL
+:956+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*
+CT)&$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(Bl%@%+Dtb%A7]9oFDi:2F_PZ&
+EV:.$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/d`^D+<VdL+:95@+AR&rATD^3F!+(N6m,]X
DfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN
$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:956+:95@+CJ`!F(KH$+C]J++D,>4ARmD9
8TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EXEp3+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(
Bk;?<+@KpRFD5Z2@<-'nF!(f4+<YNDF*&O6AKY])+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:g
B4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(KD+<VdL+<Vd6+<VdL+<VdLA8lU$F<Dr/76s=C;FshV
-Qia=+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?$6UH6+<VdL+:95@+D,>4ARlp#Ble?0DJ()".!R:&
.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>h+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1
BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:956+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0
@s)X"DKKqBC3=T>+Dbb-AKV=&+<Y&I+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,
ASuU2/g(K.+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AI9P&+EMXF
Bl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AI9P&+Co2-FE2))F`_2*
+A,Et+Co1rFD5Z2@<-'nF#kFbARuulA8-+(+=D&>@jbY:$6UH6<+ohcFCf<.CghEs+EMXFBl7R)
+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:956+CT.u+CKPF;ac(_?m''"EZcKHBln0&
/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!]8
+<Vd6+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>$6UH6@3B&n@<,ddFCfJ8
Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq,+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6
?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.*LB+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,
ATMp(A1f!(BOqMn+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5$6UH6Eb03+
@:NkcASuT4E+*I$F"ReB$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.D&
+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r
+D#(tF<G7.CiEs+Esa$4+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:8H#,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<$47n*
+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-$6UH6
@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"N+<Ve=DfQt2ATV?pCi]pj
+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD#+<Vd6+=\LA2'?FDF)W6L-X\'7
Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/d`^.+=\KV
D/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK$6TZu.NhZ3@<-I(DJ()6BOr<*Ec5H!
F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!.+<VeKAU&;>FDi:+D..I#A8c[0>psB.
FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]$6UH6Bl7EsF_#3(B-;;0
BlbD-De!p,ASuTB>@'$i$48"&,9SZm3A*9F+>"^.F_l=G0et:&1,(F<$47n*+Co1rFD5Z2@<-W9
A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB/hSMZ$6UH6@;]Tu?o9'>
ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&(+<Ve@F!+t2
DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?j\#!
+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqMn
+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPF$6Uf@G%G`:BkM-gC`m,3?m'9(
@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.*LB+B)'0:I@EA7:1@J/0K"P
E-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqMn+<Y65A0>f&+CoV3
E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8Dfp(CGAhM4Esa$4+DG^9FD,5.H6@$B
@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?j\#!+CT.u+CK8(Dg-//
F)t]7?XPJn$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.
FCfJ"+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)
DfQs-+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.
;FNl>:JOSd?j\#!+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22
A0>i"FD)e2D@.L/+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,
BlbD*Ci"$6F!(f4+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd
+CoD7DBNh.FE_YDCENs,+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4
+D>2,AKYMtAnGUpASuT4$6UH6@:NeYF)rIC@<?1(/g)8D+<Vd6+=\L%78QEJ6rP4LARfgrDf0V=
@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R$6TZu.Ni,6De(J>A7f3l
-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8$48"&,9SZm3A*6J+>"^.F`(b51,^[+
1,(F<$47n*+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5
D@.L/+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF$47mu+<VdL+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:'-5+:95@+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7
BleB:Bju4,ARlolF!+lu+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[Wn
De!p,ASuTt$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl,j
+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.$6UH6Df0B*DIjr6
ATDj+Df-\9AftJrDe(J>A7f4%+:956+:95@+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(KD
$6Uf@Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7LC7F+=\LM
@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Esa#s+=\LM@:C?eC2[X%
Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/
+E2@>C1Ums+DkP)@:s.l/g(KD+:9><,9SZm3A*65/KdYoDBLYl/0H]%0ej"B+=\LAC2[WpDfTW$
+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h$6UH6Bl5&1@;0U%
8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh3q\
,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0a\71.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6
F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA$6TZu+<VdL+<Vda+D58-+=ANZ$6UH6+<VdL+>k9\
F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qia',9nEU0J5@<2BXRo6tKjN0et:&1,(F;$47n*
+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?j\#!+@T+*
/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@lt
Ed8!7+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%$6UH6
@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.F(o`7Ed98[$6UH6;e9M_>?#9I
+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/d`^D
+:95@+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20
@X0('+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+
G]Y'HAdTY'+CT.1AU&01Bk(k!+EqaEA1e33+<V"9,9n<b/ibOA+>"^(ARci>/0H]%0ej"B+=\LG
Bm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsG$+<Y64E--@JA8,Oq
Bl@ltEbT*++D,%rCh7-"FDi:=@;BF,$6UH6$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-
F^nun+DG_'DfTl0@rrh#+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0=G+<V"6
.NiSHEb-A8ATMr9@psFiF!+n%A7]:($48"&,9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej"B+=\LVE+EC!
AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@kr
+:95@+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2
FD,4m+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62
+E)-)+<VeKBOr<*@<?08$6UH6$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/d`^D
+:9><,9SZm3A**1/KdZ.DBLYg/0H]%0ej"B+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)
@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7d3+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_W
De!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ1-+<Y35GA_58@:Wq[+DG^9@3B`%
EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohM+<VeFAnGjnDIjquC2[W8
E+EQg+EqO9C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*$48"&,9SZm
3A*'0/KdbrGp"k&/0H]%0ej"B+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et
/g+,,AKXZ\DKU1HG%G]8Bl@kr+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znb:+<VdL
+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:&?t.NiYICh[cu+CoD#
F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.*LB+D>2)+C\nnDBNG-
DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[C+<Ve+BOr;rDf0`0EcYr5
DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;#+<Vdu+CT+0F)5c=Cj@.8
Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:956+Br5gDe(J>A7f4T-tm^EE&oX*
GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[>O+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFd
Bk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*
8l%htBlbD*Cht5&@W-C2/d_q..Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.
@V$[!@:WpV+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:.1.1?+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:8Gu.NihH
BlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@
$6UGu,9nEU0J5@<0d&%j9jr;i2_6(,0JP9h$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&
FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<:$6pc?+>>E./heD"+@]pO+>Gi,
+>PW*0a\71.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;
EcYr5D@.L/+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/d`^D+:95@+ED%4CgggbA0=K?6mm$u
@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5uBl8$(Eb8`iAM+<4+<X9P6m-AcG9CF-
Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu$6UH6?tsUjF*VhKASlBp
FD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjU+<VeNDfTB0+CT;%+Co%q
Bl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AI9P&+C\c#AKYf-@ps1b-Z^DOARTUh
BHV8&FD)"(+<V"6.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u
+Cf>-G%GQ5Bl@m1/d`^.+=\LAC2[W8E+EQg+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr
+E1b!CLLje/g)9EC2[W8E+EQg$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;r
DfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Ambrg+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=
?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?j\#!+CT.u+E2.*@q?csF<G:8+CKY,
A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfT_+<VeCDe!3l+AbHq+ED%%
A8,po/d`^D+:95@+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(n
DJ*O%/d`^.+=\LA<E)FI?m';p@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9Vi
ASl!q@V'R&1,pCgDfQt.<E)FI?n!]8+:95@+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9o
GA2/4+Eh10F_)[N2D-*p$6T[#,9n<b/iYI;+>"^3@rrhL0e=G&0JGHn$6Uf@@:Wn[A0>c$G9C:.
De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA,#+<Y3;
D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/d`^D+B3#c
+CT>$Bk]Oa+ED%4Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn#+<Ve;F_u(?
Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6$6UH6$6Uf@?tsUjF)Q2A
@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:956+ED%(
F^nu*FD,5.F(or3+E(j7FD,5.A8c[0Ci<`mF"ReB+<V"6.NiSBDJsP<AncL$F!,17+CJr&A1hh3
AmbrQ,9nEU0J5::1E\7l:LeJh2_6(,0JGHn$6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<
Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?j\"`+=\LG
Bm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?j[5c,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHn$6Uf@
@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pfWd$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)
@rc9mAKYJr@;]^hEs`7!,9n<b/iPC;+>"^7AT/bI1b9b)0JGHn$6Uf@Eb0*+G%G2,F)Po,+DbJ,
B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3$6TZu.NibC
E,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(@qB^(F(or3+E(j7
C1(sj/oY?5?j[5c,9n<b/iPC:+>"^7AT/bI1b9b)0JGHn$6Uf@Eb/ioEb0,uATJu&A7T7^+EVNE
?tsUj/oY?5+CGO!$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZU
F_l1Q@rH35+D#(tFD5Z2$6T[#,9n<b/iG=9+>"^%F_;gO3%Q1-0JGHn$6Uf@D/!m+EZf+8A0>r'
EbTK7+D#(tFE7d3$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0Dg#]&+:94u,9nEU0J5480d&%j8p+qm
1,1=&1,(CA$47n*+CJr&A9Ds)Eas$*Anbm1Bkh]s+CSekARl,j$6Uf@?tX"]E-#D0DJs_AA8bt#
D.RU,ARlotDBN>%De(J>A7f3V+:9><,9SZm2(gR*/KdZ.C`kGl/0H]%0K9CH+=\LAC2[W8E+EQg
+CoD#F_t]-FCB9*Df-\-Df'H0ATVJj+:9><,9SZm1bLI)/KdZ.C`kGd/0H]%0K9CH+=\LJDKBr@
AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq$6TZu.NiSBDJsP<Cggcq
ARoLsF!*%WEb/ioEZfIB+CK84@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bi+:9><
,9SZm1G1X0/KdbrGp"mt/0H]%0K9CH+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@kr
$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3!p!8.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%
@;[2sAKZ#9D@-^q,9n<b/i,+<+>"^1@<itN3@l:.0JGHn$6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4
Cj@-I@:WneDCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEo
FDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,n
F*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F$6UH6$6T[[?85_H+<XWsBlbD-De!p,ASuT4@ps6t
@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHRX)+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'Y
BPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4trM+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+
@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XQuP+<VdL+:956+<VdL+<VdL+<YW3DIdZq
+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9PoDe*3nG%kN3?Z]k(1,:-u
@WH0oAfu#8ATDs.ATo88Afu2/AKXT@6m-PrF*(u1/g(T1,p7DFBl%?'@<6L.@qf@nARlp-Bln#2
FD,5.8l%htB6%p5E$079BlbD8G%G];Bk;K2%14C(@;p1%Bk;?.FDi:DBOr;tDKKT5AKXT@6m-Pr
F*(u1+EM+*+EV:.+DkOsEc3'K@WcC$A86$nCghEsGUX(/%16?]ARfgrDf0no:IH=$G%G];Bk;L:
%13OO8l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBtBQ@ZrHY@MCE-"&n04Sp2AM._=De=*8
@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV,DhA7TUrI4bs9%16$FAKZ).AKYT'Ci"$6
Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N-p
DII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHW4Zi+A,Et+AcKZAUQ0R
%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC
06Cl=/S]37/T>-2AM8H@$6WSkDfT]'Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I="q,AKXT@6m->TDKTB(+C'#"
G]\%LHYRJ0/oY?5I=3^W$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*F_t]1
@<?(/%13OO>]Y$sF(Jj'Bl@m98l%ht<HD_l+A$HmATDBk@q?caDfTB0I16Mm$<(k[AKYo'+EV:.
+DG_8ATDBk@q?d,DfTB0+Dbb5FCeu*BOu3q+CT;%+Du+>+CoD#F_t]-FCeu*Bl5&8BOr;kBQ@Zr
HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg04Ja9@P;S,F*(u605>E9/oY?5I="R^
6m->TDKTB(I4cWO$:n`R/0K"QEbTE,Ch[d"+EMIDEarZ'@rGmh+EqOABHU\jF`(`.@s)X"DKKH#
+D,1nFEMV8F!i=X@;]Tu?slE3F*(u6+@TpUF!i=XAoD]4@<?U&DKKT9AKZ#)@:WqiEt&IjF!+m6
Ci=3(F*(i.A8,po+EMI5FE_/6AKYMpG%GK.E,B0(F<Fh"D/a08ASuU(@qBLgDKL:Z%13OO,p6f<
Ci"$6Bl7Q+@rGmh+D58'ATD4$ARlomGrd'[DfT]/Amo1\FCf\>004P)IP+3<8l%ihDKKH1Amo1\
;cH%X6pX^=/4k.[:IK;CDesJn<'a8I5uL*%8U=!)7!3TcDKKH1Amo1\;cH%X6pX^=%14C(4=_q0
C2[WsAmo1\Hn?p6%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%
ATDU$DJOT-@Wm0H>Y]3XD..6[Dej].@Wik:+<VdLI=5=)E+*BjEb/j0BkCj9@:FD.>p*B>Df'?&
DKJirCO9K+C`m1q@r$4++Eh=:F(oQ1+DtV)ATN8/$=%7iE+O'+Bl7^5@:Wn]Ec?GR>Y]3XD..6[
Dej].A7T=nE$-8GI=5=)E+*BjEb/j0BkCj9@:Wn]Ec?G4+C%9PD/Ej%FB!0oHXUGq+EqaEA90DG
ATMs7+EVNEB6%p5E%c9TBlmp7%16?RH#R>8Ch[d&HXU`,DIIBnF+&C?:2b/i@;Jn]CO9K+Ci3Zu
ATJuBI9Trq@:s.lAS-:'An*l1Ci!utD.Rd:>p*B>Df'?&DKJirCO9K+C`mV(D.Rc2Ao_g,+E_a:
F#kEd@;Kat@;TRs+>Y_pF`V,8+=D&8D.P)C%16?RH#R>8Ch[d&HXU`,Eb/j(I=#3oDfT]'CfG=g
HXU`,Eb/j(+<Z)\>?l,UB4Z*pAp\6(@le%7CiX*!F+%=:>XNFHD.RU,<,ZQ!@;Ka&DJsE/De!3l
AKYl!D.Oi1AS,LoASu!hF#kFPCi"-'Aof(V3[\rZFEMVA+DlBHEb/ioEb0,uATK5I%16?RH#R>8
Ch[d&HX^W!FFAL@:2b/i@;Jn]CO9N'ATT%;+<VeTI9Trq@:s.lAS-:'An*l2B4Z15>p*B>Df'?&
DKJirCO:)5FE2),G%G_;DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^F`;DM%16?RH#R>8
Ch[d&HX^l/I=#3oDfT]'CfG=gHX^l/+<VdL+<Z)\>?l,UB4Z*pAp\6(@le(:CjfS3>XNFHD.RU,
<,ZQ!Ch[s4+E(_(ARfh'+DG^9E-67FA8,OqBl@ltEd8d<@<>pe@<6!&@UWb^F`8I8Bl%@%I16Ng
BR+Q.EboH-CO9Q0D/a6<HX'<aEc#6$<,ZQ!@rH4'C*4WA+FSZB>]=+aATD?oHYI)%3b*)FE,'f,
+C%9PD/Ej%FB!0oHXgu2E,oN2F(KD8DJsE1Dfor=+C]U=Eb0*+G%ki,+EqL5FCcS9E+*6f+CT.u
+EM47Ecbl1Bl7Q+Ci<flC`mG&ASuU(AnbgsF+"K)>\JD%ATDU$DJOT0AUSo1:2b/i@;Jn]CO9T'
+<VdL+<VeTI9Trq@:s.lAS-:'An*l4AURi,>XNFHD.RU,<,ZQ!A8-+(CghT38l%htEb0<7CigeD
Bln$,F`\aHATW'8DBNG-A7^/u$=%7iE+O'+Bl7^5A7]S*HX'<aEc#6$<,ZQ!A7]R"+<VdL+FSZB
>]=+aATD?oHYI)%3b2f<I9dt#6Z6gYASuThDej]1ASbq"ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2
+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&HXp](B6%s>HX'<aEc#6$<,ZQ!A7]RiEc<-D+FSZB
>]=+aATD?oHYI)%3b2f<B6%s>>p*B>Df'?&DKJirCO:)5D/XT/+EqaEA90DGATMs7+D,Y4D'3J3
Dfp#?06;8MFCfNA%16?RH#R>8Ch[d&HXpi$I=#3oDfT]'CfG=gHXpi$+<VdL+<Z)\>?l,UB4Z*p
Ap\6(@le.7A:7`+>XNFHD.RU,<,ZQ!A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*A0>r8@<?4)
FD56+I16NgBR+Q.EboH-CO9T+F)ZPS>Y]3XD..6[Dej]1Ble59+<VdLI=5=)E+*BjEb/j0BkCj9
A8-+(I9dt#6Z6gYASuThDej]1Ble60@<iu+Bk)7!Df0!(Gp%$7C1UmsF!+n4+EV1>FF=T*>\JD%
ATDU$DJOT0DJX`J>Y]3XD..6[Dej]1DJUF<+<VdLI=5=)E+*BjEb/j0BkCj9A8Z43>p*B>Df'?&
DKJirCO9l3F*&OC@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&
HXq&)I=#3oDfT]'CfG=gHXq&)+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.=@sqW*>XNFHD.RU,<,ZQ!
AoD^,@<?Q5A8bt#D.RU,+EV1>F<G^IBl7Q+FD,5.@rH7.ASuU(Df0V=De:,6BOr;7A8bsfF=A>U
ATD7.%16?RH#R>8Ch[d&HXq):ATW?I>Y]3XD..6[Dej]1E-#T4+<VdLI=5=)E+*BjEb/j0BkCj9
A8lU$FF@F;>XNFHD.RU,<,ZQ!F(KG9A8,OqBl@ltEd8dH@<,dnATVL(F+"K)>\JD%ATDU$DJOT1
A:8f0:2b/i@;Jn]CO9W'+<VdL+<VeTI9Trq@:s.lAS-:'An*l5A:7`+>XNFHD.RU,<,ZQ!ARoLs
+Co1rFD5Z2@<-W9DdmHm@rud?%16?RH#R>8Ch[d&HY%;IHX'<aEc#6$<,ZQ!ATT%;+<VdL+FSZB
>]=+aATD?oHYI)%3b<D]>p*B>Df'?&DKJirCO9W'BlkJ>AU&<F%16?RH#R>8Ch[d&HY.>1DLHk:
:2b/i@;Jn]CO9Z7ASrV5+<VeTI9Trq@:s.lAS-:'An*l6F(K6;>p*B>Df'?&DKJirCO9Z-EcZ=F
A8bt#D.RU,+EM+3FCf?"AUP!p>\JD%ATDU$DJOT3A7]_$I=#3oDfT]'CfG=gHY6l#E-!-E+<Z)\
>?l,UB4Z*pAp\6(@le75AT2^=>p*B>Df'?&DKJirCO9]7Dfp"A@;]TuF*22=AKYMpE+NotASuU2
I16NgBR+Q.EboH-CO9]*FFAL@:2b/i@;Jn]CO9]*F<D\K+<VeTI9Trq@:s.lAS-:'An*l7ATW?+
+C%9PD/Ej%FB!0oHZE\>EbT*.ATJu4@VTIaFE8R:Ec5e;A8,OqBl@ltEd8d<@<>pe@<6!&Anc'm
F+"K)>\JD%ATDU$DJOT3ATVs;I=#3oDfT]'CfG=gHY6o3Ed/]L+<Z)\>?l,UB4Z*pAp\6(@le76
FE2VS>p*B>Df'?&DKJirCO9]*F<GU8EHPu9ARlp*D]iV9ARfk)AUP!p>\JD%ATDU$DJOT3Ci<d(
I=#3oDfT]'CfG=gHY7/5@WNY7+<Z)\>?l,UB4Z*pAp\6(@le7=Ddmd9>p*B>Df'?&DKJirCO9K-
@;L48ALnsEAT2R.F<G"0A0>r8DfTD3B5DKq@;I'(@;TRsI16NgBR+Q.EboH-CO9]7E.*(<:2b/i
@;Jn]CO9]7E$-8G+<VeTI9Trq@:s.lAS-:'An*l7Ec?G4+C%9PD/Ej%FB!0oHXh)-@<?''@;]Tu
D/Ws!ApGM3Ec6)>F+"K)>\JD%ATDU$DJOT3FFAL@:2b/i@;Jn]CO9]9+<VdL+<VeTI9Trq@:s.l
AS-:'An*l7FF@F;>XNFHD.RU,<,ZQ!B4Z0-8g&1bEbTK7+EV1>F<G19Df$Uh+EV13E$/\*Eb/a&
DfU,O%16?RH#R>8Ch[d&HY@57DJX`J>Y]3XD..6[Dej]5CiF9.+<VdLI=5=)E+*BjEb/j0BkCj9
BP_X*CjfS3>XNFHD.RU,<,ZQ!A8-+(CghU1+EM47Ec`F7ATM@%BlJ0.Df0V=De:,1@VTIaFE8RC
DBL?Q.=DX4>\JD%ATDU$DJOT6De*9hAUSo1:2b/i@;Jn]CO9f7A79+^+<VeTI9Trq@:s.lAS-:'
An*l:De*9hAURi,>XNFHD.RU,<,ZQ!A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE;j>$=%7iE+O'+Bl7^5C2[WrASc=6HX'<aEc#6$<,ZQ!C2[WrASc<.+FSZB
>]=+aATD?oHYI)%3biSDBOu"!I9dt#6Z6gYASuThDej]1Ble60@<itf:IH==ASc=6%16?RH#R>8
Ch[d&HYd>CHX'<aEc#6$<,ZQ!ChFk5+<VdL+FSZB>]=+aATD?oHYI)%3c&GW>p*B>Df'?&DKJir
CO9o,CLnVsDIal+Ddd0!8l%htB6%p5E.&0&>\JD%ATDU$DJOT8De!F#E.*(<:2b/i@;Jn]CO9l9
@qTh$+<VeTI9Trq@:s.lAS-:'An*l<De!F#E.)"7>XNFHD.RU,<,ZQ!Ch[s4+D5_5F`;CE@;]Tu
F*22=ATJu<Bln#2DIIBnI16NgBR+Q.EboH-CO9o,CLqp@>Y]3XD..6[Dej]:@;BEs+<VdLI=5=)
E+*BjEb/j0BkCj9D..3kI9dt#6Z6gYASuThDej]:@;BFq+A*bt@rc:&FE;j>$=%7iE+O'+Bl7^5
D/=9AHX'<aEc#6$<,ZQ!D/=89+<VdL+FSZB>]=+aATD?oHYI)%3c/\SI9dt#6Z6gYASuThDej]:
@;BEsCi<`m+EM%5BlJ0B%16?RH#R>8Ch[d&HYmY:I=#3oDfT]'CfG=gHYmY:+<VdL+<Z)\>?l,U
B4Z*pAp\6(@leIECjfS3>XNFHD.RU,<,ZQ!Ch[s4+E(_(ARfh'+DG^9@;Ka&Eb/ltF*(u6ARloo
Bk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZ!D=A:8f0:2b/i@;Jn]CO9r1G@Vg=+<VeTI9Trq@:s.l
AS-:'An*l>ATq[5>p*B>Df'?&DKJirCO9Q3ART[lF!+m6DIn#7A8,OqBl@ltEd<'B$=%7iE+O'+
Bl7^5DJs*2E.*(<:2b/i@;Jn]CO9r;AU&/:+<VeTI9Trq@:s.lAS-:'An*l>De404I9dt#6Z6gY
ASuThDej]?ATW'8DK?q/+Dbb5F<GL6+E(_(ARfh'+EqOABHV22+D#e:Cgh3iFD5Z2F+"K)>\JD%
ATDU$DJOT:DffW4E.*(<:2b/i@;Jn]CO9r;FD#W5+<VeTI9Trq@:s.lAS-:'An*l>DffW4E.)"7
>XNFHD.RU,<,ZQ!GAhM4F!,CA+EV19FE8R:Ec5e;.![6aFD,*)+CT;%+Du+>+DG^9B6%p5E-!.?
EZfFGBlmp-I16NgBR+Q.EboH-CO9r@I=#3oDfT]'CfG=gHZ!pJ+<VdL+<Z)\>?l,UB4Z*pAp\6(
@leLLI9dt#6Z6gYASuThDej]2A8--.@3BH!G9D!=F*&OG@rc:&F<G^IBl7Q+8l%ht@rH7.ASuU(
Df0WE%16?RH#R>8Ch[d&HZ"%UHX'<aEc#6$<,ZQ!DKd3G+<VdL+FSZB>]=+aATD?oHYI)%3c9.i
>p*B>Df'?&DKJirCO9W'BlkJ++Dtb7+D#e:Ch[BnF<GdGEb$;8F(oN)+A,Et+Cf>-G%GQ5Bl@m1
I16NgBR+Q.EboH-CO9u/DIIBnF+&C?:2b/i@;Jn]CO9u/DIIBnF!)TRI9Trq@:s.lAS-:'An*l?
@W#UkATN9*+C%9PD/Ej%FB!0oHZ*A.ARfg8Ci<flCh4`,@;TRs+D,Y4D'3tBATKmT+CT)&DIIBn
F!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO9u1I=#3oDfT]'CfG=gHZ*F;+<VdL+<Z)\>?l,U
B4Z*pAp\6(@leO=I9dt#6Z6gYASuThDej]<E+Np.+CT.u+Cf5+F(KD8A8,OqBl@ltEbT*+I16Ng
BR+Q.EboH-CO:#/@r#V'HX'<aEc#6$<,ZQ!E+*6lA0<!;+FSZB>]=+aATD?oHYI)%3cJM;CLhj!
+C%9PD/Ej%FB!0oHX^DnCNCV@E$/S,A0>o(@rHO%EcW@I@<6O%A0>r4@:NjkBl5&(Bk)7!Df0!(
Gp$^5Ch7[9%16?RH#R>8Ch[d&HZ4"RHX'<aEc#6$<,ZQ!E,m'D+<VdL+FSZB>]=+aATD?oHYI)%
3cK+f>p*B>Df'?&DKJirCO:#CF<G"0A0>B&Df]tBEb/ioEb0,uAKZ28Eb'S-$=%7iE+O'+Bl7^5
E-68NHX'<aEc#6$<,ZQ!E-67F+<VdL+FSZB>]=+aATD?oHYI)%3cK4`I9dt#6Z6gYASuThDej]@
FDl22F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5Eb/j#
@;TRsI=#3oDfT]'CfG=gHZE\0DIIBnF!,mZ>?l,UB4Z*pAp\6(@leXAAo;$oATN9*+C%9PD/Ej%
FB!0oHZE\0ATD@"@qB0nDJsE/De!3lAKYl!D.Rc2Ao_g,+E_a:F#kEd@;Kat@;TRs+>Y_pF`V,8
+=D&8D.P)C%16?RH#R>8Ch[d&HZE\1A:8f0:2b/i@;Jn]CO:)5B4N,-+<VeTI9Trq@:s.lAS-:'
An*lBAS5P%>p*B>Df'?&DKJirCO:)5B5)F/ATAo%DIal4DK9<$BleB-EZdtM6m-#S@ruF'DIIR"
ATN8/$=%7iE+O'+Bl7^5Eb0<6A:8f0:2b/i@;Jn]CO:)5F*(q8+<VeTI9Trq@:s.lAS-:'An*lB
ATMs(I9dt#6Z6gYASuThDej]?ATMs3Eb0;7FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlom
Gp"MS@:O(`.=DX4>\JD%ATDU$DJOT>ATi!?HX'<aEc#6$<,ZQ!Eb0E4+<VdL+FSZB>]=+aATD?o
HYI)%3c\eTDgbn6>XNFHD.RU,<,ZQ!Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'I16NgBR+Q.EboH-
CO:)5G&M80G^XpD:2b/i@;Jn]CO:)5G&M80GT\,WI9Trq@:s.lAS-:'An*lBATi!0AU&W/+C%9P
D/Ej%FB!0oHZE\>F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9
E,8s#@<?4%DKC48$=%7iE+O'+Bl7^5Ec$5O>Y]3XD..6[Dej]?D'0rD+<VdLI=5=)E+*BjEb/j0
BkCj9Ec$51+C%9PD/Ej%FB!0oHZF7HF!+'tD.-ppD]j+2EbTK7F+"K)>\JD%ATDU$DJOT>FEDqX
>Y]3XD..6[Dej]?FEAWJ+<VdLI=5=)E+*BjEb/j0BkCj9EccDO>p*B>Df'?&DKJirCO:)EDK?pm
+EV19F<GX7EbTK7F+"K)>\JD%ATDU$DJOT>G]S:[>Y]3XD..6[Dej]?G]OuM+<VdLI=5=)E+*Bj
Eb/j0BkCj9Ed2YR>p*B>Df'?&DKJirCO:)5B6A$!EZeq<E,oN2F(oQ1+EM+&Eard2%16?RH#R>8
Ch[d&HZOCBG^XpD:2b/i@;Jn]CO:,HAU#=?+<VeTI9Trq@:s.lAS-:'An*lCG@c#I>p*B>Df'?&
DKJirCO9W;FE1f"F<GX=DJ*cs+Dbb0AKYQ/E,8s#@<?4%DBNP3Df$V@DfTA2BOtU_ATAo'Df'?&
DKI"0DIal2@<Q41%16?RH#R>8Ch[d&HZaC@A7Bh4HX'<aEc#6$<,ZQ!F`V,)@X0(=+FSZB>]=+a
ATD?oHYI)%3d#LTA7Bh4>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7GAhM4F!,(8Df$UF
GpskXBOQ!*6qL9F6W?`^+CehrC`mq?Eb'56Df-[GGU\%M$=%7iE+O'+Bl7^5F`V,8I=#3oDfT]'
CfG=gHZaC@F!)SJ+<Z)\>?l,UB4Z*pAp\6(@leaRATN9*+C%9PD/Ej%FB!0oHZE\>F`MA@+EqaE
A0>o(An?!oDI[7!I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp4(De*ZuFCfK$FCeHn
ATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6sBkJQ#DfQt>Ec5](@rrhAE,o].De*ZuFCfK$FCcmR
%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jS
BkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*
AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA
$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?
Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3
@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$Hm
Cb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*
FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"
C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UHAKYo'+=B5u+Cf(nEa`I"ATA4e%15is
/g*\rDK:"MF!)Z9F`_^WF_>N9+s8lu0JXbpDfTW%Ec6)<A9/1e:-pQU3?^F=3?T_).3Mh;3?^F=
2]sJY@WHU/+=&W`>9GpL3\i]<-mp,g+=JEp+?:T+1,pX/.3L/a-Rg0B+?:T+1,g='-RU#f+=JW_
INViU+?hh/-RU8h-9We#3?^F=2CBk$+=nW_-RU8N$;No?+?:T+1-&Vp><*if1,gRk@WHU/,VWF_
+Z_A=>ph0O,!%_-3\iZ?0I\P#><*if1,gR3EHQ2AAKWuV3\iT=0F\?u$:Zd40fr9ED..3k+@C9l
Eb0-14)AhDA0<77De*ZuFCfK$FCcgB>9GXCEccCG-Xq44Ch.:!A8Gt%ATD4$ALAU)+Cf5!@<*J<
-OgDMFE21J7P[%[4&]^4+@C9lEb0-14*#Bb-ZF*@C2[X!Blmp,@<?'.+Bot,A10PfC2[WnATfFM
/1<V.C2[W1.4dS/F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@
F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fp
ARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN
%15Q]4"r`aAR]dp+B!?"4#nHF1-&Vp><*if1,gRk@WHU/,VWF_+Z_A=>ph0O,!%_-3\iZ?0I\P#
><*if1,gR3EHQ2AAKWuV3\iT=0F\@Y2ENWT<+U,m+B*,qCLoSJFEAWQC2[X!Blmp,@<?'ZD/X3$
0JFj`$<(VPAooOm2ENWT<+U,m+@9LXBk'5;Ec>i/F<DrGDe*ZuFCfK$FCeElDfoN*APHTKATDi>
+Bot0ATV[*A8Gt%ATD4$AKW?JC2[X!Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$
AKYo7ATDs.ATnRj-!YM&@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO>]aP%
FEDVOC2[X!Blmp,@<?(/+DGm>@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]BQ@Zr
HY@MCE-"&n04f#RGA1i,E+NQo@4lJ=B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<ATD4$
AUP\3De!p,ASuU2+Co2,ARfguGp$^>Df$V%BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7
ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj07A1>:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/%16$FAKZ).
AKYT'Ci"$6Bl7Q+AoD]4A7]jkBl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)
Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@)>HW>-$DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>/g(T1+C&tt
EbTK7F(or3%144_F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-
ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I16N+>]+J#D..7%BmO>"$=%:e
AShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0G
A8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g7:<HDklB-:r-A8Gt%ATD4$AKXf;7XZlu$6WSp
@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=
FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I16N+>]+J#D..7%BmO>"$=%.[A:%m*
F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A$HmATDBk@qC&t$4R>I
@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-GBR+Q.EboH-CO9#O8Q/GO:..lF
I=#3oDfT]'CfG=gHW3O-;c#bT6r-/m+<VdLI=5=)E+*BjEb/j0BkCj9<(KSZ:dIiE:IBP9+C%9P
D/Ej%FB!0oHY.D:C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BRL<s
>\JD%ATDU$DJOT2DfT]/Amo1\FCf]FHX'<aEc#6$<,ZQ!AoD^,BkCd`ATVL.+<VeTI9Trq@:s.l
AS-:'An*l6DfT]/Amo1\FCf]F>p*B>Df'?&DKJirCO9Z3Ec#6,F!,.AE+O'+Bl7]tA0>;uA0>Q"
B4u*qB4uBuA0>T(FCfK)@:NjkGAhM4F+"K)>\JD%ATDU$DJOT3Ec>i/FFAL@:2b/i@;Jn]CO9]7
E,961+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3bNJPCh\!>>p*B>Df'?&DKJirCO9o,CLnW)@<?(*
+D,P4+D5_5F`8HOGq".N$=%7iE+O'+Bl7^5BkCd`ATMEmFD5Z2I=#3oDfT]'CfG=gHYI)#@qB^m
@ruF'DBL&EI=5=)E+*BjEb/j0BkCj9BkCd`ATMEmFD5Z2I9dt#6Z6gYASuThDej]6DKKH1Amo1\
+EM+(FD5Z2+EM[BD..I1+EMXFBl7R3%16?RH#R>8Ch[d&HYI)%I=#3oDfT]'CfG=gHYI)%+<VdL
+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9BkCk'>p*B>Df'?&DKJirCO9Z3Ec#6,+DG_8ATDBk@q?cm
Df'?&DKI"CAU&<F%16?RH#R>8Ch[d&HZNb?C2[X!Blmp,@<?(/HX'<aEc#6$<,ZQ!F(KH.De*Zu
FCfK$FCcSCI9Trq@:s.lAS-:'An*lCATV[*A8Gt%ATD4$AURi,>XNFHD.RU,<,ZQ!E,oN/@<,p%
9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q@ruX0Gp%<OBlmp-+E2@4@;TIiAUP!p>\JD%
ATDU$DJOTAGAL]0AU%g-GAhM4F+&C?:2b/i@;Jn]CO:2JCghEsG\1u?DfTB0+FSZB>]=+aATD?o
HYI)%3d#X_@<?(*Ao`*6Eb'6>>p*B>Df'?&DKJirCO:2AGB.,2E+NQ&CghEsGT^U=Df$V@DfTB0
3ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-[cF2>\JD%ATDU$DJOTCDfTB)BlncM>Y]3X
D..6[Dej]DDfTB)BlkI?+<VdL+<Z)\>?l,UB4Z*pAp\6(@legPEb'!#FF@F;>XNFHD.RU,<,ZQ!
D..3k+DbJ.AU#>0Ec5e;GAhM4+Dbb5F<DuW.=DX4>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+Td
A7];"%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+CT.u+A,EtI16Mm$=%[aG]\%L
HYRJ0Ch\!&Eaa'$I3<B8CLqQ0F)Po,+CT>4F_u)>Bl@m1+CS_tF`\aJBOr;Y+Cf>#AKYE!A.8lV
De!p,ASuT4FCf]=+DGp?E,ol,ATMp(F"SS,F<G"5F*2>2F#ja;%16?LAS5^pHY%);D.R`rFCfl)
0eQ`@$=%:eAShk`+<WsdC`me;F`Lu'+Cf>#AKY].+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(Bk;?<
%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCA8bt#D.RU,+D,Y&B5M3tFE8R5Eb-A)Bln$"
E]OX:+<XouAS5^pHYIS5D/"<-I16N++C&W&ASiPa@<--oDg-(AB6%p5E$/t8DJ()&De!p,ASuU2
3Zq[NATD7-1*AS"A8-+(+=CfBDfp#:@;TR'HjpE*+C&W&ASiPp9OUn3=BltiF_56"G\(D.D.-pp
Df[r^>]s\!@XL!TA8-+(+=CfBDfp#:@;TR'/14eCG%kN3?Z]k(-[Z@1+<Xp#DIe*.FCf<'H=_L6
$4R=g+C&W&AShk`,p4<Q:2b#%8g%V^A7ZltF!+t2DJ!U#ARlp*D]j.8AKXT@6m-,_Dfp"ABOtU_
ATD$fDf9`8DffQ;<+oue%14C(+<VdLCh[a#FCB9*Df-\7@<iu)AKYPmF(Jl)BkAK%F<G%(@rH3q
F!+m6BPD?pEa`iqAM/BR@;]TuBlbD6@<--pA.8kl+<VeNBln#2E-#T5A8a&=@;]Uo@j#;nCh[a#
FCfK6/g*T+ATE'<BPD?s+DG^9@s)g.Gp$@6AU&<=FF.8>>^_#0$7-f;+C]A"@r#XtF!,(5Ci"$6
F!,F1DIdZq+EMIDEarZ'@rGmh+D>J%BP_BqBQRs+B-:]&DK]T/FD5Z2F"Rn/,p4<Q>]aP%FEDVO
C2[X!Blmp,@<?(/-Z^DDART+\EZek1DKK<$DK?q*9OUn3=FOauA7Zm*BOQ!*BlbD6@<--pA0>]&
CLmq^,p4<QFD,B0/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-fi67tA_IXZ`p+F>4`CghEsGT^mH
D.7's9PJBUF!,OG@<-HZEc5eX+u(8aI16N0+AP6U5!FFEIXWCK$7-g"ASu%*G%G]'@<?4#I16Ng
ASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL59(DJj0+B-:H$AU&<=FF.b@A8Gt%ATD4$AUSt9
$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCEcl8@+E)-?=(uP_Dg-7R+A?KeFa,$;DIaka@:LF'ATDj+
Df0V=De9Fc8hO@\Df9`8DffQ;>]aP%FEDVOC2[X!Blmp,@<?(/+EqO9C`mb@DBNk8+A*b9/hf"&
@;]Tu@V'h'DIbAJ%13OO<,Wn%F(HJ!FCf]=FEDkEDe*ZuFCfK$FCfkCH#IgJD09oA3XlE*$=%%O
B5)71ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+A$HlFCB!%+A,Et/e&.1+C&T#AS-:&FEDJC3\N-r
De*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA:8es:IKURBlbD*+A*(M+<Y*'
A8c?<+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABFP:k+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*
FE_/6AM.J2D(g*ICM>Fu@:O._DLHkN@:O._DLF,H$=%:eAShk`+<X6nF*(i,C`l>G6rQl];F<l*
%144#>\J.hAp\35FDu:^0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9
F)Q2A@qC(88l%iR:K::[7=>UP+<YB>+CT)-D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+C'#"
G]\%LHZ3D'D..=1/g*`-+Cf>-FCAm$F!,R<AKXT@6k'JG+Co1rFD5Z2@<-'nF!,L7EHPu9ARlp*
D]iM3Bl%<&8l%i-+A,Et;bpCk6U`,+CiaM;@rH7,@;0V#%144#>]aP%FEDVOC2[X!Blmp,@<?'5
I16NgBlmp'%144#8T&Tk@;Ka&@3B'&EcP`/F<Ga<EcYr5DBNk0+C&T#AS-:&FEDJC3\N.*@;]Uo
@kM\?B.n[[E+*WpDe"2J%144#>]aP%FEDVOE+*WpDe"2<G%G]8Bl@l3>]aP%FEDVO1+kR>0eP2/
+CT.u+C\o-Df0).%144#F*2G@DfTr@+A*btH#@_4GT^[6B4u*qB4uC$DJ(RE:i^8gEZfO:EcYr5
DK?q@AT;j,Eb/c(D/Ws!Anba`FD5Z2/g+,,AISth+D,P.Ci=N3DJ()$Ci<r/E,Tf>F!,FBDg#i*
AKYi.Eb-A-DJ!g-D..O#Df.TF$6UH6+<Ve3@V'1dDL5r4F_t]1@<?(/%13Ca+C&W&ASiPpBQ@Zr
HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(I;0/,.70f^n(DfTD@C+XC5
DIdZq/TZ2TFCBDGBPD*mCh[NqFD5W*07A1ADfTD38g$r=DIdZq+B*Q'FCBD:882^M9PJ-QFD5W*
I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^p
Bm+'(/oPcC0/>4:0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.nZB$6UH6
+<Ve3DJsQ4@;L"!H=[Nm#p:?qBlmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5r
EbT].CbBXHB.l"o0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I="e!
DIdZq+C\c#ARloU+B*Q'FCBD:882^MCh[NqFD5W*I16Mi+<Xp1@rc:&FE;/BAISth+<VdL+C'&0
CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t=A0/>47E+*WpDdtA.
@<6!j/SZkYH#@_4GV*TCB4u*qB4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(s
Eb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb770e[TZD.tS<
Blmp,@<?'4C2[W9I="n(D.tRqBlmp,@<?''8l%j'/e&-o+<Xp1@rc:&FE;/BAISth+<VdL+C'&0
CjTi;FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-C
ATD4$AM%Y8A1r??$6UH6+<Ve3DJsQ4@;L"!H=[Nm#p:?qASu%*ASuX-ATD4$AUP!p>\S:kD%-gp
+@:3bCh+YnFCf]=FEDkEDe*ZuFCfK$FCd(Q+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+D5_5
F`8rU8l%ha$6UI.@;BFq+A*bt@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs>]aP%FEDVOC2[X!
Blmp,@<?(/+CoCO%13OO,p6H%AS5^pHZit@@UX@mD1)j#,p75>EHPu9AKW@5ASu("@;IT3De(4)
$7-g5A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14C(D/=89-YdR1Ch\!&Eaa'$-OgD/
+C&JqA:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>E
Ec#6$<,ZQ!Eb065Bl[c-I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TO<DImisCbKOAA6a4f
G][qJDffQ3Bl7R"AUAiR%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_HTO9:>Z5`bBl7Q_Dej])
FCf]=EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3Bl7R"AUAiR+C%QNH$=1I
A5mJ_HWtn@>XW.5<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-
DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9o7F!,m9;fm%oDJ)peCO9<.AU&<:
F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+
B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHeE+No0FD,5.8l%htA8,OqBl@ltEbT*++Cf>-FCAm$
Bl7Q+FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"DKIK?$4R=g+C&AeB5)71G%G]'@<?4#I16N0
+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1,p6H(DIe*;ATD6gFD5T?%16?LAS5^p
HW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZ*F;I9]EVH$=1IA5mJ_
HTO9:>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2A7]p,C2[W*F`_>6F'NfuG][qJDffQ3
Bl7R"AUAiR+C%QNH$=1IA5mJ_HWtn@>XW.5<affDDej\UI9]NcEc#6$<,ZQ!+E(d5I9]]mEbTE(
<,ZQ!>]aP%FE)GAFCfN-DJ*csH[T.@AU&<:F`2A5F(oN)Ch7sAI16NgASu%*882^MCh[NqFD5W*
I16NgASu%*;eTTMARp2u$=%:eAShk`+<X?r@:UKcFCf]=FEDkEDe*ZuFCfK$FCd(Q+@0U]ATAo1
@;BRpB-:H$AU&<=FF.b@A8Gt%ATD4$AUP\8F<G(%DBND"%144#Ci<`mARlp"Bkq9&@;^?58g&1b
EbTK7/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g2Ddd0!-YdR1Ch\!&Eaa'$-OgD/+C&JqA:&K2
EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!
Ci<`m+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)
Ch7sAI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<XToF<G!7GAhM;
Bl7Q+A8-'q@ruX0GqL4EFCf]=FEDkEDe*ZuFCfK$FCfkCB4YslEaa'$Et&I!+C%TK<+T0\Anc'm
F"SS$Cht58F^o)-Anc'mF!+n3AKZ2;BlnH.DBO%>+EV:.+Co2,ARfh#Ed8dKE+NNnAnbge+C]U*
$6UHrFCf]=FEDkNATV[*A8Gt%ATD4$AM/B?$4R=g+C&AeB5)71G%G]'@<?4#I16N0+EM+9C2[X!
Blmp,@<?''-RU#Z:-pQU@s)g4ASuT48l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0
Gmt)i$7-g9ATV[*A8Gt%ATD4$AKW@13a?c<D/^jF+<VdL+<VdL+AP6U+EqO;A8c[5%14C(F(KH.
De*ZuFCfK$FCcRB05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU15$7-g"ASu%*G%G]'@<?4#I16Ng
@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO:,6FD>`)Ch\!&
Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=34\>XNFH
D.RU,<,ZQ!:-pQU@s)g4ASuT48l%htE-67FA8,OqBl@ltEd8d<De!p,ASuT4A8-'q@ruX0H$p,/
%16?8DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TBb
>]aP%FCJZgCNF<#F(foKFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b+<VdL+<VdL+C%9PD/Ej%FB!0o
HVQm[+EqO;A8c[5I16Ng:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAhYBQ%a!05>E=DD-*CD/`a%AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p
67sBsBl8'<I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eASiPgATT&5E-,f4
DII?(@<H[*DfR7I.3NhKFD)e-H!t5t@j##uAU&<=FF/(?FD>`)Ch\!&Eaa'$I4bs9>[h8WBl88r
BOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+
I6q@aD..<eFCf]=EHQ2AATMR'B5D.+I=5?qDfT]'CfG=gHQ[B@FD>`)Ch\!&Eaa'$+FRKnFE2)5
B2iebHX(Z(G][qJDffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I:?W,@psOl>]aP%FE)GAFCfN-
DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+EM+9+A?3CAQU'`F`_;8E[YuX+EV1>F<G"0A0>DsEb/a&
DfU,O%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B!?"+C'#"G]\%L
HY7A<Ch\!>+E)-?FD,5.B6%p5E$0FEFWbm:DKI"CD]iS/@s)X"DKIKR>]aP%FEDVOB6%s-Blnb4
$6UI(ASu("@<?(%+C%TK<+T0\Anc'mF!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<
+C%TK<+T0\Anc'm%144#BlbD0Bm+'*+EV:.+D5_5F`8I@@;TR.%13OO,p6H%AS5^pHZit@@UX@m
D1)j#,p6i@E,961+=CoBA8Gt%ATD4$ALATq67sBt@;BFq+DPh*Ch\!&Eaa'$/p(ZL+:SZ(+C&Jq
A:&K2EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$
<,ZQ!B6%s-BlkJG>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GA
FCfN-DJ*csH[U;b>XNFHD.RU,<,ZQ!:-pQUD..3kF!,49A8Gt%ATD4$AM/(9GT_DD$=%.[A:$j]
B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#<HD^o>YJR*AQXD'D]iP.D/a3*AKZ).
AKYT!Ch7Z1B4YslEaa'$A0>?,+C'#"G]\%LHY7A<Ch[uDI38t+%144#5p0WFFCSu,>]aP%FEDVO
@UXA,+EM%5BlJ/:BlbD@EbTW;ASrW4D]j.8AKY6"AU&<=FF/(?FD>`)Ch\!&Eaa'$I16N++Co2,
ARfh#Ed8dLBOQ!*F(fK9F!,R<AKZ&*EHPi1@q?d$Aft>P@8pf?>TdNpD/a3*@<?4%DBNG-D/E^!
A90@4$6UH#$6UH\Bl%@%%144#D..]4@V$[$Ec5H!F)to'+EqOABHUQ%AU&<=FF.t;Ao(mtAU&VS
+C'#"G]\%LH['+<@<?(*I3<HK%144#>]aP%FEDVOCis0&@<?(*I4cXFDfp(C@q]dp@q?d,Bl%T.
@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De9Fc+<X[%Bk)'lAKYJr@<,ddFCfK6/g*W%EZf4;
Eb-A(ATV?pCi^_?AS!!+BOr<*Eb/Zr@VfTuAnc'm%144#>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr
@VfU.FCf]F+DG^9FD,5.GAhM;Bl7Q+A8-'q@ruX0GqKO5>\.e`HY%);D.R`rFCfk0$4R>ABOu3q
+CT;%+EMI<AKY5O@8pf?IWK(BFD5W*F!,aHFWbO0Gp%<>DKI"CD]iJ!C3=T>/e&-s$=%%OB5)71
ASuX-ATD4$AURc;/mSnn>\S:kD%-gp+@TgTF<Fh1AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9
G^U]VD]iP'@;]^h+EV:.+Du==@V'R&De:,+DId='%144#@rH1+D/ODI+B3#c+Co%q@<HC.+DGm>
FD,]+AKYH)F<G[=BlbD6@<iu9ATN!1F<G:8+Eh=:Gp$pADJ()0@;TRs+EDUBDJ=!$%144#FDkf'
FD,6+/g+,3+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;@q]:gB4X+5$4R>I@V'1d
DL6P<EaiI!Bl/8-$=%%OB5)71D09Z:Bk)'tF+&BkI9TrtARfgrDf.%O>\S(dAU&*$D.S-$%16?O
DIe*;ATD6gFD5T?%16?SFCf:u$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCGB.,2F!,:;DJ()5Dfp)1
AKYK$A7Zm"Bl7L'/g+59@;p1"DJ()+Et&I!+Cf>-FE2;9Ch7-"@X0)$FCf]=FEDk2;F+,Q8PMcU
I4cXABOr;sAS,@nCige6F!*1l0Hak=@<,ddFCfK6/e&.1+@BgNDJ*N'FD,B0+Eh10F_)\0AfuA;
FWb1-@;]^h+D,P0F<GLB+E1b%AKZ&.H=\]O=)q_gE+NQ&Ch[cuF!+n3AISth+E2@4@qB4^ARlp-
Bln#2FD,5.F*)G:DJ((sFCf]=FEDk2;F+,Q76s=i+EqOABHUhsAmoguF:AR"+C%3KATDllDej])
FCf]=FEDjn/hT>9I4bs9%16?SFCf;3%144#>]aP%FEDVOC2[X!Blmp,@<?(/+DkP4+DG_'DfTl0
@ruO4+D>J%BP_BqBQPA%ASlC"HZsL=E,]B!I3<!;G\(D.8g&"iF`)7CFD,*)+Cf>-FCAm$%144#
D/"6:F`M&7+E(j7F*)G:DJ+#5@;]TuDffZ(EZf:BBOu3,FEqh:F"SS7BPDN1@;L"'+D>\0A9/l*
DfQtEEa`p+ARlp$Df0H2F`)7CFD,*)%144#@rH7,@;0U%Ci=3(+D#D!ARo=_A0>r8EbTE(F"SS7
BOr<0ATD6&>]aP%FEDVOFa%Y1FCf]/Ed)GBA93/M+EM+*+E1b%AU[m'@:s.lAS-:'An*lEGAL]0
AU%g-GAhM4F+#SK$6UI$@;[2sAKZ,:ARlp*D]i\(DImisFCcS"ASlC"HZa4MEa`p+ARp33>YJR*
AQW1[AoD]4F*1u++EqaEA9/l8BOQ!*@ps6t@V$[!@;^3rCi"A>GB.,2E+NQ&@;]TuBl8!'Ecbl'
%144#Bl5&8BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.b@A8Gt%ATD4$AUQ0R<-!7,@<3Q8
AKYi(B4uB0F)Po,+DkP)F^])/ARoLsBl7Pm$6UI*F!+n-G@>c<+Dtb#ATMp$Ed8dOBln#2>YJR*
AQUPo$4R>IASu%*ASuX-ATD4$AUP!pC2[X%Eb\TqATDQtH#k_u:-pQUEHE=GF(KB-AU/>>@rH6s
BkJQ#DfQt>Ec5](@rrhAE,o].De(:L%15is/e&._67sBZAS!!.BkqE*E+*Bj+Er$R/o#HGAor6*
Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAbAU/>+$;No?+CT)-D`T"SFEDI_0/%']
De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L
@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fkBl7L'G@b?)ATBkKDdd0!-[oK7A8c@,
05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(FE21J838Le7r3*bF('*74(<5KGB7>&
C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*@prhhCgh@001ThsF)tc1Gpa%.:-pQB
$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"$;No?+<j`tBkDH;7Q)G"$;No?+<j96
+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>+q4lS67sB);eTlWF=Tg>+q4lS67r]S
:-pQU:/=hX3ZqpNDK]r7F`_2*+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)=G&M)*F!,UH
AKYo'+=B5u+Cf(nEa`I"ATA4e:-pQU7Pm1\4%*XhF_;gpF`'9O@WHU/+=ANZEb03+@:NkZ+EqOA
BHT;f0JXbpDfTW%Ec6)<A.8kT$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0<74ASu("@;IT3De(4<
>9Is'+=CW@Bl%<pDe*BmF*)G:@Wcd,Df-pF>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/
F?=DO+=K?"C2[WnATfFM/1<V.C2[W1.4dS/F`_>6F!i)7+>Y-YA0<6I%15IEEbm7)BPD(#.n29U
0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#EHPu9AKW@5ASu("@;IT3
De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ70b"IgBPD(#.n2<V0fr!'
6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp+B!?"4#nHF1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y
+BosK+Z_A=+=JT[/0H>b3ZpF+3\iZB-Rg/h+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa
-RLu*+?:T+1,^L-.3L/a-RU8h%15Q_4#&frATMr9;f-GgANOpSF<Dr>@Wk[eDeio<0II;:;eTlW
F=Tg=4#&frATMr96=FqL@ll&58PN#(@UX=l@j#l)F*&dH@;]dkATMs.De(UX:-pQUD..<rAn?%*
+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0eP.4
1,9t(+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[W1%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&
Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&Ik
De*fqEc#kMBkh\u$>OKiE,ol/Bl%?5Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl
@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl@;@N2De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7
@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARl
De*Bs@kVS8A7KakAM.\,D[d%gDe*Bs@kVS8A7KakAM.q>B+52_De*Bs@kVe3An5gi05>E9E+EQ5
FEhm:$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[Ws
DKKo;/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16ig
A8G[`F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5
Ch7Ys$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m6
8g&(nDeF*!D/F!)B-:W#A0>o(Amo1kDfTQ0B-7WjFDl)6/g*b^6m-PnE,]`9FE8R@Bl7]tA0>Ds
@ruF'DIIR2+Cno&@:EYdATJu&DIal/Ec6,8A7]g)%172qDesJ;AoD]4@WcC$A8,po/0JJA@s)X"
DKKT1B-:W#A0>u*F*),6B-9ehF*VhKASlK@+:SYe$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0r
ATK:C@:WneDD!%@$4R>6AfuA;FWbC9F*(i,C`l>G6m-2c+DGm>BPD*mCj@.DARfXqD.RTqARlp*
BOQ!*H#Ig7$>FC!FCB!%+EV:.+ED%0@<?'k+CSekDf-[i:IITH6WHiL:/ihg8l%iC:IA,V78?f)
%16feF*(i,Ci^_0ATV?pCh7-":ddbqA8bt#D.RU,@<?4%DBNP0EZdtM6nTSk$4R>3DfQt;DfTD3
Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJtB8T&-Y+@:3mFDl%G/.Dr,F`&=DBOr<&
@:C?'8l%htCggcq8l%ht8T&WjDe+!#FD5Z2+s8H[8l%htCggdo+CT;%+E_R4ATAn&$?Trm+@g!\
ATD3q+DbIq+Cei%AS5q%GqL42AfuA;FWb45+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(%17#k+EV:.
+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:C?gEc6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUr
F"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7
AKXT@6m,<7B4W2oDIak[Bllmg@N]*$3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[W*+:SZ,%16r\DJ<]oF*)/8A7TUgF_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek
$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2-OgD`78d&U:JO&6+=Alr0J5+.%15R#9LM<I4ZXs'
ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!
7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%17&b
An5gi01'eqCh.6tB1brf6"FMEDK@FLA7c8XE+EQkDdtFm:IIN\F*(6!@:OCn@qB^T@:Cj.A7c8X
E+EQkDdtFm:IIclFE2;1F^oN-Df/6W@P2V1Ado)dA7f@j@kUGM6qh#uF(oMaF`;VJATBDBA7c8X
E+EQkDdtFm:IJ-"F`Lu'6Z6LH7!3?c;e'i^E--.p@:Cj.A7c8XE+EQkDdtG#F(oN)8l%iA@:O(q
E(=J]/oY?5%17&bAn5gi03*(-DJ)R;6rIT/F_kK,7<iclATMp,Df0VKE+EPi$?0NfA8bs2<HDkl
B1d)QCh\!&Eaa'$/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!+>=638l%ht
6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%htF*VhKASj%/
$4R>7:IH<nDe!p,ASuT4@;L"'+Cf>-FCAm$F!,F4Afu8.EcYr5DK?q=Afs]gE-ZP:EX`@nDffQ"
Df9E4+EV:*F<GX<Dg*=;Dg*=GD]j1DAKZ/)EbTH7F!+(N6m-)M@qfanFD5<-/e&.dAS!!+BOr;s
Bl[cpFDl2F3XlE*$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R>3
DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL
+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/
+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ
@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCpt
F<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-)
;H$._:-CWc0eP.41,9t(+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV
;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!
%16r\DJ<]oF*'$KC3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)
F`8sIC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]
6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2
+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*
Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*
Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s
$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm
@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"
ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0
AU#=i+EMgLFCf<1/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7
:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"
FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6
/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sI
C3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%ht
Cggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.
+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4
ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR
%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*
FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$?1$#A7]@]F_l.T0ht%f.WBECA7]@]F_l.B
F"JsdA7]@]F_l.BE,ol3ARfg)F(KH9E%VS,:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/
+:SZQ67sBjEb/[$ARmhE6tKk>D.7's+>PW+0F\@a67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO:-pQU@Us1_
F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p+DPh*+E_d?Ci^sH
%15is/g,(C+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-Dfp"A
/Kf.ZART?s@<3Q/AS#C`A.8l@67sBqDe*KfBkhQs?TgFm-YII<F`8];$4R>;67sBjF`MM6DKI"F
DfTW-DJ()5F_Pr/+>"^XG@b2u+CT=6DImBiARl5W:-pQUC2[X(?YO7nA7%J\+=D5QBlmo6%13OO
:-pQU@s)g4ASuT4GAhM;Bl7Q+Ci<flCh4_@+EVg=@;?uoF!,@3ARo@_%15is/g,7VB5DKr?YO7n
A7%J\+=CuD@ps1b-OgCl$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6
A1&L4ATT&C/g+eIE$-N@Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E
%15is/g)NUC2[W1+D58-+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g
3[\NPEZf(.@j`B.$4R>;67sC"F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARlp-DfTB0+DG^9FCB3&
ATT&2De!3lAISu7:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb
:4@U=%16Ze@<6!&-[U;;IXNRQ$;No?+EVX:Ci<fjBkhQs?Q`umF<DrXISP??-OgD3%13OO:-pQU
F(KG98l%htF`V,7+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F
-ZsKAE_BthF!,L7F(KG9/Kf(FF*(i2F<F0uAoD]4@q]:gB4Z-3%14M*Db*Z&<$47FHTE9#+>G!X
Bk(p$1a$FBF<DrAAS,@nCiiZuATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJ
AnNJ6%17/nDfp/@F`\`RA7]@]F_l.BE,ol3ARfg)F(KH9E$l)%E,o].De(UX:-pQ_E,o].De'u3
/M/)[De'u0Ec5](@rri7ATW'6/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATAn9%15is
/g+YEART[lA3(i3AT2a&D.7's+>PW)2[p*h67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)i,De!lD2]uO>
A7]9oH=gl-ATJ:f:-pQU0K<u\F>5Km@:Wn[A0=0:6V0j/2'?FPD/aP*$;No?+>>cn@rsF^+DG_7
ATDm(A0=0:6V0j/2'?sOFED57B-:o+FDi::De*BiFs(O<A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU
0f`cU@k]e`Eb0H8BlnH.DBNP0EZdss3A*!?+:SZQ67sB90Q(fP1,^7`A867.FCeu*AoD]48g$,H
0JXa[$4R>OA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F++=ATh-YdR1A7]p,
C2[W*F`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$;No?+CfP7Eb0-1+EqaECM@[!
+D5_5F`8HT+EVg=@;?uoF!,@3ARo@_%16igA7o7`C2[Wi4ZX]5C2[W1%13OO:-pQU@s)g4ASuT4
GAhM;Bl7Q+F*22=AKWQIFE_;)CER&,+Dtb%A7]9\$>OKiF'iWrDe*3<3ZoebDe*p+Deip+ATMs7
-OgCl$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4ATT&C/g+eI
E$-N@Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is/g)NUC2[W1
+D58-+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A%15is/g)NUC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt
-Qij*%15is/g,+UF>%lZAS*&:+DG_7ATDm6+Dl%-BkD'jA0=K?6m-\lEb'56Bl5&3@VTIaF<GC<
@ps1b%15L!6WHiL:/jSV9hdoK6sjYCDe*2t4ZX]60H`D!0I[G<F)>i<FDuAE+E2?D-[U;;IXNRQ
$>"6dF(HIAH[\_=I4#I2-mrFN/8B*6B4#@fDe*3(+D58-+=DMb:4@U=%14Nn$4R>;67sC%ATT%e
:IH=JF(KA7CLqd4+>"^VAT;j,Eb0;78g&.cCi<`m+EVNE@:OCnG%#K(%17/nDfp/@F`\`RF`V,7
94`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=CoBA8lR(<HD_lCLqd4-Rg0^
EbTW,+DPk(FD)dEIUd;6Anbm2F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+=BcW6m-GhDe`inF<GX9
FEMOM%17E-H>7A/D..-r?Z]k(1,:-u9jqaR+A,Et+=MP^H>7A/D..-r/p(ZL.3NG8FCf\>Anc'm
/g(T1,n12-+A,Et+EMIDEarZ'BlbD,Df'H3F(Jl)De:,#+Du==@V'R&De:,%CghC+ATKIH<+oue
%14C(Anc'm+CT>4ASkmmATJtd:IH=8CghC+ATJu&DIal$G]7SBBln96Gp$s4FCfK,@;HA[,p6o>
FDi:1+EM77B5D-%F)Q2A@q?cmDe*E%A8bt#D.RU,/e&.6%14C(@rH4'Bl%L$B-;;0BlbD/Bl%?'
Eb065Bl[d++E1k'CghEsGUst^ASbdsAU"Xk,n12-+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;
+DkP&ASH$mAU#>DH?s=EA8PahD@Hq!+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-f;+E1k'CghEs
GT\,TH?s=EA8PahD@Hq!%14C(@;L$sEc,<-Bm+'(Gmt*,%14C(+<YKC@;K@oAU#=?H?smPDe*]n
Bl4@e,p4<QD..3kBl7HmGT_<YH>7A/D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e,p4<Q
Cis0&@<?(*+<YuVH>7A/D..-r%13OO>\S(pF`_t&:IIljFCfK$FCe9hARTFbCh55@AU&V4$4R>I
@<H[*DfU1sDeO#26nTTK@;BFpI16NgFD5i5AU@[(AU&<=FF,6]INs#IEcYr5DBjUZ,9TTS7"$1V
Dfp)1AKX?YA7Zlg>Td9`Df9`8DffQ3BmO>5>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA1r%FAS!N3@<6O%E\D0GA8,e"I9^Z.Ec#6$F(or3I16Mm$7-g)Df'?"DIdf2AoD]4@:X+q
F*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(F(KB6Bl7Q+@3BT5Ch4%_>]XIu
Ch7KsFD-#+@rH1+D/OE+E.*'hASli)$=%X`FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%FF=T*
>]b1.@rH1+D/Kdi%16?LAS5^pHXq&)F_t]-FF=T*%16?W@;BFrBln0&%16?^@:F%aDe<KtDKKH-
FE7lu>]4Lk@rH1+D/Kdi%16?XATr*%B4VMZ>\S(pF`_tVH>7A/Dg#i+G:muKG^U#.%16?XATr*%
B4VMZ>\S(pF`_tVH>7A/Df.1LAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA1ht8G^U#.%16?X
ATr*%B4VMZ>\S(pF`_tVH>7A/F*)>@AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/D..3k
/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X*FD5PDFCf]F%13OO>]++sE+*Bj%16?SDK'`?
H[:!QDe*s.DesJIFCf]F%13OO-!Y>!GApu'AIStm>]4Lk@rH1+D/Kdi-!Y/%E-68LINs;SEc6)>
INs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'D@HqX@:WnYDf0Z.DKKr9Bl7L/
FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5Bl7HmGRXuh$=%.[A:%j*@s)X"
DKL:9$3                                                                   ~>
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
3&E?H3B8oM1E\G,1,(F<0JP1:0KCsL1bg[C+>PW+0ekF<0J51;2)R?N2)?pF+>PW+0JP:;2(gaB
1c%*I3B/cN+>PW+0ekF<0J51;2)R?N2)?pF+>PW+0JP:;2(gdA0JYC;2)dHP+>PW+0ekF<0J51;
2)R?N2)?pF+>PW+0ekF<0J51;2)R?Q2`EHM+>PW+0ekF<0J51;2)R?N2_d661,(I;0ekFB/i5FF
3AWNL0K(X.1,(I;0ekI</i>RA2*!BG1G^a.1,(I;0ekFC/i5OB1GC[E1H%*51,(I;0ekFB/i57=
1c7-M2)R661,(I;0ekFB/i>@;1GCL?1GU(.0JY@;1,1I81H.$E3B/`L3B&'90JY=:0et[?1c[HO
0Jk^K0eje+0JY=:0f(L91cI9M2`*6F1H-F30JY=:0et[?1c@$D0fCmE2`;d60JY=:1,(I91c76I
2_[!C0f1".0JY=:1,(I91c76I2_[!@3ADX30JY=:0et^@2)R*J3ArWN1-$I40JY=:0et[?1c$pC
1,(C>3&_s80JY=:1,(F81b^UC2`WZL2_lL20JY=:1,(F81H@?Q1b^X<1E\G,1,1L=0eb492_m'C
3AN?I+>PW+0JP:<0J54@3Ai]R2_m*D+>PW+0JP:<0J54@2DR'D2*!BO+>PW+0ebUB0eP=>3B&]P
2`3EP+>PW+0JP=:0eP::2D[$@3&NWR.4cl01*AD!1,(I;0ekFA/i>F@2)@'L2`EW;1,(I;0etF;
/i5@@1,C[>1cRE:1,(I<0etI;/i,LB2)-sC3&EB51,(I;0etFC/i>RH0JPI?2E*E71,(I;0etFA
/i5C@2*!WQ1c[<61,(I;0etF;/i5@A1H@6K2)@!11,(I<0etI;/i5RC3B&lS1Gpp11,(I;0etI@
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
2D-jD2).!L1,(C@+>PW+0JP:;2D-mA2E3KJ1Gh$M+>PW+0ekF<0J51;2)R?Q2E<QN+>PW+0ekF<
0J51;2)R?R1,CjG+>PW+0JP=:1+kC@0f:jJ2E<`Q+>PW+0JP=:0eP=B2)mNP1c.3Q+>PW+0ekF;
1+kF@2E3QK2)@'G+>PW+0JP=:1G1OD0f_!I2D@*L+>PW+0JP:;2_HmH3&EQJ0K1[@+>PW+0JP:;
3%d'C0JtdJ2)6pB+>PW+0JP=:2D-g@0fLdB3&ruV+>PW+0ekF;1+kFA0Jb[K3B9#W+>PW+0JP:;
2_HmH0f_3L2`ENN+>PW+0JP=:1G1LE1GpjD2_d3H+>PW+0JP=:1+kCA2`NQK3A`T91,(I;0etF<
/i5=D3AWTR2E<Q91,(I<0etI;/i5=@2)mHO1c[Q=1,(I<0etI;/i5=@2)mHO2_m031,(I<0etI;
/i5=@2)mHO2DHp/1,(I;0etF@/i5:<3&*<H3B&`:1,(I;0ekFA/i>IC0fD$I0JGF.1,(I;0ekFC
/i5OJ2E3NQ0fCj;/1<V7.4cl00I\P$4>838-p014/3GT                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
