NB. JOD dictionary dump: 11 Dec 2021 12:27:27
NB. Generated with JOD version; 1.0.22 - dev; 28; 11 Dec 2021 11:39:24
NB. J version: j903/j64avx2/darwin/beta-w/commercial/www.jsoftware.com/2021-12-05T18:34:44/clang-13-0-0/SLEEF=1
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

JODTOOLSVMD=:'1.0.22 - dev';28;'11 Dec 2021 11:39:25'

JODVMD=:'1.0.22 - dev';28;'11 Dec 2021 11:39:24'

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

et=:3 : 0

NB.*et v-- edit text
NB.
NB. monad:  et clText
NB. dyad:  clFile et clText

EDTEMP et y  NB. default edit file
:
NB. write to J temp directory - created by J install
try.

  (toHOST y) write file=. jpath '~temp/' , x , IJS

  NB. open in various editors !(*)=. IFJ6 IFWIN IFJHS IFQT IFIOS IFGTK open
  
  NB. J6 no longer supported 
  NB. if. */ wex ;:'IFJ6 IFWIN'  do. 
  NB.  if. IFJ6 * IFWIN do. smopen_jijs_ file return. end. NB. J 6.0x win systems
  NB. end. 
  
  if. IFQT do. open file  NB. jqt ide

  elseif. IFJHS do. 
    NB. show edit command in JHS to remind users to adjust
    NB. browser pop ups and keep a handy recall line
    0 0$(1!:2&2) 'edit_jhs_ ',(quote file), '  NB. allow browser pop ups'
    edit_jhs_ file  

  NB. running in jconsole on Windows systems 
  NB. WARNING: there is no indication of fork failures 
  NB. testing the existence of (EDCONSOLE) and the alleged
  NB. (file) for every edit operation would slow down normal use
  elseif. IFWIN *. IFJHS +: IFQT do. fork_jtask_ EDCONSOLE,' ',file

  NB. remaining editors are marginal, deprecated or rarely used with JOD
  
  NB. iPhone/iPad  
  elseif. IFIOS do. je_z_ file     
  
  NB. GTK systems are deprecated and no longer supported
  NB. elseif. wex <'IFGTK' do.
  NB.  if. IFGTK do. open_jgtk_ file  else. jderr ERR0255 end. NB. GTK 

  elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
  end. 
 
catch. jderr ERR0255  NB. errmsg: unable to open TEMP/*.ijs for editing
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
1,1R-1,0n-+>G_r1*AD02)cX50H`+n1c%'L+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>P]+0H`)1
+>P&p1GLj30f'q-+>Pc60H`,*+>P&o1H%*50f:(/+>GQ03$9q0+>P&p0ebIB+>GYp1*AD-0JO\)
1E\Fq2`!-J+>Gl!1*A;-1GU(.0d&4o3Ar]K+>G\q1*A;+1Gp:00d&4o0f1dD+>Gl!1*A;*0f^@2
2]sju0f(^E+>GPm1*A;*2`2^9+>P&o0f:p50f1".+>GZ+1J1G26<-TN6qBmJ<)6Cp1,TLJ:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#pj:-pQU<b6;mBl@lM+>GK&/i"Ol6?R!YA0=WiD.7's3ZpF*+@KX[ANCqf3?V(8Fs&Oo1,'h)
3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>GVo:2b:u1,(I;+>GT31,:mH2[p*'$4R>;67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO1,fXL$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo
1,'h*1-.6J3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp1#+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2'>Y4Fs&Oo1,'h*2**QQ3\rGs$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2BYb5Fs&Oo
1,'h*1-.0I3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh*G3]/l($49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2]tk6Fs&Oo
1,'h*0fh*I3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=ARci<
0JY=)0ebXC1HI?I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t0d%T,@<?'A+>G\q6tKjN1,(I;+>>c92)73J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+@KdN+>PW+0H`).3\W9L0JWtB$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg0d'D+
E$-ni1,0n+1-.9O3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.6+<X'\FCdKU1,0nI@rrhK0JY@*0f;!I2EEWN$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14
+AZKh+>PW+0d&2.3]&TQ0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh0d'8%F<E=m1,0n+2**QN3\`W%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K3'&`Q
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A
+>PYo:LeJh1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AZKh+>PW+0d&2.3]/ZR1,]IH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1*Atr@j!N\1,0n+1-.*L
3\W5p$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\
FCdKU0JXb=ARci<0JY@*0f(jH2EE]S$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp.2+@KdN+>PW+0d&/1
3\rHN1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes
+@KX[ANCqg0H`bp@j!N\1,0n+0KLpD3]/Su$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0eje=ARci<0JY@*0KD0O2**KN$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN1,(I<
+>GT31,_0I0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1,pC!6t(1K3Zp.3+@KdN+>PW+0d&2*3\rcW1,K>1:IJ/X:J=\R<CokP84c`Z:Jt=N2%9mf67sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i"P$+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>>eu
:2b:u1,(I;+>>c91,(aC2%9m%$4R>;67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#pj:-pQU<b6;mBl@lM+>GK&/i"P$+Co&,
+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GVo:2b:u1,(I;+>GT31,:mH2[p*'$4R>;67sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#pj:-pQU<b6;mBl@lM+>GK&/i#:,/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm+@KX[ANCqg3$:t7
Fs&Oo1,'h*1-.-G3\iW'$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>Pes:2b:u1,(I;+>GW41c%0L1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp18+AQiu+>PW+0H`)*
3]/`T1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqh2'>Y4Fs&Oo1,'h*2**QQ3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,^7MDg!6Y0JY=)0etdF1cdEJ$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pku:2b:u1,(I;+>GQ21,M$H3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1:+AQiu+>PW+0H`))3\rNP2)kpM$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2]tk6Fs&Oo
1,'h*0fh*I3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^G0fh$K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku:2b:u1,(I;+>GW40JPUB
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqf1*Atr@j!N\1,'h*0KLpE3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen5
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>G\q6tKjN1,(I;+>>c92)73J3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg
3?U_$@j!N\1,'h*2EENH3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>GSn;e9nj1,(I<+>GW42)mWN0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh0d'8%F<E=m
1,0n+2**NO3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t2BX,1@<?'A+>PYo:LeJh1,(I<+>G`71bq*G3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh0d'8%F<E=m1,0n+2**QN
3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
3$9>3@<?'A+>PYo:LeJh1,(I<+>G`71cRNM3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'8%F<E=m1,0n+2**TL3\`;q$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A
+>PYo:LeJh1,(I<+>G`72)73J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1*Atr@j!N\1,0n+1-.*L3\W8q$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>>Pn6tKjN
1,(I<+>GZ51H%9O3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P_q+@KX[ANCqf1*Atr@j!N\1,0n+1cdEP3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>GPm6tKjN1,(I<+>>f:
1GCjH1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pes+@KX[ANCqg0H`bp@j!N\1,0n+0KLpD3]/Su$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>GSn6tKjN1,(I<+>>f:2)REM2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqg0d&kq@j!N\1,0n+0fh'J3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u3$9>3@<?'A+>GSn6tKjN1,(I<+>GT31H@KO2%!/U;cI+=De*Zu
FCfK$FCd3^%15is/l5>B<*sBYA8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?+=Jfo.6T^$$4R>`D/XQ=
E-67F8Oc!576N[S-nlc)+>>5R$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3XlEk
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT6r-/m+<VdL+AP6U
+D,b4C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sBmDfT]/
Amo1\FCf\>+<Ve%67sBmDfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\
+EqaEA9/1e:-pQUB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is
/g+k?@:NkiARfgrDf-[?+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQU
BkCit+<VdL+<VdL+<VdL:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sC%ATV[*
A8Gt%ATD4$AKW*j67sC"Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F
+Eqj?FCfM9E,oMuD.7<m%15is/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2E+NQ&CghEsGT^U=
Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sC)DfTB)BlkI?+<VdL
+<Ve%67sBt@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLa%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$?U<6/e&._67sC'F(HJ&DL!@D
@;]Uo@j#i(F<G:8+EV:.+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAISu\AhG3MAU%QjC2[Wi
+?V#J;FO&D;GoqO:dIiE:IAK'C2[Wi-Qlr</g++a8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+Abs)
7R^3Q779s<:..lF?YO7nA7$HjDIb@/$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^@;^7"E]l#t4"u"(
4?G0&1*C[TAfrLCBOu!r+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-WEcYr5DC6kU/M8/5
;BTLg/e&.1+EMC<F`_SFF<Dr+:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAJtF`MM6DKI"EATDj+
Df-[G-S04FDK]T3/12khBlbD7Dfd*c4WlL43A*$=0ddD;ASu$2%16TRFCSu:%144#F)>i<FDuAE
+=BTU;GU1O+E1b,A8bs#DJsV>F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?RH9i
ASu$2%14Nn$<0eh:L?^i6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0De*L$@;omo@rj;F
De*cnC2[W8E,K;;+CIf;6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%
+D,P4+CIf;6psg<?nMlq<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[Km
FD5T'+E(j7@3BZ#F))3l@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5FE9&D$4R>M>@M/V
Bl5MEDe*cl?k!GP$8F.U?p%e-C3j]8B/44F@V0%m@rlNsFYR_e1cRF;?Tqj?6Z6j`Bk1dq+DG\3
Ec6,8DJ()(Df0Y>G@bK$BQS;<Bl5&4EbTE5ARlooDe!p,ASuU2/g+,,AKYT'DKI"DF(Jkk$6UH6
AoD]4F)Q2A@q?cmDe*E%@rHL+A0>>m+CQC/BlnH5AKYH#Ch.*t+>"^IF)Y]#BjkgoGp%3BAKYK$
Ci=?*A0>u*G]\!Z%13OO1+j\W4C;WEBQA-62fW;?1bs,eCc?EVGWBJYB4<i-5%#L(@<-4'DJ=E.
+Cf>#AKYK$Ci=?8+CT.u+D,P0FE8R5@rcL/F!+k,F*)54F*),6B6.H'@;]Tu?uTOlA8bsc+EMgG
FCBD:@rH1%EbTE(/e&.1+<X$oEcP`/FDQ4FFD,6,AKYr#@r#LcATJu:F(HJ)BkCsgEb0-1+D,P0
FE8R5DIal"Des?4F"Rn/%14mD+CI<=2KCK3D)lKRBR2FN@5g&cFEi%DEc#9!EF1n;+AucoBk;K2
BQ&);FDi:6F_kl>+D#D!ARlolCht57AS,LoASu!hA0>K&DKKqBBl5&4EbTE5+AbHqF"Rn/%14pE
+CI<=@qB4/H8%0lFD!OPD)cAl@q]g?0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&
@UWb^F`8IHATDj+Df0VF+EVNE8l%iC:I?`D$4R>"/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8i
F^e]A?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m
+D>\;+EVNEEcl7B8l%htFCfN8F"Rn/%16KIASu$1FDk].?!n*K<)5nX?V4*^?Ys=/2[p*;>AA(e
+EVO4D]ik1F*(\9FDk].?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^
:IJS5@;]TuBlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4
+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2
F!,(/Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4
AKZ21@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;
D..NtEbSruBmO>C%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=@l.k03H-]qEGR=J13dJRCc68n
EbTi1B4!i1+B2onF<G+.Eb/a&+Co%qBl7X,Bl@l:F!,16E+*6u+E)-?8l%i-+B3#c+Dtb7+Co2,
ARfg)A7]@eDJ=3,Df-\0@:O"fBlnVCBl5%c+DG_8Ec5K2@qB^(@3BH!G9CF1B6%F"BHU]0HXIt(
I=5KGA7]RkD/"*'A0>`#@;^-/De:,&AS,XoBl7Q+Bl7a$DIjr.Dfor=/0K+IEaj)@+CSf(ATD7$
+CT.u+Cf>-C3=E(FD5Z2F"SS0@;BEsF*2M7+A,Et+Ceht+D>2$A8Gg"@;Ka&FD,6,AKYl%G9CL9
Ec#kM%13OO1+j\W4C9dVAS$.'H=]!FFu2.$Bl.j93-&qQ2.L?-5%#L3Bl.R#@<-10+DkP&AKZ&:
Eb-A$C2[X!Blmp,@<?'g+EqaECNCV1DfQt2Bl[cpFD5Z2+Co%qBl7X,Bl@m1/0K"FANCqV>@:E+
6r.0)De*ZuFCfK$FCd(AA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9
D..L-ATBG=De*ZuFCfK$FCd+):IIucC2[X!Blmp,@<?'5D.G(J%13OO1G0eX4C9m!F?!fLApA-;
E-6;3Ao)O4DfI]q1iRD@5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BEDIal+Bl8'</g+,;
ART?sBkAK*AS#C`A1e;u%14pE+CI<=2`GZ$ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4
+CT.u+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1
F"SS/@:F:#BOQ'q+Cf(nDJ*Nk+DG^9Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%14sF+CI<=@qB4/H8%0l
FD!OPD)cAl@q]g?0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^F`8IHATDj+
Df0VF+EVNE?qO3_FDl)6F'pUC<+oue+Eh=:@N]B++E2@>G%ki,+EMHDBOPdhGp$gC+EM47F_kS2
@V$[$@<-H4De:,6BOr<-FCB&t@<,m$F(KH9E%VS,%15!G+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;j
F?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9m
Bl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$9'R[?p%dS0PiX^CN=E13AbD`1LbJ]H?j"@@qoj9
?Tqj?<+ohc@!-R*Ci`u,G%G]'+CJeoEaU"<Anc-n+D5_5F`8IDDf9`=.3N/>ATJu3Dfd+1E,]As
EZfIB+D>2$A8Gg"8g&"[D.Rc2GA2/4+E_R4ATDj%DfTE1+CJPa+E2@>E+O'+GqL42DK]T4FD5Ar
FCcS'DIal%Bm;6Q:/=hX3ZqgBB6%B&BlbD7Dfd+1+E1b0F<GL6+A,Et+C]J8+DGm>G%G]>+D>2$
A9f;ABOu'(@rc-hFD5W*+CT.u+DkP$DKK<$DJ=!$+=^l;@<6K4B6%p5E-!K]%13OO3%c=]4C;T>
1N[/E3,rgp0kG0GATD9mCbR\aFu<r?5%#L#Df0W1A7]d(@:Wn_DJ()#DBNA,E+NotBm:bBD]iG&
De(J>A7f3lA7]glEbSusDJ()*Dg*=EAS,LoASu!hF!,17F(o/r+Co2,ARfg)A7]@eDJ=3,Df0V=
@<,p%BOPdhCh7-0%13OO3A)F^4C9pS@V'h.E+q7U2fpo61NPO%Cbp6P0PNOS5%#L#Df0W1A7]d(
@:Wn_DJ()#+CJYhBle6$+Eh=:@N]c+@<<W9Dfol,+EqaECERG-CLnVrA8-+(?m&p$F<GX<Dg*=B
@VTIaFE8R=DBNCs@r$4+F"Rn/%14gD/g+Oa?Xtm%FCo<!0f4/pG&1T/DI[?8E+(V;GAghP?m%gT
DKBN&ATAo%Ci"$6Bl7Q+@"'b:+CT=6@3BMtFD)e9Eb/isGT^pB+DkOs:K&BEDIak`Bl8'<+EMgL
FCf<1/g+,,AKYZ)D.Oi#Bl[cpFDl2F+Cf>-G%GQ5Bl@l3Df-\>BOu6r+EMgLFCf<1+DGm>Eb0<2
ARfgnA0>?,+CJ_oEaUL/$4R>M>@h\_/TboADd?`[$<0eh:L@jTA8Gt%ATD4$ARB:b1,fXL+^8]"
A0>]&FCfK$FCcS2Bl@lp-u!R/Cisf5Df0VLC2[X!Blmp,@<?'sBl@m*BlnH5AM.q>B.75'De*Zu
FCfK$FCei&<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(n
DJ*O%+D,P4+CJr&A8Gt%ATD4$ARI,"$4R>MC2[X!Blmp,@<?'g+DGm>@3AcH01o#.>psB.FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM5JT@r,RpF!,+9Dfp"A
FD,*)+E2@>G%kJuEt&I\Ch\!&Eaa'$+E2@>B6%EtD/!m#>psB.FDs8o05P?EATD4$AT2[.B6%Et
D/!m#/n8g:055<7AU#h@FDYhC+EM[EE,Tc=%16]cEZdss@rGmh+EMXCEb/c(Bl5%c:IH=9Bk)7!
Df0!(Bk;?<%13OO<+oue+CoD#F_t]-F<G[G@:O(o+E1n0A8,po+CT.u+Cf>-F(o/rEb/c(@q]:g
B4Z-,AoD]4?tsUjCh\!&Eaa'$?nMlq<+ohc@UX=h+>Ynu@psFi+DG_7ASuR'FD5o0+@fF'6m-8V
Gp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+A$YtF`(o5F_,B7%16o[@V'@s
+D"tkBHVD*F))n,DIal,@;BFq+DGp?E,Tf=Bjtmi+Cf>,E+s-"+Co&*@;0OhA0>Aq@;]^h+D>J1
FDl26ATJ:f@X0)<Ec5c1Bl7Q+Dg#]4+EV:.+Eh=:F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AM+E!
%16KI@V'1dDCosKA8ba]%13OO0eOSV4C9sk2/H_ZB6J!%G'Z)lG'%m_@PDp\0JG:i5%#L2AThd/
AKYE!A0>u*F*&O:DfQt2Bl[cpF<G+*Anc-sFD5Z2/g*b/3A*!@+DG_8Ec5K2@qB0nA8-'q@rri(
AS,XoBln'-DK?6o+<VeKBOQ!*@<,p%A7]RkD/"*'A0>?,+CKPC?m&j*I:+ZM<+ohcA8,[s@;on$
+CT;%+CT.1AU%]rE-,f4DBO%>+A+#&%144#+DG_*Ch7*uBl@l3F(8lpD.OhuDIal6Bl%T.EbTK3
Ch4`2BQA$6B4rDrCht4d+Cf>#AKYr#EcYr4B-;;7DesJ;Bl7EsF_#3(B+51j+<Y',De*ZuFCfK$
FCei4%13OO1+j\W4C:$'G%Yl91j(X#G;EZED09PI2.L0.@=!$&5%#L)DK]T4FD5ArFCcS=BR(_C
DId=!@UX:"@q]:k@:OCjEcW?G?sd:aBl5%c:IH=<Ec6)>+DtV)ATJu'Eb/Zp+A?3CAQU'oEc5H!
F)u&5B.b;rDfQt<Dg*==F`VX6$6UH6A8c?5F<G^IAKZ,5A7]dj@<*K#BOPpi@ru:&F!,17+D5_5
F`8I@@;TRs/e&-s$8X:W?p%dSFD><1BeqG&F)5MG2_o5YDK0i22dn[S?Tqj?6Z6gYASuU2+EqOA
BQ&$8+EqL5FCfN4@:Nk"+D!0</g+Os68!.o+EML1@q?coBP:crD..]4DJsV>@rH1%EZf=ADfB9.
Cj@WU<HD_l+CIr2/g,4S@:NjkE,9)oF(J`3%13OO1bKnY4C;PTF*D,:C3F-51j=(fG'%DACGdq)
An,Xa5%#L3H#@_4GT^L7Ci=?.DJ()1Afu;<@;p0sA0>?"G\(D.BOu9sEc5T%DJsZ=+CT;2@<lo:
D..]4DJsV>@V$ZlDfTl0@rs=4$6UH6IXZ_T$6UH6+<VdSEHQ2AARlp)FE2)5B."f`+=KGs1,'h+
0I/A,0I\,++?MV3EHQ2AARlp)FE2)5B6,2>Bln#2DKTf-EbT$)-OgD*+<Z,^ILQVn$8jFY?p%e4
BJF@B0fF/0Ecj0PD)?*Q2_f&cG@G`&5%#L3Bl.R#@<-10/0K.W@;p1"DJ()0Df0H2F`)7CGA2/4
+Dbt6B-:c&@V'(\ARlp'F`2A5A0>r8EbTE(F!,=.Gp%!CF<G(3Ci=>:E,ol9ATDU43XlE=+<Z,^
ILQW,+<VdL+AP6U+A#Ku:+\1V+Cf(r@r$..D%-gp+<VdL+<VdL?T9_^?!JL_Ble59-YY:k@q6qr
$6UH6+<Ve@0f*<M4ZXrE3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU
2)I*E0ea%D+<VdL+<W[(2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM
1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ea%D+<VdL+<W[(2`<NM1GU[=3B/rU2)I*E
0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E
0ea%D+<VdL+<W[(2`<NM-QmaYINU?f1E\Cp1E\Cp1E\Cp1E\Cp1E\Cp1E\2$+>,,d-SR811GgsI
2`NfF+DEGN>n%,`+<Z,^ILQW,+<XET<(/hj9Q+f]+Dbb0ATJu&Eb-A;Ea`p+ARlomAS,k$AKYW(
Bl7Q+FDi:@@;]Uo@kJm'BPDN1@ps6tCh7$c+EVNEE+*WpDds4`+<Ve8F)u&.DJ=!$+DG_%@q0Y%
@<?''FDkr+DK?qBBOQ!*@ps7mDfd+2AKWI6@<6.!Gq'qU@<?!mARlolAoqU)G@>N&F"SS)Bm:'o
+<VeKBOu6r+DG_*Eb065ASuT4DdmHm@ruc7GA2/4+DkP)F^])/9OUn3=<M0cBlnDW+EM+*+CK>9
CghEsG\1u?DfTB0?nMlq%16KIASu$1FDk].?!n*K@WcC$A86$nCghEsGVV!K67s`sF_PZ&C2[X!
@<?(*+EK+d+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T/a%15is
/e&._67sBMBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+CoD#F_t]-F<G+.
Eb/a&DfU+U%15is/e&._67sBhF)uJ@ATKmT@s)g4ASuT4G%G]8Bl@m1+E(j7E+*WpDdsn<E+*Wp
DdsnF/ibO=/hnJeEZf1,FCfJA%15is/g)8Z+<VdL+<Ve:BOt[h+Du+?DBL?,84c`V5u'gD6R`HO
:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sB4/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'D..]D1*CUKG%l#/A0<:HH?s=E
A8PahDI7KsGUX(/:-pQU1,*QRGqh&s.!g2cC2[X"@;0U3@UX@-+CSekARl5W:-pQU1,*QRGqh)t
-no.IARTIuAU#b8@<<q@@:Wn[A.8l@67sB90Pt6D0fU:dBle60@<iu)F_PZ&+C\c$+D,P4D..O.
ARlp*D]j(CD@HqJ67sB90Q(fP1,U1_A7T7^+=LuCA7'7uBk;KqFCf\G%13OO@rGk"EcP`/F<Dr?
@<6!-%17,eEHPu9AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=KCghEsGW@cE
?Q_Km+=BH@6#(=KCghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEsGW@cE-OgDmDeX*1ATDl8
+=Cl<De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$;No?+D,2,@qZu-@WcC$A0?#:Bl%L*
ATJu&DIak^:IH=>DKKH1Amo1\+Dbb5FE7luFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+C\noDfTE1
FE/L6BOPdkATMs6+A,Et<_Yt)8U=!)6tpO\ATDBk@qAS<5u'g6;FDX!H:gt$FDl)6F&Q%(:..BG
6m,'I8l%itFD5W7ATDBk@qAS<5u'g6;FDlA$4R>;67sBjF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9
@s)X"DKI"3Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj+F?.r/jrN%<(LA';cI+28l%in
@VQ>Z-VA;jDBM>"+@9LPATB.@F(KH.De*ZuFCfK$FCcS*Dds4`%17,oDfg)4GWe)1-[L)bC2[X"
@;0U,%13OO:-pQU-[L)b-Qm87CLqQ0FD,B0+D,>.F*&OCDBNt2G%G]8AKYMtEb/a&DfU+GAnc'm
+DtV)AKZ&4Ecc@3$7Bk(+EV1>-TsL59gM-E:L@OFDe*2tB4Z0-Ec5l<FCf\J-XUt,GUEq-FCf\[
3ZpM23\5AaGRY"%AU$@!+=JTj,CY(dG%G]8Bl@l6IXWLp-S.>5HV.(%<_Yt2+Cf(nDJ*O%FE/LG
AU"Xk.!0B"+EV1>.3NhTBlmo/A8bs/Ec5l<FCf\J-SBLPGUEq-%15is/g+b;FCSu,Dg#]4G%kN3
+DbJ.AU#>+DIal"Ch7$q+DG_8ATDBk@q?d)AU&;+$7Bk(+E)FFAU#Rc3Zq-_6W-]e@;9^k?Q`um
F<DrGDe*3nG%kN3?Z]k(-OgDsAmo1\FCAfF3Zoe4.k?!^De*Qo@:Nkr/M0.6%17#sFCf\[3Zohb
Amo1\FCAf)@V'.iEb0<6EZdGj3\52mFCf\G/88^)@qBajB+51W$;No?+CT5.ASu$$@s)g4ASuT4
Bl8$(Eb8`iAKZ&*@ruF'D@HqfAmo1\4ZX]=3dr3#/kL@]:IJo7FCfK)@:NkI<'a8I5uL*%8U=!)
7!*?cCi`NS5u'g6;FE'-H:gt$F`_>8FCfK)@:NkI<'a8I5uL)[$?(*0AU$@!+E)FFAU#aS1*]I^
.4clZDfT]/Amo1\FCf\>C1^maALT/c,>:Q9$7L"78g&%qFCf\G+Eqj?FCcS*Ddt=GH?s=EA8cX*
ATobKAU#R3$4R>;67sBQ:IH=8CghC+ATJ:fC1D'C3ZpLF-YdR1Df-\4De'u*De*p2DfTD3C2[Wn
Ddji(De*]nCLnW'De+!4Bl"o,De*s.DesJB%16onGWe)1B6%p5E,8s)AU#OS4s4TMC^g^\$;No?
+EM+9+DG_8ATDBk@q?crH#R>8Eb/i*FCB3&ATVu&$>ag/4ZX^#Amo1\-?Ea?BkCd`ATV@$B6,CP
4s4Z`GRXuh$;No?+E_a:+=DJ]-QmAKAS,Y$+EVNE@<QR'A0>Au@<6*nF!,[@FD)dEC2[W1+>,9"
A8bt#D.RU,+D,>(ATJ:fFCf]/Bl%@%4ZX]64CiA?.3L/g/j:C+4=>H$-Rg/h-8%J)C1D'&/1)u5
+?V#(FCf\E+:SZoFEepPEbTW,-8%J)FCf]/Bl%@%%13OO:-pQUB6%p5E$/V4Bl%<&@UX@gBHVA+
EbTK7+>"^P@<?(*+E_d?Ci^_@BOQ!*@rH4'Bl%?'B4YslEaa'$A0>JuCh7Ys$>OBdF_PZ&FCf\[
/g)Pi07G-pB6%p5E.0$\0./;kDf9`>AU#XH@q]:gB4Z.+EZdtJ6<-TN6rZTW%14M*Db*Z&<$5pl
@WcC$A9;C-.3NhTBlmo/C2@@%Bl%<h@<=Xb+CoD#/95ZIFED)=/13&Z@<<k+$?L'&F`_SFF<DrP
BOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL-RU8h+AP6U+AbHq+Cf>,E+s-"+C\c$%13OO
:-pQUBOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>D/^V0Bl%@%%14J'
@j#Z4F=044+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+$7L"785E/`+?Op2/8fWQ.3NhT
Blmo/A8bs/-SR5aCh7$mFCf\L@UX@+%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6#(=KCghEsGW@cE?Xe.lCh.:!A8Gt%ATD4$ASbdsAU#sb:-pQ_@WcC$A86$nCh\!&Eaa'$
CghEsGT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[NqFCeu*C2[X!Blmp,@<?''F)Q2A@q?cV
@8pf?/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF+Co1rFD5Z2@<-W@F!,"3
@s)X"DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1+Eh=:F(oQ1F!,C5+E1b,
A8bs#-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL@q]F`CERM5F`&<M<(KSZ
:dIiE:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8FCB&t@<,m$
8g&(nDe<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+
0Pt6D0ea%D:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB90Pt6D0eskmBQ&);Df0B:+=LuCA8Gt%ATD4$AM.G#F=@Y+:-pQU1,*QRGqh9$
A8-+(CghT3@WcC$A0>>iF<G16Ec#6,FCeu*FDi:BF`%Wq%16T`@s)g4ASuT4-XpM*AL@ooEb065
Bl[c-+<W%HDe*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eO
De*ZmFCf\W3B8H0>9IEoATD4#AKX)_5s[eODe*ZmFCf\W3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDm
DeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;67sBjF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKI"3Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj+F?.r/jrN%<(LA';cI+28l%in@VQ>Z
-VA;jDBM>"+@9LPATB.@F(KH.De*ZuFCfK$FCcS*Dds4`%16`gE,K*$AN`'s-YdR1Ch\!&Eaa'$
-OgCl$;No?+D58'ATD4$AKYW+Dfp"ACghEsGRY!pChI<s4ZX]uEc>i/F<G4:E,K*$AIStoEapdG
C2@p/Dfd+:CijB5Ch4`(Ci=K2ATo83Ch%BoAKY`(@WcC$A7Ath-TsL5C2@NoD@Hp^$;No?+D>2$
A9f;,@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5+EV1>05P'=AU#>>ASlB/Anc'mEt&I(EapgHDK^+L
4ZX][5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>AKYN%
@k8u]0Onp1@;^0uGV3H6F=.M)%15is/g,%?D.RNpF)rIIATD5h$7I\Q3Zp+*+ECsG+=\udEapg5
$>F*)+>GH/Gp$X9/e&.1+EMC<F`_SFF<DrPBOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL
-RU8h+AP6U+AbHq+Cf>,E+s-"+C\c$%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4rB4YslEaa'(
DJ((c@8pf?+>#c"-Tbs]E,K*$AISuXDIb@B+:SZ,%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6#(=KCghEsGW@cE?Y!_[@<HC.<HD_lCLqd41,Vfn/g,:XATDQtH#kTJAnMP[
:-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq
01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-
B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk
67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2
F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2
D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J
;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$Hm
Cb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$4R>;67sBOASuO6-Z^CS@Wcd7/Tk]BGp4@k/hf%'
GAhM;@<-:/DIdet$;No?+?:T+1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b
3ZpF+3\iZB-Rg/h+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a
-RU8h%15is/g*.t3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA
/9,fNFCcRT+Z_A:,VTZ7%15Q[4#&fpASkjkAKX?_EcP`/F?:jF8PN#(Eb0)rCLnVuF`MM6DKI68
$:AoUCb%t14#&fqATT%^F`MM6DKIrf:.\/V+EM+9+CfP7Eb0-1-OgDMFE21J;eTlWF=Tg94#&fb
F_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1
%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<r
ASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`
-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ77Q*=_4&fd4F<FM!DeioG-Vd6-:`sgr
Deio,FCfN8-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1a9F*)>@H"q8.
1,fPQASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+14Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
$48"&,9S]n0J5+9+>"]a:MjfUEc5h<<ag#_@;^007:^+SBl@l3GA2"F$47n*+<Y'#@Wl--@;Ka&
@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&A1hh3AmbrQ+=\KV@!-O%A7Bgl+Eq78+DG_'
DfTl0@ruO4+D#e-Cis9&DJ()0@;TRs+EqOABHS[0-Qm,@+ED%7F_l/@/g(K.+=\KV6tp[Q@rri$
H[B-C/hSb!@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=ARlo8+EM+*+CJr&A1hh3Amc`($6TZu
.Nfj&A8--.@rH4$@;]Us+Co2-E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:EcW@FD]iJ)Ci=M?
@WHC2F(KA7E,T\<F`;CS$48"&,9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]
ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<$47n*+<Y',De*ZuFCfK$FCei&E+*WpDdtFo@8pf?
+C\c#ARlooDe!p,ASuTuFD5Z2+EVO?C`mk>A79RkA1SjEAS!n0$6UH6+BqieBl7Q+C2[X!Blmp,
@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,
@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OVWk+=\KV:1\Vl6#C%VDf-\:EbTE5ARlopA8-."
Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO3
3))/$6;:3C>qQI,+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5DBNk0+EV:.+Co2-FE2))F`_2*+CJr&
A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_X2+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq
+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%ht+<VdLF(Jd#@q[!1
Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M
+DYP6+CIMi3))/$6;:3C?j[5c,9n<c/hen4+>"^1@<,jk+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.
@qfgn+@TgTFD5Z2.1-D).Ni,6De*@#@V%0+@rG`t@;]Tu?tsUj@s)6l/oY]@?t!SVARmD#+<VdL
$6UH6+EM+*3ZqgFE+*j%+=DUk@:WneDK@IDASu("@;IT3De(M9De*Bs@jbXk$6UH6+B<JoAp%o4
AoD]4F(KH8Bl7Q+:K&BM@rH7++EV:*F<G%5@;]Tu8l%htA8-'q@ruX0Bk;?<$47n*+<W(RATVC(
Bl%<jBl\8D+Dl%-BkD'jA0>u4+CfG'@<?''@;Ka&FD,5.A8-'q@ruX0Bk;>m+<VdLEb065Bl[cq
+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEsa$4+<Y`:
FED57B-;>9+Dtb7+DkOsBPD?qF!,(5EZeh6Bl%<oDJ((a:IH=6A7TUrF"SRB$6Uf@+CJVgA8H0m
A927$BlJ/K?m'?*G9CU;F*2M7F!,O6EbTK7F!+n%A7]9oFDi:0IUd;6Anbm_F*(i2FEMOTBkh]s
$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:8H#,9n<c/hen3+>"^(ARf:g@V'R&3@l:.0JPR1
-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALRrn+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj
/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&$6UH6+E2.*DJj#r+A,Et+D,1nFEMV8F!+n3AKYK$
D/a<&FCd'I7WNEa+Du+A+E)-?8l%h^+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];+E(j7@Wc<+AncL$
F!+n/A0>f0FD5T+H=:o0Df0VK$6UH6+B*Aj@VKXmFEo!CF!,@=G9D!@AKYW(@;IP'$6Uf@>@:oQ
ATV<&8p,)uFCfJ89OVC9-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%
E\D0GA8Z=-AR]RrCND./F(oN),r./H:IHKa0LB2XCNXSB1,)40F=q9HH#@(?$47n*+EMI<AKYhu
@rcL/+CT.u+EV19FE8R5A867.FCeu*FDi:CF`;;<Ec`EY3$C=>+Cf(nDJ*O%/d_q..NiV?G9C:&
B4Z0m+EV19F<G(%F(KD8Bl5%c:IH=HDfp)1AKYMt@ruF'DIIR"ATKI2$6pc?+>>E./ibpP+>"^%
F_>i<F<E>!/0H]%0f]RJ+=\LQ@<?!m+ED%0ARTXk+D,>4ATJu8FCB33F`8I8@;0P#Eb-A*DfQsm
+?;&.0d'q:FC?b7+CT.u+C\o-Df0)<$47n*+CIo0=AD.V7:76PDI[]u@<6!j+EVNE0et^2Ao_g,
+>to++B3#gF!,F1Ea`frFCfJ8@rH7,Ec5c8+EV:.+DkP3Bl/!0$6UH6+DbV,B67f0De:,,+DtV)
ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhL/+<VeM@;L'tF!+q'
FE_;-DBLYV@;]Tu1,UpA$47n*+<Y'4D."n;?ug@2?m&lgC3=T>ARlp*D]j+DE,]`9F<G(,@;]^h
F!,RC+CHo`+Z_Gf/d_q1,9n<b/ibOE3B/-5+@]pOEckf2Gp"gu/0H]%0f^@)<affUDKKT1ALDOA
6t(?i$47n*+CK57F'p,)D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3AmbrQ+=\L<?ugL5?m&'aE-ZP:
EZe%a@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[X#DffQ"
Df9E403*(-DJ(7N0M5,/,r./PAS6.%@<*YL0L^5*Eb0<5Bl@m1/no9MDIP%%$6Uf@8p,)uFCfJ8
DJsW.@W-1#+Eh=:F(oQ1F!,C5+A,Et+DbIqF!,O8ANC/@+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC$48"&
,9SZm3A*<P2BXRo:LeKb@V'R&0f1F(1,(FB$47n*+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&
A1hh3AmbrQ+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK$47n*
+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMcn+=\LA
779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'
ARlokC1D1"F)Pl+/nK9=?m'#kBln96/d_q..Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1
DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2:-+<VeKAU&;>BlbD<FDl22A0><%
+C]V<ATKIH<+ohc@rGmh+DGm>@3BAp@V'@.+A$Z&F!,UHAS-($+EVNE@;p1%GmYZ:+<Yc>AKYet
@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>
/d_q1,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm.$6Uf@@:Wn[
A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q
+EV%)/d_q..Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.
FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI2$6pc?+>>E./ibpJ
+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1-D).Nh&hBOQ'uDfp(C
De:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:956+Ad)mDfQtBD]j.8BlbD;
ASbpdF(HJ7ASbdsBm+&1Ec5l<+D,P.A7]e&+EqC;AKYQ/E+*WpARl,j+<Y*1A0>u-ASrW!A7T7^
+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T($6UH6?uoguBlJ08?m'9"
DIml3Ch[Zr3XQuP+<VdL+<V"6+B2oSAo^slG\q7>+@A1C<HD_lF"_9HBPoRZ0JG.pDe(M3De!iA
F(96)E-*a4AQWPb=)`D$CbBF:Esa$4+<VdL+<V"6+<XEtG9C:.E+*j%?m$q/Df00$B6A6+A1A^C
FE2)5B6,2(Eb-A2Dfd+5G]7)/A7]9oEb0<7CijB/B-:o++:956+CK8#EbTK7F'p,,Bl7L'+Dbb-
ANC/@+<VdL+<Vd6+<XWp=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'_)+:956+B3#gF!+t2
DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E;+<VdL+<VdL$6UI1Ci=D<+<Z,A
A7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A$6UGu+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o
@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%$6UH6DJs_ADf-\6BkCp!F*2G@DfTqP
$47n*+CK(qD.R3cFE:h4@q]:gB4YTrFDi:6Bm:b7DIdI%ARfg)D/"6+A0><%F(o9)D.RU,+D#S6
DfRH;+:956+<VdL+<XEG/g)QTCi<d(.3NhCF!,('Bl%L$B-;,1+Eh=:@WNZ.Bkq9&FD,B0+:956
+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&W+:956+<VdL+<YN8G\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%+>b3%+>=-F+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2$6UH6
+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"(+<VdL+<VdL.1.1?$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<
FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0$6UH6Dg#]4EbT&q+Dkh;
ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!,+<Ve@F!,UH
ARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D$6UH6$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.
@<6L(B5VQtDKKqB-p0O>4ZWom+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l
+CT.u+D5M/@UX'[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gj+<VdL+<VdL-tI3E
4ZX]r@<;i!+:956+B3#c+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8
De*E3+A[/lEcPl)AKYK$D/Ej%FE7d3+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)
+EV:2F!,F1FED)7DD!%S+:956+<VdL+<VdL$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA
$47n*+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB
6jb%Z+<YB9+CJqoDf0W7Ch551G\(8*F(KE6Bl@m1/g+)(AKYAqDe+!3ATD:!DJ!Tq@UX%)Bkh]s
$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRB$6UH6+<VdL
+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?
DBN"pDId[0F!,OLF*(u1Esa$4+<VdL+<XEG/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>
DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71DKB`4ALqD;ALRs/+<VdL+<Vdq6pjaF;bp(U?X[\f
A9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!^)
+=\KV?tsUj/oY?5?m'T2A79RkA1e2r,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4
Bk(^'$47n*+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>
F<GI>G7#H8+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6AKZ,7
A79RkA-sG%+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/d`^D+:956+<VdL+<XEG/g+_9BlkJ3DBNq6
Bk1c^+<VdL+<VdLARlo2GAhM4DIIBn-OLt=+:8H#,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?
$47n*+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufgu
F_Pl-?j\#!+<YN0Gp%!CF<G".G@>c<+D#e/@s)m)/d_q.+<VdL+<VdL+<WB]E+rft+>k9[A0<6I
$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM$6UH6+<VdL
+AP6U+ED%5F_Pl-+=Cf5DImisCbKOAA1%^,+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<
-OLt=+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..)L+<VdL+<VdL+<VdL+<W9h/hRJ<
,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?$47n*+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3
Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC$47n*+<YQ5G9D!=F*&OG@rc:&FE8R5
A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k&$6Uf@?tsUj/oY?5?m'T2
A79RkA0>K&EZeb!DJW]5$47n*+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-
D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;$48"&,9SZm3A*<O0H_qi6$6g_F*&NZ
/0H]%0f9:\+:95@+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/
ASrW4BPDN1FCAf)BlbD9Eb0<'DKH4.+<YB9+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#
ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nrDJ()5BQ%p5ASu'i/g(KD+<XWsAKZ)'B-:S1/M8J8
3aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD\s+<VeN
DfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3k
F!,@/D.Oi"CghBuATJ2$+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj
/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[IU0+Co&)@rc9mAKZ).BlbD,BOPdkAM,)4$6Uf@Ddmd+
Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/d_q..NiP9EbAr+
DJsZ8F!,L7D/XT/A0>K)Df$V)F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]9$6Uf@?tEkV
+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRB$6UH6
+<VdL+AP6U+D,2,@qZuo@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:'-5+<VdL+<W%P
@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OLt=+<VdL+<Y6+
+Dt\2$47mu+<VdL+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:'-5+<VdL
+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKf+<VdL
+<VdLARlp$@rr%b+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs$6UH6+<VdL
+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OLt=+<VdL
+<Y6++Dt\2$47mu+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]Tu
ARoLs$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG$6UH6+<VdL+D#(+DI[bq
$48"&,9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!2$6Uf@
5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2
FC655D[IU0+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("@<?(%
+CoV3E$043EbTK7Esa$4+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-h
FD5Z2+CT.u+DbJ-F<G(,@;]^h$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&
F<G:=+EDUB/0JYK+ED%7ATVu#+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pM
DJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W#+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9CCghC,+Cf(n
DJ*Nk/h.td$47mu+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,u@/+<VdL
+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT6D+<VdL+<VdSEap5)FE8fm3Zp1#?SOA[
B4Z0-I4cWt+ED%:D]gDT$47mu+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOA
BHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]T_+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&
@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA-rYd+<VdL
+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=$6UH6+<VdL+>=pF0f1"lF`\aM
FE8Q3+<VdL+<VdL1*BpY1a$a[F<G4<F!)S4+<VdL+<VdL$6Uf@5p1&VG9C:(E-#T4?m'DsEa`fr
FCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^M:-+CoV3E+s3&+EV=7ATMs%
D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+2+<VeKBl.F&FCB$*
F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig",
+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.
A0?)1ChsG$+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8
Bl@lA$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAq
D..L-ATBD;C1^ir$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08
/g+)(AKYAqDe(J>A7f3V+<Ve=DfQt;DfTD3A7]jkBl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,
?m&lgA8c?.FDi:7ATT%%+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(KD+<V"6+<VdL
+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Ce+<VdL
+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7d3+<VdL+<Ve;E-#T4+=C&U<'a)N
5t=?k4#%'L+<VdL+<VdL:-pQUA9Da.+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-
E,u@/+<VdL+<VeD@;BEs-RT6.+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cq
D.Rg#EZeaf:JXqZ:J=/F;ID*a+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'
@<?0j+A*bdDf00$B6A6+A0;4%+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.D
FDi:DBOr;oC2dU'BODrpDerrqE\7\A+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9C
BlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cg+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%
+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE$6UH6?rBcr<(9YW6q(!]+DGm>
@;L"'+CQC1ATo89@<,dnATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl48#+<Y3/@ruF'DIIR"ATJu(
Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:8Gu+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Ce+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7M
D]iI28g%V^DJ!TqF`M&(+D,P.A7]cg+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0G
A9)U,F=.D&+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.
+A*bgDerrqEXEp3+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'$47n*+A$EhEc6,4A0>H(Ec5t@BOPdh
Ch[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMcn
+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4
?m'0$F*(u%A0>f&+CK87AU%Si+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555
C3*bi$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;
@:WplAoD]4@q]:gB4Z-,FDi9o:IHfB$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6
+@TpU+@TgTFD5Z2.1-D).Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<
+EMgLFCf<1/d_q..NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:g
B4Z-:$48"&,9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2$s[5.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>
@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A$6UH6<c;esD.Oi2BmOK2
B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]T_+<Ve=@;0O#ASuU(Eb0'4
+E)-?,%GG-F^u[=E,8s)AoD^,F"Re,+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p
/0IYq@k8`rBl8'<+EMgLFCf<1/d_q..Nh,jE+NotASu!h+E)-?@!ZF!Ch7Zq+CSekDf-\<ASl@/
ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Blj\)+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWp
AM+;s+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2
/g+,,BlbD<Bl7R"AI9P&+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WGFD,5.?tsUj/no'A?m'!&D/^V=
@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:956+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXC
Eb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XQuP+BrT!A9;C(F=q9B
F'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$K
C3(g2$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"DKI"/C2[W8E+EQg/g(K.+=\L'DfQt;
DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:'-5+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N
.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]G
F(oQ1/MJb:/NGaC.1.1?+:9><,9SZm3A*<L+>"^.F`(b51,UU*1,(F>$47n*+CJc*FE:r1E+O)u
+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC/@+<VdL+<Vd6
+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf'@+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>$47mu
+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@$48"&,9SZm
3A*<K+>"^.F`(b50f1F(1,(F>$47n*+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLs
DfTnO$48"&,9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=$47n*+CK(s?m'W(Eag/$BOPdkARlp*
D]j.B@;m?*Bl.R++D#S6DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@$6UH6+B3#c+EMX5DId0rA0=Je
A7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pj+<VdL1,Up3
@q]:k@:OCjEcWiU$48"&,9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1C=I3.Ni,/Df'H.?m'!*@:UKh
A7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Esa$4+Cf>,D.RU,F"AGQEb0<'Ecu#8
+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]g+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNE
Df0,/@VfIjCERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@kr+<Ve@F!,UHAS-($+EqL1DBNt2@:X(i
B-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF$48"&,9SZm3A*<G+>"^.@;^3r
Ed8c^3@l:.0JP?j$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`
>psB.FDu:^0/$sPFD,f+/n8g:0.AL\+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG
+ED%4Df]W7DfTQ'F#jXN+<Vd6+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEsa$4+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;p
A7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:956+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU
:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0rA-sG%+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,
F)to'/g:WF+<VdL+<Vd6+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A8bs,+D>\0A9/l%ChsG$+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3
AS#C`A0>u4+C]J-Ch+Z1BOqMn+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd4u+<VdL+<Vd6+=\L/
F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnF_u)=.3Js?+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c1+<Vd6+=\LAA8lU$
FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ"+<Ve:BOPdkATJu4DBN=b76s=;
:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d
+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU$6UH6+<VdL+:956+<VdL+<Y36
F(KG9-W3B!6s!8X<(//W$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%'b+<VdL+<Vd6+=\LGBm=3"
+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AI9P&+CKG%+DGm>Bl5&$
BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=-X\&(+<VeEDg*=7Ble60@<lo:
F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60
@<lo:Ci=3(+CoD#F_t]-FE9&W$47n*+CK)/?m'Q&D/a<"FCcS9FE2)5B6,2*BOPdkARlp*D]in*
FCSu,FD,4m+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4m
+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMd/+<XWsAKZ)+
D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E-+<Ve8DIaktH[\m]
IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWCH$O[PDf0)r?n!4,DIa(s+<Y`=DfTqBA79Rk
+=LWCH#7J;A7T's/d`^D+:95@+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(f4
+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(+ED%4CgggbD.RU,Esa$4+EV:*F<G"4AKYE#E,96"
A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J4+<Ve8AoqU)+EV13E,8s)AKZ&9
EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_r
Ch[a#FE7d3+<Y]9E,8rmASl!rF<GO2Bl\8I$6TZu+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bb
DKI!KDIn$6ATMr@$47n*+CK&!?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&
A9;a.Ci`u:+B3#cF(HJ*A8--.BOu"!ATDi!+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(
+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ/$6pc?+>>E./iY^2/Kdi!FDkW"
EZd(m/0H]%0es(C+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1
Ch\!&Eaa'$-X[9(+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbe%+<X9P6sV3SFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:956
+D,P4+Co&*@;0P!$47n*+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/d`^D+:95@
+CI&LA8-+(+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-
FCB9*Df.07+:95@+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"ReB$6Uf@;flGg
FD5W*+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:956+EV1>F<G[D
+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3Js?
+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP+n,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es(C
+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!
-X[9(+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R
/hSMZ+:956+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s+CIT5
6WHiL:/jVQ6W@G#+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@
ATJu9AU&;L+B3#c$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/d_q..NinG
F*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0AuH=&31+<Ve*
:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.
$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'4u
+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%e
+<Ve8DIaktF(fK9E+*g/?[?'e/d_q..Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5
F*&OKBOu:!ATAo1@<6O%EXEp3+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!
Df0!(Gp%'7FD,_J+@^9i+:956+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'nF!,R<AKYr4AS,Y$+Dl7B
F<GF/FCSu:+@^9i+CJ)95t"LD9Nba1+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+
@:Nki+EV:.+EMXCEb/c(E+*j%+DG^#+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0
BOuH3A8,XfATBCG<+oue+CT)&Dg-7F$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.
@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9$6UH6A9)C-ATJu&DIaku@q0(kF(Jl)@X0)5@;^?5
F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<Co5+<Y*&@qB_&+E1b2BQGdK+:956+:95@+@JXp
78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"ReB
$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e2r,9nEU0J5@<
2`2^0+A-coAKW`d/0H]%0es(C+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX
<+ohc9jqNSG%G]8Bl@kr+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znb:+<VdL+<VdL
IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;@:O1nFCfMGFEhm7+<Vd6+=\LAC2[W8E+EQg+E_X6
@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1","+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%
+CJhnDImisCbKOAA7TUgF_t]-FC5Fu+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0
Bk;?.F(Jd#@q]Fa$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4
@;ZDp+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ/+<Vd6+=\LGBm=3"+CQC#A8-+(?m'8s
DJ+')+D#S6DfRHQ$6TZu.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)
An>Oa+A>63+:95@+DbIqF!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V'
+:95@+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl,j+<YcE+CT.1
Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG$6UGu,9nEU0J5@<2]s[p8muT[0fCR*1,(F;
$47n*+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:g
B4VDm+<YB9+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*
D]iG6?m'9(@ps1b$48"&,9SZm3A*3I+>"^(ARci;3@l:.0JP9h$6Uf@?tX%m/0JnSFC65/Dg*=9
ATVEq+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCu8=$6UH6+<VdL+>k9SATT%B
-Qia=+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T$48"&,9SZm3A*34/KdGm
@j!K]/0H]%0ej"B+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJr
De(J>A7f3V+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,+DkP$
DBN\4A0>Ds@ruF'DIIR2$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$
BOu6r+D,>(ATJ2$+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F
/g(KD+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;
C2[W7E+*Bj0.AL\+<Vd6+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/
F)YPtAKZ#)D/XT+C`m24+:956+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7
BOu3q+DG^9FD,5.FCf]=+E(j!+<Ve8DBNM8E,95uBlkJADfTA@$6UH6$6pc?+>>E./i=b'+@KdN
+>bVl1,(F;$47n*+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&
$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+<4+<V"6.Ni>;G\(D.@;[2qD/=9$
+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:956+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4
DBMVeDKU1V$6UH6$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e2r,9nEU0J5@<1a"@m:2b:u1,UU*
1,(F;$47n*+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)
A8bt#D.RU,@<?4%D@.Kn+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8
ASrW7DfTB0+EqOABHVD1AI9P&+EV:.+ELt.AKYl!D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$
F!,[<Eb-A4Eb0<'DKI">D@.L/+EV:.+E1b2BJ'W7+<V"6.NikQA79RoDJ()#DIal$G][M7A8,po
+A,Et+EV19FE9&A+<Vd6,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;$47n*+E).6Bl7K)A8bt#D.RU,
@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2$6UH6@<,p%BQ%s6
ARlomGp#UqDeElt+@L-XF_t]-FE8R5DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0$6UH6A8c[0
Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AI9P&
+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1r
A7AtWCG#r$,9nEU0J5@<1*A.k9jr;i1-$m.1,(F;$47n*+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTu
G%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@.L/+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'
DIal2AS!nF$47mu+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm7
$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4(
+<Ve?@<3Q#AS#a%@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:956
+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Esa$4
+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!.+<Ve2?tsUj
/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE$6UH6A8c%#+Du+>+EM47
G9BRnDKU1HF)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsG$+<Y*1+CSbiF`Lo4AKYMpF(96)
E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5C$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+
@W-C2+A,Et+EqO9C`m1u+DkOtAI9P&+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf$p1+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.
GA1l(/g)8D$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^
+?(o,GT_'QF*(u1F"ReB+:9><,9SZm3A*$//KdbrGp#$s+>PW*0a\71.NiSBDJsP<AncK4De:,'
A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/d_q1,9n<b
/ibO<+>"^*ARZc:3%Q1-0JP9h$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u
+A,.'9.h>dBPDN1G%G]8Bl@kr+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<:+<Vd6+=\LS
AT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$
$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;4%
+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,Bl8$(Eb8`iAI9P&
+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4m+<Ve9@<6!&
Ci<flCh4u8+EM+&Earc*E+*j%$6UH6$6Uf@E+*j%+CT.u+D,>(AKYMtF)Yr(H#k*<Df0`0Ecbl'
+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E;+:95@+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.
@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Ambrg+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.+
+E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg$6UH6BlbD7Dg*=5Ec6/C
ARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"A0>8pDe(J>A7f3V+<Ve8DIal/
Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAI9P&
+Dbt+@;I&_6q/;>ART+`DJ(R/+<Vd6+=\LPDJX$)AKXT@6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*
FDi:BAS,ai@rri'BOPdkATKI2+:95@+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)
Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/d`^.+=\LA6<R8V?m';p@rcK1F(96)
E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V"6$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3!p!8
.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8
+EqL1FD,6+$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`Amogu
F<G:=+>>DT+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.
Ci!['+:956+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e33
+<V"6.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(
Bk;?.FDi9/+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3$6UH6$6Uf@D/!m+EZet.
G\(q=Bl5&$C2[W8E+EQg$48"&,9SZm2_Hm//Kdi!F<ELn+>PW)3!p!8.Ni>AEarZk+E1b2BHUf'
D/`p(Ble31F!,RC+Dbt?ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-
De`inF=1H'+:95@+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3V$6pc?+>>E,/i"P$+B)ij
+>Pf*+>PW)3!p!8.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc$6TZu.NikQA79RkA0>8p
De(J>A7f3lFDi:4ATM@%BjtWr@q]:gB4Z,k$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3!p!8.NibC
D/XT/A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"
A0>r-H=[F+$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(F
A9DBnF!,O<H=\4;AfthrDe(J>A7f3V$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3!p!8.NibCAn?!o
DI[7!+CSekARlp*D]iG&De(J>A7crl$6TZu.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:/n8g:
>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df,n)$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3!p!8
.NiSBDJsP<C2[W*F(96)E-*46A8-.,$6TZu.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnj+:9><
,9SZm2(gU+/KdZ.C`kJf/0H]%0K9CH+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^$6TZu.Ni,3
A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?j\"`,9nEU0J5480H_qi8p+qm0fU^,1,(CA
$47n*+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AI9Oe,9nEU0J5170H_qi8p+qm0eb.$
1,(CA$47n*+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;DBN>%De*BiG&2)*A7-NlDfQt:@:BQd
$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uogu
BlJ08/no'A?j\"`,9nEU0J5.63$9dq9jr;i1GLF'1,(CA$47n*+Dkh1DfQtCE+EC!AKZ)5+DbJ-
F<GC.@N]`'@ruF'D@-^q,9n<b/i,+=+>"^1@<itO0e=G&0JGHn$6Uf@@Wc<+AncL$F!,17+DbIq
F!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7,$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3!p!8.Ni>;EcZ=F
Eb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ1-+<YcE+EV:2
F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!G:+<Y*'/SK'4+EM%5BlJ08
/g*o-G9D!@AKXT29H\D%F*(u1+D>2$A8Ggu+A,Et+DG_7FCB!%F"ReB+<V"6$<pgk>rj)N<+oue
+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2$6UH6+<VdL>B""g
A8bs`-tm^EE&oX*C2[d'D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`$6UH6+<VdL7W3;iAU%X#E,9).
FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TC+<VdL+<Vd6+<VdL
+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-$>=-p
FDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4UMN@,9n<c/hen51*A.k-r4\o@rcL*+BDokBjkn$+@TgT
FD5Z2+EqO=.1-D).NfjA@:FCf-t-q.+C\bhCNXS=G%G]8Bl@m1.3N&0A7]9o/Kf+GAKYAqDe(J>
A7f3V$6Uf@+@KpaARfg)A7]@eDJ=3,Df-\+E,]B+A8-92@:Wn[A1e2r,9nEU0eP.41*A.k:2b;e
D.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&VBln'-DCGo"+<W-V
:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8
F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQI,+<Ve+BPDN1BlbD*+C]8-CERe3EcYr5
DBNk0+EV:.+Co2-FE2))F`_2*+CJr&A1hh3Amd568S0)jDfm1H@;^00FDi:CF`;;<Ec_X2+<Ve!
:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po
+Dbb0CER4tBl%ht+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL
2)R3N1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?j[5`+=\L/ATo7hF`;VJATAo0
@:C?uA7crmA7T7^+CJ2jBl7QUDe*ZuFCfK$FCd(DA7f4$+EM+*+EV:.+Co2,ARfh#Ed8!!$#4Ef
FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.%$6pc?+>GK&/hnJ#+AH9b@qZu?
3%Q1-0JY=)-rY%oBjkg#6tp^a@;]RhDJ((\A8-."Df.!2$6UH@+<XZ^9QM=jDBN>%De(J>A7f3l
D/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE(^+<W-V;IsHOEb0,uATJu9D]hY<
9H[hY@;]^hA0>u4+E_a:+E1b!D..<)Bl8!6ART+%$48"&,9S]n0J5%%/KdGm@qBLdATAnR/0H]%
0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1-D)+=\LA@V97o?m&oe@r$4++D58-+EM+(FD5Z2
+CSekARmD9$47mu.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[A0<HHF(Jo*FD,5.
A8-'q@ruX0GmXm$+<VdL+<VdL+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQk
Ddt.%$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f]RJ+<W-VG%G]8Bl@l3@WcO,+D,P4+A*b:
/hf"&@V'Xi+E1b2@q[J%$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(1,(FC+=L9!Ch7L+Bl7K0
F!*kZGps(-+<W-V?ugL5?m'N%@ruF'DBN@uA7]:(+:8H#,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](
+>PW*3!p!8+=\LAD/O/t+EM+(FD5Z2+CSekARmD#$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0
-r"8iDfTQ#C`l,SGp%6KA79Rk.1-D)+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:
F(oQ1+?1u-2_-Kf$6UH@+A,Et+D,P.A7]e&+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UE
A79RkA-sG%+<Y97EZdss3%cmD+A,L1/d_q.+=\LOATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE
89Jf_@<-'jDBNA,E+NotBm;6;$48"&,9SZm3A*<P1E\7l9jr;i1,1=&1,(FB$47mu.Ni>;EcZ=F
@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<$48"&,9SZm3A*<P0H_qi
7V-%LF^]<9+>Pl,+>PW*2[Tm7+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92
FDi:2ATW$*EXEp3+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/d_q1
,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHm$6UH@+Dkh1DfQt3A8-.,$48"&,9SZm3A*<O2'=In
6$6g_F*&Nb/0H]%0f9:F+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9
+:8H#,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEl$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q
?m&ukF(96)@V''W+<V"6+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<
F_*!EFCAWpATJu&A7T7^$6UGu+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(tFE7cr
,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9:\$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<n
F_u(?;e'i^E-*4%EbT$!F!;`8A7T7^$47mu.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72
G9D!AD.Rd1@;Ts+F*2G@DfTq,$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+
F`\a6C2[W8E+EQg$48"&,9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2$s[5+=\LNBl7j0+D#(tFE8RH
D]j+DE,]`9F<GC.@N]f4A79RkEs`7!,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEl$6UH@+D,>4
+DG_'DfTl0@rri*Df9`8DffP5Ch[d&$48"&,9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2$s[5+=\LD
BOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$A-rYd+=\LDBOPdkATJu+DfQsm+?1u-
GT_'QF*(u1F!+n/A0=KA<!isT+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCeti$6UH@+D,P4
+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc
3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk
/Tt]GF(oQ1/MJb:/NGaC.1-D,,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^XR4+=\L+5tiDEATDj+
Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgL
FCf<1$48"&,9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=$47mu.NieXDI[@#Df098AKYAqDe(J>
A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*+A,Et+CSekDf.0M$48"&,9SZm3A*<G+>"^.@;^3r
Ed8c_2Cot+0JP<i$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/d`^.+=\LWATDj+Df-\-Df0Z;DepP)
E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5$6UH6>=WCL89JBI-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKFH+<V"9,9n<b
/ibOD2'=In:LeKb@V'R&0f(@'1,(F<$47n*+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=
2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8$6TZu.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\k
Ebf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1-D,,9n<b
/ibOD0H_qi8p+rq+>GZ'+>PW*1("@2.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUj
A8bt#D.RU,?m&lgA8c?.@:Wn[A0;3d,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es(C+=\L16q/:k
:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl48#
+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9
BOr<-BmO=t+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=
BOr;rDfTD38l%ht@:WneD@.L/+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0o
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F$6UH6BOPs)@V'+g+CTG%
Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:956+Cf>/Gp%3I
+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKV=&+<YWDDes-"ATD4$
Bl@l3De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+$6UH6D.Rd0
GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h
$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"ReB$>OKi?Z1+%
ATqL'AU#sc,p6Z;Bk:m!Dg#]4G%kN3+E(j7FD,5.8l%htF*VhKASj%B%14C(GA(],AKYE&F)PQ&
@<?'k+EqOABHVD1AKXT@6m-,_Dfp"AFD,B0+E)F7Ecu/.G9@>%,p6W8E,96"F!,RC+EV:.+D#G4
Bl[c-8l%htF*VhKASiQ2AS!!+BOr<'@:O=r+=L]ABl%<pDe*ZmFCf\G%13OO>]XIdFD5Z2HV.(%
+A[/lEcu/.GC9o-%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+C&T#AS-:&FEDJC3\N-r
De*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUrF"_0;DImisCbKOAA:8es+CSekDf0tU%13OO;e9M_
FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8WBl89/DKTf-Eaa'$I16NgBlmp'%144_BQ@Zr
HY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj07A1HBOr;Y
:IH=%@:s/"/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-
A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdtG0Ci<c9D..L-ATBG=De(J>A7g7:<+ohc8l%ht
D..=)@;I&kFCf]=FEDkEDe(J>A7g7</e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnDdtG0Ci<c9D..L-ATBG=De(J>A7g6!$6WSkDfT]'Cia<:AISuO
ASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL4uO6m,KNATAnbDKKH1Amo1\+BNK%A93/.$4R>@
Df'&.De:,6BOr<#DKKH1Amo1\+EqaEA9/l0BleB-A0>PsEb-A%Eb-A2Dfd+4De!p,ASuU$A0>T(
+EV:.+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdtG0Ci<c9D..L-ATBG=
De(J>A7g7:8l%htD..=)@;L?E+:SZKAU,gLF)Z/6DJO'&DJ()5Dfp)1AKYK$A7Zm-Bln#2?sn+p
A8bt#D.RU,ARloqART\'Eb0;>-Qli8A0>8f7:C7ZATAn^B4l95-Qm#>EZee4FCf?3Bm+&1Eb/Zi
ATDi$$>FQ(@3BB)DJ+$4@;]UiDJ()5De=*8@<,p%A7]pqCi=90ASuT4>\.bkBR=<.FD55rD.RU,
I4bs9%14C(AoDL%Dg,o5B-:]&A7ZlrASu("@<?'k+C]UW+D,P4D/!Tj@qBanGT\Y#INX(l8U=!)
6tpO\ATDBk@qAS<5u'g6;FE'-H:gt$FDl)6F&Q%(:..BG6nCoU8l%itFD5W7ATDBk@qAS<5u'g6
;FCs$,p5<#.su)MA8,Xa@qC$>/NsUN%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?RH#R>8Ch[d&HXUB,I=#3oDfT]'CfG=gHXUB,+<VdL+<Z)\>?l,UB4Z*pAp\6(@le%-
G(!X=>XNFHD.RU,<,ZQ!@;Ka&@UWb^F`8IHATDj+Df-\8@;TRsI16NgBR+Q.EboH-CO9K#A7oq%
I=#3oDfT]'CfG=gHXUGqB6%r6+<Z)\>?l,UB4Z*pAp\6(@le%/A7oq%I9dt#6Z6gYASuThDej].
A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=AUP!p>\JD%ATDU$DJOT-Ci!utD.Rd:HX'<aEc#6$
<,ZQ!@;Kat@;TRs+FSZB>]=+aATD?oHYI)%3ali@DIIBnF+%=:>XNFHD.RU,<,ZQ!@;Ka&DIIBn
F!,(8Df$V>F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT-Ci"-'AoiBI
>Y]3XD..6[Dej].Ci"-'Aof(;I=5=)E+*BjEb/j0BkCj9@;Kb#AS-"3>p*B>Df'?&DKJirCO9K+
C`mV6DJX6$@;KKtDIIBn+ED%*ATD@"@qB^B+CT)&Eb/j(+?MV3Eb0?8Ec*":Gp%-=An?!oDI[7!
-[cF2>\JD%ATDU$DJOT.B4Z15HX'<aEc#6$<,ZQ!@V97o+<VdL+FSZB>]=+aATD?oHYI)%3au`5
FF@F;>XNFHD.RU,<,ZQ!Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V9F`\a:Bk)7!Df0!(Gp$R)@r$4+
F+"K)>\JD%ATDU$DJOT.DJX`J>Y]3XD..6[Dej]/DJUF<+<VdLI=5=)E+*BjEb/j0BkCj9@W$"1
>p*B>Df'?&DKJirCO9l3F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj@r$4+
+D,>(ATN8/$=%7iE+O'+Bl7^5@rH4'C41G6:2b/i@;Jn]CO9Q0D/a54+<VeTI9Trq@:s.lAS-:'
An*l3Df'H.I9dt#6Z6gYASuThDej]0Df'H6ATMp(F!,@=DJjB8DK?q0Gp%-=D/XT3DJ()9BPDR"
+EML1@q?ckDIal2BQ%p5ASu4"B-;#/@ps0rBk1dmFD5?$ATDj?%16?RH#R>8Ch[d&HXp]9HX'<a
Ec#6$<,ZQ!A7Zl++<VdL+FSZB>]=+aATD?oHYI)%3b2fM>p*B>Df'?&DKJirCO9T+F)Yr(Gp#^T
6m-M]F*2;@+EqOABQ&$8+ED%8F`M@B@rGmhI16NgBR+Q.EboH-CO9T'CjgY8:2b/i@;Jn]CO9T'
C`jiC+<VeTI9Trq@:s.lAS-:'An*l4AScd#+C%9PD/Ej%FB!0oHXp](ATVL)+E(_(ARfh'+DG^9
A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF+"K)>\JD%ATDU$DJOT0ASc""E.*(<:2b/i@;Jn]CO9T'
ChId-+<VeTI9Trq@:s.lAS-:'An*l4ASc""E.)"7>XNFHD.RU,<,ZQ!Eb0*+G%De?DfTB006CcH
FE8R:Ec5e;B6%p5E-![RF_Pr/F+"K)>\JD%ATDU$DJOT0Bk2X=>Y]3XD..6[Dej]1Bk/>/+<VdL
I=5=)E+*BjEb/j0BkCj9A8,S&>p*B>Df'?&DKJirCO9T+@ruF'DIIR2+DG@tDKKT)Bk(RnBl@l3
@;]TuF*(i4BleB1@rm&-$=%7iE+O'+Bl7^5A8-+(I=#3oDfT]'CfG=gHXpi3E$-8G+<Z)\>?l,U
B4Z*pAp\6(@le.7F)ZP5+C%9PD/Ej%FB!0oHXpi3E,8s.+Co1rFD5Z2@<-W9DdmHm@ruc7@<3Q5
AU&<F%16?RH#R>8Ch[d&HXq#1I=#3oDfT]'CfG=gHXq#1+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.<
CjfS3>XNFHD.RU,<,ZQ!Ch[s4+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF+"K)
>\JD%ATDU$DJOT0De"3B>Y]3XD..6[Dej]1Ddsn4+<VdLI=5=)E+*BjEb/j0BkCj9A8bt+>p*B>
Df'?&DKJirCO9Z3Ec#6,F!,"3@s)X"DKI"CAU&;>F`V87B-;;0AKYK$DK]T/FD5Z2F!,C5+EV:.
+=Lc=@q0U0+Eh=:@XS[m>\JD%ATDU$DJOT0E-#T4I=#3oDfT]'CfG=gHXq):ATT%;+<Z)\>?l,U
B4Z*pAp\6(@le.>F(KHA>p*B>Df'?&DKJirCO:,6F<G+.@ruF'DIIR2+E1b0@;TRtATDj?%16?R
H#R>8Ch[d&HY$`9HX'<aEc#6$<,ZQ!ARlo++<VdL+FSZB>]=+aATD?oHYI)%3b;iM>p*B>Df'?&
DKJirCO9W'BlkJ.Bk)7!Df0!(Gp%$7C1UmsF+"K)>\JD%ATDU$DJOT1FFAL@:2b/i@;Jn]CO9W7
+<VdL+<VeTI9Trq@:s.lAS-:'An*l5FF@F;>XNFHD.RU,<,ZQ!ARoLs+EV1>FF=T*>\JD%ATDU$
DJOT2F(K6;HX'<aEc#6$<,ZQ!AohO$+<VdL+FSZB>]=+aATD?oHYI)%3bEGEDLGe5>XNFHD.RU,
<,ZQ!Anc:,F<G+4@s)X"DKI"BASuU$DI[7+%16?RH#R>8Ch[d&HY6l#E-$GS>Y]3XD..6[Dej]4
A7]_$+<VdLI=5=)E+*BjEb/j0BkCj9B4PRmF+%=:>XNFHD.RU,<,ZQ!B6%p5E$/S,A0>r9Blmo/
A7]^kDId<rFE;j>$=%7iE+O'+Bl7^5B4Z15HX'<aEc#6$<,ZQ!B4Z0-+<VdL+FSZB>]=+aATD?o
HYI)%3bN#GI9dt#6Z6gYASuThDej]?ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+Cno&
@:EYdAKYT!Ch7[9%16?RH#R>8Ch[d&HY6o3Ed3"Z>Y]3XD..6[Dej]4ATVs;+<VdLI=5=)E+*Bj
Eb/j0BkCj9B4Z1*G^Wj?>XNFHD.RU,<,ZQ!B4Z0-Eb065Bl[cq+EVNEAU%crF`_2C%16?RH#R>8
Ch[d&HY7/5@WQsE>Y]3XD..6[Dej]4Ci<d(+<VdLI=5=)E+*BjEb/j0BkCj9B5DKqF+%=:>XNFH
D.RU,<,ZQ!@;]LiH$X$Q+ED%4DfTqB@;]TuF*)>@AKYW%Ddm-k+DtV)ATN8/$=%7iE+O'+Bl7^5
B6%s>HX'<aEc#6$<,ZQ!B6%r6+<VdL+FSZB>]=+aATD?oHYI)%3bNJPI9dt#6Z6gYASuThDej]0
Eb/[$AKYE!A0>`-A8,Y$+D5_5F`;DM%16?RH#R>8Ch[d&HY7GKHX'<aEc#6$<,ZQ!B657=+<VdL
+FSZB>]=+aATD?oHYI)%3bNP_>p*B>Df'?&DKJirCO9]*F<F0uF(96)E-*4EAU&;>Ao_g,+A*bu
ASlB/A8-'q@ruX0H$p,/>\JD%ATDU$DJOT4CiF9.I=#3oDfT]'CfG=gHY@57DJUF<+<Z)\>?l,U
B4Z*pAp\6(@le:>E,KK?>p*B>Df'?&DKJirCO9T+F)Yr(H#k*LBQ%p5+Co&)@rc:&FD5Z2F!,C5
+E(_(ARfh'+E)-?.![7i%16?RH#R>8Ch[d&HYRJ0@:s/"HX'<aEc#6$<,ZQ!C2[WkB4W2.+FSZB
>]=+aATD?oHYI)%3biSD@:s/">p*B>Df'?&DKJirCO9T#H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u
+CfG'@<?4%DBNk0+A,Et+E(_(ARfh'I16NgBR+Q.EboH-CO9f7A8#OjE.*(<:2b/i@;Jn]CO9f7
A8#OjE$-9OI9Trq@:s.lAS-:'An*l:De*NmCiFf.+C%9PD/Ej%FB!0oHXpi3E,8s.+A,Et+D>>&
E.&0&>\JD%ATDU$DJOT8B75,3:2b/i@;Jn]CO9l1+<VdL+<VeTI9Trq@:s.lAS-:'An*l<B74&.
>XNFHD.RU,<,ZQ!D..3k+CT.u+Dbt)A0=K?6m-,_Dfp#I%16?RH#R>8Ch[d&HYdV1B6%s>HX'<a
Ec#6$<,ZQ!Ci<frEc<-D+FSZB>]=+aATD?oHYI)%3c&_EB6%s>>p*B>Df'?&DKJirCO9l3F*&O;
Ec6)>F!+n/A0>r9Blmp-+EqOABHV2$D.S,)$=%7iE+O'+Bl7^5D..3kI=#3oDfT]'CfG=gHYm2,
AKW*<+<Z)\>?l,UB4Z*pAp\6(@leI8CLqp"+C%9PD/Ej%FB!0oHYm2,ATJtd+EM%5BlJ08I16Ng
BR+Q.EboH-CO9o7F+&C?:2b/i@;Jn]CO9o7F!)SJ+<VeTI9Trq@:s.lAS-:'An*l=Cib#1+C%9P
D/Ej%FB!0oHYm2,AKYf-@:UL%@rc:&FF=T*>\JD%ATDU$DJOT9DJX`J>Y]3XD..6[Dej]:DJUF<
+<VdLI=5=)E+*BjEb/j0BkCj9D/O0<>p*B>Df'?&DKJirCO9l3F*&OC@VTIaFE8R=DBNA(C`mb0
B5)F/ATD?m+Co1rFD5Z2@<-'nF+"K)>\JD%ATDU$DJOT:ATq[5HX'<aEc#6$<,ZQ!DIn$&+<VdL
+FSZB>]=+aATD?oHYI)%3c8MQA:7`+>XNFHD.RU,<,ZQ!@rc-hFCfM9@3BH!G9CF1@ruF'DIIR2
I16NgBR+Q.EboH-CO9r;AU&0BHX'<aEc#6$<,ZQ!DJs*2E$-8G+FSZB>]=+aATD?oHYI)%3c8kI
G]8(:+C%9PD/Ej%FB!0oHZE\>F`MA@+CQC/BleA=De:,1@VTIaFE8RKBln#2DJpY/G]7J-DIIX$
Df0WE%16?RH#R>8Ch[d&HZ!bDB6%s>HX'<aEc#6$<,ZQ!DJsW0Ec<-D+FSZB>]=+aATD?oHYI)%
3c8kXB6%s>>p*B>Df'?&DKJirCO:8DEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2Dfd+9
DBNS4Dfp#?+E)9CF*22=ATN8/$=%7iE+O'+Bl7^5DKL;R>Y]3XD..6[Dej];F<D\K+<VdLI=5=)
E+*BjEb/j0BkCj9DKL;4+C%9PD/Ej%FB!0oHY$`%F<G!7DIn#7FCfN8+EM%5BlJ/:F`V87B-9fB
6m,uXDK]T/FD5Z2F+"K)>\JD%ATDU$DJOT:GC=gC:2b/i@;Jn]CO9rC+<VdL+<VeTI9Trq@:s.l
AS-:'An*l>GC<a>>XNFHD.RU,<,ZQ!ARoLs+CQC1ATo8.G]7J5@qg$-GAhM4+E_a>DJ((a:IH=8
Df0`0DKKT2DKC48$=%7iE+O'+Bl7^5DdmTmD.Rd:HX'<aEc#6$<,ZQ!DdmTmD.Rc2+FSZB>]=+a
ATD?oHYI)%3cAJF@;TRsI9dt#6Z6gYASuThDej]<@VTIaF>%HK@ps1b+DtV)ATJu+Ec5e;F`V,8
3ZoPRCi!utD.Rc21GL"pF(KD8-Z3@0ALDm8$=%7iE+O'+Bl7^5De+9C>Y]3XD..6[Dej]<A0<!;
+<VdLI=5=)E+*BjEb/j0BkCj9De+9%+C%9PD/Ej%FB!0oHZ*k7DK?q/DIal"Ci=B+F!,"-@ruF'
DIIR"ATN8/$=%7iE+O'+Bl7^5E+*6lA:8f0:2b/i@;Jn]CO:#/@r#Tt+<VeTI9Trq@:s.lAS-:'
An*l@@:O(`I9dt#6Z6gYASuThDej]/@:O(o+E_WG@;]TuEb/a!G%G]8+Eq78FCeu*F)YPtAKY])
+Co1rFD5Z2@<-W9Anc'mF+"K)>\JD%ATDU$DJOT<Ed`:>:2b/i@;Jn]CO:#@+<VdL+<VeTI9Trq
@:s.lAS-:'An*l@Ed_49>XNFHD.RU,<,ZQ!E-67F@;]Tu@rcL/F!,L7An?!oDI[6#GAhM4I16Ng
BR+Q.EboH-CO:#CFFAL@:2b/i@;Jn]CO:#CF<D\K+<VeTI9Trq@:s.lAS-:'An*l@F``%;+C%9P
D/Ej%FB!0oHZO:IEb0;7DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%I16NgBR+Q.
EboH-CO:)5Ao;$oATN9H>Y]3XD..6[Dej]?AS,ggD.Rc2I=5=)E+*BjEb/j0BkCj9Eb/j#@;TRs
I9dt#6Z6gYASuThDej]?AS,LoASu!hA0>c.DJX6$@;KKtDIIBnF!,(8Df$V>F(KDR+<Y*/Ci3Zu
ATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT>AS5P%HX'<aEc#6$<,ZQ!Eb/lo+<VdL+FSZB
>]=+aATD?oHYI)%3c\eEA:7`+>XNFHD.RU,<,ZQ!Eb/ltF*(u6+CT.u+E_RBAS5^uFCfJ88l%ht
A8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO:)5F*(r@HX'<aEc#6$<,ZQ!Eb0<6A0<!;+FSZB>]=+a
ATD?oHYI)%3c\eQFC]f*+C%9PD/Ej%FB!0oHZE\=FDl22F!,R<AKYi.F*&OFARf:hF<G%$@r$4+
+CfG'@<?'k+C]U=-u`U)CLelB%16?RH#R>8Ch[d&HZE\@Dgct;:2b/i@;Jn]CO:)5G&JKG+<VeT
I9Trq@:s.lAS-:'An*lBATi!?>p*B>Df'?&DKJirCO:)5@qBP"Cj@.DAThd/ARlp%@VTIaFE;j>
$=%7iE+O'+Bl7^5Eb0E4DIn'@HX'<aEc#6$<,ZQ!Eb0E4DIn&8+FSZB>]=+aATD?oHYI)%3c\eT
Df0-2I9dt#6Z6gYASuThDej]?ATW'8DK?q/+Dbb5F<GL6+E2IF+Co1rFD5Z2@<-W9DdmHm@ruc7
GA2/4+Du*?AU&01@;]LqBl@m1I16NgBR+Q.EboH-CO:)=I=#3oDfT]'CfG=gHZEsG+<VdL+<Z)\
>?l,UB4Z*pAp\6(@leXII9dt#6Z6gYASuThDej]?F`)7C8g%tZ@rcK1F(96)E--/L%16?RH#R>8
Ch[d&HZF4MI=#3oDfT]'CfG=gHZF4M+<VdL+<Z)\>?l,UB4Z*pAp\6(@leXPFF@F;>XNFHD.RU,
<,ZQ!Ecl8@+A*buATMr9F(96)E--/L%16?RH#R>8Ch[d&HZF@PI=#3oDfT]'CfG=gHZF@P+<VdL
+<Z)\>?l,UB4Z*pAp\6(@leXTF+%=:>XNFHD.RU,<,ZQ!Eb/m+Cgh?,AU&07ATMp,Df-\=ARTUh
BRL<s>\JD%ATDU$DJOT?G@c#IHX'<aEc#6$<,ZQ!F*D2?+<VdL+FSZB>]=+aATD?oHYI)%3cfLV
G^Wj?>XNFHD.RU,<,ZQ!AU&<;@:OC%F(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3Ao_g,+EqaEA0>Ps
@:Wqi+Cf>,D.RU,+CT.u+ELt7AUP!p>\JD%ATDU$DJOTAF(JlkH$t$E:2b/i@;Jn]CO:2FARo7q
+<VeTI9Trq@:s.lAS-:'An*lEF(JlkH$rs@>XNFHD.RU,<,ZQ!Eb0?8Ec,q@@3BB#F*&OCAfu;9
Eb'56Ao_g,+=MLa+EV:*F<EtC;FNrP9N`KJ@;Ka&GAhM4F!,C=+=MI`I16NgBR+Q.EboH-CO:2F
ATN9H>Y]3XD..6[Dej]BF(KD8+<VdLI=5=)E+*BjEb/j0BkCj9F`V,8I9dt#6Z6gYASuThDej]?
ATW'8DK?qEDfTA2Eb/ioEb0,uATN8/$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I;3\2
Ch\!&Eaa'$<HD_lCLqd41,Vfn/g,.U+E_a:Ebf63F!+t2DJ!Tq+D,P4+E2@>C1Ums+=M2LC2.Zt
Ch\!&Eaa'$.4u&::-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>Fl
F_PAtF"]n!DJ!Tq01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9
FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU
7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',
AT24$06LuQA1hS2F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`
C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@
%15is/g)?*FE21J;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q
2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$;No?%15is/g*nb<(/hj@rH7.
DesQ<ARlo34==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<+CTG3Bk29-F`V+:De:+>4!u.\BOPpi
@ru:&%13OO:-pQU87c[ZGpdYU,%>\:F=hWJCj@3I3A*!@+EqaECLM7%F`(`2%15is/g*.t3\i]<
-o!.n>9GpL3\iW:-Y-\,F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK+Z_A;
+=ANa+=nW`-mO0`><3lj3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDX67sB@+Z_A=>qoPD+Z_A;
-Y-\,F`&HY><*if1-&Vf/1;]'3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=2C'sc$4R>31-73P
;Is]RCLnVUF`MM6DKIsVDdd0!-YdR1Ch\!&Eaa'$-QlV90d(LYF<Dr?F_PZ&C2[X!Blmp,@<?'.
+BosuCh7$q+=ANG$:AoUCb%t14#&fqATT%^F`MM6DKIs\F!)iLEb]?-A8Gt%ATD4$ALAU)+E(d=
4==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<+BosE+E(d5-RT?16Zd?b.oU+qAooOm1-73P7!3?c
+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDM
FE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV
4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9$+Z_A=>qoPD+Z_A;-Y-\,F`&HY><*if1-&Vf/1;]'
3?^F=3$^1,/14X^+Z_A;-S07[DffP53?^F=2C'sc$:Zp80fr?GF*&O'D/X3$4*#Fb+=CoBA8Gt%
ATD4$AQ*GaCLo1R-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4(iSQCh[u6-YdR1Ch\!&Eaa'$<,uo"
@VfUM@;BFpF!i)7+EM+9C2[X!Blmp,@<?''-RWYIA8Gt%ATD4$ARBA!Bk;KqFCf\P1*n&bBPDN1
C2[X!Blmp,@<?''Dg#]4G%kN3%14CdF(Jj'Bl@m9>]aP%FEDVOC2[X!Blmp,@<?(/+A[/lEcu/.
GC9o-%16?^AU&<=FF.b@A8Gt%ATD4$AUP\8F!+m68g&7uBl%L*Gp%0<EbTK7+EV:*F<G4-DImis
FCfM&$=%7bAS-:&FEDJC3\N-tDD$-ICM@a!A8,I)DfTJDGA1i,02-)%ATD4$ARBCsDeF*!D/F!)
B75,CBlmp,@<?(/+CoD#F_t]-FE8R8Bl[cpFDQ4FAo_g,+C&T#AS-:&FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`EHV.(%+Co1rFD5Z2@<-XA+D5_5F`;CS
%13OO;e9M_FD,5.AoDL%Dg,o5B-:f)EZen(FCAm"F#ja;>[h8WBl89/DKTf-Eaa'$I16NgBlmp'
%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!
Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XWT'F(oN)+DPh*Ch\!&Eaa'$+Du+>AR]Rr
COIfX%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o
04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ(7N0PYN:Ch\!&Eaa'$/no9MDIS#'$6WSkDfT]'
Cia<:AISuOBlmp'%144_BQ@ZrHY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl
05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB1d)QCh\!&Eaa'$/oY?5I="t8Bl7Q+C2[X!Blmp,@<?''
:ddd$/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11Uf
F"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*ZuFCfK$FCd(DA7g6!$6WSkDfT]'Cia<:
AISuOASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[mDKKH1
Amo1\I16Mm$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=%7iE+O'+Bl7^5
<(KSZ:dIiE:IBPW>Y]3XD..6[Dej]!84c`V5u'gD6QdKo+<Z)\>?l,UB4Z*pAp\6(@ldR[8Q/GO
:..lFI9dt#6Z6gYASuThDej]3F_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-
Cht55@<?12%16?RH#R>8Ch[d&HY.2:D/!Tj@qBanG^XpD:2b/i@;Jn]CO9Z3Ec#N&@:NkjAU#=?
+FSZB>]=+aATD?oHYI)%3bE;ND/!Tj@qBanG^Wj?>XNFHD.RU,<,ZQ!AoD^,@<?Q5BR+Q.EboH-
CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'6>%16?RH#R>8Ch[d&HY7A<Ch\!>HX'<a
Ec#6$<,ZQ!B6%s-BlkI?+<VdL+<VeTI9Trq@:s.lAS-:'An*l7Ec>i/FF@F;>XNFHD.RU,<,ZQ!
D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaI16NgBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[
Dej]6Amo1\F(Jj'Bl@l3+<Z)\>?l,UB4Z*pAp\6(@le=9@:NkiARfgrDf0u/+C%9PD/Ej%FB!0o
HYIA>ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B713r>\JD%ATDU$DJOT5An-79>Y]3XD..6[
Dej]6An)r++<VdL+<VdL+<Z)\>?l,UB4Z*pAp\6(@le=9@sqW*>XNFHD.RU,<,ZQ!AoD^,@<<W+
DKKH1Amo1\+Cf>,D.RU,+EV1>FF=T*>\JD%ATDU$DJOT?ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]
CO:,6FD>`)Ch\!&Eaa'$+FSZB>]=+aATD?oHYI)%3cekSC2[X!Blmp,@<?(/>p*B>Df'?&DKJir
CO:#@AT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr
@VfV(%16?RH#R>8Ch[d&HZaOK@<?(*Ao`*6Eb'6>HX'<aEc#6$<,ZQ!Fa%Y1FCf]/Ed)GBA9/lA
I9Trq@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+%=:>XNFHD.RU,<,ZQ!F`)DD@;p0sA0>\sFCf\>
Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@CV%16?RH#R>8Ch[d&HZsCK
A8Gt%I=#3oDfT]'CfG=gHZsCKA8Gt%+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9GAhM4Ch\!>>p*B>
Df'?&DKJirCO9o,CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![7i%16?ODIe)bBkM*qBkM+$Bl7R3
%16?ODIe)mBOPF_A:4mo%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP\0DIak^:IKU?
$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bd
De*E%@;]Tb$=n'bF_t]-F<G[:G]Y'BF<GOCDe!@"F(KDF+A$Yt@<6L4D.RcL%13OO>[h8WBl89/
DKTf-Eaa'$I9SEY>n%-GBlmp'%144#6#:?[F)Q2A@q?cmDe*E%BlbD<FDl22A0>T(+A,Et+Co1r
FD5Z2@<-'nF"Rn/>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=@s)X"DKI"5Ea`TtASuU2
+CT;%+D#8/BOu3F%144#>[h8WBl893FCf<'H=_L6$6UHrBlmp'+AH9bCLh@-DBNS4Dfp"ACi=3(
+CoD#F_t]-FE9Jc>]s\!@XKpR3?VjHF)W6LB6%p5E,K*$ALDj7$6UHrBlmp'+C%TK<+T0:+EM[;
AncL$A0>_t@rcL/3Zq[NATD7-1a$=CF)W6LB6%p5E,K*$ALB#V?Z1+%ATqL'AU#SM%144#>\.e`
HYIS5D/"<-I16Mm$7-g"Blmp'%14C(+<XEtDCnI'@rGmh+DGm>@rH6sBl7Km+EVNEFD,5.8l%ht
B6%p5E$/h*@:Wqi>\7nmFDc#=AU@BiBla^j,p4<Q+<YK7D/"*#FD5Z2+DkP4+C\n)ARTXkA0>Su
+DGp?@V'%fD.Rc2@3B5tDIdcrDI[61I3;s9A0>T-+DkP-CLq#c$7-f;+EqOABHV88AT_O%/T>-9
A8bs#A7]RkD/"*'EcWiU7<W6_H$!_6DJ()+DBNG3Ebp"D>]aP%FEDVO>^K_(I16N0+<Ve9Ea`Hn
ATVu9AoDL%Dg-7FE+*WpDdso2Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK%14C(
+<Xp2AU&<=FF.b@A8Gt%ATD4$AUPqI+D>=pA7]d(@rH7,@;0V#+C%TK<+T0\@rGmh+EV:*F<G:=
+DkP-CLq$!Ch[Zr%14C(+<Yc>Blbm9$4R=g+C&AeB5)71G%G]'@<?4#I16N0+AP6U4?S(AIXWDd
+>.J=FCf\>DKTf*ATCIYDIml3F*(i2F@L:hD*9't+s;:C$7-fi67tGcIXZ`p+:SZ(+C&JqA:&K2
EaiI!Bl/8-$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!
Blmp,@<?(/I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u
+AH9S+Eh=:F(oQ1F!,C5%15][>\7nmFDc#=AU@[(AU&<=FF.b@A8Gt%ATD4$AUP\FBl%T.Ecl7B
Df-[i+?1u-0d'nBA0>>mH#IS2/q"09%16'Q+E_a:+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<fRFWbOD
F*'GP$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UH_DKBo.Cht4d:IHfE$6UHrBQ@Zr
HY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV.(%I3<6F
+CQBb%144#@:WneDD!&'F<G:=+E_aJ@;Kb*+DG_7FCB!%ARlp-Bln"t$6UHrBQ@ZrHY@MCE-"&n
04Sp2AM._=De=*8@<,p3@rH3;GA1i,02Q(eD..=1HZ3D'D..=1/e&.mBlmp'%144#8T&Tk@;Ka&
8l%iR:K::[74o#V+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@ID
ASu("@;IT3De*p-F`Lu'I="R^6rQl];F<m$%144#BlbD*CiaM;@3A/b@:WneDD!&'DKBo.Cht5.
F<GdAFD)e%FCf]=FEDkK@:O._DLF,[8TZ(bDf0Z*Bl7u7FD,5.8l%ha$6UI%Bk)7!Df0!(Bk;?.
Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?6o+<Xp2AU&<=FF.b@
A8Gt%ATD4$AM/B?$=%:eAShk`+<X6nF*(i,C`m./@s)g4ASuT4G%G]8Bl@l3De:+sBQ@ZrHY@MC
E-"&n05t?;A8bs1DfTJDI=#pADIdZqI4bs9+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+AU&<=
FF,bq3A*$=0mt0QDIal!AU/33A0;<g+<Y`JE,]`9FE8Qs+EMgGFCBD:BPD*mCh[NqFD5W*/g*u2
BlA#7G%G]8Bl@m1+ED%5F_Pl-A0>`-A8,Xi@psInDf.0M<+ohP$6UI'Des6.GA1r-+C]/*B-;/3
F*)IGE,ol?Bk1ctD/XH++DG_*DfT]'FD5Z23XlE=+<VdL+C&AeB5)71ASuX-ATD4$AUP!p#p:?q
Blmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B
05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]Ok
B4stQB4uC$DJ+A,$4.gt>]XCqBlJ08BmO>"$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_
FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$
Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_Bq
BQRs+B.n[[:gn6PDdso!@<6!j+A*bTH#@_4GT]OkB4u*qB4uC$DJ+A,$4.gt>]XCqBlJ08BmO>"
$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA
0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*mCh[NqFD5W*07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ
+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@9
0/,+6F(K3&/So-CATD4$AM%Y8A1r@X;e9f[/PKl#ATD4$AKXT@7"$Zs$4.gt>]XCqBlJ08BmO>"
$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb77
0e[TZD.tS<Blmp,@<?'4C2[W9I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&JqA:%m*F_t]1@<?(/
%16?SFCf:u$6UHXF_PZ&+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"jIFCf]=FEDkEDe*ZuFCfK$FCfkC
BlbD*+A*bhEc6)>/g*b^6k'JG+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3Dfp#?/g+,3+DkP&AKY6"
AU&<=FF.b@A8Gt%ATD4$AUP\3D`S=7%14C(>[h8WBl89@ATD6gFD5T?%14C(Eb065Bl[c--YI".
ATD3q05>E9-OgD/+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1,p7&@F!)iFDe*Zu
FCfK$FCcg/$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$
DJ+B%>n%-G:2b/i@;Jn]CO:)5EHPu9AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAB4Ysl
Ea`c;C2[WfFCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]<A0?;*94`BmDfTAfDej\]3dk73
FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iqFCf]=EHQ2AATMR'B5D.+
I=35C94`BmDfTAfDej](I3;c_ARebLCfG=gHS^(T:2b/i@;Jn]CO71BA0?;*;fm%oDJ)peCO9<.
AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!D/=89I9]]mEbTE(
<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR%16?ODIe)b
BkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+AZrfDBO%7AKXT@6m-#S@ruF'DIIR"
ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/e&-s$7-g"@V'1dDL6P<
EaiI!Bl/8-$7-g5A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14C(>\.e`HZit@@UX@m
D1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]<A0?;*
94`BmDfTAfDej\]3dk73FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iq
FCf]=EHQ2AATMR'B5D.+I=35C94`BmDfTAfDej](I3;c_ARebLCfG=gHS^(T:2b/i@;Jn]CO71B
A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]
B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$
/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/+DGp?@ps6t@V#uU+<YK=@:Wq[+Dbb-
AKYE!Gp#^%F(96)E-*]A$4R=g+C&AeB5)71G%G]'@<?4#I16N0+Dbt)A0<77De*ZuFCfK$FCcg/
$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G
:2b/i@;Jn]CO9l9@:UL/>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%
FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#
;e:%n@3Bc4EbfB,B-:`!Eb/a&DfU+U+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<06DImisFCfM&$6UHr
9OUn3=FOjrCh7Z?+@0g[+EM[8BHUo$Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;sBl[cpFDl2F+EML5
@qfOhARlomGmt*'+C'#"G]\%LHZNb?C2[X!Blmp,@<?'5I16Mm$7-g"@V'1dDL6P<EaiI!Bl/8-
$7-g9ATV[*A8Gt%ATD4$AKW?J+<XEG/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-
F<G+.Eb/a&DfU+4$4R=g+EM+9C2[X!Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"
GB43#,p78?FD>`)Ch\!&Eaa'$+=AgUDf'&=C2[d'06CcBE$lbN:-pQUCh[d0GRY!++C&JqA:&K2
EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!
F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"
AUAiR+<XoVDf'?&DKJirCO8fC/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.
Eb/a&DfU,O%13OO>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5
F(oN)Ch7sA@ldk:AU&<+@:O(oCghBuH[U!ID/`a%AU&<:F`2A5F(oN)Ch7sAI39XT+<VdL+<Ve3
6Z6gYASuThDej\p67sC)Bl7I"GB80A$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I4o8PD.PA8DeO#AFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b+C%9P
D/Ej%FB!0oHVQm[+Dbb0Fa/<D$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'
+B)in+E)4@Bl@ltC`m//FD,T5.!$g[GA2/4+Cob+A8,Nr>]aP%FEDVOF(KH.De*ZuFCfK$FCfkQ
%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?=FE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAhl@<??pDHq9pG][qJDffQ3Bl7R"AUAiR>Y]3XD..6[Dej\BF(KH.De*ZuFCfK$
FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:G<CFCf]=@UWb^F)59+BR>/:@<?!fG%Fp#
AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sC%ATT%g@8pf?+CTD7BQ%o>F"&5RAU&;>
@;]TuA8-'q@ruX0H$p,/>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHh
F`&=,FCf]=FEDkBEc>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/g+D@AU&<=
FF.Y@E,961I16N++D58'ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F
/g+,,AKZ#3Dfd+,9OUn3=FOjrCh4%_+<YB>+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!%14C(>[h8W
Bl89@ATD6gFD5T?%14C(B6%s-BlkIFC2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*ZuFCfK$FCd(H
AU#=,$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%
>n%-G:2b/i@;Jn]CO9]7E,961+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*ZuFCfK$
FCe^!AU&<:F`2A5F(oN)Ch7sAI3;c^Df'?&DKJirCO8fC/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>
I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<X[*AKY5O@8pf?IWTKN
@rH4'Bl%?'FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkBEc>i/F=qta%13OO+<Wrm@UX@g
BHUQ%AU&<=FF.J*FF>9Q@rc:&F<G:=+Eqj?FED)3+EVNEFD,5.>]aP%FEDVOF(KH.De*ZuFCfK$
FCfk0$6UI%Bl[cpFDl2F+EV:*F<GX<Dg-7FFD,5.F(K?6ASu!h+E(j7>YJR*AQW1[@rH4'Bl%4"
Bl@l3@rH4$@;]Us/e&.1+:SZ#+@^']ATJ:f+<YN0Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVO
E+EQs@<?(*I4QLGFCf]=FEDkSASbdsAU&VGDfQ9o+<Xp2AU&<=FF.hH@;K@oAU&VU+B`W*EZek*
DeW]m+EqO9C`m1u+Co1rFCB9&A0>?,+EV:.+E2@4F(K6!AKYo'%144#<GlM\De*E%@q]:k@:OCj
EcWiU7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+E2@4@;TIiAKYT!Ch4%_+<Xp2AU&<=FF-VU6qh<:
ATD4$APdDY@;TIiAM/(9G^U]KDBO%7AKZ28EbfB,B-:`!Eb/a&DfU+U%16?ODIe**DKTf-Eaa'$
I16Mm$<1\MEb-A%Eb-A7Df'&.>YJR*AQXD&ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D
$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'W
Eb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-BOr<(F_tT!EZf:4+DG_(AU"Xk+<Y04CisT4F"SS7BOr;s
AS,@nCige6F!,R<Eb/f)@Wcc8FD,B0+DkP4+ED%7F_l.BBl5&:ATE&=Ci=3(+DtV)ATJu7F`))2
DJ'Cc+<YcEB4Z0uATBCG<,WmiARfal@<6!&DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h
3XlE*$=%%OB5)71G%G]'@<?4#I16Ng@V'1dDL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='
DIIBnI9d9h>\.e`HZit@@UX@mD1)j#>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91
Ci=3(+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_gE+s3&+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%L
HWO*2:eXGT8Q:*j+B3#c+Co%q@<HC.+DGm>0ek@)@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?
@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1
Eb/`lARo@_+EqOABHVD1AKZ&9EbTE(+C'#"G]\%LHWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr
6#:+QFB!0oHX(Z(G]\%LHTj&75(.i3%13OO>\S:kD'08p+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\<
@<iu0DI[U*Eb/a&Cj@.:BkM*qBkM+$+C&JpE+jTBEa`p+ARp33@W-L&A0=JeDJsZ8F!,R<@<<W%
Df0Z*Bl4@e+<YN8G]\(KATJu4Afu/:EbTE(F!+n/A0>f4BOu3,DffZ(EZfILE+O)C+B3#gF!+n-
F)N17Ders*+D,P4+Eqj7E,]B!+Du+8DJsZ8F!,R<@<;qc+<Y04DKK<$DBNb6DJ()'D.7'eA7]9o
F*)G:DJ+#C+B3#c+Eh=:@N\otAU&<=FF/.SCghEsG\1u?DfTB0I4QL^AS!!'@:s/#>]=+aATD?o
HYI)%3d#X_@<?(*Ao`*6Eb'6>/.Dq/+Ceht+C\n)F`V,)+EVNEB4YslEaa'$+C&JpE+jT@DKg,0
E,]B!I3;cg@8pf?>TdWsEZfFG@q[!/DfTB0+EV:*F<G(%DBND"+DkP)F^]*&Gp%<O@;p0sA0>;u
A0>T(F(KB6ARl5W+<YB9+EV:.+D,>(ATJu,ASu("@<?'k+C]U=>]aP%FEDVOC2[X!Blmp,@<?(/
/g+,6Gp$O:+EqB>D/!WrF<GXCD.Oi,@;^3rC`m;"Bln',B+51j+DGm>@;L-rH#k*GARf:mF('*7
+EqOABHUPR@8pf?/e&-s$=%.[A:%m*F_t]1@<?(/%16igA8lR(<HD_lCLqd41,Vfn/g,.U+E_a:
Ebf63F!+t2DJ!Tq+D,P4+E2@>C1Ums+=M2LC2.Zt.4u&::-pQB$;No?+B)i_+EqO8BcqA'B4W30
GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq01o)`03*()E_BthEt&IO67sBhCiaMU
+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h
06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,ATN',AT24$4)AhD
A0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.
Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9
@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=
+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#$;No?+<j`tBkDH;
7Q2M#$;No?%15is/g*nb<(/hj@rH7.DesQ<ARlo34==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<
+CTG3Bk29-F`V+:De:+>4!u.\BOPpi@ru:&%15is/g*V?4"r`aAR]dp+B!?"4(Mf@F`&<L-QmG@
E,8rmARlp-Bln#23A*!@+EqaECLM7%F`(_!$4R>31-73P;Is]RCLnVUF`MM6DKIsVDdd0!-YI".
ATD3q05>E9-QlV9EbupH@WcC$A86$nA8-+,EbT!*FD5Z2-QlV9@r,^bEZc_W%15IEEbm6q1-73P
;e:%n6ZmEiASuTODe't=4==l^A7T7p-RgSp4==l^A1&fW4=>8nBl%i<+BosE+E(d5-RT?16Zd?b
.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:Eb065Bl[c-
-YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l.3L>S$<(VP
AooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9$+Z_A=+=Jrn+BosK+Z_A;
+=C]/Ecl7B,VU?F+?:T+1-$I*-Qjr_-mC\p3?^F=3%$(&+=nW_.3Mh;3?^F=2]sIq-Qjr_-n$<h
+BplL4usf6-RU8g4XhL6+Z_A:-RU>c/0H;f-RT?17Q*=_4&fd4F<FM!DeioGEccCG-XgJ-;f-Gg
AM>ec%16$IBkDH;7Q*=_4&fd4F<EnYF(o,G-Vd6-:`s4UF(o,,FCfN8-Z*:0BkCptFD>`)1,2Nj
/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb
8P`)E3[ZX70J5+9+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;
Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63
C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F
/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl
@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1n
FCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7E,K:t$>OKiA8bs2E+EQk
DdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16ig
A8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>
0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!
%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2
@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@
+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<o
DJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,Eb0;7FD,5.
-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'
Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M9gqfV/g*b^
6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]48l%i-+:SYe
$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeYF`__DDCI+G
$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!
+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4
ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*
$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$
@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM
6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]50eP.41+*M<
7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen
7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8
De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU:IIKZA8c@,/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55r
F%g"O/oY?5%17&bAn5gi01o#.8T&WjDe+!#FD5Z29OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%j
H$!V</oY?5%17&bAn5gi01o#.;f?f!@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-
DJ)R;6pb<lCNXSdATTPDA7c8XE+EQkDdtG#F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo)d
A7f@j@kUi'Bl7QUDe*ZuFCfK$FCd(DA7c8X.1HV^78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>
+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@
6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".F)N12Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)u
FCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;+EVNEF`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5
$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TD
An5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f0
6?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pq
Dfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7
@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg
%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu8
67sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+
Dfp)1AL@oo<^fnb8P`)E3[ZX70J5+9+>"^HATfF1$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.
%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16ig
A92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3
De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0
A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5
BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#
De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)
H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'
DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3
A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2
F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0
A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U
$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(
Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3
Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2
DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#
@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et
+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>
FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'
FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HW'Eb],rAmoguF>>RG67sa,
Eb],rAmoguF<GWV/KeS8AmoguF<GOCDe`inF<GX9FEMOT%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zph%@qBLdATAnK0JY<k$;No?+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
%15is/g+V6Bk)3kBkhQs?TgFm4$"c<-Y[F/GUG((4u%CpBk/>?.3g3SD.Rr7-RgSoC2[WnATf22
De'u5FD5Q4-Qij*:-pQUDe'u"A8,Op?YO7nA7$H`+>Y-YA0<6I%13OO:-pQU@s)g4ASuT4GAhM;
Bl7Q+B6%p5E$-_TFE_;)CER&,+Dtb%A7]9\$;No?+DPh*B4#@fDe*3<3Zoe_Ec6)>-OgCl$;No?
+CfP7Eb0-1+EqaECM@[!+EM[>FCcRH+EVg=@;?uoF!,@3ARo@_%15is/g+nIA92*lC2[Wi4ZX]5
F*22=AL@oo%15is/g+YHEcP`/F<GdGEbfB,B-;#/@ps1b+>"^XG@b2u+CT=6DImBiARl5W:-pQU
FE2#1De!-gC2[Wi4ZX]5Ci<flCh4t'$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3
%15is/g)NUC2[W1+D58-+FPjbB6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXT
Ec<-KA7B+pF=.M):-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M):-pQU-Y[=6
A1&L4ATVs;+?MV3AnQ-,BkCj&+:SYe$;No?+E2IF06hMKAfrZJBl8!'Ecc@FD/Ws!Anbge+EqaE
A9/l-DBO%0EbAs*+Dbt+@;KKa$:IZW<D>nW<'sGU9gMNB?YO7nA7$HB3Zoh)+?CW!.1HW*D/XQ=
E-67FE,m'KH[\_=I4#I2ATD4#AKW@IISP??-OgDX67sC&EbB3,@p`qbDe*2tB4Z0--[U;;IXNRQ
$7QDk%15is/g,4HF<F1O6m-VnATAo/AU/>>/Kf(FEHPu9ATJtd+ED%0Ddd0!FDi:1@ruF.@<?&i
$?L'&F`_SFF<DrRF(KAbAU/>>Eb0<'F<E.XEb0<6@<-H48g%_aEZek*@;]^hF!hD(.!0Au:K(48
4!8l2+=nWi+E2%)CEPGVB4Z0--Y-e#@<HC.<HD_lCLqd4-Rg0^EbTW,+DPk(FD)dEIUd;6Anbm2
F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+=C]2AmoguF<GOCDe`inF<GX9FEMOM%17&pC2.Zt1,2Nj
/h1g\C2.Zt+EK+d+DPh*+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp+<V+#:-pQU@rc-hFCeuD+B)ijFCf;uATAnK0JGEp$;No?+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0K3o[F>5]s@:Wn[A0?21Bl%@%%15is/g)i-De!lD0d'n8A7]9o5uU-B8N8RMA9Da.Et&IO67sB7
3,`;K0f1"eDKBB0FCeu*5uU-B8N8RMF(KH8Bl7Q+Bl8$2+DPh*A7]p,C2[W*F`_>6F!,F1Ea`fr
FCfK6%15is/g)l/A7]7)2B[$OGB.D>FCf>4AoD]48g$,H0JO[Z$;No?+>PWgDg!lo+CSeqF`VY9
A0>K&EZdss3A*!@+:SYe$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F
.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6
DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%J\+=CoBA1%fn%15is
/g+YHEcP`/F<GdGEbfB,B-;8<Blmo//Kf.ZART?s@<3Q/AS#C`A.8l\De*orBkhQs?TgFm-YdR1
F)>i2ATVL)FE8f=$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is/g)NUC2[W1
+D58-+FPjbB6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7B+pF=.M)
:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M):-pQU-Y[=6A1&L4ATVs;+?MV3
FE8R:B6#,/An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ft8l%htGAhM4F!,17
+E(_(ARfg)Ci<flCh4%_6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/nDfp/@F`\aF
EZc`VISP??-OgDoEaa$#+=DMb:4@U=%14L2@4*U@De*KfBkhQs?R[+1ATT%BH[\_=I4#I2.1HUn
$;No?+EM+9+A,Et+E_a:EZf./H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<
FDuAE+=D;QATCFTH#k*KATMF)-OgD2FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%BC2[X%Eb\Tq
ATDQtH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\`R8l%ht
E,ol3ARfg)F(KH9E$l)%H?smPDe*]nBl7:"AU#sc,p5ojBl5%c:IH<RH?smPDe*]nBl5PFAU#XH
CghEsGT^U4Ch54A%14Bj$7-fe:IH=HDfp)1AKY].+Cf>,E,Tf/A0>f&+CQC1F_tT!EZf:4+Cf4r
F)to6/g+,,Bla^j,p6f6Ch4_tF)to0@VfUs+A,Et+Cf4rF)to6+CT.u+D#e:Df]W7DfU+GD..Nt
EbSru%14C(Bl8$2+CQC6Bl7R"AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKIK?$7-,g,p6]9D/a3*Bl7Q+
FD,B0+D,>(AKZ#)EHPu9ATJu5A7fXdFCf\J+F%I6@<?(*%14Bj$7-f;+E1k'CghEsGT\,TH?s=E
A8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+E1k'CghEsGT\,TH?s=EA8PahD@Hq!
+<VeGA7fXdFCf\>+F8?[C2[X"@;0Tg$7-,g,p6W4FCfK1@<?4,AScW$$7-,g,p4<QCis0&@<?(*
+<YuVH>7A/D..-r%14C(+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QCis0&@<?(*+<YuVH>7A/
D..-r%14C(+<YKC@;K@oAU#=?H?smPDe*]nBl4@e%16?SDK'`?HV.(%9PJT[Eaa'$:i^,UD.7<m
/p(ZLI16Mm$=%"^FD,T5HV/3iDBM>"+@9LPATE2.$=%[eFDPN8>]aP%FEDVO,CY(dG%G]8Bl@l6
IXWLa8l%j'+B*3$EarZ'6Z6LH+C&.o>\7nmFDc#=ATMR3AKY6#Ebp)9FEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[W9FE1r(05Y-=FCfJGC2[WsC3+f.DJsQ4@;L"!H=_L6$4R=g+Cf>,D..<m
F!,(5EZee$C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'Ecc#5B-:V*
Ecl20%16?]ATVa"DJ+')HX('!CisT4F(K<=HS]5MI16NgF(KH0ASu.&BR<uoDesQ5DKBB.Ecl20
I=!Y#2/mYc%16?^GAgu0CisT4%13OO>[h8WBl89.De!p,ASuU<%13OO>]!nbATVX.Ch4%_>]aC`
Ch7Ns@rH7,ASuU2%16?YDIm<rCisT4%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d0Bk;K@FCf]F
%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*d(/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[W8
FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe*p2DfTDAFCf]F%13OO>]++sE+*Bj%16?SDK'`?
H[:!QDe*]nCLo,?AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA9E!.CbBg@G^U#.%16?XATr*%
B4VMZ>\S(pF`_tVH>7A/FDl)6F"VQGG^U#.%14CdDIn$2@:s-\$7/qqDIm<rCisT4%14CdBl7m4
FF/H]IV3\>F`;dSIUd;,AM/(9G^U#.%16?XATr*%B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOq
FCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>I
ASu%*A8bt#D.RU,I16M                                                       ~>
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
A8Gt%ATD4$AKY&P5u:BU77KjN<(0n3@:FC&@rc-hFCf;tF*&O8A7]@aF(9&qF))n0F<G10EcZ>A
ATDL'A0>K#BlHpkGB.,2F!,49A8#OjE$/n6A8Gt%ATD4$AQDMn+DPh*Ch\!&Eaa'$?YEkhBOkOn
AT`$0+DPh*Ch\!&Eaa'$?ZL('F<G=:A8c?.D..I#A7fk+DfTB0+DkP-CM.'sF(o9)+E1b0F(Jj"
A7Zm&E+<fsASbdsAU#>:E+<fsASbdsAU#sQF`V,)@X0)=GAL]0AU%g-GAhM4F!iCf-p0UR/mg=U
-Qli,G#N6rCLo1R+C]J-Ch.:!A8Gt%ATD4$AKYW%DdmcS@<6-m6ptTu0JFV^Ci<d(;f-GgAOJp?
0IJ;#-p0UR/mg=U-Qm/BA0>W*A8Gt%ATD4$AKY`+A8Gt%ATD4$AQ3\gF^f/u9jqgKEcW@<De*]n
CLnW'De*s.DesJ;C2[X*FD5P=.4cl04?G0&0d%hdC2[Wl@<6-mFCfN8F!,49A92U+CLqU!F*)IN
.4cl04?G0&0d%hd8l%iA<CokP84c`Z:Jt=<8l%iS:JXY_6<-TN6qBmJ<)6Cp+Abj4<*sBYA8Gt%
ATD4$AKXrJ6r./^:IITH6XO\@+B2-):L?^i6sjeA+B2-):L@jTA8Gt%ATD4$ARB:b+C]J-Ch.:!
A8G[rAU#>,F_PZ&C2[X!Blmp,@<?'s@<?(*+Co%q@<HC.<HD_lCLqd4+D>J1FDl2FC2[W*BPDO0
DfU,<De*Bs@j#N)A7'7uBk;KqFCf\>C2[X!Blmp,@<?'\F(KB-AU/>>C2[X!Blmp,@<?'fDg#i+
G@,H'GT^a>A8lR(<HD_lCLqd4+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)BkCpt
FD>`)F)Q2A@q?d%Eb],rAmoguF<GOCC2.Zt+F8?[C2[X"@;0UdFCf\E.4cl01*AA-,Vh&/0ekF<
0J5.?0K:pF1GpmB+>PW+0JP:;2_HpH1bggI3A`EG+>PW+0JP=:0eP::3A`]P0ebO/1,(I;0ekCB
/i>=C1GgmI3&if=1,(I;0ekF@/i>FA1H70N3&3<51,(I;0ekCB/i>=C1GgmI3&if=1,(I;0ekF@
/iGF<1,:O@2`EW;1,(I;0ekCB/i>=C1GgmI3&if=1,(I;0ekCB/i>=B3&<9K3B8u?1,(I;0ekCB
/i>=B1,gsG0d&5*1,(F;1,ggB2)mTP2)I!F0d&5*1,(F;1,pmC2`EZL0KD*J1*A>+1,(F;1,pmC
3&*3C2)[6K2'=Y.1,(F;1,U[A0fCdE1H.*M2BXb/1,(F;1,ggC0eb==3&*3J3$9t11,1L=0eb49
2_d*K3&*3L2]sk01,1L=0ek:;2`3HP3B&iP1a"P-1,(F;1,ggB3AiWN0ebOF3$9t11,(F;1GCF<
2`3HO2)R*B1a"P-1,(F;1,ggB2D?pA2Dm6K2BXb/1,(F<0JP1:1,^gB0fD$G0d&5*1,(F;1,pmC
2`NZS3&E?G1a"P-1,(F;1,pmD2).'N2DR0G3?U(21,(F;1,ggB1GLmK0f:g21,(I;0etF;/i579
3&`iR1,gs21,(I;0etF;/i,LF2)?sI0ekL-1,(I<0etI;/i,FA0Jb^E1,U100JY=:0etaA1cRHT
1,UdE1,g=20JY=:0f(L92)[?J1GUgJ0f^@30JY@:3AE6@2)@6O1,h-L1cZ[60JY=:1,(F81b^gD
0JGID2`Dj70JY@;1,1I81H.!I2)6sF0esk,0JY=:0et[?1cR<H1c[QQ0Jah,0JY=:1,(F81b^pH
3&E?D2]sk01,1L=0ek:;3&NWK2)-sK2BXb/1,(F;1,U[A1GgmI1H@EM1a"P-1,1L=0ek:;3&NWK
2)-sK2BXb/1,(F;1,U[B0eb@<0JtdJ2BXb/1,1L=0ek:;3&NWK2)-sK2BXb/1,1L=0ek:;3&NWK
2E<`V2]sk01,1L=0ek:;3&NWK2)6jB1E\G,1,(F;1,ggB2)mTP2)I!F0d&5*1,(F;1GCF=2_[*L
0ekI?0d&5*1,(F;1,pmC3&*3C2)[6K2'=Y.1,(F;1,ggB0JkUD2)mHN2'=Y.1,(F;1,ggC0ebC;
0JtXA+>PW+0ekF<0J5.?0f(gL0f(gK+>PW+0ekF<0eP:A2)R?R2`<HK+>PW+0JP:;2_HpI2Dm0F
2`WTI+>PW+0JP:<0J51@2)[BM0f(UE+>PW+0JP:;2_HpF0JbFA2)7*K+>PW+0JP=:1+kC@3&*?G
1,CXA+>PW+0JP=:1+kC@3&*?G1,(^C+>PW+0JP:;3%d'G0fV0O1,^mJ+>PW+0JP:;2_HpC1GU^>
0JtgK+>PW+0JP=:0eP::0K;!O1GUmE+>PW+0JP=:0eP7B2E3NI0ebC+1,(I<0etI;/i,FA0Jb^E
1,U100JY=:0f(L92)[HP2E*QM0f'q-0JY=:0f(L92)[?J1GUgJ0f^@30JY@:3AE6@2)@6O1,h-L
1cZ[60JY=:1,(F81b^gD0JGID2`E0:-p07-1aFh11,(F;1,^aB1G^mE1c[KR2BXb/1,(F<0JP1:
1GgjC1,(OE2]sk01,1L=0eb493AEBG2).'I1*A>+1,(F<0KCaC2`EEF2DI*K1E\G,1,(F<0K1U@
1c%!L3&EHP1*A>+1,(F<0JP1:1GpsK1Gq$G1*A>+1,1L=0eb4:3AENQ2`3BK1*A>+1,(F<0f:R?
1GLmE0fCpI3@QL-4>J$;,Vh&/0JP:;2(ga@2E!?H1H76M+>PW+0JP:;3%d$H2D@$I2E*TT+>PW+
0JP:;3%d'C1c[9L1bgsH+>PW+0ekF<0J5.?1GCX@2)[9N+>PW+0JP:;2D-jI2)@6I0fD$I+>PW+
0JP:;2_HpE1c%-J3A`TO+>PW+0JP:;2(ga@2E<]U0ekLE+>PW+0JP=:0eP:<2E*QK0f(gI+>PW+
0JP:;3%d'E1H.9R2)[-D+>PW+0ekF<0J5.?1Gh'N3&!*F+>PW+0JP:;2_HpE2Dd*G2DI3K+>PW+
0JP:;2_HpE1c%-J3A`TO.4cl01*A=t1,(I<0etI;/i,LG0JG1@3&il?1,(I;0ekFA/i>FE3&EHO
0JPF-1,(I<0etI;/i,LG0JG1@3&il?1,(I;0etFC/i>XK3Ai]T2)dBA/1<V9+>PYs1,(I;0ekCB
/i>=C1Gh!J1c7'31,(I;0ekCB/i>=C1Gh$G0ekR/1,(I;0etF;/i5=C1bg^D2_[-41,(I;0etF;
/i>RF3&`]O1c[Q=1,(I;0ekF;/i5:?0eb@=0Jah,0JY=:0f(L92)[<N0f_3Q1H?R50JY=:0etU=
2D[*I0ebID3B/-:0JY=:0et^@2)-dB2`ETL1,9t-0JY=:1,(U=1H@BL2D[0I3B83;0JY=:0etU=
1c.-N2_ZsF1,^710JY@;1,1L92)$pH1G^mD2`;d60JY=:0etU=2DR-D1cIBK1bg+.0JY=:0et^@
1cI0E2)m?M2)QL30JY=:1,(F81c.!I1H73N1-$I40JY=:0etX>2)[EN1bggD2E;m80JY=:0ekX?
2)%$H1c-m@2)?@10JY=:0ekX?2)%$H1c-mD1,U100JY=:0ekX?2)%$H1c-mA2DcO30JY=:1,(U=
1b^dB2D@$G3&Vm70JY=:0etX>2)I0F2E<NH0K1+00JY=:0etX>2D@$K1GUaC2`Mp80JY@;1,1L9
1cR?O0K(pN0f'q-0JY@;1,1L91cR?O0K1^F2'=Y.1,(F<0JY7;2)-sH2`<ZU1E\G,1,(F<0JP1;
2`3QR2)I-M3?U(21,1L=0JY7<1c@<N0f:aD1a"P-1,(F<0Jb==2_d<J2E!6K2]sk01,(F;1,ggA
3B/iS0JGF>1*A>+1,(F;1,pmD0ebID2`3?G1*A>+1,(F<0K(O?0ekU@1H7BT2'=Y.1,1L=0ek:;
2`!9N2*!TM1a"P-1,1L=0ek:<0fUmJ2E!6H0d&5*1,(F;1,ggA3AENR1H.6K2BXb/1,(F<0Jb=<
3AWNH2)d6J1E\G,1,(F<0JY7;2E*TN1H@9L+>PW+0JP=:1+kC=3B8lS3&WcQ+>PW+0ekF<0eP:B
2)d3H0fUp21,(I<0etI</i5OF2_[*D3Arl?1,(I<0etI</i5OF2_[*D3&rf<1,(I;0etF@/i5:<
3&*<H3B&`:1,(I;0ekFA/i>IC0fD$I0JGF.1,(I;0ekFC/i5OJ2E3NQ0fCj;/1<V7.4cl00I\P$
4>838-p014/3GT                                                            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
