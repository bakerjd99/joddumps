NB. JOD dictionary dump: 01 Apr 2023 12:40:25
NB. Generated with JOD version; 1.0.25 - dev; 9; 30 Mar 2023 11:07:40
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

OBLIQUITYDMS=:23 26 21.4480000000000004

OBLIQUITYDMS2000=:23 26 21.4480000000000004

OBSLOCATION=:_116.375956000000002 43.6467749999999981

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset fmt_today iau_today location_home location_uluru location_yellowstone nav_today'

STDALTITUDE=:0.566699999999999982

UTCOFFSET=:6

VMDriseset=:'0.9.0';7;'01 Apr 2023 12:28:47'

riseset_hashdateurl=:<;._1 '|ece2e0696598c6c570d306044a16a6f0ace9be1088b4f75a3069cd54aa20918c|01 Apr 2023 12:28:47|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

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
NB. monad:  cl =. fmt_today (bt ; fl)
NB.
NB.   fmt_today nav_today 0
NB.   fmt_today (location_yellowstone~ 1935 7 6) iau_today 0

'Rs cParms'=. y

NB. calc parameters
hdr=. <;._1' Mag-Lim Above-Horz Julian ΔT Longitude Latitude Year Month Day.dd'  
cParms=. ctl ": <(": ,. cParms) ,. ' ' ,. >hdr

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
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ) iau_today y
:
NB. date, julian, location, UTC timezone, magnitude, horizon
'YMD JD LB UO LMAG LHORZ'=. x

NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. brighter magnitude limit !(*)=. Vmag IAU_Name Designation
'Rs cParms'=. x today_calc (LMAG > Vmag) # IAU_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;cParms
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
OBSLOCATION_riseset_=: _116.375956 43.646775  NB. Meridian 

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  3.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 20    NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
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

NB. date of Uluru star party diner
2022 10 19 location_uluru y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: 131.01941 _25.34301

UTCOFFSET_riseset_=: _9.5   NB. time zone
LIMITMAG_riseset_=: 6.0     NB. stellar magnitude
LIMITHORZ_riseset_=: 5      NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
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

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  6.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 10    NB. degrees above horizon

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
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
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ) nav_today y
:
NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. !(*)=. Nav_Star_Name IAU_Name Designation
'Rs cParms'=. x today_calc Nav_Star_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;cParms
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
  riseset_calc UT;LB;(<Stars),RA,Dec 
end.
)

riseset_14=:3 : 0

NB.*riseset v-- rise, transit, set times of stars.
NB.
NB. monad:  riseset ??
NB.
NB.   riseset 0
NB. 
NB. dyad:  ?? riseset ??

NB. ymd=. 3 {. 6!:0 ''
ymd=. 1988 3 20  

h0=. 0.5667 NB. standard altitude stars/planets degrees

NB. ra, dec degrees - test stars
NB. !(*)=. IAU_Name RA_J2000 Dec_J2000
loadstars~ 1
obj=. 'Sirius'
p=. IAU_Name i. <obj
NB. ra=. p{RA_J2000  [ dec=. p{Dec_J2000

NB. meeus Venus pg. 99,100
obj=. 'Venus'
ra=. 41.73129 [ dec=. 18.44092 

NB. (L) longitude, west positive 
NB. (B) latitude,  north positive
L=.   71.0833  [ B=.  42.3333          NB. Boston meeus pg. 99
NB. L=. 116.375956 [ th=. 43.646775    NB. Meridian 

NB. dynamical time ΔT seconds
NB. NOTE: ΔT is not going to change a lot over the 
NB. interpolation period of these calculations
dTs=. ,/deltaT0 deltaTdy ymd
dTs=. 56  NB. meeus pg. 100
dTfd=. dTs % 86400 NB. dTs in fractional days

NB. apparent sidereal time Greenwich at 0h in degrees
th0=. ,/ddfrdms 15 * apparsidjd0 julfrcal ymd 
th0=. 177.74208  NB. meeus pg. 99

NB. TD times ΔT + UT = TD 
TD=. (2 {. ymd),"1 0  (_1 0 1 + {:ymd) + dTfd

NB. apparent ra,dec for _1 0 1 days around rise/set
rdi=. ,/ |: TD apparRADEC"1 _ ra ,: dec
NB. meeus pg. 99,100 
rdi=. 40.68021 41.73129 42.78204 ,: 18.04761 18.44092 18.82742

NB. approximate times (14.1) meeus pg. 98
cosH0=. ((sind h0) - (sind B)*sind 1{1{rdi) % (cosd B)*cosd 1{1{rdi

if. 1 < |cosH0 do. 'above or below horizon'
else. 

  H0=. dfr arccos cosH0

  NB. (cosHO) differs from meeus pg. 100 I've checked
  NB. here and in excel but do not see the problemo!
  NB. I'm suspecting a transcription error in the book.
  H0=. dfr arccos _0.3178735

  NB. m(i) are fractional day times 
  NB. 1| insures mi in [0,1]
  m0=. 1|360 %~ (1{0{rdi) + L - th0  
  m1=. 1|m0 - H0 % 360               
  m2=. 1|m0 + H0 % 360               

  NB. rise, transit, setting
  m=. m1,m0,m2

  NB. sidereal time at Greenwich - meeus pg. 99
  th=. nth0 th0 + 360.985647*m

  NB. adjusted ra,dec
  nu=. dTfd + m
  rda=. nu intr3p"1 rdi

  NB. local hour angles
  H=. (th - L) - 0{rda

  NB. body's altitude (12.6) meeus pg. 89
  sih=. ((sind B)*sind 1{rda) + (cosd B)*(cosd 1{rda)*cosd H

  NB. degree altitudes positive 
  h=. |dfr arcsin sih  

  NB. corrections
  dltm=. 0 #~ #m
  NB. transit
  dltm=. (-(1{H) % 360) (1)} dltm 
  NB. rise/set
  drs=. 0 2 { (h - h0) % 360 * (cosd 1{rda)*(cosd B)*sind H
  dltm=. drs (0 2)} dltm

  NB. altitudes, fractional days, corrected UT times 
  m=. m + dltm
  h ,. m ,. hmsfrds 86400 * m
  obj ; (0.5 round h) ,. m ,. 1 round hmsfrds 86400 * m

end.
)

riseset_calc=:3 : 0

NB.*riseset_calc v-- rise, transit, set times of stars.
NB.
NB. Main rise/set calculations. Argument (y) set in (riseset).
NB.
NB. monad:  (btRs ; flParms) =. riseset_calc blYMD_LB_OBJ_RA_Dec

'ymd LB obj ra dec'=. ,&.> y

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

NB. calc parameters Julian date, ΔT, Longitude, Latitude, ymfd
cParms=. JD,dTs,(-L),B,ymd

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
'YMD JD LB UO LMAG LHORZ'=. x

'Rsiau cParms'=. (YMD;UO;LB) riseset y

NB. retain rising setting - circumpolar NIMP
Rsiau=. Rsiau #~ -. ; 1 {"1 Rsiau

NB. name ,. transit altitude, hour minutes 
ahm=. 1&{&.> 2 {"1 Rsiau
Rsiau=. (0 {"1 Rsiau) ,. (0 {&.> ahm) ,. (<2 3){&.> ahm

NB. retain above local horizon
Rsiau=. Rsiau #~ LHORZ < 0&{&> 1 {"1 Rsiau

NB. sort by transit time
(LMAG,LHORZ,cParms) ;~ Rsiau {~ /: >2 {"1 Rsiau
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
1GUs52D?7/+?(Dt2'=V4+>beq3?U78+>t>s3?U=)1,L+5+>Ghu0esk02BX_4+?)/#0eje.1E\D1
+>beq0eje01*AS"1-$I30H`,1+?(E$3$9q0+>bnt3?U:8+>GSn2`W!<+>khq2BXn<+>PVn1H-F9
+?)2$2]sk9+?1K$2BXq$2`)X9+>khq3?U(7+>k9#3?U4&2_cF5+>u"u3$:.:+?(E%0d&J!1H$@1
0d&8,+>t>u3$:4(1,C%-1E\J1+>G\q1G^./0H`2++>G_r1c6C12'=_8+>Gbs2)-45+>c&#0ea_.
0d&2*+>khq3?U.7+>k9"1E\Ot2DQC3+>c)$1,C%20d&80+>u"u1,0n.0H`:s1G^..1*AA/+>Gl!
1cZ[7+>P_q2BXe3+>GPm1H$@7+>c#"3$:%8+?1K$0LS30;aj&PF(Jj"DIdf2E+O&4A79aT7R9C1
=&2^^;fZSnATMF)Bl8$(Eb8`iAKZ28Eb'56-qQlo6Ub'P;FFH(Bldj,ATT@DB6%p5E(Vl>0JIch
An5IlDe!H'8hr(S0J5%%H"CE)/0JeJDKKPC+D,Y&@ruF'DII?(A79aE+>Pc20f:dF+?^i^F_kZ1
@ps0r8hr(S0R7MIA4fiq8O6*]F`MM6DKI!nF_kc#DBNIuFCe-;9hA;T:JtA0DfTQ<Df-\6Bl.R+
+DG^9A7]CoAS#pV8PMcU9gM9cBl.R+Bl7Q+D..'pBlnK.APYWd8PrJZ<*;U`;djWaEc62:D..Nt
+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&9"DBNJ$B6%QpF"AGNBl8'8ATKCFF(Jj"DIdfa6;0sJ
<Cp.m6qpT80JG1hE,]i9G\M#'FCcS+E,T6"+A+CC0JFVf@VfauF_PrC+E(j7FD,5.ARfOjE-,f(
+Co%rEb/g'/0JeDDKU&4F"AGTARfXrA91O5;bTtS5u^EO:2aT_ATDs*EZf1,FD5i>A7Zm"Df03%
FEM,*/0K.JF*&O@Df03%FEM,*F!,@3B45mrG%FQI:K1Ck;FFH(Bldj,ATVs2Dfd+GDfTB0+=L,`
:K1Ck;FFH(Bldj,ATT@DB6%p5E$-8G+<Ve*<('#G<(U%h6q)0=@;]UaEb$;$CijB5F_#&+F*(i2
F!*%W@rH4'ASuQtFCfM9AoD]4BQ%p*H>d[D@<?@)F)Yf(EbT#+Eb/j'@:OCnDf/QS6Vg0@;ajYc
<'qdMBl.E(H>d\4+E(k(F(KG9Bl5&,Dfp)A<_Yu&Bldj,ATW*,EcYr5DCcoI@;BEs@rHL-F<G"0
A0>DkFCelsCh.6lF(&m$+F7U>D_*#CBl\9:/0K"F@rH6q/0HPt/g,%RBHUi"AnGUpASu!hF!,C5
+Du!V+CT)&A8,Xs+?qJ50I&;+0O\p>@<,736q'IOE,]6+ASuT4;F)F6DIakX77/20DfQt3E,T6"
+=MI`+D,Y4D'2G+0JG1hE,]6+F(Jj&F(Jj"DIdf2@rHC.ARfgrDf-\+E,]6+ASuT4F(o/rEb/Zq
+EV=7AKWQID.R:$F!,F7/g*,1+>"]acBN9hBcnlJ@rHE:AT2]>.5*D5@;p0oEcYr*C1K#,E,]6+
ASuT47ri0PDKff)BHVA1A7]dm@;I&<+D>V53ZqjME+*d.Bk1sh0Hb+QCh@]t@;I'63Zp131,C%-
+>YQ00f_6K+>P'!/i@'Z@;[i/Eas3"DJ*NuF<GL6+=LA8,p6;=+D,P4+EVgG+CT;'F_t]-FE8R=
DBNJ$B6%QpF('0!DDG[0Cij6/DIIWu+CTA#DDE>XATD6&/KeJB@ru-sB4Yt&+E(j7-s.T<+F,CY
Bl5&(AS6$pATJtG+EM+*+=LZ?@;[hL@rH0o?YNqk?Z':hARo.hFCB32@rH7.ATDl88O6?!@WZ*r
+EVNE@rH1+D/LJ,Bk)7!Df0!(H":H,Ao_R%F(AilBl.9p+EM+(Df0*,+D,Y4D'3M1F`MOS+Dkh1
F"AGTARfd(/KebFFs&2HD0'<0A7Ta13ZqsDF(TH+D0$gU+>GVo0ek:@0P"a2FCA-&A9i'$D/!Kg
C`mh6D.Oj8PZ/c>DBO"3@rH6qF(AiuFCA-ZH":K&FC?<;PZ/c9ARfFk@;I'3ARTU?+Co&"FCA-Z
Gp"jr1,C%/+>GVo/1r&"3Aif>0esk+0k>?;EbK<2A7]7bD..6'F(Jj"DIdf2Ao_g,+D>\9EcWcS
D/!m//0K"F@ribE+DG_:+=Lo?F(TH'F"'-mA92@'BPhf51E\D-+>GT'3A>&UAo_R%F(TH$@ruF'
DII?(A79a+Ao_g,+D>V53Zp+/3&!6G2'>%)An5LoBPhf50f^@30d&/^D00-,De*:%AoD^,@<<W6
De*:%+Eh=:@WNZ4ATN!1FD"Q,C1Lps@:OCnDf0!"+Ceu#FEMV<ATJu+Ec5e;AT2QtBHTo&0JG1'
9k@mYF!,F7/g*,03Zr'70PY,@C3=?)EarNo+>Gl62]sh/+>b]10kXH>H#7)(Ea`I"Bl@ltC`m5!
DKL#ABk;?.Ao_g,+D#M1@qZuW1,(C9+AHEYF`S[EB.b;d1HHXk<%rT7A0<Te2)cX40H`2)3&,)`
Ao_F'BQ&$6F"AGNBl8'8ATJu+Ec5e;A7]7bD..6'F(Jj"DIdfL+D>V(Eb'56A92@'BPhf51,'h+
2]sq5/i#4rD0'<0A7Ta(BQ&$6F"AGNBl7uC+EM+(F!,(8Df$V-ARfFk@;I'-ARci7+F,(l+?289
0JGO1A7TanEbK<2+D>V5Ao_EmF!*Cs0f(F=2/$iJAo_F'BQ&$6F"AGNBl7uC+EM+(F!,(8Df$V-
ARfFk@;I'-ARci7+F,(l+?2890JGO1A92@'BPhf5BPhg&Eb'562_m*D/i5G"@<Gq!De*:%DIIBn
A0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%Bjl-kFDl&2B4uC)@;TRd+A"k!+EMX5EcW@H
BldutCh4`2Df09%BQRs+FE00VBl8$(Ec>r5@<?''FD,]+AKZ/)Cis<1+>"^QAS$"*+E1s91,Wld
@:XG$@<-F*Ddd0t+ED1;ATMF)+EMX5EZen$FCB!(@psInDf/oqDf'',ATT&6@<,dnATVL(F!,(5
EZcQ>Df'&0+Dbt+@<?4%DJX6$@<?4%DI7O&F`MVGATT&6@<,dnATVL(F!,(5EZe@uF`MUICi<fl
FD5Z2Ci<flFD5Z2?[64!Ci=N=FDl&.F(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<fl
FD5Z2D.R-nDdmNsEHPu;GuQJ7ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"?/<?Q!n+Co%r
Eb/g'D.R-nDdmNsEHPu;GuQM8ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"HRF),3)+DG^9
A7]CoAS#q"ARTIp@VfauF_PrCC1K#8ARTI!DdmNsEHPu;Gp$[.Ch[j1Bk&8tDfQsmF_kc#DBNIu
FCcRCGpskHAS6$pATM^"@;^.#A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZe=(
.!R0`8jjdMGq!TA@;^.#A85X/D.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4C3=?,
@;[2u@<itDGpskMDBNJ$B6%QpF)>JsDKBN&H#7(GD.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'
Bk(g!AoD]4=\V:,Bl5&(AS6$pATM`tG$f?0A79b$@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)
06:]HFD5W*+EVO4@<la.FD*@GDfT]'Ch\3,+Dtb'@<?4,AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaN
DJjQ00H_r%2E*QS1GLL;2DR!B2E#GlFD*@GDfT]'Ch\3,+E27?Bln'4AKYMpB6%Qp+EM7-ATD?j
C`mh6D.PaNDK']20H`).2`E]P0eP4>1,1OB2K!VM0Q(fLD..6pH=\40AS6$pAKZ&.A7]dm@;I'.
Bl.EB+Du:70Ha^Y2)R6K+?)5<2`GVsFCB9*Df/ouDf03%FEM,*?XuuSBl8'8@<?4%DBNY2+D#&!
BlJ0.@ps0rCi=3(BlnK.AKY])+Co%rEb/g'+=Js)3%uIh@<E]7BOu+&Gq!WRFCB9*Df/p#@Vfau
F_PrC?Y*_`BlJ0.@p`b8E-"EYB5Vj6@<?4%DBNY2+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&8r
AS6$pF)rHP0f_3I+DG8,+EM+7Bk;?7E+*d.ARB.[F^K#pD.R6bF*(i2F%JYt+DtV)ARlp)FCB24
Ch[s4+EVNE@WZ*r+D>=pA7]d(FCAWpATDL+ATMF)EbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7
F*(i2F)ku9ATMF)?XmM\@rc:)ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcZ88F(KE(FC/]i
F(f)mFCfT8CiX62ATMF)+D5_5F`8IE@rc:&F<G7*F(d*I@WcC$A0>DkFCd!GB5)I$F^cJ9Eboc2
A9)U2DIal)F_kc#DBNIuGp%!ID.7'sFDk\uFCes#DK]T3F<DuRDe*:%DJpsHG%#30ATJu9D]iS!
FCfN8De*:%?XmM\@r>^lARlo3GpskWFCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH$!t8@<la/@rH7.
ATDl8A79RkF!,RC+Cno++Du==@V'S$/0JG@DK]T3F(HIBFDk\uFCcnHH$O[PD.[=(ARTU%D/X<6
BHUo-@:OCnDf0!"+Cno++EV=7AKZ#)E,oN2ASuTuFD5Z2H=_2EFD+W-AT2QtBHU_oC3=T>D.RU,
+EV18D0$h3DfQsm1,(C9+AtKJ6q'HcBl5&(AS6$pATI                               ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2E)a<+>P&o1E\G23%uI02]sh40Jjn,3?U%82DZI20d&840fL403?U.51,U101*A;*2)?@10d&51
0JXb+0H`2.2E5/gBl%<eEbTT+F(KGg67s`sF_PZ&?ZKk%ATMF)+ET1e+C]J-Ch+Y:EbTT+F(KGB
+CT.u+Co2-FE2))F`_1I%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!a
CghC++EVI>Ci<fj5s[eGF_PZ&3B9*,4ZX]55s[eGF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a@WcC$
A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%17/dEc+$$+=D2DF(KE(F=.M)%159QHV[I,:..Z@4ZX]r
Bk/>?+<V+#%15is/g+k?+=Lr@AU#XHBlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+
BljdkBOtU_A8,O:3ZoguBl.F+-S7AC0mc\m78?6B6Ra6-Bl.F++=@U*%159QHZ*F;4$"KtART+[
Bk&\AAp&3:+E_d?Ci^sH>9G^EDe't<-OgCl$9g.jFDYu5Ddso&ATT%V3[\QOFEDbL+D58-D.Fc0
ART*lGB.D>AKZ&-Dg-//F)rIFBONYR2BZF?FCfK6FE/L5AS,k$ATMs6+DPe4G9CX<Dg-/=F*&OH
Bl.F&FCB$*+BD3)-S0=KEc*EU+=A^]@rcH<-XUOqF(f)mFCfT8CaTZ!%15is/g+kGF(KB6061WC
Cgggb+C]J-Ch+Z1Bl.E(F*(i-E$0(:+E27?F<GOCDe!@"F)Q(.$9g.j-ZW]>DI[i;4ZX][5snOG
?X[\fA7$HlATT%B:et"h?RICG@rcGr$9g.j9gM-E:L@OFDe*2tE-67F-p26^Dg-/=F*&Nd1*Cod
DI[i=+>S?fDI[iQ3Zotk@s/:g%15is/g,:UA79Rk+BD3)%178qA3Dsr+tb6D9gg?[F(96.%16Qe
Bl%<jFDX0%+EV=7ATMs%D/^UF-OgD2-WWr0-S0=KEc*<h3Zoh)HZj7:.4cl00e5FBHZj7:.4dSj
F_PZ&A9;Yt$9g.jFDYu5Ddso/F`\`R<_Yt0/9><ADBKAq%17/nDfp/@F`\`R@WcC$A8,po+Eh=:
F(oQ1+>#c"-T`M)-WWr0-S0=KEc)<n%15is/g+e<F<G72F*)>@Gp$X9@s)X"DKH<p:-pQU-tm=9
FDYP>-XU_$-Rh2>+AG-h;GUY.C2[Wi+Co2-E$-QBBleB5A3Dsr-V-g-<)6Cp?RICG@rcH9/14eA
A1%fn%15is/g+e<F<G[DA8`T$De!p,ASuT!$;No?+=M>MA8c<q/14eAA1&fh3Zq-_6W-]e@;9^k
?Q`lnF)W6MFDk].D.Gdj+=C,a6r./;/9><ADCI+a?Ys=$%13OO:-pQUB4YslEaa'$+Dbt)A0>r'
EbTK7%17,c+Bos9Eap5/F(ZV-Bl%?.4ZX^&Ci^_?@rcGr$4R>;67sBnASu("@<?''@rH4'@;]dt
DBLMR@rH7,@;0V#+EqaEA9/l9F(Jl)FDi:DATMr9D..-r+D5_5F`7csEap4r+=D2>+Dl141*C1C
Ch5@L4ZX^&Ci^_?@rcH<-WP8&Ci^s5$4R>;67sC'E+EC!AKYYpF(c!iB4t^pBK\C!+tdqHEc*EU
?YEkhBOkOnAT`$0-OgD2F(96./14e<@<6*m@<?('Ebm*P4ZX]6.!''11,Us4Eb/Zi+D,>(ALT]M
F_PZ&A9;Z;+=Jod0e%MnB4t^pBFP;40RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79RkF`M:G+:SYe
$;No?+E_X6@<?''A8-+,EbT!*FD5Z2+D,>(ATJ:f-o2u,+>>5eAnc'm%16f]/g*_T=%Q.0A8a(0
$6UI4D/XQ=E-67F-Z`^>ARlotDBOC#5sn:D83oU9;^W"]%144#A85O_CNF#L/g+nJ@<?0*-[nZR
6VC?K5sn:D0..29+<Y`8E]l#tA85O_CNF#;F(96./13&aC3(a3$6UH>FDj]G;cFlOBl%?0+Eqj?
FCcS9@r`"c+<V+#+<XEG/g+YBE-WR7F)u80Bjl*pA0>JuCh7Ys$6UH=6uHFMAKXBZ@VR8R/g)Qh
/g)\fHTESu0RH2a5u^B^?W0p2?V4*^DdmGj$6UI*AhG2oDIIBn+>#Vs-Y@LCF!i)@D_;J++<VdL
:-pQUCi<flC`k-<F`_[R+CoD#F_t]-F<G+.Eb/a&DfU+4$6UH6+CoD#A3DOf+tauc6r-0W-S.Z(
@VRGA?RH9i+<VdL-urm-A0>E$@q7,<EbTT+F(KGGE+EQ..3NhTBlmo/A85O_CNF#;-ZWpBATMF)
/oY?5-OgD*+D#G$/e&.1+DQ"8E+D*a+DPk(FD)dEIWT.<E*Ob"$6UH>Eb/Zi+DQ"8E+CLIEbTT+
F(KH#DJsW.@W-1#/no9MDIOtB+Eqj?FCcS*C11UfF(?gLEbTT+F(KH#DJsW.@W-1#/no9MDIOt&
$6UH>Eb/Zi+DQ"8E+CLIEbTT+F(KH#DJsW.@W-1#/oY?5-Rg0^EbTW,+Co4q@r$-r/15IPF(KE(
FC/p(FCep"DegtEA7d1u$4R=b+CoS*F*(qU/g+nJ@<?0*-[nZR6VC?K5sn:D06CcHFC\g%@4ru;
$6UI%FCfN8A0>MrFEDbL+=Cl3F^K#pD.R6bF*(i2F'g[V1,<3YG]Y;B$6UI%FCfN8A0>MrFEDbL
+=BomG%kStFD5Z2?W2&TEcYT0G]Y;B$6UI%FCfN8A0>MrFDYP2-UMifB4uBo;flGgF'hXQEbT&u
@;]F<Ci*Tu@:NY"1MpQ@1,iQWA1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<Y`BDfp/@F`\aI@ra^b
+=BoU9i*knF('6'+DG^9IS)mn92eAI6VC?*%144#:-pQUF(95R/g+nJ@<?0*-[m^]Bll"C@:O(o
BOPCdF"\mlF(96./13&aC3(a3$6UHd67sB/FDj]G;cFlOBl%?0+Eqj?FCcS9@r`"cAScF!BkAu.
D_;J++<WB]>9J!#Dg-//F)rHOA8-+,EbT!*FCeu*Df-\!8PUp=:.\P1Df0B:-QmG@FEMVA/e&/!
DIb@/$4R>VAhG3<AU%p1F<GX7EZen2/g(T1+<WB]>9G>7ART*lGpsk[EbTW,+EM47GApu3F!,O6
EX`@eCia/?%144#0d'[CF(fK9E+*g/+=D#?F)u&5B-:`!F*)G:@Wcd,Df-\=@rc:&F<E/!-TcBZ
EX`@eDIb@/$7QDk%16T`@s)g4ASuT4FDYu5De!-?5s\t&Bl%<?3B:FU$9g.jDe'u=/g*qd78?6B
6QfSU1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@WcC$A2uY1
?O[?OF_PZ&?ZKk%ATMF)?Y"(b:-pQ_@WcC$A7'@kF(KE(FC/Qs@j#kF/KeMFBl%<&@;]TuA8-+,
EbT!*FCcS8Bldj,ATT%k6q/;0De!p,ASuTB%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`$r$?B]tF_Pl-+=Cf5DImisCbKOAA1%fnEb065Bl[c--YdR1Ch\!&Eaa'$-OgCl$=e!a
CghC++EVI>Ci<fj5s[eGF_PZ&8k_6*3F=p1+=BH@6"4tNCh-.33B9)I+BosuDe3rtF(HIV-UC$a
@WcC$A4fNU3B8Gr$=e!gDKBB0F<DrFC2[W*@;9^kCh\!&Eaa'$-OgCl$9g.j:JaJT6qKa/3ZqsI
A0<Q8$4R>;67sBpAfrL9D.Rr@+DGm>Anc:,F<G+.@ruF'DIIR2+E)-?E+*j%+DG_'Cis9"+DGp,
$>=!ZA7TCa4ZX]6-Y[F/GUG((4u%C[:dn,I8OFpO-Y[F/GT\@C$9g.jDe'tP3Zr*I@:Wn_@k9!>
F`_[IF`_>6F!i)7+>Y-YA0<6I%13OO4tq>*D/a<0@j#DqF<EY+-Z`s>GApu3F!,"&EHQ2AAKY`1
F*(r5G&Ul3BHVD<CghBu1*CdTDK'$+BQIa(+Dbb0E+*j%F(K;5Eb/Zi+Eqj?FCcg/$4R>=6q0p;
9gq3++=D2DF(KE(F=.M)%159QHRDF(BPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''-RT?14tq=q
Bl%@%4Z[4rE,961+AbHq:-hTC%13OOCijo@@<?0G3ZrNcCghBu1*CCIDK'$+BQIa(+DQ%?FC]E8
E+*j%+EqO;E+*j%F(K;54#)(oBl%@%%17&bAnGanAN`'sCijo@@<?06:ddcJ5tsd!-SB@KAg\#p
%15is/g+YBD/a3*AKXZT<+T/S/Kek<F*&O:Bl%?'BlbCH/n/72+E)9C.P>dU%14L>+?CW!.3N5:
Ch7Ys$>F*)+A#%(8PUBNA8a(0$6UI'ATD4#AKZ&-Dg-//F)rICA7fFfCh4%_+<WB]>9J!#ASc0*
A7BP$DffP54*s#6+D#G$/e&/%AhG2t7TE2T=<M-m/g(T1+<WB]>9J!#Dg-//F)rHO:/=hX3ZrHc
DBL;X-p)c:Gpt9l+DG^9-S0(UG]7)5BHR`kASu$2%14Nn$4R>;67sBkBleB:Bju4,AKYK$E+rm)
%14L>+?CW!.3NS?AnGanAISu\AhG2\4_A8MBleB'C0r*/+CoCC%144#E+EQD/g,1G@:UL+%144#
BkAt?8OccQ:*:ZiD_<.A$6UH6+<Y`BDfp/@F`\`RE+EQ'F('6'A0>T(+FZpK6VC?K5sn:D-OgD*
+<VdLC11UfE+EQD/g+nJ@<?0*-[nZR6VC?K5sn:D0./;I6q0p;9gpT\/oY?5-OgD*+<VdLE+EQ'
GB.D>AKY_r@r$$oAdo(i+D#G$/e&.1+DGF?+A#%&:.\P1A8a(0$6UH6+EMC<F`_SFEZc`)8PN#B
+Cf>/Gp%3I+FZpK6VC?K5sn:D-Qij*+<VdL:-pQUE+EQ'GB.D>AKZ&-Dg-//F)rI=E+*j%+=DV1
5sn:D061cJATMF)0./;I6q0p;9gpT\/oY?5-Qij*+<Y65A1e;uAScF!/e&.1+>G!C+EM47GApu3
F!)iIBle?0DJ()2A7cr94srF;%16ZaA1e;u.1HUn$=e!aF`MM6DKI"CD/a<0@p_Mf6"4tNCh-.3
3B9*,%159QHZ*F;I4cX<:dn,I8OFV)+>Y-YA0<6I%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6"4tNCh-.33B9*,EbTT+F(KH#@<>pq11,*>DeioZ67sa.Bldj,ATV9fFCB&B
?ZU(&CLnW1/M/)TDf'H%EbTE(+A*b)@<>pq1,!'X@;[i0.3N_N+D#e-AS`J;@<>pq1+=>SDIak^
+=LZ=@ru-s.4u&::-pQB$;No?+CfG'@<?'k3Zp131,EcUE\]?Y$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`i@<++_
+EV19F<GdGEb'56D/XT/A0>u4+=M8EF(KE(FB*EsCi_$7$4R>YDdd0!-ZWpBATMF)-OgE!Ddd0!
-ZWpBATMF)<HMqkF!hD(%15is/g+b;FCSu;E+*d.AKYQ/@qBI!@<>pq1*C+9FC?;(Ec5e;-t[UD
F"%P*Eb065Bl[c--YI".ATD3q05>E9-OgDH0RI_K+?MV3Ap&3:+E_d?Ci^sH>9G^EDe't<-OgE'
@j"tu-ZW]>DI[c94ZX]B+D58-+=CT>@;[i-AU%]rCgV:/F=.M)DI[cO3ZpL,+F?-l/8es>%16u_
F?MZ-4?G0&0d](,<'`hn/1)u5+?V_<?SWaA@rrhF/g*MZ/12Vh%16u_F?MZ-I4cX[@rrht+D>:K
3Zp,'DI[bt$4R>;67sBlG[k<$+Eh10F_,V'$7At!==66m+<VdL+<VeS3Zqd:-6b&h4s27eA0>S=
+?V_<?SNZN+B]gh-Rg0b+u(3X@rr.e-WsOo=BR"73ZoOf+<Z%m+CAJ&+tb3++=Lo6+DEGN4?G0&
0d%hd=YEl"=>*f).3Ns]0d(@DF:AR)6!7;46!.8;4ZX].+FH3m?XG-(/g`b)-tm-6BeCMj4"akp
+=A9t<'a8-=YEl++@/sm:+03t=Xb^I+F>:e+Dt\2%14IK10I^%5r)PF-TsL5Ho`BW?R?sL-9`P#
BOi6"/g*8</mg=U-Qk]S5u'0`=Y*Z(+@/sm:,45"/6ODL.3Ns]0d(@DF:AQd$;No?+D#e-AS`K4
@;L'tF!,O;Dfol,+DkP/@q[!,D]j+>D.Oi/Eb/`pF(oQ1+D,P4+Du+8+CAIu%17&p@m)jq0J5%5
0JG170d^pZF`(_!$>F`J3Zq!H+B_ehIQATY?O[>jE,oG2Bm:bI+B]g5+BU'8/NP"nEap5+G^ERq
%16fo4ZX]W/g+8!+FZ?o?XF6L-ua3:+DH'CHQZE5,p6>>+>#VsE,oG2Bm=u,=Ub]I$;No?+CT;#
FCB&0E,oN"Ble!,DBNb,F)rH5$?1#q4ZX]>/het50JG4.Ec6)<A.8l[GT].1+A"1.=]ceq3Zqd:
%14M&Eap5+GT_>UA7fj)@<,k"@;[2j==G@E3ZrB^@j#K1+F>4s=]c+?Bm;d%+A"1.=BQbq3Zqd:
%14M&Eap5+GT_>UA7fj)@<,k"@;[2i=XbIF3ZrB^@j#K1+F>4s=BQ(?%14LlFCB&B+BU0U=XbIF
3ZqjQ@;[i0+B^6V=:GTH$;No?+DN$-FCB&B-Z^DI@<?!m+D#e-AS`K2D]j+>D.Oi/Eb/`pF(oQ1
+D,P4+Du+8+F7U>D]iS%DJsB+DIIX*EcVZsE,oGO3Zp+/0JG170d^pZF`(_!$7[Y]+?_A%0d'aE
E,oG2-u!oKHQYU0=]d*q/1r&ZGT_>U@<>pq1*B[A/34nV%14R;0-ED2+u(3G+E2@2+=LrK+F>4s
10I^.+=o,fBm:bI+CTA#DDGZD=Wf7V+BT'[%15C#6S^ec+=L>C/m0VG/1r&210I^%/1r%n@<>pq
1*B[M3a!mS/1r&RFCB&B@N\f)3`lgu5u^3,4ZX]51bLI51bLI50et@>/28n42CpR</iG("-o`A2
0e"52<'rDM$:.WY1-IZ@-p0RD?SNZN+BTah+D"nG<'a87-s8*'.3NA4@<>pq1+66U3a!mSC0tCk
@;[i0-s8)R==GUH+=oPr5u^3,%13OO:-pQUEa`irDf$V;@<?4%F!(o!;GoY=+?qJ$1*AG.0I/M0
%16!24ZX]`;BRG3-mV\g.3KlY-pK>5+=]#i;GnqdHQX^d0-jFn.3r7T+>F<4-t.4+DDGZDHnJ;p
.3L3'+CTA#DDE>4;@NsB$8<SV,\;")F(HIAEap5*A0>c"F<F^/=<LaK+BVbh6!7;46!.845r)SF
+@.bb=Wh[(@j#K1+@/so1*BIm-OgCl$4R>`D/XQ=E-67F-W!*-;aj)83ZrHWF(KE(FC/Hu@;[i-
F)>i2ALDM4F(KE(FC/U#E+NoqCL;."DeioZ67sa.Bldj,ATV9jF)Y].@;B4kD/X3$+<YbX/Kc0X
ATMs7+D,P4+<X*oE+NoqCEOa.DIakaAS$"*+O63N%15is/g+S=B5_g)FD,MD%15is/e&._67sBo
FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYh'$;No?
%15is/g,=KEaiI!Bl,mRF(Jo*Bl5%AAp&3:.1HVZ67r]S:-pQU+<XEG/g)tnA8-+(+FPjb1a$=H
C`k*C@<5ja-OgDX67sB'+DtV/@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys<_
$;No?%15is/g+SDF*2>2F#kFVEc6)>+=M8EF(KE(F=A>HF!,:;@:Wq[%15is/e&._67sBjEb/[$
ARmhE1,(I>D..H>3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$>aWhA0<7?Bldj,ATT:/$4R>;67sBoBkM*%E,oZ1F<GOC
ARfFqBl@ku$7InX3\`?<+>Gb`$4R>;67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$:7$H6;L`I3Zqcf2E!H&$4R>;67sBsDg,c5
+CT.u+E_XBATAo=ARTU%@W-C,A9/1e6:""+:K\el3Zoh]AScHs<%oFU3ZpaT6pa[P,$ucACgpp<
3ZqsECij)bA9f;)1,(C9+>Fun%15Ef6pa[P+>#Vs-tHn*FCA-&+?DP+6:""+:K\lK.3NbBA3Dsr
A7]S!@8pc_+>Y]*0H`(m0b"I!$;No?+ECn.A8c<-A79RkF!,(8Df$V=Bl.E(Ea`iuAISuTGs+22
0H_r"INU%Q3Zp.;3B8N>+>PW)0H_kgBeCM_0JG0i$@-K!4ZX]oGp%H_+?qJ$1b^U+,9S4>Gmt++
D.Gdj+F.g7+=nX_3Zp."4t[sB/g)PeH#7(@+<r![3Zp.4+>Pnc$=nEm4ZX]rAScHs<+L7sH#7($
$4R>;67sBpDKKH1G%#3.+D,Y4D'16;AScHs<%oa1$?CDT3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!
.3K',?SOQ$3?VZd0JEqC?SsMk+>ki,%14sH0H`).0JEqC0fC^>+>Gf/0F\@D2_Zp.0fUj@%14gL
0JFV(3&WH"$8FLu0H`)10JEqC0f^pA+>Gl30F\@D3AN920f_'F%14gM1bg+-3ArT$$8FP!0d&22
3&V3Q0f_3O+>PW)2%9mJ0JG@,1,(R>%14jE2)$..0f:Wo$8O=n0H`/*0JEqC.1HUn$8!ks5t"%8
=Wh9.+ED`:$4R>;67sC&ATMr9D09oA+DG_'Cis9"+CT)&+DG_8ATDs&Ci^$m/M8G*/3Z*>Ed9)V
AM,)R004P)IP)`oEd9)V8M2,rH"7?k%15is/g+VAF`(`2+Dl7BF<G1(Bl"4c-nm293[8Zj.3L3'
+=Jm(INX(l+=qPY.3M27+DbLt+=o,fF^ekj$4R>QF>,j=+Co&"FCA-&+Cob.%13OO%15is/g+,%
@VfTu0d&%j<affeATJu4Ag#B`<$3;++<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+@Kd]Bm+&u
+D,Y4D'2A`F*)>@Bk(Rf+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sBYARfY!A9/k9+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+;.@<*J5+<VdL+<VdL+<VdL+<VdL+<\so
<$3;++<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;
+<VdL+<VdL+<VdL+<Vd9$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+%172c@PBr++@8@^6;L`,+tb!D4"akq+=Jod3Zp+*%14[E0JFUl+<VdL+<VdL+<VdL
+<VdL+<WBt0f^p1+<VdL+<VdL+<VdL+<VdL+<V+#/Mo.8+<VdL+<VdL+<VdL+<VdL+<VdL0f:gE
0H_J\+<VdL+<VdL+<VdL+<VdL%14[C0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL
+<VdL+<VdL+<V+#/M]"6+<VdL+<VdL+<VdL+<VdL+<VdL0et[J0H_J\+<VdL+<VdL+<VdL+<VdL
%14[A0JFUl+<VdL+<VdL+<VdL+<VdL+<WBn2Dd*1+<VdL+<VdL+<VdL+<VdL+<V+#0H_J\+<VdL
+<VdL+<VdL+<VdL+<VdL0ebIE0H_J\+<VdL+<VdL+<VdL+<VdL%14gD0H_J\+<VdL+<VdL+<VdL
+<VdL+<W[&0JFUl+<VdL+<VdL+<VdL+<VdL+<V+#1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL3&WTI
+<VdL+<VdL+<VdL+<VdL+<VdL%14mF0H_J\+<VdL+<VdL+<VdL+<VdL+<WU$3%uHt+<VdL+<VdL
+<VdL+<VdL+<V+#1b^U++<VdL+<VdL+<VdL+<VdL+<VdL2E*<D+<VdL+<VdL+<VdL+<VdL+<Vd9
$8jLk+<VdL+<VdL+<VdL+<VdL+<VdL+>l)40H_J\+<VdL+<VdL+<VdL+<VdL+:SZ90JFUl+<VdL
+<VdL+<VdL+<VdL+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd9$9'Xm+<VdL+<VdL+<VdL+<VdL
+<VdL+>Yu30H_J\+<VdL+<VdL+<VdL+<VdL+:SZ;0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^3ArQ6
+<VdL+<VdL+<VdL+<VdL+<Vd9$99do+<VdL+<VdL+<VdL+<VdL+<VdL+>P]+0H_J\+<VdL+<VdL
+<VdL+<VdL+:SZ40JG1'+<VdL+<VdL+<VdL+<VdL+<Vd]2)d33+<VdL+<VdL+<VdL+<VdL+<Vd9
$8F7h0H_J\+<VdL+<VdL+<VdL+<VdL+>GQ10H_J\+<VdL+<VdL+<VdL+<VdL+:SZ41,(C)+<VdL
+<VdL+<VdL+<VdL+<Vdc1b^$p+<VdL+<VdL+<VdL+<VdL+<Vd9$8F=j0H_J\+<VdL+<VdL+<VdL
+<VdL+>c)4+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ41b^U++<VdL+<VdL+<VdL+<VdL+<Vd_1,'gn
+<VdL+<VdL+<VdL+<VdL+<Vd9$8FCl0H_J\+<VdL+<VdL+<VdL+<VdL+>PW)+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZ42D?g-+<VdL+<VdL+<VdL+<VdL+<Vd]1,'gn+<VdL+<VdL+<VdL+<VdL+<Vd9
$8FIn0H_J\+<VdL+<VdL+<VdL+<VdL+?:Pe+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ42`393+<VdL
+<VdL+<VdL+<VdL+<Vd]1E[e_+<VdL+<VdL+<VdL+<VdL+<Vd9$8FLo0H_J\+<VdL+<VdL+<VdL
+<VdL+>G\q+<VdL+<VdL+<VdL+<VdL+<VdL%14gL2)$-q+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#0f^pA+<VdL+<VdL+<VdL+<VdL+<VdL/MeLl+<VdL+<VdL+<VdL
+<VdL+<Vd9$8FOu0H_J\+<VdL+<VdL+<VdL+<VdL+>Pr"+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ,
%13OO/M9@U6pa[P+D!/JFCAW4%13OO:-pQU@rH4'@<,p%@rH4'F`_2*+EhfY+D>J1FDl26@ps0r
G%#30ATJtG+EV:.Eb-A%Eb,[e:-pQUF*1r5FCB'/Bjkg#G%#E*@;]RdF!+q7F<GX9@rH6qF!,O;
Dfol,+C\n),!o^SCb8IlEbfqE%15is/g*nb<(/hjG@_n*Eb-A8@;BRpB-;IP0HbIOD.Rc2/Kf.K
AKYT!EcZ=FBl8!6@;^00De:+$$;No?+CQC<ARTU%FDi:CARuutDg*=CBk(pmDJ()#A85O_ASuT4
Bl8$(Ectl-F!+t+@;]^hF!/bm<$2VWBOl3=4ZX]60d(fe0d(RH@PB5R/1r%nHo`BqA18WP/g,O&
A7]S!@8np)0d(aP4ZX]m0J54*0H`&%2(Kk)+>G!E+>=pb+u(3^@:Co"$4R>;67sC$ARf:hF<Ga8
Cis<1+E(j7cBM9NAo_g,+Co2,ARfg)Ddmd!Ectl5Bl@ku$;No?+CSo'AS#^iDKI"8F!,")@qBP"
+E)F7EZfI;BlbD9ATDL'A.8lf@:CrS3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!.1HV=3AiZ#1GLL:
#n74r3ArPt1G^X=#n74r3Ar`$1GpdD#n74r3B&Vu1b^O;#n74r3B&f%1c6mC#n74r3B/]!2)$X?
#n74r3B/l&2)HpA#n74r3B8c"2)['I#n74r3B8r'2D?aC#n74s0JG0e2DZsF#n74s0JG?j2Dd$F
#n74j%13OO/M9@U6pa[P+D!/JFCAW5%13OOBOl3>4ZX]60d(fe0d(RH@PK;S/1r%nHo`BqA18WP
/g,O&A7]S!@8np)0d(aP4ZX]m0J54*0H`&%2(Kk)+>G!E+>=pb+u(3^@:Cr#$4R=r+>>'PEaa$#
+=BKA6pa[P+CTO<H#7(7A9h].A99LJCgpotF^el(Ed8d@A99LJBOl3>+EV%$0HbIG@PK!NA1&K/
$4R>`D/XQ=E-67F-W!*-;aj)83ZrHWF(KE(FC/U#E+NoqCL;."Deio3EbTT+F(KH#D.R:$F'j!*
DeioZ67sa.Bldj,ATV9rAS$"*?ZU(&CLnW1/M/)dD/X3$+EV19FE8R:DfQspAS$"*+Eh=:@WO.2
$;No?%15is/g*G&+Cf>+ARfgrDf-[?De:,6ATMr9@psFiF!,(8Df$U>9k@mYF!l#O+>Gl:0d%T)
F*)G@DJsB+@ps0_$;No?+@0gVDfTQ6BPhfC%15is/e&._67sBhF)uJ@ATKmTB6%p5E$-QLBldj,
ATT@DBlbD5Ddd0fA.8l@67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,EcU
E\T<lEb0,sD.R6#FDi:6Des6.G9A;HEc6)>?Xn"jCh7*uBl@lrFCfN8FEqh:.3NG8H#IhI%15is
/g)o*D..H?3$<<SF*&OKDfTB0+Dl%?ARlp*D]gHKBldj,ATUpoBl%i>%13OOCi<`m+=D2DF(KE(
F=.M)Ci<`m+=D2DF(KE(FB*EsCi^s5$4R>;67sBoBkM*%E,oZ1F<GOCARfFqBl@ku$7InX3\`?<
+>Gb`$4R>;67sC'FD5P6G%G]'+EV19FE7lu@Us+73ZpC90JG1'.j-Q#+<W-VBeCM_0JEqC-uO-?
0Hah8B.4rT3Zr<ZFD*?N@Us*\$7Ke6BJ:P\@Us+#+>#VsDJjQ00H_rVA7l>Y%15is/g,+OF(o`1
G%E=EAS5FnBm+&1@psCgBl7?q+Co2,ARfgrDf0V*$7IGJ2'=+d/34n-+?;+u0fUj01,gm00I\+r
3Zr<^BJ:P[+>k8d+=oPr0H`A0+>Gi0+>Pl0+>Yo0%14L7+>k8d+=oPr0H`,00H`)00H`A0+>>5e
/NP"lFD*?N/0Hem,9SNu+>"]i+?;+u0fUj01,gm01H$or$4R=r+?^i[<%rT7A0=K"0JG2+D.[;f
$4R>;67sBqF_kc#DBNIuFCcS,DfQsdE,oZ/+>GQ$+>Gl92]uON+>@IO<E(R[$8OFp2E3]S/i=b7
+DQ%8Ao_BiC`kGm3&_s:+>GPZ$4R>;67sB[+Eh10F_)!h?SF)e1,gsK2D[9I1Gh'64Wnc[A0>Ma
0R7MG+>Gl92]sq"0ea%D%15is/g,"BAT`&:G%#30ATJu5B.b;d2%9mb6u>(J+>Pc12E3]T/i,1>
1,TLJ<,FcZ+C?fT0et[C2`*<E%172j0Prs6+C?i]2`E]P0eP4>1,1OB2@U!&$;No?+=Js!/i5""
E+^:Q1^se6BJ<pZ3Zp1;0J51?0K(XF1H-F,+=K$(0J5@F2)[9M1H%-H3?Tdo8jmM=/Kcf*2)-sF
2(gR3+=eQ_0J5%50Jb[I3AWH6.Nh]-?8<rP/Kci/2_d!?0JFUqINVU,?8E#t%15is/g,4PDfp/@
F`\`RG%#30ATJu)BkCsgEZf(6+DbJ-F<G+*@qfdgCaTZ!:-pQUF)>i<FDuAE+=KE8/hn^r@rH4'
F`_2*+Dk\$F`SoZ+=o,f-QjcZ/1r%m0J5:3+?1N*1*C[P0Ol4V3ZrNX0Pq7+%15is/g,=GCis<1
+CSo'AS!!+D]gq\A7]7bD..7%%156O+=Aiq2CBV,+Z_A$FD*@<+=oPrFD*@F%13OO:-pQUD.R-n
+EM7-ATD?jC`mh6D.Oi%DfQsT3B/r?6#^jYC`kGd+CT@70f`o.1,3W,0JIPj<E'D7=\V:I3Zp.;
3&_s:/28h$.j/G7Ao_R%F!*1t+>PYo0F\@]6t8A@+DQ%8Ao_BiC`lkT6k'K&@m)jqB2gR1D.Fbl
9gfEt%15is/g,=GCis<1+CSo'AS!!+D]h"^A7]7bD..7%%156O+=Aiq3%#h.+Z_A$<+@%%3ZqC=
%13OOFD*@<4ZX^&ARTItBk1sh0H`tU@grbS$;No?+Eh10F_,V:@:sUlAKZ)5+>t?QARfFk@;Kuo
$9^$b-SR/2-QkAl3\hh"BJ<p=/34nqBJ=94$4R>;67sBuDfT]'Ch\3,+EV9N@grceBJ<pZ3Zr<^
BJ:QNBJ<p*$?Tr8D*9p&0et^@2`!BP2`!95+AP6U+E1s93&M-P%15is/g,"B@;[3/Bk1dqARTBt
FD5T'+@0seBl"nH0J">$3B/r?0Ha@p+DG^9BPhf5E+^dG3&D'OFD*@F4ZX]50f(1=-S[;&4!ujC
/i,CD3%#.BFD*@<4ZX]:-SR)*/2/\5-Qjfs+Z_;++Co>1Ao_Em+>G_r-%6tSFD*?ND.R-nF(o01
D.G=C0f_3P+>b2q0F\A2BJ=9G/NP"rBJ<p*$4R>;67sC(@;L'tF!+n(Eb/f)FDi9[+Co%nBl.9p
Et&I>0-DVr/iG("3$C=<+EV9N@j!<`+EV9ND%-g]$7Kb&@;^.#A85X/+DQ%8Ao_BiC`lkT6n'6A
+Dk[uDKBN&H#7(G+B_E,%13OO:-pQUD.R:$F!,F7/g)l)2@U")0KhH>/7`U=Ao_Em+Dk[uDJs!#
BlS90FEqV30H`,-1c@<R2(g`q$4R>;67sBt@<?!mATJu9D]ghYA7]7bD..7%%14jH+>Pht1,ggB
0K1++3Zp+/0JG4(Ec6)<A0>G;%13OO:-pQU@;p0oEb0-1+EM7-ATD?jC`mh6D.OhA+Dk\$F`S[E
B.b;d1^se6BJ=9d3Zoe)1FG730eat:-T!_60f([7%172j0Om7,+CT5.@<-F'A85X/+>Pc12E3]S
/i=(F:-pQUD..NrBOu6-FDi9X+Co%nBl.9pEt&IuBJ=9G/NP"*-SR)*/2/\4-Qjfs+Z_;++EV9N
@grbS$8OFp2E3]T/i,1>1,U1;+A,$b3Zr0[Ch@]t@;I&;H$O[\D/Elq+>Gl92]sq"0ea_)3?U(3
+>=63FD*@<4ZX^&ARTItBk1sh0H`tU%172j0Prs6+C?i]2`E]P0eP4>1,1OB2@U!V0-DVr/iG("
3$C=<+EV9N@j!<`+EV9ND%-hI67sBt@<?!mATJu9D]gkZA7]7bD..7%+>"^QAS$"*+E1sG+?24f
$7I;R-TEJ&4!ug@-T`\52_HdD3Ar66+>#Vs/13,&0J"n11aaCo3$C=:.3L0PD0'<0A7Qf;2'=2o
+Du:70HbIN0OkP!%15is/g+2+DKU"CDf-[P3B/u@9jr'PBHT&a+@:!fFDl%>/KenAAT`&:E+^dG
3B7NU=\V:I3Zp.;3&i$:+>PV[$?Tr8@m)jq@;p0oEcYr*C1K"@C3=?)EarNo+B_E,%172j0Prs6
+=Alu-T`\50IJq02)m3C0II;::-pQUD..NrBOu6-FDi:DASuU'+E(j7@3BW&@rH6q%172j0Pqpa
3Zoe(/2/V//i"ds3$C=:+=nXWBJ<p*$?Tr8D*9p&0fM$D2`*9D3"63i67sBjDf0`0Ec`F;D0$hA
Bl.E(FDi:4AS6$pAKZ)/D.O.`FD*@<4ZX]rA7fjmD0$gS2'=@kFD*@<%15is/g,">FCSuqF!,RC
+>b3OARfFk@;Kuo$7IGZ/het50d(LTF`(_4FD*@F.3L3'+=o3!0JG18+EDCCDIal3BJ<p*$4R>;
67sC'DJ=28@rH7.ATDj+Df0V*$;No?+D>dHD/!l=F(Jj&/nAK8FDi:4AS6':A7Q,V1bgU:2)I!F
1E\h'0J5%50JG18+EDCCDIal#A7fjmD0$gS2'=@k1*AD1+>GW(3B&f<+AP6U+AtKJBl5&,/8ZqZ
%15is/g+\9B6,\9A0>u4+D>dHD/!l=F(Jj&/nAK%$8N_\1a"M./ibjJ+>#Vs0J5%50d(LTF`(_4
/7`U=Ao_Em+>G_r-%6sn0eP.;1b^gD%13OO:-pQUAT2QtBHU_oC3=T>D.RU,+Dk\$F`S[EB.b;]
1,]RKH=_1PD*9p&0J5(>1c[?K0d'[CH8'2!3Zp+/0fV!M2)7!2>9J$$0Prs6+>>E&2D@'D3%tdK
:-pQUD..NrBOu6-FDi9U/het50d("<B6%QpEt&I!4YJ!6+Bos20J5%50JO\jDfor.+=MPIF>.P_
H8'1eFD*@F.3L/o+F7U@H?<h"0H`,)1,pC20d&2,/ho?q$4R>;67sBhE,]6+ASuT4Ea^M0ARcj"
AS$"*+E1sG+>GW1%14J'@3B)l@jaE#+<WEn1,pC20d&2,/ho@/@;p0oE`,1k77/1S0eP.;1b^gD
+=o,f1c[0D1,h-L0F\@a67sBkAS6$pATJu2@<?!m+EVNE1a$=?@qfdgCi^$m4YIp*0J510+=K2m
3\i-,1c[0E1cR<O1E\50+Co%n%156O+=Aiq1aaCo3$C=<.3LH%/i>IE1,1U./34no@1<Q=67sC$
@3B9%+D<<C/9;qN@<?!mATJu9D]j+4@rH6q%14LG4"akp-Qk/e1c?I20deCm/NP"*-8%J)-SQnj
-o`A20e"5UD0'<0A7Qf;2'=2o+=qPA%13OO:-pQUD.R:$F!,17FCfK3Derj(Bl@l3A8,XfATD@"
@qB^4+E1s91,L+/2%9n(0KhH>0eP7A0f1XG1a"M*1H7*E1,1R-0eP7A0etRC1CX[S0-DVr/iP.#
3$C=<+Bosq0J5%50JY=A0d&/&0JG171,L[-/34n;0d(fc@;KajBkDE/AM=Q#4YIp*0J5:3+?1N*
1*BdD0J5%50JYF>0d&#.+?hP'HQZa5Ch.6lF!,$J%13OO:-pQUFD,5.BQ&$6+CT/#Ch4_[+?^ih
BJ:P\+A<n0+ECm5AoD^,F_kJ/Bl5&1AS$"*%15is/g,"RF*&O6AKYH&@:O(aFCeu*Ch[Zr+@mV<
+=M>F0H_qi9IV)9+ECm"$;No?+D#e+D/a<&+Dk\$F`S[EB.b;e0b"I\4ZX]6-tIC2EbK<2+?1K"
1a"Y6/iY^E.3L2b-tIC2EbK<2+>k9$+>G`+2^p0u/KeSFAo_R%F!*4o+?:Q!2D-mE0b"Ib67sBj
Df0`0Ec`FFARfXrA9/l8D]i_3F`MOGFD,6'+Co%rEb/g'+>"^Q@<?!mATJu9D]gq\A7]7bD..7%
%156O-SR/2-Qjfs+Z_A-+>u&/1GppB1G^.)3Zr<^BJ:P`2'=@k1H$p@+=2IZ8.>n8$4R=r+>>'P
Eaa$#+?MV3@Us*oFD*@F+EV9N@j"`f+B2hnAM>6QATTVC+F5_Y+B_E,+A,$E8jm/38jmM=Ea^)$
ARciR-OgCl$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#D.R:$F'j!*Deio3EbTT+F(KH#DII^0
FCB32?ZU(&CLp7-/h1mUF(KE(FC/ooG&qb6EcYT/D/X3$+<YbX/Kc0GDf'H%Eb0;7+<W(QBldj,
ATT@D+<Y0&Ch%N/+EVN2$;No?+E2.*DImouEbTZ5+E2@>B6%EtF"Rn/:-pQB$;No?+B3#gF!,R9
F*&NI@rH4'@<,q#+<W(QBldj,ATT@DFE1f-F(o_=FD5T'F!+n/A0>;sFD5i>A7]g)FDhTq:-pQU
Eb0<7Cij_@@rH4'F`_2*+C]U=FD,5.E,8s#ATV@$Bm"88E,ol0Ea`g++<W($@<-I'+@B^XFCfK(
A.8l@67sB\DJ=9*EcYe7:dZZS@;]Tu-rXo,+B)]\@<-')9jqN\/e&._67r]S:-pQU@rc-hFCeuD
+>PW+1MpQ@1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%13OOCi<`m+=D2DF(KE(F=.M)Ci<`m+=D2DF(KE(FB*EsCi^s5
$4R>`D/XQ=E-67F-Z3jCFD,6+DBNV(D/"'1BOu3q+E1b1F<E_04Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk-OgDXBM`,YF?MZ-Ci<flFD5Z2?[64!Ci=N=FDl&.INU@*1Gp:6+>sZ9-Ve>O@<6Nt;KEsU
BM`,YFC/NS@<-4+-TsL5:2!I4F*&OB@<Q""De*:%+>=63F)>i<FDuAE+D,J4?Z^3s@<itjBM`,Y
FC.pe4&0Hc@<6Nt@o-TSD0$-n%17/nDfp/@F`\`RDJsQ;BOu4%+D>>'Ble6,ATD?)@s)g4ASuT4
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%15jD6ZmEi4ZX^%De!3tBl@lrH"Cf.Dg-8EDf0-8+>PW+
1E\Ir1,fXL-Ve>BF`MM0;KEsUBL?o_EaN<Q@<-4+-TsL5:2!";EcN:?@<Q""De*:%+>=63F)>i<
FDuAE+D,J4?Z^3s@<itjBL?o_EaM^c4&0HVF`MM0@o-TSD0$-n%17/nDfp/@F`\`RDJsQ;BOu4%
+D>>'Ble6,ATD?)Ap&3<Eb-@94Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%15jD7Wif93Zr6W@psIn
Df/p-ASc1$GB7kEDIn8>1,(O@+?(Du%14IXBL[,d?W(qf:2!+>FC/NS@<-4+-TsL5:2!+>F<GI0
G$f?0A79a+0F\A1D/XQ=E-67FAo2WsFDk\uGp#jq7Wif[;KFopBL[,d?Xlo@Ec#k,$4R=O$?L'&
F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#DII^0FCB32?ZU(&CLnk&$4R>_Bldj,ATV:"Bldj,ATV:#
D/X3$:-pQ_EbTT+F(KH#EbTT+F(KH#F)>i2AKZ(H/KcH^Bldj,ATT@DF)>i2AKZ)+F*)IU$;No?
$;No?+CfG'@<?'k3Zp131,EcUE\]Q\:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:Ci<`m+=D2DF(KE(F=.D&:-pQUD.R:$F!,F7
/g*/7/28h4$;<cL3Zqcg0eP.>1G^.11+k@=1G^-r:-pQU6>ppeDf,nb9gh-*+>Gl93$:""1,'&8
:H^`]0FCQA/g+S5A0>f"C1UmsF!,@=F<G:8+A"k!+DtV)ATJtG+Dtb%A9/kF+DtV)ALnsE@4WO3
ARc'5:I72s+=K?63[[s>DKU"J.4cl01bgUA1GLXF.4dS93%d$E0KClq5u0g1/g)\l/j:C+4$"`b
6:tT[@;TQu:I7Z\;F+Y^1,(C9+AY<r?USI8?V3(-0JFk'+=o,f5u0fS6tL1V@8q;DG%G].A7]+g
Bldj,ATV9B3Zp:<$7AkpF!+sh@<-4+-TsL5-s9844&o'<9L:g'5u0fr+ED1;ATMF)+=C3$DKU"J
$8<SV,\;")F(HIA6tL1V@8q;DG%G].A7]+gBldj,ATV9,$49Np/g,=GCis<1+CT;%+EqOABPD?,
0ea_eBl8'8ATJu4Afu2/AKYi$AT`&:@W-1#+::k1/g,1GF*2;@+>"^RDfd+7Eb/[$+C]J8+D5V2
A0>H$Dfo]++D,P4+Co&#D]j7BEbc"VAS$"*D/!lN3ZoOq0-VMn+C-*J0H`(m.O$Si>p(jW+>Pes
/0HZ-+>beq/34n/+>l"`0ea_6+?hD2Hqe0`F`VD6DBLMR.k`(h0d'aE2D?7.+=\Qi+C-*s1*Cor
+u(3%1*Cof0d'M;F!(es9L:m'+<Y#G0fCX?2`3TQ2BXh4/iGOE2`ET:+<XEG/g*l"EbT&u@;[1p
=\V:I3Zp131,C%/+>Pk_<DPb=+<WQb+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g*ke<$51?6Qg;Z
AohO*$48.YF!+sh@<-4+-TsL5-s9844&o'<9L:0NEbTT+F(KG9-UDQ]DepdD$7A_m+Ce5VEc#kF
4ZX]6=\V:G<DP\M67F$tBldj,ATT%B6#:1PCaV:l;JBcTCaV:l;fHG\@4)Bh:-pQU6?6dQBQP@q
FCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjkld:-pQUBQS?8F#ks-GB\6`@;KdhDII$-@rH3;@<6O2
Df0K1GqWWIBkM+$/TZ#BEcWm[BlIR#A7[DR1H%'J0/>4:1G(::/M]6l6?>:N+?MV36#:XOBlY=a
ASu'g+@^9d@;KUcF`\`lChI[&+@0gSAR](g@;[2cBkM!n+@BRVASc0k+@9XUCghF+Bm;!46?>:N
+@:-#4$"`UATVL"B4Z4,AKXocEbTZ;+Ad)s@sN!1+AcumCistF;IsK`CiseA;fHG\@3@jV@ruj6
F`SZkDKK<-ATJtpAS5F!+:8H';KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+@:,V$;No?
+EVX4DKBN6F!,=.FCSu,AmoCoCj@.IASc0*EbTT+06:]HF!,"-AnGUp+>k9`D]gbg+Dkh1F`_29
$:8f5Ea`j,BllL!+?:Q!3%Qd<+?1o,1*A>0/29%*1Gp^<3$9t-0fU:40e>%=+>bl*3\`T:2),G)
F&[0gDKBN64ZX]PF&[0gDKBN6+=nWi3?U(3/2An%0ek470d&>)1,0n+0e>(9+>Yi*1*AG2/2JD*
1b:L,2)m-J3$:$b$;No?+EVX4DKBN6+CT).BlnK.AKYMpB6%QpEsb6T6#:X+3Zp:;+?2>'0fC.6
2]t"6+>Yu"3&_s;1($?h6#:X+3Zpb16#:Wo2)?@13?U16+?),"2)l^72'=e7+>Gl!3&M$M<)$1P
3Zrc1+u(3<Esb3,<'<8b-n%244"N'7-@7('+B2'3.3L/o+@:-8Cigd,<)Q[Y3Zoh!4>AoQ+>YGn
HR:p!<)$1<+=o,f6??+H@;^.#F:&@M67sBhCijB5F_#')+DkP/@q[!,D]gbWA7]CoARu3'+?^i2
/h\>!0-W+n5tk5b$;No?+EVX4DKBN6+EV=7ATJu2@<?!m+EVNE0d(=IDKU&4+DG^9GAhMCF<G(%
F(G\5+?^i2/h\>p+=K-%+<rpR3aXTa>p(gD0d(fe0d'Fn<%/qA+>tnr,<B-l?SN[/+>P&q+F>:e
+B26<$48.P5uf%&5uo?r3Zr6W@:XG$@<-E30FB4T/g<"m:-ho04ZX^43[-:$:-hnf.!mQj0d'%R
<@L'l+F?-n0d'%R<=1*K@<Q[4+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%i@<Q!VFCB2s
:18!N$7ADRF`MOG@o-TSD0%'f3ZohR9gh'C:HM6:.3NYFF(KE(F<F.@<F8L0D.O%]:-pQUA7]@]
F_l.B$7APZEbT&u@;^+,+Ce5VEc#kF4ZX^"@<Gq!De*:%+>=-0:-pQUA79Rk+E(j7<GZeuFWbaI
@<*K0@<-I8+Co2(ATA-#8jkg'+DQ%8Ao_BiC`mk'9gh-*+>PW+1*A;*+>Gk`<D6Cj<BWAc0f(O:
0JPRE0d'gY2(g[A1GCNjF]DC.4ZX]m3A*03$?]$:5t=(!+>ti+$?]$5:Jt@Z3Zp9e-WOu*EclDD
+Ce5VEc#kF4ZX]6F]hF,4*=.`4&nsS;H5f$<E)=IF\GLq7ltie85E,e.3N>5F^K6/A79a+0FB1-
Cisc@EcW@5:gnB]F!j+3+=MA89gh'c8jka@9N=tj4*=P&6T]Ea9gM92F\G>%;HbLlDII]qFDk\u
Gp"dJ$7ASWG&hXH@o-TSD0%'f3[ef_@psInDf/p-ASc1$GB7kEDIn8>0f_$G+?:Q"2(ggF.3N>5
F^K6/A79a+0FB1&@<Q[4+Ce5VEc#kF4ZY!-De!3tBl@lrBQ%a!INU@*2)ZR9+>Gi)+DtV2?Z^3s
@<itL$7ASWG&hXH@o-TSD0%'f3[ef_@psInDf/p)Cisc@INUC"1c$75+>PAgDII]qFDk\uGp"dJ
$8<SV,\;")F(HIA5u0fi9k@mYF)>W/+BEN(+A>*E=\V:,<DO`8F!*ej+@:-KEa`j,BlkIaF$XVa
+B2'3+@/\#+B26<+AQ?gEcW?p@<HU3+Ce5VEc#kF$8<SV,\;")F(HIB4$"`\5uf%&5uo?^+=nW`
HS-Ks+AP4'.4cTg/g<"m8O6>`0H`%pATD4#AKW@C=\V:,F\5%E<D6Cj<?QEa<'qdN9MIfC+E^@K
:Jt@=9kA?ZA8,IiEcW@'Cisc@EcWT8$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#EbTT+F(KH#
F)>i2ALDM4F(KE(FC0,uDJj$+?ZU(&CLp7-/h1mUF(KE(FC0,uDJj$+?ZU(&CLnW1/M/)dD/X3$
+EV19FE8R:DfQt"@;]soEZfO:Eaj)B%15is/e&._67sBoFEDJC3\N.(AT)O.DeF*!D/EusF"Us@
D(fdLFCB9*Df0VL%15is/e&._67sC(ATD6gFD5SQ+EM+*+DG^9-t[UDF"%P*:-pQB$;No?+<Ve%
67sB;+Co2-E$0Q]+>b3ODJUFCDKU&0FD5Z2?RH9i:-pQU+<YQEFCB9*Df/orDI73uDJ*[*F_#&j
A5I>]?Ys<_$;No?+<VeEF`_&6Bl@lrBl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys<_
$;No?%15is/g+SDF*2>2F#kFVEc6)>+=M8EF(KE(F=A>HF!,:;@:Wq[%15is/e&._67sBjEb/[$
ARmhE1,(I>D..H>1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$>aWhA0<7?Bldj,ATT:/$4R>;67sBoBkM*%E,oZ1F<GOC
ARfFqBl@ku$7InX3\`?<+>Gb`$4R>;67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sBjDf'H%Eb-@gF`_&6Bl@l38T#Y>@r,ju
FD55nC`lDiDJ*[*F_#&+FDi:F@;L'tEt&IO67sBjDf'H9FCeu*@<<W*FEDJC3\N.(AT)O.DeF*!
D/EusF"Us@D(fdLFCB9*Df0VLBl7HmGV3rKE"*-`$;No?+B3#c+CSbiF`Lo#Gp%$;+EV:.+Cehr
@s)TrFD5Z2+Co%nEb/[#ATJu9BOr;uF`MS;ATAo%G@>b+$;No?+F.mJ+D58-+D,Y4D'3q6AKXT#
0JG1'AT2QtBHVM4Bk(g!BlbD@BR(_3E,T6"F!+n3AKZ#)F(KG&$;No?+D#_-Ed8d>BkDI4+F.O,
EcW@AEZfFA+CT.u+Dtb7+CT)!DfTQ6BPhf5Ch[Zr+EV:2F!,C=AKYE%AISuA67sBhEb-A6AS5Rl
ATD4$ARloqEc5e;F)Pl'EZfFKF*(u1+Ceu!ATMs-@;I''ARfC^DJ<U%/e&-s$;No?+EV19F<G+&
FCfM90Ha@p%17AtA3Dsr1,(I>+>Y,p1*A+j0f_*O+>GVo0eje%+>PZ-2'=V/+>GZ'+>Gi00H`+n
0d&#.+>Gl42'=h#2@U!&$;No?+EM41Aoo/+@<?(%+D,P4G@>N&+CT.u+EM+9+EV=7AKZ)5+>PWa
3\`L/3\rL3+B;AM$>*g^D0%j$+D,.rEbK<2+D>V54ZX]@0H`)-+>Y_]$@-K!1-IZ@FDk\uFCcjb
/ho%60I)#kH#7(@.s,]?@<la/+F.g7%17AtA26;/+F.g71*A(i-mO"SA25SV,9SNu0H`&#An5Rl
Et&Hc$;*^.4ZX]@1c@$A0f:R@%14jE1,C%/+>GVo/NP".H[0I=%15]qF<E^h8jkg'+DQ%8Ao_Bi
C`kEYH#7($$>t!.4ZX]m0J5%51,h!C0fLdF+AP6U+Co%r%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1
A7]+Y:ig=n8jj*q:-pQU@:sUlATJu9D]gt]A7]7bD..7%%156O+=Aiq2^]^r3$C=<.3KaNF`\`W
3Zr<_@grbS$;*^.4ZX]@1c%$M0f(F>%14gM2)ud61*A;++>#Vs0me1_A.8l<7!'P7+A,$b3Zr0[
Ch@]t@;I&@H[0I=%16uqF?MZ-?SF)d0JG7:1,L^F0F\A,F^mQq+Du=D@<?4%DI73uDJ*[*F_#&j
A5I>]+A,$2$;No?+CSo'AS#p*FDi9\+Co%nBl.9pEt&I>0-DVr/iP.#-o`A21+==gDKU%D/34nk
F^kjf%15]qF?MZ-1,Ua?0f_3G2%9mJ0f([00esk+1E\81+>S:hD.F(_8jmbD4Wm?b4ZX^#F_kZ1
@ps0r14+:`A.8l`F`]c-+C?fT0JG4;2E<]S2DGXJDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuS
Bcp#9%15is/g+S8Eb/g'+EVNE2'?F@@qfdgCi^$m4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu
$4R>77!(RQ+>P`33&NHM/i=(F0fUj@+>P&o+>#Vs1OFCaA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&B
H[0I=%16uqF?MZ-?SF)d0JY@:3&iTM2[p+3F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2
$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp171,h3Q3A*/u$8FOs2'=h#2BXS4
+>eFjD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r1jaLbA.8l`F`]c-+>>E%0JkXE1b^d@1CX\/F^mQq
+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/2-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO
:-pQUDJsD80Ha@p+EV=7ATJtg@<itM/0H]%0K(%.1HI?K3\iH5<E'D78jmba3Zp172)@3L2_HdC
0fM'I1b^jF0K0FJ8jkg'+DQ%8Ao_BiC`kJe0K(%2/287t+D,.rEbK<2+>GYp1c$701(=RR0./G+
3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]m0J5%50JtRB1H@0G%16uq@m)jqDKU&0FD5Z2?YjXu
B5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc30JY@:
/i,=@0ebRG3ArWQ2@U!A0RJ(^A25SV/NP"00JYF,3@lp@+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r
0RJ(^A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-?SF)d0JY@<2D@$L1^se0F^mQq
+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/2-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO
8jmba3Zp171H.9P0J5.<1bg[D2`WcO3Aq<R-o$'oD.GCN+>#Vs0f_-I+?(i,1a":kAn5RlEt&IK
6p3RRC3=?)EarNo+>J4gD.GC2$9^$i0J5@5+=K2m3\i-,8jmbD/34nG6k'K@F`]c-+C?fT0JG:>
3AWTJ0f'7GDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuSBcp#9%156O+=Aiq2('Lp3$C=<.3KaN
F`\`W3Zr<_@grbS$;*^.4ZX]@2)$d?0K1U?1c-p@3&`iU1-%6%$7IZVH#7(I.3L3'+>PZ-3$:+1
3$9^oAn5RlEt&IK6p3RRC3=?)EarNo+>S:hD.GC2$9^$i0J5@5+=K2m3\i-,8jmbD/34nG6k'K@
F`]c-+>>E%0JYFE3AWZN2[p+3F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1
-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp162`W]N1bLR@1bg[D2`WcO3Aq<R-o63qD.GCN
+>#Vs0fUjB+?(i,2]sUnAn5RlEt&IK6p3RRC3=?)EarNo+>\@iD.GC2$9^$i0J5@5+=K2m3\i-,
8jmbD/34nG6k'K@F`]c-+>>E%0JPIE2`ETM0F\A,F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]
+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp171,q-M2(g[A1bg[D2`WcO
3Aq<R-o?9rD.GCN+>#Vs0f_$K+>PK&0H_kgAn5RlEt&IK6p3RRC3=?)EarNo+>eFjD.GC2$9^$i
0J5@5+=K2m3\i-,8jmbD/34nG6k'K@F`]c-+>>E%0JtRD2D?sC1(=S.F^mQq+Du=D@<?4%DI73u
DJ*[*F_#&jA5I>]+A,$2$9^$b-SR/2-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO%15is/g)_t/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g+YBD/`p(AKX`jFCB9*Df-[hDBM_aCh[m3BlnVC:M(_KBOr;T@r,juFD55-FDi:F@;L'tEt&IO
67sBjDf'H9FCeu*@<<W*FEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VLBl7HmGV3rK
E"*-`$;*^.4ZX]@1c@$A0f:R@%14jE1,C%/+>GVo/NP".H[0I=%15]qF<E^h8jkg'+DQ%8Ao_Bi
C`kEYH#7($$>scnF?MZ-0J5%51,:O?1GUsN3B/-V67sBkAS2GZDJs)r4ZX^'F`_&6Bl@lrDdmNs
EHPu;H!b,mCh[j1Bk(L\7<!<9AS3,X6k'Ju67sBhB6%QpF!,RC+>P'MARfFk@;Kuo$9^$b-SR/.
-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V%15]qF?MZ-1,LdF3AE<B2%9mI3Aif>0esk+0d&&/+>J4g
D.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r0me1_A.8l`De4#R3Zqc`/het72_m-J2`!<G0b"J-De3EA
3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%156O+=Aiq2('Lp3$C=<.3KaN
De4#5/34nkDe3Df$4R>77!(RQ+>Pf.0ek[J/i=(F1,1RB+>GVo0f'q(3Zp2)H#7($$;*^.+?^i>
6p3RRC3=?)EarNo+>S:hD.F(_DJs*.4ZX]>/het71GLmI2E!EH0b"J-De3EA3Zr<_FCB9*Df/p#
@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%156O+=Aiq1FF:n3$C=<.3KaNDe4#5/34nkDe3Df
$4R>77!(RQ+>P`33&NHM/i=(F0fUj@+>P&o+>#Vs1OFCaA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&B
H[0I=%16ukATU'r+>>E%0JY@@2)I9I3Ar]'$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90FEq5)@r,ju
FD55lA4:HY6tL!R8jj*q4YIp*0J5./+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.4ZX]@1bq!M
3&rTK%14gM1Gp:6+>t>o3Zp8+H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>eFjD.F(_DJs*.4ZX]>
/het53&`ZK2`NQH3=Q=5De3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7
%156O+=Aiq1aaCo3$C=<.3KaNDe4#5/34nkDe3Df$4R=r+>>'PEaa$#+=DGOA0?/7A259>A8#h$
+D>V5+A,%D+A,$EDKU%DDKTG3DJs*.+Du+/@j_]m%17/nDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)
?Z]^oDImiqF)>i2AL@                                                        ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)-45+>P&o1E\J-+>Get1bg+-3?U16+>PYo1bg+-3?U(9+>P\p1cQU50d&5++>PVn1,r`cBl%<e
EbTT+F(KH&F_PZ&+=M8EF(KE(F=A>@DIal#BleB:Bju4,AR]drCh-mnBldj,ATV9iDe!7!Bl%<&
@;]TuA8-+,EbT!*FCcS8Bldj,ATT%k6q/;0De!p,ASuU1Bldj,ATV9fFCB&B?ZU(&CLq!oD/`p(
Bl7Q+8g#NjFCB&B.3N_N+D#e-AS`J;@<>pq1+=>SDIak^+=LZ=@ru-s.<9-DATMF)?Y+:tAStpl
?ZU(&CLqU!F*)IGAoD]47<<EZDII<'@;]Tu9k@mYF!/bm<$5UcB5_g)FD,N3Bldj,ATV9rAS$"*
?ZU(&CLqR(Deio,FCfN8F!,(5EZe(fAT`&:G%G]'F)ku9ATMF)?Z':qF*(i2F'j!*DeiooDf'H%
Eb0;7-us$CATMF).3N,/Ch%N/FDi:@Cgh3mFCB3(F_r7?Ec5T2@;U(+Bldj,ATV:"Bldj,ATV:#
D/X3$-us$CATMF).3N\KDeio,FCfN8F)ku9ATMF)?Z]^oDImiqF)>i2ATM^,CLnW1ATMs7+D,P4
+B2ceDImi2G%G]'Er                                                         ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0etO-0esk-+>bbp1*A>23A;R20H`+n1c.3N+>GVo1*AG01E\D0+>P&s1c7061,L+/+>u/72_cF0
2'=Xs2`ETS+>bhr1*AG73&_s83?U("1cIET+>bnt1*AA31-$I30H`+n2)$s30f:(/+?;;6+>P\p
1*AA31-%$TEbT0"FC.sg@<-Er9kA?ZA8,Ii?U8LF@;]L`?SXES@<++^?Ys=/2]s4p/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%0+@:!WGp"4P+<VdL+<VdL;JC2`F!)SJ+<VdL+<VdoEc6#?ATM*!+<VdL+<XBeB5VF*
F_#&++<VdL+B)inEt&I!+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve$ATDKqBjkm%+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZ#+>#/s/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+
/M/P+/KcVs/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/O`$6UHWCij*"EZcJI+<VdL+<WF#1bp1>
/kms'+<VdL+?;J;3$:L>9eKZn+<VdL0J5==+<VdL+<VdL+<Vd_3]/c;:bGHp>R_#_+<VdL+<VdL
+<VdL+<VdL73E]q+<VdL+<VdL+<Vda28ZR?+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<X_p$4R=b
+@KdYARZc)+<VdL+<VdL0ebXF2]tpL9eKZn+<Vd]0KLmI+@.VS/mKMA+<WBk1GBpo+<VdL+<VdL
+?;J<2BYgK9eKZ[$6UH6+<VdL+<VdL+<VdL+<XE%+<VdL+<VdL+<VdL+?2?tYTP&2+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL:(7O>$6UH\Df&p!BOQ%*+<VdL+<WX)1GU(=/kms'+<VdL+>GW41,U1N
/kms'+<VdL0eP48+<VdL+<VdL+<Vd`3\`T::bGHp>R_#_+<VdL+<VdL+<VdL+<VdL;ahfO+<VdL
+<VdL+<Vd]2Su[@+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XTa%13OO+<WsdB5_T/+<VdL+<VdL
+>u8;2'>1;9eKZn+<VdL1cdEM+Aa[b/mKMA+<Vd^/i#+'+<VdL+<VdL+<WF#1-$IC/kms'%144#
+<VdL+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WX&_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+APuI$4R=b+@0gSAR](g@;[21+<VdL0ebXG1a#(:9eKZn+<Vdb3\W<3:bGHp>Tb.3+<W?j3A;Qu
+<VdL+<VdL+>Go31a#(:9eKZ[$6UH6+<VdL+<VdL+<VdL+<XEJ+<VdL+<VdL+<VdL+>u!lYTP&2
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL:0.l3%144#;JBcTC`jiC+<VdL+<Vd]3\`<2:bGHp>Tb.3
+<WR'1bg+L/kms'+<VdL+>>E&0H_J\+<VdL+<VdL0etdE2'>1;9eKZ[$6UH6+<VdL+<VdL+<VdL
+<X)q+<VdL+<VdL+<VdL+>Z!oYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHY@;odo
CgeG/+<VdL+<X$cEas6/E,TQ$Ea0_0+>u8;1E]LH9eKZn+<VdL0J5(6+<VdL+<VdL+<VdoBl[^+
D/aE0@<,T^$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+?2<sYTP&2+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL%13OO+<X!^Ci!O%EbTb@+<VdL+>GW41,U1N/kms'+<VdL2EE]M+Aa[b/mKMA
+<Vd]/iGC++<VdL+<VdL+<WC"1,9t</kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL+<VdL
+<WNs_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#6=k7MChI=%F(HI:+<Vd]1-.9I
+Aa[b/mKMA+<WU(1,0nJ/kms'+<VdL+>>E)0H_J\+<VdL+<VdL0fh0M+@.VS/mJhm+<VdL+<VdL
+<VdL+<VdL+@RCq+<VdL+<VdL+<VdL2)E+R+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.%13OO
+<XTsEbTZ;+<VdL+<VdL+>Z&52'>^J9eKZn+<VdL3'&cK+Aa[b/mKMA+<VdY0eP::+<VdL+<VdL
+<WC"0eje:/kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL+<VdL+<WF"_QY.*+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+B)>N$4R=b+Ad)s@sN!1+<VdL+<VdL1-.6J+Aa[b/mKMA+<Vde3\WE6
:bGHp>Tb.3+<W?j1b^$p+<VdL+<VdL+>Z&70d&b79eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q+<VdL
+<VdL+<VdL+>kmjYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHfDes64GT\+O+<VdL
+<WC"0K1+N/kms'+<VdL+?;J;0d':F9eKZn+<VdL0eP48+<VdL+<VdL+<Vda3\iB35qYka>R_#_
+<VdL+<VdL+<VdL+<VdL:.69J+<VdL+<VdL+<Vdc1r?I>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<XE\%13OO+<XQnB6A$5F!)SJ+<VdL+>c,92'>^J9eKZn+<VdL0ek^F1a#UI9eKZn+<Vd]/i57)
+<VdL+<VdL+<WR'1,^7@/kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL+<VdL+<WO$_QY.*
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#;fHG\@3?[8+<VdL+<Vde3\rK5:bGHp>Tb.3
+<WF#2)HFA/kms'+<VdL+>GK&0H_J\+<VdL+<VdL3'&cL+@.VS/mJhm+<VdL+<VdL+<VdL+<VdL
+@RCq+<VdL+<VdL+<VdL1H!%R+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.%13OO+<Wsj@ruj6
F`SZJ+<VdL+?2D;0d':F9eKZn+<VdL1HI?L+@.VS/mKMA+<VdY0J5(6+<VdL+<VdL+<WBn3\W?4
5qYka>R_#_+<VdL+<VdL+<VdL+<VdL:.69J+<VdL+<VdL+<Vdb28ZR?+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<XE\%13OO+<WsfFCB3$F!)SJ+<VdL+>Go63$:L>9eKZn+<VdL2**TS+@.VS/mKMA
+<Vd\/ibU.+<VdL+<VdL+<WBm3\WN95qYka>R_#_+<VdL+<VdL+<VdL+<VdL;ahfO+<VdL+<VdL
+<Vd]3Pr!C+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XTa%13OO+<X]rB42o*+<VdL+<VdL+>GQ2
1H$@P/kms'+<VdL3'&`M+@.VS/mKMA+<VdL+<VdL+<VdL+<VdL+<WO&1-$IR/kms'%144#+<VdL
+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WX$_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+APuI
$6UHC/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^@<Q?t@<?4%DI6=a@<-ErFEhm_2,7S'?W2&TEaMR[#u4oP?W2&T
EaMRMD.O#?@<lF)?USIHBkM<lFD5Z2#u4oGAR@lJH#7J9DeF>%;b01\6tKkEBl7@$Bl@kq<c)8X
?VY$Q#uY>HATD@"@qB]j$8;c_Derj&BlaU+Yom%eF(&W&9keK`EbTS$FD,5.E,TQ(+=M;Q@<*e'
1GLlr:*;MV_QX>%/hf!d><#nm2E"hM$8DiQCiF'!Eaa'9$-odu6#L4RDf'&r@:]aeBOr<"DfTo1
-Z^DJ@<Q3u#r=Fu#u2Tu3Pr!,1+k7=$!TAp><,su$8MoRDJNZh$-odu:hXcYDJ<TpEsZ>pBl7Km
+DtV)ALnrJE+j0$DJ=><@VKjn+s:T;+@1$V@VK<Y1Gpuq;]mnP_QX>%/i,Em><#nm0eclB$8Vue
@q]Fa@<)\"YolDBF)u&6E+N`lAI3HlAKYH&ARTY%+=M/?+@BRYF(oQ3ASGR%#r=Fm#u2U#2Su[)
1+k=>$!TAp>;7j<%14ou6tpURA75eiZ62MGFD2&'BOr<-ARfXrA0>K)DeC1@7W3-PChR7"F<Gd9
F!,C=@q?d)BOr;uBl\9:.1%de3=/V,0f[%S#r4+e1^RAG?!B$=>n%,u#si'7ATDZsEXC$r+@U<b
A79@i$"\!b+E(j7FD,5.EbT].EZcc!EbT&mDKU"L#r=@q#u_s(2o;d*0J54:$!TAp>;7p>%15!"
87?@DC^JCl+@1$^ATVX-$"e<rCb9:?Dg-(ACgh0i#r==r#u2Tu1W$@&1+k77$!TAp>;7s?%15$#
6"=>?@<)\"\0+4\Bk1XiBaJ3cDffZ(EZet4Ebuq;AfsBLBOu4%@<)Z10fB>:+>bdhYR**<1'q/E
?!B$@>n%-##u+uKCLM5icESKZATVVmDJsT-+=M/?+EV:.+EqL-Ch5%%1GL`n:*;5I_QX>%/i<r>
3*f`C2I-b!3=/DoEb8`q$-odu:h=ZgASDH^Cgq=,+E(j7FD,5.:i']W@:Wqj#r=7q#u2U#0Z(%#
0ePF@$!TAp>;8'B%14gD#siB<AR](g@;ZCsYom"SF`M1&AoDL%Dg,c5+=M/?+EV:.+AclcBjkO`
F"%DN3ACh8+>GdkYR*!93&Mfb><#nm0fWGJ$8F7A;JBcTC^JCm+A[#lDf091$"e*oF<DuJAS-$,
AoDU0+E(j7:NC/fDCGlI3&1e=+>>dlYR*!90es&>3*f`C3F*($0es&&@;odoCgdXqYol>TEbT/p
AI30eFED>1+EM4-/SB!1F9s]^0aUSt1cE4T#r!tj0aV&D?!B'<>n%,q1C6BZCi!O%EbTb)cEeWh
EbTH0BlaSmASkjlAKZ2*EcPl4EX=K[3=/G'0K-eP#r+%j1^RAG?!B'=>n%,q1^QTeDIIX#$-oh!
<+0oiBaJ]qAKYH)FED57B-;D4FD)e=BOr<"DfT`:#r4G"#u2Tu3Pr!,0eP@D$!TAp>;@s>%14gI
#siBFBl%3p$-oq$:NC/fDJ=.uF*)G:DJ()1Afu&(@<-1*#r4Ft#u_s#0uC.$0ePC=$!TAp>;A!?
%14gJ#sr3FASc!jF`V+#cESKfEbTH0BlaT&BOr<"@;]TuDe:,#Cb87fFaCuW+=LqVAM,*$EbTH0
.1%ag0aUSt0K6kQ#r!th3!ieK?!B'@>n%,q2[Mi[DJsK:Es^-s+@BRXBl7?j$"I[kGp%$;+CT.t
Bk;1(+@TpgE-)CA2Db_=+>kslYR0<FOt\LI1'q/E?!B'A>n%,q3!iMtEbTZ;$-odu6XakHF!+1c
C2\-,EsZr%AKZ&(DfT?$Bl7Q+Df0,/-ua*DF_kK,Cj@QSFD,5.A8c*'F*(i2.1%ae3=/V,0fQtR
$0$c(0eP:A$!TAp>;A*B%14gM#si*8@<,c_cF"c^@;]e#+AH9ZDfTQ5$$9il+EhI>B5)63F"%DN
2)Yb>+>PsoYR*$:2),DA3*f`D2dHk"1,'#2Ec5H5Df,m,YolDBDJ=/79keK`EbTS$@V'.iEb-A8
BOr;sDeC1@EbTT/DJ()$AS,k$AKZ).AKYN%B-;8;@<*nA;e^8dF`Su<1,Lip:*;5J_QX>#/i,<j
><#nm1,rPK$8O=B:iC/dFa+5<Z62YKD/!m+Ecl4*>%Mht-Qm>LBOu3,FE_G:+EMI=+=KTcF*)>@
/0N6C+@g![/0JYJ+EV:.+D,>.F*&OHGA1qD#r4=o#u2Tu35Vm+0eP1<$!TAp>;A3E%14jG#si`K
DfQ00[4rdk@<-("@:]aTDeX*#A0>buD.O#/1GfD:+>l0rYR*';1^RAG?!B*=>n%,r1C7!&BOPUk
$-p.*<b6)cEcl4*F(fK4FCf?$A0>K&Ebuq;AfsBU+B*Dr@;0O/+E)./+@1$V@VK<pDIIBn+D,P4
+@BRTDfBi?#r47l#u_s'1W$@&1+k=<$!TAp>;J!>%14jI#u,,BE,8rmBk2@-$-oh!6Xb"LDII)_
EHPu,F<GLB+EMX=Cht5<@<?($EsXTW1'pl%2_`+Q#r+%k0F:rC?!B*?>n%,r2$lQbE+i[#A-pPd
+@pcgEa`McF)Pl/FCB38+EMX5EZf:4+EV:.+EM+7E+Np/#r44p#u_s#3Pr!,1+k77$!TAp>;J'@
%14jK#uY>IF_l2A$-odu9P&-[BlaT&BOr<*EbTE$AI1+G3!i>&0f$VM#r+%g2$mJH?!B*A>n%,r
2[Mlp@VB<ZcET)H<H<.hAKX]UC2\-,EsZr%AKYGn@<*`:+C\bhCC)^U1^Qo"2DW.R#r+%l2[N\J
?!B*B>n%,r3!huaDIm9qCgdXqZ62hPDf091$$9TiC`mY.+EV:.+Dbb1D@&$W1C6f!0f?hP#r4+f
1^RAG?!B*C>n%,r3=/2iAStpi$-ok"6Z7!gBaJfoB4uB0GA1r-+E(j7FD,5.Eaa-&D@&$V2@3;)
0fQtR#r4+m0F:rC?!B*D>n%,s0F:$TEclU5cET)H6ZR<ZBlaSjDeX*#A0>K)Df$U`@<lF)+DtV)
AI1(M1^R)'2D`4S#r+%h0F:rC?!B*E>n%,s0aU?Y@rc^:$-ok"6ZR<ZBlaSjDeX*#A0>K)Df$U`
@<lF)+DtV)AI1(M1'pl%2)iCV#r+%j1C78F?!B*F>n%,s1'p6_BlA*,$-oq$<H<.hAKX]UC2\-,
EsZ8mDffZ(EZet4Ebuq;AfsHLE+Nj%@0nYH2[N5%2)`=U#r+%k2@3SI?!B->>n%,s1C7!!Bk(QX
cESKmBl[j#DJ=.uFD,5.ARTU%De:,%DfT_%0f:rt;]meL_QX>$/hf*g><#nm1bi8F$8XLF6#:=F
Bk.Oq[ie[kF(&W&9jqdTEbTS$Ch7$cATAo3Afu2/AKYMlF_>B0ATDi7De:,6BOr;qBk;;k0f:`n
:*;AR_QX>$/iY]p><#nm1br>G$8XOG87?%;EXC$s+@B^XFCB<4BaJTeB-;,)+EV:.+Ceu#FCB<4
#r+7s#u_s)0Z(%#0J57;$!TAp>;S-A%14mL#u+uKCLqC*$-p%'6Y1.W@<HU)$$0cuF_kT"EZf:4
+EV:.+Ceu#FCB<4#r+7s#u_s&2Su[)1+k7=$!TAp>;S0B%14mN#uYJMBl"nbASuTuF`MVG$-oe1
+@B^XFCB<4BaJBiDfd+?Afu2/AKYJoDKK<0EX=HW0F:Z#2DN(Q$0$c(0J5%6$!TAp>;S3C%14mM
#siTAFEMVHEs^-s+@:!bFD5e&FD,5.@V&tg-Z^DCF^]<$#r+7p#u2Tt3Pr!,ieWaO/hf*g><#nm
1cAVK$8X[K>'4:cDImWsASuX"BaN(i+A?KYEa`McF)Q2CBOu4%+Cf4rG9A;PAfu2/AKZ&(DfTf2
Df.!10f(cq;]meQ_QX>&/i#Bm><#nm1cJ\L$8aFC95e<R@:BPgZ63.fF(&W&9keK`EbTS$F(fK4
FCf?$A0>K&Ebuq;Afr:8DfTr5+EMX5EZuVSDIIBnA0?)0ASrW)F<Gd9F!,R<@<=%C@ppu40f:X=
+@8F<idd485suhO0JFq.#r+4p#u2U%1r?I'1+k7?$!TAp>;S<F%14pH#siBHBOt[`@0t5a+@C'f
Df/u+6>pmU@;KY!$"da[@VfTuDf0,/-u!QAFD,5.@rcL3DCGlH1,fM7+>PmmYR*';1,K;A3*f`F
3F*($1boA'DKK<-ATJ1'YoltTDfTf2BaJfoG%#20De:+d@<-E3-u!QA@rH1%E[_;L0f',7+>Pjl
YR*$:0KBGD3*f`G0O5+p1c#G(FE2)($-odu<,u\]DJ+*.Bco]aF*)G2Ch[qs@rH(!ARloqEc5e;
6=G.NEZf7.D.O#.0K9A;+>u6sYR*$:3ALnF3*f`G0jP4q1c,M;@:Eqd$-p"&:N0u]F^o*!$$0Zf
Df0).GA1r4ATAo3EZek1DK0f1Ec5t)0ebBi;]meQ_QX>%/i5?j><#nm2)8GH$8aUH;eTT^CgdXq
]-($^DfTf2BaJ9f@r#Xd/Tl"TE+*d/+E(j7FD,5.F(9-/E+s6.-Z^DP@;0Na0KD&u;]mkT_QX>$
/iGHk><#nm2)AMI$8aXI;IOWTChR6iF_(m)Yolh]BPDU!BP@cdART*lDe:,6BOr<-ATDa$DKI"2
BOPpuATA)23Aq1=+>G[hYR*';0e`o<3*f`G1gLOt1cG_0Cij*'Bl47&ZQMYV@:O4nBlaSoART*l
De:,6BOr;sEa`U!D@&!W0aUSt2)2tP#r4+g1C78F?!B0D>n%,t3!i5dF`SZkF`VYF@;KY!$-oq$
;dj<QFECr3Bk[lpDfp/8ATDZ2E+*d/+E(j7FD,5.@W-H5-uW]?;dj<QFECr3Bm"JG#r"=q#u_s&
1r?I'0ePF>$!TAp>;\<E%14pP$!(VM@0t5a+A@'$@:]aeBOr;u@;KaoDJ()'@:sCf+E)9CG'.VC
F`M%"0K:cn:*;>Q_QX>#/hf'f><#nm2)eeM$8jLD:3CGiBaN+<+B)]]BlnH*EbT4o@rH7+FCf9)
@<?4%DBNk0+EV:.+D>\0Gp$U2FEnuW7<3*QFX[VN2`:t@+>PjlYR*';0K'5A3*f`G3*ct#2),D'
Cij*"EXC$r+@1!iBl%3h$"e"!Bl7Q+ART4fAKYo3+EhmDFEMV8#r"7n#u2Ts3Pr!,0J5:C$!TAp
>;\EH%14sJ#uG2A@rGjm$-odu:gnNcDJ=.u6Z6[VARloqEc5e;FD,5.7;caSBldr1DIIBn+E(j7
FD,5.@rH7+FCf9)@<?4%D@&!S1^R)'2)iCV#r+%m0aV&D?!B3@>n%,u1C6H\DIm8`cESKZH"V#/
$$9TiC`mY.+EV:.+D>>(#r"4j#u2U"28ZR(0eP4=$!TAp>;e3A%14sL#t8`GAdQbj+AcW^@<6,h
DJsT-+E(j7FD,5.BQ%p4AI1%H1^Qo"0egJK#r4+i0F:rC?!B3B>n%,u2$lQbDII7"$-odu7ri`d
EsZ;rBkM+$+E)./+=M/?+EV:.+EMIDFD,6+DBNP*F(cqB+EV%+CafZE1,oS=+>c$oYR*$:2`(hF
3*f`H1L1Fs2)Yb1Df&p!BOQ%*$-odu:hau\BlbC_F`VYFBl7VkD/XQ=BHV5*+EV:.+EMIDFD,6+
DBNP*F(bk60fB>:+>Y^gYR*$:0fB>B3*f`H1gLOt2)bh9@<--l@L:>b+AcW^@<6,hF(&TiCh4_;
De:+gAS5FmF`Su<0JPBj:*;8K_QX>%/i5Qp><#nm2DnbL$;aMs<*sZ[F(KE(F>>RG67u)1;cI+E
Bldj,ATT&6Df^"CE,ol,ATMp2E\8ID$4R>`D/XQ=E-67F8Oc!576N[S-nlc)+>>5R$;No?+=M8E
F(KE(F=A>HDKKH1Amo1\+EqaEA12LJ3Zp131,CU@0JR;s1,:gG2[W;H/g)_t/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQUAo2WsFDk\uGp"5)67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@
%15is/g+k:F^K6/A79a++AP6U+DtV)ARloT5uf%KFCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uGmt*U
67sBsDdd0tFCB32+<XEG/g+tK@:XF%EbTT+F(KG9F*(i2+Cno&@1<Q=67sBu@<Q""De*:%+<XEG
/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uGmt*U67sC$Bldj,ATT%;
+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-Du$7QDk%15is/g,4PDfp/@F`\`R
:-pQUG&:bN+=A9_+=nlo/9!^5+?jd-4!6^@/2/Fo-o`A21+=>H9gj#9F(KE(F:AQd$=e!aF`MM6
DKI!K@UX=h-OgDmDeX*1ATDl8+=D2DF(KE(F=.M)%16Nc@;[i-AU%]rCgV:/F>>^V$!7L:03AN_
03JTI<'a8-=YEl+#pMZ75u'0`=Y*Z(+pfGZ<'a87-s/$'.3]'a<'a8-=>*f+%14cq0F8sl8QIJu
+UKA]8QIJu+UKA]8QIJu+UKA]8QIJu+UKA]8QIJu+UKA]8QIJu+Unc10aTQ@/MRP`0aTEg2$kun
2$kik2$kik2%9mI#q[k</MRP`0aTEg2$kik2$kun2$kik2%9mE0aTEd#r)`@#rFLG/MT%=#q[kf
2$l)s%14fr0aTQ@0aTZo#rFLG1c5Rr2%9mH#r+CG0F8sl8QIJu+UKh/3A:an#pVi0<\H-M%14fr
0fKCm/hf.B3&39I1-#Xq2[M8m1H%-J2D@$I1C6$!/iGLA2)@6K1^Prj1H%-J2D@$I1C6$!/iGLA
2)@6K1^sdI#r+=E0J5(82$l5K2_Hg?2)$aC1Gh)u3&3*G2`*NS1H%)s2_Hg?2)$aC1Gh)u3&3*G
2`*NS1H%*"$8VuC2$krh1'ofE0ek::0KD-L1,Lor2`NEJ3A<-F2`3At0ek::0KD-L1,Lor2`NEJ
3A<-F2`3B#$8`&D1^Pig1,q-M0f1XF2@2/l2$kup/ibaG1H@<Q#ra[n0Jt[F0JkKj0f:RD1c7'L
2)tt%1bLI>1c@$E0b"II#r+4B0J5.@1c@'G1H75u1+kHk1,1C81H.0G0ebBi2E3<L2DR*K3&ro(
1,1C81H.0G0ebBi2E3<L2DR*K3&ro,$8r2F1'oWe2$l#E1,^aB2Dm0G0ekWo2DZsB1Gh*K3&iZ"
1,^aB2Dm0G0ekWo2DZsB1Gh*K3&iZ&$9&8G0aTNd2D[6I2D[6I2@2)j2)d6H1,q-M0aTWk/i5LA
0f_!E3=.Q%/i>CD3&!9M0aTWk/i5LA0f_!E3=.Q%/i>CD3&!9M0b"IL#r++?0J5<k0eP4=#r=On
2DmKS0K:gF#rOFi1Ggd?3AEHM#r=On2DmKS0K:gF#rOFi1Ggd?3AEHM%15*%3=.DH0aTZo#rFLG
1c5Rr2%9mI0F9]F0eP4=#r!tk#rOFi1Ggd?3AEHM#r=On2DmKS0K:gF#rOFi1Ggd?3AEHM#r=On
2DmKS0K:gF%14gE#r`/F/i>RB1bq$J2_bUm/iGLD1H%$I1H#Os2_HsC3&iTN2_bUp1+kCB0ek[D
1-#Xu2_HsC3&iTN2_bUp1+kCB0ek[D1-#dN0es%n#r2f@/i<qn1G1L?1c[BP3&1dq2D-jF2)$mB
0fTIt1G1L?1c[BP3&1dq2D-jF2)$mB0fTUL0f'+n#r4+k#r!tf3&ENJ2)@3L#rXaq3ArWL3&ioW
#r44f0JbXF0ek@<#rXaq3ArWL3&ioW#r44f0JbXF0ek@<%14gH#rDrE/i<qh/i#CD2_d-E3&V(%
1bLI>1c@$E0aTQl/ibaG1H@<Q#ra[n0Jt[F0JkKj0f:RD1c7'L2)u*Q0f97n#rN#C/i!_l3%d*L
0JGCD2)>On0eP793B8lN1cG_"3%d*L0JGCD2)>On0eP793B8lN1cGjN0fB=n#ri5F/ho+=#rj[m
3&`ZS3&<HM#raIk1,Ua?2D[0M#rj[m3&`ZS3&<HM#raIk1,Ua?2D[0M%14gK#r)`@2[M/j0JtgL
1,CdC3=.Z'/iGLA2)@6K1^Prj1H%-J2D@$I1C6$!/iGLA2)@6K1^Prj1H%-J2D@$I1CX[G3!h8F
,=G+(0/+OU0F8sl8QIJu+UKh/3A:an%14cq/M]'f0F8sl8QIJu+UKh//NGKk0fUin,=G+(0/+OY
$8!t=/M]$e0J5%92`<BN0Jk`q1,0(j/iPOD1GLRD3A_$o3AN3G1,^pC0KD-"/MT1C/i#@A2E3]'
3&`HF2`!?O3A</s$8"">/M]!d0J5'd0e`nk/iPL=2*!HI1H,Ul3AiEJ0ebIF1GL]m/MT1@/i#CH
1b^gJ#rjao1,q9N0K(mK%14[C#q[kl#r!td2)dKT1cI3L#rXCl1G^gC1G^gC#rjOt2_m9H2E!9I
#q\.s/ibjG2DR0K0aTEd2_cp=1,h!J1GfCt0eP.82`!BK1H>mO/Mmbc0fTIn/i#1;1,:U?1,9.m
/i<qi1+kF>3&iTN2_bUj0eb@82)7-N0K1os/MT.B/i5LA0f_!F#radq1cI-D3AN?M%14[E#q[kj
#r!te3A`HF2`<KO#r=1j#r+=j1H7BP1b^^A#q[kc2D-dF3AiWI1C5Wf2DZsD0ebFA3B%7'1G1R?
0JkXI2E)'P/N*ne0fB=l/i,FD#r4+k2E!HO2E!HP#r41e2)R9G1c7$D#q[kd0J54?2D?sF1'oNe
2*!9G1c%-L1cPe"3A*-F1H@<L2`M6R/N3tf0f97k/i5IE2E!HO2E(pt/ho1<3&NWL1c#Fn2(gR;
2E3]Q1cPdn0ekO<0JPIF3AWN!/MT+>/ibmI0ebLC#rXUm3B/fL0K(dD%14[H#q[kg#r!th2_d-E
3&NWL#r+%k2$l#u/iPUD3&iWK#q[kd3A*6I1cRHL1C5Wf2)$X<2)R*C3&_.%0J5+<2)-gF2[p*G
3=.8l1C5`f2E<NK0K1mM1'oZf1c.$G1c.$G1^Prp/iG^I0f:aE1C5Wf1,LUA3AiNK1GoIj0f1a?
1GCXF1c@2t2)R!B0JkaG2Dd?%$8!td#q[ke#r!tk1G^gC1G^gC#r+%f#r=Ro3&!3I2_d!H#q[ke
3A*9F2)R<I0aTEd1b^O:3A`QJ3&q:&0J5(?1c-sI3ACsM/MSsd/MSsd0aTQ@1c5Rk0f(Zn/MT%=
#rFLK$8!tf#q[kc#r+%f#r!tk1G^gC1G^gC#rOCh0f_'I1,q9K#q[kg0J5(?1c-sI3=.8l1-$sH
0Jt^H0eitj3A*9F2)R<I0KBRL/MT$f/NF+l/i5CA1c.$G1c,Lm/iG^F1GCaG3ALmu2(g[=1cR<M
1cG^m0f1a?1GCXF1c@2t/MT";/iG^I0f:aE#r=Cj2E<WL2)@*G%14[A1^P`n#r+%k2$krh2)d6H
1,q-M0aT`l/i#:A0ekXH#q[kh0J5+<2)-gF2[M&j0f^jF1c.0O0f'+k3A*6I1cRHL1CX[C0f97h
2[M5l0f1XF2)d6H1C5`f1c@6M2E!HO2[MB!/ibmI0ebLC1'oNe2)HpG3&<9C2Dkdm0ekO<0JPIF
3AWN!1,U[<0fD!O1Gh'#$8!tj#q\%A1+kIC2E!HO2E!K#0J5.?2$l0$/i5C@3AiWP3!h/k2*!9G
1c%-L1cPdn0ek@72)R9G1c7#p1,(=<2)[-F2)6or$8!tk#q\"@1G1Kj0J5+@1bg^D2Dd?!2`!'E
0ebFA3Arf&/MT.>/iGF<1c79P#q[kc2D-dF3AiWI1C5co/i,II2)I!C1CX[C0fTIk1^Puk2$krh
1,:U?1,:U?1'olu/i5LA0f_!E3=.8l2E*6F2_d$I1,B4g0eb@82)7-N0K1os0et@=1,q6I2`EH#
$8!tm#q[q>2D-dA1G^gC1G^fn0J5(;2`NfS2`!B!3&*$>1,h!J1G_#t/MT1=/hf%>1H.*H#q\.s
/ibjG2DR0K0aTfl3B&]O1,_$F2%9mE1,'"d1'oZh#r!td#rjao1,q9N0K(mK#q[kj1bLOC3A`EJ
3=.8t2(ggB0JtjH0f01o/iPL=2*!HI1H,aM/M]$e/MRPe0aTNd0Jk^H0f^pE3!hQ'/i#@A2E3]N
0aTEd2`E?E2`!?O3=.8t1+kL@2D['A3B7C$/iPOD1GLRD3A_0P/M]'f0F8sl8QIJu+UKh/,=G+(
0/+OU0fUin/NGKk0F\@C#q[kk#quZ16qLE40Hg`V#q\.k#r+Cn#pVi0<\H-M%14fr/MT0j/MJe2
2)mQN1GppJ#q[kj#q[qc1H%-J2D@$I1C5Wm2D-mD1GpsK1GfCm2`<9H1G^mE3AUsn3&WBI1G^mE
3AWK$$8Mo>0fB=i0J5(82$kio#q\(g0etU?0fCgE3=.8s1+kOF1c[NO2Dkdq2_m!F2`*NS1H,Ul
3&3*G2`*NS1H%*"$8Vu?0f97h0J5*e/N!hd0ek::0KD-L1,Lor/N5XA2E<HF2E*KL#r+=t/iG^D
0K(jI#q\(q/iG^D0K(jI1CX[J#q[kg#q[h`1,q-M0f1XF2@1rk/i<qe0f:RD1c7'L2)tsp2`*-@
2)I3F1bf:k2Dd$?2)I3F1bf:g2`*-@2)I3F1bfFH2$kih1C5We/i,ID2DI'F3&M!o1+kHk/M]%5
0JbXF0ek@<#q\%p/ibgF1cRHT2[M2r3%d3L1,LsN#q\%p/ibgF1cRHT2[p*P#q[ke#q[h`2$kii
#q[nj/i>OE0JtR>3!h/p1G1L?1c[BP3&1dp2)?jA1Gh*K3&h3r2DZsB1Gh*K3&iZ&$9&8C0eitd
0J57>2D[6I2D[5t/MSk82_d-E3&NWL#q[qg/i5LA0f_!E3=.8p2_HsC3&iTN2_bUn1cI$E1,q6I
2`D$p2)d-F1,q6I2`EH#$9/>D0e`nc0J5<k/MSk52$kij3%d*H3B/]P1,T@i2)-^>1b^XE0fLrr
0f1U;1Ggd?3AEH!/N#781Ggd?3AEHM%15*%/NF+h0aTEd#q[tk#q[tk#r+4n#q[tk%14gD#q\+C
/MSk52$kig/iX.h2)-^>1b^XE0fLrr/Mf@=2DmKS0K:gF#r+1p/iGRI3&!<J#q[qm/iGRI3&!<I
2%9mI0aTEj#q[ka2)d6H1,q-M0aTEc/iGLD1H%$I1H#Ok2)d-F1,q6I2`EGt/Mf.71cI-D3AN?M
#r+1j/i5LA0f_!F#q[qg/i5LA0f_!E3=Q<M1'oNj#q[n=/MJe7#q\%k/i5@@3A`]T1'oNf2D-jF
2)$mB0fTIo0fCXA2Dm0G0es%e1,^aB2Dm0G0ekWs$8F=C/N!hd1+kHk/MJe53&ENJ2)@3L#q\%p
/ibgF1cRHT2[M&k0eP.92`3<E0Ja"i0ek:71H.0G0aTEe0eP.92`3<E0Ja.F0f01g1^P`i/i<qe
0J5+?2)d6H1,q/u/N5L=0Jt[F0JkKj/MT+83A`TL3Aif'0ebI;3A`TL3Aif'/MT+83A`TL3Aif+
$8FCE/Md\b2$kig/i!_b2`NEJ3A<-F2`3At/MSt41GCgL1GUdG#r++g/i,1A3AWEJ#q[kd/i,1A
3AWEI2[p*K2@1rj#q\+C/MJe31,T@i3&3*G2`*NS1H%)s/N5::1,Ua?2D[0M#rsps0etU?0fCgF
#q\(g0etU?0fCgE3=Q<M2[M&j#q[kj#q[h`0JtgL1,CdC3=.8s2D-mD1GpsK1GfCi1G1IA2Dd<G
2E!>t3AW9D2E!BM0K(fq/Mf"82E!BM0K(gF%14gL#quZ16qLE40Hg`V#pVi0<\H-M#quZG0F9EB
$8;c@3!h8F,=G+(0/+OU0F9`n#quZ16qLE40Hgl4/MRPd2[M&i/hf.B3&39I1-#Xm0fKCj1G1IA
2Dd<G2E!>t3AW9D2E!BM0K(fq/Mf"82E!BM0K(gF#q\+p/iGLA2)@6K1^sdD1'oZn#q[h`0etTm
/N=%g2_Hg?2)$aC1Gh)u3B&QF1,Ua?2D[2s/N5::1,Ua?2D[0M#q\+l/iYdH3B/fQ2%9mE1C5cn
#q[h`1'oNi#q[kd/i,1A3AWEI2[M2m0eP793B8lN2$kih0eP793B8lN1cG^m2`NEJ3A<-F2`3B#
$8"(@0f01g0J5+?2)d6H1,q/u/Mf":#q[kh/ibaG1H@<Q#r++k/ibaG1H@<Q#q[kh/ibaG1H@<Q
#q\(m/hf.>2D?sB%14[E#r+4B/MJe53&ENJ2)@3L#q[nb2@1rj0eP.92`3<E0Ja"i0ek:71H.0G
0aTEe0eP.92`3<E0Ja"e2E3<L2DR*K3&ro,$8".B0es%e0J53h/M[Va1,^aB2Dm0G0ekWo0ekR=
2)[<G2)-im/M]4:2)[<G2)-gF#q\%k/i5@@3A`]T1(=RB2[M2n#q[h`2D[6I2D[6I2@1ri/i>RB
1bq$J2_bUj1GUR>2_d$I1,:ir0etL:1cI-D3ANAs/Mf.71cI-D3AN?M#q\"n/i>CD3&!9M0b"IA
3!h;n#q[h`3!h/k/i#9j/Mf@=2DmKS0K:gF#r+1p/iGRI3&!<J#q[qm/iGRI3&!<I2$kil0eP7=
0JPRB2`2$O/NF+t#q[k</MRP`1c5Ro1GoIj1c5Rk1c5^L/MSpc3!h/k/i#9j/MJe:#q\"h/i,=<
0f^sI2$kuo0eP7=0JPRB2[M&n0eP7=0JPRB2`1mn1H7!F2*!WM3&3?#$8!te#r`/B0eP=B0f1XF
2)d5r/MJe81H%$I1H%$I#q\"n/i>CD3&!9M0aTQk2_HsC3&iTN2[M&n2_HsC3&iTN2_bUj1GUR>
2_d$I1,:j!$8!tf#rW)A1'oNd/i<qe2DZsB1Gh*K3&iZ"0f:a>1c$sK1cRH$/N,C;1c$sK1cRHM
#q[nj/i>OE0JtR>3"63H0f'+n#q[nb2@1rh/i,ID2DI'F3&M!o2E3<L2DR*K3&ro(0f:pC3ArWL
3&q9s2E3<L2DR*K3&ro(/M]%50JbXF0ek@<%14[A1^PuF/Mf":#q[h`1,q-M0f1XF2@1ro1bLI>
1c@$E0aTQm1bLI>1c@$E0aTEj1bLI>1c@$E0aTEd2(gmG2)@6M3=Q<I0f97n#q\"@/MJe4#q\(q
/iG^D0K(jI1C5co3%d*L0JGCD2$kin3%d*L0JGCD2)>Oj0ek::0KD-L1,Lp!$8!tj#r2f=3!h/j
/ho+=#q\+l/iYdH3B/fQ2$kur1+kOF1c[NO2[M&q1+kOF1c[NO2Dkdm2_Hg?2)$aC1Gh*$$8!tk
#r)`<0fKCj0J5%:3&iZL2)7/u/N>X@2D[-H1H@6J#r+@s/iGLA2)@6K#q\+p/iGLA2)@6K1^P`i
/i,CD1c@$G2DYdL/MT3k0F8sl8QIJu+UKh/,=G+(0/+OU0fUin/NGKk0F\A'@<Gpp@;TRd?ZU<t
EcYSC0JYCjFEhm_2=J/l8O6?`:18!N/4=&jBkM<lFD5Z2/4`?//4*cjATD-Q@;TR,:2MO`6rRGb
/66UrB.QqH?V3(-0JG%GARf(>1,(C9/5L;#B5)67;f?f!@q@2_6nC]DDKBnN7<EflDes?)H!a<b
FCbmg6"4nRCisi;D_,!d/N#(]:G"FT?Q`$fDCf-G?S!oe/ho.50ekR=2_d3J0K(I<3A*!G1c73I
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCe/$ARfBr;Isfi@Vfag+E2@>E,Tf+CcaplF)Pl;FDc">
BlbD*+D,=tFD5Z2@;I''Bl[WlF_ku=F!,OH@WQX"DI[6#Bl5&8BOr<-@qdN,Bcq;3G%GJ4<,Zrt
TlP$Z+DtU1@:F:rCisi;D]gH-BOr;U@:OCtEd8d>DfQtBBOr;P@WQI(F`_1D+C]U=Bl7O!F_,H4
Bjkg#6[E<RBHVM>Blmp,+A6-`AS`L-N+$[:CG$&'6"=>?@<*ni;BRqZ2_6[>3&EQFcF>SO7<3)n
5qF]F2)mBD1b^XD/2Ah;3%QmC/i>OE1GLU8/Mo.61GCXD2_lp8/C(a[/4FSn/.DqP@q]FoDIIQ:
85^Qe2_lpC2)mQHcESK\EbR'j/1iD,/i5F:1,LU?1,q-H1Ft+82_HjA2E*KL/4";b@VK='/C(LO
7<3)n<+ohcDIIBn+Eq78+E):7B5)6lCi"A>6#pCCBk'1HfV7$$fWcROVqHaVL=q@7Yoq3'`.?mY
Q>(@^@;[Z7@;'[(-ms%LG%G\AF!,%3A1&fY%15C2BPDKt/4`Y]1,1d?1H7-E/C(^I6Xb$e5qF]D
1c[9@2)d?P/2Jn82CpR</i#@D1,1R92)d-I0f:[F2_6L2cF5>l@<3tDAnc:,F<G"2E,96"A0>u4
+O7G=6Xb%WBl@s%BjkQqBl5&8BOr;bCLM$s@<?'':i']aD]h>fCghB-De:,6BOr;WARTanDK?q>
F^f0$F(f,q+DG^90f_*F/0JDEF<G:=+Du+>+DYk5GA\OBEbTH4+EVNEFD,*)/g:`36"=qD@Ot&J
+>l/=1b:RF3&30=cE]/I;e'_s6")<!2D@!F/MT7B3%Qg;2)[!@1bgU=2*!HH0J"e13A*9F2)I0H
/4";b@VK='/C(OU/5p%s/0]1LAKZ)8@:X(oBl@ltC`mV(D.Oi.Afu2/AK]:(+B)cgEc>`,+EMgL
FCf;3BOPs)@V'+g+ED%2A7]dmA0=0REa`E"@;]Tu7;QCJEa`E.+Co&(Bm+&u+=M&?CLnVS@rc!e
.3N5CDf$U_Ea`Ek@lbabVqHaU\_2SeZ.Put@;IO<^L;,&@:C?--Zj$5+EM%2Ec>`2DC6kc+q4lF
@rc^:/4`Y]1cI3E/2f1@0fU`0YolDSFY#ge/28n82E!-F1GC^<0eP7</29+B/iGOH2)[6A/N,C;
0KD-I3AW3PD.Ra%@ps7hF)<HZcESofEcioW@3BE*A7]e!+Cf>-FE1f"FD5Z2+E(j7FD,5.6=G.N
EZen(F(o9)@<?4%DCco?DeX*#A0>T(+EV:.+>GluBHUerDKL#AGq:(IF`\aMBPCsi+D#G4ATD?m
+DG_8D]iP.D/F3/+E_a:+E).6Gp$RA+EV:.+Dkh'/M]#%BHUerDKL#AGp"Lt+O7576ZR<ZBlb^I
%15C2F^ep"F"Bj[+>Yl61+Y7=0K(g?cESKZDIY4`@4X)l2)mHD0ekO?/2St72CpR=1bL[A0fLpC
/28k33&NWQ3&`BSEa`Ek@k91VYq/7[@k:SmAKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(Q
fnA"`fVmH#fnS1:+CTRJH?E]8JSrB!+=JUZBOr;rCghO/-RgYW$:/39@:j(k@4XrI+>bc.0e>19
1G^m>cF+ihAT'+c@4X,e0fCs@1,C[C/2Jn81Ft7<1bLLA1,UsK/2B"61bgpF0et:GEa`Ek@k91V
[Ob*`D_*(uCiaM;@ps1iARloLCh.3fAn?!k/g+,,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b
@:Eq\3[!(QfnA"dfn%h6fWj).+CX6=N@j,!NF?G;X)_Vk-ms+MAKYH&@;06p-uX,K@s)g./0JkO
+EMXF@;]U)-QlW3Afu2/AKYf'Df-qD+DkP)AR-`;+q4lFA8#Cl@4XrI+>Pi03%QjA2)dNHcF"c^
9joS=/2/t>3&W?D3&NZH0eP=;/28h8/iGRF1c7'?/M]:<3B&]I3&W<REa`Ek@k91V[4F[>@4WU%
BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbab\_+.=VqA9-M'0sU@H"_W`.;sHTcba2
G%ku0Bl7u>.4u`7DBO%7AKX?KCh7Kp@<-()D'3b/+@0fd6"=SL@<6-*6#7Z<DfoK(CLqT=+DGp?
BlbD-ATMQuDIIWuA0BO"fne=7+P<UFK\3ifYh5l+Z.Y!Wb._;.GA1k9@;IO<^L?*2O2QTiBmFtT
+EVX4DKBW&FCeu*Bl8$2+A?3cBl5&%F!+;"Bl.9$<bZSeBl8'1+=JULBl\9:+EhI>B5)62.4ueR
$:/39Bl#=k;BRbU0J#+=0ek6)^*#^ZA1T;`/M&_23&`BD0J54B2)%!D/2T4:2)7-M2`N?SEa`Ek
@k91V^+;QfA1Sp(BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@-hEa`Ek@lbabVqHaUYh=oeKHO^^\;r6#
\;t'DC`k-JBOr<.Ea`["/0JbCF=n[`FD,5.FCAm"-RgYl%15C8DCe=V+>G],3@lp>3&ioLcF"co
@<F+e@50;e1bq$K.ks%=0e>+52)?dA2_HgB1bgmE/29.;0fUjD1Gp^LEa`Ek@k91V[4G9cFY$L*
AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(cfo"I;+NhH-H#=`Q-Y7R7-Rg0HDIal6
@<3Q3AThd!G@b;-@;]Tu@:X:qFCeu*@X0)<BOr;fDfTW-DJ((^Ec6)>+E)-?;flGg+AQ?^ATKI5
$:/BD@;KsmD.tOl;BRnQ0fCRC1,h*G/C(p`+B)on/3tgA3&NNJ/M](<2(UR:3&W<C3&<0E1bpmA
1b:461+kLB1cR<G/4";b@VK='/C(p`/5p2%/4OYuD'2,b@:Eq\3[!(cfo"I;+P<UFK\3Q^VqHdW
MBL'V@<l`5@<*r?`.;dDWurf<AU.i0De:,6BOr;pEarcoE[N:F$:/K:A7f7j/4`Y]2_mBQ/3,OD
3&)u0[ie@iE\'Lb/29.>1H6m@3A<HE1bLU@/2B1E/i5@E2)?s<1H@'B1c79P0J#M1@:Eq\/1f)U
/51>0/0\&,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(QfnA"QfXTUcfWcQ-Cb<fD
FlBoqAp&,:-ms+MAKZ)'Ci=34-QlW3Afu2/AKZ&<Df9T/DJ()'@:sCf>q%<IF(f!&ARlp-Bln#2
cFb8nH#d>)+=KNl@<?0p@<*eL+q4lFCghC!@4Xr;+>Gc62`*ED3A<-@1b;uV;e9u#?S!ok1,1a?
0ekOC/2o1A2(ULA2(g^C2`*9L/1iS2/ib[B2E3HC1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p,#/0[H,
E,oZ2F<GOCDfBW9@;J"J6#9tNBji,uF!,R<AKYT!EcZ=FBPDO0DfTQ%@;Kb*+ED%'DfTB"A0>bu
D.Oi.AfsHdE,p)B/0JJ3FD5W*+C\bhCER_;+Dkh'/S8^/FCf$$FD)e,ASuU4Ed8co6S9Pl$:/K;
@;KI_BIl\P+?)&61b:XD0f1U9c[[-:B6#Oh/29.=3B/TG0eb=51+kOG/2B1D/i5C=3B&ZD/M]%5
0JYFB0f:LJEa`Ek@k91WJ1OW3E\&D6BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbab
VqHaUW7cjVYLofs@;IN)@;KI_+=JUZDg-(H.4u`7DBO%7AKX?KCh7Kp@<-()D'3b/+@0fd6"=SL
@<6-*6#7Z<DfoK(CLqT=+DGp?BlbD-ATMQuDIIWuA0BQ[fo"Fe+P<UFK\36VK\3K\W??(eH$O+E
+CT(<@UX(`@;%27FE1f-F)59,ARlotDKKe>9OW$WDBNA/+A?ofBk1Wp:N18eA8*/7-Xq+1B4uBu
F*&OCAfu2/AKZ)5GA\cW+q4lFCgpghBe2eQ+?);<0J"q41,^jH/C(XG6#gor/M&J)1G1UG/2K"8
/ibXG3ArlK/NGF?3Ai`S2(V%6@:Eq\/1f)S/4"8r/6$:o+DtV)AKY].+E):7B5)6lCi"A>Ao_g,
+@1$V@VK=5+P<UFK\36UVqHaU\KG<s/RlYLCh_&,+=JUZBOr<-G@><(Dg,c5-RgYW$:/K;Bl[d'
/4`Y]2`*6J/3,RJ1cHu2Z8!IhH"SZo@4X,n1GCa<1,h'M/2Jn42(ULC1+kIE0JbR@/2B.:3AifT
3AN-:/C(OU/44\q/6$:o+EMIDEarZ'De:,6BOr<(@;TQu6#:"EEb0/3BlbD7Dfd+5DKKT5AScW7
@r,^bE\7e.6#:%EBjtL%85^Qe2DR'>2*!BO3@rI\+@C0m/1iD)/2St51+Y.>1+k:81Ggd@/1iV6
/iPOF3&`]G6#pCCBk&\FcESofEcruX7WNEa+@1$V@VK=5+P<UFK\3H[W7\$#Tcdc[/`F:,Bk##3
b.\uH-Zip;F=/Li+A$GnFD,5.6XaeBDId0rBm"88De:+XC`l#RBQIU'Bco]X+AHcs@;BXiF=\PK
F<G:=+Co&)BkM<lFCeu*fVdDUfnJ+6fWNl3+P<UFK\3lgZ.Pu,W$#Mb/T"p6iOY=`EZee,/]=?*
El<N</0K%T@;^.&@<?'k+DG_8D]h_^FD5V8@<3PhDf^#@F_r6gDfU#8+=JUHART?sDe:,6BOr;r
Ec6.L.4ueR$:/K<DfRC";BRhN2DQgA2)I6N/3#=+<D?mQ6X_N#1GUaH.lB.@2CpX:3B8WG0JP19
0K(aA1FtC?/ibmM3AiWE6#pCCBk&\F3%um`9joSBEc5e;6#pCCBk'1HfVdDUfWNn`fVdB,+CT*G
J<Ag%Q=4u]`.;qO-ms+MAKYSnBl8#8Df0,6.4u&:6#:%VDf0,;85^Qb0fCm?0fM$F1+^_[+B2cl
/3tg@1Gh$J.l&q82CpU93&N6E2D-sJ0ekO@/2B%70ebI>1H$d8/C(^U<+0o#9kA0NATAo3Afu2/
AKXfcASGR`ATJu4E+No0F*(i2+Cf51F*(u6+=Kr@2(:.#6#:%VDf0,/-p_`\Bk;1(+@gH`ASX=L
iOjul]?\"6L!P_'^!=)06#:=ZDf3LW.3NhCF!,C=AKYo'+EV:.+AclcBjkO`F!,O<F*(u6F!,17
+@gH`ASWE*H$!_<Ci<s3/e&.RCh.*d@<,do/4`Y]0f1aH/2Aq:1,1?*Yom"SFY#*q0JkRC3@cgB
1GLF7/iYd@2E3<L3&!'F1Ft7=/i>=C1GCR86#pCCBk&\FcESp"@<F,#BOr<(@;TQuG@>P8DfTQ)
Bl7?qCj@-hEa`Ek@lbabVqHaUYLof+Z.Pu-L*0o8/S&:!@<0;;DBL>TFD,5.AoDL%Dg,c5-QlW3
Afu2/AKXfcASGR`ATM-+%15C;A7]diD/!l=85^Qi0fCd<0ebI>3B8Y9YolDFE%ERl1,1LC2Cg[@
1Gp^=/i5F:1GLmB2Dd6M3&N6F1+kFD2)R<L/4";b@VK='/C(LO6Y13f7WNEa+@1$V@VK=5+P<UF
K\3N]Z.Pu,\KKP&fnA%9fnJ+:fnLVXiOFq#iOFq_El<OO^E?s$/U:cA`2dbu-ms+MAKZ#-B4uB0
@<-34+Brbr+@B^ZBOu=->q%B8$:/K=BOPde@Ot&J+?2/71Ft773&!<L/C(RE7ri`'/M&J)1G1@8
/2K%@/i5OC0f_!?/Mf=<1H%'L2)QpNEa`Ek@k91VZReUeFY$L*AKYl!D.Oi6@<3Q0EbT0#DII?t
Gp(b;fnA"^fnS.X+CX6=O"K>#O'up7@N['HFD,5.FCAm"-QlW3Afu2/AKYK$DKBo2Ci!O%Bl@l3
De:,6BOr;bDfp/8ATDZ27VQpW>q%B8$:/K=BPCpaBIl\P+>u#92CpgD3&riIcF+i`Ea^Lb/29(;
3&iEH2)I*?1G1C@/2B(A/ho@E2Dm0>2Dm*G0f1dJ1b:q5@:Eq\/1f)T/4=Me/4OYuD'2,b@:Eq\
3[!(QfnA"dfVmH#fXW,5iOFk!iOFk]@`3i?^E=pPFD,5.BR+0,@<3eF/e&.RCh.[)Anc-685^Qh
3&NHB0eb==1,1?*[3.kKCb..h/M&_20Jb790K:[@0JbI=2CpR;/i,1;1,^j<6#pCCBk&\FcF#2k
AS`nrBQ%p5ASu4"B-;,)+@1$V@VK=5+P<pOL=iFIfVdDUfWWt]fn%h6fnLX.\;t'9@:C?fA1_>7
ChCVdDBL>TFCAm"+E(j7FD,5.A8c:'BPD?3.4u&:6#:.IEbd3s;BRqS1H6p?0K(U@1+^_V+@B^Z
/4!\q1,1OD2_-g@1GgX=/i#461GU^<0fCjK3&`BI0J54@0K1^D/4";b@VK='/C(OP6Y13f,"?Tk
D'2,b@:Eq\3[!(QfnA%0fWj+]+CT(<Anc:*+=JUZBOr;uCi<g!-RgYj:18!N+D5D3ASrW"Gp$+'
F_>A16=jdPFDi:DBOr;pF*(u6Ble,6@rH7+BleB1DJ()1Ag#C(/0N6D+CT.u+O7G=6Y14MASEb@
%15C;B4YUf/4`Y]2`ETN/28h40K(a=cET,I6Y13f/M&Y20fUm>0etO@/2Jn93%Qj>1bLX?1Gq'K
/1iS3/i>IB3&NHB6#pCCBk&\FcET,U6Xapb,"?TkD'2,b@:Eq\3[!(QfnA"ZfWWtc+CT(<C11Xu
+=JUZBOr;7D..6l.3ND?A1&fY+@0gcATDZsFD5o0+EVX4A8-."Df0!"+DtV)ATJu&Eb-@ZC`l5^
ARoL++B)i]F`(_u+@g-WA8*/pDIakUChIHnA8*/bARfk#A77)7%15C;B4Ysp@Ot&J+>Z#/0ebLE
/C(RE:h=8j/M&S00f(R80f:[?/2Ah;1Ft=71GCdK2DZm=2(gUC1Gq0L/4";b@VK='/C(RQ:h=8j
7WNEa+@1$V@VK=5+P<UFK\3BYVqHgWW$#Mb/S`4TDJ<Q&-ms+MAKYT$@;]j..4u`/ChI<sBjr3!
F!+n-F)N10DJsW1ATAo2@;TQuAoD]4cESKgATDj'BcnfuBl[foCFLkF$:/K@Bk:a^/4`Y]1b^dG
/2]+=3&<,2ZS<RrAT'+O/28h60JG"33AiKA1+kI>/29"=/ibpJ0f1^<0f^jG1bggH3@mI:@:Eq\
/1f)Q0e?"0D_+@uDf$U_Ea`Ek@lbabVqHaUXOsK)LY/RK@;IN1@:EnY+=JUZBOr;uDfTE&ART*s
+Brbr+EV:.+Dbb1DI"\D%15C;B5_T;85^Qj1H$d=1c73M/C(OD:h=Yu6")K!0JbCB1+P182)d'A
/hf::1cI$@1bpg@2(UR</ibdH2DdBE6#pCCBk&\FcE\utATB=kEc5e;6#pCCBk'1HfVdDUfW<`'
fnS.X+CT(<C;b[@Bjr25-Zj$5+D,FuDJLUK/g*GrB4Ysp@N]B++CT)-D]iJ+DffZ(EZf7.D.Oi%
DfQuGYolkSEcYf++=KruEb8`q.4u&:6#:1PEa`E.85^Qe2`3NF2D@-L2([%[+@C0m/3tgA1,:jM
/MT.>0e>(43A`9A3&`HH2E!6I1Ft+42D-jA2)I*D/4";b@VK='/C(UR6ZR?$<+ohcFE1f#Bln'-
DII?(DIIBn+@0gVDfT8q+DGm>A7]dqG%G2,Ao_g,+@1$V@VK=5+P<UFK\3lgZ.Pu,W$#Mb/]=?*
El<N<+=JUZBOr;rEc6.L.4u&:6#:4GDIG(e;BR_O1,1=90fD!G/C(RE7qHNg6");u2D[9N.krq;
1b:@63AW3H3A*-D2`WcM/29%81H@HN3%umLEa`Ek@k91VZReUXD(J(dEbT].A0>K)Df$U_Ea`Ek
@lbabVqHaVLY7F7\_*l(@;IN/@;a6&@3?sGFD,5.@WGmpA1&L(Df-\>BOr<(ARfKuDe:,6BOr;r
@;TRl>q%B8$:/KBDffYD85^Qe3A<<A2DR9M2D!.]+B;-E/3tgA1,UmB.lB1A3%Qd:2`<3A3AW9F
0K1aI0J#(=/ibdL3&39@/1f)S/6,DQ/0\&,AKZ)8@:X(oBl@ltC`mV(D.OhUCh[g0BHUf'D.Rc2
Ao_g,+EV:.+@1$V@VK<p@;L3tF<G"./SJR0@;I&7+sM,BAKZ&-AS#g.F!,('F<G[6Bl"t;.4ueR
$:/KC@;]Le/4`Y]2`W]T/28h61cRHGcF"c^H"SZo@4X/f1c@*>1G^mJ/2Ah73%Qj?0eP=@1,q*H
/2K(73B&WI2)d';/C(XS6[<;q%15C;CLLpf/4`Y]2).*G/2fFC0JP-([ie[F@4Wu]/M&V/3&N6B
0K(OC3&NEJ2_6dG/i,4<1,_'B/1f)U/6,DQ/.DqPChmHqF`MD>F"Bj[+>l)61FtIB1bg^9cFbkS
6>pcn6")<!2)7!G.l0+>1Ft@81GLF91GLL:1,:aB3%QjE/i,FF0fD$C/1f)Z0e>Y0D_)>)6#:=F
E+j9#BIl\P+>Yl81b:I?1cI-?cFP,u9joS=/20(<1H$a?2_[6C1bLL@/28q</ibUD1H%*A1cI$A
2)[<I2(U:0cFPQ,9joR^$:/KD@<,dc/4`Y]3&rZM/28k:2DR'>c\3K<AS3PG/1iD0/i5=71Gpm>
1GgpK1GLF91G1L<1bg[</1`?uKe-&3B.OK!6#:=JF"Bj[+>bi52_6gB2`*3>cESKZEc`ia/1iD0
/hf790fCj@3A`NM0Jk=40fUd@3B/rW1Ft(.cESofEc`iA$:/KF@:=I585^Qb2D@!>1,CaA2D!.]
+@1-j/1iD,2)$d>.l9%=3@ls=0Jb7=2(g^G1,:RE/2T.83&39G0K1O6/C(XS6$73!%15C;D.-pf
/4`Y]2D?p<3Ar]J/C(RE6#L3a5qF]F0Jb^>1bpg?/2Ah40J#"6/ibjI3&!0?1bp[>1-%9K2(U:0
cEf&fDIb:-$:/KG@;0a585^Qi1bpp>0ebUC2E385YolPWFY#*q1,:OC1+b=@2)m-A/iPR;1G^d=
0JtgF2_Zd71c?sH2D@-M1b:1/cESojEcioB$:/KG@<66985^Qg2`*ED3&ifP2([%Z1*BM.E\&dn
/M&Y03B/QF2_cpA2)6j@2(U=80J51;1bg[</1`?tZSF(1B6#O4$:/KGBl%3p/4`Y]0f^pD/2B+>
0ek6)[3/7cBe1he0JtXE1+b170et:7/iG^@3&E6A2)@$J3@la:/i#+83AENF/1f)S/5L;#/.DqP
Ci3s/@;@Db;BR\S1cR$A2E*BM/C([H:NC/#6");u2)I!G/MJn:2_6[92`*'F2(gUC3ArlS/1iS/
3A`KK2`*':/C([T:NC/#%15C;DJ=B)F=]s\+>to51b:U?0ekF7c\!?=@rEna@50;f2DR!B/M]1>
2CpU93A<!>1c6m@3B&ZL3@la;2(gaH1,h3K/1`?uK.Kr2D_)>)6#:LR@<,m085^Qd2`*KF1c@-M
0J(MS+@pcd/1iD,3ANNO/MK.@0J"q23B8WF1bgUB3AriR2_6O?/iGRH2D?m;/1f)O/4b%p/.DqP
CiF'!@q/pu85^Qf2`WZF2`<EL2_<7Z+@C09+=o)q/M&Y01,:C91G^XA2_d<M0J"t;/iPLA2E<QE
/1f)O/44GE/.DqPCiF'!Eaa'9/4`Y]0f:L?2`E;5Yol>MA1U#T/2/b33&E-@3A<<A1+k7>/2Ah3
3ArlP2CpUD/hf:>1c$j;/1f)O/4"/a/.DqPCiF'!Eb?po;BReP2_6mA3B&M7[ieLg@k9ns0JP@<
2(LC=1,1=9/iYX<1,:IA2_[3M1Ft7</i,=A3&39@/1f)U/5UCt/.DqPCiWs"Blbgr;BRkR2_ZdB
1H$pH/C(mN6ul]e5qF`L0JtX:2)I'J/2]%;2(UL?2D-dA1H7'I/2]7:1cI*B2`N?>/C(mZ6ul]e
%15C;Eb0<%BONG_;BRhW2CpjF3&`D6Yolka@k9ns0JY=;0Inh41c?m@/iYU;1GCF=0ekUG1+Y15
2`<HN1Gp^7/C(LO:ig+t%15C;Ecki"/4`Y]2E!9L/3#OH3&3$:+@L6Y/1iD)/2]%=2(UL@2(gmL
2DmBP/2]493&!'G0f:L5/1iD@Ea^L.$:/KL@:j4)85^Qh1c@*?3ArTG0J(P&+@L6Y/1iD-3AWEI
.lKCE0J#%52E*0B3AW9A3&ruW0J#+B/iGUB0fM!A/1f,"/4=Me/.DqPCia*#@<H?oF=]s\+>Yc3
2(UR=0K1j?1GL"GH#>/b/1iD0/i#:80etU=2_[3M3AN-B1G1CA3&*3D/1`>.0e?"DDCc5(6#:UR
E+is'@4XrI+>Yi62(UR>3AE<@cEn]pAS`n`@4X)l1c.-C2)I-G/28b;3@lm@0eP1>2*!KM/1i_9
/iPID3&*EE/1f)R/66=u/.DqPCia8uBl5Im;BRnV0JY1>3&!-H/C(OD6#g]l5qF`N2)R0?0K([C
/2Jn;0e>(?3%d0G3&<6F/2f+;0K(jJ1Ft(.cE\ueEGR08$:/KLBOQ!685^Qh2`END0eb:;0eb0(
]c][NE%F:+1,(I;2_?a>1c?mA/iP^?1GC[=0fCmK3B/QA0et@?2*!?L3@l^4cFkbr@;mb,$:/KM
@;0a585^Qh2)R<D3B&iQ3@rI\+@1!`/1iD-3AiKM.kiq?1+Y+32`<3B3B&QK3AicO2_6p@3&W`P
1,1=2/C(LO6#g]l7WNEa+@1$V@VK=5+=Pm?fnA%5fX'58.3R9@fnA"efVdB!fWcPI@;[Z7@<6H<
+CX6>XY&MBXi,e5^1hU1-ms+MAKYT$H"h//-QlW)@:sCf>q%B8$:/KM@;0d685^Qh1GLR73A`NN
2D!.\+@L6Y/1iD-3AE9I.lK=C0J#"40K1O<3&iNF1H7<N0J#+@/iGUB2)I$=/1f)R/4=Me/.DqP
Cij6/Ah6JN+>Yr81Ft@@2`39?cFY2mAT'+O/1iD0/i,760f1X<3AW?D0f:L;1+kRF2`WfN/1`?t
].?WeD_)>)6#:[SEa^Li;BR_S1,ga?2*!?I/C(^I6VUu?/M&S71,L^;1-%'K/2Ah72(UI:0eP.8
1H.3G/1iV;/i,1;0ebL:/1f)U/43-?/.DqPCisQ&+@1-kFE1f+Blbgr;BReP2`3-D2)6jA/C(sP
<D?mQ6")<!0ekXC.l/n91+Y771bgO92E<BI1c7*F1Ft=:/i>CE0fCa;/1f)\/6,DQ/.DqPCisQ&
+@:!eARTChF"Bj[+>bl52_6gD1,1d?cFk?#D.+tI/28k63&N3B1GC^<1G1LE/29%C/iGFE2`!BD
1G^X;3A`NG2(U:0cFkc/9joR^$:/KR@4XrI+?)#30e>=?3A`WFcF>SO;e9u#5qF`M2)[3?0JkL>
/2St;1+Y1?1bLI>1c[BQ/2St70JbU@1+Xt-cF>S[;e9u#%15C;H>.D?/4`Y]1,LsI/2K%;2DQi/
^*#pWD(I7i/M&\11Gp^<0JP191,:XC0e>%7/iYjK2*!EC/1f)\/4X8g/.DqPD.-shDeNQ1844RW
1GLmK/2B4C2)$Rg+@Ak3/70r8/3#7B3%R'G/i,LI2*!?A/M]==3&roQ2Dcs?0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL6VUu?,#2ibATDKnDBNn=DfBW9@;J"J6#C%@Bl@Zn+DGm>FD,5.B5_<'De:,6BQ\3'
ATAo-DBMM`@W*B+H$!_<Ci<s3/g*H$+EqC5C`m/-+ED%4Eb0<'DKKT1B-:r3F*),+ALnriD.-sh
DeNQ%BlbD*CiaM;@3B3$A0>f&+Dbt>ALnsCART([+CT.u+E_R9FEoJ_%15C<@;^.#DIIg!/6>,9
:b=I[/6>,9:b=I[/70MeEc`j>/70q_0J5.8/29%?/i,LJ2)dBD/M]+73&WHK2DQg=0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL6ZR9",#DreCh[j-Bl7L'+E2@>E,Tf+Cb?hrD..<);e^,XH!qh0F!,C=AKYo'
+EV:.+EVgG+EVX<DJ=3<+Co%tFD5<-+E(j7FD,5.:hXQZBlJ$*DIk2:+B2c^@;Kjp+DlCGBQ%^*
B6c$N@;]TuBlbD=BOr<*EbTB/Eb&lmC`m8"BlnVCDe:,6BOr<)@qB(d+CT.u+E2@>FCes(DfQt=
Aft]"F(f-*D..<7+q4lFDII'oCiq:15uUT32)6^a5uUT32)6^i+AcW^/70r8/28n41,(781cR*E
3A`]N1FtL<2`<BG2_Zd<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:h=8j<-<4sBldr1E,ol9Df]?'4!6h,
@:X:mFWbC>+EV:.+E2@8D..I1+D>\1ASbdmA0>f&+B3K(CLqc6@;]TuEb/ioEcW@FD]j.8AKYi.
FD,6+Cgh3l+DG^9<-<4sBldr1@s)U0F`M%G%15C=@q]:%85^Qi1c[QI0ek@90Jb9*\0+(WE\&dn
/M&_20fLX>1Gg^>0K:mK2(U=</iPaG1-%'?/1f)V/4"8r/.DqPDJ*O&AStps/4`Y]3&NB@0f(RE
3%WC/1*B#+Be1he0JYL?0J,%70JG%7/iP[>1bp[B2*!QR1b:460eP.61b^XD/1`?uKJG)IEbR'6
$:/QD@<,d-844RT0JYXG2Cp^E3&30=?Q`?C@4Yb:?S",g3&W<B2`E?K1c%'N2Cp^E/iGO?2`!9A
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/5pb(A8-*u+E2@>E,Tf+Cc`b*DJ<O"@3B9*+EV:.+DtV)
AKYo'+CQC6E+*6fF(f9,+DG^9FD,5.AT2?n+E271D'2,^Bjl$j+C]U=;g2e`Bldr1@<H[*DfQsk
@<-C6+AH9bFD5W6Df.0:$:/QF@::]X;BRt[/2An=0eCVT+<XKoALoDa0JG7?1G(F=0fU^>/i575
2D-jG0KCpL/1i\6/i,1>0K:m?/1f)O/5U"k/.DqPDKBB0/4`Y]2`*3G/3,RH2_cl/Yom(iCb..h
0f_!K2_-X?1b^I;/i5C91-%*B0fM!H2`3-A1bL[E1c[6G/1`?tYq/puCb-#&6#LdQEb0;C85^Qg
0f(X;3&!9L1G$hV+B)cg/3tgA2DR9L/M]4>2CpR80K(I;1cI$C2).*G2(U=72D-gB1,(C</1`?t
Yq/g`D_)>)6#pIDCr<Ar/4`/O0f(O@3ArEI1,q*J/70MdDf716/70qe/iYO91,:X<1GgsL2)-X:
3%csB2)I!I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"N^D_*(uDId[+Ea`i.E,ol9Df]?'4!6h0@ps1f
F!,1<+CQC)@;Tq*F!,F5@;@!"DBO%7AKYl/Ecbt;De:+XDId[+Ea^LAGA(Q.AKZ).AKXooDBNn,
F)to6+EV:;Dfo]++CQC+Deru-Bl5&8BOr<'Dfor>@;0U%FE_G/AKYD(H"CE)+CT@7AncL$A0>Dk
FCfMG+A$YtG@>P8F`V,)+CT=6@3BN0Bl.R+Bm+&1F)Pl'EZek#Ch7Kp@<*K!DIal1AS,LoASu!h
+E275DKI"5DfQtABOu-rATD=&+CT.u+D"u%Cj@.;DJ3HfBlmd$FE8RCAfsBWA8cL/@4i`5$:/]B
FEMVHF"Bj[+>kr30J#+B2E*ECcESKYDf70Y/28t92)d$?3AE6>/MJe22(UL;1G1[B2)?p?/29.;
0fUpF0KC[SEb/ft/1f)O/4+8n/0\&,AKXK`AS#X"FCfK0+Q9thc[jBQc\0TYiP289J^2$VJfnoA
@;^-/+sL!"AKXKc@<,m&,!-o]F<Gd9F!,UHARloqDfQtBBPDN1F*(i2+C]U=@;Ka&@;]RhASuT4
@<6O2Df0K1ATDi7-q//bFDl5BBOu'mF"AG)BlJ$"Eard*F"AG1FDku,D0[QQ@;]TuBlbD9Df]u6
@Vg<4@;[2VB6eH<Bjkm%Eb0*%DJ=0%ASu!h+C\nl@<HX&+DGp?AoD^,ARlp&@<-H4De:,6BOr;T
B6eH<Bjkm%@rH7+FCf9)@<?4%DBNk0+EV:.+@p3cE,QjhDe*BiF)rIJBQ##+F^]<$ARlp*BOr;r
Df0W<ASc0kFD5Z2+E(j7FD,5.6?R*\-Z^D(AS3,6DfQseF_kkAF!+FqBkM*.+EM+*DBNY2+B;-E
/g+Y9/g*\rF(oQ'/0J#4Ebf_=@;]Tu6t(@^+>l&8+q4lFEbf)m+AcutFCfK,DfRC";BRnS1c$[C
2)70K/C(OV+B)on/1iD)/2St72_6^E0J5==1cI6F/1i\8/iPdN2`E`J/1f)P1+Z@:E\%Y,6#paL
@N\KfBlA#C85^Qh1G^s@3AiQK0eCVU0d'D-E\&dn0f_!E2D$aB1,pg@/ibg@1-%$@2DmKP2)-X6
1c-gA2)mTR3@l^4cE]/U;eL,%%15CADIm9.85^Qb3&WWF1,V'O2([%X+A??c/3tg@2)@!H/MT1@
3@lp<2)m-H1G1CA1,UsK/1iS8/iYUA1,q9F/1f)O/50Vo/.DqPF(8ctCgekc;BRnQ3A`9I1GpjE
/C([H;eL,%5qF`N0JYO<1-%3J/2Ah90J"t=2(gdE1GCXA/1iV;/iYgE0K(^<9OW$WDCd?a[Ob?i
E\&DCF(8ctCgeG7+sLH9D/a32+sJHg+B*3$EarZA+@0g\@:s.mF<E:q0f:-a$:/`ECi"68+@1-k
FE1f+Blbgr;BRbP2DHa>1-%'D/C(UF6Z-Bb6");u3&EHN.ks";3@ls=3A`9A1GLL:2_d'E3%QdD
/ho4?1GCg?/1f)R/44;b/.DqPF(K0(F`SZlDfTDtCh[rA85^Qd1c.3D1bq$E2D!.[+@C$V/4!\q
0K:mF1Fk481,pgA/iGU=0f(L93&33F1bpU;0eP:@3&NBE/1`?tZReI]@k8&r6$$^UATMNn/4`Y]
1Gh'H/2T.;0KC]0[3/"c@4X\q0K:mI3%H[@1,UU=/i5R>0f(O:2E<QP3A`9F/i5:B3&!?D/1f)S
/4b%p/.DqPF)Yi(Ble'$/4`Y]1H%6R/2T4A2)[#2\KF7JE\&dn/M&Y01,1=71H@'C2_m6G3@la>
3A*'G2)6sC/1`?t\L^*VE\%Y,6$%-ZEc5o./4`Y]0ekO?/29(@2`WEE0d'G(FY#g00JbOC3@cjA
1G^R>/iP[>2)['D2`<ZU2_6^@/i>LC2)-j;/1`P2/6$&#/.DqPFCAs'Ea``l/6>,9:b=R^/6>,9
:b=R^/70Me9joS[/2/t=1c6j@1,Ug<0et@>3@lm=0eP182)$d@/1iY5/iY^J1H70A1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/43-?/6$P#Des!+AKYr4DfBW9@;J"J6$-ONDfT9%@3BDu@;^-/FD,5.@q]:b
DBNk0+EV:.+@1*X@rHBr3ZrNXAKYetEbAs)F<GF=F`);0Bl5&6@;]^h+DG^9<,ZDf/e&.RFD,5p
H#@1E85^Qg0f(R93&!-E0eCVZ+@L6Y/3tgA2DR*C.lK+<0e>(42`!!?1c6mG3B&oT3%QsB/i>@?
1,1U:/1f)U/4=Me/.DqPFD5MA85^Qb0f(O80fLpG3%W@i+AcWi/3tg@1GgpE.l/q82_6a;3&E0D
2D-[B3B&]I/2K%61,q6K1b^I3/C)!]:h=Yu%15CCCghB985^Qb0fM'C0fM'K2_6^C+B2cl/4!]!
/2/k:3AN*?1b^^:1G1R@/2]@=1-%$G3B&KE1bLI>1GggD/1`>-2_7p:FY!t/6$.-]@4XrI+>tu0
2_6pD1,h!?cESKkE^;6./29%>3&`EI3A<3>0ePI@/2B(</ho7B1,:j@/N,UA0JYRG0et:R@<?4$
/1f)O/6$XU/44>nFE1f"FD5Z2+E(j76=G.NEZen(F(o9)@<?4%DBM4nCiF&r.3MT1BddD-B6A$)
.3Lo)F`VYF@;KY!.4u&:6$?s\E\'aZ+>Yf-2_6d?0JbX=cF"c^@<*nb/20%=1,UX@3AWB@0ePFD
/28n;/iGIE1cR0?/N#O@2)%$I3&E0TDJ*d"F(d*UcF#2j@<*njDK]T/FCeu*AoD]4<+ohc6"t?^
6#:CHDII#tDe:,6BOr;W9d!2>F`_>-@;I&PCi*Tu@:LEUAnGaeAISu4Gf-k(DffeH844RU1,LmL
1Ft783&<9L/70MeATTJ1/70qf/i#461Gq0F3B&cM3B/QA1,:I=1,q!C2CpU;0f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70qqATTII9kAQ`@ps6tE,ol9Df]?'/g*H)_m=/tFDN(:ARTIt+Eq79ATAo%DJ<rrC`mG0
+EV:.+DtV0Bm+&1:17gY@<?<.Cgh3oF^\oo/0K.MBk(g!BlbD*+E_R9EHPh8@;]Tu@s)U0F`Lo,
Cj@.EBkM<tAnba`DKI"4DId<qBk&8oD/a0&@VKb'F!,OCARfFcF!,(8Df$V=BOr;q@<6.#+E(j7
9kAQ`@rEtD%15CHAU.^)G@>$-/4`/O0fV*K1+Y.93B8lH?Q_dXBe3UB?S",g3&)s@2(gR>1c-mA
/1iV2/iYO?2D?s=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/5:CuDJ`g&+E2@>E,Tf+Cc`b*H"D80
Ed(r&Gp$gB+EV:.+DbJ,B4Z.++CT.u+Dl%<F<G:7E,Tc=@;^00EbT].EZf(6+AI,iDJ`g&/e&.R
H=^o)@:iq\ALpAM+?2/20e>%52_d*H/C/i$+@CEe/1iD)/2St;3@lsA2(gaA1H$pB/2].70fV0O
1,CI4/C/i$/44\q/.DqPH>$_<85^Qi2`*'?1H.!B/C(^I7<3)n/M&J)1G1XI/2T190ebLF2`!!:
3%d0N3&*6I/1`?t[k'sgBe0]#6$dB^A8*Sc;BRbL1c6g?3&*?G/C(sP:j$_.idd4D0K1gK1G(@=
2)6^=/i5F:0ekU>1GUaD2DZm91,LUC2*!TT2CpC1cFti+F`8l@$:804CLhQ=844RT1G^^E2CpdC
0f(^=3$;3qBe3UB0f1aG3%HpE2)HjB/iYX<1,:[=1,(F>2`!!D1bLdB0KCmE/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>3%S'(Be1H,Dfp/8+A6WnARTI!E,ol9Df]?'4!6juASYh!+DGm>FD,5.BPD*mATMr9
D/XQ7FCAm$+E)-?FD,5.95ei^@;[3,ASu4"F*2;-/0K"JFEM#6ARlotDBM\mEcbt;95ei^@4WO0
DIal2H#7#/Ch[s%F!,R<AKYl!FD5Z2@;I'-E+s?,F<GL6+A6WnARR28%15F1Ec,<+A1)F@;flGg
/4W;T2E<cK3&`iR2_7ub2)$^,:N0tu/M&J)3A*0G/2B+D/i5FB0JYF81bL[E3&3HQ/4i--+BM'3
:+Rqs1,Ua>/5L4u/.DqQ@<?'u+A6-WFDl4O85^Qf1H@!G2Dd9BcF+i_ATTIh@4X)e2)-s?0eb@:
/2Jn;1b:C@/iYaH0f(a>/MSq31G^mB1c-a7/C([T6Y1?j%15F5ASl-u/4`Y]0f(gG/2An:1Gp`0
Keji?EbR'V/1iD//ibjA2E!0A0KCmE3@la<1bLI:2E3NQ/7WU=Ecl>CARm>Cc\4/+7<3)n6#:CH
B4Z.++>G`.2%9mZASG[+85^Qb1-%<F0f_*N2_<7h0d&o*Be1he/M&_20Jk==1+kRF2Dd-G/1ib4
3&<KN3%um7/C)!b/4FSn/.DqQASbpo/4`/O0fUmD1bpUB2)-jC/70MuB6#P1/70qe/i>L;1-%$@
1,_'L1,ga91,CO@0f_*M0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,B6#P%ASu'l@;KLrAKYr4DfBW9
@;J"J6=jtEC`mG5+CQC5@<,p%F)Q2A@q?d$Afu;+FCfJ8Bl5&8BOr<(DfTr5+E(j7;e9iXB45U/
%15F5Ci!O%EbTbL85^Qb2`WQC1,UjD2D!.[+A[#l/1iD,2)7$D.kik:0e>%32DcsE0eP4@1,h*J
/2f+:1c[KK1Ft(.cEf&tEbR'6$:8<EAS?@,BjiP`5u]F4/MT+683p3,:b=CZ/70MrATB>//70q_
1+k79/2fC=1,LsE2DQg>3A*-H0K(aC/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##bE\&D7CN<itDJ<Ns
+E2@>E,Tf+Cb?hsATD?qH#@>)+Eq78+CQBkCghL$@j#;nBlnVCDe:,9@<?($F!+n/A0>o,G%G]'
@;]k%+C]J8+DG^9D/XH++ED%'ASuT4FD5T'F!,.-EZfFF@<?X5+D>2)+C\nnDBNn=Df'E7ARlp*
D]j.8@<<W1AftM)DIIX$Df0!"+D5V'A7]h'+Q@p9+<i"CARTV$BHV/1FD,6+/0JnPDffQ#FE1r6
F!,C5+EV:.+D"u%FD)jB/g:`36=k7MChI=%F(Hmn;BR_K2DHa<2`WiX/C(LC:NC/#6");u2)R6H
.kin;1b:=51c6gD3%d-M1-%-N/2o1<0K1[D1b:1/cESorEbR'6$:8E7Ea`j"/4`Y]3&<NF0f(R=
3@m!A+@1$^/4!\q0JYL>0Inn;0fCR=/iGF81bp[?3AifU1+Y1>/i#==2)$s?/1`V4/4";j/.DqQ
BjtboJLj>[+?2853&)s@3&`QH/70MuAU#b5/70qf/iPR;0f1mC0JYIC2DHa71G1X@3&EBH/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#,eGUt%1DIdHiDBNn=DfBW9@;J"J6>9nB`.9%804N&'@`bKU03o]7
F!,R<AKX<NDJ*BoBcqA8Df0]8@qf@nBl@l3De:,6BOr;b@;^.%EbTV<GAhM4+BE2cBONG7GA(]#
BHV/'@;^-/@3B$"BkM+$+C\njD'3b/+Dbb)BQPjN%15F9BOPa/85^Qi1c6s<0ebUE1,gc0\0+UZ
B.PVc/M&\12)6^=1GUR?1c[QP3@m'@0f_0P2DZm8/C(aV:h=8j%15F?F)Pr)/4`/O1,(UE0eb.5
0K1aE0e?ZS6#gor?S#P83%d!D/2K%=/iY^E2`3<@/N5:=0K:gF1Ft:80f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70qoEH3TS6>pp_Bji,mDIak\ATE*.B5_s-DIFZ,Ec5o8F(&lH+@:!fDf/u+BlbD=BOr<(@;TQu
B5)O#DBO%>+EV:.+EV18EbTW6Ed8dGAfsEYF)G]#+DG^9FD,5.0ed]_+Ceu#FEMVL/g*hrFCfJD
+EV:.+DtV)AKZ2*F!,RF@;^-uDfT]+A0>u4+@:!fDJ<N%DfTQ)Bl7@$Bl7Q+Ao_g,+EV:.+DtV)
AKYo'+EV:.+@:!fDIFZ.Bm+'./g:`36>psWBl5Im;BRtW0e>%93&<NFcEn][EbR'V/1iD0/i,@9
1cI$I0K1dF2CpRC/iPOD2E*HD/1f)R/4";j/.DqQEa`HkBm"8D85^Qf2D?p<2`!BI1b?t*+A?KY
/3tgA2)$jA/M]1<2_6a;1,UU<1,^a=0fLsJ2_6O92(gXD0f_-H/1`?uK.K]1@Oqrq6?Qa[E%FOJ
+>Yu43&<*@2D[<H/70MoASs&+/70qd/iG^@3&E6C2)mEH1Ft+:1G1RG3AWKM/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"o_DCe(rF*)G2Ch[<q+E2@>E,Tf+Cc`b+F^fK4+DGm>FD,5.6>pd[GBIqHF`(h7
GAhM4+D,P4+Cf)!Ch,.-$:8lQ@4Xr;+>Gc/2`3-@1,1dD/70McDIb;*/70qe/i#C;1H@'C2)dNR
1Ft@</hf1=2D[$<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"/a/4FYoBl@s)@;[3,Ec5o8F(&lH+@:3g
@3B9*+EV:.+Cf>,D/X<.Gp%6NARlp-DfTA2AoD]4@rGskARuuuDBMAiBPDC(BjiV'$:8lQA77#[
;BRqS2Dcs>0K(jL2D!.f+@1!f/3tgB0f(aJ/MK+@0e>.63%um>1,LU?1H.<O2CpF=/iY^F1,(I7
/1f)\/4"8r/.DqQ_l7IiWGZWq/4`/O3&NWO/2fCC1FulU:ig+t?S#P82_Hg?/2Aq41GCR=1cR$A
3%d'H2E!QQ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##p@k8fnEb0,uBHV87DfBW9@;J"J6God=_l7Nl
F!,[8F!,R<AKYW(A0>f&+Dbb)BQPdJDe:,6BOr;bF`&`Q@;]TuDe:,*ARTCsBHV#,+@fj_Ch[s(
+DlCGBQ%^*B6c*R%15I2DJsK:F"Bj[+>P`.2CpX<1c%*BcESKZ@<*nb/2/t;1b^L=1,La;/MJe8
1+YFC/ibmM3AicI/N#:92E<WQ2DHa6/C(LO6Xb!d%15I2E+Nj%@4XrI+>Gf/3%QgA2D@*AcESKX
F`K$!@4X)i0fCs@1c@$A/2/\13%R!K/ho:?1GUp@1c6mG3B&rY0e=k,cESodF`K#B$:A6@BIl\P
+>PZ&2`*EDcE\Q[@<3tc/2/b33AN*B3A<HE1+k=A/2Ah53A`TK1+Y:C/ho1C2`NNC/1f)P/43ie
/.DqR@<6O/E\'aZ+>Po:0e>+=3&NB@cESK^ASita@4X)k1Gh!?1GLaC/28b;3%Qd=1G1RB3A`KN
/2K"53&ilQ2`<3</C(LO7qHNg%15I2F*)P@@4XrI+>Pi4/2T1=1+^b*1*AqmF"Amo/M&_22DQg<
1bLL@2DR3G/2]F?0fUmA2)QpV5uf%/7oN/6/C0#*/43ie/.DqRAR](aEa`Z585^Qg2D?p<3&W]P
1+^_V+AZri/1iD)/2Ah:2CpUA2(gjH3&*3I/2St:2E*EG0J"b+cE\usE+gd3$:AB=@W*eg6m+BD
1c7*@1H.'K1b;uV6YKmZ?S#P83A**H/28k9/iY[B0Jtd?/N5XA1,h0Q2`*'@0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL6YKmZ<H<4pF^]Q(DBNn=DfBW9@;J"J6Y0t@D]ib8+EV:.+DtV)AKYo'+EV:.+DtV0
Bm+&1FE1r(+E(j7<H<4pF^]P<FD,*)+D5D3ATJu7Bldi.FDi:DBOr<(@<?4%DII?(Ao)C0ATBC4
$:AB@@:a=p/4`Y]0ekL=/29(?3&rNE2BYt-FY#*q0JbOB3%Ha@0fLX@/i5F:2)['B0JGIH1Ft:<
/i#CH1c@<E/1`M6/6$&#/.DqRATDs&DKKH2/4`Y]2DmHO/3#OH3ArG6]HBL\@4Wu]/M&b30f:L;
2E!0A1H%!G2(U=:0ePFA1b^dA/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCj)G/4";b/0[f&B6@d%+Co%+6Y1:]@;^0uF!+Ci@<Q3m
Ea^(=0f:dH/MT.<2CTbm@<3Q"+D,&!Dfp+D;fH/_Bldr1GB.D>ATAo%DIakuF`_;8EZf:4+<i!u
C`l;eB4YspDf]h>882UCChIZ/6uQrc;0?StDffP5A7Zm"@3A9QDI[?g+sJW`%15I9@;K@r@;[Ve
;BReO2`E9F1H.'D/2T:.<D?mQ/M&J)2(gR=/29%>/iYaI2)R0@1b^O=1GCRA2CpU;0f:(K@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*_2_7s'
@4XcZ@;K@r@;[3%F!+m6D0^5:Des?)Bk(Rf+CfG1@rGmlCh4`)Bl7Q+Ao_g,+CQBlBOPTtAoDL$
FCAus/e&.TBOPb#CNXnR85^Qb1bga:1,([J1b?q^1*BP)FY#ge/2/n93&`?B2)R-?1G1UB/2fF>
0fCmH3&W<B2(gjI0K;$I/1`?t\2#U7@<F+1$:AK8DfBB1@<l94=$]b]/N#45=$]b]/N#45?Q_dX
Be3UB?S!od/iPU<1c$aB3&iTL3@la:0J5=F3&!6H/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe34s
@;-j'Ec5o8F(&lH+@BgND]hkiEaa6%+DGm>FD,5.B6%QlF<GU<G%G\:De:+kBOPUk@;]U.%15I9
@<,d-85^Qe2`NZG2DI!B2_<7[+@B1I/4!\q0etO@2_-^>1,1=:/i#770fV-F1c%!I0Jb7:0eP7>
2`*HR/1`?tZ7J@DDCc5(6YKnLDoIM`83p3,:b=OU83p3,:b=OU?Q`$fE\(QK0fUmH2CgRA1H-j>
0ePIE/2B.@/i57>1cI*>1H$jD1,1UA2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#bH7Ci=K*CM@3p
+E2@>E,Tf+Cc`b,BOPt#`J>XNF!+n/+CT.tBk;1(+B*)pG%#//FCfK0+D,P4+B*E#/e&.TBOt[e
BjiP`6m+3E1,_-Q/3,^M3A`9o+@1!`/70r8/2f+;1b:F:1bLI;2)$aD/2St:3&!9O2(UL:0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70qoEGR0M6YL%@BPCltBlbD*+D,FuF=hQVEb8`iARm>7FE1f#Bln'-DII?(
Eb/c(GAhD9+D>2*+EqaEDBND6+Dk\-+CT.u+Eqa@ASs%AF*VV3Des-/Bl7Q+FD,5.@rHL-FE2XS
F!,L;@q[!,Ea`KmFD5Z2F!+n/A0>T-+Cf>-F(o/rEb/c(@<3Q5BOr<(@<?4%DII?(BOtU_A9)7&
F!,(5EZf(6+B3K$Bldus/g:`36YL%OFCB&<85^Qe1Gq0D2)I9O3@rIc+A??b/1iD)/2Jn71Ft7=
3%d'H0JG4A/29"71bq'K2_cj7/C(aV9P&,n%15I:FCA]kCi!Z6844RT2)$d:0f:dH/70MrF(6b.
/70qf/i,C:1bLaC0ekC:/28t60Jt[G2)[!@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:ig+t,"Q-VFD50$
+E2@>E,Tf+Cc`b=BOr;RBlmcoASc0o+DGm>@3BApEbAr+D/XQ7FCAm$FDl+@AoD^3Eb0<5+DG^9
:2b/`/0IJlBln&3@WcC$F<G"(FCfJ887?4SBd[sEBl7HmE+NotASu!h/0JA=A0?))F!,")F(o9)
@<?'k+CQBm:.8)K:EW_WEbo8/87cgUFCAfn+EM7=AKYDtDf021GA2/4+EV:.+Dtb!Eaj;:;djQb
/Q6S1@qd&^@;K@^AM,/9$:ANL@;NiT/4`/O2)6pF2(UO>2_d<D?Q`']DCf-G?S")f1-$m?0JtI:
2`3<H3@la>/i,CE0fCa;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5:&#/4F@t;djKc@:X:sBjkm%E,ol9
Df]?'4!6n)FCB"'Tce2`@;^-/;JC;cEZf:4+EMX5EcW@;DBO%7AKYl!FD5o0+AQ?YF^]A7Cgh3o
F^\oo/e&.TDe!KjDerol/4`/O1bpaE/2K+A3@nM[;e'Vp?S#P82_I$K/28k30ekC:1c6g91,^aB
0f:jK1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,@r*\kBk(Rl@:s^kDBNn=DfBW9@;J"J6Z6IK@W-'m
@3B9*+EV:.+AQ?YF^]*.+DtV)AKYT'EZfI;AKYetEbAs)F<GC.CLnW&DBM;XDKKo-C`l#\ATDKp
@3B9%+AQW\@<,dhF^Zm3$:A`NATD[&@s)iD85^Qd2)6p<1c%!K2_6gD+@C$V/3tg@3&NHL.l'(>
0J#(63Ai?B1G^X<1c[<G1+Y1?/i,:;3&30=1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/2]:96Z-Bb,#2i^Derj)F!*hgE+O'-Bk):,
+E)9C9keB]Cgh'$95ec\Ec,T,+=Js$2`!$?2)I*<+Eq78+CQBhDes-/BHU`)FE2;;Df''++EqL;
+E2@>E,Tf/A0>u-AKYYtCh[ftASuU1Bk&9&De*Eq+E(j7FD,5.F)Pl'EZfFKF*(u1+DG^9BPDN1
@W-1#+<i!tAKZ#)G&M2>FD5Z2Bju4++E):0Bm"88@rGppATMs-F_r<H/g:`36Z6uf6Xb"RChYFk
;BReV0f:L?1GLXB/C(LU+@B1I/4!\q0etUE0Inq=0f^d?/iYjB0f_'C0JGCF1c$[=3%d!A3&<KO
/50JoBl5%A7;caSBldr:/1f)O1+YdnDCcu*@;THr-o!V=1FXjt:ha?aH>+KM0fUmE.3]3.6Zm-P
D(J4U+>tr/2_6pB1c@-@c\Wc8ATB=f/29%<2)Hg<1b^[91bLXE/2B%?/i,@@3B&rL0f1L:1G^dF
1b:1/c\X2DATB=2$:ArVF($Uj;BR\P2E!*A1H7<N/C(OD7<3)n/M&S50K1sC0JtOA/2Ah:3%R!H
/ibgF1c-m;/N#.73&WTM2CpC1cE\uiEbR'6$:J<3BkT%g;BRnW2`<3A0JG:>2([%Y0d&hlE%F:`
/2An70eb161c.-B1G1@=/2Jt;/i#:>3&!->/MT(72`NNK0JtC4/C(OU/43ib/.DqS@;KXp/4`Y]
3ArZE0f1jK3@rI\+@^9i/3tg@1GLX>/M]:C3@ls=3&W<E3%cm>3&ifQ/1iV:/ibmM2DQs;/1f)O
/4OPu/.DqSASu'g/4`Y]2`WWM/28h60KD*DcESKZH"SZ[/2An90f1C;2).$@0eP4=/2K"7/i,@D
3B/]D1c6m@3&!-E3@l^4cESofH"SZ;$:JHCARZcJChI<iBe2eQ+?2/41+Y.62`3HN/C(UF6Xapb
6")<"0f1gC/MT.;3%Qg;3&N6C1,^aD2D?jF1b:452D-^>2_m?O/1`?tZn+RQE%DG*6tL7I@W-'k
/4`Y]1c7'G/2]@E1GUN,Z62hPD_*Ik0ekLF0e4t81GgX</ho160fM$D1,^sL0eb.51bLXE1,(RF
/1`?tZ7J[\D_)>)6tp(?ASith;BReV2E36G1bpmB/C(LC6Z6fm5qF`H0eb:30fLmD/2St=2(UIB
2_HpI2_[!I/29(92)70K1cHs:/C(LO6Z6fm%15L;DJ*m(@<jCp6m+KJ0K(^<2)I$F3%SDZ9P&,n
?S#P83%cs@/29%@/ho=C1,:g?/M\q90f(R>3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%AT'+D<,u\j
Bk1X_+CT.u+B38g@:sL$E,ol9Df]?'4!6q*DJ*m(@<iu4ARTIt+EVNEA79@cALnsGGA2,?+CT.u
+EVaHDBNY2+D#@t@W-9qFCcS3Dg#]/ASuU2/0K"ZD.7F"Ble!+B-;;0AKYK*Cijf?AKYE!A0>\s
DJ+*#B4W3(Afu2/AKYE!@qB_'DfTnADe:,6BOr<*AT)O(AKYo'+B3AqDJ<WiA0>;uA0=ii@UWnf
/g:`36tpURA77#[;BR\R3%QjB0f^f1Z62MGF=]!p/M&Y00Jk=80J5=F2`!BQ/1iS8/ibmL2D@$?
/1f)P/43uj/.DqSBmF,<=$]b]/N5F9=$]b]/N5F9?Q_gVE\(QK0JYIA1+b:90eb.50J5@E/2T(6
0JkI;1bgO51GCF92E<HJ2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qtDfRBQ9jr0bBln&tDBNn=DfBW9
@;J"J6tppT+DGm>@;[3+Bl"o.@;Ts+FD,*)+DGm>@WHC0B4uB0@X0(fDIdHiDBNA*@qB_'DfTnA
FDi9r@<HU)FD5l=+DG^9FD,5.0fUpB-Z^g]@;]TuBlbD>F(Jl)AoD]4Ch[NqFD5W*+CoV8Bl7Q+
F)Y]#Bjkg#De!9cF(oQ1F"AGJDI[L*A8,po+EV:.+Dbb)BQPA/ATMs-G%#20De:+[Bm4!%BeCS=
$:JfEBk1X'844RT0fM!F3%QsG0Jk^>?Q`?C@4Yb:?S",g0fLX=0Jb=90K(aI1+Y"62_HjE0f(^F
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"QUDCe@sA8c?sF(o'#+E2@>E,Tf+Cc`b-De<]o@3BDu@;^-/
Dfp(CF*(i2+DG^9:2+-X+DbJ(B6@WqAM+E!6uQpO@<jCp5u]F4/Meq/?Q`?C@4Yb:?S!od/i>C8
1,(U=0KCsE1bgO<3%cm?3&WZS/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4WU#F`VV<@;[3,Ec5o8
F(&lH+@L-b@UXO)BlbD*+ED%7DfTqBEb/ltDf-\3DBO%7AKX`dEcbt;6Xb+I@<6R4+Dl%>DKK<$
DK?qBBOQ!*BlbD.DI[L$F(Jl)@X0)5Dfor>@;0U%AoD^$F*)IG@;]TuEbT#s+EqO9A8GslALns<
DI[L*A8,po+C\njEcW?O@<3Q5BPDN1F*(i2+Dbb'F!,17+EV:.+Cf>-F*(u0CghF"Df-[tEcYY3
9jqdTE\&>TBOr<!Eb/[$+C\njE[`Ub%15LE@q^!o@UUfY;BRhW2)?dB3&E<D/C(UF;e'_s5qF`K
0JG:71,:XE/2Ah53@lpB0J5%=1G^mK/1iV4/iGI>2_d!;/1f)R/5p%s/.DqSF^f#q/4`Y]1c$g?
/2]7<2DHc.Yom%@@4X\q0ek@<2_-d@1c6g=/iYR:0fCmA3AWBM2Dm$D0ePCB0ebC@/1`?tYq/mL
@4Vip7!`QV@;[Ve;BRkU1H$dD2E!9H/C0,,+@L6Y/3tgA2`*6L.lT4;3@m!>2)d'A2Dm*D3&ETL
1b:R@/ho1B3&EQF/1f,'0e>_5@4Vip7)Q*M_mV*t5uUT30fLXb5uUT30fLXj+B)cg/70q_2)RBR
/M]:>1b:@9/i5R>1,CpC3ArWJ3&`B?1,pm?2DI-J1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,@rEnc
Df^#/+Auo`@;[3,Ec5o8F(&lH+@O,KGJgj3Bl5%[EbT!'Bcq5#DJ+*#B4W3&ARTIt+EV:.+EM[C
+=L]5B4kdr+EV:*DBO%7AKZ&:DBO.7+DYk5G:=YCDIal3BOQ!*DIn!&EZfIHEc,q@De<T6%15O5
Cgekc6m+6>3&NTP/28k91GU^:?Q`0d@k:t<?S"/h2*!3D1cI$B3A`WS2CpF8/i#==2`*ED1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/5UCt/0\#<EbSs"+E2@>E,Tf+Cc`b.@VfHqG@>P8Df0,/De:,6BOr;t
@<-0uATMr9CM@[!A8c=++DG^9;gECt@4WO0DIal2ATDs*A0><%+CQC3Ec5f/DIm^-+ED%+Bl@l3
Bl5&8BOr;ADIakuDIakGEb$;0Bl%TsDJ<N%67tVX+q4lJA79On@q[Da;BRhU1c-aB2)I0M/C(dK
6ul]e/M&V61,M!A2)mHQ/2Jn63@lpA0eP4;1,CpK/2]C>3ArcL2DZm8/C(dW6ul]e%15O?ARfh&
@4XrI+>GT-1+Y.=1c[QI0fL4S@<F+Q/2/k:1c['A1b^j>1G1UA/2]=<1,1aK0Jk=91bLL;1G^gF
/1`>,2_7p:FY!t/7;QUFAmo^285^Qf1b^p@2_[0J2([(=+BE2s/3tgA1bq$G/MJq71b:I93&E0A
0fL^=2)$mH2(U=7/i#1@3Ai`H/1f,4/66J*/.DqTChn06F_!$o;BR_L2`E9C3A<6G/C(aJ6Z6cl
/M&J)2(gR:/3,F;3&iWP0JP+11H-pA2)70I0J"b+cF>DmDeps6$:ScK@<?0685^Qb2`WTD1,UmD
3%W@\+B2cl/4!\q0JtUD1Fk4?1H$d=/iGR<3&*$C2_mBP0e>(>/iGCB1c7$>/1f)P/6$&#/.DqT
Cij*'Bl5Im;BRkV0JtC@2`NTL/C(RE6ul]e/M&V82)[?C2)-jH/2Ah51b:C?3A*$D0f:dB/2].7
1cRHS3ArE>/C(RQ6ul]e%15O@Bm2+!6m+EC3B8WJ2)70C?Q`<j@k:t<?S"/h0K(I:2_I!K2E*KO
/1ib</ho=F0fCj>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$b%/5:&/@;TIfEHPh8E,ol9Df]?'4!6t/
Bm1\?AT2[$F(K62F!,:;G%De1DBO%7AKYf-@ps0r9jqgNFa%7:Cgh3oF^\oo+E(j7FD,5.DJsQ;
BOu4%+ED%+Bl@l3De:+dDgGi/@VKh)AM+E!7;cgO/4`Y]3&<6J/28h;1GLa<cF"ckAS3PG/2Aq:
1bpR83AiTD1+k@B/2K%>/hf+?1cR<C3A*9M2)$^E/1`?t[4G-cB.OK!7<3EWBe2eQ+?2A?1b:@9
2E*BM/C(RE6Y13f6")<"1G_$I.lTCC3%Qj<1,1=92)HpF1H%-K2(U[F/iGL@1GL[:/1f)Q/43uf
/.DqU@:jCkE\'aZ+>u5:2(UaA1Ggp>1bp1AEa^Lb/29+>2D?X>2)@'?1bLaC/2B.B/i5RH1b^g=
2Dm*E2D[0L0J"t50f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPFrA8-."Df.*_1+Yh6@4XlVAo;='+Eq78+CQBfDfTo1+DlCGBQ%^*B5(jaC`m84@<,s&
GA(n;FEMVAARlotDKKe>@3B*$@:sLr/e&.W@;]^/85^Qf3A`QD2`NQN2([((+B)cg/4!\q0f:gJ
3A!!E0K1O</iYjB1,CpC2_d'J2_lp91,^a>0f1U=3%QU3c[[QF@rEn-$:\HJ@<-('/4`Y]2`3?M
/3,XD2Dm&2Zlh_]B.Q>"0f_'J0Int;0K:U=/ibU:1-%6F1,LdF2)m-D2(gU>0K:d@/1`?tZn+Ri
B.OK!7V-CMF"Bj[+>Z#51Ft@B2DI'?/KdT0@4Wu]/M&_23A`9A1cR*H0fLsF3%QX93A*!>3AWHL
/1`>(/4b%p/.DqUASc(*G%#E&Cgek]6nL,P+>u#,1,:[F/70MeATTJ1/70qg/iGI92_HgA1-%0H
/1iS7/i#1?1Ggs?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43uj/0[H(@UX-sE,ol9Df]?'4!7"(Ch\,:
<ag#[CgeG70fM'Oidd4I3&NK@+Eq78+EV:.+D,>.F*&OHD]j.5@:NsnF(8oqDI[6#Bl5%\F^ec%
@<<W6BOr;b@;[2T@<-1&F!+n/A0=fZDBM5^@WHC.Bl>+mASl.!@<-WG+@p&dDfB9*ARlp*BOr<1
@<iu;D]iV%F^nj%Bl@l3AoD]4@;Ka2+CT.u+C\np@;[30BOr;tG]757Bl.F!FCAu.FCeljBPD?s
+E(j7E+jN<Bk)3,Bl5%\F^ec3+q4lKCh76jFDl&=ALpA?+>GQ*0f_*B2)d<M0J$QR<bZS*?S!od
1c73B0JYIF/3#792_6[B2D-gA2DR$A/2Ah;1,1UE3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/BlYaK
8T\BWBjkm%E,ol9Df]?'/g*W"AS5RrDf0Z.+DGm>FD,5.F`(`$Ed)GBCh+Z/Bm+'.+E(j7Anc9s
+D,Y4D'2>hAS#X"9mLhoDes?)Gp$g=+EV:.+A$Z`Ch[<q+DtV.Eaa'(G%De8De3c.Df-\>BOr;p
AoqU)Ch[Km+<i!tBm+3.@3@pUD/EipBji20+=KWlG%ki*+@C'aD.R7'.3N)F+@KXUFCcR\Ch[Nq
Bk;=!/0JG9Df]K-+CT=6@;[2rCi"68Bl@l3FDi:DBOr<-FCB2;F!,(/ATE&=DIIX0Eb-jI%15RC
D..6o@<HZC85^Qi2_m?D0ekI?2E385Yolka5qG;Q1,:^G2_?dF1H-j>/ho:91Ggp@1bgaD3AW3<
1-$sF1,:U@2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/C(LO:ieoR,#i5e+DtV)AKY].+E):7B5)6lCi"A>
Ao_g,+@1$V@VK=5+PD>!Kco$GfnA"[fne:\+D,b5+CT(<iOG^mGB=rU-Z*dEFD)e8Afu2/AKYT!
F(cpM/g*`'+AcWiF(o'#+CT>5Ec5c4B6c$NFD,B0+EMX5EZfR7F!+t$Ci!Zn+<i"#@:jV"Ea`iu
/0J#&FCSuqEZf:4+EV:.+B*3$FD)jB/0JkKAKYo'+EV:.+EDCG@;I'-FCB32/g:`37W3<aDf]><
844RT0JGCB2(UUC2)%!@?Q`$RD_,6H?S")f1c6g=2`!'F2DmBK2_6^</i5C>2)I0A1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/50Vn/0[GpBl7L'AKXr\BlIWt+E2@>E,Tf+Cc`b/DfT]5F($2*F!,R<AKYZ#
F*)>@Bk(Rf+DtV)AKYo'+B2c`G@>A3F`V,)+DG^9FD,5.0fO2f+Ceu#FEMVL/0Je@@;]dsB-:Yp
@<H[+Ap%o4Bl5%e@<?4$/g:`37WMpTH7VTQ<%Uou0f1FP5u]F4/MT(5?Q_mNE\(QK0fLjA2(LIB
0f:LB/iYa?1,^g=0ekR@2D?[<3%csC1,1dJ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"`ZE\&D#F`VYF
Bjkm%E,ol9Df]?'4!7"5@;^B6BlbD*+Cf(nEa`I"ATAo-DBO%7AKYi.G%kM1+sKs"F)u%>+s:H6
@W,e&Bl7Q+@;[3!D/a',DfQt=AfsB^F*)G:@3B9%+EV:.+BV3;FD)e,ASuU4Ed98[<+ohcEc5c*
+DGm>E,8s.ARlomGp%3BAKYDkFDl1B94;jWBOtmqH6>Pl[V0M1+q4lKF_l1O85^Qb2)?d=3AN9>
cF+i_@<3tO/1iD//iG^@3A*'D1,q-G/2]493&rlW0K:U7/C([T6Xb$e%15RID..7%@;TFg@;%2_
;BRqX2`!!>0f(dK3@rI]+Ad,h/1iD)/2St93%QjB2(gmI3AN?I/2Jn<1,(C=2(U:0cE\utF(6a1
$:]/UBe2eC+>GQ11,Lm?2DHpF2_8;Y6ul]e?S#P83%d-I/29+D/hf%@3AiQC2`*-D3&riQ2_6^<
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qrEa^Lj@qBIbDIdHk+E2@>E,Tf+Cc`b/F`(n9BlbD*DBNk6A0=HR
ASbdmA8,NrGAhM4+Dk[uDJ=!$+D,>.AKYo3+C].qH=\]<$:]/YF_!$o;BR_M3&3$@0JP=</C([H
6VUu?6");u2DQsB/Mf(71b:F80JY1>2(gRA3&<6B/1iY3/hf1>1H%0C/1f)T/43-?/.DqUFa8+@
/4`Y]2E!?F/3#RD2DHa7+B)cg/1iD-2`*NT/Mf=>1Ft=70f^d?2E*6F2Dd9F1Ft+62_Hd@1G^^B
/1`>(/5p%s/.DqV@:O>#GUuB`+>c#81FtF=0K:m?cEeW\Eciob/28n90et=<2_[0A0eP=D/29+C
/iPdF1c[NH/N#I>0ekI>0f(@3/C(RQ6ZR<#%15U6CO'W)/4`/O2`!<I1b:I=1c.*A?Q_^R@k:t<
?S"/h1,CI91-$sH0f:pI2CpR</ibgD1H.0B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44;b/4+#mFCB&0
E,ol9Df]?'4!7%%CO'W)+Dk[uDK?q6@;p1"DImm1/g*Z)Df]tB:186YDf0!"+@op[E+s3$F)rI<
F!,R<AKYMpG%GK.E,B0(F<GO9Bl%^/DfBB8+Cf>-@qB@tARlolDIal%Des6.G@b;-Bl5%[BQ\E*
DBNA*A0>T-+E)./+E(j76>1L`@;[H6+Cf>-FE2))F`_>9DK?qBD]j.8AKZ28Ebo8=%15U:D/!m#
@4Y5R;BS:[2D[->0fLX[;c4`)0K(^C.krt6?Q_jMD(I7i/M&J)3B/WJ2`3KL3%QdC/iP^C1,Uj=
/1b-Z7qHNg%15U>@<HX"E\'aZ+>bo21b:LB1,1L7cFY2eEa^LN/1iD//iYU;0fLj?3&NBM1,(7;
3A**D0ebOD/1`?t].??j@4Vip7qlOP@;%2_;BReS2DQg@3B/]K/C(RE6ZR?$5qF`G0f:pB0fLmE
/2Ah83%QdD1G1[F0f:dD/1iS8/i>I?3ANTG/1f)Q/44H$/.DqVBl7?s/4`Y]1cI*B/2f1;2D?]-
[3.hWFY#*q/M&\12*!3B3&N<E1b^U>3@la?0J5190ekLD/1`?t[4F[cFY!t/7r3*PF"CBY;c#&#
1Ft(a+A@&u/70r8/28h22)-X:1b^O:0JYXI2_6a@/iYgG1bgp?1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/51>,/0[E$Bln'1BHV87DfBW9@;J"J8T#YF@;^<47q#tFBk&\:7r3*PF!,=2@;^-/FDi:CBPD?q
+=M&?CLnVs+EMX5E[`Ub%15UDD.RF&@4XrI+>Po52(UOA0fV-DcE\Q[9kc.E/20"<2_lm;3&*?C
1+kOH/28k6/iPaK2E*HD3%csG3AWBJ/1`?tZ7J@;Be0]#7ri`hBm"8D85^Qg2E3ZI3&`]S2([%e
+@L6Y/3tgA2`3BK.lB4B1+Y462`!!?2E3<F3&36C2_6gE/iYdF2Dd<C/1f)\/4=Me/.DqVF_#5q
/4`Y]2)mNT/2oLE2)$T,\fap_E\&dn/M&_20KC[>1H-p@3&EWL1Ft7?/ho1;2)[9B/1f)X/5p,#
/.DqVF_tQ'@4Xr;+>Gf83A``I3A`WN2(Vcc2Dm64;eL,%?S!ol0f:j@1,L^?/2f+92(ULB3%d0M
3&EKQ/1iV6/ho:F1Gq!?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD'2)[<I/5p2%/0[E$F`(c)+E2@>E,Tf+
Cc`b0F_tQ'@3B9*+CQBe@;K@t+EqaEA1SjIBPCsi+Dk[uDK?q/+DkP"Bk&8pAU89'EZfFFDf0,/
AoDg0A0>T(+EMF/CLqQ<+CoM$B5_[//0JMG@kJr7$:f5VBk_%!FY$']+>u&11+YCA1b^d<1H$@O
E+gdg/29(<2)?g>2D[6B2(gRA/2B(B/iYXG3&`]G/M]4:2*!WU3AN-:/2K18:N0tu%15X7A79L0
85^Qf1,_'B2E3WL1+^_V+@B^X/4!\q0f1R?3%[$B1,:C7/iGF81,1I83AiZR2)[!;2D?a>2`!-D
2(U:0cE\ugASs%.$:nT:A9DrE85^Qb2Dd->1,CjI2_<7`+@1-j/1iD)/2Jn53%R!H/iGIE2_m->
1bgU<1GgpI2CpC1cF5>jF`K#B$:nTB@;IJc;BRkP2_6sK3&E23Yol>QBe1he/M&Y00JP+70ePCF
1G^mI/2B"61c@*G0fU^8/C(LO6#pZj%15X7F)tc+AS<Vc;BR\O2`E9C1GCO@/C(dK6$73!/M&J)
1+kIF/2oC<1,LsI1,1=91G1C?2DHm>/4"Ao@<3PYDe3a!/1f)W/4"E!/.DqW@<?d9@4XrI+>Gi9
3@lpD1,L^:cFG&nEbR'j@4X)i1Gq!@0Jt^F/2Ah;0J#1>/iY^J1,V$B/N#.@0KD-I0e>V4CghB-
6Z6OPBe1g\\L^NsBe0]#87cU\ATVX)F"Bj[+?2;83@lm>1G^mI/2].):h=8j/M&Y42)dBC1,(OC
/2]%:3@lsC1bLRB2DmHM/2An32`<WT1GLF90JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?2)-XYAS3P<87cU\ATVX)F!,1<+EV:.+A?3c
Bl5&*DfQsE,'7L0+@p'[G%Gc0@;[85+CT.u+ED%*ATDi7FDi:DBOr;RAScI&@j#l6BjtWrFD,*)
+Dbb8ARlotDBMl%BlnZ4Ebo0%A0>E*EbTE(+EV:.+AHQ\A8Gg"6"abM/g:`387d*Y/4`Y]2)-dD
/2fCA1c[,4[NJUbE\'L-0f(UB2_?^;1H$d?/i,I<1,(L:2E*EJ0JG%00J54C2)m?F/4"Ao@<3PY
De3a!/1f)T/66J*/.DqWDeE]kE\'aL+>Po72`N?D0ek@B/70N!@<F,./70qf/i,I<2E*6J2)[-G
3@m!>2)dBJ3Ai?C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<+0o#6#:1FEbSs"+E2@>E,Tf+Cc`b1DeE]k
EZf(;+EV:.+DtV)AKYo'+EV:.+DkP$DBNe7F`);0Bl5&6@;]^h+DG^9FD,5.;dj?JEa^(YATMF'
F<G:8+EMIDFD,6+DBM5]B4Z*t@4hur88i?RD(J4U+?2881b:@91,(ID/C([H:h=8j5qFcH1bgj<
0ebI=/2Jn80e>+;0J5.>2)R'D/28h23&<9F2DZm8/C([T:h=8j%15XEEc,;:83p3,:b=I_/4`'+
/Pn#T3%SDZ<,u\(?S#P80et@=1Ft=>/i,IC1,Ud;1GUR<1c@'E2CpU;0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r-EbR'oBl7g&F(c\8Ec5o8F(&lH+@pEkDIFZ%F!,.-Cht54EZfI;AKZ,5A7]e*DfTZ)+D,Y4
D'2;^DJj/u+DlCGBQ%^*B6c*=$:o;W@;'Vt\h$B?+?;D:0f^dB2).$H/70MeEc`j>/70qf/hf.6
0fD$E1c.0H1H6p;1,COC2`3EH2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqEc`j'Df0*.Ea`i.E,ol9
Df]?'4!7(:DII3t_n$t7@<3Q0DIjr/Afu2/AKZ)=Bl5&+De*o3GA(n;@V'%XD.Oi3BOr;bF`&=9
DBMS"Bk(gf-Qjg7F_P?!_l5(-9jr<UDBNeAFD,T/DeF><@<3Q3ARfY$DKKH#+DG^9FD,5.:iC;k
C`lc$BJ'`$89JfgE\'aI<%Uou1+Xt`+@p'a/70r8/3#7@1+Y1;2(gU@0f1mF/2T(60JkaC3&W<C
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL87cfm,"QioB45gp@;[3,Ec5o8F(&lH+@pWmDfQtE@<3Q"+DbV%
ASu$eEd8d9DI[7!FDl1BDe:,6BOr;WF`)7C@;]TuFD,5.89Jf_@<-'jDBNh*FD5Z2/0JA=A0>?%
DffZ(EZf:4+AH9WDfRHS%15[BCh[]:85^Qf3ANQF2`NNG1b?t(+B)cg/4!\q0f:gH3A!!H0f(@:
/iYd@1,CpC1,:R=2)-X61-$sB0f1RC1Ft(.c[dWG@rEn-$;#&MH#dV-DCe=H+?2,93&W<E2_[3M
/70Mn9kc.c/70qe/iGI90f1[=3AWWM2E*0C1bL^H0K1gD/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lF
Be1GoCgpgjBjkm%E,ol9Df]?'4!7(.F*)>@Bjkn#+DbJ,B4Yn)+C\nuBk;I!+EV:*F<G[=AKX9T
@UX.g@;^-/@<,p%A7]glASu$eDKKqBDe:,6BOr;XCi"B;Bjkn#/0J@DFCfK0+@0gQ@;]dfDK?q>
Ec6)2Cj@.5@;Ka&FD,6&F(K02ATKIJ%15[D@;.8`;BReS2)[!C3B&cR/C(UF6ZR<#/M&J)1+kLC
/29+?/iPaJ1GUX8/N#L?2`*KS1,ga8/C(UR6ZR<#%15[EEHPu3Cb/+F+>G`31bg^93&EQR2_8;Y
6#pBb?S#P82D-mH/2B(C/ibgH0fD!B/MoF>2)I<L1,(770JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#pBb
:h=ZiG%kB&+E2@>E,Tf+Cc`b2DK0f5Cht5<@<3Q0DIjr(@;KNuDe:,6BOr;rDfp#8AKY])G&M2?
ARlotDBO%7AKZ)8@:s:a+Dbt>AKZ&9DfU+G=(-@sFDi:DBOr;bF`&=2Gp$^-D/XQ<+AcWiF`qJ-
DBO.DBlmp,+@0IW@;'(d+BDoeA7]RqD..H;%15[EFCB&<844RU0K:sM/29">2`N?q+@^9i+=pkN
?S"2i3AN-C0J5(=2`NfP/1iY6/iPR?0ebF81,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4OPu/0[esCghU1
Bjkm%E,ol9Df]?'4!7+4FCB&0D.R-nF!,"-@;Tq#A0>T(+EV:.+AH9\@<iu3@;]_#@:s-o-ph?U
@<5j"9kA-LH$(Pe+CT)&F_#3(B-;;7+EV:.+EM41DJ=!$+E(j7@3BW5@<*tE%15[EFCfK&EclFS
85^Qd2`*<A1c@0L0e?ZS<D?mQ/M&S91,q3C1c7'I/2]%:0e>%91+k:>2E!9L/2T4:2D?jB3&3$?
0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLs
Bl@l?/M'mr@4WToDKKH1@rc^5+Dk[uDK?pE,%>,*G@b?'+EV:.+DbV%F!;eNBl5%e@<?4$+EMXM
Ch5.?Eb/ioEcPl3B-;;7+EV:.+EMX5E[PoNE,Tf3FD5Z2+DG^9FD,5.@rH7+FCf9)@<?4%DBMr"
F($1c@;9_$/g:`38TJB[@4YJG;c#&%3%S,s;c#&%3%SDZ87cfm?S#P83A*-C/2B%</ibdL3&NQE
0eb461GUgH3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r!ATB>#Ci=K.DJ<Ns+E2@>E,Tf+Cc`b2Eb0,s
+DGm>@3BAt@:X(iB-:\t@<,ddFCfJ8Bl5&8BOr<(Dg#].+B<;iATAo8BOr;UEb/f);fut=+CQBk
FDl2F+E(j7FD,5.6#L1HASuT47ri$UA7f7lBOu4*+C]U=;f$AqASu'%GB.D>ATAn_Ea`i.;djKR
`M%']+@^'_`P,tnE\8J+Eb0,s+DGm>@3Bc4D..<)De:,6BOr;rDfp)B/e&.ZFDl&-@4Xr;+>PW1
1cREF0ebRC2`3-n+@gHp/70r8/2o1<2_6a?3A**D1,_-P/1iY:/iP[E2DR*?1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/4X`'/0[Sm@W--qF(HJ5Ec5o8F(&lH+A$ZnDId0,+DG^9FD,5.9mL;fAKZ)5DJ+*'
/0JG@EcP`4E,TW)F!,RC+CT)&+EV:*F<G:=+C\njF`_>0F_iZS%15[Q@<*ni;BRhS0K(I@1,1I?
/C(XG6>pcn5qF`I1c6s;1,gmD/2Ah62(UL<0eP4<2E*NM/2B.:0K1gD0K1O6/C(XS6>pcn%15^9
@U`bZ/4`Y]2D?mF/2oRF2`*)2]c^6`D_+1_/29%;1,(:73ANQF1bLX>/2B%;/ibpO3&rfH/MT7<
1c@$H0K:U7/C(p[;e'_s%15^AF(f]1/4`Y]1-%-E/2K4?2Dm&2^E?$XD(I7i/M&_23&rNE0f1LA
3AE<L2_6aA/i>UF1Gh!@/1f)]/4X8g/.DqZ@:j+[ChdZpBPh0/85^Qi0Jk=81,gmF/C(RE6Y1?j
5qF]F1c$p<0JbF?/2Jn92Cp[=/iYUD0fCg=1G1F=2)m<K/1`?tZReITF=[k.94;XFF`V7J844R[
1GgpE/2T:@0JY1d+BE&i/70q^3AWTL/Mo7<2Cpg?1,CI91c-g?3B8iS1+Y"61G1FA1,:O?/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#5hCb/4jDL#Z.+E2@>E,Tf+Cc`b=BOr<1DfTA294;XFF`V7>D.R-n
F!+m6G%G]>+EMXFDf021GA(]2Ch[d"+Cf>+F_u"=De:,9Bl7H(Bl5&8BOr;SBQ%^0D]ik)DJ+*#
B4W3(Afs`XDL#YC%15a:D0:+T844RT1c7*I2_6mJ1,1d??Q_^V67cIp?S")f2)d'A1bp[@0fCgB
0J"t;/iPUB2`*KF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44GE/4s>i@;]XtAKYr4DfBW9@;J"J94;[[
Gp$gB+CQC:DfTA2Bl5&8BOr;PBl8&9Cgh3oF^\oo+Co&$Dff]2B-:V*F*2G5Ec,<-F`Lo,+D#G4
BlnVCE,Tf=ATMp,DJ()5E+s?,FEM#.+D#G%EbBYM%15a:DJ(Lk;BRhQ0f:L?3A`KM/C(gL<bZRs
/1iD)/2St63%Qg>1G1F<1H@6O/1iS1/i#@A2_['>/1f)X/66J*/.DqZ@<,dl@4Xr;+>GZ21H7?F
2`<HL0e?ZS6#^lr?S!oh1Gq*C3&!'B/3#7@0e>(91G1[B2D[-J/1ih8/i#+;2*!KE1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/4"5r/0[i#G9C(#@;K@iA0>i3DfBW9@;J"J94;jLCLJ?"F!,R<AKZ28Eb$;,
DBO%7AKX^cJT#RC+DbJ(B6@WqAKYT'EZed5E,8s#F<G.4A7]Ul@j#l3+AQKl+Bi>bCgh3l+EV:*
F<GOCDe+!#ATJu&+C]A*B4uB0DfT9(B4WV:Ao)%"BR(_4Ecl)</g:`394;sa+@1-kFE1f+Blbgr
;BRkW2`WEL0JPOE/C(XG;eL,%5qF`M1,La<1GgjC/28b93@lpE2D-[?1-%?N/1iY7/i,ID2DI*@
/1f)S/5p2%/.DqZ@<HW66>pmU@;KY!/4`Y]2E<KJ/3,C@3ArG6]-($bE\&dn0fUpJ0J,%;1,UU<
/iYU;1,h*D3B8iQ2E36>1,U[@1,1^A0e=k,cFYW+B6#O4$;4fMF!+1gA8,I'85^Qg3&N]I3&ruT
0eCVW+B)on/1iD-3&33B/M]=D0J"t32_lp>2`33C1cR?H3%QX:3A*9H3&**D/1`?tZn,-gE\%Y,
94<!TBIl\B+>Gf42)I$=3ANQS2(W)W;e9u#?S#P83%cm?/2B1@/ib[@1Gpj;1bLOA2)@!D/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#,eE\&D+Ea`j"@;[3,Ec5o8F(&lH+A6-dAS<3#F!,C=AKYo'+EV:.
+D>>,De3u4De:+jBOPRl@;TRh/0K%JAKYQ'Bk&9)De3c.@rH4'Df]K#+C]U=:h=ZgBjkm%E,T<0
+@]p_A8c[5BcpkrFE_;-DBLqu2]uOHA0<T\0ea_;74o]U@<Q3q+DGm>@3B#q@:O(oD/"**+EqL;
+EMgF@W-'sF(KD8C3=T>Bk(^,+q4lPASG[+85^Qb1GUg=0f_3M3@rIj1*B#+Be2P$0JkLA1G(:>
1H@!C/i5@82DZsF0fM*Q3@la@/iGRB3&`TD/1f)]1+Yk7Be0]#95%aN@UX(e@4XrI+>kr43@m'K
3B&cGcFY2fEbR'j/28t93AE*?1GU^:1bLX@/2Aq:/iP^J1c@<E/MT%61H.$B3ArE>/C(jY<bZS*
%15aBFCB!)BONG_;BRqR1GLF80JkdL2_<7Z+@U9m/3tgB0ekOF.kih82(UO93AN-A0fUdG2)RBN
3@m$?1,LpL2Dm$:/C(LO7<*H$%15aH@q]:[/4`Y]2)R9J/2o=B0K1Q.Z63.ABe1he0f1aA2_-gD
0KC[>/hf481,:U;2E*NM2)d'F1bLL?2)R'E/1`?tZ7K!MBe0]#95eBU@4Xr@:`qJJ3ArTC0etaI
0e?ZS7<3)n?S#P80eb482(UR=/iGXJ2E<WG/M]+70K:sK0et:80JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
7<3)n:j$>iFDi:"Bk(Rh+E2@>E,Tf+Cc`b4De3Wk+Eq78+EV:.+EqaEA0>K&EZfFF@<*K)DBO%7
AKYetDJ+*#B4W3(Afu2/AKXr\_l[fp+A$H]BkM!pDfp+D:h=QaCh4`-Afu2/AKX?KEbSulARTI/
%15aHBlkn.:G"CS=ALM*/70MnH#>0?/70q_0J57=/28k5/i,IH0fD!B2)m3D2E3BM2_6^<0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70r%H#>0%F*)><Bjkm%E,ol9Df]?'4!717BlkJ3F!*nmFDl&2@;[3"DfQtB
BOr<.Bl.E(GA(Q*+EV:.+B*E#+ED1;ATJu.DBO%7AKYi.Ec,T/B-8U5@<ZT</e&.\DfT`,E+j01
Df[I#;BRkP1cR$G0K:dF/C(OD87cfm6")<!2D[$B.l&h73@lp<2`N?D1cI$E2)I<R3%Qg>/i5OJ
2DHp;/1f)P/4a>m/.DqZEaa8F85^Qe2`N]H2DI!F3@rI]+@C0m/1iD)/2Ah92(UIA3%d'K2E3EF
/1iV5/i,LG2`3TH6$-pOF!*hgASc'3/C(OP6ZR?$%15aNEbJlp/4`Y]3&E?K/28h<3AEHDcFtDg
AT/bC6")<"1,(LD.lK4?3%Qm=1,^[>1GCFA1cI?K1b:OA/iGID3B&ZD/1f)\/43uf/.Dq[@3AKk
E+O'!@4XrI+>c&72CpaA1,:X:=Wg(4DCd@j/M&b31bpU:3AE-A3&3BH2(URA/i5C=1,V!A/1apT
6WS(U%15d;Eaa0#B.QSO+>tu30e>:>1H@?EcF"cn@rEnM/1iD./i#F<1,Ug>2)I!H2`N??1Gg^>
3AWEH1+Xt-cF#3%@rEn-$;>#ODIG(e5u]F4/Mo4683p3,:b=LZ/70MjH!r72/70q_1+k:=/28q<
/i,=@1H.$>2D-[D2_m-I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"`n@4WTmEb/ft+E2@>E,Tf+Cc`b5
ATDZs+Eq78+EV:.+DtV)AKYo'+CQC/@;BEsBl5&8BOr;t@<6O%Ec*!rASc:(Df0H(F(HmFGA(Q.
AKZ).AKXZXEc,;s@;[2YH":r(/0JA=+DG\0DfTr.C`mS?FD,Au@;I'(Bl7K6BOtU_ARlomARTY%
+Dbb8ARmD9<+ohcF*(i2+Dbb'F!,17+EV:.+Cf>-F*(u0CghF"Df-\9AfsWiA9)*2+q4lQATM:%
BIl\P+>u)23%R$H2E<ZHc\3K?@rEnM/1iD./iPI81,^m?2E<HO2`WE@1H-pA3AicN1Ft(.c\3oK
@rEn-$;>/CATDm$F"Bj[+?)/<2(UaH3AWWGcFtDeEGR0l/29.B1bpR83&3HE1bL^A/2B4F/i>OB
0JGI;3%d$G0f1aD/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f<NQBln'-DCj)I/4"8l/0[c%@V'S%@<3Q*F!+.bFD5V8AoD]4+sLi;@V'S%Gp4Fb
+A?KYATDm<+ED%*ATDi7FDi:CDe!KiC`m/(A0>i0Ch\!*@ps0rAo_HoA8c=+/0JA=A0>;'Eb0*%
DId=!+EV:*F<G[=ATD?)@<,p%E+Ns,Ch4`"ATDL.ARlp%Afto(@V'S%Gp$g=+EV:.+EqaECh+Z"
G%GP6FDk\uGqL4=BOr;rDf0W<ASc0kFD5Z2+@1!iBl%3#Eb031ATMF#FE8R5DBNM!B5D-%/KeIE
E,T]<Cgh?,F*VV3DepP7Afto(@V'S%GqL9M$;>/DBIltY;BS:\1,V!@0et:V;c4`)0etUF.kre1
/Ke).E\&dn/M&J)0f_*D0JP=A0JP+51+kIE1,L^E/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCd@j<bZS*9PJ!M+DGm>@3B/r@ruF'
DII?(F`(`$@:UKjEb/[$F`M%9CMn'7DBNP0EZek1DKKo;Ci!g'B-;,7BOu3,F`(`$@:UKjEb/[$
F`M&7+EqOABHV/#B5(j.%15dCATM]s/4`/O0ekXC0Jb7<2DI3I/70N"9joS[/70qf/hf.61,(L:
2)-dB3&)sA1G1UA3&NHM/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4WTr@<?[,@;[3,Ec5o8F(&lH
+A?K\F)>>.D.R-nF!,(2@;TR,+CT.u+DGp?BlbD=BOr<(@;TQuDe:,#+Cf(nEa`I"ATAo*Ec5e;
FD,5.9OW$dBjkm%E,T<)+B*Aj@Wc^"B6,2<DBMVeATM]s/g:`39PJ<WBco`\Eb/Z185^Qi1,LO:
1GC^A/2K:/6#pZj/M&J)1bLX@/2T(63B&lP2)[!@3A*'D2_d$E/50JoBl5IQ1H@!PEbR("Bk)'t
@<4"oDfoc8+Co%+9OVF>Bl%Ts+DG^90fLsK%15dCDf0T6@r!Vd6m+6>1,h-H/28k53&*3??Q_XS
E\(QK?S",g2D?[<1H$jE2DR6G0e=n22_HjD1H%*K/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_E\'b"
DJ((bDf021E,ol9Df]?'4!742Df-[qDe!Q*BlbD*+Dbb1DCopC@;odg+E1n#CERP=ATDU*Dej')
B-9``DJ((bDf021@;]TuBlbD*+CfP1FEMV4C`meED.7F"+EqOABHUhsAT/c4ATMg%@rri*Ec5e;
FD,5.Ci<flC`m5+D/FE5BlnVQ%15dO@qfanDIRa/BQ[f9844RW2)@*D/2Jt>2D?[h+@1-j/70r8
/2o1@3@m0L/ho@?1c@-@1H7!I2DR9N1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoF`K#W9QbSkD.7F+
EbAs(+E2@>E,Tf+Cc`b=BOr;[F^o-%Bl7C&EbKT*+D,P4FE1r6F!,[8F!+q7Bl%l6Bl5%R2DZIb
Gp%3BAKYT'F`(`$EZf:4+A?p&ASkmpF`M+G+@C'iDKI""Bk:phEbT)q/g:`39QbDjFMjhjBjiP`
6m+<D2Dm6@1GCgC2(W)W9lFo#?S#P83%cp>/3,XA1GCXG2E!*@0J5@A1H7BL/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"oiDCeV&EccG:F_,W*+E2@>E,Tf+Cc`b5F`V8=_kM$_@3B9*+EV:.+CT.tBk;1(
+DtV)AKYo'+EV:.+EqC<FCfK1+ED%+Bl@l3De:,6BOr;X@V'Ro@j"TZDJ=!0F_kJ/GA(Q.AKZ).
AKXZhF(o`)DJ<Ns+E1n1E,9).Ch\'(A0>;uA0?)0ATD?)D/XK;+E(j7D/WrrEc*I>@<itlDfTrB
B45U!BlbD<BlnK+FCeu8%15g<@<6^2/4`Y]2Dm6J/3#LF3AW53]-'XUE\&dn/M&_21bgO:2DQmC
3&ENK2CpUA/ho(72Dd9B/1f)Y/4a>m/.Dq\@:O4nA8a"i6m+KG0K:j>2)7$E0e?ZS6#Lcq?S#P8
3%d!@/29%;/hf7D0f1d>/Mf182)dHJ1,LO;0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#Lcq6Z6dZD.73f
DBNn=DfBW9@;J"J9jqOMDIdZ.BlbD=BOr<'H$!_6@ps0rG%kc/@:s-oDe:,6BOr<(Dg#].+AZld
+@pWmA9)6l+B`8aEcW@AAft#jCh\!6A7Zl36YU+L+CW0mDf[%3AKZ&4Ch7-cA18XCBOr;rCghC+
Bk&9'Dg#].+C]U=7q#kIBk;*'7q$FJ_l[>i9jr'^F_,kO+AH9SDf0*(+DGm>@3B/r@ruF'DII?(
E,8rmAKZ21ATD?)D..'k@j#2tA0>o(@;KY"Gp$O9AKYi(G\(D<%15g<B5]=l6m+9@2).'A1,L[=
1FulU6Xag_?S#P82D-gB/2oL?1b^^>0JG%93A*3G3A`EH/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QQ
D(J1gEc#6&+E2@>E,Tf+Cc`b6@:sL$BlbD*+AQ?eBl@ltC`lP_Ebce3DBMAiBPDC(Bji-%DffQ$
+D,P4+DGq=+D5D/@:j+_F"SS7BOr<-FCB24@;L"'+D>2&E+Np.+EVNE@V$ZrDBO%7AKYK$DKBo2
Ci!O%Bl@l3De:+Z@;TRlDfB-*A8-*-.!0-6+D5D/@:j+_.4u&:9jq^DF(oJB85^Qc0KD!A1,q'L
0J(MZ+@1-j/3tg@2)RBQ.l0+=1Ft:62Dm$F3A*<J0JYXD/2K4;1,1OA3&N6</C(aV6$73!%15g<
BQIU(Be2eC+>G`/2)m<A3&3BL0e?ZS:N0tu?S#P83%d!H/2B(=/i5@=2*!KE0ek:@2`!BL3%Qg=
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70r(E+gdgH=_,+@;0IbDJ:54Ec5o8F(&lH+AH9XF('0)+@fjXC12:"
+=Jru3'#uKP;+dL3@Q(bF!,C=AKYo'+EV:.+C]A*B4uBuF*&OGBPD?uDJ()5FCB32+E(j76$d*_
@UWtc@;]d%E,T<0Ed98[;eT_bG@>P8F(&cn+EVNEBOQ'q+CT>4De!KiFCeu*GA2/4+C]82BHU)f
@<*J`BOQ13@;R,qDIakbBmO3)Bcpi%A0?))F!,[<Cht5*A9DBjFCeu*@;]TuFCAusDKKH#+CT.u
+E2.*H"CM/DKTf-Ec6)A+Dl7BBk(Rf+DG_7FE2M@ASuU2/e&.^@;0.$85^Qb0f1mA0fLsK1Ft:8
+B2cl/1iD,1GgsK.l&q:1+Y463&`BG2D-gD2E!QQ/2B%71H%0N2)-X5/2An1<+0o#%15g<Ci+*+
/6>,9:b=I`/6>,9:b=I`/64\c1*BV3E\(QK0f1XG1G(::1,ga=0ePFG/2Aq=/i,7@2`!-=/Mf"9
1c.'D0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/64\c1+ZI?E\'LsF^ecs+E2@>E,Tf+Cc`b6@;Ke!CER>4
+CT.1Bl7HqB4Yt!F`S[C@;TQuB5)O#DBO%>+CQC%ART(^+DG^96#q*W@3Bc.FD)e*+DtV.Ec6.E
F(&rsGp%0MEb0?&BHVD1@<<W+DKKH1Ecl>CF!,R<AKYf'D.Rd1Df0,/@;]TuEc5H'Gp%3?EcPSu
AKYDtDf021FD,5.@rGdsF=n\-FE8RGBOP^nDg*=6Ch7$q+@BRXBjtO_@;[33@<?($F!,=.CLnW&
F<G!7E,T]<Cgh?,F)Go:CLq<uBl7Q+F)Z&>/e&.^@<,soCFi"S+>tr23@m-D3&i]FcFY2pE+gdg
/29%=0KCX;0f:sB1G1XB/2B%@/iPOF1c7'?0ePIG1H7?R/1`?t].?`sBIjT"9jr'X@:CcY;BRqX
3&)s=0f(gJ1G$hV+AcW^/1iD)/2Ah73@lsC2D-^E0JYC>/29"71,(R@2E*0</C(LO:h=8j%15g<
Ebf5q/4`Y]1H.*H/2T4E1bgQ,\fb$bCb..h/M&Y01cHs?1b^O>1,q*E2_6O<2(gR;0K(gJ/1`?t
\h$lnCb-#&9jr'`Bk&\b;BRkO0K:UB3A<9G/C(gL87cfm5qF`K0K:d;0fLdB/2]%60J"t91+k78
3&icS/29(90Jk[J3%um7/C(gX87cfm%15g<FCB2@85^Qi2Dm0>0ekF<2)m/4[ieLYB.Q>W/2At;
1GC=80JP@71+kRC/2K+:/iPXA2)dNH1GCF:1,1O@1b:1/cF5?$AS3P'$;FrT@:<t\Be2e@<%Uou
1,1=N5u]F4/M]%3?Q`?C@4Yb:?S!od/iPO:0fLg>1,h$M1bgO<0eP.82`WcQ/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S#2O@4WTsDf03+Ch[<q+E2@>E,Tf+Cc`b6@<u?jCgh$#BlbD=BOr;\Df03+Ch[<q
+DtV)AKYT'EZfI;AKYQ%A79@gATD?m+@g?ZBcpkr@<*K3F^fE2ARfFcF!)l2EcZAE+CT;#FDl4C
B5_6nASuR'F"&5MAfu2/AKXK]@VHrQATMF'F<GU8B5):%+E(j79lFo^Des,r/0JA=A0>u-AKYl!
D.Oi.Afu2/AKYT!EcZ=F9lFo^Des,rDBO"/FCf9)Blmo=+q4lRAR]_'FC?^k;BR_O2`!!@1,:[E
/C(XG7qHNg/M&S61c%-B1,UaF/2Jn42CpR:0J5@F1GCRB/2B(80f(O=1,ga8/C(XS7qHNg%15g@
B6%R0/4`Y]1c@6G/2]FH2`*)2Zli@C@4Wu]0etI@1b1FB0JY18/i,760fUsA3&NTO0Jb7;2_Hd?
1,^jE/1`?tZn,3O@4Vip9kA$[F($Uj;BR\R2`WEE2DQsF/C(jM:NC.l/3tg@2)@*E.kit@2CpX:
1H@!G1G1UG1c.0M/3,=C1GggD2CpC1cFYW'EbR'6$;G)I@Wc3i/4`Y]1,_!D/2K+:3&iJ7[NJ(O
D(It]/20":1bgL90JbO:1bLI:/28h:/hf%>1,1X;1,(=<2_[!I2(U:0cF,8oASit-$;G)JAT2<6
85^Qd1bq'B1bppG2D!.]+@C$V/4!\q0K:mC2(LCA1G^R?/i#F<0f(L90ekF@1c-a<3A*0G1cR0L
/1`?t[4F[_@k8&r9kA3X@;KXq@;[Ve;BR_K3&iHE3&<HH/C(OD6$73!6");u2)RBO.l9(?2_6[9
3A<!D3A*9N1,1^J/2T193A`ZO1G^R5/C(OP6$73!%15g@DJN[$/4`Y]3AE6>0f1U@2([%X+@B^^
/1iD)/2Ah81b:I@/i>OI3&icH1bLIA3B&`Q/1`?tYq/7RF=[k.9kA3XASuT@85^Qf1,q6E2E3]Q
1G$h]+@B^X/1iD-1b^gH/Mf:?1+Y150K(I;0ek:=2_[-E2_6O:2D-dD3B8rV/1`?t\1C!YDCc5(
9kA3XBjrVa;BR\L1,pg>3&WKJ/C(sP:h=Yu/M&S32*!?@1Gq!J/2Jn=3%QpI/iPUA1,Uj=1GpdD
3AE3D1+Xt-cFti+ATB=2$;G)P@;@Db;BReO3Ai?F1H@0D/C(OD<Gc.q/M&J)1+k@>/29%?/i5I?
1GLm@2)['C3&3<G2CpC1cE]!$9joR^$;G)PB43>^;BRhS1G^R@1,LsL/2K7.6>pcb/1iD)/2]%=
2CpU=1+k@<2`E`O/2T7;0ekRA0K(I5/2K7:6>pcn%15g@EbT&u@;]L)85^Qh1,Um>3A`HF1b?qW
+@C08/1iD)/2St60e>(>2_HmE3&!<N/1iY:/ibUB1cI3A/1f)O/44GD/.Dq\ATD^.ALpAM+>GT.
2CpRA2D@*A1,C%P@<F+e@4X)g1c@-?1,CdH/2St61b:LB/i>UC2)R-?1,COC1cR9J3%QU31,CI\
@<F+1$;G)Q@<-I'Bl,Cl;BRhR2CpgI1GUN,ZS<RgEbR'j/2/e91Gp[;3AEKE1bL^E/2B1;1H7-I
2D?[:3A*'I1H76I/1`?tZS=!sEbR'6$;G5CE,8rmBk2@-/4`Y]1H%3M/2T4>1H6r2Z62MCE\&dn
/M&V/2E*0A1H7!B3B9)R2CpF<3A*6F2_m'H/1`?tZ7J@OE\%Y,9keH_F($Uj;BReU2)?dA1,LdD
/C(OD6ZR<#/M&V31cI?F2*!KJ/28b42(UIB0ePIB0JYOB/1i_>/iG[K2`<KD/1f)P/44H#/.Dq\
Bl7EoBlYaq;BRbP0fU^@1,L[?/C/qk89nVp/M&J)1bLUB/28n?/iG[L1GUa;1G1I?0f1[E/1`?u
K.KQ=@4Vip9keKVCghI0@4XrI+>c)50J#+<0KCg<cEn]pBlYaV/28n;2)Zs=1GUd<1G1ID/29.@
/ibU>3&WcJ1G1ID2`*HI/1`?tZn,6lE\%Y,9keKe@;B:&85^Qb3&NHB1,V'J0J(MV+A[#l/4!\q
0JtXA0J+t40fU^>/i#:83&<0@0JPID2_6O7/i#FI0KD!A/1f)R/5L;#/.Dq\Bl[W585^Qg3&)s=
0K:gG/C)!Q6Y1?j6");u1,1dF/MJq;3@m'@1cHsA1bLaD2E!9K/1iV03B&lT1b^I3/C)!]6Y1?j
%15gDEa`Hk/4`Y]1G^s@2)I-K/C(OD6#L3a/M&S10KD'B1GpsI/2Ah32_6[B/i5@?0JP@71GpdC
1,(RC2_6L2cE\ueDIb:-$;G5T@;RPd;BRqT1b:@;1,_*CcF4omATB=f/2/h:0K1L>2)R3A1G1UF
/2T+72E*HJ0K1O?2(gjK2)I<P/1`?t[k(?eE\%Y,9keW[@;@Db;BR\J0fLX<2)mKM/C(LC:h=Yu
/M&S31,Ld;1c[EK/28b93@m$B/hf7=2_[6C1c[0J2DHpF3@l^4cESosATB=2$;G5TH=:YA85^Qc
1-%0B1GCU?1b?qX+@C!S/1iD,2DR$H/MT1A2_6[93B/QM2(gdG1c[?P/1iS8/ibdH3AENF/1f)P
/43-?/.Dq\Bld^"/4`Y]3A`HA0f1dH3%W@d+AcWi/4!\q0JbCC2(LL?2)-X</iPdA1cI$C2`*3F
3%QmC/iY^I2)I$=/1f)X/5Tnu/.Dq\BmO3./4`Y]2)$mE/2f@A2`NA6[NJRE@4X]Q/28q91H?sC
1c70B1+k=</2An5/ibmG1bq'B2)HpG1,UjG1+Xt-cF,9(9joR^$;GGTA8cX&@;^3==ALM'/6G\"
0e?ZS6ZPLE?S#P80ek:93%QgA0J54>3AWQI/2B1;0fD$L2DHa<0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
6ZPLE;K$D\DJ<Ns+E2@>E,Tf+Cc`b6Ders&G%G*"FWbC>+EV:.+D>J%BOu7,+E1n#CER>/+B!,p
@;]df+E(j7FD,5.7`9pl`.N)=aI+/fDfor>@;0U%Ea`iuAKZ22FD)e*DBNA(FD5i>A7Zm%Afrid
1c-=lATVs(F"Rn/9lFokF`)+K=$]b]/N5[@=$]b]/N5[@?Q_dXBe3UB?S!oc/hf172E!0D2_[6G
1Ft+60J57;0JkUF/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe1H)@;]Lj@;]dfDBNn=DfBW9@;J"J
9lFokF`)+?BlbD=BOr<.Ea`KmFD5Z2@;I&rDf^#CD.Oi3BOr<'@;[33ARTV#+DG^9FD,5.iddOf
C`lPsDKKgVJ=S56@3ABTDIIBjDJ<Ns+Cnnu@q?csDBO.:Bk(g!@3BDqDBNA*A0?)7D..<)A79@c
AKZ)5+EV:.+EMIDDIal.AftW)F_u1P+q4lRDfT90@4YJG;c#&(0J$9k;c#&(0J$QR:h=8j?S#P8
0et@93%QjC2D-mG2DmBI/2K"50f:gK1H-j?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:h=8j;e9uYBjkm%
E,ol9Df]?'4!779Eaa-"+DGm>FD,5.Ci=3(ATMr9EbT].EZfFKF*(u1+DG^9;e9uYBjiV'$;GGZ
Bjk[+83p3,:b=FY/4`'+/Pn#S1FulU6tL0c?S#P80et@;1+Y482D-^>1H73N/29%82`<EG2_Zd<
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL6tL0c:gn0OF*),6Bjkm%E,ol9Df]?'4!779EbSrq+DGm>@;[2r
DI[BlDKI"=@;TQuAoD]4FD,5.D/XQ7FCAm$+EqOABPD?,FD,5.:MaPa6YUXf+E(j78nE$cF(&lr
D(Z8)9lG,e@;KagBIl\P+>ku4/3#RK2D!.Y+B3Aq/1iD,0f:aA.l'+@2(UO91bpU;3%csF0JkX@
/2B4<2)dKS1,^[7/C(LO<,u\(%15gJF_G]9DCe=H+>Y]22)[!@1,M!G/70MgEbR(3/70qe/ibX;
2_m!C2`*?H1Ft+51bLRB3&i`N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe1GpF`M83DIFYW@<6?0
E,ol9Df]?'4!779F_G]9DCco=CiaM;@ps1iARloaDesN(+AQihEb-dEBlbD=BOr<&@<-!lF*&OF
Bm+'.+DG^96?R<aBl7?%7U^@V+CT.u+E2.*H#k*:DBNY1E,Tc=@;^00Ec5c*+DG^9FD,5.Ch\'(
F!,C5+EV:.+E1n1E,9).Bl5&8BOr;pEb/[#+DGp?E+*g/ATJu9BQA$6B4rnA%15gKBl7R%/6>,9
:b=U\/6>,9:b=U\/70MeATTJ1/70q_0J5:</2B4<1,^pE2)$R8/iPXI3&NQE1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/43uj/6$%qH=:]*@;[3,Ec5o8F(&lH+AHfhDJ*l1BlbD*+D,&!Dfp+DFE1r(+EV:*
F<G4:Dg-7FBl5&7Dfp/8ATDZ2<+0Zj@;]df+CT.u+E2@>A9DBnF!,%'Df0hCGAhD1+E_a:A0>K&
EZf4AF(o,mC`mG0F*)GFD.RU,F!+n/A0>B)EbTH5/e&.^F_kc2BOtmq/4`Y]1,_!K/2K+:1c6i0
ZQMV0@4Wu]/M&_20ek460JtIC1H@<M1b:452(gdC1GUpJ/1`?tZReI<@4Vip9m(DgEbT&885^Qf
1,Cd=2E*WO2_<7`+@:!b/4!\q0f([D2_-UB1,LO;/iG[?1,([?2E*?F2DHa;3%d!I2`EHM/1`?t
[k'jaD_)>)9m(MeBk1X'85^Qd1GUa;1bgpC1b?qe+B;-E/3tg@3&<6E.lK(<1Ft=71Gp^<1,ggC
2E!9F3%QsA/iPLE0fLd;6#:CHB4Z.++>G`.2(U<(^FWAZ@4WTh@<lF)+=Js&0Jb.#+sL`=+DtV/
D_*#?@<,gcEbTS;D09o0Bk1X)+sJ-]+CTA6EbT!*FCeu*FDi9G,!o^Y@UX:k@;^-1+sII'9m(Mk
@ppoZ;BRqQ1GC@70JbRA2_6[C+@KdW/1iD.0JtgH.kr_80J#(61cR$B0f1L@0K:aD3%Qd</iYXI
1,q0C1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
2.^<4FD5Z2/29+86tL0c9OW$WDBNP0EZc`HF`V8,-QjgZBOr;pDI[BlDKI!kEb/ft+Dl7BBk(jc
DBM5cBl@l:F!,:5An<*/@<3Q4@<Q3m+CT@7F(Jc&@X0),DesB+Bl7u7-tHn*E+is'F`SuS@:jUm
EZee4FE1f"FD5W*+EV:.BlY>)FED)3FD5Z2+C]U=E,8s.Bl7Q+BPDN1CM@m(@<,d*%15gPF)Y],
BOtmp/4`'+/Pn#S3@m]e<%Uou1-$mm+AcWi/70q^1,1OA.lB%<2_6[</iYjB1G^X<1GLUB0J#(9
/iP^K2`<TG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5Tnu/0[JjDJ=0*+E2@>E,Tf+Cc`b6F`VM5ChRBo
D'3P6+EV:.+AQiqF(HJ2H$!_<Ci<s#@ps0rEb/ZqD'3b/+D,>.AM,*)BOr;uBl\9:+D5V'F!,UH
ARlp*BOr<-E+*d&F!,C5+AI!"E+Nj!ASH!(FDi:6DfT\;FD,5.F*2@O+Dl%8DCcoLCgh3mFE8uU
@;]TuF*(i2F"SXG$;JF3Ec5W6/6>,9:b=RV=$]b]/N,.e+@1!f+=pkN?S!oe/ho781Gh'D0f:mF
1H-j:1,:I?2`!HP2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoEH3TS6uQpVDJ<ThDBMhgE-5W+Bk&9)
Ec5o8F(&lH+AKbIEc5W6+EV:.+D5V'+E(j7A9)U2B4uB0BlbD=BOr<*Ec6&2@ruX0+E(j7FD,5.
;fut#@;]TuBlbD.DJ*uuG%G2,@<<W#+D>J%BOu3,E,Tf3FD5Z2+E)-?FD,5.F*(i,@:sFkFCcS:
BOPd$6>pRU@<lF#+DG^9FD,5.7;O)CF_,H4AKYJkG%E3IGA(Q.AKZ).AKXooDBNe)CLqQ0BlnD=
G@>b>A8c[0+D#_-Ed8c_0d&kq@qBLdATBCI%15hI[VfSg/4`/O0f(L>1,:C>1,C^H/70N#BlYb3
/28t<2`30@0JPL;3%cmA/2At8/iYgK1H$s=/MJe43&*6K1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/
BlYb'GA2,>+E2@>E,Tf+Cc`b6_mXGmBHV#1+E)./+E(j7FD,5.E,ol6Bl7L"F<GO6@;Bp,De:,6
BOr;QATD["F(HI[CiFG<Bl5%lGA2/FATDTqDIb@/$;P#CDCe=V+>Yo22_6dB3A`WFcFtDgDIY4`
/20(<3A`6A1,(L82(ggA/28q>/i,:D2_m->1,:I91c7*H2CpC1cFthsDIY4,$;P#GARoL+=$]b]
/N,@8=$]b]/N,@8?Q_aTE\(QK?S!oc/ho+43&`HE1H@HS1b:4:1G1[I3&EHH/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"T`E\&D5Dfp/8+@0U[Bk(Rh+E2@>E,Tf+Cc`b7@;KLcBcq8(@;^-/F*(i2+DG^9
FD,5.;e:#gFD,SD+B)iNF*D&1@3AurA0=f^:h=0O+DbJ(B6@WqATJu&DIal(F!,RME+rfjCi"A>
B5)O#DBNA/+CQC1@;TQuFDi:7Bl\$2+DG^9FD,5.BQ%j$+EV:*F<G[=AU,DBBl%T.@WH1#B-;#)
B4uB<+DPh?+CT.u+E1n#@q?d)D]j.8ASH0-@rH4$F`(o8Bk;?<+q4lS@;g3<85^Qd0fCm?1H@9I
3@rIa+Ad3"/1iD)/2Ah50e>%70J5=F2D?pA/1i\4/het80f1j@/1f)T/5UJ./.Dq]@<6*rEa^Li
;BRqS2`N?C0K(pN2([%Z+@BRV/3tg=/2Jn:3@lsA2(gR<1,h!H/1iS7/iGUC1GCd>/1f)Q/43ib
/.Dq]@<>q!BONG_6m+HH1H@-?1cR6H2(W)W<b6(i/70q^3AiKE/MoIE2_6p@2)Hj=1cI$E0ebF<
1b:483A*6N0JYOE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#5hCb/auD.73fDBNn=DfBW9@;J"J:186Q
F(eu)D.R-nF!,R<@;]j'H#IgJBl5&1@;^?5Cgh3oF^\ooF!,C5+Bi2j@VK7'%15jACMR@!/4`Y]
2)[-D/2o@B2)Qr1Z62JPD_*Ik/M&\11c[*B1,U[@3&WWK0J#%7/i,LA2)[BE/1f)P/4+8n/.Dq]
ASkn!F"Bj[+>bu5/2oI@2_6g@+@0mU/1iD)/2Jn93@lpB/i5RJ0f:d=1cR*G1,q$D1b<ceCMn'7
DCd=r0e>V.A1U&cA7Zl30fUjA.1HVZASuL1ALpA?+>u&41b:L<2)Hjk+Ac`_/70r8/2o1?1+Y.<
/ho7C1-%-A/MfC>1cRHM0fU^>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:hXDk7:UIKA8cL&@;[3,Ec5o8
F(&lH+AQKcEHPh8D.R-nF!,R<AKXooDBNY2+EV:.+DbJ(B6@WqAKZ&5Deip%+C]U=FD,5.8T&'Q
B4Yt!F`S[,@;g0pDJ:58EbSuoF!,C5+EV:.+@0jQH>d[DEb/ltDf0V=De:+\@s)3jDfQ9o:1\Hh
BjiP`6m+<H2E*HD1GUsF2Cr2X6$73!5qF]J2)-s=1b^dB/3#7:0J"q41+kOF2_d0E/2T%53&W]S
2)d'A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6$73!,!ojWB5(dl+E2@>E,Tf+Cc`b7ATDs.@4WO0A79G!
ARloqEc5e;:1\HhBk]+@G@>P8@3BN0Df'3+ASuT46=jtGBjkm%6Y1(UBk&9-EbSuo/g:`3:2+BM
Cb/+T+>Gi23@lpC2D@$?cE\QdAT01d/2/q:3&3'@0Jk[=1+kO@/3#C;0K(XA1c?m:1,(=>2*!KM
0e=k,cE\upAT010$;P;N@<ZF2/4`/O0f(^E0fU^C1c[HK/70MdDf716/70qe/iYgA1,:jB2`ETQ
2D?[=0ePC@1GUXB/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"N^D_+7aDII'i@;[3,Ec5o8F(&lH+AQWd
@<ZF2+DGm>FD,5.GAhM4+D,P4+Dl%=BOu3,Bl5&8BOr;XDIdHoASuF/F!*hjAS!!#@;]_#@:s-o
De:+Z@;]La@4hur:2b2^G[W-o6m+<G1,_!@1GLjL2(W)W:j$_.?S#P83%cmB/28h4/het<0f_-C
/MoF>2)I$J2)[!@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:j$_.,!g6^ASuU(DJ<Ns+E2@>E,Tf+Cc`b7
Df]?3@3BDu@;^-/F)Z/6DJ()+DBO%7AKX]cEGoQ5+DbJ(B6@WqAM,*)BOr<1DfTA2@rH3qF!,(8
Df$V*+Cf>,@VK^gFD5Z2+E(j7DJsT)BQ[lr/0K.MBk(g!D.R-nF!,L7DIn#C+CT.u+N(Hm@<c33
+EqL5@q[!%ARTIt+F.O,E\8OF$;P_]CM>=j;BRnQ1,1=?1,q-K/C/qk;eL,%6")<!3&NQL/M]4=
3%Qg;0JtC:3&<0H0fCgG0J"e22D-aF2E*BJ/1`?uK.Kr6E\%Y,:3CVdCLM*385^Qf2`*HE2`3KR
2([%Y+@C09/3tgA2)7*M.l'+=2CpX:2E!*A1GLLB2)d9F0e>(?/ho%;2E<cK/1f)P/44GE/.Dq]
F`V5)B45R,844RT2_d0J/28q83AN-m+@BRY/70r8/3#7:2_6d@/i5@A1H$s=2_cpD2)@!D0e>(6
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qq@<3tD6#C1RBk(Rh+E2@>E,Tf+Cc`b7F`V5)B45QuBlbD*+ED%+
Bl@ltC`mb4G%G\:DIm6s+@Kp[Bl7Qs@;RP<6#9tNCLJb:GA(]#BHV#1+D,&!Dfp+DAoD]4BlnD=
GA1l(+ELt-D/X;7FD,*)+EM[HFCAm$+Dbt+@;I&XDIdHoASuF/F!+t2D/FE5Bln'#F"SXG$;PkT
D/!R!/6>,9:b=CZ/1b-N6Y1-d?S!of2)R<E1GU[=/28h23AE'?0K:[F1,h3O2_6O:1+k:=3ArTL
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"QUDCeA&DfU+G6Z6CSF<GOCDfBW9@;J"J:3g8bBk;0)Eb/io
EcW@FD]j.8AKZ&:E,oN,AKYK'ART\!EZen(BlnVCDe:+XCLM*'D0^5:Des?)GqKO5:;`cHFD39s
6m+BI3B/uL1b^gI2_8;Y<D?mQ?S#P83%cs?/28n:/i>XE1H79D2DHg@2D@'F0e>(60f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r.9joSJDfU&5B5(dl+E2@>E,Tf+Cc`bVARTIt+=D5P@<*_<Bl5&8BOr;b_kCp]
+DbJ(B6@WqAM+E!:M4NQ/4`/O0f1mE1,^[C0K:jJ/1hu8ATB=R/1iD4/ho781,LpB2DR'F0KC[?
3%d!D2`!0C/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f<NQBln'-DCd@j87cfm,#;ig@3Bc&F!+m6A7]IsGp%$;+D#A-EHPi1@q@26GB.D>Bl7Q7
+CT.u+D5_+@<<W2BR+Z5@ps0rF*)G6DJ+')+DG^9FD,5.6Y1(UBk&9&H$!_<Ci<s#ATJu4AfsZc
ASbdmA0>;uA0=f\Dfff(DIb:@@;]TuD..]4@V$[&ASbdsARlp*D]j.8AKXKOCi"#A;K$D\DBNJ$
BlnVC+sKfqD/!p0+sJW`%15mH@:CcY;BRnR1Gp^D1H.-L/C([H6#g]l5qF`N0Jt[;0f([B/2Ah<
3@lpF2D-dC1,UjD/28q53&WQL2`E9=/C([T6#g]l%15p?Bkq."BOP^g/4`Y]2DI*I/3#@>2E!,4
KHO3'D_+1*0fCgF3A!!G0f(@9/iYU;1,LsC3B&WM1H-j:1,pmA0fC^?2_7L.G@>3"-Y[",/1f,#
/5p%s/0[B&/SJR(Ch5.?8B$R(`N(TMJ=(Iq@3AurA0=]WBkq."BOP^g+CT;%+CoD#F_t]-FCeu*
@<3Q5BQ@Zq+EMX5EcW@;DBN@1Ch[cu/0JtUDJj0+B-:f,Df$V7DfTr5+EVNEF)Q2CBJ(E,GAeUB
Afu2/AKYi.F*&OFASc'h@VfTuF)Q2A@qB`@J<Wc:Ed8d(F_c-ZJ=($n@;]Tu;KZGo+A-QcDKB`6
idd8&DffY8Bk1dmFD5?4+@sJ2CW3>+iddD=CgeGpF!*bdFCB3$F!)mVYoltTD^d4[GA(]#BHV/#
CLqQ06$4bm@:a7d+@0g]BmF-/+=PQg+B)cg.3N&:A0=]WBkq."BOP^g+O>]`;e'_u+q4lU@<-L-
Ch7N9=$]b]/Mf.5/70MrF(6b./70q_0eP=?/2Jn=2DI*M3@lm;1,(C=1bgO:0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL:ig+t,#`2nB45atEb/Zs+E2@>E,Tf+Cc`b9@<-L-Ch7N-BlbD*+A?3cBl5&8ATDW1
AoD]4Ch\!5Ch4`*Bl@l?+EMgF@W-'sF(oN)+B)ulB45atEb-V>+EMXFF_>?'AKYT'EZf(6A7]^k
DId<r@q@8:%15pC@:O4cCFi"S+?)5>0J"q40K1jD/C(LC:gnMu6")<"0JYLD/N#FC1b:@63A`9C
0K(O?0ek[B1b:492D-pE2)%$E/4FGhCh[s(/1f)O/5Tbu/4j`&ASuU$A0>K&EZe=pAKX9QEZdYa
D..<j@j#]%+EV:.+@o3L:189eBk(Rf+@0g\@;]L`+AZT]Bk(]`$;b;UEa^M#5uUT33%um7?Q_XS
Cb/pE1,(F<2_?^=0KC[=0ePFF/2Jt9/ho7C1H.'?/M\q51c-sC0J"t50f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70qoEGR0uDfTAsDJ<Ns+E2@>E,Tf+Cc`b9ATVs$+DGm>@3B5tF*)>@Bk(Rf+CT.u+CT;#BOPIj
Ci<s#@ps0r@qg%1+DG^9F)Q2CBOu4%+A-QmA79?u@;]Tu@3AQF78lQL+BNK%Ch+YZATDL,@:s-o
F(o`-/e&.aBOPCm/4`Y]0f_*L/2B+A1GgZ.YolDPCb..h0JtXH2D$^A0Jk=9/iGR<3&E6J0etLA
1b:471bLI@1bg^=/1`?tYq/7\Cb-#&:hXEMA77#[;BReR2)HjA3&!$@/C(RE<D?mQ6")<!0f:aH
.lB+>1+Y151bgO92`NEH2)dEP3@m$D/iG^H2`3QG/1f)Q/6,DQ/.Dq_BOu4"@:Uo[;BRhU1Gp^B
2)%$L/C(RE<D@0Y/M&J)1G1@8/2B"8/ho=@0f:X92_cpE1Ggd?2_6L2cEf'%9kc-f$;bDSASu3l
BjiP`6m+3E1,:aD/3,^L0ek4[0fLdB+@1!`/70q`0JPC</MJk91+Y@:2`WEF0Jb=<3B8lQ2CpF6
/iYaI3&iWD1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD'0fLdB/4"8l/50Va@;]XtAKYr4DfBW9@;J"J:hXcY
DJ<Tp@3Bc&F!+n/+CT.tBk;1(+EV:*CghC+De!frFD55-@qg+#Ch[s!FD5Z2+E(j7FD,5.9k@jL
FCfK5@;]XbDBO%7@<<W1EbT0#DIIWuA0>K)Df$V=BOr;pEb/Z%De:,/De*F"DCoC-Gp#dl@UX.m
DCuA*:ha?\FDl4O85^Qd1,_*C1b^mK0eCV^+@C$V/1iD)/2]%?1+Y.82(gU>1H@-D/2B%70JYC>
0ek41/C(jY6Z-Bb%15pGDI[U1@4Xr;+>Gc22D?s=3&i`L1b;uV;eL,%?S#P83A*3J/2B.</iP^K
3&ilK/M]:<2)[-H2)Qp?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;eL,%6YL1MARTI!E,ol9Df]?'4!7@6
DI[U1@3B9*+CQC)ASkjlAKZ2*FCfJ8F)Yi6BlkJ0Ec5e;F)Q2CBOu4%+@BgVCh7$m+DlCGBQ%^*
B6bVDBQ##-F!,O4Bk/?.D]iM0Bl7Q+A9)U4DIm?$F(&d!DfTnAFDi:DBOr;R@;KLt@q]ErF)N1C
BOQ!*FD,62+Ceht+Dbb8AKY])+EV:.+CSl(ATDU$An<S($;bGUBl[p)@4XrI+>tu41+YC?2)I0A
cFbnT;e'_s5qF`K2)6s>1H7'C/2Jn92CpU@1G1@@1H@6O/1iY;/hf"=2)@*@<+0HSFD50$/1f)Z
1+Z@6D_*)(DBMneBPDR&/0J@DFE1f#Bln'-DII?(F*)>@Gp$gB+EVO<A0>f&+CQC%Ec6&5ATAo%
DIal2BleB-E\&>N@;TRd+AcckBl[o1@;]Tu;IsNa@4WOFBQ##*Ch70#FD,6"EZf=0Eb0-1F!,17
FDi:DBOr<-CO%%2DIal!ARfXqAKZ&9@<-EA+B3#cBlY>8@<,psFE8R7@;Ka&FD,6&+AcckBl[o1
D.+Q2BPD9o+Cf(nF(oN)+EV:.D'3P1FDi:DBOr<-CO%r`D.+P2,'RaCBIk97DIaq8+DGm>F`V,)
+CSl(ATAo2@;TRs+EVNED.R-n+<i"@F<G"./g;J^8T#YhDIjr!@q0G"DKIEPFD,5.@q]RmA9)7!
+C\nlDf'&.;eTT^CgeGpDIak`ATM:%BHV#,+EV:.+EV=:+E(j7FD,5.FCAm"+E(j7;e'`dE+s5A
+CT.u+DG^9@;^"*BOu3,FD,62+C\nlDf'&.9m+=Y+CT.u+AI!q\KFg\DfTf2BeEV"Blmd*Bl@l3
DImBiARo'h-qS;!@3BW*D/!fpEZfO:EcYr5DBNk0+EV:.+EMXCEd8dLDerr,Bl5&8BOr;RDf9D6
8TS]VDIdf>+EV:.Gp$R-@rH3q+AZicB48Zf+CT.u+AZicB48Z_+B)cgEc>`,.4ueR$;bGUDesN9
/6$XY;_9dV/64J^1Gg4FATB>//70q_1+k@A/2B+C/hf%@1,Lg=1H-pD1c@'I2_6^<0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/64J^1GgXRATB=G9PJ'JBQRg'F*(u-DBNn=DfBW9@;J"J8T#YmBOr<&De!3l+Co1p
Ch7*u+E(j7<,u\aF(K5uATDE7+AcckDesN9+DGm>@3B$"BkM+$+CT.u+EhI?Bjtmi+C]J8FCfK)
Cj@QS@;Kb&A8,po+EVNEFD,5.E,ol9ATDm,ATJu4AftM)F*(i2/g:`3:i']WDf0,;85^Qb0fUj<
0fM'L0e>(>+B2cl/4!\q0JbOG1+P+:0K:U@/hf.62)d-C3ArfP3%QgA/ho.?2_d!;/1`P9/6$&#
/.Dq_De3rtG$upm6m+6?0et^I/28k;0K:m??Q`<j@k:t<?S",g3&3$@2)6dD1Gh$I1+Y"73%cs?
3B&`K/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#0!@k9ucDegIeF)59&A9/l4Ec5o8F(&lH+AcufEaa-"
+DGm>FD,5.GAhM4+DG^9FD,5.6Z6mY+A$Wj@;]Us+AH9_EbQY4@;]_#@:s-oAoD]4@3BApEbAr+
D0^2EBk(Rf+C].q@r!3+ARTUq+E(j7F`__:EZeh&@<H[;+CT.u+E1n4An>IoBl@lA%15pMCgh?u
F"Bj[+>bi1/28k<2E*24Yom%@Be2PY/2/h80fU[C3AEEC0ePIF/2K4;3AiWN2DHaB3A*'F1bg[E
/1`?tYq/mLBe0]#:iC/YEbTS;6$76jEa`cuF"Bj[+?)&23%Qd<1c%*H/C/qk:LeJt/M&J)2(g^C
/2K">/ho@D0fCj>/N>^B3Ai]O3B8WA/C/r":LeJt%15pMCh[rA85^Qg3&*0>3&rcO0eCV_+B)on
/4!\q0fUmD3%Zm?0Jk=:/iY[=1,h!A1c-mG2_Zd71,1C82)mQO1+Xt-cFb],B6#O4$;bYWCistR
85^Qc3B8cE1H.9K2D!.Z+@g![/1iD,2`*BJ.l'(<1+Y.40fCR;0fCX?1,q9O3%QgE/hf%=0f_6F
/1f)P/4X8g/.Dq_DfTl4D.+td;BReU1,UU@0f_'F/C(RE<bZS*5qF`G1bgp@0JP=A/2Ah:1b:@A
0J51:2).'F/1iS/1c.3K2`!!9/C(RQ<bZS*%15pP@:`q_E-5S?85^Qe1,Lp@2)@!C3@m!F+A>LD
/1iD)/2Jn;3@lmC1G1I=2`WZQ/2K+81,1UF2_lp8/2T799MK4P%15pPBl.9$89nWSF_r[#;BR\M
1c?m?0JY=>/C(RE<+0o#5qF]H0f_3D0f:aH/2Jn:2(UXB/ibaJ1Gh*C0f:RA1,h*J1Ft(.cEf'$
@<F+1$;bb]@sN!1/4`Y]1-%0I/2K4?2`WG7YolD.Be2P$0K1dJ1Fk.:0f1F8/i5750ekL;3&3?J
3AW3D/i#1=3B8lH/1f)O/43-G/.Dq_Ec5o>F"Bj[+>P],2CpUD2Dm?CcF4odASita/2/t:1c['A
1,CU81G1I</3,L=2_d<L0JtC:1+kF<2E*WQ/1`?t[k($\D(H,':i^K!Bl.9$6Y1.W@<HU)/4W;T
2)R*>7nOm]2)-Z-YolDFDCe.+0f1[H2D$g@2)$R90eP.7/2Aq=/i5=C3AiTD/N,@:2E*WQ3&E0;
/C(LO6Y1-d%16!ADCe=V+>GQ01b:@>2)@0BcF"c`EbR'V/2/k91-$p?3ANNE1G1UB/2]491,C[D
3&`B?3A*-G3&3?O/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f<NQBln'-DCj)@/4FSn/0[u#DBNY7+EV:.+AQiqF(HJ,De*BiF)rIBAfu2/AKZ&*
@4WOFBQ##7FD5c:+E_WGFD,5.G@>Z+F!+n/A0>AjE--5CATJu8@;0OrEcW@IBln#2BOu3,DImoB
+q4lW@;]L)85^Qb0f(^=0fLmI3%W@^+@U<b/1iD)/2Jn91FtC@/iYR@0K:sA/NGFB2D[-L1+Xt-
cEo,kEbR'6$;t;OATViA844RT2)@6M0J#1>2)I6C?Q`9WD_,6H?S",g1H@!A2)['A1,q0I3@la=
1G1I;3B&lN/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,cD_+UkCggsbF*SmIEc5o8F(&lH+AuWeATVi5
BlbD*+D5CsDKI"2Eb/[$F`M%9Ao_g,+AH9\@:s"iGp%3;Ch7Z?%16!AF(&lnF"Bj[+>Z#32(URD
1c7-AcFb8nAT'+O/1iD//iYgA0f1jB0f^pJ0Jb782D-[;2E<WN/1`?t]IZ`fD_)>);IOWTChI=$
BPB"g;BRkS0K(IA1c$sG/C(LT+@p'a/4!\q0fLgD2CgL=1,CI;/i,F;1,V$D2E!9M0eb.51bLRE
0JbL@/1`?tYq[e#ATB=2$;t;R@;KUcB6@c:85^Qg2)R9C3&WHH1+^_U+AZri/3tgA2`!9N.kre8
1b:C70K:U=2DZsE1G^pE2_6[=/i>O@0JbR;/1f)O/5L4u/.Dqa@<6O!@UX.*85^Qg2)@-A3&NTQ
0J(MT+@L6Y/3tgA2`!-E.lB(:3%Qg;2`WEE2DQmC0K:dG1b:L>/i,191H7BG/1f)P/4=Me/.Dqa
AS6.%F`T*);BRbU3&3$A3ArcU/C(LC9P&,n5qF`E0K:m>0ekOF/28b52CpR?1+k7@1-%6J/28k3
3ArfO0KC[8/C(LO9P&,n%16!EG%#K,/4`Y]1H$s=2)d<M/C([H:ig+t5qF]E0f(a=0K1dF/2]%8
0e>%=/i5@>3&WTE2_HsH2)@*H/1`?t[Ob6r@k8&r;JBcTCb/+T+>Gf01Ft:<1c%$@cE\QgEbR'j
/2/q91c6j=3&*0>0J5(>/2oO@2D[0H2E*0=3%cs?0fCgI/1`?tZ7JdlBe0]#;JBcXC`lA^DKK<0
EclFS85^Qf1c79E2_d3M1G$hV+@B^X/3tgA1c%-M/N,:?0J"e0/hf"21,1dA3A<3B2E!*<2D?aC
1G_$M2(U:0cESofASs%.$;te`@;KXdA7]7ZF*)G@/4`/O0f1mF1c$[B0eb@</70MqE+ge0/70qe
/iYjB1,LsC1,1OC0et:8/hf7A3&3HE1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5L4u/0\#3@;]e#BHV87
DfBW9@;J"J;K$VbCh[<#A7ZlN@<6O2D]j74F!+m6F(o9)BkD'h@;^00Anbn#Eb-A3AfsTPCh[Bn
@;[2tF_l/BEb-A%DIal/Ec5f/DIm^-+B*5fDJ=0*+Eqj?FCfJD+EqL;F(HJ5Bl@m#ATVX(B-;D:
Ebce9AoqU%+ED%*ATD@"@qB0nFD,5.DJ<`sF<G"0A0>AnCh7[0Bjkg#DdmHm@rucE+q4lWDffE*
ATfUq;BRnX3&3$>0JPLE3@rI]+@KdW/3tgB0JbXF.krk:2CpX:2Dcs@0KCaA3&`TK2(UI=/i>XH
0ekO:Eb0E*EcYf&+A?3cBl5IV3&*64:gn0OEc#_;;flGg+@BRZ@;KjpF_*,LZ7JCTCb-bm+BE&k
@<?F.+ED%:ATDj'A0<9qBk(XkCi:F`@:Ne]@<?F.AKX/Z:2+3VCghI-+BE&k@<?F./0JtEF)Z&8
F(o*"AKYT'EZd(r0f1"oFCB24@psIfCi<s/ALSf4$;u"VBOYC`/4`Y]1b^^:2E!NQ/C(UF6Xb$e
6");u0etUG.lK(91b:C72E!*A0eP:?1H@?M/2f171,CdC3&E0;/C(UR6Xb$e%16!UCLU^o/4`Y]
2`!9M/3,RD1cHu2YoltXE\&dn/M&\13ArED3A<'G2_d0K0J"e40J57<2*!KI/1`?tYq/gdE\%Y,
;dj-LCFi"S+>u#73%R$G0JP=6cF4olE+gdg/29(<0Jk@92)I-@1+kC>/2B(A/i>XG2)70C/MT+8
2_m3M0K1O6/C(^U:N0tu%16$B@r,RqASu3585^Qb2DHs<1,CaE1G$h[+@1-j/3tg@2)$dC.l8t7
2(UO92E<<I2(gdA3AiTI/2T(60K1jK1H@![@<?4$/1f)T/4"E!/.Dqb@:WeVBOY[a/4`Y]3&NEM
/28k51H@<DcEeWZEH3Tr@4X/h1,1^>0JP==/2Jn<2CpX?2(g^?1b^gE/1iS/1H7<L1GgX6/C(RQ
6#gor%16$BA79:`@<-'585^Qi2E3NE0ekFB1cR&3]HC$^B.PVc/M&\12)-X<1bp[@0JGI?3@lpB
/iGC<2)dHF/1f)Z/5Tnj/.Dqb@:We_D.RNtCFi"S+?2241b:@83A<BK/C(LC6#gor5qFcH0JtgA
0JG4A/2Ah<2(UO>0eP:>2*!WP/1iP.1GLmL1c[*</C(LO6#gor%16$BA79:qF`h4G85^Qi1,C[:
0ebL@2`NA6Z62GQE\'L-1,1R>2D$U?1GgX</ibU:1GU^<3&ioW0f:L62(gaF0ekUF/1`?tZ7J:]
E\%Y,;dj3W/4`Y]2`E`T/28h41c7'?cEeW\H"SZo/2An71,:@:0JPF91+k=</2Jt;/i>LF0KCj=
1b^O;2)[?O3@l^4cEf&hH"SZ;$<(AG@<-3nFD,)6844RT0JGFE2_6gE2)d9A?Q`$RD_,6H?S"/h
1bpU:2`!'H2Dd<N3@la=/iPXF2E<WG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/50Vn/5Bbq@;KLrAKYr4
DfBW9@;J"J;dj<IEc#6,BON#tF!,R<AKX`ZE+*Qs+DtV)AKYT'EZfI;AKYZ#B4tjtF<GO6@;@!"
DBO%7AKZ28Ebo8/-t-q5D]ih5Dg-(A@<3PcDfor>+@UHbEb0<6.3N&:A0>r=D.7F"+E(j7DIIX$
Df0!"+E2@8A7Zm%Afsi[E+*Q8%16$BBlI`:85^Qc0JG=71,h!I2D!.b+A[#l/1iD)/2Ah32_6pH
/ib^J0etF6/NGFA2E<ZL2(U:0cFPQ&EbR'K<,uDXBln'-DII?(DIIBn+D,Y4D'2,b@:Eq\3[!(]
gPjg:+P<UFK\3BYW7\$#Yon*rH"J1-Cb9C1@Ud9,E\&>LBlmp,@;Kb*+=D5=BkAJ9-ZaKMEb$OH
+E(j7FD,5.B5(dlF=/[b%16$BCi(^o;BRqY3%um<0f:^D0J(P'+AcW^/1iD)/2St:3%QjC0J5(;
3AWKH/2B"62`*3E1H$d8/C/u#:h=8j%16$BDKBr<@4Xr8<%Uou1GgXR5u]F4/Mf47?Q`9[ALq1>
1,(F<2_-UB0K(I:0J5.9/2Jt9/ho@D1H$s=0fUd?0JkaF1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,
B4WVg@;L$sF(HJ5Ec5o8F(&lH+B)]dF*2A/+DGm>FD,5.DIIBn+E(j7FD,5.D0^5:Des?)Bk(Rf
+D5CsDKI"5Ec5e;FE1f#Bln'-DII?(9jqj[ATME*AoDL$+EV%.ATJu9BOQ!*@psCuBk:ftFD,5.
F*)><ATJu4Afu2/AKXK]H>apCAS5FfBln$&@j#l)D/a<&F!,C=+D>>,+D>=pA1e;u;dj]Z@<3tj
;BRkT2)?dC2DR$I/C(aJ;e'_s5qF`L1H.*A1c$g>/28b:2CpUA1bLR>3B&ZI/1i\6/ibpN3&3<A
/1f)V/5p%s/.Dqb@<-("/4`Y]2Dd-B/3#IB2`WG7ZlhnNE\'Lb/29(<2)$O91c6s<1G1C;/2B(B
/iPXH3ArZE1,LUC1H@3E1b:q7CghB-6Z6OPBe1g\Zn+aZE\%Y,;e'BXFE2M@/4`Y]0f1jE/2Aq;
3A`9E1E],,Be2P$0JkRF1+b4;0fU^@/hf%32E<BI1c7!A1b:451bLR<1b^XC/50JoBl5IQ2)?dP
EbR(:Ec5e;FD,5.Ddmd+Ch7^"+Cf>-F*(u0CghF"Df-\9Aft#^AT2a3F_r6fEa`irAStt"EbB)r
F_qQp;e'KP@<=%k;BRqX2`3-@0f(dK0eCVU+AcW^/1iD.1GCUE.l'(<2(UL81c-a>1c6mG1c%!J
1+Y1?/hf7?2`NZG/1f)P/5Tnj/.Dqb@q]Fa@<*ni;BR\P3%Qj?2`WG7YolDBF"Amo0JG=;2(LOB
1GUL:/i#770eb471,_*J3%QpF/i>FD1G^a:/1f)O/43ie/.DqbARfk#A76TOH!t6+D(J4U+>GZ2
1Ft:81c7-AcEn]n@<F+e@4X)h1,CU70fLmD/2Jn;3%QsF/iPRB2_d<D0fL^B1bppC1b:1/cEo-%
@<F+1$<(MKBl5Im;BRYN1bpUA3&ifIcF"c^@<3tO/1iD//i,@91,pmD3B/uU2_6jC/iGXB0eb=5
6$-pOF!*hgASc'3/C(XS6Xb$e%16$FB5)7+F"Bj[+>ku32(U[@0K1j?cEeW[Df70m@4X,i1GU[8
1H7*K/2Jn41b:C:3%cm>3A`WP/2K7<1GCdD2)-X5/C(RQ6>pcn%16$I@;RPd;BRnT2`WEL2E*KP
/C(LC;eKYm/M&V:1b^X70fUjA/2St83@lpG2(gR<1bgdB/29+:0JP@C3AE'9/C(LO;eKYm%16$I
@;TF(844R\3AE3J/2]:C2Dcsl+A??b/70r8/3,=;0J"q;0eP.=1,C[F/1iS/2)70G2`!!?0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL9P&,n,#D]`BleB)DJ:54Ec5o8F(&lH+B)r^D.+Q$F!+n/+B<GmFWbL7
FCfK$Ed8dLATDW1D.R-nBl7Q+@3BW.@;Ka&Cgh1"+E)9CAo(mmALnsFH#7#/Ch[B%De:,6BOr<&
BkM+$+E(j7FD,5.F*(i2/g:`3;eTT[C11d,84cW#2`W]N0e>7D1c$j;?Q`9WD_,6H?S!od/i,=8
1,Ld>0fLpC3&E0<0fUdF2`3HH1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,@rEnB<GlMmARloLEa`E"
7;ZaZ@<?(%+E2@>E,Tf+Cc`b<BOPpr@;$ctF!,R<AKYK*Cijf?@;I&r@;oq&@;I')Aft)kBlmos
+@1$V@N\*VBl[X(ATKCF@;]Tu@rH7+Bk1dqARlp*BOr;rBlnVCDe:,-DJs`8ARoFb+CoV++EVNE
BlnD=D..=-+D#)+@psInDf0!"+Ceu#FCfK6/0JYEF*),<F`_29/0JePF(KK2F"AGMBju*kEbT*+
+CT.u+D>>,BlmcrAKYJoDKKH1F"SXG$<(VHF_kJ;85^Qg2)7*A3&N]O2_<7d+B)cg/4!\q0fLmE
2D$^D0K(I:/iGI91,^p@1b^[>2E*0=1H-p@0Jb[D1b:1/cFYW+@rEn-$<(VLCh[<n/4`Y]2_d!E
/3,IB1,(9)Z62hdE\'Lb0e>%=2)$a81G^dA/2Jn91+Y1?1+kF=3B9#X/2K(71H%!H2E36=/C(OP
9R1Y0%16$IATD4$@;[Ve;BRhS1FtLG0Jb9*Z62GRBe2P$0JPFA2CgO:1c[*B/iGO;1,pmE2D?gA
2CpU;/iYOE0JbF7/1f)P/4";j/.DqbBkq-.844RT3&*?I0J#4A1,^m=?Q`9[E\(QK?S",g3&E0A
3A<'E1,(XG0J"e31+kRA3A<<H/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,gE\'^o@;]Lf@;[3,Ec5o8
F(&lH+Dk[uDK?pJB5_Ts-Qm,@+EV:.+@UKc+DbJ(B6@WqAM+E!;e^8dF`T*);BR_O3AE'@1,CaI
/C(LC6VUu?5qF]J1c7!>0fCjE/1iS/1c-a<0JP183&`QL2(U=62D-pC2DHpE/1`?tYq/7:@4Vip
;e^>rCgekc;BRqW0eb.50ekUA0J(M\+@1!f/3tgB1,CjK/MK"91b:L:0Jk=:1H@'E1H@-K1b:48
/i#1A0Jta>/1f)X/4"8r/.DqbCLM<985^Qi2_[6C0ekI=1H$f0ZlhYSE\'L-/M&\11,ga?1c$aB
2DR-I2CpF72(gjD0K:gH/1`?tZn+L_E\%Y,;f?J\EbTSG6:<=Y1bCOA2*!3S6n9uK/Mo=B3@nM[
:h=8j?S#P83A*6M/2K"?/i,LJ3AifJ0f1L@3&rcS2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)AS3P<
:iC/aF(c\8Ec5o8F(&lH+DtV)ARlolAoqU)+B*2p@<-('/0J@DDJs]0C`m24+B*AjDJ=12JmijG
9P&&n+q4lXE+rfj/4`Y]2)$mG/2f@B2`*)2Yom(]E\'Lb/28q92)6a<0ek@50J5@F/2An6/i#FH
1,Lp@/MSt40fCaB0f^dY@<?4$/OshiARfX16=F>KCi=3*@;[VIcESp$BlYaK<+ohc9OW$WDBO%4
Ebuq5F!+m6FE1f-F)59,Bl@l3De:,6BOr;VEb/ft+O>\dK[-[FLX1\#Jfo8NBk(g!BlbD*+EVX4
DKBW&FD5Z2+E(j76#17EA8,Ii+EM4=@WcL/FWan)Blmp,@;Kb*+Eqj?FED)3+EM4=/RiiSF_iXO
FYmAT+CT)&+Dk[uDJ=!$3Zr!BEZf:4+D5_'Bl5OI%16$UATDg&DJilmBQPdr5u]F4/N,.N5u]F4
/N,.e+@0mU/70r8/28h22)Hj?2)HpE2`*9D3@m!B/i5ID3B&`F1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/4"/a/4=W&@q[!(Ec5o8F(&lH+DtV)ARlolAoqU)+B3#c+B*AjEcQFJ:2+?SF<G%<+BE2o@qBP"
+Eh12+@g?_BJ'`$;fm%o@W-9<844RZ2)mTU/2T.@2`*'m+A@&u/70r8/3#791Ft7:1G1LB0fD!O
/2K(70JtaJ0et:80JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,,"$Bh@<?3lDBNn=DfBW9@;J"JDIIBn
A0>;mFCfJ8;fm%o@W,m1+EV:.+D5V'+E(j7GA1r*F!,17+B*)bG%kG/D0^5:Des?)GqL4<FE2))
DfQt7F!+n-F)N10+Cf(nEa`I"ATAo-DBO%7AKYH#DegIlEbWIOAKY]5+Cno(DJ=!"+=KTtDdda%
@;[2e@;KLr+E(j79Q+f]+@0XY.3N)F+A$`bDIFYSEboI.LFl5/`P-J8@;]etLFsb[$<)(UCi<ft
DCe=V+?);72CpR:0f_*N/C(LC6tL0c6")<"0Jb^I.krn=2(UO92`E9D0KCaG0KD!H0J"q9/ibXA
0K1d=Eb0E*EcYf&+A?3cBl5IV3&*64:gn0OEc#_;;flGg+@BRZ@;KjpF_*,LYq/:SCb-bm+AQW\
Derj)F!,L7G%G]8ARlo3:2+3JDes>76XaJ7Bjl+%Eb-@W+AQW\Derj)F!+LpDIIX*E\&>RATMg/
DKBN$Ch4`$DfQsT3&*64F*(i2+Cei%@;KjpF_*!G%16$V@WGm.85^Qd3&NHB1cI9G3%W@i+A??b
/4!\q0KCsE1+P%=2)Hj?/i>C80f1a?1,q3N1b^I@/iYjH1GCd>/1f)]/50Vn/.DqbF_G2tCb/+T
+>Yo31b:I?3&*<BcFY3"AS`nL/20(<3%up@1GUj>1+k=</28q=/ibpO3B8lH/Mo791c$mE3&rN@
/C(jY<b6(u%16$VCggpaF=]s\+?)#63%R'G0f_'AcEeWeH#bGf/29+A3&rKF1,L^:1G1F?/2B1A
/iPRD3ANQF1GUR@3&riR2_6L2cEf&qH#bGF$<)4jD.+td;BRhQ1H6pD3B&WH/C(dK<bZS*/M&J)
1bLI@/2Aq:/het82DR'>/N,480JG@@2(U:0cFGK,BlYa6$<+loD..]u/4`/O1,(RE1H@!@0K(mG
1b;uV:ieoR?S#P83%d'H/2K%</i>FB0JPI:/Mf+62`!BL3&E0A0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
:ieoR;fZRp9OVgS@;[3,Ec5o8F(&lH+B-40D..]u+Dk[uDK?q>ART([+DG^9FD,5.;e^,_@;KLr
AKYetDJ+*#B4W\)$<1GCBlkms;BR\O1c$[<1,LgJ/C/i&+A[#l/1iD,1c.3P.kik=3%Qj<0f^dD
1+kCA0JG=@/2f+@2DHsG2(U:0c[[f&:NC/#%16'CBkq-.83p3,:b=LX/4`'+/Pn#U0J$QR9OVE^
?S#P80ek::2(UO>2(ga@1,q0L/2T4:1c73J2E!*A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9OVE^9PJT^
F^]0%@;[3,Ec5o8F(&lH+B2c`CLJ?&ARTIt+E1n#@q?csDBO%7AKXZ\FD,f*DJ<Ns+DbJ(B6@Wq
AM+E!<+0Kd@;]_!BQ&#E85^Qe2).'A2)d<O3@rL3+B;-E/1iD)/2Jn:3@lmD2D-jA1,UpL/2T:<
2`E`R0K(I5/C0)&<D?mQ%16'CBmFDD85^Qe3AEEC2D[$G2Cpg16ul]e/M&J)2(gX?/29.@/iYaK
3AiNB2Dm*D1H73M1b:1/3%RI<@4Vip<+0TWFD,)685^Qd2)[HG1c-pB2_<7b+B;-E/4!\q0K:pM
1+P1@0Jb79/ho+40f(X=3&!'H3A<!@3%cmA0fUpH/1`?t\L^`T@4Vip<+0ZWEa^M#5uUT31,1=]
5uUT31,1=e+AcW^/70r8/28k32)Qp@1cI$D3ANNK1Ft7?/i,LG0K1sB1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/5Tnj/4+JqB45gp@;[3,Ec5o8F(&lH+B2ceB6%E'BlbD=BOr<-F`;A4D.Oi"ASbq!FD50"
+D5V'+EV:*F<G.'Ebp"D6?R*W@<-E3GAhMCBPDEsA1e;u<+0ZY@3@jYF*)G2Ch[rA85^Qe0K(pB
2)%!D0eCV_+B;-E/3tg=/2Jn42CpR?2(gaG1,:^@/2T(61c[QR0f^d9/C(mZ<D?mQ%16'CDJ<N%
6>pmU@;KY!/4`Y]1b^^A/2]+;2_lr0]-(*J@4X\q/M&\11c6g=2)Hp@2`*3K2(UR>/ibXC1Gq'A
/1f)Y/6,DQ/.Dqc@;odfF_**p6m+BD2`<NE1H7'F0e?ZS6Xb!d?S#P83%cp>/28k;/ibdJ0fD!B
/N#@;1,^sD1c-a=0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Xb!d6>p[SG%kB&+E2@>E,Tf+Cc`b=@;odf
F_)\4ARTIt+D#Y+Ec,<%+E1b2BHV#,+@gQ_Ea`j"+CT.u+ED%4Eb0<'DKKqBFD,5.9keEZGp$0s
Gp%3BEc6)5BHVM4Bk(g!FD,5.Anc:,F<G:8BOP@aFCB'/F!,C5+EV:.+@T^ZFD)e*EcPl;ARlol
DIal"Dfol,+ED%8F`M@P%16'CEaa9*A1U8L+?)/52(UaH1,h0DcEeWZEGR0X/29.A2DZj<0JbX=
1+kL@/2B4D/i>OD3AEBB0eb4<0f(RC1+Xt-cEf&fEGR08$<1GSAh6JN+>Yc03@m!@2)7'@cE\Q[
DIY4`/20%<2Dm!=3AE6>1G1O@/28n:/ho+@3&<NF3A*$G2)R3I/1`?tZ7J@\@k8&r<+1&bATV?3
85^Qb0f1a=0fLsG0e>%>+B2cl/4!\q0JbOC1+P+:1,pgA/i,142)['C0JY=?1Ft:</i5IF1,gm<
/1`M9/6$&#/.DqcAS5joDIk@i;BRbN0K:U?0JPIE/C([Y+@C$V/3tg@3&*0D.krt=3@m!>2E*0A
1,CO:2)?sF0J"q;/iGOF3&33>/1f)T0e>\0@k8&r<+TfQF=]s\+>P]32CpX<1Ggm=cFb8iASita
@4X)j1,CU71,:X?/2Ah;2_6sH/iPU@0ekF71,:I>0f([H1Ft(.cFb\uASit-$<1SWAR]4eCisSG
85^Qh2*!TH3B/]N2D!12+B)on/3tg=/2St<0J"t>3%d3K3B/fS/1iV8/i#FI2)@'?/1f,(/5p2%
/.DqcAThX$/4`'+/Pn#Z/1b-N6$73!?S#P80et@:2CpR;0J5(<3&NTR/2K4;0f1RB2)-X;0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL6$73!,"Zir@:a7h+E2@>E,Tf+Cc`b=AThX$+Dk[uDK?q#DJ=9*EcYe7
DfQt3G%G]>FD,B+B-:W#A0>>mB5)7)+EqOABHVD1AKYf#FED)7+B2c]/0K%JAKYetF*&O@ATW$*
EZf(6+EV:.+@p'QEb0G;@;Kmr@:Eei/g:`3<+oiSD/!l=85^Qb1c@0A1,1RF1G$k+1*B#+Be1he
/M&\13&)sB3%d0M2`<QJ/1iY3/i>OB1Ggg;/1f,$1+Yk7Be0]#<+pD`@;[Ve;BRhP3AE'C3&`]Q
/C(LC6ul]e5qF`I0JkU:2Dd0F/2Jn:2_6^=0eP.?2_mBJ/2f=;1H.0N2)-X5/C(LO6ul]e%16'K
@;BR.85^Qi2D[6B0ekF<1,:E+Z62YXFY#*q/M&Y00et:91b^O?2E!NR2CpF:2D-sK1c73M/1`?t
Z7JLdFY!t/<,#cYB6@X#/4`Y]0f^sB/2B+?2)-Z-[NJOXFY#g0/M&Y03B&KK1bLU>0ekXJ/2Aq4
0f1XC1c-a7/C([T<+0o#%16'K@;^@)/4`Y]1cRBL/2f7?1,CI?+@L6Y/1iD)/2]%:1Ft7@0ePFG
1GCgL/2fC=2`WQJ0JtC4/2o+JEa^L.$<1_VBlYaq6m+3@3&EBL/3#=A3&`Bq+AZri/70r8/2f+?
3@lpB2_Hg>2_mBO/1iS4/i,LJ2D[6B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5L4u/0[DhDJ*coA7]gq
BcqA8DfBW9@;J"J<,$2`EZf41@;^-/A79LoDImm1+DG^96=k%I@;KX#Cgh3oF^\oo/0JA;Cis9&
DJ()6D]j.8AKZ&9@<*K"ASH$p+D,&&+CTJ&Gp$g=+EV:.+Cno$CMm^)F!,C5+EML1@q@8:%16'K
F)5Q4/6>,9:b=C[0e?Bl;c#&#2DHai+Ad3"/70r8/28h22`E9B1,^a@1H.9M2CpF70eP=;0KD*N
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S##rE%F_%Ec5Gt@;[3,Ec5o8F(&lH+B3&rCh[u6BlbD=BOr<(
@;TQuDe:,#+DbJ%AKY])+EV:.+@1*c@<3Q.Dfor>@;0V#+E(j79lG&j@q0F0+A$YtD.R-nF!,R<
AKYH&Bk1ctBl5&8BOr;PD..a)B4rE(@;]_#@:s-o@;]TuBlkJ3F!+n4F)PQ&@<?'k+EqOABHU_+
BOtUmFCK9/CLqB+@V&tjFD5?0C`mA)Eblk4DBNA*+CT.tBk;1(+Dbt+@;I'&AS5RlA1e;u<,$G_
GA1qG85^Qe2)m-G2)-m<c\3K-DIb:a/2/e72E33D0etR:1bLIB/2B%70f_6M1bpU=0eP::2)I0L
/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQ
Bln'-DCj+f/4"/a/6$>*@<ZF'+=LZ7F)N1:DJs`:+CT=69k@jLDIFZ+Aft&aFDl;1DCH]BF!+m6
F(KH8Ch7HpDKI"8DBNh8Ecbu+Ec*!oDfTc+@rEJuDIaki:.8)K:EW_WEbo8/87cgUFCAfn+B)ur
AM,)rBleB7EbT#lCi"A>BlkJA@<3Q"DBNY1E,Tc=@;^00E,TH.F<GL6+Cf>-FCA[$+C\o(G@b?'
+EVgG+Cf,/Bl%L0@<?4%DK?pK;fH/_Bldr1@;]Tu6#pCC.3N&:A0>u<D]iP.DKKT1ASuU2+=K[$
Ec5o.+CT.u+@0U[Bk(R#+CSl(ATAo8BOr;GFD)e,ASuU4Ed98H$<1qYBl#>%5uUT31,:C3?Q_dX
Be3UB0JbL>1G(@<1c[*A0ePC>/2]183&*BH1-$m;1,COB0f_-N3%Qg=0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70qsEbR'K<,ZMcC`mG5+EV:.+DtV)AKYo'+E)./+E(j7FD,5.9jr<UDBNJ$Bln'#F!,L7CghEs
A0>u4+ECn)DCcoOFDl2:F"AGBDIal%Bl[c;+q4lYDes-)@;[Ve;BRhR2D?[@0fD!G/C(LC6Y1-d
67aiJ1H@?F2D@!B/28b52(UL;3A*9O2D@-L/1ib6/iYXG2)7-B/1f)O/43ud/.DqcDf0!*Bm")?
85^Qe2D@-B2)mTR1+Y""6Xag_/M&J)2(gjB/29+=/i,4;3B8rJ2`<9K0JtdF2(UL:0f:(K@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*X/43i_
/6$P*@<?4+BHVM-F!,R<AKX9bFCer)B5_<'De:,6BOr;bF`&f@$<1qa@s)TrE\'aZ+>kl-/3#@E
3%W@i+Ad,h/3tg@0f1aE.kit;3@m!>1-$m@2D-dB3&ENO/3,=;2)dHM2_6L2cG(o,F(6a1$<2.^
Eb0,>83p3,:b=I]/4`'+/Pn#T2Cr2X6WS(U?S#P80et@:2(UIA3%csE2DR3L/2T193AEBI1G^R;
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL6WS(U,"ZfhF(c\8Ec5o8F(&l;+B3JtEb0,2G@>P8FD,5.@<HI0
+E(j7FD,5.BQ\37ATE!'EcPl4EZdhcDf0G8D.-os6Zm6Z@;0Oo+E(j78TJNdBHV,&B4Ysk/0K.M
D]j74F!,RIEc,H!+DG_8D]iI2BQ&$2A0>?,+EV:.+DPIrCi=H;+D,%rEd8d-@q]spARTCaBJ(J<
$<2.eBe2eC+>P`,2`WED2_[6M/70MtATTJ1/70qe/ho+42)HpG1-%3M2_6O<1+kRA2)mBO/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#)dF=\V&Eaa9.Ch[<q+E2@>E,Tf+Cc`b=F`;%;BlbD=BOr<(@;TQu
De:,6BOr<'Df^"CE,T]<Ci=H;+A$H]BkM!pDfp+D:h=QaCh4`*Bm+3.B-;,1+EV:.+D"u&FCfK1
+Cf=uF*&OCAft#jF`_:>6#C1RBk(R&+C\noDfTD3FD,5.:iCArF_>i.F(HJ&EcPl;ARlotDBO%7
AKW]cFD)e,ASuU4Ed98]%16'WE5SG%844RT0K:dD2_6j@2Dd6A?Q_^VFY$lN0etLA3%[$F0JP+:
/ibpC0fV'D1c-sH2`WE@2Dd$?1,:OC3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqEcip0@<,dhF^]Q(
DBNn=DfBW9@;J"J<-</tUEF8l+E)./+E(j7AoDg4+E2@8DI[C"Ch4`%De*o3De:,6BOr;VF^]<!
DJ:4\Df]c6B5_[5+DG^9E,T]<Cgh?,:gnBQB6@X.@;[3"Des3*DfTD3FD,*)+D>>&E+NQ&FD,5.
F*2GBASl!$B5_<'_i\AE@;]Uu+EVNE@rc-hFCcS:BOr;dDJ=9*EcYeE%16'WEb/s+/4`Y]1GLjH
/2K:F2)d)4JKRd3E%F:+0K:aF2(^R?0fU^>/iYX<0etI93&ifM1H-j:1,LU>0JkR@1b:1/c[dWD
F`8l@$<:kP@;%2_;BRbT1c6g@2`*<F/C(dK89nVp/M&J)1G1[A/28t</ibgH0JGI;/MSk41bq$F
0J"b+cFGJsH!r65$<:kXF`&a$6m+3<1,1LB/2]@A3AE'l+@B^X/70r8/2o1<2_6[B2D-a>0JYLB
/1i_=/iPI?2_d!;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ud/5U&&@ps(lDBMMlCgh3lF!,FBDfBW9
@;IP=<GQDnDBNe-@;^-/F`S[DEZfR;+DG^9FD,5.:hb#eATDZ2Cgh3oF^\oo+E(j7FD,5.E+Ns,
Ch4`-AfsoaFCS`nEc*!kF)59&A90@4$<:tdCLM$m@;.8`;BRhV2)HjC2_[0E/C(LC;e9u#/M&V6
1c.!=0K([E/2Ah91Ft:;2D-[A2E<]S/2f+;1,UsF3@l^4cESp!ATB=2$<:tdEbBN4Blmo;85^Qc
2Dd<C1G_!J2D!1,+@Ak3/1iD,2_ZsF/M]7B2CpX:1c[*A0JtI>1-%9Q1+Y"42_I*H1cR9F/1`?u
K.KAa@4Vip<H<4t/4`/O1,CXD0JP+=2D@'L/70MuB4WW$/70qf/ibjA1-%-C0JPLB1H6p?2D-gF
1bq$N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,gALpDn@<$!(E,ol9Df]?'4!7ODF_`+D@<3Q"DBNA*
@qfLlF<G(-FEo!IAfu2/AKXooD.R`1@;]Tu6=F>KCi=3*@;[2tBm+3,BmO30Bl@m1+DG^99kABa
E,Ti,D/!E$F(o`=@<?'k+CT))DJ()#DBNA*@qfLlF<G(,@;]soC`mY.+EV:.+@UElBQ@O'ATJu7
Bm+'.+DG^9D/WrrEc*I>@<iteEa`r?%16-IB43>^;BRnP0JP+=0etXB/C(LC9R1Y0/M&V91H%6D
1H73L/2/\11Ft:?3A*'C1cI3J/2K7<2`NTO3&rN@/C(LO9R1Y0%16-IEbTW(FCd!o;BRqZ1GC@7
0fC^E2CpR>+@0mU/3tgB1G^aA.l01?1b:L:1,:C:2)6dD1,:^E2CpXE/i#4@0f_0D1,(F?+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/28t4
6#L3a,"?TkD'3q6AKYetFD5V8+sL'!EbTW(F!;eZ+EVXHFD*9L<+ohc@:F%]FD5o0+D,P4D'3\,
@;^-/+sM5EATD?)FD,6+AKY].+EVXHFD)jB/g:`3<bZG^ASl-iFE2)?/4`Y]1c[?I/2f:B0K:W/
[3/LaE\&dn0f(L=1+P(52)m-B/iY^>0f_*D2)I-E2)d'@0J5@C3AE?N/1`?t[4G?mE\%Y,=(-/Y
F=]s\+>Pl72_6aB2)R'=cEn^,ASita@4X)k1,(F51,1XH/2Jn90J"q50J5%80K1gK/2Aq43B/cM
0fCR6/C(UR7qHNg%160FH>Y9);BR_K1b^I92`<EN/C(OD6Z6cl/M&S52)-d:1Gq!I/2Jn51+YCD
/iPRH3AriJ/Mf7:2`<WO0eb.0/C(OP6Z6cl%160JH=^tF85^Qc2E<QE1GgpF1b?qZ+@Ak3/4!\q
0K1[F1bCI@1,LO:/iYX<0ebO=0KD'O2)$R51,^a@3AWEE0J"b+cEo,i9joR^$<M@jEb0,>85^Qd
1H6pC1Gh'BcF+ilBOr_\@4X)e0K:m@2)R*G/2St51+Y.=/hf:D0fLm>/N#C<1,LjI2)m-</C([T
:hXDk%163GD/!NpD09l-/4`Y]2DR*J/3#CB0f1H,]J1O-@rEna@4X,k2).*C1H7'E/2Jn40J"t:
1+kRF2`<HG/1iY;/hf+@1H7'>/1f)Z0e?75D_)>)=D;G[/4`/O0fLmF0fCRC0fV$G/70MnH#bHC
/70qd/hf+51,ps?3A<-D2)[!A2D-jE2E!6I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lrE\'soDJEm'
B-;/6DfBW9@;J"J=D;G[+=QEeZK77..3N>G+EV:.+D5V'A7]h'+E(j7FD,5.F*2@CBl5&8BOr;R
BPD?qF(HJ2H$!_<Ci<s3+CT.u+CT)-D]j(3E,oN2ASuU2+EV:.+D"u%Ch[I%F<G"5FE2;;Df''+
F!+n/A0>DoG%GK.E+O'2+E(j7@ps1bDId0rF!,17+CT.tBk;1(+@BgVDIG.,$<VFZDJ*N385^Qf
1Gpm<2E<]P1+^__+@:!b/1iD-1bgmF.l9.<2(UR:0fU^>0f1L:3AifO1+Y7?/hf7E1GC^</1f)Y
/4+8n/.DqhARlo[Df^#3EbTH4/4`Y]2D@'I/2oRK3&3&1[3/7aBIk_d0fCaG1G(:;1bpU</i#46
1,Lg?2)m9G2`*';1bL[H1,Ud?/1`?t[4G*mBIjT"=_2+d:i^8gE\'aZ+>to22CpdI2*!HDcEn]i
E+gdS/29%;1c$^;1Ggj<1+kLA/2B%</i>UH1bg^9/Mf";3A`NI1Ft(.cEo,uE+gd3$<_(ZA9Dc@
85^Qg2`NfK3&NZN1+^_X+B;-M/1iD-2`!3E.l]FC2(UR:1Gp^=2DZs>2)I$C2CpgG/i>UH1c@*?
/1f)R/6,DY/.Dqi@;]dfBIl\P+>bu93@m'B0eta?cF4osBlYaj@4X,g0f_6G0JG=;/2Jn<3@lmE
1bLdI2Dd?N/1iP.2E!HP3AW3;/C(^U<bZS*%169IF`Lo+/4`Y]0etO>/29+A1c$].ZQM\WBe1he
0JbRG0J,"81GLF9/ibjA2*!9H0K1dG0J"e11G1O=3&NEK/1`?tZReOcBe0]#>%)SgC129o/4`Y]
1c7*D/2]@F2)d)3Z631^E\&dn0ekO>2_-R:1c?m@/i>X?0fM$D2E*EO1,^[</iP[F2_d6B/1f)P
/66J*/.DqiBOPdk/4`Y]1H@-F/2T=B2)[#3KeX]@H!r6i/1iD0/ho(30f1gA3&WcS2)m-=0f1LB
1c@6G1Ft(.c\4))89nVp%169Q@UX((85^Qj3&E0@2).*M/C([H7<3)n6");u1GLaH/MK.@3@m!>
3%um?3%d3K3&EEL/1ih63&*EP1GLF3/C([T7<3)n%169WF)>>:85^Qe1Gq*B2)I9O1+^_X+A??b
/1iD-0ekL>.l&e70e>(42)[!?2E3<H1,gmH3@lp>/i>C?2_d9C/1f)R/50Vn/.DqiF^ep"ASc!j
DKTE&/4`Y]2)R0E/2o=B1,:E+YqdFqBjrVZ@4X,i2)%$B0fC^A/2Ah:2(UL<1+kL?3ArZQ/1iS7
/hf+:2`EZH/1f)O1+Z+5@Oqrq>'4:cDImWt@;Bml@VIAa;BRhU3&`BI2D[-F/C(RE9PIre5qF`J
1Gq$A0f1^G/2Jn=0e>(91G1XH0f:mL/1iS5/iPaM2)@-A/1f)Q/50be/.DqiF^ep"ATM?p@;TFh
Be2eQ+>l&:2(U[C2`NZGcE\QdBjrVF/1iD./iGF81,:jB1,UdF1,LO63A**I1-%'G/1`?tZ7J[`
@OqrqDIITp?Y!_aFCANu?Ys=/2_?U5%16NdFD,T53ZpmE+@U?jAStpl%16WWF(96)E-,f4DE8n>
BPDN1BlbCl5uU'S-Z^DKAnGaeBjkg#D/X?1+E2"&F(KD8E+*Bj/e&/'AU/K<Eb'5P+D#&!BlJ-)
/0JbODIIQ:+Dl%8DCcoLBOPsnF"AGTDerj&/0K"VDCcoPDffE(%172kFDPML+AP4$5p.a%6tL1V
@3AMY$8!h]%13OO,9U2c5uU&l-r+2mBl@ltC`l#TEc5i(F`_>-F!+n/A0=fi@:Njk6"FhHDJ=06
Eaa'(Df."0-tm^EE&oX*GB\6`DIITp/n]*G0.@>;%14=)+C]U=7WN'N+@U?jAStpl/0IG]7RJ:p
Cgh3mFCB38+B*Q,FCf<1+A?3QDfT9.DfU+4$4R=e+@p3fFDl26@ps0r<affeATJu4AfsKQCij).
<$3U7PZ0(S%13OO,9n<sA79G!ARloqEc5e;>TuXOG%DdjBl%TsDJj02D'22SDJsD8De:+jDerj&
+@TdVBlJ-)F'Kn3>['X<E+NoqCER&'A0=TXAT`'!>p'R`%16'JAKYo3@VKpmC`m\8F(o`1Df0V=
De:,6BOr;bF`&=1DIakaDf9M9Eb065Bl[cq+C]U=ARfOjE-#S"$?1#sA8,OqBl@m1/0JAAAKYJk
Ch%U(@<?'k+E_a>DJ((kATDg&F*)G:@;I&SH#@&-Bk(Rf+B3&lAKWC#6n&QP@V'%XF`V+:BlkJ3
F!+m6F`(o*DfT\;FD5T'+EM%$Ch54A88i]`G%G\F+EqaECh+Z1Bl.E(H>d\4F!+n/A0>DkBl&&(
$>aEgAKYE%AKYGjF(Jl)Df-[tDJ=9*EcYZ*+B3&lAKWC$<%0FB8T#YhEb&a%+EVN2$=e!lG%G]9
+D#&!BlJ-)+E2@4A8,OqBl@m1+D,Y4D'2eG+EVNE<E(LlFD,5.A8,XfATD@"@q?clATW--ASrW4
BOu6r%173$D]j.9D.Oi2@ps1bF!,=BF*&O6AKYc+Dg-(O+B3#c+E1b0@;TRtATAo(AScHs/Q<i@
cBM9W+DGm>FD,4p$=RshFD,N&FD55-A8,XfATD@"@q@26Bl5&7ARfXrA90:E@V'Y*AS#a%FD,5.
FE_XG@<4I=$4R=b+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+O63N+?^iH6m+'(<E'D7
%15p?F*&OJ@;L'tF!,C5+O63N+Ceht+C\n)A7]:o@qB0nAo_g,+EV:.+D>J1FDl26@ps0rEb/a!
Eb'5D+A$G[$?0EoFD56-Cgh?8+D>n8A9)6lF!,C5+D#&!BlJ-)+E(_1ATDs&FD5Z2F!)l?DffY8
F)Pl'EZee.A0>]2DIIQ7+EqC;AISueARfY!A7]9oBl5&)@<-10+@UEnDfB8rDCco)Bk1ajAKXEM
F*(u6DBNA*A0=6QBl7L'AKYE!DII@&/.Dr'@;^4/@rc:&FE8uU@;]Tu@ps7nDK@EQ8T#YlE+sE*
+E(j7FD,6"EZfC6CghF"G%GK8+Dbt?+E2@4@qg!uDf.*8$?TrmF(HJ)@<>p#Eb031ATMF#F<G[=
AKYo/Cj@.7G%kJuDI[6#AoD]4FD,5.G%#30AKYo'+O63N+E2@8DfQtBD]gbm0JEqC6U`UM8T#Ym
BOr;rASuU4EbT*++D,P.Ci=N3DJ()6BOr<#DKKo;A9DC(Bl@l3De:,6BOr<.ASbq!@rH<t+=L`6
EarMe$8FFm3?U[X.4cT`BQ&$7@;]Us+E(j7BPD*m+E;O4Ch\!:+E(_1ATDs&FD5Z2F!,.)G%De*
AS#a%D.-sd+E(j7CisW(EX`@o@q0XtFCB9*Df0V=De:,5FCB32/g+,,AKYl5D.7's+CT.u+CSbi
F`Lo#Gp%$;+EV:.F(HJ9Bl.R%B6,20DI[]u@<5uh$>+<sD'3q6AKZ&*G%GQ5AS#b$BHVD1Ec6)5
BHVD1AKZ)=ASuU(ATVT.@qBP"F`MaY+CSkoDfTB&DJ()8@;L'p@VfTb$=mRe@3B9%+EV:.+Co&*
ATDX%DIIX$Df-\9Ag#B`<%]:Z+Co&*@;0OhA0>;u@;L41BlbD8Afu2/ATMDl$>j?_F*2M7D.RU,
F!,(/FED))+EqOABHUf-@VK<pF)Yr0DIml3AoD]4cBM9NAo_g,+>#H)0HbIU+=f0,2)$.eEt&Iq
Eb0<'DKKH#+DG^9<+06PAKW]M@;]TuBl7EsF_#')+EV:.+EMX5DId0rA0>H(Ec5t@AoD]4ART(^
+Eh10F_)!h-r"W#EbTT5DBNA*A0=fmAT2<oDKB`6/0H]%0Jk42%13OO%17Q5ILQW9/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=<+06PAKW]M/Ke)&Cis<1+E(j7cBM9N+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZGATDL.
ARloqEc5e;883-eDfTQ%@;I&/+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;tGFDfTB0+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ0/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M.D==_2#^+<VdL+<VdL
+<VdL+<VdL+<VdLcBM:5+<VdL+<VdL+<VdL+<VdL+<VdL+B*AjDId0rA0=<]Ec5u'%144#+<VdL
+<VdL+<VdL+<VdL+<VdL+<W(RARfXrA901B+<VdL+<VdL+<VdL+<W(RARfXrA901/$8!h]/M/P+
/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+%14[E0JFUl+<VdL+<VdL+<VdL+<VdL+<WBt0f^p1+<VdL+<VdL+<VdL+<VdL+<WKs0F\@@
1b^U++<VdL+<VdL+<VdL+<VdL+<Vd]2)R0D+<VdL+<VdL+<VdL+<VdL+<Vd_3A:mL/Mf(7+<VdL
+<VdL+<VdL+<VdL+<VdL0f1RD0H_J\+<VdL+<VdL+<VdL+<VdL1H$or$8""e0H_J\+<VdL+<VdL
+<VdL+<VdL+>GW13A;Qu+<VdL+<VdL+<VdL+<VdL+>Yf-%14[A0JFUl+<VdL+<VdL+<VdL+<VdL
+<WBn2Dd*1+<VdL+<VdL+<VdL+<VdL+<WF"0F\@C+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd]0JtgD
+<VdL+<VdL+<VdL+<VdL+<Vd^2D>RI0eb:(+<VdL+<VdL+<VdL+<VdL+<VdL3ArQF+<VdL+<VdL
+<VdL+<VdL+<VdL1,LZo$8O:h+<VdL+<VdL+<VdL+<VdL+<VdL+?2890H_J\+<VdL+<VdL+<VdL
+<VdL+>PZ*%14mF0H_J\+<VdL+<VdL+<VdL+<VdL+<WU$3%uHt+<VdL+<VdL+<VdL+<VdL+<WBu
0F\@G0JFUl+<VdL+<VdL+<VdL+<VdL+<Vdb2_Zp.+<VdL+<VdL+<VdL+<VdL+<Vd]2D>RI2)$^,
+<VdL+<VdL+<VdL+<VdL+<VdL2)d6D+<VdL+<VdL+<VdL+<VdL+<VdL0f1Qn$8sRl+<VdL+<VdL
+<VdL+<VdL+<VdL+>c#60H_J\+<VdL+<VdL+<VdL+<VdL+>GW*%15$J0H_J\+<VdL+<VdL+<VdL
+<VdL+<WI"0ea^m+<VdL+<VdL+<VdL+<VdL+<WBm0F\@K0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^
3ArQ6+<VdL+<VdL+<VdL+<VdL+<Vdd0F\@L0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^1,(C)+<VdL
+<VdL+<VdL+<VdL+<Vdc0F\@D0JG1'+<VdL+<VdL+<VdL+<VdL+<Vd]2)d33+<VdL+<VdL+<VdL
+<VdL+<Vda2%9mI0eb:(+<VdL+<VdL+<VdL+<VdL+<Vd]0KCg0+<VdL+<VdL+<VdL+<VdL+<Vd`
0F\@D1,(C)+<VdL+<VdL+<VdL+<VdL+<Vdc1b^$p+<VdL+<VdL+<VdL+<VdL+<Vd_0F\@D1GCL*
+<VdL+<VdL+<VdL+<VdL+<Vd`3A;Qu+<VdL+<VdL+<VdL+<VdL+<Vd^0F\@D1b^U++<VdL+<VdL
+<VdL+<VdL+<Vd_1,'gn+<VdL+<VdL+<VdL+<VdL+<Vd^0F\@D2)$^,+<VdL+<VdL+<VdL+<VdL
+<Vd^0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^0F\@D2D?g-+<VdL+<VdL+<VdL+<VdL+<Vd]1,'gn
+<VdL+<VdL+<VdL+<VdL+<Vd^0F\@D2_Zp.+<VdL+<VdL+<VdL+<VdL+<Vde+<VdL+<VdL+<VdL
+<VdL+<VdL+<Vda%14gK2)$-q+<VdL+<VdL+<VdL+<VdL+<WBp+<VdL+<VdL+<VdL+<VdL+<VdL
+<WEK$8FLo0H_J\+<VdL+<VdL+<VdL+<VdL+>G\q+<VdL+<VdL+<VdL+<VdL+<VdL+>F<40fV$E
+<VdL+<VdL+<VdL+<VdL+<VdL2]s4c+<VdL+<VdL+<VdL+<VdL+<VdL>Wa_M$8FOp0H_J\+<VdL
+<VdL+<VdL+<VdL+>#Al+<VdL+<VdL+<VdL+<VdL+<VdL+C%#`%14gM2)$-q+<VdL+<VdL+<VdL
+<VdL+<WF"+<VdL+<VdL+<VdL+<VdL+<VdL+<XoO0J5'h$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%17Q5ILQVn$;#+X
D/WrrEc*"ABl.F&/0K%JAKYMpFCfK0Bl7@$Bl@l3De:-;PZ/c>F!,=.A7Zm+F(oN)+CTA1D/!K&
@r-'nCNCV,DIa1`Ea`KmD]it-F(KB8@<?4%DK?q=Afu)9@<5jtF"AGTD]ib9+DGm>@rH4'Ch7^"
Cj@.;DId<tASu$iDKI">Afu2/AISu_F`(W.+D#M*ASl"!BlbmL<+06PAKW`NB5)O#F!,R<AKZ/)
Cis;3De:-;PZ/c:G%G]>+D,>2AKZ80@<-E3Ao_g,%14gM2)QLuD]geh0Jst$6$%-gDf0K1Bk(Rf
+@0g\@;]L`+D,P4+>PW)2Coti@:s-o90"FR%13OO%17Q5IXV_5/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$<1GCCh4_E
+>"^6ARf:hF<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$<CSOF_,V:De:-;
PZ/c;Ec5e;+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15L;Eb/a&+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15m?F(KB8@<?4%DK?pC+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%14[=/M/P+/M/P+/M/P+/M/Os/M/P+
/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/I`%iARTU%+<VdL
+<VdL+<VdL+O63N>Tb.3+<VdL+<VdL+<VdL2(_sB@<*JXBOPdkAR$?#+<WsnATD3lAR#ZO+<VdL
+<VdL+<VdL+<VdL+<W(RARfXrA901B+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<WBj=_2#^+@BgN
DJ*Nc%144#+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
.!&s0Df0*,.1HV9/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+
/M/P++>#/s/M/P+/M/P+/M/P+/M.D=0f_*K/heCj+<VdL+<VdL+<W0j0eP1'+<VdL+<VdL+<VdL
>V.'@+<VdL+<VdL+<VdL+<Xo@%14gM2D?a;+<VdL+<VdL+<VdL.l/t61*@\^+<VdL+<VdL+<WEl
0d%S]+<VdL+<VdL+<VdL0J51;%14gM2Dm*@+<VdL+<VdL+<VdL.l0%82]s4c+<VdL+<VdL+<WEl
2'="a+<VdL+<VdL+<VdL0J54:%14gM2_Zj<+<VdL+<VdL+<VdL.l8q41*@\^+<VdL+<VdL+<WKn
2'="a+<VdL+<VdL+<VdL0J5?p$8FP"2(gR*+<VdL+<VdL+<VdW1c6mC+<VdL+<VdL+<VdL+>kc-
+<VdL+<VdL+<VdL+<Vd]/hf0m$8FP#0J5%%+<VdL+<VdL+<VdW2)$X?+<VdL+<VdL+<VdL+>kc*
+<VdL+<VdL+<VdL+<Vd]/hesg$8FP#2(gR*+<VdL+<VdL+<VdW2)HpA+<VdL+<VdL+<VdL+>YW0
+<VdL+<VdL+<VdL+<Vd\/iPZt$8FP$0J5%%+<VdL+<VdL+<VdW2)['I+<VdL+<VdL+<VdL+>PQ-
+<VdL+<VdL+<VdL+<Vd\/i>Bn$8FP$2(gR*+<VdL+<VdL+<VdW2D?aC+<VdL+<VdL+<VdL+>YW1
+<VdL+<VdL+<VdL+<Vd\/iPa!$8O:h0J5%%+<VdL+<VdL+<VdW2DZsF+<VdL+<VdL+<VdL+>YW(
+<VdL+<VdL+<VdL+<Vd\/iGBm$8O:h2(gR*+<VdL+<VdL+<VdW2Dd$F+<VdL+<VdL+<VdL+>>E.
+<VdL+<VdL+<VdL+<Vd\/ho<p$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%17Q5IXV_5%16'JAKYE)ATD3lAKYE!DKTB(
+Cf(nDJ*N'De:-;PZ/cL@<3PF/ibp7F(Jj"DIal%Ec5e;0f_-L+EVNE0f_3I/e&.YDg,c9ATB=E
FD,5.@<Q4&@:s-o@;]t*@;I'#DI[]u@<6!&G@>P8C3=T>+>>E+1E^aM@rH6q+D,Y4D'1Pn3&Mh#
D[d%/0JG13+CT.u+E).6Gp"dn0fU:sARfXrA0>K)Df$UP0JG1'FDi9W0JG@:+@^KqF`M%9@q]:g
B4Z-,@;]TuFE1r1A9/1eBl5'=PZ/c8@;[3*Dfd+2AKYr4ARoLbFCeu*GA2/4+Ceu'FCAm$FEo!M
Bl7El+EV:.DfTE2Bk(Rf+Dl%-AScE1De9FcFD,5.E+jN<Bk(Rf+Cei&F(KD8@<,p%DJsV>De:,*
BkM*%ASuF/B4rE,Eb/`pF(oQ1/g*T-FE1f/Derj(Bl@m1%16]fDf$V=BOr<.@:F%a+EqC2B4uBu
A0>?,+EV:.+Dbt6B-;/)EbTH&+EVX8DIal%Ec5e;FD58oC`m2-@;BRpB-;,)%172jAKX]cDf-\9
AnGUp+ED%%F)Pr)@VfTuATMs-D..NtF!,C5+=f?/+EM+(Df0*,+DG^91,(F:/0HH'1E^aM@rH6q
Et&IjDBL\g2)$R(.l&e7+EM+(Df0*,+DG^91,1I:/0JA=A0<BZ1bp1pARfXrA9/l-DBO%7AKZ80
@<*JG1,(C7%13OO:N^c#Bk1ctFD,5.E+O'(De'u/Afu#$F(KB8@<?4%DK?pK2)$^,6:40aFDi9W
0JG@,6U`FT+EV:.+Eh10F_)\6Ag#B`<"01E@;[2sAKYQ/FE1f/Derj(ARloqEc5e;D.R-sF`M&(
+Eh10F_,V:F`V87B-;;0AKYf-DJ(PCATDW1D.R-n%17&_Ea`EqCh[B%FE1r1A3(/,%13OO+<VdL
+<VdL+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+EUpF+EM+(Df0*,%144#+<VdL+<VdL+<VdL+<YlA
ATD?C+<YbK4Wl.uARTU20fUpB.5*D00F\?u$:,eUATDKrF!,C5+Brf'CjBo:D/!Ep+D#e:Eb0<5
Bl@m1>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;ak2)F>Y^^AScHsFDu/7GqNcPD/:XD
BOQ'q%16QUASrW$ATDL.ARloqEc5e;FD,6,AKYMlFC?;6D]j+8D/a<*ApGM@BOr;tG%#30@<?4%
DBNk0+O63N+D,P4+CT/5%172kD.Oi#F`M26B-;;0AKY])FCfK9@;I&<0f_6S+EVNE.l/k50J4JI
BOr;jF`(]#Ecb`(DKL.HBl4@ecBM:6-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47:TbJ
2(s)i@qB\&@;0V$GqNcPD/:XDDg#]4+EV:2F!,F5EbTH&+Ceht+C\n)ATMs-D..NtA.8lXEc5e;
F(8X#FCfJ8Bl5&8BOr<'ARTY&Eb0*!DKKqP+@^9i+CSekBln'-DII?(Bl7O$Ec#6,Bl@l?+EM+*
3XlF#6tL1V@3AMl@;]Tu<GlMoATDj#C`l\kD.R!$BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22
FtZc_BOu"!04\X1FCA-$BQS*-.4u&:%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%160TEbo8/FD5T'+F7sDATJu&
Eb-A%@ruj%Ci"A>@UX=hA0>f.+@C'cEb&m%@<?'k%16*QBm+'.F(&l-<,$2\+=L5h6RaW18TZ(h
F!+n/+CTA1D/!K&FD5T'+EMgG@q]n$DJ=E.A0>;uA0>;kC3=T>ARlp*D[d%pFCBG;GA2/4Bl5%I
/ib%qARfXrA9/l3AftN'FE2;;Df'2u@;Kb*+Co&*ATDX%DIm?$<GlMoATDj#C`l\kD.O.`-rj4q
/g*r"@psFmDf0!"Cj@QS@3Af!Ch7$o+EM+(Df0)j+s:T@+CSekARlp*D]i%Z6QgJh+DYP"E$/k:
+DG^9F*VY5%17;nFD)ds<$3T5BPCsi+Cf(nDJ*O%+CoV++EVNEG%#E*@<?4%DK?q7DBMAVEcbu"
-Z^DNDffE0Bl@l3Eaa'$.4u&:%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%14=)+Auc_ATD@"@qB]j$4R>:DfTl4
F)PqI+A=C1@;]Tu;flSiBOu(&Df.*K7P5f]/hA,M,"QEhFDl26@ps0r<affeATJu4Afu2/AKXEM
Ecbu"-Z]_(6Yp[NCEQ&dEc5t@cBM9N@;]TuFD,5.6Xae@F_kK.Bl@l3De:+\@r,juF(KDt+tOj/
/g*]!F*'#W6$%-gDf.0Y+BEDs/e&.D2'>_(Ec`E[/0I6$B6A9;+>PW)1b9bED_<.e1,(7%E,ZpU
1,gd@1H$@(1,(C=.4u&:%16$UAT2<oDKB`6+@[t]+CT.u+@pEnCh.*p+AFIS/hA+p6$-pOF!,C5
+@p3fFDl26@ps0r7:U.JE-#S59jr!^.P)#96Xah@EbT&sAKXujBm)+*Eb0<5/hA,4@;TIoBk1jf
/0HZ-3&WAu$4R=o/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R=t0JGF.9jr'PBHT&hDIITp?Z9q"H#@P;BjkgbAU&07
ATMp,Df0W'AoD]sA7]S!@:++`D.GC\,9U2c5uU&l-r+2mBl@ltC`l#TEc5i(F`_>-F!+n/A0=fi
@:Njk6"FhHDJ=06Eaa'(Df."0-tm^EE&oX*GB\6`DIITp/n]*G0.@>;%14[0+<Xlm88i?V>psB.
FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rHARfOjE-#SCBQS*-.:!Ai%14=&>=E%<BlJ-)+BN,`
+B)urAR-]tFEDJC3\N.-Derj&F*VhKASj&;@<5j0B5_rHARfOjE-#T305,9@AM5JA$4R=e,9UH@
+@^B_A0=<^E+NoqCFgSu;as+s:i'QXATV@$Gp$%2F*(u1F!+.b@W-9qFDl2F%13OO,9Tg$CjBo:
D/!Ep+@UNoEb0<5Bl@m1+D,P4+@KdWFC?:k+=PO"<%/q!$4R>HBQS?8F#ks-ARfOjE-#SCB6.Zp
/oG*=@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*->psB.FDu:^0/$mHCh[j0AM.V:An*H2
@<5j0B5_rH;akA2CiD%<AScHsFDu/7Gqq'-1bNH`D/:X1$4R=e,9THiG%DdjBl%TsDJj02D'22S
DJsD8De:+jDerj&+@TdVBlJ-)F!+^l7<<EZDII<'@;]Tu9k@mYF'Mun%13OO<HDklB-;;0AK]9_
<$6?mCis<1+Co&(Bm+&u+D,Y4D'3q6AKYZ#F*)>@Bk(Rf+ED%'DfTA2@;]TuAo_g,+Co2,ARffk
$?'BpATDs&FD5Z2F!)lPAS!nF>?#$?Ch4_D>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH
9LWH"F>Y^^AScHsF=q6KD/:G=@:Cr?+:SZdDIako<+06PAKWa6-tm^EE-"&n04eX0BlJ-)/n]6;
@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PTAT.4cTM+EM+7Bk;?.%17#c+E278H#@P;
Bjkg#AU&07ATMp,Df0V=BOQ'q+C\nnDBNG0ART[lA0>u4+EM76E,96#Gp%3BAKYQ-@;L'pFD5Z2
+E(j7cBM9NAoD]4@;^?5FD5T'+CoV8Bl7Pm$?Trm+DG_8ATDs&C`k;a3B9)BFDi9P1GCL:/e&-s
$<Ld]A7]@eDIjr4BOr;sARfFk@;I'3ARTU%>U"Gu+s:<8+D,P.Ci=N=3XlE*$6UH6+<VdL+<VdL
+F,(m+F.O,EZckT-uEm?FD)dK+>>E*.5*D2%13OO<+oue+D5D3ATJu!,'dE;+D,P4+EV:.+Dkh'
A8Gg"De:,6BOr<'Df0Z1/0K.MBk(g!BlbD*@q0Y%@<?''ASuF/B4q_]B5)O#DBO%7AKYr4ARfFq
Bl@l3Bl5&8BOr<%DJs`:+Eh10F_,V:De:-;PZ07X<+ohcAoDL%Dg,o5B-;/3CjBo:D/!Ep%16Zk
E,oN2F(oQ1F!+t$DBND"+E_a:A0>AjCh%U(@<?''FD,5.G%#30AKYo'+O63N+=LrA+EM+(Df0*,
.3NPPATAo8BOqV[FD5T'+E1n4Bl@N)@rHO%Eb/c(@X0)7Afu2/AKY2HBm+&19keE[ASuC"F_r6g
@;^"$+E(j7;f?J\EZde\Ch[j0ATKmA$8!tm3B84(D]gPd0JG1d-tm^EE-"&n04eX0BlJ-)/n]6;
@kMY-F($\6Dg!d47<!BYF"]CF6W6E+BQS*-.4u&:%15F5AoD^$+EV:.+F.O,EZcqk0JG%#@ps1`
F_kK.ANC8-%144#+<VdL+<VdL+<\so<$4=H/M]"&.j-W'+=\LV?8;rs+<VdL+<VdL+<VdLGA(Q.
ANCqVFW`gi.![C!3&30:0/5.7%13OO6=k7_AS#a%H"CE)F!*%l0JFVXDIak?2)$^8+EqB>F`V+:
FD,5.A79Rg+D,Y4D'3%^@:F%a+>I.MBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX@psI:
04\X1FCB8DBQS*-,BR@'0e"XrAU%]rE-*4EBOQ!*AoD]4FD,5.H"CE)+>#H)0HbRN+Cf(nDJ*Nk
%172jAKZ/)Cis;30fLgI0HbIU+>Gf10Jb=?+DG^9DfTB"EZfIB+CTG3Bk/>p+Co2-@rH7,Bl8'-
FEo!QBln#2FD,4p$?1#sG%kl;F!,(5Ec#r8@3B!#+EV:*F<G.6De!H5+B3#c+Eh10F_)\-DfQuG
PZ/c>F!,+0G%GP6@X0))%17&mCjBo:D/!Ep+E(j7FD,5.2KWUTA7]CoAS!D8GA(]#BHV>,E,ol-
F^o!(+EV:.+Eh10F_,V:Bl5%t<+06PAISu$>pq<X02k;L@<=@[A7]S!@<=,8FDYh=FCAW5.3NhK
FD)e*DBNM2Ec5t@DJsV>Cgh?sATAo8BOPd$1a$jN@rH6qF#ja;%144#+<VdL+<\so<$4=H0ebIE
1G1R./Kcc%0f1L>0d%qgFW`1W1G^XB3&<9D+=\LV?8<WT+>kc32)6jC1E\.iF^?j5$6UH6+<VdL
+<VdL+>"]i/ho:F3&EKJ+=\LV?8NcT+>>E%1,:RC1bh!G+=\LV?8WiU+>>E%0KCgC0fCmE0d%qg
F^?sK%144#+<VdL+<YlAATD?C+E\ei+F,Up0JEqC%15F5FE_;-DBO49@<-E3.lB"7+CT.u+=f0)
0JG%#G@_n*B45Ll+E_a:+EV:.+Cno&@3B0&Df$U+$<pJ<@VfTu0jQ2@FEDJC3\N-t@r,juF(Ht:
F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW5.3N_N+Co&(Bm+&1@3BN-CjBo:D/!Ep
+E(j7FD,5.2KWUTA7]CoAS!J'$4R=b+<VdL+<VfPPZ/bg+>G`41bLO+/Kco.2D-[<+=\LV+=eQn
0eP4;1cI04.Nik?1*A(i0J5.93B&oP+=\LV?8E#t+<VdL+<VdL+<VdL/Kc`"3&NBG1c@-4.Nik?
1a"@m0J5%52)$mA3B9&A.Nik?2'=Cl0J5%53&<EN1,(XC+=\LV?8`6"+<VdL+<VdLGA(Q.ANCrV
+?^hqGqCa)0JFq/0eb9j$4R>/ATW--ASrW9ARTV#+=f0)0JFVXDIak?0fLd?/0JG2Ch%U(@<?'A
%13OO+<VdL+<VdLcBM9N4WlI70H_qi0J5@F0K:1)+ES_X+>>E%0f:aB+=\LU?8<WR+EUpG+>4ir
0et`u$6UH6+<VdL+EqL1Eb.9S+ES_h+F,(]+>Gc.0F\?u$:8<GG@b?'+F.O,EcW?R0fLd?+CT.u
+=f0+0JG%#@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H3%d0H+=eQg/ho7<1E\.iF<E.X0J5%5
2*!EO2'=@kFC$^F.j-Mu0JG181G^gF+=\LU?8E]U+EUpH+>4il0fLpC0JEqC+<VdL+<VdLGA(Q.
ANCrU+?^im+>"]j2_Zop$4R>/ATW--ASrW9ARTV#+=f0+0JFVXDIak?0fV'F/0JG2Ch%U(@<?'A
%13OO+<VdL+<VdLcBM9N4WlI8/iPO./Kc`"1G^dC1cHO,+ES_V+>>E%0K(mK0esk$+EUpF+=eQg
/het90ekC@+=\LU?8E]U+>>E%0JG:A1c%$4.Nih>1a!57+<VdL+<VdL+<VdL.j-Mu0JG170etI=
2_lL*+EUpI+>"]i/het50JG182E<c?.Nih>2BXLm0J5%50JG170JG1?2`2^-+EUpK%144#+<VdL
+<YlAATD?C+ES_h+F,(]+>Gi00F\?u$:8<GG@b?'+F.O,EcW?X3&WH5@;]Tu0f^pA/0JG2Ch%U(
@<?'A%13OO+<VdL+<VdLcBM9N4Wl[92DQC*+>>E*2`!B8.NigU/Kc`"1,UdF2)HF*+EUpF+=eQg
/hf"<3&!6K3$9[nFC$a4$6UH6+<VdL+<VdL+>#9"0JG1;1cI3K1,L+'+EUpH+=eRV?8WiY+>P`/
0fLou$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0fV'F%13OO6=k7_AS#a%H"CE)F!*1t0JFVXDIakE
3AN9>+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>#?$2`W!2+>GK*3A`HF3?TdoF<E.X0J5%:
3B0#T3?TdoFC$^F.j-Mu0JGC>3Arc<.Nih>1E\7l0J5%50JPRH+=\LU?8N)u+<VdL+<VdLGA(Q.
ANCrU+?^im+>"]j3A<,r$4R>/ATW--ASrW9ARTV#+>Gl30HaeAA0<Te1bgO(@ps1`F_kK.ANC8-
%144#+<VdL+<\so<$4=H1,1C:0H_kg0J5=A1c[?AF<E.X0J5%<2DHm>+=\LU?8<WR+>>E%0JY=B
1H$@*+EUpG%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gl30F\?u$:8<GG@b?'+F.O,EcW?X3A`H5
@;]Tu0f_-H/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4WlL?/hf4,.j-Mu1b^j<F<E.XFC$^U
1,C^/.j/q?1E\=n1,UmI%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gl60F\?u$:8<GG@b?'+F.O,
EcW?X3ArT7@;]Tu0f_3O/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4WlR=/i5F..j-Q!0K(j>
F<E.XFC$^U1,^g//Kf.A1E\=n2_d9$$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0f_0M%13OO6=k7_
AS#a%H"CE)F!*1t3&VmfDIakF0JG@8+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>u#.3&Vm0
+>>E(1Ggs3.NigU/Kc`"0K(U@2`)X,+EUpF+=eQg/het62_m<L+=\LU?8E]S+>>E%0JGCB0fUmE
+=\LU?8Nc6$6UH6+<VdL+<VdL+=eQg/het50JYFC1Gq0Q+=\LU?8W0!+<VdL+<VdLGA(Q.ANCrU
+?^im+>"]k0JG0i$4R>/ATW--ASrW9ARTV#+>PW)2'?=FA0<W]2)$R(@ps1`F_kK.ANC8-%144#
+<VdL+<\so<$4=H2DQmF1*A(i0J5.:1,1^1.NigU.j-Mu0JG@A3&r*2+EUpF%144#+<VdL+<YlA
ATD?C+ES_h+F,(]+>PW)0F\?u$<1\QF!,%=E,oN2F(oQ1+DGm>A7]dqG%G2,Ao_g,+D#V9Bl.:#
ARlp,@;L'tF!,C5+O63N+DG^9FD,5.H"CE)F!*4l0ea%D@;]Tu1,(R>/g+,,AKZ/)Cis;3AoD]4
1,(F:+=K-+/ib%qARfXrA901BBlbD+@<6!j+E)-?@3BB#DIm6sCj?HsAU&<;@;p.$@<?4%DBNP3
Df$UP0JG@,F`V87B-8l\1H?S!ARfXrA90DLARTU%-t.:1Ea`Tl+D,Y4D'1Pn3Ahq$D[d%/0JG@5
/g+,,AKZ/)Cis;3AoD]41,(R>+=K6++EM+(Df0*,.3N>G+Dbb0ARTUqGp$[CFE1f/Derj(ARloq
Ec5e($8O:i0HbLZBl7Q+0J57A+EM+(Df0*,06q,;EZcc=G%G]&B4W3+@<?''Ao_g,+>Gl10d(RV
+>PW)0I\U`$4R>/ATW--ASrW9ARTV#+>PW.0HaeAA0<W^2)$R(@ps1`F_kK.ANC8-%144#+<VdL
+<\so<$4=H/M]"&.j-W'+=\K^.![C!3&30:0/5.7.:+bP/Kc`"2)[3L+=\K^1,1X?+>"^].1HUn
$<1\M+DbJ-F<G[:Ebuq5F!,17FE2;1F^nun+EVNEASc'tBl7@$AKZ).AKYMtF(9-+FD5W8BlnVC
@<<VI0JtO:%13OO6"Y4MEZd+l2)$R(@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H/M]"&.j-W'
+=\LV?8;rs+<VdL+<VdLGA(Q.ANCqVFW`gi.![C!3&30:0/5.7%13OO6#:?[G%#30ATJu4Ag#B`
<$5XYF(Jl)Df-[lDfTl4F)Pq=@;]Tu;flSiBOu(&Df-\&>;@ld1gF</@<6L4D.Ohu%178eCis;3
AoD]4FD,5.9lFrf>UOS8F(Jj(Cgh?,@:NeYCh7WqFD5Z2+E(j7/M]4,@<,k!ARdB'H!FZ2/g*]'
G@br/E\%Y,FD,5.78-N01,(C90/t^0CisW(EZeq4BOu$lEbTS;ASlC&Dg>o)+DG^9FD,4p$<ol+
DJsDu-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47<!BYF"]CF6W6E+BQS*-.3NbSATJu&
+EM@5B4uC'Gp$X3AnGUpASuT4G%#30AKYo'+>#?+/iY^J%16Na@rl3k04T94?8=,U<+pDq/0J@D
F)>?%C`m5+EcP`$FD5Z2+C$+#>Tt;-F`VXI@V$ZjA7T7^+EVNEFD,5.G%#30ATJ:fA7]dqG%G2,
Ao_g,+EV:.+E278H#@P;Bjkg#AU&07ATMp,Df0V=AoD]4cBM9N@V'.iEb-A8BOuH3@ps6t@V$[)
F(Jkk$>FB#FD,5.>=2h:Df/i/BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_E-5W20/ZHk
;ai<PFDYhC%13OO+<VdL+<VdL@j!oW/MJe20JG181-%-G+=\K^Gp"[]0f_*K.:+b=$4R>@Bl7El
+EV:.+Eh10F_,V:De:-;PZ/c;DfQtBBOr<#DKKH1G%#200f_*K+EVNE1,(C>+EqC;AKYMpEbT].
A.8l[DId<tASu$iDKI">AftN"Gp$pGDIIQ.AT2<oD.Ra%F"AGOD]iP.EcP`$FD5Z2+DGm>DImBi
ARloqDfQtBBPDMs$?0QsBl@N7%13OO<+ohc>BOgnATDm$Bl8$<+DG^9cBM:6-tm^EE-"&n04eX0
BlJ-)/n]6;@kMY-F($\6Dg!d-7:TbJ2(s)i@qB\&@;0V$GqNcPD/:XDDg#]4+EV:2F!,F5EbTH&
+Ceht%16QU+D#V9Bl.:#ARloqEc5e;F(8X#FCfJ8Bl5&8BOr<'ARTY&Eb0*!DKKqP%13OO/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO,9n=/AS,LoASu!hEt&Hc$;GGZEbTT5DCco(/g+S?A0=fmAT2<oDKB`6/0ID7
+AsgC+C$*]BleB7EbT#lC`lbeCis<1+E(j7FD,5.7:C4YBNup+%15I=De!Q*7<3EeEZiYl<$5Ue
A0>u-AKX?KCh%U(@<?4%DBNk0+@TdVBlJ-)F'Kn?+A+7/883-e/g*H$FE2;;/hA,GDeq$8$8XO^
:gnBd+>YPk6$6g_F*&N[0JG=7+AQi-+>GW*/0JnN+>Yc3/Mf1@+=K!!0Jk42%13OO;flSiBOu(&
Df-[e/lEg#DIak\Dfol,ASrVb/jV*@+=][!CghB-De:+_BleB7EbT#lC`l/VCh[j0AKX]UE-!K[
%15I2D.7O"A7oHr<GlMo/l6S"F)rrb+@BRS@WH0nB4WV:0f_3O/e&-s$8!h]/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%14jE
0K1+M@rrhI1CX\/F`_&6Bl@lrBl79oDf03%FEM,*?XuuSBjY^f1,hsNFCB9*Df-[hDBMAXCh[j1
Bk(Rf+A?]kB5)I1A7Zl3cBQVQ.3N&:A0=caB4uB06$$OIDKBN1DBL@QPYsdr%156]4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$:]&S
D'2GZGp$'pDJj$+-Z^DSAR]^pFCcS!BQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m1
03ou>FEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL.4u&:%15C;B5_g)FD,M6<,WmH
Df'H9FCcRoBOr;]F`_&6Bl@l38T#YEDf03%FEM,*+=LW.:ig>Y.1HUn$<1\M+D,P.Ci=N3DJ()#
ChI[,Bln$*+Cf>,E-686F!,R<AKYl5FCB9*Df-\3DBNM#Ch[j1Bk(Rf+Dbt6B5)I1A7[;7Bl5&(
AS6$pATKCF%16]cEZed5B5)O#DBN=Z6sq-GEbBN3ASuTB+<VduF<G:=+DGm>@UX=hA0>f.+EV:.
+=]*+3%uIH5uf%,BOu+&Gp%$;+AR'$@<?4%DBNA*A0=c]A9DC(Bl@lA.Lc^o$<1\QF!,X7Cis;3
BlbD=BOr;rDfTl0@ruF'DBO%>+CT5.Cj@.FD]j.8AKX]95u&PG@;L't+E(j7FD,5.ARfOjE-,f(
@;I%q$>aWuB5)I1A7Zm*D]it-FCAm$+EV:.+B26=73HDbDJ*[*F_#&7+EqOABHU_+FD,6(Eb0?,
@ps0rE,oN"Ble!,DBNk0+MtB;/het6+CT;#+EM+(/e&-s$:/QT+EVX<B5_[+D.Rg0Bk&8tF`(]2
Bl@m1+=M;FDCco?Df[HPFCB&<+D#X;@;IPF+E_a:A0>T(+EV:.+E2C5F_#DB@rGmh/0GB/@<6L4
D.Oi1@:X(\DBNA.B6A'&DKKqBF`)#,F)rIBFD,6+GA2,0+DG_(Bk(RnARmD9+<X6n+EV:2F!+t$
F(HmFFD,5.Anc-kC`j/oEb0<7Cige6F!+q'Bl7Q+@rH7.ATDm(A0>T(FDi:4AS6$pATJu+DfQt1
Df0`0DJ<["@q@8%$4R>kIXZ_T$;tGI3XlE^F*)G@DJsB+@ps0r6#:1PEbTW/D0$gO+>RhF+@TgT
FD5Z2+=Js)3B/H1%15^=@;[2^AS$"*%15pS@P/d)Bl%U&@;]s76=jtL/0IN%@kJ2t8Q.rN+>>B-
1c$pJ2D$gA/MR\A%16!EAi^A.7<icf@;]LqDfU+G;g!%uCh7HpDKI"CD]j.8AKX9[FE2;;Df'2u
@;I&PCi*Tu@:LE.0f_6L.1HW'0ekC*FDi:@0ekKo$;"/_:*;5B3AWNO0JY4<3%[&u$@[GQILQVn
$4R>2Ch7HpDKKq/$4R=s/g+Oo6sp<kASu("@;I&Y6m-AiD.7's+D,P4+D5D3ASrW$@<?'3+EV=7
AKYE!A0B0^<"00i/g+P$?jTeHD.Oi%@:OCtEZf(6+A-cmBjkm%@qBP"F`M2-F!,L7@r$"#ARloq
Ec5e;8hr(S0J5%1+Cf>1Eb0<2Df0*"DJ()6D]hY?%14mD+CITKB2ieI@:Wag#ukSPF!,1<+CQC&
Df0`0EcYr5DBNP"@ruX0+E_a:A0>u4+Cf>-G%G]9+Co%rEb/g'+DG_8D]fJr+<VdLAT;j,G%#2u
DKI"A@:X(\DK@EQ+BN+sD09Z:BlIm6+Co%rEb/g'+C]U=FD,B0+D,%lFDl1BFDi:?@WZ$mDBKAq
+<VdLFD,5.AT;j,G%#2uDKI"0DJ*cs+D#e:Eb0<5ARlotDBNt.A8,IiF"SRX:2b4sAThX*Gp%'H
DeF*!D/F!)B-7Wj+<VdLCgh3oF^\oo+D>2)+D,b6@ruF'DK?qBD]iP.DK]T3F<G%(FE_;-DBNt.
A8,IiF!+n/A0>DoB6%QpF"Rn/1bKnYG@1_PF`_&6Bl@l3F(KB+ATJu&@q0XuF_kK.DfQsK@<,j#
F(Jj"DIdf2GT\^p0JG10/e&.F/g+PG0jk;^ARTI!ASc:&B45mrDf-\9Afu2/AKYi.Df-\0Ec5e;
FD,5.F*2@Q%15!G+CKCK?jTP=@;[3/Derj&+CT/+D..7+/e&.H/g+PG1LLM`ARTI!CisW(EZee.
Df&p!GqKO53%c=]G;N\69Qb5]EZee2B6A'&DKI">AftnuFD5i>A7[A&$99^]@!=J9#u#8TB5)I1
A7Zm%AftN'@qBOgBl7Q+DJs&s+E(j7CisW(EZf:@@VKp,Df-\>BOr;t@r,juFD55-%144#+<Y*6
+Dk[uF*2M7A0>K)Df$V=BOr<'ARTI!AT;j,DJsbBDe:,&@<?'5%14gD/g+P4:ig>=AS5BW:3CYe
FD5Z2+DG^9ARfOjE-,f(@;I'&Df03%FEM,*+D#e:Eb0<5ARlotDBNJ$B6%QpF"Rn/%13OOIXZ_T
$6W:j+?^hq8jjdR+>Pc20f:dF.3L8d1H%*G2%9m8<&,RZ+B0gi%144W1E\h'<%:j&%13OO+@KdR
<,YZCA0=#X1G1C=0f:sH2Dm9J3&roX1GU(++>Gi0%13OO+EoO_4WlL?2_I'I0JbU0.j-Z*2)7'K
/ho(81cQsa+>"]i/het63AE?G.TA/G.j-6>1E\=n0fV0M2`)rm$6XOI+?^i8AS4t\;IO)c.!IBp
%13OO+EoR`4WlO<2_HsC2`EK7.j-W*3B9)P0JtO?1b)HI/Kc`"0JG182D?p:<&,RJ+=L2F+>4in
0JG170I[G<+EoR`4Wm.(B2ieI@:Ui9G;:TV$4R=bG;C@)+>GZ//ibgF3B/-3+>c#90f_3G3&W]O
3B/Kf+=eQg/het=2E<]O.TA/G.j-6>1E\=n2)[3I0I[G<+EoUa4Wm.(B2ieI@:Ui9G;CZW$4R=b
G;LF*+?;511,gpJ0d%th1cR9H0JY770fLsG3%@lM/Kc`"0JG:@3&3?@<&,RH+=L2F+>4in1,gsI
0I[G<+EoXb4Wm.(B2ieI@:Ui9G;L`X$4R=bG;UL++>GW//hf+=2)6:++>Gl41bLL=2DR0F.T@N@
+>>E%0JY=@0K:O]1*A(i-r_uF0-E)/0JG17.1HV,G;UL++@KdR<,YZCA1B!O2(8tA%144#G9B$k
F(oM?G;Ug!-nR/41bLO5<$3b80fLgI3Ar;q$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2'=InG;1Nq
.OZl'/iG1Y+>"]j1GLjJ.1HV,+Enqk+EnqY+EM77-o*8#G;LEm+Eo[l.4Q_t1,:dF+>"]i/i"nU
.1HV,+Enqk+EnqY+EM77-o)np+Eo[l.OZu'1+H6G.j-T$2DQ]j$6UI8+?^ik+=eRUBl5>C1+=\$
0f1XD+>"]l/i5%W.1HV,+Enqk+EnqY+EM77.!IHr.OZu'0e--F.j-c*1+<Y>+<YkN4Wnqk.j/nI
DC@7i.!IKj.j0$n+>"^[0e"4q+EoRi.O[#(1+H6G/Kco*2^o1C+<YkN4Wnqk.j/nIDC@7_.Nipl
+=eRY2(:"'/MJe6.T@NB+>Yu8.1HV,+Enqk+EnqY+EM77-o*8#G;LEm+Eo[c/Kf6l.3L2bG;:Ts
-o*M9+>"]i/i>+X.1HV,+Enqk+EnqY+EM77-o*8#G;LEo+EoOh+=eRY2(:"'0eta3.j-Mu0e--O
%144#G9B$kG9ACYF(oM?G;C?l+Eo[l.OZu'0e--F.j-`+.1HV,+Enqk+EnqY+EM77.!INk/Kf6n
.4Q_t0J5(0<$3b82)m#o$6UI8+?^ik+=eRUBl5=S.X*Ws.O[#1+>"]i/hnhT.1HV,+Enqk+EnqY
+EM77-o*8#G;:9k+EoXb.j0$n+>"^[0e"P$-nm8..T@NB+>Gc'%144#G9B$kG9AI[1GCO5F(oM?
1+F\r1a":kG;Ufl.j0$l.1HV,+Enqk+Enq[+>G`5.W]<A.!IHi/KceuG;1NU$6UI8+?^ik+=eQh
1,CD$Bl5=S.O]Kt+=eRY2(9Y"+EoUj%144#G9B$kG9ACY+>u#*F(oM?1+IK&.1HV,+Enqk+Enq[
+<WO%.W]<A-o*8#G;13j+EoXb.j0$n.3L2bG;CZW$6UI8+?^ik+>"]Y2)-S%Bl5=S+=\LX1a":k
G;C?l+Eo[l%144#G9B$kG9ACY+>c&-F(oM?1+F\r1E\7lG;1Nq%144#G9B$kG9ACY+>bu+F(oM?
1+F\r1a"@mG;CZj.j0$n.1HV,+Enqk+Enq[+<WI".W]<A-o*8#G;13j+EoXb.j0$n.4G]5+<YkN
4Wnqk/Kc/l0e.6YDC@7i.!IHi.j0$m+=eRY2(9s`$6UI8+?^ik+=eQW1-$h*Bl5=S.X*Zt%144#
G9B$kG9ACY+>Pr,F(oM?1+F\r1a":kG;UKp+EoOh+=eRY1FWb?+<YkN4Wnqk.j,ri2C`c^DC@7i
G;L`X$6UI8+?^ik+>"]Y1,:>#Bl5=S.O]Kt+>"^[0e"O\$6UI8+?^ik+=eQW1,18"Bl5=S.X*]l
.j0$n+>"^[1FWb?+<YkN4Wnqk.j,rh2C`c^DC@7iG;13l+EoUa.j0$n.1HV,+Enqk+Enq[+<WBr
.W]<A.!IEh.j0$n.1HV,+Enqk+Enq[+<WBp.W]<A.!IHi.j0$n+>"]k.X*Tr%144#G9B$kG9AI[
+>GW$F(oM?G;UKp+EoRi%144#G9B$kG9ACY+>GT#F(oM?1+F\r1E\7lG;L`t%144#G9B$kG9AI[
+>GQ"F(oM?1+F\r1a":kG;1Nh.j0$n+>"^[1FWb?+<YkN4Wnqk/Kc/Y3%Au`DC@7i.!IKj.j0$j
+=eRY2(9Xu+EoUj%144#G9B$kG9ACY+<WTmF(oM?1+F\r1a":kG;Ufl.j0$k.1HV,+Enqk+Enq[
+<Vdc.W]<A.!IHi/KceuG;13j+EoRi%144#G9B$kG9AI[+<WTmF(oM?1+F\r1a":kG;Ufl/Kf6m
.1HV,+Enqk+Enq[+<Vdc.W]<A-o*8r0d%th1+IK)+=eRY2(8tA+<YkN4Wnqk.j,rW2C`c^DC@7i
G;13j+EoUj%144#G9B$kG9ACY+<WQlF(oM?1+F\r1E\1jG;LEm+Eo[c/Kf6l.4G]5+<YkN4Wnqk
.j,rW2C`c^DC@7i.!IKj/Kf6l.3L,`G;C?l+Eo[l%144#G9B$kG9AI[+<WQlF(oM?1+F\r0d&%j
G;CZj.j0$n.1HV,+Enqk+Enq[+<Vdb.W]<A-o*8r0d%thG;UfY$6UI8+?^ik+=eQW+>kWiBl5>C
1E\7lG;:TV$6UI8+?^ik+>"]Y+>kWiBl5=S.O]Kt+>"^[0e"4q+Eo[c/Kf6m.1HV,+Enqk+Enq[
+<Vda.W]<A.!INk/KceuG;1NU$6UI8+?^ik+>"]Y+>kWiBl5=S.O]Ks+=eRY1asOt+Eo[l%144#
G9B$kG9ACY+<WKjF(oM?1+F\r1E\7lG;1Nh.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A-o*8#G;LEo
+EoOh+=eRY1*A(iG;UfY$6UI8+?^ik+=eQW+>bQhBl5>C1E\7l1+IK).1HV,+Enqk+Enq[+<Vd`
.W]<A.!IHi/Kf6l.1HV,+Enqk+Enq[+<Vd`.W]<A.!IEh/KceuG;1NU$6UI8+?^ik+>"]Y+>bQh
Bl5>C0e!P=+<YkN4Wnqk.j,rW1FdH[DC@7iG;LEm+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r
1a":kG;UKp+EoUj.1HV,+Enqk+Enq[+<Vd_.W]<A.!IHi/Kf6l+>"^[1+<Y>+<YkN4Wnqk/Kc/Y
1FdH[DCB]a+=eRY1FWb?+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IKj.j0$n.3L,`G;C?n+EoRi%144#
G9B$kG9AI[+<WHiF(oM?1+F\r0d%thG;LEm+Eo[l+>"^[1*A.kG;CZW$6UI8+?^ik+>"]Y+>YKg
Bl5=S.O]Kt+=eRY2(9Xu+>YKk1FWb?+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IBg.j0$m+=eRY2(9Y"
+EoRi%13OO+<Y2kF(n$RB-9>[G9AO]1H$p@0JG17/hd_A+<Z,^IVs:M@<?4%DI7*q?Z0CiBlS90
FEq53Am]+ZCh[j1Bk(L\7<!<9AS5@eA26)=F`_&6Bl@l38T#YH@VfauF_PrC+AZSl<+ohc7:U.J
E-,f(+>"^-5uf$^3B/]8;e9u`ATJ:f4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R>3Ec5e;8muuf<+0Z^ATB/>+EqC+F(o`-+BrN$FDu:^0/%3S
DfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@I:-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0
FD5Z2F"\sp%13OO<+ohcAoDL%Dg,o5B-:W!B5_g)FD,M6@rH4'F`_29+EV:.+Du=D@<?4%DBNY2
+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&\:Bl5%&$=m^\Eb/g'/0JPCEZed5B5)O#DBMP><)auK
EbBN3ASuTB+<VduF<G:=+C\c#ARlp%DBO%7AKVEh.PWqC0H`qQ<?P7SAT)U7+E(j7:3CYeFD5Z2
+CT.u+Auc]F^oN-Df.0W%13OO<+oue+Eh10F_)\0F!,R<AKYK$EcP`$FD5Z2+EVNE@;p1%Gp%3I
+EV:.+AG9j:*=^gCis;3De:,6BOr<)@VfauF_PrC%172q+E(_2@;0U%FD,5.<)Q^b+E(_*BlS90
FEoD[GA2/4+CQC7BOu+&ATVWr@;I'*Eb/`pF(oQ1+E(j7_QbdI0JG4(@<,j#F(Ji6%13OO6$"/_
DBNe7F*&O7Df'H9FCfJ8E,ol0Ea`g%Bl7Q+Cgh3oF^\ooF"AGUBOr<.EbT0)DJsB'FE2)*+D,b6
@ruF'DK?6o.!'*?/0JG@F"AGU@;[V=ATT&'Cb@.ZBl5&8BOr<*F(KK)D_5I;A7ZlsATD?5+CT>4
F_t\4Ea`Km@;[2rEbBN3ASuU2%175qCh7[/+E)@8ATE!/F(HJ.DIdHk@<?'k/e&-s$;#+XFD,B0
+Cei$ALnsGBOr;uBl7?q+ED%7F_l.BBlbD,Df0`0Ecbl'+DG_8D]iS%B6%QpF!,(5EZek1DK]T/
Bk;0lAM+E!%16'TF_)[k@VfauF_PrC+?^iAARTI!:L\-SEHPu;Gp"U[cBQV^%13OOIXZ_T$;tGI
3XlE^F*)G@DJsB+@ps0r6#:1PEbTW/D0$gO+>RhF+@TgTFD5Z2+=Js)3B/Gs$;+l<DBMYbAT`&'
$;bkS/g+50Ci!rsDJh$mASc06+A$H\/e&.Z;aO5%0J,:A1G_$L/N,=80b"I!$;tGI3XlEbG]7J-
DIIX*Ed8d+F`;;9ASl!rF<G[D+EV:.+@1'jEc5i6D/!KgC`l#[D..<j@j!0S3B8iD%17&/0ejem
D]j!R0f0=H8Q.rN+>>B-1Gq*F1+bCD/N4+GIXZ_T$4R>2Ch7HpDKKq/$4R=s/g+Oo6r[,n#siWS
Ec5i6D/!KgC`l><+Du==@V'R&AoD]4B5)O#DBNIuFCd+IBl.E(-ra.p%14jC+CJ/V#ukVUAKYSn
@ruX0+DG^98p+ra@;[2tASuU4EbT*+/0JG@EcP`4E,TW)Bl7Q+FDi9o6r[,:+ED%'CN"*%A0>K)
Df$Uh1,(C9/hd_A1G0eX6tL"1Dc1"S?jTeGBlbD2F!+m6@rH7.ATDj+Df-\0@:OCtEZfLGARlp*
D]iP.DK]T3F<G+*B6%QpF!,17FDi:5EHPu=@;KLmF<D#"+<VeI@:X(\DK@EQ+BN+sD09Z:BlIm6
+Co%rEb/g'+C]U=FD,B0+D,%lFDl1BFDi:?@WZ$mDBO%7AKYQ(F_Q#-Ch7L++ECn$Bjkn#/e&.E
/g+PG?jTSNFCB9*Df-\=ATDKrF!+n$@s)X2CghF(EZfO6EbSrkCh4%_2(g"ZG;3J39k@aN+D#A-
DJ*C"Bl@l3De:,6BOr<'Df9M9Ao_g,+EV:.+EM[C/e&.G/g+PG111D_ARTI!F)Pl'EZee.Df&p!
GqKO52_H4\G;EV59k@aN+Dc1<@<*K!DJsB#Cj@WB$90X\@!=G8#u#JZ@<*K!EbBN3ASuT4De:,.
@<?4*F_#&9%15*J+<Y'92.-_aDf03%FEM,*+E(j7@<5piDIdI!B-;)1A7Zm%Afto4DIIQ.DfT<$
F<GL>+EV:.+:SZ#+<Ve<@r,juFD55-@<3Q.ARTY&Eb/c(Ao_g,+EV:.+Dk[uDBNM1F_P`3GT^p:
+Cno&AM+E!0eb4&?t;]FF$sSP?jTSNFCB9*Df-\3DBNM#Ch[j1Bk(Rf+Dbt6B5)I1A7ZlpG]7\7
F)to'+DG^9A7]CoAS#p8%13OO%15pQAT_O%@rGmh+@0gVDfTQ6BPekkD]hDcD/aW>AKXrcAKX`j
FCB9*Df-[hDBM_aCh[m3BlnVCDe:,6BOr;T@r,juFD54o$>+3s+CT/5+D5D3ASrV_6r[,.6#pU\
D.RU,/e&-s$@[GQ%144W+<Wfi-qZm,<$3b81,LjC2)I0>+>4in2Dm6I%144W1*A_&<$3Y5<"00W
<&5X[+B0I5+B1**$4R=b6tL"1Dc1"S+?^i'/ho1;2*!EM2)@*L3B&rS1*A4m0fUir$4R=bG;14'
+@KdR<,YZCA1Au_3B&QM2)$gE+=eQk1c7$H2_Hg>0f1j><$3;8+>>E%0JPRB1bpO[1*A(i<&60^
3&rfS1ark@+EoR`4Wm.(B2ieI@:Ui91Gq*D2)7*L1*A(i1Gq0Q3A*!C0JbO8<$3;+/Kc`"0JG18
2D?p:<&,RJ+B1-M1GCL:0JFpb$6XOK+?^i8AS4t\;IO)c-o!M7/ibgF3B/-3+>c#90f_3G3&W]O
3B/Kf+=eQg/het=2E<]O.TA/G.j.eI0/YXC2)$Hg$6XOL+?^i8AS4t\;IO)c-oj(91,gpJ0d%Sh
+>c&61,(I90JPLD1H6j`+>"]i/het82E3HL.TA/G.j.eI0/G@B1,gm9%145%2'>%)6tL"1Dc1"S
.O[#,2(gR>1c7$2/Kcc.1Gg^=1H%!H0e--F+<W0W0J5%51,(X@3%@l_+=eR61G:RB0JG17.1HUn
$6XO84Wn6QF!u5i.4Q`+1,(I@+=eQo/ibC\.1HV,G9B$kG9ACY@rHE:1+F\r1a"@mG;13j+Eo[l
.4Q`'2`!?7/Kci%0e--O%145%+?^ik+=eREDf[<^.O]Kt+=eRY2(9t(-oj4F+>"]i/i>+X.1HV,
G9B$kG9ACY@rHE:1+IK*.4Q`"/i>+X+>"]q3Ai5p$6XO84Wnqk.j/>?F!u5f.4Q`'1a"@m0J5(0
<%/7`+Enqk+EnqY+Cf>2.!IEh.j-Ss.!IKj/Kf6l+=eRY2(9t(-o*P7+>"]i/iG1Y.1HV,G9B$k
G9ACY@rHE:G;C?l+>PDpG;LEm+Eo[l.4Q`#1-$I/+>>E&.T@i+$6XO84Wnqk.j/>?F!rdn.!IKj
/Kf6l+=eRY2(9Y"+EoRi.OZu'1Fc?H/Kd&2.1HV,G9B$kG9ACY1,(C3@rHE:1+IK)+=eRY2(8tA
+Enqk+Enq[+?(u(@rHE:1+F\r1a"@mG;1Nh.j0$n.1HV,G9B$kG9AI[2)?^lDf[<^.O]Kt+=eRY
2(9Y"+EoUj%145%+?^ik+>"]l1FcmQF!u5g+=eRY2(8tA+Enqk+EnqY+>Pi)@rHE:1+F\r0d%th
G;LEm+Eo[l+>"^[1FWb?+Enqk+EnqY+>Yc&@rHE:G;UKp+EoUj%145%+?^ik+=eQi2_&<UF!u5g
+=eQi.X*]l.j0$n.1HV,G9B$kG9AI[1,LIjDf[<^.O]Kt+>"^[1FXFs+Eo[l%145%+?^ik+=eQh
2C`3TF!rdn.!IBg.j0$m+=eRY2(9s`$6XO84Wnqk.j-Q&.V!C<-o*8#G;C?l+EoXb.j0$n.4G]5
+Enqk+Enq[+>GW$@rHE:G;C?l+>PDpG;LEo+EoO_.j0$n.4G]5+Enqk+Enq[+>GQ"@rHE:1+IK)
+=eRY2'=InG;CZW$6XO84Wnqk/Kd#&@rHE:1+IK&+>"^[1E\1jG;UfY$6XO84Wnqk.j-c#@rHE:
1+F\r1*A.kG;13j+EoXb.j0$n.4G]5+Enqk+Enq[+?(c[Df[=N1FWb?+Enqk+EnqY+?:o]Df[=N
1*A(iG;UfY$6XO84Wnqk.j-c#@rHE:G;C?l+Eo[c/KceuG;1NU$6XO84Wnqk.j-`"@rHE:G;UKp
+EoRi%145%+?^ik+=eQl.V!C<-o*8#G;13j+EoXk+>"^[1E\1jG;UfY$6XO84Wnqk.j-Vt@rHE:
G;C?l+>PDpG;LEm+EoO_.j0$n.4G]5+Enqk+Enq[+>YKWDf[=N1*A(i1+F\r1a":kG;Ufu%145%
+?^ik+=eQj.V!C<-o*8#G;LEm+Eo[l+>"^[1+<Y>+Enqk+EnqY+>YKWDf[<^.O]Kq+=eRY1asOt
+Eo[l%145%+?^ik+>"]l.V!C<-o*8#G;C?l+EoXb.j0$n+>"^[0e"O\$6XO84Wnqk/Kci!@rHE:
G;C?l+>PDpG;LEo+EoOh+=eRY2(8tA+Enqk+EnqY+>YKWDf[<^.O]Kq+>"^[1FXFs+Eo[l%145%
+?^ik+=eQj.V!C<-o*8r0d%thG;UfY$6XO84Wnqk.j-Vt@rHE:1+F\r1a"@mG;1Nh.j0$n+>"^[
1+<Y>+Enqk+EnqY+>YKWDf[=N2'=In1+IK&.1HV,G9B$kG9ACY1FcmQF!rdn.!IHi.j0$m.3L,`
G;UfY$4R=bA4:HY6tL!R4Wnqk0-E&/0JG170JEqC+F\cgE,o]6Bldj,ATT[^:-pQ_E,o]6Bldj,
ATT&9/M/)dATW'6+ED1;ATMF)+E2@>C1Ums/e&-s$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+Dbt)
A0<71@<>p2F)c#1FCcg/$4R>OA8,Op?YO7nA7%J\+?MV4-mr_GAU#RS3^,9FA8,Qs0I\4oBl.F+
+=ATh-Y@LCF!,UIBl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>WDe*orBkhQs?TgFm
C2[Wq?YO7nA7%J\+=D2DF(KE(F=.M)%16$"<^fSS79Eo2C2[Wi+?_b.4$"a$F`_[P%13OO-Y[=6
A1&L4ATVs;+?MV3FE8R:B6#,/An)ro@WQX3-Qij*%15is/g,4HF<GXAF`;VJATAo9F(KA7CLqd4
+>"^VATMs%Ec`Er+EVNEFCArr+D#.sARffk$?L'&F`_SFF<DrRF(KAbAU/>>Eb0<'F=.M).!0Au
:K(484!8l2+=nWi+E2%)CEPGVB4Z0--ZWpBATMF)<HD_l94`Bi-Rg0^EbTW,+DPk(FD)dEIUd;6
Anbm2F`V,7CLqd4/n8L+-Qij*F)>i<FDuAE+DPh*B4#@fDe*3+-QmAKDe`inF<GX9FEMOM%13OO
Ci<`m+DPh*B4#@fDe*3qBldj,ATUpnATCFTH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZ
AS!!.BkqE*E+*Bj+Er$R/o#HGAor6*Eb-k5Df%.BGA1i,01U/!A7]g86Z6jSBkK(k;04HkF(KAb
AU/>+$;No?+CT)-D`T"SFEDI_0/%']De=*8@<,p3@rH3;B5)I(BleALEHGo*AM.V0F>%*>DdkA:
@<6O%E\D6C@P;2!F(I"IF(KB-AU/>L@rQAr$;No?%15is/g*T-@;Tt"ATKmA$;No?+<X-04#&fk
Bl7L'G@b?)ATBkKDdd0!-[oK7A8c@,05"^1ATKMABl7L'G@b?)ATBGHBm4)?Bkh]:%15is/g)9(
FE21J838Le7r3*bF('*74(<5KGB7>&C0r?%FEDI_0/%NnG:mWODe=*8@<,p3@rH3;C3OB-BeNM*
@prhhCgh@001ThsF)tc1Gpa%.:-pQB$;No?+<j0pEbm6q2BiS;:-pQU,"$HmCb&FtBkDH;7Q)G"
$;No?+<j`tBkDH;7Q)G"$;No?+<j96+q4lS67sB)6Zd?b.n2HA%15is/g)?*FE21J;eTlWF=Tg>
+q4lS67sB);eTlWF=Tg>+q4kg$:Zd40fr9ED..3k+@C9lEb0-14)AhDA0>W*A7o7`C2[Wi+BosC
+EDRG+=CW@Bl%<e-S0"NA7o7`C2[Wi+BosuCh7$q+=ANG$:AoUCb%t14#&fqATT%^F`MM6DKIs\
F!)iLEb]W/F(KE(F=/28+E(d5-Y@LCF!i)7+>Y-YA0<6I+Bot/AT;j,Eb-@@B4YslEa`c;C2[W1
%15IEEbm7)BPD(#.n29U0fqdGD/^UoF`]]cF!)i@F_u):F`\u?$:Zg50fr9EEHPu9AKXT@6p#F#
EHPu9AKW@5ASu("@;IT3De(4)$:AoUCb%t24#&fpARg!qCh4_]:II8mC2[X$DBLJQC2[X$AnEJ7
0b"IgBPD(#.n2<V0fr!'6m,$3CiDINDe*NmCiCLN%15Q]4"r`aAR]dp+B!?"4(Mf@F`&<L-OgDP
2ENWT<+U,m+B*,qCLoRa+EDRG+DPh*B4#@fDe*2a$<(VPAooOm2ENWT<+U,m+B<;nF?;3"EccCG
C2[Wq?YO7nA7$l8?Y+:tAStpl?ZU(&CLnk&$:Zs90fqdA@s)X"DKI!gF`MM6DKIrp+EDRG+=CW@
Bl%<e-S0"NA7o7`C2[Wi/14e8Ddt/8Bldj,ATV9sDffQ"Df9DuBlJ?8@P]cd$6UO&ASc1(,!$iN
$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV(Ahl&N2e"Tf/.*LB+<kZ6
FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL+sS4<EbTT+F(KH$+@UN`D/a<&F'NT,/.*LB
+<Vk5DB^V=+<VdL,#i5iF!,@=FCep"DegJ+ASl@'F*)G2FCfM9FD,5.8g%M^Bldj,ATV<&F(96)
E-*]T+CK5(F(KE(FC65$Df'H9FCfM9FD,5.EbTT+/0K%T@;^.#F=\PCDIal2ATT&:Bl.F&+E(j7
DIIBnA0>)J5uf%+FCB32>psB.FDu:^0/%NnG:mT<FY7TQB.k\d>](`:$6UH6+<k'.+tO'D+<VdN
<,Wn"F`&=DBPDN1DJsW.@W-1#+F.mJ+Dl7BF<G:8F*(i,C`m./8g%kkE-ZP:EZf./Ec,H)/g+)(
AKX]UEcc#5+B)]kEb08=F!+[WBllmg@N]]&E,Tf3FDl2F>psB.FDu:^0/$sPFD,f+/n8g:05Y-<
FD5VEF('33ATBG=CLqO(AS`e<AoD]4Bl8!6Eckl6Bl@m1/g:WF+<Xqs+<Z(`$6UI<$6UH6,%G2#
CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$/.*LB+<kN1,!$hj1hJ^)0etFC
+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klK
A8cU4+tO'D+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<Vk5
DB^V=+<VdL+<VkC3A*-@0e[9"1gtQP2)-j>GA1r*Dg-7U@rH4$ATD9p@;IT@GBYZSF)PZ4G@>N'
/n8g:0/>4:1G(:9/M]7a0f;!I0fh0J04Sg,DJ(OU2(^L62_S*'77B[/0jJT?/.*LB+<VdL+u1i-
1E\Ls0d&2++>Ynu1,^aB0f`KV+tO'D+<VdL+<k'.+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[F
EarZ)3ZqW6+<VdL,#1HW+A*c"ATDj+Df-\+DIal#@<?'cDB^V=+<VdL,'.U>F`_SFF<ERe3\`H6
-RW/:+tO'D+<VdNF)>i<FDuAE+>tB(0H__j>](`:$6UH6+<k'.+tO'D+<VdN:-pQUF(KG9E,Tc=
@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDisDB^V=+<VdL,&hI@FCSumEcXB)><3le+Z_P)-S$\t
.k<,#.k?!!-X7j&+Boso>](`:$6UH6+<kcCEcbf)@<-E30HpiH+<Xqs+<Z(`$6UI<$6UH6,%G2#
CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV&1L`0s3+Xul/.*LB+<kZ6FCA]gFC?@S+FAMf
$6UH6,'.[FEarZ)3ZqW6+<VdL+sS<T8T&Tk@;KagFD5Z2+C&e./.*LB+<Vk5DB^V=+<VdL,%,G*
F(KE(FC65*F!,"-F*)G:@Wcd(A0><%+CQBb+CSekDf.0M8TZ(hF!,17F*(i,Ch7-"Bl5&8BOr;Y
+CKY,A7TUrF"_9:@r$-n+D,P.A7]d6+A$Yt@ps6t@V$ZrDKBo.Ci!Zn+D,Y4D'3%QBllmg@U1Bq
FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF(eulCNCpIGA2/43[+nR+<Xqs+<Z(`$6UI<
$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i%/.*LB+<kN1,!$hj
0kE'o2`*O)+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>?rce+<VdNF)Q2A@q?iF
+Bo0q+<VdNCi<`m+=D,:@r5Xl-X:O5/.*LB+<Vk'67sC%D/XQ=E-67FBl8!6@;Ka&-YI.8BQ[cF
@UX%`Eb],F3A5,U@r$.!@:O(o-Ql/N/g,:S@rH4$ASuT4FDi:9DKBo.Cht4:+<h.8+<Xqs+<Z(`
$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoVU2.8@&1H7?</.*LB+<kZ6
FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL,#i5e+CJqm@r$-n+=Ki6BOPCdF"&5?A7TUr
F!+n3AKZ&*Ch=f"Df0Z*Bl7Km+<Xl\:IH=<ASu("@<?'k>psB.FDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM5JT8g&1bEbTK7F"SS(@:Nsn?tj@s?m'N#EbTK7
+DGm>@:NecD/`p$Bk:ftGA2/4+CK/!Amc`lDe!p,ASuT4FD,*)+Co&)@rc9mATJu-Dg*=GD]j1D
AKY]//g+)2D.Oi2@rc:&FE8uUCh[Zr+CK5(F(KE(FC65"Eb-A%CiaM;E+*6l@:s.^+EqOABHU_+
8p,)uFCfJ8DJsW.@W-1#+=M>FBlbD/Bl%?0+CT.u+CQC#E+EQg+Eh=:F(oQ1+E(j7FD,5.DJsW.
@W-1#/g*W%EZeq<@;Tt"ALnsGBOr;oEbTT+F(KH$+D,>(ATJu&Eb.::DB^V=+<VdL,$]"0/.*LB
+<VjN+<VdLEbTT+F(KGGBkh]oDB^V=+<VdL+s8!N+<Y]=F(KE(F=qNCAmB3t/.*LB+<VjN+<VdL
EbTT+F(KH#DJsW.@W-1#/no9MDIQjg+tO'D+<VdN+<VdL+ED1;ATMF)?Z'e(AR]RrCG'R:AmB3t
/.*LB+<Vk5DB^V=+<VdL,#i5eEb-A%Eb-A3FD,6++EM%5BlJ08+DG^9@")NpA8c@,05=p*CNEl+
@;]TuD/XH++EqO9C`m1u+CSekARloqEc5e;FD5T'+EVNEFD5T'/g+,3+ED%*Eb0<*+EV:.+D,P.
A7]d4+ED%-F)uJ8+EV:.+DG_7FCB!%+Cf>,D..<m/mN9</.*LB+<Vk5DB^V=+<VdL,"ZYp@:Wn_
FD5Z2+EVNEFD,6,AKYT!Ch7Z1FD,5.F*1r(DerrqEZeb=@:WneDK@IG@:O(o06CcHFC\g%@:13f
Df0Z*Bl7u7A79Rg+D,>(ATKIH?uft&ATMF)?m'&qCh7Z1Bl5&$FCfN8A79Rg?m&luANF(6+tO'D
+<VdN>](`:$6UH6+<hpN+<VdnEbT0"FC.sg@<-Er9kA?ZA8,Ii?U8LF@;]L`?SXES@<++^/o>-(
DB^V=+<VdL+s8!N+<YB,F^K#pD.R6bF*(i2F'g[V1,:J(G][2.+tO'D+<VdN+<VdL+AQ?gBkLjr
Bl@lr;flGgF"VQZFBi]-/.*LB+<VjN+<VdL+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X
,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp40$6UH6,&(R33ZoV,2DdEO2`5+i/.*LB+<kZ6
FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB
+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<ko=F*(r$FC?:7
+<VdL+<VdL+<VdL+<VdhA8-'J+<VdL+>Po.9jr&o1,C%.1-.6L3\iEpDB^V=+<VdL+<Vk;Ea`ir
G\qCPBkh]3+<VdL+<VdL+<VdL+<VdL0f(RF2'=Y6/PTYo/M]+)1,:mI2**KI>](`:$6UH6+<VdN
@WGmpA9_s1/oY?5+<VdL+<VdL+<VdL+<VdL0etUA2)6:03%[j5E\0%&+>P]51c7<L0jJT?/.*LB
+<VdL,%kk>F`_>6F"V0AF!)SJ+<VdL+<VdL+<VdL+<WBt0K2!71,pj[@<*qT1E\G.3]&]T1,3$O
+tO'D+<VdL+<kH;G]e+BCi_4JA7cr,+<VdL+<VdL+<VdL+<WBp1c%$I+>Po.9jr&o1,C%.1-.6L
3\iEpDB^V=+<VdL+<VkBE-Z>1/no'A+<VdL+<VdL+<VdL+<VdL+<VdL+>bu:3?U(:/PTYo/M]+)
1,:mI2**KI>](`:$6UH6+<VdNBlJ?8@P2V1Afr3=+<VdL+<VdL+<VdL+<VdL+?28>2Du[53%[j5
E\0%&+>P]51c7<L0jJT?/.*LB+<VdL,&Lb+BkCptF=q9BF!)SJ+<VdL+<VdL+<VdL+<Vd]1,1U.
1-$p\@<*qT1E\D.3\`TT0fN?T+tO'D+<VdL+<ki?F(KE(F=q9BF!)SJ+<VdL+<VdL+<VdL+<Vd_
1bh!J+>Pr/9jr&o1,C%-1HI?Q3\`BpDB^V=+<VdL+<VkKBldj,ATTPDA7cr,+<VdL+<VdL+<VdL
+<Vd]2`*3K1a"P6/PTYo/M]+)0f(jF3'&cQ>](`:$6UH6+<VdNEbTT+F(KH#DJsW.@W-1#/no9M
DIO_2+<VdL+<WR#2_cF13A!s6E\0%&+>GZ52)73L0jJT?/.*LB+<VdL,'%C=ATMF)?Z'e(AR]Rr
CG'R:Afr3=+<VdL+<WHt0K(p61-$p\@<*qT1E\D.3]/ZR0f`KV+poG8+<Ve4$6UH6+FOS>+<Xr@
$6UH6,'.[FEarZ)3ZqW6+<VdL,#1HW+CSekDf-\0Bl%@%>](`:$6UH6+<k?1EZc`Y@:WneDK@IG
@:O(o-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV*
@:D2N0fLs6/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL+sS<T<HDklB-:T&
Bldj,ATV<($6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2
?Xn"sDKI'`+>bVV+<VdNBk/DK+<kE.A2>qu0P2L[$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@
F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klK
Eb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#1HW+=M8EF(KE(F=A>HDKKH1Amo1\+EqaEA12LJ
3Zp131,CU@0JR;s1,:gG2dC5E/.*LB+<VdL,#1HW+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/R30;/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<:-pQUAoD^,@<<W6De*:%+Eh=:@WNZ4ATN!1FBi]-
/.*LB+<VdL,#1HW+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6
De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)T#67sBsDdd0t+ED1;ATMF)+EMX5EZen$FCAEl
+tO'D+<VdL+<jQI/g,%?G$f?0A79a++AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VD
ATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUEbTT+F(KG9+<Ve%67sC$Bldi:+EVX4DKBN6/0K"F
F<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQUG&:bN+>>E./hf@02`i-9
0d&c$EZd+k1,C%-1-.0M3]&d#DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6
+<jQI/g+tK@:UK.IUQbtDf0VLC11UfF"_QJF(KE(F=q9BF!i(Q:-pQU@:WneDBO+6EcYr5DHq''
/.*LB+<VkEDdd0!-ZWpBATMF)-Ql/N/g+\9Fs(s>EcYr5DHq''/.*LB+<Vk5DB^V=+<VdL,'.U>
F`_SFF<Dr+67sC(D.G[M-Qjr_/13,&E'-3)5&i\H+?hJ10IItk3$C=<.3MYc6um!_ATMF)+poG8
+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp:2
$6UH6,&(R33ZoVY11b#N2E!K</.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6
+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL
+<ko=G]Y,j+Bo0q+<VdL+<iTa3Zp+]DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sa(De!3tBl@lr
H"Cf.Dg-8EDf0,/FtG9gF(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<flFD5Z2/mN9<
/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQUD/X<#A3(hUCi<flFD5Z2?[64!Ci=N=FDl&.+E_fu
B5VX.AR'*s/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU+<YK=@psInDf/p-ASc1$GB7kEDIjqE
+<Xp,+tO'D+<VdL+<jQI/g)8Z:-pQUF`V,8+Dbt+@<?4%DBO.;FD)e,F`MM6DKI"3@<?'cDB^V=
+<VdL+<Vk'67sB'+DG8,?Z^3s@<itL+<VdL+<VdL+<VdL+C&e./.*LB+<VdL,#1HW>](`:$6UH6
+<VdN:-pQUA9hTo3ZoPSC`kkn+D,FmD.[<$Ci<flFD5Z2?[64!Ci=N=FDl&.+E_fuB5VX.AR'*s
/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU+<XEG/g,:XATJu1De!3tBl@l3GA2/4+F.O7Ci=N=
FDl&.+Cno&AR'*s/.*LB+<VdL,#1HW+<VdTCi<flFD5Z2?[64!Ci=N=FDl&.+>>5eBjl-kFDk\u
Gp"eGDB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g)8Z:-pQU@<,gkFE1f1Gp$X+FCfM9AoD]4
Ci<flFD5Z2>](`:$6UH6+<VdN:-pQU+<Y95FC0-.A79a+-o!Y81*A@q0f:R>1a$UQ@psInDf/p-
ASc1$GB7kEDIjqE.3NM:G$f?0A79a+0HaV<+tO'D+<VdL+<jQI/g)8ZAo2WsFDk\uGp"MODe!3t
Bl@lrH"Cf.Dg-8EDf0-8+>Gl41E\\#1,U[C2(9Y^@<Gq!De*:%+>@&<+tO'D+<VdL+<k'.+tO'D
+<VdL+<iQp0f'q0+?(EZDe!3tBl@lrH"Cf.Dg-8EDf0,/H!G52/.*LB+<VdL,!&tH+tO'D+<VdL
+<jEX9M%NF?ZKk%ATMF)?TgFmC3=?)EarNo+F.g74Y@k%>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQUCi=3(BlnK.ALns?@<?4*F_#&+GA2/4+EMX5DId0rA0>r-B5Vc5>](`:$6UH6+<VdN:I7uR
:I@EI8P`)gEbTT+F(KH#4ZX]m0ek@73&3EQ1*AD1/i5I?2)ecX+tO'D+<VdL+<k'.+tO'D+<VdL
+<jfb6Vg0@;ajYmEbTT+F(KH#4ZX]D/heCj+AP6U+AGd6+EV=7AKZ;;DIm'j+tO'D+<VdL+<jKN
9hA;Y5t>:&Bldj,ATV9B3ZoP'/heCj+AP6U+EMX9Ci!O#+DkP"DJ=38A7]"`+tO'D+<VdL+<jKN
9hA;T:JtA'EbTT+F(KH#4ZX]?0H_J\+AP6U+Co%rEb/g'+CS_tG%De0DfTQ<Df/ft+tO'D+<VdL
+<k'.+tO'D+<VdL+<l)JA33C`9M%NF4&81A9M\#A<(Tk\4&o6I:I[fP78u?B8PMcU9gM929M%rM
<(Ke_>$Pqh/.*LB+<VdL+t6c7+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[FEarZ)3ZqW6+<VdL
,#1HW+EM+9+CQC/De!3tBl@l3/KeJ4A0?/9F`JUCGA\O4Gp$U5Df09,B-:W#A0>`-A8,Y$Bl7Q+
Ci<flFD5Z2+Eh=:@WPdl+tO'D+<VdNCi<flFD5Z2?[64!Ci=N=FDl&.+poG8+C,<s+FPdJ+<Z"<
+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp=3$6UH6,&(R33ZoV#
Ahc8*3FlPB/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL,&Uh+
AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q
+<VdL+<iQt1L+fA/.*LB+<VdL+uUPu0H`,-2D?g@2(ggF+?))/1c7-N0fV!I1GLXB0Jst[0ek@7
3&3EQ1*AD1/i5I?2)cX50JYF,1a"M*1,W<S+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/M/J)/M/P+
/M/J)/M/P)/M/P+.pQs9/.*LB+<VdL,()akATDm$DBL&E+<VdL+FH^X+>bl33IE_>+<Z%c+>G!d
>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+.kN>)/LrD)/M/JXDB^V=+<VdL+<VkU
>&SJ!@3?[8+<VdL+<VeS85^Qe1Gq+=2Du[#HnZZt+FIF3+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+
/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9/.*LB+<VdL,()[mF_kJ/6$76jEa`cuF*pMV+>bl521.>A
+<Z%c+>k9h>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+.kN>)/LrD)/M/JXDB^V=
+<VdL+<VkU6#:[[@3@mTEb/ZqBlbDE85^Qe1H.7?2`NEIHnZ[$+FIF3+tO'D+<VdL+<i<f/M/P+
/M/P+/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9/.*LB+<VdL,()diDIm9qCgeG/+<VdL+FH^X
+>br31jh28+<Z%c+>Yp'>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+.kN>)/LrD)
/M/JXDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<kW?@psInDf/p-ASc1$
GB7kEDIjqE>](`:$6UH6+<i1)5uf%;:gnB]F!j+3+DG8,?Z^3s@<itL>](`:$6UH6+<k'.+tO'D
+<VdN:-pQUDKTf*ATAo3Afu,.F(oN)06:]HFD5W*+A"k!+EMX5EcYK'+tO'D+<VdNF)>i<FDuAE
+<sHD<EsDc/.*LB+<Vk'67sBsBl.R++DkP"DJ=38A7[;7@:F.uAKYZ)EbTi<DCcoFF_kc#DBNIu
FCd!GcBM9NBl5&7ARfXrA90:ECi=3(BlnK.ALns?@<?4*F_#&7+F.O,E\&>MDf0Z1+Cno+/nAKt
DB^V=+<VdL,'.U>F`_SFF<G'i@<-4+>](`:$6UH6+<jQI/g,4W@<*K.@;TR,+Co&)BkM<lFD5Z2
/0K%T@;^.#F<G".FD5i>A7ZloAS6$pATKCFFE1f-F(o_=FD5T'+>PbrBQ&$6F!,=6DKU&4F'NT,
/.*LB+<VkLD/XQ=E-67F2'@5u+A"k!+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,&Lb/
CLh@-DB^V=+<VdNBk/DK+<iXP@:M8WA2thb$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNF)Q2A@q?iF
+Bo0q+<VdN6tLIKBl%?k+ED1;AKYE!A0>r)F<G:8AoD^,@<?4%DBNY7+E2@>G%kJuA0>?,+CK5(
F(KE(FC6^F$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2
?Xn"sDKI'`+?(hY+<VdNBk/DK+<iXOAN4*P0JXh'$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@
F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klK
Eb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL+u1u50JG::/iPX12`!'C0K1gC1Gq*N0etRG2BZ?]
0fCX?2`3TQ2BXh4/iGOE2`ET:1,(I>+>Y,q2_HjC>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHpMR]DeseTHlt*q2'="q/i#FA0Jb[H
1c@'F1c[BN2BX,#+>l0,>](`:$6UH6+<VdNHlsOS+<Z%SHoO&;2'="q/iG^D3&<BK1-%-N0fLjF
2]sh5+>Ym&>](`:$6UH6+<VdNHlsOS+<Z%SHlt*q2'=S*0KCpF2_[-D0fLgI1c7-F2BX+t+>G^#
>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6
+<VdNHr=ZkASc`JHlsOd+<Vd\/i>LA2`WQL1c@*L1cR3L2'=V0+>Gd%>](`:$6UH6+<VdNHlsOS
+<Z%SHlt4)+<Vd\/iP^K0K1^A1c[NN2E!BJ2]sh7+>bd">](`:$6UH6+<VdNHlsOS+<Z%SHn[01
+>>E%0K(UE3&EQP2`3BM1bpjD2]s4s+<W[l>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHrFuu@psa=HlsOd+<W?j3A<0C2_[-I3&3<E
2DmEM+>PYo1H6M)>](`:$6UH6+<VdNHlsOS+<Z%SHlt4&+C?fT3&`iR0f1^I1G^pF2)[6I+<WE^
2)HG'>](`:$6UH6+<VdNHlsOS+<Z%SHn[01+<W?j1G^sG2)mHO1c@<Q1bga?+<WWd+>t?i>](`:
$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](_m+<VdL+C,<s
+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk%69R@P+C?iX2D-dE2*!NP+>bl,2Dd<N2`2^#
+AP6U+AHEfBk1pdDBN2%+tO'D+<VdN=\V:I3Zp131,C%/+>Pl\DB^V=+<VdL,#qE%3ZoP'+<VdL
+<VdL+<VdL+<VdL+<VdL+<Ve%67sBT;cFl><'qdHAnH*qFBi]-/.*LB+<Vk5DB^V=+<VdL,#1HW
+EMX5EZf7.D.P7@-nmf)Bldj,06:]HF"&X_@;L%"FEM,*F"AGUBl.F&+D,Y&@ruF'DII?(A79a7
+EV=7ATJu-Dfp)A/0JeDDKU&4F'NT,/.*LB+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;
ATMF)+=BHkB5_T64"!p?B4Ym,4"!sGBk(R!>](`:$6UH6+<klDDfp/@F`\a9:gnB]F'NT,/.*LB
+<VkLD/XQ=E-67F;KF#h+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB
+<kN1,!$hj11juU1M&7"+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<jcu
AKZ&9@<-E3Ch[s4ARlomGp$L8Bldj,ATV<&@rH3q+D,Y4D'2D9<?Q0fD.R6#F*(i2F"SRZ$6UH6
>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+?1nZ
+<VdNBk/DK+<iZt0fEJr1Gp@-$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdL
HO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL
,'7C@F<Wag>7)Jq+<VdL,4E.Y8O6?`:18!N/4=&jBkM<lFD5Z2/4`?//4*cjATD-Q@;TR,:2MO`
6rRGb/66UrB.QqH?V3(-0JG%GARf(>1,(C9/5L;#B5)67;f?f!@q@2_6nC]DDKBnN7<EflDes?)
H!a<bFCe]p+tO'D+<VdL+<j*\F)Pl;FDc"J=ALM+/6G\"2(W)W9R1M,?S#P80et@91Ft782D-pC
2Dm0H/2K:=0KCsI2_lp>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,6[E<RBHU2aE-5W+Bk&9)Ec5o8
F(&lH6"4nRCisi;D]ib8+CQC)Bk)7!Df0!"+Dkh5@:OFrDfp+DF*1r5FCB&sAKY])+EV:.+EM%,
/S8]>DJs]0C`l\qG/L"oDIFZ*@3AufF)Pl;FDc">-r_fO/mN9</.*LB+<VdL,!f^ID..H985^Qi
3B&KD1H73M/C(a[+@U<b/3tg@1,V$I/Mo.93%Qg;3&iHG1bLXD2)?sA/1i\4/i,1<2E*BB/1f)V
0e>b6Be3M,+tO'D+<VdL+<j*]BOu4%@<*ni;BReT1+Y@A3&iJ7YolJUBe2P$/M&S.1c6g>1bLU?
3&NHI/1i_</i#4@2`3BB6#pCCBk&\FcESohEbR((BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@-hEa`Ek
@lbabU=cX$Yoq\sfnA%5fn\4b+NhF:J`42+BlY>)DCoa7BQ>4D-ZWpEATB/>+D#G$-RgZQDB^V=
+<VdL+<Vjo@q]RsA1U8L+>PZ3/2K7@0eCVZ+@BRY/3tg@0JkdE.lB7B3@ls=1c?m>1+k=@2DR!C
/2]@=3&*9F3&`B>/C(^U6Xb$e>U!coEcZ=F@;p1%Bk:ftFDi;I[ie%HF)u&6E+N`lAKY])+EV:.
+B*&aCi3['AKXfcATMcpDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jQI
/g+tA@:X(iB-:\t@<,ddFCfK6+D,Y4D'2hX7P-SB6W7#.8O6?!F*(i2+Cno&@3B/rCh6jh+tO'D
+<VdN3&!$/HS-F]ART*lC2dU'BHS[O@:WneDK@IG@:O(o06CcHFC\g%@4u>'F^K#pD.R6bF*(i2
F'g[V1,:J(G]Y;W$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-
FD5Z2?Xn"sDKI'`+?:t[+<VdNBk/DK+<i[&2`*NN@5T5[$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdN
Dfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S
+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#2Q`ARlp)FCB323]&ZR>](`:$6UH6+<VdN
.kN>)/M/P+/M/J)/M/P+/LrD)/M/P+/M/J)/M/P+/LrD)/M/P)/M/P+/LrD)/M/P+/LrD)/M/P+
/M/J)/M/P+/LrD)/M/P)>](`:$6UH6+<VdNHpM4_DesQ<DJsng@ps4_EdU/_BOu4%@<-`]@q]Rs
A:-[QEa`F)6"=qXG^MeeF^ep"F*p8aBOPLaEaa>]A8#Cl@=1@OBPD:1>](`:$6UH6+<VdN.kN>)
/M/P+/M/J)/M/P+/LrD)/M/P+/M/J)/M/P+/LrD)/M/P)/M/P+/LrD)/M/P+/LrD)/M/P+/M/J)
/M/P+/LrD)/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<VkEDdd0t
FCB32INUCNDB^V=+<VdL,'.U>F`_SFF<Dr+@;TRd+EMX5EcX8h/0J1A3[73^<F8L0D.Qsi+tO'D
+<VdNF)>i<FDuAE+>GPmHS-F45uh8e@;TR"$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj
D..I#A8c[0+tO'D+<VkBA0O&W+uj'dA2lA'2'ORY+<VdND.RftA79Rg,!$inI4P^J+<VkLDfp)1
AKj/X>7)Jq+<VjoA7TCrBl@ltC`me@@<-EBDdmHm@ruc7@ps6t@V$ZjA7T7^+C]U=ARoLsBl7Q+
FD,5.8O6?!Anc'm+E)9C@X23r+tO'D+<VdNA8c1"B-;;0AKYT'Ci"$6Bl7Q9+C&e./.*LB+<Vk5
DB^V=+<VdL,#2]n+E(_(ARfh'+Dtb%A0>;'DIIBn/0JtIB4uB0@:NkdF(oQ1+=L,R.4cTMDIal#
ARfOjDIIX$Df-[G6tKjW>](`:$6UH6+<kE9EZfI;AKXT#0JG150HaqGDe!H5+<h.8+<Xqs+<Z(`
$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$0J!PR+<VkB
A0O&W,%W]D0K:dH@j3H2+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6
+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=
,!$iN$6UH6+<VdN1,LgH1,L[;2'=b7+C@&^/hf7@1-%?T3B9)[3B9)B1bp[>1G^g00f_3Q+>Y,q
0O/K>/.*LB+<VdL+tG5s/M/P)/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL
+<VkU<b6/kF*oZh+<WB]0J54<0ekFC1bq!D2E!EL2DZI11*AA,HsCP5/.*LB+<VdL,((LU+<VeS
+FG:i2BX\+3&*<O1c$pI3ArTM1cI?L+>Gl!1H'VcDB^V=+<VdL+<VkU+<VdL+FG;Z0J54*0J5(7
2)I<P3&!3K0ekRH2DZHu1*AD3HsCP5/.*LB+<VdL+tG5s/M/P)/LrD)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/JXDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g,"B
AT`&:E+^dG3B8WF0JHaL+tO'D+<VdN9L:m'+C@&^/hf7@1E\M0/i,:>1E[f867sBIDf^#=DHq''
/.*LB+<Vk29gh-*+>Gl93$:""1,)sN+tO'D+<VdN<DPb=+>@&<+tO'D+<VdN:-pQU@:WmkDdmHm
@ruc7DJsV>Bl5%b5uf%F@;TRs+>"^RAS#Cn+>"^R@;TR,+ECmA+Co%n>](`:$6UH6+<j*I69QqD
-p0RP-WXerF`SoZ/1<V;0ePC@0eta</3GXH/i5C=3AOiW+tO'D+<VdN5u0g1/g)\l/j:C+4$"`b
6:tT[@;TQu:I7Z\;F+Y^1,(C9+AY<r?USI8?V3(-0JFk'+=o,f5u0gPDB^V=+<VdL,"-!YFCA-i
:Ng;iBk1d^EbTT+F(KH#4ZX]C2I(,D/.*LB+<VjU<cW7(@o-TSD0%'f3ZohR9gh'C:HM6:4$5f)
67F$tBldj,ATT%B<b6/kF!k41+tO'D+<VdN0H`%pATD4#AKW?gAScHs<-(iYATDKqARBIlF(KE(
FC-D#DB^V=+<VdL,'.U>F`_SFF<G'i@<-4+>](`:$6UH6+<klDDfp/@F`\a,EcWE3+<Ve4$6UI>
/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj1GE5mA3"40+tO'D+<VkF
ATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<i$T+AH9YDKK<$DJ=!$+CT.u+Dl%-BkDX)
DJ()"EbTT+F(KH$>](`:$6UH6+<k'.+tO'D+<VdN6#:?[?uft&ATMF)?m&rtA7[;7A8bt#D.RU,
@<?4%DBNA*A0>u*F*&OG@rc:&FE8R5Eb-A7FDl22A0>T(+EV:.+A,Et+Co1rFD5Z2@<-W9?tOP'
F'pUC<,WmhBOPdkAR'*s/.*LB+<VkMBOr;rDe*E%DfQt@F`&=DBOr<.ATMr9@psFiF!,aHFWbR5
ARlp*D]ib3F*(i,C`mh5AKXT@6m-#S@ruF'DIIR"ATJu%Ap&3:?m&lqA0>9&FD5Q4?nNR,DB^V=
+<VdL,$]"0/.*LB+<Vk.F(HId-Z^DL@:O(]B4W3&@;]LdATAo8D]ib3F*(i,C`mh5AKXT@6m,oK
A8c@,+CJhnDImisCbKOAA7-r2?tX%gATD3q05>E9A8bt#D.RU,?nNQnAfuA;F^/f./.*LB+<VkA
@<Q3)Bl8!6@;KakA0>;sC`mh5AKYDlA8c@,+A,Et+DGm>@;Ksq@:XX+Df-\CDfp(CF*VhKASj&)
DB^V=+<VdL,$]"0/.*LB+<VjoAoqU)+DG_7FCB!%Bl7Q+8l%htA8aM6DB^V=+<VdL,$]"0/.*LB
+<Vj_/g*Q#GA_58@:UL&BOr;Y:IH=9F_u(?F(96)E--.^>](`:$6UH6+<k'.+tO'D+<VdN+<Ve2
BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkA:@<6O%E\DQWBl%iCBkh]p
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A
.9pa7/.*LB+<VjN+<Xp,+tO'D+<VdN+<Ve2BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"_!=DdkA:@<6O%E\D$IFE9'KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"_!=DdkA:@<6O%E\D$IFE9'KC3(h/DB^V=+<VdL+s8!N>](`:$6UH6+<hpN+CT.u+E2IF
+EV:.D'3P1+CQC#IWT.<E*sf#DerrqE\:U7+tO'D+<VdN+<Ve3DB^V=+<VdL+s8!N>](`:$6UH6
+<iQn+B*AjEc`Er:IH=6DIal"BOt[h+D,P4+EV:.+E2@4F(K6!AKYo'+CJf(FE:h4@;]Tu@!-R*
Ci`u:>](`:$6UH6+<k'.+tO'D+<VdNIXZ`<>](`:$6UH6+<jQI/g,4W@<-H48l%i[DB^V=+<VdL
,&D1+A0<74ASu("@;IT3De(5#DB^V=+<VdL+t,N6-Y@LCF!,UIBl%i<.3N1S+E(d<-X:O5/.*LB
+<VkWIXYO>+tO'D+<VdN+<Ve3DB^V=+<VdL+u:ho.On53Cj@.;AftQ$FD)e-Bk)7!Df0!(Bk;?.
@<,p%D/"'4Bl7Q+A8aLY.U6j8/.*LB+<Vk5DB^V=+<VdL,(=ui8mH6X/.*LB+<VkGATqZ--ZsNF
Ci^sH+AP6U+CfG'@<?(%+E_d?Ci^_0Bk)7!Df0!(Gp$g=+=DV\F(KAFC2[WnBk)7+06MANCi^t/
DB^V=+<VdL,&Ut9A0<73F`_[P+<Ve%67sBjEb/[$ATJu+F`_[IBl5%@IW]^CE\D0GA7TCaFE9*I
F`_[P>](`:$6UH6+<l8`IU$b7/.*LB+<Vk5DB^V=+<VdL+uCnp9Q+?M+EV:.+Co1rFD5Z2@<,q#
3a?PH/.*LB+<Vk5DB^V=+<VdL,(=ui8mH6X/.*LB+<Vk'67sBsDdd0!F`_>6F!,(/EcZ>-DB^V=
+<VdL,&_!7-ZsNFCi^sH>9G^EDe't<-X:O5/.*LB+<Vj^+Z_;"4DJhDFD)dEIWT.<E%c?UBl%iC
Bkh]:>](`:$6UH6+<jQI/g,1G@WcC$A0>o(An?!oDI[7!>](`:$6UH6+<iK^B5DKqF!a'nI4cX_
AThu7-RW/:+tO'D+<VdN:-pQUFCArr+D,>.F*&O6Bl7@"Gp$R)@r$4+>](`:$6UH6+<kc5@r#Tt
-ZsNFCi^t/DB^V=+<VdL,$]"0/.*LB+<Vk'67sBsDdd0!Ap&3:+EqOABHVG>Bl%i5Df-\:@<?0f
DB^V=+<VdL,&_!74$"a$F`_[IF`_>6F!i)7+>Y-YA0<6I>](`:$6UH6+<iK_3\V[=C2dU'BHS[O
FCf<.04o?KF"V0AF!k41+tO'D+<VdN:-pQUEb/^&Bl%<&Eb/ioEb0,uATM*o+tO'D+<VdN0Hb"E
Ddmc74s58++ED%:D]gDT>](`:$6UH6+<jQI/g,7ECLnW#Bl\9:+C]&&@<-W9@UWb^F`:T'+tO'D
+<VdNE+*6lA0<73F`_[P>](`:$6UH6+<k'.+tO'D+<VdN:-pQU@r-()AKYMt@ruF'DIIR"ATM*o
+tO'D+<VdN1E^UH+=AOADB^V=+<VdL,(=ui+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X
,&Lb/CLh@-DB^V=+<VdNBk/DK+<kAT1,rl'@UUH3$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNF)Q2A
@q?iF+Bo0q+<VdN<+ohcEb0<6+E(j7FD,B0+Du+>AR]RrCEP*8F)uJ@ATK=DH#IgJBOQ'q+DG_7
FCB!%ARlokAp&3:?m&lqA0>9&FD5Q4?nNR,DB^V=+<VdL,$]"0/.*LB+<Vk"F<G".F)N10F)uJ@
ATJu&+C\c#Bk&9$DJs`8ARoFb+E(j78l%i-+B)i_+EV:.+A,Et+AH9^F^])/AoD]4A7]jkBl%iC
>](`:$6UH6+<jcuAKXT@6m,34DKTB(+DGm>A8-+,EbT!*FCeu*Bl5&8BOr;oB4YslEa`c;C2[Wn
De!p,ASuTt+CSekDf-[L+EM+*3a?PH/.*LB+<Vk5DB^V=+<VdL+s8!N+<Z,AA7TUrF"_0;DImis
CbKOAA7TUgF_t]-F>%TDAn5gi05>E9/oY?5>](`:$6UH6+<hpN+<Ve3DB^V=+<VdL,%,/(A1hh3
Amc`qF!+n-F)N10G%#*$@:F%a+E)-?>?#9I+A,Et+AcKZAR-]tFEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_F+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4
AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<kDP@qIN.Amur8$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdN
F)Q2A@q?iF+Bo0q+<VdN,9n==EbTT+F(KH$+EV19F<GXIBlmokDB^V=+<VdL,$]"0/.*LB+<Vk&
@;^?5?uft&ATMF)?m'Q&F*&O7@<6"$+CT;%+DG^9?tOP'F'pUC7riNjE-!.?Afu2,F*&O7@<6"$
+CT;%+CehrCh7-">](`:$6UH6+<klLBlmp-/g+,,AKYK$DKKH-FE8RCAfu2/AKYB$Bldj,ATV<&
F*22=AKY].3[+nR+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-
Df/olDfor>,!$i$0e<YS+<VkBA0O&W+uhG<3+66+2Bj[Z+<VdND.RftA79Rg,!$inI4P^J+<VkH
F`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X
,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN.kN8'/M/P+/M/P+/M/P+/M/P+.kN>)/LrD)
/M/P)>](`:$6UH6+<VdNHng"eE+NouA0<:@G;!uT.3L3+HtIMCF*r+PBl%j<>](`:$6UH6+<VdN
.kN8'/M/P+/M/P+/M/P+/M/P+.kN>)/LrD)/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkL
Dfp)1AKj/X>7)Jq+<Vk'67sC!E+No0Ap&3:+CT.u+E_d?Ci^^N+CT>4F_t]#+E)41DBO(>FD5P6
DJsW.@W-1#+D#G$>](`:$6UH6+<kW?@:UK.B4YslEa`c;C2[W1>](`:$6UH6+<k`7+?MV3Ap&3:
+E_d?Ci^sH>9G^EDe't<-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6
,%Z"1@s)m-Df/olDfor>,!$i$1+WbT+<VkBA0O&W,%3H@2`P5%1a4IX+<VdND.RftA79Rg,!$in
I4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE
?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P)>](`:$6UH6+<VdNHnc`d+<VdL+<VdL+<VdL+<VdL+<VeS>](`:$6UH6+<VdN.kN>)/M/P+
/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)?X\%bDDGR?D/X3$+<VeS>](`:$6UH6
+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)?Y+:tAStpl?ZU(&
CLnW9>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)
?Ys@cF`Uo2D/X3$+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6
+<VdNHu`qBATMF)?Z':qF*(i2F'j!*Deip3>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P)>](`:$6UH6+<VdNHu`qBATMF)?ZKk%ATMF)?ZU(&CLnW9>](`:$6UH6+<VdN.kN>)/M/P+
/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)?Z]^oDImiqF)>i2AKW+C>](`:$6UH6
+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1
AKj/X>7)Jq+<Vk'67sBsBleA=FCfN8+Cei$ATJu.DBL?JBldj,ATT@DF*22=AR'*s/.*LB+<VjZ
/g)qmB6%r6-ZWpBATMF)-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6
,%Z"1@s)m-Df/olDfor>,!$i$1FrkU+<VkBA0O&W+uWmb@l#o!A0NQ3+<VdND.RftA79Rg,!$in
I4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE
?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN:-pQ_EbTT+F(KH#EbTT+F(KH#
F)>i2AKZ(H/KcH^Bldj,ATT@DF)>i2AKZ)+F*)IU>](`:$6UH6+<VdN:-pR<DB^V=+<VdL+<Vk'
67sBjEb/[$ARmhE1,(I>D..H?2dC5E/.*LB+<VdL,#1HW+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk5DB^V=+<VdL
+<VkEDdd0!-ZWpBATMF)-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+Dk\$F`S[EB.b;e3@lm=
0O/K>/.*LB+<VdL,"t<d3Zqcg0eP.>1G^.11+k@=1G^-r:-pQU6>ppeDf/ft+tO'D+<VdL+<jr_
6p3RR0f_3Q+>Y,q0O/K>/.*LB+<VdL,#qE%3Zp+]DB^V=+<VdL+<Vk'67sBhA7Qg$@VTIaFE8RB
Dfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)/Keq>D.P7@Ea^LAA7]7UDB^V=+<VdL+<Vjo:I72s+=K?6
3[[s>DKU"J.4cl01bgUA1GLXF.4dS93%d$E0KCmnDB^V=+<VdL+<Vjo:I72s+=nil4s2783[[]i
8mb>%D.Ohc6:tT_6!m5>0JG1':I7Z\6tKk88hr(S0IJ:l/1r&2:I8<(+tO'D+<VdL+<j3bCij)b
F&-sjEbT&q?ZKk%ATMF)?TgFm2)\]W+tO'D+<VdL+<i16EcW@5:gnB]F!j+3+=LAe6p"CE4%qt&
4@)b0.3NYFF(KE(F<Dr3ASuX3-X:O5/.*LB+<VdL+tt,n,\;")F(HIA6tL1V@8q;DG%G].A7]+g
Bldj,ATV9,>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQUG%#30ATJu&Eb-A;Bln$&DBLYf+Dkh1
F`_29+E(j7FD,5.D.R:$F!+q1DegJ#DB^V=+<VdL+<Vk'67sC$ATN!1F<E.XDJsV>B6%QlF<G%8
F<G47De'u%DJsZ1BHUo*EZen(D/UP@DfTVuDB^V=+<VdL+<Vk&AS$"*D/!lN3ZoOq03f\D0d'aE
2D?7.+=^V?0d'aE0esk,2'=Fm0f^@50d&#.+>P&s2-b#C/.*LB+<VdL+u(bo4s3$A076K*AT`'2
Bl5%F+=f*M+s8T_>p)$Z+>Fug>TtmF>p*K0+F>_G+u(3%1*CpK+u(3@EcW@.DB^V=+<VdL+<Vk5
DB^V=+<VdL+<Vk%69R@P+C?iX2D-dE2*!NP+>bl,2Dd<N2`2^#+AP6U+AHEfBk1pdDBN2%+tO'D
+<VdL+<jr_6p3RR1,(I>+>Y,q2dC5E/.*LB+<VdL,#qE%3ZoP'+<VdL+<VdL+<VdL+<VdL+<VdL
+<Ve%67sBT;cFl><'qdHAnH*qFBi]-/.*LB+<VdL,$]"0/.*LB+<VdL+t$90+Ce5VEc#kF4ZX]6
=\V:G<DP\M67F$tBldj,ATT%B6#:1PCaU?1DB^V=+<VdL+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE
4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,4"!sGBk(R!>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQU6?6dQBQP@qFCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjkmaDB^V=+<VdL+<Vk'67sBoFEDJC
3\N.1GBYZJCi*Tu@:Lp"Df%.9F*)G@DJsB;04Js9B4uB=F*(i2F"_iRE+<fsAM6#!2Dd<F1,(I>
/MJt41,iHU+tO'D+<VdL+<j-n4ZX]I3[[40FCAm(+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d
@<,do+AuodAS`JV@;odoCgeGQASc0kFE2)?-X:O5/.*LB+<VdL,!p?63Zpb1/3>m?6=k7MChI=%
F(HImBl[p1F!+;"De"'2DBMboCi"6=+Auc`F_l2A+B*5n@ppKGEas36EclFG6#LdQEb0;7<b5oP
-QlZ3+tO'D+<VdL+<k'.+tO'D+<VdL+<i12F!+sh@<-4+-TsL5-s9844&o'<9L:0NEbTT+F(KG9
6??CL+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,7V@;^.#FE8RA@<?!m+D,%rEbp"DG@bT,+ED1;
AM8+9FE8R8BkCsgEZd4^FDi9V0Hb4HDKU&4F'NT,/.*LB+<VdL,!p?MEa`j,BllL!+?:Q!3%Qd<
+?1o,1*A>0/29%*1Gp^<3$9t-0fU:40e>%=+>bl*3\`T:2)/?R+tO'D+<VdL+<j-n<,uDbF(o_Z
3Zpb1<,uDbF(o_=/0HZ-+>PZ&1,'h*0e>(7+>k]*0d&2*/2B"(1GgX<+>ku,1E\M2/2\P-3%R*M
+>d>@+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,7V@;^.#F<G".FD5i>A7ZloAS6$pATM*o+tO'D
+<VdL+<j-n6#:X+3Zp:;+?2>'0fC.62]t"6+>Yu"3&_s;10e]@/.*LB+<VdL,!p?:Cihg$+@:-8
Cih3c1E\G5+>kkr2`)X73$:"7+>u)"0f^@92-b#C/.*LB+<VdL,$]"0/.*LB+<VdL,#h954ZX^4
3a<j`+B!8cDB^V=+<VdL+<Vjo9N4/9+=JX#0fpp?.40Bg4s3g!:amM</g*K%6#:Wc>](`:$6UH6
+<VdN<)Q[Y3Zoh!4>AoQ+>YGnHR:p!<)$1<+=o,f6??+H@;^.#FBi]-/.*LB+<VdL,$]"0/.*LB
+<VdL,#1HW+CT).BlnK.ATJu2@<?!m+EVNE0d("<B6%Qp>](`:$6UH6+<VdN0d&V%4t\K2/MC?Q
0d&bU<*X;b/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+EVX4DKBN6+EV=7ATJu2@<?!m+EVNE0d(=I
DKU&4+DG^9GAhMCF<G(%F(JTo+tO'D+<VdL+<iN_4Wlp@0-GWb-oNb%,<B-l?SN[/+>=om+F@?;
0d'Fn<%/qA+>tnr,<B-l?SN[/+>P&q+F@?;0d'Fn<*X;b/.*LB+<VdL,$]"0/.*LB+<VdL+t#rJ
<?P%&<[U$k+Dbt)A92j$EcW?W>](`:$6UH6+<VdN.!mRO+u(385uoEt3Zrc1>TtmF:-hocDB^V=
+<VdL+<VjVHS/PI0d'%R<@L'l+F?.S+u(335uh0-+tO'D+<VdL+<i1.@<Q[4+Ce5VEc#kF4ZX]6
=\V:G<DP\M67F$tBldj,ATT%i@<Q!VFCB2s:18!N>](`:$6UH6+<VdN-V7`hEcW@5:gnB]F!j+3
+=LAe6p"CE4%qsi+ED1;ATMF)+A"k!?VY$HAR'*s/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+Co%q
@<HC.+C&e./.*LB+<VdL+t$)rEbT&u@;^+,+Ce5VEc#kF4ZX^"@<Gq!De*:%+>@&<+tO'D+<VdL
+<k'.+tO'D+<VdL+<jQI/g+\5FCcS5Aft)iF`MUIF*(i2+E1b0FEo!>Bl7L&>](`:$6UH6+<VdN
F\5%b3Zr0[Ch@]t@;I'/=\V:I3Zp131,9t,0H`)1>](`:$6UH6+<VdN<D6Cj<BWAc0f(O:0JPRE
0d'gY2(g[A1GCOgDB^V=+<VdL+<VkN<E)=K3Zqci/i=bVDB^V=+<VdL+<VkN9MIfC4ZX]D/hgOJ
+tO'D+<VdL+<kr%85E,e4ZX]C>](`:$6UH6+<VdN-WOu*EclDD+Ce5VEc#kF4ZX]6F]hF,4*=.`
4&nsS;H5f$<E)=IF\GLq7ltie85E,e.3N>5F^K6/A79a+0O/K>/.*LB+<VdL+t$B,F`MVFF!+sh
@<-4+-TsL5.!8Ze6p#N`6p"CB<DlgYF]DC.4*=4k5t="Z9LqrW=t(S3@<Q""De*:%+>@&<+tO'D
+<VdL+<k'.+tO'D+<VdL+<i1.@<Q[4+Ce5VEc#kF4ZY!-De!3tBl@lrH"Cf.Dg-8EDf0-8+>Gl4
1E\\#1,U[C2(9Y^@<Gq!De*:%+>@&<+tO'D+<VdL+<i1.@<Q[4+Ce5VEc#kF4ZY!-De!3tBl@lr
BQ%a!INU@*2)ZR9+>Gi)+DtV2?Z^3s@<itL>](`:$6UH6+<VdN-Ve)nEcW@5:gnB]F!j+3-u<g3
@<?4%DI7O&F`MVR+>PW-1E\V!1+=>`@<Q""De*:%+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL+<iK^
0I14M@<6!&-UCNp+AHEYF`VD6DBMu#F!+.C+B_E,+B;2[;KEsIF!*ej<,uDbF(o_=6?>G/F<FOW
:`r%t<$5.<<$4qEG&hXH8RZa^F!+sh@<-4+-X:O5/.*LB+<VdL+tt,n,\;")F(HIB4$"`\5uf%&
5uo?^+=nW`HS/PI0d'4W<[fRBHS/PI0d'%R<EsDc/.*LB+<VdL+tt,n,\;")F(HIAF]hF,+E^:E
+B;*8;H4i^<E)=.F\GLq7j)qJ85E,e+AHEfBk1pdDK9e@<GZeuF`MON>](`:$6UH6+<VdN>](`:
$6UH6+<VdNF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV:"Bldj,ATV:#D/X3$-X:O5$6UH6+<Xqs
+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQUF(fK9+EV19F<G(%F(JTo+tO'D+<VdN
0d("@F)W6LEbTT+F(KH#EbTT+F(KH#F)>i2ALAZ/+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==
3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag0f1Eg+<VdNBk/DK+<iU#2e=s,1c?O/$6UH6
,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY
$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#1HW+=M8E
F(KE(F=A>HDKKH1Amo1\+EqaEA12LJ3Zp131,CU@0JR;s1,:gG2dC5E/.*LB+<VdL,#1HW+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/R30;/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<:-pQUAoD^,
@<<W6De*:%+Eh=:@WNZ4ATN!1FBi]-/.*LB+<VdL,#1HW+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0
<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)T#67sBs
Ddd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++AP6U+DtV)ARlp$
@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUEbTT+F(KG9
+<Ve%67sC$Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6
+<VdN:dJ#Y7790t+ED1;ATMF)?X\%bDDGR?D/X3$>](`:$6UH6+<VdN:-pQU-us$CATMF).3N>B
FCfK)@:NjkGAhM4.!$gu+>PW+1GCX>0krEu1,q*L>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQUAo2WsFDk\uGp"5)67sBmDfT]'F<G[DA79a+
G%G]'F!,L7F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"5)67sBu@;TRd+A"k!+EMX5EcW@D
Ble!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<XEG/g+tK@:XF%EbTT+
F(KG9F*(i2+Cno&@9d[o/.*LB+<VdL,#1HW+DtV2?Z^3s@<it<:-pQUDIIBnA0>buG%kStFD5Z2
+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sC$Bldj,ATT%;+<XEG/g,1K
F(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N
6om@OEbTT+F(KH#ATMg%DII<fF)>i2AR'*s/.*LB+<VdL,#1HW+=M8EF(KE(F=A>HDKKH1Amo1\
+EqaEA12LJ3Zp131,CU@0JR;s1,:gG2dC5E/.*LB+<VdL,#1HW+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/R30;/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<:-pQUAoD^,@<<W6De*:%+Eh=:@WNZ4
ATN!1FBi]-/.*LB+<VdL,#1HW+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VD
ATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)T#67sBsDdd0t+ED1;ATMF)+EMX5
EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B@<-E3
EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUEbTT+F(KG9+<Ve%67sC$Bldi:+EVX4
DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6+<VdN:dJ#Y7790t+ED1;
ATMF)?Ys@cF`Uo2D/X3$>](`:$6UH6+<VdN:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu
+>PW+1GCX>0krEu1,q*L>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
>](`:$6UH6+<VdN:-pQUAo2WsFDk\uGp"5)67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@>](`:
$6UH6+<VdN:-pQUBjl-kFDk\uGp"5)67sBu@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7
A79agDB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<XEG/g+tK@:XF%EbTT+F(KG9F*(i2+Cno&@9d[o
/.*LB+<VdL,#1HW+DtV2?Z^3s@<it<:-pQUDIIBnA0>buG%kStFD5Z2+EMX5EcW@DBle!+B.n=;
FED57B-;;7A79agDB^V=+<VdL+<Vk'67sC$Bldj,ATT%;+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9
+EV=7ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<VkGDfTr5ATDZ2BOu$pF)Yf(Eb-A4
@<6N54Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4[!%f+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+<VdL+>t?:@:q/cBl+t8+FIF3+tO'D
+<VdL+<l1U+<VdL+<VdL+<VdL+<WBm+@0ITG%E6rDfU/O>](`:$6UH6+<VdNHlsOS+<VdL1,LaF
3B0#O2`2^MF_kc#DBL&E+FIF3+tO'D+<VdL+<l1m/hf:>3&30B2`*9H2`*BJ+O63N+<VdL+<VdL
HsCP5/.*LB+<VdL,((LU+<VdL+C?iX0J5=?2`WW99Q+f]BlnK.AKZA*DB^V=+<VdL+<VkU+<VdL
+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<Vd]3AWN8=_2#^
+<VdL+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL+<VdL2]th5DKKP7+<VdLHsCP5/.*LB+<VdL
,((LU+<VdL+<VdL+<Vdb/i#:,6t(?nA7Qf*+<Z&:DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+
/M/P)/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHqn*eAKW*<+<VdL+<VeS6tLFRB5V."Bl@m:<,sQV
Cih6sAS6BiE\0%'/P'nVBl8<'DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)
/M/P+/M/P+/LrD)/M/P+/M/P+/Lt(D+tO'D+<VdL+<l22@<5jnBOPOrAKW*<+FH^X+>u)72BX+b
+FG:h3%cm-+<VdLHlsOc+<WE^+<VdLHsCP5/.*LB+<VdL,(*$lF`SZkF`VYF@;KY!Hq7-X2E3WU
+<VdLHlt-u/heCj+<VeS+<W?\2)$-q+<VeS>](`:$6UH6+<VdNHrafk@3?[8+<VdL+<VeS85^Qh
0JG4(+<VeS+?2212'="a+<Z%S+>Fu]2'="a+<Z&:DB^V=+<VdL+<VkU:3CGiBcnN@+<VdL+<Z&&
;BRnQ1,0mo+<Z%S0f^j?+<VdL+FG:S0d&5++<VdL+FIF3+tO'D+<VdL+<l2!Cij*"EZcJI+<VdL
+FH^X+?)/82]s4c+FG:h1bLI)+<VdLHlsOe+>Get+<VdLHsCP5/.*LB+<VdL,()diDIm9"+<VdL
+<VdLHq7-X2`WWM+<VdLHltC//i=ao+<VeS+<WH_+?:Pe+<VeS>](`:$6UH6+<VdNHpqpeAfr3=
+<VdL+<VeS85^Qi1GCd2+<VeS+>l#/0H_J\+<Z%S+>b2q0H_J\+<Z&:DB^V=+<VdL+<VkU7W3-P
ChR7"F<D\K+<Z&&;BRqX1,pC!+<Z%S0f:R@+<VdL+FG:S2'=Y1+<VdL+FIF3+tO'D+<VdL+<l2-
@<--l@NZd9+<VdL+FH^X+?2;>0d%S]+FG:i0J54*+<VdLHlsOh+>Y_p+<VdLHsCP5/.*LB+<VdL
,()[mE+ig'@<?f<+<VdLHq7-X0f:'r+<VdLHlt@)/i=ao+<VeS+<WQb1Gg3s+<VeS>](`:$6UH6
+<VdNHph[fBOkNo+<VdL+<VeS85^Qb3&i$'+<VeS+>Pl.0H_J\+<Z%S+?(Dc3?TFe+<Z&:DB^V=
+<VdL+<VkU87?@DC`jiC+<VdL+<Z&&;BRkP2]s4c+<Z%S2E3<H+<VdL+FG:S3$:"4+<VdL+FIF3
+tO'D+<VdL+<l2-ASu9lEZcJI+<VdL+FH^X+?;/2+<VdL+FG:g3A*03+<VdLHlsOl+>Pku+<VdL
HsCP5/.*LB+<VdL,()[mA7]4YEa`i.+<VdLHq7-X0f1aH+<VdLHlt=&/heCj+<VeS+>GSn+>Fu]
+<VeS>](`:$6UH6+<VdNHr=ZkAS`J3+<VdL+<VeS85^Qb2_d*2+<VeS+>Yr/2'="a+<Z%S0eje-
0H_J\+<Z&:DB^V=+<VdL+<VkU6XaqFCi!N&+<VdL+<Z&&;BR\Q0K:0t+<Z%S3&iNJ+<VdL+FG:d
0d&;,+<VdL+FIF3+tO'D+<VdL+<l2"ASc0kFE2)?+<VdL+FH^X+>Gf80H_J\+FG:h1+k7'+<VdL
Hlt-u+>khq+<VdLHsCP5/.*LB+<VdL,()gqDIIX#+<VdL+<VdLHq7-X0fM*I+<VdLHlt@)/heCj
+<VeS+>GSn2)$-q+<VeS>](`:$6UH6+<VdNHpMRdBl%3p+<VdL+<VeS85^Qb3A<63+<VeS+>bo-
2'="a+<Z%S0esjo0d%S]+<Z&:DB^V=+<VdL+<VkU6=k7MChI=%F(HI:+<Z&&;BR_K2DH<s+<Z%S
2)?j=+<VdL+FG:d1*A>++<VdL+FIF3+tO'D+<VdL+<l23Bl[p1F!)SJ+<VdL+FH^X+>Pc60d%S]
+FG:e3A*!.+<VdLHlt."+>GPm+<VdLHsCP5/.*LB+<VdL,()[eBOPpi+<VdL+<VdLHq7-X1,^jH
+<VdLHlt.%/i=ao+<VeS+>GYp1,L*r+<VeS>](`:$6UH6+<VdNHr+j%@sN!1+<VdL+<VeS85^Qc
3A`N7+<VeS+>kl+0H_J\+<Z%S0f1!q1a!n`+<Z&:DB^V=+<VdL+<VkU:iC/dFa,#O+<VdL+<Z&&
;BR_T3A;Qu+<Z%S2`!'D+<VdL+FG:d1a!o$+<VdL+FIF3+tO'D+<VdL+<l2!CiF&rEb$:8+<VdL
+FH^X+>Yr53$9=d+FG:f2_Hd,+<VdLHlt.$+>kns+<VdLHsCP5/.*LB+<VdL,(*:"B6A$5F!)SJ
+<VdLHq7-X1H@EM+<VdLHlt:+/heCj+<VeS+>Gbs1GU'q+<VeS>](`:$6UH6+<VdNHphO`AR]Ro
@3?[8+<VeS85^Qe2)@'3+<VeS+>to+2'="a+<Z%S0fU:11E[e_+<Z&:DB^V=+<VdL+<VkU7qlOP
@;$c++<VdL+<Z&&;BReS2DQBt+<Z%S1,pmD+<VdL+FG:d3$:%3+<VdL+FIF3+tO'D+<VdL+<l23
E+rfj+<VdL+<VdL+FH^X+>ki12BX+b+FG:f1bLX.+<VdLHlt.(+>c)$+<VdLHsCP5/.*LB+<VdL
,()[s@ruj6F`SZJ+<VdLHq7-X2)@'C+<VdLHlt=)/heCj+<VeS+>PVn1H?R#+<VeS>](`:$6UH6
+<VdNHs1Z%ASu'qB4Yt'@VHs485^Qf2)?s0+<VeS+>Y](0H_J\+<Z%S1,0n+1a!n`+<Z&:DB^V=
+<VdL+<VkU6#:LRARf4Y+<VdL+<Z&&;BRhU3AVd#+<Z%S2_m!C+<VdL+FG:e0d&>5+<VdL+FIF3
+tO'D+<VdL+<l2!DKK<-ATJt:+<VdL+FH^X+>tr11a!n`+FG:d3A*!.+<VdLHlt1"+>kns+<VdL
HsCP5/.*LB+<VdL,(*<t@VKU#+<VdL+<VdLHq7-X2D[9O+<VdLHlt4!/heCj+<VeS+>P_q1G^-r
+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+
/M/P+/M/JXDB^V=+<VdL+<VkGDfTr5ATDZ2BOu$pF)Yf(Eb-A'F`MM6DKI!a4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4[!%f+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6
+<VdNHlsOS+<VdL+<VdL+<VdL+>t?:@:q/cBl+t8+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL
+<WBm+@0ITG%E6rDfU/O>](`:$6UH6+<VdNHlsOS+<VdL1,LmC0JbC82`2^MF_kc#DBL&E+FIF3
+tO'D+<VdL+<l1l1G1L<2`*6F2)dKL1,M!L+O63N+<VdL+<VdLHsCP5/.*LB+<VdL,((LU+<VdL
+C?iX0J5=?2`WW99Q+f]BlnK.AKZA*DB^V=+<VdL+<VkU+<VdL+<VdL+>bo-1c@$F2]te&FD5i>
A7Zl+HsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<Vd^0JYF,=_2#^+<VdL+<Z&:DB^V=+<VdL+<VkU
+<VdL+<VdL+<VdL+<VdL1E]D1DKKP7+<VdLHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<WEu/i#:,
6t(?nA7Qf*+<Z&:DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB
+<VdL+tG5s/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](`:
$6UH6+<VdNHqn*eAKW*<+<VdL+<VeS6tLFRB5V."Bl@m:<,sQVCih6sAS6BiE\0%'/P'nVBl8<'
DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+
/Lt(D+tO'D+<VdL+<l2$ASu'gDeri)+<VdL+FH^X+>br31a!n`+FG:i0J5%%+<VdLHlsOc+>l&"
+<VdLHsCP5/.*LB+<VdL,()mpAStpi+<VdL+<VdLHq7-X1c@6I+<VdLHlt1(/heCj+<VeS+<WB]
1,9sp+<VeS>](`:$6UH6+<VdNHrFuu@ppK&+<VdL+<VeS85^Qf0Jta2+<VeS+>Yi,2'="a+<Z%S
+>P&q1*@\^+<Z&:DB^V=+<VdL+<VkU6#pIWF`MVG+<VdL+<Z&&;BRhQ1b^$p+<Z%S2Dd$D+<VdL
+FG:S1E\G.+<VdL+FIF3+tO'D+<VdL+<l2:F^ep"ASc!jDKTE&+FH^X+>l#40d%S]+FG:e3A*03
+<VdLHlsOf+>l)#+<VdLHsCP5/.*LB+<VdL,()[mE+ifm@ppK&+<VdLHq7-X2)dNO+<VdLHlt@'
/heCj+<VeS+<WK`1bg*q+<VeS>](`:$6UH6+<VdNHpMXl@<,q#+<VdL+<VeS85^Qg0f(X/+<VeS
+>Gl/0H_J\+<Z%S+>k8t2BX+b+<Z&:DB^V=+<VdL+<VkU;dj-LCEO`B+<VdL+<Z&&;BRkR2`Mp&
+<Z%S1GCF8+<VdL+FG:S2BX_4+<VdL+FIF3+tO'D+<VdL+<l22@<5jnBOPOrAKW*<+FH^X+>u)7
2BX+b+FG:h3%cm-+<VdLHlsOi+>beq+<VdLHsCP5/.*LB+<VdL,(*$lF`SZkF`VYF@;KY!Hq7-X
2E3WU+<VdLHlt-u/heCj+<VeS+<WTc1GBpo+<VeS>](`:$6UH6+<VdNHrafk@3?[8+<VdL+<VeS
85^Qh0JG4(+<VeS+?2212'="a+<Z%S+?(E"1*@\^+<Z&:DB^V=+<VdL+<VkU:3CGiBcnN@+<VdL
+<Z&&;BRnQ1,0mo+<Z%S0f^jD+<VdL+FG:S3$9=u+<VdL+FIF3+tO'D+<VdL+<l2!Cij*"EZcJI
+<VdL+FH^X+?)/82]s4c+FG:h1bLX.+<VdLHlsOk+>l&"+<VdLHsCP5/.*LB+<VdL,()diDIm9"
+<VdL+<VdLHq7-X2`WWM+<VdLHltC//heCj+<VeS+<WZe1c?I!+<VeS>](`:$6UH6+<VdNHpqpe
Afr3=+<VdL+<VeS85^Qi1GCd2+<VeS+>l#/2'="a+<Z%S0ea_,3?TFe+<Z&:DB^V=+<VdL+<VkU
7W3-PChR7"F<D\K+<Z&&;BRqX1,pC!+<Z%S0fCX<+<VdL+FG:d1*@\q+<VdL+FIF3+tO'D+<VdL
+<l2-@<--l@NZd9+<VdL+FH^X+?2;>0d%S]+FG:i0eP.&+<VdLHlt.!+>GPm+<VdLHsCP5/.*LB
+<VdL,()[mE+ig'@<?f<+<VdLHq7-X0f:'r+<VdLHlt@*/heCj+<VeS+>GYp0f'pp+<VeS>](`:
$6UH6+<VdNHph[fBOkNo+<VdL+<VeS85^Qb3&i$'+<VeS+>Pl.2'="a+<Z%S0f'q/3$9=d+<Z&:
DB^V=+<VdL+<VkU87?@DC`jiC+<VdL+<Z&&;BRkP2]s4c+<Z%S2E<BD+<VdL+FG:d2'=V/+<VdL
+FIF3+tO'D+<VdL+<l2-ASu9lEZcJI+<VdL+FH^X+?;/2+<VdL+FG:g3A*03+<VdLHlt.%+<WQb
+<VdLHsCP5/.*LB+<VdL,()[mA7]4YEa`i.+<VdLHq7-X0f1aH+<VdLHlt=&/heCj+<VeS+>Get
1b^$p+<VeS>](`:$6UH6+<VdNHr=ZkAS`J3+<VdL+<VeS85^Qb2_d*2+<VeS+>Yr/2'="a+<Z%S
0fU:13$9=d+<Z&:DB^V=+<VdL+<VkU6XaqFCi!N&+<VdL+<Z&&;BR\Q0K:0t+<Z%S3&iNJ+<VdL
+FG:d3$9t2+<VdL+FIF3+tO'D+<VdL+<l2"ASc0kFE2)?+<VdL+FH^X+>Gf80H_J\+FG:h1+k7'
+<VdLHlt.'+>Pr"+<VdLHsCP5/.*LB+<VdL,()gqDIIX#+<VdL+<VdLHq7-X0fM*I+<VdLHlt@)
/heCj+<VeS+>Ghu1GBpo+<VeS>](`:$6UH6+<VdNHpMRdBl%3p+<VdL+<VeS85^Qb3A<63+<VeS
+>bo-2'="a+<Z%S0fU:40H_J\+<Z&:DB^V=+<VdL+<VkU6=k7MChI=%F(HI:+<Z&&;BR_K2DH<s
+<Z%S2)?j=+<VdL+FG:d3$:(=+<VdL+FIF3+tO'D+<VdL+<l23Bl[p1F!)SJ+<VdL+FH^X+>Pc6
0d%S]+FG:e3A*!.+<VdLHlt.(+>c)$+<VdLHsCP5/.*LB+<VdL,()[eBOPpi+<VdL+<VdLHq7-X
1,^jH+<VdLHlt.%/i=ao+<VeS+>PVn+>P&^+<VeS>](`:$6UH6+<VdNHr+j%@sN!1+<VdL+<VeS
85^Qc3A`N7+<VeS+>ki*2'="a+<Z%S1,'h-1E[e_+<Z&:DB^V=+<VdL+<VkU:iC/dFa,#O+<VdL
+<Z&&;BR_T3A;Qu+<Z%S2`!'D+<VdL+FG:e0H`24+<VdL+FIF3+tO'D+<VdL+<l2!CiF&rEb$:8
+<VdL+FH^X+>Yr53$9=d+FG:f2_Hd,+<VdLHlt1"+>Y_p+<VdLHsCP5/.*LB+<VdL,(*:"B6A$5
F!)SJ+<VdLHq7-X1H@EM+<VdLHlt:*/i=ao+<VeS+>P_q0ejdn+<VeS>](`:$6UH6+<VdN.kN>)
/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JXDB^V=+<VdL+<VkG
DfTr5ATDZ2BOu$pF)Yf(Eb-A*F`_bHAKW*Y4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4[!%f+tO'D+<VdL
+<i<f/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+<VdL
+>t?:@:q/cBl+t8+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL+<WBm+@0ITG%E6rDfU/O>](`:
$6UH6+<VdNHlsOS+<VdL1,LmJ1c$m>2`2^MF_kc#DBL&E+FIF3+tO'D+<VdL+<l1m2_HsE1H7<L
3&3HJ1,UaE+O63N+<VdL+<VdLHsCP5/.*LB+<VdL,((LU+<VdL+C?iX0J5=?2`WW99Q+f]BlnK.
AKZA*DB^V=+<VdL+<VkU+<VdL+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HsCP5/.*LB+<VdL,((LU
+<VdL+<VdL+<Vd^0JkR.=_2#^+<VdL+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL+<VdL2]th5
DKKP7+<VdLHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<Vd^/i#:,6t(?nA7Qf*+<Z&:DB^V=+<VdL
+<VjY/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+
.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHqn*eAKW*<+<VdL
+<VeS6tLFRB5V."Bl@m:<,sQVCih6sAS6BiE\0%'/P'nVBl8<'DB^V=+<VdL+<VjY/M/P+/M/P+
/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lt(D+tO'D+<VdL+<l22@<5jn
BOPOrAKW*<+FH^X+>u)72BX+b+FG:h3%cm-+<VdLHlsOc+>Gl!+<VdLHsCP5/.*LB+<VdL,(*$l
F`SZkF`VYF@;KY!Hq7-X2E3WU+<VdLHlt-u/heCj+<VeS+<WB]+?:Pe+<VeS>](`:$6UH6+<VdN
Hrafk@3?[8+<VdL+<VeS85^Qh0JG4(+<VeS+?2212'="a+<Z%S+>Fuo0d%S]+<Z&:DB^V=+<VdL
+<VkU:3CGiBcnN@+<VdL+<Z&&;BRnQ1,0mo+<Z%S0f^jD+<VdL+FG:S0d&;,+<VdL+FIF3+tO'D
+<VdL+<l2!Cij*"EZcJI+<VdL+FH^X+?)/82]s4c+FG:h1bLX.+<VdLHlsOe+>Ykt+<VdLHsCP5
/.*LB+<VdL,()diDIm9"+<VdL+<VdLHq7-X2`WWM+<VdLHltC//heCj+<VeS+<WH_1,U0s+<VeS
>](`:$6UH6+<VdNHpqpeAfr3=+<VdL+<VeS85^Qi1GCd2+<VeS+>l#/2'="a+<Z%S+>b2r3$9=d
+<Z&:DB^V=+<VdL+<VkU7W3-PChR7"F<D\K+<Z&&;BRqX1,pC!+<Z%S0fCX<+<VdL+FG:S2'=_2
+<VdL+FIF3+tO'D+<VdL+<l2-@<--l@NZd9+<VdL+FH^X+?2;>0d%S]+FG:i0eP.&+<VdLHlsOh
+>c)$+<VdLHsCP5/.*LB+<VdL,()[mE+ig'@<?f<+<VdLHq7-X0f:'r+<VdLHlt@*/heCj+<VeS
+<WQb2)69s+<VeS>](`:$6UH6+<VdNHph[fBOkNo+<VdL+<VeS85^Qb3&i$'+<VeS+>Po/0H_J\
+<Z%S+?(Du2]s4c+<Z&:DB^V=+<VdL+<VkU87?@DC`jiC+<VdL+<Z&&;BRkP2]s4c+<Z%S2E<BD
+<VdL+FG:S3$:(5+<VdL+FIF3+tO'D+<VdL+<l2-ASu9lEZcJI+<VdL+FH^X+?;/2+<VdL+FG:h
0J5%%+<VdLHlsOl+>bu!+<VdLHsCP5/.*LB+<VdL,()[mA7]4YEa`i.+<VdLHq7-X0f1aH+<VdL
Hlt=&/heCj+<VeS+>GSn0f^@!+<VeS>](`:$6UH6+<VdNHr=ZkAS`J3+<VdL+<VeS85^Qb2_d*2
+<VeS+>Yr/2'="a+<Z%S0eje.2]s4c+<Z&:DB^V=+<VdL+<VkU6XaqFCi!N&+<VdL+<Z&&;BR\Q
0K:0t+<Z%S3&iNJ+<VdL+FG:d1*@\o+<VdL+FIF3+tO'D+<VdL+<l2"ASc0kFE2)?+<VdL+FH^X
+>Gf80H_J\+FG:h1+k7'+<VdLHlt.!+<WWd+<VdLHsCP5/.*LB+<VdL,()gqDIIX#+<VdL+<VdL
Hq7-X0fM*I+<VdLHlt@)/heCj+<VeS+>GVo0ea^m+<VeS>](`:$6UH6+<VdNHpMRdBl%3p+<VdL
+<VeS85^Qb3A<63+<VeS+>bo-2'="a+<Z%S0esk+3?TFe+<Z&:DB^V=+<VdL+<VkU6=k7MChI=%
F(HI:+<Z&&;BR_K2DH<s+<Z%S2)?j=+<VdL+FG:d1*AA4+<VdL+FIF3+tO'D+<VdL+<l23Bl[p1
F!)SJ+<VdL+FH^X+>Pc60d%S]+FG:e3A*!.+<VdLHlt."+>Pku+<VdLHsCP5/.*LB+<VdL,()[e
BOPpi+<VdL+<VdLHq7-X1,^jH+<VdLHlt.%/i=ao+<VeS+>GYp1bg*q+<VeS>](`:$6UH6+<VdN
Hr+j%@sN!1+<VdL+<VeS85^Qc3A`N7+<VeS+>ki*2'="a+<Z%S0f1".1*@\^+<Z&:DB^V=+<VdL
+<VkU:iC/dFa,#O+<VdL+<Z&&;BR_T3A;Qu+<Z%S2`!'D+<VdL+FG:d1a"P5+<VdL+FIF3+tO'D
+<VdL+<l2!CiF&rEb$:8+<VdL+FH^X+>Yr53$9=d+FG:f2D-j0+<VdLHlt.%+>GPm+<VdLHsCP5
/.*LB+<VdL,(*:"B6A$5F!)SJ+<VdLHq7-X1H@EM+<VdLHlt:*/i=ao+<VeS+>Gbs2)-3r+<VeS
>](`:$6UH6+<VdNHphO`AR]Ro@3?[8+<VeS85^Qe2)@'3+<VeS+>to+0H_J\+<Z%S0fU:30d%S]
+<Z&:DB^V=+<VdL+<VkU7qlOP@;$c++<VdL+<Z&&;BReS2DQBt+<Z%S1,pm?+<VdL+FG:d3$:(<
+<VdL+FIF3+tO'D+<VdL+<l23E+rfj+<VdL+<VdL+FH^X+>ki12BX+b+FG:f1bLI)+<VdLHlt0u
+<WTc+<VdLHsCP5/.*LB+<VdL,()[s@ruj6F`SZJ+<VdLHq7-X2)@'C+<VdLHlt=(/i=ao+<VeS
+>PVn2)cX#+<VeS>](`:$6UH6+<VdNHs1Z%ASu'qB4Yt'@VHs485^Qf2)?s0+<VeS+>Pr02'="a
+<Z%S1,0n-1*@\^+<Z&:DB^V=+<VdL+<VkU6#:LRARf4Y+<VdL+<Z&&;BRhU3AVd#+<Z%S2_m!>
+<VdL+FG:e1*A;/+<VdL+FIF3+tO'D+<VdL+<l2!DKK<-ATJt:+<VdL+FH^X+>tr11a!n`+FG:d
3A*!.+<VdLHlt1#+>GSn+<VdLHsCP5/.*LB+<VdL,(*<t@VKU#+<VdL+<VdLHq7-X2D[9O+<VdL
Hlt4!/heCj+<VeS+>P_q2)69s+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JXDB^V=+<VdL+<Vk)5uU]N6om@OEbTT+F(KH#DII^0
FCB32?ZU(&CLpag+tO'D+<VdL+<jQI/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28Eb$S>.68S,0JYF<
1b^Y!0etLD1cJZW+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M14F+tO'D
+<VdL+<jQI/g+bCFC0-.A79a++AP6U+D,P4D..N/FDk\uGp%9AEaj)4Eb0<7Ciip"+tO'D+<VdL
+<jQI/g+k:F^K6/A79a++AP6U+DtV)ARloT5uf%KFCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52
/.*LB+<VdL,#1HW+Dbt)A92j$EcW?G:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL
+<Vk'67sBu@<Q""De*:%+<XEG/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+
FDk\uH!G52/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL:-pQUEbTT+/0K%T@;^.#F=\PUATT&:Bl.F&
+E(j7F*(i2F'NT,/.*LB+<VdL,$]"0/.*LB+<VdL,#CR(;aj)83ZrHWF(KE(FC0'&F(KE(FC0*+
DeiohDB^V=+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JkI<C,%J!
3&ER!DB^V=+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'
67sBmD00-,De*:%+<XEG/g+bEEc#6,+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp
@<Gq!De*:%+<XEG/g,%?D.R6#8O6?!F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL
+<jQI/g+tK@:XG$@<-E3+AP6U+Dbt)A9/l6Bldj,ATT&9FCB24A79Rg>](`:$6UH6+<VdN:-pQU
DII]qFDk\uGp"5)67sBu@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q
+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5
EcYK'+tO'D+<VdL+<k'.+tO'D+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV:$@;]soEaNm)DeiohDB^V=
+<VdL+<Vj_>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sC$F`&=1
Cht59BOr<.ATMr9@psFiF!,17+EV:.+EM[>FCcS"DB^V=+<VdL,#1HW+EM[EE,oN2F(oN)+CT)&
+C]J8+=M;JDfp/@F`]&TDfp/@F`^l++tO'D+<VdN:-pQU7:B\>+EV19F<GdACht58BQ&);:dJ#Y
7790t+DGF1:J3<FDB^V=+<VdL+uCE_FEAWQEbTT+F(KG@+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm
?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<iXP0K!<OAnE5<$6UH6,&Ln5@:Weg@3R`TH[RFP
+<VdNF)Q2A@q?iF+Bo0q+<VdN,9n<tF_PZ&Bl7Q+?uft&ATMF)?sIRn/.*LB+<Vk5DB^V=+<VdL
,#i5eEb-A%Eb-A%+Du==@V'R&De:,6ATMr9F(96)E--.DBl5&$Ap&3:?m'Q)@<<W$F_PZ&+CT.u
+Co2-FE2))F`_1;?uft&ATMF)?nP]%+tO'D+<VdN<+oiaAKZ&(EbTK7F!+n3AKZ);DIm?$FDi:=
Gp$[9G%ku8DJ`s&F<G%8F<G[=AU,D/D]ib1Cisf@Eaa'$+D>\;+EVO,DB^V=+<VdL+t@G<CLnt<
@3B)pF*)G:@Wcd,Df-\=@rc:&F=naE+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'
/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag0f:Kh+<VdNBk/DK+<kDR3&r`LA7Hf7$6UH6,&Ln5@:Weg
@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkH
F`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#1HW.UmO7Ch-mnBldj,
ATT&:/M/)SF_PZ&+=M8EF(KE(F=A>@DIal#BleB:Bju4,AM.5*+tO'D+<VdL+<jQI/mN9</.*LB
+<VdL,#1HW+CfG'@<?'k3Zp131,EcUE\KLYDB^V=+<VdL+<Vk'67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/R30;/.*LB+<VdL,$]"0
/.*LB+<VdL,%GP$CghC++EVI>Ci<fj5s[eGF_PZ&3B9*,4ZX]55s[eGF_PZ&3B9)I+BosuDe3rt
F(HIV-UC$a@WcC$A2uY1-X:O5/.*LB+<VdL,%GP*DKBB0F<DrFC2[W1>](`:$6UH6+<VdN>](`:
$6UH6+<VdNF(96.4ZX]5EbTT+F(KG@>](`:$6UH6+<VdN>](`:$6UH6+<VdN4tq=Z:dn,I8OGX%
+Co1s+>=o\>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQUBkAJ9Bl.F+.3N>G+D,>.F*&O8Bk)7!
Df0!(Gp%$C+E1b2BHV#,@r-9uAKY]/>](`:$6UH6+<VdNBOtU_A8,O:3ZoguBl.F+-S7AC0mc\m
78?6B6Ra6-Bl.F++=CE3+tO'D+<VdL+<k'.+tO'D+<VdL+<j!'HZ*F;4$"KtART+[Bk&\AAp&3:
+E_d?Ci^sH>9G^EDe't<-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,!I]-FDYu5Ddso&ATT%V3[\QO
FEDbL+D58-D.Fc0ART*lGB.D>AKZ&-Dg-//F)rIFBONYR2BZF?FCfK6FE/L5AS,k$ATMs6+DPe4
G9CX<Dg-/=F*&OHBl.F&FCB$*+BD3)-S0=KEc*EU+=A^]@rcH<-XUOqF(f)mFCfT8CaWJ*+tO'D
+<VdL+<k'.+tO'D+<VdL+<jQI/g+kGF(KB6061WCCgggb+C]J-Ch+Z1Bl.E(F*(i-E$0(:+E27?
F<GOCDe!@"F)Q)(DB^V=+<VdL+<Vjl0RG0f@j#Z!FsfF6+AG-h;GUY.C2[Wi+D58-+=Bu];cI*O
/9><ADHq''/.*LB+<VdL,!I]-9gM-E:L@OFDe*2tE-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?f
DI[iQ3Zotk@s2*p+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,:UA79Rk+BD3)>](`:$6UH6+<VdN
G&:bQ3ZqZO/gj[o6mjO,@rcHlDB^V=+<VdL+<Vk;F_PZ&A9;ZO3ZrNYD.Rd1@;Ts+-RW/:+tO'D
+<VdL+<i3]<_Yt0/9><ADCI_0+=JpjG&:b=/1<V8.m>\7G&:b=/3IBaBl%<jFDY9#+tO'D+<VdL
+<j!'HZX+DCi<f+E-67F-WWr0-S0=KEc*")DB^V=+<VdL+<Vk5DB^V=+<VdL+<VkLD/XQ=E-67F
-Xq44Ch.6tB-;A/EcYr5DBLMp+=B6U+tb6D9gg?[F(96.>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQUB4Z0-BPDO0DfU+GA8bt#D.RU,>](`:$6UH6+<VdN:-pQU-tm=9FDYP>-XU_$-Rh2>+AG-h
;GUY.C2[Wi+Co2-E$-QBBleB5A3Dsr-V-g-<)6Cp?RICG@rcH9/14eAA1(W"+tO'D+<VdL+<k'.
+tO'D+<VdL+<jQI/g+e<F<G[DA8`T$De!p,ASuTpDB^V=+<VdL+<Vk'67sB/FDk].D.G1F?Ys=$
.6T^79gM-E:L@OFDe*2tA8-+(+=M>MA8c<q4ZX]5<)5nX?RICG@rcH9/14eAA1(W"+tO'D+<VdL
+<k'.+tO'D+<VdL+<jQI/g+e<DImisFCcS2Ddd0!F(96)E-,?&+tO'D+<VdL+<ki9+Bos9Eap5/
F(ZV-Bl%?.4ZX^&Ci^_?@rcHlDB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sBnASu("@<?''@rH4'
@;]dtDBLMR@rH7,@;0V#+EqaEA9/l9F(Jl)FDi:DATMr9D..-r+D5_5F`:T'+tO'D+<VdL+<ki9
+Bos9Eap5/F([6NAnc'm1+,4G+Dkq9+EM%5DCd/8FD5Q4-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL
,#1HW+E_X6@<?''BOPsq>](`:$6UH6+<VdNB4t^pBK\C!>TteA@rcH<-XUOqF(f)mFCfT8CaWJ*
+tO'D+<VdL+<i4T@rcH<-XUOqF(f)mFCfT8CaUYp3Zoh!F(eu;2)ZRtART*lAnc'm.6D!]Bl%<j
FDWHL-nlbu.=E=OBOPsq>](`:$6UH6+<VdN4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0
-QlZ3+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g,:UA79Rk+Co2-FE2))F`_>9DBNP*Ch7ZmDB^V=
+<VdL+<VjV1E\_$0I\,VBl%?cDB^V=+<VdL+<VkBAhG2t7TW/V+CoCC>](`:$6UH6+<VdN+<Y`B
Dfp/@F`\`RF('6'A0>T(+FZpK6VC?K5sn:D-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL+s8"=C11Uf
F(@Ed+DPk(FD)dEIS)mn92eAI6VC?2-X:O5/.*LB+<VdL+s8"L@ra^b+Co4q@r$-r/9><ADCd.f
Bkh]:>](`:$6UH6+<VdN+<W(SDb*Z&<$5deCh5%<GB.D>AKZ&(Ea3K+/.*LB+<VdL+s8"5DB^V=
+<VdL+<VjN+AP6U+Cf>/Gp$O:F)PQ&@<?'k+D,>(ATM*o+tO'D+<VdL+<hpN-U_i\D.OhXDdmH/
4Y@j*HS-El+F?-u+>A.1:dJ&O?XH`2?XHE$6uQOL>](`:$6UH6+<VdN+<YB1/g*Q"@;TQu/NP"%
Ap&3:-Qlr</mN9</.*LB+<VdL+s8!N+AP6U+Dbt+@;I&7Ap&3:.3N/>@s)X"DKI"3Bl[cpFDl2F
>](`:$6UH6+<VdN+<VdLA8bsg4Y@j^+tauc6r-0W-S.Z(@VRGA?RK)r+tO'D+<VdL+<hpN+<W(Q
ART*lA8bsg/15IPF(KE(F=qNCAg]#MGB.D>AKYMu@:O(oA1T*KBldj,ATTPDA7d2oDB^V=+<VdL
+<VjN+D#G$/mN9</.*LB+<VdL+s8"CFDYu-4Y@jlE+*j%+=DV[ASlBk>UNco+tO'D+<VdL+<hpN
-urm-A0>W/D/a#:-ZWpBATMF)?Z'e(AR]RrCG'=?H#@(=.3NhTBlmo/A85O_CNF#;-ZWpBATMF)
?Z'e(AR]RrCG'=?H#@(=>](`:$6UH6+<VdN+<W(QART*lC34<3A1T*KBldj,ATV9sDffQ"Df9DD
E+EQ..3NhTBlmo/A85O_CNF#;-ZWpBATMF)?Z'e(AR]RrCG'R:Ag^i$+tO'D+<VdL+<k'.+tO'D
+<VdL+<hpNA9;C(FC[Ne+DPk(FD)dEIS)mn92eAI6VC?2FCfN8A79Rg0.1"B+tO'D+<VdL+<hpN
A9;C(FCZM,ATW$=F<DrF@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmT>](`:$6UH6+<VdN+<Y3:ATMs(
+D58-FEhmM-Ve)nBkLjrBl@lr;flGgF'j$6F=1=2+tO'D+<VdL+<hpNA9;C(FCZM,ATVd"+=BKr
BkM+$?W2&TEcYS^ATDKqBjkmd6#:CHDII$^1,EcUE\]R\D.G#!DB^V=+<VdL+<Vk>Cia0%AhG2t
7TE2T=<M-m/mN9</.*LB+<VdL+s8"LD/XQ=E-67FF(95R/g)N:8PN#B+ELt7AKY])+FZpK6VC?K
5sn:D-X:O5/.*LB+<VdL+s8"'67sC%@ra^b+DPk(FD)dEIP5>JF>%B;@r$.!@:O(o0./;l@rcH<
-SB+JF!k41+tO'D+<VdL+<hpN:-pQU.!0Au:K(48Anc'm.3NhTBlmo/F(95qDB^V=+<VdL+<Vk>
Cia0%AhIV4/mN9</.*LB+<VdL+s8!_+Bot0BQ&*6@<6K4-Y-q4FE2))F`_2*+E)-?=%Q.?<DH+f
+E).6Gpa_TATW'8DD#13+tO'D+<VdL+<kB7A1h,)+tO'D+<VdL+<k'.+tO'D+<VdL+<kN3/g+b;
G\M5@+EM%5+CoCC+C&e./.*LB+<VdL+s8!_+Bos:Eb/Zi+F,CYGB.D>AKZ&-Dg-//F)rIF@rbgl
+tO'D+<VdL+<kB5F(Ht/DB^V=+<VdL+<VjN+>G!C+EM47GApu3F!)iIBle?0DJ()&BleB:Bju4,
Bl@l3F(96)E-*3S4srF5@rbgl+tO'D+<VdL+<kB7A1h,)+tO'D+<VdL+<i7>DB^V=+<VdL+<Vk5
DB^V=+<VdL+<Vk<De!p1Eb0-1+EVI>Ci<fj5s[eGF_PZ&3B9*,>](`:$6UH6+<VdN4tq>%A0?:Q
+AYg&:..Z@+BosE+E(d5-RW/:+tO'D+<VdL+<k'.+tO'D+<VdL+<k<6@s)g4ASuT4-XpM*ALC`#
+tO'D+<VdL+<k<6ATD4#AKX*WD/a<0@p_Mf6"4tNCh,Od3F?$/+tO'D+<VdL+<k'.+tO'D+<VdL
+<i<f.kN>)/M/P+/M/J)/M/P)/M/P+/Lt(D+tO'D+<VdL+<l1fHt-u2F(Jl)/O"PoF`_\PF`_>6
F*q51+tO'D+<VdL+<i<f.kN>)/M/P+/M/J)/M/P)/M/P+/Lt(D+poG8+<Ve4$6UH6+FOS>+<Xr@
$6UH6,'.[FEarZ)3ZqW6+<VdL,#1HW+EM47G9Ca2Bl5&6Bldj,ATT&3@;BFp>](`:$6UH6+<klD
Dfp/@F`\`\+Co2-E$-N;F_PZ&?ZKk%ATMF)-X:O5/.*LB+<Vja+E(d5-RU)F+<Ve4$6UI>/.*LB
HO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj2)7%!0junI+tO'D+<VkFATV?k
@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<i$T+@0g[+CoD.AKWQIFD,*#CNCV1DfQt>CghU'
DJ(.#+<Ve4$6UI>$6WV*$6UO0ATV?k@<>p%3ZrbV+<VkDATD["CiaQ,@j3rVHO:l<+<k?1F)Yr(
H!bGtD.OnP+<jE%/.*LB+<kW1DJ+*#B4W8J+<jE%/.*LB+<k]3D.OnP+<kQ9ATD["Ca'3/+FPdJ
+<VkE@;]_#@:s.YBl7O$,!$in$6UH6,%bP*ARB"nFCf?2Bl@l53ZoV!Bkh]5/.*LB+<kZ:D.Rg7
E+L4S+<ko=G]YT2+tO'D+<VkG@;TR"3ZoV=+poG8I0q*F/.*LDDIR3rEc#6,,!$i'/.*LDDIR3r
Ec#6,?YsLpDfR$_+>jLS$3                                                    ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&r0H`;/+>PVn2`;d51*A>2+>Pbr2`Mp70H`,*+>G_r3'qY"B4uBo;flGgF'hXQEbT&u
@;]F<Ci*Tu@:NY"1MpQ@1,iQWA8$(,E-"&n06_Va/n&R5@;]L`/n8g:04ApDEc5i6D0[dDEbT0"
F=hQU@<-EBH>.>.De*E43&<HL2D6g>1,CL91G(@@:18<[B45mrDf/o\FCB32?Z^O7DII^&B45mr
Df-\=FCB323Zr*XFDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJQi?Z0O`F*(i2F'iNtEaN]m
G%kStFD5Z2:et"h?ZKk%ATMF):et"h?ZKk%ATMF)+E27?F<GOCDe!@"F)Q)5@<Gpp@;TRd?ZU<t
EcYSC0JYCjFEhnMFCmKT@rlf9De:+fAnGaeBjkg#8O6?!6Xb(FCi<r/F(f,rF<G:8+A"k!?ZU<t
EaO$/EbfB,B.eFFF*JfZ+EM+*+Dbt6B-:`'@rQI'EbTT+F(KH7ATW'6+ED1;ATMF)+E2@>C1Ums
EbTT+F(KGnF(KAbAU/?>F(KB-AU/=                                             ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' riseset BOM CR DAYSECS IFACEWORDSriseset JULIAN LF LIMITH'
zz=:zz,'ORZ LIMITMAG OBLIQUITYDMS2000 OBSLOCATION ROOTWORDSriseset STDALTIT'
zz=:zz,'UDE UTCOFFSET VMDriseset alldifs apparRADEC apparsecs apparsidjd0 a'
zz=:zz,'pply arccos arcsin arctan assert atan2 boxopen cold_iau_named_stars'
zz=:zz,' cos cosd ctl ddfrdms deltaT0 deltaTdy dfr dmsfrdd fmt_today gT0jd '
zz=:zz,'gT0ymd hmfrds iau_today intr3p julfrcal loadstars location_home loc'
zz=:zz,'ation_uluru location_yellowstone meanobliquityT0 meanobliquityT1 me'
zz=:zz,'anobliquityjd0 meansid0 meansidjd0 nav_today nnth0 npth0 nth0 nutat'
zz=:zz,'ion_longitude_dPsi parse_iau_named_stars parsecsv parsetd read rfd '
zz=:zz,'riseset riseset_calc round sin sind smoutput today_calc zetzthT0''),'
zz=:zz,'<<;._1 '' risesetUtils J2000ymfd atan2b dsfrhms fdfrhms fuserows mea'
zz=:zz,'nsidymd0 nutation_obliquity_ecliptic_dEpsDeg rjd tabit yyyymmfd''   '
zz=:801{.zz
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
zz=:zz,'_meeus_smoke riseset_navstars_smoke riseset_riseset_smoke riseset_t'
zz=:zz,'anner_smoke''                                                       '
zz=:146{.zz
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
8Q85V;Hb2:8PMcU9gM8l:I7`H;,p1e=[Yt_+AY<t8PrJZ<*;U`;_g$\0Ha.X;bTtS5u^EO:*<G1
:K1Ck;FFH(Bldj,ATT%n<('#G<(U%h6q&4u<'sGN7T2`T+BD3)EbTT+F(KG9@;KajBkDE/@;p0o
E`,1k77/2+E,]6+F(Jj&+CT5.@<-F'A85X/+CTA#DDE>CFCB&B@N]0!Ch-me@<Gpp@;TRd?ZU<t
EcW@6A92@'BPhf5A7]S!@8np'A7]S!@8pc_+CoP*EbK<2+D,.rEbK<2+D,J4?Z^3s@<iu.<%r&t
+D4Y-H#7(7BPh@%A9/l,D0'<0A7Ta(BPhg&Eb'56Bjl-kFDk\uGp$g0F^K6/DJ<`sF<G:8FE00V
+Dbt)A92j$EcW@>De!3tBl@lrBQ%a!+Dbt+@<?4%DI7O&F`MUICi<flFD5Z2?[64!Ci=N=FDl&.
+Dk[uDJs!#BlS90FEph>+Dk[uDJs!#BlS90FEph?+Dk[uDJs!#BlS90FEqV30Hb4D@;^.#A2#-C
ARTItBk1sh0Hb4D@;^.#A9i$&0Hb7AG$f?0A79a+DJjQ00Hb7PFD*?NDKKPG+Du=D@<?4%DI73u
DJ*[*F_#&jA5I>]+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+E1b0F(J]m@<Gpp
@;TRd?ZU<tEcW@DBldj,ATT&8Bldj,ATV961a$gQF(KE(FC/NdCh"T.Bldj,ATV9h@;KF\:/=hX
;]p*pF(KE(FC/]iF(f)mFCfT8C`mb5A0>u)+EVO4@<?''FDk\uH!b&iCh"T0De*:%DJpYCH$O[P
D.[<$H=_2EFD+W--RgSp4?P\X?SNZN+C]J-Ch-mnBldj,ATT&(F_PZ&?ZKk%ATMF)?Y"(b+ED1;
ATMF)?X\%bDDGR?D/X3$+ED1;ATMF)?Y+:tAStpl?ZU(&CLnW/Bldj,ATV9rAS$"*?ZU(&CLnW/
Bldj,ATV9s@<Q^6@<-ErF)>i2AKZ#-F(KE(FC0'&F(KE(FC0*+Deio,EbTT+F(KH#FCB')ATD.!
D/X3$-RgSp4?P\X?SNZN+ED1;ATMF)+ED1;ATMF)<HMqkF!iCf-p0%C-ZWpBATMF)-RgSp4?P\X
?SNZN+@:*_B4uBo;flGgF'hXQEbT&u@;]F<Ci*Tu@:NY"1MpQ@1,iQWA0=WUG%kStFD5Z2?W2&T
EcYT0G]Y'):K(5"EbTT+F(KG9@<>pq11+U;@qBI`FEhmMBjl-kDIIBnA7'D"@<-Er1,(I=?Z^O7
+DtV/@:*PVCij)mFC/lq+DtV/@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys<r
DKU&0FD5Z2?YOCbCi=3(BlnK.ARAtEF(nuuA0>c4FCB9*Df/orDI7<kCh[m3BlnW-De<?f@r,ju
FD55lA4:HY6tL"<D.Fc.Eb]W/F(KE(F<GU<F(KE(FB*BnE_BthF!,L;F(KE(FC/p(FCep"Dei]o
E-Z>1-RgSp4>J$;1F+_01,CU?1,pmC2*!WP0JPRI1a"P-1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?
1,(=;3B/lP1c[6J2]sk01,CU?1GLL<2`EKP2`*9G3$9t11,CU?1,pmD1,(I<3A<EK3?U(21,CU?
1,pmC2_d*H3&ENJ3$9t11,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?1,(=;1GppA3A`NK2'=Y.1,CU?
1,pmC2_[!E1G^jE2BXb/1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,pmB2Dm<K2E!BK1a"P-1,CU?
1,pmC2`*6D2D[6L1a"P-1,CU?0KCaC0eb@>2)[-D2BXb/1,CU?1,LU@1,:RC1H@3G2'=Y.1,CU?
1,(=<1bgdD2)7-O2'=Y.1,CU?0f^jE2`WlU1,:gL3?U(21,CU?0f^jF1H%!D1H70F3$9t11,CU?
1,:I<2`3QN2DmHN2]sk01,CU?1,:I=1H$sB3&**C2BXb/1,CU?0K:[B0JYID2E<HN1E\G,1,CU?
1,:I?2_d9G0f1X?3$9t11,CU?0fCX@2DI!C3&ETO0d&5*1,CU?0fL^A1-%$K1H@<N3?U(21,CU?
1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU@0JP1:0JtO=2)6jE3$9t11,CU?
0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?
1,:I?2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU?3A*-E3ArcU2*!KK+>PW+1GCU?
3%d$H2`EHH3B&c;1,(I>0JbI@/i5I@2)?s@1c$j/1,(I>0JbIA/i5:@0K1aI1,h$41,(I>0JbIE
/i5CA1c[BI2Dm?71,(I>0JbIE/i5:<1cR9K0fLg01,(I>0JbIE/i5@<2`!?P2`EW;1,(I>0JbF@
/i5C?2)-dC2D@'41,(I>0JbFA/i57=2_m3J2`<E61,(I>0JbF@/i5C=0f:gH1cI?91,(I>0JbF;
/i>XF0JbL@1c%$41,(I>0JbCC/iPL=0fCsL2DmB81,(I>0JbF;/iGC;0JGIF2`*B71,(I>0JbL=
/iYO=0fCpG3A`W:1,(I>0JbF;/i>IC2Dd9G0f1".0JYF<1GLmB2_[0J1GU^G0Jjn-0JYF<1GLmB
2_d!F0f1UB1H?R50JYF<1GLU:2E<ZQ1H@6G2DZI20JYF<1GL[<2)@!G3&iTJ1,pC30JYF<1GC[=
2Dm3K0fCpG1,^710JYF<1GUg?2)6sF2)%$G2`;d60JYF<1GUmA2)[BJ3ANTM2]sk01,CU?1,ggB
2)I'G1-%6J+>PW+1GCU?3%d!F2`!HJ3B8o=1,(I>0JbCC/i>@;0fCjJ1H7051,(I>0JbCC/iGXK
1c@-D1,1X/1,(I>0JbI=/iPLB2E!9K2_d351,(I>0JbF?/i5CF1H$pF1,L+/0JYF<1G^^;2`W]T
3AWHF2`)X40JYF<1GL^=1c%!D0ebLG2)cX50JYF<1GLa>1c@*D1,:UB2`Mp80JYF<1GU^<2`NTM
2_d6J3&2U30JYF<1GUpB1c79Q1GCOD3&Da50JYF<1b^X:1cI0D1c6s@0K(%/0JYF<1GUX:1c[NQ
1Gh*G2E)a60JYF<1G^a<1H.6J3B&cM1H6L40JYF<1GUpB2)6j@0f^pI1H?R50JYF<1GUpB1cI-F
2E3NO0fU:20JYF<1GLd?1b^XD0KCjA2`2^50JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D
2)@$F1c?I30JYF<1b^X:1bpgF1,^mC2)-4/0JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G
0fCgG2DcO30JYF<1b^X:2).*O3A<?G0fU:20JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUa=1c73O
0JbLD3B&'90JYF<1GLmB2E*WV2)6pH3B83;0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1G^^;1c%!D
0K:jE1H6L40JYF<1GU^<1c%$E0fUmA1H$@20JYF<1GUd>2E!HN3&<<E2`Dj70JYF<1GU^<2E*?M
0JPC>0fU:20JYF<1GLjA2`3QQ1,(LA3?U(21,CU?0fL^A1-%$K1H@<N3?U(21,CU?1,U[D0K(pG
2D?gB3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU@0JP1:3&ETN0f_*K1E\G,1,CU?0KCaD3AiZQ
0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?1,:I?2`W]O
2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU@0eP@=0JPID2`W`R+>PW+1GCU?3%d'J0fUjH
1H@351,(I>0JbI@/i>F=0JG4<1,Ld01,(I>0JbIE/i>C<2)dHJ2DI371,(I>0JkI</i>@A1,:aB
1c@051,(I>0JkI</i>@>3Ar]N1c.$31,(I>0JkI</i>@>1,h$M2)7-61,(I>0JbI</i5@C1c@0L
3ANB51,(I>0JbI</i5@D0f:dC2E;m80JYF<1GLmB2)6sJ3&NNO2)?@10JYF<1GLR92*!TR3&ETT
2`2^50JYF<1GLR92*!TU3&<6F1H$@20JYF<1GLR92D?sD2)7'L2Du[50JYF<1G^a<2D@*L1,L[?
2`W!90JYF<1GLR92)I0K1c7!B1a"P-1,CU?0f^jF0K1jF1,:jD1a"P-1,CU?1,(=;2)$jC2D[3H
2]sk01,CU?0f(F>2E3KN0ekLA2'=Y.1,CU?0f1L?2E3WO1GUX@1*A>+1,CU?0fCX@1Gq'M2_d9O
0d&5*1,CU?1GCF>2D?sJ0Jk[I0d&5*1,CU?1,ggC2_[*K3&``L0d&5*1,CU?1GCF>2_d!B0ebIA
0d&5*1,CU?1,pmB2E*EP0KD-M+>PW+1GCX>0eP=<3B9)R2`WiP+>PW+1GCU=3A*3K3A`WM0JY@?
+>PW+1GCU?0ePC>2)[?I2`EHL+>PW+1GCU>1bLUC1H@HL0JbUD+>PW+1GCX>0eP:B0JkUD1c@-F
+>PW+1GCU>1bLUC1H$sH0fCjH+>PW+1GCU>2(g^E1GgjB3A<6I+>PW+1GCU?1G1IC1c[BK2).'M
.4cl01*AP%1,(I>0JbCC/i>@>0KD*L0Jb[21,(I>0JbCC/i5RI0f:sJ3AN?41,(I>0JbI>/i,IH
1GpmB2_m?81,(I>0JbFC/i,LC1b^gA2)@371,(I>0JbF=/i5IE0fUpC2`;d60JYF<1G^a<2)6mG
3&<KK2DH=00JYF<1GUmA3AE6H2)d6K2E;m80JYF<1GLX;1cI6J2)mEJ2DQC10JYF<1GUsC2)7'G
1Gh$I1H?R50JYF<1GUpB2)mTQ2*!NP0K:110JYF<1GUpB1b^^A3&<BO2_cF10JYF<1GUa=1bpsD
3A<BL1,U100JYF<1GUpB1b^pJ2`!9N2_cF10JYF<1b^X:1c%!K2)7'G3A_j60JYF<1G^a<1bggD
0f(^A0esk,0JYF<1GUa=1bpsH1,_*G2_lg5-p07-1*eV/1,CU?0K:[B1bga@2)d?I2'=Y.1,CU?
1,pmB2_['K1,(^E1E\G,1,CU@0JP1:1,:UC2DmEK2]sk01,CU?1GLL?0et[H1,q!C1+=b&4>JTG
1GCU>1+kCB3&r]L3&!6I.l]L@3Ai`U1c79O0f:XB0fLpI.VULj+>G;r-p07-0et"00JYF<1GUmA
2)%!E3Ai`R2)?@10JYF<1GUd>2_[$G2DmBM3&i$90JYF<1GCgA1cRHM3&iiN1c$700JYF<1GU[;
1bpdC0ebC?2DQC10JYF<1GCU;2E!EL0K1jC0esk,0JYF<1GLjA1c70G0K:mC1,U100JYF<1GL^=
2_[$C1GCL@3&)O20JYF<1GLU:2E*<D0fLgA3Ahp70JYF<1GLU:2E*TP1,:U@2'=Y.1,CU?0eb4:
0K1aA0fLgC2'=Y.1,CU?0eb4:0K(aG2`NfQ1*A>+1,CU?1GLL=1,CjL3A<-H0d&5*1,CU?1,ggC
0K:dI2)dEN1E\G,1,CU?1,ggB1cI0D2`EZT2]sk01,CU@0JP1;0f_6S0K(X?3$9t11,CU?1,1C<
3ArTJ1c@3I2]sk01,CU?0K(OB0JkI<1H70F3?U(21,CU?0fUdB2)[0C3&E<E2'=Y.1,CU?0fCX@
2)7!D2)d9N2'=Y.1,CU?0ek:=2_Zp?2_d$I2'=Y.1,CU?0ek:=2`NWL1,:XC+>PW+1GCU?1bL[E
1b^jD0etaL+>PW+1GCU?3%d'I1GCRD1,L[A+>PW+1GCX>0eP==3&!'I3&*9L.4cl00I\P$4>838
-p014/1<V7.4dS8                                                           ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
