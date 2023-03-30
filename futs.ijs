NB. JOD dictionary dump: 29 Mar 2023 22:30:10
NB. Generated with JOD version; 1.0.25 - dev; 8; 28 Mar 2023 23:59:24
NB. J version: j9.4.1/j64avx512/windows/commercial/www.jsoftware.com/2023-02-27T15:21:53/clang-15-0-7/SLEEF=1
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

IFACEWORDSriseset=:<;._1 ' iau_today loadstars riseset'

J2000ymfd=:2000 1 1.5

LIMITHORZ=:20

LIMITMAG=:3.

OBLIQUITYDMS=:23 26 21.4480000000000004

OBLIQUITYDMS2000=:23 26 21.4480000000000004

OBSLOCATION=:_116.375956000000002 43.6467749999999981

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset fdfrhms iau_today location_home location_uluru location_yellowstone'

STDALTITUDE=:0.566699999999999982

UTCOFFSET=:6

VMDriseset=:'0.8.5';5;'29 Mar 2023 22:29:55'

riseset_hashdateurl=:<;._1 '|1ed3085b8e5f0389fde78ac8a0c6ce3dde38d068f66e7d3d6c5ca355a5872569|29 Mar 2023 22:29:55|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

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
NB. Result is between _180 <: atn2 <: 180 degrees
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

gT0jd=:36525 %~ 2451545. -~ ]

gT0ymd=:36525 %~ 2451545. -~ julfrcal

hmfrds=:[: 24 60&#: 60 %~ ]

hmsfrdds=:24 60 60&#:

hmsfrds=:24 60 60&#:

iau_today=:3 : 0

NB.*iau_today v-- named IAU stars rising/setting today.
NB.
NB. monad:  bt =. iau_today uuIgnore
NB.
NB.   iau_today 0
NB.
NB. dyad:  bt =. blYmd_LB_U0_LMAG_LHORZ iau_today uuIgnore
NB.
NB.   NB. date of Uluru star party diner
NB.   YMD=. 2022 10 19
NB.   ULURU=. 131.01941 _25.34301
NB.   UTC=. _9.5 
NB.   LMAG=. 6.0
NB.   LHORZ=. 5
NB.   (YMD;ULURU;UTC;LMAG;LHORZ) iau_today 0

((3 {. 6!:0 '');OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ) iau_today y
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
NB. monad:  location_home uuIgnore
NB.
NB.   location_home 0  NB. set location
NB.   iau_today 0      NB. uses set location with current date
NB.
NB.   NB. uses location with set date
NB.   (location_home 0) iau_today 0

NB. test date https://www.almanac.com/astronomy/bright-stars/zipcode/83646/2023-03-27
ymd=. 2023 3 27

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: _116.375956 43.646775  NB. Meridian 

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  3.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 20    NB. degrees above horizon

ymd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
)

location_uluru=:3 : 0

NB.*location_uluru v-- set parameters for Uluru location.
NB.
NB. monad:  location_uluru uuIgnore
NB.
NB.   location_uluru 0  NB. set location
NB.   iau_today 0       NB. uses set location with current date
NB.
NB.   NB. uses location with set date
NB.   (location_uluru 0) iau_today 0

NB. date of Uluru star party diner
ymd=. 2022 10 19

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: 131.01941 _25.34301

UTCOFFSET_riseset_=: _9.5   NB. time zone
LIMITMAG_riseset_=: 6.0     NB. stellar magnitude
LIMITHORZ_riseset_=: 5      NB. degrees above horizon

ymd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
)

location_yellowstone=:3 : 0

NB.*location_yellowstone v-- set parameters for Old Faithful location.
NB.
NB. monad:  location_yellowstone uuIgnore
NB.
NB.   location_yellowstone 0  NB. set location
NB.   iau_today 0             NB. uses set location with current date
NB.
NB.   NB. uses location with set date
NB.   (location_yellowstone 0) iau_today 0

ymd=. 2013 5 7  NB. mom

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: _110.82792 44.46057

UTCOFFSET_riseset_=: 6.0   NB. MST time zone
LIMITMAG_riseset_=:  6.0   NB. stellar magnitude
LIMITHORZ_riseset_=: 10    NB. degrees above horizon

ymd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ
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
NB. dyad:  bt=. blYMD_UO_LB_AOBJ riseset blclStarNames
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
NB. monad:  bt =. riseset_calc blYMD_LB_OBJ_RA_Dec

'ymd LB obj ra dec'=. ,&.> y

NB. (L) longitude, west positive
NB. (B) latitude,  north positive
'L B'=. LB

obj=. obj ,"0 1 a:,a:  NB. result table

NB. dynamical time ΔT in fractional days NOTE: ΔT is not 
NB. going to change a lot over the interpolation period  !(*)=. nc
if. 0=nc<'DeltaTsOveride_riseset_' do.
  dTfd=. DeltaTsOveride_riseset_ % DAYSECS 
else.
  dTfd=. (,/deltaT0 deltaTdy ymd) % DAYSECS
end. 

NB. apparent sidereal time Greenwich at 0h in degrees
th0=. ,/ddfrdms 15 * apparsidjd0 julfrcal ymd

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

NB. objects, above/below, altitudes, fractional day UT, UT hours/minutes
(<"2 (,."1 ] 0.5 round h) ,"1 (,."1 m) ,"1 ] 1 round hmfrds DAYSECS*m) (<ix;2)} obj
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
1GCd22)ZR4+?(Dt2'=V4+>beq3?U78+?:Q"1a"b#0fU:11*AJ5+>Gbs2`2^40d&>0+>Gbs1bg+-
0d&D1+?:Q"3?U%1+>Po!2]t"<+>GPm1c-=8+?2%t0eje03?U1%2)$.2+>u5&1,'h,2]t(&2`;d;
+>Pr"3$:(:+?(E%1a"_"2)$.1+?);'2BXq5+>t?#1E\Y"2`)X9+?)"t3?U+9+>GSn1GL"1+>Yu"
3?U(5+>GYp1Gg4/1a"S1+>PVn1b^%,2'=_5+>G_r1cQU42BXk3+?1K#3$9q0+>tqs0eje.0H`4q
2DZI5+>ttt1a"V8+>P_q2DH=12'=e5+>PYo1b^%2+>Yer0esk-1E\D4+>c)$1E\G/+>t>u1E\V!
1cHO:+>bqu3$:(46pXsS771!pARfXrA9/l4ATAo(@<kF65sn(B:JsSZEbTT+F(KH-DKKH1Amo1\
+EqaEA9/kA8Oc!579<8_6rS,?F(KE(F=A>FEc6)>8hr(S0R7MIA7]^u@qZuW1,(C9/heDnARTU1
+Dl%7FD*3JAo_<iFD5Z2@;I&s@<jmV1,LjC2)I054WnK^Ch@]t@;I&Y1,(C9H#7/(9M%rM<(Ke_
>%hhpBmO]8+Dbb/BlkJ3DBNJ$B6%QpF%f/"8Q8DM7r2mVBln',B-;&"B5VF*F_#&Z6;0sJ<Cp.m
6qpTgE,]i9G\M#'FCcS5@VfauF_PrC+E(j7FD,5.ARfOjE-,f(+DG^9A7]CoAS#p6+Dkh1F`_29
/0K"F@rH6qF&,+r8PrJZ<*;U`;_g$\0O\p>Ec62:D..Nt+D#M1@qZuW1,(C9+E(_*BlS90FEo!I
Afu2/AKYPoCh[j1Bk&8rAS6$pATKCFD/!m1FCfME+EM+(Df0*,:I7uR:I@EI8P`*"@WQ+$G%G\:
CghF"FEM,*+Dbt6B5)I1A7[;7G@bi;+Dbt6B5)I1A7]g)DImHhFD5o0;GU(f=&2^^;fZSnATMF)
Ec5l<+EqaEA9/kA;GU(f=&2^^;fZSnATMF).3N8DDfp"A+<VdL+B)6-5tk6L<)l=TF*(i.A79Lh
+CT).BlnK.AKZ&9@<-E3/KePAD/a'(F('0%F!,(5EZf%6EbTi<DBNA0D/XK7BOu3u@j#f'Ao_<i
FD5Z2<E)=]7Rg<F<)lmb+EV=7AKZ;;DIjr/AnH*qF<G:8+D>\9EcY8U6um!_ATMF)G%G]8Bl@l?
+DkP&AKYK$F`):D@;]TuA79Rk@;KajBkDEpCht5?ATD]?+D,>.F*&rUF(Jj"DIb:@/hSb!DKKP7
A8,XfATD@"@qB^(De:,0CcW\ICi!WrAof(Z/ho%)0eb:iE,]6+;F*]>6XaqQ@<,psF<FII+CT.u
+@JXc+D,P4+D#M1@qZu5GUXbIEc5e;8hr(S0O\p>@<-F#@rl^&@rH6qF!+t2EcP`$FD5Z2+CT5.
@<,psF<GX=A7]dm@;I'.Bl.E(/KenAAT`&:E+^dG3&Da0+=PO"E-#_9.Ni5>F!tU=F"&Ok0f<BY
E+*d.Bk1sh0O\p>@<,psF<F(oAS#b'Bk(g!F(o/rEb/Zq+>"^LD0%`\@;p0oEcYr*C1K"@C3=?)
EarNo+FH3m1,(I>+>Fup/35LG3ADX3+?1u2@<>pq11>35FCB'"ASuT4De:+?=Wf"5==GA)DfQtB
GAeU4EbBN3ASuU2+DG^9A7]CoAS#pkFCB&B@UX(pATDZsFCcS'FCB&B+Eh=:@N[6F@<,k"@;]^h
DKI">AfrL(+=/.U.3N>B+Co%rEb/g'+>"^WARuu4@<>pq1+?^OCh-me@<Gpp@;TRd?ZU<tEcY`/
DK]T3F<F.@<?Pam@r*90D]iP.CisT4+Co1rFD5Z2@<-X(A92@'BPhg$ARfFk@;I'-ARfXrA9/l*
Ec5e;BQ&$6F"AGNBl7uC+EM+(F!*%WBl8):-tmI=Ao_EmF"'-mA7TanEbK<2+>Y,p1*A;+/ibUr
AScHs<%qj.DIIBr@ps0rFD5T'+O63N+DG^9F(Jj"DIdg!AScHs<+L8bAScHs+O63N+Co%nBl.9p
+F.O,E]P=RAScHs<+L7s1,(I>+>Y,p1*A,#+>Gl63?U%3+>GT]F(TH+D0'6!@qfdgC`me1@rH6q
F!,(8Df$V1Dfp)A/0JeDDK@?OF(Jj&+>"^MDK[-NBPhg&Eb'5?3ZqsSAo_R%F!*7]0esk+0ePI?
An5LoBPhg&Ea`I"Bl@ltC`m7sGp$^>Df$V1D0%`\0J5==2DR-44Wn?IAo_R%F!*1t+>PYo0P=?=
C1Lps@:OCnDf0!"+Ceu#FEMV<ATJu+Ec5e;AT2QtBHTo&0JG1'9k@mYF!,F7/g*,03Zr'70PY,@
C3=?)EarNo+>Gl62]sh/+>b]10kXH>H#7)(Ea`I"Bl@ltC`m5!DKL#ABk;?.Ao_g,+D#M1@qZuW
1,(C9+AHEYF`S[EB.b;d1HHXk<%rT7A0<Te2)cX40H`2)3&,)`Ao_F'BQ&$6F"AGNBl8'8ATJu+
Ec5e;A7]7bD..6'F(Jj"DIdfL+D>V(Eb'56A92@'BPhf51,'h+2]sq5/i#4rD0'<0A7Ta(BQ&$6
F"AGNBl7uC+EM+(F!,(8Df$V-ARfFk@;I'-ARci7+F,(l+?2890JGO1A7TanEbK<2+D>V5Ao_Em
F!*Cs0f(F=2/$iJAo_F'BQ&$6F"AGNBl7uC+EM+(F!,(8Df$V-ARfFk@;I'-ARci7+F,(l+?289
0JGO1A92@'BPhf5BPhg&Eb'562_m*D/i5G"@<Gq!De*:%DIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VD
ATW$.DJ()6De*:%Bjl-kFDl&2B4uC)@;TRd+A"k!+EMX5EcW@HBldutCh4`2Df09%BQRs+FE00V
Bl8$(Ec>r5@<?''FD,]+AKZ/)Cis<1+>"^QAS$"*+E1s91,Wld@:XG$@<-F*Ddd0t+ED1;ATMF)
+EMX5EZen$FCB!(@psInDf/oqDf'',ATT&6@<,dnATVL(F!,(5EZcQ>Df'&0+Dbt+@<?4%DJX6$
@<?4%DI7O&F`MVGATT&6@<,dnATVL(F!,(5EZe@uF`MUICi<flFD5Z2Ci<flFD5Z2?[64!Ci=N=
FDl&.F(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<flFD5Z2D.R-nDdmNsEHPu;GuQJ7
ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"?/<?Q!n+Co%rEb/g'D.R-nDdmNsEHPu;GuQM8
ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"HRF),3)+DG^9A7]CoAS#q"ARTIp@VfauF_PrC
C1K#8ARTI!DdmNsEHPu;Gp$[.Ch[j1Bk&8tDfQsmF_kc#DBNIuFCcRCGpskHAS6$pATM^"@;^.#
A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZe=(.!R0`8jjdMGq!TA@;^.#A85X/
D.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4C3=?,@;[2u@<itDGpskMDBNJ$B6%Qp
F)>JsDKBN&H#7(GD.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4=\V:,Bl5&(AS6$p
ATMa,FD*@GDfT]'Ch\3,+Dtb'@<?4,AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaNDJjQ00H_r%2E*QS
1GLL;2DR!B2E#GlFD*@GDfT]'Ch\3,+E27?Bln'4AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaNDK']2
0H`).2`E]P0eP4>1,1OB2K!VM0Q(fLD..6pH=\40AS6$pAKZ&.A7]dm@;I'.Bl.EB+Du:70Ha^Y
2)R6K+?)5<2`GVsFCB9*Df/ouDf03%FEM,*?XuuSBl8'8@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(
BlnK.AKY])+Co%rEb/g'+=Js)3%uIh@<E]7BOu+&Gq!WRFCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.
@p`b8E-"EYB5Vj6@<?4%DBNY2+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&8rAS6$pF)rHP0f_3I
+DG8,+EM+7Bk;?7E+*d.ARB.[F^K#pD.R6bF*(i2F%JYt+DtV)ARlp)FCB24Ch[s4+EVNE@WZ*r
+D>=pA7]d(FCAWpATDL+ATMF)EbTT+/0K%T@;^.#F=\PUATT&:Bl.F&+E(j7F*(i2F)ku9ATMF)
?XmM\@rc:)ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcZ88F(KE(FC/]iF(f)mFCfT8CiX62
ATMF)+D5_5F`8IE@rc:&F<G7*F(d*I@WcC$A0>DkFCd!GB5)I$F^cJ9Eboc2A9)U2DIal)F_kc#
DBNIuGp%!ID.7'sFDk\uFCes#DK]T3F<DuRDe*:%DJpsHG%#30ATJu9D]iS!FCfN8De*:%DJs$'
DK]T3F<G+&FCfM9FDi:4@<iu5F_tT!EcWcS@rH7.ATDj'+=M>MA79Rk.=$2aH#7D1A9h`pEZf4;
DKKP7Ao_<iFD5Z2@;I&s@<iu;Bl.E(Eb031ATMF#FCB9*Df0l4FF&%B<%qm&De!H'@:X+qF*)81
DKI"CATDX/+D,P4+A+CC0JFVI5p/Qa6Qg)\+Co%rEb/g'                             ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ud<+>P&o1E\G23%uI02]sh40Jjn,3?U%82DZI20d&840fL403?U.51,U100d&5.1H$@20H`2.
2E5/gBl%<eEbTT+F(KGg67s`sF_PZ&?ZKk%ATMF)+ET1e+C]J-Ch+Y:EbTT+F(KGB+CT.u+Co2-
FE2))F`_1I%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aCghC++EVI>
Ci<fj5s[eGF_PZ&3B9*,4ZX]55s[eGF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a@WcC$A2uY1-OgDm
DeX*1ATDl8-Y[=6A1%fn%17/dEc+$$+=D2DF(KE(F=.M)%159QHV[I,:..Z@4ZX]rBk/>?+<V+#
%15is/g+k?+=Lr@AU#XHBlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+BljdkBOtU_
A8,O:3ZoguBl.F+-S7AC0mc\m78?6B6Ra6-Bl.F++=@U*%159QHZ*F;4$"KtART+[Bk&\AAp&3:
+E_d?Ci^sH>9G^EDe't<-OgCl$9g.jFDYu5Ddso&ATT%V3[\QOFEDbL+D58-D.Fc0ART*lGB.D>
AKZ&-Dg-//F)rIFBONYR2BZF?FCfK6FE/L5AS,k$ATMs6+DPe4G9CX<Dg-/=F*&OHBl.F&FCB$*
+BD3)-S0=KEc*EU+=A^]@rcH<-XUOqF(f)mFCfT8CaTZ!%15is/g+kGF(KB6061WCCgggb+C]J-
Ch+Z1Bl.E(F*(i-E$0(:+E27?F<GOCDe!@"F)Q(.$9g.j-ZW]>DI[i;4ZX][5snOG?X[\fA7$Hl
ATT%B:et"h?RICG@rcGr$9g.j9gM-E:L@OFDe*2tE-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?f
DI[iQ3Zotk@s/:g%15is/g,:UA79Rk+BD3)%178qA3Dsr+tb6D9gg?[F(96.%16QeBl%<jFDX0%
+EV=7ATMs%D/^UF-OgD2-WWr0-S0=KEc*<h3Zoh)HZj7:.4cl00e5FBHZj7:.4dSjF_PZ&A9;Yt
$9g.jFDYu5Ddso/F`\`R<_Yt0/9><ADBKAq%17/nDfp/@F`\`R@WcC$A8,po+Eh=:F(oQ1+>#c"
-T`M)-WWr0-S0=KEc)<n%15is/g+e<F<G72F*)>@Gp$X9@s)X"DKH<p:-pQU-tm=9FDYP>-XU_$
-Rh2>+AG-h;GUY.C2[Wi+Co2-E$-QBBleB5A3Dsr-V-g-<)6Cp?RICG@rcH9/14eAA1%fn%15is
/g+e<F<G[DA8`T$De!p,ASuT!$;No?+=M>MA8c<q/14eAA1&fh3Zq-_6W-]e@;9^k?Q`lnF)W6M
FDk].D.Gdj+=C,a6r./;/9><ADCI+a?Ys=$%13OO:-pQUB4YslEaa'$+Dbt)A0>r'EbTK7%17,c
+Bos9Eap5/F(ZV-Bl%?.4ZX^&Ci^_?@rcGr$4R>;67sBnASu("@<?''@rH4'@;]dtDBLMR@rH7,
@;0V#+EqaEA9/l9F(Jl)FDi:DATMr9D..-r+D5_5F`7csEap4r+=D2>+Dl141*C1CCh5@L4ZX^&
Ci^_?@rcH<-WP8&Ci^s5$4R>;67sC'E+EC!AKYYpF(c!iB4t^pBK\C!+tdqHEc*EU?YEkhBOkOn
AT`$0-OgD2F(96./14e<@<6*m@<?('Ebm*P4ZX]6.!''11,Us4Eb/Zi+D,>(ALT]MF_PZ&A9;Z;
+=Jod0e%MnB4t^pBFP;40RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79RkF`M:G+:SYe$;No?+E_X6
@<?''A8-+,EbT!*FD5Z2+D,>(ATJ:f-o2u,+>>5eAnc'm%16f]/g*_T=%Q.0A8a(0$6UI4D/XQ=
E-67F-Z`^>ARlotDBOC#5sn:D83oU9;^W"]%144#A85O_CNF#L/g+nJ@<?0*-[nZR6VC?K5sn:D
0..29+<Y`8E]l#tA85O_CNF#;F(96./13&aC3(a3$6UH>FDj]G;cFlOBl%?0+Eqj?FCcS9@r`"c
+<V+#+<XEG/g+YBE-WR7F)u80Bjl*pA0>JuCh7Ys$6UH=6uHFMAKXBZ@VR8R/g)Qh/g)\fHTESu
0RH2a5u^B^?W0p2?V4*^DdmGj$6UI*AhG2oDIIBn+>#Vs-Y@LCF!i)@D_;J++<VdL:-pQUCi<fl
C`k-<F`_[R+CoD#F_t]-F<G+.Eb/a&DfU+4$6UH6+CoD#A3DOf+tauc6r-0W-S.Z(@VRGA?RH9i
+<VdL-urm-A0>E$@q7,<EbTT+F(KGGE+EQ..3NhTBlmo/A85O_CNF#;-ZWpBATMF)/oY?5-OgD*
+D#G$/e&.1+DQ"8E+D*a+DPk(FD)dEIWT.<E*Ob"$6UH>Eb/Zi+DQ"8E+CLIEbTT+F(KH#DJsW.
@W-1#/no9MDIOtB+Eqj?FCcS*C11UfF(?gLEbTT+F(KH#DJsW.@W-1#/no9MDIOt&$6UH>Eb/Zi
+DQ"8E+CLIEbTT+F(KH#DJsW.@W-1#/oY?5-Rg0^EbTW,+Co4q@r$-r/15IPF(KE(FC/p(FCep"
DegtEA7d1u$4R=b+CoS*F*(qU/g+nJ@<?0*-[nZR6VC?K5sn:D06CcHFC\g%@4ru;$6UI%FCfN8
A0>MrFEDbL+=Cl3F^K#pD.R6bF*(i2F'g[V1,<3YG]Y;B$6UI%FCfN8A0>MrFEDbL+=BomG%kSt
FD5Z2?W2&TEcYT0G]Y;B$6UI%FCfN8A0>MrFDYP2-UMifB4uBo;flGgF'hXQEbT&u@;]F<Ci*Tu
@:NY"1MpQ@1,iQWA1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<Y`BDfp/@F`\aI@ra^b+=BoU9i*kn
F('6'+DG^9IS)mn92eAI6VC?*%144#:-pQUF(95R/g+nJ@<?0*-[m^]Bll"C@:O(oBOPCdF"\ml
F(96./13&aC3(a3$6UHd67sB/FDj]G;cFlOBl%?0+Eqj?FCcS9@r`"cAScF!BkAu.D_;J++<WB]
>9J!#Dg-//F)rHOA8-+,EbT!*FCeu*Df-\!8PUp=:.\P1Df0B:-QmG@FEMVA/e&/!DIb@/$4R>V
AhG3<AU%p1F<GX7EZen2/g(T1+<WB]>9G>7ART*lGpsk[EbTW,+EM47GApu3F!,O6EX`@eCia/?
%144#0d'[CF(fK9E+*g/+=D#?F)u&5B-:`!F*)G:@Wcd,Df-\=@rc:&F<E/!-TcBZEX`@eDIb@/
$7QDk%16T`@s)g4ASuT4FDYu5De!-?5s\t&Bl%<?3B:FU$9g.jDe'u=/g*qd78?6B6QfSU1E^UH
+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD@WcC$A2uY1?O[?OF_PZ&
?ZKk%ATMF)?Y"(b:-pQ_@WcC$A7'@kF(KE(FC/Qs@j#kF/KeMFBl%<&@;]TuA8-+,EbT!*FCcS8
Bldj,ATT%k6q/;0De!p,ASuTB%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$?B]tF_Pl-+=Cf5DImisCbKOAA1%fnEb065Bl[c--YdR1Ch\!&Eaa'$-OgCl$=e!aCghC++EVI>
Ci<fj5s[eGF_PZ&8k_6*3F=p1+=BH@6"4tNCh-.33B9)I+BosuDe3rtF(HIV-UC$a@WcC$A4fNU
3B8Gr$=e!gDKBB0F<DrFC2[W*@;9^kCh\!&Eaa'$-OgCl$9g.j:JaJT6qKa/3ZqsIA0<Q8$4R>;
67sBpAfrL9D.Rr@+DGm>Anc:,F<G+.@ruF'DIIR2+E)-?E+*j%+DG_'Cis9"+DGp,$>=!ZA7TCa
4ZX]6-Y[F/GUG((4u%C[:dn,I8OFpO-Y[F/GT\@C$9g.jDe'tP3Zr*I@:Wn_@k9!>F`_[IF`_>6
F!i)7+>Y-YA0<6I%13OO4tq>*D/a<0@j#DqF<EY+-Z`s>GApu3F!,"&EHQ2AAKY`1F*(r5G&Ul3
BHVD<CghBu1*CdTDK'$+BQIa(+Dbb0E+*j%F(K;5Eb/Zi+Eqj?FCcg/$4R>=6q0p;9gq3++=D2D
F(KE(F=.M)%159QHRDF(BPnq\/g*JhCLqN6+EM+9C2[X!Blmp,@<?''-RT?14tq=qBl%@%4Z[4r
E,961+AbHq:-hTC%13OOCijo@@<?0G3ZrNcCghBu1*CCIDK'$+BQIa(+DQ%?FC]E8E+*j%+EqO;
E+*j%F(K;54#)(oBl%@%%17&bAnGanAN`'sCijo@@<?06:ddcJ5tsd!-SB@KAg\#p%15is/g+YB
D/a3*AKXZT<+T/S/Kek<F*&O:Bl%?'BlbCH/n/72+E)9C.P>dU%14L>+?CW!.3N5:Ch7Ys$>F*)
+A#%(8PUBNA8a(0$6UI'ATD4#AKZ&-Dg-//F)rICA7fFfCh4%_+<WB]>9J!#ASc0*A7BP$DffP5
4*s#6+D#G$/e&/%AhG2t7TE2T=<M-m/g(T1+<WB]>9J!#Dg-//F)rHO:/=hX3ZrHcDBL;X-p)c:
Gpt9l+DG^9-S0(UG]7)5BHR`kASu$2%14Nn$4R>;67sBkBleB:Bju4,AKYK$E+rm)%14L>+?CW!
.3NS?AnGanAISu\AhG2\4_A8MBleB'C0r*/+CoCC%144#E+EQD/g,1G@:UL+%144#BkAt?8OccQ
:*:ZiD_<.A$6UH6+<Y`BDfp/@F`\`RE+EQ'F('6'A0>T(+FZpK6VC?K5sn:D-OgD*+<VdLC11Uf
E+EQD/g+nJ@<?0*-[nZR6VC?K5sn:D0./;I6q0p;9gpT\/oY?5-OgD*+<VdLE+EQ'GB.D>AKY_r
@r$$oAdo(i+D#G$/e&.1+DGF?+A#%&:.\P1A8a(0$6UH6+EMC<F`_SFEZc`)8PN#B+Cf>/Gp%3I
+FZpK6VC?K5sn:D-Qij*+<VdL:-pQUE+EQ'GB.D>AKZ&-Dg-//F)rI=E+*j%+=DV15sn:D061cJ
ATMF)0./;I6q0p;9gpT\/oY?5-Qij*+<Y65A1e;uAScF!/e&.1+>G!C+EM47GApu3F!)iIBle?0
DJ()2A7cr94srF;%16ZaA1e;u.1HUn$=e!aF`MM6DKI"CD/a<0@p_Mf6"4tNCh-.33B9*,%159Q
HZ*F;I4cX<:dn,I8OFV)+>Y-YA0<6I%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6"4tNCh-.33B9*,EbTT+F(KH#@<>pq11,*>DeioZ67sa.Bldj,ATV9fFCB&B?ZU(&CLnW1
/M/)TDf'H%EbTE(+A*b)@<>pq1,!'X@;[i0.3N_N+D#e-AS`J;@<>pq1+=>SDIak^+=LZ=@ru-s
.4u&::-pQB$;No?+CfG'@<?'k3Zp131,EcUE\]?Y$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`i@<++_+EV19F<GdG
Eb'56D/XT/A0>u4+=M8EF(KE(FB*EsCi_$7$4R>YDdd0!-ZWpBATMF)-OgE!Ddd0!-ZWpBATMF)
<HMqkF!hD(%15is/g+b;FCSu;E+*d.AKYQ/@qBI!@<>pq1*C+9FC?;(Ec5e;-t[UDF"%P*Eb065
Bl[c--YI".ATD3q05>E9-OgDH0RI_K+?MV3Ap&3:+E_d?Ci^sH>9G^EDe't<-OgE'@j"tu-ZW]>
DI[c94ZX]B+D58-+=CT>@;[i-AU%]rCgV:/F=.M)DI[cO3ZpL,+F?-l/8es>%16u_F?MZ-4?G0&
0d](,<'`hn/1)u5+?V_<?SWaA@rrhF/g*MZ/12Vh%16u_F?MZ-I4cX[@rrht+D>:K3Zp,'DI[bt
$4R>;67sBlG[k<$+Eh10F_,V'$7At!==66m+<VdL+<VeS3Zqd:-6b&h4s27eA0>S=+?V_<?SNZN
+B]gh-Rg0b+u(3X@rr.e-WsOo=BR"73ZoOf+<Z%m+CAJ&+tb3++=Lo6+DEGN4?G0&0d%hd=YEl"
=>*f).3Ns]0d(@DF:AR)6!7;46!.8;4ZX].+FH3m?XG-(/g`b)-tm-6BeCMj4"akp+=A9t<'a8-
=YEl++@/sm:+03t=Xb^I+F>:e+Dt\2%14IK10I^%5r)PF-TsL5Ho`BW?R?sL-9`P#BOi6"/g*8<
/mg=U-Qk]S5u'0`=Y*Z(+@/sm:,45"/6ODL.3Ns]0d(@DF:AQd$;No?+D#e-AS`K4@;L'tF!,O;
Dfol,+DkP/@q[!,D]j+>D.Oi/Eb/`pF(oQ1+D,P4+Du+8+CAIu%17&p@m)jq0J5%50JG170d^pZ
F`(_!$>F`J3Zq!H+B_ehIQATY?O[>jE,oG2Bm:bI+B]g5+BU'8/NP"nEap5+G^ERq%16fo4ZX]W
/g+8!+FZ?o?XF6L-ua3:+DH'CHQZE5,p6>>+>#VsE,oG2Bm=u,=Ub]I$;No?+CT;#FCB&0E,oN"
Ble!,DBNb,F)rH5$?1#q4ZX]>/het50JG4.Ec6)<A.8l[GT].1+A"1.=]ceq3Zqd:%14M&Eap5+
GT_>UA7fj)@<,k"@;[2j==G@E3ZrB^@j#K1+F>4s=]c+?Bm;d%+A"1.=BQbq3Zqd:%14M&Eap5+
GT_>UA7fj)@<,k"@;[2i=XbIF3ZrB^@j#K1+F>4s=BQ(?%14LlFCB&B+BU0U=XbIF3ZqjQ@;[i0
+B^6V=:GTH$;No?+DN$-FCB&B-Z^DI@<?!m+D#e-AS`K2D]j+>D.Oi/Eb/`pF(oQ1+D,P4+Du+8
+F7U>D]iS%DJsB+DIIX*EcVZsE,oGO3Zp+/0JG170d^pZF`(_!$7[Y]+?_A%0d'aEE,oG2-u!oK
HQYU0=]d*q/1r&ZGT_>U@<>pq1*B[A/34nV%14R;0-ED2+u(3G+E2@2+=LrK+F>4s10I^.+=o,f
Bm:bI+CTA#DDGZD=Wf7V+BT'[%15C#6S^ec+=L>C/m0VG/1r&210I^%/1r%n@<>pq1*B[M3a!mS
/1r&RFCB&B@N\f)3`lgu5u^3,4ZX]51bLI51bLI50et@>/28n42CpR</iG("-o`A20e"52<'rDM
$:.WY1-IZ@-p0RD?SNZN+BTah+D"nG<'a87-s8*'.3NA4@<>pq1+66U3a!mSC0tCk@;[i0-s8)R
==GUH+=oPr5u^3,%13OO:-pQUEa`irDf$V;@<?4%F!(o!;GoY=+?qJ$1*AG.0I/M0%16!24ZX]`
;BRG3-mV\g.3KlY-pK>5+=]#i;GnqdHQX^d0-jFn.3r7T+>F<4-t.4+DDGZDHnJ;p.3L3'+CTA#
DDE>4;@NsB$8<SV,\;")F(HIAEap5*A0>c"F<F^/=<LaK+BVbh6!7;46!.845r)SF+@.bb=Wh[(
@j#K1+@/so1*BIm-OgCl$4R>`D/XQ=E-67F-W!*-;aj)83ZrHWF(KE(FC/Hu@;[i-F)>i2ALDM4
F(KE(FC/U#E+NoqCL;."DeioZ67sa.Bldj,ATV9jF)Y].@;B4kD/X3$+<YbX/Kc0XATMs7+D,P4
+<X*oE+NoqCEOa.DIakaAS$"*+O63N%15is/g+S=B5_g)FD,MD%15is/e&._67sBoFEDJC3\N-t
@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYh'$;No?%15is/g,=K
EaiI!Bl,mRF(Jo*Bl5%AAp&3:.1HVZ67r]S:-pQU+<XEG/g)tnA8-+(+FPjb1a$=HC`k*C@<5ja
-OgDX67sB'+DtV/@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys<_$;No?%15is
/g+SDF*2>2F#kFVEc6)>+=M8EF(KE(F=A>HF!,:;@:Wq[%15is/e&._67sBjEb/[$ARmhE1,(I>
D..H>3"63i67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`$r$>aWhA0<7?Bldj,ATT:/$4R>;67sBoBkM*%E,oZ1F<GOCARfFqBl@ku
$7InX3\`?<+>Gb`$4R>;67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$:7$H6;L`I3Zqcf2E!H&$4R>;67sBsDg,c5+CT.u+E_XB
ATAo=ARTU%@W-C,A9/1e6:""+:K\el3Zoh]AScHs<%oFU3ZpaT6pa[P,$ucACgpp<3ZqsECij)b
A9f;)1,(C9+>Fun%15Ef6pa[P+>#Vs-tHn*FCA-&+?DP+6:""+:K\lK.3NbBA3DsrA7]S!@8pc_
+>Y]*0H`(m0b"I!$;No?+ECn.A8c<-A79RkF!,(8Df$V=Bl.E(Ea`iuAISuTGs+220H_r"INU%Q
3Zp.;3B8N>+>PW)0H_kgBeCM_0JG0i$@-K!4ZX]oGp%H_+?qJ$1b^U+,9S4>Gmt++D.Gdj+F.g7
+=nX_3Zp."4t[sB/g)PeH#7(@+<r![3Zp.4+>Pnc$=nEm4ZX]rAScHs<+L7sH#7($$4R>;67sBp
DKKH1G%#3.+D,Y4D'16;AScHs<%oa1$?CDT3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!.3K',?SOQ$
3?VZd0JEqC?SsMk+>ki,%14sH0H`).0JEqC0fC^>+>Gf/0F\@D2_Zp.0fUj@%14gL0JFV(3&WH"
$8FLu0H`)10JEqC0f^pA+>Gl30F\@D3AN920f_'F%14gM1bg+-3ArT$$8FP!0d&223&V3Q0f_3O
+>PW)2%9mJ0JG@,1,(R>%14jE2)$..0f:Wo$8O=n0H`/*0JEqC.1HUn$8!ks5t"%8=Wh9.+ED`:
$4R>;67sC&ATMr9D09oA+DG_'Cis9"+CT)&+DG_8ATDs&Ci^$m/M8G*/3Z*>Ed9)VAM,)R004P)
IP)`oEd9)V8M2,rH"7?k%15is/g+VAF`(`2+Dl7BF<G1(Bl"4c-nm293[8Zj.3L3'+=Jm(INX(l
+=qPY.3M27+DbLt+=o,fF^ekj$4R>QF>,j=+Co&"FCA-&+Cob.%13OO%15is/g+,%@VfTu0d&%j
<affeATJu4Ag#B`<$3;++<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+@Kd]Bm+&u+D,Y4D'2A`
F*)>@Bk(Rf+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sBYARfY!A9/k9+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+;.@<*J5+<VdL+<VdL+<VdL+<VdL+<\so<$3;++<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL
+<VdL+<Vd9$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
%172c@PBr++@8@^6;L`,+tb!D4"akq+=Jod3Zp+*%14[E0JFUl+<VdL+<VdL+<VdL+<VdL+<WBt
0f^p1+<VdL+<VdL+<VdL+<VdL+<V+#/Mo.8+<VdL+<VdL+<VdL+<VdL+<VdL0f:gE0H_J\+<VdL
+<VdL+<VdL+<VdL%14[C0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL+<VdL+<VdL
+<V+#/M]"6+<VdL+<VdL+<VdL+<VdL+<VdL0et[J0H_J\+<VdL+<VdL+<VdL+<VdL%14[A0JFUl
+<VdL+<VdL+<VdL+<VdL+<WBn2Dd*1+<VdL+<VdL+<VdL+<VdL+<V+#0H_J\+<VdL+<VdL+<VdL
+<VdL+<VdL0ebIE0H_J\+<VdL+<VdL+<VdL+<VdL%14gD0H_J\+<VdL+<VdL+<VdL+<VdL+<W[&
0JFUl+<VdL+<VdL+<VdL+<VdL+<V+#1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL3&WTI+<VdL+<VdL
+<VdL+<VdL+<VdL%14mF0H_J\+<VdL+<VdL+<VdL+<VdL+<WU$3%uHt+<VdL+<VdL+<VdL+<VdL
+<V+#1b^U++<VdL+<VdL+<VdL+<VdL+<VdL2E*<D+<VdL+<VdL+<VdL+<VdL+<Vd9$8jLk+<VdL
+<VdL+<VdL+<VdL+<VdL+>l)40H_J\+<VdL+<VdL+<VdL+<VdL+:SZ90JFUl+<VdL+<VdL+<VdL
+<VdL+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd9$9'Xm+<VdL+<VdL+<VdL+<VdL+<VdL+>Yu3
0H_J\+<VdL+<VdL+<VdL+<VdL+:SZ;0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^3ArQ6+<VdL+<VdL
+<VdL+<VdL+<Vd9$99do+<VdL+<VdL+<VdL+<VdL+<VdL+>P]+0H_J\+<VdL+<VdL+<VdL+<VdL
+:SZ40JG1'+<VdL+<VdL+<VdL+<VdL+<Vd]2)d33+<VdL+<VdL+<VdL+<VdL+<Vd9$8F7h0H_J\
+<VdL+<VdL+<VdL+<VdL+>GQ10H_J\+<VdL+<VdL+<VdL+<VdL+:SZ41,(C)+<VdL+<VdL+<VdL
+<VdL+<Vdc1b^$p+<VdL+<VdL+<VdL+<VdL+<Vd9$8F=j0H_J\+<VdL+<VdL+<VdL+<VdL+>c)4
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ41b^U++<VdL+<VdL+<VdL+<VdL+<Vd_1,'gn+<VdL+<VdL
+<VdL+<VdL+<Vd9$8FCl0H_J\+<VdL+<VdL+<VdL+<VdL+>PW)+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZ42D?g-+<VdL+<VdL+<VdL+<VdL+<Vd]1,'gn+<VdL+<VdL+<VdL+<VdL+<Vd9$8FIn0H_J\
+<VdL+<VdL+<VdL+<VdL+?:Pe+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ42`393+<VdL+<VdL+<VdL
+<VdL+<Vd]1E[e_+<VdL+<VdL+<VdL+<VdL+<Vd9$8FLo0H_J\+<VdL+<VdL+<VdL+<VdL+>G\q
+<VdL+<VdL+<VdL+<VdL+<VdL%14gL2)$-q+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL+<VdL+<VdL
+<VdL+<VdL+<V+#0f^pA+<VdL+<VdL+<VdL+<VdL+<VdL/MeLl+<VdL+<VdL+<VdL+<VdL+<Vd9
$8FOu0H_J\+<VdL+<VdL+<VdL+<VdL+>Pr"+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ,%13OO/M9@U
6pa[P+D!/JFCAW4%13OO:-pQU@rH4'@<,p%@rH4'F`_2*+EhfY+D>J1FDl26@ps0rG%#30ATJtG
+EV:.Eb-A%Eb,[e:-pQUF*1r5FCB'/Bjkg#G%#E*@;]RdF!+q7F<GX9@rH6qF!,O;Dfol,+C\n)
,!o^SCb8IlEbfqE%15is/g*nb<(/hjG@_n*Eb-A8@;BRpB-;IP0HbIOD.Rc2/Kf.KAKYT!EcZ=F
Bl8!6@;^00De:+$$;No?+CQC<ARTU%FDi:CARuutDg*=CBk(pmDJ()#A85O_ASuT4Bl8$(Ectl-
F!+t+@;]^hF!/bm<$2VWBOl3=4ZX]60d(fe0d(RH@PB5R/1r%nHo`BqA18WP/g,O&A7]S!@8np)
0d(aP4ZX]m0J54*0H`&%2(Kk)+>G!E+>=pb+u(3^@:Co"$4R>;67sC$ARf:hF<Ga8Cis<1+E(j7
cBM9NAo_g,+Co2,ARfg)Ddmd!Ectl5Bl@ku$;No?+CSo'AS#^iDKI"8F!,")@qBP"+E)F7EZfI;
BlbD9ATDL'A.8lf@:CrS3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!.1HV=3AiZ#1GLL:#n74r3ArPt
1G^X=#n74r3Ar`$1GpdD#n74r3B&Vu1b^O;#n74r3B&f%1c6mC#n74r3B/]!2)$X?#n74r3B/l&
2)HpA#n74r3B8c"2)['I#n74r3B8r'2D?aC#n74s0JG0e2DZsF#n74s0JG?j2Dd$F#n74j%13OO
/M9@U6pa[P+D!/JFCAW5%13OOBOl3>4ZX]60d(fe0d(RH@PK;S/1r%nHo`BqA18WP/g,O&A7]S!
@8np)0d(aP4ZX]m0J54*0H`&%2(Kk)+>G!E+>=pb+u(3^@:Cr#$4R=r+>>'PEaa$#+=BKA6pa[P
+CTO<H#7(7A9h].A99LJCgpotF^el(Ed8d@A99LJBOl3>+EV%$0HbIG@PK!NA1&K/$4R>`D/XQ=
E-67F-W!*-;aj)83ZrHWF(KE(FC/U#E+NoqCL;."Deio3EbTT+F(KH#D.R:$F'j!*DeioZ67sa.
Bldj,ATV9rAS$"*?ZU(&CLnW1/M/)dD/X3$+EV19FE8R:DfQspAS$"*+Eh=:@WO.2$;No?%15is
/g*G&+Cf>+ARfgrDf-[?De:,6ATMr9@psFiF!,(8Df$U>9k@mYF!l#O+>Gl:0d%T)F*)G@DJsB+
@ps0_$;No?+@0gVDfTQ6BPhfC%15is/e&._67sBhF)uJ@ATKmTB6%p5E$-QLBldj,ATT@DBlbD5
Ddd0fA.8l@67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,EcUE\T<lEb0,s
D.R6#FDi:6Des6.G9A;HEc6)>?Xn"jCh7*uBl@lrFCfN8FEqh:.3NG8H#IhI%15is/g)o*D..H?
3$<<SF*&OKDfTB0+Dl%?ARlp*D]gHKBldj,ATUpoBl%i>%13OOCi<`m+=D2DF(KE(F=.M)Ci<`m
+=D2DF(KE(FB*EsCi^s5$4R>;67sBoBkM*%E,oZ1F<GOCARfFqBl@ku$7InX3\`?<+>Gb`$4R>;
67sC'FD5P6G%G]'+EV19FE7lu@Us+73ZpC90JG1'.j-Q#+<W-VBeCM_0JEqC-uO-?0Hah8B.4rT
3Zr<ZFD*?N@Us*\$7Ke6BJ:P\@Us+#+>#VsDJjQ00H_rVA7l>Y%15is/g,+OF(o`1G%E=EAS5Fn
Bm+&1@psCgBl7?q+Co2,ARfgrDf0V*$7IGJ2'=+d/34n-+?;+u0fUj01,gm00I\+r3Zr<^BJ:P[
+>k8d+=oPr0H`A0+>Gi0+>Pl0+>Yo0%14L7+>k8d+=oPr0H`,00H`)00H`A0+>>5e/NP"lFD*?N
/0Hem,9SNu+>"]i+?;+u0fUj01,gm01H$or$4R=r+?^i[<%rT7A0=K"0JG2+D.[;f$4R>;67sBq
F_kc#DBNIuFCcS,DfQsdE,oZ/+>GQ$+>Gl92]uON+>@IO<E(R[$8OFp2E3]S/i=b7+DQ%8Ao_Bi
C`kGm3&_s:+>GPZ$4R>;67sB[+Eh10F_)!h?SF)e1,gsK2D[9I1Gh'64Wnc[A0>Ma0R7MG+>Gl9
2]sq"0ea%D%15is/g,"BAT`&:G%#30ATJu5B.b;d2%9mb6u>(J+>Pc12E3]T/i,1>1,TLJ<,FcZ
+C?fT0et[C2`*<E%172j0Prs6+C?i]2`E]P0eP4>1,1OB2@U!&$;No?+=Js!/i5""E+^:Q1^se6
BJ<pZ3Zp1;0J51?0K(XF1H-F,+=K$(0J5@F2)[9M1H%-H3?Tdo8jmM=/Kcf*2)-sF2(gR3+=eQ_
0J5%50Jb[I3AWH6.Nh]-?8<rP/Kci/2_d!?0JFUqINVU,?8E#t%15is/g,4PDfp/@F`\`RG%#30
ATJu)BkCsgEZf(6+DbJ-F<G+*@qfdgCaTZ!:-pQUF)>i<FDuAE+=KE8/hn^r@rH4'F`_2*+Dk\$
F`SoZ+=o,f-QjcZ/1r%m0J5:3+?1N*1*C[P0Ol4V3ZrNX0Pq7+%15is/g,=GCis<1+CSo'AS!!+
D]gq\A7]7bD..7%%156O+=Aiq2CBV,+Z_A$FD*@<+=oPrFD*@F%13OO:-pQUD.R-n+EM7-ATD?j
C`mh6D.Oi%DfQsT3B/r?6#^jYC`kGd+CT@70f`o.1,3W,0JIPj<E'D7=\V:I3Zp.;3&_s:/28h$
.j/G7Ao_R%F!*1t+>PYo0F\@]6t8A@+DQ%8Ao_BiC`lkT6k'K&@m)jqB2gR1D.Fbl9gfEt%15is
/g,=GCis<1+CSo'AS!!+D]h"^A7]7bD..7%%156O+=Aiq3%#h.+Z_A$<+@%%3ZqC=%13OOFD*@<
4ZX^&ARTItBk1sh0H`tU@grbS$;No?+Eh10F_,V:@:sUlAKZ)5+>t?QARfFk@;Kuo$9^$b-SR/2
-QkAl3\hh"BJ<p=/34nqBJ=94$4R>;67sBuDfT]'Ch\3,+EV9N@grceBJ<pZ3Zr<^BJ:QNBJ<p*
$?Tr8D*9p&0et^@2`!BP2`!95+AP6U+E1s93&M-P%15is/g,"B@;[3/Bk1dqARTBtFD5T'+@0se
Bl"nH0J">$3B/r?0Ha@p+DG^9BPhf5E+^dG3&D'OFD*@F4ZX]50f(1=-S[;&4!ujC/i,CD3%#.B
FD*@<4ZX]:-SR)*/2/\5-Qjfs+Z_;++Co>1Ao_Em+>G_r-%6tSFD*?ND.R-nF(o01D.G=C0f_3P
+>b2q0F\A2BJ=9G/NP"rBJ<p*$4R>;67sC(@;L'tF!+n(Eb/f)FDi9[+Co%nBl.9pEt&I>0-DVr
/iG("3$C=<+EV9N@j!<`+EV9ND%-g]$7Kb&@;^.#A85X/+DQ%8Ao_BiC`lkT6n'6A+Dk[uDKBN&
H#7(G+B_E,%13OO:-pQUD.R:$F!,F7/g)l)2@U")0KhH>/7`U=Ao_Em+Dk[uDJs!#BlS90FEqV3
0H`,-1c@<R2(g`q$4R>;67sBt@<?!mATJu9D]ghYA7]7bD..7%%14jH+>Pht1,ggB0K1++3Zp+/
0JG4(Ec6)<A0>G;%13OO:-pQU@;p0oEb0-1+EM7-ATD?jC`mh6D.OhA+Dk\$F`S[EB.b;d1^se6
BJ=9d3Zoe)1FG730eat:-T!_60f([7%172j0Om7,+CT5.@<-F'A85X/+>Pc12E3]S/i=(F:-pQU
D..NrBOu6-FDi9X+Co%nBl.9pEt&IuBJ=9G/NP"*-SR)*/2/\4-Qjfs+Z_;++EV9N@grbS$8OFp
2E3]T/i,1>1,U1;+A,$b3Zr0[Ch@]t@;I&;H$O[\D/Elq+>Gl92]sq"0ea_)3?U(3+>=63FD*@<
4ZX^&ARTItBk1sh0H`tU%172j0Prs6+C?i]2`E]P0eP4>1,1OB2@U!V0-DVr/iG("3$C=<+EV9N
@j!<`+EV9ND%-hI67sBt@<?!mATJu9D]gkZA7]7bD..7%+>"^QAS$"*+E1sG+?24f$7I;R-TEJ&
4!ug@-T`\52_HdD3Ar66+>#Vs/13,&0J"n11aaCo3$C=:.3L0PD0'<0A7Qf;2'=2o+Du:70HbIN
0OkP!%15is/g+2+DKU"CDf-[P3B/u@9jr'PBHT&a+@:!fFDl%>/KenAAT`&:E+^dG3B7NU=\V:I
3Zp.;3&i$:+>PV[$?Tr8@m)jq@;p0oEcYr*C1K"@C3=?)EarNo+B_E,%172j0Prs6+=Alu-T`\5
0IJq02)m3C0II;::-pQUD..NrBOu6-FDi:DASuU'+E(j7@3BW&@rH6q%172j0Pqpa3Zoe(/2/V/
/i"ds3$C=:+=nXWBJ<p*$?Tr8D*9p&0fM$D2`*9D3"63i67sBjDf0`0Ec`F;D0$hABl.E(FDi:4
AS6$pAKZ)/D.O.`FD*@<4ZX]rA7fjmD0$gS2'=@kFD*@<%15is/g,">FCSuqF!,RC+>b3OARfFk
@;Kuo$7IGZ/het50d(LTF`(_4FD*@F.3L3'+=o3!0JG18+EDCCDIal3BJ<p*$4R>;67sC'DJ=28
@rH7.ATDj+Df0V*$;No?+D>dHD/!l=F(Jj&/nAK8FDi:4AS6':A7Q,V1bgU:2)I!F1E\h'0J5%5
0JG18+EDCCDIal#A7fjmD0$gS2'=@k1*AD1+>GW(3B&f<+AP6U+AtKJBl5&,/8ZqZ%15is/g+\9
B6,\9A0>u4+D>dHD/!l=F(Jj&/nAK%$8N_\1a"M./ibjJ+>#Vs0J5%50d(LTF`(_4/7`U=Ao_Em
+>G_r-%6sn0eP.;1b^gD%13OO:-pQUAT2QtBHU_oC3=T>D.RU,+Dk\$F`S[EB.b;]1,]RKH=_1P
D*9p&0J5(>1c[?K0d'[CH8'2!3Zp+/0fV!M2)7!2>9J$$0Prs6+>>E&2D@'D3%tdK:-pQUD..Nr
BOu6-FDi9U/het50d("<B6%QpEt&I!4YJ!6+Bos20J5%50JO\jDfor.+=MPIF>.P_H8'1eFD*@F
.3L/o+F7U@H?<h"0H`,)1,pC20d&2,/ho?q$4R>;67sBhE,]6+ASuT4Ea^M0ARcj"AS$"*+E1sG
+>GW1%14J'@3B)l@jaE#+<WEn1,pC20d&2,/ho@/@;p0oE`,1k77/1S0eP.;1b^gD+=o,f1c[0D
1,h-L0F\@a67sBkAS6$pATJu2@<?!m+EVNE1a$=?@qfdgCi^$m4YIp*0J510+=K2m3\i-,1c[0E
1cR<O1E\50+Co%n%156O+=Aiq1aaCo3$C=<.3LH%/i>IE1,1U./34no@1<Q=67sC$@3B9%+D<<C
/9;qN@<?!mATJu9D]j+4@rH6q%14LG4"akp-Qk/e1c?I20deCm/NP"*-8%J)-SQnj-o`A20e"5U
D0'<0A7Qf;2'=2o+=qPA%13OO:-pQUD.R:$F!,17FCfK3Derj(Bl@l3A8,XfATD@"@qB^4+E1s9
1,L+/2%9n(0KhH>0eP7A0f1XG1a"M*1H7*E1,1R-0eP7A0etRC1CX[S0-DVr/iP.#3$C=<+Bosq
0J5%50JY=A0d&/&0JG171,L[-/34n;0d(fc@;KajBkDE/AM=Q#4YIp*0J5:3+?1N*1*BdD0J5%5
0JYF>0d&#.+?hP'HQZa5Ch.6lF!,$J%13OO:-pQUFD,5.BQ&$6+CT/#Ch4_[+?^ihBJ:P\+A<n0
+ECm5AoD^,F_kJ/Bl5&1AS$"*%15is/g,"RF*&O6AKYH&@:O(aFCeu*Ch[Zr+@mV<+=M>F0H_qi
9IV)9+ECm"$;No?+D#e+D/a<&+Dk\$F`S[EB.b;e0b"I\4ZX]6-tIC2EbK<2+?1K"1a"Y6/iY^E
.3L2b-tIC2EbK<2+>k9$+>G`+2^p0u/KeSFAo_R%F!*4o+?:Q!2D-mE0b"Ib67sBjDf0`0Ec`FF
ARfXrA9/l8D]i_3F`MOGFD,6'+Co%rEb/g'+>"^Q@<?!mATJu9D]gq\A7]7bD..7%%156O-SR/2
-Qjfs+Z_A-+>u&/1GppB1G^.)3Zr<^BJ:P`2'=@k1H$p@+=2IZ8.>n8$4R=r+>>'PEaa$#+?MV3
@Us*oFD*@F+EV9N@j"`f+B2hnAM>6QATTVC+F5_Y+B_E,+A,$E8jm/38jmM=Ea^)$ARciR-OgCl
$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#D.R:$F'j!*Deio3EbTT+F(KH#EbTT+F(KH#F)>i2
APPQE.WT6EATMF)?ZKk%ATMF)?ZU(&CLnW1/M/(nEbTT+F(KGB+EMC<CLnW1ATMs7/e&._67r]S
:-pQU@rc-hFCeuD+>PW+1MpQ@1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16oi@:UK.EbTT+F(KG@%13OO:-pQUD.R:$
F!,F7/g*/7/28h4%15cq4ZX]m2_cp=3&<?51bp[>1G^g0+AP6U+@:!fFDl%+$<^(k4ZX]?3B/u@
1E\G,%16*24ZX]>%15is/g+S5A0>f"C1UmsF!,@=F<G:8+A"k!+DtV)ATJtG+Dtb%A9/kF+DtV)
ALnsE@4WO3ARc/V5u0g1/g)Q)4$"`iASuX3-RgSp4>\cF2`!0D3@QLA0fUdB1b^pF%15Bs69QqD
/1)u5+=K<4-Vm'$?VY$HAKXc88mbI^?V3(-0JFVF6:tTQARf(>1,(C9-Rg/h/g*GU64F8iAScHs
<-(iYATDKqARBIlF(KE(FC.0l+>l%d$<D1g4ZX]6=\V:G<DP\M69@:q:I6KQEbTT+F(KG9-WXer
F`So>$8<SV,\;")F(HIA6tL1V@8q;DG%G].A7]+gBldj,ATV9,%13OO:-pQUG%#30ATJu&Eb-A;
Bln$&DBLYf+Dkh1F`_29+E(j7FD,5.D.R:$F!+q1DegI)$;No?+ED%7F_l.B/KeqLF<G4:ART['
@Wcc8B5_^!+D#G/F_>A1AoD]4A7]Ur+EqaECCLVFAS$"*D/!lN3ZoOq0-VMn+C-*J0H`(m.O$Si
>p(jW+>Pes/0HZ-+>beq/34n/+>l"c$8F4W4s3$A076K*AT`'2Bl5%F+=f)h+>G!E+>tnr0d%qi
0d'aE?SWaN/g<"m4#.q*+u(3@EcW?4$4R>969R@P+C?iX2D-dE2*!NP+>bl,2Dd<N2`2^#+AP6U
+AHEfBk1pdDBKAq=\V:I3Zp131,C%/+>Pkb$<9kb3ZoP'+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%
67sBT;cFl><'qdHAnH*qF:AQd$;tq.3ZohR9gh'C:HM6:.3NYFF(KE(F<DqsChI[&-Qij*;KFu^
+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,4"!sGBk(R!%13OO:-pQU6?6dQBQP@q
FCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjklg$;No?+D>k=E-"&n06_Va/n&R5@;]L`/n8g:04ApD
Ec5i6D0[dDEbT0"F=hQU@<-EBH>.>.De*E43&<HL2D6g>1,CL91G(@@%15FC4ZX]I3[[40FCAm(
+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d@<,do+AuodAS`JV@;odoCgeGQASc0kFE2)?-OgDL
F$2Q,6?=\>3[[7*FCf9$AT`'*+B)upBm"J>:i^JaH#IRC:iC/dFa,$,AS6.%F`S[(E+rfj+@1$X
FEMVHF!*bdFCB3$F!+LpB43/1%13OO;KFu^+=LAe6p"CE4%qsi+ED1;ATMF)+@:,Y$4R>;67sC&
Ea`j,BlnD=D..NrBHUnqBl\$8+EqC5C`mb4F(I"GATVu9A8,XfATAnN+EVNE0ea_eBl8'8ATJ:f
6??+H@;^.#F?MZ-3?U%9/28h$3%Qd>+>Pf*0fC.12(UIA+>PK&3$:%4/29+,1c$[D0fU:50b"IV
F&[0gDKBN64ZX]PF&[0gDKBN6+=nWi3?U(3/2An%0ek470d&>)1,0n+0e>(9+>Yi*1*AG2/2JD*
1b:L,2)m-J3$:$e$4R>;67sC&Ea`j,BlkJ+CijB5F_#&+A7]CoAS#ol$:8f"Cihg$+>l#!3&i$8
2BXt<+>ttt1H6L:2]st5%15FC6#:X+3Zpb16#:Wo2)?@13?U16+?),"2)l^72'=e7+>Gl!3&M-P
%16'/:d$i^HTE?*+B!7i$:.?b4ZX]6-p04G/2/M"HR:p!<)$1<+=o,f6?>G/F<D#"<)Q[Y3Zoh!
4>AoQ+>YGnHR:p!<)$1<+=o,f6??+H@;^.#F:AQd$;No?+CT).BlnK.ATJu2@<?!m+EVNE0d("<
B6%Qp%14g44Wlp@0-Di"+u(3+9N2H.%15is/g,7V@;^.#F<G[>D.Rc2D..NrBHVD8+>G!UBl8'8
AKY])+EqaEF*&O7@<5uh$8EYd+?hD2+FG:[2D?6u3aOjS0d'aE0H`(mHQk0e<)Q[E+>"]o0H_T$
?92FJ+C-*F+>Y-e+u(3>;H+)4%14IS5uf%&5uo?r3Zr6W@:XG$@<-E30F\@;HS-Ks+AP4'.6T^7
HTE?*+AP4'%14M1/g<"m8O6?*4ZX^43[-:$8O6>c$;P#QEcXB)+=LAe6p"CE4%qsi+ED1;ATMF)
+AQ?g?W2&TEaMRMD.O.`8RZa^F$2Q,-s9844&o'<9L:0NEbTT+F(KG98O6?`:18!N%13OO:-pQU
A7]@]F_l.B%15g@EbT&u@;^+,4ZX^"@<Gq!De*:%+>=63%15is/g+\5FCcS5Aft)iF`MUIF*(i2
+E1b0FEo!>Bl7L&%175\9gh-*+>PW+1*A;*+>Gkc$<9c";H5k@+>GZ,/hf"?1bg+[1,U[?1c$g?
%175X<'rf0+C@,]2'<>8F\GLq7m/mU2D-Zm$?]$5:Jt@Z3Zp9h$<:nbEclDD4ZX]6F]hF,4&nsS
;H5f$<E)=IF\GLq7ltie85E,e.3N>5F^K6/A79a+0F\?u$4R=r+>>'PEaa$#+=BHN66K!6AT`'2
Bl5%oEcW?s66KE*6m,K*+B!8'6?=89F&[0gDKBN6+@:-8Cige!9i)ru9N3-6;H+c6@<Q[4+A$!a
EcWT;$8<SV,\;")F(HIB4$"`\5uf%&5uo?^+=nW`HS-Ks+AP4'.4cTg/g<"m8O6>c$8<SV,\;")
F(HIAF]hF,+B;*8;H4i^<E)=.F\GLq7j)qJ85E,e+AHEfBk1pdDK9e@<GZeuF`MON%13OOF)>i<
FDuAE+=BuO;c?+Q3]\C(Bldj,ATV:"Bldj,ATV:#D/X3$-ZWpBATMF)?Z]^oDImiqF)>i2APPQE
.WT6EATMF)?Z]^oDImiqF)>i2AKZ(H/Kf+ODeio,FCfN8F!,(5EZe=iDJj$++Eh=:@WO.2$;No?
%15is/g+hLFDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@H?$;No?%15is/g,=KEaiI!
Bl,mRF(Jo*Bl5%AAp&3:.1HVZ67r]S:-pQU+<XEG/g)tnA8-+(+FPjb1a$=HC`k*CF`_&6Bl@lr
-OgDX67sB'+Du=D@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>XD.F(_:-pQU+<YQEFCB9*Df/orDI7<k
Ch[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.F(_:-pQB$;No?+CT>4F_t]23Zr'UDfp"A-us$C
ATMF).3N>G+Dbt)A7]9\$;No?%15is/g+YEART[lA3(hg0JYG$@<+(X%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OOCi<`m
+=D2DF(KE(F=.M)%15is/g+hAB4rE,EbTE5+E2@4@qg!uDf-!k-oiG30ek+"0fBIJ%15is/g)_t
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g+YBD/`p(AKX`jFCB9*Df-[hDBMAXCh[j1Bk(Rf+A?]kB5)I1A7Zm*D]j43Cis<1%15is
/g+YBD/aW>ARlolF<G7=FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@IFDId='/oYKC
%13OO:-pQU<+ohc@:NeiEa`I'+E(j7FD,5.@ps1`F_kK.Bl@l3A7]7kARTXkF!,R<AKYT-Ecbu+
EZee7@<i:h:-pQUH#IgJB4Z0-Ao_g,+EV:.+A+CC0JFV\E,T6"+EqL5@q[!!F!,[?Gp$[;De!I%
+CT;%+ED%7ATS@g:-pQUAThX*Gp$^5Aor;@H"CE)F!,CA+EMHD@;]TuDIn#7@;KRpEbTW/D0$h9
Bkq9&FD,B0+E)./+CT;%%15is/g+SCAKZ#)B4YslEaa'$A0>K)Df$V<Derj&+EMgLFCf;3@qBIf
F*),)C`mS+@q]:gBk)3:%13OO:-pQUFCfN8+Cno&ATJtJ+B;AM$@-K!4ZX]@0JYF,1E\D-+=nWi
3Aif>0esk+0d&"i1,1RB+>GVo0f(@'0fUj@+>P&o+=oPr0f_$I+?(E$%13OO:-pQUF(f9"F<G+&
FCfM9AoD^6@<,m$@;]TuF(KG9FD5T'+EVNE1,*B&0f<f/1GNqn<E'D7An5RlF$2Q,An5LoBPhf5
BPhfR3Zp13+>G_r1GK=GH#7(I4ZX^-De*9uALKbq0eb:8,CUk_D.G(GFDk\uH#@OCH#7($$@-K!
1-IZ@H#7(I+=eQ_,C+-:1+==j+=oQ-+>>?YA8#h$%13OO8jmba3Zp172D?g>2(g`q$8O:j1E\Ir
0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>A.fD.F(_DKU%a3Zqc`/het72`!-B2_[05
:-pQUA7]B_$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Ju67sBhB6%QpF!,RC+?(ER
ARfFk@;Kuo$9^$b-SR/3-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp171H%6J1G1No$8FOu
3?U%3+>GSn/NP"/H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kHZH#7($$>t!.4ZX]m0J5%50JY@<
1bgsD%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q:-pQU@:sUlATJu9D]gt]A7]7b
D..7%%156O+=Aiq2^]^r3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@2)$a>3B/WK%14jF1Gp:0
1*A;-+>#Vs14+:`A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&AH[0I=%16uqF?MZ-?SF)d0JP@A3B&iS
0b"J-F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$;No?+CSo'AS#p*FDi9Z+Co%nBl.9p
Et&I>0-DVr/i>"!-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,CjK2)7*C2%9mI3&!$/1*A:o
/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\H#7($$>t!.4ZX]m0J5%51,1IB3&!6L%16uq
@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu
$4R>77!(RQ+>Pc/2`WiX/i=(F0f_$I+?(E$+>#Vs1jaLbA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&C
H[0I=%16uqF?MZ-0J5%51c7-I0JtO?%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q
4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>;67sBuDf-[O+B;A`FD5T'F!+1cGp"gm+>PW)
2BX_13]&WR1,9tP<"01,7!(RQ+>Pc21H76N/hf4=2`NQL0K1gB2[p*d6p3RRC3=?)EarNo+>PW)
2BXk.0d%thAn5LoBPhf50f'q/1E\G.%156O-SR/5-Qjfs+Z_A-+A,%D+=oPr8jj*qDKU%a3Zqc`
/het52)-sE3AE<!$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/iG("-o`A2
1+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LmC1,1I81GgpC0K;!O2DR9N%14L;H[0I=1+==t3Zp13
1,C%5/2At'.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&?H[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q
+A,$2$>t!.4ZX]m0J5%51,1OB0K(pJ%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q
4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc02`N`M/i,=@0ebRG3ArWQ2@U!A
0me1_A25SV/NP"/3ArW82_6^@+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r0me1_A24T$4YJ0:/ib:%
-o`A21+=><7!'P&3Zq$_%16uqF?MZ-?SF)d0JbOG1H.!B1CX\/F^mQq+Du=D@<?4%DI73uDJ*[*
F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp180JY@:2_HmC
1bg[D2`WcO3Aq<R-o--pD.GCN+>#Vs1,1RE+>tc1+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r14+:`
A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-0J5%51,CpN1H@3L%16uq@m)jqDKU&0
FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ
+>P`33A`NK/i,=@0ebRG3ArWQ2@U!A1OFCaA25SV/NP"/3&!*12_6^C+=eRHA8#h$%15]q4ZX^#
F_kZ1@ps0r1OFCaA24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-0J5%50fCsL2`3BF
%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPr
DKTFu$4R>77!(RQ+>Pc/3&NWP/i,=@0ebRG3ArWQ2@U!A1jaLbA25SV/NP"/3AWT:1+Y.6+=eRH
A8#h$%15]q4ZX^#F_kZ1@ps0r1jaLbA24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-
0J5%52).$J0JkO?%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m
3\i-,+Du=D+=oPrDKTFu$4R=O$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+Cf>,E+*cu+AR'$@<?4%DBMMg+AZH_BlS90
FEo!)Aft&dAKXEOCh[j1Bk&9-D]j43Cis<1%15is/g+YBD/aW>ARlolF<G7=FDu:^0/%3SDfB`8
B6%EtD/!L$/n8g:05boS@<?4%DK@IFDId='/oYKC%13OO8jmba3Zp172D?g>2(g`q$8O:j1E\Ir
0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>A.fD.F(_DJs*.4ZX]>/het71,(O@1-%?T
3$:s_/g+\9B+52cDe3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%15is
/g+S8Eb/g'+EVNE1*C+=@qfdgCi^$m4YIp*0J5+.+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.
4ZX]@1c%$M0f(F>%14gM2)ud61*A;++>#Vs0me1_A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&@H[0I=
%16ukATU'r+C?fT0JG7@1,:gJ1GpmA%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(
?XuTEF$sSP+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V%15]qF?MZ-1,Ua?0f_3G
2%9mJ0f([00esk+1E\81+>S:hD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r14+:`A.8l`De4#R3Zp+/
0JG7<0f_*L2Dm0C%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2
$9^$b-SR//-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V%15]qF?MZ-1,CjK2)7*C2%9mI3&!$/1*A:o
/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\H#7($$>scnF?MZ-0J5%51,1[E1cR3M2DbjM
DJs)r4ZX^'F`_&6Bl@lrDdmNsEHPu;H!b,mCh[j1Bk(L\7<!<9AS3,X6k'Jd0-DVr/i+jt-o`A2
1+==gDJs*.+=oPrDJs)r%13OO8jmba3Zp171,h3Q3A*/u$8FOs2'=h#2BXS4+>eFjD.F(_8jmbD
4Wm?b4ZX^#F_kZ1@ps0r1jaLbA.8l`De4#R3Zp+/0JG1?2`*6J3&30J%16ukARdka+Du=D@<?4%
DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2$9^$b-SR/0-Qjfs+Z_A-+<YQ?ATT%G3Zr<Y
ARc/V%14d30I14M@<6!&-[BQ>+F.g71*C1>BPhf5BPhf58jmbD8jje>F`\aDF^lP3De4#5DJs)r
-OgCl$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#FCB')ATD.!D/X3$-N                 ~>
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
0ekF+0eje,+>bbp1*A>23A;R20H`+n1c.3N+>GVo1*AD62'=V2+>P&s1c7061,L+/+>u/72_cF0
2'=Xs2`ETS+>bhr1*AG73&_s83?U("1cIET+>bnt1*AA31-$I30H`+n2)$s30f:(/+?;;66?6dQ
BQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2d^E41,g<u/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=+<X!h
A9f:?+<VdL+<VdL+AuopATJt:+<VdL+<VdL6ZR*dF(KDt+<VdL+<Ve$@:sIlFEM,*+<VdL+<XTo
FE7lu+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL9kA?ZA8,Ii+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#+<W6f/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/(s/M/P+
/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+%144#6#:XOBlY==+<VdL+<Vd^3]&T75qYka>Tb.3+<W[*
0fU:A/kms'+<VdL+>>E-0H_J\+<VdL+<VdL1HIBN+Aa[b/mJhm+<VdL+<VdL+<VdL+<VdL+@RCq
+<VdL+<VdL+<VdL2)W7T+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.%13OO+<X'`DIm9"+<VdL
+<VdL+>GQ21cHOR/kms'+<VdL0ebXB3$:L>9eKZn+<Vd]/i,1(+<VdL+<VdL+<W[*1,^7O/kms'
%144#+<VdL+<VdL+<VdL+<Ve%+<VdL+<VdL+<VdL+<WX'_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+AN@Q%144#7W3-PChR7"F<D\K+<Vdd3\rN65qYka>Tb.3+<WBo3\iQ8:bGHp>Tb.3+>GK(
0H_J\+<VdL+<VdL1cd?N+Aa[b/mJhm+<VdL+<VdL+<VdL+<VdL+B(]O+<VdL+<VdL+<VdL0fHnQ
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve*<t,KG$6UHWChI[&+<VdL+<VdL+<WR'1c6CA/kms'
+<VdL+>c,82'>^J9eKZn+<VdL1+k=9+<VdL+<VdL+<Vd^3\i]<5qYka>R_#_+<VdL+<VdL+<VdL
+<VdL:.69J+<VdL+<VdL+<Vdd2o;dA+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XE\%13OO+<Wsd
A7]4YEa`i.+<VdL+>GQ22)HFA/kms'+<VdL2EENI+Aa[b/mKMA+<Vd\/ibU.+<VdL+<VdL+<WC"
0f1"=/kms'%144#+<VdL+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WQt_QY.*+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+APuI$4R=b+AuodAS`J3+<VdL+<VdL0fh$C+Aa[b/mKMA+<Vdb3]&Q6:bGHp
>Tb.3+<W?j0ea^m+<VdL+<VdL+>GW40f:(>/kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL
+<VdL+<WI"_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#6XaqFCi!N&+<VdL+<Vdo
Bl[^+D/aE0@<,Tq+<WR'1c$7N/kms'+<VdL+>>E&0H_J\+<VdL+<VdL6YURNF_u)9Cgh?h%144#
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<WX&_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SYe$6UHXASc0kFE2)?+<VdL+<WBo3\iQ8:bGHp>Tb.3+>u8<0d':F9eKZn+<VdL0eP@<+<VdL
+<VdL+<Vd]3\iH55qYka>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vda1;^7<+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<X_p$4R=b+@9X]ASc!jF`V+:+<VdL0etdI0d':F9eKZn+<Vdc
3\iE4:bGHp>Tb.3+<W?j1b^$p+<VdL+<VdL+>Go72BY:<9eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q
+<VdL+<VdL+<VdL+>kslYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHiBl[p1F!)SJ
+<VdL+<WI$0f:(M/kms'+<VdL+?2D:0d':F9eKZn+<VdL/MSk70H_J\+<VdL+<Vd]3\`?35qYka
>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vd^3Pr!C+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<XTa%13OO+<XL$De"'2DBL&E+<VdL+>Pu71E]LH9eKZn+<VdL3BAiO+Aa[b/mKMA+<Vd\
/i57)+<VdL+<VdL+<WI$1GL"</kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL+<VdL+<VdL+<WNr
_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#:iC/dFa,#O+<VdL+<Vd]3\WK8:bGHp
>Tb.3+<W[*0ejeI/kms'+<VdL+>GK(0H_J\+<VdL+<VdL2**KH+@.VS/mJhm+<VdL+<VdL+<VdL
+<VdL+AP?J+<VdL+<VdL+<VdL2`/CU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%<t,KG$6UHh
AS6.%F`SZJ+<VdL+<WL%1c6CP/kms'+<VdL+>GT31Gg4N/kms'+<VdL0eP::+<VdL+<VdL+<Vdb
3\iT95qYka>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vda35VmB+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<X_p$4R=b+B*5n@ppK&+<VdL+<VdL3BArN+Aa[b/mKMA+<Vd^3]/`:5qYka
>Tb.3+<WBk0JFUl+<VdL+<VdL+?2D:1*Ak89eKZ[$6UH6+<VdL+<VdL+<VdL+<X)q+<VdL+<VdL
+<VdL+>YmlYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHWEas36EclFG+<VdL+<WX)
1,0nJ/kms'+<VdL+>Z&81a#(:9eKZn+<VdL/MJe30H_J\+<VdL+<Vd]0fh!E+@.VS/mJhm+<VdL
+<VdL+<VdL+<VdL+AP?J+<VdL+<VdL+<VdL2Dr@U+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%
<t,KG$6UHWDKK<-ATJt:+<VdL+<WC"1cQUD/kms'+<VdL+>l2;3$:L>9eKZn+<VdL0J5@>+<VdL
+<VdL+<Vd]0KLmI+@.VS/mJhm+<VdL+<VdL+<VdL+<VdL+B(]O+<VdL+<VdL+<VdL0fd+T+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve*<t,KG$6UHlAS5Eo+<VdL+<VdL+<WBm3\rZ::bGHp>Tb.3
+?2D91a#(:9eKZn+<VdL+<VdL+<VdL+<VdL+<Vda3\i]<:bGHp>R_#_+<VdL+<VdL+<VdL+<VdL
:.69J+<VdL+<VdL+<Vdd28ZR?+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XE\%144#/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:18<[B45mrDf/o\FCB32?Z^O71,Vg8G$e0i@<,^MD[B0IG$e0i@<,^M@;TQ^6=G.N
EaM4GF(o9)@<?4%D@''HD.R'CFEq_ACi<s3#uaA\#t/?7Ch[cqFD5Z2$!(nOB4"DBFpV&XAn?!o
DI[7!%14cq:iC/YEbTS$cESKlEcYZ#+AHQfDfTQ5$$9il+E278AKWCBFCB2=#r=:r#u2U&3Pr!,
1+k78$!TAp>;eBF%14fr6#:LRATD4$H3qm%+@0mUEc5f+A79$UFD,5.BQ%p4ALDOADII^"C^DmT
3!i>&1-*4U#r4+e2@3SI?!B<p%14is6#LIH@0t5a+Ac`iASu3lBlaSjDeX*#A0>buD.P7@,&h46
ASu4,+C]&*A0N.1DBM5c@:Eq\#r=Fq#u_s'1;^7%1+k@A$!TAp>;7g;%14lt;e'KPA79KbcESKZ
@<6L(DfB9%@:]aeBOr;qEb/[#F<DuMAfsHLF)u&6E+N`l.1%df0F:Js2)`=U#r4+g2$mJH?!B$<
>n%,t#t/KHBOkNXcE\Q[ATVVmFD,5.F(Jj"DIal%Ec5S5-q8,l@;KUcF`\aM@<3Q0DI[6#FD,5.
Anc:,F=@MP1cYk@+>GjmYR*';0Jj)?3*f`C10k=r2$lQYBOu4%@<)\"YolJUBk1XiBaJ?gA0>f&
+EV:.+ED1>ATAnA7<3*Q@;^4/.1%dd2@3;)2)iCV#r!th0F:rC?!B$>>n%-!#tSKA@;H7qYol>Q
Bk;C#EsZH$Cht\9Ec6/>+DbJ'@L4hG3!i>&1,HeO#r4+e0F:rC?!B$?>n%-"#si'0D..GkcF=uc
EbT&mDJ9DcDJsW1ATAo*DfT\;De:+X@q]FoDIIPl1GLco;]mnN_QX>&/i!`;3*f`C2-gXu3!i;j
DJN[$$-odu6Y1@R$#X[&AKWC>Afu2/AKZ21@;KL(#r=:n#u2Ts1r?I'1+kEj><#nm0fE;H$98De
Bl[foCC/:k+AcWiF(K%lASbgoG9Cg9+EV:.+AclcBjkO`EsXWV3=/G'2))nO#r+%l1'q/E?!B$B
>n%,q0F:$]A7]4YEa`hlcESKk@<HU)$"e*lCi=N/EZccKAfu2/AKXfcASGR`ATK:,1-%&q:*;8L
_QX>#/iY^2$!TAp>;8*C%14gE#uYJMAS_[uZ62q`Bl@m'EsZGsDfd*MCh74#+D,P1F<GL6+A[#l
Df.!11,q#q;]mbR_QX>#/ho*f><#nm0f`MK$8F:B6XaqFCi!MdcESKXF`M2/@:]a]BlnH5AKZ&-
AM%P5@<;f23&(_7+>c!nYR*!92_bVC3*f`D0O5+p0f',&ASc0kFE2)?$-ok":NC/fDJ=.uAn>gf
Ch4`5@<-C&DfQ.>2`V1>+>>^jYR*$:2Db_E3*f`D0jP4q0f02*Ci3['BF2ti+B2clEbPhuDIjr"
F`__>DJ()9Bln#2FD,5.BQ%p/EsXT\3=/G'1-*4U#r+%j3!ieK?!B'>>n%,q2$lQbDJ<oqD$eLq
+A[#lDf091$$13/Bl7Q+De:,2ARTUqEsXT\2@3;)0JUGK#r+%k0F:rC?!B'?>n%,q2@2]]FCf9$
AT`'*$-odu:NC/fDJ=.uFD,5.BOPdh+E(j7@;IMf@<Hn7JKQ@T/nHXX:NC/fDCGlI2_bV6+>>ak
YR*!92)knH3*f`D1gLOt0fKD+@;^"&F`Rl7YolDBEbTE"AI2j\FEo!IAftN"@qfLlF<F"bH#Rj3
1,^rq;]mqR_QX@+LlsGE2_k\D3*f`D2-gXu0fTJ<Bl[p1Es^-s+@BRTBlbCk@;9_$BlaT&BOr<-
@rHBtBPD?s+E)./+=M2IE-5u*Ebp"P+EV:.+CoD'+EMX5E[_;M2)ttA+>GglYR0<FOteRG2[N\J
?!B'B>n%,q3=.u^BOPpi$-oq$6XakHF!+1cC2\-,EsZr%AKZ/1EbB*(.!$gD1,Urr;]mhU_QX>$
/i>?i><#nm1,iJJ$8O:A:i^JaH#IR,cESKZ@;]e#+AHQfDfTQ5$"@IXDfTD3FD,5.A8c*'-us$C
Bl7Q+@V'.iEb-A8BOr;sDeC26FCB2@+B)upBm"JG#r4=p#u2Ts28ZR(0J5.<$!TAp>;A0D%14jF
#uGPVCist/cE\Q_ASl.!DfTu;$!Ln_F!i)KFD,6++EVgADBO"=DBL>p@<6O/E\&?YYolPJD(HfD
F!,R<AKYT!EcZ=FFE_G:.1%ad1^Qo"1-!.T#r+%e2$mJH?!B'E>n%,r1'p6iBlA"ucF#AL6Xb"L
DII)_@rH(!ARlp$@;TQ^1,C`n;]mqX_QX>%/i3l=3*f`E0O5+p1,B58F_G2tC^JD!+BE&iDfTu;
$$0cuEcbl1ARloqDfT\;De:+XC`lZ!BOPUk/0JkKAKX9Z@:Eq\+DtV)AKYT'EZd_XDJsK:EsXTW
1C6u&1c*"Q#r4+g1C78F?!B*>>n%,r1^Qlj@;p$k@qfIrEs^-t+@BRXBl7?j$#t*%ATT&5EZfFF
Bl%T.G@>T)EcVOB1,9/7+?)!kYR*$:2_YPB3*f`E10k=r1,TA(CiF&rEb#L%YolS_A9)*i$$1$$
Blmd(Gp%0M@<*K/Afu2/AKZ&*Ec>T-F9s]W3!iM+0KI"S#r4+e0F:rC?!B*@>n%,r2@38mB6A$5
Es^-s+A??bDJ=.uFD,5.E,oZ1@q>s%0K9A6+>GXgYR*$:1GoJC3*f`E1gLOt1,fM-F^f#q$-oe1
+B<H'@:^QU@;9_$BlaT&BOr;qARTU,F!+q#@quB*3A_%;+>u!lYR*$:3&_.J3*f`E2-gXu1,oS.
ASu'gDerhgcE\QdAT)I#EsZqsBl"o1Afu2/AKYf'Df,k93&:k9+>GajYR*';0f02@3*f`E2I-b!
1-#Y2Bk;0jBF2tj+@C'fG%h8'BkM+$+EqO;B-;,)+EV:.+ECn6ASqf/2`:t@+>GglYR*';3%tYC
3*f`E2dHk"1GB,$@rc^:$-oe1+@C0l@qfuj@rH(!ARloqEc5e;6=G.NEZf7.D.O#.2`(h>+>u$m
YR*$:1b]5?3*f`E3*ct#1GK2+@:O>#GR;[%+@C0l@qfuj@rH(!ARloqEc5e;6=G.NEZf7.D.O#.
2_k\<+>l*pYR*$:2DYYD3*f`E3F*($1GT8&Ch[g0BF2tl+B<H'@:^QU@;9_$BlaShDJsW1ATAo*
DfT\;De:+Z@;odoCgdW)2E(q;+>l'oYR*$:2`:tH3*f`F0O5+p1G]>9E+rfj$-odu<bZSeBl7X+
$$9il+D"u%+E(j7@rHC*#r+:t#u_s$0uC.$0eP.:$!TAp>;S'?%14mJ#siBC@;06YcF4orEcYZ#
+AH9ZDfTQ5$#F0]A7]d(De:,6BOr;s@<H3rFCfK6+E(j7FD,5.@VKCo#r+:n#u2U"3Pr!,0ePFC
$!TAp>;S*@%14mK#tSK8@<)\"Z62MGDKK<0EbPhrAS3-(Afu2/AKYJoDKK<0EX=HW3=/V,2DE"P
#r!ti0F:rC?!B-A>n%,s2@3)hDJNg$F:$7&+@B^XFCB<4BaJioDfol,ATAo3Afu2/AKYJoDKK<0
EX=HW3=/V,1H*+S#r4+e2@3SI?!B-B>n%,s3!iJsB5)0)94`!_@<HU5Es^-s0d&hpDKK<0EbPhl
Df9_?De:,6BOr;rASuTuF`IdC1b]57+>tskYR0<FOt\LB0aV&D?!B-C>n%,s2[Mcj@ruj6F`Rl7
YolAODff]7$$9il+C\njE[PoNB6@X'A-jtI2@3,$0fd+T$0$c(0J5%9$!TAp>;S6D%14mO$!MI\
ASu'qB4Yt'@VH.oYol_S@WGmg$$1$-FD,6+DBNG*@<WhBDe:,6BOr<-@rHC,Bl@l<#r+4q#u_s$
2Su[)1G1FB$!TAp>;S9E%14pG#to2HBOP?VcE\QmEcYZ#+AHQfDfTQ5$$0cuEcbl1ARloqDfT\;
De:+9DJsQ;BHVA<@<*P7-uNI1ARlp-BOu'(BlkJA@<3Q5BOQ!6+Ceh4+>G`-0H`\L+Q@p8+@/C<
1GCL3/dX6g2[N5%2`/CU#r4+e3!ieK?!B-F>n%,t0aU-^E+ifm@po\hYolDPEc5i(+@:!eARTCh
EsZGiAR]Ie+E)./+=LrA+EV:.+CfG1GA\i90etZo:*;;N_QX>%/i#6i><#nm1c\hN$8aLE6#LdQ
Eb0:ucESKj@rHC,Bk[loBm*p$+E(j79jr'`+=LrA+Cf>+DfR950ekHj;]mhR_QX>$/hf9l><#nm
2)&;F$8aOF6$.-]@0t5a+B3Aq@;]_#ChY"XF`VYF@;KY!$"ImfDIm?$Ao_g,+@9L^ATAo2@;TQ^
0ebQn;]mtY_QX>$/ibZn><#nm2)/AG$8aRG;dj-LCC/:q+AZriBm!p!BaJil@rH6q+EqO;DImi2
DfQt1Df0Q;ATD^0#r++i#u_s$2Su[)1+kC>$!TAp>;\0A%14pL#ubMGF_kImcFY2t@rHC,Bk[l`
De!QoA1_qC+E1b0F<GL6+EV:.+EM%2Ec>`2DC9KJFCAm"#r"@u#u_s&2o;d*0eP@>$!TAp>;\3B
%14pM#uY2Q@;KUcB6@blcESKfE+is.@q]Q_BOtU_+E(j7FD,5.F(KB2ASuT4@q]:kD.R_o0KD#t
:*;8I_QX>%/ho$d><#nm2)JSJ$8a[J7;R'SDJ<tpcEeW]Ea`HrDJ=.uBOtU_+E(j7FD,5.A9)*k
Df,k83ACh8+>kmjYR*';1,B5@3*f`G2-gXu1cPe7@<HW66$76jEa`cuEs^."+B)]]BlnH*EbT4o
F)Q2CBOu4%+E1b0F<GL6+EV:.+C]85+=M/?+B)]]BlnH*EbTZ;.1%[f1^R)'1GltQ#r+%l0F:rC
?!B0E>n%,t3=/_tB42+lYol_cEa`McFD,5.AmoLlBl7Q+ART4fAKYo3+EhmDFEMV8#r"=n#u2U!
3Pr!,0J5%8$!TAp>;\?F%14sH#u5V\CM=+$K-4*$B5)I0@<-'r$"ImkF*(u0CghF"Df-\9Afu2/
AKYZ)Cj@.5BlnVC-q//jA9B=-0K1lr;]mhR_QX>%/hf0i><#nm2)nkN$8jOE6#:XOBlXO*Yol>P
F_PZ#AI2sbH"h//+D"toCh4`-EZfOJCijf?AI1%K1C6f!0KI"S#r!tj2[N\J?!B0H>n%,u1'pcg
@:O4cCC/:k+AcKiDf091#t&WFDIm?$Ao_g,+EV:.+@U0\Ch[s(+DtV)AKYo'+EV:.+Cf>-F*(u0
CghF"Df,k82)GV<+>l*pYR*$:3AChE3*f`H0O5+p2)>P,ASu'g$-odu6[<<^BaJliBl"o1Afu2/
AKYYtD@&!S0F:Js1c<.S#r+%f2$mJH?!B3A>n%,u1^QTgBk@[s[3/:WB45jq$#X[&AKYo'+EV:.
+D>\6F(GY31GfD5+>GReYR*';1b]5?3*f`H10k=r2)P\+Ci3ZqEXC$r+@gHpBlaSiEbT0"F<GL>
AKWC>Afu2/AKZ&4F`_;.Ec*"3Bldr8F!,R5Bl#4)0JYTo;]mnU_QX>$/iPTn><#nm2D\VJ$8j^J
7W3-PChR7"F:$6t+Accn@qg!,6$76jEbTE*$#OU'FD)e8Afu2/AKZ&4F`_;.Ec*"3Bldqo0JPHl
;]mkM_QX>$/ho6j><#nm2De\K$8jaK9jr'X@:BPgYolkSB45jq$$0NcA8Gg"-uW]?:h=9JF*2OQ
#r"(j#u2Tt28ZR(1+kCD$!TAp>;e?E%15p-;cI+EBldj,ATT[^:-pR0:K(5"EbTT+F(KG9E,Tf>
+E2@>@qB_&DfRHQ%13OOF)>i<FDuAE+A#$g6Ua.!+=Jod3Zp+*%15is/g)Q_Bldj,ATT@DBl8$(
Eb8`iAKZ28Eb$S>.68S,0JYF<1GUt*1,:UF2)P_967sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+DG8,?Z^3s@<it<:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%
%15is/g+tK@:XG$@<-E3+AP6U+Dbt)A9/l6Bldj,ATT&9FCB24A79Rg%15is/g,1KF(KE(F<D\K
+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcVZs.1HUn$;No?+EMC<F`_SFF<Dr+
67sC(D.G[M-Qjr_/13,&E'-3)5&i\H+?hJ10IItk3$C=<.3MYc6um!_ATMF)%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`Bl8!'Ec`EH-ZWpBATMF)-OgCl$;No?+D>J%BHV87Bl8#8E,oN"Ble!,D@Hq$
3?^F<0e"5"2@U!&$;No?+EV19F<GXH@<-Du$;No?+EMC<F`_SFF<GC<@:XG$@<-E30F\@tFCB&B
?Y+IlASb^qG]Y\u=UA1:=YEk`=>*e`5u^-F-s83*.1%1a<'a87-s8*'.3]'B5u^-F1+66U=XbO$
5u^-F-s/-*.1HV<#quZ16qLE40Hg`I6qLE40Hg`I6qLE40Hg`I6qLE40Hg`I6qLE40Hg`I6qLE4
0Hgl4/MRPd#q[k</MRP`1c5Ro1GoIj1c5Rk1c5^L0aTEd#q[k</MRP`1c5Rk1c5Ro1GoIj1c5^L
/MRP`0aTQ@0aTZo#q[kf2$kih1GoIq2%9mI#r)`@#r)`C2$l)s#rFLG1c5^L0F9Hn#quZ16qLE4
0Hg`V#rs[G0F8sl8QIJu+Unc5#r+@F0J5%:3&iZL2)7/u0fKCp/i,CD1c@$G2DYY!2D-mD1GpsK
1GfCo/i,CD1c@$G2DYY!2D-mD1GpsK1GfOJ1'oZn#r!td1,T@t#raIk1,Ua?2D[0M#rj[m3&`ZS
3&<HM#raIk1,Ua?2D[0M#rj[m3&`ZS3&<HM%14lt0f97k/i!_j#r+.e1GCgL1GUdG#ragr2E<HF
2E*KL#r+.e1GCgL1GUdG#ragr2E<HF2E*KL%14ou0f01j/i#CD2_d-E3&V(!/i<qi2(gmG2)@6M
3=.W$/hf.>2D?sB#r+:i3A`TL3Aif'2`*-@2)I3F1bfFH2$kun#r!tf3&ENJ2)@3L#r4+k#r44f
0JbXF0ek@<#rXaq3ArWL3&ioW#r44f0JbXF0ek@<#rXaq3ArWL3&ioW%15!"0es%h/i<qj#r4Ck
2)[<G2)-gF#rXRl1c$sK1cRHM#r4Ck2)[<G2)-gF#rXRl1c$sK1cRHM%15$#0eitg/iGLD1H%$I
1H#Oo/i>RB1bq$J2_bUp1+kCB0ek[D1-#Xu2_HsC3&iTN2_bUp1+kCB0ek[D1-#Xu2_HsC3&iTN
2_baK3!h;n#r!tk#r+%f2$l&u/iGRI3&!<I2$l,p/i,=<0f^sI2$l&u/iGRI3&!<I2$l,p/i,=<
0f^sI2%9mQ#rr;H#r)`C2$l)s#rFLG1c5^L0e`nn#r+%f2$krh3!hGs/i,=<0f^sI2$l&u/iGRI
3&!<I2$l,p/i,=<0f^sI2$l&u/iGRI3&!<I2%9mI0aTcF0eP=B0f1XF2)d5r0J57>2D[6I2D[5t
2)d-F1,q6I2`EGt1GUR>2_d$I1,:ir2)d-F1,q6I2`EGt1GUR>2_d$I1,:j!$8F:B2@2,F0J53h
2DZsB1Gh*K3&iZ"1,^aB2Dm0G0ekWo2DZsB1Gh*K3&iZ"1,^aB2Dm0G0ekWs$8F=C2$l#j2@2&i
1H73L0f:aH2$l0#/ibgF1cRHT2[M5o/hf(?2)-g>1C5s!/ibgF1cRHT2[M5o/hf(?2)-g>1CX[G
1^PuF1G1Nk0J5+?2)d6H1,q/u2`*-@2)I3F1bf:k2(gmG2)@6M3=.W$/hf.>2D?sB#r+:i3A`TL
3Aif+$8FCE1C5oF0J5*e2`NEJ3A<-F2`3At0ek::0KD-L1,Lor2`NEJ3A<-F2`3At0ek::0KD-L
1,Lp!$8FFF1'ooH0J5(82$l5t/iYdH3B/fQ2$l2o0etU?0fCgE3=.Z#/iYdH3B/fQ2$l2o0etU?
0fCgE3=Q<M2[M2F0fKCm/hf.B3&39I1-#Y#2D-mD1GpsK1GfCo/i,CD1c@$G2DYY!2D-mD1GpsK
1GfCo/i,CD1c@$G2DYdL0fTIn#pVi0<\H-M#quZ16qLE40Hg`V#rs[G0F\@C#q[nf#quZ16qLE4
0Hg`V#q\.k#r+Cn#pVi0<\H-M%14[A#q[ne#r!tc1cI<I3A<9L#r44A1+kL@2D['A3B8o&/NGR=
2_m9I0ebUJ#q[kj2_HjE1H%3Q#rjjr1,h!I3&rZI%14[B#q[nd#r!td#r++?2(ggB0JtjH0f(`p
/NG[@2_d!D3AWBH#q[kj1bLOC3A`EJ3=.Z%/i#CH1b^gI2@U!F1C5Wf3=.Al0f:mL3A`ZN2[MAp
1G^gC1G^gC1C6#n3B&]O1,_$F2$kip3%d3M1,^mG2DGLi0fLg>0JYRC2`!8s3&*$>1,h!J1G_$#
$8"(@/MT3k0J5+91,:U?1,:Tk1bLWl0et@=1,q6I2`EGt/MSq7/i>CD3&!9M#q[ki2_HpG0ek[D
1C6!!/i5LA0f_!E3=Q<I2$kih2[M/j1-%0G0fM!I2[M8m1^Plp/i,II2)I!C1C5Wf0K(O>3&riQ
0Ja"e0fCg?2DHmB2*!T%2`!'E0ebFA3Arf*$8".B/MT-i0J5.?2$l#j2E!HO2E!HO2[M5n/i>LE
0JkXB1'oNe0eb4;2)[-F2)5Ii0f:sD1c.!K2)I9!2E<BH1c%-L1cIB'$8"1C/MT*h0J51?2E!HO
2E!K#1+k:<1,q-M0f1Zm1,U[<0fD!O1Gh&t/MSt;/hf"<3&rcP#q[kh1bLdJ1GLRA2$l/t/ibmI
0ebLC1(=RB3!h/k1^Pig2)d6H1,q-M0aTQe2`1ms3A*6I1cRHL1C5Wf0f^jF1c.0O0f'+f0f:X;
1,UpD0fV)u2D?a=2)R*C3&_9R/NF+h0f'+i/iG^F1GCaG3ALmq/i5CA1c.$G1c,Lp1bL[H2)-sE
2)>Oj0etR<2E<WL2)@)r/MT(>/i,1<3&ENN#rORm1GCXF1c@0L%14[A0F9<c1'oWe3&<?H1G^gC
1C5cg1'o`s/iYOB2)d6D3=.8l1-$sH0Jt^H0eitd0f1R:0f_'I1,q9#2)$X;3A`QJ3&r]&$8!te
#q[kd#r)`@#rFLG/MT%=#q[kf2$l)s%14[A1'oNe0F9Hd1'oWe3&<?H1G^gC1C5om/ho@C1bq$N
0aTEd1b^O:3A`QJ3&q9s0etaA3&!3I2_d#n1H@'I0Jt^H0ebTs$8!tg#q\.D0eP:>1c.$G1c.#q
0J57D1,CUC2E<N!2)R!B0JkaG2Dd?!/MT(>/i,1<3&ENN#q[ke1bL[H2)-sE2$l&q/iG^I0f:aE
1CX[C0f01g3!h;l2`1mq/i>RB1bq$J2_bUs0J5+<2)-gF2[M&j2)$X<2)R*C3&_-q0ek[@2`*?N
3&*2q1-$sG1c.0O0f'7G/MT*h/N3tk/ho1<3&NWL1c#Fl/i5IE2E!HO2E(q#1bLdJ1GLRA2)5Ii
0f:d?3B/fL0K(cp/MSt;/hf"<3&rcP#r4@j0JPIF3AWKO%14[A2@1rn#r4+k2E!HO2E!HP#r!tf
2`1n"3A*-F1H@<L2`M*q0f:sD1c.!K2)I9!/MSt6/i>LE0JkXB#r41e2)R9G1c7$D%14[A2[M&n
#r=1j#r!te3A`HF2`<KO#raXm2DHmB2*!QR#q[ki1G1R?0JkXI2[M&j0K(O>3&riQ0Ja"i2D-dF
3AiWI1G]II/MT3k/Mmbj/i<qh/i#1;1,:U?1,9.p2_HpG0ek[D1-#Xm0fCsC1cI-D3ANAs/MSq7
/i>CD3&!9M#r+1f2)7-N0K1pF%14[A3=.8n#rXCl1G^gC1G^gC#r!td2)dKT1cI3L#rjXl0JYRC
2`!6M#q[kj0eP.82`!BK1^P`o3%d3M1,^mG2DGLt/ibjG2DR0K0f9CI/M]!d/M[Ve0F9Ec0aTfr
/i#CH1b^gI2@1ri2`*-B3&rfL2E;'q3AiEJ0ebIF1GL]m2(ggB0JtjH0f(`t$8""f#q[k<1,0(h
/hf+@2DI3G1cPe$2_HjE1H%3Q0JNkc0fM$D1,h!I3&q9s3AN3G1,^pC0KD-"1+kL@2D['A3B8o*
$8""g#quZ16qLE40Hg`V#pVi0<\H-M#r+Cn#q\.k#queq0F9<c3!h8F,=G+(0/+OU0F9<k0F9Hn
0F8sl8QIJu+Unc5#q[kj#q[h`0JtgL1,CdC3=.8l2[M&l/i,CD1c@$G2DYXk3&WBI1G^mE3AWJu
0fM!C2D[-H1H@5t/N>X@2D[-H1H@6J%14is/MT-i/MJe31,T@i3!h/q/ho+=0JPIA1cYjo3&3*G
2`*NS1H%)s0fLj?3&`ZS3&<K"/N>L<3&`ZS3&<HM%14lt/MT*h/MJe4#q\"@/MSt41GCgL1GUdG
#q\(q/iG^D0K(jI1C5co3%d*L0JGCD2$kin3%d*L0JGCD2)>[K1^P`g1^P`f/i#CD2_d-E3&V'p
1G1Nk/MT+83A`TL3Aif'/N5L=0Jt[F0JkKj0fCj@0Jt[F0JkKj/N5L=0Jt[F0JkKn$8i,A0f'+f
0J5.@1c@'G1H75u/M\q:#q[ne/hf(?2)-g>1C5Wk3%d3L1,LsM3B%7!2)m3K2DR*K3=.8q3%d3L
1,LsM3B%BS2@1ri1'oNd/i<qe1'oNf2D-jF2)$mB0fTIk2DZsB1Gh*K3&iZ"0f:a>1c$sK1cRH$
/N,C;1c$sK1cRHM%15$#/MSsd/MJe81H%$I1H%$I#q[ka2)d6H1,q-M0aTEf1+kCB0ek[D1-#Xm
2)d-F1,q6I2`EGt0f1gA2)7-N0K1os/N#I>2)7-N0K1pF%15'$/MSpc/MJe:#q[ka1,T@i1H7!F
2*!WM3&3>t/N#781Ggd?3AEHM#r+7k/i,=<0f^sI#q\"h/i,=<0f^sI2%9mQ#q\.D/MRP`0aTEg
2$kik2$kun2$kik2%9mI0F9<j#q[ka1,T@i0J5<k/N#781Ggd?3AEHM#q[qm/iGRI3&!<I2$kum
3%d*H3B/]P1C5Wh3%d*H3B/]P1,TLJ0eitd2[M&j/i>RB1bq$J2_bUj0J57>2D[6I2D[5t/N#I>
2)7-N0K1pF#q[qg/i5LA0f_!E3=.Dq1+kCB0ek[D1C5Wh1+kCB0ek[D1-#dN0es%e2@1rj#q[h`
2$kim1G1L?1c[BP3&1dl1,^aB2Dm0G0ekWo0ekR=2)[<G2)-im/M]4:2)[<G2)-gF%14gG#q\"@
/M\q:#q[h`1H73L0f:aH2$kim3%d3L1,LsM3B%6r1,1C81H.0G0ebBi0ekC80JbXF0eitd1,1C8
1H.0G0ebBm$8F@D/Mmbc1G1Nk/MJe43&NWL1bq$K#q\(m/hf.>2D?sB#q[kh/ibaG1H@<Q#r++k
/ibaG1H@<Q#q[kh/ibaG1H@<Q%14gI#q[q>/N!hd0J5*e/N5XA2E<HF2E*KL#q[kd/i,1A3AWEI
2[M2m0eP793B8lN2$kih0eP793B8lN1cGjN0fB=i1'oNl#q[h`0etTm/N>L<3&`ZS3&<HM#q\(g
0etU?0fCgE3=.])/ho+=0JPIA2$kin/ho+=0JPIA1cZ!P0fKCj0aTEd2[M&i/hf.B3&39I1-#Xm
3&WBI1G^mE3AWJu/Mf"82E!BM0K(gF#rsdo1H%-J2D@$I#q[qc1H%-J2D@$I1CX[G3!h8F,=G+(
0/+OU0F8sl8QIJu+UKh/3A:an%14cq0fTIn#pVi0<\H-M#quZG0F9E>,=G+(0/+OY$8!t=0fKCj
0J5%:3&iZL2)7/u/MT0j/Mf"82E!BM0K(gF#rsdo1H%-J2D@$I#q[qc1H%-J2D@$I1C5Wm2D-mD
1GpsK1GfOJ/M[Ve2@1rh/ho+=#q\+C/N5::1,Ua?2D[0M#rsps0etU?0fCgF#q\(g0etU?0fCgE
3=.8s1+kOF1c[NO2DkpN/Md\f2$kig/i!_b2$kih0eP793B8lN1cG^q0JP190KD-L1,T@i0ek::
0KD-L1,Lor/N5XA2E<HF2E*KL%14[D#r+7C/MJe43&NWL1bq$K#q[qc2$kih2(gmG2)@6M3=.Do
2(gmG2)@6M3=.8l2(gmG2)@6M3=.8r1bLI>1c@$E0b"IA2$kun#q[h`1H73L0f:aH2$kii/iF"f
1,1C81H.0G0ebBi0ekC80JbXF0eitd1,1C81H.0G0ebBi/N,R@3ArWL3&ioW%14[F#r+1A/MJe7
#q[n=/M]4:2)[<G2)-gF#r+.m/i>OE0JtR?#q[nj/i>OE0JtR>3!h/p1G1L?1c[BP3&1pM/N3tj
0aTEc/iGLD1H%$I1H#Ok0eP=B0f1XF2)d5r/Mf.71cI-D3AN?M#r+1j/i5LA0f_!F#q[qg/i5LA
0f_!E3=.8p2_HsC3&iTN2_baK/N=%k0F9<b/iX.h0eP4=#q[qm/iGRI3&!<I2$kum3%d*H3B/]P
1C5Wh3%d*H3B/]P1,T@i2)-^>1b^XE0fLs!$8"7E3=.8l#q[k</Mo<k0f(Zn/Mo<k/Mo<o$8!td
#ri5C0eP4=#q[h`3!h/o0eP7=0JPRB2`1mr1bgU=1b^XE0fKCj2)-^>1b^XE0fLrr/Mf@=2DmKS
0K:gF%14[A0aTcF/MSk82_d-E3&NWL#q[h`2D[6I2D[6I2@1rm2_HsC3&iTN2_bUn1cI$E1,q6I
2`D$p2)d-F1,q6I2`EGt/Mf.71cI-D3AN?M%14[A1'oiF/M[Va0J53h/N,C;1c$sK1cRHM#r+:n
/i5@@3A`]T#q\%k/i5@@3A`]T1'oNf2D-jF2)$mB0fTUL/MT$f2$kii/iF"f0J5.@1c@'G1H75u
/N,R@3ArWL3&ioW#r+:s/ibgF1cRK%/N,R@3ArWL3&ioW#q[ne/hf(?2)-g>1CX[C0f01n#q[qc
2$kig/i#CD2_d-E3&V'p2`*-@2)I3F1bf:k2Dd$?2)I3F1bf:g2`*-@2)I3F1bf:g0f:RD1c7'L
2)u*Q/MT*h1C5Wj#q[h`1'oNk3%d*L0JGCD2)>On2E3<I3A<-F2`1mn2`NEJ3A<-F2`3At/MSt4
1GCgL1GUdG%14[A2@2,F/N=%g0J5(82$kio1+kOF1c[NO2Dkdq2_m!F2`*NS1H,Ul3&3*G2`*NS
1H%)s/N5::1,Ua?2D[0M%14[A2[M2F/MT0j/MJe22)mQN1GppJ#q\+p/iGLA2)@6K1^Plq2D-mD
1GpsK1C5Wm2D-mD1GpsK1GfCi1G1IA2Dd<G2E!?#$8!tl#quZ16qLE40Hg`V#pVi0<\H-M#r+Cn
#q\.k#queqBjl-kDIIBnA7'D"@<-Er1,(I=?Z^O71,\O4^I^^k?VY$HALp5\F(o9)@<?4%DCe=M
:b4qAH"D#':18!N/5C%5=%#to8h="[@:q,h6!m5>0JG136tKk88hr(S0J$"?BkM-t/5pJ0EarZ3
8OP*sDf0W</4FZ+D/X6/B6diZDffP"$:/-BDesQ<DJq(.:G"FT=ALM+/70MnH#>0?/70q_1+k:;
/28k;/iPLC2)$p>1H@'A3A`TP1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#>0#H=^T"+AuciF^f0$
@j#`2DfBW9@;J"k@WQI(F`_M>+DGm>@3B/r@ruF'DII?(D/"$!@s)U+F`S[HF^fE6@;]Rd+DG^9
FD,5.F(8o9An`B*Dg#].+B39&_kD*g@3BGr+CS`#DesQ<DJpXG<+ohc7U]eKDfU+GAoD]4FD,5.
6"4nRCisi2.3N)F+DG_*Cis<,FD50"+@CHd@q[!/EbTW,EZe"`Eb0&0`/J,DASWn-$:/01D..H9
85^Qi3B&KD1H73M/C(a[+@U<b/3tg@1,V$I/Mo.93%Qg;3&iHG1bLXD2)?sA/1i\4/i,1<2E*BB
/1f)V0e>b6Be0]#6"=S>Ec,<+/4`Y]1cI0@2`3QS/C(LC7<3)n5qFT=0J51>/2B%71bq$J1,CI5
2)d-C1H%0L1Fth4@:Eq\/1f)O/4FSn/6$:o+DtV)AKZ2*F!,CABkM-t@;Kb*+@1$V@VK=5+P<F@
Y1U!%fVdDUfnS18fWcRA^;PT]\s@&N+CT.>DII4!+=JUXBm+'.-Z^DADIb+D/e&.R@q]RsA1U8L
+>PZ3/2K7@0eCVZ+@BRY/3tg@0JkdE.lB7B3@ls=1c?m>1+k=@2DR!C/2]@=3&*9F3&`B>/C(^U
6Xb$e,%bP0F*&O5E,]W-ARlp*D]m?7+@BRYF(oQ3ASGRa+DG^9FD,5.;eofXDIIWu+AclcF)N0e
FDPB,+E(j7FD,5.87c4QASuQ3E-5W+Blds!A0>T(+>Gl60J">UF`\a?F!,@=F<G@:Dg-(AE,oZ2
EZfIB+EV:*F=naH$:/0B@:CcY;BRhW3&E0F3&iZI/C(OU+B)cg/4!\q0fC^C1bCFB1cR$A/i>O<
1,L^<1Gq0K0JG%00f^jG0Jt[E1Fth4@:Eq\/1f)P0e?75D_*)SBOr<.Ea`KmFD5Z2@;I'(@;TQu
De:,6BOr=3Z63(UDfTf2BcqJBF*(u1+D>2)+C\nnDBNt2DId=!ARloLCN<im+CT.u+@U*TCN<im
/0JJ7EbT].A0<::Bkq9&6"=qD@OWF3Ec5e;6#pCCBk'1HfVdDUfX][efWj)-+CT(<b.hA)Ea`E"
-ms+MAKZ&(DfTf2Df-pO/g:`36"=qXGUuB`+>c#50J#+92_d9CcESKZEcip!@4X,g1,_$B2D[$F
/28b51Ft7?2D-mE3Ai]N/1ib9/hf:G0KCp?6#C1RBk(RhBle,B/C(LO6ZR<#,%2U2De*F"DBNG-
DKKo-@ruF'DBNk0+EV:.+@9L^ATAo(ATMQuDIIX$Df.*K@rH(!ARlotDBO%7AKW]fFD)e,ASuU4
Ed92Y@Wcc8GA(]#BHUl(FCfK(A0>T(FDi:3Df'?0DBO(CAKYo/Cj@.4Gp%3BAKYi(A1]PjFD)e,
ASuU4Ed8cU4<VqS+@C0l@qg!5+q4lF@s)6lDK@@";BRbQ2_lp@1b^gG/C(LC6Z-Bb6");u3&NZQ
.krb90e>.61,^[<1Gg^B1,1^E0J"q5/iY^I2E3WH6#pCCBk&\FcESofDIY4sBOr<(@;TQuG@>P8
DfTQ)Bl7?qCj@-hEa`Ek@lbabVqHaUZIl,.VqHgXM'-5Q/UDPK`.;gDTcba2FD,5.@r,RtF!iCh
%15C3BOPLaEa^Li;BReM1GLF<0JbLB/C([H9P&,n6")<!0JPIE.l&n92(UO91c$[;2)Hp?2_m6K
2_6^?/i5:A1GLX96#pCCBk&\FcF,8tAT'+D6#:U\+CehrCh7-"6#:(F@:j(k@4i[%BOr<(@;TQu
BlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbabVqHaU[b65bMV,2dW?>X.\;`*!\;ap/`2doe+=JUZ
BOr;qEa`Zm+=M/K+CfP7Cb-]IEZfFFEa`ir.466BDe:,6BOr<&Bl@l:F!,=.DIm*&/g:`36"FY;
Ea^Li;BR_Q0fU^?1Gq*O/C(XG6VUu?5qF]J2)mKG1,q-N/28b70J"q41bL[D2Dd9I/1iV:/ibjG
0K:sA6#pCCBk&\FcF#2j9joRs<+ohcDIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1HfX]Y=
fVdB,fngio^L?*2O2QTi_kA2$-['3EB5)7)-RgYj8T#YmBOr;R@;KLmA79LmF_r7>AfsBU+@0LN
F('-(+@0fd9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq9UY1IVKHSpFfnA"gfWa#+fWj+e+NhE,
GB[b;+CT(<b.hBD\<"RZEbTfE/0K%T@;^.&@<?'k+DG_8D]h_^FD5V8@<3PfEbTB!+BE2sB5)7+
D'15SAnc:,F<Ga@EbB*(-RgYl%15C3BPD9685^Qd3A<!B1bg^9cFtDeDIb:M/1iD0/iYd@1,(=<
3&NBL0J#%</i>CD2`E]I6#pCCBk&\FcFthqDIb:B<+ohcDIIBn+Eq78+E):7B5)6lCi"A>6#pCC
Bk'1HfVdDUfWa%dfn:JViOFq#iOFqWH#+TOFD,5.FE1f(DCcoHBlksM-Zj$5+EV%+CaUYa+q4lF
Bl5Im;BR\N0KC[>0K;$P/C(XG<+0o#6")K!0JkOE2CgLB0ek48/i>F92E*6C2)I$G1Ft7@/ho=>
1c%!?6#pCCBk&\FcF#3&@<F,#BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbab\_2kn
L*4XR@<l`5-mrSOALAoL@;]TuG@>P8Eb0E.ATq]r+CT.u+CSf!E-,Z%+C]U=FD,5.=)W+pBl7Q+
7riNjE$0(:+B*AjEZe+cD.Rc@%15C8DII@%@;T^085^Qh0ekR;3ANNO0eCV`0d'D-E\'L-0fV$I
1+b7:1c6g@/iYa?1,q'B2)I'F0Jk=41,:I@1c.0K0J#M1@:Eq\/1f)[0e?79E\'\#Df$U_Ea`Ek
@lbab\_2knL*5-HfnA"_fVdDVfnpop^L;D*+CT:BEl<NG`2b"/-Y7R7+E(j7FD,5.@<,jkATB.I
%15C;@:WtYE\'aZ+?)&93%R'H1cR3@cF4oiH#bH%@4X,n0f(d>1H@-L/2St91Ft:@3%d$D3AiTI
/2K:=0f1aJ2_ZdKEa`Ek@k91V[k(3uE\&D6BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek
@lbabVqHaUUY**0J_74M@;IO<^3/DGP@erX+=JUZBOr<.@;Kk"F!i)7De:,6BOr<-GAhD=Bl7Q+
ART4fAR-`9+EM4)Eb/c(GA2/4+O7VB9R1YeAKWBeCghF!Amo^//g:`36#9tNBjiP`6m+3B3&`ZP
/3,C<0Jk=f+B)il/70q_3&33J/MSt;2(U[=3Ai?C2`33E2)d?I3%QX90ePIA1,_*I/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S#,eE\&D%H#Re<Dfd+@Ec5o8F(&lH+@0gPF(o&*BlbD=BOr;uBl\9:+D>J1
FDl26@ps1iGp%-=@rHBuARlp$@;TQuDe:+ZH#ReHF"AGE@<?4$B-:Yl@r!3/D]in2A1_D-AoqTq
DKKP7@qBP"F`MaM6:3@L%15C;@UX(`@;%2_;BRnR2DcsF1bggA/C/hh;eL,%5qF`N0KD*E1,1I;
/2Ah;3%QgE2_HpD0KD'H/1iV3/hf%:2DI'?6#pCCBk&\Fc[[QFB6#OI<+ohcDIIBn+DGm>DfTQ)
Bl7?qCj@.8Ec5e;6#pCCBk'1HfVdDUfVmJVfWWr,+CT(<@UX(`@3?sGFDlA@-RgYj8T#YmBOr;R
@;KLmA79LmF_r7>AfsBU+@0LNF('-(+@0fd9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq:L=qI:
Yoq\sfnA"VfnA"]fVp!2@<m-4EZee,/Ri.)A79.&+EVX4DKBW&FCeu*Bl8$2+A?3cBl5&%F!+/!
@qfI^+AZrqBk1p#-mrJEBkM+$ATMr9De:,6BOr<.Dg-(H.3]3.6#:"=ChYFk;BRnY2)$R90JYO@
3%W@_+@1!f/1iD)/2Jn;3%Qj?0ePI@3&rlW/1ik71c[EP2`3-PEa`Ek@k91V[4FU`E\(1'AKYl!
D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(QfnA"VfVdDUfXW,5Cb9,7JS]&C^E=pPFD,5.
F*D&/Ci=N/E[N:g%15C;@VKjoD_+FW+?),32_6sH3A`ZGcE]/I6[<;q6")<!3AW?J.l'%@3%Qj<
0JtC:3AN3F3&!-G0e>(=/ibdL2E<ND/1f)P0e>\;B.R"qAKZ&4F`Lu'+E(j7FD,5.DIIBn+@0gQ
Bl[d'+DGm>DJsV>ASuU(Eb0'4+Cf5!@<*t0$:/K<BPCpa/4`Y]1c@*F/2]FB3B8Y9YolDSFt>3r
/M&_20JY163&3*@0JbO>1+Y"41bL^B3&iiS/4";b@VK='/C(LO6ZR?$,"?TkD'2,b@:Eq\3[!(Q
fnA"\fVmH#fV'ErCb=VWQ>'gHJ]b\L-ms+JDKI6T/g*`'+EV:.+@BRRASu$eEbTZ5+E(j76#7Z0
@q]plF(la_C`lGjF^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+P<UFK\;(4L=iZ]Yoq\sfnA"hfWj),
fVfp$Cb9L4DW/0m@<*K!Cb<T!F`PEO@OrXDEa`j,CghEsA0>T(FDi9q@<?4$+CT=6;K$VuEcl4A
6Z7!gBcnfO@V&t`+E(j7FD,5.@rcL3-RgYl%15C;@rHB=85^Qf0K([;2Dm<M2_6pB+B;-E/43hs
0f(R@3@csD2)[!A/ibpC1,(F81GC^D0Jb7;1bLdJ2`W`P/4";b@VK='/3#=7<D?mQ7WNEa+@1$V
@VK=5+P<UFK\3H\LtJWXYomIkidd0M\s?cKGJo&Q+=JUZBOr;u@;0V$+E)./-RgYW$:/K<H#IS3
/4`Y]0ekRD/29(B0JY3)[ieXYFY#g00JbOE2(LF=0K(I;/iY^>2)['H2_d$E1+Y1;/ho%;0f(^=
/1f)U/6$&#/59\m@V'R&De:,6BOr;_Ch7<hA7]g)DfB9*+EMX5EZek.F`VY9EZcc)1c6^7+@0gR
H#IS3+=KNn@qfLlF<F(oAS#X<+Q9thcF_B5c\9](cFqN4+@0gZF`209P:7Vu@<3Q0DIjr/Afu2/
AKXfcASGR`ATJu8BleB-EcW@;DBMGiAS#X"D0^5:Des?)GqKO56#:(C@UX:cDCe=V+>G]12_6^=
1bpd:cESKk@<F+Q/2/n:2*!0A2D['=0J5=D/2fI?3B/]I2DZm=2D-j@3AW?E/4";b@VK='/C(LO
<+0o#<+ohcDIIBn+Eq78+E):7B5)6lCi"A>6#pCCBk'1HfVdDUfWWr+fWj),fnLVXA1_>#@UX;q
JSlSY-Zj$5+D,P.Ci=N/E[Mu6De:,6BOr;_Ch7<hA7]gf.1HVMCh.*t@;T^r/4`Y]3&*<H/28h9
0f_6FcESKZAT01P/2Aq73&W9F1,Cd=1+kC@/2K"@/iGOC3&icH2DQmB3&NQP1b:q5@:Eq\/1f)O
/43uf/4OYuD'2,b@:Eq\3[!(QfnA"^fWj),fXW-WVqHaVMV3^:MV3_,@H"_W/`F4#Bl_.Cb.f'-
Cb9p@D8`Jm+=JUZBOr<,BkM+$+CT;--QlW3AfsHPE+ig*F'U4I%15C;A8#Ch@:CcY;BRqT2)?d<
0K:aG2([%Z+@gHp/1iD)/2Jn40J#"83%d$I1,1dE/1iY:/i,CB3&NQE6#pCCBk&\FcEf&lEcip4
BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@/UVqHaUYh=c`W$#O-\;r6#\;t'9@:C?--Zj$5+EV%+CaU?0
De:,6BOr;rDf0W<ASc0kFD5Z2+E(j7FD,5.;f?f#BOu4%+@^'dBO*&>%15C;A8#[d@;%2_;BRkR
3ArEJ1H7BP/C([H6ul]e5qF`L0K;$B2Dm<I/2Jn52_6^A2_HgF2E!EH/2f@<2_d-I3&E0PEa`Ek
@k91V[Oage@4XlgDf$U_Ea`Ek@lbabVqHaU[b.P2VqAO&@H"_U/`F4!Bk##3b.f&I-Zj$5+D?%3
DIIT6.4u&:6#:(SCh@C!/4`Y]2`NZM/28h51bpd:cF"c_AS`nL/1iD0/hf(41GCd@1GCU?0fCR;
0eP791GUjC/4";b@VK='/C(XS6tL0c;eU)iFCf?(DJ()1AfsB[@:Eq\3[!(ZfnS.X+P<UFK\3K]
K\:q0MV3_,iOFqWDIHus@:Us#F_k[.X)9%.-Zid2C`mY.+EV:.+CoD,E+is'-RgYW$:/K?Bl[u?
85^Qi1,Cm@0ebL>1GUN,Z62MGE%F:`/2Aq83&`?H0JbO:1G1F=/2K%:/ho7@3B/rK2_ZjA2D@'E
2(V%6@:Eq\/1f)P/43uf/0[Q(Df$U_Ea`Ek@lbabVqHaVJ_76\JfnK</S8^;E?HYWFD,5.Ao)Bq
CF:P`+AQ?^AKYW"G%GP6@X0(rCisB(+@9XP+EVNEFD,5.@<6O%EbTT3+Cf>-F(o];Bl7Q+De:-;
Yq.$CZ63RnA0B1,+@B^ZBOtm1+q4lFChI<iBe2eQ+?)5:1b:@80JGCA/C(LU+@B^Z/1iD.0JPOA
/MT":1Ft=72)m-C0JkC>0f([F2CpF71+kF@1cR?J/4";b@VK='/C(LU/43ib/0[Q(Df$U_Ea`Ek
@lbabVqHaUXOs`0MBH>D/S\^)Gp"L_FD,5.-uEC/ALSa;Bk/S?/g*GrFCfK1@<?4,AKZ)8@:X(o
Bl@ltC`mV(D.Rc2@<,p%6#7Z6Bk:gh/0Il&@s)["@3A'SARoKt@;]Tu6#:1JARoKt;e9H]DId0.
+q4lFChI<sBjrVa;BRbU/28h:2_<7\+AcW^/1iD,0JP@=.krn90e>(43&<*A/i,1@3ArZE0f:R<
3&<EP1b:q5@:Eq\/1f)Q/5Tnj/4OYuD'2,b@:Eq\3[!(QfnA"ZfVdDWfVfp$Cb9D?JSo12+=JUZ
BOr;uCgh3s-RgYj6#:1FDJ<Q&BlbD*CiaM;@;^"*BOu3,DIIBn+D,P4+O757:h=ZgASE889keW[
@;@;E%15C;B5(pd@4XrI+>bc02_6g?2)mBCcEf5J9P&,n/M&V11,(C40f_*F/2Ah90e>%:1bLdK
1GL^C/29.;3&E?H3&rNUEa`Ek@k91VZS=")AT'+hEc5e;6#pCCBk'1HfVdDUfW<`(fn\4Z+CT(<
C11Rb@3?sGFD,5.AoD^$BOtU_-QlW3Afu2/AKYf'Df/i0/e&.RChI[&/4`Y]3AWQE0f1aH2D!.Z
+AcWi/4!]!/2/k63&3!@0Jtd?1+k7@/2T:<0JkO?0f:L=0J5@C2)[9N/4";b@VK='/C(OP:h=Yu
7WNEa+@1$V@VK=5+P<UFK\3BYVqHgWW$#Mb/S`4TDJ<Q&-ms+MAKYT$@;]j..4u`/ChI<sBjr3!
F!+n-F)N10DJsW1ATAo2@;TQuAoD]4cESKgATDj'BcnfuBl[foCFLkF$:/K@DfT8q/4`Y]1cI9N
/2f1B2Dm&2Zlh_VFt>p10etLE3@usD1GLF9/iba>0fV*E1c@6G2DZm90fCXA0f:dD0e>V2@:Eq\
/1f)R/44H$/6$:o+EVX4A8-."Df0!"+DtV)AKX9TB5_g!@N]B++Co&(Bm+&u+D,Y4D'2,b@:Eq\
3[!(QfnA"hfWj),fVfp$Cb<T!F`PEO@N['HFD,5.@rcL3-RgYW$:/KAAStp-85^Qc1bpd:1GLdI
0eCVV+@g![/4!\q0K(^G2_-U@1,LO:/ib^=3B8]K1,h3O0J"q:/i,LJ1,ps=6#pCCBk&\FcEf&l
ASitdATDL.ARloqEc5e;6#pCCBk'1HfVdDUfn\78fX]Y6+CT(<BOPf$^L865-Zj$5+C]A"DIb+;
>AnC%FD,5.DIm<n+E(j7FD,5.@ps4cCgAJB%15C;BlA*,/4`Y]1c[6I/2f7D2)[#2[3/ID@4X\q
0etUC0Io"<2)m-A/iP[>0f_$B2)$sE3A<!A2(gmH3B/cM/1`?t[4G<P@4WU%BOr<.Ea`KmFD5Z2
@;I'(@;TQu6#:7RFD)e,Df'',+D,Y4D'3q6AKX9Z@:Eq\+CT)3@<<W#Cb9=/D..6'-mBjWBOr<-
BOtao-Z^DB@<<W6@;0O%+t5,g%15C;C12!gBIl\P+?);;3@lm=1,LsM/C(XG6[<;q6")<"0Jk[C
.l/t=3%Qg;1cR$B0ek:<2)7-J1Ft=</ibjE1,V!A/1f)S/44\q/.DqPChmHnA1U8L+>kl60e>4A
1GCO7cF4or9joS)/1iD-/iY^>1,(U=3&icM2)d'C3A**B1GUjI/1`?t[k(NR@4Vip6#:=FCisc:
E-!R$;BRhU1G^R@2)I$B/C(m_+@:!b/4!\q0f:^C2(LIA1,CI</i,451,CX;0etLB0fU^?2_HmF
2_d3N/1`?t]J1s(Df709$:/KD@;on#@;%2_;BRbQ3A`9D1c.-G/C(gL<D?mQ5qF]M0JbU;1cI*K
/2St62CpR=2(gmC2D[6K/2T:<0f:jH1,UU6/C(gX<D?mQ%15C;CLM6l@Ot&J+?2A82(UI:2)[3G
/C0"m:h=8j/M&J)1bLU?/2K.</i,=@3AWB@1,CO>0JkL<0J"b+c\3oHAS3P'$:/KDATKCn;BReO
3&`BG1H.-E/C(LC6ZR9"/M&J)1bLIA/29%>/ibaE2D?s=/MT4;1-%<Q3&<*:/C(LO6ZR9"%15C;
D.-k!/4`Y]0fC^C/2B"<0fCT.[3.bXE\&dn0JtO>0Int91c[*C/hf(42`33E3AN?E3@m!C/iYUB
1GCa=/1f)S/4"E!/.DqPCi*TjBIl\P+>to0/3,UF0J(MU+@0mU/3tg@1,(LE.l9":0J"t30eb.7
0J5@E1cR0G/2T+71GUsL1,UU6/C(RQ6#L3a%15C;DII7"/4`Y]3&EBJ/28h=1,_*CcESK^Eciob
/2At73&3'B2DmHF0ePC@/2K(;/hf.B1,gm</Mo@<3ArQO2`*':/C(LO7ri`'%15C;DIIU&/4`Y]
2E*HN/3#UI1Gp`/ZSEY%B6#OT/1iD./ibmB1,gp?1c7$B1,UU71GCF<1,L^>0J"b+cEf8W;eL,%
%15C;DJ<oqD(J4U+>Gl11Ft:>1GLU8cF"cjEbR'V/2/q;2DQj<0ekF70eP@E/3#I=0JtXB3&rNA
0eP480f^sK/1`?t[4G*oBe0]#6#:FQFCAr985^Qb3A`]H1,_'H2_<7_+A[#l/4!\q0Jt[@2_?^<
2)d'@/iPU<3&N<C3&rlW1b:45/ibaD2)d?C/1f)T/5L;#/.DqPCi3s4@<=%k;BRkO3&E0G0JP:;
/C/qk;e'_s6")K!0fCdA1+b7=1H$d>/ibU:1,Lj@1-%9J1c[*=1,U[A3ANNR1+Xt-c\!cI@rEn-
$:/KIBOPpl/4`Y]1H.-M/2T7@3A<#0YolS_@4Wu]0KCmI2D$UB1b^I8/ibpC0f1U;3&rlV1cHs;
3%d*H3&WHG/1`?tYq/Fk@4Vip6#:LRARf4Y/4`Y]2)dNO/2oIB2E*24YolDS66Ig2/1iD./i#15
1,C^=2E*?N2)$R:2D-pC1c@?M/1`?tYq/7_67`QQ6#:LRATD4$H7VTb+>G`)2E*QGcESKXDIb:a
@4X)d0K:m>1-%$G/2Ah32_6^:0KD$O0fCR<3A*!G0JkR?/1`?tYq/1YA1S/s6#:LRATDE785^Qe
1H-jD0KD'CcF4omF(6ae/2/e70f:I92)6m;1G1XC/2At53&`NN2`!!>2(g[A2)m?I/1`?t[k(?s
@k8&r6#:RMCM@i@85^Qg1H.!=3&<HH3%W@f+@L6Y/3tgA2_[*F.lB.=3%Qp>2)Qp?2)['C1G_!E
2_6gC/i5L@0K1sB/1f)Z/4=Me/.DqPCiX*.@q]:%85^Qf3ArEK1cREFcESKgF(6ae/2/h51,(44
1,Lm?1G1XB/2Jt42)-gE2_lp>/iP[E2`!<B/1f)O/5UCt/.DqPCiXZ-@4XrI+>u,43%R$I2`NQD
/KdH%@4Wu]/M&b32`3-A2Dm*I3Ar`Q3%QpC/iYO>2_d0@/1`A(6ul]e%15C;F(&Zp/4`Y]2`*EJ
/3,UC0JG'(K-3R&@4Wu]0f_$F1b1IE1b^I;/iGX>1-%-C0K;'Q2D?[?3A*3J0ekUF/1`?uK.KE2
@4Vip6#:UPBjl."@<=%k;BRbN2`3-C0ebOD/2K"'9R1M,/M&J)1bLO@/28n;/iPID2`WWE1c$a=
3&iWK0e=k,1GLFSH#>/B$:/KLAT2<sDIG(e;BRbP3&N6D1-%'F/C(UF<b6(u6");u3&EHN/N#@A
1Ft753B8WF1GLL:2`3TP1b:491bL^@3&iWQ/1`?tZn,6hCb-#&6#:UU@;0U185^Qh2D?m;3B/]K
2D!.Z+@1!`/3tgA3AiZM.kik:1b:F82_cj=3B/WN1,q'D1b:O;1b^gH2DZm8/C(OP6#g]l%15C;
F(f!(/4`Y]2`EZO/28h41GLR7cFk>f@;mb`/2An70K1R<1,Lm?1bL^G/2Jt;/ho7A3&rrL/MT"5
2`3TL2`WE?/C(p[6Xapb%15C;FCAm(/4`Y]2`3HO/3,XI1c[,4Yol>PCb..h0f_*F3%H[B2)6^:
/iP[>1-%9G2E<WS1,gaD/iYaK1GU[9/1f)O/4"8l/4OYuD'2,b@:Eq\3Zoj'VqHaVL=iibYpggJ
VqHaU\(IV2VV&-r-t.!FDIIU,.3N'X\ZIIB\ZNf$b._S1+=JUZBOr;uCjB`4B."g+ART4fAR-`;
%15C;FCAm)/4`Y]2`!0B/3,OC2`<54ZlhbW@4Wu]0f^sD2Cg[E1b^I:/hf481,q6G0f(dJ2)$R>
2_I!H0f:dB/1`?tZn+Uc@4Vip6#:XSEb6jn;BRbS2`!!A2E*KI/C(jM9P&,n/M&J)1bLR>/28t:
/ib^A0ekO:1,:IB2E*WT0J"b+cFYW$AT'+/$:/KNA9)*085^Qc3&3ED1Gq0H1b?q]+@Ak3/1iD,
2_m3E/M]=@3%Qg;1c6g=0ek:71,CjI0J"e23A**A1GLRA/1`?t[k'm@@4Vip6#:[[@3@jYF*)G2
Ch[rA85^Qe1H.0B2)R-C1G$hc+B;-E/4!\q0ekCB1+P.81GUL</i5:60fD$E2)I0I1,CI;0eP==
3AEEH/1`?t^+<8Y@4Vip6#:[[@3@mTEb/ZqBlbgr;BReP2`E9F2)6mH/C(pO<Gc.q/M&V20fV$@
1G^^C/2Jn83@lmC3A*3E3B&`Q/2K(70KCsG0JtC4/C(p[<D?mQ%15C;H!r6p;BRnQ1bgOA1-%0L
/C(a[+B)il/3tgA3&NTL.kie71+Y772DQg=3&E6A2)I<M3@m!>1,(LB0JY11/C(a[/5p,#/.DqP
CjKf9E\'aZ+>Pc51b:F<1H%!>cFtDkASitM/1iD//i,@90eb=71GU^A2)-X:1+kOH2)RBL/1`?t
^+;ccD(H,'6#C%@Bl@Zn/4`/O1c$jH2_6^E2)R'=?Q_^1@4Yb:?S"/h3B/QM1G1ID3&N]M/1iV;
/iYjM1,^s?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43-?/0[i'B4Z*t@;[3,Ec5o8F(&lH+@0jQA8,sq
@3B9*+EV:.+D5V'+E(j7FD,f7A7]d(Bl5%bB4>d%D0^5:Des?)GqL4*F!,[<Cht5&F!,L7E,oN2
ASuU(DJ(),F`VY=@q@266#C%@Bl@Zn+DGm>@;L"'+CQC*De'u/Afto.G%E3IE+NHfAKYE!A0?#4
BlnVQ+q4lFD..='Bl7@)@4YJG;c#&%1b;]o;c#&%1b;uV6ZR9"?S#P80eb490J"q:2(g[F3Ai`Q
/1iV5/iYaC2E!<A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44H"/0[o(Bl%L&E+s3$F!,FBDfBW9@;IP=
6#C%J+B)ul@<l9(BlbD8DIjr/Afu2/AKZ)=D]j.BBl7X,Gp$X/Bln'#F!,C5+EV:.+Ac`cCh[j-
Bl7K0F!+FjB45UpB-;&:FD,T/DeF>H+CT.u+DGm>FD,5.E,oZ0DfTB&@;I&sASH73+E(j7FD,5.
De!?eDBNA*A0>i3DffQ#FDl1BDe:,(Blds!Ec#6&/g:`36#L+ADesPI=$]b]/N#:7=$]b]/N#:7
?Q`0VB.RC@?S!oe/i#+31Gh'D1c[BP1,CI@/iP[C1,gm<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5Tnj
/6$b4CM@j'+E2@>E,Tf+Cc`b*DII'oCipk7F!,R<AKYr4Bl.:!Gp$d=D.RNlDIal.Aft&qEbf63
+CT.u+ED%*ATDi7FDi:DBOr<'DffZ(Ebo0%A0>T(+B3K(CM@j'+CfP1FEMV8/e&.RDI[?g/4`Y]
3&EWU/28k50JG:6cF=u_EH3T^/1iD0/ho:91G^j?1,([E3&N6=2_I$K1GUsF/1`?t\1BpcE\%Y,
6#L=HFCf>uE\'aZ+?254/28q93&iJ8KJFZ=EbR'V/2/h:0eb170eb:41bL^F/2T+72`3TR2`*';
1,1C80JkI<3%QU3c\+&)7<3)n%15C=Bjl$j/4`/O0eb@C2)[!C2`NQH/70N"9joS[/70qe/iYa?
0fM$D3&EEM3ArEG2_I!F0K1dE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4Y?$ARoLrBHV87DfBW9
@;J"J6#LCFEa^))F!,R<AKYl!D.Oi.AftM)F)YPtATMO!E$/k4+EV:.+D#M+@j#`/ASiPUDJ<O"
@3B$)+B*JqA8-*u+CTD7BQ%o687?OZGp#giEcc#5F)PqK%15C=CLLX&85^Qj3@lp>3&)u0Yok/c
BOr_H/2/b52DZpA1,1a>1+kC;/2f+<2_[6J3@la=1+k@:2D@*I/1`?tYq/^bALn8t6#LaTE\'aZ
+?),22(UaF2`EHBcESKmF_iT\/29.?3&`?C1c-m;1bLUA/2B4@/ho:C1H.0B1,LUA2DdEJ1Ft(.
cESp$F_iT<$:/QO@<,q#/4`Y]2DI!E/3#=B2DZo0YoltTD_+1*0fCdI1bCI@1,^[</hf171,LpB
1GpmI0f:L61,^aA1GUX<1Ft(.cESp!@rEn-$:/]B@;Ni`F"BjM+>GZ,1c[HF2_m?L2(W)W6>pcn
?S#P82_I'D/2At:/i,=A3AiNB0fUd@1Gq!C3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qpDf70N6#L4O
EcPT++E2@>E,Tf+Cc`b*EarNoBlbD2F!+m6AmoOpF`S[EART?sBl5&8BOr<(DfTr5+E(j76#L4O
EcPS>+EqL1Eb-A8BOr;bF`&=@@<6L$F!,R<Ec6)5BHU_+BQ%]u+DG^9FD,5.D/XQ7FCAm$+EVgA
@q?ck+F.O,EZee4+D,>4ARloo@<?(%/g*`-+Eq78+E_a:A0><%+CQC3EbTB)FD5o0+EMI;@<*K#
@;KLmA79L$@;]TuEb/ioEb0,uAKYr1Bl8#8AoD]4F(f-(BOu3pF!+n/A0>GlEbp"DBl7Tm@VKpm
DKKqBDe:+XDId[+Ea^RE%15CA@ruj6F`T*);BRhQ1b^I=3ArfP/C(LC6>pcn/M&V50f:m?0f^sC
/1iP.0JtC:0f(FB0f:a@0J"q=/ho=@1b^p@7ri0PCFh$^Yq/4[D_*)3BOr;VEb/ft+EV18D'7fM
LsLXt]$H&T^Yur)c[jBVc[m9VARTIt+<i"/BOr;VF^]<$+sK)kBlkJA@<3Q6F(Jl)AoD]4FD,B0
+EMX5EZeh:+CT)&+CT.tBk;1(+CT>5Ec5i6D.Ra/+=K[!@<?F/FD,6'ATKCF883$^@<,jkF`T)V
:ipVlASl]A+CT.u+DGm>E,Tf=Bjtn(+CT.17;$mbFD50$+ED%1Bl7X+@qBOfAKYGn@psM$AKY]/
+D,P4D.R6#E+*d/+E(j7FD,5.7;$mbFD50$+Cf>-F*(u0CghF"Df-\9Afu2/AKXNXE,]_<7rMpK
ATMo8GA(n;B6@X'A7]9oFD,5.@rH7+FCf9)@<?4%DBNk0+EV:.+@:3eCaX9H9P%iZ-uX,K6?R*\
-Z^D0BPD*m.3N\CASrW)DBMqR@4i[4AhG2sATMR(A1Sj)DfTW7+CT.u+@KX`F!*=u2BiS;6#paL
@N\KcF*(u6BlA#C85^Qh1Ggm=3AiQP1b?qX1*BM.E\&dn/M&_21,ga>3A<'F0Jk^F0J"e41bL^I
3B&lW/1`?tZ8*t0B6#O4$:/]J@:C?UEbTH4/4`Y]2`!6K/3,RC1bgQ,Z8!J#B6#OT/29.?1,^^@
1bq$A1G1[G/2B4>/iGRI2)R*>/Mo::1c76Q2*!3=/C(OU/5p2%/.DqPEc,Gt/4`Y]0fV'K/2B(C
3&N84Yol_OE%F:+0JtXA2_?aC1c[*B/i>U>3&<0A3&3?L2_6O82_I'F1,:gL/1`?tYq/R[E%DG*
6$$OICi!N285^Qh0f_'A3AWNH2D!.^+B)on/3tgA3A<3H/M]=D1Ft:62D?[;3&N<H2)?pC1Ft+5
3A*9N0JGC@/50JoBl5IQcF,9&B6#OI@<5piCi!N&-mBjDEc#c0F<VnX/g+)2F`Lu'3Zp_)D..'g
F*&NZ2)-s4%15CBASc1*F!*bkF*)G2Ch[rA85^Qd1c@'>1bq'G0eCVW+@C$V/4!\q0K:mG2_-UB
0KC[?/iba>0f(O:0fLgB1cR$@3%cpC1c$gG/1`?tZn+R^@k8&r6$$URCiseA6>pmU@;KY!/4`Y]
1GgpK/2T+A0K(K-ZQMVQ@k9oS/20%?1G^O:0et^>1bL[E/28q7/iYU@1c-s=1,1C<2E3QJ0e=k,
cEf&hDIY4,$:/`HCh7[$@4XrI+>Yi61+Y7<0ebU=cF"ccH!r6i/20%?2E33@2DR-@1G1LE/28q8
/iG^G2`W]G2D-g@3&iTP/1`?t[4Fjo@4Vip6$%!ZA8-+#ALpAM+>Yo93@m!E2)R9CcFG&b@<*nN
/1iD./i#.40f(gB1,gsG1-$m;2*!9E2`3?H1+Xt-cFGJn@<*n.$:/`TATD^.ALpAM+>GT.0e>%<
2)dNH1,0nN@<F+e/2/k:2*!0B1c$p=2(ggG/2]=<1cI<Q3&`BD1bLXC1c7!C/1`>-0e?:4FY!t/
6$-ONDfT9%@4YJG;c#&(1b;]o;c#&(1b;uV6VUu??S!lh1c.'A1GUgC/28n42E<<C0JP170f:X?
1+Y"51+kOD3&<NM/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Q=@4YArB5_TtF(HJ5Ec5o8F(&lH+@1*X
CN"6%CLJ?&ARTIt+EV:.+Cf(nBl5&3Afu2/AKX9\@:O4r@6,NQBOr<&@<-!lF*&OADfor>@;0U%
Ea`iuAKY])+B38lD_;J+6$-dO@X2j&/4`Y]2DI!C/3#=>1GLH+[ie(Z@4X\q0fCdD0Io%91GLF9
/iPR;1,Lj@3B9#X2)m-F0eP=<1bpdB/1`?t[k'pf@4Vip6$-gV/4`Y]0ekI=/29(?1cR&3^E??a
E\'L-0JbOB1Fk7:0fLX>/iY[=2)['@2`WfP0J#"8/i#CG1,L[9/1f)]/5Tnu/.DqPFDPB,/4`Y]
0ekUH/29(C1cHs@2]u(.FY#ge0e>"71c[<A1,L[@/2Jn:1+Y:A/i#F@2*!TH1,LU;2)@'D2(U:0
1,ga`@<F+1$:/cSBjiP`;BRkQ0fLXC1,:dE/C(LC<,t8U/M&V71cREG2E<HH/28b;0e>(;1+k:>
2DR$J/1ib?/hf%>2_d'=9OW$WDCd?aYq/jp5qGBADKKo-@ruF'DBNk0+@9L^ATAo(ATMQuDIIX$
Df-[`-u<j9@4<<uEbQq1DJ+*.Bdk/j.!9TQEa`cuF"&^N$:/iLDfRC";BRbO0K1O>0ebCB/C(XG
6Xb!d5qF]L1,:^=2*!HI/28b:2CpR<2(gdB3&ETK/1i_>/i>=C1cR<C7;caSBldr=/C(XS6Xb!d
8T&]_DKKH#+D,P4+B3#c+@0^^+@0g\@;]L`+E(j7FD,5.8514%@<H[+@ps0r6#:CHDII#t:M+3Q
@q?)V6$U;RCi=E3/4`/O1,:[E3AW3@0fUsD3@nM[6Y1?j?S#P83%csB/2K.D/ibjI1-%<F/M](6
1bq$F0fCR<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j,#)WnBk(Rh+E2@>E,Tf+Cb?hrGf-k(Dffe<
D.R-nF!,[8FCfJ8@;]dr@;I'#DBO%7AKYl!FD5o0+AQ?YF^]B.+DbJ(B6@WqALnsJBPCsi+DGm>
@3B]1BlS9,+CT.u+CfP1FEMV4Ci"A>F(o9)BkD'h@;^00ASu$iD/!K&@;TssBjtdpF`S[HE+NNn
ATJu+Ec5e;FD,5.@UX=lDBNk0+AHElBk)'6+q4lFH"D80Ed(r&Gq;KS+>Gi71bpU:1H@HO/70Mg
EbR(3/70qe/iYR:1c6m>1c.$C1+Y"40J5==1,^gC/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe2u(
@;]pjEZf=ADfBW9@;J"J6$[$e@<-R#A9f;3F!,R<AKYetEbAs)F<G"0A0>`-F*&O=D/aE6FCB'/
+ED1>ATAo-DBMZ!@;]pjE\7e.6$d*YAmo:[B4WVb;BRqT0JP+50K1^B2D!1)0d&i/B.PVc/M&_2
2E<<E1,U[A1,CgB1+Y:;/ho=G2DR'>/1f+t0e>\;B.OK!6$d3Q/4`Y]3&`ZF0f(aB0eCVZ+@U<b
/1iD)/2Jn<3@m!D/ho%<3&`WE/N>@B3B/`M2(U:0cF5>nEbR'6$:/uTBk1p/85^Qd0JkX<1H7*J
0J(M`+Ad3"/E22D/20">3AW6B1c7$>1G1LA/28k</i,7=2)[6A/M].83&N]T3&W<=/C(s\:j$_.
%15F1ASYh!/4`/O0f(U>3&W<H1GL[D/3"bP9kc.c/28t=2E33G1c7*@2D-sF/2At;/i#+81cI3A
2`*-I0JGLB1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/3#1\9kc.&;f?f#BHTrdEb/Zs+E2@>E,Tf+Cc`b+
@:a4bFWbC>+EV:.+D>J%BOu7,+Dl%>DKK<$DBNk8+EV:.+A6WnARTI!E+Np$DKBr:@4WOBBlnK+
FCeu*Bl5%gDfTr5+A6WnARR,4@;]TuF*VV3Des-/ATJu9BOr<(@<?4%DII?(F)Yi6BlkJ9Afs`b
Eb/Z3+q4lG@<-6oEb$P=+B*AjE\'^Q+>u5?/3#RK1H-jc1,Ua>+AZri/1iD)/3,=?1b:C?3A*-G
1b^[@/2St;2E3HO3%RWe<?P@5;bekp<\cNd0J$"=BIjT"6=FtIDBMS\Bln97/4`Y]2)@6D3&WTN
/C([H6Y1?j6");u0f:[C/MSq70J#"42`*'@2_I'J2)-mG/1iS1/i,:@0JkU;/1f)T/43uj/.DqQ
AS#^mD(J4U+>GZ41Ft:82)@*@c\4.t7<3)n/M&J)1G1[H/2fC=0JGLB1H@!<1Gg^<0fD!J3%SQX
EcQ;AFCeu6/C0#+/4FSn/4")h@:s.mF<E:q0f9CI6=jkA/4`Y]0etaK/29.B3&`D6^G-j"EbR'V
/1iD0/hf+52DQmF2E!BH2(U=;/iYXG2)m9@/1f)]0e>b6Be0]#6=jtECb/+F+>Gi11Ggj<3AiNH
1b;uV;eL,%?S#P82_HsF/2B4>/i#=D2DR3B/M]+72DI3L2_Zd<0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
;eL,%;e9iXB45UfF(HJ5Ec5o8F(&lH+@9XUAS`K'F!+m6Eaa!"+EMIDEarZ'De:,9@<?($+DG^9
FD,5.DJsQ;BHV5*+B)ihAS5Ff/e&.SASc0kFE2)?/4`Y]0fM*H/2B(=1H$f0ZQN%aBe1he0JtUC
0e4q91,1=7/iGO;3&*$@3&3EN1b:O;1Gh*N0Jb72/C(RQ:NC/#%15F5Eb/p0DJ<N183p3,:b=CZ
/4`'+/Pn#R2(W)W:h=Yu?S#P80et@81+Y=A/i#7C0K([;1H@'E2D@$G1+Y170f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r)ATB=G<GQV`Bl7WnDBNn=DfBW9@;IP=6=k1KBR+K0@3Bc&F!+m6;f#lcBk&8rASH73
+E(j7G@>T)EcW@3DIal1Bm+'.@UX.iF!+q7F<G:8+Dl%;AKZ#)@qBP"+EV=7ATJu-ATAo7FCB96
F!,.)F!+q'ASrW0Ec5f5FCeu*FDi:DBOQ!*De:,#+DtV0Bl@ltC`mA/A7T7mF!0ImPTV.oBOtUm
FD)e6DffZ(E\&>PEc6&2@rua&F)rIBAfu2/AKYPmEcbt=+tb&K$:8<GASc!jF`V+F85^Qc0K(X:
1,h3Q3@rI\+A[#l/4!\q0Jt^F1+P%;1,LO9/i5F:3&iNL3ANTN3@m*A1b^jB2Dcs9/C(LO:NC/#
%15F8@<,doBe2eQ+?2/:/28q90KC[@0d&c&Be2PY/2/h:0JG"42_d3A1G1R?/2T+71c[ER2_lp>
2_HjD0JtOC/1`>/0e>V2Be0]#6>9nB`.9I16m+HI0K:d<1cREK0e?ZS;e:2)?S#P83%d-G/28tA
/hf%;2E!9@/Mf"=0K:mE1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,AU#aM8T&'Q@;[3,Ec5o8F(&lH
+@9dOBZ,HE>;'I-Waa)I@4tn/BlbD=BOr;QASu-hChY#2Ec5i<DI[BhFD5Z2+E(j7FD,5.;djQb
CN=-2+EqaEA0=oe@VB1$+EqL5@q[!%ARTIt+CQC%EbT0"F<G%(@;R-*Afto(B4uB>+q4lGBkUpl
/4`Y]3&EKH/28h=1bq!@cF=unAS3PG/1iD//i>C81G^d=2)I<R1H@!E/ho@F3&WQD/1f)V/5Tnj
/.DqQDf]i7@4Xr;+>PW/2DHm:0ebOA2)-Xh+@1!f/70r8/3#7<1b:F<2(gjG1H.0G/1ie51b^mE
2)?d=0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#gor,!p3hDJ<N%@;]Tu87cgfAS5q)Bl7?%E,ol9Df]?'
4!6k.F)Pr)+DGm>FD,5.DIIBn+D5D3ASrW4D]j.8AKZ)+EcPl9DfU+GDe:+YDf]f1@3B9%+EV:.
+>GQlBHUerDKL#AGqL45@<?($/0K%JAKYl!D.Oi6@<3Q5Ea`j,AoD^,ARlp*D]hAbF)G]#+E):7
B5)6lFD5W*+D,Y4D'3q6AKYl!D.Oi.Afu2/AKX<XF)GD/EbT].E\8OF$:8ZQASH$585^Qj2)-X:
1cR9N/C(UF6#pZj/M&J)1bLRA/2T:<3A<BJ2)[!?3A*6G2E!KN/1`?tZn+L`Be0]#6?6LEBPDU+
/4`Y]2)[-E/2o@D0f1H-K-3j%@Oser0f:XA0eG.<0fLX>/i#:81,:a?0JPLD2E*0=1,U[>3&*EO
0e=k,c\!cBBjrV&$:8lEF`8m&6m+9F1,q'@1,^pJ0J$QR9kA2n?S#P82D-mJ/3#I=1,V$J0Jb73
2`!'E3B8lP2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r&ASs%bF`VYF@;KXdDBNn=DfBW9@;J"J6?Qa[
E$/k9+EV:.+@:!bDKg5DEcl84+EqaEA0>K&EZek*Bl%<4%15FEDIG(e6m+3B0fLs@0etID0e?ZS
6#L3a?S#P82_HjF/2K:=1,V!N2DZm@1+k7=1,^pB/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K\A1U/k
BPDC(Bjkm%E,ol9Df]?'4!6k4DIFZ%F!,R<AKYK$D/F3/Cj@.GF(Jl)GAhM4+D,P4+Cf>%An>Nr
Bl5%^FD,B,E+r`5%15FEDId0,85^Qi1,^s?0ebLE3&W>5^*#^]E\'L-1,1RD3%ZgC2)-X=/iYO9
1GUd>1c%'N2)[!;2_I'I1bpa?/1`?t^+;QiE\%Y,6God=_l7NlF"BjM+?25;1b:OC1c$[i+Ad,h
/70r8/2o191+Y18/i,1:0f1j@1,pmD2E!HR2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F(6aF7WN'X
@q[!(Ec5o8F(&lH+@<uFCr<5iDf[%F@<3Q5BOr<!De'u/Afto(B4uB<+E(j7FD,5.;fut/+CT.u
+E(j7BOtUgFD)e2DBMGXF_kc5BHV/;FD,T/DeF>J+q4lH@;^"&F`T*);BR_N1,^[>0JkRF/C(LC
6Xb!d5qF]J1,L[:2)7!D/1iP.2DQgD2(gmK2`W`T/1i_7/iG^I2E!9@/1f)O/43id/.DqR@;odo
Cgekc;BR\Q0K:U=1c@$I/C(LC6$73!6");u2).!J.l9.<0J"n10K:UB3A*$F1,C[F/2T4:3B9#Y
3AE'9/C(LO6$73!%15I2E+gdn;BR_L/2oCD/C(OD6Xb$e5qF]D0KCm=2*!?N/2Ah53%Qg;1-%0K
1,:C<3A*$C3B&oP/1`?tZ7J@OF"@b-6Xb%XDfRC";BR_S3AE'@2E3QJ/C(LC7qHNg6");u2`!9K
.l/n;1Ft753B/QE0f(F?1c[BJ3%Qj?/iYgM1,h*B/1f)O/4X8g/.DqR@<6O5Cgekc;BR_Q2(UR@
1,:E,Keac<@<3tO/1iD0/iGI90f1L;2E!<L0e>1B/ho=?0Jt^=8O6?!=%?1a/1f,$1+Ye$F"@b-
6Y0_8CiWru/4`Y]2E!6F/3#OH1bpW-Z62q^BIk_d/M&Y02`<3B2Dm*H2E3EI2Cp[;2)[BL0JG%/
/C(OP:N0tu%15I6Bju!3844RY1GgsG/2K4?3&E0n+@BgN/70r8/3,==2_6[<1bLaE0ebID/1ie?
/i#@F3B&cG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44)Z/6-_5B6@X.@;[3,Ec5o8F(&lH+@B^S@W*B'
F!,R<AKYl!D.Oi.Afu2/AKYl!FD5o0+EVX8AKYo'+B<H)B6@X.+EV:*F<G41G%G_;EbTT++EVNE
FD,5.DIIX$Df0!"+D,G.G@beI%15I6CggmmD_+FW+>GT-0J"q;1cRKH0fC.R@<F+Q/2/k:1cR!@
1bgp?2(g^C/2]=<1,(CA3AW3A1bLOC3A`WR/1`>,2Cqg9FY!t/6Y1:]@;^0uF"Bj[+>u):2(U^F
2`WcIcFb8cEa^LN/1iD1/ho471,_$C0JbUB2)Qp:2)-^C1GgdC0e>(60f:(K@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O]IZ?h@4WTsBkMR"
C`m8"+@B^\G%#91ATJtm@:==jA9)*$-o!S92_?aB0fCI'G@>P8@3B/jD/XQ<+B*5fDJ=0*+Eqj?
FCfJ8@;]Tu@<H[*DfQt=Afr9A7;O)<DJ*NuBlA'2+@p3W@;KRp+@L-c+Am8qG].\8+Co%+CgeG\
@;]Rg@3QmJ+q4lHBOP^cG@>A?85^Qe1,h-C2)@0H0e>.?+B;-E/1iD)/2]%61Ft7=1bLaG2Dm?J
/2T%51c$g@2)[!@0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(F?ARoLsBl@l?1cHsc9joS?BOP^cG@>A3BlbD*+DlCGBQ%^*B5(jaC`m5.De!]rBl%?'
CM@[!+D,Y4D'370<+o]S+D,P.CNO!$AM+E!6YKnFF_c,F/4`Y]0f1U?/2An=3A`;4\2#1+@<F+e
@4X)h1,q3C0f:gD/2Jn;1FtFC/ho7A2)mKF0f:RC2_[3N1+Xt-cF>V\<+0o#%15I9@;g*uEaa6%
/6>,9:b=OY/6>,9:b=OY/70MgEbR(3/70q_0ePCA/2T.82E3ZM2*!3>0eb4>3B/]N1Ft:80f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70qsEbR((BOPTtE,ol9Df]?'4!6n(@;d8bBQ@O,@3B9*+EV:.+D5_+@<<W4
Bm+'.+E(j7<+o]SCgh3l/e&.TBOPpi/4`Y]1cIBO/2f4=0fLZ/Z62M8DCe(^/28n91H-g@0etI7
1bLO?/29+D/i5@A2D?p<1bgU=2)d?N3@l^4cE\ug<c0Gt$:AK8F)T$R/4`'+/Pn#V/4`'+/Pn#V
/70MnH#bHC/29+=2`<0B2D[9C0ek:@2CpUB1bLU=2)I6G/2K1:2DR!D1H$d>0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL9R1Y0;f$Aq@;BRcDBNn=DfBW9@;J"J6YKnLDoIMTBlbD*DBNA*@qfLlF<FLuDg#Q)
+EV18D'3G/EZe;'DCuA*6YL%@BPCm+844RT3ANKQ3@m0N3&rfH?Q_XSCb/pE?S")f1c-a>0JkC9
1,Ua?2_6d<2)m9K3Ai?C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#g]l,"$$T@q]Rb+DGm>@3B/u@<=)B
F`M)&@qB1%+EVX4A8-."Df0!"+ED%(+EqaBC`mD"F<GdGEc*"/Gp$s8DBNA*A0?)7D.RT9+EMgF
@W-'sF(oN)+EV:.+Cf>4DKKoE-Z^DNBk(g!FE1f#Bln'-DK?q/DIal(F!+t2DKBN&ATD?m+CT=6
FD,5.DIIX$Df0!"+D>=pA7T^lF)rI9DfQt7DBMo$DJ=0+@4i`5$:AK<Ecb`-/4`Y]1c%!L/2]7D
2`WG7\0+IVD_*Ik/M&\11G^R:2E3<H2D?g>3@lmB/i5=D2)d6@/1f)V/50Vn/.DqRBlmcoASc0o
/4`/O0f:X?/29"=2_8;Y:ig+t?S#P83%d!F/2St=1,1L<0J"q8/hf.>2`3KE1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/5UCt/0[VnBln&tDBNn=DfBW9@;J"J<+ohc6YUXNA7]RnAKY].+CQC/@<-!l+Dl%>
DKK<$DKKf9+D,P4FE1r6F!,17+AQiqA1Sio@;0gt+C]J-Cige.AoqU)+@opTFD3+D+DG_(AT23u
A7]XgALns4DIal6@<3Q%ATMQuDIIWuA0>;'<DGt]6Veh+DfTZ)+@p'aBlmcrAKZ&.FCcS'Ci=3(
+EqOABHVD1AKYl%@<,h&+B)]dF"L=/F^o,.:gn0K@q@8:%15I:FCB"'Te&`&+>ko02Dm$A1H.$K
/70MoDf.+5/70qd/i#F<0ebI;0K1jD1c[*=2(g[C2_d3F/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"oi
DCe4m+B)]bG%"p"EbSs"+E2@>E,Tf+Cc`b,Blmd"_kA2iARTIt+AuosATAo3Afu/:@<-E3Bl5&8
BOr<(@<?4,AKX`VBQ[a*+DbJ(B6@WqAM+E!6Z6IK@W-'m@4Xr;+>bi-3%QjB2`WEr+B)cd/70r8
/2o1?3%Qd=/ho(80JkX</M]4:2)-sH3&<*@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;e'Vp:2+3HEa`U'
@;[3,Ec5o8F(&lH+@C'WBju!s@ppKoF!,R<AKX`VBQ[a"F<GI0D.Oi%DfQtBBOr<&@<-!lF*&O@
@;BEsBl5%\ASuU1@;I&PD.Ra%@ppKoDBM\g@psCdB6@W8%15I@E+O'-Bk):,/4`Y]1GppC/2T.?
3&`BG2'>8(@k9ns0K:pF2CgOB1,(7:/ibd?0f(U<0f1mG0et:83%d!C0K:gA/2An62'>Y&D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdY&/44;b
/0[i'@rH0lF`SZmDfB9.DJ<U'F!,CA+AHQcDeris+A6WlATD[&CEP#[1cI3B0f:dD.3NhCF!+m6
:iC/aF(c\)F*)G@DJsB'EZfR>D]j">DfBW9ARlp*BOr<"ASc(!@qBP"EbT#+D/WrrC`mY.+EV:.
+EMI;@<*K3H#n(=D'3P1+D>J1+C]8-CEOfF6tIK]ATi!.F`_>9DJ<R&F!,CA@VKt%+Cf>$Ch7[0
Bm"8:+tb&K$:A`P+@BRXDes,=85^Qe3AEBB2D['C2([%X1*AqbDCe(^/28n;2D?X;3&*EE1+kOH
/29.A/het;3A`NC1H7!C0fUsJ2CqO1FD5V8-q/#dCh[s(.4d$qYqdjt<c0H49OVdI+=Js&2_um6
+Acc\H?s9J-o!\91asUX$:ArN@;RPd;BRkP0fLXC0Jk[D/C0.q87cfm5qF`K1,Um=0f1R>/2St:
2_6^@2D-dC1H@BS/28t60JbL?2`*':/C0/(87cfm%15IFEcYY?85^Qb2E!HE1,CmK2([%Y+@U<b
/1iD,2)$sK/MK%92(UL82`N?I2D.!J1,LgA/1i_30K:sI1c?m9/C(OP7<3)n%15L3@VKL,85^Qh
2`EWG0eb:;1c6i0Z8!Ih@;mb`@4X/f1,1I70f1^G/2Jn42(UO;2(gXA1,psD/1iS5/iPaE1b^d<
/1f)P0e>\#E%DG*6t'nGD(J4U+?;>9/28t@2`WG7YolMSE\'L-0JbF=0eG.?2*!3D/iYa?1cR*A
0fV-N1b:463%d3N2`<EF/1`?tYq/@_E\%Y,6tL7I@Ot&J+?);91b:@81,(^J/C(LC6[<;q/M&Y2
1bgg;1c7!H/28b42(UO<0J5.=2`WiO/2T4:1,psD1H@!;/C(LO6[<;q%15L7DIm9"6#:1FA8*Sc
;BRqT1,:C80K1jH2D!.\+@BRV/4!\q1,1UE0J,";0K:U=/iY^>1GUj@2`<?E3&E0<0fCX=1,gsJ
2_6L2cEo,i@;mb,$:JHCAR]Ro@4XrI+>br31b:LC2D[*>cE\QdAT'+O/28k93AE$=1c$s>1+k:<
/29(B/i#=A3AE3=0f1L?2_m'E3%QU3cE\upAT'+/$:JT:A7]U/85^Qe3AriJ2Dd0G0eCVT+@C'a
/3tgA1GLR;.krt=1+Y773&N6A3B&QI3B&WI3@lmD/i>CE1c.-B/1f)O/44>m/.DqSBl7R%CghT?
844R\2D@$F/2]7=2)m-o+A??b/70r8/3#7;0e>%;2D-^D2)6pH/1iV02)-mB0fU^>0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL9P&,n,#iSsDJ<WiA0>;uA0=ii@UWnf+E2@>E,Tf+Cc`b-Bl7R%CghT3D.R-n
F!,RC+Cnnu@q@26FE_G?F<G"0A0>u:Ec*"6DBNM,@:F.q@<?''D/XT/D.RU,F"AGTH#7#/Ch[s)
DJ()6BOr;rF_l/BEb-A%DIal+@;]_#@:s-oDe:,6BOr;pDI[7!FDl2@+E(j7FD,5.E+Ns,Ch4`-
Aft&nBl7Wq@:UKhDIakhDdm-fD_<4C$:JTIBOkO&85^Qb3&iHF1bh!AcE\Q[ATTIT/1iD./hf+5
0eb4>3B&`Q3@la:2_I*M2E!6I/1`?tZ7J@SF=[k.6tppT/6>,9:b=U]/6>,9:b=U]/70MhDfRC9
/2/h91bpX=0JP740eb4?2_6d?/hf+90JkL8/Mf(50fD$G1c6g>0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
7W3;u,#)KgEbTW0@;[3,Ec5o8F(&lH+@Kph@3B9*+CT.1DeX#1Cgh1"+EV:*F<G:=+C]A0F_>B0
+C]U=8T&'Q@;[2rDI[7!FDl2@+EVNE9jr0bBln'3F!,17+EV:.+>Gi20ILom+CT.u+DGm>F`V,)
+D,P4+Dbb)BQRs+B-:`-EbTE(+EML5@qf@f+E(b"@<6.$DK@?OBl7EsF_#3(B-;;0AKYf'B4uB0
An?%*Bm*p$+E(j76tpjRChYLG%15LAAnbda/4`/O0ekUF0fU^B2D?sH/70N"9joS[/70qe/ho:9
1,(L:0ebLB3&3$:1cI$B2_d*H2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqASs%jDId['ATMQoDBNn=
DfBW9@;J"J6uQ[OA76TtARTIt+E)CC+EMX5EZf(6+AQWZF!,:-DJ+*#B4W\)$:JfL@UXO583p3,
:b=IS/70N"9joS[/70q_0eP==/2An;/hf:B0f1U91cR*A1,q0M3%Qg=0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r.9joRs;K[&%Bjkm%E,ol9Df]?'4!6q0D.6q!+DGm>@3BT%F)Q)@+ED%+Bl@l3Bl5&8BOr;]
DfTr5+@BR[@psG$F!,=<F`);0Bl7u7FD,*)+DGm>ASu!oDf]K#+C]U=D/XQ7FCAm$+D,P4ATMs7
+CT.u+ED1+BHVM5Ch.?rAn<M9Bl7EsF_#3(B-:Yp@<-E3-t.0>FD,B0+EMX5EZf14ATJu.DBO%7
AKYK$DKBo2Ci!O%Bl@l3<H<.h+AH9ZDfRBOFD,5.B6%QlF<G%(@<*eL+q4lIF(8m+@U`as85^Qf
3AiTD2`NWJ0eCVW+B)cg/3tgA2D?g@/M](;2_6^:1-$m@1b^O93&<?J3@la;1+kI?0fLg@/1`?t
Zn,-cD_)>)7!2sPALpAM+>bl.0e>1=0K(X:cESKl9joS=/28k51H-gB0f1a=0ePF?/29%?/ib^B
3Ar`G2DHgC2)-d@2(U:0cESp#9joR^$:K2S@UX.*85^Qg2D[6B3&WZL1b?t/0d&l)@4X\q0fLpD
3@d$D0KC[@/i>R=1,_!B1cR<O0f1F?1+k:<3&i`R/1`?uLbUGKEa^L.$:Me5GJgj?=$]b]/MT18
=$]b]/MT18?Q`9WD_,6H0f:gK3%ZmF0Jk=80eP:C/2B"A/ibgF1,q3D/M]:<0K(XE2)?d=0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL;e'_s6Z7$f@3AH^@ps6tE,ol9Df]?'4!6r/XEVRj+DG^96?6dLEbQY4
@;]_#@:s-oD.R-nF!,R<AKZ&:DBL?:BkM'iEZfI;@;[30BOr<-F`&=GAKYc+Dg*WQ@;]TuFD,*)
+Dtb6ATAo8F`MA@+E(k(/e&.V@VfI(844RU0fV$K2CpR;1c$mB/70MrF(6b./70qf/i>X?1Gh$C
1-%0L3ArE?1+k=?0K1gH/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##p@k8g&H#dV-DBNn=DfBW9@;J"J
7:L(A+Eq78+E)./+E(j7FD,5.ARTUqBk;@-+DY\/B4PptF!,17+B*Q+BjiP8@;]TuF(KB8ARlol
F!+m6E,ol6Bl7L"F<GU8B5):%+DG^9FD,5.12^VF@;]Tu1NI"KD/!g&ASu3j+@7\J/g:`37:]hJ
Bk(g-85^Qf2`*?B2`3EL3%W@c+@L6Y/1iD-2)7!K.lB:D3%Qj<1-$m@1GLL;1GUaH2Cp^F/ibgJ
0K(^</1f)W/4=Me/.DqTCh7*uEa^Li;BR\K1bpU:2`*NT/29(+<+0o#/M&S31c.3C1,L[D/2Jn;
1+Y:@/i#.@3A<9@1,LU<0f(UA2CpC10fLX_@<F+1$:ScD@:iqg/4`Y]2)I!I/2o7A2)Qr2Pos+A
E\'L-0f1XF1+b180f1F</iY[=1,1^?0JtOA2`3-<1+k=;2`W`S/1`?uPq5sME\%Y,7;Qa^EcknD
85^Qc0fM$B1-%$E1b?q^+@C'`/1iD)/2]%60J#4=/iYgF3&!'</Mf=<1,UgI1,(71/C(aV6Z6cl
%15O?DIIX#/4`Y]0fM*I/2B(>1,pi1Z63+TFY#ge/2/q:2DZj=3&<HD0eP@A/3#@:2)d9N2_cj=
3%d*C2`*BI/1`?tZ7Js`FY!t/7;R'SDJ<u>85^Qg2_[*?3&`fQ1G$hX+@L6Y/1iD-2`3KO.lB%:
3@lp<1,LO;2E<BE2)-sF0e>1:/i5OI3&rlJ/1f)Q/4=Me/.DqTD/"2F844RZ0f_6F2)R-L/70N!
F^lt0/70qf/hf170fL^C3ArfR2CpF<2D-^D3&*<J/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#0!@k:>m
H=:Z"BlS9,+E2@>E,Tf+Cc`b.D/"2:Eb031ATMF#FE8R@Dg#\7Bl5&8BOr<&De!3l+AH9[BQ\N-
+DbJ(B6@WqAKYo'+EV:.+Du+<FD,6+DBNt2B5):%+E(j79lG>dD.74!F_*07$:SiHAh6JN+?2/2
3%Qd<2`!0G/C(XG:h=8j/M&Y31c-s<0KD!H/2Ah63%Qj@2D-[?2DdBM/3,=B2`39C3@l^4cF#3"
AS3P'$:SuU@;.8`;BRqZ2`*'?0fCsG2_<7\+@B^Z/4!\q1,C^H1FkCC1H6pA/i#.41Gq!A3&<HN
2)QpD2_I!E1,CX@/1`?tZReITE%DG*7U]nHBlYaq;BRkX1c6gE0JbOB/2T+)6ul]e5qF`M1,^g:
2Dm9I/2St=1+Y1>2D-gH2Dd*G/2f@<2)[6I3%um=0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?1bpUMEa^Lg@:jCkEZfR7F!+m6:2b/o
AKYi8FD,T/DeEco@;I&sG@>N(+EqL;+EVaHDIm?$Bl8$2+CQC'Ea`U!DCuA*7U^1I/4`Y]2*!KM
/2oOD2Dm&3J07d#D_+1_/29">3&rQG2D@'@1+kOH/2B"A/iPL?3B&]E/M]4:0ekL>0K:U7/C/ht
;e'_s%15R5G@>N+F"Bj[+?)/53%R'K0fCm?cEn]]H"SZo/29.A2)$O;2)%!@1+kR@/2B4D/i#7>
2DmHF1c6m?1GCdC0J"b+cEo,iH"SZ;$:\TCBlbgr;BRbU1,CI<3&WKK/1hu8H!r6U/1iD0/iba>
0f1jB2_d6K1,pg:0f^j?0KCpF2CpC1/M'G<@4Vip7V-CMG]mM9ASbd+6:<C[2]t"7/2At;2_8;Y
6Y1?j?S#P83A*3F/2o191bq'J1+Y"32D-a?2D[0I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QUF=\V'
F^ecs+E2@>E,Tf+Cc`b/ASc(*+BDokASbct-o!Y?39#IP0fV$H.3NhCF!,R<AKYT!EcZ=FFDi:D
ART(^+EM%,ASu!h+DG^96ZljH+CT@7FD,5.;djPd6Xb"ODf[%0DIakg@;[2RD.7O(F(oP8;e9f[
DIIR2/g*\r+E)41DIm?$FD,5.G@>b>FDi:5A9DBjFD5Z2+D,P4+CT)&/0JA=A0>>mB45[#FD,5.
AU&0*EbTB%DKK<'+EV1'@q]RoB-;,)+E2">F(o-*+DG^96ZljH/g:`37VlXKATVj.FCd!o6m+3<
1,1dH/2]@B2_Zdi+BE2s/70q_0f1aH.ki_83@m-B0K1O;2`<9F1,^mC0J"t33&33F2`WEE0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL<bZS*,"ZlbCh[<q+E2@>E,Tf+Cb?i"Ch76jFDl&=AKY].+EV:.+E_R4
ATE!5Ebo8/EbT].EZf:4+D,>.AKYT*Df$UeEb/ft+AI-'BQ%^*B6bV6DBO%7AKXQd@;KXdDBNh*
EcPT1Bm+&1E,T<)+E)-?FD,5.@:jUmEboH%AKW0@6tpgYDIFYTDf'?&A8,Hr+s8:%Bm+3.AKX?Y
D/EipGpskFGp#L`DKKG46#:7JBPD$uBe1B:BQ%s'DBNA/+CT.1@;Kb&F(oQ1+EVNEFD,5.F*(i2
-Z^DBBk;=1+DtV0F`M%G+q4lKDf&p!BOQ%*/4`Y]3&`TP/28k81H%3DcESKgF$V?C/2At<2`E<D
3AWTF0eP1>/2K+>/i5:<2E<QE/M]==2DR$C1H-j?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"GVA/5UCR/0\&,
AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!+,fnCR$VqHaUXkAN_WZYnrD'38'/`F49
@<Zf9-mrkMF`_:>De:,6BOr;uBldr8.4u`7DBMbeEcYr'DBNA/FE2;9DeF>H+EV:2F!,OG@<*K7
@<3Q$@;KakA0<'?87?+PDfT9(B.P0,@<?!mATAo3Afu2/AKXoiF`_:@+tOjTDIjr/Afu2/AKZ#3
H!tM3F*(i2F"SXG$:\rSD/XK(/4`/O0eb:>2)QpB2Dm0J/70MnAT',,/70qd/i5F:0fLm@2`<NO
1H-j?0J51=0f:dF/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"l^D_*)"BPD?qF(HIn@;0[lBcqA8DfBW9
@;J"J7W3<aDf]>0BlbD=BOr<"BleB7EbT#lC`mV(D.Oi.Aft&]Bm4!'+E_a:A0>T(+EV:.+>Gfs
BHUerDKL#AGq:(TARTIjDJ()$ART_'BkDL(+DG^99OW$WDD!+B$:]&EDL*j)5u]F4/MT(583p3,
:b=CY/70MjATB>//29(=0Jt@:3&*9A3A*9L/2B+;/ho(=0fC^:1H7!B1bpdG2_6^<0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r!ATB=G6$76jEbSs"+E2@>E,Tf+Cc`b/Ea`j3+DGm>@3B&n@<,ddFCfJ8Bl5&8
BOr<'Dg#i++<i".Ble?0+sJ.@D.7EoH"h//+CT.1ASlBtEc5t@De:+XF`VYFBji,uDBO%7AKY)H
=EJ4!@qBP"F`Ma[+B3#c+EDC:AKY].+E2.*H"CM/@X0)<BOr;p@ruX0+A6-`ChRBoDL*El_mX5q
/g:`37WiNi/4`Y]0f:a<1-%*D/C([H6Xb$e/M&J)1G1RG/3,=<1bq$J0e>1</iYjL3A<ED/1f)T
/43ie/.DqUF_tQ'F(&ooCLLm-85^Qi2`END0ekID3&rP8Z62tb@k92_/M&_21cR$B1c6mG2E<NJ
2(UO93&30A1c6g8/C(OP:ig+t%15RIDJ:Xm6m+3<3ANEL/2f4;2`E9p+@L6Y/70r8/3#7@2(UIA
3%cm?3B8rP/2oC<1cRKQ1cHs@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6ul]e8Rl=J@;]Ui@j#`2DfBW9
@;J"J7WiT_+DGm>@;[3+Ch+Y[@qBIbDIdHk+EqaEA0>`#@;]dsB-:f#Eb-A3EZeh-@<uK;%15RI
EcknD85^Qc1,q$?1GCO=1+^_Z+@Ak3/4!\q0K([?1G(C:0Jk=:/hf%33AiEC2`NTI0J"e30J5%;
1G^pJ/1`?t[Oad?@4Vip7Wj!!ALpAM+>u,60J#1B1,^j</Kdu%D_*Ik0fLpL3A!$G0Jb79/ho@;
1,_'D1c@0J0Jb731H-p?1c$pA2(U:0/M'h1D_)>)7q#nJFa,H.;BReT2DZmB0ebRD/C(RE6ZR<#
/M&V31GLX:2)d3J/28b73@lmE2_I$L0f1mM/1i_</ho(:1,1R9/1f)Q/44H#/.DqV@;C.&A1U8>
+?))61GgX>1,LgG/70MeDIY5)/70qf/i#460etaA3&*9M1c?m>1+kRF0JbXF/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"Q^@k9r[F`_&0+E2@>E,Tf+Cc`b0@;C.&A0>`#@;^-/BOPk!Bl7L'F"SS*Ec6#?
+AQ?eBl@ltC`l8WE,]N/ATMo8BlbD=BOr;sAThX$DfBQ)DKI"?BPD:$F)Q#2Gp$U8DI[6lG%G2,
@;]TuAoDL%Dg,c'+DG^96>1L`@;[2rDIal(F!,C=AKYo'+@9aaFCB&7F!+t2DKKo5@Wcd,Df0V=
FDi:DBOr<1DfTZ)/e&.XASl.!B43>f;c4`)0K(^C.krt6:fC77681;R1Fk1=/70MiASitM/1iD)
/3,[B1cI9M1H6p?2_I$J0JYLA/1`>Z/4X8g/.DqVBjl.*@<*ni;BReQ1GgX?2DR!A/C(jM6ul]e
/M&J)1G1XB/29(=/iY^B3AN9>2E<BG1GLRB2(U:0cFYVqEa^L.$:efADII3085^Qe2E!<A2*!WM
1G$hX+@C0m/3tgA1,1XG/MT1?1Ft:62)m-A3&<0I2)-sF1Ft+42_HsE0f_!L/1`?tZReIaFt=(0
7qljLDCe=V+>c#20J#+91,^g;cF"c^Eciob/1iD//i>X?0fV$C1Ggd>1H@!<2D?a?0JP:=2_6L2
cF#2jEcioB$:eoN@<3u$5uUT30f(@3?Q`$fDCf-G?S!oc/i>@70f1R:0eb@C2`E9D1G1XH1,L^E
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCctuEbTW0F(c\8Ec5o8F(&lH+A$Gn9jqpa+@fjOCh[B1
+@g6d@<3Q.ARTIt+EVNEF(f9*AKWC;Bkq9&@3BW5@<*eL+q4lLDf''"F($Uj;BR_S1c6g?2DI0N
/C(OD6VV8G5qF]K1,gs=0K:dG/2Ah;3@lm>0ePCE2`<TO/3#7;3&rcL2CpC1cE\ug9kc-f$:f,Z
D/"-0/4`Y]2E!NS/3#RG3&N84^*#ga@4X\q0fLsG2(LOB2)6^=/iPR;1,_*E1H7-F0K1O?2D-sJ
1,^sI/1`?t^+;Zm@4Vip7s/?W@4XrI+>l,;3@m*J1c6s<cFP,sATB=R/1iD0/hf::1,CjA0fV!M
0Jb773%cpB0f:jG/1`?t\h$ckE\%Y,7s/ZWCgekc6m+3C3B8oV/3,OF1c6gb2)[<I+B)on/70q_
3AEBL/M].;0e>481,UU<3&iNM3&i`P3@la;1bLLA3AWNL/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><])cm
1+Z@:E\&D$Ecl82BcqA8DfBW9@;J"J7s/ZWCgeH#F!+m69jqjHGp%<LEb$^DGA(]#BHV/'@;^-/
@3BDqB5(iu@V'k(@<*K3FDl&.+D,P7DIal(DBO"<@;BFq/0JJD@:sLrF"AGFFCQpI%15UJDJ<fo
F`f6+;BRkS0JY1=1c-mD/2K1,:N0tu5qF`L0f:a=1,^pH/2]%62_6^A3%d0H2`N`R/1iV8/i>XK
3&r`F/1`S8/5L4u/.DqW@:Wee/4`Y]2)7'K/2fIH0JY3)Z62MGDCe(^/28t81H6sE0JYC70J57<
/2Aq6/ibdH3&NTF/N,:81H.*D1Gp^7/C(OP6Y1-d%15X7ARoq)/4`Y]0fCjC/2B"?2E*24[idtZ
E\&dn/M&\10fU^C2D-mC3&`TJ/2T(61,CaD2`<3</C(^U6$73!%15X7D..6385^Qg0fLXD3&i`G
cESKXEbR'V/1iD./hf"21GLL@3AWHK2_6^?/i5IA1bgs@/1f)O/4";j/.DqW@<6KuCh79285^Qb
2)dHF1,CU=2([%`+@1-j/1iD)/2Ah93@m*G/i#7C1bpd:1G^X<2E!9D0J#M3CghB-6Z6OPBe1g\
\L^$hE\%Y,87?UcF($Uj;BR\R3B8WG2DR*D/C(dK:NC/#6");u2)@*H/MK%>2(UL83%umC1G1XE
3&3?N/1i_33A<HR0JP+EFDPB,+@C'YChYFOcFGK%EbR'6$:n`EG%Gc0Df[I#;BRqX1-$m?0f(UC
2_6g@+AcW^/1iD.1,V!J.l&e82Cp^<1c[*C1c-g@2E!EP1Ft:8/iP[J3&<9?1,(F?+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/2].5:h=8j
,"Q9]G%Gc0Df[%8F!,R<AKXZTFD5V8AoD]4+sM,BAKXNTCj'B3Bjkm'+s:<3A0>o(An?"(+EVNE
FD,5.6Y1(UBk&9-EbSuo+EV:*F<GC6G%G2,Bl5%lGA2/FATDTqDIal#F`M26B-;;0AKX]]A7TLf
+@0XOF"SXG$:n`SALpAM+>kl-2_6jF1,M!BcF+irBlYaj/28q:1cI!?0JbU<1G1IC/2An8/iGXE
1GCL6/MJe73AicO0J#M3CghB-6Z6OPBe1g\[ObHnE\%Y,88i-R@<*ni6m+6E2E*TH1,1L;3@nM[
<+0o#?S#P83%d!H/2fF>3&NTJ2*!3E/i>RF1-%3C1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$&#/4")b
ATDKnDBNn=DfBW9@;J"J88i-R@<*K)F!,R<AKYl!D.Oi.Afu2/AKYhuBl5&1Dfor>@;0U%Ea`iu
AKY])+EV:.+B)]^@<,d!6tLFNEc`F<DBO"=F`_;.Ec*!cChI="BjiV'$:o)P@;RPd;BRqW1GgX;
0etF<3@rIa+AcW^/3tgB1,L^C.kr_80J#"41bgO;1b^O<2Dm?G1Ft77/iYXA1H%$?/1f)T/5Tnj
/.DqWDfT`(/4`'+/Pn#T3%RTd<%Uou1H6pm+B3Aq/70r8/28n42)?d>2(g[E1GUgB/2K%61,LmD
1H$d>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<,u\(7VQaXBldr1E,ol9Df]?'4!7(4Ec,;.BlbD1ASc0*
DfQtBBOr</DId=!GAhM<A0>K)Df$UdBl7g&@j#W6FD,T/DeF>J%15XKDII3t_n%Bi6m+KL1,1d?
2)R*I1b;uV6ZR9"?S#P83%cmB/29%C/i5CE0f(d?/M]+73B&fP0f:L;0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL6ZR9"88iBVF`Lo.+E2@>E,Tf+Cc`b1F`(W$E5T70G@>P8Df0,/De:,6BOr<.GA1q;B5_=%
+EqL;+C\nl@;TQuFD,5.;fut#Bl5%d-Y[((ALATK;0?S_BZ$eu+AH9i@;[3)H$!_<Ci<s3+CT=6
Eb/a!F`);4A0>T(+EV:.+AcuqDepOsF_EB:$:o;WDfRC"5u]F4/M\k.?Q_mNE\(QK?S"/h2_lp>
1c6m?2)-pJ0e>.9/hf+A0K:sA1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4a>m/0[W-DJ*BuBjkm%E,ol9
Df]?'4!7(:DJsP<G@>P8@3BAtB4Ysk@<-W9@;]RdF*)>@+E(j7FD,5.89Jfk+CT.u+EV:.+@pWm
B45gp@;[3*@<?4%DCco=DIal!Ec6&5ATAo3AfsfVB5_fC+q4lNCM[^$/4`Y]2*!EO/2oOC0Jk?,
JKRm$D_+1_/29">2E<?E3AE<@1G1XG/2B"A/i#1:0f:[:/M]==1,1U>2`!!9/C/ku;e'_s%15[C
CjC&8@;[Ve6m+HE3&ifI1cI*J2_8;Y9MK4P?S#P82_I!D/28t;/ib^I1,_'B1Gg^C3&!9J1+Y17
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70r%9kc.&6#:"=DJ<Ns+E2@>E,Tf+Cc`b1BleB7EbSs"F!,:-EbAs"
Gp$R-Ch[I(AKZ).@<<W6BOr;PCgpgjBjkn#+CT;%+Co&)@qBOg@;^1.+E(j7FD,5.8Si3gEbSs"
F"AGB+EV18D'2,\@UX.g@;^-/E,ol>A8HN6@ps1i+EV:.D0'9)G%G_I+q4lND..-085^Qe2DmBD
2*!TP2_<7]+@C0l/1iD)/2Ah:2(UIA1G1UG2D[*B/1i_=/iPUH3ANNE/1f)R/44H#/.DqXDK0f5
ChtXn6m+3A2Dd-C/3#IF3&`Bq+@1$V/70r8/2f+=2_6^A3A*<M1bgmJ/1i\</i>IG1GUX81,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/4";b/5TnuF`qJ-DBNn=DfBW9@;J"J8T&NjBl%T.G@>P8Df0,/BOP^h
+E(j7FD,5.@rHL/Ch4`'DK]r7G%G2,Bl5&8BOr<.Ea`Tp@j#T+G%De;FDl2F+BMus+EVNEFD,5.
;fut#@X0).@;Tq*F!+:jEclP>@;[33EbTW,EZdYWEa`WiD'2kfCh.*nDf&p'/e&.ZDKK<)/4`/O
1,([G3%QdA2)dKG?Q_gVEZco?/70qg/ib[<2)$X;2`E]V0e=n41G1UB0JP7</2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"ZbE\&D/@;K@tF(o'#+E2@>E,Tf+Cc`b2DKK<)+Dk[uDK?q2BjkjsDIal(DBO%7
AKX]UCghT3Cgh3oF^\oo+=KQbBOPsj+AHE`@<luE/0JA;Cis9&DJ()6D]j.8AKZ&-Bl7X&B-;,)
+CQC6FCB2B+q4lNDKKH1@rc^5/4`Y]1H.-H/2T7A2_cjj+B;-E/1iD,3ANQQ.l9+>2Cp^<1bgO9
1bp[<2E!HJ3%QmD/iGC<1cR6A1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>492.^<4FD5Z2/1iDQ9joRs8T&W]Eas-4F!,=2@;^-/+sLK-FE_;-DBO%7
AKYf#B6,7@+DG^99OW$WDBO"BH#.%C+ED%*ATDg*DJ()6D]j.8AKZ&9@<*`:+E27?Bln'-DBNY2
+EV:.+Cf>-F*(u0CghF"Df-[tEcYY39jqdTE\8OF$;#8LDIG(t5uUT31H6pe5uUT31H6pm+@p'a
/70r8/3,=>0e>(:1G1[F3B/lR/28h20JbIA2`WEE0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL87cfm;f$Aq
ASu3jDBNn=DfBW9@;J"J8TJB[@3B9*+CQC/ART+`DJ()%BOPpi@ru:&+DG^9FD,5.DJs]0C`l_q
A7]d(FD,5.7WN'O+B*E#3ZqiR;flquGp%$;+EV:.+@0mTBk;1(+@gH\DId?fFD,6+F!+q;+B*)p
G%GQ&+Eqj?FCfJ87WMpT+B)]bA]:?YBcolZDT0>&@<*tC8TJB[@3B9*+CQC:Df&p#+E(j7FD,5.
@rHL1F=n"08T\lgA77#[6m+6=3&ETR/28h<1H.0B?Q_jZFY$lN?S",g1cHsA1-$sC1GUjK3%QX;
2_I$I1H%!F/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"]fFY"_,@:F.mATME*E,ol9Df]?'4!7+:Df0)o
/0JYE+EV:.+AI,mDIjr4Df031ALns6DfTl0F)Z&8A9/l8D]iJ)C`mh5@<<W+F!+q'@<H[+Ap%oB
+q4lNH=:hF85^Qf2)$p>2_m*A2([%\+@:!b/3tgA1c.'D.l'%;1b:C71Gp^=1,1C:1c@9N1Ft:?
/hf4@1,(X</1f)S/4+8n/.DqY@:E\SBIl\P+>to/2_6mJ1H.-AcFk?!@rEna@4X,k0etF70f_!K
/2St:0J"t91+kRI3&ioT/1iS:/i5I?2_[3B/1f)[/5p%s/.DqYBlds1Be2eQ+>Pr50J#"=1,_!@
cG(JlASitM/1iD0/iYjB0ekL;2`WTK3&`BE1bLXF1c$sH/1`?t^FVldD(H,'94;FE@;K[mA8#gg
/4`Y]3&!0?0et[A2D!.[+@B^^/3tg@1,LdC.kib61b:F82)[!B0J5=?2).!F/2Jn61Gq-H2CpC1
cEf&hATTI4$;4fD@<HX*/4`/O3&<BJ1Ft@A1,(I7?Q`B\Cb/pE0KCpJ1+b==0fCRB/i#460f1^>
1-%?M3&3$:1c$a>2_m-B1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/AS`njASud%DBNn=DfBW9@;J"J
<+ohcGAhM4+A6-Z@<HX*+Dk[uDK?q/+Eh=:Gp%0MEc5i.+EqL5EboH-B-:]&CisT4+E(j7GA1r*
+DG^9FD,5.6tgLTF`/C=@;]_#@:s-oDe:+bASud%/e&.\@;U.4/4`/O0f1aE2)d'F3AN<L/70Me
E^D<a/70qd/i>R=1,La=2).!F0eb.62D-pF1,h$L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Qb67b`;
E+*WqF(HJ5Ec5o8F(&lH+A6-[Fa5*DF!+m6GAhM4+DG^9FD,5.6"t4Z+DbJ(B6@WqAKYMpDJsW2
DJ()#+EM[EATDZsFEMV4C`m;,FD5iB+E27?F(KE6Bl7Q+F)Yi6BlnK+C`m;,ATDF//e&.\@;]^/
85^Qf1GLa<2E<TL2_<7c+BE2s+=o)q/M&_20fU^>0f(F;1,CpH3@la:0J5+>1H.!E/1`?t\h$lr
E\%Y,94;jLCLJbb6m+3?2`!EQ/2oIC2)-Xh+@0sf/70q_2)@*K/N>F=1+YC;2_cj=1G^XD0fCgD
2_6O?0J5+71c79M/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K^F"AM1ATo8#ARTC`DIal/Ec5o8F(&lH
+A6-`@;B9oBlbD=BOr<1DfTA2Bl5&8BOr;\`.;iIBcq5#DJ+*#B4W2tDfQt/+E2.*DKI"4DId<q
Bk&9-D]hedG9C(#@;K@iA0>u-@<<W2Ec5K2@qB^(@3B$"BkM+$+E):/DJ*N3+D,G$F(fhAAo`$.
F=naH$;4fMF!*bkF*)G2Ch[rA85^Qg3&`iK3A<0I2([%\+B)on/3tgA3&3<G/Mf4=1Ft752`WEE
2`<9B1bq'O1Ft+61bLRD1c@'H/1`?t[4G6hE\%Y,94;sa+@:!eARTChF"Bj[+>u571FtO?1c[HF
cFY2tB6#OT/29+>3%up>2)7$?1+kOA/2B.B/ibpI2E!NG/M]191bpdE0JP+0/C(jY;eL,%%15a:
F`S["ARoL`/4`Y]2E3QS/3#XM1GLH+Zli:[E\&dn0fUpC0J,%?2)$R:/iPO:1,h'C1,LsJ0K:U8
1-$sH1,q!B1b:1/cEo-$B6#O4$;4fNAS<Vc6m+3C2)R3F/3,IF3Ai?p+B)il/70r8/3#791+Y1?
1G1[C0JbR?/2St72Dm9G1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,ATB=G8TJ6WBjkm%E,ol9Df]?'
4!71)G%G>0BlbD8DIjr/Afu2/AKYYtEc5N1+E(j7;eTTQDIIBnBIk9JBOr;tE+rf)E,T<)+Cf>,
E,Tf/A0>?,+AcWiF(o'#+E271F<F%aEb'*4F(lb+ATW--ASrVN2`DjfDIakE0JP7(6U`UM94<!T
BHV#1+CQC%CggghF)>W5BHVM4D]j+HD.7F"Bldj,+DQ%?FD55r/g:`394_gJ/4`Y]0f(RB/29.E
1c[,4^G6p#EbR'j/2/n82)?g<2`!HF1bLU@/2f::3&*?P3B8WB2_I!G1,q3J/1`?t^G7?/EbR'6
$;5&@D.6piBjiP`;BRhQ2*!3G3B9#T/C(jM7<3)n5qF`I0f^s?0f(R?/2St:1+Y181bL^G2`*EP
/1iS4/i,F@0KD$B/1f)Y/66J*/.DqZBlmd"E+iZ285^Qi0f(O80ebFE3&`D6YolJTFY#g01,1L@
3%H[?0f:L</ib[<1GLjA3AiZS1c[*E/i#7B3&WWF/1f)O/4FQ$/.DqZDe!Hh@Ot&J+>l#71FtI?
2D@'@cE\Qm9kc.1/28t=0K1L@1b^p@1+k7>/2At9/iGXH1Gq*B2`*-A2)R6F1b:1/cE]!$9kc-f
$;5;KBjiP`8PgNa1-%6I/28n?2DHai+@U<b/70r8/28h21,UU>0eP@C3&WcS/1iV5/hf7C2DHs<
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/5UJ#Ecc4B;JBWLDBNn=DfBW9@;J"J95eBU@3Bc&F!,R<
AKZ28Eb$;)DfQtAFCB24Bl5&8BOr<&@;]_#@:s-oDe:,6BOr;c@Df3bD]hVhA8,[fDJsZ=+AcWf
E,9).De:,6BOr;R@<-'k@V&tc/e&.\DeX;E=ALM*/6G\"1b;uV9R1M,?S#P80eb4<1+Y.70J5.@
3&*<N/2]C>1,_*G3&`BD0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,7<<QhDJ<Ns+E2@>E,Tf+Cc`b4
DeX;9BlbCcF*)><Bjkm%AoD]4FD,5.FD5T'+EqL1DBO%7AKXooDBNt6F(KD8Bl5&8BOr<'DfT`0
DJ((?A79\".4u&:95eigAT2=$Ec6"M85^Qg0f1j@3&!<H2D!.Z+@p'a/4!\q0fCgA1+P+71-$m@
/iPa@1,LpB2)R3N3B/QF0eP:B3ArTH/1`?tZ7JOXE\%Y,96+He/4`Y]1cIBP/2f4=2*!55Z62MT
Ft>3r/M&Y02Dm$?3&iNJ3AriO0J"e21G1ID2E*KR/4"Ao@<3PYDe3a!/1f)P/44H$/.DqZF`M/(
BIl\P+?2242_6[;3&r]P/C(sP6Y13Z/4!\q1,:O>3%HmD1H6pB/i#=91G^^;3A`ZR1,LO?1bL[A
2`WfO/1`?t^+;W_E%DG*9OT&BF`:o4@UUfY;BReU1c?mC1,:U@/6O)_<c0H?/1iD1/i5=70f^s@
1,q$I0f:L=2(g^B0JYLE/1`>T/43HU/.Dq[@<,e#@:q,^;BRkQ1bgO@1,CpK/C(XG;e'_s/M&J)
1+k=B/2B(</i>I>3&`fJ/Mf491-%-G1GUL4/C(XS;e'_s%15d?Ec,;:83p3,:b=LZ/4`'+/Pn#U
1+ZcT89nVp?S#P80et@92(UI<2(g[A1c%'F/2f+73B&]K2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r!
H!r6J7ri0PCERS:DfBW9@;J"J9P&6^@3Bc&F!,R<AKYl!D.Oi.AftM)Cgh*j+DG^9FD,5.ARTY%
ATDZ2:h=H]E,TW3ATME6+EqL1Eb-A8BOr;[ATDZsARTI!89n`d@4WO0DBNY1D/XH:@;I''H$!_6
@ps0rDJ=!"/SJ^(A7]9o@V&thF<GC6G%G2:+B3#c+EMX5EZf14ATJu.DBO%7AKYK$DKBo2Ci!O%
Bl@l3De:+_H":r(/g:`39P&9RFD*3r;BRkT0K:UC2)[HQ/C0"m;e'_s/M&J)1+kL>/2B+=/iG^D
3B&rL/Mf=<1-%3O0f(@3/C0#$;e'_s%15dC@V'S%@<3tj;BRnU3Ai?J2`WZR/C(sP6#g]l5qF`N
2)I'=0K:gI/2St<0e>(?3%d'H1,(CA/3#7=2DI$G1Ft:80f:(K@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O^+;QiCb-c(BjtXoFCB55BlbCj
@<?4$+D,P4+<i"GBjtXoFEo&S/g*i%@V'S%Gp%-=An?"(+EVNEF)PQ&@;I&pDIal/Des-0Bk(Rf
+D,Y*ARo^rF"AGBDIaku+ED%1Bl7HmEZfI;@<<W6BOu3q+CT;%+E1n1E,9).A7]dqG%G2,De:,.
BjtXoFEo!CDBO%7AKZ28Ebo8/AThX&+EVO4@<jIJ<+ohc@rH7+FCf9)@<?4%DBM5bF_PZ#+ED%4
Eb0<'DKKqB@;[3!@:sCf+>"^E+E27<F_kK,+EMgF@W-'*De:,.BjtXoFEoJ_%15dC@q[Di;c4`)
0etUF.kre1:fC7768:5Q2_-U</1huFBlYaV/1iD)/29.B/hf"82_Zs;0et@>3&3<F2_6^<0f:(K
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*X
/66J*/50bfBHV#1+CQC)Bk)7!Df0!"+E_R4ART*l@rc-hFEMV8+DYk5GA\O8DfQt1Df0Z;Des6(
DJ()1FD,6++E_R4ART*l@rc-hFEMV8F!,[@FD)e6@:s:a/e&.]Bk;@&@4Xr;+>GT11,(L82E!9M
1+ZcT<D?mQ?S#P83%cmB/2An8/i>@;2)m<A2)?jD1,q-H2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r.
9joRs9OW$dBjkm%E,ol9Df]?'4!742ATM]s+Dk[uDK?q4Cgh0l/0JA=A0>T.+DGm>FD,5.DIIBn
+E(j7@3B&n@<,ddFCfJ8Ao_g,+EV:.+A?3cG%kB&+E271D'2c!@:FA"@:sX(F`&<qBk;@&@4i`5
$;>/MBk\\VDfTDt/4`Y]3&3<A0f(LA0e>+@+@1$^/1iD)/2St:1+Y7:/ibjL1,Us@1-$sB1cI-D
2(VF0FD5VD/2K:;6#pZj:2+3VCghB:9Q,&fF!,")+A?3R@;0OoAKY])+>Gf42[p*fBl@m0De!Q6
844RU0et[H0e>%60K:dC/70McEH3U;/70qe/iGC71G^pA2`<EN0JP+10fL^?2D[6K2CpU;0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70qoEH3U$Df02195e]\+E2@>E,Tf+Cc`b5Bl@l3;K$&\+DGm>@3BB#Df..J
BOPjkA0>i&@;@!(G%G]1Df9E*DJ((_Df02195e]\+CT.u+DGm>@3B'&Cijf?@;I'-H#7#/C`mq9
FD)e-AS#g'Eb0<2ARfg)Ao_g,+EV:.+Dbt+@;I&rDf'?6DJ=3</e&.]F^o-%Bl7C&EbKT*/4`/O
1c7'H0J#"63&WHA?Q_XWE\(QK?S",g3&rNM2_HgF0Jk[D/2K7<3ArWQ2DQg=0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL6$73!,#!-(ASkmpF`M,+EZf=ADfBW9@;J"J<+ohc9QaiZCh[crF`M/<@j#B%Ecc>5
F)rIJ@<3Q#F_PZ6+DG^93ArZ9@X0)<BOr;uDfor.ATAo3AfsciG\(`$Dfp)5/0I;uF`):D;e]fU
Ao_TsA1f&8$;>S`Blq7eDJ<N1844RW2)[<I/2Jt?0JtCg+AHcl/70r8/3#7:0J#4C/i,1<3ArcH
0eb4?1G_!N0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r&Df.+&DfTrBB6@d,AKYr4DfBW9@;J"J9QbDj
FMjhjBji,uF!,R<AKYE!@qfLlF<GI0D.Oi.Afu2/AKZ2.F*(u6DBNt2B5):%+E(j7FD,5.8Rc7O
Bk&8^ASu4"F*2;-+EqL1Eb-A8BOr;[F`V8=@;]dfDBNn0DfBN(+Dbb8ARlolDIal6BOu3q+Dl%<
F<GL6+Dl%-ATDZ?A79a+:iCArF_>-!+DGm>F(o`=@<?'k/e&.^@:=5&D(J4U+>u)42CpgF2E<QE
cFY2iATB=R/1iD0/i5:61,^m?2E3NO1,^[=2D-^=0K(aF/1`?t].?KaE\%Y,9jqOMDIdZ:844R\
1GCdE/2]1?1,1=e+@0me/70r8/3#7<0J"q:0eP.>2_d-I/1iY6/i>RH0JYI91,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/4"/q/44>lDf&rt@;[3,Ec5o8F(&lH+AH9SDf0*(+DGm>FD,5.D0^5:Bk(Rf+EhI8
Cggsf+E(j7FD,5.DJs]0C`lMkAKXNdDIdd!A0>#d@<-E3De:+jDes-0F_#&+-pq][DBNB*Z#=\+
A7Zm)Deruq@:Uf0FD,5.@r,RpF(o,,DJs]0C`m24+@fjLEbT*$+@fj\A&GEW+AH9bEHPi=/g*ks
@rH6qD]ib8+CQC)Bk)7!Df0!"+E2.*@q?d,BOu3q+DkP"Bk&8oDIal1ARTChFEo!;Eb-A1Bm=3"
/e&.^@:sL0844RV1,UdG/2B%90Jb7e+@BRS/70r8/2f+;1FtID/i57<0JG132E<BJ1H@9G1b:C9
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qq@;RPcATDWrDBNn=DfBW9@;J"J9jq[Q+DGm>@3A<RFD5Z2@;I&_
@<--+Bl5%^FD,B,E+r`'DJsW.A0>K&EZf(<F!,+0Ea`QlATKIH<+ohcF*(i2+CT)-D]i_%E,]B+
F!,RC+C\n)Bl5&8BOr;rDf0W<ASc0kFD5Z2+E(j76XahCCi=9$Eb&m*+=M>FAKYW"Ea`QlALT5@
$;FrB@<6."/4`Y]1,(^G/2B1@3%uo/\0+([E\'L-0Jt^J2_-[C0f(@9/iGR<3&rTO1GCRE1+Y4?
/i#.:2)mHE/1f)V/4"E!/.Dq\@;'^jFD39s6m+3A1,V$G/3#CC2)-Xh+AZri/70r8/3#7<3%QgB
1G1L?0f:sJ/28k33B&`Q1cR$A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:N0tu6$d*_@UWtc@;]d%E,ol9
Df]?'4!77+BQIU(BcooSDJEU'BcnfY0K;)PJ<M]B2*!*.BlbD8DIjr/Afu2/AKYH&BkM+$ATMr9
F(f9*Bl7Q+F*(i2F!,C5+@1<bEaiHkC12!o+E271FE2XZ+B)rb+Eq78+ELt*A0>u4+D>2,AKYE&
F)PQ&@<?'k+EqOABHUc&FD)dmD..H-95%aZH!tP4@;]Tu:2,#_D.t,$DIal6@<3Q8ASc0*ARopn
@<?'k+CT.u+EV%.ASuU$A0>;uA0>i-@<lEp+Du==ATD^3F!,=BF(o,mC`mG0F*)GFD.RU,F"Rn/
9jqaE/4`Y]0ekLF/29(@2`!!?0Ha>'FY#*q0JbOC3%Ha@1,:C:/iYd@2)['D2)[?Q2(UL>/i,CE
2`3<@/1`P1/6$&#/.Dq\@;Ke!CFiOQ;c#&%3@n5t;c#&%3@n2i1GU(RBlYb3/28t:3AW6@1GUm?
0ek:?3@lp?2_HmA2E*EG/1iY11c.$H0JP+60JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?N1GUL^BlYajEcki"
DBNn=DfBW9@;J"J9jqjTDegJ0F!+n/+DG_(BkM!pDfp+DDIIBn+D5D3ASrW4D]iI2@V&tXBHV#,
+@1$j@UUC'Bln#2@3BGrEcQ)B+ELt/A9f;=FE1r7@q[!,BOQ!*Bl8$(EcQ;AFE8RHBOr<&Bl.F&
FDl&.+CT.u+EDC1CO%%EATDg"@q?ckCi=3(+EV:.+Cf=uF*'#W8T]"rF(euuCi=M?@r,^bEZd_X
EbSulARTI!G@>T)EcW@?@;BEsBlkJ++E27<F_kK,+EMF=Ebf6&Ch[d"+EML?F=n"09jr'SBko7j
;BRkP1c[*H0K;$J/C(jM:N0tu5qF`K1GCg>0JPFF/2Jn<1+Y1;2_I$E3&EKK/28b;3&<NR3%QU3
cFYW'E+gd3$;FrLCLL['85^Qi2`NNC0ekIE2DZo0YolkSB.PVc/M&Y01c[*C1c?s@3A<3D1Ft7<
/i#+<1,_'B/1f)O/5Tnj/.Dq\@<--p@Ot&J+>Yr41b:I@3A`HAcFP-!AS`nL/1iD./i5L<0f1R:
2)7-J0K1O72)R!?0ebLD2_6L2cFPQ-AS`n,$;FrLF(o,885^Qg0JGI;2`WQK1G$h_+@p'a/3tgA
2D@*F.krt:1FtC90JG%51bp[;0fV-M2_6[B/hf+?3B/]D/1f)X/4a>m/.Dq\@<>pu/4`Y]3&WWJ
/28k70f:pAcF4omAS3P[@4X/h1c$g91GCO>/2Ah<1Ft==0J5:A0JtdL/2Jt41,:R>1c-a7/C(^U
:h=8j%15g<H=:5u@;.8`5u]F4/M]%383p3,:b=FW/70N"9joS[/70q_0ePC?/29(</i#@B3A`HA
1bgU:1,h3O1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r.9joRs9lFo^Des,rDBNn=DfBW9@;J"J9jr?V
@;K@d+DGm>FD,5.9lFo^Des,rDBNh*D.Oi%DfQtBBOr;tDId0nB4Z*pA0=B\@VHroARTU%F*1r5
E+NNnATJtB<H</'F!+n3@ruX1+D5V%Bk;1'Blb^GDe:,6BOr;VDdmE'6tLFNEc`FEAS5^qDBNk0
+AHclB5_U#@4WO0DIal3BOr<(@;TQuDe:,6BOr;uBl\9:+AHclB5_U#@;[3/@<?'sCh\!&/g:`3
9k@dTF`_%C85^Qc1cI3A1GU^B2D!.]+@g![/1iD,2Dd3M.l&t93%Qj<0K(I:0JG+>3&<6D2CpU@
/ho.:0et[=/1f)S/4X8g/.Dq\AS6$pH7VTb+>bu70J#(A2`EQEcEn]o9joS)/28n72)Hg@2_[!<
1G1I=/29+?/iY^H2)$g;2)d-A1GUjC2(U:0cEo-&9joR^$;G)GF)tb@85^Qb3&`iK1,^mA2_<7d
+A[#l+=of00JtXD0e4q<2)[!A/i,L=3&<0G3&EHO2Cpj@3AWKH2)[!:/C(jY:NC/#%15g@CLVEs
@4XrI+>Pi40J#":0K;$CcF+icASita@4X)k0JkL71,(L@/2St50e>%52D-[=2_m*F/2An32)d3E
3Ai?=/C([T7qHNg%15g@Ch7R!/4`Y]1GgjI/2T+>2)[#2[3.hS@k9oS/20%?0Jt@83AWHB2D-aF
/28q7/ho(92)I-@0f^jD1c.0G3@l^4cF#2jDIY4,$;G)LCLM$nDIIE685^Qc0K;$C1,q'J0J(MT
+@1-j/4!\q0Jt^J2(LL?2)d'@/ibU:3&rTN3&33I3@m!D/ibaI1c$p=/1f)P/4"E!/.Dq\ASu9l
E\'aZ+?;/2/28t91Gp`/YolDFF=]!p/M&Y02)Hj@2(gaE3B/uU/2St53&roR2_6L2cESofATTI4
$;G)LCLqC*/4`Y]2)7-N/2fIJ1G^T-\0+.MDCd@j0f1RB2_?gD1,:C9/hf171,1L92E*<J0fLX8
1H$jA2E<cT3%QU3cF>DmASs%.$;G)LCM@6/85^Qb1,:g?0fV'G1b?qd+AcWi/1iD,1Gq0H.l0%>
2_6a;3B/QI3A*6I0etUB/2K.92`WTH1GUL4/C(s\:h=Yu%15g@Ea``785^Qe1-%3C2)@6I0J(MT
+B<8e/1iD)/2Ah61b:@>2(g^D0JbFD/2]=<1H7-H1,^[7/C(OP<D?mQ%15g@EbAf385^Qf2)@$>
2_m3L2_6aE+@:!b+=o)q/M&b32`<3B1,:I<1,h-P0e>.>/ho(=1,(U;/1`S:/4+8n/.Dq\ATDKq
Bjkmf/4`Y]2_m6I/3,OA0f1H,YolDS5qFT=/M&_20ek473&`HG2E3BM2_6O:2_I*E1c.-I/1`?t
Yq/7_5qEHP9kA?`E+LRk;BR\K2)[!?2`<?L/2B"(<+0o#6");u1Gh!G.l&n<2_6d<0f1F=2D-jH
0f:gD/2B"63A`]O1cR$;/2B"4<+0o#%15g@F('*2BPD<785^Qf1c?mE3&<<@cEf5J6#pZj5qF]E
2)@*?0f^sJ/2St<2(ULB/i,IB2)[->0f^jA3AWWP1+Xt-cEf5V6#pZj%15gD@;p$k@qfIrF"Bj[
+>Yo82(URA1,Cm@cE\Q[@<*nN/1iD-/iGX>0f(dA1-%?T0K(I62E<BK0fLjA3%QU3cE\ug@<*n.
$;G5ODf]><85^Qe3&NKC2DR*F1b?qX+@C0l/1iD-1,LpK/N#OF0e>%31,UU;3AE-H1GCRB1Ft+8
3A*3L3&``P/1`?tZ7J@`FY!t/9keKTBPDK<85^Qd1bgs@1bpmA1+^b(+@pcd/1iD)/2St92(UI;
3A*3L3AWEH/2Jn71bggC2CpC1c\!c>H!r65$;G5PASbdtG$upm;BReV0eb.:1GCgC/C(UF<bZS*
/M&V32)R9B0JbI@/2Jn73@lmF1G1[A0K:sN/2Jn73B&cR0J"b+cEo-'BlYa6$;G5PFCArn/4`Y]
0fV$G/2B(C1GCB*Zli.bBe2PY/2/q;1,(:60JPO<1+k=>/3#F<0JG4>2E*0=0J5+@3A<HN/1`?t
Zn,!nBe0]#9keWV/4`Y]2E3EB0ebRB2D!.g+@B^^/4!\q0JY@C1G(:92*!3G/i5L<1Gg^D1H%-G
2_6O9/ibjL2Dd*=/1f)]/43uj/.Dq\Bl[WlBIl\P+>Yf4/2]7@2_<7[+@0mU/1iD,0ebUH.l0%=
2_6^:0K1O;2_HpC1GCO>/2K.92DQsD2)d';/C(OP6#L3a%15gDEa`f985^Qi1GgX;1GUjJ/C(^I
:h=Yu5qF]F2)$s>2)R6J/2Jn;2_6d@/iGXF1,(X<2)R!G3AiWR2_6L2cF5?$ATB=2$;G5TAmoI+
85^Qb0JPL;0f:pK1G$hV+AcWi/1iD,1GUdC.l97D1+Y.42`WEH0eP.>0K1[G/2T@>3&WKG2`WE?
/C(LO:h=Yu%15gDEdD/2/4`Y]1,:jH/2Jt91,LQ-Z62MO@4Wu]0K([A2_?aC2)d'@/ibmB3AiEI
2`*NN3@la:2_I*J2*!BO/1`?tZ7J@;@4Vip9keZWD(J4U+?;85/28t>2E385\fag\E\'Lb/2/k6
3Ai<D1c7!=1G1UH/2T:<1H.-E1cR$C1bLaF2`3EH/1`?t\h$ZhE\%Y,9keo^E\'aZ+>ki11b:OB
1H.9EcF+iq9joS=@4X,h1,Cp@2)I0K/2Ah51Ft:80J5@F0f1XG/2]7:3ANHJ2DQg7/C([T<D?mQ
%15gJCh.I-ARTJ!/6G\"0e?F&/MSe`+@C09/70r8/28k31,pg?1b^O>1c[?M0J"t=/ho7E2)[0?
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/44GE/5gD'@;]dfDBNn=DfBW9@;J"J9lFiYDg#]#DKR(9F!,R<
AKYZ#B4tjtF<GO6@;@!"DBMhqD..<r@3BK#+EV:.+@a;%B>fFC@E=iZD/XQ7FCAm$+ECn.B4W30
Bln#2@;[2rCijB5F_#&+De:+I2)I-4D.Rg0ATKI5$;GGVFEMJ>/6>,9:b=Ud/6>,9:b=Ud/70Mg
EbR(3/70q_0J5%;/2fC=1H.!J0Jb731GCF>0JG=?2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qsEbR'K
:gn6MD..<r@;[3,Ec5o8F(&lH+AHclFEMJ>+DGm>FD,5.FE1f#Bln'-DII?(@rHF1F_t\4FD,5.
D..<)G@b3'F!,17+EV:.+Q@pA7;O)CF`);>iddRN+CQBh@;]Lj@;]dfDBNIuDI[6#Bl5&;BPCsi
+CQC0@;[2rDIal6Df&p#+Cnnu@q?d)D]j.8AKZ&4F`(_4De:,&Ecl5?/g:`39lG&\G$uq'5uUT3
2D?[`5uUT32D?[h+AcW^/70r8/28n40fU^?2)['F2E!EN0e>+8/ho4@3AWTF1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/5Tnj/5p,#@VK7g+E2@>E,Tf+Cc`b6DfT90@3B9*+EV:.+Dbt6B4Z.++ED1>ATAo7
H#n(=D'3P1+B)il@VK7'%15gJEbSrq/4`'+/Pn#S1Fu'_<%Uou1,CIg+@KdW/70r8/28n41GUL;
0K(O<1,CmH3%QdB/iP[D0fLd;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4=&c/5TbkATMs-DJ<Ns+E2@>
E,Tf+Cc`b6DfTQ#BHV#1+CT.1@;]RhASuT4DIIBn+D,P4+EV:.+Dl%>DKK<$DBO.;FD,B++EV:.
+AZfa+@BjbGp%$;+A-3cF`Uu-ASj%/$;GG\BOP^n@;%2_;BRhR1b:UF3ArG6Yom"dBe1he0JPF@
0e5">1Gp^>/i5=71,pmA2_['G0J"t>/i>RI3&3BC/1f)O/6$Y(/.Dq\Dfo`3F`&a$6m+9>3&NTF
1,:[H0e?ZS7<3)n?S#P82_I*F/2o=:2)d?K1,CI51,LU>2E3ZQ1Ft:80f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70qsEbR'K6?R<aBl7?%7U^@V+E2@>E,Tf+Cc`b6Dfo`3F`&`Q@;L"'+CehrCh7-"<c;er@3A<`
Bl[c9+DGm>FD,5.Cgh?sATMr9EbT].EZf(6+@:3kCM@Zp+@]d\D]iJ+A0>i-@<lo:@;[3%D/aE6
FCB'/+EDC:AKY])+EV:.+Dbb8ATJu4Afu2/AKYr'DfBN(+DG^9FD,5.@<,pfF!,1=+E1b1F(KD8
FD,]5F_>A?+q4lRE+s3&D_+sU;c#&)0e?Bl;c#&)0e?ZS6Y1?j?S#P80eb4=0J"t>/i#=@1Gpj;
0J5:A3&icQ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QUF=^C"DL,`/Bjkm%E,ol9Df]?'4!77:Bl7R%
+DGm>@3B/jD/XQ<+EVX8AKZ).@<<W)Ec6/C+DG^9F)Q2CBOu4%+B2ceH=:]*@3AurA0>i3De+!#
ATJu*@W-.0+EqaBA0?#9ARloqDfQt;F`V8,@;I'#DKBo?F_t]-FE8R5DIal"F`M27F"Rn/9m(8d
E+ifsDCe=V+>Pi42_6aA0JkX<cEeW\9joS)/1iD0/ho(30ebI;3AWZQ2)Hj90f:RA1G^dG2CpC1
cEf&h9joR^$;GY^BQ@ft/4`Y]2)6sF/2fFI1,gc0[ie"UD_+1_/28q<1cHp>3&3<A1+kIE/2An=
/iGXC0fCa;0fUdA3B&lO2_6L2cF5>kDf709$;GYa@qfI^/4`Y]1G^dB/2T(?0Jk?+^E?NN@4X\q
0K:jB1Fk@;1c$[=/i,@90et[?2)[?I1,pgC0J5:=3&*?G/4")h@:s.mF<E:q0f:L5cG(o19joRs
6=G.NEZcbb2D?p9+<i"DDBNh*F)NTP@UX:d@<-('+Dl7B@qfI^/g;J^/KeJDFE2))F`_2*+EVNE
+sK?^EaiHtBjkn#+sJ3?$;GYaBk(R&85^Qi0JbC60ebC@1,ga=3$:V#Cb..h1,(RF1b1:72)$R=
/i5O=1GL^=2D@*E2)m-A0J5=@3ANQP/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdM%/4=&c/50JoBl5&*DfQsJD09o6@j`BIFD,5.
@;]RhASuT47ri0PCERJ:F(o,u@;[2REbTH0-Z^DHBkCp!G@>P8F('6'A0><&+EM+&+C]U=A8c:'
BPD@*+=Lc3CiF'%DKU"L+CSl(ATAo%FEDP3@ruF&B-;;0ASH0-@<?U&DKKT2DBND6+E2.*H"h//
+D>J1+DY\5BOPpi.1HVYF`VM5ChRBoD(J4D<%Uou1-$mV5u]F4/M]=;?Q`0VE\(QK0JY@<2(LO=
1cHs?0ePFG/2K(70f(O=2D?[>0ePCD3&``S/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##bE\&D&@;]e#
BHV87DfBW9@;J"J9m(MrASc$kBl+u,F!,R<AKX`dEcYe7D0^5:Des?)Bk(Rf+ED%%Ci(;5Aft]"
Eb-jG<+ohcAnc:,F<G47A9/l9F(Jl)FD,5.F)YQ.CNCV:AfsfjF)Y],BOtmp+EVNEAoD^,+EV:.
+EM[C/0JeJDf.*KE,8s#ATVuE+CT.u+EMX5EcWiW%15hITlP'bFY$T[;c#&(/6>,9:b=RV?Q_XS
EZco?/70q_1+k:>/2K+B/ho4B1,Cj?/M](62E*EP2E!*A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#gor
,"-?dBl7Wp@;[2cAT2d$Ch[B%E,ol9Df]?'4!788TlP'bFWbd>AKYW(A0>f&+CoM2F_>B0+DGm>
FD,5.E,ol=ARfh#EZf:4+EV:.+B*E#+CT.u+DGm>ASu.$@<Q3m+CT@7@3B5tB4tjs+E27?Bln'-
DBNk8+EV:.+EMX5CggsnBlmo/FD,*#+@:!\DIIg%C`mG0+EV:.+@U)h:j$>eFCcS)@<Q35+EqL1
Eb-A8BOr;bF`&==@;BFq+DGq=+Eq7>+CoD7DBNM6ATE&=1,0n>ARf:g@V'R4+q4lR_mXGmBIl\B
+>GZ+1GU^:2_m0F3@nM[<bZS*?S!og1cI9D0JG4?/3#791b:C;0ePFF2D[6G/1iP.1,q!F2`*'@
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL<bZS*;g2qsF!,FBDfBW9@;J"J9uFDW@q[!!F!,C=AKYo'+EV:.
+E2@>D/!m!DKI"?ART@q+E(j7FD,5.6=k1TATME*6#:L]+DG^9;g2qtH=_,5@;]U.%15j=BPo@l
;BRbR1,ga@1c[BN/C(sP6Z-Bb5qF]M0KCs?1,:O>/2]%=0J"q72_HmB3B&]K/2At50JkXD1c?m9
/C(s\6Z-Bb%15j=Ch7-k/6>,9:b=R\/6>,9:b=R\/70MfDfRC9/70q_0J5(8/3#R@0f(gM2`*';
2DZsG3&i`O0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qrDfRBQ;f?f#BHTTQEbT#lDBNn=DfBW9@;J"J
:17sMA8*0'ARTIt+EMX5EZf(6+EV:.+B)imDffZ2/0Il&<-*7lDIFYrDIakgAPcrKBcq5#DJ+*#
B4Z-,@;]TuBlbD=H#RJ-@;Kb*+D5D3ASrW!F!+m6DIIBn+EVNEB5)C&F!,17+EV:.+D>\4AKZ).
@<<W6BOuH3GA1l0+C]A*DJ().BkM+$/0J\GGp$O5A0>i&@:NjkFDi:DBOtmu+Cf>,D09`1FD5<-
/g:`3:18'^/4`Y]1GLdF/2K:C1-$o2[NJChE%ERl/M&Y01,1=71,(=?3ArQI0e=n50J5%51GL^G
/1`?t[Ob6tE%DG*:183WBl[W585^Qi1,h0D0ebLG3&N84ZQMVDE%F:+/M&\12E<<E1,U[<1,:dE
2(U=62D-mG1,CUD/1`?tZReIPE%DG*:186QF(eu5844R[2)@6H/2T=A1Gp^j+BE&i+=pkN0KD!E
0J,+A1cHsF/i>I:0f1gA2)-dA0Jk=41c[0I3A<3H2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/AS`o$
@;TIf@;[3,Ec5o8F(&lH+AQ?e@<6*j+Dk[uDK?qBBOPdo+F.mJ+DG^9D..=-+DbJ(B6@WqATJu4
Aft8cD.73f/e&._ASZ'iE\'aZ+>l&21+Y@?2)R6BcE\QZDf70Y/1iD//i5R>1,:^>1cRBN0eb.8
0J5.A0JtaI/1`?tZ7J=\D_)>):1\9OF`T*);BReS1b:RD0K1O?0d&c"A1T;`/M&\12*!3C1bLUF
3&*9I/2T==2DR6I0f1G(DJO-.GA\r_2)-XJDIb:bDe*E%-o!\80e!P=:1\<_F_**p6m+BE1GgX?
0Jt[<?Q`0YALq1>?S",g2_lp=2D-^B2_mBL/1iY</i5OI1,1a>1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/5U"k/4F&k@:X:sBjkm%E,ol9Df]?'4!7:0DK0f1+Dk[uDK?qBBOr;bF`&=9DBO%7AKYetDJ+*#
B4W3,E,TN'DBND6+EV:.+A$H]BkM!pDfp+D=(-#f@;]d%FE2))ATJu4Afu2/AKX9U@<uj0+ED%+
Bl@m1+E(j77:UIKA8cJt$;P/QG%kA9844RW3ArfQ/2K%A0fCRi+@1-j/3tg@2Dm3H.l8q;1+YC;
0eb.50JY7?2`EHK0e>.8/iYaJ2`3NF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"E!/0[DlChIHjDBNn=
DfBW9@;J"J:1\HhBjiP8@:WecFCeu*Ao_g,+AQKgG%kYA+Eq78+CQC3Ec5f/DIm^-+@9XUB5(dl
+@B^VFD55-FE2))AM,/9$;P;K@;IJc;BR\R1-$m@2)[-H/C(OD9P&/o5qF]I1,q$@1,(OC/2Ah;
0e>:>/hf1<1Gh!@/M]"42`3TP1bgO4/C(OP9P&/o%15jECLMF$Gq;KS+>GZ11bgs@2`*NQ0e?ZS
6>pcn?S#P82_I'L/2At@/iP^H2`<?@1bgUA1G^d?2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qpDf70o
@;]LaBjkm%E,ol9Df]?'4!7:4CLMF$Gp$gB+EV:.+EqaEA0>K&EZf4;FD,6++DG^9FD,5.8T&'Q
B4Yt!F`SZmEb/f)Cgh3oF^\oo+E(j76Xak@A77)"$;PM\@<c33844RW3&3BL/2K"?3Ai?p+Ad3"
/70r8/3#792(UI90J5%52_d<N/1i\</i>I?3Ai]G1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UJ./0[B#
B4Yt&Bl7WnDBNn=DfBW9@;J"J:2b2^G[V_3ARTIt+EMLBBl7Q+Bl5&8BOr;\DfK]0F<GC.DJ+*#
B4W\<<+ohcGAhM4+Cf>,ATJu+Ec5e;@3B&uD.73s@<?4%DBNk0+Du+=@;'dp@k8aHBPCsi+Dk[u
DK?q@ASu('/0JA=A0Adp@:=Ch/0K.MBk(g!D.R-nF!,a>@<*tE%15jQDJNr;85^Qh0etI73ANQO
2([(++B)on/4!\q0fV$J1G(@?0fU^>/hf.61,q'B3&*<I2D?[61,^a?3ArfO1b:1/c\!cIB6#O4
$;P_b@;B:h/4`Y]2)d?N/2oFE3AiA5Z62MT67bDR0f:^F3%HaE0K(I</iGU=1,CX;3Ai`N0ek47
3A*$?2)[HT/1`?tZ7J@`67`QQ:3CVk@:s"a/4`/O0fLgE2CpR=0f_!??Q_^EF"CZL?S"/h0fLX?
1+kC>2)@-F/2o:92`3BH1GLF90JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Xb$e,!g'WEbT#lDBNn=DfBW9
@;J"J:3CVk@:s"a+DGm>@3BT%B5):%@;I',Bm+'.+Dtb!EZdbaCh[d"BOPa/+@0gPF),28+EqL5
@q[!!F!,('D/XQ<+D,P4+DGq=+EqO9A0>r%Ci+*.+EV:*F<GXIF*(i)DBNb6@ps0r8T&'QB4Yt!
F`S[8Df'?6DJ=3,ATKIJ%15jU@;T^iDCejT;c#&#2(U:c+@B^X/70q_1Gq$K/Mf.:0J"q4/ibX;
1,([?3ANNR2E*0=1GUR;2*!QL2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqASs%jG&MDH+@C'UF*&OD
Ec5o8F(&lH+AR2jD/!R!+ED%*ATDi7FDi:DBOr<-F`;A4D.Oi"Eb/[$DfQt2ASH73+E(j76#0nH
+DlCGBQ%^*B6c*=$;SL4F*)+I844RY3&rrX/2T%=3&`Bq+B;-E/70r8/3#7;0J"q61bLXG1,CmJ
/2f481c@$H1,1=80JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<D?mQ:2b/sAS5^cDBNn=DfBW9@;J"JD.R-n
F!)iOFCB2;+DG^9FD,5.;o>;GBcq5#DJ+*#B4W\)$;Y;O@4Xr;+>G]50JYO;3&!<J3%QX(87cfm
/M&J)3%cpD/2B%@/iGI@1b^p@1H7!C1cI3F0e>(60f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*X/4a>m/0[l&D.+Q2@<3Q"+Co%tFEo!I
AftZ$DfKo2DI[6/+Eqj?FD5W*/0JA=A0>N*ART['E+jN<Bk(Rf+EMXFASu.&BHV#,+EV:.+@B^V
FD55-D0^5:Des?)Bk;?.De:+`Eb0&qDIakuDIakg@rHI*@;]U,+CT.u+DkP4+C\n)Eb0&qFCeu*
FDi:DBOr;V@;Kau/Q-M(@;[2uASH73+<i"*B5M@$F!;e\+q4lTCLL['85^Qh1,Cd=3AWTN2_<7_
+@1!`/3tgA3A<<I.krh;1+Y153B8WG3&WBF2)7$F1Ft7:/iYaF1cI?E/1f)T/4"8l/.Dq_@;0Lc
F_G3"ALpAM+>tr42(U^A1,_$Ac\*E>@rEna/29%=2*!6D3&*3?1+kOA/2B%A/ibjE2D[9C/M]:<
1,1[@0fLXS@<Z-oBd[V'DCd?bKIg&3D_*(uFY.98ASbp/+@sJ2CW3>+iddD=CgeGpDIakd@;0Lc
F_G3"AKYE%AKYN%@s)X"DKKH#+CT=6FD,]+AKZ&9@<-E3Bl5&%+Dbb0ALnsEF`))2DJ()(Ec5e;
DJsQ;BHVD8+EMIDFD*9L<-N7'De:,6BOr<'Df^"CEb0'$@:F%a+EMIDEar[%idd7f@<-W9:j$Pr
iddD1+CT.u+B!>kGp#^tBPqm0DW622@W-@%+DG@tDKKT)Gp#YsNGHM6/`M;JF_kJ/@<3PWDKK<-
ATJtBcESKj@rEeI+EqL5@q[!%@;BFq+@1-%BOPIgAKX9TDJ=B)F<E!XK-4*&D^cf;DIakd@;0Lc
F_G3"AK]<P+B)cg/g:`3:gnBeD/<d%/6>,9:b=IY/1b-N:ig+t?S#P80ek:<1b:F83ArTM3B8WF
/i#+71c-p<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCt/0\#,DJ*BsDfTDtDBNn=DfBW9@;J"J:gnBe
D/<d%+DGm>@3A6PFD5V8FCfK0+D,P4+Dbb6FDPM2Ch[g*/0K"ZD.7F"Ble!+B-:,eDJ*BsDfTD:
F!,OGEcl#-Ch4`$DfQt7DId<tASu$iDI[61+q4lUART(e@r!Vd;BRnW3A<!=0JGFC0eCVT+AcKi
/4!\q1,(I@2D$dE1c-a</iba>1GC^>1bg^F0Jk=42)['G1GpjH0J#Y1B5D:'BIk^[Yq/^[Ft?4&
G%GQ5ARloqDfQt"BOr;PBlY=^Ci*Tu@:LEuAfu2/AKXN<+AQ?fFD55nC`l#[D..<j@j"QZAnbad
%15pCFE1e@=$]b]/N>F8/70McEGR15/2An61,gd=1,(^>0ek:?3%Qj>1G1C?2`!BJ/1iV00f1^B
1,(770JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#g]l8oJ`\@;]dfDBNn=DfBW9@;J"J:h=`h@3B9*+CQC+
BleB7EbT#lC`m/(A0><$@q]:^Des?)Bk(Rf+Cf,-Gp$g=+EMIDFD,6+DBMPiEb&Tr+CT.u+CQBm
:.8)K:EW_WEbo8/87cgUFCAfn+EM7=AM+E!:hX9IF=]s\+>Gl62CpUA2D[0@cESKZDepsV/2/q;
3ArHF1b^a;1+kIB/3#I=3AE9E2)Hj91Gg^<2`*6D0J"b+cESofDeps6$;bDI@q9"!85^Qe2)R3A
2)m9D0eCVV+B;-E/4!\q0ekOA3%HjB1bpU;/i5:60fM'E1c73M2`WEH1G1RG1cI9O/1`?tZRf*N
@4Vip:hXE\CLLa)85^Qf2`!<B2`39L2_<7\+B;-M/1iD)/2Jn40J"t80J5(>1,1X?/2o:93&<BF
0fLX7/C(RQ<D@0Y%15pFDe3g#@qf@&844RT3AN?J1FtOH2_d$<<\ZNe1E\u'Cb/pE1,(F>0J+t4
2)6^A/iPdA1GCU;1c[QP2)[!;0J5=C2E3ZN/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><\ZNe1Fth3Cb/7k
@UX.cF(HJ5Ec5o8F(&lH+Ac`iASu3lBji-.@<3Q"DBNA*@qfLlF<G[=@;K@nF)PQ/@<?3n+Cf,/
Bl%L)@<?4%DBNk0+EV:.+AHEXBlmp,Ea`is@;[30BOQ!*DfTQ)Bl7@$ARloqEc5e;FD,5.@<,pf
+E(j7D/WrrEc*I>@<ithAR](cDf.0:$;bGFF`_PC/4`Y]1GUjJ/2T%?3&)u0]-'IY@k92_/M&b3
3AN-?1,U[=1G_$F0e>(:/hf%91GLU8/1f)Y/44;b/.Dq_Bl7F!H!r6p6m+3B1c@$E/3#UG0f1Fg
+B)on/70r8/3,=@2CpUB0J5:C3&ilW/1iV:/i>O@2Dm?C1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p2%
/44)bCh7$m+E2@>E,Tf+Cc`b9Bl7F!H!qh0F!+m6An>gfCh4`5@<?($+EML9EbTV<Ao_g,+EMID
FD,6+DBM;[Bl%?hDBNeAFD,T/DeF><GA(n;BlbD<@;06pFDi:2EbTE(+CoM2GA^u&+ELt*Ci=?8
+EVNEFD,5.6XaeBF^o)r+EMHDFD,*)+EV:.Gp$U*DBNb0G%De1DBO%7AKYDnFCfK/BkCp/%15pG
E+s?,D.+td;BRkQ2)6^B1,UmG/C(m`+B)cg/3tgA2Dm6G/Mf@?0e>+52)[!@2)?j=3&<QN3@la<
3%cm>2`3BK/6$%kBln&tDCd?a]J;$:@rEnB8T#YM@;'@sBe1B8+EVX4A8-."Df0!"+EMXCEd8dA
F!,RCCh+Z,AftM)@WHC/BOu3,@;]TuF(o];ATB=EDIIBnA0=]_E+s?,+CT.u+AucaF^ZgDGA(n;
Ao)$i+EV:.BlY>8@<,psFE8R=DKKe>FD,5.F)-%D@;]Tu@V'%fD.Oi2FCB32/g+,,ASH0-E+*cu
DKKqB@ps1i+EV:.D'2YhE+s?,+DkO0GA(],AKYJr@<6.#B-;;0ASiQ(DKKe>FD,5.F)-%^+DkO0
+sM5FFD*3J@;]U"+s:T@+E_a:A0>;mFCfJ8DIIBnF!,RC+Dk[uDBL,IATT&'Cb?nU+A$GnDf0,/
@:NecF`):P+EV:.+Cf)!Ch.QtDBND"@rH3q+B)r^F_kJ/@;]Tu9P&9RFD)e2DBO%7AKZ)/E$0(2
+EV:.+EV%+C`mY.+B)cgEc>`2/0JA=A0>T(+CT/+FD,6++EV:.Gp$R-@rH3q+AI!qZ63RnA0=Th
_RUdf@rHC,Bk]2(@qg$nFD5Z2+Dtb%A7]:W+=Kg!+CQC6Bl.R#@<*K6ATDj+Df-\9Afu2/AKZ&9
DfU+GFDku++DG^9FD,5.6Z6mY+A$Wj@;]Us/0K%JAU,D-ARfXqAKXccAS5Gg\KG<uA0=ZbAS5Gg
Z63(UDfTf2BdkYY%15pGE,TQ7E\(1178kco/1agV1c$s287cfm?S#P80et@;2_6^B3%cm?3ANEJ
/2K4;2)I3G2`E9C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?H1c$s>87cfm,"u]^@q]sqDKBo2Bl5&4Ec5o8
F(&lH+A$GnFD,5.Ci<flC`m8&@;KLbF<GL6+B3AqATMF#@V'Rm/0Ic'E,TQ7EZf(;+CQC%EbT0"
F<G"0A0?&0F(o*"AKYH)FED)7Ao)`D+CT)&F_#3(B-;;7+EV:.+E2@>E+O'3Bk;?.De:,#+EMX5
E\8OF$;bPMBl@m#/4`Y]0ekXA/29(C2)-X;3$;1/FY#ge/2/k:3AN*?1b^m?2(gR?/2]@=1-%6O
1H6p@1bLL=2E*?E/1`>-3%S$;FY!t/:iBoc@<Q'1844RU1,1OD2_6[<2D@*I/70N!F^lt0/70qe
/iYU;1Gpp?3&<BM1bpU62)m3D0KD'J0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r-F^lsiDf9D68TS]V
DIdf2E,ol9Df]?'4!7@<ATD4&@3B9*+EV:.+EqaEA0>T(+EV:.+@C'cCEQ2iCgh3lF!+1cDfTP7
Cgh3oF^\oo+D,P4+CQC/@<-!l+DlCFFD55nC`m2'@:O'qE+NHuC`mY.+E_dJATAo&ART_'Gp$O5
A0>i&Eb8lmFD5Z2/e&.aDerj&Blbgr;BReO1b:@92`<TGcESKl9kc.E@4X)f1GLj>3&r]O/28b;
2_6aD/ibdG2)[0?3&rTH2Dd-B3@l^4cESp#9kc-f$;bYW@<-('+@1-kFE1f+Blbgr;BRnR1,pg>
0JkRF1+^b(+AZKh/1iD)/2]%:2(UO<2_HgF2).!G/1ih@/ibdI1c[QI/1f,"/5Kbt/.Dq_Des-/
/4`Y]2E3EH/3#XG1bgQ,]HC-cE\'Lb/29+=1H6sA0ebF81G1XD/2B.?/i5C=3&`NB/M]%50JtgL
1GUL4/C(mZ;eL,%%15pMCi"6=/4`Y]1-%?K/2K4E1,^]/Z62YKD(I7i0K1gG1Fk4?0JY16/ho78
0ekR=1GUpM2)m-B3%cm?2DI3P/1`?tZ7JLWD(H,':iCApBl.9085^Qe3&3?B2DI3K0eCVV+BE2s
/3tgA1,L^E/MJn72_6^:2`*'?3A<'B0f:[F0e=n2/i5CF1H.*@/1f)Q/66J*/.Dq_Ea`NhBlJ3'
/4`Y]1bpmH/2]4=1-$mB2BY[fBe1he/M&\12`WED2DZsA1,h3L2_6aA/i#.<3&`TD/1`V9/5/cP
/.Dq_EbTB!+@pcdA9D`?85^Qb1Gh!@1,(I;2([%Z+B2cl/3tg@1bh!M.krn;3%Qj<2Dm$D1bLdF
3&<BO/29"72DR3L1c$[6/C(RQ<+0o#%15pPDe"'2DCe=V+>Pr61Ft=@1,h3EcESKZ9kc.E/20"=
3AW0>2)-p=0J519/28k9/iYUD1c[?C2(gX>1c[QP/1`?tYq/7:Be0]#:i^JnF`T*);BR_M0fCR<
3Ar`P/C(^I7qHNg5qF]J0f1m@1,:X>/2Jn70e>=@/iPLF1b^d<1,:I>0K(jM1b:1/cF5>pASit-
$;bb]G\M#'+@B^XFCB<4Be2bH+>l#2/4W;T2)R*>cESKZASs%d/28t;3ArHI0JtO80ek:70e>(7
2_HpB3&riP/1ib8/iGXK1cR<C/1f)O/43ud/.Dqa@;[Ve;BR\J3&E0@2Dm9L/C(XG7<3)n/M&S3
1GUsB0KCmI/2Jn;1FtC>/i#4<2E3WH/NGF?2)m?K3@lp>0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O[4FaeBe1H+@;[3%F!,R<AKX`d
EcYe7B5_<kATMo8De:,6BOr<-ARR,4GA(n;F*),:F!,UE+EV:.+Eq7;ATJu&DIal"@;p=2Eb0;7
F(&d!DfTnAGA2/4+D>>,+Dtb4/g:`3;IOHO/4`Y]0ekIB/29(>2`NA6ZlheXBe1he/M&\12)?d@
2(gjC1,([G/1ik72`<HJ3AN-:/C(UR7<3)n%16!AE+O-0/4`/O0f:aI2)$R@1Gq!J/70Mu@rEo*
/70qe/i,L=1,UsB0et^H1-$m;1c$a?0KD'N0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,@rEnm@;K@b
@<6]:E,ol9Df]?'4!7F0E+O-0+DGm>@3B2s@;^00@rc-hFEMV8+D,Y4D'2P]CggsbF*SmM@;KLr
/e&.c@<5jn@<3tj;BRbU0JtC<3&EKM/C(mN9P&,n/M&J)1G1XH/28t@/ho@?3A<6?1,^a=0K(pK
1Ft(.cFb]%AT'+/$;t;R@;KRfFD,A>85^Qg1b^g=3&EEJ2([%X0d'"uE\'Lb/29(<1c?j=1bpj<
1G1IB/2B(B/iGUB3AE3=0f1L=3A<6F1Ft(.cET)T87cfm%16!AF(&lu@:s^o/4`Y]2Dm?M/3#OA
1GUN,Yolh]BIlG#0fLmF3@cg>1GgX</hf791,^p@2`!6J1,ga=1+kFB0JG:?/1`?tYq/[iBIjT"
;IOWg@:EY_/4`Y]2Dm9K/3#LF2_Zf.Z62PU@4X\q0fLmB1b1F=0fU^>/iPdA1,^m?2D@*F2`*'C
1+k@:0f(dL/1`?tZ7JCa@4Vip;IsK`CiseM85^Qd3B/cF1c[HP3@rI\+A??b/3tgA0JGIC.krb9
3%Qd:1H$d=2)6d<3ANTQ1+Y.7/ibgK1,(^>/1f)O/50Vn/.DqaAThL(Be2eQ+>Yo1/2]@B2_<7_
+Ad,h/3tg@0ekIC.kin<2(UU;1,1=73%d$D1,q0K/2o1=2`3BK1b:1/cF,9#F(6a1$;tSNAS`ng
;BR\Q0f(@91c.!H/C(OD:NC/#5qF]I0f1a>0K:dB/2/\23%R!J/iGLB1c@9D/N>@<0JPIA3%QU3
cE\usEbR'6$;tSNBl"nbASuTuF`MVG/4`Y]2)I0N/2o:A3&<,2YolDFDCe()0f1[H2D$g@2)$R5
0J5%6/2Aq?/ibU@0K(g?/N,:83&<?N2`3-;/C(LO6Y1-d%16!OF(&m!@:WqZ@<6O2D_+FI+>G]5
0f1[;3&**B1+ZcT:N0tu?S#P82_I'M/2B%A/i#.:2_d'=1+k7?1cR6M/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S"ulBIk?+E+*WuF(c\8Ec5o8F(&lH+B!-!@;KXd+Co%+6Xb%XEc3(E@<3Q"+EM70DJ<]s
@ps7s+D,>#F`M%9De:+^@;KXfBjkm%@s)U0F`M%9@;]TuE,ol6Bl7L"F<FM$@;]e#BHVM>Blmp,
/0K.MDf]J4E+s6.AS#stDJ()9DfTV9De=*&DBNt2An?!oDI[6g+EV:.+Dtn+BQPA*DIal"ASbq!
FD50"+E(_(ARfh'/g:`3;K$YcDImuB85^Qh3&iZE0eb=@2E<>6Z62PHCb.k'1,(LC2(LC<1H$d?
/iGO;1GCgA1H7<K1Gp^<1bLXG2)-gC/95<FATDj'A0=QSFD5VD0fUmE+AcK_ATDX++B*AjEZd_X
FCB!(B6@c:cE\uhAS`nA4<R[9DIIX*EZfC6G%G]8ARlo3:2+3JDes>76XaJ7Bjl+%Eb-@W+AQW\
Derj)F!+LpDIIX*E\&>RATMg/DKBN$Ch4`$DfQsT3&*64F*(i2+Cei%@;KjpF_*!G%16!U@q]=[
BIl\P+>bc./2fCG2D!.\+@BRY/4!\q0JP=?3%Hm@0f1F:/iGU=1,1C<2)@6N1b:O=/i#4?1,q*A
/1f)R/43ie/.DqaF_bGpF=]s\+?))53%R'I1Gh$AcESKjB6#OT/1iD//ibg@1-%$@3B&ZM2_Zd7
1b^O?0f:sJ0J"b+cESp!B6#O4$<(ABBko7j;BRkR2`N?J1b^X>/C(^I:N0tu5qF`L0ebF90f:dE
/2Ah71Ft:=2_HsJ1c7$K/1iS6/iPOB3A<BC/1f)U/5L4u/.Dqb@:O+^FCf?(/4`Y]0fCaA/2B"<
2)?f/[NIkYE\'L-0JtO>2(LL<0JtC;/iG^@2`33G0f_*I0e>.9/hf4A3&<QG9OW$WDCd?a[Oa^e
E\%Y,;dj3F@q]=c@4XrI+?2553%Qd=0Jb^H/C(RE6#gor6")<"1,:RC/MJn71Ft=73&W<D1GpdA
0f1RB1b:45/i,IG1G^j=/1f)Q/4"8r/.Dqb@:We_@UX:k/4`Y]3&W`Q/28k72`*KFcFb8rAS3PG
/1iD//i>@71Ggj>2)$^D0KC[>1bL[?0f:mK/1`?t]IZljB.OK!;dj3FCi*a"Bko7j;BRqU0f1F9
0KCgG1b?qW+@1!f/3tgB1,(RF/MJk53@lp<3Ai?D1GLL=1c79Q1Ft+3/i,4B3&EWH/1f)O/4"8r
/.Dqb@:We_F*2V9/4`Y]3&39F/28h:1,h0DcE\QYEH3Tr/2Aq90fCU;2)@'?1+kR@/2K%:/iYgN
2_d0@/N#.<2_d$G2CpC1cE\ueEH3T>$<(ADE\'aZ+?)5>2CpR:0JkXC/C(RE6[<;q5qFcF1,:U8
1b^XA/2Ah51Ft=92(gaD2_[6H/2T%51,UsJ2`WE?/C(RQ6[<;q%16$BB45gt@<?0k/4`/O0eb:?
2`E9F2DmEK/70MnAT',,/70qf/i5=70fLm@3Ar]P2`WE@1bL^E2)[HP/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S"l^D_+XpE+*QoF(HJ5Ec5o8F(&lH+B)]]@<-3nFD,)*BlbD=BOr;]AT2'oBcq;%D.Oi%
DfQtBBOr<"BkM*jF*&ODART?sBl5&8BOr<1DfTZ)+=LZ7F)N1:DJs`:+CT=69lG/lF<F"qATD@'
F=A>@DIal2H#7#/C`mY.+DtV0Bl@ltC`m\;Bk1ctDe:+eAT2'o/e&.d@;0[o/4`Y]1,(C=/2B.?
2E!,3\fadhBe1he/M&Y00K1OB2D.!G3AE9C/1ik72E!QR0JtC4/C(gX:NC/#,#iSkA8-."Df0!"
+DtV)AKYT*Df$U_Ea`Ek@lbabZeLGlJKWUCfnA"ZfVmH#fWcQ?@<lH-@;IN1@:E]aJT<:aCh\!&
Ea`d#Gp"JU@;0<r-ms([DfTA9.3NP@+EV:.+D5CsDKI6Y+q4lX@;Kd385^Qi3&iTC0ekO@2)$T-
KHO*&B.PVc/M&_22)m-C2)$X;2*!HL0e>(9/iPU@1G^p?/1f,#/5Tnj/.Dqb@;^./DIG(e5u]F4
/Mf4783p3,:b=I[/70MuB4WW$/2An61,g^<3&!6A0eb490e>+71G1CB2)@-F/29+:0ebFD1G^R;
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL;eKYm9jqj[ATME*E,ol9Df]?'4!7I1DKBr<@3B9*+EV:.+DtV)
AKYo'+EV:.+DlCGBQ%^*B5(jaC`mA)@;^00Ao_g,+EVX4A8-."Df0!"+AH9\FCfN)+D,P.CER_-
Ch7Z1FD,*)+Cei#EbT)q+EV:.+EMXCDIml3De:,6BOr;VDgH=ED.R?gCh\!)Bk&9-ASlC&ATJu4
DBNV(EZf%,@:Uu"$<(ARB45j485^Qg2)R0@3&WNI3%W@b+B)cg/3tgA2`!BK/Mo7;0J"q23&W<C
2Dd$B1-%9J0e=n51+kRI2`NQL/1`?t\1CQgD_)>);dj]\DCe=V+>u&20J#1?1H.<FcEn]bATB=f
@4X,l0f:X81,LjB/2Jn51+Y1<3%d-I2`WcP/2B%73&<QM0Jk=HFDPB,+@C'YChYFOcEo,nATB=2
$<(GGE--,CD(J4U+>G]40e>(72*!KE2)?@DEbR'j/2/n:3&3'?1bgs@1bLI;/2fL@2)I0F0Jk=4
0f1L=0JkI<2_7X2FD5VD/2]477<3)nAo_g,+EV:.+E(_1Des!,AKYK$DKBo2Ci!O%Bl@l3De:+j
@qBV$Ecl4A6?6LPA7]XfF`M,/@s)Vt$<(GJART[385^Qi2`ETF0ekID3&)u0Z62tTB.PVc1,CU?
3%HaD0JtC:/i5C91GgsA3A`NL2_lp>3%cmE1,h0M/1`?tZ7Jg`B.OK!;e'KPA79L085^Qb2E36D
0fM*DcESKZ@<3tO/2/b70Jt@<2D[*>1+k==/28h20etXH1H6pC2D-jC2`!6E/1`?tYq/7NF"@b-
;e9H]DId/u89nWSF_r[#;BR\M2`!!?0JkXE/C(UF<+0o#6");u1bpj@.krt=1+Y462`N?H2(ggD
1H.$K/29(92)I'G0f1F4/C(UR<+0o#%16$FB5)6785^Qa2)I'>3&ilU/C(XG6Xb$e/M&J)1G1I@
/2B1;2*!WU2)d'E1G1RE0JP79/4"Ao@<3PYDe3a!/1f)S/43ie/.DqbAS5^pF`T*);BRhR1Gp^B
0ebOD/C(RE6>pcn6")<!1c$mA.l0.>3%Qj<0Jk=90fUd>0f_'K2CpXD/i,1@1,Ud;/1f)Q/4+8n
/.DqbBOPa/85^Qh1cIEG3ArfR2_<7Z+B)oa/1iD-3A`EE.ks";0e>.61H@!A3AiEC1,L^A1Ft7?
/hf"93&r]E/1f)O/5p1m/.DqbBOPad/4`/O3B8fJ3@m$F2E!BC?Q`$RD_,6H?S"2i0eb.52_cp=
2_m0E3%QX9/i>CE0K1d=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/50Vn/0[o!CM@j3@;]d%E,ol9Df]?'
4!7I8@;TEqBlbD*DBMr"A9B#2Blmp,@<-W9FCfK0+Dk[uDJ=!$+CQC6D..6s+DbJ'E$0(>+D,Fu
D.P7@F*VV3Des,t+E(j7FD,5.Ch[NqF<GL6+EV:.+EMX5E\8OF$<(VHEb]#r/4`?/+?);;1GLF>
3A`NH/70Mu@rEo*/70q_0eP7=/2B%</ho:A0K:m?/MT4;3&`]P0Jb780JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL;e'_s,#rMpFCeu*6#pCC+@U-]Eaa'$F!,FBDfBW9@;J"J;eTT[C11cuBlbD=BOr;rF_l/B
Ea`c,@ps=jFCAu.De:+lDJ=3(A0=0Y@:C?JD/"$!FCfME+CT.u+Cf>-F(o/rEb/c(FD,5.@qg%1
+E(j7CMn'7Ch7-iAKYN+AKZ)5+DGq=+DkP)Gp$[/F^nj%Bl@ltC`m5!DKKH1F"AGJDKBo6FEM\:
F"AGNF`V,:D0%6NCh[@!@<-'nF!+n/A0>PsEbTW(B4W2qASuU$EcWiW%16$I@<HBp/4`Y]2Dm6K
/3#LI1,gc0]-($^D_+1_/29(>1H$g@2_[-@0eP@>/2B+>/i57;0fCsA/Mf=<0ebCC1,LO5/C(jY
;e'_s%16$IASc'hCFi"S+?)#/2CpjD1bpa9cE\QdH#bH%@50;f3&NBE.l/t:1+Y462)6^<3&3*D
0f_6Q3%QjA/i,C@2E!NG/1f)P/51>0/.DqbBOu3mFCB&<85^Qf2)?dC3A<6?cE\QYEbR'j/2/e9
1c?j>0Jkd@1+kIA/2B1;2E!6C1c?m?0J5==3&!-C/1`?tZ7J:^Be0]#;e^#U/4`/O0fUmH1,(7>
2)7'F/70MuB6#P1/70qe/iY[=1-%$@2_m'G2_Zd71GURC0f^pF1Ft:80f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r,B6#OnBOPdeBjkm%E,ol9Df]?'4!8BO@;^-/-YI@6A1&L6DBO%7AKXEcAKYetDJ+*#B4W\)
$<(YZBm"JJ85^Qc1c[9A1GUaC3@rI\+@Ak3/3tg@2Dd9G/MT.?1Ft+4/i5C90eb=71,q3I2)Qp:
0fCXC0fCa@2CpC1cESof9joR^$<(Y\F_kJ;85^Qi2DHm:0ekCA0eb0(\fa:YE\'L-1,:XE3%Zg@
0f1F=/hf+51G_$D1c%-G3&E0<1bLO=3&!3J/1`?t\h$-eE\%Y,;eof`/4`Y]3&`NO/28k80f(^=
cEn][EH3Tr/1iD//i#@:1Ggm?2E!<J2)[!;0f:RC1,([C2_6L2cEo,gEH3T>$<(kZ@<-('/4)`T
0f1I=2)RBF6:<=Y1bCOA2*!3p+AcW^/70r8/3,=A3%Qj?3%d!I3B8rW/28t62E3]Q3&N6B0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL:h=8j,#E2oBldr1E,ol9Df]?'4!8ELD.R6#@:jUmEZe;!Cgh?uF"AGB
+Du+@AS`JuGp$%-@;]e#`I_NB+A??`/g:`3;fHG\@4XrI+>ki12CpaD1cI6BcESKmBlYaj@4X,h
1,Ug=0ekC:/2/\:3%Qg=0eP4A3&3<L/1iS2/ho7=1GLm@9OW$WDCnA!@:`qe/OElTH#.D:Bjkm1
/C(LO<bZS*,#i5e+A?3cBl5&8ATDW1BlbD*+EVX4DKBW&FD5Z2+E(j7FD,5.7ri0PCEUrUc\0TF
c\Ki#c[m9`BPCsi+DGm>@3BZ4@;^.&@<?4%DBNk0+@0dY@:X(\DBO"6F^fK0FEJ^1Ch\!&Ea`d#
Gp%<OBlnH.DBO"6FY.'F/Tkk]FEKEG/0JA;C`mS+@;]dsB0%/H@<*K/Aft`,@;0U3+q4lXFCfK5
ASuBo@q]s883p3,:b=RV83p3,:b=RV?Q_XPA1V(=?S!oc/i>I:1Gq!A2`EQK0KC[@1+kCA2*!TO
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"K\A1U,kFCSu,E,ol9Df]?'4!8ELD.R6#@:jUmEZe=pAKXon
@<-C6+AQW`BQPA+Gp$.%DI[6qF<Ga8DBMGfB4rn,$<)%eBju"$/4`/O2`3QT3%QmB2E*HD?Q`$f
DCf-G?S"/h0Jb771G^X?2DI*L3@lsB/hf.@3&*0>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,/0[H%
Ddda%@;[3,Ec5o8F(&lH+DtV)ARlolAoqU)+B*B&Bju!n/0K%JAKYW(A0>f&+EqO;A9/l-DBMko
@<Q?p+DlCGBQ%^*B6c*P;fm%o@W-90BlbD*CiaM;@3B&n@<,ddFCfJ8Bl5&8BOr;qDf9D6:i^9g
NFa5HH6?a,G&D#3AKWBgEc5B.Bjkm%<+0TSF!,C5+A?]kB-9KQD^cf<Gp#\%@;]Kr6?6mV`.op=
@E#s'Ea`j"`.orh%16$V@;KjlBl5Im;BRnY0K(I:0JPRF3%W@[+@KdW/4!\q1,(LE2CgL>2)Qp@
/iP^?1GCgA3A<HN1GC@72(gmD1,(XC/95<FATDj'A0=QSFD5VD0fUmE+AcK_ATDX++B*AjEZd_X
FCB!(B6@c:cESogAS`nA4<RC5@rH0lF`S[GAThX*F(Jl)-r+Jd@rH1%+@BRI@qf@nDfTD34s3U7
@rH0lF`S[+AStpuDfRBOEb0<2Df0W1@VfTuAoD]40fUmE+EMX5EZek#FCB!(B6@c7+q4lXF^fB"
/4`Y]1H76I/2T:C0K:W/^E?3]D_+1_/20(@0et753AiWE1G1O?/28t=/i#CF2Dd*=3A*9O1,CUD
/1`?t^FW&iD_)>);fub^Bl#=k;BRbR1GgX>1cR3J/C(jM<b6(u/M&S90K:a<1c$mF/2Ah51Ft7:
2D.!M3&ruT/1i\7/i5@>2)mTI/1f)Y/66=u/.DqbF_kJu@<=%k;BRnQ2`N?K1GLmH/C(RE9R1Y0
/M&V92)mTH1GUdA/2Jn62(ULB1bL^C2*!EO/2K%62E3]S2)d';/C(RQ9R1Y0%16$ZEc#5985^Qf
1G_!A2E<]M0eCV\+BE2s/1iD)/2St52_6^=1bLI91H%!E/1ib40JG1<1c6g8/C(dW<bZS*%16%P
JSeh@@4Xr;+>PW.2`!HF0ebLF1,LOh+Ad,F/70r8/3#7>2CpX>1bLXA2)$aC/1iY4/iPRF1cR<C
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCR/5pS'+A?3]CLM*'E,ol9Df]?'4!7J?JSeh@@3BDu@;^-/
E+NHfAKY])+EV:.+B)ulBOP^gF(HJ1@;]_#@:s.(%16'C@VKp885^Qb2)I*?1,:[C3@rL,1E]J6
Be1he0JkUH3%H[@2)m-C/ho@;2_m!B2D?gA2(UX<3ArTI2`3-;/C/i&/5L;#/.Dqc@;0Lc/4`'+
/Pn#U0J#a\<%Uou1b^If+A?3R/70r8/28k31Gp^>1GpdB0et^H2(URA/i5FE1H%-B1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/50J^/50c"BQ[a$Bjkm%E,ol9Df]?'4!7L2Bkq-"D.R-nF!,F5@:NjkBl5&8
BOr;[Bln$2@;]dfDBNb(DJ+*#B4W\)$<1GJH!tT'F(fK7/4`Y]1c7!I/2]@B3B8Y:LEKSk@4Wu]
/M&\12E<<C2`<9G0etUD3@m!G/iP^L1b^g=/1f,&/6,DQ/.Dqc@;1"$/4`Y]1c[9K/2f:<2`<3H
+@L6Y/1iD)/2]%81Ft7@1G1XF3&riN/2f@<1c%*J2`*':/3#1KEa^L.$<1GMBln#s/4`Y]1Gq'N
/2T1<1,gc0\KFmH@4X]Q/20%@3AN*A3&!->1G1C;/28q;/iYO>3&rZD1cR*A1bgsF2CpC1cFGK+
9joR^$<1GOB6%E3=$]b]/M]%3=$]b]/M]%3?Q`0VB.RC@?S!od/i>L;1Gh$C1c[<M1,CI93%d!I
2D@'L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##bB.QAlChI0sBjkm%E,ol9Df]?'4!7L2DJ*uu+DGm>
FD,5.F*2GBASl!$@qBIfF*),)C`mA/A0>u-@<<W'@<-10+@:3eB45h%+EqaEF(f9,ARmD&$<1GO
Bji,MF`VYF@;KY!/4`Y]1b^gJ/2]+@0JP-(]HC3K@4X\q/M&\10K(I:2)R!D3&36H0J#%8/i5RK
2).*B/1f)Z/6,DQ/.Dqc@;]df+@:!eARTChF"Bj[+>bc.1FtC;1H.'?cFY3!9joS=/1iD//i5F:
0f:d?1,h$D3Ai?E1+kRA1c%!I/1`?t].?rV@4Vip<+0`W@s)?6844RY1H.3L/2K7>1bgOg+@BRX
/70r8/3#7:0J"q52D.!I2_d3M/1i_9/i#=A0f1^<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43id/4+8k
Bm+3!DBNn=DfBW9@;J"J<+0`W@s)?*D.R-nF!,%9ATDZsC`m\*FD)e2DBMGl@<,doBcpi%A0>o(
E,oN2ASuU2+EV:.+AHQdCO%%(@<iu;BQA$6B4rE3BPCsi+EV:.+D,>.F*&O=DJ3HfBlmd$FE8RC
Afu2/AKXEMEcbt;@<-C&G%G2,@;]Tu@rHL+A0>o(FEMVA/e&.e@<,e&ARm>_;BRnU1,UUC2_m<O
/C(RE6#g]l/M&V:1c@-?0ebCB/2Ah:1+Y1@2D-jF1c[9J/28h22DI!C2DQg7/C(RQ6#g]l%16'C
Eb6jn;BRbN1c[*D0JtUD/C(OD6Z-Bb5qF]L0fCm>0KCjB/2Jn91Ft791bLL<3&i]R/3,=;3&NQM
1b:1/cE\ugDIY4,$<1GZB4Z0n/4`Y]0ekLB/29(@1GLF83?V:0FY#ge/2/k:2)6[;1bq$A1bLR<
/2]=<1GCR<2DZm>1bLUC2_m<G/1`>,3@n-<FY!t/<+T]ZBl7K585^Qd1,([=1b^XB2_<7_0d&i$
@k9ns0K:dB1+P(<1H@!C/iGX>0etO;0JtX@2D?[:2_I!F2`NQI/1`?t[P9=#DIY4,$<1SO@<=%k
;BR_M3&W<D0JbOA/C(mN7qHNg6");u2DR'B.l&k90e>(43&`BK2(ggE0JP:;/2At52)-mE3&<*:
/C(mZ7qHNg%16'GEb/]kCi"62/4`Y]2`3TS/3,[D2E!,4M',`0E\'L-/M&_22_Zd<3B/WO2*!WP
3%QX:2D-aF3AiTL/1`?uM(DS<E\%Y,<+U5aCb/+C<%Uou3@l^g+@1-j/70r8/28n41,^[<0eb47
2E3QP3%QjE/ho1:2Dm3?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"E!/0[Z,Ea`NqBcqA8DfBW9@;J"J
<+U5aC`mS+@;^-/<GlMoATDj'+E)9CAThX*H$!_6DJ()#DIal!AS5^pF!,[@FD)e=BOr<&ATW$*
EZe=iAh5'HBOr<&@<6N5Ch7^1ATAo-DBO%7AKXNT@WH%(+CT)*BOP@]F=naH$<1\MASl.!/4`Y]
0f1dF/2Aq93AW54Keac>EbR'V/1iD//iYR:2E3<K3&``R0J"e30J54@1,CaA/1`?uKeb2JEbR'6
$<1\]@UX.*85^Qf1-%'?2E3WQ2D!.Y+@L6Y/3tgA1b^aC.lK4>1Ft=72E*0B0ek:73B&]R0e>4>
/i,FD3&NEA/1f)O/4=Me/.DqcBjkdk/4`Y]3&WQN/28k70etL8cE\Q_Eciob/1iD./ho+41Ggd<
2E!HQ2`<3=1c?sG3&EKO2CpC1cE\ukEcioB$<1_JDJ+*#DCe=V+>Gl20J"t;1c7!=cF+ip@<F+e
/1iD./ibjA3&E6E0ekCB3@lp?/ho1<2)I-@/1f)T/6$&#/.DqcBjkn)Be2eQ+>c&91FtF>1bpj<
2]tM/@4Wu]/M&b31c$[;3AE-G3AW?L3@m'H/iPdE1GC[;/1`_26ul]e%16'KD/"#A844RT1cR<I
2_6pB2E3WH?Q`-`BImLA?S")f3&rNF1cI$A0fLjJ2CpF71G1ID3ArZO/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S"ulBIk>o@;]^o@:WqjBPAT.Ec5o8F(&lH+B3&lBlY>5ARTIt+Cno$CMm^)F!,17+@9XW
B45Uj+DbJ(B6@WqALns4Ci"6)Bl7Q+FDi:DBOr<-FCB24@V'7kB-:epEZee7@<iu0DBO%7AKYMl
EbfQ(F)rIBAfu/6@:Nk$+q4lYBle*)F=^KZ;c#&#2DHaa5uUT30fCa;?Q`0fE%G?I?S!oc/iP^?
0etX>1G^sL1c?m:0ek:<0JGLH2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F`8m+DfTc+@ps6tE,ol9
Df]?'4!7L:F)5Q4+DGm>FD,5.DIIBn+E(j7@3BApCLnW&DBO%7AKX9\CghB-D/XQ7FCAm$F!,C5
+AHcpDe!9q/g*`-+Dk[uDK?qBBOr;qEbT&q+DG^9FD,5.6#C%VBkM*%Cgh3oF^\oo+CT.u+DGp?
BlbD*F)u80Bjl*pA0?)1FD)e*+D>=pEcbc2Deip%+C\njF`_>0F_i15Bl\#4Bl5&%DBNA*@qfLl
F<GC<@ps0rCh76jDIb@/$<1_]@<ZF'/4`Y]1c76D2`3<G/C0"m6#L3a5qF]E1H%3C1bgaB/2St5
3@lpB/ho@H1Ggj<1bgU>0Jt[E2_6^<0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,PKe,N-A1U\oFCBB-DBL?9CiaM;CMn'7DBNA/+AHEX
Bl7?%De:+kATVj5@;[M:BlbD*+EM+9FDPN*ASuT4Bl5&2DfTr5ATDZ29lG&j@q0F"@;]Tu<DGt]
6Veh+DfTZ)+@p'aBlmcrAKXocFCd'I883-eDfTQ%@;Kb*+DGp?G@>P8@;[3%D/aE6FCB'/+E275
DKI">AftT%DKK;sF<G%(FE_;-DBO%FD]iP(G%kc,H=:o0Df0V=-rY(nDJ=0*+CT.u+@1$V@OWF.
DIal3GAeU6Df0Z2DIm^-F!)l"F`MD>AKYE!A0=0MEbT#l.3N&2FCfJ8FD,5.3-8gV@qBP"F`Ma[
%16'QC2%K8=$]b]/M](4/70MgEbR(3/2/k90f(C:1Gh*C0ek:>0e>1;/iYRF0JYX>/M]+73&*EO
2`N?D0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7<3)n,#iJqBl"o+F!,R<AKYl!D.Oi.Afu#0AKYo'+EV:.
+AH9i@;[2uASH7#ATJu7ASbdsARlp*D]j(/Bl5IEF*)>@D0%6N@;]TuAnc9s/g:`3<,ZSeD..<5
85^Qf1c@$=2_d3M0eCVT+@B^X/4(mB1c%-M/N,:?0J"q21Gp^=0f^jG3ArQO2CpF<0J5=@2`3?M
/1`?tYq/7RDCc5(<,ZY_FD5l2/4`Y]1c@$J/2]CI2)6^7+@BRS/1iD)/2]%>0J"q<0eP7:1-%?P
/2oI>3A<<L1Gp^=0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(F?ARoLsBl@l?/M'7tD(JY)DIIX$F_DnA@<3Q5BOr;PH?<_.+D5V'+E(j7FD,5.;fut1
%16'QEas6.@<*ni;BRhO0J#1<3B/S8^E??o@k9ns0JPCA1b17?0KC[@/i#F<1,^a@1cR<M2Cpj@
0f:mK1H-j9/C)!]:ig+t%16'WBl[d&/4`'+/Pn#T2CqBb<%Uou1H$dk+@B1I/70r8/28n41,UU;
3&iNG2E!<L2Cp[A/ibXD1G^g<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43HU/0[Z+Bldr1E,ol9Df]?'
/g+,9Bl[d&+Eq78+EV:.+CTD1F<GL6+EV:.+D>n8FCfK:@<-C&DfQsiBl@m,+DkOs+@C9gBOPUk
C`mY.+A$TfF(c\4AS5RlA1SjIBQ##;@<3Q5F`MA2A0>T(FDi:1+D>\9DIal!Gp%3BAKY`!@;Kk)
F!,('Bl\JA<F]]aA7]1c@V@A<%16'WE+pjo6m+6@0K2!C0fLdH2Cr2X;Isr$?S#P82_Hg?/2]7:
3ANTP2E*0=2)6dE0f:pH3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r+ATTII6?6L\Bl%KlDBNn=DfBW9
@;J"J<-<.o+DGm>FD,5.DIIBn+E(j7FD,5.D/XK;+E27<F_ku=F!+%lA8,[fDJsZ=+AcWfE,9).
Ch\',DJ()1DBO%7AKYPmF*(u6DBNG-@<6N5De:+jDfp/8+@0jUEbT#l/0JD5AoD^$+EV:.+Acus
FEM5=ATME*@<-C&G%G2,Bl5&8BOr;@2KWUT@qBP"F`Ma[+q4lYF`>6n/4`/O0ebRA1cHsD0K(aE
/70MeEcip?/28n82)m0G1b^X82D.!M/29+B/i5C?2`E`J/N,F<0JYC;3&iHE0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL6ZR<#:gnBQB6@X.@;[3,Ec5o8F(&lH+B3K&_kS>gF!,C=AKYo'+D,P7EZf=ABl7Ep
E,9).B5_=%+E(j7FD,5.7s/6\@;]d%6Z7$_DeF!+Gp$g=+E27<F_kK,+AcKe@:s^kH!tS5AoDL$
Ci=?*+EV:*F<G7.CiErr+EV:.+EM[EEb0*!+D5V'+N'=MD..<mFWbdE+CfG'@<?''FD,5.<GlMo
ATDj'/e&.eF`M&-F"Bj[+>Y`32(UOD2`3NFc[d38F`8lt/20%;2`30B1bgs@1+kOB/28n7/iYgK
0JbX=/M].81GCXA1,LO5/C/ku:j$_.%16*NA79.&85^Qd3&EKD1cI6I0eCV\+@pcd/1iD)/2Jn=
0J"q81bLdH1b^UC/1iS/0f1XF0eb.0/C(dW89nVp%16*NCisVH844RT0JY@;2_6gF1-%'??Q_^I
DCf-G?S",g1cHs?2`<9D0eb@?1b:493%d-D1H.$B/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QUDCeUu
FCS`nEc*!kF)59&A9/l4Ec5o8F(&l;+B<2nF`&==ARTIt+E_`JDfQtEAKY])+EV:.+AccoCLqO(
+DbJ(B6@WqAKYo'+EV:.+E1n1E,9).De:+gBlminBl\)68TS]VDIdf@%16*QF_bE%BOPU+85^Qf
3&NND2`EEL0J(MS+B)il/1iD-2)I-G.kik:2CpU92DZm>1H$j>2E!QS2Cpa=1bppH1-$m:/C(LO
;e9u#%16*QF`M,;DJ=3(/4`Y]1,^sI/2K(A2)[#3K-3NU@4Wu]0K1[?2_?dD2)[!A/i5R>0ebI;
1bq'M3&3$:1,ggG1Gh'I0J"b+c\!c99joR^$<;+hCFi"E+>P`-2_Zs;3ArQM3%SDZ;eKYm?S#P8
3%d3M/2B4A/hf"=1G_!A0fCX@2`*9L3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,B4WVcEa`s%+E2@>
E,Tf+Cc`b>Ecl.?G@>P8@;[2rDI[BlDKI"2BlnVCDe:,6BOr;bF_t]1+CT.u+@9LGH#.D:Bjkm%
@qg+#Ch\3(FD5Z2F!,17+AHEgDfBW:@;T^e+EM7=F^]B'A0>;sDf021@;[2rDI[BlDKI"2BOPdr
AS`K-Afu2/AKXEaE+j9#FCfM9EbT].EZf(6+Dl%-ATDZ?A79a+8TJ6Z/e&.gAS5F&85^Qh0JG44
3AE9I1+^_U+A@'$/1iD-3&<HQ.l0.A2CpO70Jb782`WKG1Gh$H2(UOC/iPaG2E3]J/1f)O/51>0
/.DqeATDL,@<?'385^Qi3AW??0ekR?2`<3A1a#)%A1U"t1,C^@1Fk7A0f1F=/i#151Gpp?3&36H
2)[!A3A*'C2DI3N/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f<NQBln'-DCdM!/4"/a/0[Q(Df$V=BOr<&@<?4$+<i"1ATDL,@<3V:/0K%TF`_:L
+B3#c+CS_q@<?4,AKYT'Ebuq9ARTIt+<i"RBOu3q+EV:.Eb-A-F!,RFF`_:@+tb&K$<CkYA7]Ul
@<?O(GUuB`+>c)71+Y=>2D@*AcF"cqBlYaV/28q71,:@70Jtg@1+kOD/29.B/i>IB0f:m@0eb4?
2*!BJ3@l^4cF#3(BlYa6$<LYW@<=%k;BR_R2`E9D2)R6F/C(UFB4Yp26");u2_m'A.l&h:3@ls=
2)$R90eb461GCaE3@lp?/ibmH1GLd=/1f)R/4X8g/.Dqf@<ufB85^Qc0JkI71,h*H3%W@\+@C'`
/1iD,2)R*B/Mf7@2CpX:0et:>2_I$F3B8uW/1iY8/iP[J1GLR7/1f)P/44>l/.DqfAU7p*/4`Y]
1,_-K/2K+>1c-c/Zlh_1@4X]Q/20":3&E3B2DR*?0ePFA/28h;/hf:E3&NB@/M]4:1H@6H0JG%/
/C(UR6VUu?%160ZEcP`//4`Y]1G_!A2)@'K/C([H:hXDk6");u0ebRD/N#C?2(UR:0JY162_HdE
2DI-H/1i_:/i#7@2`3QG/1f)T/5U"k/.Dqg@;T^hBl/!5@4XrI+>tu32_6pD2)-p=cFbkS;e'_s
6")<!2Dm3L/Mf@?1Ft=70JG%52)6dE2E*NM0J"e33%cmA2`!EI/1`?t]J1s9@rEn-$<V"UALpA?
+>Gf21bgm>3AEKN1+ZcT9R1Y0?S#P82D-[?/2B1=/ibU>1c70B1H$jC2)[?H2CpU;0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r%H#bH2@;]goDJ()2Ec5o8F(&lH+BW>kAKWDa^9Zj`N%#l`F!,R<AKYW(A7T7m
F!,C5+EV:.+EM[C+DG^9FD,5.6YL1OATME*D0^5:Des?)Gp$O5A0>;sF)N1AAT2[$F(K62F!,R<
AKYPmEboH$F*&O5F*)G@DJsB'EcW@3DIal#AThX$DfB9.F!,C5+CehrASu$eEcW@;DBNA*@qfLl
F<EqaBl7?3%163[@;]^h/4`Y]2)@*E/2fLI1GUN,]-'FYD_*Ik0f1UC1b1C@0JtC</ho=:1,1U<
0KD!N0et::2D-[C3&<6H/1`?t].?9eD_)>)=_2+d:iCDsATDL'E\'aZ+>to42(U[H3&iZEcF"cj
E+gdS/29%;3&<-?1c-s=1G1F=/2B%=/i>UB1H.-A/Mo(<3ANHH0J"b+cF#3!E+gd3$<^qN+Ad)m
DfRC";BRkO2)[!E3AifQ/C(UF:N0tu/M&V70f1[<0JbO@/2Ah:1Ft:<1G1OE2Dd-C/1iY12E<TM
1,CI4/C(UR:N0tu%166PCh.[+/4`Y]2E*TU/3#LH1,:E+Zli@CBe1he0fLmD1+P=B1Gp^?/i,@9
1,^p@0Jt[A1,^[C2D-jH2Dd<I/1`?tZn,3OBe0]#>%);_@;%2_;BReS3&rNJ0JP=C/C(^I<bZS*
6")<!1,1dL/MJk80J#"43&rNE3&E6J2`<KO2CpF6/iGUG2`WZF/1f)U/66J*/.Dqi@<HU!CFi"S
+>GW-0e>%=2)I*?cEeW^EbR'V/2/k;3%up=1G^a:1+kRG/2]F?2)$sF2D?[60f(F>0K:pE2CpC1
cEf&jEbR'6$<gk]Bkh("@4XrI+>br40J#(?2`3NFcE\QnBlYaV/28k:0K1L90f1d>1G1OF/29(B
/iGXE3&3BC0ePCC1cI-J/1`?tZ7K$jE\%Y,>%h>^B.QSO+>Z#31Ft@B1Gq'Ac\4(r89nVp5qFT=
1bLL;/28t?/iYaL2)R?E/MT(73&ENO0Jb72/C0#)/4b%p/.DqiBjtLe/4`Y]3B/iH0f:[G2_<7_
+@U<b/4!\q0JbF@3%ZgD1c[*D/iYO91cR*J2)mEK2CpF>/iYRG2`!0>/1f)T/4FSn/.DqiDf]c(
/4`Y]1c%!J/2]7D2_lr0Zli%RD_*Ik0ekC>0e5"51GLF9/i>O<0fD!D2)7*E3&rNF0J54<1H.$J
/1`?tZn+m^D_)>)>'4:cDImWsASuX"Be2eQ+>l#40e>7=2DR$=cET,I9PIre6")<!1c6sI/MT.;
1Ft:62`3-A1,:I@0f_-J3%QX92D-[?0fM$M/1`?tYqdk(BjrV&$<hR]ASu'qBOP[s@:Eq%85^Qf
2`N`I2`<HJ1G$hX+A?KY/3tgA2)@*I/MT(=2_6a;3AE'?1G^XC3&*9L3%QX91bL^H3AiTN/1`?t
ZReda@Oqrq>'4:cDImm!BOPadChYFk;BRhT3&N6G1cIBO/C(OD9PIre/M&J)1+kI>/2At@/i#:=
2_m3@/NGF>3&3KK1b:1/cE\upBjrV&$>s9n@:*PVCij)mFC/lq1,gd:/I`%qF`_;8E]P=4/g*T(
E+NoqCCLV]ATM@%BlJ0.Df.TY<+oue+DGm>:-hfE>UOS8De<Tq@qf@f+Dl%8DBNn3@<6"$+E1b%
AM+E!CLqd8DfTB03Zr!DCh[j0ALns?F`(W./0JeJDf.*KE+i[$ATKCFF)Pl'E\&>SF`&`QFDl80
C^g_nBln0&3Zq0`;aDNX+@KdWFC?:k%14[=/I`$r$6pZt:-hfE+=KunFD5Z2@;I&PATD^,@<H[+
@ric$DIakgE+*6f+@0OTBl7X+FE1f3Bl@l<>psB.FDs8o06_Va/oG*=@4l22FtY9R$4R=e,9UH@
+@^B_A0=<^E+NoqCFgSu;as+s:i'QXATV@$Gp$%2F*(u1F!+.b@W-9qFDl2F%13OO,9TNkF*)>@
Bk(Rf+BDoeF_,V:De:+[AScHs+B0I3cBM9W+:SYe$6pc<6"FDCFCeu*Ao_g,+C$*[Bm+&19keE[
ASuC"F_r6g@;^"$+E(j7;f?J\EZde\Ch[j0ATM*#+C&,>F)Y].@;?uoDIakaAS$"*>[8H]$4R>A
BOr<)Eaia)@;I'*Df]W7Bl@m1+E(j7FD,5.;fut#@;]Tu9lFrf+ED%5F_Pl-A0>?,+D#&!BlJ-)
%17&pARoLbFD5Z2F"AGBEb-A'@;KFrCghEsA0?#9Bl7Q+<+U)jATMs6Bjkg#7!WZYD/!KgC`l\k
D.Oh<<(&/E$=[RV@<HX&+DGp?BlbD*+E_R9AoD^,+EV=7AKZ&(@;KL-+@pEpAThX*/0K.TEbo8/
FD5T'+F7sDATJu&DIal#@;0P'%16ocAn<)nEb-A&@<6!j+E)-?<GlMoATDj#C`l\kD.Oh<<E(D"
+A$GnDfTB"EZfIB%16T`DK]T3F<G.)Ch[j0AKYr4ARoLbFD5Z2F!,(8Df$Ur6m-Si+B;Al+EV:.
+Co1uAn?!oDI[6#@V'Y*AS#a%FD,6,AISugGAeUGBl.E(F(8WpATJu2F`VXI@V$ZtDJs`:/g+,,
AKYr#Ea`frFCfJ8A7]S!@4bG$.*e&V.3N>G+EV:.%16NaBln$*ATVWr+Co1uAn?!oDI[6/+DG^9
F(Jj"DIdf>+C\o(G@b?'+EV:.+EVgG+CT=P%13OO+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<\so<$4=H<(%i\+B;AM$4R>=@<6N5G%#30ATJu4Ag#B`<$5[ZDBND"+Co%oF^nun+D,Y4
D'3q6AKYZ#F*)>@Bk(Rf+ED%'DfTB0/g*`'%17&_Ecc#*F_kK,/0JVKDIdd!A9/l3AftYpCh[j0
AKYo#F(KB8@<?4%DK?pK@W-@%+EMI;@<*K!DIal+F`(W..3NhGEb,[eEb/a!Eb&`l+DG^9ARTUq
Gp#OuEc5o.@;[V=9ke-KCh4_X@<6O%Ec*".DIakWBPD?qF(HJ&DJim!F"@b-D..=)F(96)E--.P
+CT.u+CehtDf0VK+A$GnF)Yi8AKYo'+EV:.BlY>:ASbdsBm+'(Gp$pAG9CjFARfFqBl@l?%172j
ATME*A79Rg+ED%4Eb0<'DKI"CBOr<)DJXS@AThcuASu!h+D,P4+EV:.+Eh10F_)\6Ag#B`<$6.#
BlA#7FDi9V2D?fo$:@67+A$GnFD,5.@qBP"F`M2-F!,(5Ci"$6Bl7Q+FD,5.Bl8$5De+!#FD5Z2
+E(j7FD,5.FCf9"F(9--AKWC2Bl[]l%14gJ0KC7C74Bc1FD,T8F(&rsF!,C5+D>J%BHV;;@;KY"
Gp%$7F(KB8@<?4%DK?q6@<Q3)@V'+g+DkOtAKYo'+Dc1<@<)eaDe!:"Cij*-Bl@m1+E(j7F*(i2
F"SS7BOr<(F_tT!EZee.A0>;j@s)g#@sK28Afu2/ATME*FD5T+DJ+#5Bl7F$ARTXk%16]fDf$V=
BOr<-AThX&FCf$$FD)e=BQA$6B4rE0BOr<.G@bZ6Bk;C"+Ceu#FEMVL/0JA5AoD^#Bl7Q+G%#30
@:F%a%16WSFC?;+DBO%7AKYMpFCfK0Bl7@$Bl@l3De:-;PZ07X5p0]LFCAm"ARlolDII@,F(o\<
De:,6BOu6r%16r`@<6R3ASl!rFE8R:BlnH.A0?)1FD)e,F^f&p+EML<Bl7L'+D,P4+O63N+D,Y4
D'1Df0JFVkD]gPb3AiK5Bla^jE,oN2ASuU$A0>T(+B2cYCh4_D+CT.u+DG_'Cis9"F!,R<AKZ&9
@;]UaEb$;(EcQ)=+D,P4+D"tkBHVJ,Cis:u$7JVeEcPl8Df-\+DIakgFCfE)ASuR-DCcnc0JG=4
/e&-s$4R>kIXV_5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$<1GCCh4_D+>"^:@;L'tF!,C5+O63N+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<V+#6tLCQG%G2,Ao_g,+@p3fFDl26@ps0r+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL%16!E@rHBuF!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#/M/P+
/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$<^qKEZcJI+<VdL+<VdL+<VdL+<VdL+O63N>Tb.3+<VdL+<VdL+<VdL+<VdL+<XU)
@;]UaEb$:]EcQ)=>R_#_+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL+<VdL
+<VdTF(Jj"DIdf;%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/P+/M/P+
/KcVs/M/P+/M/P+/M/P+/M/P+/M/P+/I`%=2)$^,+<VdL+<VdL+<VdL+<VdL+<Vd]2_d<H+<VdL
+<VdL+<VdL+<VdL+<Vd`1GB7F/Mo.8+<VdL+<VdL+<VdL+<VdL+<VdL0f:gE0H_J\+<VdL+<VdL
+<VdL+<VdL1H@,u$8"%f0H_J\+<VdL+<VdL+<VdL+<VdL+>G],3%uHt+<VdL+<VdL+<VdL+<VdL
+>Yo0%14[B0JFUl+<VdL+<VdL+<VdL+<VdL+<WBo2`WQ7+<VdL+<VdL+<VdL+<VdL+<WHr0F\@@
0eb:(+<VdL+<VdL+<VdL+<VdL+<Vd]0fCjB+<VdL+<VdL+<VdL+<VdL+<Vd^3A:mL0H_J\+<VdL
+<VdL+<VdL+<VdL+<VdL0ebIE0H_J\+<VdL+<VdL+<VdL+<VdL1,^fq$8F4g+<VdL+<VdL+<VdL
+<VdL+<VdL+?;>60H_J\+<VdL+<VdL+<VdL+<VdL+>Pc-%14jE0H_J\+<VdL+<VdL+<VdL+<VdL
+<WX%1b^$p+<VdL+<VdL+<VdL+<VdL+<WEo0F\@F0JFUl+<VdL+<VdL+<VdL+<VdL+<Vdc2E3B5
+<VdL+<VdL+<VdL+<VdL+<Vd]3%tdK1b^U++<VdL+<VdL+<VdL+<VdL+<VdL2E*<D+<VdL+<VdL
+<VdL+<VdL+<VdL0fC]p$8jLk+<VdL+<VdL+<VdL+<VdL+<VdL+>l)40H_J\+<VdL+<VdL+<VdL
+<VdL+>G],%15!I0H_J\+<VdL+<VdL+<VdL+<VdL+<WL"1b^$p+<VdL+<VdL+<VdL+<VdL+<WBo
0F\@J0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd_3&**0+<VdL+<VdL+<VdL+<VdL+<Vd]0JEqC3&!$/
+<VdL+<VdL+<VdL+<VdL+<VdL1-%6H+<VdL+<VdL+<VdL+<VdL+<VdL3%tdK3A<-0+<VdL+<VdL
+<VdL+<VdL+<VdL1,:O;+<VdL+<VdL+<VdL+<VdL+<VdL2_Y[J0eb:8+<VdL+<VdL+<VdL+<VdL
+<VdL0f:mD+<VdL+<VdL+<VdL+<VdL+<VdL2)PgM0ek@9+<VdL+<VdL+<VdL+<VdL+<VdL0ebUA
+<VdL+<VdL+<VdL+<VdL+<VdL1b]@G0etF:+<VdL+<VdL+<VdL+<VdL+<VdL2`*32+<VdL+<VdL
+<VdL+<VdL+<VdL1GB7F0f(L;+<VdL+<VdL+<VdL+<VdL+<VdL1c[64+<VdL+<VdL+<VdL+<VdL
+<VdL1,'.E0f1R<+<VdL+<VdL+<VdL+<VdL+<VdL1GUX,+<VdL+<VdL+<VdL+<VdL+<VdL1,'.E
0f:X=+<VdL+<VdL+<VdL+<VdL+<VdL1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL1,'.E0fC^>+<VdL
+<VdL+<VdL+<VdL+<VdL0etF*+<VdL+<VdL+<VdL+<VdL+<VdL1,'.E0fLd?+<VdL+<VdL+<VdL
+<VdL+<VdL3?TFe+<VdL+<VdL+<VdL+<VdL+<VdL2%9mI2`393+<VdL+<VdL+<VdL+<VdL+<Vd]
1E[e_+<VdL+<VdL+<VdL+<VdL+<Vd^%14gL0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq+<VdL+<VdL
+<VdL+<VdL+<VdL+<WBJ$8FLt0H_J\+<VdL+<VdL+<VdL+<VdL+?(Dc+<VdL+<VdL+<VdL+<VdL
+<VdL+C%#`%14gM0JFUl+<VdL+<VdL+<VdL+<VdL+<W6l+<VdL+<VdL+<VdL+<VdL+<VdL+<XoO
0b"IE3AiK5+<VdL+<VdL+<VdL+<VdL+<Vd^3?TFe+<VdL+<VdL+<VdL+<VdL+<Ve34>8BB%14[=
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/I`&9IXV_5%15[E+Dl%-ATDZ2FD5T'F"AGUBOr;sATVL(D/!lrFD5Z2+E(j7cBM9N
BlbD6@:WplF`V87B-:W)Df'2u+Cf5+@r$-.@;]Tb$?BQcBl>,4@WQ+$G%#K,Df0V=De:,3F^]?"
EcWcSF)N18F<G:=+Cf>,E,9*-AScW7Bl7HmE+NotASuT4De:,6BOqV[CisW(EZeq4BOu$lEbTSI
+B2cYCh4_E+D5D3ATJu9BOr<0@;L't+E(j7cBM9NAThX*Gp$^5G%DeAARTV#+D,Y4D%-h,3AiZ:
FDi9W0JG@,-p_orEc5i6D/!KgC`l#[D..<j@j#B%EZd+k0K(I)E+*Bj+A4^D/e&-s$4R>kIXZ_T
$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%16'C@VfTu1*A.k;Is?LDKI!D+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%16-ECis<1+E(j7cBM9NAo_g,+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZGBl[cpF<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZR@WQ+$G%#K,Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ0
/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P++>#/s/M/P+
/M/P+/M/P+/M.D==_2#^+<VdL+<VdL+<VdL+<\so<*UOg+<VdL+<VdL+<VdL+>k`RARTU%6YKnG
B4Y<j+<VdmG%G]&B4Y<W$6UH6+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL+=M;B@rH6q
F"&4S+<VdL+<Vd]/QlXnEZd__@;]^h>R_#_+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+=M;B@rH6qF"%P*/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+
/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/O`$8FOu2(gR*+<VdL+<VdL
+<VdW1GLL:+<VdL+<VdL+<VdL+C$K@+<VdL+<VdL+<VdL+<Ve3/I`%A3ArQD0H_J\+<VdL+<VdL
+=f6(/i"Ol+<VdL+<VdL+<Vd^/hnIk+<VdL+<VdL+<VdL+>>E)1(=RF3Ar`I0H_J\+<VdL+<VdL
+=f6*/iOmq+<VdL+<VdL+<Vd^/i=ao+<VdL+<VdL+<VdL+>>E*0F\@D3B&WE0H_J\+<VdL+<VdL
+=f9&/i"Ol+<VdL+<VdL+<Vd`/i=ao+<VdL+<VdL+<VdL+>>E.%14gM2`33A+<VdL+<VdL+<VdL
.l9+92'="a+<VdL+<VdL+<WNo1E[e_+<VdL+<VdL+<VdL0eP.<%14gM3%us=+<VdL+<VdL+<VdL
.lB"52'="a+<VdL+<VdL+<WNo0H_J\+<VdL+<VdL+<VdL0eP.6%14gM3&N<B+<VdL+<VdL+<VdL
.lB.91E[e_+<VdL+<VdL+<WHm3$9=d+<VdL+<VdL+<VdL0J5:B%14gM3A<'>+<VdL+<VdL+<VdL
.lB4;3?TFe+<VdL+<VdL+<WEl2BX+b+<VdL+<VdL+<VdL0J54<%14gM3AiEC+<VdL+<VdL+<VdL
.lK(63$9=d+<VdL+<VdL+<WHm3?TFe+<VdL+<VdL+<VdL0J5:D%14jE0JG+5+<VdL+<VdL+<VdL
.lK193$9=d+<VdL+<VdL+<WHm0H_J\+<VdL+<VdL+<VdL0J57;%14jE0JtI:+<VdL+<VdL+<VdL
.lK4:2]s4c+<VdL+<VdL+<W?j3?TFe+<VdL+<VdL+<VdL0J5(>%14[=/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`&9IXZ_T
$4R>ABOr;pG%G]&B4W2oDJjT*C`m5$@;]^h+E(j7cBM9NG@>P80J5@G+EM+(Df0).Ao_g,+>Gl7
2'@!Z+>Gl90J3eA88i]`G%G\F+EV:.+CTG)Ea`Tl+CT/*F^])/Bl7F$ARTXk+Eq78+DQ%?F<E7i
2DZIsARfXrA0>K)Df$UO3B/l=FDhTq1,(C9/0JA=A0>f.Cj@-W/ho=.F(Jj"DIal%Ec5e;1,(C9
+EVNE1,(C>/g*W+FEMV8+Cf(nDJ*O%+CT.u+EVX8DIdet$>FB#cBM9N@ps6tDJsV>@V$[$Eb/cq
@ru9m+EqOABHUerEcb`(DKL.HF(oN%AKZ).AT)U#FD55nC`mS5A7]Ru+E(j$$?Trm+E2">F(o,m
C`m4rF`V,8+CT;%+Du+>+E(j7BPD*m+D#G/F_>A1E,oN"Ble!,DD!&#G][t7E,TQ$FD5Z2Et&Ig
Ec5e;FD,5.FCAWpAKZ2.BkM+$ARlomGp%3BAKYf-DJ()2ATDL'A0>u7ASu$$Ao_g,+EV=.@;I&q
Ea``tDJ()1Ado)hBOr;\Df9M9De<TmEZfC6@<6@)@:F%a+D#V9Bl.:#ATJu4AfrT^2^!0Q@rH6q
F!,17+>PW*0J"=s3AVe!ARfXrA9/1eBl5%K0JtO8+=f3$1E^aM@rH6qF!,17+>PZ*0J">TDIak?
1c-s1F(Jj"DIdf2Bl5&8BOr<3ARTU%1,:O;/e&-s$;YedF(o/r+EV:.+E1n4Bl@N)De:,1@WQ+$
G%#K,Df0V=-oE\4+@8Fa+EVNE1,(C>+@ARH/0K%JAKZ/)Cis;3De:-;PZ/)!@ps6t@V$ZnG][t7
E,TQ$FCeu*Ao_g,+Dk[uF*2M7A0?&(Cis<1+E_a>DJ()6BOr<&Df02>FCfK0+Dk[uD@Hql@<,dc
Des,t+EVX8DIbd;$4R=O$6UH6+<VdL+<VdL+<VdL+O63N+?^i!1,'h$+>Ybq.Nih>1*CXL@rH6q
Et&I!+<VdL+<VdL+<VdL+<VeNBOu3q3ZoPe+?^hqH"CE)/MT4?0I\Y00JEqC%15BDF(KB+ATJu4
Aft;sDes]:Df'2sC`m;6E,oN2F(oQ1F'U2-FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;L
@<=@[A7]S!@<?I,Cj@XHFDYhC+D>2,AISuUAS#a%A7]dqG%G2,Ao_g,+EV:.F(HJ)@<>p#FDi:C
Bl.g*BkDW5FD,5.AThKuF^]B+Df-\9Ag#B`<$5dkEZee.Gmt+&Bl.E(A9Dp,DJ()6BOr<#DKKH1
G%#20/MT7G3?WE^+=f6%0JG+%<+ohc>BOgnATDm$Bl8$<+DG^&$I4l8>psB.FDu:^0/$mHCh[j0
AM.V:An*H2@<5j0B5_rH;ak2)F>Y^oDI[6uFCAm$FEoKPFDYhC+E)F7EZfI;BlbD9ATDL'A0>Aj
DBND"+D#V9Bl.:#ARl5WAo_g,+EM%$FED)7+DG^9FD,5.D.R-sF`M&1ASuU2/g*W%EZee$A8-."
Df0!"+DG_*DfT]'FD5Z2/0K"FANC8->=<%=FC?:k+CT.u+B<;nG%G]8@;I&cBl.Ee-tm^EE-"&n
04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij)b/nf?DCagtG$4R=o/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R>DDfTZ)+EV=7AKZ;;DIml3@<,p%@:OD%@;Kb*+C\c#ARlp%DBM;bDfTB&DIIWuA.8lGDJ=9*
EcYZ*+B3&lAKWC$<'r)e+A$YtBlbD*DBNA0Df'2u+EV=7AKZ&>DI[@#Df098ARlolDIakuA867.
FCeu*FDhTqF*(i9+EqOABPD?,0J5@.F(Jj"DIdf2De:,#F*)G@DJsB+@ps1iGp$X/FCfK0Bl7Km
+B<;nG%G]8@;I&cBl.Dj$7JnR.4u`=@q/qgBl@ltCi"AJ+CQBt,&Ch!E$045@rH6q>Tt;)F!+n%
A7]9oFDi:%<'qdMD]ih,AT/c+F<G:8+EMgG@grchBln#2<E((hGA(]#BHUeu@;]^hF!,"9AKZ)5
+Eh16Bjl*tDf0V=Bl5%^@<-I'>UOS8Ec6&.FD5Z2+ECn4ALT5@$4R=o/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R=e
,9TlqAn?!oDI[7!%13OO9lG&mBle31/0IV=+CT.u+B*AnE+ig#F)PqI+@[t+;D'LC>Tu^QF*)>@
Bk(Rf+BDoeF_,V:De:,6BOr;T@<-I'>UOS%$:AWJ@r!2UEcQ)=+O63N+CT.u+EV:.+@BRR@s)Tr
FD5Z2+E(j77:U.JE-#T3>Tt^A8hM5WBleAK+@1'jEc5hJ/0Iu3Cb?/(1Gp:O@<-H41FsY7F_>i<
F<E=m0Jk=':2_a-0etF6+E29B1GUm@1G^p3-o*J11at$d$4R>@FCfE)ASuR-DBMD$;BTCcA0=E]
F_kT"DBMY+5qX]2.RA/m@<3Q0AfsWYF*)>@Bk(Rf+@TdVBlJ-)+AH9`F"/^M$:A6=@WH0nB4W2c
DJ=8H:i^,gF"T!d6Xah@EbT&sALnrY3B/oL%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO1,(C@+AH9b@qZu?
2f<&F@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys=/2^9GL:-hfE+=KunFD5Z2
@;I&PATD^,@<H[+@ric$DIakgE+*6f+@0OTBl7X+FE1f3Bl@l<>psB.FDs8o06_Va/oG*=@4l22
FtY9R$4R=o+<Ve2>=`[LAR-]tFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G04eX0BlJ-)/nf?D
CaiX!$4R=e+Bq9ECh[j0AKY&c@N\T`FCe`+BQS?8F#ks-F)Pl'EcZMIFCf;ADIITp/n]*G04eX0
BlJ-)F"_3FD.P@L%13OO,9n=?Gp#RsARloPF)Y].@;@D:7oMlE+Acl_DImouEd8d+H#n(=D0$gn
@:F.q@<?F.Gmt)i$6pZiDes]:Df'2sC`l/kE,oN2F(oQ1F!,(5EZdb]Cij).<$3U7PZ0(S%13OO
>A/,#E-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=/nf?DCgAH&
FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYhC%13OO
,9n=#Bm+&19keE[ASuC"F_r6g@;^"$+E(j7;f?J\EZde\Ch[j0ATJu!>=EUPAStpl+CT.u+AHEY
F`Uen+:SYe$<;.]DJ()6BOr=3PZ/cK@;L'tF!,")EbT].A0>K)Df$V=BOr<"BleB7EbT#lC`mb0
@rHBu+CT.u+D,Y4D'3A'Eb/a&%17#_F(KB8@<?4%DK?pKF(JoD+BqfR@VfTu0jQ2@FEDJC3\N-t
@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW5.3K',@;]Tu>?#$?Ch4_E
>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH9LWH"F>Y^^AScHsF=q6KD/:G=@:Cu@+=Sia
@3BW&EbT*++:SZrAfu&2CjBo:D/!Ep+D#e:Eb0<5Bl@m1+D>2,AKYGnASrW#Eb/[$ARlp*D]j+8
D/a<*ApGM@BOr;tG%#30@<?4%DBNk0+O63N+D,P4+CT/5+EV=7AKYN+EbTE(%172jAKY])FCfK9
@;I&<0f_6S+EVNE.l/k50J3eA%160J+Co%qBl7K)FD,5.A7]7bD..6'H"CE)+C$+9>Tt;!F!,(5
Ci"$6F#ja;%144#+<VdL+<VdL+<YqP4Wo#]@<*J@+=M)FDKKP7/Kc`"2(:151(=R"$<1\QF!,+0
G%G_;>U"Gu+s:K9EZfI;AKYi(A7TLf+E(j7FD,5.D/X<6BIk9MBPCsi+DGm>@:NeiEaa'$+D#G/
F_>@s$>4'rASrW4BOr<*Eb/`pF(oQ1+DG^9FD,5.CMn'7DBO+2Cis<1+E(j7cBM9\+B3#c+D,P.
Ci=N3DJ()2Des]:Df'2sC^g__G]7\7F)u&6DK?q1@;[2sAKZ,:ARlon@;KFrCghEs+EV:.+Eh10
F_)\6Ag#B`<$3T'DBO"3@rH6qF"&5MG%G\:FD,4p$?U!!AKYr'EbTH&+Cf>5ATD?m+C]U=De:,6
BOr;j7VR$W+AHQdCh7L%Bm"886XakNDBNk0+B*2p@<*JZ@r,juF(KDR%14[A3B9)BFDi9P1GCL:
>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akYJ@WO1[9g_iJ/nf?DCagtG$4R>/AS,k$
AKZ).AKZ80@<*JB2)$^8+Cehr@s)TrFCdKB$4R=b+<VdL+<VdL+<VfPPZ/bg+>#?&+=eQj1*A%h
F^?g4$6UH6+<VdL+<VdL+EqL1Eb.9S+E\ei+=MLe0fUpB.5*D00F\?u$:8<GG@b?'+F.O,EcW?T
2)$^,@;]Tu.lB"7/0K.J+E_a:+EV:.+Cno&@3B0&Df$V$<+06PAKW^5-tm^EE-"&n04eX0BlJ-)
/n]6;@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PK;_+D#e-AT2`6FD,*)+D,P4+EV:.
+F.O,EZcqk0JFVnAKYJr@;]^hA.8lfBOr<0@;L't+>Gf03A;RtD]gbn1,(L:2]ugP+E):2ATAo8
D]iJ3DeW`)@3B)pF(9-+FD5W8BlnVCGA2/4+EV:.%17&pAThd+F`S[;DfT];CgeGpF<G[=@<<W'
E,T6"/g+,,AKZ/)Cis;3AoD]4cBM9NBlbD0Bm+'*+C]U=@1<Q_Des]:Df'2sC`mY.+EV:.+?"=T
+Co%rEb/f5+EqL5@q[!*AT2[.A9DBnF!,R<AKZ/)Cis<1+DG^9>?#$?Ch4%_0jQ1[/h^-l@psI:
04\X1FCB8DBQS*-,BR@'0e"5hBln#2@;[3!EcQ)=+Du+>+DbJ,B4Z*+FD,*#+>b3^ARfXrA90d@
$4R=b+<VdL+<VfPPZ/bg+>GQ-3&<0F+>"]j0JPC:1bg+&+E\eW+>Yf+2`NTJ0d%qgF^?gG/Kco'
3AiQG2)?@)+E_!H%144#+<VdL+<VdL+<W6Y0J5(=3B/iQ1*A%hF^?mI.j-Mu0JYC<2`*6L1*A%h
F^?pJ.j-Mu0JGL@1GLdF1,0n$+E_!K+:SZ#+<VdL+<VeNBOu3q3ZrPf4Wo#'0eb9j$4R>/ATW--
ASrW9ARTV#+=f<'0HaeAA0<BW2D?g9+EqB>@:s"_DBO(CAKZ).AKYMlFC?;(Ec5e;%16<=@:F%a
+>I.MBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX@psI:04\X1FCB8DBQS*-,BR@'0e"5e
D]iS%EbT].+CQC3Des]:Df'2sC`mY.+EV:.+?"=T+Co%rEb/f7%13OO+<VdL+<VdLcBM9N4WlI:
2`*-B+>"]n2)['@0d%qgFW`1W2_cp?1Gh$G+=\LV?8<WR+>>E(0f_0P0d%qgF^?j5$6UH6+<VdL
+<VdL+>"]i/iY^B1Gh!G+=\LV?8NcV+>>E%0JtOA0KD-Q+=\LV?8WiU+>>E%0K:jG2_m'G1E\.i
F^?s8$6UH6+<VdL+EqL1Eb.9SFW`gi.![C!0JG100/5.7%13OO6=k7_AS#a%H"CE)F!)tf2D?g-
@;]Tu.krt:0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i%1,'h&+>>E.3&!<7.NigU/Kc`"
0JPF@1*A%hFC$^F.j/q?1E\=n2_d'J%144#+<VdL+<YlAATD?C+<YbK4Wo"m/Kcc+0JEqC%15F5
FE_;-DBO49@<-E3.krt:0HaeAA0<BW3&!$;+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+?1u5
1E\1j0J5(<0Jah$+ES_X+>>E%0JtjG3&Mg.+EUpF+=eQg/het50f(UA2BXIlFC$aG/Kf.A1a"Fo
0ekUD0JG0i$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0fLd?%13OO6=k7_AS#a%H"CE)F!)tf3&!$/
@;]Tu.ks"A0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i%1G1UA+>"]i/i,:=1c.-6.NigU
.j-Mu0JGCE2DHs0.Nih>1*A(i0J5%51bg^>2BXIlFC$aG/Kc`"0JG1:2`*<K+=\LU?8Nc6$6UH6
+<VdL+<VdL+=eQg/het50JP=;1,gs2.Nih>2'=In0J5%50JG170fD$P+=\LU?8`oV+>>E%0JG17
0JG173&`];.Nih>2[p*:+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc-0JEqC%15F5FE_;-DBO49@<-E3
0fV'F+CT.u+>Gl10J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i+/iGI-.j-Mu2)d<M+=\LU
+>"]i/i#:=2`3E7.Nih>1*A(i0J5%62E3BK2E2g/+EUpG%144#+<VdL+<VdL+<W6i/het51c.-I
2DR*3.Nih>1a":kFC$gI0-E#+1GLgF%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gi60F\?u$:8<G
G@b?'+F.O,EcW?X3A<-0@;]Tu0f_!C/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl=3/iPd5
.j-Q!1c[BI0f^@++ES_X+>>E%2*!WV1H?R-+EUpF+=eQg/het;0f_-M+=\LU?8E]U+>>E%0JG4A
2]sRmFC$d5$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0f^pA%13OO6=k7_AS#a%H"CE)F!*1t1,'hZ
DIakE3A`HA+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>PZ(1,'h$+>>E-1c.3K.Wcdb+>>E%
2`<BE0H_hfFC$^F.j-Mu0JG793AWQ9.Nih>1CX[6+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc.1,'.E
%15F5FE_;-DBO49@<-E30f_'F+CT.u+>Gl70e=GW@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i&
3A*!E+=eQg/i57@.Wcdb+EUpF0/>=>+=eRV?8E]W+>Pf22[p*:+<VdL+<VeNBOu3q3ZrMe4Wo"m
/Kcc.2)#IH%15F5FE_;-DBO49@<-E30f_-H+CT.u+>Gl92Cot\@;KFrCghEs3XlE*$6UH6+<VdL
+O63N+?^i(2(g^C+=eQh/hf1B.Wcdb+EUpF0/>F>+>"^X?8E]W+?)#7%144#+<VdL+<YlAATD?C
+ES_h+F,(]+>Gl82%9m%$:8<GG@b?'+F.O,EcW?X3B/o>@;]Tu1,(C>/0JG2Ch%U(@<?'A%13OO
+<VdL+<VdLcBM9N4WlX=/iYa3.j-Mu1G^jF+=\LU+>"]i/hf1;1H.-5.Nih>1*A(i0J5%50fLjH
2'=@kFC$aG.j-Mu0JG1=2).'F1a"7jFC$dH%144#+<VdL+<VdL+<W0W0J5%50JG7<2`!<O3?Tdo
FC$g6$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]1,(C9%13OO6=k7_AS#a%H"CE)F!*4l0Jst]DIakF
0JtO8+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>tu-3AM^-+>>E(1,:RC+=\LU+=eQg/het:
2)mT=.Nih>1(=R5+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcf&0JEqC%16'JBlbD.G]7\7F)u&6DBNY7
+Co&(Bm+&u+D,Y4D'3D2FD5T#FCeu*G%#30ATJu4Ag#B`<$5mm+EV:.+F.O,EcW?Y0JP6j$=Rg_
+>PW.0J4JIBOr<0@;L't+D,P4+>PW*0H_c%2D.!4F(Jj"DIdf;+DGm>@UX=hA0>f.+CQC/Bl7Kj
Ebp"1$>"I(Ea`p*CghF"Df-\0Ec5e;1,(C>+E_a>DJ((G/i,L1F(Jj"DIdfAH"CE)+=LZAATD3l
AKYT*Df$UO3B8r>FDhTq1,(C>.4u`BBOr<0@;L't+D,P4+>PW.0H_c(1E^aM@rH6qF"&5GF!,:5
DIm6sCj@.7G][t7E,TQ$FCeu*Ao_g,%14jE0ea_mF(oN)+>>E+2B['P@rH6qF"_fM@<*J=@<Q4&
@:s-oEaa'$+D,Y4D'1Pn0JO\lD]geh0JFq.%13OO6=k7_AS#a%H"CE)F!*4l2)$.]DIakF0f:X9
+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>#?&+=eQj1*A%h-n'?m0fUpB.5*D00I^<`+>"]i
/i>OB3$9[n-o*M70H_qiGps10%16'JAKYetF*&OHATDW1BlbD2DKKo;A9DBnA0>u4+D#A'D/!lr
FCcS:BOr;sBldd&DKKT1F_PrC+CT@71,(R>/e&-s$:/9GATAnK0f:X9+Cehr@s)TrFCdKB$4R=b
+<VdL+<VfPPZ/bg+>#?&+=eQj1*A%hF^?g4$6UH6+<VdL+EqL1Eb.9S+E\ei+=MLe0fUpB.5*D0
0F\?u$:/KE+Eh10F_,V:De:-;PZ/c7@<6!j+E)-?9lG&mBle31+CT.u+B*AnE+ig#F)Pq=>[&s;
0Jm$?+CT>4F_t\4@1<Qe@;L't+D,P4+EV:.+AHcmDHnQ1+EM+(F_kK,+CSbiASbpu@<?4%DBNk0
+>#?,+CT;#F(Ji7@sM<c1+j\?Dg,c9ATB=2$?Trm+@St#/M]"60J>C@+Dc1<@<*K%E+ig"ATDL+
+D#D/Ci=T1A0>T(+EV:.%16<,@;^"$>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akYJ
@WO1[9g_iJ/nf?DCagKLF(KD8@3BW-BkM+$Cj@.6BkCsgEb0-1+Eh10F_)\6AfrZ\2(gjG3"64'
Eas0%@kV>;>[B0<+B3#sF"AGB+EMC.Cht5(DfTl0@ruF'DBN1.@pC3#D09oA+C\n)@:Wn[A0>u4
+EV:.+Eh10F_,V'$=m^gBm+&u+D,Y4D'3q6AKYr1CjBo:D/!Ep+D#e:Eb0<5Bl@m1+D,P4+O63N
+C\noDfTD3FD,62+Ceht+C\n)F`V,)%16fe+EV:.+Bq3ADJsDu-tm^EE-"&n04eX0BlJ-)/n]6;
@kMY-F($\6Dg!d47<!BYF"]CF6W6E+BQS*-.1HUn$6UH6+<VdL+CcNW+>#9"0JG170etaF1*A%h
.!Zpe+>Gl62(;ie%13OO;e^,ZAKZ).AKZ/)Cis<1+E(j7cBM9NAoD]4FD,5.Bl8$(Ectl-+>Gl6
2'@!Z+>PW)2'@*SEb-A(ATDL.ARl5WBl7HmE+NotASuT4De:,#DL!@@F`(W.+D#M*ASl"!BlbgJ
DJpY-DfTl0@ruF'DBNY7+Dtb%A7]9oAoD]4FD,B0%17&cEbTH&/e&-s$<1\M+Bru+@qB\&@;0V$
Gp$g=+O63N>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH9LWH"F>Y^oDI[6uFCAm$FEoKP
FDYhC+E)F7EZfI;BlbD9ATDL'A0>AjD@Hq^AKYQ*FD5T#FCeu*Ao_g,+EM%$FED)7+DG^9FD,5.
D.R-sF`M&1ASuU2/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$6pc<;IsHOEb0,uATJ:f%15gJEcPl8Df.*K
9J.GrDIakgFCfE)ASuR-DCco"/g+%E/0J1A883-eDfTQ%@;I&e@;L'tF!,C5+EV:.+@T^ZFD+o,
Et&IDCi<g!+@U<kDfQuGPZ/c6DIal3BOr;R@;KFrCghF"Df-\9AfsNPCh[j0ATM*#/0IP;+@p3f
F=n\%F*)G@DD!I_<c;e,%14mK+AcKeF<E@j+@1-_F`VXI1,(C=/0I]+/g)l(0J">cE$-ql2_?gA
2BXD'0JG=4/e&-s$<)%XE+ig#F)Pq=7P7R]@;]Tu88iWeA7]X$9eJ^a/0HE.FDPB,+E(j7883-e
DfTQ%@;I&T@r,juF(HIg@;p9;/.DqR@;TIoBk1jf+B<;nFtQU3ATMoF/0I;gD.7O"A7oI)+>Gl9
2D,FG%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$4R=t0JGF.:LeJh0Ja.FDKU&0FD5Z2?YOCbCi=3(BlnK.ARAtEF(nuu
A26)=F`_&6Bl@l38T#Y>@r,juFD55nC`lDiDJ*[*F_#&+.*e(&W$ritDIakfBkM+$+@1'YASuR'
Df-[GcBM3m.1HVI4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]%15RFDf$Uh@<itp@;]soE[PoNG@b6)Blmo/>A/,#E-"&n05b?>E,ol0
Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"^fIBQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m1
0.AL_$4R>.ChI[,Bln$*+B38%6Z6g\F`_1;<+ohc:3CYeFD5Z2+A$Gn9Q+f]BlnK.AKWC/A5I>]
?muNl%16'JAKYT'Ci"$6Bl7Q+@;KRpEbTW/D'3>,D/aW>ATJu9BOr<(F`_&6Bl@l3Bl5&)@r,ju
FD55nC`mP4DJ*[*F_#&7+DG^9A7]CoAS#p6+:SZiDfQt/+D5D3ASrVu8jm&0@<-"'D.RU,/g)8Z
8TZ(hF!,1<+C\c#ARlp%DBO%7AKWHW3B/]88O6?!<+oi]Ed8dGAfsikFCB9*Df-\+DIakfARopn
FD5Z2/h.;;%16'JBlbD?@;L't+DGm>FD,5.@rHC.ARfgrDf-\>D]iJ-E,9eBFDi:DBOr;\76sZk
G%#30AKYo'+EV:.+D#&!BlJ0.@ps0r%16oiDJ*[*F_#&+FDi:?@WZ$mDBO%7AKXrM<CJ$HDf03%
FEM,*/0K.NFD)e*+EV:.DfTE2Bk(Rf+E2@4@qg!uDf-\9Ag"sq0J5%50d'nF@j#i(@kJ2t%15C=
Gp%3LBkM@%Df''-EbT#+Ap&!$FD5Z2F!)lPBl5IE@rHE>+EV%0/0JMG+CT(=.3NbSARlotDBO%7
AKYr5AT_O%/Rr^0ALnr5$=S!sF_t\4Ea`Km@;[2rEbBN3ASuU2+E_R<ATMo8DffZ(Ed)5=AKY])
A8,O^FCeu8+<VduDBO%7BlbD,@<6!2+EV:.+D,>*@;I%q$?B^!F_l.BBlbD+ASH$p+Cf>-G%G]9
ARlotDKKe>A7]CoAS#p*AoD]4@rH7.ASu3nDI[61%13OOIXZ`p%16!EAi^A.6$%-gDf0K1Bk(Rf
+@0gVDfTQ6BPhf5/KcfdA0=<OBln'-DBL>^3B9&J+:SZMARTI!9k@mYEt&IQF^csG=(uJeD..="
/OF#bCb-]#DIY:.$;"/_:*;5B3A`NJ3ArHI0eG*h$4R>?AS*t4$:T2YCgh3iFDl2F+B*E%E,9*&
ASuT4FDi:DBOr;PF*)G@DJsB+@ps0r6#:CHDII#t-o!_B1+<Y>E%s(%+EVNEE%s((%15[*6;AXW
/NGUE2_[!=2E39I%17Q5IXV_5%13OO7;QOPASuU2%13OO0eOSV8jm%n7qHRLEa`c,8jje>F_tT!
EZet4EZf"/G%GP6A79Rk/0K%KD.OhuDIam8PZ/)!1+j\W<+$#3Bl.E(Amo1kDfQt7DBMPoCh[<q
+Ceu#FEMV<ATJu7ARfLoDIm?$Ao_g,+A+CC0JG+5/0JG@EcP`4E,TW)Bl7Q+FDi9o6k'JZ/g+Oi
AS4t\;IO*D+:2"\BlbD2F!+m6@rH7.ATDj+Df-\0@:OCtEZfLGARlp*D]iP.DK]T3F<G+*B6%Qp
F!,17FDi92$6UH6+D#P8Bm*p$ASuT4Ea`Km@;^-=+<X`s+Dl7;FD5]1Gp$X/B6%QpF!+q;+EV:2
F!,('@ruX0+EVNEDdmfsBl5%&$6UH6+EV:.+D#P8Bm*p$ASuT4@;]^oAKYQ/E,oN2F(Jl)Bl5&6
@:X(\DK@EQ+AQis+D#_-Ed8dHEc5T2@;TjqDJ(($$6UH6+DbJ(B6@WqAKYYpF!,(;DI[d&Df0V=
FDi:3Df0`0Ec`F5ATW--ASrW2@:X(\DK?q/DIal#AS6$pATKI5$8a@X@!>ub:3CYeFD5Z2+EM+7
Bk;?.@:NeiD09Z'FDl1B-t..++EM+(Df0*,+F#"`0JG17.4u&:2(g"ZG;3J39k@aN+D#A-DJ*C"
Bl@l3De:,6BOr<'Df9M9Ao_g,+EV:.+EM[C/e&.G/g+PG111D_ARTI!F)Pl'EZee.Df&p!GqKO5
2_H4\G;EV59k@aN+Dc1<@<*K!DJsB#Cj@WB$90X\@!=G8#u#JZ@<*K!EbBN3ASuT4De:,.@<?4*
F_#&9%15*J+CKCN?jTMFDJ*[*F_#&+De:,#F(8d!A8,po+Du+.AKYo'+Dc1<@<*K/Eaia)+E)-?
FD,5.ARfOjE-,f(+:SZ#+<Ve8F!,=2@<6R3ARloqEc5e;FD,5.D.R-n+D#P8Bl7j6+E(j7A79Rk
/e&.B0J4JUA5I>]6tL"=#u5Vb@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(BlnK.AKYQ/E,oN2F(Jl)
Bl5&(AS6$pATKI5$4R=O$@[GQ%144W+<Wfi-qZlM/Kcf*2)-sF2(9Y$+>Yo51,TLJ+B1*=4Wm]R
<"00W<&5X[+B0gi1(=R"$6V`JB2ieI@:UKD+>YW)1bgjJ1,_!G2)mTT3AWE50-Du/0F\?u$6XOI
+?^i&3B&QM2)$gE+=eQk1c7$H2_Hg>0f1j><$3b80J5%50f^sF1+H6Y+=eQ_<&5XM+>Gi91cI6?
%145%0d&V%6tL"1Dc1"S.O]Kq.1HUn$6XOJ+?^i'2)d-F1,h-I+=eQj2*!ZW/hf.:1GgR\+>"]i
/het50fC^A.TA/G/KcH@1E\=n1GCL:0JFpb$6XOJ+?^i8AS4t\;IO)c.!IEq%13OO+EoUa4WlI8
1bLdH1-%<:.j-Z-2_d<P/iYaJ1H@EE<$3\60J5%53&WcU1+H6Y+=eQ_<&5XM+>l&42)$Hg$6XOK
+?^i8AS4t\;IO)c.!IHr%13OO+EoXb4Wla@/i#@?3ADX,+>c&61,(I90JPLD1H6j`+>"]i/het8
2E3HL.TA/G.j-6>1E\=n1GUmE2_ZZi$6XOL+?^i8AS4t\;IO)c.!IKs%13OO+Eo[c4WlI72(gR>
1c7$2/Kcc.1Gg^=1H%!H0e--F.j-Mu0JG792_[3@<&,RH+=L2F+>4io2)$^<0I[G<+Eo[c4Wm.(
B2ieI@:Ui9G;UfY$4R=b+Enqk+EM77.!INt.OZl'2`*-B.T@NB+>Gf03B8uH%144#G9B$kG9ACY
F(oM?1+F\r1a":kG;UKp+EoOh.4Q_t0eP@6<$3b80f(OD2^o1C+<YkN4Wnqk.j/nIDC@7i.!IKj
.j0$n.4H_p/M](?1a"@m0J5+1<%/7`+<YkN4Wnqk.j/nIDC@7_.Nipm.4Q`"/i"nU+=eQi0K([8
%144#G9B$kG9ACYF(oM?G;:Ts-o!P62BXRo1G1L6<%/7`+<YkN4Wnqk.j/nIDCB]b.4Q`"/hnhT
+=eQn0et0e$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2'=InG;1Nh.j0$k.4Q`#/i"nU+>"]n0fLNj
$6UI8+?^ik+=eRUBl5=S+=\LX1a":kG;Ug!-nR,*1b)HI/Kci/2CT(B+<YkN4Wnqk.j/nIDC@7i
.!IKj.j0$n+>"^[0e"4s+EoRi.O[&,2]s[p0J544<%/7`+<YkN4Wnqk.j/nIDC@7i.!IKj/Kf6l
.3L,`G;Ug!-o!J;+=eQg/hnhT.1HV,+Enqk+EnqY+EM77.!IHi.j0$n.4Q`"/hnhT+=eQm1FWb?
+<YkN4Wnqk.j/nIDCB]d+>"^[1FXe%/MJe3.T@NB+>l,-%144#G9B$kG9ACYF(oM?1+IK'.4Q`#
2]s[p0J5(0<%/7`+<YkN4Wnqk.j/nIDC@7i.!IEh.j0$m+=eRY2'=InG;1Nq.OZu'0e--F/Kcc+
.1HV,+Enqk+Enq[+>Y]+.W]<A-o*8#G;LEm+Eo[l+=eRY1FWb?+<YkN4Wnqk/Kcc*3%Au`DCB]b
+>"]k.X*Tr%144#G9B$kG9ACY0etO7F(oM?1+F\r1a":kG;Ufl/Kf6n.1HV,+Enqk+EnqY+<WQu
.W]<A-o*8r0e!P=+<YkN4Wnqk/Kc/n3@])aDC@7i.!IBg.j0$m+=eRY2(9Y"+EoUj%144#G9B$k
G9AI[+>kl'F(oM?1*A%hG;LEm+EoUa.j0$n.1HV,+Enqk+EnqY+<WL#.W]<A-o*8#G;C?n+EoOh
.1HV,+Enqk+EnqY+<WL!.W]<A-o*8#G;LEo+EoUj+=eRY2(8tA+<YkN4Wnqk/Kc/l3%Au`DC@7i
.!IBg.j0$m+=eRY2(9s`$6UI8+?^ik+>"]Y1GLA#Bl5=S.O]Ks+=eRY1a":kG;Ufu%144#G9B$k
G9ACY+>Pr,F(oM?1+IK(.1HV,+Enqk+EnqY+<WF".W]<A-o*8#G;LEm+Eo[c/Kf6l.3L,`G;CZW
$6UI8+?^ik+=eQW1,^V'Bl5=S.X*]u%144#G9B$kG9AI[+>P]%F(oM?1+F\r1a"@mG;1Nq%144#
G9B$kG9ACY+>PZ$F(oM?1+IK)+=eRY2'=InG;CZW$6UI8+?^ik+=eQW0fCM&Bl5=S.X*Ti/Kf6n
+=eRY2(8tA+<YkN4Wnqk/Kc/j2(EZ]DCB]a+=eRY2(8tA+<YkN4Wnqk/Kc/j1FdH[DCB]b+=eRY
2'=In1+IK&.1HV,+Enqk+Enq[+<WBo.W]<A.!INk/Kf6m.1HV,+Enqk+EnqY+<WBn.W]<A-o*8#
G;C?n+EoXk.1HV,+Enqk+Enq[+<WBm.W]<A-o*8#G;LEm+EoOh+=eRY2'=InG;CZW$6UI8+?^ik
+>"]Y+?1ilBl5=S.O]Kt+=eRY0d%thG;Ufl.j0$l.1HV,+Enqk+EnqY+<Vdc.W]<A-o*8#G;LEm
+Eo[l+=eRY1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DCB]b+>"]k.X*Ti.j0$k.1HV,+Enqk+Enq[+<Vdc
.W]<A-o*8#G;LEm+Eo[l+>"^[1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DC@7iG;13j+>PEj1a":kG;UfY
$6UI8+?^ik+=eQW+>t]jBl5=S.X*Ti.j0$l.1HV,+Enqk+EnqY+<Vdb.W]<A-o*8#G;C?l+EoXb
.j0$n+>"^[0e"O\$6UI8+?^ik+=eQW+>t]jBl5=S.O]Kt+>"^[0e"4q+EoUa.j0$n.1HV,+Enqk
+Enq[+<Vdb.W]<A-o*8#G;13l+EoUj+=eRY2(8tA+<YkN4Wnqk/Kc/Y2C`c^DC@7iG;13j+Eo[l
%144#G9B$kG9ACY+<WNkF(oM?G;C?n+EoRi%144#G9B$kG9AI[+<WNkF(oM?1+F\r1a"@mG;1Nh
.j0$n+>"^[1+<Y>+<YkN4Wnqk/Kc/Y2(EZ]DCB]d+>"]k.X*Tr%144#G9B$kG9AI[+<WNkF(oM?
1+F\r1E\1jG;L`k.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A-o*8#G;C?n+EoOh+=eRY2(8tA+<YkN
4Wnqk.j,rW1b*Q\DC@7i.!IKj/Kf6l.3L,`G;:9k+Eo[l%144#G9B$kG9ACY+<WKjF(oM?G;C?n
+>PEj1ark@+<YkN4Wnqk/Kc/Y1b*Q\DCB]b+>"^[0e!P=+<YkN4Wnqk/Kc/Y1b*Q\DCB]a+>"]k
.X*Tr%144#G9B$kG9AI[+<WKjF(oM?G;1NU$6UI8+?^ik+=eQW+>YKgBl5=S.X*]l.j0$l.1HV,
+Enqk+Enq[+<Vd_.W]<A-o*8#G;LEm+Eo[c/Kf6n.4G]5+<YkN4Wnqk/Kc/Y1FdH[DCB]b+>"^[
0d&%jG;:TV$6UI8+?^ik+>"]Y+>YKgBl5>C1*A(iG;CZW$6UI8+?^ik+>"]Y+>YKgBl5=S.O]Kt
+=eRY2(9Xu+EoUa/Kf6m.1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;13j+EoXb.j0$n.3L2bG;:9m
+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r1a":kG;Ufl.j-VtG;CZW$6UI8+?^ik+>"]Y+>YKg
Bl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6m.1HUn$6UI%:ig>=AS3,K+Enq]+>Yo00JG170J5$g$6UI?
IXZ0WFCB9*Df/orDI7<kCh[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.GC\:3CYeFD5Z2+A$Gn
:L\-SEHPu;Gp#mp+B3#c+@TdVBlJ0.@j!?G8O6?!0f_3I+B)ilBk;>p$9^O84Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO7WNEa+A-'f+B2ceDImi9
F!,[<@WQ7*AKY2jFEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL>psB.FDu:^0/%3S
DfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@H[/e&-s$<1\M+D,P.Ci=N3DJ()#ChI[,Bln$*+Cf>,
E-686F!,R<AKYl5FCB9*Df-\3DBNk,Ch[m3BlnVCDe:,6BOr;t@r,juFD559+DG^9%16WWB6%Qp
F"AGGDfQt/+D5D3ASrV_6r[,.@<-"'D.RU,/g)8Z8TZ(hF!+q#F(Jl)Df-\>BOr:q$7[bj3%uIH
5uf%,BOu+&Gp%$;+AR'$@<?4%DBNA*A0=c]A9DC(Bl@lA.Lc^o$<1\QF!,X7Cis;3BlbD=BOr;r
DfTl0@ruF'DBO%>+CT5.Cj@.FD]j.8AKX]95u&PG@;L't+E(j7FD,5.DdmNsEHPu;Gmt+&D]it-
FCAm$+EV:.+B26=73HMXCh[m3BlnVO+EqOABHU_+FD,6(Eb0?,@ps0rE,oN"Ble!,DBNk0+MtB;
/het6+CT;#+EM+(/e&-s$:/_UBl5&1Df^"C@rH4'F`_28+E2@>B6%EtD/!m#+DbJ(B6@WqATKCF
FD,5.FE2).Df0K1ATVs,@j#B+DI[d&Df0V*$7Kt0DCco?Df[HPFCB&<+D#X;@;IPF+DG^9FD,5.
E-#T5A8a&0De*E%BOu3q/0JABF*2>2+ECn$Bjkm%@<-"'D.RU,Et&J!DJWm*F!,CCBOu4.Bldi.
Bl7Hq@psIjA1e;u%15[E+EV:2F!+t$F(HmFFD,5.Anc-kC`mb0F*2;@+DGm>@rH7.ATDm(A0>T(
FDi:4AS6$pATJu+DfQt1Df0`0DJ<["@q@8%$4R>AEckq9:L\-SEHPu;Gp#6m9k@aN+AZH_BlS90
FEnuZ+O64s[1*HP$@[GQ%16!EAi^A.6$%-gDf0K1Bk(Rf+@0gVDfTQ6BPhf5/KcfdA0=<OBln'-
DBL>^3B9&J%15^=@;[2^AS$"*%15pS@P/d)Bl%U&@;]s76=jtL/0IN%@kJ2t8Q.rN+>>B-1c$pJ
2D$gA/MR\A%16!EAi^A.7<icf@;]LqDfU+G;g!%uCh7HpDKI"CD]j.8AKX9[FE2;;Df'2u@;I&P
Ci*Tu@:LE.0f_6L.1HW'0ekC*FDi:@0ekKo$;"/_:*;5B3AWNO0JY4<3%[&u$@[GQ%13OO7;QOP
ASuU2%13OO0eOSV8jlWX?jT,?FE2;;Df'2u@;I&Y6m-AiD.7's+D,P4+D5D3ASrW$@<?'6FD5T'
+=L2g.1HV>/g+P$?jTeHD.Oi%@:OCtEZf(6+A-cmBjkm%@qBP"F`M2-F"AGDDfTl0F)Z&8A8,po
+EVNE8jlWX/0JtE@r$"#ARloqEc5e;8hr(S0J5$g$8X:W?pnR=<,YZCA7,^CBPDN1BlbD*+Cf>-
G%G]8Bl@l3Amo1kDfQtCF(Jl)FDi:3Df0`0Ec`F7AS6$pATJu.DKKe>AT;j,G%#2uDKI!1$6UH6
Ea`Km@;^-=+<X`s+Dl7;FD5]1Gp$X/B6%QpF!+q;+EV:2F!,('@ruX0+EVNEDdmfsBl5&8BOr;t
EHPu=@;KLmF<GU4A8,IiF"Rn/1bKnYG@1_PF`_&6Bl@l3F(KB+ATJu&@q0XuF_kK.DfQtD@<-'j
@VfTb$8jFY@!=>5#u+u>DBNM,Df02rFD5Z2+E(j7FD,5.D/X?1+D,Y4D'3q6AKZ&:DCuA*2D-+[
G;<P49k@aN+EMI;@<*K!DJsB#Cj@WB$9'R[@!=D7#u+u>DBNb<DIIQ.@;^"#@;L3A%15'I+CKCM
?jTMLDIIQ.@<-"'D.RU,+E(j7CghF"FEM,*/e&.J/g)9EG;Wb79Q+f]BlnK.AKYo'+CT>$ASu$m
DJ()0De*E%De:,.F`(W.+E):0BlkJ9DBO%7AKVEh+<VdLARfOjE-,f(+CT=6D.R-sF`M&(+D,Y4
D'3q6AKYi$@;[3!EHPu5Dg3CCAftVmFCd'6$8F4e+CJ_KE-"EYB4)$@F`_&6Bl@l3Bl5&)@r,ju
FD55nC`mP4DJ*[*F_#&+AU&07ATMp(A0>T(+Co%rEb/g'/e&-s$4R>=F(KK)De!]rAKX9TB5_g)
FD,M6<,WmHDf'H9FCcRoBOr;]F`_&6Bl@l38T#YH@VfauF_PrC+E(j7FD,5.7:U.JE-,f(%16]c
EZee.Gp$a6G%GP68jlWX+@1$\F_t]-F=n"0%17Q5ILQW,<$3;H+=KiM<)atl+>Pc20f:dF.3L8d
1H%*G2%9m8<&,RZ+B0I5+B/dW+B1->4Wm]H.Nh\G%13OO+@KdR<,YZCA0=#X1G1C=0f:sH2Dm9J
3&roX1GU(++>Gi0%13OO+EoO_4Wm.(B2ieI@:Ui91-%9G3&NBG2BXLm1c.'F2E*6C0ekLE.T@N5
/Kc`"0JG4A0f1X8<&,RH+B1-M0fV0M2`)rm$6XOJ+?^i8AS4t\;IO)c-o3_>/i>CC2_lL++>Yl8
3B8]G2)$gC.T@N5+>"]i/het50fC^A.TA/G/Ke"K0/G:90JG10%145%1E\h'6tL"1Dc1"S.O[#-
1bLdH1-%<:.j-Z-2_d<P/iYaJ1H@EE<$3\60J5%53&WcU1+H6Y+=eR61G:UD1,Ua7%145%1a"q(
6tL"1Dc1"S.O[;5/i#@?3ADX!.j-Z.1GUX>/hf"=2)@3A<$3b80J5%51H%3J2(DQ\+=eR61G:O>
2_m<G.1HV,G;UL++@KdR<,YZCA1Au^1,U[<1c.'F+>"]j3AWKE0f(^C2DH[\+<VdW+>>E%0JY=@
0K:O]1*A(i<&60a2)$^<0I[G<%145%+?^iWDf[=N2(:"'3AN9D2'=Cl3%d3@<%/7`+Enqk+EnqY
+Cf>2-o*8#G;LEo+EoO_.j0$n.4H_p2)d<L+>"]l/hnhT.1HV,G9B$kG9ACY@rHE:1+F\r1a":k
G;Ufu.O[;92]s[p0J544<%/7`+Enqk+EnqY+Cf>2-o*8r2(:"'0J544<$3b83&riF%145%+?^ik
+=eREDf[=N1+=\$2)HF-+>>E&.T@i+$6XO84Wnqk.j/>?F!u5f+=eQi.O]Kt+>"^[0d%thG;Ufu
.O[&-1a"@m0J575<%/7`+Enqk+EnqY+Cf>2.!IHi.j-Ss.!IKj.j0$n.4H_p0eta3/Kc`"0e--O
%145%+?^ik+=eREDf[<^.O]Kt+>"^[0d%thG;Ufl/Kf6m.4Q`"/i+tV+>"]r2(8tA+Enqk+EnqY
+>PW).V!C<-o*8r1a":kG;UfY$6XO84Wnqk/Kcu+.V!C<-o*8#G;LEo+EoOh+=eRY2(8tA+Enqk
+Enq[+>kr)@rHE:1+F\r1a":kG;Ufl/Kf6n.1HV,G9B$kG9AI[1G^LjDf[=N1E\1jG;UfY$6XO8
4Wnqk.j-T*.V!C<-o*8#G;13j+EoXb.j0$n.3L2bG;CZW$6XO84Wnqk.j-W'.V!C<.!INk/Kf6n
.1HV,G9B$kG9ACY1,g[mDf[=N1E\1j1+IK)+=eRY2(8tA+Enqk+Enq[+>Pc'@rHE:1+F\r1a"@m
G;CZj.j0$n.1HV,G9B$kG9ACY0fCLkDf[<^.O]Kq+=eRY1a":kG;Ufu%145%+?^ik+=eQh1FcmQ
F!rdn.!IHi.j0$m+=eRY2(9s`$6XO84Wnqk/Kcc'.V!C<.!IHi.j-Ss.!IKj/Kf6l+=eRY2(9s`
$6XO84Wnqk/Kcc%.V!C<-o*8r1a":kG;UKp+EoUj%145%+?^ik+>"]q.V!C<-o*8r0d&%jG;C?l
+Eo[l%145%+?^ik+=eQn.V!C<-o*8#G;:9m+EoO_.j0$m+=eRY2(9s`$6XO84Wnqk/Kcu%@rHE:
G;CZW$6XO84Wnqk.j-i%@rHE:G;:9k+Eo[l%145%+?^ik+=eQn.V!C<.!IHi.j0$n+>"]k.X*Tr
%145%+?^ik+=eQm.V!C<.!INk/Kf6m.1HV,G9B$kG9ACY2(E*SF!rdn.!IBg.j0$m.3L2bG;C?l
+Eo[l%145%+?^ik+=eQj.V!C<.!IHi.j-Ss.!IKj.j0$j+=eRY2(9s`$6XO84Wnqk/Kci!@rHE:
G;:9k+>PDpG;LEm+Eo[l.1HV,G9B$kG9ACY1FcmQF!rdn.!IKj.j0$n.3L2bG;:TV$6XO84Wnqk
.j-Vt@rHE:1+F\r0d%thG;L`k.j0$n.1HV,G9B$kG9AI[1FcmQF!rdn.!IHi.j0$m+=eRY2'=In
G;1Nq%145%+?^ik+>"]l.V!C<.!IHi.j-Ss.!IKj/Kf6l.3L,`G;UfY$6XO84Wnqk.j-Vt@rHE:
1+F\r0d&%jG;CZj.j0$n.1HV,G9B$kG9ACY1FcmQF!rdnG;13j+Eo[l%145%+?^ik+=eQj.V!C<
-o*8#G;LEo+EoOh+=eRY2'=InG;:TV$6XO84Wnqk.j-Vt@rHE:G;UKp+>PEj0e!P=+Enqk+EnqY
+>YKWDf[<^.O]Ks+=eRY1asOt+Eo[l%13OO+Cmo[F$sSP+?^ik+>4in2D?g=0JG0i$6XeHIW0=B
EbTT+F(KGK0ht%f.WBECEbTT+F(KG9F"JsdF(KH9E$018F(KE(F<GOCDe`inF=n"0%16T`@s)g4
ASuT4-XpM*AL@oo%15is/g+tK@:UK.A79Rg06;,LBlmo6%13OO@Us1_F'iWrDe*3<3ZpLF-n$HW
D.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/15%PFE8RIFD5Q4-Qij*De'u"A8,Op?YO7nA7$H`+>Y-Y
A0<6I%13OOC2[X(?YO7nA7%J\+DPh*B4#@fDe*3<3ZoejBldj,ATT:/$4R>@5upEG9gr/kBkhQs
?Q_Km+?MV3Ap&3:-OgCl$7BP&De(4<B4Z1*GT](/-ZjDPAnQ-,BkCitA7BV%E[Mt=$4R>;67sC%
ATT&9D09fCFCfJ8F`V,7+DYP6F!*%WEb0<6@<-H48g&4o+EV%-AKYPrAn>Io%17/nDfp/@F`\`R
F`V,794`Bi+ED%7ATT:/$7L"785E/`+?L]m3Zosr0d(FL@r!2D+D58-+=D2DF(KE(FB*BnE_Bth
F!iCZGB.D>AKY`,@<?0*-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<G=:A7o7`C2[Wi
/12QZEc5](@rri7ATW'6-OgCl$>aWhA0>W*A7o7`C2[WiEbTT+F(KGnF(KAbAU/>P2,6Ij+E_a:
Ebf63F"Us7B+52C67r]S:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!
Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@
Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBL
G[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,
E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZS
F)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"
$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6
+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/hAooOm2^/\<%15Q[4#&fpASkjkAKX?_EcP`/
F?=;W@:UKqDe*KfBkhQs?Q`Pq0d(LYF<Dr?F_PZ&?RIC>De*KfBkhQs?Q`Pq@r,^bEZc_W%15IE
Ebm6q1-73P;e:%n6ZmEiASuTOEcW?NE,o]6Bldj,ATT:B>9Iip+=CcDFE8fP>9G^EDe't<-QlV9
Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M
%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!
8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ
6tKhMB-:)pDEDB<Ecl7B-RT?17Q*=_4&fd4F<FM!DeioG1a$g\F<G=:A7o7`C2[Wi%16$IBkDH;
7Q*=_4&fd4F<FS$BllEk+EDRG+DPh*B4#@fDe*3+-XUG+E+NoqCL;."Deio3%15Q`4#&fbDe!p,
ASuT46ZmEiASuTO0d(LYF<Dr?F_PZ&?RIC>De*KfBkhQs?S!R3A8bs*                   ~>
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
zz=:zz,'(<<;._1 '' riseset BOM CR DAYSECS IFACEWORDSriseset LIMITHORZ LIMITM'
zz=:zz,'AG OBLIQUITYDMS2000 OBSLOCATION ROOTWORDSriseset STDALTITUDE UTCOFF'
zz=:zz,'SET VMDriseset alldifs apparRADEC apparsecs apparsidjd0 apply arcco'
zz=:zz,'s arcsin arctan assert atan2 boxopen cold_iau_named_stars cos cosd '
zz=:zz,'ddfrdms deltaT0 deltaTdy dfr dmsfrdd fdfrhms gT0jd gT0ymd hmfrds ia'
zz=:zz,'u_today intr3p julfrcal loadstars location_home location_uluru loca'
zz=:zz,'tion_yellowstone meanobliquityT0 meanobliquityT1 meanobliquityjd0 m'
zz=:zz,'eansid0 meansidjd0 nnth0 npth0 nth0 nutation_longitude_dPsi parse_i'
zz=:zz,'au_named_stars parsecsv parsetd read rfd riseset riseset_calc round'
zz=:zz,' sin sind smoutput zetzthT0''),<<;._1 '' risesetUtils J2000ymfd atan2'
zz=:zz,'b dsfrhms fdfrhms meansidymd0 nutation_obliquity_ecliptic_dEpsDeg r'
zz=:zz,'jd tabit yyyymmfd''                                                 '
zz=:755{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fC.0+>P&u+>l/9+>GVo1bpn.Bldj,ATU[6/h1mUF(KE(F<GWV/KePAD/aW>AKZ#-F(HmFFE1f-
F(o_=@;]TuF(KG9FD5T'F!,C5+A"k!+DtV)ARlp)FCB32/e&._67r]S:-pQUG%G]'@<?4#3Zr-S
FCfK)@:NjkGAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9N@<Gq!De*:%+>"^R
@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7A79`m$;No?+<YK=@:XG$@<-E3/KekJ@:XF%
EbTT+F(KG9F*(i2+Cno&@1<Q=67sB'EbTT+F(KG9+<W6YEbTT+/0K%T@;^.#F=\PUATT&:Bl.F&
+E(j7F*(i2Et&IO67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,EcUE\]Wt-u!+4?Z^4(BkM+$.3NYBDIIBnA0<:7@<Gq!De*:%.3K',:-pQU1,EcU
E\]WtG%#E*Dfp+DCi<flFD5Z2+EM+9FD5W*+Eh=:@WNY?Ci<flFD5Z2?Zg1-EcifR@:Wn[A.8kT
$=e!aCghC++=D2DF(KE(F=.M)EbTT+F(KGnFD5Q4:-pQ_EbTT+F(KG9F=f'e@rH4'F`_1;EbTT+
/0K%T@;^.#F<G"0A0>r)F<G[>D.Rc2De:+`5uf%F@;TRd+EMX5EcWiB$;No?%15is/g,=KEaiI!
Bl,mRBl8$(Eb8`iAKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU+Dbt)A92j$
EcW?T+Dbt)A9/l6Bldj,ATT&9FCB24A79Rg%15is/g)9WBldj,ATT%;+>"^VBldi:+EVX4DKBN6
/0K"FF<G[>D.Rc2De:,5FCB32%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`$r$=e!aCghC++=D2DF(KE(F=.M)                             ~>
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
0ea_)+>P&u+>Yi11id;OATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
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
EbTT/DJ(VDATW$.DJ()1G%G\::MaPa7U^"QBP)C'%16fXF^K6/A79a+0F\A<IXZ_g%13OO7W3;i
D/XH++Co&*@;0P!+CS_tF`\aIATW$.DJ()7E%E,PF`))2DJ(LC@;]Tu,%tCpCM@[!+s:96Bldj,
ATV<&Eb/ioEX`@tD]j.8AKXTfE-ZP:EZf7<FCep"DegJ"?uft&ATMF)?Z'e(AR]RrCG'=?H#@)!
>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(oBOPCdF"_!=DdkA:@;0U4EbTT+F(KH#
DJsW.@W-1#/no9MDIP%;DfQtBBOr<*A7cs-ATDj+Df-\9Afu/'D.O.`>@;JcF(KE(FC/p(FCep"
DegtEA7f4T-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$.!@:O(o04Ja9@P;S,Bl5SE
Bldj,ATV9sDffQ"Df9DDE+EQ0/g*K!FD)e8Afu2/ATME*Anc'mF!+n3AKY])F*(i,Ch7-"GA2/4
+CK5(F(KE(FC6^1$4R=O$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHZEhAATMF)I3;+!FCfK)@:Nks%13OO
IXZ`p+F>4`C*7p6$6UI1@<-F#?YNqk?Z':hARo.hFCB32+<VdL+AP6U+Cf>-G%G]9+A"k!+C]G&
C`mh<+Cf>+F_u"=A8,OqBl@ltEd8cM+<VdL+<VdL+<VdL+<Vd9$6UI$DerrkBjl-kDIIBnA7'D"
@<-E3+<VdL+AP6U+A"k!+DtV)ARlp)FCB24Ch[s4+EVNE@WZ*r+D>=pA7]d(FCAWpAKW*<+<VdL
%17Q5IXV_5%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOEbTT+F(KHA+@0gVDfTQ6BPekeDffQ3I16Mm
$4R>:@;^?5+CK5(F(KE(FC65"ChI[,Bln$*F!+n3AKZ)'CLqB+Ao_g,+A-3RDBMYbAT`&AF!+q1
DegIF6$%-gDf0K1Bk(Rf+@0gVDfTQ6BPhf?/e&.R+AbHq+Cf>/Gp%$;+EV:2F!+q1DegJ0F!+n7
@;0Od@VfTuBOu3q3XlE*$<q1cFDu:^0/%$J3&!*I0K1V,F"UmA@q]S"AM.nAB.l"o055N>D0%@=
F*)G@DJsB+@ps1^ChI[,Bln$*F)#8pDJ`rrF`T8t3AE0m-tm^EE-"&n054iS0JYUA2_K5o/n&d1
BPDX$/oPcC0/>47Blmp'F"^sCFE2;;Df'2u@;K@gB5_g)FD,N4C1UgkD.R:$F"o[80eXsb$4R>N
CiaM;BOu3q3XlE*$<q1cFDu:^0/%NnG:m<@@<uj0/n8g:069?l4`b^cBlIO"DejD@EbIUT?SXPd
1I4WE@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgDF?N6-@;[SiAS$"*-?<[04_/M=@X2d(DIm0r
EaN9oDei]7>psB.FDu:^0/%NnG:m<@@<uj0/n8g:069?l4`b^cBlIO"DejD@EbIUT?SXPd1I4WE
@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgDF?N6-@;[SiAS$"*-?<[04_/M=@X2d(DIm0rEaN9o
Dei]7.1HUn$;P_c@<?4%DBNA(B5_g)FD,N4+CT;%+D,Y4D'2GZGp$'pDJj$+-Z^DOBlmoI%13OO
>A/,#E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2r-tm^EE-"&n05b?>
E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2>%13OO9jr'XA8c[0+Eh=:F(oQ1F!,C5
+B2ceDImi9F!+n-B5_g)FD,N4+CT;%+EMXCEb/c(Bl5&8BOr;Y:IH=5Ap&3:?m&lqA0>9&FD5Q4
?m&uo@ruF'DIIR"ATJtG/M/)dAS!n3$4R=s/g+P>F`_&6Bl@lrBl79oDf03%FEM,*?XuuSBjY^f
?k!GP$8O4V?uC+/@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1Bk(L\7<!<9AS5@eA7,iR%16fe
3XlE*$<q1cFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGAp&3:
/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGAp&3:
/no'A.1HUn$<q1cFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJG
F`_>6F"V0AF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;S,F*(u6
06MANCi_4CC3(g5$4R=O$:JHAFC?:k+=PO"<%/r(F!+t2D/aW>ARlp+F(oN)+E278H#@P;Bjkg#
AU&07ATMp,Df0V=@X0(bF)Y].@;?uoDIakaAS$"*/0K"FANC8-%16<QFEDJC3\N-t@r,juF(Ht:
F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYi"-tm^EE-"&n04eX0BlJ-)/n]6;
@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=/nf?DCaff#%15BDD..I#A8c[0+Eh=:F(oQ1
+E(j7FD,5.6tL1V@3AMl.*e&V.3N&8B5_g)FD,M6BlbD2DBN>!F`_\4+EM+*3XlE*$8F.U?uBCo
@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys=]%13OO%166VFWb1&DBNJ(F)Yr(
Gp%3BAKYhuEbf3(GA\ODAS,LoASu!hA0>;iDfp.EGA2/4+EV:.+A,Et+D#e:Eb0<5Bl@m13XlE*
$@[GQINWt[/nuMW%16oi@:UK.B4YslEa`c;C2[W1%17#a+?MV3Ap&3:+E_d?Ci^s5$;No?+Co2-
E,8s.+DkP-CLh@-DBNJ.@s)X"DKKq/$8`l9Ble594!8r(5U\H9A8Z34-8%J)-Z4'K@<?4%DI4bQ
-Z3@6@:(Ak$@[GQINT(,%15g<DL!@9G[YH.Ch7Z1F(fK9Bl7Q+BQ&);FDi:EF(HJ;@<-(#F`S[5
EbTT+F(KH$+EqaEA9/l%Eb-A-DBO%7AKXT@6m,lLF`_\4+EV19F<GXIBlmo/?uft&ATMF)?nMlq
=`8F*@ps6tA8-+(CghT3@;Ka&FD,5.FCfN8+Cei$ATJu<Bln#2FD,5.8l%htAU&07ATMp,Df0VW
%13OOIXZ`p+F>4`C*7p6$8Wf;Ec<-KEbTT+F(KG@+<Ve%67sC&ATMr9@psFiF!,17+EM[>FCbmg
%14m6A8-+(+=D2DF(KE(F=/1R:-pQUA8-+(CghT3FCfN8+EM[>FCbmg%14p7EccCG-ZWpBATMF)
-QjNS:-pQUEcl7B@;Ka&FCfN8F!,17+EM[>FCbmgIXZ`p%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13                               ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' riseset riseset_atan2_smoke riseset_espenak_smoke riseset'
zz=:zz,'_meeus_smoke riseset_riseset_smoke riseset_tanner_smoke''           '
zz=:123{.zz
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
1E\P#-p0UR/mg=U-QkfC=]7aV;]nY$5sn(B:JsSZEbTT+F(KG98hr(S0R7MIA0=Q;9hA;T:Jt@=
9M%rM<)#YK+AY<t8PrJZ<*;U`;]nk&9M&)]8Q8h\9iEf$0JFVF6;pQR6U=[C:JN$1:JXqk:JsSZ
EbTT+F(KG9;cH.N9N4S_<CB7u<E)=]7Rg<F<$5496um!_ATMF)+CT)&A8,Xs+CT5.@<,736q'Hc
@;p0oEcYf%F!+n1E+*d.Bk1sh0HaeG@;[hC@<>pq11DA9DerrkBjl-kDIIBnA7'D"@<-E3A7Tan
EbK<2+Co&"FCA-&+Co&"FCA-ZGp$X=Ao_R%F!,(*Ao_R%F!,*p0PY,@B2gR1D.Fc&D.[g!F!,.5
F(TH'A9/l,D0'<0A9/l-@<Gq!De*:%+DG8,?Z^4(BkM+$+DG_8E\hYWCi<`mF*(i2F!,:;@psIn
Df/oqDf'&.Ci<flFD5Z2?Zg1-EciL@De!3tBl@lrH"Cf.Dg-8EDf0,/D.R-nDdmNsEHPu;GuQI?
D.R-nDdmNsEHPu;GuQL@D.R-nDdmNsEHPu;H"pkD+Dk[uDKBN&0Hb4D@;^.#A85X/+Dk[uDKBN&
H#7(G+Du(=BJ:QHE-,bI+Du:70Hb7UFCB9*Df/ouDf03%FEM,*?XuuSBcq;9FCB9*Df/p#@Vfau
F_PrC?Y*_`BlJ0.@p`b8E-"EYB-;/%EcYf!Bjl-kDIIBnA7'D"@<-E3EbTT+F(KG9EbTT+F(KH#
0f1"nBldj,ATV9h@;KErEbTT+F(KH#@ps1`?VXBr78k=LBldj,ATV9m@<6*m@<?('Eblk=C1JH/
A0>u4A79Rk+EVO4@<la/+F/6XH#7D1A0?20FF&%B<%o[K/1<VC4"akp+=A:@F_PZ&?ZKk%ATMF)
+C]J-Ch-mnBldj,ATV9iDdso1Bldj,ATV9fFCB&B?ZU(&CLnW/Bldj,ATV9jF)Y].@;B4kD/X3$
+ED1;ATMF)?Ys@cF`Uo2D/X3$+ED1;ATMF)?ZKk%ATMF)?ZU(&CLnW/Bldj,ATV:$@;]soEaNm)
Deio3.4cl04?G0&0d%hdEbTT+F(KG9EbTT+F(KGnFD5Q4-RgSp4=iTBEbTT+F(KG@.4cl04?G0&
0d%hd6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2d^E4+AQ?gBkLjrBl@lr;flGg
F'j$6F<FCU;cI+EBldj,ATT&'FCB&B?Y+IlASb^qG]Y'B@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmM
DIITp?Y!_aFCANu?Ys<rDIITp?Z9q"H#@P;BjkgbAU&07ATMp,Df0W'AoD]sA7]S!@:++`D.Fc,
F`_&6Bl@lrBl79oDf03%FEM,*?XuuSBjY^f+Du=D@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1
Bk(L\7<!<9AS5@eA0>i3C3"$0ATMF)+ED1;ATMF)<HD_l94`Bi-RgSp4>J$:3@$@61,CU?1,pmC
2*!WP0JPRI1a"P-1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,(=;3B/lP1c[6J2]sk01,CU?1,pmD
1,(I<3A<EK3?U(21,CU?1,pmC2_d*H3&ENJ3$9t11,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?1,(=;
1GppA3A`NK2'=Y.1,CU?1,pmC2_[!E1G^jE2BXb/1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,pmB
2Dm<K2E!BK1a"P-1,CU?1,pmC2`*6D2D[6L1a"P-1,CU?0KCaC0eb@>2)[-D2BXb/1,CU?1,LU@
1,:RC1H@3G2'=Y.1,CU?1,(=<1bgdD2)7-O2'=Y.1,CU?0f^jE2`WlU1,:gL3?U(21,CU?0f^jF
1H%!D1H70F3$9t11,CU?1,:I<2`3QN2DmHN2]sk01,CU?1,:I=1H$sB3&**C2BXb/1,CU?0K:[B
0JYID2E<HN1E\G,1,CU?1,:I?2_d9G0f1X?3$9t11,CU?0fCX@2DI!C3&ETO0d&5*1,CU?0fL^A
1-%$K1H@<N3?U(21,CU?1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU?0KCaD
3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?1,:I?
2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU?3A*-E3ArcU2*!KK+>PW+1GCU?3%d$H
2`EHH3B&c;1,(I>0JbI@/i5I@2)?s@1c$j/1,(I>0JbIA/i5:@0K1aI1,h$41,(I>0JbIE/i5CA
1c[BI2Dm?71,(I>0JbIE/i5:<1cR9K0fLg01,(I>0JbIE/i5@<2`!?P2`EW;1,(I>0JbF@/i5C?
2)-dC2D@'41,(I>0JbFA/i57=2_m3J2`<E61,(I>0JbF@/i5C=0f:gH1cI?91,(I>0JbF;/i>XF
0JbL@1c%$41,(I>0JbCC/iPL=0fCsL2DmB81,(I>0JbF;/iGC;0JGIF2`*B71,(I>0JbF;/i>IC
2Dd9G0f1".0JYF<1GLmB2_[0J1GU^G0Jjn-0JYF<1GLmB2_d!F0f1UB1H?R50JYF<1GLU:2E<ZQ
1H@6G2DZI20JYF<1GL[<2)@!G3&iTJ1,pC30JYF<1GC[=2Dm3K0fCpG1,^710JYF<1GUg?2)6sF
2)%$G2`;d60JYF<1GUmA2)[BJ3ANTM2]sk01,CU?1,ggB2)I'G1-%6J+>PW+1GCU?3%d!F2`!HJ
3B8o=1,(I>0JbCC/i>@;0fCjJ1H7051,(I>0JbCC/iGXK1c@-D1,1X/1,(I>0JbI=/iPLB2E!9K
2_d351,(I>0JbF?/i5CF1H$pF1,L+/0JYF<1GL^=1c%!D0ebLG2)cX50JYF<1GLa>1c@*D1,:UB
2`Mp80JYF<1GU^<2`NTM2_d6J3&2U30JYF<1GUpB1c79Q1GCOD3&Da50JYF<1GUsC1c.'M3&<EP
3B83;0JYF<1GUX:1c[NQ1Gh*G2E)a60JYF<1GUpB2)6j@0f^pI1H?R50JYF<1GUpB1cI-F2E3NO
0fU:20JYF<1GLd?1b^XD0KCjA2`2^50JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D2)@$F
1c?I30JYF<1GUsC1c.$K0K;!F1-$I40JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G0fCgG
2DcO30JYF<1GUsC3AWTN1c.$G1cHO40JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUa=1c73O0JbLD
3B&'90JYF<1GLmB2E*WV2)6pH3B83;0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1GU^<1c@*G1bgmG
2E)a60JYF<1GU^<1c%$E0fUmA1H$@20JYF<1GUd>2E!HN3&<<E2`Dj70JYF<1GU^<2E*?M0JPC>
0fU:20JYF<1GLjA2`3QQ1,(LA3?U(21,CU?0fL^A1-%$K1H@<N3?U(21,CU?1,U[D0K(pG2D?gB
3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU?0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG
1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?1,:I?2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H
+>PW+1GCU?3A*-E3ArcU2*!KK+>PW+1GCU?3%d'J0fUjH1H@351,(I>0JbI@/i>F=0JG4<1,Ld0
1,(I>0JbIE/i>C<2)dHJ2DI371,(I>0JbIE/i5CA1c[BI2Dm?71,(I>0JbIE/i>IG0JP=B0f(a2
1,(I>0JbIE/i>OH2DdBK3B&`:1,(I>0JbI</i5@C1c@0L3ANB51,(I>0JbI</i5@D0f:dC2E;m8
0JYF<1GLmB2)6sJ3&NNO2)?@10JYF<1GLR92*!TR3&ETT2`2^50JYF<1GLR92*!TU3&<6F1H$@2
0JYF<1GLR92D?sD2)7'L2Du[50JYF<1GLR92)I0K1c7!B1a"P-1,CU?0f^jF0K1jF1,:jD1a"P-
1,CU?1,(=;2)$jC2D[3H2]sk01,CU?0f(F>2E3KN0ekLA2'=Y.1,CU?0f1L?2E3WO1GUX@1*A>+
1,CU?0fCX@1Gq'M2_d9O0d&5*1,CU?1,pmF1c[KQ2_m9O3?U(21,CU?1,ggC2_[*K3&``L0d&5*
1,CU?1-$sE1,1dE2Dm3G3$9t11,CU?1,pmB2E*EP0KD-M+>PW+1GCU?3A*<J2`*?K0fV'G+>PW+
1GCU=3A*3K3A`WM0JY@?+>PW+1GCU?0ePC>2)[?I2`EHL+>PW+1GCU>1bLUC1H@HL0JbUD+>PW+
1GCU>1bLUC1H$sH0fCjH+>PW+1GCU>2(g^E1GgjB3A<6I+>PW+1GCU?1G1IC1c[BK2).'M.4cl0
1*AM$1,(I>0JbCC/i>@>0KD*L0Jb[21,(I>0JbCC/i5RI0f:sJ3AN?41,(I>0JbI>/i,IH1GpmB
2_m?81,(I>0JbFC/i,LC1b^gA2)@371,(I>0JbF=/i5IE0fUpC2`;d60JYF<1GUmA3AE6H2)d6K
2E;m80JYF<1GLX;1cI6J2)mEJ2DQC10JYF<1GUsC2)7'G1Gh$I1H?R50JYF<1GUpB2)mTQ2*!NP
0K:110JYF<1GUpB1b^^A3&<BO2_cF10JYF<1GUa=1bpsD3A<BL1,U100JYF<1GUpB1b^pJ2`!9N
2_cF10JYF<1GUsC1c@3J2E<NM3B/-:0JYF<1GUa=1bpsH1,_*G2_lg5-p07-1*eV/1,CU?0K:[B
1bga@2)d?I2'=Y.1,CU?1,pmB2_['K1,(^E1E\G,1,CU?1-$sE0f_0Q1Gh*L2'=Y.1,CU?1,pmC
0K:pH1c@'J2CU1*4>JTG1GCU>1+kCB3&r]L3&!6I.krn63ANBH3&EHK2E!EH2`*<J.VULj+>G;r
-p07-0ejq/0JYF<1GUmA2)%!E3Ai`R2)?@10JYF<1GUd>2_[$G2DmBM3&i$90JYF<1GCgA1cRHM
3&iiN1c$700JYF<1GU[;1bpdC0ebC?2DQC10JYF<1GCU;2E!EL0K1jC0esk,0JYF<1GLjA1c70G
0K:mC1,U100JYF<1GL^=2_[$C1GCL@3&)O20JYF<1GLU:2E*<D0fLgA3Ahp70JYF<1GLU:2E*TP
1,:U@2'=Y.1,CU?0eb4:0K1aA0fLgC2'=Y.1,CU?0eb4:0K(aG2`NfQ1*A>+1,CU?1,ggC0K:dI
2)dEN1E\G,1,CU?1,ggB1cI0D2`EZT2]sk01,CU?1-$sI1H.-I1c.$G2]sk01,CU?1,1C<3ArTJ
1c@3I2]sk01,CU?0K(OB0JkI<1H70F3?U(21,CU?0fUdB2)[0C3&E<E2'=Y.1,CU?0fCX@2)7!D
2)d9N2'=Y.1,CU?0ek:=2_Zp?2_d$I2'=Y.1,CU?0ek:=2`NWL1,:XC+>PW+1GCU?1bL[E1b^jD
0etaL+>PW+1GCU?3%d'I1GCRD1,L[A.4cl00I\P$4>838-p014/1<V7.4dS8              ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
