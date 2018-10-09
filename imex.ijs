NB. JOD dictionary dump:  9 Oct 2018 10:56:53
NB. Generated with JOD version; 0.9.996 - dev-k; 34; 9 Oct 2018 10:38:17
NB. J version: j807/j64/windows/release/commercial/www.jsoftware.com/2018-10-05T10:39:42
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |imex|235160827908276492214978469319720955563|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


dupnames=:] #~ (0 {"1 ]) e. (0 {"1 ]) #~ [: -. [: ~: 0 {"1 ]

mnl=:3 : 0

NB.*mnl v-- list objects in all registered dictionaries.
NB.
NB. monad:  mnl clStr | zlStr
NB.
NB.   mnl ''     NB. list all words in all registered dictionaries
NB.   mnl 'pfx'  NB. list all words in all registered dictionaries starting with 'pfx'
NB.
NB. dyad:  ilCodes mnl clStr | zlStr
NB.
NB.   4 2  mnl 'ex'  NB. macros with names containing 'ex' in all registered dictionaries
NB.   2 3  mnl 'et'  NB. groups with names ending with 'et' in all registered dictionaries

WORD mnl y
:

NB. (mnl) does not require open dictionaries 
if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
elseif. do.

  NB. format standard (mnl) (x) options and search
  x=.  3 {. x , (<:#x)}. 1 , DEFAULT
  
  NB. NIMP: validate options

  x mnlsearch__ST y
end.
)

mnlsearch=:4 : 0

NB.*mnlsearch v-- mnl model
NB.
NB. dyad:  ?? mnlsearch ??

NB. NIMP: validate reads

d=. >jread (JMASTER,IJF);CNMFTAB
if. 0 e. $d do. jderr 'no registered dictionaries' return. end.
if. fex f=. (tslash2&.> 2{d) ,&.> <(;(0{x){JDFILES),IJF do.
  r=. 0 2$<''
  g=. (<: |1{x){nlpfx`nlctn`nlsfx
  b=. DEFAULT ~: 2{x
  y=. ,y
  for_i. i.#f do.
    o=. i{f [ n=. i{0{d
    p=. >jread o;CNLIST
    if. b do.
      s=. >jread o;CNCLASS 
      p=. p #~ s = 2{x
    end.
    if. 0=#p do. continue. end.
    r=. r , (p (g `: 6) y) ,. n
  end.
  r=. /:~ r
  if. 0 > 1{x do. ok <dupnames r else. ok <r end. 
else.
  b=. (1:@(1!:4) ::0:) f
  (jderr ERR073) , f #~ -. b
end.
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QlrBE,K*$ATJu2DJUG4DJXB*@<,jk-RgSp4>8$7.4cl00I/>$/1<V7,VUYu
-p01/0I\P$4>J$8,Vh&.3&**@3%d*F2)d?M3&WQ81,(FB0eb:A/i5C>1,CXF0d&5*0fUmA0KCaB
1b^mL3&iZJ+>PW*3&**@3A*-G0ekI?3&EH71,(FB0eb:A/i5F>0JGLG3&2U30JPOA0JGL>1c7!B
1G^sD1+=b&4>8$7.4cl00I/>$/1<V7,VUYu-p01/0I\P$4>838-p014/1<V7.4cl00I\P80E  ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
