NB. JOD dictionary dump: 19 Mar 2023 11:32:39
NB. Generated with JOD version; 1.0.25 - dev; 6; 19 Mar 2023 11:21:56
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


IFACEWORDSriseset=:<;._1 ' cold_iau_named_stars meansidjd0 meansidymd0 parse_iau_named_stars'

OBLIQUITYDMS=:23 26 21.4480000000000004

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset cold_iau_named_stars ddfrdms dmsfrdd meanobliquityjd0 meansidjd0 meansidymd0 nnth0 nutation_longitude_dPsi nutation_obliquity_ecliptic_dEpsDeg parse_iau_named_stars rjd todate todayno yyyymmfd'

VMDriseset=:'0.4.0';6;'18 Mar 2023 18:12:29'

riseset_hashdateurl=:<;._1 '|daef61a2abe1f89b6554bcba15739e61332100625d529d9853393ba41d7b121c|18 Mar 2023 18:12:29|https://github.com/bakerjd99'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


cold_iau_named_stars=:3 : 0

NB.*cold_iau_named_stars v-- convert IAU btcl to column dictionary.
NB.
NB. monad:  cold_iau_named_stars btcl
NB.
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

fdfrhms=:24 %~ (60"_ #. ]) % 3600"_

gT0jd=:36525 %~ 2451545. -~ ]

gT0ymd=:36525 %~ 2451545. -~ julfrcal

meanobliquityT0=:3 : 0

NB.*meanobliquityT0 v-- mean obliquity of the ecliptic IAU in degrees.
NB.
NB. monad:  fl =. meanobliquityT0 flT

NB. units are decimal arc seconds
ea=. +/3600 60 1 * OBLIQUITYDMS

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
ea=. +/3600 60 1 * OBLIQUITYDMS

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
NB.   e0l=. ,dmsfrdd 1 meanobliquityjd0 2446895.5

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

rjd=:9.9999999999999998e_13&round

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1[/1,U10+>Get1bg+-1*AJ5+>Gbs1bg+-0H`,1+>PVn1H-F8+>Pr"3$:(:+?(E#0H`4q2`W!=
+?)"t0f:(12'=V2+>c&#0fC.30d&Fu1cQU40H`8.+>GSn2)$.1+>ttt1,C%20d&80+>u"u1,0n.
0H`)1+>c)$1E\G/+>t>u1E\V!1cHO:+>brI7R9C1=&2^^;fZSnATMF)Bl8$(Eb8`iAKZ28Eb'56
-qQlo6Ub'P;FFH(Bldj,ATT@DB6%p5E)/eo8PrJZ<*;U`;djWaEc62:D..Nt+E(_*BlS90FEo!I
Afu2/AKYPoCh[j1Bk&9"DBNJ$B6%QpF"AGNBl8'8ATKCFF(Jj"DIdfd:JXqk:JsSZEbTT+F(KH6
Df9_?GAhM4F!)l/:JXqk:JsSZEbTT+F(KGB+D5_5F`8HG+<VdL<_Yu&Bldj,ATW*,EcYr5DCcoI
@;BEs@rHL-F<G"0A0>DkFCes#Ch-me@<Gpp@;TRd?ZU<tEcY`/DK]T3F<F.@<?Pam@r*90D]iP.
CisT4+Co1rFD5Z2@<-X(AScHs<%qj.DIIBr@ps0rFD5T'+O63N+DG^9F(Jj"DIdg!AScHs<+L8b
AScHs+O63N+Co%nBl.9p+F.O,E]P=RAScHs<+L7s1,(I>+>Y,p1*A,#+>Gl63?U%3+>GT_A7fjq
D0'<0@:OCnDf0!"+Cno++D,Y4D'3M/F#kEt/iYOC1,U1;+D,.rEbK<2+>Gl!1,0n*B2gR"A7fjj
@ruF'DII?(@qBP"F`M2-F!,(8Df$V.E,T6"+A+CC0JFVDAS$"*+E1sG+?2/<+D4Y-C1JH%F_kZ1
@ps0r0f_*M+>GPm1bLaBB2gR1D.I7!@:OCnDf0!"+Ceu#FEMV<ATJu+Ec5e;AT2QtBHTo&0JG1'
9k@mYF!,F7/g*,03Zr'70R7MG+>Gl62]sh/+>b]10l:K1DJs!#BlS90FEph>D.R-n+E(_*BlS90
FEo!IAfu2/AKYPoCh[j1Bk&8W5uf%ADBNJ$B6%QpF)>JsDJs!#BlS90FEph?D.R-n+E(_*BlS90
FEo!IAfu2/AKYPoCh[j1Bk&8Z@<63mEZf(6+Co%rEb/g'D.R-nDdmNsEHPu;H"pkDD.R-n+E(_*
BlS90FEo!?@r,juFD55-AoD]48p+ra@;[2u@<?''.![6aA7]CoAS#q"ARTItBk/o7ARTI!F(o/r
Eb/Zq+EV=7AKYE'+@gH`ASu^+@qZusDfQt"+=MI`+A,$E.![7YARTItBk1sh0PtB0DBO"7A7]dm
@;I'.Bl.E(@<<V^Eb/g"GA1Q#+D,P4+DQ%8Bjkm%A79a+.![6aBl5&(AS6$pATM^"@;^.#A9i$&
0PtB0DBO"7A7]dm@;I'.Bl.E(@<<V^Eb/g"GA1Q#+D,P4+B_E,+DG^9A7]CoAS#q#DKKPGDJsQ4
@;KY(AKYl%B45mrG%De,AS6$pAKZ&.A7]diC`mh6D.PaNDJjQ00H_r%2E*QS1GLL;2DR!B2E#Gq
FCB9*Df/ouDf03%FEM,*?XuuSBl8'8@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(BlnK.AKY])+Co%r
Eb/g'+=Js)3%uIh@<E]7BOu+&Gq!WRFCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB5Vj6
@<?4%DBNY2+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&8rAS6$pF)rHP0f_3I+DG8,+EM+7Bk;?7
E+*d.ARB.[F^K#pD.R6bF*(i2F%JYt+DtV)ARlp)FCB24Ch[s4+EVNE@WZ*r+D>=pA7]d(FCAWp
ATDL+ATMF)?YEkhBOkOnAT`$0EbTT+F(KG9B6%p5E$043EbTK7+D>2)BIk98F_PZ&+Cno&ALns:
Bln$2@N]f6CiX9$Ec6)<A0>W0Ch[<q+Cno++Du==@V'S%De*9uARfXrG%G]9+=M>MA79b$D^cfP
@;L'tF!,RC+Cno&ATMs3A79b$De!^'G%G]9+Cno&ATJu9D]iS!Gp%!ID.7'sF"AGDDf0`0EcYe7
.!0B<@<?'0H$O[\D/ElqH"CE)+Dl%7FD)e/Ea`I"Bl@ltC`m7sGp%3CD.Oi1AT2[$F(K62@<?4%
D?                                                                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$73+>P&o1E\D41GBq+2]sh33&Mg60d&812DlU33?U%81c-=10H`2.1,<<]Bl%<eEbTT+F(KGg
67s`sF_PZ&?ZKk%ATMF)+ET1e+C]J-Ch+Y:EbTT+F(KGB+CT.u+Co2-FE2))F`_1I%15is/e&._
67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aCghC++EVI>Ci<fj5s[eGF_PZ&3B9*,
4ZX]55s[eGF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn
%17/dEc+$$+=D2DF(KE(F=.M)%159QHV[I,:..Z@4ZX]rBk/>?+<V+#%15is/g+k?+=Lr@AU#XH
BlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+BljdkBOtU_A8,O:3ZoguBl.F+-S7AC
0mc\m78?6B6Ra6-Bl.F++=@U*%159QHZ*F;4$"KtART+[Bk&\AAp&3:+E_d?Ci^sH>9G^EDe't<
-OgCl$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+EM47GApu3F!,O;@59\u+CSl(ATDj6EZeh&
AoD^$F*)FFC2Rs6+DPe4GAqJAF<G[>D.Rd1@;Ts+<_Yt0/9><ADCd.X-S0=KEc*EU?YEkhBOkOn
AT`$0-OgCl$;No?+DG_7ATDlGEb03+@:Njk@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&
DfQ9o4tq=2Eap50@s04_3Zq-_6W-]e@;9^k?Q`umF<Dr-:K(5"-S0=KEc)<n4tq=X5snOG?X[\f
A7$HuF`\`S4DJbPGAqJAF<EY#+F>5K@s0:D14:9_@s1!r+=qD?Fq"cf$;No?+E_X6@<?''<_Ysk
$?g8s4ZX]0/gj[o6mjO,@rcGr$=\-lCh.'uD*9p&FD5T'F*(i-E$-MU%14L2<_Yt0/9><ADCI_0
+=JpjG&:b=/1<V8.m>\7G&:b=/3IBaBl%<jFDVHo4tq>*D/a<0@j#`5F<Dr39gg?[F(96.+:SYe
$?L'&F`_SFF<Dr?F_PZ&Bl7Q+G%G]8Bl@l3/Nt:)4!H:)<_Yt0/9><AD@Hp^$;No?+D58-+D>J1
FDl2F+CoD#F_t]-F:ARP67sB/BPDO0D.G1F?Ys=$.6T^79gM-E:L@OFDe*2tA8-+(+=Lo;F*)80
4ZX]584c`Z:Jt>&-S0=KEc*<W-XU_$-OgCl$;No?+D58-+EVO4D]iS/@s)X"DKH<p:-pQU.!0B<
Df'#9-XU_$-Rh2>+AG-h;GUY.C2[Wi+Co2-E$-QNDe*d'A3Dsr-WEl0:L>J#F(96..4ciRD.G"'
$4R>;67sBnASu("@<?''Ci<`m+EM%5BlJ/'$?BW!>9G;6@j#W0B-:f#Ch4tW3Zr9UF!,O6Ec)<n
%15is/g,:UA79Rk+D>2)BFP;]BOPsq4ZX]0/otNCDCd/BBOPsqA79RkF`M:G%14M)@rcH<-XUOq
F(f)mFCfT8CaUYp3Zoh!F(eu;2)ZRtART*lAnc'm.6D!]Bl%<jFDWHL-nlbu.=E=OBOPsq%159Q
HZX+DCi<f+E-67FF(96./14e<@<6*m@<?('Ebm*G%13OO:-pQUF`:l"FCcS*BleB:Bju4,Bl@l3
Anc'mEt&I)1E\_$0I\,VBl%>i$>F*)+A#%(8PUC=D_;J++<Y`BDfp/@F`\aI@ra^b+=BoU9i*kn
F('6'+DG^9IS)mn92d2I$6UHd67sC%@ra^b+=CY[>\\1f>\[\WCNE`pE-Z>1Ao_X)A6^K5F(96.
/13&aC3(a3$>"$pASGa/+A#%&:.\P1A8a(0$6UI4D/XQ=E-67FF(95R/g)N:8PN#B+ELt7AKY])
+FZpK6VC?*%144#:-pQUF(95R/g+nJ@<?0*-[m^]Bll"C@:O(oBOPCdF"\mlF(96./13&aC3(a3
$6UHd67sC%@ra^b+DPk(FD)dEIP5>JF>%B;@r$-=BlJ?8@V0XqDe(LK/9><ADCd.fBkh]:%16Z_
F(K&t/nAlQ%144#0d'[CF(fK9E+*g/+=C]6F*)G:@Wcd(A0>f.+BM-003(b==<MO"Cj@BNEb0?8
Ec*K=$>"*c/e&-s$>F*)+D,20BleA=F(955A8a(C%144#0d'[C-urm-A0?.H+Eqj?FCcS9BQ&*6
@<6K4F(95"$>"$pAM+E!+<WB]>9J!#Dg-//F)rHOD/"'4Bl7Q+A8-+,EbT!*FD5Z2+EM%5BlJ/:
/NtODF(95"$>"*c/e&.:%13OO@rGk"EcP`/F<G[BE,9H&?U6tD@WcC$A2uY1?O[?+0RI_K+FPjb
:JaJT6qK`g>9G^EDe't<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\t&
Bl%<?3B:FU$=\-lCh-mnBldj,ATV9iDduO//h1=QBl%<eEbTT+F(KH#A8bs#F=f'e@WcC$A0>;u
A0>DsF*)G:@Wcd(+ED1;ATMF)+AbHq+CoD#F_t]-F=n"0:-pQB$;No?+CfG'@<?'k3Zp131,EcU
E\KK_$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>_AT;j,Eb-@@B4YslEa`c;C2[W1%17,eEHPu9AKW@8De*ZuFCfK$FCcg/
$4R>PDe!TlF)rIGD/a<0@p_Mf6"4tNCh-.33B9*,4ZX]55s[eGF_PZ&8k_6*3@>qR+Cf>$Eaa$#
+?V#;5s\t&Bl%<P9K>*n-OgDmDeX*1ATDl8-Y[=6A0>;qDe*ZuFCfK$FCcg/$4R>+0RHSl78?6B
6TmIQA8,Qs0F\?u$;No?+DGF1-u!O0GUXbLF!,(/EcZ=FA8,OqBl@ltEd8dGDBNn,FD)e2DI[L*
A7ZltF:ARjART+[Bk':e+=JUOD.Rr>/NQ'MHV[I,:..Z@.3g3SD.Rr7-OgDH0RI_K+?MV,BOtU_
A8,O)-Y@LCF!,UIBl%i<+BosE+E(d5-RT?1%159QHZX+DCi<f+B4Z0-4$"a1BQ&*6@<6K4A7BP$
DffP5C3=T>A9)j4@<?0*FE;8,F(d<OGA1r6@<?1(AT/c.Bl7luFD,`,E$014@:UL)EbTW,-OgCl
$;a,[:-hTC4ZX]5EbTT+F(KG@%13OO4tq=28oJB\+@Ih)6=FY@E[MuNATV[*A8Gt%ATD4$AKW?J
%159QHY-u.ATL!qB6%s-BlkIo6q0p;9goKu%16onG]7)5BK\C!FE;8,F(d<OCh[d+@<?1(AT/c,
F`VY8EcuD1FD)e@Bl7luFD,`,E$.4sHY-u.ATJ:fE+EQmBl%?D3Zr6\G]7)5BIltJ7SZ6D74]f=
E+EQ.%13OO:-pQU@rH4'Bl%?'9OUn3=<K1<CghC,+D,>(AKY].+=]!Q@<<W1EZchaF(c!i-o2u,
+>>5eAnc'mEt&IjAhG2t7TW/V+<Y35/e&.1+D,2*@<6!&F(fK9E+*g/+E1k'Anc'm%144#0d'[C
F(f-$C`m7tEHQ2AAKX']3dDiZDIb@/$>F*)+A#%&:.\P1A8a(C%144#0d'[CF(fK9E+*g/+=Bo[
<(/hjEcl7B-S-Z-HTHF$/12QSDBL;XCijo@@<?0*%16ZaA1e;u.1HUn$;No?+Co2-FE2))F`_1;
@rH=#ATJ:f-o2u,+>>5eE+EQmBl%>i$>F*)+>H#kAU%p1FC/ci+F,)?D_;J++<YW6Aj%ahEb/Zi
+F+D'+<YB1/g*_T=%Q.0+CoCC+:SZ#+<VeJD/XQ=E-67F-Vd6-:c]_/DfBtEFDi:N8jPg;;^W"]
+<VdL:-pQUE+EQ'GB.D>AKZ&-Dg-//F)rI=E+*j%+=DV15sn:D061cJATMF)0./;I6q0p;9gpT\
/oY?5-OgD*+D#G$/e&.1+DGF?+A#%&:.\P1A8a(0$6UH6+EMC<F`_SFEZc`)8PN#B+Cf>/Gp%3I
+FZpK6VC?*+:SZ#+<Ve%67sC"A7cs.EbTW,+EM47GApu3F!,4:@<?0*-[nZR6VC?2EbTT+F(KGH
-S/(^7SZ6D74]f=E+EQ.+:SZ#+D#G$/e&/!Cia/?%144#0d'[CF(fK9E+*g/+=D#?F)u&5B-;/(
AfrZh-TcS_$>"*c/e&.:%13OO@rGk"EcP`/F<G[BE,9H&?U6tD@WcC$A4fNU3B:FU$9g.jDe'u=
/g*qd78?6B6QfSU1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
@WcC$A4fNU3B:GeBldj,ATV9jF)Y].@;B4kD/X3$:-pQ_EbTT+F(KH#ATMg%DII<fF)>i2AKW+;
/M/(fFCfN8F!,(5EZcJnF)Y].@;?u.@;]Tu9k@mYF!/bm<"01067sBhChI[,Bln$*/e&._67r]S
:-pQUBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*-
%15is/e&._67sC(ATD6gFD5SQ+EM+*+DG^9-t[UDF"%P*:-pQB$;No?+<Ve%67sB;+Co2-E$0Q]
+>b3ODJUFCDIITp?RH9i:-pQU+<YQ1F(&EpDes]:Df'2sCgUauE,oN2F(oQ1F'iNtEaN?gCij)m
FC/lq%15is/e&._67sBhF)uJ@ATKmTB6%p5E$-QLBldj,ATT@DBlbD5Ddd0fA.8l@67r]S:-pQU
@rc-hFCeuD+>PW+1MpQ@0fTUL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16oi@:UK.EbTT+F(KG@%13OO:-pQUBPD*m+E2@8
DKI"?Eb/`pF(oQ1%14LD+Z_>4.3L?'%13OO:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%15Ef6pa[P4ZX]m2E!HO%13OO:-pQU
Ci=N/EZee.A0?#6E+O&4H"CE)+C]83DIdet$:7$H6;L`,/NP"&A7]S!@8np'3]\BM5t"%8=X%3%
+DbLt4ZX]m1,(C9+>Fun%15Ef6pa[P+>#Vs-tHn*FCA-&+?DP+6:""+:K\lK.3NbBA3Dsr+>Y]*
0H`(m0b"I!$;No?+ECn.A8c<-A79RkF!,(8Df$V=Bl.E(Ea`iuAISuTGs+220H_r"INU%Q3Zp.;
3B8N>+>PW)0H_kgBeCM_0JG0i$@-K!4ZX]oGp%H_+?qJ$1b^U+,9S4>Gmt++D.Gdj+F.g7+=nX_
3Zp."4t[sB/g)PeH#7(@+<r![3Zp.4+>Pnc$4R>;67sBpDKKH1G%#3.+D,Y4D'16;AScHs<%oa1
$?CDT3ZpaT6pa[P+<iE\>rsZG1*@u!+?CW!.3K',?SOQ$3?VZd0JEqC?SsMk+>ki,%14sH0H`).
0JEqC0fC^>+>Gf/0F\@D2_Zp.0fUj@%14gL0JFV(3&WH"$8FLu0H`)10JEqC0f^pA+>Gl30F\@D
3AN920f_'F%14gM1bg+-3ArT$$8FP!0d&223&V3Q0f_3O+>PW)2%9mJ0JG@,1,(R>%14jE2)$..
0f:Wo$8O=n0H`/*0JEqC.1HUn$8!ks5t"%8=Wh9.+ED`:$4R>;67sC&ATMr9D09oA+DG_'Cis9"
+CT)&+DG_8ATDs&Ci^$m/M8G*/3Z*>Ed9)VAM,)R004P)IP)`oEd9)V8M2,rAScHs<+L7sH#7($
$4R>;67sBiDfor.F!,=BF*&O:@;0Ne$7ISZ4usp/Gpsjf3Zoh(3dr3#/g)]cGpsk-/g+\9Cij)b
A9f;6@UpT4/g,:GA.8kT$=n644ZX]rAScHs<%oG?D.F(_%13OO:-pQU<+06PAKW]M/Ke)&Cis<1
+E(j7cBM9N+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sBKATDL.ARloqEc5e;883-eDfTQ%
@;I&/+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+Auc\DfTB0+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU=_2#^+<VdL+<VdL+<VdL+<VdL+<VdLcBM:5+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL+<VdL
+<Vd9$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P+%16cZ
F>,j=+@8@^6;L`,+tb!D4"akq+=Jod3Zp+*%14[E0JFUl+<VdL+<VdL+<VdL+<VdL+<WBt0f^p1
+<VdL+<VdL+<VdL+<VdL+<V+#/Mo.8+<VdL+<VdL+<VdL+<VdL+<VdL0f:gE0H_J\+<VdL+<VdL
+<VdL+<VdL%14[C0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL+<VdL+<VdL+<V+#
/M]"6+<VdL+<VdL+<VdL+<VdL+<VdL0et[J0H_J\+<VdL+<VdL+<VdL+<VdL%14[A0JFUl+<VdL
+<VdL+<VdL+<VdL+<WBn2Dd*1+<VdL+<VdL+<VdL+<VdL+<V+#0H_J\+<VdL+<VdL+<VdL+<VdL
+<VdL0ebIE0H_J\+<VdL+<VdL+<VdL+<VdL%14gD0H_J\+<VdL+<VdL+<VdL+<VdL+<W[&0JFUl
+<VdL+<VdL+<VdL+<VdL+<V+#1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL3&WTI+<VdL+<VdL+<VdL
+<VdL+<VdL%14mF0H_J\+<VdL+<VdL+<VdL+<VdL+<WU$3%uHt+<VdL+<VdL+<VdL+<VdL+<V+#
1b^U++<VdL+<VdL+<VdL+<VdL+<VdL2E*<D+<VdL+<VdL+<VdL+<VdL+<Vd9$8jLk+<VdL+<VdL
+<VdL+<VdL+<VdL+>l)40H_J\+<VdL+<VdL+<VdL+<VdL+:SZ90JFUl+<VdL+<VdL+<VdL+<VdL
+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd9$9'Xm+<VdL+<VdL+<VdL+<VdL+<VdL+>Yu30H_J\
+<VdL+<VdL+<VdL+<VdL+:SZ;0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd^3ArQ6+<VdL+<VdL+<VdL
+<VdL+<Vd9$99do+<VdL+<VdL+<VdL+<VdL+<VdL+>P]+0H_J\+<VdL+<VdL+<VdL+<VdL+:SZ4
0JG1'+<VdL+<VdL+<VdL+<VdL+<Vd]2)d33+<VdL+<VdL+<VdL+<VdL+<Vd9$8F7h0H_J\+<VdL
+<VdL+<VdL+<VdL+>GQ10H_J\+<VdL+<VdL+<VdL+<VdL+:SZ41,(C)+<VdL+<VdL+<VdL+<VdL
+<Vdc1b^$p+<VdL+<VdL+<VdL+<VdL+<Vd9$8F=j0H_J\+<VdL+<VdL+<VdL+<VdL+>c)4+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZ41b^U++<VdL+<VdL+<VdL+<VdL+<Vd_1,'gn+<VdL+<VdL+<VdL
+<VdL+<Vd9$8FCl0H_J\+<VdL+<VdL+<VdL+<VdL+>PW)+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ4
2D?g-+<VdL+<VdL+<VdL+<VdL+<Vd]1,'gn+<VdL+<VdL+<VdL+<VdL+<Vd9$8FIn0H_J\+<VdL
+<VdL+<VdL+<VdL+?:Pe+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ42`393+<VdL+<VdL+<VdL+<VdL
+<Vd]1E[e_+<VdL+<VdL+<VdL+<VdL+<Vd9$8FLo0H_J\+<VdL+<VdL+<VdL+<VdL+>G\q+<VdL
+<VdL+<VdL+<VdL+<VdL%14gL2)$-q+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#0f^pA+<VdL+<VdL+<VdL+<VdL+<VdL/MeLl+<VdL+<VdL+<VdL+<VdL+<Vd9$8FOu
0H_J\+<VdL+<VdL+<VdL+<VdL+>Pr"+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ,%13OO/M9@U6pa[P
+D!/JBOl3=%13OO:-pQU@rH4'@<,p%@rH4'F`_2*+EhfY+D>J1FDl26@ps0rG%#30ATJtG+EV:.
Eb-A%Eb,[e:-pQUF*1r5FCB'/Bjkg#G%#E*@;]RdF!+q7F<GX9@rH6qF!,O;Dfol,+C\n),%=ts
Cb9U7EbfqE%16cZF>,j=+D>;-0H_o!+=o,fA7]S!@8np'Ho`Au0RFuu+D>;-0I\+q+tt,o+C-*E
+>F<4%15is/g,1G@qBP"+Eh10F_,V:De:-;PZ/c;Ec5e;A8-'q@rri3@WQ+$G%#K,Df-!k:-pQU
@:sUlASl!rF<G:=+Co%nASuT4Dg#]4+EV:2F!,F5EbTH&%16cZF>5p>+@8@^6;L`,+tb!D4"akq
+=Jod3Zp+*%14gM2)P[r0eP0e%14gM2D>Fn1G1Eh%14gM2Dkds2(gfo%14gM2_YOp0J5*e%14gM
2`1mu2(g`m%14gM3%tXr0J53h%14gM3&M""1bLQj%14gM3A:as2D-ur%14gM3Ah+$0J5<k%14jE
0JEek1G1Wn%14jE0Js.p1bL]n%14Nn$4R=o/j_il6;L`,AM,*=A99O8$4R>UA99Oh3Zr*HF>4mh
/g)\t+Co&"FCA-&+FH3m-noul0d(.?F>53e/0Zbj0d'aE0d&1[$4R>`D/XQ=E-67F-W!*-;aj)8
3Zoe$C2[Wq?YO7nA7$l8?Y+:tAStpl?ZU(&CLnW1ATMs7-ZWpBATMF)?Ys@cF`Uo2D/X3$:-pQ_
EbTT+F(KH#D.R:$F'j!*Deio,F=f'eF)>i2AKZ)+F*)IGAoD]49k@mYF!,X;Eaj)B%15is/e&._
67sBH+<Y04Ch7*uBl@l3+E(j7FCfN8+Cei$ATJu+Ec5e;+AHEYF`SpO+<WC!3ADX!6$%-gDf0K1
Bk(Rf%15is/g*GrB5_g)FD,N4/e&._67r]S:-pQU@<6L4D.RcL+D5_5F`8HOEbTT+F(KGB+DGm>
Ci<`mARl5W:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\KK_$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`i@<+(X+ED%2
@;TRd+EVNEAoDL%Dg*<PB6%p5E*m*nCi!ZmFD5Z2?Z]k#FEDeIALSa<@<ld6F:AQd$>aWhA0<7?
Bldj,ATT:/$4R>;67sBoBkM*%E,oZ1F<GOCARfFqBl@ku$7InX3\`?<+>Gb`$4R>;67sBqF_kc#
DBNIuFCcS,DfQsdE,oZ/+>GQ$+>Gl92]uON+>@IO<E(R[$8OFp2E3]S/i=b7+DQ%8Ao_BiC`kGm
3&_s:+>GPZ$4R>;67sB[+Eh10F_)!h?SF)e1,gsK2D[9I1Gh'64Wnc[A0>Ma0R7MG+>Gl92]sq"
0ea%D%15is/g,"BAT`&:G%#30ATJu5B.b;d2%9mb6u>(J+>Pc12E3]T/i,1>1,TLJ<,FcZ+C?fT
0et[C2`*<E%172j0Prs6+C?i]2`E]P0eP4>1,1OB2@U!&$;No?+=Js!/i5""E+^:Q1^se6BJ<pZ
3Zp1;0J51?0K(XF1H-F,+=K$(0J5@F2)[9M1H%-H3?Tdo8jmM=/Kcf*2)-sF2(gR3+=eQ_0J5%5
0Jb[I3AWH6.Nh]-?8<rP/Kci/2_d!?0JFUqINVU,?8E#t%17/nDfp/@F`\`RG%#30ATJu)BkCsg
EZf(6+DbJ-F<G+*@qfdgCaTZ!F)>i<FDuAE+=KE8/hn^r@rH4'F`_2*+Dk\$F`SoZ+=o,f-QjcZ
/1r%m0J5:3+?1N*1*C[P0Ol4V3ZrNX0Pq7+%15is/g,=GCis<1+CSo'AS!!+D]gq\A7]7bD..7%
%156O+=Aiq2CBV,+Z_A$FD*@<+=oPrFD*@F%13OO:-pQUD.R-n+EM7-ATD?jC`mh6D.Oi%DfQsT
3B/r?6#^jYC`kGd+CT@70f`o.1,3W,0JIPj<E'D7=\V:I3Zp.;3&_s:/28h$.j/G7Ao_R%F!*1t
+>PYo0F\@]6t8A@+DQ%8Ao_BiC`lkT6k'K&@m)jqB2gR1D.Fbl9gfEt%15is/g,=GCis<1+CSo'
AS!!+D]h"^A7]7bD..7%%156O+=Aiq3%#h.+Z_A$<+@%%3ZqC=%13OOFD*@<4ZX^&ARTItBk1sh
0H`tU@grbS$;No?+Eh10F_,V:@:sUlAKZ)5+>t?QARfFk@;Kuo$9^$b-SR/2-QkAl3\hh"BJ<p=
/34nqBJ=94$4R>;67sBuDfT]'Ch\3,+EV9N@grceBJ<pZ3Zr<XFD*?NFD*@<%172j0Prs6+>GW2
/iPRF3&`WM+<XEG/g,+G+?24f$4R>;67sBtARTI!F(o/rEb/Zq+EV=7AKX9XEbT>40eb.$0f_3P
+>=p<<$5mm+D>V5+E1sG+?21e$?Tr8D*9Ko-S[D)4!ua:-T`\42D-dD2E3&n$?Tr8@m)Fe/13,&
0J"n11aaCo3$C=:.3N/<F(TH'A0<Ta+=2IZDJjQ00Hb4D@;^.#A9i$&0H`)13&_s:+>GPZ$?Tr8
D'1Dk+EV9N@grbS$;No?+Eh10F_,V:@:sUlAKZ)5+>t?QARfFk@;Kuo$9^$b-SR/2-QkAl3\hh"
BJ<p=/34nqBJ=94$4R=jD.R-nF(o0"A2#-@F_kZ1@ps0r=\V:5+?^iaARTItBk2L+A2#-/9gfEt
%15is/g,"BAT`&:E+^dG0f(]s$=tnS3ZotaD0'<0A7Qg"ARTIp@VfauF_PrCC1K"@1,LgG3&riK
2%9m%$;No?+DkP/@q]Fp+EVNE1E^4>@qfdgCi^$m1,C%.2BXb6/i57@+>#Vs0J5%50d(LTF`(_4
AM=Q#%13OOF)>i<FDuAE+=BuO;c?+Q3]\B2/8B*6B4#@fDe*3+-XU_%AT`'$F)>i2AKZ)+F*)IN
EbTT+F(KH#FCB')ATD.!D/X3$:-pQ_EbTT+F(KH#FCB')ATD.!D/X3$+ET1e+EMC<CLnW1ATMs7
+D,P4+B2ceDImi2G%G]'F"Rn/:-pQB$;No?+D>k=E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0
FD5Z2F"[t0:-pQB$;No?+Eh=:@UX@mD)re\ARuuuDBL?>F`_[R%15is/e&._67sB'+AP6U+>b3O
Ble59I4cX!+CoA++=D&LFCB9*Df/o0%15is/g)8ZDKU&0FD5Z2?YOCbCi=3(BlnK.ARAtEF(nuu
A.8l@67sB'+Du=D@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1Bk(L\7<!<9AS5@eA.8l@67r]S
:-pQU@<6L4D.RcL+D5_5F`8HOEbTT+F(KGB+DGm>Ci<`mARl5W:-pQB$;No?+CfG'@<?'k3Zp13
1,EcUE\T<Y$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$4R>YDdd0!-ZWpBATMF)-OgCl$;No?+D>J%BHV87Bl8#8E,oN"Ble!,
D@Hq$3?^F<0e"5"2@U!&$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+Cf>,E+*cu+AR'$@<?4%DBMMg+@TdVBlJ0.@ps0r
9Q+f]BlnK.AKZ)5+Eh10F_,V'$;No?+Cf>,E-686A0><&+D>k=E-"&n05b?>E,ol0Ea`g%Bk)3:
@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2"$4R>;67sB[BOr;p@q0Y%@:OR*De:,6BOr;r@;KFrCghF"
Df-\.ARfal@<6"$+EV:.+D,b:FD,6++CTJ&Gmt*U67sC+Dfm18ATT&,Ec5e;FD,5.8hr(S0HaqG
De!H'GA(]#BHV#1+EqLE+D#M1@q]p+@<,p%Eb0<'F:ARP67sBlG%G]>+D,>"FEo!SARTV#+E)9C
F)N10DIal-ATo8*ChI[,Bln$*F!,:5CLnW1BPDN1Df0,/@<,og$;No?+CT;%+ED%+ASu("@<?'k
+D,Y4D'3n<Cgh?,F*VhKASiQ"ASbq!FD50"+Dk\"BOPdm@rj73$4R>;67sC&ATMr9A79RkF!*.Z
<E'D7H#7(T3Zp131,C%/+>GVo/0HZ-2)ud61*A;++=nWj0f([00esk+1FsY'3&!$/1*A:o/34n.
3AWN82]t!f$4R>;67sC%BPD(#+Cno&ATJu+DfU&1Eb$;$DIal2ATT&:Bl.E(FDi9W0PEL%2/PB1
0lnI;<"01HA8#h$4ZX]tA7fjqD0$h5D0%j$+>PVn0f:(00b"J8D.GCb3ZrN_A79Rk-pK==0JG1*
INs,TA19$NDe*:%DJpYCD.F(_H#7(I4ZX^2D.GCE.j-5bH#7(I.3KiX/35I-0J$gHBPhf"$4R>7
7!(RQ+>Pc30JG4=/i=(F1,(I>+>Y,p1*A/0+>A.fD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r0RJ(^
A.8l`F`]c-+C?fT0JG7@1GCOB0K1+L67sBkAS2GZDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuS
Bcp#9%15is/g+S8Eb/g'+EVNE2]uXB@qfdgCi^$m4YIp*0J5:3+=K2m3\i-,+Du=D+=oPrDKTFu
$4R>77!(RQ+>Pc02E<KJ/i=(F0f_*O+>GVo0eje&3Zp/(H#7($$;*^.+?^i>6p3RRC3=?)EarNo
+>J4gD.F(_DKU%a3Zqc`/het51,1O@0fUir$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah
6k'Ju67sBhB6%QpF!,RC+?(ERARfFk@;Kuo$9^$b-SR/3-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO
8jmba3Zp180JP:B3%d&t$8O=l2'=V/+>GYp/NP"0H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kK[
H#7($$>t!.4ZX]m0J5%50f(^J2`<QK%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q
:-pQU@:sUlATJu9D]gn[A7]7bD..7%%156O+=Aiq2('Lp3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.
4ZX]@1H.9N1,ggC%14gL0JFV)+>Fuj3Zp5*H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>\@iD.F(_
DKU%a3Zqc`/het70ebRH0K(j!$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr
/i>"!-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LaF3B0#O2%9mI3AWN82]t"$/NP"2H[0I=
%15]qF<E^h8jkg'+DQ%8Ao_BiC`kQ]H#7($$>t!.4ZX]>/het92)R3E2)$fq$>sur4ZX^'F`_&6
Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15is/g,%M
DBLVU<E()_Bl.F&+AH9i+>GDi1,(C?+>GZ51c%0J1*BRr%15]qF?MZ-1,LjE3&NWI0K1^F3&3<E
2`*3I%15]q4ZX^#F_kZ1@ps0r1,(C?+>k])+=eRHA7fjqD0$gS1E\M1+>P\]$9^$i0J5@5+=K2m
3\i-,8jmbD/34nG6k'K@F`]c-+C?fT0JG1<0f:aI0f'7GDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*
?XuuSBcp#9%156O+=Aiq2CBUq3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@1c@$C0eb491c-p@
3&`iU1-%6%$7ITTH#7(I.3L3'+>PW+1E\\/1,9t&+D,.tD0$-n8jkg'+DQ%8Ao_BiC`kEYH#7(I
%156O-SR/5-Qjfs+Z_A-+A,%D+=oPr8jj*qDKU%a3Zqc`/het70etX@2E<T'$>sur4ZX^'F`_&6
Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-
1,LdG3&`ND1GgpC0K;!O2DR9N%14L<H[0I=1+==t3Zp.;2DQC6/2B%).j/G7BPhf"$;*]L3Zr0[
Ch@]t@;I&@H[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]m0J5%51Gh*J2_ZsB
%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D+=oPr
DKTFu$4R>77!(RQ+>Pf.1,1IA/i,=@0ebRG3ArWQ2@U!A14+:`A25SV/NP"00f(d32Cpg1.j/G7
BPhf"$;*]L3Zr0[Ch@]t@;I&AH[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]>
/het71H@HO3ANN&$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd0-DVr/i>"!-o`A2
1+==gDKU%D/34nkF^kjf%15]qF?MZ-1,CjL1c$s@1GgpC0K;!O2DR9N%14L>H[0I=1+==t3Zp.:
0JXb0/2B.,.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&BH[0I=1(=RR0./G+3@>pt3$C=<.3M5NF<E+q
+A,$2$>t!.4ZX]>/het62E*QR2)?oq$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Jd
0-DVr/i>"!-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LaG2)dBF1GgpC0K;!O2DR9N%14L?
H[0I=1+==t3Zp.;1H-F3/28h$.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&CH[0I=1(=RR0./G+3@>pt
3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]>/het:0fM!E1bpfq$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.
ARAtEF(lah6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%13OO:-pQU/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU@rH4'
@<,p%:3CYeFD5Z2+A$Gn:L\-SEHPu;Gp#mp+B3#c+@TdVBlJ0.@j#l3+Eh10F_,V'$;No?+Cf>,
E-686A0><&+D>k=E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<E+j2"$4R>7
7!(RQ+>Pc30JG4=/i=(F1,(I>+>Y,p1*A/0+>A.fD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r0RJ(^
A.8l`De4#R3Zp+/0JG7;0JkR@3B9)Z+AP6U+Co%r%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-
ARfOjE-,f(?XuTEF$sSP+A,$2$;No?+CSo'AS#p*FDi9W+Co%nBl.9pEt&I>0-DVr/i"ds-o`A2
1+==gDJs*.+=oPrDJs)r%13OO8jmba3Zp171H%6J1G1No$8FOu3?U%3+>GSn/NP"/H[0I=%15]q
F<E^h8jkg'+DQ%8Ao_BiC`kHZH#7($$>scnF?MZ-?SF)d0JYRB1,q3K2)-fp$>scn@m)jqDKU&0
FD5Z2?Z0CiBlS90FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*0J541+=K2m3\i-,+Du+/F<E+q
+Du+/@grbS$;*^.4ZX]@2)$a>3B/WK%14jF1Gp:01*A;-+>#Vs14+:`A.8l<7!'P7+A,$b3Zr0[
Ch@]t@;I&AH[0I=%16ukATU'r+>>E%0JYF=3Ai]Q2)$`o$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90
FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*0J5./+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.
4ZX]@1H.9N1,ggC%14gL0JFV)+>Fuj3Zp5*H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>\@iD.F(_
DJs*.4ZX]>/het70fCmG3&*EO1^se0De3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8
E-"EYB-9f7%156O+=Aiq1FF:n3$C=<.3KaNDe4#5/34nkDe3Df$4R>77!(RQ+>Pc/2`WiX/i=(F
0f_$I+?(E$+>#Vs1jaLbA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&CH[0I=%16ukATU'r+>>E%0JGIF
1bgpK1,(]t$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*
0J510+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$?L'&F`_SFF<Dr-5uU]N6om@O-S0"NA7o7`C2[Wi
/14eH@;]soEaNm)Deio,FCfN8F!g                                              ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1E\J-+>Get1bg+.0d&;-+>Gl!1,g=20H`,1@WcC$A7'@kF(KE(FCKB,Ch+Y:EbTT+
F(KGB+CT.u+Co2-FE2))F`_2(F_PZ&?ZKk%ATMF)?Y"(b@WcC$A0>;uA0>DsF*)G:@Wcd(+ED1;
ATMF)+AbHq+CoD#F_t]-FE2):ATMF)?Y+:tAStpl?ZU(&CLqU!F*)IGAoD]47<<EZDII<'@;]Tu
9k@mYF!/bm<$5UcB5_g)FD,N3Bldj,ATV9rAS$"*?ZU(&CLqR(Deio,FCfN8F!,(5EZe(fAT`&:
G%G]'F)ku9ATMF)?Z]^oDImiqF)>i2ATM^,CLnW1ATMs7+D,P4+B2ceDImi2G%G]'Er       ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&)O8+>Y,p1*A=p2)d?71,L+/+>u/72_cF02'=Xs2`ETS+>bhr1*AG73&_s83?U("1cIET+>bnt
1*AA31-$I30H`+n1cR650f:(/+?;;<:et"h?ZKk%ATMF)1,2Nj/l5>B<*sZ[F(KE(F<GO@F*&OD
Ec5H!F)u8?/g(T1%17/nDfp/@F`\`t7R9C14ZX]60H`D!0I[G<:-pQU-us$CATMF).3N>BFCfK)
@:NjkGAhM4.!$gu+>PW+1GCU>3,10-0etLE$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sBjDerrkBjl-kDIIBnA7'D"@<-E3+<XEG/g+YBDK]T3F<F.@<?Pam@r*90D]iP.CisT4
+Co1rFD5Z2@<-W&$;No?+Dk[uDKBN&C1K"@+<VdL+<VdL+<VdL:-pQUD.R-n+EM7-ATD?jC`mh6
D.OhuF<F(oAS#b'Bk(g!AoD]4C3=?,@;[2u@<itDGpskMDBNJ$B6%QpEt&IO67sBtARTItBk2L+
A2#,K+<VdL+<VdL+<XEG/g,"B@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZeLZ6m-2]
+Co%rEb/g'%15is/g,+AEcYf!Bjl-kDIIBnA7'D"@<-E3+AP6U+A"k!+DtV)ARlp)FCB24Ch[s4
+EVNE@WZ*r+D>=pA7]d(FCAWpAIStq%13OOF)>i<FDuAE+=BoN/g,=SA3(h\+=nWd-SR)j4?FZL
EBH<*4tnNA-Qjfs+Z_A-+BD3)EbTT+F(KG&$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0F<D\R
EbTT+F(KG@%13OOBjl-kDIIBnA7'D"@<-Er1,(I=?Z^O71,\O4^I^^k?VY$HALp5\F(o9)@<?4%
DCe=M:b4qAH"D#':18!N/5C%5=%#to8h="[@:q,h6!m5>0JG136tKk88hr(S0J$"?BkM-t/5pJ0
EarZ38OP*sDf0W</4FZ+D/X6/B6diZDffP"$:/-BDesQ<DJq(.:G"FT=ALM+/70MnH#>0?/70q_
1+k:;/28k;/iPLC2)$p>1H@'A3A`TP1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#>0#H=^T"+Auci
F^f0$@j#`2DfBW9@;J"k@WQI(F`_M>+DGm>@3B/r@ruF'DII?(D/"$!@s)U+F`S[HF^fE6@;]Rd
+DG^9FD,5.F(8o9An`B*Dg#].+B39&_kD*g@3BGr+CS`#DesQ<DJpXG<+ohc7U]eKDfU+GAoD]4
FD,5.6"4nRCisi2.3N)F+DG_*Cis<,FD50"+@CHd@q[!/EbTW,EZe"`Eb0&0`/J,DASWn-$:/01
D..H985^Qi3B&KD1H73M/C(a[+@U<b/3tg@1,V$I/Mo.93%Qg;3&iHG1bLXD2)?sA/1i\4/i,1<
2E*BB/1f)V0e>b6Be0]#6"=S>Ec,<+/4`Y]1cI0@2`3QS/C(LC7<3)n5qFT=0J51>/2B%71bq$J
1,CI52)d-C1H%0L1Fth4@:Eq\/1f)O/4FSn/6$:o+DtV)AKZ2*F!,CABkM-t@;Kb*+@1$V@VK=5
+P<F@Y1U!%fVdDUfnS18fWcRA^;PT]\s@&N+CT.>DII4!+=JUXBm+'.-Z^DADIb+D/e&.R@q]Rs
A1U8L+>PZ3/2K7@0eCVZ+@BRY/3tg@0JkdE.lB7B3@ls=1c?m>1+k=@2DR!C/2]@=3&*9F3&`B>
/C(^U6Xb$e,%bP0F*&O5E,]W-ARlp*D]m?7+@BRYF(oQ3ASGRa+DG^9FD,5.;eofXDIIWu+Aclc
F)N0eFDPB,+E(j7FD,5.87c4QASuQ3E-5W+Blds!A0>T(+>Gl60J">UF`\a?F!,@=F<G@:Dg-(A
E,oZ2EZfIB+EV:*F=naH$:/0B@:CcY;BRhW3&E0F3&iZI/C(OU+B)cg/4!\q0fC^C1bCFB1cR$A
/i>O<1,L^<1Gq0K0JG%00f^jG0Jt[E1Fth4@:Eq\/1f)P0e?75D_*)SBOr<.Ea`KmFD5Z2@;I'(
@;TQuDe:,6BOr=3Z63(UDfTf2BcqJBF*(u1+D>2)+C\nnDBNt2DId=!ARloLCN<im+CT.u+@U*T
CN<im/0JJ7EbT].A0<::Bkq9&6"=qD@OWF3Ec5e;6#pCCBk'1HfVdDUfX][efWj)-+CT(<b.hA)
Ea`E"-ms+MAKZ&(DfTf2Df-pO/g:`36"=qXGUuB`+>c#50J#+92_d9CcESKZEcip!@4X,g1,_$B
2D[$F/28b51Ft7?2D-mE3Ai]N/1ib9/hf:G0KCp?6#C1RBk(RhBle,B/C(LO6ZR<#,%2U2De*F"
DBNG-DKKo-@ruF'DBNk0+EV:.+@9L^ATAo(ATMQuDIIX$Df.*K@rH(!ARlotDBO%7AKW]fFD)e,
ASuU4Ed92Y@Wcc8GA(]#BHUl(FCfK(A0>T(FDi:3Df'?0DBO(CAKYo/Cj@.4Gp%3BAKYi(A1]Pj
FD)e,ASuU4Ed8cU4<VqS+@C0l@qg!5+q4lF@s)6lDK@@";BRbQ2_lp@1b^gG/C(LC6Z-Bb6");u
3&NZQ.krb90e>.61,^[<1Gg^B1,1^E0J"q5/iY^I2E3WH6#pCCBk&\FcESofDIY4sBOr<(@;TQu
G@>P8DfTQ)Bl7?qCj@-hEa`Ek@lbabVqHaUZIl,.VqHgXM'-5Q/UDPK`.;gDTcba2FD,5.@r,Rt
F!iCh%15C3BOPLaEa^Li;BReM1GLF<0JbLB/C([H9P&,n6")<!0JPIE.l&n92(UO91c$[;2)Hp?
2_m6K2_6^?/i5:A1GLX96#pCCBk&\FcF,8tAT'+D6#:U\+CehrCh7-"6#:(F@:j(k@4i[%BOr<(
@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbabVqHaU[b65bMV,2dW?>X.\;`*!\;ap/`2doe
+=JUZBOr;qEa`Zm+=M/K+CfP7Cb-]IEZfFFEa`ir.466BDe:,6BOr<&Bl@l:F!,=.DIm*&/g:`3
6"FY;Ea^Li;BR_Q0fU^?1Gq*O/C(XG6VUu?5qF]J2)mKG1,q-N/28b70J"q41bL[D2Dd9I/1iV:
/ibjG0K:sA6#pCCBk&\FcF#2j9joRs<+ohcDIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1H
fX]Y=fVdB,fngio^L?*2O2QTi_kA2$-['3EB5)7)-RgYj8T#YmBOr;R@;KLmA79LmF_r7>AfsBU
+@0LNF('-(+@0fd9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq9UY1IVKHSpFfnA"gfWa#+fWj+e
+NhE,GB[b;+CT(<b.hBD\<"RZEbTfE/0K%T@;^.&@<?'k+DG_8D]h_^FD5V8@<3PfEbTB!+BE2s
B5)7+D'15SAnc:,F<Ga@EbB*(-RgYl%15C3BPD9685^Qd3A<!B1bg^9cFtDeDIb:M/1iD0/iYd@
1,(=<3&NBL0J#%</i>CD2`E]I6#pCCBk&\FcFthqDIb:B<+ohcDIIBn+Eq78+E):7B5)6lCi"A>
6#pCCBk'1HfVdDUfWa%dfn:JViOFq#iOFqWH#+TOFD,5.FE1f(DCcoHBlksM-Zj$5+EV%+CaUYa
+q4lFBl5Im;BR\N0KC[>0K;$P/C(XG<+0o#6")K!0JkOE2CgLB0ek48/i>F92E*6C2)I$G1Ft7@
/ho=>1c%!?6#pCCBk&\FcF#3&@<F,#BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_Ea`Ek@lbab
\_2knL*4XR@<l`5-mrSOALAoL@;]TuG@>P8Eb0E.ATq]r+CT.u+CSf!E-,Z%+C]U=FD,5.=)W+p
Bl7Q+7riNjE$0(:+B*AjEZe+cD.Rc@%15C8DII@%@;T^085^Qh0ekR;3ANNO0eCV`0d'D-E\'L-
0fV$I1+b7:1c6g@/iYa?1,q'B2)I'F0Jk=41,:I@1c.0K0J#M1@:Eq\/1f)[0e?79E\'\#Df$U_
Ea`Ek@lbab\_2knL*5-HfnA"_fVdDVfnpop^L;D*+CT:BEl<NG`2b"/-Y7R7+E(j7FD,5.@<,jk
ATB.I%15C;@:WtYE\'aZ+?)&93%R'H1cR3@cF4oiH#bH%@4X,n0f(d>1H@-L/2St91Ft:@3%d$D
3AiTI/2K:=0f1aJ2_ZdKEa`Ek@k91V[k(3uE\&D6BOr<(@;TQuBlbD8EbT0#DII?tGp$^>Df$U_
Ea`Ek@lbabVqHaUUY**0J_74M@;IO<^3/DGP@erX+=JUZBOr<.@;Kk"F!i)7De:,6BOr<-GAhD=
Bl7Q+ART4fAR-`9+EM4)Eb/c(GA2/4+O7VB9R1YeAKWBeCghF!Amo^//g:`36#9tNBjiP`6m+3B
3&`ZP/3,C<0Jk=f+B)il/70q_3&33J/MSt;2(U[=3Ai?C2`33E2)d?I3%QX90ePIA1,_*I/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#,eE\&D%H#Re<Dfd+@Ec5o8F(&lH+@0gPF(o&*BlbD=BOr;uBl\9:
+D>J1FDl26@ps1iGp%-=@rHBuARlp$@;TQuDe:+ZH#ReHF"AGE@<?4$B-:Yl@r!3/D]in2A1_D-
AoqTqDKKP7@qBP"F`MaM6:3@L%15C;@UX(`@;%2_;BRnR2DcsF1bggA/C/hh;eL,%5qF`N0KD*E
1,1I;/2Ah;3%QgE2_HpD0KD'H/1iV3/hf%:2DI'?6#pCCBk&\Fc[[QFB6#OI<+ohcDIIBn+DGm>
DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1HfVdDUfVmJVfWWr,+CT(<@UX(`@3?sGFDlA@-RgYj8T#Ym
BOr;R@;KLmA79LmF_r7>AfsBU+@0LNF('-(+@0fd9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq:
L=qI:Yoq\sfnA"VfnA"]fVp!2@<m-4EZee,/Ri.)A79.&+EVX4DKBW&FCeu*Bl8$2+A?3cBl5&%
F!+/!@qfI^+AZrqBk1p#-mrJEBkM+$ATMr9De:,6BOr<.Dg-(H.3]3.6#:"=ChYFk;BRnY2)$R9
0JYO@3%W@_+@1!f/1iD)/2Jn;3%Qj?0ePI@3&rlW/1ik71c[EP2`3-PEa`Ek@k91V[4FU`E\(1'
AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(QfnA"VfVdDUfXW,5Cb9,7JS]&C^E=pP
FD,5.F*D&/Ci=N/E[N:g%15C;@VKjoD_+FW+?),32_6sH3A`ZGcE]/I6[<;q6")<!3AW?J.l'%@
3%Qj<0JtC:3AN3F3&!-G0e>(=/ibdL2E<ND/1f)P0e>\;B.R"qAKZ&4F`Lu'+E(j7FD,5.DIIBn
+@0gQBl[d'+DGm>DJsV>ASuU(Eb0'4+Cf5!@<*t0$:/K<BPCpa/4`Y]1c@*F/2]FB3B8Y9YolDS
Ft>3r/M&_20JY163&3*@0JbO>1+Y"41bL^B3&iiS/4";b@VK='/C(LO6ZR?$,"?TkD'2,b@:Eq\
3[!(QfnA"\fVmH#fV'ErCb=VWQ>'gHJ]b\L-ms+JDKI6T/g*`'+EV:.+@BRRASu$eEbTZ5+E(j7
6#7Z0@q]plF(la_C`lGjF^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+P<UFK\;(4L=iZ]Yoq\sfnA"h
fWj),fVfp$Cb9L4DW/0m@<*K!Cb<T!F`PEO@OrXDEa`j,CghEsA0>T(FDi9q@<?4$+CT=6;K$Vu
Ecl4A6Z7!gBcnfO@V&t`+E(j7FD,5.@rcL3-RgYl%15C;@rHB=85^Qf0K([;2Dm<M2_6pB+B;-E
/43hs0f(R@3@csD2)[!A/ibpC1,(F81GC^D0Jb7;1bLdJ2`W`P/4";b@VK='/3#=7<D?mQ7WNEa
+@1$V@VK=5+P<UFK\3H\LtJWXYomIkidd0M\s?cKGJo&Q+=JUZBOr;u@;0V$+E)./-RgYW$:/K<
H#IS3/4`Y]0ekRD/29(B0JY3)[ieXYFY#g00JbOE2(LF=0K(I;/iY^>2)['H2_d$E1+Y1;/ho%;
0f(^=/1f)U/6$&#/59\m@V'R&De:,6BOr;_Ch7<hA7]g)DfB9*+EMX5EZek.F`VY9EZcc)1c6^7
+@0gRH#IS3+=KNn@qfLlF<F(oAS#X<+Q9thcF_B5c\9](cFqN4+@0gZF`209P:7Vu@<3Q0DIjr/
Afu2/AKXfcASGR`ATJu8BleB-EcW@;DBMGiAS#X"D0^5:Des?)GqKO56#:(C@UX:cDCe=V+>G]1
2_6^=1bpd:cESKk@<F+Q/2/n:2*!0A2D['=0J5=D/2fI?3B/]I2DZm=2D-j@3AW?E/4";b@VK='
/C(LO<+0o#<+ohcDIIBn+Eq78+E):7B5)6lCi"A>6#pCCBk'1HfVdDUfWWr+fWj),fnLVXA1_>#
@UX;qJSlSY-Zj$5+D,P.Ci=N/E[Mu6De:,6BOr;_Ch7<hA7]gf.1HVMCh.*t@;T^r/4`Y]3&*<H
/28h90f_6FcESKZAT01P/2Aq73&W9F1,Cd=1+kC@/2K"@/iGOC3&icH2DQmB3&NQP1b:q5@:Eq\
/1f)O/43uf/4OYuD'2,b@:Eq\3[!(QfnA"^fWj),fXW-WVqHaVMV3^:MV3_,@H"_W/`F4#Bl_.C
b.f'-Cb9p@D8`Jm+=JUZBOr<,BkM+$+CT;--QlW3AfsHPE+ig*F'U4I%15C;A8#Ch@:CcY;BRqT
2)?d<0K:aG2([%Z+@gHp/1iD)/2Jn40J#"83%d$I1,1dE/1iY:/i,CB3&NQE6#pCCBk&\FcEf&l
Ecip4BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@/UVqHaUYh=c`W$#O-\;r6#\;t'9@:C?--Zj$5+EV%+
CaU?0De:,6BOr;rDf0W<ASc0kFD5Z2+E(j7FD,5.;f?f#BOu4%+@^'dBO*&>%15C;A8#[d@;%2_
;BRkR3ArEJ1H7BP/C([H6ul]e5qF`L0K;$B2Dm<I/2Jn52_6^A2_HgF2E!EH/2f@<2_d-I3&E0P
Ea`Ek@k91V[Oage@4XlgDf$U_Ea`Ek@lbabVqHaU[b.P2VqAO&@H"_U/`F4!Bk##3b.f&I-Zj$5
+D?%3DIIT6.4u&:6#:(SCh@C!/4`Y]2`NZM/28h51bpd:cF"c_AS`nL/1iD0/hf(41GCd@1GCU?
0fCR;0eP791GUjC/4";b@VK='/C(XS6tL0c;eU)iFCf?(DJ()1AfsB[@:Eq\3[!(ZfnS.X+P<UF
K\3K]K\:q0MV3_,iOFqWDIHus@:Us#F_k[.X)9%.-Zid2C`mY.+EV:.+CoD,E+is'-RgYW$:/K?
Bl[u?85^Qi1,Cm@0ebL>1GUN,Z62MGE%F:`/2Aq83&`?H0JbO:1G1F=/2K%:/ho7@3B/rK2_ZjA
2D@'E2(V%6@:Eq\/1f)P/43uf/0[Q(Df$U_Ea`Ek@lbabVqHaVJ_76\JfnK</S8^;E?HYWFD,5.
Ao)BqCF:P`+AQ?^AKYW"G%GP6@X0(rCisB(+@9XP+EVNEFD,5.@<6O%EbTT3+Cf>-F(o];Bl7Q+
De:-;Yq.$CZ63RnA0B1,+@B^ZBOtm1+q4lFChI<iBe2eQ+?)5:1b:@80JGCA/C(LU+@B^Z/1iD.
0JPOA/MT":1Ft=72)m-C0JkC>0f([F2CpF71+kF@1cR?J/4";b@VK='/C(LU/43ib/0[Q(Df$U_
Ea`Ek@lbabVqHaUXOs`0MBH>D/S\^)Gp"L_FD,5.-uEC/ALSa;Bk/S?/g*GrFCfK1@<?4,AKZ)8
@:X(oBl@ltC`mV(D.Rc2@<,p%6#7Z6Bk:gh/0Il&@s)["@3A'SARoKt@;]Tu6#:1JARoKt;e9H]
DId0.+q4lFChI<sBjrVa;BRbU/28h:2_<7\+AcW^/1iD,0JP@=.krn90e>(43&<*A/i,1@3ArZE
0f:R<3&<EP1b:q5@:Eq\/1f)Q/5Tnj/4OYuD'2,b@:Eq\3[!(QfnA"ZfVdDWfVfp$Cb9D?JSo12
+=JUZBOr;uCgh3s-RgYj6#:1FDJ<Q&BlbD*CiaM;@;^"*BOu3,DIIBn+D,P4+O757:h=ZgASE88
9keW[@;@;E%15C;B5(pd@4XrI+>bc02_6g?2)mBCcEf5J9P&,n/M&V11,(C40f_*F/2Ah90e>%:
1bLdK1GL^C/29.;3&E?H3&rNUEa`Ek@k91VZS=")AT'+hEc5e;6#pCCBk'1HfVdDUfW<`(fn\4Z
+CT(<C11Rb@3?sGFD,5.AoD^$BOtU_-QlW3Afu2/AKYf'Df/i0/e&.RChI[&/4`Y]3AWQE0f1aH
2D!.Z+AcWi/4!]!/2/k63&3!@0Jtd?1+k7@/2T:<0JkO?0f:L=0J5@C2)[9N/4";b@VK='/C(OP
:h=Yu7WNEa+@1$V@VK=5+P<UFK\3BYVqHgWW$#Mb/S`4TDJ<Q&-ms+MAKYT$@;]j..4u`/ChI<s
Bjr3!F!+n-F)N10DJsW1ATAo2@;TQuAoD]4cESKgATDj'BcnfuBl[foCFLkF$:/K@DfT8q/4`Y]
1cI9N/2f1B2Dm&2Zlh_VFt>p10etLE3@usD1GLF9/iba>0fV*E1c@6G2DZm90fCXA0f:dD0e>V2
@:Eq\/1f)R/44H$/6$:o+EVX4A8-."Df0!"+DtV)AKX9TB5_g!@N]B++Co&(Bm+&u+D,Y4D'2,b
@:Eq\3[!(QfnA"hfWj),fVfp$Cb<T!F`PEO@N['HFD,5.@rcL3-RgYW$:/KAAStp-85^Qc1bpd:
1GLdI0eCVV+@g![/4!\q0K(^G2_-U@1,LO:/ib^=3B8]K1,h3O0J"q:/i,LJ1,ps=6#pCCBk&\F
cEf&lASitdATDL.ARloqEc5e;6#pCCBk'1HfVdDUfn\78fX]Y6+CT(<BOPf$^L865-Zj$5+C]A"
DIb+;>AnC%FD,5.DIm<n+E(j7FD,5.@ps4cCgAJB%15C;BlA*,/4`Y]1c[6I/2f7D2)[#2[3/ID
@4X\q0etUC0Io"<2)m-A/iP[>0f_$B2)$sE3A<!A2(gmH3B/cM/1`?t[4G<P@4WU%BOr<.Ea`Km
FD5Z2@;I'(@;TQu6#:7RFD)e,Df'',+D,Y4D'3q6AKX9Z@:Eq\+CT)3@<<W#Cb9=/D..6'-mBjW
BOr<-BOtao-Z^DB@<<W6@;0O%+t5,g%15C;C12!gBIl\P+?);;3@lm=1,LsM/C(XG6[<;q6")<"
0Jk[C.l/t=3%Qg;1cR$B0ek:<2)7-J1Ft=</ibjE1,V!A/1f)S/44\q/.DqPChmHnA1U8L+>kl6
0e>4A1GCO7cF4or9joS)/1iD-/iY^>1,(U=3&icM2)d'C3A**B1GUjI/1`?t[k(NR@4Vip6#:=F
Cisc:E-!R$;BRhU1G^R@2)I$B/C(m_+@:!b/4!\q0f:^C2(LIA1,CI</i,451,CX;0etLB0fU^?
2_HmF2_d3N/1`?t]J1s(Df709$:/KD@;on#@;%2_;BRbQ3A`9D1c.-G/C(gL<D?mQ5qF]M0JbU;
1cI*K/2St62CpR=2(gmC2D[6K/2T:<0f:jH1,UU6/C(gX<D?mQ%15C;CLM6l@Ot&J+?2A82(UI:
2)[3G/C0"m:h=8j/M&J)1bLU?/2K.</i,=@3AWB@1,CO>0JkL<0J"b+c\3oHAS3P'$:/KDATKCn
;BReO3&`BG1H.-E/C(LC6ZR9"/M&J)1bLIA/29%>/ibaE2D?s=/MT4;1-%<Q3&<*:/C(LO6ZR9"
%15C;D.-k!/4`Y]0fC^C/2B"<0fCT.[3.bXE\&dn0JtO>0Int91c[*C/hf(42`33E3AN?E3@m!C
/iYUB1GCa=/1f)S/4"E!/.DqPCi*TjBIl\P+>to0/3,UF0J(MU+@0mU/3tg@1,(LE.l9":0J"t3
0eb.70J5@E1cR0G/2T+71GUsL1,UU6/C(RQ6#L3a%15C;DII7"/4`Y]3&EBJ/28h=1,_*CcESK^
Eciob/2At73&3'B2DmHF0ePC@/2K(;/hf.B1,gm</Mo@<3ArQO2`*':/C(LO7ri`'%15C;DIIU&
/4`Y]2E*HN/3#UI1Gp`/ZSEY%B6#OT/1iD./ibmB1,gp?1c7$B1,UU71GCF<1,L^>0J"b+cEf8W
;eL,%%15C;DJ<oqD(J4U+>Gl11Ft:>1GLU8cF"cjEbR'V/2/q;2DQj<0ekF70eP@E/3#I=0JtXB
3&rNA0eP480f^sK/1`?t[4G*oBe0]#6#:FQFCAr985^Qb3A`]H1,_'H2_<7_+A[#l/4!\q0Jt[@
2_?^<2)d'@/iPU<3&N<C3&rlW1b:45/ibaD2)d?C/1f)T/5L;#/.DqPCi3s4@<=%k;BRkO3&E0G
0JP:;/C/qk;e'_s6")K!0fCdA1+b7=1H$d>/ibU:1,Lj@1-%9J1c[*=1,U[A3ANNR1+Xt-c\!cI
@rEn-$:/KIBOPpl/4`Y]1H.-M/2T7@3A<#0YolS_@4Wu]0KCmI2D$UB1b^I8/ibpC0f1U;3&rlV
1cHs;3%d*H3&WHG/1`?tYq/Fk@4Vip6#:LRARf4Y/4`Y]2)dNO/2oIB2E*24YolDS66Ig2/1iD.
/i#151,C^=2E*?N2)$R:2D-pC1c@?M/1`?tYq/7_67`QQ6#:LRATD4$H7VTb+>G`)2E*QGcESKX
DIb:a@4X)d0K:m>1-%$G/2Ah32_6^:0KD$O0fCR<3A*!G0JkR?/1`?tYq/1YA1S/s6#:LRATDE7
85^Qe1H-jD0KD'CcF4omF(6ae/2/e70f:I92)6m;1G1XC/2At53&`NN2`!!>2(g[A2)m?I/1`?t
[k(?s@k8&r6#:RMCM@i@85^Qg1H.!=3&<HH3%W@f+@L6Y/3tgA2_[*F.lB.=3%Qp>2)Qp?2)['C
1G_!E2_6gC/i5L@0K1sB/1f)Z/4=Me/.DqPCiX*.@q]:%85^Qf3ArEK1cREFcESKgF(6ae/2/h5
1,(441,Lm?1G1XB/2Jt42)-gE2_lp>/iP[E2`!<B/1f)O/5UCt/.DqPCiXZ-@4XrI+>u,43%R$I
2`NQD/KdH%@4Wu]/M&b32`3-A2Dm*I3Ar`Q3%QpC/iYO>2_d0@/1`A(6ul]e%15C;F(&Zp/4`Y]
2`*EJ/3,UC0JG'(K-3R&@4Wu]0f_$F1b1IE1b^I;/iGX>1-%-C0K;'Q2D?[?3A*3J0ekUF/1`?u
K.KE2@4Vip6#:UPBjl."@<=%k;BRbN2`3-C0ebOD/2K"'9R1M,/M&J)1bLO@/28n;/iPID2`WWE
1c$a=3&iWK0e=k,1GLFSH#>/B$:/KLAT2<sDIG(e;BRbP3&N6D1-%'F/C(UF<b6(u6");u3&EHN
/N#@A1Ft753B8WF1GLL:2`3TP1b:491bL^@3&iWQ/1`?tZn,6hCb-#&6#:UU@;0U185^Qh2D?m;
3B/]K2D!.Z+@1!`/3tgA3AiZM.kik:1b:F82_cj=3B/WN1,q'D1b:O;1b^gH2DZm8/C(OP6#g]l
%15C;F(f!(/4`Y]2`EZO/28h41GLR7cFk>f@;mb`/2An70K1R<1,Lm?1bL^G/2Jt;/ho7A3&rrL
/MT"52`3TL2`WE?/C(p[6Xapb%15C;FCAm(/4`Y]2`3HO/3,XI1c[,4Yol>PCb..h0f_*F3%H[B
2)6^:/iP[>1-%9G2E<WS1,gaD/iYaK1GU[9/1f)O/4"8l/4OYuD'2,b@:Eq\3Zoj'VqHaVL=iib
YpggJVqHaU\(IV2VV&-r-t.!FDIIU,.3N'X\ZIIB\ZNf$b._S1+=JUZBOr;uCjB`4B."g+ART4f
AR-`;%15C;FCAm)/4`Y]2`!0B/3,OC2`<54ZlhbW@4Wu]0f^sD2Cg[E1b^I:/hf481,q6G0f(dJ
2)$R>2_I!H0f:dB/1`?tZn+Uc@4Vip6#:XSEb6jn;BRbS2`!!A2E*KI/C(jM9P&,n/M&J)1bLR>
/28t:/ib^A0ekO:1,:IB2E*WT0J"b+cFYW$AT'+/$:/KNA9)*085^Qc3&3ED1Gq0H1b?q]+@Ak3
/1iD,2_m3E/M]=@3%Qg;1c6g=0ek:71,CjI0J"e23A**A1GLRA/1`?t[k'm@@4Vip6#:[[@3@jY
F*)G2Ch[rA85^Qe1H.0B2)R-C1G$hc+B;-E/4!\q0ekCB1+P.81GUL</i5:60fD$E2)I0I1,CI;
0eP==3AEEH/1`?t^+<8Y@4Vip6#:[[@3@mTEb/ZqBlbgr;BReP2`E9F2)6mH/C(pO<Gc.q/M&V2
0fV$@1G^^C/2Jn83@lmC3A*3E3B&`Q/2K(70KCsG0JtC4/C(p[<D?mQ%15C;H!r6p;BRnQ1bgOA
1-%0L/C(a[+B)il/3tgA3&NTL.kie71+Y772DQg=3&E6A2)I<M3@m!>1,(LB0JY11/C(a[/5p,#
/.DqPCjKf9E\'aZ+>Pc51b:F<1H%!>cFtDkASitM/1iD//i,@90eb=71GU^A2)-X:1+kOH2)RBL
/1`?t^+;ccD(H,'6#C%@Bl@Zn/4`/O1c$jH2_6^E2)R'=?Q_^1@4Yb:?S"/h3B/QM1G1ID3&N]M
/1iV;/iYjM1,^s?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43-?/0[i'B4Z*t@;[3,Ec5o8F(&lH+@0jQ
A8,sq@3B9*+EV:.+D5V'+E(j7FD,f7A7]d(Bl5%bB4>d%D0^5:Des?)GqL4*F!,[<Cht5&F!,L7
E,oN2ASuU(DJ(),F`VY=@q@266#C%@Bl@Zn+DGm>@;L"'+CQC*De'u/Afto.G%E3IE+NHfAKYE!
A0?#4BlnVQ+q4lFD..='Bl7@)@4YJG;c#&%1b;]o;c#&%1b;uV6ZR9"?S#P80eb490J"q:2(g[F
3Ai`Q/1iV5/iYaC2E!<A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'
Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44H"/0[o(Bl%L&E+s3$F!,FBDfBW9
@;IP=6#C%J+B)ul@<l9(BlbD8DIjr/Afu2/AKZ)=D]j.BBl7X,Gp$X/Bln'#F!,C5+EV:.+Ac`c
Ch[j-Bl7K0F!+FjB45UpB-;&:FD,T/DeF>H+CT.u+DGm>FD,5.E,oZ0DfTB&@;I&sASH73+E(j7
FD,5.De!?eDBNA*A0>i3DffQ#FDl1BDe:,(Blds!Ec#6&/g:`36#L+ADesPI=$]b]/N#:7=$]b]
/N#:7?Q`0VB.RC@?S!oe/i#+31Gh'D1c[BP1,CI@/iP[C1,gm<1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/5Tnj/6$b4CM@j'+E2@>E,Tf+Cc`b*DII'oCipk7F!,R<AKYr4Bl.:!Gp$d=D.RNlDIal.Aft&q
Ebf63+CT.u+ED%*ATDi7FDi:DBOr<'DffZ(Ebo0%A0>T(+B3K(CM@j'+CfP1FEMV8/e&.RDI[?g
/4`Y]3&EWU/28k50JG:6cF=u_EH3T^/1iD0/ho:91G^j?1,([E3&N6=2_I$K1GUsF/1`?t\1Bpc
E\%Y,6#L=HFCf>uE\'aZ+?254/28q93&iJ8KJFZ=EbR'V/2/h:0eb170eb:41bL^F/2T+72`3TR
2`*';1,1C80JkI<3%QU3c\+&)7<3)n%15C=Bjl$j/4`/O0eb@C2)[!C2`NQH/70N"9joS[/70qe
/iYa?0fM$D3&EEM3ArEG2_I!F0K1dE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4Y?$ARoLrBHV87
DfBW9@;J"J6#LCFEa^))F!,R<AKYl!D.Oi.AftM)F)YPtATMO!E$/k4+EV:.+D#M+@j#`/ASiPU
DJ<O"@3B$)+B*JqA8-*u+CTD7BQ%o687?OZGp#giEcc#5F)PqK%15C=CLLX&85^Qj3@lp>3&)u0
Yok/cBOr_H/2/b52DZpA1,1a>1+kC;/2f+<2_[6J3@la=1+k@:2D@*I/1`?tYq/^bALn8t6#LaT
E\'aZ+?),22(UaF2`EHBcESKmF_iT\/29.?3&`?C1c-m;1bLUA/2B4@/ho:C1H.0B1,LUA2DdEJ
1Ft(.cESp$F_iT<$:/QO@<,q#/4`Y]2DI!E/3#=B2DZo0YoltTD_+1*0fCdI1bCI@1,^[</hf17
1,LpB1GpmI0f:L61,^aA1GUX<1Ft(.cESp!@rEn-$:/]B@;Ni`F"BjM+>GZ,1c[HF2_m?L2(W)W
6>pcn?S#P82_I'D/2At:/i,=A3AiNB0fUd@1Gq!C3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qpDf70N
6#L4OEcPT++E2@>E,Tf+Cc`b*EarNoBlbD2F!+m6AmoOpF`S[EART?sBl5&8BOr<(DfTr5+E(j7
6#L4OEcPS>+EqL1Eb-A8BOr;bF`&=@@<6L$F!,R<Ec6)5BHU_+BQ%]u+DG^9FD,5.D/XQ7FCAm$
+EVgA@q?ck+F.O,EZee4+D,>4ARloo@<?(%/g*`-+Eq78+E_a:A0><%+CQC3EbTB)FD5o0+EMI;
@<*K#@;KLmA79L$@;]TuEb/ioEb0,uAKYr1Bl8#8AoD]4F(f-(BOu3pF!+n/A0>GlEbp"DBl7Tm
@VKpmDKKqBDe:+XDId[+Ea^RE%15CA@ruj6F`T*);BRhQ1b^I=3ArfP/C(LC6>pcn/M&V50f:m?
0f^sC/1iP.0JtC:0f(FB0f:a@0J"q=/ho=@1b^p@7ri0PCFh$^Yq/4[D_*)3BOr;VEb/ft+EV18
D'7fMLsLXt]$H&T^Yur)c[jBVc[m9VARTIt+<i"/BOr;VF^]<$+sK)kBlkJA@<3Q6F(Jl)AoD]4
FD,B0+EMX5EZeh:+CT)&+CT.tBk;1(+CT>5Ec5i6D.Ra/+=K[!@<?F/FD,6'ATKCF883$^@<,jk
F`T)V:ipVlASl]A+CT.u+DGm>E,Tf=Bjtn(+CT.17;$mbFD50$+ED%1Bl7X+@qBOfAKYGn@psM$
AKY]/+D,P4D.R6#E+*d/+E(j7FD,5.7;$mbFD50$+Cf>-F*(u0CghF"Df-\9Afu2/AKXNXE,]_<
7rMpKATMo8GA(n;B6@X'A7]9oFD,5.@rH7+FCf9)@<?4%DBNk0+EV:.+@:3eCaX9H9P%iZ-uX,K
6?R*\-Z^D0BPD*m.3N\CASrW)DBMqR@4i[4AhG2sATMR(A1Sj)DfTW7+CT.u+@KX`F!*=u2BiS;
6#paL@N\KcF*(u6BlA#C85^Qh1Ggm=3AiQP1b?qX1*BM.E\&dn/M&_21,ga>3A<'F0Jk^F0J"e4
1bL^I3B&lW/1`?tZ8*t0B6#O4$:/]J@:C?UEbTH4/4`Y]2`!6K/3,RC1bgQ,Z8!J#B6#OT/29.?
1,^^@1bq$A1G1[G/2B4>/iGRI2)R*>/Mo::1c76Q2*!3=/C(OU/5p2%/.DqPEc,Gt/4`Y]0fV'K
/2B(C3&N84Yol_OE%F:+0JtXA2_?aC1c[*B/i>U>3&<0A3&3?L2_6O82_I'F1,:gL/1`?tYq/R[
E%DG*6$$OICi!N285^Qh0f_'A3AWNH2D!.^+B)on/3tgA3A<3H/M]=D1Ft:62D?[;3&N<H2)?pC
1Ft+53A*9N0JGC@/50JoBl5IQcF,9&B6#OI@<5piCi!N&-mBjDEc#c0F<VnX/g+)2F`Lu'3Zp_)
D..'gF*&NZ2)-s4%15CBASc1*F!*bkF*)G2Ch[rA85^Qd1c@'>1bq'G0eCVW+@C$V/4!\q0K:mG
2_-UB0KC[?/iba>0f(O:0fLgB1cR$@3%cpC1c$gG/1`?tZn+R^@k8&r6$$URCiseA6>pmU@;KY!
/4`Y]1GgpK/2T+A0K(K-ZQMVQ@k9oS/20%?1G^O:0et^>1bL[E/28q7/iYU@1c-s=1,1C<2E3QJ
0e=k,cEf&hDIY4,$:/`HCh7[$@4XrI+>Yi61+Y7<0ebU=cF"ccH!r6i/20%?2E33@2DR-@1G1LE
/28q8/iG^G2`W]G2D-g@3&iTP/1`?t[4Fjo@4Vip6$%!ZA8-+#ALpAM+>Yo93@m!E2)R9CcFG&b
@<*nN/1iD./i#.40f(gB1,gsG1-$m;2*!9E2`3?H1+Xt-cFGJn@<*n.$:/`TATD^.ALpAM+>GT.
0e>%<2)dNH1,0nN@<F+e/2/k:2*!0B1c$p=2(ggG/2]=<1cI<Q3&`BD1bLXC1c7!C/1`>-0e?:4
FY!t/6$-ONDfT9%@4YJG;c#&(1b;]o;c#&(1b;uV6VUu??S!lh1c.'A1GUgC/28n42E<<C0JP17
0f:X?1+Y"51+kOD3&<NM/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Q=@4YArB5_TtF(HJ5Ec5o8F(&lH
+@1*XCN"6%CLJ?&ARTIt+EV:.+Cf(nBl5&3Afu2/AKX9\@:O4r@6,NQBOr<&@<-!lF*&OADfor>
@;0U%Ea`iuAKY])+B38lD_;J+6$-dO@X2j&/4`Y]2DI!C/3#=>1GLH+[ie(Z@4X\q0fCdD0Io%9
1GLF9/iPR;1,Lj@3B9#X2)m-F0eP=<1bpdB/1`?t[k'pf@4Vip6$-gV/4`Y]0ekI=/29(?1cR&3
^E??aE\'L-0JbOB1Fk7:0fLX>/iY[=2)['@2`WfP0J#"8/i#CG1,L[9/1f)]/5Tnu/.DqPFDPB,
/4`Y]0ekUH/29(C1cHs@2]u(.FY#ge0e>"71c[<A1,L[@/2Jn:1+Y:A/i#F@2*!TH1,LU;2)@'D
2(U:01,ga`@<F+1$:/cSBjiP`;BRkQ0fLXC1,:dE/C(LC<,t8U/M&V71cREG2E<HH/28b;0e>(;
1+k:>2DR$J/1ib?/hf%>2_d'=9OW$WDCd?aYq/jp5qGBADKKo-@ruF'DBNk0+@9L^ATAo(ATMQu
DIIX$Df-[`-u<j9@4<<uEbQq1DJ+*.Bdk/j.!9TQEa`cuF"&^N$:/iLDfRC";BRbO0K1O>0ebCB
/C(XG6Xb!d5qF]L1,:^=2*!HI/28b:2CpR<2(gdB3&ETK/1i_>/i>=C1cR<C7;caSBldr=/C(XS
6Xb!d8T&]_DKKH#+D,P4+B3#c+@0^^+@0g\@;]L`+E(j7FD,5.8514%@<H[+@ps0r6#:CHDII#t
:M+3Q@q?)V6$U;RCi=E3/4`/O1,:[E3AW3@0fUsD3@nM[6Y1?j?S#P83%csB/2K.D/ibjI1-%<F
/M](61bq$F0fCR<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j,#)WnBk(Rh+E2@>E,Tf+Cb?hrGf-k(
Dffe<D.R-nF!,[8FCfJ8@;]dr@;I'#DBO%7AKYl!FD5o0+AQ?YF^]B.+DbJ(B6@WqALnsJBPCsi
+DGm>@3B]1BlS9,+CT.u+CfP1FEMV4Ci"A>F(o9)BkD'h@;^00ASu$iD/!K&@;TssBjtdpF`S[H
E+NNnATJu+Ec5e;FD,5.@UX=lDBNk0+AHElBk)'6+q4lFH"D80Ed(r&Gq;KS+>Gi71bpU:1H@HO
/70MgEbR(3/70qe/iYR:1c6m>1c.$C1+Y"40J5==1,^gC/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Wd
Be2u(@;]pjEZf=ADfBW9@;J"J6$[$e@<-R#A9f;3F!,R<AKYetEbAs)F<G"0A0>`-F*&O=D/aE6
FCB'/+ED1>ATAo-DBMZ!@;]pjE\7e.6$d*YAmo:[B4WVb;BRqT0JP+50K1^B2D!1)0d&i/B.PVc
/M&_22E<<E1,U[A1,CgB1+Y:;/ho=G2DR'>/1f+t0e>\;B.OK!6$d3Q/4`Y]3&`ZF0f(aB0eCVZ
+@U<b/1iD)/2Jn<3@m!D/ho%<3&`WE/N>@B3B/`M2(U:0cF5>nEbR'6$:/uTBk1p/85^Qd0JkX<
1H7*J0J(M`+Ad3"/E22D/20">3AW6B1c7$>1G1LA/28k</i,7=2)[6A/M].83&N]T3&W<=/C(s\
:j$_.%15F1ASYh!/4`/O0f(U>3&W<H1GL[D/3"bP9kc.c/28t=2E33G1c7*@2D-sF/2At;/i#+8
1cI3A2`*-I0JGLB1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/3#1\9kc.&;f?f#BHTrdEb/Zs+E2@>E,Tf+
Cc`b+@:a4bFWbC>+EV:.+D>J%BOu7,+Dl%>DKK<$DBNk8+EV:.+A6WnARTI!E+Np$DKBr:@4WOB
BlnK+FCeu*Bl5%gDfTr5+A6WnARR,4@;]TuF*VV3Des-/ATJu9BOr<(@<?4%DII?(F)Yi6BlkJ9
Afs`bEb/Z3+q4lG@<-6oEb$P=+B*AjE\'^Q+>u5?/3#RK1H-jc1,Ua>+AZri/1iD)/3,=?1b:C?
3A*-G1b^[@/2St;2E3HO3%RWe<?P@5;bekp<\cNd0J$"=BIjT"6=FtIDBMS\Bln97/4`Y]2)@6D
3&WTN/C([H6Y1?j6");u0f:[C/MSq70J#"42`*'@2_I'J2)-mG/1iS1/i,:@0JkU;/1f)T/43uj
/.DqQAS#^mD(J4U+>GZ41Ft:82)@*@c\4.t7<3)n/M&J)1G1[H/2fC=0JGLB1H@!<1Gg^<0fD!J
3%SQXEcQ;AFCeu6/C0#+/4FSn/4")h@:s.mF<E:q0f9CI6=jkA/4`Y]0etaK/29.B3&`D6^G-j"
EbR'V/1iD0/hf+52DQmF2E!BH2(U=;/iYXG2)m9@/1f)]0e>b6Be0]#6=jtECb/+F+>Gi11Ggj<
3AiNH1b;uV;eL,%?S#P82_HsF/2B4>/i#=D2DR3B/M]+72DI3L2_Zd<0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL;eL,%;e9iXB45UfF(HJ5Ec5o8F(&lH+@9XUAS`K'F!+m6Eaa!"+EMIDEarZ'De:,9@<?($
+DG^9FD,5.DJsQ;BHV5*+B)ihAS5Ff/e&.SASc0kFE2)?/4`Y]0fM*H/2B(=1H$f0ZQN%aBe1he
0JtUC0e4q91,1=7/iGO;3&*$@3&3EN1b:O;1Gh*N0Jb72/C(RQ:NC/#%15F5Eb/p0DJ<N183p3,
:b=CZ/4`'+/Pn#R2(W)W:h=Yu?S#P80et@81+Y=A/i#7C0K([;1H@'E2D@$G1+Y170f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r)ATB=G<GQV`Bl7WnDBNn=DfBW9@;IP=6=k1KBR+K0@3Bc&F!+m6;f#lcBk&8r
ASH73+E(j7G@>T)EcW@3DIal1Bm+'.@UX.iF!+q7F<G:8+Dl%;AKZ#)@qBP"+EV=7ATJu-ATAo7
FCB96F!,.)F!+q'ASrW0Ec5f5FCeu*FDi:DBOQ!*De:,#+DtV0Bl@ltC`mA/A7T7mF!0ImPTV.o
BOtUmFD)e6DffZ(E\&>PEc6&2@rua&F)rIBAfu2/AKYPmEcbt=+tb&K$:8<GASc!jF`V+F85^Qc
0K(X:1,h3Q3@rI\+A[#l/4!\q0Jt^F1+P%;1,LO9/i5F:3&iNL3ANTN3@m*A1b^jB2Dcs9/C(LO
:NC/#%15F8@<,doBe2eQ+?2/:/28q90KC[@0d&c&Be2PY/2/h:0JG"42_d3A1G1R?/2T+71c[ER
2_lp>2_HjD0JtOC/1`>/0e>V2Be0]#6>9nB`.9I16m+HI0K:d<1cREK0e?ZS;e:2)?S#P83%d-G
/28tA/hf%;2E!9@/Mf"=0K:mE1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,AU#aM8T&'Q@;[3,Ec5o8
F(&lH+@9dOBZ,HE>;'I-Waa)I@4tn/BlbD=BOr;QASu-hChY#2Ec5i<DI[BhFD5Z2+E(j7FD,5.
;djQbCN=-2+EqaEA0=oe@VB1$+EqL5@q[!%ARTIt+CQC%EbT0"F<G%(@;R-*Afto(B4uB>+q4lG
BkUpl/4`Y]3&EKH/28h=1bq!@cF=unAS3PG/1iD//i>C81G^d=2)I<R1H@!E/ho@F3&WQD/1f)V
/5Tnj/.DqQDf]i7@4Xr;+>PW/2DHm:0ebOA2)-Xh+@1!f/70r8/3#7<1b:F<2(gjG1H.0G/1ie5
1b^mE2)?d=0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#gor,!p3hDJ<N%@;]Tu87cgfAS5q)Bl7?%E,ol9
Df]?'4!6k.F)Pr)+DGm>FD,5.DIIBn+D5D3ASrW4D]j.8AKZ)+EcPl9DfU+GDe:+YDf]f1@3B9%
+EV:.+>GQlBHUerDKL#AGqL45@<?($/0K%JAKYl!D.Oi6@<3Q5Ea`j,AoD^,ARlp*D]hAbF)G]#
+E):7B5)6lFD5W*+D,Y4D'3q6AKYl!D.Oi.Afu2/AKX<XF)GD/EbT].E\8OF$:8ZQASH$585^Qj
2)-X:1cR9N/C(UF6#pZj/M&J)1bLRA/2T:<3A<BJ2)[!?3A*6G2E!KN/1`?tZn+L`Be0]#6?6LE
BPDU+/4`Y]2)[-E/2o@D0f1H-K-3j%@Oser0f:XA0eG.<0fLX>/i#:81,:a?0JPLD2E*0=1,U[>
3&*EO0e=k,c\!cBBjrV&$:8lEF`8m&6m+9F1,q'@1,^pJ0J$QR9kA2n?S#P82D-mJ/3#I=1,V$J
0Jb732`!'E3B8lP2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r&ASs%bF`VYF@;KXdDBNn=DfBW9@;J"J
6?Qa[E$/k9+EV:.+@:!bDKg5DEcl84+EqaEA0>K&EZek*Bl%<4%15FEDIG(e6m+3B0fLs@0etID
0e?ZS6#L3a?S#P82_HjF/2K:=1,V!N2DZm@1+k7=1,^pB/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K\
A1U/kBPDC(Bjkm%E,ol9Df]?'4!6k4DIFZ%F!,R<AKYK$D/F3/Cj@.GF(Jl)GAhM4+D,P4+Cf>%
An>NrBl5%^FD,B,E+r`5%15FEDId0,85^Qi1,^s?0ebLE3&W>5^*#^]E\'L-1,1RD3%ZgC2)-X=
/iYO91GUd>1c%'N2)[!;2_I'I1bpa?/1`?t^+;QiE\%Y,6God=_l7NlF"BjM+?25;1b:OC1c$[i
+Ad,h/70r8/2o191+Y18/i,1:0f1j@1,pmD2E!HR2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F(6aF
7WN'X@q[!(Ec5o8F(&lH+@<uFCr<5iDf[%F@<3Q5BOr<!De'u/Afto(B4uB<+E(j7FD,5.;fut/
+CT.u+E(j7BOtUgFD)e2DBMGXF_kc5BHV/;FD,T/DeF>J+q4lH@;^"&F`T*);BR_N1,^[>0JkRF
/C(LC6Xb!d5qF]J1,L[:2)7!D/1iP.2DQgD2(gmK2`W`T/1i_7/iG^I2E!9@/1f)O/43id/.DqR
@;odoCgekc;BR\Q0K:U=1c@$I/C(LC6$73!6");u2).!J.l9.<0J"n10K:UB3A*$F1,C[F/2T4:
3B9#Y3AE'9/C(LO6$73!%15I2E+gdn;BR_L/2oCD/C(OD6Xb$e5qF]D0KCm=2*!?N/2Ah53%Qg;
1-%0K1,:C<3A*$C3B&oP/1`?tZ7J@OF"@b-6Xb%XDfRC";BR_S3AE'@2E3QJ/C(LC7qHNg6");u
2`!9K.l/n;1Ft753B/QE0f(F?1c[BJ3%Qj?/iYgM1,h*B/1f)O/4X8g/.DqR@<6O5Cgekc;BR_Q
2(UR@1,:E,Keac<@<3tO/1iD0/iGI90f1L;2E!<L0e>1B/ho=?0Jt^=8O6?!=%?1a/1f,$1+Ye$
F"@b-6Y0_8CiWru/4`Y]2E!6F/3#OH1bpW-Z62q^BIk_d/M&Y02`<3B2Dm*H2E3EI2Cp[;2)[BL
0JG%//C(OP:N0tu%15I6Bju!3844RY1GgsG/2K4?3&E0n+@BgN/70r8/3,==2_6[<1bLaE0ebID
/1ie?/i#@F3B&cG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44)Z/6-_5B6@X.@;[3,Ec5o8F(&lH+@B^S
@W*B'F!,R<AKYl!D.Oi.Afu2/AKYl!FD5o0+EVX8AKYo'+B<H)B6@X.+EV:*F<G41G%G_;EbTT+
+EVNEFD,5.DIIX$Df0!"+D,G.G@beI%15I6CggmmD_+FW+>GT-0J"q;1cRKH0fC.R@<F+Q/2/k:
1cR!@1bgp?2(g^C/2]=<1,(CA3AW3A1bLOC3A`WR/1`>,2Cqg9FY!t/6Y1:]@;^0uF"Bj[+>u):
2(U^F2`WcIcFb8cEa^LN/1iD1/ho471,_$C0JbUB2)Qp:2)-^C1GgdC0e>(60f:(K@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O]IZ?h@4WTs
BkMR"C`m8"+@B^\G%#91ATJtm@:==jA9)*$-o!S92_?aB0fCI'G@>P8@3B/jD/XQ<+B*5fDJ=0*
+Eqj?FCfJ8@;]Tu@<H[*DfQt=Afr9A7;O)<DJ*NuBlA'2+@p3W@;KRp+@L-c+Am8qG].\8+Co%+
CgeG\@;]Rg@3QmJ+q4lHBOP^cG@>A?85^Qe1,h-C2)@0H0e>.?+B;-E/1iD)/2]%61Ft7=1bLaG
2Dm?J/2T%51c$g@2)[!@0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(F?ARoLsBl@l?1cHsc9joS?BOP^cG@>A3BlbD*+DlCGBQ%^*B5(jaC`m5.De!]r
Bl%?'CM@[!+D,Y4D'370<+o]S+D,P.CNO!$AM+E!6YKnFF_c,F/4`Y]0f1U?/2An=3A`;4\2#1+
@<F+e@4X)h1,q3C0f:gD/2Jn;1FtFC/ho7A2)mKF0f:RC2_[3N1+Xt-cF>V\<+0o#%15I9@;g*u
Eaa6%/6>,9:b=OY/6>,9:b=OY/70MgEbR(3/70q_0ePCA/2T.82E3ZM2*!3>0eb4>3B/]N1Ft:8
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qsEbR((BOPTtE,ol9Df]?'4!6n(@;d8bBQ@O,@3B9*+EV:.+D5_+
@<<W4Bm+'.+E(j7<+o]SCgh3l/e&.TBOPpi/4`Y]1cIBO/2f4=0fLZ/Z62M8DCe(^/28n91H-g@
0etI71bLO?/29+D/i5@A2D?p<1bgU=2)d?N3@l^4cE\ug<c0Gt$:AK8F)T$R/4`'+/Pn#V/4`'+
/Pn#V/70MnH#bHC/29+=2`<0B2D[9C0ek:@2CpUB1bLU=2)I6G/2K1:2DR!D1H$d>0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL9R1Y0;f$Aq@;BRcDBNn=DfBW9@;J"J6YKnLDoIMTBlbD*DBNA*@qfLlF<FLu
Dg#Q)+EV18D'3G/EZe;'DCuA*6YL%@BPCm+844RT3ANKQ3@m0N3&rfH?Q_XSCb/pE?S")f1c-a>
0JkC91,Ua?2_6d<2)m9K3Ai?C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#g]l,"$$T@q]Rb+DGm>@3B/u
@<=)BF`M)&@qB1%+EVX4A8-."Df0!"+ED%(+EqaBC`mD"F<GdGEc*"/Gp$s8DBNA*A0?)7D.RT9
+EMgF@W-'sF(oN)+EV:.+Cf>4DKKoE-Z^DNBk(g!FE1f#Bln'-DK?q/DIal(F!+t2DKBN&ATD?m
+CT=6FD,5.DIIX$Df0!"+D>=pA7T^lF)rI9DfQt7DBMo$DJ=0+@4i`5$:AK<Ecb`-/4`Y]1c%!L
/2]7D2`WG7\0+IVD_*Ik/M&\11G^R:2E3<H2D?g>3@lmB/i5=D2)d6@/1f)V/50Vn/.DqRBlmco
ASc0o/4`/O0f:X?/29"=2_8;Y:ig+t?S#P83%d!F/2St=1,1L<0J"q8/hf.>2`3KE1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/5UCt/0[VnBln&tDBNn=DfBW9@;J"J<+ohc6YUXNA7]RnAKY].+CQC/@<-!l
+Dl%>DKK<$DKKf9+D,P4FE1r6F!,17+AQiqA1Sio@;0gt+C]J-Cige.AoqU)+@opTFD3+D+DG_(
AT23uA7]XgALns4DIal6@<3Q%ATMQuDIIWuA0>;'<DGt]6Veh+DfTZ)+@p'aBlmcrAKZ&.FCcS'
Ci=3(+EqOABHVD1AKYl%@<,h&+B)]dF"L=/F^o,.:gn0K@q@8:%15I:FCB"'Te&`&+>ko02Dm$A
1H.$K/70MoDf.+5/70qd/i#F<0ebI;0K1jD1c[*=2(g[C2_d3F/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
?S"oiDCe4m+B)]bG%"p"EbSs"+E2@>E,Tf+Cc`b,Blmd"_kA2iARTIt+AuosATAo3Afu/:@<-E3
Bl5&8BOr<(@<?4,AKX`VBQ[a*+DbJ(B6@WqAM+E!6Z6IK@W-'m@4Xr;+>bi-3%QjB2`WEr+B)cd
/70r8/2o1?3%Qd=/ho(80JkX</M]4:2)-sH3&<*@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;e'Vp:2+3H
Ea`U'@;[3,Ec5o8F(&lH+@C'WBju!s@ppKoF!,R<AKX`VBQ[a"F<GI0D.Oi%DfQtBBOr<&@<-!l
F*&O@@;BEsBl5%\ASuU1@;I&PD.Ra%@ppKoDBM\g@psCdB6@W8%15I@E+O'-Bk):,/4`Y]1GppC
/2T.?3&`BG2'>8(@k9ns0K:pF2CgOB1,(7:/ibd?0f(U<0f1mG0et:83%d!C0K:gA/2An62'>Y&
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdY&
/44;b/0[i'@rH0lF`SZmDfB9.DJ<U'F!,CA+AHQcDeris+A6WlATD[&CEP#[1cI3B0f:dD.3NhC
F!+m6:iC/aF(c\)F*)G@DJsB'EZfR>D]j">DfBW9ARlp*BOr<"ASc(!@qBP"EbT#+D/WrrC`mY.
+EV:.+EMI;@<*K3H#n(=D'3P1+D>J1+C]8-CEOfF6tIK]ATi!.F`_>9DJ<R&F!,CA@VKt%+Cf>$
Ch7[0Bm"8:+tb&K$:A`P+@BRXDes,=85^Qe3AEBB2D['C2([%X1*AqbDCe(^/28n;2D?X;3&*EE
1+kOH/29.A/het;3A`NC1H7!C0fUsJ2CqO1FD5V8-q/#dCh[s(.4d$qYqdjt<c0H49OVdI+=Js&
2_um6+Acc\H?s9J-o!\91asUX$:ArN@;RPd;BRkP0fLXC0Jk[D/C0.q87cfm5qF`K1,Um=0f1R>
/2St:2_6^@2D-dC1H@BS/28t60JbL?2`*':/C0/(87cfm%15IFEcYY?85^Qb2E!HE1,CmK2([%Y
+@U<b/1iD,2)$sK/MK%92(UL82`N?I2D.!J1,LgA/1i_30K:sI1c?m9/C(OP7<3)n%15L3@VKL,
85^Qh2`EWG0eb:;1c6i0Z8!Ih@;mb`@4X/f1,1I70f1^G/2Jn42(UO;2(gXA1,psD/1iS5/iPaE
1b^d</1f)P0e>\#E%DG*6t'nGD(J4U+?;>9/28t@2`WG7YolMSE\'L-0JbF=0eG.?2*!3D/iYa?
1cR*A0fV-N1b:463%d3N2`<EF/1`?tYq/@_E\%Y,6tL7I@Ot&J+?);91b:@81,(^J/C(LC6[<;q
/M&Y21bgg;1c7!H/28b42(UO<0J5.=2`WiO/2T4:1,psD1H@!;/C(LO6[<;q%15L7DIm9"6#:1F
A8*Sc;BRqT1,:C80K1jH2D!.\+@BRV/4!\q1,1UE0J,";0K:U=/iY^>1GUj@2`<?E3&E0<0fCX=
1,gsJ2_6L2cEo,i@;mb,$:JHCAR]Ro@4XrI+>br31b:LC2D[*>cE\QdAT'+O/28k93AE$=1c$s>
1+k:</29(B/i#=A3AE3=0f1L?2_m'E3%QU3cE\upAT'+/$:JT:A7]U/85^Qe3AriJ2Dd0G0eCVT
+@C'a/3tgA1GLR;.krt=1+Y773&N6A3B&QI3B&WI3@lmD/i>CE1c.-B/1f)O/44>m/.DqSBl7R%
CghT?844R\2D@$F/2]7=2)m-o+A??b/70r8/3#7;0e>%;2D-^D2)6pH/1iV02)-mB0fU^>0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL9P&,n,#iSsDJ<WiA0>;uA0=ii@UWnf+E2@>E,Tf+Cc`b-Bl7R%CghT3
D.R-nF!,RC+Cnnu@q@26FE_G?F<G"0A0>u:Ec*"6DBNM,@:F.q@<?''D/XT/D.RU,F"AGTH#7#/
Ch[s)DJ()6BOr;rF_l/BEb-A%DIal+@;]_#@:s-oDe:,6BOr;pDI[7!FDl2@+E(j7FD,5.E+Ns,
Ch4`-Aft&nBl7Wq@:UKhDIakhDdm-fD_<4C$:JTIBOkO&85^Qb3&iHF1bh!AcE\Q[ATTIT/1iD.
/hf+50eb4>3B&`Q3@la:2_I*M2E!6I/1`?tZ7J@SF=[k.6tppT/6>,9:b=U]/6>,9:b=U]/70Mh
DfRC9/2/h91bpX=0JP740eb4?2_6d?/hf+90JkL8/Mf(50fD$G1c6g>0JPR18O6?20JFVE@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBn
F"CZL7W3;u,#)KgEbTW0@;[3,Ec5o8F(&lH+@Kph@3B9*+CT.1DeX#1Cgh1"+EV:*F<G:=+C]A0
F_>B0+C]U=8T&'Q@;[2rDI[7!FDl2@+EVNE9jr0bBln'3F!,17+EV:.+>Gi20ILom+CT.u+DGm>
F`V,)+D,P4+Dbb)BQRs+B-:`-EbTE(+EML5@qf@f+E(b"@<6.$DK@?OBl7EsF_#3(B-;;0AKYf'
B4uB0An?%*Bm*p$+E(j76tpjRChYLG%15LAAnbda/4`/O0ekUF0fU^B2D?sH/70N"9joS[/70qe
/ho:91,(L:0ebLB3&3$:1cI$B2_d*H2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqASs%jDId['ATMQo
DBNn=DfBW9@;J"J6uQ[OA76TtARTIt+E)CC+EMX5EZf(6+AQWZF!,:-DJ+*#B4W\)$:JfL@UXO5
83p3,:b=IS/70N"9joS[/70q_0eP==/2An;/hf:B0f1U91cR*A1,q0M3%Qg=0f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r.9joRs;K[&%Bjkm%E,ol9Df]?'4!6q0D.6q!+DGm>@3BT%F)Q)@+ED%+Bl@l3Bl5&8
BOr;]DfTr5+@BR[@psG$F!,=<F`);0Bl7u7FD,*)+DGm>ASu!oDf]K#+C]U=D/XQ7FCAm$+D,P4
ATMs7+CT.u+ED1+BHVM5Ch.?rAn<M9Bl7EsF_#3(B-:Yp@<-E3-t.0>FD,B0+EMX5EZf14ATJu.
DBO%7AKYK$DKBo2Ci!O%Bl@l3<H<.h+AH9ZDfRBOFD,5.B6%QlF<G%(@<*eL+q4lIF(8m+@U`as
85^Qf3AiTD2`NWJ0eCVW+B)cg/3tgA2D?g@/M](;2_6^:1-$m@1b^O93&<?J3@la;1+kI?0fLg@
/1`?tZn,-cD_)>)7!2sPALpAM+>bl.0e>1=0K(X:cESKl9joS=/28k51H-gB0f1a=0ePF?/29%?
/ib^B3Ar`G2DHgC2)-d@2(U:0cESp#9joR^$:K2S@UX.*85^Qg2D[6B3&WZL1b?t/0d&l)@4X\q
0fLpD3@d$D0KC[@/i>R=1,_!B1cR<O0f1F?1+k:<3&i`R/1`?uLbUGKEa^L.$:Me5GJgj?=$]b]
/MT18=$]b]/MT18?Q`9WD_,6H0f:gK3%ZmF0Jk=80eP:C/2B"A/ibgF1,q3D/M]:<0K(XE2)?d=
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL;e'_s6Z7$f@3AH^@ps6tE,ol9Df]?'4!6r/XEVRj+DG^96?6dL
EbQY4@;]_#@:s-oD.R-nF!,R<AKZ&:DBL?:BkM'iEZfI;@;[30BOr<-F`&=GAKYc+Dg*WQ@;]Tu
FD,*)+Dtb6ATAo8F`MA@+E(k(/e&.V@VfI(844RU0fV$K2CpR;1c$mB/70MrF(6b./70qf/i>X?
1Gh$C1-%0L3ArE?1+k=?0K1gH/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##p@k8g&H#dV-DBNn=DfBW9
@;J"J7:L(A+Eq78+E)./+E(j7FD,5.ARTUqBk;@-+DY\/B4PptF!,17+B*Q+BjiP8@;]TuF(KB8
ARlolF!+m6E,ol6Bl7L"F<GU8B5):%+DG^9FD,5.12^VF@;]Tu1NI"KD/!g&ASu3j+@7\J/g:`3
7:]hJBk(g-85^Qf2`*?B2`3EL3%W@c+@L6Y/1iD-2)7!K.lB:D3%Qj<1-$m@1GLL;1GUaH2Cp^F
/ibgJ0K(^</1f)W/4=Me/.DqTCh7*uEa^Li;BR\K1bpU:2`*NT/29(+<+0o#/M&S31c.3C1,L[D
/2Jn;1+Y:@/i#.@3A<9@1,LU<0f(UA2CpC10fLX_@<F+1$:ScD@:iqg/4`Y]2)I!I/2o7A2)Qr2
Pos+AE\'L-0f1XF1+b180f1F</iY[=1,1^?0JtOA2`3-<1+k=;2`W`S/1`?uPq5sME\%Y,7;Qa^
EcknD85^Qc0fM$B1-%$E1b?q^+@C'`/1iD)/2]%60J#4=/iYgF3&!'</Mf=<1,UgI1,(71/C(aV
6Z6cl%15O?DIIX#/4`Y]0fM*I/2B(>1,pi1Z63+TFY#ge/2/q:2DZj=3&<HD0eP@A/3#@:2)d9N
2_cj=3%d*C2`*BI/1`?tZ7Js`FY!t/7;R'SDJ<u>85^Qg2_[*?3&`fQ1G$hX+@L6Y/1iD-2`3KO
.lB%:3@lp<1,LO;2E<BE2)-sF0e>1:/i5OI3&rlJ/1f)Q/4=Me/.DqTD/"2F844RZ0f_6F2)R-L
/70N!F^lt0/70qf/hf170fL^C3ArfR2CpF<2D-^D3&*<J/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#0!
@k:>mH=:Z"BlS9,+E2@>E,Tf+Cc`b.D/"2:Eb031ATMF#FE8R@Dg#\7Bl5&8BOr<&De!3l+AH9[
BQ\N-+DbJ(B6@WqAKYo'+EV:.+Du+<FD,6+DBNt2B5):%+E(j79lG>dD.74!F_*07$:SiHAh6JN
+?2/23%Qd<2`!0G/C(XG:h=8j/M&Y31c-s<0KD!H/2Ah63%Qj@2D-[?2DdBM/3,=B2`39C3@l^4
cF#3"AS3P'$:SuU@;.8`;BRqZ2`*'?0fCsG2_<7\+@B^Z/4!\q1,C^H1FkCC1H6pA/i#.41Gq!A
3&<HN2)QpD2_I!E1,CX@/1`?tZReITE%DG*7U]nHBlYaq;BRkX1c6gE0JbOB/2T+)6ul]e5qF`M
1,^g:2Dm9I/2St=1+Y1>2D-gH2Dd*G/2f@<2)[6I3%um=0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?1bpUMEa^Lg@:jCkEZfR7F!+m6
:2b/oAKYi8FD,T/DeEco@;I&sG@>N(+EqL;+EVaHDIm?$Bl8$2+CQC'Ea`U!DCuA*7U^1I/4`Y]
2*!KM/2oOD2Dm&3J07d#D_+1_/29">3&rQG2D@'@1+kOH/2B"A/iPL?3B&]E/M]4:0ekL>0K:U7
/C/ht;e'_s%15R5G@>N+F"Bj[+?)/53%R'K0fCm?cEn]]H"SZo/29.A2)$O;2)%!@1+kR@/2B4D
/i#7>2DmHF1c6m?1GCdC0J"b+cEo,iH"SZ;$:\TCBlbgr;BRbU1,CI<3&WKK/1hu8H!r6U/1iD0
/iba>0f1jB2_d6K1,pg:0f^j?0KCpF2CpC1/M'G<@4Vip7V-CMG]mM9ASbd+6:<C[2]t"7/2At;
2_8;Y6Y1?j?S#P83A*3F/2o191bq'J1+Y"32D-a?2D[0I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QU
F=\V'F^ecs+E2@>E,Tf+Cc`b/ASc(*+BDokASbct-o!Y?39#IP0fV$H.3NhCF!,R<AKYT!EcZ=F
FDi:DART(^+EM%,ASu!h+DG^96ZljH+CT@7FD,5.;djPd6Xb"ODf[%0DIakg@;[2RD.7O(F(oP8
;e9f[DIIR2/g*\r+E)41DIm?$FD,5.G@>b>FDi:5A9DBjFD5Z2+D,P4+CT)&/0JA=A0>>mB45[#
FD,5.AU&0*EbTB%DKK<'+EV1'@q]RoB-;,)+E2">F(o-*+DG^96ZljH/g:`37VlXKATVj.FCd!o
6m+3<1,1dH/2]@B2_Zdi+BE2s/70q_0f1aH.ki_83@m-B0K1O;2`<9F1,^mC0J"t33&33F2`WEE
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL<bZS*,"ZlbCh[<q+E2@>E,Tf+Cb?i"Ch76jFDl&=AKY].+EV:.
+E_R4ATE!5Ebo8/EbT].EZf:4+D,>.AKYT*Df$UeEb/ft+AI-'BQ%^*B6bV6DBO%7AKXQd@;KXd
DBNh*EcPT1Bm+&1E,T<)+E)-?FD,5.@:jUmEboH%AKW0@6tpgYDIFYTDf'?&A8,Hr+s8:%Bm+3.
AKX?YD/EipGpskFGp#L`DKKG46#:7JBPD$uBe1B:BQ%s'DBNA/+CT.1@;Kb&F(oQ1+EVNEFD,5.
F*(i2-Z^DBBk;=1+DtV0F`M%G+q4lKDf&p!BOQ%*/4`Y]3&`TP/28k81H%3DcESKgF$V?C/2At<
2`E<D3AWTF0eP1>/2K+>/i5:<2E<QE/M]==2DR$C1H-j?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"GVA/5UCR
/0\&,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!+,fnCR$VqHaUXkAN_WZYnrD'38'
/`F49@<Zf9-mrkMF`_:>De:,6BOr;uBldr8.4u`7DBMbeEcYr'DBNA/FE2;9DeF>H+EV:2F!,OG
@<*K7@<3Q$@;KakA0<'?87?+PDfT9(B.P0,@<?!mATAo3Afu2/AKXoiF`_:@+tOjTDIjr/Afu2/
AKZ#3H!tM3F*(i2F"SXG$:\rSD/XK(/4`/O0eb:>2)QpB2Dm0J/70MnAT',,/70qd/i5F:0fLm@
2`<NO1H-j?0J51=0f:dF/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"l^D_*)"BPD?qF(HIn@;0[lBcqA8
DfBW9@;J"J7W3<aDf]>0BlbD=BOr<"BleB7EbT#lC`mV(D.Oi.Aft&]Bm4!'+E_a:A0>T(+EV:.
+>GfsBHUerDKL#AGq:(TARTIjDJ()$ART_'BkDL(+DG^99OW$WDD!+B$:]&EDL*j)5u]F4/MT(5
83p3,:b=CY/70MjATB>//29(=0Jt@:3&*9A3A*9L/2B+;/ho(=0fC^:1H7!B1bpdG2_6^<0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70r!ATB=G6$76jEbSs"+E2@>E,Tf+Cc`b/Ea`j3+DGm>@3B&n@<,ddFCfJ8
Bl5&8BOr<'Dg#i++<i".Ble?0+sJ.@D.7EoH"h//+CT.1ASlBtEc5t@De:+XF`VYFBji,uDBO%7
AKY)H=EJ4!@qBP"F`Ma[+B3#c+EDC:AKY].+E2.*H"CM/@X0)<BOr;p@ruX0+A6-`ChRBoDL*El
_mX5q/g:`37WiNi/4`Y]0f:a<1-%*D/C([H6Xb$e/M&J)1G1RG/3,=<1bq$J0e>1</iYjL3A<ED
/1f)T/43ie/.DqUF_tQ'F(&ooCLLm-85^Qi2`END0ekID3&rP8Z62tb@k92_/M&_21cR$B1c6mG
2E<NJ2(UO93&30A1c6g8/C(OP:ig+t%15RIDJ:Xm6m+3<3ANEL/2f4;2`E9p+@L6Y/70r8/3#7@
2(UIA3%cm?3B8rP/2oC<1cRKQ1cHs@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6ul]e8Rl=J@;]Ui@j#`2
DfBW9@;J"J7WiT_+DGm>@;[3+Ch+Y[@qBIbDIdHk+EqaEA0>`#@;]dsB-:f#Eb-A3EZeh-@<uK;
%15RIEcknD85^Qc1,q$?1GCO=1+^_Z+@Ak3/4!\q0K([?1G(C:0Jk=:/hf%33AiEC2`NTI0J"e3
0J5%;1G^pJ/1`?t[Oad?@4Vip7Wj!!ALpAM+>u,60J#1B1,^j</Kdu%D_*Ik0fLpL3A!$G0Jb79
/ho@;1,_'D1c@0J0Jb731H-p?1c$pA2(U:0/M'h1D_)>)7q#nJFa,H.;BReT2DZmB0ebRD/C(RE
6ZR<#/M&V31GLX:2)d3J/28b73@lmE2_I$L0f1mM/1i_</ho(:1,1R9/1f)Q/44H#/.DqV@;C.&
A1U8>+?))61GgX>1,LgG/70MeDIY5)/70qf/i#460etaA3&*9M1c?m>1+kRF0JbXF/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"Q^@k9r[F`_&0+E2@>E,Tf+Cc`b0@;C.&A0>`#@;^-/BOPk!Bl7L'F"SS*
Ec6#?+AQ?eBl@ltC`l8WE,]N/ATMo8BlbD=BOr;sAThX$DfBQ)DKI"?BPD:$F)Q#2Gp$U8DI[6l
G%G2,@;]TuAoDL%Dg,c'+DG^96>1L`@;[2rDIal(F!,C=AKYo'+@9aaFCB&7F!+t2DKKo5@Wcd,
Df0V=FDi:DBOr<1DfTZ)/e&.XASl.!B43>f;c4`)0K(^C.krt6:fC77681;R1Fk1=/70MiASitM
/1iD)/3,[B1cI9M1H6p?2_I$J0JYLA/1`>Z/4X8g/.DqVBjl.*@<*ni;BReQ1GgX?2DR!A/C(jM
6ul]e/M&J)1G1XB/29(=/iY^B3AN9>2E<BG1GLRB2(U:0cFYVqEa^L.$:efADII3085^Qe2E!<A
2*!WM1G$hX+@C0m/3tgA1,1XG/MT1?1Ft:62)m-A3&<0I2)-sF1Ft+42_HsE0f_!L/1`?tZReIa
Ft=(07qljLDCe=V+>c#20J#+91,^g;cF"c^Eciob/1iD//i>X?0fV$C1Ggd>1H@!<2D?a?0JP:=
2_6L2cF#2jEcioB$:eoN@<3u$5uUT30f(@3?Q`$fDCf-G?S!oc/i>@70f1R:0eb@C2`E9D1G1XH
1,L^E/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCctuEbTW0F(c\8Ec5o8F(&lH+A$Gn9jqpa+@fjO
Ch[B1+@g6d@<3Q.ARTIt+EVNEF(f9*AKWC;Bkq9&@3BW5@<*eL+q4lLDf''"F($Uj;BR_S1c6g?
2DI0N/C(OD6VV8G5qF]K1,gs=0K:dG/2Ah;3@lm>0ePCE2`<TO/3#7;3&rcL2CpC1cE\ug9kc-f
$:f,ZD/"-0/4`Y]2E!NS/3#RG3&N84^*#ga@4X\q0fLsG2(LOB2)6^=/iPR;1,_*E1H7-F0K1O?
2D-sJ1,^sI/1`?t^+;Zm@4Vip7s/?W@4XrI+>l,;3@m*J1c6s<cFP,sATB=R/1iD0/hf::1,CjA
0fV!M0Jb773%cpB0f:jG/1`?t\h$ckE\%Y,7s/ZWCgekc6m+3C3B8oV/3,OF1c6gb2)[<I+B)on
/70q_3AEBL/M].;0e>481,UU<3&iNM3&i`P3@la;1bLLA3AWNL/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
<])cm1+Z@:E\&D$Ecl82BcqA8DfBW9@;J"J7s/ZWCgeH#F!+m69jqjHGp%<LEb$^DGA(]#BHV/'
@;^-/@3BDqB5(iu@V'k(@<*K3FDl&.+D,P7DIal(DBO"<@;BFq/0JJD@:sLrF"AGFFCQpI%15UJ
DJ<foF`f6+;BRkS0JY1=1c-mD/2K1,:N0tu5qF`L0f:a=1,^pH/2]%62_6^A3%d0H2`N`R/1iV8
/i>XK3&r`F/1`S8/5L4u/.DqW@:Wee/4`Y]2)7'K/2fIH0JY3)Z62MGDCe(^/28t81H6sE0JYC7
0J57</2Aq6/ibdH3&NTF/N,:81H.*D1Gp^7/C(OP6Y1-d%15X7ARoq)/4`Y]0fCjC/2B"?2E*24
[idtZE\&dn/M&\10fU^C2D-mC3&`TJ/2T(61,CaD2`<3</C(^U6$73!%15X7D..6385^Qg0fLXD
3&i`GcESKXEbR'V/1iD./hf"21GLL@3AWHK2_6^?/i5IA1bgs@/1f)O/4";j/.DqW@<6KuCh792
85^Qb2)dHF1,CU=2([%`+@1-j/1iD)/2Ah93@m*G/i#7C1bpd:1G^X<2E!9D0J#M3CghB-6Z6OP
Be1g\\L^$hE\%Y,87?UcF($Uj;BR\R3B8WG2DR*D/C(dK:NC/#6");u2)@*H/MK%>2(UL83%umC
1G1XE3&3?N/1i_33A<HR0JP+EFDPB,+@C'YChYFOcFGK%EbR'6$:n`EG%Gc0Df[I#;BRqX1-$m?
0f(UC2_6g@+AcW^/1iD.1,V!J.l&e82Cp^<1c[*C1c-g@2E!EP1Ft:8/iP[J3&<9?1,(F?+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/2].5
:h=8j,"Q9]G%Gc0Df[%8F!,R<AKXZTFD5V8AoD]4+sM,BAKXNTCj'B3Bjkm'+s:<3A0>o(An?"(
+EVNEFD,5.6Y1(UBk&9-EbSuo+EV:*F<GC6G%G2,Bl5%lGA2/FATDTqDIal#F`M26B-;;0AKX]]
A7TLf+@0XOF"SXG$:n`SALpAM+>kl-2_6jF1,M!BcF+irBlYaj/28q:1cI!?0JbU<1G1IC/2An8
/iGXE1GCL6/MJe73AicO0J#M3CghB-6Z6OPBe1g\[ObHnE\%Y,88i-R@<*ni6m+6E2E*TH1,1L;
3@nM[<+0o#?S#P83%d!H/2fF>3&NTJ2*!3E/i>RF1-%3C1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$&#
/4")bATDKnDBNn=DfBW9@;J"J88i-R@<*K)F!,R<AKYl!D.Oi.Afu2/AKYhuBl5&1Dfor>@;0U%
Ea`iuAKY])+EV:.+B)]^@<,d!6tLFNEc`F<DBO"=F`_;.Ec*!cChI="BjiV'$:o)P@;RPd;BRqW
1GgX;0etF<3@rIa+AcW^/3tgB1,L^C.kr_80J#"41bgO;1b^O<2Dm?G1Ft77/iYXA1H%$?/1f)T
/5Tnj/.DqWDfT`(/4`'+/Pn#T3%RTd<%Uou1H6pm+B3Aq/70r8/28n42)?d>2(g[E1GUgB/2K%6
1,LmD1H$d>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<,u\(7VQaXBldr1E,ol9Df]?'4!7(4Ec,;.BlbD1
ASc0*DfQtBBOr</DId=!GAhM<A0>K)Df$UdBl7g&@j#W6FD,T/DeF>J%15XKDII3t_n%Bi6m+KL
1,1d?2)R*I1b;uV6ZR9"?S#P83%cmB/29%C/i5CE0f(d?/M]+73B&fP0f:L;0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL6ZR9"88iBVF`Lo.+E2@>E,Tf+Cc`b1F`(W$E5T70G@>P8Df0,/De:,6BOr<.GA1q;
B5_=%+EqL;+C\nl@;TQuFD,5.;fut#Bl5%d-Y[((ALATK;0?S_BZ$eu+AH9i@;[3)H$!_<Ci<s3
+CT=6Eb/a!F`);4A0>T(+EV:.+AcuqDepOsF_EB:$:o;WDfRC"5u]F4/M\k.?Q_mNE\(QK?S"/h
2_lp>1c6m?2)-pJ0e>.9/hf+A0K:sA1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4a>m/0[W-DJ*BuBjkm%
E,ol9Df]?'4!7(:DJsP<G@>P8@3BAtB4Ysk@<-W9@;]RdF*)>@+E(j7FD,5.89Jfk+CT.u+EV:.
+@pWmB45gp@;[3*@<?4%DCco=DIal!Ec6&5ATAo3AfsfVB5_fC+q4lNCM[^$/4`Y]2*!EO/2oOC
0Jk?,JKRm$D_+1_/29">2E<?E3AE<@1G1XG/2B"A/i#1:0f:[:/M]==1,1U>2`!!9/C/ku;e'_s
%15[CCjC&8@;[Ve6m+HE3&ifI1cI*J2_8;Y9MK4P?S#P82_I!D/28t;/ib^I1,_'B1Gg^C3&!9J
1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70r%9kc.&6#:"=DJ<Ns+E2@>E,Tf+Cc`b1BleB7EbSs"F!,:-
EbAs"Gp$R-Ch[I(AKZ).@<<W6BOr;PCgpgjBjkn#+CT;%+Co&)@qBOg@;^1.+E(j7FD,5.8Si3g
EbSs"F"AGB+EV18D'2,\@UX.g@;^-/E,ol>A8HN6@ps1i+EV:.D0'9)G%G_I+q4lND..-085^Qe
2DmBD2*!TP2_<7]+@C0l/1iD)/2Ah:2(UIA1G1UG2D[*B/1i_=/iPUH3ANNE/1f)R/44H#/.DqX
DK0f5ChtXn6m+3A2Dd-C/3#IF3&`Bq+@1$V/70r8/2f+=2_6^A3A*<M1bgmJ/1i\</i>IG1GUX8
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/4";b/5TnuF`qJ-DBNn=DfBW9@;J"J8T&NjBl%T.G@>P8Df0,/
BOP^h+E(j7FD,5.@rHL/Ch4`'DK]r7G%G2,Bl5&8BOr<.Ea`Tp@j#T+G%De;FDl2F+BMus+EVNE
FD,5.;fut#@X0).@;Tq*F!+:jEclP>@;[33EbTW,EZdYWEa`WiD'2kfCh.*nDf&p'/e&.ZDKK<)
/4`/O1,([G3%QdA2)dKG?Q_gVEZco?/70qg/ib[<2)$X;2`E]V0e=n41G1UB0JP7</2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"ZbE\&D/@;K@tF(o'#+E2@>E,Tf+Cc`b2DKK<)+Dk[uDK?q2BjkjsDIal(
DBO%7AKX]UCghT3Cgh3oF^\oo+=KQbBOPsj+AHE`@<luE/0JA;Cis9&DJ()6D]j.8AKZ&-Bl7X&
B-;,)+CQC6FCB2B+q4lNDKKH1@rc^5/4`Y]1H.-H/2T7A2_cjj+B;-E/1iD,3ANQQ.l9+>2Cp^<
1bgO91bp[<2E!HJ3%QmD/iGC<1cR6A1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/1iDQ9joRs8T&W]Eas-4F!,=2@;^-/+sLK-FE_;-
DBO%7AKYf#B6,7@+DG^99OW$WDBO"BH#.%C+ED%*ATDg*DJ()6D]j.8AKZ&9@<*`:+E27?Bln'-
DBNY2+EV:.+Cf>-F*(u0CghF"Df-[tEcYY39jqdTE\8OF$;#8LDIG(t5uUT31H6pe5uUT31H6pm
+@p'a/70r8/3,=>0e>(:1G1[F3B/lR/28h20JbIA2`WEE0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL87cfm
;f$AqASu3jDBNn=DfBW9@;J"J8TJB[@3B9*+CQC/ART+`DJ()%BOPpi@ru:&+DG^9FD,5.DJs]0
C`l_qA7]d(FD,5.7WN'O+B*E#3ZqiR;flquGp%$;+EV:.+@0mTBk;1(+@gH\DId?fFD,6+F!+q;
+B*)pG%GQ&+Eqj?FCfJ87WMpT+B)]bA]:?YBcolZDT0>&@<*tC8TJB[@3B9*+CQC:Df&p#+E(j7
FD,5.@rHL1F=n"08T\lgA77#[6m+6=3&ETR/28h<1H.0B?Q_jZFY$lN?S",g1cHsA1-$sC1GUjK
3%QX;2_I$I1H%!F/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"]fFY"_,@:F.mATME*E,ol9Df]?'4!7+:
Df0)o/0JYE+EV:.+AI,mDIjr4Df031ALns6DfTl0F)Z&8A9/l8D]iJ)C`mh5@<<W+F!+q'@<H[+
Ap%oB+q4lNH=:hF85^Qf2)$p>2_m*A2([%\+@:!b/3tgA1c.'D.l'%;1b:C71Gp^=1,1C:1c@9N
1Ft:?/hf4@1,(X</1f)S/4+8n/.DqY@:E\SBIl\P+>to/2_6mJ1H.-AcFk?!@rEna@4X,k0etF7
0f_!K/2St:0J"t91+kRI3&ioT/1iS:/i5I?2_[3B/1f)[/5p%s/.DqYBlds1Be2eQ+>Pr50J#"=
1,_!@cG(JlASitM/1iD0/iYjB0ekL;2`WTK3&`BE1bLXF1c$sH/1`?t^FVldD(H,'94;FE@;K[m
A8#gg/4`Y]3&!0?0et[A2D!.[+@B^^/3tg@1,LdC.kib61b:F82)[!B0J5=?2).!F/2Jn61Gq-H
2CpC1cEf&hATTI4$;4fD@<HX*/4`/O3&<BJ1Ft@A1,(I7?Q`B\Cb/pE0KCpJ1+b==0fCRB/i#46
0f1^>1-%?M3&3$:1c$a>2_m-B1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/AS`njASud%DBNn=DfBW9
@;J"J<+ohcGAhM4+A6-Z@<HX*+Dk[uDK?q/+Eh=:Gp%0MEc5i.+EqL5EboH-B-:]&CisT4+E(j7
GA1r*+DG^9FD,5.6tgLTF`/C=@;]_#@:s-oDe:+bASud%/e&.\@;U.4/4`/O0f1aE2)d'F3AN<L
/70MeE^D<a/70qd/i>R=1,La=2).!F0eb.62D-pF1,h$L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Qb
67b`;E+*WqF(HJ5Ec5o8F(&lH+A6-[Fa5*DF!+m6GAhM4+DG^9FD,5.6"t4Z+DbJ(B6@WqAKYMp
DJsW2DJ()#+EM[EATDZsFEMV4C`m;,FD5iB+E27?F(KE6Bl7Q+F)Yi6BlnK+C`m;,ATDF//e&.\
@;]^/85^Qf1GLa<2E<TL2_<7c+BE2s+=o)q/M&_20fU^>0f(F;1,CpH3@la:0J5+>1H.!E/1`?t
\h$lrE\%Y,94;jLCLJbb6m+3?2`!EQ/2oIC2)-Xh+@0sf/70q_2)@*K/N>F=1+YC;2_cj=1G^XD
0fCgD2_6O?0J5+71c79M/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K^F"AM1ATo8#ARTC`DIal/Ec5o8
F(&lH+A6-`@;B9oBlbD=BOr<1DfTA2Bl5&8BOr;\`.;iIBcq5#DJ+*#B4W2tDfQt/+E2.*DKI"4
DId<qBk&9-D]hedG9C(#@;K@iA0>u-@<<W2Ec5K2@qB^(@3B$"BkM+$+E):/DJ*N3+D,G$F(fhA
Ao`$.F=naH$;4fMF!*bkF*)G2Ch[rA85^Qg3&`iK3A<0I2([%\+B)on/3tgA3&3<G/Mf4=1Ft75
2`WEE2`<9B1bq'O1Ft+61bLRD1c@'H/1`?t[4G6hE\%Y,94;sa+@:!eARTChF"Bj[+>u571FtO?
1c[HFcFY2tB6#OT/29+>3%up>2)7$?1+kOA/2B.B/ibpI2E!NG/M]191bpdE0JP+0/C(jY;eL,%
%15a:F`S["ARoL`/4`Y]2E3QS/3#XM1GLH+Zli:[E\&dn0fUpC0J,%?2)$R:/iPO:1,h'C1,LsJ
0K:U81-$sH1,q!B1b:1/cEo-$B6#O4$;4fNAS<Vc6m+3C2)R3F/3,IF3Ai?p+B)il/70r8/3#79
1+Y1?1G1[C0JbR?/2St72Dm9G1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,ATB=G8TJ6WBjkm%E,ol9
Df]?'4!71)G%G>0BlbD8DIjr/Afu2/AKYYtEc5N1+E(j7;eTTQDIIBnBIk9JBOr;tE+rf)E,T<)
+Cf>,E,Tf/A0>?,+AcWiF(o'#+E271F<F%aEb'*4F(lb+ATW--ASrVN2`DjfDIakE0JP7(6U`UM
94<!TBHV#1+CQC%CggghF)>W5BHVM4D]j+HD.7F"Bldj,+DQ%?FD55r/g:`394_gJ/4`Y]0f(RB
/29.E1c[,4^G6p#EbR'j/2/n82)?g<2`!HF1bLU@/2f::3&*?P3B8WB2_I!G1,q3J/1`?t^G7?/
EbR'6$;5&@D.6piBjiP`;BRhQ2*!3G3B9#T/C(jM7<3)n5qF`I0f^s?0f(R?/2St:1+Y181bL^G
2`*EP/1iS4/i,F@0KD$B/1f)Y/66J*/.DqZBlmd"E+iZ285^Qi0f(O80ebFE3&`D6YolJTFY#g0
1,1L@3%H[?0f:L</ib[<1GLjA3AiZS1c[*E/i#7B3&WWF/1f)O/4FQ$/.DqZDe!Hh@Ot&J+>l#7
1FtI?2D@'@cE\Qm9kc.1/28t=0K1L@1b^p@1+k7>/2At9/iGXH1Gq*B2`*-A2)R6F1b:1/cE]!$
9kc-f$;5;KBjiP`8PgNa1-%6I/28n?2DHai+@U<b/70r8/28h21,UU>0eP@C3&WcS/1iV5/hf7C
2DHs<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn/5UJ#Ecc4B;JBWLDBNn=DfBW9@;J"J95eBU@3Bc&
F!,R<AKZ28Eb$;)DfQtAFCB24Bl5&8BOr<&@;]_#@:s-oDe:,6BOr;c@Df3bD]hVhA8,[fDJsZ=
+AcWfE,9).De:,6BOr;R@<-'k@V&tc/e&.\DeX;E=ALM*/6G\"1b;uV9R1M,?S#P80eb4<1+Y.7
0J5.@3&*<N/2]C>1,_*G3&`BD0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,7<<QhDJ<Ns+E2@>E,Tf+
Cc`b4DeX;9BlbCcF*)><Bjkm%AoD]4FD,5.FD5T'+EqL1DBO%7AKXooDBNt6F(KD8Bl5&8BOr<'
DfT`0DJ((?A79\".4u&:95eigAT2=$Ec6"M85^Qg0f1j@3&!<H2D!.Z+@p'a/4!\q0fCgA1+P+7
1-$m@/iPa@1,LpB2)R3N3B/QF0eP:B3ArTH/1`?tZ7JOXE\%Y,96+He/4`Y]1cIBP/2f4=2*!55
Z62MTFt>3r/M&Y02Dm$?3&iNJ3AriO0J"e21G1ID2E*KR/4"Ao@<3PYDe3a!/1f)P/44H$/.DqZ
F`M/(BIl\P+?2242_6[;3&r]P/C(sP6Y13Z/4!\q1,:O>3%HmD1H6pB/i#=91G^^;3A`ZR1,LO?
1bL[A2`WfO/1`?t^+;W_E%DG*9OT&BF`:o4@UUfY;BReU1c?mC1,:U@/6O)_<c0H?/1iD1/i5=7
0f^s@1,q$I0f:L=2(g^B0JYLE/1`>T/43HU/.Dq[@<,e#@:q,^;BRkQ1bgO@1,CpK/C(XG;e'_s
/M&J)1+k=B/2B(</i>I>3&`fJ/Mf491-%-G1GUL4/C(XS;e'_s%15d?Ec,;:83p3,:b=LZ/4`'+
/Pn#U1+ZcT89nVp?S#P80et@92(UI<2(g[A1c%'F/2f+73B&]K2_6^<0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r!H!r6J7ri0PCERS:DfBW9@;J"J9P&6^@3Bc&F!,R<AKYl!D.Oi.AftM)Cgh*j+DG^9FD,5.
ARTY%ATDZ2:h=H]E,TW3ATME6+EqL1Eb-A8BOr;[ATDZsARTI!89n`d@4WO0DBNY1D/XH:@;I''
H$!_6@ps0rDJ=!"/SJ^(A7]9o@V&thF<GC6G%G2:+B3#c+EMX5EZf14ATJu.DBO%7AKYK$DKBo2
Ci!O%Bl@l3De:+_H":r(/g:`39P&9RFD*3r;BRkT0K:UC2)[HQ/C0"m;e'_s/M&J)1+kL>/2B+=
/iG^D3B&rL/Mf=<1-%3O0f(@3/C0#$;e'_s%15dC@V'S%@<3tj;BRnU3Ai?J2`WZR/C(sP6#g]l
5qF`N2)I'=0K:gI/2St<0e>(?3%d'H1,(CA/3#7=2DI$G1Ft:80f:(K@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O^+;QiCb-c(BjtXoFCB55
BlbCj@<?4$+D,P4+<i"GBjtXoFEo&S/g*i%@V'S%Gp%-=An?"(+EVNEF)PQ&@;I&pDIal/Des-0
Bk(Rf+D,Y*ARo^rF"AGBDIaku+ED%1Bl7HmEZfI;@<<W6BOu3q+CT;%+E1n1E,9).A7]dqG%G2,
De:,.BjtXoFEo!CDBO%7AKZ28Ebo8/AThX&+EVO4@<jIJ<+ohc@rH7+FCf9)@<?4%DBM5bF_PZ#
+ED%4Eb0<'DKKqB@;[3!@:sCf+>"^E+E27<F_kK,+EMgF@W-'*De:,.BjtXoFEoJ_%15dC@q[Di
;c4`)0etUF.kre1:fC7768:5Q2_-U</1huFBlYaV/1iD)/29.B/hf"82_Zs;0et@>3&3<F2_6^<
0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."
Df.*X/66J*/50bfBHV#1+CQC)Bk)7!Df0!"+E_R4ART*l@rc-hFEMV8+DYk5GA\O8DfQt1Df0Z;
Des6(DJ()1FD,6++E_R4ART*l@rc-hFEMV8F!,[@FD)e6@:s:a/e&.]Bk;@&@4Xr;+>GT11,(L8
2E!9M1+ZcT<D?mQ?S#P83%cmB/2An8/i>@;2)m<A2)?jD1,q-H2_6^<0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r.9joRs9OW$dBjkm%E,ol9Df]?'4!742ATM]s+Dk[uDK?q4Cgh0l/0JA=A0>T.+DGm>FD,5.
DIIBn+E(j7@3B&n@<,ddFCfJ8Ao_g,+EV:.+A?3cG%kB&+E271D'2c!@:FA"@:sX(F`&<qBk;@&
@4i`5$;>/MBk\\VDfTDt/4`Y]3&3<A0f(LA0e>+@+@1$^/1iD)/2St:1+Y7:/ibjL1,Us@1-$sB
1cI-D2(VF0FD5VD/2K:;6#pZj:2+3VCghB:9Q,&fF!,")+A?3R@;0OoAKY])+>Gf42[p*fBl@m0
De!Q6844RU0et[H0e>%60K:dC/70McEH3U;/70qe/iGC71G^pA2`<EN0JP+10fL^?2D[6K2CpU;
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qoEH3U$Df02195e]\+E2@>E,Tf+Cc`b5Bl@l3;K$&\+DGm>@3BB#
Df..JBOPjkA0>i&@;@!(G%G]1Df9E*DJ((_Df02195e]\+CT.u+DGm>@3B'&Cijf?@;I'-H#7#/
C`mq9FD)e-AS#g'Eb0<2ARfg)Ao_g,+EV:.+Dbt+@;I&rDf'?6DJ=3</e&.]F^o-%Bl7C&EbKT*
/4`/O1c7'H0J#"63&WHA?Q_XWE\(QK?S",g3&rNM2_HgF0Jk[D/2K7<3ArWQ2DQg=0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL6$73!,#!-(ASkmpF`M,+EZf=ADfBW9@;J"J<+ohc9QaiZCh[crF`M/<@j#B%
Ecc>5F)rIJ@<3Q#F_PZ6+DG^93ArZ9@X0)<BOr;uDfor.ATAo3AfsciG\(`$Dfp)5/0I;uF`):D
;e]fUAo_TsA1f&8$;>S`Blq7eDJ<N1844RW2)[<I/2Jt?0JtCg+AHcl/70r8/3#7:0J#4C/i,1<
3ArcH0eb4?1G_!N0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r&Df.+&DfTrBB6@d,AKYr4DfBW9@;J"J
9QbDjFMjhjBji,uF!,R<AKYE!@qfLlF<GI0D.Oi.Afu2/AKZ2.F*(u6DBNt2B5):%+E(j7FD,5.
8Rc7OBk&8^ASu4"F*2;-+EqL1Eb-A8BOr;[F`V8=@;]dfDBNn0DfBN(+Dbb8ARlolDIal6BOu3q
+Dl%<F<GL6+Dl%-ATDZ?A79a+:iCArF_>-!+DGm>F(o`=@<?'k/e&.^@:=5&D(J4U+>u)42CpgF
2E<QEcFY2iATB=R/1iD0/i5:61,^m?2E3NO1,^[=2D-^=0K(aF/1`?t].?KaE\%Y,9jqOMDIdZ:
844R\1GCdE/2]1?1,1=e+@0me/70r8/3#7<0J"q:0eP.>2_d-I/1iY6/i>RH0JYI91,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/4"/q/44>lDf&rt@;[3,Ec5o8F(&lH+AH9SDf0*(+DGm>FD,5.D0^5:Bk(Rf
+EhI8Cggsf+E(j7FD,5.DJs]0C`lMkAKXNdDIdd!A0>#d@<-E3De:+jDes-0F_#&+-pq][DBNB*
Z#=\+A7Zm)Deruq@:Uf0FD,5.@r,RpF(o,,DJs]0C`m24+@fjLEbT*$+@fj\A&GEW+AH9bEHPi=
/g*ks@rH6qD]ib8+CQC)Bk)7!Df0!"+E2.*@q?d,BOu3q+DkP"Bk&8oDIal1ARTChFEo!;Eb-A1
Bm=3"/e&.^@:sL0844RV1,UdG/2B%90Jb7e+@BRS/70r8/2f+;1FtID/i57<0JG132E<BJ1H@9G
1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70qq@;RPcATDWrDBNn=DfBW9@;J"J9jq[Q+DGm>@3A<RFD5Z2
@;I&_@<--+Bl5%^FD,B,E+r`'DJsW.A0>K&EZf(<F!,+0Ea`QlATKIH<+ohcF*(i2+CT)-D]i_%
E,]B+F!,RC+C\n)Bl5&8BOr;rDf0W<ASc0kFD5Z2+E(j76XahCCi=9$Eb&m*+=M>FAKYW"Ea`Ql
ALT5@$;FrB@<6."/4`Y]1,(^G/2B1@3%uo/\0+([E\'L-0Jt^J2_-[C0f(@9/iGR<3&rTO1GCRE
1+Y4?/i#.:2)mHE/1f)V/4"E!/.Dq\@;'^jFD39s6m+3A1,V$G/3#CC2)-Xh+AZri/70r8/3#7<
3%QgB1G1L?0f:sJ/28k33B&`Q1cR$A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:N0tu6$d*_@UWtc@;]d%
E,ol9Df]?'4!77+BQIU(BcooSDJEU'BcnfY0K;)PJ<M]B2*!*.BlbD8DIjr/Afu2/AKYH&BkM+$
ATMr9F(f9*Bl7Q+F*(i2F!,C5+@1<bEaiHkC12!o+E271FE2XZ+B)rb+Eq78+ELt*A0>u4+D>2,
AKYE&F)PQ&@<?'k+EqOABHUc&FD)dmD..H-95%aZH!tP4@;]Tu:2,#_D.t,$DIal6@<3Q8ASc0*
ARopn@<?'k+CT.u+EV%.ASuU$A0>;uA0>i-@<lEp+Du==ATD^3F!,=BF(o,mC`mG0F*)GFD.RU,
F"Rn/9jqaE/4`Y]0ekLF/29(@2`!!?0Ha>'FY#*q0JbOC3%Ha@1,:C:/iYd@2)['D2)[?Q2(UL>
/i,CE2`3<@/1`P1/6$&#/.Dq\@;Ke!CFiOQ;c#&%3@n5t;c#&%3@n2i1GU(RBlYb3/28t:3AW6@
1GUm?0ek:?3@lp?2_HmA2E*EG/1iY11c.$H0JP+60JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?N1GUL^BlYaj
Ecki"DBNn=DfBW9@;J"J9jqjTDegJ0F!+n/+DG_(BkM!pDfp+DDIIBn+D5D3ASrW4D]iI2@V&tX
BHV#,+@1$j@UUC'Bln#2@3BGrEcQ)B+ELt/A9f;=FE1r7@q[!,BOQ!*Bl8$(EcQ;AFE8RHBOr<&
Bl.F&FDl&.+CT.u+EDC1CO%%EATDg"@q?ckCi=3(+EV:.+Cf=uF*'#W8T]"rF(euuCi=M?@r,^b
EZd_XEbSulARTI!G@>T)EcW@?@;BEsBlkJ++E27<F_kK,+EMF=Ebf6&Ch[d"+EML?F=n"09jr'S
Bko7j;BRkP1c[*H0K;$J/C(jM:N0tu5qF`K1GCg>0JPFF/2Jn<1+Y1;2_I$E3&EKK/28b;3&<NR
3%QU3cFYW'E+gd3$;FrLCLL['85^Qi2`NNC0ekIE2DZo0YolkSB.PVc/M&Y01c[*C1c?s@3A<3D
1Ft7</i#+<1,_'B/1f)O/5Tnj/.Dq\@<--p@Ot&J+>Yr41b:I@3A`HAcFP-!AS`nL/1iD./i5L<
0f1R:2)7-J0K1O72)R!?0ebLD2_6L2cFPQ-AS`n,$;FrLF(o,885^Qg0JGI;2`WQK1G$h_+@p'a
/3tgA2D@*F.krt:1FtC90JG%51bp[;0fV-M2_6[B/hf+?3B/]D/1f)X/4a>m/.Dq\@<>pu/4`Y]
3&WWJ/28k70f:pAcF4omAS3P[@4X/h1c$g91GCO>/2Ah<1Ft==0J5:A0JtdL/2Jt41,:R>1c-a7
/C(^U:h=8j%15g<H=:5u@;.8`5u]F4/M]%383p3,:b=FW/70N"9joS[/70q_0ePC?/29(</i#@B
3A`HA1bgU:1,h3O1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r.9joRs9lFo^Des,rDBNn=DfBW9@;J"J
9jr?V@;K@d+DGm>FD,5.9lFo^Des,rDBNh*D.Oi%DfQtBBOr;tDId0nB4Z*pA0=B\@VHroARTU%
F*1r5E+NNnATJtB<H</'F!+n3@ruX1+D5V%Bk;1'Blb^GDe:,6BOr;VDdmE'6tLFNEc`FEAS5^q
DBNk0+AHclB5_U#@4WO0DIal3BOr<(@;TQuDe:,6BOr;uBl\9:+AHclB5_U#@;[3/@<?'sCh\!&
/g:`39k@dTF`_%C85^Qc1cI3A1GU^B2D!.]+@g![/1iD,2Dd3M.l&t93%Qj<0K(I:0JG+>3&<6D
2CpU@/ho.:0et[=/1f)S/4X8g/.Dq\AS6$pH7VTb+>bu70J#(A2`EQEcEn]o9joS)/28n72)Hg@
2_[!<1G1I=/29+?/iY^H2)$g;2)d-A1GUjC2(U:0cEo-&9joR^$;G)GF)tb@85^Qb3&`iK1,^mA
2_<7d+A[#l+=of00JtXD0e4q<2)[!A/i,L=3&<0G3&EHO2Cpj@3AWKH2)[!:/C(jY:NC/#%15g@
CLVEs@4XrI+>Pi40J#":0K;$CcF+icASita@4X)k0JkL71,(L@/2St50e>%52D-[=2_m*F/2An3
2)d3E3Ai?=/C([T7qHNg%15g@Ch7R!/4`Y]1GgjI/2T+>2)[#2[3.hS@k9oS/20%?0Jt@83AWHB
2D-aF/28q7/ho(92)I-@0f^jD1c.0G3@l^4cF#2jDIY4,$;G)LCLM$nDIIE685^Qc0K;$C1,q'J
0J(MT+@1-j/4!\q0Jt^J2(LL?2)d'@/ibU:3&rTN3&33I3@m!D/ibaI1c$p=/1f)P/4"E!/.Dq\
ASu9lE\'aZ+?;/2/28t91Gp`/YolDFF=]!p/M&Y02)Hj@2(gaE3B/uU/2St53&roR2_6L2cESof
ATTI4$;G)LCLqC*/4`Y]2)7-N/2fIJ1G^T-\0+.MDCd@j0f1RB2_?gD1,:C9/hf171,1L92E*<J
0fLX81H$jA2E<cT3%QU3cF>DmASs%.$;G)LCM@6/85^Qb1,:g?0fV'G1b?qd+AcWi/1iD,1Gq0H
.l0%>2_6a;3B/QI3A*6I0etUB/2K.92`WTH1GUL4/C(s\:h=Yu%15g@Ea``785^Qe1-%3C2)@6I
0J(MT+B<8e/1iD)/2Ah61b:@>2(g^D0JbFD/2]=<1H7-H1,^[7/C(OP<D?mQ%15g@EbAf385^Qf
2)@$>2_m3L2_6aE+@:!b+=o)q/M&b32`<3B1,:I<1,h-P0e>.>/ho(=1,(U;/1`S:/4+8n/.Dq\
ATDKqBjkmf/4`Y]2_m6I/3,OA0f1H,YolDS5qFT=/M&_20ek473&`HG2E3BM2_6O:2_I*E1c.-I
/1`?tYq/7_5qEHP9kA?`E+LRk;BR\K2)[!?2`<?L/2B"(<+0o#6");u1Gh!G.l&n<2_6d<0f1F=
2D-jH0f:gD/2B"63A`]O1cR$;/2B"4<+0o#%15g@F('*2BPD<785^Qf1c?mE3&<<@cEf5J6#pZj
5qF]E2)@*?0f^sJ/2St<2(ULB/i,IB2)[->0f^jA3AWWP1+Xt-cEf5V6#pZj%15gD@;p$k@qfIr
F"Bj[+>Yo82(URA1,Cm@cE\Q[@<*nN/1iD-/iGX>0f(dA1-%?T0K(I62E<BK0fLjA3%QU3cE\ug
@<*n.$;G5ODf]><85^Qe3&NKC2DR*F1b?qX+@C0l/1iD-1,LpK/N#OF0e>%31,UU;3AE-H1GCRB
1Ft+83A*3L3&``P/1`?tZ7J@`FY!t/9keKTBPDK<85^Qd1bgs@1bpmA1+^b(+@pcd/1iD)/2St9
2(UI;3A*3L3AWEH/2Jn71bggC2CpC1c\!c>H!r65$;G5PASbdtG$upm;BReV0eb.:1GCgC/C(UF
<bZS*/M&V32)R9B0JbI@/2Jn73@lmF1G1[A0K:sN/2Jn73B&cR0J"b+cEo-'BlYa6$;G5PFCArn
/4`Y]0fV$G/2B(C1GCB*Zli.bBe2PY/2/q;1,(:60JPO<1+k=>/3#F<0JG4>2E*0=0J5+@3A<HN
/1`?tZn,!nBe0]#9keWV/4`Y]2E3EB0ebRB2D!.g+@B^^/4!\q0JY@C1G(:92*!3G/i5L<1Gg^D
1H%-G2_6O9/ibjL2Dd*=/1f)]/43uj/.Dq\Bl[WlBIl\P+>Yf4/2]7@2_<7[+@0mU/1iD,0ebUH
.l0%=2_6^:0K1O;2_HpC1GCO>/2K.92DQsD2)d';/C(OP6#L3a%15gDEa`f985^Qi1GgX;1GUjJ
/C(^I:h=Yu5qF]F2)$s>2)R6J/2Jn;2_6d@/iGXF1,(X<2)R!G3AiWR2_6L2cF5?$ATB=2$;G5T
AmoI+85^Qb0JPL;0f:pK1G$hV+AcWi/1iD,1GUdC.l97D1+Y.42`WEH0eP.>0K1[G/2T@>3&WKG
2`WE?/C(LO:h=Yu%15gDEdD/2/4`Y]1,:jH/2Jt91,LQ-Z62MO@4Wu]0K([A2_?aC2)d'@/ibmB
3AiEI2`*NN3@la:2_I*J2*!BO/1`?tZ7J@;@4Vip9keZWD(J4U+?;85/28t>2E385\fag\E\'Lb
/2/k63Ai<D1c7!=1G1UH/2T:<1H.-E1cR$C1bLaF2`3EH/1`?t\h$ZhE\%Y,9keo^E\'aZ+>ki1
1b:OB1H.9EcF+iq9joS=@4X,h1,Cp@2)I0K/2Ah51Ft:80J5@F0f1XG/2]7:3ANHJ2DQg7/C([T
<D?mQ%15gJCh.I-ARTJ!/6G\"0e?F&/MSe`+@C09/70r8/28k31,pg?1b^O>1c[?M0J"t=/ho7E
2)[0?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/44GE/5gD'@;]dfDBNn=DfBW9@;J"J9lFiYDg#]#DKR(9
F!,R<AKYZ#B4tjtF<GO6@;@!"DBMhqD..<r@3BK#+EV:.+@a;%B>fFC@E=iZD/XQ7FCAm$+ECn.
B4W30Bln#2@;[2rCijB5F_#&+De:+I2)I-4D.Rg0ATKI5$;GGVFEMJ>/6>,9:b=Ud/6>,9:b=Ud
/70MgEbR(3/70q_0J5%;/2fC=1H.!J0Jb731GCF>0JG=?2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qs
EbR'K:gn6MD..<r@;[3,Ec5o8F(&lH+AHclFEMJ>+DGm>FD,5.FE1f#Bln'-DII?(@rHF1F_t\4
FD,5.D..<)G@b3'F!,17+EV:.+Q@pA7;O)CF`);>iddRN+CQBh@;]Lj@;]dfDBNIuDI[6#Bl5&;
BPCsi+CQC0@;[2rDIal6Df&p#+Cnnu@q?d)D]j.8AKZ&4F`(_4De:,&Ecl5?/g:`39lG&\G$uq'
5uUT32D?[`5uUT32D?[h+AcW^/70r8/28n40fU^?2)['F2E!EN0e>+8/ho4@3AWTF1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/5Tnj/5p,#@VK7g+E2@>E,Tf+Cc`b6DfT90@3B9*+EV:.+Dbt6B4Z.++ED1>
ATAo7H#n(=D'3P1+B)il@VK7'%15gJEbSrq/4`'+/Pn#S1Fu'_<%Uou1,CIg+@KdW/70r8/28n4
1GUL;0K(O<1,CmH3%QdB/iP[D0fLd;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4=&c/5TbkATMs-DJ<Ns
+E2@>E,Tf+Cc`b6DfTQ#BHV#1+CT.1@;]RhASuT4DIIBn+D,P4+EV:.+Dl%>DKK<$DBO.;FD,B+
+EV:.+AZfa+@BjbGp%$;+A-3cF`Uu-ASj%/$;GG\BOP^n@;%2_;BRhR1b:UF3ArG6Yom"dBe1he
0JPF@0e5">1Gp^>/i5=71,pmA2_['G0J"t>/i>RI3&3BC/1f)O/6$Y(/.Dq\Dfo`3F`&a$6m+9>
3&NTF1,:[H0e?ZS7<3)n?S#P82_I*F/2o=:2)d?K1,CI51,LU>2E3ZQ1Ft:80f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70qsEbR'K6?R<aBl7?%7U^@V+E2@>E,Tf+Cc`b6Dfo`3F`&`Q@;L"'+CehrCh7-"<c;er
@3A<`Bl[c9+DGm>FD,5.Cgh?sATMr9EbT].EZf(6+@:3kCM@Zp+@]d\D]iJ+A0>i-@<lo:@;[3%
D/aE6FCB'/+EDC:AKY])+EV:.+Dbb8ATJu4Afu2/AKYr'DfBN(+DG^9FD,5.@<,pfF!,1=+E1b1
F(KD8FD,]5F_>A?+q4lRE+s3&D_+sU;c#&)0e?Bl;c#&)0e?ZS6Y1?j?S#P80eb4=0J"t>/i#=@
1Gpj;0J5:A3&icQ/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QUF=^C"DL,`/Bjkm%E,ol9Df]?'4!77:
Bl7R%+DGm>@3B/jD/XQ<+EVX8AKZ).@<<W)Ec6/C+DG^9F)Q2CBOu4%+B2ceH=:]*@3AurA0>i3
De+!#ATJu*@W-.0+EqaBA0?#9ARloqDfQt;F`V8,@;I'#DKBo?F_t]-FE8R5DIal"F`M27F"Rn/
9m(8dE+ifsDCe=V+>Pi42_6aA0JkX<cEeW\9joS)/1iD0/ho(30ebI;3AWZQ2)Hj90f:RA1G^dG
2CpC1cEf&h9joR^$;GY^BQ@ft/4`Y]2)6sF/2fFI1,gc0[ie"UD_+1_/28q<1cHp>3&3<A1+kIE
/2An=/iGXC0fCa;0fUdA3B&lO2_6L2cF5>kDf709$;GYa@qfI^/4`Y]1G^dB/2T(?0Jk?+^E?NN
@4X\q0K:jB1Fk@;1c$[=/i,@90et[?2)[?I1,pgC0J5:=3&*?G/4")h@:s.mF<E:q0f:L5cG(o1
9joRs6=G.NEZcbb2D?p9+<i"DDBNh*F)NTP@UX:d@<-('+Dl7B@qfI^/g;J^/KeJDFE2))F`_2*
+EVNE+sK?^EaiHtBjkn#+sJ3?$;GYaBk(R&85^Qi0JbC60ebC@1,ga=3$:V#Cb..h1,(RF1b1:7
2)$R=/i5O=1GL^=2D@*E2)m-A0J5=@3ANQP/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdM%/4=&c/50JoBl5&*DfQsJD09o6@j`BI
FD,5.@;]RhASuT47ri0PCERJ:F(o,u@;[2REbTH0-Z^DHBkCp!G@>P8F('6'A0><&+EM+&+C]U=
A8c:'BPD@*+=Lc3CiF'%DKU"L+CSl(ATAo%FEDP3@ruF&B-;;0ASH0-@<?U&DKKT2DBND6+E2.*
H"h//+D>J1+DY\5BOPpi.1HVYF`VM5ChRBoD(J4D<%Uou1-$mV5u]F4/M]=;?Q`0VE\(QK0JY@<
2(LO=1cHs?0ePFG/2K(70f(O=2D?[>0ePCD3&``S/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##bE\&D&
@;]e#BHV87DfBW9@;J"J9m(MrASc$kBl+u,F!,R<AKX`dEcYe7D0^5:Des?)Bk(Rf+ED%%Ci(;5
Aft]"Eb-jG<+ohcAnc:,F<G47A9/l9F(Jl)FD,5.F)YQ.CNCV:AfsfjF)Y],BOtmp+EVNEAoD^,
+EV:.+EM[C/0JeJDf.*KE,8s#ATVuE+CT.u+EMX5EcWiW%15hITlP'bFY$T[;c#&(/6>,9:b=RV
?Q_XSEZco?/70q_1+k:>/2K+B/ho4B1,Cj?/M](62E*EP2E!*A0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
6#gor,"-?dBl7Wp@;[2cAT2d$Ch[B%E,ol9Df]?'4!788TlP'bFWbd>AKYW(A0>f&+CoM2F_>B0
+DGm>FD,5.E,ol=ARfh#EZf:4+EV:.+B*E#+CT.u+DGm>ASu.$@<Q3m+CT@7@3B5tB4tjs+E27?
Bln'-DBNk8+EV:.+EMX5CggsnBlmo/FD,*#+@:!\DIIg%C`mG0+EV:.+@U)h:j$>eFCcS)@<Q35
+EqL1Eb-A8BOr;bF`&==@;BFq+DGq=+Eq7>+CoD7DBNM6ATE&=1,0n>ARf:g@V'R4+q4lR_mXGm
BIl\B+>GZ+1GU^:2_m0F3@nM[<bZS*?S!og1cI9D0JG4?/3#791b:C;0ePFF2D[6G/1iP.1,q!F
2`*'@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<bZS*;g2qsF!,FBDfBW9@;J"J9uFDW@q[!!F!,C=AKYo'
+EV:.+E2@>D/!m!DKI"?ART@q+E(j7FD,5.6=k1TATME*6#:L]+DG^9;g2qtH=_,5@;]U.%15j=
BPo@l;BRbR1,ga@1c[BN/C(sP6Z-Bb5qF]M0KCs?1,:O>/2]%=0J"q72_HmB3B&]K/2At50JkXD
1c?m9/C(s\6Z-Bb%15j=Ch7-k/6>,9:b=R\/6>,9:b=R\/70MfDfRC9/70q_0J5(8/3#R@0f(gM
2`*';2DZsG3&i`O0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qrDfRBQ;f?f#BHTTQEbT#lDBNn=DfBW9
@;J"J:17sMA8*0'ARTIt+EMX5EZf(6+EV:.+B)imDffZ2/0Il&<-*7lDIFYrDIakgAPcrKBcq5#
DJ+*#B4Z-,@;]TuBlbD=H#RJ-@;Kb*+D5D3ASrW!F!+m6DIIBn+EVNEB5)C&F!,17+EV:.+D>\4
AKZ).@<<W6BOuH3GA1l0+C]A*DJ().BkM+$/0J\GGp$O5A0>i&@:NjkFDi:DBOtmu+Cf>,D09`1
FD5<-/g:`3:18'^/4`Y]1GLdF/2K:C1-$o2[NJChE%ERl/M&Y01,1=71,(=?3ArQI0e=n50J5%5
1GL^G/1`?t[Ob6tE%DG*:183WBl[W585^Qi1,h0D0ebLG3&N84ZQMVDE%F:+/M&\12E<<E1,U[<
1,:dE2(U=62D-mG1,CUD/1`?tZReIPE%DG*:186QF(eu5844R[2)@6H/2T=A1Gp^j+BE&i+=pkN
0KD!E0J,+A1cHsF/i>I:0f1gA2)-dA0Jk=41c[0I3A<3H2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r/
AS`o$@;TIf@;[3,Ec5o8F(&lH+AQ?e@<6*j+Dk[uDK?qBBOPdo+F.mJ+DG^9D..=-+DbJ(B6@Wq
ATJu4Aft8cD.73f/e&._ASZ'iE\'aZ+>l&21+Y@?2)R6BcE\QZDf70Y/1iD//i5R>1,:^>1cRBN
0eb.80J5.A0JtaI/1`?tZ7J=\D_)>):1\9OF`T*);BReS1b:RD0K1O?0d&c"A1T;`/M&\12*!3C
1bLUF3&*9I/2T==2DR6I0f1G(DJO-.GA\r_2)-XJDIb:bDe*E%-o!\80e!P=:1\<_F_**p6m+BE
1GgX?0Jt[<?Q`0YALq1>?S",g2_lp=2D-^B2_mBL/1iY</i5OI1,1a>1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/5U"k/4F&k@:X:sBjkm%E,ol9Df]?'4!7:0DK0f1+Dk[uDK?qBBOr;bF`&=9DBO%7AKYet
DJ+*#B4W3,E,TN'DBND6+EV:.+A$H]BkM!pDfp+D=(-#f@;]d%FE2))ATJu4Afu2/AKX9U@<uj0
+ED%+Bl@m1+E(j77:UIKA8cJt$;P/QG%kA9844RW3ArfQ/2K%A0fCRi+@1-j/3tg@2Dm3H.l8q;
1+YC;0eb.50JY7?2`EHK0e>.8/iYaJ2`3NF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"E!/0[DlChIHj
DBNn=DfBW9@;J"J:1\HhBjiP8@:WecFCeu*Ao_g,+AQKgG%kYA+Eq78+CQC3Ec5f/DIm^-+@9XU
B5(dl+@B^VFD55-FE2))AM,/9$;P;K@;IJc;BR\R1-$m@2)[-H/C(OD9P&/o5qF]I1,q$@1,(OC
/2Ah;0e>:>/hf1<1Gh!@/M]"42`3TP1bgO4/C(OP9P&/o%15jECLMF$Gq;KS+>GZ11bgs@2`*NQ
0e?ZS6>pcn?S#P82_I'L/2At@/iP^H2`<?@1bgUA1G^d?2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qp
Df70o@;]LaBjkm%E,ol9Df]?'4!7:4CLMF$Gp$gB+EV:.+EqaEA0>K&EZf4;FD,6++DG^9FD,5.
8T&'QB4Yt!F`SZmEb/f)Cgh3oF^\oo+E(j76Xak@A77)"$;PM\@<c33844RW3&3BL/2K"?3Ai?p
+Ad3"/70r8/3#792(UI90J5%52_d<N/1i\</i>I?3Ai]G1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UJ.
/0[B#B4Yt&Bl7WnDBNn=DfBW9@;J"J:2b2^G[V_3ARTIt+EMLBBl7Q+Bl5&8BOr;\DfK]0F<GC.
DJ+*#B4W\<<+ohcGAhM4+Cf>,ATJu+Ec5e;@3B&uD.73s@<?4%DBNk0+Du+=@;'dp@k8aHBPCsi
+Dk[uDK?q@ASu('/0JA=A0Adp@:=Ch/0K.MBk(g!D.R-nF!,a>@<*tE%15jQDJNr;85^Qh0etI7
3ANQO2([(++B)on/4!\q0fV$J1G(@?0fU^>/hf.61,q'B3&*<I2D?[61,^a?3ArfO1b:1/c\!cI
B6#O4$;P_b@;B:h/4`Y]2)d?N/2oFE3AiA5Z62MT67bDR0f:^F3%HaE0K(I</iGU=1,CX;3Ai`N
0ek473A*$?2)[HT/1`?tZ7J@`67`QQ:3CVk@:s"a/4`/O0fLgE2CpR=0f_!??Q_^EF"CZL?S"/h
0fLX?1+kC>2)@-F/2o:92`3BH1GLF90JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Xb$e,!g'WEbT#lDBNn=
DfBW9@;J"J:3CVk@:s"a+DGm>@3BT%B5):%@;I',Bm+'.+Dtb!EZdbaCh[d"BOPa/+@0gPF),28
+EqL5@q[!!F!,('D/XQ<+D,P4+DGq=+EqO9A0>r%Ci+*.+EV:*F<GXIF*(i)DBNb6@ps0r8T&'Q
B4Yt!F`S[8Df'?6DJ=3,ATKIJ%15jU@;T^iDCejT;c#&#2(U:c+@B^X/70q_1Gq$K/Mf.:0J"q4
/ibX;1,([?3ANNR2E*0=1GUR;2*!QL2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqASs%jG&MDH+@C'U
F*&ODEc5o8F(&lH+AR2jD/!R!+ED%*ATDi7FDi:DBOr<-F`;A4D.Oi"Eb/[$DfQt2ASH73+E(j7
6#0nH+DlCGBQ%^*B6c*=$;SL4F*)+I844RY3&rrX/2T%=3&`Bq+B;-E/70r8/3#7;0J"q61bLXG
1,CmJ/2f481c@$H1,1=80JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<D?mQ:2b/sAS5^cDBNn=DfBW9@;J"J
D.R-nF!)iOFCB2;+DG^9FD,5.;o>;GBcq5#DJ+*#B4W\)$;Y;O@4Xr;+>G]50JYO;3&!<J3%QX(
87cfm/M&J)3%cpD/2B%@/iGI@1b^p@1H7!C1cI3F0e>(60f:(K@;TREG]-Z%Ebo9-/80-IE-"&n
06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*X/4a>m/0[l&D.+Q2@<3Q"+Co%t
FEo!IAftZ$DfKo2DI[6/+Eqj?FD5W*/0JA=A0>N*ART['E+jN<Bk(Rf+EMXFASu.&BHV#,+EV:.
+@B^VFD55-D0^5:Des?)Bk;?.De:+`Eb0&qDIakuDIakg@rHI*@;]U,+CT.u+DkP4+C\n)Eb0&q
FCeu*FDi:DBOr;V@;Kau/Q-M(@;[2uASH73+<i"*B5M@$F!;e\+q4lTCLL['85^Qh1,Cd=3AWTN
2_<7_+@1!`/3tgA3A<<I.krh;1+Y153B8WG3&WBF2)7$F1Ft7:/iYaF1cI?E/1f)T/4"8l/.Dq_
@;0LcF_G3"ALpAM+>tr42(U^A1,_$Ac\*E>@rEna/29%=2*!6D3&*3?1+kOA/2B%A/ibjE2D[9C
/M]:<1,1[@0fLXS@<Z-oBd[V'DCd?bKIg&3D_*(uFY.98ASbp/+@sJ2CW3>+iddD=CgeGpDIakd
@;0LcF_G3"AKYE%AKYN%@s)X"DKKH#+CT=6FD,]+AKZ&9@<-E3Bl5&%+Dbb0ALnsEF`))2DJ()(
Ec5e;DJsQ;BHVD8+EMIDFD*9L<-N7'De:,6BOr<'Df^"CEb0'$@:F%a+EMIDEar[%idd7f@<-W9
:j$PriddD1+CT.u+B!>kGp#^tBPqm0DW622@W-@%+DG@tDKKT)Gp#YsNGHM6/`M;JF_kJ/@<3PW
DKK<-ATJtBcESKj@rEeI+EqL5@q[!%@;BFq+@1-%BOPIgAKX9TDJ=B)F<E!XK-4*&D^cf;DIakd
@;0LcF_G3"AK]<P+B)cg/g:`3:gnBeD/<d%/6>,9:b=IY/1b-N:ig+t?S#P80ek:<1b:F83ArTM
3B8WF/i#+71c-p<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCt/0\#,DJ*BsDfTDtDBNn=DfBW9@;J"J
:gnBeD/<d%+DGm>@3A6PFD5V8FCfK0+D,P4+Dbb6FDPM2Ch[g*/0K"ZD.7F"Ble!+B-:,eDJ*Bs
DfTD:F!,OGEcl#-Ch4`$DfQt7DId<tASu$iDI[61+q4lUART(e@r!Vd;BRnW3A<!=0JGFC0eCVT
+AcKi/4!\q1,(I@2D$dE1c-a</iba>1GC^>1bg^F0Jk=42)['G1GpjH0J#Y1B5D:'BIk^[Yq/^[
Ft?4&G%GQ5ARloqDfQt"BOr;PBlY=^Ci*Tu@:LEuAfu2/AKXN<+AQ?fFD55nC`l#[D..<j@j"QZ
Anbad%15pCFE1e@=$]b]/N>F8/70McEGR15/2An61,gd=1,(^>0ek:?3%Qj>1G1C?2`!BJ/1iV0
0f1^B1,(770JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#g]l8oJ`\@;]dfDBNn=DfBW9@;J"J:h=`h@3B9*
+CQC+BleB7EbT#lC`m/(A0><$@q]:^Des?)Bk(Rf+Cf,-Gp$g=+EMIDFD,6+DBMPiEb&Tr+CT.u
+CQBm:.8)K:EW_WEbo8/87cgUFCAfn+EM7=AM+E!:hX9IF=]s\+>Gl62CpUA2D[0@cESKZDepsV
/2/q;3ArHF1b^a;1+kIB/3#I=3AE9E2)Hj91Gg^<2`*6D0J"b+cESofDeps6$;bDI@q9"!85^Qe
2)R3A2)m9D0eCVV+B;-E/4!\q0ekOA3%HjB1bpU;/i5:60fM'E1c73M2`WEH1G1RG1cI9O/1`?t
ZRf*N@4Vip:hXE\CLLa)85^Qf2`!<B2`39L2_<7\+B;-M/1iD)/2Jn40J"t80J5(>1,1X?/2o:9
3&<BF0fLX7/C(RQ<D@0Y%15pFDe3g#@qf@&844RT3AN?J1FtOH2_d$<<\ZNe1E\u'Cb/pE1,(F>
0J+t42)6^A/iPdA1GCU;1c[QP2)[!;0J5=C2E3ZN/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><\ZNe1Fth3
Cb/7k@UX.cF(HJ5Ec5o8F(&lH+Ac`iASu3lBji-.@<3Q"DBNA*@qfLlF<G[=@;K@nF)PQ/@<?3n
+Cf,/Bl%L)@<?4%DBNk0+EV:.+AHEXBlmp,Ea`is@;[30BOQ!*DfTQ)Bl7@$ARloqEc5e;FD,5.
@<,pf+E(j7D/WrrEc*I>@<ithAR](cDf.0:$;bGFF`_PC/4`Y]1GUjJ/2T%?3&)u0]-'IY@k92_
/M&b33AN-?1,U[=1G_$F0e>(:/hf%91GLU8/1f)Y/44;b/.Dq_Bl7F!H!r6p6m+3B1c@$E/3#UG
0f1Fg+B)on/70r8/3,=@2CpUB0J5:C3&ilW/1iV:/i>O@2Dm?C1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/5p2%/44)bCh7$m+E2@>E,Tf+Cc`b9Bl7F!H!qh0F!+m6An>gfCh4`5@<?($+EML9EbTV<Ao_g,
+EMIDFD,6+DBM;[Bl%?hDBNeAFD,T/DeF><GA(n;BlbD<@;06pFDi:2EbTE(+CoM2GA^u&+ELt*
Ci=?8+EVNEFD,5.6XaeBF^o)r+EMHDFD,*)+EV:.Gp$U*DBNb0G%De1DBO%7AKYDnFCfK/BkCp/
%15pGE+s?,D.+td;BRkQ2)6^B1,UmG/C(m`+B)cg/3tgA2Dm6G/Mf@?0e>+52)[!@2)?j=3&<QN
3@la<3%cm>2`3BK/6$%kBln&tDCd?a]J;$:@rEnB8T#YM@;'@sBe1B8+EVX4A8-."Df0!"+EMXC
Ed8dAF!,RCCh+Z,AftM)@WHC/BOu3,@;]TuF(o];ATB=EDIIBnA0=]_E+s?,+CT.u+AucaF^ZgD
GA(n;Ao)$i+EV:.BlY>8@<,psFE8R=DKKe>FD,5.F)-%D@;]Tu@V'%fD.Oi2FCB32/g+,,ASH0-
E+*cuDKKqB@ps1i+EV:.D'2YhE+s?,+DkO0GA(],AKYJr@<6.#B-;;0ASiQ(DKKe>FD,5.F)-%^
+DkO0+sM5FFD*3J@;]U"+s:T@+E_a:A0>;mFCfJ8DIIBnF!,RC+Dk[uDBL,IATT&'Cb?nU+A$Gn
Df0,/@:NecF`):P+EV:.+Cf)!Ch.QtDBND"@rH3q+B)r^F_kJ/@;]Tu9P&9RFD)e2DBO%7AKZ)/
E$0(2+EV:.+EV%+C`mY.+B)cgEc>`2/0JA=A0>T(+CT/+FD,6++EV:.Gp$R-@rH3q+AI!qZ63Rn
A0=Th_RUdf@rHC,Bk]2(@qg$nFD5Z2+Dtb%A7]:W+=Kg!+CQC6Bl.R#@<*K6ATDj+Df-\9Afu2/
AKZ&9DfU+GFDku++DG^9FD,5.6Z6mY+A$Wj@;]Us/0K%JAU,D-ARfXqAKXccAS5Gg\KG<uA0=Zb
AS5GgZ63(UDfTf2BdkYY%15pGE,TQ7E\(1178kco/1agV1c$s287cfm?S#P80et@;2_6^B3%cm?
3ANEJ/2K4;2)I3G2`E9C0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?H1c$s>87cfm,"u]^@q]sqDKBo2Bl5&4
Ec5o8F(&lH+A$GnFD,5.Ci<flC`m8&@;KLbF<GL6+B3AqATMF#@V'Rm/0Ic'E,TQ7EZf(;+CQC%
EbT0"F<G"0A0?&0F(o*"AKYH)FED)7Ao)`D+CT)&F_#3(B-;;7+EV:.+E2@>E+O'3Bk;?.De:,#
+EMX5E\8OF$;bPMBl@m#/4`Y]0ekXA/29(C2)-X;3$;1/FY#ge/2/k:3AN*?1b^m?2(gR?/2]@=
1-%6O1H6p@1bLL=2E*?E/1`>-3%S$;FY!t/:iBoc@<Q'1844RU1,1OD2_6[<2D@*I/70N!F^lt0
/70qe/iYU;1Gpp?3&<BM1bpU62)m3D0KD'J0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r-F^lsiDf9D6
8TS]VDIdf2E,ol9Df]?'4!7@<ATD4&@3B9*+EV:.+EqaEA0>T(+EV:.+@C'cCEQ2iCgh3lF!+1c
DfTP7Cgh3oF^\oo+D,P4+CQC/@<-!l+DlCFFD55nC`m2'@:O'qE+NHuC`mY.+E_dJATAo&ART_'
Gp$O5A0>i&Eb8lmFD5Z2/e&.aDerj&Blbgr;BReO1b:@92`<TGcESKl9kc.E@4X)f1GLj>3&r]O
/28b;2_6aD/ibdG2)[0?3&rTH2Dd-B3@l^4cESp#9kc-f$;bYW@<-('+@1-kFE1f+Blbgr;BRnR
1,pg>0JkRF1+^b(+AZKh/1iD)/2]%:2(UO<2_HgF2).!G/1ih@/ibdI1c[QI/1f,"/5Kbt/.Dq_
Des-//4`Y]2E3EH/3#XG1bgQ,]HC-cE\'Lb/29+=1H6sA0ebF81G1XD/2B.?/i5C=3&`NB/M]%5
0JtgL1GUL4/C(mZ;eL,%%15pMCi"6=/4`Y]1-%?K/2K4E1,^]/Z62YKD(I7i0K1gG1Fk4?0JY16
/ho780ekR=1GUpM2)m-B3%cm?2DI3P/1`?tZ7JLWD(H,':iCApBl.9085^Qe3&3?B2DI3K0eCVV
+BE2s/3tgA1,L^E/MJn72_6^:2`*'?3A<'B0f:[F0e=n2/i5CF1H.*@/1f)Q/66J*/.Dq_Ea`Nh
BlJ3'/4`Y]1bpmH/2]4=1-$mB2BY[fBe1he/M&\12`WED2DZsA1,h3L2_6aA/i#.<3&`TD/1`V9
/5/cP/.Dq_EbTB!+@pcdA9D`?85^Qb1Gh!@1,(I;2([%Z+B2cl/3tg@1bh!M.krn;3%Qj<2Dm$D
1bLdF3&<BO/29"72DR3L1c$[6/C(RQ<+0o#%15pPDe"'2DCe=V+>Pr61Ft=@1,h3EcESKZ9kc.E
/20"=3AW0>2)-p=0J519/28k9/iYUD1c[?C2(gX>1c[QP/1`?tYq/7:Be0]#:i^JnF`T*);BR_M
0fCR<3Ar`P/C(^I7qHNg5qF]J0f1m@1,:X>/2Jn70e>=@/iPLF1b^d<1,:I>0K(jM1b:1/cF5>p
ASit-$;bb]G\M#'+@B^XFCB<4Be2bH+>l#2/4W;T2)R*>cESKZASs%d/28t;3ArHI0JtO80ek:7
0e>(72_HpB3&riP/1ib8/iGXK1cR<C/1f)O/43ud/.Dqa@;[Ve;BR\J3&E0@2Dm9L/C(XG7<3)n
/M&S31GUsB0KCmI/2Jn;1FtC>/i#4<2E3WH/NGF?2)m?K3@lp>0f:(K@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,O[4FaeBe1H+@;[3%F!,R<
AKX`dEcYe7B5_<kATMo8De:,6BOr<-ARR,4GA(n;F*),:F!,UE+EV:.+Eq7;ATJu&DIal"@;p=2
Eb0;7F(&d!DfTnAGA2/4+D>>,+Dtb4/g:`3;IOHO/4`Y]0ekIB/29(>2`NA6ZlheXBe1he/M&\1
2)?d@2(gjC1,([G/1ik72`<HJ3AN-:/C(UR7<3)n%16!AE+O-0/4`/O0f:aI2)$R@1Gq!J/70Mu
@rEo*/70qe/i,L=1,UsB0et^H1-$m;1c$a?0KD'N0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,@rEnm
@;K@b@<6]:E,ol9Df]?'4!7F0E+O-0+DGm>@3B2s@;^00@rc-hFEMV8+D,Y4D'2P]CggsbF*SmM
@;KLr/e&.c@<5jn@<3tj;BRbU0JtC<3&EKM/C(mN9P&,n/M&J)1G1XH/28t@/ho@?3A<6?1,^a=
0K(pK1Ft(.cFb]%AT'+/$;t;R@;KRfFD,A>85^Qg1b^g=3&EEJ2([%X0d'"uE\'Lb/29(<1c?j=
1bpj<1G1IB/2B(B/iGUB3AE3=0f1L=3A<6F1Ft(.cET)T87cfm%16!AF(&lu@:s^o/4`Y]2Dm?M
/3#OA1GUN,Yolh]BIlG#0fLmF3@cg>1GgX</hf791,^p@2`!6J1,ga=1+kFB0JG:?/1`?tYq/[i
BIjT";IOWg@:EY_/4`Y]2Dm9K/3#LF2_Zf.Z62PU@4X\q0fLmB1b1F=0fU^>/iPdA1,^m?2D@*F
2`*'C1+k@:0f(dL/1`?tZ7JCa@4Vip;IsK`CiseM85^Qd3B/cF1c[HP3@rI\+A??b/3tgA0JGIC
.krb93%Qd:1H$d=2)6d<3ANTQ1+Y.7/ibgK1,(^>/1f)O/50Vn/.DqaAThL(Be2eQ+>Yo1/2]@B
2_<7_+Ad,h/3tg@0ekIC.kin<2(UU;1,1=73%d$D1,q0K/2o1=2`3BK1b:1/cF,9#F(6a1$;tSN
AS`ng;BR\Q0f(@91c.!H/C(OD:NC/#5qF]I0f1a>0K:dB/2/\23%R!J/iGLB1c@9D/N>@<0JPIA
3%QU3cE\usEbR'6$;tSNBl"nbASuTuF`MVG/4`Y]2)I0N/2o:A3&<,2YolDFDCe()0f1[H2D$g@
2)$R50J5%6/2Aq?/ibU@0K(g?/N,:83&<?N2`3-;/C(LO6Y1-d%16!OF(&m!@:WqZ@<6O2D_+FI
+>G]50f1[;3&**B1+ZcT:N0tu?S#P82_I'M/2B%A/i#.:2_d'=1+k7?1cR6M/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"ulBIk?+E+*WuF(c\8Ec5o8F(&lH+B!-!@;KXd+Co%+6Xb%XEc3(E@<3Q"+EM70
DJ<]s@ps7s+D,>#F`M%9De:+^@;KXfBjkm%@s)U0F`M%9@;]TuE,ol6Bl7L"F<FM$@;]e#BHVM>
Blmp,/0K.MDf]J4E+s6.AS#stDJ()9DfTV9De=*&DBNt2An?!oDI[6g+EV:.+Dtn+BQPA*DIal"
ASbq!FD50"+E(_(ARfh'/g:`3;K$YcDImuB85^Qh3&iZE0eb=@2E<>6Z62PHCb.k'1,(LC2(LC<
1H$d?/iGO;1GCgA1H7<K1Gp^<1bLXG2)-gC/95<FATDj'A0=QSFD5VD0fUmE+AcK_ATDX++B*Aj
EZd_XFCB!(B6@c:cE\uhAS`nA4<R[9DIIX*EZfC6G%G]8ARlo3:2+3JDes>76XaJ7Bjl+%Eb-@W
+AQW\Derj)F!+LpDIIX*E\&>RATMg/DKBN$Ch4`$DfQsT3&*64F*(i2+Cei%@;KjpF_*!G%16!U
@q]=[BIl\P+>bc./2fCG2D!.\+@BRY/4!\q0JP=?3%Hm@0f1F:/iGU=1,1C<2)@6N1b:O=/i#4?
1,q*A/1f)R/43ie/.DqaF_bGpF=]s\+?))53%R'I1Gh$AcESKjB6#OT/1iD//ibg@1-%$@3B&ZM
2_Zd71b^O?0f:sJ0J"b+cESp!B6#O4$<(ABBko7j;BRkR2`N?J1b^X>/C(^I:N0tu5qF`L0ebF9
0f:dE/2Ah71Ft:=2_HsJ1c7$K/1iS6/iPOB3A<BC/1f)U/5L4u/.Dqb@:O+^FCf?(/4`Y]0fCaA
/2B"<2)?f/[NIkYE\'L-0JtO>2(LL<0JtC;/iG^@2`33G0f_*I0e>.9/hf4A3&<QG9OW$WDCd?a
[Oa^eE\%Y,;dj3F@q]=c@4XrI+?2553%Qd=0Jb^H/C(RE6#gor6")<"1,:RC/MJn71Ft=73&W<D
1GpdA0f1RB1b:45/i,IG1G^j=/1f)Q/4"8r/.Dqb@:We_@UX:k/4`Y]3&W`Q/28k72`*KFcFb8r
AS3PG/1iD//i>@71Ggj>2)$^D0KC[>1bL[?0f:mK/1`?t]IZljB.OK!;dj3FCi*a"Bko7j;BRqU
0f1F90KCgG1b?qW+@1!f/3tgB1,(RF/MJk53@lp<3Ai?D1GLL=1c79Q1Ft+3/i,4B3&EWH/1f)O
/4"8r/.Dqb@:We_F*2V9/4`Y]3&39F/28h:1,h0DcE\QYEH3Tr/2Aq90fCU;2)@'?1+kR@/2K%:
/iYgN2_d0@/N#.<2_d$G2CpC1cE\ueEH3T>$<(ADE\'aZ+?)5>2CpR:0JkXC/C(RE6[<;q5qFcF
1,:U81b^XA/2Ah51Ft=92(gaD2_[6H/2T%51,UsJ2`WE?/C(RQ6[<;q%16$BB45gt@<?0k/4`/O
0eb:?2`E9F2DmEK/70MnAT',,/70qf/i5=70fLm@3Ar]P2`WE@1bL^E2)[HP/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"l^D_+XpE+*QoF(HJ5Ec5o8F(&lH+B)]]@<-3nFD,)*BlbD=BOr;]AT2'oBcq;%
D.Oi%DfQtBBOr<"BkM*jF*&ODART?sBl5&8BOr<1DfTZ)+=LZ7F)N1:DJs`:+CT=69lG/lF<F"q
ATD@'F=A>@DIal2H#7#/C`mY.+DtV0Bl@ltC`m\;Bk1ctDe:+eAT2'o/e&.d@;0[o/4`Y]1,(C=
/2B.?2E!,3\fadhBe1he/M&Y00K1OB2D.!G3AE9C/1ik72E!QR0JtC4/C(gX:NC/#,#iSkA8-."
Df0!"+DtV)AKYT*Df$U_Ea`Ek@lbabZeLGlJKWUCfnA"ZfVmH#fWcQ?@<lH-@;IN1@:E]aJT<:a
Ch\!&Ea`d#Gp"JU@;0<r-ms([DfTA9.3NP@+EV:.+D5CsDKI6Y+q4lX@;Kd385^Qi3&iTC0ekO@
2)$T-KHO*&B.PVc/M&_22)m-C2)$X;2*!HL0e>(9/iPU@1G^p?/1f,#/5Tnj/.Dqb@;^./DIG(e
5u]F4/Mf4783p3,:b=I[/70MuB4WW$/2An61,g^<3&!6A0eb490e>+71G1CB2)@-F/29+:0ebFD
1G^R;0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL;eKYm9jqj[ATME*E,ol9Df]?'4!7I1DKBr<@3B9*+EV:.
+DtV)AKYo'+EV:.+DlCGBQ%^*B5(jaC`mA)@;^00Ao_g,+EVX4A8-."Df0!"+AH9\FCfN)+D,P.
CER_-Ch7Z1FD,*)+Cei#EbT)q+EV:.+EMXCDIml3De:,6BOr;VDgH=ED.R?gCh\!)Bk&9-ASlC&
ATJu4DBNV(EZf%,@:Uu"$<(ARB45j485^Qg2)R0@3&WNI3%W@b+B)cg/3tgA2`!BK/Mo7;0J"q2
3&W<C2Dd$B1-%9J0e=n51+kRI2`NQL/1`?t\1CQgD_)>);dj]\DCe=V+>u&20J#1?1H.<FcEn]b
ATB=f@4X,l0f:X81,LjB/2Jn51+Y1<3%d-I2`WcP/2B%73&<QM0Jk=HFDPB,+@C'YChYFOcEo,n
ATB=2$<(GGE--,CD(J4U+>G]40e>(72*!KE2)?@DEbR'j/2/n:3&3'?1bgs@1bLI;/2fL@2)I0F
0Jk=40f1L=0JkI<2_7X2FD5VD/2]477<3)nAo_g,+EV:.+E(_1Des!,AKYK$DKBo2Ci!O%Bl@l3
De:+j@qBV$Ecl4A6?6LPA7]XfF`M,/@s)Vt$<(GJART[385^Qi2`ETF0ekID3&)u0Z62tTB.PVc
1,CU?3%HaD0JtC:/i5C91GgsA3A`NL2_lp>3%cmE1,h0M/1`?tZ7Jg`B.OK!;e'KPA79L085^Qb
2E36D0fM*DcESKZ@<3tO/2/b70Jt@<2D[*>1+k==/28h20etXH1H6pC2D-jC2`!6E/1`?tYq/7N
F"@b-;e9H]DId/u89nWSF_r[#;BR\M2`!!?0JkXE/C(UF<+0o#6");u1bpj@.krt=1+Y462`N?H
2(ggD1H.$K/29(92)I'G0f1F4/C(UR<+0o#%16$FB5)6785^Qa2)I'>3&ilU/C(XG6Xb$e/M&J)
1G1I@/2B1;2*!WU2)d'E1G1RE0JP79/4"Ao@<3PYDe3a!/1f)S/43ie/.DqbAS5^pF`T*);BRhR
1Gp^B0ebOD/C(RE6>pcn6")<!1c$mA.l0.>3%Qj<0Jk=90fUd>0f_'K2CpXD/i,1@1,Ud;/1f)Q
/4+8n/.DqbBOPa/85^Qh1cIEG3ArfR2_<7Z+B)oa/1iD-3A`EE.ks";0e>.61H@!A3AiEC1,L^A
1Ft7?/hf"93&r]E/1f)O/5p1m/.DqbBOPad/4`/O3B8fJ3@m$F2E!BC?Q`$RD_,6H?S"2i0eb.5
2_cp=2_m0E3%QX9/i>CE0K1d=1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/50Vn/0[o!CM@j3@;]d%E,ol9
Df]?'4!7I8@;TEqBlbD*DBMr"A9B#2Blmp,@<-W9FCfK0+Dk[uDJ=!$+CQC6D..6s+DbJ'E$0(>
+D,FuD.P7@F*VV3Des,t+E(j7FD,5.Ch[NqF<GL6+EV:.+EMX5E\8OF$<(VHEb]#r/4`?/+?);;
1GLF>3A`NH/70Mu@rEo*/70q_0eP7=/2B%</ho:A0K:m?/MT4;3&`]P0Jb780JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL;e'_s,#rMpFCeu*6#pCC+@U-]Eaa'$F!,FBDfBW9@;J"J;eTT[C11cuBlbD=BOr;r
F_l/BEa`c,@ps=jFCAu.De:+lDJ=3(A0=0Y@:C?JD/"$!FCfME+CT.u+Cf>-F(o/rEb/c(FD,5.
@qg%1+E(j7CMn'7Ch7-iAKYN+AKZ)5+DGq=+DkP)Gp$[/F^nj%Bl@ltC`m5!DKKH1F"AGJDKBo6
FEM\:F"AGNF`V,:D0%6NCh[@!@<-'nF!+n/A0>PsEbTW(B4W2qASuU$EcWiW%16$I@<HBp/4`Y]
2Dm6K/3#LI1,gc0]-($^D_+1_/29(>1H$g@2_[-@0eP@>/2B+>/i57;0fCsA/Mf=<0ebCC1,LO5
/C(jY;e'_s%16$IASc'hCFi"S+?)#/2CpjD1bpa9cE\QdH#bH%@50;f3&NBE.l/t:1+Y462)6^<
3&3*D0f_6Q3%QjA/i,C@2E!NG/1f)P/51>0/.DqbBOu3mFCB&<85^Qf2)?dC3A<6?cE\QYEbR'j
/2/e91c?j>0Jkd@1+kIA/2B1;2E!6C1c?m?0J5==3&!-C/1`?tZ7J:^Be0]#;e^#U/4`/O0fUmH
1,(7>2)7'F/70MuB6#P1/70qe/iY[=1-%$@2_m'G2_Zd71GURC0f^pF1Ft:80f^@J5ufWn0Ha,!
D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1
@;TRs/70r,B6#OnBOPdeBjkm%E,ol9Df]?'4!8BO@;^-/-YI@6A1&L6DBO%7AKXEcAKYetDJ+*#
B4W\)$<(YZBm"JJ85^Qc1c[9A1GUaC3@rI\+@Ak3/3tg@2Dd9G/MT.?1Ft+4/i5C90eb=71,q3I
2)Qp:0fCXC0fCa@2CpC1cESof9joR^$<(Y\F_kJ;85^Qi2DHm:0ekCA0eb0(\fa:YE\'L-1,:XE
3%Zg@0f1F=/hf+51G_$D1c%-G3&E0<1bLO=3&!3J/1`?t\h$-eE\%Y,;eof`/4`Y]3&`NO/28k8
0f(^=cEn][EH3Tr/1iD//i#@:1Ggm?2E!<J2)[!;0f:RC1,([C2_6L2cEo,gEH3T>$<(kZ@<-('
/4)`T0f1I=2)RBF6:<=Y1bCOA2*!3p+AcW^/70r8/3,=A3%Qj?3%d!I3B8rW/28t62E3]Q3&N6B
0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\
0JPRrE,]i9G%G29DIIBnF"CZL:h=8j,#E2oBldr1E,ol9Df]?'4!8ELD.R6#@:jUmEZe;!Cgh?u
F"AGB+Du+@AS`JuGp$%-@;]e#`I_NB+A??`/g:`3;fHG\@4XrI+>ki12CpaD1cI6BcESKmBlYaj
@4X,h1,Ug=0ekC:/2/\:3%Qg=0eP4A3&3<L/1iS2/ho7=1GLm@9OW$WDCnA!@:`qe/OElTH#.D:
Bjkm1/C(LO<bZS*,#i5e+A?3cBl5&8ATDW1BlbD*+EVX4DKBW&FD5Z2+E(j7FD,5.7ri0PCEUrU
c\0TFc\Ki#c[m9`BPCsi+DGm>@3BZ4@;^.&@<?4%DBNk0+@0dY@:X(\DBO"6F^fK0FEJ^1Ch\!&
Ea`d#Gp%<OBlnH.DBO"6FY.'F/Tkk]FEKEG/0JA;C`mS+@;]dsB0%/H@<*K/Aft`,@;0U3+q4lX
FCfK5ASuBo@q]s883p3,:b=RV83p3,:b=RV?Q_XPA1V(=?S!oc/i>I:1Gq!A2`EQK0KC[@1+kCA
2*!TO/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K\A1U,kFCSu,E,ol9Df]?'4!8ELD.R6#@:jUmEZe=p
AKXon@<-C6+AQW`BQPA+Gp$.%DI[6qF<Ga8DBMGfB4rn,$<)%eBju"$/4`/O2`3QT3%QmB2E*HD
?Q`$fDCf-G?S"/h0Jb771G^X?2DI*L3@lsB/hf.@3&*0>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,
/0[H%Ddda%@;[3,Ec5o8F(&lH+DtV)ARlolAoqU)+B*B&Bju!n/0K%JAKYW(A0>f&+EqO;A9/l-
DBMko@<Q?p+DlCGBQ%^*B6c*P;fm%o@W-90BlbD*CiaM;@3B&n@<,ddFCfJ8Bl5&8BOr;qDf9D6
:i^9gNFa5HH6?a,G&D#3AKWBgEc5B.Bjkm%<+0TSF!,C5+A?]kB-9KQD^cf<Gp#\%@;]Kr6?6mV
`.op=@E#s'Ea`j"`.orh%16$V@;KjlBl5Im;BRnY0K(I:0JPRF3%W@[+@KdW/4!\q1,(LE2CgL>
2)Qp@/iP^?1GCgA3A<HN1GC@72(gmD1,(XC/95<FATDj'A0=QSFD5VD0fUmE+AcK_ATDX++B*Aj
EZd_XFCB!(B6@c:cESogAS`nA4<RC5@rH0lF`S[GAThX*F(Jl)-r+Jd@rH1%+@BRI@qf@nDfTD3
4s3U7@rH0lF`S[+AStpuDfRBOEb0<2Df0W1@VfTuAoD]40fUmE+EMX5EZek#FCB!(B6@c7+q4lX
F^fB"/4`Y]1H76I/2T:C0K:W/^E?3]D_+1_/20(@0et753AiWE1G1O?/28t=/i#CF2Dd*=3A*9O
1,CUD/1`?t^FW&iD_)>);fub^Bl#=k;BRbR1GgX>1cR3J/C(jM<b6(u/M&S90K:a<1c$mF/2Ah5
1Ft7:2D.!M3&ruT/1i\7/i5@>2)mTI/1f)Y/66=u/.DqbF_kJu@<=%k;BRnQ2`N?K1GLmH/C(RE
9R1Y0/M&V92)mTH1GUdA/2Jn62(ULB1bL^C2*!EO/2K%62E3]S2)d';/C(RQ9R1Y0%16$ZEc#59
85^Qf1G_!A2E<]M0eCV\+BE2s/1iD)/2St52_6^=1bLI91H%!E/1ib40JG1<1c6g8/C(dW<bZS*
%16%PJSeh@@4Xr;+>PW.2`!HF0ebLF1,LOh+Ad,F/70r8/3#7>2CpX>1bLXA2)$aC/1iY4/iPRF
1cR<C1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:
DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCR/5pS'+A?3]CLM*'E,ol9Df]?'4!7J?JSeh@@3BDu
@;^-/E+NHfAKY])+EV:.+B)ulBOP^gF(HJ1@;]_#@:s.(%16'C@VKp885^Qb2)I*?1,:[C3@rL,
1E]J6Be1he0JkUH3%H[@2)m-C/ho@;2_m!B2D?gA2(UX<3ArTI2`3-;/C/i&/5L;#/.Dqc@;0Lc
/4`'+/Pn#U0J#a\<%Uou1b^If+A?3R/70r8/28k31Gp^>1GpdB0et^H2(URA/i5FE1H%-B1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/50J^/50c"BQ[a$Bjkm%E,ol9Df]?'4!7L2Bkq-"D.R-nF!,F5@:Njk
Bl5&8BOr;[Bln$2@;]dfDBNb(DJ+*#B4W\)$<1GJH!tT'F(fK7/4`Y]1c7!I/2]@B3B8Y:LEKSk
@4Wu]/M&\12E<<C2`<9G0etUD3@m!G/iP^L1b^g=/1f,&/6,DQ/.Dqc@;1"$/4`Y]1c[9K/2f:<
2`<3H+@L6Y/1iD)/2]%81Ft7@1G1XF3&riN/2f@<1c%*J2`*':/3#1KEa^L.$<1GMBln#s/4`Y]
1Gq'N/2T1<1,gc0\KFmH@4X]Q/20%@3AN*A3&!->1G1C;/28q;/iYO>3&rZD1cR*A1bgsF2CpC1
cFGK+9joR^$<1GOB6%E3=$]b]/M]%3=$]b]/M]%3?Q`0VB.RC@?S!od/i>L;1Gh$C1c[<M1,CI9
3%d!I2D@'L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S##bB.QAlChI0sBjkm%E,ol9Df]?'4!7L2DJ*uu
+DGm>FD,5.F*2GBASl!$@qBIfF*),)C`mA/A0>u-@<<W'@<-10+@:3eB45h%+EqaEF(f9,ARmD&
$<1GOBji,MF`VYF@;KY!/4`Y]1b^gJ/2]+@0JP-(]HC3K@4X\q/M&\10K(I:2)R!D3&36H0J#%8
/i5RK2).*B/1f)Z/6,DQ/.Dqc@;]df+@:!eARTChF"Bj[+>bc.1FtC;1H.'?cFY3!9joS=/1iD/
/i5F:0f:d?1,h$D3Ai?E1+kRA1c%!I/1`?t].?rV@4Vip<+0`W@s)?6844RY1H.3L/2K7>1bgOg
+@BRX/70r8/3#7:0J"q52D.!I2_d3M/1i_9/i#=A0f1^<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43id
/4+8kBm+3!DBNn=DfBW9@;J"J<+0`W@s)?*D.R-nF!,%9ATDZsC`m\*FD)e2DBMGl@<,doBcpi%
A0>o(E,oN2ASuU2+EV:.+AHQdCO%%(@<iu;BQA$6B4rE3BPCsi+EV:.+D,>.F*&O=DJ3HfBlmd$
FE8RCAfu2/AKXEMEcbt;@<-C&G%G2,@;]Tu@rHL+A0>o(FEMVA/e&.e@<,e&ARm>_;BRnU1,UUC
2_m<O/C(RE6#g]l/M&V:1c@-?0ebCB/2Ah:1+Y1@2D-jF1c[9J/28h22DI!C2DQg7/C(RQ6#g]l
%16'CEb6jn;BRbN1c[*D0JtUD/C(OD6Z-Bb5qF]L0fCm>0KCjB/2Jn91Ft791bLL<3&i]R/3,=;
3&NQM1b:1/cE\ugDIY4,$<1GZB4Z0n/4`Y]0ekLB/29(@1GLF83?V:0FY#ge/2/k:2)6[;1bq$A
1bLR</2]=<1GCR<2DZm>1bLUC2_m<G/1`>,3@n-<FY!t/<+T]ZBl7K585^Qd1,([=1b^XB2_<7_
0d&i$@k9ns0K:dB1+P(<1H@!C/iGX>0etO;0JtX@2D?[:2_I!F2`NQI/1`?t[P9=#DIY4,$<1SO
@<=%k;BR_M3&W<D0JbOA/C(mN7qHNg6");u2DR'B.l&k90e>(43&`BK2(ggE0JP:;/2At52)-mE
3&<*:/C(mZ7qHNg%16'GEb/]kCi"62/4`Y]2`3TS/3,[D2E!,4M',`0E\'L-/M&_22_Zd<3B/WO
2*!WP3%QX:2D-aF3AiTL/1`?uM(DS<E\%Y,<+U5aCb/+C<%Uou3@l^g+@1-j/70r8/28n41,^[<
0eb472E3QP3%QjE/ho1:2Dm3?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4"E!/0[Z,Ea`NqBcqA8DfBW9
@;J"J<+U5aC`mS+@;^-/<GlMoATDj'+E)9CAThX*H$!_6DJ()#DIal!AS5^pF!,[@FD)e=BOr<&
ATW$*EZe=iAh5'HBOr<&@<6N5Ch7^1ATAo-DBO%7AKXNT@WH%(+CT)*BOP@]F=naH$<1\MASl.!
/4`Y]0f1dF/2Aq93AW54Keac>EbR'V/1iD//iYR:2E3<K3&``R0J"e30J54@1,CaA/1`?uKeb2J
EbR'6$<1\]@UX.*85^Qf1-%'?2E3WQ2D!.Y+@L6Y/3tgA1b^aC.lK4>1Ft=72E*0B0ek:73B&]R
0e>4>/i,FD3&NEA/1f)O/4=Me/.DqcBjkdk/4`Y]3&WQN/28k70etL8cE\Q_Eciob/1iD./ho+4
1Ggd<2E!HQ2`<3=1c?sG3&EKO2CpC1cE\ukEcioB$<1_JDJ+*#DCe=V+>Gl20J"t;1c7!=cF+ip
@<F+e/1iD./ibjA3&E6E0ekCB3@lp?/ho1<2)I-@/1f)T/6$&#/.DqcBjkn)Be2eQ+>c&91FtF>
1bpj<2]tM/@4Wu]/M&b31c$[;3AE-G3AW?L3@m'H/iPdE1GC[;/1`_26ul]e%16'KD/"#A844RT
1cR<I2_6pB2E3WH?Q`-`BImLA?S")f3&rNF1cI$A0fLjJ2CpF71G1ID3ArZO/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"ulBIk>o@;]^o@:WqjBPAT.Ec5o8F(&lH+B3&lBlY>5ARTIt+Cno$CMm^)F!,17
+@9XWB45Uj+DbJ(B6@WqALns4Ci"6)Bl7Q+FDi:DBOr<-FCB24@V'7kB-:epEZee7@<iu0DBO%7
AKYMlEbfQ(F)rIBAfu/6@:Nk$+q4lYBle*)F=^KZ;c#&#2DHaa5uUT30fCa;?Q`0fE%G?I?S!oc
/iP^?0etX>1G^sL1c?m:0ek:<0JGLH2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F`8m+DfTc+@ps6t
E,ol9Df]?'4!7L:F)5Q4+DGm>FD,5.DIIBn+E(j7@3BApCLnW&DBO%7AKX9\CghB-D/XQ7FCAm$
F!,C5+AHcpDe!9q/g*`-+Dk[uDK?qBBOr;qEbT&q+DG^9FD,5.6#C%VBkM*%Cgh3oF^\oo+CT.u
+DGp?BlbD*F)u80Bjl*pA0?)1FD)e*+D>=pEcbc2Deip%+C\njF`_>0F_i15Bl\#4Bl5&%DBNA*
@qfLlF<GC<@ps0rCh76jDIb@/$<1_]@<ZF'/4`Y]1c76D2`3<G/C0"m6#L3a5qF]E1H%3C1bgaB
/2St53@lpB/ho@H1Ggj<1bgU>0Jt[E2_6^<0f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.,PKe,N-A1U\oFCBB-DBL?9CiaM;CMn'7DBNA/
+AHEXBl7?%De:+kATVj5@;[M:BlbD*+EM+9FDPN*ASuT4Bl5&2DfTr5ATDZ29lG&j@q0F"@;]Tu
<DGt]6Veh+DfTZ)+@p'aBlmcrAKXocFCd'I883-eDfTQ%@;Kb*+DGp?G@>P8@;[3%D/aE6FCB'/
+E275DKI">AftT%DKK;sF<G%(FE_;-DBO%FD]iP(G%kc,H=:o0Df0V=-rY(nDJ=0*+CT.u+@1$V
@OWF.DIal3GAeU6Df0Z2DIm^-F!)l"F`MD>AKYE!A0=0MEbT#l.3N&2FCfJ8FD,5.3-8gV@qBP"
F`Ma[%16'QC2%K8=$]b]/M](4/70MgEbR(3/2/k90f(C:1Gh*C0ek:>0e>1;/iYRF0JYX>/M]+7
3&*EO2`N?D0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7<3)n,#iJqBl"o+F!,R<AKYl!D.Oi.Afu#0AKYo'
+EV:.+AH9i@;[2uASH7#ATJu7ASbdsARlp*D]j(/Bl5IEF*)>@D0%6N@;]TuAnc9s/g:`3<,ZSe
D..<585^Qf1c@$=2_d3M0eCVT+@B^X/4(mB1c%-M/N,:?0J"q21Gp^=0f^jG3ArQO2CpF<0J5=@
2`3?M/1`?tYq/7RDCc5(<,ZY_FD5l2/4`Y]1c@$J/2]CI2)6^7+@BRS/1iD)/2]%>0J"q<0eP7:
1-%?P/2oI>3A<<L1Gp^=0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(F?ARoLsBl@l?/M'7tD(JY)DIIX$F_DnA@<3Q5BOr;PH?<_.+D5V'+E(j7FD,5.
;fut1%16'QEas6.@<*ni;BRhO0J#1<3B/S8^E??o@k9ns0JPCA1b17?0KC[@/i#F<1,^a@1cR<M
2Cpj@0f:mK1H-j9/C)!]:ig+t%16'WBl[d&/4`'+/Pn#T2CqBb<%Uou1H$dk+@B1I/70r8/28n4
1,UU;3&iNG2E!<L2Cp[A/ibXD1G^g<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43HU/0[Z+Bldr1E,ol9
Df]?'/g+,9Bl[d&+Eq78+EV:.+CTD1F<GL6+EV:.+D>n8FCfK:@<-C&DfQsiBl@m,+DkOs+@C9g
BOPUkC`mY.+A$TfF(c\4AS5RlA1SjIBQ##;@<3Q5F`MA2A0>T(FDi:1+D>\9DIal!Gp%3BAKY`!
@;Kk)F!,('Bl\JA<F]]aA7]1c@V@A<%16'WE+pjo6m+6@0K2!C0fLdH2Cr2X;Isr$?S#P82_Hg?
/2]7:3ANTP2E*0=2)6dE0f:pH3%Qg=0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r+ATTII6?6L\Bl%KlDBNn=
DfBW9@;J"J<-<.o+DGm>FD,5.DIIBn+E(j7FD,5.D/XK;+E27<F_ku=F!+%lA8,[fDJsZ=+AcWf
E,9).Ch\',DJ()1DBO%7AKYPmF*(u6DBNG-@<6N5De:+jDfp/8+@0jUEbT#l/0JD5AoD^$+EV:.
+AcusFEM5=ATME*@<-C&G%G2,Bl5&8BOr;@2KWUT@qBP"F`Ma[+q4lYF`>6n/4`/O0ebRA1cHsD
0K(aE/70MeEcip?/28n82)m0G1b^X82D.!M/29+B/i5C?2`E`J/N,F<0JYC;3&iHE0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL6ZR<#:gnBQB6@X.@;[3,Ec5o8F(&lH+B3K&_kS>gF!,C=AKYo'+D,P7EZf=A
Bl7EpE,9).B5_=%+E(j7FD,5.7s/6\@;]d%6Z7$_DeF!+Gp$g=+E27<F_kK,+AcKe@:s^kH!tS5
AoDL$Ci=?*+EV:*F<G7.CiErr+EV:.+EM[EEb0*!+D5V'+N'=MD..<mFWbdE+CfG'@<?''FD,5.
<GlMoATDj'/e&.eF`M&-F"Bj[+>Y`32(UOD2`3NFc[d38F`8lt/20%;2`30B1bgs@1+kOB/28n7
/iYgK0JbX=/M].81GCXA1,LO5/C/ku:j$_.%16*NA79.&85^Qd3&EKD1cI6I0eCV\+@pcd/1iD)
/2Jn=0J"q81bLdH1b^UC/1iS/0f1XF0eb.0/C(dW89nVp%16*NCisVH844RT0JY@;2_6gF1-%'?
?Q_^IDCf-G?S",g1cHs?2`<9D0eb@?1b:493%d-D1H.$B/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QU
DCeUuFCS`nEc*!kF)59&A9/l4Ec5o8F(&l;+B<2nF`&==ARTIt+E_`JDfQtEAKY])+EV:.+Acco
CLqO(+DbJ(B6@WqAKYo'+EV:.+E1n1E,9).De:+gBlminBl\)68TS]VDIdf@%16*QF_bE%BOPU+
85^Qf3&NND2`EEL0J(MS+B)il/1iD-2)I-G.kik:2CpU92DZm>1H$j>2E!QS2Cpa=1bppH1-$m:
/C(LO;e9u#%16*QF`M,;DJ=3(/4`Y]1,^sI/2K(A2)[#3K-3NU@4Wu]0K1[?2_?dD2)[!A/i5R>
0ebI;1bq'M3&3$:1,ggG1Gh'I0J"b+c\!c99joR^$<;+hCFi"E+>P`-2_Zs;3ArQM3%SDZ;eKYm
?S#P83%d3M/2B4A/hf"=1G_!A0fCX@2`*9L3@lp>0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8
F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,B4WVcEa`s%
+E2@>E,Tf+Cc`b>Ecl.?G@>P8@;[2rDI[BlDKI"2BlnVCDe:,6BOr;bF_t]1+CT.u+@9LGH#.D:
Bjkm%@qg+#Ch\3(FD5Z2F!,17+AHEgDfBW:@;T^e+EM7=F^]B'A0>;sDf021@;[2rDI[BlDKI"2
BOPdrAS`K-Afu2/AKXEaE+j9#FCfM9EbT].EZf(6+Dl%-ATDZ?A79a+8TJ6Z/e&.gAS5F&85^Qh
0JG443AE9I1+^_U+A@'$/1iD-3&<HQ.l0.A2CpO70Jb782`WKG1Gh$H2(UOC/iPaG2E3]J/1f)O
/51>0/.DqeATDL,@<?'385^Qi3AW??0ekR?2`<3A1a#)%A1U"t1,C^@1Fk7A0f1F=/i#151Gpp?
3&36H2)[!A3A*'C2DI3N/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f<NQBln'-DCdM!/4"/a/0[Q(Df$V=BOr<&@<?4$+<i"1ATDL,@<3V:/0K%T
F`_:L+B3#c+CS_q@<?4,AKYT'Ebuq9ARTIt+<i"RBOu3q+EV:.Eb-A-F!,RFF`_:@+tb&K$<CkY
A7]Ul@<?O(GUuB`+>c)71+Y=>2D@*AcF"cqBlYaV/28q71,:@70Jtg@1+kOD/29.B/i>IB0f:m@
0eb4?2*!BJ3@l^4cF#3(BlYa6$<LYW@<=%k;BR_R2`E9D2)R6F/C(UFB4Yp26");u2_m'A.l&h:
3@ls=2)$R90eb461GCaE3@lp?/ibmH1GLd=/1f)R/4X8g/.Dqf@<ufB85^Qc0JkI71,h*H3%W@\
+@C'`/1iD,2)R*B/Mf7@2CpX:0et:>2_I$F3B8uW/1iY8/iP[J1GLR7/1f)P/44>l/.DqfAU7p*
/4`Y]1,_-K/2K+>1c-c/Zlh_1@4X]Q/20":3&E3B2DR*?0ePFA/28h;/hf:E3&NB@/M]4:1H@6H
0JG%//C(UR6VUu?%160ZEcP`//4`Y]1G_!A2)@'K/C([H:hXDk6");u0ebRD/N#C?2(UR:0JY16
2_HdE2DI-H/1i_:/i#7@2`3QG/1f)T/5U"k/.Dqg@;T^hBl/!5@4XrI+>tu32_6pD2)-p=cFbkS
;e'_s6")<!2Dm3L/Mf@?1Ft=70JG%52)6dE2E*NM0J"e33%cmA2`!EI/1`?t]J1s9@rEn-$<V"U
ALpA?+>Gf21bgm>3AEKN1+ZcT9R1Y0?S#P82D-[?/2B1=/ibU>1c70B1H$jC2)[?H2CpU;0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70r%H#bH2@;]goDJ()2Ec5o8F(&lH+BW>kAKWDa^9Zj`N%#l`F!,R<AKYW(
A7T7mF!,C5+EV:.+EM[C+DG^9FD,5.6YL1OATME*D0^5:Des?)Gp$O5A0>;sF)N1AAT2[$F(K62
F!,R<AKYPmEboH$F*&O5F*)G@DJsB'EcW@3DIal#AThX$DfB9.F!,C5+CehrASu$eEcW@;DBNA*
@qfLlF<EqaBl7?3%163[@;]^h/4`Y]2)@*E/2fLI1GUN,]-'FYD_*Ik0f1UC1b1C@0JtC</ho=:
1,1U<0KD!N0et::2D-[C3&<6H/1`?t].?9eD_)>)=_2+d:iCDsATDL'E\'aZ+>to42(U[H3&iZE
cF"cjE+gdS/29%;3&<-?1c-s=1G1F=/2B%=/i>UB1H.-A/Mo(<3ANHH0J"b+cF#3!E+gd3$<^qN
+Ad)mDfRC";BRkO2)[!E3AifQ/C(UF:N0tu/M&V70f1[<0JbO@/2Ah:1Ft:<1G1OE2Dd-C/1iY1
2E<TM1,CI4/C(UR:N0tu%166PCh.[+/4`Y]2E*TU/3#LH1,:E+Zli@CBe1he0fLmD1+P=B1Gp^?
/i,@91,^p@0Jt[A1,^[C2D-jH2Dd<I/1`?tZn,3OBe0]#>%);_@;%2_;BReS3&rNJ0JP=C/C(^I
<bZS*6")<!1,1dL/MJk80J#"43&rNE3&E6J2`<KO2CpF6/iGUG2`WZF/1f)U/66J*/.Dqi@<HU!
CFi"S+>GW-0e>%=2)I*?cEeW^EbR'V/2/k;3%up=1G^a:1+kRG/2]F?2)$sF2D?[60f(F>0K:pE
2CpC1cEf&jEbR'6$<gk]Bkh("@4XrI+>br40J#(?2`3NFcE\QnBlYaV/28k:0K1L90f1d>1G1OF
/29(B/iGXE3&3BC0ePCC1cI-J/1`?tZ7K$jE\%Y,>%h>^B.QSO+>Z#31Ft@B1Gq'Ac\4(r89nVp
5qFT=1bLL;/28t?/iYaL2)R?E/MT(73&ENO0Jb72/C0#)/4b%p/.DqiBjtLe/4`Y]3B/iH0f:[G
2_<7_+@U<b/4!\q0JbF@3%ZgD1c[*D/iYO91cR*J2)mEK2CpF>/iYRG2`!0>/1f)T/4FSn/.Dqi
Df]c(/4`Y]1c%!J/2]7D2_lr0Zli%RD_*Ik0ekC>0e5"51GLF9/i>O<0fD!D2)7*E3&rNF0J54<
1H.$J/1`?tZn+m^D_)>)>'4:cDImWsASuX"Be2eQ+>l#40e>7=2DR$=cET,I9PIre6")<!1c6sI
/MT.;1Ft:62`3-A1,:I@0f_-J3%QX92D-[?0fM$M/1`?tYqdk(BjrV&$<hR]ASu'qBOP[s@:Eq%
85^Qf2`N`I2`<HJ1G$hX+A?KY/3tgA2)@*I/MT(=2_6a;3AE'?1G^XC3&*9L3%QX91bL^H3AiTN
/1`?tZReda@Oqrq>'4:cDImm!BOPadChYFk;BRhT3&N6G1cIBO/C(OD9PIre/M&J)1+kI>/2At@
/i#:=2_m3@/NGF>3&3KK1b:1/cE\upBjrV&$>s9n@:*PVCij)mFC/lq1,gd:/I`%qF`_;8E]P=4
/g*T(E+NoqCCLV]ATM@%BlJ0.Df.TY<+oue+DGm>:-hfE>UOS8De<Tq@qf@f+Dl%8DBNn3@<6"$
+E1b%AM+E!CLqd8DfTB03Zr!DCh[j0ALns?F`(W./0JeJDf.*KE+i[$ATKCFF)Pl'E\&>SF`&`Q
FDl80C^g_nBln0&3Zq0`;aDNX+@KdWFC?:k%14[=/I`$r$6pZt:-hfE+=KunFD5Z2@;I&PATD^,
@<H[+@ric$DIakgE+*6f+@0OTBl7X+FE1f3Bl@l<>psB.FDs8o06_Va/oG*=@4l22FtY9R$4R=e
,9UH@+@^B_A0=<^E+NoqCFgSu;as+s:i'QXATV@$Gp$%2F*(u1F!+.b@W-9qFDl2F%13OO,9TNk
F*)>@Bk(Rf+BDoeF_,V:De:+[AScHs+B0I3cBM9W+:SYe$6pc<6"FDCFCeu*Ao_g,+C$*[Bm+&1
9keE[ASuC"F_r6g@;^"$+E(j7;f?J\EZde\Ch[j0ATM*#+C&,>F)Y].@;?uoDIakaAS$"*>[8H]
$4R>ABOr<)Eaia)@;I'*Df]W7Bl@m1+E(j7FD,5.;fut#@;]Tu9lFrf+ED%5F_Pl-A0>?,+D#&!
BlJ-)%17&pARoLbFD5Z2F"AGBEb-A'@;KFrCghEsA0?#9Bl7Q+<+U)jATMs6Bjkg#7!WZYD/!Kg
C`l\kD.Oh<<(&/E$=[RV@<HX&+DGp?BlbD*+E_R9AoD^,+EV=7AKZ&(@;KL-+@pEpAThX*/0K.T
Ebo8/FD5T'+F7sDATJu&DIal#@;0P'%16ocAn<)nEb-A&@<6!j+E)-?<GlMoATDj#C`l\kD.Oh<
<E(D"+A$GnDfTB"EZfIB%16T`DK]T3F<G.)Ch[j0AKYr4ARoLbFD5Z2F!,(8Df$Ur6m-Si+B;Al
+EV:.+Co1uAn?!oDI[6#@V'Y*AS#a%FD,6,AISugGAeUGBl.E(F(8WpATJu2F`VXI@V$ZtDJs`:
/g+,,AKYr#Ea`frFCfJ8A7]S!@4bG$.*e&V.3N>G+EV:.%16NaBln$*ATVWr+Co1uAn?!oDI[6/
+DG^9F(Jj"DIdf>+C\o(G@b?'+EV:.+EVgG+CT=P%13OO+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<\so<$4=H<(%i\+B;AM$4R>=@<6N5G%#30ATJu4Ag#B`<$5[ZDBND"+Co%oF^nun
+D,Y4D'3q6AKYZ#F*)>@Bk(Rf+ED%'DfTB0/g*`'%17&_Ecc#*F_kK,/0JVKDIdd!A9/l3AftYp
Ch[j0AKYo#F(KB8@<?4%DK?pK@W-@%+EMI;@<*K!DIal+F`(W..3NhGEb,[eEb/a!Eb&`l+DG^9
ARTUqGp#OuEc5o.@;[V=9ke-KCh4_X@<6O%Ec*".DIakWBPD?qF(HJ&DJim!F"@b-D..=)F(96)
E--.P+CT.u+CehtDf0VK+A$GnF)Yi8AKYo'+EV:.BlY>:ASbdsBm+'(Gp$pAG9CjFARfFqBl@l?
%172jATME*A79Rg+ED%4Eb0<'DKI"CBOr<)DJXS@AThcuASu!h+D,P4+EV:.+Eh10F_)\6Ag#B`
<$6.#BlA#7FDi9V2D?fo$:@67+A$GnFD,5.@qBP"F`M2-F!,(5Ci"$6Bl7Q+FD,5.Bl8$5De+!#
FD5Z2+E(j7FD,5.FCf9"F(9--AKWC2Bl[]l%14gJ0KC7C74Bc1FD,T8F(&rsF!,C5+D>J%BHV;;
@;KY"Gp%$7F(KB8@<?4%DK?q6@<Q3)@V'+g+DkOtAKYo'+Dc1<@<)eaDe!:"Cij*-Bl@m1+E(j7
F*(i2F"SS7BOr<(F_tT!EZee.A0>;j@s)g#@sK28Afu2/ATME*FD5T+DJ+#5Bl7F$ARTXk%16]f
Df$V=BOr<-AThX&FCf$$FD)e=BQA$6B4rE0BOr<.G@bZ6Bk;C"+Ceu#FEMVL/0JA5AoD^#Bl7Q+
G%#30@:F%a%16WSFC?;+DBO%7AKYMpFCfK0Bl7@$Bl@l3De:-;PZ07X5p0]LFCAm"ARlolDII@,
F(o\<De:,6BOu6r%16r`@<6R3ASl!rFE8R:BlnH.A0?)1FD)e,F^f&p+EML<Bl7L'+D,P4+O63N
+D,Y4D'1Df0JFVkD]gPb3AiK5Bla^jE,oN2ASuU$A0>T(+B2cYCh4_D+CT.u+DG_'Cis9"F!,R<
AKZ&9@;]UaEb$;(EcQ)=+D,P4+D"tkBHVJ,Cis:u$7JVeEcPl8Df-\+DIakgFCfE)ASuR-DCcnc
0JG=4/e&-s$4R>kIXV_5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$<1GCCh4_D+>"^:@;L'tF!,C5+O63N+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#6tLCQG%G2,Ao_g,+@p3fFDl26@ps0r+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%16!E@rHBuF!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$<^qKEZcJI+<VdL+<VdL+<VdL+<VdL+O63N>Tb.3+<VdL+<VdL+<VdL+<VdL
+<XU)@;]UaEb$:]EcQ)=>R_#_+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL
+<VdL+<VdTF(Jj"DIdf;%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/P+
/M/P+/KcVs/M/P+/M/P+/M/P+/M/P+/M/P+/I`%=2)$^,+<VdL+<VdL+<VdL+<VdL+<Vd]2_d<H
+<VdL+<VdL+<VdL+<VdL+<Vd`1GB7F/Mo.8+<VdL+<VdL+<VdL+<VdL+<VdL0f:gE0H_J\+<VdL
+<VdL+<VdL+<VdL1H@,u$8"%f0H_J\+<VdL+<VdL+<VdL+<VdL+>G],3%uHt+<VdL+<VdL+<VdL
+<VdL+>Yo0%14[B0JFUl+<VdL+<VdL+<VdL+<VdL+<WBo2`WQ7+<VdL+<VdL+<VdL+<VdL+<WHr
0F\@@0eb:(+<VdL+<VdL+<VdL+<VdL+<Vd]0fCjB+<VdL+<VdL+<VdL+<VdL+<Vd^3A:mL0H_J\
+<VdL+<VdL+<VdL+<VdL+<VdL0ebIE0H_J\+<VdL+<VdL+<VdL+<VdL1,^fq$8F4g+<VdL+<VdL
+<VdL+<VdL+<VdL+?;>60H_J\+<VdL+<VdL+<VdL+<VdL+>Pc-%14jE0H_J\+<VdL+<VdL+<VdL
+<VdL+<WX%1b^$p+<VdL+<VdL+<VdL+<VdL+<WEo0F\@F0JFUl+<VdL+<VdL+<VdL+<VdL+<Vdc
2E3B5+<VdL+<VdL+<VdL+<VdL+<Vd]3%tdK1b^U++<VdL+<VdL+<VdL+<VdL+<VdL2E*<D+<VdL
+<VdL+<VdL+<VdL+<VdL0fC]p$8jLk+<VdL+<VdL+<VdL+<VdL+<VdL+>l)40H_J\+<VdL+<VdL
+<VdL+<VdL+>G],%15!I0H_J\+<VdL+<VdL+<VdL+<VdL+<WL"1b^$p+<VdL+<VdL+<VdL+<VdL
+<WBo0F\@J0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd_3&**0+<VdL+<VdL+<VdL+<VdL+<Vd]0JEqC
3&!$/+<VdL+<VdL+<VdL+<VdL+<VdL1-%6H+<VdL+<VdL+<VdL+<VdL+<VdL3%tdK3A<-0+<VdL
+<VdL+<VdL+<VdL+<VdL1,:O;+<VdL+<VdL+<VdL+<VdL+<VdL2_Y[J0eb:8+<VdL+<VdL+<VdL
+<VdL+<VdL0f:mD+<VdL+<VdL+<VdL+<VdL+<VdL2)PgM0ek@9+<VdL+<VdL+<VdL+<VdL+<VdL
0ebUA+<VdL+<VdL+<VdL+<VdL+<VdL1b]@G0etF:+<VdL+<VdL+<VdL+<VdL+<VdL2`*32+<VdL
+<VdL+<VdL+<VdL+<VdL1GB7F0f(L;+<VdL+<VdL+<VdL+<VdL+<VdL1c[64+<VdL+<VdL+<VdL
+<VdL+<VdL1,'.E0f1R<+<VdL+<VdL+<VdL+<VdL+<VdL1GUX,+<VdL+<VdL+<VdL+<VdL+<VdL
1,'.E0f:X=+<VdL+<VdL+<VdL+<VdL+<VdL1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL1,'.E0fC^>
+<VdL+<VdL+<VdL+<VdL+<VdL0etF*+<VdL+<VdL+<VdL+<VdL+<VdL1,'.E0fLd?+<VdL+<VdL
+<VdL+<VdL+<VdL3?TFe+<VdL+<VdL+<VdL+<VdL+<VdL2%9mI2`393+<VdL+<VdL+<VdL+<VdL
+<Vd]1E[e_+<VdL+<VdL+<VdL+<VdL+<Vd^%14gL0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq+<VdL
+<VdL+<VdL+<VdL+<VdL+<WBJ$8FLt0H_J\+<VdL+<VdL+<VdL+<VdL+?(Dc+<VdL+<VdL+<VdL
+<VdL+<VdL+C%#`%14gM0JFUl+<VdL+<VdL+<VdL+<VdL+<W6l+<VdL+<VdL+<VdL+<VdL+<VdL
+<XoO0b"IE3AiK5+<VdL+<VdL+<VdL+<VdL+<Vd^3?TFe+<VdL+<VdL+<VdL+<VdL+<Ve34>8BB
%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`&9IXV_5%15[E+Dl%-ATDZ2FD5T'F"AGUBOr;sATVL(D/!lrFD5Z2+E(j7
cBM9NBlbD6@:WplF`V87B-:W)Df'2u+Cf5+@r$-.@;]Tb$?BQcBl>,4@WQ+$G%#K,Df0V=De:,3
F^]?"EcWcSF)N18F<G:=+Cf>,E,9*-AScW7Bl7HmE+NotASuT4De:,6BOqV[CisW(EZeq4BOu$l
EbTSI+B2cYCh4_E+D5D3ATJu9BOr<0@;L't+E(j7cBM9NAThX*Gp$^5G%DeAARTV#+D,Y4D%-h,
3AiZ:FDi9W0JG@,-p_orEc5i6D/!KgC`l#[D..<j@j#B%EZd+k0K(I)E+*Bj+A4^D/e&-s$4R>k
IXZ_T$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%16'C@VfTu1*A.k;Is?LDKI!D+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL%16-ECis<1+E(j7cBM9NAo_g,+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZGBl[cpF<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZR@WQ+$G%#K,Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZ0/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P++>#/s
/M/P+/M/P+/M/P+/M.D==_2#^+<VdL+<VdL+<VdL+<\so<*UOg+<VdL+<VdL+<VdL+>k`RARTU%
6YKnGB4Y<j+<VdmG%G]&B4Y<W$6UH6+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL+=M;B
@rH6qF"&4S+<VdL+<Vd]/QlXnEZd__@;]^h>R_#_+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+=M;B@rH6qF"%P*/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+
/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/O`$8FOu2(gR*+<VdL
+<VdL+<VdW1GLL:+<VdL+<VdL+<VdL+C$K@+<VdL+<VdL+<VdL+<Ve3/I`%A3ArQD0H_J\+<VdL
+<VdL+=f6(/i"Ol+<VdL+<VdL+<Vd^/hnIk+<VdL+<VdL+<VdL+>>E)1(=RF3Ar`I0H_J\+<VdL
+<VdL+=f6*/iOmq+<VdL+<VdL+<Vd^/i=ao+<VdL+<VdL+<VdL+>>E*0F\@D3B&WE0H_J\+<VdL
+<VdL+=f9&/i"Ol+<VdL+<VdL+<Vd`/i=ao+<VdL+<VdL+<VdL+>>E.%14gM2`33A+<VdL+<VdL
+<VdL.l9+92'="a+<VdL+<VdL+<WNo1E[e_+<VdL+<VdL+<VdL0eP.<%14gM3%us=+<VdL+<VdL
+<VdL.lB"52'="a+<VdL+<VdL+<WNo0H_J\+<VdL+<VdL+<VdL0eP.6%14gM3&N<B+<VdL+<VdL
+<VdL.lB.91E[e_+<VdL+<VdL+<WHm3$9=d+<VdL+<VdL+<VdL0J5:B%14gM3A<'>+<VdL+<VdL
+<VdL.lB4;3?TFe+<VdL+<VdL+<WEl2BX+b+<VdL+<VdL+<VdL0J54<%14gM3AiEC+<VdL+<VdL
+<VdL.lK(63$9=d+<VdL+<VdL+<WHm3?TFe+<VdL+<VdL+<VdL0J5:D%14jE0JG+5+<VdL+<VdL
+<VdL.lK193$9=d+<VdL+<VdL+<WHm0H_J\+<VdL+<VdL+<VdL0J57;%14jE0JtI:+<VdL+<VdL
+<VdL.lK4:2]s4c+<VdL+<VdL+<W?j3?TFe+<VdL+<VdL+<VdL0J5(>%14[=/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`&9
IXZ_T$4R>ABOr;pG%G]&B4W2oDJjT*C`m5$@;]^h+E(j7cBM9NG@>P80J5@G+EM+(Df0).Ao_g,
+>Gl72'@!Z+>Gl90J3eA88i]`G%G\F+EV:.+CTG)Ea`Tl+CT/*F^])/Bl7F$ARTXk+Eq78+DQ%?
F<E7i2DZIsARfXrA0>K)Df$UO3B/l=FDhTq1,(C9/0JA=A0>f.Cj@-W/ho=.F(Jj"DIal%Ec5e;
1,(C9+EVNE1,(C>/g*W+FEMV8+Cf(nDJ*O%+CT.u+EVX8DIdet$>FB#cBM9N@ps6tDJsV>@V$[$
Eb/cq@ru9m+EqOABHUerEcb`(DKL.HF(oN%AKZ).AT)U#FD55nC`mS5A7]Ru+E(j$$?Trm+E2">
F(o,mC`m4rF`V,8+CT;%+Du+>+E(j7BPD*m+D#G/F_>A1E,oN"Ble!,DD!&#G][t7E,TQ$FD5Z2
Et&IgEc5e;FD,5.FCAWpAKZ2.BkM+$ARlomGp%3BAKYf-DJ()2ATDL'A0>u7ASu$$Ao_g,+EV=.
@;I&qEa``tDJ()1Ado)hBOr;\Df9M9De<TmEZfC6@<6@)@:F%a+D#V9Bl.:#ATJu4AfrT^2^!0Q
@rH6qF!,17+>PW*0J"=s3AVe!ARfXrA9/1eBl5%K0JtO8+=f3$1E^aM@rH6qF!,17+>PZ*0J">T
DIak?1c-s1F(Jj"DIdf2Bl5&8BOr<3ARTU%1,:O;/e&-s$;YedF(o/r+EV:.+E1n4Bl@N)De:,1
@WQ+$G%#K,Df0V=-oE\4+@8Fa+EVNE1,(C>+@ARH/0K%JAKZ/)Cis;3De:-;PZ/)!@ps6t@V$Zn
G][t7E,TQ$FCeu*Ao_g,+Dk[uF*2M7A0?&(Cis<1+E_a>DJ()6BOr<&Df02>FCfK0+Dk[uD@Hql
@<,dcDes,t+EVX8DIbd;$4R=O$6UH6+<VdL+<VdL+<VdL+O63N+?^i!1,'h$+>Ybq.Nih>1*CXL
@rH6qEt&I!+<VdL+<VdL+<VdL+<VeNBOu3q3ZoPe+?^hqH"CE)/MT4?0I\Y00JEqC%15BDF(KB+
ATJu4Aft;sDes]:Df'2sC`m;6E,oN2F(oQ1F'U2-FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G
02k;L@<=@[A7]S!@<?I,Cj@XHFDYhC+D>2,AISuUAS#a%A7]dqG%G2,Ao_g,+EV:.F(HJ)@<>p#
FDi:CBl.g*BkDW5FD,5.AThKuF^]B+Df-\9Ag#B`<$5dkEZee.Gmt+&Bl.E(A9Dp,DJ()6BOr<#
DKKH1G%#20/MT7G3?WE^+=f6%0JG+%<+ohc>BOgnATDm$Bl8$<+DG^&$I4l8>psB.FDu:^0/$mH
Ch[j0AM.V:An*H2@<5j0B5_rH;ak2)F>Y^oDI[6uFCAm$FEoKPFDYhC+E)F7EZfI;BlbD9ATDL'
A0>AjDBND"+D#V9Bl.:#ARl5WAo_g,+EM%$FED)7+DG^9FD,5.D.R-sF`M&1ASuU2/g*W%EZee$
A8-."Df0!"+DG_*DfT]'FD5Z2/0K"FANC8->=<%=FC?:k+CT.u+B<;nG%G]8@;I&cBl.Ee-tm^E
E-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij)b/nf?DCagtG$4R=o/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>DDfTZ)+EV=7AKZ;;DIml3@<,p%@:OD%@;Kb*+C\c#ARlp%DBM;bDfTB&DIIWuA.8lG
DJ=9*EcYZ*+B3&lAKWC$<'r)e+A$YtBlbD*DBNA0Df'2u+EV=7AKZ&>DI[@#Df098ARlolDIaku
A867.FCeu*FDhTqF*(i9+EqOABPD?,0J5@.F(Jj"DIdf2De:,#F*)G@DJsB+@ps1iGp$X/FCfK0
Bl7Km+B<;nG%G]8@;I&cBl.Dj$7JnR.4u`=@q/qgBl@ltCi"AJ+CQBt,&Ch!E$045@rH6q>Tt;)
F!+n%A7]9oFDi:%<'qdMD]ih,AT/c+F<G:8+EMgG@grchBln#2<E((hGA(]#BHUeu@;]^hF!,"9
AKZ)5+Eh16Bjl*tDf0V=Bl5%^@<-I'>UOS8Ec6&.FD5Z2+ECn4ALT5@$4R=o/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R=e,9TlqAn?!oDI[7!%13OO9lG&mBle31/0IV=+CT.u+B*AnE+ig#F)PqI+@[t+;D'LC>Tu^Q
F*)>@Bk(Rf+BDoeF_,V:De:,6BOr;T@<-I'>UOS%$:AWJ@r!2UEcQ)=+O63N+CT.u+EV:.+@BRR
@s)TrFD5Z2+E(j77:U.JE-#T3>Tt^A8hM5WBleAK+@1'jEc5hJ/0Iu3Cb?/(1Gp:O@<-H41FsY7
F_>i<F<E=m0Jk=':2_a-0etF6+E29B1GUm@1G^p3-o*J11at$d$4R>@FCfE)ASuR-DBMD$;BTCc
A0=E]F_kT"DBMY+5qX]2.RA/m@<3Q0AfsWYF*)>@Bk(Rf+@TdVBlJ-)+AH9`F"/^M$:A6=@WH0n
B4W2cDJ=8H:i^,gF"T!d6Xah@EbT&sALnrY3B/oL%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO1,(C@+AH9b
@qZu?2f<&F@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_aFCANu?Ys=/2^9GL:-hfE+=Kun
FD5Z2@;I&PATD^,@<H[+@ric$DIakgE+*6f+@0OTBl7X+FE1f3Bl@l<>psB.FDs8o06_Va/oG*=
@4l22FtY9R$4R=o+<Ve2>=`[LAR-]tFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G04eX0BlJ-)
/nf?DCaiX!$4R=e+Bq9ECh[j0AKY&c@N\T`FCe`+BQS?8F#ks-F)Pl'EcZMIFCf;ADIITp/n]*G
04eX0BlJ-)F"_3FD.P@L%13OO,9n=?Gp#RsARloPF)Y].@;@D:7oMlE+Acl_DImouEd8d+H#n(=
D0$gn@:F.q@<?F.Gmt)i$6pZiDes]:Df'2sC`l/kE,oN2F(oQ1F!,(5EZdb]Cij).<$3U7PZ0(S
%13OO>A/,#E-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=/nf?D
CgAH&FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCqFDYhC
%13OO,9n=#Bm+&19keE[ASuC"F_r6g@;^"$+E(j7;f?J\EZde\Ch[j0ATJu!>=EUPAStpl+CT.u
+AHEYF`Uen+:SYe$<;.]DJ()6BOr=3PZ/cK@;L'tF!,")EbT].A0>K)Df$V=BOr<"BleB7EbT#l
C`mb0@rHBu+CT.u+D,Y4D'3A'Eb/a&%17#_F(KB8@<?4%DK?pKF(JoD+BqfR@VfTu0jQ2@FEDJC
3\N-t@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW5.3K',@;]Tu>?#$?
Ch4_E>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH9LWH"F>Y^^AScHsF=q6KD/:G=@:Cu@
+=Sia@3BW&EbT*++:SZrAfu&2CjBo:D/!Ep+D#e:Eb0<5Bl@m1+D>2,AKYGnASrW#Eb/[$ARlp*
D]j+8D/a<*ApGM@BOr;tG%#30@<?4%DBNk0+O63N+D,P4+CT/5+EV=7AKYN+EbTE(%172jAKY])
FCfK9@;I&<0f_6S+EVNE.l/k50J3eA%160J+Co%qBl7K)FD,5.A7]7bD..6'H"CE)+C$+9>Tt;!
F!,(5Ci"$6F#ja;%144#+<VdL+<VdL+<YqP4Wo#]@<*J@+=M)FDKKP7/Kc`"2(:151(=R"$<1\Q
F!,+0G%G_;>U"Gu+s:K9EZfI;AKYi(A7TLf+E(j7FD,5.D/X<6BIk9MBPCsi+DGm>@:NeiEaa'$
+D#G/F_>@s$>4'rASrW4BOr<*Eb/`pF(oQ1+DG^9FD,5.CMn'7DBO+2Cis<1+E(j7cBM9\+B3#c
+D,P.Ci=N3DJ()2Des]:Df'2sC^g__G]7\7F)u&6DK?q1@;[2sAKZ,:ARlon@;KFrCghEs+EV:.
+Eh10F_)\6Ag#B`<$3T'DBO"3@rH6qF"&5MG%G\:FD,4p$?U!!AKYr'EbTH&+Cf>5ATD?m+C]U=
De:,6BOr;j7VR$W+AHQdCh7L%Bm"886XakNDBNk0+B*2p@<*JZ@r,juF(KDR%14[A3B9)BFDi9P
1GCL:>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH;akYJ@WO1[9g_iJ/nf?DCagtG$4R>/
AS,k$AKZ).AKZ80@<*JB2)$^8+Cehr@s)TrFCdKB$4R=b+<VdL+<VdL+<VfPPZ/bg+>#?&+=eQj
1*A%hF^?g4$6UH6+<VdL+<VdL+EqL1Eb.9S+E\ei+=MLe0fUpB.5*D00F\?u$:8<GG@b?'+F.O,
EcW?T2)$^,@;]Tu.lB"7/0K.J+E_a:+EV:.+Cno&@3B0&Df$V$<+06PAKW^5-tm^EE-"&n04eX0
BlJ-)/n]6;@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PK;_+D#e-AT2`6FD,*)+D,P4
+EV:.+F.O,EZcqk0JFVnAKYJr@;]^hA.8lfBOr<0@;L't+>Gf03A;RtD]gbn1,(L:2]ugP+E):2
ATAo8D]iJ3DeW`)@3B)pF(9-+FD5W8BlnVCGA2/4+EV:.%17&pAThd+F`S[;DfT];CgeGpF<G[=
@<<W'E,T6"/g+,,AKZ/)Cis;3AoD]4cBM9NBlbD0Bm+'*+C]U=@1<Q_Des]:Df'2sC`mY.+EV:.
+?"=T+Co%rEb/f5+EqL5@q[!*AT2[.A9DBnF!,R<AKZ/)Cis<1+DG^9>?#$?Ch4%_0jQ1[/h^-l
@psI:04\X1FCB8DBQS*-,BR@'0e"5hBln#2@;[3!EcQ)=+Du+>+DbJ,B4Z*+FD,*#+>b3^ARfXr
A90d@$4R=b+<VdL+<VfPPZ/bg+>GQ-3&<0F+>"]j0JPC:1bg+&+E\eW+>Yf+2`NTJ0d%qgF^?gG
/Kco'3AiQG2)?@)+E_!H%144#+<VdL+<VdL+<W6Y0J5(=3B/iQ1*A%hF^?mI.j-Mu0JYC<2`*6L
1*A%hF^?pJ.j-Mu0JGL@1GLdF1,0n$+E_!K+:SZ#+<VdL+<VeNBOu3q3ZrPf4Wo#'0eb9j$4R>/
ATW--ASrW9ARTV#+=f<'0HaeAA0<BW2D?g9+EqB>@:s"_DBO(CAKZ).AKYMlFC?;(Ec5e;%16<=
@:F%a+>I.MBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX@psI:04\X1FCB8DBQS*-,BR@'
0e"5eD]iS%EbT].+CQC3Des]:Df'2sC`mY.+EV:.+?"=T+Co%rEb/f7%13OO+<VdL+<VdLcBM9N
4WlI:2`*-B+>"]n2)['@0d%qgFW`1W2_cp?1Gh$G+=\LV?8<WR+>>E(0f_0P0d%qgF^?j5$6UH6
+<VdL+<VdL+>"]i/iY^B1Gh!G+=\LV?8NcV+>>E%0JtOA0KD-Q+=\LV?8WiU+>>E%0K:jG2_m'G
1E\.iF^?s8$6UH6+<VdL+EqL1Eb.9SFW`gi.![C!0JG100/5.7%13OO6=k7_AS#a%H"CE)F!)tf
2D?g-@;]Tu.krt:0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i%1,'h&+>>E.3&!<7.NigU
/Kc`"0JPF@1*A%hFC$^F.j/q?1E\=n2_d'J%144#+<VdL+<YlAATD?C+<YbK4Wo"m/Kcc+0JEqC
%15F5FE_;-DBO49@<-E3.krt:0HaeAA0<BW3&!$;+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg
+?1u51E\1j0J5(<0Jah$+ES_X+>>E%0JtjG3&Mg.+EUpF+=eQg/het50f(UA2BXIlFC$aG/Kf.A
1a"Fo0ekUD0JG0i$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0fLd?%13OO6=k7_AS#a%H"CE)F!)tf
3&!$/@;]Tu.ks"A0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i%1G1UA+>"]i/i,:=1c.-6
.NigU.j-Mu0JGCE2DHs0.Nih>1*A(i0J5%51bg^>2BXIlFC$aG/Kc`"0JG1:2`*<K+=\LU?8Nc6
$6UH6+<VdL+<VdL+=eQg/het50JP=;1,gs2.Nih>2'=In0J5%50JG170fD$P+=\LU?8`oV+>>E%
0JG170JG173&`];.Nih>2[p*:+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc-0JEqC%15F5FE_;-DBO49
@<-E30fV'F+CT.u+>Gl10J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i+/iGI-.j-Mu2)d<M
+=\LU+>"]i/i#:=2`3E7.Nih>1*A(i0J5%62E3BK2E2g/+EUpG%144#+<VdL+<VdL+<W6i/het5
1c.-I2DR*3.Nih>1a":kFC$gI0-E#+1GLgF%144#+<VdL+<YlAATD?C+ES_h+F,(]+>Gi60F\?u
$:8<GG@b?'+F.O,EcW?X3A<-0@;]Tu0f_!C/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl=3
/iPd5.j-Q!1c[BI0f^@++ES_X+>>E%2*!WV1H?R-+EUpF+=eQg/het;0f_-M+=\LU?8E]U+>>E%
0JG4A2]sRmFC$d5$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0f^pA%13OO6=k7_AS#a%H"CE)F!*1t
1,'hZDIakE3A`HA+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>PZ(1,'h$+>>E-1c.3K.Wcdb
+>>E%2`<BE0H_hfFC$^F.j-Mu0JG793AWQ9.Nih>1CX[6+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc.
1,'.E%15F5FE_;-DBO49@<-E30f_'F+CT.u+>Gl70e=GW@;KFrCghEs3XlE*$6UH6+<VdL+O63N
+?^i&3A*!E+=eQg/i57@.Wcdb+EUpF0/>=>+=eRV?8E]W+>Pf22[p*:+<VdL+<VeNBOu3q3ZrMe
4Wo"m/Kcc.2)#IH%15F5FE_;-DBO49@<-E30f_-H+CT.u+>Gl92Cot\@;KFrCghEs3XlE*$6UH6
+<VdL+O63N+?^i(2(g^C+=eQh/hf1B.Wcdb+EUpF0/>F>+>"^X?8E]W+?)#7%144#+<VdL+<YlA
ATD?C+ES_h+F,(]+>Gl82%9m%$:8<GG@b?'+F.O,EcW?X3B/o>@;]Tu1,(C>/0JG2Ch%U(@<?'A
%13OO+<VdL+<VdLcBM9N4WlX=/iYa3.j-Mu1G^jF+=\LU+>"]i/hf1;1H.-5.Nih>1*A(i0J5%5
0fLjH2'=@kFC$aG.j-Mu0JG1=2).'F1a"7jFC$dH%144#+<VdL+<VdL+<W0W0J5%50JG7<2`!<O
3?TdoFC$g6$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]1,(C9%13OO6=k7_AS#a%H"CE)F!*4l0Jst]
DIakF0JtO8+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>tu-3AM^-+>>E(1,:RC+=\LU+=eQg
/het:2)mT=.Nih>1(=R5+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcf&0JEqC%16'JBlbD.G]7\7F)u&6
DBNY7+Co&(Bm+&u+D,Y4D'3D2FD5T#FCeu*G%#30ATJu4Ag#B`<$5mm+EV:.+F.O,EcW?Y0JP6j
$=Rg_+>PW.0J4JIBOr<0@;L't+D,P4+>PW*0H_c%2D.!4F(Jj"DIdf;+DGm>@UX=hA0>f.+CQC/
Bl7KjEbp"1$>"I(Ea`p*CghF"Df-\0Ec5e;1,(C>+E_a>DJ((G/i,L1F(Jj"DIdfAH"CE)+=LZA
ATD3lAKYT*Df$UO3B8r>FDhTq1,(C>.4u`BBOr<0@;L't+D,P4+>PW.0H_c(1E^aM@rH6qF"&5G
F!,:5DIm6sCj@.7G][t7E,TQ$FCeu*Ao_g,%14jE0ea_mF(oN)+>>E+2B['P@rH6qF"_fM@<*J=
@<Q4&@:s-oEaa'$+D,Y4D'1Pn0JO\lD]geh0JFq.%13OO6=k7_AS#a%H"CE)F!*4l2)$.]DIakF
0f:X9+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>#?&+=eQj1*A%h-n'?m0fUpB.5*D00I^<`
+>"]i/i>OB3$9[n-o*M70H_qiGps10%16'JAKYetF*&OHATDW1BlbD2DKKo;A9DBnA0>u4+D#A'
D/!lrFCcS:BOr;sBldd&DKKT1F_PrC+CT@71,(R>/e&-s$:/9GATAnK0f:X9+Cehr@s)TrFCdKB
$4R=b+<VdL+<VfPPZ/bg+>#?&+=eQj1*A%hF^?g4$6UH6+<VdL+EqL1Eb.9S+E\ei+=MLe0fUpB
.5*D00F\?u$:/KE+Eh10F_,V:De:-;PZ/c7@<6!j+E)-?9lG&mBle31+CT.u+B*AnE+ig#F)Pq=
>[&s;0Jm$?+CT>4F_t\4@1<Qe@;L't+D,P4+EV:.+AHcmDHnQ1+EM+(F_kK,+CSbiASbpu@<?4%
DBNk0+>#?,+CT;#F(Ji7@sM<c1+j\?Dg,c9ATB=2$?Trm+@St#/M]"60J>C@+Dc1<@<*K%E+ig"
ATDL++D#D/Ci=T1A0>T(+EV:.%16<,@;^"$>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH
;akYJ@WO1[9g_iJ/nf?DCagKLF(KD8@3BW-BkM+$Cj@.6BkCsgEb0-1+Eh10F_)\6AfrZ\2(gjG
3"64'Eas0%@kV>;>[B0<+B3#sF"AGB+EMC.Cht5(DfTl0@ruF'DBN1.@pC3#D09oA+C\n)@:Wn[
A0>u4+EV:.+Eh10F_,V'$=m^gBm+&u+D,Y4D'3q6AKYr1CjBo:D/!Ep+D#e:Eb0<5Bl@m1+D,P4
+O63N+C\noDfTD3FD,62+Ceht+C\n)F`V,)%16fe+EV:.+Bq3ADJsDu-tm^EE-"&n04eX0BlJ-)
/n]6;@kMY-F($\6Dg!d47<!BYF"]CF6W6E+BQS*-.1HUn$6UH6+<VdL+CcNW+>#9"0JG170etaF
1*A%h.!Zpe+>Gl62(;ie%13OO;e^,ZAKZ).AKZ/)Cis<1+E(j7cBM9NAoD]4FD,5.Bl8$(Ectl-
+>Gl62'@!Z+>PW)2'@*SEb-A(ATDL.ARl5WBl7HmE+NotASuT4De:,#DL!@@F`(W.+D#M*ASl"!
BlbgJDJpY-DfTl0@ruF'DBNY7+Dtb%A7]9oAoD]4FD,B0%17&cEbTH&/e&-s$<1\M+Bru+@qB\&
@;0V$Gp$g=+O63N>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH9LWH"F>Y^oDI[6uFCAm$
FEoKPFDYhC+E)F7EZfI;BlbD9ATDL'A0>AjD@Hq^AKYQ*FD5T#FCeu*Ao_g,+EM%$FED)7+DG^9
FD,5.D.R-sF`M&1ASuU2/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$6pc<;IsHOEb0,uATJ:f%15gJEcPl8
Df.*K9J.GrDIakgFCfE)ASuR-DCco"/g+%E/0J1A883-eDfTQ%@;I&e@;L'tF!,C5+EV:.+@T^Z
FD+o,Et&IDCi<g!+@U<kDfQuGPZ/c6DIal3BOr;R@;KFrCghF"Df-\9AfsNPCh[j0ATM*#/0IP;
+@p3fF=n\%F*)G@DD!I_<c;e,%14mK+AcKeF<E@j+@1-_F`VXI1,(C=/0I]+/g)l(0J">cE$-ql
2_?gA2BXD'0JG=4/e&-s$<)%XE+ig#F)Pq=7P7R]@;]Tu88iWeA7]X$9eJ^a/0HE.FDPB,+E(j7
883-eDfTQ%@;I&T@r,juF(HIg@;p9;/.DqR@;TIoBk1jf+B<;nFtQU3ATMoF/0I;gD.7O"A7oI)
+>Gl92D,FG%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$4R=t0JGF.:LeJh0Ja.FDKU&0FD5Z2?YOCbCi=3(BlnK.ARAtE
F(nuuA26)=F`_&6Bl@l38T#Y>@r,juFD55nC`lDiDJ*[*F_#&+.*e(&W$ritDIakfBkM+$+@1'Y
ASuR'Df-[GcBM3m.1HVI4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15RFDf$Uh@<itp@;]soE[PoNG@b6)Blmo/>A/,#E-"&n05b?>
E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"^fIBQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6
Bl@m10.AL_$4R>.ChI[,Bln$*+B38%6Z6g\F`_1;<+ohc:3CYeFD5Z2+A$Gn9Q+f]BlnK.AKWC/
A5I>]?muNl%16'JAKYT'Ci"$6Bl7Q+@;KRpEbTW/D'3>,D/aW>ATJu9BOr<(F`_&6Bl@l3Bl5&)
@r,juFD55nC`mP4DJ*[*F_#&7+DG^9A7]CoAS#p6+:SZiDfQt/+D5D3ASrVu8jm&0@<-"'D.RU,
/g)8Z8TZ(hF!,1<+C\c#ARlp%DBO%7AKWHW3B/]88O6?!<+oi]Ed8dGAfsikFCB9*Df-\+DIakf
ARopnFD5Z2/h.;;%16'JBlbD?@;L't+DGm>FD,5.@rHC.ARfgrDf-\>D]iJ-E,9eBFDi:DBOr;\
76sZkG%#30AKYo'+EV:.+D#&!BlJ0.@ps0r%16oiDJ*[*F_#&+FDi:?@WZ$mDBO%7AKXrM<CJ$H
Df03%FEM,*/0K.NFD)e*+EV:.DfTE2Bk(Rf+E2@4@qg!uDf-\9Ag"sq0J5%50d'nF@j#i(@kJ2t
%15C=Gp%3LBkM@%Df''-EbT#+Ap&!$FD5Z2F!)lPBl5IE@rHE>+EV%0/0JMG+CT(=.3NbSARlot
DBO%7AKYr5AT_O%/Rr^0ALnr5$=S!sF_t\4Ea`Km@;[2rEbBN3ASuU2+E_R<ATMo8DffZ(Ed)5=
AKY])A8,O^FCeu8+<VduDBO%7BlbD,@<6!2+EV:.+D,>*@;I%q$?B^!F_l.BBlbD+ASH$p+Cf>-
G%G]9ARlotDKKe>A7]CoAS#p*AoD]4@rH7.ASu3nDI[61%13OOIXZ`p%16!EAi^A.6$%-gDf0K1
Bk(Rf+@0gVDfTQ6BPhf5/KcfdA0=<OBln'-DBL>^3B9&J+:SZMARTI!9k@mYEt&IQF^csG=(uJe
D..="/OF#bCb-]#DIY:.$;"/_:*;5B3A`NJ3ArHI0eG*h$4R>?AS*t4$:T2YCgh3iFDl2F+B*E%
E,9*&ASuT4FDi:DBOr;PF*)G@DJsB+@ps0r6#:CHDII#t-o!_B1+<Y>E%s(%+EVNEE%s((%15[*
6;AXW/NGUE2_[!=2E39I%17Q5IXV_5%13OO7;QOPASuU2%13OO0eOSV8jm%n7qHRLEa`c,8jje>
F_tT!EZet4EZf"/G%GP6A79Rk/0K%KD.OhuDIam8PZ/)!1+j\W<+$#3Bl.E(Amo1kDfQt7DBMPo
Ch[<q+Ceu#FEMV<ATJu7ARfLoDIm?$Ao_g,+A+CC0JG+5/0JG@EcP`4E,TW)Bl7Q+FDi9o6k'JZ
/g+OiAS4t\;IO*D+:2"\BlbD2F!+m6@rH7.ATDj+Df-\0@:OCtEZfLGARlp*D]iP.DK]T3F<G+*
B6%QpF!,17FDi92$6UH6+D#P8Bm*p$ASuT4Ea`Km@;^-=+<X`s+Dl7;FD5]1Gp$X/B6%QpF!+q;
+EV:2F!,('@ruX0+EVNEDdmfsBl5%&$6UH6+EV:.+D#P8Bm*p$ASuT4@;]^oAKYQ/E,oN2F(Jl)
Bl5&6@:X(\DK@EQ+AQis+D#_-Ed8dHEc5T2@;TjqDJ(($$6UH6+DbJ(B6@WqAKYYpF!,(;DI[d&
Df0V=FDi:3Df0`0Ec`F5ATW--ASrW2@:X(\DK?q/DIal#AS6$pATKI5$8a@X@!>ub:3CYeFD5Z2
+EM+7Bk;?.@:NeiD09Z'FDl1B-t..++EM+(Df0*,+F#"`0JG17.4u&:2(g"ZG;3J39k@aN+D#A-
DJ*C"Bl@l3De:,6BOr<'Df9M9Ao_g,+EV:.+EM[C/e&.G/g+PG111D_ARTI!F)Pl'EZee.Df&p!
GqKO52_H4\G;EV59k@aN+Dc1<@<*K!DJsB#Cj@WB$90X\@!=G8#u#JZ@<*K!EbBN3ASuT4De:,.
@<?4*F_#&9%15*J+CKCN?jTMFDJ*[*F_#&+De:,#F(8d!A8,po+Du+.AKYo'+Dc1<@<*K/Eaia)
+E)-?FD,5.ARfOjE-,f(+:SZ#+<Ve8F!,=2@<6R3ARloqEc5e;FD,5.D.R-n+D#P8Bl7j6+E(j7
A79Rk/e&.B0J4JUA5I>]6tL"=#u5Vb@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(BlnK.AKYQ/E,oN2
F(Jl)Bl5&(AS6$pATKI5$4R=O$@[GQ%144W+<Wfi-qZlM/Kcf*2)-sF2(9Y$+>Yo51,TLJ+B1*=
4Wm]R<"00W<&5X[+B0gi1(=R"$6V`JB2ieI@:UKD+>YW)1bgjJ1,_!G2)mTT3AWE50-Du/0F\?u
$6XOI+?^i&3B&QM2)$gE+=eQk1c7$H2_Hg>0f1j><$3b80J5%50f^sF1+H6Y+=eQ_<&5XM+>Gi9
1cI6?%145%0d&V%6tL"1Dc1"S.O]Kq.1HUn$6XOJ+?^i'2)d-F1,h-I+=eQj2*!ZW/hf.:1GgR\
+>"]i/het50fC^A.TA/G/KcH@1E\=n1GCL:0JFpb$6XOJ+?^i8AS4t\;IO)c.!IEq%13OO+EoUa
4WlI81bLdH1-%<:.j-Z-2_d<P/iYaJ1H@EE<$3\60J5%53&WcU1+H6Y+=eQ_<&5XM+>l&42)$Hg
$6XOK+?^i8AS4t\;IO)c.!IHr%13OO+EoXb4Wla@/i#@?3ADX,+>c&61,(I90JPLD1H6j`+>"]i
/het82E3HL.TA/G.j-6>1E\=n1GUmE2_ZZi$6XOL+?^i8AS4t\;IO)c.!IKs%13OO+Eo[c4WlI7
2(gR>1c7$2/Kcc.1Gg^=1H%!H0e--F.j-Mu0JG792_[3@<&,RH+=L2F+>4io2)$^<0I[G<+Eo[c
4Wm.(B2ieI@:Ui9G;UfY$4R=b+Enqk+EM77.!INt.OZl'2`*-B.T@NB+>Gf03B8uH%144#G9B$k
G9ACYF(oM?1+F\r1a":kG;UKp+EoOh.4Q_t0eP@6<$3b80f(OD2^o1C+<YkN4Wnqk.j/nIDC@7i
.!IKj.j0$n.4H_p/M](?1a"@m0J5+1<%/7`+<YkN4Wnqk.j/nIDC@7_.Nipm.4Q`"/i"nU+=eQi
0K([8%144#G9B$kG9ACYF(oM?G;:Ts-o!P62BXRo1G1L6<%/7`+<YkN4Wnqk.j/nIDCB]b.4Q`"
/hnhT+=eQn0et0e$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2'=InG;1Nh.j0$k.4Q`#/i"nU+>"]n
0fLNj$6UI8+?^ik+=eRUBl5=S+=\LX1a":kG;Ug!-nR,*1b)HI/Kci/2CT(B+<YkN4Wnqk.j/nI
DC@7i.!IKj.j0$n+>"^[0e"4s+EoRi.O[&,2]s[p0J544<%/7`+<YkN4Wnqk.j/nIDC@7i.!IKj
/Kf6l.3L,`G;Ug!-o!J;+=eQg/hnhT.1HV,+Enqk+EnqY+EM77.!IHi.j0$n.4Q`"/hnhT+=eQm
1FWb?+<YkN4Wnqk.j/nIDCB]d+>"^[1FXe%/MJe3.T@NB+>l,-%144#G9B$kG9ACYF(oM?1+IK'
.4Q`#2]s[p0J5(0<%/7`+<YkN4Wnqk.j/nIDC@7i.!IEh.j0$m+=eRY2'=InG;1Nq.OZu'0e--F
/Kcc+.1HV,+Enqk+Enq[+>Y]+.W]<A-o*8#G;LEm+Eo[l+=eRY1FWb?+<YkN4Wnqk/Kcc*3%Au`
DCB]b+>"]k.X*Tr%144#G9B$kG9ACY0etO7F(oM?1+F\r1a":kG;Ufl/Kf6n.1HV,+Enqk+EnqY
+<WQu.W]<A-o*8r0e!P=+<YkN4Wnqk/Kc/n3@])aDC@7i.!IBg.j0$m+=eRY2(9Y"+EoUj%144#
G9B$kG9AI[+>kl'F(oM?1*A%hG;LEm+EoUa.j0$n.1HV,+Enqk+EnqY+<WL#.W]<A-o*8#G;C?n
+EoOh.1HV,+Enqk+EnqY+<WL!.W]<A-o*8#G;LEo+EoUj+=eRY2(8tA+<YkN4Wnqk/Kc/l3%Au`
DC@7i.!IBg.j0$m+=eRY2(9s`$6UI8+?^ik+>"]Y1GLA#Bl5=S.O]Ks+=eRY1a":kG;Ufu%144#
G9B$kG9ACY+>Pr,F(oM?1+IK(.1HV,+Enqk+EnqY+<WF".W]<A-o*8#G;LEm+Eo[c/Kf6l.3L,`
G;CZW$6UI8+?^ik+=eQW1,^V'Bl5=S.X*]u%144#G9B$kG9AI[+>P]%F(oM?1+F\r1a"@mG;1Nq
%144#G9B$kG9ACY+>PZ$F(oM?1+IK)+=eRY2'=InG;CZW$6UI8+?^ik+=eQW0fCM&Bl5=S.X*Ti
/Kf6n+=eRY2(8tA+<YkN4Wnqk/Kc/j2(EZ]DCB]a+=eRY2(8tA+<YkN4Wnqk/Kc/j1FdH[DCB]b
+=eRY2'=In1+IK&.1HV,+Enqk+Enq[+<WBo.W]<A.!INk/Kf6m.1HV,+Enqk+EnqY+<WBn.W]<A
-o*8#G;C?n+EoXk.1HV,+Enqk+Enq[+<WBm.W]<A-o*8#G;LEm+EoOh+=eRY2'=InG;CZW$6UI8
+?^ik+>"]Y+?1ilBl5=S.O]Kt+=eRY0d%thG;Ufl.j0$l.1HV,+Enqk+EnqY+<Vdc.W]<A-o*8#
G;LEm+Eo[l+=eRY1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DCB]b+>"]k.X*Ti.j0$k.1HV,+Enqk+Enq[
+<Vdc.W]<A-o*8#G;LEm+Eo[l+>"^[1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DC@7iG;13j+>PEj1a":k
G;UfY$6UI8+?^ik+=eQW+>t]jBl5=S.X*Ti.j0$l.1HV,+Enqk+EnqY+<Vdb.W]<A-o*8#G;C?l
+EoXb.j0$n+>"^[0e"O\$6UI8+?^ik+=eQW+>t]jBl5=S.O]Kt+>"^[0e"4q+EoUa.j0$n.1HV,
+Enqk+Enq[+<Vdb.W]<A-o*8#G;13l+EoUj+=eRY2(8tA+<YkN4Wnqk/Kc/Y2C`c^DC@7iG;13j
+Eo[l%144#G9B$kG9ACY+<WNkF(oM?G;C?n+EoRi%144#G9B$kG9AI[+<WNkF(oM?1+F\r1a"@m
G;1Nh.j0$n+>"^[1+<Y>+<YkN4Wnqk/Kc/Y2(EZ]DCB]d+>"]k.X*Tr%144#G9B$kG9AI[+<WNk
F(oM?1+F\r1E\1jG;L`k.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A-o*8#G;C?n+EoOh+=eRY2(8tA
+<YkN4Wnqk.j,rW1b*Q\DC@7i.!IKj/Kf6l.3L,`G;:9k+Eo[l%144#G9B$kG9ACY+<WKjF(oM?
G;C?n+>PEj1ark@+<YkN4Wnqk/Kc/Y1b*Q\DCB]b+>"^[0e!P=+<YkN4Wnqk/Kc/Y1b*Q\DCB]a
+>"]k.X*Tr%144#G9B$kG9AI[+<WKjF(oM?G;1NU$6UI8+?^ik+=eQW+>YKgBl5=S.X*]l.j0$l
.1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;LEm+Eo[c/Kf6n.4G]5+<YkN4Wnqk/Kc/Y1FdH[DCB]b
+>"^[0d&%jG;:TV$6UI8+?^ik+>"]Y+>YKgBl5>C1*A(iG;CZW$6UI8+?^ik+>"]Y+>YKgBl5=S
.O]Kt+=eRY2(9Xu+EoUa/Kf6m.1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;13j+EoXb.j0$n.3L2b
G;:9m+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r1a":kG;Ufl.j-VtG;CZW$6UI8+?^ik+>"]Y
+>YKgBl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6m.1HUn$6UI%:ig>=AS3,K+Enq]+>Yo00JG170J5$g
$6UI?IXZ0WFCB9*Df/orDI7<kCh[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.GC\:3CYeFD5Z2
+A$Gn:L\-SEHPu;Gp#mp+B3#c+@TdVBlJ0.@j!?G8O6?!0f_3I+B)ilBk;>p$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO7WNEa+A-'f+B2ce
DImi9F!,[<@WQ7*AKY2jFEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL>psB.FDu:^
0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@H[/e&-s$<1\M+D,P.Ci=N3DJ()#ChI[,Bln$*
+Cf>,E-686F!,R<AKYl5FCB9*Df-\3DBNk,Ch[m3BlnVCDe:,6BOr;t@r,juFD559+DG^9%16WW
B6%QpF"AGGDfQt/+D5D3ASrV_6r[,.@<-"'D.RU,/g)8Z8TZ(hF!+q#F(Jl)Df-\>BOr:q$7[bj
3%uIH5uf%,BOu+&Gp%$;+AR'$@<?4%DBNA*A0=c]A9DC(Bl@lA.Lc^o$<1\QF!,X7Cis;3BlbD=
BOr;rDfTl0@ruF'DBO%>+CT5.Cj@.FD]j.8AKX]95u&PG@;L't+E(j7FD,5.DdmNsEHPu;Gmt+&
D]it-FCAm$+EV:.+B26=73HMXCh[m3BlnVO+EqOABHU_+FD,6(Eb0?,@ps0rE,oN"Ble!,DBNk0
+MtB;/het6+CT;#+EM+(/e&-s$:/_UBl5&1Df^"C@rH4'F`_28+E2@>B6%EtD/!m#+DbJ(B6@Wq
ATKCFFD,5.FE2).Df0K1ATVs,@j#B+DI[d&Df0V*$7Kt0DCco?Df[HPFCB&<+D#X;@;IPF+DG^9
FD,5.E-#T5A8a&0De*E%BOu3q/0JABF*2>2+ECn$Bjkm%@<-"'D.RU,Et&J!DJWm*F!,CCBOu4.
Bldi.Bl7Hq@psIjA1e;u%15[E+EV:2F!+t$F(HmFFD,5.Anc-kC`mb0F*2;@+DGm>@rH7.ATDm(
A0>T(FDi:4AS6$pATJu+DfQt1Df0`0DJ<["@q@8%$4R>AEckq9:L\-SEHPu;Gp#6m9k@aN+AZH_
BlS90FEnuZ+O64s[1*HP$@[GQ%16!EAi^A.6$%-gDf0K1Bk(Rf+@0gVDfTQ6BPhf5/KcfdA0=<O
Bln'-DBL>^3B9&J%15^=@;[2^AS$"*%15pS@P/d)Bl%U&@;]s76=jtL/0IN%@kJ2t8Q.rN+>>B-
1c$pJ2D$gA/MR\A%16!EAi^A.7<icf@;]LqDfU+G;g!%uCh7HpDKI"CD]j.8AKX9[FE2;;Df'2u
@;I&PCi*Tu@:LE.0f_6L.1HW'0ekC*FDi:@0ekKo$;"/_:*;5B3AWNO0JY4<3%[&u$@[GQ%13OO
7;QOPASuU2%13OO0eOSV8jlWX?jT,?FE2;;Df'2u@;I&Y6m-AiD.7's+D,P4+D5D3ASrW$@<?'6
FD5T'+=L2g.1HV>/g+P$?jTeHD.Oi%@:OCtEZf(6+A-cmBjkm%@qBP"F`M2-F"AGDDfTl0F)Z&8
A8,po+EVNE8jlWX/0JtE@r$"#ARloqEc5e;8hr(S0J5$g$8X:W?pnR=<,YZCA7,^CBPDN1BlbD*
+Cf>-G%G]8Bl@l3Amo1kDfQtCF(Jl)FDi:3Df0`0Ec`F7AS6$pATJu.DKKe>AT;j,G%#2uDKI!1
$6UH6Ea`Km@;^-=+<X`s+Dl7;FD5]1Gp$X/B6%QpF!+q;+EV:2F!,('@ruX0+EVNEDdmfsBl5&8
BOr;tEHPu=@;KLmF<GU4A8,IiF"Rn/1bKnYG@1_PF`_&6Bl@l3F(KB+ATJu&@q0XuF_kK.DfQtD
@<-'j@VfTb$8jFY@!=>5#u+u>DBNM,Df02rFD5Z2+E(j7FD,5.D/X?1+D,Y4D'3q6AKZ&:DCuA*
2D-+[G;<P49k@aN+EMI;@<*K!DJsB#Cj@WB$9'R[@!=D7#u+u>DBNb<DIIQ.@;^"#@;L3A%15'I
+CKCM?jTMLDIIQ.@<-"'D.RU,+E(j7CghF"FEM,*/e&.J/g)9EG;Wb79Q+f]BlnK.AKYo'+CT>$
ASu$mDJ()0De*E%De:,.F`(W.+E):0BlkJ9DBO%7AKVEh+<VdLARfOjE-,f(+CT=6D.R-sF`M&(
+D,Y4D'3q6AKYi$@;[3!EHPu5Dg3CCAftVmFCd'6$8F4e+CJ_KE-"EYB4)$@F`_&6Bl@l3Bl5&)
@r,juFD55nC`mP4DJ*[*F_#&+AU&07ATMp(A0>T(+Co%rEb/g'/e&-s$4R>=F(KK)De!]rAKX9T
B5_g)FD,M6<,WmHDf'H9FCcRoBOr;]F`_&6Bl@l38T#YH@VfauF_PrC+E(j7FD,5.7:U.JE-,f(
%16]cEZee.Gp$a6G%GP68jlWX+@1$\F_t]-F=n"0%17Q5ILQW,<$3;H+=KiM<)atl+>Pc20f:dF
.3L8d1H%*G2%9m8<&,RZ+B0I5+B/dW+B1->4Wm]H.Nh\G%13OO+@KdR<,YZCA0=#X1G1C=0f:sH
2Dm9J3&roX1GU(++>Gi0%13OO+EoO_4Wm.(B2ieI@:Ui91-%9G3&NBG2BXLm1c.'F2E*6C0ekLE
.T@N5/Kc`"0JG4A0f1X8<&,RH+B1-M0fV0M2`)rm$6XOJ+?^i8AS4t\;IO)c-o3_>/i>CC2_lL+
+>Yl83B8]G2)$gC.T@N5+>"]i/het50fC^A.TA/G/Ke"K0/G:90JG10%145%1E\h'6tL"1Dc1"S
.O[#-1bLdH1-%<:.j-Z-2_d<P/iYaJ1H@EE<$3\60J5%53&WcU1+H6Y+=eR61G:UD1,Ua7%145%
1a"q(6tL"1Dc1"S.O[;5/i#@?3ADX!.j-Z.1GUX>/hf"=2)@3A<$3b80J5%51H%3J2(DQ\+=eR6
1G:O>2_m<G.1HV,G;UL++@KdR<,YZCA1Au^1,U[<1c.'F+>"]j3AWKE0f(^C2DH[\+<VdW+>>E%
0JY=@0K:O]1*A(i<&60a2)$^<0I[G<%145%+?^iWDf[=N2(:"'3AN9D2'=Cl3%d3@<%/7`+Enqk
+EnqY+Cf>2-o*8#G;LEo+EoO_.j0$n.4H_p2)d<L+>"]l/hnhT.1HV,G9B$kG9ACY@rHE:1+F\r
1a":kG;Ufu.O[;92]s[p0J544<%/7`+Enqk+EnqY+Cf>2-o*8r2(:"'0J544<$3b83&riF%145%
+?^ik+=eREDf[=N1+=\$2)HF-+>>E&.T@i+$6XO84Wnqk.j/>?F!u5f+=eQi.O]Kt+>"^[0d%th
G;Ufu.O[&-1a"@m0J575<%/7`+Enqk+EnqY+Cf>2.!IHi.j-Ss.!IKj.j0$n.4H_p0eta3/Kc`"
0e--O%145%+?^ik+=eREDf[<^.O]Kt+>"^[0d%thG;Ufl/Kf6m.4Q`"/i+tV+>"]r2(8tA+Enqk
+EnqY+>PW).V!C<-o*8r1a":kG;UfY$6XO84Wnqk/Kcu+.V!C<-o*8#G;LEo+EoOh+=eRY2(8tA
+Enqk+Enq[+>kr)@rHE:1+F\r1a":kG;Ufl/Kf6n.1HV,G9B$kG9AI[1G^LjDf[=N1E\1jG;UfY
$6XO84Wnqk.j-T*.V!C<-o*8#G;13j+EoXb.j0$n.3L2bG;CZW$6XO84Wnqk.j-W'.V!C<.!INk
/Kf6n.1HV,G9B$kG9ACY1,g[mDf[=N1E\1j1+IK)+=eRY2(8tA+Enqk+Enq[+>Pc'@rHE:1+F\r
1a"@mG;CZj.j0$n.1HV,G9B$kG9ACY0fCLkDf[<^.O]Kq+=eRY1a":kG;Ufu%145%+?^ik+=eQh
1FcmQF!rdn.!IHi.j0$m+=eRY2(9s`$6XO84Wnqk/Kcc'.V!C<.!IHi.j-Ss.!IKj/Kf6l+=eRY
2(9s`$6XO84Wnqk/Kcc%.V!C<-o*8r1a":kG;UKp+EoUj%145%+?^ik+>"]q.V!C<-o*8r0d&%j
G;C?l+Eo[l%145%+?^ik+=eQn.V!C<-o*8#G;:9m+EoO_.j0$m+=eRY2(9s`$6XO84Wnqk/Kcu%
@rHE:G;CZW$6XO84Wnqk.j-i%@rHE:G;:9k+Eo[l%145%+?^ik+=eQn.V!C<.!IHi.j0$n+>"]k
.X*Tr%145%+?^ik+=eQm.V!C<.!INk/Kf6m.1HV,G9B$kG9ACY2(E*SF!rdn.!IBg.j0$m.3L2b
G;C?l+Eo[l%145%+?^ik+=eQj.V!C<.!IHi.j-Ss.!IKj.j0$j+=eRY2(9s`$6XO84Wnqk/Kci!
@rHE:G;:9k+>PDpG;LEm+Eo[l.1HV,G9B$kG9ACY1FcmQF!rdn.!IKj.j0$n.3L2bG;:TV$6XO8
4Wnqk.j-Vt@rHE:1+F\r0d%thG;L`k.j0$n.1HV,G9B$kG9AI[1FcmQF!rdn.!IHi.j0$m+=eRY
2'=InG;1Nq%145%+?^ik+>"]l.V!C<.!IHi.j-Ss.!IKj/Kf6l.3L,`G;UfY$6XO84Wnqk.j-Vt
@rHE:1+F\r0d&%jG;CZj.j0$n.1HV,G9B$kG9ACY1FcmQF!rdnG;13j+Eo[l%145%+?^ik+=eQj
.V!C<-o*8#G;LEo+EoOh+=eRY2'=InG;:TV$6XO84Wnqk.j-Vt@rHE:G;UKp+>PEj0e!P=+Enqk
+EnqY+>YKWDf[<^.O]Ks+=eRY1asOt+Eo[l%13OO+Cmo[F$sSP+?^ik+>4in2D?g=0JG0i$6XeH
IW0=BEbTT+F(KGK0ht%f.WBECEbTT+F(KG9F"JsdF(KH9E$018F(KE(F<GOCDe`inF=n"0%16T`
@s)g4ASuT4-XpM*AL@oo%15is/g+tK@:UK.A79Rg06;,LBlmo6%13OO@Us1_F'iWrDe*3<3ZpLF
-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/15%PFE8RIFD5Q4-Qij*De'u"A8,Op?YO7nA7$H`
+>Y-YA0<6I%13OOC2[X(?YO7nA7%J\+DPh*B4#@fDe*3<3ZoejBldj,ATT:/$4R>@5upEG9gr/k
BkhQs?Q_Km+?MV3Ap&3:-OgCl$7BP&De(4<B4Z1*GT](/-ZjDPAnQ-,BkCj&+:SYe$;No?+EM+9
+EMCBE-ZP:EZfLGATAo/AU/>>/Kf(FF*(i2F<F0uFDi:D@;BEsAS,Oc@rr.eF)>i<FDuAE+=D;Q
ATCFTH#k*KATMF)-OgD2FDj]G;cFl$+F?-l/0HYiE+rft+>b3RATT%BEbTT+F(KGnF(KAbAU/>E
.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67FC2[Wq?YO7nA7$l8
+E2@>C1Ums+EM+9F`8^KBldj,ATUpnATCFTH#k_u:-pQUF`V,7CLqd4/n8L+%15is/e&._67sBZ
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
2ENWT<+U,m+B*,qCLoR^+EDRG+FPjb0d("EC`k*GBldj,ATV9,%16$IBkDH;7Q*=_4&fd4F<EnY
F(o,G0d(LYF<DrOBldj,ATV9jF)Y].@;B4kD/X3$-OgDP2`i`U6uQRXD.RU,+@C9lEb0-14#%ju
FEAWQ@WcC$A7$]8C2[Wq?YO7nA7$l8?Y"(b-N                                     ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,^73+>P&o1*A>2+>Pbr2`Mp70H`,*+>G_r3)ECL<*sZ[F(KE(FAPb3<*sZ[F(KE(F<GO@F*&OD
Ec5H!F)u8?Bjl-kDIIBnA7'D"@<-Er1,(I=?Z^O7F`_4T+CfJ9+E(j7:M+3Q@qf@f+A"k!+@BRZ
@;Kjp+EM4-ATT&/DBMM:<F9fh@<,_!DfTW-DJ(SHCiahD/Kf+GAKYf-DJ()&De!a,C3"$0ATMF)
F(KH9E$018F(KE(F<GOCDe`inFE2):ATMF)<HD_l94`BiF`V,7CLqd4                   ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' riseset BOM CR IFACEWORDSriseset OBLIQUITYDMS ROOTWORDSri'
zz=:zz,'seset VMDriseset apply assert cold_iau_named_stars cos ddfrdms delt'
zz=:zz,'aT0 deltaTdy dmsfrdd fdfrhms gT0jd gT0ymd julfrcal meanobliquityT0 '
zz=:zz,'meanobliquityT1 meanobliquityjd0 meansid0 meansidjd0 meansidymd0 nn'
zz=:zz,'th0 nutation_longitude_dPsi nutation_obliquity_ecliptic_dEpsDeg par'
zz=:zz,'se_iau_named_stars parsecsv rjd round sin tabit todate todayno yyyy'
zz=:zz,'mmfd''                                                              '
zz=:407{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*ALu2DR"-Bldj,ATU[6/h1mUF(KE(F<GZW/KePAD/aW>AKZ#-F(HmFFE1f-F(o_=@;]Tu
F(KG9FD5T'F!,C5+A"k!+DtV)ARlp)FCB32/e&._67r]S:-pQUG%G]'@<?4#3Zr-SFCfK)@:Njk
GAhM4.!$gu%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)9HDerrkBjl-kDIIBnA7'D"@<-E3
+>"^GDf0`0Ec`Eq5uf%:FCT,0FDi:3DesQ5DBNJ(@ruF'DIIR2%15is/g)9RARTItBk1sh0H_J\
+<VdL+<VdL+>"^QARTI!F(o/rEb/Zq+EV=7AKYE'+@gH`ASu^+@qZusDfQt8F_kc#DBNIuGp"M\
.3N>B+Co%rEb/g'%15is/g)9RARTItBk2L+A2#,K+<VdL+<VdL+>"^QARTI!F(o/rEb/Zq+EV=7
AKYE'+@gH`ASu^+@qZusDfQt'9gg+<DBNJ$B6%QpEt&IO67sB'E+*d.ARB.[F^K#pD.R6bF*(i2
F!*%W8O6?!DIIBnA0>r8@<*K,BleA=FDi:2FCT,0BOtU_ATAo8@:F%a%15is/e&._67sBjEb/[$
ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$                         ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3$9pu1*ALu1c'/dF(KE(FE2):ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+A"k!+DtV)ARlp)FCB32~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&u+>P]/2KEMQATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
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
9jr'XA8c[0+Eh=:F(oQ1F!,C5+B2ceDImi9F!+n-B5_g)FD,N4+CT;%+EMXCEb/c(Bl5%AAp&3:
.3N\CANC8-%14gB+CK)0FCB9*Df/orDI73uDJ*[*F_#&jA5I>]?Ys=]%13OO1+j\WDKU&0FD5Z2
?YOCbDdmNsEHPu;H!bK%?Y*_`BlJ0.@p`b8E-"EYB4#Ld?k!GP$4R>1AScHs+B0I3cBM9W+DGm>
@rH4'F`_2*+E_a>DJ()2Des]:Df'2sC`m;6E,oN2F(oQ1F!+q;+@U?jAStpl+CT.u+AHEYF`T)V
F(JoD%13OO>A/,#E-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=
/nf?DCgAH&FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci0JkCq
FDYhC%13OO5p1#QEbf3(GA\OHATDj+Df-\9Afu2/AKXBPCij).<$3U7PZ0(S@;KRpEbTW/D'3P6
+DG^9-t[UDF"&5QAS!n3$4R=s/g+P>@<5jaE,TQ<DJsB+@;K:^G]7\7F)u&6DKB/sDfT2qAScHs
?Z]XlA7,iR%13OO=`8F*@ps6tA8-+(CghT3FD,5.D..I#A8c[0+ED%*ATD@"@qB0n@:F.tF<GdA
FD)e=BOr;Y:IH=:G]7\7F)u&6DE846%17Q5IXWDd+>.COI16O"Ddd0!-YI".ATD3q05>E9-OgE$
A0<rp-Y@LCF!,UIBl%i<%14p7A8-+(+?L]o/jLgA-=h"1.4-Z2+=D&LFCB9*Df/o04""oSF(&E'
%17Q5IXWCK$4R>IF*1r5ARfgrDf0o,FCf]=FEDkMBldj,ATW>C8T&W]Eb8`iAUP!p%17Q5IXWDd
+>.COI16N++E1b0F(J]m@<Gpp@;TRd?ZU<tEcW?G+<Ve%67sBjDf0`0Ec`Eq5uf%:FCT,0FDi:3
DesQ5DBNJ(@ruF'DIIR2+<VdL+<VdL+<VdL+<VdL+:SZ#+Cf>+A7'%ZF^K#pD.R6bF*(i2F!)SJ
+<Ve%67sBP5uf%F@;TRd+EMX5EZf14F*&OHD]iM2@r*9$ART+\EZfI4@VfTu+<VdL+<V+#IXZ`p
%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13                ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' riseset riseset_espenak_smoke riseset_meeus_smoke riseset'
zz=:zz,'_tanner_smoke''                                                     '
zz=:81{.zz
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
1E\P#-p0UR/mg=U-QkuM5sn(B:JsSZEbTT+F(KG9:I7`H;,p1e=[Yt_+Au!2<*)jn6rS,?F(KE(
F<FUY6um!_ATMF)+Cf>+A7'%ZF^K#pD.R6bF*(i2F!,")Cij)b0Han;Cij)bA9f;0A7fjqD0$h4
<%r&t+D4Y-H#7(7D.R-nDdmNsEHPu;GuQI?D.R-nDdmNsEHPu;GuQL@D.R-nDdmNsEHPu;H"pkD
+Dk[uDKBN&0Hb4D@;^.#A85X/+Dk[uDKBN&H#7(G+Du(=BJ:QHF`_&6Bl@lrCi=3(BlnK.ARAtE
F(lb7F`_&6Bl@lrDdmNsEHPu;H!b,mCh[j1Bk(L\7<!<9AS3-)@<-F#?YNqk?Z':hARo.hFCB32
+ED1;ATMF)?YEkhBOkOnAT`$0+ED4-+EVO4@<?''FDk\uH#@OCH$O[\D/Elq-RgSp4?P\X?SNZN
+C]J-Ch-mnBldj,ATT&(F_PZ&?ZKk%ATMF)?Y"(b+ED1;ATMF)?Y+:tAStpl?ZU(&CLnW/Bldj,
ATV9rAS$"*?ZU(&CLnW/Bldj,ATV:$@;]soEaNm)Deio3.4cl0/3G;#Bldj,ATT:K/1<V34=>/`
F(KE(F=/Lg-p0UR/mg=U-Ql5];cI+EBldj,ATT&/@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmMDIITp
?Y!_aFCANu?Ys<rDIITp?Z9q"H#@P;BjkgbAU&07ATMp,Df0W'AoD]sA7]S!@:++`D.Fc,F`_&6
Bl@lrBl79oDf03%FEM,*?XuuSBjY^f+Du=D@<?4%DI7*q?Z0CiBlS90FEq53Am]+ZCh[j1Bk(L\
7<!<9AS5@eA0>i3C3"$0ATMF)+ED1;ATMF)<HD_l94`Bi-RgSp4>J$72'aq21,CU?0KCaB3&iZQ
3&NHO1*A>+1,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?0KCaC0eb@>
2)[-D2BXb/1,CU?0K:[B0JYID2E<HN1E\G,1,CU?0fCX@2DI!C3&ETO0d&5*1,CU?0fL^A1-%$K
1H@<N3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU?0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN
2)6jG1*A>+1,CU?0f:R?1bppC0K(gC2]sk01,CU?0fCX@0Jk^D1c@9N1*A>+1,CU?0f:R?1b^XA
2)[9M2]sk01,CU?0eb4;3AW?F1G^jD2BXb/1,CU?0KCaE0eb=?2`EWP2BXb/1,CU?0eb4<0JG17
3&`cQ2'=Y.1,CU?0eb4;1c70J2)-gB+>PW+1GCU>0eP@E2Dm9N1GLdD+>PW+1GCU>1G1O@1,_*O
0JbID+>PW+1GCU=2(gdE0fUmG2D[*H+>PW+1GCU=3A*0D0JPIB3&<NM+>PW+1GCU=3A*3K3A`WM
0JY@?+>PW+1GCU>1bLUA3AWQI2DR*31,(I>0JbF?/i5@A0ek@?3Ai`<1,(I>0JbF@/i5IA0etL>
2)dK;1,(I>0JbF;/iGCC0f_'J0f:[.1,(I>0JbFA/i57:3&!?I0K1j31,(I>0JbFA/i5=B2)dBJ
0K:g11,(I>0JbFC/iPXI2E*EG0K:p41,(I>0JbF=/i>C=0f1jD1c.*51,(I>0JbFC/iPXI2DQsB
2)ud70JYF<1GLg@1bq'F3AWZQ2E;m80JYF<1GLR91c@6L1H@BR0f:(/0JYF<1GCgA2E<WP2_[-H
2`Dj70JYF<1GCgA2E<KL3&NHF3AM^40JYF<1GLd?1b^[F3AE6H3&2U30JYF<1GLd?1bpsK1H@HM
2`W!90JYF<1GLd?1bpmJ3&<HH3Ahp70JYF<1GLR92*!TR3&ETT2`2^50JYF<1GLR92*!TU3&<6F
1H$@20JYF<1GLR92D?sD2)7'L2Du[50JYF<1GLR92)I0K1c7!B1a"P-1,CU?0f(F>2E3KN0ekLA
2'=Y.1,CU?0f1L?2E3WO1GUX@1*A>+1,CU?0fCX@1Gq'M2_d9O0d&5*1,CU?0fUdE2)mKQ1H%0P
0d&5*1,CU?0KCaD2`W]Q1GCR=2'=Y.1,CU?0f1L>2D[?R0JG:@1a"P-1,CU?0f1L>2D[6G2_d3I
2BXb/1,CU?0f:R?2`!9G1-%$E2CU1*4>J$:,Vh&/1GCU=3A*0D1GCgK1b^^F+>PW+1GCU=3A*-K
2_d0M1c[<H+>PW+1GCU>3%d!I1,L[C0JtXG+>PW+1GCU>1+kCA2DI0H0fM!51,(I>0JbF=/i5LD
1c76L1,^m11,(I>0JbCC/i>F?1G^dF0fV!41,(I>0JbCC/i>FD0f1^B3AN<31,(I>0JbFC/iGF?
1Gq!F2)-p11,(I>0JbFC/i5=<1,(C93&*?71,(I>0JbFC/i5=;0JbOB1c76A/1<V90JYF<1GCd@
2)I$C1,V!I1,URB/ibmG3&ifN2`NQM2)%!E0fUXs/i"P(.4cl01,(I>0JbF=/i5LH3AE<L0K(a<
2(gmE3AE9L1,1R=3A`ZL0f(:n/i"P(.4cl01*AP%1,(I>0JbCC/i5OI1,q6P0JkR.1,(I>0JbC=
/iGUF1b^jG0JP=*1,(I>0JbFC/i5FD0ebRD0JYL.1,(I>0JbF?/iPI?1,CU<2E3E61,(I>0JbF<
/iGXB0JPL@0f_*61,(I>0JbF</iGXJ1bpgA1Gp:10JYF<1GLR91b^jD0ekUA1Gp:10JYF<1GLR9
1b^gE2E*TU1,9t-0JYF<1GLjA2`3QQ2`!-A3&Mg60JYF<1GC^>2_['B0f(dF0f^@30JYF<1GLjA
1c70G0K:mC1,U100JYF<1GLd?1c7$F1,V!G3Ahp70JYF<1GLU:2E*<D0fLgA3Ahp70JYF<1GLU:
2E*TP1,:U@2'=Y.1,CU?0f1L?1GgpG2_m6J1*A>+1,CU?0fUdB0f1dD2_ZsD2CU1*4>838-p014
/1<V7.4cl00I\P80E                                                         ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
