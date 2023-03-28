NB. JOD dictionary dump: 28 Mar 2023 14:33:50
NB. Generated with JOD version; 1.0.25 - dev; 7; 24 Mar 2023 10:24:22
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

IFACEWORDSriseset=:<;._1 ' iau_tonight loadstars riseset'

J2000ymfd=:2000 1 1.5

LIMITHORZ=:20

LIMITMAG=:3.

OBLIQUITYDMS=:23 26 21.4480000000000004

OBLIQUITYDMS2000=:23 26 21.4480000000000004

OBSLOCATION=:_116.375956000000002 43.6467749999999981

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset iau_tonight yyyymmfd'

STDALTITUDE=:0.566699999999999982

UTCOFFSET=:6

VMDriseset=:'0.8.0';7;'28 Mar 2023 14:20:21'

riseset_hashdateurl=:<;._1 '|7f8188129e318503e0396ff575fa874d23480bbb66d1708da1362baacd05db15|28 Mar 2023 14:20:21|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

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
NB.   NB. needs (futs,utils) dictionaries
NB.   od;: 'futs utils' [ 3 od'' [ require 'general/jod'
NB.   loadstars 0
NB.   
NB. dyad:  blIAU_Nav=. pa loadstars uuIgnore
NB.
NB.   1 loadstars 0 NB. define columns
NB.   loadstars~ 1  NB. shorter idiom

0 loadstars y
:
NB. load IAU stars !(*)=. get
ciau=. ; {: , > {: MACRO_ajod_ get 'iau_named_stars_2022_txt'
ciau=. cold_iau_named_stars parse_iau_named_stars ciau

NB. load navigation stars
cnavs=.  parsetd (; {: , > {: MACRO_ajod_ get 'Navigation_Stars_txt') -. CR
cnavs=. (0 { cnavs) ,.  <"1 |: }. cnavs
'star column overlap' assert 0 = #(0 {"1 cnavs) ([ -. -.) 0 {"1 ciau

NB. define columns - override mixed assignments (<:)=:
if. x -: 1 do.
  (0 {"1 ciau)=: 1 {"1 ciau
  (0 {"1 cnavs)=: 1 {"1 cnavs
end.

(<ciau),<cnavs
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
NB. dyad:  blYmdUtoLB riseset blclStarNames
NB. 
NB.   LB=.  _116.375956 43.646775    NB. Meridian 
NB.   YMD=. 2023 3 27
NB.   UO=.  6
NB.   (YMD;UO;LB) riseset 'Algol' 
NB.   (YMD;UO;LB) riseset 'Algol';'Rigel';'Spica'

NB. local time, UT offset (0=Greenwich), Latitude Longitude
'ymfd uo LB'=. x

NB. convert LB to meeus convention
LB=. _1 1 * LB

NB. local time to UT
UT=. ymfd + 0 0,uo%24 

NB. look up RA, Dec
'IAU Navigation'=. loadstars 0
NB. IAU stars !(*)=. IAU_Name RA_J2000 Dec_J2000
({."1 IAU)=. {:"1 IAU
Stars=. boxopen y

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
NB. going to change a lot over the interpolation period
dTfd=. (,/deltaT0 deltaTdy ymd) % DAYSECS

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
1,q-62)6:0+?(Dt2'=V4+>beq3?U78+?:Q"1a"b#0fU:11*AJ5+>Gbs2`2^40d&>0+>Gbs1bg+-
0d&D1+?:Q"3?U%1+>Po!2]t"<+>GPm1c-=8+?2%t0eje03?U1%2)$.2+>u5&1,'h,2]t(&2`;d;
+>Pr"3$:(:+?(E%1a"_"2)$.1+?);'2BXq5+>t?#1E\Y"2`)X9+?)"t0eje,0d&@s1H6L;+>P_q
0f:(12'=V2+>c&#0fC.30d&Fu1cQU40H`8.+>GSn2)$.1+>u"u2'=e4+>b2t3?U(5+>tqs1Gp:5
1E\G-+>bbp2]sn4+>GVo1G^..3?U.=+>Y,q1E\Ru1G^.4+>c#"3$:%8+?1K$0LS30;aj&PF(Jj"
DIdf2E+O&4A79aT7R9C1=&2^^;fZSnATMF)Bl8$(Eb8`iAKZ28Eb'56-qQlo6Ub'P;FFH(Bldj,
ATT@DB6%p5E(Vl>0JIchAn5IlDe!H'8hr(S0J5%%H"CE)/0JeJDKKPC+D,Y&@ruF'DII?(A79aE
+>Pc20f:dF+?^i^F_kZ1@ps0r8hr(S0R7MIA5#Qh8Q85V;HdaPEbTi<DBNb0D/")7Bl5&(AS6$p
ATLO:9hA;Y5t>a*D/"*+DJ()/@:sIlFEM,*:I7`H;,p1e=[Yt_@;p1+Dg5u5@<?''DdmNsEHPu;
Gp%$;+EV:.+D#&!BlJ0.@j#K'+Co%rEb/g'/0JeDDKU&4F"AGTARfXrA91O59M&)]8Q8h\9iEf$
0JHpSE,olABl.:#AKYQ'De!H'8hr(S0Hb:CCh[m3BlnVCDe:,6BOr;t@r,juFD55-A7]CoAS#p6
+Dkh1F`_29/0K"F@rH6qF&,,$9M\#A<(Tk\Ddmd!Ecu#7+DbJ.BlnK.AKYf-DJ*[*F_#&7+EqC<
F<GC<DJ*[*F_#')+Dtb'@<?4,APu<"<*)jn6rS,?F(KE(FE2;<F<GdGEb'56-rNi:<*)jn6rS,?
F(KE(F=A>FEc6)>+<VdL+<XT^6pXLG8Q8\X7<<QZDId0rA0>;sFD5i>A7Zm)FCB32+>"^GDf'H)
DKB6.ATJu+DfQt6DfTQ<Df-\+FDYr;E+ig'Bk&9+AS,sk@ruF'DH0Y':I[fP79!8d6QgJbD.Oi9
Df0,/De<U&ATT&/DBNV2F`MP(9gj#9F(KE(FEV59F(oQ1/0Je<CLnVuDfor>+CT.u+Cno&ARTCk
A8,Xs@;Ka&H=_,8/0JP=EcZ=R+EM+(Df0):+>,9!+Du:7+Co1uAn?!oDI[7!+E(j7DJV?V@;Kaj
BkDE/5;"ZE,;Cl+@;p0oE`,1k771L&E+*cuDKI"!5p0TRA0=9/6QfuZEZeq4De!H'.!R0`Ao_g,
+A+CC0JHpSE+*d.ARfe&ARfXrA9/l'DfTl0@ruF'DBNA,E+*cuDKI"BBk1dqARTBtFD5T'+>"^Q
AS$"*+E1sG+?22#/KcIeP]1\X+=\LDDf[=<E-!HW0/5=mE,]6+F(o0"A2%G2E+*cuDKI!kEb/g"
GA1Q#+EM7-ATD?jC`k;PBPhfO+CT5.@<-F'A85X/+DQ%8Ao_BiC`n*d+>PW+1E\Cp1FtRA3B8f:
1*AP/2.:T8DDGX@@ru-sB4Yt&+E(j7-s7Z=+BU'8AoD]4FE_XG@<-"'D.RU,F!,17+Co%rEb/g'
@<>pq11F[.FCfK1@<?''@<>pq1*CaOEag.C+CT;#FCB'"ASuT4De:+?=<Jn4GpskMDBNJ$B6%Qp
F!*%WF(Jo*-t.4+DDEYNDerrkBjl-kDIIBnA7'D"@<-F!Df0`0Ec`Eq5uf%:FCT,0FDi:3DesQ5
DBNJ(@ruF'DIIR2A7TanEbK<2A7]7bD..6'F(Jj"DIdf2Ao_g,+D>\9EcWcSD/!m//0K"F@ribE
+DG_:+=Lo?F(TH'A901\+Co#(Ao_R%F!*7]0esk+0ePI?A7]S!@8npkH#@&-Bk(Rf+EV=7AK]9_
<$5mm+EM+(Df0*,A7]S!@8pc_A7]S!@3Ej[<$5^_@qfdgC`n"7@<+COA7]S!@8pc_+>PW+1E\Ir
0esk&/g)l/2)ud61*A;+A92@'BPhg$ARfFk@;I'-ARfXrA9/l*Ec5e;BQ&$6F"AGNBl7uC+EM+(
F!*%WBl8):-tmI=Ao_F'.68S^F(TH+D0$gU+>GVo0ek:@0P4j-EbK<2Ao_<iFD5Z2@;I&s@<iu-
Ec5e;BPhfO+>>E-0K([D+?^iZA7fjqD0$gS3?U(3+>@G-0PY-1Ea`I"Bl@ltC`m5!DKL#ABk;?.
Ao_g,+D#M1@qZuW1,(C9+AHEYF`S[EB.b;d1HHXk<%r&t+DQ%8Ao_BiC`kGm2)cX40H`2)3&,&F
0R7MGAo_<iFD5Z2@;I&rASuU4EbT*++D,Y4D'3D/De!H'8hr(S0Ha)$AT`&:E+^dG3&<T<B2gR1
D.FbD3Ai`<0ea_,/iYS!D.[g!F(fK7EcWcSD/!m1FCfM9Ao_g,+Co%nBl.9p+EM+(Df0*,3Zr*Q
Ao_F'+CoP*EbK<2+>PVn1,g=41G1F=BPhg&Eb&^%+D>\9EcWcSD/!m//0K"F@ric)Ec5e;A7]7b
D..6'F(Ji(/Kf<]4<QUA1b^UE+Co#(Ao_R%F!,.5F(TH'A9/kP1,1R;1c8r`F(TH'F(fK7EcWcS
D/!m//0K"F@ric)Ec5e;A7]7bD..6'F(Ji(/Kf<]4<QUA1b^UE+CoP*EbK<2+D>V5Ao_F'+?)&1
1G1LABjl-kFDl&2B4uC)@;TRd+A"k!+EMX5EcW@HBldutCh4`2Df09%BQRs+FE00VBl8$(Ec>r5
@<?''FD,]+AKZ/)Cis<1+>"^QAS$"*+E1s91,Wld@:XG$@<-F*Ddd0t+ED1;ATMF)+EMX5EZen$
FCB#t@;^!mCh[m3BlnW"0PtB0DBNk,Ch[m3BlnVCDe:,6BOr;t@r,juFD55-8O6?!Bl5&(AS6$p
ATM^"@;^!mCh[m3BlnW"0l:K1DBNk,Ch[m3BlnVCDe:,6BOr;t@r,juFD55-9OW!X@<*K)DBNJ$
B6%QpF)>JsDJs!#BlS90FEqV30PtB0DBNk,Ch[m3BlnVCARfOjE-,f(+D,P4+A-cmBjkm%A79Rk
+=MLa+Co%rEb/g'D.R-nF(o/=D.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4<$3T6
.3M5N+=MLaD.R-nF(o0"A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZf+>Ch[<q
+Cno++=MLa+DG^9A7]CoAS#q"ARTItBk2L+A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)
BHUo*EZeLZ6m-2]+Co%rEb/g'DJjQ00Q(fLD..6pH=\4:AS5FnBm+&1A7]CoAS!!*Bk1dqARTBt
FD5T'3Zr<XFD*?N/MT.B2`NTJ/i#=?0etXFDK']20Q(fLD..6pH=\4<Df]W7Bm+&1A7]CoAS!!*
Bk1dqARTBtFD5T'3Zr<ZFD*?N0fCsL3&<9A1,^mB1,_%.FD*@GDfT]'Ch\3,+Co%rEb/f)F(o/r
Eb/Zq+EV=7ANCrOFD*?N?SaPs2)QL82`EZSDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig>gF`_&6Bl@l3
Bl5&)@r,juFD55nC`mP4DJ*[*F_#&+Bl5&(AS6$pATJtB0f_3I+DG8,+EV:.DfU+PDKU&0FD5Z2
?Z0CiBlS90FEq5)@r,juFD55lA4:HY6tL"KF`_&6Bl@l3Bl5&3@VfauF_PrC+E(j7FD,5.ARfOj
E-,f(+Co%rEb0<5+=Js)3%uIh@<E]6ATDKrF")':EcYf!Bjl-kDIIBnA7'D"@<-E\5uf%F@;TRd
+EMX5EZf14F*&OHD]iM2@r*9$ART+\EZfI4@VfUrBldj,ATVs,F(HmFFE1f-F(o_I+EM+9+EV=7
ATJu4Afu/:@<-F0Bldj,ATV9h@;KFoBldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32EbTT+
F(KH#BOPsqA79RkF`M;=Bldj,ATT&-Ec6)>+EM%5BlJ/:BOPsq/0JDEBl%<&A79Rk/0JS>FD,f+
+E_^@Eb]-*Dfor.+DQ%8Bjkm%A79a+DKTf*ATDm2A79Rk@rH7.ATDl8.!0B<@<la/.3NeBCis<1
+EVNEA79RkF*)>2@<la/@rH7.ATDl8A79RkF!,RC+Cno++Du==@V'S$/0JG@DK]T3F(HIBFDk\u
FCcnHH$O[PD.[=(ARTU%D/X<6BHUo-@:OCnDf0!"+Cno++EV=7AKZ#)E,oN2ASuTuFD5Z2H=_2E
FD+W-AT2QtBHU_oC3=T>D.RU,+EV18D0$h3DfQsm1,(C9+AtKJ6q'HcBl5&(AS6$pATI      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)ud<+>P&o1E\G.2)ud62]sh40Jjn,3?U%82DZI20d&840fL403?U.51,U100d&211cQU50H`2.
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
E-67F-Z`^>ARlotDBOC#5sn:D83oU9;^W"]+<Y`8E]l#tC2dU'BHS[O8jPg;;b02A92dJk/9><A
DCd.fBkh]:%144#.!0Au:K(48Anc'm.3NhTBlmo/F(95"$6UH>C2dU'BHS[O8jPg;;b02A92dKc
ATMs(@<>p2-Rg0NATW$=F<DrF@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmT%144#-u*^0FD)dEIS)mn
92eAI6VC?2FCfN8A79Rg0./1kB4Z1,G]Y&U:18<[B45mrDf/o\FCB32?Z^O7-OgD*+=LuD@<?0*
-[nZR6VC?K5sn:D06CcHFC\g%@4ruW+D58-D.Fb:6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j
@p^uID..H?2d^E4-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+EMC<F`_SFF<GX7E]l#t-Vd6-:c]_?
@<Q3)Bl5&B8jPg;;b02A92d2I$6UHd67sC%@ra^b+DPk(FD)dEIP5>JF>%B;@r$.!@:O(o0./;l
@rcH<-SB+JF!hD(+<XEG/g)QaDb*Z&<$5deCh5%<GB.D>AKZ&(EX`@eCia0%AhIV4/e&.1+>G!C
+EM47GApu3F!)i@BleB:Bju4,ARlp%DBN"P:+oUB8Q[*RDJXSG+ED%8F`M@P%16ZaA1e;u%16f]
/g+b;G\M5@+EM%5+CoCC+:SZ#+>G!C+=M8A@:UL+.3NhTBlmo/F(fK9E+*g/+EM%5%16Z_F(Hs5
$6UHG+Bot0BQ&*6@<6K4-Z*R=F(oN)+Co2-FE2))F`_>9DBO"1EbTK7+>#c)4*+nP%16ZaA1e;u
.1HUn$=e!aF`MM6DKI"CD/a<0@p_Mf6"4tNCh,Od3F<4&4tq>%A0?:Q+AYg&:..Z@+BosE+E(d5
-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eGF_PZ&3B9*,%16QeBl%<e
EbTT+F(KH#A8bsQ67s`sF_PZ&?ZKk%ATMF)?Y"(b+ET1e+C]J-Ch+YsDIal#BleB:Bju4,AKZ#-
F(KE(F<FCJ7Nc5[@s)X"DKIK?$;No?%15is/g+YEART[lA3(hg0JYG$@<+%^%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
Eb065Bl[c--YI".ATD3q05>E9-OgE'AT;j,Eb-@@C2[X!Blmp,@<?'.%13OO@rGjn@<6K4FDYu5
De!-?5s\t&Bl%<P9K>*n?TgFm-UC$a@WcC$A4fNU3B8H0>9IEoATD4#AKX)_5s[eGF_PZ&8k_6*
3@>7C@rH(!F(KB6+=Cl<De'u!C2[X!Blmp,@<?'.%13OO4tq=Z:dn,I8OGX%+Co1s+>=63%15is
/g+k?+=Lr@AU#XHBlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+BljdkBOtU_A8,O:
3ZoguBl.F+-S7AC0mc\m78?6B6Ra6-Bl.F++=@U*4tq>%A0<rp+D>=pA7TCa/15%PFE8RIFD5Q4
-QlV91E^UH+=ANG$4R>+0RInYE,9H&+D58-+?MV3F(fK9E+*g/+Cnr$F`2A5+DQ%?FC]E8E+*j%
+EV[@@<6*;+EqO;E+*j%F(K;5Ch[d+@<?1(AT/c4ART*lGB.D>AL@oo%15p"7SZ6D76N[S-ZWpB
ATMF)-OgCl$9g.j-VA;jDBM>"+@9LPATB.@F(KH.De*ZuFCfK$FCcRB-OgDH0RIDGCh7ZN3bNJP
Ch[u6:ddcJ5tscW$4R>YFEhb5FD*fu+EV[@@<6*;+Dbb0E+*j%F(K;5C3=T>A9)j4@<?0*GA1r6
@<?1(AT/bR0mdMHCh7Ys$?0NfAnc'm4ZX^%FEhb5FD*4%6q0p;9gpT\/oY?5-OgCl$;No?+Cf>,
E+s-"+A?3CAQU',+DbJ-F<G10Ch4`'F!)qb@UX@$DfQsM/ot\8$7I\Q3Zp+*+D,>(ATJ:fBkAt?
8OccQ:*:ZiD_;J++<Y9-Eaa$#+EM47GApu3F!,F4AnGanAISth+>G!C+EM4-Cht5)@W?O/FCcRV
HTHEpASu$2%16f]/g*_T<DH+f+CoCC+:SZ#+>G!C+EM47GApu3F!)i*:K0bD+EDUB+=A]g4*s#6
.4chhBl5%@/8TEQE+*j%+:SZhDIb@/$7QDk%15is/g+\=F*)G:@Wcd(+Cf>/Bk;>p$7I\Q3Zp+*
+E1k'Anc'm%16f]/g)l3An?4$F*(c(?QaV:A8a(0$6UI1A7dtW+ED%%A0?.,$6UI*AhG2t7TW/V
+<Y35/g(T1+<VdL+EMC<F`_SFF<DrMA7cs*@<Q3m+DG^9IS)mn92eAI6VC?*%144#+<VeA@:O(l
A7dtW+DPk(FD)dEIS)mn92eAI6VC?2-S/(^7SZ6D74]f=E+EQ.%144#+<VeGA7cs.EbTW,+DP=p
CN*fr%144#ASu$2%144#BkAt?8Oc]T8Q[*GD_;J++<VdLF)>i<FDuAC+=BoU9i*kn@rH=3+EVNE
IS)mn92eAI6VC?*+:SZ#+<Ve%67sC"A7cs.EbTW,+EM47GApu3F!,4:@<?0*-[nZR6VC?2EbTT+
F(KGH-S/(^7SZ6D74]f=E+EQ.+:SZ#+D#G$/e&/!Cia/?%144#0d'[CF(fK9E+*g/+=D#?F)u&5
B-;/(AfrZh-TcS_$>"*c/e&.:%13OO@rGk"EcP`/F<G[BE,9H&?U6tD@WcC$A4fNU3B:FU$9g.j
De'u=/g*qd78?6B6QfSU1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tD@WcC$A4fNU3B:GeBldj,ATV9fFCB&B?ZU(&CLp7-/h1mUF(KE(FC/Hu@;[i-F)>i2AKZ(H
/KePAD/`p(Bl7Q+8g#NjFCB&B04As2DDGZM+EVNEAU%]rC`k-7FCB&B.3N&:A0=Je-t..+FCB&9
/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@1,04F:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,EcUE\]TsFCfN8+EqaE
A9/l1Dg#]&+EVNE-us$CATMF)<HMqkF"%P*%16oi@:UK.EbTT+F(KG@%16oi@:UK.EbTT+F(KGn
FD5Q4-OgCl$;No?+D,2,@q[N7@<-F#+D#e-AS`JtFCB&B+Cno&@3B0&Df$UFAp&3:.1HW)AT;j,
Eb-@@B4YslEa`c;C2[W1%159QHZ*F;4$"a$F`_[IF`_>6F!i)7+>Y-YA0<6I%17,c+Bos9Eap50
@rs(]3Zp7%B4Z0--Xh+*DDGR1G[k<$?Z^O7-OgE#@rsjp+?L\gHTE9#DI[bt$>s?q4ZX]J4"akp
-9`PO5sc\F-8%J)4?G0&1*CIEF<E.f+@B$X-R'oI$>s?q4ZX^6/g,%AF<Fd1BOj7e+>A.[@rr.e
%15is/g+_M@qBI!G%#30ATJ:f-WqQo-TsL5+<VdL+<Z%m+CAJ&+tb3++=Lo6+DEGN4?G0&0d%hd
=Wgfo.3Ns]0d(@DF:AR)=]ceK=XQ?n+<VdL+FH3m?XG-(/g`b)-tm-6BeCMj4"akp+=A:703B?!
03KYO+F>:e+Dt\2%14IK=]ce4=BR"73ZoOfHo`BW?R?sL-9`P#BOi6"/g*8</mg=U-Qk]S5u&h2
03BYG5u^-F-s/-*.46PeHQk0eDI[bt$7A+p=]ce410@[,4ZX^53Zqd:-6b&h4s27eA0>S=+?V_<
?SNZN+@/sm:,45#/6F>D5u^-F1+66U=Xb^I+F>:e+Dt\2%13OO:-pQUAU%]rC`mn0Cis<1+EM47
F_kS2D..NrBHVD8+EMI<AKYr4ARfFqBl@l3AoD]4DJsD8?XFob$?1#q4ZX]>/het50JG18-?=$I
DIa1`Bm;d%+A"1.=]ceq3Zqd:%14M&Eap5+GT_>U=Wf"5==G@E3ZrB^@j#K1HWaG[$>F`J3Zq!H
+BVbhIQATY?O[>jE,oG2Bm:bI+BTa4+B^-9/NP"nEap5+G^EOq%13OO:-pQU@<,k"@;[3,Eb/`p
F(oQ1+DbV1F!(o!E,oGO3Zp+/0JG170JOnpDfor.%16fo+?_b.8M2,g=<N&R+CAIb$7Kk6@j#K1
+F>5AAo]#&Eas3"DBN(a.3L3'+E2@2+DH'CHQYUW=:GUOGWe)18M2,f=Wi/S+CAIb$7Kk6@j#K1
+F>5AAo]#&Eas3"DBN%a.3L3'+E2@2+DH'CHQYUV=Ub]I$7K>)@;[hC==cL9.3L3'+CTA#DDGZD
=Y)U9%13OO:-pQUC*6r,@;[hJF!,=.FCSu,AU%]rC`mh<+EMI<AKYr4ARfFqBl@l3AoD]4DJsD8
H=_,8+Co&$Df'3+@<?F.Et&IqEaq6n+>>E%0JG18-?=$IDIa1`.P<@s4YJ!6+C-+/Eap4?Bm:bI
+@.bc==G@D/g+kQ+F>5>FCB&B+BTa;3ZqQ7$7[Y]+?_A%0d'aEE,oG2-u!oKHQYU0=]d*q/1r&Z
GT_>U@<>pq11DA/+=oPr=:GTH$:.WY1-IZ@-s/#Q=XbIE/g*G8=]cdt/g)QNFCB&B+BU0U=XbIE
/g+SE@;[i0+B^6V=:GU'<'rE(3Zoe,/heh5/heh21+kI90et@>/28n42CBUq3$C=;.3LoU6S])X
5u^3,4ZX]64?G0&0d%hd=<L`hAR@`&5u'0`=Y*Z(+DP7lFCB&B-s/#]=XbJ.?X\%bDDGZL=Y)1-
.46Pe/34n><'rDM$4R>;67sC$@;]UoD'3k-FD5Z7+:SZU;E[&`5;"'6+>ki,,W.7b$;sbb3Zq<u
+=\K^,Z7Mh+=&'X5;%C-.PE&F;CN`8+=J]m,Z7Mh,[W8K0b"I<@<>pq11DAR/lGRr+>#Vs@<>pq
1*BIm%13OO0H`%pATD4#AKW@@@j#Gq+Dt\2+B]gh+B_eh=BQb4=]ce4=BQb410I^%5r)PF+E2@2
+DH'C5u^3,+Au)b%13OO%17/nDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)?X\%bDDGR?D/X3$-ZWpB
ATMF)?Y+:tAStpl?ZU(&CLp7-/h1mUF(KE(FC/U#E+NoqCL;."Deio,+ET1e+<Yc;F*)IGAoD]4
+@U?jAStpl+<Y*1A0=TXAT`&:cBM9;$;No?+CT)!DfTQ6BPf@2$;No?%15is/g+hLFDu:^0/$mH
Ch[j0AM.V:An*H2@<5j0B5_rH;akA2CiD%<AScHsFDu/7Gqq'-1bNH`D/9Xg:-pQB$;No?+Eh=:
@UX@mD)re\ARuuuDBL?>F`_[R%15is/e&._67sB'+AP6U+>b3OBle59I4cX!+CoA++=D&8F(&E'
%15is/g)8ZDIITp?Z9q"H#@P;BjkgbAU&07ATMp,Df0W'AoD]sA7]S!@:++`D.F(_:-pQB$;No?
+CT>4F_t]23Zr'UDfp"A-us$CATMF).3N>G+Dbt)A7]9\$;No?%15is/g+YEART[lA3(hg0JYG$
@<+(^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%13OOCi<`m+=D2DF(KE(F=.M)%15is/g+hAB4rE,EbTE5+E2@4@qg!uDf-!k
-oiG30ek+"0fBIJ%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%13OO6:""+:K]hA+C@#b2Du!O%15is/g+tKG@be;@;]TuF`;;2
EZfX=@<*K"Dfor.Et&IC5t"%8=Wf:W+=Lc3Cij)b0H`D;+@8@^6;L`.?R[+6@UqV_+Co&"FCA-Z
Gp$HL0JG1'0d&1[$:7$H6;L`,/NP"&A7]S!@8np'3]\BM5t"%8=X%3%+E_.(4ZX]rAScHs<+L7s
1GCL:+>Fun%13OO:-pQUEa`irDf$V-@<?(%+D,Y4D'3q7D.Oi1@;]^h%16Nh4ZX]>+>#3p+=Lqb
+>Gl:3@QL%1,(C9+=eRK/g)l&0JEqCH#7(T3ZqjV+FAP[5;"'80JFUo+<t<?%17AtA3DsrH#7(7
/0K=$+>G!&/g*A2+=JI[D.G(<,9SNu+>GVo1,o^MA9h]K3ZqsECij)bA9f;CD.F(_%15is/g+kG
FCfK9@;L!-Ao_g,+=Lc3Cij)b0I[G<Ed9f/+@8@^6;L`,+tb!D4"akq+=Jod3Zp+*+:SZb0f_6S
+C?u[0F\@r2)$^,2)$]n$8jLk+>Gc.0F\@D2D?g-0fLd?%14gK0JFV(3&!#q$8FLo0H`)02D>RI
0fV'F+>Gl10F\@D3A<-00f_!C%14gM1,'h*3A`H"$8FOt0d&222DGXJ0f_-H+>Gl92@U!J3B/o>
1,(C>%14jE0Jst.0JtNn$8O:m0H`,*2)#IH1,1X?+>Y]*0F\@<%13OO/M9@U6pa[P+D!/JEd8*$
%15is/g,7IF*&OAF`VXIBl7EsF_#&+@;Ka&Bl8$(Ectl-Et&I./grD)4usp/GpskI/g)Pq3dr3#
/g)]cGpsk-/g+\MA.8kT$;No?+C]83DIdf2D09oA+D,%rC^g_"0J#CK,BA&Y+>#Vs-ndW1+FYpc
/96"b+A"1.Cgpot/1r&f@UooT%16Wf0KhH>A7]S!@8np'A9h\p$4R=O$;No?+B2cYCh4_D+>"^:
@;L'tF!,C5+O63N+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU6tLCQG%G2,Ao_g,+@p3f
FDl26@ps0r+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g+&'@rHBuF!)SJ+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B`8aEZcJI+<VdL+<VdL+<VdL+<VdL+O63N+<VdL+<VdL
+<VdL+<VdL+<VdL%15is/g)8Z+<VdL+<VdL+<VdL+<VdL+<VdL+<W(RARfXrA901B+<VdL+<VdL
+<VdL+<V+#:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$?T]c0KhH>6:""+:K\ea/g+F]/mg@V-nlc)+>>5R$8"+h0H_J\+<VdL+<VdL+<VdL+<VdL+>Gf0
3A;Qu+<VdL+<VdL+<VdL+<VdL+:SZ01b^U++<VdL+<VdL+<VdL+<VdL+<Vd]2)R0D+<VdL+<VdL
+<VdL+<VdL+<Vd9$8"%f0H_J\+<VdL+<VdL+<VdL+<VdL+>G],3%uHt+<VdL+<VdL+<VdL+<VdL
+:SZ01,(C)+<VdL+<VdL+<VdL+<VdL+<Vd]1,h3I+<VdL+<VdL+<VdL+<VdL+<Vd9$8!td0H_J\
+<VdL+<VdL+<VdL+<VdL+>GT/1b^$p+<VdL+<VdL+<VdL+<VdL+:SZ3+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vd]0JtgD+<VdL+<VdL+<VdL+<VdL+<Vd9$8F4g+<VdL+<VdL+<VdL+<VdL+<VdL+?;>6
0H_J\+<VdL+<VdL+<VdL+<VdL+:SZ50JFUl+<VdL+<VdL+<VdL+<VdL+<Vdd2Dd*1+<VdL+<VdL
+<VdL+<VdL+<Vd9$8X@i+<VdL+<VdL+<VdL+<VdL+<VdL+?)2<0H_J\+<VdL+<VdL+<VdL+<VdL
+:SZ70JFUl+<VdL+<VdL+<VdL+<VdL+<Vdb2_Zp.+<VdL+<VdL+<VdL+<VdL+<V+#2)$^,+<VdL
+<VdL+<VdL+<VdL+<VdL2)d6D+<VdL+<VdL+<VdL+<VdL+<VdL%15!I0H_J\+<VdL+<VdL+<VdL
+<VdL+<WL"1b^$p+<VdL+<VdL+<VdL+<VdL+<V+#2_Zp.+<VdL+<VdL+<VdL+<VdL+<VdL1H7*C
+<VdL+<VdL+<VdL+<VdL+<VdL%15'K0H_J\+<VdL+<VdL+<VdL+<VdL+<WF"2D?6r+<VdL+<VdL
+<VdL+<VdL+<V+#3A<-0+<VdL+<VdL+<VdL+<VdL+<VdL1,:O;+<VdL+<VdL+<VdL+<VdL+<VdL
%14gD0JFUl+<VdL+<VdL+<VdL+<VdL+<WBr2_Z?s+<VdL+<VdL+<VdL+<VdL+<V+#0ek@9+<VdL
+<VdL+<VdL+<VdL+<VdL0ebUA+<VdL+<VdL+<VdL+<VdL+<VdL%14gF0JFUl+<VdL+<VdL+<VdL
+<VdL+<WU"0H_J\+<VdL+<VdL+<VdL+<VdL+<V+#0f(L;+<VdL+<VdL+<VdL+<VdL+<VdL1c[64
+<VdL+<VdL+<VdL+<VdL+<VdL%14gH0JFUl+<VdL+<VdL+<VdL+<VdL+<WHq0H_J\+<VdL+<VdL
+<VdL+<VdL+<V+#0f:X=+<VdL+<VdL+<VdL+<VdL+<VdL1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL
%14gJ0JFUl+<VdL+<VdL+<VdL+<VdL+<WBo0H_J\+<VdL+<VdL+<VdL+<VdL+<V+#0fLd?+<VdL
+<VdL+<VdL+<VdL+<VdL3?TFe+<VdL+<VdL+<VdL+<VdL+<VdL%14gK2)$-q+<VdL+<VdL+<VdL
+<VdL+<WBp+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#0fUj@+<VdL+<VdL+<VdL+<VdL+<VdL0f1!q
+<VdL+<VdL+<VdL+<VdL+<Vd9$8FLt0H_J\+<VdL+<VdL+<VdL+<VdL+?(Dc+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZ43A<-0+<VdL+<VdL+<VdL+<VdL+<VdY1E[e_+<VdL+<VdL+<VdL+<VdL+<V+#
0f_*F+<VdL+<VdL+<VdL+<VdL+<VdL1-$I"+<VdL+<VdL+<VdL+<VdL+<VdL%14Nn$4R=o/j_il
6;L`,AM,*I@:Co"$4R>;67sBjDf'H%Eb-A'Df'H9FCeu*G&o8YBPDO0DfTQ%@;I'0@;L'tF!*%W
FD,6+AKYE%AISuA67sC%F^fE6@;^1$@;I'0@<-'jDI[7!+C]J8+EM+(Df0*,+EM47F_kS2@V$Z+
6=F\H/PokrCO%*5$;No?+AP^3762Q8AKYE%AKZ)'CM@[!+F,Rn+EV=7ATJtG+EV:.+D,>.F*&O=
DKBo.DKI">AfqNi:-pQU@3Bi,@<*K4D]j+4AKYZ)G9Cj=@r#drB-:VnC11U`DKI"8DKKH1G%#3.
+Cf(nDJ*O%+O63N+:SZkA99Lg3Zoh*+F>:e+EV%$0I\+q/g)Qi3Zr]Y.3L/o+FH4\AScHs<%oLN
+F.K\3Zqc`/i=b*+>>E*.j?Yi0d'aE0Hb]d0d(RH@PA5u%15is/g,1G@qBP"+Eh10F_,V:De:-;
PZ/c;Ec5e;A8-'q@rri3@WQ+$G%#K,Df-!k:-pQU@:sUlASl!rF<G:=+Co%nASuT4Dg#]4+EV:2
F!,F5EbTH&%172c@PL#,+@8@^6;L`,+tb!D4"akq+=Jod3Zp+*%14gM2)P[r0eP0e%14gM2D>Fn
1G1Eh%14gM2Dkds2(gfo%14gM2_YOp0J5*e%14gM2`1mu2(g`m%14gM3%tXr0J53h%14gM3&M""
1bLQj%14gM3A:as2D-ur%14gM3Ah+$0J5<k%14jE0JEek1G1Wn%14jE0Js.p1bL]n%14Nn$4R=o
/j_il6;L`,AM,*I@:Cr#$4R>UA99Oh3Zoh*+F>:e+EV%$0e"4r/g)Qi3Zr]Y.3L/o+FH4\AScHs
<%oLN+F.K\3Zqc`/i=b*+>>E*.j?Yi0d'aE0Hb]d0d(RH@PJ<!%14d30I14M@<6!&-UL*e6;L`,
@<iu@D.Fc"H"8%.F>+hR@UpU(@UpU%Gp$d2F>+hNA99OKFCAW4+EV%$0d(aP-Qij*%17/nDfp/@
F`\`R:dJ#Y7790t+ED1;ATMF)?Y+:tAStpl?ZU(&CLnl6Bldj,ATV9rAS$"*?ZU(&CLp7-/h1mU
F(KE(FC/lrAT`'$F)>i2AKZ(H/Kf+ODeio,FCfN8F!,(5EZe(fAT`&:G%G]'F"Rn/:-pQB$;No?
+@.+m@rH0p@ruF'DBL'?Afu2,F*&O7@<6"$+D,Y4D'0rqAS$"*-Z^CQ0f_6K+<WskFE2;;Df'2u
@;HA[:-pQU6#:1PEbTW/D0%<=$;No?%15is/g+SDF*2>2F#kFVEc6)>+=M8EF(KE(F=A>HF!,:;
@:Wq[%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91MpQ@0esklAStpn
ARlp*D]iY1Ci"$6+=LlCDfp#+@rH1"ARfgrDf/p(ATMs8H#R=D+DbJ3Dfp.2$;No?+>P`i@<++_
+EV19F<GdGEb'56D/XT/A0>u4+=M8EF(KE(FB*EsCi_$7$4R>YDdd0!-ZWpBATMF)-OgE!Ddd0!
-ZWpBATMF)<HMqkF!hD(%15is/g+hAB4rE,EbTE5+E2@4@qg!uDf-!k-oiG30ek+"0fBIJ%15is
/g,:YBl"o8ATD6&FCfN8Et&IcA7n%d+?2&/0JFV"+>GPm+=\LJ/g)l&0F\@;DKKPG+C\ko.3L3'
+Du.?BJ:Q<A7l>Y-uO-?0H_rVA7m>6/NP"lDKKPG+>%&5B+51W$;No?+E27?Bln'4AM7q4B45mr
G%De+@<,mmDII?(A8-'q@ruF'DK?6o-nHJu+<r![3Zp+!3A;R13%uI12_Z@..3L3'+Du:70H_nh
2'=+d/34n-+?;+u0fUj01,gm01H$or$7IGJ2'=+d/34n-+>Pl0+>Gi0+?;+u0I\+r3Zr<^BJ:P[
+>k8d+=oPr/Kc_i3A;R13%uI12_Z@12D>RI%14d34WnB:0R7MG+A+CC0JIchAn2>X%15is/g+nO
Ch[<q+Cno&AKYT'EZdYeEbT>40eb.$0f_3P+CT@70PDS/<%\Ue1,LgG3&riK2'>%)C3=?)EarNo
+>Gl92]sq"0ea%D%15is/g++9G%#30AISuR0J5(82_mBO1H.'F1cQU@+ED4-+D4Y-H#7(70f_3P
+>b2q0F\?u$;No?+Dk\$F`S[K@;L'tF!,F7/g*,2%15]qD*9p&1,LgG3&rlL1GC^B2%9mlD*9p&
?SF)e1,gsI1c$fp$?Tr8D*9p&?SOGt2`NTJ/i#=?0etXF%13OO:-pQU-o!G/1asPdB-9/j%172j
0Om7,+>Po1/i5I?2DI0I2]sUn-o3b8/ibmK2Dd?K2E!<N+=\L+6u=%u+>Pc20f:dF/he^s.j-5o
/het51H7<R1G^.'+B32a1+==t+>Yu90eb:80H_Zj+B32a1CX[#$;No?+EMC<F`_SFF<DrS@;L't
F!,"-AnGUp+DG^9CghC,+Co%nBl.9p-OgDX67sC%D/XQ=E-67F-pB^F0de)RDf'H9FCeu*D.R:$
F!iCZ/1r%m+=A9_/g)Mq/iP.#3$C=<+EV9N@j!<`+EV9ND%-g]$;No?+Eh10F_,V:@:sUlAKZ)5
+>t?QARfFk@;Kuo$9^$b-SR/2-QkAl3\hh"BJ<p=/34nqBJ=94$4R>;67sBtARTI!F(o/rEb/Zq
+EV=7AKYT'EZd(s3&_sGE,oZ/+>GPm@<<VH3G:H/0l8s*0QS@:<"01;9gh-*+>Gl92]sq.0ea_#
+D,.rEbK<2+>Gl!1,0n*%15]q@m)jqC3=?)EarNo+B_E,%16'E4ZX]u<%rT7A0>#L6k'J4$;No?
+Eh10F_,V:@:sUlAKZ)5+?1KSARfFk@;Kuo$9^$b-SR/4-QkAl3\hgW@j!<`+B31e$4R>aBJ<pZ
3Zr9N@;^.#A85X/+A,%3%13OO:-pQUG%#30ATJu&B6%Qp+EVNE2BZOA@qfdgCi^$m4YIp*0J572
+?1N*1*C[P0Ol4V3ZrNX0Pq7+%15is/g,%MEc#6$BmO>5FD*@<%172j0Om7,+Du:70HbIN0OkP!
FD*@F4ZX]?1,pmF1H.9P1Gg3s:-pQUE+^:Q2%9m%$;No?+Dk[uDBO"7A7]dm@;I'.Bl.E(6#^jY
C`kGd/0HZ-3&_s6+B;A`Bl5&,D0$h=B.b;d1^se6BJ=9d3Zoe)1FG730eat:-T!_61H%-N-OgE)
BJ<pZ3Zot$0J"n/0J510+=K2m3\W!*A8QC"Eb&]'0f:("INWNMBJ:QGARTItBk2L+A2#,\3B/r?
1a"M,%172j0Pqpa3ZrNX0OkP!%15is/g,=GCis<1+CSo'AS!!+D]gq\A7]7bD..7%%156O+=Aiq
2CBV,+Z_A$FD*@<+=oPrFD*@F%13OO-uEO(DKBN&C1K"@C3=?)EarNo+B_E,.3LbrD.R-nF(o01
D.G=C=\V9n$4R>;67sBtAS$"*+E1sG+>GZ1%16Z#4ZX]:A8QC"Eb&]'D.R-nDdmNsEHPu;H"pkD
+>Pc12E3]S/i=(F%15is/g,">FCSuqF!,RC+>Y-NARfFk@;Kuo$8OC[1,^712_Hp@2]s\5+>>E%
0JO\jDfor.+D!59$4R>;67sBhE,]6+ASuT4F(o/rEb/Zq+EV=7AKWQID.R:$F!,F7/g*,1%172j
0Prs6+=Am"-T`\10IJq01c?s@1GpNh$?Tr8@m)jq@;p0oEcYr*C1K"@1,LgG3&riK2%9mf67sBt
@<?!mATJu9D]ghYA7]7bD..7%%172j0Pqpa3Zot$0J"n/0J5./+=K2m3\W!*FD*@<%13OO1,LgG
3&rlL1GC^B2'>%)8jkg'+DQ%8Ao_BiC`k9SH$O[PD.[<$0f_3P+>b2q0H`)1+>PYo0F\A2BJ<pZ
3Zr9N@;^.#A85X/+A,$2$?Tr8D*9p&?SOGt2`NTJ/i#=?0etXF%156O+=Aiq2CBV,+Z_A$FD*@<
+=oPrFD*@F%15is/g,">FCSuqF!,RC+>b3OARfFk@;L!-/KenAAT`&:E+^dG3&M-P-n$Vo3%$.:
-SmS,4!umE/hf7F2CBpr/NP"*-SR)*/2/\5-Qjfs+Z_;++=q&?F(TH'A0<Ta+=2IZDKKPG+EV9N
@grbS$;No?+BE&kF`S[DDBLYo3&i$T@<,jk+>PVn6>ppeDf-[L+Dk\$F`S[EB.b;e3=Q<u9gh-*
+>Gl93$:""1,'.EFD*@<4ZX]oE,]6+F(o0"A2#-@F_kZ1@ps0r=\V9n$?Tr8D*9p&-S[>'4!um>
-T`\53%cp>-OgDX67sBt@<?!mATJu9D]j.5DKKP7De:,#+EM+(Df0(p$?Tr8D'1Dk+=Aio0J"n1
1++2(+Z_;"/0K%J0OkP!FD*@F4ZX]?2`E?J1bpaE%15is/g+YBDK]T3F<G76F!,R=D.Oi3D]iS%
B6%Qp+EV=7AISugBJ<pZ3ZqsDAo_F!F!*1p+=\LUBJ<p*$;No?+DkP/@q]Fp+EVNE1a$=?@qfdg
Ci^$m-nI&)0JG18+EDCCDIal3BJ=9P+>#Vs/2/\10JG4(Ec6)<A0>u-0OkP!%15is/g,:SBlkJ-
Df0`0EcYr5DK?6o:-pQUBQ>Y@Bl5JCARfd6A7Qg)D]iS%B6,\9A.8l&0eP.;1b^gD+?^i$/het5
0JG4(Ec6)<A0>DnAo_F!F!*1p+=\Kh+>bnt0et@A2`2^#:-pQU;F)F>DBNUDD(K`;$;No?+Co%r
F"V!6+EVNEBQ>Y@Bl5JCARfd6A7Q,V1*AD1+>GW(3B&f</NP"./het6+EDCCDIak@A8QC"Eb&]'
0f:("INUI%/hf.>0K(]r$4R>;67sBlE,T6"+CSeqF`VYAASuT4D.R:$F!,F7/g)l(2@U">ATTVC
4ZX]>/ho=B3AWKH+Bot70Prs6+>>E&3&EWQ1,L+X+EV9ND*9p&0J5(<0K1[F0F\@a67sBt@<?!m
ATJu9D]g_d0JG18+Co%rEb/g'%144@0-W+n>9G%B/het50d(LTF`(_4.!fHH0Pr@e0Pr@_BJ=9P
+=o,fH=_2EFD+W-+>PW+3$9q1+>GZ)0f][M%15is/g+SAE+*cuDKI"A@4Yr#@j#W"AT`&:E+^dG
0etZs$7Bk&+Co%n-TsL5+>PW+3$9q1+>GZ)0f^@bE,]6+;F*]>6Qe3?/hf.>0K(^0/1r&%3A*'B
2`ETJ%15is/g+\9B6%QpF!,=.FCSu,FDi9Y+Co%nBl.9pEt&I>0-DVr/i4pu-o`A21+=>&3A**E
3&ETN+=oPrA7]6[$9^$b-SR/0-Qjfs+Z_A-+>bf*2)I6I0f1"(3ZrHO%15is/g,1C+DG^9BIn!O
F!,=.FCSuqF!,RC+EM+(Df0(p$7J"u/mg=\+>P&r2BX_/-Rg/i3Zot#/j:C*0IItk3$C=;.3N/<
F(TH'A0<Ta+=2IZ/95/.$4R>;67sBtAS$"*+DG_8ATDa.CghF"Df-\.BkCsgEb0,uATKCFE+^:K
1a"P2%16Z#4ZX]?/i,IA1bq'J+>GK)3&*0D0f'q,/i,IA1,LjE%156O+=Aiq2^]_-+Z_A$>9I9,
/het51,([B+>>E%0JG191b^%'3ZpU@+F>5>Ci!WrAof)+0F\@P0-DVr/iP.#3$C=<+BosB/het5
1,C[?+=oPr4u+7-+CT)&A8,Xs+D!59$4R>;67sC&BOr<"Dfp(C@;]^oAKXMd4Wni[0H_qi9HYo0
Ea^)&DfT];CgeH#DBNe-AT`&'$;No?+Dl7BF<G%(+C]A"@r#XtARlp"Bkq9&80C&<.!0,V+>"^0
.3L2bEa]Ca:-pQUAU%X#E,9).D.R:$F!,F7/g*//%15Wh3Zoh!A92@'BPhf53$:"6+>l&03&NK@
+>"]aA92@'BPhf52'=k$0f:RB.4HAk+CoP*EbK<2+>P_q3?U%7/iGO@%15is/g+YBDK]T3F<GX9
@rH6qF!,RC+D>\9EcW@FBOu'(A7]CoAS#p*/Ken=FCSuqF!,RC+>t?QARfFk@;Kuo$9^$i0J572
+=K2m3\i-,2Dd$B2)6mB1E\50+Du:70H`)-+=\Ki2D?g--%6t-%13OO%14d30I14M@<6!&4$"`u
A7m$,BJ=9GFD*@<+B32#<+@%^0Hb[QF>.PSH8'1Y=\V:,8jjdo6t7?36u=&e@3B)l@j";i%13OO
F)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9rAS$"*?ZU(&CLnl6Bldj,ATV:"Bldj,ATV:#D/X3$
:-pQ_EbTT+F(KH#EbTT+F(KH#F)>i2AKZ(H/KcH^Bldj,ATT@DF)>i2AKZ)+F*)IU%15is/e&._
67sBjEb/[$ARmhE1,(I>D..H?2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$>aWhA0<7?Bldj,ATT:/$4R>969R@P+C?iX
2D-dE2*!NP+>bl,2Dd<N2`2^#+AP6U+AHEfBk1pdDBKAq=\V:I3Zp131,C%/+>Pkb$<9kb3ZoP'
+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sBT;cFl><'qdHAnH*qF:AQd$;tq.3ZohR9gh'C:HM6:
.3NYFF(KE(F<DqsChI[&-Qij*;KFu^+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,
4"!sGBk(R!%13OO:-pQU6?6dQBQP@qFCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjklg$;No?+D>k=
E-"&n06_Va/n&R5@;]L`/n8g:04ApDEc5i6D0[dDEbT0"F=hQU@<-EBH>.>.De*E43&<HL2D6g>
1,CL91G(@@%15FC4ZX]I3[[40FCAm(+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d@<,do+Auod
AS`JV@;odoCgeGQASc0kFE2)?-OgDLF$2Q,6?=\>3[[7*FCf9$AT`'*+B)upBm"J>:i^JaH#IRC
:iC/dFa,$,AS6.%F`S[(E+rfj+@1$XFEMVHF!*bdFCB3$F!+LpB43/1%13OO;KFu^+=LAe6p"CE
4%qsi+ED1;ATMF)+@:,Y$4R>;67sC&Ea`j,BlnD=D..NrBHUnqBl\$8+EqC5C`mb4F(I"GATVu9
A8,XfATAnN+EVNE0ea_eBl8'8ATJ:f6??+H@;^.#F?MZ-3?U%9/28h$3%Qd>+>Pf*0fC.12(UIA
+>PK&3$:%4/29+,1c$[D0fU:50b"IVF&[0gDKBN64ZX]PF&[0gDKBN6+=nWi3?U(3/2An%0ek47
0d&>)1,0n+0e>(9+>Yi*1*AG2/2JD*1b:L,2)m-J3$:$e$4R>;67sC&Ea`j,BlkJ+CijB5F_#&+
A7]CoAS#ol$:8f"Cihg$+>l#!3&i$82BXt<+>ttt1H6L:2]st5%15FC6#:X+3Zpb16#:Wo2)?@1
3?U16+?),"2)l^72'=e7+>Gl!3&M-P%16'/:d$i^HTE?*+B!7i$:.?b4ZX]6-p04G/2/M"HR:p!
<)$1<+=o,f6?>G/F<D#"<)Q[Y3Zoh!4>AoQ+>YGnHR:p!<)$1<+=o,f6??+H@;^.#F:AQd$;No?
+CT).BlnK.ATJu2@<?!m+EVNE0d("<B6%Qp%14g44Wlp@0-Di"+u(3+9N2H.%15is/g,7V@;^.#
F<G[>D.Rc2D..NrBHVD8+>G!UBl8'8AKY])+EqaEF*&O7@<5uh$8EYd+?hD2+FG:[2D?6u3aOjS
0d'aE0H`(mHQk0e<)Q[E+>"]o0H_T$?92FJ+C-*F+>Y-e+u(3>;H+)4%14IS5uf%&5uo?r3Zr6W
@:XG$@<-E30F\@;HS-Ks+AP4'.6T^7HTE?*+AP4'%14M1/g<"m8O6?*4ZX^43[-:$8O6>c$;P#Q
EcXB)+=LAe6p"CE4%qsi+ED1;ATMF)+AQ?g?W2&TEaMRMD.O.`8RZa^F$2Q,-s9844&o'<9L:0N
EbTT+F(KG98O6?`:18!N%13OO:-pQUA7]@]F_l.B%15g@EbT&u@;^+,4ZX^"@<Gq!Df09%BQP@N
%13OO:-pQUA79Rk+E(j7<GZeuFWbaI@<*K0@<-I8+Co2(ATA4eF]hF,4ZX]@0JYC+0ea_)3=Q<q
9N=tj4ZX]?1GLL90f_'F+C?l]/i,=?0JO"DF]DC.4ZX]m3A*03%175O9gM943Zp=50F\A39LqrW
>!4nh2%9mmCisc@EcXB)+=MA89gh'C9N=tj4*=P&6T]Ea9gM92F\G>%;HbLlBjl-kFDl&2B4uB0
0F\?u$4R=r+>>'PEaa$#+=BiL+B_E,+B;2[;KEsIF!*ej<,uDbF(o_=6?>G/F<FOW:`r%t<$5.<
<$4qEG&hXH8RZa^F!hD(0H`%pATD4#AKWB_3[[Kb<?P%&<[T==/0H?f/g<"m:-ho0/0K9l+u(33
5ue@$0H`%pATD4#AKW@C=\V:,<D6Cj<?QEa<'qdN9MIfC+E^@K:Jt@=9kA?ZA8,IiEcW@'Cisc@
EcWT;$4R>`D/XQ=E-67F-W!*-;aj)83ZrHWF(KE(FC0'&F(KE(FC0*+Deio3EbTT+F(KH#FCB')
ATD.!D/X3$:-pQ_EbTT+F(KH#FCB')ATD.!D/X3$+ET1e+EMC<CLnW1ATMs7+D,P4+B2ceDImi2
G%G]'F"Rn/:-pQB$;No?+D>k=E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"[t0:-pQB
$;No?+Eh=:@UX@mD)re\ARuuuDBL?>F`_[R%15is/e&._67sB'+AP6U+>b3OBle59I4cX!+CoA+
+=D&LFCB9*Df/o0%15is/g)8ZDKU&0FD5Z2?YOCbCi=3(BlnK.ARAtEF(nuuA.8l@67sB'+Du=D
@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1Bk(L\7<!<9AS5@eA.8l@67r]S:-pQU@<6L4D.RcL
+D5_5F`8HOEbTT+F(KGB+DGm>Ci<`mARl5W:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\T<Y$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>YDdd0!-ZWpBATMF)-OgCl$;No?+D>J%BHV87Bl8#8E,oN"Ble!,D@Hq$3?^F<0e"5"
2@U!&$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$;No?+Cf>,E+*cu+AR'$@<?4%DBMMg+@TdVBlJ0.@ps0r9Q+f]BlnK.AKZ)5
+Eh10F_,V'$;No?+Cf>,E-686A0><&+D>k=E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2
F"_6FA7^!<E+j2"$4R>;67sB[BOr;p@q0Y%@:OR*De:,6BOr;r@;KFrCghF"Df-\.ARfal@<6"$
+EV:.+D,b:FD,6++CTJ&Gmt*U67sC+Dfm18ATT&,Ec5e;FD,5.8hr(S0HaqGDe!H'GA(]#BHV#1
+EqLE+D#M1@q]p+@<,p%Eb0<'F:ARP67sBlG%G]>+D,>"FEo!SARTV#+E)9CF)N10DIal-ATo8*
ChI[,Bln$*F!,:5CLnW1BPDN1Df0,/@<,og$;No?+CT;%+ED%+ASu("@<?'k+D,Y4D'3n<Cgh?,
F*VhKASiQ"ASbq!FD50"+Dk\"BOPdm@rj73$4R>;67sC&ATMr9A79RkF!*.Z<E'D7H#7(T3Zp13
1,C%/+>GVo/0HZ-2)ud61*A;++=nWj0f([00esk+1FsY'3&!$/1*A:o/34n.3AWN82]t!f$4R>;
67sC%BPD(#+Cno&ATJu+DfU&1Eb$;$DIal2ATT&:Bl.E(FDi9W0PEL%2/PB10lnI;<"01HA8#h$
4ZX]tA7fjqD0$h5D0%j$+>PVn0f:(00b"J8D.GCb3ZrN_A79Rk-pK==0JG1*INs,TA19$NDe*:%
DJpYCD.F(_H#7(I4ZX^2D.GCE.j-5bH#7(I.3KiX/35I-0J$gHBPhf"$4R>77!(RQ+>Pc30JG4=
/i=(F1,(I>+>Y,p1*A/0+>A.fD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r0RJ(^A.8l`F`]c-+C?fT
0JG7@1GCOB0K1+L67sBkAS2GZDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuSBcp#9%15is/g+S8
Eb/g'+EVNE2]uXB@qfdgCi^$m4YIp*0J5:3+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc0
2E<KJ/i=(F0f_*O+>GVo0eje&3Zp/(H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>J4gD.F(_DKU%a
3Zqc`/het51,1O@0fUir$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Ju67sBhB6%Qp
F!,RC+?(ERARfFk@;Kuo$9^$b-SR/3-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp180JP:B
3%d&t$8O=l2'=V/+>GYp/NP"0H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kK[H#7($$>t!.4ZX]m
0J5%50f(^J2`<QK%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q:-pQU@:sUlATJu9
D]gn[A7]7bD..7%%156O+=Aiq2('Lp3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@1H.9N1,ggC
%14gL0JFV)+>Fuj3Zp5*H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>\@iD.F(_DKU%a3Zqc`/het7
0ebRH0K(j!$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/i>"!-o`A21+==g
DKU%D/34nkF^kjf%15]qF?MZ-1,LaF3B0#O2%9mI3AWN82]t"$/NP"2H[0I=%15]qF<E^h8jkg'
+DQ%8Ao_BiC`kQ]H#7($$>t!.4ZX]>/het92)R3E2)$fq$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.
ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15is/g,%MDBLVU<E()_Bl.F&
+AH9i+>GDi1,(C?+>GZ51c%0J1*BRr%15]qF?MZ-1,LjE3&NWI0K1^F3&3<E2`*3I%15]q4ZX^#
F_kZ1@ps0r1,(C?+>k])+=eRHA7fjqD0$gS1E\M1+>P\]$9^$i0J5@5+=K2m3\i-,8jmbD/34nG
6k'K@F`]c-+C?fT0JG1<0f:aI0f'7GDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuSBcp#9%156O
+=Aiq2CBUq3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@1c@$C0eb491c-p@3&`iU1-%6%$7ITT
H#7(I.3L3'+>PW+1E\\/1,9t&+D,.tD0$-n8jkg'+DQ%8Ao_BiC`kEYH#7(I%156O-SR/5-Qjfs
+Z_A-+A,%D+=oPr8jj*qDKU%a3Zqc`/het70etX@2E<T'$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.
ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LdG3&`ND1GgpC
0K;!O2DR9N%14L<H[0I=1+==t3Zp.;2DQC6/2B%).j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&@H[0I=
1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]m0J5%51Gh*J2_ZsB%16uq@m)jqDKU&0
FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ
+>Pf.1,1IA/i,=@0ebRG3ArWQ2@U!A14+:`A25SV/NP"00f(d32Cpg1.j/G7BPhf"$;*]L3Zr0[
Ch@]t@;I&AH[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]>/het71H@HO3ANN&
$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/i>"!-o`A21+==gDKU%D/34nk
F^kjf%15]qF?MZ-1,CjL1c$s@1GgpC0K;!O2DR9N%14L>H[0I=1+==t3Zp.:0JXb0/2B.,.j/G7
BPhf"$;*]L3Zr0[Ch@]t@;I&BH[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]>
/het62E*QR2)?oq$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/i>"!-o`A2
1+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LaG2)dBF1GgpC0K;!O2DR9N%14L?H[0I=1+==t3Zp.;
1H-F3/28h$.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&CH[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q
+A,$2$>t!.4ZX]>/het:0fM!E1bpfq$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd
0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%13OO:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU@rH4'@<,p%:3CYeFD5Z2
+A$Gn:L\-SEHPu;Gp#mp+B3#c+@TdVBlJ0.@j#l3+Eh10F_,V'$;No?+Cf>,E-686A0><&+D>k=
E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2"$4R>77!(RQ+>Pc30JG4=
/i=(F1,(I>+>Y,p1*A/0+>A.fD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r0RJ(^A.8l`De4#R3Zp+/
0JG7;0JkR@3B9)Z+AP6U+Co%r%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTE
F$sSP+A,$2$;No?+CSo'AS#p*FDi9W+Co%nBl.9pEt&I>0-DVr/i"ds-o`A21+==gDJs*.+=oPr
DJs)r%13OO8jmba3Zp171H%6J1G1No$8FOu3?U%3+>GSn/NP"/H[0I=%15]qF<E^h8jkg'+DQ%8
Ao_BiC`kHZH#7($$>scnF?MZ-?SF)d0JYRB1,q3K2)-fp$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90
FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*0J541+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.
4ZX]@2)$a>3B/WK%14jF1Gp:01*A;-+>#Vs14+:`A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&AH[0I=
%16ukATU'r+>>E%0JYF=3Ai]Q2)$`o$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90FEq5)@r,juFD55l
A4:HY6tL!R8jj*q4YIp*0J5./+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.4ZX]@1H.9N1,ggC
%14gL0JFV)+>Fuj3Zp5*H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>\@iD.F(_DJs*.4ZX]>/het7
0fCmG3&*EO1^se0De3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%156O
+=Aiq1FF:n3$C=<.3KaNDe4#5/34nkDe3Df$4R>77!(RQ+>Pc/2`WiX/i=(F0f_$I+?(E$+>#Vs
1jaLbA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&CH[0I=%16ukATU'r+>>E%0JGIF1bgpK1,(]t$>scn
@m)jqDKU&0FD5Z2?Z0CiBlS90FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*0J510+=K2m3\i-,
+Du+/F<E+q+Du+/@grbS$8<SV,\;")F(HIAH#7(7H#7(I+D,.tD0$h5D0$gl7!'PD6m-AiF<GID
@j#Z-ATT&4De3E+%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV:$@;]soEaNm)Deio3    ~>
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
0ekF+0eje,+>bbp1*A>23A;R20H`+n1c.3N+>GVo1*AD62BX_3+>P&s1c7061,L+/+>u/72_cF0
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
Eb8`iAKZ28Eb$S>.68S,0JYF<1GUq)0f1X>1,0,267sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+DG8,?Z^4(BkM+$+<XEG/g,%?D.R6#8O6?!F*(i2F!,X?F(o*"AKZ)5DJ<`sF:ARP
67sBsDdd0tFCB32+<VdL:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>oe$;No?+ED1;ATMF)+<VdL
+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-Du$7QDk%15is/g,4PDfp/@F`\`R
:-pQUG&:bN+=A9_+=nlo/9!^5+?jd-4!6^@/2/Fo-o`A21+=>H9gj#9F(KE(F:AQd$=e!aF`MM6
DKI!K@UX=h-OgDmDeX*1ATDl8+=D2DF(KE(F=.M)%15is/g+hAB4rE,EbTE5+E2@4@qg!uDf-!k
-oiG30ek+"0fBIJ%15is/g,7IF*&OGFCB32%15is/g,4PDfp/@F`\aBDdd0tFCB32+>=63@<>pq
11+U;@qBI`FEhm_2-C5f$!Ao`$!8i`#shNV:+06u==FP#5u^-F1+69V==GF#,!f0o:,45"/6ODG
#shNV:+03t=Xade0F9E>,=G+(0/+OU,=G+(0/+OU,=G+(0/+OU,=G+(0/+OU,=G+(0/+OU,=G+(
0/+OY$8!t=0aTEd#q[k</Mo<k0f(Zn/Mo<k/Mo<o$8Di=0aTEd#q[k</Mo<k/Mo<k0f(Zn/Mo<o
$8!t=/MRPd#r)`C2$kih1GoIj0f(Zn1c5^L0aTQ@0aTQ@1c5Rr2$l)s#rFLK$8;c@3!h8F,=G+(
0/+OU0F9`n#quZ16qLE40Hgl40aTQn#r!tc2)mQN1GppJ#r+@F1G1IA2Dd<G2E!>t3&WBI1G^mE
3AWJu1G1IA2Dd<G2E!>t3&WBI1G^mE3AWK$$8MoB2@2&i0etTm3!hMr0etU?0fCgE3=.Z#/iYdH
3B/fQ2$l2o0etU?0fCgE3=.Z#/iYdH3B/fQ2%9mK#r+:D0J5*e2$kul/i,1A3AWEI2[ME&/iG^D
0K(jI1C5cj/i,1A3AWEI2[ME&/iG^D0K(jI1CX[J#r+7C0J5+?2)d6H1,q/u1G1Nk0f:RD1c7'L
2)tt%1bLI>1c@$E0aTQl/ibaG1H@<Q#ra[n0Jt[F0JkKn$8i,E1C5`f1H73L0f:aH2$l#j2@2,n
/hf(?2)-g>1C5s!/ibgF1cRHT2[M5o/hf(?2)-g>1C5s!/ibgF1cRHT2[p*P#r+1A0J53h1'o]o
/i>OE0JtR>3!hK!/i5@@3A`]T1'o]o/i>OE0JtR>3!hK!/i5@@3A`]T1(=RL#r+.@0J57>2D[6I
2D[5t0eP=B0f1XF2)d5r1GUR>2_d$I1,:ir2)d-F1,q6I2`EGt1GUR>2_d$I1,:ir2)d-F1,q6I
2`EH#$9/>H0F9Ec3!h;l1,T@o3%d*H3B/]P1,T@q0eP7=0JPRB2`1mt3%d*H3B/]P1,T@q0eP7=
0JPRB2`2$O3=.\P0aTQ@1c5Rr2$l)s#rFLK$8F4@3!h;l1,T@l/iX.p0eP7=0JPRB2`1mt3%d*H
3B/]P1,T@q0eP7=0JPRB2`1mt3%d*H3B/]P1,TLJ0eitn#r+%i2_d-E3&NWL#r!ti1H%$I1H%$I
#rOXo2)7-N0K1pF#r==h1cI-D3AN?M#rOXo2)7-N0K1pF#r==h1cI-D3AN?M%14gF#rW)F#r!th
#rXRl1c$sK1cRHM#r4Ck2)[<G2)-gF#rXRl1c$sK1cRHM#r4Ck2)[<G2)-gF%14gG#rN#E/iF"i
/i,ID2DI'F3&M"#3%d3L1,LsM3B%7"0eP.92`3<E0Ja"n3%d3L1,LsM3B%7"0eP.92`3<E0Ja.F
0f01n#r=1k#r!te3&NWL1bq$K#ra[n0Jt[F0JkKj0f:RD1c7'L2)tt%1bLI>1c@$E0aTQl/ibaG
1H@<Q%14gI#r;lF#r!te#ragr2E<HF2E*KL#r+.e1GCgL1GUdG#ragr2E<HF2E*KL#r+.e1GCgL
1GUdG%14gJ#r2fH#r!td1,T@t1+kOF1c[NO2Dke"/ho+=0JPIA1cYk%1+kOF1c[NO2Dke"/ho+=
0JPIA1cZ!P0fKCn#r+@F0J5%:3&iZL2)7/u3&WBI1G^mE3AWJu1G1IA2Dd<G2E!>t3&WBI1G^mE
3AWJu1G1IA2Dd<G2E!?#$8FLH0F8sl8QIJu+UKh/,=G+(0/+OU0F9`n#queq0F9<d1'oW@,=G+(
0/+OU0F9<k0F9Hn0F8sl8QIJu+Unc10aTEe0aTNd0Jk^H0f^pE3!h>p#r4+l1,^pC0KD-M#q\.m
/iPOD1GLRD3=.8l2`E?E2`!?O3=.Z(/i#@A2E3]N0b"IA1'oNf0F9Ec0aTQg#rO=o0ebIF1GL[E
#q\.p/iPL=2*!HI1^P`g2`*-B3&rfL2E;('1bLOC3A`EJ3&V3Q/Md\b0f]Oo/ho4B3&rfS1H,Uu
/i,:>1G^gC1G]=s/ibjG2DR0K0f97h3B/WO2_m9H2E!8r/MT1=/hf%>1H.*H#rjXl0JYRC2`!6M
%14[D#q[kk#r!te1,:U?1,:U?#rF7l#r+1f2)7-N0K1pF#q[kc1+kF>3&iTN2[M&j2E*6F2_d$I
1,B4q2_HpG0ek[D1-#dN/N!hd0fKCm/i#FD0ekUF1cG^s/i3kh2D-dF3AiWI1G]=h0ebL<1H7BP
1b^]l/MT.>/iGF<1c79P#raXm2DHmB2*!QR%14[F#q[ki#r!tf2`1ms/iGUG2E!HO2E(pt0J54?
2D?sF1,9.f0ek@72)R9G1c7#p/MT+C/i5C@3AiWQ#rXdr1c.!K2)I6O%14[G#q[kh#r!tg2E!HO
2E!HP#r4+f1bq$J2_d-F#r4@j0JPIF3AWKO#q[kd2(gR;2E3]Q2$kih2)HpG3&<9C2Dke!1bLdJ
1GLRA2)5UJ/N=%g0f01j/i>RB1bq$J2_bUn/iPWo1-$sG1c.0O0f'+f0ek[@2`*?N3&*2q/MT+:
/i#:A0ekXH#rXIi1,UpD0fV*$$8"7E/MT$f0J57D1,CUC2E<N!0eP:>1c.$G1c.#q1Gg^B3AiNK
1Gprp/MT";/iG^I0f:aE#q[kg2(g[=1cR<M2$l,t/i,1<3&ENM2[p*G0e`nc0es%h/iYXC1G^gC
1G]=l/i!_h3A*9F2)R<I0KBFk0etaA3&!3I2_d#n/MT(9/ho@C1bq$N#rOCh0f_'I1,q9K%14[A
0aTEd0aTQ@0aTZo#q[kf2$kih1GoIq2%9mE0es%e0e`ng/i!_e/iYXC1G^gC1G]=p0J5(?1c-sI
3ACgl0f1R:0f_'I1,q9#/MT"@/iYOB2)d6E#r=Ro3&!3I2_d!H%14[A1C5Wn#r+%h1c.$G1c.$G
#r!ti3ANBE2`<ZO#rORm1GCXF1c@0L#q[kg2(g[=1cR<M2$kih1,LUA3AiNK1GoIp1bL[H2)-sE
2)>[K/MT'g/N=%k/iPWo0J54A0f1XF2)d5r2D?a=2)R*C3&_-q0f:X;1,UpD0fV)u/MSt?/iPUD
3&iWK#r4Ln2`*?N3&*2u$8!ti#q\(B1+k:<1,q-M0f1Zm0J51?2E!HO2E!K#2Dd$H3&<9C2Dm5r
/MT+>/ibmI0ebLC#q[kd2(gR;2E3]Q2$l#q/hf"<3&rcO3"63H0fB=i2@2,k2E!HO2E!HO2[M/j
1H./t2E<BH1c%-L1cIB#/MT+C/i5C@3AiWQ#q[kd0J54?2D?sF1'o]i/i>LE0JkXB1(=RB0fKCj
2$l&k1^Pig1-%0G0fM!I2[ME!/iGF<1c79O2[M&j2DZsD0ebFA3B%6r0ebL<1H7BP1b^]l0fCX?
3&riQ0JbKo$8!tl#q[t?1bLWl0J5+91,:U?1,:Tk2`E?G2_d$I1,:ir/MT.B/i5LA0f_!F#q[kc
1+kF>3&iTN2[M2o/i>CD3&!9M0b"IA0f]Ol1C5rl1G^gC1G^gC1C5`f0f:mL3A`ZN2[MGu/hf%>
1H.*G3=.8l2_cp=1,h!J1GfCi3B/WO2_m9H2E!8r3%d3M1,^mG2DI&u$8""e#q[n=0e`nf/hmYl
1bLOC3A`EJ3&V'p0fLpA1,q9N0K(ot/NG[@2_d!D3AWBH#rO=o0ebIF1GL[E%14[B0aTEd#r44A
0J5%92`<BN0Jk`q3&`HF2`!?O3A</o/MT1C/i#@A2E3]'/NGR=2_m9I0ebUJ#r4+l1,^pC0KD-M
%14[B1'oW@,=G+(0/+OU0F8sl8QIJu+UKk_0F9<k0F9EB$8;c<0fTIn#pVi0<\H-M#quZ;3A:ao
3%tX`6qLE40Hgl40aTEd2[M&i/hf.B3&39I1-#Xm0fKCj1G1IA2Dd<G2E!>t/N>X@2D[-H1H@6J
#r+@s/iGLA2)@6K#q\+p/iGLA2)@6K1^sdI#q[ki#q[h`0etTm/N=%g2_Hg?2)$aC1Gh)u/N>L<
3&`ZS3&<HM#r+@o/iYdH3B/fR#q\+l/iYdH3B/fQ2%9mK#q[kh#q[h`1'oNi#q[kd/i,1A3AWEI
2[M&p3%d*L0JGCD2)>On2E3<I3A<-F2`1mn2`NEJ3A<-F2`3B#$8`&@0f01g0J5+?2)d6H1,q/u
/Mf":#q[kh/ibaG1H@<Q#q\(m/hf.>2D?sB#r+=p/hf.>2D?sB#q\(m/hf.>2D?sB%14s!/MT$f
/MJe53&ENJ2)@3L#q[nb2@1rj0eP.92`3<E0Ja"e2E3<L2DR*K3&ro(0f:pC3ArWL3&q9s2E3<L
2DR*K3&ro,$8r2B0es%e0J53h/M[Va1,^aB2Dm0G0ekWo/N,C;1c$sK1cRHM#r+:n/i5@@3A`]T
#q\%k/i5@@3A`]T1(=RL#q[kd#q[h`2D[6I2D[6I2@1ri/i>RB1bq$J2_bUj1GUR>2_d$I1,:ir
/N#I>2)7-N0K1pF#r+7q/i>CD3&!9M#q\"n/i>CD3&!9M0b"IL#q[kc#q[h`3!h/k/i#9j/Mf@=
2DmKS0K:gF#q\"h/i,=<0f^sI2$kuo0eP7=0JPRB2[M&n0eP7=0JPRB2`2$O3=.8t#q[k</MRP`
1c5Rk1c5Ro1GoIj1c5^L0e`nc3!h/k/i#9j/MJe:#q\"h/i,=<0f^sI2$kij3%d*H3B/]P1,T@m
1,pmE2*!WM3&:jm1H7!F2*!WM3&3?#$8F7A/N3tf0eP=B0f1XF2)d5r/MJe81H%$I1H%$I#q\"n
/i>CD3&!9M0aTEf1+kCB0ek[D1-#Xq1,:I=2_d$I1,B4g1GUR>2_d$I1,:j!$8F:B/N*ne1'oNd
/i<qe2DZsB1Gh*K3&iZ"/M]4:2)[<G2)-gF#r+.m/i>OE0JtR?#q[nj/i>OE0JtR>3"63L1C5Wj
#q[nb2@1rh/i,ID2DI'F3&M!o2E3<L2DR*K3&ro(/M]%50JbXF0ek@<#r+.h/hf(?2)-fl/M]%5
0JbXF0ek@<%14gH#q[t?/Mf":#q[h`1,q-M0f1XF2@1ro1bLI>1c@$E0aTEd2(gmG2)@6M3=.Do
2(gmG2)@6M3=.8l2(gmG2)@6M3=Q<M2$kij#q\"@/MJe4#q\(q/iG^D0K(jI1C5Wf0eP793B8lN
1cG^q0JP190KD-L1,T@i0ek::0KD-L1,Lp!$8FFF/M[Va3!h/j/ho+=#q\+l/iYdH3B/fQ2$kin
/ho+=0JPIA1cYk&2_Hg?2)$aC1GoIj2_Hg?2)$aC1Gh*$$8FIG/MRP`0fKCj0J5%:3&iZL2)7/u
/N>X@2D[-H1H@6J#q[qc1H%-J2D@$I1C6&t/i,CD1c@$G2@1rk/i,CD1c@$G2DYdL0fTIn#pVi0
<\H-M#quZ16qLE40Hg`V#rs[G0F\@C#r+CG0F8sl8QIJu+UKh/3A:an#pVi0<\H-M%14[A#r+@F
/MJe22)mQN1GppJ#q[kj#q[qc1H%-J2D@$I1C6&t/i,CD1c@$G2@1rk/i,CD1c@$G2DYXk3&WBI
1G^mE3AWK$$8"">0fB=i0J5(82$kio#q\(g0etU?0fCgE3=.])/ho+=0JPIA2$kin/ho+=0JPIA
1cYjo3&3*G2`*NS1H%*"$8"%?0f97h0J5*e/N!hd0ek::0KD-L1,Lor0eb=71GCgL1GUfo/MSt4
1GCgL1GUdG#q\(q/iG^D0K(jI1CX[C1^Pln#q[h`1,q-M0f1XF2@1rk/i<qe0f:RD1c7'L2)tst
0JtIC1c7'L2)tsp0f:RD1c7'L2)tsp2`*-@2)I3F1bfFH/N!hh1C5We/i,ID2DI'F3&M!o1+kHk
/M]%50JbXF0ek@<#r+.h/hf(?2)-fl/M]%50JbXF0ek@<#q\%p/ibgF1cRHT2[p*G2@2)n#q[h`
2$kii#q[nj/i>OE0JtR>3!h;o2D-jF2)$mB1'oNf2D-jF2)$mB0fTIk2DZsB1Gh*K3&iZ&$8"1C
0eitd0J57>2D[6I2D[5t/MSk82_d-E3&NWL#q[qg/i5LA0f_!E3=.Dq1+kCB0ek[D1C5Wh1+kCB
0ek[D1-#Xm2)d-F1,q6I2`EH#$8"4D0e`nc0J5<k/MSk52$kij3%d*H3B/]P1,T@m1,pmE2*!WM
3&:jm1H7!F2*!WM3&3>t/N#781Ggd?3AEHM%14[I#rr;D0aTEd#q[tk#r+4n#q[tk#q[tk%14[A
0F9]F/MSk52$kig/iX.h2)-^>1b^XE0fLrr0f1U;1Ggd?3AEH!/N#781Ggd?3AEHM#q[qm/iGRI
3&!<I2%9mE0eitn#q[ka2)d6H1,q-M0aTEc/iGLD1H%$I1H#Ok2)d-F1,q6I2`EGt0f1gA2)7-N
0K1os/N#I>2)7-N0K1pF#q[qg/i5LA0f_!E3=Q<I0es%n#q[n=/MJe7#q\%k/i5@@3A`]T1'oZm
1G1L?1c[BP3!h/p1G1L?1c[BP3&1dl1,^aB2Dm0G0ekWs$8!tg#rN#@1+kHk/MJe53&ENJ2)@3L
#q\%p/ibgF1cRHT2[M2r3%d3L1,LsN#q\%p/ibgF1cRHT2[M&k0eP.92`3<E0Ja.F/MT'g1^P`i
/i<qe0J5+?2)d6H1,q/u/N5L=0Jt[F0JkKj0fCj@0Jt[F0JkKj/N5L=0Jt[F0JkKj/MT+83A`TL
3Aif+$8!ti#r;l>2$kig/i!_b2`NEJ3A<-F2`3At0fD!D2E<HF2E*K"/N5XA2E<HF2E*KL#q[kd
/i,1A3AWEI2[p*G0fB=n#q\+C/MJe31,T@i3&3*G2`*NS1H%)s0fLj?3&`ZS3&<K"/N>L<3&`ZS
3&<HM#q\(g0etU?0fCgE3=Q<I0fKCn#q[kj#q[h`0JtgL1,CdC3=.8s2D-mD1GpsK1GfCm2`<9H
1G^mE3AUsn3&WBI1G^mE3AWJu/Mf"82E!BM0K(gF%14[A3!h8F,=G+(0/+OU0F8sl8QIJu+UKk_
0F9<k0F9EB$>Epk?Z':hARo.hFCB32?SX;j11,-JF>>`B]>$p'<F8L0D.P7dATMQuDIIX$Df.*s
8Pgs)@<lF)?VY$HALpSn/6>5<?V2kMD..'.;F+Y^1,(C9/4=&Z?V3(-0JG%REbT0#DCe_)F`Lu'
/4i5\6Z6j`F=]k&H#7J9DeF?&:2b5c%15C1F)Pl;FDc"J=ALM+/6G\"2(W)W9R1M,?S#P80et@9
1Ft782D-pC2Dm0H/2K:=0KCsI2_lp>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,6[E<RBHU2aE-5W+
Bk&9)Ec5o8F(&lH6"4nRCisi;D]ib8+CQC)Bk)7!Df0!"+Dkh5@:OFrDfp+DF*1r5FCB&sAKY])
+EV:.+EM%,/S8]>DJs]0C`l\qG/L"oDIFZ*@3AufF)Pl;FDc">-rakk+@]dLFDl2F+D,P4+EV:.
+@0IXDesQ<ALSa2Gp$g=Ao)U$DKKT$C`l)kARfBrGB.D>ATAnd@<,pq+N04IE+Nf;%15C2@;TFn
/4`Y]3&roK0f(dG2_<7a0d&o*Be2P$0JYLF1G(F;0fU^>/iYgA1c-gB2Dm9F0e=n50J5.81c@9J
/1`?t\1oO'EbR'6$:/08ATDZsE\'aZ+>c#4/2oFG3%W@[+@U<b/3tg=/2/\52(UL>/i5=C2)6s=
/N#I>1,CgI2)?dLEa`Ek@k91VYq/=aBe34sAKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(L
fWNl3+P<UFK\;+5LY/jSb.bfFiOY=hEZee./T,!1EZcbXEbT].E[PoNASu$+.4u&:6"=SBEb$^l
;BR_L3@lsG1,1?*[ie%HF"BU.0JG=D0e5+?1c[*C/i5I;0et@:2`<EG1FtCB/iYRC0fV*C/1f)U
/43ie/0\\?EcZ=F@;p1%Bk:ftFDi;I[ie%HF)u&6E+N`lAKY])+EV:.+B*&aCi3['AKXfcATMc4
6$-pOF!,C5+EV:.+@p'PG%GQ4+E2I4Ch[s(ARlotDBLYo2)$R(@Wcc8BlbD7Dfd+;DJs`:+E2@8
DfQtBD]j.8@<=+G%15C2Ea`E.85^Qf3B/iH2`NcP0J(MT0d'D)D_+1_/29%:2)Hm>3A`]H1+kFB
/2B%:/i,@F1GCL6/MT7<3&!3H2)?dLEa`Ek@k91VZ8!n/@rEnBFD,5.FE1f#Bln'-DII?(DIIBn
+E(j7FD,5.cE\Qk@rHC,Bk\]2H#n(=D'3M#F!+q'ASrW2ASu$iEb/c(6#1LL@N])sA0=<W@;Bml
@OrX4ATDL.ARlo3Ch[Zr+@0LX@:CZ.Ao_g,+@1$V@VK=5+P<UFK\3igK%R?\W$#Mb/]th:EH5Js
+=JUZBOr<-@rHC,Bl@l:.4ueR$:/0BFa,H.;BReT1GC@<0K1^G/C(LC6ZR<#6")<!1,:aG/N,C=
2CpR81G^R:3&WBI1c[EO1Ft+91G1@A3A<HL/4",aEbT#lDJ=0//1f)O/44H#/0\LFD/WrrEc*"0
Df0Z;@:OCnDf-\9Afu2/AKX<JH"D"=A7]grB5V."Bl@l?+Cf>(DIm?$Bl5&8BOr;@3HSpW@qBP"
F`MaY+C]J8+EqL5@qZurDKKH1ARlotDKKe>@rH4$Df-\?F(HJ4DJXS@@X0)<BOr<'Bk/eN0Q^tN
@qBP"F`MaM-p/WtYolDSF^o-,.3]3.6">%HASuQ?85^Qd2)d9A1c-mE2D!.Y+@C$V/4!\q0K:pL
2(LC92)-X=/i#=90f(X=2DR!G1b^I80ePFC2`<WS/4";b@VK='/C(LO6Z-Bb<+ohcDIIBn+Eq78
+E):7B5)6lCi"A>6#pCCBk'1HfVdDUfWs/.fVdDWfngh[H7aGc@`3h8_kA2$-Zj$5+Cf4rGB5,\
/e&.RA8#C`ATD3185^Qe0JbF72)$gB2([%]+A??b/4!\q0eb=?2_-X>1,UU=/i5@80f:d?0fLjF
2E*0B1G1L=2`!0D/4";b@VK='/C([T9P&,n,!g$dD]iOuCi!Zn+@0gSBOPLaEa^RC<+ohcDIIBn
+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1HfVdDUfXBIafo"FefVp!%iOFk!iOFkUB#L`j@3?sG
FD,5.@WGmkA0<:=EZek7Ebm9LDfQtAFE1f-A18lK>An*rFD,5.Ch[g*-Z^DI@;]X^.4ueR$:/39
@<,d-85^Qc2DI0B1G^mI3@rI`+@Ak3/3tg@2DmHP/M]:C3%Qd:2)$R90JkC?2)[9K1Ft+53%d3M
1,([G/4";b@VK='/C(XS6VUu?,#i5e+DtV)AKY].+E):7B5)6lCi"A>Ao_g,+@1$V@VK=5+P=6W
Yh5l+Z.XsVb.hBD\<"RZEl4Rn-ms1PEbB*(F!iCh+A$GnFD,5.6XaeBDId0rBm"88De:+XC`l#R
BQIU'Bco]X+AHcs@;BXiF=\PKF<G:=+Co&)BkM<lFCeu*fV@,Ufn:L#VqHaU\_+.=VqA9-MBL'U
@<Zp0C`m/&/]th:iOFreJT>IMGq:([Ea`j,CghEsA0>T(FDi9q@<?4$+CT=6:i^8e@3ATbEbB*(
F_r6L-Y@(5F*&OJBl[j#DC6kc+q4lFA8#[n/4`Y]1H@-?2Dd-C/C(sP6#L3a/M&J)1bLaH/2An3
2)mHI3%um?2(gaA3&`cU/4";b@VK='/C(s\6#L3a,#i5e+DtV)AKZ2*F!,CABkM-t@;Kb*+@1$V
@VK=5+P<UFK\3N^MV3Y*@H"_W/`F4#@<lZ3.!0-6+EVX4Bl5IECh[uD+=D8EAKZ)'Bl#.G/g:`3
6"t3f85^Qb1b^p@1,([I3@rI`+B2cl/4!]!/2/n93&W9A3AE6>1G1O@/2fF>0f:dB2DZm=3A*$G
0JkRC/4";b@VK='/C(XS<+0o#<+ohcDIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1HfX][m
fnLWl^L;D*+=JUKH"A?P+CT.u+Eq78+ED%:Bk;L"A0>;uA0>;kDfBf0A0>?,+EV:.+BNK%CM@[!
+@gHjF`8IADBMl"@<*Jc@;TRs/e&.RBl7?qEa`g!/4`Y]2_d$F/3,IE2DHc.]eLX.B6#Oh/29+A
1bpX<1,Lj>1bLaG/2B1@/i>I@1b^a;/M](62`*?N1b^IHEa`Ek@k91V]eM':B6#OmEc5e;6#pCC
Bk'1HfX][mfnLX%VqHaUZ.Pu-L"V>+b.hA1DBNA./TSd\D8`It-mrSOAKYo'+EV:.+CT;#BOu33
.1HVMCggjd@<*ni;BRnR3B/QM1c.0H/C(^I9R1Y06")<!3AE<L.l01>3@m!>1c$[<3&iNI1H@<K
0e>+@/ho1?3B&WC6#pCCBk&\FcF5>uH#bG[<+ohcDIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCC
Bk'1HfVdDUfV@*/fn%e\+CT(<b.`#W\s$`KEZcbXFD,5.FCB!(DK@0J>An*rFD,5.F*DP@E+s3&
+D"toCh6m$/0K"I@<,pi+EqOABHYU5+A@'$@:^Q06#9tOBP([n.4ueR$:/K:F(o&6844RT2E3WP
2CpjB0JG=7?Q`9YE\(QK0fUpC3%Zj>2)QpD/ibd?1,h'C1c73K1,pg:0ek:@1,:aI1+Y170f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70r,ATB=G6[<WkBlA)9E,ol9Df]?'4!6h*@<6-k+DGm>FD,5.Anc:,F<G72
F*)>@Bk(RfCj@.DARfY!A7]9oDIIBn+E(j76[<WkF`T)VA79RoDJ()$@:O'qFDi:=Bk/f-BkDHu
ASuU'+Ceu#FEMVL+@8FJ+q4lFCgpghA79.&85^Qh1,^s?3A`HI0eCY$+B)on/3tgA3A<HQ/M]%7
0e>(43&iHE3&`HH1b^pK0e=n30eP.81H$sF/4";b@VK='/C/ht;eL,%,#i5e+DtV)AKY].+E):7
B5)6lCi"A>Ao_g,+@1$V@VK=5+P<UFK\36VK\3K\W?>Vc/Ri.)A76T/-Zj9NDC6kc+A$GnFD,5.
6XaeBDId0rBm"88De:+XC`l#RBQIU'Bco]X+AHcs@;BXiF=\PKF<G:=+Co&)BkM<lFCeu*fnS1;
fWcROVqHaUW7cjVYLofsDIIg9BlY>)Cb9+)Ch-sf/0K%T@;^.&@<?'k+DG_8D]h_^FD5V8@<3Pb
F^o,r@3A?bE+ris+=JUHEbT0"FCfN8+E(j7FD,5.FDlA@-Rg5K$:/K;@;KX/85^Qh3AiKA0eb@@
0fU`0[3.bTE\&dn/M&\12`N?E0ek:@0fV0O3@laB/i5RG2`ETF6#pCCBk&\FcF#2hEH3U0BOr<(
@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbabVqHaUW7\$$K\3gX@;IN)`.;`=b.f&I-Zj$5
+EMa8Ci"$6ATB.I/e&.RCgq+!AT'+j;BRnT0fLXD2*!KP/C(OU+@CEe/4!\q0f_$D2_-XB2)m-C
/hf.61-%*B2E3BH2)-X;2_I*J3ArlQ/1`?tZ8!mtH"S[-BOr<-Dfp)1AKYo'+EV:.+DtV)AKX9T
@VKjoD]ib8+Du+>+D#G4Bl[d$Gp$U5ARTU3%15C;@q]Rc@4XrI+>bu31FtCD0f_6FcESKZEcruc
/1iD0/hf%30fUp@0ebC?0JY121,LUB1,q6P2(V%6@:Eq\/1f)O/44H$/0[Q(Df$U_Ea`Ek@lbab
VqHaUY1T]*Vq@[c@;IOS\s@&>`.?(F+=JUZASuT;.4u`7DBO%7AKX?KCh7Kp@<-()D'3b/+@0fd
6"=SL@<6-*6#7Z<DfoK(CLqT=+DGp?BlbD-ATMQuDIIWuA0BO&fnA%4fnS.^fWcROVqHaU]%F:?
Vq@pj@;IN4@;b&8Q=4eV@;IO6TlkCoJRU/QFE1f-F)59,ARlotDKKe>9OW$WDBNA/+B!-!FE2M@
+@C'fG%i'I-XpXqCERP-+EV:.+CfG1G:+gl+q4lFCh%C(/4`Y]2)$pD/2f@B2`E9I0Ha@i@4XcS
/28q91H?sC1c70B1G1[J/2An6/i,1>1b^^:2)HpG3&`iT1b:q5@:Eq\/1`b7/6,DQ/4OYuD'2,b
@:Eq\3[!(QfnA"\fne:YfWcQ-CuTu-iOY=`GB^uVEZcbXFD,5.AmoCkF<GL>ALAoZ%15C;@sN!1
ALpAM+>GT/2(UI@2_[!<cF4oq@<F+e/2/k:2`3*@1b^g=1+kOD/2]=<3&`QH2)6^<1bLL:2)-mF
/1`?t[k(KeFY$6uD.7's+E(j7FD,5.:i']W@:Wqj+E)41DBO"B@<*K#Cisf@ATAnA9f+^V/g*Gr
@sN!1AKWBeDI[BlDKI!kEb/ft3[!CoLsEWX]$H)VN6],^[idtQCNXQ5`02VmG@>P8Df0,/De:,6
BOr;_Ch7<hA7]g)F(o];ATDi7Bl5%`Eb/ft+DlCGBQ%^*B6c*=$:/K=AR](g@;[Ve;BR\N2)d'A
0f1X?/C(LC<+0o#/M&S41Gq0C0fCgB/2/\92_6jH/ibmF0fCg=0fCXA0KCpC1+Y_3@:Eq\/1f)O
/6$&#/6$:o+DtV)AKZ2*F!,CABkM-t@;Kb*+@1$V@VK=5+P<UFK\3K\W7\B-VqHeI@:Us#@:EYc
`.;eK-ms+MAKYT'Ci"$6ATB.@>An*rFD,5.:i']W@:Wqj>q$3i6#:(CEa`g!DCe=V+?2)61+Y.6
2).*O/C(LC6Y13f/M&Y30fV'A2DR'G/2Ah72(UO<3A*3H1cRHP/2f792)mHN2`*'OEa`Ek@k91V
Yq/7RE%FJ!Df$U_Ea`Ek@lbabVqHaUYh655VqAO&fVdDUfo"I:fo"I;+CX6=O"K>#O(iXQJ]b_M
@;IN@@;Wr`DBL>TFD,5.EbT0"F<G"4D'pH1De:+ZAT2<oF`Uh;/e&.RCh.3fDII!*85^Qi1Gps>
0ebR@3&N84ZQMbYFY#*q/M&\10JG%61,pmC3&33K1+Y"52_HmE1cR?M/4";b@VK='/C(RQ7ri`'
<+ohcDIIBn+Eq78+E):7B5)6lCi"A>fVdDUfWa%`fVfp$iOFq#iOFqWDIHus-ms+MAKZ)'Bl#.>
>An*rFD,5.@rH7+FCf9)@<?4%DBNk0+EV:.+B*3$FD,6+DBMD_F(ei./e&.RCh.3n@UWq$85^Qg
1H@?E3&<NS2([%]+@L6Y/3tgA2_[3N.lK7A1Ft=70fLX=2)d-B3ArcQ0J#+>/iPLA2E3NE6#pCC
Bk&\FcF,8lEa^LgEc5e;6#pCCBk'1HfVdDUfXBG2fVdB4+CX6=N@j,!NG2k?J]b_M-ms+MAKYZ3
AStpt-RgYW$:/K=F_kZ(DCe=V+?)8;1+Y.60f1X?/C(XG6tL0c/M&J)1bLI</2Jt>/i,1;1,1[<
0ek::0JbIB0e>V2@:Eq\/1f)S/4=&c/5p5#Ecbl1Bl7Q+De:+XEa`Ek@lbabYh=c`W$'`jfnA"]
fnA%0fo"I;+Q9hk@;]L_+CSe4A9D^#`2dbu-ms+FBl"o1Afu2/AKYN%CiF'%DC6kc%15C;Anc:$
/4`Y]3&39L/28h:0JbI8cE\Q[AT01d@4X/g1,q3C2_[$E/2Jn61Ft=;1+k:>1c[NS/2o782)[-I
0f:LJEa`Ek@k91VZ7J@SE%E2&Ec5e;6#pCCBk'1HfVdDUfn%e\fn(>TCb975EcE3M-Zj$5+D,G.
@r!G@/g*ntD.Oi&Bm+'*+C]U=<GZejBHTWQB-;;7+EV:.+CT>5ATDL+D'3>,DKBN5FD5W*+E(j7
cESoCcE\R$DIam8[ie%LE+ifs/g:`36#:1FA8*Sc;BRnW2)Hj=0JG1=1b?qW1*AqqE%ERl1,(FB
0eG+81G^R</i>U>1GCX<2)-mE2E!*<0et@=1c.0L1+Y_3@:Eq\/1f)O1+Ye$E%E2&Ec5e;6#pCC
Bk'1HfVdDUfW<`/fnpn\Cb9C1A9f:G-Zj$5+=M)8Ch5%<CM@<,.4u`/Cij6/DIIX$G%De<Ea`Km
FD5Z2@;I'(@;TRs+CT;%+@0fd7qlOFBe1B*ARfk#A76TNBk:gh+CT.u+@0gVBk:gh+B)i]F`(_u
/g:`36#:1FDJ<Q285^Qd3@lm=2E*24ZQN(UB.PVc0JG4;1+P(:0ek47/iYX<1G1I;3&rlQ/29"7
0fUsH3A`9QEa`Ek@k91VZRepaB.QMmDf$U_Ea`Ek@lbabVqHaUXOsH(L=iFI@;IN1`.;f?@N['H
FD,5.Ao(mnCF:P`+@0gVASu3k+DGm>@;L"'+CT/+FD,6++DtV)AKYT'EZiZ4+AcWiF(K&.-r"Dr
AmoI(/e&.RChIHn@UUfY;BReM2)d'D0JtgG/C(RV+A??b/1iD-0JY=9.ks%A0J"t32DHa;2)HpG
3AWBH1b:@A/iY[B1cRKH6#pCCBk&\FcEf5V9P&,n7WNEa+@1$V@VK=5+P<UFK\3BYW7csYW?>Vc
/S\^'BON#3-Zj$5+D,P4AS>X`A1&L(De:,6BOr<&Bl@lp.4u&:6#:1PCb/+T+?;59/28t=2`<54
Z62tTE\'Lb0e>"70K:g<1b^dG/2Ah33@m!G/hf+;1,1X;1b^OB2)R9K3%R@9@:Eq\/1f)P/5Tnu
/4OYuD'2,b@:Eq\3[!(QfnA"ZfVdDWfVfp$Cb9D?JSo12+=JUZBOr;uCgh3s-RgYj6#:1FDJ<Q&
BlbD*CiaM;@;^"*BOu3,DIIBn+D,P4+O757:h=ZgASE889keW[@;@;E%15C;B5_g!@Ot&J+>c#7
2_6j@3Ar`GcEn]]Ecs!"/28n83B8ZG2D['=1+kRD/29+C/i5IE0K(^</MT.92)-sF1GLFHEa`Ek
@k91VZn+RbFt?U+AKZ)8@:X(oBl@ltC`mV(D.OhUChI[,@:C?nF!,")EbT].A0>K)Df$U_Ea`Ek
@lbabVqHaU]%F:?Vq@pj@;IO6TlkCoJRT`M-Zj$5+CfG1G:+gl%15C;BOu'i/4`Y]1,La@/2K"=
3&)u0ZQMbLD(It]/2/t<2`E6A2DR*?0ePIB/3,^C1bq!M2D?[:2D-dG3ANQJ/4";b@VK='/C(RQ
7qHNg6tLCQG%G2,Ao_g,+@1$V@VK=5+P<UFK\;.6L=j&hW?>Vc/SJR1b.h@--ms+MAKYH&@;]U'
+Brc%+EV:.+Dtb#CERP-+EV:.+CehsASbX$/e&.RCh[g0BIl\P+>c)42(UX@3Ai]GcF"cp9joS=
/28n;1b^F;2)R?E0ePCC/29.@/i>=A1-%$>2)R!H2*!WO1Ft(.cF#3'9joRs<+ohcFE1f#Bln'-
DII?(DIIBn+@0gXDffY8@rH3qF!,(8Df$V=BOr;PEa`Ek@j#2rH!te;@;IN/@;TFh+=JEXFD,5.
F(f,rE$o]LAmod(FCAm"+sJHg+q4lFChdBr@;%2_;BRnY1c[*A0JYIE3%W@_+@CEe/4!\q1,(OC
1+P.:2)m-B/i5O=1GLU:2)R-K1c$[=1G1[H0JYLE/1`?t[4F[jB.OK!6#:=FBk/bc;BRhO3AE'C
2`!-B/C(^I<D?mQ/M&J)0ePFC/2An;/iYgJ0f:m@1c[0E0f(RC2_6L2cF5?)9joR^$:/KD@;L(,
DfBbK85^Qf2`!6@2`3EH0eCV_0d&f$D_+1_/29";1c6d>2_m0?1bLR=/2B"9/ho+:2DI0B1H-pB
2`EHL3@l^4cFbk_6>pcn%15C;CLM0qEa`W485^Qd2*!KE1c.$J0eCV]+B;-E/3tg@3A<6I.l91=
3@m!>0fCR;1GpdF0K(^F2(URC/ho4A2)7$?/1f)X/6,DQ/.DqPChmI"@:CcY;BRqZ0JtC90f:jE
1G$k++AcW^/1iD)/2St91+Y4=0eP7=1c[?H/2B"61b^a@0JG%//C0#$:h=8j%15C;CLqQ<85^Qe
1,q3D2)@0J0J(MS+@C0k/1iD)/2St53%QdB1bLdF1H$pD/1iS9/i#FH2`NTE/1f)O/44H"/.DqP
Ci*ThH7VTb+>Gc.2(UL=1bgm>cF"c\F`K#b/2/q81,(481Gh*C1G1@;/2oF=1c[<H0f^dA1G1XB
1G^^D/1`?t[4FUdE\%Y,6#:CH@q[Da;BRkO1FtOE1b^K+ZQMPOA1U"t0JY=<3@cpA1,(77/ho%2
1GCFA2`*KJ1b:I=/i,7C2_m6A/1f)Q/4"/a/.DqPCi3ZqE\'aZ+?2252(UI93ANKP/C(LC7ri`'
/M&Y40K:g>1c@3N/28b91Ft=<1+k7<3&3EH/1i\:/ibgD3B&cG/1f)O/4X`'/.DqPCi3[&Cb/+T
+>u/82CpgI2D[3AcEf8K;eL,%/M&J)1+kRH/2B.=/i5F@0JYL:/Mf(51bpmB0JG%//C(RW/5p2%
/.DqPCi3s'@;RPd;BR\S0Jb782D['B/C(XG:NC/#/M&S51H%!?0JP:;/28b83@m-H/hf.=1H7BG
/MSk50JPRB3@l^4cF#3!EbR'6$:/KGBlmd!/4`Y]0f_'M/2B+B1,gc0[NJ@dBe2PY/2/q<0K1R;
0f:m@0ePCA/3#L>0fV0O3A`9=0ePIC1,V!I/1`?t[Ob3pBe0]#6#:FQH!teG85^Qg0K:m?3&!'A
1+^b(+B)cg/4!]!/29%<0et=92)@-A1+kR@/2B%>/i#FG0f1mA/M]192*!EN3AN-:/C/r";e'_s
%15C;E+i[#A1U8L+>Yr53%QmE1H@-?cESK_H!r6U/20(>2`<6A3&E<?0ePIH/28t9/iYjL3&EQF
/N>@@2)mKJ1+Xt-cESokH!r65$:/KIBOt[`@4XrI+>l)<1FtIC1,_'BcESKZE^Cm"/M&J)1+k=;
/2B";/iGXC3AiKA1,^aD0f1dK1Ft(.cESofE^D;d$:/KIBOu3mFF#K/;BR\O/2fFG/C(LC6#L3a
6");u0JGIC.l'+=2(UL80K1O</hf:D3AEEC1-$s@3A<9G0e=k,cESodDIb:-$:/KIBOu3s/4`Y]
1c%'A2_[6N/C(^I:ig+t5qF]E1GLa;0f:^@/2Jn<1Ft::/iYdD3&`WE0f:R>1c76J1Ft(.cF5?$
F(6a1$:/KK@;BRu/4`Y]2D[9G/3#FD0K:W/]HBU_@4X\q0fLdD1Fk=>1,pgB/i>L;1,UsB1G^gH
0K1O?1bLUD0JGFF/1`?t]IZHk@4Vip6#:RQF(8ll/4`Y]2*!QG3A`]S/C(LC:ig+t5qF]F0JY=4
0JYIC/2Jn<1+Y48/i>@<2`EKC1+kLD1H.*I/1`?tYq/^m@k8&r6#:Ra@UUfY;BRkU0fU^D2E*TN
/1hu4Ea^LN/1iD1/iPX=1,_!B3B8uT2E36F1G1X@0fLgE/1`>(/4=Me/.DqPCia#sBe2eQ+?),8
1+YFD0eb:4c\!?.Ea^LN/29.@1,LL>3A`E@1bL[F/2B4A/hf7F3ArQB2E<BJ2DHpF2CpC1c\!c:
Ea^L.$:/KL@qf@oCLM<985^Qd1,h'A1bg[C2(UO<+A@&u/1iD)/2St72(UI;2(ggA3&`iQ/2T.8
0fV-I1GLF3/2K"39R1M,%15C;F(K<(Bl7?185^Qd1cR?D1bq'G1G$hY+BE&i/4!\q0K:mG2_?mD
1c$[;/ibpC0f(O:0fLsM1c-a82)HpE0K;$H3@l^4cEo-'AS`n,$:/KLBOPUm/4`Y]2`<?F/3,[D
1H$f0Z62GQCb.k'0f_*K1Fk.;1,LO</iPL91-%<H3&3HL0Jk==/i57?2`<HC/1f)P/4"8l/.DqP
Cia8uF=]s\+?)5<1Ft770JbF;/C(pO6Xapb5qFcF1,(X=0etRD/2St<2_6a=2(gUA2)mTU/1iS3
/iPXJ0K2!C/1f)[/43ib/.DqPCij*"E\'aZ+?)/82_6sJ2DdEFcESKXEGR0X/29.B0K:R:3&NHB
0J5:B/2B4E/iG^I3&3ED3%d0K3&<<E/1`?tYq/1\Cb/%rDf$U_Ea`Ek@lb_\fVdDUfnS.cfWckJ
fVdDUfXKM2fV[<++=LZ9/T,!<E[`,>iOQ'BiOQ)/J]b]@EZcbXFD,5.Ao)a,DJ(=>>@h5UCh6m$
/e&.RCij*"F"Bj[+?))20J#4@1H.3CcEn]^Ea^LN/29.>1,^X@2`*3>1G1@?/2B1E/ho.A2`39?
2E*6H2DI'G0e=k,cEo,jEa^L.$:/KMATDB685^Qd2`END1c@9M0J(M]+A??b/1iD)/2St81+Y.:
1+kRC0JP:>/2At53ArfV2_Zd6/C(jY9P&,n%15C;F_#N$/4`Y]1,q$J/2K.D0Jk?+[ie%4@4Wu]
0K1aD0eG.@0fU^>/i5F:0ekC80JYFC2D?[61-$sC0JbF;2CpC1cF5>l9joR^$:/KNCgeGPF`VYF
@;KY!/4`Y]1c%'J/2]:?0Jb9*^*$EM@4X]Q/28k63&3!?0f(R91bLU>/29%C/i>IC1bpj<1GLL>
1-%'I0e=k,cFti09joR^$:/KNCgeGQDfTDtCh[rA85^Qe1H.6D2)R-D3@rIh+B<8e/1iD-0ekXF
.l/t82CpX:1c[*A2E<BJ0f_0K2_6a@/hf:B1GC[;/1f)[/6,DQ/.DqPCjBG?85^Qh0f1U93ANTO
2D!.`0d'D+E\'L-0fV$K1+P%80et::/iGI91,q*C0Jt[I1c[*D/i#+:2D?m;/1f)V0e?77E\%Y,
6#:j]EcN^%;BR_O3&E0B1,CgD/C(sP7qHNg/M&J)1G1I@/28h5/i,7<1Gpm<0et@@3AiZS1+Xt-
cFti"ASit-$:/N;A8,sq@4Xr;+>bl/3B&KE3AiZJ/70Me9joS[/70qf/ibmB3AW9D3B/lV0J"e2
3A*9O2_m9J/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Q=@4WTtBkM!tBjkm%E,ol9Df]?'4!6h+@:X(j
BON#tF!,R<AKYW(A0>f&+EV:>DId=!+DG^98S;LN+DlCGBQ%^*B6c*P6$"/mASc0*@<3Q3AT2[$
F(K62Bl7Q+C3=T>Bk(^*+@0jQA8,sq@3B9*+CT)-D]iI2B5_<'De:,.Dg#\C+E1n#@q?ckDIal4
DJ=3</g:`36#C%JF(oN#H!r7*5uUT31GgXa5uUT31GgXi+@C0k/70r8/28h21GC@72Dm*C3B8rU
2(U=71G1XF0K(gE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QbF=\V4BPD9sE,]N/ATJu5Ec5o8F(&l;
+@0jQDBMklDIIg!+DGm>Df0,/De:,6BOr<.GAeUGEbTE*FEo!>ASH7#ATJu4Afu2/AKXf_Bl%L&
E+s3$-Z^D0@:s"bDeC20H$!_<Ci<s3/0JA=A0>T-+EV:.+E2@8D/XH*Bjkg#A7]IsGp%$;+EV:.
+E(b$@;[2rDIal/Ec6&2@ruX0+E(j7Anc="ATDWrDD!+B$:/Q<A8c:,/6>,9:b=O[/6>,9:b=O[
/70MrAS3Q$/70q_1+k=9/2K+B/i5RF3&39@3%d-J0et[A/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##b
B.R#)EbfB1BHV87DfBW9@;J"J6#L+ADesP=BlbD=BOr<*EbTB!Ed8d@Df''%@;]TuDe:+kF`M8/
Gp$O5A0>o(An?"(+EVNEFD,5.D/XN0ATDTqDIal(DBMo$EbfB1BHUf-Cijf?AM+E!6#L1G@4XrI
+?22<3@lm>0JG1:/C(aJ6#gor/M&J)1bLLA/2K(=/i#+?1cR?D/N5:@3&<<M0e=k,cF>DkEH3T>
$:/QBATVL$@<*ni;BRqV0J"q71,q6Ec\+%r7<3)n/M&S22)-d:1,1I:/2St<2Cp[?/iPXJ2E*HD
/M]%50JG=;0fU^8/C/u)/4FSn/.DqPDJ<O"@4Xr;+>GQ*3Ai]G2)dKM0J$QR<D?mQ?S#P82_I'J
/29(B/iY[D2`WcI2)d-G1b^jE1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r.9joSOG@b<!F(c\8Ec5o8
F(&lH+@0mZ@<,d!BlbD=BOr<(@;TQuDe:,#+EML1@qB^pBlG2/DBO%7AKYQ'Bk&9)De3c.6#LCF
Ea^)"Gp$%0ARoLrBHU`+FD,T5+@op]Ed8d%@<-I(DKB`6/e&.RDJNZh/4`Y]3B8WG0K:d<cESK7
:hXDk/M&S01,^p?1bpdF/2Ah70J#+72)d3L1H@!<1bp[>0K(UE1b:1/cESosBOr_($:/QNATB=m
;BRnT0JtCA2)dHK/C(LC<cr40/M&V:1,q3C1,LgA/2St91b:CB1+k:?2D[9L/2B%72E!BP0Jb72
/C(LO<cr40%15C=FCB3$F"Bj[+>tr11b:U?2`<HCcESKj@rEna/29%<3A`<C2DR0A0eP.</2B%@
/i,@>3AEBB/M]4:1c$m@0Jb72/C(LO;e'_s%15CA@ps2kX`H$a6m+3?0f1mK/2o=D1c6gk+@:!b
/70r8/2o1@0J"t71G1I?2*!NK/29+:1,CdE0KC[>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6>pcn,!g*W
DfTl,DBNn=DfBW9@;J"J6#pIDCh[r5BlbD*+D,&!Dfp+DE+NHn+DG^9FD,5.DJsQ;BHV5*+@0mU
DfTl,/0K.MATD?)FD,5.;fut#E+*g/ATJu9BQA$6B4rDr+D>\0AKY])+EV:.+Dl%>DKK<$DBO%F
Bk(]s@3Bi,@<*K!F<G10G\(D.A79RkF"SS,F<Gd9F!,UHARlolF!+m6E,oZ0Bln'4AKZ&4Cgh?,
@ps1bDId0r+CT.u+ED%*ATD@"@q?d%DeX*2+D,P4+EM4-E+ig'A9/l%DIal$@<-10+DG_,@:Eqm
@;^1.+E(j76#L4OEcPS@+q4lFEas36EclFS85^Qf1Ggd:2E<ZS1G$hV+@:!b/1iD-1bgjH.ks%=
0e=n1/hf.61,1R;3AEBI0JG%43A*$G1,L[F/4X_lASWhJcESoeDf70N<+ohc7ri0PCER_1EburX
]SOmbcFV>TcG/>QVU'h=^X%KSD.R-nF!)YN<+ohc7s/6\A0N3Z+DGp?G@>P8F`V,)+D,P4+EV:2
F!,OG@<*K"Gp$O3C`m/(@qfLlF<G"5FE2;;Df''+F!)l"Eaa'.F*)),DIml?+@p3cE+*csBQ\AI
+Ad/uCh7I/.3N&:A0>T-+E27?F(o*"Gp$O5+@TpgE-,f&DBNt2D/!m%F(8d!@q?clARf.kF(HJ.
F<G16Ec#Au+E1b0F<GL6+EV:.+@TpgE-,f&DBNG-DKBo2Ci!O%Bl@l3De:,6BOr;WBlJ$0+@g?\
A7]h'+EqL;+D5h*Eb&`l+EV:.+Cf>-F*(u0CghF"Df-\9Afu2/AKX<^ChtJ?+A??Z+=M/K+@:3e
CaX9H<+ouYBIP'FAS#a%Bl5%n9joXs@qI>987cjVDe(CA=)W+pF!+n/A0=9KH#k)c2Du`g$:/]J
@:C?UDf^#3EbTH4/4`Y]2`!9H/3,RC3A`;4Z8*P$B6#OT/1iD0/i#@:1-%$@3&!0J1b^I41c-gD
3B9#W3@l^4cE]2V;eL,%%15CACLLZp:i^8gE\'aZ+?))42_6sH1,L^:cE]/I;eL,%/M&V:1,:a>
1c-sI/2Jn=2CpUD0J57@3AiZK/1i\8/i5FF3AifJ/1f)P0e?79E\%Y,6#pjS@Ot&J+>Gi62(UL?
3B/lIcESKcAT01d/2/q;1,gd>2`*NG1+kFD/3#F<0fUpG2E*0=0fL^E1,:UE3@l^4cESooAT010
$:/`CASc0k/4`Y]2_d<L/3,LD0K(K-[NJL]E\'L-0f^pC2D$[E2)?d=/iGC71,q-D2Dm9E1c$[7
1-$sH3&!$E1Fu4.FD5VD/C([T;eL,%,%5P&ASc0k+=JEX@<-4(BlkOC.4u`ADfp)1ANCr"Ci*Tn
ATMr90f:[C+q4lFF(K0(F`SZkF`VYF@;KY!/4`Y]1Gh!E/2T+B0ek6)Zlh_R@k9oS/20%?1cHp>
3&!?D1G1[E/28q8/ho:>1,LsA0fUd?2)I*C3@l^4cEo,iDIY4,$:/`ECi"68+@:!eARTChF"Bj[
+>Yi23@m!B3&!6AcEeW\DIY4`@4X)l1c$p<1,1OD/2St;2CpR=0J5=?0f1^B/2Aq41c@<N0JP+0
/C(RQ6Z-Bb%15CBBP_7$BONG_;BRbP3&3$A1GLRD/C(XG89nVp5qF]L1c@<D0K([D/2Jn83@lm@
0eP@E1H.<N/2f+;0fV-H3@l^4cF#2oH!r65$:/`PBk1q!CLo%f;BRbR3B8WI2)R6L/C(dK6Xb!d
/M&J)1+k=:/28q@/i#@@2)70C/N#O@1,h'G1GUL4/C(dW6Xb!d%15CBFCfK2E+LRk;BR\K2)-X:
2`3NS/2Aq&<+0o#5qF]G1c79D1,LdC/2]%=2Cp^D/i5LF3B/rK1,LU@2)I0F1+Xt-1,1=Z@<F+1
$:/cBCN"6%CLJbq5uUT32Dcsd5uUT32Dcsl+@Ak3/70q^2Dd6J/Mf.>1+Y.8/iG^@0eb=70ekO>
1,:C41GURB2)mBO1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq9joSPDeF!)ATME*E,ol9Df]?'4!6h2
@;Be%@;B9oD.R-nF!,R<AKYJr@;0U%De:,6BOr;PFCAZtEa_!OFD,5.Cgh?sATMr9D/XQ7FCAm$
+ECn.B4W3"DBMnsB5]C3$:/cIAR]q&ALpAM+>tr11+YC=1G^a:cF4oaEa^Lb/29%<1b^F<0f(O8
1+kLA/2B%>/ibpN3&NZH2DHgA0f1X?1b:1/cF5>mEa^L.$:/cJCFi"S+>GT,0e>%<1c.0CcG(Ju
ATB=f/2/k:1c$X<1,1^=1G1XD/2]=<0K2!N1,(781+k=A3&3<E/1`?t^FW2mE\%Y,6$-pOF"Bj[
+>GT03%QdC3&EQF1,g=T@<F+e@50;e1Gh*I.l&q81Ft=72DQg@2_HjG0JtjL/2B%70JtXC0f:L5
/2B.8<+0o#%15CCEbSr585^Qg1,1^=3&36J1G$hV+B3AI/1iD-2DdBP/N,UC1+Y.43AE'?2)6d=
2E!<G3@la?3A*!@2`EHH/50JoBl5IQcESp"E^;6DDf0Z;@:OCnDf-\9AfsEKH"D"=A7]grB5V."
Bl@l35q$PgBON>4<,u\$@;]_#ChY=@5q$ksFE1f+Blb^U%15CEBlA#C85^Qd1GCa=1bg[?2_<7^
+@BRX/3tg@3&36H/N#OE0e>%33&W<B1,U[B1,q*M0J"e53A*0C3A`]P/4FGhCh[s(/1f)S/43id
/4j`&ASuU$A0>K&EZe=pAKX9QEZdYaD..<j@j#]%+EV:.+@o3L:189eBk(Rf+@0g\@;]L`+AZT]
Bk(]`$:/pSZYXQ%Cb/+F+>P]/2E<QE0ekXD0f^dl+@B^^/70r8/3#7;1Ft=>3A*<N1bq'N/1iV4
/i5=C0ekR;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43uj/0[f"G\LYrDBNn=DfBW9@;IP=6$U;RCi=E3
+Dk[uDK?qE@<?($+CT/%D..6'Bl5&8BOr<(@<?4,AKX`VBQ[a*C`mP&DJ+*#B4WV:GA(]#BHV#1
+CQC8DJ=*5AKYE!A0>B)Cijf?@;Kb*+EM70DJ<]s@ps7s+D#G$ASl-k+CT,+BPCpiDfp+DF)Y]#
Bk;?.Ao_g,+EV:.+C\c#Bl5&3AfsfZG\LZ+/g:`36$[$e@<-R#A9f^s6m+3D2`*9@0f(gM1FulU
7<3)n?S#P82_I'E/2T4:0JkUC0JY121,(=?0JYO?1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qsEbR(!
H!tT-@<*K0Ec5o8F(&lH+@19aH!t`;@:XX+BlbD=BOr<&@<-!lF*&O5DIal,Df^"CBl.g-Ecb`-
F<GU<G%G\:Bl5%fH!tT-@<*t0$:/uLCh@*f@:s.&85^Qi1GCO70ebO@1H$f1J2&06H"SZ[/1iD0
/iG^@1GUg?2)6sG0JY1:0eP1?3ArWK/1`?uJ2&TBH"SZ;$:/uO@4XrI+?2;:/28q>0JP-([ie+[
Be1he/M&\13&rNH1bLL:2E3WO/1ih63&rrQ1c6g8/C(^U7<3)n%15CID/!Np/4`Y]1GCXC/2K7?
2_Zf.^*$6pE%L"!P:SCH1c[?D1,LjD/2Jn82(UI:2_HmA1Gq'H/1iV6/iY^K2`N]H/1f)\/5UJ.
/.DqQ@:a4bFY$'O+>GZ.0K:sA2`!0E2Cpg1<D@0Y?S!og2)[EE2`*BK/2f+?1Ft::1bLO;0f1gF
/2oC<3A<-I1,CI:0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"B:%<D@0Y,#`E&FD)diDfTDtDBNn=DfBW9@;J"J
6=FG@A9B#/F!,R<AKYZ#B4tjtF<GF=F`);0Bl5&3DBO%7AKXWaEb/Zs+E1n0Bl8!7Cgek;F(o`=
@<?'k+DG^9:2b/pBHTrdEb/Z1+CT.u+EMgF@W-'sF(KD8FD,5.DIIX$Df0!"+EML9EbTV<De:+b
DfTDt/g:`36=FnP@<,m+F!+D'@<*nh8g$#P3@m-K3AWTF<\cNd0Ha/1BIk_d/M&n72)Hj>2E<BH
2)I!B1Ft@82E!NM3&iH\5uf%/7oN/6/64M`0JG%RE+gd3$:80CASrV`@;0h%F"Bj[+>kr8/3#OE
2([%]+@B^^/4!\q0JPF>2(^O:1,(78/iPU<1,ggF2Dm3F2_6O80J5.;2)$jD/1`?t[OadWF=[k.
6=j_FBl,Cl;BR\M3AW3A0JtXD/C0#++@U<b/1iD)/2Jn=2_6jF/het>1,CpA/Mf490JPIF1cR$r
DfTl@E-,Z%/1f,$1Ftt8Be2PdD..'gF*&NZ2)-rt$:8<<A1U8L+>GW33%QdE2)mNGcG)(V7<3)n
/M&J)1bLI=/2f793ArcP0f:L62D-sF2`3QK/1`?t^G.9.EbR'6$:8<?AS`ng6m+3D0f(XA/3,RB
1,LOh+B)on/70r8/2o1=2(ULC0J5+=2`<EM/1iV5/iGFE2)d3?1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/5p2%/5p+tAS5FfATME*E,ol9Df]?'4!6k$Ch7E*BlbD*+ECn2AKZ&4F`Lu'+E(j7G@>T)EZf(6
+EV:.+Du+<FD)e8Aft#`DImHhCb?/(6=jtL@<?O(GUuB`+>Gf80J"t:1G^p?cEeWhEbR'V/2/q:
2)-U82DR!<0eP@@/3#@:1,q$J2DcsC/i,=E2_[$=/1f)Q/5L;#/.DqQATD?qH#@>)/4`'+/Pn#R
2(V9a<%Uou0f:Lh+AcWi/70r8/28n40JY1;2D-aA3&!6G/2K:=1c@$G1bpU;0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL:h=Yu,#rE!@;0Un@;[3,Ec5o8F(&l;+@9X[AS?@,Bji-.@<3Q"+B*)bG%kG/A7]Is
Gp%$;+Eq79ATDi7@;]TuEbT].EaiHpCNCV-F`\a?DBNe7Eb-A6ARf:hF<G[>D.Rc2BOu3,F*(i4
F`S[=@<3Q#AS#a%E,ol6DffQ$+EVNEFD,*)+E(j7@3BGrFD5Z2@;I'!De*BiF)rJ`J<V0#,%tOr
Ecbt;D/XN0ATB=EE,ol=ARfh&ATMo8De:,6BOr;t@<-I'+sJW`%15F5FCf9$AT`'*/4`Y]1,(U@
/2B.E3&rP8Yolh_Be2PY/2/q=2)6[92_m3@0J51>/3#UA2`WWR1H@!F/i57@0K(a=/1f)O/5L;#
/.DqQBOPpiDJ:Xm;BRqT3%Qd?1,(^>1bg+=EbR'j@4X)f2)$^71,gpG/2Jn:0e>.:/i5RG3B&]E
1,gg@2D@!B2_6L21bgOIEbR'6$:8H9BZ,HQ844R[2D@*F/2T=F0ek4d+B)ir/70r8/3#7@1Ft7;
3A*!@1c@6H/1iY13&!<K1,CI:0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;e:2),"ZZ_Bjkm%E,ol9Df]?'
4!6k(@VE]2+BpL.af8glVI;,`+DGm>FD,5.6=k%I@;KX#E,ol7F`(]'@<?4%DBNk0+EV:.+B)]d
F),f1F<GdGEb$:nBjtaa/0K.MBk(g!D.R-nF!+m6@WH0qBQPA+ARTEuDe:,.BkM+$/g:`36>:+A
D(J4U+?2280J"q43A`KM/C(aJ:h=8j/M&J)1G1O?/2K(;/i>IG3AWZH2D-^E2`N]O/1`?t\1CHf
B.OK!6>pp`DIG(e6m+6=2E!9D/28h;1,Ud;?Q_XSE\(QK?S"/h1GgX=1,U[D2)@0K0e=n8/i57A
1,Uj=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"8r/0[E!F)G]#+CT.u+@p'aH=^`-G%ki&+E2@>E,Tf+
Cc`b+Df]i7@3B9*+EV:.+DtV)AKYW"G%GP6FDi:DBOr<.ATDg*FDl2F+E(j76>pp_Bji,uDBO%7
AKW]]FD)e,ASuU4Ed98[9OW$SE\&>TBOr<(@;TQuG@>P8FE1f-F(T?2D.R6#FDi9gDf]f1@3BK/
BkM-t@<?4$B-:f,Df$V=BOr<(@;TQuDe:,6BOr;QDf]f)+ED1>ATBCI%15F?FCf0(/4`Y]3AiNB
0f1jG3%W@^+@1$^/1iD)/2St82(URC/ibUE1Gq'A0f^jF1,_$L1b:1/cEo,gEbR'6$:8cA@q]S!
D(J4U+>l&21FtI@2_d-?c\!?6BjrVZ/29"91bgR;2).$@1G1F?/2At=/hf"=2)[BE/M]191,q!K
2DHa6/C/r"9PIre%15FE@WcW@844RV3&3HL/2B+>3%umj+AHEb/70r8/2f+=3@m-H/i#:D1b^^:
/N5I<2E<cR1c?m?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9kA2n6$76jEa`cu@;[3,Ec5o8F(&lH+@:3[
F`8I;F!,R<AKX<XDf0cAEcQ;?B-;D:Eb$;)DfQt1BPD9n/e&.SF`(V=844RT2DI-J/28n73AE'l
+@0mU/70r8/2o1:3%QjG/i#:C3ArZE1bp[;2DR0H0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoDIb:e
FD,B,E+r`u+E2@>E,Tf+Cc`b+F`(V1BlbD=BOr;rDf'?0DJXS@F`V,)+EqaEA0>K&EZek1AnGUc
+DG^97<E3WDfBE!/e&.SF`(_u/4`Y]3&3BK/28h:2`N]HcFtDeEH3Tr/2Aq92`NBC2`3<@1bLaA
/2K%</i5@C3Ai]G/N5:A2)I'B1+Xt-cFthqEH3T>$:;Y0Cr<5iDf[I#6m+HH2`*'D2Dd3@?Q`0d
@k:t<?S",g0et:80eP791,1UF/2B1;2)[?N3Ai?C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:ig+t,"?Ta
DI[?&E,ol9Df]?'4!6l-WGKJODJsS=G@>P8FD,5.B5_<'De:,.BkM+$/0JkC+EV:.+B*E#/0JA=
A0>f&+D>=pCij>5Bl5%`@<HC#F(c\5H$!_<Ci<s3/g:`36XakNE-64Q85^Qc1GUj>1GCXA3%W@[
+@BRX/3tg@2DR*C/N#:?1+Y"2/iGI93AiEL3&`iT3%QX=1+kIF2)[?I/1`?tYq/7NE\%Y,6XaqF
Ci!N285^Qb2_[3B1,LmC3%W@[+@1-j/4!\q0JtRC2_-^C0JG%3/hf792`WKF2_m0E3%QmD/ibpN
3B8fF/1f)O/4"E!/.DqR@;om285^Qc0e>7?2D!.Z+@BRY/3tg@0JGLB.lB=@3@lp<1,pg?/i#FD
2)6p<2*!9D1c[KS0e=k,cE\ug@<3t/$:A6CFDl1N85^Qc3&r]E1H%3M0J(MS+@g![/4!\q0K1dE
2CgR<2)?d</ibmB0ekI:2DdEN1,pg@0ePFF3&3EN/1`?tYq/CVD(H,'6Xb%XF_kJ;85^Qc2Dm$B
1bpg;c\4+s6Xb$e/M&J)1bL[A/28t60fCpF2_cj@3A*$G0ebIB/4i--+BM'3:+RsBKeb2H@<3t/
$:AB6@;KsmBe2eQ+>u,31FtLD2`*9@cE\QgE+gdS/1iD./iP[>1,_!B3&W`N1H$d@/i>OG1GCL6
/1f)P/5L4u/.DqRASGUl/4`/O2D[0I1b:FA1,q*A?Q_^L@4Yb:?S"2i1H-j>0f1LB1bg[A2_6O>
3%csF3&roS/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QX@4YE!F_>i*H!tS5E,ol9Df]?'4!6n%Bju!'
BlbD=BOr<(@;TQuDe:,6BOr<(@<?4,AKZ)8AS!!&Aft)oF_>i*Gp%3B@<<W)Bm+'/+ED1;AKZ)5
+EV:.+DtV0Bl@ltC`m>+Dg,c5/e&.TASbddDJq's;BR\K1b^I82`*KS/29%*<+0o#/M&S31c.0B
1,L^E/2]%:2(UUC/i#+73&rcG1,LU=3&rfR3%QU30fCR^@<F+1$:ABFG%#91ATKCn;BRkT3&N6H
2E*WS/C(mN6#pBb/M&J)2(gU@/2B+A/hf(>1,Up?/N#783&<BF2)-X;0JPF-:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?cFb\oEa^LC9ke6_
AS`K"AKX?OEctl/FCfM9;dj*XARogi+=Js%1cI!@2DI*=+Eq78+CQC)@;Tq*F!+D#@;]e#BHVM>
Blmp,+CT.u+CTD7BQ%o6De:+9,"6;j8T&0PDJ=$1D]hSbA79:eD]hGdDBMf!Bm=Q<AKYMp+DbI/
9jqpLBON)//g:`36YKnE@<Z-t/4`Y]1bq!K/2]4B1,1=:2]u*p@4Wu]/M&b30Jb772Dd$G2E!EM
1Ft@:/i5@<1,Us@1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>492.^<4FD5Z2/2T::<D?mQ6YKnE@<Z-t+DGm>@3BE4FD,T/DeEco@;I&rEc5H+A8,jk
+DY\/B-:f,Df$V*+B3#_Bcq#+Chn-$Ch54.$:AK8D09W:Gq;Ka+>G]-1+Y173&rfHcF>VP<+0o#
6");u1bq$L.krn=1+Y462`!!C2_HgC2)R?O/29"73&`NN3&3$9/C(a\/6$&#/.DqRBOPguBQ@O,
@4YJG;c#&'0J$9k;c#&'0J$QR7<3)n?S#P80ek:>1b:I>/iG[K0JtjA/MSq33&rrP2DZm>0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL7<3)n<+o]S+E2@>E,Tf+Cc`b,BOPg%:hXlXH!qh0F!,R<AKYW+ART['
EbT].EZf:4+B3#_Bl%3qA1e;u6YKnK@4XrI+>c#:2(UX?1GLg>cE\Q[<c0HS@4X,g1G^s?1bga?
/2St71b:@@3%d$D2)[-E/2T(61Gq*J2`WE?/C(OP6WS(U%15I9@<6A+Lb)(_<%Uou2(V9a<%Uou
2(W)W9R1Y0?S!ok0fM!@1H%$J/28k33ArED2`*-D0Jt[G0J#"</iGI>1c%$@1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/51>0/5pA'G%#0#@;[3,Ec5o8F(&lH+@BgNF)T$R+DGm>@;[2rDI[BlDKI""Ci=K*
CER_1Ebuq2DfQt!F`&f@$:AK<@q]Rb/4`/O0f_!I3B8WN3B0#U/70McEGR15/70qd/i5C91GCX<
0JYL>0fLX?/i>UB2`W`H1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"8l/0[GpARfCf@3B9*+CQC)CghE;
F*2M8@:NkZ/0K%T@:X(oBl@ltC`mb0A0?)7DepP0@<<W9DfT_<@X0)5ASrW!DIal6Df'''/0K"Z
D.7F"Ble!+B-;;0AKYK$F`);AGpdYUEbT#s+EVX4A8-."Df0V=@;]TuBlbD,Df0W1A7]dmA0><%
+EV:.+DtV0Bl@ltC`mD&@:WnhATMo8AoD]4Bl5%mF`(o7BjiV<%15I9ATDm$DCe=V+>bl33@m$E
3&`iKcF=ujAT'+O/1iD//i,:70fD!D2)[-B0f^d>2(g^@3Ai`M/1`?t\1C<bD_)>)6YUXNA7]Rn
ALpA?+>G`-1+Y.;1cHsm+Ad,h/70r8/3#7<2Cp[;3&33C0eb.51bLI>1cI9M/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S##p@k8fp@;0gt@;[3,Ec5o8F(&lH+B3#c+@Bjb@:WqcCh4`'F!+m6Cgh?sAKYi.
F`);0Bl8$2E$/b2Ecc>5F)rI<DBM\mEb$^D87?4SBcpl-Bl%l6@:jUmEZdn]Bln&:F!,17A7]^k
DId<r@q@26@;]TuG@>P8A7]grB5V."ARlol+B;0*;aX>'=)W+qA0=ESEbTW(B4W3,Blmo/@;Kk"
B-;D4FD)e=BOr<(ARTUgGp$$oDK@C.DfoQ(+AcK_@:Nk$+q4lHBlmd"_kAVP6m+?B1,_!@1G^sE
3@nM[9lFo#?S#P82D-aF/28h9/hf4A0f1mA/N#.:2E*?K0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r&
Df.*pC`lYbCj'5tDfTQ#DBNn=DfBW9@;J"J6YUXNCr;qhD.R-nF!+@pG%G\:De:,5FCB32+DG^9
FD,5.DIIX$G%Ddk@;'dlF<GC.DJ+*#B4W\)$:A`ABju!s@ppoZ6m+<A0K:U>1cIEG?Q`9WCb/pE
?S",g2`N?C0eP180ebFA/1iV8/i>@@2E3KD1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p%p/5Bnh@<,dh
F^]/1E,ol9Df]?'4!6n/@qfCjCh$lrBlbD=BOr;]@;'dlCige;@;TQuAoD]4FD,5.Cgh?sATMr9
Cgh*j+DG^96Y1.WEa`c,6#C1RBk(QoBl5%gBk(Rl@:s^k/e&.TDfB9.DJ<U'F"Bj[+>Yl11+Y7<
2)mNG2)QLDDIY4`/20%@1,^X<3&30=2(gmH/28q:/ho1C1,1O81,pmB1GCdD0J"t50f:(K@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*`2(V+4
@k8g!Bk)'t@<HW66Z6pTEc,T$F`S[DEZe(jCN"#tC*6/fE+O'-Bknh>0f1gF/MT+>1FXGj@<3Q"
+AcumBldr1@<6O2Df0K1ATAo;BQ##4Ec5o8F(Jl)FD,5.BOu!oDe!?rFE2)*+Dl%-AS`K-Afu2/
AKZ&4Cgh?,F*VhKASiQ(DBNV,F!+q1DegI>,",ubEb0E4Cisi6Df08uF`S[DEaia*D'3>,ASbq!
FD5l7+sJW`%15I@EZd_XEc5c./4`Y]1c[9J/2f:=1,UW.YqdFh<c0HS@4X,g2)[-=1H7*L/2Ah;
3@lmF1bLI92E<TM/2K7<1GLjF2`<3\@<?4$+=KZrB5D:'BIPJ`cET,U6WS(U,"uE^@N['R2E*E@
/0Ic'@=!66+=Js(0f1='%15IFC11s185^Qg0ekU<3&!0I1G$k/+@p'a/3tgA2DR-H.krk71+Y77
2)d'A1c?sB2)@6O3@lmA/hf(;1,h$@/1f,(/4a>m/.DqRF`MP3/4`Y]0fCpJ/2B"@2`3/3Z62SV
Be1he0JtOC3%ZgA0JtC:/iPa@2`<9K2DR*G0J"e5/hf7C1c.*A/1f)P/4FSn/.DqS@:Eqa/4`Y]
2`EZR/28h41Ggs?cE]/I6Xapb6")<"0JY@:/MT(=2_6a;0JtC;0JtI<2)7-F1Ft+41bL^H0f1RA
/1`?tZ8!mt@;mb,$:J<=Bl,Cl;BRtX1Ft7;3&`iKcESK]DfRBp/2/k71,1@93&N]I1G1XF/2T==
0JPOH2Dcs:1,pmH3&``N0J"b+cESoiDfRB<$:JHCAR[2];BRnY1,LO:0JY=B3%W@[+@CEe/1iD.
0JkL@.l9+<2_6[91,UU=0eb492)dNT0J#%</i#C?1G_$B/1f)O/44\q/.DqSASu'g+@0gVARoL+
85^Qi1GU^:0ebOD2)[#2Zlh_EE%F:`/2Aq:2_Zg<2D@*A1+kOD/2K%>/iP[B0fV!@/MT.90et[C
3&`B>/C(UR6Xapb%15L7DIm9qCgekc;BReR1GgX?2`<HI/C(OD9P&,n/M&V21c[9@0f1[C/2Ah4
1b:@?2_HjD1c[9E/28t62)d9E2)m-</C(OP9P&,n%15L;@:Wqd/4`Y]1c[HR/2f=?1bgQ,YolDP
D(It(0f(O<0Ink:1GUL</iY^>0f_0F1c[KK1-$m?2_HsC3A`QO/1`?tYq/7\D(H,'6tpOODerj-
/4`/O3ArQL1FtC?0f:pA?Q`$RD_,6H?S"/h1,1=72E!0B3&NHH3%QX:/i>@>1,1a>1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/50Vn/0\&6Bl7Wq@:UKhDIakhDdm-fD]j">DfBW9@;J"J6tpOODerj-+Dk[u
DK?qBD]iS!DI[6/+EVgAF*&O5DIal3F`M@BBl5&)CggdkEaa'$+Dl%?ASl!rFE8uUF*VV3Des-/
Bl7Q+FD,5.@s)U0F`M%9@;]TuCgh3oF^\oo+E(j7FD,5.@;]RdF*)>@F!,C5+EV:.+E1n1E,9).
De:+kEbTE*A79!k@;]Tu<,Z5SB5]CH%15L;E+icj/4`Y]0fV-D1GggH/C(OD6Y1?j/M&J)1+k7;
/28h23&roR2`WE@0fL^F3&WZK2CpC1cE\ugATTI4$:JTR@4YJG;c#&)1+ZKm;c#&)1+ZcT7W3;u
?S!ld1c-s>1GCO;/28h23B&KG0eP.:0JG=</1iY3/ho7E0JkX<1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/4OPu/0[esF`M2<Bjkm%E,ol9Df]?'4!6q*H!qh0F!+n/+E(t1+DbJ'E$079@<<W+F!+q4Dfo]+
F<G%<+A$H]Bjkm%@;]RdF*)>@F!,RC+AH9eEbTW0F`S[>DBO%7AKW]e1,((s/0JA=A0>T-+E_a:
A0>K&EZf14B4uC$DJ()&F`M26B-;87ARfF_C`mY+@psFmDf0VI+DG_'Cis9&DJ()6BOr<&BkM+$
+D,2+FD5o,C`mY.+@Kpf@;KX1+q4lIDe<]o@4Xr;+>GT02DI0B2E!6G2_8;Y<D?mQ?S#P82_HgD
/2An8/ho%<1cR6A/MoC=1,gpD2Dm$@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1-d8T&'WDImm'@;[3,
Ec5o8F(&lH+@L-[Bk1WpD.R-nF!,CDEZfFF@<*K)DBM\g@<3Q-@;]_#@:s.(%15LAD.6q!/4`'+
/Pn#T/1b-N<D?mQ?S#P80ek:<1+Y172D-[D1bggA/2T==0JYUG2E36C0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL<D?mQ,#WQ)F(o'#+E2@>E,Tf+Cc`b-Df&rlGp$gB+CQC5ATMd1F<GU8B5):%+DG^9FD,5.
:2b/pBHTZNF^nj$F`S[BDfor>@;0V#+EV:*F<G:=+D#G#Ci=B+A0>?,+Dl%>DKK<$DBNP0Eb0<6
F!+n/A0>o,@q[!/Bl%<rBkCp-+DG_'Cis9&DJ()$ARTV#+=LZ>+EV:2F!,OG@<*K,Bk;?.Bl5&8
BOr;rDf0W<ASc0kFD5Z2+B<H'@3A9QC2\,D+EV:.+D5_+@<<W$ARTU./g:`36uujOF^efg/4`Y]
2*!NM/2oOF0JP-(Zli:WD_+1*0fC^>1G(@;1H-j?/i#F<1,L[;0K:jE2*!3>1,:I?1,1^B0J"b+
cEo-$@rEn-$:K#GBOr_c;BReP0JP+91b^gB/C(LC<D?mQ5qF`F0JbX<2DI$G/28b:0e>%;2(gmF
0f_-L/2f482`3<D1Gp^7/C(LO<D?mQ%15LLBjtLg/4`Y]2E!?L/3#OG0f1H-LbU#?Ea^Lb/29(?
0f^aC1,(^>1bLXE/2B+@/i5OE3&*6@2_m!?1cRHO2_6L2c\O;,6ul]e%15M@XEVRj/6>,9:b=C\
/6>,9:b=C\/70Mu@rEo*/29">3B/TG3&!0?0ek:;3@lpA3A*<M1,:gJ/1iV:/hf1<2`3BB1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/5p%s/44>sFC?:iBk(Rh+E2@>E,Tf+Cc`b-_lS("[NK:%+@:*_@WH0*
Cgh3oF^\oo+Dk[uDK?qBBOr<-F`&<M@VKIfATAo8BOPd$FD,5.F*2@CG@_n4DJs_J+CT.u+EV:*
F<GI4G%G\:FEMVAF!,C5AhFN"7:L(A/4`/O1,1aG2E!*@0f1[A1+ZcT:ig+t?S#P83%d'K/2K+A
/i#FD2E<ZH/M\q62D@'H2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F(6aF;gECt@;[3,Ec5o8F(&lH
+@TaU@3Bc&F!,C=AKYo'+EV:.+D"u%Ch[I%F<G@5DJ*KuD0$h6DBMl'EbSr5+CT.u+EM+7G%G2,
@<3Q"+E2@>D/!m!DKI"AAS5^qDBNY2+EV:.+>RhF+CT.u+>\%K+Dkh/Ch7Ku@3@lh6S9Pl$:SK6
F(o,t/4`Y]2)d?K/2oFC2)m/4\KF:\@4Wu]0f:^C3@csH2)m-C/i#F<1,CX;1,C[A3ArEG3%d3L
2D@$F/1`?t\L^-h@4Vip7;QOFFE1e@85^Qb0f1X:0fLpL3@lmD+B2cl/1iD,1GgpK.l&q82_6a;
2_lpA2D-a>3&rZL/2B%70ekI?1H$d8/29(7<+0o#%15O?B45C\E\'aZ+>ku03@m*C2`3HDc]oVR
BlYaj/28t:3&3'>1,1U:1bLaE/2Aq=/hf.:2)dBD/M\q61,h3N2_6L2c]p%^BlYa6$:ScHF`MV8
/4`Y]1,1^H/2B4>1GgZ.\0+.WCb..h/M&b30JG%<0ePFF0fUjA/1iY:/i#:>3AN9>/1f)V/44>l
/.DqTCi3['BIl\P+>Gf80e>(;1bq$AcE\Ql@<F+e@4X)i1,^p=1,q'J/28b82(U^A/i>RC3B&ZD
1,pmE0K1gG1+Xt-cE]!#@<F+1$:ScQ@;]ds/4`Y]2E*<I/3#RJ1G^T-ZQMYV@4Wu]0fLsJ2CgX>
1-$m@/i#771,_-F0f:[C1bgO=0eP:B3&ioV/1`?tZReLb@4Vip7;Za_/4`/O2_d<Q/2]:?3@nM[
<-;\%?S#P83%cmC/29(92E<ZS2)[!;2E!0B3&iWN1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r-F^lss
DgGi/@VKh)AKYr4DfBW9@;J"J7;Za_+ED%4Eb0<'DKKqBCi=K.+DG^9FD,5.Ci<flC`lG\CM7j7
@3BApDJ+*#B4W3(Afu2/AKYl/Ecbu+Ec*"?AS5^qDBNk0+AHd#@;TIfEHPhF%15OABkAne;BRqT
0K:U<0K1dB2([%\+AcW^/1iD.0f1^B.kit@1Ft:61H6pA1,^a=1c@0M1b:X>3&`]K0KC[8/C(XS
:h=8j%15OEEa`Z585^Qi3B&cG0ekRF1,gc0ZQMVHE%F:`/2B";3AW0E2`!EE1G1F;/2K.?/iYXF
2Dm?C2`E?I1GUa@1Ft(.cEf&hAT010$:\H9DJ=,B85^Qg3A`TE3A<6G1b:I=+@L6Y/3tgA3&3BG
.lK7@1b:I93&3$?2`<9F3Ar]J2CpaD/i>OC1cR0?1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/2T+56ul]e7U]nHBlY>?@<3Q"+AQiq
F(HJ2H$!_<Ci<s#@ps0rA9VI&Afu;2D]j.EEc,H!+DG_8D]iI2A9)*kDf.0:$:\HAB.QSO+>l/9
1b:RF1,_!@c[[-:@rEna@4X,j2)mTJ1,^gF/2Ah;3@lpA3A*6F1-%9K/1iV8/ho(;0ebR</1f+t
/5p%s/.DqU@<Z.#Blbgr;BRnU1,pgF2_d3J/C(UF6[<;q5qF`N1c6s;1c6sH/2Ah<0J"t>2D-aA
1H%*M/2T4:0f(LC0eb.0/C(UR6[<;q%15R9Ch[rA85^Qd3ANBA1cRBJ2(U=%89nVp/M&J)1bLdF
/28t@/iPLD2)7-B/MT7<0JGLC1H$d8/1iDDH!r65$:\TCBm=f0Eb0&q/4)`V0fL451Ft::1cHsm
+@B^^/70r8/3,=@1+Y@:0f1XG1bpU60fCX>1,^pF2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqATTII
6ZljHDBNn=DfBW9@;J"J7V-CMGT^$qEb0&q+=Js'3&ooJP;,$S1FXGj@<3Q5BOr;uBl\9:+EVNE
FCeljBHVA+Bk;0lAKY])+@C9\@3B!#+EV:.+B)]d+@BRXCi=A;@;]Tu;djPd6#C(ODf]W2+B)ig
Bl7@"GqL41AKYo1ASu'i+EV:.+Eq7>+EVNEARopn@<?4%DBNP0EZee,Cb-];DIal!AS5Fh+EV:.
+D#e:ATDL%ASuTuC`mh2@:NtbDJ()1Afu&+H#m\0F!,17+@C9\@4i`5$:\iCB4Z1'DKKG@844RT
0JY@C2(UUD1H.!=?Q`B`E\(QK0ekLB2_-R;1c[*H/hf480fM!C1bpsE1,(77/iYU@1cIEG1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/66J*/0[Z-@;KXdDBNn=DfBW9@;IP=7VlXKATVj.FCcS/F!,R<AKZ,5
A7]e*DfTZ)+ED1>ATAo3Aft]"Eb-A*Ec5e;7ri0PCEQ>sFD,T/DeF><Bl5&8BOr;XFCB!"@;[3*
@<-BsFD5o0+E271D'3b7+EV:.+CSl(ATDU$An<)/,"--gBl7?%6Z6gYARoL`+sJ-X6tpgYDIjqX
Df'?&A9fUH@X0(a@;^0u+@0gXB4u!jEbR'I@q]e%ASrW!F!+n/+CT)&F`V88DBO%>+EV:.+EMX5
E[PoNAnbgsGp%!5FEMV8/g:`37W3-PChR7"F=]s\+?2;83%Qd=1G^pK/C(LC:ieoR5qFcH2)dHG
1-%-L/28b32_6aA1bLU>1,_-K/1iV;/iGI?1,Cj?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKEJYq/^m5qF3Z
BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbacJ_>`"fVdDUfWEh_fW$'+F_r70Cb=VU
V."Ri+=JUSDfp/8+E(j7FD,5.Anc="-RgYj8T#YIATDj+@;[2rF*)G@Ci<s3/0K%JBlbD<FCB24
G@>P8@ps1iARlo-,"Q-SFDl2.DJ(LC=(-2\BOu3,De:,6BOr;bDfp/8+sJQ\Df0,/De:,6BOr<,
Dg>c-+EMX5EcWiW%15RCEc#`9@4Xr;+>GQ(2Dm?C2)[<G3%SDZ9P&,n?S#P82D-gD/29(>/iP[G
2D[9C1,(=;1bgjE2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%AT'+D6YL1OATME*<+0K[ASE9+Ec5o8
F(&lH+@^9iD/XK(+DGm>FD,5.BPDO0DfTQ%@;I'(@;TQuDe:+k@;0poDBO(CARlotDBO%7AKW]d
FD)e,ASuU4Ed92YD.R-nBl7Q+@V&tjFD5?0C`mG0+A?3cBl5OI%15RF@;^BB83p3,:b=CY/4`'+
/Pn#R1b;uV87cfm?S!oj1,(R91H7*H/3,=B2CpUA0J5(72DI*D/2K7<1,La@3B&KE0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL87cfm,!g?mFE2)(DBNn=DfBW9@;J"J7WMpTH6?pC+CQC&BOPpi@ru:&+DG^9
FD,5.D/XT3AKW0@;e^;oBd+`DASkmpA9hm,B-:W#+D#D/ATD^0+E(j76$76jEbSr)Bl5&8BOr;g
8Q^(J+Ceu#FEMVL/g+,,AKZ#3Ch4`'F!,F<@<lEp+C]U=FD,5.@:OCtEZe"`EboE#Bl85>6Gp6F
D(["A$:]/SFY$']+>G`0/2B4@0J(MX+@BRY/1iD)/2Jn:3@m0C1,LaG2)-X>1G1XI2E<HN/1`?t
[OadSF"@b-7WiQVCia$%@;B:b/4`Y]3&`cP/28k83&ioLcE\QhF(6aQ/1iD0/i5O=1GgsA3ArlQ
1,UU=/iYU?0JkX</1f)P/5UCt/.DqUF`(nE844RT0KCmF2Cpa@0fM$B?Q_aW@4Yb:?S"/h2`3-@
3&iNE1-%?P1+Y@@/i5OJ2)I6C1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4=Me/4j>_Cgh3lBk&9)Ec5o8
F(&lH+@^KkBcq,2+CT.1Derr,8Rl=J@;]Ui@j#u6Eb$;0ARTIjDJ()(Bl[c-DfQt0CghX$/e&.W
F`MV8/4`Y]1,:gE/2Jt71,:E+[NIq3@4X]Q/2/t;0Jb::0JG=71G1@:/3,R?0K1sI0JG%01GCF8
2D[-I2_6L2cF,8k9joR^$:]/`F_**p;BRkU1GC@>2_m9G/1huC@rEnM/29(?3B8ZI2_[$=1G1CB
/2B+B/i5IC2)$g;/Mf=<0JkRA0JtC4/1iDO@rEn-$:eN7EclUX85^Qe2`<HC2DHmF1b?qY+@C0l
/1iD-1,CX?/N#I@2_6[92*!3B3&`HK3AE?N3%QX=2_Hg>1GU[@/1`?tZReIaFY!t/7q$1YBk/bc
6m+EE2)@'?1bpmE2Cr2X6Z-Bb?S#P83%csB/28n?/iYRC3&ENE0et@A2D?pG2(UL:0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70qqDIY4aBQ\E*DBNn=DfBW9@;J"J7q$1YBk/?'ARTIt+D>2&E+s3$F)rrV7riNh
F!+4dFD5Z2@;I&W@;p1"DImm1+DGm>FD,5.A7]pqCi=90ASuT4E+is%Df]i9BR(_1Df0&rBm+&u
+CT.u+D,P.Ci=N/A0>T(+@9aaFCB&0@;]TuBlbD8DIjr/AfsERF`_&0-Z^D?Df0Z;Bju4,Bl@m1
+EVNEFD,5.GAhM<A1e;u7qHOODJ*B/:fC77681;R1Fk1=/5T8C+@7b?1G^O92_8;Y7qHNg/M&J)
/M&nA/i5LE2D[<D0fL^D2_[!E1Ft(.?S"]YD(H,'7qlCSF(')?85^Qe1c$s>2)[3E0eCV^+@L6Y
/1iD)/2Jn<1+Y.=1+kOD0KCmB/2fL@1G^a>2`3-;/C(jY6ul]e%15U>AStpi/4`Y]1c@6I/2]FI
0Jb9*ZQMVUFt>p10etI@3%ZjD1G^R;/i>U>0fUsA3AiNK1c$[70fL^B1bh!G3@l^4cEf&hEcruC
$:efJ@;[Ve;BReT0JG%90JYO?/C(XG6ZR<#/M&J)1G1OF/29+A/i,=<0Jb^?/N,:81b^X=1cHs:
/C(XS6ZR<#%15UADdd]<=$]b]/MT%4/70MnH#>0?/70q_0J54;/28t8/ho%83B&lJ1G^XC3&3<F
2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#>/W6?6d^Bldr1E,ol9Df]?'4!7+4+AH9^GT]LbASc'j
/0IH!Ddd]0D.R-nF!,RC+EM41DIjq=Ch[Zr+CQC6FCB2=/g:`37rN6UBld]685^Qc3&EKD1H$sI
3%W@\+@Ak;/3tg@2_m<I.kiq;2_6^:3&rNE0ek:>3&``S1b:U=1,q9M0fCR6/C(OP6VV8G%15UG
F_ti8D(J4U+>u,;3%R$J2)mHEcFtDhEa^Lb/29(@1Gp[?2Dm6@1G1UB/2B+C/i,IB1,(X<2)['H
2_m9J2CpC1cFthtEa^L.$:f5LC1/Ya;BRhV2`WEJ2`*BG/C(gL;e9u#/M&J)1bLIB/2B"?/ho=B
3A<6?0fUd?1bgjG1b:1/cFPQ*ATB=2$:f5U@;K@'844RT2`WlT3@m0I2Dd9B<])cm1*BM.E\(QK
0f^sG2D$[@0ek4;/i#:81,q6G3&ilS2*!3>1,LU<2`WZO1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/64Vd
2)6^]B6#OI6?73dASE9+Ec5o8F(&lH+@gQk@;K?pBlbD*+AH9\@<iu>DfTA>+EqL5@q[!%ARTIt
+CQC0@:s:a+C\o.DddZ/F*)><AKYT'F`(_4Bl5&7DII<lF"AGEEa`U!DK@?OATVE7+q4lLF`(o-
@WcfE85^Qg1b^[93&EHG2(UOA+AZri/3tgA2_d0G/M]4?2Cp^<0K1O<2)m3J1H.9P2(U=72D-jI
3&ioR/1`>.2CqXCBIjT"87?%;E\'aZ+>ko42_6jH2_[!<cE\Q[ASs%b@4X,i0Jb[?2D?mA/2/\7
0e>(70J5@C2)mHO/1ib6/i,FB0JbR;/1f)P/43ud/.DqW@:`tlF"Bj[+>Gc20e>(92`<TGcF4o^
F`K#b/1iD//ho=:2`<9H1,q3J1+Y7:/i#4>1cI<D/1f)U/4"E!/.DqW@;TFh/4`Y]2DI-A3B/uT
/C(LC6#pZj/M&J)1+k78/2K"52`WZM2)d'A1G1LB1,L^F/1`?tYq/1]Be0]#87?R\@;KLg/4`Y]
0f:mK/2B"80f:N-\KF1\E\&dn/M&Y02E<<I1bLO?3&EBF/2K(70fCpE0JG%DFDPB,+@C'YChYFO
cFGJlF`K#B$:nTIH#mCF85^Qb3&ruM1,^mE0eCV\+A[#l/4!\q0JtXD1bCC=2)Qp?/iYO93&<0H
2)m?K3%QX=/ibUG3A<0=6$-pOF!*hgASc'3/C(dW:NC/#%15X;Cj'B3BlA&D85^Qi2_mBE0ekI?
2)d'D0d';(B.PVc1,:^G2(LF91c?mB/i5R>1Ggp@1H%-K3&<*@0J5:B3&i]K/2An62'>Y&D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdY"/5Tnj
/0[VrCj'B3BlA&8BlbD=BOr;[@<?4$+D,P4+<i"OBOr;WAScO$FD50$+sJ.<DIal1AS,LoF!,RC
+EV:.+@B^VFD55-FE2))AKZ).@<<W.Bm+&u+DG^9;g2qtH=_,5@;]TuA9Dp,DJ()6BOr;\Bk1aj
AKX9OATKIJ%15X;H=\Wu;BRhO0K1O@2DR*L/C([H<bZS*5qF`H1Gh$B0JG:@/2Jn73%Qg=1G1RE
1G^^=/1iP.2*!NR1,(7FFDPB,+@C'YChYFOcF,9)BlYa6$:o)JB45g3844RU3&W]T/2Aq70KC[k
+B2cl/70r8/3#7<3%QsH/iY^H0JtjA1bLXE2)70L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#/bFY#gp
B4Z*t@;[3,Ec5o8F(&lH+@pE`B45g'BlbD=BOr<(@;TQuDe:,6BOr<'@;0U%D/XQ7FCAm$+ECn.
B4W3"DBO%7AKXo[BOPpi+@Kd^ATDl8Bl5&7Dfp/8ATDZ26#:1FEbSr7%15XED..9485^Qi2D[0@
0ekF;1-$o2[NJCXB.Q>"1,:[@2(LC82)$R;/i5:61Ggd<1H%*J0Jb770J5=@0f(^D/1`?t[Ob6d
B.OK!88iNd@4Xr8<%Uou1H6pV5u]F4/Mf@;?Q`<gBe3UB?S!oe/i>F91Gpd@3&<<I0e>+9/i#7A
0f(^=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$Y(/4O>kDJ=0*+E2@>E,Tf+Cc`b1DfT`(+DGm>BOu!r
+E)9CFD,5.F`(`$Ed)GBCh+Z#Ec5e;7VQaXBk&9&H$!_<Ci<s3/e&.YF`(W$E5T7<844R\3&33K
/2]:>2`*'m+@C0k/70r8/3#792(UI?3A*-F3&*3K/1iV5/ibjJ1bgj=1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/44H"/4a\sA9Dp$DBNn=DfBW9@;J"J89JfYBQ1l#+Eq78+E)./+E(j7FD,5.FE_G:+D5V'
F!,[?D]iM#@ps4c+EV:.+B*E#+DG^99.+F`BOrP6-rG,$@q`cZ.3M>nH!tS5D0^5:Des?)Gp$O:
+ED%'Dfor>ARlotDBO%7AKXffE,TP8<cr(.%15XKDJsPH83p3,:b=FR/70MjATB>//70qf/iPO:
1,Lj@0f:[B3AE'A0eP.:3&!<M/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"`ZE\&D*F`(i#EbSs"+E2@>
E,Tf+Cc`b1F`),<+Eq78+CQC/AS5RlA79M(+CT.tATMs3EZf:4+EV:.+@pWmF!+n/A0>u-AKXNd
DJ*BuBjkm%DIIX$Df.*K@;]Tu@WHC/BOu3,De:+d@:sM!/g:`38S`-VCb/+T+>l/73%R!J0ebF8
c[d3;@rEna@4X,j2)[HH1-%'F/2Jn<2_6^?3A*'B0ekO?/1iV;/i#.<0K1d=/1f+u/5p%s/.DqX
Ci"B;Bjkm1844R[1,q6O/2T:>3&`Bq+A>LD/70r8/2o1>1+Y.:1G1[D3&3BN/2K+82`NKM1bpU;
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL9MK4P,!g$S@;]dfDBNn=DfBW9@;J"J883-eDfTQ#DK?q:@<-!l
Cj@.4ASc'lG%De<BOQ!*FD,5.6#:"=DJ<NsF!+n3AKYMpF(8d!A79@tF!,C5+EV:.+A$BcH#dV-
DK@?O@3BZ'EbupbCgpgjBjkn#+E2@>F_#<6+CehrC`mh5ASlL"Cj'B2/g:`38SqmM/4`Y]1c@3L
/2]FH1cHu2Zlh_VFY#*q/M&Y02`3-@3&<0G3&WQJ0J"e53%d-H3&r`Q/1`?tZn+RbFY!t/8T&Nj
Bl%T:844RT2)[9G0e>:@2`N`I?Q_XT@4Yb:?S")f2E*0B2*!9L2Dd-H3%QX<3%d'F3AWEE/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S"K`@4Y5dEclP>@;[3,Ec5o8F(&lH+A$HjF_PZ.+Eq78+E)./+D>2"
Afu#(+EV:.+Cf>4E,9).Bl8*4Cj'B#+DG^9FD,5.FE1f&Bk&9%Dg#\7F*)>@Gp$0sGp%3I+EV:.
+B*E#+C]U=AmoOpF`S[%ATDp:Bjkm%GB.D>ATAnZ@WGmj@;R,f@;KIcCi=0!E\7e.8T&WYDCe=H
+>PW12E36B2)R<P/70MhDfQsO?S#P83A*<I/2]+60fM$N3AE':1G^XB1GCO;1b:C90f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70qtDfRBQ9jqjHH#m\.DBNn=DfBW9@;J"J8T&WYDBNe-@;^-/A8,IhDf0).Bl5&8
BOr;\@;K@t+DbJ(B6@WqAKWBf@;'(j@3A9UCghU3.4cTMCi"6)Bl7Q+FDi:DBOr<-BPD?uDJ()1
AftM)F*(i2/g:`38T&W]Eas-4F"Bj[+>Yr51Ft@@1cI-??Q`?C@4Wu]0KCmJ2_-^B1H$dA/i5:6
0f1X<0fCpJ0fU^@2(gd@0f1jF/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCd@j<D?mQ,"ZZoATD:$F`S[BARTIt+<i"=ATW--ASrW4
BOr<&AS6'.+s:T;+A?3cBl5&7FEq\6/0JtEAn?"'Bl7Q+FDi:DBOr<-FCB2;F!,F?F(o`1Df-\3
DBO%7AKYK$DKBo2Ci!O%Bl@l3<H<.h+AH9ZDfRHS%15[IAStp-=$]b]/Mf@;=$]b]/Mf@;?Q_mN
E\(QK?S"2i1bgO:1c$aE2*!WR2(UI9/hf(:2)dNH1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4a>m/5pA'
G%GQ*@;[3,Ec5o8F(&lH+A$TbDIFZ%F!+m6Ch7$cBl7Q+@q]:k@:OCjEZf(6+EV:.+Du+@AS`Jh
DId=!+EV:.+@^B_AKXooDE8nK+B*B#Ed8dGAfu2/AKX9V@qfLlF<F(o@;]Uf@<?0oEcW@4Gp$%%
Dg#]0AKZ2;Blmp,+@^B[DBMkdCh:SZCM=n\Bl:o(B45g5+A$TbDIFZ%F!+m6GAh>,DBNk0+EV:.
+Cf>4Ec`oC$;#>XDId0,844RU0K:mK2_6[;3&<KN/70MiEcip?/70qe/i5L<1GUsC1G^dE3B/QA
1H-pF2D[6H1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70quEcioW7q#kFDImm#+E2@>E,Tf+Cc`b2FDl&-
@4WO8DBO%7AKX]mASu'%FDl&0F_**H@rHC.ATMg/DIdf2FDi:1Cht59BOQ!*BlbD+ART_'BkDL(
/g:`38U=fc/4`Y]2)R'G/2o==0JtE,[3.eSD_+1*0f1^E0Inn;0Jk=9/i,@91,:R:1,LmJ2DZm>
2_HdC1bpaD/1`?t[4FX_D_)>)8mu1<@;%2_;BRkO1,gaC3AWTN/C(pO;e'_s6")<!2DHs@/MT7@
3%Qm=2)$R:1bp[D3B/uY1b:453A*-H0K1[F/1`?t]e!)lD_)>)8ni?[F_NBt;BR_T1GC@92_m9K
/C)!Q7qHNg/M&J)1bLaJ/28k9/iPdF1H7<E1Gg^A3&EEJ2CpC1cG(o#ASit-$;4f>AmoLjBk1mo
@4XrI+?2&3/28n=0K(K-ZQMVHF=]^/0JYI@1Fk.80f1F;/i>O<1b^OA1,UdE1Ft=71,CdI0fCR6
/C(RQ6Y1?j%15a:CghI-Be2eC+?2/61c$[>2_m'B/70N#AS`o)/20(?2_lsA1GLd=3%csB/28t<
/i#FI1,q$?/Mo791,gsD0Jk=90JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<b6(u94`!d@;[3,Ec5o8F(&lH
+B3#c+EqaEA0=NRCghI-Bcq8(@;^-/@3B`)Ed8dKFE2;;B-;D3Bl\$(DJ()%DesQ5DBNk0+EqO;
A0>T(+EV:.+@Km]CisY=Cgh3oF^\oo+E(j794`!d@4hur94;[[Gq;KS+>G]11c73C2`WWJ3@nM[
6ZPLE?S#P82D-jG/2B%;/i>@A1GLR71,^aD1bq!H3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqE^D<L
@;oXmATME*E,ol9Df]?'4!71)D0:+HBlbD*+EqaEA0>T(+EV:.+@0^ZFWbL/DJ+*#B4W2rASuF.
Bl7Q+@3BW6E+O'-@<?X4@;I&tDKKT7Gp%'EF)to6F(oN)+EML9EbTW<@;I&tDImj$GqKO594;^N
/4`Y]2)?sE/2fLF1,gc0\fb$fEZcnb/1iD0/ho=:1,1R;1,:XG1H@!<0eb482`!BH1b:1/cFPQ-
BlYa6$;4fJ@;B:&844RT1H.*L3%R!H1Gpm<?Q_XRF"CZL0f:aE2_@!C0et:>/iPL91,C^=3AEEJ
1H-j:3%us?0JkXI1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoE-!QS:1\Vl>%M,Y@;]TuE,ol9Df]?'
4!71)Ea``l+DGm>FD,5.GAhM4+DG^9FD,5.9uMU$EbQY4@;]_#@:s-oAoD]4@3BN*@;^00ASu$i
D/!K&FDi9sATo8#ARTC`DIal3BOQ!*E,ol-F^o!(+CQC%EbT0"F<GLB@;]^h/0JP@ATMO1+D,Y:
BlksO%15a:F`SZkF`VYF@;KY!/4`Y]2E3WU/3,C=3&N84[3/C\E\'L-0fUpF1+b:=1,CI9/iPdA
1,h*D0JkOF3AW3<1Gg^?3&ENJ2CpC1cF#3%B6#O4$;4fMF!*efEb/ZqBlbgr;BRkX0f(@@0JkdJ
/C(jM;eL,%/M&V91,ps>1,UgE/2Ah;1+Y1>2D.!M1,_$M/1iV7/i5=<2_Zs;/1f)Y/5p2%/.DqZ
@<HW69k@jL@4XrI+>u2:3@m-M3AWB@cEn]mB6#OT/29+>0eb173AiKA1+kL@/2B.A/i#7C2)%!@
/M]==3&3HJ0Jk=3/C(UR;eL,%%15a:G%G><844RT2`3HL0e>=?3&riI?Q`9YE\(QK?S"/h0JY17
3&<0I1,(LA0J#%51,_!G1,CI:0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;e9u#,"Zf`DJ<Ns+E2@>E,Tf+
Cc`b4@<Q3q+DGm>Df0,/De:,6BOr<"ATD^#F!,C5+B)r^BPq6qAS<V;FD,5.AT2?n+E271D'3>,
D/aE7ARlomGp#ppEcYr'DBNn:ATT%aATD="GB7I@@V'Y*AS#a%3B&l>@;]Tu0eb=9+@ARM+A6-d
AS<3#F!+m6@VfI_CNF?,FD)e@BQ##7H#7#/Ch[s%F!,4?F*),+AM,/9$;4rEA1U8L+>GZ-2(UIB
3&EWHcG)+W7<3)n5qF]H0f:a=0K1dJ/2St91FtF?/iYRE3B9)N/N5:?2)7-M1+Xt-cG)+c7<3)n
%15aA@;TI^Ch[</85^Qf1Gq0D2E<cV1b?qa+@U<b/3tgA1bh!F/MT%:1+Y772)6^<0f1LA2`EQO
3%QX91G1IB0ebUG/1`?t].?usE\%Y,95/KVCiF&r/4`Y]3&*3D/28h83B/rKcESK\EHNfu/2Aq7
2)m*?2)-s>1G1[C/2K"?/ibdH3A``I2(gX@2`N]Q/1`?tYq/=`FY!t/95e<R@:CcY;BRhS2DZmC
1,^gF/C(OD<D@0Y/M&V52)$s>2`*3K/2Ah32_6^>1+kID2D[3L/2oC<0f:gG0Jk=3/C(OP<D@0Y
%15aHASGR(84cW#0etaI0e>%73ArTC?Q_dXBe3UB?S!oc/i#:81bgU@2`N]U2(U=71G1@@2E!9F
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe3)'ATDm2+Auo`@;[3,Ec5o8F(&lH+A6WaBji-.@<3Q5
BOr<1DfTA2AoD]4F*(i2+DG^9FD,5.Cgh3oF^\oo+E(j7FD,5.<+3\HDJpXhDIdHoASuF/F!+:j
DfBN(+E(j7FD,5.6Xb"L@U`nWDCuA*95eNd/6G\"1b;a)/Mo"c+A@&u/70r8/28h22DQg<0eb49
3&iWN3%QpH/i#=E0K;!B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,/4FW%Df08tDBNn=DfBW9@;J"J
95eNd+DGm>7<<QhDJ<Ns+D,P4+EV:.+EV=7AKZ21ASrW4BOr;bF`&=BBldj,+DG^9FD,5.D/XH4
Bl7Q+-tHb1DCI1I$;5;XDImd#DfTc;/4`Y]2DI$J/3#=C0fCT.Z62\LE\'Lb/29%=0JY.60eta?
1+kLF/2B%@/i>LC3B9&M1,1C<3&rlO0e=k,cE\ulATB=2$;5DJH7VTb+>c#:2Cpa@1Gq0DcE\Q[
Ecruc/1iD./iGR<0fV-F2*!QS0eb.11,CO=3ArfR3@mI<CghB-6Z6OPBe1g\Z7J@`Ft=(096G8g
@;%2_;BRqU0fLX<0K;'I2_<7g+@B^Z+=ofe/2At71H6mC1c%*B1bLOA/2K(9/ibaI2_m3@2Dd$E
1,h3P0e=k,cFthsAT010$;=kN;g!%jEaiH.85^Qe3&ENE2DR$C1FuZO6WS(U/M&J)2(g^@/29.>
/i#CA2DI'?1c6mB1b^[B2_6L2=Y)p@DCc5(9OVsMG@>,885^Qg1,L^:3&39M2D!.]+B)cg/1iD)
/2Ah53@lpC1+kF@0K;!N/1iY7/i#FC1,C[:/1f)S/5p%s/.Dq[ATDZs/4`'+/Pn#U1+Ys^<%Uou
1bpUh+@pcd/70r8/28n40f:L:1Gpd@1c.!I0e>480KD'I1,ga>0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
89nVp,"HZbASWE-Ec5o8F(&lH+A??eDIFZ3@<3Q5BOr<(@;TQuDe:,#+DbJ%AKY])+EV:.+D"u&
FCfK1+AcWcDfBW4DImm#/0K.MATD?)FD,5.9P&6^@:`kb+@pcgEa^LA@;[3%D/F33FCAu.D0^5:
Bk(Rf+Dtn2AM%S,@:Wq[+C\njF*&O@Bm+&u/g+,,AKZ&9@<*K,Bk;?.Bl5&8BOr;rDf0W<ASc0k
FD5Z2+E(j789n`d@4i`5$;>#P@<?0685^Qg2)%!@3&NTS2D!1.+B)cg/1iD)/2Ah:0J"t;1+kIF
0KD'P/1iY:/i#FE3&*3?/1f,$/5p%s/.Dq[BjtXoFCB5A85^Qh2*!NF3B&rS3%W@h+@1!`/3tgA
3AiWK.kiq<3%Qm=2_cj=3B/WK2DQs?3%R$A1c@'F2)?d=0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?cFthqEGR0M9PIsIEcb`2+DGm>
9OW$WDBNP0EZcPMCh[?iEccRN+tb!3BjtXoFEo!LAS,LoF!,RC+EMI2Bjkg#@;]TuE,TQ,FD55n
C`m>1AS#CjD0%6N@;]Tu@3BT%D/!luATAo8BOQ!*FD,6+AKYE%AKYr'DfBN(+Co&(Bm+&u+E(j7
Ch[?iEccRLBl5&8BOr<1DfTZ)+D#_-DBO%>A79a9+B3#c+Cf>-F*(u0CghF"Df-[`EHPu3@3BT%
E,oN2ASuU2+CT.1ART4fAKWQI@3BN-E-5u*EZfFKD.7F"+E(j7Ch[?iEccRZ+q4lQBk(g-:fC77
68:5Q2_-U</5T8C+@7e<2)d$?1+Y""<bZS*/M&J)/M&V:2(gR;1,gmA/28n42E3HK0fLX=0JPF-
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?
/M'q:E\'mu@q[!!F!+m6AnbasBl@ltC`mk<A7]1[+CfG'@<?X4AKYc+Dg-(AAoD]4@rH7,Ec5c1
Bl7Q+DffZ(EZfLBA7]1[+CfG'@<?X4ATJu<Bln#2D..'k@kJ2t9PJ'ZD.+td6m+3=3&30D/2fC@
3AN-m+B;-E/70r8/3#792(UL:1G1O>0JtgE/2]492_m?M1,ga>0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
<D?mQ,"uEeG%kB&+E2@>E,Tf+Cc`b5Bk;@&@3BDu@;^-/Ao(mmALns4DIal(F<G:=+EV:.+DtV)
AKYo'+CQC&BOPpi@ru:&+D,Y4D'3q6AKXZTFEVA,DBNn:ASiPgFCAX$Ea`U%+E_QE9PJ'ZD.,%@
%15dCCh[T+6>pmU@4XrI+?2,5/28q72DHa=3?UV.Be1he/M&_22)6^>0ePIF2_m6K/2B4<1,LpE
0f:LU@<?4$/1`S;/4";j/5BnhDerj'/PL)*BlbD-AKXZT@ps(fCh4`'DBLYm2)bsO9PJE_Ec5H'
/4`/O1,1OC2_cj<0ebRA1FulU6#gor?S#P82_I!B/2K(?/iP[D3&!'</MT1:1,^pH2)[!@0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL6#gor88iBY+A6WjB-;/6DfBW9@;J"J9PJE_+B!,fCER>4+CQC/Bl@l@
F(f!$ARlp&ART?sDg#]4Ci=6-Bl7Q+88iBY+A6WjB-:W#A0>T-+CQC&F_l/BEa`c,F*VV3DepP?
Bln#2A7]=k+ED%7E+NO$+D,Y4D'3q6AKYf-@ps0r@rH4$F`(o8GqKO59QaiZCh[crF`M/<@k:/=
+>br32)$R;0K:sE/70McF`K$?/70qe/iYjB3B&QF3A<9J1Ft=A/ibgF3ArWD1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/4"E!/0[c1G\(`$Dfp)5ATAo4Ec5o8F(&lH+B3#c+A?ofBl%L$@Wc^)F^lP+DfTr?
ATMo8G@>P8@WcC$F<G:8+?;>9+C]U=FD,5.AoDg0A7]d(De:+cFa.J7@W-C0B.P/mDfor>+B)uc
B4c0uARmD;%15dOF(oa6U2F[R/4`/O1c70K1+Y483A<<A?Q`']DCf-G?S"/h0eb.=2_Hm?1c[HP
/28h23AWHN3AE'?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9lFo#:iCArF_>i.F(HJ5Ec5o8F(&lH+A?p!
Blq7eDJ<N%BlbD=BOr;pDI[BlDKI"=@;TQuDe:,6BOr<1ATMs)Ec*"?AS5^qDBNk0+EV:.+A$$R
EbT#+:h=NYDKBr:@3Bc-ATD?)FD,5.9QbDjFCB'$@;[3,AT)O(AKYf'G%G2,@;]TuGA(Q.AKYi.
F*&OCAftr/A7]e!/S&:8+AcusFEM5)C`mG5+EM7=F^]B'A1e;u9jqIOH#5*';BRkT1,^[C2)[HN
/C(jM87cfm/M&J)1bLU>/2B+=/iG[G2DR0A1,^a>0ebLB2(U:0cFYVuATB=2$;Fr=Df0*(/4`/O
3AW?K1FtC=2)6m;?Q_XPF=^cM?S"/h1GC@72DHg<3&`QK2CpF91G1OD2_[!D/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"K\F=]dtCi=0"Bjkm%E,ol9Df]?'4!77+@rH6qD]ib8+EV:.+DlCGBPCsbC`mn8
Ci!NmAKYo'+EV:.+Du+@AS`JbDIjq]F`(`1ARlodARTV#+E(j7;f?JdFEM,*+=KTkASrW!_m+-$
+Co%+F)Pl+A79!t+EV:.+Cf4rF)u&*+Du+@AS`JuGp#Uc@WH0oC`l5VEb!"h@3A9QEcH55H7g=7
@:O4nA8`T)F!+m6AnbasBl@ltC`m\5@:NjkGA(Q.AKYhuB5(iu@;]TuEb/ZqBlnVC@<,p%D/"6+
A1e;u9jq[Q/4`/O1GUgB3%QgA0JG:6?Q_^ED(K$F?S")f1c$[A2_Hp@1GCL:/2fL@2D[?M0Jk=9
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL6Xag_7qH^X@;[3,Ec5o8F(&lH+AH9WD]ib8+CQBf@<?4%DII?(
:gnB[+DG^97<E3WDfBE!+Du+>ARloqDfQt7FE8R;Bl[WoAn?$9+B3#c+EMX5EZee,F)N17@;p0s
DK?qBD]iM#+DG^9FD,5.@rH7+FCf9)@<?4%DBNk0+@BRSASc:(@<,mmF!)lQBOr<!Bl[WoAn<DD
%15g<BOPsrD(J4U+>PW22(ULB1H7'>cF=u_F`K$!/2/q=3B&HE2_d*>1+kIB/3#XB3AW?E3AN-A
2_Hj?1,V$K/1`?t\1BpgE\%Y,9jq^V@<?37844RT2)7$K0e>:>2Dm3??Q`-`BImLA?S"/h1H6p@
2)?jA1GLaI1b:@9/ibjH2`*KF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5L4u/4"SnEaiHkC12!o+E2@>
E,Tf+Cc`b6@;'^jFD2jf@;]ggG%i'I0ebRIidd4I0f:s?+DGm>Df0,/De:,6BOr;qEbT0"FCfN8
+EM41DJ=!$+EMX5EcW@AAfsBcATD6gBkh'oBcqA5ATVs</g+)+AKZ2*F!,O4Bk/?.D]i_%G%De)
F)u80Bjl*pA0?)1FD)e+DffY8:MjN\+A6BVH$Nh8+CT.u+AQWs@;T^$@;]TuG@>P8G@bT,+D#)+
@psIjA0>;uA0>u&Ch7L+ARlolDIal/CghU#A0>c4D.Ra+F`S[BF`V8,@;I'#DKBo?F_t]-FE9&D
$;FrC@4XrI+>GT-3@lmD2)d<B1,'hM@<F+Q/2/k:2)m*A1bpg;1G1XG/2]=<1c70L3Ai?C1bLRB
2`ETK/1`>-0J$13FY!t/9jqjTDegn*5uUT31H@!f5uUT31H@!e2`!33<bZS*?S!og1-%-B0JbIC
/28k33&rNF0fL^@1,_'I0J"e3/i5CA2)$a91,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD'2`!3?<bZS*6#q*W
@;[3,Ec5o8F(&lH+AH9\D/X24BlbD*DBNY2A8,[fDJsZ=+DtV)AKYW"G%GP6FDi:1+C\nj@q[!!
DBM5cF^ec%GA2/4+CQC1@<-C,G9Cs8DIe#8F*)G6FCSu,FD,*)+DG_8ATDg6E--.DFD,5.Ch[`t
F*)><AKYE!A0>o2@r$?4FCfK5@:Njk@;Kk"B-;;0AKYK$@<6NC+A$Zr+EM4)Ci"$6+Cf5!@<*JX
@<-'k@V&tc+Eq79ATDi7D..3k+DGp?@3BN-E-5u*EZfF@DfTW)Ci!g'B-;87DfdT@$;FrLAnc$3
85^Qg0f1mA3&!<O1G$h`+AZri/3tgA2D[$I.ki\83@ls=3&3$?1cI$G1,q*J1Ft753B/fS3&iH?
/C(jY:N0tu%15g<Ebf)m/4`Y]3&`fO/28k83ArZEcESKgAS3PG/1iD./i5R>1Gh!B0f^pC1,CI9
2(gX<2)7'K/1`?tYq/^_B.OK!9jr'XAR[2];BRbS1GgX>2*!KJ/C(gL<b6(u/M&J)1+kCB/28t8
/i>CD1b^j>/N#C<0JP7>2E*0</C(gX<b6(u%15g<EcYr)/4`Y]2D?gE/2oRC1c$].\faOTE\'L-
0fC^F0e4t;0Jb7;/het11,La=0JPOH2)d'@2_Hd@2E<`N/1`?t\h$B`E\%Y,9jr-PE\'aZ+?28:
0J"q51,1XG/C(^I:h=8j6")<"1,Ld@.l/k61Ft:63AW3B1b^O@2)$mH3@ls?/i#1:1,Lg=/1f)U
/5Tnj/.Dq\@<u?jCgh$/83p3,:b=FW/4`'+/Pn#S0e?ZS<D?mQ?S#P80ek:>1+Y.=0eP4?1c[BI
/2T(60JYRI2Dcs?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<D?mQ,#)unB5_U#@;[3,Ec5o8F(&lH+AH9j
@:<t\Bcq,2+EV:.+AHclB5_U#@;[3*@;TQuAoD]4FD,5.ASu$eDJ*O$ARloRDdmE'@V&tg+EM[7
F)Y]#Bk;?.-rk;/F`S[6Eas30F!,+6@VKCkF(o\E+E(j7FD,5.7rMjN+@Kd^ATDl8Eb/ltDf-\9
AfsfdDJ*m(BjiP8@;]TuFD,5.DIIBn+E(j7FD,5.Anc:,F<F:rDJ*m(Bjkm%F('0%Ci!g-AM,/9
$;G)@F*2S5/4`Y]1,LpG/2K%:1c?o1[3.tND(I7i0K(aD3@cjB0K:U>/hf170eb:63B/fK1,^[=
2(gU>0ekFB/1`?t[4FgZD(H,'9k@sXAU5mu;BReS2D?[>3B&lR/C(UF<D?mQ/M&V30f:d<2)d3E
/2Jn71+Y.>1G1XE2Dm0E/2]@=0JbIB0f:L5/C(UR<D?mQ%15g@Ble?(/4`Y]0fV*P/2B+=0K1Q.
]-'miBcnrm/2/q;2)-U83Ai]G1G1ID/3#F<2`NWN3&W<J/ib^E0f:j?/1f)Y/5L;#/.Dq\ASYat
A77#[;BR_Q2)$R;1b^mK/C([H7qHNg6");u2_['C.l&e71b:I90JP+50K(O;1,gsC2(UL:/i>RA
1-%3C/1f)T/4X8g/.Dq\ASbpsBIl\P+>Yi03@m!B2)R9CcF"c^DIY4`@4X)l1b^d;0f_$G/2f+9
3@lm@0J5(71,UmF/29.;2)I-L0KC[8/C(XS6Z-Bb%15g@DJNZsBl7?s/4`Y]1,([I/2B1@2D?]-
Z62GUE\'Lb/2/q=3Ai<D1c73C0ePI?/3#XB3&iZJ2`WEG1bLdF2`*<H/1`?tZ7J:aE\%Y,9kA3X
@<*ni;BRtS0e>%90f([<cESKZATTIT/1iD./i>I:1c6mC2E<`V2(UR:0K;'O1H-j9/C(LO6Y1?j
%15g@DJNg$F=]s\+>ko63%QsI3AWHBcF=uaASs%N/28t82E*3D2DR$=1+k7=/2Aq7/iGXB2DI-A
/Mf:;1H%6R2)m-</C(aV6Y1-d%15g@DJNrq/4`Y]0etLD/29+B0f1H,^*$6`E\&dn0JbRH0Inq:
1cHsA/ibmB2*!9J1bgaC1Ft=>/iPdF0JbI8/1f)\/5Tnu/.Dq\ATD3p/4`Y]1bq'K/2]4D0eb0(
Z63.a@4Wu]/M&Y01GgX;2Dm*D2D?pA3@m$G/i,IB1bps?/1f)P/6,DQ/.Dq\ATDEl/4`Y]2)R0G
/2o=@3&`BE3$:P+D]gS_/1iD1/iP[>1,:U;1GUmJ3AE'A2D-^=2DQsE/1`>.3%RC7D_)>)9kA?Z
A8,Ii@4XrI+?)&51b:XD0ekL9cESKZE^;6./1iD0/ho(31,q3F1H%3H3&`B?1H-pH0JkUF1Ft(.
cESofE^;5c$;G)PDfB8=85^Qb0f:j?0fM!E3%Qg@+B2cl/4!\q0JbOD1Fk4:2)d'C/ho162)['E
3&*9J1+Y1:/ibaJ1Gh'B/1`P4/6$&#/.Dq\ATM:#FD,B*/4`Y]2)I3B3&i]L/C(RV+@1$^/3tg@
0f:aE.ks%=3%Qm=2`3-A3%d!H1,UsD/29.;1-%-M2)6^6/C(RV/4";j/.Dq\Bjkss@:O"^F`T*)
;BRbR3&N6D2)6sI/C(OD6Xb!d/M&J)0eP@C/28q?/i#FI3A<?B/N,UA2_d6H0K:U7/C(OP6Xb!d
%15gDD/XK(/4`Y]1cR?K/2f7?1GgZ.Z62MTFY#*q0etRE2_?mI1bgO9/i#:80f^s@3AW?E2DZm9
2*!9I3&iiT1b:1/cE\ugEcioB$;G5P@q]Rs/4`Y]1GggG/2T+=0JY3*K-3^1@4Wu]/M&_21c6g=
1-$sF3&rcM1Ft=71GggC1H$d8/C/r"89nVp%15gDDImWmF`q1E85^Qe3AE3=2D[$I0J(MV+BE2s
/1iD-1,UpI.kib71b:F81H@!@3AW9J0JGIE3@ls=1H@BN2_Zd6/C(UR<bZS*%15gDDKK<&@4XrI
+>Gi51+Y1<3AW??cEn]iEbR'j@4X)i1GUX90JG4@/2Ah52(U^C/het62E!KF/MJe43B8cR2(U:0
cEo,uEbR'6$;G5T@4XrI+>u26/28h<1,^]/^E>mTF=]^d/2/h63AW6@1,V'C2D-gF/2K+83&<HN
0fLX81+kRG2`<KH/1`?t^FV``F=[k.9keWV@q[Da;BRbO2_6gC1cHu2Z62GNA1T;`0JP7A2_-[A
1H-j?/hf480fL^A1G^^>1Ft=>/iGI=2)R<D/1f)P/4"/a/.Dq\Bl[X!/4`Y]3&<BB0f(RC3%W@a
+AcWi/3tg@1,UaE.lB1A1b:F82`E9E1+kID1bpaD/2]:;3&riQ3B&K?/C(^U:h=Yu%15gDEb8`q
/4`Y]0eb=@/29"A2DZo0YolkSE\&dn0JbI@1Fk:B2)6^;/iPdA2)-^;3&!9F3@m!I/iYaD0fM*D
/1f)O/5Tnu/.Dq\Bl\N.D(J4U+>P]41b:F:1GUd<cE\Q[D.+tI/2/t;1,gd>2`3NF0ePIG/3,R?
2E*HQ1H@!<0fL^F2)RBK3@l^4cE\ug9joR^$;G5U@;RPd;BRtV0e>%92E!NGcFP,pATB=f@4X)g
0KD!@1c.'E/2Jn;3@m!G/i,FC0Jka?1c-gE2)dBL0e=k,cFPQ'ATB=2$;G5\@<*ni;BRhN2)HjB
2)@0N/C([H<D?mQ6")<!1GUaH.lB.@2CpU91,CI:0JG+>3&*6F3@m$E/ib[E1H%!>/1f)T/6,DQ
/.Dq\Ders&G%G*"FY$Wj/MSeY:G":P?Q_^V67cIp?S!od/i#C;1,L[;2)I<L2D?[;3%cpD3Ai]L
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S"Qb67c#QD..<r@;[3,Ec5o8F(&lH+AHcjA8cX&@;^31BlbD=
BOr<"BkM*jF*&ODART?sBl5%kDf&p#Bji-&Afu2/AKXI\K4i,TEad%W+Dl%>DKK<$DBNt.DJ*N'
GA2/4+CT.1@;L%"FEM,*+E(j71,UmF+Dk\3Eb0;E%15gJDKL#=D_+sU;c#&)3@n5t;c#&)3@nM[
7<3)n?S#P80eb462CpaE/i,F?3A<6?/Mf(52D?gA1cHs@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7<3)n
,#D]c@;TFjBjkm%E,ol9Df]?'4!779DKL#=D]ib8+EV:.+EVX4A8-."Df0!"+Cf>2FEMG3+EV:.
+DkP)+EqC*EcW@;DBO%7AK]u_S4.6::j$YtDrQ;</0J@D:gn6MD..<r@;[2u@;]Rd+DG^9GA(]#
BHU_+D..<)@;]TuGAh>,DBNIuDI[6#FDi:DBOr<-Dfor.+E(j7A9)g0F"SXG$;GGZ@<Q'1=$]b]
/N,:6=$]b]/N,:6?Q`0VB.RC@?S!oe/ho=:1Gq'C2E!HN2DHa=0eP1<2*!HO/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S##bB.QtmEai`kDBNn=DfBW9@;J"J9lG&\G$uM-F!,R<AKYf-DJ*O%F<GU<G%G\:
F*VhKASiQ(DBMkhEai`k/e&.^DfTQ#BIl\?<%Uou1,CIP5u]F4/M]+5?Q_aJCb/pE?S!oe/i,76
1GC^>0etOE1cR$@2D-pH1,1^A/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"TVCb/CkCh7[0Bl7WnDBNn=
DfBW9@;J"J9lG&d@;$ctF!+n/+CT.tBk;1(+DtV)AKYT'EZfI;AKYi.F`);0Bl5&;Bln$&DBO%7
AKXcbA0=6RFEo!IAfs]WEclG3Ch7H9%15gJFD,*!Cgh!.85^Qf1c-aC2`WcIcESKkEbR'V/2/e9
1GLC83AWND1G1L>/2B1;1,gmD2)$R:3A*0J3&iZO/1`?tYq/jpBe0]#9lG/fDfoqK844RV0K:pJ
/2At;3AE'l+@U<b/70r8/2o1A0e>7=/i>RE1bpj</M].81H%3P1c$[<0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL7<3)n,!pEmCM@Zp+@]d\D]j">DfBW9@;J"J9lG/fDfoqK+CT)-D]iOuCi!Zn+BEDsFC?:e
DeX6'/0JYJ+EV:.+DbJ,B4Z.++ED1>ATAo-DBM8gEbfB,@3A$JF)N10DIal/CghU1+CT.1Bl.g-
Ecb`-F<GUBCh4`'DBO%7AKYf'G%G_;De:,6BOr<*AT)O(AKY])+EV:.+CT;%@<3Q*F<GO2F)to6
+EV:;Dfo]+/g:`39lOfaB5]>&5uUT32_cjb5uUT32_cjj+@B^^/70r8/28h22_Zd<3A*'F1G^mB
/2/\82)mQQ2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqATTJ&@;^C"DJ<Ns+E2@>E,Tf+Cc`b6E+s3&
D]ib8+CQC)@;Tq*F!,RFAS!!+BOQ!*B6%p7F!,17+EMIDFD,6+DBMneDL,`/Bji,mDIal/Ec5K2
@qB^(AR]RqGp%<LDe'u5F(Jl)AoD]4D09o6@ps0rBl8!6Ecl51DKKqB@;]Tu@s)g+Df[N?$;GYZ
BlI`sBl5Im;BR_Q2)d'B1b^aD/C(RE6VUu?/M&J)1bLL;/28h9/ib^J2)R3A/MT+82D[-E3&W<=
/C(RQ6VUu?%15gPE+j9+A1U8L+>ko12(UXE3ANNEcF4o_Df70m@4X,h2)I6B0fUpF/2Ah93%Qg=
3%d*J0ekR@/29+:1H@BQ0fLX7/C(^U6>pcn%15gPF(8op@4XrI+>Yf/1Ft@;2_['>cG(K%9joS=
/20%>0Jb4;0JkR:1G1I@/28n=/i>OF0et^>2D?aB0fUmH0J#M+D..'gF*&NZ2)-s>/C)!]<D?mQ
,!o^`ATAnA0fC^A.3KfYBl5&2@<6?<+C\c"@UX:kF!,=BF(8op@4i`J+>"^EFEDP;@Wcd(A0>u4
+<i!r@<,gcEbSs"F!;eP%15gPF(o,m/4`Y]3&!-B/28h72)7*A0fU:DAS`nL/2An:3&E-?0JtO8
2(g^F/2K";/iGCC0Jtg@0eb4>1H@3M2CpU;0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*\3%RI/Cb/7gFD5V8AoD]4-Z+!IBk&M5.!0-6
+CT.tBk;1(+@gH`ASWE*F`V8,Bjkm%6#p[XDC9KJCh[Km+Eq78+ELt7ARlolF<GX9@3B$)+CoD,
E+is'F!)lAASc=!Bl8'7.3N&2FCfJ8@<?U3@:OCnDJ()6BOtmu+CTA6ASuU(Df-\,Gp%'B@<lR)
B-:l%F!,74FD,*'@4;Wm9m(MrASc$kBl,Cl5u]F4/M]=;83p3,:b=F_/70MrATB>//2/h61,UR>
0f1g?0ek:?3@lsB/ho.:0fC^:2)-^B2`N`S2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)ATB=G6t'tI
F(c\8Ec5o8F(&lH+AI!"E+Nj!ASH!(BlbD=BOr;]DfTo1+DlCGBQ%^*B5(jaC`mb0@;Kd'De:,(
Bl[c;+B3#c+D,>.F*&O;De*o3F`V,)+EV:.+EML1Ebf_=De:+dF`VM5ChRBoD'3q=+D,P4D'3q6
AKZ&:DCcoIDf9ME+E2.*DImp2/0JA=A0>r8@<-EA+q4lR_kD*hBQYk-5uUT32Cqoq;c#&(/70Mc
EH30Q?S#P80et@92CpX@3%cpC2_m0J/1iV4/iGXE3ArcH1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"8r
/0[K#D/!m%@ps6t;Isfi@Vfag+E2@>E,Tf+Cc`b6_kD*hBQYG>BOr<!De'u/AftW)Dfo]+F<G:=
+EV:.+E2@>FCes(DfQt=Afu2/AKXooDBNA*A0>T-+D#G'Eaa-&A0><&+CQC+BkM*jEZf=>F(o`1
Df-\9DBO%7AKZ&9@;K@bD/"*'+EV:*DBM8aBl7@)AS`K'DBO%7AKXEX+Ad2lDKKG4@psOl/0K.M
ATD?)FD,5.;fut#D..3kF!,1=F!,[8Gp$X9GA\O7G%G]>+>PYo6tKk>D.7's/g:`39uFDW@q[Da
6m+3?0JbI>/2o=?1H@!n+BE2s/70q_1c.-K/MJk52_6p@0Jk=91,1C@3&WQN0e=n1/i#C@1cI6B
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/66J*/5pb,F)rICEc5o8F(&lH+AKb^DI[?&BlbD8DIjr/Afu2/
AKYr4Df'3+ASuT4E+NHnF!,C5+EV:.+@9X[DImm#+@0g_F!,17+B*JuFF%M=Cgh3l/e&._@;'O0
85^Qd2DR3B1c.3L2D!.f+@C$V/3tg@3A<HM.l&k61FtC92_Zd;1H-pB1H@BL1+Y19/hf+>1c.*A
/1f)\/44;b/.Dq]@;KLcBe3=O;c#&(1+ZKm;c#&(1+ZcT6uR)s?S#P80eb471+YCD/ho.B3B&cG
/N,C;3B/uT1bgO:0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6uR)s,#`E&FD)d_Ao_Tq@;[3,Ec5o8F(&lH
+AQ?]ARoKtD.R-nF!,OG@<*K)DBO%7AKXo_F)Q/6D_*#0AQ3_p@;]Kr@;]Tu;e8d:A8*0&@;]_#
@:s.m+CT.u+DGm>FEqh>@ps1iGp$a6G%GP6@<3Q"+DtV)AKZ)5+D5D/Ci^_5DBO%7AKYZ)E+L/6
BOQ!*FD,62+EqO9C`m2-Bl7Q+Ch[NqF=\PLDg<I6DIal/ART([+EVNEFD,6"EZek1D/FE5Bln'#
F"SXG$;P#JF"Bj[+>Y`12(UOD1bq'BcF+ilF`8l`/1iD./i#.40etF83&rlN1GLF41b^O90JbF?
3%QU3cF,9#F`8l@$;P#NBPDKq/4`Y]3&3EP/28h:3B/lIcEeW\@;mb`/1iD//iG^@1GUg?0JYCB
1Gp^80fCXB2DR'B3%QU3cEf&h@;mb,$;P#O@<6*j/4`/O3&NKP0J#%?1,Cd=?Q`B\C`k99/20(A
0JG(83A`ZG3%d'F/28t?/i>@;1b^a;/MoI?2`WQI2E!*A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<b6(u
>%)8WBjkm%E,ol9Df]?'4!7:,FCB6(@3BDu@;^-/FD,*#CERn@FWbC9+DkP)Gp$p3DJ+*#B4Z-,
De:+q@;TIf@4hur:1\3V@<*ni;BRhT0JY1<1Gq$I/C(OD6>pcn/M&J)1G1LE/2At</i5OG2)-d9
1b^O<3A<<K2_6L2cE\ufDf709$;P/L@Wc`C85^Qe2DcsD2D@'@2)-4>DIb:M/1iD//i>X?1,LU?
3B/`N1b:IC/iGIE1,1U:F`(u4Dg-(M/2].56#L3a6>pCG+=Js(0JP!c$;P/MEHPhD844RY1c$s>
2)$mE/70MrBOr`%/70qe/iPO:0fCX=2E*BO1Ft+63A*-J3&33J/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
?S##eALp8[F^\g!EbSs"+E2@>E,Tf+Cc`b7ASuL1AKYi$@;^-/FD,5.;fut#Bl5&8BOr<&@;]_#
@:s-oF)Z&5ASrW"Gp%3BAKXQ^A8,[fDJsZ=+BMuiEa`j"+EVX<@V'U'De:,6BOr;PD..a/DBNt2
B5):%F!,C5+@Td_@:X:s%15jAEcu/*/4`/O1c[HQ1b:F<3AEEC?Q_XWE\'L-0K(dC2(LL;2)6^B
/ho%20eb@83&`cN2)-X=0J5=C2`ETQ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"KcE\&D$ASc!n@;[3,
Ec5o8F(&lH+AQKgG%kA9+CSehE-,Z%+D,Y4D'2SbEcu/2/0K.FF!+m6E,ol6Bl7L"F<En]ChIHj
DBM;XCijB$+EVX<@V%/9%15jEBOP^.85^Qb3&3KF1,UsD2D!.Z+A??c/3tg@2)7-H/M]":2CpU9
3&)sD1+k7=0f(XE/1iV2/iPXJ1c-p</1f)P/50Vo/.Dq]Bkq.$BmD7#6m+3?2Dd-J/2oCG2DHai
+@:!b/70r8/2o1@3%Qg?3A*6L2)dEI/2T(62`!6F0K(I;0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6>pcn
6Xak@A8,Ii+E2@>E,Tf+Cc`b7Bkq.$BmCh8F!,R<AKZ28Eb$;)DfQt;DffZ(EZf(6+EV:.+A$H]
BkM!pDfp+D6ZQaL+DbJ(B6@WqAKYo'+@BRT@:We!%15jKF('<%/4`/O1cR6K2(UO<3&riI?Q`0f
E%G?I?S"/h0JtC90JG+50K1^H2CpF:3%d'F0f_*L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##rE%E2!
EbAs$FD5W,@;[3,Ec5o8F(&lH+AQir@<c3'D.R-nF!,OCEbTE(+DG^9FD,5.9lG#iBlkJ6@;]_#
@:s.(+B3#c+EqaEA0>B#D.Rc2Ao_g,+CQC&Df&rtDIIX$Df-\9Aftu0F(&a)ARd86GA(]#BHV/'
@;^-/Eb0-"G:XkFDIam-Z!h'c@4WOFBPCsi+Dk[uDK?qGARTU3+q4lSF`(u//4`Y]2_d'B/3,IF
2)Qr2K-4**E\'Lb/29+A2)?g>2DI0B1+k7</2B1@/iYRD1H$p</M]4:1-%6O1,LO5/C/r";eL,%
%15jQF(&imDCe=V+>l)72_6mF2E<WGcE\Q[E^D<C/29";2`N<C3A<?B1G1RD/2B"9/ibdJ1,1L7
1-$sA0JtaK3@l^4cE\ugE^D;d$;P_bBOPO^CFi"E+>Gf02)[!?1GLmF/70Me@<3u,/70qf/ho:9
1bp[?1GpsH0e>7</iPXD1,CX91,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ie/0[AsATDKp@;[3,Ec5o8
F(&lH+AR'#BOPO^CER>4+CQC5AS5^qDII?(EbT].EZf72@<*JYBl%L$B4t^j/0I5p@<63m/0K.M
Bk(g!BlbD/@;Tq*F!,(5EZf(<F!,[@Ch+Z0@;Ke!DBO%7@<<W5F`VY5Bl5&0De!3l+A$H]BkM!p
Dfp+D@rH4$F`(o8Bk;?<+q4lSH!tQ(ASs&#5uUT30f:L5?Q_^IDCf-G0f([E2_?g@0eb.50J5@?
/2An=/ib[G3ArfI/Mf.70f:sL0f:L;0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1-d8To#mGp#Im@<6N5
E,ol9Df]?'4!7:D@;T^iDBNt2An?"(+EVNEFD,5.F*2GBASl!$@rc-hFDl1BA7]IsGp%$;+@0dO
DBNeAFD,T/DeF>J%15kJTlY<i/4`/O2E3]V3%Qm?2E3WH?Q`?C@4Yb:?S"/h1,(761,LU@3ANBM
2Cpa@/i5I?2_m*=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/5C,(G@bE$@;[3,Ec5o8F(&lH+Dk[u
DK?pJF*(i2-Qm,@+EV:.+B-1OD.t,/@;]_#@:s.(%15mDD.+td6m+3@3A<3H/3#=C1H6p;+@p'a
/1iD)/3#7:2CpU?2_I!D1GgdG/2K7<1Gh$H0ek470JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?/M'G(E\&D1B5M'"G@>P8@3B)lBlnVC
De:,'Ci=<9ASu!h/0K.WBln',B.P06DIal&Eb/[$+E2">F(o,mC`me@Eb0-$FD)e2DBO%7AKX?O
CijB$+DlCGBQ%^*B5(pu+E(j78TJBY@;]Tu@;]Tu;e'`fCgh3l/0JA=A0>_tGp$R-+ED%0@<?'k
+EVNEFD,5.7q$4MD_4k*D..<)A7]IsGp":T:M4NYDf[*H/g:`3:MXBJ/4`Y]2_m0H/3,LF1cHu2
[NIkUCb.k'0f^pF1b1::2)6^</ibpC1,q0E1GppF1G^R:1G1XF1Gh$L/1`?t[Oa^aCb-#&:gn'R
@<H6lCh5.g;BRkP2Dm$F0etXF/C/tl;e'_s5qF`K1Gq0E1,q!E/2Ah;1+Y1;3%d3M0K(^G/1iV:
/i#.>0JPL;87?^NBk\r/@;[VIc\*iJ@rEnB6$4bm@:a7d/0IL&NGHM6/`M;JF_kJ/@;]Tu:gn'R
@<H6lCh4_tEb-A(De!p,ASuU$A0><%+EV:;AS!!*FCB32+DG^9@3BB#DIk@AEcl8;Bl7Q+Ao_g,
+Du+<FD)e=D]j+>F`_:L+B3Q'+E(j7FD,5.D/XK;+ED%0BjkIeAKZ&4F`Lu'F5h_79jr'f+Ad2r
FlIq=Bcpi%A0=cm@X0(gDeO$0Df4QbP[\QQBHV#"ASuU(ApGLi`JnZPX"E=]R!!4R+CT=66#LdQ
Eb0;7.*f(?;e'_p/0K.MBk(g!D..3kF!*bk/SJR(Ch4_TCi3s4@<<V?c\!?=@rEe=@;]Tu:gn'R
@<H6lCh4a8KHO3'D_<4C$;b/OF_tr+D_+sU;c#&%1+Xt`+Ad,h/70r8/28k32)Hj?/ibgE2E<cK
0eP480JkU@/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##p@k8g&Bl7QlE,Tc.@;[3,Ec5o8F(&lH+AcKe
F_tr+D]ib8+CQBd@<?4$+EV18D'3G/EZf14FED>1+Dbb1DCcoOH#7#/Ch[s)DJ((jBl7QlE,Tc.
-Z^DOFE2M:B5D-%AoD]4Bl7HmE+NotASu!h/g:`3:h='FDe!Q685^Qh2`WQC0eb:?2)-Z-YolkO
Ft>pf/2An72)[$D2Dd6A0ePIC/2Jt</i5:;3A<9@/N#F=2`!<F3A<!QDJ*d"F(d*UcESos@<O1n
DK]T/FCeu*AoD]4<+ohc6"t?^6#:CHDII#tDe:,6BOr;W9d!2>F`_>-@;I&PCi*Tu@:LEUAnGae
AISuCATVs$/6>,9:b=X\/1b-N6#g]l?S!rd0et[>0JY=B/28k33&iHF0Jb=92E*EN1+Y"4/ho1>
1,:O71,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"8l/4si$A79@i@;[3,Ec5o8F(&lH+AcWkEa^))F!+m6
BPDO0DfTQ%@;I&pDIakuEarckAT)C'B5(jaC`m5%FEo!CDBO"=F`_;.Ec*!lDfTAsDBNA*A0>;'
<DGt]6Veh+DfTZ)+@p'aBlmcrAKZ&.FCd'6$;bDE@rs7m;BR\S2)[!@2E!?J/C(LC6Z6cl/M&S5
1H@?F1GgdB/2Ah92(U^D/ibXA1,Um>/Mf490K1gC0eb.0/C(LO6Z6cl%15pFARf7Z/4`Y]1c7-I
/2]C@0JP-(ZQN7B@4X]Q/28k:1H6mB1Ggj<1+kC</29(C/i5FE2E*WI2)?jC3A`ZP3%QU3cEf'%
9joR^$;bDIEbf)o/4`Y]2)d<K/2oF?3B&M7ZQN7BBe1he/M&\10JG%51GCF93&33G0J#.;/iYXD
0JPL;/1f)Q/6,DY/.Dq_BQ%I"Bk(jc/4`/O0f_!E2DZmE3B&ZI/64Ja0Jah;EGR15/2An61b^L8
0JtU:2_I$L/2Jt9/i5RK1Gq'A/MJe:2E!NS0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/64Ja0Jb7GEGR1"
AR](cATME*E,ol9Df]?'4!7@5De3g#@qf?oG@>P8@;[2rDI[BlDKI"CBOP^cF)u80Eaa'(@j#8q
G%kc,F('0)Df-\9Afu2/AKX]YA8--sEcPT+ARTI!FD,*)+E):7B5)6lFCeu*Ao_g,+EV:.+CT;%
@3BK#+Dl%-ATDZ?A79a+9P%[ADJsDF%15pG@<H[1F"Bj[+>Yc23%Qm?3&iWDcFY2dDIY4L/1iD1
/ib[<0etU=0f(UG0JP+61bLI;1,CX>/1`?t].?<e@k8&r:hafWDg>bB844RT2Dd<G1b:UG1bgg<
?Q`9[E\(QK?S"2i2E!*A2_ZjC2`NcV3%QX:3%d'H0K(dG/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,g
E\'RkBl%?hDBNn=DfBW9@;J"J:hafWDg>b6BlbD*+D,2%@;KKtG@>T)EZfFBBl[p0+D,Y4D'3n<
F`_;.Ec*!eBPD9o@;[3)H$!_<Ci<s3+EqL;+DGm>F(&cn+EVNE@WH1#B-:`*Dg-)1A0>r%Bl%^.
F!,RC+EV:.+@BRRAT_KrAKZ&4+EV:*F<G[=AU,D.@;[3(Bm+&1Bl5&8BOr;pAoqU)Ch[Km/e&.a
BlId,Bl.9085^Qg1,Ug<3&3?J2([%c1*BM*D_+1*0fCmE1G(CB0JP+7/i>O<1,Uj?0K:jK1H@!<
1H7!@0fLsG2(V^8BPDR&@;[VIcFbn`;e'_s,"ZYp<+0HSFD39K@3BZ4@:X(oBl@ltC`me@DfU+G
BlbD=Derr,De:,#+C]A0FD,6++CT.u+EM7<FCfJD+DtV)ARlo[BlId,Bcpi%A0=c]BQ[`7+EqL;
+D,G$AKZ).ASH0-E+*cuDKKqBBl8$2+EV:.+EM=D+CT.u+C\nlDf'&.F*(i2F"SS7BOtmu+E1b0
ASuU2+CehrC`mh5ASiPdBlId,Bcq8$+EqL5Ch4`!BOPsrDJ()6BOu$'Bl8$2+EV:.+EM=D3Zr9J
+<i"RBln#>+CT.u+sJ.DF!,UHARlolAoqU)+DtV)ATJu9D]in.@;[23,%Yj=@;IP?+s9Hp+E)./
+CSbiDfor>/0K%JAKYJrBl%=#ASrW"ARfXqAKXob@<HBp+CT.u+A??f@<?0*Bl5&8BOr<.BlG25
Afu2/AKZ)'Bl"o1Aft#^DfTf2D_*#>DIal(DBNA*DffZ(EZfI;AU,D-ARfXqAKX]i_Qk:mDIaka
Fi([3;e'`dE+s#=>@VAh@<?4%DBNh.ARo@_>p(OeDBN@1F(oK*Cgh?,G%G]8Bl@l3De:,6BOr<-
FDl2F+EVO<A0>T(+EV:.+@C'cCEQ2iCgh3lF"AGUBOuH3@V'%fD.OhcD.R?g_RUdtDIakcD.R?g
_Qk:_@rHC,Bk]"K+q4lUBlJ!,FE/p3E^`nY1Ft(X0f1[C+@p'a/70r8/28n41H-j?2E3<C1-%*H
1b:FA/i>ID0fM$B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD'0f1[C/4a>m/0[c%ARfCqASuR2ASH$)E,ol9
Df]?'4!7+4+EV:.+Dbt+@;I&sBjkgh@rri3Aft&nBk;?sDIR0tB.P0%BlJ!,FE/L<F!+m6@WH0q
BQPA*DIal5BldutCh4_uF`__:Eb9-5/0JA;Cis9&DJ()6D]j.8AKYr4DfB9.FD5<-+E(j7@3BW5
@<*tE%15pJASH(#ALpAM+>GT10J"q;3&NEA1,pCU@<F+e@4X)g1c[<A1,L[E/2]%62(UUD/i#FF
2`!EE1,LU<1H%0H0J"b+1,pga@<F+1$;bYPEaa-"/4`/O1,:R>3&`BC0fC^F1b;uV<-;\%?S#P8
2_I'F/2K.=/iYXD2`*9@/N#L?1,(^I1GLF90JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<-;\%6Z6mY+A$Wj
@;]Us+E2@>E,Tf+Cc`b9De3rtG$uM-F!,R<AKZ28Eb$;,DBO%7AKX?YDegIeF)59&A9/kf@;g1#
+DbJ(B6@WqAKYT'EZed5Cgh?sAKYi8F*),+@;I&qCgggh+E1n#Eblk:Afu5<FCfJ8@V&tjFEo!;
DIal/ATDBo@ruF'DCuA*:iC/YEbTSG85^Qe1,LO:0fM!L/C(LC<D@0Y6");u1,CXE.l]OD2CpR8
3B&KF2_I*J1c70G/3#XB1,^sD0KC[8/C(LO<D@0Y%15pMCgh?uF!*bkF*)G2Ch[rA85^Qh1,:g?
0ebF?3&3&2K-3s"F=]!p/M&b31c6g?0fL^>3AiNL1b:4<3%d3K2DdES/1`?uK.Kf.F=[k.:iC/a
F"Bj[+>u261+YCF1Ggg;cFb8uB6#Oh@4X,m0f(d@1,1I>/2Jn<1b:C@1G1L@0K;!F/1iV3/hf.B
3&<<@/1f)Z/5p2%/.Dq_Des64GUuB`+>Pr;0J#"=3&3BCcE\Q_ASitM/20">2)?a<3&!*=0eP1=
/28k;/i,7B3AicI1,pm?1,^jI3@l^4cE\ukASit-$;bY]EbTB!/4`Y]1cR6J/2f4C1bgQ,ZQN:_
E\'L-0etR?2_?^<1,ga>/iPU<0f^p?1bgjB3&)s90eP:>3AWTM/1`?tZRf-kE\%Y,:i]uU@qfn)
@4XrI+>bi12_6gB1,:j@1c?IM9kc.1/1iD//iPdA0fCg?1GUmL1H-j@1bLO<1cREL/1`>/2CqNr
Be0]#:i^8e@3A*d@:XLt/4`Y]0f(XE/2An70JtE,ZQN4UFY#g00JkLE3%H^@1H6pA/iGR<2Dd$H
1cR9J3@lmB/iGID2Dd3@/1f)Q/6$&#/.Dq_Ec5H5Df.*s;BR_T1c$[=2_m<P/C(LC6VV8G5qF]K
1H@6A0JtRA/2/\50J"q51bLaC2)I<L/2]%81,M!O1Ft(.cESof9kc-f$;bb]E-64Q85^Qc1,1[<
1-%6M2([%^+@g![/3tg@2DI$K.l&k90J#"41GLF@1G1U@3A`EI/2At52)$pI3A`9</C(^U7qHNg
%15pPDg5u5@3@pKDKK<0EbR'p8g#uK0e>ge+>l#2/C(LC6Y1-d6S'rK1H@?F2D@!B/28k30JP+6
0fL^A1,q9O1Ft+91+kID3A`]P/1`?tYq/7RDCc5(;IOGo85^Qb0K:m?0fCmF2_<7^+@U<b/1iD,
1G^dH/MK1?2_6a;2`!!B1G1F=1,_*N/1ik71c76J2*!3C0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?cF#2lEbR'K;IOGcBlbD=BOr;]
DfTo1+D5V'A7]h'+E(j7FD,5.F(Jc2+EqL;+EMX=EcW@GE$079AKZ2*G%G_;@;]Tu@ps=uF`M&7
+ELt*Ci=?8+EqOABHUu"EZf72F=naH$;t;M@4XrI+>GT,2CpRA1H.9EcEn]_EbR'V/1iD//i>F9
2)R!G0etFB2CpF?/iP[E1H@3A/1f)R/4FSn/.Dqa@;oe"D_+FI+>G`03AiKA3&<EK2_8;Y;e'_s
?S#P82_HmH/2B(@/ho+@2DR9D/Mo791GCgJ2_Zd<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;e'_s9jqjH
B45k,+E2@>E,Tf+Cc`b;@;oe"D]ib8+CQC*Bjkn$+CfG'@<?X4AKYT*Df$Uk@;K@b@<6]:FCAus
F"Rn/;IOWTCghB985^Qd3A<<A1cR<L2([%c+A??b/1iD)/2Jn<3%Qd@3%cpG0KCgC/2B+90JGCF
2)?d7/C(mZ9P&,n%16!AF(&ltATVU"/4`Y]2Dd*G/3#IB1c6i0Yq[@lATB=f@4X,l0f1d=0f1XA
/2Jn72_6^A3%d*I0f^sB/28t61H@-F1G^R5/C(LT/4a>m/.Dqa@<5jnBOPOrALpAM+>u)72CpgG
0JbI8cESKfE+gdg/29(>1c['@1,Ca<1+k7?/2B+>/iPRB2DR3B0et@=2D?g@2(U:0cESorE+gd3
$;t;RFCAWeDCe=V+>u)52CpgF2E*<@cE\Q\Ea^Lb/29(>0Jk:;1,1a>1+kLG/2B+=/iGCC0fLp?
2)6d?0JP@C3@l^4cE\uhEa^L.$;tGJF_l2A/4`Y]1H@EM/2T@F2E<>6Yol_OD_+1*0eb:@1b1:8
2)m-A/i,C:0f:^=0KCmK2DQg<0ePIE2_m'I/1`?tYq/R[D_)>);It#[FD39s;BRbR0e>1@1H-l1
[NJCf@k9ns0JP:<2_-R@1Gp^@/i#.40fUdB1GUpJ1b:R<2)dBK2)Hj8/C([T:ig+t%16!IB4Ym1
85^Qb2_d*>1,LgD2D!.Z+A[#l/3tg@2)-pF/MK.=1+Y+30fU^C3%d*F1c.*L/1ih61,(F@1H6p:
/C(OP:NC/#%16!IB5)0)94`!_@<HU5F"Bj[+>ku53@m*D2E3KDcESKZASs%b/28t;3ArHI0JtO8
/MJe20e>(73A*<G1,(UE/1ib6/iYXC3B&fH/1f)O/43ud/.DqaDf]?'BjkO`@psG#Ec3L"6m+3@
3AE?H/3#@<1,:Cf+AZri/70r8/2o1@3@lpB3%cs@1,gpC/2Ah33&ETM3%Qg=0f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r(E+gdH;fH/_Bldr1E,ol9Df]?'4!7F>F(&m!@3B)l+@BRYFE2:BG@>P8@3BW*B5VEq
Bk(RhF<G10B6A6++E(j77q$4J@qf@h+CfP1FEMV8+CT.u+E2@>D/!m!DKI""E+*WuF(c\?EbTW,
E\&>WBQ%s'+E2%5DImC$Bl7Q+GAhM;+E(k6ASrW2AS,LoASu!hA0>u-AKYl)B4uB0@;]Tu@qBIf
F*),)C`mY*C1UmsF"SXG$;tea@;]Y"/4`Y]2`NcP/28h52`<ZIcE\Q\AS`n`/2An82`3*?1c%$@
1G1RB/2Jt?/i,IG1,Cd=0f1L?3AiNG2(WcZG%G]8ARloW@<?4$/29+=1a#V'Ch7X(D]hu#@<*JX
@<>poDeF3(/C(OP6tL0c,!6uKAStpuDfQt@AThX*F(Jl)-r+Jd@rH1%+@BRI@qf@nDfTD34s3U7
@rH0lF`S[+AStpuDfRBOEb0<2Df0W1@VfTuAoD]40fUmE+EMX5EZek#FCB!(B6@c7+q4lWF^o)o
@;%2_;BReM1FtFB3&W>5Zlh_EF"BUc/2/e62)m*E0JPC81+kIC/2Aq41c7'L2DcsC0J5+:2)7-J
/1`?tZn+RQF"@b-;KZba@<=%k;BRnS1cR$H2)@'J/C(LC;eL,%/M&J)1G1[G/2B4>/ibjF2)d3?
/Mo.62DI'L1b^I3/C(LO;eL,%%16$B@VKU/85^Qg1H.9E3&E<D1+^_[+AZri/3tgA2_d!C/MT+>
1b:C71c$[<2)d-F3A`TK3@la:2(ggC1c[6K/1`?t[k(<oBIjT";dj0P@<?'uBe2eQ+>Gc/1+Y1:
1c7'?cF+i]F`K$!/2/q81,UR=0ebI91G1RG/2oF=2DI3L1GLF;0eP.=2)mBP/50JoBl5IQcF,8i
F`K#B$<(AD@:Nt[BjiP`;BRqV0fU^=0ebCD2([%Z+@1!f/4!\q1,:U>2_?^<1,CI;/iYa?1G^m@
1bgg@2Dcs:0eP7A2`!6H/1`?tZReC^E\%Y,;dj3FCgpgnBe2eQ+?28=1b:@91,h$L/C(mN:h=8j
/M&J)1G1O>/2K+</i>=:3&!?D1,LUA0JPFD2_6L2cFb])AS3P'$<(AD@;KdlCh[Z985^Qi1bgg<
0ebUA2`*)2Yol>PE\'L-1,:O@3%Zg<0f^d?/ibd?1G^a<1c.'M3&<*;0J5.93B/iU/1`?tYq/1\
E\%Y,;dj3FCia`AA1U8L+?2,41+Y.62DR3N/C(OD6#gor5qFcG1GLd>0JtXC/2Ah<0J#"81+kOG
3B&ZM/1i_32)d6E2`<3</C(OP6#gor%16$BA9'4l;BRnW3ArEC0JG=@1G$hX+@CEe/3tgB0JYC=
.l8q72(UL81,CI;0JtI?2)d3L0e>.8/i#:B2E*WI/1f)Q/44\q/.Dqb@:s"hD..O"@4Xr;+>GQ(
2`EZH2)[<N1+ZcT9P&,n?S#P83%d$C/29(>/ibgH2E*WI/Mo(=2)R9P2(UL:0f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r%AT'+pAT2'oATME*E,ol9Df]?'4!7I1B45gt@<?0k+DGm>FD,5.:1\BQChY#0@;TQu
AoD]4FD,5.BPD*mATMr9E+NHn+DG^9FD,5.GAhM<A0<:/CiaM;CMn'7DBNA/+AHcsDKI!iG%G]*
F*&iR@;]TuF*VV3DepP7Aftu"FD5Z2@;I'*EbT&q+E(j7:1\BQCb?/(;djBZBIl\P+>PW)1b:C@
1H%-BcFP,oEbR'V/1iD./hf483&WBL1H@0F0J"e9/iGUJ2D@!>/1f)X/5L;#/0\&6@:X(oBl@lt
C`mV(D.Oi%Ec5e;6#pCCBk'1HfX'=kfmt9uVqHaUXOsK(VqA6sF('?++CT(<C11R\`.;q[+Dbb6
ATD3qCj@-NF(&cp+=JUYGAhM4-Rg0VAfu2/AKYW"@;^07/g:`3;djKZ/4`Y]3&ilO/28k:1,Ua:
c\*E;AS3PG/1iD0/i>U>1Gpj=0f:sI1bgO:1G1UC0JbLC/1`?uKIfr2B.OK!;djQbF`(V=83p3,
:b=I[/4`'+/Pn#T1b;uV;eKYm?S!rd0et[<0fUjF/28h21GLF:0Jb=93AiTN0e>%=/ho%:3&<?A
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/5p1m/59PhFCfN)+E2@>E,Tf+Cc`b<@;^./DIFZ%F!,R<AKYl!
D.Oi.Afu2/AKYi8FD,T/DeEco@;I'!Bjkn$+D,Y4D'3q@@:X(oBl@ltC`lG\Cij60AKYT'Chk/8
@;KLr+EV:*F<G(%EcPl*A0>u-AKZ&9Df0--+E(j7FD,5.7rN]l+Dk\&@;KY"BPCs!FCf<.Ch7Z1
Df-\2ATAo,ART+%%16$BEbAg%/4`Y]2Dm?J/3#OC1,pi1\0+^[D_+1*0fLmI1G(F>0JG%4/iYa?
1,^sA1GUsL0ek421bp[D3B&oQ1b:1/cF>E(@rEn-$<(ARBl5Im;BRkS0eb.<1c%'N/C(UF87cfm
6")<!2_d0D.l&q=0J#"40et:82)m3I2)dNR1Ft:</iYXI1,(O96$-pOF!*hgASc'3/C(UR87cfm
%16$DAT2a3F_r[#;BR\N3&)s>0f:sJ/2]4+7<3)n5qF]H1H7-A0f1UE/2St51+Y=D/i>IC0ebF8
/MT(71GCX>0fLXW@<?4$/1`Y7/4FSn/7rp@D'3q6AKYo#F)Pl+FCcS)Df0W<ASc0kFD5Z2+E(j7
;e'BXFE2M@+@:*WDId<r@Wc^(Bk):&%16$DBOtUo/4`Y]3&`cR/28k83&iWDcE\QhAS3PG/2B"8
1H6m?3&!3@1+kC?/2K+?/ibaE2)d9A1,pm?3&3EP2(U:0cE\utAS3P'$<(GJARo4i/4`Y]0fD!B
1GLgK/C(LC6Xb$e/M&S01b^d;2)[6G/2Ah51b:@8/ho+>3&<NF2)['E1H.*G0e=k,cESof@<3t/
$<(MGF`(_u+@pcdA9D`?85^Qb1H.*@1,(OB2([%[+B2cl/4!\q0JkO@0Ink:1GUL;/iPa@2Dm*G
1G^sE3@lmD/i>I@2)-p=/1f)R/6$&#/.DqbAS5^p/4`Y]0Jt[B/3#UK2D!.]+@BRY/1iD)/2Jn7
2(ULB/i>XK3&NWG2DZsD2_Zs?0e>V4CghB-6Z6OPBe1g\[4F[RF"@b-;e9TUDKU"O85^Qf1c%!?
2_d!F2([%Z+@:!b/4!\q0f1[A0e5%>0fU^?/hf+51,1a@0JPRE2E!*B3%d!@3&3?G/1`?tZReF]
D_)>);eTTV/4`Y]2`*HR/3,UI2)d)3YoltXALoDa0f_'E0e4t<0JP+8/i,L=1-%3E0JYI>1G^R:
3%cm>1H7BL/1`?tYq/gdALn8t;eTTV@4Xr;+?;G:0KC[A2)[?L/70MnAT',,/70qg/ho%20fLg>
0K1aC1,pg:0eP==3A<BJ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"l^D_*)/@;BRuFCB'$+E2@>E,Tf+
Cc`b<BOPad+DGm>@;[2fEb';8Ch\!&Eaa!6+EV18D'3\,@;]dsB-:V*F)>?%C`mP&D/^V9EZet1
@;TR,+EMgF@W-'s@j#]%+EV:.+Dbb)BQPA8Afu2/AKZ&9@<*tE%16$I@<-*kBIl\G:`q\W1c$j;
2`W]N0e?ZS;e'_s?S#P80ek::1b:C=1G1C@1b^mG/1iS9/iYdI2)$g;1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/5p%s/0\)3Blmos+@1$V@N\*VBl[X(ATJu5Ec5o8F(&lH+B)r^Eb]#r+DGm>FD,5.@s)U0
F`Lo,+Cei!Blmd"+E(j7<GlMmARloLEa`E"7;ZaZ@<?(%/0JA=A0>B#DKBN&ATD?m+EV:.+Cf,-
Gp%$;+DYk5GALi$B4W2rF_)\;D]ib9F!,=.DL!@9A9DBjFD5Z2@;I&rASuU$EcWcSBl8!6BlnK>
ATKCFD09o2F_u1N+Dbb$Eaa!&ATJu&DIal'ATDL,@:s-o@qBP"ATDiE+q4lXBOQ%"@4XrI+>u)4
2_6pG3ANNEcFY2t@rEna@4X,l1G^p@1H.!G/28b81+Y1=1G1L<1,1[G/1iY:/ho%93&3<A/1f)Y
/5p%s/.DqbBOu!o@;@Db;BRnQ0K(IB1,La?/C(OD9R1Y06")K!0fV$E0e5%91,:C:/i>C81,q$A
2).*O2`N?E1G1IA1,_$M/1`?tZ7J[pE\%Y,;eT`_@<>pq/4`Y]2)R0@3&rZK/C(OD6#pZj5qF]E
2)I3A1,(OF/2Ah91b:CA/iGUA0Jk[=1,(=?0K:aB0e=k,cE\ueEbR'6$<(YS@4Xr;+>Gi12_m'<
3AiQM1+ZcT;eL,%?S#P82_I'H/2B4>/iPO>2`EEA/Mf.73AENJ2)?d=0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL;eL,%7qc=K@;0.f+E2@>E,Tf+Cc`bVARTIt+=Cf?Ch+n9Bl5&8BOr;TG@_n5@;]_#@:s.(
%16$JEbTZ;/4`Y]1,M!G/2K%;1c[,4YolD.@4X\q0K(aF0eG+<1c$[70eP:>/28h5/i#CF0f:g>
/MT.92_d3F0fCR6/C(LO6VUu?%16$JFEMD./4`Y]3&WKF/28k62_d!;cFP,aEH3Tr/2At:2`NBC
1bgg<2(gR>/2K(B/i5@E0K:m?/Mo(81,psF2CpC1cFPPmEH3T>$<(_KF=]s\+?2;63@lm>1GL[D
/C(UF6#gor5qFT=1G1FA/2K+=/iGUC2)R9C/MT+83&30I1,ga8/C(UR6#gor%16$PCgh?uF"BXG
.krk41c7-N/4)`T0f1I=2)RBF?Q`0VB.RC@?S"2i2`N?E0fUdA3B9)W3@lmA/iG[L1H76C1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/5Tnj/0[o/Ch[s(+E2@>E,Tf+Cc`bW@;TRd+CSl(ATAnlDerj&BlbgJ
@3BH+G%GJ4@X0(pFCB'$F2``>G9BRjD(["A$<(nX@ppoZ;BRhN2)[!D2)I6K/C(LC<bZS*6")<!
1GUgC/MSt70J"n13B/QF0JP183B/cN2_6O80eP1=0f(OE/50JoBl5LmEa`NhD_4:a@X2d.DJ<Ns
/1f)O/66J*/0\&,AKXZTFD5V8FCfK0+DGm>@3BZ4@;^.&@<?4%DBNk0+EV:.+@gH`ASWF7K?o4r
XNu[JL!P>nGA(]#BHV#1+CQC7Ea`j,CghF"Df-\9AfsBTCLLaf@;[3/BQ[d,CijeB>AS"qATD3q
Cj@.IEbTW;ASrW3BQYn9FY.`P/Tc+l>q@+,Cht52ARTIjDJ)!QARTU%De:,)Ea`["/g:`3;flSk
Eb0-+@:Ntm/4`'+/Pn#W/4`'+/Pn#W/70McDIb;*/70q_0J54>/2K.?/iP^G1,(^>1bp[?2DmKR
1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70qoDIb:dF`_,,+E2@>E,Tf+Cc`bW@;TRd+CSl(ATAnmBOr;b
FCB31Gp#jrB4uB0@X0(sBl7ElDKI"E@;[2XDeE`9%16$UEbT!$E\'aL+?)/;3B/QH1H%0K/70Mn
H#>0?/70qf/hf(40f(U<1c@'H3&rNG1G1@=2E3EH/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCcu!
Ec5B.Bjkm%E,ol9Df]?'4!8ELD.R6#@:jUmEZe;&EbT!$B.P0IBOr<!De'u/Afu;3DIdf2Bl5%l
CghL$@j#W6FD,T/DeF>J+B*B&Bju"$+DGm>@;L"'+CQC&BOPpi@ru:&+DG^9FD,5.@W-1#+Ad)m
`/S=NBmLn4@<QO&DIjq=6ZR*RFD50$+B2ccATJu4AfsccDJ((XB5]4A@X0(fG%#8s+@:*bBuGcY
9ju#TF`Lo.BuGcZ+q4lXF^]*)@qfg385^Qh3A<?B0eb=B2)m/4YolGGCb.k\/2An83ArBB2)R6B
1G1UF/2Jt?/ibUG2)?p;0f:RD0etFA1G!QXG%G]8ARloW@<?4$/29+=1a#V'Ch7X(D]hu#@<*JX
@<>poDeF3(/C(LO6tL0c,!6uCBk)'t@<HW6Eb0E*EcYf&+=L!!@q0FnD]hDU@q04]FDl22+?goC
Bk)'t@<HW6<b6/WFDl1N+ED%7E,TW8Bjtmi+D,P4+>Gi11a$j]@<*K#@<>poDeF3(.3]3.;fuPi
@4XrI+>Yu71+Y7@2)%!@cG(JqAT'+c@4X)m1bga90KD!I/2Jn91+Y.:2(gXD2`<KH/3,=B3ANBE
3%QU3cG(o(AT'+/$<)(\@;0O/85^Qd2D[0@1c.0H2D!.c+BE&i/1iD,3A<EH/Mo7=2CpU91,CI9
1H$jG3B0#Z1Ft+71G1L?1,V$O/1`?t].?uoCb-#&;funbAmod485^Qh0fM'C3AWBM1b?qY+A@'$
/1iD-3&NZU.l/q;0e>+51,UU<3&E6H1Gq0J3%Qj@/iG[L2)R<D/1f)Q/51>0/.DqbH#db1/4`Y]
2)@$J/2fLI0JP-(\KFpeE\&dn/M&_20K1O<0f1L:0JbUB1Ft+9/het52)I0A/1f)W/66J*/.Dqb
`.;c6H!r6p6m+6=2)d<O/28h:3&3<A?Q`0d5qH@o?S"/h2)[!A1,LU@1Gpj@2CpF90ePC@2`*KN
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S##p5qGrTBcp)XDJNZu+E2@>E,Tf+Cc`b<`.;c6H!qh4ARTIt
+E1n#@q?csDBO%7AKXocDJ3HpATME*Cgh3oF^\oo/e&.e@:Eqm/4`Y]0f:dD/2At;1c[,5J28<D
EbR'V/2/n;3B/NC2DmHF1G1CB/2o=:1c@$A1c6gB/ibgE1,h'A/1f+t1Fu=BBe0]#<+0KV@4Xr8
<%Uou1b^IO5u]F4/Mo.4?Q`$N@k:t<?S!od/i,@91G^m@2)-jG2Dm$B2(g^C2`!?M/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"lZ@k:;fFD,f*DJ<Ns+E2@>E,Tf+Cc`b=@;0Lc+Dk[uDK?q>ART([+DG^9
FD,5.9PJT^F^]0%@;[3(@;]_#@:s.(%16'CBmF-)B6.a)FY$']+>br13%QpG1H@HHc\EWC9joS)
/1iD//iG^@0fM!C2)-jD2*!3E2_I$J3A`EJ/1`?uLFcG"@4Vip<+0KdBe2eQ+>c)52CpaB0K1m@
3$:V0@4Wu]/M&b31,CI93AW9I2E3]S0e>4?/i5@D1cI6B/1`b36ul]e%16'CCh\!)@4XrI+>Yl5
3@m!D0et[=cFG&t9joS=@4X)l2*!EB1cR0F/2Jn51+Y.91bLaA0fV0I/2T==0JkLD1,^[7/C(dW
<D?mQ%16'CDJ*uu/6>,9:b=FW/6>,9:b=FW/70MrAS3Q$/70q_0eP=@/2K+A/i5RD2_m0?0fUdA
3ArQM3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)AS3P\F_k]!EbSs"+E2@>E,Tf+Cc`b=@;]^u@3B9*
+EV:.+EM[EEb0*!+Ceu!ATMs-@;I'!De'u4BOQ!*ARTUqGp#FrChI0sF!,[FEcYo.E+NQ4%16'C
DJ<N%6$76jEa`cuF"Bj[+>bc13@m$A3&!'<cFb9"9joS=/1iD//hf170f:g@2)m?H2)$R<0eP:C
3AiNO/1`?t]I[&W@4Vip<+0ZY@3@mTEb/ZqBlbgr;BReM1G^R>0JbXC/C(jM<D?mQ5qFT=1G1LA
/29"=/i#@B0KD!A1bp[D0f1[D2CpC1cFYW-9joR^$<1GQARfjo/4`/O2D[9M2(UOC0JkL8?Q_^E
E\(QK?S"/h0eb.50fCXE2)d6J3%QX=1bLOA1bggD/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QQE\'Oq
Ch\',@;[3,Ec5o8F(&lH+B2cgARfjo+Dk[uDK?q3FCfK1@;I'*@<?0*Bl5%`F^]<!DJ:5%DIal1
AT2[$F(K62F!,R<AKX]]Chn;==(-@sFD,]5F_>A1GA(]#BHVD1AKYT!EcZ=FBl7Tm@VKpmDKKqB
De:,6BOr;T@<-I'+CT;2Bm+&u+CT.u+Cf>4Ch+Z/ATW'8DCuA*<+0fUH=^V<85^Qh2)7$?3B&]P
3%W@]+@1!`/1iD-3A`WM.kr_62_6^:2_lp>3ArKI2DdEK2(UI9/iGF?1,^m=/1f)Q/4"8l/.Dqc
@<,s285^Qd1,M!B1b^dB2D!.Z+@C$V/3tg@3&*<K.kit<0e>+52)?d<1,LU<1,q6L3%R'B0fV$J
1c-a7/C(OP6Z-Bb%16'CH"U]1@4XrI+>GT-2(UI@2)?s<0f^@U@<F+e@4X)g1c7$=1,LaG/2St8
0J#(>/i,1:0K(^<1,LU?2E*BM0J"b+0f^da@<F+1$<1SLD/!m!/4`Y]1GUXD/2T%82E*24[P8ml
DIY4`/20%<1,:@72`!HF1bL[F/28n9/hf.=0fC^:0fL^C1cIBL0e=k,cF,GY6Z-Bb%16'GC1238
85^Qc1,q0C1GCUA1G$ha+@g![/4!\q0K([B0Inn61GLF9/iYd@3AiEJ1b^X=1+Y19/i>@>2)mBC
/1f)Z/4X8g/.DqcATD?kASc1*D(J4U+?)/<2_6sK0K(g?c\WcCB6#Oh/1iD0/iPI81-%<H3AifV
1H6p;1,^a?3B8rQ1b:1/c\X2OB6#O4$<1S[AS`ng5u]F4/NG@5?Q_XWE\(QK?S!oe/i#=90ek@7
0fD!K2E36D2_HgA0K(dC/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"KcE\&D+F)k]#ChY#2Ec5o8F(&lH
+B2oqAS`K+ARTIt+B<;nG%G]8AKYo3+D#_-Ed;b?Bl7Q+@;]Tu@V'1dDK?qEBln#2FD,5.Ch7^1
ATAnm@:h&5FD,5.CghC,+DbV2FCfJ8Bl5&8BOr;WAR][kG9C=1E+iZhATTOK%16'JAS#^mDCe=V
+>G]21b:C:1H@6Bc\4+s7<3)n/M&J)1G1XA/2fI?3&iiT2D?[61GCF=2DR'F0e=k,c\4,*7<3)n
%16'JF^ecs/4`Y]2)70H/2fIH2)[#2YolGT@4X\q0f1R@1b1I@1,CI;/iGX>1,1L90KD'I3AE'C
1bLRC2)mHJ/1`?tYq/:`@4Vip<,#cVBe2eQ+?2882CpR;1,1O>/C(OD7ri`'/M&J)1+k::/2K+:
/iGUG3&``H/Mo@<3&i`P2`<3</C(OP7ri`'%16'K@;]_#@;[Ve;BR\S0eb.62Dd9G/C([H<+0o#
5qFT=1+kRG/3#I=1bg^>3&rNF0eP1;1,UmF/1`?t[ObBdFY!t/<,#cYH"eg#;BReU2DZmB1,LaB
/2n\>Ea^LN/1iD1/i5@80f^s@3&rcK3B8WK2D-pK0JbC?/1`>2/4=Me/.DqcBl.R)/4`/O0f1jH
1,gaD0K(mL/70MqE+ge0/70qd/iYjB1,LpB0ekUB3ArE?0f(F<3B8uR2CpU;0f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r(E+gdH6=FbECggjcF(f81E,ol9Df]?'4!7L:D/"#5D.R-nF!,"%EbfQ(F)rI<DBM8W
DJ*BoBcq5#DJ+*#B4WV:@;Kb&A8,po+EVNEFD,5.F*(i2+C\nrDJ()(@<*K!G@>b>Bl5&8BOr;s
@<-.$ATMo8De:,5E+*6f/g:`3<,$DiBlkn-5uUT30fCa;=$]b]/MT.</70MrF`8m=/70q_0J5:C
/28n</i,:B3&ENE/MSt42)$^E3&W<C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:j$_.9lG&j@q/qb+E2@>
E,Tf+Cc`b=Ble*)F<G:=+EV:.+DtV)AKYo'+CQC/@;BEsBl5&8BOr;PFDPB,+Dl%>DKK<$DK?q=
AfsfdEc5GtD_</(F<GF3@;^-/FD,5.@WH0nAKY])+EV:.+@0jQH>.#*+DbJ(B6@WqAKYE!A0>T.
+DGm>@<6L.@qf@nARlp-Bln#2@3B5p@<-I!Ec5`)DBND"@<H[+Ap%o4B5)C&+DG^9@;[2rDI[Bl
DKI";De!3l+DbV%ASu$2%16'KFCBB-DCe=V+>br8/2oF@1G$k++@0mU/3tg@0f(^I.l8t91b:I9
0KC[>1bLLC3AWKI/2T(61b^dD2)d'A0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?c\3o9DIb:tBlmd-Bl5%A@;L"'+DYk5GA\O3F!+1g
A8,pi+E(j7<+U/iF^]/:+DGm>@3BW&FED>1D.RU,+DG^9DJsQ;BOu4%+AHcpDe!9q+CT.u+B;0*
;aX>'=)W+qA0=ESEbTW(B4W2aBlmo=+@p3fFDl26@ps1iGp$gC+Eq78+CT.1Bl.g-Ecb`-F<GO@
Bl8#8De:,%Df0Z*@rri&ATW--ASrW4GAeU6Bm+3,BmO30Bl@m1+=L0-@;]e#BHU`$A0=0Y@:CZ.
@;]TuFE_XG@rH7,Bl7L"FE8QQ7<NWhE+L/#DIakUAo_Tq@4<=-AoqU)+EV:.+?4IV+Ceu#FEMVL
/e&.eDea!&/6>,9:b=FX/1b-N7<3)n?S!le1GL[;1,CaI/28k32_cj@1+kO@3&!*J/1iV5/iYRG
2E*TH1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/0\&3C2%K,BlbD=BOr<(@;TQuDe:,1DIjr/Afu2/
AKX]UH!tS5A7]IsBk;?.Eb0&qFCeu*FDi:B@;0U1+EMXCEc#kK+CT.u+D,>.AM,/9$<1q[Bl.9r
/4`Y]2)I3F/2o:A3&)u0YolDFDCe+*0f1[H2D$g@2)$R9/i,@91,1dA3&rlN3ArE?2D?aC1H.0H
3%QU3cESofASs%.$<1q]@<?4+BIl\P+>bu13@m$I3AiQC/KdDhD(I7i/M&b33%um<3&*$A0etaL
2(U[E/ibUC2`!<B1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>492.^<4FD5Z2/1iD?@;RPpDf0!*Bm")3G@>P8FD,5.6$dWa@j#E&A0>f&+EV:.+B*E#
/e&.eDfT?1Cgh?885^Qf0eb.<0f_3EcG(JuF(6ae/2/e82)Hg;3A<HE1bLOD/2B+91Gh'J2E!*H
/ho4B2`!BD/1f)]/5UCt/.DqcF_Pl-DCe=E<%Uou1H$dT5u]F4/Mf:9?Q_^:DCf-G?S!oe/i#:8
0fV-F1,_$G2`<3D1bLdC2)@$E/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QFDCcu'EbTT.+E2@>E,Tf+
Cb?i0F_Pl-DBO.3F!,R<AKYE(DKI">Afu2/AKYZ/DKKH1G@>N4BlA#77VQdYDBNe)@j"-]D.m?l
Cht54AfsZcBldr1Ch76jDIb:@GA(n;G@>P8FEMVAARlotDKKe>@3B6%F`(_4@X0)<BOr<$ARTCn
F`S[;@;0b-+B;obFC\rkCgq'1+q4lYF`;%G844RU1GCaJ/29(;3ArEq+Aucm/70r8/2o191+Y:>
/ib[I2)[BE/N#:93AEBN1H6p@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;Isr$,!p<YH>.20@;[3,Ec5o8
F(&lH+B3K&Bcq,2+EV:.+DtV)AKYo'+EV:.+Dl%<F<GO@E-5u8F`SZsDIdHoASuF/F!+:jDfBN(
+Dbb8Bl7Q+Df-\>BOr;t@<6O%Ec*"0Ddd^/+E(j7;f?f#BHTTXATDKp@4WO1AS,k$AKZ).AKXff
EccG:F_,W*+CT;2Bm+&u+DG^9FD,5.0fF,e+Ceu#FEMVL/g:`3<-</tUF\r(+>GQ00f1g?2D@$G
1b;uV6ZR<#?S!oe1,V$C2Dd*B/2f+@3@lmE2D-gC1,h-P/1ib:/hf%90K;$C1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/44H#/5Tbq@:s^kH!tS5E,ol9Df]?'4!7LFE5SFnBlbD8DIjr/Aft](F`JUDEbTE$
BlIm"+D5V'F!,C5+EV:.+@gQ_Ea`j"+@C'gD/X'*DL!@=DBNn:E-5u*EZe1eEa`U'@<l:!+D,P.
CM[p0AKZ).@<<W*ASc<sA0>u-AKZ&:E,oN,AKYW(A0AdP@;TFjA9B#:D]iP1ART[l+EV:.+B<;n
G%G]8AM+E!<-<4mBlbgr;BRbM3&N6C3B&fS/C/ki:j$_.5qF]L0K1j@1,L^F/2Ah;1Ft790ePFF
2D?pG/1iV6/i,1<1GUd</1f+u/5UJ./.DqdCLgje/4`Y]1H73K/2T:B1GLH+\KFFg@4Wu]/M&\1
3A<!=1c-gF2Dd*A3%QX9/ho1<3&**</1f)W/4b%p/.DqdCM\-2/4`/O0eb@;0fLX@2_mBJ/70Me
ASs&+/70qe/i5L<0fM!C1,1I<2)Hj92)m3I0JbXB0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqASs%q
BlminBl\)68TS]VDIdf2E,ol9Df]?'/g+/0CisV<D.R-nF!,UH+E)9CG@_n2DBO%7AKXf`FDGH.
DBNb(DJ+*#B4W3(Afu2/AKYr'DfBN(+E(j7:hb#]@;0b"+A$Wj@;]Us/e&.fDKT`'ChR6k/4`Y]
2)mHM/2oLA2_Zf.YoltVE\&dn0f:dE1Fk.;1,^[=/iGL:1,Cg@0K(gL2`<3F/i5=@2DR9D/1f)O
/5p,#/.DqdDKTu4F`(o8ALpAM+>Pi32CpX?3&NTFc\!?-9joS)/20":0fL[>2`3KE1G1LE/28h9
/i5=D2`NQD/M]7;3AWKO1GC@2/C/r"6VUu?%16*UF_`O!6m+6@0fLd@/3,UB2`N?q+B)oa/70r8
/3#7B2_6^E1G1@92`!6L/29%81cI6H3&rNF0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;eKYm8TJ6ZBcqA8
DfBW9@;J"J<H<4t+Eq78+CT.1@;]RhASuT4@qg%1+E(j7FD,5.;fuqgEZee.A0=3I@X2d.DJ<Ns
+Cf,/Bl%L0@<?4%DK?q7DBMYbF)Q#9FCB$#@3BW*FEM#6ARlolCi=3(+CT.1@;]RhASuT4@q]:g
DImW,De:,6BOr;TF`;#7@<?(%+ED1>ATAo-DBNe7A7]e!/S&:8+A$T^E@q\-<b5oP/4`Y]2_Zp?
/3,F?2DQi/Yol_cE\&dn0fUsI3@cmF1c?m=/hf(41,h3G1,CaG1Gp^>3%d-L1H%3Q/1`?tYq/Ro
E\%Y,<b6;cFCB9&/4`Y]3&rcK/28k;0K1m@0f1"=DIb:a/2B";0f(=93AE?A2(gX>/2K.=/iYUA
2)R9C1H@'C1H$sJ2_6^<0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPFrA8-."Df.*\1b:q1A1SooEc5e;FD,5.CghF"DBL,I<b6;cFCB57+tOjYEclJ;
/g+,,AKYDjCghF"G%De.DfT\;D.R-nF!)YNGA(Q.AKZ).ATD?)BlbD=EclJ;+sJW`%16-MDId<q
Bjl+(Bm;1";BReV1GUL>1H$pH/C(XG<bZS*/M&V40JYC60ebIE/2Ah;2(UIB2(gaC1bgjH/28h2
3AifO1c[*</C(XS<bZS*%160FF('/A85^Qc2`EZH1Gq$I0J(MV+D58&/4!\q0K1a@0e5"62*!3D
/i>=60ek@70JbCA1c[*B0ePIG1,CXC/1`?tZn+^YD(H,'=(-Dm/4`Y]1,(O=/2B.B1,pi1Z62MQ
Cb..h0Jt^B0J,(<1c?m@/ho+43&`HK1H@HR3%QX;2(ggG3&<9C/1`?tZ7J@]Cb-#&=(Q\hDCe=V
+>Pi81Ft==1c.$?cEn]]9joS=@4X)k0K:m@1,^mE/28b:1Ft772_HdE2`NZK/1iV8/i,LD1,(C5
/1f)R/43-?/.DqfF`MM6DCe=V+>Yf5/2]4?3%W@`+Ac`_/4!\q0JP7@1bCRB0f:L=/hf%30fL^=
3ArTN1Ft+82(gX@2)dBP/1`?t[Ob6gALn8t=CH&\A8,n'Ea^Li;BRkQ1cHsF1,UdC/C(m_+B)cg
/4!\q0fCmD3A!$H0Jb79/het11,Ug>3ArfS1GC@31H7!@1cI3M0J"b+cFbk_;e'_s%163OBOr_c
6m+3C1GggE/3,FE2)6^i+A@'$/70r8/2f+71b:CA0J5@>0JkXF/2K1:2)R9M0K(I;0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL9R1Y0:18$TBl7Q+E,ol9Df]?'4!7X>BOr;7kJ"7`P)Lh4BlbD=BOr<!De*Bi
F)rIBAfu2/AKZ&:DBNY2+EV:.+@BgVDImm#+DlCGBQ%^*B6bV.DIakuCiaM;Eb031ATMF#FE8RH
BOr;t@<-0uATMr9@<6O2Df0K1ATDi7@;]TuA7]pqCi=9(EcW@AAftSlCh7Kp@<-E3Bl5&%DI[Bl
DKI!gBPD?m/e&.iF^]0#ALpAM+>kr40e>4C2`!3?cFY2cDf70Y/28t92Dcp@2D@!>1bLLB/2Aq:
/hf:C3AE9?1c?s?3&i]J2CpC1cFYVoDf709$<^qN+AcutFCfK,DfRC";BRkO2`3-F3B/uR/C(XG
:N0tu/M&V70fUs@0JkUA/2Jn61Ft:<1bLXF0JbXE/1i\22E<NM0eb.0/C(XS:N0tu%166LA0=]h
BlA#C85^Qg0Jta>2`W`U1G$hY+AZri/1iD-2DI$E/MJt;1+Y152`!!?1c$aA3&WTJ0e=n4/iG^H
1GUa;/1f)R/5L4u/.DqhBl%=&DCe=V+>u/<3@m-I3&36?cEn]o9kc.1/29(>1,:@>2D[3A1bLRA
/2B+>/hf.>0etX<3&WBH3&WTO1+Xt-cEo-&9kc-f$<gkUBjk[+85^Qe2E3]J2D?j@3@rIb+BE2s
/4!\q0etID3@up=1b^I:/iYjB0fV!B3B&iQ2`<3=0J57A2E*WP/1`?t[k(QoE\%Y,>%)Po@;@Db
;BR\L1GLF83&NNK/C(RE7<3)n/M&S32)m9A0f(U?/2Ah<2_6gH/i>=A1H$p</MT%62)%!I0fCR6
/C(RQ7<3)n%169IG%k]"G$upm;BReR1b^I<2`ETQ/C(OD<bZS*/M&V22)$s>0JPCB/2Jn93@lmD
2_I!I1H7-J/28b92Dd?I2_6L2cE]!%BlYa6$<h+ODJ(Lk;BRbU0Jb7:3&<EM/C0#)+@pcd/3tg=
/2St60e>%92_I'J3AiZR/1iS5/iY[G2D?p</1f,$0e>k@@4Vip>%qGSCb/+T+?;D</29":3B&M7
[NJ"ZBe2PY/2/k72)m0A3&EWH1bLaA/2T==3AicQ1H$d93%d0F3B&`K/1`?t[OajfBe0]#>&SJ!
@4XrI+>bl32_6gC3&`TDcEn]fAT'+O/28k61bgL90JbF71+kFB/29%B/i>CC0K;'D1,(=<1,CjD
3%QU3cEo,rAT'+/$<hR]ASu'qB4Yt'@VIAa;BRhS1GLF>1,^mC/C(LU+A?KY/4!\q0f1aA3@usD
0Jb78/iPX=1,:U;2_d<N1H6p;0fCX<1bgpJ2_6L2cET,U9PIre%169]@V'FgChR6mEa`Ek/4`Y]
2)dKR/2oIC1G^T-ZQMqU@Oser0f:aE2(^O>1cHsA/ibX;1,C^=3&iWM2`N??0f1LA3&riP2CpC1
cEf&qBjrV&$<hR]ASu(#@q]:f@;KX/85^Qf2E3QF2`*HQ2([%Y+A?KY/1iD)/2Ah90e>(83A*'E
0fLjE/1ik71H7-M0f1F4/C(OP9PIre%16u]F(&EdAScHs?Z]XlA26(q/M.D=@<H[*DfRl]7P5fP
F)Y].@;?;ZA7]glEbTK7Bl@lM+B3#gF!,1<+AP4$6!PdY+E(k(Bk(jcC`mS5Df-\:BOPsnF!,F1
B4W\)$>X3uGAhM4F#kFT@r,juF(HmFCisW(E\&>MDf9ME+E2"&F(KDD+EMI;@<*nAF*2@O+EVOD
@;HA[FD5i5ANCr/5uU&l/KdGmCij).<"00d/M.D=%14=&>>@I_5p.RN@<?4%DII?(6"P(TDII[0
Bk)3,@;]Tu;fH/TAKX9LD/!m%F*)G2FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6Dg!c_%13OO,9n=?
Gp#RsARloPF)Y].@;@D:7oMlE+Acl_DImouEd8d+H#n(=D0$gn@:F.q@<?F.Gmt)i$6pZaBleB7
EbT#lC`lbeCis<1+E(j76tL1V@3AMl.*e&V.3K',%14=)+@0OHE-,Z%+D,Y4D'3(-7VR$W+AHQd
Ch7L%Bm"886XakNDBNk0+B*2p@<*JZ@r,juF(KDt+s:,p7<<EZDII<'@;]Tu9k@mYF'Mun%13OO
<+ohcDfT<$FCAu.E,Tf3FD5Z2F!,C5+EV:.+B*E#+CT.u+AHcmDBNt2EHPu9ARlomGp$[.Ch[j0
AISucEb/cq@ruF'DK@?O@<,p%@ps1`F_kK.ARlp+F(oN)+B2omEb0<6EbSru+@LKm@;T^g@;I&c
Bl.E(-r`S`%16QU@psM$AKY]/+DGm>@3B]1BkD:(D'3q7D.Oi2@ps1b/g*]'G@br/E\&>WDfTZ)
+EV=7AKZ;;DIml3@;]TuA791gGmt*sBkCp!@<,p%@UX=hA0>f.+B<;nG%G]8@;I&cBl.E(-rj4q
/g*`'+E):2ATAo8D[d%`Df0`0Ec`F8@r,juF(HJ5Eb/cq@ruF'DK?q4Ec5e;<(%jND]i%Z/0K%J
AKYMtAnGUpASu!h+C\o(G@b?'+EV:.F(GdfFE_XGFD5T'+EM%$Ch7Z1D09oA+C\n)CMn'7DD!&2
BOr<*@<,dnATVL(+Co&"FC?b#+=PO"<%/r(F!,R<AISuTEbTW/D.Rg'@j#;rAnGUpASu!h/0JYE
+EM+(Df0*,/0JD5FE_;-DBO%7AKZ)=D]iJ03XlE*$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VfPPZ/bg+B1`O/Ke%m%13OO:gnEe+Eh10F_,V:De:-;PZ/c8@;[2sAKYMpA9DBnA0>K)
Df$V=BOr<"BleB7EbT#lC`mb0@rHBuF"SS,D@Hql@<-I(@s)TrE\&>HF`(`1ARoj)De:,'@r,ju
F(HJ4@WQ+$G%#K,Df0V=-t7+:BHVA7Cgh?,@;]TuCisW(E[`,TATD>k$?B]fDfTB"A0>T(+D"u%
Cj@-lF`MD>ARTI-+AHQ\A8Gg"7:C7ZATDZ2@;]Tu6YL1OATME*@;]skCi_-:$>j3hF`V&5BlJ08
/0JA=A0>AjDJsE6/g*`'+EML9FCcS5Afu2/ASH0-Eb0&qFD5o0Cj@.>Dg*=CEb/`pF(oQ1/.Dr.
BOu6r+Cno&@3BT%E,oN2ASuT4FD,5.Df0B:+D#_1A7]XgAKYT'EZfI;AKZ/)Cis;3De:-;PZ/cE
EbTH4+EVNE0fC^>%15Hk/g*`'+EV:.+Ceu#FEMV<ATJu+Des6.GA1r-+EV:.+DG_8Ec5K2@ruF'
DBNk0+EV:.+EV12ATM@"E+L.?@qfsn@1<Pu2D@-66U`FT+EV:8F`Uu/A9/l3Aftc$B4rE-F^]*#
FEo!I@WQ+$G%#K,Df0V=BOQ'q+C\nnDBNe)A7Zm%Afto4DIIPp$?'EaF_l/.FD5Z2F!,C5+EMX5
EcWiU<+ohcDKTf*ATAo%DIaku@q0Y%@:OR*De:,6BOu6r+EV=7Bl7R)+DG_'Eb/[#AISuYEc5e;
FD,5.F(KN+DKKH$DKKP7FD,]5F_>A1FD,5.FE_;6FD5<.BHUerDKL#AGq:(HAnGt%A8,po+Eh10
F^\`qAISuW@<>p#Bl5&8BOr;sATVL(D/!lrFD5Z2+E(j7cBM9\+@.,\ATV?pCh7-"@;]LiH#m\@
+E(j7FD,6,AISu`ARTY&Eb0*!DKKqBAnc@/ARlp-Bln#2@s)6p@j#i3Ch[cuF!,(5EZiYl<$5dn
Df$UK2)$^,FDi9P0f_*F+DGm+$?1#sF(K62ARlotDBMne@VfTu0d'nBA0>T(@r-9uATJu9BOr<-
FCB&t@<,m$ATDg0EZet4EZeq%@q[!.@;L't%14LXDfTl4F)Pq=@;]Tu;flSiBOu(&Df.*K1,(C=
.4u&:%13OOIXZ_T$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%16'C@VfTu0d&%j<affeATJu4Ag#B`<$3;++<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$:JHGBm+&u+D,Y4D'2A`F*)>@Bk(Rf+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZUARfY!A9/k9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$8!h]
/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+%166L@<*J5+<VdL+<VdL+<VdL+<VdL+<\so<*UOg+<VdL+<VdL+<VdL+<VdL+<Ve*
FCB&t@<,m$7<3EeEa0%\+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<VdL
+<VdL.!&s0Df0*,.1HV9/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=/N#49+<VdL+<VdL+<VdL+<VdL+<VdL0fLgI0H_J\
+<VdL+<VdL+<VdL+<VdL1c$fp$8"(g0H_J\+<VdL+<VdL+<VdL+<VdL+>G`21GBpo+<VdL+<VdL
+<VdL+<VdL+>Z#3%14[C0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL+<VdL+<VdL
+<WHu0F\@@1,(C)+<VdL+<VdL+<VdL+<VdL+<Vd]1,h3I+<VdL+<VdL+<VdL+<VdL+<Vd_1GB7F
/MSq5+<VdL+<VdL+<VdL+<VdL+<VdL0ekRC0H_J\+<VdL+<VdL+<VdL+<VdL1-%#t$8<SF+<VdL
+<VdL+<VdL+<VdL+<VdL+>GQ-3%uHt+<VdL+<VdL+<VdL+<VdL+>Pi/%14gD0H_J\+<VdL+<VdL
+<VdL+<VdL+<W[&0JFUl+<VdL+<VdL+<VdL+<VdL+<WEr0F\@E0JFUl+<VdL+<VdL+<VdL+<VdL
+<Vdd2Dd*1+<VdL+<VdL+<VdL+<VdL+<Vd^0ea%D1GCL*+<VdL+<VdL+<VdL+<VdL+<VdL2`<WL
+<VdL+<VdL+<VdL+<VdL+<VdL0fUir$8aFj+<VdL+<VdL+<VdL+<VdL+<VdL+>u/40H_J\+<VdL
+<VdL+<VdL+<VdL+>Gc.%14sH0H_J\+<VdL+<VdL+<VdL+<VdL+<WO#0ea^m+<VdL+<VdL+<VdL
+<VdL+<WBq0F\@I0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd]
1,'.E2_Zp.+<VdL+<VdL+<VdL+<VdL+<VdL1H7*C+<VdL+<VdL+<VdL+<VdL+<VdL0eb9j$90^n
+<VdL+<VdL+<VdL+<VdL+<VdL+>Pr80H_J\+<VdL+<VdL+<VdL+<VdL+?2%a$99do+<VdL+<VdL
+<VdL+<VdL+<VdL+>P]+0H_J\+<VdL+<VdL+<VdL+<VdL+?(t`$8F4g0H_J\+<VdL+<VdL+<VdL
+<VdL+>G`40H_J\+<VdL+<VdL+<VdL+<VdL+>l"c$8F7h0H_J\+<VdL+<VdL+<VdL+<VdL+>GQ1
0H_J\+<VdL+<VdL+<VdL+<VdL+>bb]$8F:i0H_J\+<VdL+<VdL+<VdL+<VdL+?),2+<VdL+<VdL
+<VdL+<VdL+<VdL+>Y\\$8F=j0H_J\+<VdL+<VdL+<VdL+<VdL+>c)4+<VdL+<VdL+<VdL+<VdL
+<VdL+>PV[$8F@k0H_J\+<VdL+<VdL+<VdL+<VdL+>Yc,+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[
$8FCl0H_J\+<VdL+<VdL+<VdL+<VdL+>PW)+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FFm0H_J\
+<VdL+<VdL+<VdL+<VdL+>GW*+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FIn0H_J\+<VdL+<VdL
+<VdL+<VdL+?:Pe+<VdL+<VdL+<VdL+<VdL+<VdL+>jT80fLsD+<VdL+<VdL+<VdL+<VdL+<VdL
0f'pp+<VdL+<VdL+<VdL+<VdL+<VdL1(=RF3&!$/+<VdL+<VdL+<VdL+<VdL+<Vd]1a!n`+<VdL
+<VdL+<VdL+<VdL+<Vd]%14gL2)$-q+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL+<VdL+<VdL+<VdL
+<VdL+<XoO0b"IE3A<-0+<VdL+<VdL+<VdL+<VdL+<VdY1E[e_+<VdL+<VdL+<VdL+<VdL+<Ve3
4>@9P0f_*F+<VdL+<VdL+<VdL+<VdL+<VdL1-$I"+<VdL+<VdL+<VdL+<VdL+<VdL>Wa\m0b"IA
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=IXZ_T$4R>6DBNe7A7]e!+EV=7ATKCFFD,5.A7]joEc#N.@<?4%DBNk0+O63N
+DGm>D.-sd+E_a>DJ()#FDl#1@j#8tDe!R(+CT.u%17,aA8,s)Ddmd!Ectl5Bl@m1+E(j7EHP]2
@<-E?+EMHDBlkJ3F!+t2D/a<&FCf96+DG_(AT23uA7]Y#+E(j7FD,4p$>aj&@<*K%E+ig"ATDL+
/g+,%@VfTu1*C4DG%G_;FD,5.G%#30AKYo'+O63N+D#_-Ed8d>Bm+&1H"CE)F!,(8Df#pj0f_*K
+EVNE1,(C>+=KNsFE2;;Df'2u@;I&PCi*Tu@:LElDfQsU0JGC9+E1b%AKXW+.4u&:%13OOIXZ`p
%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%d@:F%a+>P&k+Auc\ASuT4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZY@;L'tF!,C5+O63N+D,Y4D'0rD+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#6tp[Q@rrh9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<V+#:L\BVEctl5Bl@m1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+
/M/P+/M/P+/M/O`$<^qKEZcJI+<VdL+<VdL+<VfPPZ1m1+<VdL+<VdL+<VdL+<WNn=_2#^+@BgN
DJ*Nc+<VdL6$?g[@:s.V%144#+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<W(RARfXr
A901B+<VdL+<VdL0eHO>@<*JXBOPdkAR#ZO+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<W(RARfXrA901/$8!h]/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+
/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+%14gM2)R!?+<VdL+<VdL
+<VdL.l/n40d%S]+<VdL+<VdL+<Xo@+<VdL+<VdL+<VdL+<VdL>V-Bl0f_-G/heCj+<VdL+<VdL
+<W0j1G1F*+<VdL+<VdL+<VdL1+k:(+<VdL+<VdL+<VdL+<W?j1boLI0f_-L/heCj+<VdL+<VdL
+<W0j2(gg1+<VdL+<VdL+<VdL1+kF,+<VdL+<VdL+<VdL+<W?j2)#IH0f_0H/heCj+<VdL+<VdL
+<W0k0J5+'+<VdL+<VdL+<VdL1bLX.+<VdL+<VdL+<VdL+<W?j3=Q<M3B&fJ0H_J\+<VdL+<VdL
+=f9+/i=ao+<VdL+<VdL+<Vda/i+Um+<VdL+<VdL+<VdL+>GK&2@U!J3B/]F0H_J\+<VdL+<VdL
+=f<'/i=ao+<VdL+<VdL+<Vda/heCj+<VdL+<VdL+<VdL+>GK&0F\@D3B/lK0H_J\+<VdL+<VdL
+=f<+/i+Um+<VdL+<VdL+<Vd_/iXsr+<VdL+<VdL+<VdL+>>E,2@U!J3B8cG0H_J\+<VdL+<VdL
+=f<-/ib$s+<VdL+<VdL+<Vd^/iFgp+<VdL+<VdL+<VdL+>>E*1(=RF3B8rL0H_J\+<VdL+<VdL
+=f?(/iXsr+<VdL+<VdL+<Vd_/ib$s+<VdL+<VdL+<VdL+>>E,3"63M0JG150H_J\+<VdL+<VdL
+=f?+/iXsr+<VdL+<VdL+<Vd_/heCj+<VdL+<VdL+<VdL+>>E+0F\@E0JG@:0H_J\+<VdL+<VdL
+=f?,/iOmq+<VdL+<VdL+<Vd\/ib$s+<VdL+<VdL+<VdL+>>E&3"63H/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=IXZ`p
%13OO<+ohc@<Q4&@:s-o@;]t*@;I&rBOPdkAKYo'+O63N+Eq78+>>E.3?WBS@rH6q+D,Y4D'1Pn
2DlV!D]gbp3%uro$:o)ZAThX*/0K%JAKYE)ATD3lAKYE!DKTB(+DG_'Eb/[#AKZ2*F!,4?F*&NY
/iGL.F(Jj"DIal%Ec5e;0f_3N+EVN2$8O:h0J">TDIal.DJXS@0J5(>+EM+(Df0).Ao_g,+>PW)
0HbIU+>PW)2(g"@F`_bHAKYJr@;]^hF!+n/A0>u7ASu%"%16fe+O63N+Ceht+Du+>+C\n)E,oN#
Bk)6rA0?)1FD)e,ATDm$Bl8$<+EM77@q?d)BOu+&ATVWr@;I''De*EqF!,C5%172jAKYr*H#m\0
@;I&r@<HX&F!+n3AKYl/F<GL6+D>J%BHUl(Dfo]++E2@4@qg!uDf.0M7<iop@;p.$@<?4%DK?6o
Ao_g,+EV:.+EV%$Ch4`5ASGdjFCeu*@X0)<BOr<&Df021E+O'(De'u4Eb0-!+D,Y4D'3q7A799s
@WGmmBl7Q+De9FcFD,5.9lFrf+E(k(ATAo6ARTXuDII!jAKYQ*FD5T#FCfM9De:+B2E)b"ARfXr
A9/l-DBL\g0eb.$.lfC.F(Jj"DIdet$>FB#1,(R>/0HGu0JahmARfXrA9/l-DBL\h0JG%#@;]Tu
.l9(<+EM+(Df0*,+DG^9FD,5.H"CE)+>P]+0J3eA%15mRFE;/,AKZ).AKYr'EbTH&+E(j7Ddmd!
Ectl5Bl@m1+=K*$0H`\L73H\j+>PW)2'>7T.4cT`BOr<0@;L't+E(j7cBM9;$=dL^+C\n)AU&<;
@;p.$@<?'k+D,Y4D'3\,@<6R3ARlp,@;L'tF!,UHBl7Q+FD,5.Ci=3(/TbQED'3\,@;ZM]E+*cq
@W-'s@j#l6ASu$>%13OO%144#+<VdL+<VdL+<VdL+<\so<$4=H/M]"&.j-W'+=\LU?8<XEARfXr
A9/1e+<VdL+<VdL+<VdL+<VdLGA(Q.ANCqVF<E^h.!]B4E\0"*1,(.10eb9j$4R>.+EM+7Bk;?.
De:+rE,TQ<DJsB+@;I&tG]7\7F)u&6DKB)3BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_
@psI:04\X1FCB91Des\OBQS*-.3N;4G%D*i@V'+g+Co&(Bm+&u+D,Y4D'3q6ATME*A79Rg+EVNE
F(oK1Ch[L,+EV:.+D#_)Cis0.Bl@l3De:-;PZ/c;DfQt/DKuZuFD5T'+CoV8Bl7Q+FD,5.Bl8$(
Ectl-+>#<.3B84(D]gPd0JG15+B3#c+Bru+@qB\&@;0V$Gp$g=%1:CF<*^ncFEDJC3\N-t@r,ju
F(Ht:F(So7DIITp/n]*G02k;L@<=@[F`(]#Ecb`(DKL.VBQS*-.3NPPATAo8BPDN1E+O'(De'u#
@;[2sAKYQ*FD5T#FCetl$>+<sD'3n0@<?U&EZf(6+EV:.+Dk[uF*2M7D.RU,F"SS)DfQt/A7TCr
Bl@ltC`mG0AoD^,@<?4%DCcoOAS!n3$<oo0Cij).<$5UeA0=liBm+'.F(&l-<,$2\>psB.FDu:^
0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akA2CiD%<AScHs<%_j+D/:XR%13OO/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO=)W+qA0>u.D.Oi9Df0--+CT;%+CSc%F^]*&Gp$R)F(Jl)Df-[bDf9Z,Bl7@$ARl5W<GlMo
ATDj#C`l\kD.Oh<<E)=7/g*`-+DGm>@;[2rFDl#1@j#l-D.Oi2H#@,*Ec5i0H=^V0@;]Tu@:X+q
F*(u(+EVN2$?L;tGp%<FFD,B++>>E.+EM+(Df0*,+E(j7@<6O2Df0K1Bk(RfCj@.6ATVL(D/!m!
A0=liBm+'.F(&l-<,$2\%14L`<%0FB:LdmCF(oQ1@;Kb*/0J@D>U!uq@;m?1ARfXrA6^<$BlbD*
A7T7^+EVNE<E)=.FDi:;AS#g'BlkJ3DBO"GDIX+_GA2/4+B;A`.!K?=@qZupBOPdkATJu)F_)\;
D]j43EbSs(Bl@m1+DG^97:C4YBNup++EDCB@<?4%DBNt.FCcmR%13OO/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO
,9n=/AS,LoASu!hEt&Hc$;GGZEbTT5DCco(/g+S?A0=fmAT2<oDKB`6/0ID7+AsgC+C$*]BleB7
EbT#lC`lbeCis<1+E(j7FD,5.7:C4YBNup+%15I=De!Q*7<3EeEZiYl<$5UeA0>u-AKX?KCh%U(
@<?4%DBNk0+@TdVBlJ-)F'Kn?+A+7/883-e/g*H$FE2;;/hA,GDeq$8$8XO^:gnBd+>YPk6$6g_
F*&N[0JG=7+AQi-+>GW*/0JnN+>Yc3/Mf1@+=K!!0Jk42%13OO;flSiBOu(&Df-[e/lEg#DIak\
Dfol,ASrVb/jV*@+=][!CghB-De:+_BleB7EbT#lC`l/VCh[j0AKX]UE-!K[%15I2D.7O"A7oHr
<GlMo/l6S"F)rrb+@BRS@WH0nB4WV:0f_3O/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$8O:h2]th'Earc*
1,j)ZF(&EpDes]:Df'2sCgUauE,oN2F(oQ1F'iNtEaN?gCij)mFC/lq1,gF#>>@I_5p.RN@<?4%
DII?(6"P(TDII[0Bk)3,@;]Tu;fH/TAKX9LD/!m%F*)G2FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6
Dg!c_%13OO/Kc/Y>?aX:D.R!$BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22Ft[E:Ch[j0AM.Y<
D/:Y,%13OO,9U2Z@r,juF(HIqARZc\Blmol-tm^EE-"&n06;&J@<-F7F*(u1/oG*=@4l22Ft[E:
Ch[j0ATKM<Df'&=.1HUn$6pc<@X0(cEb/c(7<<EZDII<3+@f@"6Qf3A@;]Xu@<-W9;gEG+ASlK2
9OVCKEaa'.Ed8*$%14=&:iC/qDJsB+@;I&TG]7\7F)u&6DK?q4DfQsgAScHs+B0I3cBM9W+:SYe
$<q1cFDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akA2CiD%<AScHsFDu/7Gqq'-1bNH`D/<K+
BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*-.1HUn
$6pc<7VR$W+AHQdCh7L%Bm"886XakNDBNk0+B*2p@<*JZ@r,juF(KD8>['X<E+NoqCER&'A0=TX
AT`'!>p'R`%16*VBl7Q+FD,5.cBM9NG%#30ATJu)ATDL.ARloqEc5e;FD,5.BPDO0DfTQ%@;I',
ARfY!A0>;uA0>K)Df$V-Bl[cpF:ARq@WQ+$G%#K,Df0V=.!&s23ZqX+@:F%a+>I.MBQS?8F#ks-
ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX@psI:04\X1FCB8DBQS*-,BR@'0e"4S$=Rg_+BqfR@VfTu
10l;AFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW6.3L&j
+CQC6ATDKrF!(o!De:,2Des]:Df'2sC`m;6E,oN2F(oQ1F!,.)G%De*AS#a%@rc-hFCeu*FDi:C
Bl.g*BkDW5FD,5.AThKuF^]B+Df-\9Ag#B`<$5dkEZee.Gp%3CD.Oi#F`M26B+52iBOr<#DKKH1
G%#20/MT7G3?WE^+=f6%0JG*g$4R>DAKYMpAnc-o+EV:.+Co%nBl.9p+F.O,EZeU2H!DO9@<3Q'
Des6.GB5eS$4R=b+<VdL+<VdL+<VeP+?^imARTU%.j-6WDf0Z1+>"]i/i>(20es1F%16'JBlbD0
Bm+'/+C$+9>Tt;&DfQtBBOr<'Bk1ajAKYo'+EV:.+Dl%7FD*3JGA(]#BHV#1+CSbiF`Lo4AKYQ%
Dfo]+%16`^G%GP6FD,5.E,oN"Ble!,DBNY2+EV:.+DYk5GA\OH@;L'tF!,C5+O63N/g+,,AKYT'
Ci"$6Bl7Q+E,TQ<DJsB+@;HA[AU&07ATMp,Df0V=@ps6t@V$[)F(Jl)@ps1`F_kK.AKZ).AKZ/)
Cis;3De:-;PZ/bRBl5&7ARfXrA901BDg#]4+EV:.%172kD.Oi/ATDL'A0>B#G%G]*A0>?,+E(j7
FD,5.>=N=MAKX]]Ci![#DJ=61+@BRTDf-\9Aft#jCgh?,7:U.JE-#T33XlEJ0f_6S+EVNE.l/k5
0O6)?FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;YF^fDF2,-G:74r7qD/:XR%13OO6=jbI
Eb-A8BOr<3ARTU%/N#49/0JG2Ch%U(@<?'A%13OO+<VdL+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&
+E_!G%144#+<VdL+<VdL+<YlAATD?C+<YeL4Wl.u/MT4?0I\Y00JEqC%15F5FE_;-DBO49@<-E3
/N#49+CT.u+=f<'0J">jAKZ,:AKZ).AKYMlFC?;(Ec5e;>?#$?Ch4_D>psB.FDu:^0/$mHCh[j0
AM.V:An*H2@<5j0B5_rH9LWH"F>Y^^AScHsF=q6KD/:G=@:Cr?/0JMK@qBV$+EV:*F<G16EZfI;
AKZ80@<*JB2)$^,G@_n,BOPdkARl5WFD,5.G%#30AKW]d0f^p1FDi9V2_m'C/iOneDBNk<A7]d(
FDi:1G&M)*+CQC'Bldd&DKKT1F_PrC+EqOABHVD1AISucEb0E.Dfp+DAoD^,F_kJ/@<<W6BOQ!*
AT2QtBJ(E,BOr<0@;L't+D,P4+O63N+DGm>B5)O#DBND6+CP]dE,TQ<DJsB+@;I')Afu2/AKWmQ
BHUhsB6%Qp/0K.MBk(g!Eb031De+!#ATJu9BOr<0@;L'tF!,17+BqfR@VfTb$8Gg7/hSeU7:TbJ
2(rKOCij*-/nf?DCa4%1@PK;SGA2/4+CT.1ATDg0EZf7<F<GC.EbAs(+EV:*DBLbYF(Jj"DIdfL
%13OO+<VdL+<VdLcBM9N4WlI52)mBE2BXRo0eb==/i5:*.NijV.j-W(/iPaG0eje#+E_!G+>"]n
/ibdE0JtX/.Nik?1CX[6+<VdL+<VdL+<VdY+>>E&2`WiS2)6:(+E_!I+=eQg/hf%90fLpD3AM^,
+E_!J+=eQg/het>0JbFA2)6m/.Nik?2BWG9+<VdL+<VdLGA(Q.ANCrV+?^im0/5.7%13OO6=k7_
AS#a%H"CE)F!)tj0JFVXDIak?0fC^>/0K.J+CSnkBl5&9F(HJ9BOr;s@<>p#Ao_g,+:SZ^<+06P
AKW^5-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PK;S
FDi:4ATDL.AKYD(E,TQ<DJsB+@;I')Afu2/AKWmQBHUhsB6%Qp/e&-s$6UH6+<VdL+O63N+?^i%
2)d?E1*A.k2)R9E0JO\"+E\eW+?)#-1,CaG1*A%hF^?gG.j-Mu1GLmK3&)O*+E_!H%144#+<VdL
+<VdL+<W6Y0J5=B0JbOD1E\.iF^?mI/Kc`"0JG@<2)%$N3$9[nF^?pJ.j-Mu0JGIB2)d9E2_uR+
+E_!K%144#+<VdL+<YlAATD?C+E\ei+=MLe0eb:8.5*D00F\?u$:8<GG@b?'+F.O,EcW?R0fC^>
+CT.u+=f0*0JG%#@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H0etF*/Kc`"3B/]P+=\LU+>"]i
/hf";1GU(&+EUpF+=eRV?8E]W+?)#13=Q<<+<VdL+<VeNBOu3q3ZoPe+?^im+>"]j2D?fo$4R>/
ATW--ASrW9ARTV#+=f0*0JFVXDIak?0fUj@/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl^:
3&;[-+>>E&2D?p0.NigU/Kc`"0JG@E1,q-6.Nih>1*A(i0J5%50JP@>1H$@*+EUpG+>"^X?8NcX
+>GT01b^U;%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gf/0F\?u$:8<GG@b?'+F.O,EcW?R0fUj@
+CT.u+=f0+2D?[)@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H0f(F@1*A.k0J5.;1,LgH+=\LU
+=eQg/het;3&WKH+=\LU?8<WR+>>E%0JkL=0fC.(+EUpG+>"]i/het51H.-H2BXIlFC$dH%144#
+<VdL+<VdL+<W0W0J5%50JG4:0et[C+=\LU?8WiW+>>E%0JG170JPIG3?TdoFC$jJ.j-Mu0JG17
0JG170K;!K+=\LU?8i<#+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3&!#q$4R>/ATW--ASrW9ARTV#
+>Gi60HaeAA0<Te0JG%#@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H2_I!D+=eQg/i>RD2]sRm
F<E.X0J5+<0fLsH+=\LU?8<WR+>>E%0fD!F2E!N;.Nih>1CX[6+<VdL+<VdL+<VdY0J5%50JkUF
1H%!F+=\LU?8NcT+EUpI+>4im1G^aE1^sd7+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc-2D>RI%15F5
FE_;-DBO49@<-E30f^pA+CT.u+>Gl30J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i!1+kLG
+=eQh/i5RF0ek[2.NigU/Kc`"0JtjM3AWZ<.Nih>1*A(i0J5%52DI3M2BXIlFC$aG/Kc`"0JG18
3B&'1+EUpH%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gl10F\?u$:8<GG@b?'+F.O,EcW?X3AN92
@;]Tu0f_'F/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4WlL7/i#+'.j-Mu3&EHP1FdJh/Kc`"
0K1mE0JFV!+EUpF+=eQg/het70KCpI+=\LU?8E#t+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3AN8t
$4R>/ATW--ASrW9ARTV#+>Gl50d'nBA0<Te2DHa*@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H
1-$s@2]sUn0J5192_&nl/Kf.A1+tC=1E\1jFC$aG0-E#-1cGjN+<VdL+<VdLGA(Q.ANCrU+?^im
+>"]j3AiK"$4R>/ATW--ASrW9ARTV#+>Gl70d'nBA0<Te3&W<1@ps1`F_kK.ANC8-%144#+<VdL
+<\so<$4=H1c6mB2'=Cl0eP.<2_&nl/Kf.A1+tC@0H_qiFC$aG0-E2.3"63;+<VdL+<VeNBOu3q
3ZrMe4Wo"m/Kcc.2`2$O%15F5FE_;-DBO49@<-E30f_3O+CT.u+>PW)2(Tk[@;KFrCghEs3XlE*
$6UH6+<VdL+O63N+?^i*1G1XF+=eQg/i,:?2'=@kF<E.X0J5%;0JbXE+=\LU?8<WR+>>E%0JPLA
2`2^-+EUpG+=eQg/het52Dm3K0f1"&+EUpH+:SZ#+<VdL+<VdL+<VdW+>>E%0JG191H.*I3B833
+EUpI%144#+<VdL+<YlAATD?C+ES_h+F,(]+>PW)0F\?u$:8<GG@b?'+F.O,EcW?Y0JG@,@;]Tu
1,(R>/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4WlX</ib[0.j-Mu1GU^?2]sRmF<E(V0J5%5
2)R?R+=\LU?8;rs+<VdL+<VdLGA(Q.ANCrU+?^im+>"]k0JG0i$4R>ABPDN1AU&07ATMp,Df-\3
F!,")EbT].A0>K)Df$V.F*),5@<?'k+Eh10F_,V:De:-;PZ/c>DBO%7AKZ80@<-E31,(F:%16N]
A0<W]2)$X*<+ohcG%#30AKYT'EZd+k0ea^u2E!0J+EM+(Df0*,.3N>G+C\c#ARlp%DBN@1Ch[cu
@<-10%16ZkFE1f/Derj(Bl@l3Ao_g,+>PW)2'@$_Bl7Q+0J5.A+EM+(Df0*,06q,;EZcc=G%G]&
B4W2tEc5e;0f_6O+EVN2$8O:h2(:.#<+ohcG%#30AKYT'EZd+k2)$.$3AVe!ARfXrA901BBlbD5
Bl7KjEbp"DAU&<;@;p.$@<?'k+D,Y4D%-h-0JP7(F`V87B-8l\2Du\!ARfXrA90DLARTU%-t.:1
Ea`Tl+ECn4AKYT*Df$UO3A<01FDi9W0JG10/e&-s$:8<GG@b?'+F.O,EcW?Y0JtO,@;]Tu1,1X?
/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+=JX`/MT4?0I\Y00JFq^1*A.k
0J54@1,pC++=K!"2)$.)+F,CF$4R>ABOr<&@<6N5FCfK0+DGm>Bl8$5De+!#ARlp*D]iV-Bl.R%
@<?''FD,5.A8-*pDf0Z2DKTZ8Gp$O;+>PW.0J3eA%15C5FCfJ81,1X?/0JG2Ch%U(@<?'A%13OO
+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+E_!G%144#+<VdL+<YlAATD?C+<YeL4Wl.u/MT4?0I\Y0
0JEqC%15C;C`mn0Cis<1+E(j7cBM9N@UX=hA0>f.+AHcpEbTT5DBNA*A0=fmAT2<oDKB`6+C&,+
0JG=g>p*QsF*2>2+CP]dG%#30AKYT'EZfI;AKX]cDf/f-F!,O8@s)TrEZee#@qBIfEaa'(Df-\9
AfrZ\2BZFK@rl3k04T94?8=,U88i]`G%G\F%172jAKXE8:b=FV0JG.>1*CCUDIIQ.AT2<oD.Ra%
F!,%2E,9H<ARlotDBO%7AISuN6XakNDI"Z(FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;Y
F^fDF2,-G:74r7qD/:XDF`V,8+CQC6Ch[NqFDQ4FA8,XfATD@"F<Ga8Cis;3De:+D1,U[D2)l$P
@<,k!ARdB'H!FZ2/g+,,F`T)V@3BW.@;Ka&@rHC.ARfgrDf-\&,%Fk%+Dl7BF<G%(+CSekARlp*
D]j.8AKZ/)Cis<1%16WWEbT].A0>K)Df$V=BOr<*Des]:Df'2sC`m;6E,oN2F(oQ1F!,(5EZiYl
<$5X]AoD^$+EV:.Gp$U*DBND"+E_a:A.8l[DBO%7AKY2E@;^"$>psB.FDu:^0/$mHCh[j0AM.V:
An*H2@<5j0B5_rH;akYJ@WO1[9g_iJ/nf?DCaff#%144#+<VdL+<Y/:4Wl=1/het50JP=C1GU(&
+=MLX/Kcc.2)Qgh1(=R"$<(YV@q?d)BOr<0@;L'tF!,C5+O63N+D,P4+EV:.+DG_8ATDs&C`kGm
2)QLuD]geh0JstsATD?)A7]dqG%G1n$>FBgAT23uA7]Y#+E(j7@;^?5CisW(EZeq4BOu$lEbTSG
+Du*?@rHC.ARfgrDf-\3F!,@3ARo@_+D,P4+EV:2Et&IqATDL'A1e;u%16'JAKY3"DI[6uFCAm$
FEo!CDBR5h<*^ncFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[F`(]#Ecb`(DKL.V
BQS*-.3NPPATAo8BPDN1E+O'(De'u#@;ZM]@V$ZnF*),5@<?'k+D,Y4D'3n0@<?U&EZf(6+EV:.
+Dk[uF*2M7D.RU,F"Rn/%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%14=)+Auc_ATD@"@qB]j$4R>:DfTl4F)PqI
+A=C1@;]Tu;flSiBOu(&Df.*K7P5f]/hA,M,"QEhFDl26@ps0r<affeATJu4Afu2/AKXEMEcbu"
-Z]_(6Yp[NCEQ&dEc5t@cBM9N@;]TuFD,5.6Xae@F_kK.Bl@l3De:+\@r,juF(KDt+tOj//g*]!
F*'#W6$%-gDf.0Y+BEDs/e&.D2'>_(Ec`E[/0I6$B6A9;+>PW)1b9bED_<.e1,(7%E,ZpU1,gd@
1H$@(1,(C=.4u&:%16$UAT2<oDKB`6+@[t]+CT.u+@pEnCh.*p+AFIS/hA+p6$-pOF!,C5+@p3f
FDl26@ps0r7:U.JE-#S59jr!^.P)#96Xah@EbT&sAKXujBm)+*Eb0<5/hA,4@;TIoBk1jf/0HZ-
3&WAu$4R=o/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO1,(C@+AZKh+>>S\$>t!.@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>X
D.GC\:3CYeFD5Z2+A$Gn7:U.JE-,f(@;I&[Df03%FEM,*+=PO"cDW07@;]Tu;JBcWF<Ekj@qBP!
Bl@l3.*e&T5q*6M4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$4R>3Ec5e;8muuf<+0Z^ATB/>+EqC+F(o`-+BrN$FDu:^0/%3SDfB`8
B6%EtD/!L$/n8g:05boS@<?4%DK@I:-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2
F"\sp%13OO6#:1PEbTW/D'2er+@C'aE-686+B3#c+AR'$@<?4%DBMMg+A?]kB5)I1A7Zl3?t<)T
Bj`A!$4R>ABOr;uDes6.GA1r-+CT)!DfTQ6BPel%Df'H9FCfM9FD,5.DKU&0FD5Z2+DG^9ARfOj
E-,f(@;I'&Df03%FEM,*/0JYE+Co%rEb/g'/0GB/AoD]4@3B2sG%GP6?qNgp+CT;'F_t]-F=n[Y
+A$YtBlbD2F!+q#F(Jl)Df-\>BOr;90f_3I+A"k!+B3#cDfU+GDe:+eF`_&6Bl@l3@;]Tu;IsB]
@ruF'DD!CJ$4R>ABPDN1G%#30AKY].+EV:.+Cf>1Eb/a&Bl@l3FDi:1E,]W=+EVNEFD,5.9gq?C
+Eh10F_)\6Afu2/AKYPoCh[j1Bk(Rf+:SZoDf03%FEM,*+EVNEDdmfsBl5&8BOr;c;H6..Ci=3(
BlnK.ALnsJBln#2@3BZ*AT)U#FD55nC`m\;ARfFqBl@l3De:-/YqRda0JO\YEap55ARd>%$4R>.
DL!@HEbT0)DJsB'FE2)*+D,b6@ruF'DK?pKF(oMC+Cf>2/0K%CDCcoAF<G"./h%ocF(Jl)Bl5&8
BOr<*F(KK)D_5I;A7[;7%16NbF*2>2+ECn$Bjkm%@<-"'D.RU,F!,UCCh7[/+E)@8ATE!/F(HJ.
DIdHk@<?'k/g)8Z8T#YmBPDN1@psFi/0K%JAKYT!DII?(%17,eF*2;@+DGm>@V'7kB-:]&DK]T3
FCeu*Bl8$2+Co%rEb/g'+D,P4+Cf>-G%GQ*ASu!h/e&-s$@[GQILQW^AS*t4$:/`TEc5i6D/!Kg
C`l#[B5_g)FD,N4+>"]kDIakYA8-."Df-[G0f_6R.3K',8nDFK+AHEYF`S!!:j$5"+BN8nCi*Tu
DCn1dChtXF8T&#j%15[*6;AXW/NGXD1H@?F2DHd<%13OO;IsH$%15OKE,8s#@<?F.Gp$%.E,]W)
D.RU,+EVNEFD,5.6$%-gDf0K1Bk(Rf+@0g\@;]L`+=Js)3AN#m$?.^S0d(RV+E0%i1^sd`;aO5%
0J,:@2)d3E/N,R?2[p+CIXZ_T$4R=O$:ScBD.RU,Et&Hc$8F.U?qNgp#tJQEATD3q+A,$EDKTf*
ATAo*DfQt5Bm+'*+Cno&ALnsGBl.E(@;]TucBM9;$8O4V?rUM?<,$2\+D,%lFDl1BBl5%cF_kc#
DBNG#DKL#ABk;?.Eb/`rDf0,s+D,Y4D'2G+0JG150J">VDfTl0F)Z&8A8,po+EVNE8jj*q1G0eX
6tL"1Dc1"S?m#bTBPDN1BlbD*+Cf>-G%G]8Bl@l3Amo1kDfQtCF(Jl)FDi:3Df0`0Ec`F7AS6$p
ATJu.DKKe>%144#+<Y68F_Q#-Ch7L++ECn$Bjkn#/g)9<AKYi4CijB1Cj@.6AS6$pATJu'Gp%3B
BlbD/@:OCtEZfIB+E(_2@;0U%%144#+<Yc>AKYQ(F_Q#-Ch7L++CT/#Ch4`#G]7\7F)to'+DG^9
Ea`Km@;^-=+<XEtF<G.<ATE&=E,ol0Ea`g%Bl7Q+%144#+<YK/DJ+*#B4W3!@<3Q'F`(]2Bl@m1
+EVNE@rH7.ATDl8@V'Y*AS#a%Ea`Km@;^-/@;]TuA7]CoAS#p8%14pE+CKD$#u5Vb@<?4%DBO"3
EbT*++CSbiF_u8;@<?F.+=LZ=@j#i(@rH6qF!,]M0eb:80I\U`$8jFY@!=>5#u+u>DBNM,Df02r
FD5Z2+E(j7FD,5.D/X?1+D,Y4D'3q6AKZ&:DCuA*2D-+[G;<P49k@aN+EMI;@<*K!DJsB#Cj@WB
$9'R[@!=D7#u+u>DBNb<DIIQ.@;^"#@;L3A%15'I+CKCM?jTMLDIIQ.@<-"'D.RU,+E(j7CghF"
FEM,*/e&.J/g+PG2.-_aDf03%FEM,*+E(j7@<5piDIdI!B-;)1A7Zm%Afto4DIIQ.DfT<$F<GL>
+EV:.+D#&!BlJ0.@iu3f+<VdL@<3Q.ARTY&Eb/c(Ao_g,+EV:.+Dk[uDBNM1F_P`3GT^p:+Cno&
AM+E!0eb4&?t<)TBgcNF?jTSNFCB9*Df-\3DBNM#Ch[j1Bk(Rf+Dbt6B5)I1A7ZlpG]7\7F)to'
+DG^9A7]CoAS#p8%13OO%17Q5ILQW,<$3;H+=KiM+>"]k1c7!F1c6^)0-E&/2)7#u$6W;'+?^iH
.T?ia+B1->4Wm]R<&+mi%144GAS4t\;IO)Y4WlO50f1UB3ANKM1Gq-P2`WZL+>4il3%tdK%145%
0d&V%1-%9G3&NBG2BXLm1c.'F2E*6C0ekLE.T@NB+>>E%0JPRB1bpO[1*A(i-r_uF0-Du/3A`ZO
.1HV,G;14'+@KdR<,YZCA1B!O0e!P=%145%1*A_&1Gq*D2)7*L1*A(i1Gq0Q3A*!C0JbO8<$3b8
0J5%50JPI>1Fc?Z+>"]a<&5XM+>Y]*0JG10%145%1*A_&6tL"1Dc1"S.O]Kr.1HUn$6XOK+?^i%
1Gg^E2DR9P+=eQk2`EHO3%d0K2`!HR.T@N@+>>E%0K:sN2_lj^1*A(i-r_uF0-E,11,Ua7%145%
1E\h'6tL"1Dc1"S.O]Ks.1HUn$6XOL+?^i-1G1FA0f^s2.j-Z.1GUX>/hf"=2)@3A<$3b80J5%5
1H%3J2(DQ\+=eQ_<&5XM+>Yc31,gm9%145%1a"q(6tL"1Dc1"S.O]Kt.1HUn$6XOM+?^i%1,U[<
1c.'F+>"]j3AWKE0f(^C2DH[\+=eQg/het70K1[F.TA/G.j-6>1E\=n1c6s@0JFpb$6XOM+?^i8
AS4t\;IO)c.!INt%13OO+<YkN4Wnf[DCB]d.4Q_t0fLpA1+H6G/Kcc,0f_6P.1HV,+Enqk+EnqY
+EM77-o*8#G;LEm+Eo[c/Kf6l.4H_p/MSk9.T@NB+>GZ,3&`8q$6UI8+?^ik+=eRUBl5=S.O]Kt
+=eRY2(9t(-nR202`)X/+>>E'.T@i+$6UI8+?^ik+=eRUBl5=S+=\LX2(:"'0J5+1<$3\61,(UA
.1HV,+Enqk+EnqY+EM77.!IEq.O[#.1,^7,+>YW,.T@i+$6UI8+?^ik+=eRUBl5>C1FXe%0J5(0
<$3\62_d':%144#G9B$kG9ACYF(oM?1+F\r1a":kG;UKp+EoOh+=eRY1+=\$0eP42<$3b82).$=
%144#G9B$kG9ACYF(oM?1*A%hG;LEm+Eo[l.OZl&/i5%W+>"]l3&W2p$6UI8+?^ik+=eRUBl5=S
.O]Kt+=eRY2'=InG;1Nh/Kf6m.4Q`$0fL4,+>>E*.T@i+$6UI8+?^ik+=eRUBl5=S.O]Kt+>"^[
0e"4q+Eo[l.O[#,3?Tgp0J5(0<%/7`+<YkN4Wnqk.j/nIDCB]b+=eRY2(:"'0J5(0<$3\62DZck
$6UI8+?^ik+=eRUBl5>C2'=InG;CZt-nR,*0e--F/Kco1.1HV,+Enqk+EnqY+EM77-o*8r1+=\$
0fL4,+>>E&.T@i+$6UI8+?^ik+=eRUBl5=S.O]Kr+=eRY1a":kG;UKp+EoOh.4Q`"/hnhT+>"]j
2CT(B+<YkN4Wnqk/Kci'0e.6YDC@7i.!IKj.j0$n.3L,`G;CZW$6UI8+?^ik+>"]j2)m(,Bl5>C
1E\7l1+IK&.1HV,+Enqk+EnqY+>GW-.W]<A-o*8#G;LEm+Eo[l+>"^[1FWb?+<YkN4Wnqk.j,rm
1FdH[DC@7iG;1NU$6UI8+?^ik+>"]Y2*!.-Bl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6n.1HV,+Enqk
+Enq[+<WNr.W]<A-o)np+EoXb.j0$l+=eRY2(8tA+<YkN4Wnqk.j,rk3%Au`DC@7i.!IHi/Kf6l
.4G]5+<YkN4Wnqk.j,rk2C`c^DC@7i.!IKj/Kf6n.3L,`G;UfY$6UI8+?^ik+>"]Y1H6k*Bl5=S
.O]Kq+=eRY1a":kG;Ufu%144#G9B$kG9AI[+>Y`%F(oM?1+F\r1E\1jG;LEm+Eo[l.1HV,+Enqk
+EnqY+<WF".W]<A-o*8r1FWb?+<YkN4Wnqk.j,ri3@])aDC@7i.!IKj.j0$n+>"^[0e"4q+EoUj
%144#G9B$kG9ACY+>Pi)F(oM?1+IK).1HV,+Enqk+Enq[+<WEp.W]<A-o*8#G;LEo+EoOh.1HV,
+Enqk+EnqY+<WEo.W]<A-o*8r1a":kG;UKp+EoUj%144#G9B$kG9ACY+>Gc(F(oM?1+IK&+>"^[
1E\1jG;UfY$6UI8+?^ik+>"]Y0f:G%Bl5>C1*A(iG;UfY$6UI8+?^ik+>"]Y0f(;#Bl5>C1E\1j
G;UKp+>PEj0e!P=+<YkN4Wnqk/Kc/j1+I?ZDCB]d+>"^[1+<Y>+<YkN4Wnqk.j,rh0e.6YDC@7i
.!IHi/Kf6o.4G]5+<YkN4Wnqk/Kc/j0Ih-XDC@7i.!IKj.j0$j.3L,`G;UKp+EoUj%144#G9B$k
G9AI[+<WWnF(oM?1+F\r1a":kG;13j+Eo[l+=eRY1FWb?+<YkN4Wnqk.j,rW2_&l_DC@7i.!IKj
.j0$n.3L,`G;:TV$6UI8+?^ik+>"]Y+?(ckBl5>C1E\7l1+IK&+=eRY1+<Y>+<YkN4Wnqk/Kc/Y
2_&l_DC@7i.!IKj.j0$n.3L2bG;:TV$6UI8+?^ik+>"]Y+?(ckBl5=S.X*Ti.j-SsG;LEm+Eo[l
%144#G9B$kG9ACY+<WQlF(oM?1+IK&+=eRY1FWb?+<YkN4Wnqk.j,rW2C`c^DC@7i.!IHi.j0$m
+=eRY2'=InG;1Nq%144#G9B$kG9ACY+<WQlF(oM?1+F\r1a"@mG;1Nh.j0$l+=eRY2(8tA+<YkN
4Wnqk/Kc/Y2C`c^DC@7i.!IBg/Kf6n.3L,`G;UfY$6UI8+?^ik+>"]Y+>t]jBl5=S.X*Ti.j0$n
.1HV,+Enqk+EnqY+<Vda.W]<A.!IHi/Kf6m.1HV,+Enqk+Enq[+<Vda.W]<A-o*8#G;LEo+EoOh
+=eRY2'=InG;:TV$6UI8+?^ik+>"]Y+>kWiBl5>C2'=In1+IK&.1HV,+Enqk+Enq[+<Vda.W]<A
-o*8#G;C?l+EoXk+=eRY2(8tA+<YkN4Wnqk.j,rW1b*Q\DC@7i.!IHi/Kf6l.3L,`G;UfY$6UI8
+?^ik+=eQW+>bQhBl5=S.O]Kt+>"^[0e"4q+EoR`.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A.!IHi
/KceuG;L`X$6UI8+?^ik+>"]Y+>bQhBl5>C1E\7lG;1NU$6UI8+?^ik+>"]Y+>bQhBl5>C1*A.k
1+IK&.1HV,+Enqk+Enq[+<Vd`.W]<A.!IBp%144#G9B$kG9ACY+<WHiF(oM?1+IK)+=eRY1FWb?
+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IKj.j0$n+>"^[1FXa^$6UI8+?^ik+>"]Y+>YKgBl5>C1E\7l
G;13l+EoRi%144#G9B$kG9AI[+<WHiF(oM?G;:9k+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r
1a":kG;Ufl.j0$l+>"^[1+<Y>+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IBg.j0$m+=eRY2(9Y"+EoR`
/Kf6n.1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;LEm+Eo[l+=eQj.X*Zt%144#G9B$kG9AI[+<WHi
F(oM?1+F\r0d%thG;LEm+Eo[l+>"^[1+<Y>%144#A5I>]6tL!R4Wnqk0-E&/0JG170JG+5%144#
IXZ``F`_&6Bl@lrBl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys=/2bnL;@<?4%DBMMg
+AZH_BlS90FEo!)Aft&dAKXEOCh[j1Bk&8;+A"k!+>Gl90Ha;*EbT*+%156]4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$:]&SD'2GZGp$'pDJj$+
-Z^DSAR]^pFCcS!BQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m103ou>FEDJC3\N.(
AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL.4u&:%16'JAKYT'Ci"$6Bl7Q+@;KRpEbTW/D'3>,
D/aW>ATJu9BOr<(F`_&6Bl@l3Bl5&3@VfauF_PrC+E(j7FD,5.ARfOjE-,f(/0JYE+:SZgAS6$p
ATKCFAoD]4@3B2sG%GP68jlWX+CT;'F_t]-F=n[Y+A$YtBlbD+@<6!j+E)-?FD,5.%14R>3B/]8
8O6?!<+oi]Ed8dGAfsikFCB9*Df-\+DIakfARopnFD5Z2/h.;;%16'JBlbD?@;L't+DGm>FD,5.
@rHC.ARfgrDf-\>D]iJ-E,9eBFDi:DBOr;\76sZkG%#30AKYo'+EV:.+E(_*BlS90FEn<&FDi:?
@WZ$mDBO%7AKXrM<CJ$K@VfauF_PrC/0K.NFD)e*+EV:.DfTE2Bk(Rf+E2@4@qg!uDf-\9Ag"sq
0J5%50d'nF@j#i(@kJ2t%15CB+DG^9D/XK;+Cf>,E-686EZf=ADeF*!D/F!)B-;#!DJ+*#B4Z-8
+EV:.+EVX<B5_[+D.Rg0Bk&8tF`(]2Bl@m1%14M)Bl5IE@rHE>+EV%0/0JMG+CT(=.3N>B+EV:.
+E2C5F_#DB@rGmh+D>>,ALns4F)uJ@AKZ#%A8,Ii+CT;'F_t]-FE7luF`)#,F)rIBFD,6+GA2,0
+DG_(Bk(RnARmD&$4R>6DBO%7BlbD,@<6!2+EV:.+D,>*@;I',ATN!1F<G:=+Cf>-G%G]9ARlot
DKKe>A7]CoAS#p*AoD]4@rH7.ASu3nDI[61%13OO<-!+m+AZH_BlS90FEnul+AHEUDBM_aCh[m3
BlnVC.j3-%cF")g%17Q5ILQW^AS*t4$:/`TEc5i6D/!KgC`l#[B5_g)FD,N4+>"]kDIakYA8-."
Df-[G0f_6R.1HVVARTI!9k@mYEt&IQF^csG=(uJeD..="/OF#bCb-]#DIY:.$;"/_:*;5B3A`NJ
3ArHI0eG*h$4R>?AS*t4$:T2YCgh3iFDl2F+B*E%E,9*&ASuT4FDi:DBOr;PF*)G@DJsB+@ps0r
6#:CHDII#t-o!_B1+<Y>E%s(%+EVNEE%s((%15[*6;AXW/NGUE2_[!=2E39I%17Q5ILQVn$:ScB
D.RU,Et&Hc$8F.U?qNgd<+$"uF*)G@DJsB+@ps0r8jje>F_tT!EZet4EZf"/G%GP6A79Rk06CoF
AKWC#<%/7`1+j\W<+$#3Bl.E(Amo1kDfQt7DBMPoCh[<q+Ceu#FEMV<ATKCF@rHC.ATMg/DIdI!
B-;;7+A,%$<%K/4ARfLoDIm?$Ao_g,+A+CC0JG+5%14mD+CITKB2ieI@:WaP<+oue+DGm>@3B&u
DK]T3F(oQ1+D,%lFDl1BF`V,)+EVNE@rH7.ATDl8A7]CoAS#p*Bl8$2+D#P8Bm*p$ASuT4%144#
+ECn$Bjkn#/g)9<AKYi4CijB1Cj@.6AS6$pATJu'Gp%3BBlbD/@:OCtEZfIB+E(_2@;0U%FD,5.
AT;j,G%#2uDKI"A@:X(\DK@E>$8a@X@!>ub:3CYeFD5Z2+EM+7Bk;?.@:NeiD09Z'FDl1BG%#E*
@:F%a%14sF+CKCJ?jTP=@;[3!Ci=3(@<?4%DBNk0+EV:.+Dl%8DBNP3Df$V=BOr<-F`&f@$8sLZ
@!=A6#u+u>DBO"=Cgh?,@;^"#@;L3A%15$H+CKCL?jTP=@;[3(F`(W.+CT/+D..7+/e&.I/g+PG
1ggV`F`(W.+CT;'F_t]-F<GL6+DbJ.BlnK.AM+E!3A)Es@!=J9#u#8TB5)I1A7Zm%AftN'@qBOg
Bl7Q+DJs&s+E(j7CisW(EZf:@@VKp,Df-\>BOr:q$6UH6+D#&!BlJ0.@j#3$+Dk[uF*2M7A0>K)
Df$V=BOr<'ARTI!AT;j,DJsbBDe:,&@<?'5%14gD/g+P47<!<9AS5BW:3CYeFD5Z2+DG^9ARfOj
E-,f(@;I'&Df03%FEM,*+D#e:Eb0<5ARlotDBNJ$B6%QpF"Rn/%13OO:ig2jA8bsrA7ZlLChI[,
Bln$*+B38%6Z6g\F`_1;<+ohc:3CYeFD5Z2+A$Gn:L\-SEHPu;Gp%$;+EV:.+@TdVBlJ0.@grcW
DfQt/DL!@;Bm+'*+A,%$<$4JIB6A'&DKIK?$4R>kIXV_5+B0I+4Wl.F6r[,./Kcf*2)-sF2(9Y$
+>Yo51,TLJ+B1*=4Wm]H.Nh\"$6W;(+?^iH+=\L51(=R"$6V`JB2ieI@:UKD+>YW)1bgjJ1,_!G
2)mTT3AWE50-Du/0F\?u$6XOI+?^i8AS4t\;IO)c-o*eA/iY^B1H$@++>bo41,_'D0ekC>3%@lM
+>"]i/het63AE?G.TA/G.j.eI0/5FH1cI6?%145%1*A_&6tL"1Dc1"S.O[)12_HsC2`EK7.j-W*
3B9)P0JtO?1b)HI+<W6Y0J5%50JPI>1Fc?Z+>"^81G:O<0JG17.1HV,G;C@)+@KdR<,YZCA1Au^
1Gg^E2DR9P+=eQk2`EHO3%d0K2`!HR.T@N@+>>E%0K:sN2_lj^1*A(i<&60b2DR-D.1HV,G;LF*
+@KdR<,YZCA1Auf1G1FA0f^s2+=eQk3&<<D1+k782`3BN.T@NB+>>E%0JbUH1,UO\1*A(i<&60`
1,gsI0I[G<+Eo[c4Wm.(B2ieI@:Ui90etU=0JkUD1*A.k0f_$H/ho.?1,^j:<$3;+.j-Mu0JG79
2_[3@<&,RH+B1-M1c6s@0JFpb$4R=bG9B$k@rHE:G;Ug!-oj%:1,U1)+?1u6.T@i+$6XO84Wnqk
.j/>?F!rdn.!IKj/Kf6l+=eRY2(9t(-oEq>2BXRo1G1C3<%/7`+Enqk+EnqY+Cf>2-o*8#G;LEm
+Eo[l.4Q`+2`Dj2+>>E*.T@i+$6XO84Wnqk.j/>?F!rdnG;Ug!-nm82.T@NB+?2A=.1HV,G9B$k
G9ACY@rHE:G;:Ts-oEh(/Kc`"0e--O%145%+?^ik+=eREDf[=N1*A(i1+F\r1a"@mG;13j+Eo[l
.4Q`$1,L+*+>>E+.T@i+$6XO84Wnqk.j/>?F!u5g+=eQi.O]Kt+=eRY2(9t(-o!J;+>"]i/hnhT
.1HV,G9B$kG9ACY@rHE:1+F\r1a"@mG;13j+Eo[l+>"^[1+=\$0J5.2<$3b83Ai5p$6XO84Wnqk
.j-T$0IgRNF!rdnG;LEm+Eo[l%145%+?^ik+>"]p0IgRNF!rdn.!IKj/Kf6l.3L,`G;UfY$6XO8
4Wnqk/Kco,.V!C<-o*8#G;LEm+Eo[l+>"^[1FWb?+Enqk+Enq[+>Yf'@rHE:G;C?l+Eo[l%145%
+?^ik+=eQi2C`3TF!rdn.!IBg.j0$m+=eRY2(9Y"+EoUj%145%+?^ik+=eQj1+HdPF!u5i+>"^[
1FWb?+Enqk+EnqY+>Pl*@rHE:G;C?l+>PEj1a":kG;UfY$6XO84Wnqk/Kcf*.V!C<-o*8#G;LEo
+EoUj+=eRY2(8tA+Enqk+EnqY+>Gc(@rHE:1+F\r0d%thG;LEm+Eo[l.1HV,G9B$kG9ACY0f(:h
Df[<^.O]Ks+=eRY1a":kG;Ufu%145%+?^ik+>"]j1+HdPF!u5g+=eQi.O]Kt+>"^[0d%thG;Ufu
%145%+?^ik+>"]j0IgRNF!rdnG;LEm+Eo[c/Kf6n.1HV,G9B$kG9AI[3%AEVF!rdnG;13l+EoUa
.j0$n.1HV,G9B$kG9ACY2_&<UF!rdn.!IEh/Kf6l+=eRY1a":kG;Ufu%145%+?^ik+>"]p.V!C<
.!IHr%145%+?^ik+=eQp.V!C<.!IEh.j0$n.1HV,G9B$kG9ACY2_&<UF!u5g+=eRY2'=In1+IK&
.1HV,G9B$kG9ACY2C`3TF!u5i+>"^[1+<Y>+Enqk+EnqY+>kWYDf[<^.O]Kq+=eRY1asP!+EoUa
.j0$n.1HV,G9B$kG9ACY1FcmQF!u5g+=eQi.O]Kt+=eRY0d%thG;Ufu%145%+?^ik+>"]l.V!C<
.!IEh.j-Ss.!IKj.j0$n.4G]5+Enqk+EnqY+>YKWDf[<^.O]Kt+=eRY2(9Y"+EoRi%145%+?^ik
+=eQj.V!C<-o*8#G;13j+EoXk+=eRY2(8tA+Enqk+Enq[+>YKWDf[<^.O]Ks+=eRY1a":kG;UKp
+EoOh.1HV,G9B$kG9AI[1FcmQF!u5g+=eQi.O]Kt+>"^[0e"4q+Eo[l%145%+?^ik+=eQj.V!C<
-o*8#G;13l+EoUj+=eRY2(8tA+Enqk+EnqY+>YKWDf[<^.X*Ti.j0$n.1HV,G9B$kG9ACY1FcmQ
F!rdn.!IKj/Kf6l.3L,`G;UKp+EoRi%145%+?^ik+=eQj.V!C<.!INk/KceuG;1NU$6XO84Wnqk
.j-Vt@rHE:1+F\r1E\1jG;L`k.j0$n.1HUn$6WkJE-"EYB-9>[G9AO]1H$p@0JG17%145,IXZ6V
C3"$0ATMF)1,2Nj/h1g\C3"$0ATMF)+EK+d+EM+9F`8IDBldj,ATT&6Ec5](@rs=4$4R>PDe!p1
Eb0-1+=CW,F(H^.$4R>;67sBsDdd0!-Y-Y-@4u\ACh\!&-OgCl$=[O[@rl!kC2[Wi4ZX]I3[cC(
Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ciYF`_[IF`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^E
De't<-OgCl$>OKiF'iWrDe*3<3Zr0UA7o7`C2[Wi4ZX]5EbTT+F(KG@%13OO;aFGQ8PMWU?YO7n
A7$HB3ZpLF-Y@LCF!hD(%14IsC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt+Cnr&FE/`O%13OO:-pQU
F(KG9F)?&=H$!V<+E_a:EZf./H#k)[+ED%7FCB33+A*buD]j.1CLnW"AnGUaF:ARuD/XQ=E-67F
-ZsKAE_BthF!,L7F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrOBldj,ATUpnATCFT
H#k>^+Eqj?FCcS0E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\a@De*KfBkhQs
?S!QIE,ol3ARfg)F(KH9E$l)%%16oi@:UKqDe*KfBkhQs?ZKk%ATMF)<HD_l94`Bi1,Vfn/g,:X
ATDQtH#kTJAnMP[:-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>Fl
F_PAtF"]n!DJ!Tq01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9
FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU
7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',
AT24$06LuQA1hS2F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`
C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@
%15is/g)?*FE21J;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q
2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$4R>31-73P;Is]RCLnVUF`MM6
DKIsVDdd0!C2[Wq?YO7nA7$H`+>G!ZFEAWQ@WcC$A7$]8C2[Wq?YO7nA7$H`+Cf5!@<*J<-OgDM
FE21J7P[%[4&]^4+@C9lEb0-14*#Bb-ZF*@EbTT+F(KG@+Bot,A0<73F`_[P+BosE+E(d5-RU$@
+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA
-OgDP1HR<Q;IsijBl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%
+A,Et4"+i^A8c?./0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\
4%*XhF_;gpF`'9O@WHU/+=ANG$:Zp80fr?GF*&O'D/X3$4#A(#FEAX?De*KfBkhQs?O[?@BPD(#
.n2EY0fr?GF*&O)DJ=2S0d(LYF<G=:A7o7`C2[Wi/14e9F)Y].@;B4kD/X3$-OgDP2`i`U6uQRX
D.RU,+@C9lEb0-14#%juFEAWQ@WcC$A7$]8C2[Wq?YO7nA7$l8?Y"(b-N                 ~>
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
zz=:zz,'u_tonight intr3p julfrcal loadstars meanobliquityT0 meanobliquityT1'
zz=:zz,' meanobliquityjd0 meansid0 meansidjd0 nnth0 npth0 nth0 nutation_lon'
zz=:zz,'gitude_dPsi parse_iau_named_stars parsecsv parsetd rfd riseset rise'
zz=:zz,'set_calc round sin sind smoutput zetzthT0''),<<;._1 '' risesetUtils J'
zz=:zz,'2000ymfd atan2b dsfrhms fdfrhms meansidymd0 nutation_obliquity_ecli'
zz=:zz,'ptic_dEpsDeg rjd tabit yyyymmfd''                                   '
zz=:702{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fC.0+>P&u+>kl0+>GVo1bpn.Bldj,ATU[6/h1mUF(KE(F<GWV/KePAD/aW>AKZ#-F(HmFFE1f-
F(o_=@;]TuF(KG9FD5T'F!,C5+A"k!+DtV)ARlp)FCB32/e&._67r]S:-pQUG%G]'@<?4#3Zr-S
FCfK)@:NjkGAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9N@<Gq!Df09%BQP@K
+DtV)ARloT5uf%KFCB32+EhI?Bjtmi+EVO>BkM+$%15is/g)9QDdd0tFCB32+<VdY+Dbt)A9/l6
Bldj,ATT&9FCB24A79Rg%15is/g)9WBldj,ATT%;+<VdY+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'
F!,C5+EMX5EcVZs:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\KK_$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>P`i@<++_+=Lr4F^K6/DJ<`sF=A>@A7T7^%13OO@rGjn@<6K4-ZWpBATMF)-OgE'
Bldj,ATUpoBl%ic67sa.Bldj,ATT&:/M/)TDf'H9FCcS8Bldi:+EVX4DKBN6+CT.u+EM+9+EV=7
ATJu4AfsZ2<?Q0fD.R6#F*(i2F"Rn/:-pQB$;No?+Eh=:@UX@mD)reRDKKH1Amo1\+EqaEA12LJ
3XlEk67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'Ci<`mF*(i2F!*%WCi<`mF!,L;F(KE(F<GXH
@<*K$@<>oe$;No?+<Y]=F(KE(F<D\K/Kf(JF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-Du
$;No?%15is/g+YEART[lA3(hg0JYG$@<+%^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGjn
@<6K4-ZWpBATMF)-OgC                                                       ~>
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
0ea_)+>P&u+>Po60lguLATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
DJsB+@ps0r@;KRpEbTW/D0$-nFD,*)+Cf>,E-686+EV:.+ED1;ALnsGEa`j,BlkmK@;]TuF(KG9
FD5T'F!,C5+BqE'<@r)sD.R6`-tm^EE-"&n06_Va/nna:/oPcC0.@>;F*(i2F"SRE$4R>ABOr<'
Dff]:@<?4%DBNP0EZek1D/aE7Bl7Q+FD,B0+D5_5F`8I;F!,RKDe<p(A1e;u%14gB+Ad)sG%kJu
+CQBBEb/ioEb0,uAL\g:D/a<&D.RU,@<?4%DBNP0EZed59LV6B1a$aXDeF*!D'3q6@<;qc+<VeI
AT2I"@psIjF!,R<AKXSf@rGmh+EM47GA\O:ATD?7+A!]"@;^00@3@%5ASc1$+EqaECh,"<E,ol0
Ea`eo$6UH6FD,*)+DGm>DJsV>ASuU(Eb0'4+EVX<G%kB$/0JJAATJu8Df''-BPD?s+DG_8ATD@'
FD5W*+CT.u%144#+DGm>F)>?%C`m;,Dfo]++EV:*F<G:>+Ceht+C\n)ARTXoCj@.3A867.FCeu*
@<3Pb76s[*+DkP/F`M&7/e&-s$8O4V6"FMHATMo8Df0,/De:,/Gp$a<@;L!-De:,%@;KaoDJ()1
F`\a7Cht59BOr;qEbT0"F<GI0D.R6#F*(i2Et&I!+<YiAF(o*"AKYT*Df$V6Gp$U>EcP`/F<GC<
@psInDf-\9DBN@1B5)O#DBNIuFCd'6$4R>:@;^?5De:,6BOr;pChI[,Bln$*F!+n3AKZ)'CLqB+
Ao_g,+A-3RDBMYbAT`&AF!+q1DegIF6$%-gDf0K1Bk(Rf+@0gVDfTQ6BPhf?/e&.R+AbHq+Cf>/
Gp%$;+EV:2F!+q1DegJ0F!+n7@;0Od@VfTuBOu3q3XlE*$<q1cFDu:^0/%$J3&!*I0K1V,F"UmA
@q]S"AM.nAB.l"o055N>D0%@=F*)G@DJsB+@ps1^ChI[,Bln$*F)#8pDJ`rrF`T8t3AE0m-tm^E
E-"&n054iS0JYUA2_K5o/n&d1BPDX$/oPcC0/>47Blmp'F"^sCFE2;;Df'2u@;K@gB5_g)FD,N4
C1UgkD.R:$F"o[80eXsb$4R>NCiaM;BOu3q3XlE*$<q1cFDu:^0/%NnG:m<@@<uj0/n8g:069?l
4`b^cBlIO"DejD@EbIUT?SXPd1I4WE@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgDF?N6-@;[Si
AS$"*-?<[04_/M=@X2d(DIm0rEaN9oDei]7>psB.FDu:^0/%NnG:m<@@<uj0/n8g:069?l4`b^c
BlIO"DejD@EbIUT?SXPd1I4WE@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgDF?N6-@;[SiAS$"*
-?<[04_/M=@X2d(DIm0rEaN9oDei]7.1HUn$;P_c@<?4%DBNA(B5_g)FD,N4+CT;%+D,Y4D'2GZ
Gp$'pDJj$+-Z^DOBlmoI%13OO>A/,#E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6F
A7^!<E+j2r-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2>%13OO
9jr'XA8c[0+Eh=:F(oQ1F!,C5+B2ceDImi9F!+n-B5_g)FD,N4+CT;%+EMXCEb/c(Bl5&8BOr;Y
:IH=5Ap&3:?m&lqA0>9&FD5Q4?m&uo@ruF'DIIR"ATJtG/M/)dAS!n3$4R=s/g+P>F`_&6Bl@lr
Bl79oDf03%FEM,*?XuuSBjY^f?k!GP$8O4V?uC+/@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1
Bk(L\7<!<9AS5@eA7,iR%16fe3XlE*$<q1cFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$
D/aPL@Vfsl05Y-=FCfJGAp&3:/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$
D/aPL@Vfsl05Y-=FCfJGAp&3:/no'A.1HUn$<q1cFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl05Y-=FCfJGF`_>6F"V0AF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnF_u)=04Ja9@P;S,F*(u606MANCi_4CC3(g5$4R=O$:JHAFC?:k+=PO"<%/r(F!+t2D/aW>
ARlp+F(oN)+E278H#@P;Bjkg#AU&07ATMp,Df0V=@X0(bF)Y].@;?uoDIakaAS$"*/0K"FANC8-
%16<QFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYi"
-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=/nf?DCaff#
%15BDD..I#A8c[0+Eh=:F(oQ1+E(j7FD,5.6tL1V@3AMl.*e&V.3N&8B5_g)FD,M6BlbD2DBN>!
F`_\4+EM+*3XlE*$8F.U?uBCo@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys=]
%13OO%166VFWb1&DBNJ(F)Yr(Gp%3BAKYhuEbf3(GA\ODAS,LoASu!hA0>;iDfp.EGA2/4+EV:.
+A,Et+D#e:Eb0<5Bl@m13XlE*$@[GQINWt[/nuMW%16oi@:UK.B4YslEa`c;C2[W1%17#a+?MV3
Ap&3:+E_d?Ci^s5$;No?+Co2-E,8s.+DkP-CLh@-DBNJ.@s)X"DKKq/$8`l9Ble594!8r(5U\H9
A8Z34-8%J)-Z4'K@<?4%DI4bQ-Z3@6@:(Ak$@[GQINT(,%15g<DL!@9G[YH.Ch7Z1F(fK9Bl7Q+
BQ&);FDi:EF(HJ;@<-(#F`S[5EbTT+F(KH$+EqaEA9/l%Eb-A-DBO%7AKXT@6m,lLF`_\4+EV19
F<GXIBlmo/?uft&ATMF)?nNR)DflKr@ps6tA8-+(CghT3@;Ka&FD,5.FCfN8+Cei$ATJu<Bln#2
FD,5.8l%htAU&07ATMp,Df0VW%13OOIXZ`p+F>4`C*7p6$8Wf;Ec<-KEbTT+F(KG@+<Ve%67sC&
ATMr9@psFiF!,17+EM[>FCbmg%14m6A8-+(+=D2DF(KE(F=/1R:-pQUA8-+(CghT3FCfN8+EM[>
FCbmgIXZ`p%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVOEbTT+F(KHA+A$HmATDBk@qC&t$4R>kIXZ_g
HQXqU+FO\++<YW3EcYf!Bjl-kDIIBnA7'D"@<-E3+<VdL:-pQU@rH7.ATDl88O6?!@WZ*r+EVNE
@rH1+D/LJ,Bk)7!Df0!(Gp"4P+<VdL+<VdL+<VdL+<V+#+<Y04Ch-me@<Gpp@;TRd?ZU<tEcW?G
+<VdL:-pQU8O6?!DIIBnA0>r8@<*K,BleA=FDi:2FCT,0BOtU_ATAo8@:F%a+<VdL+<Vd9$@[GQ
ILQVn$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=          ~>
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
F(TH'A9/l,D0'<0A9/l-@<Gq!Df09%BQPA2DKKnTE$/t8@:XG$@<-E3D.R-nDdmNsEHPu;GuQI?
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
Bk(L\7<!<9AS5@eA0>i3C3"$0ATMF)+ED1;ATMF)<HD_l94`Bi-RgSp4>J$:2'aq21,CU?1,pmC
2*!WP0JPRI1a"P-1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,(=;3B/lP1c[6J2]sk01,CU?1,pmD
1,(I<3A<EK3?U(21,CU?1,pmC2_d*H3&ENJ3$9t11,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?1,(=;
1GppA3A`NK2'=Y.1,CU?1,pmC2_[!E1G^jE2BXb/1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,pmB
2Dm<K2E!BK1a"P-1,CU?1,pmC2`*6D2D[6L1a"P-1,CU?0KCaC0eb@>2)[-D2BXb/1,CU?1,LU@
1,:RC1H@3G2'=Y.1,CU?1,(=<1bgdD2)7-O2'=Y.1,CU?0f^jE2`WlU1,:gL3?U(21,CU?0f^jF
1H%!D1H70F3$9t11,CU?1,:I<2`3QN2DmHN2]sk01,CU?1,:I=1H$sB3&**C2BXb/1,CU?0K:[B
0JYID2E<HN1E\G,1,CU?1,:I?2_d9G0f1X?3$9t11,CU?0fCX@2DI!C3&ETO0d&5*1,CU?0fL^A
1-%$K1H@<N3?U(21,CU?1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU?0KCaD
3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT2'=Y.1,CU?1,:I?
2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU?3%d$H2`EHH3B&c;1,(I>0JbI@/i5I@
2)?s@1c$j/1,(I>0JbIA/i5:@0K1aI1,h$41,(I>0JbF@/i5C?2)-dC2D@'41,(I>0JbFA/i57=
2_m3J2`<E61,(I>0JbF@/i5C=0f:gH1cI?91,(I>0JbF;/i>XF0JbL@1c%$41,(I>0JbCC/iPL=
0fCsL2DmB81,(I>0JbF;/iGC;0JGIF2`*B71,(I>0JbF;/i>IC2Dd9G0f1".0JYF<1GLmB2_[0J
1GU^G0Jjn-0JYF<1GLmB2_d!F0f1UB1H?R50JYF<1GLU:2E<ZQ1H@6G2DZI20JYF<1GL[<2)@!G
3&iTJ1,pC30JYF<1GC[=2Dm3K0fCpG1,^710JYF<1GUg?2)6sF2)%$G2`;d60JYF<1GUmA2)[BJ
3ANTM2]sk01,CU?1,ggB2)I'G1-%6J+>PW+1GCU?3%d!F2`!HJ3B8o=1,(I>0JbCC/i>@;0fCjJ
1H7051,(I>0JbCC/iGXK1c@-D1,1X/1,(I>0JbI=/iPLB2E!9K2_d351,(I>0JbF?/i5CF1H$pF
1,L+/0JYF<1GL^=1c%!D0ebLG2)cX50JYF<1GLa>1c@*D1,:UB2`Mp80JYF<1GU^<2`NTM2_d6J
3&2U30JYF<1GUpB1c79Q1GCOD3&Da50JYF<1GUpB2)I<Q1GC[C1cHO40JYF<1GUX:1c[NQ1Gh*G
2E)a60JYF<1GUpB2)6j@0f^pI1H?R50JYF<1GUpB1cI-F2E3NO0fU:20JYF<1GLd?1b^XD0KCjA
2`2^50JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D2)@$F1c?I30JYF<1GUpB2)I9I3ANEN
3B83;0JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G0fCgG2DcO30JYF<1GUpB2*!TP2`!HL
1GL"-0JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUa=1c73O0JbLD3B&'90JYF<1GLmB2E*WV2)6pH
3B83;0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1GU^<1c@*G1bgmG2E)a60JYF<1GU^<1c%$E0fUmA
1H$@20JYF<1GUd>2E!HN3&<<E2`Dj70JYF<1GU^<2E*?M0JPC>0fU:20JYF<1GLjA2`3QQ1,(LA
3?U(21,CU?0fL^A1-%$K1H@<N3?U(21,CU?1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK3B&oP
2'=Y.1,CU?0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F2*!ZT
2'=Y.1,CU?1,:I?2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU?3%d'J0fUjH1H@35
1,(I>0JbI@/i>F=0JG4<1,Ld01,(I>0JbID/i,@D3&EKN1,_*71,(I>0JbI</i5@C1c@0L3ANB5
1,(I>0JbI</i5@D0f:dC2E;m80JYF<1GLmB2)6sJ3&NNO2)?@10JYF<1GLR92*!TR3&ETT2`2^5
0JYF<1GLR92*!TU3&<6F1H$@20JYF<1GLR92D?sD2)7'L2Du[50JYF<1GLR92)I0K1c7!B1a"P-
1,CU?0f^jF0K1jF1,:jD1a"P-1,CU?1,(=;2)$jC2D[3H2]sk01,CU?0f(F>2E3KN0ekLA2'=Y.
1,CU?0f1L?2E3WO1GUX@1*A>+1,CU?0fCX@1Gq'M2_d9O0d&5*1,CU?1,pmB2D@-K1cR6I3$9t1
1,CU?1,ggC2_[*K3&``L0d&5*1,CU?1,pmC2`N]R3&NBK1*A>+1,CU?1,pmB2E*EP0KD-M+>PW+
1GCU?3%d*C1-%3K1GpjC+>PW+1GCU=3A*3K3A`WM0JY@?+>PW+1GCU?0ePC>2)[?I2`EHL+>PW+
1GCU>1bLUC1H@HL0JbUD+>PW+1GCU>1bLUC1H$sH0fCjH+>PW+1GCU>2(g^E1GgjB3A<6I+>PW+
1GCU?1G1IC1c[BK2).'M.4cl01*AM$1,(I>0JbCC/i>@>0KD*L0Jb[21,(I>0JbCC/i5RI0f:sJ
3AN?41,(I>0JbI>/i,IH1GpmB2_m?81,(I>0JbFC/i,LC1b^gA2)@371,(I>0JbF=/i5IE0fUpC
2`;d60JYF<1GUmA3AE6H2)d6K2E;m80JYF<1GLX;1cI6J2)mEJ2DQC10JYF<1GUpB2*!QR2)R0E
0KC720JYF<1GUpB2)mTQ2*!NP0K:110JYF<1GUpB1b^^A3&<BO2_cF10JYF<1GUa=1bpsD3A<BL
1,U100JYF<1GUpB1b^pJ2`!9N2_cF10JYF<1GUpB2)m?N1G^a?2'=Y.1,CU?1,CO>1,_!F2E3BL
1+=b&4>J$7,Vh&/1GCU=3%d'F0etLA2`*9I+>PW+1GCU?3%d!G0JkdF0KCpF+>PW+1GCU?3%d'J
1,(ID0f(L>+>PW+1GCU?3%d$A3&NNL2DI0L.4cl01,(I>0JbF=/i5LH3AE<L0K(a<0f:RD1,C^G
1c.$I2Dm0I1c%!=BeD.`0e"Y%4>J$60dJM.1,CU?1,ggC0K:dI2)dEN1E\G,1,CU?1,LUB0JbUF
2)[<O3$9t11,CU?0KCaB3&iZQ3&`NJ1E\G,1,CU?1,1C<1,1X@0JbOD1*A>+1,CU?0Jb=>2Dm<F
2`39D1*A>+1,CU?0fUdB2)[0C3&E<E2'=Y.1,CU?0f1LA0JbI?0JGCE0d&5*1,CU?0ek:=2_Zp?
2_d$I2'=Y.1,CU?0ek:=2`NWL1,:XC+>PW+1GCU>0J5192_m*B2_d*G+>PW+1GCU>0J5192Dd<N
3&r`L+>PW+1GCU?2_HsA3&*EN2`<NL+>PW+1GCU?2_HpD2_m'G2`E]T+>PW+1GCU?3%d'K2`*HL
3ANBF+>PW+1GCU?0eP:C2DI!E2Dm9L+>PW+1GCU=2D-pB1b^X?3&<9L+>PW+1GCU>3%d$F2DHmF
1b^[B+>PW+1GCU>2D-gD1,LaD2_mBN+>PW+1GCU>0eP@C0JG4?0ek[G+>PW+1GCU>0eP@C3&EBG
1,Cd11,(I>0JbI@/iGUE0K1aA1-%?;1,(I>0JbID/i>RD0JYUC1b^a8/1<V7.4cl00I\P$4>838
-p014/3GT                                                                 ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
