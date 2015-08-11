NB. JOD dictionary dump: 11 Aug 2015 08:48:09
NB. Generated with JOD version; 0.9.99; 1; 11 Aug 2015 08:47:28
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

JODTOOLSVMD=:'0.9.99';1;'11 Aug 2015 08:47:28'

JODVMD=:'0.9.99';1;'11 Aug 2015 08:47:28'

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

bnl=:3 : 0

NB.*bnl v-- list objects in put dictionary database backup files.
NB.
NB. monad:  dnl clStr | zlStr
NB.
NB.   bnl ''        NB. list all words in last backup
NB.   bnl '.'       NB. list backup suffixes
NB.   bnl 'pfx'     NB. list all words in last backup starting with 'pfx'
NB.   bnl 're.12'   NB. list all words in backup 12 starting with 're'
NB.
NB. dyad:  ilCodes bnl clStr | zlStr
NB.
NB.   4 2  bnl 'ex'     NB. macros with names containing 'ex' in last backup
NB.   2 3  bnl 'et.13'  NB. groups with names ending with 'et' in backup 13

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ((0{x) e. WORD,MACRO) *. -.(2{x) e. DEFAULT,MACROTYPE,i. 4 do. jderr ERR001 
elseif. ({. x) e. OBJECTNC do. x bnlsearch__ST y 
elseif.do. jderr ERR001 
end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. maintains argument compatibility with (dnl)
bv=. DEFAULT ~: 2{x
if. bv *. (0{x) e. TEST,GROUP,SUITE do. jderr ERR001 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__DL do. jderr ERR103 return. end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

if. (,NDOT)-:alltrim y do.
  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. bfile=. ({.x) dbakf__DL rbk
        NB. errmsg: jfile read failure
 
  badjr uv=. jread bfile;(1{CNDIR),CNCLASS do. (jderr ERR088,' ->'),<bfile 

elseif.
        ol=. uv{ol [ uv=. /: ol [ 'ol oc'=. uv 
        NB. reduce object list for words and macros if class specified
        if. bv *. (0{x) e. WORD,MACRO do. ol=. (oc = 2{x)#ol [ oc=. uv{oc end.

  isempty pat do. ok ol  NB. return sorted last backup name list

elseif. 0=#ol do. ok ol  NB. nothing left to match
elseif. do.              NB. match prefix, infix suffix
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
  mdt=. 'NB. require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,mdt
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
2`2^<+>P&o0H`))2`NK60esk,0JkO-0esk,2`EN80ea_)0etL,0ea_*1bpp23?U%80ea_)1a"M-
2E;m71a"M/0ea_*0d&8,3AFu\Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n@W$!2+CT;'F_t]-
F<GXADeio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(ON
+Co1rFD5Z2@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.
De(OL%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]g
CbmdT$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is
@j"tu-ZW]>Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a
%14M1/g<"mCi<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?
+E;OBFCdTr-RU8h-7hD1/1)_l-RU?.-mO0`4utqW4XMO(-RU>l%13OO:-pQUB4YslEaa'$+CT)&
+E27?F(o*"AKZ/)Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$4R>;67sC%@q]jF3ZpUIBeCMa
+<XEG/g,4H@<,jk+E;O4Ch[KqATDi$$;No?+DPe(4ZX].+<YAN+>b2`:-pQU8g&=rEb$;1@;TQu
@r,RpEt&Hc$;No?+Eh10Bk/?&AS-$,.!R0`@<-"'D.RU,Et&IO67sB'+<X*hBk1dc+<VdpBk)7!
Df0!(GscL\ATJt:+<VdL+<X'd@ruF'DIIR26Z6LHF&QXYEarc*+<VdL+<Xa(Eb&*[@<,jk8krf3
AOC9BF)rHH+<VdL+<VdL9jqOPDc:4UEarcW@:O=rFEqh:%15is/g+t=Eb@Nr+=K?d/he^s/0H?'
+tt-86:s[6<),ef@;9^k?R[*K+=Jdf-r30%771$L6XO8:De*3(4*+nFE@E"]+=Jdf-nJFq;FFl#
C2[Wi.6DT\BQ6+J/g)u"+=nW`/:/cr9gM-E:L@OFDe*3(4*+nFEB?l\6W-]Z=\qOo@;9^k?RZEk
%15is/g,=GCh[E&EbT0"F<DuW.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+<VdLASlC.Gp"5=@:O(q
E+<d-+<Ve8Ci!g'@UWb^F`8HGD..NrBQ@ZoASuT4+<YN0FCSuuDIR$aCNXS*$;No?+ECn2B0A9u
-RU#Z4!5Xn/ghba+<VdL+?L\n/n8gBDKI6K4!5Xg-Z3@0ALATC+<VdL4!5ng@;TR.@rHL-F=.M)
%15is/g+bEEc#6,F!+n-C`mn0Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+=BoN/g)Ma
/0Zek+?Lc%+<iin/j:C4+>=on+F>:e+<Wij-p/k"@W$!)-Rg/h+A=g=0d&"iHQX_!Cgh?s.3L/a
4E5L^FCcdO4s4lSEb>gg%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'
Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh
/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&@;^?5@UWb^F`;CE
%15Ks4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@EZd\794)$o9IqP@
/no'4-OgCl$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bhCNXT;+>"^IG]75(
FCeu*ATDg0EX`@nATAo&DJUFC-OgE#ATAo&DJUFC/gh)8DImi2@W$!)-S@2&%13OO:-pQU@rc-h
FCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.j
E+*6lA0<7AATMs.De(OL%13OO:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ3
0JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.24tq>&@:O(`+=D8BF*)/8A2#A?$6Tcb:-pQUFD,B/
A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR
0RIbI@r#Tt-Zip@FD>`)0II;:%15is/g,4RD.Oi!@<6-m+DG_:@;KXg+CT;'F_t]-FE8QV+D#e:
ARfgnA0>H(Ec5t-$>sEq+C]5)+=AdM-OgE#ATAnM+C]5)+=Acn0ddD;DImi21*C%DC`k)X/gh)8
DImi2@W$!)0F\A,ATAo&DJUFX-RT?1%15is/g,4RD.Oi!@<6-m+DG@tDKKT7Bk;?.%14LmDJUFC
-Rg/i3ZqmLC`keoHX^l/+=Ach+:SZ+0HahBC`k)Q.3L3'+>=pIDJUFW0mbSs@W$!)-S?bh%14L<
+C]5)+=ANc+>#Vs0d'qCC`keoHSHXPDJUFC/ghbN$7IYP@W$!)-RU>c/NP"0+C]5)+?M<)1*C%D
C`k)X-Qij*-o2uTDJUFC-Rg/i3Zp4$@W$!)4#)(<+C]5)+=Ach+:SZ+1a$7FC`k)Q.3L3'+>b3M
DJUFW0mb`"@W$!)-S?bh%13OO:-pQU+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8
%16QQA8ZO,4ZX]5/ghbm+<iih0f'q&+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq
+D,Y4D'0s=Df0-2BleB-DKI"1@:O(qE$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQp
DImi20HahBC`m1qA8ZO,%16uaEZd(Z@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\
@W$!)@UWebF_qQpDImi21a$7FC`m1qA8ZO,%13OO:-pQU9jqpb+E(j7Eb0)rBl7X&B-;;-F*)IG
@rc:*Bk(RfCj@.6AT23uA0>f.+EV:.+Dbt)A7]9oDdmHm@rucE%15is/g*_t+EV:.+Dbt)A0>r1
Deio,FCfN8+EM%5BlJ08+CT;%+Cf(nDJ*Nk+CQC/Dfd+?Afu2/ATME*FCfN8Et&IO67sBtF`VXI
@V$[&AThd/ARmD9%13OO:-pQU+C]5)+=ANG$7KG&C`k)Q.3L3'+C]5)+=ANG$4R>;67sB'@W$!)
-SAnIF`):K%14LmDJUFC-Rg/i3ZqmLC`keoHX^l/+=Ach%13OO:-pQU+C]5)+=D&8D.P(($7IVj
+?MV36;LBN5u^WS0H`\X:J=&R:JEPd6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs@W$!)-ULU)9IC8V
%15is/g)9GDJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3ZqmLC`k)s
:/iSl4#2.lDJU[Q-OgCl$;No?+>=pIDJUFC-OgD20HanDC`k)Q.3L3'+<W?\@W$!)-RT?1%15is
/g)hj@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!@W$!)-S?bU$4R>;67sB7+C]5)+=AdODfor>-OgD2
0HanDC`k)Q.3L3'+>=pIDJUFW0mdAIC`k)X-OgCl$;No?+>=pIDJUFCDIIBn-OgD20fpL>3[[6i
:J=&R:JEMc6;LBN5u^WS0d&eY:J=GR;cFl+:JXY`5se76-Rg/i3Zp+!@W$!)-ULU)9IC8V%15is
/g)hj@W$!)-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,/NP".+C]5)+=B`U
<$s4Y14*JJCaUh_%13OO:-pQU0d'qCC`k)Q%14L<4"#)dDeio<<+U,m0IJq0F)>i2AMI.qF*')`
4"#)dDeio=<+U,m0deCm/NP"/+C]5)+=ANG$4R>;67sB8+C]5)+=Ach%14LmDJUFC/gi(j/NP"/
+C]5)+=Ach%13OO:-pQU0d'qCC`k)X@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFW
14*JJCaUh_%13OO:-pQU0d'qCC`k*C@;TR'%14L<4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a
.3L3'+>G!JDJUFCF)>i2AMGPA$4R>;67sB8+C]5)+=D&8D.P>0Dfor>-OgD20fpb(D/X3$0N;V)
F>,'k+>#Vs0d'qCC`k*HD/X3$0IJD514*JJCaUh_%13OO:-pQU1*C%DC`k)Q%14L<4""KUDesK3
Deio<-T`\bDf9H5D/X3$0df%1Bl8$6D/X3$0IJq0Bl8$6D/X3$0deCm/NP"0+C]5)+=ANG$4R>;
67sB9+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M)
-n%24.4dS8,[i__+>#Vs1*C%DC`keqHX^l/-S?bU$4R>;67sB9+C]5)+=D&8D.P(($7IVj-Y[I?
F)>i2AMGP]+>#Vs1*C%DC`k*>DKKr:Deio=-OgCl$;No?+>P'KDJUFCDIIBn/n8gBDKI68$7IVj
-Xq"4CiaH3CLo1I.3L3'+>P'KDJUFC@W-1$-S.>7HX^l/+=Ach%13OO:-pQU1E^.EC`k)Q%14L<
4"#)lBlmp-D/X3$0deCm/NP"1+C]5)-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$
@W$!)-S?bU$4R>;67sB:+C]5)+=AdODfor>-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`keo
HX^l/-S?bU$4R>;67sB:+C]5)+=D&8D.P(($7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)-ZaDX
%13OO:-pQU1E^.EC`k*C@;TR.@rHL-F=.M)-n%24.4dS8,[i__+>#Vs1E^.EC`k*HFXJ_%14*JJ
CaUh_%13OO:-pQU1a$7FC`k)Q%14L<4"#)dDeio<9jqOPD_NP#-Za-CCLo1o@:O=r0df%1F)>i2
AMHnf@rcKA-T`\sD/X3$0hl(dEc3Z[.3L3'+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1
+=Ach.3L3'+>b3MDJUFC/gh)8%15is/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo
:-pQU1a$7FC`k*C@;TR.@rHL-F=.M):-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2
@W$!)-S?bq+>#Vs0H`(m@W$!)-S?bU$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)
+=D&8D.P(($;No?+>=om+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M)
:-pQU0H`+n@W$!)-Z3@0AL@oo:-pQU0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q
%13OO:-pQU0H`.o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)
+=AdODfor>-OgDX67sB7+>Y-LDJUFCDIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?
+>Fun+C]5)+=ANG$4R>;67sB8+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO
:-pQU0d&1n@W$!)-SAnIF`):K%15is/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.
@rHL-F=.M):-pQU0d&4o@W$!)-RT?1%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o
@W$!)-S?bU$4R>;67sB8+>P'KDJUFC/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo
+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC
/gi(j/NP"/+>Y-LDJUFC/gh)8%15is/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0
AL@oo:-pQU0d&7p@W$!)-Z3@0AM.J2F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp1#0d'qCC`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9
+>G!JDJUFCDIIBn-OgDX67sB9+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;
67sB9+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnI
F`):K%15is/g)nl1*C%DC`k*C@;TR'%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q
@W$!)-RT?1%15is/g)nl1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9
+>Y-LDJUFC/n8gBDKI68$;No?+>P&q+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>
-OgDX67sB:+>G!JDJUFC-OgCl$;No?+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC
/gh)8%15is/g)qm0d'qCC`k)X@rHL-F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)
-Z3@0AM.J2F`):K%15is/g)qm1*C%DC`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp4$1*C%DC`k)X-OgCl$;No?+>Y,q+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX
67sB:+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8
-t7(1+=Ach.3L3'+>Y,r+C]5)+=Ach%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.E
C`k*C@;TR'%15is/g)qm1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn
0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68
$;No?+>b2q+C]5)+=D&8D.P(($;No?+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC
-OgCl$;No?+>b2r+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%D
C`k)X@rHL-F=.M):-pQU1a"Or@W$!)-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1E^.EC`k)Q%13OO:-pQU1a"Rs@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl
$;No?+>b2s+C]5)+=AdODfor>-OgDX67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn
/n8gBDKI68$;No?+>=om+>=pIDJUFC-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'
+>=om+>=pIDJUFC/gh)8%15is/g)hj0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0
AL@oo:-pQU0H`(m0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m
0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gB
DKI68$;No?+>=om+>G!JDJUFCDIIBn-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7
+>Fuo+C]5)+=ANG$4R>;67sB7+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach
%13OO:-pQU0H`(m1*C%DC`k)X@rHL-F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o
@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!0d&7p@W$!)-S?bU$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup
+C]5)+=D&8D.P(($;No?+>=om+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl
$;No?+>=on+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n
@W$!)-SAnIF`):K%15is/g)hj1*A7n@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-
F=.M):-pQU0H`+n0d'qCC`k)Q%13OO:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n
0d'qCC`k)X-OgCl$;No?+>=on+>G!JDJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX
67sB7+>P&o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)
+=Ach%14LmDJUFC/gi(j/NP".+>P&p+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M)
:-pQU0H`+n1*C%DC`k*C@;TR'%15is/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q
@W$!)-RT?1%15is/g)hj1*A@q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;
67sB7+>P&q+C]5)+=AdODfor>-OgDX67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFC
DIIBn/n8gBDKI68$;No?+>=oo+>=pIDJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach
.3L3'+>=oo+>=pIDJUFC/gh)8%15is/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)
-Z3@0AL@oo:-pQU0H`.o0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU
0H`.o0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC
/n8gBDKI68$;No?+>=oo+>G!JDJUFCDIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX
67sB7+>Y,q+C]5)+=ANG$4R>;67sB7+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)
+=Ach%13OO:-pQU0H`.o1*C%DC`k)X@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj
1E\Fq@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp+!1E\Ir@W$!)-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7
+>Y,r+C]5)+=D&8D.P(($;No?+>=oo+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)
-RT?1%15is/g)tn0d&5++C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?
+>b2q+>PYo@W$!)-SAnIF`):K%15is/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)
-Z3@0AM.J2F`):K%15is/g)tn0d&5,+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)
-S?bq+>#Vs1a"Lq1,9t]DJUFC/gh)8%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo
1*C%DC`k*C@;TR'%15is/g)tn0d&5,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q
%13OO:-pQU1a"Lq1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;
+>Fuo1E^.EC`k)X@rHL-F=.M):-pQU1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU1a"Lq1,L+_DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp7%0d&5.+C]5)+=Ach%13OO:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr
@W$!)-Z3@0AL@oo:-pQU1a"Lq1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1
%15is/g)tn0d&5/+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q
+>Pes@W$!)-SAnIF`):K%15is/g)tn0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0
AM.J2F`):K%15is/g)tn0d&50+C]5)+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq
+>#Vs1a"Lq1,^7aDJUFC/gh)8%15is/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIH
C`k*C@;TR'%15is/g)tn0d&50+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO
:-pQU1a"Lq1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo
2]uRIC`k)X@rHL-F=.M):-pQU1a"Lq1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.
@rHL-F=.M):-pQU1a"Lq1,pCcDJUFC-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp7%0d&52+C]5)+=Ach%13OO:-pQU1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)
-Z3@0AL@oo:-pQU1a"Lq1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is
/g)tn1*A>,+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo
@W$!)-SAnIF`):K%15is/g)tn1*A>,+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2
F`):K%15is/g)tn1*A>-+C]5)+=ANG$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Or1,9t]DJUFC/gh)8%15is/g)tn1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C
@;TR'%15is/g)tn1*A>-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU
1a"Or1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.E
C`k)X@rHL-F=.M):-pQU1a"Or1,C%^DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU1a"Or1,L+_DJUFC-OgCl$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
1*A>/+C]5)+=Ach%13OO:-pQU1a"Or1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0
AL@oo:-pQU1a"Or1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn
1*A>0+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)
-SAnIF`):K%15is/g)tn1*A>0+C]5)+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K
%15is/g)tn1*A>1+C]5)+=ANG$4R>;67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or
1,^7aDJUFC/gh)8%15is/g)tn1*A>1+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'
%15is/g)tn1*A>1+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or
1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X
@rHL-F=.M):-pQU1a"Or1,g=bDJUFCDIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Or1,pCcDJUFC-OgCl$;No?+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3
+C]5)+=Ach%13OO:-pQU1a"Or1,pCcDJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo
:-pQU1a"Or1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnI
F`):K%15is/g)tn1E\G-+C]5)+=D&8D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1E\G.+C]5)+=ANG$4R>;67sB;+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]
DJUFC/gh)8%15is/g)tn1E\G.+C]5)+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is
/g)tn1E\G.+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-
F=.M):-pQU1a"Rs1,C%^DJUFCDIIBn-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU
1a"Rs1,L+_DJUFC-OgCl$;No?+>b2s+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)
+=Ach%13OO:-pQU1a"Rs1,L+_DJUFC/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU
1a"Rs1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K
%15is/g)tn1E\G1+C]5)+=D&8D.P(($;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1E\G2+C]5)+=ANG$4R>;67sB;+>Y,q2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC
/gh)8%15is/g)tn1E\G2+C]5)+=AdODfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn
1E\G2+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC
/gh)8-t7(1+=Ach.3L3'+>b2s+>Pku@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M)
:-pQU1a"Rs1,g=bDJUFCDIIBn-OgDX67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs
1,pCcDJUFC-OgCl$;No?+>b2s+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach
%13OO:-pQU1a"Rs1,pCcDJUFC/n8gBDKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs
1,pCcDJUFCDIIBn/n8gBDKI68$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R=j0fU=;1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1R
:-pQ_@rH4'C/\tfCLo1R+ET1e+EV19F<DuADf'H..3NM:D.Oi.@V0b(@psInDf.0:$;No?%15is
/g+5/ASrW4BOr;/F*)G:DJ((?001OF3ZoPRE,]AsEcW?GBl5%9@3A/b+EqaEA0<!C@rH4'C+19L
Bl%Sp$;No?+E(_$F`V&$FCcS'DL!?ICi<flC`mV(D.Rc@+AZHYF`V&$FCeu*DIIBnF!)T7AS5^p
+<YlBFD)e=BOqV[:-pQUE,oN%Bm:aC-r30!<Du7]7T_)^+CT.u+<Ve<DIak4GA2/4+<Y]5DId[&
+<Y-%F(HI::-hTC5tk*G5n+/r67sC%F_56"G\(q=+<Y04DKKo;Ci!Zn+<Y-=+<W(.6:OsR6UOUJ
.4u_c+@p3ZBOu3,+<Yi9Cis<1+<YT7%15is/g)Q<6:OsR6UOUJ.3N87DImisFCcS2Df03!EZee.
A0>]"F)rI?Bkq9rGp%3I+Cf4rF(c\6@;TRs/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU
+<WBf+CT>4F_t]2+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#GTAU%p1FE7lu:-pQB$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCb[jX$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1
Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE
3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$9g.j
De't<FCfN8C2[W:-QlV91E^UH+<W$Z%13OO:-pQU@q]:k@:OCjEZfI4@VfTuEb031ATMF#FCB9*
Df-\9Afth2GAhM4F"AGD@;Ka@+<YE/EZc`QATD6-%16i[E]lHf3Zq]i/mg=U-o!E&@4iuO/0J.X
+>k<'2'>!j$4R>;67sBkAS,XoAKZ28Eb$;:Bln#2Ddm=$F(8X#Bl@ku$?'BcF`V&$FCf<#0KhH>
1E\_$0F\@a67sB/001OF3Zr?MAp&0)@<?''Ci<flC`mV(D.Rbt$7BY.@ps1p+EV:*F<G4-F<Gd=
Bl[`34Y@k&%16]cEaO!.De*c=+F,)?D_;J++<YK=@ps1p%144#G@bK/A.8kg+DDr]/g)BTDe!3l
Et&I!+Enqk/g+j;$>"*c/e&.:%13OO:-pQUCi<flC`m\5@;0U%DIIBnEt&ImDIIBnF$2Q,4"*3G
4#&0,HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO:-pQUF*)>@
AKY])+Co1rFD5Z2@<-W&$>"6#FDYu5Ddso/F`\`RDdm=$F(8X#ASl!4-OgCl$;No?+ED%%A0>>i
@r!2qDIal#AS,XoAKZ22FD)e8@V0b(@psIjA0>buD.Rbt$8EZ-+>=s"0JG4(>9H!^HXgu2E,$LC
Ddm=$F(8X#ASl!4-OgCl$;No?+Dbt+@;I')@V0b(@psIjA0>buD.Rbt$?'fjD.RcO3ZpL44>AoP
.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%14L.Df0!#ATK:C
4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs+=o,fDf0!#ATJ:f%17/iDfTr2DJ`r=4ZX]A
+?CW!%14J!De!3lF!,R<@<<W)ATT&=ASH0q-Ts()Gmt*mDfT3.Df90)/g,E^A8a(0$6UI-De!3l
Et&I!+EqC2Eb#Ud+<YA@4Y@j%Ci<flCi^$m+<YkN4Y@jk%16ZaA1e;u.1HUn$;No?+Dbt+@;I'*
Cgh$q+DtV)ATJ:fCi3ZuATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iOBQ%p5ASu?r0OI+3
6$$m]CLoLd3F=-C$4R>;67sC%FDl22+DG^9A8,OqBl@ltEd8*$ATAo8D/a<0@j#`5F<DrPBQ%p5
ASu?r0II;:%15is/g,1G@:UKi@:O'q@;]TuA7]@eDIj7a0d'[C0HiJ20JO\S+?M<)@rH4'C*4mF
BQ%p5ASu?r0II;:%15is/g+tK@ps0rF(fK4F<GI0D.Rbt$?L)nD.RcO3ZpL44>AoP.3Ns[4!67#
HQY$t+D5M/@WNY>F(fK4FCf?,AM@IW5s]R/DeioE3B:Fo%13OO-mNeN@;TRs.3Lbr,A_7+D.Rbt
$4R=s+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,4Q@;TRs%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd
3F?97D/a5gD/X3$0JQ<h/h1@LD/a5gD/X3$0JO\l/M/(n@rH4'C+19K@;KXg+CT;'F_t]-F<GXA
Deio,FCfN8F"Rep67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@lt
Ed8!e67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JG2%AT0=X$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O]:-pQU0emQaFttirF`:l"FCeu*AoD]48l%ht0J5@<1b/o.67sB82/78M1,0nlAStpnARloq
Ec5e;-t@14E,%^JF(o,5+CT.u+CSeqF`VY9A0>K&EZdss3%cmA$;No?+<VdL+<VdL+CT.u+Dtb7
+=M;JDeio8@UX=l@k;G)EbAr7F*)G6F)rmBEclG:.3N_DF*),6B-;5+B5)3o$4:9]@s)g4ASuT4
-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe9
5s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=5uL[1/IDi,ATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ;$>"6#De't<FCfN8C2[W:-OL2U67sBpDKBB0F<GXCD.Oi2FCB&t@<,m$GAhM4
F!,RC+Cf>,E,oN2EsbTZDJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+M0n+>Y-$+>=-0@W-0-4Y@jt
ARTCkH#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8+?_>"0FD`1AU%crATMp,G%G`:
@;]UaEb'564Y@jdDf5siFD,*)@<,pfF(A]r@:s:lB45k!Df^#/DId0rA79RgCht4W/g+VAD]gMP
GmXm+<(02H:K:=9;,pCk7787n5tsdH+@/mo+@/\":EW#&<DGnP7787d:KL:=+?_>"@W-/l$7A>;
:I7?@;]nM26VLKJ778Ld3ZqmMD[Ip#$>"6#FDYu5Ddso/F`\`R9Q+f]:18!NF$XhX;Is9QCjAQ[
Eb&-f<-`Fo-OOm(+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lPATL.XAQ!)JCi"Af@<,mXDcD"$
AL@g>+Bot0D/XQ=E-67FFEhm7$?Km!EcaH*+>Y-$+>=-t67sBu@;TRs+CT)&Eb/ZiGp%$CAKYJr
@<*JB+Du+>+Cf(nDJ*Nk$=Q(MGm\g[/n#kP+>O:M4YC.c.Nj!Z.Nj!D.1-DnEZfI@E,9H&+E2IF
+=D5DDfTqI$?BW!>9G;6@j#l<F=044@rH4'C*4mFBQ%p5-OMRN>9J!(Dfp/@F`\aJG]X9"$?'Bg
ARfh&AS-!H3Zp4$3Zp*`Bjkjc?Z0CgARfgF/g,E^:-pQUA8`T.Dfd+3Df'H6ATMo8DdmHm@ruc!
Ci=B:?XIMb?XI_\C1Ums?XI;]DJ"$4Bl@lP/g)nV$=mjkARfghG^+I?4Y@k&+AP6U+CoC5DJsV>
@rH4'Eb0<5+Dbt+@;KLr$7Q;hATAo8D/a<0@j#`5F<DrL@VTIaFE1r)F!h<8@j"tu-ZW]>FEhmT
4Z[(kD/a54-Z<I/ARfh&AS-!2$8EZ-+EMC<F`_SFF<G[MF:&@fCi<ckCiX*!F$2Q?+?CW!$>40n
@UX(o+=\LBEb-@C+Du+>+=\LDDf'H6ATMp(A0<?EGmYu-$>"6#FDYu5Ddso/F`\`RB5DKq@;Ksq
Aof=,Eap4r+=D2>+EVjM-TsL5@rH4'C*4m:Ci<ckCiX*!F!h;L+Bot0D/XQ=E-67FFEhm7$4:<T
@r,RoARojlDfB9/4ZX]B+?CW!$49Np/g+\9@r,RoARlp)@rH<tF!+n3AKZ)5F^o*1+DtV)ATJu&
DIakuEb,SQ67sBlG[kQ4A7]9oAo_g,+EV:.+Cf>,E,oN2F(oQ1+E2@>@qB_&$4:]pATDg*A7[nb
B5DKq@;L!J3ZrYi+AP6U-n6Z//g,(UATDg*A7ZlrCi<ckCi]pj@W-0J/nf0A4YChpD`o]q0d%S]
+<Ve%67sB/.OdMA+C]8-+D>\3+EVO?$4:B`EaN]mD.Rc@+F,)?D_;A>+<Ve9Df6aJ+DtV)ATM3m
DId='+<XEG/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdkARl,j+<VdSG@_n0ATT&)Ecl80
BOt]sDfp.EDe:,'G\M5@ASu!h-QkQ)+DtV)ATJtD+DtV)ATJ2iDIb@,$>=?r+=\LZ$7Q;hATAo8
D/a<0@j#`5F<DrAARfObEb/d&@rH<tF!h<8@j"tu-ZW]>FEhmT4ZX]qDf'H.+=C]2@r,RoARojl
DfB9/-OMRN>9J!(Dfp/@F`\aJG]X9"D/"6+A927!E+O)R3Zp4$3Zp*`$;No?+Dbt+@;I'#F!+n4
F(o9)ARlp"De!3l+CT.u+D5M/@UX'[:-pQUGA(Q*+CT/5+Dkh;ARlp)@rH<tF!+n3AKYMpFCes(
ARlp%DJXS*:-pQUGA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=Ddmc:+ED%4DfTr@$;No?+CT.u
+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/$4:Tf@ps1:/g,EHCi<flCcsg%1*A%hCi<flC^MTu$>"6#
FDYu5Ddso/F`\`RD/"6+A927!E+O)<$?BW!>9G;6@j#l<F=044+Cf>,E,$LCD/"6+A927!E+O)<
$8EZ-+EMC<F`_SFF<G[MF:&@bDf000F(Jm'@rH<tF$2Q,1E\_$0FA.^67sBpAfu2/ATD?)@<,p%
@;^?5DIIBn+Cf4rF)u&-Bk(RnBl@l3Ble?<ATJ2R67sBsBkq9&@rH6sF`V,)+EM%2E+O)5Df0B:
+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2:$;No?+EV:2F!,1<+EV:.+ELt'ATMr9FD,B+B-;;7+CoCC
+<XWsAKWC6Ci<d(.1/g:/g,=KEag/%ATVKnFE8R5DIal1AT2R.FE8R7Df000F(Jl)A7]7e@<,du
Bl@m1/d_q\67sBiDf6b4F!,")@r,RoARlp"De!3l+CT.u+D5M/@UX'q/Ke\E+D,>#F`M%#$=[pl
4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-$>=?r4YC2^D]gMPGp"5)67sB/.OdMA+C]8-$7Q;hATAo8
D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!h<8@j"tu-ZW]>FEhmT4ZX]qDf'H.+=CZ;DJ"$4ARojl
DfB9/-OL2U67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gp
De3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWBk1.ZDeio<0MXqe.V*7(;f-GgAM>e\F=f'e-tI%&
.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL+:SZQ67r]S:-pQU+<WBf+EMX5DId0rA0=Je
E,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67sB'+>YGh;FNl>
=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+3XlEk67sB'+<VdL.!0$AFD>`)0J">gATMs.De(RR+EV19
FD>`)0eb.$FCfN8C2[W;0JFpu%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(C9F(K;E0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72e6K00f^@dDf0`0Ecbl'+EVNEC,R[u1*B1b
6k'Ju67sB80lCoQ0fU:uE+EC!ARloqDfQsm2_Rj=DKU15$;No?+>G`gF_i`l+ED%2@;TRd+=Lc7
A5d>`CLo1R.3N5CDf$UFA8,R@@<6-m0JG41+:SZQ67sB'+<VdL+<VeIF`&=9DBN\:DJLA2De!3l
AIStU$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&
?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\
<.->-$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2+Eh=:@N[(0Bk/Y8BkM=%Eb0;7
Blk_D+CT;'F_t]-FE9&D$>"6#De't<FCfN8C2[W:-OgDoEZen,A0<Q8$4R>;67sBuF_tT!EZf:4
+Co1rFD5Z2@<-'nF!,C=+E1b2BHV/7F*&OA@<?!m%14g44WkslI4cXQBk/>?%13OOATAo3A0<rp
-Zip@FD>`)0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!+?^hl+FPjbA8,Qs0F\?u$>"6#FZhc.
0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"F!,.-@:Wqi%13OOATAnL+E(d54$"a2
ATMs.De(OEFCfN8C2[W;0JFj`$>"6#FZhc.A8,QsINU<R$8Wef+<r!`+E2%)CERa/$4R>;67sB4
HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]R/DeioE3B:GWDJW6gDeio<0MXqe.V*F5;f-GgAM>e\F=f'e-tI43.3N\KDeio,
FCfN8F"Rn/:-pQB$;No?+@BgR@r$-.+CT)&+<Yc>AKZ/)Ch[E&+CT;'F_t]-F<D]9@<6"$+<YT7
+<W(CDJUaS+<XF%D.Ra+F`S!!:-pQU,&Ut#Ebp"D@rHC.ARfg++DG_:@;KXg+Cei$ATJu&Eb-A%
CiaM;FCfN8ARmD&$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(ON+Co1r
FD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"
F_ife%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2
AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU
/ULGc;cFl<<'aD]I4Ym8%16Ze+E(d5-Zip@FD>`)0II;:%15is/g+\9Ch7^"+CT)&+EqaEA90:E
B6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+
-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUDf0B:+E2IF+Co1rFD5Z2@<-W9BlbD8DBO%7
AKYr#FD)*j1*A_&,@kM!+>=63%15is/g+\=@ruF'DIIR2+DGm>ASlC.Gmt*7+?^hl4s2R&HQY!b
A8Z3+-RT?10H`M$,<d5)+F>4c+CoA++=ANG$8<Sc+<s&m0d(fc1*C+FC`k)Q%14d34Wkt5+>G!c
+>Y-NDJUFC-OgD:+?^hl4s2R&HQY-fA8Z3+-RT?1%15is/g+kGF(KB6+EMI<AKZ/-Eaj)!$?g;q
D.RcO3ZoeZGB.4J+C]P8A2,39GB.4L+C]P8A2>SB$=\4"A2$/-+?^/@@Wuj'0g.Q?/I`%rGB.4L
4ZX]A+?CVmGT\IYGpa%.@Wuj'1HdcA0f'q5+=DCV/Kcek.Nj!a%159QHZX+DCi<f+E-67F4$%P&
@;TRs%13OO:-pQUBl8!'Ec`FFDf'&.DJsZ8Et&IoDIIBnF$2Q,-Z4-KA2#-DGB.4K+DuCDA259F
GB.4M+DuCDA2GYC$7ItsDJim"ATK:`3ZoguF_>N9+Cf>6@W-O5-Rh,*BeCM`+>YH.-o!D?0eb%<
-oa40,p5E0+>P3$2^pgNFZLmmDJ<U!A7Zm#AKYH&D^Pu$4tq>*D/a<0@j#`5F<EY+DJim"ATJ:f
%13OO-tI43+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnEt&I)0HanDC`k)Q.3L3'+>G!#
+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f%14L;+>G!LDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs
3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2E,oN%Bm:'o-nlc!+CoA++=ANc+>#Vs0d&P#-p'J5DIIBn
F"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>T(AncK!$7ISN1E^4GC`k)Q.3L3'+>G!#+=K<4
G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;6F_56"GRXuh$7ISN0d("EC`k*7GB,&[
+>#Vs0d&P#4$%P&@;TRs+<VdL+<VdL:-pQUGAhM4+E2@4AncK!$7ISN1*C+FC`k)^-Rg/i3Zp."
4!6UG-Z4-KA2GYV+<VdL+<VdL:-pQUGAhM4+DG_*Bm:'o-nlc"+CoA++=C\S-Rg/i3Zp."4!6UG
-Xq:?A2,3EGB.4K-QjO,67sC)DfTA2F*2),Bm:'o%16uaEZd%Y0HanDC`k)Q+AP6U+E;O4Ch[Kq
ATAo)EcQ)=Et&IoATAnI+>b3ODJUFC-OgE#ATAnI+>=ol+CoA++=ANG$4R=j0H`(m0HanDC`k)Q
.3L3'+>G!#+?MW%DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DPDfor=.1HV40H`(m
0HanDC`k*CGB.4N-Rg/i3Zp."4!6UG-Z4-KA2GYV:-pQUGAhM4+E2@4AncK4-uNsGDK@69$7ISN
1*A7nA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Z4-KA2>SU+<XEG/g,@VEb$;,DJ!U-+=M,GF`)7L%14L;
+>Y,o+CoA++=C\S-Rg/i3Zp."4!6UG-Z4-KA2,GS+<Ve%67sC)DfTA2F*2),Bm:aKDJsZ8F"%P*
%16uaEZd%Y1a"IpA8Z3+-ZW`F+<XEG/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1p1E^4GC`k*G
A1&KB%16uaEZd%Y0H`.oA8Z3+-Z3iM%16uaEZd%Y0H`(mA8Z3+-[0TLDJ(=+$>sEq+>=ol+>P'M
DJUFC@:s"_DC5l#+:SZ+0H`(m1E^4GC`k)Q.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL:-pQUASlC.
Gp%<LEb$;3Eb/isGT\DXATD7$.1HV40H`(m1E^4GC`k*7GB.4M-Rg/i3Zp."4!6UG-Xq:?A2>SU
:-pQUGAhM4+E2@4AncK4.!B0B@WNt-$7ISN1*A@qA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Xq:?A2>SU
+<XEG/g,@VEb$;,DJ!U-+=MDEEaj)=%14L;+>Y,r+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,GS
+<Ve%67sC)DfTA2F*2),Bm:aKG%G]'F"%P*%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.
ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F??.;f-Gg
AM>f567sa!A5d>`CLo1R+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=
.3KaT@:F%a%15is/g+_9Bln',B.aW#:-pQB$;No?+=Lf3.3N_DF*)IGEb065Bl[c-D/XH++E_a:
EZf(6FCfK9ASuU(Df-\>BOPd$D..=-+E)@8ATAnc:IGX!:-pQUFCfN8F"SRX6$".kFD,5.+EV19
FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeLF(KA7+EqO;A8c[5+<W(NEX`@N67sBoH#R>8Ch[d&F!,17
+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#2
6nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ifn%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eX
D/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%159QHZ*F;-Zip@FD>`)
0IIuI+>Y-YA0<6I%13OO:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaGDfTB0+E(j7G%#E*Dfp+DFEqh:
Et&IcDf9H$Dg=K,+>=63Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p,To$)%15[?@<Q3LBOPpi@ru:&
4ZX]5BQ&);D09?%+EqaBA0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-@r!G$$=n't@VfUpCisfADJ*m+
A3Dsr.lne<+=fJ^$=RdjATD="F?MZ--8#`7GA^i+ATL!q+?MV3@W-1$@W-N7Ao)BoFDYS38SDOU
AOC->Ea`I"ATAo(DfoN*AT2I.F*2A5Df9//@;TspEb'*1-OgDH0RInYE,9H&+E2IF+Eq^3D.Rbt
$9g.jF>,j=+>=om0Hb">F<GdF@;TRs%13OO:-pQUARoLs+EqaEA0<:<@;TR,@r,RpF"DEEG]YAW
FCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl4"u#*DIIBnF!+[0ARloF0me!r
%13OO:-pQUBl8!'Ec`FGATMs7+CT.u+CT.u+DkOsEc6".$9g.j0d(FXF<DrQATMs%CiF&r0JFk9
-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JOq:-Vcu\+DG_2De!^.F!,R9
G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JY";-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j1a$a[F<DrJ
@:O=r@;Kmr@5'A_4#/NP-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'D`4#/NP-SZ_o+>G5Q
$4R>+0RImr4ZX]?+D58-+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8@;Kmr@5'&<$4R>;67sBlA8--.
FCfN8-uNI1ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd+[/KcDl4"u#'
DIIBnF!+[0ARloF0me!s%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs4ZX^6/g)tnA8Z3+-Z*:%Ec5B&
E+iZ6-OgCl$;No?+D#(tF<GF/@rcK1-uNI1ALq>0A7[<6AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/
+=CZ4ARfKuARoLsDfQsV+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(1(=R"$4R>+0RGSuDe't<FCfN8
C2[W:-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?YjXhA5d>`CLqU!F*'*267sa(Ddd0TD/X3$
FCfN80H_K[/M/(fCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:,1@VTIaFE8QIBl8$2$;No?+=M>C
F*)/8A2#Gb$;No?$;No?+B3#gF!,R9F*&OG@rc:&F<G:=+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%
FD,6++EV19F<GX7EbTK7F"Rep67sBPF<GX<Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/
@ps1b+D>>(@q?csF<D]B@:O(o+EV:.$;No?+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O
$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K
+=D8BF*)/8A2#AR>9G^EDe't<-OL2U67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Esb60:J=&R:JEN+
3Zp*`6;LBN5u^WS0g.Q?0a^6C:J=GR;cGn@+?qJ$0eb:+1($?D:J=_R6;0g23ZpX>+>k8r1E[qc
1("@[:/jMY:JEN+3Zp-a8PW5a5se764ZX]M/g*"o1F+\/0FA.V9M[rR9M&/^4ZX]E2_I*N+=/-p
/g)r(0I&>/$49-k5uLBJ;cGn@+=B`'@;R-2BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<
$49^79iODF4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$:7Nj
;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5
DfTB0$9g.jFDYu5Ddso/F`\`M/gkOQ?U6tDF)>i2AN;b2?Qa&81a`V;:-pQU@3BZ'F*%aQ0RGMs
E-67F-Za-CCLo2!ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/
4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN5u^WS0H`\X:J=&R:JEPd6;LBN<'`iE74/F+0RIGQ
E$-NBDKKr:Deio<-T`G43[[Ko<'aJZ9e[\]:/k1Y6;0fq$49Np/g,4RD.Oi,@:O=rEsb)b>;RIA
F`\`RF)>i2AM?he@rcKA-Ta(<4""_p+>P`#$9g.J1a$a[F<DrPD/X3$0MPtcEc3Z[4#/NP-Vcu\
+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)
A8,OqBl@ltEd8dGE+NnoCi<`m;f-GgATVL)F>6NW/h1[U@:W;RDeip+ATMrJ+ET1e+<YK=@:UKh
+EMC.Cht5(Des6$@ruF'DBNk0+<YT3C1UmsF!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU
<+oue+<Yc;F*&NIF(96)E-*3FCh[Zr+=M&E@:W;RDeip+ATMrI.3KaIF!)TIH#RJ-@;Kb*+<Y]I
D@0-*/g+kGF(o/r+E)@8ATAo8ATMr9+EM%5BlJ08/g*`-+EM47F_kS2DJsV>+CT).ATAo8BOr;/
Ecl8;Bl7Pj:-pQUCi<flCh4`&ASu!h+DGp?CggghF!,R<AKZ,:F^])/FCfN8+EM+9F`8I3DIal3
ARTU%A8c[0/db??/db??/g+SDF*2>2F#jY'67rU?67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(
Gm[;5/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f<B^B.u4N:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.;:4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT6.:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJATJ2f
Df9GX<)64B4ZX]>$=[plCdD#r9eedl+>F44Df9Gc8Q/SO3ZpX>+>GQ(,;KU8Df9Gk5se764ZX]M
/g*"o0f'pt+>O92Bl8#Y<)64B4ZX]?$>FC"<'`iE76N[S5;"'9+>Y8t0JEh@Ao)BoFA,8)<'<8b
2`E?L3?TUj5;"'70JF_,1C=J!BOPpT8Q/SO3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPeA8`T7
BOQ!*8K_P^-OL3%H#6MH69R@P1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/
Bl7K0$4:6\GZ.RA7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^.4dS[=\Vj]64+&p67sC%FDl22
+Dbt+@;KKtGAhM4Esb)bHZX+DCi<f+E-67F+tb6\CgTIo6$$m]CLoLd3F<nC/i4p_$;No?+EMI<
AKZ)+F*)I14tq=<+E2IF+=D5IDeio=<+U,m0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.DZ0RGMs
E-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/
4tq=rEc<-K@W-1$F)>i2AMGPo+?MV3@W-1$5u^WS0HahCDeq^=:JEPd@W-1$<'`iE74/F+0RIGQ
E$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](DKJiD6;0fq$49Np/g+RFF*22=AI:UTHSZdWEc<-K
F*22=ATM^,CLo4J4!6UG-Za-CCLo5"ATMrI+EMC<CLo5"ATMrJ-OL2U67sC%Df'&.D.-ppDfZ7L
0O$@VE-67F-Za-CCLo4p@:O=r0IJq;0fpas/g)o*-ON$k>;RIAF`\`RF)>i2AMHnf@rcKB-Ta(<
4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#Gp%0I@:Nk$+A!\aD'370Ch[?iEa`c--OL2U67sBs
ARTan+Co1rFD5Z2@<-W9DfB9*F`:l"FCf3*A7TCqFE2))F`_>9DGEMN.Wo]@@<?'qDe*BmF*)G:
@Wcd,Df-\=/M/)fE+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2/e&._67sAi$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB73,N)L1,pCsASl@/ARlotDKBo.Cht5'@<?Q5@;]TuF(96)E--.D/Kf+KD/a<*
Anbgt+A+pn+DkP$DKKH-@;]Rd%15is/g)i-F(K;G1a$4;A7]9oBPDO0DfU+UFEhmMFDi:4BleB:
Bju4,ARloqBl%@%%15is/g)l'An>F+1a$:HBl8!'Ec`EOBkhQs-Qli.A7]:&C2[W8E+EQ'Eb0*+
G%G2,Ao_g,+F7a@%15is/g)8Z+<VdL+<Y<8DeElt04Sp2AT2HsGT^O2Eb/a&DfU+GF`:l"FCcS8
ASl@/ARl5W:-pQU0em9O@PKeaC2[X%A7dH9G]Y'=Bl[cpFDl2F+E2.*@qB=lCh.*t+CSekARl5W
:-pQU0emNRGqh9$C2[WnDdtG:Bl8'<DJsW.F"VQZF<G"&A7]9\$;No?+>GWdF`&rg+=M;BFD>5p
A8c@)@<?1(.3N&0A7]9oAoD]4GA1qG+Dbb0Fa,G[D.-osE+*j%%15is/g)l(C3=DL1*C"9A7]9o
-uEC&DJsW.F'hmK<%/q!$;No?+>GWdF`&rl+D,P4@qfgn+Dbb0AKYQ%A9/kAFDjc#%15is/g)l(
C3=>H2]uUKE-WR:BleA=H>.=@FDi:4Ec5o+Dg3C:DerrqEX`@N67sB81hq/N1,U1pASl@/AKYN(
DfB0(GT^U:Ch.*t+Cf>/Gmt*U67sB82/QcB0fC.pASl@/AKZ;2Bl%@%+>"^JBl%@%+EVNE/hSb0
C2[WnATf_8Ch[Hu06;5DFCd*X/hS8WBl[cpFDl26ATJ:f:-pQU0f<]gCb[diEb0*+G%DdEC2[Ws
DId='?V"-j9IV*#@<-!l+E(_1Des!,AKYo#C1Ums%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ASbpdF(HJ)Bk)7!Df0!(Bk;>p$=e4!E]lH+A8,Qs
0F\@Q0RGSuDe't<-OgDH0RI_K+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,
Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K
@WcC$A86$n-OgCl$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU8l%htF*(i'Bl7Q+A8-'q
@ruX0Gp%6IA7]d(E-67FA8,OqBl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6rR&N7n#g;;E[&`
C2dU'BQIa(+=JEd-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^
DdmH1/15L\@:s.)C2[W9-OgCl$;No?+EM%5BlJ08/0Jb;@WNZ#DIal!@<?Q"$?L#H3Zoe`BleB7
Ed;D<A0>T(F*(i,Chdm!+ED%7ATV[*A0>W*A8kstD0$h7De*g-De<^"AKYhuDJ<]oF*)/8A0>\s
@V'dmD/a<&0JG4(C2[WsDKKo;+DPh*A9Da.-OgE(Ccsg%F)3BT+A?3Q7!3?c+DPh*@V'V&+DG_7
FCB!%C2[Wl@<<W4ATMF)C2[Wl@<<W,De*g-C2G).De+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[
/12QTDe*ftAm\M><$6!kDKU2ADffQ3?W:-,+DkOsDJsW.F'hmK<$r+^%17,c+Bos9Eap5,De*p!
E[O"2+>b3RATT&9C^g^\$;No?+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!
EX`?b$;No?+EDUB+A+pn+DkP)BkCptF:AR*-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;
67sC'E+EC!AKYT!Ch7Ys$8=RjFDjboC2[X%@<-4+.3K`U+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21
De*fqEc#kMBkh]:%14dO.!0B"+DPh*E,ol/Bl%?0+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X%
Ec5Q(Ch555C3(a3$8=RjFDjboBPDO0DfU,<De(:>+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj2/BleB7
Ed99ZG]Y;B$8=RjFDjboC2[X%Ec5Q(Ch5%<+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@
A8lR-Anc'm@UX%)Bkh]:%14dO.!0B"+DPh*E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)e
C2[Wl@;@N2De*fqEc#l,@;@K0C3(a3$8=RjFDjboC2[X*F(KB%Df00$B4>:b.3KaFGB.D>AKXT@
6rR&N7n#g;;Cj21De*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3(a3$8=RjFDjboD..<rAn?%*C2[W3
+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj24@;]dkATMrGBkh]:%14dO.!0B"+DbIqAU%X#E,9)>0JP"!
Ap890FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TF!hD(0K^b*Db;-G@:DWI
D/^pH+<VdL+<Y9?EbTW,+A,Et;cH%Q779^F/151NA8G[`F"_?<@UsUuE%Yj>F!hD(0K^b*Db;-e
De*R"FE2:K+<VdL+<Y9?EbTW,+A,Et;cH%Q779^F/151NA8G[`F"_9HA8,q'Ec3REC31g4$8=Rj
FDjboC2[WnF_u(H+<VdL+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*C$D/_+AC31g4
$8=RjFDjboC2[WlATMrB+<VdL+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*<gF*'$K
C31g4$4R>;67sBlG%GQ5F^]*&Gp$O5DffZ(EZf=ADe`inF<GF/DII0hEZf1,@N]l/Cht5'AKYDl
A7]9o%13OO:-pQUF*)>@AKYZ.D/:>/DId='+>"^SFD,6++E).6Bl7K)Anc'mF!+n$@qB_&ARlp,
Bji,uDKKH1DImo4Ch[d&Et&IO67sB74=G;i8g%keA8,plAU%QQ<)$%8+D,h<Blmo/8l%iR<'a#C
6qL9--YdR1A8bs2BQS*-A8bs2C2[WsDId='/nf?DCaTZ!%15is/g,4WDfTD3C2[X%A7dH9G]Y'I
Cgggb+D>\0A7]d(AoD]4C2[W8E+EQ'/KeJF@;0Od@VfTuDf0B*DIj7a0K^b*Db;-eDe*ftAm\M>
<%/r%GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kVe3An5gi05>E9E+EQ5FEhmT%13OO:-pQUF*)>@
AKYf'DKU1WD.-osF)Y]#BkD'h+Du+>ATJ:f0K^b*Db;-gBl8'<DJsW.F'hmK<%/r%GB.D>AKXT@
6rR&N7n#g;;Cj21De*Bs@kVY4DKU2ADffQ3/p)>[-OgD:4=G;i8g%tZ@r?4,ATM3X=B$^l+<Y9?
EbTW,+A,Et;cH%Q779^F/151NA7TUg05Y--DJsW.F"VQZF=.M)%15is/g,1GDfB9*%159QHSZd_
A0<6I%159QHZ*F;I4f#PEcMTr%17/nDfp/@F`\`RC2[W*F*(i'AKYMtEb/a&DfU+GF`:l"FCeu1
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&         ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c-=6+>P&o0H`,/+>GVo1-$I31*AA0+>GPm0fC./0H`)/+?:Q%1E\G-+>Yf_DJW6gDeio<0IUCJ
CagK8EbBN3ASuT4F)>i2AKZ)+F*)J5Df'H.;f-GgAM>f[ATMr9-t@14E,$gEDIIBn+E(_$F`V&$
FD5Z2@rH4'C/\tfCLo1S-t@14E,$gEG%#3$A0><$B6A'&DKI"BD/X3$+EV19FE:u,A5d>`CLo1R
-tI%&.3N\KDeio,FCfN8A8Z3^D/X3$0JFncDJUaEF)>i2AKZ)+F*)J7A5d>`CLo1RF)>i2AKZ)+
F*)IGDe:+?ARm54-uNI1ALq%qCghC+>qC)/G]YAWFCAWpAKYPpBln',B6A0(@<?'qDe*BmF*)G:
@Wcd,Df0]:A79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:Bju4,Bl@k                         ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*AJ51bg+.0H`+n2DmHR+>GSn1*A>+3&;[30H`+n0fCaB0H`)++>P&p1Ggg/
0fL41+?2>;+>Get1*AJ11a"M-+>P&o1cIE;0f^@3+>l,4+>Get1*A;.1G_X!6pamF9LMEC;cHOj
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
+@1-_+>PW*2'=S53\WEP2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-F_;gP0JPF-0fD'K3BAlQ$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP
3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql
+@1-_+>PW*2'=V-3]&iX0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-0ek^E1cdKQ$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU2BY;.B-8r`0f:(.2EE]O
3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql
+@1-_+>PW*2'=V53\rNP0fB@G$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS0fU9u6t(1K3Zp@(6$6f_1,(F?+>>c91,CsG1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+?(E/F_;gP0JPF-1,1gH1HI9M$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp13+<X'\FCdKU3?UV1B-8r`0f:(.0KLsE
3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KLsL3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0es(C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0K;*M3BAlM
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.2+@1-_
+>PW*2'=S53\`EO1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmL+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)
6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%8l%iS:JXY_6<-TN6qBmJ
<)6Cp1,Vfn/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52
@<?'A+>b35F_i0U0JPF-0JGOB1HI9F%13FL:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2)l^$6t(1K3Zp='8p+qm1,(F?+>GT31,M$I2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2)ud%6t(1K3Zp.7+A-cm+>PW*2'=S5
3]/cU1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tnr
+@KX[ANCqg2'>M6C`kJe0f:(-3BB#U3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp=8+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEN$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1*@]-@<?'A+>Get8p+qm1,(F?
+>GQ22)mWO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2DZHu6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>u&!+@KX[ANCqg2]t_8C`kJe0f:(.1-.6H3\iW$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=<+<X'\FCdKU0fL4IF_i0U
0JPF-0f1pH1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=$2BX,1@<?'A+>Get8p+qm1,(F?+>Gf90JPUC2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E)a$6t(1K3Zp14+A-cm+>PW*2'=V.3\WKR1,91D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u2%+@KX[ANCqh0d')2
C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp=@+<X'\FCdKU1,C%FF_i0U0JPF-0ebXG1HI<P$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0H_K+@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!"
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_cEt6t(1K3Zp16
+A-cm+>PW*2'=V.3\iKP1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+?)%u+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&i($49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@;+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K0KM!L
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1a!o/@<?'A
+>Pbr8p+qm1,(F?+>G`71c[TS1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2`2^#6t(1K3Zp1;+A-cm+>PW*2'=V23]&fW0Jj+D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)2$+@KX[ANCqh3$:h9C`kJe0f:(.2**TL
3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@?+<X'\
FCdKU1-$ILF_i0U0JPF-0ebXB1-.0L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=%3$9>3@<?'A+>Pr"8p+qm1,(F?+>GQ22)mWP2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Y-+F_;gP0JPF-0K;*L
1HI<O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1E\u+B-8r`0f:(-3BAlR3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_+>PW*2'=V-3\iTS1G]@F$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp4$6$6f_1,(F?+>GT30f_9N
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Y-+F_;gP0JPF-0ek^F1-.*F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU1E\u+B-8r`0f:(.0fh-K3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqi+@1-_+>PW*2'=V23\WBO2)GXI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp4$
6$6f_1,(F?+>Gc81bq*G3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>b3,F_;gP0JPF-0KD0J2**TN$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>k9-F_;gP0JPF-0fD'J2``cR$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-
F_;gP0JPF-0fD'K3BAlR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>t?.F_;gP0JPF-0KD0J2EEQI$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>t?.F_;gP0JPF-0ebXF3BAlO$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>t?.
F_;gP0JPF-0ek^D2**KN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-0ek^E1cdKR$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>t?.F_;gP0JPF-0fD'M1HI6E$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>t?.
F_;gP0JPF-0fV3M1-.-K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P<t3$9>3@<?'A+?(E/F_;gP0JPF-0K;*K1HI6J$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+?(E/F_;gP0JPF-1,1gH1HI9O$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+?:Q1
F_;gP0JPF-0ebXD1-.9L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P<u0d%T,@<?'A+?:Q1F_;gP0JPF-0ebXG1-.-G$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0H`Z(B-8r`0f:(-3'&lV3\`Dt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.2+@1-_
+>PW*2'=S53\`EO1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2BX,/F_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*2'=V-3\iBM1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GSn6$6f_1,(F?+>>c91cIHN3!s,;Bl%<p
De*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08
+<YB9+<YE;A7oUu$;No?+Co2,ARfh#Ed98E:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g)8ZEb065
Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%h^:-pQU+<WH_De't<-QjNS+<VdL+<VdL
+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ2R67sB'+E(d54$"a(De*BiFs(O<
A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:(c0/db??
/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*
Bk(k!+DEKI.1/g:/db??/g+SDF*2>2F#jY'67rU?67sBUD]iV3Ec5t@@q]F`CM@[!/db??/g+&'
EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AI;1!/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?
+CfG'@<?'k3Zp130emEcDD3gQ:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB80ktiK0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3
C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`CG'=9EsbZ//g)l+@;p6@1*CUKD/XT/A0?21Bl%@%
+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu$4:9]@s)g4ASuT4-XpM*AL@gp
De!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5
@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0
ASrW*De'u$Bk)7!Df0!(Bk;>mDf9PW3Zri'+Co1s+>=.@A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA1&`3$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=
$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OOU,A9MO)F(oQ14ZX]:4tq=U:IJ5X6ja8r67sBh
Ch[Hu+DPh*Bkh]3A8-'q@ruX0Gm[/>6q9gJ8l%iH8lJPP<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$
6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VQ6B:II]E<(]qS8P2oX5u^B<3Zr0V@<?1(
AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U$49Np/g+e<DImisFCcS)Df'?&DKKH#
+A,Et+Cf4rF)rIF@rc:&FE7e(@r,RpF(KDU3ZpLF-YdR1+DPh*F*)>@AKY`+A7TUf+DPh*D..3k
+DPh*F`_>6+DPh*FDl)6F!,49A8c?5$>OKiAnc'mF$2Q,-p07-?SNuPD..3k-9`Pe@r,RpF(KD"
$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quE"C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)
HTE?*+DPh*Anc'mEs`7L67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08$7Bk(+EMR5-TsL5
1a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%@<-4++DPh*F`V,7@rH6sBkLm`CF9H;HS-Ks+EMR5.6T^7
HTE?*+EMR5$49Np/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%$:[T\78l?1+=Lu7CghC+ATJtF+F>^b
0d(OX@jrNO-8%J)4=;aqC3(a07S-9B;a!/a-p1*t6q9gJ8l%iH8lJPP<(JG\/1)u5+@\pr78jOI
4DJeFA79R&+<VdL+D,h<Blmo/4"u"N8PDQO$8=SWDe*p2DfTE"@<<W(GB.D>AKX&hHU^S#78jOI
4DJeFA8bpf@<<V7+D,h<Blmo/4#2.P8PDQO$8=SWDe*]nCLq$bF<D]<GB.D>AKX&jHU^S#78jOI
4DJeFF`_>6A79R&+D,h<Blmo/4#D:R8PDQO$8=SWDe*s.DesK*@<<W(GB.D>AKX&lHU^S#78jOI
4DJeFDf0)oF<D\K+D,h<Blmo/4#VFT8PDQO$8=SWDe*g-De<^"AKW+-GB.D>AKX&nHU^S#78jOI
4DJeFE+*d(F!)SJ+D,h<Blmo/4#hRV8PDQO$8=SWDe+!3ATD:!DJ!Tq@UX$p+D,h<Blmo/4#qXW
8PDQO$4:ikDfp/@F`\`R@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+E_X6@<?'k-OOp3Dfp/@F`\`u
:II]E<(]qS8P2oX5u^A^$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ2sA0>f/D]i7,1E^UH
-RT6.@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?OCI\F*)>@H"q8.
1,fXLB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]%14=),9SZm3A*<P+>"^*;FCs$%14=),9T!!3A*<O2BXRo6$6g_F*&NZ0J">%0JPEo$4R=b
.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$A0>f5F<G"5+CK5$EHPu9
ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL+<WB]E+rft+>k9[A0<6I
%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?+>GW40JkgI1^sd7+<VdL
+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo-9`Q#/g,(C-RU$@+>Y-Y
A0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29+<VdL+<VdL+<VdL+<VdZ
/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.DJW]'@UWb^F`8I@@;TQu
Ch[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!/e&-s$6Uf@DIn#7FCfN8
+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@
?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@
AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm
3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%
H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l
+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2
+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFt
DBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b
0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c
+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo
+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,
Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(
F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<
@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1
F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj
+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo
@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-
/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%
67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W
4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL
+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>
+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N
1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0
+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6
F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5
BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u
+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LG
DCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@
ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+
.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL
+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"c
ATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@
FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(
Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b
+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[
E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4
?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,
B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#
+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c
+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH
@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.i
Eb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'
@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4
D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:
BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(t
FD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`fr
FCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu
+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A
@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdk
ARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f
7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&
F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ
:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"
Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(
Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0
+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M
+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8
Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj
$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBn
ASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;
F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@o
A7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8r
FEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87
AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%
AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdk
ATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-
DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@
%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s
$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r
@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+
D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7
Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"p
DCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2
D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>
FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,Oq
Bl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s
+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)
+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'
De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_
C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%
+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU
<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9
C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>
%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&
FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL
-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#p
F)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6
@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'
+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=
Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8
Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0
/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2
Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!
A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1
Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2
F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@
+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+
/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA
$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$
DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&
Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/
Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#
+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,
+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*
D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1
Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4
?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;
:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV
?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL
+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-
+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%
BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7
Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D
-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+
@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVC
G%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,
-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT
+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:
A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf
@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2
%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7
$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k
@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL
+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd
/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8
Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm
/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g
+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/
E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;
1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D
:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(
CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0
+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8
De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?8
3\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2
F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@lt
Ed8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu
?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6
BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F
<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L
+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%
@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO
5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#
+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#
+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc
+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:D
ATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1r
FD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4
D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*
Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'
+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC
+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlom
Gp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#
+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9
F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79Rk
A1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTu
G%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33
A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%
+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u
@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAq
De(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*Nm
CiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56
%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9
@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4
+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+
G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)
@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+Cehr
Ci^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*k
Ed98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b
/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67F
A8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\
F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E
%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc
+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1r
FD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(
ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6
;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/
B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPt
AKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.
AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN
+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#
ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1
?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4
EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2
/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7
Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^
+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUp
ASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"
FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;
%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu
+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%
A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(
+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)
@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k
$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+
Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;
DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K
@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNE
FD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8
@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.
D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KD
DImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#
E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b
+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!
@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihH
BlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@
%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!
ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*
ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6
+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+
@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1
+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#
+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#
+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h
+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3
FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,
+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&
@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=
G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T
+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5
DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*
Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3
A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c
=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-
/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y
8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtB
AU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1
ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#
+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm
:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;s
Dg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3
@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI
6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!Q
E,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo
+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$Zl
BOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+
78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4
CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,
?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9o
FDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*
GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1
DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?
+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-
+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,
+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"
+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m
?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$
F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSB
DJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK
%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo
9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W
+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.
Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%ht
Bl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNE
D..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3
F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#
ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<
De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL%143e$6TcbBPDO0DfU,<
De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibp7/KdM\6k'J4$6pc?+>>E./ibmK+>"^%
F_>i<F<ERp+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(
+<V+#%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1
001OF3aa(@ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJX
F)tV<G%#30ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+
EZeq(BlnD*$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE
<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681
+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'
Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?
%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j
9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E.
/ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#
D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:g
B4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*
B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?
+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&
De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0
+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4
+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"
$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<
G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1
+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u
+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--o
Dg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm
3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&
A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@
:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'
@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4
Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&
+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj
/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)
+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g
+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#
+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.
DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(
AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26
ATKI5$6TcbD..3k6=FqL@nKNb<+U,mF##IF67sa)@;BF@@<6-m8l%iSATMs7+EK+d+DkP&AKXT@
6m,rIF(o,,FCfN8+EM%5BlJ/H%15is/e&._67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&
F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=7@<6-m%15is/g,7IF*)IU+B3#c+D58'ATD4$ARlo+
F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-F(HdCCi<flCh4`5
Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/e&._67r]S:-pQU<+ohc+EM7CAKW*<
De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gmt*U67sB/<(0_b
6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.%15is
/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6$;No?%15is/g+SD
F*2>2F#ja;:-pQU+<V+#:-pQU+<WBf+@.,[Df00$B6A6+A0=JeA8-'q@ruX0Gp%Q.:IJ/N;cF25
:-pQB$;No?+Eh=:@UX@mD)re]D]j1DAKYN%3XlEk67r]S:-pQU+<XEG/g+e<DImisFCcS9@rc:&
F:ARP67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<Y]A+=D#7CLoh@
F(o,V:IJ/nF*)IN%15is/g(T1:-pQU+<XEG/g,1WDBNY8%15is/g)8Z-nlf*1+=>.C2dU'BHS[O
8l%iS78m/=6=FqL@nKNb<+U,mF"V0AF!hD(:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130f<]gCbRjY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$>aWhA0<77
De*s$F*(u6-OgE"@;BFQD/X3$8l%iSATMs71,2Nj/h1^HCLpF]DeioV:IJ/nF*)IGF"JsdD..3k
+A,Et+EMC<CLnW1ATMr9F(96)E-*]>:-pQ?:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)
E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%htF)>i2AI;1!/g,7IF*)IU+B3#c+D58'ATD4$ARlo+
F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+ALSa<De!3lAKZ22
FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC$;No?$;No?+B3#c+<Y`>H=\3A+E(j7
+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U67sB/<(0_b6Vg]W
<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.$;No?+Du==
@V'R&De:,6ATMs7+DG^9FD,5.-u*[2F)>i2ATVL)FE8lRF*22=AM+<b67rU?67sBhF)uJ@ATKm>
:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k
3Zp130f<]gCbRjV:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$>aWhA0<77De*s$F*(u6-OO^!DJ<]o
F*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@lt
Ed9#A$<BSn;b9b[4ZXrE/ibOE3@>7C:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0A
Et&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(
F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)
Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2E+EQk
DdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da./no'B%16ig
A8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+AU%X#E,9)>
0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[\Z#0JO\b2D?m/C,[h$+DNki
0d(3j0JXbc3&!-2C,dn(-OgDN78QEJ6rQ60+>=p!+>=63A79Rg05>*5Ch7Ys$7QDk6q($A;Fs\a
8P`)E3Zp+!3Zp*c$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m68g&(nDeF*!D/F!)B-;;7
Deq$K8l%htBlbC+$=P'$DfTA2DfTQ'DKKH#+Cno&@:EYdAKYT'EZee,C`mhFE+O)5De:+a+E(_(
ARfh'/g*b^6m)pGF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJu
F!,RCDesJ;AoD]4%16Wa@s)X"DKKT1B-:W#A0>u*F*),6B-9eh@rGmh/g(T1%15]M2_He/0/tR<
GT]US6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0:$;bbWDfQtDATDj+Df0V=De:+a
+DkP&AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;"hPH#IgJBl8!6
@;Ka&8l%htBlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbds
ARlolA7TUr+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[
@s)X"DKK</Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\f
CM=o1@:s.m+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-
Df-aA/KdY]6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJ
A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0
GB7=<@Wcd7Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:
DfTD3Bl7O$Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A7;%16r\DJ<]oF*)/8A7TUg
F_t]-F>>RG67sBt@;]dkATMr9AoD]48l%iC:IA,V78?ek$:@*U<(Tk\4ZXr_:IH<nDe!p,ASuTu
FD5Z2-OgD`78d&U:JO&6+=Aiq3A*<O2(&h?:eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8
E+EPi$7QDk;FO8J5uU383Zoeb2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q($A
;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,
ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8
BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?83\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1
AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-
F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!
Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibp>%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&
Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16ig
A7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@
4ZXs*2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q'p@:./#D3Zp+!3Zp*c$>3pf
ATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKn
Ch\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+
D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P
+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0
@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!
A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=H
H#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:
A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;)F"/hhN'3%cn0+A,Et+ED%5F_Pl-F!,R<
AKWC3@<>p2C1_0rATK:C@:WneDD!&.EbTH4+:S[$ATDj+Df0V=De:+a+DkP&AKWC9Anc'mF"&5?
G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht
+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUr
F"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'
Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4
+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?
;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42
AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).
AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E9
05>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'
3XlE=+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM4K".1HU~>
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
9gM-E:K1In73GAm7TEAS5u^8q:I7NN;aWoI<$4t'7TEAS:e"P0<(0_b=[>bV78b7;B4Z0-@W$!)
@W$"'ARTUhBHUeuARfLnFECr#1E^1GD/aN,F)u(=@rc-hFCf3*A0>Dl@;BHtARlorATVg3F*(i-
E$/t0+Dbt)A9Vs4A9/l2Dfor6Eb024Ddmg"G]Y'HA0>i6FCB!%FE8RFD'3k@F=/Lg-p0UR/mg=U
-Qll9Cf>1hCLo1R+Cf>,E,&<gDeio<0HakDD/a5gD/X3$0JO\\Bk1.ZDeio<0HanDCf>1hCLo1R
+D#(^D/X3$0JFVcDdd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ+E_X6@<?'qDe*BmF*)G:@Wcd,
Df-pO/1<VC4"akp+=A:HDe'u*De*Bs@N]E(A8PajAKY`+A92j2Eb-A.De*s.DesJ;C2[X*FD5P=
.4cl04?G0&0d%hdC2[Wl@<6-mFCfN8F!,49A7KY&F(fZ,F*)IGC2[X!@<-!lFCfN8F!,49A92U+
CLqU!F*)IGC2[X(FE1r6F*(u7FE8fY/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R
<CokP84c`Z:Jt=<@WcC$A86$nBkh]3BPDO0DfU,<De'u(BleB7Ed;D<A7TUg+DkP&AO9gHBk'b2
6r[`=FE8RA@;BFQD/X3$8l%iSATMs7+DkP)BkCptFD>`)+DkP)BkCptFD>`)A8bt#D.RU,+DkP)
BkCptFD>`)F)Q2A@q@#:/1<V9+>Y_t1,(F?0K:aB/iGXE0JGFC2)ud70JPF=3&!-@1c@<K2_m'G
0d&5*0f:XD1,pmE2)R?Q2)[<P+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1aD/iGRI1-%3P1H?R5
0JPF=2_[!>2D[9I0f1jJ1*A>+0f:XD0JY7=1H.'D1cRBK+>PW*2)$sC1+kI@2_m-E1b^a/1,(F?
0K1[@/iGLE1,1XB2)cX50JPF=2_m?F2E*WU1b^mF1E\G,0f:XD0fL^@3&*BP2).$I+>PW*2)$sD
2_Hp@2E3HK1bpd.1,(F?0K1^F/i,IA3B8oM2_lL20JPF=2_m*?1H%'F3&WKJ2]sk00f:XD1,LUA
1,:RA2`WZS+>PW*2)%!D2D-gE2_[-I0fLp31,(F?0K:aB/i5@>0K1pN1bg+.0JPF=2_mBG1H.0O
1-%$H0d&5*0f:XD0fL^@3&NKP2DR9P+>PW*2)$sE1G1LC1,CdD1,Um21,(F?0K:aB/i5=@1H%$H
1-$I40JPF=2_m?F1H.!C1Gq0I1E\G,0f:XD0K(O?1c7'L1-%3H+>PW*2)$sD2_HpE2E<ZU0f:m4
1,(F?0K1aC/i5FA2DmKO1c6C20JPF=2_mBG1c7'G1Gh'L1*A>+0f:XD1,pmE2)d?J1,LpL+>PW*
2)%!D1G1IB2)[0G0fV091,(F?0K1[@/iGOB1c$pA2E2g70JPF=2_d6D2)7*N2Dm0J+>PW*2)$sD
2_HsC2`3BO1c7*41,(F?0K:aB/iGXE0JGFC2)ud70JPF=3&!-@2E3HL1H@3K3?U(20f:XD1,pmE
2)R?Q2)[<P+>PW*2)%!E0eP7?2DR9N0f([01,(F?0K1aD/iGRI1-%3P1H?R50JPF=3&*-?1H%-H
3ArTJ2'=Y.0f:XE0ek::2E!<N2DI!F+>PW*2)%!E0eP7?2D[$G1,V'71,(F?0K:dA/i,CD1-%<P
3?U(20f:XD1,pmE2`WiS0K:jE+>PW*2)$sD2_HmG0fV-M0fLs41,(F?0K1^F/i57?3&3<I1,0n,
0JPF=2_d6D1H7*L3A`EK1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*2)$sE3%d*H2D[9J2)I'21,(F?
0K:aE/iPI?1c@$B1H6L40JPF=3&!6C1cI9L1H@0E0d&5*0f:XD1-$sD2)[6E2Dd*C+>PW*2)$sD
2_HpA2E3TQ1-%371,(F?0K1aC/i5LB1GpsD2)HF20JPF=3&!-@1c$jC0f:dC2]sk00f:XD1-$sD
2)[9I0K:jF+>PW*2)$sC2D-gC2)@6J3AiN61,(F?0K1^F/i5FD3ArlP2)cX50JPF=2_m0A1c7'I
2*!KM2'=Y.0f:XD1-$sD2)[6M2`*HN+>PW*2)$sE3%d*H2`*<G1cIB:1,(F?0K:d@/i,ID1,UsH
2_cF10JPF=2_[!>2Dd3H1G^^C3$9t10f:XD1,1C<2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*=
/1<V9+?:]&0JPF=2`!0@2Dm<G3&EBH2]sk00f:XD0fL^A1GUsJ3B&iV+>PW*2)$sE0eP:?3&*3E
2`*?61,(F?0K1[G/i>F=3&NKI3B/-:0JPF=2_m'>2`3BI3B/oR2BXb/0f:XD1-$sD2`<KJ3B8iL
+>PW*2)%!D2D-jE1cREK3&WW:1,(F?0K:aE/iGUG2D@'H2)HF20JPF=2_d0B1bh!E2*!WN1E\G,
0f:XE0K1UC0K(aI2_[$H+>PW*2)$sD2_HpE2)[-G3B/i<1,(F?0K1aB/i5OB1H.0O0f1".0JPF=
2_[6E2)@'D1c[6D2BXb/0f:XD1,(=?0KD*I1,^gD+>PW*2)$sF0J5.>1bh!H2Dd651,(F?0K:aE
/iG^D0f(R@0fC.00JPF=3&!6C2E<HG2`EKM3?U(20f:XD0f:R?0f^pF3B/`L.4cl01*AJ#1,(F?
0K1[D/i5FE2E3TM1H6L40JPF=2_[-B1c7'E3ANTP0d&5*0f:XD0K(O?2Dd*B1b^[D+>PW*2)$sC
2D-gC2E!?F2_m<71,(F?0K1[D/i5IE0K(mH2)cX50JPF=2_[-B1c@9I3AE3H3$9t10f:XE0Jb=>
2`*9J1c.-O+>PW*2)%!D1G1L>2DR0G1H7-41,(F?0K1[D/i5IC0JPC<1,g=20JPF=3&!-@1c@<L
2D[9P2'=Y.0f:XD0K(O?2E!6I3&<EN+>PW*2)$sD2_HpA1H.'E1G^p</1<V9+>kE"0JPF=2_[6E
1c73H3&<?J2]sk00f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH3B9)B1,(F?0K1[G/i5FA
3AWNO2)HF20JPF=2_[6E1c7*F0KCgF1E\G,0f:XD1-$sF1H@-I0K1[D+>PW*2)$sC3A*-G1c-mA
3AWW;1,(F?0K1[G/i5FB0KCsM3B83;0JPF=2_mBG2D[9H1GU[@0d&5*0f:XD0KCaB2)I'B3A<?I
.4cl01*A;*,Vh&.2)$sC1+kI@2_m-E0KCj11,(F?0K1[@/iGLE1,:[B3B83;0JPF=2_m*?2E3EJ
1H.6O3?U(20f:XD0Jb=A3&icT1bgjD+>PW*2)$sC1G1[J2`<EG0JtU.1,(F?0K1^?/i5:B3B8uU
1c$700JPF=2_d!=1bgjD2D[-I3$9t10f:XD0JY7=1H.'D1c[NT+>PW*2)$sC1+kI@2_m*F0K1+0
0JPF=2_[!>2D[9I0f:X@1E\G,0f:XE0ek::2E!?F2)I0G+>PW*2)%!E0eP7?2D[$H0f(d31,(F?
0K1aA/iG[D3&iZO2'=Y.0f:XE0eb4;0KCjB1c[KR+>PW*2)%!E0J5.>2)I-K0K1+00JPF=2_d!=
1c$g@0Jk[E0d&5*0f:XD0eb4:0fCmC1Gh'K+>PW*2)%!E0eP7?2DR9N1,(I+1,(F?0K:dA/i,CD
1-%6J2DQC10JPF=3&*-?1H%-H3ArWK3@QL-4>838-p014/1<V7.4cl00I\P80E            ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
