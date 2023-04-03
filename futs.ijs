NB. sha256:efe49b10450b58924dfdd211b04cf2d77c4f1678e61bb7312209e17c6d358172
NB. JOD dictionary dump: 03 Apr 2023 10:56:50
NB. Generated with JOD version; 1.0.25 - dev; 12; 03 Apr 2023 10:47:11
NB. J version: j9.4.1/j64avx512/windows/commercial/www.jsoftware.com/2023-02-27T15:21:53/clang-15-0-7/SLEEF=1
NB. JOD put dictionary path: /futs/utils
NB.
NB. Names & DidNums on current path
NB. +----+---------------------------------------+
NB. |futs|320288967029508900722674676326172133779|
NB. +----+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


DAYSECS=:86400

IFACEWORDSriseset=:<;._1 ' fmt_today iau_today loadstars nav_today riseset'

J2000ymfd=:2000 1 1.5

JULIAN=:2460030.5

LIMITHORZ=:20

LIMITMAG=:3.

LOCATIONNAME=:'Meridian'

OBLIQUITYDMS=:23 26 21.4480000000000004

OBLIQUITYDMS2000=:23 26 21.4480000000000004

OBSLOCATION=:_116.375956000000002 43.6467749999999981

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset fmt_today iau_today location_home location_uluru location_yellowstone nav_today'

STDALTITUDE=:0.566699999999999982

UTCOFFSET=:6

VMDriseset=:'0.9.0';14;'02 Apr 2023 15:36:16'

riseset_hashdateurl=:<;._1 '|684ed88ad772d3e8472fd239c34f0dc3909b799c432a9bd5e523b6d9281105ca|02 Apr 2023 15:36:16|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


alldifs=:([: >: [: i. [: - #) {.&.> [: <"1 (}. - }:)^:(i.@#@[)

apparRADEC=:4 : 0

NB.*apparRADEC v-- apparent RA and DEC for epoch (x) from J2000.0
NB. RA and DEC.
NB.
NB. This verb adjusts  J2000 RA  and DEC  coordinates to  another
NB. epoch. The  method  is based on  Meeus  (20.3)  pg 126.  This
NB. calculation  ignores stellar proper motions and assumes  that
NB. (y) RA DEC  values are J2000.0. The  resulting  positions are
NB. accurate   enough  for   basic   rise,   transit,   and   set
NB. calculations.
NB.
NB. dyad:  ft =. flYmd apparRADEC ftRADEC
NB.
NB.   2028 11 13.19 apparRADEC 41.054063 ,. 49.227750
NB.
NB.   ({."1 ciau)=: {:"1 ciau
NB.   2023 4 22 apparRADEC RA_J2000 ,: Dec_J2000

'zet z th'=. zetzthT0 x  NB. final epoch t
'ra dec'=. y             NB. J2000 ra,dec

NB. meeus (20.4) pg. 126
A=. (cosd dec)*sind ra + zet
B=. ((cosd th)*(cosd dec)*cosd ra + zet) - (sind th)*sind dec
C=. ((sind th)*(cosd dec)*cosd ra + zet) + (cosd th)*sind dec

NB. NIMP star close celestial poles

NB. new dec,ra
ran=. z + atan2 A ,: B [ decn=. dfr arcsin C
ran ,: decn
)

apparsecs=:15 %~ (3600 * nutation_longitude_dPsi) * [: cosd meanobliquityjd0

apparsidjd0=:([: dmsfrdd 15 %~ [: nth0 meansidjd0) + 0 0 ,"1 [: ,. apparsecs

atan2=:3 : 0

NB.*atan2 v-- arctangent of (Y % X) in degrees.
NB.
NB. FORTRAN (ATN2) variation of the standard (arctan) (_3&o.) for
NB. ratios.  Based on a  PASCAL  function from  Astronomy on  the
NB. Personal   Computer   by   Montenbruck   and   Pfleger   ISBN
NB. 0-387-52754-0 pg. 9.
NB.
NB. Result is between _180 <: atan2 <: 180 degrees
NB.
NB. monad:  fl =. atan2 flYX
NB.
NB.   atan2 1 ,: 1     NB. 45 degrees
NB.   atan2 1 ,: %: 3  NB. 30 degrees
NB.
NB.   NB. random ratios comparing two atan2 verbs
NB.   r=: ?. 2 500$50
NB.   r=: r * ($r) $ (?.~ */$r) { (*/$r)$_1 1
NB.   (atan2b |.r) -: atan2 r
NB.
NB.   NB. surprisingly (atan2) is faster than (atan2b) 
NB.   NB. (j 9.41 2023) but (atan2b) consumes less memory
NB.   NB. 1000 ts"1 'atan2b r',:'atan2 |.r'

NB. vector J                  NB. scalar PASCAL
rad=. 0.0174532925199432955   NB. CONST RAD=0.0174532925199433;
r=. 0 #~ {: $y

b0=. *./0=y                   NB. IF (X=0.0) AND (Y=0.0) THEN ATN2:= 0.0
ir=. i. #r=. 0 (I. b0)} r

if. +./b1=. -.b0 do.
  t=. |(I. b1) {"1 y          NB. AX=: ABS(X); AY=: ABS(Y)
  it=. (I. b1) { ir 

  b2=. (1{t) > 0{t            NB. IF (AX>AY) THEN PHI=: ARCTAN(AY/AX)/RAD            
  s=. (I. b2) {"1 t           
  r=. (rad %~ arctan %/s) (b2#it)} r

  s=. (I. -.b2) {"1 t         NB.    ELSE PHI=: 90.0-ARCTAN(AX/AY)/RAD;
  r=. (90 - rad %~ arctan %/ |.s) (it #~ -.b2)} r
end.

xl0=. I. b1 *. (1{y) < 0      NB. IF (X<0.0) THEN PHI=: 180.0-PHI;
r=. (180 - xl0{r) (xl0)} r    
yl0=. I. b1 *. (0{y) < 0      NB. IF (Y<0.0) THEN PHI=: -PHI;
r=. (-yl0{r) (yl0)} r

r
)

atan2b=:[: dfr 12 o. [: j./"1 |:

cold_iau_named_stars=:3 : 0

NB.*cold_iau_named_stars v-- convert IAU btcl to column dictionary.
NB.
NB. monad:  bt =. cold_iau_named_stars btcl
NB.
NB.   iau=. ; {: , > {: 4 get 'iau_named_stars_2022_txt'
NB.   ciau=. cold_iau_named_stars parse_iau_named_stars iau
NB.
NB.   NB. define columns
NB.   (0 {"1 ciau)=: 1 {"1 ciau

c=. 0{"1 t=. |: y
p0=. c i. ;:'Vmag RA_J2000 Dec_J2000'
d=. _999&".&>  p0 { t=. }."1 t
'invalid mag, ra, dec' assert -. _999 e. d
p1=. c i. ;:'IAU_Name Designation Bayer_Name'  
c ,. (<"1 ] p1 { t) , <"1 d
)

ddsfrhms=:24 60 60&#:^:_1

deltaT0=:3 : 0

NB.*deltaT0 v-- dynamical time ΔT in seconds.
NB.
NB. Returns the difference in seconds between UT  and TD based on
NB. polynomial   expressions   by  Espenak   and   Meesus.   This
NB. calculation is useful  for the  years -1999  to  3000: a five
NB. thousand year period.
NB.
NB. see: https://eclipse.gsfc.nasa.gov/SEhelp/deltatpoly2004.html
NB.
NB. also in (futs): nasa_polynomial_expressions_for_delta_t_md
NB.
NB. monad:  flSecs =. deltaT0 flYd
NB.
NB.   ymd=. |: (3 {. 6!:0 ''), _1812 3 12 , _12 12 11 , 2137 12 13, 1700 1 1 ,: 35 7 6
NB.   |: ymd , deltaT0 deltaTdy ymd

NB. (ry) time intervals are (l,u]

NB. before -500: 
NB.   ΔT = -20 + 32 * u^2; where:  u = (y-1820)/100
ry=. ,: _1999 _500
t1=. {{ _20 + 32 * U^2 [ U=. (y - 1820) % 100 }}

NB. between -500 and +500: 
NB.   ΔT = 10583.6 - 1014.41 * u + 33.78311 * u^2 - 5.952053 * u^3
NB.        - 0.1798452 * u^4 + 0.022174192 * u^5 + 0.0090316521 * u^6; where: u = y/100
NB.   NOTE: for the year -500 set value of 17190 to 17203.7
ry=. ry , _500 500
t2=. {{ 10583.6 - (1014.41*U) + (33.78311*U^2) - (5.952053*U^3) - (0.1798452*U^4) + (0.022174192*U^5) + 0.0090316521*U^6 [ U=. y % 100 }}

NB. between +500 and +1600: 
NB.   ΔT = 1574.2 - 556.01 * u + 71.23472 * u^2 + 0.319781 * u^3
NB.        - 0.8503463 * u^4 - 0.005050998 * u^5 + 0.0083572073 * u^6; where: u = (y-1000)/100
ry=. ry , 500 1600
t3=. {{ 1574.2 - (556.01*U) + (71.23472*U^2) + (0.319781*U^3) - (0.8503463*U^4) - (0.005050998*U^5) + 0.0083572073*U^6 [ U=. (y-1000) % 100 }}

NB. between +1600 and +1700: 
NB.   ΔT = 120 - 0.9808 * t - 0.01532 * t^2 + t^3 / 7129; where:  t = y - 1600
ry=. ry , 1600 1700
t4=. {{ 120 - (0.9808*t) - (0.01532*t^2) + (t^3)%7129 [  t=. y - 1600 }}

NB. between +1700 and +1800: 
NB.   ΔT = 8.83 + 0.1603 * t - 0.0059285 * t^2 + 0.00013336 * t^3 - t^4 / 1174000;  where: t = y - 1700
ry=. ry , 1700 1800
t5=. {{ 8.83 + (0.1603*t) - (0.0059285*t^2) + (0.00013336*t^3) - (t^4)%1174000 [ t=. y - 1700 }}

NB. between +1800 and +1860: 
NB.   ΔT = 13.72 - 0.332447 * t + 0.0068612 * t^2 + 0.0041116 * t^3 - 0.00037436 * t^4 
NB.        + 0.0000121272 * t^5 - 0.0000001699 * t^6 + 0.000000000875 * t^7; where: t = y - 1800
ry =. ry , 1800 1860
t6=. {{ 13.72 - (0.332447*t) + (0.0068612*t^2) + (0.0041116*t^3) - (0.00037436*t^4) + (0.0000121272*t^5) - (0.0000001699*t^6) + 0.000000000875*t^7 [ t=. y - 1800 }}

NB. between 1860 and 1900: 
NB.   ΔT = 7.62 + 0.5737 * t - 0.251754 * t^2 + 0.01680668 * t^3
NB.        - 0.0004473624 * t^4 + t^5 / 233174; where: t = y - 1860
ry=. ry , 1860 1900
t7=. {{ 7.62 + (0.5737*t) - (0.251754*t^2) + (0.01680668*t^3) - (0.0004473624*t^4) + (t^5)%233174 [ t=. y - 1860 }}

NB. between 1900 and 1920: 
NB.   ΔT = -2.79 + 1.494119 * t - 0.0598939 * t^2 + 0.0061966 * t^3 - 0.000197 * t^4; where: t = y - 1900
ry=. ry , 1900 1920
t8=. {{ -2.79 + (1.494119*t) - (0.0598939*t^2) + (0.0061966*t^3) - 0.000197*t^4 [ t=. y - 1900 }}

NB. between 1920 and 1941: 
NB.   ΔT = 21.20 + 0.84493*t - 0.076100 * t^2 + 0.0020936 * t^3; where: t = y - 1920
ry=. ry , 1920 1941
t9=. {{ 21.20 + (0.84493*t) - (0.076100*t^2) + 0.0020936*t^3 [ t=. y - 1920 }}

NB. between 1941 and 1961:
NB.   ΔT = 29.07 + 0.407*t - t^2/233 + t^3 / 2547; where: t = y - 1950
ry=. ry , 1941 1961
t10=. {{ 29.07 + 0.407*t - ((t^2)%233) + (t^3)%2547 [ t=. y - 1950 }}

NB. between 1961 and 1986:
NB. ΔT = 45.45 + 1.067*t - t^2/260 - t^3 / 718 ; where: t = y - 1975
ry=. ry , 1961 1986
t11=. {{ 45.45 + (1.067*t) - ((t^2)%260) - (t^3)%718 [ t=. y - 1975 }}

NB. between 1986 and 2005:
NB.   ΔT = 63.86 + 0.3345 * t - 0.060374 * t^2 + 0.0017275 * t^3 + 0.000651814 * t^4 
NB.        + 0.00002373599 * t^5; where: t = y - 2000
ry=. ry , 1986 2005
t12=. {{ 63.86 + (0.3345*t) - (0.060374*t^2) + (0.0017275*t^3) + (0.000651814*t^4) + 0.00002373599*t^5 [ t=. y - 2000 }}

NB. between 2005 and 2050:
NB.   ΔT = 62.92 + 0.32217 * t + 0.005589 * t^2; where: t = y - 2000 
ry=. ry , 2005 2050
t13=. {{ 62.92 + (0.32217*t) + 0.005589*t^2 [ t=. y - 2000 }}

NB. between 2050 and 2150:
NB.   ΔT = -20 + 32 * ((y-1820)/100)^2 - 0.5628 * (2150 - y)
ry=. ry , 2050 2150
t14=. {{ _20 + (32 * ((y-1820)%100)^2) - 0.5628 * 2150 - y }}

NB. after 2150:
NB. ΔT = -20 + 32 * u^2; where:  u = (y-1820)/100
ry=. ry , 2150 3000
t15=. {{ _20 + 32 * U^2 [ U=. (y-1820)%100 }}

NB. NOTE: the t(i) verbs match the intervals 
ti=. (rb=. /:~ ~. ,ry) I. y
'year range _1999 to 3000 exceeded' assert -.(0,#rb) e. ti

NB. t(i) gerund
tg=. t1`t2`t3`t4`t5`t6`t7`t8`t9`t10`t11`t12`t13`t14`t15

NB. apply t(i) verbs to appropriate intervals
(;ti </. i.#y) { ;(tg {~ <: ~.ti) apply&.> ti </. y
)

deltaTdy=:(0 {  ]) + 12 %~ 0.5 -~ 1 {  ]

dsfrhms=:24 60 60&#:^:_1

fdfrhms=:24 %~ (60"_ #. ]) % 3600"_

fmt_today=:3 : 0

NB.*fmt_today v-- format today verbs result.
NB.
NB. monad:  cl =. fmt_today (bt ; cl ; fl)
NB.
NB.   fmt_today nav_today 0
NB.   fmt_today (location_yellowstone~ 1935 7 6) iau_today 0

'Rs lName cParms'=. y

NB. calc parameters
hdr=. <;._1' Location Mag-Lim Above-Horz Julian ΔT Longitude Latitude Year Month Day.dd UTCz'  
cParms=. ctl ": <(rjust lName , ": ,. cParms) ,. ' ' ,. >hdr

NB. rise/set - sorted by transit time
Rs=. >&.> <"1 |: Rs
Rs=. (('5.1'&(8!:2)@,.) &.> 2 { Rs) (2)} Rs
Rs=. ('3.0'&(8!:2)&.> 3 { Rs) (3)} Rs
Rs=. ctl ": Rs ,:~ <;._1' Name Designation Tr-Alt-Deg Tr-24-HrMin'

cParms,LF,Rs
)

gT0jd=:36525 %~ 2451545. -~ ]

gT0ymd=:36525 %~ 2451545. -~ julfrcal

hmfrds=:[: 24 60&#: 60 %~ ]

hmsfrdds=:24 60 60&#:

hmsfrds=:24 60 60&#:

iau_today=:3 : 0

NB.*iau_today v-- named IAU stars rising/setting today.
NB.
NB. monad:  (bt ; flParms) =. iau_today uuIgnore
NB.
NB.   iau_today 0
NB.
NB. dyad:  (bt ; flParms) =. blYmd_LB_U0_LMAG_LHORZ iau_today uuIgnore
NB.
NB.   'Riseset cParms'=. (location_yellowstone~ 1935 7 6) iau_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME) iau_today y
:
NB. date, julian, location, UTC timezone, magnitude, horizon
'YMD JD LB UO LMAG LHORZ LOCNAME'=. x

NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. brighter magnitude limit !(*)=. Vmag IAU_Name Designation
'Rs lName cParms'=. x today_calc (LMAG > Vmag) # IAU_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;cParms
)

iau_tonight=:3 : 0

NB.*iau_tonight v-- named IAU stars rising/setting tonight.
NB.
NB. monad:  bt =. iau_tonight uuIgnore
NB.
NB.   iau_tonight 0
NB.
NB. dyad:  bt =. blYmd_LB_U0_LMAG_LHORZ iau_tonight uuIgnore
NB.
NB.   NB. date of Uluru star party diner
NB.   YMD=. 2022 10 19
NB.   ULURU=. 131.01941 _25.34301
NB.   UTC=. _9.5 
NB.   LMAG=. 6.0
NB.   LHORZ=. 5
NB.   (YMD;ULURU;UTC;LMAG;LHORZ) iau_tonight 0

((3 {. 6!:0 '');OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ) iau_tonight y
:
NB. date, location, UTC offset, magnitude, horizon
'YMD LB UO LMAG LHORZ'=. x

NB. IAU star data
({."1 IAU)=. {:"1 IAU [ 'IAU NAV'=. loadstars 0

NB. !(*)=. Vmag IAU_Name
NB. brighter than limiting magnitude
stars=. (LMAG > Vmag) # IAU_Name
Rsiau=. (YMD;UO;LB) riseset stars

NB. retain rising setting - circumpolar NIMP
Rsiau=. Rsiau #~ -. ; 1 {"1 Rsiau

NB. name ,. transit altitude, hour minutes 
Rsiau=. (0 {"1 Rsiau) ,. (0 2 3)&{&.> 1&{&.> 2 {"1 Rsiau

NB. retain above local horizon
Rsiau=. Rsiau #~ LHORZ < 0&{&> 1 {"1 Rsiau

NB. sort by transit time
Rsiau {~ /: }."1 > 1 {"1 Rsiau
)

intr3p=:4 : 0

NB.*intr3p v-- interpolate three values - meeus pg 25.
NB.   
NB. dyad:  fln intr3p fl
NB.
NB.   NB. meeus pg. 24
NB.   yi=. 0.884226 0.877366 0.870531
NB.   0.05 intr3p yi

NB. y = y2 + (n/2)(a + b nc)
NB. a b c are differences

'only 3 values' assert 3=#y

d=. 1 2{alldifs y
'a b'=. >0{d [ c=. ,/ >1{d
(1{y) + (x%2) * a + b + x*c
)

loadstars=:3 : 0

NB.*loadstars v-- loads riseset star data.
NB.
NB. monad:  blIAU_Nav =. loadstars uuIgnore
NB.
NB.   loadstars 0
NB.   
NB. dyad:  blIAU_Nav=. pa loadstars uuIgnore
NB.
NB.   0 loadstars 0 NB. files
NB.   1 loadstars 0 NB. JOD
NB.
NB.   loadstars~ 0  NB. idiom files
NB.   loadstars~ 1  NB. idiom JOD
NB.
NB.   2 loadstars 0 NB. files - define columns

0 loadstars y
:
'invalid option' assert x e. 0 1 2

if. x e. 0 2 do.
  NB. load star data from addon directory !(*)=. jpath
  paddon=. jpath '~addons/jacks/testdata/'
  ciau=. read paddon,'iau_named_stars_2022.txt'
  cnavs=. read paddon,'Navigation_Stars.txt'
elseif. x-:1 do.
  NB. load star data from JOD (futs) !(*)=. get od require
  rc=. od ;:'futs utils' [ 3 od '' [ require 'general/jod'
  ciau=. ; {: , > {: MACRO_ajod_ get 'iau_named_stars_2022_txt'
  cnavs=. ; {: , > {: MACRO_ajod_ get 'Navigation_Stars_txt'
end.

ciau=. cold_iau_named_stars parse_iau_named_stars ciau
cnavs=.  parsetd cnavs -. CR
cnavs=. (0 { cnavs) ,.  <"1 |: }. cnavs
'star column overlap' assert 0 = #(0 {"1 cnavs) ([ -. -.) 0 {"1 ciau

NB. define columns - override mixed assignments (<:)=:
if. x-:2 do.
  (0 {"1 ciau)=: 1 {"1 ciau
  (0 {"1 cnavs)=: 1 {"1 cnavs
  (<ciau),(<cnavs),<(0 {"1 ciau),0 {"1 cnavs
else.
  (<ciau),<cnavs
end.
)

location_home=:3 : 0

NB.*location_home v-- set parameters for "home" location.
NB.
NB. monad:  bl =. location_home uuIgnore
NB.
NB.   location_home 0 
NB.   NB. uses location with current date 
NB.   fmt_today iau_today 0      
NB.
NB. dyad:  bl =. flYmfd location_home uuIgnore
NB.
NB.   NB. uses location with home date
NB.   (location_home 0) iau_today 0
NB.   (location_home 0) nav_today 0
NB.
NB.   NB. arbitrary dates for location
NB.   fmt_today (1712 3 15.34 location_home 0) nav_today 0
NB.   fmt_today (location_home~ 1933 9 25.75) iau_today 0

NB. test date https://www.almanac.com/astronomy/bright-stars/zipcode/83646/2023-03-27
2023 3 27 location_home y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: _116.375956 43.646775  
LOCATIONNAME_riseset_=: 'Home - Meridian'

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  3.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 20    NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME
)

location_uluru=:3 : 0

NB.*location_uluru v-- set parameters for Uluru location.
NB.
NB. monad:  location_uluru uuIgnore
NB.
NB.   location_uluru 0  
NB.   NB. uses location with current date
NB.   iau_today 0       
NB.
NB. dyad:  bl =. flYmfd location_uluru uuIgnore
NB.
NB.   NB. uses location with uluru date
NB.   (location_uluru 0) iau_today 0
NB.
NB.   NB. arbitrary dates for location
NB.   fmt_today (1712 3 15.34 location_uluru 0) nav_today 0 
NB.   fmt_today (location_uluru~ 1933 9 25.75) iau_today 0

2022 10 19 location_uluru y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: 131.01941 _25.34301
LOCATIONNAME_riseset_=: 'Uluru - star party diner'

UTCOFFSET_riseset_=: _9.5   NB. time zone
LIMITMAG_riseset_=: 6.0     NB. stellar magnitude
LIMITHORZ_riseset_=: 5      NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME
)

location_yellowstone=:3 : 0

NB.*location_yellowstone v-- set parameters for Old Faithful location.
NB.
NB. monad:  location_yellowstone uuIgnore
NB.
NB.   location_yellowstone 0  
NB.   NB. uses location with current date
NB.   iau_today 0             
NB.
NB. dyad:  bl =. flYmfd location_yellowstone uuIgnore
NB.
NB.   NB. uses location with yellowstone date
NB.   (location_yellowstone 0) iau_today 0
NB.
NB.   NB. arbitrary dates for location
NB.   fmt_today (1712 3 15.34 location_yellowstone 0) nav_today 0 
NB.   fmt_today (location_yellowstone~ 1933 9 25.75) iau_today 0

2013 5 7 location_yellowstone y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: _110.82792 44.46057
LOCATIONNAME_riseset_=: 'Yellowstone - Old Faithful'

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  6.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 10    NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME
)

meanobliquityT0=:3 : 0

NB.*meanobliquityT0 v-- mean obliquity of the ecliptic IAU in degrees.
NB.
NB. monad:  fl =. meanobliquityT0 flT

NB. units are decimal arc seconds
ea=. +/3600 60 1 * OBLIQUITYDMS2000

NB. meeus (21.2) pg. 135
3600 %~ ea - (46.8150*y) - (0.00059*y^2) + 0.001813*y^3 
)

meanobliquityT1=:3 : 0

NB.*meanobliquityT1 v--  mean obliquity of the ecliptic Laskar in
NB. degrees.
NB.
NB. Mean  obliquity using Laskar's polynomial. This expression is
NB. more  accurate than  (meanobliquityT0): see Meeus (21.2)  pg.
NB. 135.
NB.
NB. monad:  fl =. meanobliquityT1 flT

NB. units are decimal arc seconds
ea=. +/3600 60 1 * OBLIQUITYDMS2000

NB. time units 10000 Julian years
U=. y % 100

e0=. (39.05*U^6) + (7.12*U^7) + (27.87*U^8) + (5.79*U^9) + 2.45*U^10 
3600 %~ ea - (4680.93*U) - (1.55*U^2) + (1999.25*U^3) - (51.38*U^4) - (249.67*U^5) - e0
)

meanobliquityjd0=:3 : 0

NB.*meanobliquityjd0 v-- mean obliquity ecliptic for Julian date (y) degrees.
NB.
NB. monad:  fl =. meanobliquityjd0 flJD
NB.
NB.   NB. meeus pg. 136
NB.   e0=. ,dmsfrdd meanobliquityjd0 2446895.5
NB.
NB.   NB. matches to 3 decimals 
NB.   23 26 27.407 -: 0.001 round e0
NB.
NB. dyad:  fl =. pa meanobliquityjd0 flJD
NB.
NB.   NB. Laskar algorithm
NB.   el=. ,dmsfrdd 1 meanobliquityjd0 2446895.5

0 meanobliquityjd0 y
:
meanobliquityT0`meanobliquityT1@.(x) gT0jd y
)

meansid0=:4 : 0

NB.*meansid0 v-- mean sidereal time at Greenwich for T (x) JD (y).
NB.
NB. dyad:  flDegs =. flT meansid flJD

NB. meeus (11.4) pg 84
280.46061837 + (360.98564736629 * y - 2451545.0) + (0.000387933 * x^2) - 38710000 %~ x^3
)

meansidjd0=:3 : 0

NB.*meansidjd0 v-- mean sidereal time at Greenwich for julian day (y) in degrees.
NB.
NB. monad:  fl =. meansidjd0 flJD
NB.
NB.   NB. julian day for April 10, 1987 19h:24m:00s UT
NB.   JD=. julfrcal 1987 4,10 + fdfrhms 19 21 0
NB.   meansidjd0 JD

(gT0jd y) meansid0 y
)

meansidymd0=:3 : 0

NB.*meansidymd0 v-- mean sidereal time at Greenwich for YMD in degrees.
NB.
NB. monad:  fl =. meansidymd0 flYMD
NB.
NB.   NB. julian day for April 10, 1987 19h:24m:00s UT
NB.   YMD=. 1987 4,10 + fdfrhms 19 21 0
NB.   meansidymd0 YMD
NB.
NB.   (meansidjd0 julfrcal YMD) = meansidymd0 YMD

(gT0ymd y) meansid0 julfrcal y
)

nav_today=:3 : 0

NB.*nav_today v-- named navigation stars rising/setting today.
NB.
NB. monad:  (bt ; flParms) =. nav_today uuIgnore
NB.
NB.   nav_today 0
NB.
NB. dyad:  (bt ; flParms) =. blYmd_LB_U0_LMAG_LHORZ nav_today uuIgnore
NB.
NB.   'Riseset cParms'=. (location_yellowstone~ 1935 7 6) nav_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME) nav_today y
:
NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. !(*)=. Nav_Star_Name IAU_Name Designation
'Rs lName cParms'=. x today_calc Nav_Star_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;cParms
)

nnth0=:] + 360 * [: | [: (<.) 360 %~ ]

npth0=:] - 360 * [: (<.) 360 %~ ]

nth0=:npth0`nnth0@.(0&>:@[)

nutation_longitude_dPsi=:3 : 0

NB.*nutation_longitude_dPsi v-- nutation in ecliptical longitude in degrees (1980 iau theory).
NB.
NB. NOTE: the pseudo-code is vector ready and easily converted to J.
NB.
NB. verbatim: algorithm from Jay Tanner https://neoprogrammics.com/nutations/
NB. 
NB.   see: nutation_in_longitude_dPsi_md
NB.
NB. monad:  flDeg =. nutation_longitude_dPsi flJD
NB.
NB.   ymd=. |:  2023 3 12 , 1959 12 11 , 2135 12 13, 1700 1 1 ,: 1935 7 6  
NB.   JD=. julfrcal ymd  NB. no delT adj.
NB.   2460015.5 = 0{JD
NB.   nutation_longitude_dPsi JD
NB.
NB.   NB. see (futs) test: (riseset_tanner_smoke) for examples

T=.  (y - 2451545) % 36525  NB.  T  = (JD - 2451545) / 36525
T2=. T*T                    NB.  T2 = T*T
T3=. T*T2                   NB.  T3 = T*T2

NB. DegToRad = 3.1415926535897932 / 180
DegToRad=. 3.1415926535897932 % 180 

NB. w1 = 297.85036 + 445267.11148*T - 0.0019142*T2 + (T3 / 189474)
w1=. 297.85036 + (445267.11148*T) - (0.0019142*T2) + (T3 % 189474) 
w1=.  DegToRad*(w1)         NB.  w1 = DegToRad*(w1)

NB. w2 = 357.52772 + 35999.05034*T - 0.0001603*T2 - (T3 / 300000)
w2=. 357.52772 + (35999.05034*T) - (0.0001603*T2) - (T3 % 300000)
w2=. DegToRad*(w2)          NB.  w2 = DegToRad*(w2)

NB. w3 = 134.96298 + 477198.867398*T + 0.0086972*T2 + (T3 / 56250)
w3=. 134.96298 + (477198.867398*T) + (0.0086972*T2) + (T3 % 56250)
w3=. DegToRad*(w3)          NB.  w3 = DegToRad*(w3)

NB. w4 = 93.27191 + 483202.017538*T - 0.0036825*T2 + (T3 / 327270)
w4=. 93.27191 + (483202.017538*T) - (0.0036825*T2) + (T3 % 327270)
w4=. DegToRad*(w4)          NB.  w4 = DegToRad*(w4)

NB. w5 = 125.04452 - 1934.136261*T + 0.0020708*T2 + (T3 / 450000)
w5=. 125.04452 - (1934.136261*T) + (0.0020708*T2) + (T3 % 450000)
w5=. DegToRad*(w5)          NB.  w5 = DegToRad*(w5)

w=. (sin w5)*((_174.2*T) - 171996)                 NB. w = sin(w5)*(-174.2*T - 171996)
w=. w + (sin 2 * w4 + w5 - w1)*((_1.6*T) - 13187)  NB. w = w + sin(2*(w4 + w5 - w1))*(-1.6*T - 13187)
w=. w + (sin 2 * w4 + w5)*(_2274 - 0.2*T)          NB. w = w + sin(2*(w4 + w5))*(-2274 - 0.2*T)
w=. w + (sin 2 * w5)*((0.2*T) + 2062)              NB. w = w + sin(2 * w5)*(0.2*T + 2062)
w=. w + (sin w2)*(1426 - 3.4*T)                    NB. w = w + sin(w2)*(1426 - 3.4*T)
w=. w + (sin w3)*((0.1*T) + 712)                   NB. w = w + sin(w3)*(0.1*T + 712)

NB. w = w + sin(2*(w4 + w5 - w1) + w2)*(1.2*T - 517)
w=. w + (sin (2 * w4 + w5 - w1) + w2)*((1.2*T) - 517) 

w=. w + (sin (2*w4) + w5)*((_0.4*T) - 386)         NB. w = w + sin(2 * w4 + w5)*(-0.4*T - 386)

NB. w = w + sin(2*(w4 + w5 - w1) - w2)*(217 - 0.5*T)
w=. w + (sin (2 * w4 + w5 - w1) - w2)*(217 - 0.5*T) 

w=. w + (sin (2*w4 - w1) + w5)*(129 + 0.1*T)       NB. w = w + sin(2*(w4 - w1) + w5)*(129 + 0.1*T)
w=. w + (sin w3 + w5)*((0.1*T) + 63)               NB. w = w + sin(w3 + w5)*(0.1*T + 63)
w=. w + (sin w5 - w3)*((_0.1*T) - 58)              NB. w = w + sin(w5 - w3)*(-0.1*T - 58)
w=. w + (sin 2*w2)*(17 - 0.1*T)                    NB. w = w + sin(2*w2)*(17 - 0.1*T)
w=. w + (sin 2 * w2 + w4 + w5 - w1)*((0.1*T) - 16) NB. w = w + sin(2*(w2 + w4 + w5 - w1))*(0.1*T - 16)
w=. w - 301*(sin (2 * w4 + w5) + w3)               NB. w = w - 301*sin(2*(w4 + w5) + w3)
w=. w - 158*(sin w3 - 2*w1)                        NB. w = w - 158*sin(w3 - 2*w1)
w=. w + 123*(sin (2 * w4 + w5) - w3)               NB. w = w + 123*sin(2*(w4 + w5) - w3)
w=. w +  63*(sin 2*w1)                             NB. w = w +  63*sin(2*w1)
w=. w -  59*(sin (2 * w1 + w4 + w5) - w3)          NB. w = w -  59*sin(2*(w1 + w4 + w5) - w3)
w=. w -  51*(sin (2*w4) + w3 + w5)                 NB. w = w -  51*sin(2 * w4 + w3 + w5)
w=. w +  48*sin(2 * w3 - w1)                       NB. w = w +  48*sin(2*(w3 - w1))
w=. w +  46*(sin (2 * w4 - w3) + w5)               NB. w = w +  46*sin(2*(w4 - w3) + w5)
w=. w -  38*(sin 2 * w1 + w4 + w5)                 NB. w = w -  38*sin(2*(w1 + w4 + w5))
w=. w -  31*(sin 2 * w3 + w4 + w5)                 NB. w = w -  31*sin(2*(w3 + w4 + w5))
w=. w +  29*(sin 2*w3)                             NB. w = w +  29*sin(2*w3)
w=. w +  29*(sin (2 * w4 + w5 - w1) + w3)          NB. w = w +  29*sin(2*(w4 + w5 - w1) + w3)
w=. w +  26*(sin 2*w4)                             NB. w = w +  26*sin(2*w4)
w=. w -  22*(sin 2* w4 - w1)                       NB. w = w -  22*sin(2*(w4 - w1))
w=. w +  21*(sin (2*w4) + w5 - w3)                 NB. w = w +  21*sin(2*w4 + w5 - w3)
w=. w +  16*(sin (2*w1) - w3 + w5)                 NB. w = w +  16*sin(2*w1 - w3 + w5)
w=. w -  15*(sin w2 + w5)                          NB. w = w -  15*sin(w2 + w5)
w=. w -  13*(sin w3 + w5 - 2*w1)                   NB. w = w -  13*sin(w3 + w5 - 2*w1)
w=. w -  12*(sin w5 - w2)                          NB. w = w -  12*sin(w5 - w2)
w=. w +  11*(sin 2 * w3 - w4)                      NB. w = w +  11*sin(2*(w3 - w4))
w=. w -  10*(sin (2 * w4 + w1) + w5 - w3)          NB. w = w -  10*sin(2*(w4 + w1) + w5 - w3)
w=. w -   8*(sin (2 * w4 + w1 + w5) + w3)          NB. w = w -   8*sin(2*(w4 + w1 + w5) + w3)
w=. w +   7*(sin (2 * w4 + w5) + w2)               NB. w = w +   7*sin(2*(w4 + w5) + w2)
w=. w -   7*(sin w3 - (2*w1) + w2)                 NB. w = w -   7*sin(w3 - 2*w1 + w2)
w=. w -   7*(sin (2 * w4 + w5) - w2)               NB. w = w -   7*sin(2*(w4 + w5) - w2)
w=. w -   7*(sin (2*w1) + (2*w4) + w5)             NB. w = w -   7*sin(2*w1 + 2*w4 + w5)
w=. w +   6*(sin (2*w1) + w3)                      NB. w = w +   6*sin(2*w1 + w3)
w=. w +   6*(sin 2 * w3 + w4 + w5 - w1)            NB. w = w +   6*sin(2*(w3 + w4 + w5 - w1))
w=. w +   6*(sin (2 * w4 - w1) + w3 + w5)          NB. w = w +   6*sin(2*(w4 - w1) + w3 + w5)
w=. w -   6*(sin (2 * w1 - w3) + w5)               NB. w = w -   6*sin(2*(w1 - w3) + w5)
w=. w -   6*(sin (2*w1) + w5)                      NB. w = w -   6*sin(2*w1 + w5)
w=. w +   5*(sin w3 - w2)                          NB. w = w +   5*sin(w3 - w2)
w=. w -   5*(sin (2* w4 - w1) + w5 - w2)           NB. w = w -   5*sin(2*(w4 - w1) + w5 - w2)
w=. w -   5*(sin w5 - 2*w1)                        NB. w = w -   5*sin(w5 - 2*w1)
w=. w -   5*(sin (2 * w3 + w4) + w5)               NB. w = w -   5*sin(2*(w3 + w4) + w5)
w=. w +   4*(sin (2 * w3 - w1) + w5)               NB. w = w +   4*sin(2*(w3 - w1) + w5)
w=. w +   4*(sin (2 * w4 - w1) + w2 + w5)          NB. w = w +   4*sin(2*(w4 - w1) + w2 + w5)
w=. w +   4*(sin w3 - 2*w4)                        NB. w = w +   4*sin(w3 - 2*w4)
w=. w -   4*(sin w3 - w1)                          NB. w = w -   4*sin(w3 - w1)
w=. w -   4*(sin w2 - 2*w1)                        NB. w = w -   4*sin(w2 - 2*w1)
w=. w -   4*(sin w1)                               NB. w = w -   4*sin(w1)
w=. w +   3*(sin (2*w4) + w3)                      NB. w = w +   3*sin(2*w4 + w3)
w=. w -   3*(sin 2 * w4 + w5 - w3)                 NB. w = w -   3*sin(2*(w4 + w5 - w3))
w=. w -   3*(sin w3 - w1 - w2)                     NB. w = w -   3*sin(w3 - w1 - w2)
w=. w -   3*(sin w2 + w3)                          NB. w = w -   3*sin(w2 + w3)
w=. w -   3*(sin (2 * w4 + w5) + w3 - w2)          NB. w = w -   3*sin(2*(w4 + w5) + w3 - w2)
w=. w -   3*(sin (2 * w1 + w4 + w5) - w2 - w3)     NB. w = w -   3*sin(2*(w1 + w4 + w5) - w2 - w3)
w=. w -   3*(sin (2 * w4 + w5) + 3*w3)             NB. w = w -   3*sin(2*(w4 + w5) + 3*w3)
w=. w -   3*(sin (2 * w1 + w4 + w5) - w2)          NB. w = w -   3*sin(2*(w1 + w4 + w5) - w2)

dPsiDeg=. w % 36000000.0  NB. dPsiDeg = w / 36000000.0
)

nutation_obliquity_ecliptic_dEpsDeg=:3 : 0

NB.*nutation_obliquity_ecliptic_dEpsDeg v-- nutation in obliquity of the ecliptic degress (1980 iau series).
NB.
NB. NOTE: the pseudo-code is vector ready and easily converted to J.
NB.
NB. verbatim: algorithm from Jay Tanner https://neoprogrammics.com/nutations/
NB. 
NB.   see: nutation_in_obliquity_of_ecliptic_dEpsDeg_md
NB.
NB. monad:  flDeg =. nutation_obliquity_ecliptic_dEpsDeg flJD
NB.
NB.   ymd=. |:  2023 3 12 , 1959 12 11 , 2135 12 13, 1800 2 1 ,: 1935 7 6  
NB.   JD=. julfrcal ymd  NB. no delT adj.
NB.   2460015.5 = 0{JD
NB.   nutation_obliquity_ecliptic_dEpsDeg JD
NB.
NB.   NB. see (futs) test: (riseset_tanner_smoke) for examples

T=. (y - 2451545) % 36525  NB.  T  = (JDTT - 2451545) / 36525
T2=. T * T                 NB.  T2 = T * T
T3=. T * T2                NB.  T3 = T * T2

NB.  DegToRad = 3.1415926535897932 / 180
DegToRad=. 3.1415926535897932 % 180  

NB. w1 = DegToRad*(297.85036 + 445267.11148*T  - 0.0019142*T2 + T3/189474)
w1=. DegToRad*(297.85036 + (445267.11148*T)  - (0.0019142*T2) + T3%189474)

NB. w2 = DegToRad*(357.52772 + 35999.05034*T   - 0.0001603*T2 - T3/300000)
w2=. DegToRad*(357.52772 + (35999.05034*T)   - (0.0001603*T2) - T3%300000)

NB. w3 = DegToRad*(134.96298 + 477198.867398*T + 0.0086972*T2 + T3/56250)
w3=. DegToRad*(134.96298 + (477198.867398*T) + (0.0086972*T2) + T3%56250)

NB. w4 = DegToRad*(93.27191  + 483202.017538*T - 0.0036825*T2 + T3/327270)
w4=. DegToRad*(93.27191  + (483202.017538*T) - (0.0036825*T2) + T3%327270)

NB. w5 = DegToRad*(125.04452 - 1934.136261*T   + 0.0020708*T2 + T3/450000)
w5=. DegToRad*(125.04452 - (1934.136261*T)   + (0.0020708*T2) + T3%450000)

w=. (cos w5)*(92025 + 8.9*T)                   NB. w = cos(w5)*(92025 + 8.9*T)
w=. w + (cos 2 * w4 - w1 + w5)*(5736 - 3.1*T)  NB. w = w + cos(2*(w4 - w1 + w5))*(5736 - 3.1*T)
w=. w + (cos 2 * w4 + w5)*(977 - 0.5*T)        NB. w = w + cos(2*(w4 + w5))*(977 - 0.5*T)
w=. w + (cos 2 * w5)*((0.5*T) - 895)           NB. w = w + cos(2*w5)*(0.5*T - 895)
w=. w + (cos w2)*(54 - 0.1*T)                  NB. w = w + cos(w2)*(54 - 0.1*T)

NB. w = w + cos(w2 + 2*(w4 - w1 + w5))*(224 - 0.6*T)
w=. w + (cos w2 + 2 * w4 - w1 + w5)*(224 - 0.6*T)
   
w=. w + (cos w3 + 2 * w4 + w5)*(129 - 0.1*T)   NB. w = w + cos(w3 + 2*(w4 + w5))*(129 - 0.1*T)

NB. w = w + cos(2*(w4 - w1 + w5) - w2)*(0.3*T - 95)
w=. w + (cos (2 * w4 - w1 + w5) - w2)*((0.3*T) - 95) 

w=. w +200*(cos (2*w4) + w5)                   NB. w = w +200*cos(2*w4 + w5)
w=. w - 70*(cos (2 * w4 - w1) + w5)            NB. w = w - 70*cos(2*(w4 - w1) + w5)
w=. w - 53*(cos (2 * w4 + w5) - w3)            NB. w = w - 53*cos(2*(w4 + w5) - w3)
w=. w - 33*(cos w3 + w5)                       NB. w = w - 33*cos(w3 + w5)
w=. w + 26*(cos (2 * w1 + w4 + w5) - w3)       NB. w = w + 26*cos(2*(w1 + w4 + w5) - w3)
w=. w + 32*(cos w5 - w3)                       NB. w = w + 32*cos(w5 - w3)
w=. w + 27*(cos w3 + (2*w4) + w5)              NB. w = w + 27*cos(w3 + 2*w4 + w5)
w=. w - 24*(cos (2 * w4 - w3) + w5)            NB. w = w - 24*cos(2*(w4 - w3) + w5)
w=. w + 16*(cos 2 * w1 + w4 + w5)              NB. w = w + 16*cos(2*(w1 + w4 + w5))
w=. w + 13*(cos 2 * w3 + w4 + w5)              NB. w = w + 13*cos(2*(w3 + w4 + w5))
w=. w - 12*(cos w3 + 2 * w4 - w1 + w5)         NB. w = w - 12*cos(w3 + 2*(w4 - w1 + w5))
w=. w - 10*(cos (2*w4) + w5 - w3)              NB. w = w - 10*cos(2*w4 + w5 - w3)
w=. w -  8*(cos (2*w1) - w3 + w5)              NB. w = w -  8*cos(2*w1 - w3 + w5)
w=. w +  7*(cos 2 * w2 - w1 + w4 + w5)         NB. w = w +  7*cos(2*(w2 - w1 + w4 + w5))
w=. w -  7*(cos w3)                            NB. w = w -  7*cos(w3)
w=. w +  9*(cos w2 + w5)                       NB. w = w +  9*cos(w2 + w5)
w=. w +  7*(cos w3 + w5 - 2*w1)                NB. w = w +  7*cos(w3 + w5 - 2*w1)
w=. w +  6*(cos w5 - w2)                       NB. w = w +  6*cos(w5 - w2)
w=. w +  5*(cos (2 * w1 + w4) - w3 + w5)       NB. w = w +  5*cos(2*(w1 + w4) - w3 + w5)
w=. w +  3*(cos w3 + 2 * w4 + w1 + w5)         NB. w = w +  3*cos(w3 + 2*(w4 + w1 + w5))
w=. w -  3*(cos w2 + 2 * w4 + w5)              NB. w = w -  3*cos(w2 + 2*(w4 + w5))
w=. w +  3*(cos (2 * w4 + w5) - w2)            NB. w = w +  3*cos(2*(w4 + w5) - w2)
w=. w +  3*(cos (2 * w1 + w4) + w5)            NB. w = w +  3*cos(2*(w1 + w4) + w5)
w=. w -  3*(cos 2 * w3 + w4 + w5 - w1)         NB. w = w -  3*cos(2*(w3 + w4 + w5 - w1))
w=. w -  3*(cos w3 + (2 * w4 - w1) + w5)       NB. w = w -  3*cos(w3 + 2*(w4 - w1) + w5)
w=. w +  3*(cos (2 * w1 - w3) + w5)            NB. w = w +  3*cos(2*(w1 - w3) + w5)
w=. w +  3*(cos (2*w1) + w5)                   NB. w = w +  3*cos(2*w1 + w5)
w=. w +  3*(cos (2 * w4 - w1) + w5 - w2)       NB. w = w +  3*cos(2*(w4 - w1) + w5 - w2)
w=. w +  3*cos(w5 - 2*w1)                      NB. w = w +  3*cos(w5 - 2*w1)
w=. w +  3*(cos (2 * w3 + w4) + w5)            NB. w = w +  3*cos(2*(w3 + w4) + w5)

dEpsDeg=. w % 36000000  NB. dEpsDeg = w / 36000000
)

parse_iau_named_stars=:3 : 0

NB.*parse_iau_named_stars v-- IAU named star list to btcl  header
NB. table.
NB.
NB. Original star name data was downloaded from:
NB.
NB. https://www.iau.org/public/themes/naming_stars/
NB.
NB. and slightly adjusted in Excel. The data stored  in (futs) is
NB. a Unicode UTF-8 CSV export.
NB.
NB. monad:  btcl =. parse_iau_named_stars clTxt
NB.
NB.   NB. get stars from (futs)
NB.   NB. od ;:'futs utils' 
NB.   iau=. ; {: , > {: 4 get 'iau_named_stars_2022_txt'
NB.   parse_iau_named_stars iau

NB. remove any byte order mark
t=. parsecsv y }.~ (BOM -: (#BOM){.y){0,#BOM

NB. extract relevant columns
c=. ;:'IAU_Name Designation Bayer_Name Vmag RA_J2000 Dec_J2000'
t=. t {"1~ (0 { t) i. c

NB. scrub objects with questionable magnitude
t #~ _ ~: _999&".&> (c i. <'Vmag') {"1 t
)

riseset=:4 : 0

NB.*riseset v-- rise, transit, set times of IAU named stars.
NB.
NB. dyad:  (btRs ; flParms) =. blYMD_UO_LB_AOBJ riseset blclStarNames
NB. 
NB.   LB=.  _116.375956 43.646775    NB. Meridian 
NB.   YMD=. 2023 3 27
NB.   UO=.  6
NB.   (YMD;UO;LB) riseset 'Algol' 
NB.   (YMD;UO;LB) riseset 'Algol';'Rigel';'Spica'
NB.
NB.   NB. add objects not IAU names - need name, ra, dec
NB.   AOB=. (<;:'Venus'),(<41.73129),<18.44092
NB.   AOB=. ,&.> (;:'OBJ_Name OBJ_RA_J2000 OBJ_Dec_J2000') ,. AOB
NB.   (YMD;UO;LB;<AOB) riseset 'Venus'

NB. local time, UT offset (0=Greenwich), Latitude Longitude
'ymfd uo LB AOB'=. 4 {. x

NB. convert LB to meeus convention
LB=. _1 1 * LB

NB. local time to UT
UT=. ymfd + 0 0,uo%24 

NB. look up RA, Dec
'IAU Navigation'=. loadstars 0
NB. IAU stars !(*)=. IAU_Name RA_J2000 Dec_J2000
({."1 IAU)=. {:"1 IAU
Stars=. boxopen y

if. #AOB do.
  NB. insert additional objects 
  ({."1 AOB)=. {:"1 AOB
  NB. !(*)=. OBJ_Dec_J2000 OBJ_Name OBJ_RA_J2000
  IAU_Name=.  OBJ_Name , IAU_Name
  RA_J2000=.  OBJ_RA_J2000 , RA_J2000
  Dec_J2000=. OBJ_Dec_J2000 , Dec_J2000
end.

if. 0 e. b=. Stars e. IAU_Name do.
  smoutput 'not in IAU named stars -> '; Stars #~ -.b
else.
  ix=. IAU_Name i. Stars
  RA=. <ix{RA_J2000  [ Dec=. <ix{Dec_J2000
  riseset_calc UT;uo;LB;(<Stars),RA,Dec 
end.
)

riseset_calc=:3 : 0

NB.*riseset_calc v-- rise, transit, set times of stars.
NB.
NB. Main rise/set calculations. Argument (y) set in (riseset).
NB.
NB. monad:  (btRs ; flParms) =. riseset_calc blYMD_UO_LB_OBJ_RA_Dec

'ymd uo LB obj ra dec'=. ,&.> y

NB. (L) longitude, west positive
NB. (B) latitude,  north positive
'L B'=. LB

obj=. obj ,"0 1 a:,a:  NB. result table

NB. dynamical time ΔT in fractional days NOTE: ΔT is not 
NB. going to change a lot over the interpolation period  !(*)=. nc
if. 0=nc<'DeltaTsOveride_riseset_' do. dTs=. DeltaTsOveride_riseset_  
else. 
  dTs=. ,/deltaT0 deltaTdy ymd
end. 
dTfd=. dTs%DAYSECS

NB. apparent sidereal time Greenwich at 0h in degrees
th0=. ,/ddfrdms 15 * apparsidjd0 JD=. julfrcal ymd

NB. TD times ΔT + UT = TD
TD=. (2 {. ymd),"1 0  (_1 0 1 + {:ymd) + dTfd

NB. apparent ra,dec for _1 0 1 days around rise/set
rdi=. |: TD apparRADEC"1 _ ra ,: dec
h0=. STDALTITUDE

NB. approximate times (14.1) meeus pg. 98
cosH0=. ((sind h0) - (sind B)*sind (<a:;1;1){rdi) % (cosd B)*cosd (<a:;1;1){rdi

NB. 1 indicates above or below horizon
bhrz=. 1 < |cosH0
obj=. (<"0 bhrz) (<a:;1)} obj
obj=. (<'above or below horizon') (<(I. bhrz);2)} obj
ix=. I. -.bhrz  NB. objects that rise and set

NB. m(i) are fractional day times (1|) puts mi in [0,1]
H0=. dfr arccos ix{cosH0
m0=. 1|360 %~ ((<ix;0;1){rdi) + L - th0
m1=. 1|m0 - H0 % 360
m2=. 1|m0 + H0 % 360

NB. rise, transit, setting
m=. m1 ,. m0 ,. m2

NB. sidereal time at Greenwich - meeus pg. 99
th=. nth0 th0 + 360.985647*m

NB. adjusted ra,dec
rda=. nu intr3p"1 ix{rdi [ nu=. dTfd + m 

NB. local hour angles
rax=. <a:;0 [ decx=. <a:;1
H=. (th - L) - rax{rda

NB. body's altitude (12.6) meeus pg. 89
sih=. ((sind B)*sind decx{rda) + (cosd B)*(cosd decx{rda)*cosd H

NB. degree altitudes positive
h=. |dfr arcsin sih

NB. corrections for transits (trx), rise/sets (rsx)
dltm=. ($m)$0
trx=.  <a:;1 [ rsx=. <a:;0 2
dltm=. (-(trx{H)%360) trx} dltm
drs=.  rsx { (h - h0) % 360 * (cosd decx{rda)*(cosd B)*sind H
dltm=. drs rsx} dltm
m=. m + dltm

NB. calc parameters Julian date, ΔT, Longitude, Latitude, ymfd, timez
cParms=. JD,dTs,(-L),B,ymd,uo

NB. objects, above/below, altitudes, fractional day UT, UT hours/minutes
cParms ;~ (<"2 (,."1 ] 0.5 round h) ,"1 (,."1 m) ,"1 ] 1 round hmfrds DAYSECS*m) (<ix;2)} obj
)

riseset_calc_NOTES=:3 : 0

NB.*riseset_calc v-- rise, transit, set times of stars.
NB.
NB. monad:  riseset_calc blYMD_LB_OBJ_RA_Dec

'ymd LB obj ra dec'=. ,&.> y

NB. ymd=. 1988 3 20 NB. meeus pg. 99 

NB. (L) longitude, west positive 
NB. (B) latitude,  north positive
'L B'=. LB

obj=. obj ,"0 1 a:,a:  NB. result table

NB. obj=. 'Venus' NB. meeus Venus pg. 99,100
NB. ra=. 41.73129 [ dec=. 18.44092  
NB. L=. 71.0833 [ B=. 42.3333  NB. Boston meeus pg. 99

NB. dynamical time ΔT seconds NOTE: ΔT is not going
NB. to change a lot over the interpolation period 
dTs=. ,/deltaT0 deltaTdy ymd
NB. dTs=. 56  NB. meeus pg. 100

dTfd=. dTs % 86400 NB. dTs in fractional days

NB. apparent sidereal time Greenwich at 0h in degrees
th0=. ,/ddfrdms 15 * apparsidjd0 julfrcal ymd 
NB. th0=. 177.74208  NB. meeus pg. 99

NB. TD times ΔT + UT = TD 
TD=. (2 {. ymd),"1 0  (_1 0 1 + {:ymd) + dTfd

NB. apparent ra,dec for _1 0 1 days around rise/set
rdi=. |: TD apparRADEC"1 _ ra ,: dec

NB. meeus pg. 99,100 
NB. rdi=. ,: 40.68021 41.73129 42.78204 ,: 18.04761 18.44092 18.82742 

h0=. STDALTITUDE     

NB. approximate times (14.1) meeus pg. 98
cosH0=. ((sind h0) - (sind B)*sind (<a:;1;1){rdi) % (cosd B)*cosd (<a:;1;1){rdi

NB. 1 indicates above or below horizon 
bhrz=. 1 < |cosH0  
obj=. (<"0 bhrz) (<a:;1)} obj
obj=. (<'above or below horizon') (<(I. bhrz);2)} obj
NB. objects that rise and set
ix=. I. -.bhrz   
 
H0=. dfr arccos ix{cosH0

NB. (cosHO) differs from meeus pg. 100 I've checked
NB. here and in excel but do not see the problemo!
NB. I'm suspecting a transcription error in the book.
NB. H0=. dfr arccos _0.3178735 NB. meeus pg. 100

NB. m(i) are fractional day times 
NB. 1| insures mi in [0,1]
m0=. 1|360 %~ ((<a:;0;1){rdi) + L - th0  
m1=. 1|m0 - H0 % 360               
m2=. 1|m0 + H0 % 360               

NB. rise, transit, setting
m=. m1 ,. m0 ,. m2

NB. sidereal time at Greenwich - meeus pg. 99
th=. nth0 th0 + 360.985647*m

NB. adjusted ra,dec
nu=. dTfd + m
rda=. nu intr3p"1 ix{rdi

rax=. <a:;0 [ decx=. <a:;1 

NB. local hour angles
H=. (th - L) - rax{rda

NB. body's altitude (12.6) meeus pg. 89
sih=. ((sind B)*sind decx{rda) + (cosd B)*(cosd decx{rda)*cosd H

NB. degree altitudes positive 
h=. |dfr arcsin sih  

NB. corrections for transits (trx), rise/sets (rsx)
dltm=. ($m)$0
trx=.  <a:;1 [ rsx=. <a:;0 2
dltm=. (-(trx{H)%360) trx} dltm 
drs=.  rsx { (h - h0) % 360 * (cosd decx{rda)*(cosd B)*sind H 
dltm=. drs rsx} dltm

NB. object ; altitudes , fractional days ,. corrected UT times 
m=. m + dltm
obj ,. <"2 (,."1 ] 0.5 round h) ,"1 (,."1 m) ,"1 ] 1 round hmfrds 86400*m
)

rjd=:9.9999999999999998e_13&round

td=:] + 0 0 , 86400 %~ [: deltaT0 deltaTdy

todate=:3 : 0

NB.*todate v-- convert (todayno) values to dates.
NB.
NB. WARNING:  valid only for Gregorian dates after  and including
NB. 1800 1 1.
NB.
NB. monad:  il =. todate ilYYYYMMDD
NB.
NB.   date=. 19530702 19520820 20000101 20000229 20900315
NB.   todate todayno 0 100 100 #: date
NB.
NB. dyad:  fl =. ia todayno flYYYYMMDDhhnnss
NB.
NB.   date -: 1 todate todayno 0 100 100 #: date  NB. identity
NB.
NB.   NB. (x<1) indicates encoded y m d h n s.ss
NB.   2 todate date + 0.25   NB. fractional day (6 hrs)
NB.   datess=. (0 100 100 #: date) ,. ?. (#date) # ,:24 60 60
NB.
NB.   NB. does not exactly recover seconds
NB.   datess - 2 todate 2 todayno datess  

0 todate y
:
s=. $y
y=. s$ 0 (I. (,y) e. _ __)},y
a=. 657377.75 +, y=. <. p=. y
d=. <. a - 36524.25 * c=. <. a % 36524.25
d=. <.1.75 + d - 365.25 * y=. <. (d+0.75) % 365.25
r=. (1+12|m+2) ,: <. 0.41+d-30.6* m=. <. (d-0.59) % 30.6
if. 1<x do.
  h=. <. t=. 24*(1&|) ,p
  mm=. <. t=. 60*t-h
  ss=. 60*t-mm
  r=. s $ |: ((c*100)+y+m >: 10) ,r , |: h ,. mm,. ss
else.
  r=. s $ |: ((c*100)+y+m >: 10) ,r
end.
if. 1=x do. r=. 100 #. r end.
r
)

today_calc=:4 : 0

NB.*today_calc v-- named (y) stars rising/setting today.
NB.
NB. dyad:  (bt ; flParms) =. blYmd_LB_U0_LMAG_LHORZ iau_today uuIgnore
NB.
NB.   stars=. 'Algol';'Rigel';'Spica'
NB.   'Riseset cParms'=. (location_uluru 0) today_calc stars

NB. date, julian, location, UTC timezone, magnitude, horizon
'YMD JD LB UO LMAG LHORZ LOCNAME'=. x

'Rsiau cParms'=. (YMD;UO;LB) riseset y

NB. retain rising setting - circumpolar NIMP
Rsiau=. Rsiau #~ -. ; 1 {"1 Rsiau

NB. name ,. transit altitude, hour minutes 
ahm=. 1&{&.> 2 {"1 Rsiau
Rsiau=. (0 {"1 Rsiau) ,. (0 {&.> ahm) ,. (<2 3){&.> ahm

NB. retain above local horizon
Rsiau=. Rsiau #~ LHORZ < 0&{&> 1 {"1 Rsiau

NB. sort by transit time
(LOCNAME;LMAG,LHORZ,cParms) ;~ Rsiau {~ /: >2 {"1 Rsiau
)

todayno=:3 : 0

NB.*todayno v-- convert dates to day numbers, converse  (todate).
NB.
NB. WARNING: valid only for  Gregorian dates after  and including
NB. 1800 1 1.
NB.
NB. This version  of (todayno) handles y m d h n s.ss times. 
NB.
NB. monad:  il =. todayno ilYYYYMMDD
NB.
NB.   date=. 19530702 19520820 20000101 20000229 20900315
NB.   todayno 0 100 100 #: date
NB.
NB. dyad:  fl =. ia todayno flYYYYMMDDhhnnss
NB.
NB.   1 todayno date
NB.
NB.   NB. (x<1) indicates y m d h n s.ss
NB.   datess=. (0 100 100 #: date) ,. ?. (#date) # ,:24 60 60
NB.   2 todayno datess
NB.
NB.   NB. inverse (todate) does not exactly recover seconds
NB.   datess - 2 todate 2 todayno datess

0 todayno y
:
a=. y
if. 1=x do. a=. 0 100 100 #: a end.
a=. ((*/r=. }: $a) , {:$a) $,a
if. 1<x do.
  'y m d h mm s'=. <"_1 |: a
else.
  'y m d'=. <"_1 |: a
end.
y=. 0 100 #: y - m <: 2
n=. +/ |: <. 36524.25 365.25 *"1 y
n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
if. 1<x do.
  n=. n + (24 60 60#.h,.mm,.s)%24*3600
end.
0 >. r $ n - 657378
)

yyyymmfd=:3 : 0

NB.*yyyymmfd v-- year month fractional day time representation.
NB.
NB. Convert standard (6!:0  '')  timestamps  to a  representation
NB. that is suited to (julfrcal) calculations.
NB.
NB. monad:  ft =. yyyymmfd flYYYYMMfdd | ftYYYYMMfdd
NB.
NB.   yyyymmfd 6!:0 ''
NB.   yyyymmfd  7 # ,: 6!:0 ''
NB.
NB.   NB. random times from year 1 to 3000
NB.   julfrcal |: yyyymmfd 1 >. ?. 100 # ,: 3000 12 15 24 60 60

(3 {."1 t) + 0 0 ,"1 0 fdfrhms _3 {."1 t=. tabit y
)

zetzthT0=:3 : 0

NB.*zetzthT0 v-- epoch adjustment terms for J2000 RA DEC in degrees.
NB.
NB. monad:  fT =. zetzthT0 ftYYYYMMDD
NB.
NB.   zetzthT0 2028 11 13.19
NB.
NB.   zetzthT0 2023 4 23 , 1988 3 20 ,: 1987 4,10 + fdfrhms 19 21 0

t=. gT0ymd y

't2 t3'=. t (^"1 0) 2 3 NB. t^2 and t^3

NB. meeus (20.3) pg. 126
zet=. (2306.2181*t) + (0.30188*t2) + 0.017988*t3
z=.   (2306.2181*t) + (1.09468*t2) + 0.018203*t3
th=.  (2004.3109*t) + (0.42665*t2) + 0.041833*t3

NB. insure degree result rank matches (y) rank
3600 %~ zet , z (,`,:)@.(2=#$y) th
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^m22DH=0+?(Dt2'=V4+>beq3?U78+>t>s3?U=)1,L+5+>Ghu0esk-2]sh1+>u,#0fC.52'=V.
+>kqt0fC.20d&2*+?)%u3?U(;+>GPm1,pC8+>u2%0ea_,1a"e$3%uI00d&D8+>k9!0H`7r2E;m8
0H`/1+?1K&2BXq$1-$I:+>l&"2]t%9+?(E#0H`@u1,U13+?);'2BXq5+>t?#1E\Y"2`)X9+?)"t
3?U+9+>GSn1GL"1+>Yu"3?U(5+>GYp1Gg4/1a"S1+>PVn1b^%,2'=_5+>G_r1cQU42BXk3+?1K#
3$9q0+>tqs0eje.0H`@u1c$73+>u"u2'=e4+>b2t3?U(5+>tqs1Gp:51E\G-+>bbp2]sn4+>GVo
1G^..3?U.=+>Y,q1E\Ru1G^..0H`/0+?(E"2]t(&1c6C8+>ki@6!7,T6W8&;@rH6qF!,F5EZen$
GtCIk6Ub'P;FFH(Bldj,ATVX(FCfK)@:NjkGAhM4F!)l&7R9C1=&2^^;fZSnATMF).3N8DDfp"k
1,(C9H#7/(AT2QtBHTo&0JG150HbXP@<*nAD/X<6BIk9<Ea`I"Bl@ltC`m7sGrd''1c7!F1c6C=
+DQ%8Ao_BiC`l>*0JG2+D.[<N<D5tM:1JEeEb0-1+A-cmBjkm%A79Rk9M%rM<(Ke_>%hhpBmO]8
+Dbb/BlkJ3DBNJ$B6%QpF%f/"8Q8DM7r2mVBln',B-;&"B5VF*F_#&W:I@EI8P`)V5tsdC@;TR/
A7]glEbTK7Bl@l3De:,1@WQ+$G%G\:Ci<flFD5Z2:I7`H;,p1e=[Yt_@;p1+Dg5u5@<?''DdmNs
EHPu;Gp%$;+EV:.+D#&!BlJ0.@j#K'+Co%rEb/g'/0JeDDKU&4F"AGTARfXrA91O59M&)]8Q8h\
9iEf$0JHpSE,olABl.:#AKYQ'De!H'8hr(S0Hb:CCh[m3BlnVCDe:,6BOr;t@r,juFD55-A7]Co
AS#p6+Dkh1F`_29/0K"F@rH6qF&,,$9M\#A<(Tk\Ddmd!Ecu#7+DbJ.BlnK.AKYf-DJ*[*F_#&7
+EqC<F<GC<DJ*[*F_#')+Dtb'@<?4,APu<"<*)jn6rS,?F(KE(FE2;<F<GdGEb'56-rNi:<*)jn
6rS,?F(KE(F=A>FEc6)>+<VdL+<XT^6pXLG8Q8\X7<<QZDId0rA0>;sFD5i>A7Zm)FCB32+>"^G
Df'H)DKB6.ATJu+DfQt6DfTQ<Df-\+FDYr;E+ig'Bk&9+AS,sk@ruF'DH0Y':I[fP79!8d6QgJb
D.Oi9Df0,/De<U&ATT&/DBNV2F`MP(9gj#9F(KE(FEV59F(oQ1/0Je<CLnVuDfor>+CT.u+Cno&
ARTCkA8,Xs@;Ka&H=_,8/0JP=EcZ=R+EM+(Df0):+>,9!+Du:7+Co1uAn?!oDI[7!+E(j7DJV?V
@;KajBkDE/5;"ZE,;Cl+@;p0oE`,1k771L&E+*cuDKI"!5p0TRA0=9/6QfuZEZeq4De!H'.!R0`
Ao_g,+A+CC0JHpSE+*d.ARfe&ARfXrA9/l'DfTl0@ruF'DBNA,E+*cuDKI"BBk1dqARTBtFD5T'
+>"^QAS$"*+E1sG+?22#/KcIeP]1\X+=\LDDf[=<E-!HW0/5=mE,]6+F(o0"A2%G2E+*cuDKI!k
Eb/g"GA1Q#+EM7-ATD?jC`k;PBPhfO+CT5.@<-F'A85X/+DQ%8Ao_BiC`n*d+>PW+1E\Cp1FtRA
3B8f:1*AP/2.:T8DDGX@@ru-sB4Yt&+E(j7-s7Z=+BU'8AoD]4FE_XG@<-"'D.RU,F!,17+Co%r
Eb/g'@<>pq11F[.FCfK1@<?''@<>pq1*CaOEag.C+CT;#FCB'"ASuT4De:+?=<Jn4GpskMDBNJ$
B6%QpF!*%WF(Jo*-t.4+DDEYNDerrkBjl-kDIIBnA7'D"@<-F!Df0`0Ec`Eq5uf%:FCT,0FDi:3
DesQ5DBNJ(@ruF'DIIR2A7TanEbK<2A7]7bD..6'F(Jj"DIdf2Ao_g,+D>\9EcWcSD/!m//0K"F
@ribE+DG_:+=Lo?F(TH'A901\+Co#(Ao_R%F!*7]0esk+0ePI?A7]S!@8npkH#@&-Bk(Rf+EV=7
AK]9_<$5mm+EM+(Df0*,A7]S!@8pc_A7]S!@3Ej[<$5^_@qfdgC`n"7@<+COA7]S!@8pc_+>PW+
1E\Ir0esk&/g)l/2)ud61*A;+A92@'BPhg$ARfFk@;I'-ARfXrA9/l*Ec5e;BQ&$6F"AGNBl7uC
+EM+(F!*%WBl8):-tmI=Ao_F'.68S^F(TH+D0$gU+>GVo0ek:@0P4j-EbK<2Ao_<iFD5Z2@;I&s
@<iu-Ec5e;BPhfO+>>E-0K([D+?^iZA7fjqD0$gS3?U(3+>@DEFC0-.A79aqDfT]'F<G[DA79a+
G%G]'F!,L7F*2;@B2gR"A7fjj@ruF'DII?(@qBP"F`M2-F!,(8Df$V.E,T6"+A+CC0JFVDAS$"*
+E1sG+?2/<+D4Y-C1JH%F_kZ1@ps0r0f_*M+>GPm1bLaBB2gR1D.I7!@:OCnDf0!"+Ceu#FEMV<
ATJu+Ec5e;AT2QtBHTo&0JG1'9k@mYF!,F7/g*,03Zr'70R7MG+>Gl62]sh/+>b]10kbE9Eb'6)
Dfp)A/0JeDDKU&4F!,(8Df$V-ARfFk@;I'-ARfXrA90dSBPh@%A9/l(F(TH+D0$gT0H`,0+>bl,
1,ET\F(TH'A9/l,Dfp)A/0JeDDK@?OF(Jj&+D,Y4D'3A#@qfdgC`me1@j!?GGp#3l3&WTI0KL=e
A92@'BPhf5BPhg&Eb&^%+?)&11G1LABPhg&Eb'6)Dfp)A/0JeDDK@?OF(Jj&+D,Y4D'3A#@qfdg
C`me1@j!?GGp#3l3&WTI0KL=eF(TH+D0$h5D0'<0A9/kP1,1R;1c8uUF^K6/A79b$@;TRd+A"k!
+EMX5EcW@DBle!+B.n=;FED57B-;;7A79at@<Gq!Df09%BQS-#D.R6#8O6?!F*(i2F!,X?F(o*"
AKZ)5DJ<`sFD5W7E\hZKDKKH1E,TQ$FCcS:BQ@Zq+Eh10F_,V:/KenAAT`&:E+^:K2/I2>A92j$
EcZ&8@:XF%EbTT+F(KG9F*(i2+Cno&@;Kjl@<?4%DI7'qD.Rd"F<GO2Ea`frFCfK6+D,P4+<kK;
D.On6Ci<flFD5Z2Ci<flFD5Z2?Zg1-EclG7F<GO2Ea`frFCfK6+D,P4+B<6#EciL@De!3tBl@m*
De!3tBl@lrH"Cf.Dg-8EDf0--ATT&6@<,dnATVL(F!,(5EZe.oA0=?MBln$#F_i1:De!3tBl@m+
ARTIp@VfauF_PrC<%r0#@;[3+@VfauF_PrC+E(j7FD,5.ARfOjE-,f(+A"k!+DG^9A7]CoAS#q"
ARTIp@VfauF_PrC<&&6$@;[3+@VfauF_PrC+E(j7FD,5.ARfOjE-,f(+A?3bCLM6+Bl5&(AS6$p
ATM^"@;^!mCh[m3BlnW8A2%k3@;[3+@VfauF_PrC+D#&!BlJ0.@j#B%EZdtsCh[<q+Cno&AKWCH
.3N/4B6%QpF)>JsDKBN&0PtB0DBO"7A7]dm@;I'.Bl.E(@<<V^Eb/g"GA1Q#+D,P4+B0I3GUXb-
6m*n'.;`X)DKBN&C1K#8ARTI!F(o/rEb/Zq+EV=7AKYE'+@gH`ASu^+@qZusDfQt8F_kc#DBNIu
Gp"M\.3N>B+Co%rEb/g'D.R-nF(o01D.G>;ARTI!F(o/rEb/Zq+EV=7AKYE'+@gH`ASu^+@qZus
DfQt'9gg+<DBNJ$B6%QpF)GE0?Z^3s@<la!D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8
Bl7Q+FDk\uH#@MABJ==BEc#6$BmO>5DImHhFD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7ANCrODKKPG
+>#<+2`E]P0eP4>1,1OB2K!JUBJ==BEc#6$BmO>5E,Tf3FD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7
ANCrOE-,bI+>Gc52`NTJ/i#=?0etXFDKKPGDJsQ4@;KY(AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaN
DKKPG+C?o^2)R662`EZS2f<b[@<?4%DI73uDJ*[*F_#&jA5I>]DKU&0FD5Z2+DG^9ARfOjE-,f(
@;I'&Df03%FEM,*+DG^9A7]CoAS#p*-o!_A0Hb(<FWbd>AT)U7.;j9M@<?4%DI7<kCh[m3BlnW-
ARfOjE-,f(?XuTEF$sSPDKU&0FD5Z2+DG^9DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j#;nB6%R)
F!)kc3B/]8Bjl-,F(KB+ATK;>@<-F#?YNqk?Z':hARo.hFCB328O6?!DIIBnA0>r8@<*K,BleA=
FDi:2FCT,0BOtU_ATAo8@:F%aEbTT+F(KH6Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32
EbTT+F(KH#@ps1`EbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2F)ku9ATMF)?YEkhBOkOn
AT`$0EbTT+F(KG9B6%p5E$043EbTK7+D>2)BIk98F_PZ&+Cno&ALns:Bln$2@N]f6CiX9$Ec6)<
A0>W0Ch[<q+Cno++Du==@V'S%De*9uARfXrG%G]9+=M>MA79b$D^cfP@;L'tF!,RC+Cno&ATMs3
A79aj@ps1`DIIBnA0<:G.3N\R@<-E3EbTT/DJ(VDATW$.DJ()6De*:%FDk\uH#@P1Df0`0Ec`F7
@<?(%+EVNEA79a+DKTf*ATDiC+Cf>-G%G]8AKWCCDe*9uALVnMH$O7DAn60u@<*K-Df0Z1+D,Y&
@ruF'DII?(A79a+FD5T'+ED%4Eb0<'DKK</Bl@m8ATW6?BN-ZsE,T6"+CSeqF`VYAASuT4FCfK0
F!,(5EZdt00JG1';F)En77/23DBNJ$B6%QpEr                                     ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2E2g=+>P&o1E\G23%uI02]sh40Jjn,3?U%82DZI20d&840fL403?U.51,U102BXb31Gq*61,0n,
3AE931,'h-1H%4%F_PZ&?ZKk%ATMF):-pQ_@WcC$A7'@kF(KE(F<GZW/KeMFBl%<&-us$CATMF)
.3N&:A0>DsF*)G:@Wcd(/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@r,RpF!,RAE,9H&?U6tD@WcC$A2uY1?TgFm-UC$a@WcC$A2uY1-QlV9@rGq!@<6!&4=<E\6"4tN
Ch,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>`@rcHM3ZoejBldj,ATT:/$4R>+0RHSl78?6B6TmIQ
A8,Qs0H_JI$4R>;67sBpAfrL9D.Rr@+DGm>Anc:,F<G+.@ruF'DIIR2+E)-?E+*j%+DG_'Cis9"
+DGp,$>=!ZA7TCa4ZX]6-Y[F/GUG((4u%C[:dn,I8OFpO-Y[F/GT\@C$4R>+0RI_K+?MV,BOtU_
A8,O)-Y@LCF!,UIBl%i<+BosE+E(d5-RT?1%159QHZX+DCi<f+B4Z0-4$"a%ATW$=F<G4-FDYP2
Eb/Zi+Eqj?FCcS9BQ&*6@<6K4F(eu;2)ZRcAoqU)F*)FF@V'.iEb0<6EZf+7Dg*==DJs`<Df^"C
FD5T'F*(i-E$/1U6mjO,@rcH<-QjcfF(96./14e<@<6*m@<?('Ebm*4$4R>;67sBpDKBB0F>%ZG
E,8rmAKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159QHREiD+Dt\4-TsL59gM-E
:L@OFDe*2tB4Z0--W!T;<*q"(F(96.%159QHVHdn;GUY.C2[Wi+E2IF+=K?eDJs`<Df^"C4#.q*
+Dt\4.3LBo+Dt\44ZX]:DI[i!$4R>;67sC'E+EC!AKY#J6k'KHD.Gdj+<iEc<_Yt0/9><AD@Hq^
F_PZ&A9;ZO3ZrNYD.Rd1@;Ts+-RT?1-mr%i6mjO,@rcH94ZX]60RIt[A19&X4>A?M0me(\A19&l
@WcC$A7Te!%159QHZX+DCi<f+E-67F-WWr0-S0=KEc*!/$4R>`D/XQ=E-67F-Xq44Ch.6tB-;A/
EcYr5DBLMp+=B5p/gj[o6mjO,@rcGr$4R>;67sBnATT&.BleB7Ed8d<De!p,ASuT!$;No?+=Lo;
F*)80/14eAA1&fh3Zq-_6W-]e@;9^k?Q`lnF)W6MBPDO0D.Gdj+=B]O;cHOj=^NO-F(96..4ciR
D.G"'$4R>;67sBnATT&:De*c/A8bt#D.RU,%15is/g)QaDe*d'A1T*8D.G"C4ZX][5snOG?X[\f
A7$HiBle59.!0B<Df'#J3ZoeL:IIuc-S0=KEc*<W-XU_$-OgCl$;No?+D58'ATD4$AKYf-@:UL%
@rc:&F:ARt@j"tu-ZW]>D0'>4Anc'm-TsL5D/=89F(96.%13OO:-pQUB4YslEaa'$+Cf>,E+*Wu
Df-[L+Cf>-FCAm$F!,[FEb'56F`V,)+EVNEFCfN8+DkP$DBNS4Dfp".$?BW!>9G;6@j#W0B/1TA
Bl%?9-TsL5D/=89F(96./14G>Bl%i<%13OO:-pQUF`:l"FCcS.@<6)k$>4$\F(d]t+<iFZ@rcH<
-XUOqF(f)mFCfT8CaTZ!.!&m=DCd/BBOPsqA79RkF`M:G.6T^7-n'.M@59\u+ED%%A0>JuCh5%W
@WcC$A7Te!.3L#m+>G<n+D5@rF(c!i4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0-Qij*
%15is/g,:UA79Rk+Co2-FE2))F`_>9DBNP*Ch7Ys$7I\Q3Zp+*+D,>(AISu\AhG2t7TW/V+CoCC
%144#F)>i<FDuAE+=D5=G%G2,Bl5&B8jPg;;b02A92d2I$4R=b+Co4q@r$-r4Y@jlE+*j%+=DV1
5sn:D83oU9;_KL-$6UI4@ra^b+Co4q@r$-r/9><ADCd.fBkh]:%144#.!0Au:K(48Anc'm.3NhT
Blmo/F(95"$6UH#$6UHd67sBjDfBtE@<6L.@qf@nARloqBl%@%%144#-U_i\D.OhXDdmH/4Y@j*
HS-El+F?-u+>A.1:dJ&O?XH`2?XHE$6uQOL%144#BkAt?6uHFMAKWQc+=CcDFE8fPA8a(0$6UH6
+AP6U+Dbt+@;I&7Ap&3:.3N/>@s)X"DKI"3Bl[cpFDl2F%144#+<Y35@q7_T+<iE\-U^`t?RIBm
DdmH4-XS51$6UH6+=M8A@:UKkDe!</-ZWpBATMF)/oY?5-Rg0^EbTW,+Co4q@r$-r/15IPF(KE(
F=qNCAg\#p+<Y65A1e;u+<YE@D/a#K/g+nJ@<?0*-[p/KD/``-%144#-urm-A0>W/D/a#:-ZWpB
ATMF)?Z'e(AR]RrCG'=?H#@(=.3NhTBlmo/A85O_CNF#;-ZWpBATMF)?Z'e(AR]RrCG'=?H#@(=
%144#-urm-A0>W/D/a#:-ZWpBATMF)?Z'e(AR]RrCG'R:Ag]#MGB.D>AKYMu@:O(oA1T*KBldj,
ATV9sDffQ"Df9DDE+EQ.%13OO+<Y3:ATMs(4Y@jlE+*j%+=DV15sn:D83oU9;_N6(F*(r$FC?gM
%144#A9;C(FCZM,ATW$=F<DrF@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmT%144#A9;C(FCZM,ATW$=
F<Dr+@<Q?t@<?4%DI6=a@<-ErFEhmT%144#A9;C(FCZM,ATVd"+=BKrBkM+$?W2&TEcYS^ATDKq
Bjkmd6#:CHDII$^1,EcUE\]R\D.G"'$>"$pASGa/+A#%&:.\P1A8a(0$6UI4D/XQ=E-67FF(95R
/g)N:8PN#B+ELt7AKY])+FZpK6VC?K5sn:D-OgD*+AP6U+EM%54Y@jlE+*j%+=DUkB5)H@C11Uf
F(eulCND-V/9><ADCd.fBkh]:%144#:-pQU.!0Au:K(48Anc'm.3NhTBlmo/F(95"$>"$pASGa/
A8a(0$6UHG+Bot0BQ&*6@<6K4-Y-q4FE2))F`_2*+E)-?=%Q.?<DH+f+E).6Gpa_TATW'8DCuA*
ASu$2%13OOBkAt?An?4$F*&OG@r`]&D_<.A$6UHG+Bos:Eb/Zi+F,CYGB.D>AKZ&-Dg-//F)rIF
@r`"cAScF!/e&.1+>G!C+EM47GApu3F!)iIBle?0DJ()&BleB:Bju4,Bl@l3F(96)E-*3S4srF5
@r`"cASu$2%14Nn$4R>PDe!p1Eb0-1+EVI>Ci<fj5s[eGF_PZ&3B9*,%159QHZ*F;I4cX<:dn,I
8OFV)+>Y-YA0<6I%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"4tNCh,Od
3F<4&@WcC$A7'@kF(KE(FC/Qs@no?C.UmO7Ch-mnBldj,ATV9iDdso3/M/)SF_PZ&+CT.u+Co2-
FE2))F`_1;EbTT+F(KG9:ddbqA8bt#D.RU,/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=%17,eEHPu9AKW@5ASu("@;IT3De(4)$?B]tF_Pl-+=CoBA8Gt%ATD4$AL@oo%16T`
@r,RpF!,RAE,9H&?U6tD@WcC$A4fNU3B:G03Zoe95s\t&Bl%<P9K>*n-QlV9@rGq!@<6!&4=<E\
6"4tNCh-.33B9)I%16T`Bl8!'Ec`EOBkhQs+CT#'A8Gt%ATD4$AL@oo%159QHV[I,:..Z@4ZX]r
Bk/>?%13OO:-pQUBkAJ9Bl.F+.3N>G+D,>.F*&O8Bk)7!Df0!(Gp%$C+E1b2BHV#,@r-9uAKY]/
%16c[@:Wn_@m)jq-mr_GAU#RS3^,9F:JaJT6qK`p,:@2BAU#=F%159QHZ*F;4$"KtART+[Bk&\A
Ap&3:+E_d?Ci^sH>9G^EDe't<-OgCl$9g.jFDYu5Ddso&ATT%V3[\u^Dg-//F)rI7@W?O/FCcS0
F`VY8EcuD1FD)e=F)59+BJL]SBl7luFD,`,E$/t2DK'$+BQIa(+ED%%A0?):Blmo6%13OO:ddcJ
5tsd23ZoejBldj,ATT:/$4R>+0RG0>DeO#26nTTK@;BFp-QmJAFD>`)Ch\!&Eaa'$+=ANG$9g.j
Anc'mF$2QsEc>i/F<FCJ7SZ6D71BS5$>ag/E+*j%4ZX^-F)59+BJL]HBl7luFD,`,E$/n<F*(r5
G&Ul3BHVM5DK'$+BQIa(+?M<)Anc'mEt&IqA7fFfCh5aj+Dc.EE+*j%/5S`(:-hTC/13&hA7d1u
$4R>;67sBjDf'H-Ch4__@8pf?+>"^P@<6N5Anc'm+DGm>.P>1=F<GLB+=]!bBFP:s1E\_$0I\,V
Bl%@%%16f]/g*_T=%Q.0+CoCC%144#An?!kF(HJ8BQ&*6@<6K4E+EQmBl%>i$6UHG+Bot0BOu!r
+Cnr$F`2A5+?Op2Gp$[9A1e;uBkAt?8Oc]T8Q[*GD_<.A$6UHG+Bot0BQ&*6@<6K4-VdH:762Q3
F`&<L/1<T,3dE/*-Qm,@+=A^VFEhb5FD)d+$>"*c/e&.:%13OO:-pQUA8-+,EbT!*FCcS)DfBE%
Et&I)1E\_$0I\,`A7fFfCh4%_BkAt?0g0,[G\M5@?YWpjGp$X9/e&.1+E1k'4Y@jtART*lGmt*'
+DGF?+A#%(8PUBNA8a(C%144#+<VeJD/XQ=E-67F-ZEU.+ELt7ARlotDBOC#5sn:D83oU9;^W"]
+<VdL+DP=pCN*fr4Y@jlE+*j%+=DV15sn:D83oU9;_KLL:ddcJ5tsd!-SB@KAg\#p+<VdL+E1k'
+Eqj?FCcS0@:O(lA7c8X+<Y65A1e;u+<YB1/g*_T<DH+f+CoCC%144#+<Y`BDfp/@F`JTP:.\/V
3ZqpNE-WRJD]jL$5sn:D83oU9;^W[s$6UH6+AP6U+E1k'+Eqj?FCcS9BQ&*6@<6K4C2dU'BHS[O
8jPg;;_N0*F(KE(F>#!m:ddcJ5tsd!-SB@KAg\]1$6UI&DIb@/$>"$pAM+E!+<WB]>9J!#Dg-//
F)rHOD/"'4Bl7Q+E+EQ'/NtODGmt*lDIb@/$7QDk%16T`@s)g4ASuT4FDYu5De!-?5s\t&Bl%<P
9K>*n?O[?+0RI_K+FPjb:JaJT6qK`g>9G^EDe't<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s\t&Bl%<P9K>*n?ZKk%ATMF)?X\%bDDGR?D/X3$:-pQ_EbTT+F(KH#@<>pq
11,*>Deio,F=f'e@rH4'@<-("B-9eh-t.4+DDEkRFCB&B@OWFAD]iV9@qBI!-t.4+DDEX`@;]Tu
8g#NjEas3"DCI1I$;No?%15is/g+YEART[lA3(hg0JYG$@<++X%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o*D..H?
3$<<SF*&OKDfTB0+Dl%?ARlp*D]gHKBldj,ATUpoBl%i>%13OOCi<`m+=D2DF(KE(F=.M)Ci<`m
+=D2DF(KE(FB*EsCi^s5$4R>;67sBmATVEq05t??F(HJ*G[k<$+CTA#DDE>F@<>p#Ao_g,+=LiE
FE8l?$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn4tq>%A0<rp-Y@LCF!,UIBl%i<+BosE+E(d5-RT?1
Eap4r+=D2>+Dt\2-TsL51a$FBF<Dr>FCB&B?Y+IlASb^qG]Y;B$>s?q4ZX]I+<Z"l+=qD?F:ARp
@rsjp+?V_<?SNlk+B1Wn+=nil4s2sL/mg@VDI[c2/M8/5;Cj1>-OgE#@rsjp+FPjbDI[c2>9ITi
4ZX]>HZ!>8%13OO:-pQUAU%]rC`mn0Cis<1%14Ic+BU!S3ZoOf+<VdLHo`BW?R?sL-9`P#BOi6"
/g*8</mg=U-QlP7==5O?HQk0eDI[bt$7AtY+BVbo4ZX].+<VeS3Zqd:-6b&h4s27eA0>S=+?V_<
?SNZN+B^@"+BU:"-Rg0b+u(3X@rr.e-UCm;+@0+4-TsL5+<Z%m+CAJ&+tb3++=Lo6+DEGN4?G0&
0d%hd5u^-F-s83*.3LoU5u&h103K_O.3Ns]0d(@DF:AR)5r)SF+@.bb=XQ?n+FH3m?XG-(/g`b)
-tm-6BeCMj4"akp+=A9t<'a87-s8*'.3LoU5u'0`==dT(-Rg0b+u(3X@rr.e%15is/g+_M@qBI!
G%#30ATJu8BQ&$0A0>_tFCSu,FDi:CDf'&.E,oN"Ble!,DBNP0EZf7<DBN:n+:SZsEaq6n+>>E%
0JG170JOnpDfor.%16fo4ZX]W/g+;!+FZ?o?XF6L-ua3:+DH'CHQZH6,p6;=+>#VsE,oG2Bm=u-
=:GUOGWe)18M2,f=Wi/S+CAIb$7Kk6@j#K1+F>55+=/.5.3L3'+E2@2+DH(I=BQ(?%15is/g+SC
@ru-s+E2@4@qg!uDf-\6ATMo8%17&p@m)jq0J5%50JG18-?=$IDIa1`Bm:a`3Zq!H+B_ehIQATY
?O[>jE,oG2Bm:bI+Co))+CT;#FCB&0=]d*q/NP"nEap5+GT_>U6!7;!$>F`J3Zq!H+BVbhIQATY
?O[>jE,oG2Bm:bI+Co))+CT;#FCB&0=BR'q/NP"nEap5+GT_>U6!.8!$4R=j@<>pq1*B[M3a!mS
/NP"_FCB&B@N\f)3`lgu%15is/g+mO@<>pq1+.,cD..NrBHUl2@qBI!FDi:CDf'&.E,oN"Ble!,
DBNP0EZf7<DBO7:Ec3(2ASuF'Bl7@$DfTn.$?1#q4ZX]>/het50JOnpDfor.%14R;0-ED2+u(3G
+E2@2+=LrK+F>4s10I^.+=o,fBm:bI+CTA#DDE>:+=oPr=Ub]f/h\>10-W+n>p+*,@j!16GT_>U
5r)SF.3L/o+DH'CHQZa=@;[i0+B]g<3ZqN6$4R>.<'rE(3ZohQ/1t'S+=o,f5r)SF+=o,f-t.4+
DDE>:/36o_+=o,f@<>pq11DA//36lB$:.WY1-IZ@-T!G0/2St5/28n42CpR</iG781+kI4+=K2m
3\`'+5u^3,%15C#6S^ec+=K?6/mg=U-QlM6=Wh9_5u^-F1+69V==GA-?X\%bDDEVB/36o_+DP7l
FCB&B@OPA1/m'PM.3L0&+@/so1(=R"$;No?+ECn.A8c<-Eaa'(Df[$1$;sbb3ZpX>+>P&s0JFb0
0F\@e;E[&`;GnVe+=JL5;CN_6+=KH,INU*n,Z7Mh+F>4Z.PE&F;CNku0d&1[$7K>)@;[i0+FGe>
;CN_?3ZqjQ@;[hC;Gmr2%14d30I14M@<6!&-ZW]>BOi6'@rrhr+BTah=<L^K+@0.4+@0+4+@.bc
=<Kmb=BQbcEap5+GT]:O6S]c^;C;n\%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9fFCB&B
?ZU(&CLnl6Bldj,ATV9jF)Y].@;B4kD/X3$:-pQ_EbTT+F(KH#ATMg%DII<fF)>i2AKW+;/M/(f
FCfN8F!,(5EZcJnF)Y].@;?u.@;]Tu9k@mYF!/bm<"01067sBhChI[,Bln$*/e&._67r]S:-pQU
BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*-%15is
/e&._67sC(ATD6gFD5SQ+EM+*+DG^9-t[UDF"%P*:-pQB$;No?+<Ve%67sB;+Co2-E$0Q]+>b3O
DJUFCDIITp?RH9i:-pQU+<YQ1F(&EpDes]:Df'2sCgUauE,oN2F(oQ1F'iNtEaN?gCij)mFC/lq
%15is/e&._67sBhF)uJ@ATKmTB6%p5E$-QLBldj,ATT@DBlbD5Ddd0fA.8l@67r]S:-pQU@rc-h
FCeuD+>PW+1MpQ@0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16oi@:UK.EbTT+F(KG@%13OO:-pQUBPD*m+E2@8DKI"?
Eb/`pF(oQ1%14LD+Z_>4.3L?'%13OO:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%15Ef6pa[P4ZX]m2E!HO%13OO:-pQUCi=N/
EZee.A0?#6E+O&4H"CE)+C]83DIdet$:7$H6;L`,/NP"&A7]S!@8np'3]\BM5t"%8=X%3%+DbLt
4ZX]rAScHs<+L7s?SX;h0H`(m0b"IV5t"%8=Wf:W+=Lc3Cij)b0H`D;+@8@^6;L`.?R[+?@UqV_
+Co&"FCA-ZGp"ms0JFV(+>F<4%15is/g,1CDId[&+Cno&ATJu+Ec5e;FD5T'+ECn.B4VMZ@<k!s
+>=oi/q+okBf[@k3B9)K/0H]%0JFV"+DEGN0eb:8%17AtA3Dsr@<iuBINUj-+>bc++<r!R@<i:h
H#7(T3Zr]bA0<EGHo`B)+?hD#5;"',,C+-:.3KiX/34n.1*A>3%16WkA3DsrA7]S!@8pc_+F.g7
%13OO:-pQUBl8$(Ectl-F!,(8Df$UFA7]S!@8np0%17-$4ZX]P5t"%8=Wen@+C.&]?SW`P0H`D!
0I\+R$=>MJ3B83h2)$]n$=>YE0H`5,0F\@H0JFV(2D?fo$8FFm0H`)/0JEqC0fLd?+>Gi00F\@D
3&!$/0fV'F%14gL2D?7.3A<,r$8FOp0H`)11,'.E0f_!C+>Gl50b"IE3A`H50f_-H%14gM2DH=/
3B/o+$8FP#2BXb/0Js:H1,(C>+>PW.0F\@E0JtO,1,1X?%14jF2)$./0JG0i$7QDk%14[>6:""+
:K\fO/g,1[%13OO:-pQUFCfN8+Dl7BF<G:8@r-9uAKYDtC`mG0FCfK9@;Kuo$8!kY0J#CK,BA&Y
+D!/J-ndW1+FYpc/96"b+A"1.A9h\p$4R>;67sBiDfor.F!,=BF*&O:@;0Ne$7ISZ4usp/Gpsjf
3Zoh(3dr3#/g)]cGpsk-/g+t>A0<EU+E_.(%13OOA99Lg3ZqsECij)b0HanOA.8kT$4R>;67sB[
@:F%a+>Fuj+BDoeF_,V:De:-;PZ/bJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g*PnEbT].
A0>K)Df$UfBleB7EbT#lC`jiC+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU;Is?VEb'56+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)_t/M/P+/M/P+/M/P+/M/P+
/M/P+/KcVs/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB`ARTU%+<VdL+<VdL+<VdL+<VdL+<VfP
PZ/bJ+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,
.3K`U+<VdL+<VdL+<VdL%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+
/M/P+/M/P+/I`&/@:CoR3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!.1HV92)$^,+<VdL+<VdL+<VdL
+<VdL+<Vd]2_d<H+<VdL+<VdL+<VdL+<VdL+<Vd9$8"(g0H_J\+<VdL+<VdL+<VdL+<VdL+>G`2
1GBpo+<VdL+<VdL+<VdL+<VdL+:SZ01GCL*+<VdL+<VdL+<VdL+<VdL+<Vd]1b^mC+<VdL+<VdL
+<VdL+<VdL+<Vd9$8""e0H_J\+<VdL+<VdL+<VdL+<VdL+>GW13A;Qu+<VdL+<VdL+<VdL+<VdL
+:SZ00eb:(+<VdL+<VdL+<VdL+<VdL+<Vd]0fCjB+<VdL+<VdL+<VdL+<VdL+<Vd9$8<SF+<VdL
+<VdL+<VdL+<VdL+<VdL+>GQ-3%uHt+<VdL+<VdL+<VdL+<VdL+:SZ40JFUl+<VdL+<VdL+<VdL
+<VdL+<Vde2D?g-+<VdL+<VdL+<VdL+<VdL+<Vd9$8O:h+<VdL+<VdL+<VdL+<VdL+<VdL+?289
0H_J\+<VdL+<VdL+<VdL+<VdL+:SZ60JFUl+<VdL+<VdL+<VdL+<VdL+<Vdc2E3B5+<VdL+<VdL
+<VdL+<VdL+<Vd9$8aFj+<VdL+<VdL+<VdL+<VdL+<VdL+>u/40H_J\+<VdL+<VdL+<VdL+<VdL
%14sH0H_J\+<VdL+<VdL+<VdL+<VdL+<WO#0ea^m+<VdL+<VdL+<VdL+<VdL+<V+#2D?g-+<VdL
+<VdL+<VdL+<VdL+<VdL1cI6F+<VdL+<VdL+<VdL+<VdL+<VdL%15$J0H_J\+<VdL+<VdL+<VdL
+<VdL+<WI"0ea^m+<VdL+<VdL+<VdL+<VdL+<V+#3&!$/+<VdL+<VdL+<VdL+<VdL+<VdL1-%6H
+<VdL+<VdL+<VdL+<VdL+<VdL%15*L0H_J\+<VdL+<VdL+<VdL+<VdL+<WEp0JFUl+<VdL+<VdL
+<VdL+<VdL+<V+#0eb:8+<VdL+<VdL+<VdL+<VdL+<VdL0f:mD+<VdL+<VdL+<VdL+<VdL+<VdL
%14gE0JFUl+<VdL+<VdL+<VdL+<VdL+<WBm3A;Qu+<VdL+<VdL+<VdL+<VdL+<V+#0etF:+<VdL
+<VdL+<VdL+<VdL+<VdL2`*32+<VdL+<VdL+<VdL+<VdL+<VdL%14gG0JFUl+<VdL+<VdL+<VdL
+<VdL+<WL$0H_J\+<VdL+<VdL+<VdL+<VdL+<V+#0f1R<+<VdL+<VdL+<VdL+<VdL+<VdL1GUX,
+<VdL+<VdL+<VdL+<VdL+<VdL%14gI0JFUl+<VdL+<VdL+<VdL+<VdL+<WEn0H_J\+<VdL+<VdL
+<VdL+<VdL+<V+#0fC^>+<VdL+<VdL+<VdL+<VdL+<VdL0etF*+<VdL+<VdL+<VdL+<VdL+<VdL
%14gK0JFUl+<VdL+<VdL+<VdL+<VdL+<WZe+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#0fLsD+<VdL
+<VdL+<VdL+<VdL+<VdL0f'pp+<VdL+<VdL+<VdL+<VdL+<VdL%14gL0JFUl+<VdL+<VdL+<VdL
+<VdL+<WBq+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ43&NB4+<VdL+<VdL+<VdL+<VdL+<Vdc+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$8FOp0H_J\+<VdL+<VdL+<VdL+<VdL+>#Al+<VdL+<VdL+<VdL
+<VdL+<VdL%14gM2)$-q+<VdL+<VdL+<VdL+<VdL+<WF"+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
.1HUn$8!ks5t"%8=Wh9.+EV%$0F\?u$;No?+Cf>,E+*cu+Cf>,E-686A0?&:/g+hAF*)>@Bk(Rf
+Eh10F_,V:/Kf.KATD?)@<,og$;No?+EM[7F*(i.FD50"+Eh16BjkmhATJu'F`\aIARfXrA9/l7
BQ&$0A0>>m+<j-\Cht\"@<-./+q4lS67sBU:K0bD+EqB>@<,p%FCAs!DJ();/heDiBl.F&+>"^X
BOr;uBl\9:+DG_7FCB'/+E(j7%15is/g+RFH"CE)+EVNEF(Jo*BQ&);E+rftBl7Q+@:X+]@qBP"
+DG_8ATDs&Ci^_/BOPdkATK!>PZ/b7$><sl0KhH>-nuik+u(3^@:Co>+=o,f.""&uH"8?H/1r&m
3b2f<FCA-&+u(3cA3Dsr?SF)i+>=ol/i>.'0H`(m>p(gDHQk0eFCAW4%13OO:-pQUEb/`lDKI"E
@;L'tF!,C5+O63N+D,Y4D'3A'Eb/a&+E(_1ATDs&FD5Z2%15is/g+S8Eb/g!ASuT4BlbD-ARf:h
F<GLFATAo8BPDN1E+O'(De':aFCAW54ZX]P5t"%8=Wen@+C.&]?SW`P0H`D!0I[G<0f_*K#r=:g
0aS9r0f_-G#r=@i1'nBs0f_-L#r=Fk2[Kp#0f_0H#rF=g1'nBs0f_0M#rFLl2$j^!0f_3I#rOCh
2$j^!0f_3N#rOOl1C4Kt0f_6J#rOUn3=--%0f_6O#rXIi3!g$$1,(C9#rXRl3!g$$1,(C>#rXUm
2[Kp#.1HUn$8!ks5t"%8=Wh9.+EV%$0b"I!$><sl0g.Q?-nuik+u(3^@:Cr?+=o,f.""&uH"8?H
/1r&m3b2f<FCA-&+u(3cA3Dsr?SF)i+>=ol/i>.'0H`(m>p(gDHQk0eFCAW5%13OO0H`%pATD4#
AKW?e5t"%8=Wh-u+F.g7+Cob.+CoRJ+DbLt+E_.(+ED`MBOl3=+D>;-0d(RH@PApH@:Cr6H"89F
%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9jF)Y].@;B4kD/X3$-ZWpBATMF)?Ys@cF`Uo2
D/X3$:-pQ_EbTT+F(KH#D.R:$F'j!*Deio,F=f'eF)>i2AKZ)+F*)IGAoD]49k@mYF!,X;Eaj)B
%15is/e&._67sBH+<Y04Ch7*uBl@l3+E(j7FCfN8+Cei$ATJu+Ec5e;+AHEYF`SpO+<WC!3ADX!
6$%-gDf0K1Bk(Rf%15is/g*GrB5_g)FD,N4/e&._67r]S:-pQU@<6L4D.RcL+D5_5F`8HOEbTT+
F(KGB+DGm>Ci<`mARl5W:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\KK_$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`i
@<+(X+ED%2@;TRd+EVNEAoDL%Dg*<PB6%p5E*m*nCi!ZmFD5Z2?Z]k#FEDeIALSa<@<ld6F:ARP
67sB91MpQ@1,pCuATMr9GAhM4F!,=<G%G2,FDi9MEbTT+F(KGnFD5Q4.1HUn$>aWhA0<7?Bldj,
ATT:/$>aWhA0<7?Bldj,ATUpoBl%i<%13OO:-pQUBPD*m+E2@8DKI"?Eb/`pF(oQ1%14LD+Z_>4
.3L?'%13OO:-pQUF`_>6+Eh=:@N]c(F*)I4$=[OY4ZX]F0JG17+=eQh0H_Jf+DEGN0eb9j$7Ke6
BJ:Q<A7m>6/NP"lE-,bI+C\ko%14M$FD*?N/Ri7'.3L3'+Du(=BJ:P\@Us*\$4R>;67sC"Df]W7
Bm+&@DImHhFD5o0+Cei#A8,piC`m8&Eb/a&Bl@m1%14L7+>k8d+=oPr0H`A0+>Gi0+>Pl0+>>5e
/NP"lFD*?N/0Hem,9SNu+>=ou0H`)00H`,00H`/00F\@;/0Hem,9SNu+>=on2_Z@/3%uI80H`%u
+>#VsDKKPG+=nWm+<r![3Zp!s0H`A0+>Gi0+>Pl0+>Yo0%13OO0H`M$B2gR1D.Fb]1,(C9H#7/(
%13OO:-pQUC3=?,@;[2u@<?''AoD]46#^jYC`kGd/0HZ-3&_sgF<E8N+B;An%14jI1c@<R2(ga/
4WnK^Ch@]t@;I&@3B/r?1a"M,%13OO:-pQU<$6?mCis:u$=>J>0et[C3ArZP1,CaH+?^ifC1JH"
<%rT7A0<Te3&_s:+>GPZ$4R>;67sBtAS$"*+Eh10F_,V:E+^dG3&M-P8jmMZ3Zp171c@<R2D-d>
2DR-!$<1k*3Zqc`/ho+?1,h$G0F\A2BJ=9d3Zqca2E*QS1GLL;2DR!B2Du!O%15is/g)Ps0eP:3
+E1s93&D'OFD*@<4ZX]@3%usA2D@$D3&<K9.j-5r2D?aD3&NTN2`!?M1-$I,+A,%=+>"]k1c7!F
1c6m>.3L,`-nm8-0JG:B2`WZM+=\L5D-etH+>"]l3&`QG0JG1'-%6t9D-f"-$4R>;67sC%D/XQ=
E-67F-[&p7F_,V:A8,XfATAo-DBNb(F*&O8ARfFk@;I;#$;No?+EMC<F`_SFF<Dtq4"`68+Cf>,
E-686A0>`#AT`&A.3L/o+=A9Z+=o,f-SR/3-QkAl3\hh"BJ<p=/34nqBJ=94$4R>;67sC(@;L't
F!+n(Eb/f)FDi9[+Co%nBl.9pEt&I>0-DVr/iG("3$C=<+EV9N@j!<`+EV9ND%-g]$;No?+Dk[u
DBO"7A7]dm@;I'.Bl.E(AoD]40f_3P+@0seBl"nH0HaeG+>Gli3\iF,3\W7/+B;AM$<^(k4ZX]?
3B/r?1b:@8+=eRHA7fjqD0$gS3?U(3+>=638jm/P3Zr0[Ch@]t@;I&h9gfEt<+A'P+D4Y-H#7(7
=\V9n$4R>;67sC(@;L'tF!+n(Eb/f)FDi9]+Co%nBl.9pEt&I>0-DVr/iY4$3$C=<+B2hn/34nQ
D%-g]$?Tr8@m)jqD.R-nF(o0"A2#,u6t6Z5%15is/g,=GCis<1+CSo'AS!!+D]gq\A7]7bD..7%
%156O+=Aiq2CBV,+Z_A$FD*@<+=oPrFD*@F%13OO:-pQUDJsQ4@;KY(AKZ).0OkP!FD*@<4ZX^'
FD*?NFD*@<%172j0Prs6+>GW2/iPRF3&`WM+<XEG/g,+G+?24f$4R>;67sBtARTI!F(o/rEb/Zq
+EV=7AKX9XEbT>40eb.$0f_3P+>=p<<$5mm+D>V5+E1sG+?21e$?Tr8D*9p&-S[D)4!ua:-T`\4
2D-dD2E3&n$?Tr8@m)jq/13,&0J"n11aaCo3$C=:.3N/<F(TH'A0<Ta+=2IZDKKPG+Dk[uDKBN&
H#7(G+>Gl92]sq"0ea%DFD*@F+>#VsFD*@<%13OO:-pQUG%#30ATJu&B6%Qp+EVNE2BZOA@qfdg
Ci^$m4YIp*0J572+?1N*1*C[P0Ol4V3ZrNX0Pq7+%14M#ARTItBk1sh0Hb+QCh@]t@;I&h9ggEQ
4WnTQ@;^.#A9i$&0HaLm6k'J4$;No?+Dk\$F`S[EB.b;]1H#[LAM?8.+=q&?F(TH'A0>`#@;^!m
Ch[m3BlnW8A2#,]1c.*M3AiEH%13OO:-pQUD..NrBOu6-FDi9X+Co%nBl.9pEt&I31E\G2+>Pl.
1b^j2/NP"./het6+EDCCDIal$0F\?u$;No?+CT5.@<,psF<GX=A7]dm@;I'.Bl.E(/KenAAT`&:
E+^dG3&D'OFD*@F4ZX]50f(1=-S[;&4!ujC/ho.>-OgE)BJ<pZ3ZqjME+*d.Bk1sh0H`,-1c@<R
2(g`q$;No?+DkP/@q]Fp+EVNE1E^4>@qfdgCi^$mFD*@F+>#Vs/13,&0J"n11FF:n3$C=:.3N_G
0OkP!%14jI1c@<R2D-d>2DR-44Wm?b4ZX^#F_kZ1@ps0r/9uMdH#7D1A0<Te3&_s:+>GPm0f^@3
0d&.Z$?Tr8@m)jqD.R-nF(o0"A2#,u6k'KFBJ=9d3Zqca2E*QS1GLL;2DR!B2Du!O4YIp*0J572
+?1N*1*C[P0Ol4V3ZrNX0Pq7+:-pQUD..NrBOu6-FDi9Y+Co%nBl.9pF!*%WD.R:$F!,F7/g*,2
%14L3/13D).6An51ab@42)d-A3&rlE.3L3'+=nlo/2/V//i4pu-o`A20I\+qA8QC"Eb&]'0f:("
INWNMBJ:QNBJ<p*$4R>;67sB]ASuX3+E)-?0f_3Q+AH9b@qZu?0H`]#F*)><+>"^QAS$"*+E1sG
+?;Fk$<^(k4ZX]?3B/u@1E\G,%172j0Om7,+CT5.@<-F'A85X/+DQ%8Ao_BiC`lkT6k'KFBJ=9d
3Zoe)0df%12)$C>-T*k90easa$;No?+DkP/@q]Fp+EVNEFCf?3BHV5*+CQC6ARfXrA.8lfBJ=9G
/NP"%0J"n/0J5+.+?1N*0H_nhFD*@<%172j0Prs6+>Gf6/iPUB0K9LK:-pQU@rH7.ATDl8BPhf5
FD5T'+EVNEA7]CoAS!!+Bl.Dj$?Tr8@m)jqA7T:mA8QB10f:('+EV9N@grc?67sBt@<?!mATJu9
D]gkZA7]7bD..7%%14L70J5%50JO\jDfor.+EV9ND(-SZ3Zot-/het50d(LTF`(_4FD*@<%13OO
:-pQUF`(o8+Cf>-G%G]8Bl@m1%15is/g+hJ/8]*=/9>B4F"V!6+EVNEA7]Cp/nAK%$8aIi0Jt[@
2DZI=+>>E%0JG170d(LTF`(_4A7T:mA8QB10f:('+>P&r1a"M./ibjJ+<XEG/g+%X+DG^9BIn!O
Et&IO67sBkAS6':A7Qg)D]i_6/8]*=/9>B4F"V!6%14j51c-=01+kRG2'=J3+>>E%0JO\jDfor.
+=q&?F(TH'A0<Ta+=2IZ1bgU:2)I!F1CX[#$;No?+D#M1@qZunA867.FDYT,F<GF3AT`&:E+^dG
0etWr$@69*0Prs6+>>E&3&EWO1bg+W+F5_Y4ZX]>/ho=B3AiQK+Bot1BJ=9d3Zp+/0fC^E0K:`q
$;No?+DkP/@q]Fp+EVNE0J5%50JO\\AS6$pATJ:f+?_A%0d'[C+>>E%0JG4(Ec6)<A0<:HATTVC
/:'!e/9GPZD(-SY/g,IOFF&%B<%oFM0JYU10eje*1G1CB%13OO:-pQU@;p0oEb0-1+ECmAA7]6n
D.R:$F!,F7/g)l(2[p*AEa^)$ARd)N3ZoP#0JYU10eje*1G1CB+CT5.@<,736q'Hc1bgU:2)I!F
1E\5$+>c)21,:dI2)#IH:-pQUA7]CoAS#p*D..NrBHVD8+>b3OARfFk@;Kuo$9^$b-SR/0-Qjfs
+Z_A-+>c)21Gh'J3&;[.3ZqsE@grc.0-DVr/i4pu-o`A21+=>&0eP=?2_m*E+=oPrEa]Ca:-pQU
Ea^))DBNUDD(K`ND..NrBOu6-FDi:CARfXrA.8ko4?G0&0de)!+>bu!0ek%)+>#Vs/1)u5+=Aij
+=K2m3\`'+A8QC"Eb&]'0f:("INU1^@1<PQ$;No?+Dk\$F`S[>DKKH1E,TQ$FD5Z2+Co1uAn?!o
DI[7!/0JnE+>Pbr1,TLJAM?8.+>GK)3&*6F3A_j5/i,IA1,:R?+>GK)3&*0F2)>[K4YIp*0J5:3
+?1N*1*BdD?SF)d0JG793&)O0/het50JYI=+=oPr4u"1,+CT)&A8,Xs+D!59$9^$b-SR/3-QkAl
3\hg^+>>E%0JG7<1,0n&3ZpUA+F>5>Ci!WrAof)+0F\?u$;No?+EV:.+D>\9EZee.B5D-%80C&<
FD*?N/Kd_0/Kf(B+D,P4D09Z'+DG^9D.R:$Et&IO67sBtF`VXI@V$ZkEa`HnATVKo+Dbb-AKXMd
4Wl.pBJ:P\+A=4,/Kf(B%15is/g+_M@;Tt"AKYi$AT`&:E+^dG3ACsM83K!V-n&VIAo_R%F!*Fb
1Gg432D-sH1FXFu+=LcAAo_R%F!*=_3$9q5/iP4.+>"^HF(TH+D0$gT1E\\#0fCXB1bfFH:-pQU
@rH7.ATDl8F(Jj"DIdf2FDi:8Dfp)A+EV:.DBNJ$B6%QpF!*%WD..NrBOu6-FDi9[+Co%nBl.9p
Et&I>0./G+2CBUq3$C=<.3LN*/i,@?0f(U./34nkFD*?N0f:('+>Yo00H_Zj+@lqK%13OO0H`%p
ATD4#AKX&q-XpV!+EV9ND'3q60Ol5)D'2ef+D!5LH=_1PD'4-YD'2tU6m,)i+A,%3+A,%=+ECm5
A7]6n81+iR%17/nDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)?Ys@cF`Uo2D/X3$-ZWpBATMF)?Z':q
F*(i2F'iKgF^K3,DeioZ67sa.Bldj,ATV9s@<Q^6@<-ErARfjiF)>i2AKW+;/M/)TDf'H%Eb0;7
-us$CATMF).3KaC@;KFp+<YcE%15is/g,+L@;]Xu@<-()D'3e<DeF*!D0%<=$;No?%15is/g+,,
BlbC>FCfN8+<Y04D/`p(ATJt:-us$CATMF).3KaTEa`j,BlkI?FD5T'F!)TID]g/FEb0<7Cij_-
$;No?+Cf>,E-686A0>?,+EV:.+E2.*DImouEbTZ5+E2@>B6%EtF!)l"@<-I'+@B^XFCfK(A0=li
Bm+'.F(Gdf:-pQU:dZZa%15is/e&._67sC%AS!nFBQS?83\N.1GBYZWDg#P@@<6O2D_>O<D(c>*
:-pQB$;No?+AP^3762P6FE1f-F(o_=FD5T'F!)T6Eb-A1DfTD3@:NeiEaa'$+<Y97EZcK7F`MM6
DKI"?ATDL'A9/1e:-pQUFD,*#+E1b1F<D\S0f_$I.3NPL+<Y9=FEMV8+<W'f0JkR7+E1n4Bl@O'
/g+,,ATME*+E2@>B6%EtEt&IO67sC$AT;j,Eb-@9+E_X6@<?4$B-8<>AThX*Gp"4PAn?0/+<Y3+
@prnZF!)TID]g/FEb/isDIjq5+EV:.%15is/g+SAE,olABl.:#Bl@m1/e&._67r]S:-pQU@rc-h
FCeuD+>PW+1MpQ@1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,E?XE\K6kD/!m1FCcS*BkCsgEb0,uATJu)BleB:
Bju4,Bl@l3@:Wn[A.8kT$4R>YDdd0!-ZWpBATMF)-OgE!Ddd0!-ZWpBATMF)<HMqkF!hD(%17&m
Ecbf)@<-E30F\?u$;No?+EV19F<G^JBl%i"$?U-!DK@s%+FAGc0-W+n>p)$Z+>Fug+u(2_H$t)M
$:R<^89.F=DK@s%+FAGZ/g)N'-RN;6AoD^$F*)FH0d%ik-RN86FCfK/@<6O3FE/Q[+C-*F+FPjb
>rsZG1*C[TAfrKL771',<,sQ]E_U7c4!u.ZAoqU)F*)FFGpsjf/g*MZI=2P3%15is/g,4PDfp/@
F`\`RDJsQ;BOu4%+D>>'Ble6,ATD?)E+*g0+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%15jD
:gnEe4ZX^%De!3tBl@lrH"Cf.Dg-8EDf0-8+>Gl42'=h#2@U!gBM`,YFAc[k4ZX]\BM`,YF<GI0
G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp#jq:gnEe;IsnY$4R=O$;No?+Eh10F_,V:
FCeusDfp,;Gp%$7FCAm$ARlomGp$U5Bk(pmDJ()1DBNk8AKZ&9@<*K!AoqU)%15is/g+S?DffZ(
EZf(6+EV:.+AbEJ771&t-q.QbFD)daASuU$Eb/c(<GlMoATDj'.3NSMDeF*!D%-hIBLP9g:gnEe
4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5=_2DcDg-8E
Df0,//Kdi*A0=?MBln$#F_i0oDe!3tBl@l3+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb
9jqZd9PJ>d+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm+@0ITG%E6rDfU/O%17J*+<VdL
+<VdL+<VdL+<Vd^1bq!M3&rTM2'>M6Ch[<q+<VdLHjpF1+<VdL+<VdL+?1u-3A<EJ0JPLC1,LpH
2)?B#PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+<Y#G0eb4>1,h3K+A?]kB5)I1A7Zm2%17J*
+<VdL+<VdL+<VdL+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL
+<WC!1Gp:XARTU%+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WTc9lFokBHSE?+<Z%@
$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL2D-aB+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL2BZ"!6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@GTW
D.Oh4+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm+@SXt/Q?aB89.F=
DEA:7.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@G`[
F(&lu@:s^o+<VdLHq7-X2Dm?M+<VdLHlt:+/heCj+<VeS+<W?\+>P&^+<VeS+>=om+<Vdg%17JU
@<HW66$76jEa`cuF*pMV+>u2<3?TFe+FG:d0eP.&+<VdLHlsOc+>khq+<VdLHlt*c2)$-q3t2OE
<b5oP+<VdL+<VdL+<Z&&;BRnP0JO[m+<Z%S3&E6F+<VdL+FG:S0d%Sr+<VdL+FG:d+>Y,_+?L#>
Hqng%CM=n6+<VdL+<VeS85^Qh0etI++<VeS+>Gl/0H_J\+<Z%S+>Fuo0d%S]+<Z%S0d&5++<W`T
$@G-UFCAm(+<VdL+<VdLHq7-X2`3HO+<VdLHlt:'/heCj+<VeS+<WE^0fL3t+<VeS+>P&o2]s5)
%17JNASu'g+<VdL+<VdL+FH^X+?);91a!n`+FG:k3A*03+<VdLHlsOf+<WZe+<VdLHlt3f2]s4c
3t2OE7;cgO+<VdL+<VdL+<Z&&;BRqT0K:0t+<Z%S2)R!?+<VdL+FG:S1a"M,+<VdL+FG:g+>GPm
+?L#>Hq&$k@;KUcF`\`K+<VeS85^Qi2_m?8+<VeS+>G`+2'="a+<Z%S+>k8s1E[e_+<Z%S2'=Y1
+<W`T$@GQVEbf)m+<VdL+<VdLHq7-X3&`fO+<VdLHlt=$/i=ao+<VeS+<WNa1GL!p+<VeS+>k8t
0d%T#%17JKCiF'!Eaa'9+<VdL+FH^X+>G_r+<VdL+FG:j1bLX.+<VdLHlsOi+>Yhs+<VdLHlt<i
1H-F!3t2OE6tpURA76T'+<VdL+<Z&&;BR\R3$9=d+<Z%S1,gg>+<VdL+FG:S2]s5'+<VdL+FG:j
+>GYp+?L#>Hq7[_@;I&/+<VdL+<VeS85^Qg0fL3t+<VeS+>u232'="a+<Z%S+?1K"1*@\^+<Z%S
3$:"8+<W`T$@GQZDJN[$+<VdL+<VdLHq7-X3AE62+<VdLHlt7+/i=ao+<VeS+<WZe1,g<u+<VeS
+?:Q#0d%T#%17JKCh.*d@<,do+<VdL+FH^X+>G]12]s4c+FG:i1+k7'+<VdLHlt-u+<WB]+<VdL
Hlt-u+>b2`3t2OE;JBcTC`jiC+<VdL+<Z&&;BR\Q0f'pp+<Z%S1H-pD+<VdL+FG:d0d&;,+<VdL
+FG:d0d&;/+?L#>Hp_=]ASc0k+<VdL+<VeS85^Qb2_[36+<VeS+?2>52'="a+<Z%S0eje-0H_J\
+<Z%S0eje-2'=si$@G0OCi!O%EbTb@+<VdLHq7-X0fM*H+<VdLHlt:%/heCj+<VeS+>GSn2)$-q
+<VeS+>GSn2)?@:%17JOCi3['BHSE?+<VdL+FH^X+>Gf80d%S]+FG:j1bLI)+<VdLHlt-u+>khq
+<VdLHlt-u+>ktu4!5q;Ci3['BHV#,+@SXt.1HW36#:FQCgh0'+<VdL+<Z&&;BR\S0Jago+<Z%S
1c-gB+<VdL+FG:d1*@\o+<VdL+FG:d1*ACr+?L#>HpVCdASc!jF`V+:+<VeS85^Qc0K(X.+<VeS
+>kr-0H_J\+<Z%S0esk,0H_J\+<Z%S0esk,1E\ag$@GcdEbTZ;+<VdL+<VdLHq7-X1,M!G+<VdL
Hlt1)/heCj+<VeS+>GYp0ea^m+<VeS+>GYp0f'q6%17JKA8#Cl@3?[8+<VdL+FH^X+>Pi03$9=d
+FG:d2D-j0+<VdLHlt."+>Pbr+<VdLHlt."+>Pku4!5q;A79Le+DG^9771'(%17JZEc5H5Df-[?
+<VdL+FH^X+>Pr61E[e_+FG:h0eP.&+<VdLHlt.#+<WK`+<VdLHlt.#+?(Dc3t2OE:iC/dFa,#O
+<VdL+<Z&&;BR_T3A;Qu+<Z%S2`!'D+<VdL+FG:d1a!o$+<VdL+FG:d1a"M/+?L#>HpMRfBOPpl
+<VdL+<VeS85^Qd2`*K:+<VeS+>Yr/0H_J\+<Z%S0f:(21*@\^+<Z%S0f:(22'=si$@G`_B6A$5
F!)SJ+<VdLHq7-X1H@EM+<VdLHlt:+/heCj+<VeS+>Gbs1GU'q+<VeS+>Gbs1H$@;%17JNASu'g
Deri)+<VdL+FH^X+>br31a!n`+FG:i0J54*+<VdLHlt.'+>GYp+<VdLHlt.'+>Gbs3t2OE7qlOP
@;$c++<VdL+<Z&&;BReS2DQBt+<Z%S1,pmD+<VdL+FG:d3$:%3+<VdL+FG:d3$:%6+?L#>HrFuu
@ppK&+<VdL+<VeS85^Qf0Jta2+<VeS+>Yi,2'="a+<Z%S0f^@53?TFe+<Z%S0f^@61*AXf$@G-[
@ruj6F`SZJ+<VdLHq7-X2)@'C+<VdLHlt=)/heCj+<VeS+>PVn1H?R#+<VeS+>PVn1bp18%17Jd
F^ep"ASc!jDKTE&+FH^X+>l#40d%S]+FG:f0J5%%+<VdLHlt1!+>G\q+<VdLHlt1!+>Ghu3t2OE
6#:LRARf4Y+<VdL+<Z&&;BRhU3AVd#+<Z%S2_m!C+<VdL+FG:e0d&>5+<VdL+FG:e1*A8*+?L#>
HpMXl@<,q#+<VdL+<VeS85^Qg0f(X/+<VeS+>Gl/0H_J\+<Z%S1,9t01*@\^+<Z%S1,9t02BY'j
$@Gc\@VKU#+<VdL+<VdLHq7-X2D[9O+<VdLHlt4!/heCj+<VeS+>P_q1G^-r+<VeS+>P_q1H-F<
%14Nn$4R>26WHrkF*'rn9keKd4ZX]S6WHZt9keKd+AQT=6WHrkF*%iu%15is/g+\=F(96%E+*Wo
Gp$s<DKU&4F!*%W4?=TB+Dkh1Et&IoA927"@<6NR3ZohmD/!m/+@SXt:gnEe89.F=DK@6L/Kf.P
Bl7u74s2X(HQk0e4tq=YBM`,YFAc[k%14s84usfM/h\>pDIdfuE+*g0%15is/g,4PDfp/@F`\`R
771&tEbTT+F(KG9E+*g0+Dkh1F`_1;A8,XfATD@"@qB^/%15is/g,4PDfp/@F`\a:F*(i4+Dt_2
@rPjtF:AQd$;No?+EMC<F`_SFF<DrKDfTr5ATDZ2BOu$pF)Yf(Eb-A'F`MM6DKI!a4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zt/%$;P8%F`MLc3Zr6W@psInDf/p-ASc1$GB7kEDIn8>1,(I>+>Y,q2[p*h
BL?o_E`-Ii4ZX]\BL?o_EZf7.G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp#jq6ZmEi
;IsnY$4R>;BLP9g6ZmEi4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+.h)i5=_2DcDg-8EDf0,//Kdi*A0=?MBln$#F_i0oDe!3tBl@l3+FFV*HlsOS+<VdL+<VdL
+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm+@0IT
G%E6rDfU/O%17J*+<VdL+<VdL+<VdL+<Vd^1c@$A1GCF?2'>M6Ch[<q+<VdLHjpF1+<VdL+<VdL
+?))/1b^jF0f([G3&*0F3Ar#*PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+<Y#G0eb4>1,h3K
+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HjpF1+<VdL
+<VdL+<VdL+<VdL+<VdL+<WEn1,C%UARTU%+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL
+<WH_9lFokBHSE?+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<Vd^2_HjC+@KX`/nAK8+<VeS%17J*
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BZ"!6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)
/M/P+/M/P+/M/I^$@GTWD.Oh4+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=
9keKm+@SXt/Q?aB89.F=DEA:7.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)
/M/P+/M/P+/M/I^$@G6QDIm9qCgeG/+<VdLHq7-X1c7'G+<VdLHlt=$/heCj+<VeS+<W?\2)ZR"
+<VeS+>=oq2*26SHq.m^DII3$+<VdL+<VeS85^Qe2E!<5+<VeS+>Po/0H_J\+<Z%S+>Fuo1*@\^
+<Z%S0d&5+3t2OE;fHG\@3?[8+<VdL+<Z&&;BRhN2)ZR"+<Z%S1Gg^A+<VdL+FG:S1*AA.+<VdL
+FG:e+>Y]5%17JKEas36EclFG+<VdL+FH^X+>kr30H_J\+FG:i1bLX.+<VdLHlsOf+>P\p+<VdL
Hlt3f1,1j"$@H$"@V'FgChI<sF^f&-Hq7-X2)R0E+<VdLHlt1)/i=ao+<VeS+<WH_2)cX#+<VeS
+>Y,t2EM?THpMRfBOt[`@3?[8+<VeS85^Qf2`WZ:+<VeS+?)&.0H_J\+<Z%S+>b2t0d%S]+<Z%S
1a"V/3t2OE6#LdQEb0;7+<VdL+<Z&&;BRkP1Gg3s+<Z%S0f^j?+<VdL+FG:S2'=\5+<VdL+FG:h
+>Yi9%17J]@:Eqd+<VdL+<VdL+FH^X+>u#73$9=d+FG:f0J5%%+<VdLHlsOi+>Gbs+<VdLHlt<i
0f;$%$@G`[F(&lu@:s^o+<VdLHq7-X2Dm?M+<VdLHlt:+/heCj+<VeS+<WQb1bg*q+<VeS+>t>u
3BIZWHqRmjF!*bkF*)G2Ch[s<85^Qg3&`i?+<VeS+>GT'0H_J\+<Z%S+?(E!0H_J\+<Z%S2]sk9
3t2OE<b5oP+<VdL+<VdL+<Z&&;BRnP0JO[m+<Z%S3&E6F+<VdL+FG:S2]sq4+<VdL+FG:j+>bf7
%17JXF`(u/+<VdL+<VdL+FH^X+?)#10d%S]+FG:d3A*03+<VdLHlsOk+<WB]+<VdLHltBk0KT^N
HpMRj@;0a)+<VdL+<VeS85^Qh2)R<8+<VeS+>ku.2'="a+<Z%S+?1K$2BX+b+<Z%S3$:(93t2OE
6tL7I@NZd9+<VdL+<Z&&;BRnY1,L*r+<Z%S3&rTF+<VdL+FG:S3?U.:+<VdL+FG:l+>br;%17JO
DJ<]*+<VdL+<VdL+FH^X+?2/23$9=d+FG:h2(ga/+<VdLHlt-t+>c)$+<VdLHlt-t+>c&>%17JP
Df&p!BOQ%*+<VdL+FH^X+?2;83$9=d+FG:d2D-[++<VdLHlt.!+<WH_+<VdLHlt.!+>Gqe$@GQV
Ebf)m+<VdL+<VdLHq7-X3&`fO+<VdLHlt=%/heCj+<VeS+>GVo0ea^m+<VeS+>GVo3'.QVHpMRf
BOu3mFF#&P+<VeS85^Qb2'="a+<VeS+?)/10H_J\+<Z%S0f'q,1E[e_+<Z%S0f'q,1-5pPHph[f
BOkNo+<VdL+<VeS85^Qb3&i$'+<VeS+>Pl.2'="a+<Z%S0f'q/3$9=d+<Z%S0f'q/2`hHUHq7[_
@;I&/+<VdL+<VeS85^Qg0fL3t+<VeS+>u540H_J\+<Z%S0f:(.1*@\^+<Z%S0f:(.0KT^NHqe0i
CLM6++<VdL+<VeS85^Qj0ejdn+<VeS+>c)22'="a+<Z%S0fC-s2BX+b+<Z%S0fC.33t2OE6#:(C
@UX:cDBL&E+<Z&&;BR\N2)cX#+<Z%S2DQm=+<VdL+FG:d2]sq2+<VdL+FG:d2]sn:3t2OE;JBcT
C`jiC+<VdL+<Z&&;BR\Q0f'pp+<Z%S1H-pD+<VdL+FG:d3$9q8+<VdL+FG:d3$9q73t2OE6XaqF
Ci!N&+<VdL+<Z&&;BR\Q0K:0t+<Z%S3&iNJ+<VdL+FG:d3$9t2+<VdL+FG:d3$9q93t2OE6=jtL
@<?O(GT\+O+<Z&&;BR\Q3A;Qu+<Z%S2)6d<+<VdL+FG:d3$9t:+<VdL+FG:d3$9t93t2OE7;QjM
FD)d>+<VdL+<Z&&;BR\Q3ADX!+<Z%S2`*-@+<VdL+FG:d3$:"2+<VdL+FG:d3$9t:3t2OE6#:FQ
Cgh0'+<VdL+<Z&&;BR\S0Jago+<Z%S1c-gB+<VdL+FG:d3$:%3+<VdL+FG:d3$:";3t2OE6=k7M
ChI=%F(HI:+<Z&&;BR_K2DH<s+<Z%S2)?j=+<VdL+FG:d3$:(=+<VdL+FG:d3$:(<3t2OE;e^8d
F`SZJ+<VdL+<Z&&;BR_O3ADX!+<Z%S1-$s@+<VdL+FG:d3?U.=+<VdL+FG:d3?U.<3t2OE6"FY;
Ea^(5+<VdL+<Z&&;BR_Q0fU9u+<Z%S0fCXA+<VdL+FG:e0H_Jn+<VdL+FG:e0H`)3%17JZEc5H5
Df-[?+<VdL+FH^X+>Pr61E[e_+FG:h0J54*+<VdLHlt0u+>bks+<VdLHlt0u+>bi8%17JZDes64
GT\+O+<VdL+FH^X+>Pr;0H_J\+FG:j1G1O-+<VdLHlt0u+>c)$+<VdLHlt0u+>c&>%17JKCiF&r
Eb$:8+<VdL+FH^X+>Yr53$9=d+FG:f2_Hd,+<VdLHlt1"+>Y_p+<VdLHlt1"+>Y]5%17J\AS6.%
F`SZJ+<VdL+FH^X+>Z#;1*@\^+FG:h2_Hs1+<VdLHlt1#+>GSn+<VdLHlt1#+>GQ3%14Nn$4R>2
6WHKrEcO]k9keKd4ZX].771'GE_U7cF!+4k771'BF`ML3$>sBq@q0Y%4ZX]6FDY`0F!*n=<C:nL
E_(4FBl7u@+>"^XD/!m/+?go(+F>:e+?hK+:2!";EcP&hEt&Hc$;No?+Co2-@rc."@;]S#+Dkh1
F`_29+>"]u3Zp1#D/!m/%14j54usfM/h\>pDIdfu@s)f$$;No?+EMC<F`_SFF<Dr"6WG7LBldj,
ATT&)F`MM6DKI"<Bl8'8AKYMtAnGUpASu!hF!hD(:-pQUF)>i<FDuAE+CoP8@<<W0A926jF`Iou
%15is/g,4PDfp/@F`\`RDJsQ;BOu4%+D>>'Ble6,ATD?)Ap&3<Eb-@94Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4ZtqU%15jD7Wif93Zr6W@psInDf/p-ASc1$GB7kEDIn8>1,(O@+?(Du%15jD7WifNATL!q
+AQT>F`\aD@<Q""De*:%+>=63:-pQUF)>i<FDuAE+D,J4?Z^3s@<itjBL[,d;IsnY$4R>;BLP9g
7Wif93Zp+!3Zp*c$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17JcASc1$
GB7kEDIjqB+AZfa+@]dRFD,9/C`lDi@psInDf-[?HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+>t?:@:q/cBl+t8+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+>GPm6"4bUAM$GkEdE*B$@Es=
+<VdL+<VdL+<VdL+<WEr2E*HK1+kLC+A-cmBjkm%+<VeS%17J*+<VdL+<VdL3&`HI1c%*M1H7-L
0etU?2^$D1<$3;++<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+C?iX0J5=?2`WW99Q+f]BlnK.AKZ@0
$@Es=+<VdL+<VdL+<VdL+<VdL1c-gA2D@!I+A?3cBlnK.AKW+C%17J*+<VdL+<VdL+<VdL+<VdL
+<VdL+>PW-1E]h3@<*J5+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+?(E;Df0Z1+<VdL
+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<Vd^/i#:,6t(?nA7Qf*+<Z%@$@Es=+<VdL+<VdL+<VdL
+<VdL+<VdL+<Vdb+B;B.H6==Q+<VeS%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+.h)h9/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;
Hqn*eAKW*<+<VdL+<VeS6tLFRB5V."Bl@m:<,sQVCih6sAS6BiE\0%'/P'nVBl8;@771',<,sQ]
E_U7c3t2NI/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;
Hr=Bo@;KUcB6@c.+<VeS85^Qg2)R97+<VeS+>l,20H_J\+<Z%S+>=om3?TFe+<Z%S0H`),3t2OE
94;sa+@1-kFE1f+BleYm;BRkW2`W!'+<Z%S0ek:7+<VdL+FG:S0d%T!+<VdL+FG:d+>Z(g$@Glc
B42o*+<VdL+<VdLHq7-X2_Zp?+<VdLHltC*/i=ao+<VeS+<WB]1,0mo+<VeS+>Fun2*26SHqng%
CM=n6+<VdL+<VeS85^Qh0etI++<VeS+>Gl/2'="a+<Z%S+>Fuq0H_J\+<Z%S0d&8/3t2OE6#:XO
BlY==+<VdL+<Z&&;BRnU2)cX#+<Z%S2)HpC+<VdL+FG:S1*AA1+<VdL+FG:e+>Pr=%17JNASu'g
+<VdL+<VdL+FH^X+?);91a!n`+FG:k3A*!.+<VdLHlsOf+>Pes+<VdLHlt3f1,(d!$@G9[BkAJ1
+<VdL+<VdLHq7-X3&<6J+<VdLHlt:(/i=ao+<VeS+<WK`1,pC!+<VeS+>b2r1-5pPHq&$k@;KUc
F`\`K+<VeS85^Qi2_m?8+<VeS+>Gc,0H_J\+<Z%S+>k8u1*@\^+<Z%S2'=\43t2OE9jr'X@:C?%
+<VdL+<Z&&;BRqX3&)Nu+<Z%S2DHg<+<VdL+FG:S2'=_9+<VdL+FG:h+>bi8%17JKCiF'!Eaa'9
+<VdL+FH^X+>G_r+<VdL+FG:j2(gR*+<VdLHlsOi+>kns+<VdLHlt<i2)%*$$@G6UE+icj+<VdL
+<VdLHq7-X0fV-8+<VdLHlt1(/heCj+<VeS+<WTc1,g<u+<VeS+?(Du2*26SHq7[_@;I&/+<VdL
+<VeS85^Qg0fL3t+<VeS+>u540H_J\+<Z%S+?1K$0d%S]+<Z%S3$:%;3t2OE9kA3X@<*J5+<VdL
+<Z&&;BRtS0d%S]+<Z%S2)$X:+<VdL+FG:S3?U.:+<VdL+FG:l+>bl9%17JKCh.*d@<,do+<VdL
+FH^X+>G]12]s4c+FG:i1+k7'+<VdLHlt-u+>Gl!+<VdLHlt-u+>Gf:%17J\BkM!n+<VdL+<VdL
+FH^X+>Gf01E[e_+FG:f2_Hs1+<VdLHlt-u+>l)#+<VdLHlt-u+>l#<%17JM@;odoCgeG/+<VdL
+FH^X+>Gf/3$9=d+FG:k3%d'2+<VdLHlt.!+<WB]+<VdLHlt-u+>l)>%17JLASc0kFE2)?+<VdL
+FH^X+>Gf80H_J\+FG:h1+k7'+<VdLHlt.!+<WWd+<VdLHlt.!+>u:j$@G9YDIIX#+<VdL+<VdL
Hq7-X0fM*I+<VdLHlt@)/heCj+<VeS+>GVo0ea^m+<VeS+>GVo2`hHUHpMRdBl%3p+<VdL+<VeS
85^Qb3A<63+<VeS+>bo-2'="a+<Z%S0esk+3?TFe+<Z%S0esk+2`hHUHpVCdASc!jF`V+:+<VeS
85^Qc0K(X.+<VeS+>kr-0H_J\+<Z%S0esk-3$9=d+<Z%S0esk-2EM?THrFa"Bm"J>+<VdL+<VeS
85^Qc1c[95+<VeS+>Pr00H_J\+<Z%S0f'q-2]s4c+<Z%S0f'q-2EM?THpM:V@<,d!+<VdL+<VeS
85^Qc2DI06+<VeS+>Gc,2'="a+<Z%S0f'q/0d%S]+<Z%S0f'q.3BIZWHr+j%@sN!1+<VdL+<VeS
85^Qc3A`N7+<VeS+>ki*2'="a+<Z%S0f1".1*@\^+<Z%S0f1".0KT^NHr+`tCistF+<VdL+<VeS
85^Qc3B8c9+<VeS+?))/2'="a+<Z%S0f1".3$9=d+<Z%S0f1".2EM?THpMRfBOPpl+<VdL+<VeS
85^Qd2`*K:+<VeS+>Yo.2'="a+<Z%S0fC./0H_J\+<Z%S0fC.63t2OE;IsK`CiseA+<VdL+<Z&&
;BRbU3&2U!+<Z%S2)d-F+<VdL+FG:d2BXk3+<VdL+FG:d2BXh93t2OE6tL7I@W-'k+<VdL+<Z&&
;BReR1Gg3s+<Z%S2D?a;+<VdL+FG:d3$:"3+<VdL+FG:d3$9t:3t2OE7qlOP@;$c++<VdL+<Z&&
;BReS2DQBt+<Z%S1,pm?+<VdL+FG:d3$:(<+<VdL+FG:d3$:(93t2OE;fHG\@3?[8+<VdL+<Z&&
;BRhN2)ZR"+<Z%S1Gg^<+<VdL+FG:e0H_Js+<VdL+FG:e0H`26%17JKEas36EclFG+<VdL+FH^X
+>kr30H_J\+FG:i1bLX.+<VdLHlt0u+>l)#+<VdLHlt0u+>l#<%17JdF^ep"ASc!jDKTE&+FH^X
+>l#40d%S]+FG:e3A*03+<VdLHlt1!+>Ybq+<VdLHlt1!+>Y]5%17JKCiF'!@q/pi+<VdL+FH^X
+>l)<1E[e_+FG:j1+k7'+<VdLHlt1"+>G_r+<VdLHlt1"+>G]7%17JKDKK<-ATJt:+<VdL+FH^X
+>tr11a!n`+FG:d3A*!.+<VdLHlt1#+>GSn+<VdLHlt1#+?2Fl$@Gc\@VKU#+<VdL+<VdLHq7-X
2D[9O+<VdLHlt4!/heCj+<VeS+>P_q2)69s+<VeS+>P_q1c[W,$7QDk%15Nk<CV+Q89.F=DK@s%
+@SXt89.F=DK?pqBLP9g7Wie^$>sBq@qKk*4ZX]6FDY`0F!*n=<CV+Q89.F=DK@6L/Kf.PBl7u7
4s2X(HQk0e4tq=YBL[,d;IsnY$;No?+Co2-@rc."@;]S#+Dkh1F`_29+>"]u3Zp@(D/!m/%15$:
4usfM/h\>pDIdfuAp&2)$;No?+EMC<F`_SFF<Dr"6WG7LBldj,ATT&,F`_bHAKYi(DKU&4+Co1u
An?!oDI[7!-OgDX67sC%D/XQ=E-67FA92j$F<GI3F(8g)F:AQd$;No?+EMC<F`_SFF<Dr"6WG7L
Bldj,ATT%i:Jt._+@pNIBl5&*Eb05DF*(i4F!*V/4Ztqk4Ztqk4Ztqk4Zt/%$;No?+CoP'D/!lN
3ZrffA926jF`K$NA926mF`]0PA927"@<6N"$;No?+EMC<F`_SFF<EbcAo_I&+CoP'D/!ks$;No?
+EMC<F`_SFF<G+8FCB86A926tBl4@e%15is/g,4PDfp/@F`\`RF)Q2CBOu4%+D>>'Ble6,ATD?)
E+*g0+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%16$I:gnEe4ZX^%De!3tBl@lrF_l2@FabGf
3AWN82]t!f$<(V7@<6NgATL!q+B)rM@<6N5DII]qFDk\uGp"dM$;No?+EMC<F`_SFF<G14FC0-.
A79a+;eT!9F*(;kEt&Hc$<(V,6WHrkF*'Q++>=p!+>=63.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.h)i5<GZeuFW`7YF*(i2+E1b0FEo!>Bl7L&+A?]`@<?4%DBL'L%17J*+<VdL
+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+>k9-
@W-F$/P'f#H@-//HlsOS+<VdL1,LaF3B0#O0ebF=2E!HO2]t_8Ch[<q+<VdLHjpF1+<VdL+<Vdd
/hf:>3&30B2`*9H2`*BJ+O63N+<VdL+<VdLHjpF1+<VdL+<VdL+<VdL+<Vd]1GLL90f_'F+A?]k
B5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<Y#H2(g[A1GCO+9OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL
+<VdL+<VdL+<WC!1Gp:XARTU%+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2]th5DKKP7
+<VdLHjpF1+<VdL+<Vda/iGC?0fCpJ2E!HO2E!HP+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL
+<VdL+<Ve63A*03<E)>3+<VdL+<Z%@$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JX
@;TQu+<VdL+<VdL+<Z&"ATMQuDIIX$Df0r%E\0RnF=fmlB7*[!/M].789.F=DL<Qq6WG^;E\0h&
9keK,%14U;/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;
HqRmjF!*bkF*)G2Ch[r5Hq7-X2E3WU+<VdLHltC'/heCj+<VeS+<W?\0f:'r+<VeS+>=om3BIZW
Hrafk@3?[8+<VdL+<VdLHq7-X2_Zp?+<VdLHlt1&/heCj+<VeS+<W?\1GBpo+<VeS+>=oo1-5pP
Hqng%CM=n6+<VdL+<VdLHq7-X2_d'B+<VdLHltC//heCj+<VeS+<W?\1c?I!+<VeS+>=oq0KT^N
HpMRj@;0a)+<VdL+<VdLHq7-X2`3HO+<VdLHlt:)/heCj+<VeS+<WB]1c$6s+<VeS+>Fuq2EM?T
Hr+B_@rGjm+<VdL+<VdLHq7-X2`E`N+<VdLHlt:+/i=ao+<VeS+<WE^0f:'r+<VeS+>P&p0fogO
HphO`ARZc)+<VdL+<VdLHq7-X2`WWM+<VdLHlt.(/i=ao+<VeS+<WE^1Gg3s+<VeS+>P&q2EM?T
HpqpeAfr3=+<VdL+<VdLHq7-X3&<6J+<VdLHlt:(/heCj+<VeS+<WH_1H$?u+<VeS+>Y,r3BIZW
HpMRd@;0a)+<VdL+<VdLHq7-X3&EBJ+<VdLHlt=,/heCj+<VeS+<WH_2)ud%+<VeS+>b2s3t2OE
7W3-PChR7"F<D\K+<VeS85^Qi2_m?8+<VeS+?2522'="a+<Z%S+>b2t3?TFe+<Z%S1a"Y23t2OE
9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7+<VeS+>ki*0H_J\+<Z%S+>b2u2BX+b+<Z%S1a"Y93t2OE
6#:LRATD4$H6==Q+<VeS85^Qb2'="a+<VeS+>Yo.0H_J\+<Z%S+>k9!3?TFe+<Z%S2BXe;%17JK
DJNZh+<VdL+<VdL+<Z&&;BRt[+<VdL+<Z%S2_m!C+<VdL+FG:S2BX_5+<VdL+FG:i+>PZ5%17J]
@q]Fa@<*J5+<VdL+<Z&&;BR\P3$9=d+<Z%S+?1u2+<VdL+FG:S2BXe1+<VdL+FG:i+>Yl:%17JN
BlI`r@3?[8+<VdL+<Z&&;BR\R3$9=d+<Z%S3&<0@+<VdL+FG:S2BXe5+<VdL+FG:i+>Yu=%17JK
@q]FoDIIQ.+<VdL+<Z&&;BReT1*@\^+<Z%S2)m3B+<VdL+FG:S2]sk9+<VdL+FG:j+>Yc7%17JR
@;TFh+<VdL+<VdL+<Z&&;BRkP2]s4c+<Z%S1bgU?+<VdL+FG:S2]st;+<VdL+FG:k+>Gqe$@G-L
@;TFn+<VdL+<VdL+FH^X+?2A?+<VdL+FG:j2(gR*+<VdLHlsOk+>khq+<VdLHltBk2)76&$@GQZ
DJN[$+<VdL+<VdL+FH^X+?;/2+<VdL+FG:i0eP.&+<VdLHlsOk+>kqt+<VdLHltBk2)[N*$@GQ^
Eb8`q+<VdL+<VdL+FH^X+>GQ)2]s4c+FG:d2(gR*+<VdLHlsOl+>GYp+<VdLHltEl0fV6($@G-U
A7]4YEa`i.+<VdL+FH^X+>G]12]s4c+FG:g3%d'2+<VdLHlt-t+>Pht+<VdLHlt-t+>Pr=%17J\
BkM!n+<VdL+<VdL+<Z&&;BR\Q0f'pp+<Z%S2`!'?+<VdL+FG:d0d%Sr+<VdL+FG:d0d&G;%17JM
@;odoCgeG/+<VdL+<Z&&;BR\Q0K:0t+<Z%S0fUdC+<VdL+FG:d0d%Sr+<VdL+FG:d0d&2)3t2OE
6=jtL@<?O(GT\+O+<VeS85^Qb2`WQ7+<VeS+>l,22'="a+<Z%S0eje*2'="a+<Z%S0eje*3BIZW
Hpqjh@<?0*+<VdL+<VdLHq7-X0fM*I+<VdLHlt4'/heCj+<VeS+>GSn0fC-s+<VeS+>GSn1,(d!
$@G-UDJ<oqD'0rD+<VdL+FH^X+>Gl11E[e_+FG:i2D-[++<VdLHlt-u+>Pht+<VdLHlt-u+>Y]5
%17JLATVL"B4Z4,AKW*<+<Z&&;BR_K2DH<s+<Z%S2)d-F+<VdL+FG:d0d&;1+<VdL+FG:d0d&;5
3t2OE6XakNE-64E+<VdL+<VeS85^Qc1GUj2+<VeS+>tu-2'="a+<Z%S0esk+2BX+b+<Z%S0esk+
2`hHUHrFa"Bm"J>+<VdL+<VdLHq7-X1,M!G+<VdLHltC'/i=ao+<VeS+>GVo1Gp9t+<VeS+>GVo
1H7H*$@G-MBOPpi+<VdL+<VdL+FH^X+>Pi03$9=d+FG:k2D-j0+<VdLHlt.!+>c)$+<VdLHlt.!
+>ko9%17JZEc5H5Df-[?+<VdL+<Z&&;BR_T1c$6s+<Z%S2*!9H+<VdL+FG:d1E\G5+<VdL+FG:d
1E\J/3t2OE:iC/dFa,#O+<VdL+<VeS85^Qc3B8c9+<VeS+>Yo.2'="a+<Z%S0f'q.1a!n`+<Z%S
0f'q.3'.QVHpMpiDfQsC+<VdL+<VdLHq7-X1G^^D+<VdLHlt:)/heCj+<VeS+>G\q0f1!q+<VeS
+>G\q0f;$%$@GcpBOPUk+<VdL+<VdL+FH^X+>Yo31a!n`+FG:j1+k7'+<VdLHlt.#+>l,$+<VdL
Hlt.$+>Gqe$@G-UE+i[#A0<!;+<VdL+FH^X+>Yr53$9=d+FG:j1G1@(+<VdLHlt.$+>Get+<VdL
Hlt.$+>PW4%17J\AS6.%F`SZJ+<VdL+<Z&&;BRbU3&2U!+<Z%S2)6dA+<VdL+FG:d2'=b9+<VdL
+FG:d2BX_9%17JNASu'gDeri)+<VdL+<Z&&;BReR1Gg3s+<Z%S1c[0G+<VdL+FG:d2]sn9+<VdL
+FG:d2]sq33t2OE7qlOP@;$c++<VdL+<VeS85^Qe2E!<5+<VeS+?2,/0H_J\+<Z%S0fU9u2'="a
+<Z%S0fU:83t2OE6"=qXGT\+O+<VdL+<VeS85^Qe2`!-1+<VeS+>ko,2'="a+<Z%S0fU:12'="a
+<Z%S0fU:13BIZWHq.UTEclUL+<VdL+<VdLHq7-X1cI<K+<VdLHlt:+/i=ao+<VeS+>Ghu1,'gn
+<VeS+>Ghu1,D!$$@G-UBlA*,+<VdL+<VdL+FH^X+>c)42'="a+FG:S3%d'2+<VdLHlt.'+>bks
+<VdLHlt.'+>bu<%17J]E+rfj+<VdL+<VdL+<Z&&;BRhN2)ZR"+<Z%S2`33F+<VdL+FG:d3?U%5
+<VdL+FG:d3?U%83t2OE6#:=FBk/>/+<VdL+<VeS85^Qf0f^s2+<VeS+>G`+0H_J\+<Z%S0f^@4
2]s4c+<Z%S0f^@50KT^NHq7[V@<*J5+<VdL+<VdLHq7-X2)7'K+<VdLHlt:(/i=ao+<VeS+>Gl!
2)-3r+<VeS+>Gl!2)[N*$@GQZDJNg$F<D\K+<VdL+FH^X+>ko63$9=d+FG:j3A*03+<VdLHlt.(
+>l#!+<VdLHlt.(+>l/@%17JKEas36EclFG+<VdL+<Z&&;BRhQ1b^$p+<Z%S1c6m>+<VdL+FG:e
0H_Jq+<VdL+FG:e0H`>:%17J\BkM-r+A69`FCB<4F`Vq$;BRhR2)ud%+<Z%S2)R!?+<VdL+FG:e
0H`,0+<VdL+FG:e0H`/,4!6h*E+iZ&6Y1.W@<HU)%17JdF^ep"ASc!jDKTE&+<Z&&;BRhS1GL!p
+<Z%S3%usB+<VdL+FG:e0H`/3+<VdL+FG:e0H`2.3t2OE6#:LRARf4Y+<VdL+<VeS85^Qf2`WZ:
+<VeS+>Yr/2'="a+<Z%S1,0n,1a!n`+<Z%S1,0n,2EM?THpMXl@<,q#+<VdL+<VdLHq7-X2DI!E
+<VdLHltC./i=ao+<VeS+>P\p0fL3t+<VeS+>P\p1,1j"$@Gc\@VKU#+<VdL+<VdL+FH^X+>u#7
3$9=d+FG:k0J54*+<VdLHlt1"+>l,$+<VdLHlt1#+>Q"f$@Gcc@<HBp+<VdL+<VdL+FH^X+>u)4
2]s4c+FG:j3%d'2+<VdLHlt1#+>PYo+<VdLHlt1#+>Pf9%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT
2)ZR"+<Z%S2)6d<+<VdL+FG:e1E\G/+<VdL+FG:e1E\G23t2OE7;R'SDJ<u2+<VdL+<VeS85^Qg
2_[*3+<VeS+>GZ)0H_J\+<Z%S1,C%02BX+b+<Z%S1,C%03'/6OFCB$#D@Hq%%13OOF%&Gr:gnEe
89.F=DK@s%+@SXt89.F=DK?q!BLP9g:gnEe%17/eF(9/tF*'Q++=M>KBl7u7F%&Gr:gnEe89.F=
DK@6L/Kf.PBl7u74s2X(HQk0e4tq=^BM`,YFAc[k%15is/g+\=F(96%E+*WoGp$s<DKU&4F!*%W
4?=TC+Dkh1Et&I7+?hh/4t\K2Huih>@rPjtF:AQd$;No?+EMC<F`_SFF<Dr"6WG7LBldj,ATT&6
@<6N5D/!m1FCcS*BkCsgEb0,uATJtm:K:@b-OgDX67sC%D/XQ=E-67FA92j$F<GX8F(9/tF*%iu
%15is/g,4PDfp/@F`\`RF)Q2CBOu4%+D>>'Ble6,ATD?)@s)g4ASuT44Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4ZtqU%16$I6ZmEi4ZX^%De!3tBl@lrF_l2@FabGg0JYF,1E\G3%16$I6ZmEi;Iso43Zq@7
6ZmEi+DtV2?Z^3s@<itL%15is/g,4PDfp/@F`\a<D00-,De*:%+B)r@F`MM#ATJ:f%16$I771'B
F`MLc3Zp+!3Zp*c$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;HrY!*EciKV
+EMX5EZf=0EccRLA8,pmEZe%o@psInDf-[?HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdb+AH9W
/PKkq+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<WNa6"4bUAM$GkEdE*B$@Es=+<VdL+>Pc3
0JG::/ho%:0fCpJ2E)aNF_kc#DBL&E+FFV*HlsOS+<VdL2`!'C0K1gC1Gq*N0etRG2B^;0<$3;+
+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL0f(O:0JPRE0d'/.DJ*[*F_#&+HjpF1+<VdL+<VdL+<VdL
+<Ve61,U[?1c$g?+A?3cBlnK.AKW+C%17J*+<VdL+<VdL+<VdL+<VdL+<Vd^0JYF,=_2#^+<VdL
+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+>Y-7Df0Z1+<VdL+FFV*HlsOS+<VdL1,^aC0JkLB
2E!HO2E!HO2]tLsGqNW<+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL?TB_r+B;B.H6==Q+<VeS
%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$7d\[/M/P+/M/P+/M/P+/LrD)
/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i5:18!N+<VdL+<VdL+<VeS6tLFRB5V."
Bl@m:<,sQVCih6sAS6BiE\0%'/P'nVBl8;@771',<,sQ]E_U7c3t2NI/M/P+/M/P+/M/P+/M/P)
/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@G6QDIm9qCgeG/+<VdL+FH^X+>br3
1a!n`+FG:h0J5%%+<VdLHlsOc+>PYo+<VdLHlt*c1,(d!$@G?XAStpi+<VdL+<VdL+FH^X+>bu7
1*@\^+FG:k1+kF,+<VdLHlsOc+>c&#+<VdLHlt*c1c@E)$@G-LEclUL+<VdL+<VdL+FH^X+>c#5
0H_J\+FG:h1+k7'+<VdLHlsOc+>l/%+<VdLHlt*c2)dT+$@G?P@rc^:+<VdL+<VdL+FH^X+>c#8
1E[e_+FG:h3%cm-+<VdLHlsOd+<WH_+<VdLHlt-d1-5pPHpMR_DffY8+<VdL+<VdLHq7-X1c[6I
+<VdLHlsOl/heCj+<VeS+<WB]1,^6t+<VeS+>Fuo2*26SHrFuu@ppK&+<VdL+<VdLHq7-X2)$mG
+<VdLHlt@+/heCj+<VeS+<WB]2)cX#+<VeS+>Fur2EM?THpMRa@;06p+<VdL+<VdLHq7-X2).*G
+<VdLHlt.$/i=ao+<VeS+<WE^0f^@!+<VeS+>P&o3'.QVHq7[V@<*J5+<VdL+<VdLHq7-X2)7'K
+<VdLHlt:(/heCj+<VeS+<WE^1H$?u+<VeS+>P&q1cl-RHqe0iCLqC*+<VdL+<VdLHq7-X2)7-N
+<VdLHlt@./heCj+<VeS+<WE^1H6L"+<VeS+>P&q2`hHUHpMd_FEMVHF!)SJ+<VdLHq7-X2)@'C
+<VdLHlt7'/i=ao+<VeS+<WE^1cHO"+<VeS+>P&r2EM?THr=ZkBl"nbASuTuF`MVGHq7-X2)I0N
+<VdLHlt:'/i=ao+<VeS+<WH_0esjo+<VeS+>Y,p0KT^NHs1Z%ASu'qB4Yt'@VHr-Hq7-X2)R0E
+<VdLHltC'/heCj+<VeS+<WH_1,9sp+<VeS+>Y,q0fogOHpMRfBOt[`@3?[8+<VdLHq7-X2)dNO
+<VdLHlt4)/heCj+<VeS+<WK`+>t>b+<VeS+>b2u3t2OE6#LdQEb0;7+<VdL+<VeS85^Qg0f(X/
+<VeS+?2A60H_J\+<Z%S+>k8a0d%S]+<Z%S1a"Y93t2OE;dj-LCEO`B+<VdL+<VeS85^Qg1H.99
+<VeS+?2&-2'="a+<Z%S+>k8u1*@\^+<Z%S2'=_03t2OE;eTT^CgeG/+<VdL+<VeS85^Qg2)7*5
+<VeS+?)840H_J\+<Z%S+>t>b2'="a+<Z%S2BXe;%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT2)ZR"
+<Z%S2)6d<+<VdL+FG:S2BX,#+<VdL+FG:i+>l4i$@G9YFCB'$DBL&E+<VdL+FH^X+>u/42'="a
+FG:d1G1@(+<VdLHlsOi+>Pku+<VdLHlt<i1,_3'$@GKTF`SZkF`VYF@;KY!+FH^X+>u2<3?TFe
+FG:k0eP.&+<VdLHlsOi+>l#!+<VdLHlt<i2)IB($@GlcB42o*+<VdL+<VdL+FH^X+?(u.0d%S]
+FG:e2D-[++<VdLHlsOj+<WTc+<VdLHlt?j2`hHUHqng%CM=n6+<VdL+<VdLHq7-X2_d'B+<VdL
HltC//heCj+<VeS+<WTc1,^6t+<VeS+?(Du2*26SHpMRj@;0a)+<VdL+<VdLHq7-X2`3HO+<VdL
Hlt:(/i=ao+<VeS+<WWd1,0mo+<VeS+?1K!0KT^NHr+B_@rGjm+<VdL+<VdLHq7-X2`E`N+<VdL
Hlt:+/i=ao+<VeS+<WWd2)cX#+<VeS+?1K$2*26SHphO`ARZc)+<VdL+<VdLHq7-X2`WWM+<VdL
Hlt.(/i=ao+<VeS+<WZe0esjo+<VeS+?:Q!0fogOHpqpeAfr3=+<VdL+<VdLHq7-X3&<6J+<VdL
Hlt:'/i=ao+<VeS+>GPm0f1!q+<VeS+>GPm0f(m#$@G-UDII7"+<VdL+<VdL+FH^X+?2252'="a
+FG:i3%d'2+<VdLHlt-t+>Z##+<VdLHlt-t+>Yr<%17JPDf&p!BOQ%*+<VdL+<Z&&;BRqX1,pC!
+<Z%S3&WBC+<VdL+FG:d0d&52+<VdL+FG:d0d&513t2OE9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7
+<VeS+>c)22'="a+<Z%S0eje,2'="a+<Z%S0eje,1cl-RHpMRfBOu3mFF#&P+<VdLHq7-X0f:'r
+<VdLHlt4&/i=ao+<VeS+>GVo1H6L"+<VeS+>GVo1H.B)$@G-WCLLWo+<VdL+<VdL+FH^X+?;G)
+<VdL+FG:j1G1@(+<VdLHlt.!+>l&"+<VdLHlt.!+>l#<%17J]@q]Fa@<*J5+<VdL+<Z&&;BR\P
3$9=d+<Z%S+?1u-+<VdL+FG:d1E\D++<VdL+FG:d1E\\>%17JNBlI`r@3?[8+<VdL+<Z&&;BR\R
3$9=d+<Z%S3&3*D+<VdL+FG:d1E\D.+<VdL+FG:d1E\D-3t2OE6"=S>Ec,<++<VdL+<VeS85^Qe
2_lKu+<VeS+>l,20H_J\+<Z%S0f1!q2]s4c+<Z%S0f1"23t2OE87?@DC`jiC+<VdL+<VeS85^Qg
0fL3t+<VeS+>bf*0H_J\+<Z%S0f1"/2]s4c+<Z%S0f1"/2EM?THpM7ND..H-+<VdL+<VdLHq7-X
3&ro?+<VdLHlt@*/heCj+<VeS+>G_r1,g<u+<VeS+>G_r1,h9($@GQZDJN[$+<VdL+<VdL+FH^X
+?;/2+<VdL+FG:i0J54*+<VdLHlt.$+>Ybq+<VdLHlt.$+>Y`6%17JWBl[foCEO`B+<VdL+<Z&&
;BR\J0fL3t+<Z%S0f1L?+<VdL+FG:d2'=b5+<VdL+FG:d2'=b43t2OE6#:(C@UX:cDBL&E+<VeS
85^Qb1c737+<VeS+>c&10H_J\+<Z%S0fL3t2'="a+<Z%S0fL433t2OE;JBcTC`jiC+<VdL+<VeS
85^Qb2_d*2+<VeS+?))/0H_J\+<Z%S0fL431a!n`+<Z%S0fL431-5pPHp_=]ASc0k+<VdL+<VdL
Hq7-X0fLdG+<VdLHlt.'/i=ao+<VeS+>Get1c?I!+<VeS+>Get1c7?($@G0OCi!O%EbTb@+<VdL
+FH^X+>Gf80H_J\+FG:h3%d'2+<VdLHlt.&+>ktu+<VdLHlt.&+>kr:%17JOCi3['BHSE?+<VdL
+<Z&&;BR\Q3ADX!+<Z%S1H$j>+<VdL+FG:d2]st9+<VdL+FG:d2]st73t2OE6#:FQCgh0'+<VdL
+<VeS85^Qb3A<63+<VeS+>u,10H_J\+<Z%S0fU9u2'="a+<Z%S0fU:43t2OE6=k7MChI=%F(HI:
+<VeS85^Qc0K(X.+<VeS+>l)10H_J\+<Z%S0fU:21a!n`+<Z%S0fU:21HQ$QHp_=[DfBi?+<VdL
+<VdLHq7-X1,C[D+<VdLHlt=&/i=ao+<VeS+>Ghu2)69s+<VeS+>Ghu2)76&$@GcdEbTZ;+<VdL
+<VdL+FH^X+>Pc60d%S]+FG:k0eP=++<VdLHlt.(+>G\q+<VdLHlt.(+>GZ6%17JKA8#Cl@3?[8
+<VdL+<Z&&;BR_Q0fU9u+<Z%S3&WBH+<VdL+FG:d3?U(9+<VdL+FG:d3?U(83t2OE:i^JaH#IRC
+<VdL+<VeS85^Qc3A`N7+<VeS+>l/32'="a+<Z%S1,'gn3$9=d+<Z%S1,'h03t2OE:iC/dFa,#O
+<VdL+<VeS85^Qc3B8c9+<VeS+>Yo.2'="a+<Z%S1,'h*1a!n`+<Z%S1,'h*1HQ$QHpMpiDfQsC
+<VdL+<VdLHq7-X1G^^D+<VdLHlt:)/heCj+<VeS+>PVn2)$-q+<VeS+>PVn2)%*$$@GcpBOPUk
+<VdL+<VdL+FH^X+>Yo31a!n`+FG:j1+k7'+<VdLHlt1!+>Ynu+<VdLHlt1!+>Yl:%17JKCiF&r
Eb$:8+<VdL+<Z&&;BRbS1cQU#+<Z%S2`!'D+<VdL+FG:e0d&>3+<VdL+FG:e0d&>23t2OE;IsK`
CiseA+<VdL+<VeS85^Qd3B/c:+<VeS+>kr-0H_J\+<Z%S1,9t.2]s4c+<Z%S1,9t.2*26S.1HUn
$?JX'<C:nLE_(4FBl7uT3ZpjY<Ch.)Bl7u7;eSTe<C:nLEX`@sA926jF`MLc3ZohmD/!m/+EKt=
<C:nLE_(4FBl7u@+>"^XD/!m/+?go(+F>:e+?hK+;eSO@EcP&hEt&IO67sBkBldd)AT2'q@sK26
Bl8'8ATJtG+?V\-1*CFJDK?6o1*AbA+?hD2+FJ6@F(8^&EcMTr%15is/g,4PDfp/@F`\`RF)Q2C
BOu4%+D>>'Ble6,ATD?)Ap&3<Eb-@V4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%16$I7Wif93Zr6W
@psInDf/p)Cisc@INUC"1c$75+>OB5;eSXCFAc[k4ZX]aBL[,d+DtV2?Z^3s@<itL%13OO;eSTe
<CV+Q4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@GiiF`MUI
/Kf+V@<*K0@<-I8+Co2(ATAneDe!3tBl@l3+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2BY_&
B.ZekD'0rDHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vda+@0ITG%E6rDfU/O%17J*+<VdL+<WEr
2E*HK1+k:81bgmH2E!K:8p+ra@;[21+<Z%@$@Es=+<VdL+?2;42)I*K2`!EK3&*0G0K1-"PZ/bJ
+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+>GZ,/hf"?1bg+HDf03%FEM,*+FFV*HlsOS+<VdL+<VdL
+<VdL?SXJk1GgmA0d'.uFD5i>A7Zl+HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL1,(O@+B`8aEZcJI
+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<WTc9lFokBHSE?+<Z%@$@Es=+<VdL+>GK,0JkLB
2E!HO2E!HO2E)aH@<jJ9A0<!;+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+C@,]2'>mu6[Bjt+<VdL
HjpE5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;/M/P+/M/P+/M/P+/M/J)
/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;Hqn*eAKW*<+<VdL+<VdLHphOeBkM<l
FD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm+@SXt/Q?aB89.F=DEA:7.kN>)/M/P+/M/P+/M/P+
.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JOCij*'Bl5%9+<VdL+<Z&&;BRkV
0Jssq+<Z%S0f(F9+<VdL+FG:S0H_Jq+<VdL+FG:c+>c.h$@GKTF`SZkF`VYF@;KY!+FH^X+>u2<
3?TFe+FG:k0eP.&+<VdLHlsOc+>Ykt+<VdLHlt*c1GV$$$@GlcB42o*+<VdL+<VdL+FH^X+?(u.
0d%S]+FG:e2D-[++<VdLHlsOc+>bu!+<VdLHlt*c1c7?($@GTkDJNr/+<VdL+<VdL+FH^X+?)#1
0d%S]+FG:k3A*!.+<VdLHlsOd+<WQb+<VdLHlt-d1HQ$QHpMRj@;0a)+<VdL+<VdLHq7-X2`3HO
+<VdLHlt:(/i=ao+<VeS+<WE^+>=o\+<VeS+>Fur3'.QVHr+B_@rGjm+<VdL+<VdLHq7-X2`E`N
+<VdLHlt:,/heCj+<VeS+<WE^1H$?u+<VeS+>P&q1HQ$QHphO`ARZc)+<VdL+<VdLHq7-X2`WWM
+<VdLHlt.(/heCj+<VeS+<WE^2)$-q+<VeS+>P&r3BIZWHpqpeAfr3=+<VdL+<VdLHq7-X3&<6J
+<VdLHlt:'/i=ao+<VeS+<WH_2)??t+<VeS+>Y,t0fogOHpMRd@;0a)+<VdL+<VdLHq7-X3&EBJ
+<VdLHlt=,/i=ao+<VeS+<WK`0fU9u+<VeS+>b2q2*26SHq&$k@;KUcF`\`K+<VdLHq7-X3&`TP
+<VdLHltC,/heCj+<VeS+<WNa+?(Dc+<VeS+>k9!3t2OE9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7
+<VeS+>c)20H_J\+<Z%S+>k8r1a!n`+<Z%S2'=V/3t2OE6#:LRATD4$H6==Q+<VeS85^Qb2'="a
+<VeS+>Yl-2'="a+<Z%S+>t>s2]s4c+<Z%S2BX_33t2OE6#LIH@3?[8+<VdL+<VeS85^Qj3?TFe
+<VeS+?))/2'="a+<Z%S+>t>u2'="a+<Z%S2BXe33t2OE;e'KPA79L$+<VdL+<VeS85^Qb2E2g%
+<VeS+<WWr0H_J\+<Z%S+>t?"0H_J\+<Z%S2BXh83t2OE6tpURA76T'+<VdL+<VeS85^Qb3&i$'
+<VeS+?2,/2'="a+<Z%S+>t?"1*@\^+<Z%S2BXk23t2OE6"=S>Ec,<++<VdL+<VeS85^Qe2_lKu
+<VeS+>l,22'="a+<Z%S+?(E"2BX+b+<Z%S2]sq63t2OE87?@DC`jiC+<VdL+<VeS85^Qg0fL3t
+<VeS+>bf*0H_J\+<Z%S+?1Ju2BX+b+<Z%S3$9q43t2OE6"=>?@<*J5+<VdL+<VeS85^Qi3B&''
+<VeS+?)/10H_J\+<Z%S+?:Pe2BX+b+<Z%S3?U1@%17JWASu9lEZcJI+<VdL+<Z&&;BRtS0d%S]
+<Z%S2D?a@+<VdL+FG:S3?U%2+<VdL+FG:l+?;Lm$@GQ^Eb8`q+<VdL+<VdL+FH^X+>GQ)2]s4c
+FG:d1bLX.+<VdLHlsOl+>Yhs+<VdLHltEl1GLs#$@G-UA7]4YEa`i.+<VdL+FH^X+>G]12]s4c
+FG:g3%cm-+<VdLHlt-t+>bnt+<VdLHlt-t+>bi8%17J\BkM!n+<VdL+<VdL+<Z&&;BR\Q0f'pp
+<Z%S2`!'?+<VdL+FG:d0d&5-+<VdL+FG:d0d&5*3t2OE6XaqFCi!N&+<VdL+<VeS85^Qb2_[36
+<VeS+>Gi.2'="a+<Z%S0eje+2BX+b+<Z%S0eje+1HQ$QHpVC\CghF+Bm:aC+<VdLHq7-X0fM*H
+<VdLHlt:+/i=ao+<VeS+>GSn1G^-r+<VeS+>GSn1GLs#$@G9YDIIX#+<VdL+<VdL+FH^X+>Gf8
0d%S]+FG:f2D-[++<VdLHlt-u+>Ykt+<VdLHlt-u+>Yc7%17JKCi3s'@;R,0+<VdL+<Z&&;BR\S
0Jago+<Z%S2E!0A+<VdL+FG:d0d&;0+<VdL+FG:d0d&;.3t2OE6=k7MChI=%F(HI:+<VeS85^Qc
0K(X.+<VeS+>l)10H_J\+<Z%S0esjo1E[e_+<Z%S0esk+3t2OE6XakNE-64E+<VdL+<VeS85^Qc
1GUj2+<VeS+>tu-2'="a+<Z%S0esk-0d%S]+<Z%S0esk-0KT^NHrFa"Bm"J>+<VdL+<VdLHq7-X
1,M!G+<VdLHltC'/i=ao+<VeS+>GVo2)??t+<VeS+>GVo2).0%$@G-MBOPpi+<VdL+<VdL+FH^X
+>Pi03$9=d+FG:k2D-j0+<VdLHlt."+<WQb+<VdLHlt."+>c.h$@GZjDe"'2DBL&E+<VdL+FH^X
+>Pr61E[e_+FG:h3A*03+<VdLHlt."+>c#"+<VdLHlt."+>br;%17JZDes64GT\+O+<VdL+<Z&&
;BR_T3A;Qu+<Z%S1H$jC+<VdL+FG:d1E\P2+<VdL+FG:d1E\P03t2OE6$?s\EZcJI+<VdL+<VeS
85^Qd1GCa1+<VeS+>l#/2'="a+<Z%S0f1".3?TFe+<Z%S0f1".3'.QVHrG0$@;0O#+<VdL+<VdL
Hq7-X1H%$G+<VdLHlt@&/i=ao+<VeS+>G_r0f:'r+<VeS+>G_r0f(m#$@G-UE+i[#A0<!;+<VdL
+FH^X+>Yr53$9=d+FG:j1G1O-+<VdLHlt.$+>Ykt+<VdLHlt.$+>Yf8%17J\AS6.%F`SZJ+<VdL
+<Z&&;BRbU3&2U!+<Z%S2)?j=+<VdL+FG:d2BX_4+<VdL+FG:d2BX_13t2OE6tL7I@W-'k+<VdL
+<VeS85^Qe2)@'3+<VeS+>ki*2'="a+<Z%S0fL442BX+b+<Z%S0fL441cl-RHq.m^DII3$+<VdL
+<VdLHq7-X1c@6I+<VdLHltC(/i=ao+<VeS+>Ghu1,C$q+<VeS+>Ghu1,1j"$@G-LEclUL+<VdL
+<VdL+FH^X+>c#50H_J\+FG:h1+k7'+<VdLHlt.'+>Yhs+<VdLHlt.'+>Y`6%17JQ@:O>#GT\+O
+<VdL+<Z&&;BReT2DZHu+<Z%S2)m3B+<VdL+FG:d3$:":+<VdL+FG:d3$:"83t2OE6#:7RFD)d>
+<VdL+<VeS85^Qe3A<<5+<VeS+<WZs0H_J\+<Z%S0f^@!0d%S]+<Z%S0fU:53BIZWHrFuu@ppK&
+<VdL+<VdLHq7-X2)$mG+<VdLHlt@+/heCj+<VeS+>Gl!1GU'q+<VeS+>Gl!1GCm"$@G-UCLLpf
+<VdL+<VdL+FH^X+>kl60d%S]+FG:d2(ga/+<VdLHlt.(+>ktu+<VdLHlt.(+>ko9%17JR@:Wee
+<VdL+<VdL+<Z&&;BRhP2E)a$+<Z%S2)R!?+<VdL+FG:e0H`))+<VdL+FG:e0H`>:%17JWASu9p
DKI!D+<VdL+<Z&&;BRhP3&i$'+<Z%S2`NEI+<VdL+FG:e0H`),+<VdL+FG:e0H`))3t2OE6#pIW
F`MVG+<VdL+<VeS85^Qf1Ggd.+<VeS+>br.2'="a+<Z%S1,'h+1*@\^+<Z%S1,'h+0KT^NHr=Zk
Bl"nbASuTuF`MVGHq7-X2)I0N+<VdLHlt:'/i=ao+<VeS+>PVn1cHO"+<VeS+>PVn1c.9'$@H$"
@V'FgChI<sF^f&-+FH^X+>l#40d%S]+FG:k0eP.&+<VdLHlt0u+>l,$+<VdLHlt0u+>l#<%17JK
CiF'!@q/pi+<VdL+<Z&&;BRhU3AVd#+<Z%S1H7!@+<VdL+FG:e0d&;-+<VdL+FG:e0d&843t2OE
6#LdQEb0;7+<VdL+<VeS85^Qg0f(X/+<VeS+?2>52'="a+<Z%S1,9t.2BX+b+<Z%S1,9t.1HQ$Q
HrFH_Bknh6+<VdL+<VdLHq7-X2D[9O+<VdLHltC&/i=ao+<VeS+>P_q0fL3t+<VeS+>P_q0f1s$
$@Gcc@<HBp+<VdL+<VdL+FH^X+>u)42]s4c+FG:j3%cm-+<VdLHlt1#+>bbp+<VdLHlt1#+>Yr<
%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT2)ZR"+<Z%S2)6d<+<VdL+FG:e1E\M/+<VdL+FG:e1E\J6
3t2NG%13OOF%&Gr7WifDE_U7cF$2Q,771'GE_U7cF!+Cp771'EF`\'"F(B?%Ap&2Y3ZohmD/!m/
+EKt=<CV+Q89.F=DK@6L/Kf.PBl7u74s2X(HQk0e4tq=^BL[,d;IsnY$;No?+Co2-@rc."@;]S#
+Dkh1F`_29+>"]u3Zp1#D/!m/%15is/g)nl4usfM/h\>pF(B?%Ap&2)$4R=O$?L'&F`_SFF<Dr"
6WG7LBldj,ATT%\9M@*7:Jt._02kYH<(J-&E_U7c+D,Y*EA)BT@<?Q54Ztqk4Zt/%$=n3fD/!lN
3Zr<NF(8^&E\)*=F(8g)F=_<?F(9/tF*&sSA927"@<6NAF(B?%@s)g4/9>?C@qKk*%17/nDfp/@
F`\`REaa/7D.R-n3Zoe$,!$i`ARTI!A926tBl4@eF)>i<FDuAE+=C]6F*)G:@Wcd,Df-\+@WQI(
F`_1;D/!m1FCcS*BkCsu-OgE(D/XQ=E-67FH[C#\HQk1n+>5bu0RJ(nI3:^lAo_I&+FI^@@r5pt
%17/nDfp/@F`\`RF*(i4F!+n#F)Pl;FCcS3Bl8'8AKYMtAnH*3%17/nDfp/@F`\a:F*(i4+FI^@
@r5pt%13OO0H`%pATD4#AKW?qBM`,YF<F=l6ZmEi+AQT>F`\a$BM`,YFAc[k+AQT;F`MM#ATJth
BL[,d;Isnl771'GE_U7cF!,RABl7u>%14d30I14M@<6!&-Ve>D6WHrkF*&Nn6WHrkF*'rn9keKd
+@SXt6ZmEi89.F=DK?pqBLP9g6ZmEi+@SXt7WifDE_U7cF!+4k771'EF`\u?$8<SV,\;")F(HIA
F%&Gr:gnEe89.F=DK?qA771'BF`MLnE_U7cF!,Nm6WHTuF@^FHBl7u>%14d30I14M@<6!&-W=\T
@<6N5;eSO@EcN:$BL[,d+B)rM@<6NgATJtmBL?o_E`-Ii+B)rCF`^MmF!+Cp771'O@<6N5;eSTe
<C:nLEZe:o771'EF`\u?$8<SV,\;")F(HIADIdfu@s)f7DIdfuAp&2<DIdfuE+*g0+EM(7@rPjt
F<GX8F(8^&EcN:DA926mF`\u?$8<SV,\;")F(HIAA926tBl5:@+AP6U+Co2-@rc."@;]S#+Dkh1
F`_29%13OOGA1r2@q01\EcW?W%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9s@<Q^6@<-Er
ARfjiF)>i2AL@ooEbTT+F(KH#EbTT+F(KH#F)>i2APPQE.WT6EATMF)?ZKk%ATMF)?ZU(&CLnW1
/M/(nEbTT+F(KGB+EMC<CLnW1ATMs7/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@1,fXL:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,E?XE\K3jCi<flFD5Z2+DtV)AKYDlA7]9\$4R>YDdd0!-ZWpBATMF)-OgCl$;No?
+Dk\$F`S[EB.b;e3@lm=0F\@_69R@P?T0\l0K:jE+>bi+1G^gC+<XEG/g*K!F*)><%16646p3RR
0f_3Q+>Y,q0F\@h:H^`]0F\@a67sBhA7Qg$@VTIaFE8RBDfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)
/Keq>D.P7@Ea^LAA7]6[$:.HS4Y@j*4?GSO<b6/kF!iCf-p0=@/iPR@1-$d74>AfJ1c-mH1(=RV
:I72s+=nil4s2783[[]i8mb>%D.Ohc6:tT_6!m5>0JG1':I7Z\6tKk88hr(S0IJ:l/1r&2:I5Kt
6tL1V@8q;DG%G].A7]+gBldj,ATV9B3Zp:<%14I`EcW@5:gnB]F!j+3+=LAe6p"CE4%qt&4@)b0
.3NYFF(KE(F<Dr3ASuX3-OgD:+>>'PEaa$#+=BQgCij)bF&-sjEbT&q?ZKk%ATMF)?RH9i%15is
/g,=GCis<1+CT;%+EqOABPD?,0ea_eBl8'8ATJu4Afu2/AKYi$AT`&:@W-1#+:SZQ67sC$ATN!1
F<E.XDJsV>B6%QlF<G%8F<G47De'u%DJsZ1BHUo*EZen(D/UP@DfTV&$;G)CF`VD6DEU$'+=f)h
+>G!E+>tnr0d%qi0d'aE0esk,2'=Fm0f^@50d&#.+>P&s2%9mI0H`P%4t\L99k@mYF)>W/+>"]d
0-VMn+C-*J0H`(m.O$Si>p*K0+F>^b0d&P5+F>:e+BEN(+:SYe$;<cL3ZoPP0ekR=1H.0O2)ZR6
1G1RB2E*QP+<Ve%67sBTATDKqBjkm%%16646p3RR1,(I>+>Y,q2[p*o:H^`]+>t>b+<VdL+<VdL
+<VdL+<VdL+<VdL+AP6U+AGd6+B;B.+E(k(F(KG&$4R=i;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi
+ED1;ATMF)+=BHkB5_T6+:SZ*;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T6
4"!p?B4Ym,4"!sGBk(R!%13OO:-pQU6?6dQBQP@qFCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjklg
$;No?+D>k=E-"&n06_Va/n&R5@;]L`/n8g:04ApDEc5i6D0[dDEbT0"F=hQU@<-EBH>.>.De*E4
3&<HL2D6g>1,CL91G(@@%15FC4ZX]I3[[40FCAm(+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d
@<,do+AuodAS`JV@;odoCgeGQASc0kFE2)?-OgDLF$2Q,6?=\>3[[7*FCf9$AT`'*+B)upBm"J>
:i^JaH#IRC:iC/dFa,$,AS6.%F`S[(E+rfj+@1$XFEMVHF!*bdFCB3$F!+LpB43/1%13OO-W5".
@o-TSD0%'f3ZohR9gh'C:HM6:.3NYFF(KE(F<Enk%13OO:-pQUFE1f-F(o`;+DkP/@qZus@;0au
Gp%<BCht57Bldi=F(KH7+Co1uAn?!*2'@!Z+>GPmD/!m1FCfM&$:8f5Ea`j,BllL!+?:Q!3%Qd<
+?1o,1*A>0/29%*1Gp^<3$9t-0fU:40e>%=+>bl*3\`T:2),OI6??+H@;^.#F?MZ-6??+H@;^.#
F<E+W0f^@30e>(6+>GT%1,0n//2Aq&0ek471E\J1/2A>*1b:F*1c-a@+>l,03]J6=%13OO:-pQU
FE1f-F(o_=@;L%"FEM,*+Co%rEb/g'%15FC6#:X+3Zp:;+?2>'0fC.62]t"6+>Yu"3&_s;1(=RW
F$XVa4ZX]PF$XVa/2]4+1-$I70d&D3+>l,$1Gp:52'=V6+?24f$4R>A9i*u6+F?-n0d'A8%15Bp
<'<8b-n%244"N'7-@7('+B2'3.3L/o+@:-8Cigd/$<0o&4ZX]6-p04G1*AA%-@7('+B2'3.3L/o
+@:-KEa`j,Bljdk%15is/g+S=FD5i>A7]g)D..NrBHVD8+>G!LAS6$pAISu$+?^i2/h\>!0-W+n
5tk5e$4R>;67sC&Ea`j,BlkJ>Bl.F&+DkP/@q[!,D]gbWD/!m1FCcS/DBO.AEcZ=F@psFi%14g4
4Wlp@0-GWb-oNb%,<B-l?SN[/+>=om+F>:e+B26<.3L2b2D?6u3aOjS0d'aE1*A@qHQk0e<)Q[)
$4R=i8O6?!:-ho.4ZX^%Ddd0tFCB32+>=63.!mQj0d'4W<[g0m+F?-n0d'4W<XfBaHS-Ks+A"k!
.6T^7HTE?*+A"k!%14IX@<Q[4+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%i@<Q!VFCB2s
:18!N%14IS@<HU3+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%d5uh8e@;TQb$4R>;67sBk
AS,@nCigd/$7APZEbT&u@;^+,+Dae]D.Oi":gnB]F!j+3+DG8,?Z^3s@<itL%13OO:-pQUA79Rk
+E(j7<GZeuFWbaI@<*K0@<-I8+Co2(ATA4eF\5%b3Zr0[Ch@]t@;I'/=\V:I3Zp131,9t,0H`)1
%16*/<Dlg[3Zp.50eP.73A`H5?SXJk1GgmA0b"J4<E)=K3Zqci/i=a\$?]$:5t=(!+>ti+%175O
85E,e4ZX]C%175Q5tsd23ZoeMCisc@+>"^WFCB24E+*d/Gp$X3DImi9%14I_Cisc@EcW@>:18!N
+Ce5VEc#kF4ZX]6F]hF,4*=.`4&nsS;H5f$<E)=IF\GLq7ltie85E,e4*=:a9gpKRBjl-kFDk\u
Gp"dM$7AhiF`MVFF!,9o@;TQu@o-TSD0%'f3Zohn=\V:GF\5%`<D6Cj<BG>'<'r`i9MIfC4*=4f
:Jt@XF\Y4s74B?s@<Q""De*:%+>=63%14IX@<Q[4+Dae]D.Oi":gnB]F!j+3-u<g3@<?4%DI7[#
Ci"$6F*)><AUYaV3AWH63?U(7/iPX:+DG8,?Z^3s@<itL%14IX@<Q[4+Dae]D.Oi":gnB]F!j+3
-u<g3@<?4%DI7'qD.S/=0f_*L+?(Dt3%5tf@<Q""De*:%+>=63-Ve)nEcW@>:18!N+Ce5VEc#kF
4ZY!-De!3tBl@lrF_l2@FabGg0JkR.2]sk)+DtV2?Z^3s@<itL%13OO0H`%pATD4#AKW?d:I60u
AS$"*D/!l1<cW7(9L9k)9gg+(:EWPV+@:,l6??+H@;^.#F<Enk6#:Wc<)$135tk6#<)Q[<:18<d
F!+%_F`MOG@o-TSD0%'6$8<SV,\;")F(HIB4$"`\5uf%&5uo?^+=nW`HS-Ks+AP4'.4cTg/g<"m
8O6>c$8<SV,\;")F(HIAF]hF,+E^:E+B;*8;H4i^<E)=.F\GLq7j)qJ85E,e+AHEfBk1pdDK9e@
<GZeuF`MOGF\Y4s73HDA@;TR'%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV:"Bldj,ATV:#
D/X3$-ZWpBATMF)?Z]^oDImiqF)>i2APPQE.WT6EATMF)?Z]^oDImiqF)>i2AKZ(H/Kf+ODeio,
FCfN8F!,(5EZe=iDJj$++Eh=:@WO.2$;No?%15is/g+hLFDu:^0/%3SDfB`8B6%EtD/!L$/n8g:
05boS@<?4%DK@H?$;No?%15is/g,=KEaiI!Bl,mRF(Jo*Bl5%AAp&3:.1HVZ67r]S:-pQU+<XEG
/g)tnA8-+(+FPjb1a$=HC`k*CF`_&6Bl@lr-OgDX67sB'+Du=D@<?4%DI7*q?YjXuB5)I1A7]+Y
:ig>XD.F(_:-pQU+<YQEFCB9*Df/orDI7<kCh[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.F(_
:-pQB$;No?+CT>4F_t]23Zr'UDfp"A-us$CATMF).3N>G+Dbt)A7]9\$;No?%15is/g+YEART[l
A3(hg0JYG$@<+(X%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OOCi<`m+=D2DF(KE(F=.M)%15is/g+hAB4rE,EbTE5+E2@4
@qg!uDf-!k-oiG30ek+"0fBIJ%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+YBD/`p(AKX`jFCB9*Df-[hDBMAXCh[j1
Bk(Rf+A?]kB5)I1A7Zm*D]j43Cis<1%15is/g+YBD/aW>ARlolF<G7=FDu:^0/%3SDfB`8B6%Et
D/!L$/n8g:05boS@<?4%DK@IFDId='/oYKC%13OO:-pQU<+ohc@:NeiEa`I'+E(j7FD,5.@ps1`
F_kK.Bl@l3A7]7kARTXkF!,R<AKYT-Ecbu+EZee7@<i:h:-pQUH#IgJB4Z0-Ao_g,+EV:.+A+CC
0JFV\E,T6"+EqL5@q[!!F!,[?Gp$[;De!I%+CT;%+ED%7ATS@g:-pQUAThX*Gp$^5Aor;@H"CE)
F!,CA+EMHD@;]TuDIn#7@;KRpEbTW/D0$h9Bkq9&FD,B0+E)./+CT;%%15is/g+SCAKZ#)B4Ysl
Eaa'$A0>K)Df$V<Derj&+EMgLFCf;3@qBIfF*),)C`mS+@q]:gBk)3:%13OO:-pQUFCfN8+Cno&
ATJtJ+B;AM$@-K!4ZX]@0JYF,1E\D-+=nWi3Aif>0esk+0d&"i1,1RB+>GVo0f(@'0fUj@+>P&o
+=oPr0f_$I+?(E$%13OO:-pQUF(f9"F<G+&FCfM9AoD^6@<,m$@;]TuF(KG9FD5T'+EVNE1,*B&
0f<f/1GNqn<E'D7An5RlF$2Q,An5LoBPhf5BPhfR3Zp13+>G_r1GK=GH#7(I4ZX^-De*9uALKbq
0eb:8,CUk_D.G(GFDk\uH#@OCH#7($$@-K!1-IZ@H#7(I+=eQ_,C+-:1+==j+=oQ-+>>?YA8#h$
%13OO8jmba3Zp172D?g>2(g`q$8O:j1E\Ir0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo
+>A.fD.F(_DKU%a3Zqc`/het72`!-B2_[05:-pQUA7]B_$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.
ARAtEF(lah6k'Ju67sBhB6%QpF!,RC+?(ERARfFk@;Kuo$9^$b-SR/3-Qjfs+Z_A-+<YQEF<E+q
+Du=3%13OO8jmba3Zp171H%6J1G1No$8FOu3?U%3+>GSn/NP"/H[0I=%15]qF<E^h8jkg'+DQ%8
Ao_BiC`kHZH#7($$>t!.4ZX]m0J5%50JY@<1bgsD%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y
:ig=n8jj*q:-pQU@:sUlATJu9D]gt]A7]7bD..7%%156O+=Aiq2^]^r3$C=<.3KaNF`\`W3Zr<_
@grbS$;*^.4ZX]@2)$a>3B/WK%14jF1Gp:01*A;-+>#Vs14+:`A.8l<7!'P7+A,$b3Zr0[Ch@]t
@;I&AH[0I=%16uqF?MZ-?SF)d0JP@A3B&iS0b"J-F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]
+A,$2$;No?+CSo'AS#p*FDi9Z+Co%nBl.9pEt&I>0-DVr/i>"!-o`A21+==gDKU%D/34nkF^kjf
%15]qF?MZ-1,CjK2)7*C2%9mI3&!$/1*A:o/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\
H#7($$>t!.4ZX]m0J5%51,1IB3&!6L%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q
4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc/2`WiX/i=(F0f_$I+?(E$+>#Vs
1jaLbA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&CH[0I=%16uqF?MZ-0J5%51c7-I0JtO?%16uq@m)jq
DKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>;
67sBuDf-[O+B;A`FD5T'F!+1cGp"gm+>PW)2BX_13]&WR1,9tP<"01,7!(RQ+>Pc21H76N/hf4=
2`NQL0K1gB2[p*d6p3RRC3=?)EarNo+>PW)2BXk.0d%thAn5LoBPhf50f'q/1E\G.%156O-SR/5
-Qjfs+Z_A-+A,%D+=oPr8jj*qDKU%a3Zqc`/het52)-sE3AE<!$>sur4ZX^'F`_&6Bl@lrCi=3(
BlnK.ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LmC1,1I8
1GgpC0K;!O2DR9N%14L;H[0I=1+==t3Zp131,C%5/2At'.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&?
H[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]m0J5%51,1OB0K(pJ%16uq@m)jq
DKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>7
7!(RQ+>Pc02`N`M/i,=@0ebRG3ArWQ2@U!A0me1_A25SV/NP"/3ArW82_6^@+=eRHA8#h$%15]q
4ZX^#F_kZ1@ps0r0me1_A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-?SF)d0JbOG
1H.!B1CX\/F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQE
F<E+q+Du=3%13OO8jmba3Zp180JY@:2_HmC1bg[D2`WcO3Aq<R-o--pD.GCN+>#Vs1,1RE+>tc1
+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r14+:`A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uq
F?MZ-0J5%51,CpN1H@3L%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541
+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>P`33A`NK/i,=@0ebRG3ArWQ2@U!A1OFCaA25SV
/NP"/3&!*12_6^C+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r1OFCaA24T$4YJ0:/ib:%-o`A21+=><
7!'P&3Zq$_%16uqF?MZ-0J5%50fCsL2`3BF%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n
8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc/3&NWP/i,=@0ebRG3ArWQ
2@U!A1jaLbA25SV/NP"/3AWT:1+Y.6+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r1jaLbA24T$4YJ0:
/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-0J5%52).$J0JkO?%16uq@m)jqDKU&0FD5Z2?YjXu
B5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R=O$;No?+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+Cf>,E+*cu+AR'$@<?4%DBMMg+AZH_BlS90FEo!)Aft&dAKXEOCh[j1Bk&9-D]j43Cis<1%15is
/g+YBD/aW>ARlolF<G7=FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@IFDId='/oYKC
%13OO8jmba3Zp172D?g>2(g`q$8O:j1E\Ir0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo
+>A.fD.F(_DJs*.4ZX]>/het71,(O@1-%?T3$:s_/g+\9B+52cDe3EA3Zr<_FCB9*Df/p#@Vfau
F_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%15is/g+S8Eb/g'+EVNE1*C+=@qfdgCi^$m4YIp*0J5+.
+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.4ZX]@1c%$M0f(F>%14gM2)ud61*A;++>#Vs0me1_
A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&@H[0I=%16ukATU'r+C?fT0JG7@1,:gJ1GpmA%16ukARdka
+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQ?
ATT%G3Zr<YARc/V%15]qF?MZ-1,Ua?0f_3G2%9mJ0f([00esk+1E\81+>S:hD.F(_8jmbD4Wm?b
4ZX^#F_kZ1@ps0r14+:`A.8l`De4#R3Zp+/0JG7<0f_*L2Dm0C%16ukARdka+Du=D@<?4%DI7<k
Ch[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2$9^$b-SR//-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V
%15]qF?MZ-1,CjK2)7*C2%9mI3&!$/1*A:o/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\
H#7($$>scnF?MZ-0J5%51,1[E1cR3M2DbjMDJs)r4ZX^'F`_&6Bl@lrDdmNsEHPu;H!b,mCh[j1
Bk(L\7<!<9AS3,X6k'Jd0-DVr/i+jt-o`A21+==gDJs*.+=oPrDJs)r%13OO8jmba3Zp171,h3Q
3A*/u$8FOs2'=h#2BXS4+>eFjD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r1jaLbA.8l`De4#R3Zp+/
0JG1?2`*6J3&30J%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2
$9^$b-SR/0-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V%14d30I14M@<6!&-[BQ>+F.g71*C1>BPhf5
BPhf58jmbD8jje>F`\aDF^lP3De4#5DJs)r-OgCl$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#
FCB')ATD.!D/X3$-N                                                         ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C7+>P&o1E\J-+>Get1bg+-3?U16+>PYo1bg+-3?U(9+>PYo1,0n,0H`,1@WcC$A7'@kF(KE(
FCKB,Ch+Y:EbTT+F(KGB+CT.u+Co2-FE2))F`_2(F_PZ&?ZKk%ATMF)?Y"(b@WcC$A0>;uA0>Ds
F*)G:@Wcd(+ED1;ATMF)+AbHq+CoD#F_t]-FE2):ATMF)?X\%bDDGR?D/X3$@rH4'@<-("B-9eh
-t.4+DDEX`FDi:5G[k<$+=LZ?@;[hL+CT.u+A*b)@<,k"@;[N7Bldj,ATV9jF)Y].@;B4kD/X3$
FCfN8F!,(5EZdelE+NoqCER&'A0=TXAT`&:cBM9N@;KRpEbTW/D/s?3ATMF)?Ys@cF`Uo2D/X3$
F)>i2AKZ)+F*)IGAoD]49k@mYF!,X;Eaj*1Bldj,ATV:"Bldj,ATV:#D/X3$-us$CATMF).3N\K
Deio,FCfN8F)ku9ATMF)?Z]^oDImiqF)>i2ATM^,CLnW1ATMs7+D,P4+B2ceDImi2G%G]'Er  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(X/0f'q.+>bbp1*A>23A;R20H`+n1c.3N+>GVo1*AG01E\D0+>P&s1c7061,L+/+>u/72_cF0
1*A=p1,(XI1E\D0+>P&u2`3T<1bp1/+>l/=2]sk9+>P&r2`Wl@1c-=1+>Yr33?U%1+>P&s0K1+/
2'=Xs3AiN61,9t-+>Pr23&s<GBkM+$?W2&TEcYS^ATDKqBjkmd6#:CHDII$^1,EcUE\]R\D.GC\
+<W6f/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%144#6>pC[+<VdL+<VdL+<Ve)Bldj,+<VdL+<VdL+<X$lDf]u2F'Kh1
+<VdL+AH9WDJ=38A7Zl++<VdL;e:&l%144#+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XBi
EbT&u@;[21+<VdL+<VdL+<VdL+<VdL+<VdL%144#/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+
/KcVs/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M.D=+<WsdFCAm(+<VdL
+<VdL+>Pu71*Ak89eKZn+<VdL3BAlS+@.VS/mKMA+<Vd\/iYO-+<VdL+<VdL+<WI$2)QLQ/kms'
%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL+<VdL+<WO!_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+BK!Z%144#6tL7I@NZd9+<VdL+<Vd]0KM$L+Aa[b/mKMA+<WBm3\WN95qYka>Tb.3+>GK)
0H_J\+<VdL+<VdL3BAoR+Aa[b/mJhm+<VdL+<VdL+<VdL+<VdL+AO%%+<VdL+<VdL+<VdL3&ndZ
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%%13OO+<X-lD..6o@<HZ7+<VdL+?2D<1*Ak89eKZn
+<VdL0etdF2'>^J9eKZn+<Vd]/i#+'+<VdL+<VdL+<WL%0fU:P/kms'%144#+<VdL+<VdL+<VdL
+<Ve*73E]q+<VdL+<VdL+<WBs_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+B)>N$4R=b+@0gV
DepO=+<VdL+<VdL2EEZP+@.VS/mKMA+<Vd`3\rW9:bGHp>Tb.3+<WEl1,'gn+<VdL+<VdL+>Pu5
3?UU?9eKZ[$6UH6+<VdL+<VdL+<VdL+<XEJ+<VdL+<VdL+<VdL+?2<sYTP&2+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL:0.l3%144#6#:(C@UX:cDBL&E+<Vd]0KM'J+@.VS/mKMA+<WR'0JXbI/kms'
+<VdL+>>E.0H_J\+<VdL+<VdL0fh$G+@.VS/mJhm+<VdL+<VdL+<VdL+<VdL+AP?J+<VdL+<VdL
+<VdL2DW.R+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%<t,KG$6UHhBkM!n+<VdL+<VdL+<WC"
0ea_H/kms'+<VdL+>u8;0d':F9eKZn+<VdL0J5(6+<VdL+<VdL+<Vd]1-.-I+@.VS/mJhm+<VdL
+<VdL+<VdL+<VdL+@RCq+<VdL+<VdL+<VdL1H<7U+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.
%13OO+<X$[E+Nj%@3?[8+<VdL+@Bj`@s)X-Derj&>Tb.32EEZN+Aa[b/mKMA+<Vd\/ho%&+<VdL
+<VdL+<X$cEas6/E,TQ$Ea0%\+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL3&e^Y+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$4R=b+@9XUCghF+Bm:aC+<VdL0etdF2'>^J9eKZn+<Vdb
3]/W7:bGHp>Tb.3+<WBk2D?6r+<VdL+<VdL+>Go41*Ak89eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q
+<VdL+<VdL+<VdL+>kpkYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHXATVL"B4Z4,
AKW*<+<WBo3]/W7:bGHp>Tb.3+?)>:0d':F9eKZn+<VdL0J519+<VdL+<VdL+<Vd]3]/f<5qYka
>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vda1W$@=+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<X_p$4R=b+B)upBm"J>+<VdL+<VdL1HI6J+Aa[b/mKMA+<Vdd3\`?3:bGHp>Tb.3+<W6j
/i57)+<VdL+<VdL+>Go30d&b79eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q+<VdL+<VdL+<VdL+>Pso
YTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL;caD8%144#:i^JaH#IRC+<VdL+<Vd^3]&W8:bGHp
>Tb.3+<W[*0JstL/kms'+<VdL+>>E)0H_J\+<VdL+<VdL1HI<H+@.VS/mJhm+<VdL+<VdL+<VdL
+<VdL+@RCq+<VdL+<VdL+<VdL2)2tP+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.%13OO+<XL!
Ci"6=+<VdL+<VdL+>Go22]tpL9eKZn+<VdL3BAlL+Aa[b/mKMA+<Vd]/i#+'+<VdL+<VdL+<WO&
1,'h:/kms'%144#+<VdL+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WU"_QY.*+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+APuI$4R=b+Auc`F_l2A+<VdL+<VdL1cdHN+Aa[b/mKMA+<Vd]0fh*I+Aa[b
/mKMA+<WBk1b^$p+<VdL+<VdL+>u892BY:<9eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q+<VdL+<VdL
+<VdL+>l-qYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHiE+rfj+<VdL+<VdL+<W[*
1GL"K/kms'+<VdL+>Pu81a#(:9eKZn+<VdL0eP.6+<VdL+<VdL+<Vdd3\`B45qYka>R_#_+<VdL
+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vd_28ZR?+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<X_p
$4R=b+@1$XFEMVHF!)SJ+<VdL3'&fL+Aa[b/mKMA+<Vd_3]&Z95qYka>Tb.3+<W6i/ho%&+<VdL
+<VdL+>GT30Jah;/kms'%144#+<VdL+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WR"_QY.*+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+APuI$4R=b+@0me@<,q#+<VdL+<VdL0fh-N+@.VS/mKMA+<Vda
3]/l>5qYka>Tb.3+<W?j3A;Qu+<VdL+<VdL+>GQ20K:1@/kms'%144#+<VdL+<VdL+<VdL+<Ve*
73E]q+<VdL+<VdL+<WC!_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+B)>N$4R=b+BE&d@3?[8
+<VdL+<VdL0ebXE2BYgK9eKZn+<Vdd3\WB55qYka>Tb.3+<VdL+<VdL+<VdL+<VdL+>l283?V-N
9eKZ[$6UH6+<VdL+<VdL+<VdL+<XEJ+<VdL+<VdL+<VdL+?26qYTP&2+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL:0.l3+<W6f/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15j=G%kStFD5Z2?W2&TEcYT0G]Y\u:18<Q;flGg
?VYMG:18<Q;flGg?VY$HAI1\3H"D#'6tLFRB5V."Bl@kq:18!N?U]'^D/X6/B6ae^83mPMARfOj
DIIX$Df,k^D..'a:18;P;IsHOEb0,uATJ:f0F:QoCgh?uEs^-s+B<H'@:^QUBl7j0BlaT&BOr<*
Deru-.!'K=E[_;N0f]P8+?2BuYR*';0JNl<3*f`H2I-b!0aU-^E+ig'@<?f%cESKXDIdd+D.R6d
AI3HlAKYZ)EcYe>F!,@/G%GIr1Gq,u:*;;P_QX>%/hf0i><#nm3F*($1'p6aCLLWXcESKgBQ%I"
Bk(ju$"ImfDIm?$DIIBn/0H-UBQ%I"Bm:b0Bl[`.+DG^96#pCCBk%H*2)GV<+>bjjYR*';1H,VE
3*f`C0O5+p1C6uiBOt^_EXC$r+@BRYF(oQ3ASGRa$$9il+C]A&@<6N5-uW]?6Xb%WBl@s%BjiFs
1Gpim:*;DP_QX>%/i#9j><#nm0elrC$8`&WBlI`r@0t5b+@B^^BaJlpAKZ&*@rH6q+D,Y4B-8Tl
Df&p!BOQ%*+Eq78+E).-AKZ).AKYT!EcZ=O#r=Cu#u_s$35Vm+1+k7;$!TAp>;7m=%14s!6"=S>
Ec,<+$-odu7<3*Q@;]ccASu$$De:,6BOr<,Bm+'.+=K[!Bk1XiF`Su<1G^oq;]mqV_QX>#/i><h
><#nm0f*)E$8r2]@;TFh$-odu6#p[NFD5e&Ap%p+/SB*BGA\O>@;TH[1GUor:*;;J_QX>%/hesc
><#nm0f3/F$9&8W@ps4_EXC%$+@U<bA79@i$"7^iFD,6++D,P4D'3b/+@0LNATDZsEX=NV2@3;)
1bceN#r=1h$!TAp>;8!@%15'$9kA3X@<)\"YolDFFD2&!Df]J4-uW]?FD,5.GA(E$ALRpA0f984
+>>XhYR*';2$mJH?!B$A>n%-$#u,,SAmoH]cESKgATDj'BaJ?e@W-H5De:,6BOr;_Ch7<hA7]fg
1GCfq:*;DJ_QX>$/iYTm><#nm0fNAI$8F4@6#:(C@UX:cD@+Un+B2clEbPhlDes6.G@be;-uW]?
FD,5.:i']W@:Wqj.1%ai0aUSt0fHnQ#r!tk2'<303*f`C3*ct#0eiu4BkM!n$-oh!:NC/fDJ=.u
AoDU0+=M&;Aoo/-Df9_?De:+fEbTH0.1%ah1'pl%0K?qR#r!td1'q/E?!B$D>n%,q1'p<VE+Nj%
@0t5a+@1-jBkLjc$#F<tFDPM2F(f,:B5_4##r4Ip#u2U"2Su[)0J5:=$!TAp>;@m<%14gG#sr3>
CghF+Bm9s0ZQN%aBl@m'EsZGiD..6l+Eq77EbTH4#r4G"#u2Ts2Su[)0eP@@$!TAp>;@p=%14gH
#t8ZJ@<?/hcE\Ql@<HU)$#a]m+C]J8FD5W*+EqOABHVD1AKYZ)Ec,q)1,h3":*;;P_QX>$/iGZq
><#nm1,<,E$8FCE6#:FQCgh/ecF"cjEbTH0BlaT%FE2)5B-;,)+E1n#Eboe'1,h)t;]mbK_QX>$
/iPHj><#nm1,E2F$8FFF6=k7MChI=%F(G['Yolh_Bl@m'EsZr%AKYYpDIal.AftMu/P9GoHGk@W
-tt;F/g*r1Bl@l<#r4Fo#u2Ts2o;d*0J54B$!TAp>;A$@%14gK#t&-=DfBi?$-odu6Xb"LDII)_
@qg%1+E(j7@;]RhASuT47;$mbF9s]\1^R)'2)E+R$0$c(0J5:>$!TAp>;A'A%14gL#ubPYBm"J'
cESKZ@;]e#+AH9ZDfTQ5$$9il+EM%2EarcsDJ()1DIjq=E,T]<Cgh@#Gq:([BOr;sDeC26FCB2=
#r4@u#u_s$2o;d*ieWaP/i5Kn><#nm1,`DI$8FOI6"FY;Ea]:"[3.hFDJ=/79jqdTEbTS$FD,5.
G%ku0Bl5>?.1%ae2@3;)1-*4U#r+%i0aV&D?!B'C>n%,r0F:QrDe"'2D@+Un+@BRTBlbCkBl7j0
BlaSiAS,k$AKZ).AKYN%B-8UCBle!+B-:YpAoD^$+EV:.+CoD'+EMX5E\&>3Bl[p1F"%DN1c5S7
+>>[iYR*!91GfDB3*f`D3*ct#1,0)3Des64GR;[$+@g![Bl7j0F_qFgAT`&A+E)@8ATAo8GA1q;
F)Pq=-pqEaFDl1N+O7577qHNg+DGm>FD,5.Anc:,F<G[LBl5@+1,Lfo:*;;O_QX>$/ho3i><#nm
1-&VL$8O@C6$?s\EXC%!0d&hlEbTE"AI2jbBl7Km+DtV)AI1+J1^R)'2*&OX#r4+i$!TAp>;Is=
%14jH#ubt[@;0NacFY3"ASc:*F_qG+BQ%p5ASu'i+D,P4D'3b/+@0fd;fub^Bl#=CDf0,/6#pCC
Bk&9'@;TQuAoD]46XakNE-64.1,:Wl;]mnQ_QX>%/i#3h><#nm1GN/E$8OFE9ke$TCgggfA9Dr"
cE\Q[@<-("@:]abF_PE/+E)9CF*),4C`mq1FCfK6#r47k#u_s*0Z(%#0ePC=$!TAp>;J$?%14jJ
#siBHBOPpl$-odu89n`d@:]adDes-0@<-W9F*(i2+E(j7FD,5.F(KB2ASuSr1,1`p;]mbS_QX>%
/hesc><#nm1G`;G$8OLG;IsK`Cise*cESKcAT)I#EsZr%AKYr4Bl7El#r41o#u2Tt1;^7%0eP7>
$!TAp>;J*A%14jL#t/oFBOqLqYq[A$EcYZ#+AH9ZDfTQ5$$9il+C\njE[PoN@UWb^#r+Fs#u2U$
1;^7%0ePFE$!TAp>;J-B%14jM#t/?BAR]Ro@0t5b+A??bDJ=.uFCAm"+E(j7FD,5.Ch[g*#r+Cq
#u2Tt28ZR(1+k:<$!TAp>;J0C%14jN#tJ]@DII2bcEeW\DfU#8$$'`mBQPA@Bl7Q+De:,6BOr<,
@<Q4"#r+@s#u_s$2o;d*1+kO?$!TAp>;J3D%14mF#si'AFa+5<Yq[@gEckl+EsZ>pBl7Km+D,Y4
D'2/RH"D"=DIIBn#r+@q#u_s)1W$@&0eP::$!TAp>;J6E%14mG#tJE6EclU5cEeW\Eckl+EsZ>p
Bl7Km+D,Y4D'2/RH"D"=DIIBn#r+@o#u_s(2o;d*0eP@?$!TAp>;J9F%14mH#siBADffY!cF"cp
EcYZ#+AH9ZDfTQ5$"7^iFD,6++D,P4D'3b/+@BRVASc0k#r+=s#u2U#2Su[)0ePCC$!TAp>;S$>
%14mI#ubeW@po\hYom(]EbB*(BlaT&BOr;t@<*K/AftT%Ec)1<2)ttA+>GUfYR*$:0Jj)?3*f`F
0jP4q1GfD(ChmHnA-pPj+B<H'@:^QU@;9_$BlaSsART+\EZf:4+EV:.+Cno'B4uBuEcW@AAfu2/
AKYGrATA)32)>P6+>c*qYR*$:3&M"H3*f`F10k=r1GoJ0@:Wee$-oh!6Y1.W@<HU)$#F0c+E(j7
FD,5.@qBP"@<HSs0f1ls;]mtP_QX>#/iGBi><#nm1c&DH$8XRH9kA3XASuSrcF=uaASuTuF`M1&
F(fK7Ch.*t+E(j7FD,5.@qBP"@<HSs0f1ls;]mkS_QX>%/hf0i><#nm1c/JI$8XXJ;JBcXC`lA^
DKK<0EclF0cET)H6Y1.W@<HU)$"e*oF<GL6+EV:.+Ceu#FCB<4#r+7j#u_s)0uC.$ieWaO/hf!d
><#nm1c8PJ$8XUI6#pIWF`MVG$-odu6>pdaBlaT&BOr;qARTU,F!,+<@<,lb0f1cp:*;8O_QX@+
LlsGE0Jj)?3*f`F2I-b!1H>bFF^ep"ASc!jDKTE&$-odu9PIsV@:]adDfp/8ATDZ2@r,Rt+=M/?
+EV:.+EM%2Ec>`2DCGlH1H5\>+>GdkYR**<1,oSE3*f`F2dHk"1b]5/De!Hh@L:>c+B<H'@:^QU
Bl7j0BlaT%BQ%p5ASu'i+D,P4D'3b/+<k]AEcbt;F*(i2+s8:O@;TRd+EqL1DBNY8+Eq78+EV:*
F=\PE@4iZW2)$^,6:2mTJ<M*A6m+9>0I\U\0f(`p:*;JP_QX>%/hf6k><#nm1cSbM$8aID6#:LR
ARf4Y$-odu6Z7!`DIFYSDfTDtCh[qsAn>O_Ch4`-DIjq=Bl5&8BOr;rEc6/>.1%^a2[N5%1,m(S
#r4+g1^RAG?!B-G>n%,t1'p6aFCB3$Es^-s+B)cgEc>`,$$'a'@;I')AfsfVEcW?OBl5&'Des?4
.1%^`1C6u&1,d"R#r+%d3=/nL?!B0?>n%,t1C6?hEbSqgcESKkEbSs"B6A$)+@1-kFE1f+BlaSj
DeX*#A0>K)Df$U`@<lF)+DtV)AI1(F3!iM+2EAXY#r+%m1'q/E?!B0@>n%,t1^R)h@VKTacF4ol
E+is.@q]Q_F(Jj"DIal6Bl7g"EZf:@+Cf>-EHPi5DfQ.=0Ja#6+>GdkYR*';1c#GB3*f`G10k=r
1c5S<BOQ%"@0t5k+B)cgEc>`,$"Im`CLq$.F`8IB@<-H4De:,6BOr<-@rHC,Bl@l:F!,R5Bl")0
3B%7C+>YsnYR*$:2DPSC3*f`G1L1Fs1c>Y<@<5jnBOPOrAI6Ye+AZriBm!p!BaJHa@:UL!Afu2/
AKZ&*Ec>T-F<G(,@<-3rEX=E[2@3,$0f-\N#r4+f0F:rC?!B0C>n%,t2[MohFCB'$D@+Up+@L6Y
@rH7!EsZMk@:UL!Afu2/AKYN(@:sLr#r"@o#u2U#0uC.$1+k=<$!TAp>;\9D%14pO#tn]LF!*bk
F*)G2Ch[qscF"cn@:s:rFCB3(BaJj!F`_;.Ec*"=@<-H4De:,6BOr;qDg*<PDe:+j@:s:rFCB3(
F`Su<0K:lq;]mkQ_QX>$/iYNk><#nm2)\_L$8aaL<b5oP$-odu9R1YeAI3HlAKYSnCi!g'B-:bo
B5D-%DfQtDF_l/BEb,P23&(_7+>Z$pYR*!90Ja#>3*f`G2dHk"2)#>3F`(u/$."5H;dj<QFECr3
Bk[l`Df0W<ASc0kFD5Z2+E(j7FD,5.BQ%^4+Cf,-Gp"M(EbT',.1%[e2@3;)1,d"R#r4+e2@3SI
?!B0G>n%,u0aU-^FCAm($-odu6#h$]Cggl]Ao)a,DJ()'@:sCf+E)9CG'.VCF`M%"0K(]n:*;5N
_QX>#/iP]q><#nm2*"qO$8jRF:h='FDe!PhcESKg@<QR,BlaSJDeX*#A0>K)Df$V=BOr;TDJ*d"
F(c\6@;TQuDe:,6BOr;rDf0W<ASc0kFD5Z2#r"4n#u_s(2o;d*0ePI@$!TAp>;e0@%14sK#t/?B
ARYtkYolDZB5VDiFCAm"+E(j7FD,5.BOu&f0JtNj:*;AN_QX>$/i#9j><#nm2DJJH$8jXH7;cgO
$-oq$:h=9JF(kquDf]J4De:,6BOr<"DfTo1#r".l#u2Tt0Z(%#1+kC;$!TAp>;e6B%14sM#siBF
@;0`gcESK^Ecl);$"@phB4uB0Df0,/-uW]?FD,5.F)Q2CBOu4%+D,>/BI@jDFCAm".1%[`3!iM+
1cN:U#r+%k1^RAG?!B3C>n%,u2@2ikD..6o@<HYucESKgBldcuF!*bkF*)G:DJ9DoDfp/8+E(j7
FD,5.F)Q2CBOu4%+D,>/BF-@I2@3;)1GH\M#r+%e2@3SI?!B3D>n%,u2[N2eEbf)m$-odu:h=9J
F(kr%@:WnbAKWC>Afso]B45k(F"%DL0f023+>GajYR*';1cYkH3*f`H2-gXu:et"h?ZKk%ATMF)
1,2Nj/l5>B<*sZ[F(KE(F<GO@F*&ODEc5H!F)u8?/g(T1%17/nDfp/@F`\`t7R9C14ZX]60H`D!
0I[G<:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GCX>128O$1H$sG$;No?+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sBmD00-,De*:%+<XEG/g+bEEc#6,+EVO4@<iu=
ATD7$+ED%7F_l./$;No?+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.
DJ()6De*:%%15is/g+tK@:XG$@<-E3+AP6U+Dbt)A9/l6Bldj,ATT&9FCB24A79Rg%15is/g,%?
G$f?0A79a++AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VDATW$.DJ()6De*:%%15is
/g,1KF(KE(F<D\K+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcVZs.1HUn$;No?
+EMC<F`_SFF<Dr+67sC(D.G[M-Qjr_/13,&E'-3)5&i\H+?hJ10IItk3$C=<.3MYc6um!_ATMF)
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'Ec`EH-ZWpBATMF)-OgCl$=S$bDDGR1G[k<$?Z^O7
1,W2@=:&+`=:&(_=U@An5u&h203BY0,!f0o:,45#/6F>F#pMZ75u'0`==dT(+pgP75u&h103K_5
$8;c?#pVi0<\H-M#pVi0<\H-M#pVi0<\H-M#pVi0<\H-M#pVi0<\H-M#pVi0<\H-M%14[A#r)`<
0aTEd#q[tk#r+4n#q[tk#q[tk%14fr/MRP`0aTEd#q[tk#q[tk#r+4n#q[tk%14[A#q[k<0aTQ@
1c5Rk0f(Zn/MT%=#rFLK$8DiA#r)`@#rFLG1c5Rr2$l)s%14cq0fTIn#pVi0<\H-M#quZG0F9E>
,=G+(0/+OY$8DiA2[M/j0JtgL1,CdC3=.E!#r=1i2E!BM0K(gF#rjgq2D[-H1H@6J#r=1i2E!BM
0K(gF#rjgq2D[-H1H@6J%14is0fB=l/ho+=#ri5M/ho+=0JPIA1cYk%1+kOF1c[NO2Dke"/ho+=
0JPIA1cYk%1+kOF1c[NO2DkpN1C5cn#r!te#rN#D0eP793B8lN1cG_"3%d*L0JGCD2)>On0eP79
3B8lN1cG_"3%d*L0JGCD2)>[K1^Pln#r!te3&NWL1bq$K#r=1k#r+:i3A`TL3Aif'2`*-@2)I3F
1bf:k2(gmG2)@6M3=.W$/hf.>2D?sB%14s!0f'+i/i,ID2DI'F3&M!t/iF"k0eP.92`3<E0Ja"n
3%d3L1,LsM3B%7"0eP.92`3<E0Ja"n3%d3L1,LsM3B%BS2@2)n#r!th#r2fB2D-jF2)$mB0fTIt
1G1L?1c[BP3&1dq2D-jF2)$mB0fTIt1G1L?1c[BP3&1pM2[M2n#r!ti1H%$I1H%$I#r+%i2_d-E
3&NWL#r==h1cI-D3AN?M#rOXo2)7-N0K1pF#r==h1cI-D3AN?M#rOXo2)7-N0K1pF%15'$0e`nf
/iX.l/i#9j1H7!F2*!WM3&3>t2)-^>1b^XE0fLrr1H7!F2*!WM3&3>t2)-^>1b^XE0fLs!$98DQ
#r)`@#rFLG1c5Rr2$l)s%14gD#ri5G/i#9j0J5<k2)-^>1b^XE0fLrr1H7!F2*!WM3&3>t2)-^>
1b^XE0fLrr1H7!F2*!WM3&3?#$8F7A2[M2k2)d6H1,q-M0aTNd2D[6I2D[6I2@26"/i>CD3&!9M
0aTWk/i5LA0f_!E3=.Q%/i>CD3&!9M0aTWk/i5LA0f_!E3=Q<M1'oiF1'oWe2$l/s/i5@@3A`]T
1'o]o/i>OE0JtR>3!hK!/i5@@3A`]T1'o]o/i>OE0JtR>3"63L1C5oF1+kHk0J5.@1c@'G1H75u
2E3<L2DR*K3&ro(1,1C81H.0G0ebBi2E3<L2DR*K3&ro(1,1C81H.0G0ebBm$8F@D1^Prj2$krh
1,q-M0f1XF2@2<!/hf.>2D?sB#r+:i3A`TL3Aif'2`*-@2)I3F1bf:k2(gmG2)@6M3=Q<M2$l&F
2$krh1'om!/iG^D0K(jI1C5cj/i,1A3AWEI2[ME&/iG^D0K(jI1C5cj/i,1A3AWEI2[p*K2@2,F
3!h8k0etTm3&3*G2`*NS1H%)s2_Hg?2)$aC1Gh)u3&3*G2`*NS1H%)s2_Hg?2)$aC1Gh*$$8FIG
0aTQn#r!tc2)mQN1GppJ#rjgq2D[-H1H@6J#r=1i2E!BM0K(gF#rjgq2D[-H1H@6J#r=1i2E!BM
0K(gF%14gL#quZ16qLE40Hg`V#pVi0<\H-M#quZG0F9EB$8;c<1,9.i#pVi0<\H-M#quZ;3A:ao
3%tX`6qLE40Hgl4/MRP`1,0(h/hf+@2DI3G1cPds0aTTf2_m9I0ebUJ1^P`o1+kL@2D['A3B7Bt
0fM$D1,h!I3&q:)2_HjE1H%3Q0JO"D/M[Va1,'"g/hmYe0F9Th2_d!D3AWBG2[M&r2(ggB0JtjH
0f01g0fLpA1,q9N0K(ot3&E6C3&rfL2E3T($8"%?/MT6l0J5(;2`NfS2`!B!2D-dA1G^gC1G^fn
3%d3M1,^mG2DI&q/NGdC3B&]O1,_$F#q[kj0eP.82`!BK1^Q,r/hf%>1H.*G3=Q<I1^P`g3!h8k
1,:U?1,:U?1'oci2$kum/i>CD3&!9M0aTEd0JY7<1,q6I2`D$p0fCsC1cI-D3ANAs2`E?G2_d$I
1,:j!$8"+A/MT0j0J5+@1bg^D2Dd?!1G1Kj0fCX?3&riQ0JbKk/MSq;/i,II2)I!C#q[ki1G1R?
0JkXI2[ME!/iGF<1c79O2[p*G2@1ri2@2&i1H./t1+kIC2E!HO2E!K#1,(=<2)[-F2)6on/MSt6
/i>LE0JkXB#q[kh3A*-F1H@<L3!hK'/i5C@3AiWP3"63H2[M&j2$krh1c@6M2E!HO2[M5l0f1XF
2)d6H1C5fo/hf"<3&rcO3!h/k0f:R;0fD!O1GoIj0f:d?3B/fL0K(cp2Dd$H3&<9C2Dm6!$8"4D
/MT'g0J54A0f1XF2)d5r0ePCB#r4Ln2`*?N3&*2q/MSt?/iPUD3&iWK#q[kh0J5+<2)-gF2[MAr
/i#:A0ekXH%14[I#q[kf#r!ti3ANBE2`<ZO#r+%h1c.$G1c.$G#r=Cj2E<WL2)@*G#q[ke1bL[H
2)-sE2$kih1c6mA0JkaG2Dkdu2(g[=1cR<M1cGjN/MSpc/MT!e0J5=@1G^gC1G^fn0eP3f1H@'I
0Jt^H0ebTo/MT"@/iYOB2)d6E#q[kg0J5(?1c-sI3=.Ps/ho@C1bq$N0b"IA0eitd0eith#r)`C
2$kih1GoIj0f(Zn1c5^L/MT!e/MSpc0eP3f0J5=@1G^gC1G^fn2)$X;3A`QJ3&r]"/MT(9/ho@C
1bq$N#q[ke3A*9F2)R<I0aTWr/iYOB2)d6D3=Q<I0f'+f3=.Dm1c.$G1c.$G1^Pig2E<NK0K1mM
1'ofq/i,1<3&ENM2[M&j1c6mA0JkaG2Dkdm0etR<2E<WL2)@)r1Gg^B3AiNK1Gprt$8!th#q\+C
0ePCB#r!th2_d-E3&NWL#rXIi1,UpD0fV)u/MT+:/i#:A0ekXH#q[kd3A*6I1cRHL1C5fs/iPUD
3&iWK%14[A2$kin#r4+f1bq$J2_d-F#r!tg2E!HO2E!HP#rXUm3B/fL0K(dD#q[kh1bLdJ1GLRA
2$kih0f:R;0fD!O1GoIo2(gR;2E3]Q1cPpO/MT-i/N*nj/iGUG2E!HO2E(pr/i,FD#rXdr1c.!K
2)I6O#q[kh3A*-F1H@<L3!h/k0eb4;2)[-F2)5In0J54?2D?sF1,9:G/MT0j/N!hj/i3kg/i#FD
0ekUF1cG_"1G1R?0JkXI2E(po0fCg?2DHmB2*!T%/MSq;/i,II2)I!C#r+=j1H7BP1b^^A%14[A
3!h/n#rF7l#r!te1,:U?1,:U?#radq1cI-D3AN?M#q[ki2_HpG0ek[D1C5Wf0JY7<1,q6I2`D$t
1+kF>3&iTN2_baK/MT6l/Md\k/i,:>1G^gC1G]=k/ho4B3&rfS1H,V"0eP.82`!BK1H>an0fLg>
0JYRC2`!8s/NGdC3B&]O1,_$F#rjOt2_m9H2E!9I%14[B0F9<d#r++?0J5'd3&E6C3&rfL2E3T$
/MT1@/i#CH1b^gJ#q\.p/iPL=2*!HI1^Q#l2_d!D3AWBG2[p*G1,0(e0aTTi#r!tc1cI<I3A<9L
#rjjr1,h!I3&rZI#q[kj2_HjE1H%3Q#q\.m/iPOD1GLRD3=.Gn2_m9I0ebUJ1^sdD1,9.i#pVi0
<\H-M#quZ16qLE40Hg`W3%tXj3A:an%14cq/MT3k0F8sl8QIJu+UKh//NGKk0fUin,=G+(0/+OY
$8Di=0fKCj0J5%:3&iZL2)7/u/MT0j/Mf"82E!BM0K(gF#q\+p/iGLA2)@6K1^Plq2D-mD1GpsK
1C5Wm2D-mD1GpsK1GfOJ1'oNe2@1rh/ho+=#q\+C/N5::1,Ua?2D[0M#q\+l/iYdH3B/fQ2$kur
1+kOF1c[NO2[M&q1+kOF1c[NO2DkpN1C5Wf2$kig/i!_b2$kih0eP793B8lN1cG^m2`NEJ3A<-F
2`3At0fD!D2E<HF2E*K"/N5XA2E<HF2E*KL%14ou/MT'g/MJe43&NWL1bq$K#q[qc2$kih2(gmG
2)@6M3=.8r1bLI>1c@$E0aTQm1bLI>1c@$E0aTEj1bLI>1c@$E0b"II#q[kf#q[h`1H73L0f:aH
2$kii/iF"f1,1C81H.0G0ebBi/N,R@3ArWL3&ioW#r+:s/ibgF1cRK%/N,R@3ArWL3&ioW%15!"
/MT!e/MJe7#q[n=/M]4:2)[<G2)-gF#q\%k/i5@@3A`]T1'oZm1G1L?1c[BP3!h/p1G1L?1c[BP
3&1pM2[M&j0aTEc/iGLD1H%$I1H#Ok0eP=B0f1XF2)d5r/Mf.71cI-D3AN?M#q\"n/i>CD3&!9M
0aTQk2_HsC3&iTN2[M&n2_HsC3&iTN2_baK3!h/k0F9<b/iX.h0eP4=#q[qm/iGRI3&!<I2$kil
0eP7=0JPRB2`1mr1bgU=1b^XE0fKCj2)-^>1b^XE0fLs!$98DE3=.8l#q[k</Mo<k/Mo<k0f(Zn
/Mo<o$8F4@/N=%g0eP4=#q[h`3!h/o0eP7=0JPRB2`1mn1H7!F2*!WM3&3>t0et^@2DmKS0K:ip
/Mf@=2DmKS0K:gF%14gE#q\(B/MSk82_d-E3&NWL#q[h`2D[6I2D[6I2@1rm2_HsC3&iTN2_bUj
1GUR>2_d$I1,:ir0etL:1cI-D3ANAs/Mf.71cI-D3AN?M%14gF#q\%A/M[Va0J53h/N,C;1c$sK
1cRHM#q[nj/i>OE0JtR>3!h;o2D-jF2)$mB1'oNf2D-jF2)$mB0fTUL0f'+f2$kii/iF"f0J5.@
1c@'G1H75u/N,R@3ArWL3&ioW#q[ne/hf(?2)-g>1C5cj0eP.92`3<E#q[ne/hf(?2)-g>1CX[G
1^P`j#q[qc2$kig/i#CD2_d-E3&V'p2`*-@2)I3F1bf:g0f:RD1c7'L2)tst0JtIC1c7'L2)tsp
0f:RD1c7'L2)u*Q0f97h1C5Wj#q[h`1'oNk3%d*L0JGCD2)>Oj0ek::0KD-L1,Lor0eb=71GCgL
1GUfo/MSt41GCgL1GUdG%14gJ#q[n=/N=%g0J5(82$kio1+kOF1c[NO2Dkdm2_Hg?2)$aC1Gh)u
3B&QF1,Ua?2D[2s/N5::1,Ua?2D[0M%14gK#q[k</MT0j/MJe22)mQN1GppJ#q\+p/iGLA2)@6K
1^P`i/i,CD1c@$G2DYY"1G1IA2Dd<G2Dtjn1G1IA2Dd<G2E!?#$8FLH0F8sl8QIJu+UKh/,=G+(
0/+OU0F9`n#queq0F9Hn#quZ16qLE40Hg`V#rs[G0F8sl8QIJu+Unc10aTQn#q[h`0JtgL1,CdC
3=.8l2[M&l/i,CD1c@$G2DYY"1G1IA2Dd<G2Dtjn1G1IA2Dd<G2E!>t/N>X@2D[-H1H@6J%14[B
#r+=E/MJe31,T@i3!h/q/ho+=0JPIA1cYk&2_Hg?2)$aC1GoIj2_Hg?2)$aC1Gh)u/N>L<3&`ZS
3&<HM%14[C#r+:D/MJe4#q\"@/MSt41GCgL1GUdG#r++g/i,1A3AWEJ#q[kd/i,1A3AWEI2[M&p
3%d*L0JGCD2)>[K/Mmbg1^P`f/i#CD2_d-E3&V'p1G1Nk/MT+83A`TL3Aif'0ebI;3A`TL3Aif'
/MT+83A`TL3Aif'/N5L=0Jt[F0JkKn$8"+A0f'+f0J5.@1c@'G1H75u/M\q:#q[ne/hf(?2)-g>
1C5cj0eP.92`3<E#q[ne/hf(?2)-g>1C5Wk3%d3L1,LsM3B%BS/N*ni1'oNd/i<qe1'oNf2D-jF
2)$mB0fTIo0fCXA2Dm0G0es%e1,^aB2Dm0G0ekWo/N,C;1c$sK1cRHM%14[G#r+.@/MJe81H%$I
1H%$I#q[ka2)d6H1,q-M0aTEf1+kCB0ek[D1-#Xq1,:I=2_d$I1,B4g1GUR>2_d$I1,:ir/N#I>
2)7-N0K1pF%14[H#r++?/MJe:#q[ka1,T@i1H7!F2*!WM3&3>t0et^@2DmKS0K:ip/Mf@=2DmKS
0K:gF#q\"h/i,=<0f^sI2%9mE3=.\P/MRP`0aTEg2$kun2$kik2$kik2%9mE0e`nn#q[ka1,T@i
0J5<k/N#781Ggd?3AEHM#r+7k/i,=<0f^sI#q\"h/i,=<0f^sI2$kij3%d*H3B/]P1,TLJ/MSsd
2[M&j/i>RB1bq$J2_bUj0J57>2D[6I2D[5t/N#I>2)7-N0K1pF#r+7q/i>CD3&!9M#q\"n/i>CD
3&!9M0aTEf1+kCB0ek[D1-#dN/MT!e2@1rj#q[h`2$kim1G1L?1c[BP3&1dp2)?jA1Gh*K3&h3r
2DZsB1Gh*K3&iZ"/M]4:2)[<G2)-gF%14[A1C5oF/M\q:#q[h`1H73L0f:aH2$kim3%d3L1,LsM
3B%7!2)m3K2DR*K3=.8q3%d3L1,LsM3B%6r1,1C81H.0G0ebBm$8!th#rDr?1G1Nk/MJe43&NWL
1bq$K#q\(m/hf.>2D?sB#r+=p/hf.>2D?sB#q\(m/hf.>2D?sB#q[kh/ibaG1H@<Q%14[A2$l&F
/N!hd0J5*e/N5XA2E<HF2E*KL#r+=t/iG^D0K(jI#q\(q/iG^D0K(jI1C5Wf0eP793B8lN1cGjN
/MT-i1'oNl#q[h`0etTm/N>L<3&`ZS3&<HM#r+@o/iYdH3B/fR#q\+l/iYdH3B/fQ2$kin/ho+=
0JPIA1cZ!P/MT0j0aTEd2[M&i/hf.B3&39I1-#Xm3&WBI1G^mE3AWJu0fM!C2D[-H1H@5t/N>X@
2D[-H1H@6J#q[qc1H%-J2D@$I1CX[C0fTIn#pVi0<\H-M#quZ16qLE40Hg`W3%tXj3A:an%16fX
F^K#pD.R6bF*(i2F'g[V1,<3YG]Y\un%6>+5uh8e@;TR,6tLFRB5V."Bl@l?84cW/6=G.NEaMRM
D.P7nD(JaV;dW-J<c)8X/5ec@8hr(S0J#V'@p_h`0JG13:NC/^Bl5J#Dfp)1ALpD@/44>nF*&s%
FEq_ACi<s3?VYN]AISu4@WQI(F`_M>/6G\"2(Vj*/N#(d+A@&u/70r8/28n40f(@80fCXC0fCmC
2CpXE/hf:B2)d9A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,/44_p@qZu_AT2d$Ch[B%E,ol9Df]?'
4$d=sDesQ<DJpY3F!+m6AnbasBl@ltC`mS/Ea`I#Ci=H;+EM[7F*(i.@q?csDBO%7AKZ&(Be<q2
+Du+@AS`JgDg'$lEc,;.DIFYr@WQI(F`_M>+=L3&AKXHN@ruX0Gp$^;EZfI;AKX9JF)Pl;FCcmD
@X0)1DJ!^-ASuU(@;I&RH=^T"+Eqj?FCfJ894;jPC`pZT@;odn/e&.R@ps4_E\'aZ+?2A?/28q?
1cHu2\1o*pEbR'j/2/h:3&<-C0JPO<1+kOG/2T192)[<J0ek421b^O<0Jk[H1+Xt-cF>S[7<3)n
%15C2BOu4%@<*ni;BReT1+Y@A3&iJ7YolJUBe2P$/M&S.1c6g>1bLU?3&NHI/1i_</i#4@2`3BB
6#pCCBk&\FcESohEbR((BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@-hEa`Ek@lbabU=cX$Yoq\sfnA%5
fn\4b+NhF:J`42+BlY>)DCoa7BQ>4D-ZWpEATB/>+D#G$-RgYW$:/08Bl[`885^Qc0f^d@3&33>
cF4o`@<3tc/2/b73AE$A2`*NG1G1LB/28n41,h*H0f(@<2_I'E2).'L/1`?t[k'mTF"AMIBl\9:
+CT5.Ch[Hk+EVNEcF4o`@<6L(DfB9%@:^QqDBO%7AKXoe@;KgiFCcRkCh7[++@1*c@<3Q0Afu2/
AKXNT@<Q4"F!,FE@Vfb"BOt]sBl5%J3AiKA+C]J8+DGm>DJsV>CMn'7DBNn=BlA#7FDi:DBOQ!8
+q4lF@rc!e/4`Y]2*!WQ/2oOJ1,(9)Z8!J#@rEna@4X,k0Jt[=0f_'M/2Ah82CpU?0eP7>3AW?C
/1iS:/iYOB1c7'?6#pCCBk&\FcE]/U;e'_s,'7L0+EVX4A8-."Df0!"+DtV)AKYo'+EV:.+O788
;e'`dE+s#/F*VhKASiQ'@<3Q#AS#a%Eb0-!ATD?m+@0d`@:C?fDIakYCgh+"@:Cc1A7]dqG%G2,
-u<U5AKX9KEa`E++D,Y4D'2,b@:Eq\3[!(QfnA"gfn.k]fVfp$Cb<fE@<$<r@N['HFD,5.F(9-/
E+s6.-RgYl%15C2EclUX85^Qe2`!-=2D@'E3%W@[+@C0l/4!\q0etLB2D$gC0K(I:/i,:70fV'D
2DdEO2DZm92DZs>3B8cR1Fth/ATDKp@;]e#D(I6`Yq/7_FY"_F+Dl%-ATDZ2@rH7,Ea`I"Bl@l3
De:,6BOr;Q@<lF)+Co&)BkM<lFD5Z2/0JG@Bl7Km+DG^9FD,5.0fa>h+Ceu#FEMVL/0JDEF<Gd@
Bk(g!ASuU$Eb/c(Bl8$2+Cf>,D/X;7F`V+:Df0B:+C]U=FD,5.D/!N41,*f`+Ceu#FEMVL+=K>p
cESKZEckl+F"&:B$:/0E@V'Fu/4`Y]1Gq*H/2T1;2E!,3YolDO@k9oS/20%@3&N3@0f:[:1bLOA
/28q;/iGI>2`*3>0ek:?2)dEQ2_778@:Eq\/1f)O/44;b/6$:o+DtV)AKZ2*F!,CABkM-t@;Kb*
+@1$V@VK=5+P<UFK\3T_W7\$$L=qD+@<sMOF^i:?DSr.j-ms+MAKYK!@<Zc?.4u&:6"FY;An?!k
/4`Y]1b^^?/2]+;1Gp`/[NJ7TD_+1_/28h52E*-A1GUg=1G1L?/29"=/ho:?2)[BE1,CO>0fLmC
1+Y_3@:Eq\/1f)T/50Vn/0[ArF)N12@;KakA0=0SA8#C`ATD33+B3#c+DtV)AKY].+E):7B5)6l
Ci"A>Ao_g,+@1$V@VK=5+P<UFK\3`dJ_>q5Z.Q#u@H"_U/`F4!@:mHYEa^(=-Zj$5+C]A"Bk/>7
DfQt1F`M:L+E)9CF*)G2DIb1D+Brbr+EV:.+Dbb1DC9KJD..<n>q%BM%15C3BOPpi/4`Y]1,^jH
/2K(>2`WG7[3.h2@4X\q0K(dJ2D$[D2)m-A/i>=60ebF:2DmBL2)?d81,pmH2_m'H2Cq.7@:Eq\
/1f)S/43-?/0\&,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(cfWa#+fWj+d+NhH-
iOFreJTAZ%+=JU\Bl[j#DK@0S/g*`'+EV:.+@BRRASu$eEbTZ5+E(j76#7Z0@q]plF(la_C`lGj
F^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+P<IBLtRG(fVdDUfX]Y=fVdB,fnpop^0u50Bl"o#Cb<fE
@H"_W`.;rCH$Lq`FE1f-F)59,ARlotDKKe>9OW$WDBNA/+Ad)mD.+PfBl[j#DKTe=-mrV@EcZ=F
G%ku0Bl5:I/g:`36"FYCCb/+T+>Z#3/2f=>0eCVa+@0mU/1iD)/2St=2_6^</i>UG0K:a;1c6mC
1,q3O3%R@9@:Eq\/1f)\/4"/a/0\&,AKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(QfnA"^
fo"I9+CX6=O"K>#O(!<M+=M>FAKZ)8@;0U1+Dbb6/g)N`BOr<.@;0O*.4ueR$:/BD/4`Y]0f1RE
/2An=3&rP8[3/FWFY#ge0e>"81,q0B0f^sC/2Jn91FtFC/ho4?0fCg=0f^j@3&!0F2(V%6@:Eq\
/1f)S/6$&#/6$:o+DtV)AKY].+E):7B5)6lCi"A>Ao_g,+@1$V@VK=5+P=6XMV3_,b.hA1DBL>T
AU.i7.3N&:A0?))F!,L7G%kN3ARlolDIakuA8cF/ARlomGp%3BAKY&mEbfB,B-9]bDfp"ADf-[r
FCB24:18!NF"Rn/6"t4FCiWs$Be2eQ+?)#02CpjD2`<BAcFkqT;eL,%5qF`M2)I'?1,:[D/2St=
2CpUC1G1OA1,L[A/1iV4/iPUD3&E<?6#pCCBk&\FcFkq`;eL,%7WNEa+@1$V@VK=5+P=6XMV3_,
fVdDUfWj),fnJ+:+NhH-H#=a5E\2=MJSi?++=JUKH"A+:Afu2/AKYE%@q]Fo-RfK36#9t?Amo^2
85^Qh1-%<F3A`QP0eCVZ+A@'$/4!\q0f^sE3%HdF0KC[@/i5@81,q6G1c%-L1GLF:3A*$C2*!TL
/4";b@VK='/C(^U9R1Y0,#i5e+DtV)AKY].+E):7B5)6lCi"A>Ao_g,+@1$V@VK=5+P<UFK\3'P
\ClGcYomIk/]teMiOY4bF`JTQ-Zj$5+EV%.Df0VD+Brbr+EV:.+EMaFDfBE.B-:boB5D-b.4cT_
BOPpmA0?)1FD)fB]HBmnEa`N%-p_ZXFD,8pE[`Ub%15C;@<6-k/4`/O0fD!M1c?mF0JG1;/70Mu
ATB>//29+>0fUa>0f:g>2_I*J/2B.A/i5FE1bq$A/MSt43AN?J3&3$?0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL;e9u#,"$WpEbTH6+E2@>E,Tf+Cc`b*CghC!@3B9*+EV:.+D,>.F*&O<BleB7EbT#lCi"A>
Eb/a!Eb&`l+DtV)AKYo'+@CEnEclFS+Cno&Bl7Q+@UWb^+EVNED/!N4Anbk!AS#b$BHUerDKL#A
Gp#F@/g:`36#:"=Ch-sf/4`Y]2_m9J/3,OA1bgQ-J07d'E\'L-0f^pJ3%Zm?0JP+6/iYgA1,q3F
1c-mH2_cj81,1C81,CgC2(V%6@:Eq\/1f+t/5p2%/0\&,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4
D'2,b@:Eq\3[!(QfnA"VfnA"]fVp!%Cb9+)Ch-rs-ms+TGA\cW/g*`'+EV:.+@BRRASu$eEbTZ5
+E(j76#7Z0@q]plF(la_C`lGjF^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+PDM&MV,0VfVdDUfVmJV
fWWr,+DtV5H"h:A@;IN)@;KI_BIk9JEa`j,CghEsA0>T(FDi9q@<?4$+CT=69QaiZA76TVE,]N%
BcnfO@WH0qBQRg,F<GL6+EV:.+EVOGDC6kW%15C;@UX(e/4`Y]2`W`L/28h62DI0BcF"c\EH3T^
/1iD//iPa@1GLU:3AEKR2E<<?3A*-K2)dHO/4";b@VK='/C(XS6#gor<+ohcDIIBn+DGm>DfTQ)
Bl7?qCj@.8Ec5e;6#pCCBk'1HfVdDUfVmH#fnA"g+CT(<@`3h6C!+15-ms+MAKZ&<@;KauG@beB
.4u&:6#:"EEb0/?85^Qh1bgp?3AifR2_<7[0d&i/B.Q>W/29.@0K1L;2`3QG1G1@=/2B4@/iG[C
1Gpm<1,ggG2*!QT1+Xt-cE]/U6[<;q<+ohcF)Q2A@q?d$Afu2/AKYl!D.OhUCgq+!AT&]*F!,@=
F<G.4FD5c,Cj@.5Ch7$q/e&.RCh%-m@UUfY;BReS1,CI=3AENS/C(LC6ZR?$/M&J)1bLI;/29+>
/ho%91b^[9/M].82_m?P2`3-PEa`Ek@k91VYq/7_Ft=h,Ec5e;6#pCCBk'1HfVdDUfWNl*fVdAq
+CT(<iOY=h@`3i?^*"gOFCf?3-RgYj8T#YmBOr;R@;KLmA79LmF_r7>AfsBU+@0LNF('-(+@0fd
9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq9VqHaVL"V45Y1U!%fVdDUfXf_?fVdB#+CT(<D..>@
\s?cF+CT(<`1_<o`.;AK+EVX4DKBW&FCeu*Bl8$2+A?3cBl5&%F!+A!F*)GFD'22aEcu.>-mrJ8
@;@!(Afu2/AKYK'Dg*QX/g:`36#:%LE\'aZ+>ki21+Y=@1cI?E3%uIT9joS?@4X,h1,Cp@2)I0K
/2Jn=3@lp>0eP792Dd*D/2]7:3B/rX2)HjMEa`Ek@k9/j0J$3u@4XlgDf$U_Ea`Ek@lbabVqHaU
Y1\W`VqA6s@;OqROl<m;@<Zq6JT;k]-Zj$5+D,%rDKI">DIk1E/e&.RCh%a/DIk@i;BR\K2Dm$?
2`EEG/C(^I<+0o#5qF]G1cI9B1,L[C/2Ah;2(UUC/iYdE0f:^;1,LU<0JtR@2CpC1cF5?(@<F+q
ASkmfEZf:4+EV:.+AclcBjkO`F!,C?ASrW3FCB24@r-:/FCfJ8-quNU.4u`/Ch%a/DIjq=6#L1H
ASuT47ri0PCH<Ts]SOkFcFV>Uc]$/_cF4o^Chn03DT%_f+Eq78+E)./+E(j7FD,5.:i']W@:Wqj
+EM7<FCfK6+DG^97ri0PCERJ>FD,T/DeF>J%15C;A7]4YEa`i:85^Qb1c73C1,1U@0eCVT+B2cl
/1iD,1c%!L.krq<0e>"23&`BH3%d3N0JPIA/29%82)%$H0JY1FEa`Ek@k91VYq/j_FY$L*AKYl!
D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(QfnA"]fVmH-fVdDW+CSe4A78qUEl<NH+=JUZBOr;u
Des6.G@beB+Brbr+EV:.+AclcBjkO`F'U4($:/K=ATD3rBl5Im;BRqR2DQg<0JtRF3@rI\+@B^Z
/1iD.0ekXG.lK.=2(UL81c6g?0f^jE1c.0O2(UX@/i>UG2)d?C6#pCCBk&\FcESofAT01iEc5e;
6#pCCBk'1HfVdDUfWa#5fVdB4+P<UFK\;79L"V@:L*0p`\;r6#\;t?E`.?(G+CT(<H!tR.X)9%.
-Zj$5+ED1/BQPA*Ec!0H>An*r6Y14MAT`'".4u&:6#:(F@;]L_/4`Y]3&<EJ/28h<0K:p@cEeW`
Eciob/1iD//het11GUpB1cR6F3AN-;1H-pB2DdBN2(V%6@:Eq\/1f)Q/4X`'/6$:o+DtV)AKZ2*
F!,CABkM-t@;Kb*+P<UFK\3N^L=iFI@H"_W/`F4#@;]L_+=JUZBOr<.@;0O*+Brbr+EV:.+Cf>-
F*(u0CghF"Df-\9Afu2/AKXoiF`_;.Ec*!hBldrn.4u&:6#:(FBjtLa/4`Y]2D[?O/3#FF3AiA5
[NItY@4X\q0fLdG3%HmE1c$[=/ho:91,V!C0f_-M2)$R>2(ggB1c@<M/4";b@VK='/C([T6ul]e
7WNEa+@1$V@VK=5+P<UFK\3`cW7\$#\KG>>\;`*!\;b33`.?(G+=JUZBOr<"H"Cl%F!iCh%15C;
A9D^#Bl5Im;BRnX2)6^;0JPC>0eCVX+@KdW/1iD)/2St51Ft=93%d!@1GU[C/28k31GCU?2DHaK
Ea`Ek@k91V[4F^WCb/LuDfTr2DJ=!$+E(j76#pCCBk'1HfWa%`fVfqFVqHaUYM"T^J_>q6L*5Hb
O'up7@N])i/S'!?B#L`f+=JUZ@;0O#De:,6BOr;sDesB+Bl5:I/e&.RCh@C%CFi"S+?2,43%Qd<
2D?pB/C(OD6Y13f6")<"0et^I.lT.<1b:F81,CI;1,:I:2DdER2_6mA/i>O@2_d0@6#pCCBk&\F
cE\ugAT01E7WNEa+@1$V@VK=5+P<UFK\:q/Z.X^O@;IN-Bl\29-ms+MAKYT$De!Q1.4u`<@;TQu
B5)O#DBND6+B<6#B4rDSAS3--D]j.8AKYE&FCfK,F)<%0Df0W1F*),6B-;,)+O75C+O788@;]Tu
cF4o`AT2<oBeCS=$:/K@ARoL+85^Qh2`3EC0eb:82Dcu1YqdFhAT01P/2An63&*!>1,C^;1G1OE
/2Jt:/i>@>2)[?D/MT"52)I-L2)6^KEa`Ek@k91VYqdjt@;mbA7WNEa+@1$V@VK=5+P<UFK\3BY
YM"dU@;IN1@:XX+-ms+MAKWC<@;KL(+DY\%-RgYj6#:XSEc,<-Bm+&1FE1f#Bln'-DII?(DIIBn
F!+n3AKX9T+@g-WA8*S;;e9H]DId/u7qlOFBcpi%A0=0SB5(pfBcp>c@s)["@4i`5$:/K@ASu3k
/4`Y]1H@!@0K(j@cEeWiAS3PG/2/b41GUI82)-g:1+kOB/2Jn70K;'N1Ft7</ho=A2*!KE6#pCC
Bk&\FcEf&uAS3P`Ec5e;6#pCCBk'1HfVdDUfW<`'fnS.X+CT(<C;b[@Bjr25-Zj$5+D,FuDJLUK
/g*GrB4Ysp@N]B++CT)-D]iJ+DffZ(EZf7.D.Oi%DfQuGYolkSEcYf++=KruEb8`q.4u&:6#:1J
AR](!85^Qe0Jtd?2)$mI1G$hX0d'/$D_*Ik0eb@:0Ink<2)$R:/iGF80f:d?3B8lM1c-a<3A*9J
0f1jM/4";b@VK='/C(RV/50Vn/4OYuD'2,b@:Eq\3[!(QfnA"ZfVmJYfVp!%Cb9C1@VB0m-ms+M
AKYT'Eb/oq@:U`.>An*rFD,5.Ch[g*>q%B8$:/K@Depsq;BRtU2CpR>2)dEEcE\QhATB=f@50;e
1GCdD.l8q;2_6^:0KC[@2_Hd@1,:RA/2T%53AiZP1cR$PEa`Ek@k91VZ7Jg`E\'\#Df$U_Ea`Ek
@lbabVqHaUXOsH(L=iFI@;IN1`.;f?@N['HFD,5.Ao(mnCF:P`+@0gVASu3k+DGm>@;L"'+CT/+
FD,6++DtV)AKYT'EZiZ4+AcWiF(K&.-r"DrAmoI(/e&.RChI[,@:CcY;BReT2)d'E0KD$K/C(UF
6ZR?$5qF`G1-%?H0fCgB/2Ah<1b:@@2_HpF2D@$F/1iS7/i>@@1c$j;6#pCCBk&\FcEo,iEcs!5
BOr<.Ea`KmFD5Z2@;I'(@;TQu6#:1PEa`E"BlbD-ATDL.ARloqEc5e;6#pCCBk'1HfVdDUfXf_?
fVdB#+CT(<`1_<o`.;A?-ms+MAKYK'Dg*QX/e&.RChRBt@4XrI+>Pc/0e>+82E3EBcEeW`ASita
@4X)j1H.6C0fCdD/28b;1FtOH/i5=B3ArQB0fCX?3B8iS0J#M1@:Eq\/1f)Q/4X8g/4=&iBm+&u
+D,Y4D'2,b@:Eq\3[!(QfnA%6fnS.ifVp!%Cb9=/DT]_&+=JUZBOr;qEa`ir-QlW3DBO%7AKYl%
@r!3*Afu2/AKYJkD.RNh.4u&:6#:7RFD*3r;BReV0JtC>1-%3M/C(XG<D?mQ5qF`G2)I!;2)R6N
/28b92CpRC1G1O=2_mBI/2]:;3AifV1,CI4/C(XS<D?mQ,#i5e+EVX4A8-."Df0!"+DtV)AKX9T
BlA*,+Cf>,ATJu+Ec5e;FD,5.6#pCCBk&8oCjBH2+CT(<BOPadC`k,M,'7L0+EM4-AT0#<+D,&(
+EV%+Ca(&P/g:`36#::EDII3085^Qh3A``I0eb@>3&iJ7[3.h^B.Q>W/2An92DQd=1Gq-C1+kCC
/2K"8/i>LA3&EEB1G^XD2_[!E2_6L2cF#2jH"SZ;$:/KD@;07'85^Qf0f^s>2E*EG0eCVZ+B;-E
/1iD)/28b:2(UL:2D-sK2)-sI/2T@>1GL[@2E*0</C(^U<D?mQ%15C;CLM%%Ec5o</4`Y]2)d<I
/2oFC0ek6)]J1NqDf70m@4X,j1,Lj=1H.'F/2St80e>(90eP191,^jH/2K4;1H.6I2E<<>/C(m_
/4+8n/.DqPChmHuBQ@Np/4`Y]1Gq0L/2T1?2_cl/\fb!I@4X\q0KCgC2CgUC0KC[@/ho780f([>
3A<?I2Dm$B2_HgB2Dm6I/1`?t\h$iU@4Vip6#:=FEa`E.85^Qi3A<<A0ekOD1,CK-Kcj3'B.PVc
/M&_21bpU<2)-^>1c.3K0e>(9/i57=0eb:4/1f,$/5Tnj/.DqPChmU'/4`Y]1bq$L/2]4B1b^K+
YolDSF=]!p/M&_20K:U<2Dd$H1c%$D1b:453%csH3&`fQ/1`?tYq/7_F=[k.6#:CH@<sIq;BR\P
0JtC:1GggE/C(XG6$73!/M&S50JY=41c$sK/2Jn41FtIB/i5RD1,1d?1c$aD1,C^?2_6L2cF#2h
F`K#B$:/KF@:Nt%85^Qg0Jb7?2Dd*=cEeWZDIb:a/2/h51H?sB1,:O71+k:8/2Jt43B&cS0Jk=;
1+k@<3B&]N/1`?tZReC[A1S/s6#:FIBlYaq;BRqU1,UU;0KCmH3%W@[+@gHp/1iD.1,([C/Mo@C
3%Qd:2`!!@1GUR:2)m?M0J"e42D.!J0KD'K/1`?tYq/CcFY!t/6#:FIF)3Bu;BRkV1c?mE3&WQM
/C(RW+B)on/1iD)/2Ah<3%QgD0eP:?1,(I@/1iY3/i5=?0eb:4/1f)Q1+Z@:E\%Y,6#:FQCgh03
85^Qb3A<6?1,^pC0eCVX+A[#l/1iD,2)@-G/MJn61+Y.42E<<J1bLI>1G_!N/1iS/1,(FC0f^d9
/C(XS:NC/#%15C;DJ=3$CFi"S+>Gl53%QgC2_m<CcF+ikEbR'j@4X)i1b^j?0JPFD/28b91b:UD
/ho=G2E<TF/MSk<1bppI1b:1/cF,9"EbR'6$:/KGBmF-//4`Y]2D@*I/3#=<0et<+K-4*&D_+1_
0e>%;1,1O91,UjG/2Ah<0J"t92(gXE2_d-L/1iV7/i>XE2`WWE/1f,"/5p%s/.DqPCiF&rEb$^l
;BRbS1cR$C2D[?I/C(LC89nVp/M&S91,h*C0K:mC/28b;3@lmA0ePFG2E3NP/1ih62DmHP0JY11
/C(LO89nVp%15C;E+ifm@ppoZ;BRhU3AW3F2DR0L/C(LC6ZPL9/1iD)/2Ah51+Y1:1G1RE0f_*F
/2B+92_d-I3AW3;/C(LO6ZPLE%15C;E+ig'@<?fH85^Qb2(UXE2_<7Z+@0mU/4!\q0JG1?1b1=A
0JtC:/hf481+k7@2E<KM/2B4<0KCgD1GLF3/C(LO6#L3a%15C;E+ig'B.QSO+>bl5/2o7C2_<7`
+Ad,h/3tg@0f(OA.krn:0e>+53&<*@1+kOF0K;!I/29"71GgsK1,CI4/C(^U:ig+t%15C;Ea``t
F"Bj[+>u#70J#1>2D@*AcFb8fEa^Lb/29(;2)?a?1bq$A2(gaD/2B(@/i,:>3&!9B2)HpB2_ZpE
3%QU3cFb\rEa^L.$:/KKATM?p@4XrI+>l/;/3,OH2_<7Z+Ad,h/3tg@1,(I;.ki_82CpX:3&3$@
0J54;0fM$H/2Ah:2D[9J2(U:0cESosF(6a1$:/KKF^ec185^Qg2DI0B3&W]T1+Y""6ul]e/M&J)
2(ggF/2B+@/ibpM2)[EF2)?jE0JPL@2(U:0/M';1@4Vip6#:UNAn`ee;BRnT2DQgD2DHm>/C/qk
6ul]e/M&V:1GUd;2E<TJ/2St;2_6^E1G1@@3B8uO/2fL@2E!9E2`<3</C/r"6ul]e%15C;F(8om
F_bE-/4`Y]1GUmH/2T(82`3-B0d'/8DCd@j/M&_21,UU;1,U[C0K;!O1+Y7</ho=F0f(O8/1`S3
/51>,/.DqPCia0,BPD?m/4`Y]1Gh'K/2T+B0f(B+ZliC\Cb.k\/20%?1cI!D1c.!>0ePIH/28q8
/ho:B3A`QD/N#@;2_[3N0f^d9/C(UR<b6(u%15C;F(eurDCe=V+?)241+YFF0JbU<cE\QYEGR0l
/29.B2)?a:2DR*?1G1U@/2B4F/iYUG1GCX:2D-g?2E*NM/1`?tZ7J:]Cb-#&6#:UU@<=%k;BRnW
2`!!>0JG:;0J(M_+@BRV/3tgB0JY=@/MT";2Cp[;2`E9D0JtI;2DmHS3%QX91+kLC3A<BP/1`?t
]duNZE%DG*6#:XOBlYaq;BRnU2)d'H2`<KQ/C(LC6#g]l/M&V:2)%!?0K:pF/2/\82CpUD2_I!K
2)m?M/3#7A2E3KJ0e=k,cESodEGR0qEc5e;6#pCCBk'1H.+kHNK\;+4Ze2N3+P<UFK\3cdVq@m!
YokH'DCoa7F)i]P@H"c!/`F7B`.?(FBlY=E-Zj$5+D,G8Bl7Q2+BrDcB5D-b.4u&:6#:XOBlbgr
;BRnS0eb.=1c%'K/C(UF6ul]e/M&V:0etX;2E*HH/2Jn42_6^D3%cpA3&`]K/2fF>2E!9I1bgO4
/C(UR6ul]e%15C;FCfK)/4`Y]1H.6K/2T7D2)$T,]-'dYD_*Ik/M&_21GUL91bp[D1GCO<2(UL<
/ibgK3B&WC/1f)Y/50Vn/.DqPCis9/@4XrI+>Po32_6aB3A<9@cF4o`9joS)/20"<1bgR;3AEKE
1+kC@/28k6/hf%:2`<?@/M]==1GCU>0K(I5/C(^U6VUu?%15C;F_kJ/6$76jEa`cuF"Bj[+>bl5
2(UUB1,(L8cFtE$9joS=@4X,f0fUp=1GL[@/2St90e>%;3A*0G2)I'E/2K"52)70H2DHa6/C(s\
<D?mQ%15C;F_kJ/6>pmU@;KY!/4`Y]1c%'L/2]:?0f^f1]c^<l@4Wu]0ekCB2(LI=0K(I</i5R>
0fD$E2DI3N1H-j@1G1@A1c$gC/1`?t]e!/X@4Vip6#:gT/4`Y]2_d-D/3,IG1c?o1\1o+)ATB=f
/29+A2DQd:1bga:1bL[A/2B1A/hf.>3A``I1bLO;1H$pB/1`?t\1oO5ATB=2$:/KSBl\5F85^Qc
1cR<C1GUaE1+^_b+@g![/1iD)/2Jn72(UI90eP7;1,CdB/28n43&riR3AN-:/C(s\7qHNg%15C<
@:X(jBONG_6m+<B0f_0D1-%3L0J$QR6VUu??S#P83%d3N/3,L=1H@EP3A<!91-$sH3B&]O1b:C9
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qq9joRs:2+?PEbSs"+E2@>E,Tf+Cc`b*D.-shDeNQ%BlbD=BOr<!
De'u/Afu2/F`(`$EZf(6+A$3TD]inBFD,T/DeF>J+@1&kG@bT,+CT=6Eb031ATMF#FD5W*+DQ%?
FD55r/0I5q@:X(jBON#tF!+n-F)N10+D5V'+E(j7Ci=K./0JnC@:Njk@;]TuF`(o8GqL9M$:/N;
DKBN0@<l94=$]b]/Mf47=$]b]/Mf47?Q_^VF=^cM?S!oc/i,140fCmA1H@HQ2`3-<1,COB2D@$I
1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70qqEc`iV:hXQZBlJ$*DIml3E,ol9Df]?'/g*Gs@;[2dBl7@)
@3B9*+E)./+E(j7FD,5.FE_XGFE2)5BlnVCA7]IsBk;?.De:,6BOr;_BPD9sE,]N/ALDOA<+0EJ
Ci<r/D0^5:Des?)Gq:(HDIal(F!,R<AKYr4Bl.d/A8,Ig+Co%tFEo!IAfu2/AKYo$ARTI!@;]Tu
E,ol=ARfh#EZf:4+D,>/BOu4$@;[\A%15C=@:X:mFY$T[;c#&'1+ZKm;c#&'1+ZcT:h=8j?S#P8
0et@:0J#":3%d$J1cR6H/3#7@2DHsG0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)AS3PnF`M83F(c\8
Ec5o8F(&lH+@0mRA8c:,+DGm>FD,5.E,oZ0@<-W9BQ%a!Cgh3l+E(j7<-<4sAU,D,DIal1AS,Lo
F!,RC+EV:.+Dl%=BOu4#@;]TuBl5%mF`M83F(c\+F_l/BEb-j4$:/Q>BONG_;BRqU3B8WF0eb:8
1G$h]+@1!f/1iD)/2St62_6a@1bLO;3&ETP/1ie52`NTK3AE'9/C(aV6#gor%15C=B4Z0rDIIQ:
85^Qi2)$R91GUpL/C/u)+@U<b/1iD,1,Ud?/M]%70J#%52`<3D1+kLC3ArfQ/1iV3/het90JPO<
/1f,#1+Yk7Be0]#6#LCFEa^Li6m+3<1-%3M/2]@G1,(7d+B;-E/70r8/2o1@2CpRA2_I'H1H.<P
/2]@=2Dd*H1GgX<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<D?mQ;g2e`Bldr1E,ol9Df]?'4!6h,Bjl$j
+DGm>FD,5.DIIBn+E(j7@3BW1@:NkiBPDE.Bl5&8BOr;tE+rf)E,T<)+@0mZ@<,d!@X0(pG@b<!
F(c\)F`_;8EZdn]EcQFJ9jr'aBl8!1DCuA*6#LIH@4XrI+?;G51,([B/C(LC+Ac`_/1iD,0JYOB
/Mo4;3%Qg;1b^I=/i>RA3AWZH/Mo481GC^@3&E0;/C(LO:hXDk%15C=F(KAC85^Qh1b^d<3Ai`S
0eCVT+BEW$/1iD-3ANQQ.l&q<0J#%51c-a=3AN3A2`<HN2(UL>/iGUE3A<6?/1f)O/66n0/.DqP
DKK<-ATKCn;BRkP1GgXB0K1mG/C(LC;e'_s5qF`K1-%0C1,^mG/28b22CpU?2_HmD0f^sG/1iV8
/i5@>0JG:6/1f)O/5p%s/.DqPEarNo_l[u2844RT1GL^H2CpdB3&EKD?Q_[RD_,6H?S",g3%um=
1,CO=1c79N0e>%=/i#4?1b^p@1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4+8n/0[AtA8cL/@;[3,Ec5o8
F(&lH+@1$X@;KY!+DGm>@3B/jD/XQ<+E1n#CER>/+EV:.+Du+<FD)e8AfsBWA8cL/@4WOFBOu3q
+EV:.+B*E#+E1b1F(KD8FD,]5F_>A1@3B6%Ch4`'DBO%7AKYi.F`);0Bl5&8GA1Pu+CQC<ARTU%
@<<W(Bm=3"+Cno&ATKIH8TZ)!@<3Q6F(Jl)@<3Q"+E2@8D/"*+G%De;Derj&+CehrASu$eEZee.
A0>o(An?!oDI[6#E,TH.F<G16EZfF:AT2<oEb'56@;]TuARTUqGp$g=BOP@aFCB'/F!,C5+@0mU
DfTl,/g:`36#pIWF`MVG/4`Y]2)@'C/2fLH2`!#1YolAOD_*Ik0f1UB2_-UC0ek420J5%:/2Aq9
/ibXD1GCL60f^j@3&3<E3@m[@AS#X./C(LO6>pcn,#i5e+@gH`ASWE1ATDW1iOjumJ^1jQK[.?k
^S]>.cG.\W+Dk[uDK?pE,#i5e+@gQ_Eb$@<4!86Z+Eq78+E_a:A0>K&EZfI;BlbD<FCB24@X0))
Cht5&DI[BlDKI"0F*)G@DJsB'EcW?O7<2gYDf^#6ASu(#/0IJtE,]6+@q^"+/0Ic2Des!%GpskE
DIal(F!,F?F)u&)Cj@.3DBMA\H#Rk>@;[3.ASl.!BldcqDI[6#@V'%XF`V+:BlkJ0DfT]+A0>i"
Ec`FBAfu2/AKXESH#Rk>@;[2tDf0W<ASc0kFD5Z2+E(j7FD,5.883$^D]hPgA7T7mF!,[?D]i\8
@<,miA0>u-AKYK$DKBo2Ci!O%Bl@l3De:,6BOr;QF_kkAF!+.fB-8U@EZd\kChtJ?+B3#gB4r_:
F(Jp#+DG^9<D?mS+Cf"9+@p'bBl@N5+BNK%CNCV,DIakX@<lo:2)[?:%15CACLLZp:iCDsATDL'
E\'aZ+?))51FtOD1-%0BcE]2J;eL,%/M&J)1bLOB/2B4>/iYOA2`*3>/Mo::2`WlW2`WE?/C(OV
/5p2%/.DqPEbf)m+Ad)mDfRC";BRnS1H-jF2)7!C/C(OU+B)on/1iD-3AN?J/Mo:>3%Qj<3ArED
3A<'D2*!NO0e=n51bLUB3&riV/1`?tZ8!n/B6#O4$:/]MAR[2];BR\R2Dm$@2*!WR/C(LC9P&/o
5qF]I1GUm@0fLpL/2Ah83%R$F/ho=@2)[BE/MT1:3&36E3&rN@/C(LO9P&/o%15CB@qBIm@4XrI
+?)#81b:XC2)$p>cF+ioB6#Oh/29.=1,^^>3AiTD1+kI=/2B1B/iGRC0JkR:/M]==3&iTG2DZmX
@<?4$/1f)T/5p2%/0\MD@qBIm@3?sB,%5M/E+sD<+t5,e;f?f!@q@\D6#:CHB4Z.++>G`.2'NJ:
6$$URCiseA6$76jEa`cuF"Bj[+>Yi40e>.:3AE6>cEn]]DIY4`@4X)l1c.-A0fUjI/2Jn=1b:@;
0eP1>0etRF/29+:0f:dD0KC[8/C(UR6Z-Bb%15CBASc1*F!*efEb/ZqBlbgr;BRbP1c[*D1,psG
/C(RE6Z-Bb6");u3&EEI.l&h73%Qm=2E!*@1GCF@1,1UB1+Y18/i5IG2)$a9/1f)Q/44;b/.DqP
F(fB$F(eu585^Qd1cR6A1c$j?3@rI`+@pcd/3tg@3&ENQ.kik:2(UO91c[*A1GLL?3AWTS1b:O;
1bgsL0KC[8/C(XS89nVp%15CBE+risF),><85^Qd2E<cK1c7-J2D!.a+@BRX/1iD)/2Ah50e>%8
3A*'G1,UgI/1i_>/i#@C1,C[:/1f)W/43id/.DqPF*(u6DfB8=85^Qb0f:[:0fLsK3@lp?+B2cl
/3tg@1GgsL.l&q;1FtC92`<3E2D-gF2E<`U/2B%72)R3J0et:2/2Aq2<+0o#%15CC@;Be%@;B:&
=$]b]/N,F:=$]b]/N,F:?Q_^1@4Yb:0K(aE2(^U>2)6^;1+kIF/28h5/ho(<0JYC7/Mf.73&NZO
3&<*@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6VUu?<,ZDfCh7[!+E2@>E,Tf+Cc`b*FCAs'Ea``l+Dk[u
DK?qBBOr;rBOPUm+E(j7FD,5.6$-OFDfT8I+EV:.+DbJ,B4Z.++Dl%>DKK<$DBNt.DJ*N'Bl5%m
DeEu@%15CCBOtXuDIk@i;BRkP1GUL@0JbL>/C(^I6ul]e5qF`K1,L[82DI!B/2Ah:1Ft:<2(gmL
2`NZS/2f482)-pC0f1F4/C(^U6ul]e%15CCBko7j;BR\K1GLF82`*?N/C)!Q:h=Yu5qF]G1c.!=
1GU[D/2Jn<1b:LB/hf4E2_m'<1GUR<3&iZM0J"b+cG(o,ATB=2$:/cM@<3tj;BR\K2`N?C2`NWQ
/2B.,<+0o#6")K!0JbOG1+P+:0Jb79/iGI92)d-C3A<<N2_6^@/hf.=1bgj=/1`P8/6$&#/.DqP
FE2)(/4`Y]2DR!G/3#C?2`!#1Yom"d5qFT=0fCjJ2_?pJ0JY16/ibX;1,Ug>0fCpF1-$m;2E<BD
1,h-H1+Z+-FD5VD/C(LO<,t8U6Z6jaEa`I"Bl@l3De:+Y@<lF)+Co&)BkM<lFD5Z2+@.DlE+iZ/
+B3Aq-t."+F_kb@+@.DuF*)G2Ch[r>/e&.RG%kl8/4`Y]1G^^D/2T(81H-l1[3.hFE\'L-0K:gC
2(^[G1GLF8/iYa?0etU=2DR6K3%um82*!9H0KCsL1b;(5B5D:'BIk^[[4F[RE\'e"G%GQ5ARloq
DfQt"BOr;PBlY=^Ci*Tu@:LEuAfu2/AKXN<+AQ?fFD55nC`l#[D..<j@j"QZAnbad%15CG_m=/t
FDNL!6m+6?1c@?M/28k=1GLm@?Q_^IF=^cM?S"/h1,CI;2*!9L2`*9M3%QX:1+kC=3&*-G/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S"QUF=\V1AU%p!@;[3,Ec5o8F(&l;+@17iZYXQ%C`mS+@;^-/G@>T)
EZee.Bl.9p+DG^9FD,5.DIIX$G%Ddk@;'dlFDN(9@;]_#@:s.&+EqL5@q[!!F!+m6F`(o5F_)\(
DIal"F_l/BEa`d#Gp%0BB5VEqBk(RhF<G.4A7]Ul@j#2sE+irpBlA-8+EML5@qfLq+D,Y4D'3q6
AKYGjF(oM7De:+dAU%p!D_<4C$:/rKH!t`;@:XX7844RT3&`ZL/28q@3AW3n+@U<b/70r8/2o1@
0e>.=/hf+=1b^[9/M]"43&!*G0Jk=90JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7<3)n9mL/bD..H-E,ol9
Df]?'4!6h7AU.^)G@>$-+DGm>FD,5.Cgh?sATMr9@;]TuD/XK;+DG\3DfTr.DKI"ABm+'.+DG^9
9mL/bD..H;%15CIASbseAmo=`/4`Y]3&<6C/28h;0f(^=c[[_m6[<;q/M&J)1bL[H/2K%=/i>C?
2D?m;2)-^<3&rlP1Ft(.c[[`$6[<;q%15CIBONG_;BRqX1b:@;2_Zs;cF4obEbR'V/1iD//iYjB
1c-g>0K(mL1Ft+;/iYjN0f1a=/1f)U/4FSn/.DqPH>RA,Be2eQ+>Y].2(UOC0fLd;cFtDtF`8nk
J<MN<2`*NN/M].?1+Y461c6g=0fL^@1,CdG1Ft+51bLaF3B&oU/1`?t^+<*'E%DG*6=FG@A9BFo
6m+3?1GCdH/2o@>1H$dD+B;-M/70q_1c70N.lT:B1b:O;3&<*@1,LU=0JPCC1FtIA/ibU>3ANBA
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKC^/6,DY/0\#2F`_:>95ei^@;[3,Ec5o8F(&lH+@9LJCLhQ1BlbD=
BOr<"BkM*jF*&OADfor>@;0U%Df-\>BOr;ZDfTDtDBNn0DJ=!0F_kJ;+EM7=F^]B'A0>T(+AQiq
FD)diDfTDt/0JA=A0>r=D.7F"Bldj,+EV:.+DtV0Bl@ltC`me<Bl[p0+E(j795ei^@4i`5$:80A
DIIQr-Z^D/FCB2@7nOm^3B8WM2`WZQ/64M`0JFVFE+gdS/1iD5/i>I:1,_-F1c7*D1,CI</iGUI
1,q6E8O6?!=%?1a/1agW2)$^8:N0tu%15F1FCf>494;OVDf[I#;BRhQ3@m-J1c6i0[NIqKF=]^d
/2/e90f:O;0JY=51G1UC/2B.:3&WWK1H-j:0eb491GpjC1b:1/cF,8kATTI4$:8<8D/!i<85^Qb
1H@6B1,(RA2([(-1E],,Be1he/M&\13B&KI2D-[;3ANBN/1iY7/hf"<3&ETG@rHC.F`;G6A1T:X
Kek8KEbR'jCi*TnATMr90f:[C%15F5Bk/bc;BR\L3B/QE3AicT/C)!b+@U<b/1iD)/2St51b:O?
/ibgJ1bgj=/N,4@1H.0N0J"b+cG)(b7<3)n%15F5Ch7E6844RT3&*3G1+YFC0etR:?Q`9[E\(QK
?S",g2)Qp?3A<'@2E*NL2_6O91G1R?3Ai`L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,gE\(.#DImHh
Ch7[!+E2@>E,Tf+Cc`b+ASbpo+DGm>@3BT!Eb-A7Dfp)1AKYo'+Eq79ATAo-DBO%7AKYl/Ecbt;
De:+jASu'l@;IP*$:8<?CghF+Bm;1";BR\Q3A<!>2)@$H/C(RE:NC/#/M&S51,Ud:0K([@/28b8
1b:U@/i#CA2`<KD2D-dB3B&WJ/1`?tZRemmBe0]#6=k1KBR+K0@4Xr8<%Uou0f:LQ5u]F4/MT+6
?Q`0VE\(QK?S!oe/hf%32E!0C1cR0I1+Y4A/i5I?2Dd0?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5Tnu
/0\)0Ea`["Bjkm%E,ol9Df]?'/g*JlEb/p0DJ<N%G@>P8@3AKb@<Q?p+Co%tFEo!IAfu;+FCfK6
+CT.u+ED1>ATD6gDJO;9@Wcc8Bl5&1DfTD3Eb/`lDKI"CBl.F&+D>>,+EMX5FEMXIBOPs)@V'+g
+E2@>D/XN-A0>u4+EV:*F<GL6+CQC1@<?4%DII?(B5_<kATMo8idd79+sL]3@<-I'+Dl%=BOu38
+E2@>FCes(Eb0<5+E(j7FD,5.ARTV$BHeWQ+q4lGATVL"B4Z4,ALpAM+>PW/0e>(=3B0#McESKf
EbR'j@4X)i2)R->0K1aD/2/\52(U^H/iPdG3AWZH2_Hp@2_[-H/1`?tYq/[kBe0]#6>0eJ@;]d1
85^Qi1H6p?1GUXE/2T((6#pZj6");u1,Ua>.l'%<2CpX:2DHa>1+kCD2*!TN/2B.:1,^gD0K1O6
/2T(46#pZj%15F9@VE]2/4`/O3&WHM0e>.@2_d$<?Q`9YGV!2Q?S"/h2`!!>1c[0B1,LmI0e=n4
/iYOE1bpj<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p,)/0[Z'A8,Ii+E2@>E,Tf+Cc`b+BjtboJKS/M
@`bWZaeiK">p*j&+EV:.+@9XWB45Uj+E2@>DKTi,Bjl*tDf-\9Afu2/AKXo[DKBT6BlkJADfTA2
<bZ#V@4WOFBPCsi+Dk[uDK?q/+C]A*B4uB0@V&tb+E(j7Ch[NqF=naH$:8H?@;RPd;BRqU2)$R9
0KCsF2_<7a+AcW^/1iD)/2Jn91+Y4;1+kF@3B8lU/2f+83B&oU1Ft(.cF>E%AS3P'$:8ZPDf/u7
844RU0K(gD0J"q42_m6F/70McEH3U;/70qf/i,=81GUg?3&NKN2)-X62_Hp@3&3?I/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"K_E\&D$Df]f1@3AurA0=ESEdD;0Dg#i4@3BN0DfBW9@;J"J6>pp`DIFZ%
F!,R<AKYl!D.Oi&Bm+'*+EVNEFD,5.FCfK5Bln96Gp%$;+@:!fDJ<N%Bl5&8BOr;@0Q^tN@qBP"
F`Ma[+A?3cATB=EFD,5.DIIBn+Eq78+EVX4DKBE.Ec#Au+EVNE6>pp_Bji-&EbT0#DIIX$DJ()(
Ec5e;FD,5.DIIBn+E(j7FD,5.6>pp_@3BT)G%G\H+q4lGDffQ)DCe=V+?;;6/28t@1H6r2ZlhYT
Be1he/M&_21Gp^?2_I*E2`!<L/29.;2_m9L2`*':/C(UR6#pZj%15FB@:NtbF_r[#;BRhT0Jb7=
1H.$F/C/qk9PIre5qF`J0JkL91,UdF/2Jn62(UL<2D-[<2`3KP/1iV7/i#C@3ArTC/1f,"/50be
/.DqQF^fK4/4`/O1H7-L1Ft:>1H7'>?Q`'SDCf-G?S")f2E<<J1bLO@3&E<F/1ie:/iG^M1Gh!@
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/59\n/4"E"FE1f+Bjkm%E,ol9Df]?'4!6k4@WcW4BlbD=BOr;Q
Df9N;F`MMFDJ()9DfTA2AoD]4@q]RmA1e;u6?R0S/4`/O0fCaF2(UI;0f^s>?Q_XPA1V(=?S",g
1,pg@3A*'E2`WcP/2T+70K([E1GC@80JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#L3a7<E3WDfBE!DBNn=
DfBW9@;J"J6?R0S+DGm>FD,5.@rH4$Df0B:+E_a:A0?)7Eb$;)DfQt1De<TmAKY])+@UBcBl@s)
@4hur6?R0V@4XrI+?2,71b:@82E*TR/C(sP6#gor5qFcG1H.9F0K1jD/2St=0J#"81bLU@2`W`R
/1ie53&NNJ0JY11/C(s\6#gor%15G>WGKJODJsSI844R[2)d?C2E!BJ/70MrF(6b./70qe/ho+4
1,1C;0JY@>3%QgE/i>OF2E<WG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCt/0[Q(ASu!k+E2@>E,Tf+
Cc`b+_l7IiWGZWq+Eq78+EV:.+D5V'+E(j7Ch[NqF=\PQAfu2/AKXooDCco=DIal.Aftbu@;L%!
+DG^97q$OVBldr1D0^5:Des?)GqL9M$:A6>DfBi?/4`Y]1,C[D/2Jt:1H6r2YolDBE\'L-0K([C
0J,.;1bpU60J57=/3,R?3B/rX2)m-=2)6dB3Ai]Q0e=k,cESof@<*n.$:A6@ASc0k/4`Y]0fLdG
/2B%?0K:W/Yol>TE\'Lb/2/q92E*-C2D?g90J5%=/2oRA0fLjD1,pgA2(gmL2`WlQ/1`?tYq/1`
E\%Y,6XaqI/4`Y]1,1==1c?o1Z62MCF"BU.0JG1@1+P4B0KC[>/i#C;1+k=B1c7$D/2]F?0f1mL
3&)s8/C(OP6Xb$e%15I2F*)>@/4`Y]1,q9K/2K1D2)$T,YolPJD(It]/20"=1c?j?0f:a<0ePIG
/28k8/iGOH1bq$A1GLLA3&iZP2CpC1cESojASit-$:A6CFEMD./4`Y]1,_!@1c-sC/C0#*+@BRY
/1iD)/2St;1+Y.:/ho7B1,gp=2*!9D3&**E2(V<b<?P@5;bekpc\4,*6Xb$e%15I6@UX(n@;.8`
;BRkU0Jb7>2E*HJ/C(OD:N0tu/M&J)1+kLD/2B+@/iYaK0f(^=1bLXD2`!-A/1`?tZ7JdjBIjT"
6Y0t@D_+FI+>u#42)Hj?2_m?L/70MeBONH!/70qg/i,F;0ekL;3&E?D2)d'<2`NEF2`NfV1b:C9
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qqBONGlEcl#;@<l:!+E2@>E,Tf+Cc`b,ASGUl+DGm>FD,5.DIIBn
+E(j7FD,5.DIIX$G%De<Eb/f)De:+lEcl#;@<iu;BOQ!*B5)O#F!,L;F(HJ9D]j.8AKYl!FD5Z2
@;I&uCi=N/E\7e.6Y1(BASuE;85^Qb0f1R80fLpK3@lmC+B2cl/1iD,1GgpJ.l&q92_6g=1c6gA
2D-a=0K;'K/2B%71,q9N2E36=/29%6<+0o#%15I6Ectl/FCfME85^Qg2)mHE3&W]U2D!.d+@1$V
/1iD)/2]%72(UL@2D-[>2DR-I/1i_6/iYXD0JtR91,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(mZ6#pBb,#)caF_,A3A7ZlNATDs&
DKKH2+B)]WG%G3)@3?sQ2)I6D0fCaE.3NhCF!+m6AmoOpF`S[(E+*WuF(c\?EbTW,EZee.A0><'
FD,T5+E(j7+sKHl+A$H`ASu4#F)N0lBk1XgB5\n\Df-[pF_Q)=FCcS*AKYet+AH9^@q]9p+tb&K
$:AK8CghNrDCe=V+>bi42_6gB2_m*=1cHOW9joS)/1iD1/hf(40fCj@3&WZP2)?d?0J51<0JYLD
/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQ
Bln'-DCdV'/6,DQ/44)ZCghNrDBNY7+CQC0H$!_<Ci<s#@ps0r@rcKtDe*QuAKYc&DJ()(Ec5e;
@3AN_@;-irDes32@;KL-%15I9@;U.&Fa5N/;BR\N0et:80K;'L/C(a\+B2cl/4!\q0JkOE2_-U?
2)6^=/iPR;2E*6C2Dm?O2CpR?/iYdD3&iZE/1f)V1+ZC5FY!t/6YKnHE+j9#H!r7*5uUT32)$R_
5uUT32)$Rg+@U<b/70r8/28k32`*'B1G1RF3&!3M/1iS1/iYjN0K(^<1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/4FSn/6$:kBcqA8DfBW9@;J"J6YKnH+Ac`l@<l9(BlbD=BOr<!Eb/[$+ED1>ATAo3Aft&d
@;0OdDIb@/$:AK8Ea^Li;BReT3&N6F0f(OC/C(OD6WS(U6")<!1,C^F.l8t90e>.61,LO:3&iNI
1Gq'E1Ft@;/i,@D1cIEG/1f)P/43HU/.DqRBOPt#`J?'95u]F4/N#(M5u]F4/N#(d+A@'$/70q_
3&*?M.l0(>2_6[</ibg@1,h$B1b^dD2_Zd=2D-mC0f1[E/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lr
E\(.*Dg#Q)Bjkm%E,ol9Df]?'4!6n(@<6A+L`gDQ+CT.1@;]RhASuT4;f$Aq@;@!-ATDW1AoD]4
;fut1%15I9ARfCf@4Xr;+>Gl32E<cK3B9&Z1b;uV6#g]l?S#P82D-gC/2Jt:/hf%<0JPL;1bLXF
0K2!L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_Cb-btBOt[eBji,uF!+m6Ao(mt/TZ&TAmo1\A1SjF
Ea`KmFD5Z2@;I',ARlp-Df9G7BOQ!*GAhM>+C]U=D.RT-@;]TuGAh>0DCcoOH#7#/Ch[s)DJ()6
BOr;rDfor>Ed9$R+ED1+BHVD;@:X(oBl@m1+CT.u+DGm>@rH7+Bk1dqARlolF!,R<AKYl!FD5Z2
@;I'"ART+[Eb0<5+D,P4+DG^9<-<(mF(o&8+q4lHBOu4+@;[Ve;BReP2*!3F1cRES/C(aJ9P&,n
/M&J)1G1I>/29%B/i>O@0JPR=0f:R?1-%3N0e=k,cF>E!AT'+/$:ANL@:WqcCh5.g6m+3A0JY16
2)I6C?Q`0d@k:t<?S"/h1H$d@/iYU@0ek@50f1L:2)I6L2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)
F(6aF87?4SBjkm%E,ol9Df]?'4!7L9AKX?SFCA]kCi!Z*BlbD*+DbJ,B4W3&Dfor>@;0V$Df?h2
DfTr?ATMo8Bl5%gDfTA>+@opTFD2k,F_PZ6+CSl(ATAna@;0gt-Z^DEDId<tASu$iDI[6/+CT.u
+Eq78+Co&)BkM<lFCeu*@3AQF78lQL+BNK%Ch+YZATDL,@:s-oF(o`-+CT))DJ()9Bln#2FD,5.
DIm6s@X0(p@;^-<;f?egBcp5\Cgggb/g:`36YUXNCr;qt844RX1,:aF/2K(@0f^dl+AHcl/70r8
/2f+93@lm=2(gRA2)-pJ/1i_31H%0H2DHa<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9lFo#7;O)F@;L*q
A8cL&@;[3,Ec5o8F(&lH+@Bjb@;NiT+Dk[uDK?puBm+'.+E(j7F*(i2F!,17+EV:.+DtV0Bm+&1
:17gY@<<W.@;]_#@:s.(%15I@@qfCjCh$m)844RW1,([=1Gh$N/70Mu@r*]'/70qe/iPa@0ek:8
0ek@=2(U=72D-jA2)[EM/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,cCb/=q@psCdB6@X#+E2@>E,Tf+
Cc`b,De!KjDerol+DGm>FD,5.:17gY@;L$.DIIBn+D,P4+EV:.+DbJ,B4Z.++DbJ%AKY])+@B^X
FE1f++@0jUEbT#l+DG^9:2+3HEa`U'@4hur6Z6pTEc,T$F`T*);BRbQ1,:C;1Gq-N/2]:-6Z-Bb
5qF]L2)7'?1,q$C/2]%?2(UI<1G1C=3AN<E/2B1;1G^^E1,(770JPF-:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?2)QpPDIY4A:2+3VCghI-
+@C'dATD[&@s)i8DfQspBkqX'@;6oXDfB9.DJ<l/-o!P;1G(==1c$R'G@>P8@3ABbCh[s(+CT>5
Ec5i6D.R`1GA(n;E,ol9Df]K#+EV:.+D>>&Bl@KmDKKo5@j#W,A7]R"De:,6BOr<-Derj&+EMgL
FCf;3Bl5&,BlbD+Df9D6+sKEd+ED%:DesQ<Bl@m'@Wc`7DfT<$F_r72De3`rF*),=D'C/V+q4lH
DfQsf@<-:&Be2eQ+>c)52(UXA0etU;cET,I6WS(U6")<!1,UsD.l0.>3@lp<3&rNE3A`?B0K(pJ
1Ft=A/i,4A1H.3C9OW$WDBL>rDJ*d"F(d!R/C(LU/43HU/0[brD.4V90fCsH.4cT<Bjl=6BcnfY
3&*6=+q4lHF_Y?%/4`Y]2DHpF/3#=?2DZo1M',?#E\'L-0fCdE1b1:;0JY19/i>R=1,LmA1GpsK
2`WED1bLI<1GUmG/1`?uM(D2/E\%Y,6ZmEj@4XrI+>Gc42CpU>3&`]GcE\Q]EbR'V/2/q82`NBC
2)$m=1+kLF/2oI>3ArWL1b^I42(gRB2Dd6K/1`?tZ7JFbBe0]#6t'P=BIl\P+?)5<2CpR:0JbOC
/C(OU+@BRV/4!\q1,(I<0J,"91cHsA/hf.61GC[=1,UgH0Jb730f1LA3&*6D2(U:0cE]/U6Xapb
%15L3Ch[`;85^Qj2DZm=1cRES/C(LC7W3;u5qF]G0etI81,q-O/2Jn<2Cp[E/hf">3&WTE/M]:<
3B/rU1,(71/C(LO7W3;u%15L7DIm9.85^Qh3ANEB0eb@:3B/S8YolDZB.PVc1,(O>1b1C?0fLX<
/i#:81GLR91Gq*O3%um?2(gXD0JbLF/1`?tYq/7fB.OK!6tL7I@N[sQB4YUf/4`Y]3&<<F/28h;
2)R9CcEn]]@;mb`@4X/g1cI*?0fC^F/2Ah;2(UO=2D-pH0JPOD/1iS7/ho+?1,q3D/1f)R/43ib
/.DqSASu'gDeri585^Qe2)@'?2)dEL1+^_V+A??b/1iD-0f1mF.krk:1b:C70f1F92`E?E2DdEK
0J"q8/i>RC0Jtg@/1f)P/50Vn/.DqSBjkO`D(J4U+>c):3%QsE1,L^:cESKZDf%$k/28q80JG"3
2`!3?1bLaF/29.D/i5RI0JYX>0fL^B1-%0J2_6L2cESofDf%$7$:JTGB5_TpGq;KS+?;>62DZmA
1bgjI/70MnAT',,/70qf/i#.40fCpB0fV$G1,pg:1+kF=1GU[E/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
?S"l^D_*)3EbTE*A79!k@;]Tu<,Z5SB5\o3Ec5o8F(&lH+@Kp]B5_TpGp$s8@;^-/FDi:4@;]Rd
/0K%YBleA=@;]TuFEMVA+DG^9ASbdaDfT9.AKYi.G%GN%DKKqN+EMgF@W-'sF(oN)+EV:.+CfP1
FEMV8+CT.u+DbJ(B6@WqAKYo'+EV:.+CT.tATMs3EcW@AAfu2/AKYr'DfBN(+E(j7<,u\jBk1X_
+CT.u+B38g@:sL2+q4lIBlI`r@4XrI+>Gi8/2K+;3@rI]+@B^^/1iD)/2Ah31b:@8/iYjM1H.<F
/MT1:3B/oT0K(I5/C(OP6Y1?j%15L;H!r7*5uUT32_lpc5uUT32_lpk+@^9i/70q^1,LgC/Mf(8
0J"q4/ibjA1bgU:1b^U?0e=n40J5(<3A<9I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"ZbE\&D/@<HU)
FD50$+E2@>E,Tf+Cc`b-BmF,0BlbD*DBNk3C`mP&D/^V>BOQ!*BlbD+Ec6)5BQPA+Gp#[rA8,Ii
+CT.tATMs3EcW@FD]hb_F`M2<Bm"J>Bl5&8BOr;@3&308F"AGBDIal(F!,UHARloqDfQt:BkM+$
Bl7Q+A9Dp,DJ()5E+NNn@;I')@q/qgBl@m1/0JYE@r-9uBl7Q+FD,5.Ch[NqF<G1,F*),>@;I')
AfsKUG@><%/g:`36uQ[OA77#[6m+3=2`<BM/2fC?1cHsm+B;-E/70r8/2o192_6^<1G1C92DdBK
/1i\;/i#@?1H%*A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ud/4j_iDf0--Bjkm%E,ol9Df]?'4!6q0
Anbda+Dk[uDK?q=F`JUGFCB24Bl5%gBjl'*Cgh3oF^\oo/e&.UDf&rlGq;KP<%Uou1Ft(a+B;-E
/70r8/28k32)6^<0K(O;3A`HI0e>.@/hf%?2E!NG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/0[u7
F)u&(DBNn=DfBW9@;J"J6uQpO@<iu0F!+m6Eb0<1Ec`FEAS5^qDBNY2+EV:.+AQiqFD)da@<H'g
F*2OHD/XQ7FCAm$F!,R<@<<W+F!,%3@r-()ARlomGp$sBF`);0Bl5&*DfTE1FE8R5DIal1Bk(g!
GA1l(Ch[Km/0JYE@r-9uBl7Q+@V&tgF!)l>F!,R<BlbD<FCB24Ch[I%+DG^9FD,5.@rH7+FCf9)
@<?4%DBMr"F($1c@;9_$/0K%JAKYW+ART['@V&tg.4ueR$:JrFBQ[cn@4XrI+>l/:1FtIE1b^X8
cEn]m@rEna/29%:0Jb:91,Cj?1+k=B/2B%9/hf7@1Gq0D/M](62DR!G0eb.0/C(UR;e'_s%15LG
@VB=(85^Qe1GCO72)I!F0eCVT+B;-E/3tgA0ebCB.lK+=2(UI73&)s=2Dm*I1GLmJ2(UX?/iPXB
0JbR;/1f)O/6,DQ/.DqSH>-hsDCe=V+>u,62CpgG2DI$>c\O:u6ul]e5qF`L1bh!@2_m'I/2St:
2_6^B2(g^F1cR3H/2o=:0f1jL1cHs:/C0,,/4=Me/.DqS_lS("[ObKG;c#&#2_8#r;c#&#2_8;Y
;e'_s?S!oh2*!WJ1,psE/28k31c[*B1H@'J2DR$I2_6O93%cmC0fLsG/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S#,cD_+7oF*(h5;JBWLDBNn=DfBW9@;J"J7)Q*M_mU\%DBM8dBju*s+DbJ(B6@WqAKYi$
@;^-/FD,5.F*2@C-t6n'B4Z*+FD,*#+EV:.+EM[C+EqB>CMn'7.3N&:A0>u-@<<W0AThX*+EVaH
DK?q=AnEY)$:SE?@4Xr;+>PZ22)[?D0ekL@1,:Cf+Ad,h/70r8/3#7>3@lsC2_HjG1c@?P/1iV0
1,^gF1c?m?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:ig+t,#`c-Bjkm%E,ol9Df]?'4!6t$CgeH1@<3Q0
DIjr/Afu2/AKYPmEboH$F*&O?Bl7QoDf'P<Bl5%lH#dV-/0JA=A0>r)Ecu#)+CT=6@3BN0Df'3+
ASuT4Eb/ltDf-\3DBO%7AKWaGA0>;uA0<[KA0>`'Ci![#Bji,N/jh68%15O7@<6-mBIl\P+>l)7
1b:RC1c76DcFG&cEa^LN/29";1c['D3&NZH1G1FC/2B"9/i#4<1H@?E2)m3K2E!6I1Ft(.cFGJo
Ea^L.$:ScB@rua"/4`Y]0ekL?/29(?3B8WF2]u(.FY#*q0JbOB3@cjA0K1O=/iPO:2)['B0fV0I
1b:C=/ho(:1G^p?/1`M7/6$&#/.DqTChI0g@<*ni;BRhR0KC[C0K1jH/C0S(<bZS*5qF`I1,q$@
0JY@>/2St=1b:C:2_HdA0JtdH/1iV01,:dK2)d';/C0S4<bZS*%15O?CNXZ?A1U8L+>PZ12_6^E
0JbO:cF=uaDepsV/1iD1/het13AE-G3&*BH0e=n42_HjC1-%*D/1`?t\1C!cCb-#&7;QjMFD*3r
;BR\Q3AE'?2)I'J/C(OD<+0o#6");u2)7'G.l'(?2CpR82Dm$F0eP=B1-%9J/2B1;2D@'H2)6^6
/C(OP<+0o#%15O?FCB'$DCe=V+>u/42(U^G3&<?AcEeW]Ea^LN/29(@2E!'C0eta?1+k==/2B+D
/ho4<2)I$=2)-^?3&ilX2CpC1cEf&iEa^L.$:SfGG:Z9Q+?)#83@m$F1-$mm+B3Jn/70r8/3#79
2CpRA/iG^J2`3KE/N,L>0fV-I2Dcs?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<-;\%9lG>dD.74!F_)\7
Ec5o8F(&lH+@U-]G9Cp;E,oN2ASuU2+Dbt>AKY])+EV:.+Dbt+@;I&\@;BP!G@;V1@;]_#@:s-o
De:,6BOr<(DfTr5ATDZ2Eb/ltDf-\9AfsfdH=:Z"BlS9,/e&.VDJ<]685^Qi1GCd>0ebOB0f:N-
[3/:WB.PVc1,1UB1+P%=2)?d=/i,I<1GUj@0Jk[E3&E0H/iYdI0JGL</1f)S/5Tnj/.DqTEcPT&
/4`Y]3&roS/28k;2_m<CcEeW\AT01d@4X/i1H@6A2`ENP/2Jn60e>+<1bLaD2E!EM/2oL?2D[*E
0f(@3/C(RQ6Y13f%15R5Ao;='/4`Y]2E<TO/3,C?1c-a?1*Au*@4X\q0fUpH0Io%=1GgX>/iYU;
1,h*D1c[HN0K(I?2(gaE1Gh'F/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdV"/4=Me/4O&[DJ=,6G@>P8@3A<`EcYe7D0^5:Des?)
Bk(Rf+Co\)Eb6G<BQ##8F`MA2A0>T(FDi:1+CoM$B5_Z?%15R5DJ(Lk;BRhW1c-aB3&3BL/C/hh
;e'_s6")<!2)R?R/M]4<2_6^:3&rNF1H@'H0etaJ1+Y"42D-^=1bg[D/1`?uJ1OW/D_)>)7U^LL
EbTSG85^Qh2)7-B3B&ZN2([%[+@CEe/3tgA3A`TI.l9+;3%Qg;3A<!>3ArKF1c%$I3%QmD/ho.9
3&**</1f)R/44\q/.DqUASc(%/4`Y]1H@3H/2T=E0f:L6+@pcd/1iD)/2St>1b:@<3%d-E2`3?M
/1iS:/het>1G^p?/1`A(89nVp%15R9Ch\-;@<,pq@4X`5/MT1,2DZm>1,Lp@?Q_^IF=^cM?S"2i
2DQgB/ho1<3A`KB/MT.91,:aD1c6g>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j,"$K^@;[3,Ec5o8
F(&lH+@]pYBm:b$@<,pq@3?sQ2`NeVJ<M]I2)?[(G@>P8FD,5.Anc:,F<G[D+EV1'@q[!+@qfLl
@q?csDBM;h@UUBfF<G[=AKXo[DBM;TEboZ8+CT.u+B)]d+@0jREc6#5D]htiD/!lrEd98[87`o^
E+NouA0>u-AKZ2*Gp%3I+D#)+@psInDf-\0DfQt/ChtXF@;]Tu@V'1\DBO%7AKYQ/E+O'(D.RU,
@;I'.ART(^Bl7Q+De:,2BR+Z5@ric,DBM;h@UUl5%15R@AS5RrDf0Z./4`/O0eb@;3Ai?F2`!BH
/70N#BlYb3/28k92)d$>1,M!B3%cmD/29(A/i5=A1,:O71+kOA0f1gL/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S#5lE\&D+FCB!"@;[3,Ec5o8F(&l;+@^0YB4Z1'DKKG4BlbD=BOr</DId=!GAhM<A0>o,
G%G\:De:,(Bl[c-Ao_g,+@gH`ASWD_H$!_<Ci<s3+DG^9FD,5.8T\BWBjkm%DIIR+@<?4,AKYr1
ASiQ.DBO%7AKYDnFCfK/BkCp!+sKEhG%ki&+@C'aD.R6l@3Qm<-q%cmBl7K)6Z6gYARp'8+C]U=
6t'tTAKX9TBkM*nATDK9+Cf)'F(K53@<3Q"DBNA(Cisf5Df-\>D]j.8AKZ&9@<*`:+D,>!Ed8dF
@<?X4AM,/9$:\rN@;KUcF`]0*;BRqX1,pg>0f(UD3%W@[+Ad,F/3tgB1,V!L/M]=B2_6[90fLX>
1c-gA0etXI1Ft+53A*3F1,:XE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>cESosF$V?$<+ohcDIIBn+DGm>
DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1Hfn%h1+P<UFK\3E[LtJ^MAp%r5@;IOS\><VXF<DtZD/XQ=
BHV5*+EV:.+D,>/BI>5]+A$Gn:h=ZgBjkm%@<6O2Des?)Gq:([BPDN1F*(i2+Eq78+CehrCh7-"
+sKQdAoqs3@;]^/+BMun@q]Fo+E(j7FD,5.;f?f#BHeWO+E)./+E(j7FD,5.Ec653C`me@@<-EA
+q4lKDfT]5F($Uj6m+3<0K(dG/2]=C0K:Uj+A??b/70r8/2f+;2(UI@1G1UE2)[6L/2An31c-pE
1c6g>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9P&,n,"$$XDImm#+B2c`E+N`+E,ol9Df]?'4!7"2Ec#`9
@3B9*+EV:.+D>J1FDl26@ps0rDIIBn+E(j7<+0Kb@;[31F(Jl)Bl5&8BOr;@2fr^U@qBP"F`MaY
+Dk[uDJ=!$+C\njF`_>0F_i17DBMV]FD5VF+q4lKEa`j3/4`'+/Pn#R1b;0`<%Uou0f1Fg+@p'a
/70q_2_m'E.l0.>2(Ua?3&W<C2D?a<0fCaE0J#">/i#7=0f_0D1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/4a>m/0[B&F*)G:@;[3,Ec5o8F(&lH+@^B[DL*F>F!+m6@q]:k@:OCjEZf(6+EV:.+Dl%?Bk8D2
,#`2sF(lgB+D#D!De+--DJ()#DBNM-E+O'.EZf:4+@1-kFE2)(+DG^9FD,5.=@lV:BHUerDKL#A
GqL4=BOr<,Deru-BlbD9CghU#A0>?,+EV:.+CSc%DfQsn@<-0tASH%.+@<uSBPf@G%15RICiq:"
;BR\O1Ft:A1,(9)[NIqGF"Amo/M&\12E<<K/i#7=3&NEA2)?jE3ArlO3%QU3cF,8k@<3t/$:]/T
@;L!nD..3gBIl\P+?2;=1Ft781H7?S/C(OD:ig+t/M&J)1bLUE/2K+?/ibgM1,:^<1G1XB0JG=@
/1`?tZ7Jgn@k8&r7WiT_/4`/O0ebUC1c?mC0ekUG/70MfEa^M+/70qf/iPX=0fV-F0JYXK2)6^A
1bLUE3AiWP/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Tc@4Xu[ASbdmA8,NrE,ol9Df]?'4!7"8DJ:5-
F!+n/+E)(,+A$'SCgh3lBk&90DfTA2D.R-nBl7Q+Anc9s+E)9C@VfJ!AM+E!7Wi`oA1U8L+>P]3
1+Y480etL8cF+i_9joS=@4X)j1,(L91GCL>/2Jn41+YFC/hf4D1GCL6/Mf(50K(^C2E*0</C([T
6VUu?%15RIH$*[L85^Qg2D[$<3&`TN0e=n!;e'_s/M&V81c[QJ1H.!D/2Jn53@lpD2_HpF1c6sC
/1iY:/hf+<1GC[;/1`A(;e'_s%15U6@rc^:/4`Y]1cI<K/2f4:3&E23ZQMVUFY#*q0etO>1+b@B
0K1O;/i>X?0fV*E2`WTL3B/QA2)d-B0f(R>1Ft(.cEf&hEcioB$:eN?H"ge?844RZ1GpsF/2T+=
1c?ml+@C$V/70r8/3#7;1Ft793A*9G2)mEN/28n43ArQI2`3-A0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
6Z-Bb6>1L`@;[3,Ec5o8F(&lH+@fjUH"ge3D.R-nF!,.)E,]N/ATMoF+@gHjF)rI!@<?4%DII?(
87?IVBl7L'F!,1<+EV:.+Co&,ASc:(D.RU,+E2".Ci=B5E+jM>@rH6pASH=!A0>;uA0>K&Ci"$6
ARlotDBM8ZF`_&0+CT.u+DGm>Df0,/De:+YBQ\E*DC9KJ@rH7,EbT!*FD5Z2F!,RC+EV:.+EqaE
Ch,.-$:eZEBl7Ql/5T8C+@7b?1G^O92_7d(;BS:[2D[->0fLXj+@g![/1iD)/1iD53%d$H2)[6M
/29(92`EEG2)?d7/70quASit-$:ef=F`Uu3/4`Y]1c.!F/2]=@0ek6)]-'L^@4Wu]/M&\13&3$>
2_m!F2)%$G0J#+B/i,:<0K1j?/1f)Y/4=Me/.DqVBk;0jBIl\P+>bu71+Y:C3&!->cEeW\Ecs!"
/28n72)m0B2`!6@1+kFD/29+?/ibdD2)I*?/MT1:2)I$J1-$m:/C(RQ6ZR?$%15U>DIIE685^Qe
2_Zp:2D?mE0J(MW+@C0l/1iD)/2Jn93@lmE2(g[A0JG:C/1ib6/i57:0f1g?/1f)S/44H#/.DqV
Ci<a'/6>,9:b=CX/1b-N9R1M,?S#P80eb4;0e>%90J5(61-%9P/2K(73&iZM0fLX=0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL9R1M,,!p<aFD5f0+E2@>E,Tf+Cc`b2DBMY^DKm9o@:a7h@k8`mCi<a'+Dk[u
DK?qBD]j+7Bl7K)-u<U5AKYD(F*(i2.4ueR$:f#OASH3o/4`Y]1,q*J/2K1=3&iJ7Z62M/Be2P$
0K1aG1+P%<0fLX=/iYjB0ekC82`N`S2`*'F/i#CH1GLd=/1f)P/43-G/.DqVEcl55F_r[#;BRkU
3&iHK2`3QP/C(sP6ul]e5qF`L2)@*?2)[<I/2Jn;1Ft:>3%d!H1,:OB/2]=<3&`TN1c?m9/C(s\
6ul]e%15UJA85O(85^Qf3&`iK2`EQN0J(M\+B)il/1iD)/2St53@lpA2_HgE1c[6G/29+:0f1UB
2Dcs9/C(gX;e9u#%15UJD..6h/4`/O0fM*Q1c[*I1c@0J/64Vd2)6:QB6#P1/29.>2)[$A1bg^9
2D-aB/2B1E/iYgM1c79E/M].80fM*K2)Hj>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?L2Dm6@;eL,%,!p<m
DImN)E,ol9Df]?'4!7%9D..6h+DGm>@3A9QCghT3GAhM4/0K.MBk(g!D.R-nF!+m6D..'k@j#5l
H>d54+EMXCDIjr&Dfor.+DG^9F)GE%ATKCFA9)*kDf0VI+D#Y)/g:`37s/]`Bju4-/4`Y]2Dd*C
/3#IC0JtC;2BYe7BIlG#0fLgE1G(@?1H$dA/hf481,V$D3&<KQ2`3-<1,^aB3B/uY1+Xt-1H$d[
E+gd3$:nT9@<*ni;BRhP2E*0F3&`NH/C(OD6Y1-d6")<!1b^^F/N,:<1+Y+32DHa<0eb4?2)R?N
2CpF<0J5.?1GCUB/1`?tZ7J@SDCc5(87?(?F`T*);BR\P1bgO:1H.3N/C(^I6$73!/M&J)1G1CA
/2oI>2DR6N1,:C;0eP4;1c.-L/1`?t[k'gfE\%Y,87?@DCb/+T+>tr5/3,[L1b?qW+@1$^/1iD)
/2Ah30e>+8/iPdH1Gq*B1,CO>2DR*D3%QU3cESodEbR'6$:nTHF(&lrBIl\P+>G`42_6^?0JPF9
cFG&`F`K#b/1iD./iG^@2`*-B1cR<I0e>+:/ho7B0eb:46$-pOF!*hgASc'3/C(dW6$73!%15X7
FEqq9/4`Y]0fV0R/2B+=1bgQ,\KF[gBe2PY/2/q;2)Hm=2)R6B1+kO?/3#F<3&NZN2)m-=2(gmC
3B8cJ/4"Ao@<3PYDe3a!/1f)W/5L;#/.DqWAScO$FD5Z7/4`Y]3&`TQ/28k81Gq*B2)-4MAS3PG
/2At<2`3*@0Jk[=2(g^G/2K+>/i,CD2)mBC1,(=>2E3ZP0e>(60f:(K@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*`0e?.4B.P5tAScO$FD5Z7
+DGm>FD,5.9OW$WDBNP0EZcPMFD,5.87cU\ATVWpDB^8I@;]TuEb/ioEcW@FD]j.8AKX?OCijB$
+EVX<@V$[(BOQ!*Ch\'(A0>T(+B*JuFF%M=Cgh3l+CoV8Bl7Q+FD,5.9ke-KCh4_TB4Z-:+q4lM
AU7o=85^Qf0ebO;2E!<I3@rIa+BE2s/3tgA1G^jH/MJk72CpX:1H6p@0Jb=>2`!6D0J"e0/i>XH
3&30=6$-pOF!*hgASc'3/C([T<bZS*%15XEB4kXn/4`/O1,q0N3%Qg>0ebU=?Q`<VFY$lN?S"/h
1H6pD2_I'I2D@!K/2St:2`3?N2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r-@<F+eChI="Bjkm%E,ol9
Df]?'4!7(4B4kXn+DGm>FD,5.DIIBn+E(j7FD,5.D..-r+Dl%>DKK<$DBNt.DJ*N'Bl5&8BOr;b
@;'(i@3@sLF(KB6+DG^9F)Q2CBOu4%+@0gVATDKn/e&.YDf&p"/4`Y]3&WQL/28k70JYX>cF+il
AS3P[/2At;0f:I90JtO81G1L=/2K+:/i,CC2)$g;0eb4>1GL[D1Ft(.cF,9#AS3P'$:o)UDIG(e
5u]F4/Mf@;83p3,:b=I_/70N!EbR(3/70q_1+kF?/2K.91H70G2)-X<1+k==2DI!G/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S#/sBe2_fDJj00BHV87DfBW9@;J"J88iNd@3B9*+D>>&C`mY:+EV:.+E_R4
ATE!5Ebo8/Ao_g,+@^'_DJ<T'D0^5:Des?)GqKO589JfYBQ1l#/4`/O3B/cK3@m$F0fLp??Q_^V
F=^cM?S"/h0JtC92E<BH1cR3G3%QX:1G1[H2)I$F/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QbF=]t$
DIdm1@;[3,Ec5o8F(&lH+@pWm@;'Vt\fc3*F!,C=AKYo'+EV:.+EVgADBNS1A9/l;BQ##&ARf.c
AKZ).AKXooDBNY2+A4(r@q]F$+=L*0Bk(hoW@8ra@<l:!+DlCGBQ%^*B6bV.F!,L7@rHL-FCeu*
Bl5&8BOr;_DfBW2+BEVu/e&.YF`),</4`'+/Pn#S/1b-N87cfm?S#P83%d-F/2B%>/ho4<1c[9A
1bgU:1cR0K2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r!ATB=G89Jf_@<-'jDBNn=DfBW9@;J"J89Jfg
EZfR7F!+m6Ch76jDId0rGp$O5@qB_'DfQt=Afu2/AKXNdDK?q/DIal3BOr;WF`(i#EbSs"+DtV0
Bl@l?+CT.u+C]A0FD,6++E(j79jq[QE\8OF$;##LBl#=k;BRhW1,pgD3&**D/C/ki;e'_s6")<!
2)R9P/M]=@1Ft=73&`BD1H@'C1,1L@0e=n33A*'A1b^jE/1`?uJLj`0D_)>)8Si3gEbSs"/4`/O
3&3HQ2Cp[D0K;!B?Q`$:Be3UB?S",g2DQg<1c$aE1H7-J2_6aA/iPaD2`*9@1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/5/cP/0[Ar@UX.g@;[3,Ec5o8F(&lH+@p3fFDl26@;^-/Cgh?sAScW7@V'@iAThW-
FD,*)+EV:.+@0gQ@;]dfDK?q/Eb-A(ATM?mDId0nFE8RCAfu2/AKXQ\CjC&8@;^-;+CQC7ATDW1
6#:"=DJ<NsF!,FBDfoT,Gp$U*Cht59BOu%%AScO$F"SXG$;#)CBe2eQ+>bu62Cp^G2`*HEcEn]]
Eciob/1iD./iPX=0fUsA2`N]O1,(722)m3I1cRKN2_6L2cEo,iEcioB$;#,TF_PZ./4`/O0f:jG
0ek4=1cIBQ/70McEa^M+/70qd/iGX>1,V'E3Ar]K2E36>1cR*F1c[?I0J"t50f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70qoEa^LqATDp:Bjkm%E,ol9Df]?'4!7+4EHPu3C`mq1F!,C=AKYYpCh=f.Afu2/AKYK$
F`;/.+DG_:DesT.A0>T(+EV:.+EVX4B5(iuCi=K.+EMXCEd8d/@<iu;D]j.8AKXooDBND6+D,&!
Dfp+D:h=ZiG%kB&+Eqj?FCfJ86"4kCBOPa#<affTASc:%@<*t0$;#,W@;[Ve6m+6=3&W`I0f:gI
3%SDZ7W3;i/70r8/3,=C1+Y::/ho:D3&r]E/Mf182`!-B0Jk=90JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
7W3;u,#)K^@<lp.@;[3,Ec5o8F(&lH+A$Hm@;[3)ARTIt+Co1pD/X<&+DG^9FD,5.9jqjHGp$p3
DJ+*#B4W266=FP9F($1cASbe#FX\ja@;Kb&A8,po+EVNEFD,5.F(f9*Bl7Q+De:,#+EMX5E\8OF
$;#,WATD:$F`T*);BRbS1c$[>2Dd?I/70N"9joS)/20(>3&`?E2)@-A2(g^?/28t:/ho7B2DI0B
1c6mD0JPCD1+Y170f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPFrA8-."Df.*X/6,DQ/0[Z'FCfK&EclFGD.R-nF!)YN@V'Y*AS#a%FD,5.Ch77#+sJ.D
DBMV]FD5V8F*)\DALnsEAS,LoEbTE(+EVNEFD,5.F*(i2-Z^DLDf]W7Bl@l3Bl5&8BOr;rDf0W<
ASc0kFD5Z2+B<H'@3A9QC2\,F+q4lNEb0,s/6>,9:b=I_/6>,9:b=I_/70MjATB>//70qg/i5:6
1,Ld>3AifV2)Qp>0J5%81,V!N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"`ZE\(.*Dg#]0Bjkm%E,ol9
Df]?'4!7+8AStp!BlbD*+DbUtA8,po+Cf(nEa`I"ATAo-DBO%7AKYl/G%GJ4<Gl>YEZfI;AKXH_
ARuu_F`'5_@3AKjDfU+GDe:,6BOr;PDI[BlDKI!kEa`irAmodpATDi7@X0(pCi=K.DIjr7EbTW,
EZdhl@;[2d@;KMoTke?b7VQbZ^1Ukp/g*`+AStp!BlbD*+Eqa@@;[3+Afu2/AKYK$F`MRV%15[K
Df0)o/4`/O1,([E3&`BC0K:jI2(W)W7ri`'?S#P82_HpG/2K%A/i,:=2E<`J/Mf=<2`<HM1,LO;
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL7ri`',"H'NDf0--AKYr4DfBW9@;J"J8T\lgA77#3Bl5&8BOr;\
H"Cl)+EVO>B6@c:+Cf>1Eb0<2Df0*,+EVNE@;Ka&FD,*)+DGm>@V&tjFD5?0Cb?n@$;#PPE\'aZ
+>l#12CpdB0ebI9cF"c]Df70m/28t<2)$O92_['>1+k@?/2At8/i#7A2`<HC1,gg>2`*9D2_6L2
cF#2iDf709$;+`9@UWq$85^Qg0JYR<2`WZQ1b?qc+B)cg/4!\q0fCaA0J,">1,pgA/i>=61,La=
3B9&Y3A`9=0f^jC2D@'D3%QU3cFkc-@rEn-$;,#RBQ\#?85^Qc3AW??1H.'I2([%f+@g![/1iD)
/2St=3@lm>1bL^I0f(dJ/2K+82)mEK1c?m9/C)!]7qHNg%15a:AnGIfC2%3lD.+td;BRqQ1b:@:
2_[-@cEeW\ATTIh/2/h91G^O81GL^;1G1OC/2T%53&3?G2DZm?/i#4?3&*<B/1f)Q/43uj/.DqZ
@;K@pF(m0r6m+HF1c.!>1cI0D1+ZcT<b6(u?S!lk1H.'@1c$jE/3#7;1Ft7;1bLOD3ANQL/1i\7
/i#@@1,(O91,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/66=u/5'PlH!tS5E,ol9Df]?'4!7L9AKZ28Eb$:c
@;K@pF(lb6ARTIt+CQC9ATE&=F*)G@DJ()9BPDL'Bl7Q+@rH1+D/LJ7Afu;3DIal(DBO%7AKXBS
DesQ7+DbJ(B6@WqAKYo'+A69`H!r<7$;4fEFa5N/6m+3@2)I0L/2oRE0f^dl+@C09/70r8/2f+<
2_6^@1+kF=2D['A/2B+92`*9K1cR$A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6ZPLE8mu[IDImm#+E2@>
E,Tf+Cc`b4@;U.4+DGm>@3Bc4Eb$;,DBO%7AKX9QDKR(<@;]_#@:s-oA7]XsFD5W*+CQC6F`:o4
DIIX0Ea`c,ASuU(FEo!JDf]u2F)u&5B-;87Bl[p0F^])/ASu("B6c*=$;4fFB.QSO+>kr02(UXG
1bq!@cFP-!BlY=I/M&J)1bLLB/2Aq9/i#1<3AWZH/MSq31,h!J0Jk=3/C(gX<bZS*%15a:Ea``l
/4`/O0f(aE3&iHJ2D[3F/70McE-!R;/29"<2)d*H0JP=63%d-E/2B";/ibXE1G^s@/N>F:1,(OB
3A`9B0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#^lr,#2]n+Bi>bCgh3l+E2@>E,Tf+Cc`b4@<,dl@3B9*
+EV:.+EqaEA0>T(+EV:.+AKe*DfTP7Cgh3oF^\oo+D,P4+CQC3Cgh4'+D#G$ASl-k+EVNE:1\Vl
>%M,Y@;]TuFD,*)+E2@>A9DBnF!+m6@WH0qBQPA8Ea`iuALns9Ch7[$Gp$^>F_PqM+q4lP@<HW6
6$76jEa`cuF"Bj[+>u2<3@m0E0fV$AcF"cnB6#Oh/29+>1bpX=1bpj<0ePCF/2B.B/hf+;3B8lH
/Mf491H73L0fCR6/C(XS;eL,%%15a:F`SZlDfTDtCh[rA85^Qg3AE<@3A<9M2D!.c+B)on/1iD-
3&3HI/M]1=2(UL83&3$?2`<9K3ANKN3%QX:2(g^@0fLd@/1`?t].?lnE\%Y,94;sa+AHEXBjiP`
;BRkW2*!3I3B8lM/C(UF;eL,%/M&V91,1I71-%3G/2Ah:1+Y1>2(gX@3&NBL/1iV;/iYUG0ebF8
/1f)R/5p2%/.DqZ@<Q3q/4`/O0fLsI1bgOA1,q9O/70MuATB>//70qf/hf%31,q'B3AN9E2)$R<
/i#=B1GUa;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p,#/0[Z+@;]dfDBNn=DfBW9@;J"J94<!TBHV#1
+E)./+E(j7FD,5.BOu4&ATJu4Aft#c@;'OeD.RB3+EV:.+D#M+@j#`/ASiQ"Df'H3F(Jl)@X0(m
ATDj+@;[3,De4#57V-UNDg-8:+C\o(G@b?'+?;A>+CT.u+>GQ)0H`_O/g*eqG%G>0BlbD*+C].q
@r$.&Bln#2GA(n;F*VV3Des-/ATJu/F`VY=@q@8:%15a>Bk/bc;BR\M1,UU;3B/iU/C)!c+@U<b
/3tg@1bgjD/MK+>3@m!>1c$[@1G1XA2`WlY/1ie52Dm6L2_lp8/C)!c/4FSn/.DqZBOPae@;KXd
/4`Y]2)@*M/2fLK2`*)2]-'O_Be2P$0f1UF0eG+91,:C;/i>C81,1U<2`EZP2E36>0f(F<2_d!H
2CpC1cFYW.BlYa6$;5)T@;Kmr@4XrI+?2)30e>%51c[NS/C(LC7<*H$5qFcG0f:p@0JtRB/2Jn=
1+Y493%d3K2*!KR/2]%81cIBP2(U:0cESohEHNfA$;5;IBOP@$85^Qf2)[6A2_m9F2_<7[+B;-M
/1iD-1c6sG.lT:=3@lp<0K1O<1,:I?2`<HL2_6mE/ho4@2)$j</1f)P/6,DY/.DqZDe3Wk/4`?/
+>GW32DHa;1-%6I/70MgEbR(3/70q_0J5+</2T(62E*TR3Ai?>1,CO:3&WZL1+Y170f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70qsEbR($F_,T8D]hql@ps6tE,ol9Df]?'4!717ASGQqG@>P8FD,5.GAhM4+D,P4
+EMX5EZf(6+EV:.+DbJ(B6@WqAKYo'+EV:.+B2deX_r&"8T&'QB4Yt!F`S[%AT)O(AKYo'+EV:.
+@BRXBjtO_@;[\,$;5;OF=^Ni/Mo"\:G"CS?Q`$fDCf-G?S!oc/iGI90ek@71H7?K2E36F3%csE
3&!<N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCe4tFDl&2@;[3,Ec5o8F(&lH+A6WeF<G:=+@U?n
Df08tDBNP0EZfI;AKZ)/D.Oi6BOu'(FD,5.;fut#EbTT+F!,17+EV:.+Dl%;DJ=!$+=Lc/GA\i^
%15aHEc,H-BQ%p0F"Bj[+>tr23%R$C3&*<BcE\Q`ATB=f@4X,k1GCR71,1OE/2Ah:3%QgA2_HsF
1c[QU/2Aq41cRKR0ek41/C(OP87cfm%15aK@<sIq;BReT3&W<G0f([I/C(OD6ZR?$/M&J)1+kIB
/29+D/i>XI3&**</M]+71H@?P2*!3RFDPB,+@C'YChYFOcE\ugEcruC$;5M^BOPR*85^Qi1bgp?
0ebRI0fLZ/^*#dSE$-\t@4X/h0Jb[=2Dd3L/2St72CpX?0J5@B2`EKK/2f=;2DR3O2_cj7/C(s\
6Y13f%15d;+B*E%ATD6g/4`Y]1cR<M/2f7=1,CIa+@B1I/1iD)/2]%:1+Y.?0eP4@1,^jE/2T4:
1c-mA2)d';/6OMk<c0Gt$;=lK@<Z-m/4`Y]2DR*D/3#C@3ArG6[3/CXD_*Ik/M&Y01-$m@2)6dA
1b^mJ3%QX;1bLOD1GUaA/1`?t[4G6dD_)>)9P&6^@4Xr8<%Uou1bpUQ5u]F4/Mo46?Q_mb@4Yb:
?S!oe/ho470f([>1GgpE2_cjA/hf:E1,:d>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4b%p/0[T)AS#X"
E,ol9Df]?'4!74.Ec,;.G@>P8FD,5.DIIBn+E(j7@3BApCLnW&DBO%7AKYPmF*(u6DBMbeCi=92
DJj$,ALnsJBOu3q+EV:.+A??eDII*bDBMJqA9)*0+CT.1Bl.^*Ecb`++DlCGBPCsbC`mV0DIkD5
ART+\A0>>m@<6N5Ch\'(A1f!(BOr<-FCB24Ch[I%+DG^9FD,5.@rH7+FCf9)@<?4%DBNk0+@pcg
Ea^RE%15d?F('0(/4`Y]2Dm0J/3#LF3ArG7Kcj<(D_*Ik/M&Y02_Zd<2DQmC3A<HP3@la<2_HjG
2)m<H/1`?uKe-/4D_)>)9PIsIEcb`2/4`Y]2`3TQ/3,XL1H6r2^*#^]Cb.k'0f_*J1+P%<1,pgA
/iPL91-%<H2)[3D0K:UC/i5I@1c7'?1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(s\6#g]l,"u][ATDm$F!,1<+A?3cBl5&*DfQsE
,&Ct&ATDm<+sJW^9PIsIEccRLEb/ioEcW@FD]j+>@qf@f+CT.u+E278Bln'!@;I&uEb/fmDf'PH
+CT.u+CQC5ASl.!A7]d(FD,*)+EV:.Eb-A%Eb-A4AT)O(AKYMpEbT].A0>f&+Dbb$ATDm<+DG^9
FD,5.GAhM<A0>H,ASrW4De*:%/g+,,AKYK$DKBo2Ci!O%Bl@l36#h$]CgeH,AT2[$F(K62F!+n/
+D"toCh4_@+CQC3DfBi8@<*K3H#7#/C`mY.+Dbb$ATDm</g:`39PJ!M/5T8C+@7e<2)d$?1+Z7#
;BS:\1,V!@0et:3+BE2s/1iD)/1iD-3AiEC0et[A0e>%7/iG[E1bgp?1,(F?+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/1iDRBlYauBk(g!
BlbD*+D,=tFD5Z2@;I'/DId<eA0>B&ART\'Eb-A/DJs`:+D,P4+Cf>-FE2;9Ch[d"+E)@8ATAo9
DId<eA0>B&ART\'Eb0;7GA2/4+DkP"Bk&b)$;>/FF)>>:844RT0fUpB1FtFB0f_!??Q`?C@4Yb:
?S"/h0JtC:0Jb==0ebIE0e>1</iPOF2)7*A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/0[brFEVA,
DBNn=DfBW9@;J"J9PJ'ZD.+Q(ARTIt+D,FuD.P7@@;]TuBlkJ3F!,R<AKYl!D.Oi.AftM)@q]:k
@:OCjEZet7Df$V=BOr;[@<?[,@;[3,De3c.;flGWF`Lo'F!,UC+A?K\F)>><+q4lQBl%Kt+@:!e
ARR,\;BRqS1b:@;0K(X:1H?RDEbR'V/1iD0/i>C81bgUC2`EKL2CpUD/i#7B0ekO:9OW$WDCd=p
3@mI:Be3"n@rH0lF"L((F_Pn>A7ZlW@:N_[Ci!Z*Bl5%J2`3N'$;>/PDK9Z*CFi"E+>PZ,2`EHB
0ek@A0f(@f+@1!f/70r8/2o1>0J#"92D-pH1,psB/1iS8/i#=@2DmBD1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/4"8r/4a\sB-9icDJ()2Ec5o8F(&lH+A?KfDBMhq@r!3$F!+m6Ch[g*/TYT6E+NQ&E+NHn
+E)F7EboZ4CM@[!+@pEgB-9icDJ()#DIal(F!+m6@s)U0F`Lo,+EMgF@W-'*GA2/4+Co%pE$014
F)Y]#F<G19Df$V=BOr<&De!3l+Cf>,D09`1FEoJJ$;>SPBl%L$@Wc^)F^lsn6m+<D1Gpj;1GCdH
0J$QR6$73!?S#P82_I'M/3,XA0f^pE2DZm?3%d3L1-%6J/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Kc
E\&D.Fa.J7@W-C0B4Z*+E,ol9Df]?'4!7L9AKXZh@qfanDIRa/BQ[f-AoD^3Eb0<5+Eq78+C]J-
Cige6DBLqt1E^.P+EV:.+D,P7DId=!+E(j79QbSkD.7F+Eb?pG6Z7*bF<FLrAS5UqBk:g-+q4lQ
F`V8=_kM$_@4Xr;+>br62)6^=0KCgE/70MoDf.+5/70qf/ho%23B&QH0JkdJ2CpR:/ib^D3&r]E
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/5:&#/5U8*FEM5=ATME*E,ol9Df]?'4!74>F(oa6U2F[R+DGm>
FD,5.@;]RhASuT4DIIBn+E(j7FD,5.G@bi;ATDZ2Eb/ltDf-\9Afu2/AKXQRATDKp+AcWeBl8!7
CgeH1BOu3q+EV:.+A?p!Blmd$Bjkm%E+Ns,Ch4`*Bm+&u+CT.u+EqL1Eb-A1Df^"CDe:,/De*F"
DCoC-Gp#q%EccG:@;I'#F!,O<FEM#6ARmD&$;Fr;F*VUR85^Qg2)7'@3&NTS1G$h`+@p'a/1iD)
/2St90e>(<1+kIE1c@*I/2B+90ek@?1c6g8/C(jY87cfm%15g<@rH6qD_+FI+?;533&<*C1,UgA
/70McDKIF:/70qf/i,140fCa=0K;!G1c?m:1G^X@2`EEG1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qo
DKIEsDes?/@VK7g+E2@>E,Tf+Cc`b6@:O4nA8`T)F!,R<AKYi8FD,Au@;I'0Bl%ToB4W3(Afu2/
AKYl/G%GJ4:Ms_d89Jf\Eb/c(=_2#^F!,C5+B*2pBlnK.AKWBgBk;0)@Df?gF!,")+EMI;ARo4[
.3N_GAKYK!@<6L(@j#Z-G%GJ4@X0(d@:F7kAS`JZ@<,kqX^N>H@<-@1AU5sO9jqOMDIdZ.BlbD*
+D,=tFD5Z2@;I'*Cgggb+EqL1Eb-A1@:s:a+CT.u+ED%%Ch\!:+CT;%+Dkh;ARmD&$;FrAD_+FI
+>Yc10fU^>1b^U>/70Me@;RQ&/70qd/i5@82`E?G0JbC:0J#+B/iGLG1b^a;1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/43i_/4X8lD..<)E,ol9Df]?'4!77+B5\o,F!+m6:186YDf0!"+AcKeCER>/+@UBc
Bl@s)@3BH+FCeu*AoD]4BlnD=B5)BpAnGUq/g+,,AKZ&9@<*K!CiaM;BOPk!ASuQ3FDi:2AKY])
+EV:.+Cf>-F*(u0CghF"Df-\9AfsHLD.RO%E+*ctBlbCFFD,5.B5)BpAnGU'/e&.^@;'(jBl,Cl
;BR_K3Ai?C3&<NJ/C(aJ6$73!5qF]I2*!TG1H.$E/2Ah92(U^I/ib^A1-%*@1H-pA0etUG2(U:0
cF>DkF`K#B$;FrBF('0)/4`/O0f:^D3&)sD1,_!E/70MqE+ge0/70qf/i,I<1,Uj?1c$jD3A`9A
0ePIF1H.-M/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"ulBIlGqATD6gBkh'oBcqA8DfBW9@;J"J9jq^V
@<?3+7q$:M@<Q?--o!D83T>RQ0ekOG.3N>G+E)./+E(j7FD,5.@WH0qBQRg,F<GX<Bl7X&B-;8;
@<-E3De:+XH=_,+@;0IbDJ:54De4$2GqL4<BOr<1@<3Q4@;06pFDi:8@<Q3)@<6L.@qf@nARlp-
Bln#2@W-@%+AZi_EZe"g@<m-,D'38)A0=W]H=:Z)+CT.u+Eq78+EqC5C`m;"F^nj%ARlolDIal3
@;KLmFCeu*@;]TuE,8s.ARlp$F_t]1Dfp+DD09o6@ps0rBl8!6Ecl51DKKqP%15g<BjiP`;BR\K
1c[*A2`3NM/2An%<+0o#/M&S31c76C1,LaA/2Jn<2_6gE/i5FD2E<WG1,LU>2E*QP0e=k,1,(7Y
@<F+1$;FrFD/X2@=$]b]/MfC<=$]b]/MfC<<];fi+BE2s/70q_1bq'I/MJt92_6[</iYjB1,1^?
1GUjI1GC@31G1L@1c6sA/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><];fi/66J*/4"<!@UX-sE,ol9Df]?'
4!77+Ci+*++DGm>@;[3%DIdHoASuF/F!,@/D.Oi&Bm+'*+EVNE@3B#j@:NsnBl5%ZEcki"+EqOA
BHU_+DIIR+Dg*=F@;]V$+EMXFATVEq+EV:*F<G:8FCfK5F`;GD+EV:.+Dbb/ATMs3DIjr!DIal1
De!R.+EV18Ea`Hh+CT))DJ()6BOr;rDdd^//g*`-F!,O;@;KauG9CC3ARTU%6Xb"L@U`nWDBO.3
FCfK6+DkP&AKY]/+CQC3DfBi8@<*K3DJsQ2ASc0sDJ()5E,ThN%15g<Eb9$$/4`Y]2DI$K/3#=C
3&<,2]-'mgBIlG#0fCgA3@cd<2*!3D/iYU;1,LpB2_m?L2)?d</ibmI3&ilK/1f)Y/5L4u/.Dq\
@<--l@Ot&J+?2;>0e>%61H@?L/C(LC:h=8j/M&J)1+kCD/2K+@/ho@?1,:X:0f:R=0JtUD2_6L2
cESosAS3P'$;FrLCLps+85^Qd2`!9A1c79M0eCV]+BE&i/1iD)/2Ah72_6[?0J54<3&E<J/1i_:
/hf"62E!KF/1f)X/66=u/.Dq\@<-F'@k:/K+>to-3%R!K0JkR:cFP,hATB=f/29%:3&)p<2_[$=
2(gR:/2B%;/hf">3&NWG0fL^=1c@?R0J"b+cFPPtATB=2$;FrN@<*ni;BRqW2)$R90etI@3%W@a
+AcW^/4!\q1,:[B0Inq50f(@9/ib^=1Ggd<2`39H2`WEF0J5+90etRB/1`?t[k(?eB.OK!9jr?V
@;K@d/4`'+/Pn#S0e>j]<%Uou1,1=e+B;-E/70r8/28k32_lp=2_cp?2`*NO0e>.9/hf%>3Ar]F
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/0[f,DJ*m(Bjkm%E,ol9Df]?'4!77+H=:5u@;-iuF!,R<
AKX]cDJ*m(Bjkm%DIIBn+D,P4+EV:.+D#G$@;]^hEb/c(7rMjN+C\njEZfFG@WQL"@qfLq+=L61
F*2OH@<,k"Df[%6DdmElDKBN5.3NP@+EV:.+@g?ZBcofTF(KB6+ED%+Bl@l3De:+dDf03+Ch[</
+CT.u+EV:.+DtV)AKYo'+EV:.+D,>.F*&O!Df03+Ch[<q+ELt5ASc0sFCd'K%15g@@WQ[6@4XrI
+>Pc41Ft=;1,Lm?cF"cbASitM/2/t=1H?s@2)%!@1G1@>/28h4/ibmI0JYO;1,U[=1GLU>2_6L2
cF#2nASit-$;G)EEb0PJ85^Qe2E!6?2*!TS1b?qZ+B;-E/1iD-1,1XC.lB7>1+Y461GUL93&<0H
2)[<G1FtCB/hf(:2DI'?/1f)R/6,DQ/.Dq\ASH4,@4XrI+>Gi73@lpD1,(X<cFY2pEbQXI5qF]I
1Gpm;0KD!K/2Jn73@m-G/iPaH1cRBE3A*<J1bgjG/1`?t].?`uBe0]#9kA*LF_"o385^Qc2Dm0>
1GgdF3%W@`+@g![/4!\q0K1[B0e5"51GgX>/hf"20ebL<0JYRB0f:L;0J54A0JYXG/1`?t[Oap[
D(H,'9kA-PE+gdn;BRbP1-$mB1,UpI/C(XG6Z-Bb6");u3&E<H.ks%?1FtF:1-$m?1GCF90etUC
1b:@A/i>IB3&!?D/1f)S/44;b/.Dq\ASu9lCh[cqDCe=V+>PW13%QgE1H$p<cE\QYF`K$!@4X)i
2*!NE1c.'K/28b;0J#1D/iYgG0fM*D1c-gF1cI6I1Ft(.cE\ueF`K#B$;G)LCLM6785^Qj0ek46
1bgdD/C(LC6Y1?j/M&J)1+kF@/2T4:2)[HS3&N6D/hf7F2`!BD/1f)O/43uj/.Dq\ASu9pDKIF#
;BRhP3&iHI3&rcN/C(aJ6Y1-d/M&V50K(jA1H%!D/2Ah32CpU<0eP@C0K(XE/1iY9/i,CG3AicI
/1f)V/43ud/.Dq\ASu9t@Ot&J+>GW,3%QdD2DI$>cFtDtATB=R/2/k;3A;s>2)I6C1G1[I/2]F?
2`*6E2)?d>2(ggJ0ebC=/1`?t^+<)lE\%Y,9kA?RCFi"S+>bi62(UU@3AE3=cE\QmD.+tI/1iD.
/i,=80fCmA1c@$D0f^dB2D-dF1,LaE/1`?tZ7K!M@4Vip9kA?X@4XrI+>l#41FtI?1cREF1H6LD
Df6aL/M&J)2(ggG/2At9/i,7A2`WTD1c?s@0fCd@2CpC11H6pPDf709$;G)PBk1pdDIG(e;BRnR
2)HjE1bg^A/C(LC6ZPID/M&J)1bLL;/2B1D/i,CF0K;!B/Mf=<3A<9H2`!!9/C(LO6ZPID%15g@
Ec5o./4`Y]0ekOD/29(A0K:U=1E]Y*FY#ge/2/k:2DZj=1Gq*B1bLL>/2]=<2)m<J2)6^<1G1[E
3&<BN/1`>-1FuL6FY!t/9kABSEcbu/D(J4U+>ku6/3#UF1+^_W0d&c&Be2P$0JPF@2(LCA0fU^@
/iPX=1,pmB3&3?L0J"q=/i#FC3&NHB/1f)Q0e>V2Be0]#9ke$TCgggfA9DrE85^Qd2E3QF1c7$E
3%W@\+@BRX/1iD)/28b82_6[>3%csH3B8cO/1ib?/iPLD1,([=/1f)P/43id/.Dq\Bl.d0@4XrI
+>c&81FtF>1c$s>cE\Q[Eciob/28n:2`E<G3A`HA0eP4=/29.>/ib^A1,^p>/N#O@2E3ZT2Dcs9
/C(OP6ZR<#%15gDDI[?oE\'aZ+>Yi/3%QmA1b^[9c\!?2H!r6U/1iD0/i5F:0etaA2E3]Q1,CI;
/i,==1c%$@/1f,"/4b%p/.Dq\Bl7Ku@<Ha%/4`Y]1c[9E/2f:<3A<#0ZliC`E\&dn0etUD2CgI;
1,LO</i,L=0f_$B3A<-H2E<<E/i,LH1cI*>/1f)R/66J*/.Dq\Bl8$$CLJbb;BR\R2)6^<2*!HH
/C(UF:NC/#6");u2)@!A/MJk53%Qg;1,UUB1G1@80fCpK/1iP.1-%?K3Ai?=/C(UR:NC/#%15gD
Ea^Li;BRkW0e>%53&3BCcG(JhATTIh@4X)f0f_$A0JYLG/2f+;2_6aA/iYXF2DI-A/M\q=2`EWO
0J"b+cG(ntATTI4$;G5T@:Nt%85^Qd1H-jB1c.-BcE\QYDIb:M/2/e43B&HE2)@0B1+k7>/29(9
1c$pA0f(@:2(gdB0Jt^H/1`?tZ7J:ZA1S/s9keWVD(J4U+?2/6/28q92E385[ieLYE\'L-0JYL>
2_-aC2)Hj?/iP^?1bp[A2`*9D2_6gD/iYjK1c[KG/1f)U/5Tnu/.Dq\Bl[foCFi"S+>GQ)2_6[@
3&WQDcESKgATB=R/2/k81c$X=3AiQC0ePCF/2].70K:aF0KC[@3A*9L0ekUI/1`?tYq/^_E\%Y,
9keWo@;RPd;BR_M3A`9C0JbI@/C(OD6Z$6_/M&S61,:d?0fLsK/28b;3%R'I/iGXF3AWZH/MT1:
3AiZS0f^d9/C(OP6VUu?%15gDF(&o:85^Qj1bgO91c@6O/C(gL:h=Yu6");u1GCgH.l9(?0e>+5
2`WEG2_HmF1b^aG/2T193&NWP1bgO4/C(gX:h=Yu%15gDH=:hF85^Qf0Jt[<2Dm9L3%W@`+B;-E
/4!\q0f(R@3@csD2)[!@/i#461,(C73B/`M1-$mC1bLdD2)@-G/1`?t[ObEQ@4Vip9lFiYDg#]#
DKRL4:G":P=ALM'/70MeE^D<a/70q_0eP4@/2B%9/i>IG1H$p<1,pm@2E<WQ0e>(60f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70qqE^D<TDf&p#Bjkm%E,ol9Df]?'4!779Ch.I-ARTJ!+DGm>FD,5.BPD*mATMr9
E+NHn+DG^9;K$D\DJ<N%De:,6BOr;U`.M^@K5tDAR36?bF`);0Bl5&6@;]^h+EqOABHU`$+CT).
BlnK.AKYo'+>Pf21a$XHFE1r6/e&.^Df0Z>DJq(-5uUT32`WEj5uUT32`WEr+@U<b/70r8/28h2
0K(I?2D-dE0KCgC/1iY3/iGC;1c.-B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/0[o!DIIBjDJ<Ns
+E2@>E,Tf+Cc`b6Df0Z>DJpY3F!,R<AKZ)8@:X(oBl@ltC`m5+F*)PAAKZ).AKYhuDBO.7@<-E3
Bl5&8BOr=GJ=K&E+Ad2uFDp/hSLbml+AcKa@;TFjBjkm%A79@cAKY])+EqL5@qZun+DkP)+CT.u
+Eqa@@;[2u@;]Rd+EVNEFD,5.F)Q2=A0>f&+CoM8D0%<R%15gJEaa-"/6>,9:b=RZ/6>,9:b=RZ
/70MrAS3Q$/70q_1+k:@/2K.A/iGUG2)[0?1GLL:2)RBM2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)
AS3PmATD6o@;[3,Ec5o8F(&lH+AHcp@<Q'%BlbD=BOr<&Df03!F*&OFBm+'.+EMgLFCf;3Bl5%l
ATD6o@4hur9lG&d@;%2_5u]F4/M]+583p3,:b=FY/70MfAS`o)/70q_1+k@</2Jt</ho+;3&ETG
0fCXC2DR!G0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qrAS`no@;KLrFD5W,@;[3,Ec5o8F(&lH+AHcp
BjkZtBlbD*DBNA*@qfLlF<GI0D.Oi%DfQtBBOr<'Dfor>@;0U%GA2/4Bl5&8BOr;^Ch+YUBlnVC
De:+aATDp7@;KLl/e&.^DffZ$Ci!Nn/4`Y]2)I-@3&`iU/C(LC<,u\(/M&S12)?s;1-%-J/2Jn8
1+Y1?/i#@>1c6s<1-$sE2`NcP2CpC1cESp"EbR'6$;GG]BQ&$2/4`/O1GCdG2CpU=1c[9A?Q_dX
Be3UB?S",g3AE'D1+kFC1c-sD/1iV6/i,CF3&EEB1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/0[E'
EbfB,@3A$JF)N1?Ec5o8F(&lH+AHcsBQ&$2/0JA;F)N12@;KakA0=okCij).:2aieALns<F!,R<
AKYetEbAs)F<GU<G%G\:Bl5%[F`M83DIFYW@<6?0@;]TuE,8s.F!+n/+DG\3DfTr.DKI"ADeru-
Bl5&8BOr<&Bm+'/+E(j7FD,5.E+Ns,Ch4`'DBO%7AKYE%ARTX&BlkJ:@<6L$F!,R<Ec6)5BJ(J<
$;GJRDJ*l==$]b]/N5C8=$]b]/N5C8?Q_^IF=^cM?S!oc/iPI81-$sB2D[-H0J"n12`3QS2)Qp?
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j<+0Zj@;]dfDBNn=DfBW9@;J"J9lOfaB5\o,F!+m6AmoOp
F`S[IEb/f)FD,*)+D5_5GB4m@DBO"=F`_;.Ec*"!@;^C"DJ<N%@;]TuE,ol-F^o!(+D###DL!@K
Df9//F`V,)+D,P4+Dl7BBk(Rf+DG_7FE2M@ASuU2+CT.u+CfP7BlA&F%15gPCh[j%ASH$585^Qc
2DmEE1GgdB2([%Z+@Ak3/1iD)/2St60e>%52(gmF3AiZN/1iS6/iGLA1,q0C/1f)Q/43-?/.Dq\
F`;#7Bk/bc;BRhP1Gp^A2`WWP/C(^I6>pcn6")<!1Gq!J.ks"=1b:C72E36C0K:[C2_d$F0e>%=
/i,LH2_d6B/1f)U/4+8n/.Dq\F`V&,A77#[;BRbO1,CI<0fLdC/C)!Q<D?mQ5qF]L1GCU82D?sD
/2Jn72(UI;2_HsG2DHsH/2f172_d9H2_ZdKCi*TnATMr90f:[C/1f)]/6,DQ/0[DhH"D"=-o!V6
1FXFj,&(p;DIIU)/0JD1EaiHtBlbD6F`V&,A77)7+s8H[@<?U3Bju4,ARlp*D]g5J6=FnD@<-'j
DK@!G+q4lRF`V8,@4XrI+?2&20J"q41GppH/29+,6tL0c/M&Y22)mEC0ebI=/2]%:3%Qj?1bL[?
3&!3L/28h23&<QM3&W<C0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(F?ARoLsBl@l?0fU^PAS`nk@<?4$+D,P4+=D#KF(o,3+=M>FAKYE!@qfLlF<F(o
AS#X"D09o6@qf@h+@1$^Df-qD+Dbb(AKZ2*F!,O4G%G2,@<<W5ARQ]jGp$X9CiF'%DK?pKA7]Rr
BPD@,F"&5?AoqU)+CTA6Ea`I"Bl7Q+FD,6"EZee4FCf?3Bl@l3@X0)8CghU'DJ()*BlbD4Bln#s
Ea^C+$;GYaE+Nj!ASH!483p3,:b=F_/4`'+/Pn#S3@nM[:h=Yu?S!ld0etU:2)-pH/28k33&rNG
1G1C<0ekR?/2].72`E]T2E*0B0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:h=Yu,",jWBldr1E,ol9Df]?'
4!77?F)Y],BOtmp+DGm>FD,5.:2b/oAKYi8FD,T/DeEco@;I',ARTCl+E(j7Anc9s/g+,,AKYT!
EcZ=FB5_=%+E_a:A0>u-AKZ&5@<-.)+E(j79m(MrASc$kBl+u7D]iY1Ebuq@BOr<-F`&`QD/X?1
/0JnJ@;]XuF"AGBDIal2FCB32/g:`39uEZFDeO8E=$]b]/N,.]5uUT32Cr2X6#gof/70r8/28n4
0fCR=1cR*B2)d9H2_6O91+kID1H@?O/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_E\&D&Df'3+Bk(Rh
+AuciF^f0$@j#`2DfBW9@;J"J9uEZFDeO89FD,5.B5_<'De:,&Ec6)5BQPA2F!,R<AKYr4DffQ#
FDl1BDe:,6BOr;bF`&=1DIal(F!,%3B6%F(ARlolF<G!7BPD*mATAo4Df]W7Bl@l3Df-\>BOr<-
FCAuoB5M@)AKZ).@;[2SDeX)tH"Ce7Bl5&8BOr;TC`lPsASuU$+Cei'ALnsJBOu3q+EV:.+B*E#
+DkP&ATJu.FE8RK@<iu+Dg-(AAThX*Gp"js+@KdNASkmfE\8OF$;JFHDI[?2844RT1GCU?1+Y@>
1G_$B?Q`B`E\(QK0f1^G2(^L90fLXC/hf+51,:R:3&ifP2DHa70J5+?0f1gG/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S#5lE\(.5Ble><E,ol9Df]?'4!788[VfSg+DGm>Df0,/De:,6BOr<*Ec5f/DIm^-
+E1n#CNCV:Afu2/AKX<NEc,H0AKX9TE-!.9DBMl%BlnZ4Ebo0%A1e;u:17gR/4`Y]1H%!I/2T1D
1c?o1^*#d\@k9ns0KCgI1b1=:0Jb7;/iPI80f(a@1G_$M1,:C91+k7;2)I-J/1`?t^+;Wh@k8&r
:17sMA8*Sr5uUT32DQgb5uUT32DQgj+@L-g/70r8/28h20et:>2_Hg@3B9#T/1ib9/ibmN1c-p<
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/4=Ds/0\#2F`_:>6"Y.O@ps6tE,ol9Df]?'4!7:,Ch7-k+Dk[u
DK?qAFCB24Bl5&8BOr;bATMd3BQ#FE;e8pLG@>At+CT.u+B)iJARoKtCgh3oF^\ooF!+n/A0>T-
+EVmJBk(RfCj@.9Bm+'*+CT=6@3BGrD.Oi3D]i\,Eboe>Bl5&8BOr<"DfB81FD,*)+EV:.Gp%<F
Cht5'EbTE(+Dbb)BQPdJC2\A?@;]TuE+NHfAKZ)5+EV:.BlY>+Df'?6DJ=3,ATKIJ%15j=Df[I#
;BRbM2Dm$A3A`KO/C([H:j$_./M&J)1+k=:/28n6/iYjL0JbF7/Mo.60JG:;1cR$;/C([T:j$_.
%15j=F(f9.@4XrI+?2,83%Qd<2E<`S/C(RE6Xapb5qFT=1G1RG/2K%=/hf%92`!<B/MT.92E!<H
0K:U7/C(RQ6Xapb%15j=FCB6(@4Xr;+?2573A<!@3&39I/70N#AS`J??S!lk2)$^91c[BO/3#7>
1b:@<2_HsB0JkI?/1i\=/iPdE1,_$A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/66=u/6ZJ!@VK7g+E2@>
E,Tf+Cc`b7@<>q!BON$#ARTIt+EV:*DJLA?Dfm1:DBNe)DL!@@@;]_#@:s.m+E(j7>%)8WBjiV'
$;P/JCLM6785^Qf2D?m;2`!<K2([%Y+@:!b/1iD)/2Jn83@lp@2(g^F2Dm3C/2T%51H@-H2E*0<
/C(OP6>pcn%15jAD.7X//4`Y]1c@0A2`<?K/2].)6#L3a/M&J)1G1OF/2B%71c[NM2)Hj@3%d*E
3&33F/9PiGDJs`:/1`Y5/4"/a/4+8cAKWBU3&!'9%15jADK0f1/4`/O2Dd3H/2]+=1b;uV:hXDk
?S#P82_I$E/29%80fCsG3AW3<1H@'E3&iZJ3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)BOr_`@s)3j
DfTQ#DBNn=DfBW9@;J"J:1\<_F_)\4ARTIt+EV:.+B*E#+DG^9FD,5.Cgh3oF^\oo+EML?CLqB+
@X0)<BOr;XDIdHoASuF/F!+OmDfT9(BcqM<BjtXp+E(j7FD,5.6#C%VDf-\<AS5^qDK?q=AfsNP
F^\g!EX`@NATDs.@4Xr;+>c):2`*'A1-%'I/70McF`K$!/2/t>0f:I<0JtU:3%cp>/28h6/iYdK
0f:[:1b^OA2E*QP2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoF`K#W6=jtGBjkm%E,ol9Df]?'4!7:0
Ecu/*/0JA3@;p="A0>K)Df$UlATDs.Be1BN@<3Q"+E2@>D/!m!DKI!fASc!n@;[2TAScI&@j#l6
BjtX++q4lSBkUpk/4`Y]0fUpK/2B(@0K(K-Z62hPE%F:+0JtUF1+b781c?m?/iYR:3&3*?2DI!E
2CpF80J5:A3A`QI/1`?tZ7J[\E%DG*:2+KPGA2=R844RT1H%'E3%R!F3ArTC?Q_[RD_,6H?S",g
3&iHE1-$sG2`3NP0J#%8/iPRB1,(U;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4+8n/43i`@:X(\DBNn=
DfBW9@;J"J:2+KPGA2=FBlbD=BOr<1DfTA2AoD]4D/XN0ATAo-DBO%7AKXQ^A8,[fDJsZ=+@C0\
AKYetDJ+*#B4W3(AfsHLDII'a/e&._Df]?3@4Xr;+>c&52Dm$A0fV0N/70MrF`8m=/70qf/hf.6
0eb:60JGF?3ArE?1cR*F1bh!J2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F`8lU6#pULDKKT1Bjkm%
E,ol9Df]?'4!7::F('<%+Dk[uDK?qAE,oZ1B-:o++EV:.+AHcoDeX;9Cgh3oF^\oo/g+,,AKZ28
Eb$;&Df'',+D,Y4D'370@rH3nBl7@$Bl@l3De:,0Df]?#F_,&6+EqL5@q[!%ARTIt+ED%2ATo[J
@;]Tu_m*WYG[W-GGA(]#BHV/'@;^-/H"CE)/g:`3:3CGiBe2eQ+?)#10e>=?3&NQEc\!?=B6#Oh
@4X,m2)R0A1,^jH/2Ah32(ULB1G1XA2D[6F/1iV8/i#FF2_m3@/1f,"/5p2%/.Dq]F`Uu,@;[Ve
;BRhU1cHsE2)[HP/C(OD6ZPLE5qF`J1,h0C1-%$H/2Jn:2CpU>0ePID2_m*B/2B4<0ebIC3B8WA
/C(OP6ZPLE%15jQF(eup@;@Db6m+3C0f:j?0f(OE1+ZcT6Xb$e?S#P83%cpE/2T+71c%!F2DHaA
0ePCB1GUa@/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QQF"AM$D.Ra%@ps6tE,ol9Df]?'4!7:@F(eup
@;@!"F!+m6Eb/ltDf0!"+ED1>ATAo2ARTU%6tpIODJ*WkD(HeqCghC#@4WOFBPCsi+DGm>AmoOp
F`S[;DfQt7FE8RKBl%<&F(&m%Df-\>BOQ!*F*2PG@;0U%Ci<flC`l;eA8,[fDJsZ=+Cf>,D09`1
FD5<-/g:`3:3g8bBk;05=$]b]/MT+6/70MeASs&+/28q<2)d*C1,1I60eb4?0e>(63%d3H2`WcT
/1iY5/ho4D2DI'?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ud/4k#'Ed8cpDdd^/+E2@>E,Tf+Cc`b7
H!tQ(ASrW2AS,LoF!,RC+EV:.+EM[EEb0*!+CfG'@<?F.+Co%tFEo!IAfsBT@;[3)H$!_<Ci<s3
/e&.__kD-nBe2eC+>u2>3&iHG0K(mL/70N"9joS[/70qf/i#+30etR<2*!EJ3&W<G0eP:@0K1aA
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4Y/lEd))-Bjkm%E,ol9Df]?'4!8BO@;^-/-ZaB<E[MuD
DBO%7AKXphTl"KdCgh3oF^\oo/e&.`B5M'.844RT1c[6F2CpgA3&<NF/KdSqE\&dn/M&k60fCR<
1cI$F1,Ca@3@lsG/i,=C1GLU81,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>492.^<4FD5Z2/1iDDATB=G:M4NQ+Eq78+CQC'ASH73+E(j7ASc:)F_,H#
ALnsJEbTW0DJ(LC@;]TuB6%QlF<GO9H#m\0@;I'-FE1r1B67f0Bl5&8BOr;RAScI&@j#W6FD,T/
DeEcqF!,C5+A$TbCgh3l+CT.u+B)cgFDPB'A1Sj3DIal,@<iu)AKZ#)CghEsA0>u4+EV:.+@fjV
Ci:n'Df&p#+Co%tFEnuQ,#;igBlA&:+tb&K$;YGG@Ot&J+?)&32(UaD2`*HEcF+i]EGR0l/29.=
2)Hg<1Gpp=1+kRI/2B1C/i,@?2)@$>0f(FA2D[0K2_6L2cF,8iEGR08$;b/FCLM@!@;KL+85^Qg
0fCm?3&*0H2D!1-+B)cg/3tgA2D[3N/M]:?1Ft:63&3$?1cR*J2_[-G2_6O93%cs@2D?jE/4a2n
@;0F'Bjkm1/C/u#;e'_s,!g?'BOPIgALnrp`JnZPX"E=]R!!4R+CT.u+AcK\CLM@!@;KKt@<,p%
A8bt#D.RU,ARlolF!,R<Eb/f)F*(i2F!,17+CQC/Bl7K5+EDUBDJ=!$+D,Y4D'3_7Ecbt;FDi:C
Dfp/8/g+,;D]it1+EV:.+Dl%<F<GU8Ch[<eCh4`1Dfp)1ATQj]PYGS,Gp#q+CN\WeQt[[ODIakf
F^fV=8oJB\F)PsUJ<XM]FD)e2A7]Y#BkDW58B$R(`N(TMJ=(Iq@3B!"+@0me@<,q#+=PO?+B)cg
.4cTcBPCsi+DkP&ATJt[FY.98ASbp#6#:FQH!te;.*mMg;e'_p+CT.u+AcK\CLM@!@;KKtc\*E>
@rEtD%15p?Ecl58AT',$5uUT31GUL4?Q`0d@k:t<?S!od/i>I:1G1[G0fD$P/28b40JG=?0e>(6
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70r)F(6aF;e^,^@;p.*ARTI!E,ol9Df]?'4!7@.Ecl58AT&]*F!+m6
9OW$WDBO%4Ebuq2DfQt:BlnH5AKYf'Df.*KF*VV3Des-/Bl7Q+;e^,^@;p.*ALDOAF*)GFB4l$l
+D,P4+DG_(AT23uA7]XgAM,/9$;b;B@rGjm/4`Y]2`E`N/28h42`3<@cESKg@<O1f@4X/f1,UsA
2)[9J/28b;1b:F:2D-g@0f^pE/1i_;/iPRD0KCg<7;caSBldr=/C(LO:gnMu8T&]_DKKH#+D,P4
+B3#c+@0^^+@0g\@;]L`+E(j7FD,5.8514%@<H[+@ps0r6#:CHDII#t:M+3Q@q?)V:h=`h@4YJG
;c#&*0J"b^+@1!`/70q`0JP=A/MJq63@lm>/iYgA1GCU;0fCsH2_lp91+k:<1bpg?/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"K_Cb/1sEb&TrBjkm%E,ol9Df]?'4!7@2FE1e4BlbD*+D>J1FDl26@ps0r
@;]Tu@<,jk@:a@nDeEco@;I&rBlnVCBl5&7Dfp/8ATDZ28oJ`\@;[2rDIaku+B;0*;aX>'=)W+q
A0=ESEbTW(B4W3,Blmo=%15pF@:OC185^Qb3Ai]G1,_$H1b?qW+@C'`/1iD,2)@6N/Mf4;1b:C7
2Dm$F1bLdC1,:^D/1iY7/hf4@0ek@5/1f)O/44>l/.Dq_BOt[a@4XrI+>br51b:LD0JG44cEeWn
9joS=@4X,f2)@3B2)@'E/2Ah70e>%<3%d$F2`<TT/2]492E<TQ2)m-</C(RQ<D?mQ%15pFATDQp
A1U8L+>l)62(U[D0KD'CcEeWn9kc.1/1iD//het11,CU:0fUpC2)$R?0ePFA1b^XC/1`?tZRf*N
Be0]#:hXcYDJ<Tp@4Xr;+>Gl31,^p>3B9#Q0e??[2_[$16#g]l?S!rd0f1R90JG@>/2o1?3@ls?
1G1LE3AWNN/1iP.3&WZS3&)s>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?H2_[$=6#g]l9P%[ADImm#+E2@>
E,Tf+Cc`b9BQ%I"Bk(jc+Eq78+CT.1@;]RhASuT4FD,*!@<6L.@rc""Bk&8qBm+3,Bld^)Bl@l3
De:,6BOr;\ARoLsATDg"DIm6o+EV:*F<GLBBkM-t@<?'k+D,Y4D'3q6AKYE%ARQ^"Aftr/A7]e!
/S&:8+A??U@;^"$/e&.aBjl.+Df[I#;BRbN2E36E0K;$H/C(jM6Z-Bb/M&J)2(gmE/28n;/ho.<
3A<0=1,LU;1,:X?0e=k,cFYVpDIY4,$;bGS@rHX$/4`/O0fCjH0Jk=?3&E?H/70MuB6#P1/70qg
/iGU=1,gm>2`E]U3&iH@1,pmD2D@$H2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,B6#OjBPD9o@;[3,
Ec5o8F(&lH+Acci@rHX$+DGm>@3B/nD..6l+Eq79ATAo7E+s?,F<G19Df$V<Dfp/8ATDZ26YL1M
ARTI!D0^5:Des?)Gp%<ED]ib8+ELt*A0>u4+C]A*DJ()&Ec6/>ARlp)@;0OrEcW@FD]j.8AKX?K
Ch7a!BOr<-D]j.8@<<W6BOuH3@ps6tCh\'(+DG^9FD,5.@:jUmEboH%AM+E!:hal_EbTB!/4`Y]
2DR-F/3#CB1c6i0]J:U.@rEna/29%?1,CL<3&!'<1G1OC/2B(=/hf7@3AWZH/Mf@=0JPLD1Gp^_
@;'@sBjkm1/C(m`/5p%s/0[Z'+B2c_Bln&?+CQC7Ea`KmFD5Z2@;I'-FDl2F+DGm>FDku++E(j7
@3B$"DffZ(EZee.A0>r-F*(u6/0Jh=D.R6#:hal_EbQY)DIakfAS?3p/0K.MD]iY.AS!!+BOtmu
+E1b0ASuU2+DG_8D]j.8AKZ&0Gp$O5A0>>m@rH3q+EMX5EcWiU<+oiWEZf=0Eb0-1F!+t$Cht59
BOu$':hal_EbQY5@3Bc-Bl%?'@q]:lBl7Q+FD,6&+DG_8D]j.8AKZ&0Grd'b@3?a<GA2/4/0JA=
A0N3?BlbD>F(Jl)@:jUmEZf7.D.Rc2FDi:=ARTI!+sLT?+CT(=+sJ.$DBNk8AKYDk@rHL-F=\PV
BOr;rBPD9nEb0,2@V'%fD.OhgBOQ%"@3AurA0=QWF('0(+DG^9FD,5.FD5\:De:,6BOr<.@;0O#
De:+j@rHC,Bl>OF@;]TuBl5&%DJsW1ATAo8BOuH3@V'%fD.OhaFi(F,@;]Tu9m+=`+B)cgEc>`,
/mDh"FCB9*Df-\8AS#C`A6g<+8T#YZ+EM76Bl%3u+Eh=:F(oQ1+E(j7FD,5.F*)>@Gp%3ICh+Z&
DBO%7AKX?YDegIeF)59&A90:EFD,62+C\nlDf'&.:MjZU@D]Pt@;]Tu:MjZU@D];m;e'`dE+s#8
/g:`3:haleCij\K<,tE+/Meq/<\ZEe1a#>#E\(QK?S!oe/i,F;1,_*E0JYXD1c-a>2_HsE2DI-L
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc><\ZEe1b;1/E\&D.Bk:dfFCf?2FCf0(+E2@>E,Tf+Cc`b2DBO%7
AKYf-@ps0rA8,IgARfg)De:+kEbT*+AStsgEb?pG:haleCij\?BlbD*+C]A*B4uB0@;]TuG%l#3
@VfTu@Wcd7ATDC!Gq:(HCi"6)Bl7Q+FDi:DBOr<*Ec5o.Ecc#,F!,C5+CQC6FCB2B+q4lUCh7=!
DIk@i;BR\K3%um<2`NZL/2B1-<+0o#6");u1Gh*I.l&q83%Qp>0JtC=2_HjG2E*EO/2B%70f(^H
0eb.0/2B19<+0o#%15pMATD4&@4Xr;+>P],1,q3D0ekR?3&E0n+B3Jn/70r8/2o1@1+Y4=1+kOB
1cI6H/1i_=/i#+@2`!0>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$b%/44>oCEQ2iCgh3lF!,FBDfBW9
@;J"J:iBoc@<Q'%BlbD=BOr<1DfTA2Bl5&8BOr;RDf9D68TS]VDIdf29jqs\Bcq5#DJ+*#B4W2t
DfQt/+DbJ,B4W3&H#n(A@ps0r@VfI_CERS-@<-0,De:,7FED)7+C\njF`_mO@;]TuE+O'%ARfgr
Df.0:$;bYW@<-('/4`Y]1bpm=0ekUF2_<7Z+B;-M/4!\q0JYF=3%HsK0fCR;/ibjA1H-pH2)I0K
0e>:E/i#=A0ebU=/1f)O/6,DY/.Dq_Derj&BlbC_F`VYF@;KY!/4`Y]2_m-J/28h81H7-@c\!?9
@rs7R/1iD1/i5F:1GLg@0f_*G2Dcs:3&iNN2)[9O3@l^4c\!cE@rs72$;bYWBlbgr;BRkW0et:>
3AWKH/C(mN;eL,%6")<!3&*3K/M]%71b:F83&E0A2`!'C1b^mJ0J"e20eP.;3&i]L/1`?t]IZuo
E\%Y,:iC/dFa,H.;BR_T3A<!?2`NQN/C(OD7qHNg/M&S71c7'>1,psC/28b32CpR;2D-d@3&riU
/2B1;0JYO@3B8WA/C(OP7qHNg%15pMEcPl2@4XrI+>c&52(UX?3A`HAcEeWoBlYaj/28n:0fL[<
0et[=1+kLB/29.=/i5:?0fUm=/MSk71c[?N1Ft(.cEf'&BlYa6$;bbOARfFnF^Zgl;BReO1cHsC
1GU^G/2T7-9MK4P/M&J)1G1UH/29%=/i,7A3AWTF1Gg^>0f1jK1+Xt-1c?mY9kc-f$;bbWD.+PX
H!t6+D(J4U+>GZ/2CpU;1,(R:cEeWm@<F+e/2/n83B/ND2)@3C1G1RC/2f=;3A`]O1c[*A2(gdB
2`<KK/1`?tZRf'aFY!t/:i^JaH#IRO85^Qc3A`NC1H.'J3@rI\+@Ak;/3tg@2`!HM.kih81b:=5
1b^I80f1LB1,UmK1FtC91,:[H3AW3;/C(LO6VV8G%15pPDfBi?/4`Y]1,:RB/2B4D2)Qr1[ie1P
D(It(0K(XB3@cj?1GC@9/i,453AW9H0f_'E2(UL</i>=@2`W]G/1f)U/4X8g/.Dq_Ec62:D.+PS
ASuTuF`M1I7nOm]2)-XP8g#uK0eCVT+@B^X/41sC1c%-M/N,:?0J"q5/hf"21,1^?1bq$N2)?d8
2DQmC2`W]S1b:1/cESofASs%.$;t;M/4`Y]0ebRD/29%?1H-l1[3.nYBe1he0JbL?3@upF1,ga?
/iPR;2)?j?1GUjJ2_6O@/i5FF1,V'C1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(XS7<3)n,#Vie+DGm>FD,5.:2b/oAKYW(A7T7m
F!,C5+EV:.+EM+&/0K.MD]j+CBl\8;F`8IFBOr<1@<Q4'+CT.u+Cei!FEMV8F!,O4Bl%^.F!,[@
FD)e1ATAo2ATTOK%16!ADIG(e;BR\K1H$d=2`!BP/C(UF7<3)n/M&J)1G1O@/2]:;3&*0B3&W<>
3A*6K1G_$H/1`?tZn+XdBe0]#;IONUFDi^$6m+3A1H@<H/3#FC1cHsm+B)cg/70r8/2o1;3@lpC
2D-^>3&WNP/1i\7/i,1A2`EEA1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p%s/59Ph@:s"iGp%'HDfBW9
@;J"J;IONUFDi:9F!+m6B5(dlF<G(6ART\'Eb-A*Ec5e;9jqjHB45k,+EV%.ATKI5$;t;R@;K@n
/4`Y]1H@-H/2T=C2)Qr1]HBmZD_*Ik/M&\13&iHD1cR*B3A<HI1Ft:>/het;3AiTD/1f)Z/50Vn
/.Dqa@<5jnB4Z0uBe2eQ+>u&12CpgE1Ggs?cET)H87cfm6")<!2_d-I.krk91Ft=71H-j?2)m3H
2DI3H0J"q8/i,LA1G^g</1f)O0e>k,E\%Y,;IOWTChR6iF_**p;BRkT2)[!F2D?pB/C(LC:N0tu
5qF`L1Gh*B0etOA/2Ah33%QgC1G1UB1H%!I/28n42)[-B1Gp^7/C(LO:N0tu%16!AF*(i"@;[Ve
;BRkT1H$dD2)[BI/C(OD6ul]e5qF`L1GCX92)6mG/2Ah:3@lpD1+kI=3&*?K/2]181GCO>3&rN@
/C(OP6ul]e%16!EB6A$5F"Bj[+>Z#;1+Y7B2E!QHcESKcAT'+c/28h43&E-?0f:pA0eP7?/29";
/hf:@3ArWD0ek:@2E*BF3@l^4cESooAT'+/$;tGY@<?3785^Qd2DHa?2`!BDcF+ilF(6ae/2/e5
1H-g<2`!<B2(gX=/29+:1c$mH2DcsD/i>RF1Gq!?/1f)T/5UCt/.DqaBkM!n/4`Y]0fLgC/2B%=
1H$f0Z62q`Be2P$0JtRA2(^LA0et:6/ho=:2`NEJ1GgpH2_6O?/i#+82D[<D/1f)P/5L;#/.Dqa
BkM-r+A69`FCB<4F`T*);BRhR2*!3H0fD!I/C(LC6Y1-d5qF`I1H@?F2D@!B/1iP.0JP+60f^jH
0JY=?2CpF<0J5=@1H@BO/1`?tYq/7RDCc5(;K$VbCh[<gARf.iFE2:N844RT1c[9I1FtL?0JYC7
?Q`-`BImLA?S",g3&rNF1cR*C0et[B1+Y150K:mK1,pg?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:N0tu
,#`GhDJ=0*+E2@>E,Tf+Cc`b;Df]?'Bji,pAKX?KF*)G@+Eq78+CQC6BkM<tAnba`DKI"5BkMR/
AKYo'+@fjVBk(jcDBNG3Cijf?AKYE!A0>i3Df'3+ASuT4;fH/_Bldr1GB.D>ATB=EGA(o9AKYr+
Df0,tFD5W*+EqaECERP-FCf>4Eb/ioEb0,uARlp*BOr<(BkM+$+CT.u+Ceu!ATMs-@;I')@VTIa
FE9&Y%16!OFCB&uFt?0^+?)8>1+Y.60fM!N/C(OD6tL0c5qFcF1H.0A0f1[E/2Jn:1b:F:3A**I
2_m0H/28t62*!NK0f:M&AThX*F(Jl)9OW$WDCdM%0f1"L@;KLqD/UOqFCB246Xb(FCi<s/ALu-4
/4=&c/0[2!<b6/WFDl1BEb0E*EcYf&+=L!!@q0FnD]hDU@q04]FDl22+?goCBk)'t@<HW6<b6/W
FDl1N+ED%7E,TW8Bjtmi+D,P4+>Gi11a$j]@<*K#@<>poDeF3(.3]3.;KZJ_@UWq$85^Qe0Jb7<
2E3TGcEn]]@<3tc@4X)e1,V$A2D?jB/2Ah92CpU</i5FA3Ar]F2D?a=1GppI1b:1/cEo,i@<3t/
$;u"^@UX@085^Qh1Gh'B3AiTL2_<7Z+B)on/1iD)/2Jn=2CpUD0J5@E0f:mD/1i\4/iGFA3A`E@
/1f)O/5p2%/.Dqb@:Eqd/4`Y]2D[9O/3#I?0et<*[ieIcBIlG#0fLg@1bCF>1c-a=/i5@81,V!C
2*!KN1-$m;0f:RB1,M!F2_6L2cF5?#E+gd3$<(ACCghEsDJ:Xm;BR\P0et:81GgsF/C([H6$73!
5qF]I0JYL91bg[A/2Jn:3@m*H/iGFE2)?s<1bgU:2`3QN3@mj4FD5VD/C([T6$73!%16$BA78t]
@VK7%85^Qi2).'A0ek@<3AiA5ZQMPRE\'Lb/2At90fL[<0etO91G1XF/2K(>/i5:>0K(a=/MSk6
3&`WL1b:1/cEf&fEH3T>$<(AD@;KC]EbR'q;BRqW3&E0@0et[E3%W@f+AcW^/1iD)/2Jn90e>+;
1+kF<0K:aH/2B%72D?jC2`E9=/C(mZ:h=8j%16$BA79:kASc'r/4`Y]3&E?H/28h=0K1g>cESKX
EH3Tr/2At72)m0A0JPR=1+kRE/2K(:/i5CB3B/fG/MJe50f_3M3@l^4cESodEH3T>$<(AD@;L"-
F_!$o;BRqS1GUL90K([F3%W@\+@1!f/3tgB0f(OB/MK%<1b:C73A<!?1,:IA3&roP2(U=:/i>RB
0fM!A/1f)P/4"8r/.Dqb@:XC085^Qh2`WcI0eb:<2)?f/ZQMV\B.Q>"1,(I=1+P180f:L;/i#46
1GC[=2)R<H3AE'A0J5+<2E!KS/1`?tZReIhB.OK!;dj<IEc#6,BONG_6m+3<0K1pL/2]=C2_lpk
+A??b/70r8/3#7=1+Y.=1G1[G1c@9Q/1i\22`3HN3Ai?C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9P&,n
:1\BQCh7[!+E2@>E,Tf+Cc`b<@:s"hD..O"@3B9*+EV:.+AQKe@;KX#DIIBn+D,P4+EV:.+D>J%
BOu7,+E1n#CER>/+EV:.+EqaECh+Y:@;L"'+DYk5GA\O3F!+1qF`):D7<W6_ATMrB+CT.u+EMgF
@W-'*De:,0@<?4%DII?(E,oZ'AKYo'+AQKe@;IP*$<(AIE+gdn;BR_K0Jk=92`!?M/C(gL:NC/#
/M&J)1+k7>/3#O?3AWZM1,(723A*3J3ArQK/1`?t\h$WtBe1H-Ea`KmFD5Z2@;I'(@;TQuAo_g,
+@1$V@VK=5+P=$TN7ib)fVdDUfW<`(fVdB,+ELt:AftMu/S\^'@`3h</0JbCFCfK$Ci"A>-Z`^1
AfrKLF*DPCA1&fKDe:,6BOr<!Bjkn$-S?SP$<(ALD(J4U+?2>?0J"q52)7$C/C/tl:h=8j/M&J)
1bLXF/2K.;/ho4D1Ggg;1,COA1b^^A2CpC1c\*iGAS3P'$<(ANF*2A//4`'+/Pn#T1b;0`<%Uou
1GgXi+B)oa/70q`0JP=A.ks";2CpR:/i,451GCU;0f_*I2DHa;3%cp>1cR9I/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S#,gALpPaCij60AKYr4DfBW9@;J"J;djQbF`(V1BlbD=BOr<(@;TQuDe:,6BOr<'
H$!_<Ci<s#@ps0rB5(dlF<G19Df$V=Ea`KmFD5Z2@;I&\@;L$sF(HJ+Des23FCAusF!,R<@<<W%
@<-C&ARlp*BOr<-FDl&.F!,C5+EV:.+@g?rD]in.B45UjFD,Au+EV13E,9*,+E)-?BOu3,BOtU_
/e&.d@<-!hF"Bj[+>u)71FtLD1,:g?cF=uq@rEna/29(>2`!$B1GCL60ePFD/2B+?/i,7C2_d$<
/Mo483B9#X1,LO5/C(aV;e'_s%16$BEbTDB85^Qg1bg[83&EEM3@rI_+@p'a/4!\q0fLgE0Inn8
2)$R;/ho+41,V$D2`3NS2DZm>1bLaD3AN9F/4"Ao@<3PYDe3a!/1f)R/4a>m/.Dqb@qBV$Ecl4M
85^Qb1cR3@1,1XH1b:L?+@U<b/3tg@1c%*H/MT(:3%Qm=0JY1;3A*0G2)-dA/1iS5/i,1<0JPL;
9OW$WDCd=r1Ftt8Be3k:Df$V=BOr<)@WQI(ATVK+@rH7+FCf9)@<?4%DBNk0+B)c]E--,CD'2/c
@;]UeDIRa/B5(juD%-hN@q]F^F=]s\+?2;=2(UI:1H7?K/C(OD:h=8j/M&Y50Jb[=1,psF/2Ah7
1b:F>2(gmG1Gq*H/2B1;0K:gH3&N6</C(OP:h=8j%16$DBOt^_E\'aZ+>Gc6/2K">3@rI\+@BRY
/1iD,0JkI@.lB4@1+Y151,LO:0J5(82E3KP/2]=<2)@0I1GLF3/C(LO6Xb$e%16$F@s)["@3A*d
@:XLt/4`Y]0f(aE/2An92)Qr1Zli=VFY#ge/2/n91GC=62`!3?1G1UG/2f@<2`!6K0f^d>2_HsE
1,UdC/1`?tZn,0bFY!t/;e9TUDCe=V+>>Z01+YCE3&W>5[3.hFF"Amo/M&\11Gp^=3%d'K3&icS
/2f::2E*<E0JP+EFDPB,+@C'YChYFOcF#2j@<3t/$<(MKBl8'7/4`Y]2)I*H/2o:;2`3/3ZQMSQ
D_+1_/28t;1,1:83&*BD1G1@</2Aq>/hf"?1c@6C1H7!C0K:gF0e=k,cEf&gDf709$<(VHD(J4U
+?),93@m0K2`3NFcESKjB4WVG/29.A0JP(43&!'<1bLRE/2B4C/hf%;0f(U:0fUd>0f(dL0e=k,
cESp!B4WV'$<(VHD.+td6m+KM0ebU=2)R9M1b;uV9P&,n?S#P83A*$?/29(</hf4>1GUp@/MSk8
1-%$I1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%AT'+D:gn-RF*(i.BcqA8DfBW9@;J"J;eTTV@3B9*
+CT.1<H;Vm+Dbb6ATD4"Gp%3?Ebuq9ARTIjDJ()#+EMC.Cht51@;Ts+DfQt4Cgh0l/0K"ZD.7F"
Bk&9(Afu2/AKYf'B4uB0De:,6BOr<-FCB2B+q4lXBOPpr@;%2_8PgNg3A`NH/2oRG1GLFf+B)cg
/70r8/28k31GgX<1c$a=2`*3J1b:453%d0L2)R'D/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,cD_*)4
DJ=3(A0=0Y@:C?JD/"$!FCfM9E,ol9Df]?'4!7I8@<-*kBHV#1+EV:.+CfP1FEMV4C`m4rE+sE&
C`mY.+B<;nFCeu*6#pCC+@U-]Eaa'$F"AGBDIal"Df0W1A7]dmA0>u-AKYJsFEo!IAftl,Dg-#/
A7oHrA9DH+FDi:9FE8RA@;^?5ARopn@<?4%DII?(@qBP"ATDiC+DG_7FD5i>FCfME+Dl7BAT_j2
/0JbC@WGmtBk;?.@;]TuBOu3uFCAfn+Ceu#FCfK6/g:`3;eTT^Cgekc;BRkT1,gaD2*!EN/C(jM
;e'_s6")<!2`!6J/Mf=>2CpR82DQg=2DZsB0JY@@2_6O:2_Hg=1H7-H/1`?t].?ljD_)>);eT`Y
Bjkd.85^Qh0ebL:3ANEH0J(MT+A@'$/4!]!/29+A0JP(61GU^:1G1O?/2B1?/i>@D3B&oK1G^X>
2DR0K3%QU3cE\upH#bGF$<(VLEaa&uDCe=V+>l#4/3#XD1G$hW+@1$^/3tg@0f:dG.l&e83@lp<
2Dcs?3%d*I0JG=A/2An33&!<G1GLF3/C(OP6#pZj%16$JCLJbb6m+3D0fLjA/3,RC2DQgj+B)on
/70r8/2o1@1b:CB0J5:>0K1pE/1iY5/ibXH0JtX;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p2%/4XA^
DII6fDBNn=DfBW9@;J"JD.R-nF!)iCDerr3+DG^9FD,5.7<`;cCgh3oF^\oo/e&.dBl[p1F"Bj[
+>Pc60e>+91Gh*CcESKZ9joS=/2/t=2)-[;2Dd3@/MSk71b:@80eP4@2_d0I/1iS7/iPLC0ekR;
/1f)O/43-?/.DqbBlnK6@4XrI+?2860J"q50fLg@/C(gL6#gor5qFcH1H.9F0JkL@/2]%61b:F=
3A*-E3A<EL/1i\21,:gC2)[!:/C(gX6#gor%16$L@<=%k;BRqX0KC[=0f(O?2D!.\+@1!f/3tg=
/2Jn62_6aA1G1RD1,UpI/1iS6/iYU?3&3ED/1f)R/4"8r/.DqbDerj&Blbgl6n9uK/Mo=B3@mKb
.krk41c7-N/70MrAS3Q$/70qg/iPa@1GLjA1H@HU2*!3B1bL[G3AWWP/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S##bB.P6'Des-/BHV87DfBW9@;J"JDIIBnA0>;mFCfJ8;f?J\EbTSG+CQC1Dg#].+C]U=
;flGcBlh7F@<WhfASj%D%16$QBk(R&85^Qf0Jta>2Dm<M1b?qW+BE2s/4!\q0f(RB1+b480eb.4
/ibmB1,(F81-%<L1cHs;0ek:82DI!B3@mj4FD5VE7ri$L@rEqc@:FLuDf08tDCd?aYq/piE\&D6
BOr;[@<?4$+EV18D'3P6+CQC7Ea`j,CghF"Df-\9Afu2/AKXK`AS#X"c\'PscE,?Ic\9\s+EqL5
@q[!!F!+m6FE1f-F)59,Bl@l3De:+XCMR?hBjkm%F(f]*F_l/B+BrYrFCfK$Ci"A>GB.D>FCf>4
F(f\J@Wa8FCb9aO1gMXT@;Ka&D.R-nBl7QE+D"u%+E(j7B6%EpDD!+B$<)%XEcP`/DII$gF=]sK
<%Uou2CqBb<%Uou2Cr2X6#L3a?S#P80eb4;1b:F?1bL^G1bpaF/2T+71c@3O2`!!?0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL6#L3a7!3T]BHV87DfBW9@;J"JDIIBnA0>;mFCfJ8<+ohc;flGgEd8d&BkM+$
+C]U=<bZG]ASuT4G%#827rN$R/e&.dFE2))DfRC"6m+EG3&rrL1c%$K1b;uV9R1M,?S#P83%cm@
/28q:/i5I@2E3]J1G^X;2)[EK1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#>/W6ZR*RFD50$+E2@>
E,Tf+Cc`bW@;TRd+CSl(ATAnlFE2))DeCUDFD,5.B5_<'De:,9Bl7I&+DG^9;f#lcBk&9&H$!_<
Ci<s3/g+)7EbT!$EZf(;+CT)-D]iI2@q]:k@:OCjEZf(6+EV:.+C]8-CEQGoBuH!B+DH-EA79Y!
Bl7K)-pr#n@<?3lDBMneCh7Z1De:+cDf0216"b*b+C]U=8TnN[@3@mWCh^hC/PTZm^3+I)DJ@%E
/g:`3;fuMbDe!L!/4`Y]2`WQM/28h53AicIcESK[AS`n`@4X/f1H@?D0f:gG/2Jn;2_6a=3A*<G
3AiTH/29"73AE9C2`!"*AThX*F(Jl)9OW$WDCdM%0f1"L@;KLqD/UOqFCB246Xb(FCi<s/ALu-3
/4=&c/0[2!:2+3VCghI-+ED%:ATDj'A0<9qBk(XkCi:F`@:Ne]@<?F.AKX/Z:2+3VCghI-+BE&k
@<?F./0JtEF)Z&8F(o*"AKYT'EZd(r0f1"oFCB24@psIfCi<s/ALSf4$<)(VEa^Li;BRbT2)6^>
2`39K/C)!Q9P&,n6");u3A`HG.kit@1b:F82)6^;1c6m@3&``P0J#4:3&r`M0K:U7/C)!]9P&,n
%16$VBOPUk/4`Y]1H%$G/2T1C0fCT.]-(-cCb..h0KCgH0J,+;1,^[=/i#460f(^?3B9&Z3AW3<
1c$a@1GUgI3@l^4cFYW.AS`n,$<)(`@:iqi/4`Y]2_d6N/3,L@3A`;4ZQMqeE\&dn0fV$M3@cm@
1bgO;/i#:81,q*C2`!<O1,pg@1+kIE3AiZQ/1`?tZRedqE\%Y,;gED#@4XrI+>kr23%QsJ2_Zs;
cFG&uBlYaV/1iD0/hf481,1U<0JG:@1,CI52D-[;0Jt[E/1`?t\L^cqE\%Y,;oF6(@<l94844RU
0JtdF3@lm=2E3HK/70MrF$V?a/70qf/i>O<1GUd>2)@*D0fCR71GLL@1H.-M1b:C90f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r)F$V?UEbQXi@;]jhDBNn=DfBW9@;J"J;oF6(@<l9(D.R-nF!,F5@:NjkBl5&8
BOr;bBl7TmCh7[!+DbJ(B6@WqAM+E!<+06MF=]s\+>G`11Ft::1c.3Dc[[eo:NC/#/M&S41c[NG
0K(dJ/2Jn53@m*E/i5I?0JkX<2D.!J0et[F/1`?uJ28`PEbR'6$<1GJCLJbb5u]F4/Mo.483p3,
:b=LX/70Mn@:Liq/70q_0eP7>/2K(>/i>@=3&WWF1c6mB2)d<L2CpU;0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r%@:Li^Bln$2@;]dfDBNn=DfBW9@;J"J<+0KV@3BDu@;^-/E+NHfAKY])+EV:.+A?KkBQ[a$
Bjkm%Cgh3oF^\oo/e&.e@;1!qDJ+$(DfmU%;BReR0fU^A2`!HS/C0(o<D?mQ/M&J)1G1RG/29(A
/i>@=2)RBF1cI$G2`W]K2CpC1c\F&O9joR^$<1GJH"eg#;BReV0fCR@1GCaG/3"b?Ea^LN/1iD1
/i#460f_$B3&W`V2)-X?2(g^A3&EQN/1`>3/4=Me/.Dqc@;KY"BONG_;BRbQ2E<<F1bgaE/C(dK
<D?mQ6");u3&N]O.l94>1Ft=70et:71Gg^D0JPOI0J#%?/hf+:3&3BC/1f)W/6,DQ/.Dqc@;]^u
@4YJG;c#&$0e?Bl;c#&$0e?ZS:h=8j?S#P80ek:<2(UO?2_HpI1,gsE/29+:1H@?I2`N?D0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL:h=8j6?R*W@<-'jDBNn=DfBW9@;J"J<+0ZWEa^))F!,R<AKZ&:E,oN,
AKYJoCh7[0Bjkg#B5_<'FD,*)+D"u%Cj@-iF_k]!EcW@IDfTo4BlIWo/e&.e@;]df+@1-kFE1f+
Blbgr;BReM2E<<G0K:a@/C(mN<D?mQ5qFT=1G1@>/29">/i>UD1,Ua:1bgU>3B8rO3@l^4cFb].
9joR^$<1GOBji,NDfTDtCh[rA85^Qe0JbL92)$gF1+^__+B;-E/3tg=/2Jn82(UI>1bLOB1b^pI
/2T+73AE?H2)[!:/C(jY<D?mQ%16'CE+NO%ALpA?+>u#72Dm$A3&!0D/70Me@<*o+/70qf/ho%2
0ekR=3Ai`M2E36>2)Hp@2Dd-F1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq@<*ncDes-2Bjkm%E,ol9
Df]?'4!7L2E+NO%AKYi$@;^-/ATVL(DII?(E+*j%+DG^97s/6\@;]d%@;]TuEb031ATMF#FE8RH
BOr;\Bl%R1+BMus+EV:;Dfo]++EqL5@q[!,BOr;uBl\9:+DG_,@:Eqm@;^1.+E(j7FD,5.7:C4Y
BHU`(EbT].A0>;uA0>B#F_kS2Eb0?8Ec*K=$<1GS@<uKq/4`Y]2`3?J/3,XE2`NA6ZQMPRCb..h
0f_'K1Fk161H-j?/iPO:1-%6F2)[9O0f:L:0J57<1GUjD/1`?tZReC^Cb-#&<+0fZ/4`Y]1GUdI
/2T%<1,^]/Z62MP@k9ns0K:dF2(L@@0ek48/i>F90etR<0et^J1H6pG/ho=C2)I-@/1f)P/44;b
/.Dqc@<lKsFC?^k;BR\K1c6g=2`3BG/29.-<+0o#6");u1GgsE.l&q:3%Qm=1GC@;2D-d>1,(UB
/2B%71c@9J2_Zd6/29.9<+0o#%16'GB5M@#ALpAM+>Yc,3%Qm?0fCsAcF,GM6Z-Bb5qF]L0etL7
0fLmK/2St;2_6[=1G1@=1GLdA/29(92Dd?P1,1=2/C([Y/44;b/.DqcASPXq/4`Y]1,:gI/2Jt9
1c$].]HB^UD(It]/2/t;1GC=71,CX91+kOF/3,R?2`*3C0et:81+kF=1Gq-J/1`?t]IZQaD(H,'
<+U)]@V'@lF_r[#;BRnU3B&KL3&!6K/C0.q;eL,%5qFT=1bL^@/2B4F/ibdL3&<NF/M]4:1-%?P
1GgX6/C0/(;eL,%%16'GG%GJ@83p3,:b=[Y/70McF`K$?/70q_1+k=?/28k5/ho7D2)[EF1H-p@
1b^gF0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoF`K#W8TSo\ASc''E,ol9Df]?'4!7L6G%GJ4D.R-n
F!+J#Bm+'.F(HJ4EZeq:ATE'<BPD?s+CT.u+C\npBl7u7GA2/4+EV:.+DbV2FCfJ8<+0Ai+EV:.
+DbJ-F<GC2FED)7+DG^9FD,5.87c7NATo8*CiF&r@V'X6+q4lYBOtalBl5Im;BR\N2Dcs?0f(gG
/C0#*+@U<b/1iD)/2Jn<0e>4B/iYgL2E!6?/Mf(52)[3G1bgO4/C0#*/4FSn/.DqcBQ[cmDCe=V
+>ko70e>4B2`3KEcESK[Ea^Lb/28t81c-^@1bpj<1G1RE/2Aq7/hf:E1-%'?2Dd$B2`3QP0e=k,
cESogEa^L.$<1_JCM>=j;BRqW1H$d=0etI=1+^_V+@gHp/1iD)/2Ah41+Y4<0J57A2E3WR/1i\:
/iYgI2)dEE/1f)P/4X`'/.DqcBjkmlF^]/=85^Qb3AE3=1,^sH0eCVY+B2cl/3tg=/2Ah<2_6pF
/i5:;0fV0E1,1C91bppF1b:1/cF,9'@<F+1$<1_JDL#qI85^Qe3&WQD2DR*E1FtI-6ul]e/M&J)
2(g^A/29.>/iYjI0KD-E2E!0H3A<6C2(U:02_7@;@4Vip<,$2`E\'aL+>G]41bq!@3&!6M2_8;Y
:N0tu?S#P82D-sL/2B%@/ho(>1-%6D/MT%61H@HR1H$d>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:N0tu
,!o^UB5D!eATMO!+E2@>E,Tf+Cc`b=Bl.R)+Dk[uDK?q2@<-.$ATMo8Bl5%[ASu-hChY#.@;]_#
@:s.&+CT)&F_#3(B-;;7+EV:.+EMX5EZeh&Bl7Q+Amo^&@<Z.*+DG^9FD,5.A79LoDImm1+E(j7
F)YPtAM,/9$<1_\Ch[uB=$]b]/MT.</6>,9:b=C[0e?ZS:j$_.?S#P80eb4=2_6[=2D-dA2`NWP
/1iS2/i>=:3B/oJ1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UJ./5:&'De!9cDBNn=DfBW9@;J"J<,$Di
BlkJ3F!,R<AKYl!D.Oi.AftM)Cgh*j+DG^9FD,5.6$-pOF!,=<F`);0Bl7u7De:+dDfTc+@rEtB
8TZ(lARTIt+EV:.+C]A*A7ZltDBO%7AKX9U@<uX#BHV,"DJ+*#B4W2oDIal(F<G:=+CT>4De!Ki
FCeu*GA2/4+CQC+ARTV$@WHC&ASrW"ART_'BkDL(+D5D/C`mG0+CT.1@;]RhASuT4Ci<flC`mP*
B4Ysk/e&.eBlmd-Bl5Im;BReR3%R!G0f(B,Kci[!A1U"t0JP@A3%Hg?1,LO=/hf::1,LU<3B8lP
1+Y7:/i57>1c73C1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>492.^<4FD5Z2/C0#$6#L3a<,$G_GA1q;-t-q5D]ih5Dg-(A@<3PcARoLm@3BK#+B2oo
DfoK+.3N>G+CQC6ATW$1ASl!rF<G:8+Du+<FD,6+DBMYlEc5GtD]iJ+A0=lI78lQL+BNK%Ch+YZ
ATDL,@:s-o;e^>b/g*]!F*)>@Bk(RfCj@.;F<Gd9F!+n/+DG\3DfTr.DKI"?DeX*2+E(j7@rH7,
@:OC%@V'Y*AS#a%FE_XG@qg+#Ch\3(FD5Z2F!)l0E+*WuF(c\)DIakUEa`E++CT.u+EVgG+Cf>-
FD5W(DKKqB-q/9!DfB81@;]Tu6"Y.O@ppf/@:jUmEZfI;AKWsSBHUerDKL#AGqKO5<,ZMcCb/XR
;c#&$1+Xt`+@U<b/70q^1G^aA/M]+=3@lm>/iPL92)6dD0fUjB3@la;1G1XA3ArfU/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"WdBe1H-Dea!&+DGm>FD,5.DIIBn+E(j7Df0,/De:,6BOr;\@<l:!+Co%t
FD5<-+ED%0@<?'k+EVNEEa`["/0K"UDfT]9/0JA=A0>JuEb-jI%16'QCh[`pDCe=V+>ku60J#.;
2E3EBcESKZASs%c/28t;3ArHI0JtO80eP7>/2Aq?/iYjL0KD$B/N,:83&<KN1,pg9/C(LO6Y1-d
%16'QDIIX$F_E<s;BReS0KC[A3&riO/1hu3@;RPI/1iD1/iYO90fUm?1GLXF3Ai?H2D.!D2)d<K
/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQ
Bln'-DCd@j6Xag_<,ZY_FD5l2+Eq78+EV:.+@1<qARciqDe'u/Afu2/AKXooDCuA*<,ZeeF_kK,
/4`Y]2)-d93&*EQ/C)!Q:ig+t5qF]E1c7*?0KCgI/2St73@lpD/i,=D1c@6C3A*$D2`ENO/1`?t
^FW3&@k8&r<-;nqASs%i5u]F4/Mf:983p3,:b=I]/70Me<c0Hq/70q_1+k=>/29+D/i#=C1,h*B
1c-gF0f:aC1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq<c0H48TJNdBHV87DfBW9@;IP=<-;nqASrW7
@<3Q5BOr;pF`):DDe:,6BOr<"F`);4Ed(r4EbTH4+@^'`DJgS6@:LEIF_tf#Bl%T.De:+`EbTT.
+DbV%ASu$0+EqL;+Eq78+EVaHDIm?$Bl8$2+CQC+Dfor.+C]U=FD,5.C1UgiDfp+DAmoCoGp$*s
BQRcr@;KCd/g:`3<-<.o/4`/O1,CUC3@lmD0KD$B?Q`6XF=^cM?S",g0et:;1bLdD3Ai]R/1i_7
/ibXD3&<NF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5g&$/0[E$@<uX(Bjkm%E,ol9Df]?'4!7LFE+pG/
F!,R<AKYl!D.Oi.Afu2/AKYi.F*&ODDfBi8Dfp+D8T&'QB4Yt!F`S[%AT)O(AKYf'G%ki,+E)-?
FD,5.ARTY%ATDZ2@rGdsF<GL6+B*3$FD)d_D.Ra%@ppo2@V'.iEb-A8BOr;_DfTrBB6@d,AKYE%
EbT].A0>T(+EV:.+>GcrBHUerDKL#AGqL9M$<2.e_kSbR6m+3<3&*6K/2f1?1c-aj+@C0l/70q_
1,:^H/N,F>0e>483B8WF3&WBG1bq!K3@la?1bLI;1,([I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Qb
FY$?tEa`U'@<l:!+E2@>E,Tf+Cc`b=F`>6n+DGm>Df0,/De:,(Dfp(CE,oZ1@qfmuAKYW(A9/l3
Afu2/AKXKc@<,doBcoc]F)>i.Df0hCBl5&4DfBi8@<*Je@<,dhF^]Q(DBNP0Chmj*Eb-A8BOQ!*
BOu"!ARlp*BOr<-F`;A4D.Oi&De(!.O^W*8DIdl4FDi:3Eb/[$AKZ).AKXujBm+'.F(Hs5$<2.g
ASH3:85^Qd0fV$A1H@BO2_<:++Ad3"/3tg@3&!9K/M].;3%Qg;3&<*?1,1C@3&WHH2_6O91bLR<
1c$mD/1`?uJLjW?E%DG*<GQ,RBIl\P+>Yu62(URC1c$j;cFG&gH!r6U/1iD//ibU:0f1^>3Ar]J
0K:U80eP1;1,q!B/1`?t\L^9s@4Vip<GQDnDCe=H+>GQ*0ekU<2)d9N0e?ZS6Y1-d?S#P82_HpG
/29(A/i#.81,Um>/N#L?2_[$H0eb.60JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1-d:hb#]@;0b"+A$Wj
@;]Us+E2@>E,Tf+Cb?i1CM\-2+Dk[uDK?qCF!,CA+EqB>Bl5&8BOr;_Bln-%Ec*"9@;]_#@:s-o
De:,6BOr<*AT)O(AKYo'+Acco@ps(lDBMMlCgh3lF"Rn/<Glqp@;KUcBe2eQ+>l,91b:RE0K1[:
cESKjATB=R/29"=1c$X92DR0A1+kI@/2B">/hf1A3B&iI2D-gA2)[3M/1`?tYq/gbE\%Y,<Glr"
B6A*+FCd!o;BR_Q1c?m@1H76M/C/qk6VUu?/M&S70JPL<1,h'K/2Jn83@lm=2(g^@3B&oQ/1iV9
/ib^E3&<6>/1f,"/43-?/.DqdEcl.K844RU1GLgB0e>=C0K1sB?Q`9[ALq1>?S"/h3B&KE3AW9A
0fLmE3%QdB/i5LD1,q9F1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p1m/4jkjEG6P7Ec5o8F(&lH+B<H)
CERh0F!+n/+CT.tBk;1(+Cf,-Gp%$;+EV:.+B*E"ATAo%DIakV@:FLuDf08tDBNG'G%kc,H=:o0
Df0V=Bl5%fATMd/DffE)Bji-*BlnK+FCeu*@;Kk"B-:W#+CT.tBk;1(+Cf(nDJj$%+E(j7FD,5.
7<NQ_Eaa'$F!,L;G%G\:Bl5&1De*F"DCoC-Gp#\!@<!n/$<C_N@4XrI+?(u.0e>=>1,^m=cESKc
H#bGf/29+?2E<9D3&ENE0J5%8/2B.E/i#4>2`!<B1H7!G3&<HP3@l^4cESooH#bGF$<C_YBlmd*
ALpAM+?2A;0J"q52D@'J/28t(6#L3a5qFcI1GL[91H@0H/2]%81+Y4=1+kOA1,UpI/2K:=1,CgC
3B&KE0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?
ARoLsBl@l?0f1FIDIb:B7WNEa+EV:.+DbJ.Bl5%;,$&8qBlmd)+sJQ\FE2MGBJ(E,BOr;p@VfIp
Bm+&1AoD^,+Dk[uDK?pE,'R^3Eb-A8BOu3q+DGm>FE2MGBHeWQ+q4l[Bl7HmD/!F#EbTbL85^Qe
3AWEA2D[6F3%W@_+BE2s/1iD-1GCR>.kr_83%Qg;3&N6A3AiEH1c-pE2_6[;/ibdL0f1mA/1f)S
/66J*/.Dqf@<5k!/4`Y]1,h-N/2K.@2)$T,Zlj!mD(It]/20"<0JP(50f:sB1G1O=/28k5/hf(8
2`*NG1,1CA3&39E2CpC1cEo,mASit-$<LY^DCe=V+>PW-0J"t<2DR6CcE\Q[DepsV/2/q=0eb18
2)I3B1G1C;/3#R@2`!HS2E36>1GpdD2E3KI0J"b+cE\ugDeps6$<LebASs%i;BR_Q3AW3B1c.$G
/C(UF6VUu?6");u2_[3J/M]4>1b:@63&<*?0K1U<3B&oT0J"e22D-dG1GUX</1`?tZn+R=@4Vip
=*8P(ASs%i;BRbO3%QpC1cR&3[NJC[ALp,U/2/e43&E3E2)-s>1bLI;/29(90KD$G2`!!:2)R!A
1c73L3%QU3cF,9#BOr_($<U_RBk1ppF`LnA85^Qg1,Lp@3&3?G1b?qb0d'D)D_+1_/29%?0f^gA
3&!->1G1@8/2B(</ibgK2D[$</Mf@=0Jk^E3%um7/C(m_/5p%s/.DqgBkV'/844RT2`!9F2CpjC
3&NHB?Q`$fE\(QK?S")f0Jk=93%usF0JG=@2CpXB/i>LE2D@$?1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/51>0/5BVkC2%Qu+E2@>E,Tf+Cc`bABkV'#.-J=MjcYQO+DGm>FD,5.B5_<kATMo8De:,6BOr<-
F`&=9DBO%7AKX?RBl7L'AKYi8FD,T/DeF><@;]Tu@;L"'+ED%4Eb0<'DKKqBFD,5.ARTUqBk;@-
+CT>5Ec5i6D.Ra/+CT.u+Co&,ASc:(ATDi7De:,%@;KLmA79M"+DG^9@;]RhASuT46YL1O@4hur
=ES%iB4WVb;BRhQ2)-X?3B&`L/C(jM6>pcn/M&V50fCj=1c@$F/2St63%Qg>1bLIB2*!BH/2T7;
0K;$J0K(I5/C(jY6>pcn%166LA0=]eF*(u6BlA#C85^Qg0K1j?2`WiW1+^_Y+AZri/1iD-2DI0I
/MK"<1+Y461,CI:1c-gB3&!-I1b:48/iG^F2)-d9/1f)S/5L4u/.DqhARlo[EbTH4/4`Y]2D@!H
/2oRH3AW53Zli.`BIk_d0fCaC1G(::1bpU;/iPR;1,Ld>2)mKN0ek421G1RG1c$mC/1`?tZn,!l
BIjT"=_V\_F`&a$;BRkV3&rNL2)m?H/C(UF<D@0Y/M&V81GU^93&WQM/2St82(UL@1G1@=1bgaD
/3#O?2)mKN2DQg7/C(UR<D@0Y%169IDJ<Nm/4`Y]1c@<R/2f1:1-$o2[ie^cE\'Lb/28n73B8ZF
0JkI71G1XI/29+@/ibjK1cI<D/MJe82E!KS1Ft(.cF5?*BlYa6$<gk\Ea``785^Qb1,CX90fV$I
1G$hX+@U<b/1iD,1Gq-G/MT%;0e>(43B&KH3A*0C2`!?G/1iS4/i>=B2).!?/1f)Q/4FSn/.Dqi
@<Q@"@<Q'185^Qe2)I!<2)dHO2_<7[+BE2s/1iD-0f:XD.ki\72CpX:2*!3B2`E?I2`!EK2CpR8
2`<KO0fLX7/C(OP<bZS*%169P@;]^/85^Qd3A<6?1cR9K2D!1.0d'#4@4X\q/M&_20ek461cI$H
2E<WP3%QX91bLaE2E!6F/1`?uKeY,LH!r65$<h.Q@;IJc;BRtZ1b:@=0f_0DcF+iaEbR'j@4X)g
0f:pB0K:mL/2St=0J#%?/ibdK1c%$@/N>@B0f_0K0e=k,cF,8mEbR'6$<h@hD.+td;BReP2)d'D
1cREL/C(UF9P&,n/M&V20f1U81,(L=/2Ah82CpR@3%d'D2_[3O/2An32)6sH0fU^8/C(UR9P&,n
%169]@V'FgChI<sF^f&985^Qf2)?s<2_m9H1+^_U1*B8)@OsfR/28t=0KC^>2D?p<1+kLC/2At9
/iPLF2D[<D/MT.90JkLC2`E9=/C(LU/50be/.DqiF^ep"ASc$gCN<imBe2eQ+>l);2_6mG1G^g<
cEeWeBjrVZ/29"<2)Qs?1c.-B1G1[B/2B";/iYgF2)dKG/MT(72`NfT1H$d8/C(RQ9PIre%169]
@V'FgF(8llD..6p/4`Y]2)[EO/2oCE3&N84Z62hT@Os)^/M&Y02DHa<1-$sB2).$F1b:4=/i,IB
3AE?A/1f)P/50be/.Dr&De!3tBl@lrARfj<2D[0B2)$^<0JFV$2E<BE2_Zp>0H_r(/i=b;AnPdc
DJ=06@;\,!@:F@q%14pH/i,:;0JG1'/MT7<3&30A0JFV$0eP.&6#:"=DJ<N?<,$A]DX.`=1Gpd?
2)$^<0H_r$/iGR@0JG1'/MSk3+@0gVATDKn3`Ba'BcpkrC`l#Q@V'Ti$8aLj2)$^<0JFV$0eP=;
0JG17+>#<#0H`Z!A8cL/@6-\lA8cL/@1<Pq3%d0H0JG17+>#<(/i#:<0JG1'/MSk3+@0mXDeriC
9Qac]A75oS/Mf492E*<D0JFV,3%d'B0JG17+>YW(+@1$\ASuU(DIGRmF_,H/F!*b_Eb0;$$8"4i
0JG170JFV(1bLI90JG17+>GK&+@1'YASuR'Df-[hEt&I.1Gg^E1,(C90H_r%1H7!E3&!$?0H_r-
/i=b;F`VYF@;KXd3^I:fCgh$gAIStu1,COA0JG170H_r%1G^XC2_Zp>0H_r-/i=b;F`VYF@;KXd
3^IRr@q?c]E,oZ1B6+Lh/M]7;2)$^<0JFV$0f:a>0JG170JFV$0eb46+@1-kFE1f+Bjj%hEbTT(
@;]Wc$8"%k/i,180JG1'/MT(B/ho.90JG1'/MSq30H`Z(F*)G2Ch[<=6XakAATDg"%14[A1+k@B
0JG17+>#<(0J5@>0JG17+>#T+2'>2-F*)G2Ch[<=6t(+[Bl4@e/Mf.70etF:0JFV$0ekO<2`!-A
0JFV$3%cm-6$76jEa`cu@6-kuASkjnFDPLt$8"(i/ibU>0JG1'/MT(@/i,180JG1'/NGF@+@1-k
FE1f+Bjj%nDdm-qF:AR/1H-pC2)$^<0H_r%1c-gF2_Zp>0H_r%0J5%%6$76jEa`cu@6.+oCgq=*
Ec,Ft$8"%g/ibjE0JG1'/MSt;/iYU?0JG1'/N>@:+@1-kFE1f+Bjj&!ATDm+%14[C1G1OA0JG17
+>#<*0eP1>0JG17+>#<%/heD6F`VYF@;KXd3`C<7DIn)&$8a[o0K:a?0JFV$0f:R>2_Zp>0H_r%
/heD6F`VYFBjj%mEaa8'$8a[o1,psA0JFV$0ek:;1,(C90H_r%/heD6F`VYFBjj%oDJjN)Eckl-
%14pM/iYO=0JG1'/MT+82)R'A0JFV$0eP.&6$76jEbSrC9P%pIDJ=3=%14pO/i,7:0JG1'/MT(7
1GCL:0JFV$0eP.&6$76jEbSrC9PJBj%14pN/ibU>0JG1'/MT%60JtO<0JFV$0eP.&6$76jEbSrC
;djKg@Wc^(%14pO/i#190JG1'/MT.91H.!A0JFV$0eP.&6$76jEbSrC<bZ,_DIEt]1,U[<3&!$?
0H`;5/i,:;0JG1'2(gR*6=FP9D..KH:183b@<E"d0f(F90JG170H`55/het50JG1'2(gR*6=FnD
@:X:t%14sI/i#190JG1'/Mo(:1,(C90H_r%/heD7ASc!nF_s0*DKL)6Ec;Hp2)$XB1GCL:0H_r(
/i,@=0JG1'/MSk3+@9XUB5)L*3^Rk0F)to/Et&I60eP.90JG17+>#B%2_Zp>0JFV$0eP.&6=jtG
Bm"8R7qHR[%14sH/iGL>0JG1'/N#.<3&!$?0H_r%/heD7ASc!nF_s05C$92@%14sI/i,:;0JG1'
/Mf"71,(C90H_r%/heD7ASc!nF_s0CAS#=kF_>>u%14mH/het50JG1'2Dm*@0JG170H`2)0H`\n
Ec#r0@1<Pq0fCXA0JG170H`85/ho:=0JG1'1bLI)6>p[SG%kAG9OT&?@<r@i/MT+82`EEE0JFV+
2_I*L0JG17+>YW(+@:*WF(oGO6?6LUBl%Kl%14[B1+kR@0JG17+>bl,1,gm@0JFV*/heD7Eaa9.
CcYI.D]iS%+A-'[ASH1'%14gE/i>UB0JG1'/MSq9/ib[@0JG1'/N5:9+@BRS@W,dk@6.4uDJsA7
:h=NX%14sI/hf.:0JG1'0ekL;0K:a?0JFV./heD8@;]La@6-baChI0sGp#CH%14pM/i,180JG1'
2DZs@0JG170H`2)0H`_kDII'a3^[RhEboZ9FCfQ4GA\O"77dpq1c[0B0JG170H`55/het50JG1'
1G1O-6Xak@A77MdDfT`,EZd\hDf9D6:.>["1c6mG0JG170H`83/iPI<0JG1'1bLI)6Xak@A77Mg
Eb/cmEbT$*Df-[m64F8Y1bLXF0JG17+>u#.2Dm0B0JFV+/heD8@;]La@6-qfCh[KiGT]a[%14sK
/i,180JG1'2D?a<0JG170H`2)0H`_kDII'a3_++,F(HI\@<itj7L]\]1G1@80JG17+?2).0JG17
0JFV,/heD8@;]La@6.)#DId['+AY`A$8aXn0JG170JFV-1bLaA0JG17+>b])+@BRT@:We-9lFoZ
FDl%>:-oBs1c6mC1,(C90H`;1/i>L?0JG1'2(gR*6Xak@A77MnDf0Z;ARTBt;,n&41c6mB0JG17
0H`;3/iPI<0JG1'2(gR*6Xak@A77MpFECr8@3A?@%14pN/iYX@0JG1'2_cp?2)$^<0H`5*0H`_k
DII'a3`1$2@V'$l;,n&42)$X:0JG170H`)(2(gR:0JG17+>ti++@BRT@:We-;IsKTDIFYd9+;4b
2(g[=0JG17+>u,10JG170JFV+/heD8@;]La@6.=qBl8#88oJB\+AP64$8a[o2)$^<0JFV,1+kR@
0JG17+>YW-+@BRT@:We-;fj-SDeO#9F!+4I%14sJ/het50JG1'0ebO=0JG170JFV-/heD8@;]La
@6.=qF),3+Df9M9;bIQ,2)$X<1,(C90H`83/i,C>0JG1'2(gR*6Xak@A77MtAT2`C8ShsZ+Al,J
$8aXn1b^U;0JFV-1G1[A0JG17+>b])+@BRT@:We-;fuqoATDj+A7Zl[77dpq1cR*A0JG170H`>8
/het50JG1'2(gR*6Xak@A77MuBQ\3'ATAn[@<itk:(7Oe1G1RC0JG17+?);51H7'B0JFV,/heD8
@;]La@6.A+Ec5i;D]hhN%14pP/ho4;0JG1'0etO;0K1[>0JFV//heD8@;]La@6.FtDI[U-G%G\:
6:21h1cR*A0JG170H`)*1G1@80JG17+?1u-+@BRT@:We-<bZ&cDfTQ#+@8F)$8aLj0JG170JFV/
1G1@80JG17+>kc*+@BRT@:We-=(uP_F)Q(A:JM?+1c[0K0JG170H`A7/ho.90JG1'2D-[+6Xak@
A77N#Bl7g&E+NZ)9hl-)1,pmD0JG170H`)-/ho:=0JG1'0eP.&6Xak@Ed8d!Et&I23A*!>0JG17
+?2&-0JG170JFV,/heD8@<l]uDBMMl%14mH/hf7=0JG1'/MSt>/iYO=0JG1'/N>@:+@BgVDIGS$
@;[Z,BPD?s%14[C1G1O=0JG17+?(u,2E*<D0JFV+/heD8BPD9o3`BI)FD5/rD[d%1/iGL>0JG1'
2`*-@3&!$?0H`5*0H``$Ci=0"Bjj%hDeF!1@1<Q%/i#:<0JG1'2`33G0JG170H`5*0H``$Ci=0"
Bjj%sARo@gCh[br$8OCi0etF:0JFV$3&3*C1,(C90H`5*0H``*@UV;g@<Q's@1<Q"2(gUB0JG17
+>#B*/i,F?0JG1'/M\q4+@CEnEclFa:2+3VF(o%l$8a^p0fLd?0JFV$0fL^>2_Zp>0H_r%/heD8
H=^T"Df]`5G%#0#@6-_q@<?4)CghKq%14sH/hf7=0JG1'/MT(71bpa=0JFV$0eP.&6[E<RBQ%s.
Dg#Q)Bjj&!Ea`Wi%14sO/hf.:0JG1'/NGFC2)$^<0H_r%/heD9ASu?nEbd^%@;KCkEb>gg2)['A
2D?g=0H_r%0J5+90JG17+>#<#0H`bpDJ`g&CH=aiEbKT:%14sM/iPO>0JG1'/MT"52)d3C0JFV$
0eP.&6tL7Q@<--E6Z6pTDJ3HkASqqa/M]7;0K:a?0JFV(0KCaA1GCL:0H`;,0H`emF*(u6+A$V`
$8OFj0K:a?0JFV$1GURC1GCL:0H_r&/heD:B6eH<3^Ih2@;ZM]1GCF82)$^<0H_r'0eP4=0JG17
+>#?$0H`esH#Rjd6Xa\LD[d%/2(gdH0JG17+>#B)/i5790JG1'/M\q4+@TpgE-+-7Fa.hF%14sI
/ibU>0JG1'3%d$H0JG17+>>E%+A$TbCgh3l3^[h+CCLV.1G1I>0JG17+>ti-2)$^<0H`&%0H`r-
ASbdmA3*,$@Vfar%14sK/i#@>0JG1'3A*!C0JG17+>>E%+A$TbCgh3l3_*UpG@>b+$8jRk2E*<D
0JFV//iGL>0JG1'0J5%%8TJBY@;]U:9PJ?TEbT$!%14sJ/i#:<0JG1'2_Hg=0JG17+>>E%+A$Tb
Cgh3l3`fa3ATDC$Eb#Ud0f(F?2_Zp>0H`>8/ho:=0JG1'2D-[+7;O)F@;L*qA8cKL;djPd;djKc
@:X:s%15*J0JtO<0JFV$1H7!G0JG170H_r'/heD:FD,B,E+r`A6"FM?F!*bX@:EXS$8"+j/het5
0JG1'2*!9C0JG170H`2)0H`hnChmiqDIak]Et&I.0fCX<0JG170H_r%2`WKE0JG170H_r%1+k7'
7VQUO+A$V`$8sRj0f(L;0JFV$1,U[<0JG170H_r&/heD;Bl7`qDIbe!AScF%DJNqq$8sjr3A<-@
0JFV$1,gg>3&!$?0H_r&/heD;Bl7`qDIbe"DIIR"%15!N/het50JG1'/M]191c$g>0JFV$1+k7'
7VQaV@;]U::N^Jr%15!J/i>F=0JG1'/M]+72`39C0JFV$1+k7'7VQaV@;]U:<+0W_ATD>k$8sRj
1c6s@0JFV$1,:I;2)$^<0H_r&/heD;Bl7`qDIbe-F`M8?%15!L/ho%60JG1'/M]%52D?g=0JFV$
1+k7'7VQaV@;]U:<afEX@1<Q#2_HpH0JG17+>>E*1GCL:0H_r%/heD;Ea`iqANE+pB4Z+)%14pK
/iYX@0JG1'0J54A0JG17+>#<#0H`i*@;]Rd3^Rb*A7]1lGRY!:3%d!H0JG17+>b].0JG170H_r%
/heD;Ea`iqANE.uATMr&$8jLi3AiKE0JFV$0ePFE0JG17+>#<#0H`i*@;]Rd3^[=l@;0cl$8aaq
2E*<D0JFV(/i>UB0JG1'/MSk3+@^B[DI[6=6YL%O@W-C0B+52)3A*<I0JG17+>#<#0K:a?0JFV$
0eP.&7WMpT@q@\hBk;7&AISu'2_HmB0JG17+>#H'0JbC:0JFV$0eP.&7WMpT@q@\hBkhR(%14pL
/ho=>0JG1'2(ggC0JG17+>#<#0H`i*@;]Rd3_+4%DJs!#AISu'3%d0F0JG17+>#N)2`NKF0JFV$
0eP.&7WMpT@q@\l@:s^oDIIYs$8aaq2)$^<0JFV$0J5(60JG17+>#<#0H`i*@;]Rd3_X*-87?[^
AISu'3%cm=0JG17+>#9"1,(C90JFV$0eP.&7WMpT@q@\pAKX]UDK?6o1c6mF1GCL:0H_r%/i#:<
0JG1'/MSk3+@^B[DI[6=9PJ?^B4Z,n$8aUm2`EEE0JFV$1bLaD0JG17+>#<#0H`i*@;]Rd3_Xg;
D@Hq01G1I;0JG17+>#H'1H.!A0JFV$0eP.&7WMpT@q@\q@<-F#Bl%Ts%14pP/ho+80JG1'/N,49
3&!$?0H_r%/heD;Ea`iqANEOsFF"B'1cR*F2)$^<0H_r+/i5OA0JG1'/MSk3+@^B[DI[6=9lFih
BOtmp%14pO/iPI<0JG1'/N,4:0JG170H_r%/heD;Ea`iqANERpDI[r$$8a[o1,CU<0JFV(/i>UB
0JG1'/MSk3+@^B[DI[6=:18$^ATJ:f1c$aC0JG170H_r+/i#@>0JG1'/MSk3+@^B[DI[6=:2+3L
%14pO/iYdD0JG1'/M\q71GCL:0H_r%/heD;Ea`iqANEXrEbTS($8aaq1,Ua>0JFV$1bLI<0JG17
+>#<#0H`i*@;]Rd3`9O'D0$-n1cR*B0JG170H`)&2E*<D0JFV$0eP.&7WMpT@q@]!ASuBsEt&I5
3A*-E0JG17+>#<#0K:a?0JFV$0eP.&7WMpT@q@]!DfoW/%14pO/i#==0JG1'/N5:=1GCL:0H_r%
/heD;Ea`iqANEcSCh7[0@<;qc1cR*F3&!$?0H_r+/iPXA0JG1'/MSk3+@^B[DI[6=;fm%gF(0'1
Eb>gg1c$aC0JG170H_r%/i5L@0JG1'/MSk3+@^B[DI[6=<,ZnqDfp,4%14pP/hf(80JG1'/N5:B
2)$^<0H_r%/heD;Ea`iqANEn,F)to0@W-C0B+52*0ePIG0JG17+>#T+3&NBD0JFV$0eP.&7qH^X
@;^?O6#:.ECh*t^2)6dA0JG170H_r%1G1L?0JG17+>#<#0H`ksEc#6&Gre9'EboH-%14sH/iPR?
0JG1'/N5::0JG170H_r%/heD<ATDWrDL"90Df0G%$8jUl0K:a?0JFV$3%d0E0JG17+>#<#0H`ks
Ec#6&Gre94ASl!r%14sI/i>F=0JG1'/N5:=2)$^<0H_r%/heD<ATDWrDL"92DfTr:F`(_!$8jOj
0JtO<0JFV$0f(F@2)$^<0H_r%/heD<ATDWrDL"92Eb0<&ASqqa2)-^=1,(C90H_r*/iPaD0JG1'
/MSk3+@g!`D..=-3^e+3F(K/uDfTG!$8jLi0eb:80JFV$3%d*K0JG17+>#<#0H`ksEc#6&GreE8
@;]jmF`MR5$8a^p0JG170JFV$2_I'K0JG17+>#<#0H`ksEc#6&GreE8ASGUrEb>gg2)?jB2)$^<
0H_r%0J5%50JG17+>#<#0H`ksEc#6&GreK)D.7X.B+52*1+k@B0JG17+>#T+2`!-A0JFV$0eP.&
7qH^X@;^?O87?CRDg#]4%14pP/het50JG1'/N>@>0JG170H_r%/heD<ATDWrDL"99@<-1*Ecl&,
%14sH/i,7:0JG1'/NGF@0JG170H_r%/heD<ATDWrDL"99@<6L$C^g_/1bLR?0JG17+>#<%/ho.9
0JG1'/MSk3+@g!`D..=-3_O0uC^g_/0eP7<0JG17+>#<'/i,:;0JG1'/MSk3+@g!`D..=-3_X+!
E-c52%14pO/ho.90JG1'/MSt42)m9D0JFV$0eP.&7qH^X@;^?O9m(>`BOu&j$8aaq1c6s@0JFV$
0ek:73&!$?0H_r%/heD<ATDWrDL"9<F`M&2@V'Rm%14sJ/i5790JG1'/MT%60K1[>0JFV$0eP.&
7qH^X@;^?O:iCGsA79<a$8aaq0JP780JFV$0et@91,(C90H_r%/heD<ATDWrDL"9@AS5RlF(094
B+52*1bLL:0JG17+>#<'/ho4;0JG1'/MSk3+@g!`D..=-3`9m;FDkZ)%14pO/iPaD0JG1'/NGF=
0JG170H_r%/heD<ATDWrDL"9AFEM\IB45h&%14pP/iYO=0JG1'/NGFD2)$^<0H_r%/heD<ATDWr
DL"9EF`Me;F`M+($8XXo0JG170JFV$1,COA1GCL:0H_r&/heD<Eb/flANE,!BOu(&%14pG/iGL>
0JG1'/M](63B&WG0JFV$1+k7'7ri0P@q@]#BOu7+@;Kk"Bkq,d$8O@h1,Ua>0JFV$0ekL;0fUj@
0JFV$3%cm-88iBY+A6WjB+52)2_HsA0JG17+>#<./het50JG1'/MSk3+@pWmB45h+3^Rt"@;oe!
F:AR80eP1<0JG17+>PZ(3B&WG0JFV(/heD>@qBIbDIbe+AU/'+@<Q@#%14gF/ibjE0JG1'/N5U@
2)m9D0JFV$2(ga/8T&'Q@6-_`DJ*BoDfTCu$8FLm3AW?C0JFV$2_m!F2)$^<0H_r)/i=bCDIdHi
3^Rb%@UXNk$8O@h2)m9D0JFV$3&iNH2)$^<0H_r)/i=bCDIdHi3^[=l@s)m8@1<Q!2D-sK0JG17
+>#N0/iYX@0JG1'/N#.<+A$H]Bjj%p@;0\'EX`@11G1@@0JG17+>#Q,/i,180JG1'/N#.<+A$H]
Bjj%s@:XCeEt&I33%d!G0JG17+>#N2/i#190JG1'/N#.<+A$H]Bjj%tATo7bASc$o%14gL/i>RA
0JG1'/N5I<3B&WG0JFV$2(ga/8T&'Q@6.5'Df/tm$8".g0f(L;0JFV$0ebL<2`39C0JFV$2_Hs1
8T&'WDImm'@6-ek@;B:lFC>Uc1GCF;1GCL:0H_r(3%csD0JG17+>#B%2'>J2@;\+l@UWeUD@Hq/
1bL[D0JG17+>#H)/ibdC0JG1'/Mf":+A$T^DE:X;D%-h.2(gdF0JG17+>#H*/i5@<0JG1'/Mf":
+A$T^DE:a.BQ@O!%14mI/i,:;0JG1'/Mo::1c$g>0JFV$1G1@(8TJ6Z3^R7fBOkO^%14mH/iYU?
0JG1'/Mf493B/]H0JFV$1+k7'8TSo\ASaCu@;0=^%14mG/iPaD0JG1'/Mf7:1,:O;0JFV$1+k7'
8TSo\ASaD"ATDp7@;KLl%14mH/hf7=0JG1'/Mf492`EEE0JFV$1+k7'8TSo\ASaD,AS`JTG%l+/
$8aIi0ek@90JFV$0fCXD2_Zp>0H_r%/heD>FCB!23^R7qBakD*3A*'B0JG17+>#T+0f(L;0JFV$
0eP.&8T\BWGre<$B5D9jEbPsi1c$aC3&!$?0H_r%0eP4=0JG17+>#<#0H`r/@;L3M7Vm!`ASu!h
%14pH/i5L@0JG1'/MT+82)R'A0JFV$0eP.&8T\BWGreE5B4kpe%14pK/i5790JG1'/N>@C1GCL:
0H_r%/heD>FCB!23_*b!Dda(^1c6mB2_Zp>0H_r-/i#+70JG1'/MSk3+A$Z`CjA'9Bl%3q%14pG
/iYX@0JG1'/MT(71,Ua>0JFV$0eP.&8T\BWGre]/E,9*,%14mN/ho.90JG1'/MT%61H7'B0JFV$
0eP.&8T\BWGrec1Ch7X(D[d%11G1UA0JG17+>#<%/i5790JG1'/MSk3+A$Z`CjA'<Bld\l$8aRl
0JtO<0JFV$0et@=2_Zp>0H_r%/heD>FCB!23`9[/Bl7Vo$8aIi3&iTG0JFV$0et@=0JG170H_r%
/heD>FCB!23`9m5AISu'0J51@0JG17+>#<,/i#:<0JG1'/MSk3+A$Z`CjA'@@<,doFDhTq1c6m>
2_Zp>0H_r+/iGXB0JG1'/MSk3+A$Z`CjA'@F`M26%14pL/iGR@0JG1'/MT%62`NKF0JFV$0eP.&
8T\BWGreoFBk;@-AISu'2(g^A0JG17+>#<'/i,:;0JG1'/MSk3+A$Z`CjA'BASu3lAISu$3%cm=
0JG17+?)530JG170JFV,/heD?@;TFe@pofR1Gpd=1GCL:0H_r%1GpdD2)$^<0H_r-/heD?@;oXm
3_Oa:FDhTq1Gg^B2_Zp>0H_r%1GpdB0JG170H_r-/heD?@;oXm3_sg*CLIYZ1GpdD0JG170H_r%
1H@'H2_Zp>0H_r-/heD?@;oXm3`L$5H#F-!/Mo(62_Zp>0H_r'3A*3K0JG17+>#B%0Ha#"DL#YO
9lFlX@<6Ku%14[A/i#C?0JG1'/Mf:;3&<6B0JFV$1G1@(94`!d@6..lBl\-$BakD,2D-sK0JG17
+>#?*/ho.90JG1'/Mf"5+A?3cG%kAG;JBcP%14mI/iYdD0JG1'/Mf7:1cI*B0JFV$1+k7'9P%[A
DJsDR6=jkOF`\'"0fCX<0JG170H`8//het50JG1'1bLI)9P%dZ@<,m$8TP=J1c[0H1,(C90H_r*
/ho.90JG1'/MSk3+A?p&ASkmpF`M+U9QbSkD.7F+Eb>gg1G1C<0JG17+>#<%0ePC=0JG17+>#N)
2'>V%CghU1Bjj%qF^])p+A?opE-611$8F.h1GCL:0H_r%0Jb=@1GCL:0H_r+/i=bG@;K@tF(o&D
;e^,^@;p.*AISu$1bLI90JG17+>tr,0JG170JFV+/heDB@<-I(DJ=*5AISu$2D-sH0JG17+?;G7
3AW?C0JFV-/heDBAU%p!D`U0o@;p@*@rDe`0f^jC1,(C90H`A9/ho:=0JG1'2D-[+9kAQ`@rFD&
AU%p!D]hD]FEn<&1,pm?0JG170H`)/2D-[;0JG17+>GT'0Ha)(A9VI-+A$V`$8jLi1G^^=0JFV$
0ebL<1c$g>0JFV$2_Hd,9lFo^Des,r3^IS(@;[2SF_kK!%14pN/ibU>0JG1'/MSq;/iYdD0JG1'
/N5:9+AHclB5_U#@6.D)@:=$r6=F;E@<)ea1c$aC1GCL:0H_r+/i5=;0JG1'/MSk3+AHcl@:O4:
9lFokAKX?KEboY'$8XCh3&30A0JFV//het50JG1'0J5%%9lG&j@q/q.9jr'_@;BFaBFP;)2(ggI
0JG17+>kc21GCL:0H`&%0Ha).Ec5GtD`Uj+DJ*O$%14jL/iPI<0JG1'/N>U?1GUX<0JFV$2(ga/
:1\BQCcY3tFDYH(A9A=g2)6d?2)$^<0H_r(/ibU>0JG1'/MSk3+AQKiBOu4#@;]Us3^IV(FCfK'
@;QG\2)6d>1,(C90H_r)/ibdC0JG1'/MSk3+AQKiBOu4#@;]Us3^I^rCh.I&Ec)<n2)$XB2)$^<
0H_r)/iPI<0JG1'/MSk3+AQKiBOu4#@;]Us3_a$kF*)G:@q]rn$8jOj3&<6B0JFV$2(gjI0JG17
+>#<#0Ha,%FD,6+Cgh3lF#m'1C2INpASqqa2)-^D1,(C90H_r(/i5OA0JG1'/MSk3+AQKiBOu4#
@;]Us3`9m<FCfK'@;QG\2)6d<3&!$?0H_r(/i#@>0JG1'/MSk3+AQKiBOu4#@;]Us3`Kd(+@opR
F_)!h/MT+80JG170JFV$0fD!D0JG170JFV$0ek:7+AQKl+@p'QEbT&qEt&I.1H$jG1,(C90H_r%
2`*-G2)$^<0H_r%1+k7':1\Vl>%M,Y@;]U:6$6[QCgh3l%14[D1G1OB0JG17+>#<,1+kID0JG17
+>#<'/heDCATo8#ARTC`DIbdqBQ@g.FCT!,Earbl$8"(l/iYdD0JG1'/MT1</i>=:0JG1'/MT"5
0Ha,%G9C(#@;K@iA3*,$DIm?mD@Hq)1H-pF2_Zp>0H_r%2`33D0JG170H_r%1+k7':1\Vl>%M,Y
@;]U:87?@LCijT5%14[D2D-gB0JG17+>#<+3%d!E0JG17+>#<'/heDCATo8#ARTC`DIbe"DK]T3
@psCjBl%Sp$8"%o/i5OA0JG1'/MT1B/ibjE0JG1'/MT"50Ha,%G9C(#@;K@iA3*IoE+rm(%14[D
0eP790JG17+>#<,1G1FB0JG17+>#<'/heDCATo8#ARTC`DIbe'AScF+D@Hq)1H@'A2)$^<0H_r%
2`*-@2_Zp>0H_r%1+k7':1\Vl>%M,Y@;]U::1\Vl:i(DoDfp/8%14[D1bLRD0JG17+>#<,0eP4;
0JG17+>#<'/heDCATo8#ARTC`DIbe-Bl.:!FU\[01bgU<3&!$?0H_r%2`*-G3&!$?0H_r%1+k7'
:1\Vl>%M,Y@;]U:=(Q2aBl7R*Df-!k2D-gD0JG17+>#B%1cI*B0JFV$0eP.&:2+?PEbSrC9OVRP
Et&I70J5.@0JG17+>#H'1G^^=0JFV$0eP.&:2b/s@<jn#ATDEpD@Hq23%d$D0JG17+>#<,/i5=;
0JG1'/MSk3+AQiqG@>bX:180dBkn.b2*!9L1GCL:0H_r%0J5:A0JG17+>#<#0Ha,/Ed(r;3_sg5
D[d%23%d3M0JG17+>#H'2`39C0JFV$0eP.&:2b/s@<jn4FCB?$B4Z)m$8sms2_Zp>0JFV$0f^j?
0JG170H_r%/heDCDfU&1GreoFDf'Rj%15!L/iGC;0JG1'/MSq31H7'B0JFV$0eP.&:2b/s@<jn5
Ec5i+BOtmp%14jI/iY^B0JG1'/N,O?0JbC:0JFV$2(gR*:gn-RF*(i.3_Nn%@:Ntb%14mG/i>RA
0JG1'/N5L=1H.!A0JFV$2(gR*:gn-RF*(i.3_WsqDfTCu$8""j/i#:<0JG1'2)d-G2_Zp>0H`2)
0Ha2#Ea`U'@<jn"F*2A1Bl@ku$8!tf/ho%60JG1'2`E?C2)$^<0H`5*0Ha2'EcjE:Bl.8f$8FFk
1bpa=0JFV$0etF82DQs?0JFV$3%cm-:hXQZBlJ$*DImlM6=FMLBl=Ff0f1L@0JG170H_r%1,(=@
3&!$?0H_r,/heDEBPD9sE,]N/ATKn,@;]dq@1<Pq1,U[<2_Zp>0H`)+0J5(60JG17+?1u-+Acco
@ps(lDBMMl%14sL/i,F?0JG1'/MT4;2D[$@0JFV$0eP.&:iC/YDIbduA79@sCCLV.0J5%:0JG17
+>#<./ib[@0JG1'/MSk3+Acum@;]U:96+HVDg)Wt2)-^C1,(C90H_r%3A*-I0JG17+>#<#0Ha21
Cgh3l3_XI&H4:3=1+k=>0JG17+>#?'/het50JG1'/MSk3+Acum@;]U:=(-,j@<W.f1H7!G1GCL:
0H`A.0f(L;0JFV'/heDEDfTrBB45U;9PJQWDf-!k1bgU;2)$^<0H`>-2DQs?0JFV'/heDEDfTrB
B45U;;"SdMD[d%.3%cm=0JG17+>u,10JG170JFV+/heDJ;aEH@F_,T8D]hql@rDe`1c?sD1GCL:
0H_r&2D.!L0JG17+>#?$0Ha83D..<r@6-_`@psKh$8aRl1bpa=0JFV$1,^a>1,(C90H_r&/heDG
Df&p#Bjj%hF^o)nEb0<6%15!M/i>F=0JG1'/Mo.62E*<D0JFV$1G1@(;K[&%Bjj%gEbf>sDJ*Ns
-Za&4$8aFh1H.!A0JFV$1c[0J3&!$?0H_r'/heD6H=_,+@<lC0@;\+m@;Bup$8aLj3&iTG0JFV$
2`*-G2_Zp>0H_r*/heDGF`VV<@6-kuF`)M:%14sJ/i,180JG1'/MSq9/i#:<0JG1'/N>@:+B!?'
F(o&D8TJThFE;4,$8jLi0JG170JFV$1H$j@2)$^<0H_r'/heDGF`VV<@6.%p@<*`2DfuQs2)$X>
2_Zp>0H_r'0J51A0JG17+>#B%0HaA2Ea`["ANEIuATeLi1c[0J1GCL:0H_r&1bLI90JG17+>#B%
0Ha89F)u&(3_UoEDfuQs2)?jE2)$^<0H_r&2_HsA0JG17+>#B%0H`]-ASc:*F`VV<@6.+sDKBS&
$8j[n2`39C0JFV$1H-pD3&!$?0H_r'/heDGF`VV<@6.,$F(9-4%15!Q/ibmF0JG1'/Mf180f(L;
0JFV$1G1@(;K[&%Bjj%sF`M>-DKBS&$8aXn2)$^<0JFV$1GCF?2_Zp>0H_r'/heDGF`VV<@6.1p
ATMp$%14sM/het50JG1'/N5I<1H.!A0JFV$2D-[+;K[&%Bjj%uD0'J%$8X[p2E!6C0JFV$2E!0J
2)$^<0H_r)/heDGF`VV<@6.=qD..I#@;]Tb$8aRl2D?g=0JFV$1G^X@1,(C90H_r'/heDGF`VV<
@6.=uG%#H6DfBW2-OgD?1bLaC0JG17+>#B)/hf4<0JG1'/Mf"5+B!?'F(o&D;f-GhASuR)%14pO
/iY^B0JG1'/M].82E*<D0JFV$1G1@(;K[&%Bjj&$FCB'$F)59.%14sQ/ib[@0JG1'/Mf(51bpa=
0JFV$1G1@(;K[&%Bjj&$F<FCkFCfK6@Wc^(%14pH/i#@>0JG1'/N,UA1,:O;0JFV$2D-[+;K[&%
Bjj&%@<6*tASuT!$8aIi2_m'@0JFV$1c-gE0JG170H_r(/heD<AT)U%Bjj&%@VKXmF(l'j2)['E
0JG170H_r,2(gRB0JG17+>#N)0Ha89F)u&(3`L$7F))3l1cR*H2)$^<0H_r(1bLX>0JG17+>#E&
0Ha89F)u&(3`^08B45Fn@:TfS1c$a=2)$^<0H_r%1GLLA3&!$?0H_r%0J5%%;K[&%Bjj&'Cggjg
G&MGDDefdh/MT(70JG170JFV(2_cp=0JG170H`))/heDH@;Tpk+A$V`$8OFj2Dm0B0JFV$1c?sF
2_Zp>0H_r'/heDH@<H*p+@1$V@VK736#n)GBmF,t%14gH/iGL>0JG1'0fL^A2)$^<0H`&%0Ha;*
DImHhCcXsmCLM5m$8"+f0JG170JFV$2)R!?0JG170H_r(/heDHAU.d!ASc0oF!+%q%14[H/het5
0JG1'/MT+A/het50JG1'/MSq30Ha;4Ci=0/DBMMl%14[B3A*$A0JG17+>#?,/i#4:0JG1'/M\q4
+B*3$FD)d_Ao_Tq@6-_kDe3ctDf0Z.Bl4@e/Mf183AW?C0JFV$0fUdB2_Zp>0H_r&/heDHDfp/8
+@0U[Bk(R46XaqF+B39'D@Hq)1-$sH3&!$?0H_r'0eP.60JG17+>#?$0Ha;4F`_:>6"Y.O@pqDd
F`Lr"D@Hq)1G^X;0JG170H_r&2_I*E0JG17+>#?$0Ha;4F`_:>6"Y.O@pqDe@<6N59Q+fZDf-!k
/M]4:1,Ua>0JFV$1,pm?0JG170H_r&/heDHDfp/8+@0U[Bk(R48oJBODJj$,@Wc^(%14[C1G1[H
0JG17+>#?+/iGC;0JG1'/M\q4+B*3$FD)d_Ao_Tq@6.5'Ec`EmCh\3(@V#uU/M]192`39C0JFV$
1,pmA0JG170H_r&/heDHDfp/8+@0U[Bk(R4:i^,hDfTQ#%14mM/i>F=0JG1'/MT">/het50JG1'
/NGF;+B*3$FD)diDfTDt3`BU.F_hKo1bgU>1,(C90H_r&/ho:=0JG1'/MSk3+B*5fBl5su@<,jh
Ci=3"%14pJ/i#:<0JG1'1+kRC0JG17+>#<#0Ha;5@;0U?6>:7FDda(^1H$jC1GCL:0H`8+1GCL:
0JFV$0eP.&;fH/ZDE:-nA8-?!$8XUn3&iTG0JFV+/iP^C0JG1'/MSk3+B*5fBl5t!DfTB,@UT]Q
1H$j?2)$^<0H`5*1Gpj?0JFV$0eP.&;fH/ZDE::%@WGmnFCB2!$8aFh1bpa=0JFV*/iPO>0JG1'
/MSk3+B*5fBl5t+@:XCmA.8l%2D-pD0JG17+>b]-1,(C90H_r%/heDHE+*Hu3_a%!@:s!X$8aOk
1cI*B0JFV*/iYO=0JG1'/MSk3+B*5fBl5t1@;^0qDId=!%14mM/i5790JG1'2(gmK0JG17+>#<#
0Ha;5@;0U?;e:,dCi!Yl$8X[p1cR0C0JFV'/i5790JG1'/MSk3+B*5fBl5t4@;KLm@qf?\$8FCj
2)R'A0JFV$1GUR?3&!$?0H_r&/heDHF_"ou3_O-pEcc5BD%-h02_I$H0JG17+>#<'/het50JG1'
/MSk3+B*JqA7]X>7rNK\@W-:"%14sM/i>UB0JG1'/MT%60JG170JFV$0eP.&;g2e`ASsP'@;KfS
%14sQ/i,:;0JG1'/MT4;0K:a?0JFV$0eP.&;g2e`ASsP-FDkZ)BQ%^(%14sQ/ib[@0JG1'/MT4;
0f(L;0JFV$0eP.&;g2e`ASsP/E,]l,Cgdb[1cI$E1GCL:0H_r+/i>C<0JG1'/MSk3+B*JuFF%M=
Cgh3l3^R7kAISu'2_HsF0JG17+>#N)2D?g=0JFV$0eP.&;g2qtH=_,5@;]U:6=FqHC^g_.2D.!I
0JG17+>#N)1c$g>0JFV$0eP.&;g2qtH=_,5@;]U:6=k1T%14pM/i#190JG1'/N,492)$^<0H_r%
/heDHGA2/FATDTqDIbduASu(&@1<Q#2_Hd?0JG17+>#Q*1-%$B0JFV$0eP.&;g2qtH=_,5@;]U:
9QaiVEc,Ft$8a[o1H7'B0JFV$3%d'G0JG17+>#<#0Ha;<BlnZ4Ebo0%A3*olEbT#s%14jJ/hf7=
0JG1'/MT"8/i>F=0JG1'/N>@:+B2c`G@>AM<$u*gE+N_m$8".g3&NBD0JFV$1H@'D0JG170H_r'
/heDI@;^C"DJ<N?6t(*YATJtm@;K@\D%-h-3A*3L0JG17+>#T./ho:=0JG1'/N,48+B3&aATTt,
BOPsj%14[B0J5%50JG17+>Gf4/het50JG1'0f(F9+B38sB42oSEt&I42D-sF0JG17+>#<%/i#19
0JG1'/MSk3+B3K$Bldus3`L6>Bla^j1H@'J1,(C90H_r'1+kOB0JG17+>#?$0Ha>;Ebf633^IY!
@<,cc$8aIi0JbC:0JFV$1,pmH3&!$?0H_r&/heDIF`M8/GreN<FCB&rF_hKo0J5%=0JG17+>#B)
/i5OA0JG1'/Mf"5+B<&_DId0:7;d3Y@U`mX$8=(g1,(C90H_r'1+kFD0JG17+>#B%0HaA.@;]Ua
3_NmuE+*Qk%14sO/ho7?3AE311+k:83&WcN+>>E%+B;&q6"4DGA7]=i+B<;nG%G]8BlnV0$8jXm
2)m9D0JFV,/ib[@0JG1'0J5%%<D,A>ASbseF*%iu2)6dA0JG170H`)&3&<6B0JFV'/heDJ90,CR
Ec#N.B4t^j%14sH/iYX@0JG1'0J5(=0JG17+>>E%+B;&q6?6dQBQS01%14sI/i5L@0JG1'1+kFD
0JG17+>>E%+B;&q6?6d]FDkt)$8jOj2)$^<0JFV*/i#+70JG1'0J5%%<D,A?@<,mmAnDJZ2)HpF
3&!$?0H`,'3AN9B0JFV'/heDJ90,FKEboH2Ch4%_2)Hp?2_Zp>0H`2)1c6s@0JFV'/heDJ90,IZ
F_>N!F"Bn(Ch4`-AfsfVD@Hq12(gmF0JG17+>YW*1GCL:0H`&%0Ha@g3^mRnDIRa/B4q_]2)R!G
2_Zp>0H`2)1GCL:0JFV'/heDJ90,RZ@<6("G7=m:0ePFC0JG17+>PQ)1,(C90H`&%0Ha@g3_+")
F^o!(FCfJ%$8jRk0JtO<0JFV(/ho4;0JG1'0J5%%<D,AEE-$5;@qZ;Y2)?jE1GCL:0H`)&2)d3C
0JFV'/heDJ90,aXARoik$8jRk2E*<D0JFV(/ho4;0JG1'0J5%%<D,AHASGXcF*(u6%14sK/i579
0JG1'1+kRG0JG17+>>E%+B;&q9PJZ]Ec>r8C^g_/0eP=;0JG17+>>E&2_Zp>0H`&%0Ha@g3_XI0
A8c>p$8j[n0JG170JFV./i,7:0JG1'0J5%%<D,AHDf0*(DId=!Ed8*$2)?jA2)$^<0H`,'1,Ua>
0JFV'/heDJ90,dUDI[?kF*(u6%14sL/i>RA0JG1'0eP1>0JG17+>>E%+B;&q9ke-KCh7ZsDfTc=
B4q_]2)R!?0JG170H`)&2)$^<0JFV'/heDJ90,gZG@P'&FDPM?F`;8:/Q@"5AISu(1+kI@0JG17
+>#<#1,psA0JFV'/heDJ90,gdEd)5-BFP;+1+kRG0JG17+>GK'2_Zp>0H`&%0Ha@g3_jU8FD5W*
BOP`e$8jOj2`39C0JFV(/i#4:0JG1'0J5%%<D,AKG\1l7A.8l'0J5.@0JG17+>b]*1GCL:0H`&%
0Ha@g3`'X<D/XQ=BFP;+1G1L<0JG17+>GK*2)$^<0H`&%0Ha@g3`B^'AnGagCh*t^2)$XC1,(C9
0H`)&1H7'B0JFV'/heDJ90-!iF`_;*D/aT8D@Hq03A*'@0JG17+>PQ(1,(C90H`&%0Ha@g3`C,C
87cUOATB=oATDj'Gmt*<0eP@?0JG17+>YW12)$^<0H`&%0Ha@g3`C62DKBAt%14sK/ibjE0JG1'
0eP.>0JG17+>>E%+B;&q=`8=r%14[C1bLdD0JG17+>l&00fLd?0JFV*/heDJEa`U'@<jn.Df0Z2
G%kJuD[d%02(gRB0JG17+>GQ./iGL>0JG1'2_Hd,<Du1E6#:"QEHPi5EHPh8:/)0)2DHg=2_Zp>
0H`),3A*9N0JG17+?;&.+B;?+3^IXnBQ%p"B4W2O9+;4a1G1UD0JG17+?2211b^U;0JFV,/heDJ
;aEH1FDPB'FC?:^5n+/W3A**A0JG17+?)222D[$@0JFV,/heDJ;aEH2@;L%"D/XH++AG65$8aOk
2DQs?0JFV(0fCX=1,(C90H`;,0Ha@o5rq>NBldi.8OO!p1bp[>2)$^<0H`;//hf4<0JG1'2(gR*
<Du1E6>ppeDf-[l5n+/X1+kOG0JG17+?)843&`NF0JFV,/heDJ;aEH2F_55oCi:Fk=Ub]p0ePIB
0JG17+?2;42D[$@0JFV-/heDJ;aEH3BPCsbB5\na9FV=b1+kLF0JG17+?;>43&!$?0JFV-/heDJ
;aEH4@;KagF!+Fa%14mO/iPXA0JG1'0ebF:3B/]H0JFV./heDJ;aEH4ASu[&EZd_F%14pI/i,:;
0JG1'3&<0@2)$^<0H`5*0Ha@o5rqDFFE2;6F<F:L%14pH/iP^C0JG1'2_m!D3&!$?0H`5*0Ha@o
5rqPFEcbo3Eb$:[<"00i3A*6L0JG17+?;;31H.!A0JFV-/heDJ;aEH8Dfp,CDf-[s=:GTn1bLI<
0JG17+?2212)R'A0JFV,/heD@ASuBsF('887mRRk1b^O=1,(C90H`>5/ibU>0JG1'2D-[+<Du1E
9OVOEH"D)>AKXQ>%14pG/hf"60JG1'2`<9E1,(C90H`5*0Ha@o5rq\JDI[*rFCfJ8:dGNt1H$j?
2_Zp>0H`))2(gU@0JG17+?(o,+B;?+3_Wt'+BE&d@<3Pd<XfBl2(gjI0JG17+>GQ./i,7:0JG1'
2_Hd,<Du1E9Q+tp6#9tHDf[$r9aqFc1bLI>0JG17+>GT1/i#4:0JG1'3%cm-<Du1E9Q+tp6#L=H
Ch7Z16U;.g1Gpd>2_Zp>0H`A0/het50JG1'2D-[+<Du1E9kA0\BPDN1<)*l01,U[C3&!$?0H`>/
/i#+70JG1'2(gR*<Du1E9ke$QBcol=%14pJ/hf.:0JG1'3&`HM1GCL:0H`8+0Ha@o5rq_SCj0<1
CLq'"8PBR#1c6m>0JG170H`A3/i#:<0JG1'2D-[+<Du1E9keK_ARTOrCh[r59hl-)1H$jC3&!$?
0H`)*0ePIA0JG17+?1u-+B;?+3_aO1FCfK(Gp#I?%14mL/ho:=0JG1'3&WBK1GCL:0H`8+0Ha@o
5rqbLF(f`2Ci!Z*<)*l01b^O@1GCL:0H`;2/ho=>0JG1'2(gR*<Du1E:1\WXEbcdm8du+_3A*<N
0JG17+?;,.0K1[>0JFV-/heDJ;aEH>ATo7mEbo;qDK?po5n+/X0J5:A0JG17+?),00JG170JFV,
/heDJ;aEH>ATo8"DfTV9:0A#52Dd$D0JG170H`).2(ga?0JG17+?;&.+B;?+3_jU1AKX93%14mM
/iYX@0JG1'0etL:1,Ua>0JFV//heDJ;aEH?@;B[fDIakW5n+/W2(g^E0JG17+?;A52)R'A0JFV-
/heDJ;aEH?CM[EmDf&o*6YUXf+AYW>$8aIi1,gm@0JFV02(gmJ0JG17+>ti++B;?+3_sU$BON#Y
64F8Y2(g[B0JG17+>GW,/iGC;0JG1'3%cm-<Du1E:NC#ZDf-[bBlnVC:JqW/1,pmD2)$^<0H`>0
/i,@=0JG1'2(gR*<Du1E:NC8[DIdZ.7SF6u1Gg^=2_Zp>0H`))3%cpC0JG17+?1u-+B;?+3`'7+
@:Wqe@3@p'%14mF/i5@<0JG1'3&`HF0JG170H`5*0Ha@o5rqhRDKB5rDeri)7mRRk1b^O@1,(C9
0H`>8/iGL>0JG1'2D-[+<Du1E:h=QcBji,U9FV=c0J5%50JG17+?)/10fLd?0JFV-/heDJ;aEH@
BPD9kA7]RrBPClt:dGNt1G^X@0JG170H`))1+k7<0JG17+?(o,+B;?+3`'L.ASu4,+@00?$8aFh
1c$g>0JFV/0J5%50JG17+>kc*+B;?+3`'O4FE:o6EbB&.:dGNt1c6mC1,(C90H`)*1+kIE0JG17
+?1u-+B;?+3`'a8FDPB'A0=ZG%14mM/i>RA0JG1'2`E?G2)$^<0H`5*0Ha@o5rqnX@q]^tDIakj
5n+/W2_HjC0JG17+?);53B&WG0JFV,/heDJ;aEHBDddO%CLnVh5n+/W3%d'E0JG17+>GW+/i>=:
0JG1'3%cm-<Du1E;dj0V@;TRnFDi9h5n+/X0J5:A0JG17+>GT*/ibU>0JG1'2_Hd,<Du1E;djKa
+A?3ZAKX?SFEo!/<"00i3A*-D0JG17+?;D62)$^<0JFV-/heDJ;aEHC@;[2RDKKf7Bl>+n=:GTn
1+kLF0JG17+>GT0/hf4<0JG1'3%cm-<Du1E;djPd6tp4FD]hD5%14mM/iP^C0JG1'0etL:1c$g>
0JFV//heDJ;aEHC@;[2WEa`iqBldd&+@AF($8a[o2D?g=0JFV(1,:I<1GCL:0H`>-0Ha@o5rqqU
@<?U-AKY&?%14pN/iGXB0JG1'0ekU>1bpa=0JFV//heDJ;aEHCE,TN#DIjql5n+/X1G1@=0JG17
+?)220fLd?0JFV,/heDJ;aEHCH#d>'F`V+::0A#51GCF<1GCL:0H`>3/i,7:0JG1'2(gR*<Du1E
<+0TZ@;'(jF(Jo*7SF6u1,ggG2_Zp>0H`>1/iGL>0JG1'2(gR*<Du1E<+0W_@3A$5%14mO/hf(8
0JG1'3AiEI3&!$?0H`8+0Ha@o5rqt`E+Nfn+A5WB$8XFi1,Ua>0JFV(0ek:71GCL:0H`;,0Ha@o
5rqtf@rlR++@00?$8XRm0etF:0JFV02(gmJ0JG17+>ti++B;?+3`L6<F($1e9+;4d0eP180JG17
+>G]2/i#C?0JG1'3A*!.<Du1E<affTAU5Ib9+;4a3%d3F0JG17+?)530JY=90JFV,/heDJ;aEHG
@<6*rDJ+'0DBM>7%14mK/iG[C0JG1'3B&QH1GCL:0H`8+0Ha@o5rr(]@q]Ru@3A3A%14jI/iGR@
0JG1'3&*$A0fC^>0H`5*0Ha@o5rr(G:`r5$%14mI/ib[@0JG1'3B/WK0JG170H`8+0Ha@o5rr(]
@q]Ru@3A$JCi"/8<*0S:0eb4;3&!$?0H`83/ib^A0JG1'1bLX.<b6/[H?Ee8@6-baEa`HdEt&I2
2D-[B0JG17+>#<%3%csA0JG17+>#N)0HaD1ATVctDE:0o+AQ?_B+52'0eP.80JG17+>#<%2(gjI
0JG17+>#N)0HaD1ATVfuD)t3rDJs4u$8F4e2`39C0JFV$0ebL<2E*<D0JFV$2_Hd,<bZ,eDIIBC
;djBQDf.-oBQ%^*D@Hq-3%cm=0JG17+>u)00JG170JFV+/heDKBl[j#DBMMl%14pI/iGXB0JG1'
/MT4;0etF:0JFV$0eP.&=`n@qF)59.Bjj%jF^fB0G&D#0%14pJ/i,:;0JG1'/MT1:3&<6B0JFV$
0eP.&=`n@qF)59.Bjj%sDf^#/EX`@41G1XG0JG17+>#<-/i5@<0JG1'/MSk3+B`i"Df]`'G%kAG
;dj]TC1VR,%14pJ/i>C<0JG1'/MT.91cI*B0JFV$0eP.&=`n@qF)59.Bjj&$E,961%14pL/iYO=
0JG1'/MT+83B&WG0JFV$0eP.&=`n@qF)59.Bjj&+@:sUl@LWYr0f:R?1GCL:0H_r&3%d!C0JG17
+>#?$0HaP-D.73f3_X[;@;B9\$8""e/ho:=0JG1'/M]:<2_m'@0JFV$1+k7'>%qh_@:FFl3^Rt*
@<Z.*D[d%*0fUdG1,(C90H_r&3A*9K0JG17+>#?$0HaP5D.6p_G@`g4F_)[mF_)!h3A<'>0JG17
0H`&%0JG170JFV'/heDCDfTr5+AcumAIStu3A<'>0JG170H`&%0JG170JFV'/heDHDfp/8+Acum
AISu'1bLRB2E!KJ+>u&/2).!I2_Z@2/heD8@;]La@6-_qBk1jfG@>T)EZe+U%14sM/i5790JG1'
/MSq31bpa=0JFV$0eP.&6tL7Q@<--E:Ln$SF(Gdf1c-gF2)$^<0H`80/iPLC2E*<41bLI)6Xak@
A77McARTanEaiHpCEQAN%14pM/ho%60JG1'2D?a<2E!HP0H`2)0H`_kDII'a3`C<7DIn)9:/_T/
1c$aD1G^gC0H`83/i#CB1G^^-1bLI)6Xak@A77N%@<-4'F`_:>:/_T/1c6mA2E!HP0H`80/i#CB
1G^^-1bLI)6Xak@A77MuEclD@+APiE$8aUm3&<?H1GBq01bLLB1G^g@+>b])+@BRT@:We-6#C:H
EcZ=F:/_T/1c6mD0fCpK0H`8//het50JG1'1bLI)6Xak@A77MbDKKT*Df091BHU&K%14pL/iGC;
0JG1'2Dd$H3&<?H0H`2)0H`_kDII'a3_"70A9f:m@<=+E:gnB[+AP64$8aUm0K(gI2_Z@41bLX>
0JG17+>b])+@BRT@:We-94`!_G%kc/AKX`H%14pL/i>UE1G^^-2DQmC2)$^<0H`2)0H`_kDII'a
3_j71+@g6VF(]E8+APiE$8aLj2E3KK1GBq20eP7<1G^g@+>b])+@BRT@:We-7VQaQ@;I&^:(7Oe
1G1[D1G^g@+?)843&NBD0JFV,/heD8@;]La@6.2*BOQ*n+AY`A$8aRl3AiKE0JFV-1bLI<1G^g@
+>b])+@BRT@:We-;fjW76ZR*ZGT]dkF"SS1;[j'g3A*9I1G^g@+>G`2/i5IE2E*<40eb46+B;?+
3_a%*DIFY\ARQ]P8IZ"`3%csE2E!KJ+?)&.2).!I2_Z@3/heDJ;aEHCFCf9)@:iqcAKY#Q%14pK
/i>=:0JG1'3%us@3&<?H0H`5*0H`_kDII'a3^[h%Ch[d"GAhD1+AY`A$8aRl0K(gI2_Z@60J5=@
1G^g@+>kc*+@BRT@:We-;flGgAn?%*+AY`A$8aOk1H70H1GBq13A*<H2E!KJ+>kc*+@BRT@:We-
=(-2^Eb'*4DBM_M%14pJ/iYaI2E*<42`WKI0fCpK0H`5*0H`_kDII'a3^dD"Bk/>SF`)#(E$.qc
F"SRE$8""n/het50JG1'2_ZjC0JG170H`2)0H`_rBl%?A9OVub6XahN@;]Lp+AZHf/e&.E1G1F:
0JG17+?2).1H70H1GBq//heD8@;]La@6-hnB5)6qBk;*k+AZHf/g*qb%14mF/iGC;0JG1'0ebC9
3AiKE0JFV-/heDJ;aEHDAU%X)+B*AjEZe1eEccRL<*0S:2)6d=0JG170H`)(2(gmH0JG17+>ti+
+@BRT@:We-;f$#RAoD^#+AZHf/g+(c%14mG/ibdC0JG1'0ekC82D?g=0JFV./heDJ;aEH;BlnG>
:h='N+@00?$8XOl0fUsF1GBq+0ek:=2)$^<0H`;,0Ha@o5rq\XG@bT,+AZHf+@00?$8jRk0f(UA
1GBq+0ek:>0fCpK0H`;,0H`_kDII'a3^IRkATDm$+B*AjEZe1eEccR9$8XLk1,C^B1GBq+0fCXC
2)$^<0H`>-0Ha@o5rqnXG%G]8Bk1ct<)"K&Df0/>+@AF($8XIj1Gpj?0JFV(0fCXD2E!HP0H`>-
0Ha@o5rqhNCi=0!EZe.eF"SS&5n+/X3A*$@2E!KJ+>GT2/iPRB1G^^-3%cm-6Xak@A77MnDfor>
+A6W^@<E\Z6OaAS1-$sB2)$^<0H`;./iPRB1G^^-1bLI)6YL1MANE8&Ec5o.@;[2d/g*r!Et&I5
2(g[B0JG17+?)/13&i]M1GBq//heD8@;]La@6.>(@<-H4;e'`bAKXcXF"Rn/1c[0H2)$^<0H`)(
3A*0D2E!KJ+>ti++@BRT@:We-;c?Uk+B(oB$8aUm0JPID2_Z@41G1[G2E!KJ+>b])+@BRT@:We-
:2b;a+@T^[F<F=W%14pK/iP[H2E*<42DZs@0JG170H`2)0H`_kDII'a3_aa<EHQ21DdmX!F<F+`
EX`@41bLO>0JG17+?)221c[HP2_Z@3/heD8@;]La@6.%qDJ+$4Df-[n:(7Oe1G1ID0fCsE+?);5
3AN<I2_Z@3/heD8@;]La@6-qfD/!g.Df-[n:(7Oe1G1RA1G^g@+?);53A<-@0JFV,/heD8@;]La
@6-niDfTK%FDlA@+AY`A$8aRl1H7?M1GBq12D-gF1G^g@+>kc*+@BRT@:We-8T&]_Eaa!6+AY`A
$8aRl0f:aC1GBq12_HpC1G^g@+>kc*+@BRT@:We-6=jtLAThd(Ch4_b:(7Oe1G1C91G^g@+?);5
0K1^E2_Z@3/heD8@;]La@6..t@:s"h@3A$JCi"/8:JM?+1c$a@1H%-M0H`>//i>CA0JG1'2(gR*
6Xak@A77N#@<?($Ci=57:JM?+1bp[D2`!6G0H`>1/i57:2E*<42(gR*6Xak@A77Mt@<-7"@3A?@
%14pP/ib^I1G^^-0ek[@1H.9L1GBq2/heD8@;]La@6.%mCi=N8@3@m(%14sK/iYgJ0JG1'0etL:
2E*KI0JFV//heD8@;]La@6.5*Bl7El+@g!]EbAr+6:21h1c-gC0JG170H`82/iPXA0JG1'1bLI)
6Xak@A77MeBkLn#+APiE$8aRl0JbL@1GBq01bL^A2E!KJ+>b])+@BRT@:We-9PJZ]Ec>r8C`lJO
%14mJ/het50JG1'3&*$>1Gpj?0H`5*0Ha@o5rqAOCisT(Bji,_6OaAY2(ggH0fCsE+?)842D[<K
1GBq//heDJ;aEHB@;KLhB4rD_6OaAY3%csD1G^g@+?2522`3QN1GBq//heDJ;aEH<Dfoc8G%kc/
AKXWK%14mO/ho7=2E*<43&E6E2)[?O0H`5*0Ha@o5rqAIDI[BuDIIX$+AYN;$8X[p3ArQF0JFV/
1G1@80JG17+>kc*+B;?+3^[h%F_tT1F!+7L%14pG/i#@A1G^^-2`<9J3&NBD0H`5*0Ha@o5rqPF
EcPl8@Wc^(+Ab?5$8XXo1Gpj?0JFV/0eP@?1G^g@+>kc*+B;?+3^[RhEbo<.FDl%>=&ob;1bp[A
2)@$E0H`;1/iPXG2E*<42(gR*<Du1E6#:"=DL!@"=Ub]p0ePF@1G^g@+?)#-1cI3H1GBq//heDJ
;aEH@Ec6,8A7]XgAKXlB%14pK/iYO=0JG1'2E3<J2`NTL0H`5*0Ha@o5rq>@DJ*m.+AG96$8aOk
1,([D1GBq10eP=>3&<?E+>kc*+B;?+3^[h'@rHBu+APH:$8aOk2E!9J2_Z@50J5+<2E!KJ+>kc*
+B;?+3`'a8FDPB'A0=T8%14pK/i#==0JG1'2_m!C2`<QQ0H`5*0Ha@o5rq_YDKKi/Ch[I$+BDGN
$8XFi1-%<M1GBq30J5(>2)$^<+>ti++B;?+3_EgjCNFE3+AGcD$8XIj2)6mE2_Z@62D-sC3&<?E
+>ti++B;?+3^RP$D/!m#BOPa#5th^p1Gg^C1c@6N0H`A2/i#CG1G^^-2D-[+<Du1E9PJTjCh4_e
De!Q*5t_Xo1H7!F1,_$L0H`A0/ho@G1G^^-2D-[+<Du1E;fjW79Q,&fF!+1U%14mG/iPXI1G^^-
3AN3C1c$pD0H`;,0Ha@o5rqGN+AcKfD]i"]%14pG/iYO=0JG1'2`E?I2E!HP0H`8+0Ha@o5rq\R
DI[U$DBM\C%14pM/i>XF1G^^-0ekF90JbR?0JFV./heDJ;aEH8ASbpq@3A9D%14pK/i,CF1G^^-
0eb:61GpmF2_Z@4/heDJ;aEH@Bk;=*AKXo>%14pM/iYOE1G^^-0eb:62`NTL1GBq0/heDJ;aEH2
Ble-"Earl-:.,Nu1H@'F1GCL:0H`))3A*9G1G^g@+?1u-+B;?+3`9O,D]heU%14mJ/ho%>1G^^-
0ekU>1,q6L1GBq2/heDJ;aEHC@;[2SATDZsEb&m%D]hD5%14mL/iPUH1G^^-0ek[@2`EHL2_Z@6
/heDJ;aEH6Eb0<0D]hD5%14mM/i,:C1G^^-0etI93&rcN1GBq2/heDJ;aEHC@;[2[Df]J46U;.g
1,1C;0K(gJ0H`)-2_I'I3&<?E+>GQ&0Ha@o5rqPTDJs?6Cipjk8IZ"b1bLaD3&<?E+>G]3/iPLC
2E*<43A*!.<Du1E7U^"O@UX.iF!*bA%14sP/i,192E*<40f(X=1bpa=0JFV0/heDJ;aEH:F`(c!
FW`tC%14sK/i>L?0JG1'0ekI:1cI*B0JFV./heD8@;]La@6-hfD/X<6Df-[`64F8Y1bL[G3&i]J
+>u#.3&3?N1GBq./heD8@;]La@6-\`@V'g-;JBZSAKXcXF"Rn/1c$aB1c@9N2BX_/2D-dE2*!KL
+?(o,+B;?+3_a1+Bk1pdD@Hq01bLUC0JG17+>GT)/iYUG1G^g02D-[+0JG1A=_2DcDg-8EDf0+q
$8""j/i,=?0JO\%0f(O:0JPRE0d&&./i=b*0JGOfCisc@%14dA0JG170JFV'/het50JG1'0J5%%
%16u]F(&EdAScHs?Z]XlA26(q/M.D=@<H[*DfRl]7P5fPF)Y].@;?;ZA7]glEbTK7Bl@lM+B3#g
F!,1<+AP4$6!PdY+E(k(Bk(jcC`mS5Df-\:BOPsnF!,F1B4W\)$>X3uGAhM4F#kFT@r,juF(HmF
CisW(E\&>MDf9ME+E2"&F(KDD+EMI;@<*nAF*2@O+EVOD@;HA[FD5i5ANCr/5uU&l/KdGmCij).
<"00d/M.D=%14=&>>@I_5p.RN@<?4%DII?(6"P(TDII[0Bk)3,@;]Tu;fH/TAKX9LD/!m%F*)G2
FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6Dg!c_%13OO,9n=?Gp#RsARloPF)Y].@;@D:7oMlE+Acl_
DImouEd8d+H#n(=D0$gn@:F.q@<?F.Gmt)i$6pZaBleB7EbT#lC`lbeCis<1+E(j76tL1V@3AMl
.*e&V.3K',%14=)+@0OHE-,Z%+D,Y4D'3(-7VR$W+AHQdCh7L%Bm"886XakNDBNk0+B*2p@<*JZ
@r,juF(KDt+s:,p7<<EZDII<'@;]Tu9k@mYF'Mun%13OO<+ohcDfT<$FCAu.E,Tf3FD5Z2F!,C5
+EV:.+B*E#+CT.u+AHcmDBNt2EHPu9ARlomGp$[.Ch[j0AISucEb/cq@ruF'DK@?O@<,p%@ps1`
F_kK.ARlp+F(oN)+B2omEb0<6EbSru+@LKm@;T^g@;I&cBl.E(-r`S`%16QU@psM$AKY]/+DGm>
@3B]1BkD:(D'3q7D.Oi2@ps1b/g*]'G@br/E\&>WDfTZ)+EV=7AKZ;;DIml3@;]TuA791gGmt*s
BkCp!@<,p%@UX=hA0>f.+B<;nG%G]8@;I&cBl.E(-rj4q/g*`'+E):2ATAo8D[d%`Df0`0Ec`F8
@r,juF(HJ5Eb/cq@ruF'DK?q4Ec5e;<(%jND]i%Z/0K%JAKYMtAnGUpASu!h+C\o(G@b?'+EV:.
F(GdfFE_XGFD5T'+EM%$Ch7Z1D09oA+C\n)CMn'7DD!&2BOr<*@<,dnATVL(+Co&"FC?b#+=PO"
<%/r(F!,R<AISuTEbTW/D.Rg'@j#;rAnGUpASu!h/0JYE+EM+(Df0*,/0JD5FE_;-DBO%7AKZ)=
D]iJ03XlE*$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VfPPZ/bg+B1`O/Ke%m%13OO
:gnEe+Eh10F_,V:De:-;PZ/c8@;[2sAKYMpA9DBnA0>K)Df$V=BOr<"BleB7EbT#lC`mb0@rHBu
F"SS,D@Hql@<-I(@s)TrE\&>HF`(`1ARoj)De:,'@r,juF(HJ4@WQ+$G%#K,Df0V=-t7+:BHVA7
Cgh?,@;]TuCisW(E[`,TATD>k$?B]fDfTB"A0>T(+D"u%Cj@-lF`MD>ARTI-+AHQ\A8Gg"7:C7Z
ATDZ2@;]Tu6YL1OATME*@;]skCi_-:$>j3hF`V&5BlJ08/0JA=A0>AjDJsE6/g*`'+EML9FCcS5
Afu2/ASH0-Eb0&qFD5o0Cj@.>Dg*=CEb/`pF(oQ1/.Dr.BOu6r+Cno&@3BT%E,oN2ASuT4FD,5.
Df0B:+D#_1A7]XgAKYT'EZfI;AKZ/)Cis;3De:-;PZ/cEEbTH4+EVNE0fC^>%15Hk/g*`'+EV:.
+Ceu#FEMV<ATJu+Des6.GA1r-+EV:.+DG_8Ec5K2@ruF'DBNk0+EV:.+EV12ATM@"E+L.?@qfsn
@1<Pu2D@-66U`FT+EV:8F`Uu/A9/l3Aftc$B4rE-F^]*#FEo!I@WQ+$G%#K,Df0V=BOQ'q+C\nn
DBNe)A7Zm%Afto4DIIPp$?'EaF_l/.FD5Z2F!,C5+EMX5EcWiU<+ohcDKTf*ATAo%DIaku@q0Y%
@:OR*De:,6BOu6r+EV=7Bl7R)+DG_'Eb/[#AISuYEc5e;FD,5.F(KN+DKKH$DKKP7FD,]5F_>A1
FD,5.FE_;6FD5<.BHUerDKL#AGq:(HAnGt%A8,po+Eh10F^\`qAISuW@<>p#Bl5&8BOr;sATVL(
D/!lrFD5Z2+E(j7cBM9\+@.,\ATV?pCh7-"@;]LiH#m\@+E(j7FD,6,AISu`ARTY&Eb0*!DKKqB
Anc@/ARlp-Bln#2@s)6p@j#i3Ch[cuF!,(5EZiYl<$5dnDf$UK2)$^,FDi9P0f_*F+DGm+$?1#s
F(K62ARlotDBMne@VfTu0d'nBA0>T(@r-9uATJu9BOr<-FCB&t@<,m$ATDg0EZet4EZeq%@q[!.
@;L't%14LXDfTl4F)Pq=@;]Tu;flSiBOu(&Df.*K1,(C=.4u&:%13OOIXZ_T$8!h]/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%16'C@VfTu0d&%j<affeATJu4Ag#B`<$3;++<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$:JHGBm+&u
+D,Y4D'2A`F*)>@Bk(Rf+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZUARfY!A9/k9+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$8!h]/M/P+/M/P+/M/P+/M/P+/M/P++>#/s
/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P+%166L@<*J5+<VdL+<VdL
+<VdL+<VdL+<\so<*UOg+<VdL+<VdL+<VdL+<VdL+<Ve*FCB&t@<,m$7<3EeEa0%\+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<VdL+<VdL.!&s0Df0*,.1HV9/M/P+/M/P+
/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=/N#49+<VdL+<VdL+<VdL+<VdL+<VdL0fLgI0H_J\+<VdL+<VdL+<VdL+<VdL1c$fp$8"(g
0H_J\+<VdL+<VdL+<VdL+<VdL+>G`21GBpo+<VdL+<VdL+<VdL+<VdL+>Z#3%14[C0JFUl+<VdL
+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL+<VdL+<VdL+<WHu0F\@@1,(C)+<VdL+<VdL+<VdL
+<VdL+<Vd]1,h3I+<VdL+<VdL+<VdL+<VdL+<Vd_1GB7F/MSq5+<VdL+<VdL+<VdL+<VdL+<VdL
0ekRC0H_J\+<VdL+<VdL+<VdL+<VdL1-%#t$8<SF+<VdL+<VdL+<VdL+<VdL+<VdL+>GQ-3%uHt
+<VdL+<VdL+<VdL+<VdL+>Pi/%14gD0H_J\+<VdL+<VdL+<VdL+<VdL+<W[&0JFUl+<VdL+<VdL
+<VdL+<VdL+<WEr0F\@E0JFUl+<VdL+<VdL+<VdL+<VdL+<Vdd2Dd*1+<VdL+<VdL+<VdL+<VdL
+<Vd^0ea%D1GCL*+<VdL+<VdL+<VdL+<VdL+<VdL2`<WL+<VdL+<VdL+<VdL+<VdL+<VdL0fUir
$8aFj+<VdL+<VdL+<VdL+<VdL+<VdL+>u/40H_J\+<VdL+<VdL+<VdL+<VdL+>Gc.%14sH0H_J\
+<VdL+<VdL+<VdL+<VdL+<WO#0ea^m+<VdL+<VdL+<VdL+<VdL+<WBq0F\@I0JFUl+<VdL+<VdL
+<VdL+<VdL+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd]1,'.E2_Zp.+<VdL+<VdL+<VdL+<VdL
+<VdL1H7*C+<VdL+<VdL+<VdL+<VdL+<VdL0eb9j$90^n+<VdL+<VdL+<VdL+<VdL+<VdL+>Pr8
0H_J\+<VdL+<VdL+<VdL+<VdL+?2%a$99do+<VdL+<VdL+<VdL+<VdL+<VdL+>P]+0H_J\+<VdL
+<VdL+<VdL+<VdL+?(t`$8F4g0H_J\+<VdL+<VdL+<VdL+<VdL+>G`40H_J\+<VdL+<VdL+<VdL
+<VdL+>l"c$8F7h0H_J\+<VdL+<VdL+<VdL+<VdL+>GQ10H_J\+<VdL+<VdL+<VdL+<VdL+>bb]
$8F:i0H_J\+<VdL+<VdL+<VdL+<VdL+?),2+<VdL+<VdL+<VdL+<VdL+<VdL+>Y\\$8F=j0H_J\
+<VdL+<VdL+<VdL+<VdL+>c)4+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8F@k0H_J\+<VdL+<VdL
+<VdL+<VdL+>Yc,+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FCl0H_J\+<VdL+<VdL+<VdL+<VdL
+>PW)+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FFm0H_J\+<VdL+<VdL+<VdL+<VdL+>GW*+<VdL
+<VdL+<VdL+<VdL+<VdL+>PV[$8FIn0H_J\+<VdL+<VdL+<VdL+<VdL+?:Pe+<VdL+<VdL+<VdL
+<VdL+<VdL+>jT80fLsD+<VdL+<VdL+<VdL+<VdL+<VdL0f'pp+<VdL+<VdL+<VdL+<VdL+<VdL
1(=RF3&!$/+<VdL+<VdL+<VdL+<VdL+<Vd]1a!n`+<VdL+<VdL+<VdL+<VdL+<Vd]%14gL2)$-q
+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL+<VdL+<VdL+<VdL+<VdL+<XoO0b"IE3A<-0+<VdL+<VdL
+<VdL+<VdL+<VdY1E[e_+<VdL+<VdL+<VdL+<VdL+<Ve34>@9P0f_*F+<VdL+<VdL+<VdL+<VdL
+<VdL1-$I"+<VdL+<VdL+<VdL+<VdL+<VdL>Wa\m0b"IA/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=IXZ_T$4R>6DBNe7
A7]e!+EV=7ATKCFFD,5.A7]joEc#N.@<?4%DBNk0+O63N+DGm>D.-sd+E_a>DJ()#FDl#1@j#8t
De!R(+CT.u%17,aA8,s)Ddmd!Ectl5Bl@m1+E(j7EHP]2@<-E?+EMHDBlkJ3F!+t2D/a<&FCf96
+DG_(AT23uA7]Y#+E(j7FD,4p$>aj&@<*K%E+ig"ATDL+/g+,%@VfTu1*C4DG%G_;FD,5.G%#30
AKYo'+O63N+D#_-Ed8d>Bm+&1H"CE)F!,(8Df#pj0f_*K+EVNE1,(C>+=KNsFE2;;Df'2u@;I&P
Ci*Tu@:LElDfQsU0JGC9+E1b%AKXW+.4u&:%13OOIXZ`p%14[=/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%d@:F%a+>P&k
+Auc\ASuT4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZY@;L'tF!,C5+O63N
+D,Y4D'0rD+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#6tp[Q@rrh9+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:L\BVEctl5Bl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+
/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/O`$<^qKEZcJI+<VdL
+<VdL+<VfPPZ1m1+<VdL+<VdL+<VdL+<WNn=_2#^+@BgNDJ*Nc+<VdL6$?g[@:s.V%144#+<VdL
+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<W(RARfXrA901B+<VdL+<VdL0eHO>@<*JXBOPdk
AR#ZO+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W(R
ARfXrA901/$8!h]/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+
/M/(s/M/P+/M/P+/M/P+/M/P+%14gM2)R!?+<VdL+<VdL+<VdL.l/n40d%S]+<VdL+<VdL+<Xo@
+<VdL+<VdL+<VdL+<VdL>V-Bl0f_-G/heCj+<VdL+<VdL+<W0j1G1F*+<VdL+<VdL+<VdL1+k:(
+<VdL+<VdL+<VdL+<W?j1boLI0f_-L/heCj+<VdL+<VdL+<W0j2(gg1+<VdL+<VdL+<VdL1+kF,
+<VdL+<VdL+<VdL+<W?j2)#IH0f_0H/heCj+<VdL+<VdL+<W0k0J5+'+<VdL+<VdL+<VdL1bLX.
+<VdL+<VdL+<VdL+<W?j3=Q<M3B&fJ0H_J\+<VdL+<VdL+=f9+/i=ao+<VdL+<VdL+<Vda/i+Um
+<VdL+<VdL+<VdL+>GK&2@U!J3B/]F0H_J\+<VdL+<VdL+=f<'/i=ao+<VdL+<VdL+<Vda/heCj
+<VdL+<VdL+<VdL+>GK&0F\@D3B/lK0H_J\+<VdL+<VdL+=f<+/i+Um+<VdL+<VdL+<Vd_/iXsr
+<VdL+<VdL+<VdL+>>E,2@U!J3B8cG0H_J\+<VdL+<VdL+=f<-/ib$s+<VdL+<VdL+<Vd^/iFgp
+<VdL+<VdL+<VdL+>>E*1(=RF3B8rL0H_J\+<VdL+<VdL+=f?(/iXsr+<VdL+<VdL+<Vd_/ib$s
+<VdL+<VdL+<VdL+>>E,3"63M0JG150H_J\+<VdL+<VdL+=f?+/iXsr+<VdL+<VdL+<Vd_/heCj
+<VdL+<VdL+<VdL+>>E+0F\@E0JG@:0H_J\+<VdL+<VdL+=f?,/iOmq+<VdL+<VdL+<Vd\/ib$s
+<VdL+<VdL+<VdL+>>E&3"63H/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=IXZ`p%13OO<+ohc@<Q4&@:s-o@;]t*@;I&r
BOPdkAKYo'+O63N+Eq78+>>E.3?WBS@rH6q+D,Y4D'1Pn2DlV!D]gbp3%uro$:o)ZAThX*/0K%J
AKYE)ATD3lAKYE!DKTB(+DG_'Eb/[#AKZ2*F!,4?F*&NY/iGL.F(Jj"DIal%Ec5e;0f_3N+EVN2
$8O:h0J">TDIal.DJXS@0J5(>+EM+(Df0).Ao_g,+>PW)0HbIU+>PW)2(g"@F`_bHAKYJr@;]^h
F!+n/A0>u7ASu%"%16fe+O63N+Ceht+Du+>+C\n)E,oN#Bk)6rA0?)1FD)e,ATDm$Bl8$<+EM77
@q?d)BOu+&ATVWr@;I''De*EqF!,C5%172jAKYr*H#m\0@;I&r@<HX&F!+n3AKYl/F<GL6+D>J%
BHUl(Dfo]++E2@4@qg!uDf.0M7<iop@;p.$@<?4%DK?6oAo_g,+EV:.+EV%$Ch4`5ASGdjFCeu*
@X0)<BOr<&Df021E+O'(De'u4Eb0-!+D,Y4D'3q7A799s@WGmmBl7Q+De9FcFD,5.9lFrf+E(k(
ATAo6ARTXuDII!jAKYQ*FD5T#FCfM9De:+B2E)b"ARfXrA9/l-DBL\g0eb.$.lfC.F(Jj"DIdet
$>FB#1,(R>/0HGu0JahmARfXrA9/l-DBL\h0JG%#@;]Tu.l9(<+EM+(Df0*,+DG^9FD,5.H"CE)
+>P]+0J3eA%15mRFE;/,AKZ).AKYr'EbTH&+E(j7Ddmd!Ectl5Bl@m1+=K*$0H`\L73H\j+>PW)
2'>7T.4cT`BOr<0@;L't+E(j7cBM9;$=dL^+C\n)AU&<;@;p.$@<?'k+D,Y4D'3\,@<6R3ARlp,
@;L'tF!,UHBl7Q+FD,5.Ci=3(/TbQED'3\,@;ZM]E+*cq@W-'s@j#l6ASu$>%13OO%144#+<VdL
+<VdL+<VdL+<\so<$4=H/M]"&.j-W'+=\LU?8<XEARfXrA9/1e+<VdL+<VdL+<VdL+<VdLGA(Q.
ANCqVF<E^h.!]B4E\0"*1,(.10eb9j$4R>.+EM+7Bk;?.De:+rE,TQ<DJsB+@;I&tG]7\7F)u&6
DKB)3BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_@psI:04\X1FCB91Des\OBQS*-.3N;4
G%D*i@V'+g+Co&(Bm+&u+D,Y4D'3q6ATME*A79Rg+EVNEF(oK1Ch[L,+EV:.+D#_)Cis0.Bl@l3
De:-;PZ/c;DfQt/DKuZuFD5T'+CoV8Bl7Q+FD,5.Bl8$(Ectl-+>#<.3B84(D]gPd0JG15+B3#c
+Bru+@qB\&@;0V$Gp$g=%1:CF<*^ncFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;L@<=@[
F`(]#Ecb`(DKL.VBQS*-.3NPPATAo8BPDN1E+O'(De'u#@;[2sAKYQ*FD5T#FCetl$>+<sD'3n0
@<?U&EZf(6+EV:.+Dk[uF*2M7D.RU,F"SS)DfQt/A7TCrBl@ltC`mG0AoD^,@<?4%DCcoOAS!n3
$<oo0Cij).<$5UeA0=liBm+'.F(&l-<,$2\>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH
;akA2CiD%<AScHs<%_j+D/:XR%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO=)W+qA0>u.D.Oi9Df0--+CT;%
+CSc%F^]*&Gp$R)F(Jl)Df-[bDf9Z,Bl7@$ARl5W<GlMoATDj#C`l\kD.Oh<<E)=7/g*`-+DGm>
@;[2rFDl#1@j#l-D.Oi2H#@,*Ec5i0H=^V0@;]Tu@:X+qF*(u(+EVN2$?L;tGp%<FFD,B++>>E.
+EM+(Df0*,+E(j7@<6O2Df0K1Bk(RfCj@.6ATVL(D/!m!A0=liBm+'.F(&l-<,$2\%14L`<%0FB
:LdmCF(oQ1@;Kb*/0J@D>U!uq@;m?1ARfXrA6^<$BlbD*A7T7^+EVNE<E)=.FDi:;AS#g'BlkJ3
DBO"GDIX+_GA2/4+B;A`.!K?=@qZupBOPdkATJu)F_)\;D]j43EbSs(Bl@m1+DG^97:C4YBNup+
+EDCB@<?4%DBNt.FCcmR%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO,9n=/AS,LoASu!hEt&Hc$;GGZEbTT5
DCco(/g+S?A0=fmAT2<oDKB`6/0ID7+AsgC+C$*]BleB7EbT#lC`lbeCis<1+E(j7FD,5.7:C4Y
BNup+%15I=De!Q*7<3EeEZiYl<$5UeA0>u-AKX?KCh%U(@<?4%DBNk0+@TdVBlJ-)F'Kn?+A+7/
883-e/g*H$FE2;;/hA,GDeq$8$8XO^:gnBd+>YPk6$6g_F*&N[0JG=7+AQi-+>GW*/0JnN+>Yc3
/Mf1@+=K!!0Jk42%13OO;flSiBOu(&Df-[e/lEg#DIak\Dfol,ASrVb/jV*@+=][!CghB-De:+_
BleB7EbT#lC`l/VCh[j0AKX]UE-!K[%15I2D.7O"A7oHr<GlMo/l6S"F)rrb+@BRS@WH0nB4WV:
0f_3O/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$8O:h2]th'Earc*1,j)ZF(&EpDes]:Df'2sCgUauE,oN2
F(oQ1F'iNtEaN?gCij)mFC/lq1,gF#>>@I_5p.RN@<?4%DII?(6"P(TDII[0Bk)3,@;]Tu;fH/T
AKX9LD/!m%F*)G2FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6Dg!c_%13OO/Kc/Y>?aX:D.R!$BQS?8
F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22Ft[E:Ch[j0AM.Y<D/:Y,%13OO,9U2Z@r,juF(HIqARZc\
Blmol-tm^EE-"&n06;&J@<-F7F*(u1/oG*=@4l22Ft[E:Ch[j0ATKM<Df'&=.1HUn$6pc<@X0(c
Eb/c(7<<EZDII<3+@f@"6Qf3A@;]Xu@<-W9;gEG+ASlK29OVCKEaa'.Ed8*$%14=&:iC/qDJsB+
@;I&TG]7\7F)u&6DK?q4DfQsgAScHs+B0I3cBM9W+:SYe$<q1cFDu:^0/$mHCh[j0AM.V:An*H2
@<5j0B5_rH;akA2CiD%<AScHsFDu/7Gqq'-1bNH`D/<K+BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=
@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*-.1HUn$6pc<7VR$W+AHQdCh7L%Bm"886XakN
DBNk0+B*2p@<*JZ@r,juF(KD8>['X<E+NoqCER&'A0=TXAT`'!>p'R`%16*VBl7Q+FD,5.cBM9N
G%#30ATJu)ATDL.ARloqEc5e;FD,5.BPDO0DfTQ%@;I',ARfY!A0>;uA0>K)Df$V-Bl[cpF:ARq
@WQ+$G%#K,Df0V=.!&s23ZqX+@:F%a+>I.MBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX
@psI:04\X1FCB8DBQS*-,BR@'0e"4S$=Rg_+BqfR@VfTu10l;AFEDJC3\N-t@r,juF(Ht:F(So7
DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW6.3L&j+CQC6ATDKrF!(o!De:,2Des]:Df'2s
C`m;6E,oN2F(oQ1F!,.)G%De*AS#a%@rc-hFCeu*FDi:CBl.g*BkDW5FD,5.AThKuF^]B+Df-\9
Ag#B`<$5dkEZee.Gp%3CD.Oi#F`M26B+52iBOr<#DKKH1G%#20/MT7G3?WE^+=f6%0JG*g$4R>D
AKYMpAnc-o+EV:.+Co%nBl.9p+F.O,EZeU2H!DO9@<3Q'Des6.GB5eS$4R=b+<VdL+<VdL+<VeP
+?^imARTU%.j-6WDf0Z1+>"]i/i>(20es1F%16'JBlbD0Bm+'/+C$+9>Tt;&DfQtBBOr<'Bk1aj
AKYo'+EV:.+Dl%7FD*3JGA(]#BHV#1+CSbiF`Lo4AKYQ%Dfo]+%16`^G%GP6FD,5.E,oN"Ble!,
DBNY2+EV:.+DYk5GA\OH@;L'tF!,C5+O63N/g+,,AKYT'Ci"$6Bl7Q+E,TQ<DJsB+@;HA[AU&07
ATMp,Df0V=@ps6t@V$[)F(Jl)@ps1`F_kK.AKZ).AKZ/)Cis;3De:-;PZ/bRBl5&7ARfXrA901B
Dg#]4+EV:.%172kD.Oi/ATDL'A0>B#G%G]*A0>?,+E(j7FD,5.>=N=MAKX]]Ci![#DJ=61+@BRT
Df-\9Aft#jCgh?,7:U.JE-#T33XlEJ0f_6S+EVNE.l/k50O6)?FEDJC3\N-t@r,juF(Ht:F(So7
DIITp/n]*G02k;YF^fDF2,-G:74r7qD/:XR%13OO6=jbIEb-A8BOr<3ARTU%/N#49/0JG2Ch%U(
@<?'A%13OO+<VdL+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+E_!G%144#+<VdL+<VdL+<YlAATD?C
+<YeL4Wl.u/MT4?0I\Y00JEqC%15F5FE_;-DBO49@<-E3/N#49+CT.u+=f<'0J">jAKZ,:AKZ).
AKYMlFC?;(Ec5e;>?#$?Ch4_D>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH9LWH"F>Y^^
AScHsF=q6KD/:G=@:Cr?/0JMK@qBV$+EV:*F<G16EZfI;AKZ80@<*JB2)$^,G@_n,BOPdkARl5W
FD,5.G%#30AKW]d0f^p1FDi9V2_m'C/iOneDBNk<A7]d(FDi:1G&M)*+CQC'Bldd&DKKT1F_PrC
+EqOABHVD1AISucEb0E.Dfp+DAoD^,F_kJ/@<<W6BOQ!*AT2QtBJ(E,BOr<0@;L't+D,P4+O63N
+DGm>B5)O#DBND6+CP]dE,TQ<DJsB+@;I')Afu2/AKWmQBHUhsB6%Qp/0K.MBk(g!Eb031De+!#
ATJu9BOr<0@;L'tF!,17+BqfR@VfTb$8Gg7/hSeU7:TbJ2(rKOCij*-/nf?DCa4%1@PK;SGA2/4
+CT.1ATDg0EZf7<F<GC.EbAs(+EV:*DBLbYF(Jj"DIdfL%13OO+<VdL+<VdLcBM9N4WlI52)mBE
2BXRo0eb==/i5:*.NijV.j-W(/iPaG0eje#+E_!G+>"]n/ibdE0JtX/.Nik?1CX[6+<VdL+<VdL
+<VdY+>>E&2`WiS2)6:(+E_!I+=eQg/hf%90fLpD3AM^,+E_!J+=eQg/het>0JbFA2)6m/.Nik?
2BWG9+<VdL+<VdLGA(Q.ANCrV+?^im0/5.7%13OO6=k7_AS#a%H"CE)F!)tj0JFVXDIak?0fC^>
/0K.J+CSnkBl5&9F(HJ9BOr;s@<>p#Ao_g,+:SZ^<+06PAKW^5-tm^EE-"&n04eX0BlJ-)/n]6;
@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PK;SFDi:4ATDL.AKYD(E,TQ<DJsB+@;I')
Afu2/AKWmQBHUhsB6%Qp/e&-s$6UH6+<VdL+O63N+?^i%2)d?E1*A.k2)R9E0JO\"+E\eW+?)#-
1,CaG1*A%hF^?gG.j-Mu1GLmK3&)O*+E_!H%144#+<VdL+<VdL+<W6Y0J5=B0JbOD1E\.iF^?mI
/Kc`"0JG@<2)%$N3$9[nF^?pJ.j-Mu0JGIB2)d9E2_uR++E_!K%144#+<VdL+<YlAATD?C+E\ei
+=MLe0eb:8.5*D00F\?u$:8<GG@b?'+F.O,EcW?R0fC^>+CT.u+=f0*0JG%#@ps1`F_kK.ANC8-
%144#+<VdL+<\so<$4=H0etF*/Kc`"3B/]P+=\LU+>"]i/hf";1GU(&+EUpF+=eRV?8E]W+?)#1
3=Q<<+<VdL+<VeNBOu3q3ZoPe+?^im+>"]j2D?fo$4R>/ATW--ASrW9ARTV#+=f0*0JFVXDIak?
0fUj@/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl^:3&;[-+>>E&2D?p0.NigU/Kc`"0JG@E
1,q-6.Nih>1*A(i0J5%50JP@>1H$@*+EUpG+>"^X?8NcX+>GT01b^U;%144#+<VdL+<YlAATD?C
+ES_h+F,(]+>Gf/0F\?u$:8<GG@b?'+F.O,EcW?R0fUj@+CT.u+=f0+2D?[)@ps1`F_kK.ANC8-
%144#+<VdL+<\so<$4=H0f(F@1*A.k0J5.;1,LgH+=\LU+=eQg/het;3&WKH+=\LU?8<WR+>>E%
0JkL=0fC.(+EUpG+>"]i/het51H.-H2BXIlFC$dH%144#+<VdL+<VdL+<W0W0J5%50JG4:0et[C
+=\LU?8WiW+>>E%0JG170JPIG3?TdoFC$jJ.j-Mu0JG170JG170K;!K+=\LU?8i<#+<VdL+<VdL
GA(Q.ANCrU+?^im+>"]j3&!#q$4R>/ATW--ASrW9ARTV#+>Gi60HaeAA0<Te0JG%#@ps1`F_kK.
ANC8-%144#+<VdL+<\so<$4=H2_I!D+=eQg/i>RD2]sRmF<E.X0J5+<0fLsH+=\LU?8<WR+>>E%
0fD!F2E!N;.Nih>1CX[6+<VdL+<VdL+<VdY0J5%50JkUF1H%!F+=\LU?8NcT+EUpI+>4im1G^aE
1^sd7+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc-2D>RI%15F5FE_;-DBO49@<-E30f^pA+CT.u+>Gl3
0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i!1+kLG+=eQh/i5RF0ek[2.NigU/Kc`"0JtjM
3AWZ<.Nih>1*A(i0J5%52DI3M2BXIlFC$aG/Kc`"0JG183B&'1+EUpH%144#+<VdL+<YlAATD?C
+ES_h+F,(]+>Gl10F\?u$:8<GG@b?'+F.O,EcW?X3AN92@;]Tu0f_'F/0JG2Ch%U(@<?'A%13OO
+<VdL+<VdLcBM9N4WlL7/i#+'.j-Mu3&EHP1FdJh/Kc`"0K1mE0JFV!+EUpF+=eQg/het70KCpI
+=\LU?8E#t+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3AN8t$4R>/ATW--ASrW9ARTV#+>Gl50d'nB
A0<Te2DHa*@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H1-$s@2]sUn0J5192_&nl/Kf.A1+tC=
1E\1jFC$aG0-E#-1cGjN+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3AiK"$4R>/ATW--ASrW9ARTV#
+>Gl70d'nBA0<Te3&W<1@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H1c6mB2'=Cl0eP.<2_&nl
/Kf.A1+tC@0H_qiFC$aG0-E2.3"63;+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc.2`2$O%15F5FE_;-
DBO49@<-E30f_3O+CT.u+>PW)2(Tk[@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i*1G1XF+=eQg
/i,:?2'=@kF<E.X0J5%;0JbXE+=\LU?8<WR+>>E%0JPLA2`2^-+EUpG+=eQg/het52Dm3K0f1"&
+EUpH+:SZ#+<VdL+<VdL+<VdW+>>E%0JG191H.*I3B833+EUpI%144#+<VdL+<YlAATD?C+ES_h
+F,(]+>PW)0F\?u$:8<GG@b?'+F.O,EcW?Y0JG@,@;]Tu1,(R>/0JG2Ch%U(@<?'A%13OO+<VdL
+<VdLcBM9N4WlX</ib[0.j-Mu1GU^?2]sRmF<E(V0J5%52)R?R+=\LU?8;rs+<VdL+<VdLGA(Q.
ANCrU+?^im+>"]k0JG0i$4R>ABPDN1AU&07ATMp,Df-\3F!,")EbT].A0>K)Df$V.F*),5@<?'k
+Eh10F_,V:De:-;PZ/c>DBO%7AKZ80@<-E31,(F:%16N]A0<W]2)$X*<+ohcG%#30AKYT'EZd+k
0ea^u2E!0J+EM+(Df0*,.3N>G+C\c#ARlp%DBN@1Ch[cu@<-10%16ZkFE1f/Derj(Bl@l3Ao_g,
+>PW)2'@$_Bl7Q+0J5.A+EM+(Df0*,06q,;EZcc=G%G]&B4W2tEc5e;0f_6O+EVN2$8O:h2(:.#
<+ohcG%#30AKYT'EZd+k2)$.$3AVe!ARfXrA901BBlbD5Bl7KjEbp"DAU&<;@;p.$@<?'k+D,Y4
D%-h-0JP7(F`V87B-8l\2Du\!ARfXrA90DLARTU%-t.:1Ea`Tl+ECn4AKYT*Df$UO3A<01FDi9W
0JG10/e&-s$:8<GG@b?'+F.O,EcW?Y0JtO,@;]Tu1,1X?/0JG2Ch%U(@<?'A%13OO+<VdL+<VdL
cBM9N4Wl=30H_kg1GU(&+=JX`/MT4?0I\Y00JFq^1*A.k0J54@1,pC++=K!"2)$.)+F,CF$4R>A
BOr<&@<6N5FCfK0+DGm>Bl8$5De+!#ARlp*D]iV-Bl.R%@<?''FD,5.A8-*pDf0Z2DKTZ8Gp$O;
+>PW.0J3eA%15C5FCfJ81,1X?/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&
+E_!G%144#+<VdL+<YlAATD?C+<YeL4Wl.u/MT4?0I\Y00JEqC%15C;C`mn0Cis<1+E(j7cBM9N
@UX=hA0>f.+AHcpEbTT5DBNA*A0=fmAT2<oDKB`6+C&,+0JG=g>p*QsF*2>2+CP]dG%#30AKYT'
EZfI;AKX]cDf/f-F!,O8@s)TrEZee#@qBIfEaa'(Df-\9AfrZ\2BZFK@rl3k04T94?8=,U88i]`
G%G\F%172jAKXE8:b=FV0JG.>1*CCUDIIQ.AT2<oD.Ra%F!,%2E,9H<ARlotDBO%7AISuN6XakN
DI"Z(FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;YF^fDF2,-G:74r7qD/:XDF`V,8+CQC6
Ch[NqFDQ4FA8,XfATD@"F<Ga8Cis;3De:+D1,U[D2)l$P@<,k!ARdB'H!FZ2/g+,,F`T)V@3BW.
@;Ka&@rHC.ARfgrDf-\&,%Fk%+Dl7BF<G%(+CSekARlp*D]j.8AKZ/)Cis<1%16WWEbT].A0>K)
Df$V=BOr<*Des]:Df'2sC`m;6E,oN2F(oQ1F!,(5EZiYl<$5X]AoD^$+EV:.Gp$U*DBND"+E_a:
A.8l[DBO%7AKY2E@;^"$>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akYJ@WO1[9g_iJ
/nf?DCaff#%144#+<VdL+<Y/:4Wl=1/het50JP=C1GU(&+=MLX/Kcc.2)Qgh1(=R"$<(YV@q?d)
BOr<0@;L'tF!,C5+O63N+D,P4+EV:.+DG_8ATDs&C`kGm2)QLuD]geh0JstsATD?)A7]dqG%G1n
$>FBgAT23uA7]Y#+E(j7@;^?5CisW(EZeq4BOu$lEbTSG+Du*?@rHC.ARfgrDf-\3F!,@3ARo@_
+D,P4+EV:2Et&IqATDL'A1e;u%16'JAKY3"DI[6uFCAm$FEo!CDBR5h<*^ncFEDJC3\N-t@r,ju
F(Ht:F(So7DIITp/n]*G02+fE@<=@[F`(]#Ecb`(DKL.VBQS*-.3NPPATAo8BPDN1E+O'(De'u#
@;ZM]@V$ZnF*),5@<?'k+D,Y4D'3n0@<?U&EZf(6+EV:.+Dk[uF*2M7D.RU,F"Rn/%14[=/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=%14=)+Auc_ATD@"@qB]j$4R>:DfTl4F)PqI+A=C1@;]Tu;flSiBOu(&Df.*K7P5f]
/hA,M,"QEhFDl26@ps0r<affeATJu4Afu2/AKXEMEcbu"-Z]_(6Yp[NCEQ&dEc5t@cBM9N@;]Tu
FD,5.6Xae@F_kK.Bl@l3De:+\@r,juF(KDt+tOj//g*]!F*'#W6$%-gDf.0Y+BEDs/e&.D2'>_(
Ec`E[/0I6$B6A9;+>PW)1b9bED_<.e1,(7%E,ZpU1,gd@1H$@(1,(C=.4u&:%16$UAT2<oDKB`6
+@[t]+CT.u+@pEnCh.*p+AFIS/hA+p6$-pOF!,C5+@p3fFDl26@ps0r7:U.JE-#S59jr!^.P)#9
6Xah@EbT&sAKXujBm)+*Eb0<5/hA,4@;TIoBk1jf/0HZ-3&WAu$4R=o/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO1,(C@
+AZKh+>>S\$>t!.@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>XD.GC\:3CYeFD5Z2+A$Gn7:U.JE-,f(
@;I&[Df03%FEM,*+=PO"cDW07@;]Tu;JBcWF<Ekj@qBP!Bl@l3.*e&T5q*6M4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>3Ec5e;
8muuf<+0Z^ATB/>+EqC+F(o`-+BrN$FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@I:
-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"\sp%13OO6#:1PEbTW/D'2er+@C'a
E-686+B3#c+AR'$@<?4%DBMMg+A?]kB5)I1A7Zl3?t<)TBj`A!$4R>ABOr;uDes6.GA1r-+CT)!
DfTQ6BPel%Df'H9FCfM9FD,5.DKU&0FD5Z2+DG^9ARfOjE-,f(@;I'&Df03%FEM,*/0JYE+Co%r
Eb/g'/0GB/AoD]4@3B2sG%GP6?qNgp+CT;'F_t]-F=n[Y+A$YtBlbD2F!+q#F(Jl)Df-\>BOr;9
0f_3I+A"k!+B3#cDfU+GDe:+eF`_&6Bl@l3@;]Tu;IsB]@ruF'DD!CJ$4R>ABPDN1G%#30AKY].
+EV:.+Cf>1Eb/a&Bl@l3FDi:1E,]W=+EVNEFD,5.9gq?C+Eh10F_)\6Afu2/AKYPoCh[j1Bk(Rf
+:SZoDf03%FEM,*+EVNEDdmfsBl5&8BOr;c;H6..Ci=3(BlnK.ALnsJBln#2@3BZ*AT)U#FD55n
C`m\;ARfFqBl@l3De:-/YqRda0JO\YEap55ARd>%$4R>.DL!@HEbT0)DJsB'FE2)*+D,b6@ruF'
DK?pKF(oMC+Cf>2/0K%CDCcoAF<G"./h%ocF(Jl)Bl5&8BOr<*F(KK)D_5I;A7[;7%16NbF*2>2
+ECn$Bjkm%@<-"'D.RU,F!,UCCh7[/+E)@8ATE!/F(HJ.DIdHk@<?'k/g)8Z8T#YmBPDN1@psFi
/0K%JAKYT!DII?(%17,eF*2;@+DGm>@V'7kB-:]&DK]T3FCeu*Bl8$2+Co%rEb/g'+D,P4+Cf>-
G%GQ*ASu!h/e&-s$@[GQILQW^AS*t4$:/`TEc5i6D/!KgC`l#[B5_g)FD,N4+>"]kDIakYA8-."
Df-[G0f_6R.3K',8nDFK+AHEYF`S!!:j$5"+BN8nCi*TuDCn1dChtXF8T&#j%15[*6;AXW/NGXD
1H@?F2DHd<%13OO;IsH$%15OKE,8s#@<?F.Gp$%.E,]W)D.RU,+EVNEFD,5.6$%-gDf0K1Bk(Rf
+@0g\@;]L`+=Js)3AN#m$?.^S0d(RV+E0%i1^sd`;aO5%0J,:@2)d3E/N,R?2[p+CIXZ_T$4R=O
$:ScBD.RU,Et&Hc$8F.U?qNgp#tJQEATD3q+A,$EDKTf*ATAo*DfQt5Bm+'*+Cno&ALnsGBl.E(
@;]TucBM9;$8O4V?rUM?<,$2\+D,%lFDl1BBl5%cF_kc#DBNG#DKL#ABk;?.Eb/`rDf0,s+D,Y4
D'2G+0JG150J">VDfTl0F)Z&8A8,po+EVNE8jj*q1G0eX6tL"1Dc1"S?m#bTBPDN1BlbD*+Cf>-
G%G]8Bl@l3Amo1kDfQtCF(Jl)FDi:3Df0`0Ec`F7AS6$pATJu.DKKe>%144#+<Y68F_Q#-Ch7L+
+ECn$Bjkn#/g)9<AKYi4CijB1Cj@.6AS6$pATJu'Gp%3BBlbD/@:OCtEZfIB+E(_2@;0U%%144#
+<Yc>AKYQ(F_Q#-Ch7L++CT/#Ch4`#G]7\7F)to'+DG^9Ea`Km@;^-=+<XEtF<G.<ATE&=E,ol0
Ea`g%Bl7Q+%144#+<YK/DJ+*#B4W3!@<3Q'F`(]2Bl@m1+EVNE@rH7.ATDl8@V'Y*AS#a%Ea`Km
@;^-/@;]TuA7]CoAS#p8%14pE+CKD$#u5Vb@<?4%DBO"3EbT*++CSbiF_u8;@<?F.+=LZ=@j#i(
@rH6qF!,]M0eb:80I\U`$8jFY@!=>5#u+u>DBNM,Df02rFD5Z2+E(j7FD,5.D/X?1+D,Y4D'3q6
AKZ&:DCuA*2D-+[G;<P49k@aN+EMI;@<*K!DJsB#Cj@WB$9'R[@!=D7#u+u>DBNb<DIIQ.@;^"#
@;L3A%15'I+CKCM?jTMLDIIQ.@<-"'D.RU,+E(j7CghF"FEM,*/e&.J/g+PG2.-_aDf03%FEM,*
+E(j7@<5piDIdI!B-;)1A7Zm%Afto4DIIQ.DfT<$F<GL>+EV:.+D#&!BlJ0.@iu3f+<VdL@<3Q.
ARTY&Eb/c(Ao_g,+EV:.+Dk[uDBNM1F_P`3GT^p:+Cno&AM+E!0eb4&?t<)TBgcNF?jTSNFCB9*
Df-\3DBNM#Ch[j1Bk(Rf+Dbt6B5)I1A7ZlpG]7\7F)to'+DG^9A7]CoAS#p8%13OO%17Q5ILQW,
<$3;H+=KiM+>"]k1c7!F1c6^)0-E&/2)7#u$6W;'+?^iH.T?ia+B1->4Wm]R<&+mi%144GAS4t\
;IO)Y4WlO50f1UB3ANKM1Gq-P2`WZL+>4il3%tdK%145%0d&V%1-%9G3&NBG2BXLm1c.'F2E*6C
0ekLE.T@NB+>>E%0JPRB1bpO[1*A(i-r_uF0-Du/3A`ZO.1HV,G;14'+@KdR<,YZCA1B!O0e!P=
%145%1*A_&1Gq*D2)7*L1*A(i1Gq0Q3A*!C0JbO8<$3b80J5%50JPI>1Fc?Z+>"]a<&5XM+>Y]*
0JG10%145%1*A_&6tL"1Dc1"S.O]Kr.1HUn$6XOK+?^i%1Gg^E2DR9P+=eQk2`EHO3%d0K2`!HR
.T@N@+>>E%0K:sN2_lj^1*A(i-r_uF0-E,11,Ua7%145%1E\h'6tL"1Dc1"S.O]Ks.1HUn$6XOL
+?^i-1G1FA0f^s2.j-Z.1GUX>/hf"=2)@3A<$3b80J5%51H%3J2(DQ\+=eQ_<&5XM+>Yc31,gm9
%145%1a"q(6tL"1Dc1"S.O]Kt.1HUn$6XOM+?^i%1,U[<1c.'F+>"]j3AWKE0f(^C2DH[\+=eQg
/het70K1[F.TA/G.j-6>1E\=n1c6s@0JFpb$6XOM+?^i8AS4t\;IO)c.!INt%13OO+<YkN4Wnf[
DCB]d.4Q_t0fLpA1+H6G/Kcc,0f_6P.1HV,+Enqk+EnqY+EM77-o*8#G;LEm+Eo[c/Kf6l.4H_p
/MSk9.T@NB+>GZ,3&`8q$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2(9t(-nR202`)X/+>>E'.T@i+
$6UI8+?^ik+=eRUBl5=S+=\LX2(:"'0J5+1<$3\61,(UA.1HV,+Enqk+EnqY+EM77.!IEq.O[#.
1,^7,+>YW,.T@i+$6UI8+?^ik+=eRUBl5>C1FXe%0J5(0<$3\62_d':%144#G9B$kG9ACYF(oM?
1+F\r1a":kG;UKp+EoOh+=eRY1+=\$0eP42<$3b82).$=%144#G9B$kG9ACYF(oM?1*A%hG;LEm
+Eo[l.OZl&/i5%W+>"]l3&W2p$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2'=InG;1Nh/Kf6m.4Q`$
0fL4,+>>E*.T@i+$6UI8+?^ik+=eRUBl5=S.O]Kt+>"^[0e"4q+Eo[l.O[#,3?Tgp0J5(0<%/7`
+<YkN4Wnqk.j/nIDCB]b+=eRY2(:"'0J5(0<$3\62DZck$6UI8+?^ik+=eRUBl5>C2'=InG;CZt
-nR,*0e--F/Kco1.1HV,+Enqk+EnqY+EM77-o*8r1+=\$0fL4,+>>E&.T@i+$6UI8+?^ik+=eRU
Bl5=S.O]Kr+=eRY1a":kG;UKp+EoOh.4Q`"/hnhT+>"]j2CT(B+<YkN4Wnqk/Kci'0e.6YDC@7i
.!IKj.j0$n.3L,`G;CZW$6UI8+?^ik+>"]j2)m(,Bl5>C1E\7l1+IK&.1HV,+Enqk+EnqY+>GW-
.W]<A-o*8#G;LEm+Eo[l+>"^[1FWb?+<YkN4Wnqk.j,rm1FdH[DC@7iG;1NU$6UI8+?^ik+>"]Y
2*!.-Bl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6n.1HV,+Enqk+Enq[+<WNr.W]<A-o)np+EoXb.j0$l
+=eRY2(8tA+<YkN4Wnqk.j,rk3%Au`DC@7i.!IHi/Kf6l.4G]5+<YkN4Wnqk.j,rk2C`c^DC@7i
.!IKj/Kf6n.3L,`G;UfY$6UI8+?^ik+>"]Y1H6k*Bl5=S.O]Kq+=eRY1a":kG;Ufu%144#G9B$k
G9AI[+>Y`%F(oM?1+F\r1E\1jG;LEm+Eo[l.1HV,+Enqk+EnqY+<WF".W]<A-o*8r1FWb?+<YkN
4Wnqk.j,ri3@])aDC@7i.!IKj.j0$n+>"^[0e"4q+EoUj%144#G9B$kG9ACY+>Pi)F(oM?1+IK)
.1HV,+Enqk+Enq[+<WEp.W]<A-o*8#G;LEo+EoOh.1HV,+Enqk+EnqY+<WEo.W]<A-o*8r1a":k
G;UKp+EoUj%144#G9B$kG9ACY+>Gc(F(oM?1+IK&+>"^[1E\1jG;UfY$6UI8+?^ik+>"]Y0f:G%
Bl5>C1*A(iG;UfY$6UI8+?^ik+>"]Y0f(;#Bl5>C1E\1jG;UKp+>PEj0e!P=+<YkN4Wnqk/Kc/j
1+I?ZDCB]d+>"^[1+<Y>+<YkN4Wnqk.j,rh0e.6YDC@7i.!IHi/Kf6o.4G]5+<YkN4Wnqk/Kc/j
0Ih-XDC@7i.!IKj.j0$j.3L,`G;UKp+EoUj%144#G9B$kG9AI[+<WWnF(oM?1+F\r1a":kG;13j
+Eo[l+=eRY1FWb?+<YkN4Wnqk.j,rW2_&l_DC@7i.!IKj.j0$n.3L,`G;:TV$6UI8+?^ik+>"]Y
+?(ckBl5>C1E\7l1+IK&+=eRY1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DC@7i.!IKj.j0$n.3L2bG;:TV
$6UI8+?^ik+>"]Y+?(ckBl5=S.X*Ti.j-SsG;LEm+Eo[l%144#G9B$kG9ACY+<WQlF(oM?1+IK&
+=eRY1FWb?+<YkN4Wnqk.j,rW2C`c^DC@7i.!IHi.j0$m+=eRY2'=InG;1Nq%144#G9B$kG9ACY
+<WQlF(oM?1+F\r1a"@mG;1Nh.j0$l+=eRY2(8tA+<YkN4Wnqk/Kc/Y2C`c^DC@7i.!IBg/Kf6n
.3L,`G;UfY$6UI8+?^ik+>"]Y+>t]jBl5=S.X*Ti.j0$n.1HV,+Enqk+EnqY+<Vda.W]<A.!IHi
/Kf6m.1HV,+Enqk+Enq[+<Vda.W]<A-o*8#G;LEo+EoOh+=eRY2'=InG;:TV$6UI8+?^ik+>"]Y
+>kWiBl5>C2'=In1+IK&.1HV,+Enqk+Enq[+<Vda.W]<A-o*8#G;C?l+EoXk+=eRY2(8tA+<YkN
4Wnqk.j,rW1b*Q\DC@7i.!IHi/Kf6l.3L,`G;UfY$6UI8+?^ik+=eQW+>bQhBl5=S.O]Kt+>"^[
0e"4q+EoR`.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A.!IHi/KceuG;L`X$6UI8+?^ik+>"]Y+>bQh
Bl5>C1E\7lG;1NU$6UI8+?^ik+>"]Y+>bQhBl5>C1*A.k1+IK&.1HV,+Enqk+Enq[+<Vd`.W]<A
.!IBp%144#G9B$kG9ACY+<WHiF(oM?1+IK)+=eRY1FWb?+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IKj
.j0$n+>"^[1FXa^$6UI8+?^ik+>"]Y+>YKgBl5>C1E\7lG;13l+EoRi%144#G9B$kG9AI[+<WHi
F(oM?G;:9k+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r1a":kG;Ufl.j0$l+>"^[1+<Y>+<YkN
4Wnqk/Kc/Y1FdH[DC@7i.!IBg.j0$m+=eRY2(9Y"+EoR`/Kf6n.1HV,+Enqk+Enq[+<Vd_.W]<A
-o*8#G;LEm+Eo[l+=eQj.X*Zt%144#G9B$kG9AI[+<WHiF(oM?1+F\r0d%thG;LEm+Eo[l+>"^[
1+<Y>%144#A5I>]6tL!R4Wnqk0-E&/0JG170JG+5%144#IXZ``F`_&6Bl@lrBl79r@VfauF_PrC
?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys=/2bnL;@<?4%DBMMg+AZH_BlS90FEo!)Aft&dAKXEOCh[j1
Bk&8;+A"k!+>Gl90Ha;*EbT*+%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$:]&SD'2GZGp$'pDJj$+-Z^DSAR]^pFCcS!BQS?8F#ks-DIma*
Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m103ou>FEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*
Df0VL.4u&:%16'JAKYT'Ci"$6Bl7Q+@;KRpEbTW/D'3>,D/aW>ATJu9BOr<(F`_&6Bl@l3Bl5&3
@VfauF_PrC+E(j7FD,5.ARfOjE-,f(/0JYE+:SZgAS6$pATKCFAoD]4@3B2sG%GP68jlWX+CT;'
F_t]-F=n[Y+A$YtBlbD+@<6!j+E)-?FD,5.%14R>3B/]88O6?!<+oi]Ed8dGAfsikFCB9*Df-\+
DIakfARopnFD5Z2/h.;;%16'JBlbD?@;L't+DGm>FD,5.@rHC.ARfgrDf-\>D]iJ-E,9eBFDi:D
BOr;\76sZkG%#30AKYo'+EV:.+E(_*BlS90FEn<&FDi:?@WZ$mDBO%7AKXrM<CJ$K@VfauF_PrC
/0K.NFD)e*+EV:.DfTE2Bk(Rf+E2@4@qg!uDf-\9Ag"sq0J5%50d'nF@j#i(@kJ2t%15CB+DG^9
D/XK;+Cf>,E-686EZf=ADeF*!D/F!)B-;#!DJ+*#B4Z-8+EV:.+EVX<B5_[+D.Rg0Bk&8tF`(]2
Bl@m1%14M)Bl5IE@rHE>+EV%0/0JMG+CT(=.3N>B+EV:.+E2C5F_#DB@rGmh+D>>,ALns4F)uJ@
AKZ#%A8,Ii+CT;'F_t]-FE7luF`)#,F)rIBFD,6+GA2,0+DG_(Bk(RnARmD&$4R>6DBO%7BlbD,
@<6!2+EV:.+D,>*@;I',ATN!1F<G:=+Cf>-G%G]9ARlotDKKe>A7]CoAS#p*AoD]4@rH7.ASu3n
DI[61%13OO<-!+m+AZH_BlS90FEnul+AHEUDBM_aCh[m3BlnVC.j3-%cF")g%17Q5ILQW^AS*t4
$:/`TEc5i6D/!KgC`l#[B5_g)FD,N4+>"]kDIakYA8-."Df-[G0f_6R.1HVVARTI!9k@mYEt&IQ
F^csG=(uJeD..="/OF#bCb-]#DIY:.$;"/_:*;5B3A`NJ3ArHI0eG*h$4R>?AS*t4$:T2YCgh3i
FDl2F+B*E%E,9*&ASuT4FDi:DBOr;PF*)G@DJsB+@ps0r6#:CHDII#t-o!_B1+<Y>E%s(%+EVNE
E%s((%15[*6;AXW/NGUE2_[!=2E39I%17Q5ILQVn$:ScBD.RU,Et&Hc$8F.U?qNgd<+$"uF*)G@
DJsB+@ps0r8jje>F_tT!EZet4EZf"/G%GP6A79Rk06CoFAKWC#<%/7`1+j\W<+$#3Bl.E(Amo1k
DfQt7DBMPoCh[<q+Ceu#FEMV<ATKCF@rHC.ATMg/DIdI!B-;;7+A,%$<%K/4ARfLoDIm?$Ao_g,
+A+CC0JG+5%14mD+CITKB2ieI@:WaP<+oue+DGm>@3B&uDK]T3F(oQ1+D,%lFDl1BF`V,)+EVNE
@rH7.ATDl8A7]CoAS#p*Bl8$2+D#P8Bm*p$ASuT4%144#+ECn$Bjkn#/g)9<AKYi4CijB1Cj@.6
AS6$pATJu'Gp%3BBlbD/@:OCtEZfIB+E(_2@;0U%FD,5.AT;j,G%#2uDKI"A@:X(\DK@E>$8a@X
@!>ub:3CYeFD5Z2+EM+7Bk;?.@:NeiD09Z'FDl1BG%#E*@:F%a%14sF+CKCJ?jTP=@;[3!Ci=3(
@<?4%DBNk0+EV:.+Dl%8DBNP3Df$V=BOr<-F`&f@$8sLZ@!=A6#u+u>DBO"=Cgh?,@;^"#@;L3A
%15$H+CKCL?jTP=@;[3(F`(W.+CT/+D..7+/e&.I/g+PG1ggV`F`(W.+CT;'F_t]-F<GL6+DbJ.
BlnK.AM+E!3A)Es@!=J9#u#8TB5)I1A7Zm%AftN'@qBOgBl7Q+DJs&s+E(j7CisW(EZf:@@VKp,
Df-\>BOr:q$6UH6+D#&!BlJ0.@j#3$+Dk[uF*2M7A0>K)Df$V=BOr<'ARTI!AT;j,DJsbBDe:,&
@<?'5%14gD/g+P47<!<9AS5BW:3CYeFD5Z2+DG^9ARfOjE-,f(@;I'&Df03%FEM,*+D#e:Eb0<5
ARlotDBNJ$B6%QpF"Rn/%13OO:ig2jA8bsrA7ZlLChI[,Bln$*+B38%6Z6g\F`_1;<+ohc:3CYe
FD5Z2+A$Gn:L\-SEHPu;Gp%$;+EV:.+@TdVBlJ0.@grcWDfQt/DL!@;Bm+'*+A,%$<$4JIB6A'&
DKIK?$4R>kIXV_5+B0I+4Wl.F6r[,./Kcf*2)-sF2(9Y$+>Yo51,TLJ+B1*=4Wm]H.Nh\"$6W;(
+?^iH+=\L51(=R"$6V`JB2ieI@:UKD+>YW)1bgjJ1,_!G2)mTT3AWE50-Du/0F\?u$6XOI+?^i8
AS4t\;IO)c-o*eA/iY^B1H$@++>bo41,_'D0ekC>3%@lM+>"]i/het63AE?G.TA/G.j.eI0/5FH
1cI6?%145%1*A_&6tL"1Dc1"S.O[)12_HsC2`EK7.j-W*3B9)P0JtO?1b)HI+<W6Y0J5%50JPI>
1Fc?Z+>"^81G:O<0JG17.1HV,G;C@)+@KdR<,YZCA1Au^1Gg^E2DR9P+=eQk2`EHO3%d0K2`!HR
.T@N@+>>E%0K:sN2_lj^1*A(i<&60b2DR-D.1HV,G;LF*+@KdR<,YZCA1Auf1G1FA0f^s2+=eQk
3&<<D1+k782`3BN.T@NB+>>E%0JbUH1,UO\1*A(i<&60`1,gsI0I[G<+Eo[c4Wm.(B2ieI@:Ui9
0etU=0JkUD1*A.k0f_$H/ho.?1,^j:<$3;+.j-Mu0JG792_[3@<&,RH+B1-M1c6s@0JFpb$4R=b
G9B$k@rHE:G;Ug!-oj%:1,U1)+?1u6.T@i+$6XO84Wnqk.j/>?F!rdn.!IKj/Kf6l+=eRY2(9t(
-oEq>2BXRo1G1C3<%/7`+Enqk+EnqY+Cf>2-o*8#G;LEm+Eo[l.4Q`+2`Dj2+>>E*.T@i+$6XO8
4Wnqk.j/>?F!rdnG;Ug!-nm82.T@NB+?2A=.1HV,G9B$kG9ACY@rHE:G;:Ts-oEh(/Kc`"0e--O
%145%+?^ik+=eREDf[=N1*A(i1+F\r1a"@mG;13j+Eo[l.4Q`$1,L+*+>>E+.T@i+$6XO84Wnqk
.j/>?F!u5g+=eQi.O]Kt+=eRY2(9t(-o!J;+>"]i/hnhT.1HV,G9B$kG9ACY@rHE:1+F\r1a"@m
G;13j+Eo[l+>"^[1+=\$0J5.2<$3b83Ai5p$6XO84Wnqk.j-T$0IgRNF!rdnG;LEm+Eo[l%145%
+?^ik+>"]p0IgRNF!rdn.!IKj/Kf6l.3L,`G;UfY$6XO84Wnqk/Kco,.V!C<-o*8#G;LEm+Eo[l
+>"^[1FWb?+Enqk+Enq[+>Yf'@rHE:G;C?l+Eo[l%145%+?^ik+=eQi2C`3TF!rdn.!IBg.j0$m
+=eRY2(9Y"+EoUj%145%+?^ik+=eQj1+HdPF!u5i+>"^[1FWb?+Enqk+EnqY+>Pl*@rHE:G;C?l
+>PEj1a":kG;UfY$6XO84Wnqk/Kcf*.V!C<-o*8#G;LEo+EoUj+=eRY2(8tA+Enqk+EnqY+>Gc(
@rHE:1+F\r0d%thG;LEm+Eo[l.1HV,G9B$kG9ACY0f(:hDf[<^.O]Ks+=eRY1a":kG;Ufu%145%
+?^ik+>"]j1+HdPF!u5g+=eQi.O]Kt+>"^[0d%thG;Ufu%145%+?^ik+>"]j0IgRNF!rdnG;LEm
+Eo[c/Kf6n.1HV,G9B$kG9AI[3%AEVF!rdnG;13l+EoUa.j0$n.1HV,G9B$kG9ACY2_&<UF!rdn
.!IEh/Kf6l+=eRY1a":kG;Ufu%145%+?^ik+>"]p.V!C<.!IHr%145%+?^ik+=eQp.V!C<.!IEh
.j0$n.1HV,G9B$kG9ACY2_&<UF!u5g+=eRY2'=In1+IK&.1HV,G9B$kG9ACY2C`3TF!u5i+>"^[
1+<Y>+Enqk+EnqY+>kWYDf[<^.O]Kq+=eRY1asP!+EoUa.j0$n.1HV,G9B$kG9ACY1FcmQF!u5g
+=eQi.O]Kt+=eRY0d%thG;Ufu%145%+?^ik+>"]l.V!C<.!IEh.j-Ss.!IKj.j0$n.4G]5+Enqk
+EnqY+>YKWDf[<^.O]Kt+=eRY2(9Y"+EoRi%145%+?^ik+=eQj.V!C<-o*8#G;13j+EoXk+=eRY
2(8tA+Enqk+Enq[+>YKWDf[<^.O]Ks+=eRY1a":kG;UKp+EoOh.1HV,G9B$kG9AI[1FcmQF!u5g
+=eQi.O]Kt+>"^[0e"4q+Eo[l%145%+?^ik+=eQj.V!C<-o*8#G;13l+EoUj+=eRY2(8tA+Enqk
+EnqY+>YKWDf[<^.X*Ti.j0$n.1HV,G9B$kG9ACY1FcmQF!rdn.!IKj/Kf6l.3L,`G;UKp+EoRi
%145%+?^ik+=eQj.V!C<.!INk/KceuG;1NU$6XO84Wnqk.j-Vt@rHE:1+F\r1E\1jG;L`k.j0$n
.1HUn$6WkJE-"EYB-9>[G9AO]1H$p@0JG17%145,IXZ6VC3"$0ATMF)1,2Nj/h1g\C3"$0ATMF)
+EK+d+EM+9F`8IDBldj,ATT&6Ec5](@rs=4$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sBsDdd0!
-Y-Y-@4u\ACh\!&-OgCl$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F
.4ciYF`_[IF`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$>OKiF'iWrDe*3<3Zr0U
A7o7`C2[Wi4ZX]5EbTT+F(KG@%13OO;aFGQ8PMWU?YO7nA7$HB3ZpLF-Y@LCF!hD(%14IsC2[W1
+D58-Ed/]g3[]#j+D,8,+DGFt+Cnr&FE/`O%13OO:-pQUF(KG9F)?&=H$!V<+E_a:EZf./H#k)[
+ED%7FCB33+A*buD]j.1CLnW"AnGUaF:ARuD/XQ=E-67F-ZsKAE_BthF!,L7F(KG@%14M*Db*Z&
<$47FHTE9#+>G!XBk(p$1a$FBF<DrOBldj,ATUpnATCFTH#k>^+Eqj?FCcS0E+*j%+=DVJDf00$
B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\a@De*KfBkhQs?S!QIE,ol3ARfg)F(KH9E$l)%%16oi
@:UKqDe*KfBkhQs?ZKk%ATMF)<HD_l94`Bi1,Vfn/g,:XATDQtH#kTJAnMP[:-pQB$;No?+B)i_
+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq01o)`03*()E_Bth
Et&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=
FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,
ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2F!hD(:-pQU+@C6k
Cb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV
@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J;eTlWF=Tg=+q4lS
67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#
$;No?+<j`tBkDH;7Q2M#$4R>31-73P;Is]RCLnVUF`MM6DKIsVDdd0!C2[Wq?YO7nA7$H`+>G!Z
FEAWQ@WcC$A7$]8C2[Wq?YO7nA7$H`+Cf5!@<*J<-OgDMFE21J7P[%[4&]^4+@C9lEb0-14*#Bb
-ZF*@EbTT+F(KG@+Bot,A0<73F`_[P+BosE+E(d5-RU$@+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn
6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:Eb065
Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l.3L>S
$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9O@WHU/+=ANG$:Zp8
0fr?GF*&O'D/X3$4#A(#FEAX?De*KfBkhQs?O[?@BPD(#.n2EY0fr?GF*&O)DJ=2S0d(LYF<G=:
A7o7`C2[Wi/14e9F)Y].@;B4kD/X3$-OgDP2`i`U6uQRXD.RU,+@C9lEb0-14#%juFEAWQ@WcC$
A7$]8C2[Wq?YO7nA7$l8?Y"(b-ZWpBATMF)?Z'e(AR]RrCL:dpH#@(I14'?N,%G2#Ci^d]+Bo0q
+F=G<+<Vk<ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W+uNsf0P!+O1a4IX+<VdND.Rft
A79Rg,!$inI4P^J+<VkLDfp)1AKj/X>7)Jq+<VjQ+CK5(F(KE(FC64[G[YH.Ch7ZmDB^V=+<VdL
,$]"0/.*LB+<Vk-BPDN1DJsW.@W-1#+Co&#Df0W<Eaa'$F!,R<AKY2L+ED1;ATMF)+EM%5BlJ0"
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$.!@:O(o04Ja9@P;S,Bl5SEBldj,ATTP=
C3(gV+<Y'4Bldj,ATV<&@rH4'F`_29+EV:.+ED1;ALnsGEa`j,BlkmK@;]TuF(KG9FD5T'F!,C5
+DtV)ARlof8O6?!;flGgF'U2-FEDJC3\N.1GBYZR@<F2@Eb@$S/mN9</.*LB+<Vk5DB^V=+<VdL
,#iJ'Ecl7BFD,B0+Du+>AR]RrCERn@FWbODF*&O=DKBo.Cht5&+A*bkF`;VJATAo/ATD["Cb?i/
ARuuY@<-I(DBMkdF`M&6-Z^D77qm'9F^cJ6AT2R/Bln96H!Mh3FEDJC3\N.!Bln$2@P2//D(fa7
Ecc#5/TY?CEb08EC27C$DImW5+D,P4+DG_7FE2M6FD5Z2F"SXD+<Ve4$6UI>/.*LBHO:l<+<k<,
Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag0e<YS+<VkBA0O&W+uEmk2)-j?
3?g!]+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVf
FC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN
>](`:$6UH6+<VdNC,mn'/ho"o2DeicGVq3206_,JA8c[504Sp;D.R`tBjkg2GB\6`C3+<*FE_/6
AM.J2D(dXu1,CL91+b7?<&$6k1,1gI1G<6S@;]^00f:O:/N5=]9LVB>4Y^2Z+tO'D+<VdL+<iQp
1,C%0+>P&o1a"V6+>Yc*1c@<uDB^V=+<VdL+<Vk5DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klF
F`Lu',!$iN$6UH6+<jQI/g*b/G%G]8Bl@l3@;]TuA79Rk>](`:$6UH6+<klDDfp/@F`\`d+Z_>7
+=AOADB^V=+<VdL,'.U>F`_SFF<EIb3\V[(-X:O5/.*LB+<Vk5DB^V=+<VdL,#1HW+EM+9+E27>
FCAWpAKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6>](`:$6UH6+<kcCEcbf)@<-EP3a4Wf3?^FB+=AZi
.k<,#.k<,t/LOdI?Q`Pq?!M7k/.*LB+<VkIDfTr0BOPq&+>=uH+<Ve4$6UI>/.*LBHO:l<+<k<,
Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj1G`Js1H8r(+tO'D+<VkFATV?k@<>p%3Zrct
/.*LB+<klFF`Lu',!$iN$6UH6+<i$T+A$HlFCB!%@<?4%DBN2%+tO'D+<VdN>](`:$6UH6+<k36
Bldj,ATV<&BlbD-BleB:Bju4,ARlolF!+m68g%PQA8c?<+A$YtBlbD2DKBo.Ci!Zn+DG^9FD,5.
8g%Mj@:WneDK@IG@:O(o?m''"Ch.*t/g*`-+Ceht+C\n)Bl8!6@;KakA0>K)Df$V$7qm'9F^eW)
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CNF/t@r$-7+EqOABK@=E+<Ve4$6UI>/.*LB
HO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag1+WbT+<VkBA0O&W
+u*X`0fLpL@j3H2+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Br,&$6UH6,'.[FEarZ)
3ZqW6+<VdL,&D1+A0<7=@:O._DC8\,+tO'D+<VdN:-pQUF)>i<FDuAE+DG_7FCB!%+=Cf9FD,f+
3auN5ATDNr3B8a-@:O(oBOPCdF!i)*67sC'DI[U%D.RU,+EVNEBl8!6@;Ka&+<Vj8+<Ve4$6UI>
/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj@PqRO3AWWS+tO'D+<VkF
ATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<jcuAKYAq@:O(o?m$ji/SJR&CNCpI@:Wne
DK?q/Eb-A7ASbs$@rH7,@;0UjA0<"!8l%htB4YslEaa'$A6gTsFEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_F+A*bt@rc:&FE9&W7:B\>+CJnuF'p,3@rc:&
F<G:=+CSbiDf'H%DJ<Zm+EqOABHU]%A7f3lA8bt#D.RU,+EV:*F<G+*F(96)@V'U'BQ&);FDi:E
F(HJ.F=n\7Df'&.F(96)E--.P+Dbb-AKYB$Bldj,ATV<&@<,p%@;L"'+E1b!CLLjeA0?)1FD)e*
+A-cqH$!V<+Du+>AR]RrCEP$IBPDN1Anc'm.3N&:A0>;'?uTXg?m'W(EcYr5DBNk0+EV:.+Du+>
AR]RrCG$`!DfQt3G[YH.Ch5.?FD,5.?uft&ATMF)?m'&qCh7Z1@<,p?>](`:$6UH6+<k'.+tO'D
+<VdN+<VdL+ED1;ATMF)/no'A>](`:$6UH6+<hpN+<VeIBldj,ATTPDA7f(a+tO'D+<VdN+<VdL
+ED1;ATMF)?Z'e(AR]RrCG'=?H#@(rDB^V=+<VdL+s8!N+<Y]=F(KE(FC/p(FCep"DegtEA7f(a
+tO'D+<VdN>](`:$6UH6+<jcuATD?)@<,p%DffZ(EZfF5EbTK7F!,17+CKY,A7TUrF"_9:@r$-n
+CT.u+Dl%;AKZ22Cht5'AKYDlA7]9oAo_g,+EV=7AKZ)5+EV=7AM,*)D]j(3Ao_I(BHVD1AKYT'
Ch.*t/0JtEBle?<AKZ).AKY])F*(i,C`m5+D/E^!A1h,)+tO'D+<VdN>](`:$6UH6+<jBp+CSek
Bln'-DBO%>+EV:.F(HJ+Bl%@%+EV:.+EM[7AoDKrATAo$IUQbtDf0VLC11UfF"_WHF*(r$FCAQ"
@rH7,@;0V#+Cno&@3B/rCh7Z?+CK5(F(KE(FC65'Bl%@%+DG^9@!#t$FC\g%@:13dEb.::DB^V=
+<VdL,$]"0/.*LB+<VjN+<VdL6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2_JrX
>](`:$6UH6+<hpN+<Ve@@<Gpp@;TRd?ZU<tEcYSC0JYC9FEhn4DB^V=+<VdL+s8!N+<XEfG%kSt
FD5Z2?W2&TEcWjTG][2.+tO'D+<VdN+<VdL+<h.8+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S
+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i&/.*LB+<kN1,!$hj3Ar]S2)dC'+tO'D+<VkF
ATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4+tO'D
+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<VkMATMs(@<>p#
+<VdL+<VdL+<VdL+<VdL4Ci/H4s1sj+<WF!/PTYo/M]+)1,:mI2**KI>](`:$6UH6+<VdN@WGmp
A9_s1/no'A+<VdL+<VdL+<VdL+<VdL+>GZ-3Ahp73%[j5E\0%&+>P]51c7<L0jJT?/.*LB+<VdL
,%>S$DIe!/E%Z*?Afr3=+<VdL+<VdL+<VdL+>GW/1,Ug01,pj[@<*qT1E\G.3]&]T1,3$O+tO'D
+<VdL+<kH;G]e+BCi_4CC3(L?+<VdL+<VdL+<VdL+<Vd]2_[0N+>Po.9jr&o1,C%.1-.6L3\iEp
DB^V=+<VdL+<Vk@E-QMIBl%iCE+EQ'+<VdL+<VdL+<VdL+<Vd]1GgmG2'=Y6/PTYo/M]+)1,:mI
2**KI>](`:$6UH6+<VdNBlJ?8@P2A0F!)SJ+<VdL+<VdL+<VdL+<VdL+<WL!3B83;3%[j5E\0%&
+>P]51c7<L0jJT?/.*LB+<VdL,&)"ADIP5;A7cr,+<VdL+<VdL+<VdL+<VdL+<WX%3Arc<1,pj[
@<*qT1E\G.3]&]T1,3$O+tO'D+<VdL+<kZ2DJ<]oF*'$KC3(L?+<VdL+<VdL+<VdL+<VdL0etI?
+>Pr/9jr&o1,C%-1HI6M3\`QuDB^V=+<VdL+<VkKBldj,ATTP=C3(L?+<VdL+<VdL+<VdL+<VdL
1GggH2'=Y7/PTYo/M]+)0f(jI3BAlM>](`:$6UH6+<VdNEbTT+F(KGGE+EQ'+<VdL+<VdL+<VdL
+<VdL0fLpC3A_j63A!s6E\0%&+>GZ50fV3K2dC5E/.*LB+<VdL,'%C=ATMF)?Z'e(AR]RrCG'=?
H#@(6+<VdL+<Vdb2E*?51-$p\@<*qT1E\D.3]/ZR1bi6Q+tO'D+<VdL+<ki?F(KE(FC/p(FCep"
DegtEA7cr,+<VdL+<Vd_2)$pK+>Pr/9jr&o1,C%-1HIBK3\`X"DB]E1+<VdL>m_\s+<Z(>+<Ve4
/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g+S5A8c?.Anc'mF'NT,/.*LB+<Vk=BlY=DIUQbtDf0VL
C11UfF!i.=+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj
2dp/T0ekUE+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<i$T+B<JsDJ()"
EbTT+F(KH$+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9
DI6mlF`):F3Zp71$6UH6,&(R33ZoVYA7RJN2DA_e/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UG
E-68D,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVf
FE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<jQI/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28Eb$S>
.68S,0JYF<1b^\"0f1^B2)&9Q+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M14F+tO'D+<VdL+<jQI/g+bCFC0-.A79a++AP6U+D,P4D..N/FDk\uGp%9AEaj)4Eb0<7Ciip"
+tO'D+<VdL+<jQI/g+k:F^K6/A79a++AP6U+DtV)ARloT5uf%KFCB32+ED1;Bl7Q:F(KH8Bl7Q+
FDk\uH!G52/.*LB+<VdL,#1HW+Dbt)A92j$EcW?G:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_
DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<XEG/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:
F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL:-pQUEbTT+/0K%T@;^.#F=\PU
ATT&:Bl.F&+E(j7F*(i2F'NT,/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+EhU43Zp+/3A*!I+>GZ6
+>>Pn6#^ie1,(I>+>G]61bq*L0O/K>$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q
+<VdN:-pQUCi<`m+=DVHA7TUrF"_9:@r$-=EbTT+F(KGGBkh]:+<XEG/g+S5A8c?.G%G]8Bl@lo
DB^V=+<VdL,&D1+A0<7?Bldj,ATT:B:-pQUA7]p,G%G]8Bl@loDB^V=+<VdL,$]"0/.*LB+<VkL
D/XQ=E-67F-Vcu\+EhU43Zodm/0HJk0J%0*4!6_,4?FZL0J"n*+=K2m3\i-,<_Yu&Bldj,ATT+'
+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag
2(T(W+<VkBA0O&W,%`TAAM?##2^0d[+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q
+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB
+<VdNFCf]=,!$iN$6UH6+<VdN1E\_$0O/K>/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW.Vs$5@<?4%
DI7[#Ci"$6F*)><AKZ.J/Kf+GF<GO2Ea`frFCfK6+D,P4+AZfa+@]dRFD,9/C`mP4@psInDf.14
DB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g,"LDII':+<YK=@psInDf/p-ASc1$GB7kEDIjr5
F\-4`DfTDoDB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g)8ZCi<flFD5Z2?[64!Ci=N=FDl&.
+>=o\>](`:$6UH6+<VdN:-pQU+<XEG/g,:XATJu1De!3tBl@l3GA2/4+CfP7Eb0-1+Cno&AR'*s
/.*LB+<VdL,#1HW+<Ve@@<Gq!De*:%+>=o\+<VdL+<VdL+<Ve3DB^V=+<VdL+<Vk'67uM\+tO'D
+<VdL+<jQI/g+\M@:VDA+C].04Y@jhCftUeA0>],@psInDf/p-ASc1$GB7kEDIjr5F\-4`DfTDo
DB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g)8Z:-pQUF`V,8+Dbt+@<?4%DBO.;FD)eBASc1$
GB7kEDIjr$@<?'cDB^V=+<VdL+<Vk'67sB'+=M&E@psInDf/p-ASc1$GB7kEDIjqE.3N>5F^K6/
A79a+0O/K>/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU+<XEG/g+SC@VKq)@<-W9A79RkF!,(5
EZf1:@psInDf/ft+tO'D+<VdL+<jQI/g)8ZAo2WsFDk\uGp"Li2_d'11E\D0/i,=,Ci<flFD5Z2
?[64!Ci=N=FDl&.+>>5eDII]qFDk\uGp"d`>](`:$6UH6+<VdN:-pQU+<Y95FC0-.A79a+-u<g3
@<?4%DI7[#Ci"$6F*)><AUYaV3AWH63?U(7/iPX:+DG8,?Z^3s@<itL>](`:$6UH6+<VdN>](`:
$6UH6+<VdN1,(F=+>k9#+Dbt+@<?4%DI7[#Ci"$6F*)><AKZ8'DB^V=+<VdL+<Vjh>](`:$6UH6
+<VdN8l\PV5u(d-Bldj,ATV9B3Zr0[Ch@]t@;I'3D.Gd^+F%./+tO'D+<VdL+<k'.+tO'D+<VdL
+<jQI/g+tKDJ*[*F_#&7+DbJ.BlnK.AKZ22FD)e<FCB&t@<,m$F(o9)F!+_*+tO'D+<VdL+<jTJ
;bTtS5u^EO:1&$UF(KE(FC.0l+C?iX0J5=?2`WW91c-gA2D@!I>](`:$6UH6+<VdN9M\#A<(Tk\
:-hTC?ZKk%ATMF)?TgFm-Wt"sCi=N=FDl&.+>"^3Ch+YX@;0gsAp%o;>](`:$6UH6+<VdN>](`:
$6UH6+<VdN<E)=]7Rg<F<*sZ[F(KE(FC.0l+>ti++<Ve%67sBT;cFl]Bl.E(H>d\4>](`:$6UH6
+<VdN9M%rM<)#YK?ZKk%ATMF)?TgFm+>ti++<Ve%67sC%FCf9)@<*K-@:sIlFEM,*>](`:$6UH6
+<VdN9M%rM<(Ke_>$l;aF(KE(FC.0l+>GPm+<Ve%67sBkAS6$pATJu&@W-F$+D>\6BmO]8>](`:
$6UH6+<VdN>](`:$6UH6+<VdNH#7(R8l\PV5u'L;6;pQR6U=[C:JNuO<'sGN7T2`T4%r4?8Q8DM
7lsC99hA;T:Jt@X9M\#A<(Tk\:-hTC>](`:$6UH6+<VdN.9pa7$6UH6+<Xqs+<VdLI0q)>+C-N*
+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQUF(KG9@3BB)@psInDf-[L+CSek+F.mJEZf:EDBND6+Cf5+
DJ=!$+CT.u+Dl%-BkDX)DJ().De!3tBl@l3G%G]'F'NT,/.*LB+<VkEDe!3tBl@lrH"Cf.Dg-8E
Df0,1$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"s
DKI'`+>tbX+<VdNBk/DK+<iLO0fV0RA76Z5$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K
3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr
+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,'.U>F`_SFF<Dth+F>^`8O6?*>](_m+<VdL+C,<s+<VeT
$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<VkEDe!3tBl@lrH"Cf.Dg-8EDf0,/0O/K>/.*LB+<VjU
8O6?!@o-TSD0%'f3Zr-FF^K6/A79a+0O/K>/.*LB+<Vk5DB^V=+<VdL,#1HW+Du==@V'R&De:,4
Ble!+B.n=;FED57B-9c3<?Q@)@<-EoDB^V=+<VdL,'.U>F`_SFF<Df"5uh0-+tO'D+<VdN:-pQU
Ch[a#F<GF/B5VF*F_#&7+CS_tG%De0DfTQ<Df.*KC3=?,@;[2u@<?'3+O63N+DG^9F(Jj"DIdf>
+Dbt6B5)I1A7[;7CghF"FEM,*/0K4L@<*nAD/X<6BHUhoGqNW<>](`:$6UH6+<klDDfp/@F`\a9
:gnB]F'NT,/.*LB+<Vk'67sC%FCB24DIIBn/0JJ7F(o9)@<?4%DCcoPEa`j,BlkJ+CijB5F_#&+
A7]CoAS#p6+EVX4DKBN6+EV=7AKW`b+D>\9EcW@?Bl8'8ATM*o+tO'D+<VdNF)>i<FDuAE+>k9g
/g*_O<?_bm+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV'
@prk,3Fk,o/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL,"-!a@;0OhA0>o,
F(HJ&DIal2ATT&/DJ!g-D..O#Df-\3F!,FBDg#i*ARlomGp$L8Bldj,ATV<4+poG8+C,<s+FPdJ
+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp@4$6UH6,&(R3
3ZoV'@V%N-0JG7+/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL
,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j
+Bo0q+<VdL+<iQt2D?g@0J5:A+?))/1b^jF0f([G3&*0F3Ar!e0ekR=1H.0O2)ZR61G1RB2E*QP
+>PW+1E\Ir1,gg@2'=e^DB^V=+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/JXDB^V=+<VdL+<VkU6#:1PCj[pa+>>E*+<W?j1-%'C1H79L2DI$F3A`WP+<WQb2*$%h
DB^V=+<VdL+<VkU+<VdL+FG;Z3&`HI+<W?j2E<HN1GgsE3AWZM2_m6L+>Gbs1GsPbDB^V=+<VdL
+<VkU+<VdL+FG;Z+>>E*+>>E%3AWHM0K(U>2_d<L2)R*H+<WE^0f48_DB^V=+<VdL+<VjY/M/P+
/LrD'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU;JBcTCj[pa+<WB]
+<W?j2)R-J3A<<I2DR9L3&*BM+>GYp0fFDaDB^V=+<VdL+<VkU+<VdL+FG;Z+>Yu"+<W?j2`E]M
2_d'E3B/cP2Dd3K+>Ghu1ba;^DB^V=+<VdL+<VkU+<VdL+FG;Z0J54*0J5%52D@*M1cI<O2)@0J
1,CaG+<W?\+?=gSDB^V=+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/JXDB^V=+<VdL+<VkU;fHG\@=0bV+<WB]+>>E.0JP=A0K(dJ1,L[C2)d?71,0n-3$<TRDB^V=
+<VdL+<VkU+<VdL+FG;Z+>Ykt?SF)l2`WZK1c.3K1H%$H2D[04+>P&s1a%0NDB^V=+<VdL+<VkU
+<VdL+FG;Z0J54*+>>E(1H.*I3&NTN2E3ZQ0etI++?1Jd2B[BPDB^V=+<VdL+<VjY/M/P+/LrD'
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klF
F`Lu',!$iN$6UH6+<jKG4ZX].?SO8n/i,FD3Ai];1c$aB1c@9O2'="a:-pQU9kA?ZA8,Ii+C&e.
/.*LB+<Vk29gh-*+>PW+1E\Ir1,iHU+tO'D+<VdN<DPb=+<WQb+<VdL+<VdL+<VdL+<VdL+<VdL
+<XEG/g*ke<$51?6Qg;ZAohO*>](`:$6UH6+<k'.+tO'D+<VdN:-pQUF*(i2+DtV)ALnrP0KjGj
F(KDGF(KH7.4cTMCijB5F_#')/0K%KD.Rc2Ao_<iFD5Z2@;I&s@<jCHFD5T'F!,.7F`MOS+Dkh1
F`_29>](`:$6UH6+<i12F!+sh@<-4+-TsL5-s9844&o'<9L:0NEbTT+F(KG9-UDQ]Depd_-W4Yk
AS`_U-W=tu@pp`iDB^V=+<VdL,'.U>F`_SFF<G'i@<-4+>](`:$6UH6+<klDDfp/@F`\a(F!:r6
+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV%An!bVAM?(f
/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL,#i5e+EMX5EcW@>BleB-A0>?,
+CK5(F(KE(FC65$Df'&.Ao_g,+A"k!+DtV)ARlp)FCB32/g)>F+<Ve4$6UI>/.*LBHO:l<+<k<,
Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag3%PCZ+<VkBA0O&W+uM)02I\Et
2'ORY+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVf
FC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN
n%6>+5uh8e@;TR,6tLFRB5V."Bl@l?84cW/6=G.NEaMRMD.P7nD(JaV;dW-J<c)8X/5ec@8hr(S
0J#V'@p_h`0JG13:NC/^Bl5J#Dfp)1ALpD@/44>nF*&s%FEq_ACi<s3?VYN]AR'*s/.*LB+<VdL
,!f[ZDesQ<DJq(.:G"FT=ALM+/70MnH#>0?/70q_1+k:;/28k;/iPLC2)$p>1H@'A3A`TP1+Y17
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70r%H#>0#H=^T"+AuciF^f0$@j#`2DfBW9@;J"k@WQI(F`_M>+DGm>
@3B/r@ruF'DII?(D/"$!@s)U+F`S[HF^fE6@;]Rd+DG^9FD,5.F(8o9An`B*Dg#].+B39&_kD*g
@3BGr+CS`#DesQ<DJpXG<%]dU>](`:$6UH6+<VdN6"=>?@<*ni;BRqZ2_6[>3&EQFcF>SO7<3)n
5qF]F2)mBD1b^XD/2Ah;3%QmC/i>OE1GLU8/Mo.61GCXD2_lp8/C(a[/4FSn/6m':/.*LB+<VdL
,!f^PATDZsE\'aZ+>c#4/2oFG3%W@[+@U<b/3tg=/2/\52(UL>/i5=C2)6s=/N#I>1,CgI2)?dL
Ea`Ek@k91VYq/=aBe34sAKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(LfWNl3+P<UFK\;+5
LY/jSb.bfFiOY=hEZee./T,!1EZcbXEbT].E[PoNASu$+.5"kC+tO'D+<VdL+<j*]BPDKt/4`Y]
1,1d?1H7-E/C(^I6Xb$e5qF]D1c[9@2)d?P/2Jn82CpR</i#@D1,1R92)d-I0f:[F2_6L2cF5>l
@<3u),%bP0F*&O5E,]W-ARlp*D]m?7+@BRYF(oQ3ASGRa+DG^9FD,5.;eofXDIIWu+AclcF)P<$
+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[FEarZ)3ZqW6+<VdL,#1HW+DbUtA8,po+Cf(nEa`I"
ATDi7Ao_g,+B;B1/N=k?;cY#45uf%KFCB24A79Rg+D,>(AR'*s/.*LB+<Vjf0JFVr/g,1G@:UKq
E+*j%+=DVHA7TUrF"_9:@r$-=FCfN8A79Rg054j;?Z':hARo.hFCB32?SX;j1+mZnF=/7>+<Ve4
$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag3@kL[
+<VkBA0O&W+uM>=1c[@#2'ORY+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR
$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdN
FCf]=,!$iN$6UH6+<VdN:18!NA0>r8@<-EM1c.3tDB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+
.kN>)/M/P+/LrD)/M/P+.kN>)/M/J)/M/P+.kN>)/M/P+.kN>)/M/P+/LrD)/M/P+.kN>)/M/JX
DB^V=+<VdL+<VkU6"4nRCisi;DgXi\@;TFnHpM7UATDZsEdU/_BPDKtHpM7_@:FUM@rc^:HpM7b
@V'FuHpM:V@:j(k@=1@OBOPpiHpM:VBl&0%DB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+.kN>)
/M/P+/LrD)/M/P+.kN>)/M/J)/M/P+.kN>)/M/P+.kN>)/M/P+/LrD)/M/P+.kN>)/M/JXDB]E1
+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<kW?@:XG$@<-F<+>R2>+tO'D+<VdN
F)>i<FDuAE+=BomD.R6#F*(i2F#k["+C$*O,=t1$?VY$HAR'*s/.*LB+<VkLD/XQ=E-67F0ea_s
/g*_O<F8L0D.Omu+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1
,!$hj3+FXQ3&<HM+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<j*^A8-."
Df0!"+EMX5EcWmP@VTIaFE8R7@;[2sAKYDlA7]9o@X0)-A8-."DJ()6BOr;X5uf%>Bl%?'DfQt0
H!G52/.*LB+<Vk=DeX*%+EV:.+D,P.Ci=N3DJ(RE>](`:$6UH6+<k'.+tO'D+<VdN:1\VlDdmHm
@ruc7DImBi+CQC1@;TR,+ED1/BQPA*@qBP!Bl@l3-rN>[/0JA=A0>Do@r,js@<?4%DBL>qARd/o
DB^V=+<VdL,%bb6+EV:.+A+CC0JG+5+D#M1@q[J;+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4
AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp.2/.*LB+<kN1,!$hjAN+-R3&*C&+tO'D
+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4
+tO'D+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<Vj`1c.-H
1b^O>+>l&"?T0\l0K:jD3B9)[3B9)[3B83=1+k@=1G^..3B/u@1E\G,+>@&<+tO'D+<VdL+<i<f
/M/P+.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHrafrF`VpaHlsOd
+>>E*1,1L=3&EBL0K(gH1c@-40esk-0RR,C+tO'D+<VdL+<l1U+<VdLHm!eZ2Du[3/iYRD3A`NJ
3&rlO2Dd?O1E\D4+>Yp'>](`:$6UH6+<VdNHlsOS+<Z%SHn[01+>>E&0f:dJ2`NKK2_d$F3ArZ9
+>P&r2LJbI+tO'D+<VdL+<i<f/M/P+.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](_m
+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sBtAS$"*+E1sG+?;G50eb:d
DB^V=+<VdL,"t<d3Zqcg0eP.>1G^.11+k@=1G^-r:-pQU6>ppeDf/ft+tO'D+<VdN=\V:I3Zp.;
3&i$:+>PWUDB^V=+<VdL,#qE%3Zp+]DB^V=+<VdL,#1HW+CSek+E(_(ARfh'+Du+>+DG^98O6?!
DIIBnF!*%WDImBiF!*%WDIIBn/0JtA/0JJ7@pEmq/.*LB+<Vjo:I72s+=K?63[[s>DKU"J.4cl0
1bgUA1GLXF.4dS93%d$E0KCmnDB^V=+<VdL,!f!k4Y@j.-8%J)-p'I;:I7Z\:18!N+AY<r?W'0s
8hr(S0Ha.X8matt@p_h`0JG1..3L/o+@/di>](`:$6UH6+<j3bCij)bF&-sjEbT&q?ZKk%ATMF)
?TgFm2)\]W+tO'D+<VdN-WY8/+Ce5VEc#kF4ZX]6=\V:G<DP\M69@:q:I6KQEbTT+F(KG9-WXer
F`Sp8DB^V=+<VdL+tt,n,\;")F(HIA6tL1V@8q;DG%G].A7]+gBldj,ATV9,>](`:$6UH6+<klD
Dfp/@F`\a9:gnB]F'NT,/.*LB+<VkLD/XQ=E-67F<cW7*$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0i
FEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W+u:o]11WCV@3R60+<VdND.RftA79Rg,!$inI4P^J
+<VkLDfp)1AKj/X>7)Jq+<VjQ,9T]hBl8$$Bl7X&B-:W#A0>`-A8,Y$Bl7Q+?uft&ATMF)?sIRn
/.*LB+<Vk5DB^V=+<VdL,!g$]+CK5(F(KE(FC65$De*E1+CoD#F_t]-FCB9*Df-\+DIal3ATMr9
F(96)E--.D@<,p%F*)>@ARlotDBO%7AKXT@6m-#S@ruF'DIIR2+CJf(FE:hB+B38%@q]:gB4Y=c
+tO'D+<VdNFD,5.@rGmh+E)9CEcl7BFD,5.FCfN8+Cei$ATJu>Dfm1?AS#BpFDi:9DKBo.Cht59
BOr;Y:IH=9Bk)7!Df0!(Bk;?.?tOP'F'p,!DIaktF`_>6F'pUC>](`:$6UH6+<k'.+tO'D+<VdN
<HD^o8ge[&E+*6l@:s-oD..<jB4Z*+FDi:9DKBo.Cht59BOr;Y:IH=6A7TUrF!+k'ASu("@;IT3
De*6,+CJhnDImisCbKOAA7TUgF_t]-FC6^D8S0)jDfo<&+tO'D+<VdNBOQ'q+DG_7FCB!%ARlol
Cht59BOr;pA7TUrF!+(N6m-2b+CT),ART+p+E)-?H#IhG+EMgLFCf;A>](`:$6UH6+<k'.+tO'D
+<VdN6"Y4MEZf(6F*(i,Ch[d"+A,Et+CoCO>](`:$6UH6+<k'.+tO'D+<VdN0eOS:Dg-)8Ddd0!
FD,5.8l%htA9Da.+EM%5BlJ083a?PH/.*LB+<Vk5DB^V=+<VdL+s8!N>A/,#E-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGF`_>6F"V0AF"(@3+tO'D+<VdN+<Ve3
DB^V=+<VdL+s8!N>A/,#E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-
ATBG9F`_[WBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-
ATBG9F`_[WBkh]<>](`:$6UH6+<hpN+C&e./.*LB+<VjN+<Y*1A0>i6F<G[=ASiQ(DBN@1@"*3/
D/`l*AoDKrATBD.DB^V=+<VdL+s8!N>](`:$6UH6+<hpN+C&e./.*LB+<Vj`/g+)7@<-H48l%ht
@;]Tu@q]F`CER5-EZfI;AKYr4ATMF#@q?d$AftJnF`_\4+CT.u+CK>6Bl%iu/mN9</.*LB+<Vk5
DB^V=+<VdL,(=ui8mH6X/.*LB+<Vk'67sC%FCB33+A,Et>](`:$6UH6+<kW?@:UK.B4YslEa`c;
C2[W1>](`:$6UH6+<i3q3[\N^FE8RIFD5Q4-Rg0L/g,(C-RW/:+tO'D+<VdNIXZ`NDB^V=+<VdL
+s8!N>](`:$6UH6+<iTo+=\j:DJXS@BkAJsDffY8A8,OqBl@ltEbT*++CT;%+Dkh6F(oN)+CoCO
.On\@+tO'D+<VdN>](`:$6UH6+<l8`IS*j_+tO'D+<VdNDIn$&+=D;RBl%i<+<XEG/g+YEART[l
F!,UIBl%i5A8,OqBl@ltEd8dADBL<UF`V,705>E9A8,OqF"_ZXBl%i<>](`:$6UH6+<k]7G@VgD
Ap&3:-QjNS:-pQU@rc-hFCfM9Ap&3:+DG^9-[p2ZATBG=De*Bm@rucFAp&3:-X:O5/.*LB+<VkW
IXYO>+tO'D+<VdN>](`:$6UH6+<iWp+A?]^A0>u-AKYMt@ruF'DIIQsF#mQD+tO'D+<VdN>](`:
$6UH6+<l8`IS*j_+tO'D+<VdN:-pQUCi<`m+E_d?Ci^_2Bl\9:>](`:$6UH6+<k`7+=D;RBl%i<
+BosE+E(d5-RW/:+tO'D+<VdN0HiJ2+?XCX@<?0*-[p/KD/_.NFD5Q4/no'A-X:O5/.*LB+<Vk'
67sC$AR]drCh+Z/AS,LoASu!hF'NT,/.*LB+<Vj^+D5M/@WNk[+FPjbEb0E4+=AOADB^V=+<VdL
,#1HW+EV%-AKYT!EcZ=F@VK^gEd8d:@:O(qE*R9)/.*LB+<VkI@:O(`+=D;RBl%i<>](`:$6UH6
+<k'.+tO'D+<VdN:-pQUCi<`m+D,b<F!,[@FD)e>FD5Q4+E)-?E+*j%>](`:$6UH6+<k`7+?MV3
Ap&3:+E_d?Ci^sH>9G^EDe't<-X:O5/.*LB+<Vj^+Z_;"4DJhDFD)dEIWT.<E%bgGFE9'KC3(b-
DB^V=+<VdL,#1HW+ED%&F_PZ&+ED%*ATD@"@qB^dDB^V=+<VdL+tt-PCi<d(-9`Q#/g,1GG&JKN
-X:O5/.*LB+<Vk'67sC&@;BEsAnc:,F<G%,DIIR2+C\bhCNXT$DB^V=+<VdL,&gt#CLeP8Ap&3:
-X:O5/.*LB+<Vk5DB^V=+<VdL,#1HW+Cf5+F(HJ)Bk)7!Df0!(Bk;?jDB^V=+<VdL+u:?[A0<6I
>](`:$6UH6+<l8`INf+A+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6
,&(R33ZoVX2DR7(2.Bu</.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL,#i5e
+ED%7F<GL6+EV:2F!,@=FCep"DegIF@<6L4D.Rc<+F.mJ+D>2,AKY])F*(i,Ch7-"?tOP'F'p,!
DIaktF`_>6F'pUC>](`:$6UH6+<k'.+tO'D+<VdN8TZ(`CiaM;@<6L4D.Rc2@3B#fF(o,,CMn'7
Ch7-iAKYo'+A,Et/g+)(AKZ).AKXT@6m,34DKTB(+D,P4+Co&*@;0P!/mN9</.*LB+<Vk-BOr;Y
:IH="@;^3rC`mG5+Co2-FE2))F`_2*+DG^9FD,5.?tX%gATD3q05>E9A8bt#D.RU,?m&lgA8c?.
/Kf+GANF(6+tO'D+<VdN>](`:$6UH6+<hpN+<VeU@:WneDK@IDASu("@;IT3De*Bs@s)X"DKION
A7f@j@kVS8A1hh3AmB3t/.*LB+<VjN+<VdL>](`:$6UH6+<k3.De(J>A7f3lBlbD*CiaM;@<Q'n
CggdhAKYo/+BqfYAKXT@6m,<7B4Y?sBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.).3]*A+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU
$6UH6,&(R33ZoVY0k4fOAS,Bq/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL
+sS<T?uft&ATMF)?m'Q&F*&OGF_Pr/>](`:$6UH6+<k'.+tO'D+<VdN9jqpb+CK5(F(KE(FC655
ATMr9@psFiF!+n3AKY])+CJf(FE:hB+@gHjF`;CEDe:,6ATMr9@psFiF!+n3AKYJkCi!Zn+C&e.
/.*LB+<VkLF_Pr/F"SS7BOr;rDf0Z.DKKqBDe:,6BOr;oEbTT+F(KH$+EM[>FCcS/F#kKP+<Ve4
$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag0ek3d
+<VdNBk/DK+<id&2E5,RA2YV_$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdL
HO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL
,'7C@F<Wag>7)Jq+<VdL+tG5q/M/P+/M/P+/M/P+/M/P+/LrD)/M/J)/M/P+.pQs9/.*LB+<VdL
,()+mDfB9*ARlo3Ed'0WD^ce\5($sbFE;hPFD5Q4HsCP5/.*LB+<VdL+tG5q/M/P+/M/P+/M/P+
/M/P+/LrD)/M/J)/M/P+.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN
:-pQUDfB9*+D,b<F!+n/A0?#:Bl%i5/KeJCF*2>2A0>f0ASrW5DKKT/+Du+>AR]RrCER2+A6a!r
/.*LB+<VkEDdd0!-YI".ATD3q05>E9-X:O5/.*LB+<VkHA0<rp-Y@LCF!,UIBl%i<+BosE+E(d5
-RU)F+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-
F<Wag0et9e+<VdNBk/DK+<k5R@lHAU1Gg:,$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K
3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr
+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB
+<VdL,()*f+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC/Hu@;[i-F)>i2AKW*<+<VdLHsCP5/.*LB
+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC/U#E+Noq
CL;."Deio,+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB
+<VdL,(+EFF(KE(FC/lrAT`'$F)>i2AKW*<+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC/ooG&qb6EcYT!@s)."D/X3$HsCP5/.*LB
+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC0'&F(KE(
FC0*+Deio,+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB
+<VdL,(+EFF(KE(FC0,uDJj$+?ZU(&CLnV2+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQU
Ch[s4+EV19F<G(%F(KD8Bl5%AEbTT+F(KGB+EM[>FCe]p+tO'D+<VdN/1r&$+D5_6+=D2DF(KE(
F=/7>+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-
F<Wag0f(?f+<VdNBk/DK+<i^Q0k3!q2In!_$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K
3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr
+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#1HW.WT6EATMF)?ZKk%ATMF)?ZU(&CLnW1/M/(nEbTT+
F(KGB+EMC<CLnW1ATMs7/mN9</.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU@rc-hFCeuD+>PW+
1MpQ@1,iHU+tO'D+<VdL+<jQI/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQU1,E?XE\K3jCi<flFD5Z2+DtV)
AKYDlA7]:VDB^V=+<VdL+<Vk5DB^V=+<VdL+<VkEDdd0!-ZWpBATMF)-X:O5/.*LB+<VdL,$]"0
/.*LB+<VdL,#1HW+Dk\$F`S[EB.b;e3@lm=0O/K>/.*LB+<VdL,"t<d3Zqcg0eP.>1G^.11+k@=
1G^-r:-pQU6>ppeDf/ft+tO'D+<VdL+<jr_6p3RR0f_3Q+>Y,q0O/K>/.*LB+<VdL,#qE%3Zp+]
DB^V=+<VdL+<Vk'67sBhA7Qg$@VTIaFE8RBDfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)/Keq>D.P7@
Ea^LAA7]7UDB^V=+<VdL+<Vjo:I72s+=K?63[[s>DKU"J.4cl01bgUA1GLXF.4dS93%d$E0KCmn
DB^V=+<VdL+<Vjo:I72s+=nil4s2783[[]i8mb>%D.Ohc6:tT_6!m5>0JG1':I7Z\6tKk88hr(S
0IJ:l/1r&2:I8<(+tO'D+<VdL+<j3bCij)bF&-sjEbT&q?ZKk%ATMF)?TgFm2)\]W+tO'D+<VdL
+<i16EcW@5:gnB]F!j+3+=LAe6p"CE4%qt&4@)b0.3NYFF(KE(F<Dr3ASuX3-X:O5/.*LB+<VdL
+tt,n,\;")F(HIA6tL1V@8q;DG%G].A7]+gBldj,ATV9,>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQUG%#30ATJu&Eb-A;Bln$&DBLYf+Dkh1F`_29+E(j7FD,5.D.R:$F!+q1DegJ#DB^V=+<VdL
+<Vk'67sC$ATN!1F<E.XDJsV>B6%QlF<G%8F<G47De'u%DJsZ1BHUo*EZen(D/UP@DfTVuDB^V=
+<VdL+<Vk&AS$"*D/!lN3ZoOq03f\D0d'aE2D?7.+=^V?0d'aE0esk,2'=Fm0f^@50d&#.+>P&s
2-b#C/.*LB+<VdL+u(bo4s3$A076K*AT`'2Bl5%F+=f*M+s8T_>p)$Z+>Fug>TtmF>p*K0+F>_G
+u(3%1*CpK+u(3@EcW@.DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk%69R@P+C?iX2D-dE2*!NP+>bl,
2Dd<N2`2^#+AP6U+AHEfBk1pdDBN2%+tO'D+<VdL+<jr_6p3RR1,(I>+>Y,q2dC5E/.*LB+<VdL
,#qE%3ZoP'+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sBT;cFl><'qdHAnH*qFBi]-/.*LB+<VdL
,$]"0/.*LB+<VdL+t$90+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%B6#:1PCaU?1DB^V=
+<VdL+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,4"!sG
Bk(R!>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQU6?6dQBQP@qFCB32+D,P4+>PW+1E\Ir1,g=M
ATDKqBjkmaDB^V=+<VdL+<Vk'67sBoFEDJC3\N.1GBYZJCi*Tu@:Lp"Df%.9F*)G@DJsB;04Js9
B4uB=F*(i2F"_iRE+<fsAM6#!2Dd<F1,(I>/MJt41,iHU+tO'D+<VdL+<j-n4ZX]I3[[40FCAm(
+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d@<,do+AuodAS`JV@;odoCgeGQASc0kFE2)?-X:O5
/.*LB+<VdL,!p?63Zpb1/3>m?6=k7MChI=%F(HImBl[p1F!+;"De"'2DBMboCi"6=+Auc`F_l2A
+B*5n@ppKGEas36EclFG6#LdQEb0;7<b5oP-QlZ3+tO'D+<VdL+<k'.+tO'D+<VdL+<i12F!+sh
@<-4+-TsL5-s9844&o'<9L:0NEbTT+F(KG96??CL+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,7V
@;^.#FE8RA@<?!m+D,%rEbp"DG@bT,+ED1;AM8+9FE8R8BkCsgEZd4^FDi9V0Hb4HDKU&4F'NT,
/.*LB+<VdL,!p?MEa`j,BllL!+?:Q!3%Qd<+?1o,1*A>0/29%*1Gp^<3$9t-0fU:40e>%=+>bl*
3\`T:2)/?R+tO'D+<VdL+<j-n<,uDbF(o_Z3Zpb1<,uDbF(o_=/0HZ-+>PZ&1,'h*0e>(7+>k]*
0d&2*/2B"(1GgX<+>ku,1E\M2/2\P-3%R*M+>d>@+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,7V
@;^.#F<G".FD5i>A7ZloAS6$pATM*o+tO'D+<VdL+<j-n6#:X+3Zp:;+?2>'0fC.62]t"6+>Yu"
3&_s;10e]@/.*LB+<VdL,!p?:Cihg$+@:-8Cih3c1E\G5+>kkr2`)X73$:"7+>u)"0f^@92-b#C
/.*LB+<VdL,$]"0/.*LB+<VdL,#h954ZX^43a<j`+B!8cDB^V=+<VdL+<Vjo9N4/9+=JX#0fpp?
.40Bg4s3g!:amM</g*K%6#:Wc>](`:$6UH6+<VdN<)Q[Y3Zoh!4>AoQ+>YGnHR:p!<)$1<+=o,f
6??+H@;^.#FBi]-/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+CT).BlnK.ATJu2@<?!m+EVNE0d("<
B6%Qp>](`:$6UH6+<VdN0d&V%4t\K2/MC?Q0d&bU<*X;b/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW
+EVX4DKBN6+EV=7ATJu2@<?!m+EVNE0d(=IDKU&4+DG^9GAhMCF<G(%F(JTo+tO'D+<VdL+<iN_
4Wlp@0-GWb-oNb%,<B-l?SN[/+>=om+F@?;0d'Fn<%/qA+>tnr,<B-l?SN[/+>P&q+F@?;0d'Fn
<*X;b/.*LB+<VdL,$]"0/.*LB+<VdL+t#rJ<?P%&<[U$k+Dbt)A92j$EcW?W>](`:$6UH6+<VdN
.!mRO+u(385uoEt3Zrc1>TtmF:-hocDB^V=+<VdL+<VjVHS/PI0d'%R<@L'l+F?.S+u(335uh0-
+tO'D+<VdL+<i1.@<Q[4+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%i@<Q!VFCB2s:18!N
>](`:$6UH6+<VdN-V7`hEcW@5:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+A"k!?VY$HAR'*s
/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+Co%q@<HC.+C&e./.*LB+<VdL+t$)rEbT&u@;^+,+Dae]
D.Oi":gnB]F!j+3+DG8,?Z^3s@<itL>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQUA79Rk+E(j7
<GZeuFWbaI@<*K0@<-I8+Co2(ATD$n+tO'D+<VdL+<kr#6p3RRC3=?)EarNo+E^g]6p3RR1,(I=
+>GPm0f`KV+tO'D+<VdL+<jfZ<Dlg[3Zp.50eP.73A`H5?SXJk1GgmA0jJT?/.*LB+<VdL,'?mb
6TmIQ?TB_r+C&e./.*LB+<VdL,'?RR5t=(!+>ti+>](`:$6UH6+<VdNF\G>%;Hc4E+>mDA+tO'D
+<VdL+<kr'5tsd23ZoeMCisc@+>"^WFCB24E+*d/Gp$X3DImi9>](`:$6UH6+<VdN-WOu*EclDD
+Dae]D.Oi":gnB]F!j+3+=MA89gh'c8jka@9N=tj4*=P&6T]Ea9gM92F\G>%;Hc/):-hTC.3N>5
F^K6/A79a+0O/K>/.*LB+<VdL+t$B,F`MVFF!,9o@;TQu@o-TSD0%'f3Zohn=\V:GF\5%`<D6Cj
<BG>'<'r`i9MIfC4*=4f:Jt@XF\Y4s74B?s@<Q""De*:%+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL
+<i1.@<Q[4+Dae]D.Oi":gnB]F!j+3-u<g3@<?4%DI7[#Ci"$6F*)><AUYaV3AWH63?U(7/iPX:
+DG8,?Z^3s@<itL>](`:$6UH6+<VdN-Ve)nEcW@>:18!N+Ce5VEc#kF4ZY!-De!3tBl@lrBQ%a!
INU@*2)ZR9+>Gi)+DtV2?Z^3s@<itL>](`:$6UH6+<VdN-Ve)nEcW@>:18!N+Ce5VEc#kF4ZY!-
De!3tBl@lrF_l2@FabGg0JkR.2]sk)+DtV2?Z^3s@<itL>](`:$6UH6+<VdN>](`:$6UH6+<VdN
0H`%pATD4#AKW?d:I60uAS$"*D/!l1<cW7(9L9k)9gg+(:EWPV+@:,l6??+H@;^.#F<Enk6#:Wc
<)$135tk6#<)Q[<:18<dF!+%_F`MOG@o-TSD0%(0DB^V=+<VdL+<Vj^+>>'PEaa$#+=K<4-V6U(
+AP4'-Rg/h+=MRh>TtmF:-ho0/0K9l>TtmF8O6?]DB^V=+<VdL+<Vj^+>>'PEaa$#+=D;79gg+H
8jje%9N=tj+E^[`6QgMF9gM8lF\G>%;Hb2;ATDKqBjkn"F!+J!F`MVFF!,U#5tscjCeeDUALC`#
+tO'D+<VdL+<k'.+tO'D+<VdL+<klDDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)?ZKk%ATMF)?ZU(&
CLnkuDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g,4KDg*=GATMr9
@psFi>](`:$6UH6+<iN_A8-+(+=D2DF(KE(FC0'&F(KE(FC0*+Deio3+poG8+C,<s+FPdJ+<Z"<
+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp.6/.*LB+<kN1,!$hj
1H.7(3&WTO+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3
D.OnP+<klKA8cU4+tO'D+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6
+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JkI=C,%P%1,UajDB^V=
+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'67sBmD00-,
De*:%+<XEG/g+bEEc#6,+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp@<Gq!De*:%
+<XEG/g,%?D.R6#8O6?!F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+tK
@:XG$@<-E3+AP6U+Dbt)A9/l6Bldj,ATT&9FCB24A79Rg>](`:$6UH6+<VdN:-pQUDII]qFDk\u
Gp"5)67sBu@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL
+<jQI/g,1KF(KE(F<D\K+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcYK'+tO'D
+<VdL+<k'.+tO'D+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV9fFCB&B?ZU(&CLpag+tO'D+<VdL+<jQI
/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28Eb$S>.68S,0JYF<1b^\"0f1^B2)&9Q+tO'D+<VdL+<jQI
/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<jQI/g+bCFC0-.A79a++AP6U
+D,P4D..N/FDk\uGp%9AEaj)4Eb0<7Ciip"+tO'D+<VdL+<jQI/g+k:F^K6/A79a++AP6U+DtV)
ARloT5uf%KFCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+Dbt)A92j$EcW?G
:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<XEG/g,%?
D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+ED1;
ATMF)+<VdL:-pQUEbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2F'NT,/.*LB+<VdL,$]"0
/.*LB+<VdL,#CR(;aj)83ZrHWF(KE(FC/U#E+NoqCL;."DeiohDB^V=+<VdL+<Vk'67sB/EbTT+
F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JkI=C,%P%1,UajDB^V=+<VdL+<Vk'67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'67sBmD00-,De*:%+<XEG/g+bEEc#6,
+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp@<Gq!De*:%+<XEG/g,%?D.R6#8O6?!
F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+tK@:XG$@<-E3+AP6U+Dbt)
A9/l6Bldj,ATT&9FCB24A79Rg>](`:$6UH6+<VdN:-pQUDII]qFDk\uGp"5)67sBu@;TRd+DtV2
BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K
+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcYK'+tO'D+<VdL+<k'.+tO'D+<VdL
+<jWJ;c?+Q3]\C(Bldj,ATV9rAS$"*?ZU(&CLpag+tO'D+<VdL+<jQI/g)Q_Bldj,ATT@DBl8$(
Eb8`iAKZ28Eb$S>.68S,0JYF<1b^\"0f1^B2)&9Q+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<jQI/g+bCFC0-.A79a++AP6U+D,P4D..N/FDk\uGp%9A
Eaj)4Eb0<7Ciip"+tO'D+<VdL+<jQI/g+k:F^K6/A79a++AP6U+DtV)ARloT5uf%KFCB32+ED1;
Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+Dbt)A92j$EcW?G:-pQUCi<`mF!,L;F(KE(
F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<XEG/g,%?D.R6#DII^&B45mrDf-\=
FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL:-pQUEbTT+
/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2F'NT,/.*LB+<VdL,$]"0/.*LB+<VdL,"4k!+ED1;
ATMF)+@/[p02>;@<(JZ@:K:@b+@pNIBl5&*Eb05DF*(i4F!*V/4Ztqk>](`:$6UH6+<VdNEaa/7
D.R-n3Zqc`/i#@G2E<QM3&WWS0JG:B1L+fA/.*LB+<VdL,%PD/FE2))F`_>9DBN@sF)Pl;FCcS3
Bl8'8AKYMtAnH*hDB^V=+<VdL+<VjN0H_Jm+<WE^+>Y,_1a"Xu2BXq`DB^V=+<VdL+<Vj_0H`;3
+>u5&2DlU42]t%%2BXb[DB^V=+<VdL+<VkLFCB94+CS`#DesQ<AKYi(DKU&4+Co1uAoh3p+tO'D
+<VdL+<kl8D/a<&+EM7CANCqV+<VdL+<WEt0jJT?/.*LB+<VdL,&M%3Bl/!03ZoOf+<VdL+<VdL
+<Vd\>](`:$6UH6+<VdND..['D09\V+<VdL+<VdL+<VdL+<WUJDB^V=+<VdL+<Vj_F*&OEF^]<4
Bl%?A+<VdL+<VdL+>I,=+tO'D+<VdL+<iRYA0>l7@<-I(Ch5XM+<VdL+<VdL10e]@/.*LB+<VdL
+u=7M+E;O4Ecc#3ANCqV+<VdL+<Vd_>](`:$6UH6+<VdNAnc:,F<GF=A7[eE+<VdL+<VdL+<WCD
DB^V=+<VdL+<Vk?Bl\9:+CT/0Bl.d!ANCqV+<VdL+?*PC+tO'D+<VdL+<kZ6@;\+K+<VdL+<VdL
+<Vd^/i,1:2dC5E/.*LB+<VdL,'.j:+Co&,DE8m_+<VdL+<WBk1Gh'O>](`:$6UH6+<VdNF),?2
DImm13ZoOf+<VdL+>>E-0JkLhDB^V=+<VdL+<VkDF`MSBF(o\V+<VdL+<VdL1G1UB1cS`X+tO'D
+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV9s@<Q^6@<-ErARfjiF)>i2AR'*s/.*LB+<VdL,#1HW+=M8E
F(KE(F=A>HDKKH1Amo1\+EqaEA12LJ3Zp131,CU@0J[At1c-sF0O/K>/.*LB+<VdL,#1HW+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/R30;/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<:-pQUAoD^,
@<<W6De*:%+Eh=:@WNZ4ATN!1FBi]-/.*LB+<VdL,#1HW+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0
<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)T#67sBs
Ddd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++AP6U+DtV)ARlp$
@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUEbTT+F(KG9
+<Ve%67sC$Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6
+<VdN:dJ#Y7790t+ED1;ATMF)?ZKk%ATMF)?ZU(&CLpag+tO'D+<VdL+<jQI/g)Q_Bldj,ATT@D
Bl8$(Eb8`iAKZ28Eb$S>.68S,0JYF<1b^\"0f1^B2)&9Q+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<jQI/g+bCFC0-.A79a++AP6U+D,P4D..N/FDk\u
Gp%9AEaj)4Eb0<7Ciip"+tO'D+<VdL+<jQI/g+k:F^K6/A79a++AP6U+DtV)ARloT5uf%KFCB32
+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+Dbt)A92j$EcW?G:-pQUCi<`mF!,L;
F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<XEG/g,%?D.R6#DII^&B45mr
Df-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL:-pQU
EbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2F'NT,/.*LB+<VdL,$]"0/.*LB+<VdL,#CR(
;aj)83ZrHWF(KE(FC0,uDJj$+?ZU(&CLpag+tO'D+<VdL+<iOFDB]E1+<VdL>m_\s+<Z(>+<Ve4
/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g,1WDBNA(C`mh5AKZ)+F*&O7@<6"$+DG^9FD,5.F*22=
AKY5q+tO'D+<VdN:-pQUF*2G@Eb0<5Bl7Q+@;Ka&@Wcc8.!'6DF`_SFF=A>NF`_SFFBi]-/.*LB
+<Vk'67sBL@:NsnFCfN8+EqO9C`me4Dg*=#5uU]N6om@OBkAJ`9.jIe+tO'D+<VdN1a$g\F<DrO
Bldj,ATT:D$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W
+uEd`2.C00Ag/c5+<VdND.RftA79Rg,!$inI4P^J+<VkLDfp)1AKj/X>7)Jq+<VjQ,9T<qBl%<o
DJ()"EbTT+F(KH$>](`:$6UH6+<k'.+tO'D+<VdN<+oi`AKYE%AKYD(DKTf*ATAo3Afu2,F*&OG
@rc:&FE8R=DBN>!F`_\4+EV:*F<G%8Bl%<&@;]TuA8-+,EbT!*FCcS&EbTT+F(KH$/mN9</.*LB
+<Vk-BOu6r+EM%5BlJ08+CT;%+EVaDARlp*D]inB+D#G6Bl\-0D.RU,+C]J8+EV:.Gp$X9+DGY.
F`VYF@<?''BQ&);FDkE%+tO'D+<VdN.W&U0AL\g2+Co2-FE2))F`_>9DBO"1EbTK7/g:WF+<Xqs
+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$2(T(W
+<VkBA0O&W,%`Vj3AN@#@j3H2+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR
$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdN
FCf]=,!$iN$6UH6+<VdN:-pQ_@WcC$A7'@kF(KE(F<GZW/KeMFBl%<&-us$CATMF).3N&:A0>Ds
F*)G:@Wcd(/mN9</.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU@rc-hFCeuD+>PW+1MpQ@0KEBU
+tO'D+<VdL+<jQI/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN>](`:$6UH6+<VdN@rGjn@<6K4FDYu5De!-?5s\t&
Bl%<?3B:G03Zoe95s\t&Bl%<?3B8H0>9IEoATD4#AKX)_5s[eGF_PZ&3B9)I>](`:$6UH6+<VdN
@rH(!F(KB6+=Cl<De(5#DB^V=+<VdL+<Vk5DB^V=+<VdL+<VkL@rcHM3ZoejBldj,ATT;)DB^V=
+<VdL+<Vk5DB^V=+<VdL+<Vjl0RHSl78?6B6TmIQA8,Qs0H_KCDB^V=+<VdL+<Vk5DB^V=+<VdL
+<Vk'67sBpAfrL9D.Rr@+DGm>Anc:,F<G+.@ruF'DIIR2+E)-?E+*j%+DG_'Cis9"+DGq&DB^V=
+<VdL+<VkAART+[Bk':e+=JUOD.Rr>/NQ'MHV[I,:..Z@.3g3SD.Rr7-X:O5/.*LB+<VdL,$]"0
/.*LB+<VdL,!I]-De'tP3Zr*I@:Wn_@k9!>F`_[IF`_>6F!i)7+>Y-YA0<6I>](`:$6UH6+<VdN
>](`:$6UH6+<VdN4tq>*D/a<0@j#DqF<EY+-YI"4FEhmMB4Z1%A0>o(@:UL)EbTW,+EM47GApu3
F!,O;@59\u+CSl(ATDj6EZeh&AoD^$F*)FFC2Rs6+DPe4GAqJAF<G[>D.Rd1@;Ts+<_Yt0/9><A
DCd.X-S0=KEc*EU?YEkhBOkOnAT`$0-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+DG_7ATDlG
Eb03+@:Njk@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&DfT*#+tO'D+<VdL+<j!'HREiD
+Dt\4-TsL59gM-E:L@OFDe*2tB4Z0--W!T;<*q"(F(96.>](`:$6UH6+<VdN4tq=X5snOG?X[\f
A7$HuF`\`S4DJbPGAqJAF<EY#+F>5K@s0:D14:9_@s1!r+=qD?G$Jo//.*LB+<VdL,$]"0/.*LB
+<VdL,#1HW+E_X6@<?''<_YteDB^V=+<VdL+<VkOD.Gdj+C$*C-WWr0-S0=KEc,-"+tO'D+<VdL
+<k9;Bl%<jFDX0%+EV=7ATMs%D/^UF-X:O5/.*LB+<VdL+t+g>9gg?[F(96..6T^7-np!kD.G(H
-p0474u%D-D.G(H4CWGICh.'uD-Us&/.*LB+<VdL,!I]-FDYu5Ddso/F`\`R<_Yt0/9><ADBN2%
+tO'D+<VdL+<k'.+tO'D+<VdL+<klDDfp/@F`\`R@WcC$A8,po+Eh=:F(oQ1+>#c"-TbQW/gj[o
6mjO,@rcHlDB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sBnATT&.BleB7Ed8d<De!p,ASuTpDB^V=
+<VdL+<Vk'67sB/BPDO0D.G1F?Ys=$.6T^79gM-E:L@OFDe*2tA8-+(+=Lo;F*)804ZX]584c`Z
:Jt>&-S0=KEc*<W-XU_$-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+D58-+EVO4D]iS/@s)X"
DKK-$+tO'D+<VdL+<jQI/g)QaDe*d'A1T*8D.G"C4ZX][5snOG?X[\fA7$HiBle59.!0B<Df'#J
3ZoeL:IIuc-S0=KEc*<W-XU_$-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+D58'ATD4$AKYf-
@:UL%@rc:&FBi]-/.*LB+<VdL,'%09>9G;6@j#W0B-:f#Ch4tW3Zr9UF!,O6Ec,-"+tO'D+<VdL
+<k'.+tO'D+<VdL+<jQI/g+e<DImisFCcS)Df'H%DJ=$,+>"^GDf0Z*Bl7u7GAhM4F!,UHARlp*
D]j.5F*&OA@;0U%B6%p5E*R9)/.*LB+<VdL,'%09>9G;6@j#W0B/1TABl%?9-TsL5D/=89F(96.
/14G>Bl%i<>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQUF`:l"FCcS.@<6*eDB^V=+<VdL+<Vk@
BOPsq4ZX]j+tdqHEc*EU?YEkhBOkOnAT`$0-X:O5/.*LB+<VdL+t.MBEc*EU?YEkhBOkOnAT`$0
-Rh2>+=JXZBONYR2B[$O@:UKmBl%?04(<>HCh.'uD(-SU0H`)!I3<09@<6*eDB^V=+<VdL+<Vjl
0RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79RkF`M:G+C&e./.*LB+<VdL,$]"0/.*LB+<VdL,#1HW
+E_X6@<?''A8-+,EbT!*FD5Z2+D,>(ATM*o+tO'D+<VdL+<i3i+?CW!.3N5:Ch6jh+tO'D+<VdL
+<kN3/g*_T=%Q.0A8a)*DB^V=+<VdL+<VjN+EMC<F`_SFF<DrP@<Q3m+DG^9IS)mn92eAI6VC?*
>](`:$6UH6+<VdN>](`:$6UH6+<VdN+<Y30@:O(oA3DOfC2dU'BHS[O8jPg;;b02A92dJk>](`:
$6UH6+<VdN+<Y`8E]l#tA85O_CNF#;F(96./13&aC3(b-DB^V=+<VdL+<VjN+=M>M85E/`+D,>(
ALSaGEbTW,+EM%5>](`:$6UH6+<VdN+<Xp,+tO'D+<VdL+<hpN:-pQU@rH=3+CT>4De!KiFCeu*
Anc'mF'NT,/.*LB+<VdL+s8!U6uHFMAKXBZ@VR8R/g)Qh/g)\fHTESu0RH2a5u^B^?W0p2?V4*^
DdmHdDB^V=+<VdL+<VjN+DGF?+@L*UD.OhA3Zoe^F`_[P+CoCC>](`:$6UH6+<VdN+<VdL:-pQU
Ci<flC`k-<F`_[R+CoD#F_t]-F<G+.Eb/a&DfU,.DB^V=+<VdL+<VjN+<Ve;De!<@/g+CC/g)N0
:IAJ:/4=DcC+L`>-X:O5/.*LB+<VdL+s8!N+=M8A@:UKkDe!</-ZWpBATMF)/oY?5-Rg0^EbTW,
+Co4q@r$-r/15IPF(KE(F=qNCAg^i$+tO'D+<VdL+<hpNASu$2>](`:$6UH6+<VdN+<YE@D/a#K
/g+nJ@<?0*-[p/KD/``b-X:O5/.*LB+<VdL+s8!VEb/Zi+DQ"8E+CLIEbTT+F(KH#DJsW.@W-1#
/no9MDIOtB+Eqj?FCcS*C11UfF(?gLEbTT+F(KH#DJsW.@W-1#/no9MDIOtuDB^V=+<VdL+<VjN
+=M8A@:UKqFDYu-/15IPF(KE(FC/p(FCep"DegtEA7d2<+Eqj?FCcS*C11UfF(?gLEbTT+F(KH#
DJsW.@W-1#/oY?5-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL+s8"=FCfN8A3DOfC2dU'BHS[O8jPg;
;b02A92dKcATMs(@<>p2-X:O5/.*LB+<VdL+s8"=FCfN8A0>MrFEDbL+=Cl3F^K#pD.R6bF*(i2
F'g[V1,<3YG]Y<<DB^V=+<VdL+<VjN+CoS*F*(q8B4Z1,G]Y&U:18<[B45mrDf/o\FCB32?Z^O7
-X:O5/.*LB+<VdL+s8"=FCfN8A0>MrFDYP2-UMifB4uBo;flGgF'hXQEbT&u@;]F<Ci*Tu@:NY"
1MpQ@1,iQWA1(W"+tO'D+<VdL+<kB5F(K&t/g*_T<DH+f+CoCC>](`:$6UH6+<VdN+<Y`BDfp/@
F`\aI@ra^b+=BoU9i*knF('6'+DG^9IS)mn92eAI6VC?*>](`:$6UH6+<VdN+<XEG/g,4FE]l#t
C2dU'BHS[O05#!@05=p*CNF/t@r$-=-S0=KEc*EU/no'A-X:O5/.*LB+<VdL+s8"'67sB/FDj]G
;cFlOBl%?0+Eqj?FCcS9@rbgl+tO'D+<VdL+<kB5F(K&t/nAlQ>](`:$6UH6+<VdN+<WB]>9J!#
Dg-//F)rHOA8-+,EbT!*FCeu*Df-\!8PUp=:.\P1Df0B:-QmG@FEMVA/mN9</.*LB+<VdL,%YY&
/mN9</.*LB+<VdL,$]"0/.*LB+<VdL,&(XA+D,20BleA=F(955A8a(C>](`:$6UH6+<VdN+<WB]
>9G>7ART*lGpsk[EbTW,+EM47GApu3F!,O6Ea3K+/.*LB+<VdL,%YS3AM.5*+tO'D+<VdL+<hpN
0d'[CF(fK9E+*g/+=D#?F)u&5B-:`!F*)G:@Wcd,Df-\=@rc:&F<E/!-TcBZEa3K+/.*LB+<VdL
,%YY&/mN9</.*LB+<VdL+t6c7+tO'D+<VdL+<k'.+tO'D+<VdL+<k<6@s)g4ASuT4FDYu5De!-?
5s\t&Bl%<?3B:GODB^V=+<VdL+<Vjl0RI_K+FPjb:JaJT6qK`g>9G^EDe't<-X:O5/.*LB+<VdL
,$]"0/.*LB+<VdL,%GP$F`MM6DKI!K@UX=h-X:O5/.*LB+<VdL,%GP&Eaa$#+?Xa_E,9H&?U6tD
@WcC$A2uY1?X.Im/.*LB+<VdL,$]"0/.*LB+<VdL,3"iGifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufpifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXOBcZI/.*LB+<VdL,3"i=
1#eFL@r-()ARlo852qfYAp&3:ifo%;FD5Q4ifo%"DB^V=+<VdL+<VlfPa(0lJDug#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifog8DB]E1
+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g,4KDg*=@@;0U%EbTT+F(KG9
D..3kEa3K+/.*LB+<VkLD/XQ=E-67F0d("@F)W6L@WcC$A7'@kF(KE(F=1=2+tO'D+<VdN1E^UH
+=AN\$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W+uM,5
@khCK@3R60+<VdND.RftA79Rg,!$inI4P^J+<VkLDfp)1AKj/X>7)Jq+<VjQ,9T9gC`m8,DIjqB
+EV:*DJO;9AoD]4E,8s.Bl7Q-$6UH6>m_\sI0q*&/.*LDD.RftA79Rg,!$in$6UH8CLqO(AScF,
ARcoF+F=G<+<Vk=Ble60@<l3t@;TR"3ZoV=+tO'D+<VkE@;]_#@:s-q3ZoV=+tO'D+<VkG@;TR"
3ZoV]CLqO(AS`Ot+<Z(`$6UH8Cgh3oF^\oo?YOCiD^%4bHO:l<+<kE3Ch6sbG][M7F(oQ1,!$hj
/no'A+tO'D+<VkFBl.F'H#R==3ZoVgAU&;M8g5en+<VdNDIIBn,!$hj8g4Tb+FOS>I4P^J,&Uk%
DfT]'F<Wag1b8tV,&Uk%DfT]'FC/m!DJsP>3Zp9eI0o                               ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c-=6+>P&r0H`;/+>PVn2`;d51*A>2+>Pbr2`Mp71*AD1+>GPm1,0n+2'=kFEbT0"FC.sg@<-Er
9kA?ZA8,Ii?U8LF@;]L`?SXES@<++^?Ys=eFEDJC3\N.1GBYZJCi*Tu@:Lp"Df%.9F*)G@DJsB;
04Js9B4uB=F*(i2F"_iRE+<fsAM6#!2Dd<F1,(I>/MJt41,hs:G%kStFD5Z2?W2&TEcYT0G][h3
G%kStFD5Z2+EMX5EcX8aBQS?8F#ks-ASs,EBkqF%ARoL`/oPcC06_,GBeN.oF*(c-Am]V$@<-Er
AoD]sDII^&B45mrDf/BI;cI+EBldj,ATUaE;cI+EBldj,ATT&6Df^"CE,ol,ATMp2EbSs)?Z':h
ARo.hFCB32?SX;j11,-JFEM\;3$;^PFs(^8+AZT]Bk(jcC`l;8<?OY;FCB!(B-;8/AS#s+Bl5%b
5uh95FCB2sGAhM;Bl7Q9G\hGG+>"^WAS!!#Df021A8bsoDe!3tBl@lrARfjO6WG6W7:C4YBHTZR
DKKH1ARlo`DJ=9*EcYe@+Dbt+@<?4%DK?q4Bl%@"Eb]W/F(KE(FE;#8F`8IDBldj,ATT&6Ec5](
@rua*F(KE(FB*BnE_BthF*2P8Ebf63Er                                          ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' riseset BOM CR DAYSECS IFACEWORDSriseset JULIAN LF LIMITH'
zz=:zz,'ORZ LIMITMAG LOCATIONNAME OBLIQUITYDMS2000 OBSLOCATION ROOTWORDSris'
zz=:zz,'eset STDALTITUDE UTCOFFSET VMDriseset alldifs apparRADEC apparsecs '
zz=:zz,'apparsidjd0 apply arccos arcsin arctan assert atan2 boxopen cold_ia'
zz=:zz,'u_named_stars cos cosd ctl ddfrdms deltaT0 deltaTdy dfr dmsfrdd fmt'
zz=:zz,'_today gT0jd gT0ymd hmfrds iau_today intr3p julfrcal loadstars loca'
zz=:zz,'tion_home location_uluru location_yellowstone meanobliquityT0 meano'
zz=:zz,'bliquityT1 meanobliquityjd0 meansid0 meansidjd0 nav_today nnth0 npt'
zz=:zz,'h0 nth0 nutation_longitude_dPsi parse_iau_named_stars parsecsv pars'
zz=:zz,'etd read rfd riseset riseset_calc rjust round sin sind smoutput tod'
zz=:zz,'ay_calc zetzthT0''),<<;._1 '' risesetUtils J2000ymfd afterlaststr aft'
zz=:zz,'erstr antimode atan2b beforestr dev dsfrhms dstat fdfrhms fuserows '
zz=:zz,'kurtosis mean meansidymd0 median midpt mode2 nutation_obliquity_ecl'
zz=:zz,'iptic_dEpsDeg ofreq portchars q1 q3 rjd skewness ssdev stddev tabit'
zz=:zz,' tlf var winlcchars yyyymmfd''                                      '
zz=:967{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fC.0+>P&u+?);@+>GVo1bpn.Bldj,ATU[6/h1mUF(KE(F<GWV/KePAD/aW>AKZ#-F(HmFFE1f-
F(o_=@;]TuF(KG9FD5T'F!,C5+A"k!+DtV)ARlp)FCB32/e&._67r]S:-pQUG%G]'@<?4#3Zr-S
FCfK)@:NjkGAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9KD00-,De*:%+>"^J
DfT]'F<G[DA79a+G%G]'F!,L7F*2;@%15is/g)9N@<Gq!De*:%+>"^R@;TRd+A"k!+EMX5EcW@D
Ble!+B.n=;FED57B-;;7A79`m$;No?+<YK=@:XG$@<-E3/KekJ@:XF%EbTT+F(KG9F*(i2+Cno&
@1<Q=67sB'DII]qFDk\uGp"[]DIIBnA0>buG%kStFD5Z2+EMX5EcW@DBle!+B.n=;FED57B-;;7
A79`m$;No?+<Y]=F(KE(F<D\K/Kf(JF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-Du$;No?
%15is/g+YEART[lA3(hg0JYG$@<+%^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o*D..H?
3?T_a@<Gq!Df09%BQP[GEb0,sD.R6#-u!+4?Z^3s@<j:E%15is/g)o*D..H?3?WKREbTH7F!,:;
@psInDf-\=ATW$.DJ()8ATD7$+=M&E@psInDf/p)Cisc@.3N&0A7]9\$;No?+>P`i@<+.X+=M,9
G$f?0A79a4+CSekARl5W:-pQU1,E?XE\K3j-t[=<?Z^3s@<j:E@:Wn[A.8kT$=e!aCghC++=D2D
F(KE(F=.M)%14LD+Z_>4.3L?'+AP6U+D>J%BHV87Bl8#8E,oN"Ble!,DK9H4ATMF)<HMqkF&#%S
.WT6EATMF)+ET1e+Cf>,E-686+ED1;ALnsGEa`j,BlkJ+DIal2ATT&:Bl.F&+E(j78O6?!DIIBn
A0>r8@<-EA%15is/e&._67sC(ATD6gFD5SQ+DG_8ATDBk@q?d,DfTA:F"'-Z$;No?+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+<YK=@:XG$@<-E3/KekJ@:XF%EbTT+F(KG9F*(i2+Cno&@1<Q=67sB'
EbTT+F(KG9+<W6YEbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2Et&IO67r]S:-pQU@rc-h
FCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@r,RpF!)iNBldj,ATT:/
$3                                                                        ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1".+>P&u+>bks0esk-2f`VRATMF)EbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j78O6?!DIIBn
A0>r8@<-F0Bldj,ATUpoBl%j#Df0Z*Bl7u7GAhM4F!,UHARlp*D]j.5F*&NQEbTT+F(KGB    ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>Yi23-&_SATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
DJsB+@ps0r@;KRpEbTW/D0$-nFD,*)+Cf>,E-686+EV:.+ED1;ALnsGEa`j,BlkmK@;]TuF(KG9
FD5T'F!,C5+BqE'<@r)sD.R6`-tm^EE-"&n06_Va/nna:/oPcC0.@>;F*(i2F"SRE$4R>MEbTT+
F(KH$+DGm>A8-+,EbT!*FCeu*@<3Q"DBNA1G\Lu1@<-W98g%PQA8c?<+@1-pBl%ToEd8d9A7TUr
F!+n3AKVEhBQ%s6ARlotDBNn=Bm*p,AKXKWF@^O`+ED%4Df]W7DfTQ'F"SRX?uft&ATMF)?m&rf
DBND"+DG_7FCB!%ARlnm$>FB#FD,5.Ci<flC`l=mAoDKrATAo$IUQbtDf0VLC11UfF'p,7Bln#L
%13OOIXZ`p+F>4`C*7p6$>aWhA0<7=@:O._DC5l#%15is/g+b?Ch7Z1Ao_g,+D>k=E-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$.!@:O(o%16feF*(i,C`k*<Bln$2@QIt,CLqO$A2uY'C11Uf
F(eulCNCj4$4R>;67sBpDKBo.Ci!Zn+D,>(ATJ:fA8-',-[oK7A8c@,05=p*CNCj4$@[GQINT(,
%15mK@q?csDKBo.Ci!Zn+DGp?@ps6t@V$ZuDdd0fA0>;uA0>o8DBO.;FD*]E$4R>kIXZ_gHQXqU
+FO\+Ci<`m+=D2DF(KE(F=.M)Ci<flFD5Z2?[64!Ci=N=FDl&.+>=63%15is/g*_O<?Q@)@<-E3
EbTT/DJ(VDATW$.DJ()1G%G\::MaPa7U^"QBP)C'%16]aFC0-.A79a+Bjl-kFDk\uGp"dM$@[GQ
INT(,%15RCEZf4;Eb-A(ATV?pCi^_-@W-C2+EM+9FD5W*+E_WS+EDUBDJ=!$/0JA=A0<(0@:O(e
DJ(.9?uft&ATMF)?m'K$An>ul$?U2/FD,5.8p,)uFCfJ8DJsW.@W-1#+Br5oBldj,ATV9sDffQ"
Df9DDBlJ?8@UNIiBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CNF/t@r$-=@Vfsl05Y-3
DD-$EF(KE(FC/p(FCep"Degt>E-Z>1.3NPL+EV:.+E1k'+Eh=:F(oQ1+E(j7F(&os%16<IEbTT+
F(KH#DJsW.@W-1#/oY?5?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF(eulCND.<
Ci<c9D..-r061cJATMF)?Z'e(AR]RrCG'R:Ago>T6>psZ+E(j7FD,6,AKYT!Ch7Z1@<,p%Bl8!6
@;KakA0?)1FD)e)EbTT+F(KH$/e&-s$4R>IF*1r5ARfgrDf0o,FCf]=FEDkMBldj,ATW>C8T&W]
Eb8`iAUP!p%17Q5IXWDd+>.COI16N++E1b0F(J]m@<Gpp@;TRd?ZU<tEcW?G+<Ve%67sBjDf0`0
Ec`Eq5uf%:FCT,0FDi:3DesQ5DBNJ(@ruF'DIIR2+<VdL+<VdL+<VdL+<VdL+:SZ#+Cf>+A7'%Z
F^K#pD.R6bF*(i2F!)SJ+<Ve%67sBP5uf%F@;TRd+EMX5EZf14F*&OHD]iM2@r*9$ART+\EZfI4
@VfTu+<VdL+<V+#IXZ`p%13OO%16?]F^fE'@ruF'DL5W1AU&<=FF/%BF(KE(FF>8tChI[,Bln$*
+AQisATN8/$4R=O$;FrHGp"5;EbTT+F(KH$+CT)!DfTQ6BPhf5@<,p%FCArrDBNP3Df$UhARTI!
9k@mYF!l#O@W-1#+=]ZuFE2;;Df'2u@;I&PChI[,Bln$*F"/dO$:,e26q/;/DfBtEDe:,6BPDN1
@W-1#+DGm>@<Q'nCggdhAKYYtEb.9@$4R>HBQS?8F#ks-BjitT1,psH/p24f@<,jkBm+&?DfTJD
1,(@qFCf<104ApDEc5i6D/!KgCgh-mDfTQ6BPhg*ARTInAS$"*0f_6K03ou>FEDJC3\N.#@5oqr
3&!9DF`T0DEarcsG%E:EEb@$\0J@-^ASlKA@<6O2Df0K1Bk(Rf@;KRpEbTW/D0'H'@;]pnAT`&K
3B8fI.1HUn$=RalD]i_)Eb.9@$4R>HBQS?8F#ks-GB\6`@;TG!Df.1;Df%.K5A<9%FE2)7@W-1#
F!bp@4`Fa`2^L7G8nDFK.nsSdF`SmN4`Y+MAThL"@qB[hDJLS@AU&;[8nDFK.nsSdF`SmMAS+)9
E*m("Ch[cu?ZU6p@W-1#?SPh7BQS?8F#ks-GB\6`@;TG!Df.1;Df%.K5A<9%FE2)7@W-1#F!bp@
4`Fa`2^L7G8nDFK.nsSdF`SmN4`Y+MAThL"@qB[hDJLS@AU&;[8nDFK.nsSdF`SmMAS+)9E*m("
Ch[cu?ZU6p@W-1#?SNu=$4R>;F`_&6Bl@l3@;KRpEbTW/D0$h.Eb-A*Ec5e;8muuf<+0Z^ATB/>
+EM7=ANC8-%16<QFEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VLBl7HmGV3rKE*Xl*
FEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VLBl7HmGV3rKE%)5'%15g<Ebf3(GA\OH
ATDj+Df0V=De:+k@;]soE[PoN@;KRpEbTW/D0$h.Eb-A7FDl22A0>T(+EV:.+A,Et+CJf(FE:h4
@;]Tu@!-R*Ci`u,A8,OqBl@ltEbT*++>#/s+EM+*3XlE*$8F.U?uC+/@<?4%DI7*q?YjXuB5)I1
A7]+Y:ig>XD.I#`$4R=t/g+P>F`_&6Bl@lrBl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP
?Ys=]%13OOBl5s@$4R>HBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkA:
@<6O%E\D$IFE9'KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkA:
@<6O%E\D$IFE9'KC3(g5$4R>HBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=
DdkA:@<6O%E\DQWBl%iCBkh]p-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![A
Ci<c9D..L-ATBGHFD5Q4/no'A.1HUn$4R>1AScHs+B0I3cBM9W+DGm>@rH4'F`_2*+E_a>DJ()2
Des]:Df'2sC`m;6E,oN2F(oQ1F!+q;+@U?jAStpl+CT.u+AHEYF`T)VF(JoD%13OO>A/,#E-"&n
04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=/nf?DCgAH&FEDJC3\N-t
@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYhC%13OO5p1#QEbf3(
GA\OHATDj+Df-\9Afu2/AKXBPCij).<$3U7PZ0(S@;KRpEbTW/D'3P6+DG^9?tOP'F'p,3AS!n3
$4R=s/g+P>@<5jaE,TQ<DJsB+@;K:^G]7\7F)u&6DKB/sDfT2qAScHs?Z]XlA7,iR%13OO=`8F*
@ps6tA8-+(CghT3FD,5.D..I#A8c[0+ED%*ATD@"@qB0n@:F.tF<GdAFD)e=BOr;Y:IH=:G]7\7
F)u&6DK@iJ$4R>kIXZ_gHQXqU+FO\+Ci<`m+=Cf5DImisCbKOAA1%fnDe'tP3[\N^FE8RIFD5Q4
-OgDX67sBkBle60@<iu4@<--oDg-(AA8bt#D.RU,Et&I5+Co2-E$.4bI4dc51aZaNCag\`4s24j
F`_&6Bl@lr-T`\n@<5ja-OgE3IXZ_g%13OO9jqpb+D#e+D/a<&F!,O;Dg,o5B-:l+G9D!G+E_a:
+Eh16BlA-8+CK5(F(KE(FC658DfTB0+CT;%+DG^9FD,5.8l%ht?tOP'F'p,4ATMr9F*22=AKYB$
Bldj,ATV<4%166VFWb1&DBNJ(F)Yr(Gp$O3C`mh5AKZ)+F*&O7@<6"$+EqOABHVD1AKXT@6m-&c
E,oN2F(oQ1F#ja;%17Q5IXWDd+>.COI16N>+D5_6+=D2DF(KE(F=/1R+AP6U+EV19F<G(%F(KD8
Bl5&7F_Pr/%13OO1E^4BF)W6LEbTT+F(KG@+<XEG/g+\=F)Yr(Gp%3?F*&OGF_Pr/%13OO1a$g\
F<DrOBldj,ATT:B+<XEG/g,1WDBNA(C`mh2F*)IGBl5&7F_Pr/%17Q5IXV_5%13OO%13OO%13OO
%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO              ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' riseset riseset_atan2_smoke riseset_espenak_smoke riseset'
zz=:zz,'_meeus_smoke riseset_navstars_ecu_smoke riseset_riseset_smoke rises'
zz=:zz,'et_tanner_smoke''                                                   '
zz=:150{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*ALu1GWubF(KE(FED)8F<GX7EbTK7F!,(5EZccNBldj,ATT@DB6%p5Du~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A7n2)-t#F`_[I/KeYDEc#6$+E_d?CijB&Et&I>4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-
$=IIgFE:h4BlbD*+A,Et+=_>QF<G+.@ruF'DIIR2/h1(30jPoDBOQ!*@rH7,@;0V#%16fkASlK2
Eb0&qFCeu*FDi:=Gp"S1BlnH5AKXZ85u&P$@q]e!C`l5ZDf''-Ed8d+@;Tt"ATAnA9MAAT;^j1*
$?1$(C1Ums/g+,,BlbD9Ec5](@rri-F!+n/+CTA6ASlC.+EVNEGB.D>AKYD(@W-1#+EV:*F:AS"
F(KD8FD,5.9LV6B+DbJ(B6@WqAKZ)5+D,P4D..6sGp%'HDg#\7F*(i.A79Lh+D#A#D.RU,@<-W&
$:T)ICh[Ek@;[3/@q]e!C`l5ZDf''-Ed8dLBOu+&ASlK@%13OO8K_ShE+NO$+A!]"Bl%T.@V$[+
EbTW0DJ()#+EqO1AKZ#%DJ*N'De:+a02,eRAQUT^H$!_<DBLPa/g+_I+Ceu)ATD2g$><jXCNCVB
BPD9o+EqaECM@[!+E)-?9MAAT;_ALd%16<G0jQg_<+ohcAnc:,F<G+.@ruF'DIIR2+E)-?@3A0<
6m-GWFD)e2F!+t$Ci!Zn+:SZ#+<VdL+EV:.+=_>QF<G+.@ruF'DIIR2/h-                ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:fromascii85__MK__JODobj 0 : 0
1E\P#-p0UR/mg=U-QkfC=]7aV;]nY$5sn(B:JsSZEbTT+F(KG98hr(S0R7MIA0=KE9M%NF+A>@$
8Q85V;Hb2:8PMcU9gM8l9M\#A<(Tk\:-hTC+AY<t8PrJZ<*;U`;]nk&9M&)]8Q8h\9iEf$0JFVF
6;pQR6U=[C:JN$1:JXqk:JsSZEbTT+F(KG9;cH.N9N4S_<CB7u<E)=]7Rg<F<$5496um!_ATMF)
+CT)&A8,Xs+CT5.@<,736q'Hc@;p0oEcYf%F!+n1E+*d.Bk1sh0HaeG@;[hC@<>pq11DA9Derrk
Bjl-kDIIBnA7'D"@<-E3A7TanEbK<2+Co&"FCA-&+Co&"FCA-ZGp$X=Ao_R%F!,(*Ao_R%F!,(3
FC0-.A79a+B2gR"A0>Ma0R7MG+D>V(Eb'56BPhg&Eb&^%+D>V5Ao_F'+DG8,?Z^3s@<iu0@<Gq!
Df09%BQPA2DKKnTE$/t8@:XG$@<-E3Ci<flFD5Z2?YF@pAKYf-@psInDf/p)Cisc@+Dbt+@<?4%
DI7[#Ci"$6F*)><AKYi$@;^!mCh[m3BlnW"0Hb4D@;^!mCh[m3BlnW"0d(=E@;^!mCh[m3BlnW8
A2#-CARTItBk/n?D.R-nF(o0"A2#-CARTItBk2L+A2#-D@<Q""De*:%+Du(=BJ:QHE-,bI+Du:7
0Hb7UFCB9*Df/ouDf03%FEM,*?XuuSBcq;9FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EY
B-;/%EcYf!Bjl-kDIIBnA7'D"@<-E3EbTT+F(KG9EbTT+F(KH#@ps1`+ED1;ATMF)?XmM\@p_u,
<(0_.EbTT+F(KH#BOPsqA79RkF`M:@Eb],-FCZM9De*9uAKZ)5A79aj@ps1`+EVO4@<la/+F/6X
H#7D1A0?20FF&%B<%o[K/1<VC4"akp+=A:@F_PZ&?ZKk%ATMF)+C]J-Ch-mnBldj,ATV9iDdso1
Bldj,ATV9fFCB&B?ZU(&CLnW/Bldj,ATV9jF)Y].@;B4kD/X3$+ED1;ATMF)?Ys@cF`Uo2D/X3$
+ED1;ATMF)?Z':qF*(i2F'iKgF^K3,Deio,EbTT+F(KH#EbTT+F(KH#F)>i2AKZ#-F(KE(FC0,u
DJj$+?ZU(&CLnkB/1<VC4"akp+=A:PBldj,ATT&8Bldj,ATUpoBl%i<.4cl0/3G;#Bldj,ATT:K
/1<VC4"akp+=A9uEbT0"FC.sg@<-Er9kA?ZA8,Ii?U8LF@;]L`?SXES@<++^?Ys<r:18<[B45mr
Df/o\FCB32?Z^O7+Abj4<*sZ[F(KE(F<G"6@;[i-AU%]rCgV:/F<G:+F^K#pD.R6bF*(i2F'g[V
1,<3YG]Y'EDe!3tBl@lrARfj*DIITp?Y!_aFCANu?Ys<rDIITp?Z9q"H#@P;BjkgbAU&07ATMp,
Df0W'AoD]sA7]S!@:++`D.Fc,F`_&6Bl@lrBl79oDf03%FEM,*?XuuSBjY^f+Du=D@<?4%DI7*q
?Z0CiBlS90FEq53Am]+ZCh[j1Bk(L\7<!<9AS5@eA0>i3C3"$0ATMF)+ED1;ATMF)<HD_l94`Bi
+ED1;ATMF)?Z'e(AR]RrCL:dpH#@(=.4cl01*AJ2,Vh&/1GCU?3%d$F3B/fK0f_3M+>PW+1GCU=
3A*-J3&3HQ2)70I+>PW+1GCU?0J51B3&NKK3A<?M+>PW+1GCU@0eP7@2_mBP1bpjH+>PW+1GCU?
3%d'D0JY@C0K:jK+>PW+1GCU?3%d$H0f(^I1c@'J+>PW+1GCX>0eP=@3AicQ1c@<O+>PW+1GCU>
2D-g?0fUjI0ebOD+>PW+1GCU?0J51<2)6jG1c$sG+>PW+1GCU?3%d$H0JYLA1GgpH+>PW+1GCU=
3A*-J3&3HQ2)70I+>PW+1GCU?3%d!F2)I0K2Dd6I+>PW+1GCU?3%d$H1bg^C1H%-J+>PW+1GCU=
3A*0D0JYIB2D?mE+>PW+1GCU?1bLX@1,1^D3AN?I+>PW+1GCU?0J54>0f([E1,q9O+>PW+1GCU>
3A*3K3B8rP1,q9S+>PW+1GCU>3A*6H2DR$D3&<9K+>PW+1GCU?1+k@A2)mBM2)mEO+>PW+1GCU?
1+kC>2DHpG0ebCA+>PW+1GCU=3%d'B1,LpJ3A<EK+>PW+1GCU?1+kID0fUjA1bpdF+>PW+1GCU>
2D-gE0f(RE1cR<H+>PW+1GCU>2_HpB3A<HL3Ai]T+>PW+1GCU?2(gjB2E<KM0JG@E+>PW+1GCU>
0J51?2Dm9N2`NNL+>PW+1GCX>0eP::2)$aB1,(XH+>PW+1GCU=3A*3M2)R<H2Dd?O+>PW+1GCU=
3A*3M0f:pJ1,(^D+>PW+1GCU?2_I*H3&*3H3B8uT+>PW+1GCU?1+kID3A`QM3&NQL+>PW+1GCU?
2(gjB3&**F2_d*21,(I>0JbIE/i5@E2E!QQ3A`K61,(I>0JbID/i5LG2_d'J2`)X40JYF<1GUd>
1c@'G1GLR?1GL"-0JYF<1GUg?1bgmB2_mBK2`)X40JYF<1GUsC1c.$G3A`HK2)QL30JYF<1GUsC
1bgaB3&<EH2_cF10JYF<1GUsC1c$gE1H%6P2`;d60JYF<1GLa>1c-sF0ebLD0K1+00JYF<1GLd?
1b^aF1,LmJ2DQC10JYF<1GLa>1c-m@2)R9K2`Dj70JYF<1GLR92*!HH1G^gD1H$@20JYF<1GCgA
2_d!@2E*QQ2)ZR40JYF<1GLR92D?g=0K;!M1c6C20JYF<1G^^;3&!$@2E!?O1c?I30JYF<1GLR9
2)I0K1c7!B1a"P-1,CU?0f^jF0K1jF1,:jD1a"P-1,CU?0f^jF0ebO@1bgjD3?U(21,CU?0ek:=
3Ar`N3AWBJ1E\G,1,CU?0f(F>1GUjJ3&!-D3$9t11,CU?0JtI@2).'F2E!?H2BXb/1,CU?1,U[A
1,CdF0KCmI2BXb/1,CU?1,ggB2)I'G1-%6J+>PW+1GCU?3%d!F2`!HJ3B8o=1,(I>0JbCC/i>@;
0fCjJ1H7051,(I>0JbCC/iGXK1c@-D1,1X/1,(I>0JbI=/iPLB2E!9K2_d351,(I>0JbF?/i5CF
1H$pF1,L+/0JYF<1G^^;2`W]T3AWHF2`)X40JYF<1GL^=1c%!D0ebLG2)cX50JYF<1GLa>1c@*D
1,:UB2`Mp80JYF<1GU^<2`NTM2_d6J3&2U30JYF<1GUpB1c79Q1GCOD3&Da50JYF<1b^X:1cI0D
1c6s@0K(%/0JYF<1GUX:1c[NQ1Gh*G2E)a60JYF<1G^a<1H.6J3B&cM1H6L40JYF<1GUpB2)6j@
0f^pI1H?R50JYF<1GUpB1cI-F2E3NO0fU:20JYF<1b^X:2)RBO3&EHM3&Vm70JYF<1GLd?1b^XD
0KCjA2`2^50JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D2)@$F1c?I30JYF<1b^X:1bpgF
1,^mC2)-4/0JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G0fCgG2DcO30JYF<1b^[;2Dm0C
3AE3G1cZ[60JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUa=1c73O0JbLD3B&'90JYF<1GLmB2E*WV
2)6pH3B83;0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1G^^;1c%!D0K:jE1H6L40JYF<1GU^<1c%$E
0fUmA1H$@20JYF<1GUd>2E!HN3&<<E2`Dj70JYF<1GU^<2E*?M0JPC>0fU:20JYF<1GLjA2`3QQ
1,(LA3?U(21,CU?0fL^A1-%$K1H@<N3?U(21,CU?1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK
3B&oP2'=Y.1,CU@0JP1;3&!0I3&rfQ1*A>+1,CU?0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN
2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?1,:I?2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@
2E*?H+>PW+1GCX>0eP=B1c[<G3&3EP+>PW+1GCU?3%d'J0fUjH1H@351,(I>0JbI@/i>F=0JG4<
1,Ld01,(I>0JbIE/i>C<2)dHJ2DI371,(I>0JkI</i>LH2E3TR1Gps21,(I>0JkI</i>OB0eb:<
1b^^.1,(I>0JkI</i>OA0JYXK2)6:00JYF<1GUX:1c%'I2Dd?Q1,C%.0JYF<1GUX:1c%*G2)I'H
3?U(21,CU?0f^jD1,CpM2)I6L1E\G,1,CU?0eb4;3B&iU1cRKS2'=Y.1,CU?0eb4;3B&rX1GCXA
2BXb/1,CU?0eb4<0JkRC1,_*M2BXb/1,CU@0JP1;2E*HH1,LsN2'=Y.1,CU?0eb4;1c70J2)-gB
+>PW+1GCU>3A*6E2`3BH1-%$F+>PW+1GCU?0J51>0JkRD1GpsI+>PW+1GCU>1G1OC3&<HI0f1^E
+>PW+1GCU>1bLXD3&`WL1,(O?+>PW+1GCU>2D-gB2)[EQ0fV-I+>PW+1GCX>0eP=B3&rZH1Gh'J
+>PW+1GCX>0eP=B3B&oQ3B8uR+>PW+1GCU?3%d!F2`!HJ3B8o=1,(I>0JkI=/iGR@0f^sD2)-j/
1,(I>0JbCC/iGXK1c@-D1,1X/1,(I>0JbI=/iPLB2E!9K2_d351,(I>0JbF?/i5IB3B8cI1H%'4
1,(I>0JkI</i>OF1,V!G2E3H71,(I>0JbF?/i5IB2DI-F2Dd<71,(I>0JbF@/i5LC1bpgH0JbU0
1,(I>0JbI?/i,ID3A`NL0fV-A/1<V9+?1W%0JYF<1GCgA2)-m@3B/iL1H6L40JYF<1GCgA1c[KL
2*!KR1,9t-0JYF<1GU^<1H7?M2)-jF1,pC30JYF<1GLjA1H@3I0K(UB1H6L40JYF<1GLX;1c@6H
3&33I2BXb/1,CU@0JP1?2_d<K3A`WP3?U(21,CU?1,ggG0ekRD2_d6L3?U(21,CU?0et@<2`*?K
3&EBK1*A>+1,CU?1-$sE1,^pE1cI6I3?U(21,CU?1,pmD3&rfQ3Ai]K3$9t11,CU?1,pmC0JbLE
1Gh*N0d&5*1,CU?1,CO>1,^jI0K1jE2'=Y.1,CU?1,pmC0KD$M1Gh*N0d&5*1,CU@0JY7<2)mQS
0ekIA0d&5*1,CU@0JP1;3AWHM2)6jG2]sk01,CU?1,CO>1,_!F2E3BL1+=b&4>J$7,Vh&/1GCU=
3%d'F0etLA2`*9I+>PW+1GCU?3%d!G0JkdF0KCpF+>PW+1GCX>0eP=B1GUsL2)R9L+>PW+1GCX>
1+k773&NZR2`!9J.4cl01,(I>0JbF=/i5LH3AE<L0K(a<3&rTJ3A`EE1c-sD1GgdC2*!.#/i"P(
.4cl01*A;-,Vh&/1GCU?2_HsA3&*EN2`<NL+>PW+1GCU?1bL^@1H%-K2DmHR+>PW+1GCU=3A*-J
3&3HQ2_['E+>PW+1GCU?0eP:<0f:[>1Gh!F+>PW+1GCU=1G1RD2)I!G2)$a?+>PW+1GCX>1+kC;
3&EQJ2E<T:1,(I>0JbFC/i5FD0ebRD0JYL.1,(I>0JbF?/iPI?1,CU<2E3E61,(I>0JbF</iGXB
0JPL@0f_*61,(I>0JbF</iGXJ1bpgA1Gp:10JYF<1GLR91b^jD0ekUA1Gp:10JYF<1GLR91b^gE
2E*TU1,9t-0JYF<1G^a<1bpjG3B8cI3&)O20JYF<1GUmA2)%!E3Ai`R2)?@10JYF<1GUmA1c.-H
0K1pL3&_s80JYF<1b^[;2Dm0C3AE3G1cZ[60JYF<1GU[;1c[HK1Gh!I1H-F30JYF<1GC^>2_['B
0f(dF0f^@30JYF<1b^[;1b^mG2_[-M1a"P-1,CU?0fUdB2)[0C3&E<E2'=Y.1,CU?0fCX@2)7!D
2)d9N2'=Y.1,CU?0ek:=2_Zp?2_d$I2'=Y.1,CU?0ek:=2`NWL1,:XC+>PW+1GCU?1bL[E1b^jD
0etaL+>PW+1GCU?3%d'I1GCRD1,L[A+>PW+1GCX>1+kI?2)d<N1cR6N.4cl00I\P$4>838-p014
/1<V7.4dS8                                                                ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
