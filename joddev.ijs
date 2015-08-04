NB. JOD dictionary dump:  4 Aug 2015 16:10:52
NB. Generated with JOD version; 0.9.985; 9; 4 Aug 2015 09:05:52
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|232590103446231617475144735166094174823|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DIGITS=:'0123456789'

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.985';9;'4 Aug 2015 09:05:53'

JODVMD=:'0.9.985';9;'4 Aug 2015 09:05:52'

MACROTYPE=:21+i.8

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

TESTYAMMER=:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bget=:3 : 0

NB.*bget v-- retrieves objects from put dictionary backups.
NB.
NB. (bget) implements  a subset of (get). (bget) fetches  objects
NB. from either the last backup or particular backups.
NB.
NB. OBJECTS ARE NOT DEFINED IN LOCALES for the simple reason that
NB. backup fetches may return many versions of the same object.
NB.
NB. Only put  dictionary backups  are searched there is no backup
NB. path.  Also,  there is no corresponding  (bput)  because  the
NB. files  read  by (bget)  are backups that, once  created,  are
NB. never altered by JOD.
NB.
NB. Also,   certain  objects  are  not  fetched,  name   classes,
NB. timestamps and sizes.
NB.
NB. monad:  bget blcl
NB.
NB.   NB. collect from must current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's header

WORD bget y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

ok 'NIMP bget' return. NB. NIMP out for now

NB. NIMP are the requested backup names valid?
NB. NIMP are the requested backups present?

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (WORD,0) bgetobjects__ST y
    case. EXPLAIN  do. WORD bgetexplain__ST y
    case. DOCUMENT do. WORD bgetdocument__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST y
    case. EXPLAIN  do. TEST bgetexplain__ST y
    case. DOCUMENT do. TEST bgetdocument__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. GROUP bgslist__ST y  
    case. DEFAULT  do. GROUP bgetgstext__ST y
    case. EXPLAIN  do. GROUP bgetexplain__ST y
    case. DOCUMENT do. GROUP bgetdocument__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST y
    case. DEFAULT  do. SUITE bgetgstext__ST y
    case. EXPLAIN  do. SUITE bgetexplain__ST y
    case. DOCUMENT do. SUITE bgetdocument__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST y
    case. EXPLAIN  do. MACRO bgetexplain__ST y
    case. DOCUMENT do. MACRO bgetdocument__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__DL do. jderr ERR103 return. end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk        do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS do. jderr ERR010 return. 
elseif. rbk=. ".rbk
        -.rbk e. bn        do. jderr ERR103 return. 
end.

if. (,NDOT)-:alltrim y do.
  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. 

    NB. return full sorted last backup name list
    bfile=. ({.x) dbakf__DL rbk
    NB. errmsg: jfile read failure
    if. badjr ol=. jread bfile;1{CNDIR do. (jderr ERR088,' ->'),<bfile return. end.
    ol=. /:~ ;ol

  isempty pat do. ok ol

elseif. 0=#ol do. ok ol 
elseif. do.
  select. 1{x
    case. 1 do. ok ol nlpfx pat 
    case. 2 do. ok ol nlctn pat
    case. 3 do. ok ol nlsfx pat
    case. do. jderr ERR010
  end.
end.
)

checknttab3=:3 : 0

NB.*checknttab3 v-- checks all three (name,[class],text) tables.
NB.
NB. monad:  checknttab3 bt

if. 3 = cols=. {:$y do.  
  NB. there are two species of three column tables - words 
  NB. and macros - distingquished by the codes in column 1
  if. ((i. 4), MACROTYPE) badblia 1 {"1 y do. jderr ERR014
  NB. macro codes start at 21 much higher than J name class codes
  elseif. 3 < <./ ;1 {"1 y do.
    MACROTYPE checknttab2 y
  elseif. do.
    (i. 4) checknttab2 y
  end.
elseif. 2 = cols do.
  NB. two column tables 
  checknttab y
elseif.do. jderr ERR014
end.
)

compressj=:3 : 0

NB.*compressj v--  removes  all  white  space  from  J words  and
NB. shortens local names. This process reduces the readability of
NB. code and should only be applied to production code.
NB.
NB. monad:  cl =. compressj ct
NB.
NB.   compressj jcr 'verbname'
NB.
NB.   NB. call in object context
NB.   compressj__UT__JODobj jcr_ajod_ 'compressj_base_'

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. check for presence of obfuscation tag
if. o=. 1 e. OBFUSCATE E. ,y do.
  NB. local names less J arguments
  l=. ;(<1;1){m
  l=. l -. JARGS__MK
else.
  NB. local names less any single char names
  l=. ;(<1;1){m
  s=. l #~ 1 = #&> l
  l=. l -. s
end.

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

if. o do.
  NB. form obsfucated name replacements - drop trailing _ in (NAMEALPHA)
  bnr=. (<:#NAMEALPHA)&#.@((}:NAMEALPHA)&i.)^:_1
  r=. ' ' -.~ ,'/' ,"1  (>m) ,"1 '/' ,"1 OBFUSCPFX ,"1 bnr (#m)?OBFUSCCNT   
else.
  NB. form replacements from any remaining chars !(*)=. SHORTNAMES
  NB. J arguments m n x y u v are not on SHORTNAMES
  if. 0=#r=. SHORTNAMES -. ,&.> s do. u return. end.
  if. (#r) < #m do. 
    NB. we have more replacements than available SHORTNAMES
    NB. form base (#r) numbers using SHORTNAMES digits
    bnr=. (#r)&#.@((;r)&i.)^:_1
    r=. r,<"1(#r) }. bnr i. #m
  end.
  r=. ; '/' ,&.> m ,. (#m) {. r
end.

NB. replace tokens
r changetok u
)

createjod=:3 : 0

NB.*createjod  v--  dictionary  object  creation verb. (y)  is  a
NB. dictionary object locale reference. This verb initializes  an
NB. (ijod) locale user interface for the JOD system.  and creates
NB. all necessary subobjects.
NB.
NB. monad:  paRc =. createjod ba
NB.
NB.   JD=: conew 'ajod'
NB.   createjod__JD JD

NB. set default master, profile and user if they don't exist
if. -.wex <'JMASTER' do. JMASTER=:jodsystempath 'jmaster' end.
if. -.wex <'JODPROF' do. JODPROF=:jodsystempath 'jodprofile.ijs' end.
if. -.wex <'JODUSER' do. JODUSER=:jodsystempath 'joduserconfig.ijs' end.

NB. set J version number
JVERSION_ajod_=: (jvn :: _9:) ''

NB. create master file if necessary
if. -. fex <JMASTER,IJF do.
  if. badrc mdat=. createmast JMASTER do. mdat return. end.
end.

NB. execute any user script - allows for redefintions of various
NB. class nouns before JOD objects are created - joduserconfig.ijs
NB. is not installed and must be created by users
if. fex <JODUSER do.
  NB. attempt execution of script - obfuscate names (/:)=: 
  if. (_9 -: ((0!:0) :: _9:) <JODUSER){0 1 do. (jderr ERR026),<13!:12 '' return. end.
end.

NB. initialize master dictionary parameters - used when
NB. creating directory objects to insure that all master
NB. parameters are set in directory objects - this amends
NB. the "jod" class to exploit inheritance in all derived classes
if. badjr mdat=. jread JMASTER;CNMFPARMS do. jderr ERR006 return. end.
MASTERPARMS_ajod_=: > mdat

NB. extension objects and complete (ijod) interface (*)=. JODEXT IZJODALL
JODEXT=: 0$a:
IZJODALL=: IzJODinterface,<'JODobj'

NB. create storage, scratch, maker and utility objects !(*)=. JOD ST SO MK UT
JOD=: y
ST=: conew 'ajodstore'
MK=: conew 'ajodmake'
UT=: conew 'ajodutil'

NB. empty classless object - must see ijod
SO=: cocreate ''    
('ijod';'z') copath ;SO

obs=. JOD;ST;MK;UT;<SO

NB. initialize objects - they need to know each other
createst__ST obs
createmk__MK obs
createut__UT obs

NB. create direct _n_ (ijod) locale interface - if the (ijod)
NB. trap word (jodsf) exists define an error trapping interface
".&.> y defzface IzJODinterface

NB. attempt to create J temp directory ignoring errors
NB. required for JOD edit utilities and not always present on J systems
makedir <jpath '~temp/'

NB. execute any master dictionary profile script
if. fex <JODPROF do. (_9 -: ((0!:0) :: _9:) <JODPROF){1 0 else. 1 end.
)

dbakf=:4 : 0

NB.*dbakf v-- fully qualified backup file path.
NB.
NB. dyad:  clPath =. iaObjectNc dbakf iaBackupNum
NB.
NB.  0 dbakf 17   NB. backup 17 of jwords.ijf
NB.  4 dbakf 5    NB. backup 5 of jmacros.ijf

NB. !(*)=. BAK
BAK,(":y),'j',(;dnnm x),'s',IJF 
)

ed=:3 : 0

NB.*ed v-- edit dictionary objects.
NB.
NB. (ed) typically fetches, formats and places object(s) in an edit window.
NB.
NB. monad:  ed cl|blcl|bt
NB.
NB.   ed 'wordname'
NB.
NB.   ed ;:'many words mashed into one edit script
NB.
NB.   NB. edit contents of (name,value) and (name,class,value) tables
NB.   ed ; }. 0 10 get }. dnl 're'
NB.   ed ; }. 4 get }. 4 dnl 'build'
NB.   
NB.   NB. place many backup versions in edit window
NB.   ed ; }. bget <;._1 ' word.12 word.11 word.09 word.02'
NB.   ed ; }. 4 bget <;._1 'macro.9 macro.7 macro.2'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. 2=#$ y do. 
  if. badrc uv=. checknttab3 y do. uv return.
  elseif. 3 = {:$ uv=. rv uv   do.
    if. 3 >: <./ jc=. ;1{"1 uv do.
      NB. convert binary nouns to linear representations
      jc=. I. 0=jc
      if. badrc nv=. 0 nounlrep__MK jc{uv do. nv return. end.
      uv=. (rv nv) jc} uv
      NB. format words for editing
      text=. _2 }. ; (0 {"1 uv) ,. (<'=:') ,. (2 {"1 uv) ,. <2#LF
    else.
      NB. format non words for editing
      text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF 
    end.  
  elseif.do.
    NB. format non words for editing
    text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF
  end.
  NB. set default object name - if there is more than one 
  NB. object reset (x) to prevent affixing document command  
  oname=. ;0{0{uv [ x=.  1 < #uv 	
elseif. badrc uv=. x obtext y do. uv return. 
elseif.do. 
  'oname text'=. }.uv 
end.

NB. undocumented and seldom used feature - removed unless someone complains
NB. if. wex <'EDLOCALE' do.   NB. !(*)=. EDLOCALE
NB.   NB. set up to define objects into specified locale if requested
NB.   pfx=.'18!:4 <''',EDLOCALE,''' [ CRLOC_ajodutil_=: 18!:5 '''' '
NB.   sfx=. '18!:4 CRLOC_ajodutil_'
NB.   text=. pfx,LF,LF,text,LF,LF,sfx
NB. end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',oname) changestr DOCUMENTCOMMAND_ijod_
end.

oname et text
)

getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)

lg=:3 : 0

NB.*lg v-- make and load JOD group.
NB.
NB. (lg) assembles and loads  JOD group  scripts. The monad loads
NB. without  the  postprocessor  and  the  dyad  loads  with  the
NB. postprocessor.
NB.
NB. monad:  lg clGroup
NB.
NB.   lg 'groupname'  NB. no postprocessor
NB.
NB. dyad:  uu lg clGroup
NB.
NB.   2 lg 'group'    NB. no postprocessor
NB.   lg~  'group'    NB. postprocessor

NB. (/:)=: obfuscate names
2 lg y
:
if. x-:2 do.
  NB. 2 _2 make assembles entire group script
  NB. with preamble regardless of where the
  NB. group appears on the JOD path
  msg=. OK00404 NB. okmsg: group loaded
  t=. 2 _2 make y
else.
  msg=. OK00405 NB. okmsg: group loaded with postprocessor
  t=. 2 mls y
end.
'r s'=. 2{.t
if. r do.
  curr=. 18!:5 ''   NB. current locale
  18!:4 <'base'     NB. run script from base
  try. 0!:0 s
  catchd.
    18!:4 curr      NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  18!:4 curr        NB. restore locale
  ok (y),msg
else.
  t
end.
)

loadwords=:4 : 0

NB.*loadwords v-- loads dictionary words into target locales.

DL=. {: y  NB. obfuscate (/:)=: directory object !(*)=. DL

NB. NIMP GETFACTOR not used yet
NB. read words and determine name class
if. badjr wu=. jread WF__DL;x{WORDCN__DL do.
  jderr ERR088  NB. errmsg: read failure
else.
  bu=.   0 ~: ; 1&{&> wu
  loc=. >{. y  NB. target locale

  NB. define words that are not nouns
  NB. NIMP may be able to speed things up by switching
  NB. to target locale in top of script and then switching
  NB. back to current - eliminates need to hard wire target locale
  NB. to each word.

  try.
    if. #vu=. bu#wu do.
      0!:0  ; (({.&> vu) ,&.> <loc,'=:') ,&.> ({:&> vu) ,&.> <LF
    end.

    NB. define nouns
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)

nounlrep=:4 : 0

NB.*nounlrep v-- converts nouns stored as binary  to linear  text
NB. representations. Uses  a  scratch locale to temporarily define
NB. nouns.
NB.
NB. dyad:  iaNoex nounlrep bt

if. #y do.
  clearso 0
  names=. (errnames=. {."1 y) ,&.> locsfx SO  NB. !(*)=. SO
  try.
    (names)=: (3!:2)&.> {:"1 y
    names=. (5!:5@<)&.> names
  catch. (jderr ERR016),errnames return. end. NB. retain scratch on failure
  if. x do. names=. names ,&.> LF end.
  y=. names (<a:;2)} y
  clearso 0
end.
ok <y
)

obtext=:4 : 0

NB.*obtext v-- assembles and returns object text
NB.
NB. dyad:  bt =. iaObject obtext blcl

if. badrc text=. checkopen__ST y do. text return. end.
select. x
case. WORD do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. (WORD,NVTABLE) get y do. text return. end.
  if. badrc text=. WORD wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case. DICTIONARY do.
  if. badrc text=. DICTIONARY get '' do. text return. else. text=. rv text end.
  file=. (' ' -.~ ;0{0{DPATH__ST__JODobj),'_DTXT' NB. HARDCODE document text suffix
case. SUITE;GROUP do.
  if. badrc text=. (x,2) make y do. text return. else. text=. rv text end.
  file=. y -. ' '
case. TEST;MACRO do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. x get y do. text return. end.
  if. badrc text=. x wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case.do.
  if. (<x) e. {(SUITE,GROUP);HEADER  do. 
    NB. group and suite headers are frequently edited
    if. badcl y do. jderr ERR0154__MK return. end.
    if. badrc uv=. ({.x) get y do. uv return. else. 'file text'=. , rv uv end.
  elseif. (<x) e. ,{OBJECTNC;DOCUMENT,EXPLAIN do.
    NB. get object documentation text
    if. badrc uv=. x get y do. uv return.
    else.
      NB. merge all document texts
      file=. >{.{. uv=. rv uv
      text=. ; ({:"1 uv) ,&.> <2#LF  NB. HARDCODE 2
     end.
  elseif.do.
    jderr ERR001 return. NB. errmsg: invalid option(s)
  end.
end.
ok file;text
)

od=:3 : 0

NB.*od v-- opens and closes dictionaries.
NB.
NB. monad: od clDictionary|blclDictionary
NB.
NB. dyad:  iaOption od clDictionary|blclDictionary
NB.
NB.   od 'test dictionary';'another test dictionary'  NB. open r/w
NB.   3 od 'test dictionary'                          NB. close

1 od y
:
msg=. ERR005 NB. errmsg: invalid or missing dictionary names

NB. list all registered dictionaries (short form)
if. badjr mdt=. jread JMASTER;CNMFTAB do.
  jderr ERR006 return.
end.
dl=. 0{>mdt

select. x
case. 1 do.   NB. HARDCODE: magic numbers read/write codes

  if. isempty y do. ok /:~ dl
  else.
    NB. open read/write
    y=. boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. boxopen ,y
  if. *./y e. dl do. y opendict__ST 2;mdt else. jderr msg end.

case. 3 do.

  NB. close dictionaries
  if. badrc msg1=. checkopen__ST 0 do. msg1 return. end.
  if. isempty y do. y=. {."1 DPATH__ST else. y=.boxopen ,y end.
  if. *./y e. dl do. mdt closedict__ST y else. jderr msg end.

case. 4 do.

  NB. HARDCODE (mdt rows) display dictionary names and source paths
  mdt=. jpathsep&.> 0 2{>mdt
  ok <(/:0{mdt){ |: mdt

case. 5 do. 

  NB. return the currently registered dictionaries as a (regd) script
  mdt=. quote&.> 0 2{>mdt
  mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt
  NB. prefix command to close and unregister all current dictionaries
  mdt=. 'require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,mdt
  ok 'NB. JOD registrations: ',(tstamp ''),LF,jpathsep mdt
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

rm=:3 : 0

NB.*rm v-- runs J macro scripts
NB.
NB. monad:  rm cl|blcl
NB. dyad:  pa rm cl|blcl

NB. (/:)=: obfuscate names
0 rm y
:
if. badrc uv=. MACRO get y do. uv return. end.
uv=. rv uv

if. *./um=. JSCRIPT = ; 1 {"1 uv do.

  scr=. ;({:"1 uv) ,&.> LF
  curr=. 18!:5 ''

  try.
    NB. run from base, (display default, suppress x.-:1) stop on errors
    18!:4 <'base'
    if. x-:1 do. 0!:100 scr else. 0!:101 scr end.
    18!:4 curr
  catchd.
    18!:4 curr  NB. restore locale
    (jderr ERR0256),<13!:12 '' return.
  end.

else.
  NB. errmsg: not J script(s)
  (jderr ERR0252),(-.um)#{."1 uv
end.
)

rtt=:3 : 0

NB.*rtt v-- runs J test scripts
NB.
NB. monad:  rtt cl|blcl
NB.
NB.   rtt 'runmytautology'
NB.   rtt ;: 'run these tautology tests in order'
NB.
NB. dyad:
NB.
NB.   0 rtt 'tautology'
NB.   1 rtt 'silenttautology'
NB.   2 rtt 'plaintest'
NB.   3 rtt 'suite'   NB. make and run tautology test suite
NB.   4 rtt 'suite'   NB. make suite and run silently

0 rtt y
:

NB. HARDCODE: option codes (/:)=: obfuscate names
if. (3-:x) +. 4-:x do. 
  if. badrc uv=. (SUITE,_2) make y do. uv return. end.
  scr=.rv uv
  x=. x-3 NB. run option
else. 
  if. badrc uv=. TEST get y do. uv return. end.
  uv=. rv uv
  scr=. ;({:"1 uv) ,&.> LF
end.

curr=. 18!:5 ''

NB. run from base, (display default, suppress x-:1), stop on errors
18!:4 <'base'
try.
  if. 0-:x     do. 0!:2 scr
  NB. Note: silent execution that fails suppresses all output
  elseif. 1-:x do. (] [ 1!:2&2) 0!:3 scr 
  elseif. 2-:x do. 0!:001 scr
  elseif.do.
    18!:4 curr
    jderr ERR001 return.
  end.
catchd.
  18!:4 curr
  (jderr ERR0256),<13!:12 '' return. 
end.

NB. back to original locale
18!:4 curr
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1X.1,^71+>t>t2]sh3+>u"u1,9t-2]sh/+>Yer0fC.01E\D,+>Y_p2BXb1+?:Q'1E\\#1GL"4
+>l/%3?U+8+>GPm1GU(0+>beq3?U7=+>GSn1c$77+>tqs3?U+4+>P&p1E\D++>bhr1*A>.+?:Q$
1*AP!2DQC5+>Yer3$:"8+>P&p0H`.o0f_cn5t".>B6%p5E$/S,A0>r9Blmo/BOtU_ATAo'De*EN
H:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WATT%C
F(KH.De*R"FCfK)@:Njt8U=!)6tpO\ATDBk@qAS<5u'g6;FGSJ@;]UaEb$;&DfTD38l%htBl8$(
Eb8`iAP%2?:IK;CDesJe:IJ/X:J=\0-u!F7A18X8DKKH1Amo1\+EqaEA9/k98U=!)7!3TcDKKH1
Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k
+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APGHX;GU7p:do50@rcK1FCf]=+EVmJ
ATKCFA7]^kDIdfL+A,R";Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8iC
6:OsR6U=[?Ddm=$F(8X#AKYf-@ps0rBk1dmFD5?$ATDi7FCAfX6:OsR6UOUJDIIBn+E(_$F`V&$
FD5Z2+Dbb/BlkIL+D>J%BOu3,G%#30ATJu1ATMo8Ch[ZrCj@.FD]iP+@<6*X6:OsR6Vp6SDdm=$
F(8X#Bl@l3Ci<flC`mG&ASuU(Anbgs+E2@4AncKh78m/g5tt'B;KQJkF<GF3F)tc&AKZ&<Blmiu
+>"]j+E)-?0Hb:GAn#CaFE1r7EbT*.ATJu4@VTIaFE8R:Ec5e;A8,OqBl@ltEd8d:@:O(qE-#K+
Cia/rEard(ARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;+D,P4+EM76E,9).
@q]:k@:OCjEZf14F*&OD@<?U&Ec,r.BOt[hDKKu/@P_M-ARfLs+CT)&+EV:;ARuu4DIIBn/6cV#
@<6Kq/9GHJF=A>S@:F%aF(9-*E,oN2F)#`,D/XT/F!+n-C`mq8Blmo/F)YPtAKYT*Df$Uh+EqaE
A9/l%DIal2BQ%p5ASuQ3Ci<flC`mV(D.RcuEb/[$ASQ-oA8,OqBl@ltEd8dG@VTIaF<G(6ART[p
Df-\@ATD6kA7]:cF<G+.@ruF'DIIR2+E(_(ARfh'B4Z1&FE;P4D/a-!F<GI0D.P7@@rc-hFD5Z2
+CT.u+DbJ-F<GOFF<G[>D.Rd1@;Tt)ChITnCLnVsDIal+Ddd0!8l%htB6%p5E,9H$A9Vs4A92R*
@:XF%A8,OqBl@ltEd8dODfTB0+DG_8D]j.1EbAs*+Dbt+@;KLrDJsZ8CiX*+@rH7.ATDm6+Du+?
DK?qAFDl22A0><%+C]&&@<-W9FDi:<Bl7KjEZfI8G]Y'KAT2[$F(K62@<?4%DKB`*FCf]=@<6L$
D.7<mF!+n/A0>o(FEMVAF!,C1C1Ums+EV1>FDuAE@;Kb%F)Z8DF!+n-C`mh6D.Rd1@;Tt)+>"^W
ARuu4B4Z0nCi"37.<99GF`)7C8g%tZ@rcK1F(96)E--/AFEDPGDK?pm+EV19F<GX7EbTK7Er  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ud<+>P&o0H`)(0JkX00esk,0JkO-0esk,2`EN80ea_)0etL,0ea_*1bpp23?U%80ea_*0d&8,
3AFu\Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n@W$!2+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+
F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(
Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0II;::-pQU
+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>K0b"Ib67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&
?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\
<.->-$4R>^F`2A54ZXr<-RU5l5U\01-RU8h.6o:+INUg85U\cB-RU8h.4G]5%15is/g+e<DImis
FCcS'Cht55Df]u6@VfTuG%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&Hc$?K]jEBQ?*5!!C1
+>Y,_:-pQUF(Jd#@q[!)F^]*#AnbgsEt&IkDIYgj+<VdLBeCMb+<XEG/g*b/GAhM4+DtV)AKYK!
@<6K!$4R>;67sC(@;KXg+DbV$F<DuV.3N&>B6A'&DKKq/$;No?+<VdL7;Q[KARlo++@KpRFD5Z2
@<-W\De*F#+<VdL+<VdL6tp.QBl@ltEd:#jA7]g\ARTUhBHSE?+<VdL=)W+i;e9BX@q\J0@;TRC
CghC++<VdL+<VdL+<XBe@rcKdARTUhBMDoFEc6&FE+KIcCgh?s4ZX]64D?E%.3L/a-p/\-+AY<r
771$L6XO8:De*3(+=nW`/:/d@6:s[6<),ef@;9^k?R\'X@q]j2+=nW`/:/cr=&2^^?X[\fA7$cI
F(8m'4)$;i1asOu+=Jdf-nJ(Y6W-]e@;9^k?R\'X@q]jD9gM-E:K1In7:0J<De*3(%13OO:-pQU
G%#3$A0>o,B4uB0.![6a@<-"'D.RU,+E1b2FCfK1Et&IO67sB'+<Y64E--@J+C\bhCNXT+DKI!D
+CT)&Bl7Bg@r$4++<YN0FCT!)ARf:hF<D\KD..NrBPD?n@:O(qE"*.p@<-!D3Zodt+<W`g+=Ach
+<VdL+<Vdg+=AdODfor>-QkJn+<W%L@;TR'+<VdL+<W`g-Z3@0AM.J2F`):K%13OO:-pQUAoD^,
@<?Q5@;Ka&G%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&IO67sB.:-pQU-Qjra0d%T#+u(2a
3[QIC+>Fum+>P'd+u(2_4s279-Qll9C`k)S+=nX/3Zp."/0K9^-p2<SEb?gD/0I&pF`2A5-8%J)
Eaa!$%13OO4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:E
B6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+
-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r
/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&$4R>;
67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-
$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k)X1FEV=%15is/g+YEART[l+EV:;ARuun
@:O(qE,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'D@Hq:0RIbI@r#Tt-Zip@FD>`)0II;:
%15is/g,4H@rH6q+E(_(ARfg)@rH1"ARfgrDf-!k4tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC&
BPDKt+E(_(ARfg)@rH1"ARfgrDf-!k4tq>&@:O(`+=D8BF*)/8A2#A?$4R=O$;No?+<Y-2C`k)Q
%13OO:-pQU+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8%16QQA8ZO,4ZX]5/ghbm
+<iih0f'q&+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq+D,Y4D'0s=Df0-2BleB-
DKI"1@:O(qE$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQpDImi20HahBC`m1qA8ZO,
%16uaEZd(Z@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\@W$!)@UWebF_qQpDImi2
1a$7FC`m1qA8ZO,%13OO:-pQU+C]5)+=AdODfor>-OgDX67sB'@W$!)-Z3@0AL@oo:-pQU+C]5)
+=D&8D.P>0Dfor>-OgCl$;No?+>=pIDJUFC-OgCl$;No?+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'
+>=pIDJUFC/gh)8%15is/g)hj@W$!)-SAnIF`):K%15is/g)hj@W$!)-Z3@0AL@oo:-pQU0HahB
C`k*C@;TR.@rHL-F=.M):-pQU0d'qCC`k)Q%13OO:-pQU0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
0d'qCC`k)X-OgCl$;No?+>G!JDJUFC/n8gBDKI68$;No?+>G!JDJUFCDIIBn-OgDX67sB8+C]5)
+=D&8D.P>0Dfor>-OgDX67sB9+C]5)+=ANG$4R>;67sB9+C]5)+=Ach%14LmDJUFC/gi(j/NP"0
+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M):-pQU1*C%DC`k*C@;TR'%15is/g)nl@W$!)
-Z3@0AM.J2F`):K%15is/g)qm@W$!)-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$
@W$!)-S?bU$4R>;67sB:+C]5)+=AdODfor>-OgDX67sB:+C]5)+=D&8D.P(($;No?+>Y-LDJUFC
DIIBn/n8gBDKI68$;No?+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1+=Ach.3L3'+>b3M
DJUFC/gh)8%15is/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo:-pQU1a$7FC`k*C
@;TR.@rHL-F=.M):-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`(m@W$!)-S?bU$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)+=D&8D.P(($;No?
+>=om+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on+C]5)+=Ach%14Lm
DJUFC/gi(j/NP".+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M):-pQU0H`+n@W$!)
-Z3@0AL@oo:-pQU0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q%13OO:-pQU0H`.o
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)+=AdODfor>-OgDX
67sB7+>Y-LDJUFCDIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Fun+C]5)+=ANG
$4R>;67sB8+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO:-pQU0d&1n@W$!)
-SAnIF`):K%15is/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
0d&4o@W$!)-RT?1%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o@W$!)-S?bU$4R>;
67sB8+>P'KDJUFC/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo+C]5)+=D&8D.P>0
Dfor>-OgDX67sB8+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>Y-L
DJUFC/gh)8%15is/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0AL@oo:-pQU0d&7p
@W$!)-Z3@0AM.J2F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp1#0d'qCC`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9+>G!JDJUFCDIIBn
-OgDX67sB9+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;67sB9+>P'KDJUFC
/gh)8-t7(1+=Ach.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnIF`):K%15is/g)nl
1*C%DC`k*C@;TR'%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q@W$!)-RT?1%15is
/g)nl1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9+>Y-LDJUFC/n8gB
DKI68$;No?+>P&q+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>G!J
DJUFC-OgCl$;No?+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC/gh)8%15is/g)qm
0d'qCC`k)X@rHL-F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)-Z3@0AM.J2F`):K
%15is/g)qm1*C%DC`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1*C%DC`k)X
-OgCl$;No?+>Y,q+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX67sB:+>P'KDJUFC
DIIBn/n8gBDKI68$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'
+>Y,r+C]5)+=Ach%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.EC`k*C@;TR'%15is
/g)qm1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn0d'qCC`k)X-OgD2
@W$!)-S?bq+>#Vs1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68$;No?+>b2q+C]5)
+=D&8D.P(($;No?+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC-OgCl$;No?+>b2r
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%DC`k)X@rHL-F=.M)
:-pQU1a"Or@W$!)-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E^.EC`k)Q
%13OO:-pQU1a"Rs@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl$;No?+>b2s+C]5)
+=AdODfor>-OgDX67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn/n8gBDKI68$;No?
+>=om+>=pIDJUFC-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>=pIDJUFC
/gh)8%15is/g)hj0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0AL@oo:-pQU0H`(m
0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m0d'qCC`k)X-OgD2
@W$!)-S?bq+>#Vs0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gBDKI68$;No?+>=om
+>G!JDJUFCDIIBn-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fuo+C]5)+=ANG
$4R>;67sB7+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach%13OO:-pQU0H`(m
1*C%DC`k)X@rHL-F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o@W$!)-Z3@0AM.J2
F`):K%15is/g)hj0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!
0d&7p@W$!)-S?bU$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup+C]5)+=D&8D.P((
$;No?+>=om+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl$;No?+>=on+>=pI
DJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n@W$!)-SAnIF`):K
%15is/g)hj1*A7n@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`+n
0d'qCC`k)Q%13OO:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0d'qCC`k)X-OgCl
$;No?+>=on+>G!JDJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX67sB7+>P&o+C]5)
+=D&8D.P>0Dfor>-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)+=Ach%14LmDJUFC
/gi(j/NP".+>P&p+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M):-pQU0H`+n1*C%D
C`k*C@;TR'%15is/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q@W$!)-RT?1%15is
/g)hj1*A@q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;67sB7+>P&q+C]5)
+=AdODfor>-OgDX67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFCDIIBn/n8gBDKI68
$;No?+>=oo+>=pIDJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>=pI
DJUFC/gh)8%15is/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)-Z3@0AL@oo:-pQU
0H`.o0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU0H`.o0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC/n8gBDKI68$;No?
+>=oo+>G!JDJUFCDIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,q+C]5)
+=ANG$4R>;67sB7+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)+=Ach%13OO:-pQU
0H`.o1*C%DC`k)X@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj1E\Fq@W$!)-Z3@0
AM.J2F`):K%15is/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!1E\Ir@W$!)-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7+>Y,r+C]5)+=D&8
D.P(($;No?+>=oo+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)-RT?1%15is/g)tn
0d&5++C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?+>b2q+>PYo@W$!)
-SAnIF`):K%15is/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&5,+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,9t]DJUFC/gh)8%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo1*C%DC`k*C@;TR'
%15is/g)tn0d&5,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q%13OO:-pQU1a"Lq
1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;+>Fuo1E^.EC`k)X
@rHL-F=.M):-pQU1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,L+_DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5.
+C]5)+=Ach%13OO:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1%15is/g)tn0d&5/
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q+>Pes@W$!)-SAnI
F`):K%15is/g)tn0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0AM.J2F`):K%15is
/g)tn0d&50+C]5)+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,^7a
DJUFC/gh)8%15is/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIHC`k*C@;TR'%15is
/g)tn0d&50+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO:-pQU1a"Lq1,g=b
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo2]uRIC`k)X@rHL-
F=.M):-pQU1a"Lq1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.@rHL-F=.M):-pQU
1a"Lq1,pCcDJUFC-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&52+C]5)
+=Ach%13OO:-pQU1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)-Z3@0AL@oo:-pQU
1a"Lq1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is/g)tn1*A>,+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo@W$!)-SAnIF`):K
%15is/g)tn1*A>,+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>-+C]5)+=ANG$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,9t]DJUFC
/gh)8%15is/g)tn1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C@;TR'%15is/g)tn
1*A>-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU1a"Or1,C%^DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.EC`k)X@rHL-F=.M)
:-pQU1a"Or1,C%^DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,L+_DJUFC-OgCl$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>/+C]5)+=Ach
%13OO:-pQU1a"Or1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Or
1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn1*A>0+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)-SAnIF`):K%15is
/g)tn1*A>0+C]5)+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>1
+C]5)+=ANG$4R>;67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,^7aDJUFC/gh)8
%15is/g)tn1*A>1+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'%15is/g)tn1*A>1
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or1,g=bDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X@rHL-F=.M):-pQU
1a"Or1,g=bDJUFCDIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,pCc
DJUFC-OgCl$;No?+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3+C]5)+=Ach%13OO
:-pQU1a"Or1,pCcDJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Or1,pCc
DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnIF`):K%15is/g)tn
1E\G-+C]5)+=D&8D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G.+C]5)
+=ANG$4R>;67sB;+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]DJUFC/gh)8%15is
/g)tn1E\G.+C]5)+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is/g)tn1E\G.+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs
1,C%^DJUFCDIIBn-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,L+_DJUFC
-OgCl$;No?+>b2s+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)+=Ach%13OO:-pQU
1a"Rs1,L+_DJUFC/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Rs1,L+_DJUFC
DIIBn/n8gBDKI68$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Y,q2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K%15is/g)tn1E\G1
+C]5)+=D&8D.P(($;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G2+C]5)+=ANG
$4R>;67sB;+>Y,q2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC/gh)8%15is/g)tn
1E\G2+C]5)+=AdODfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn1E\G2+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+>Pku@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs1,g=b
DJUFCDIIBn-OgDX67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC-OgCl
$;No?+>b2s+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach%13OO:-pQU1a"Rs
1,pCcDJUFC/n8gBDKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs1,pCcDJUFCDIIBn
/n8gBDKI68$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn"kE,&<gDeio<0MXqe.V!C6E,&<g
Deio<0HbHh/Kf.HF*&NQ@rH4'C+19C@;TQuDdm=$F(8X#Bl@lA%15is/e&._67sB^BOu'(FD,5.
+EMXFBl7Q+-ndV14ZX].@;p0s@<-E3+DG^9+CQBb+<YlHEb$:8-t@14E,$gEGA1l0%15is/g,(A
Ap&0)@<?''@;^?5+Dbt+@;I'(@;TRs/g*r!Ap&0)@<?'k+DtV)ATJt:@V'1dDBL'GBln#2FD,4p
$;No?+E2@4AncK4+=L#P7TEAS:e"P9+<Y*1A0<!;ASu$$+EqOABHSF<@;]UoD'0s1@<6!&+AP3s
76sUD83m[l:-pQUF*2),Bm=31+<Ve:Df0Z;Des6$A0<"(Gp"4X:I7NN;aWoI<%0FB+<X3hB4tjs
+<VeM@;L'tF!)TDAdo)B67sB/:I7NN;aWoI<%/r&ASu("@<?''Ci=3(ATAo%DIal+ATMo8Ch[Zr
Cj@.FD]iP+@<6*)DIIBnF"Rn/:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+<Vd].3N&?F*2>2
F!,R9F*&O8Bk)7!Df0!(Gp"MWATMs.De(ON+D#e3F*)I4$;No?%15is/g+SFFD,T53ZoP;DeO#2
6nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eX
D/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%159QHZ*F;-Zip@FD>`)
0IIuI+>Y-YA0<!B-OgCl$;No?+Cf(nEa`I"ATAo8@:F%a+ED%4Eb0<'DKK</Bl@l3De:,,+EqaE
A90:E@ps1i3ZoP[@r`\>G%G]'-OgDt@ra^n><3m44"akp+=JruHXSNU+=nX>3Zp:'3]/$B%13OO
:-pQUA7]@eDIjr7DfTA2GA2/4+E(_$F`V&$FD5Z2%17#_Ap&0)@<?'tAM?8.+>Y-$+>=63:-pQU
-ndV14ZX^(@V0b(@psIj+Dbt+@;I'(@;TRs%14J!De!3lF!,R<@<<W)ATT&=ASH0q-Ts()Gmt*m
DfT3.Df90)/g,E^A8a(0$6UI-De!3lEt&I!+EqC2Eb#Ud+<YA@4Y@j%Ci<flCi^$m+<YkN4Y@jk
%16ZaA1e;u.1HUn$;No?+Dbt+@;I'*Cgh$q+DtV)ATJ:fCi3ZuATL!q+?Lu60fq*=+F>4m+>G!c
+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'
DIIR2%16Ze+EVI>Ci<f+E-67F-Z<I+F`V&$FCf<#0II;:%15is/g,1G@:UKi@:O'q@;]TuA7]@e
DIjr7Bln#2Ddm=$F(8X#ARlp$@;TRs%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z<I+F`V&$FCf<#
0II;:%15is/g+tK@ps0rDdm=$F(8X#ARlp$@;TRs%17#k@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c
0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]CLoLd3F=-C$4R=j,B%I.D.Rc;+?^hlCi3ZuATJ:f
%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+E).+D.Rbt$4R>`BQ%p5ASu?r0KhH>1E\_$0F\@:Ci<fl
Ci^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n
$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt
$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>F(fK4FCf?,AM@IW5s]R/DeioE3B:Fo
%13OO:-pQUF*)>@AKY])+Co1rFD5Z2@<-W&$>"6#FDYu5Ddso/F`\`RF(fK4FCf?,AM>J@$4R>;
67sC$ART*l@UWb^+CT.u+Co%qBl7Jk$8EZ-+>=s"0JG4(>9H!^HXgu2E,$LCF(fK4FCf?,AM>J@
$4R>;67sBsDe!3l+EM47Ec`FA@;TRs%17/o@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1
-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$7I-?DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9
E+*g/+Dbq(D.Rc2/1r&dDIIBnEt&Hc$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No0
0F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GVDf'H.;f-Gg
AM>i667s`tDf'H.;f-GgAM>h]F=f'e-t@14E,$gEG%#3$A0><$B6A'&DKI"BD/X3$+EV19FE9&A
:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(C9F(K;E0a^ZB/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTg
Dg!ll+E_X6@<?'k+D,P4+A,Et+>>E./i5'c:-pQU0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V
@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^ZuE/g)8Z+<VdL+<Y*1A0>c$G9A;TD/X3$/7N%/
Bk&]1@<-!l/9>oRATMoD@rc^5BIP'GATMs-DJ()4AS5^oAI8cSDe!p1Eb0-1+=CW,F(H^+Eb065
Bl[c--YdR1FCfN8ATB.*$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I
+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OO@%Bl8!'Ec`EOBkhQs-OL3&ATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
$4:?b+E(d5-Zip@FD>`)0II27:-pQUBl8!'Ec`FFDf'&.F*(i.A79Lh+EqaEA9/l8D]iP.D/aN,
F)q[^Df02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X3Zp4$3Zp*`$=[pl+?_>"Eb/ZqCjBi8DJ*iq
D.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to+>=.@An?3u@qB_&Bm+'/FCB&t@<,n"+?_>"
@W-/l$?TriFCB3$@<5sfD..'kDJ*C!DJsT<@;]UaEb&U#@;Ka&4Y@jdDf6aJ+F+;$-WEN&8P`>b
+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh6r-lZ-QkQ)+C]8-$48.N9M[u@9N*'&=@5b^
6q'Kk4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-VSGrB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@h*
@j"tu-ZW]>FEhmT4ZX]qDf'H.+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+LC(0d'[CF)>i<
FDuAE+EVjM$4:ifDfTq_3Zp4$3Zp*`:-pQUDIIBnF!+n-CiX)qA9f;9DIjr#BOPp(/KeqLF<G(,
@;]^hA-ua./pReL4YC.c.NgJRH9Elh+=\LZ+=\LZ$7Q;hATAo8D/a<0@j#`5F<DrPBQ%p5-OOm(
+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.DM+Bot0D/XQ=E-67FFEhm7$4:]\C1UmsEb/j(4ZX]A
+?CW!$>Epc?XI_\C1Ums4Y@k&+AP6U+CoC5DJsV>@rH4'Eb0<5+E(_(ARfh'$>aX%FC/BhDI6ah
@VTIaFC/BbDf000F(oQ14Y@j4$4:<XEb/a&?[-g??Tg"aGp#jK/g+\C+Du+>+Cf>,E,oN2F!,:;
@ps1bEsa?'$>"6#FDYu5Ddso/F`\`RDdmHm@rua&Aof=,Eap4r+=D2>+EVjM-TsM#Df'H.+=D):
C1UmsEb/j(-OMRN>9J!(Dfp/@F`\aJG]X9"B5DKq@;KsqAog*r1E\_$0FDH/Ddm-kF!)qT@<,p%
.NiVIF<E%U@rH4'Eb0<5ARlo5+F+;C$4:?b+EVI>Ci<f+E-67F-YI76@UX(nAS-!2$?BW!>9G;6
@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=,0d'[CF)>i<FDuAE+EVjM$47,NARfObEb/d&@rH<t
F$2Q,1a"h%0FA.^67sBkARfObEb/c(F(9--ATJu&Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,od:-pQU
AU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=De!@"Es`7mG%G]7Bk1d<3bN8I@UX(o4ZX^1
+<XEG/gr1u4Y@jqG%G]7Bk1ctB5DKq@;Kul$=[pl4YCDdD`o^pDf7ck+>Fu]+<VdL:-pQU-n6Z/
3ZqmMD]i_3D]j.?D[Hh`DfT3&@;TRs/g,E^A8a(-+<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBp
D/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT\+<VdL-[0,EB4Z0-@rc^0@q]Fa+E)CE+E(j7
AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.RbqASu$2$4:HbD]gMPGmYu-$>"6#FDYu5Ddso/F`\`R
A7]7e@<,piF(9--ATK4+Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7ARfObEb/d&@rH<tF!h;L+Bot0
D/XQ=E-67FFEhm7$>jL%ARojlDfB9/4ZX]A+?CW!$49Np/g+tK@ps0rBlbD*F)u&.DIm?$Ci<fl
C`m/(A0>N$Ddm-k$;No?+EqL1DBNA*Gp$s<G\(D.F(9--ATJu&Eb-A(ATVKnFCeu*Df0B:$;No?
+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2,/KcHSCi<d(.3NYBE,Tc=EsbZ//g+S?A0>SsASuU(Anbgt
+Dkh;ARlp)@rH<tEs`7jDe!3l4Y@k&$>aWj@;J(f+>P&h+Dbt+@;H9"$4:?b+EVI>Ci<f+E-67F
-Z*RBARojlDfB9/-OOm(+Bos9Eap56G]Y;r3ZqpND/a54-Z*RBARojlDfB9/-OMRN>9J!(Dfp/@
F`\aJG]X9"@rH6sF`V,)F(9--ATL!q+>Y-$+>=-0:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!
@<6L(Anba`FD5Z2+DGn<F_,V$:-pQUCh[Zr+Cf>-Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPt
AKY].+ED%1Dg#]&/db??/g,7LBlbD2F!,R<AKZ&&An?%*+EV:2DJ()6D]iS//g)99BOr;7B5DKq
F"%Gk67sC(ATD6&A7]jo@ruc7@;]TuEb03.Ecc@F@rH6sF`V,)+Co%nCgh?mFD5Z2F"Re,:-pQU
@W-0-BlbD-ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k+>"^KD]iY+B6A6+$4:6\D`r@g+<VdL+<VdL
:-pQU-n6Z//g+VAD[L/rD`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmMD[Ip#$>"6#FDYu5Ddso/F`\`R
@rH6sF`V,)F(9--ATK4+Eap4r+=D2>+EVjM-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!h;%:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.sDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,A8,RQD/X3$0JH6g/h1CGA5d>`CLo1R+ET1e+=Lc7A18XBD/X3$+EV19
F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is
/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQU+<WHh+AtWo6s!8X<(.pOATMr9
A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8A2#PWFCfN8C2[W;/0K%GF*)/8A2,bh+EV19
FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)
0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQa
Ftks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,V
Ec5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd
3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQU
FD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'+DGJ+DfTE1+DGpFF!+n3B6A'&
DKKqP%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/>?%13OO:-pQUDKTf*ATAo3AftVu@ruF'DIIR"
ATJu4DBNn,FD)e6F`VXID..NrBFP;'+?^hl+FPjbA8,Qs0F\?u$>"6#De'tP3[]#\F*)/8A2,3K
ATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63%16Ze+E]h.+>=pKBk/>?%14s8
4Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#1E^UH+?MV3FCfN8C2[W:+EV19
FD>`)0eb:/%16Ze+E]h.+Co1s+FYFe%14m64Wksl0d(FL@r!30%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eX
D/X3$3B9*,A8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R+ET1e+=Lc<CagKJD/X3$+EV19FE9&D$;No?
%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5B6A'&DKI!D@psFiF!)TDAfr3EA8Z34/g)93
F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;G%#3$A0>AjF(KD8@<,p%@;L"'+EV19FCeu8
%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J0F\@a67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&
?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\
<.->-$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19
FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b
4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.@ruF'DIIR2+DGm>Df-\>BOr<*@<?/l$8N_e
+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/FEn<&0H`M$,<d5)+F>4b+CoA++=ANG$8<Sc
+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'MDJUFC-OgD:+?^hl4s2R&HQY*eA8Z3+-RT?1
0H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0F<GXCD.Oi5ATD7$%178r@;TRs4ZX]5@Wuj'
0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp$=\4"A2-5.+>"$0@Wuj'1-IZ@1E\_$-[6a`
+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH0RInYE,9H&+E2IF+?MW-DIIBnEt&Hc$;No?
+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&NEb$jHDKg,30d(@XEb$pJDKg,31E^RZEb%!S
%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu-tt:V1*AA%4")g;5;=i@4"*'K+=/-p2'=Y"
2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5Ddso/F`\`f3c8hDD.Rbt$4R=O$7KG&C`k)Q
.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f-nlcSDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;
+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG
/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"
ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-NDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs
3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o%14L;+>G!LDJUFC@Wui?.3L3'+>G!#+?MW-
DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC1aa^p/NP"/+?L]-3[\fhEb%!S
+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mIDKg,3
0de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pKDJUFC-Ql/N/g,.V@;KXiBk;<-ATDg0EcVZs
DImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q%13OO-nlbu+>=pKDJUFC-Rg/i3Zp."4!6UG
DJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKDJsZ8F"%P*-nlbu+>=pKDJUFCDKg,3
1aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3AS,Y$+=M,GF`)7L%14L;+>P&n+CoA++=D2?
1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2Bl7NsGT\DPDfor=.1HV40H`.o0HanDC`k*9
0deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4+EM[;AncK4-uNsGDK@69$4R>[ATAnI+>b2p
+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.$>sEq+>=op+>Y-NDJUFCEb$O?+:SZqATAnI
+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DARDf028%16uaEZd%Y0H`+nA8Z3+-XgXrBl5:-
$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%
Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo/NP"/+?L]-3[\B\Eb$sR+AP6U+EqaEA0>i3
AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo/NP"/+?L]-3[\B\Eb$sR+<Ve%67sC)DfTA2
Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mP+<VdL:-pQUGAhM4
+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GXA5d>`CLo1R:-pQ_ARn_V
Deio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WLDIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA
67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5
Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>
AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*
D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9
@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<
-OgCl$;No?+DG_7ATDl8-uX9?Ed)P<FCcmDGAhM4F!,C5+Eh16BlA-8+EVmJATJ:f@W-1$@W-NT
3Zp*c$>+*m@<??t4ZX]?3B&',+?pu)+>P&p+=&'g2[p*cBOQ'q6YKnK@:OCjE]lH+-YRFB+Dl72
BHVM;De'u7Dfol,+CQC:Df9//@q^!pCER,#F^o27%16WaF^f/uE,9Z<F`(i1De)!l+=fJq5ThR<
%16N\E+O'#Dfe-'+=8]M$?pArD.RcO3ZpLF-Xq"4Cgq=.+D,G.@<??t+A$6TG%F$S@<,ddFCfJ8
A8cU"Ch7R%F`V\CB5_^!+CT,+ATD="F=.M)4tq>*D/a<0@j#`5F<GdF@;TRs%159QHZUr)3Zp+!
0ea__ATT&=DIIBnEt&Hc$;No?+D#(tF<GdGEb$:@DIIBn/7WL)F)rmSAU&;G+EV%$Ch4%_0d'[C
F(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4GA^i+ATJtu+D#(+4#))(0F\?u$;No?+DG_7
ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^F`\`RFCfN8@;Kmr@5'A_4"!ci/g+kGDJs$'
F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^
F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[IAU&;E%159QHScjaF`\`RD.-ppDddI$BONSK
-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$BONSL-Ta(<4!ua*.j-Po%13OO4tq>*0g.Q?
0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)BONSB%13OO:-pQUARoLs+EV19F=;$8D.P8?
AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsU+>"]`/3>P4FDbN(ATJtu+D#(+
4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,I4cX!+CoA++=D#7@rcKrCiF&r0II;:%15is
/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(t
FDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4%13OO4tq=>+E(d5-Zip@FD>`)0II;:%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?oJA79RkC2[WnBleB:Bju4,Bl@la67sa1E+EC!ASQ-oA8-+,
EbT!*FD5Z2+EK+d+E_X6@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df.0:$;No?+:SZQ67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EZcJ6$;No?+CfG'@<?'k3Zq4.FDkW"EZd+k0Js:H:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>>cl@<jUf+ED%1Dg#]&+DG_7FCB!%+C\c$F!+n/A0>r'EbTK7F!*%WF(oK1
Ch[KqATJtd5tiD<@;0V$AStpo@q?)V:-pQU0K=,bE&'6m@:Wn[A0>Q"F*)>@GqO2`F<G[D+Co2-
FE2))F`_2*+D,>(ATJ:f:-pQU0em9O@PK\^@rH(!F(KB6+=Cl<De(4<@:Wn[A1VJ6A1hh3Afu,*
D/XT/A0>K)Df$VCBlFLg:-pQU+<VdL+<VdLB5_^$Ch580De*EuCh7i6A8-'q@ruX0Gp%6KA79Rk
+ED%1Dg#]&%15is/g)l'An>F+2]ujRA8l'k/p)>[+Co2,ARfh#Ed8dHCgggbBQ%]tATAo%A7T7^
%15is/g)l'D..]E3$;sSA7TUg05P??Fa.eBFCfMGFEhmM@:Wn[A.8l@67sB812:rL1,'h!F(KH.
@:WneDK'$+BQGUF@:Wn[A0>K&EZfR?DCcoHBl8'</0Je<@j#`!FD)*j:-pQU0f!KdDDEsi@:Wn[
A0<:;@:O1nFCfN#<*3*K+:SZQ67sB812:rL1,U1dDfT?%DJ().Bl7K)ASu%"+=M>M8gt2V:-pQU
0f!KdCbRdj@rH=3+Co2-F<GmDE$07@+CoM2E+3a1+D,P.A7]cj$;No?+>G]fF`&rl+ED%1Dg#\7
A9)U-@W-K6AoDKrATAo'DfBt2$;No?+>G`j@<+(\+ED%1Dg#\7H=gl-ATJtG+D,>(ATJu9D]gYb
/h^sXA7T7p04A[2ASs/BFCB9&0.nk0+Co2,ARfh#EbT*+%15is/g)l+C3=>I2'?pND/XT/+=LuC
A8,plAU%QQ<)$%8+DbJ,B4W3(@WQI(ATVK+DdmHm@rr.e%16T`@s)g4ASuT4-XpM*AL@oo@rGjn
@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%0ARTXk+Co1rFD5Z2@<-'nEt&IdF`MLc3ZqsI
A0<Q8$9g.j1E^UH+=ANG$9g.jDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^s5$4R>;67sBmATVEq+ED%5
F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6o4tq>*D/a<0@j#DqF<Gua+D5_6
+=CW@Bl%<pDe(4)$4R>WDe+$&EcYr5DEU$'/3Yb78l%iU9gfEt%15is/g*b^6m-Pm@:s:lB-:`!
Eb/a&DfU+GF`(`$EZf=DF<G+.@ruF'DIIR"ATJu&Ch[Hu+Co2,ARfh#Ed8*$8l%iR<'a#C6qL9>
3Zr0V@<?1(AT/b?+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!)
:IK,1C+1\]F*(i'AM7e:A1o;>$4R>;67sC%@rc:&FE8uUCggdo+CT.u+C\c$Et&ItCcsg%-YR48
FDl2FC2[W*Bl8!6@;KapDe'u2ATMF)C2[W*C2[X%@<-4++DPh*E,ol/Bl%?'D..<rAn?%*C2[W*
CggdaG[YH.Ch5:S0d(4LA8,q'Ec3(8De*C$D/^j3$?L#H3ZrK[/12Q6@:DWID/^V4De*<gF*&O=
DKBo.Ci!j)A7Ath+ED%7ATV[*A7Ath+DPh*E,o]1+DPh*F`V,7@rH6sBkLm`CF9PuF)4!#+?MV,
F)3BT+DPh*E+EQf<*3*BCh[d0G]%GAATM3X=B$D[@:O1nFCfN#<*3*I%13OOEap4r+=D2>+DPh*
F(95<4ZX]B+D58-+EM?.$4R>;67sC%ATT&9@rc:&FE7lu.!mQj0d(4LA927$.6T^7HTE?*+DPh*
F(95"$4R>;67sC$F`&<o5tiD<@;]dkATMr&$7I;V+Z_>40I\,*3Zp+;.3NJ9DJ<]oF*)/8A.8kT
$;No?+E_X6@<?''Anc'mEt&I14=G;i8g%keA8kstD0%-K+<VdL+D,h<Blmo/8l%iR<'a#C6qL9-
-YdR1E+*d(F"V0AF!hD(0K^b*Db;-eDe*g-De<^"ALS`E+<Y9?EbTW,+A,Et;cH%Q779^F/151N
A8lR-Anc'm/no'A-OgD:4=G;i8g%e]F*)>@H"q8..3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YR48
FDl2F/p)>[-OgD:4=G;i8g%keA8lR-Anc'm.3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YdR1@UX%*
C2[X%Ec5Q(Ch7'aCG'=9F!hD(0K^b*Db;-eDe*fqEc#kH+<VdL+<Y9?EbTW,+A,Et;cH%Q779^F
/151NA7At_05>E9E+*d(F(/Qn/no'A-OgD:4=G;i8g%keA9Ds)Eas$*Anbme@;@;7+D,h<Blmo/
8l%iR<'a#C6qL9--YdR1@UX%*C2[X*F(KB%Df00$B4>:b/no'A-OgD:4=G;i8g%tZDJ<]oF*)/8
A18WD+D,h<Blmo/8l%iR<'a#C6qL9--Z*:0BkCptF=q9BF!hD(0K^b*Db;-g@:Eem@;Tt"AM>em
.3N5HEbTW,+A,Et;cH%Q779^F/151NA8G[`F"_?<@V'dmD/a<&0JG46Bkh]:%14dO.!0B"+A?3Q
7!3?c.3K`U+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2Cggd`F_u(MBkh]:%14dO.!0B"
+DPh*Bl8$5D^ceO+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WsDKKo;/no'B-OgD:
4=G;i8g%keA7Th"E%)nP+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo05>E9A9Da./no'B
-OgD:4=G;i8g%keA7B+kF=A=T+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo05>E9@V'V&
/no'B-OgCl$;No?+D#_-DKL#0Ci"A>@;^"*BOu3,E,ol3ARfg)D..<jB4Z*+CggcqGA1l0+C\n)
@:Wn[A0;<g%15is/g,4WDfTD3BQS*-+DG_(AU#=L+E)@8ATAo3DJX$)AKYT!Ch7Z1@:NeYF)to'
+EhI-+DG_8ATD["F<GC6DJO;&$;No?+>>o+FDjboC2[WsDId='?V"-j9IV)rGB.D>AKXT@6rR&N
7n#g;;Cj21De*Bs@kVM;D/<a$@kVS8A8,plAU#h@FDYhA%13OO:-pQUF*)>@AKY`+A8l'k/p)>[
+E2.*@q?crDerrqEZet4EZf+8A1hh3AfrZJ@<Q'nCggdhAKYo/Ch[cu%14dO.!0B"+DPh*E+EQf
<*3*K+D,h<Blmo/8l%iR<'a#C6qL9--YdR1A8bs2E+EQkDdtG8De*ftAhJ1MF=.M)%15is/g,4W
DfTD3Ch[d0GV<oB@j#i3ARfFdBk&9'DffQ3%14dO.!0B"+Dbb0Fa.eBFCfN#<*3*K+D,h<Blmo/
8l%iR<'a#C6qL9--YdR1A8bs2Ch[d0G]%GAATKJGG]Y;B$8=RjFDjboD.-plDffQ3?W:-,.3K`U
Ap890FCcRe:IJ,\5t=@38Q%)eC2[WnDdtG;@:O1nFCfMGFEhmT%13OO:-pQUEb00.ASqqa4tq=>
+E(d5-RT?14tq>%A0?:Q@s)g4%13OOF)>i<FDuAE+=CoBA0>r8@:s-oA8-'q@ruX0Gp%6KA79Rk
A1%fn%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%13      ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o1*A>4+>GVo1Gg4/0H`).+>GPm0fL48+>kqt1,0n-1Lk??E,&<gDeio<0Q^lIF<DuA
Df'H..3NM:D.Oi.@V0b(@psInDf0''D/a5gD/X3$0JOtcDf'H..3NeBCh[E&@<-"'D.RU,+EMC<
CLnW1ATMs7A8,RQD/X3$0JFncBk/Y8F)>i2AKZ)+F*(r1Cf>1hCLo1R-tI43.3N\KDeio,FCfN8
F(Jl\D/X3$0JIQbDeio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3N_@@VfTuARoLs
Bl7R+E+EC!ASQ-oA8-+,EbT!*FD5Z2F`:l"FCfM9Anc'mF!,17+A,Et+Co2-FE2))F`_>9D?  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*AD01H$@20H`+n1c%!D+>GSn1*A>+3&;[30H`+n0f:gJ2'=V0+>P&p1,^p2
0fL41+?2>;+>Get1*AJ11a"M-+>P&o1cR030f^@3+>l,4+>Get1*A;.1Gh^"6pamF9LMEC;cHOj
=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35
F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cPgL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f:(G
F_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K'7F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Get8p+qm1,(F?+>GW41bh$H
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fL4I
F_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iDs$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0d')2C`kJe0f:(.0fh$F
3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh
1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe0f:(.0fh'G3\rMu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1a#D5C`kJe0f:(.
2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#$49Np/g+)<F*(u13Zq$j6m+TS
@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,L+GF_i0U0JPF-
0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.;+<X'\
FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$F$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1-$ILF_i0U0JPF-0ebXB1-.0L$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1-$ILF_i0U
0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."
+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-0KD0K2``WL$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_+>PW*2'=V-3\iTS1GT:E$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Y-+F_;gP0JPF-
0ek^D3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[
ANCqi+@1-_+>PW*2'=V.3\rNP0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS2BX,1@<?'A+>Y-+F_;gP0JPF-0ek^G2**HI$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqi+@1-_+>PW*2'=V23\WBO2)>RH$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L
1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj
+@1-_+>PW*2'=S53\WEP2)5M2:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A
+>t?7F_i0U0JPF-0ek^E1cdBM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=#3?TG4@<?'A+>G_r8p+qm1,(F?+>>f:2)REO3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2D?6r6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV
1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[
ANCqg2'>M6C`kJe0f:(.0KLmE3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp=9+<X'\FCdKU0fL4IF_i0U0JPF-0ebXG3'&cM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1E[f.@<?'A+>Get8p+qm1,(F?+>GW4
1H7EL2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DcO!
6t(1K3Zp.9+A-cm+>PW*2'=V/3]&QP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>u)"+@KX[ANCqg2]t_8C`kJe0f:(.1cdBK3]&Z#$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-
0fM-I0fh$J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
2]s52@<?'A+>PYo8p+qm1,(F?+>GT30K2$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2E2g%6t(1K3Zp14+A-cm+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u5&+@KX[ANCqh1E];4C`kJe
0f:(.0KM'I3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp@8+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0d%T,@<?'A+>P_q8p+qm1,(F?+>GT31,CsI1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm
+>PW*2'=V23\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+?))!+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@<+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K3BB#S$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2'=#0@<?'A+>Po!
8p+qm1,(F?+>G`71cRNM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2`;d$6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f04E$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)5%+@KX[ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU
1-$ILF_i0U0JPF-0ebXG3'&fP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3b
Ch+Y`F_tT!E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-3'&iO3\r`&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Js1E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$
6$6f_1,(F?+>GQ21,_0L1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArR$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G3\W>s$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_
+>PW*2'=V.3]&]T0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp4$6$6f_1,(F?+>G`70JkgJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*L$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`
0f:(-3BAiO3]/]#@WcC$A86$nBkh]E0ht%f.UmO7Ch.:!A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%
FCeu*C2[WsC3(M=@rc:&FE8QIBl5%9C2[WqBlj\W67sBkBl[cpFDl2F/db??/db??/g,=KEaiI!
Bl,m<:-pQ?:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6jc[U/g)8Z
1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+$;No?
+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8
FD,B0+EM%5BlJ/$:-pQ?:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1
-nuicF`;;?ATMp(F!,16E,95uBlkJ305i9H:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+AQhtATDg0
EZek*ARfLiDJ(R/:-pQU;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>f:-pQ?:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F;C3=DJ1($cC/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTcF`&ll+CSek
ARlouDe*g-De<^"AM.\3F!,49A8kstD0%=DC3(M4De+!3ATD:!DJ!Tq@UX%)Bkh\r:-pQU0f<BY
E\K6kEb0*+G%G2,H=gl-ATJtG+E)CEE-67FA8-'q@ru9m+EVNEC2[WqBlkJ?DId=!+CT)#ASqh^
@rGk"EcP`/F<Dr?@<6!-$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I
+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ARfY!A0>f0ASrW$
Bk)7!Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEsci(D`p-(I4cXQBk/>?$?'Gt4$"a(
De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OL2U67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8
Bl@l3FE1f"CM@[!+Du+?DK?/,D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4&C2[X+ATDj+Df.^!
+=o]1HV.(%<_Ysh$;No?+CT)#ASrW*De*QsF!,"-Eb/a&DfU+18l%iF8Q8;X6qL!L:dJ&O4ZX]0
/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL$;+)^7nHZP
:IIcH;c#bZ83K!VC2dU'BQIa(+A,Et7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"0..)6:-pQU
B4YslEaa'$+Cf>,D.RU,ARloU:IH=8CghC++EM%5BlJ08$>O'e@<6L$F$2Q,4$"a(De'u*De*p2
DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5d+De*HoCh7ZN3Zoh51*BpY
.3NJ9CLnhV+DPD&@<6L$Es`7L67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^$7KY!CghC+ATJtF-8%J)
4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Yp$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A
@rc:&FE7d:Eap55EapI[3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq
@UX%"$7L6R+u(3]EapO]3Zrc1+u(3]EaoF`:-pQUF`:l"FCcS*Bl[cpFDl2F+D,>(ATJ2J8PDQO
4ZX]6C1D'gF)to6+=nX^/g<"mF)kb>+=nil4s2s8/no'A-ON=79LVlC3Zoh58l%iF8Q8;X6qL!L
:dJ&O.3L/g/j:CI8PDQO$8=SWDe*BeF<D\K+<Ve=GB.D>AKX&gHU^S#78jOI4DJeFF*)>@ARo4k
+D,h<Blmo/4#)(O8PDQO$8=SWDe*Bs@Urnh+<Ve=GB.D>AKX&iHU^S#78jOI4DJeFD..3kA79R&
+D,h<Blmo/4#;4Q8PDQO$8=SWDe+!4Bl%<gF<D]<GB.D>AKX&kHU^S#78jOI4DJeFFDl)6F(A^$
+D,h<Blmo/4#M@S8PDQO$8=SWDe*d(A79R&+<Ve=GB.D>AKX&mHU^S#78jOI4DJeFE,ol/Bl%?'
+D,h<Blmo/4#_LU8PDQO$8=SWDe*fqEc#k?+<Ve=GB.D>AKX&oHU^S#78jOI4DJeFF`V,7@rH6s
BkLm`CEOa3GB.D>AKX&pHU^S#78jO#F)>i<FDuAE+=CZ;D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RI
E+EC!ARm.qF)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ8.#]!67sC$ATMs3Eb-A3E+No0A8,OqBl@lt
EbT*+$?'GtDf9P:>9G^EDe(4C$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5
@<6*B3B:FRBPDO0DfU,<De(U^%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B/l=/KdM\6k'J4$6Uf@?uKR`+CSeqF`VY9
A0>u4+E2@4AncK4Eb/ltF*)G2FD5Z2+Cf>,D..<mF!,[@FD)e)Eb065Bl[c--YI".ATD3q05>E9
-X\P9$4R=e,9n<b/ibOE3%uI,+@1-_F`VXI0e=G&0JPEo$6UH#$6Uf@5p1&VG9D!9B-:S1001OF
3aa(EF!,L7@rH!tBmO?$+C]U=?t4+lE,&c5+BN5fDBO%7BlbD=@:p]sF!,FBATMF#F:AR"+<YB9
+CQC:DfTA2Ci<flC`mV(D.Rc2@<,p%Ddm=$F(8X#ARlomGp$L)Df'H.?m'0$F*(u%A0>f&+C\nr
DJ()5BQ%p5ASu'i/g(T1+<Ve+BOr<.@:p]j-nR&#4ZZsnDg#]4EbT&qF!,C1Ap&0)@<?4%DD!&-
@V0b(@psInDf-\-@;[2sAKZ,:AS-($+D,P4%144#+EqaEA9/l8BOQ!*Ecl7BB4YslEa`c,F(96)
E--.DGA2/4+CHlH3\Xqo+<XHhAp&0)@<?4%DBNe)CLqQ0DIIBn+Cf4rF(f-+%144#+D,&&+DbV1
F!,:5CLq=-/g+,,AKYAjDf'H.?m'#uFE2XLBl5&$C2[W8E+EQg+D>2)+C\nnDBO(@A79RkA0>u4
%144#+Co&)@rc9mAKZ).BlbD,BOPdkAM,)7$4R=b.NiY=F)Pl+FCcS&85r;W?m&uu@s)X"DKI"8
DId='+ED%1Dg#]&+D,Y4D'3>,Eb-@c:IHfE$4R=b.NiP9EbAr+DJsZ8F!,L7D/XT/A0>K)Df$V)
F`_>6F'p,4D]j(3A9DBn+CoD7DJX6"A0>r-H=\]<$4R=b.Ni,1A7-NtDg*=;@;]UlATJtBDIIBn
/9GHJF=A>@DIak<DIIBn/7WL)F)rmSAU&;G+EV%$Ch7Z?+:SYe$6UH6+<VdL+AP6U+D,2,@qZuo
@:O(qE$0=8EcYr5DK?q=AftM)GAhM4+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3ZqmEATT%W
4"akp+=A:PAR[8I0d(LJ@PKkcEb/]40KC7rAR[8G2^]%A+<VdL+<VdLARlp$@rr.e%144#+<VdL
+<XEG/g+b;FCSu,@UWb^F`8I9Ec6)>+D>=pA7]e&+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]
3Zp1#0d'q<ATT%W4"akp+=A:EBOtU_/ho('@W-0;0eje`BOtU_/hf:5%144#+<VdL+<Y6++Dt\2
%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++DkOsEc6"A@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+>b3MB4Z0-4?G0&0d%hdG@`B]1E^+HAM,Ys+C\bhCLq$/0JahoE$l)%+<VdL+<VdLARlp$
@rr.e%144#+<VdL+<XEG/g+b;FCSu,E+*j%+EqaEA9/l;Bln$,F`\a:AS,XoBl7Q+@;]TuARoLs
%144#+<VdL+<W%P@j#Z!F=044+>=om0Hb">F<Gua+CoA++=D2@-OgD*+<VdL+<Ve<A0>c"F:AQd
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2'=;=DId<tASu$iDI[6#6t(?`7:^+SBl@l<%13OO
+=\L"+Dtb'@<?4,AKYo1FD5Z2+Cf>#AKYAf0f38\BOPs)@V'+g+CSekARlp*D]iG#ATV<&@;]Tu
?uU71?m'Q0%144#+EM[EE,Tc=+EV=7ATMs%D/^V=ATDKnCh\3(FD5Z2/g+5/ASrV_:IH=<ASu("
@<?(%+CoV3E$043EbTK7Et&I!+<YlBFD)e)D..3k?m'0*+CoD%F!,@=F<G:8@r-9uAKYo#C1Ums
+CfG'@<?4%DBNA*A0>\sF*&O7BOPdkAISth+<Yc?D.Rd1@;Tt)/g*\rDI[6/+EqL1DBN@1A9Da.
+EM%5BlJ/:BlbD;F`&`QBlkJ<ATMF)Et&I!+<YT3C1Ums+EV=7ATMs%D/aP=FDi:GBOu'(.VWuS
+EDUBF!)rMDfd+GBOu'(FD,5.A8,OqBl@ltEd8*$+<VeF@VTIaFE8RKBOu3q+CfG'@<?'k+E)9C
CghC,+Cf(nDJ*Nk/h.td%13OO+<VdL+<VdL:-pQUDIIBn04T$6@<?4%DD,g7F*)ADF<G[>D.Rd1
@;Tt)%144#+<VdL+<W%P@j#u;F!j+3+>=pF0f1"cATT&C/g,1GG&JKN-OgD*+<VdL+<VdSEap5)
FE8fm3Zp1#?SOA[B4Z0-I4cWt+ED%:D]gDT%13OO+<VdL+<VdL:-pQU.!KcS/8''G.3N&>AKYH#
G\(D.FCAWpATJu<Bln#2-t7"&CagKE@;TRs+DG^9FD,5.Anc:,F<GUBG9C=3A.8kg+<VdL+<Ve%
67sBmCi<a(Bl7Q+Ao_<iFD5Z2@;I&s@<itDAooIEH$O[\D/Efo/nSW:FD5T'F*(i-E-!.9DBO%7
AKZ&*@rH6q%13OO+<VdL+<VdL:-pQUF`:l"FCcS6F`\a:Bk)7!Df0!(Gp%3CD.Rd1@;Tt)+:SZ#
+<VdL+<Vd\+C?i[+E2IF+EqpK+:SZ#+<VdL+<Vd^+C?i[+E2IF+D5e;+<V+#+<VdL+<VdL%144-
+@.,fATo8)A8lU$FC651@<,dnATVL(+CJ)9<'a)N5t=@O+D>2)+C\nnDBN@uA7]9oFDi:3Df0Z;
Deoji+<Ve;F_u)3DJ()6Bl.F&FCB$*F"SS:BOu'(?rBEm5tOg;7n$f.AU%p1FE8R5DIal(F!,O8
F<G[D+CHp3+:SZ#+<Yc?D.Rd1@;Tt)+CT;%+EM+7BjkglH=^V0@;]Tu@;p0sDId<h+EVNEA9Da.
+EM%5BlJ08/g+,,AKYMpAmoguF:AR"+<Yi9Cis;3BlbD)0OQLU?rBEm5tOg;7n$f.BlbD*+Dtb7
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZee.A0?)1ChsOf+<VeEDfd+5G\M5@+DG^9A8,OqBl@ltEbT*+
+CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/e&.1+<XWsBlbD,@;[2sAKYJr@;]^hA0>?,+ED%'
Eb/[$Bl7Q+FD,5.D..L-ATAo*Bl%?'?tsOeF*(u6/no'4?m#mc+<Ve8DIal1ASc9nA8,po+Co1r
FD5Z2@<-'nF!,(8Df$V-F_u(?F(96)E--.R+B)i_+CJr&A1hh3Amc&T+<Ve=DfQt;DfTD3A7]jk
Bl%iC+B<Ak@<?''FD,5.?tsUjA8bt#D.RU,?m&lgA8c?.FDi:7ATT%($6UH6FD,5.@s)g4ASuT4
?tsUj/oY?5?m'#kBln'-DD!%@$6UH6%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,Oq
Bl@ltEd8dH@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+CSek+EV=7ATMs%D/aP=FDi:4
F_u(?F(96)E--.1$6UH6+<VdL+CoG4ATT%B;FOPN8PVQA741/O%13OO+<VdL+<VdL:-pQUA9Da.
+EM%5BlJ08+Du+A+Cf>-FCAm$+E(_(ARfg)FD5T'F*(i-E,uHq+<VdL+<VdLD..3k+=ANG$4R=b
.Ni,9Ci`u,@q]:gB4YTrFDi:EF(HJ3ATo8)A8lU$FC651@<,dnATVL(+CJ)C:K0eZ9LM<I?nMlq
+<Ve.BOu'(?rBcr<(9YW6q(!]+D#e3F*)IG@;]TuBlbD*+CJr'@<?0j+A*bdDf00$B6A6+A0;<g
+<Ve=DerrqEZeb,Ci`u,GB.D>ATJu,ASu("@<?'k+EM%5BlJ08+EVNEFD,5.?tsXhFD,&)AoDKr
ATBC4$6UH68S0)Q;GU(f7Sc]G78dM9A8c%#+Du+>+D#e3F*&OCEZf(;+Du+>+CQB8@rH6sBkMR/
ARlokC2dU'BODrpDerrqEX`?u+<Y<.DImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4FDi:CFCB&t
@<,m$A8,OqBl@ltEd8d>DerrqEcWiB$6UH6?rBcr<(9YW6q(!]+DGm>@;L"'+CQC1ATo89@<,dn
ATVL(+CT.u+EqO9C`mV6F<G.>BleA=Bl4@e+<Ve;Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8
BPDN1G%G]8Bl@lA+<V+#%144#+<VdL+<Y36F(KG9-RU$367sC%BQ&);E-67FA8,OqBl@ltEd8dH
@<,dnATVL(+EM+9FD5W*Et&Hc$6UH6+<VdL+AP6U+EM+9+Au!2<(9YW6q'urFDi:1+A*bdDf00$
B6A6+A0>K&Ch.*t%144#+<VdL+<Y36F(KG9-W3`9<(9YW6q(!$4"#K"F(KAFC2[X'Df9_F%13OO
+<VdL+<VdL:-pQUB4YslEaa'$A0>r'EbTK7F!+n3AKYl/G9D*MBlnH.DBO%>+EV:.+A*bgDerrq
EX`?u+<VdL+<VeDCi^^HC2[WqEc6)>DIIBn-OgCl$6Uf@8SrEeDg#]&+D#S6DfQt6@;]UlBl7Q+
AoD]4D..=-+CJnuDe*5u.Ucj1BQ%B1+EqaEA90dSF(Jo*?tsUjE,ol/Bl%?5Bkh]s/e&-s$6Uf@
?upO'G[MY&DIaktCijo0+ED%1Dg#]&+D,Y4D'35$De*s.DesK&+Cf4rF)rrV<HD^o?up-qG[MY.
DKBo2@:UL!AftK&G@c#,%144#+CT.u+CK&2?m''"EZeb+FEh1G+B)i_+CJr&A8lR-Anc'm/no'A
?k!GP$6Uf@6Z6LH+D,P4D..O#DJ()+D/aN6G%G2,Bl5&$C2[W8E+EQg+CT.u+ED%:Ble!,DK?q;
@:WplAoD]4@q]:gB4Z-,FDi9o:IHfE$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f:(%7:C7Z
ATAn^B4i>UA8-."Df.!5$4R=b.Nh>Z6m-;S@WNZ7E+EC!ARlp*D]j(CDBNk8+BN8p/0IYq@k8`r
Bl8'<+EMgLFCf<1/e&-s$6Uf@9keK`EZek*@;]^hF!,RC+CJr&A1hh3Amca'D]j+DE,]`9F<GC.
@N]/o@;]^hF"Rn/%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%$6Uf@?uBP"A7-NiBOPdk
ARlp*D]iq9F<G(,ARfKuG&M2>D.Oi2BmO?3+EqL1DBN=V;FO#Q:dIH;?m'0)+F7U>D_;J++<Ve-
DesQ5AKZ&.H>.80+DkP4+E1n4AoD^,+E27;Ebp"DDf-\8ATW-7Ebce@DesQ5ATJu&DIa1`+<Ve=
@;0O#ASuU(Eb0'4+E)-?,%GG-F^u[=E,8s)AoD^,F"Rn/%144-+A,Et+C]J-Ch.T0D/Ws!Anbge
+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.Nh,jE+NotASu!h+E)-?@!ZF!
Ch7Zq+CSekDf-\<ASl@/ARmD9@!ZF!Ch7Zq+Co&&ASu%"+E)-?1GU(^Bljdk+<Ve.Bl7I"GB4m8
DIal(F!,@=F<GO@Ecb`!Ch54.$4R=b.Ni+uATMr]Bk)7!Df0!(GsldlE*sf/ASl@/ARloqEc5e;
D..-r+A,Et+Co1rFD5Z2@<-WG+B3#gF!,O<DJ*cs%144#+DbJ,B4W3(@VTIaF<G%8D/a&s+E_WG
FD,5.?tsUj/no'A?m'!&D/^V=@rc:&F<G%<+D,>2AKYi$B457pFCfMG+:SZ#+<Y&kATMr]Bk)7!
Df0!(GsldlE*sf&F!,@=G9CsKDfTE"+DG^9?tsUjFCfN8/no'A?m&m$@;0Od@VfTuDf-[fBllmg
@N]`'ANC8-+<Ve2C2[X)ATMrGBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"
E-![ACi<c9GA1qR05>E9FCfN8/no'A.1HUn$6Uf@;It#cF(oQ1F!,=.A7Zm*D]hkE7Nc5[@s)X"
DKI"/C2[W8E+EQg/g(T1%144-+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"0$6UH6
>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%144#+:SZ&,9n<b/ibOE2'=In
8p,#_+>Pf*+>PW*1^sd$$6Uf@?tFS)F(9--ATM6%@q]:gB4YTrFDi:8@;]UlAKYu8DffQ$+D58+
F`(_4@<6L(B5VQtDKKqBCh[Zr3XlE=+<VdL+<Vd9$6UH6+<VdL+=CQ=BPDN1BlbD8CF;8++=ghO
?n*9.$6UH6+<VdL+=CQ6DfTD3AS>a)4Y@j%?mH0g%144#+<Yc>BlbD+F_;h;ATN!1FCeu*Bl5&$
B5DKqF'p,-Bldd#@<6L(ApJ*.B-;)#D.Rc@%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H
%144-+CJc&?m'T2A79RkA0>u4+EM[EE,Tc=+A*b9/hf%'ARoLsDfTnO%13OO,9nEU0J5@<3AVd0
+AQiuASkmfEZd+m/0H]%0f'7G%144-+CK(s?m'W(Eag/$BOPdkARlp*D]j.B@;m?*Bl.R++D#S6
DfTnAAoD]4G%G]>+Dbt6B-;)#D.Rc@%144#+<XWsAKZ&9@;]UaEb$:b+Co%qBl7X,Bl@l3FD,]5
GB4m8+Dbb/BlkJ/EcQ)=+D,P4+DtV)ATJu*G[k;rA8,po%144#+<WEs2'?CB@<,ddFCfK6/g(T1
%14=),9SZm3A*<I+>"^1@<,jk+>>N$+>PW*1CX[#$6Uf@?t4+lE,&c'A9hTo+CSekARmD9?nid6
Df'H.+?MV3GAhM4+Dbb5F=1H=Eb0*+G%G_($6UH6@rH4$ASuU2/0JnPATMF'G%G_;Ch7$cBl7Q+
GA(]4ATMg!@q?ckDIal1ARopnATJ:f+<VeDF_l/6E,9).@VfIjCNCV7Bl7L'+EVNEDf0,/@VfIj
CERG-DIkFC<+oue+ED%4Eb0<'DKK</Bl@ku$6UH6BlbD>F(Js+C`mq8ASrW2ART+`DJ()%De*E%
@<3Q*F<GXIE,]i/F)to6+Cf>,D.RU,+Cf51FED)7/e&-s$6pc?+>>E./ibU./KdYoDKTB.Gp"h%
/0H]%0f'7G%144-+<X9P6m-PhF`Lu'+Cf>#AKY].+Du+A+CTG%Bl%3eCh4`-DBN.RBllmg@U1Bq
FEDJC3\N.!Bln$2@P2//D(d=j%144#+<XWsAKZ&4F`Lu'+DGm>A8-+,EbT!*FCeu*Bl5&8GAeUE
AT2R/Bln96Bk;?H%144#+<V+#+<VdL0eOSQC2[Wg-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA18X2Df0Z*Bl7u7FD,5.Anc'mEt&I!+<VdL+<Y3/F*)G:@Wcd(A0?)1FD)dh5timR<+ohc
@:Wn_FD5Z2@;I&sBl[cpFDl2F+CJr&A8,e"?m#mc+<VdL+<Ve?Ders*+D,b4Cj@.5Df'?&DKKH#
+A,Et+Cf4rF)rI9Bl%@%/g)99BOr<-FCB&t@<,lf$6UH6+<VdL8jQ,nF(96)E--.D@<,p%,%GP.
E,oN2F(Jl7+q4l%+<VdL+<Vd9$6UH6+>PPl>AA(eA8bs`-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg.3N;BCh.T0@;K`h$6UH6+<VdLFD,5.?qb!.AQW=_@;]TuF*2G@DfTr6DJ()(
Bl%@%+Dtb%A7]9oFDi:2F_PZ&+EV:.%144#+<VdL+A,Et+DkP)F^])/?tsUj/oY?5?nMlq+<VdL
+<Vd9$6Uf@:3CDbEc6)A+A,Et+Bs&.EbfB,B-:`!@ruF'DIIR"ATM-*BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9A9Da.F"&4@$6UH6@<,p%DJs_A@<Q'nCggdhAKYo/+@g-f89JAo+:SZ#
+<V+#+=\LAA8lU$FC65#F_;h/Bm=3"/g*`-+Eq78+CT)&Dg,o5B-;/%Ea`frFCfJ%$6UH6@q]:g
B4Z-,Df-\*;FNl>:JOSd?m&uo@ruF'DIIR"ATKIH6tp.QBl@ltEbT*++:SZ#+<YNDF*&O6AKY])
+CQC#;FNl>=&MUh7:76ZFCB9&+EVNE@q]:gB4W2nA8lU$F<DqY?m'DsEa`frFCfK6/g(T1+<VdL
+<VdL%144#+<VdL+<Y36F(KG9-W3B!6s!8X<(//W%144#+<VdL+<Y36F(KG9-UCZu8P(m!-Ta$l
$6UH6+<VdL+:SZ#.Ni>;G\(D.D/"'4Bl7Q+?mp7N3%5t\Ble59H!hb'EbBN3ASuT4DfBf4Df-\A
BOu3q%144#+CKG%+DGm>Bl5&$BeCMc?nNR'Bln#2FD,B0+Cf(nDJ*N'?nria+Co2-E$0Q]B6%r=
-X\&+$6UH6DJs_AA8-+(CghU1+EM47Ec`F:Ec6)>+CoD#F_t]-FE8R>F`VXICh[Zr+:SZ#+<Y&I
+?:QTBle59I4f/QE$m#@+Co2-E,8s.F!,:;DJ()&De!p,ASuU2/g(T1%144-+CK)/?m'Q&D/a<"
FCcS9FE2)5B6,2*BOPdkARlp*D]in*FCSu,FD,4p$6UH6F*)G:DJ+#5De:,"DJ*He/g+P>B4G<l
BlbD*+E_d?Ch\!:+Eh=:@N]B&+EV:.%144#+Co2-FE2))F`_2*+A,Et+Co1rFD5Z2@<-'nF#kFb
ARuulA8-+(+=D&>@jbY:%144#+B3#c+EV13E,8s)AKZ&9EbTE(F!+n3ANCrAH[\qCI:+TK@!d>g
IXPTT+CKPF7"0Pl/0GB/+<Ve8DIaktH[\m]IXPTHAoD]4+EV=>Ch5.?@<H[*DfRBOA79Rk+=LWC
H$O[PDf0)r?n!4,DIa1`+<VeJBQ%p5+Cno&AKWC/H$O7FDId9c.4u&:+<Vd9$6Uf@?uC'o+Cob+
A0>;kA7]:(+<Wsf+CKG%+CT;'F_t]-F<G:=+:SZ#+<Y)8@q]:k@:OCjEZf14F*&OCAfu/:EbTE(
+ED%4CgggbD.RU,Et&I!+<Yc>@<<W#Eb-A%E,]W-ARlp*D]iG0ATMs7FEM&#/0K"FAKYAkBle59
-Zip@FE;PH@OGP7%144#+CSl(ATAo8ASlC&@<?''F*)G:DJ+#5@<,p%E,ol,ATMp(A1f!(BOqV[
+<Ve=Bl\9:+Cf(nEa`I"ATAo-DBO%7AKZ&9EbTE(+Co&"Bl.R+Et&I!+<Y]9E,8rmASl!rF<GO2
Bl\8I%143e$6UH6+<VdL+=ACDBOPdkAKso<,@PJ#,?[fB-Qm;K+=D&<GB@D;F=.M)%144-+CK&!
?n<F.D00/:+CK&$?n<F/DIaktFECn5Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u:+B3#cF(HJ*A8--.
BOu"!ATDi$$6UH6@<,p%DJs_ADfBf4Df0!"Cj@.6AS,XoARlotDBN>9@:WneDK@IDASu("@;IT3
De(M9De*g-De<^"AM.\3F'pUC%13OO,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@
?tsUjCh\!&Eaa'$?m'*&Dfp"A@:Wn[A1f!'ARuul1*AS"A8-+(+=CoBA8Gt%ATD4$ALCjp$6UH6
@;]TuFD,5.@Vfsq+E27?F<FddASl-59PJT[Eaa'$%144#+A,Et>psB.FDs8o04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1oAS%144#+D,P4+Co&*@;0P!
%13OO+=\LA9gMZM6r-lZ?m';p@rcK1FCf]=+Cf>#AKW`e+CSekARmD&$6UH6%144-+CI&LA8-+(
+=AOE+Du+A+Co2-E,8s.F!+n/Gp%$KATD3qC`m\>F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:
$6Tcb+=\KVD/!m+EZeb)De(J>A7f3lARoLsF!+n/A0>;kA8-."Df0VK%143e$6Uf@;flGgFD5W*
+EV:.+E2@>@qB_&+E(j7@rH7.ATDm,DJ()/Df^"C8l%htA8bt#D.RU,+:SZ#+<Yc;G]Y'MD]i8$
@<--oDg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.A"Q$6UH6
Bl7EsF_#3(B-;;0BlbD-De!p,ASuTB>@'$i%13OO,9nEU0J5@<3%uI,+A-cmGp"gs/0H]%0es1F
%144-+Co1rFD5Z2@<-W9A8bt#D.RU,F!,O8F<G"0A0>JqFCSuqA0?)1FD)e)2'?j\F<DrADdsnB
/hSMZ%144#+CT.u+CI&LB4Z0--RW:E@<,p%DJs_AF('6'A0>T(+CoV3E$043EbTK7F"SSC2'?j\
F<Dq`/gk$L%144#+DGm>@rH7,Ec5c1ARlomGp$N<DIn#7E+*cqD.Rg#EZeb)De*fqEc#kMBkh]s
+CIT56WHiL:/jVQ6W@G&$6UH6FD,*)+Co&*ATDX%DIml3GA(Q0BOu3,?o9'GF`\`RA8bs#/hSMZ
+EMXCEb0;7FCf]=/g+,,AISth+<Y3+AmoguF<FsZ:IA,V78?fM8OHH?0jl,FFDl22F!,R9G]YPI
$4R=b.NinGF*),/Bjkg#@!Z3'Ci<flCh4`"F_u(?F(96)E-*4=Ddd0!F`_>6Bln'#F!+k3Df0Au
H=&34$6UH6;bp(_6U=C7?[?'1+EMI?F`^u:?XP!bDIaktF)PQ)ARTUdH=(&&@<,p%DJs_AATD4#
ARlolF<G[=AISth+<Y65A0>f&+CoV3E$043EbTK7+EDUBF"SS-:IH=9AS,XoATJu*G[Y*(Cj@.8
Dfp(CGAhM4Et&I!+<YB9+EV:.+F5/HDe!3lANCrAC2[X$AnGCr?S!=7De*d(?[?'1+DPh*F*VhK
ASlBpFD,$-?XO<M+<Ve8DIaktF(fK9E+*g/?[?'e/e&-s$6Uf@?uL!qDIdHkFC65)@<3Q#AS#a%
D/Ws!Anbge+EVNEFCfN8+EqL1FD,6++DkP.FCfJ%$6UH6Anc'm+E1b2BQG;)Eb-A4Eb/isG\(q=
De:,5FDl22A0>Ds@ruF'DIIR2+E1b2BQGdK7W3;i%144#+CJ)95t"dP8Q8,d+Co1rFD5Z2@<-'n
F!,R<AKYr4AS,Y$+Dl7BF<GF/FCSu:+@^9i+CJ)95t"LD9Nba4$6UH6A8,OqBl@ltEbT*++EV:.
+DkP.FCfJ8E+*j%+ED%4CgggbF!,R<AKZ&9DfTE"+E1b2BHV#,%144#+Co1rFD5Z2@<-W9A8-'q
@ruX0Gp%$7C1UmsF!,1/+EV:.Gp$X3AnGUp/g+,,BlbD*Ci"$6F!(o!+<Ve7;FNl>:JOSd?m&uo
@ruF'DIIR"ATJu9D]iM#+E2.*@qB0nDf-\6De!QoA0>E$GA\O@ATW-7Ebcd,$6UH6A9)C-ATJu&
DIaku@q0(kF(Jl)@X0)5@;^?5F`V,7F!,R<@<<W/@<iu/@<Q3)A8,XfATD@"F<D#"+<Ve8@q0(k
F!,F1FD,_J+<V+#+<Vd9$6Uf@6q'p@:./#'F(Jj'Bl@m1+CSekARlp*D]hYJ6m,oUA0=K?6rQl]
;F<kqD..<rAn?%*+EM%5BlJ08/e&.1%144-+CJr&A1hh3Amc`0B4YslEa`c;C2[WnDe!p,ASuT4
@:WneDCH]NE+EC!ARmD&$4R=e,9n<b/ibOC2'=In8p,#_+>Pi++>PW*1(=R"$6Uf@Anc:,F<F:d
@j#9"D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+AH9S+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t
2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG;
@:O1nFCfMGFEhm:$6UH6%144-+CJr&A1hh3Amca(E+EC!ARlolDIal-Dg*=7BleB:Bju4,ARlol
F!+m#$6UH6F(K<!Eaa'$+A+pn+CSekDf.0M8T&Tk@;Ka&?tX%gATD3q05>E9A8bt#D.RU,?k!Gc
+<YcE+E2.*@q?cjC2[W8E+EQg+DG^9FD,5.A8-'q@ruX0Bk;?.F(Jd#@q]Fa%144#+C]U=?tsUj
BOu"!?nNR0C2[WrASc<n+Du*?Ci=3(ATAo0Df9E4+D,P4+CT-s$6UH6Df0B*DIjr6ATDj+Df-\9
AftJrDe(J>A7f4%+:SZ#+<V+#+=\LGBm=3"+CQC#A8-+(?m'8sDJ+')+D#S6DfRHQ%143e$6Uf@
Ch[cu+D#G$F!,17+CT)&+EM%5BlJ/:Anc'mF!,O8F<G[D+Dbb0AKYSrARloW7L]\I%144-+DbIq
F!,UEA79RkA0>K&EZdss2_Hd=+CT.u+A?KeFa,Q6@:LF'ATDj+Df0V*$6Tcb+=\LM@:C?eC2[X%
Eb]GDBkh`t+ED%1Dg#]&+>"^XBPDN1CggcqEb/ioEcP`%%144#+EVNE@;[3+Ch+Y:E,oM42_Hd=
.3NSMDe`inF<GF/DII0hE\8ID$6UH#$6pc?+>>E./iOn)+A-'[+>Gc*+>PW*0b"I!$6Uf@?tsUj
AoD^*?m'?*G9CC(Ci"/8?tO=tCL:gu@<63k?m%$DA8c?s+EVNEBOPdhCh4`!BOPdkAISth+<YB9
+DkP$DBMOoCh[@!@<-WG+CK;"F),/+G%G]'F!+n3AKYl/+Dbt6B4Z*+Ci<`mARlp*D]iG6?m'9(
@ps1b%13OO,9nEU0J5@<2DlU/+@KdN+>Gl-+>PW*0b"I!$6Uf@?tX%m/0JnSFC65/Dg*=9ATVEq
+CT.u+EM+9+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#+<VdL+<Vda+D58-+=ANZ
%144#+<VdL+<WNaE-67F-Y..*F_t]-F<G[=BlbD-Bk)7!Df0!(Gpa^D$4R=e,9n<b/ibOB+>"^(
ARci;1+XP'0JP9k$4R=b.Ni,6De*NmCiEc)E,TH.FCeu*FDi:>ATo88DJX$)AKZ/-EcYr5DBNk0
+CJr&A1hh3Amc&T+<Vdq:fAnf<(0n3@;]Tu85r;W+CoD#F_t]-F<G10Ch7Z1Eb0*+G%G2,Ao_g,
+DkP$DBN\4A0>Ds@ruF'DIIR2%144#+EVNEEb/d(@q?d)BOr<-BmO>5De:,"C2[X(Dfp)1AM/:C
E*t:@<+oiaAKYT!Ch7Ys$6UH6@<,p%@<Q'nCggdhAKY])+EV:.+E).6Bl7K)8l%htF*;FDEb03.
F(o`7Ed98[%144#+B)i_+BqfYAKXT@6m,<7B4Y?sBQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%.LBOrc1De(G=@:s.).4u&:+<Vd9$6Uf@?t4+lE,&c'@ps6tDJs_A@V$ZuBl.R+ARlp*D]it9
Cj@.IBPDR"+EML1@q?d'ASl@/@;I&qGp!P'+<Ve@DKBB0FD5W*+EV:.+Cf>,D.RU,+EV%)+CHTL
/h&qE?m&lqH$<q5Eb-A-DBO%7AKZ)+G]Y'HAdo(i+<Y*1+D#e:Ch[BnF<GdGEb$d3$6UH6%14=)
,9SZm3A*03/KdGm@j!TZ+>PW*0b"I!$6Uf@AncL$A0>;'?u9=fARHWiF_;h2DBN=tF_u)ADfTB0
?m&l#E+*j%+E(j7@;K`h$6UH6ASlC.Gp$X3@ruF'DIIR"ATJu+@;0OhA0>u4+DkP&AM+E!+<Vd9
$6Uf@AncL$A0>;u+CK&&F'p,"F_;h=BOQ!*E,ol-F^nun+DG_'DfTl0@rrh&$6UH68l%ht?upEu
EccGC/no'A?m'#uFE2),F!,C=+A?KeFa,MJ$6UH6%144-+Dl%;AKZ)+F*&O7@<6"$+CSekARmD&
$4R=e,9n<b/ibO@+>"^2Dg!6Y2(Tk*0JP9k$4R=b.NikQA79Rk+CJr&A8,plAU#h@FDYi%+EVNE
Eb/ioEb0,uAKYK*EcP`/F<GL>Ch[cu+CoD#F_t]-FCB9*Df-!k+:SZ#.Ni>;G\(D.@3Arp@;BF^
+C]J++>"^DD..3k?m&rtF_kS2AmoCi+EqL1DBO.AEb'56GA2/4+EV:.%144#+EV:.+ELt.AKYl!
D.OhuDIal#BkCsgEb0-1+DtV)AKYK!@<6L$F!,[<Eb-A4Eb0<'DKI">D@Hpq+<Yc>AKYr#FD*99
$6UH6%144-+E_X6@<?4$B-:W#A0>H.FCf?#Bl7Q+8l%htFCfN8F"Rn/+<Vd9$6pc?+>>E./i+V%
+A-co+>GT%+>PW*0b"I!$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2+ED%:Bldir+CT.u+D#e>ASu$i
A1f!(BOr<)DJX$)AKYN%@s)X"DKKq/$6UH6@<,p%BQ%s6ARlomGp#UqDeElt+@L-XF_t]-FE8R5
DIal"@;[2sAKZ#)@:UL!DBO%7AKZ2.@N]T0%144#+CoD7DJX6"A7]9oBl5&%+Eh16Bk;C3+E(j7
AoD^,@<?QO+AbHq/0I_V<%K.nDfTA>+@oI+9J.GeBOqV[+<VeFAnGjnDIjquC2[W8E+EQg+EqO9
C`m1u+ED%:Bldir+CSl(ATAo'Des6$@ruF&B-;><ATAo*AS#C]@:O(*%13OO,9nEU0J5@<1*A.k
9jr;i1-$m.1,(F;%13OO+=\LGBl\9:+A?KeFa,$=Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,
AKXZ\DKU1HG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kVY4DKU2ADffQ3/p)>[%13OO+=\LPDJX$)AKYN%
@s)X"DKK</Bl@l?+CTG%Bl%3eCh4`4Bji-+BOr<0ATD6&?tsUjBOu"!?n;`o+<Ve?@<3Q#AS#a%
@rH7.ATDm(A0>u4+EV:.+Dtb7+@g?gB5D-%6uQRXD.RU,+D,P4D..N=+:SZ#+<XWsAKYK$DK]T3
F(oQ1+E2@>@qB_&+C]A0CLnVsCht59BOr<#DKKH1DII?(BR+Q.EboH-CNBpl+<Vdu+CT+0F)5c=
Cj@.8Bm=?0B-;;0ASj%B<+ohcDe<TtBl7K):ddbqA8bt#D.RU,+:SZ#+<XlrC2[W8E+EQg>psB.
FDs8o06_Va/n/aD/oG6B06:f8Eb/c7B45OeFYtjc@k]>@$6UH6A8c%#+Du+>+EM47G9BRnDKU1H
F)Y]#BkD'h+D#e+D/a<&F!+q7F<G:=+EMX=ChsOf+<Ve8DBN@t@s)g#FCcS*ATM@%BlJ0.Df-\9
Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S%13OO+=\LBA7TCrBl@ltC`mG0AoD^,@<?4%DBN@sDfp.E
8l%htGA1l0+C\n)D.-sd%144#+CTG%Bl%3eCh4`-DBN/#Gp$R4DeE?(BQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf$p4$6UH6@:jUmEZed5Ec6)<A0>f&+C\o(@3BZ'F*),6B-:o++EV:.+EqO9
A1euI%13OO+=\LUBPDN1G%G]8Bl@l3De:+a:IH=GF`)7CDf-\ABl7I"GB4m!+>ti+GT^F4A0=Je
2_He/+EMgLFCf<1/e&.1+:SZ&,9n<b/ibO=+>"^1@<itS/0H]%0ej+E%144-+Dkh1DfQt4Bm:b=
AftYqBlkJ@ATD6&?tFFf+EVNEEcl7BDf-\,DffY82_He/+CT.u+>ti+GT]U$F*VhKASlK@%13OO
,9nEU0J5@<0H_qi7V-$O0fU^,1,(F;%13OO+=\LNDe*QoBk:ftFDi:BF`&=EDId=!+A*b8/hf"&
8k;l'@;]Tu8k2iR/g+,,BlbD?ATDj+Df-!k+<Ve8CiaM;Ecl8@+E)-?8g$#E0R+^]H#n(=D0%<=
$6UH6%144-+ED%4CgggbA0=K?6mm$u@!Z3'Ci<flCh4`'DKKH1Amo1\+EqOABHU`$+CJnuDe*5u
Bl8$(Eb8`iAM+E!+<Ve!:IH=CDg*=7AS,XoATJu4DJXS@FD,]+AKZ28Eb'5P+CJr&A8c?:+DPh*
De<Th+CT.u+:SZ#+<Y',De*p7F*(u1E+*j%?m'0$+EV:.+CKM'+Dbt+@;KL-+<WsdC`mY<BOu3,
Bl8$(Eb8`iAISth+<YlHEb'56@<,p%A7]@eDIm?$Bl5&$BkhQs?m'Z,Bk(g!BlbD9CgggbA0>f.
+EV:.%144#+C\c#AKYf-@ps1b-Z^DOARTUhBHV8&FD)*j+<Vd9$6Uf@E+*j%+CT.u+D,>(AKYMt
F)Yr(H#k*<Df0`0Ecbl'+EVNE?tsXhFD,`,E*seuDf0`0DKKT2DK@E>$6Tcb+=\LAC2[W8E+EQg
+ED%1Dg#]&+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr+E1b!CLLje/g)9EC2[W8E+EQg%144#+Eq78
+C]U=Amo^&FD,5.Cgh?sATMr9E+*d/+E(j7FD,5.@rHC!+DG_7FCB!%+E1b!CLLje/g+P:De(J>
A7f3Y$6UH6BlbD7Dg*=5Ec6/CARlp%DCo[=DIjr"Gp$L0De*NmCiEc7+B`W*+Ceht+CoD7DJX6"
A0>8pDe(J>A7f3Y$6UH6@;]TuE,8rmAKY]/+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9A8bs2
E+EQkDdtG.+EVNEAStpcCh4%_+<VeCDe!3l+AbHq+ED%%A8,po/e&.1+<V+#+=\LPDJX$)AKXT@
6m-#Y@s)X"DKK</Bl@l3F`:l"FCeu*FDi:BAS,ai@rri'BOPdkATKI5$6Tcb+=\LA<E)FI?m';p
@rcK1F(96)E-*44De*E%@q]:gB4YTrAo_g,+>PhtFDi9W3$9ViASl!q@V'R&1,pCgDfQt.<E)FI
?n!];$6Tcb+=\LA6<R8V?m';p@rcK1F(96)E-*44De*E%@:Wn[A0?)1FD)e?@;L't+>Pi-+<V+#
+:SZ&,9n<b/iYI;+>"^3@rrhL0e=G&0JGHq$4R=b.Ni/1A7]9oDIn#7?tsUjE+*d(F"V0AF'p,0
@<,dnATVL(+CIK66V0j/2..PKBOQ!*@rH7,Ec5c8+EqL1FD,6+%144#+CoV3E$/b,Ch7Z1F`V+:
@<5pmBfIsmAoD]4FCf]=+E(_(ARfh'/g)9)AS,@nCige6F!*.h%144#+B3#c+CT>$Bk]Oa+ED%4
Eb0<'DKK</Bl@l3B4YslEa`d#Gp%'HDe+!#ATJu8D..6sATAn&$6UH6A9Da.+D,>(ATJu'F`\a?
F!,O?Dg,c5+EV:*DBO%7AKYMpAmoguF<GF3FD,T'/e&.1+<V+#+=\LAC2[X(Dfp)1ARHX'F(KD8
@<5pmBfIsmAoD]48l%htA7]pqCi=90ASuT4A8,OqBl@ltEbT*++EVNE%144#+ED%(F^nu*FD,5.
F(or3+E(j7FD,5.A8c[0Ci<`mF"Rn/+<Vd9$6Uf@D/!m+EZet.G\(q=Bl5&$C2[W8E+EQg%13OO
,9nEU0J5::1E\7l:LeJh2_6(,0JGHq$4R=b.Ni>AEarZk+E1b2BHUf'D/`p(Ble31F!,RC+Dbt?
ATAo'@<6!&Bl5%c:IH=!@:C?(1a$4EA0>u*F*&O4-Z`j@F`:]&De*g-De`inF=1H*$6Tcb+=\LG
Bm=3"+CQC)ATo8=H#R\C+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i"P$+B)ij+>Pf*+>PW)3"63(
$6Uf@@rH4'Ch7^"A0>E.@:X(^+Cei$AKYo'+CJ_u@pf`Q+:SZ#.NikQA79RkA0>8pDe(J>A7f3l
FDi:4ATM@%BjtWr@q]:gB4Z,n$4R=e,9n<b/iPC;+>"^7AT/bI1b9b)0JGHq$4R=b.NibCD/XT/
A0>r3D.Oi+@<-!l+@T+*+D,>(ATJu+Ec5e;A8,OqBl@ltEd8dLD]j(3A9DBn+CoD7DJX6"A0>r-
H=[Nm+:SZ#.NibCE,8rmARloU:IH=9Bl[cpFDl2F+Co1pB6%Et+DG^9?tsUj/oY?5?m%$DEb/d(
@qB^(F(or3+E(j7C1(sj/oY?5?k!GP$6pc?+>>E,/heD"+B)ij+>Pc)+>PW)3"63($6Uf@Eb/io
Eb0,uATJu&A7T7^+EVNE?tsUj/oY?5+CGWc+:SZ#.NiV?G9CX=A0>PoEb&ZuE-WR1GB\6`CisQ:
/n8g:>psB.FDs8o06_Va/o5ZHFY70BD(-T=A8-."Df-!k+:SZ&,9n<b/iG=9+>"^%F_;gO3%Q1-
0JGHq$4R=b.NiSBDJsP<C2[W*F(96)E-*46A8-.,%143e$6Uf@?tsUj/oY?5?m'0$A7^!.Bl.g0
Dg#]&+:SZ#%14=),9SZm2(gU+/KdZ.C`kJf/0H]%0K9LK%144-+CJr&A9Ds)Eas$*Anbm1Bkh]s
+CSekARl5W+:SZ#.Ni,3A7]_$?m'?*G9CF7@s)X"DKKH#+DG^9?tsUj/oY?5?k!Gc%14=),9SZm
2(gR*/KdZ.C`kGl/0H]%0K9LK%144-+CJr&A1hh3Amc`lDe!p,ASuTuFD5Z2+Cf>,E,9*-AISth
%14=),9SZm1bLI)/KdZ.C`kGd/0H]%0K9LK%144-+DG_7F`M%9@<<W.ARTY%+E)./+D5_5F`8I;
DBN>%De*BiG&2)*A7-NlDfQt:@:BZQ+:SZ#.NiSBDJsP<CggcqARoLsF!*%WEb/ioEZfIB+CK84
@<-I4E%Yj>F'p,)DKBo2@:UL!AftK&@rc:&FE9'KC3*bl$6Tcb,9nEU0J5.63$9dq9jr;i1GLF'
1,(CA%13OO+=\LNBl7j0+E_X6@<?''FDi:<@<6N5CggcqF(Jj'Bl@ku$4R=e,9n<b/i,+=+>"^1
@<itO0e=G&0JGHq$4R=b.Ni2CB-:f#G\(q=Bl5&0@:F:#/KeJ<C`mP&@WNZ%@;[2sAKZ#9D@Hp^
$6pc?+>>E(/iFh(+AH9i+>Pr.+>PW)3"63($6Uf@Anc:,F<GU8Ch7$rAKYo'+D,b4Cj@-I@:Wne
DCoRKARlu-8l%ht/Kf4JEcYr5DK?q>EbTH4%144#+EVNEFD,B0+ED%0ARTXk+D>1o+EVNE@V$[!
@;^3rCi"A>Bl8!6@;KakA0>?,+:SZ#+<Y*'/SK'4+EM%5BlJ08/g*o-G9D!@AKXT29H\D%F*(u1
+D>2$A8Ggu+A,Et+DG_7FCB!%F"Rn/+<Vd9$6Tcb>@'$i3ZoPEBPDN1A8bt#D.RU,+Ceht+C\n)
@rH7.ATDm(A0>u4+DkP)Gp$^;Ec#6,F!,[@FD)d+$6UH6+<VdL>B""gA8bs`-tm^EE&oX*C2[d'
D.-pd@<-0mDIkG<ATTSE@;]Uo@kT8`%144#+<VdL+@^9i+D#e+D/a<&+EV:.+D,P.Ci=N3DJ()%
Df'?"DIal/Ec5K2@qB^(@;[2Y<)$%/G%G]8Bl@lM%144#+<VdL+:SZ#+<VdL+<VdL+<VeG@;]Uo
@j!@E+D>J1FDl2FC2[W8D..I#A8c[0+>%LSBPDO0DfU,<De(J6FDYh'$6UH6+<VdL+<VdL+:SZ#
%143e$>=-pFDl2FC2[WnDdtO]B4YslEa`c;C2[WnDe!p,ASuT4/KeP:@;]^h+D>J1FDl2F%156]
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<O2'=In7T)V`$4R=O
$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q
?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,RpF'U>?
@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(t
FE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6
DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6@q]:g
B4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.
Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo$4R=b
+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1@<,jk
+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<3B&'4
+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$
A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdkATJu9
D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?
F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU0J5@<
3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&A7TUg
F_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l:2b;e
D.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2A8-+,
EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO+=\LA
DKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:Bldir
+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In:LeKb
@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu?o9';
Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(GA^\7
BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E./iYO-
/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUjA8bt#
D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L16q/:k
:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl4@e
+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8D.Rc2
FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,Ao_g,
+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8E+EQg
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)@V'+g
+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#+<Y04
E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6E,ol5
BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57B-7Wj
+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm+CT.u
+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"Rn/
+:SZp@;BF@@<6-m8l%iSATMs71,2Nj/h1^HCLoh@F(o,V:IJ/nF*)IGF"JsdD..3k+A,Et+C\c#
Bk&9-ATMr9F(96)E-*]A$;No?%15is/g+,,BlbD<@rc:&F<G4-DImisFCfM9@3BW$EbTK7+<YT7
+ECn.A8c=$Gp%$GA7]dmA0=K?6m,rIF(o+n$;No?+EV19FE9&W<+ohcB4YslEaa'$A0<"9@rc:&
F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqV[:-pQU-t6V+ALSa<De!3lAKZ22FD)dh
+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC%15is/e&._67sB[BOr;/F(or3+<VeFAfr3=
FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>+<Y04DKKo;Ci!Zn+<Y-=%15is/g)QA78m/Q:K:.h
.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYbAU%]rARoj)FD,4p$;No?+Du==
@V'R&De:,6ATMs7+DG^9FD,5.-u*[2@UX=l@ru:'FE8lRF*22=AM+E!:-pQB$;No?+CT>4F_t]2
3XlEk67sB'+:SZQ67sB'+>G;f5p0ZUDJ!TqF`M&(+A*beBl[cpFDl2F+FZpY6rZTR<"01067r]S
:-pQUG%G]'@<?4#3ZrN_+E_a:+CoCO%15is/e&._67sB'+AP6U+D58'ATD4$AKZ&(EbTK7%15is
/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX67sB'+ED<A-Z*:-AO9gHBk'b2
6r[`=FE8f=$;No?+:SZQ67sB'+AP6U+EDUB+DGp,$;No?+<VdT0HiJ4.3L`fE+*j%+=DV1:IJ/N
;cGD:@<6-m8l%iSATMs7/no'A-OgDX67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/78M0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooCi<`m+=CoBA9;C(
FCfJ?%16r\CLpF]DeioV:IJ/nF*)IY0ht%f.W&U0AQ*GaCLp+66r[`=FE8RG/M/)^@;BEs8l%ht
F)>i2AKZ)+F*&OG@rc:&F=mnq67rU?67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&F<D]E
Afu,&DId[&Cj@.AEb&a%ARloU:IH=HD/X3$$;No?+EV19FE9&W<+ohcB4YslEaa'$A0<"9@rc:&
F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqNG67sB/@UX=h.3NGF@ps1b+EqOABHTni
-nlf*1+=>aEZcba+Z_D.+EV19F<G16Eb/rtDK@E;:-pQ?:-pQU<+ohc+EM7CAKW*<De:+7+EV:.
+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gm[;5/g)QA78m/Q:K:.h.4u_c
<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYbAU%]rARoj)FD,4m:-pQUDKTf*ATAo3
Afu2,F*)IGBl5&8BOr;7C2[X(D/X3$FCfN8F"&5QF_Pr//db??/db??/g+SDF*2>2F#jY'67rU?
67sC(ATD6gFD5SQ$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*
2/78M0KBJ867sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/IDhpDe!p1Eb0-1+=CW,F(H^+Ci<`m+=CoBA9;C(FCfJ?$>j3hBkCptFD>`)
1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E:L\'M@rrh]Bk)7!Df0!(Gpa%.
<^fnb8P`)E3[ZU63A*<O2(&h?:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P
6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&Ik
De*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn
/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u
$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2E+EQkDdtG8
De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16igA8G[`
F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>0JP1o
C3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[\Z#0JO\b2D?m/C,[h$+DNki0d(3j
0JXbc3&!-2C,dn(-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a8P`)E
3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-;;7Deq$K
8l%htBlbC+$=P'$DfTA2DfTQ'DKKH#+Cno&@:EYdAKYT'EZee,C`mhFE+O)5De:+a+E(_(ARfh'
/g*b^6m)pGF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!,RC
DesJ;AoD]4%16Wa@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh/g(T1%15]M2_He/0/tR<GT]US
6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0:$;bbWDfQtDATDj+Df0V=De:+a+DkP&
AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;"hPH#IgJBl8!6@;Ka&
8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlol
A7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"
DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1
@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA
/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.
Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<
@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3
Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A7;%16r\DJ<]oF*)/8A7TUgF_t]-
F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTuFD5Z2
-OgD`78d&U:JO&6+=Aiq3A*<O2(&h?:eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi
$7QDk;FO8J5uU383Zoeb2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q($A;Fs\a
8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2
+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'
B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].
+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'
1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(
Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibmK-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB
%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*Bi
FtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z
C,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jk-d$:I<Z78?6L4ZX]>+?CW!%16`ZDImis
CbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(
ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?
F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=
A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEs
A0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1r
FD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhK
ASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*
D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15]M2_He/0/tR<GT]US6m-M]EHPu9ATJu9BOr;7
A79Rg05>*5Ch7Z:+CSekDf.0M:i^8gEZbeuG%G]8Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'n
CggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"
+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@ID
ASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$
ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3
+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cj
BlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)j
DflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[
@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9
A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<
+<V+#+<Ve?FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_*$7QDk    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO20H`+n0f:(/3$9t1+>Yer0eje.1*A;*+>Yer0f'q/0d&20+>Pht0fL412BX_/+>Pht0f^@4
1a"M3+>YcF:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<rqF_PZ&C2[WsC3+N:A79Rk
F!+t2D/Ej%FCeu*C2[WsC3(M=@rc:&FE8R=DBN\4A7oUu+Co2,ARfh#Ed;>4F*)>@H"q8.8l%ht
@:WneDBNV,F*)>@GqO2`F<G:8+DkP-CLh@-DJ3a*FDl2FC2[WnDduC86psg<<D>nW<$5U[A8c?.
BPDO0DfU+UFEhmMBl5&1@<--oDg-)9@;BF@@<6-m8l%iSATMs7D..3k+A,Et+C\c#Bk&9-ATMr9
F(96)E-,r*CLpF]DeioV:IJ/nF*)J?@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&FDYH(BkCptFD>`)
8jQ,nD..<rAn?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-F@nhm+DkP)BkCptF<G16
EZdtM6psg<<D>nW<$5U[A8c@&@;]dkATMs.De*p-F`Lu'8jQ,nD..<rAn?%*+D,P4+A,Et;bpCk
6U`,+A7TUr                                                                ~>
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
zz=:zz,'PT JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAI'
zz=:zz,'N MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 O'
zz=:zz,'K007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PAT'
zz=:zz,'OPS PUTBLACK REFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WOR'
zz=:zz,'D XML afterstr alltrim badappend badblia badbu badcl badfl badil ba'
zz=:zz,'djr badlocn badobj badrc badreps badsts badunique beforestr bget bn'
zz=:zz,'l boxopen catrefs cd changestr checknames checknttab checknttab2 ch'
zz=:zz,'ecknttab3 createjod createmast ctl datefrnum dblquote decomm defzfa'
zz=:zz,'ce del destroyjod did didnum dnl dpset dptable empdnl fex firstone '
zz=:zz,'fod fopix gdeps get globals globs grp gsmakeq guids guidsx host hos'
zz=:zz,'tsep isempty islocref jappend jcr jcreate jderr jdmasterr jnfrblcl '
zz=:zz,'jodsystempath jpathsep jread jreplace justdrv justpath jvn lfcrtrim'
zz=:zz,' locsfx make makedir markmast mubmark nc newd nlargs now nowfd obid'
zz=:zz,'file od ok packd plt put quote read readnoun readobid regd remast r'
zz=:zz,'estd rv saveobid second tc trimnl tslash2 tstamp uses valdate wex w'
zz=:zz,'rep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRCN D'
zz=:zz,'IRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR20'
zz=:zz,'1 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 ER'
zz=:zz,'R211 ERR212 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum co'
zz=:zz,'pydirinv copyfile copyfiles createdl dbakf dfclose dfopen dfp dncn '
zz=:zz,'dnix dnnc dnnm dnrn dropall dropbakdir dropdir dropinv dropnc dropr'
zz=:zz,'ef gettstamps justdrvpath libstatus loadbakdir loaddir loadnc loadr'
zz=:zz,'ef loadstamps maxback movefile nummask packdict packspace puttstamp'
zz=:zz,'s renamefiles restdict restspace savedir saveref tmpdatfile tmpuses'
zz=:zz,'file volfree''),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG'
zz=:zz,'3 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 E'
zz=:zz,'RR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS '
zz=:zz,'HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SO'
zz=:zz,'PUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk dec8'
zz=:zz,'5 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamps dumptext dumpt'
zz=:zz,'m dumptrailer dumpwords extscopes fap fmtdumptext fromascii85 getal'
zz=:zz,'lts getascii85 halfbits htclip jnb jscript jscriptdefs makedump mak'
zz=:zz,'egs masknb namecats nlfrrle nounlrep opaqnames parsecode putallts r'
zz=:zz,'lefrnl sexpin sonl tabit toascii85 uqtsingle wraplinear wrdglobals '
zz=:zz,'writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CND'
zz=:zz,'ICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH'
zz=:zz,' CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ER'
zz=:zz,'R057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066'
zz=:zz,' ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR'
zz=:zz,'076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 '
zz=:zz,'ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR0'
zz=:zz,'96 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR103 INVGROUPS INVMA'
zz=:zz,'CROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK05'
zz=:zz,'4 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065'
zz=:zz,' PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable'
zz=:zz,' appwords badcn bnlsearch bnums checkntstamp checkopen checkpath ch'
zz=:zz,'eckput closedict createst defwords delstuff delwordrefs didstats dn'
zz=:zz,'lsearch freedisk freedisklinux freediskmac freediskwin fullmonty ge'
zz=:zz,'tdicdoc getdocument getexplain getgstext getntstamp getobjects getr'
zz=:zz,'efs gslistnl inputdict invappend invdelete invfetch invreplace isli'
zz=:zz,'b iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscrea'
zz=:zz,'te loadalldirs loadallrefs loadwords mainddir newdparms newregdict '
zz=:zz,'nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathre'
zz=:zz,'f putdicdoc putexplain putgs putntstamp puttable puttexts putwords '
zz=:zz,'putwordxrs rpdtrim rplctable rplcwords sortdnub''),(<<;._1 '' jodtool'
zz=:zz,'s AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR'
zz=:zz,'00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJODtools JO'
zz=:zz,'DLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 OK0040'
zz=:zz,'3 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 WORDTE'
zz=:zz,'STS addgrp addloadscript addloadscript1 allnames allrefs betweenidx'
zz=:zz,' createjodtools dayage delgrp firstcomment firstperiod fsen getrx h'
zz=:zz,'lpnl jodage lg locgrp mls noexp notgrp nt nw obnames onlycomments p'
zz=:zz,'r refnames revonex today todayno updatepublic usedby yyyymondd''),<<'
zz=:zz,';._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY DOCUMENTM'
zz=:zz,'ARKS DYADMARK EDTEMP ERR0250 ERR0251 ERR0252 ERR0253 ERR0254 ERR025'
zz=:zz,'5 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterface MONADMARK NAMEAL'
zz=:zz,'PHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251 OK0252 OK0255 OK025'
zz=:zz,'6 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMA'
zz=:zz,'RK blkaft changetok compclut compj compressj createut ctit de dewhi'
zz=:zz,'tejcr dewhitejscript disp doc docct2 docfmt2 doctext docword ed et '
zz=:zz,'exobrefs gt jodfork jodhelp ljust obtext pdfreader qt reb revo rm r'
zz=:zz,'tt textform2''                                                      '
zz=:5306{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`-1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+APL&:c]_.@:O(qE$0%,D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN
@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ
67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$
F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u
+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGF
F<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k
+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]Tu
F*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*
$;No?+<VeDDJUF<+<Ve%8PN#B+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlom
Gp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX
6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,
Eb-@@C1_0rATJu7AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R"
;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hV$;EfR;GU7p:dmN.8lJ)T
8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q:ha%15is/g,(AC1Ums+Cf>#
ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=
@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!
@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H
:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhs
Ch[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W
7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA
@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk
-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&
-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:
EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j
:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@
@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=r
A93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA7TUf
:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA92j2
Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"
ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q
@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)
@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'
F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;
An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8Z
A8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(
GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL
+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs
%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL
+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#
Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+DIal+@<6O0F`\a:@<?''FD5T'
F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F%15is/g)8ZCi<`mDIXe3+<VdL
Ci<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeCDdd0sAS*&-+<VeCDdd0!Eb/io
Eb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-E,uHq:-pQU+<YW3@r#Uh@rrh9
+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&F!+m6@UWb^F`7cs:-pQU+<YW3
@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@@:NjX$;No?+<VeGF`__HFCB$*
F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67FFD5T'F*(i-E,uHq:-pQU+<Y]9
F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#Uh@rs./
$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4Eb0<6DfTD3F)YPtAISuA67sB'
+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&AS*&-+<VeJ@<Q3)Eb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IJ`3@N]]"DJ*N'1,(C6
1,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.A92j2Eb-U-$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o%15is/g+\=Eb/a&DfU+GDJsZ8
+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]-
%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(D..O.ATDi$$:Iil8Q\>T4ZY\e
/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=
Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&+FH3m6qL9O9iE/c-8%J8+@K1-
8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/F`&=>@;TRs%15Kp;GKSB3]oJV
?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#C1UmsEt&IE8Q&GU:-CX#4"akp
+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5
DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN+AtWt6V]!X4ZX]J+u(3f3Zpg^
;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7De*]nCLp7-/g)WYDe*]nCLnVu
/M/)d@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._
67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:
Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]Li
H$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\
+Du+?DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is
/g)8ZD..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0
Gmt*U67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE
@;TRc@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL
+E2IFF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeN
DfTA2@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs
+D,Y4D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k
+ECn.B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;
67s`uAT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is
/g,7EB6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K)
.X`ZR$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0
BFP;M;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m
+E(_(ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)
+ED%&F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;
-Qm&BE$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"
EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56
Bl5&8BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A
9LUK[-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1
+EV:*F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng
4ZXr5E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1
Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?
D.7'sARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX
<'a"`$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl
+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!
CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(
ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'
@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\
3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dAF!,C?ASqqa:-pQU
+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!Df0!(Gp%'7FD)*j
:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!+m6E-67F
A8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<Y07
ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+Ap806A9/k9+<Ve;
AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu:-pQU+<Y3/A92j$
FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%D@HqJ67sB'+CoA+
F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"F_t]-F<D]=ATT&5
@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=AKZ&(EbTK7+EV1>
F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1
@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*AS-!++<VdL+D58-
+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/DIIBn+Dbb5FE7lu
:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gmt*U67sB'
+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#ATVK++<Ve;ASbq"
AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9ARloo@<>oe$;No?
+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4AS5Of@rrh9+CfG'
@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9+<VeFE+No0@3B)p
@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is/g)8ZE-686G]7J-
Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688F!)SJ+<VdL+EMXC
Eb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2@;TR,+CfG'@<?4%
DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`IDfTD3-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<+<VdL+EMXCEb-A3
@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'+E2IFGAhM4F!)SJ
+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/@UX'qEb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2DfTD3Ea`iuAKWZa
0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P90G<i+<VdL+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H;cGn@1a!n`+<Ve%
67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO:fBM<2'="a+<XEG
/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO:-pQUD..-r+Co2,
ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^/430":JFYa%13OO
6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4rF)rIBEZf4-@rcK1
FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,C1Ums+Eq78+D,>.
F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$D/aE2ASuTN+EM47
Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr6IF*&OHBl.E(
DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cmDf'H3DIm^-+EV%$
Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h+E1b2BHSlL-tI%&
DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKXH=\4;Afu#$C1Ums
+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(Bl%?'@rH4'Df0-(
FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%8PW;b<Cp.Y;a!/a
8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/rCh4`!Df'H3DIm^-
Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F
%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&@1<Q8:0(=_;cH[Y
3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO:-pQUFE2)4+ED1/BQP@F
FE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY
/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(FDl)6F&#%S.V`m4
FDl)6F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB
$;No?+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5
E%c9TBlmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat
@;TRs+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(
ARfh'+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D
+ED%1Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-
E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Ve;Ble60@<iu6DJX$)AKXT@6m-/SCiCL>+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD
@;BEsCi<`m+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/
G]4cJ+<Y]9FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL
+D58-F!,@/D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+
8l%ht@rH7.ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9
EHPh8F)Q)@ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL
+<VdL+<VdL+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4J
Ed8d@@;]V$+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8
F)Q)@ARlp(AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1Ums
F!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJ
DfTA2AU&01@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE
<(pF;@ps1i+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41
F)tc&ATJtBC2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcm
Eb$;:BPDR"F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!
C2[X*FD5Pd67sB1C2[X*FD5P6@kB8T@3B&uCi!ZmFD5Z2+E(j78l%htF`_>6BlnVCGAhM4F#kFT
G][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu&+EM+9+E(j7
BOPdhGp%6OBl%L*ATJu9BOQ!*F`V+:FD,5.@rHC!%15is/g+b7@qfanFD5<-+E(j78l%htFDi:@
ATDC$Ebuq@@<64*+E(j7B4YslEa`c,F`V+:FDi9o+E2@>B6%EtD.Ra//e&._67r]S:-pQU8T&W]
Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z@rH4'C*4WA+D#e>Eb0*!+Cf>,E,oN2F(oQ1+E(j7
A8,OqBl@ltEd8dODfTB0%15is/g)8ZA7Zl++<VdL+CoM2E$/_4Ec5t@@rGmh+D,Y4D'2GH6m-M]
F*2;@Et&IO67sB'+Co2-E$-8G+<Y3/F)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'%15is/g)8ZA8bs#
+<VdL+D,P4D..N/@rH4$ASuU2+DG^9GAhM4F!+n/A0>E$@s)X"DKKq/$;No?+<Ve<A0<!;+<VdL
ARoLs+E(_(ARfh'+D,Y4D'2GH6k'Ju67sB'+D#X;+<VdL+<Y6+BlkJ>AU&;+$;No?+<Ve>F<D\K
+<VdLB4Z0-FCf]=+E)CE+E(j7ARoLs+EqO;A8c[5%15is/g)8ZEb0E4+<VdL+Dbb5F<GU8@qBP"
Cj@.DAThd/ARlp%@VTIaFE7lu:-pQU+<Y]A+<VdL+<VeIF`&==@:O=rEt&IO67sB'+EDRG+<VdL
+<Y]IDBO%0F`_P<DeF><FCfN8Et&IO67sB'+DPh*BOu"!+<Y-6Dg-86+AbHq+E).6Bl7K)BOu"!
%15is/e&._67sBUDffQ33XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'
0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,!F/KeS8E+NotASuT4GAhM4F!(o!%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4
+CT>4F_t]2%15C";cQO\;b]PU90G<`@<6L4D.RcL-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@<H[*DfQ9o5uglT:JsnQ;G0/6-Xh.>BQ%oP-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@rc-hFCetl$:@][5u^9@9gMZM4ZXs#Eb/[$ARmhL%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt2H!t5+BQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f6s2fD9gMZM4ZXs$H!t5E-OgCl$;No?
+CoD#F_t]-FCB9*Df-\7@<--+AoD]4D/X<#A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15g*:-h9B
5uL?=3[\c_DII':-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4G%G]'@<?4#%16-);F3ZK
8PMoF;G0/6-[''A@UX@mD)s$R$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfC@Dfd+GDfTB0
%16!/:K1Ck;FFGX5uL?=3[\rdDfg2AEb'5P-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<-.)+>"^H
AT23uA9/l3DBNk>BOu3,D..I#Et&IE:IA,V78?fV5uL?S4ZX]O;c?[j78loH;G0);<E)Lb;GBGT
905L=76smA6qosF905OE5t"F5;G0)G:JO2D9gMZM4'"dJ6:"RB9hdoO906$I:K1Ck;FFGX5uL>b
$4R>;67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuTN+DPh*+<`-_.6T:+A7B@pF`2A5
+:SZtF?MZ-?!q2PCiOT9FCd]i8OccQ:(7O>$;No?.V3L.A7]^kDId<rFE7lu              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.3+>P&q+>Pes2BXh8+?(E#1E\Y"1b^%3+>bks2]st6C2[X"@;0U%8l%htA8,OqBl@ltEd8d;
CghC+C2[WnDdm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3
F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u
+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a
:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2Bl@l3De:+?C2[W3                             ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 grplitBasic01 putNameTimestampsBasic00 restdBasic01''),(<(<''j'
zz=:zz,'odcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._1 '' jodsmok'
zz=:zz,'etests compjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00''),'
zz=:zz,'<(<''jodstresstests''),<0$a:                                         '
zz=:294{.zz
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
1G^.2+>P&o1E\M4+>GYp1c?I21E\P6+>GYp2)$.-1a"Y0C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7
+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7@rc^5BHVD.F*)IG
/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A8G[pB4Z0rF*)J>@<-!l+D,1nF(o*"
AKZ)+F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W2pF`\a<ARTXo@VfTuA79RgC2[X(D/X3$FCfN8F)u2:
CLnW1ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'6+De*p2Eb0<5FCfN8
F)uGDATMo8FCfN8F!*%WFCfN8F!,[@FD)e5@<-!l+EVNEG%G]>+DbJ,B4W2r@<>o          ~>
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
1E\P#-p0UR/mg=U-QkfK7nHZY+@T1+0ebC+84>g478b7"H:gt$Bl8$(Eb8`iAKXQj8l%ihDKKH1
Amo1\;cH%X6pX^=+A$lO:IK;CDesJ;8U=!)7!3TcDKKH1Amo1\+A,Et<)6:`;cZU\+A,Et<_Yt)
9gM-E:K1In73GAm7TEAS5u^8q:I7NN;aWoI<$4t'7TEAS:e"P0<(0_b=[>bV78b7;B4Z0-@W$"'
ARTUhBHUeuARfLnFECr#1E^1GD/aN,F)u(=@rc-hFCf3*A0>Dl@;BHtARlorATVg3F*(i-E$/t0
+Dbt)A9Vs4A9/l2Dfor6Eb024Ddmg"G]Y'HA0>i6FCB!%FE8RFD'3k@F=/Lg-p0UR/mg=U-Qll9
Cf>1hCLo1R+Cf>,E,&<gDeio<0HakDD/a5gD/X3$0JO\\Bk1.ZDeio<0HanDCf>1hCLo1R+D#(^
D/X3$0JFVlE+EC!ASQ-oA8-+,EbT!*FD5Z2-RgSp4?P\X?SNZN+DPh*+DPh*A8bp"C2[X"@;BEs
C2[X(FDl22+DPh*FDl)6F!,49A9E!.CaUY_-p0UR/mg=U-Qm/BA7AtgBk)6rF*)IGC2[WmEclG:
FCfN8F!,49A8G[pB4Z0rF*)IGC2[X(D/X3$FCfN8F!,49A92j5ATMp7ATMs7-RgSp4?P\X?SNZN
+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=Wh0rBl%<pDe*QsF!,.1F*)>@H"q8.
+D>J1FDl2FC2[WnDdso,@;BF@@<6-m8l%iSATMs7+DkP&AQ*GaCLp+66r[`=FE8RA@;]dkATMs.
De'u-@;]dkATMs.De*Bs@s)X"DKI"<@;]dkATMs.De*p-F`Lu'-RgSp4>J$80I/D-0f:XE0Jb=>
2`!-A2`3HQ+>PW*2)%!D1G1LB3&3EJ0K1^/1,(F?0K1aH/iGRE3&icR2)ud70JPF=2_[!>2D[9I
0f1jJ1*A>+0f:XD1,LUA2*!EP2*!HQ+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1[@/iGLE1,1UF
2DQC10JPF=2_[!>2D[9I1,Ca@1a"P-0f:XD0JY7=1H.'D2)@*K+>PW*2)$sE3%d*J3B/iL3&<?5
1,(F?0K1^F/i,IA3&icM2`2^50JPF=2_d6D1b^gI1,LgC0d&5*0f:XD0fL^@3&*ER1b^jD+>PW*
2)$sE0eP7?1bq$K0f1g31,(F?0K1aD/iGI?0f:mM1H?R50JPF=3&!-@1c$m@2`E`R0d&5*0f:XD
1-$sC2`3TN3A<?G+>PW*2)$sD2_HmG2)@6N1-%<:1,(F?0K1aC/i5LB1GpsD2)HF20JPF=3&!-@
1bppE2D[3G3?U(20f:XD1,pmB2_[!C2*!BI+>PW*2)$sC2D-gC2)@6J3AiN61,(F?0K1^F/i5FD
3ArlP2)cX50JPF=2_m0A1c7'I2*!KM2'=Y.0f:XD1-$sD2)@'F1cRBK+>PW*2)$sE3%d*H2`*<G
1cIB:1,(F?0K:aB/i,FD2DI$C3&r*:0JPF=2_[!>2Dd3H1G^^C3$9t10f:XD0fL^B1,h3O2)%!4
1,(F?0K1^F/i>CC2)@6L2)HF20JPF=3&!-@2E*EG0K1jH3?U(20f:XE0Jb=>3&3?I3ANKQ+>PW*
2)$sE3%d*H2)mQQ2DmK;1,(F?0K:aC/i,FH0K1pH2_cF10JPF=2_m3B2DmKM3AifQ3?U(20f:XE
0JkC<2`WQN2`!BI+>PW*2)%!D1bLRC3A<BN1H.$21,(F?0K:aC/i,FH0KCgI0f'q-0JPF=3&!0A
1H.<J3&3EP3$9t10f:XD1,pmE2`WiS0K:jE+>PW*2)$sD2_HmG0fV-M0fLs41,(F?0K1^F/i57?
3&3<I1,0n,0JPF=2_d6D1H7*L3A`EK1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*2)$sE3%d*H2D[9J
2)I'21,(F?0K:aC/i,FG3&`QJ2)QL30JPF=2_mBG1c70I0K(aA1*A>+0f:XD0fL^A0fD!L2DR9M
+>PW*2)$sE1G1LC1,CdD1,Um21,(F?0K:aB/i5@=1bgjE1,g=20JPF=2_mBG1c70J1GCdE1a"P-
0f:XD0K(O?1c7'L1-%3H+>PW*2)$sD2_HpE2E<ZU0f:m41,(F?0K1aC/i5FA2DmKO1c6C20JPF=
2_mBG1c70I3&`ZQ2'=Y.0f:XD1,pmE2)d?J1,LpL+>PW*2)%!D1G1IB2)[0G0fV091,(F?0K1[@
/iGOB1c$pA2E2g70JPF=2_m*?1c@9H1,h-J0d&5*0f:XD0fL^B1,h'H3A`TM.4cl01*AM$1,(F?
0K1dB/iGRD0fV!F1H-F30JPF=2_d6D1c$mI2*!TR3?U(20f:XD1,1C<2)m<H1,h$H+>PW*2)$sC
3A*0F0K:pG1-%<:1,(F?0K1a@/iPXD1H@EQ1c?I30JPF=2_mBG1cI<L1-%?M0d&5*0f:XD0f:R?
0f^pF3B/`L+>PW*2)%!D1bLRA0ek[J0fUp21,(F?0K1^F/i5FC2D@!K3&Da50JPF=2_m-@1cR3G
2`3TM1a"P-0f:XD0KCaC1GggC3A<-F+>PW*2)$sE0J5==3B/`K2D@!21,(F?0K1dA/i,CB0f_$J
1c-=10JPF=2_d0B1bh!E2*!WN1FXk'4>J$;,Vh&.2)$sC2D-gD2`<WR1,Cm41,(F?0K1[D/i5FA
1-%*M2)-4/0JPF=2_[-B1c@0E0f1R>2]sk00f:XD0K(O?1c@6J0K1aG+>PW*2)$sC2D-gE2D@$K
1Gq*61,(F?0K1[D/i5IF0f^sB2`Mp80JPF=3&!-@2E*HJ2Dd6L3?U(20f:XE0Jb=<1,^mG1,CmF
+>PW*2)$sC2D-gE1b^X@0JYR01,(F?0K:aB/i5IG1H%$J3Ahp70JPF=2_[-B1c@6G2E3KM2]sk0
0f:XD0fL^A0f(aD1,C^E.4cl01*AG"1,(F?0K1[G/i5FE0fUsF2)cX50JPF=2_[6E1c7*H0JYXE
3$9t10f:XD0KCaB2)I!I1c[QV+>PW*2)$sC3A*-G1H@6K2`3E71,(F?0K1[G/i5FB1,(^B2DZI2
0JPF=2_mBG2D[?I2D@'D2BXb/0f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH3B9)B1,(F?
0K1aI/iGLE0f(R>1GL"-0JPF=2_[6E1c7*F0KCgF1FXk'4>J$60I/D-0f:XD0JY7=1H.'E1GCgD
+>PW*2)$sC1+kI@2_m-F1H@H<1,(F?0K1aA/iG[D1c%'L2`W!90JPF=2_[$?3B/uU3&E?I1E\G,
0f:XD0Jb=A3B&iO0ebI?+>PW*2)$sD0J51:3&ruW2Dd341,(F?0K1^?/i5:?1H%$F2E2g70JPF=
2_[!>2D[9I0f1mM3$9t10f:XD0JY7=1H.'D2)$s31,(F?0K1[@/iGLE1,1X?1G^./0JPF=3&!0A
1H.<J3&rrR2'=Y.0f:XE0JkC<2`WQP1,UjD+>PW*2)$sE0eP@D0fV-J2DlU40JPF=3&!-@1H.9Q
1H%0J2BXb/0f:XE0Jb=;3&39G2)@3J+>PW*2)$sD0J51<0JY==2Dd-21,(F?0K1^?/i5:@2)$gC
3&Mg60JPF=3&!0A1H.<J2`ENO0d&5*0f:XE0JkC<2`WQN2`3EM+>PW*2)%!D1bLRC3A<BN1H.$;
/1<V7.4cl00I\P$4>838-p014/3GT                                             ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
