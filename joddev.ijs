NB. JOD dictionary dump: 28 Aug 2019 09:58:02
NB. Generated with JOD version; 0.9.999; 25; 27 Aug 2019 12:14:16
NB. J version: j901/j64avx/windows/beta-h/commercial/www.jsoftware.com/2019-08-28T10:04:28
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


ERR105=:'unreadable or missing backup timestamp'

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.0 - dev';26;'27 Aug 2019 12:22:06'

JODVMD=:'0.9.999';2;'27 Aug 2019 12:22:05'

MAXNAME=:128

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


backnum=:3 : 0

NB.*backnum v-- increments backup pack count and backup/restoration timestamp.
NB.
NB. monad:  backnum ia
NB.
NB.   backnum 0 NB. typical call

NB. HARDCODE pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (>:y{nums) y}nums else. nums=. 0 , 6!:0'' end.
((0{nums) , 6!:0'') jreplace WF;1
<.y{nums NB. integer result
)

backupdates=:4 : 0

NB.*backupdates v-- scans put dictionary backup files and returns
NB. backup dates.
NB.
NB. This  verb  attempts  to   read  component  index  1  of  put
NB. dictionary  (jwords)  backup files.  The resulting data takes
NB. these possible forms.
NB.
NB. verbatim:
NB.
NB.   1. bnum,timestamp - pack count and timestamp
NB.   2. bnum,0         - pack count and 0
NB.   3. _1`            - jread error - probably an older unreadable binary
NB.   4. _2             - trapped jread error - serious problemos
NB.
NB. dyad:  bt =. blObj backupdates ilBnums
NB.
NB.   NB. DL is put dictionary object
NB.   NB. bnums is a list of put dictionary backup numbers
NB.
NB.   DL backupdates bnums

NB. HARDCODE: component 1
uv=. >jread"1 (<1) ,.~  (<BAK__x) ,&.> (":&.> <"0 y) ,&.> 0{JDFILES
bstamps=. }."1 uv [ bn=. 0 {"1 uv

NB. format timestamps
bstamps=. (<"0 bn) ,. <"1 tstamp"1 bstamps

NB. errmsg: unreadable or missing backup timestamp
bstamps=. (<ERR105) (<(I. 0>bn);1)} bstamps
)

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
NB.   NB. three versions of a group's header - similar to (get) where
NB.   NB. (2 get 'group') returns the group header
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  
NB.   
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's word list

WORD bget y
:
msg=. ERR001

if. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. are backups present?
if. badrc uv=. checkback__ST {:0{DPATH__ST do. uv return. else. bn=. rv uv end.

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

bgetdicdoc=:3 : 0

NB.*bgetdicdoc v-- get backup versions of the dictionary document.
NB.
NB. monad:  bgetdicdoc ??
NB. dyad:  ?? bgetdicdoc ??

ok 'NIMP bgetdicdoc'
)

bgetdocument=:4 : 0

NB.*bgetdocument v-- get backup versions of object documents. 
NB.
NB. monad:  bgetdocument ??
NB. dyad:  ?? bgetdocument ??

ok 'NIMP bgetdocument'
)

bgetexplain=:4 : 0

NB.*bgetexplain v-- get backup versions of short object explanations.
NB.
NB. monad:  bgetexplain ??
NB. dyad:  ?? bgetexplain ??

ok 'NIMP bgetexplain'
)

bgetgstext=:4 : 0

NB.*bgetgstext v-- get backup versions of group/suite headers.
NB.
NB. monad:  bgetgstext ??
NB. dyad:  ?? bgetgstext ??

ok 'NIMP bgetgstext'
)

bgetobjects=:4 : 0

NB.*bgetobjects v-- get objects from backups.
NB.
NB. monad:  bgetobjects ??
NB. dyad:  ?? bgetobjects ??

ok 'NIMP bgetobjects'
)

bgslist=:4 : 0

NB.*bgslist v-- get backup versions of group/suite lists.
NB.
NB. monad:  bgslist ??
NB. dyad:  ?? bgslist ??

ok 'NIMP bgslist'
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
NB.
NB.   14 bnl '.'  NB. display pack/backup dates

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT

NB. special list backup dates case first
if. (INPUT=0{x) *. (,NDOT__ST)-:alltrim y do. x bnlsearch__ST y return. end.

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
if. badrc uv=. checkback DL do. uv return. else. bn=. rv uv end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

bdot=. (,NDOT)-:alltrim y 

if. bdot *. INPUT={.x do.

  NB. show pack/backup dates
  ok <DL backupdates bn

elseif. bdot do.

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

buildjodcompressed=:4 : 0

NB.*buildjodcompressed v-- builds a fully compressed JOD load test script.
NB.
NB. dyad:  blVersion buildjodcompressed blclDirs
NB.
NB. verbatim:
NB.
NB. Builds a compressed JOD load script.
NB. 
NB. Caveats:
NB.
NB. No error checking.
NB. Requires standard J profile.
NB. In addition to standard JOD directories this script also requires 
NB.   the staging directory: .../joddev/alien/stage/jod/
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 08may28 rename/relocate compressed script to root of jod addon
NB. 11feb05 use (jpathsep) to show portable style file paths
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 11nov24 tested on linux
NB. 14nov14 adjusted for j 8.03 (runs on win32 J 8.03 - not 64 - no zfiles)
NB. 15mar15 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17jan09 improve caveat notes for running on jconsole versions
NB. 17mar03 macro script converted to verb
NB. 19aug27 load task addon first for J 9.01

'JODSTAGEDIR JODGITDIR JODADDONDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make, date
'jodversion jodbuildcnt'=.2{.x
jodbuilddate=. alltrim tstamp''
jodbuildcnt=. >:jodbuildcnt

NB. increment build and save - must be done before 
NB. script generation to insure header and class JODVMD match
JODVMD=.(jodbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODVMD';WORD_ajod_;wrep_ajodstore_ 'JODVMD'

NB. set output files
JODFILE=. 'jod.ijs'

NB. working JOD addon script
JODADDONFILE=. JODADDONDIR,JODFILE

NB. backup of JOD script placed in put dictionaries script directory
JODSCRIPTFILE=. JODSCRIPTDIR,JODFILE

NB. JOD staging directory under put dictionaries alien directory
JODSTAGEFILE=. JODSTAGEDIR,JODFILE

head=.'NB. System: JOD  Author: John D. Baker  Email: bakerjd99@gmail.com',LF
head=.head, ('NB. Version: ',(jodversion),'  Build Number: ',(":jodbuildcnt),'  Date: ',jodbuilddate),LF
smoutput head

NB. turn off white space preservation during JOD load
NB. load task addon before executing any JOD start up code - changed for J 9.01
hc=.head,'load ''task''',LF,'(9!:41) 0',LF

NB. get preprocessor script - leave only header comments
s=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodprep'

NB. main JOD classes
g=. ;: 'jodon jod jodstore joddob jodmake jodutil' 

NB. collect group dependents 
deps=. gdeps&.> g

smoutput 'compressing ... '
NB. dewhite group headers 
h=. dewhitejscript&.> {:"1 >{: GROUP_ajod_ get g

NB. compress all nondependent words in each group (a cruncher)
code=. , }.@:compj&> ((}.@:grp)&.> g) -.&.> deps

NB. combine header and word definitions 
s=. s , ; , h ,. code

NB. append post processor script
s=. s, dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodpost'

NB. remove a few remaining redundant blanks after 
NB. assignments - their presence annoys me!
s=. hc , '/ =./=./ =:/=:' changenqt s

NB. save compressed load scripts
smoutput 'output file locations:'
(s=. toJ s) write showpass JODADDONFILE
smoutput s  write showpass JODSCRIPTFILE
smoutput s  write showpass JODSTAGEFILE
updateJODfiles s

NB. update build history - stored as plain text macro
JODBUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODBUILDHISTORY'
JODBUILDHISTORY=. JODBUILDHISTORY,(2#LF),head
assert. >0{MACRO_ajod_ put 'JODBUILDHISTORY';TEXT_ajod_;JODBUILDHISTORY

NB.byte size of generated plain text script
smoutput (":#s),' script bytes'
smoutput 'JOD compressed build complete'
)

checkback=:3 : 0

NB.*checkback v-- return list of put dictionary backup numbers.
NB.
NB. monad:  ilbn checkback baObj
NB.
NB.   checkback {:0{DPATH  

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__y do. jderr ERR103 else. ok bn end.
)

tstamp=:3 : 0

NB.*tstamp v-- standard j 8.07 library timestamp.
NB.
NB. A renamed version of the standard  J 8.07 era  timestamp. JOD
NB. used an earlier version of this verb, see (tstamp2), that did
NB. not handle all zero timestamps.
NB.
NB. monad:  clDate =. tstamp il | fl
NB.
NB.   tstamp '' NB. now timestamp
NB.   tstamp 0 0 0 0 0 0  NB. zero stamp

if. 0 = #y do. w=. 6!:0'' else. w=. y end.
r=. }: $ w
t=. 2 1 0 3 4 5 {"1 [ _6 [\ , 6 {."1 <. w
d=. '+++::' 2 6 11 14 17 }"1 [ 2 4 5 3 3 3 ": t
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
d=. ,((1 {"1 t) { mth) 3 4 5 }"1 d
d=. '0' (I. d=' ') } d
d=. ' ' (I. d='+') } d
(r,20) $ d
)

tstamp2=:3 : 0
NB.*tstamp v-- time stamp
NB. older timestamp - replaced with new J definition
yy=. <.y,(0=#y)#6!:0 ''
'yy m d h n s'=. 6{.yy
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
f=. _2: {. '0'&,@":
t=. (2":d),(m{mth),(":yy),;f&.>h,n,s
r=. 'xx xxx xxxx xx:xx:xx'
t (I. r='x') } r
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`)X31E\Fq0f1"21E\D++>u"u0fC.01E\D,+>Y_p2BXb1+?(E!1a"_"2DH=/0d&>5+>b2t2'=n%
2`;d=+>kns2BX_0+?(E#3D"Nh:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlot
DKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%isDf9H58l%iS:JXY_+DG_8ATDBk
@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)
@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs
@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk9gMlV5tsdb@<cL'F_r7;ASu.&BHV5*
+Co1rFD5Z2@<-W9DIIBnF(/QfCMn93Bl7F$ASl!rFE8R6@:O(qE$0+.@r!2sDfor>+CT.u+C\bh
CNXSLEb0<6DfT9.Bl@l3FD5T'F*(i-E+36cCNXT,@<?(%F(8WrF!,FEF<G+.@ruF'DIIR2+C\bh
CNXS=Anc'mF!+n/A0>o(FEMVAF!+q#@r$4++Cno&ATM<nATVs(FE2),G%G_;DdmHm@ruc7Ao_g,
+E2IF+Co1rFD5Z2@<-W9@UWb^F`;D2DJXB*@<,jkF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^
F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0@q]F`CLU^^CNO-/
F<G16EZfI;AKYr4ATMF#@q?d$Afu&8F<G+.@ruF'DIIR2+C\bhCNXS=Anc'mF*)JF@;Tt)FCB&t
@<,m$C*5KXF*(i-E&)NLD.Oi2FCB$*+E)(,ATAo8Bl.F&FCB$*+>"^VAT2Ho@qB0nGA2/4+Dtb7
+A*beAS,XoBln'-D?                                                         ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.1+>P&o0H`,+3B/-90H`A23$9q7+>GT*3?U%8+?2;;@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO
+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA
$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56
FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(SATMs.De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS
+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm
+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$;No?+>Gim@<++Y+CSekARlo3
E+*6lA18XCD]ib3F*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI8F*%iu%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1
+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ-
-Zip@FD>`)0JOpa$4R>;67sC&BOu3q+Dl7BF<G%(+CT.1DfB9*+Co1rFD5Z2@<-W&$>sEq+C]5)
+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k*GAR[8H1a`_>%16Ze+E(d5FC])qF:ARP67sC)DfTB0
+D,Y4D'3\6F*&O7F`MM6DKI"1@:O(qE"*.cEZeh/C`k)Q%13OO:-pQUFCfN8F!,(8Df$V6Df^"C
@s)g4ASuT4@UWb^F`7csATAnJ+C]5)+=ANG$4R>;67sBlF<G()FCfK$%16Ze+>P'KDJUFC-OgDo
EZd.\@W$!)-RT?1ATAnM+C]5)+=ANG$4R>;67sBiDJUFi:K(4d=WhQqEcQ)=F!,"2C`m>.EZfI;
AKYi.F*&O7F`MM6DKI"1@:O(qE$-_TAU%]rE-)Nr:-pQU@W$!)Df0B:+EM+&EarcoF!+m6F(oN)
Ch4`.F`\a:Bk)7!Df0!(Gp$R)@r$4++EV:.Eb-A-F!,@=+E1b2BFP;D67sBoASu!h+EV:.Eb-A%
Eb-A2D]j"-FD)e8Eb&a%+ED%7F_l/@+Dbb-ANCqV0Ha^W+CoA++=ANG$>"6#1a"Rs@W$!)-XT8;
<$re2:-pQUD.-ppDf[%4DIdI!B-;D4FD)dE?UR[h-Qm,@+CfP7Eb0-1+C\bhCNXS*$>"6#1*A=p
@W$!)-Z<NC+<VdL:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC+DG^9@s)g4ASuT4
@UWb^F`7cs%16Ze+>=om+>=pIDJUFC-QjNS+AP6U+CT)&+Du+?DK?q7DBNG3EcP`/F<G%$@r$4+
%16Ze+>=om+>G!JDJUFC-QjNS+AP6U+CT)&+CSf(ATD7$+DG^9@s)g4ASuT4@UWb^F`7cs%15is
/g+kGF*2M7+D#G/F_>A1@UWb^F`;CEAU%p1F<G16EZfI;BlbD=ATMr&$>"6#E+*6lA0>u)Bk)5o
$>"6#E+*6lA0>u)Bk)5o$4R>;67sC)DfTB0+D,Y4D'3e+Ecc#*F_kK,+C\bhCNXT;%15is/g+V>
@r*9+AftPk@r$4++Du==@V'R&A8cR2/0JM:3ZpOH/hnIr/i#480fL^>2D-^A/ho180f(F:1+k7;
-OgDX67sBmDfT]'FED))+EMHD@;Kmr@3BW0Ecc@FD..NrBHV28D.Ra%@j#i2Ecc@3$>"6#@W$=*
F$2Q,@W$!)-S?bU$=[d63ZpU@HX^l8D0%j$+FPjb@W$=*Et&Hc$>"6#@W$!)@V[)/+<VdL+<VdL
+<VdL:-pQU+C]5)+=Acr2^]^j+<Ve%67sBt@<?!mATJu&Cht5<DfTB0+DG^9B5)O#DBNCs@r$4+
%16Ze+C]5)+=D2@@OE^9CEO`B+<VdL+AP6U+<Y-2C`k*GAR[8H2^]^j:-pQUD..NrBOu6-@;Ka&
GAhM4F!,OG@<-I(DJ()9Bln#2-ZWd--Qm,@+D5D3ASrW"@:O(qE"*.cEZd%Y1E^.EC`k*:GUG%O
CEO`B+<XEG/g)8j+>Y-LDJUFCAU#g^2^]^j:-pQUGAhM4F!,%3A8,po+EqOABHS[6GUFVJDBNS+
G%GP6@UWb^F`7csATAnJ+>Y-LDJUFCAU#RR@V[)/+<Ve%67sB'0d&7p@W$!)-Y7NT0fLI&+AP6U
+EV19FE8R9DIdI!B-;D4FD)dEAU#RFBl5&+Bm+'*+C\bhCNXS*$>"6#1*A=p@W$!)-Z<NC/7NB;
+<VdL:-pQU+>P&p+C]5)+=D)</ho:4+<XEG/g+eIDfp#?+Cf>-FCAm$Bl7Q+F*1r5FE2)5B-8R?
A1&L6DBNS+G%GP6@UWb^F`7cs%16Ze+>=om+>G!JDJUFC674<nCEO`B+AP6U+CT)&+CSf(ATD7$
+EMX5Ecc#5B-;D4FD)dE673miDBNS+G%GP6@UWb^F`7cs%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m
3B9*,@W$!\D/X3$0JQ<h/h1=JCf>1hCLo1S+ET1e+=L]:CagK;Ble60@<iu7@:O(+@UWb^F`8I6
@<?(%/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2
@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8C2[W:0II;:
:-pQU+:SZQ67sBjEb/[$ARmhE1,(FCD..H?1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'
AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2
AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:
0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBpDKBr@AKZ2.+D>2,AKZ&4D.Oi!@:O(q
E,uHqATAo4@:O(`+EV..@rr.eATAo4@:O(`+EV..@rr.e%15is/g+)+Dg*=8D.7'eA7]9o@UWb^
F`8I6@<?(%/g+,,ATME*A79RkF!,[@Cht5&E,]AsEX`@N67sBhF!,d?Ec3(2@<?(%+DG^9Derrq
EZeh"@r$4+F"SS6Df''-Bl.F&+A*bcBl7@"Bk;>p$;No?+Cf(nDJ*N'F)N1<F^o)-FD,*)+DbJ.
ATAo:ATDj+Df0V=@ps7mDfd+BART*l%15is/g,(KA7]d(@VK^gEbT*+/g*`'+EV:*F<G(%F(HJ.
DKBo2@:UL!AftM)A79Rk%15is/g+S?+D#S6DfQt;ATMp$B4W30Bl%T.@V$ZmBle60@<lEp/e&/!
EZd(n+C]5)+=Ach%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4
ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,%16`ZF@9hQFCf]=;f-GgAM>f5
67sa#ATU=S@ru:,FAm$pCLo1R+ET1e+DGY.F`VYF@<?''-td+5.3N/8@ruF'DIIR2+EV1>FE9&D
$;No?%15is/g+,,BlbD=ATMr9Bl%U.F*)G2FCfM9F)Po,+<koA@r#Y$/RiX:+s8:Y.3N&>B6A'&
DKI"2De*F#+E(j$$;No?+=Ll6F=A>VBOu'(An?'oBPD?s+EV:.+<Y3/@ruF'DIIR2+<Y35@s)X"
DKIKR<+ohcA8,OqBl@ltEd8*$:-pQUA8bt#D.RU,+DGm>@3BW*DJ*cs+Cf41De:,$H$!V=/e&._
67r]S:-pQU<+oiaAKYK$A7]g)A7]dqG%De.Ec5e;DffZ(EZccCATT@DDfBf4Df0VK+A!\cDfol,
+CSek+Cf>#AISuA67sC&D]g6EAS6.%@<-(.AKi7=BPDN1+C]J8+CT=6FD,6,AKYE%AKYDtC`mD"
Ec#W(F)rI<F=2,P+Du+>%15is/g,@VEcbt;Blks:$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is
/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^
@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(FCD..H>2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9
@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG
$4R>;67sBhCht59BOu6r+D,2,@q]Fp+D58-+EV:.+ELt.AKYMt@ruF'DIIR2+EV1>F:ARgEZd4^
B4Z0--RT?1ATAnN+?(EUATT%B-OgDoEZd4^2]sgtB4Z0--RT?1ATAnN+?(Ds+D58-+=ANG$4R>[
ATAnN+?(Du+D58-+=ANZ+AP6U+ED%8F`MA@+D#S6DfQ9oDImi22'?6b+<Y<.F<DqY%16uaEZd4^
2]sn!B4Z0--RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?`JFA61gDIIBn;f-GgAM>f567sa,
F`^>dG]$r,AQ*GaCLo1R+ET1e+EV19F<F:D=AD.V73HDXDJ+')+Cf(r@r!\+$;No?%15is/g+SD
F*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp"[]F(Jo*FCfN8+CfG'
@<?(&ATMs(Bk)7!Df0!(Bk;>p$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N
;cGDlATMs.De(OU-OgDX67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3Gi2F0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo
Eb065Bl[c--YdR1FCfN8ATB.-$4R=O$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eY
Eaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,7Y
Ec*"F@;TjmEZf:<+:S["ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=
5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgDoEZen3
F(KG9-W3B!6s!8X<(//D$4R>;67sBt@;BEsDIIBn+EVO?+Dbt6B-:W#A0><%F(o9)+C]8%F`S[K
@;L't%16QYB5DiV3ZoeZBkM7-DIIBn-S.tX=AD.V7:0J<De*3"-W;B%$7K@tB5DiB4ZX^"/g)nl
1(=R"$;No?+CTA6ASlC.+EVNEE-67F/Kf+JDfol,+D,%rC^g_hATAo8D/a<0@j#`5F<G%,B5Di9
%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F;                                    ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3%uI7+>Y,p2'=Xs3Arf=1,'h++>GQ)2'=V-+>P&o3B0#U+?(Du+>u2;+>GPm1*AJ71GBq+0d&4o
0f1UD+>Gl!1*AG62'=V4+>P&o1Gq0b:IINL8PDNC8Q/Sa;HYb4$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqh1*B;"EZd+k0f^@22``]M3]&Mt
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf
1a#)'EZd+k0f^@23BAiM3\WN#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&
+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@22EEZK3]&`%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqh2]tD/B-8r`0f^@20fh!B3\rGs
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]tD/
B-8r`0f^@20fh*F3\rc'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3?TG2F_PZ&+AR&r@V'R@
+>Pes+@KX[ANCqh2]tD/B-8r`0f^@21-.-H3\`N"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp1:+@1-_+>PW*3?U%33\iHO0Js20:IJ/X:J=\R<CokP
84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[
ANCqh3?V%)Gp"jr0f^@22EEZK3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,g=AF_;gP0JPR10ek^C0KM!F$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_
1,(FC+>GT31GLpI0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%33\`HP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh2]tD/B-8r`0f^@21-.0G
3\WH!BPDO0DfU,<De(UX%13OOB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9S]n0J5%%A7]p,/KcH2ART\'Eb-@\Df'H0ATVK+;IsZU
@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@+EML5@qf@f
+CJYrCg\Aq@<6!&@:Wn[A0>u4+Co2-E,8s.+C\bhCNXS=Anc'm+Cno&ATJtG+EM+*+CJr&A1hh3
Amc&T+:SZ#.Nhr'@V97o?m&'aE-ZP:EZe%a@U1B2%13OO+=\KV?ug*l/0J>@FECn5@:X+qF*(u(
+EVNEF*2G@DfTqB@q]:gB4Z-,FDi:00fU=;1ghpF$4R=b.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4
+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhuG\M#;D%-gp+<VeCASu.&
BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#
+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+q
F*(u(+EVNEF*2G@DfTqB0fU=;1a$:A@;]^hF"Rn/%14=),9SZm0J5@G3$9dq7V-%LF^]<9+>G](
+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>
A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!E[<Ip7<iclATMp,
Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3
$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5G
AM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm0J5@G2BXRo:LeKb@V'R&0f1F(1,(FB%13OO
+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNE
F`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0
+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(
Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96
/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[
A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*
+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&
G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1
@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*
F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,
F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5
Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&
0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9
-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)
CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.
?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-
ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&
F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:
DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@
%144#+<VdL+<V+##mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1
@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<
+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&
ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+
F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.
DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5
CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a
+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\
D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"
DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4
FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''
8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL
+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:
E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad
-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'
AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*
AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&
,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7
+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8
F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#
Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:
GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL
+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4
+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,V
Bl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79Rk
A1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lg
C3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3
Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+D
E,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL
+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LA
De*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf
$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*
+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL
:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<
-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/
%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5
FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG
@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6
De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+
BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<
3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.
A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(
@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6
$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t
@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b
/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o
@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(
BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)
Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopn
AKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1
ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=
De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nl
AR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bh
CNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&
0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U
+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<
?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%
67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50
@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:
/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7
E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`J
E,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&
FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+
@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N
+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*
+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S
+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdS
Eap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-
+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4
+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&
@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6
+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[
F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&
E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+
FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeK
Bl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;s
AS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0
@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$
+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.
FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;
A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.
+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."
Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#
EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#
+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6
DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk
+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ
9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$
+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr
<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKr
ATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9
AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53
Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G
$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57
B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u
+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'
ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89
-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj
+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0
?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2?
?k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'
Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%
+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<
%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/
%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e
,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h
+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"
Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C
+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'
+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+
G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.
@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'
DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$
F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7
Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(e
FCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_Soa
A9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2
$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7
EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\
A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H
%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2
+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>
D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+
BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!
ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'
0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pA
DJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0
EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k
9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&
F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]Tu
Eb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7
E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(
F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+
:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5
Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=
+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#
+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q
@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'm
F"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL
+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6
Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE
@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3
F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,c
A7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&
@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO
=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;
F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;
E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LG
Bm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)
+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-
E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR
?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:g
B4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9A
Eag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s
/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0
$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb
$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3
?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu
+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/
+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,dd
FCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL
+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8
@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%
+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555
C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWn
Ec6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3
F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu
0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW
:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(
H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.
C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5
+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o
04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1
A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2
+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;
+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>
+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb
%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8
BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj
+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA
7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<
DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@
DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6
@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19
F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!
Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jG
F*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,
E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=
Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2
AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=
D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6
%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7
EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8
%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-
EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).
F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#
+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,du
AKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj
/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!
?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1
+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(
C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm
+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/
A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]Ld
ATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$
+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6
/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E.
/iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.
@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF
+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO
+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH6
78Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!
Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%
%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XTo
AKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj
0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:Njk
Eb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)
Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>
/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&
%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(
Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5
ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m
:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6
DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWj
Dfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"
F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79Ro
DJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E
%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$
De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*l
Df-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX
6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;m
FCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!
$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1
%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE
@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8
AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4
Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5
+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lF
F>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"
ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*
Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOt
AISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35
%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0
+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/
+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&
?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO
+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>d
BPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rm
ARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH6
8l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7
C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeN
DfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1
De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(
A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=
BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,
B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A
@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#
+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!
@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2
+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh
+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q
7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi
:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J
3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>
F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'
ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30
BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et
+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7
DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh
+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht
9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhD
F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARloo
H!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(n
DJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<
;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho
@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&
A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4
+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%Nn
G:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0
+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b
/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LA
B4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-
0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.
F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:Wag
AoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6
ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+
EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO
+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./Kdbr
Gp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^Z
ATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%
ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]
F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*
DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoC
E+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(
+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8.
/o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16igA8lR#E&'.C
67sa&De*g-AT/c5/M/);:IH=EEb031De!@"F)Q(AF(96)E-*]A$;No?%15is/g+)7@<?'tASuU2
+DG^9FD,B0+EM%5BlJ/:@<,p%AU%crF`_2*+C\noDfTD38l%htBlbD5Ddd0fA1e;u%15is/g,7S
E$/t.G%GJ4ATDg0EZfIE@;m?$DfQt1DfTD38l%htGAhM4F!(o!C2[X(Am]7eDe*2t4ZX]>,$uHS
+=BcW6m,E2;cH1[+@\Xg9N=tZ3Zr6IF*&Ns+D#S6DfQsP4s23s?Q^mB><3l]1Eee61*@ql,$uHs
+C,E`%16igA93$;FCf<.@<?0iH=&fr1E\_$0F\?u$;No?.V`m4F*VhKASlBpFD)e?/M/)a@<?0*
De:+a:IH=HH#n(=D'1DQ0-G@JEc#N.@<?'k/e&._67r]S:-pQU:2b5c3ZrTSCh[E&AoD]48g$#E
0JO\YDIaku@W-F$/e&._67r]S:-pQUD/X<#A3(hUC2[X(H#n(=D/`p*BHUf$:hFEXAISuA67r]S
:-pQU+<YE;A93$;FCf<.@<?0*-YdL,F*(u6-OgCl$;No?+Co%qBl7Km+A*btH#n(=D'3Y5@psIn
Df-!k-u*^0FD)dEIUQbtDf0VLB4YslEa`c;C2[W9-RgTl+:SZ,%13OO@rGjn@<6K4-Xgb.A1%fn
8khTM<(0\J3Zr0UA93$;FCf<.@<?0*-YdL,F*(u6-QjNS+<VdL+<XEG/g+\9AmoguF<GF/F*(u6
+=J]lBkh6/+D,>(AISu=:IJ#W:I[K.+DPh*F*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(aF+AP6U
+Co%q@<HC.+E2@>Anc'm+EM%5BlJ/'$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%ht
A8,OqBl@ltEd8dHEc5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H
+B)]lAKZ).BlbD<@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$;No?%15is
/g,@PFD)e=BOr<(@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?
ARfk)ARlo+@:jUmEZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k
/g*`-+<Y0&DBL'2AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-
DJ()'DK]`7Df0E'DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8
+Dl%;AKZ).@;[3+DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4
+CSc%Bm+&1;FOMQ<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&
ATJu9BOQ!*Ao_I&F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+Df]J4A8,Oq
Bl@ltEbT*++E_XADBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&
F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-
FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is
/e&._67sBhF`_;8E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49
D%-g]$;No?+EM+9+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBt
Bl7X%F_r7?EbTE5+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q
3?^F<0d'[C3"63($;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%
EZf14DKU1WD.-p-BlA&%$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ
@<,p%Ecl8;Bl7Q+D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)V:-pQUD09Z:BlIm"+A,Et+DG_7
FCB&sATJu&Eb-A4ATDX%FED))+C]J8+Du+>+ED%'Df'?&DId<h%16WbF(KG9-W3B378uuM-OgCl
$;No?+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(
@j"B>6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQUDg#]4EbT&q+@S[c:JOha9LU'U+EM+9
+=Lu7Df0W7Ch551G\&<HARoLsDfQsP+E_a:+D,b4C`m\*FD)*j:-pQU:.\/V3ZqpTEcP`/FDQ4F
779L=:/aq^73H;c+EqO;A8c[5+E).6Gp"[]F(Jo*G%G]'+=LfC.3K',779L=:/aq^7:0J<De+!4
Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%>YSpBEc6#;Aoo.r;]nGGA7]"UDe*E3AU%c1-OgDX67sBL
6pjaF;bp(U?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/FCfE"A1K08DJsW.
E+*9-.kYCXAKiK2$4R>;67sC'F(Jl)@X0);Df'&.D.-ppDf[r^=%GbX76sX>4ZX]I0Hb]b4$"a&
Df'&.GAhM;+EV19F=.M):-pQU=%GbX76sX>4ZX]5BQ%a!-OgCl$;No?+=Lr=De(:>ATDg0E\APP
ATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"ADIIBn+=LuCA7o7`C2[Wi.3NMH
F<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu-u*[2F'iWrDe*3(+Du+>+EM+9
-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7QfnASbq"AKYo#C1UmsF!,(8Df$V,
F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#d
De*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDk
@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGTA7T=nE$0EKAScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA
-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:
%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+Co&"B6%r6Gp$[7
F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9$;No?+ED%*ATD@"@qB0nGAhM4
F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84
A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb
+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!++FPjbB5T.@/M8/YD@Hq%%144#
+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4Eb#UdF_<iu+>Y-$+>=63BkAt?
/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;u
BkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&/5+E_a:A7Bg,
I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5E$/S,A0>r%G%De4Ddd0!F(96)
E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g,"IF!,49A7m#rCia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gIE-67FA8,OqBl@ltEd9)VGAhM4
F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT3ZrHSG&IfsFD!`t+>P9aAThu$
$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*Bl8$(F*&NV+CoD%F!,@=F<GXH
Df?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?+EDUB+DkOsEc3(ABl%?uFDQ4F
/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4$4R>;67sC%BQ%p5+D>>&E$/b2
EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6%16ci4ZX]?+D>S1DJUG"3Zri'
+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*
Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eIDfp#?
%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef@p`YZ
De*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1AhG38
@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U/g,Qp
+En8%.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+
GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;
$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'
1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,1E\_$
0F\@C+D>h;+F+D'3XlF1AhG38@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8Ec*KP
ASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;D_</N
CL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'5Xd:J
G9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is/g,4L
DJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)DfT@t
$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0FCfN8
-QjNS+<XEG/g,7IF*%iuF)5E44ZX]A+?CW!%14d3F)5E4+F+D'3XlF1AhG38@:Wka?X[\fA7$I#
CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&DKK5m
8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIE
AS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?Qa5L/g,1GG&JKN-Qlr</g,$S
Eb0?8Ec*KPASu$2%14M$/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+Ds=pI4fCH$7QDk%15is
/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RVYU
/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[FDP;m
C2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl$;No?
+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ3aEk4
+>G$#1+"ac$4R>;67sC"DfTr.@VfTu@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsE,Tc=@q]:kF$2Qg
3ZpF+3]A0/.k<,#.k<,#.sror,$uHs+C,E`%15is/g,@PDId[0F!,:A@qfI^+Cf>-F)Pl++C]86
+CoM$GA1r-+Cf(nEa`I"ATDi$$?p3%Ch$sg@<-EP3a4Wf3?^FB+=LYNH[[\-.qpUj0e";R+Boso
%13OO:-pQUARoLs+Cf>,D..<m+:SZG:IA,V78?fL:JFPL:..6++=D5DDg-//F)rICEZc_WH[\_=
I4$Bi%13OO:-pQUEb/Zi+=84TEbTW,+D,>(ATJ:fEb/Zi4ZY;@3\_s0?!oc[/grM2-9a[C1Eee5
.4H\T$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$?B]dA8Z=.DEU$:+Z_AD-nul+0d\;S
?p$\,-o3V*5!UMP+Z_;+.4H\T$?pN)FCf?.F`'?'-sJ_T1Eee6+Bp9;-nul+1*Bk14?tMI1GU:@
5U\E33\W!3.3Mn*$4R>;67sC$ART*l<'`hnA7]RkD/"*'A0>u&@VfTuAnc'mF!*%WAmob&ATAo8
BOPd$-urm-A9;?2+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?B]dA9;?;4ZZe.+?V_<
?SWrl+=K6s@4iuO/1)u5INViU+?V_<?SWa.3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_
/h%uO.3L#n1OEO_.3L2pINU?g3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$4R>;67sC)EbTW,F!,R5
@VfUs+CT=6<'`hnA7]RkD/"*'A0=Q8+EV18D/!lrFCeu*FCf]=+>"^WAS!!#Df021A8bt#D.RU,
+DG^9.!9WGCi_$7$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4K]g><3lT><3lT
>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'5U\0K-o!%s/0Zet5U\3:5U\*7
03g+R0gI-M-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f.3MhU+FPjd0d'[]+?Lc%+=K6s
@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/+CT.u+CT>4De!KiFCcS)
De*Dg$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U+=]!cG]XB%D/)3p>p)3O1,0t[
+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%67sB1/o>$;CLh@-D@HqiEBQ?g
+?L]%0HsjH4!80X+<Ve%67sB1/ou#K%16rs4ZZjk4!6:6,$uHS+D5d=+<XEG/g)VrFCf\+$4R>;
67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-EbTK7%17#p4ZX]5Bkh]:-6tVp
3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=/0H;m-Qjr_-QjcZ/M;Jp>:C!g
+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&DfU+4$>OZG3a4WfEb/Zi+E)<1
$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq$>OB?3Zoh)+Z_;+5\bBM$4R>;
67sBsDdd0!C*7S-EbTK7+D,Y4D'3>,DJ!TqF`M&(+DN$<@<?/l$>ONC3ZqWf+>=s"0HaR\+?Uc]
E+*j%%13OO:-pQUDKTf*ATAo3Afu#$C1UmsF!*%WF`V,)+C]U=G%#E*Dfp+D.!9WGCi_$JD.-pp
Df[$LF(or3E-67R+CSnoE-67R+>,9!.3N>:+E2@4F(K62%15j+6;p$.+>GPZ$4R>;67sC)BOu3q
+CT+08K`.sARlomGp%0HD.Oi,@:O=rF!,X7Cis<1+=DAOEbd$FDfQsJBQ%a!-OgDX67sB^84?EF
5tsp63ZoeoDfTV@%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.
E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^Y
F(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'
C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?
+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5
ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7B
Ao_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a
:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&
DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[
E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g+
+EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@
D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgE"@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et
%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0J5@<3B9)I%15R#
9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp
6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gk
C2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/p
CG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A
%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6A8bs2
C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm
@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46
Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"
@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2
.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5
DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7
+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/
FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$
ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH
6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RC
EZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,u
DBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeu
FD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl
$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#
+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdh
AKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH
6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-SR/5/ibpO-OgDP
:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\
ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8
A1hh3Ado(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3
DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH+
+DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=
<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`
+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b
@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm
:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6
-SR/5/ibpP-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$K
C3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^
78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>
+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7
F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[
@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/
A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7
F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et
+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//
AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1
/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt
@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7
+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+
BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht
+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$
EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC
@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT
@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:Wne
DK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>
BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)%14Nn$3                                               ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),<<;.'
zz=:zz,'_1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN C'
zz=:zz,'NLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 '
zz=:zz,'ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR0'
zz=:zz,'60 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 E'
zz=:zz,'RR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR08'
zz=:zz,'0 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ER'
zz=:zz,'R090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099'
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 INVGROUPS INVMACROS INVS'
zz=:zz,'UITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 O'
zz=:zz,'K056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT '
zz=:zz,'READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwords'
zz=:zz,' backupdates badcn bgetdicdoc bgetdocument bgetexplain bgetgstext b'
zz=:zz,'getobjects bgslist bnlsearch bnums checkback checkntstamp checkopen'
zz=:zz,' checkpath checkput closedict createst defwords delstuff delwordref'
zz=:zz,'s didstats dnlsearch dupnames freedisk freedisklinux freediskmac fr'
zz=:zz,'eediskwin fullmonty getdicdoc getdocument getexplain getgstext getn'
zz=:zz,'tstamp getobjects getrefs gslistnl inputdict invappend invdelete in'
zz=:zz,'vfetch invreplace islib iswriteable iswriteablelinux iswriteablewin'
zz=:zz,' jdatcreate jwordscreate loadalldirs loadallrefs loadwords mainddir'
zz=:zz,' mnlsearch newdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx'
zz=:zz,' nubnlsfx opendict pathnl pathref putdicdoc putexplain putgs putnts'
zz=:zz,'tamp puttable puttexts putwords putwordxrs rpdtrim rplctable rplcwo'
zz=:zz,'rds sortdnub''                                                      '
zz=:3095{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`/0d&Fu1GLjLC2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9
B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'
+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]Rg
FCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/
@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is
/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>
ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5
Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07
ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt
@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)
AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$
:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG
@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG
+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%
+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS
@:O(`.1HVZ67sB'+ED^J+<VdL+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8Z
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
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X(FDl22:-pQ_C2[X(
FDl22+CcuT+EMXCEa`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?
+@p3WATJu9BOr</DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is
/g+\=@ruF'DIIR2+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is
/g,1GEHPu9ARlp*D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is
/g+2+Eag/*DKKH1Amo1\3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@lt
Ed8dAF!,C?ASqqa:-pQU+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8
Bk)7!Df0!(Gp%'7FD)*j:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,Oq
Bl@ltEd8dAF!+m6E-67FA8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'
DIIR"ATJ:f:-pQU+<Y07ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU
+<Y3+Ap806A9/k9+<Ve;AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIa
FE7lu:-pQU+<Y3/A92j$FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,
@<?4%D@HqJ67sB'+CoA+F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.
FC]<"F_t]-F<D]=ATT&5@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-
F(fK4F<GL2C1Ums+D#e:Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]Tu
F*22=AKZ&(EbTK7+EV1>F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u
+DbJ-F<GOFF<G[>D.Rd1@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8Z
B4Z1*AS-!++<VdL+D58-+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9
Blmo/DIIBn+Dbb5FE7lu:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:
Bk)7!Df0!(Gmt*U67sB'+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9
G%>0#ATVK++<Ve;ASbq"AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,
G%G]9ARloo@<>oe$;No?+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8Z
DIn$4AS5Of@rrh9+CfG'@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m
@rrh9+<VeFE+No0@3B)p@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;
%15is/g)8ZE-686G]7J-Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8Z
E-688F!)SJ+<VdL+EMXCEb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXC
Eb-A2@;TR,+CfG'@<?4%DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<
+<Y`IDfTD3-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68E
AU&<<+<VdL+EMXCEb-A3@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO
67sB'+E2IFGAhM4F!)SJ+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4
+D5M/@UX'qEb/ioEb0,uATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lG
De*p2DfTD3Ea`iuAKWZa0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4
De(4)$4R>;67s`uAT23uA7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0
:/+#P90G<i+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k
6V^<H;cGn@1a!n`+<Ve%67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE
:.%fO:fBM<2'="a+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4
%13OO:-pQUD..-r+Co2,ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*
9M&/^/430":JFYa%13OO6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn
+Cf4rF)rIBEZf4-@rcK1FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1
DBNk,C1Ums+Eq78+D,>.F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(
F?1OTBk)7!Df0!(Gp$X9@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(
AKYK$D/aE2ASuTN+EM47Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^A8,OqBl@ltEd8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3
DIm^-3Zr6IF*&OHBl.E(DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"
@q?cmDf'H3DIm^-+EV%$Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,Lo
ASu!h+E1b2BHSlL-tI%&DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-
3ZrKXH=\4;Afu#$C1Ums+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMl
FC?;(Bl%?'@rH4'Df0-(FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W
8PT^%8PW;b<Cp.Y;a!/a8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&
@3B/rCh4`!Df'H3DIm^-Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)4
6V^QO>"'u0:.88]9L26F%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8
+Cno&@1<Q8:0(=_;cH[Y3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO
:-pQUFE2)4+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,p
A9;j+D*9pc+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#
Er                                                                        ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests bnlSmoke00 bnlSmoke01 compjSmoke00 compjSmo'
zz=:zz,'ke01 didSmoke00 dispSmokeUnicode00 dnlSmoke00 dnlSmokeMacroTexts ed'
zz=:zz,'Smoke00 globsSmokeAssign000 globsSmokeDoc00 grpSmoke00 jodageSmokeD'
zz=:zz,'ays00 mnlSmokeArgs00 newdSmokeBadArguments00 odSmokeArgFail00 rxsBa'
zz=:zz,'dSmoke00 rxsSmoke00 rxsgetSmoke00''                                 '
zz=:302{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkiU;DBj_+A$lO:IJo7FCfK)@:Njk8U=!)7!*?cCi^^jH:gt$F`_>8FCfK)
@:Njk8l%iS:JXY_<_Yt)8l%iU9gg*u6!-lJ9gp16@:O(jF_r71@:O(qE+EC!ATJu'B4Z0-@V97o
A8,OaDdso!B4Z0qDe!p,ASuT4@V97oAU&01@;0U%@V97oB6/0+G]Y';B4Z1'@VTIaFE8R6B6.m'
F*&O6DJUG)DJXB*@<,jk+C]J-Ch.:!A7KOpE,oN2F(Jl)@q]F`CLU^^CER_?FCB$*+EV[H@;Ts=
-RgSp4?P\X?SNZN+C]5)6=FqL@k]V[@W$!\D/X3$0JO\_ATU=S@ru:,FAm$pCLo1R+E2IF9jr9a
@;TRSD/X3$0JFk'/1<VC4"akp+=A:HDe'u*De*p2DfTD:.4cl0/3G:pDe*p+Deip+ATMs7-RgSp
4?P\X?SNZN+A,Et6<-TN6qBmJ<)6Cp+A,Et<)6:`;aOJU9LMEC;cHOj=WhBlF*)>@H"q8.+DPh*
E,oN/+DPh*E,ol/Bl%?'D..<rAn?%*C2[W*D..<rAn?%*C2[WnDe!p,ASuT4D..<rAn?%*C2[X(
Dfp)1ALAoX-p07-1,:+10JPRA1GU^<1c7*F1-%*H2]sk00f^pD0f1LA2`<NK1,UsM+>PW*3A<6D
1bL^G2Dm6F2)[H;1,(FC0JbF?/iP^I2)6pE2E;m80JPRA1GL^=2`EWP1,q!B0d&5*0f^pD0f1LA
2`<NK1-%*K+>PW*3A<6D3%d'K2`!<K1c@-41,(FC0JbI=/i5CC0JG4?3A_j60JPRA1GU^<1cI-C
2`<KM3?U(20f^pD0f:R@1GUmI3A<6L+>PW*3A<6D2(gaG1GgdD2_[!01,(FC0JbF@/i>UG3&<9K
1,pC30JPRA1GLa>2)mEI2)I'I0d&5*0f^pD0f:R@3&`cV0JkaH+>PW*3A<6D2(gaG0f:jD3&E?4
1,(FC0JbF@/i>XC2`*EL0d&5*0f^pD1,:I=3ArZQ3&!'A+>PW*3A<6D2(gaC3AENO3&io@1,(FC
0K:gH/i>=C1Gq'I1Gp:10JPRA1GLa>2)I3F1,M!J0d&5*0f^pD1,:I=1G^sL3AEHQ+>PW*3A<6E
1+kC=3B/lQ2D['11,(FC0JbI>/i5FB1,:jF1cHO40JPRA3&3EF2)-sE1H.!I1E\G,0f^pI1,ggC
0f:aC2_[3I+>PW*3A<EJ2_HsB2)@$I0K:j21,(FC0K:gH/i>@@1GppF3AM^40JPRA3&3EF2)-sE
1H76M2BXb/0f^pD0fUdD2)@!A3&N]U+>PW*3A<6E0eP:>2E*KQ2_[!01,(FC0JbI>/i>FF3&EQR
1H$@20JPRA1GLa>2_d0K1H%!K2BXb/0f^pD0f:R@3&<BF2E*<F+>PW*3A<6D2(gaG2)mBH3&3H9
1,(FC0JbF@/i>UH0JG=C2_lL20JPRA1GLa>2)mNR3A<9L2'=Y.0f^pD0f:R@3&<?I1,:aJ+>PW*
3A<6D2(gaH3&`NH1cI971,(FC0JbI>/i5RH1H7?J0eje+0JPRA1GU^<1c[HK0fCjG3?U(20f^pI
1,ggC0KCpH2Dd3I+>PW*3A<6D2(gaE0JYC=0f1U-1,(FC0JbI>/i5@A1c@9N1H6L40JPRA1GU^<
1bq'N2)I3I0e"Y%4>J$9,Vh&.3A<6E1+kF?2)I<I2`)X40JPRA1GU^<2)R'B2Dm?L2BXb/0f^pD
0f:RA1c$jB0eb@C+>PW*3A<6D3%d*I0fCaA2)RB:1,(FC0JbI>/i>FE1-%<O0fL410JPRA1GU^<
2)R-C1-%*E2'=Y.0f^pD0f:RA1c@?L1c%'K+>PW*3A<6D3%d*J0JPRJ0K(^9/1<V9+>P2t0JPRA
3&3EF1cI0F3&i]L1*A>+0f^pD0f:R@1c@0H3AN9C+>PW*3A<EJ2_HpG1,:gK1GU^.1,(FC0JbI>
/i5LA1GC^H2Dcj6-p07=0f^pD1,:I>2)7*L1cRKQ.kiS00JG7?1,q'K3&NWK0K2!O0JbR9BeD.`
0e"Y%4>J$=,Vh&.3A<6D1bL^G2Dm6K3AEB61,(FC0JbF?/iP^I2)7*N0f:(/0JPRA1GLjA2*!TL
1,^gD1a"P-0f^pI1,ggB2)mBH1-%061,(FC0JbF@/i,IE3AiZN1,g=20JPRA1GL^=2`EWP1,:dF
1a"P-0f^pD0f1LA2`<NK1,h$H+>PW*3A<6D1bL^G2Dm6F2`*?61,(FC0K:gH/i>@@1GppD1,g=2
0JPRA3&3EF2)-sE2)I*K2]sk00f^pD1,:I@1,LjF3&rcQ+>PW*3A<EJ2_HsA2E3TN1,Ud/1,(FC
0JbFD/i5CF2*!WM2E)a60JPRA3&3EF2)-sE1H.<L3?U(20f^pI1,ggC0f:aC3&39E+>PW*3A<EJ
2_HsB2)@$J0K1s?/1<V7.4cl00I\P$4>838-p014/3GT                              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
