NB. JOD dictionary dump: 16 Oct 2015 08:38:00
NB. Generated with JOD version; 0.9.99; 6; 5 Oct 2015 14:12:09
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

JODTOOLSVMD=:'0.9.99';6;'5 Oct 2015 14:12:10'

JODVMD=:'0.9.99';6;'5 Oct 2015 14:12:09'

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
BAK,(":y),(;x{JDFILES),IJF
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

NB. insure dictionaries are open
if. badrc msg=. checkopen__ST 0 do. msg return. end.

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
3AM^30d&4o0ea_)0fM'G+>GVo1,(O?+>GVo1,h-J+>GPm0ekF=+>GPm1,LaD+?:Q!2_d!/0f^@2
0K1m40f1"-0fD$70f1"-1GLR+0f:(.0f_$41,0n-0f^stDJW6gDeio<0MXqe.Um:3;f-GgAM>e\
F=f'e-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is
/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#AmC2dU'
BHS[O8l%iS78m/=FCfN8C2[W:-OgDX67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JPG"F_iig%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+Bosu
De3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)
A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN8
0Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<
.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc
;cFl<<'aD]I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j5U[k++?hhO-p8n)-RU8j.1HUn
$;No?+D58'ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%13OO
:-pQUF(8m'4ZX]L3b^2h1E[f867sC%ARTUhBHV;;@;KXiBk;=+%15is/g+nH@m)jq+<Ve@/g)tn
+AP6U+A*c#DfTA2DIIBn+Cf4rF)qct%15is/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE7lu:-pQU
+<VdqCh[EkA0<!;6tp.QBl@ltEd:#jA7]g)+<VdL+<VdpBk)7!Df0!(GscL\ATLd]@<,jk+<VdL
+<Ve.DfTAeARTUhBM)$.D.Q(N@<6K4+<VdL+<VdL+AH9SEc4lf@<,jk9jqOPDfg8DAISuA67sBs
@<-!D3Zoh5BeD(g+=nW`4<cI%:I7ZB6W?fJ?X[\fA7$c./0H>lHRMZV8ju*H:.&AsC2[Wi.6DT\
BQ5ID/0H>lHRLFH:JsSf@;9^k?R\'X@q]jDBeCMb.3L/a-nK]n/58Dt;GUY.C2[Wi.6DT\BQ6+.
5snOG<*<$d?X[\fA7$bp$4R>;67sC(@;KXg+ED1/BQP@FGpskEEbBN3ASuT4E+*j1ATD[0%15is
/g)8Z+D#D/FEnuO@UWb^F`:i.F<D\K@;KaoDIR$aCNXS=+DkP/@q]mo@qBP"+<VeD@<?!mBl7Bg
@r$4+%15is/g,1CEb@Nr+=ANZ+?L\g-S?bh+<VdL+<W`g-SAnIF`):K+?L\g+=D&8D.P(;+<VdL
+?L\nDIIBn/n8gBDKI68$4R>;67sBmDfT]'FE8R5Cht5;@;KXg+=L]:CagK8EbBN3ASuT4E+*j1
ATD[0%15is/g)N:67sB.+=n]k+<W`i0d%Z$-8%J)0d&.m1*Cof0d%T&+=K?"+C]5)+=AT\/0IVI
+>Fui+F>4Z4D\GHB.4rS+?XXdDffP;/j:Cu@<,ui$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<
-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4
>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBl
Eaa$#+CT/5+C\bhCNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD
+>G!LBlY=_5tbQl6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2
D]iLt@r$4+F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)
+=Act-OgCl$;No?+CfG'@<?''FD,]+AKYGj@r$4+Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!Zm
FD5Z2+>"^ID/aTB%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EM+(Df0).DdmHm@rri'Des6$
@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6lA0<7AATMs.
De(OL%143e$;No?+EV:2Eb$;2@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+
Ci<`m;f-GgATVL)F>4434tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%Df'&.@UX=l@j#K'G%#3$
A0><$B6A'&DKKqB/KeVLE+NO$ARlopEcQ)=%16uaEZeh/C`k)X@4)KkDImi21a$7FC`k)X/MSU^
$>sEq+>P'KDJUFC/hSL\$>sEq+C]5)+>=63DImi2@W$!)4=;Kc$4R>;67sC%Df'&.@UX=l@j#Jr
ASuU(FD5<-+:SZ+@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-Qij*-nlcQDJUFC-Rg/i3Zp+!@W$!)
4#)(9+C]5)+=Ach+:SZ+0d'qCC`k)Q.3L3'+>G!JDJUFW0mbVt@W$!)-S?bh%14L=+C]5)+=ANc
+>#Vs1*C%DC`keoHSQ^QDJUFC/ghbN$7I\Q@W$!)-RU>c/NP"1+C]5)+?M<)1E^.EC`k)X-Qij*
-o<&UDJUFC-Rg/i3Zp7%@W$!)4#)(=+C]5)+=Ach+:SYe$;No?+<Y-2C`k)X-OgDH0RI8HC`k)X
-Qij*1a"q(,@YP,-S?bU$4R>O@:X7uD*9p&-S?bh/0H,t+>GYp.j-#g+=K<+HX^l/+=Ach.3L2p
+=Ach%13OO:-pQUAn?'oBHUo-Df$U>DJsE(G\M5@ASuT4@UWb^F`8HT+D#S6DfQt3G]75(FCetl
$>sEq+C]5)+C\biDKTe*$>sEq+>=pIDJUG)@:X7uD%-hiATAnJ+C]5)+C\biDKTe*$>sEq+>P'K
DJUG)@:X7uD%-hiATAnL+C]5)+C\biDKTe*$>sEq+>b3MDJUG)@:X7uD%-g]$;No?+AH9^Gp%$;
+ED%1@;0UnDJ()6ATMs7+CfG+FD55nCi"A>A7]^kDIal.DBO%7AKYf-@:Wq[+E(_(ARfh'/e&._
67sBPAfu2/AKYf-@:UL%D/X3$+EV19F<GX7EbTK7F!+n3AKYJr@;]^hA0>;'Ci=D<De:,6BOu6r
+EV19FE7lu:-pQUD09oA+C\n)Eb0E.F(Jl7+:SYe$;No?+<Y-2C`k)Q%14LoDJUFC-Rg/i3ZqmL
C`k)Q%13OO:-pQU+C]5)+=AdODfor>-OgD2@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-OgCl$;No?
+<Y-2C`k*C@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq
.3L3'+C]5)+=BKO:J<,F$4R>;67sB'@W$!)-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4
<'`iE740N,/NP"`DJUFC8PW54/3>V6@W$!0/gh)8%15is/g)hj@W$!)-RT?1-nlcSDJUFC-Rg/i
3ZoP!+C]5)+=ANG$4R>;67sB7+C]5)+=Ach%14LmDJUFC/gi(j/NP".+C]5)+=Ach%13OO:-pQU
0HahBC`k)X@rHL-F=.M)-nlcSDJUFC-Rg/i3Zp+!@W$!)4#)(kDJUFC/gh)8%15is/g)hj@W$!)
-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP".
+C]5)+=BKO:J<,F$4R>;67sB7+C]5)+=D&8D.P>0Dfor>-OgD20fpaS:/jMY:JEMj4"!Tp<)c.M
9LU<X+>#Vs0HahBC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>G!JDJUFC-OgD20fpb(D/X3$0N;V)
F>,((-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k)Q%13OO:-pQU0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs0d'qCC`k)X-OgCl$;No?+>G!JDJUFC/n8gBDKI68$7IVj-Za-CCLo2!
ATMrI-Rg/i3Zp."@W$!)4#2.lDJU[Q-OgCl$;No?+>G!JDJUFCDIIBn-OgD20fpb(D/X3$0iV_*
F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-Za-CCLo4J%13OO:-pQU0d'qCC`k*C@;TR.@rHL-
F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFCF)>i2AM>J_4#2.lDJU[Q-OgCl$;No?+>P'K
DJUFC-OgD20fpalDf9H5D/X3$0IJq0@W-1$F)>i2AMGPo-Y[I?F)>i2AM>Jn-Y[I?F)>i2AMGP]
+>#Vs1*C%DC`k)Q%13OO:-pQU1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*C%DC`k)X-OgCl$;No?
+>P'KDJUFC/n8gBDKI68$7I;b0e"Y90I1'f.3L3'+>P'KDJUFW1OESKCaUh_%13OO:-pQU1*C%D
C`k*C@;TR'%14L<4""`[FE;;;CLo4J.3L3'+>P'KDJUFCBl8$6D/X3$0ddD;%15is/g)nl@W$!)
-Z3@0AM.J2F`):K%14L<4""KUDesK3Deio<-Rg/i3Zp1#@W$!)-Xq"4CaUbq14*JJC`k)X-OgCl
$;No?+>Y-LDJUFC-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.ECaUS>$4R>;67sB:+C]5)+=Ach
%14LmDJUFC/gi(j/NP"1+C]5)+=Ach%13OO:-pQU1E^.EC`k)X@rHL-F=.M)-o!e2F*22=ATM^,
CLo4J.3L3'+>Y-LDJUFW0mdAICaUh_%13OO:-pQU1E^.EC`k*C@;TR'%14L<4"#)lBlmp-D/X3$
0deCm/NP"1+C]5)+=D5Q-OgCl$;No?+>Y-LDJUFCDIIBn/n8gBDKI68$7I;b0e"Y90I1'f.3L3'
+>Y-LDJUFCF*/i]4#2.lDJU[Q-OgCl$;No?+>b3MDJUFC-OgD20fpb(D/X3$0MPtcEc3WZ4"#)d
Deio<9jqOPD_WV$-Za-CCLo4p@:O=r0IJq0F)>i2AMHnf@rcKB-Rg/i3Zp7%@W$!)-RT?1%15is
/g)tn@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%@W$!)-S?bU$4R>;67sB;+C]5)+=AdODfor>-OgDX
67sB;+C]5)+=D&8D.P(($;No?+>b3MDJUFCDIIBn/n8gBDKI68$;No?+>=om+C]5)+=ANG$4R>;
67sB7+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+C]5)+=Ach%13OO:-pQU0H`(m@W$!)-SAnI
F`):K%15is/g)hj0d'qCC`k*C@;TR'%15is/g)hj0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n
@W$!)-RT?1%15is/g)hj1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n@W$!)-S?bU$4R>;67sB7
+>P'KDJUFC/n8gBDKI68$;No?+>=on+C]5)+=D&8D.P(($;No?+>=on+C]5)+=D&8D.P>0Dfor>
-OgDX67sB7+>Y-LDJUFC-OgCl$;No?+>=oo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y-LDJUFC
/gh)8%15is/g)hj1E^.EC`k)X@rHL-F=.M):-pQU0H`.o@W$!)-Z3@0AL@oo:-pQU0H`.o@W$!)
-Z3@0AM.J2F`):K%15is/g)kk0d'qCC`k)Q%13OO:-pQU0d&1n@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp."0d'qCC`k)X-OgCl$;No?+>Fun+C]5)+=AdODfor>-OgDX67sB8+>G!JDJUFCDIIBn-OgDX
67sB8+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Fuo+C]5)+=ANG$4R>;67sB8+>P'KDJUFC/gh)8
-t7(1+=Ach.3L3'+>Fuo+C]5)+=Ach%13OO:-pQU0d&4o@W$!)-SAnIF`):K%15is/g)kk1*C%D
C`k*C@;TR'%15is/g)kk1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0d&7p@W$!)-RT?1%15is/g)kk
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0d&7p@W$!)-S?bU$4R>;67sB8+>Y-LDJUFC/n8gBDKI68
$;No?+>Fup+C]5)+=D&8D.P(($;No?+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>G!JDJUFC
-OgCl$;No?+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>G!JDJUFC/gh)8%15is/g)nl0d'qC
C`k)X@rHL-F=.M):-pQU1*A:o@W$!)-Z3@0AL@oo:-pQU1*A:o@W$!)-Z3@0AM.J2F`):K%15is
/g)nl1*C%DC`k)Q%13OO:-pQU1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#1*C%DC`k)X-OgCl
$;No?+>P&p+C]5)+=AdODfor>-OgDX67sB9+>P'KDJUFCDIIBn-OgDX67sB9+>P'KDJUFCDIIBn
/n8gBDKI68$;No?+>P&q+C]5)+=ANG$4R>;67sB9+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>P&q
+C]5)+=Ach%13OO:-pQU1*A@q@W$!)-SAnIF`):K%15is/g)nl1E^.EC`k*C@;TR'%15is/g)nl
1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1E\Cp@W$!)-RT?1%15is/g)qm0d'qCC`k)X-OgD2@W$!)
-S?bq+>#Vs1E\Cp@W$!)-S?bU$4R>;67sB:+>G!JDJUFC/n8gBDKI68$;No?+>Y,p+C]5)+=D&8
D.P(($;No?+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>P'KDJUFC-OgCl$;No?+>Y,q+C]5)
+=Ach%14LmDJUFC/gi(j/NP"1+>P'KDJUFC/gh)8%15is/g)qm1*C%DC`k)X@rHL-F=.M):-pQU
1E\Fq@W$!)-Z3@0AL@oo:-pQU1E\Fq@W$!)-Z3@0AM.J2F`):K%15is/g)qm1E^.EC`k)Q%13OO
:-pQU1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1E^.EC`k)X-OgCl$;No?+>Y,r+C]5)+=AdO
Dfor>-OgDX67sB:+>Y-LDJUFCDIIBn-OgDX67sB:+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q
+C]5)+=ANG$4R>;67sB;+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+C]5)+=Ach%13OO:-pQU
1a"Lq@W$!)-SAnIF`):K%15is/g)tn0d'qCC`k*C@;TR'%15is/g)tn0d'qCC`k*C@;TR.@rHL-
F=.M):-pQU1a"Or@W$!)-RT?1%15is/g)tn1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or@W$!)
-S?bU$4R>;67sB;+>P'KDJUFC/n8gBDKI68$;No?+>b2r+C]5)+=D&8D.P(($;No?+>b2r+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y-LDJUFC-OgCl$;No?+>b2s+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y-LDJUFC/gh)8%15is/g)tn1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs@W$!)-Z3@0AL@oo
:-pQU1a"Rs@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&.m@W$!)-RT?1%15is/g)hj0d&.m@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&.m@W$!)-S?bU$4R>;67sB7+>Fum+C]5)+=AdODfor>-OgDX
67sB7+>Fum+C]5)+=D&8D.P(($;No?+>=om+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=om+>G!J
DJUFC-OgCl$;No?+>=om+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>G!JDJUFC/gh)8%15is
/g)hj0d&1n@W$!)-SAnIF`):K%15is/g)hj0d&1n@W$!)-Z3@0AL@oo:-pQU0H`(m0d'qCC`k*C
@;TR.@rHL-F=.M):-pQU0H`(m1*C%DC`k)Q%13OO:-pQU0H`(m1*C%DC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`(m1*C%DC`k)X-OgCl$;No?+>=om+>P'KDJUFC/n8gBDKI68$;No?+>=om+>P'KDJUFC
DIIBn-OgDX67sB7+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fup+C]5)+=ANG$4R>;67sB7
+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fup+C]5)+=Ach%13OO:-pQU0H`(m1E^.EC`k)X
@rHL-F=.M):-pQU0H`(m1E^.EC`k*C@;TR'%15is/g)hj0d&7p@W$!)-Z3@0AM.J2F`):K%15is
/g)hj1*A7n@W$!)-RT?1%15is/g)hj1*A7n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A7n@W$!)
-S?bU$4R>;67sB7+>P&n+C]5)+=AdODfor>-OgDX67sB7+>P&n+C]5)+=D&8D.P(($;No?+>=on
+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=on+>G!JDJUFC-OgCl$;No?+>=on+>G!JDJUFC/gh)8
-t7(1+=Ach.3L3'+>=on+>G!JDJUFC/gh)8%15is/g)hj1*A:o@W$!)-SAnIF`):K%15is/g)hj
1*A:o@W$!)-Z3@0AL@oo:-pQU0H`+n0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1*C%DC`k)Q
%13OO:-pQU0H`+n1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1*C%DC`k)X-OgCl$;No?+>=on
+>P'KDJUFC/n8gBDKI68$;No?+>=on+>P'KDJUFCDIIBn-OgDX67sB7+>P&p+C]5)+=D&8D.P>0
Dfor>-OgDX67sB7+>P&q+C]5)+=ANG$4R>;67sB7+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>P&q+C]5)+=Ach%13OO:-pQU0H`+n1E^.EC`k)X@rHL-F=.M):-pQU0H`+n1E^.EC`k*C@;TR'
%15is/g)hj1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\@o@W$!)-RT?1%15is/g)hj1E\@o
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\@o@W$!)-S?bU$4R>;67sB7+>Y,o+C]5)+=AdODfor>
-OgDX67sB7+>Y,o+C]5)+=D&8D.P(($;No?+>=oo+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=oo
+>G!JDJUFC-OgCl$;No?+>=oo+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>G!JDJUFC/gh)8
%15is/g)hj1E\Cp@W$!)-SAnIF`):K%15is/g)hj1E\Cp@W$!)-Z3@0AL@oo:-pQU0H`.o0d'qC
C`k*C@;TR.@rHL-F=.M):-pQU0H`.o1*C%DC`k)Q%13OO:-pQU0H`.o1*C%DC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`.o1*C%DC`k)X-OgCl$;No?+>=oo+>P'KDJUFC/n8gBDKI68$;No?+>=oo+>P'K
DJUFCDIIBn-OgDX67sB7+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,r+C]5)+=ANG$4R>;
67sB7+>Y,r+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,r+C]5)+=Ach%13OO:-pQU0H`.o1E^.E
C`k)X@rHL-F=.M):-pQU0H`.o1E^.EC`k*C@;TR'%15is/g)hj1E\Ir@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&5++C]5)+=ANG$4R>;67sB;+>Fuo0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,0n\DJUFC/gh)8%15is/g)tn0d&5++C]5)+=AdODfor>-OgDX67sB;+>Fuo0d'qCC`k*C@;TR'
%15is/g)tn0d&5++C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1*C%DC`k)Q%13OO:-pQU1a"Lq
1,9t]DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P\p@W$!)-S?bU$4R>;67sB;+>Fuo1*C%DC`k)X
@rHL-F=.M):-pQU1a"Lq1,9t]DJUFCDIIBn-OgDX67sB;+>Fuo1*C%DC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,C%^DJUFC-OgCl$;No?+>b2q+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5-
+C]5)+=Ach%13OO:-pQU1a"Lq1,C%^DJUFC/n8gBDKI68$;No?+>b2q+>P_q@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-RT?1%15is/g)tn0d&5.
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1a$7FC`k)X-OgCl$;No?+>b2q+>Pbr@W$!)-SAnI
F`):K%15is/g)tn0d&5.+C]5)+=D&8D.P(($;No?+>b2q+>Pbr@W$!)-Z3@0AM.J2F`):K%15is
/g)tn0d&5/+C]5)+=ANG$4R>;67sB;+>Fuo2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,U1`
DJUFC/gh)8%15is/g)tn0d&5/+C]5)+=AdODfor>-OgDX67sB;+>Fuo2'?@GC`k*C@;TR'%15is
/g)tn0d&5/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2BZIHC`k)Q%13OO:-pQU1a"Lq1,^7a
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pht@W$!)-S?bU$4R>;67sB;+>Fuo2BZIHC`k)X@rHL-
F=.M):-pQU1a"Lq1,^7aDJUFCDIIBn-OgDX67sB;+>Fuo2BZIHC`k*C@;TR.@rHL-F=.M):-pQU
1a"Lq1,g=bDJUFC-OgCl$;No?+>b2q+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&51+C]5)
+=Ach%13OO:-pQU1a"Lq1,g=bDJUFC/n8gBDKI68$;No?+>b2q+>Pku@W$!)-Z3@0AL@oo:-pQU
1a"Lq1,g=bDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Po!@W$!)-RT?1%15is/g)tn0d&52+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo3$;[JC`k)X-OgCl$;No?+>b2q+>Po!@W$!)-SAnIF`):K
%15is/g)tn0d&52+C]5)+=D&8D.P(($;No?+>b2q+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>,+C]5)+=ANG$4R>;67sB;+>P&p0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,0n\DJUFC
/gh)8%15is/g)tn1*A>,+C]5)+=AdODfor>-OgDX67sB;+>P&p0d'qCC`k*C@;TR'%15is/g)tn
1*A>,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1*C%DC`k)Q%13OO:-pQU1a"Or1,9t]DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>P\p@W$!)-S?bU$4R>;67sB;+>P&p1*C%DC`k)X@rHL-F=.M)
:-pQU1a"Or1,9t]DJUFCDIIBn-OgDX67sB;+>P&p1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,C%^DJUFC-OgCl$;No?+>b2r+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>.+C]5)+=Ach
%13OO:-pQU1a"Or1,C%^DJUFC/n8gBDKI68$;No?+>b2r+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Or
1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-RT?1%15is/g)tn1*A>/+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>P&p1a$7FC`k)X-OgCl$;No?+>b2r+>Pbr@W$!)-SAnIF`):K%15is
/g)tn1*A>/+C]5)+=D&8D.P(($;No?+>b2r+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>0
+C]5)+=ANG$4R>;67sB;+>P&p2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,U1`DJUFC/gh)8
%15is/g)tn1*A>0+C]5)+=AdODfor>-OgDX67sB;+>P&p2'?@GC`k*C@;TR'%15is/g)tn1*A>0
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2BZIHC`k)Q%13OO:-pQU1a"Or1,^7aDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2r+>Pht@W$!)-S?bU$4R>;67sB;+>P&p2BZIHC`k)X@rHL-F=.M):-pQU
1a"Or1,^7aDJUFCDIIBn-OgDX67sB;+>P&p2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,g=b
DJUFC-OgCl$;No?+>b2r+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>2+C]5)+=Ach%13OO
:-pQU1a"Or1,g=bDJUFC/n8gBDKI68$;No?+>b2r+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Or1,g=b
DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Po!@W$!)-RT?1%15is/g)tn1*A>3+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P&p3$;[JC`k)X-OgCl$;No?+>b2r+>Po!@W$!)-SAnIF`):K%15is/g)tn
1*A>3+C]5)+=D&8D.P(($;No?+>b2r+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G-+C]5)
+=ANG$4R>;67sB;+>Y,q0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,0n\DJUFC/gh)8%15is
/g)tn1E\G-+C]5)+=AdODfor>-OgDX67sB;+>Y,q0d'qCC`k*C@;TR'%15is/g)tn1E\G-+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1*C%DC`k)Q%13OO:-pQU1a"Rs1,9t]DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>P\p@W$!)-S?bU$4R>;67sB;+>Y,q1*C%DC`k)X@rHL-F=.M):-pQU1a"Rs
1,9t]DJUFCDIIBn-OgDX67sB;+>Y,q1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,C%^DJUFC
-OgCl$;No?+>b2s+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G/+C]5)+=Ach%13OO:-pQU
1a"Rs1,C%^DJUFC/n8gBDKI68$;No?+>b2s+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Rs1,C%^DJUFC
DIIBn/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-RT?1%15is/g)tn1E\G0+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Y,q1a$7FC`k)X-OgCl$;No?+>b2s+>Pbr@W$!)-SAnIF`):K%15is/g)tn1E\G0
+C]5)+=D&8D.P(($;No?+>b2s+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G1+C]5)+=ANG
$4R>;67sB;+>Y,q2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,U1`DJUFC/gh)8%15is/g)tn
1E\G1+C]5)+=AdODfor>-OgDX67sB;+>Y,q2'?@GC`k*C@;TR'%15is/g)tn1E\G1+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Y,q2BZIHC`k)Q%13OO:-pQU1a"Rs1,^7aDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+>Pht@W$!)-S?bU$4R>;67sB;+>Y,q2BZIHC`k)X@rHL-F=.M):-pQU1a"Rs1,^7a
DJUFCDIIBn-OgDX67sB;+>Y,q2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,g=bDJUFC-OgCl
$;No?+>b2s+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G3+C]5)+=Ach%13OO:-pQU1a"Rs
1,g=bDJUFC/n8gBDKI68$;No?+>b2s+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Rs1,g=bDJUFCDIIBn
/n8gBDKI68$;No?+>b2s+>Po!@W$!)-RT?1%15is/g)tn1E\G4+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y,q3$;[JC`k)X-OgCl$;No?+>b2s+>Po!@W$!)-SAnIF`):K%15is/g)tn1E\G4+C]5)
+=D&8D.P(($;No?+>b2s+>Po!@W$!)-Z3@0AM.J2F`):K%13OO%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO-o!\)3]&9.4==THF(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?Xn"kE,&<gDeio<0MXqe.V!C6E,&<gDeio<0HbHh/Kf.HF*&NQ@rH4'C+19C@;TQuDdm=$
F(8X#Bl@lA%15is/e&._67sB^BOu'(FD,5.+EMXFBl7Q+-ndV14ZX].@;p0s@<-E3+DG^9+CQBb
+<YlHEb$:8-t@14E,$gEGA1l0%15is/g,(AAp&0)@<?''@;^?5+Dbt+@;I'(@;TRs/g*r!Ap&0)
@<?'k+DtV)ATJt:@V'1dDBL'GBln#2FD,4p$;No?+E2@4AncK4+=L#P7TEAS:e"P9+<Y*1A0<!;
ASu$$+EqOABHSF<@;]UoD'0s1@<6!&+AP3s76sUD83m[l:-pQUF*2),Bm=31+<Ve:Df0Z;Des6$
A0<"(Gp"4X:I7NN;aWoI<%0FB+<X3hB4tjs+<VeM@;L'tF!)TDAdo)B67sB/:I7NN;aWoI<%/r&
ASu("@<?''Ci=3(ATAo%DIal+ATMo8Ch[ZrCj@.FD]iP+@<6*)DIIBnF"Rn/:-pQB$;No?+Eh=:
@UX@mD)r+5:-pQB$;No?+<Vd].3N&?F*2>2F!,R9F*&O8Bk)7!Df0!(Gp"MWATMs.De(ON+D#e3
F*)I4$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC+
+EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2
-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc
;cFl<<'aD]I4Ym8%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<!B-OgCl$;No?+Cf(nEa`I"ATAo8
@:F%a+ED%4Eb0<'DKK</Bl@l3De:,,+EqaEA90:E@ps1i3ZoP[@r`\>G%G]'-OgDt@ra^n><3m4
4"akp+=JruHXSNU+=nX>3Zp:'3]/$B%13OO:-pQUA7]@eDIjr7DfTA2GA2/4+E(_$F`V&$FD5Z2
%17#_Ap&0)@<?'tAM?8.+>Y-$+>=63:-pQU-ndV14ZX^(@V0b(@psIj+Dbt+@;I'(@;TRs%14J!
De!3lF!,R<@<<W)ATT&=ASH0q-Ts()Gmt*mDfT3.Df90)/g,E^A8a(0$6UI-De!3lEt&I!+EqC2
Eb#Ud+<YA@4Y@j%Ci<flCi^$m+<YkN4Y@jk%16ZaA1e;u.1HUn$;No?+Dbt+@;I'*Cgh$q+DtV)
ATJ:fCi3ZuATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$
3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z<I+F`V&$FCf<#
0II;:%15is/g,1G@:UKi@:O'q@;]TuA7]@eDIjr7Bln#2Ddm=$F(8X#ARlp$@;TRs%14g4>9GUC
3\W6B+BosM0mdDKD/a54-Z<I+F`V&$FCf<#0II;:%15is/g+tK@ps0rDdm=$F(8X#ARlp$@;TRs
%17#k@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]CLoLd
3F=-C$4R=j,B%I.D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+E).+D.Rbt
$4R>`BQ%p5ASu?r0KhH>1E\_$0F\@:Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0
D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/
$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/
@WNY>F(fK4FCf?,AM@IW5s]R/DeioE3B:Fo%13OO:-pQUF*)>@AKY])+Co1rFD5Z2@<-W&$>"6#
FDYu5Ddso/F`\`RF(fK4FCf?,AM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7Jk$8EZ-+>=s"
0JG4(>9H!^HXgu2E,$LCF(fK4FCf?,AM>J@$4R>;67sBsDe!3l+EM47Ec`FA@;TRs%17/o@;TRs
4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$7I-?
DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&dDIIBnEt&Hc$4R>;67sB4
HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]R/DeioE3B:GVDf'H.;f-GgAM>i667s`tDf'H.;f-GgAM>h]F=f'e-t@14E,$gE
G%#3$A0><$B6A'&DKI"BD/X3$+EV19FE9&A:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3L$\
ATMs.De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$
ARmhE1,(C9F(K;E0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et+>>E./i5'c:-pQU
0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^ZuE
/g)8Z+<VdL+<Y*1A0>c$G9A;TD/X3$/7N%/Bk&]1@<-!l/9>oRATMoD@rc^5BIP'GATMs-DJ()4
AS5^oAI8cSDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OO@%Bl8!'
Ec`EOBkhQs-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$4:?b+E(d5-Zip@FD>`)0II27:-pQUBl8!'Ec`FF
Df'&.F*(i.A79Lh+EqaEA9/l8D]iP.D/aN,F)q[^Df02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X
3Zp4$3Zp*`$=[pl+?_>"Eb/ZqCjBi8DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to
+>=.@An?3u@qB_&Bm+'/FCB&t@<,n"+?_>"@W-/l$?TriFCB3$@<5sfD..'kDJ*C!DJsT<@;]Ua
Eb&U#@;Ka&4Y@jdDf6aJ+F+;$-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh
6r-lZ-QkQ)+C]8-$48.N9M[u@9N*'&=@5b^6q'Kk4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-VSGr
B22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@h*@j"tu-ZW]>FEhmT4ZX]qDf'H.+=Bj$DJ)^QD.RcS
Eb/-[@;Kb*87?OL<,Y`]E+LC(0d'[CF)>i<FDuAE+EVjM$4:ifDfTq_3Zp4$3Zp*`:-pQUDIIBn
F!+n-CiX)qA9f;9DIjr#BOPp(/KeqLF<G(,@;]^hA-ua./pReL4YC.c.NgJRH9Elh+=\LZ+=\LZ
$7Q;hATAo8D/a<0@j#`5F<DrPBQ%p5-OOm(+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.DM+Bot0
D/XQ=E-67FFEhm7$4:]\C1UmsEb/j(4ZX]A+?CW!$>Epc?XI_\C1Ums4Y@k&+AP6U+CoC5DJsV>
@rH4'Eb0<5+E(_(ARfh'$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4$4:<XEb/a&?[-g?
?Tg"aGp#jK/g+\C+Du+>+Cf>,E,oN2F!,:;@ps1bEsa?'$>"6#FDYu5Ddso/F`\`RDdmHm@rua&
Aof=,Eap4r+=D2>+EVjM-TsM#Df'H.+=D):C1UmsEb/j(-OMRN>9J!(Dfp/@F`\aJG]X9"B5DKq
@;KsqAog*r1E\_$0FDH/Ddm-kF!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5+F+;C$4:?b+EVI>
Ci<f+E-67F-YI76@UX(nAS-!2$?BW!>9G;6@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=,0d'[C
F)>i<FDuAE+EVjM$47,NARfObEb/d&@rH<tF$2Q,1a"h%0FA.^67sBkARfObEb/c(F(9--ATJu&
Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,od:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=
De!@"Es`7mG%G]7Bk1d<3bN8I@UX(o4ZX^1+<XEG/gr1u4Y@jqG%G]7Bk1ctB5DKq@;Kul$=[pl
4YCDdD`o^pDf7ck+>Fu]+<VdL:-pQU-n6Z/3ZqmMD]i_3D]j.?D[Hh`DfT3&@;TRs/g,E^A8a(-
+<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBpD/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT\
+<VdL-[0,EB4Z0-@rc^0@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.RbqASu$2
$4:HbD]gMPGmYu-$>"6#FDYu5Ddso/F`\`RA7]7e@<,piF(9--ATK4+Eap4r+=D2>+EVjM-TsL5
@rH4'C*4m7ARfObEb/d&@rH<tF!h;L+Bot0D/XQ=E-67FFEhm7$>jL%ARojlDfB9/4ZX]A+?CW!
$49Np/g+tK@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k$;No?+EqL1DBNA*Gp$s<G\(D.
F(9--ATJu&Eb-A(ATVKnFCeu*Df0B:$;No?+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2,/KcHSCi<d(
.3NYBE,Tc=EsbZ//g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEs`7jDe!3l4Y@k&$>aWj@;J(f
+>P&h+Dbt+@;H9"$4:?b+EVI>Ci<f+E-67F-Z*RBARojlDfB9/-OOm(+Bos9Eap56G]Y;r3ZqpN
D/a54-Z*RBARojlDfB9/-OMRN>9J!(Dfp/@F`\aJG]X9"@rH6sF`V,)F(9--ATL!q+>Y-$+>=-0
:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V$:-pQUCh[Zr+Cf>-
Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&/db??/g,7LBlbD2F!,R<AKZ&&
An?%*+EV:2DJ()6D]iS//g)99BOr;7B5DKqF"%Gk67sC(ATD6&A7]jo@ruc7@;]TuEb03.Ecc@F
@rH6sF`V,)+Co%nCgh?mFD5Z2F"Re,:-pQU@W-0-BlbD-ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k
+>"^KD]iY+B6A6+$4:6\D`r@g+<VdL+<VdL:-pQU-n6Z//g+VAD[L/rD`o^^Df6aJ+F,(P:-pQU
-n6Z/3ZqmMD[Ip#$>"6#FDYu5Ddso/F`\`R@rH6sF`V,)F(9--ATK4+Eap4r+=D2>+EVjM-TsL5
@rH4'C*4m6Df000F(Jm'@rH<tF!h;%:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.s
De!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8,RQD/X3$0JH6g/h1CG
A5d>`CLo1R+ET1e+=Lc7A18XBD/X3$+EV19F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?
+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3e
Ch4%_:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8
A2#PWFCfN8C2[W;/0K%GF*)/8A2,bh+EV19FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.
ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQaFtks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+
C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,VEc5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdL
Ecl7BBl5&.F`(t;Ci<flCh4%_%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-
$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;
5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUFD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6
Eag.>A8,R'+DGJ+DfTE1+DGpFF!+n3B6A'&DKKqP%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/>?
%13OO:-pQUDKTf*ATAo3AftVu@ruF'DIIR"ATJu4DBNn,FD)e6F`VXID..NrBFP;'+?^hl+FPjb
A8,Qs0F\?u$>"6#De'tP3[]#\F*)/8A2,3KATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe
+Co1s+>=63%16Ze+E]h.+>=pKBk/>?%14s84Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\
EX`?b$>"6#1E^UH+?MV3FCfN8C2[W:+EV19FD>`)0eb:/%16Ze+E]h.+Co1s+FYFe%14m64Wksl
0d(FL@r!30%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R
+ET1e+=Lc<CagKJD/X3$+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5
B6A'&DKI!D@psFiF!)TDAfr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;
G%#3$A0>AjF(KD8@<,p%@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(F?C3=>J0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9
@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBk
ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(
4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.
@ruF'DIIR2+DGm>Df-\>BOr<*@<?/l$8N_e+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/
FEn<&0H`M$,<d5)+F>4b+CoA++=ANG$8<Sc+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'M
DJUFC-OgD:+?^hl4s2R&HQY*eA8Z3+-RT?10H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0
F<GXCD.Oi5ATD7$%178r@;TRs4ZX]5@Wuj'0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp
$=\4"A2-5.+>"$0@Wuj'1-IZ@1E\_$-[6a`+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH
0RInYE,9H&+E2IF+?MW-DIIBnEt&Hc$;No?+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&N
Eb$jHDKg,30d(@XEb$pJDKg,31E^RZEb%!S%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu
-tt:V1*AA%4")g;5;=i@4"*'K+=/-p2'=Y"2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5
Ddso/F`\`f3c8hDD.Rbt$4R=O$7KG&C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f
-nlcSDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/
+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q
.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-N
DJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o
%14L;+>G!LDJUFC@Wui?.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;
+>P'MDJUFC1aa^p/NP"/+?L]-3[\fhEb%!S+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4G
C`k*90deCm/NP"/+?L]-3[\B\Eb$mIDKg,30de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pK
DJUFC-Ql/N/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q
%13OO-nlbu+>=pKDJUFC-Rg/i3Zp."4!6UGDJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%
Bm:aKDJsZ8F"%P*-nlbu+>=pKDJUFCDKg,31aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3
AS,Y$+=M,GF`)7L%14L;+>P&n+CoA++=D2?1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2
Bl7NsGT\DPDfor=.1HV40H`.o0HanDC`k*90deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4
+EM[;AncK4-uNsGDK@69$4R>[ATAnI+>b2p+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.
$>sEq+>=op+>Y-NDJUFCEb$O?+:SZqATAnI+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DAR
Df028%16uaEZd%Y0H`+nA8Z3+-XgXrBl5:-$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*
ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo
/NP"/+?L]-3[\B\Eb$sR+AP6U+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo
/NP"/+?L]-3[\B\Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm
/NP"/+?L]-3[\B\Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>
6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]R/DeioE3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WL
DIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7
+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19
FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o
:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OgCl$;No?+DG_7ATDl8-uX9?Ed)P<FCcmDGAhM4
F!,C5+Eh16BlA-8+EVmJATJ:f@W-1$@W-NT3Zp*c$>+*m@<??t4ZX]?3B&',+?pu)+>P&p+=&'g
2[p*cBOQ'q6YKnK@:OCjE]lH+-YRFB+Dl72BHVM;De'u7Dfol,+CQC:Df9//@q^!pCER,#F^o27
%16WaF^f/uE,9Z<F`(i1De)!l+=fJq5ThR<%16N\E+O'#Dfe-'+=8]M$?pArD.RcO3ZpLF-Xq"4
Cgq=.+D,G.@<??t+A$6TG%F$S@<,ddFCfJ8A8cU"Ch7R%F`V\CB5_^!+CT,+ATD="F=.M)4tq>*
D/a<0@j#`5F<GdF@;TRs%159QHZUr)3Zp+!0ea__ATT&=DIIBnEt&Hc$;No?+D#(tF<GdGEb$:@
DIIBn/7WL)F)rmSAU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4
GA^i+ATJtu+D#(+4#))(0F\?u$;No?+DG_7ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^
F`\`RFCfN8@;Kmr@5'A_4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`
4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[I
AU&;E%159QHScjaF`\`RD.-ppDddI$BONSK-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$
BONSL-Ta(<4!ua*.j-Po%13OO4tq>*0g.Q?0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)
BONSB%13OO:-pQUARoLs+EV19F=;$8D.P8?AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKu
ARoLsDfQsU+>"]`/3>P4FDbN(ATJtu+D#(+4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,
I4cX!+CoA++=D#7@rcKrCiF&r0II;:%15is/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@
@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(tFDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4
%13OO4tq=>+E(d5-Zip@FD>`)0II;:%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcdD/X3$
6$%*]B5TCW0MXqe.VER9@WPIbDeioMF)u&.DD3au+<VeK/M/(f+DG_(Bl[cpF<D]7F)u&.DJ`s&
F<D]EAfr3=B5DKq@;H9G67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>F`)7Q$;No?$;No?+@U<kDfQt2
Bldd&G%G]*A0>E*EbTE(+E_a:+E(j78l%i!+>>eu:LeJh1,(F?+>GW42)I?N0d&f$FD)"V67sBj
@<6"$+EM47F_kS2+ED%8F`M@B+Du*?+Dkh;ARlo+@<6L(B5VQtDKKqB+C]J8+<Yc>AKZ&*@rH6q
$;No?+D,%rCi_39:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?
De!lC3=8MJ/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$@rGjn@<6K4
FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I
$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=
5uL[1/IDh[67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DWDIdI%ARfgJF)u&.
DGP%23]%s?+>=-t67sB/9kAE[De).SB6A'&DKKqK4Y@j2$>+Eu@m)Fe-[K]RFC.sj@:rpp$7KM/
DIY+Y3ZqWL.j-Mg.Ni"(.1-DW67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0FB4&ATVU(A3k6KF_t]-FE8lo/g)hTAp&!$4Y@j)H>dqJ
?W2/WB4!"n-t[U>@jsQ%+Bos=+>=of+C,='$47,867sC$ATW'8DK?q1DfTl0@rri6ATN!1F:)T"
+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCF9Gr:-pQUEb03.Ecc@FATDg0DIma/F!,=6G\(D.
@<6L(B5VQtDKH4\67sC)Bl%T.FD,]5G9C=8F(KB6Bl@l3F`);8C`m>(G\(D./Kf.HF*)IGF(fK7
Ch+Z+@:opYEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M2$$;No?+>%q>78m/.;cQ1P
78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?YjXhA5d>`CLqU!F*'*267sa(Ddd0TD/X3$FCfN80H_K[/M/(fCi<`m+CQC6D..6s+Cf>+
Ch7*uBl@l3De:,1@VTIaFE8QIBl8$2$;No?+=M>CF*)/8A2#Gb$;No?$;No?+B3#gF!,R9F*&OG
@rc:&F<G:=+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%FD,6++EV19F<GX7EbTK7F"Rep67sBPF<GX<
Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o+EV:.$;No?
+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU
@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OL2U67sC)
DfTB0+E(j7G%#E*Dfp+DFEqh:Esb60:J=&R:JEN+3Zp*`6;LBN5u^WS0g.Q?0a^6C:J=GR;cGn@
+?qJ$0eb:+1($?D:J=_R6;0g23ZpX>+>k8r1E[qc1("@[:/jMY:JEN+3Zp-a8PW5a5se764ZX]M
/g*"o1F+\/0FA.V9M[rR9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/$49-k5uLBJ;cGn@+=B`'@;R-2
BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$49^79iODF4ZX]A+?)5%,Tq.h+=A:UAKYE%
AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR
8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.jFDYu5Ddso/F`\`M/gkOQ?U6tD
F)>i2AN;b2?Qa&81a`V;:-pQU@3BZ'F*%aQ0RGMsE-67F-Za-CCLo2!ATMrI-T`\1+?^i%+AP6U
+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN
5u^WS0H`\X:J=&R:JEPd6;LBN<'`iE74/F+0RIGQE$-NBDKKr:Deio<-T`G43[[Ko<'aJZ9e[\]
:/k1Y6;0fq$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AM?he@rcKA-Ta(<4""_p+>P`#
$9g.J1a$a[F<DrPD/X3$0MPtcEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1
@q@888K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dGE+NnoCi<`m;f-GgATVL)
F>6NW/h1[U@:W;RDeip+ATMrJ+ET1e+<YK=@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+<YT3C1Ums
F!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU<+oue+<Yc;F*&NIF(96)E-*3FCh[Zr+=M&E
@:W;RDeip+ATMrI.3KaIF!)TIH#RJ-@;Kb*+<Y]ID@0-*/g+kGF(o/r+E)@8ATAo8ATMr9+EM%5
BlJ08/g*`-+EM47F_kS2DJsV>+CT).ATAo8BOr;/Ecl8;Bl7Pj:-pQUCi<flCh4`&ASu!h+DGp?
CggghF!,R<AKZ,:F^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/db??/db??/g+SDF*2>2F#jY'
67rU?67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gm[;5/db??/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp$;No?+CfG'@<?'k3Zp130f<B^B.u4N:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:4tq>%A0<7AATMs.De(OL+BosE+E(d5
-RT6.:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJATJ2fDf9GX<)64B4ZX]>$=[plCdD#r9eedl+>F44
Df9Gc8Q/SO3ZpX>+>GQ(,;KU8Df9Gk5se764ZX]M/g*"o0f'pt+>O92Bl8#Y<)64B4ZX]?$>FC"
<'`iE76N[S5;"'9+>Y8t0JEh@Ao)BoFA,8)<'<8b2`E?L3?TUj5;"'70JF_,1C=J!BOPpT8Q/SO
3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OL3%H#6MH69R@P1E\V8+=&(N
3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0$4:6\GZ.RA7RfO%+=K?=:JXYX8Q/S;
/1<VM9M[rR9M&/^.4dS[=\Vj]64+&p67sC%FDl22+Dbt+@;KKtGAhM4Esb)bHZX+DCi<f+E-67F
+tb6\CgTIo6$$m]CLoLd3F<nC/i4p_$;No?+EMI<AKZ)+F*)I14tq=<+E2IF+=D5IDeio=<+U,m
0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.DZ0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U
+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AMGPo+?MV3@W-1$
5u^WS0HahCDeq^=:JEPd@W-1$<'`iE74/F+0RIGQE$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](
DKJiD6;0fq$49Np/g+RFF*22=AI:UTHSZdWEc<-KF*22=ATM^,CLo4J4!6UG-Za-CCLo5"ATMrI
+EMC<CLo5"ATMrJ-OL2U67sC%Df'&.D.-ppDfZ7L0O$@VE-67F-Za-CCLo4p@:O=r0IJq;0fpas
/g)o*-ON$k>;RIAF`\`RF)>i2AMHnf@rcKB-Ta(<4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#
Gp%0I@:Nk$+A!\aD'370Ch[?iEa`c--OL2U67sBsARTan+Co1rFD5Z2@<-W9DfB9*Ci<`mA9Da.
;f-GgAM>f567sa(Ddd0eF_u(rD/X3$0JFVk/M/)UF_u(?F(96)E-*4CASc9nA8,po+EMC<CLnW1
ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@lt
Ed8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#A?$;No?
+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH0Js:H:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.
Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3V
Ddd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT?1%15is
/g,7YEc*"<AnE0-Bl.F&FCB$*Et&I?0RI>LF(KG9-W3B45tOg;7n"de0F\?u$;No?+Co&"ATVK+
@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls
-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2
+EV19F<G+.@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C
-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUA9Da.+CfP7Eb0-1+CT.u+ED%0
Ddd/c$=ma33Zr9JCLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+EVaHDBNk8
+EV=7ATMs%D/aP=@;]TuA9Da.061W?Ddd/c$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$=ma33Zr9J
CLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R=j0fU=;1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,
F`:l"FCf3*A7TCqFE2))F`_>9DGEMN.Wo]@@<?'qDe*BmF*)G:@Wcd,Df-\=/M/)fE+EC!ATJu+
Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2/e&._67sAi$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/
+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB73,N)L1,pCs
ASl@/ARlotDKBo.Cht5'@<?Q5@;]TuF(96)E--.D/Kf+KD/a<*Anbgt+A+pn+DkP$DKKH-@;]Rd
%15is/g)i-F(K;G1a$4;A7]9oBPDO0DfU+UFEhmMFDi:4BleB:Bju4,ARloqBl%@%%15is/g)l'
An>F+1a$:HBl8!'Ec`EOBkhQs-Qli.A7]:&C2[W8E+EQ'Eb0*+G%G2,Ao_g,+F7a@%15is/g)8Z
+<VdL+<Y<8DeElt04Sp2AT2HsGT^O2Eb/a&DfU+GF`:l"FCcS8ASl@/ARl5W:-pQU0em9O@PKea
C2[X%A7dH9G]Y'=Bl[cpFDl2F+E2.*@qB=lCh.*t+CSekARl5W:-pQU0emNRGqh9$C2[WnDdtG:
Bl8'<DJsW.F"VQZF<G"&A7]9\$;No?+>GWdF`&rg+=M;BFD>5pA8c@)@<?1(.3N&0A7]9oAoD]4
GA1qG+Dbb0Fa,G[D.-osE+*j%%15is/g)l(C3=DL1*C"9A7]9o-uEC&DJsW.F'hmK<%/q!$;No?
+>GWdF`&rl+D,P4@qfgn+Dbb0AKYQ%A9/kAFDjc#%15is/g)l(C3=>H2]uUKE-WR:BleA=H>.=@
FDi:4Ec5o+Dg3C:DerrqEX`@N67sB81hq/N1,U1pASl@/AKYN(DfB0(GT^U:Ch.*t+Cf>/Gmt*U
67sB82/QcB0fC.pASl@/AKZ;2Bl%@%+>"^JBl%@%+EVNE/hSb0C2[WnATf_8Ch[Hu06;5DFCd*X
/hS8WBl[cpFDl26ATJ:f:-pQU0f<]gCb[diEb0*+G%DdEC2[WsDId='?V"-j9IV*#@<-!l+E(_1
Des!,AKYo#C1Ums%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5
?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>;67sC$ASbpdF(HJ)Bk)7!Df0!(Bk;>p$=e4!E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K
+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5
DBO%A@:O(eDJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8
Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU8l%htF*(i'Bl7Q+A8-'q@ruX0Gp%6IA7]d(E-67FA8,Oq
Bl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6rR&N7n#g;;E[&`C2dU'BQIa(+=JEd-UCEt-S.>q
De!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/15L\@:s.)C2[W9-OgCl
$;No?+EM%5BlJ08/0Jb;@WNZ#DIal!@<?Q"$?L#H3Zoe`BleB7Ed;D<A0>T(F*(i,Chdm!+ED%7
ATV[*A0>W*A8kstD0$h7De*g-De<^"AKYhuDJ<]oF*)/8A0>\s@V'dmD/a<&0JG4(C2[WsDKKo;
+DPh*A9Da.-OgE(Ccsg%F)3BT+A?3Q7!3?c+DPh*@V'V&+DG_7FCB!%C2[Wl@<<W4ATMF)C2[Wl
@<<W,De*g-C2G).De+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[/12QTDe*ftAm\M><$6!kDKU2A
DffQ3?W:-,+DkOsDJsW.F'hmK<$r+^%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?
+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EDUB+A+pn+DkP)
BkCptF:AR*-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;67sC'E+EC!AKYT!Ch7Ys$8=Rj
FDjboC2[X%@<-4+.3K`U+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*fqEc#kMBkh]:%14dO.!0B"
+DPh*E,ol/Bl%?0+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X%Ec5Q(Ch555C3(a3$8=RjFDjbo
BPDO0DfU,<De(:>+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj2/BleB7Ed99ZG]Y;B$8=RjFDjboC2[X%
Ec5Q(Ch5%<+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@A8lR-Anc'm@UX%)Bkh]:%14dO
.!0B"+DPh*E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2De*fqEc#l,@;@K0
C3(a3$8=RjFDjboC2[X*F(KB%Df00$B4>:b.3KaFGB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@
A9Ds)Eas$*Anbme@;@K0C3(a3$8=RjFDjboD..<rAn?%*C2[W3+<Ve=GB.D>AKXT@6rR&N7n#g;
;Cj24@;]dkATMrGBkh]:%14dO.!0B"+DbIqAU%X#E,9)>0JP"!Ap890FCcRe:IJ,\5t=@38Q%)e
C2[X!@:F:2CggdaG[YH.Ch5:S0eR0TF!hD(0K^b*Db;-G@:DWID/^pH+<VdL+<Y9?EbTW,+A,Et
;cH%Q779^F/151NA8G[`F"_?<@UsUuE%Yj>F!hD(0K^b*Db;-eDe*R"FE2:K+<VdL+<Y9?EbTW,
+A,Et;cH%Q779^F/151NA8G[`F"_9HA8,q'Ec3REC31g4$8=RjFDjboC2[WnF_u(H+<VdL+<Ve=
GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*C$D/_+AC31g4$8=RjFDjboC2[WlATMrB+<VdL
+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*<gF*'$KC31g4$4R>;67sBlG%GQ5F^]*&
Gp$O5DffZ(EZf=ADe`inF<GF/DII0hEZf1,@N]l/Cht5'AKYDlA7]9o%13OO:-pQUF*)>@AKYZ.
D/:>/DId='+>"^SFD,6++E).6Bl7K)Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1DImo4Ch[d&Et&IO
67sB74=G;i8g%keA8,plAU%QQ<)$%8+D,h<Blmo/8l%iR<'a#C6qL9--YdR1A8bs2BQS*-A8bs2
C2[WsDId='/nf?DCaTZ!%15is/g,4WDfTD3C2[X%A7dH9G]Y'ICgggb+D>\0A7]d(AoD]4C2[W8
E+EQ'/KeJF@;0Od@VfTuDf0B*DIj7a0K^b*Db;-eDe*ftAm\M><%/r%GB.D>AKXT@6rR&N7n#g;
;Cj21De*Bs@kVe3An5gi05>E9E+EQ5FEhmT%13OO:-pQUF*)>@AKYf'DKU1WD.-osF)Y]#BkD'h
+Du+>ATJ:f0K^b*Db;-gBl8'<DJsW.F'hmK<%/r%GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kVY4
DKU2ADffQ3/p)>[-OgD:4=G;i8g%tZ@r?4,ATM3X=B$^l+<Y9?EbTW,+A,Et;cH%Q779^F/151N
A7TUg05Y--DJsW.F"VQZF=.M)%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr
%17/nDfp/@F`\`RC2[W*F*(i'AKYMtEb/a&DfU+GF`:l"FCeu1%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&                                  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)$.4+>P&o0H`,/+>GVo1-$I31*AA0+>GPm0fC./0H`)/+?:Q%1E\D4+>ktu1,0n-1Lb6<;f-Gg
AM>ed@W$!2+CT;'F_t]-F<GXADeio,FCfN8F(9-*E,&<gDeio<0Q^lIF<DuADf'H..3NM:D.Oi.
@V0b(@psInDf0''D/a5gD/X3$0JOtcDf'H..3NeBCh[E&@<-"'D.RU,+EMC<CLnW1ATMs7A8,RQ
D/X3$0JFncBk/Y8F)>i2AKZ)+F*(r1Cf>1hCLo1R-tI43.3N\KDeio,FCfN8F(Jl\D/X3$0JIQb
Deio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3N_@@VfTuARoLsBl7QrCi<d(;f-Gg
AO1BYBkM<;0JI3YA8-'q@rri%F)u&.DJ`s&F<GL6+D5M/@UX'qF`)2ADffQ$+DtV)AKYf'F*&OB
Dfor=F`:l"FCf3*A7TCqFE2))F`_>9DKTo/@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df, ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0etL,0esk-+>G_r1*AM30K:110H`+n2_m?H+>G\q1*AJ51cHO30d&4o1,([D+>GPm1*A;00f(L+
0f'q-+>P`00d&2)+>P&r3&*-10fL41+?2>;+>Get1*AJ11a"M-+>P&o1cIE;0f^@3+>l,4+>Get
1*A;.1G_X!6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`
F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S5
3]/cU1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>G_r8p+qm1,(F?+>>f:2)[KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/
3\r`V0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A
+>Get8p+qm1,(F?+>GW41bh$H2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.
0fh!I3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh0d')2C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>GVo+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe
0f:(.0fh'G3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r
+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#
$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.:
+<X'\FCdKU1,L+GF_i0U0JPF-0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$F
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1-$IL
F_i0U0JPF-0ebXB1-.0L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp15+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-0KD0K2``WL
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_
+>PW*2'=V-3\iTS1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0JWtB$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Y-+F_;gP0JPF-0ek^G2**HI$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqi+@1-_+>PW*
2'=V23\WBO2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3
@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)5LG$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-F_;gP0JPF-
0fD'K3BAlQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\
FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f'.D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-
0ek^E1cdKQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU2BY;.B-8r`0f:(.2EE]O3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fB@G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp@(6$6f_1,(F?+>>c91,CsG1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+?(E/F_;gP0JPF-
1,1gH1HI9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp13+<X'\
FCdKU3?UV1B-8r`0f:(.0KLsE3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KLsL3\W>s$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqo+@1-_+>PW*2'=V-
3]/ZR0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0ea_9F_;gP0JPF-0K;*M3BAlM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.2+@1-_+>PW*2'=S53\`EO1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1("?q:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT
3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo
6$6f_1,(F?+>G]61c7<J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqg1*Al*B-8r`0f:(.1cdHQ3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<G
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K1cd<G$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqk+AZKh+>PW*
2'=V13\`BN0KBJ4:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo
/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U
0JPF-0ek^E1cdBM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=#3?TG4@<?'A+>G_r8p+qm1,(F?+>>f:2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2D?6r6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6
C`kJe0f:(.0KLmE3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp=9+<X'\FCdKU0fL4IF_i0U0JPF-0ebXG3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1E[f.@<?'A+>Get8p+qm1,(F?+>GW41H7EL2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DcO!6t(1K3Zp.9
+A-cm+>PW*2'=V/3]&QP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>u)"+@KX[ANCqg2]t_8C`kJe0f:(.1cdBK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$J
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2]s52@<?'A
+>PYo8p+qm1,(F?+>GT30K2$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2E2g%6t(1K3Zp14+A-cm+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u5&+@KX[ANCqh1E];4C`kJe0f:(.0KM'I
3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@8+<X'\
FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=%0d%T,@<?'A+>P_q8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm+>PW*2'=V2
3\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?))!
+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp@<+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K3BB#S$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2'=#0@<?'A+>Po!8p+qm1,(F?
+>G`71cRNM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2`;d$6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+?)5%+@KX[ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU1-$ILF_i0U
0JPF-0ebXG3'&fP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU1E\u+B-8r`0f:(-3'&iO3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$6$6f_1,(F?
+>GQ21,_0L1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.
3]&]T0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp4$6$6f_1,(F?+>G`70JkgJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK
+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO
3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU2'>2-B-8r`0f:(.2EETP3]&`%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU2'>2-B-8r`0f:(.2EEWS3\`Q#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP
3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.5+<X'\
FCdKU2BY;.B-8r`0f:(.0KM$N3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU2BY;.B-8r`0f:(.0fh$H3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU2BY;.B-8r`0f:(.0fh'H
3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU2BY;.B-8r`0f:(.2EE]O3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU2BY;.B-8r`0f:(.3'&iN3\`Q#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN
3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.;+<X'\
FCdKU2]tD/B-8r`0f:(/0fh-I3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp13+<X'\FCdKU3?UV1B-8r`0f:(.0KLsE3]/`$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KM'H
3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K
3Zp.2+@1-_+>PW*2'=S43]&iX0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+>GPm6$6f_1,(F?+>>f:0f(jH1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0eje:F_;gP0JPF-0K;*M2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`0f:(.1cdHN3\WH!$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+@1-_+>PW*2'=V13]&fW1,'%B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<G+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;
AT/bI0JPF-0fD'K1cd<H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp:&+@KX[ANCqg+B)ij+>PW*2'=V33]&QP1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.-D$;Y,PATDs*
A4:NZDfTnS2,6Ij.SjMpATDs*A4:NZDfTnAF"Jsd@Wc<+Ci<r/@;]TuEb0<2Df0W-F"Rn/%13OO
:-pQq4X`$6+CfG#F(dTWDf-\6AS5_!Bl.:#AKWC3DJUaE@<-"'D.RU,+=LuCA1q[T0Jk3f$;No?
+>Pr"9jr&b1,(C>+>GZ52)%'G1^sd$$6UH6+<WK`1*C+FC`k*9FXIV*_R"8kDJLA+EcQ)=3Zr<V
@ruSt$Gs+l+<YT<+D)`=+<VeEF^f6)@ruT2GqKO5%15is/j2BH0e"5WBm;Z]D/Ws!Anbge+EV:.
+Eh=:@N[(0DJXB*@<,jk.3N_N+DG_7F`M%&$;No?+EV:*F<G"0Gp%!ICht58ARTUhBHV,*F*)IG
E,ol9ATDU4+E)41DBO%>+Du=<C^g_H67sC&@:F%aF"SS7BPDN1AncL$F!,R<AKZ#%DJLA+EcQ)=
+>"^XBOr;rDe*Dg$;No?+EqaHCh+Z%@<Q3)AmoCiARlp%DBNk>BOu3,@<-"'D.RU,+E1b2FCfK1
F"AGF/nZdZ1E\FqA8Z3+-Xq"4-Qij*:-pQUGA2/4+Du*?F*22=ATJu<Dfol,+D>2,AKYSnBl%?k
+:SZQ67sB'2]tD*EZd+k0Jst-1cd<I3\iE!$4R=O$;No?4?Y)J.3N,@@<6*C+EqL1DBNA0FCf<.
FD5W*+EVNEEb/ltF*(u6+CQC3Eb-@c+>kc*1^sde67sBkBk)7!Df0!(GqL3^<+oi`AKY].+CQC6
Df'&.@VK^gEd8dADI[U%E+*j&@VKXmFEn<&:-pQUBOu3q+>"^HBk)7!Df0!(Bk;?.@rc-hFCeu*
@X0(g+>kc*1a$=I+Du+>+EM47G7=mS67sC&BPDN1ATDg0EZcqVBl7Hq@psIjF!,@3ARloqDfQt;
DfTD3Ec5E0F*&O9EcQ)=%15is/g,7V@;p1"DJ()+DBN@1An?0/Ec6)BBl7L'/e&._67sB93?V%)
EZd+k0Jst-1cd<K3\rN#$4R=b+<Y]9B4N,4C3=E0-T`\c3a?E.Eb&loFD5Z2@<-'nF'NToFDYH#
DHppbEc,H1D..-r-OgF"ZXduk@;0U%ATDg0E]P=X?ZK^dA.8m_ZQLA5Ao_Ho4Y@j"+<YE+Eb/Zi
+D<iK%13OO:-pQr4t&08+D,>43ZrNXAKY`"Bl%@%+Eh=:@WNZ#Eb-A2Dg*=6@;KakA0>u-Ec6)5
BHU`$%15is/g+S5G%G]8AKX#p+EVX4E,]B!+DG_8ATDBk@q?ckDIakuCht59Df?h8AThX$+Cf>1
AISuA67sBQ:IH=LDfTB0+CT;%+CT)-D]j.B@;p0sA1euI<+oue+D#S6DfQtEBl%T.F*),4C`mY+
@s)f$$;No?+D,P4+DG_'Df'H%FD53#AKYGrDIIR2+D,>(ATJu'F`\a?F!,@=G9CjFDfB9.Cj@.F
Ea`p+ARmD&$4R=O$;No?4?Y)K.3NhTDf02K+=Lc7F)WQNA8c%#+Du+>+E2@>E+O'+Gp$X3F)Yr(
Gp%6IBk)'lAKYMlFCB9:E+O)"$;No?+>b3,E,m'V0JG@,0f(jH1HI?I%13OO+<VdLF_!Wr+E]^f
-Zj$9F!,1<+E_R9@rGmh-OgD*+<V+#+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg$6UH6%144#+E2IF
+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\K#<8ZKYrJ\
KYkJ5$Gs,(_Qts>GAhM4.!$g[E-67FBl5%F5/OX@F`)!3ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\J]!/YKYrJ\KYs2e$6UH6ATD4#AKW@CA1%fn0b"I4+<Y<.
F<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtu6ZS<SH
DfTA:F"&5BAS,XoARrZa%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq
%144#+E_3($?TrqF!,1<+E_R9@rGmh%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth+<V+#+<Ve;
Ble59-ZrrI+AP6U+EM47F_kS2A8-+(CghT3FD,5.5uU-B8K`1fEcYr5DBNP0Ci"$6Bl7Q+8g%V^
DK]T/FD5Z2Et&JoR_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,'_QtCX:IH=:EcQ)=3ZqsEAnc-sFD5Z2+D,%rCisc0_Qs[Y
_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>pq%13OO:-pQr4t&39+D,>43ZrWbEbf_=Bl5&0@<?($+Eh=:F(oQ1F!,C5+A*b.+EV19
F<G(%F(HJ)Ble5nDJ<U!A7[GK0b"I!$4R=O$;No?4?Y)L.3N2BEc5tZ+EV:.Eb-A-F!+m6Ci=3(
+EMX5DIdI!B-;/6DdmNoD'4%:FD)dFDIIBn@psJ#.3N>B+EV:*F:ARP67sB'A7]7e@<,pi+EM%2
E+O)5@<,p%DJsV>@;L-rH#k*KATW'8DIm?$@rHC.ARfguGp!P'%15is/j2BH1asPZBm;Z]%13OO
%13OO:-pQq4X`0:+D#S6DfRl]-uEC.ALSaG@<3Q'@;0OlDJ()6D]i\(DImisFCcS-Ec6)>F!,[?
ASrW4BOr;sAT23uA7]Y#%15is/g+tEF*&O9D/aT2ARlp*BOr<!Ec6)>+Dbb5F=n[Y%13OO+<YT5
+=D;RBl%i<+BosE+E(d5-RT?1%144#1*BpZ+DkP&AKW@EDfTB#DfT]'FD5Z2-OgCl$;No?4[(8O
.3N5:GWHsWBOPdkARlo3D..3kB6,LEFDi:8@;]UlAKZ).BlbD,@<6!4%13OO%15is/j)9F2CTb[
D/aTB+D5_5F`;CE@<,p%DJsV>@rc-hFCeu*@X0):F`))2DJ()&F_u)=@rc:&FE8R6ARf.kF(HJ,
Ec<-KDIIBn-T`\'%15is/g+b7Bl%i5Df-\+DBNY2G%#3$A0>buD.P=B%13OO:-pQr4t&<<+D,>4
3Zoh`F)>?$AT9.AD/Ws!Anbge+EVNEEb0*+G%De)DL!@9D/aT2ATJu+Ec5e;DIIBnCh[s4+C\no
DfTCu$;No?+CfG'@<?4$B-:i-Dfp#?+CT.u+EM[>FCfM&$4R=O$;No?4?Y)O.3N2BEc5tZ+=LuC
A79+^.3N>AE,ol9ATDU4+Co2-E,8s.F!,O<DJ*cs+DtV)AKYJr@<,ddFCfJ8Ch[s4+CT;'F_t]-
FE7lu:-pQU1-$IPDg!6Y0JGF.0ebXC3BAuS%13OO%144#+DPh*@:s-o-Y.:?@<<k>+AP6U+CfP9
F!,@/D.O.`ifoD]P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXOQ)LV%1;*Z
Jfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4D'2;^EcZ=FE-69^P_);3FCcRg
@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;ifo&SPap`tJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*ZJfs';K&W#HA0<!;ifo$M0JGF>3AE6@1a!n`
+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G0ek:;+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL
ifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXR,X?^
%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\%144#
+:SYe$6V)H+DPh*@:s-o-Xq.=@<?Q<%1;*ZN8g(PifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufT%1;*ZJhc8LK&W#RifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifoPaP_'>Oifo$;ifo&SP_)Y=D.V^kJja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;
7VQmaF<GOFFQ/O:6t(1K+A?3bF<GOFFQ/O:6t(@^+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';
K&W#bifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*?e
+<][.Jhf#62_[6H0eP:;+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL+QAW;1,(C@0KCjB/i5:*+QAW;
2`W!'+<VdL+<VdL+<VdL+<][.K&W#H%1;*ZJfs';K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifohiP_'>Oifo\eP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPaDme%16igA79+^+?MV3A92j$F<GU8@OE9@:-pQUDegJ-DfQt:BleB;%13OO
1E^FNA79+^+FPjb1E^4GC`k)Q%13OO%15is/j)9F3%5t]EcQ)=3Zr6W@:X(iB-9fB6m-#_D/^V=
@rc:&FE8R:@;0P!+EqL1DBNt2F*)>@Bl7Q+A9Da.+EM%5BlJ08%15is/g,@PFD)e7ATo8=Bl.F&
FCB$*F!*%WDJsV>@q]F`CM@[!+D,P4+E)41DBNJ(@ruF'DIIR"ATJu&F<GXCD.Oi/DeX*2%15is
/g)i*+AZKh+>PW*2'=S53\`?M1,04F%14d43\V[=-Y#1jC2[W9C2[X%Ectu9D/aPLD.RZ=Bkh]:
%13OO+>,9!/g,(LBlnH.A0>u*G]Y&\/hSac$4R=m/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/I^$@FOT+\GNu+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
.h)i50RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+.h)i5Ch7KsFD)e.EcQ)=3ZqsO%17J*+<Y;[/jr9/:/+Yo?Y"(Z@6H4c
+<Vdp:-hTC?XI>^%13OO:-pQr4t&B>+D,>43Zr<YG9CC/ARfLiDJ()(DfQt=E+No0A8,OqBl@lt
EbT*++DG^9E-682Ci"37%15is/g)i*+AZKh+>PW*2'=V13\`TT1-#dN%15is/j)9F3@Q(^EcQ)=
3Zoh`Ci<d(.3N>B@rHC.ARfguGp$^8@:sX(F)Po,+Dbt+@;I&pF)u&.DJ`s&FE8RHD]j1?EHQ2A
ARl5W:-pQUBl7HqEb/a&+D5M/@UX(o+CT=6@3BE$G\(D.@<6L(B5VQtDKIKR+@^9i+D#e+D/a<&
3Znk=:-pQU0KC7O@rrhK0JPF-0etdI1cdHJ%13OO:-pQUFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.
DJ`s&FE8Q6$>jL%ARnAMA8-'q@rt"XF(o9)7<3EeE]lH?+?CW!%14LXATVU(A3k6KF_t]-FE8lo
/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6
E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=-OgCl$;No?4[(8R.3N5:GWH9@%15is/g+_CA1__3/T5*>ATDs*A1_A5Ec5u>%13OO@WcC$
A86$nBkh]E0ht%f.UmO7Ch.:!A8,e"+EK+d+E_X6@<?(%+<Y04D/Ej%FCeu*C2[WsC3(M=@rc:&
FE8QIBl5%9C2[WqBlj\W67sBkBl[cpFDl2F/db??/db??/g,=KEaiI!Bl,m<:-pQ?:-pQU+<Y]9
EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6jc[U/g)8Z1E^UH+=ANZ+<VdL+<VdL
+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+$;No?+<VeFA0<rp-YdR1A7]p,
C2[W*F`_>6F!i(Q:-pQUDfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/$:-pQ?
:-pQU+<WB]EbupH@WcC$A86$nBkh]:+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16
E,95uBlkJ305i9H:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+AQhtATDg0EZek*ARfLiDJ(R/:-pQU
;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%>f:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q
67sBjEb/[$ARmhE1,(F;C3=DJ1($cC/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTcF`&ll+CSekARlouDe*g-De<^"AM.\3
F!,49A8kstD0%=DC3(M4De+!3ATD:!DJ!Tq@UX%)Bkh\r:-pQU0f<BYE\K6kEb0*+G%G2,H=gl-
ATJtG+E)CEE-67FA8-'q@ru9m+EVNEC2[WqBlkJ?DId=!+CT)#ASqh^@rGk"EcP`/F<Dr?@<6!-
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OO@%Bl8!'Ec`EOBkhQs-OL2U67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]Tu
DfB9*+DPh*+Co1rFD5Z2@<-'nEsci(D`p-(I4cXQBk/>?$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<
+BosE+E(d<-OL2U67sBmATVEq+ED%5F_Pl-A0?#:Bl%i5@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?
DK?/,D/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4&C2[X+ATDj+Df.^!+=o]1HV.(%<_Ysh$;No?
+CT)#ASrW*De*QsF!,"-Eb/a&DfU+18l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi
8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL$;+)^7nHZP:IIcH;c#bZ83K!VC2dU'
BQIa(+A,Et7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"0..)6:-pQUB4YslEaa'$+Cf>,D.RU,
ARloU:IH=8CghC++EM%5BlJ08$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]n
CLnW'De+!4Bl"o,De*s.DesJ;C2[X$DC5d+De*HoCh7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$
Es`7L67sC$ART*l@r,RpF!,(/Ch7Z1@UWb^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];
4s525+u(3TDe*HoCh7Yp$;No?+Cf>+Ch7*u+Eh16BlA-8+DkOsEc3(A@rc:&FE7d:Eap55EapI[
3Zp7%B4Z0-4$"a(De*g-De<^"AKY`+A8kstD0$h7De+!3ATD:!DJ!Tq@UX%"$7L6R+u(3]EapO]
3Zrc1+u(3]EaoF`:-pQUF`:l"FCcS*Bl[cpFDl2F+D,>(ATJ2J8PDQO4ZX]6C1D'gF)to6+=nX^
/g<"mF)kb>+=nil4s2s8/no'A-ON=79LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO
$8=SWDe*BeF<D\K+<Ve=GB.D>AKX&gHU^S#78jOI4DJeFF*)>@ARo4k+D,h<Blmo/4#)(O8PDQO
$8=SWDe*Bs@Urnh+<Ve=GB.D>AKX&iHU^S#78jOI4DJeFD..3kA79R&+D,h<Blmo/4#;4Q8PDQO
$8=SWDe+!4Bl%<gF<D]<GB.D>AKX&kHU^S#78jOI4DJeFFDl)6F(A^$+D,h<Blmo/4#M@S8PDQO
$8=SWDe*d(A79R&+<Ve=GB.D>AKX&mHU^S#78jOI4DJeFE,ol/Bl%?'+D,h<Blmo/4#_LU8PDQO
$8=SWDe*fqEc#k?+<Ve=GB.D>AKX&oHU^S#78jOI4DJeFF`V,7@rH6sBkLm`CEOa3GB.D>AKX&p
HU^S#78jO#F)>i<FDuAE+=CZ;D/Ej%FCeu*C2[WsC3(M=@rc:&FE8RIE+EC!ARm.qF)>i<FDuAE
+A,Et7nHZP:IIcH;c#bZ8.#]!67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+$?'GtDf9P:>9G^E
De(4C$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FRBPDO0DfU,<
De(U^%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO,9nEU0J5@<3B836+@]6s%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;+>GQ$+>PW*2%9m%
$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*Dfp.E@<3Q!Eb065
Bl[cm%144#+<YN0Gp%!CF<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL0d(FL@r!2E+E(d5
-RT?1+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.1-.*G3]&Z&$6UH6
+<VdL+AP6U+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q+FPjbDe(4C+BosE
+E(d5-RT?1+<VdL+<VdLEb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#+<VdL+<VdL+<VdL
+>,9!/e&-s$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i?m&oe@r$4++DtV)
AKYf'F*)IGBl.g*ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<$4R=b.NiV?G9D!=
F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b
.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$
+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU
0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXk
DJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+
@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$
A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3
@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:
+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=
BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)
@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/
A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:B
ARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu
-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+
Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]4
1,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-
4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL
+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o
+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL
+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdS
Eap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<
3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mr
G%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r
+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=
@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+
DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>
Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>
GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^h
A1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL
+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[
+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1
GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*
+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT
$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W
1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4t
ATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.
Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc
+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7
BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2
+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>m
AoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.
+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+
Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk
+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`m
A8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cq
D.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08
%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=
G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(n
DJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C
:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$
D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f
?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)
AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2
@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1
Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1
/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7
FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrq
EX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U
+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdL
D/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/
C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu
?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"
F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'X
AKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(n
DJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+S
Bl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1
F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5
$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3
BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2
B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$
Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?
=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.
Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@
DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S
@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2
F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*
BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6
>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J
2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5
?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk
3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;
1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%
0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#
ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL
+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$
CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656
E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK
1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:
Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7
ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE
1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KL
A0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk
@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#g
F!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?
ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b
.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$
F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+
3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,
@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(
A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4
Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3
+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs
@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_
+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&r
ATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4t
ATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ
6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X
<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL
+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#
+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':
?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A
+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkT
Ec<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5
@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*
Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NG
B4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5
?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/
@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&
DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!r
FE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+
/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,
@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#
+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;
C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#
+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(
Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$
ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*
B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@
D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb
912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1
F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1
DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"
F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.
FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6
BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'
DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1
A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#
+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM
8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>
F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-
B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0
:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[
+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e
+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h
$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4
+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARloo
Bk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/is
GT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2
BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIa
FE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.
FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'
+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G
$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCpt
F<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"
FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#
AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-
Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[
%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5
@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk
?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUj
BOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg
/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-
DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloq
DfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$
D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1
@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6
@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$
Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?
+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOF
F<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda
+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;
%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y
$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$
Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+
Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#
+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7
E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5
@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>
ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(
ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*
+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlol
DBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%
DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<
1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cm
F`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=f
ARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,Xf
ATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQ
A79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%
0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*
DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&
ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e
7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/
A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*
0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:
F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VL
B4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2
/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*
D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"
F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6
BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?C
GV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-
@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%ht
BlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u
+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF
@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@
FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1
F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'
+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"
+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'
9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibC
E,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%
$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g
+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V
+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%
F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.
ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)
Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.
+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>
DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg
%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0
+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTu
FD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:
@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@
?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;
0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU
;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4
+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2
+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;
@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4
+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.
+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%
+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^9
8l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/
FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-
ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo
+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?s
AKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LS
AT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'
+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[
A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_
0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LN
Bl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&
,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb
+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T
3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517
+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.
@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*
Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@
D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA
%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R.
/KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et
+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7
FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N
6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*
D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/
DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-
F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@
H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@
H"q8.A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<b/ibOE3?Tmr7T)V`$4R=e,9n<b/ibOE3&Mg1
+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[
A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)
?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%q
CghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'
DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI+
+<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2
FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%
AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%
0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8
/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b
/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8
@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57
@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;q
Ci<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e
,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD
?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J
+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;
FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l
$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92
Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K
+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=a
DIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[eh
CLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU
0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIakt
C2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b
.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c
+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14
+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/
ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5g
De(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?
@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu
%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh
+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-
FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/
Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#
EbT*+/e&.1%16igA8lR-Anc'm1,2Nj/h1USA8lR-Anc'm+EK+d+A,Et+Co1rFD5Z2@<-W9E,ol/
Bl%?5%15is/e&._67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)
E-*4:D@HqJ67r]S:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn
+DPh*E,ol/Bl%?5Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%
Cht5)Bk)7!Df0!(Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)
F(Jl)+EVNE+EM+9+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB
%15is/e&._67sB^5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/
+A,Et+EV%5CER>4%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM
-Z^DLEb0E*DKI"0DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1
FDQ4FEb0<7Cige3Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/
G\M86DJ((a/e&._67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-
@q?c2@3BB#DIjq5De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeK
ATDX%DIIX$DJ(C@+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]
8oJB\+@Ih)6=FY@EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@
Blmo/F)YPtAKYr4ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOC
ARfFqBl@l3FDi:CBQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is
/g,4HF<G=<F<GdADId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G
%15IHBO>L]4ZX]?1b^%-1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;
AKZ).@;[3+DIjq_:IH=>DKBo.DI[5e$=n*sATT%B;FOMQ<)#e/%13OO:-pQU8l%htBl8$(Eb8`i
AKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'EZee$+D>\'+A,Et+CSekDf0V*$=e!a
CghC++=Cl<De(4)$4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5
@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6
DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F+DkP/@q]Fp
-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXI
Blmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1
AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t
4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%F
A1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@
Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k
?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><
ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut
4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;
Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&C
DIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:
Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>
ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9
De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$
AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[Flo
De*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1
.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CEBl5&6AThd/Bl@l3DfTB"
EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9
/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBNe)
@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQU
F(fK4F<G7.CiCM/DfQt5Ec6)>+EqaEA9/1eBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$4R>;67sC%
BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z
+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K5
67sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT
+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^
Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#
@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=
F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1
+Dbt6B."fE+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL
+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]
/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.
+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;
Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;
8P2cH0JFViATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3i
FD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1
Eb/ltF*(u6-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARu
Ch7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(C
F)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn
$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG
3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Ds=p+ED%:D]gDT+CoCC+Dr<BATW'8DD!&CDIb@/$7KdC
/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'nDETV#/oD+*.1HUn$;No?+D>2$A9f;-C`m8,@j#Gr
CiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=4
8l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h
.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?
F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g+_9
BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/+E2?D-RX7i:4@U=-RT?1%15is
/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HW.EbTW,
4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M
-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g
>n%,M$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6".$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQ
B657=+AP6U+=]!cG]XB%D/)3p>p)3O1,0t[+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO
4!80X+<Ve%67sB1/o>$;CLh@-D@HqiGWe)n+?L]$1*U'J4!80X+<Ve%67sB1/p(ZL%13OO:-pQU
8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,
F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hG
G9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9
F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?
+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^s5
$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6-OgCl$>j3eAO9gHBk'b26r[`=FE92l:-pQ_D..3k
6=FqL@nKNb<+U,mF!,NU/Ken=CLnV\:IH=7@<6-m+EV19F<GX7EbTK7/e&._67r]S:-pQU<+oue
+EM%5BlJ/:B4YslEaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%ht@UX=l@grc?
67sC&ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9
+EV:.%15is/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4ASGdp
F"Rn/:-pQB$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ
@rH7,Ec5c1ARlo+@X/Ci:-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(3
78m/Q:K:.h.3N2H@qB4^F!,R<AISuA67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*<cF(o-+
ATMs7.3N\SBlmo=%15is/e&._67sBhF)uJ@ATKmA$;No?+<Vd9$;No?+<Vd].3Lo!@rH6sBkMR/
ARloU+Co2,ARfh#Ed8dV8l%iS78m.p$;No?%15is/g,=KEaiI!Bl,mRFDi:EF(HJ)D`S=7:-pQB
$;No?+<Ve%67sBnASu("@<?''F(96)E-)Nr:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV9
1E^UH+=ANG$;No?+<VeID'13C@;BF@@<6-m8l%iSATMs7-OgDX67sAi$;No?+<Ve%67sC$F`&=9
F:ARP67sB'+=Joe3\i-,4DJhDFD)dEIS*C(<(0_b01')gBk'b26r[`=FE9'KC3(a3$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`l%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
@rGk"EcP`/F<Dr?@<6!-%16oi@:UK.C2[X)ATMs)E[M;'D..3k;f-GgAP,`d<+U,mF##IF67sa)
@;BFQD/X3$8l%iSATMs7+EK+d+DkP&AKXT@6m-PfDeio,FCfN8+EM%5BlJ/H$;No?$;No?+B3#g
F!,O6EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+EMC<CLmiJ
67sC&ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9
+EV:.$;No?+=L]-F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)
/db??/db??/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-
FE2;9Ch7-"+C]U':-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q
:K:.h.3N2H@qB4^F!,R<AI;1!/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA92U+CLqU!F*)IP
+EM[>FCd'3:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JPG"F_i`l$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h
-OO[.@:UK.C2[X)ATMs)E[M32@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^
:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0J5@<3B8Gr$;aD^<(9Y]9iF29
-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!
3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_
F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u
$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2
D.-plDffQ3/p)>[%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A
%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&
/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d
76sj@4ZXs*2D?j.C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q'p@:./#D3Zp+!3Zp*c
$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@lt
Ed9)VBlbD*+A*bqEc5T2@;TjqDJ()6Df9GE+A,Et+DGm>%16MdGAhM4+E):7ASuU$A0>DkFCAWe
F(HJ+DfQt/Cht59H#R>9+E(j78g&%]C1UmsF"SS-:IH<7$?L?/E,Tc=F!,:5DJNfo+Co1rFD5Z2
@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJu9Df9H5+D,P4+:SZgDe!p,ASuU(DJ()#DIal3ATMs-
DJ((a+Cf>#AM,)7$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0
A8c?<%15pPBlA#7G%G]8Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=
D'3n0EbTK7F"Rn/%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-
@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F
$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-
DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet
@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRL
Ea`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.
9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,
05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.
+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM4K".1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV
%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE3&N&m$;aD^<(9Y]
9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u
$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn$;s;d76sj@4ZX]5C,Rb#+DNeg1*C<j0JO\b
3&!'0C,dn&+DNki1E^El0Jk-d$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*
Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])
AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c
+A,Et+AcKZAKYE'3XlE*$>=O'E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj
0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o
@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk
5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZU63A*<P-OgDZ
9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-
F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El
0Jk-d$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl;aXGS:fL"^:-CW\0H`D!0F\@;
C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(Gp$X?D/^V=@rc:&FE8Q6$7KY-
A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,@;0U%@;Ka&FD,4p$=e!bALnsG
ATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</Bl@l3F`V,)%172q+Co&,ASc:(
+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/%15LGD/^V=@rc:&FE8R5Eb-A0
@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'BgARfh'+DG_8D]hYJ6m-#S@ruF'
DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(Bk;?.@<,p%B5_^!+D#e+D/a<&
F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'Ch7i68g&2#F*(u1F"Rn/%15]M
2_He/0/tR<GT]US6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M:i^8gEZbeuG%G]8
Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/%15^'
6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=D
BOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOT
Bkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>
F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A
@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.
-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-
A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO
$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%
Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(g!EAM%Y8A1_b/B4W_*$7QDk                                            ~>
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
+D#(^D/X3$0JFV^Ci<d(;f-GgAO1BYBkM<;0JFVcDdd0TD/X3$FCfN80Hb1M@:W;RDeip+ATMrJ
+Dbt)A7Th"E)UUlCLo1R+E_X6@<?'qDe*BmF*)G:@Wcd,Df-pO/1<VC4"akp+=A:HDe'u*De*Bs
@N]E(A8PajAKY`+A92j2Eb-A.De*s.DesJ;C2[X*FD5P=.4cl04?G0&0d%hdC2[Wl@<6-mFCfN8
F!,49A7KY&F(fZ,F*)IGC2[X!@<-!lFCfN8F!,49A92U+CLqU!F*)IGC2[X(FE1r6F*(u7FE8fY
/1<VC4"akp+=A:(:IINL8PDNC8Q/Sa;HY,7:IJ/X:J=\R<CokP84c`Z:Jt=<:L\BVEcu#)7<3Ee
EcW@4F_PZ&C2[WsC3(M2BleB7Ed;D<A0>Q"F*)>@H"q8.A8bs#C2[X%Ec5Q(Ch4`+@;BF@@<6-m
8l%iSATMs7+DkP&AQ*GaCLp+66r[`=FE8RA@;]dkATMs.De'u-@;]dkATMs.De*Bs@s)X"DKI"<
@;]dkATMs.De*p-F`Lu'-RgSp4>J$80dJM.0f:XE0Jb=>2`!-A2`3HQ+>PW*2)%!D1G1LB3&3EJ
0K1^/1,(F?0K1aH/iGRE3&icR2)ud70JPF=2_[!>2D[9I0f1jJ1*A>+0f:XD1,LUA2*!EP2*!HQ
+>PW*2)$sC1+kI@2_m*E3&WN71,(F?0K1[@/iGLE1,1UF2DQC10JPF=2_[!>2D[9I1,Ca@1a"P-
0f:XD0JY7=1H.'D2)@*K+>PW*2)$sE3%d*J3B/iL3&<?51,(F?0K1^F/i,IA3&icM2`2^50JPF=
2_d6D1b^gI1,LgC0d&5*0f:XD0fL^@3&*ER1b^jD+>PW*2)$sE0eP7?1bq$K0f1g31,(F?0K1aD
/iGI?0f:mM1H?R50JPF=3&!6C1c@9H2Dm3J1a"P-0f:XE0Jb=<1GUXC2`W]L+>PW*2)$sE3A**H
2*!EP0K(X.1,(F?0K1^F/i,IE1H@?K3B/-:0JPF=2_m0A1cI0G2)@!F1a"P-0f:XE0Jb=<1,UjG
1GppJ+>PW*2)$sE3%d!G0JYFA3AE<41,(F?0K1[D/i5CB1H@3N2)-4/0JPF=2_d6D1c70O2E<KL
2]sk00f:XD1,CO>2)@-J3A`QM+>PW*2)$sE3A*-G1GgmE3&WN71,(F?0K1aH/iGRG1c$mD2`Mp8
0JPF=3&!-@1H.0L0f1UE3?U(20f:XD0JY7=1c$sE1GC^H+>PW*2)$sD2_HsC2`WcR0K:110JPF=
2_d6D2)7*J1H@9L1a"P-0f:XE0Jb=>2`!-A2`3HQ+>PW*2)%!D1G1RF1,UjJ1,_-81,(F?0K1aH
/iGRE3&icR2)ud70JPF>0JG@:2*!BM2`!EL+>PW*2)$sE1bL[D3ANTP3AWZ<1,(F?0eb:=/i>XD
2`ENP1E\G,0f:[>0JtI?3AEHO1H7051,(F?0eb:=/i>XD2`NQO2)ZR40JPF>0JG@:2*!BM2`*BK
3?U(20f:XD1,pmE2`WiS0K:jE+>PW*2)$sD2_HmG0fV-M0fLs41,(F?0K1^F/i57?3&3<I1,0n,
0JPF=2_d6D1H7*L3A`EK1*A>+0f:XD1,1C;2Dd0K2DI$I+>PW*2)$sE3%d*H2D[9J2)I'21,(F?
0K:aE/iPI?1c@$B1H6L40JPF=3&!6C1cI9L1H@0E0d&5*0f:XD1-$sD2)[6E2Dd*C+>PW*2)$sD
2_HpA2E3TQ1-%371,(F?0K1aC/i5LB1GpsD2)HF20JPF=3&*0@2DI*D0JG1:1a"P-0f:XD1-$sD
2)[9I0K:jF+>PW*2)$sC2D-gC2)@6J3AiN61,(F?0K1^F/i5FD3ArlP2)cX50JPF=2_m0A1c7'I
2*!KM2'=Y.0f:XD1-$sD2)[6M2`*HN+>PW*2)$sE3%d*H2`*<G1cIB:1,(F?0K:d@/i,ID1,UsH
2_cF10JPF>0JG@:2*!?M1bq!H1*A>+0f:XD1,1C<2E*<F2`ENI+>PW*2)$sD2_HsC2`3BO1c7*=
/1<V9+>GSr1,(F?0K1dB/iGRD0fV!F1H-F30JPF=2_d6D1c$mI2*!TR3?U(20f:XD1,1C<2)m<H
1,h$H+>PW*2)$sC3A*0F0K:pG1-%<:1,(F?0K1a@/iPXD1H@EQ1c?I30JPF=2_mBG1cI<L1-%?M
0d&5*0f:[>0KCaC1H.6H2`!HP+>PW*2)%!D2D-jE1cREK3&WW:1,(F?0K:aE/iGUG2D@'H2)HF2
0JPF>0JG@:2D@'K2`<?J1a"P-0f:XD0f:R?0f^pF3B/`L+>PW*2)%!D2_I$C2DdBP0JbX11,(F?
0K1^F/i5FC2D@!K3&Da50JPF=2_m-@1cR3G2`3TM1a"P-0f:XD0KCaC1GggC3A<-F+>PW*2)$sE
0J5==3B/`K2D@!21,(F?0K1dA/i,CB0f_$J1c-=10JPF>0JGL>2)I*D3&iZM+>PW*2)%!D2D-mJ
0JP@=1GLd11,(F?0K:aE/iG^D0fM$H2E;m80JPF>0JG@:2DR'G1,LmC2BXb/0f:XD0f:R?0f^pF
3B/`L.4cl01*AJ#1,(F?0K1[D/i5FE2E3TM1H6L40JPF=2_[-B1c7'E3ANTP0d&5*0f:XD0K(O?
2Dd*B1b^[D+>PW*2)$sC2D-gC2E!?F2_m<71,(F?0K1[D/i5IE0K(mH2)cX50JPF=2_[-B1c@9I
3AE3H3$9t10f:XE0Jb=>2`*9J1c.-O+>PW*2)%!D1G1L>2DR0G1H7-41,(F?0K1[D/i5IC0JPC<
1,g=20JPF=3&!-@1c@<L2D[9P2'=Y.0f:XD0K(O?2E!6I3&<EN+>PW*2)$sD2_HpA1H.'E1G^p<
/1<V9+>kE"0JPF=2_[6E1c73H3&<?J2]sk00f:XD0KCaB2)I-D1-%-M+>PW*2)$sC3A*-G1b^pH
3B9)B1,(F?0K1[G/i5FA3AWNO2)HF20JPF=2_[6E1c7*F0KCgF1E\G,0f:XD1-$sF1H@-I0K1[D
+>PW*2)$sC3A*-G1c-mA3AWW;1,(F?0K1[G/i5FB0KCsM3B83;0JPF=2_mBG2D[9H1GU[@0d&5*
0f:XD0KCaB2)I'B3A<?I.4cl01*A;,,Vh&.2)$sC1+kI@2_m-E0KCj11,(F?0K1[@/iGLE1,:[B
3B83;0JPF>0JG@:1b^XC3&3KQ2'=Y.0f:XD1,1C>3&*6G2`EZU+>PW*2)$sC1G1[I3&NZP0f:a0
1,(F?0K1[A/ibpN2DR!@2)6:00JPF>0JPI<1Gq0N3&*0F3?U(20f:XD0eb4:0fV0R2E!BJ+>PW*
2)$sD0J51:2)@-H1H%381,(F?0K1[@/iGLE1,1UG3&i$90JPF=2_[!>2D[9I0f:XD+>PW*2)$sC
1+kI@2_m*F0JbL-1,(F?0eb:=/i>XD2`NQI3&Vm70JPF>0JG@:2*!BM3&<HN3?U(20f:[>0KCaC
1bggI0JP:>+>PW*2)$sE0eP@D0fV-J2DlU40JPF=3&**>2)%$F0f1mL2]sk00f:XE0eb492Dm<J
2_[051,(F?0eb=?/i,@F2E3EH1cZ[60JPF=2_d!=1c$g@0Jk[E0d&5*0f:XD0eb4:0fCmC1Gh'K
+>PW*2)-d=2(gaH0fM$I3AE931,(F?0eb:=/i>XD2`ENQ2E2g70JPF>0JG@:2*!BM2`!HN2CU1*
4>838-p014/1<V7.4cl00I\P80E                                               ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
