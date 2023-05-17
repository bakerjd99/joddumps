NB. sha256:6832df64fbce98894ec34aa688a9fd1d49bfff35573a8a43401d36ccfc4e752b
NB. JOD dictionary dump: 17 May 2023 09:13:15
NB. Generated with JOD version; 1.0.26 - dev; 3; 03 May 2023 09:42:45
NB. J version: j9.5.0-beta2/j64avx2/windows/commercial/www.jsoftware.com/2023-05-02T22:44:50/clang-15-0-7/SLEEF=1
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


DARKTRS=:60

DAYSECS=:86400

IFACEWORDSriseset=:<;._1 ' baby_today fmt_today iau_today loadstars nav_today navdaylist riseset'

J2000ymfd=:2000 1 1.5

JULIAN=:2460030.5

LIMITHORZ=:20

LIMITMAG=:3.

LOCATIONNAME=:'Meridian'

OBLIQUITYDMS=:23 26 21.4480000000000004

OBLIQUITYDMS2000=:23 26 21.4480000000000004

OBSLOCATION=:_116.375956000000002 43.6467749999999981

ROOTWORDSriseset=:<;._1 ' IFACEWORDSriseset ROOTWORDSriseset VMDriseset baby_today fmt_today iau_today location_uluru location_yellowstone navdaylist'

STDALTITUDE=:0.566699999999999982

UTCOFFSET=:6

VMDriseset=:'0.9.82';10;'17 May 2023 09:08:23'

riseset_hashdateurl=:<;._1 '|925722d8814c2866359a2e0e5c63604216f326859914f4ca8121f12ace5ce07a|17 May 2023 09:08:23|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

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
(-yl0{r) (yl0)} r
)

atan2b=:[: dfr 12 o. [: j./"1 |:

baby_today=:3 : 0

NB.*baby_today v-- named Babylonian stars rising/setting today.
NB.
NB. monad:  (bt ; clLoc ; itRs ; flParms) =. baby_today uuIgnore

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) baby_today y
:
NB. star data
({."1 IAU)=. {:"1 IAU [ 'IAU NAV'=. loadstars 0
bs=. babylonian_named_stars 0 

NB. !(*)=. IAU_Name Designation
'Rs lName sRs cParms'=. x today_calc }. 0 {"1 bs
NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;sRs;cParms
)

babylonian_named_stars=:3 : 0

NB.*babylonian_named_stars v-- identified Babylonian stars approx
NB. 1500 BCE.
NB.
NB. Stars with  modern  names identified from  ancient Babylonian
NB. tablets. Most stars will be shining long  after we  are gone.
NB. It's fun to seek out  stars that the ancients found important
NB. enough to catalog.  Source data comes  from a spreadsheet TAB
NB. here:
NB.
NB. https://www.iau.org/public/themes/naming_stars/
NB.
NB. monad:  bt=. babylonian_named_stars uuIgnore

NB. load babylonian stars !(*)=. HIP IAU_Name jpath
bs=. parsebomcsv read jpath '~addons/jacks/testdata/babylonian_normal_stars.csv'

NB. cross reference with current names
(0 {"1 ciau)=. 1 {"1 ciau [ 'ciau cnavs'=. loadstars 0
bs=. bs #~ 1,HIP e.~ }. 0 {"1 bs
ix=. HIP i. }. 0{"1 bs
bs=. ('IAU_Name';ix{IAU_Name) ,. bs

NB. remove columns without names
bs #"1~ ] 0 < #&> 0 { bs
)

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
p1=. c i. ;:'IAU_Name Designation HIP Bayer_Name'  
c ,. (<"1 ] p1 { t) , <"1 d
)

darktransits=:4 : 0

NB.*darktransits v-- mask selecting transits before and after sunset.
NB.
NB. dyad:  pl =. itHrmn darktransits (itSrs ; iaMins)
NB.
NB.   'Riseset Location cParms'=. (location_yellowstone~ 1935 7 6) nav_today 0
NB.   srs=. localsun 1935 7 6
NB.   (>{:"1 Riseset) darktransits srs;60   

NB. sun rise/set in day minutes - dark minutes
'srs bam'=. y

if.     (NORISESET,1) -: 0{srs do. 0 #~ #x  NB. sun is always up 
elseif. (NORISESET,0) -: 0{srs do. 1 #~ #x  NB. sun is always down
elseif. do.

  NB. transit times in day minutes and before/after set minutes
  rs=. dmfrhm x [ 'sr ss'=. dmfrhm srs

  NB. transits occurring when sufficently dark
  (rs < 0 >. sr - bam) +. rs > 1440 <. ss + bam 
end.
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

dmfrhm=:[: +/"1 [: ] 60 1 *"1 ]

dsfrhms=:24 60 60&#:^:_1

fdfrhms=:24 %~ (60"_ #. ]) % 3600"_

fmt_today=:3 : 0

NB.*fmt_today v-- format today verbs result.
NB.
NB. monad:  cl =. fmt_today (bt ; cl ; fl)
NB.
NB.   fmt_today nav_today 0
NB.   fmt_today (location_yellowstone~ 1935 7 6) iau_today 0

'Rs lName sRs cParms'=. y

NB. calc parameters
hdr=. <;._1' Location Sunrise Sunset Mag-Lim Above-Horz Dusk-Min Julian ΔT Longitude Latitude Year Month Day.dd UTCz'  
cParms=. ctl ": <(rjust lName , (":sRs) , ": ,. cParms) ,. ' ' ,. >hdr

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
NB. monad:  (bt ; clLoc ; itSrs ; flParms) =. iau_today uuIgnore
NB.
NB.   iau_today 0
NB.
NB. dyad:  (bt ; clLoc ; itSrs ; flParms) =. blYmd_LB_U0_LMAG_LHORZ_LOC iau_today uuIgnore
NB.
NB.   'Riseset Location sRs cParms'=. (location_yellowstone~ 1935 7 6) iau_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) iau_today y
:
NB. date, julian, location, UTC timezone, magnitude, horizon, location, dusk mins
'YMD JD LB UO LMAG LHORZ LOCNAME DARK'=. x

NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. brighter magnitude limit !(*)=. Vmag IAU_Name Designation
'Rs lName sRs cParms'=. x today_calc (LMAG > Vmag) # IAU_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;sRs;cParms
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

localsun=:3 : 0

NB.*localsun v-- location sun rise/set times in hour minutes.
NB.
NB. monad:  itRs =. localsun blLB_UO_YMD
NB.
NB.   localsun OBSLOCATION;UTCOFFSET;6!:0 ''

'LB UO YMD'=. y
_2 ]\ ,sunriseset1 (|.LB),UO,1 |. 3 {. YMD
)

location_far_north=:3 : 0

NB.*location_far_north v-- set parameters for far north test location.
NB.
NB. monad:  bl =. location_far_north uuIgnore
NB.
NB.   location_far_north 0 
NB.   NB. uses location with current date 
NB.   fmt_today iau_today 0      
NB.
NB. dyad:  bl =. flYmfd location_far_north uuIgnore
NB.
NB.   NB. uses location with home date
NB.   fmt_today (location_far_north 0) iau_today 0
NB.   (location_far_north 0) nav_today 0
NB.
NB.   NB. arbitrary dates for location
NB.   fmt_today (1712 3 15.34 location_far_north 0) nav_today 0
NB.   fmt_today (location_far_north~ 1933 9 25.75) iau_today 0

NB. test date https://www.almanac.com/astronomy/bright-stars/zipcode/83646/2023-03-27
1995 6 30 location_far_north y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: 0 80  

LOCATIONNAME_riseset_=: 'Far North - prime meridian'

UTCOFFSET_riseset_=: 0.0   NB. prime meridian time zone
LIMITMAG_riseset_=:  10.0  NB. stellar magnitude
LIMITHORZ_riseset_=: 2     NB. degrees above horizon
DARKTRS_riseset_=: 30      NB. minutes before and after sunset (0=ignore sun)

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS
)

location_far_south=:3 : 0

NB.*location_far_south v-- set parameters for far south test location.
NB.
NB. monad:  bl =. location_far_south uuIgnore
NB.
NB.   location_far_south 0 
NB.   NB. uses location with current date 
NB.   fmt_today iau_today 0      
NB.
NB. dyad:  bl =. flYmfd location_far_south uuIgnore
NB.
NB.   NB. uses location with home date
NB.   fmt_today (location_far_south 0) iau_today 0
NB.   (location_far_south 0) nav_today 0
NB.
NB.   NB. arbitrary dates for location
NB.   fmt_today (1712 3 15.34 location_far_south 0) nav_today 0
NB.   fmt_today (location_far_south~ 1933 9 25.75) iau_today 0

NB. test date https://www.almanac.com/astronomy/bright-stars/zipcode/83646/2023-03-27
1995 6 30 location_far_south y
:
JULIAN_riseset_=: julfrcal ymd=. x

NB. longitude, latitude with standard signs 
OBSLOCATION_riseset_=: 0 _80  

LOCATIONNAME_riseset_=: 'Far South - prime meridian'

UTCOFFSET_riseset_=: 0.0   NB. prime meridian time zone
LIMITMAG_riseset_=:  10.0  NB. stellar magnitude
LIMITHORZ_riseset_=: 2     NB. degrees above horizon
DARKTRS_riseset_=: 30      NB. minutes before and after sunset (0=ignore sun)

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS
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
DARKTRS_riseset_=: 60      NB. minutes before and after sunset (0=ignore sun)

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS
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

UTCOFFSET_riseset_=: _9.5  NB. time zone
LIMITMAG_riseset_=: 6.0    NB. stellar magnitude
LIMITHORZ_riseset_=: 5     NB. degrees above horizon
DARKTRS_riseset_=: 0       NB. minutes before and after sunset (0=ignore sun)

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS
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
DARKTRS_riseset_=: 0       NB. minutes before and after sunset (0=ignore sun)

ymd;JULIAN;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS
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
NB. monad:  (bt ; clLoc ; itSrs; flParms) =. nav_today uuIgnore
NB.
NB.   nav_today 0
NB.
NB. dyad:  (bt ; clLoc ; itSrs; flParms) =. blYmd_LB_U0_LMAG_LHORZ_LOC nav_today uuIgnore
NB.
NB.   'Riseset Location sRs cParms'=. (location_yellowstone~ 1935 7 6) nav_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) nav_today y
:
NB. star data
'IAU NAV'=. loadstars 0
({."1 NAV)=. {:"1 NAV [ ({."1 IAU)=. {:"1 IAU

NB. !(*)=. Nav_Star_Name IAU_Name Designation
'Rs lName sRs cParms'=. x today_calc Nav_Star_Name

NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;sRs;cParms
)

navdaylist=:3 : 0

NB.*navdaylist v--  sky safari  6_0  observing  list  of  today's navigation stars.
NB.
NB. The files created by  this  verb can  be loaded into the  Sky
NB. Safari iOS and Mac apps.
NB.
NB. monad:  cl =. navdaylist uuIgnore
NB.
NB.   navhome=. navdaylist 0
NB.   navhome write jpath '~JODIMEX/Navigation_Stars_Home.skylist'

NB. j profile !(*)=. jpath
skl=. read jpath'~addons/jacks/testdata/Navigation_Stars.skylist'
'st loc cParms'=. nav_today 0 [ location_home 0

NB. skylist header
cst=. 'SortedBy=Default Order'
hdr=. cst ((,&LF)@[ ,~ beforestr) skl

NB. cut skylist objects
sob=. (] <;.1~ 'SkyObject=BeginObject' E. ]) cst afterstr skl

NB. retain objects that match star and hdr names
b=. +./ (0 {"1 st) +./@E.&>"0 1 sob
sob=. sob #~ b *. +./ (1 {"1 st) +./@E.&>"0 1 sob

NB. reset sort order
sob=. ];._2 tlf ;sob
ix=. I. +./"1 (,:'DefaultIndex=') E. sob
ns=. '='&beforestr"1 ix{sob
ns=. ns ,. '=' ,. ljust ": ,. i. #ns
hdr,ctl >(<"1 ns) (ix)} <"1 sob
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

NB.*parse_iau_named_stars v-- IAU named star  list to btcl header
NB. table.
NB.
NB. Original star name data was downloaded from:
NB.
NB. https://www.iau.org/public/themes/naming_stars/
NB.
NB. and slightly adjusted  in Excel and saved as a Unicode  UTF-8
NB. CSV export.
NB.
NB. monad:  btcl =. parse_iau_named_stars clTxt
NB.
NB.   NB. get stars
NB.   iau=. read jpath '~addons/jacks/testdata/iau_named_stars_2022.txt'
NB.   parse_iau_named_stars iau

NB. parse utf8 csv
t=. parsebomcsv y

NB. extract relevant columns
c=. ;:'IAU_Name Designation HIP Bayer_Name Vmag RA_J2000 Dec_J2000'
t=. t {"1~ (0 { t) i. c

NB. scrub objects with questionable magnitude
t #~ _ ~: _999&".&> (c i. <'Vmag') {"1 t
)

parsebomcsv=:[: parsecsv [: utf8 ] }.~ 0 3 { ~ (239 187 191{a.) -: 3 {. ]

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

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


rjd=:9.9999999999999998e_13&round

sunriseset1=:3 : 0

NB.*sunriseset1 v-- computes sun  rise and set  times - see group
NB. documentation.
NB.
NB. This verb has  been adapted from a BASIC program submitted by
NB. James Brimhall to *Sky &  Telescope's* "shortest  sunrise/set
NB. program"  contest. Winning entries were  listed in the  March
NB. 1995 Astronomical Computing column.
NB.
NB. monad:  itHM =. sunriseset1 flBLHMDY | ftBHMDY
NB.
NB.   NB. rise and set times observer location today
NB.   td=. (|.OBSLOCATION) , UTCOFFSET, 1 |. 3 {. 6!:0 ''
NB.   sunriseset1 td
NB.
NB.   NB. rise and set times on June 30 1995 on Greenwich meridian
NB.   t0=.   0 0 0 6 30 1995  NB. equator
NB.   t1=.  49 0 0 6 30 1995  NB. north - lat of western US/Canada border
NB.   t2=. _47 0 0 6 30 1995  NB. south - southern Chile and Argentina
NB.   t3=.  75 0 0 6 30 1995  NB. far north (sun always up)
NB.   t4=. _75 0 0 6 30 1995  NB. far south (sun always down)

NB. latitude, longitude, time-zone, month, day, year !(*)=. la lo tz m d y
y=. # la [ 'la lo tz m d y'=. |: tabit y
dr=. 1r180p1 [ dd=. 360 % 365.25636 [ rt=. 50r60

NB. days into year with leap year adjustment
dm=. 0 31 59 90 120 151 181 212 243 273 304 334
dl=. (2 {. dm) , >: 2 }. dm
bl=. 0 = 4 | y [ m=. <: m
dy=. d + ((-.bl) * m { dm) + bl * m { dl
dy=. 0.5 + dy - lo % 360

NB. (th) angle Earth has moved since winter solstice
th=. 9.357001 + (dd * dy) + 1.914 * sin dr * (dd * dy) - 3.97
c3=. 0.3978 * cos dr * th
dc=. (- % dr) * arctan c3 % %: 1 - c3 ^ 2

NB. adjust for positive and negative latitudes
bl=. la < 0
a1=. ((-.bl) * (90 - la) + dc) + bl * (90 + la) - dc
a2=. ((-.bl) * (la - 90) + dc) + bl * (_90 - la) - dc

NB. sun never rises or sets masks
nvset =. a2 >: - rt [ nvrise=. a1 < - rt

NB. corrections
drla=. dr * la   [ drdc=. dr * dc
c1=. ((sin - dr * rt) - (sin drdc) * sin drla) % (cos drdc) * cos drla
t2=. dr %~ arctan (%: 1 - c1 ^ 2) % c1
t1=. 360 - t2 [ bl=. c1 < 0
t2=. (t2 * -.bl) + bl * 180 + t2
t1=. (t1 * -.bl) + bl * 360 - t2

NB. first order equation of time
et=. 0.1511 * sin dr * 17.86 + 2 * dddy=. dd * dy
et=. (_0.1276 * sin dr * dddy - 3.97) - et
drla=. drdc=. dddy=. 0

NB. time zone adjusted rise and set times
tr=. (t1 % 15) - 12 [ ts=. t2 % 15
tr=. tr - et [ ts=. ts - et
s=. ts + tc [ r=.tr + tc [ tc=.(-tz) - lo % 15
hrmn=. (<. r) ,: 1 round 60 * 1|r
hrmn=. hrmn , (<.12 + s) ,: 1 round 60 * 1|s

NB. adjust for when sun never rises or sets
hrmn=. hrmn *"1 -. bl [ bl=. nvset +. nvrise
hrmn=. NORISESET (<0;bl # pos) } hrmn [ pos=. i. {: $ hrmn
1 (<1;nvset # pos) } hrmn
)

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
NB.   'Riseset lName sRs cParms'=. (location_uluru 0) today_calc stars

NB. date, julian, location, UTC timezone, magnitude, horizon, dusk minutes
'YMD JD LB UO LMAG LHORZ LOCNAME DARK'=. x

'Rsiau cParms'=. (YMD;UO;LB) riseset y [ srs=. localsun LB;UO;YMD

NB. retain rising setting - circumpolar NIMP
Rsiau=. Rsiau #~ -. ; 1 {"1 Rsiau

NB. name ,. transit altitude, hour minutes 
ahm=. 1&{&.> 2 {"1 Rsiau
Rsiau=. (0 {"1 Rsiau) ,. (0 {&.> ahm) ,. (<2 3){&.> ahm

NB. retain above local horizon
Rsiau=. Rsiau #~ LHORZ < 0&{&> 1 {"1 Rsiau

NB. retain stars transiting when dark 
if. 0<DARK do. Rsiau=. Rsiau #~ (>{:"1 Rsiau) darktransits srs;DARK end.

NB. sort by transit time
(LOCNAME;srs;LMAG,LHORZ,DARK,cParms) ;~ Rsiau {~ /: >2 {"1 Rsiau
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
1H@E;2_lL2+?(E"2BXq$0f:(.2]sq3+?:Q'0d&@s0f^@:+>Pbr3$9q8+>GVo1H-F21*AJ5+>Gbs
2`2^40d&>0+>Gbs1bg+-0d&D1+?:Q"3?U%1+>Po!2]t"<+>GPm1c-=8+?2%t0eje03?U1%2)$.2
+>u5&0ea_,1E\G.+>bks1,'h,2]sh1+>c#"3$:.<+?(Du3?U:(2)ZR8+>l#!2]t%9+?(E#0H`@u
1,U13+?);'2BXq5+>t?#1E\Y"2`)X9+?)"t3?U+9+>GSn1GL"1+>Yu"3?U(5+?1K#1E\D3+>bhr
0fU:41*A;-+>Yhs0f1"/1E\G,+>bbp0f:(12'=V2+>c&#0fC.30d&Fu1cQU40H`8.+>GSn2)$.5
+>bks0ea_-2]st#2DZI5+>ttt1a"V8+>P_q2DH=12'=e5+>PYo1b^%,0d&;0+?(E!1E\D-+>Yer
0f^@53?U+#1,C%-0d&>4+>t>u1E\D++>Ynu2]sq9+?1K#2'=k$2)%Ea;G0te;f-5dF`_29+C\no
DfTD3@;]Tu@:jUmEZfFGDKBB2+=Jp,BkM=%Eb-A7F`&Wr6!7,T6W8&;@rH6qF!,F5EZen$GtCIk
6Ub'P;FFH(Bldj,ATVX(FCfK)@:NjkGAhM4F!)l&7R9C1=&2^^;fZSnATMF).3N8DDfp"k1,(C9
H#7/(AT2QtBHTo&0JG150HbXP@<*nAD/X<6BIk9<Ea`I"Bl@ltC`m7sGrd''1c7!F1c6C=+DQ%8
Ao_BiC`l>*0JG2+D.[<N<D5tM:1JEeEb0-1+A-cmBjkm%A79Rk9M%rM<(Ke_>%hhpBmO]8+Dbb/
BlkJ3DBNJ$B6%QpF%f/"8Q8DM7r2mVBln',B-;&"B5VF*F_#&W:I@EI8P`)V5tsdC@;TR/A7]gl
EbTK7Bl@l3De:,1@WQ+$G%G\:Ci<flFD5Z2:I7`H;,p1e=[Yt_@;p1+Dg5u5@<?''DdmNsEHPu;
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
F!*%WF(Jo*-t.4+DDEYM@:FLhFDk\uH#@&-ARloM@:FLuDf08tDBO"B@<-E3EbTT/DJ(VDATW$.
DJ()6De*:%@UW_kCi=3*@;]Fi@;TRd?ZU<tEcYr*ASuU(Anbge+@9LGH#.D:Bjkm%F*(i2F!+n1
E,olA+>G`-0H`\L7:U7PA7'%ZF^K#pD.R6bF*(i2F(9-+G%G]9+A"k!+C]G&C`mh<+Cf>+F_u"=
A8,OqBl@ltEd;2(Ebfc;@;^.#FE;;-F))n>ASbpfFD5W*+EVX4DKBN6F!+q'AoD^$+CT.u+CSl(
ATAo7F`)83FC\p'Ao_R%F(AilBl.9p+EM+(Df0*,+D,Y4D'3M1F`MOS+Dkh1F"AGTARfd(/KebF
Fs&2HD0'<0A7Ta13ZqsDF(TH+D0$gU+>GVo0ek:@0P"a2FCA-&A9i'$D/!KgC`mh6D.Oj8PZ/c>
DBO"3@rH6qF(AiuFCA-ZH":K&FC?<;PZ/c9ARfFk@;I'3ARTU?+Co&"FCA-ZGp"jr1,C%/+>GVo
/1r&"3Aif>0esk+0k>-5EbK<#@<iu4Bl8'8ATJu+Ec5e;BQ&$6+Dkh1F`_1;FD5T'3ZqsMAo_R%
+>t?"0d&#.+>PVn1HAueAo_R%F(AilBl.9p+EM+(Df0*,+D,Y4D'3M1F`MOS+Dkh1F"AGTARfd(
/KebFFs&2HD0'<0A901\+CoP*EbK<2+>Y,p1*A;+/ibUtA7fjqD0'<0@:OCnDf0!"+Cno++D,Y4
D'3M/F#kEt/iYOC1,U1;+D,.rEbK<2+>Gl!1,0n*Ao2WsFDk\uH"Lu8D..N/FDk\uGp%9AEaj)4
Eb0<7Cij;h0PY-1Ea`I"Bl@ltC`m5!DKL#ABk;?.Ao_g,+D#M1@qZuW1,(C9+AHEYF`S[EB.b;d
1HHXk<%r&t+DQ%8Ao_BiC`kGm2)cX40H`2)3&,&F0R7MGAo_<iFD5Z2@;I&rASuU4EbT*++D,Y4
D'3D/De!H'8hr(S0Ha)$AT`&:E+^dG3&<T<B2gR1D.FbD3Ai`<0ea_,/iYS!D.[g!F(fK7EcWcS
D/!m1FCfM9Ao_g,+Co%nBl.9p+EM+(Df0*,3Zr*QAo_F'+CoP*EbK<2+>PVn1,g=41G1F=BPhg&
Eb&^%+D>\9EcWcSD/!m//0K"F@ric)Ec5e;A7]7bD..6'F(Ji(/Kf<]4<QUA1b^UE+Co#(Ao_R%
F!,.5F(TH'A9/kP1,1R;1c8r`F(TH'F(fK7EcWcSD/!m//0K"F@ric)Ec5e;A7]7bD..6'F(Ji(
/Kf<]4<QUA1b^UE+CoP*EbK<2+D>V5Ao_F'+?)&11G1LABjl-kFDk\uH#@&-ARloT5uf%KFCB32
+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH"g]0?Z^4(BkM+$DIIBnA0=H0<?Q@)@<-E3G%l#3@VfTuFDl&2
B4uC$DKKnTE+s33ATDa.CghEs+EV:;AS!!-@;L'tF!*%WD.R:$F!,F7+>PfjDdd0tFCB32Ci<`m
F!,L;F(KE(F<GXH@<*K$@<>poDe!3lF*2A:De!3tBl@l3F*2@CEbTT+06:]H+EV=7ATJu.DBNV2
F`JUABl8'8ATM[+@psInDf/oo@<,^mDfTr5F(KG9E+*cqD.Rg#EcW@8DfQt4@<*K.DfTr5+EV19
F<GC<@psInDf0B0@psInDf/oo@<,^rDfp/8F(KG9E+*cqD.Rg#EcW@8DfQt4@<*K3Dfp/8+EV19
F<GC<@psInDf0B0@psInDf/oqDf'',ATT&6@<,dnATVL(F!,(5EZcQ>Df'&0+Dbt+@<?4%DJX6$
@<?4%DI7O&F`MVGATT&6@<,dnATVL(F!,(5EZe@uF`MUICi<flFD5Z2Ci<flFD5Z2?[64!Ci=N=
FDl&.F(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<flFD5Z2D.R-nDdmNsEHPu;GuQJ7
ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"?/<?Q!n+Co%rEb/g'D.R-nDdmNsEHPu;GuQM8
ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"HRF),3)+DG^9A7]CoAS#q"ARTIp@VfauF_PrC
C1K#8ARTI!DdmNsEHPu;Gp$[.Ch[j1Bk&8tDfQsmF_kc#DBNIuFCcRCGpskHAS6$pATM^"@;^.#
A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZe=(.!R0`8jjdMGq!TA@;^.#A85X/
D.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4C3=?,@;[2u@<itDGpskMDBNJ$B6%Qp
F)>JsDKBN&H#7(GD.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4=\V:,Bl5&(AS6$p
ATM`tG$f?0A79b$@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<la!G%>$,
Ch[s4F)-%DF(&ZhEbQXS?SEU@@WQ+$G%ki,+Dbb5F<GL6+EVO4@<j5A+DtV2BkLjrBl@l3F*(i2
F)Gl;BJ==BEc#6$BmO>5DImHhFD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7ANCrODKKPG+>#<+2`E]P
0eP4>1,1OB2K!JUBJ==BEc#6$BmO>5E,Tf3FD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7ANCrOE-,bI
+>Gc52`NTJ/i#=?0etXFDKKPGDJsQ4@;KY(AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaNDKKPG+C?o^
2)R662`EZS2f<b[@<?4%DI73uDJ*[*F_#&jA5I>]DKU&0FD5Z2+DG^9ARfOjE-,f(@;I'&Df03%
FEM,*+DG^9A7]CoAS#p*-o!_A0Hb(<FWbd>AT)U7.;j9M@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(
?XuTEF$sSPDKU&0FD5Z2+DG^9DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j#;nB6%R)F!)kc3B/]8
Bjl-,F(KB+ATK;>@<-F#?YNqk?Z':hARo.hFCB328O6?!DIIBnA0>r8@<*K,BleA=FDi:2FCT,0
BOtU_ATAo8@:F%aE+*d.AR]Rp@rlg4@<-F#F!,UIAiLoCF*8[<Bl%@%+EqOABHV54FD5Z2@;I&Q
:JDsK@<-.(Bldj,ATVs,F(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-F0Bldj,ATV9h@;KFo
Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32EbTT+F(KH#BOPsqA79RkF`M;=Bldj,ATT&-
Ec6)>+EM%5BlJ/:BOPsq/0JDEBl%<&A79Rk/0JS>FD,f++E_^@Eb]-*Dfor.+DQ%8Bjkm%A79a+
DKTf*ATDj7DK9H4ATMF)0k5-=E-686F!,OHDBNt6F(HJ&DIal2ATT&:Bl.F&+>"^WARuusEc6)>
+CoD#F_t]-FCB9*Df0Z8A79Rk@rH7.ATDl8.!0B<@<la/.3NeBCis<1+EVNEA79RkF*)>2@<l3i
@;KFk@;TRd+=MLa+EMX5EcW@DBle!+B.n=;FED57B-;;7A79b*De*:%DJs$'DK]T3F<G+&FCfM9
FDi:4@<iu5F_tT!EcWcS@rH7.ATDj'+=M>MA79Rk.=$2aH#7D1A9h`pEZf4;DKKP7Ao_<iFD5Z2
@;I&s@<iu;Bl.E(Eb031ATMF#FCB9*Df0l4FF&%B<%qm&De!H'@:X+qF*)81DKI"CATDX/+D,P4
+A+CC0JFVI5p/Qa6Qg)\+Co%rEb/g'                                            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`;d=+>P&o1E\J-2)6:/2]sh40f'q,3?U%82DZI20d&840fL403?U.51,U102BXb31bpa-1-$I:
1bgm21,0n-0JtU.1,'h-1H%4%F_PZ&?ZKk%ATMF):-pQ_@WcC$A7'@kF(KE(F<GZW/KeMFBl%<&
-us$CATMF).3N&:A0>DsF*)G:@Wcd(/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU1,EcUGqguq@:WmkDJsW.@W-1#+EVNEA8-+,EbT!*FCeu*Anc'mEt&IO67sB91MpQG
0fC.k@<?!m+EqaECM@[!+Du+>AR]RrCERh8FD)eGFCf<.0-GFLEcYr5D@Hp^$=e!aCghC++EVI>
Ci<fj5s[eGF_PZ&3B9*,4ZX]55s[eGF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a@WcC$A2uY1-OgDm
DeX*1ATDl8-Y[=6A1%fn%17/dEc+$$+=D2DF(KE(F=.M)%159QHV[I,:..Z@4ZX]rBk/>?+<V+#
%15is/g+k?+=Lr@AU#XHBlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+BljdkBOtU_
A8,O:3ZoguBl.F+-S7AC0mc\m78?6B6Ra6-Bl.F++=@U*%159QHZ*F;4$"KtART+[Bk&\AAp&3:
+E_d?Ci^sH>9G^EDe't<-OgCl$9g.jFDYu5Ddso&ATT%V3[\QOFEDbL+D58-D.Fc%ATVC,FCcS-
ATVg!+CSl(ATDTqF*)JFEZfC6@:UL)EbTW,+EM47GApu3F!,O;@59\u+CSl(ATDj6EZeh&AoD^$
F*)FFC2Rs6+DPe4GAqJAF<G[>D.Rd1@;Ts+<_Yt0/9><ADCd.X-S0=KEc*EU?YEkhBOkOnAT`$0
-OgCl$;No?+DG_7ATDlGEb03+@:Njk@WcC$A0>u.D.Oi2FCB$*+E)-?E,Tf>+E2@>@qB_&DfQ9o
4tq=2Eap50@s04_3Zq-_6W-]e@;9^k?Q`umF<Dr-:K(5"-S0=KEc)<n4tq=X5snOG?X[\fA7$Hu
F`\`S4DJbPGAqJAF<EY#+F>5K@s0:D14:9_@s1!r+=qD?Fq"cf$;No?+E_X6@<?''<_Ysk$?g8s
4ZX]0/gj[o6mjO,@rcGr$=\-lCh.'uD*9p&FD5T'F*(i-E$-MU%14L2<_Yt0/9><ADCI_0+=Jpj
G&:b=/1<V8.m>\7G&:b=/3IBaBl%<jFDVHo4tq>*D/a<0@j#`5F<Dr39gg?[F(96.+:SYe$?L'&
F`_SFF<Dr?F_PZ&Bl7Q+G%G]8Bl@l3/Nt:)4!H:)<_Yt0/9><AD@Hp^$;No?+D58-+D>J1FDl2F
+CoD#F_t]-F:ARP67sB/BPDO0D.G1F?Ys=$.6T^79gM-E:L@OFDe*2tA8-+(+=Lo;F*)804ZX]5
84c`Z:Jt>&-S0=KEc*<W-XU_$-OgCl$;No?+D58'ATD4$AKYf-@:UL%@rc:&F:ARt@j"tu-ZW]>
D0'>4Anc'm-TsL5D/=89F(96.%13OO:-pQUB4YslEaa'$+Cf>,E+*WuDf-[L+Cf>-FCAm$F!,[F
Eb'56F`V,)+EVNEFCfN8+DkP$DBNS4Dfp".$?BW!>9G;6@j#W0B/1TABl%?9-TsL5D/=89F(96.
/14G>Bl%i<%13OO:-pQUF`:l"FCcS.@<6)k$>4$\F(d]t+<iFZ@rcH<-XUOqF(f)mFCfT8CaTZ!
.!&m=DCd/BBOPsqA79RkF`M:G.6T^7-n'.M@59\u+ED%%A0>JuCh5%W@WcC$A7Te!.3L#m+>G<n
+D5@rF(c!i4tq>*D/a<0@j#`5F<GX7Ec*EU?YEkhBOkOnAT`$0-Qij*%15is/g,:UA79Rk+Co2-
FE2))F`_>9DBNP*Ch7Ys$7I\Q3Zp+*+D,>(ANOsCEc)<n-Y@(/AKZ&(Ec*6f/g,EK$>F*)+A#%(
8PUC=D_;J+%144#A85O_CNF#L/g+nJ@<?0*-[nZR6VC?K5sn:D0..29+<Y`8E]l#tA85O_CNF#;
F(96./13&aC3(a3$6UH>FDj]G;cFl[ART*lAnc'm.3NhTBlmo/F(fK9E+*g/+EM%5%13OO+<XEG
/g,7SA8`T$De!p,ASuT!$6UI4D/XQ=E-67FA85O_CNF#/B4Z1%A0<7!:IIuc8mu4FF%B_LCNEj"
A1%fn+<V+#+<XEG/g+nOE-ZP:EZf7<FCep"DegII+DkP/@q[!/DfTW-DJ()%DfBt2$6UI4D/XQ=
E-67FA85O_CNF#/B4Z1&@N[%=Bldj,ATV9sDffQ"Df9DuBlJ?8@ODTl+<YE@ASlBL/g+nJ@<?0*
-[p/KD/_-U%144#F)>i<FDuAE+DQ"0D/^V1ATVg!+=D2DF(KE(FC/p(FCep"Dei]oE-Z>1-OgCl
$6UHd67sBjDfBtEDJsW.@W-1#+E1k'%144#BkAt?An?4$F*&O>FCf<./15IPF(KE(FC/p(FCep"
DegtEA7d23A8a(0$6UH6+=M8A@:UKqFCf<./15IPF(KE(FC/p(FCep"DegtEA7d2<+Eqj?FCcS9
BQ&*6@<6K4A85O_CNF#;-ZWpBATMF)?Z'e(AR]RrCG'R:Ag\#p+<Y65A1e;u+<V+#+<XEG/g+YB
E-WR7DL!@8De!p,ASuT4E+EPi$6UH=6uHFMAKXBZ@VR8R/g)Qh/g)\fHTESu0RH2a5u^B^?W0p2
?V4*^DdmGj$6UI*AhG2oDIIBn+>#Vs-Y@LCF!i)@D_;J++<VdL:-pQUCi<flC`k-<F`_[R+CoD#
F_t]-F<G+.Eb/a&DfU+4$6UH6+CoD#A3DOf+tauc6r-0W-S.Z(@VRGA?RH9i+<VdLBkAt?An?4$
F*&O8De!</-ZWpBATMF)/oY?5-Qlr</g(T1+<VdL+<W(QART*lA8bsg/15IPF(KE(F=qNCAg]#M
GB.D>AKZ&-Dg-//F)rI7C11UfF(?gLEbTT+F(KGGE+EQ.%144#+<Y63F(Hs5$6UH6+<VeJD/XQ9
F`\`RD/"'4Bl7Q+A8bt#D.RU,+>#c"-QkJnA8bsg/15IPF(KE(F=qNCAg\]1$6UH6+D#G$/e&.1
+D#G$/e&.1+:SZ#+CoS*F*(qU/g+nJ@<?0*-[nZR6VC?K5sn:D06CcHFC\g%@4ru;$6UI4D/XQ=
E-67FA9;C(FCZM,ATW$=F<DrF@<Gpp@;TRd?ZU<tEcYSC0JYCjFEhmT%144#F)>i<FDuAE+CoS*
F*(q8B4Z1,G]Y&U:18<[B45mrDf/o\FCB32?Z^O7-OgD*+EMC<F`_SFF<G+9ATMs(+D58-D.Fb:
6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2d^E4-OgD*+>G!C+EMC<F`_SFF<G+9
ATMs(+D58-@X3',+=CW,@X2d.DJ<Ns?Z'e&D..6fF*(i2F'iEuFsd_+AScF!BkAt?8Oc]T8Q[*G
D_;J++<WB]>9J!#Dg-//F)rIF@ra^b+=BoU9i*knF('6'+DG^9IS)mn92eAI6VC?*%144#:-pQU
F(95R/g+nJ@<?0*-[m^]Bll"C@:O(oBOPCdF"\mlF(96./13&aC3(a3$6UHd67sB/FDj]G;cFlO
Bl%?0+Eqj?FCcS9@r`"cAScF!BkAu.D_;J++<WB]>9J!#Dg-//F)rHOA8-+,EbT!*FCeu*Df-\!
8PUp=:.\P1Df0B:-QmG@FEMVA/e&/!DIb@/$7QDk%16T`@s)g4ASuT4FDYu5De!-?5s\t&Bl%<?
3B:FU$9g.jDe'u=/g*qd78?6B6QfSU1E^UH+=ANG$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tD@WcC$A2uY1?ZQY`@WcC$A7'@kF(KE(FC/Qs@no?C.UmO7Ch-mnBldj,ATV9i
Ddso3/M/)SF_PZ&+CT.u+Co2-FE2))F`_1;EbTT+F(KG9:ddbqA8bt#D.RU,/e&._67r]S:-pQU
@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%17,eEHPu9AKW@5ASu("@;IT3De(4)$?B]tF_Pl-
+=CoBA8Gt%ATD4$AL@oo%16T`@r,RpF!,RAE,9H&?U6tD@WcC$A4fNU3B:G03Zoe95s\t&Bl%<P
9K>*n-QlV9@rGq!@<6!&4=<E\6"4tNCh-.33B9)I%16T`Bl8!'Ec`EOBkhQs+CT#'A8Gt%ATD4$
AL@oo%159QHV[I,:..Z@4ZX]rBk/>?%13OO:-pQUBkAJ9Bl.F+.3N>G+D,>.F*&O8Bk)7!Df0!(
Gp%$C+E1b2BHV#,@r-9uAKY]/%16c[@:Wn_@m)jq-mr_GAU#RS3^,9F:JaJT6qK`p,:@2BAU#=F
%159QHZ*F;4$"KtART+[Bk&\AAp&3:+E_d?Ci^sH>9G^EDe't<-OgCl$9g.jFDYu5Ddso&ATT%V
3[\u^Dg-//F)rI7@W?O/FCcS0F`VY8EcuD1FD)e=F)59+BJL]SBl7luFD,`,E$/t2DK'$+BQIa(
+ED%%A0?):Blmo6%13OO:ddcJ5tsd23ZoejBldj,ATT:/$4R>+0RG0>DeO#26nTTK@;BFp-QmJA
FD>`)Ch\!&Eaa'$+=ANG$9g.jAnc'mF$2QsEc>i/F<FCJ7SZ6D71BS5$>ag/E+*j%4ZX^-F)59+
BJL]HBl7luFD,`,E$/n<F*(r5G&Ul3BHVM5DK'$+BQIa(+?M<)Anc'mEt&IqA7fFfCh5aj+Dc.E
E+*j%/5S`(:-hTC/13&hA7d1u$4R>;67sBjDf'H-Ch4__@8pf?+>"^P@<6N5Anc'm+DGm>.P>1=
F<GLB+=]!bBFP:s1E\_$0I\,VBl%@%%16f]/g*_T=%Q.0+CoCC%144#An?!kF(HJ8BQ&*6@<6K4
E+EQmBl%>i$6UHG+Bot0BOu!r+Cnr$F`2A5+?Op2Gp$[9A1e;uBkAt?8Oc]T8Q[*GD_<.A$6UHG
+Bot0BQ&*6@<6K4-VdH:762Q3F`&<L/1<T,3dE/*-Qm,@+=A^VFEhb5FD)d+$>"*c/e&.:%13OO
:-pQUA8-+,EbT!*FCcS)DfBE%Et&I)1E\_$0I\,`A7fFfCh4%_BkAt?0g0,[G\M5@?YWpjGp$X9
/e&.1+E1k'4Y@jtART*lGmt*'+DGF?+A#%(8PUBNA8a(C%144#+<VeJD/XQ=E-67F-ZEU.+ELt7
ARlotDBOC#5sn:D83oU9;^W"]+<VdL+DP=pCN*fr4Y@jlE+*j%+=DV15sn:D83oU9;_KLL:ddcJ
5tsd!-SB@KAg\#p+<VdL+E1k'+Eqj?FCcS9BQ&*6@<6K4C11UfE+EPi$6UI&DIb@/$6UI*AhG2t
7TE2T=<M-m/e&.1+<VeJD/XQ=E-61D-Vd6-:c]_/DfBtEFDi:N8jPg;;b02A92d2\%144#+<XEG
/g,+DAfu;<Blmo/F(fK9E+*g/+DPk(FD)dEIS)mn92dKaBldj,ATTRQ/5S`(:-hTC/13&hA7d23
%144#ASu$2%16Z_F(Hs5$6UHG+Bot0BQ&*6@<6K4-Z*R=F(oN)+E1k'+>#c)4*_8BASu$2%14Nn
$4R>PDe!p1Eb0-1+EVI>Ci<fj5s[eGF_PZ&8k_6*3F<4&4tq>%A0?:Q+AYg&:..Z@+BosE+E(d5
-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eGF_PZ&8k_6*3F?f@F(KE(
FC/Hu@;[i-F)>i2APPQE.WT6EATMF)?X\%bDDGR?D/X3$+ET1e+Cf>,E+*d$DJ((a+=LZ?@;[hR
@<>pq11D[TFDi:5G[k<$+=LZ?@;[hL+CT.u+A*b)@<,k"@;[MH%15is/e&._67sBjEb/[$ARmhE
1,(I>D..H?0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`%^67sB91MpQ@1,pCuATMr9GAhM4F!,=<G%G2,FDi9MEbTT+F(KGn
FD5Q4.1HUn$>aWhA0<7?Bldj,ATT:/$>aWhA0<7?Bldj,ATUpoBl%i<%13OO:-pQUAn?'oBJ4=5
EcYe7AU%]rC`m/.@;[hCA79Rg+D,Y4D'16=F`_[R%17,eEHPu9AKW@5ASu("@;IT3De(4)$9g.j
De'tP3[\N^FE8RIFD5Q4-QlV91E^UH+=ANG$?BW!>9G;6@j#Z!F=044+>b3RATT%B@<>pq11+U;
@qBI`FEhmT%16u_F?MZ-4!5Ym3Zotk@rr.eDI[cO3ZpOH/mg=[4s3fj66Ig+/j:C?4"akq+Dt\2
+>#2g6W,H_+t!g,DI[cO3Zri'+Dt\2+Bot%A3Dsr0RI\IF:AQd$;No?+D#e-AS`K4@;L'tEt&I(
=Wgfo4ZX].+<VdL+FH3m?XG-(/g`b)-tm-6BeCMj4"akp+=A:7+BU!?+F>:e+Dt\2%14Ic=<L^K
-TsL5+<VdLHo`BW?R?sL-9`P#BOi6"/g*8</mg=U-QlPF=<L^!=XPX@HQk0eDI[bt$7A,B=<Kn3
=XQ?n+<VeS3Zqd:-6b&h4s27eA0>S=+?V_<?SNZN+@/sm:+06u==G@Y<'a8-=>*f+-Rg0b+u(3X
@rr.e-UBLj=<Kmb=BR"73Zrf2+CAJ&+tb3++=Lo6+DEGN4?G0&0d%hd5u^-F1+69V==G@Y<'a87
-s/$'.46PeHQk0eDI[bt$4R>;67sBlG[k<$+Eh10F_,V:F(fK7Ch+Z*@<?!m+EVNEF)Po,+E2@4
@qg!uDf-\0DfQt<Df-\)?Q]dbE,oGO3Zp+/0JG170JG4.Ec6)<A.8l[GWe)18M2,g=<N&R+CAIb
$7Kk6@j#K1+F>56+=/.4.3L3'+E2@2+DH(I=]c+?Bm;d%+A"1.=BQbq3Zqd:%14M&Eap5+GT_>U
=<Jn4=XbIF3ZrB^@j#K1HWXD[$4R>;67sBhEas3"DBNn=ARfFqBl@l3Ch7[/+:SZsEaq6n+>>E%
0JG170d^pZF`(_!$>F`-4ZX]W/g+;!+FZ?o?XF6L-ua3:+DH'CHQZj2EZee2@ru-s+B_eq+>#Vs
E,oG2Bm:bI+@0.4%16fo4ZX]W/g+8!+FZ?o?XF6L-ua3:+DH'CHQZj2EZee2@ru-s+BVbq+>#Vs
E,oG2Bm:bI+@0+4%13OO-t.4+DDE>:/36o_+>#Vs@<>pq11DA//36lB$4R>;67sBq+CTA#DDES\
+DkP/@qZurG[k<$+EVNEF)Po,+E2@4@qg!uDf-\0DfQt<Df-\DATD]3A7]XsD/!lrFDl2@%17&p
@m)jq0J5%50JG4.Ec6)<A.8kq/h\>10-W+n>p+*,@j!16GT_>U5r)SF.3L/o+DH'CHQZa=@;[hC
=<K.U+B]-\.P<@s4YJ!6+C-+/Eap4?Bm:bI+@.bc==G@D/g+kQ+F>5>FCB&B@N\er/34nU%13OO
5u^3,4ZX]6==c(-.3L/o+@.bc=<K.I+=LZ?@;[hC==cL9.3L/o+CTA#DDGZD=Y)U9%15C#6S^ec
+=Auu0J#%50J"q6/iG781+kI90et@>-Qjfs+Z_>,+@/so1(=RV<'rE(3Zoh54"akp+=A:6+B]gu
?U7XW:,45#/6F>DC0tCk@;[hK==cL9.3NA4@<>pq11DY7/1t$R-Rg/h3Zp^f6S])X%15is/g,1C
DId[&+ECn4BlA&8%16!24ZX]M/g)nl2)$^02)#IH;GoY=+Au)[.Ng,b;Gnqd,TnL"/q+om0-jFn
.3Ns[-n6kq;Gnqh?SNZX%14LlFCB&B@N^%N;Gnqd/NP"_FCB&B+Au)H$4R=r+>>'PEaa$#+=D2>
+D>:.DI[c2=Wgfh=]ceK=Wg"5=<Kn3=Wg!c=]ce410@[%E,oG2Bm:ad<'rD`;GnkO$4R=O$?L'&
F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#@<>pq11,*>Deio3EbTT+F(KH#ATMg%DII<fF)>i2APPQE
.WT6EATMF)?Y+:tAStpl?ZU(&CLnV2F=f'e+EV19FE8R:DfQsC7<<EZDII<'+CT.u+AHEYF`S\N
PZ/)!:-pQU@;KRpEbTW/D(Z8):-pQB$;No?+D>k=E-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d4
7;-7KE%ba5Cij*-E,TQ<1,(C=/nf?DC^g_H67r]S:-pQUG%G]'@<?4#3ZrKTAKY])+=LiEFE8l?
$;No?%15is/g)8Z:-pQU1a$=CF)W7M/g)tnA8Z3+-Z3@6@:(Ak$;No?+<VeE@<5jaE,TQ<DJsB+
@;K:^G]7\7F)u&6DKB/sDfT2qAScHs?Z]XlA.8l@67r]S:-pQU@<6L4D.RcL+D5_5F`8HOEbTT+
F(KGB+DGm>Ci<`mARl5W:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\TN_$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>YDdd0!
-ZWpBATMF)-OgCl$;No?+D>J%BHV87Bl8#8E,oN"Ble!,D@Hq$3?^F<0e"5"2@U!&$;No?+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R>/5t"%8=Zneg?T'f#2@U!&$;No?+Dbt?ATAo%DIal4E,]B/+F.O,EZeh0F`(`2%15Ef6pa[P
+>#Vs-tHn*FCA-&+?DP+6:""+:K\lK.3NG9A3DsrA7]S!@8pc_+C?lX0JFV(+>F<46:""+:K\el
3Zoh]AScHs<%oFU3ZpaT6pa[P,$ucAF^elE3ZqsECij)bA9f:R0JG1'0d&1[$4R>;67sC$@;]Uo
D'3@tFCfM9Ao_g,+EV=7AKZ#%DJ*Mi$=S3C3Zp+!/M;Jp-tt^b0f_6S.4cSs0JG1'.j/OY+>GQ(
0F\A7D.Gdj+CTO<H[[)%/g)u)0H_S_,@Pj,$@-K!4ZX^2D.Fb?+FH3m0d&Y4+?qJ$-mO"SA18WG
+=oPr0esk,3"64*H"9'!+Co&"FCA-ZGp%BLA.8kT$;No?+DG_8ATDs&Ci^_2Ec5e;-tHn*FCA-&
.1HW)Gs+226:""+:K\ea/g+F]/mg@V-nlc)+>>5e%16Gs3B9)B?SsMk%16H"0JFV,0JEqC2)$^,
0fC^>%14gJ0JFV(2_Zop$8FIn0H`)00JEqC0fUj@+>Gi60F\@D3&WH50f^pA%14gM0JFV(3AN8t
$8FOr0H`)11bfFH0f_'F+>Gl70b"IE3ArT70f_3O%14gM3&Vm70JG?n$8O:h2'=Y.2)#IH1,(R>
+>PZ/0F\@E0f:X-1GCL:%14Nn$4R=o/j_il6;L`,AM,*GGmt)i$;No?+EV19F<GFCF*&O=DI[L*
A7ZllCht5.DKKH1G%#3.%14[>-nm293[8Zj.3N1S+=Jm(INX(l+=qPY.3M27+Cob.%13OO:-pQU
@W-C,A9/l1F`VXIAmoCi%14L;/3Z*>Ed9)V/NP"&004P)IP)`oEd9)V8M2-%@UpT4/g,:GA.8kT
$=n644ZX]rAScHs<%oG*H"7?k%13OO:-pQU<+06PAKW]M/Ke)&Cis<1+E(j7cBM9N+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sBKATDL.ARloqEc5e;883-eDfTQ%@;I&/+<VdL+<VdL+<VdL
+<VdL+<VdL+<Vd9$;No?+Auc\DfTB0+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU=_2#^+<VdL+<VdL+<VdL+<VdL+<VdLcBM9N+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+=M;B@rH6qF"&4S+<VdL+<VdL+<VdL+:SZQ67sB4/M/P+/M/P+
/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=FCAW44ZX]P5t"%8=Wen@+C.&]
?SW`P0H`D!0I[G</N#49+<VdL+<VdL+<VdL+<VdL+<VdL0fLgI0H_J\+<VdL+<VdL+<VdL+<VdL
%14[D0JFUl+<VdL+<VdL+<VdL+<VdL+<WBr2)?p/+<VdL+<VdL+<VdL+<VdL+<V+#/Mf(7+<VdL
+<VdL+<VdL+<VdL+<VdL0f1RD0H_J\+<VdL+<VdL+<VdL+<VdL%14[B0JFUl+<VdL+<VdL+<VdL
+<VdL+<WBo2`WQ7+<VdL+<VdL+<VdL+<VdL+<V+#/MSq5+<VdL+<VdL+<VdL+<VdL+<VdL0ekRC
0H_J\+<VdL+<VdL+<VdL+<VdL%14d3+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm2)m94+<VdL+<VdL
+<VdL+<VdL+<V+#0eb:(+<VdL+<VdL+<VdL+<VdL+<VdL3ArQF+<VdL+<VdL+<VdL+<VdL+<VdL
%14jE0H_J\+<VdL+<VdL+<VdL+<VdL+<WX%1b^$p+<VdL+<VdL+<VdL+<VdL+<V+#1GCL*+<VdL
+<VdL+<VdL+<VdL+<VdL2`<WL+<VdL+<VdL+<VdL+<VdL+<VdL%14pG0H_J\+<VdL+<VdL+<VdL
+<VdL+<WR$0JFUl+<VdL+<VdL+<VdL+<VdL+:SZ80JFUl+<VdL+<VdL+<VdL+<VdL+<Vda2_d!/
+<VdL+<VdL+<VdL+<VdL+<Vd9$8sRl+<VdL+<VdL+<VdL+<VdL+<VdL+>c#60H_J\+<VdL+<VdL
+<VdL+<VdL+:SZ:0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd_3&**0+<VdL+<VdL+<VdL+<VdL+<Vd9
$90^n+<VdL+<VdL+<VdL+<VdL+<VdL+>Pr80H_J\+<VdL+<VdL+<VdL+<VdL+:SZ<0JFUl+<VdL
+<VdL+<VdL+<VdL+<Vd^1,(C)+<VdL+<VdL+<VdL+<VdL+<Vd9$8F4g0H_J\+<VdL+<VdL+<VdL
+<VdL+>G`40H_J\+<VdL+<VdL+<VdL+<VdL+:SZ40eb:(+<VdL+<VdL+<VdL+<VdL+<Vd]0KCg0
+<VdL+<VdL+<VdL+<VdL+<Vd9$8F:i0H_J\+<VdL+<VdL+<VdL+<VdL+?),2+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZ41GCL*+<VdL+<VdL+<VdL+<VdL+<Vd`3A;Qu+<VdL+<VdL+<VdL+<VdL+<Vd9
$8F@k0H_J\+<VdL+<VdL+<VdL+<VdL+>Yc,+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ42)$^,+<VdL
+<VdL+<VdL+<VdL+<Vd^0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd9$8FFm0H_J\+<VdL+<VdL+<VdL
+<VdL+>GW*+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ42_Zp.+<VdL+<VdL+<VdL+<VdL+<Vde+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$8FIs0H_J\+<VdL+<VdL+<VdL+<VdL+>GYp+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZ43&!$/+<VdL+<VdL+<VdL+<VdL+<Vd]1a!n`+<VdL+<VdL+<VdL+<VdL+<V+#
0fV$E+<VdL+<VdL+<VdL+<VdL+<VdL2]s4c+<VdL+<VdL+<VdL+<VdL+<VdL%14gM0JFUl+<VdL
+<VdL+<VdL+<VdL+<W6l+<VdL+<VdL+<VdL+<VdL+<VdL+:SZ43AiK5+<VdL+<VdL+<VdL+<VdL
+<Vd^3?TFe+<VdL+<VdL+<VdL+<VdL+<Vd9$7QDk%14[>6:""+:K\fO/g,7E@PA5u%15is/g+YB
D/`p(AKYK$D/aW>ARlp,F"SSKBleB7EbT#lC`mn0Cis<1+>"^XBOu3q+CT;%%15is/g,4X@WQX"
DKKT$C`mn0EbSs"@qB^(@Wcc8F(Jj"DIdf2F(fK7Ch+YtAKW0`@;Ka3:gnB[Gp3\):-pQU:/=hX
3ZrWX+CT;%+EV%-Bl7Q+GqLcnFD5T'F!*%WFD,5.Anc:,F<G:8F*(i.F<GL6+:SZQ67sBh+F.O,
EZfIB+EM+*+D>\;+E2%)CM@[!+CSeq@:NkdF<G:8FCfK9@;L!-@q]:gB4Z-,cBM9N%16cZF>,j=
+=JreHQk0eFCAW4.3L/o+=MUu+F.KH+=o,fHobeLCij)b0Hr4oH"9'!+C?fT2'=Rq0J545+tt,o
+C-*D+F>:e+EV%$0F\?u$;No?+ED%'ASuT4G%#30ATJu4Ag#B`<$5dnDf$V-Bl[cpF<GL2F(KB8
@<?4%D@HqJ67sBhB6%QpD.RU,+DGm>A7]7^DKI">G%G\:FD,B0+E1n4Bl@Mk$?T]c0g.Q?6:""+
:K\ea/g+F]/mg@V-nlc)+>>5R$8FOu2$l&n/hmYA$8FP!0F9Nk/i!_B$8FP!2$l&r/iO(G$8FP"
0F9Qi/i!_B$8FP"2$l)s/i<qE$8FP#0F9Tj/i<qE$8FP#2$l,s/i*eC$8FP$0F9Tp/ia4I$8FP$
2$l/p/iX.H$8O:h0F9Wn/iX.H$8O:h2$l/t/iO(G$7QDk%14[>6:""+:K\fO/g,7E@PJ<!%16cZ
F>5p>+=JreHQk0eFCAW5.3L/o+=MUu+F.KH+=o,fHobeLCij)b0Hr4oH"9'!+C?fT2'=Rq0J545
+tt,o+C-*D+F>:e+EV%$0b"I!$8<SV,\;")F(HIA6:""+:K\fKGp%BLA0>E.A0>E)0Hb1@A0?#(
A0>o<+D>;-0Hb%>F>4n[@:Co5FCAW5+F.KF+:SYe$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#
ATMg%DII<fF)>i2ALDM4F(KE(FC/lrAT`'$F)>i2APPQE.WT6EATMF)?Ys@cF`Uo2D/X3$+ET1e
+EMC<CLnW1ATMs7+D,P4+AHEYF`S[KATD7$/e&._67r]S:-pQU5p.:[DerupFD5Z2+<YT7+EV19
F<G(%F(KD8Ao_g,+<XBiAT`&AF!)S[3B8f:+@1'jEc5i6D/!KgC^g_H67sBHChI[,Bln$*F"Rn/
:-pQB$;No?+CT>4F_t]23Zr'UDfp"A-us$CATMF).3N>G+Dbt)A7]9\$;No?%15is/g+YEART[l
A3(hg0JYG$@<+%^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o*D..H>1*CUKDIIBnA0>u4+D,P.Ci=M?-tdR=F`:\t
Des6$@ruF'DI7KsF*)MLE+LI@CghU-F`\'":-pQU1,EcUE\]TsFCfN8+EqaEA9/l1Dg#]&+EVNE
-us$CATMF)<HMqkF"%P*%16oi@:UK.EbTT+F(KG@%16oi@:UK.EbTT+F(KGnFD5Q4-OgCl$;No?
+D>J%BHV87Bl8#8E,oN"Ble!,D@Hq$3?^F<0e"5"2@U!&$;No?+E_d?C`mn4Eag/5ATMs7%16QT
B0A9u3&!$?0H_kg0ea^m.NiFX+>GQ(%14M$FD*?N@Us+#+>#VsDK']20Hah8B+51rDKKPG+>%&5
B.4rT3Zr<XFD*?N/Ri7'%13OO:-pQUE,Tf3FD5o005b?6@<?4,AKYJkEb&m%@;I&sBl[cpFD5Z2
Et&I)/0Hem,9SNu+>=ou0H`)00H`,00H`%u+>#VsDKKPG+=nWm+<r![3Zp+!3A;R13%uI12_Z@1
2D>RI-nHJu+<r![3Zp+!1,gm00fUj03A;R0.3L3'+Du:70H_nh2'=+d/34n*+>=ou0H`)00H`,0
0H`/00F\?u$8<Sc+D4Y-H#7(78hr(S0R7MIA.8kT$;No?+DQ%8Bjkm%A79Rk+D,P4+@0seBl"nH
0J">$3B/r?@<<VGBHU;S/e&.C1c.*M3AiEH+?^i^F_kZ1@ps0r0f_3P+>b2q0F\?u$;No?+B0J,
@;L't%16Gr/ho+?1-%6K2_m0G3$:@,Eb],-B2gR1D.FbD3B/r?1a"M,%13OO:-pQUD.R:$F!,X7
Cis<1+E1sG+?24f$;*^'4ZX]@1c.*M3ArKG0K([D%16'O4ZX]m0J5(82_m<K1GB7FFD*@F4ZX]m
0fCsL3&<9A1,^mB1,_$"$4R>;67sB/0ek:;.3NSB+?21e$?Tr8@m)jq1,ps?1c@$G0fUsJ+=eQ_
1H$p>3B/lS1cI3K2DR98.Nh>OD'1DQ1,LjC2)I0C0I\+p+=Jor0JG1:3&`iR1E\.i<,Gqs.3L2b
1H7<J0JG17+=2IZ<,Gqt%13OO:-pQUF)>i<FDuAE+=D>@Cis<1+Co1uAn?!*Bl5&0@<6N5A7]7b
D..6.%15is/g,4PDfp/@F`\`S5!(AO-Qlo;D/aW>ARlp#AS$"*-Rg/h/g)Ma-Qjrm+=Aiq2^]_-
+Z_A$FD*@<+=oPrFD*@F%13OO:-pQUG%#30ATJu&B6%Qp+EVNE2BZOA@qfdgCi^$m4YIp*0J572
+?1N*1*C[P0Ol4V3ZrNX0Pq7+%15is/g,"B@;[3/Bk1dqARTBtFD5T'+D,P4+>Gl92]tD*EbT>4
0ea_YF<E:uBK@n'D)s@)F!+I^%16646p3RR0f_3P+>bW(0H_kgAn5LoBPhf50f^@30d&.Z$;*]r
4ZX^#F_kZ1@ps0r=\V9n$<1Lu3Zr'70R7MG+B_E,%13OO:-pQUG%#30ATJu&B6%Qp+EVNE3$;aC
@qfdgCi^$m4YIp*0J5=4+?1N*1*BP++=oPr<,E'O%172j0Om7,+Dk[uDKBN&C1K"@8jm.u$4R>;
67sC(@;L'tF!+n(Eb/f)FDi9[+Co%nBl.9pEt&I>0-DVr/iG("3$C=<+EV9N@j!<`+EV9ND%-g]
$;No?+Du+<D..6pH=\4@BJ<p*$?Tr8@m)jqDKKPG+EV9N@grceBJ=9d3Zp.43%d-G2`N`P1a!o9
67sC"B-9/k%13OO:-pQUD.R-n+EM7-ATD?jC`mh6D.OhUE,oZ/+>GQ$+>Gl92]sds<E()TDBNV0
F!,F7/g*,1%172j0Prs6+=Am"-T`\10IJq01c?sB2E!NB%172j0Om7,+=nlo/2/V//i4pu-o`A2
0I\,TD0'<0A7Qf;2'=2o+Du:70Hb4D@;^.#A9i$&0H`)13&_s:+>GPZ$?Tr8D'1Dk+EV9N@grbS
$;No?+Eh10F_,V:@:sUlAKZ)5+>t?QARfFk@;Kuo$9^$b-SR/2-QkAl3\hh"BJ<p=/34nqBJ=94
$4R=jD.R-nF(o0"A2#-@F_kZ1@ps0r=\V:5+?^iaARTItBk2L+A2#-/9gfEt%15is/g,"BAT`&:
E+^dG0f(]s$=tnS3ZotaD0'<0A7Qg"ARTIp@VfauF_PrCC1K"@1,LgG3&riK2%9m%$;No?+DkP/
@q]Fp+EVNE1E^4>@qfdgCi^$m1,C%.2BXb6/i57@+>#Vs0J5%50d(LTF`(_4AM=Q#%15is/g+SA
E+*cuDKI"BBk1dqARTBtFD5T'+>"^QAS$"*+E1sG+?21e$?Tr8D*9p&-S[D)4!ua:-T`\42D-^?
2(&h?FD*@<4ZX]oE,]6+F(o0"A2#,]1c.*M3AiEH%15is/g,">FCSuqF!,RC+>Y-NARfFk@;Kuo
$?Tr8D'1Dk+=nlo/2/V//i+jt-o`A20I\,dBJ<p*$4R=t1c.*M3ArKG0K([D+?^i>6p3RRC3=?)
EarNo+=qe`H$O7DAn3#=3B/r?1a"M,+>Gl!1,0n*%172j0Om7,+Dk[uDKBN&C1K"@8jj*qFD*@F
4ZX]m0fCsL3&<9A1,^mB1,_$"$9^$b-SR/2-QkAl3\hh"BJ<p=/34nqBJ=94$;No?+DkP/@q]Fp
+EVNE1a$=?@qfdgCi^^N+Dk\$F`S[EB.b;d2%9m@-nH`*-Rh,)1GgI@-T*h80K;'N-Rg/i3Zot$
0J"n/0J510+=K2m3\W!*/7`U=Ao_Em+>G_r-%6tSFD*?NFD*@<%13OO:-pQU<b6/kF!,C=+>Gl9
3$:q(Earc*1,'h;Df^#=DBLMRD.R:$F!,F7/g*/7%16646p3RR0f_3Q+>Y,q0F\A2BJ<pZ3ZqjM
E+*d.Bk1sh0Hb+QCh@]t@;I&h9gfEtFD*@F4ZX]50ek%;-T*S*4!umF/ho%-%15is/g,">FCSuq
F!,RC+EV14FD)e8AftM)F(Jj"DIa1`FD*@F+>#Vs-SR)*/2/\3-QkAl3\V[-+EV9N@grceBJ=9d
3Zp.92_I$G1,(Zs$;No?+Cf>-G%G]9+D>V5+EV=7AKZ)5+Co%rEb/f)FD5T'%172j0Om7,+Co"p
Eb'$.+>G_r.NihH0OkP!:-pQUD..NrBOu6-FDi9Y+Co%nBl.9pEt&I)/2/\10JG4(Ec6)<A0>u-
0Pr6]/NP"*0J5%50JO\jDfor.+EV9N@grbS$;No?+E_R9F<G(3DK]T3F(oQ1Et&IO67sBoE\)'A
DCfj?@rj85A0>u4+Co%rF"V!6%14pH/hf.>0K(^04WlF20JG170JO\jDfor.+Co"pEb'$.+>G_r
.NgJh1c-=01+kRG2'=#:67sBY5p0lZ+D<<C/9;7-:-pQUA7]Cp/nAK8FDi:8E\)'ADCfj?@rj85
A.8l$+>bnt0et@A2`2^03Zp+/0JG4(Ec6)<A0<F6D0'<0A7Qf;2'=2o+>bf*0Jt[@2DYdL%15is
/g+_EDe!H'@:X+qF*)81DKI"<AS$"*+E1sG+>GW0%17DmF>.Pp3Zp+/0fV!M1Ggg/>9J5GD*9p&
0J5(>1c[EK1a$!FFD*@F4ZX]>/ho7<2_[3F%15is/g,">FCSuqF!,RC+>>E%0JG4(A7]CoAS#ol
$6VJb+u(3E+<W?j0JG18+EDCCDIak<H=_1PD(KueD(KdB0Pr6]/1r&kATW6?BN-Z.1,(IC+>GSn
0f(F:3=Q<)$;No?+CT5.@<,psF<GU4/7`=%+Dk\$F`S[EB.b;]1,fXL-ZWW<A7]6u4ZX].1,(IC
+>GSn0f(F:3?VaLE+*cb5t"./+>bf*0Jt[@2DZI,/g)u2/i#1@2`38u$;No?+Co%rEb/g'+DkP/
@q[!,D]gkZA7]7bD..7%%156O+=Aiq1aaCo3$C=<.3LH-/i,=D1cR96/34naARc/V4YIp*0J510
+=K2m3\i-,1bgU?1cI0E1a">1+ECm"$;No?+ECm5Bl5&,/8ZqZ+DkP/@q]Fp+EVNEF(Jj"DIa1`
-p0RD?SNoN1*AD3+>GSu.3L3'+=nil4s24,-Qjfs+Z_>,+Co>1Ao_Em+>G_r-%6sfEa]Ca%15is
/g,"BAT`&:Bl8$(Ec>r5@<?4%DBNJ(AnGUpASu!hF"AGQB-8rd+>Pe`$=tnS3Zp.01H7*G1-%06
0eP7A0etL=1E\D)1H7*E1c7&u$9^$b-SR/3-QkAl3\hg^+C?fT0JG190K:d00J5%50JG7=0H_o-
+?hM&HQZa5Ch.6lF!,$J%156O+=Aiq2^]_-+Z_A$>9GUP0JG191GU[-/34n;1*Cod@;KajBkDE/
AM=Q#%15is/g,7LAKYZ)F`JU5DJ*cs+@mV<+EV9N+>"^0+>"^V@3B0#Ec#r8@3B9%+Dk\$F`S!!
:-pQUD09oA+C\n)@WGmeCLqU!A0>]&CLnVZ+?^hqFD*?N/Kd_9+>"^V@1<Q=67sBlG[YH.Ch4`+
AS$"*+E1sG+?;.c$:m<@+=JXKF(TH+D0$gZ+>Yhs2)['H2)?[(/KcHPF(TH+D0$gW+?1Ju2(gg:
.3L2bA92@'BPhf51,C%5+>Gc,2Dd,t$;No?+Cf>-G%G]9+EM+(Df0*,+EVNEBQ&$6F!,R<ASrW$
AS6$pATJtG+DkP/@q]Fp+EVNE2BZOA@qfdgCi^$m4YJ0:/iG("-o`A21+=>(1bLRA1,1R@+=oPr
DKKPG+>G_r.NgN*0JFUqINV/j$4R=O$8<SV,\;")F(HIU3[\BIB-;;00PqqSBJ<p=<,EaW@j#>:
+F7U@0PqqY0Pqq89gg*r6m,)i@j"B3D'3k-+Co%n+@mjh$4R>`D/XQ=E-67F-W!*-;aj)83ZrHW
F(KE(FC/lrAT`'$F)>i2ALDM4F(KE(FC/ooG&qb6EcYT!@s)."D/X3$:-pQ_EbTT+F(KH#DII^0
FCB32?Y*_i?ZU(&CLnV2F=f'e@rH4'@<,q#+=M8EF(KE(F=A=T@ps1`F!)TID[d%K67sC"Cgh3m
FCB3(F_r7?Ec5T2@;U'<%15is/e&._67sB[BPDN1+EV19F<D]9Df'H%Eb0;7+=M8EF(KE(F=A=T
FE1f-F(o_=+EV=7ATJt:FDi9E+ED%7F_l/@%15is/g+YBD/aW>ARlomGp%3BAKYr.@;]Xu@<-()
D'3e<DeF*!D0$gJ7:C4YBHTZRDKKH1ARlo`DJ=9*EcYe$$;No?+AbES/e&._67r]S:-pQUF(JoD
+D>k=E&oX*GB\6`DJs],/R`^BEc3R?Df%-:$;No?%15is/g*nb<(/hj+EVX4DKBN6+EV=7ATJt:
@<,p%D/XH++CSbiF`Lo4AKW+-DfQsC@s)g4ASuT4E+O'(De*nu$;No?+EV:*DBNn,F*&NI-o!_<
2(9YdEZcK:F`_bHAKW*D1,(O@.3NS@EbTH&F"SS7BOu6r+<YWDDeF*!D0$-n:-pQUEb065Bl[c-
+<YfGA79RoDJ((7+D#_-Ed8cM+D,2/+<Ve;ARf.ZATJt:FDi9E+ED%*Bl7K)+<Yc>AISuA67sBh
E,]i9G\M#'FD5Z2F"Rn/:-pQB$;No?+CfG'@<?'k3Zp131,EcUE\fEZ$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`]
E,mWf+Dkh1F`_1;A8,XfATD@"@qB^(A8-+,EbT!*FD5Z2+CSekARl5W:-pQU1,E?XE\]En@:X+q
F*&O:DfQtAF`&jQBldi.F(KG9/KdGI;G0te;]n4G0HatGEZfI8F*),6B+51W$4R>YDdd0!-ZWpB
ATMF)-OgE!Ddd0!-ZWpBATMF)<HMqkF!hD(%17&mEcbf)@<-E30F\?u$;No?+EV19F<G^JBl%i"
$?U-!DK@s%+FAGc0-W+n>p)$Z+>Fug+u(2_H$t)M$:R<^89.F=DK@s%+FAGZ/g)N'-RN;6AoD^$
F*)FH0d%ik-RN86FCfK/@<6O3FE/Q[+C-*F+FPjb>rsZG1*C[TAfrKL771',<,sQ]E_U7c4!u.Z
AoqU)F*)FFGpsjf/g*MZI=2P3%15is/g,4PDfp/@F`\`RDJsQ;BOu4%+D>>'Ble6,ATD?)E+*g0
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%15jD:gnEe4ZX^%De!3tBl@lrH"Cf.Dg-8EDf0-8
+>Gl42'=h#2@U!gBM`,YFAc[k4ZX]\BM`,YF<GI0G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2Ws
FDk\uGp#jq:gnEe;IsnY$4R=O$;No?+Eh10F_,V:FCeusDfp,;Gp%$7FCAm$ARlomGp$U5Bk(pm
DJ()1DBNk8AKZ&9@<*K!AoqU)%15is/g+S?DffZ(EZf(6+EV:.+AbEJ771&t-q.QbFD)daASuU$
Eb/c(<GlMoATDj'.3NSMDeF*!D%-hIBLP9g:gnEe4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5=_2DcDg-8EDf0,//Kdi*A0=?MBln$#F_i0oDe!3tBl@l3
+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d+<Z%@$@Es=+<VdL+<VdL+<VdL
+<VdL+<VdL+<WBm+@0ITG%E6rDfU/O%17J*+<VdL+<VdL+<VdL+<Vd^1bq!M3&rTM2'>M6Ch[<q
+<VdLHjpF1+<VdL+<VdL+?1u-3A<EJ0JPLC1,LpH2)?B#PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL
+<VdL+<Y#G0eb4>1,h3K+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<VdL+>bo-1c@$F2]te&
FD5i>A7Zl+HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<WC!1Gp:XARTU%+<VdL+FFV*HlsOS+<VdL
+<VdL+<VdL+<VdL+<VdL+<WTc9lFokBHSE?+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL2D-aB
+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BZ"!6[Bjt+<VdLHjpE5/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@GTWD.Oh4+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<
6#:Wp6tL"Y<,sQG1bD7=9keKm+@SXt/Q?aB89.F=DEA:7.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@G`[F(&lu@:s^o+<VdLHq7-X2Dm?M+<VdLHlt:+
/heCj+<VeS+<W?\+>P&^+<VeS+>=om+<Vdg%17JU@<HW66$76jEa`cuF*pMV+>u2<3?TFe+FG:d
0eP.&+<VdLHlsOc+>khq+<VdLHlt*c2)$-q3t2OE<b5oP+<VdL+<VdL+<Z&&;BRnP0JO[m+<Z%S
3&E6F+<VdL+FG:S0d%Sr+<VdL+FG:d+>Y,_+?L#>Hqng%CM=n6+<VdL+<VeS85^Qh0etI++<VeS
+>Gl/0H_J\+<Z%S+>Fuo0d%S]+<Z%S0d&5++<W`T$@G-UFCAm(+<VdL+<VdLHq7-X2`3HO+<VdL
Hlt:'/heCj+<VeS+<WE^0fL3t+<VeS+>P&o2]s5)%17JNASu'g+<VdL+<VdL+FH^X+?);91a!n`
+FG:k3A*03+<VdLHlsOf+<WZe+<VdLHlt3f2]s4c3t2OE7;cgO+<VdL+<VdL+<Z&&;BRqT0K:0t
+<Z%S2)R!?+<VdL+FG:S1a"M,+<VdL+FG:g+>GPm+?L#>Hq&$k@;KUcF`\`K+<VeS85^Qi2_m?8
+<VeS+>G`+2'="a+<Z%S+>k8s1E[e_+<Z%S2'=Y1+<W`T$@GQVEbf)m+<VdL+<VdLHq7-X3&`fO
+<VdLHlt=$/i=ao+<VeS+<WNa1GL!p+<VeS+>k8t0d%T#%17JKCiF'!Eaa'9+<VdL+FH^X+>G_r
+<VdL+FG:j1bLX.+<VdLHlsOi+>Yhs+<VdLHlt<i1H-F!3t2OE6tpURA76T'+<VdL+<Z&&;BR\R
3$9=d+<Z%S1,gg>+<VdL+FG:S2]s5'+<VdL+FG:j+>GYp+?L#>Hq7[_@;I&/+<VdL+<VeS85^Qg
0fL3t+<VeS+>u232'="a+<Z%S+?1K"1*@\^+<Z%S3$:"8+<W`T$@GQZDJN[$+<VdL+<VdLHq7-X
3AE62+<VdLHlt7+/i=ao+<VeS+<WZe1,g<u+<VeS+?:Q#0d%T#%17JKCh.*d@<,do+<VdL+FH^X
+>G]12]s4c+FG:i1+k7'+<VdLHlt-u+<WB]+<VdLHlt-u+>b2`3t2OE;JBcTC`jiC+<VdL+<Z&&
;BR\Q0f'pp+<Z%S1H-pD+<VdL+FG:d0d&;,+<VdL+FG:d0d&;/+?L#>Hp_=]ASc0k+<VdL+<VeS
85^Qb2_[36+<VeS+?2>52'="a+<Z%S0eje-0H_J\+<Z%S0eje-2'=si$@G0OCi!O%EbTb@+<VdL
Hq7-X0fM*H+<VdLHlt:%/heCj+<VeS+>GSn2)$-q+<VeS+>GSn2)?@:%17JOCi3['BHSE?+<VdL
+FH^X+>Gf80d%S]+FG:j1bLI)+<VdLHlt-u+>khq+<VdLHlt-u+>ktu4!5q;Ci3['BHV#,+@SXt
.1HW36#:FQCgh0'+<VdL+<Z&&;BR\S0Jago+<Z%S1c-gB+<VdL+FG:d1*@\o+<VdL+FG:d1*ACr
+?L#>HpVCdASc!jF`V+:+<VeS85^Qc0K(X.+<VeS+>kr-0H_J\+<Z%S0esk,0H_J\+<Z%S0esk,
1E\ag$@GcdEbTZ;+<VdL+<VdLHq7-X1,M!G+<VdLHlt1)/heCj+<VeS+>GYp0ea^m+<VeS+>GYp
0f'q6%17JKA8#Cl@3?[8+<VdL+FH^X+>Pi03$9=d+FG:d2D-j0+<VdLHlt."+>Pbr+<VdLHlt."
+>Pku4!5q;A79Le+DG^9771'(%17JZEc5H5Df-[?+<VdL+FH^X+>Pr61E[e_+FG:h0eP.&+<VdL
Hlt.#+<WK`+<VdLHlt.#+?(Dc3t2OE:iC/dFa,#O+<VdL+<Z&&;BR_T3A;Qu+<Z%S2`!'D+<VdL
+FG:d1a!o$+<VdL+FG:d1a"M/+?L#>HpMRfBOPpl+<VdL+<VeS85^Qd2`*K:+<VeS+>Yr/0H_J\
+<Z%S0f:(21*@\^+<Z%S0f:(22'=si$@G`_B6A$5F!)SJ+<VdLHq7-X1H@EM+<VdLHlt:+/heCj
+<VeS+>Gbs1GU'q+<VeS+>Gbs1H$@;%17JNASu'gDeri)+<VdL+FH^X+>br31a!n`+FG:i0J54*
+<VdLHlt.'+>GYp+<VdLHlt.'+>Gbs3t2OE7qlOP@;$c++<VdL+<Z&&;BReS2DQBt+<Z%S1,pmD
+<VdL+FG:d3$:%3+<VdL+FG:d3$:%6+?L#>HrFuu@ppK&+<VdL+<VeS85^Qf0Jta2+<VeS+>Yi,
2'="a+<Z%S0f^@53?TFe+<Z%S0f^@61*AXf$@G-[@ruj6F`SZJ+<VdLHq7-X2)@'C+<VdLHlt=)
/heCj+<VeS+>PVn1H?R#+<VeS+>PVn1bp18%17JdF^ep"ASc!jDKTE&+FH^X+>l#40d%S]+FG:f
0J5%%+<VdLHlt1!+>G\q+<VdLHlt1!+>Ghu3t2OE6#:LRARf4Y+<VdL+<Z&&;BRhU3AVd#+<Z%S
2_m!C+<VdL+FG:e0d&>5+<VdL+FG:e1*A8*+?L#>HpMXl@<,q#+<VdL+<VeS85^Qg0f(X/+<VeS
+>Gl/0H_J\+<Z%S1,9t01*@\^+<Z%S1,9t02BY'j$@Gc\@VKU#+<VdL+<VdLHq7-X2D[9O+<VdL
Hlt4!/heCj+<VeS+>P_q1G^-r+<VeS+>P_q1H-F<%14Nn$4R>26WHrkF*'rn9keKd4ZX]S6WHZt
9keKd+AQT=6WHrkF*%iu%15is/g+\=F(96%E+*WoGp$s<DKU&4F!*%W4?=TB+Dkh1Et&IoA927"
@<6NR3ZohmD/!m/+@SXt:gnEe89.F=DK@6L/Kf.PBl7u74s2X(HQk0e4tq=YBM`,YFAc[k%14s8
4usfM/h\>pDIdfuE+*g0%15is/g,4PDfp/@F`\`R771&tEbTT+F(KG9E+*g0+Dkh1F`_1;A8,Xf
ATD@"@qB^/%15is/g,4PDfp/@F`\a:F*(i4+Dt_2@rPjtF:AQd$;No?+EMC<F`_SFF<DrKDfTr5
ATDZ2BOu$pF)Yf(Eb-A'F`MM6DKI!a4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zt/%$;P8%F`MLc3Zr6W
@psInDf/p-ASc1$GB7kEDIn8>1,(I>+>Y,q2[p*hBL?o_E`-Ii4ZX]\BL?o_EZf7.G$f?0A79a+
0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp#jq6ZmEi;IsnY$4R>;BLP9g6ZmEi4ZX]>+?CW!%14U;
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5=_2DcDg-8EDf0,//Kdi*A0=?M
Bln$#F_i0oDe!3tBl@l3+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d+<Z%@
$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm+@0ITG%E6rDfU/O%17J*+<VdL+<VdL+<VdL+<Vd^
1c@$A1GCF?2'>M6Ch[<q+<VdLHjpF1+<VdL+<VdL+?))/1b^jF0f([G3&*0F3Ar#*PZ/bJ+<VdL
+<Z%@$@Es=+<VdL+<VdL+<VdL+<Y#G0eb4>1,h3K+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL
+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<WEn1,C%UARTU%
+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WH_9lFokBHSE?+<Z%@$@Es=+<VdL+<VdL
+<VdL+<VdL+<Vd^2_HjC+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BZ"!
6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+
/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@GTWD.Oh4+<VdL+<VdL
HphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm+@SXt/Q?aB89.F=DEA:7.kN>)/M/P+
/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@G6QDIm9qCgeG/+<VdL
Hq7-X1c7'G+<VdLHlt=$/heCj+<VeS+<W?\2)ZR"+<VeS+>=oq2*26SHq.m^DII3$+<VdL+<VeS
85^Qe2E!<5+<VeS+>Po/0H_J\+<Z%S+>Fuo1*@\^+<Z%S0d&5+3t2OE;fHG\@3?[8+<VdL+<Z&&
;BRhN2)ZR"+<Z%S1Gg^A+<VdL+FG:S1*AA.+<VdL+FG:e+>Y]5%17JKEas36EclFG+<VdL+FH^X
+>kr30H_J\+FG:i1bLX.+<VdLHlsOf+>P\p+<VdLHlt3f1,1j"$@H$"@V'FgChI<sF^f&-Hq7-X
2)R0E+<VdLHlt1)/i=ao+<VeS+<WH_2)cX#+<VeS+>Y,t2EM?THpMRfBOt[`@3?[8+<VeS85^Qf
2`WZ:+<VeS+?)&.0H_J\+<Z%S+>b2t0d%S]+<Z%S1a"V/3t2OE6#LdQEb0;7+<VdL+<Z&&;BRkP
1Gg3s+<Z%S0f^j?+<VdL+FG:S2'=\5+<VdL+FG:h+>Yi9%17J]@:Eqd+<VdL+<VdL+FH^X+>u#7
3$9=d+FG:f0J5%%+<VdLHlsOi+>Gbs+<VdLHlt<i0f;$%$@G`[F(&lu@:s^o+<VdLHq7-X2Dm?M
+<VdLHlt:+/heCj+<VeS+<WQb1bg*q+<VeS+>t>u3BIZWHqRmjF!*bkF*)G2Ch[s<85^Qg3&`i?
+<VeS+>GT'0H_J\+<Z%S+?(E!0H_J\+<Z%S2]sk93t2OE<b5oP+<VdL+<VdL+<Z&&;BRnP0JO[m
+<Z%S3&E6F+<VdL+FG:S2]sq4+<VdL+FG:j+>bf7%17JXF`(u/+<VdL+<VdL+FH^X+?)#10d%S]
+FG:d3A*03+<VdLHlsOk+<WB]+<VdLHltBk0KT^NHpMRj@;0a)+<VdL+<VeS85^Qh2)R<8+<VeS
+>ku.2'="a+<Z%S+?1K$2BX+b+<Z%S3$:(93t2OE6tL7I@NZd9+<VdL+<Z&&;BRnY1,L*r+<Z%S
3&rTF+<VdL+FG:S3?U.:+<VdL+FG:l+>br;%17JODJ<]*+<VdL+<VdL+FH^X+?2/23$9=d+FG:h
2(ga/+<VdLHlt-t+>c)$+<VdLHlt-t+>c&>%17JPDf&p!BOQ%*+<VdL+FH^X+?2;83$9=d+FG:d
2D-[++<VdLHlt.!+<WH_+<VdLHlt.!+>Gqe$@GQVEbf)m+<VdL+<VdLHq7-X3&`fO+<VdLHlt=%
/heCj+<VeS+>GVo0ea^m+<VeS+>GVo3'.QVHpMRfBOu3mFF#&P+<VeS85^Qb2'="a+<VeS+?)/1
0H_J\+<Z%S0f'q,1E[e_+<Z%S0f'q,1-5pPHph[fBOkNo+<VdL+<VeS85^Qb3&i$'+<VeS+>Pl.
2'="a+<Z%S0f'q/3$9=d+<Z%S0f'q/2`hHUHq7[_@;I&/+<VdL+<VeS85^Qg0fL3t+<VeS+>u54
0H_J\+<Z%S0f:(.1*@\^+<Z%S0f:(.0KT^NHqe0iCLM6++<VdL+<VeS85^Qj0ejdn+<VeS+>c)2
2'="a+<Z%S0fC-s2BX+b+<Z%S0fC.33t2OE6#:(C@UX:cDBL&E+<Z&&;BR\N2)cX#+<Z%S2DQm=
+<VdL+FG:d2]sq2+<VdL+FG:d2]sn:3t2OE;JBcTC`jiC+<VdL+<Z&&;BR\Q0f'pp+<Z%S1H-pD
+<VdL+FG:d3$9q8+<VdL+FG:d3$9q73t2OE6XaqFCi!N&+<VdL+<Z&&;BR\Q0K:0t+<Z%S3&iNJ
+<VdL+FG:d3$9t2+<VdL+FG:d3$9q93t2OE6=jtL@<?O(GT\+O+<Z&&;BR\Q3A;Qu+<Z%S2)6d<
+<VdL+FG:d3$9t:+<VdL+FG:d3$9t93t2OE7;QjMFD)d>+<VdL+<Z&&;BR\Q3ADX!+<Z%S2`*-@
+<VdL+FG:d3$:"2+<VdL+FG:d3$9t:3t2OE6#:FQCgh0'+<VdL+<Z&&;BR\S0Jago+<Z%S1c-gB
+<VdL+FG:d3$:%3+<VdL+FG:d3$:";3t2OE6=k7MChI=%F(HI:+<Z&&;BR_K2DH<s+<Z%S2)?j=
+<VdL+FG:d3$:(=+<VdL+FG:d3$:(<3t2OE;e^8dF`SZJ+<VdL+<Z&&;BR_O3ADX!+<Z%S1-$s@
+<VdL+FG:d3?U.=+<VdL+FG:d3?U.<3t2OE6"FY;Ea^(5+<VdL+<Z&&;BR_Q0fU9u+<Z%S0fCXA
+<VdL+FG:e0H_Jn+<VdL+FG:e0H`)3%17JZEc5H5Df-[?+<VdL+FH^X+>Pr61E[e_+FG:h0J54*
+<VdLHlt0u+>bks+<VdLHlt0u+>bi8%17JZDes64GT\+O+<VdL+FH^X+>Pr;0H_J\+FG:j1G1O-
+<VdLHlt0u+>c)$+<VdLHlt0u+>c&>%17JKCiF&rEb$:8+<VdL+FH^X+>Yr53$9=d+FG:f2_Hd,
+<VdLHlt1"+>Y_p+<VdLHlt1"+>Y]5%17J\AS6.%F`SZJ+<VdL+FH^X+>Z#;1*@\^+FG:h2_Hs1
+<VdLHlt1#+>GSn+<VdLHlt1#+>GQ3%14Nn$4R>26WHKrEcO]k9keKd4ZX].771'GE_U7cF!+4k
771'BF`ML3$>sBq@q0Y%4ZX]6FDY`0F!*n=<C:nLE_(4FBl7u@+>"^XD/!m/+?go(+F>:e+?hK+
:2!";EcP&hEt&Hc$;No?+Co2-@rc."@;]S#+Dkh1F`_29+>"]u3Zp1#D/!m/%14j54usfM/h\>p
DIdfu@s)f$$;No?+EMC<F`_SFF<Dr"6WG7LBldj,ATT&)F`MM6DKI"<Bl8'8AKYMtAnGUpASu!h
F!hD(:-pQUF)>i<FDuAE+CoP8@<<W0A926jF`Iou%15is/g,4PDfp/@F`\`RDJsQ;BOu4%+D>>'
Ble6,ATD?)Ap&3<Eb-@94Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%15jD7Wif93Zr6W@psInDf/p-
ASc1$GB7kEDIn8>1,(O@+?(Du%15jD7WifNATL!q+AQT>F`\aD@<Q""De*:%+>=63:-pQUF)>i<
FDuAE+D,J4?Z^3s@<itjBL[,d;IsnY$4R>;BLP9g7Wif93Zp+!3Zp*c$7d\[/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17JcASc1$GB7kEDIjqB+AZfa+@]dRFD,9/C`lDi@psIn
Df-[?HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+>t?:@:q/cBl+t8+FFV*HlsOS+<VdL+<VdL
+<VdL+<VdL+<VdL+>GPm6"4bUAM$GkEdE*B$@Es=+<VdL+<VdL+<VdL+<WEr2E*HK1+kLC+A-cm
Bjkm%+<VeS%17J*+<VdL+<VdL3&`HI1c%*M1H7-L0etU?2^$D1<$3;++<VdL+FFV*HlsOS+<VdL
+<VdL+<VdL+C?iX0J5=?2`WW99Q+f]BlnK.AKZ@0$@Es=+<VdL+<VdL+<VdL+<VdL1c-gA2D@!I
+A?3cBlnK.AKW+C%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+>PW-1E]h3@<*J5+<VdLHjpF1+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+?(E;Df0Z1+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<Vd^
/i#:,6t(?nA7Qf*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdb+B;B.H6==Q+<VeS%14U;
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)h9/M/P+/M/P+/M/P+/M/J)/M/P+
/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;Hqn*eAKW*<+<VdL+<VeS6tLFRB5V."Bl@m:
<,sQVCih6sAS6BiE\0%'/P'nVBl8;@771',<,sQ]E_U7c3t2NI/M/P+/M/P+/M/P+/M/J)/M/P+
/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;Hr=Bo@;KUcB6@c.+<VeS85^Qg2)R97+<VeS
+>l,20H_J\+<Z%S+>=om3?TFe+<Z%S0H`),3t2OE94;sa+@1-kFE1f+BleYm;BRkW2`W!'+<Z%S
0ek:7+<VdL+FG:S0d%T!+<VdL+FG:d+>Z(g$@GlcB42o*+<VdL+<VdLHq7-X2_Zp?+<VdLHltC*
/i=ao+<VeS+<WB]1,0mo+<VeS+>Fun2*26SHqng%CM=n6+<VdL+<VeS85^Qh0etI++<VeS+>Gl/
2'="a+<Z%S+>Fuq0H_J\+<Z%S0d&8/3t2OE6#:XOBlY==+<VdL+<Z&&;BRnU2)cX#+<Z%S2)HpC
+<VdL+FG:S1*AA1+<VdL+FG:e+>Pr=%17JNASu'g+<VdL+<VdL+FH^X+?);91a!n`+FG:k3A*!.
+<VdLHlsOf+>Pes+<VdLHlt3f1,(d!$@G9[BkAJ1+<VdL+<VdLHq7-X3&<6J+<VdLHlt:(/i=ao
+<VeS+<WK`1,pC!+<VeS+>b2r1-5pPHq&$k@;KUcF`\`K+<VeS85^Qi2_m?8+<VeS+>Gc,0H_J\
+<Z%S+>k8u1*@\^+<Z%S2'=\43t2OE9jr'X@:C?%+<VdL+<Z&&;BRqX3&)Nu+<Z%S2DHg<+<VdL
+FG:S2'=_9+<VdL+FG:h+>bi8%17JKCiF'!Eaa'9+<VdL+FH^X+>G_r+<VdL+FG:j2(gR*+<VdL
HlsOi+>kns+<VdLHlt<i2)%*$$@G6UE+icj+<VdL+<VdLHq7-X0fV-8+<VdLHlt1(/heCj+<VeS
+<WTc1,g<u+<VeS+?(Du2*26SHq7[_@;I&/+<VdL+<VeS85^Qg0fL3t+<VeS+>u540H_J\+<Z%S
+?1K$0d%S]+<Z%S3$:%;3t2OE9kA3X@<*J5+<VdL+<Z&&;BRtS0d%S]+<Z%S2)$X:+<VdL+FG:S
3?U.:+<VdL+FG:l+>bl9%17JKCh.*d@<,do+<VdL+FH^X+>G]12]s4c+FG:i1+k7'+<VdLHlt-u
+>Gl!+<VdLHlt-u+>Gf:%17J\BkM!n+<VdL+<VdL+FH^X+>Gf01E[e_+FG:f2_Hs1+<VdLHlt-u
+>l)#+<VdLHlt-u+>l#<%17JM@;odoCgeG/+<VdL+FH^X+>Gf/3$9=d+FG:k3%d'2+<VdLHlt.!
+<WB]+<VdLHlt-u+>l)>%17JLASc0kFE2)?+<VdL+FH^X+>Gf80H_J\+FG:h1+k7'+<VdLHlt.!
+<WWd+<VdLHlt.!+>u:j$@G9YDIIX#+<VdL+<VdLHq7-X0fM*I+<VdLHlt@)/heCj+<VeS+>GVo
0ea^m+<VeS+>GVo2`hHUHpMRdBl%3p+<VdL+<VeS85^Qb3A<63+<VeS+>bo-2'="a+<Z%S0esk+
3?TFe+<Z%S0esk+2`hHUHpVCdASc!jF`V+:+<VeS85^Qc0K(X.+<VeS+>kr-0H_J\+<Z%S0esk-
3$9=d+<Z%S0esk-2EM?THrFa"Bm"J>+<VdL+<VeS85^Qc1c[95+<VeS+>Pr00H_J\+<Z%S0f'q-
2]s4c+<Z%S0f'q-2EM?THpM:V@<,d!+<VdL+<VeS85^Qc2DI06+<VeS+>Gc,2'="a+<Z%S0f'q/
0d%S]+<Z%S0f'q.3BIZWHr+j%@sN!1+<VdL+<VeS85^Qc3A`N7+<VeS+>ki*2'="a+<Z%S0f1".
1*@\^+<Z%S0f1".0KT^NHr+`tCistF+<VdL+<VeS85^Qc3B8c9+<VeS+?))/2'="a+<Z%S0f1".
3$9=d+<Z%S0f1".2EM?THpMRfBOPpl+<VdL+<VeS85^Qd2`*K:+<VeS+>Yo.2'="a+<Z%S0fC./
0H_J\+<Z%S0fC.63t2OE;IsK`CiseA+<VdL+<Z&&;BRbU3&2U!+<Z%S2)d-F+<VdL+FG:d2BXk3
+<VdL+FG:d2BXh93t2OE6tL7I@W-'k+<VdL+<Z&&;BReR1Gg3s+<Z%S2D?a;+<VdL+FG:d3$:"3
+<VdL+FG:d3$9t:3t2OE7qlOP@;$c++<VdL+<Z&&;BReS2DQBt+<Z%S1,pm?+<VdL+FG:d3$:(<
+<VdL+FG:d3$:(93t2OE;fHG\@3?[8+<VdL+<Z&&;BRhN2)ZR"+<Z%S1Gg^<+<VdL+FG:e0H_Js
+<VdL+FG:e0H`26%17JKEas36EclFG+<VdL+FH^X+>kr30H_J\+FG:i1bLX.+<VdLHlt0u+>l)#
+<VdLHlt0u+>l#<%17JdF^ep"ASc!jDKTE&+FH^X+>l#40d%S]+FG:e3A*03+<VdLHlt1!+>Ybq
+<VdLHlt1!+>Y]5%17JKCiF'!@q/pi+<VdL+FH^X+>l)<1E[e_+FG:j1+k7'+<VdLHlt1"+>G_r
+<VdLHlt1"+>G]7%17JKDKK<-ATJt:+<VdL+FH^X+>tr11a!n`+FG:d3A*!.+<VdLHlt1#+>GSn
+<VdLHlt1#+?2Fl$@Gc\@VKU#+<VdL+<VdLHq7-X2D[9O+<VdLHlt4!/heCj+<VeS+>P_q2)69s
+<VeS+>P_q1c[W,$7QDk%15Nk<CV+Q89.F=DK@s%+@SXt89.F=DK?pqBLP9g7Wie^$>sBq@qKk*
4ZX]6FDY`0F!*n=<CV+Q89.F=DK@6L/Kf.PBl7u74s2X(HQk0e4tq=YBL[,d;IsnY$;No?+Co2-
@rc."@;]S#+Dkh1F`_29+>"]u3Zp@(D/!m/%15$:4usfM/h\>pDIdfuAp&2)$;No?+EMC<F`_SF
F<Dr"6WG7LBldj,ATT&,F`_bHAKYi(DKU&4+Co1uAn?!oDI[7!-OgDX67sC%D/XQ=E-67FA92j$
F<GI3F(8g)F:AQd$;No?+EMC<F`_SFF<Dr"6WG7LBldj,ATT%i:Jt._+@pNIBl5&*Eb05DF*(i4
F!*V/4Ztqk4Ztqk4Ztqk4Zt/%$;No?+CoP'D/!lN3ZrffA926jF`K$NA926mF`]0PA927"@<6N"
$;No?+EMC<F`_SFF<EbcAo_I&+CoP'D/!ks$;No?+EMC<F`_SFF<G+8FCB86A926tBl4@e%15is
/g,4PDfp/@F`\`RF)Q2CBOu4%+D>>'Ble6,ATD?)E+*g0+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4ZtqU%16$I:gnEe4ZX^%De!3tBl@lrF_l2@FabGf3AWN82]t!f$<(V7@<6NgATL!q+B)rM@<6N5
DII]qFDk\uGp"dM$;No?+EMC<F`_SFF<G14FC0-.A79a+;eT!9F*(;kEt&Hc$<(V,6WHrkF*'Q+
+>=p!+>=63.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5<GZeuFW`7YF*(i2
+E1b0FEo!>Bl7L&+A?]`@<?4%DBL'L%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d
+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+>k9-@W-F$/P'f#H@-//HlsOS+<VdL1,LaF3B0#O
0ebF=2E!HO2]t_8Ch[<q+<VdLHjpF1+<VdL+<Vdd/hf:>3&30B2`*9H2`*BJ+O63N+<VdL+<VdL
HjpF1+<VdL+<VdL+<VdL+<Vd]1GLL90f_'F+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<Y#H
2(g[A1GCO+9OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<WC!1Gp:XARTU%+<VdL+FFV*
HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2]th5DKKP7+<VdLHjpF1+<VdL+<Vda/iGC?0fCpJ2E!HO
2E!HP+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<Ve63A*03<E)>3+<VdL+<Z%@$7d\[
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+
/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JX@;TQu+<VdL+<VdL+<Z&"ATMQuDIIX$Df0r%
E\0RnF=fmlB7*[!/M].789.F=DL<Qq6WG^;E\0h&9keK,%14U;/M/P+/M/P+/M/P+/M/J)/M/P+
/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;HqRmjF!*bkF*)G2Ch[r5Hq7-X2E3WU+<VdL
HltC'/heCj+<VeS+<W?\0f:'r+<VeS+>=om3BIZWHrafk@3?[8+<VdL+<VdLHq7-X2_Zp?+<VdL
Hlt1&/heCj+<VeS+<W?\1GBpo+<VeS+>=oo1-5pPHqng%CM=n6+<VdL+<VdLHq7-X2_d'B+<VdL
HltC//heCj+<VeS+<W?\1c?I!+<VeS+>=oq0KT^NHpMRj@;0a)+<VdL+<VdLHq7-X2`3HO+<VdL
Hlt:)/heCj+<VeS+<WB]1c$6s+<VeS+>Fuq2EM?THr+B_@rGjm+<VdL+<VdLHq7-X2`E`N+<VdL
Hlt:+/i=ao+<VeS+<WE^0f:'r+<VeS+>P&p0fogOHphO`ARZc)+<VdL+<VdLHq7-X2`WWM+<VdL
Hlt.(/i=ao+<VeS+<WE^1Gg3s+<VeS+>P&q2EM?THpqpeAfr3=+<VdL+<VdLHq7-X3&<6J+<VdL
Hlt:(/heCj+<VeS+<WH_1H$?u+<VeS+>Y,r3BIZWHpMRd@;0a)+<VdL+<VdLHq7-X3&EBJ+<VdL
Hlt=,/heCj+<VeS+<WH_2)ud%+<VeS+>b2s3t2OE7W3-PChR7"F<D\K+<VeS85^Qi2_m?8+<VeS
+?2522'="a+<Z%S+>b2t3?TFe+<Z%S1a"Y23t2OE9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7+<VeS
+>ki*0H_J\+<Z%S+>b2u2BX+b+<Z%S1a"Y93t2OE6#:LRATD4$H6==Q+<VeS85^Qb2'="a+<VeS
+>Yo.0H_J\+<Z%S+>k9!3?TFe+<Z%S2BXe;%17JKDJNZh+<VdL+<VdL+<Z&&;BRt[+<VdL+<Z%S
2_m!C+<VdL+FG:S2BX_5+<VdL+FG:i+>PZ5%17J]@q]Fa@<*J5+<VdL+<Z&&;BR\P3$9=d+<Z%S
+?1u2+<VdL+FG:S2BXe1+<VdL+FG:i+>Yl:%17JNBlI`r@3?[8+<VdL+<Z&&;BR\R3$9=d+<Z%S
3&<0@+<VdL+FG:S2BXe5+<VdL+FG:i+>Yu=%17JK@q]FoDIIQ.+<VdL+<Z&&;BReT1*@\^+<Z%S
2)m3B+<VdL+FG:S2]sk9+<VdL+FG:j+>Yc7%17JR@;TFh+<VdL+<VdL+<Z&&;BRkP2]s4c+<Z%S
1bgU?+<VdL+FG:S2]st;+<VdL+FG:k+>Gqe$@G-L@;TFn+<VdL+<VdL+FH^X+?2A?+<VdL+FG:j
2(gR*+<VdLHlsOk+>khq+<VdLHltBk2)76&$@GQZDJN[$+<VdL+<VdL+FH^X+?;/2+<VdL+FG:i
0eP.&+<VdLHlsOk+>kqt+<VdLHltBk2)[N*$@GQ^Eb8`q+<VdL+<VdL+FH^X+>GQ)2]s4c+FG:d
2(gR*+<VdLHlsOl+>GYp+<VdLHltEl0fV6($@G-UA7]4YEa`i.+<VdL+FH^X+>G]12]s4c+FG:g
3%d'2+<VdLHlt-t+>Pht+<VdLHlt-t+>Pr=%17J\BkM!n+<VdL+<VdL+<Z&&;BR\Q0f'pp+<Z%S
2`!'?+<VdL+FG:d0d%Sr+<VdL+FG:d0d&G;%17JM@;odoCgeG/+<VdL+<Z&&;BR\Q0K:0t+<Z%S
0fUdC+<VdL+FG:d0d%Sr+<VdL+FG:d0d&2)3t2OE6=jtL@<?O(GT\+O+<VeS85^Qb2`WQ7+<VeS
+>l,22'="a+<Z%S0eje*2'="a+<Z%S0eje*3BIZWHpqjh@<?0*+<VdL+<VdLHq7-X0fM*I+<VdL
Hlt4'/heCj+<VeS+>GSn0fC-s+<VeS+>GSn1,(d!$@G-UDJ<oqD'0rD+<VdL+FH^X+>Gl11E[e_
+FG:i2D-[++<VdLHlt-u+>Pht+<VdLHlt-u+>Y]5%17JLATVL"B4Z4,AKW*<+<Z&&;BR_K2DH<s
+<Z%S2)d-F+<VdL+FG:d0d&;1+<VdL+FG:d0d&;53t2OE6XakNE-64E+<VdL+<VeS85^Qc1GUj2
+<VeS+>tu-2'="a+<Z%S0esk+2BX+b+<Z%S0esk+2`hHUHrFa"Bm"J>+<VdL+<VdLHq7-X1,M!G
+<VdLHltC'/i=ao+<VeS+>GVo1Gp9t+<VeS+>GVo1H7H*$@G-MBOPpi+<VdL+<VdL+FH^X+>Pi0
3$9=d+FG:k2D-j0+<VdLHlt.!+>c)$+<VdLHlt.!+>ko9%17JZEc5H5Df-[?+<VdL+<Z&&;BR_T
1c$6s+<Z%S2*!9H+<VdL+FG:d1E\G5+<VdL+FG:d1E\J/3t2OE:iC/dFa,#O+<VdL+<VeS85^Qc
3B8c9+<VeS+>Yo.2'="a+<Z%S0f'q.1a!n`+<Z%S0f'q.3'.QVHpMpiDfQsC+<VdL+<VdLHq7-X
1G^^D+<VdLHlt:)/heCj+<VeS+>G\q0f1!q+<VeS+>G\q0f;$%$@GcpBOPUk+<VdL+<VdL+FH^X
+>Yo31a!n`+FG:j1+k7'+<VdLHlt.#+>l,$+<VdLHlt.$+>Gqe$@G-UE+i[#A0<!;+<VdL+FH^X
+>Yr53$9=d+FG:j1G1@(+<VdLHlt.$+>Get+<VdLHlt.$+>PW4%17J\AS6.%F`SZJ+<VdL+<Z&&
;BRbU3&2U!+<Z%S2)6dA+<VdL+FG:d2'=b9+<VdL+FG:d2BX_9%17JNASu'gDeri)+<VdL+<Z&&
;BReR1Gg3s+<Z%S1c[0G+<VdL+FG:d2]sn9+<VdL+FG:d2]sq33t2OE7qlOP@;$c++<VdL+<VeS
85^Qe2E!<5+<VeS+?2,/0H_J\+<Z%S0fU9u2'="a+<Z%S0fU:83t2OE6"=qXGT\+O+<VdL+<VeS
85^Qe2`!-1+<VeS+>ko,2'="a+<Z%S0fU:12'="a+<Z%S0fU:13BIZWHq.UTEclUL+<VdL+<VdL
Hq7-X1cI<K+<VdLHlt:+/i=ao+<VeS+>Ghu1,'gn+<VeS+>Ghu1,D!$$@G-UBlA*,+<VdL+<VdL
+FH^X+>c)42'="a+FG:S3%d'2+<VdLHlt.'+>bks+<VdLHlt.'+>bu<%17J]E+rfj+<VdL+<VdL
+<Z&&;BRhN2)ZR"+<Z%S2`33F+<VdL+FG:d3?U%5+<VdL+FG:d3?U%83t2OE6#:=FBk/>/+<VdL
+<VeS85^Qf0f^s2+<VeS+>G`+0H_J\+<Z%S0f^@42]s4c+<Z%S0f^@50KT^NHq7[V@<*J5+<VdL
+<VdLHq7-X2)7'K+<VdLHlt:(/i=ao+<VeS+>Gl!2)-3r+<VeS+>Gl!2)[N*$@GQZDJNg$F<D\K
+<VdL+FH^X+>ko63$9=d+FG:j3A*03+<VdLHlt.(+>l#!+<VdLHlt.(+>l/@%17JKEas36EclFG
+<VdL+<Z&&;BRhQ1b^$p+<Z%S1c6m>+<VdL+FG:e0H_Jq+<VdL+FG:e0H`>:%17J\BkM-r+A69`
FCB<4F`Vq$;BRhR2)ud%+<Z%S2)R!?+<VdL+FG:e0H`,0+<VdL+FG:e0H`/,4!6h*E+iZ&6Y1.W
@<HU)%17JdF^ep"ASc!jDKTE&+<Z&&;BRhS1GL!p+<Z%S3%usB+<VdL+FG:e0H`/3+<VdL+FG:e
0H`2.3t2OE6#:LRARf4Y+<VdL+<VeS85^Qf2`WZ:+<VeS+>Yr/2'="a+<Z%S1,0n,1a!n`+<Z%S
1,0n,2EM?THpMXl@<,q#+<VdL+<VdLHq7-X2DI!E+<VdLHltC./i=ao+<VeS+>P\p0fL3t+<VeS
+>P\p1,1j"$@Gc\@VKU#+<VdL+<VdL+FH^X+>u#73$9=d+FG:k0J54*+<VdLHlt1"+>l,$+<VdL
Hlt1#+>Q"f$@Gcc@<HBp+<VdL+<VdL+FH^X+>u)42]s4c+FG:j3%d'2+<VdLHlt1#+>PYo+<VdL
Hlt1#+>Pf9%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT2)ZR"+<Z%S2)6d<+<VdL+FG:e1E\G/+<VdL
+FG:e1E\G23t2OE7;R'SDJ<u2+<VdL+<VeS85^Qg2_[*3+<VeS+>GZ)0H_J\+<Z%S1,C%02BX+b
+<Z%S1,C%03'/6OFCB$#D@Hq%%13OOF%&Gr:gnEe89.F=DK@s%+@SXt89.F=DK?q!BLP9g:gnEe
%17/eF(9/tF*'Q++=M>KBl7u7F%&Gr:gnEe89.F=DK@6L/Kf.PBl7u74s2X(HQk0e4tq=^BM`,Y
FAc[k%15is/g+\=F(96%E+*WoGp$s<DKU&4F!*%W4?=TC+Dkh1Et&I7+?hh/4t\K2Huih>@rPjt
F:AQd$;No?+EMC<F`_SFF<Dr"6WG7LBldj,ATT&6@<6N5D/!m1FCcS*BkCsgEb0,uATJtm:K:@b
-OgDX67sC%D/XQ=E-67FA92j$F<GX8F(9/tF*%iu%15is/g,4PDfp/@F`\`RF)Q2CBOu4%+D>>'
Ble6,ATD?)@s)g4ASuT44Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%16$I6ZmEi4ZX^%De!3tBl@lr
F_l2@FabGg0JYF,1E\G3%16$I6ZmEi;Iso43Zq@76ZmEi+DtV2?Z^3s@<itL%15is/g,4PDfp/@
F`\a<D00-,De*:%+B)r@F`MM#ATJ:f%16$I771'BF`MLc3Zp+!3Zp*c$7d\[/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;HrY!*EciKV+EMX5EZf=0EccRLA8,pmEZe%o@psInDf-[?
HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdb+AH9W/PKkq+<VeS%17J*+<VdL+<VdL+<VdL+<VdL
+<VdL+<WNa6"4bUAM$GkEdE*B$@Es=+<VdL+>Pc30JG::/ho%:0fCpJ2E)aNF_kc#DBL&E+FFV*
HlsOS+<VdL2`!'C0K1gC1Gq*N0etRG2B^;0<$3;++<VdL+FFV*HlsOS+<VdL+<VdL+<VdL0f(O:
0JPRE0d'/.DJ*[*F_#&+HjpF1+<VdL+<VdL+<VdL+<Ve61,U[?1c$g?+A?3cBlnK.AKW+C%17J*
+<VdL+<VdL+<VdL+<VdL+<Vd^0JYF,=_2#^+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL
+>Y-7Df0Z1+<VdL+FFV*HlsOS+<VdL1,^aC0JkLB2E!HO2E!HO2]tLsGqNW<+<VdLHjpF1+<VdL
+<VdL+<VdL+<VdL+<VdL?TB_r+B;B.H6==Q+<VeS%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/I^$7d\[/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+
/M/P+.h)i5:18!N+<VdL+<VdL+<VeS6tLFRB5V."Bl@m:<,sQVCih6sAS6BiE\0%'/P'nVBl8;@
771',<,sQ]E_U7c3t2NI/M/P+/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+
/M/P+/M/I^$@G6QDIm9qCgeG/+<VdL+FH^X+>br31a!n`+FG:h0J5%%+<VdLHlsOc+>PYo+<VdL
Hlt*c1,(d!$@G?XAStpi+<VdL+<VdL+FH^X+>bu71*@\^+FG:k1+kF,+<VdLHlsOc+>c&#+<VdL
Hlt*c1c@E)$@G-LEclUL+<VdL+<VdL+FH^X+>c#50H_J\+FG:h1+k7'+<VdLHlsOc+>l/%+<VdL
Hlt*c2)dT+$@G?P@rc^:+<VdL+<VdL+FH^X+>c#81E[e_+FG:h3%cm-+<VdLHlsOd+<WH_+<VdL
Hlt-d1-5pPHpMR_DffY8+<VdL+<VdLHq7-X1c[6I+<VdLHlsOl/heCj+<VeS+<WB]1,^6t+<VeS
+>Fuo2*26SHrFuu@ppK&+<VdL+<VdLHq7-X2)$mG+<VdLHlt@+/heCj+<VeS+<WB]2)cX#+<VeS
+>Fur2EM?THpMRa@;06p+<VdL+<VdLHq7-X2).*G+<VdLHlt.$/i=ao+<VeS+<WE^0f^@!+<VeS
+>P&o3'.QVHq7[V@<*J5+<VdL+<VdLHq7-X2)7'K+<VdLHlt:(/heCj+<VeS+<WE^1H$?u+<VeS
+>P&q1cl-RHqe0iCLqC*+<VdL+<VdLHq7-X2)7-N+<VdLHlt@./heCj+<VeS+<WE^1H6L"+<VeS
+>P&q2`hHUHpMd_FEMVHF!)SJ+<VdLHq7-X2)@'C+<VdLHlt7'/i=ao+<VeS+<WE^1cHO"+<VeS
+>P&r2EM?THr=ZkBl"nbASuTuF`MVGHq7-X2)I0N+<VdLHlt:'/i=ao+<VeS+<WH_0esjo+<VeS
+>Y,p0KT^NHs1Z%ASu'qB4Yt'@VHr-Hq7-X2)R0E+<VdLHltC'/heCj+<VeS+<WH_1,9sp+<VeS
+>Y,q0fogOHpMRfBOt[`@3?[8+<VdLHq7-X2)dNO+<VdLHlt4)/heCj+<VeS+<WK`+>t>b+<VeS
+>b2u3t2OE6#LdQEb0;7+<VdL+<VeS85^Qg0f(X/+<VeS+?2A60H_J\+<Z%S+>k8a0d%S]+<Z%S
1a"Y93t2OE;dj-LCEO`B+<VdL+<VeS85^Qg1H.99+<VeS+?2&-2'="a+<Z%S+>k8u1*@\^+<Z%S
2'=_03t2OE;eTT^CgeG/+<VdL+<VeS85^Qg2)7*5+<VeS+?)840H_J\+<Z%S+>t>b2'="a+<Z%S
2BXe;%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT2)ZR"+<Z%S2)6d<+<VdL+FG:S2BX,#+<VdL+FG:i
+>l4i$@G9YFCB'$DBL&E+<VdL+FH^X+>u/42'="a+FG:d1G1@(+<VdLHlsOi+>Pku+<VdLHlt<i
1,_3'$@GKTF`SZkF`VYF@;KY!+FH^X+>u2<3?TFe+FG:k0eP.&+<VdLHlsOi+>l#!+<VdLHlt<i
2)IB($@GlcB42o*+<VdL+<VdL+FH^X+?(u.0d%S]+FG:e2D-[++<VdLHlsOj+<WTc+<VdLHlt?j
2`hHUHqng%CM=n6+<VdL+<VdLHq7-X2_d'B+<VdLHltC//heCj+<VeS+<WTc1,^6t+<VeS+?(Du
2*26SHpMRj@;0a)+<VdL+<VdLHq7-X2`3HO+<VdLHlt:(/i=ao+<VeS+<WWd1,0mo+<VeS+?1K!
0KT^NHr+B_@rGjm+<VdL+<VdLHq7-X2`E`N+<VdLHlt:+/i=ao+<VeS+<WWd2)cX#+<VeS+?1K$
2*26SHphO`ARZc)+<VdL+<VdLHq7-X2`WWM+<VdLHlt.(/i=ao+<VeS+<WZe0esjo+<VeS+?:Q!
0fogOHpqpeAfr3=+<VdL+<VdLHq7-X3&<6J+<VdLHlt:'/i=ao+<VeS+>GPm0f1!q+<VeS+>GPm
0f(m#$@G-UDII7"+<VdL+<VdL+FH^X+?2252'="a+FG:i3%d'2+<VdLHlt-t+>Z##+<VdLHlt-t
+>Yr<%17JPDf&p!BOQ%*+<VdL+<Z&&;BRqX1,pC!+<Z%S3&WBC+<VdL+FG:d0d&52+<VdL+FG:d
0d&513t2OE9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7+<VeS+>c)22'="a+<Z%S0eje,2'="a+<Z%S
0eje,1cl-RHpMRfBOu3mFF#&P+<VdLHq7-X0f:'r+<VdLHlt4&/i=ao+<VeS+>GVo1H6L"+<VeS
+>GVo1H.B)$@G-WCLLWo+<VdL+<VdL+FH^X+?;G)+<VdL+FG:j1G1@(+<VdLHlt.!+>l&"+<VdL
Hlt.!+>l#<%17J]@q]Fa@<*J5+<VdL+<Z&&;BR\P3$9=d+<Z%S+?1u-+<VdL+FG:d1E\D++<VdL
+FG:d1E\\>%17JNBlI`r@3?[8+<VdL+<Z&&;BR\R3$9=d+<Z%S3&3*D+<VdL+FG:d1E\D.+<VdL
+FG:d1E\D-3t2OE6"=S>Ec,<++<VdL+<VeS85^Qe2_lKu+<VeS+>l,20H_J\+<Z%S0f1!q2]s4c
+<Z%S0f1"23t2OE87?@DC`jiC+<VdL+<VeS85^Qg0fL3t+<VeS+>bf*0H_J\+<Z%S0f1"/2]s4c
+<Z%S0f1"/2EM?THpM7ND..H-+<VdL+<VdLHq7-X3&ro?+<VdLHlt@*/heCj+<VeS+>G_r1,g<u
+<VeS+>G_r1,h9($@GQZDJN[$+<VdL+<VdL+FH^X+?;/2+<VdL+FG:i0J54*+<VdLHlt.$+>Ybq
+<VdLHlt.$+>Y`6%17JWBl[foCEO`B+<VdL+<Z&&;BR\J0fL3t+<Z%S0f1L?+<VdL+FG:d2'=b5
+<VdL+FG:d2'=b43t2OE6#:(C@UX:cDBL&E+<VeS85^Qb1c737+<VeS+>c&10H_J\+<Z%S0fL3t
2'="a+<Z%S0fL433t2OE;JBcTC`jiC+<VdL+<VeS85^Qb2_d*2+<VeS+?))/0H_J\+<Z%S0fL43
1a!n`+<Z%S0fL431-5pPHp_=]ASc0k+<VdL+<VdLHq7-X0fLdG+<VdLHlt.'/i=ao+<VeS+>Get
1c?I!+<VeS+>Get1c7?($@G0OCi!O%EbTb@+<VdL+FH^X+>Gf80H_J\+FG:h3%d'2+<VdLHlt.&
+>ktu+<VdLHlt.&+>kr:%17JOCi3['BHSE?+<VdL+<Z&&;BR\Q3ADX!+<Z%S1H$j>+<VdL+FG:d
2]st9+<VdL+FG:d2]st73t2OE6#:FQCgh0'+<VdL+<VeS85^Qb3A<63+<VeS+>u,10H_J\+<Z%S
0fU9u2'="a+<Z%S0fU:43t2OE6=k7MChI=%F(HI:+<VeS85^Qc0K(X.+<VeS+>l)10H_J\+<Z%S
0fU:21a!n`+<Z%S0fU:21HQ$QHp_=[DfBi?+<VdL+<VdLHq7-X1,C[D+<VdLHlt=&/i=ao+<VeS
+>Ghu2)69s+<VeS+>Ghu2)76&$@GcdEbTZ;+<VdL+<VdL+FH^X+>Pc60d%S]+FG:k0eP=++<VdL
Hlt.(+>G\q+<VdLHlt.(+>GZ6%17JKA8#Cl@3?[8+<VdL+<Z&&;BR_Q0fU9u+<Z%S3&WBH+<VdL
+FG:d3?U(9+<VdL+FG:d3?U(83t2OE:i^JaH#IRC+<VdL+<VeS85^Qc3A`N7+<VeS+>l/32'="a
+<Z%S1,'gn3$9=d+<Z%S1,'h03t2OE:iC/dFa,#O+<VdL+<VeS85^Qc3B8c9+<VeS+>Yo.2'="a
+<Z%S1,'h*1a!n`+<Z%S1,'h*1HQ$QHpMpiDfQsC+<VdL+<VdLHq7-X1G^^D+<VdLHlt:)/heCj
+<VeS+>PVn2)$-q+<VeS+>PVn2)%*$$@GcpBOPUk+<VdL+<VdL+FH^X+>Yo31a!n`+FG:j1+k7'
+<VdLHlt1!+>Ynu+<VdLHlt1!+>Yl:%17JKCiF&rEb$:8+<VdL+<Z&&;BRbS1cQU#+<Z%S2`!'D
+<VdL+FG:e0d&>3+<VdL+FG:e0d&>23t2OE;IsK`CiseA+<VdL+<VeS85^Qd3B/c:+<VeS+>kr-
0H_J\+<Z%S1,9t.2]s4c+<Z%S1,9t.2*26S.1HUn$?JX'<C:nLE_(4FBl7uT3ZpjY<Ch.)Bl7u7
;eSTe<C:nLEX`@sA926jF`MLc3ZohmD/!m/+EKt=<C:nLE_(4FBl7u@+>"^XD/!m/+?go(+F>:e
+?hK+;eSO@EcP&hEt&IO67sBkBldd)AT2'q@sK26Bl8'8ATJtG+?V\-1*CFJDK?6o1*AbA+?hD2
+FJ6@F(8^&EcMTr%15is/g,4PDfp/@F`\`RF)Q2CBOu4%+D>>'Ble6,ATD?)Ap&3<Eb-@V4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4ZtqU%16$I7Wif93Zr6W@psInDf/p)Cisc@INUC"1c$75+>OB5;eSXC
FAc[k4ZX]aBL[,d+DtV2?Z^3s@<itL%13OO;eSTe<CV+Q4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@GiiF`MUI/Kf+V@<*K0@<-I8+Co2(ATAneDe!3tBl@l3
+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2BY_&B.ZekD'0rDHjpF1+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vda+@0ITG%E6rDfU/O%17J*+<VdL+<WEr2E*HK1+k:81bgmH2E!K:8p+ra@;[21+<Z%@
$@Es=+<VdL+?2;42)I*K2`!EK3&*0G0K1-"PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+>GZ,
/hf"?1bg+HDf03%FEM,*+FFV*HlsOS+<VdL+<VdL+<VdL?SXJk1GgmA0d'.uFD5i>A7Zl+HjpF1
+<VdL+<VdL+<VdL+<VdL+<VdL1,(O@+B`8aEZcJI+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL
+<WTc9lFokBHSE?+<Z%@$@Es=+<VdL+>GK,0JkLB2E!HO2E!HO2E)aH@<jJ9A0<!;+FFV*HlsOS
+<VdL+<VdL+<VdL+<VdL+C@,]2'>mu6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P)%14U;/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+
/M/P+/Lq8;Hqn*eAKW*<+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm
+@SXt/Q?aB89.F=DEA:7.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+
/M/P+/M/P)%17JOCij*'Bl5%9+<VdL+<Z&&;BRkV0Jssq+<Z%S0f(F9+<VdL+FG:S0H_Jq+<VdL
+FG:c+>c.h$@GKTF`SZkF`VYF@;KY!+FH^X+>u2<3?TFe+FG:k0eP.&+<VdLHlsOc+>Ykt+<VdL
Hlt*c1GV$$$@GlcB42o*+<VdL+<VdL+FH^X+?(u.0d%S]+FG:e2D-[++<VdLHlsOc+>bu!+<VdL
Hlt*c1c7?($@GTkDJNr/+<VdL+<VdL+FH^X+?)#10d%S]+FG:k3A*!.+<VdLHlsOd+<WQb+<VdL
Hlt-d1HQ$QHpMRj@;0a)+<VdL+<VdLHq7-X2`3HO+<VdLHlt:(/i=ao+<VeS+<WE^+>=o\+<VeS
+>Fur3'.QVHr+B_@rGjm+<VdL+<VdLHq7-X2`E`N+<VdLHlt:,/heCj+<VeS+<WE^1H$?u+<VeS
+>P&q1HQ$QHphO`ARZc)+<VdL+<VdLHq7-X2`WWM+<VdLHlt.(/heCj+<VeS+<WE^2)$-q+<VeS
+>P&r3BIZWHpqpeAfr3=+<VdL+<VdLHq7-X3&<6J+<VdLHlt:'/i=ao+<VeS+<WH_2)??t+<VeS
+>Y,t0fogOHpMRd@;0a)+<VdL+<VdLHq7-X3&EBJ+<VdLHlt=,/i=ao+<VeS+<WK`0fU9u+<VeS
+>b2q2*26SHq&$k@;KUcF`\`K+<VdLHq7-X3&`TP+<VdLHltC,/heCj+<VeS+<WNa+?(Dc+<VeS
+>k9!3t2OE9jr'X@:C?%+<VdL+<VeS85^Qi2`NN7+<VeS+>c)20H_J\+<Z%S+>k8r1a!n`+<Z%S
2'=V/3t2OE6#:LRATD4$H6==Q+<VeS85^Qb2'="a+<VeS+>Yl-2'="a+<Z%S+>t>s2]s4c+<Z%S
2BX_33t2OE6#LIH@3?[8+<VdL+<VeS85^Qj3?TFe+<VeS+?))/2'="a+<Z%S+>t>u2'="a+<Z%S
2BXe33t2OE;e'KPA79L$+<VdL+<VeS85^Qb2E2g%+<VeS+<WWr0H_J\+<Z%S+>t?"0H_J\+<Z%S
2BXh83t2OE6tpURA76T'+<VdL+<VeS85^Qb3&i$'+<VeS+?2,/2'="a+<Z%S+>t?"1*@\^+<Z%S
2BXk23t2OE6"=S>Ec,<++<VdL+<VeS85^Qe2_lKu+<VeS+>l,22'="a+<Z%S+?(E"2BX+b+<Z%S
2]sq63t2OE87?@DC`jiC+<VdL+<VeS85^Qg0fL3t+<VeS+>bf*0H_J\+<Z%S+?1Ju2BX+b+<Z%S
3$9q43t2OE6"=>?@<*J5+<VdL+<VeS85^Qi3B&''+<VeS+?)/10H_J\+<Z%S+?:Pe2BX+b+<Z%S
3?U1@%17JWASu9lEZcJI+<VdL+<Z&&;BRtS0d%S]+<Z%S2D?a@+<VdL+FG:S3?U%2+<VdL+FG:l
+?;Lm$@GQ^Eb8`q+<VdL+<VdL+FH^X+>GQ)2]s4c+FG:d1bLX.+<VdLHlsOl+>Yhs+<VdLHltEl
1GLs#$@G-UA7]4YEa`i.+<VdL+FH^X+>G]12]s4c+FG:g3%cm-+<VdLHlt-t+>bnt+<VdLHlt-t
+>bi8%17J\BkM!n+<VdL+<VdL+<Z&&;BR\Q0f'pp+<Z%S2`!'?+<VdL+FG:d0d&5-+<VdL+FG:d
0d&5*3t2OE6XaqFCi!N&+<VdL+<VeS85^Qb2_[36+<VeS+>Gi.2'="a+<Z%S0eje+2BX+b+<Z%S
0eje+1HQ$QHpVC\CghF+Bm:aC+<VdLHq7-X0fM*H+<VdLHlt:+/i=ao+<VeS+>GSn1G^-r+<VeS
+>GSn1GLs#$@G9YDIIX#+<VdL+<VdL+FH^X+>Gf80d%S]+FG:f2D-[++<VdLHlt-u+>Ykt+<VdL
Hlt-u+>Yc7%17JKCi3s'@;R,0+<VdL+<Z&&;BR\S0Jago+<Z%S2E!0A+<VdL+FG:d0d&;0+<VdL
+FG:d0d&;.3t2OE6=k7MChI=%F(HI:+<VeS85^Qc0K(X.+<VeS+>l)10H_J\+<Z%S0esjo1E[e_
+<Z%S0esk+3t2OE6XakNE-64E+<VdL+<VeS85^Qc1GUj2+<VeS+>tu-2'="a+<Z%S0esk-0d%S]
+<Z%S0esk-0KT^NHrFa"Bm"J>+<VdL+<VdLHq7-X1,M!G+<VdLHltC'/i=ao+<VeS+>GVo2)??t
+<VeS+>GVo2).0%$@G-MBOPpi+<VdL+<VdL+FH^X+>Pi03$9=d+FG:k2D-j0+<VdLHlt."+<WQb
+<VdLHlt."+>c.h$@GZjDe"'2DBL&E+<VdL+FH^X+>Pr61E[e_+FG:h3A*03+<VdLHlt."+>c#"
+<VdLHlt."+>br;%17JZDes64GT\+O+<VdL+<Z&&;BR_T3A;Qu+<Z%S1H$jC+<VdL+FG:d1E\P2
+<VdL+FG:d1E\P03t2OE6$?s\EZcJI+<VdL+<VeS85^Qd1GCa1+<VeS+>l#/2'="a+<Z%S0f1".
3?TFe+<Z%S0f1".3'.QVHrG0$@;0O#+<VdL+<VdLHq7-X1H%$G+<VdLHlt@&/i=ao+<VeS+>G_r
0f:'r+<VeS+>G_r0f(m#$@G-UE+i[#A0<!;+<VdL+FH^X+>Yr53$9=d+FG:j1G1O-+<VdLHlt.$
+>Ykt+<VdLHlt.$+>Yf8%17J\AS6.%F`SZJ+<VdL+<Z&&;BRbU3&2U!+<Z%S2)?j=+<VdL+FG:d
2BX_4+<VdL+FG:d2BX_13t2OE6tL7I@W-'k+<VdL+<VeS85^Qe2)@'3+<VeS+>ki*2'="a+<Z%S
0fL442BX+b+<Z%S0fL441cl-RHq.m^DII3$+<VdL+<VdLHq7-X1c@6I+<VdLHltC(/i=ao+<VeS
+>Ghu1,C$q+<VeS+>Ghu1,1j"$@G-LEclUL+<VdL+<VdL+FH^X+>c#50H_J\+FG:h1+k7'+<VdL
Hlt.'+>Yhs+<VdLHlt.'+>Y`6%17JQ@:O>#GT\+O+<VdL+<Z&&;BReT2DZHu+<Z%S2)m3B+<VdL
+FG:d3$:":+<VdL+FG:d3$:"83t2OE6#:7RFD)d>+<VdL+<VeS85^Qe3A<<5+<VeS+<WZs0H_J\
+<Z%S0f^@!0d%S]+<Z%S0fU:53BIZWHrFuu@ppK&+<VdL+<VdLHq7-X2)$mG+<VdLHlt@+/heCj
+<VeS+>Gl!1GU'q+<VeS+>Gl!1GCm"$@G-UCLLpf+<VdL+<VdL+FH^X+>kl60d%S]+FG:d2(ga/
+<VdLHlt.(+>ktu+<VdLHlt.(+>ko9%17JR@:Wee+<VdL+<VdL+<Z&&;BRhP2E)a$+<Z%S2)R!?
+<VdL+FG:e0H`))+<VdL+FG:e0H`>:%17JWASu9pDKI!D+<VdL+<Z&&;BRhP3&i$'+<Z%S2`NEI
+<VdL+FG:e0H`),+<VdL+FG:e0H`))3t2OE6#pIWF`MVG+<VdL+<VeS85^Qf1Ggd.+<VeS+>br.
2'="a+<Z%S1,'h+1*@\^+<Z%S1,'h+0KT^NHr=ZkBl"nbASuTuF`MVGHq7-X2)I0N+<VdLHlt:'
/i=ao+<VeS+>PVn1cHO"+<VeS+>PVn1c.9'$@H$"@V'FgChI<sF^f&-+FH^X+>l#40d%S]+FG:k
0eP.&+<VdLHlt0u+>l,$+<VdLHlt0u+>l#<%17JKCiF'!@q/pi+<VdL+<Z&&;BRhU3AVd#+<Z%S
1H7!@+<VdL+FG:e0d&;-+<VdL+FG:e0d&843t2OE6#LdQEb0;7+<VdL+<VeS85^Qg0f(X/+<VeS
+?2>52'="a+<Z%S1,9t.2BX+b+<Z%S1,9t.1HQ$QHrFH_Bknh6+<VdL+<VdLHq7-X2D[9O+<VdL
HltC&/i=ao+<VeS+>P_q0fL3t+<VeS+>P_q0f1s$$@Gcc@<HBp+<VdL+<VdL+FH^X+>u)42]s4c
+FG:j3%cm-+<VdLHlt1#+>bbp+<VdLHlt1#+>Yr<%17J\@<5jnBOPOrAKW*<+<Z&&;BRkT2)ZR"
+<Z%S2)6d<+<VdL+FG:e1E\M/+<VdL+FG:e1E\J63t2NG%13OOF%&Gr7WifDE_U7cF$2Q,771'G
E_U7cF!+Cp771'EF`\'"F(B?%Ap&2Y3ZohmD/!m/+EKt=<CV+Q89.F=DK@6L/Kf.PBl7u74s2X(
HQk0e4tq=^BL[,d;IsnY$;No?+Co2-@rc."@;]S#+Dkh1F`_29+>"]u3Zp1#D/!m/%15is/g)nl
4usfM/h\>pF(B?%Ap&2)$4R=O$?L'&F`_SFF<Dr"6WG7LBldj,ATT%\9M@*7:Jt._02kYH<(J-&
E_U7c+D,Y*EA)BT@<?Q54Ztqk4Zt/%$=n3fD/!lN3Zr<NF(8^&E\)*=F(8g)F=_<?F(9/tF*&sS
A927"@<6NAF(B?%@s)g4/9>?C@qKk*%17/nDfp/@F`\`REaa/7D.R-n3Zoe$,!$i`ARTI!A926t
Bl4@eF)>i<FDuAE+=C]6F*)G:@Wcd,Df-\+@WQI(F`_1;D/!m1FCcS*BkCsu-OgE(D/XQ=E-67F
H[C#\HQk1n+>5bu0RJ(nI3:^lAo_I&+FI^@@r5pt%17/nDfp/@F`\`RF*(i4F!+n#F)Pl;FCcS3
Bl8'8AKYMtAnH*3%17/nDfp/@F`\a:F*(i4+FI^@@r5pt%13OO0H`%pATD4#AKW?qBM`,YF<F=l
6ZmEi+AQT>F`\a$BM`,YFAc[k+AQT;F`MM#ATJthBL[,d;Isnl771'GE_U7cF!,RABl7u>%14d3
0I14M@<6!&-Ve>D6WHrkF*&Nn6WHrkF*'rn9keKd+@SXt6ZmEi89.F=DK?pqBLP9g6ZmEi+@SXt
7WifDE_U7cF!+4k771'EF`\u?$8<SV,\;")F(HIAF%&Gr:gnEe89.F=DK?qA771'BF`MLnE_U7c
F!,Nm6WHTuF@^FHBl7u>%14d30I14M@<6!&-W=\T@<6N5;eSO@EcN:$BL[,d+B)rM@<6NgATJtm
BL?o_E`-Ii+B)rCF`^MmF!+Cp771'O@<6N5;eSTe<C:nLEZe:o771'EF`\u?$8<SV,\;")F(HIA
DIdfu@s)f7DIdfuAp&2<DIdfuE+*g0+EM(7@rPjtF<GX8F(8^&EcN:DA926mF`\u?$8<SV,\;")
F(HIAA926tBl5:@+AP6U+Co2-@rc."@;]S#+Dkh1F`_29%13OOGA1r2@q01\EcW?W%13OOF)>i<
FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9s@<Q^6@<-ErARfjiF)>i2AL@ooEbTT+F(KH#DII^0FCB32
?ZTXf@<-'hF)>i2APPQE.WT6EATMF)?Z':qF*(i2F'iusAmo^o?ZU(&CLnV2F=f'e@rH4'@<,q#
+=M8EF(KE(F=A=T@ps1`F!)TID[d%K67sC"Cgh3mFCB3(F_r7?Ec5T2@;U'<%15is/e&._67sB[
BPDN1+EV19F<D]9Df'H%Eb0;7+=M8EF(KE(F=A=TFE1f-F(o_=+EV=7ATJu&DIakuCijB5F_#')
+EVNE+<Y]9F*2;@Et&IO67sBjDf'H9FCeu*@X0)<BOr<*Cgh3mFCB3(F_r7?Ec5T2@;U'.-rXo,
+B)]\@<-'):i^Is2CU6f$;No?%15is/g,4HANCrIFEDJC3\N.1GBYZ\CO'u0Amo^o@<6O2Df0K1
GqNTFD(c>*:-pQB$;No?+CfG'@<?'k3Zp131,E?X0Jj4G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU1,E?XE\]En@:X+q
F*&O:DfQtAF`&jQBldi.F(KG96pX^D<)QX;4WlF$AoD]4FCfN8%13OOCi<`m+=D2DF(KE(F=.M)
Ci<`m+=D2DF(KE(FB*EsCi^s5$4R>]DfTr0BOPq&+>=63%15is/g,7IF*&OIFD5Q4%172oBl7uT
3Zrcr.k`)$+C-*J0H`(m.O$Si+F/B`%16$,=\*R-Bl64QFE9T++FAGX?T'f#-6b&b-T`Fu+Cf(n
EcZA4+=DOa-=LM.ATDTqF*)JFE[!4\>p(mFI4cXJ4"akq+EVF3+=JU993EiGE\0h&9keK,-Qli0
FCfK6FE/LL.3L2p+@B%TI16N^93G28@<-EP3Zrcr@;Kb(BPDR"FE2)4-8%J)4<cL&-[[9g@V'.i
Eb0<6E[!4\>p(kL/g<"m>p(mFI4cXJ4"akq+EVF3+=JU993EiGE\0h&9keK,-Qli0FCfK6FE/L&
BN%Q,6ZmEi.3L2p+@B%TI16Mm$;No?+Eh10F_,V:FCeusDfp,;Gp%$7FCAm$ARlomGp$U5Bk(pm
DJ()1DBNk8AKZ&9@<*K!AoqU)%15is/g+S?DffZ(EZf(6+EV:.+AH9S+B*'$+B)]\@<-'):i^Is
2BZsZDeF*!D%-g]$;No?+EMC<F`_SFF<DrKDfTr5ATDZ2BOu$pF)Yf(Eb-A'F`MM6DKI!a4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zt/%$;P8%F`MLc3Zr6W@psInDf/p-ASc1$GB7kEDIn8>1,(I>+>Y,q
2[p*hBL?o_E`-Ii4ZX]\BL?o_EZf7.G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp#jq
6ZmEi;IsnY$4R>;BN%Q,6ZmEi4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+.h)i5=_2DcDg-8EDf0,//Kdi*A0=?MBln$#F_i0oDe!3tBl@l3+FFV*HlsOS+<VdL
+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm
+@0ITG%E6rDfU/O%17J*+<VdL+<VdL+<VdL+<Vd^1c@$A1GCF?2'>M6Ch[<q+<VdLHjpF1+<VdL
+<VdL+?))/1b^jF0f([G3&*0F3Ar#*PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+<Y#G0eb4>
1,h3K+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<VdL+>bo-1c@$F2]te&FD5i>A7Zl+HjpF1
+<VdL+<VdL+<VdL+<VdL+<VdL+<WEn1,C%UARTU%+<VdL+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL
+<VdL+<WH_9lFokBHSE?+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<Vd^2_HjC+@KX`/nAK8+<VeS
%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BZ"!6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/J)/M/P+/M/P+/M/I^$@GTWD.Oh4+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG
1bD7=9keKm+B(p9/Q?aB89.F=DEA:7.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/J)/M/P+/M/P+/M/I^$@G6QDIm9qCgeG/+<VdLHq7-X1c7'G+<VdLHlt=$/heCj+<VeS+<W?\
2)ZR"+<VeS+>=oq2*2p7+>l&=+>to8%17JQBk;0jBHSE?+<VdL+FH^X+>bu71*@\^+FG:e3%cm-
+<VdLHlsOd+>P\p+<VdLHlt-d1,1j50d&5,4!6:<3t2OE;fHG\@3?[8+<VdL+<Z&&;BRhN2)ZR"
+<Z%S1Gg^A+<VdL+FG:S1*AA.+<VdL+FG:e+>Y]5+>P&q1-6U71bLRG%17JKEas36EclFG+<VdL
+FH^X+>kr30H_J\+FG:i1bLX.+<VdLHlsOf+>P\p+<VdLHlt3f1,1j51E\G.4!6F</iGd#$@H$"
@V'FgChI<sF^f&-Hq7-X2)R0E+<VdLHlt1)/i=ao+<VeS+<WH_2)cX#+<VeS+>Y,t2EN$;+>l)>
+>Pr01cl-RHpMRfBOt[`@3?[8+<VeS85^Qf2`WZ:+<VeS+?)&.0H_J\+<Z%S+>b2t0d%S]+<Z%S
1a"V/4!6@&1bh'72_m!@3t2OE6#LdQEb0;7+<VdL+<Z&&;BRkP1Gg3s+<Z%S0f^j?+<VdL+FG:S
2'=\5+<VdL+FG:h+>Yi9+>k8t2EN$93A*$J%17J]@:Eqd+<VdL+<VdL+FH^X+>u#73$9=d+FG:f
0J5%%+<VdLHlsOi+>Gbs+<VdLHlt<i0f;$82BX_44!6:=/iYp%$@G`[F(&lu@:s^o+<VdLHq7-X
2Dm?M+<VdLHlt:+/heCj+<VeS+<WQb1bg*q+<VeS+>t>u3BJ?A+>bf7+>l,20fogOHqRmjF!*bk
F*)G2Ch[s<85^Qg3&`i?+<VeS+>GT'0H_J\+<Z%S+?(E!0H_J\+<Z%S2]sk94!6I)1GCm50ek:9
3t2OE<b5oP+<VdL+<VdL+<Z&&;BRnP0JO[m+<Z%S3&E6F+<VdL+FG:S2]sq4+<VdL+FG:j+>bf7
+?(E"1-6U<1bLRG%17JXF`(u/+<VdL+<VdL+FH^X+?)#10d%S]+FG:d3A*03+<VdLHlsOk+<WB]
+<VdLHltBk0KUC"3$9q;+<WC!/i,Qu$@G-UFCAm(+<VdL+<VdLHq7-X2`3HO+<VdLHlt:'/i=ao
+<VeS+<WWd2)ZR"+<VeS+?1K$2*2p?+>l&=+>ku.2*26SHphO`ARZc)+<VdL+<VeS85^Qh3ANE6
+<VeS+?2A60H_J\+<Z%S+?:Q$2BX+b+<Z%S3?U.94!6O+1c@E<3&rTG3t2OE7;cgO+<VdL+<VdL
+<Z&&;BRqT0K:0t+<Z%S2)R!D+<VdL+FG:d0H`24+<VdL+FG:d0H`234!673+>c)?+>l#/2*26S
Hq&$k@;KUcF`\`K+<VeS85^Qi2_m?8+<VeS+>Gc,0H_J\+<Z%S0esjo1E[e_+<Z%S0esk+4!675
+>Q#$0fCX=3t2OE9jr'X@:C?%+<VdL+<Z&&;BRqX3&)Nu+<Z%S2DHg<+<VdL+FG:d1*A;*+<VdL
+FG:d1*AP<+>GVo0eb[32D?aD3t2OE6#:LRATD4$H6==Q+<Z&&;BR\O+<VdL+<Z%S2`33A+<VdL
+FG:d1E\D.+<VdL+FG:d1E\D-4!676+>GZ6+?),03'.QVHph[fBOkNo+<VdL+<VeS85^Qb3&i$'
+<VeS+>Pl.2'="a+<Z%S0f'q/3$9=d+<Z%S0f'q/2`i-:1E\M64!6:;/iPj$$@GBQD..6'+<VdL
+<VdLHq7-X2DI-5+<VdLHlt=-/heCj+<VeS+>G_r0esjo+<VeS+>G_r0eb[30f:(.1-6U:3A*$J
%17JWASu9lEZcJI+<VdL+FH^X+?;/2+<VdL+FG:g3A*03+<VdLHlt.%+<WQb+<VdLHlt.%+>l5'
0fC.44!6@?/iPj$$@G-UA7]4YEa`i.+<VdLHq7-X0f1aH+<VdLHlt=&/heCj+<VeS+>Get1b^$p
+<VeS+>Get1H@N>0fL430KUC81+k:C%17J\BkM!n+<VdL+<VdL+FH^X+>Gf01E[e_+FG:f2_Hs1
+<VdLHlt.'+>Ghu+<VdLHlt.'+>Gf:+>Ghu0fV6;1H-pC3t2OE6XaqFCi!N&+<VdL+<Z&&;BR\Q
0K:0t+<Z%S3&iNJ+<VdL+FG:d3$9t2+<VdL+FG:d3$9q94!67;+>PZ5+?2>51cl-RHpVC\CghF+
Bm:aC+<VeS85^Qb2`WQ7+<VeS+>ko,0H_J\+<Z%S0fU:23?TFe+<Z%S0fU:23'/6;3$9t:4!6C8
/ic!&$@G9YDIIX#+<VdL+<VdLHq7-X0fM*I+<VdLHlt@)/heCj+<VeS+>Ghu1GBpo+<VeS+>Ghu
1-%E=0fU:30KUC91bLOF%17JKCi3s'@;R,0+<VdL+FH^X+>Gl11E[e_+FG:g1bLX.+<VdLHlt.'
+>bbp+<VdLHlt.'+>Z#>+>Ghu1b_!61c-gA3t2OE6=k7MChI=%F(HI:+<Z&&;BR_K2DH<s+<Z%S
2)?j=+<VdL+FG:d3$:(=+<VdL+FG:d3$:(<4!67;+>l/@+>kr-0KT^NHrFa"Bm"J>+<VdL+<VeS
85^Qc1c[95+<VeS+>Pr00H_J\+<Z%S0f^@53?TFe+<Z%S0f^@53'/6;3?U.=4!6:</iYp%$@G-M
BOPpi+<VdL+<VdLHq7-X1,^jH+<VdLHlt.%/i=ao+<VeS+>PVn+>P&^+<VeS+>PVn0fpL#1,'h+
4!679/iGd#$@GZjDe"'2DBL&E+<VdLHq7-X1-%0I+<VdLHlt:#/i=ao+<VeS+>PVn1c$6s+<VeS
+>PVn1bq-81,'h-1HQ^:0J5:G%17JZDes64GT\+O+<VdL+FH^X+>Pr;0H_J\+FG:j1G1O-+<VdL
Hlt0u+>c)$+<VdLHlt0u+>c&>+>PVn1c[W?2`!'D3t2OE6#:LR@<,m$+<VdL+<Z&&;BRbS1cQU#
+<Z%S1H-p?+<VdL+FG:e1*AA-+<VdL+FG:e1*AA,4!6:6+>Y`6+>Yo.3'.QVHr=NgF_l2A+<VdL
+<VeS85^Qd3B/c:+<VeS+>l)12'="a+<Z%S1,C%-0d%S]+<Z%S1,C%-0KUC41E\D,4!6C>/i5X!
$7QDk%16$,=[R=PE_(4FBl7uT3ZoPD93Ff+9keK2Cij_@:2!R!=[R=PEX`@n771'gEc#N.F$2Q,
0H`(mHQk0e;bL7\F`MLnE_U7cEt&Io;bL8,Ec#N.F$2Q,1*A@qHQk0e;bL7\F`MLnE_U7cEt&Io
;bL8%Cij_]3Zp7%HQk0e;bL7\F`MLnE_U7cEt&IT93FW)EcOH^FE9T++?go'+F>:e+?go%+F>5+
BL?o_E`-Ii%16u`F(8^&E]lH+.!0<?DK?q<;bL8,Ec#N.F"&4`+EVI7DK?pa+>Y-e+u(3(0RHQ.
6ZmEi;IsnY$>sB_Cij00E]lH+;bL7\F`MLgCij_@/Keq093G\>FE7lu%15is/g+\=F(96%E+*Wo
Gp$s<DKU&4F!*%W4?=T>+Dkh1Et&I2+?hh/4t\K2Hu<J9@q0Y%%15is/g+\=F(96%E+*WoGp$O3
FD5i>A7Z2W0J5+'4usfM/h\>pDId0lFCTH6%13OO:-pQUF)>i<FDuAE+=C)\=Wha!F(KE(F<F=S
;H-1089.F=DBNP3AT9AEFCB94+?_kN4Ztqk4Ztqk4Ztqk4XU[G:-pQUA926tBl6'p+FJ';F(8^&
EX`@N67sC%D/XQ=E-67F5&Y%RAT8i'F(9'$D@HqJ67sC%D/XQ=E-67F-p'I;9keKfFCfM96#:XW
FEM,*F!iCZ/34n9+u19OF*(i4+u(3fDIdfu@s)f7/34nkA79:r@s)f$$4R=O$;No?+EMC<F`_SF
F<DrPDfp/8ATDZ2BOu$pF)Yf(Eb-A'F`MM6DKI!a4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zt/%$<(V*
F`MLc3Zr6W@psInDf/p)Cisc@INUC"1,C%/+>Pkb$<(V*F`MM#ATL!q+B)r@F`MLFDII]qFDk\u
Gp"dM$;No?+EMC<F`_SFF<G14FC0-.A79a+;eSO@EcP&hEt&Hc$4R>;67sC!DJXS@F)Po,+EMID
FD,6+DBO"B@<-E3/Kf.KAKYDk@s)g#@sK2<AS#_"+E;O<FCcR($;No?+CSelEHP]3AKYT'EZf4E
+E2IDE,Tf/F"Rn/;eT*&=[R=PE]lH+0H`D!0F\@>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%17J_Cisc@+>"^WFCB24E+*d/Gp$X3DImi29Q+ELFD5Z2+<Z%@$@Es=+<VdL+<VdL
+<VdL+<VdL+<VdL+>t?:@:q/cBl+t8+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2'>1oDg#\D
88iNpHjpF1+<VdL+<Vd^1c@$A1GCF90JkLB2E!HP+A-cmBjkm%+<VeS%17J*+<VdL+<WU!/i57@
1bgdD2`NNI1c[H:cBM9N+<VdL+<VeS%17J*+<VdL+<VdL+<VdL+<WBp0eP.73A`H59Q+f]BlnK.
AKZ@0$@Es=+<VdL+<VdL+<VdL+C?l]/i,=?0JO\D@<?4*F_#&++FFV*HlsOS+<VdL+<VdL+<VdL
+<VdL+>PW+1E]h3@<*J5+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd_+AHclFD)d>+<VeS
%17J*+<VdL+<WEt/iGC?0fCpJ2E!HO2E!K:6t(?nA7Qf*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL
+<Y#O/i=bO<'tsS+<VdL+FFV*.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)h9
/M/P+/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@GTWD.Oh4
+<VdL+<VdL+FHRgF(o9)@<?4%DL>E(/O=2p/OX/_HrP,<1,LRRE_U7cHlu?\=Y3Tn/P'nVBl6!A
$7d\[/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i56tL7I
@W-'k+<VdL+<VeS85^Qe2)@'3+<VeS+>ki*0H_J\+<Z%S+>=on0d%S]+<Z%S0H`,)4!64"1,1j5
2)$X<3t2OE7qlOP@;$c++<VdL+<VeS85^Qe2E!<5+<VeS+?2,/2'="a+<Z%S+>=op3$9=d+<Z%S
0H`214!64"1cRQ>3&3*B3t2OE6"=qXGT\+O+<VdL+<VeS85^Qe2`!-1+<VeS+>ko,0H_J\+<Z%S
+>=oq3?TFe+<Z%S0H`534!64"2*!`@2)6d=3t2OE7q#nJFa,#O+<VdL+<VeS85^Qe2`<H7+<VeS
+>l,20H_J\+<Z%S+>Fu]1E[e_+<Z%S0d&55+<WB]1HQ^:3%cpI%17JKCh[g0BHSE?+<VdL+<Z&&
;BReV0Jssq+<Z%S+?;&.+<VdL+FG:S0d&50+<VdL+FG:d+>Pf9+>Fuo2EN$@/ic!&$@GckBk(Qo
+<VdL+<VdL+FH^X+>ki12BX+b+FG:j2D-[++<VdLHlsOd+>l)#+<VdLHlt-d2)[N=0d&>44!6I>
/ic!&$@G-UCLLpf+<VdL+<VdL+FH^X+>kl60d%S]+FG:d2(ga/+<VdLHlsOe+>Gl!+<VdLHlt0e
0fV6;1*A;34!678/i>^"$@GBQA79L$+<VdL+<VdL+FH^X+>ko42]s4c+FG:h2(gR*+<VdLHlsOe
+>Ynu+<VdLHlt0e1Gh091*AA24!6C;/ic!&$@GQZDJNg$F<D\K+<VdL+FH^X+>ko63$9=d+FG:j
3A*!.+<VdLHlsOe+>Yu"+<VdLHlt0e1H.B<1*AA44!6IA/ic!&$@G-[@ruj6F`SZJ+<VdL+FH^X
+>kr30H_J\+FG:g2(ga/+<VdLHlsOe+>c#"+<VdLHlt0e1c@E<1*AD44!6@;/iGd#$@G`cB5)0)
94`!_@<HU5F*pMV+>ku53?TFe+FG:h1bLX.+<VdLHlsOf+>GVo+<VdLHlt3f0eb[31E\D-4!6C;
/i5X!$@G-WCLLWo+<VdL+<VdL+FH^X+?;G)+<VdL+FG:j1G1@(+<VdLHlt.!+>l&"+<VdLHlt.!
+>l#<+>GVo2)[N=2`!'A3t2OE;fub^Bl"n7+<VdL+<VeS85^Qd2D[04+<VeS+?)&.0H_J\+<Z%S
1,0n-2BX+b+<Z%S1,0n-2*2p90d&814!6I:/iYp%$@G-UE+i[#A0<!;+<VdL+FH^X+>Yr53$9=d
+FG:j1G1O-+<VdLHlt1!+>l&"+<VdLHlt1!+>l#<+>PYo2)[N=2`!'C3t2OE;IsK`CiseA+<VdL
+<VeS85^Qd3B/c:+<VeS+>kr-0H_J\+<Z%S1,9t.2]s4c+<Z%S1,9t.2*2p91*AA34!6C9/iYp%
$7QDk%16$,=[R=PE_(4FBl7uT3ZoPD93Ff+9keK2Cij_@;eT*&=[R=PEX`@s771'gEc#N.F$2Q,
0H`(mHQk0e;bL7\F`MLnE_U7cEt&It;bL8,Ec#N.F$2Q,1*A@qHQk0e;bL7\F`MLnE_U7cEt&It
;bL8%Cij_]3Zp7%HQk0e;bL7\F`MLnE_U7cEt&IT93FW)EcOH^FE9T++?go'+F>:e+?go%+F>50
BL?o_E`-Ii%17/u@<-3nF)*p"+=JodHQk0e4s2O%HQZ7#6ZmEi;Isnu+D!/J;bL7lFCB32+B)rP
93FW)EcMTr%17/eF(8^&E]lH+.!0<?DK?qA;bL8,Ec#N.F"&4`+EMX5Ec#6+CEOiEFDY`0F!*Xh
1E_#g0d&Y6HW+TFF`MM#ATJ:fF(A]qFCTH64ZX]6F*(i2D..L$+<r"-93FW)EcOH^FE8lR/Kf+5
93G\>FE7lu%15is/g+\=F(96%E+*WoGp$s<DKU&4F!*%W4?=T>+Dkh1Et&I2+?hh/4t\K2Huih>
@q0Y%%15is/g+\=F(96%E+*WoGp$O3FD5i>A7Z2W0J5+'4usfM/h\>pF(A]qFCTH6%13OO%17/n
Dfp/@F`\`R;bL79EbTT+F(KG95tjs*:/=be82!n;<E)L389.F=DBNP3AT9AEFCB94+?_kN4ZtqU
%16We@r5pt4ZX^'A926jF`K$SA926jF`IouF)>i<FDuAE+=D2<G9CR>D/!l1D.R-n3Zoe$,!$i`
ARTI!A926tBl4@eF)>i<FDuAE+=C]6F*)G:@Wcd,Df-\+@WQI(F`_1;D/!m1FCcS*BkCsu-OgE(
D/XQ=E-67FH[C#\HQk1n+>5bu0RJ(nI3:^lAo_I&+FI^@@r5pt%17/nDfp/@F`\`RF*(i4F!+n#
F)Pl;FCcS3Bl8'8AKYMtAnH*3%17/nDfp/@F`\a:F*(i4+FI^@@r5pt%13OOF)>i<FDuAE+=C)\
=Wha!F(KE(F<EkC9J9.:;H-1?;bpCm80C37FD5i>A7ZlqEb05DF*(i4F!*V/4Ztqk-OgDnF(9'$
DEU$'0J5(&Ec6)<A0>c#@;L$qF`K$SA79:r@s)f$$?L'&F`_SFF<DrO@<Wi-Ec#N.+Dk[uDE8mf
/0[+tD.R-n+CoP'D/!ks$?L'&F`_SFF<DrABleB:Bju4,Bl@l3@:F:rCisi2+CT).BlnK.AKYMt
AnH*3%17/nDfp/@F`\aQH[-`\+u+Nh00140H[1$f+?j^UEb055Ht7;.D/!ks$?L'&F`_SFF<DrP
FCB94+CS`#DesQ<AKYDtFD5i>A7ZloBkCsu-OgE(D/XQ=E-67FA92j$F<GsAF(9'$D@Hp^$8<SV
,\;")F(HIA:2!";EcN9F+<VdL+<XEm6ZmEi;Isnl+<VdL:2!R!=[R=PEZcJI+<XTU=[R=PE^=M`
F!)SJ;bL7\F`MLnE_U7cF!i(>$8<SV,\;")F(HIA;bL7aE_U7c6#:Xa+<XTU=]9ENEcW?G+<VdL
;eSO@EcN9F+<VdL+<XTr6ZmEi;Isnl+<VdL;eT*&=[R=PE[MtP+<Vd9$8<SV,\;")F(HIAA926t
Bl5%9+<VdL+<YPj6WIf?D/!m/+<VdLDGs22@;L%,+<VdL+<YQ#93GqKD/!m/+<VdLDId0lFCTH6
-QjNS+<Vd9$8<SV,\;")F(HIADIdfu@s)f7+<VdL+<Y_o6WIf?D/!m/+<VdLF&P_7@;L%,+<VdL
+<Y`(93GqKD/!m/+<VdLF(A]qFCTH6-QjNS+<Vd9$8<SV,\;")F(HIAF(B?%@s)f7+<VdL+<Y`I
@<-3nF))m@+<VdLFDY`0F!hD(%17;nDJWfmBOPq&+>=63%17/nDfp/@F`\`R:dJ#Y7790t+ED1;
ATMF)?Z':qF*(i2F'iusAmo^o?ZU(&CLnk&$?Bj%ATMF)?ZKk%ATMF)?ZU(&CLp7-/h1mUF(KE(
FC0'&F(KE(FC0*+Deio,F=f'e-us$CATMF).3N\KDeio,FCfN8F"Rn/:-pQB$;No?+CfG'@<?'k
3Zp131,EcUE\]Q_$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>P`]E,mWe+Dbt+@<?4%DBNh*D.OhuA7T7^%15is/g)o*
@;p6B1E^+:C3=T>+D,P4+EM[CEbTT+06:]H+D,>(FCfK,DJ'Cc:-pQU1,E?XE\]Qr@:X+qF*&O:
DfQtAF`)56F(I"GATT%($4R>YDdd0!-ZWpBATMF)-OgCl$;No?+Dk\$F`S[EB.b;e3@lm=0F\@_
69R@P?T0\l0K:jE+>bi+1G^gC+<XEG/g*K!F*)><%16646p3RR0f_3Q+>Y,q0F\@h:H^`]0F\@a
67sBhA7Qg$@VTIaFE8RBDfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)/Keq>D.P7@Ea^LAA7]6[$:.HS
4Y@j*4?GSO<b6/kF!iCf-p0=@/iPR@1-$d74>AfJ1c-mH1(=RV:I72s+=nil4s2783[[]i8mb>%
D.Ohc6:tT_6!m5>0JG1':I7Z\6tKk88hr(S0IJ:l/1r&2:I5Kt6tL1V@8q;DG%G].A7]+gBldj,
ATV9B3Zp:<%14I`EcW@5:gnB]F!j+3+=LAe6p"CE4%qt&4@)b0.3NYFF(KE(F<Dr3ASuX3-OgD:
+>>'PEaa$#+=BQgCij)bF&-sjEbT&q?ZKk%ATMF)?RH9i%15is/g,=GCis<1+CT;%+EqOABPD?,
0ea_eBl8'8ATJu4Afu2/AKYi$AT`&:@W-1#+:SZQ67sC$ATN!1F<E.XDJsV>B6%QlF<G%8F<G47
De'u%DJsZ1BHUo*EZen(D/UP@DfTV&$;G)CF`VD6DEU$'+=f)h+>G!E+>tnr0d%qi0d'aE0esk,
2'=Fm0f^@50d&#.+>P&s2%9mI0H`P%4t\L99k@mYF)>W/+>"]d0-VMn+C-*J0H`(m.O$Si>p*K0
+F>^b0d&P5+F>:e+BEN(+:SYe$;<cL3ZoPP0ekR=1H.0O2)ZR61G1RB2E*QP+<Ve%67sBTATDKq
Bjkm%%16646p3RR1,(I>+>Y,q2[p*o:H^`]+>t>b+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+AGd6
+B;B.+E(k(F(KG&$4R=i;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T6+:SZ*
;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,4"!sGBk(R!%13OO
:-pQU6?6dQBQP@qFCB32+D,P4+>PW+1E\Ir1,g=MATDKqBjklg$;No?+D>k=E-"&n06_Va/n&R5
@;]L`/n8g:04ApDEc5i6D0[dDEbT0"F=hQU@<-EBH>.>.De*E43&<HL2D6g>1,CL91G(@@%15FC
4ZX]I3[[40FCAm(+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d@<,do+AuodAS`JV@;odoCgeGQ
ASc0kFE2)?-OgDLF$2Q,6?=\>3[[7*FCf9$AT`'*+B)upBm"J>:i^JaH#IRC:iC/dFa,$,AS6.%
F`S[(E+rfj+@1$XFEMVHF!*bdFCB3$F!+LpB43/1%13OO-W5".@o-TSD0%'f3ZohR9gh'C:HM6:
.3NYFF(KE(F<Enk%13OO:-pQUFE1f-F(o`;+DkP/@qZus@;0auGp%<BCht57Bldi=F(KH7+Co1u
An?!*2'@!Z+>GPmD/!m1FCfM&$:8f5Ea`j,BllL!+?:Q!3%Qd<+?1o,1*A>0/29%*1Gp^<3$9t-
0fU:40e>%=+>bl*3\`T:2),OI6??+H@;^.#F?MZ-6??+H@;^.#F<E+W0f^@30e>(6+>GT%1,0n/
/2Aq&0ek471E\J1/2A>*1b:F*1c-a@+>l,03]J6=%13OO:-pQUFE1f-F(o_=@;L%"FEM,*+Co%r
Eb/g'%15FC6#:X+3Zp:;+?2>'0fC.62]t"6+>Yu"3&_s;1(=RWF$XVa4ZX]PF$XVa/2]4+1-$I7
0d&D3+>l,$1Gp:52'=V6+?24f$4R>A9i*u6+F?-n0d'A8%15Bp<'<8b-n%244"N'7-@7('+B2'3
.3L/o+@:-8Cigd/$<0o&4ZX]6-p04G1*AA%-@7('+B2'3.3L/o+@:-KEa`j,Bljdk%15is/g+S=
FD5i>A7]g)D..NrBHVD8+>G!LAS6$pAISu$+?^i2/h\>!0-W+n5tk5e$4R>;67sC&Ea`j,BlkJ>
Bl.F&+DkP/@q[!,D]gbWD/!m1FCcS/DBO.AEcZ=F@psFi%14g44Wlp@0-GWb-oNb%,<B-l?SN[/
+>=om+F>:e+B26<.3L2b2D?6u3aOjS0d'aE1*A@qHQk0e<)Q[)$4R=i8O6?!:-ho.4ZX^%Ddd0t
FCB32+>=63.!mQj0d'4W<[g0m+F?-n0d'4W<XfBaHS-Ks+A"k!.6T^7HTE?*+A"k!%14IX@<Q[4
+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%i@<Q!VFCB2s:18!N%14IS@<HU3+Ce5VEc#kF
4ZX]6=\V:G<DP\M67F$tBldj,ATT%d5uh8e@;TQb$4R>;67sBkAS,@nCigd/$7APZEbT&u@;^+,
+Dae]D.Oi2;KEsj:gnB]F!j+3+DG8,?Z^3s@<itL%13OO:-pQUA79Rk+E(j7<GZeuFWbaI@<*K0
@<-I8+Co2(ATA4eF\5%b3Zr0[Ch@]t@;I'/=\V:I3Zp131,9t,0H`)1%16*/<Dlg[3Zp.50eP.7
3A`H5?SXJk1GgmA0b"J4<E)=K3Zqci/i=a\$?]$:5t=(!+>ti+%175O85E,e4ZX]C%175Q5tsd2
3ZoeMCisc@+>"^WFCB24E+*d/Gp$X3DImi9%175G@<--H3Zp*c$7AhiF`MVFF!,9o@;TQuF&I'%
@o-TSD0%'f3Zohn=\V:GF\5%`<D6Cj<BG>'<'r`i9MIfC4*=4f:Jt@XF\Y4s76>W[@<--4+DG8,
?Z^3s@<itL%14I_Cisc@EcW@>:18!N+ELG%+Ce5VEc#kF4ZX]6F]hF,4*=.`4&nsS;H5f$<E)=I
F\GLq7ltie85E,e4*=:a9gq-d6t(+O.3NM:G$f?0A79a+0F\?u$7ASWG&hXHCeeDUAKZ%lF!+sh
@<-4+-TsL=Ci<flFD5Z2?[64!Ci=N=FDl&.INU@*1G^.6+>Pf,2`3$,Bjl-kFDk\uGp"dM$7ASW
G&hXHCeeDUAKZ%lF!+sh@<-4+-TsL=Ci<flFD5Z2?YF@pAUYaV3Ai];2]sh7.3NM:G$f?0A79a+
0F\@::18<dF!,9o@;TQuF&I'%@o-TSD0%'f3[ef_@psInDf/p)Cisc@INUC"1c$75+>PAgDII]q
FDk\uGp"dM$4R=r+>>'PEaa$#+=BHN66K!6AT`'2Bl5%oEcW?s66KE*6m,K*+B!8'6?=89F&[0g
DKBN6+@:-8Cige!9i)ru9N3-6;H+c6@<Q[4+A$!aEcW@5:gnB]F!hD(0H`%pATD4#AKWB_3[[Kb
<?P%&<[T==/0H?f/g<"m:-ho0/0K9l+u(335ue@$0H`%pATD4#AKW@C=\V:,F\5%E<D6Cj<?QEa
<'qdN9MIfC+E^@K:Jt@=9kA?ZA8,IiEcW@'Cisc@EcW@G6t(+O+E^FF9gp1@:18!N+ELG%-OgCl
$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#EbTT+F(KH#F)>i2ALDM4F(KE(FC0,uDJj$+?ZU(&
CLp7-/h1mUF(KE(FC0,uDJj$+?ZU(&CLnW1/M/)dD/X3$+EV19FE8R:DfQt"@;]soEZfO:Eaj)B
%15is/e&._67sBoFEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL%15is/e&._67sC(
ATD6gFD5SQ+EM+*+DG^9-t[UDF"%P*:-pQB$;No?+<Ve%67sB;+Co2-E$0Q]+>b3ODJUFCDKU&0
FD5Z2?RH9i:-pQU+<YQEFCB9*Df/orDI73uDJ*[*F_#&jA5I>]?Ys<_$;No?+<VeEF`_&6Bl@lr
Bl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys<_$;No?%15is/g+SDF*2>2F#kFVEc6)>
+=M8EF(KE(F=A>HF!,:;@:Wq[%15is/e&._67sBjEb/[$ARmhE1,(I>D..H>1(=Rc67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$>aWhA0<7?Bldj,ATT:/$4R>;67sBoBkM*%E,oZ1F<GOCARfFqBl@ku$7InX3\`?<+>Gb`$4R>;
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sBjDf'H%Eb-@gF`_&6Bl@l38T#Y>@r,juFD55nC`lDiDJ*[*F_#&+FDi:F@;L't
Et&IO67sBjDf'H9FCeu*@<<W*FEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VLBl7Hm
GV3rKE"*-`$;No?+B3#c+CSbiF`Lo#Gp%$;+EV:.+Cehr@s)TrFD5Z2+Co%nEb/[#ATJu9BOr;u
F`MS;ATAo%G@>b+$;No?+F.mJ+D58-+D,Y4D'3q6AKXT#0JG1'AT2QtBHVM4Bk(g!BlbD@BR(_3
E,T6"F!+n3AKZ#)F(KG&$;No?+D#_-Ed8d>BkDI4+F.O,EcW@AEZfFA+CT.u+Dtb7+CT)!DfTQ6
BPhf5Ch[Zr+EV:2F!,C=AKYE%AISuA67sBhEb-A6AS5RlATD4$ARloqEc5e;F)Pl'EZfFKF*(u1
+Ceu!ATMs-@;I''ARfC^DJ<U%/e&-s$;No?+EV19F<G+&FCfM90Ha@p%17AtA3Dsr1,(I>+>Y,p
1*A+j0f_*O+>GVo0eje%+>PZ-2'=V/+>GZ'+>Gi00H`+n0d&#.+>Gl42'=h#2@U!&$;No?+EM41
Aoo/+@<?(%+D,P4G@>N&+CT.u+EM+9+EV=7AKZ)5+>PWa3\`L/3\rL3+B;AM$>*g^D0%j$+D,.r
EbK<2+D>V54ZX]@0H`)-+>Y_]$@-K!1-IZ@FDk\uFCcjb/ho%60I)#kH#7(@.s,]?@<la/+F.g7
%17AtA26;/+F.g71*A(i-mO"SA25SV,9SNu0H`&#An5RlEt&Hc$;*^.4ZX]@1c@$A0f:R@%14jE
1,C%/+>GVo/NP".H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kEYH#7($$>t!.4ZX]m0J5%51,h!C
0fLdF+AP6U+Co%r%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q:-pQU@:sUlATJu9
D]gt]A7]7bD..7%%156O+=Aiq2^]^r3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@1c%$M0f(F>
%14gM2)ud61*A;++>#Vs0me1_A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&@H[0I=%16uqF?MZ-?SF)d
0JG7:1,L^F0F\A,F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$;No?+CSo'AS#p*FDi9\
+Co%nBl.9pEt&I>0-DVr/iP.#-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,Ua?0f_3G2%9mJ
0f([00esk+1E\81+>S:hD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r14+:`A.8l`F`]c-+C?fT0JG4;
2E<]S2DGXJDKTGP3Zr<_FCB9*Df/ouDf03%FEM,*?XuuSBcp#9%15is/g+S8Eb/g'+EVNE2'?F@
@qfdgCi^$m4YIp*0J541+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>P`33&NHM/i=(F0fUj@
+>P&o+>#Vs1OFCaA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&BH[0I=%16uqF?MZ-?SF)d0JY@:3&iTM
2[p+3F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q
+Du=3%13OO8jmba3Zp171,h3Q3A*/u$8FOs2'=h#2BXS4+>eFjD.F(_8jmbD4Wm?b4ZX^#F_kZ1
@ps0r1jaLbA.8l`F`]c-+>>E%0JkXE1b^d@1CX\/F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]
+A,$2$9^$b-SR/2-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO:-pQUDJsD80Ha@p+EV=7ATJtg@<itM
/0H]%0K(%.1HI?K3\iH5<E'D78jmba3Zp172)@3L2_HdC0fM'I1b^jF0K0FJ8jkg'+DQ%8Ao_Bi
C`kJe0K(%2/287t+D,.rEbK<2+>GYp1c$701(=RR0./G+3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.
4ZX]m0J5%50JtRB1H@0G%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J572
+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc30JY@:/i,=@0ebRG3ArWQ2@U!A0RJ(^A25SV
/NP"00JYF,3@lp@+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r0RJ(^A24T$4YJ0:/ib:%-o`A21+=><
7!'P&3Zq$_%16uqF?MZ-?SF)d0JY@<2D@$L1^se0F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]
+A,$2$9^$b-SR/2-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba3Zp171H.9P0J5.<1bg[D2`WcO
3Aq<R-o$'oD.GCN+>#Vs0f_-I+?(i,1a":kAn5RlEt&IK6p3RRC3=?)EarNo+>J4gD.GC2$9^$i
0J5@5+=K2m3\i-,8jmbD/34nG6k'K@F`]c-+C?fT0JG:>3AWTJ0f'7GDKTGP3Zr<_FCB9*Df/ou
Df03%FEM,*?XuuSBcp#9%156O+=Aiq2('Lp3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@2)$d?
0K1U?1c-p@3&`iU1-%6%$7IZVH#7(I.3L3'+>PZ-3$:+13$9^oAn5RlEt&IK6p3RRC3=?)EarNo
+>S:hD.GC2$9^$i0J5@5+=K2m3\i-,8jmbD/34nG6k'K@F`]c-+>>E%0JYFE3AWZN2[p+3F^mQq
+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO
8jmba3Zp162`W]N1bLR@1bg[D2`WcO3Aq<R-o63qD.GCN+>#Vs0fUjB+?(i,2]sUnAn5RlEt&IK
6p3RRC3=?)EarNo+>\@iD.GC2$9^$i0J5@5+=K2m3\i-,8jmbD/34nG6k'K@F`]c-+>>E%0JPIE
2`ETM0F\A,F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQE
F<E+q+Du=3%13OO8jmba3Zp171,q-M2(g[A1bg[D2`WcO3Aq<R-o?9rD.GCN+>#Vs0f_$K+>PK&
0H_kgAn5RlEt&IK6p3RRC3=?)EarNo+>eFjD.GC2$9^$i0J5@5+=K2m3\i-,8jmbD/34nG6k'K@
F`]c-+>>E%0JtRD2D?sC1(=S.F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/2
-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+YBD/`p(AKX`jFCB9*Df-[hDBM_a
Ch[m3BlnVC:M(_KBOr;T@r,juFD55-FDi:F@;L'tEt&IO67sBjDf'H9FCeu*@<<W*FEDJC3\N.(
AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VLBl7HmGV3rKE"*-`$;*^.4ZX]@1c@$A0f:R@%14jE
1,C%/+>GVo/NP".H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kEYH#7($$>scnF?MZ-0J5%51,:O?
1GUsN3B/-V67sBkAS2GZDJs)r4ZX^'F`_&6Bl@lrDdmNsEHPu;H!b,mCh[j1Bk(L\7<!<9AS3,X
6k'Ju67sBhB6%QpF!,RC+>P'MARfFk@;Kuo$9^$b-SR/.-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V
%15]qF?MZ-1,LdF3AE<B2%9mI3Aif>0esk+0d&&/+>J4gD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r
0me1_A.8l`De4#R3Zqc`/het72_m-J2`!<G0b"J-De3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`
BlJ0.@p`b8E-"EYB-9f7%156O+=Aiq2('Lp3$C=<.3KaNDe4#5/34nkDe3Df$4R>77!(RQ+>Pf.
0ek[J/i=(F1,1RB+>GVo0f'q(3Zp2)H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>S:hD.F(_DJs*.
4ZX]>/het71GLmI2E!EH0b"J-De3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EY
B-9f7%156O+=Aiq1FF:n3$C=<.3KaNDe4#5/34nkDe3Df$4R>77!(RQ+>P`33&NHM/i=(F0fUj@
+>P&o+>#Vs1OFCaA.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&BH[0I=%16ukATU'r+>>E%0JY@@2)I9I
3Ar]'$>scn@m)jqDKU&0FD5Z2?Z0CiBlS90FEq5)@r,juFD55lA4:HY6tL!R8jj*q4YIp*0J5./
+=K2m3\i-,+Du+/F<E+q+Du+/@grbS$;*^.4ZX]@1bq!M3&rTK%14gM1Gp:6+>t>o3Zp8+H#7($
$;*^.+?^i>6p3RRC3=?)EarNo+>eFjD.F(_DJs*.4ZX]>/het53&`ZK2`NQH3=Q=5De3EA3Zr<_
FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EYB-9f7%156O+=Aiq1aaCo3$C=<.3KaNDe4#5
/34nkDe3Df$4R=r+>>'PEaa$#+=DGOA0?/7A259>A8#h$+D>V5+A,%D+A,$EDKU%DDKTG3DJs*.
+Du+/@j_]m%17/nDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)?Z]^oDImiqF)>i2AL@           ~>
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
0fV!40fU:3+>bbp1*A>23A;R21a"Or0fV$I1a"P-+>P&r1c[H:0esk,+>u)4+>Ghu1*AD11a"M1
+>P&s1c7061,g=2+>Pi60H`,-+>P&t2`!BI+>GVo1*A>+2`WZ:0f:(/+?)5:3?U.6+>P&s3B/r?
1-$I4+>c#;3?U.8+>P&q2_mB90ea_*+>ki3+>G_r1*AS70d&5,+>P&q2)d3G+>PVn1*AJ72)6:0
2BXat2E3EM6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2d^E41,g<u/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=+<X!hA9f:?+<VdL+<VdL+AuopATJt:+<VdL+<VdL6ZR*dF(KDt+<VdL+<Ve$@:sIl
FEM,*+<VdL+<XToFE7lu+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL9kA?ZA8,Ii+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#+<W6f/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/Os/M/P+/M/P+
/M/P+/M/(s/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+%144#6#:XOBlY==+<VdL+<Vd^3]&T7
5qYka>Tb.3+<W[*0fU:A/kms'+<VdL+>>E-0H_J\+<VdL+<VdL1HIBN+Aa[b/mJhm+<VdL+<VdL
+<VdL+<VdL+@RCq+<VdL+<VdL+<VdL2)W7T+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve.%13OO
+<X'`DIm9"+<VdL+<VdL+>GQ21cHOR/kms'+<VdL0ebXB3$:L>9eKZn+<Vd]/i,1(+<VdL+<VdL
+<W[*1,^7O/kms'%144#+<VdL+<VdL+<VdL+<Ve%+<VdL+<VdL+<VdL+<WX'_QY.*+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+AN@Q%144#7W3-PChR7"F<D\K+<Vdd3\rN65qYka>Tb.3+<WBo3\iQ8
:bGHp>Tb.3+>GK(0H_J\+<VdL+<VdL1cd?N+Aa[b/mJhm+<VdL+<VdL+<VdL+<VdL+B(]O+<VdL
+<VdL+<VdL0fHnQ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve*<t,KG$6UHWChI[&+<VdL+<VdL
+<WR'1c6CA/kms'+<VdL+>c,82'>^J9eKZn+<VdL1+k=9+<VdL+<VdL+<Vd^3\i]<5qYka>R_#_
+<VdL+<VdL+<VdL+<VdL:.69J+<VdL+<VdL+<Vdd2o;dA+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<XE\%13OO+<WsdA7]4YEa`i.+<VdL+>GQ22)HFA/kms'+<VdL2EENI+Aa[b/mKMA+<Vd\/ibU.
+<VdL+<VdL+<WC"0f1"=/kms'%144#+<VdL+<VdL+<VdL+<Ve%73E]q+<VdL+<VdL+<WQt_QY.*
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+APuI$4R=b+AuodAS`J3+<VdL+<VdL0fh$C+Aa[b/mKMA
+<Vdb3]&Q6:bGHp>Tb.3+<W?j0ea^m+<VdL+<VdL+>GW40f:(>/kms'%144#+<VdL+<VdL+<VdL
+<Vdq+<VdL+<VdL+<VdL+<WI"_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#6XaqF
Ci!N&+<VdL+<VdoBl[^+D/aE0@<,Tq+<WR'1c$7N/kms'+<VdL+>>E&0H_J\+<VdL+<VdL6YURN
F_u)9Cgh?h%144#+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<WX&_QY.*+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SYe$6UHXASc0kFE2)?+<VdL+<WBo3\iQ8:bGHp>Tb.3+>u8<0d':F9eKZn
+<VdL0eP@<+<VdL+<VdL+<Vd]3\iH55qYka>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL
+<Vda1;^7<+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<X_p$4R=b+@9X]ASc!jF`V+:+<VdL0etdI
0d':F9eKZn+<Vdc3\iE4:bGHp>Tb.3+<W?j1b^$p+<VdL+<VdL+>Go72BY:<9eKZ[$6UH6+<VdL
+<VdL+<VdL+<X)q+<VdL+<VdL+<VdL+>kslYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG
$6UHiBl[p1F!)SJ+<VdL+<WI$0f:(M/kms'+<VdL+?2D:0d':F9eKZn+<VdL/MSk70H_J\+<VdL
+<Vd]3\`?35qYka>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vd^3Pr!C+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<XTa%13OO+<XL$De"'2DBL&E+<VdL+>Pu71E]LH9eKZn+<VdL3BAiO
+Aa[b/mKMA+<Vd\/i57)+<VdL+<VdL+<WI$1GL"</kms'%144#+<VdL+<VdL+<VdL+<Vdq+<VdL
+<VdL+<VdL+<WNr_QY.*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+BK!Z%144#:iC/dFa,#O+<VdL
+<Vd]3\WK8:bGHp>Tb.3+<W[*0ejeI/kms'+<VdL+>GK(0H_J\+<VdL+<VdL2**KH+@.VS/mJhm
+<VdL+<VdL+<VdL+<VdL+AP?J+<VdL+<VdL+<VdL2`/CU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Ve%<t,KG$6UHhAS6.%F`SZJ+<VdL+<WL%1c6CP/kms'+<VdL+>GT31Gg4N/kms'+<VdL0eP::
+<VdL+<VdL+<Vdb3\iT95qYka>R_#_+<VdL+<VdL+<VdL+<VdL73E]q+<VdL+<VdL+<Vda35VmB
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<X_p$4R=b+B*5n@ppK&+<VdL+<VdL3BArN+Aa[b/mKMA
+<Vd^3]/`:5qYka>Tb.3+<WBk0JFUl+<VdL+<VdL+?2D:1*Ak89eKZ[$6UH6+<VdL+<VdL+<VdL
+<X)q+<VdL+<VdL+<VdL+>YmlYTP&2+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL<t,KG$6UHWEas36
EclFG+<VdL+<WX)1,0nJ/kms'+<VdL+>Z&81a#(:9eKZn+<VdL/MJe30H_J\+<VdL+<Vd]0fh!E
+@.VS/mJhm+<VdL+<VdL+<VdL+<VdL+AP?J+<VdL+<VdL+<VdL2Dr@U+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<Ve%<t,KG$6UHWDKK<-ATJt:+<VdL+<WC"1cQUD/kms'+<VdL+>l2;3$:L>9eKZn
+<VdL0J5@>+<VdL+<VdL+<Vd]0KLmI+@.VS/mJhm+<VdL+<VdL+<VdL+<VdL+B(]O+<VdL+<VdL
+<VdL0fd+T+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve*<t,KG$6UHlAS5Eo+<VdL+<VdL+<WBm
3\rZ::bGHp>Tb.3+?2D91a#(:9eKZn+<VdL+<VdL+<VdL+<VdL+<Vda3\i]<:bGHp>R_#_+<VdL
+<VdL+<VdL+<VdL:.69J+<VdL+<VdL+<Vdd28ZR?+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<XE\
%144#/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:18<[B45mrDf/o\FCB32?ZU".Ch[s41,`'HGuJ-`@<-'X@WQ+$
G%ki,9PJQi<b6;mBl@lP1G1?j$<(k`FCeuLGs+Q,AmoguF<FA"A7]cj$<(_c:L\'M@rsk#AS5^p
:L\'M@rr.e#u>#FARfgR6p3:V1bgmK/2ReC#t&WJD/X;e@;TR=6#:LRATD4$H4:2f6Xb(FCi<r]
F_tT!E]k[V+@0mU%13D/@<>poDeDgfD.7's4Ye`76#L3B$40(.FCB!(B23Sd@V'RC85^Qb2%9m!
6Xb(FCi<r]F_tT!E]lr]+>Yl7%13D/@<>poDeDgfD.7's4]=XB+?))82DkpN#t&-C@;Kjp:3CD_
ATBq#6m+!83$:$e$40(.FCB!(B23Sd@V'RC84cW#2E*Q($40(.FCB!(B23Sd@V'RC80Bc!$40+3
AmoguF@g@\AU$?l%15OAA5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;
@VTIaF@ek`1+Y.?1GCg?0F\?q6Z6gYDf/<YD.PjrDJNZh%13D/Df'?0DGFVWAN`dsBlY>)C`lni
F`Lo+%13D/Df'?0DGFVWAN`Rq@:UL!Afso`De3g#GRXud6Xb(FCi<r]F_tT!E]k[V+Ac`_%13D/
@<>poDeDgfD.7's4\/Hn3B7NU#t&-C@;Kjp:3CD_ATBq)6m+6?2DGXJ#t&-C@;Kjp:3CD_ATBq4
5u/UY0f:XF1CXZt6Xb(FCi<r]F_tT!E]ld.6m+'<1*A;+2@U!"6Xb(FCi<r]F_tT!E]lcd6m+'<
1*AA0%13D/@<>poDeDgfD.7's4\/.@+>PW10b"Hr6Xb(FCi<r]F_tT!E]lcf<?O:U0Jj4G#t/?:
@<HC.8T&'MGWdbj$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;
C1Ums8OP]s/2]1;/2@YA#t&WJD/X;e@;TR=;eT`Q@<)ea#t&WJD/X;e@;TR=;e'KPA79Kf$40(<
D/F3/:18!N4]?$*A8-&n$40(<D/F3/:18!N4]>j(ARoLq%13D/@<>poDeDgfD.7's4X=GY6Xb$F
$40(.FCB!(B23Sd@V'RC0fU:C@<2kb#t&-C@;Kjp:3CD_ATBq);BR\P3"63$6Xb(FCi<r]F_tT!
E]lr]+>Yr21(=Qs6Xb(FCi<r]F_tT!E]m>e:EVDI2D@-#$40(.FCB!(B23Sd@V'RC6:;qH2)QL2
1H>mO#t&-C@;Kjp:3CD_ATBq)8PgNc0fM*%$40(.FCB!(B23Sd@V'RC6<,-_1Gh*$$40+3Amogu
F@g@\AU$?n%15OAA5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIa
F@ek`1+Y1;0f(@7%13D/Df'?0DGFVWAN`FmDIm9"94;OVDfZ?p#t&WJD/X;e@;TR=6tpURA75oS
#t&WJD/X;e@;TR=;IOHO+B)i]F`(_u%13D/@<>poDeDgfD.7's4X=JZ6Y1?K$40(.FCB!(B23Sd
@V'RC0fC.AATS@g#t&-C@;Kjp:3CD_ATBq);BR\R3"63$6Xb(FCi<r]F_tT!E]lr]+>bf.3"63$
6Xb(FCi<r]F_tT!E]m>e:EVAK2`*9D%13D/@<>poDeDgfD.7's4[MOZ/MT4-0ekNp$40(.FCB!(
B23Sd@V'RC84cW#1GggH%13D/@<>poDeDgfD.7's4]GQO+>l,82_?d@1G^U;%13D0AS,@nCii6d
A7^!K1CX[[DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:1
4YeQE0JP+4%13D/Df'?0DGFVWAN`=hBOu4%@<)ea#t&-C@;Kjp:3CD_ATBpZ@3A!ZBakCU6Xb(F
Ci<r]F_tT!E]lrk+>c#4%13D/@<>poDeDgfD.7's4\.s`0eb==1^scu6Xb(FCi<r]F_tT!E]m>e
:EVDK1,LsF%13D/@<>poDeDgfD.7's4[W%6+>#H0+>Yf1%13D/@<>poDeDgfD.7's4\/.@+?)/;
3"63$6Xb(FCi<r]F_tT!E]mB)6Qe?F2`NBD1H@<E0b"Hr6tKt=F_l.kDId='4Z!TT7;cX3@VTIa
F?NQ<Gu%maARffk$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V1G^gE1Ft3h$40(<
D/F3/:18!N4\0!u@;HA[#t&-C@;Kjp:3CD_ATBpZ@3@jVBakCU6Xb(FCi<r]F_tT!E]l-5+@1$^
%13D/@<>poDeDgfD.7's4\/Hn2DI-"$40(.FCB!(B23Sd@V'RC844RT1-%*M%13D/@<>poDeDgf
D.7's4]=XB+?)/42),OI#t&-C@;Kjp:3CD_ATBq#6m+!81*AA,2@U!"6Xb(FCi<r]F_tT!E]lrb
:`qbX3&D'O#t&-C@;Kjp:3CD_ATBq5=[O;d2`3QH1,L^D/MR\A#t/?:@<HC.8T&'MGWdnn$:SiC
:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2f@:0b"Hr
6Z6gYDf/<YD.Pk,Derj&Bla^j#t&WJD/X;e@;TR=9Q+HQF*(i2%13D/Df'?0DGFVWAN`dsG%kSt
FDl26@1<PM6Z6gYDf/<YD.Pk*DfTr5+B*AjEX`?^6Xb(FCi<r]F_tT!E]k[V+B;-M%13D/@<>po
DeDgfD.7's4Y\'Z9kb%D#t&-C@;Kjp:3CD_ATBq);BReO1^scu6Xb(FCi<r]F_tT!E]lr]+?2>@
0F\?q6Xb(FCi<r]F_tT!E]m>e:EVGI3"63$6Xb(FCi<r]F_tT!E]l`W+=fE2+?0f;#t&-C@;Kjp
:3CD_ATBq)8PgNa0fM!L%13D/@<>poDeDgfD.7's4]><L+?;4e$40+3AmoguF@g@\AU$?r%15OA
A5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+Y1;0f(@;
%13D/Df'?0DGFVWAN`=h@;TFn%13D/@<>poDeDgfD.7's4X>#%+@U<b%13D/@<>poDeDgfD.7's
4\/Hn3&ro,$40(.FCB!(B23Sd@V'RC844RT3&WNI%13D/@<>poDeDgfD.7's4]=XB+>PZ00ekHn
$40(.FCB!(B23Sd@V'RC6Z5@8/Mo.(2`EH#$40(.FCB!(B23Sd@V'RC6Vp/n/Mo.(1,Uis$40(.
FCB!(B23Sd@V'RC84cW#0f(dG2[p*#6Xb(FCi<r]F_tT!E]m6&+>OB5#t/?:@<HC.8T&'MGWdtp
$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2]1;
/2I_B#t&WJD/X;e@;TR=9kA3X@<)ea#t&-C@;Kjp:3CD_ATBpZ@3@pKF:AQ`6Xb(FCi<r]F_tT!
E]lE<+@B^^%13D/@<>poDeDgfD.7's4\/Hn3AE5t$40(.FCB!(B23Sd@V'RC844RT3&ilS%13D/
@<>poDeDgfD.7's4]=XB+>GT)3AN8t$40(.FCB!(B23Sd@V'RC6:;qH0Jah.0f][M#t&-C@;Kjp
:3CD_ATBq)8PgNa1bgdD%13D/@<>poDeDgfD.7's4]GQO+>>K,3%ZjC0fUa>%13D0AS,@nCii6d
A7^!K3"63`DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:1
4YeQH2(UEj$40(<D/F3/:18!N4\]X2AmoHa$40(<D/F3/:18!N4\]X2E+iZq%13D/Df'?0DGFVW
AN`=qB4Ysp@LWYN6Xb(FCi<r]F_tT!E]k[V+AcWi%13D/@<>poDeDgfD.7's4Ynl::h=YV$40(.
FCB!(B23Sd@V'RC85^Qb0JPKq$40(.FCB!(B23Sd@V'RC844RU0KCgB%13D/@<>poDeDgfD.7's
4]=XB+>Yu93&_9R#t&-C@;Kjp:3CD_ATBq#6m+!:3?U=:2[p*#6Xb(FCi<r]F_tT!E]lrb:`qJM
3&WQ%$40(.FCB!(B23Sd@V'RC6<-i)1c,XK#t/?:@<HC.8T&'MGWe%r$:SiC:L\'M@rsk4CO&]b
C1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2T(>3@llo$40(<D/F3/:18!N
4[EmpAR](g@;ZM]#t&WJD/X;e@;TR=:gnBYCh[BnF_qQp#t&-C@;Kjp:3CD_ATBpZ@3ANXFU\Za
6Xb(FCi<r]F_tT!E]lB@+B2cl%13D/@<>poDeDgfD.7's4\/Hn0f1aH%13D/@<>poDeDgfD.7's
4\.s`1-%'F3=Q<%6Xb(FCi<r]F_tT!E]m>e:EVYS0JYQr$40(.FCB!(B23Sd@V'RC6:;qH0fC.4
1-#dN#t&-C@;Kjp:3CD_ATBq)8PgNb0f1X?%13D/@<>poDeDgfD.7's4[N-k2)R&s$40+3Amogu
F@g@\AU$?m0F\@XDIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M
@rt:14YeQB/2.M?#t&WJD/X;e@;TR=;JBcTC^g^X6Xb(FCi<r]F_tT!E]k[W+A[#l%13D/@<>po
DeDgfD.7's4Y\r>:NC.Y$40(.FCB!(B23Sd@V'RC85^Qb2_d)t$40(.FCB!(B23Sd@V'RC844RV
1b^mH%13D/@<>poDeDgfD.7's4]=XB+>GZ,3A<B$$40(.FCB!(B23Sd@V'RC6:;qJ0K:100K(]r
$40(.FCB!(B23Sd@V'RC84cW#1,LgD2@U!"6Xb(FCi<r]F_tT!E]m?#7NaTI3"63$6tKt=F_l.k
DId='4Y\Z#$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums
8OP]s/2T(>3@lin$40(<D/F3/:18!N4[WXsASc0k%13D/Df'?0DGFVWAN`P%@<<VjFCB2!$40(<
D/F3/:18!N4]?$*E+ig'A1)F@;flGg%13D/Df'?0DGFVWAN`t+DJ*O$%13D/@<>poDeDgfD.7's
4X=GY6$72W$40(.FCB!(B23Sd@V'RC0f'q<F`Iou#t&-C@;Kjp:3CD_ATBq);BR\Q0K9LK#t&-C
@;Kjp:3CD_ATBq)6m+9B0JYWt$40(.FCB!(B23Sd@V'RC;aF2%1b^XD2@U!"6Xb(FCi<r]F_tT!
E]l`W+=f9++>GQ/2[p*#6Xb(FCi<r]F_tT!E]lrb:`qMM2D@*"$40(.FCB!(B23Sd@V'RC6:"Kl
1,TLJ#t/?:@<HC.8T&'MGWdc:%15OAA5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^U
C1Ums%13D;@VTIaF@ek`1+Y:<0e>!f$40(<D/F3/:18!N4[N^rCghF+Bm:'o#t&-C@;Kjp:3CD_
ATBpZB-9ujBakCU6Xb(FCi<r]F_tT!E]l07+A[#l%13D/@<>poDeDgfD.7's4\/Hn0fM*H%13D/
@<>poDeDgfD.7's4\.s`1Gq!I3"63$6Xb(FCi<r]F_tT!E]m>e:EVAH1,h$D%13D/@<>poDeDgf
D.7's4[MOZ.kik(3AEN'$40(.FCB!(B23Sd@V'RC84cW#1,UjD2@U!"6Xb(FCi<r]F_tT!E]l`h
:`q\V%13D0AS,@nCii6dA7^!K0f'7G7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M@rsk#AS5^p
:L\'M@rr.e#u>#FARfgR6p3:V1bgmK/2@YA#t&WJD/X;e@;TR=7;QjMFD)*j#t&WJD/X;e@;TR=
6#:FIFD)*j#t&-C@;Kjp:3CD_ATBpZ@N\WYFU\Za6Xb(FCi<r]F_tT!E]l-31*BP)FU\Za6Xb(F
Ci<r]F_tT!E]lrk+>Gf80b"Hr6Xb(FCi<r]F_tT!E]lr]+>Yl33B%BS#t&-C@;Kjp:3CD_ATBq4
5u/U^2_d3M%13D/@<>poDeDgfD.7's4[MOZ.l'(,2`W`)$40(.FCB!(B23Sd@V'RC84cW#1,UmD
3"63$6Xb(FCi<r]F_tT!E]l`T;BR_Q%13D0AS,@nCii6dA7^!K0f0=H7;cX3@VTIaF?NQ<Gu%ma
ARffk$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V0J"sg$40(<D/F3/:18!N4[En%
Bl%3p%13D/@<>poDeDgfD.7's4X=S]:NC.Y$40(.FCB!(B23Sd@V'RC1c?IPEbPsi#t&-C@;Kjp
:3CD_ATBq);BR\S0Ja.F#t&-C@;Kjp:3CD_ATBq)6m+9E0et]t$40(.FCB!(B23Sd@V'RC;aF2%
0f(R@1c>dM#t&-C@;Kjp:3CD_ATBq#6m+'80d&J73=Q<%6Xb(FCi<r]F_tT!E]lrb:`qMO1GLTn
$40(.FCB!(B23Sd@V'RC6<-i)3&(jL#t/?:@<HC.8T&'MGWdc=%15OAA5?ZLARfgF;epYS@VTIa
F:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+YC90F\?q6Z6gYDf/<YD.PjsATVL"
B4Z4,AIStQ6Xb(FCi<r]F_tT!E]k[V+A[#l%13D/@<>poDeDgfD.7's4Z,2A:NC.Y$40(.FCB!(
B23Sd@V'RC85^Qc0K(Wp$40(.FCB!(B23Sd@V'RC844RV3B/]I%13D/@<>poDeDgfD.7's4]=XB
+>GT,1,gos$40(.FCB!(B23Sd@V'RC6:;qH0K1+/0Jt]s$40(.FCB!(B23Sd@V'RC84cW#1,h3Q
3=Q<%6Xb(FCi<r]F_tT!E]lr92@U!"6tKt=F_l.kDId='4Y\i($:SiC:L\'M@rsk4CO&]bC1Ums
%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2Jh2%13D/Df'?0DGFVWAN`ChDJsK:
Et&H_6Xb(FCi<r]F_tT!E]k[V+@BRX%13D/@<>poDeDgfD.7's4\/Hn1,C[D%13D/@<>poDeDgf
D.7's4\.s`1c7'G3"63$6Xb(FCi<r]F_tT!E]m>e:EVDK1c.0G%13D/@<>poDeDgfD.7's4[W%6
+>#H++?;/5%13D/@<>poDeDgfD.7's4\/.@+>Y].1H5gN#t&-C@;Kjp:3CD_ATBq$;H4i"0JGBo
$40(.FCB!(B23Sd@V'RC=%#t00K([C0J,.;1boLI#t/?:@<HC.8T&'MGWdc?%15OAA5?ZLARfgF
;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+Y=?2_d'B0fU^@%13D/
Df'?0DGFVWAN`t+EbTZ;%13D/@<>poDeDgfD.7's4X=GY6VUtu$40(.FCB!(B23Sd@V'RC3?U[`
@1<PM6Xb(FCi<r]F_tT!E]lr]+>c&<0f9CI#t&-C@;Kjp:3CD_ATBq45u/UX2).'M0b"Hr6Xb(F
Ci<r]F_tT!E]l`W+>#<++>G`60b"Hr6Xb(FCi<r]F_tT!E]lrb:`qPL1Gh*$$40(.FCB!(B23Sd
@V'RC7nOmZ1c,XK#t&-C@;Kjp:3CD_ATBq"7meCR%13D0AS,@nCii6dA7^!K0fTUL7;cX3@VTIa
F?NQ<Gu%maARffk$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V1GC@6%13D/Df'?0
DGFVWAN`=iBOPpi%13D/@<>poDeDgfD.7's4X=S]6VUtu$40(.FCB!(B23Sd@V'RC1,0n=9jnJ<
#t&-C@;Kjp:3CD_ATBq);BR_Q0fTUL#t&-C@;Kjp:3CD_ATBq)6m+?B0K;'%$40(.FCB!(B23Sd
@V'RC;aF2%0fLjG2`;*P#t&-C@;Kjp:3CD_ATBq$DaY^"1,pC42E!H&$40(.FCB!(B23Sd@V'RC
6Vp/n/M]:.0f:pK%13D/@<>poDeDgfD.7's4\/.@+>Yf22`V<S#t/?:@<HC.8T&'MGWdcA%15OA
A5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+Y1:3&`WQ
/2.M?#t&WJD/X;e@;TR=:i^JaH#IR0$40(<D/F3/:18!N4[Et'ASY]`$40(.FCB!(B23Sd@V'RC
,[hf_9kb%D#t&-C@;Kjp:3CD_ATBpg0H`_WBakCU6Xb(FCi<r]F_tT!E]lrk+>Pr61CXZt6Xb(F
Ci<r]F_tT!E]lr]+>tr21,04F#t&-C@;Kjp:3CD_ATBq45u/UX0f:mI2@U!"6Xb(FCi<r]F_tT!
E]l`W+=f-'+>Gf23=Q<%6Xb(FCi<r]F_tT!E]lrb:`qPQ1,h3&$40(.FCB!(B23Sd@V'RC9Lr))
1,C]q$40+3AmoguF@g@\AU$?n0F\@XDIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z
@VTIaF:AQ`:L\'M@rt:14YeQD3B/iN/2.M?#t&WJD/X;e@;TR=:iC/dFa+?&#t&-C@;Kjp:3CD_
ATBpZ@N\0PD%-gY6Xb(FCi<r]F_tT!E]l?@+@g![%13D/@<>poDeDgfD.7's4\/Hn1-%?K%13D/
@<>poDeDgfD.7's4\.s`2DR-D3=Q<%6Xb(FCi<r]F_tT!E]m>e:EVSV2E!H&$40(.FCB!(B23Sd
@V'RC6:;qH1,pC21c@-!$40(.FCB!(B23Sd@V'RC84cW#1H.9K2@U!"6Xb(FCi<r]F_tT!E]l`h
+>l,4%13D0AS,@nCii6dA7^!K1,04F7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M@rsk#AS5^p
:L\'M@rr.e#u>#FARfgR6p3:V1GC@7%13D/Df'?0DGFVWAN`>&BlA#$$40(.FCB!(B23Sd@V'RC
,\8)c@<)ea#t&-C@;Kjp:3CD_ATBq);BRbO0K0FJ#t&-C@;Kjp:3CD_ATBq)6m+EC0et`u$40(.
FCB!(B23Sd@V'RC;aF2%1,CdJ1GTCH#t&-C@;Kjp:3CD_ATBq$:dcEX2)ud60JbHn$40(.FCB!(
B23Sd@V'RC84cW#1bg[?2[p*#6Xb(FCi<r]F_tT!E]lr];]meL3A:mL#t&-C@;Kjp:3CD_ATBq8
6rP3^3&36H/N#OE0b"Hr6tKt=F_l.kDId='4Yec%$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%ma
ARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2Jt21CXZt6Z6gYDf/<YD.Pk/F_G2tC^g^X6Xb(F
Ci<r]F_tT!E]k[a+BE&i%13D/@<>poDeDgfD.7's4\/Hn1H%$G%13D/@<>poDeDgfD.7's4\.s`
2`N]P2[p*#6Xb(FCi<r]F_tT!E]m>e:EVDJ0K;!N%13D/@<>poDeDgfD.7's4[X-U+>#E*+>c)=
0F\?q6Xb(FCi<r]F_tT!E]lcd6m+'<1*AA/2Du!O#t&-C@;Kjp:3CD_ATBq)8PgNd1cR3J%13D/
@<>poDeDgfD.7's4]=d<+>GQ1%13D0AS,@nCii6dA7^!K1,B@H7;cX3@VTIaF?NQ<Gu%maARffk
$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V0f_0L/2.M?#t&WJD/X;e@;TR=9ke$T
CgggfA9Dr&$40(.FCB!(B23Sd@V'RC,[ql`@<)ea#t&-C@;Kjp:3CD_ATBq);BRbR3&M-P#t&-C
@;Kjp:3CD_ATBq)6m+HC0JGEp$40(.FCB!(B23Sd@V'RC;aF2%1,UaB3Ah6Q#t&-C@;Kjp:3CD_
ATBq$:dcEX2E;m70JYEn$40(.FCB!(B23Sd@V'RC84cW#1c7$E3"63$6Xb(FCi<r]F_tT!E]mB)
6QeBE0JG(62D?p=0b"Hr6tKt=F_l.kDId='4Yei'$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%ma
ARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2B%?/2.M?#t&WJD/X;e@;TR=6#:LR@<,lf$40(.
FCB!(B23Sd@V'RC,[hfdH!q-h#t&-C@;Kjp:3CD_ATBpi0H`o3@1<PM6Xb(FCi<r]F_tT!E]lrk
+>Yr53"63$6Xb(FCi<r]F_tT!E]lr]+?2)73B%BS#t&-C@;Kjp:3CD_ATBq45u/UX1H%3O0b"Hr
6Xb(FCi<r]F_tT!E]l`W+>#9,+>Pi70F\?q6Xb(FCi<r]F_tT!E]lrb:`qSQ1H@,u$40(.FCB!(
B23Sd@V'RC80Bf"$40+3AmoguF@g@\AU$?n2%9m]DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIa
F?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:14YeQE2`!-=0F\?q6Z6gYDf/<YD.Pk.AS6.%F`S!!#t&WJ
D/X;e@;TR=6=FqLCh[C%Et&H_6Z6gYDf/<YD.Pk'@;KB^$40(.FCB!(B23Sd@V'RC,[hfhAT&"b
#t&-C@;Kjp:3CD_ATBpi1*B8%D[d$[6Xb(FCi<r]F_tT!E]lrk+>Z#;1(=Qs6Xb(FCi<r]F_tT!
E]lr]+?2;?0JO"D#t&-C@;Kjp:3CD_ATBq45u/U`3&rlU%13D/@<>poDeDgfD.7's4[MOZ.kre%
1,1UG%13D/@<>poDeDgfD.7's4\/.@+>c):2E;3R#t&-C@;Kjp:3CD_ATBq4<(91s2@U!"6tKt=
F_l.kDId='4Yeo)$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;
C1Ums8OP]s/2K4@0J"pf$40(<D/F3/:18!N4[aF%BOqV[#t&-C@;Kjp:3CD_ATBpZ@3AQE@1<PM
6Xb(FCi<r]F_tT!E]l96+B;-E%13D/@<>poDeDgfD.7's4\/Hn1c$g?%13D/@<>poDeDgfD.7's
4\.s`3Ai]S3=Q<%6Xb(FCi<r]F_tT!E]m>e:EVAL1H73#$40(.FCB!(B23Sd@V'RC6:;qH2DQC0
0fC`q$40(.FCB!(B23Sd@V'RC84cW#2)I!F0b"Hr6Xb(FCi<r]F_tT!E]l`h+>GQ/2[p*#6tKt=
F_l.kDId='4Yer*$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;
C1Ums8OP]s/2B"@2`!EE0b"Hr6Z6gYDf/<YD.PjuASu'gDerhk$40(.FCB!(B23Sd@V'RC,[qli
AT&"b#t&-C@;Kjp:3CD_ATBpo1a#J'D[d$[6Xb(FCi<r]F_tT!E]lrk+>br31^scu6Xb(FCi<r]
F_tT!E]lr]+>GQ*2Dd?%$40(.FCB!(B23Sd@V'RC;aF2%3B9&Q3=Q<%6Xb(FCi<r]F_tT!E]l`W
+=f0(+>P`41CXZt6Xb(FCi<r]F_tT!E]lrb:`qVS2D[)t$40(.FCB!(B23Sd@V'RC6<,-d0Jj4G
#t/?:@<HC.8T&'MGWdfA%15OAA5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums
%13D;@VTIaF@ek`1+Y.63ArED%13D/Df'?0DGFVWAN`OtAStpi+@C'fG%hBm#t&WJD/X;e@;TR=
7qlOP@;$cRBQ\?(@LWYN6Xb(FCi<r]F_tT!E]k[\+@C0m%13D/@<>poDeDgfD.7's4Z"9KEcqm!
#t&-C@;Kjp:3CD_ATBq);BReS2DP^K#t&-C@;Kjp:3CD_ATBq)6m+3<2E!<J%13D/@<>poDeDgf
D.7's4]=XB+>G`40fM!"$40(.FCB!(B23Sd@V'RC6:;qJ0fC.11bpls$40(.FCB!(B23Sd@V'RC
84cW#2*!WM1CXZt6Xb(FCi<r]F_tT!E]m;e;BRh+$40+3AmoguF@g@\AU$?n3=Q<aDIcOPC1Ums
4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:14YeQC2CpQl$40(<D/F3/
:18!N4[ERuFa+?&#t&-C@;Kjp:3CD_ATBpZ@5/llEchfu#t&-C@;Kjp:3CD_ATBq);BReT1GB7F
#t&-C@;Kjp:3CD_ATBq)6m+3<3&3<M%13D/@<>poDeDgfD.7's4]=XB+>Pf/3A<9!$40(.FCB!(
B23Sd@V'RC6Vp/n/N,@,1,h$I%13D/@<>poDeDgfD.7's4\/.@+>to40fTUL#t&-C@;Kjp:3CD_
ATBq%<DFYl2)5UJ#t&-C@;Kjp:3CD_ATBq86rP3_1,:aG/N,C=2@U!"6tKt=F_l.kDId='4Ync$
$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/28h=
2CpNk$40(<D/F3/:18!N4\&pjEclU9$40(.FCB!(B23Sd@V'RC,\J5eEchfu#t&-C@;Kjp:3CD_
ATBq);BReT2DYdL#t&-C@;Kjp:3CD_ATBq)6m+3<3&rZK%13D/@<>poDeDgfD.7's4]=XB+>Pc-
0JPQs$40(.FCB!(B23Sd@V'RC6Z5@8/N#F/1c6sD%13D/@<>poDeDgfD.7's4[W%6+>#H/+>ko5
1(=Qs6Xb(FCi<r]F_tT!E]lrb:`qYN0K:lu$40(.FCB!(B23Sd@V'RC6rcu)0etQp$40+3Amogu
F@g@\AU$?o0b"IYDIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M
@rt:14YeQD3&NHB0b"Hr6Z6gYDf/<YD.PjrCh[g0BFP:T6Xb(FCi<r]F_tT!E]k[Z+B;-E%13D/
@<>poDeDgfD.7's4Z>;B<D?m2$40(.FCB!(B23Sd@V'RC85^Qe3A<<"$40(.FCB!(B23Sd@V'RC
844RT0etIC2%9m!6Xb(FCi<r]F_tT!E]m>e:EVDP2)R0!$40(.FCB!(B23Sd@V'RC6:;qH2)ZR3
2DR3#$40(.FCB!(B23Sd@V'RC84cW#2DR9M2@U!"6Xb(FCi<r]F_tT!E]l`_9cu2#$40+3Amogu
F@g@\AU$?o1(=RZDIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M
@rt:14YeQC2CpNk$40(<D/F3/:18!N4]?<6@pofR#t&-C@;Kjp:3CD_ATBpZ@3ATbEX`?^6Xb(F
Ci<r]F_tT!E]l<>+BE2s%13D/@<>poDeDgfD.7's4\/Hn2)$mG%13D/@<>poDeDgfD.7's4\.s`
0ekRE2)l$P#t&-C@;Kjp:3CD_ATBq45u/UX2)dNN1CXZt6Xb(FCi<r]F_tT!E]l`W+>#<%+>Yo7
1(=Qs6Xb(FCi<r]F_tT!E]lrb:`qYR1cI6#$40(.FCB!(B23Sd@V'RC6<-i)0f:Wo$40+3Amogu
F@g@\AU$?o1CX[[DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M
@rt:14YeQD3&NHB1(=Qs6Z6gYDf/<YD.PjrChmHnA.8kP6Z6gYDf/<YD.PjsASu($DIIU"%13D/
@<>poDeDgfD.7's4X=\`<D?m2$40(.FCB!(B23Sd@V'RC3&MgY9jnJ<#t&-C@;Kjp:3CD_ATBq)
;BRhO3ACsM#t&-C@;Kjp:3CD_ATBq)6m+3>0JbF@%13D/@<>poDeDgfD.7's4]=XB+>bo62)5UJ
#t&-C@;Kjp:3CD_ATBq#6m+!;0H`,)1,fXL#t&-C@;Kjp:3CD_ATBq)8PgNf2`!-B%13D/@<>po
DeDgfD.7's4]GQO+>Yi42_?a>2)d*A%13D0AS,@nCii6dA7^!K1GfOJ7;cX3@VTIaF?NQ<Gu%ma
ARffk$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V0e>!f$40(<D/F3/:18!N4\0!l
@<)ea#t&WJD/X;e@;TR=6"abH@1<PM6Xb(FCi<r]F_tT!E]k[W+@B^X%13D/@<>poDeDgfD.7's
4\/Hn2)7'K%13D/@<>poDeDgfD.7's4\.s`0etL@2),OI#t&-C@;Kjp:3CD_ATBq45u/UY2)7$K
1(=Qs6Xb(FCi<r]F_tT!E]lcd6m+'=3?U182DkpN#t&-C@;Kjp:3CD_ATBq)8PgNf3&`NH%13D/
@<>poDeDgfD.7's4]Y?Y+>Y_]$40(.FCB!(B23Sd@V'RC=%#t00f1R?3%[$B1,9:G#t/?:@<HC.
8T&'MGWdi?%15OAA5?ZLARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIa
F@ek`1+YCD2`<3@%13D/Df'?0DGFVWAN`b!DJNg$F:AQ`6Xb(FCi<r]F_tT!E]k[f+@B^X%13D/
@<>poDeDgfD.7's4Z+?LASqqa#t&-C@;Kjp:3CD_ATBq);BRhP3&h?S#t&-C@;Kjp:3CD_ATBq)
6m+3>1GL[G%13D/@<>poDeDgfD.7's4]=XB+>PW.0fV-%$40(.FCB!(B23Sd@V'RC6Z5@8/Mf7,
3ANKH%13D/@<>poDeDgfD.7's4[W%6+>#B,+>tr.3=Q<%6Xb(FCi<r]F_tT!E]lrb:`qYU3AWH#
$40+3AmoguF@g@\AU$?o2@U!^DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIa
F:AQ`:L\'M@rt:14YeQD3&NHB0F\?q6Z6gYDf/<YD.PjrEas36EclF4$40(<D/F3/:18!N4\BX%
-Z^D/FCB2!$40(.FCB!(B23Sd@V'RC,[hf^Df6'l#t&-C@;Kjp:3CD_ATBpg2BY>)D[d$[6Xb(F
Ci<r]F_tT!E]lrk+>kr30F\?q6Xb(FCi<r]F_tT!E]lr]+>GW.3&ro,$40(.FCB!(B23Sd@V'RC
;aF2%0eb:A1c,XK#t&-C@;Kjp:3CD_ATBq#6m+!73?U(92`D0Q#t&-C@;Kjp:3CD_ATBq)8PgNf
3ArfP%13D/@<>poDeDgfD.7's4]GQO+>G]31+b4;1H$g>%13D0AS,@nCii6dA7^!K1H,aM7;cX3
@VTIaF?NQ<Gu%maARffk$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V2)[0J1H$d<
%13D/Df'?0DGFVWAN`q*B5)0)94`!_@<HU5Et&H_6Z6gYDf/<YD.Pk0Des-)@;ZM]#t&-C@;Kjp
:3CD_ATBpZ@5/llASqqa#t&-C@;Kjp:3CD_ATBq);BRhR2)u*Q#t&-C@;Kjp:3CD_ATBq)6m+3>
3&WNG%13D/@<>poDeDgfD.7's4]=XB+>Pf03&<N'$40(.FCB!(B23Sd@V'RC6Vp/n/N,:*2)I9K
%13D/@<>poDeDgfD.7's4\/.@+?)#53&;!N#t&-C@;Kjp:3CD_ATBq-85gWg0F\?q6Xb(FCi<r]
F_tT!E]lob+>l#:%13D0AS,@nCii6dA7^!K1H5gN7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M
@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V1,q-H/2I_B#t&WJD/X;e@;TR=95e<R@:BZQ#t&WJ
D/X;e@;TR=95e<K@LWYN6Xb(FCi<r]F_tT!E]k[W+B;-M%13D/@<>poDeDgfD.7's4Z=K`9kb%D
#t&-C@;Kjp:3CD_ATBq);BRhS2DYdL#t&-C@;Kjp:3CD_ATBq)6m+3?0fV*J%13D/@<>poDeDgf
D.7's4]=XB+?2)01(=Qs6Xb(FCi<r]F_tT!E]l`W+=fB-+>l/:%13D/@<>poDeDgfD.7's4\/.@
+?)&60K0FJ#t&-C@;Kjp:3CD_ATBq#<DXem2)u*Q#t/?:@<HC.8T&'MGWdiC%15OAA5?ZLARfgF
;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+YCD2`<3D%13D/Df'?0
DGFVWANa4>@V'FgChI<sF^f%o$40(<D/F3/:18!N4^)u;ASrVZChI<sF^f%o$40(.FCB!(B23Sd
@V'RC,[iGN9PIrF$40(.FCB!(B23Sd@V'RC3?V"0@LWYN6Xb(FCi<r]F_tT!E]lrk+>l#40b"Hr
6Xb(FCi<r]F_tT!E]lr]+>GZ+3&E?!$40(.FCB!(B23Sd@V'RC;aF2%0f:pM1b]@G#t&-C@;Kjp
:3CD_ATBq#6m+'92'=\82Du!O#t&-C@;Kjp:3CD_ATBq)8PgNg1,^mC%13D/@<>poDeDgfD.7's
4]=mD+>Gi6%13D0AS,@nCii6dA7^!K1b]@G7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M@rsk#
AS5^p:L\'M@rr.e#u>#FARfgR6p3:V1,:gE0J"sg$40(<D/F3/:18!N4[En'BOt[`@1<PM6Z6gY
Df/<YD.PjrCiF'!CMR>f$40(<D/F3/:18!N4\'(#D.*k\#t&-C@;Kjp:3CD_ATBpZ@3@pX64F8.
6Xb(FCi<r]F_tT!E]l9&6ZPL&$40(.FCB!(B23Sd@V'RC85^Qf2`WZ'$40(.FCB!(B23Sd@V'RC
844RT1H@-C2@U!"6Xb(FCi<r]F_tT!E]m>e:EVVQ3&rc($40(.FCB!(B23Sd@V'RC6:;qH1,g=2
2)-iq$40(.FCB!(B23Sd@V'RC84cW#2`<EL2[p*#6Xb(FCi<r]F_tT!E]mB)6Qe-<1-$p@2E<HC
0b"Hr6tKt=F_l.kDId='4Z"l&$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_V
ARffk$40L;C1Ums8OP]s/28\1%13D/Df'?0DGFVWAN`=sFCB3$Et&H_6Xb(FCi<r]F_tT!E]k[V
+B)cg%13D/@<>poDeDgfD.7's4Ye`7;e'_T$40(.FCB!(B23Sd@V'RC85^Qg0f(Wq$40(.FCB!(
B23Sd@V'RC844RT1cR<N3"63$6Xb(FCi<r]F_tT!E]m>e:EVAO1c-pE%13D/@<>poDeDgfD.7's
4[X-U+>#?,+>GT,2)u*Q#t&-C@;Kjp:3CD_ATBq$:dcEX1,^742DdB&$40(.FCB!(B23Sd@V'RC
84cW#3&!9L1CXZt6tKt=F_l.kDId='4Z"o'$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF
6=jeDDGO_VARffk$40L;C1Ums8OP]s/29%61^scu6Z6gYDf/<YD.PjrFE2)(%13D/@<>poDeDgf
D.7's4X=GY<,t86$40(.FCB!(B23Sd@V'RC85^Qg1,1]s$40(.FCB!(B23Sd@V'RC844RT2)$sL
3"63$6Xb(FCi<r]F_tT!E]m>e:EVDM1H.!A%13D/@<>poDeDgfD.7's4[W%6+>#K2+>Po31(=Qs
6Xb(FCi<r]F_tT!E]lrb:`q_Q1,guu$40(.FCB!(B23Sd@V'RC=%5P"0fM*%$40(.FCB!(B23Sd
@V'RC=%#t00fCjJ2_?pJ0JX(E#t/?:@<HC.8T&'MGWdl>%15OAA5?ZLARfgF;epYS@VTIaF:ARU
CO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+YCD2`<3B%13D/Df'?0DGFVWAN`t#@VKTe
$40(.FCB!(B23Sd@V'RC,\S;rE+f[f#t&-C@;Kjp:3CD_ATBpi2'>\6BFP:T6Xb(FCi<r]F_tT!
E]lrk+>u#73"63$6Xb(FCi<r]F_tT!E]lr]+>G`20etTq$40(.FCB!(B23Sd@V'RC;aF2%0fC^A
1GTCH#t&-C@;Kjp:3CD_ATBq#6m+'92'=_42E)'P#t&-C@;Kjp:3CD_ATBq)8PgNh1b^X>%13D/
@<>poDeDgfD.7's4[N-k0ekCB%13D0AS,@nCii6dA7^!K1c,XK7;cX3@VTIaF?NQ<Gu%maARffk
$<(_c:L\'M@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V0e>'h$40(<D/F3/:18!N4]?$&F_kIq
$40(.FCB!(B23Sd@V'RC,]"T%@rDe`#t&-C@;Kjp:3CD_ATBpi2'>h-D[d$[6Xb(FCi<r]F_tT!
E]lrk+>u)42[p*#6Xb(FCi<r]F_tT!E]lr]+>G`53ANK%$40(.FCB!(B23Sd@V'RC;aF2%1,([J
2)GaL#t&-C@;Kjp:3CD_ATBq$DaY^"1H-F20fCsH%13D/@<>poDeDgfD.7's4[W%6+>#B.+?)&6
2%9m!6Xb(FCi<r]F_tT!E]lrb:`q_T3ANN&$40+3AmoguF@g@\AU$?p2%9m]DIcOPC1Ums4]?-A
:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:14YeQD1,q$C/2.M?#t&WJD/X;e
@;TR=;IOWTChR6iF_)!h#t&-C@;Kjp:3CD_ATBpZ@3A?bBFP:T6Xb(FCi<r]F_tT!E]l9;+AZri
%13D/@<>poDeDgfD.7's4\/Hn2Dm?M%13D/@<>poDeDgfD.7's4\.s`0f:sK2DGXJ#t&-C@;Kjp
:3CD_ATBq45u/UX0JYXE1(=Qs6Xb(FCi<r]F_tT!E]l`W+=f0%+>Yc11(=Qs6Xb(FCi<r]F_tT!
E]lrb:`q_U0JbHn$40(.FCB!(B23Sd@V'RC9g`&+1^scu6tKt=F_l.kDId='4Z#&+$:SiC:L\'M
@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/2B1B1+Y6k$40(<
D/F3/:18!N4[j1/@;]ds%13D/Df'?0DGFVWAN`J(@;T^r%13D/@<>poDeDgfD.7's4X=Y_6ul]F
$40(.FCB!(B23Sd@V'RC1G^.AEa]Ca#t&-C@;Kjp:3CD_ATBq);BRkV0Js:H#t&-C@;Kjp:3CD_
ATBq)6m+3B1b^dH%13D/@<>poDeDgfD.7's4]=XB+>Y]02)>[K#t&-C@;Kjp:3CD_ATBq#6m+!;
0d&5,3&1pM#t&-C@;Kjp:3CD_ATBq)8PgNh2`NTL%13D/@<>poDeDgfD.7's4[N-k2D[,u$40+3
AmoguF@g@\AU$?p2[p*_DIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%B5)6Z@VTIaF:AQ`
:L\'M@rt:14YeQC2)@*@0b"Hr6Z6gYDf/<YD.Pk'@<HW66$76jEa`cuEt&H_6Xb(FCi<r]F_tT!
E]k[Z+B)on%13D/@<>poDeDgfD.7's4Ye]6;eL+[$40(.FCB!(B23Sd@V'RC85^Qg3&`i,$40(.
FCB!(B23Sd@V'RC844RT2E<HH1(=Qs6Xb(FCi<r]F_tT!E]m>e:EVDI0JGLA%13D/@<>poDeDgf
D.7's4[X-U+>#B++>GW13&D'O#t&-C@;Kjp:3CD_ATBq)8PgNi0JPOE%13D/@<>poDeDgfD.7's
4]=d<+>Yl0%13D0AS,@nCii6dA7^!K1cPpO7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M@rsk#
AS5^p:L\'M@rr.e#u>#FARfgR6p3:V1,^pE0e>!f$40(<D/F3/:18!N4]Z-,@1<PM6Xb(FCi<r]
F_tT!E]k[V+A@'$%13D/@<>poDeDgfD.7's4Yn3SH#a?$#t&-C@;Kjp:3CD_ATBq);BRnP0JO"D
#t&-C@;Kjp:3CD_ATBq)6m+3C1,1[G%13D/@<>poDeDgfD.7's4]=XB+>u/52`(sN#t&-C@;Kjp
:3CD_ATBq#6m+!93$:"41H5gN#t&-C@;Kjp:3CD_ATBq)8PgNi0etXB%13D/@<>poDeDgfD.7's
4]>'Q+>Ye_$40+3AmoguF@g@\AU$?p3=Q<aDIcOPC1Ums4]?-A:L\'M@rr.e;epYS@VTIaF?Ms%
B5)6Z@VTIaF:AQ`:L\'M@rt:14YeQC3AE'>%13D/Df'?0DGFVWAN`e2DJNqq$40(.FCB!(B23Sd
@V'RC,]b),B6"Fg#t&-C@;Kjp:3CD_ATBpi1a#_0EX`?^6Xb(FCi<r]F_tT!E]lrk+?)#10b"Hr
6Xb(FCi<r]F_tT!E]lr]+>Gf40f^rt$40(.FCB!(B23Sd@V'RC;aF2%0fV*K1cPpO#t&-C@;Kjp
:3CD_ATBq$DaY^"1,^701Gq0M%13D/@<>poDeDgfD.7's4[W%6+>#?,+>u);0F\?q6Xb(FCi<r]
F_tT!E]lrb:`qbR3&NQ&$40+3AmoguF@g@\AU$?q0F\@XDIcOPC1Ums4]?-A:L\'M@rr.e;epYS
@VTIaF?Ms%B5)6Z@VTIaF:AQ`:L\'M@rt:14YeQD0ebLC0e>!f$40(<D/F3/:18!N4[En+@;0`k
$40(.FCB!(B23Sd@V'RC,[hf]EGQ'k#t&-C@;Kjp:3CD_ATBpk1E\u'C^g^X6Xb(FCi<r]F_tT!
E]lrk+?)/82[p*#6Xb(FCi<r]F_tT!E]lr]+>Gi72Dd/u$40(.FCB!(B23Sd@V'RC;aF2%0etU@
1,9:G#t&-C@;Kjp:3CD_ATBq#6m+!63$:%51H#[L#t&-C@;Kjp:3CD_ATBq)8PgNi2`<KQ%13D/
@<>poDeDgfD.7's4\SCF+>Yi70F\?q6tKt=F_l.kDId='4Z+r'$:SiC:L\'M@rsk4CO&]bC1Ums
%16$LGu%maARfgF6=jeDDGO_VARffk$40L;C1Ums8OP]s/29.>/2.M?#t&WJD/X;e@;TR=:h='F
De!Pl$40(.FCB!(B23Sd@V'RC,[hfl@<N(e#t&-C@;Kjp:3CD_ATBq);BRnW3A:mL#t&-C@;Kjp
:3CD_ATBq)6m+3E1H@3I%13D/@<>poDeDgfD.7's4]=XB+>Pc32)d?$$40(.FCB!(B23Sd@V'RC
6Vp/n/N#I03ArfQ%13D/@<>poDeDgfD.7's4\/.@+>GQ(2`3<!$40(.FCB!(B23Sd@V'RC84k!^
0f_$!$40(.FCB!(B23Sd@V'RC=%#t01,(I@2D$dE1c,XK#t/?:@<HC.8T&'MGWdo>%15OAA5?ZL
ARfgF;epYS@VTIaF:ARUCO&]bC1Ums4[N^mBl6^UC1Ums%13D;@VTIaF@ek`1+Y+10b"Hr6Z6gY
Df/<YD.PjuASu'g%13D/Df'?0DGFVWAN`>"Bk1dc%13D/Df'?0DGFVWAN`>"Bk1pi%13D/@<>po
DeDgfD.7's4X=GY6[<;R$40(.FCB!(B23Sd@V'RC2)$.?H"RQn#t&-C@;Kjp:3CD_ATBq);BRnY
1,KFI#t&-C@;Kjp:3CD_ATBq)6m+3E2`!9J%13D/@<>poDeDgfD.7's4]=XB+>c)=1bfFH#t&-C
@;Kjp:3CD_ATBq#6m+!:1a"S31bfFH#t&-C@;Kjp:3CD_ATBq)8PgNa0JY=B3"63$6Xb(FCi<r]
F_tT!E]lr9:*;JO%13D0AS,@nCii6dA7^!K2)>[K7;cX3@VTIaF?NQ<Gu%maARffk$<(_c:L\'M
@rsk#AS5^p:L\'M@rr.e#u>#FARfgR6p3:V2)-X9%13D/Df'?0DGFVWAN`J"Bk@e]#t&-C@;Kjp
:3CD_ATBpZAKXf\B+51S6Xb(FCi<r]F_tT!E]lB):h=8K$40(.FCB!(B23Sd@V'RC85^Qi1GCct
$40(.FCB!(B23Sd@V'RC844RU0K(jK3"63$6Xb(FCi<r]F_tT!E]m>e:EVAI2_[!I%13D/@<>po
DeDgfD.7's4[MOZ.kit+1cRKM%13D/@<>poDeDgfD.7's4\/.@+>GQ/1GL`r$40(.FCB!(B23Sd
@V'RC;]n"Z3"63$6tKt=F_l.kDId='4Z,&*$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF
6=jeDDGO_VARffk$40L;C1Ums8OP]s/29"<2(UEj$40(<D/F3/:18!N4[En%@;0`k$40(<D/F3/
:18!N4[Em,:17jW%13D/Df'?0DGFVWAN`=q+AQ>mBlXXi#t&-C@;Kjp:3CD_ATBpZ@3A'\FU\Za
6Xb(FCi<r]F_tT!E]lrk+?2252%9m!6Xb(FCi<r]F_tT!E]lr]+>PW23AiQ$$40(.FCB!(B23Sd
@V'RC;aF2%1,CUE3AM$N#t&-C@;Kjp:3CD_ATBq$DaY^"1cHO31b^gD%13D/@<>poDeDgfD.7's
4[W%6+>#E/+?;D;0F\?q6Xb(FCi<r]F_tT!E]lrb:`qJH3ANKP%13D/@<>poDeDgfD.7's4]53X
+>ku81CXZt6tKt=F_l.kDId='4Z,)+$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeD
DGO_VARffk$40L;C1Ums8OP]s/3,[G0Jb76%13D/Df'?0DGFVWAN`M$D..6o@<HZ$$40(<D/F3/
:18!N4\p,A:hau\BlbCkATDKqBjkmn%13D/Df'?0DGFVWAN`h1+Accn@qg!,9kA?ZA8,t"@;KY!
%13D/Df'?0DGFVWAN`FqAn5<m@;I&PFa%D5%13D/@<>poDeDgfD.7's4X=GY:ieo3$40(.FCB!(
B23Sd@V'RC1,L+MF$U6B#t&-C@;Kjp:3CD_ATBq);BRqX1,o^M#t&-C@;Kjp:3CD_ATBq)6m+6>
2E<WQ%13D/@<>poDeDgfD.7's4]=XB+>Gl22)6ut$40(.FCB!(B23Sd@V'RC6Z5@8/Mf('0f_$K
0F\?q6Xb(FCi<r]F_tT!E]lcd6m+';0H`833&M-P#t&-C@;Kjp:3CD_ATBq)8PgNa0f(UD3"63$
6tKt=F_l.kDId='4Z,,,$:SiC:L\'M@rsk4CO&]bC1Ums%16$LGu%maARfgF6=jeDDGO_VARffk
$40L;C1Ums8OP]s/2K%A0e>$g$40(<D/F3/:18!N4\]@*CLLZ]$40(.FCB!(B23Sd@V'RC,[hfl
AS2GZ#t&-C@;Kjp:3CD_ATBpk1a#V+B+51S6Xb(FCi<r]F_tT!E]lrk+?2;>0b"Hr6Xb(FCi<r]
F_tT!E]lr]+>PZ20JkWr$40(.FCB!(B23Sd@V'RC;aF2%0ebRC2`M6R#t&-C@;Kjp:3CD_ATBq#
6m+!71a"V81,]RK#t&-C@;Kjp:3CD_ATBq)8PgNa0f(gJ1CXZt6Xb(FCi<r]F_tT!E]mB)6Qe*B
0ek781cI9D0b"Hr6tKt=F_l.kDId='4Z,/-$:SiC:L\'M@rsk4CO&]bC1Ums%15j=G%kStFD5Z2
?W2&TEcYT0G]Y\u:18<Q;flGg?VYMG:18<Q;flGg?VY$HAI1\3H"D#'6tLFRB5V."Bl@kq:18!N
?U]'^D/X6/B6ae^83mPMARfOjDIIX$Df,k^D..'a:18;P;IsHOEb0,uATJ:f0F:QoCgh?uEs^-s
+B<H'@:^QUBl7j0BlaT&BOr<*Deru-.!'K=E[_;N0f]P8+?2BuYR*';0JNl<3*f`H2I-b!0aU-^
E+ig'@<?f%cESKXDIdd+D.R6dAI3HlAKYZ)EcYe>F!,@/G%GIr1Gq,u:*;;P_QX>%/hf0i><#nm
3F*($1'p6aCLLWXcESKgBQ%I"Bk(ju$"ImfDIm?$DIIBn/0H-UBQ%I"Bm:b0Bl[`.+DG^96#pCC
Bk%H*2)GV<+>bjjYR*';1H,VE3*f`C0O5+p1C6uiBOt^_EXC$r+@BRYF(oQ3ASGRa$$9il+C]A&
@<6N5-uW]?6Xb%WBl@s%BjiFs1Gpim:*;DP_QX>%/i#9j><#nm0elrC$8`&WBlI`r@0t5b+@B^^
BaJlpAKZ&*@rH6q+D,Y4B-8TlDf&p!BOQ%*+Eq78+E).-AKZ).AKYT!EcZ=O#r=Cu#u_s$35Vm+
1+k7;$!TAp>;7m=%14s!6"=S>Ec,<+$-odu7<3*Q@;]ccASu$$De:,6BOr<,Bm+'.+=K[!Bk1Xi
F`Su<1G^oq;]mqV_QX>#/i><h><#nm0f*)E$8r2]@;TFh$-odu6#p[NFD5e&Ap%p+/SB*BGA\O>
@;TH[1GUor:*;;J_QX>%/hesc><#nm0f3/F$9&8W@ps4_EXC%$+@U<bA79@i$"7^iFD,6++D,P4
D'3b/+@0LNATDZsEX=NV2@3;)1bceN#r=1h$!TAp>;8!@%15'$9kA3X@<)\"YolDFFD2&!Df]J4
-uW]?FD,5.GA(E$ALRpA0f984+>>XhYR*';2$mJH?!B$A>n%-$#u,,SAmoH]cESKgATDj'BaJ?e
@W-H5De:,6BOr;_Ch7<hA7]fg1GCfq:*;DJ_QX>$/iYTm><#nm0fNAI$8F4@6#:(C@UX:cD@+Un
+B2clEbPhlDes6.G@be;-uW]?FD,5.:i']W@:Wqj.1%ai0aUSt0fHnQ#r!tk2'<303*f`C3*ct#
0eiu4BkM!n$-oh!:NC/fDJ=.uAoDU0+=M&;Aoo/-Df9_?De:+fEbTH0.1%ah1'pl%0K?qR#r!td
1'q/E?!B$D>n%,q1'p<VE+Nj%@0t5a+@1-jBkLjc$#F<tFDPM2F(f,:B5_4##r4Ip#u2U"2Su[)
0J5:=$!TAp>;@m<%14gG#sr3>CghF+Bm9s0ZQN%aBl@m'EsZGiD..6l+Eq77EbTH4#r4G"#u2Ts
2Su[)0eP@@$!TAp>;@p=%14gH#t8ZJ@<?/hcE\Ql@<HU)$#a]m+C]J8FD5W*+EqOABHVD1AKYZ)
Ec,q)1,h3":*;;P_QX>$/iGZq><#nm1,<,E$8FCE6#:FQCgh/ecF"cjEbTH0BlaT%FE2)5B-;,)
+E1n#Eboe'1,h)t;]mbK_QX>$/iPHj><#nm1,E2F$8FFF6=k7MChI=%F(G['Yolh_Bl@m'EsZr%
AKYYpDIal.AftMu/P9GoHGk@W-tt;F/g*r1Bl@l<#r4Fo#u2Ts2o;d*0J54B$!TAp>;A$@%14gK
#t&-=DfBi?$-odu6Xb"LDII)_@qg%1+E(j7@;]RhASuT47;$mbF9s]\1^R)'2)E+R$0$c(0J5:>
$!TAp>;A'A%14gL#ubPYBm"J'cESKZ@;]e#+AH9ZDfTQ5$$9il+EM%2EarcsDJ()1DIjq=E,T]<
Cgh@#Gq:([BOr;sDeC26FCB2=#r4@u#u_s$2o;d*ieWaP/i5Kn><#nm1,`DI$8FOI6"FY;Ea]:"
[3.hFDJ=/79jqdTEbTS$FD,5.G%ku0Bl5>?.1%ae2@3;)1-*4U#r+%i0aV&D?!B'C>n%,r0F:Qr
De"'2D@+Un+@BRTBlbCkBl7j0BlaSiAS,k$AKZ).AKYN%B-8UCBle!+B-:YpAoD^$+EV:.+CoD'
+EMX5E\&>3Bl[p1F"%DN1c5S7+>>[iYR*!91GfDB3*f`D3*ct#1,0)3Des64GR;[$+@g![Bl7j0
F_qFgAT`&A+E)@8ATAo8GA1q;F)Pq=-pqEaFDl1N+O7577qHNg+DGm>FD,5.Anc:,F<G[LBl5@+
1,Lfo:*;;O_QX>$/ho3i><#nm1-&VL$8O@C6$?s\EXC%!0d&hlEbTE"AI2jbBl7Km+DtV)AI1+J
1^R)'2*&OX#r4+i$!TAp>;Is=%14jH#ubt[@;0NacFY3"ASc:*F_qG+BQ%p5ASu'i+D,P4D'3b/
+@0fd;fub^Bl#=CDf0,/6#pCCBk&9'@;TQuAoD]46XakNE-64.1,:Wl;]mnQ_QX>%/i#3h><#nm
1GN/E$8OFE9ke$TCgggfA9Dr"cE\Q[@<-("@:]abF_PE/+E)9CF*),4C`mq1FCfK6#r47k#u_s*
0Z(%#0ePC=$!TAp>;J$?%14jJ#siBHBOPpl$-odu89n`d@:]adDes-0@<-W9F*(i2+E(j7FD,5.
F(KB2ASuSr1,1`p;]mbS_QX>%/hesc><#nm1G`;G$8OLG;IsK`Cise*cESKcAT)I#EsZr%AKYr4
Bl7El#r41o#u2Tt1;^7%0eP7>$!TAp>;J*A%14jL#t/oFBOqLqYq[A$EcYZ#+AH9ZDfTQ5$$9il
+C\njE[PoN@UWb^#r+Fs#u2U$1;^7%0ePFE$!TAp>;J-B%14jM#t/?BAR]Ro@0t5b+A??bDJ=.u
FCAm"+E(j7FD,5.Ch[g*#r+Cq#u2Tt28ZR(1+k:<$!TAp>;J0C%14jN#tJ]@DII2bcEeW\DfU#8
$$'`mBQPA@Bl7Q+De:,6BOr<,@<Q4"#r+@s#u_s$2o;d*1+kO?$!TAp>;J3D%14mF#si'AFa+5<
Yq[@gEckl+EsZ>pBl7Km+D,Y4D'2/RH"D"=DIIBn#r+@q#u_s)1W$@&0eP::$!TAp>;J6E%14mG
#tJE6EclU5cEeW\Eckl+EsZ>pBl7Km+D,Y4D'2/RH"D"=DIIBn#r+@o#u_s(2o;d*0eP@?$!TAp
>;J9F%14mH#siBADffY!cF"cpEcYZ#+AH9ZDfTQ5$"7^iFD,6++D,P4D'3b/+@BRVASc0k#r+=s
#u2U#2Su[)0ePCC$!TAp>;S$>%14mI#ubeW@po\hYom(]EbB*(BlaT&BOr;t@<*K/AftT%Ec)1<
2)ttA+>GUfYR*$:0Jj)?3*f`F0jP4q1GfD(ChmHnA-pPj+B<H'@:^QU@;9_$BlaSsART+\EZf:4
+EV:.+Cno'B4uBuEcW@AAfu2/AKYGrATA)32)>P6+>c*qYR*$:3&M"H3*f`F10k=r1GoJ0@:Wee
$-oh!6Y1.W@<HU)$#F0c+E(j7FD,5.@qBP"@<HSs0f1ls;]mtP_QX>#/iGBi><#nm1c&DH$8XRH
9kA3XASuSrcF=uaASuTuF`M1&F(fK7Ch.*t+E(j7FD,5.@qBP"@<HSs0f1ls;]mkS_QX>%/hf0i
><#nm1c/JI$8XXJ;JBcXC`lA^DKK<0EclF0cET)H6Y1.W@<HU)$"e*oF<GL6+EV:.+Ceu#FCB<4
#r+7j#u_s)0uC.$ieWaO/hf!d><#nm1c8PJ$8XUI6#pIWF`MVG$-odu6>pdaBlaT&BOr;qARTU,
F!,+<@<,lb0f1cp:*;8O_QX@+LlsGE0Jj)?3*f`F2I-b!1H>bFF^ep"ASc!jDKTE&$-odu9PIsV
@:]adDfp/8ATDZ2@r,Rt+=M/?+EV:.+EM%2Ec>`2DCGlH1H5\>+>GdkYR**<1,oSE3*f`F2dHk"
1b]5/De!Hh@L:>c+B<H'@:^QUBl7j0BlaT%BQ%p5ASu'i+D,P4D'3b/+<k]AEcbt;F*(i2+s8:O
@;TRd+EqL1DBNY8+Eq78+EV:*F=\PE@4iZW2)$^,6:2mTJ<M*A6m+9>0I\U\0f(`p:*;JP_QX>%
/hf6k><#nm1cSbM$8aID6#:LRARf4Y$-odu6Z7!`DIFYSDfTDtCh[qsAn>O_Ch4`-DIjq=Bl5&8
BOr;rEc6/>.1%^a2[N5%1,m(S#r4+g1^RAG?!B-G>n%,t1'p6aFCB3$Es^-s+B)cgEc>`,$$'a'
@;I')AfsfVEcW?OBl5&'Des?4.1%^`1C6u&1,d"R#r+%d3=/nL?!B0?>n%,t1C6?hEbSqgcESKk
EbSs"B6A$)+@1-kFE1f+BlaSjDeX*#A0>K)Df$U`@<lF)+DtV)AI1(F3!iM+2EAXY#r+%m1'q/E
?!B0@>n%,t1^R)h@VKTacF4olE+is.@q]Q_F(Jj"DIal6Bl7g"EZf:@+Cf>-EHPi5DfQ.=0Ja#6
+>GdkYR*';1c#GB3*f`G10k=r1c5S<BOQ%"@0t5k+B)cgEc>`,$"Im`CLq$.F`8IB@<-H4De:,6
BOr<-@rHC,Bl@l:F!,R5Bl")03B%7C+>YsnYR*$:2DPSC3*f`G1L1Fs1c>Y<@<5jnBOPOrAI6Ye
+AZriBm!p!BaJHa@:UL!Afu2/AKZ&*Ec>T-F<G(,@<-3rEX=E[2@3,$0f-\N#r4+f0F:rC?!B0C
>n%,t2[MohFCB'$D@+Up+@L6Y@rH7!EsZMk@:UL!Afu2/AKYN(@:sLr#r"@o#u2U#0uC.$1+k=<
$!TAp>;\9D%14pO#tn]LF!*bkF*)G2Ch[qscF"cn@:s:rFCB3(BaJj!F`_;.Ec*"=@<-H4De:,6
BOr;qDg*<PDe:+j@:s:rFCB3(F`Su<0K:lq;]mkQ_QX>$/iYNk><#nm2)\_L$8aaL<b5oP$-odu
9R1YeAI3HlAKYSnCi!g'B-:boB5D-%DfQtDF_l/BEb,P23&(_7+>Z$pYR*!90Ja#>3*f`G2dHk"
2)#>3F`(u/$."5H;dj<QFECr3Bk[l`Df0W<ASc0kFD5Z2+E(j7FD,5.BQ%^4+Cf,-Gp"M(EbT',
.1%[e2@3;)1,d"R#r4+e2@3SI?!B0G>n%,u0aU-^FCAm($-odu6#h$]Cggl]Ao)a,DJ()'@:sCf
+E)9CG'.VCF`M%"0K(]n:*;5N_QX>#/iP]q><#nm2*"qO$8jRF:h='FDe!PhcESKg@<QR,BlaSJ
DeX*#A0>K)Df$V=BOr;TDJ*d"F(c\6@;TQuDe:,6BOr;rDf0W<ASc0kFD5Z2#r"4n#u_s(2o;d*
0ePI@$!TAp>;e0@%14sK#t/?BARYtkYolDZB5VDiFCAm"+E(j7FD,5.BOu&f0JtNj:*;AN_QX>$
/i#9j><#nm2DJJH$8jXH7;cgO$-oq$:h=9JF(kquDf]J4De:,6BOr<"DfTo1#r".l#u2Tt0Z(%#
1+kC;$!TAp>;e6B%14sM#siBF@;0`gcESK^Ecl);$"@phB4uB0Df0,/-uW]?FD,5.F)Q2CBOu4%
+D,>/BI@jDFCAm".1%[`3!iM+1cN:U#r+%k1^RAG?!B3C>n%,u2@2ikD..6o@<HYucESKgBldcu
F!*bkF*)G:DJ9DoDfp/8+E(j7FD,5.F)Q2CBOu4%+D,>/BF-@I2@3;)1GH\M#r+%e2@3SI?!B3D
>n%,u2[N2eEbf)m$-odu:h=9JF(kr%@:WnbAKWC>Afso]B45k(F"%DL0f023+>GajYR*';1cYkH
3*f`H2-gXu:et"h?ZKk%ATMF)1,2Nj/l5>B<*sZ[F(KE(F<GO@F*&ODEc5H!F)u8?/g(T1%17/n
Dfp/@F`\`t7R9C14ZX]60H`D!0I[G<:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+
1GC[@2ek?,3&38s:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g+V3@X2=&De*:%
+<XEG/g,%?D.R6#6=F>KCi=3*@;[3/FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uGmt*U67sBmD00-,
De*:%+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@%15is/g+k:F^K6/A79a++<XEG/g,%?
D.R6#8O6?!F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<i:h:-pQUCi<`mF*(i2F!)SJ:-pQUCi<`m
F!,L;F(KE(F<GXH@<*K$@<>oe$;No?+DtV2?Z^3s@<it<+AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B
@<-E3EbTT/DJ(VDATW$.DJ()6De*:%%15is/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:Amo^o+?!R\
+E(_1ATDs.DJ().BleA=De:,6De*:%-Z^DJ@<Q?t@<?4%DBO"B@<-Du$;No?+ED1;ATMF)+<VdL
+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcVZs%144#+<Y95FC0-.A79a+DII]q
FDk\uGp$pA@psInDf/p-ASc1$GB7kEDIjqE%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!gDKBB0
F<D\REbTT+F(KG@%16'16r./^@:O(o87?"DF'icp1,g@\>psGr@r$.#De*[&B5_m+DL!jRDJ(C@
>@;2S@r$.!@:O(o?m$jrASbpfFCeu*8hESB@r$-7+B2-):L,A^FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C11UfF(eulCNCp6$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8mu4FF%B_LCNEl9
%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+
/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^h
F"Rn/%16KI@V'1dDCosKA8ba]%13OO:2b5fBl7Q+E+NotBl7Q9%13OO?s@2[A1_nAA8ba]%16Nc
@;[i-AU%]rCgV:/F>>^V$!7L:03AN_03JTI<'a8-=YEl+#pMZ75u'0`=Y*Z(+pfGZ<'a87-s/$'
.3]'a<'a8-=>*f+%14cq0F8sl8QIJu+UKA]8QIJu+UKA]8QIJu+UKA]8QIJu+UKA]8QIJu+UKA]
8QIJu+Unc10aTQ@/MRP`0aTEg2$kun2$kik2$kik2%9mI#q[k</MRP`0aTEg2$kik2$kun2$kik
2%9mE0aTEd#r)`@#rFLG/MT%=#q[kf2$l)s%14fr0aTQ@0aTZo#rFLG1c5Rr2%9mH#r+CG0F8sl
8QIJu+UKh/3A:an#pVi0<\H-M%14fr0fKCm/hf.B3&39I1-#Xq2[M8m1H%-J2D@$I1C6$!/iGLA
2)@6K1^Prj1H%-J2D@$I1C6$!/iGLA2)@6K1^sdI#r+=E0J5(82$l5K2_Hg?2)$aC1Gh)u3&3*G
2`*NS1H%)s2_Hg?2)$aC1Gh)u3&3*G2`*NS1H%*"$8VuC2$krh1'ofE0ek::0KD-L1,Lor2`NEJ
3A<-F2`3At0ek::0KD-L1,Lor2`NEJ3A<-F2`3B#$8`&D1^Pig1,q-M0f1XF2@2/l2$kup/ibaG
1H@<Q#ra[n0Jt[F0JkKj0f:RD1c7'L2)tt%1bLI>1c@$E0b"II#r+4B0J5.@1c@'G1H75u1+kHk
1,1C81H.0G0ebBi2E3<L2DR*K3&ro(1,1C81H.0G0ebBi2E3<L2DR*K3&ro,$8r2F1'oWe2$l#E
1,^aB2Dm0G0ekWo2DZsB1Gh*K3&iZ"1,^aB2Dm0G0ekWo2DZsB1Gh*K3&iZ&$9&8G0aTNd2D[6I
2D[6I2@2)j2)d6H1,q-M0aTWk/i5LA0f_!E3=.Q%/i>CD3&!9M0aTWk/i5LA0f_!E3=.Q%/i>CD
3&!9M0b"IL#r++?0J5<k0eP4=#r=On2DmKS0K:gF#rOFi1Ggd?3AEHM#r=On2DmKS0K:gF#rOFi
1Ggd?3AEHM%15*%3=.DH0aTZo#rFLG1c5Rr2%9mI0F9]F0eP4=#r!tk#rOFi1Ggd?3AEHM#r=On
2DmKS0K:gF#rOFi1Ggd?3AEHM#r=On2DmKS0K:gF%14gE#r`/F/i>RB1bq$J2_bUm/iGLD1H%$I
1H#Os2_HsC3&iTN2_bUp1+kCB0ek[D1-#Xu2_HsC3&iTN2_bUp1+kCB0ek[D1-#dN0es%n#r2f@
/i<qn1G1L?1c[BP3&1dq2D-jF2)$mB0fTIt1G1L?1c[BP3&1dq2D-jF2)$mB0fTUL0f'+n#r4+k
#r!tf3&ENJ2)@3L#rXaq3ArWL3&ioW#r44f0JbXF0ek@<#rXaq3ArWL3&ioW#r44f0JbXF0ek@<
%14gH#rDrE/i<qh/i#CD2_d-E3&V(%1bLI>1c@$E0aTQl/ibaG1H@<Q#ra[n0Jt[F0JkKj0f:RD
1c7'L2)u*Q0f97n#rN#C/i!_l3%d*L0JGCD2)>On0eP793B8lN1cG_"3%d*L0JGCD2)>On0eP79
3B8lN1cGjN0fB=n#ri5F/ho+=#rj[m3&`ZS3&<HM#raIk1,Ua?2D[0M#rj[m3&`ZS3&<HM#raIk
1,Ua?2D[0M%14gK#r)`@2[M/j0JtgL1,CdC3=.Z'/iGLA2)@6K1^Prj1H%-J2D@$I1C6$!/iGLA
2)@6K1^Prj1H%-J2D@$I1CX[G3!h8F,=G+(0/+OU0F8sl8QIJu+UKh/3A:an%14cq/M]'f0F8sl
8QIJu+UKh//NGKk0fUin,=G+(0/+OY$8!t=/M]$e0J5%92`<BN0Jk`q1,0(j/iPOD1GLRD3A_$o
3AN3G1,^pC0KD-"/MT1C/i#@A2E3]'3&`HF2`!?O3A</s$8"">/M]!d0J5'd0e`nk/iPL=2*!HI
1H,Ul3AiEJ0ebIF1GL]m/MT1@/i#CH1b^gJ#rjao1,q9N0K(mK%14[C#q[kl#r!td2)dKT1cI3L
#rXCl1G^gC1G^gC#rjOt2_m9H2E!9I#q\.s/ibjG2DR0K0aTEd2_cp=1,h!J1GfCt0eP.82`!BK
1H>mO/Mmbc0fTIn/i#1;1,:U?1,9.m/i<qi1+kF>3&iTN2_bUj0eb@82)7-N0K1os/MT.B/i5LA
0f_!F#radq1cI-D3AN?M%14[E#q[kj#r!te3A`HF2`<KO#r=1j#r+=j1H7BP1b^^A#q[kc2D-dF
3AiWI1C5Wf2DZsD0ebFA3B%7'1G1R?0JkXI2E)'P/N*ne0fB=l/i,FD#r4+k2E!HO2E!HP#r41e
2)R9G1c7$D#q[kd0J54?2D?sF1'oNe2*!9G1c%-L1cPe"3A*-F1H@<L2`M6R/N3tf0f97k/i5IE
2E!HO2E(pt/ho1<3&NWL1c#Fn2(gR;2E3]Q1cPdn0ekO<0JPIF3AWN!/MT+>/ibmI0ebLC#rXUm
3B/fL0K(dD%14[H#q[kg#r!th2_d-E3&NWL#r+%k2$l#u/iPUD3&iWK#q[kd3A*6I1cRHL1C5Wf
2)$X<2)R*C3&_.%0J5+<2)-gF2[p*G3=.8l1C5`f2E<NK0K1mM1'oZf1c.$G1c.$G1^Prp/iG^I
0f:aE1C5Wf1,LUA3AiNK1GoIj0f1a?1GCXF1c@2t2)R!B0JkaG2Dd?%$8!td#q[ke#r!tk1G^gC
1G^gC#r+%f#r=Ro3&!3I2_d!H#q[ke3A*9F2)R<I0aTEd1b^O:3A`QJ3&q:&0J5(?1c-sI3ACsM
/MSsd/MSsd0aTQ@1c5Rk0f(Zn/MT%=#rFLK$8!tf#q[kc#r+%f#r!tk1G^gC1G^gC#rOCh0f_'I
1,q9K#q[kg0J5(?1c-sI3=.8l1-$sH0Jt^H0eitj3A*9F2)R<I0KBRL/MT$f/NF+l/i5CA1c.$G
1c,Lm/iG^F1GCaG3ALmu2(g[=1cR<M1cG^m0f1a?1GCXF1c@2t/MT";/iG^I0f:aE#r=Cj2E<WL
2)@*G%14[A1^P`n#r+%k2$krh2)d6H1,q-M0aT`l/i#:A0ekXH#q[kh0J5+<2)-gF2[M&j0f^jF
1c.0O0f'+k3A*6I1cRHL1CX[C0f97h2[M5l0f1XF2)d6H1C5`f1c@6M2E!HO2[MB!/ibmI0ebLC
1'oNe2)HpG3&<9C2Dkdm0ekO<0JPIF3AWN!1,U[<0fD!O1Gh'#$8!tj#q\%A1+kIC2E!HO2E!K#
0J5.?2$l0$/i5C@3AiWP3!h/k2*!9G1c%-L1cPdn0ek@72)R9G1c7#p1,(=<2)[-F2)6or$8!tk
#q\"@1G1Kj0J5+@1bg^D2Dd?!2`!'E0ebFA3Arf&/MT.>/iGF<1c79P#q[kc2D-dF3AiWI1C5co
/i,II2)I!C1CX[C0fTIk1^Puk2$krh1,:U?1,:U?1'olu/i5LA0f_!E3=.8l2E*6F2_d$I1,B4g
0eb@82)7-N0K1os0et@=1,q6I2`EH#$8!tm#q[q>2D-dA1G^gC1G^fn0J5(;2`NfS2`!B!3&*$>
1,h!J1G_#t/MT1=/hf%>1H.*H#q\.s/ibjG2DR0K0aTfl3B&]O1,_$F2%9mE1,'"d1'oZh#r!td
#rjao1,q9N0K(mK#q[kj1bLOC3A`EJ3=.8t2(ggB0JtjH0f01o/iPL=2*!HI1H,aM/M]$e/MRPe
0aTNd0Jk^H0f^pE3!hQ'/i#@A2E3]N0aTEd2`E?E2`!?O3=.8t1+kL@2D['A3B7C$/iPOD1GLRD
3A_0P/M]'f0F8sl8QIJu+UKh/,=G+(0/+OU0fUin/NGKk0F\@C#q[kk#quZ16qLE40Hg`V#q\.k
#r+Cn#pVi0<\H-M%14fr/MT0j/MJe22)mQN1GppJ#q[kj#q[qc1H%-J2D@$I1C5Wm2D-mD1GpsK
1GfCm2`<9H1G^mE3AUsn3&WBI1G^mE3AWK$$8Mo>0fB=i0J5(82$kio#q\(g0etU?0fCgE3=.8s
1+kOF1c[NO2Dkdq2_m!F2`*NS1H,Ul3&3*G2`*NS1H%*"$8Vu?0f97h0J5*e/N!hd0ek::0KD-L
1,Lor/N5XA2E<HF2E*KL#r+=t/iG^D0K(jI#q\(q/iG^D0K(jI1CX[J#q[kg#q[h`1,q-M0f1XF
2@1rk/i<qe0f:RD1c7'L2)tsp2`*-@2)I3F1bf:k2Dd$?2)I3F1bf:g2`*-@2)I3F1bfFH2$kih
1C5We/i,ID2DI'F3&M!o1+kHk/M]%50JbXF0ek@<#q\%p/ibgF1cRHT2[M2r3%d3L1,LsN#q\%p
/ibgF1cRHT2[p*P#q[ke#q[h`2$kii#q[nj/i>OE0JtR>3!h/p1G1L?1c[BP3&1dp2)?jA1Gh*K
3&h3r2DZsB1Gh*K3&iZ&$9&8C0eitd0J57>2D[6I2D[5t/MSk82_d-E3&NWL#q[qg/i5LA0f_!E
3=.8p2_HsC3&iTN2_bUn1cI$E1,q6I2`D$p2)d-F1,q6I2`EH#$9/>D0e`nc0J5<k/MSk52$kij
3%d*H3B/]P1,T@i2)-^>1b^XE0fLrr0f1U;1Ggd?3AEH!/N#781Ggd?3AEHM%15*%/NF+h0aTEd
#q[tk#q[tk#r+4n#q[tk%14gD#q\+C/MSk52$kig/iX.h2)-^>1b^XE0fLrr/Mf@=2DmKS0K:gF
#r+1p/iGRI3&!<J#q[qm/iGRI3&!<I2%9mI0aTEj#q[ka2)d6H1,q-M0aTEc/iGLD1H%$I1H#Ok
2)d-F1,q6I2`EGt/Mf.71cI-D3AN?M#r+1j/i5LA0f_!F#q[qg/i5LA0f_!E3=Q<M1'oNj#q[n=
/MJe7#q\%k/i5@@3A`]T1'oNf2D-jF2)$mB0fTIo0fCXA2Dm0G0es%e1,^aB2Dm0G0ekWs$8F=C
/N!hd1+kHk/MJe53&ENJ2)@3L#q\%p/ibgF1cRHT2[M&k0eP.92`3<E0Ja"i0ek:71H.0G0aTEe
0eP.92`3<E0Ja.F0f01g1^P`i/i<qe0J5+?2)d6H1,q/u/N5L=0Jt[F0JkKj/MT+83A`TL3Aif'
0ebI;3A`TL3Aif'/MT+83A`TL3Aif+$8FCE/Md\b2$kig/i!_b2`NEJ3A<-F2`3At/MSt41GCgL
1GUdG#r++g/i,1A3AWEJ#q[kd/i,1A3AWEI2[p*K2@1rj#q\+C/MJe31,T@i3&3*G2`*NS1H%)s
/N5::1,Ua?2D[0M#rsps0etU?0fCgF#q\(g0etU?0fCgE3=Q<M2[M&j#q[kj#q[h`0JtgL1,CdC
3=.8s2D-mD1GpsK1GfCi1G1IA2Dd<G2E!>t3AW9D2E!BM0K(fq/Mf"82E!BM0K(gF%14gL#quZ1
6qLE40Hg`V#pVi0<\H-M#quZG0F9EB$8;c@3!h8F,=G+(0/+OU0F9`n#quZ16qLE40Hgl4/MRPd
2[M&i/hf.B3&39I1-#Xm0fKCj1G1IA2Dd<G2E!>t3AW9D2E!BM0K(fq/Mf"82E!BM0K(gF#q\+p
/iGLA2)@6K1^sdD1'oZn#q[h`0etTm/N=%g2_Hg?2)$aC1Gh)u3B&QF1,Ua?2D[2s/N5::1,Ua?
2D[0M#q\+l/iYdH3B/fQ2%9mE1C5cn#q[h`1'oNi#q[kd/i,1A3AWEI2[M2m0eP793B8lN2$kih
0eP793B8lN1cG^m2`NEJ3A<-F2`3B#$8"(@0f01g0J5+?2)d6H1,q/u/Mf":#q[kh/ibaG1H@<Q
#r++k/ibaG1H@<Q#q[kh/ibaG1H@<Q#q\(m/hf.>2D?sB%14[E#r+4B/MJe53&ENJ2)@3L#q[nb
2@1rj0eP.92`3<E0Ja"i0ek:71H.0G0aTEe0eP.92`3<E0Ja"e2E3<L2DR*K3&ro,$8".B0es%e
0J53h/M[Va1,^aB2Dm0G0ekWo0ekR=2)[<G2)-im/M]4:2)[<G2)-gF#q\%k/i5@@3A`]T1(=RB
2[M2n#q[h`2D[6I2D[6I2@1ri/i>RB1bq$J2_bUj1GUR>2_d$I1,:ir0etL:1cI-D3ANAs/Mf.7
1cI-D3AN?M#q\"n/i>CD3&!9M0b"IA3!h;n#q[h`3!h/k/i#9j/Mf@=2DmKS0K:gF#r+1p/iGRI
3&!<J#q[qm/iGRI3&!<I2$kil0eP7=0JPRB2`2$O/NF+t#q[k</MRP`1c5Ro1GoIj1c5Rk1c5^L
/MSpc3!h/k/i#9j/MJe:#q\"h/i,=<0f^sI2$kuo0eP7=0JPRB2[M&n0eP7=0JPRB2`1mn1H7!F
2*!WM3&3?#$8!te#r`/B0eP=B0f1XF2)d5r/MJe81H%$I1H%$I#q\"n/i>CD3&!9M0aTQk2_HsC
3&iTN2[M&n2_HsC3&iTN2_bUj1GUR>2_d$I1,:j!$8!tf#rW)A1'oNd/i<qe2DZsB1Gh*K3&iZ"
0f:a>1c$sK1cRH$/N,C;1c$sK1cRHM#q[nj/i>OE0JtR>3"63H0f'+n#q[nb2@1rh/i,ID2DI'F
3&M!o2E3<L2DR*K3&ro(0f:pC3ArWL3&q9s2E3<L2DR*K3&ro(/M]%50JbXF0ek@<%14[A1^PuF
/Mf":#q[h`1,q-M0f1XF2@1ro1bLI>1c@$E0aTQm1bLI>1c@$E0aTEj1bLI>1c@$E0aTEd2(gmG
2)@6M3=Q<I0f97n#q\"@/MJe4#q\(q/iG^D0K(jI1C5co3%d*L0JGCD2$kin3%d*L0JGCD2)>Oj
0ek::0KD-L1,Lp!$8!tj#r2f=3!h/j/ho+=#q\+l/iYdH3B/fQ2$kur1+kOF1c[NO2[M&q1+kOF
1c[NO2Dkdm2_Hg?2)$aC1Gh*$$8!tk#r)`<0fKCj0J5%:3&iZL2)7/u/N>X@2D[-H1H@6J#r+@s
/iGLA2)@6K#q\+p/iGLA2)@6K1^P`i/i,CD1c@$G2DYdL/MT3k0F8sl8QIJu+UKh/,=G+(0/+OU
0fUin/NGKk0F\@u@:FLuDf08tDI7:"Ec#6$?ZU<tEcYStF*9;sn%6>*8Pgs/;Cl]oD.P8?Ea`j,
CghF"Df.+?A7]Y#/5B2=9Iq_hATV?K@<>oe$9'Y!2_6dA2_7\@RS4hs<DjsYTu3QH6rd,-DKROK
FY$L*AKYH&BkM+$ATMr9F*(i2+E(j7FD,5.;JBTLDf-\9Afu2/AKXHVF(f-+/7ip3+Ad,h/1`=r
9PJQi+CfG'@<?'k+C\c#ARlp%DBNY(ASuU(Anba`FD5Z2F!+q;+@0gTG[YK#ATAncDf0--+=M/G
AKYr#E+O&@+EMHD@qB\&@;0UqGp%!CF<G[=AKYT!DII?(F*(i4AKYo'+EV:.+CT;4.3]3.3&rZK
/2]:@/5=$N9HZns8Kc!G_kA2O5t<'V\>iP(/6$:o+D,Y4DKI"BFCB24De:,6BOr<"ART*lDe:,6
BOr;WBl[cq+AH9^/7N14@3@jVBk;C#F"Ajn<+oue+Ceht+>4jYBQ&$0A0>>m+D#e>ASu$iA.8l+
3&i`G2DI-A9uEDn+N'mn+N:%lTcd9"7j-d#W`;eF<+ohcEb/["+EMX5EZf:4+EV:.+D>=pA0>f&
+EV:.+@p3eARloX@;[W)CiF&r+@1$^/1`>_@<?4$B-:o++>RhF+D>2"Afu#(+EV:.+>#<hF<GF7
Ci![#DJ=61%14gK2_[!<0ekRD/5=$N9J&uVRS583BOr;QEbTT:Ch5//FC?:k@<HU)/1`=]$8O=m
1,1=71c73CBlbD5AMGki<+ohc8muodDe:,6BOr;QF_kkF@;Kmr@3ANXF`M1I/1_5;1,^sH0e>%>
0eb/tTN+l47nH3B;BWrP_kA2Q9Z*;M<+ohcF)Q2CBOu4%+Q@pK+E(j7FD,5.6YKnKBlA)EH=_2,
+B2cl/1`=]$8OIq1,pg>2`WTD;cQ^<7nH3B;BWrP_kA2O8M!hSAKYl/Ecbu+Ec*#ZJ>OH-Afu2/
AKX?R@<-(#F=^m4FC?:k@<F+P/.DqA3Ar`P/2At82CqS?RS4hq7nFi@TlM9pTu3QH`M$ipE5Sf"
+AG/@TIil(`Lnb]BOr;uEc5i;+EMX5EZf:4+EV:.+B3Q!DC9KJAn>Oq/7ip3+@g![/1`=]$8X@l
1c$[<1,q0C9uEDn+N'mn+N:%lTch=JAM%l=X`P[[6,fKK9gQak/6$:o+ED%%EZfFF@<*K/Afu2/
AKXrrBl5;>+D,1rF=_9O+@g![/1`=]$8XCp3&)s>1bpd:9gQak/PSOMTHM4I_kA2O8Ph](<+ohc
<-N%o-Z^DOFCB24DIm6s+EV:.+B)rbE+ig'A1VA%D'2>[D(I4h%14mL3&NB@1,q9K/58FLTIil(
`Ln>F7nG72BOr;uEc5i;+B3Q!DBO"B@<*o-CiF&r+@g![/1`=]$8XV#1,^[=3B8cE9gQak/PSOM
THM.GE\(1'AKZ#)@<*JiGA1q;F*(i2/7N14@3A'OD(I4h%14pH3A<HE1G^pI/5=$N9HZns8Kc!G
_kA2=9M@_p`M(2C+B(i_<+ohcAo_g-F<GXH@<*K/Afu2/AKX?\@:C@$D]j.8AKYl/EcbtGATV?'
6Z-Bb/1_5;1bgsF1+Y4;2)d'\_jX7A8Ol>p`M(2C+@/[p5p4.?_kA2Q9Z*;M<+ohcAo_g-F<GXH
@<*K/Afu2/AKX?\@:C@$D]j.8AKZ&4F`_:JFD,6-@3@pT@k9/^%14pI3&!6A1GgpK/5=$N9H_6H
EZi>p_kA2=9M@_p`M(2C+B(i_<+ohcEb/["+EMX5EZf:4+EV:.+@C0X@N]c2+EV:.+Du+<FD*4<
@;R,SDIY4K/.DqC1-%'D/2K+@0e?&:RS4jATlM9pTu3QH5tjs<+N:%lTcd?/_jN&TBOr<,ARTU%
F*(i2+E(j7FD,5.6ZQUE+EVNEFD,5.F)Q2CBIm\*Cij).6Z-Bb/1_5;1cIEK3%QjF2`!!`5t<%`
/6$:o+D>=pA0>f&+EV:.+A?KfDCf@<F!+.fD_*Fj%14pP2E!QH1H@EM/50&65tih/BOr;ZBl7Q7
@;Kmr@3A6TD_*Fj%14sI2DR*?1bgdB/5=$N9H[;7;BWrP_kA20+A9V?`Ln?kTlM8L<C]>K/6$:o
+EMC.Cht58FCB24GA(]#BHV#1+>b3NF^f',F!+q'BPD?p+EV:.+A6EdB.S(:D]h_bD_*Fj%14sL
3&`iK1c%!L/4W:NTHHm-:*;hR<+ohc;KZhq+E(j7FD,5.9PJE_/9GQ:FC?:cAT'+N/.DqD2`ETQ
/2T4@0J#^c;BWrP_kA2=/6$:o+ED%%EZet4Dfd+?Afu2/AKXZ\Df.+8ATV?'<bZS*/1_5;2DI3K
0e>.@1,UUN78-,m`M(2C+A#'p+@/=m8PUg9BOr;bBl7R"AKZ&9@<*K)DBNP3Df0Y>De:,6BOr;U
F`MM@G:[B8D'2knE\&am%15!N1cI6B2)$mG/5nhk+N:%lTccWf;b9_8<+ohc@WH0qBQPA<FCB24
De:,6BOr;UF`MM@G:[0=E+iZ&<bZS*/1_5;2_m9F1FtC@1GC@X_i7D6`M(2C+B;+QR4M<NAKZ&4
F`_;.Ec*"=@<-H4De:,6BOr;b@ps1bF"Ca9E+iZ&9PIre/1_5;2`*HQ2(UUC3&N6b_i7D6`M(2C
+B(i_<+ohcDJsQ;BOu4%+E1b0F<GL6+EV:.+B)cYCh7Z=@V'Xi+A?KY/1`=]$9'q$0JP+93AiTD
9uEDn+AGj6<C/Mb`M(2C+B(Qr+@j>/;Ctj667c)LAKYi(A7TLf+EMX5EZf:4+EV:.+D>=pA0>f&
+EV:.+B)cgEc>`2DCf=0Cij).;e'_s/1_5;2`NcP0J#(A3&E0\_jX7AAK\sc_kA2O5t<%f_i7PG
<'`i%<+ohcF`;;2EZfFF@<*K/Afu2/AKYYt@:UL!Afu2/AKXo]DfTf2Df.+8ATV?';e'_s/1_5;
3&!9L1FtF=1GgX]8MhtHFD,5.B5_<0+A?KjBe3\/E+iZ&;e'_s/1_5;3&EWS0J#+=2)?dX_jX7A
93"k4`M(2C+A5:(1a'c2Bl"ng5qGuKAKYH&BkM+$+EMX5EZf:<+EV:.+EV=:+E(j7:gmgICia#t
-Z^D=EcQ)B/9GQ:FC?:fE+gdR/.Dq@0JG:>2(U[F2`<3c8K^aFJAn04<+ohc88iNd+E(j7FD,5.
7rMgX/OjGqBImV(FC?:Z@;mbK/.Dq@0K(pN2(U^B2`N?__jX7A8Ol>p`M(2C+B);!\>iP,+AG/@
TIa&UAKYT*Df0Y>F*(i2+E(j7FD,5.7rMgX/S8^<BIme)D'22SE%EOk%14gD2`3HN/3#F@1+Z/;
RS4jATlM9pTu3QH;cVedW`;q>9gQak/6$:o+ED%%EZfFF@<*K/Afu2/AKXK]@<=)5Bldr=A7]S!
@3@pGE%EOk%16fXF^K#pD.R6bF*(i2F'g[V1,<3YG]Y\un%6>+5uh8e@;TR,6tLFRB5V."Bl@l?
84cW/6=G.NEaMRMD.P7nD(JaV;dW-J<c)8X/5ec@8hr(S0J#V'@p_h`0JG13:NC/^Bl5J#Dfp)1
ALpD@/44>nF*&s%FEq_ACi<s3?VYN]AISu4@WQI(F`_M>/6G\"2(Vj*/N#(d+A@&u/70r8/28n4
0f(@80fCXC0fCmC2CpXE/hf:B2)d9A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,/44_p@qZu_AT2d$
Ch[B%E,ol9Df]?'4$d=sDesQ<DJpY3F!+m6AnbasBl@ltC`mS/Ea`I#Ci=H;+EM[7F*(i.@q?cs
DBO%7AKZ&(Be<q2+Du+@AS`JgDg'$lEc,;.DIFYr@WQI(F`_M>+=L3&AKXHN@ruX0Gp$^;EZfI;
AKX9JF)Pl;FCcmD@X0)1DJ!^-ASuU(@;I&RH=^T"+Eqj?FCfJ894;jPC`pZT@;odn/e&.R@ps4_
E\'aZ+?2A?/28q?1cHu2\1o*pEbR'j/2/h:3&<-C0JPO<1+kOG/2T192)[<J0ek421b^O<0Jk[H
1+Xt-cF>S[7<3)n%15C2BOu4%@<*ni;BReT1+Y@A3&iJ7YolJUBe2P$/M&S.1c6g>1bLU?3&NHI
/1i_</i#4@2`3BB6#pCCBk&\FcESohEbR((BOr<(@;TQuG@>P8DfTQ)Bl7?qCj@-hEa`Ek@lbab
U=cX$Yoq\sfnA%5fn\4b+NhF:J`42+BlY>)DCoa7BQ>4D-ZWpEATB/>+D#G$-RgYW$:/08Bl[`8
85^Qc0f^d@3&33>cF4o`@<3tc/2/b73AE$A2`*NG1G1LB/28n41,h*H0f(@<2_I'E2).'L/1`?t
[k'mTF"AMIBl\9:+CT5.Ch[Hk+EVNEcF4o`@<6L(DfB9%@:^QqDBO%7AKXoe@;KgiFCcRkCh7[+
+@1*c@<3Q0Afu2/AKXNT@<Q4"F!,FE@Vfb"BOt]sBl5%J3AiKA+C]J8+DGm>DJsV>CMn'7DBNn=
BlA#7FDi:DBOQ!8+q4lF@rc!e/4`Y]2*!WQ/2oOJ1,(9)Z8!J#@rEna@4X,k0Jt[=0f_'M/2Ah8
2CpU?0eP7>3AW?C/1iS:/iYOB1c7'?6#pCCBk&\FcE]/U;e'_s,'7L0+EVX4A8-."Df0!"+DtV)
AKYo'+EV:.+O788;e'`dE+s#/F*VhKASiQ'@<3Q#AS#a%Eb0-!ATD?m+@0d`@:C?fDIakYCgh+"
@:Cc1A7]dqG%G2,-u<U5AKX9KEa`E++D,Y4D'2,b@:Eq\3[!(QfnA"gfn.k]fVfp$Cb<fE@<$<r
@N['HFD,5.F(9-/E+s6.-RgYl%15C2EclUX85^Qe2`!-=2D@'E3%W@[+@C0l/4!\q0etLB2D$gC
0K(I:/i,:70fV'D2DdEO2DZm92DZs>3B8cR1Fth/ATDKp@;]e#D(I6`Yq/7_FY"_F+Dl%-ATDZ2
@rH7,Ea`I"Bl@l3De:,6BOr;Q@<lF)+Co&)BkM<lFD5Z2/0JG@Bl7Km+DG^9FD,5.0fa>h+Ceu#
FEMVL/0JDEF<Gd@Bk(g!ASuU$Eb/c(Bl8$2+Cf>,D/X;7F`V+:Df0B:+C]U=FD,5.D/!N41,*f`
+Ceu#FEMVL+=K>pcESKZEckl+F"&:B$:/0E@V'Fu/4`Y]1Gq*H/2T1;2E!,3YolDO@k9oS/20%@
3&N3@0f:[:1bLOA/28q;/iGI>2`*3>0ek:?2)dEQ2_778@:Eq\/1f)O/44;b/6$:o+DtV)AKZ2*
F!,CABkM-t@;Kb*+@1$V@VK=5+P<UFK\3T_W7\$$L=qD+@<sMOF^i:?DSr.j-ms+MAKYK!@<Zc?
.4u&:6"FY;An?!k/4`Y]1b^^?/2]+;1Gp`/[NJ7TD_+1_/28h52E*-A1GUg=1G1L?/29"=/ho:?
2)[BE1,CO>0fLmC1+Y_3@:Eq\/1f)T/50Vn/0[ArF)N12@;KakA0=0SA8#C`ATD33+B3#c+DtV)
AKY].+E):7B5)6lCi"A>Ao_g,+@1$V@VK=5+P<UFK\3`dJ_>q5Z.Q#u@H"_U/`F4!@:mHYEa^(=
-Zj$5+C]A"Bk/>7DfQt1F`M:L+E)9CF*)G2DIb1D+Brbr+EV:.+Dbb1DC9KJD..<n>q%BM%15C3
BOPpi/4`Y]1,^jH/2K(>2`WG7[3.h2@4X\q0K(dJ2D$[D2)m-A/i>=60ebF:2DmBL2)?d81,pmH
2_m'H2Cq.7@:Eq\/1f)S/43-?/0\&,AKYl!D.Oi(F!,CABkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(c
fWa#+fWj+d+NhH-iOFreJTAZ%+=JU\Bl[j#DK@0S/g*`'+EV:.+@BRRASu$eEbTZ5+E(j76#7Z0
@q]plF(la_C`lGjF^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+P<IBLtRG(fVdDUfX]Y=fVdB,fnpop
^0u50Bl"o#Cb<fE@H"_W`.;rCH$Lq`FE1f-F)59,ARlotDKKe>9OW$WDBNA/+Ad)mD.+PfBl[j#
DKTe=-mrV@EcZ=FG%ku0Bl5:I/g:`36"FYCCb/+T+>Z#3/2f=>0eCVa+@0mU/1iD)/2St=2_6^<
/i>UG0K:a;1c6mC1,q3O3%R@9@:Eq\/1f)\/4"/a/0\&,AKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn
@:Eq\3[!(QfnA"^fo"I9+CX6=O"K>#O(!<M+=M>FAKZ)8@;0U1+Dbb6/g)N`BOr<.@;0O*.4ueR
$:/BD/4`Y]0f1RE/2An=3&rP8[3/FWFY#ge0e>"81,q0B0f^sC/2Jn91FtFC/ho4?0fCg=0f^j@
3&!0F2(V%6@:Eq\/1f)S/6$&#/6$:o+DtV)AKY].+E):7B5)6lCi"A>Ao_g,+@1$V@VK=5+P=6X
MV3_,b.hA1DBL>TAU.i7.3N&:A0?))F!,L7G%kN3ARlolDIakuA8cF/ARlomGp%3BAKY&mEbfB,
B-9]bDfp"ADf-[rFCB24:18!NF"Rn/6"t4FCiWs$Be2eQ+?)#02CpjD2`<BAcFkqT;eL,%5qF`M
2)I'?1,:[D/2St=2CpUC1G1OA1,L[A/1iV4/iPUD3&E<?6#pCCBk&\FcFkq`;eL,%7WNEa+@1$V
@VK=5+P=6XMV3_,fVdDUfWj),fnJ+:+NhH-H#=a5E\2=MJSi?++=JUKH"A+:Afu2/AKYE%@q]Fo
-RfK36#9t?Amo^285^Qh1-%<F3A`QP0eCVZ+A@'$/4!\q0f^sE3%HdF0KC[@/i5@81,q6G1c%-L
1GLF:3A*$C2*!TL/4";b@VK='/C(^U9R1Y0,#i5e+DtV)AKY].+E):7B5)6lCi"A>Ao_g,+@1$V
@VK=5+P<UFK\3'P\ClGcYomIk/]teMiOY4bF`JTQ-Zj$5+EV%.Df0VD+Brbr+EV:.+EMaFDfBE.
B-:boB5D-b.4cT_BOPpmA0?)1FD)fB]HBmnEa`N%-p_ZXFD,8pE[`Ub%15C;@<6-k/4`/O0fD!M
1c?mF0JG1;/70MuATB>//29+>0fUa>0f:g>2_I*J/2B.A/i5FE1bq$A/MSt43AN?J3&3$?0JPR1
8O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRr
E,]i9G%G29DIIBnF"CZL;e9u#,"$WpEbTH6+E2@>E,Tf+Cc`b*CghC!@3B9*+EV:.+D,>.F*&O<
BleB7EbT#lCi"A>Eb/a!Eb&`l+DtV)AKYo'+@CEnEclFS+Cno&Bl7Q+@UWb^+EVNED/!N4Anbk!
AS#b$BHUerDKL#AGp#F@/g:`36#:"=Ch-sf/4`Y]2_m9J/3,OA1bgQ-J07d'E\'L-0f^pJ3%Zm?
0JP+6/iYgA1,q3F1c-mH2_cj81,1C81,CgC2(V%6@:Eq\/1f+t/5p2%/0\&,AKYl!D.Oi(F!,CA
BkM-t@;Kb*+D,Y4D'2,b@:Eq\3[!(QfnA"VfnA"]fVp!%Cb9+)Ch-rs-ms+TGA\cW/g*`'+EV:.
+@BRRASu$eEbTZ5+E(j76#7Z0@q]plF(la_C`lGjF^]'$ATTIGBlkJ3F!,")F(o9)@<?'k+PDM&
MV,0VfVdDUfVmJVfWWr,+DtV5H"h:A@;IN)@;KI_BIk9JEa`j,CghEsA0>T(FDi9q@<?4$+CT=6
9QaiZA76TVE,]N%BcnfO@WH0qBQRg,F<GL6+EV:.+EVOGDC6kW%15C;@UX(e/4`Y]2`W`L/28h6
2DI0BcF"c\EH3T^/1iD//iPa@1GLU:3AEKR2E<<?3A*-K2)dHO/4";b@VK='/C(XS6#gor<+ohc
DIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1HfVdDUfVmH#fnA"g+CT(<@`3h6C!+15-ms+M
AKZ&<@;KauG@beB.4u&:6#:"EEb0/?85^Qh1bgp?3AifR2_<7[0d&i/B.Q>W/29.@0K1L;2`3QG
1G1@=/2B4@/iG[C1Gpm<1,ggG2*!QT1+Xt-cE]/U6[<;q<+ohcF)Q2A@q?d$Afu2/AKYl!D.OhU
Cgq+!AT&]*F!,@=F<G.4FD5c,Cj@.5Ch7$q/e&.RCh%-m@UUfY;BReS1,CI=3AENS/C(LC6ZR?$
/M&J)1bLI;/29+>/ho%91b^[9/M].82_m?P2`3-PEa`Ek@k91VYq/7_Ft=h,Ec5e;6#pCCBk'1H
fVdDUfWNl*fVdAq+CT(<iOY=h@`3i?^*"gOFCf?3-RgYj8T#YmBOr;R@;KLmA79LmF_r7>AfsBU
+@0LNF('-(+@0fd9lG/_CMRL'/0JYK+DGm>A7]grB5V."ARlq9VqHaVL"V45Y1U!%fVdDUfXf_?
fVdB#+CT(<D..>@\s?cF+CT(<`1_<o`.;AK+EVX4DKBW&FCeu*Bl8$2+A?3cBl5&%F!+A!F*)GF
D'22aEcu.>-mrJ8@;@!(Afu2/AKYK'Dg*QX/g:`36#:%LE\'aZ+>ki21+Y=@1cI?E3%uIT9joS?
@4X,h1,Cp@2)I0K/2Jn=3@lp>0eP792Dd*D/2]7:3B/rX2)HjMEa`Ek@k9/j0J$3u@4XlgDf$U_
Ea`Ek@lbabVqHaUY1\W`VqA6s@;OqROl<m;@<Zq6JT;k]-Zj$5+D,%rDKI">DIk1E/e&.RCh%a/
DIk@i;BR\K2Dm$?2`EEG/C(^I<+0o#5qF]G1cI9B1,L[C/2Ah;2(UUC/iYdE0f:^;1,LU<0JtR@
2CpC1cF5?(@<F+qASkmfEZf:4+EV:.+AclcBjkO`F!,C?ASrW3FCB24@r-:/FCfJ8-quNU.4u`/
Ch%a/DIjq=6#L1HASuT47ri0PCH<Ts]SOkFcFV>Uc]$/_cF4o^Chn03DT%_f+Eq78+E)./+E(j7
FD,5.:i']W@:Wqj+EM7<FCfK6+DG^97ri0PCERJ>FD,T/DeF>J%15C;A7]4YEa`i:85^Qb1c73C
1,1U@0eCVT+B2cl/1iD,1c%!L.krq<0e>"23&`BH3%d3N0JPIA/29%82)%$H0JY1FEa`Ek@k91V
Yq/j_FY$L*AKYl!D.Oi6@<3Q0EbT0#DII?tGp#Cn@:Eq\3[!(QfnA"]fVmH-fVdDW+CSe4A78qU
El<NH+=JUZBOr;uDes6.G@beB+Brbr+EV:.+AclcBjkO`F'U4($:/K=ATD3rBl5Im;BRqR2DQg<
0JtRF3@rI\+@B^Z/1iD.0ekXG.lK.=2(UL81c6g?0f^jE1c.0O2(UX@/i>UG2)d?C6#pCCBk&\F
cESofAT01iEc5e;6#pCCBk'1HfVdDUfWa#5fVdB4+P<UFK\;79L"V@:L*0p`\;r6#\;t?E`.?(G
+CT(<H!tR.X)9%.-Zj$5+ED1/BQPA*Ec!0H>An*r6Y14MAT`'".4u&:6#:(F@;]L_/4`Y]3&<EJ
/28h<0K:p@cEeW`Eciob/1iD//het11GUpB1cR6F3AN-;1H-pB2DdBN2(V%6@:Eq\/1f)Q/4X`'
/6$:o+DtV)AKZ2*F!,CABkM-t@;Kb*+P<UFK\3N^L=iFI@H"_W/`F4#@;]L_+=JUZBOr<.@;0O*
+Brbr+EV:.+Cf>-F*(u0CghF"Df-\9Afu2/AKXoiF`_;.Ec*!hBldrn.4u&:6#:(FBjtLa/4`Y]
2D[?O/3#FF3AiA5[NItY@4X\q0fLdG3%HmE1c$[=/ho:91,V!C0f_-M2)$R>2(ggB1c@<M/4";b
@VK='/C([T6ul]e7WNEa+@1$V@VK=5+P<UFK\3`cW7\$#\KG>>\;`*!\;b33`.?(G+=JUZBOr<"
H"Cl%F!iCh%15C;A9D^#Bl5Im;BRnX2)6^;0JPC>0eCVX+@KdW/1iD)/2St51Ft=93%d!@1GU[C
/28k31GCU?2DHaKEa`Ek@k91V[4F^WCb/LuDfTr2DJ=!$+E(j76#pCCBk'1HfWa%`fVfqFVqHaU
YM"T^J_>q6L*5HbO'up7@N])i/S'!?B#L`f+=JUZ@;0O#De:,6BOr;sDesB+Bl5:I/e&.RCh@C%
CFi"S+?2,43%Qd<2D?pB/C(OD6Y13f6")<"0et^I.lT.<1b:F81,CI;1,:I:2DdER2_6mA/i>O@
2_d0@6#pCCBk&\FcE\ugAT01E7WNEa+@1$V@VK=5+P<UFK\:q/Z.X^O@;IN-Bl\29-ms+MAKYT$
De!Q1.4u`<@;TQuB5)O#DBND6+B<6#B4rDSAS3--D]j.8AKYE&FCfK,F)<%0Df0W1F*),6B-;,)
+O75C+O788@;]TucF4o`AT2<oBeCS=$:/K@ARoL+85^Qh2`3EC0eb:82Dcu1YqdFhAT01P/2An6
3&*!>1,C^;1G1OE/2Jt:/i>@>2)[?D/MT"52)I-L2)6^KEa`Ek@k91VYqdjt@;mbA7WNEa+@1$V
@VK=5+P<UFK\3BYYM"dU@;IN1@:XX+-ms+MAKWC<@;KL(+DY\%-RgYj6#:XSEc,<-Bm+&1FE1f#
Bln'-DII?(DIIBnF!+n3AKX9T+@g-WA8*S;;e9H]DId/u7qlOFBcpi%A0=0SB5(pfBcp>c@s)["
@4i`5$:/K@ASu3k/4`Y]1H@!@0K(j@cEeWiAS3PG/2/b41GUI82)-g:1+kOB/2Jn70K;'N1Ft7<
/ho=A2*!KE6#pCCBk&\FcEf&uAS3P`Ec5e;6#pCCBk'1HfVdDUfW<`'fnS.X+CT(<C;b[@Bjr25
-Zj$5+D,FuDJLUK/g*GrB4Ysp@N]B++CT)-D]iJ+DffZ(EZf7.D.Oi%DfQuGYolkSEcYf++=Kru
Eb8`q.4u&:6#:1JAR](!85^Qe0Jtd?2)$mI1G$hX0d'/$D_*Ik0eb@:0Ink<2)$R:/iGF80f:d?
3B8lM1c-a<3A*9J0f1jM/4";b@VK='/C(RV/50Vn/4OYuD'2,b@:Eq\3[!(QfnA"ZfVmJYfVp!%
Cb9C1@VB0m-ms+MAKYT'Eb/oq@:U`.>An*rFD,5.Ch[g*>q%B8$:/K@Depsq;BRtU2CpR>2)dEE
cE\QhATB=f@50;e1GCdD.l8q;2_6^:0KC[@2_Hd@1,:RA/2T%53AiZP1cR$PEa`Ek@k91VZ7Jg`
E\'\#Df$U_Ea`Ek@lbabVqHaUXOsH(L=iFI@;IN1`.;f?@N['HFD,5.Ao(mnCF:P`+@0gVASu3k
+DGm>@;L"'+CT/+FD,6++DtV)AKYT'EZiZ4+AcWiF(K&.-r"DrAmoI(/e&.RChI[,@:CcY;BReT
2)d'E0KD$K/C(UF6ZR?$5qF`G1-%?H0fCgB/2Ah<1b:@@2_HpF2D@$F/1iS7/i>@@1c$j;6#pCC
Bk&\FcEo,iEcs!5BOr<.Ea`KmFD5Z2@;I'(@;TQu6#:1PEa`E"BlbD-ATDL.ARloqEc5e;6#pCC
Bk'1HfVdDUfXf_?fVdB#+CT(<`1_<o`.;A?-ms+MAKYK'Dg*QX/e&.RChRBt@4XrI+>Pc/0e>+8
2E3EBcEeW`ASita@4X)j1H.6C0fCdD/28b;1FtOH/i5=B3ArQB0fCX?3B8iS0J#M1@:Eq\/1f)Q
/4X8g/4=&iBm+&u+D,Y4D'2,b@:Eq\3[!(QfnA%6fnS.ifVp!%Cb9=/DT]_&+=JUZBOr;qEa`ir
-QlW3DBO%7AKYl%@r!3*Afu2/AKYJkD.RNh.4u&:6#:7RFD*3r;BReV0JtC>1-%3M/C(XG<D?mQ
5qF`G2)I!;2)R6N/28b92CpRC1G1O=2_mBI/2]:;3AifV1,CI4/C(XS<D?mQ,#i5e+EVX4A8-."
Df0!"+DtV)AKX9TBlA*,+Cf>,ATJu+Ec5e;FD,5.6#pCCBk&8oCjBH2+CT(<BOPadC`k,M,'7L0
+EM4-AT0#<+D,&(+EV%+Ca(&P/g:`36#::EDII3085^Qh3A``I0eb@>3&iJ7[3.h^B.Q>W/2An9
2DQd=1Gq-C1+kCC/2K"8/i>LA3&EEB1G^XD2_[!E2_6L2cF#2jH"SZ;$:/KD@;07'85^Qf0f^s>
2E*EG0eCVZ+B;-E/1iD)/28b:2(UL:2D-sK2)-sI/2T@>1GL[@2E*0</C(^U<D?mQ%15C;CLM%%
Ec5o</4`Y]2)d<I/2oFC0ek6)]J1NqDf70m@4X,j1,Lj=1H.'F/2St80e>(90eP191,^jH/2K4;
1H.6I2E<<>/C(m_/4+8n/.DqPChmHuBQ@Np/4`Y]1Gq0L/2T1?2_cl/\fb!I@4X\q0KCgC2CgUC
0KC[@/ho780f([>3A<?I2Dm$B2_HgB2Dm6I/1`?t\h$iU@4Vip6#:=FEa`E.85^Qi3A<<A0ekOD
1,CK-Kcj3'B.PVc/M&_21bpU<2)-^>1c.3K0e>(9/i57=0eb:4/1f,$/5Tnj/.DqPChmU'/4`Y]
1bq$L/2]4B1b^K+YolDSF=]!p/M&_20K:U<2Dd$H1c%$D1b:453%csH3&`fQ/1`?tYq/7_F=[k.
6#:CH@<sIq;BR\P0JtC:1GggE/C(XG6$73!/M&S50JY=41c$sK/2Jn41FtIB/i5RD1,1d?1c$aD
1,C^?2_6L2cF#2hF`K#B$:/KF@:Nt%85^Qg0Jb7?2Dd*=cEeWZDIb:a/2/h51H?sB1,:O71+k:8
/2Jt43B&cS0Jk=;1+k@<3B&]N/1`?tZReC[A1S/s6#:FIBlYaq;BRqU1,UU;0KCmH3%W@[+@gHp
/1iD.1,([C/Mo@C3%Qd:2`!!@1GUR:2)m?M0J"e42D.!J0KD'K/1`?tYq/CcFY!t/6#:FIF)3Bu
;BRkV1c?mE3&WQM/C(RW+B)on/1iD)/2Ah<3%QgD0eP:?1,(I@/1iY3/i5=?0eb:4/1f)Q1+Z@:
E\%Y,6#:FQCgh0385^Qb3A<6?1,^pC0eCVX+A[#l/1iD,2)@-G/MJn61+Y.42E<<J1bLI>1G_!N
/1iS/1,(FC0f^d9/C(XS:NC/#%15C;DJ=3$CFi"S+>Gl53%QgC2_m<CcF+ikEbR'j@4X)i1b^j?
0JPFD/28b91b:UD/ho=G2E<TF/MSk<1bppI1b:1/cF,9"EbR'6$:/KGBmF-//4`Y]2D@*I/3#=<
0et<+K-4*&D_+1_0e>%;1,1O91,UjG/2Ah<0J"t92(gXE2_d-L/1iV7/i>XE2`WWE/1f,"/5p%s
/.DqPCiF&rEb$^l;BRbS1cR$C2D[?I/C(LC89nVp/M&S91,h*C0K:mC/28b;3@lmA0ePFG2E3NP
/1ih62DmHP0JY11/C(LO89nVp%15C;E+ifm@ppoZ;BRhU3AW3F2DR0L/C(LC6ZPL9/1iD)/2Ah5
1+Y1:1G1RE0f_*F/2B+92_d-I3AW3;/C(LO6ZPLE%15C;E+ig'@<?fH85^Qb2(UXE2_<7Z+@0mU
/4!\q0JG1?1b1=A0JtC:/hf481+k7@2E<KM/2B4<0KCgD1GLF3/C(LO6#L3a%15C;E+ig'B.QSO
+>bl5/2o7C2_<7`+Ad,h/3tg@0f(OA.krn:0e>+53&<*@1+kOF0K;!I/29"71GgsK1,CI4/C(^U
:ig+t%15C;Ea``tF"Bj[+>u#70J#1>2D@*AcFb8fEa^Lb/29(;2)?a?1bq$A2(gaD/2B(@/i,:>
3&!9B2)HpB2_ZpE3%QU3cFb\rEa^L.$:/KKATM?p@4XrI+>l/;/3,OH2_<7Z+Ad,h/3tg@1,(I;
.ki_82CpX:3&3$@0J54;0fM$H/2Ah:2D[9J2(U:0cESosF(6a1$:/KKF^ec185^Qg2DI0B3&W]T
1+Y""6ul]e/M&J)2(ggF/2B+@/ibpM2)[EF2)?jE0JPL@2(U:0/M';1@4Vip6#:UNAn`ee;BRnT
2DQgD2DHm>/C/qk6ul]e/M&V:1GUd;2E<TJ/2St;2_6^E1G1@@3B8uO/2fL@2E!9E2`<3</C/r"
6ul]e%15C;F(8omF_bE-/4`Y]1GUmH/2T(82`3-B0d'/8DCd@j/M&_21,UU;1,U[C0K;!O1+Y7<
/ho=F0f(O8/1`S3/51>,/.DqPCia0,BPD?m/4`Y]1Gh'K/2T+B0f(B+ZliC\Cb.k\/20%?1cI!D
1c.!>0ePIH/28q8/ho:B3A`QD/N#@;2_[3N0f^d9/C(UR<b6(u%15C;F(eurDCe=V+?)241+YFF
0JbU<cE\QYEGR0l/29.B2)?a:2DR*?1G1U@/2B4F/iYUG1GCX:2D-g?2E*NM/1`?tZ7J:]Cb-#&
6#:UU@<=%k;BRnW2`!!>0JG:;0J(M_+@BRV/3tgB0JY=@/MT";2Cp[;2`E9D0JtI;2DmHS3%QX9
1+kLC3A<BP/1`?t]duNZE%DG*6#:XOBlYaq;BRnU2)d'H2`<KQ/C(LC6#g]l/M&V:2)%!?0K:pF
/2/\82CpUD2_I!K2)m?M/3#7A2E3KJ0e=k,cESodEGR0qEc5e;6#pCCBk'1H.+kHNK\;+4Ze2N3
+P<UFK\3cdVq@m!YokH'DCoa7F)i]P@H"c!/`F7B`.?(FBlY=E-Zj$5+D,G8Bl7Q2+BrDcB5D-b
.4u&:6#:XOBlbgr;BRnS0eb.=1c%'K/C(UF6ul]e/M&V:0etX;2E*HH/2Jn42_6^D3%cpA3&`]K
/2fF>2E!9I1bgO4/C(UR6ul]e%15C;FCfK)/4`Y]1H.6K/2T7D2)$T,]-'dYD_*Ik/M&_21GUL9
1bp[D1GCO<2(UL</ibgK3B&WC/1f)Y/50Vn/.DqPCis9/@4XrI+>Po32_6aB3A<9@cF4o`9joS)
/20"<1bgR;3AEKE1+kC@/28k6/hf%:2`<?@/M]==1GCU>0K(I5/C(^U6VUu?%15C;F_kJ/6$76j
Ea`cuF"Bj[+>bl52(UUB1,(L8cFtE$9joS=@4X,f0fUp=1GL[@/2St90e>%;3A*0G2)I'E/2K"5
2)70H2DHa6/C(s\<D?mQ%15C;F_kJ/6>pmU@;KY!/4`Y]1c%'L/2]:?0f^f1]c^<l@4Wu]0ekCB
2(LI=0K(I</i5R>0fD$E2DI3N1H-j@1G1@A1c$gC/1`?t]e!/X@4Vip6#:gT/4`Y]2_d-D/3,IG
1c?o1\1o+)ATB=f/29+A2DQd:1bga:1bL[A/2B1A/hf.>3A``I1bLO;1H$pB/1`?t\1oO5ATB=2
$:/KSBl\5F85^Qc1cR<C1GUaE1+^_b+@g![/1iD)/2Jn72(UI90eP7;1,CdB/28n43&riR3AN-:
/C(s\7qHNg%15C<@:X(jBONG_6m+<B0f_0D1-%3L0J$QR6VUu??S#P83%d3N/3,L=1H@EP3A<!9
1-$sH3B&]O1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq9joRs:2+?PEbSs"+E2@>E,Tf+Cc`b*D.-sh
DeNQ%BlbD=BOr<!De'u/Afu2/F`(`$EZf(6+A$3TD]inBFD,T/DeF>J+@1&kG@bT,+CT=6Eb031
ATMF#FD5W*+DQ%?FD55r/0I5q@:X(jBON#tF!+n-F)N10+D5V'+E(j7Ci=K./0JnC@:Njk@;]Tu
F`(o8GqL9M$:/N;DKBN0@<l94=$]b]/Mf47=$]b]/Mf47?Q_^VF=^cM?S!oc/i,140fCmA1H@HQ
2`3-<1,COB2D@$I1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;
DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqEc`iV:hXQZBlJ$*DIml3E,ol9Df]?'
/g*Gs@;[2dBl7@)@3B9*+E)./+E(j7FD,5.FE_XGFE2)5BlnVCA7]IsBk;?.De:,6BOr;_BPD9s
E,]N/ALDOA<+0EJCi<r/D0^5:Des?)Gq:(HDIal(F!,R<AKYr4Bl.d/A8,Ig+Co%tFEo!IAfu2/
AKYo$ARTI!@;]TuE,ol=ARfh#EZf:4+D,>/BOu4$@;[\A%15C=@:X:mFY$T[;c#&'1+ZKm;c#&'
1+ZcT:h=8j?S#P80et@:0J#":3%d$J1cR6H/3#7@2DHsG0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)
AS3PnF`M83F(c\8Ec5o8F(&lH+@0mRA8c:,+DGm>FD,5.E,oZ0@<-W9BQ%a!Cgh3l+E(j7<-<4s
AU,D,DIal1AS,LoF!,RC+EV:.+Dl%=BOu4#@;]TuBl5%mF`M83F(c\+F_l/BEb-j4$:/Q>BONG_
;BRqU3B8WF0eb:81G$h]+@1!f/1iD)/2St62_6a@1bLO;3&ETP/1ie52`NTK3AE'9/C(aV6#gor
%15C=B4Z0rDIIQ:85^Qi2)$R91GUpL/C/u)+@U<b/1iD,1,Ud?/M]%70J#%52`<3D1+kLC3ArfQ
/1iV3/het90JPO</1f,#1+Yk7Be0]#6#LCFEa^Li6m+3<1-%3M/2]@G1,(7d+B;-E/70r8/2o1@
2CpRA2_I'H1H.<P/2]@=2Dd*H1GgX<0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<D?mQ;g2e`Bldr1E,ol9
Df]?'4!6h,Bjl$j+DGm>FD,5.DIIBn+E(j7@3BW1@:NkiBPDE.Bl5&8BOr;tE+rf)E,T<)+@0mZ
@<,d!@X0(pG@b<!F(c\)F`_;8EZdn]EcQFJ9jr'aBl8!1DCuA*6#LIH@4XrI+?;G51,([B/C(LC
+Ac`_/1iD,0JYOB/Mo4;3%Qg;1b^I=/i>RA3AWZH/Mo481GC^@3&E0;/C(LO:hXDk%15C=F(KAC
85^Qh1b^d<3Ai`S0eCVT+BEW$/1iD-3ANQQ.l&q<0J#%51c-a=3AN3A2`<HN2(UL>/iGUE3A<6?
/1f)O/66n0/.DqPDKK<-ATKCn;BRkP1GgXB0K1mG/C(LC;e'_s5qF`K1-%0C1,^mG/28b22CpU?
2_HmD0f^sG/1iV8/i5@>0JG:6/1f)O/5p%s/.DqPEarNo_l[u2844RT1GL^H2CpdB3&EKD?Q_[R
D_,6H?S",g3%um=1,CO=1c79N0e>%=/i#4?1b^p@1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4+8n/0[At
A8cL/@;[3,Ec5o8F(&lH+@1$X@;KY!+DGm>@3B/jD/XQ<+E1n#CER>/+EV:.+Du+<FD)e8AfsBW
A8cL/@4WOFBOu3q+EV:.+B*E#+E1b1F(KD8FD,]5F_>A1@3B6%Ch4`'DBO%7AKYi.F`);0Bl5&8
GA1Pu+CQC<ARTU%@<<W(Bm=3"+Cno&ATKIH8TZ)!@<3Q6F(Jl)@<3Q"+E2@8D/"*+G%De;Derj&
+CehrASu$eEZee.A0>o(An?!oDI[6#E,TH.F<G16EZfF:AT2<oEb'56@;]TuARTUqGp$g=BOP@a
FCB'/F!,C5+@0mUDfTl,/g:`36#pIWF`MVG/4`Y]2)@'C/2fLH2`!#1YolAOD_*Ik0f1UB2_-UC
0ek420J5%:/2Aq9/ibXD1GCL60f^j@3&3<E3@m[@AS#X./C(LO6>pcn,#i5e+@gH`ASWE1ATDW1
iOjumJ^1jQK[.?k^S]>.cG.\W+Dk[uDK?pE,#i5e+@gQ_Eb$@<4!86Z+Eq78+E_a:A0>K&EZfI;
BlbD<FCB24@X0))Cht5&DI[BlDKI"0F*)G@DJsB'EcW?O7<2gYDf^#6ASu(#/0IJtE,]6+@q^"+
/0Ic2Des!%GpskEDIal(F!,F?F)u&)Cj@.3DBMA\H#Rk>@;[3.ASl.!BldcqDI[6#@V'%XF`V+:
BlkJ0DfT]+A0>i"Ec`FBAfu2/AKXESH#Rk>@;[2tDf0W<ASc0kFD5Z2+E(j7FD,5.883$^D]hPg
A7T7mF!,[?D]i\8@<,miA0>u-AKYK$DKBo2Ci!O%Bl@l3De:,6BOr;QF_kkAF!+.fB-8U@EZd\k
ChtJ?+B3#gB4r_:F(Jp#+DG^9<D?mS+Cf"9+@p'bBl@N5+BNK%CNCV,DIakX@<lo:2)[?:%15CA
CLLZp:iCDsATDL'E\'aZ+?))51FtOD1-%0BcE]2J;eL,%/M&J)1bLOB/2B4>/iYOA2`*3>/Mo::
2`WlW2`WE?/C(OV/5p2%/.DqPEbf)m+Ad)mDfRC";BRnS1H-jF2)7!C/C(OU+B)on/1iD-3AN?J
/Mo:>3%Qj<3ArED3A<'D2*!NO0e=n51bLUB3&riV/1`?tZ8!n/B6#O4$:/]MAR[2];BR\R2Dm$@
2*!WR/C(LC9P&/o5qF]I1GUm@0fLpL/2Ah83%R$F/ho=@2)[BE/MT1:3&36E3&rN@/C(LO9P&/o
%15CB@qBIm@4XrI+?)#81b:XC2)$p>cF+ioB6#Oh/29.=1,^^>3AiTD1+kI=/2B1B/iGRC0JkR:
/M]==3&iTG2DZmX@<?4$/1f)T/5p2%/0\MD@qBIm@3?sB,%5M/E+sD<+t5,e;f?f!@q@\D6#:CH
B4Z.++>G`.2'NJ:6$$URCiseA6$76jEa`cuF"Bj[+>Yi40e>.:3AE6>cEn]]DIY4`@4X)l1c.-A
0fUjI/2Jn=1b:@;0eP1>0etRF/29+:0f:dD0KC[8/C(UR6Z-Bb%15CBASc1*F!*efEb/ZqBlbgr
;BRbP1c[*D1,psG/C(RE6Z-Bb6");u3&EEI.l&h73%Qm=2E!*@1GCF@1,1UB1+Y18/i5IG2)$a9
/1f)Q/44;b/.DqPF(fB$F(eu585^Qd1cR6A1c$j?3@rI`+@pcd/3tg@3&ENQ.kik:2(UO91c[*A
1GLL?3AWTS1b:O;1bgsL0KC[8/C(XS89nVp%15CBE+risF),><85^Qd2E<cK1c7-J2D!.a+@BRX
/1iD)/2Ah50e>%83A*'G1,UgI/1i_>/i#@C1,C[:/1f)W/43id/.DqPF*(u6DfB8=85^Qb0f:[:
0fLsK3@lp?+B2cl/3tg@1GgsL.l&q;1FtC92`<3E2D-gF2E<`U/2B%72)R3J0et:2/2Aq2<+0o#
%15CC@;Be%@;B:&=$]b]/N,F:=$]b]/N,F:?Q_^1@4Yb:0K(aE2(^U>2)6^;1+kIF/28h5/ho(<
0JYC7/Mf.73&NZO3&<*@0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6VUu?<,ZDfCh7[!+E2@>E,Tf+Cc`b*
FCAs'Ea``l+Dk[uDK?qBBOr;rBOPUm+E(j7FD,5.6$-OFDfT8I+EV:.+DbJ,B4Z.++Dl%>DKK<$
DBNt.DJ*N'Bl5%mDeEu@%15CCBOtXuDIk@i;BRkP1GUL@0JbL>/C(^I6ul]e5qF`K1,L[82DI!B
/2Ah:1Ft:<2(gmL2`NZS/2f482)-pC0f1F4/C(^U6ul]e%15CCBko7j;BR\K1GLF82`*?N/C)!Q
:h=Yu5qF]G1c.!=1GU[D/2Jn<1b:LB/hf4E2_m'<1GUR<3&iZM0J"b+cG(o,ATB=2$:/cM@<3tj
;BR\K2`N?C2`NWQ/2B.,<+0o#6")K!0JbOG1+P+:0Jb79/iGI92)d-C3A<<N2_6^@/hf.=1bgj=
/1`P8/6$&#/.DqPFE2)(/4`Y]2DR!G/3#C?2`!#1Yom"d5qFT=0fCjJ2_?pJ0JY16/ibX;1,Ug>
0fCpF1-$m;2E<BD1,h-H1+Z+-FD5VD/C(LO<,t8U6Z6jaEa`I"Bl@l3De:+Y@<lF)+Co&)BkM<l
FD5Z2+@.DlE+iZ/+B3Aq-t."+F_kb@+@.DuF*)G2Ch[r>/e&.RG%kl8/4`Y]1G^^D/2T(81H-l1
[3.hFE\'L-0K:gC2(^[G1GLF8/iYa?0etU=2DR6K3%um82*!9H0KCsL1b;(5B5D:'BIk^[[4F[R
E\'e"G%GQ5ARloqDfQt"BOr;PBlY=^Ci*Tu@:LEuAfu2/AKXN<+AQ?fFD55nC`l#[D..<j@j"QZ
Anbad%15CG_m=/tFDNL!6m+6?1c@?M/28k=1GLm@?Q_^IF=^cM?S"/h1,CI;2*!9L2`*9M3%QX:
1+kC=3&*-G/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-
/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QUF=\V1AU%p!@;[3,Ec5o8F(&l;+@17iZYXQ%
C`mS+@;^-/G@>T)EZee.Bl.9p+DG^9FD,5.DIIX$G%Ddk@;'dlFDN(9@;]_#@:s.&+EqL5@q[!!
F!+m6F`(o5F_)\(DIal"F_l/BEa`d#Gp%0BB5VEqBk(RhF<G.4A7]Ul@j#2sE+irpBlA-8+EML5
@qfLq+D,Y4D'3q6AKYGjF(oM7De:+dAU%p!D_<4C$:/rKH!t`;@:XX7844RT3&`ZL/28q@3AW3n
+@U<b/70r8/2o1@0e>.=/hf+=1b^[9/M]"43&!*G0Jk=90JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7<3)n
9mL/bD..H-E,ol9Df]?'4!6h7AU.^)G@>$-+DGm>FD,5.Cgh?sATMr9@;]TuD/XK;+DG\3DfTr.
DKI"ABm+'.+DG^99mL/bD..H;%15CIASbseAmo=`/4`Y]3&<6C/28h;0f(^=c[[_m6[<;q/M&J)
1bL[H/2K%=/i>C?2D?m;2)-^<3&rlP1Ft(.c[[`$6[<;q%15CIBONG_;BRqX1b:@;2_Zs;cF4ob
EbR'V/1iD//iYjB1c-g>0K(mL1Ft+;/iYjN0f1a=/1f)U/4FSn/.DqPH>RA,Be2eQ+>Y].2(UOC
0fLd;cFtDtF`8nkJ<MN<2`*NN/M].?1+Y461c6g=0fL^@1,CdG1Ft+51bLaF3B&oU/1`?t^+<*'
E%DG*6=FG@A9BFo6m+3?1GCdH/2o@>1H$dD+B;-M/70q_1c70N.lT:B1b:O;3&<*@1,LU=0JPCC
1FtIA/ibU>3ANBA1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKC^/6,DY/0\#2F`_:>95ei^@;[3,Ec5o8F(&lH
+@9LJCLhQ1BlbD=BOr<"BkM*jF*&OADfor>@;0U%Df-\>BOr;ZDfTDtDBNn0DJ=!0F_kJ;+EM7=
F^]B'A0>T(+AQiqFD)diDfTDt/0JA=A0>r=D.7F"Bldj,+EV:.+DtV0Bl@ltC`me<Bl[p0+E(j7
95ei^@4i`5$:80ADIIQr-Z^D/FCB2@7nOm^3B8WM2`WZQ/64M`0JFVFE+gdS/1iD5/i>I:1,_-F
1c7*D1,CI</iGUI1,q6E8O6?!=%?1a/1agW2)$^8:N0tu%15F1FCf>494;OVDf[I#;BRhQ3@m-J
1c6i0[NIqKF=]^d/2/e90f:O;0JY=51G1UC/2B.:3&WWK1H-j:0eb491GpjC1b:1/cF,8kATTI4
$:8<8D/!i<85^Qb1H@6B1,(RA2([(-1E],,Be1he/M&\13B&KI2D-[;3ANBN/1iY7/hf"<3&ETG
@rHC.F`;G6A1T:XKek8KEbR'jCi*TnATMr90f:[C%15F5Bk/bc;BR\L3B/QE3AicT/C)!b+@U<b
/1iD)/2St51b:O?/ibgJ1bgj=/N,4@1H.0N0J"b+cG)(b7<3)n%15F5Ch7E6844RT3&*3G1+YFC
0etR:?Q`9[E\(QK?S",g2)Qp?3A<'@2E*NL2_6O91G1R?3Ai`L/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
?S#,gE\(.#DImHhCh7[!+E2@>E,Tf+Cc`b+ASbpo+DGm>@3BT!Eb-A7Dfp)1AKYo'+Eq79ATAo-
DBO%7AKYl/Ecbt;De:+jASu'l@;IP*$:8<?CghF+Bm;1";BR\Q3A<!>2)@$H/C(RE:NC/#/M&S5
1,Ud:0K([@/28b81b:U@/i#CA2`<KD2D-dB3B&WJ/1`?tZRemmBe0]#6=k1KBR+K0@4Xr8<%Uou
0f:LQ5u]F4/MT+6?Q`0VE\(QK?S!oe/hf%32E!0C1cR0I1+Y4A/i5I?2Dd0?1,(FC+A"k!0eb:(
:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&
/T,!6ATKD0/5Tnu/0\)0Ea`["Bjkm%E,ol9Df]?'/g*JlEb/p0DJ<N%G@>P8@3AKb@<Q?p+Co%t
FEo!IAfu;+FCfK6+CT.u+ED1>ATD6gDJO;9@Wcc8Bl5&1DfTD3Eb/`lDKI"CBl.F&+D>>,+EMX5
FEMXIBOPs)@V'+g+E2@>D/XN-A0>u4+EV:*F<GL6+CQC1@<?4%DII?(B5_<kATMo8idd79+sL]3
@<-I'+Dl%=BOu38+E2@>FCes(Eb0<5+E(j7FD,5.ARTV$BHeWQ+q4lGATVL"B4Z4,ALpAM+>PW/
0e>(=3B0#McESKfEbR'j@4X)i2)R->0K1aD/2/\52(U^H/iPdG3AWZH2_Hp@2_[-H/1`?tYq/[k
Be0]#6>0eJ@;]d185^Qi1H6p?1GUXE/2T((6#pZj6");u1,Ua>.l'%<2CpX:2DHa>1+kCD2*!TN
/2B.:1,^gD0K1O6/2T(46#pZj%15F9@VE]2/4`/O3&WHM0e>.@2_d$<?Q`9YGV!2Q?S"/h2`!!>
1c[0B1,LmI0e=n4/iYOE1bpj<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p,)/0[Z'A8,Ii+E2@>E,Tf+
Cc`b+BjtboJKS/M@`bWZaeiK">p*j&+EV:.+@9XWB45Uj+E2@>DKTi,Bjl*tDf-\9Afu2/AKXo[
DKBT6BlkJADfTA2<bZ#V@4WOFBPCsi+Dk[uDK?q/+C]A*B4uB0@V&tb+E(j7Ch[NqF=naH$:8H?
@;RPd;BRqU2)$R90KCsF2_<7a+AcW^/1iD)/2Jn91+Y4;1+kF@3B8lU/2f+83B&oU1Ft(.cF>E%
AS3P'$:8ZPDf/u7844RU0K(gD0J"q42_m6F/70McEH3U;/70qf/i,=81GUg?3&NKN2)-X62_Hp@
3&3?I/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_E\&D$Df]f1@3AurA0=ESEdD;0Dg#i4@3BN0DfBW9
@;J"J6>pp`DIFZ%F!,R<AKYl!D.Oi&Bm+'*+EVNEFD,5.FCfK5Bln96Gp%$;+@:!fDJ<N%Bl5&8
BOr;@0Q^tN@qBP"F`Ma[+A?3cATB=EFD,5.DIIBn+Eq78+EVX4DKBE.Ec#Au+EVNE6>pp_Bji-&
EbT0#DIIX$DJ()(Ec5e;FD,5.DIIBn+E(j7FD,5.6>pp_@3BT)G%G\H+q4lGDffQ)DCe=V+?;;6
/28t@1H6r2ZlhYTBe1he/M&_21Gp^?2_I*E2`!<L/29.;2_m9L2`*':/C(UR6#pZj%15FB@:Ntb
F_r[#;BRhT0Jb7=1H.$F/C/qk9PIre5qF`J0JkL91,UdF/2Jn62(UL<2D-[<2`3KP/1iV7/i#C@
3ArTC/1f,"/50be/.DqQF^fK4/4`/O1H7-L1Ft:>1H7'>?Q`'SDCf-G?S")f2E<<J1bLO@3&E<F
/1ie:/iG^M1Gh!@1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/59\n/4"E"FE1f+Bjkm%E,ol9Df]?'4!6k4
@WcW4BlbD=BOr;QDf9N;F`MMFDJ()9DfTA2AoD]4@q]RmA1e;u6?R0S/4`/O0fCaF2(UI;0f^s>
?Q_XPA1V(=?S",g1,pg@3A*'E2`WcP/2T+70K([E1GC@80JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#L3a
7<E3WDfBE!DBNn=DfBW9@;J"J6?R0S+DGm>FD,5.@rH4$Df0B:+E_a:A0?)7Eb$;)DfQt1De<Tm
AKY])+@UBcBl@s)@4hur6?R0V@4XrI+?2,71b:@82E*TR/C(sP6#gor5qFcG1H.9F0K1jD/2St=
0J#"81bLU@2`W`R/1ie53&NNJ0JY11/C(s\6#gor%15G>WGKJODJsSI844R[2)d?C2E!BJ/70Mr
F(6b./70qe/ho+41,1C;0JY@>3%QgE/i>OF2E<WG1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UCt/0[Q(
ASu!k+E2@>E,Tf+Cc`b+_l7IiWGZWq+Eq78+EV:.+D5V'+E(j7Ch[NqF=\PQAfu2/AKXooDCco=
DIal.Aftbu@;L%!+DG^97q$OVBldr1D0^5:Des?)GqL9M$:A6>DfBi?/4`Y]1,C[D/2Jt:1H6r2
YolDBE\'L-0K([C0J,.;1bpU60J57=/3,R?3B/rX2)m-=2)6dB3Ai]Q0e=k,cESof@<*n.$:A6@
ASc0k/4`Y]0fLdG/2B%?0K:W/Yol>TE\'Lb/2/q92E*-C2D?g90J5%=/2oRA0fLjD1,pgA2(gmL
2`WlQ/1`?tYq/1`E\%Y,6XaqI/4`Y]1,1==1c?o1Z62MCF"BU.0JG1@1+P4B0KC[>/i#C;1+k=B
1c7$D/2]F?0f1mL3&)s8/C(OP6Xb$e%15I2F*)>@/4`Y]1,q9K/2K1D2)$T,YolPJD(It]/20"=
1c?j?0f:a<0ePIG/28k8/iGOH1bq$A1GLLA3&iZP2CpC1cESojASit-$:A6CFEMD./4`Y]1,_!@
1c-sC/C0#*+@BRY/1iD)/2St;1+Y.:/ho7B1,gp=2*!9D3&**E2(V<b<?P@5;bekpc\4,*6Xb$e
%15I6@UX(n@;.8`;BRkU0Jb7>2E*HJ/C(OD:N0tu/M&J)1+kLD/2B+@/iYaK0f(^=1bLXD2`!-A
/1`?tZ7JdjBIjT"6Y0t@D_+FI+>u#42)Hj?2_m?L/70MeBONH!/70qg/i,F;0ekL;3&E?D2)d'<
2`NEF2`NfV1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qqBONGlEcl#;@<l:!+E2@>E,Tf+Cc`b,ASGUl
+DGm>FD,5.DIIBn+E(j7FD,5.DIIX$G%De<Eb/f)De:+lEcl#;@<iu;BOQ!*B5)O#F!,L;F(HJ9
D]j.8AKYl!FD5Z2@;I&uCi=N/E\7e.6Y1(BASuE;85^Qb0f1R80fLpK3@lmC+B2cl/1iD,1GgpJ
.l&q92_6g=1c6gA2D-a=0K;'K/2B%71,q9N2E36=/29%6<+0o#%15I6Ectl/FCfME85^Qg2)mHE
3&W]U2D!.d+@1$V/1iD)/2]%72(UL@2D-[>2DR-I/1i_6/iYXD0JtR91,(F?+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(mZ6#pBb,#)ca
F_,A3A7ZlNATDs&DKKH2+B)]WG%G3)@3?sQ2)I6D0fCaE.3NhCF!+m6AmoOpF`S[(E+*WuF(c\?
EbTW,EZee.A0><'FD,T5+E(j7+sKHl+A$H`ASu4#F)N0lBk1XgB5\n\Df-[pF_Q)=FCcS*AKYet
+AH9^@q]9p+tb&K$:AK8CghNrDCe=V+>bi42_6gB2_m*=1cHOW9joS)/1iD1/hf(40fCj@3&WZP
2)?d?0J51<0JYLD/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f<NQBln'-DCdV'/6,DQ/44)ZCghNrDBNY7+CQC0H$!_<Ci<s#@ps0r@rcKtDe*Qu
AKYc&DJ()(Ec5e;@3AN_@;-irDes32@;KL-%15I9@;U.&Fa5N/;BR\N0et:80K;'L/C(a\+B2cl
/4!\q0JkOE2_-U?2)6^=/iPR;2E*6C2Dm?O2CpR?/iYdD3&iZE/1f)V1+ZC5FY!t/6YKnHE+j9#
H!r7*5uUT32)$R_5uUT32)$Rg+@U<b/70r8/28k32`*'B1G1RF3&!3M/1iS1/iYjN0K(^<1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/4FSn/6$:kBcqA8DfBW9@;J"J6YKnH+Ac`l@<l9(BlbD=BOr<!Eb/[$
+ED1>ATAo3Aft&d@;0OdDIb@/$:AK8Ea^Li;BReT3&N6F0f(OC/C(OD6WS(U6")<!1,C^F.l8t9
0e>.61,LO:3&iNI1Gq'E1Ft@;/i,@D1cIEG/1f)P/43HU/.DqRBOPt#`J?'95u]F4/N#(M5u]F4
/N#(d+A@'$/70q_3&*?M.l0(>2_6[</ibg@1,h$B1b^dD2_Zd=2D-mC0f1[E/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"lrE\(.*Dg#Q)Bjkm%E,ol9Df]?'4!6n(@<6A+L`gDQ+CT.1@;]RhASuT4;f$Aq
@;@!-ATDW1AoD]4;fut1%15I9ARfCf@4Xr;+>Gl32E<cK3B9&Z1b;uV6#g]l?S#P82D-gC/2Jt:
/hf%<0JPL;1bLXF0K2!L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_Cb-btBOt[eBji,uF!+m6Ao(mt
/TZ&TAmo1\A1SjFEa`KmFD5Z2@;I',ARlp-Df9G7BOQ!*GAhM>+C]U=D.RT-@;]TuGAh>0DCcoO
H#7#/Ch[s)DJ()6BOr;rDfor>Ed9$R+ED1+BHVD;@:X(oBl@m1+CT.u+DGm>@rH7+Bk1dqARlol
F!,R<AKYl!FD5Z2@;I'"ART+[Eb0<5+D,P4+DG^9<-<(mF(o&8+q4lHBOu4+@;[Ve;BReP2*!3F
1cRES/C(aJ9P&,n/M&J)1G1I>/29%B/i>O@0JPR=0f:R?1-%3N0e=k,cF>E!AT'+/$:ANL@:Wqc
Ch5.g6m+3A0JY162)I6C?Q`0d@k:t<?S"/h1H$d@/iYU@0ek@50f1L:2)I6L2CpU;0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r)F(6aF87?4SBjkm%E,ol9Df]?'4!7L9AKX?SFCA]kCi!Z*BlbD*+DbJ,B4W3&
Dfor>@;0V$Df?h2DfTr?ATMo8Bl5%gDfTA>+@opTFD2k,F_PZ6+CSl(ATAna@;0gt-Z^DEDId<t
ASu$iDI[6/+CT.u+Eq78+Co&)BkM<lFCeu*@3AQF78lQL+BNK%Ch+YZATDL,@:s-oF(o`-+CT))
DJ()9Bln#2FD,5.DIm6s@X0(p@;^-<;f?egBcp5\Cgggb/g:`36YUXNCr;qt844RX1,:aF/2K(@
0f^dl+AHcl/70r8/2f+93@lm=2(gRA2)-pJ/1i_31H%0H2DHa<0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL
9lFo#7;O)F@;L*qA8cL&@;[3,Ec5o8F(&lH+@Bjb@;NiT+Dk[uDK?puBm+'.+E(j7F*(i2F!,17
+EV:.+DtV0Bm+&1:17gY@<<W.@;]_#@:s.(%15I@@qfCjCh$m)844RW1,([=1Gh$N/70Mu@r*]'
/70qe/iPa@0ek:80ek@=2(U=72D-jA2)[EM/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#,cCb/=q@psCd
B6@X#+E2@>E,Tf+Cc`b,De!KjDerol+DGm>FD,5.:17gY@;L$.DIIBn+D,P4+EV:.+DbJ,B4Z.+
+DbJ%AKY])+@B^XFE1f++@0jUEbT#l+DG^9:2+3HEa`U'@4hur6Z6pTEc,T$F`T*);BRbQ1,:C;
1Gq-N/2]:-6Z-Bb5qF]L2)7'?1,q$C/2]%?2(UI<1G1C=3AN<E/2B1;1G^^E1,(770JPF-:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?2)QpP
DIY4A:2+3VCghI-+@C'dATD[&@s)i8DfQspBkqX'@;6oXDfB9.DJ<l/-o!P;1G(==1c$R'G@>P8
@3ABbCh[s(+CT>5Ec5i6D.R`1GA(n;E,ol9Df]K#+EV:.+D>>&Bl@KmDKKo5@j#W,A7]R"De:,6
BOr<-Derj&+EMgLFCf;3Bl5&,BlbD+Df9D6+sKEd+ED%:DesQ<Bl@m'@Wc`7DfT<$F_r72De3`r
F*),=D'C/V+q4lHDfQsf@<-:&Be2eQ+>c)52(UXA0etU;cET,I6WS(U6")<!1,UsD.l0.>3@lp<
3&rNE3A`?B0K(pJ1Ft=A/i,4A1H.3C9OW$WDBL>rDJ*d"F(d!R/C(LU/43HU/0[brD.4V90fCsH
.4cT<Bjl=6BcnfY3&*6=+q4lHF_Y?%/4`Y]2DHpF/3#=?2DZo1M',?#E\'L-0fCdE1b1:;0JY19
/i>R=1,LmA1GpsK2`WED1bLI<1GUmG/1`?uM(D2/E\%Y,6ZmEj@4XrI+>Gc42CpU>3&`]GcE\Q]
EbR'V/2/q82`NBC2)$m=1+kLF/2oI>3ArWL1b^I42(gRB2Dd6K/1`?tZ7JFbBe0]#6t'P=BIl\P
+?)5<2CpR:0JbOC/C(OU+@BRV/4!\q1,(I<0J,"91cHsA/hf.61GC[=1,UgH0Jb730f1LA3&*6D
2(U:0cE]/U6Xapb%15L3Ch[`;85^Qj2DZm=1cRES/C(LC7W3;u5qF]G0etI81,q-O/2Jn<2Cp[E
/hf">3&WTE/M]:<3B/rU1,(71/C(LO7W3;u%15L7DIm9.85^Qh3ANEB0eb@:3B/S8YolDZB.PVc
1,(O>1b1C?0fLX</i#:81GLR91Gq*O3%um?2(gXD0JbLF/1`?tYq/7fB.OK!6tL7I@N[sQB4YUf
/4`Y]3&<<F/28h;2)R9CcEn]]@;mb`@4X/g1cI*?0fC^F/2Ah;2(UO=2D-pH0JPOD/1iS7/ho+?
1,q3D/1f)R/43ib/.DqSASu'gDeri585^Qe2)@'?2)dEL1+^_V+A??b/1iD-0f1mF.krk:1b:C7
0f1F92`E?E2DdEK0J"q8/i>RC0Jtg@/1f)P/50Vn/.DqSBjkO`D(J4U+>c):3%QsE1,L^:cESKZ
Df%$k/28q80JG"32`!3?1bLaF/29.D/i5RI0JYX>0fL^B1-%0J2_6L2cESofDf%$7$:JTGB5_Tp
Gq;KS+?;>62DZmA1bgjI/70MnAT',,/70qf/i#.40fCpB0fV$G1,pg:1+kF=1GU[E/2An63?UmZ
<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlG
Ec6,4A1_\-D.Rc>?S"l^D_*)3EbTE*A79!k@;]Tu<,Z5SB5\o3Ec5o8F(&lH+@Kp]B5_TpGp$s8
@;^-/FDi:4@;]Rd/0K%YBleA=@;]TuFEMVA+DG^9ASbdaDfT9.AKYi.G%GN%DKKqN+EMgF@W-'s
F(oN)+EV:.+CfP1FEMV8+CT.u+DbJ(B6@WqAKYo'+EV:.+CT.tATMs3EcW@AAfu2/AKYr'DfBN(
+E(j7<,u\jBk1X_+CT.u+B38g@:sL2+q4lIBlI`r@4XrI+>Gi8/2K+;3@rI]+@B^^/1iD)/2Ah3
1b:@8/iYjM1H.<F/MT1:3B/oT0K(I5/C(OP6Y1?j%15L;H!r7*5uUT32_lpc5uUT32_lpk+@^9i
/70q^1,LgC/Mf(80J"q4/ibjA1bgU:1b^U?0e=n40J5(<3A<9I/2An63?UmZ<A?0]+AQ?^AOUi^
=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>
?S"ZbE\&D/@<HU)FD50$+E2@>E,Tf+Cc`b-BmF,0BlbD*DBNk3C`mP&D/^V>BOQ!*BlbD+Ec6)5
BQPA+Gp#[rA8,Ii+CT.tATMs3EcW@FD]hb_F`M2<Bm"J>Bl5&8BOr;@3&308F"AGBDIal(F!,UH
ARloqDfQt:BkM+$Bl7Q+A9Dp,DJ()5E+NNn@;I')@q/qgBl@m1/0JYE@r-9uBl7Q+FD,5.Ch[Nq
F<G1,F*),>@;I')AfsKUG@><%/g:`36uQ[OA77#[6m+3=2`<BM/2fC?1cHsm+B;-E/70r8/2o19
2_6^<1G1C92DdBK/1i\;/i#@?1H%*A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ud/4j_iDf0--Bjkm%
E,ol9Df]?'4!6q0Anbda+Dk[uDK?q=F`JUGFCB24Bl5%gBjl'*Cgh3oF^\oo/e&.UDf&rlGq;KP
<%Uou1Ft(a+B;-E/70r8/28k32)6^<0K(O;3A`HI0e>.@/hf%?2E!NG1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/6,DQ/0[u7F)u&(DBNn=DfBW9@;J"J6uQpO@<iu0F!+m6Eb0<1Ec`FEAS5^qDBNY2+EV:.
+AQiqFD)da@<H'gF*2OHD/XQ7FCAm$F!,R<@<<W+F!,%3@r-()ARlomGp$sBF`);0Bl5&*DfTE1
FE8R5DIal1Bk(g!GA1l(Ch[Km/0JYE@r-9uBl7Q+@V&tgF!)l>F!,R<BlbD<FCB24Ch[I%+DG^9
FD,5.@rH7+FCf9)@<?4%DBMr"F($1c@;9_$/0K%JAKYW+ART['@V&tg.4ueR$:JrFBQ[cn@4XrI
+>l/:1FtIE1b^X8cEn]m@rEna/29%:0Jb:91,Cj?1+k=B/2B%9/hf7@1Gq0D/M](62DR!G0eb.0
/C(UR;e'_s%15LG@VB=(85^Qe1GCO72)I!F0eCVT+B;-E/3tgA0ebCB.lK+=2(UI73&)s=2Dm*I
1GLmJ2(UX?/iPXB0JbR;/1f)O/6,DQ/.DqSH>-hsDCe=V+>u,62CpgG2DI$>c\O:u6ul]e5qF`L
1bh!@2_m'I/2St:2_6^B2(g^F1cR3H/2o=:0f1jL1cHs:/C0,,/4=Me/.DqS_lS("[ObKG;c#&#
2_8#r;c#&#2_8;Y;e'_s?S!oh2*!WJ1,psE/28k31c[*B1H@'J2DR$I2_6O93%cmC0fLsG/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#,cD_+7oF*(h5;JBWLDBNn=DfBW9@;J"J7)Q*M_mU\%DBM8dBju*s
+DbJ(B6@WqAKYi$@;^-/FD,5.F*2@C-t6n'B4Z*+FD,*#+EV:.+EM[C+EqB>CMn'7.3N&:A0>u-
@<<W0AThX*+EVaHDK?q=AnEY)$:SE?@4Xr;+>PZ22)[?D0ekL@1,:Cf+Ad,h/70r8/3#7>3@lsC
2_HjG1c@?P/1iV01,^gF1c?m?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7
AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:ig+t,#`c-Bjkm%E,ol9Df]?'
4!6t$CgeH1@<3Q0DIjr/Afu2/AKYPmEboH$F*&O?Bl7QoDf'P<Bl5%lH#dV-/0JA=A0>r)Ecu#)
+CT=6@3BN0Df'3+ASuT4Eb/ltDf-\3DBO%7AKWaGA0>;uA0<[KA0>`'Ci![#Bji,N/jh68%15O7
@<6-mBIl\P+>l)71b:RC1c76DcFG&cEa^LN/29";1c['D3&NZH1G1FC/2B"9/i#4<1H@?E2)m3K
2E!6I1Ft(.cFGJoEa^L.$:ScB@rua"/4`Y]0ekL?/29(?3B8WF2]u(.FY#*q0JbOB3@cjA0K1O=
/iPO:2)['B0fV0I1b:C=/ho(:1G^p?/1`M7/6$&#/.DqTChI0g@<*ni;BRhR0KC[C0K1jH/C0S(
<bZS*5qF`I1,q$@0JY@>/2St=1b:C:2_HdA0JtdH/1iV01,:dK2)d';/C0S4<bZS*%15O?CNXZ?
A1U8L+>PZ12_6^E0JbO:cF=uaDepsV/1iD1/het13AE-G3&*BH0e=n42_HjC1-%*D/1`?t\1C!c
Cb-#&7;QjMFD*3r;BR\Q3AE'?2)I'J/C(OD<+0o#6");u2)7'G.l'(?2CpR82Dm$F0eP=B1-%9J
/2B1;2D@'H2)6^6/C(OP<+0o#%15O?FCB'$DCe=V+>u/42(U^G3&<?AcEeW]Ea^LN/29(@2E!'C
0eta?1+k==/2B+D/ho4<2)I$=2)-^?3&ilX2CpC1cEf&iEa^L.$:SfGG:Z9Q+?)#83@m$F1-$mm
+B3Jn/70r8/3#792CpRA/iG^J2`3KE/N,L>0fV-I2Dcs?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL<-;\%
9lG>dD.74!F_)\7Ec5o8F(&lH+@U-]G9Cp;E,oN2ASuU2+Dbt>AKY])+EV:.+Dbt+@;I&\@;BP!
G@;V1@;]_#@:s-oDe:,6BOr<(DfTr5ATDZ2Eb/ltDf-\9AfsfdH=:Z"BlS9,/e&.VDJ<]685^Qi
1GCd>0ebOB0f:N-[3/:WB.PVc1,1UB1+P%=2)?d=/i,I<1GUj@0Jk[E3&E0H/iYdI0JGL</1f)S
/5Tnj/.DqTEcPT&/4`Y]3&roS/28k;2_m<CcEeW\AT01d@4X/i1H@6A2`ENP/2Jn60e>+<1bLaD
2E!EM/2oL?2D[*E0f(@3/C(RQ6Y13f%15R5Ao;='/4`Y]2E<TO/3,C?1c-a?1*Au*@4X\q0fUpH
0Io%=1GgX>/iYU;1,h*D1c[HN0K(I?2(gaE1Gh'F/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f<NQBln'-DCdV"/4=Me/4O&[DJ=,6G@>P8@3A<`
EcYe7D0^5:Des?)Bk(Rf+Co\)Eb6G<BQ##8F`MA2A0>T(FDi:1+CoM$B5_Z?%15R5DJ(Lk;BRhW
1c-aB3&3BL/C/hh;e'_s6")<!2)R?R/M]4<2_6^:3&rNF1H@'H0etaJ1+Y"42D-^=1bg[D/1`?u
J1OW/D_)>)7U^LLEbTSG85^Qh2)7-B3B&ZN2([%[+@CEe/3tgA3A`TI.l9+;3%Qg;3A<!>3ArKF
1c%$I3%QmD/ho.93&**</1f)R/44\q/.DqUASc(%/4`Y]1H@3H/2T=E0f:L6+@pcd/1iD)/2St>
1b:@<3%d-E2`3?M/1iS:/het>1G^p?/1`A(89nVp%15R9Ch\-;@<,pq@4X`5/MT1,2DZm>1,Lp@
?Q_^IF=^cM?S"2i2DQgB/ho1<3A`KB/MT.91,:aD1c6g>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j
,"$K^@;[3,Ec5o8F(&lH+@]pYBm:b$@<,pq@3?sQ2`NeVJ<M]I2)?[(G@>P8FD,5.Anc:,F<G[D
+EV1'@q[!+@qfLl@q?csDBM;h@UUBfF<G[=AKXo[DBM;TEboZ8+CT.u+B)]d+@0jREc6#5D]hti
D/!lrEd98[87`o^E+NouA0>u-AKZ2*Gp%3I+D#)+@psInDf-\0DfQt/ChtXF@;]Tu@V'1\DBO%7
AKYQ/E+O'(D.RU,@;I'.ART(^Bl7Q+De:,2BR+Z5@ric,DBM;h@UUl5%15R@AS5RrDf0Z./4`/O
0eb@;3Ai?F2`!BH/70N#BlYb3/28k92)d$>1,M!B3%cmD/29(A/i5=A1,:O71+kOA0f1gL/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S#5lE\&D+FCB!"@;[3,Ec5o8F(&l;+@^0YB4Z1'DKKG4BlbD=BOr</
DId=!GAhM<A0>o,G%G\:De:,(Bl[c-Ao_g,+@gH`ASWD_H$!_<Ci<s3+DG^9FD,5.8T\BWBjkm%
DIIR+@<?4,AKYr1ASiQ.DBO%7AKYDnFCfK/BkCp!+sKEhG%ki&+@C'aD.R6l@3Qm<-q%cmBl7K)
6Z6gYARp'8+C]U=6t'tTAKX9TBkM*nATDK9+Cf)'F(K53@<3Q"DBNA(Cisf5Df-\>D]j.8AKZ&9
@<*`:+D,>!Ed8dF@<?X4AM,/9$:\rN@;KUcF`]0*;BRqX1,pg>0f(UD3%W@[+Ad,F/3tgB1,V!L
/M]=B2_6[90fLX>1c-gA0etXI1Ft+53A*3F1,:XE/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>cESosF$V?$
<+ohcDIIBn+DGm>DfTQ)Bl7?qCj@.8Ec5e;6#pCCBk'1Hfn%h1+P<UFK\3E[LtJ^MAp%r5@;IOS
\><VXF<DtZD/XQ=BHV5*+EV:.+D,>/BI>5]+A$Gn:h=ZgBjkm%@<6O2Des?)Gq:([BPDN1F*(i2
+Eq78+CehrCh7-"+sKQdAoqs3@;]^/+BMun@q]Fo+E(j7FD,5.;f?f#BHeWO+E)./+E(j7FD,5.
Ec653C`me@@<-EA+q4lKDfT]5F($Uj6m+3<0K(dG/2]=C0K:Uj+A??b/70r8/2f+;2(UI@1G1UE
2)[6L/2An31c-pE1c6g>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9P&,n,"$$XDImm#+B2c`E+N`+E,ol9
Df]?'4!7"2Ec#`9@3B9*+EV:.+D>J1FDl26@ps0rDIIBn+E(j7<+0Kb@;[31F(Jl)Bl5&8BOr;@
2fr^U@qBP"F`MaY+Dk[uDJ=!$+C\njF`_>0F_i17DBMV]FD5VF+q4lKEa`j3/4`'+/Pn#R1b;0`
<%Uou0f1Fg+@p'a/70q_2_m'E.l0.>2(Ua?3&W<C2D?a<0fCaE0J#">/i#7=0f_0D1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/4a>m/0[B&F*)G:@;[3,Ec5o8F(&lH+@^B[DL*F>F!+m6@q]:k@:OCjEZf(6
+EV:.+Dl%?Bk8D2,#`2sF(lgB+D#D!De+--DJ()#DBNM-E+O'.EZf:4+@1-kFE2)(+DG^9FD,5.
=@lV:BHUerDKL#AGqL4=BOr<,Deru-BlbD9CghU#A0>?,+EV:.+CSc%DfQsn@<-0tASH%.+@<uS
BPf@G%15RICiq:";BR\O1Ft:A1,(9)[NIqGF"Amo/M&\12E<<K/i#7=3&NEA2)?jE3ArlO3%QU3
cF,8k@<3t/$:]/T@;L!nD..3gBIl\P+?2;=1Ft781H7?S/C(OD:ig+t/M&J)1bLUE/2K+?/ibgM
1,:^<1G1XB0JG=@/1`?tZ7Jgn@k8&r7WiT_/4`/O0ebUC1c?mC0ekUG/70MfEa^M+/70qf/iPX=
0fV-F0JYXK2)6^A1bLUE3AiWP/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"Tc@4Xu[ASbdmA8,NrE,ol9
Df]?'4!7"8DJ:5-F!+n/+E)(,+A$'SCgh3lBk&90DfTA2D.R-nBl7Q+Anc9s+E)9C@VfJ!AM+E!
7Wi`oA1U8L+>P]31+Y480etL8cF+i_9joS=@4X)j1,(L91GCL>/2Jn41+YFC/hf4D1GCL6/Mf(5
0K(^C2E*0</C([T6VUu?%15RIH$*[L85^Qg2D[$<3&`TN0e=n!;e'_s/M&V81c[QJ1H.!D/2Jn5
3@lpD2_HpF1c6sC/1iY:/hf+<1GC[;/1`A(;e'_s%15U6@rc^:/4`Y]1cI<K/2f4:3&E23ZQMVU
FY#*q0etO>1+b@B0K1O;/i>X?0fV*E2`WTL3B/QA2)d-B0f(R>1Ft(.cEf&hEcioB$:eN?H"ge?
844RZ1GpsF/2T+=1c?ml+@C$V/70r8/3#7;1Ft793A*9G2)mEN/28n43ArQI2`3-A0JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL6Z-Bb6>1L`@;[3,Ec5o8F(&lH+@fjUH"ge3D.R-nF!,.)E,]N/ATMoF+@gHj
F)rI!@<?4%DII?(87?IVBl7L'F!,1<+EV:.+Co&,ASc:(D.RU,+E2".Ci=B5E+jM>@rH6pASH=!
A0>;uA0>K&Ci"$6ARlotDBM8ZF`_&0+CT.u+DGm>Df0,/De:+YBQ\E*DC9KJ@rH7,EbT!*FD5Z2
F!,RC+EV:.+EqaECh,.-$:eZEBl7Ql/5T8C+@7b?1G^O92_7d(;BS:[2D[->0fLXj+@g![/1iD)
/1iD53%d$H2)[6M/29(92`EEG2)?d7/70quASit-$:ef=F`Uu3/4`Y]1c.!F/2]=@0ek6)]-'L^
@4Wu]/M&\13&3$>2_m!F2)%$G0J#+B/i,:<0K1j?/1f)Y/4=Me/.DqVBk;0jBIl\P+>bu71+Y:C
3&!->cEeW\Ecs!"/28n72)m0B2`!6@1+kFD/29+?/ibdD2)I*?/MT1:2)I$J1-$m:/C(RQ6ZR?$
%15U>DIIE685^Qe2_Zp:2D?mE0J(MW+@C0l/1iD)/2Jn93@lmE2(g[A0JG:C/1ib6/i57:0f1g?
/1f)S/44H#/.DqVCi<a'/6>,9:b=CX/1b-N9R1M,?S#P80eb4;0e>%90J5(61-%9P/2K(73&iZM
0fLX=0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,,!p<aFD5f0+E2@>E,Tf+Cc`b2DBMY^DKm9o@:a7h
@k8`mCi<a'+Dk[uDK?qBD]j+7Bl7K)-u<U5AKYD(F*(i2.4ueR$:f#OASH3o/4`Y]1,q*J/2K1=
3&iJ7Z62M/Be2P$0K1aG1+P%<0fLX=/iYjB0ekC82`N`S2`*'F/i#CH1GLd=/1f)P/43-G/.DqV
Ecl55F_r[#;BRkU3&iHK2`3QP/C(sP6ul]e5qF`L2)@*?2)[<I/2Jn;1Ft:>3%d!H1,:OB/2]=<
3&`TN1c?m9/C(s\6ul]e%15UJA85O(85^Qf3&`iK2`EQN0J(M\+B)il/1iD)/2St53@lpA2_HgE
1c[6G/29+:0f1UB2Dcs9/C(gX;e9u#%15UJD..6h/4`/O0fM*Q1c[*I1c@0J/64Vd2)6:QB6#P1
/29.>2)[$A1bg^92D-aB/2B1E/iYgM1c79E/M].80fM*K2)Hj>0JPR18O6?20JFVE@;TREG]-Z%
Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?L
2Dm6@;eL,%,!p<mDImN)E,ol9Df]?'4!7%9D..6h+DGm>@3A9QCghT3GAhM4/0K.MBk(g!D.R-n
F!+m6D..'k@j#5lH>d54+EMXCDIjr&Dfor.+DG^9F)GE%ATKCFA9)*kDf0VI+D#Y)/g:`37s/]`
Bju4-/4`Y]2Dd*C/3#IC0JtC;2BYe7BIlG#0fLgE1G(@?1H$dA/hf481,V$D3&<KQ2`3-<1,^aB
3B/uY1+Xt-1H$d[E+gd3$:nT9@<*ni;BRhP2E*0F3&`NH/C(OD6Y1-d6")<!1b^^F/N,:<1+Y+3
2DHa<0eb4?2)R?N2CpF<0J5.?1GCUB/1`?tZ7J@SDCc5(87?(?F`T*);BR\P1bgO:1H.3N/C(^I
6$73!/M&J)1G1CA/2oI>2DR6N1,:C;0eP4;1c.-L/1`?t[k'gfE\%Y,87?@DCb/+T+>tr5/3,[L
1b?qW+@1$^/1iD)/2Ah30e>+8/iPdH1Gq*B1,CO>2DR*D3%QU3cESodEbR'6$:nTHF(&lrBIl\P
+>G`42_6^?0JPF9cFG&`F`K#b/1iD./iG^@2`*-B1cR<I0e>+:/ho7B0eb:46$-pOF!*hgASc'3
/C(dW6$73!%15X7FEqq9/4`Y]0fV0R/2B+=1bgQ,\KF[gBe2PY/2/q;2)Hm=2)R6B1+kO?/3#F<
3&NZN2)m-=2(gmC3B8cJ/4"Ao@<3PYDe3a!/1f)W/5L;#/.DqWAScO$FD5Z7/4`Y]3&`TQ/28k8
1Gq*B2)-4MAS3PG/2At<2`3*@0Jk[=2(g^G/2K+>/i,CD2)mBC1,(=>2E3ZP0e>(60f:(K@;TRE
G]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*`0e?.4
B.P5tAScO$FD5Z7+DGm>FD,5.9OW$WDBNP0EZcPMFD,5.87cU\ATVWpDB^8I@;]TuEb/ioEcW@F
D]j.8AKX?OCijB$+EVX<@V$[(BOQ!*Ch\'(A0>T(+B*JuFF%M=Cgh3l+CoV8Bl7Q+FD,5.9ke-K
Ch4_TB4Z-:+q4lMAU7o=85^Qf0ebO;2E!<I3@rIa+BE2s/3tgA1G^jH/MJk72CpX:1H6p@0Jb=>
2`!6D0J"e0/i>XH3&30=6$-pOF!*hgASc'3/C([T<bZS*%15XEB4kXn/4`/O1,q0N3%Qg>0ebU=
?Q`<VFY$lN?S"/h1H6pD2_I'I2D@!K/2St:2`3?N2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r-@<F+e
ChI="Bjkm%E,ol9Df]?'4!7(4B4kXn+DGm>FD,5.DIIBn+E(j7FD,5.D..-r+Dl%>DKK<$DBNt.
DJ*N'Bl5&8BOr;b@;'(i@3@sLF(KB6+DG^9F)Q2CBOu4%+@0gVATDKn/e&.YDf&p"/4`Y]3&WQL
/28k70JYX>cF+ilAS3P[/2At;0f:I90JtO81G1L=/2K+:/i,CC2)$g;0eb4>1GL[D1Ft(.cF,9#
AS3P'$:o)UDIG(e5u]F4/Mf@;83p3,:b=I_/70N!EbR(3/70q_1+kF?/2K.91H70G2)-X<1+k==
2DI!G/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#/sBe2_fDJj00BHV87DfBW9@;J"J88iNd@3B9*+D>>&
C`mY:+EV:.+E_R4ATE!5Ebo8/Ao_g,+@^'_DJ<T'D0^5:Des?)GqKO589JfYBQ1l#/4`/O3B/cK
3@m$F0fLp??Q_^VF=^cM?S"/h0JtC92E<BH1cR3G3%QX:1G1[H2)I$F/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S"QbF=]t$DIdm1@;[3,Ec5o8F(&lH+@pWm@;'Vt\fc3*F!,C=AKYo'+EV:.+EVgADBNS1
A9/l;BQ##&ARf.cAKZ).AKXooDBNY2+A4(r@q]F$+=L*0Bk(hoW@8ra@<l:!+DlCGBQ%^*B6bV.
F!,L7@rHL-FCeu*Bl5&8BOr;_DfBW2+BEVu/e&.YF`),</4`'+/Pn#S/1b-N87cfm?S#P83%d-F
/2B%>/ho4<1c[9A1bgU:1cR0K2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r!ATB=G89Jf_@<-'jDBNn=
DfBW9@;J"J89JfgEZfR7F!+m6Ch76jDId0rGp$O5@qB_'DfQt=Afu2/AKXNdDK?q/DIal3BOr;W
F`(i#EbSs"+DtV0Bl@l?+CT.u+C]A0FD,6++E(j79jq[QE\8OF$;##LBl#=k;BRhW1,pgD3&**D
/C/ki;e'_s6")<!2)R9P/M]=@1Ft=73&`BD1H@'C1,1L@0e=n33A*'A1b^jE/1`?uJLj`0D_)>)
8Si3gEbSs"/4`/O3&3HQ2Cp[D0K;!B?Q`$:Be3UB?S",g2DQg<1c$aE1H7-J2_6aA/iPaD2`*9@
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/5/cP/0[Ar@UX.g@;[3,Ec5o8F(&lH+@p3fFDl26@;^-/Cgh?s
AScW7@V'@iAThW-FD,*)+EV:.+@0gQ@;]dfDK?q/Eb-A(ATM?mDId0nFE8RCAfu2/AKXQ\CjC&8
@;^-;+CQC7ATDW16#:"=DJ<NsF!,FBDfoT,Gp$U*Cht59BOu%%AScO$F"SXG$;#)CBe2eQ+>bu6
2Cp^G2`*HEcEn]]Eciob/1iD./iPX=0fUsA2`N]O1,(722)m3I1cRKN2_6L2cEo,iEcioB$;#,T
F_PZ./4`/O0f:jG0ek4=1cIBQ/70McEa^M+/70qd/iGX>1,V'E3Ar]K2E36>1cR*F1c[?I0J"t5
0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o
0f`Z]E,ol?ARmB1@;TRs/70qoEa^LqATDp:Bjkm%E,ol9Df]?'4!7+4EHPu3C`mq1F!,C=AKYYp
Ch=f.Afu2/AKYK$F`;/.+DG_:DesT.A0>T(+EV:.+EVX4B5(iuCi=K.+EMXCEd8d/@<iu;D]j.8
AKXooDBND6+D,&!Dfp+D:h=ZiG%kB&+Eqj?FCfJ86"4kCBOPa#<affTASc:%@<*t0$;#,W@;[Ve
6m+6=3&W`I0f:gI3%SDZ7W3;i/70r8/3,=C1+Y::/ho:D3&r]E/Mf182`!-B0Jk=90JPR18O6?2
0JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9
G%G29DIIBnF"CZL7W3;u,#)K^@<lp.@;[3,Ec5o8F(&lH+A$Hm@;[3)ARTIt+Co1pD/X<&+DG^9
FD,5.9jqjHGp$p3DJ+*#B4W266=FP9F($1cASbe#FX\ja@;Kb&A8,po+EVNEFD,5.F(f9*Bl7Q+
De:,#+EMX5E\8OF$;#,WATD:$F`T*);BRbS1c$[>2Dd?I/70N"9joS)/20(>3&`?E2)@-A2(g^?
/28t:/ho7B2DI0B1c6mD0JPCD1+Y170f:(K@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPFrA8-."Df.*X/6,DQ/0[Z'FCfK&EclFGD.R-nF!)YN@V'Y*AS#a%
FD,5.Ch77#+sJ.DDBMV]FD5V8F*)\DALnsEAS,LoEbTE(+EVNEFD,5.F*(i2-Z^DLDf]W7Bl@l3
Bl5&8BOr;rDf0W<ASc0kFD5Z2+B<H'@3A9QC2\,F+q4lNEb0,s/6>,9:b=I_/6>,9:b=I_/70Mj
ATB>//70qg/i5:61,Ld>3AifV2)Qp>0J5%81,V!N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8
FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"`ZE\(.*
Dg#]0Bjkm%E,ol9Df]?'4!7+8AStp!BlbD*+DbUtA8,po+Cf(nEa`I"ATAo-DBO%7AKYl/G%GJ4
<Gl>YEZfI;AKXH_ARuu_F`'5_@3AKjDfU+GDe:,6BOr;PDI[BlDKI!kEa`irAmodpATDi7@X0(p
Ci=K.DIjr7EbTW,EZdhl@;[2d@;KMoTke?b7VQbZ^1Ukp/g*`+AStp!BlbD*+Eqa@@;[3+Afu2/
AKYK$F`MRV%15[KDf0)o/4`/O1,([E3&`BC0K:jI2(W)W7ri`'?S#P82_HpG/2K%A/i,:=2E<`J
/Mf=<2`<HM1,LO;0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL7ri`',"H'NDf0--AKYr4DfBW9@;J"J8T\lg
A77#3Bl5&8BOr;\H"Cl)+EVO>B6@c:+Cf>1Eb0<2Df0*,+EVNE@;Ka&FD,*)+DGm>@V&tjFD5?0
Cb?n@$;#PPE\'aZ+>l#12CpdB0ebI9cF"c]Df70m/28t<2)$O92_['>1+k@?/2At8/i#7A2`<HC
1,gg>2`*9D2_6L2cF#2iDf709$;+`9@UWq$85^Qg0JYR<2`WZQ1b?qc+B)cg/4!\q0fCaA0J,">
1,pgA/i>=61,La=3B9&Y3A`9=0f^jC2D@'D3%QU3cFkc-@rEn-$;,#RBQ\#?85^Qc3AW??1H.'I
2([%f+@g![/1iD)/2St=3@lm>1bL^I0f(dJ/2K+82)mEK1c?m9/C)!]7qHNg%15a:AnGIfC2%3l
D.+td;BRqQ1b:@:2_[-@cEeW\ATTIh/2/h91G^O81GL^;1G1OC/2T%53&3?G2DZm?/i#4?3&*<B
/1f)Q/43uj/.DqZ@;K@pF(m0r6m+HF1c.!>1cI0D1+ZcT<b6(u?S!lk1H.'@1c$jE/3#7;1Ft7;
1bLOD3ANQL/1i\7/i#@@1,(O91,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/66=u/5'PlH!tS5E,ol9Df]?'
4!7L9AKZ28Eb$:c@;K@pF(lb6ARTIt+CQC9ATE&=F*)G@DJ()9BPDL'Bl7Q+@rH1+D/LJ7Afu;3
DIal(DBO%7AKXBSDesQ7+DbJ(B6@WqAKYo'+A69`H!r<7$;4fEFa5N/6m+3@2)I0L/2oRE0f^dl
+@C09/70r8/2f+<2_6^@1+kF=2D['A/2B+92`*9K1cR$A0JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6ZPLE
8mu[IDImm#+E2@>E,Tf+Cc`b4@;U.4+DGm>@3Bc4Eb$;,DBO%7AKX9QDKR(<@;]_#@:s-oA7]Xs
FD5W*+CQC6F`:o4DIIX0Ea`c,ASuU(FEo!JDf]u2F)u&5B-;87Bl[p0F^])/ASu("B6c*=$;4fF
B.QSO+>kr02(UXG1bq!@cFP-!BlY=I/M&J)1bLLB/2Aq9/i#1<3AWZH/MSq31,h!J0Jk=3/C(gX
<bZS*%15a:Ea``l/4`/O0f(aE3&iHJ2D[3F/70McE-!R;/29"<2)d*H0JP=63%d-E/2B";/ibXE
1G^s@/N>F:1,(OB3A`9B0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)
GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#^lr,#2]n+Bi>bCgh3l+E2@>E,Tf+
Cc`b4@<,dl@3B9*+EV:.+EqaEA0>T(+EV:.+AKe*DfTP7Cgh3oF^\oo+D,P4+CQC3Cgh4'+D#G$
ASl-k+EVNE:1\Vl>%M,Y@;]TuFD,*)+E2@>A9DBnF!+m6@WH0qBQPA8Ea`iuALns9Ch7[$Gp$^>
F_PqM+q4lP@<HW66$76jEa`cuF"Bj[+>u2<3@m0E0fV$AcF"cnB6#Oh/29+>1bpX=1bpj<0ePCF
/2B.B/hf+;3B8lH/Mf491H73L0fCR6/C(XS;eL,%%15a:F`SZlDfTDtCh[rA85^Qg3AE<@3A<9M
2D!.c+B)on/1iD-3&3HI/M]1=2(UL83&3$?2`<9K3ANKN3%QX:2(g^@0fLd@/1`?t].?lnE\%Y,
94;sa+AHEXBjiP`;BRkW2*!3I3B8lM/C(UF;eL,%/M&V91,1I71-%3G/2Ah:1+Y1>2(gX@3&NBL
/1iV;/iYUG0ebF8/1f)R/5p2%/.DqZ@<Q3q/4`/O0fLsI1bgOA1,q9O/70MuATB>//70qf/hf%3
1,q'B3AN9E2)$R</i#=B1GUa;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p,#/0[Z+@;]dfDBNn=DfBW9
@;J"J94<!TBHV#1+E)./+E(j7FD,5.BOu4&ATJu4Aft#c@;'OeD.RB3+EV:.+D#M+@j#`/ASiQ"
Df'H3F(Jl)@X0(mATDj+@;[3,De4#57V-UNDg-8:+C\o(G@b?'+?;A>+CT.u+>GQ)0H`_O/g*eq
G%G>0BlbD*+C].q@r$.&Bln#2GA(n;F*VV3Des-/ATJu/F`VY=@q@8:%15a>Bk/bc;BR\M1,UU;
3B/iU/C)!c+@U<b/3tg@1bgjD/MK+>3@m!>1c$[@1G1XA2`WlY/1ie52Dm6L2_lp8/C)!c/4FSn
/.DqZBOPae@;KXd/4`Y]2)@*M/2fLK2`*)2]-'O_Be2P$0f1UF0eG+91,:C;/i>C81,1U<2`EZP
2E36>0f(F<2_d!H2CpC1cFYW.BlYa6$;5)T@;Kmr@4XrI+?2)30e>%51c[NS/C(LC7<*H$5qFcG
0f:p@0JtRB/2Jn=1+Y493%d3K2*!KR/2]%81cIBP2(U:0cESohEHNfA$;5;IBOP@$85^Qf2)[6A
2_m9F2_<7[+B;-M/1iD-1c6sG.lT:=3@lp<0K1O<1,:I?2`<HL2_6mE/ho4@2)$j</1f)P/6,DY
/.DqZDe3Wk/4`?/+>GW32DHa;1-%6I/70MgEbR(3/70q_0J5+</2T(62E*TR3Ai?>1,CO:3&WZL
1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70qsEbR($F_,T8D]hql@ps6tE,ol9Df]?'4!717ASGQqG@>P8
FD,5.GAhM4+D,P4+EMX5EZf(6+EV:.+DbJ(B6@WqAKYo'+EV:.+B2deX_r&"8T&'QB4Yt!F`S[%
AT)O(AKYo'+EV:.+@BRXBjtO_@;[\,$;5;OF=^Ni/Mo"\:G"CS?Q`$fDCf-G?S!oc/iGI90ek@7
1H7?K2E36F3%csE3&!<N/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"lrDCe4tFDl&2@;[3,Ec5o8F(&lH
+A6WeF<G:=+@U?nDf08tDBNP0EZfI;AKZ)/D.Oi6BOu'(FD,5.;fut#EbTT+F!,17+EV:.+Dl%;
DJ=!$+=Lc/GA\i^%15aHEc,H-BQ%p0F"Bj[+>tr23%R$C3&*<BcE\Q`ATB=f@4X,k1GCR71,1OE
/2Ah:3%QgA2_HsF1c[QU/2Aq41cRKR0ek41/C(OP87cfm%15aK@<sIq;BReT3&W<G0f([I/C(OD
6ZR?$/M&J)1+kIB/29+D/i>XI3&**</M]+71H@?P2*!3RFDPB,+@C'YChYFOcE\ugEcruC$;5M^
BOPR*85^Qi1bgp?0ebRI0fLZ/^*#dSE$-\t@4X/h0Jb[=2Dd3L/2St72CpX?0J5@B2`EKK/2f=;
2DR3O2_cj7/C(s\6Y13f%15d;+B*E%ATD6g/4`Y]1cR<M/2f7=1,CIa+@B1I/1iD)/2]%:1+Y.?
0eP4@1,^jE/2T4:1c-mA2)d';/6OMk<c0Gt$;=lK@<Z-m/4`Y]2DR*D/3#C@3ArG6[3/CXD_*Ik
/M&Y01-$m@2)6dA1b^mJ3%QX;1bLOD1GUaA/1`?t[4G6dD_)>)9P&6^@4Xr8<%Uou1bpUQ5u]F4
/Mo46?Q_mb@4Yb:?S!oe/ho470f([>1GgpE2_cjA/hf:E1,:d>1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/4b%p/0[T)AS#X"E,ol9Df]?'4!74.Ec,;.G@>P8FD,5.DIIBn+E(j7@3BApCLnW&DBO%7AKYPm
F*(u6DBMbeCi=92DJj$,ALnsJBOu3q+EV:.+A??eDII*bDBMJqA9)*0+CT.1Bl.^*Ecb`++DlCG
BPCsbC`mV0DIkD5ART+\A0>>m@<6N5Ch\'(A1f!(BOr<-FCB24Ch[I%+DG^9FD,5.@rH7+FCf9)
@<?4%DBNk0+@pcgEa^RE%15d?F('0(/4`Y]2Dm0J/3#LF3ArG7Kcj<(D_*Ik/M&Y02_Zd<2DQmC
3A<HP3@la<2_HjG2)m<H/1`?uKe-/4D_)>)9PIsIEcb`2/4`Y]2`3TQ/3,XL1H6r2^*#^]Cb.k'
0f_*J1+P%<1,pgA/iPL91-%<H2)[3D0K:UC/i5I@1c7'?1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(s\6#g]l,"u][ATDm$F!,1<
+A?3cBl5&*DfQsE,&Ct&ATDm<+sJW^9PIsIEccRLEb/ioEcW@FD]j+>@qf@f+CT.u+E278Bln'!
@;I&uEb/fmDf'PH+CT.u+CQC5ASl.!A7]d(FD,*)+EV:.Eb-A%Eb-A4AT)O(AKYMpEbT].A0>f&
+Dbb$ATDm<+DG^9FD,5.GAhM<A0>H,ASrW4De*:%/g+,,AKYK$DKBo2Ci!O%Bl@l36#h$]CgeH,
AT2[$F(K62F!+n/+D"toCh4_@+CQC3DfBi8@<*K3H#7#/C`mY.+Dbb$ATDm</g:`39PJ!M/5T8C
+@7e<2)d$?1+Z7#;BS:\1,V!@0et:3+BE2s/1iD)/1iD-3AiEC0et[A0e>%7/iG[E1bgp?1,(F?
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2
/1iDRBlYauBk(g!BlbD*+D,=tFD5Z2@;I'/DId<eA0>B&ART\'Eb-A/DJs`:+D,P4+Cf>-FE2;9
Ch[d"+E)@8ATAo9DId<eA0>B&ART\'Eb0;7GA2/4+DkP"Bk&b)$;>/FF)>>:844RT0fUpB1FtFB
0f_!??Q`?C@4Yb:?S"/h0JtC:0Jb==0ebIE0e>1</iPOF2)7*A1,(FC+A"k!0eb:(:18!N7<i`P
DfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0
/6,DQ/0[brFEVA,DBNn=DfBW9@;J"J9PJ'ZD.+Q(ARTIt+D,FuD.P7@@;]TuBlkJ3F!,R<AKYl!
D.Oi.AftM)@q]:k@:OCjEZet7Df$V=BOr;[@<?[,@;[3,De3c.;flGWF`Lo'F!,UC+A?K\F)>><
+q4lQBl%Kt+@:!eARR,\;BRqS1b:@;0K(X:1H?RDEbR'V/1iD0/i>C81bgUC2`EKL2CpUD/i#7B
0ekO:9OW$WDCd=p3@mI:Be3"n@rH0lF"L((F_Pn>A7ZlW@:N_[Ci!Z*Bl5%J2`3N'$;>/PDK9Z*
CFi"E+>PZ,2`EHB0ek@A0f(@f+@1!f/70r8/2o1>0J#"92D-pH1,psB/1iS8/i#=@2DmBD1,(FC
+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC
@;p1+Dg#]&/T,!6ATKD0/4"8r/4a\sB-9icDJ()2Ec5o8F(&lH+A?KfDBMhq@r!3$F!+m6Ch[g*
/TYT6E+NQ&E+NHn+E)F7EboZ4CM@[!+@pEgB-9icDJ()#DIal(F!+m6@s)U0F`Lo,+EMgF@W-'*
GA2/4+Co%pE$014F)Y]#F<G19Df$V=BOr<&De!3l+Cf>,D09`1FEoJJ$;>SPBl%L$@Wc^)F^lsn
6m+<D1Gpj;1GCdH0J$QR6$73!?S#P82_I'M/3,XA0f^pE2DZm?3%d3L1-%6J/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"KcE\&D.Fa.J7@W-C0B4Z*+E,ol9Df]?'4!7L9AKXZh@qfanDIRa/BQ[f-AoD^3
Eb0<5+Eq78+C]J-Cige6DBLqt1E^.P+EV:.+D,P7DId=!+E(j79QbSkD.7F+Eb?pG6Z7*bF<FLr
AS5UqBk:g-+q4lQF`V8=_kM$_@4Xr;+>br62)6^=0KCgE/70MoDf.+5/70qf/ho%23B&QH0JkdJ
2CpR:/ib^D3&r]E1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5:&#/5U8*FEM5=ATME*E,ol9Df]?'4!74>
F(oa6U2F[R+DGm>FD,5.@;]RhASuT4DIIBn+E(j7FD,5.G@bi;ATDZ2Eb/ltDf-\9Afu2/AKXQR
ATDKp+AcWeBl8!7CgeH1BOu3q+EV:.+A?p!Blmd$Bjkm%E+Ns,Ch4`*Bm+&u+CT.u+EqL1Eb-A1
Df^"CDe:,/De*F"DCoC-Gp#q%EccG:@;I'#F!,O<FEM#6ARmD&$;Fr;F*VUR85^Qg2)7'@3&NTS
1G$h`+@p'a/1iD)/2St90e>(<1+kIE1c@*I/2B+90ek@?1c6g8/C(jY87cfm%15g<@rH6qD_+FI
+?;533&<*C1,UgA/70McDKIF:/70qf/i,140fCa=0K;!G1c?m:1G^X@2`EEG1b:C90f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70qoDKIEsDes?/@VK7g+E2@>E,Tf+Cc`b6@:O4nA8`T)F!,R<AKYi8FD,Au@;I'0
Bl%ToB4W3(Afu2/AKYl/G%GJ4:Ms_d89Jf\Eb/c(=_2#^F!,C5+B*2pBlnK.AKWBgBk;0)@Df?g
F!,")+EMI;ARo4[.3N_GAKYK!@<6L(@j#Z-G%GJ4@X0(d@:F7kAS`JZ@<,kqX^N>H@<-@1AU5sO
9jqOMDIdZ.BlbD*+D,=tFD5Z2@;I'*Cgggb+EqL1Eb-A1@:s:a+CT.u+ED%%Ch\!:+CT;%+Dkh;
ARmD&$;FrAD_+FI+>Yc10fU^>1b^U>/70Me@;RQ&/70qd/i5@82`E?G0JbC:0J#+B/iGLG1b^a;
1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD
1,(FC@;p1+Dg#]&/T,!6ATKD0/43i_/4X8lD..<)E,ol9Df]?'4!77+B5\o,F!+m6:186YDf0!"
+AcKeCER>/+@UBcBl@s)@3BH+FCeu*AoD]4BlnD=B5)BpAnGUq/g+,,AKZ&9@<*K!CiaM;BOPk!
ASuQ3FDi:2AKY])+EV:.+Cf>-F*(u0CghF"Df-\9AfsHLD.RO%E+*ctBlbCFFD,5.B5)BpAnGU'
/e&.^@;'(jBl,Cl;BR_K3Ai?C3&<NJ/C(aJ6$73!5qF]I2*!TG1H.$E/2Ah92(U^I/ib^A1-%*@
1H-pA0etUG2(U:0cF>DkF`K#B$;FrBF('0)/4`/O0f:^D3&)sD1,_!E/70MqE+ge0/70qf/i,I<
1,Uj?1c$jD3A`9A0ePIF1H.-M/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"ulBIlGqATD6gBkh'oBcqA8
DfBW9@;J"J9jq^V@<?3+7q$:M@<Q?--o!D83T>RQ0ekOG.3N>G+E)./+E(j7FD,5.@WH0qBQRg,
F<GX<Bl7X&B-;8;@<-E3De:+XH=_,+@;0IbDJ:54De4$2GqL4<BOr<1@<3Q4@;06pFDi:8@<Q3)
@<6L.@qf@nARlp-Bln#2@W-@%+AZi_EZe"g@<m-,D'38)A0=W]H=:Z)+CT.u+Eq78+EqC5C`m;"
F^nj%ARlolDIal3@;KLmFCeu*@;]TuE,8s.ARlp$F_t]1Dfp+DD09o6@ps0rBl8!6Ecl51DKKqP
%15g<BjiP`;BR\K1c[*A2`3NM/2An%<+0o#/M&S31c76C1,LaA/2Jn<2_6gE/i5FD2E<WG1,LU>
2E*QP0e=k,1,(7Y@<F+1$;FrFD/X2@=$]b]/MfC<=$]b]/MfC<<];fi+BE2s/70q_1bq'I/MJt9
2_6[</iYjB1,1^?1GUjI1GC@31G1L@1c6sA/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><];fi/66J*/4"<!
@UX-sE,ol9Df]?'4!77+Ci+*++DGm>@;[3%DIdHoASuF/F!,@/D.Oi&Bm+'*+EVNE@3B#j@:Nsn
Bl5%ZEcki"+EqOABHU_+DIIR+Dg*=F@;]V$+EMXFATVEq+EV:*F<G:8FCfK5F`;GD+EV:.+Dbb/
ATMs3DIjr!DIal1De!R.+EV18Ea`Hh+CT))DJ()6BOr;rDdd^//g*`-F!,O;@;KauG9CC3ARTU%
6Xb"L@U`nWDBO.3FCfK6+DkP&AKY]/+CQC3DfBi8@<*K3DJsQ2ASc0sDJ()5E,ThN%15g<Eb9$$
/4`Y]2DI$K/3#=C3&<,2]-'mgBIlG#0fCgA3@cd<2*!3D/iYU;1,LpB2_m?L2)?d</ibmI3&ilK
/1f)Y/5L4u/.Dq\@<--l@Ot&J+?2;>0e>%61H@?L/C(LC:h=8j/M&J)1+kCD/2K+@/ho@?1,:X:
0f:R=0JtUD2_6L2cESosAS3P'$;FrLCLps+85^Qd2`!9A1c79M0eCV]+BE&i/1iD)/2Ah72_6[?
0J54<3&E<J/1i_:/hf"62E!KF/1f)X/66=u/.Dq\@<-F'@k:/K+>to-3%R!K0JkR:cFP,hATB=f
/29%:3&)p<2_[$=2(gR:/2B%;/hf">3&NWG0fL^=1c@?R0J"b+cFPPtATB=2$;FrN@<*ni;BRqW
2)$R90etI@3%W@a+AcW^/4!\q1,:[B0Inq50f(@9/ib^=1Ggd<2`39H2`WEF0J5+90etRB/1`?t
[k(?eB.OK!9jr?V@;K@d/4`'+/Pn#S0e>j]<%Uou1,1=e+B;-E/70r8/28k32_lp=2_cp?2`*NO
0e>.9/hf%>3Ar]F1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6,DQ/0[f,DJ*m(Bjkm%E,ol9Df]?'4!77+
H=:5u@;-iuF!,R<AKX]cDJ*m(Bjkm%DIIBn+D,P4+EV:.+D#G$@;]^hEb/c(7rMjN+C\njEZfFG
@WQL"@qfLq+=L61F*2OH@<,k"Df[%6DdmElDKBN5.3NP@+EV:.+@g?ZBcofTF(KB6+ED%+Bl@l3
De:+dDf03+Ch[</+CT.u+EV:.+DtV)AKYo'+EV:.+D,>.F*&O!Df03+Ch[<q+ELt5ASc0sFCd'K
%15g@@WQ[6@4XrI+>Pc41Ft=;1,Lm?cF"cbASitM/2/t=1H?s@2)%!@1G1@>/28h4/ibmI0JYO;
1,U[=1GLU>2_6L2cF#2nASit-$;G)EEb0PJ85^Qe2E!6?2*!TS1b?qZ+B;-E/1iD-1,1XC.lB7>
1+Y461GUL93&<0H2)[<G1FtCB/hf(:2DI'?/1f)R/6,DQ/.Dq\ASH4,@4XrI+>Gi73@lpD1,(X<
cFY2pEbQXI5qF]I1Gpm;0KD!K/2Jn73@m-G/iPaH1cRBE3A*<J1bgjG/1`?t].?`uBe0]#9kA*L
F_"o385^Qc2Dm0>1GgdF3%W@`+@g![/4!\q0K1[B0e5"51GgX>/hf"20ebL<0JYRB0f:L;0J54A
0JYXG/1`?t[Oap[D(H,'9kA-PE+gdn;BRbP1-$mB1,UpI/C(XG6Z-Bb6");u3&E<H.ks%?1FtF:
1-$m?1GCF90etUC1b:@A/i>IB3&!?D/1f)S/44;b/.Dq\ASu9lCh[cqDCe=V+>PW13%QgE1H$p<
cE\QYF`K$!@4X)i2*!NE1c.'K/28b;0J#1D/iYgG0fM*D1c-gF1cI6I1Ft(.cE\ueF`K#B$;G)L
CLM6785^Qj0ek461bgdD/C(LC6Y1?j/M&J)1+kF@/2T4:2)[HS3&N6D/hf7F2`!BD/1f)O/43uj
/.Dq\ASu9pDKIF#;BRhP3&iHI3&rcN/C(aJ6Y1-d/M&V50K(jA1H%!D/2Ah32CpU<0eP@C0K(XE
/1iY9/i,CG3AicI/1f)V/43ud/.Dq\ASu9t@Ot&J+>GW,3%QdD2DI$>cFtDtATB=R/2/k;3A;s>
2)I6C1G1[I/2]F?2`*6E2)?d>2(ggJ0ebC=/1`?t^+<)lE\%Y,9kA?RCFi"S+>bi62(UU@3AE3=
cE\QmD.+tI/1iD./i,=80fCmA1c@$D0f^dB2D-dF1,LaE/1`?tZ7K!M@4Vip9kA?X@4XrI+>l#4
1FtI?1cREF1H6LDDf6aL/M&J)2(ggG/2At9/i,7A2`WTD1c?s@0fCd@2CpC11H6pPDf709$;G)P
Bk1pdDIG(e;BRnR2)HjE1bg^A/C(LC6ZPID/M&J)1bLL;/2B1D/i,CF0K;!B/Mf=<3A<9H2`!!9
/C(LO6ZPID%15g@Ec5o./4`Y]0ekOD/29(A0K:U=1E]Y*FY#ge/2/k:2DZj=1Gq*B1bLL>/2]=<
2)m<J2)6^<1G1[E3&<BN/1`>-1FuL6FY!t/9kABSEcbu/D(J4U+>ku6/3#UF1+^_W0d&c&Be2P$
0JPF@2(LCA0fU^@/iPX=1,pmB3&3?L0J"q=/i#FC3&NHB/1f)Q0e>V2Be0]#9ke$TCgggfA9DrE
85^Qd2E3QF1c7$E3%W@\+@BRX/1iD)/28b82_6[>3%csH3B8cO/1ib?/iPLD1,([=/1f)P/43id
/.Dq\Bl.d0@4XrI+>c&81FtF>1c$s>cE\Q[Eciob/28n:2`E<G3A`HA0eP4=/29.>/ib^A1,^p>
/N#O@2E3ZT2Dcs9/C(OP6ZR<#%15gDDI[?oE\'aZ+>Yi/3%QmA1b^[9c\!?2H!r6U/1iD0/i5F:
0etaA2E3]Q1,CI;/i,==1c%$@/1f,"/4b%p/.Dq\Bl7Ku@<Ha%/4`Y]1c[9E/2f:<3A<#0ZliC`
E\&dn0etUD2CgI;1,LO</i,L=0f_$B3A<-H2E<<E/i,LH1cI*>/1f)R/66J*/.Dq\Bl8$$CLJbb
;BR\R2)6^<2*!HH/C(UF:NC/#6");u2)@!A/MJk53%Qg;1,UUB1G1@80fCpK/1iP.1-%?K3Ai?=
/C(UR:NC/#%15gDEa^Li;BRkW0e>%53&3BCcG(JhATTIh@4X)f0f_$A0JYLG/2f+;2_6aA/iYXF
2DI-A/M\q=2`EWO0J"b+cG(ntATTI4$;G5T@:Nt%85^Qd1H-jB1c.-BcE\QYDIb:M/2/e43B&HE
2)@0B1+k7>/29(91c$pA0f(@:2(gdB0Jt^H/1`?tZ7J:ZA1S/s9keWVD(J4U+?2/6/28q92E385
[ieLYE\'L-0JYL>2_-aC2)Hj?/iP^?1bp[A2`*9D2_6gD/iYjK1c[KG/1f)U/5Tnu/.Dq\Bl[fo
CFi"S+>GQ)2_6[@3&WQDcESKgATB=R/2/k81c$X=3AiQC0ePCF/2].70K:aF0KC[@3A*9L0ekUI
/1`?tYq/^_E\%Y,9keWo@;RPd;BR_M3A`9C0JbI@/C(OD6Z$6_/M&S61,:d?0fLsK/28b;3%R'I
/iGXF3AWZH/MT1:3AiZS0f^d9/C(OP6VUu?%15gDF(&o:85^Qj1bgO91c@6O/C(gL:h=Yu6");u
1GCgH.l9(?0e>+52`WEG2_HmF1b^aG/2T193&NWP1bgO4/C(gX:h=Yu%15gDH=:hF85^Qf0Jt[<
2Dm9L3%W@`+B;-E/4!\q0f(R@3@csD2)[!@/i#461,(C73B/`M1-$mC1bLdD2)@-G/1`?t[ObEQ
@4Vip9lFiYDg#]#DKRL4:G":P=ALM'/70MeE^D<a/70q_0eP4@/2B%9/i>IG1H$p<1,pm@2E<WQ
0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70qqE^D<TDf&p#Bjkm%E,ol9Df]?'4!779Ch.I-ARTJ!+DGm>
FD,5.BPD*mATMr9E+NHn+DG^9;K$D\DJ<N%De:,6BOr;U`.M^@K5tDAR36?bF`);0Bl5&6@;]^h
+EqOABHU`$+CT).BlnK.AKYo'+>Pf21a$XHFE1r6/e&.^Df0Z>DJq(-5uUT32`WEj5uUT32`WEr
+@U<b/70r8/28h20K(I?2D-dE0KCgC/1iY3/iGC;1c.-B1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4FSn
/0[o!DIIBjDJ<Ns+E2@>E,Tf+Cc`b6Df0Z>DJpY3F!,R<AKZ)8@:X(oBl@ltC`m5+F*)PAAKZ).
AKYhuDBO.7@<-E3Bl5&8BOr=GJ=K&E+Ad2uFDp/hSLbml+AcKa@;TFjBjkm%A79@cAKY])+EqL5
@qZun+DkP)+CT.u+Eqa@@;[2u@;]Rd+EVNEFD,5.F)Q2=A0>f&+CoM8D0%<R%15gJEaa-"/6>,9
:b=RZ/6>,9:b=RZ/70MrAS3Q$/70q_1+k:@/2K.A/iGUG2)[0?1GLL:2)RBM2_6^<0f^@J5ufWn
0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?
ARmB1@;TRs/70r)AS3PmATD6o@;[3,Ec5o8F(&lH+AHcp@<Q'%BlbD=BOr<&Df03!F*&OFBm+'.
+EMgLFCf;3Bl5%lATD6o@4hur9lG&d@;%2_5u]F4/M]+583p3,:b=FY/70MfAS`o)/70q_1+k@<
/2Jt</ho+;3&ETG0fCXC2DR!G0J"t50f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qrAS`no@;KLrFD5W,@;[3,
Ec5o8F(&lH+AHcpBjkZtBlbD*DBNA*@qfLlF<GI0D.Oi%DfQtBBOr<'Dfor>@;0U%GA2/4Bl5&8
BOr;^Ch+YUBlnVCDe:+aATDp7@;KLl/e&.^DffZ$Ci!Nn/4`Y]2)I-@3&`iU/C(LC<,u\(/M&S1
2)?s;1-%-J/2Jn81+Y1?/i#@>1c6s<1-$sE2`NcP2CpC1cESp"EbR'6$;GG]BQ&$2/4`/O1GCdG
2CpU=1c[9A?Q_dXBe3UB?S",g3AE'D1+kFC1c-sD/1iV6/i,CF3&EEB1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/4FSn/0[E'EbfB,@3A$JF)N1?Ec5o8F(&lH+AHcsBQ&$2/0JA;F)N12@;KakA0=okCij).
:2aieALns<F!,R<AKYetEbAs)F<GU<G%G\:Bl5%[F`M83DIFYW@<6?0@;]TuE,8s.F!+n/+DG\3
DfTr.DKI"ADeru-Bl5&8BOr<&Bm+'/+E(j7FD,5.E+Ns,Ch4`'DBO%7AKYE%ARTX&BlkJ:@<6L$
F!,R<Ec6)5BJ(J<$;GJRDJ*l==$]b]/N5C8=$]b]/N5C8?Q_^IF=^cM?S!oc/iPI81-$sB2D[-H
0J"n12`3QS2)Qp?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<
A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1?j<+0Zj@;]dfDBNn=DfBW9@;J"J9lOfa
B5\o,F!+m6AmoOpF`S[IEb/f)FD,*)+D5_5GB4m@DBO"=F`_;.Ec*"!@;^C"DJ<N%@;]TuE,ol-
F^o!(+D###DL!@KDf9//F`V,)+D,P4+Dl7BBk(Rf+DG_7FE2M@ASuU2+CT.u+CfP7BlA&F%15gP
Ch[j%ASH$585^Qc2DmEE1GgdB2([%Z+@Ak3/1iD)/2St60e>%52(gmF3AiZN/1iS6/iGLA1,q0C
/1f)Q/43-?/.Dq\F`;#7Bk/bc;BRhP1Gp^A2`WWP/C(^I6>pcn6")<!1Gq!J.ks"=1b:C72E36C
0K:[C2_d$F0e>%=/i,LH2_d6B/1f)U/4+8n/.Dq\F`V&,A77#[;BRbO1,CI<0fLdC/C)!Q<D?mQ
5qF]L1GCU82D?sD/2Jn72(UI;2_HsG2DHsH/2f172_d9H2_ZdKCi*TnATMr90f:[C/1f)]/6,DQ
/0[DhH"D"=-o!V61FXFj,&(p;DIIU)/0JD1EaiHtBlbD6F`V&,A77)7+s8H[@<?U3Bju4,ARlp*
D]g5J6=FnD@<-'jDK@!G+q4lRF`V8,@4XrI+?2&20J"q41GppH/29+,6tL0c/M&Y22)mEC0ebI=
/2]%:3%Qj?1bL[?3&!3L/28h23&<QM3&W<C0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(F?ARoLsBl@l?0fU^PAS`nk@<?4$+D,P4+=D#KF(o,3+=M>F
AKYE!@qfLlF<F(oAS#X"D09o6@qf@h+@1$^Df-qD+Dbb(AKZ2*F!,O4G%G2,@<<W5ARQ]jGp$X9
CiF'%DK?pKA7]RrBPD@,F"&5?AoqU)+CTA6Ea`I"Bl7Q+FD,6"EZee4FCf?3Bl@l3@X0)8CghU'
DJ()*BlbD4Bln#sEa^C+$;GYaE+Nj!ASH!483p3,:b=F_/4`'+/Pn#S3@nM[:h=Yu?S!ld0etU:
2)-pH/28k33&rNG1G1C<0ekR?/2].72`E]T2E*0B0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:h=Yu,",jW
Bldr1E,ol9Df]?'4!77?F)Y],BOtmp+DGm>FD,5.:2b/oAKYi8FD,T/DeEco@;I',ARTCl+E(j7
Anc9s/g+,,AKYT!EcZ=FB5_=%+E_a:A0>u-AKZ&5@<-.)+E(j79m(MrASc$kBl+u7D]iY1Ebuq@
BOr<-F`&`QD/X?1/0JnJ@;]XuF"AGBDIal2FCB32/g:`39uEZFDeO8E=$]b]/N,.]5uUT32Cr2X
6#gof/70r8/28n40fCR=1cR*B2)d9H2_6O91+kID1H@?O/2An63?UmZ<A?0]+AQ?^AOUi^=)W+q
A90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_
E\&D&Df'3+Bk(Rh+AuciF^f0$@j#`2DfBW9@;J"J9uEZFDeO89FD,5.B5_<'De:,&Ec6)5BQPA2
F!,R<AKYr4DffQ#FDl1BDe:,6BOr;bF`&=1DIal(F!,%3B6%F(ARlolF<G!7BPD*mATAo4Df]W7
Bl@l3Df-\>BOr<-FCAuoB5M@)AKZ).@;[2SDeX)tH"Ce7Bl5&8BOr;TC`lPsASuU$+Cei'ALnsJ
BOu3q+EV:.+B*E#+DkP&ATJu.FE8RK@<iu+Dg-(AAThX*Gp"js+@KdNASkmfE\8OF$;JFHDI[?2
844RT1GCU?1+Y@>1G_$B?Q`B`E\(QK0f1^G2(^L90fLXC/hf+51,:R:3&ifP2DHa70J5+?0f1gG
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S#5lE\(.5Ble><E,ol9Df]?'4!788[VfSg+DGm>Df0,/De:,6
BOr<*Ec5f/DIm^-+E1n#CNCV:Afu2/AKX<NEc,H0AKX9TE-!.9DBMl%BlnZ4Ebo0%A1e;u:17gR
/4`Y]1H%!I/2T1D1c?o1^*#d\@k9ns0KCgI1b1=:0Jb7;/iPI80f(a@1G_$M1,:C91+k7;2)I-J
/1`?t^+;Wh@k8&r:17sMA8*Sr5uUT32DQgb5uUT32DQgj+@L-g/70r8/28h20et:>2_Hg@3B9#T
/1ib9/ibmN1c-p<1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4=Ds/0\#2F`_:>6"Y.O@ps6tE,ol9Df]?'
4!7:,Ch7-k+Dk[uDK?qAFCB24Bl5&8BOr;bATMd3BQ#FE;e8pLG@>At+CT.u+B)iJARoKtCgh3o
F^\ooF!+n/A0>T-+EVmJBk(RfCj@.9Bm+'*+CT=6@3BGrD.Oi3D]i\,Eboe>Bl5&8BOr<"DfB81
FD,*)+EV:.Gp%<FCht5'EbTE(+Dbb)BQPdJC2\A?@;]TuE+NHfAKZ)5+EV:.BlY>+Df'?6DJ=3,
ATKIJ%15j=Df[I#;BRbM2Dm$A3A`KO/C([H:j$_./M&J)1+k=:/28n6/iYjL0JbF7/Mo.60JG:;
1cR$;/C([T:j$_.%15j=F(f9.@4XrI+?2,83%Qd<2E<`S/C(RE6Xapb5qFT=1G1RG/2K%=/hf%9
2`!<B/MT.92E!<H0K:U7/C(RQ6Xapb%15j=FCB6(@4Xr;+?2573A<!@3&39I/70N#AS`J??S!lk
2)$^91c[BO/3#7>1b:@<2_HsB0JkI?/1i\=/iPdE1,_$A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/66=u
/6ZJ!@VK7g+E2@>E,Tf+Cc`b7@<>q!BON$#ARTIt+EV:*DJLA?Dfm1:DBNe)DL!@@@;]_#@:s.m
+E(j7>%)8WBjiV'$;P/JCLM6785^Qf2D?m;2`!<K2([%Y+@:!b/1iD)/2Jn83@lp@2(g^F2Dm3C
/2T%51H@-H2E*0</C(OP6>pcn%15jAD.7X//4`Y]1c@0A2`<?K/2].)6#L3a/M&J)1G1OF/2B%7
1c[NM2)Hj@3%d*E3&33F/9PiGDJs`:/1`Y5/4"/a/4+8cAKWBU3&!'9%15jADK0f1/4`/O2Dd3H
/2]+=1b;uV:hXDk?S#P82_I$E/29%80fCsG3AW3<1H@'E3&iZJ3%Qg=0f^@J5ufWn0Ha,!D.Q.\
Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs
/70r)BOr_`@s)3jDfTQ#DBNn=DfBW9@;J"J:1\<_F_)\4ARTIt+EV:.+B*E#+DG^9FD,5.Cgh3o
F^\oo+EML?CLqB+@X0)<BOr;XDIdHoASuF/F!+OmDfT9(BcqM<BjtXp+E(j7FD,5.6#C%VDf-\<
AS5^qDK?q=AfsNPF^\g!EX`@NATDs.@4Xr;+>c):2`*'A1-%'I/70McF`K$!/2/t>0f:I<0JtU:
3%cp>/28h6/iYdK0f:[:1b^OA2E*QP2_6^<0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-
GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoF`K#W6=jtGBjkm%
E,ol9Df]?'4!7:0Ecu/*/0JA3@;p="A0>K)Df$UlATDs.Be1BN@<3Q"+E2@>D/!m!DKI!fASc!n
@;[2TAScI&@j#l6BjtX++q4lSBkUpk/4`Y]0fUpK/2B(@0K(K-Z62hPE%F:+0JtUF1+b781c?m?
/iYR:3&3*?2DI!E2CpF80J5:A3A`QI/1`?tZ7J[\E%DG*:2+KPGA2=R844RT1H%'E3%R!F3ArTC
?Q_[RD_,6H?S",g3&iHE1-$sG2`3NP0J#%8/iPRB1,(U;1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)
F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/4+8n
/43i`@:X(\DBNn=DfBW9@;J"J:2+KPGA2=FBlbD=BOr<1DfTA2AoD]4D/XN0ATAo-DBO%7AKXQ^
A8,[fDJsZ=+@C0\AKYetDJ+*#B4W3(AfsHLDII'a/e&._Df]?3@4Xr;+>c&52Dm$A0fV0N/70Mr
F`8m=/70qf/hf.60eb:60JGF?3ArE?1cR*F1bh!J2CpU;0f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F`8lU
6#pULDKKT1Bjkm%E,ol9Df]?'4!7::F('<%+Dk[uDK?qAE,oZ1B-:o++EV:.+AHcoDeX;9Cgh3o
F^\oo/g+,,AKZ28Eb$;&Df'',+D,Y4D'370@rH3nBl7@$Bl@l3De:,0Df]?#F_,&6+EqL5@q[!%
ARTIt+ED%2ATo[J@;]Tu_m*WYG[W-GGA(]#BHV/'@;^-/H"CE)/g:`3:3CGiBe2eQ+?)#10e>=?
3&NQEc\!?=B6#Oh@4X,m2)R0A1,^jH/2Ah32(ULB1G1XA2D[6F/1iV8/i#FF2_m3@/1f,"/5p2%
/.Dq]F`Uu,@;[Ve;BRhU1cHsE2)[HP/C(OD6ZPLE5qF`J1,h0C1-%$H/2Jn:2CpU>0ePID2_m*B
/2B4<0ebIC3B8WA/C(OP6ZPLE%15jQF(eup@;@Db6m+3C0f:j?0f(OE1+ZcT6Xb$e?S#P83%cpE
/2T+71c%!F2DHaA0ePCB1GUa@/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW
@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"QQF"AM$D.Ra%@ps6tE,ol9
Df]?'4!7:@F(eup@;@!"F!+m6Eb/ltDf0!"+ED1>ATAo2ARTU%6tpIODJ*WkD(HeqCghC#@4WOF
BPCsi+DGm>AmoOpF`S[;DfQt7FE8RKBl%<&F(&m%Df-\>BOQ!*F*2PG@;0U%Ci<flC`l;eA8,[f
DJsZ=+Cf>,D09`1FD5<-/g:`3:3g8bBk;05=$]b]/MT+6/70MeASs&+/28q<2)d*C1,1I60eb4?
0e>(63%d3H2`WcT/1iY5/ho4D2DI'?1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/43ud/4k#'Ed8cpDdd^/
+E2@>E,Tf+Cc`b7H!tQ(ASrW2AS,LoF!,RC+EV:.+EM[EEb0*!+CfG'@<?F.+Co%tFEo!IAfsBT
@;[3)H$!_<Ci<s3/e&.__kD-nBe2eC+>u2>3&iHG0K(mL/70N"9joS[/70qf/i#+30etR<2*!EJ
3&W<G0eP:@0K1aA/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S#2O@4Y/lEd))-Bjkm%E,ol9Df]?'4!8BO
@;^-/-ZaB<E[MuDDBO%7AKXphTl"KdCgh3oF^\oo/e&.`B5M'.844RT1c[6F2CpgA3&<NF/KdSq
E\&dn/M&k60fCR<1cI$F1,Ca@3@lsG/i,=C1GLU81,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1
GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/1iDDATB=G:M4NQ+Eq78+CQC'ASH73
+E(j7ASc:)F_,H#ALnsJEbTW0DJ(LC@;]TuB6%QlF<GO9H#m\0@;I'-FE1r1B67f0Bl5&8BOr;R
AScI&@j#W6FD,T/DeEcqF!,C5+A$TbCgh3l+CT.u+B)cgFDPB'A1Sj3DIal,@<iu)AKZ#)CghEs
A0>u4+EV:.+@fjVCi:n'Df&p#+Co%tFEnuQ,#;igBlA&:+tb&K$;YGG@Ot&J+?)&32(UaD2`*HE
cF+i]EGR0l/29.=2)Hg<1Gpp=1+kRI/2B1C/i,@?2)@$>0f(FA2D[0K2_6L2cF,8iEGR08$;b/F
CLM@!@;KL+85^Qg0fCm?3&*0H2D!1-+B)cg/3tgA2D[3N/M]:?1Ft:63&3$?1cR*J2_[-G2_6O9
3%cs@2D?jE/4a2n@;0F'Bjkm1/C/u#;e'_s,!g?'BOPIgALnrp`JnZPX"E=]R!!4R+CT.u+AcK\
CLM@!@;KKt@<,p%A8bt#D.RU,ARlolF!,R<Eb/f)F*(i2F!,17+CQC/Bl7K5+EDUBDJ=!$+D,Y4
D'3_7Ecbt;FDi:CDfp/8/g+,;D]it1+EV:.+Dl%<F<GU8Ch[<eCh4`1Dfp)1ATQj]PYGS,Gp#q+
CN\WeQt[[ODIakfF^fV=8oJB\F)PsUJ<XM]FD)e2A7]Y#BkDW58B$R(`N(TMJ=(Iq@3B!"+@0me
@<,q#+=PO?+B)cg.4cTcBPCsi+DkP&ATJt[FY.98ASbp#6#:FQH!te;.*mMg;e'_p+CT.u+AcK\
CLM@!@;KKtc\*E>@rEtD%15p?Ecl58AT',$5uUT31GUL4?Q`0d@k:t<?S!od/i>I:1G1[G0fD$P
/28b40JG=?0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)
F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F(6aF;e^,^@;p.*ARTI!E,ol9Df]?'4!7@.
Ecl58AT&]*F!+m69OW$WDBO%4Ebuq2DfQt:BlnH5AKYf'Df.*KF*VV3Des-/Bl7Q+;e^,^@;p.*
ALDOAF*)GFB4l$l+D,P4+DG_(AT23uA7]XgAM,/9$;b;B@rGjm/4`Y]2`E`N/28h42`3<@cESKg
@<O1f@4X/f1,UsA2)[9J/28b;1b:F:2D-g@0f^pE/1i_;/iPRD0KCg<7;caSBldr=/C(LO:gnMu
8T&]_DKKH#+D,P4+B3#c+@0^^+@0g\@;]L`+E(j7FD,5.8514%@<H[+@ps0r6#:CHDII#t:M+3Q
@q?)V:h=`h@4YJG;c#&*0J"b^+@1!`/70q`0JP=A/MJq63@lm>/iYgA1GCU;0fCsH2_lp91+k:<
1bpg?/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"K_Cb/1sEb&TrBjkm%E,ol9Df]?'4!7@2FE1e4BlbD*
+D>J1FDl26@ps0r@;]Tu@<,jk@:a@nDeEco@;I&rBlnVCBl5&7Dfp/8ATDZ28oJ`\@;[2rDIaku
+B;0*;aX>'=)W+qA0=ESEbTW(B4W3,Blmo=%15pF@:OC185^Qb3Ai]G1,_$H1b?qW+@C'`/1iD,
2)@6N/Mf4;1b:C72Dm$F1bLdC1,:^D/1iY7/hf4@0ek@5/1f)O/44>l/.Dq_BOt[a@4XrI+>br5
1b:LD0JG44cEeWn9joS=@4X,f2)@3B2)@'E/2Ah70e>%<3%d$F2`<TT/2]492E<TQ2)m-</C(RQ
<D?mQ%15pFATDQpA1U8L+>l)62(U[D0KD'CcEeWn9kc.1/1iD//het11,CU:0fUpC2)$R?0ePFA
1b^XC/1`?tZRf*NBe0]#:hXcYDJ<Tp@4Xr;+>Gl31,^p>3B9#Q0e??[2_[$16#g]l?S!rd0f1R9
0JG@>/2o1?3@ls?1G1LE3AWNN/1iP.3&WZS3&)s>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-I
E-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"C?H2_[$=6#g]l
9P%[ADImm#+E2@>E,Tf+Cc`b9BQ%I"Bk(jc+Eq78+CT.1@;]RhASuT4FD,*!@<6L.@rc""Bk&8q
Bm+3,Bld^)Bl@l3De:,6BOr;\ARoLsATDg"DIm6o+EV:*F<GLBBkM-t@<?'k+D,Y4D'3q6AKYE%
ARQ^"Aftr/A7]e!/S&:8+A??U@;^"$/e&.aBjl.+Df[I#;BRbN2E36E0K;$H/C(jM6Z-Bb/M&J)
2(gmE/28n;/ho.<3A<0=1,LU;1,:X?0e=k,cFYVpDIY4,$;bGS@rHX$/4`/O0fCjH0Jk=?3&E?H
/70MuB6#P1/70qg/iGU=1,gm>2`E]U3&iH@1,pmD2D@$H2(UL:0f^@J5ufWn0Ha,!D.Q.\Dc^jt
Ch.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r,
B6#OjBPD9o@;[3,Ec5o8F(&lH+Acci@rHX$+DGm>@3B/nD..6l+Eq79ATAo7E+s?,F<G19Df$V<
Dfp/8ATDZ26YL1MARTI!D0^5:Des?)Gp%<ED]ib8+ELt*A0>u4+C]A*DJ()&Ec6/>ARlp)@;0Or
EcW@FD]j.8AKX?KCh7a!BOr<-D]j.8@<<W6BOuH3@ps6tCh\'(+DG^9FD,5.@:jUmEboH%AM+E!
:hal_EbTB!/4`Y]2DR-F/3#CB1c6i0]J:U.@rEna/29%?1,CL<3&!'<1G1OC/2B(=/hf7@3AWZH
/Mf@=0JPLD1Gp^_@;'@sBjkm1/C(m`/5p%s/0[Z'+B2c_Bln&?+CQC7Ea`KmFD5Z2@;I'-FDl2F
+DGm>FDku++E(j7@3B$"DffZ(EZee.A0>r-F*(u6/0Jh=D.R6#:hal_EbQY)DIakfAS?3p/0K.M
D]iY.AS!!+BOtmu+E1b0ASuU2+DG_8D]j.8AKZ&0Gp$O5A0>>m@rH3q+EMX5EcWiU<+oiWEZf=0
Eb0-1F!+t$Cht59BOu$':hal_EbQY5@3Bc-Bl%?'@q]:lBl7Q+FD,6&+DG_8D]j.8AKZ&0Grd'b
@3?a<GA2/4/0JA=A0N3?BlbD>F(Jl)@:jUmEZf7.D.Rc2FDi:=ARTI!+sLT?+CT(=+sJ.$DBNk8
AKYDk@rHL-F=\PVBOr;rBPD9nEb0,2@V'%fD.OhgBOQ%"@3AurA0=QWF('0(+DG^9FD,5.FD5\:
De:,6BOr<.@;0O#De:+j@rHC,Bl>OF@;]TuBl5&%DJsW1ATAo8BOuH3@V'%fD.OhaFi(F,@;]Tu
9m+=`+B)cgEc>`,/mDh"FCB9*Df-\8AS#C`A6g<+8T#YZ+EM76Bl%3u+Eh=:F(oQ1+E(j7FD,5.
F*)>@Gp%3ICh+Z&DBO%7AKX?YDegIeF)59&A90:EFD,62+C\nlDf'&.:MjZU@D]Pt@;]Tu:MjZU
@D];m;e'`dE+s#8/g:`3:haleCij\K<,tE+/Meq/<\ZEe1a#>#E\(QK?S!oe/i,F;1,_*E0JYXD
1c-a>2_HsE2DI-L/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eE
Ebo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-D.Rc><\ZEe1b;1/E\&D.Bk:dfFCf?2FCf0(+E2@>
E,Tf+Cc`b2DBO%7AKYf-@ps0rA8,IgARfg)De:+kEbT*+AStsgEb?pG:haleCij\?BlbD*+C]A*
B4uB0@;]TuG%l#3@VfTu@Wcd7ATDC!Gq:(HCi"6)Bl7Q+FDi:DBOr<*Ec5o.Ecc#,F!,C5+CQC6
FCB2B+q4lUCh7=!DIk@i;BR\K3%um<2`NZL/2B1-<+0o#6");u1Gh*I.l&q83%Qp>0JtC=2_HjG
2E*EO/2B%70f(^H0eb.0/2B19<+0o#%15pMATD4&@4Xr;+>P],1,q3D0ekR?3&E0n+B3Jn/70r8
/2o1@1+Y4=1+kOB1cI6H/1i_=/i#+@2`!0>1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/6$b%/44>oCEQ2i
Cgh3lF!,FBDfBW9@;J"J:iBoc@<Q'%BlbD=BOr<1DfTA2Bl5&8BOr;RDf9D68TS]VDIdf29jqs\
Bcq5#DJ+*#B4W2tDfQt/+DbJ,B4W3&H#n(A@ps0r@VfI_CERS-@<-0,De:,7FED)7+C\njF`_mO
@;]TuE+O'%ARfgrDf.0:$;bYW@<-('/4`Y]1bpm=0ekUF2_<7Z+B;-M/4!\q0JYF=3%HsK0fCR;
/ibjA1H-pH2)I0K0e>:E/i#=A0ebU=/1f)O/6,DY/.Dq_Derj&BlbC_F`VYF@;KY!/4`Y]2_m-J
/28h81H7-@c\!?9@rs7R/1iD1/i5F:1GLg@0f_*G2Dcs:3&iNN2)[9O3@l^4c\!cE@rs72$;bYW
Blbgr;BRkW0et:>3AWKH/C(mN;eL,%6")<!3&*3K/M]%71b:F83&E0A2`!'C1b^mJ0J"e20eP.;
3&i]L/1`?t]IZuoE\%Y,:iC/dFa,H.;BR_T3A<!?2`NQN/C(OD7qHNg/M&S71c7'>1,psC/28b3
2CpR;2D-d@3&riU/2B1;0JYO@3B8WA/C(OP7qHNg%15pMEcPl2@4XrI+>c&52(UX?3A`HAcEeWo
BlYaj/28n:0fL[<0et[=1+kLB/29.=/i5:?0fUm=/MSk71c[?N1Ft(.cEf'&BlYa6$;bbOARfFn
F^Zgl;BReO1cHsC1GU^G/2T7-9MK4P/M&J)1G1UH/29%=/i,7A3AWTF1Gg^>0f1jK1+Xt-1c?mY
9kc-f$;bbWD.+PXH!t6+D(J4U+>GZ/2CpU;1,(R:cEeWm@<F+e/2/n83B/ND2)@3C1G1RC/2f=;
3A`]O1c[*A2(gdB2`<KK/1`?tZRf'aFY!t/:i^JaH#IRO85^Qc3A`NC1H.'J3@rI\+@Ak;/3tg@
2`!HM.kih81b:=51b^I80f1LB1,UmK1FtC91,:[H3AW3;/C(LO6VV8G%15pPDfBi?/4`Y]1,:RB
/2B4D2)Qr1[ie1PD(It(0K(XB3@cj?1GC@9/i,453AW9H0f_'E2(UL</i>=@2`W]G/1f)U/4X8g
/.Dq_Ec62:D.+PSASuTuF`M1I7nOm]2)-XP8g#uK0eCVT+@B^X/41sC1c%-M/N,:?0J"q5/hf"2
1,1^?1bq$N2)?d82DQmC2`W]S1b:1/cESofASs%.$;t;M/4`Y]0ebRD/29%?1H-l1[3.nYBe1he
0JbL?3@upF1,ga?/iPR;2)?j?1GUjJ2_6O@/i5FF1,V'C1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC
3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C(XS7<3)n,#Vie+DGm>FD,5.
:2b/oAKYW(A7T7mF!,C5+EV:.+EM+&/0K.MD]j+CBl\8;F`8IFBOr<1@<Q4'+CT.u+Cei!FEMV8
F!,O4Bl%^.F!,[@FD)e1ATAo2ATTOK%16!ADIG(e;BR\K1H$d=2`!BP/C(UF7<3)n/M&J)1G1O@
/2]:;3&*0B3&W<>3A*6K1G_$H/1`?tZn+XdBe0]#;IONUFDi^$6m+3A1H@<H/3#FC1cHsm+B)cg
/70r8/2o1;3@lpC2D-^>3&WNP/1i\7/i,1A2`EEA1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!H
FDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p%s/59Ph
@:s"iGp%'HDfBW9@;J"J;IONUFDi:9F!+m6B5(dlF<G(6ART\'Eb-A*Ec5e;9jqjHB45k,+EV%.
ATKI5$;t;R@;K@n/4`Y]1H@-H/2T=C2)Qr1]HBmZD_*Ik/M&\13&iHD1cR*B3A<HI1Ft:>/het;
3AiTD/1f)Z/50Vn/.Dqa@<5jnB4Z0uBe2eQ+>u&12CpgE1Ggs?cET)H87cfm6")<!2_d-I.krk9
1Ft=71H-j?2)m3H2DI3H0J"q8/i,LA1G^g</1f)O0e>k,E\%Y,;IOWTChR6iF_**p;BRkT2)[!F
2D?pB/C(LC:N0tu5qF`L1Gh*B0etOA/2Ah33%QgC1G1UB1H%!I/28n42)[-B1Gp^7/C(LO:N0tu
%16!AF*(i"@;[Ve;BRkT1H$dD2)[BI/C(OD6ul]e5qF`L1GCX92)6mG/2Ah:3@lpD1+kI=3&*?K
/2]181GCO>3&rN@/C(OP6ul]e%16!EB6A$5F"Bj[+>Z#;1+Y7B2E!QHcESKcAT'+c/28h43&E-?
0f:pA0eP7?/29";/hf:@3ArWD0ek:@2E*BF3@l^4cESooAT'+/$;tGY@<?3785^Qd2DHa?2`!BD
cF+ilF(6ae/2/e51H-g<2`!<B2(gX=/29+:1c$mH2DcsD/i>RF1Gq!?/1f)T/5UCt/.DqaBkM!n
/4`Y]0fLgC/2B%=1H$f0Z62q`Be2P$0JtRA2(^LA0et:6/ho=:2`NEJ1GgpH2_6O?/i#+82D[<D
/1f)P/5L;#/.DqaBkM-r+A69`FCB<4F`T*);BRhR2*!3H0fD!I/C(LC6Y1-d5qF`I1H@?F2D@!B
/1iP.0JP+60f^jH0JY=?2CpF<0J5=@1H@BO/1`?tYq/7RDCc5(;K$VbCh[<gARf.iFE2:N844RT
1c[9I1FtL?0JYC7?Q`-`BImLA?S",g3&rNF1cR*C0et[B1+Y150K:mK1,pg?0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL:N0tu,#`GhDJ=0*+E2@>E,Tf+Cc`b;Df]?'Bji,pAKX?KF*)G@+Eq78+CQC6BkM<t
Anba`DKI"5BkMR/AKYo'+@fjVBk(jcDBNG3Cijf?AKYE!A0>i3Df'3+ASuT4;fH/_Bldr1GB.D>
ATB=EGA(o9AKYr+Df0,tFD5W*+EqaECERP-FCf>4Eb/ioEb0,uARlp*BOr<(BkM+$+CT.u+Ceu!
ATMs-@;I')@VTIaFE9&Y%16!OFCB&uFt?0^+?)8>1+Y.60fM!N/C(OD6tL0c5qFcF1H.0A0f1[E
/2Jn:1b:F:3A**I2_m0H/28t62*!NK0f:M&AThX*F(Jl)9OW$WDCdM%0f1"L@;KLqD/UOqFCB24
6Xb(FCi<s/ALu-4/4=&c/0[2!<b6/WFDl1BEb0E*EcYf&+=L!!@q0FnD]hDU@q04]FDl22+?goC
Bk)'t@<HW6<b6/WFDl1N+ED%7E,TW8Bjtmi+D,P4+>Gi11a$j]@<*K#@<>poDeF3(.3]3.;KZJ_
@UWq$85^Qe0Jb7<2E3TGcEn]]@<3tc@4X)e1,V$A2D?jB/2Ah92CpU</i5FA3Ar]F2D?a=1GppI
1b:1/cEo,i@<3t/$;u"^@UX@085^Qh1Gh'B3AiTL2_<7Z+B)on/1iD)/2Jn=2CpUD0J5@E0f:mD
/1i\4/iGFA3A`E@/1f)O/5p2%/.Dqb@:Eqd/4`Y]2D[9O/3#I?0et<*[ieIcBIlG#0fLg@1bCF>
1c-a=/i5@81,V!C2*!KN1-$m;0f:RB1,M!F2_6L2cF5?#E+gd3$<(ACCghEsDJ:Xm;BR\P0et:8
1GgsF/C([H6$73!5qF]I0JYL91bg[A/2Jn:3@m*H/iGFE2)?s<1bgU:2`3QN3@mj4FD5VD/C([T
6$73!%16$BA78t]@VK7%85^Qi2).'A0ek@<3AiA5ZQMPRE\'Lb/2At90fL[<0etO91G1XF/2K(>
/i5:>0K(a=/MSk63&`WL1b:1/cEf&fEH3T>$<(AD@;KC]EbR'q;BRqW3&E0@0et[E3%W@f+AcW^
/1iD)/2Jn90e>+;1+kF<0K:aH/2B%72D?jC2`E9=/C(mZ:h=8j%16$BA79:kASc'r/4`Y]3&E?H
/28h=0K1g>cESKXEH3Tr/2At72)m0A0JPR=1+kRE/2K(:/i5CB3B/fG/MJe50f_3M3@l^4cESod
EH3T>$<(AD@;L"-F_!$o;BRqS1GUL90K([F3%W@\+@1!f/3tgB0f(OB/MK%<1b:C73A<!?1,:IA
3&roP2(U=:/i>RB0fM!A/1f)P/4"8r/.Dqb@:XC085^Qh2`WcI0eb:<2)?f/ZQMV\B.Q>"1,(I=
1+P180f:L;/i#461GC[=2)R<H3AE'A0J5+<2E!KS/1`?tZReIhB.OK!;dj<IEc#6,BONG_6m+3<
0K1pL/2]=C2_lpk+A??b/70r8/3#7=1+Y.=1G1[G1c@9Q/1i\22`3HN3Ai?C0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL9P&,n:1\BQCh7[!+E2@>E,Tf+Cc`b<@:s"hD..O"@3B9*+EV:.+AQKe@;KX#DIIBn
+D,P4+EV:.+D>J%BOu7,+E1n#CER>/+EV:.+EqaECh+Y:@;L"'+DYk5GA\O3F!+1qF`):D7<W6_
ATMrB+CT.u+EMgF@W-'*De:,0@<?4%DII?(E,oZ'AKYo'+AQKe@;IP*$<(AIE+gdn;BR_K0Jk=9
2`!?M/C(gL:NC/#/M&J)1+k7>/3#O?3AWZM1,(723A*3J3ArQK/1`?t\h$WtBe1H-Ea`KmFD5Z2
@;I'(@;TQuAo_g,+@1$V@VK=5+P=$TN7ib)fVdDUfW<`(fVdB,+ELt:AftMu/S\^'@`3h</0JbC
FCfK$Ci"A>-Z`^1AfrKLF*DPCA1&fKDe:,6BOr<!Bjkn$-S?SP$<(ALD(J4U+?2>?0J"q52)7$C
/C/tl:h=8j/M&J)1bLXF/2K.;/ho4D1Ggg;1,COA1b^^A2CpC1c\*iGAS3P'$<(ANF*2A//4`'+
/Pn#T1b;0`<%Uou1GgXi+B)oa/70q`0JP=A.ks";2CpR:/i,451GCU;0f_*I2DHa;3%cp>1cR9I
/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC
0/>493FQlGEc6,4A1_\-D.Rc>?S#,gALpPaCij60AKYr4DfBW9@;J"J;djQbF`(V1BlbD=BOr<(
@;TQuDe:,6BOr<'H$!_<Ci<s#@ps0rB5(dlF<G19Df$V=Ea`KmFD5Z2@;I&\@;L$sF(HJ+Des23
FCAusF!,R<@<<W%@<-C&ARlp*BOr<-FDl&.F!,C5+EV:.+@g?rD]in.B45UjFD,Au+EV13E,9*,
+E)-?BOu3,BOtU_/e&.d@<-!hF"Bj[+>u)71FtLD1,:g?cF=uq@rEna/29(>2`!$B1GCL60ePFD
/2B+?/i,7C2_d$</Mo483B9#X1,LO5/C(aV;e'_s%16$BEbTDB85^Qg1bg[83&EEM3@rI_+@p'a
/4!\q0fLgE0Inn82)$R;/ho+41,V$D2`3NS2DZm>1bLaD3AN9F/4"Ao@<3PYDe3a!/1f)R/4a>m
/.Dqb@qBV$Ecl4M85^Qb1cR3@1,1XH1b:L?+@U<b/3tg@1c%*H/MT(:3%Qm=0JY1;3A*0G2)-dA
/1iS5/i,1<0JPL;9OW$WDCd=r1Ftt8Be3k:Df$V=BOr<)@WQI(ATVK+@rH7+FCf9)@<?4%DBNk0
+B)c]E--,CD'2/c@;]UeDIRa/B5(juD%-hN@q]F^F=]s\+?2;=2(UI:1H7?K/C(OD:h=8j/M&Y5
0Jb[=1,psF/2Ah71b:F>2(gmG1Gq*H/2B1;0K:gH3&N6</C(OP:h=8j%16$DBOt^_E\'aZ+>Gc6
/2K">3@rI\+@BRY/1iD,0JkI@.lB4@1+Y151,LO:0J5(82E3KP/2]=<2)@0I1GLF3/C(LO6Xb$e
%16$F@s)["@3A*d@:XLt/4`Y]0f(aE/2An92)Qr1Zli=VFY#ge/2/n91GC=62`!3?1G1UG/2f@<
2`!6K0f^d>2_HsE1,UdC/1`?tZn,0bFY!t/;e9TUDCe=V+>>Z01+YCE3&W>5[3.hFF"Amo/M&\1
1Gp^=3%d'K3&icS/2f::2E*<E0JP+EFDPB,+@C'YChYFOcF#2j@<3t/$<(MKBl8'7/4`Y]2)I*H
/2o:;2`3/3ZQMSQD_+1_/28t;1,1:83&*BD1G1@</2Aq>/hf"?1c@6C1H7!C0K:gF0e=k,cEf&g
Df709$<(VHD(J4U+?),93@m0K2`3NFcESKjB4WVG/29.A0JP(43&!'<1bLRE/2B4C/hf%;0f(U:
0fUd>0f(dL0e=k,cESp!B4WV'$<(VHD.+td6m+KM0ebU=2)R9M1b;uV9P&,n?S#P83A*$?/29(<
/hf4>1GUp@/MSk81-%$I1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%AT'+D:gn-RF*(i.BcqA8DfBW9
@;J"J;eTTV@3B9*+CT.1<H;Vm+Dbb6ATD4"Gp%3?Ebuq9ARTIjDJ()#+EMC.Cht51@;Ts+DfQt4
Cgh0l/0K"ZD.7F"Bk&9(Afu2/AKYf'B4uB0De:,6BOr<-FCB2B+q4lXBOPpr@;%2_8PgNg3A`NH
/2oRG1GLFf+B)cg/70r8/28k31GgX<1c$a=2`*3J1b:453%d0L2)R'D/2An63?UmZ<A?0]+AQ?^
AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4A1_\-
D.Rc>?S#,cD_*)4DJ=3(A0=0Y@:C?JD/"$!FCfM9E,ol9Df]?'4!7I8@<-*kBHV#1+EV:.+CfP1
FEMV4C`m4rE+sE&C`mY.+B<;nFCeu*6#pCC+@U-]Eaa'$F"AGBDIal"Df0W1A7]dmA0>u-AKYJs
FEo!IAftl,Dg-#/A7oHrA9DH+FDi:9FE8RA@;^?5ARopn@<?4%DII?(@qBP"ATDiC+DG_7FD5i>
FCfME+Dl7BAT_j2/0JbC@WGmtBk;?.@;]TuBOu3uFCAfn+Ceu#FCfK6/g:`3;eTT^Cgekc;BRkT
1,gaD2*!EN/C(jM;e'_s6")<!2`!6J/Mf=>2CpR82DQg=2DZsB0JY@@2_6O:2_Hg=1H7-H/1`?t
].?ljD_)>);eT`YBjkd.85^Qh0ebL:3ANEH0J(MT+A@'$/4!]!/29+A0JP(61GU^:1G1O?/2B1?
/i>@D3B&oK1G^X>2DR0K3%QU3cE\upH#bGF$<(VLEaa&uDCe=V+>l#4/3#XD1G$hW+@1$^/3tg@
0f:dG.l&e83@lp<2Dcs?3%d*I0JG=A/2An33&!<G1GLF3/C(OP6#pZj%16$JCLJbb6m+3D0fLjA
/3,RC2DQgj+B)on/70r8/2o1@1b:CB0J5:>0K1pE/1iY5/ibXH0JtX;1,(FC+A"k!0eb:(:18!N
7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6
ATKD0/5p2%/4XA^DII6fDBNn=DfBW9@;J"JD.R-nF!)iCDerr3+DG^9FD,5.7<`;cCgh3oF^\oo
/e&.dBl[p1F"Bj[+>Pc60e>+91Gh*CcESKZ9joS=/2/t=2)-[;2Dd3@/MSk71b:@80eP4@2_d0I
/1iS7/iPLC0ekR;/1f)O/43-?/.DqbBlnK6@4XrI+?2860J"q50fLg@/C(gL6#gor5qFcH1H.9F
0JkL@/2]%61b:F=3A*-E3A<EL/1i\21,:gC2)[!:/C(gX6#gor%16$L@<=%k;BRqX0KC[=0f(O?
2D!.\+@1!f/3tg=/2Jn62_6aA1G1RD1,UpI/1iS6/iYU?3&3ED/1f)R/4"8r/.DqbDerj&Blbgl
6n9uK/Mo=B3@mKb.krk41c7-N/70MrAS3Q$/70qg/iPa@1GLjA1H@HU2*!3B1bL[G3AWWP/2An6
3?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>49
3FQlGEc6,4A1_\-D.Rc>?S##bB.P6'Des-/BHV87DfBW9@;J"JDIIBnA0>;mFCfJ8;f?J\EbTSG
+CQC1Dg#].+C]U=;flGcBlh7F@<WhfASj%D%16$QBk(R&85^Qf0Jta>2Dm<M1b?qW+BE2s/4!\q
0f(RB1+b480eb.4/ibmB1,(F81-%<L1cHs;0ek:82DI!B3@mj4FD5VE7ri$L@rEqc@:FLuDf08t
DCd?aYq/piE\&D6BOr;[@<?4$+EV18D'3P6+CQC7Ea`j,CghF"Df-\9Afu2/AKXK`AS#X"c\'Ps
cE,?Ic\9\s+EqL5@q[!!F!+m6FE1f-F)59,Bl@l3De:+XCMR?hBjkm%F(f]*F_l/B+BrYrFCfK$
Ci"A>GB.D>FCf>4F(f\J@Wa8FCb9aO1gMXT@;Ka&D.R-nBl7QE+D"u%+E(j7B6%EpDD!+B$<)%X
EcP`/DII$gF=]sK<%Uou2CqBb<%Uou2Cr2X6#L3a?S#P80eb4;1b:F?1bL^G1bpaF/2T+71c@3O
2`!!?0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@
Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6#L3a7!3T]BHV87DfBW9@;J"JDIIBnA0>;mFCfJ8<+ohc
;flGgEd8d&BkM+$+C]U=<bZG]ASuT4G%#827rN$R/e&.dFE2))DfRC"6m+EG3&rrL1c%$K1b;uV
9R1M,?S#P83%cm@/28q:/i5I@2E3]J1G^X;2)[EK1+Y170f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70r%H#>/W
6ZR*RFD50$+E2@>E,Tf+Cc`bW@;TRd+CSl(ATAnlFE2))DeCUDFD,5.B5_<'De:,9Bl7I&+DG^9
;f#lcBk&9&H$!_<Ci<s3/g+)7EbT!$EZf(;+CT)-D]iI2@q]:k@:OCjEZf(6+EV:.+C]8-CEQGo
BuH!B+DH-EA79Y!Bl7K)-pr#n@<?3lDBMneCh7Z1De:+cDf0216"b*b+C]U=8TnN[@3@mWCh^hC
/PTZm^3+I)DJ@%E/g:`3;fuMbDe!L!/4`Y]2`WQM/28h53AicIcESK[AS`n`@4X/f1H@?D0f:gG
/2Jn;2_6a=3A*<G3AiTH/29"73AE9C2`!"*AThX*F(Jl)9OW$WDCdM%0f1"L@;KLqD/UOqFCB24
6Xb(FCi<s/ALu-3/4=&c/0[2!:2+3VCghI-+ED%:ATDj'A0<9qBk(XkCi:F`@:Ne]@<?F.AKX/Z
:2+3VCghI-+BE&k@<?F./0JtEF)Z&8F(o*"AKYT'EZd(r0f1"oFCB24@psIfCi<s/ALSf4$<)(V
Ea^Li;BRbT2)6^>2`39K/C)!Q9P&,n6");u3A`HG.kit@1b:F82)6^;1c6m@3&``P0J#4:3&r`M
0K:U7/C)!]9P&,n%16$VBOPUk/4`Y]1H%$G/2T1C0fCT.]-(-cCb..h0KCgH0J,+;1,^[=/i#46
0f(^?3B9&Z3AW3<1c$a@1GUgI3@l^4cFYW.AS`n,$<)(`@:iqi/4`Y]2_d6N/3,L@3A`;4ZQMqe
E\&dn0fV$M3@cm@1bgO;/i#:81,q*C2`!<O1,pg@1+kIE3AiZQ/1`?tZRedqE\%Y,;gED#@4XrI
+>kr23%QsJ2_Zs;cFG&uBlYaV/1iD0/hf481,1U<0JG:@1,CI52D-[;0Jt[E/1`?t\L^cqE\%Y,
;oF6(@<l94844RU0JtdF3@lm=2E3HK/70MrF$V?a/70qf/i>O<1GUd>2)@*D0fCR71GLL@1H.-M
1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQ
B.l"o0f`Z]E,ol?ARmB1@;TRs/70r)F$V?UEbQXi@;]jhDBNn=DfBW9@;J"J;oF6(@<l9(D.R-n
F!,F5@:NjkBl5&8BOr;bBl7TmCh7[!+DbJ(B6@WqAM+E!<+06MF=]s\+>G`11Ft::1c.3Dc[[eo
:NC/#/M&S41c[NG0K(dJ/2Jn53@m*E/i5I?0JkX<2D.!J0et[F/1`?uJ28`PEbR'6$<1GJCLJbb
5u]F4/Mo.483p3,:b=LX/70Mn@:Liq/70q_0eP7>/2K(>/i>@=3&WWF1c6mB2)d<L2CpU;0f^@J
5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]
E,ol?ARmB1@;TRs/70r%@:Li^Bln$2@;]dfDBNn=DfBW9@;J"J<+0KV@3BDu@;^-/E+NHfAKY])
+EV:.+A?KkBQ[a$Bjkm%Cgh3oF^\oo/e&.e@;1!qDJ+$(DfmU%;BReR0fU^A2`!HS/C0(o<D?mQ
/M&J)1G1RG/29(A/i>@=2)RBF1cI$G2`W]K2CpC1c\F&O9joR^$<1GJH"eg#;BReV0fCR@1GCaG
/3"b?Ea^LN/1iD1/i#460f_$B3&W`V2)-X?2(g^A3&EQN/1`>3/4=Me/.Dqc@;KY"BONG_;BRbQ
2E<<F1bgaE/C(dK<D?mQ6");u3&N]O.l94>1Ft=70et:71Gg^D0JPOI0J#%?/hf+:3&3BC/1f)W
/6,DQ/.Dqc@;]^u@4YJG;c#&$0e?Bl;c#&$0e?ZS:h=8j?S#P80ek:<2(UO?2_HpI1,gsE/29+:
1H@?I2`N?D0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;
@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL:h=8j6?R*W@<-'jDBNn=DfBW9@;J"J<+0ZWEa^))
F!,R<AKZ&:E,oN,AKYJoCh7[0Bjkg#B5_<'FD,*)+D"u%Cj@-iF_k]!EcW@IDfTo4BlIWo/e&.e
@;]df+@1-kFE1f+Blbgr;BReM2E<<G0K:a@/C(mN<D?mQ5qFT=1G1@>/29">/i>UD1,Ua:1bgU>
3B8rO3@l^4cFb].9joR^$<1GOBji,NDfTDtCh[rA85^Qe0JbL92)$gF1+^__+B;-E/3tg=/2Jn8
2(UI>1bLOB1b^pI/2T+73AE?H2)[!:/C(jY<D?mQ%16'CE+NO%ALpA?+>u#72Dm$A3&!0D/70Me
@<*o+/70qf/ho%20ekR=3Ai`M2E36>2)Hp@2Dd-F1b:C90f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<
BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq@<*nc
Des-2Bjkm%E,ol9Df]?'4!7L2E+NO%AKYi$@;^-/ATVL(DII?(E+*j%+DG^97s/6\@;]d%@;]Tu
Eb031ATMF#FE8RHBOr;\Bl%R1+BMus+EV:;Dfo]++EqL5@q[!,BOr;uBl\9:+DG_,@:Eqm@;^1.
+E(j7FD,5.7:C4YBHU`(EbT].A0>;uA0>B#F_kS2Eb0?8Ec*K=$<1GS@<uKq/4`Y]2`3?J/3,XE
2`NA6ZQMPRCb..h0f_'K1Fk161H-j?/iPO:1-%6F2)[9O0f:L:0J57<1GUjD/1`?tZReC^Cb-#&
<+0fZ/4`Y]1GUdI/2T%<1,^]/Z62MP@k9ns0K:dF2(L@@0ek48/i>F90etR<0et^J1H6pG/ho=C
2)I-@/1f)P/44;b/.Dqc@<lKsFC?^k;BR\K1c6g=2`3BG/29.-<+0o#6");u1GgsE.l&q:3%Qm=
1GC@;2D-d>1,(UB/2B%71c@9J2_Zd6/29.9<+0o#%16'GB5M@#ALpAM+>Yc,3%Qm?0fCsAcF,GM
6Z-Bb5qF]L0etL70fLmK/2St;2_6[=1G1@=1GLdA/29(92Dd?P1,1=2/C([Y/44;b/.DqcASPXq
/4`Y]1,:gI/2Jt91c$].]HB^UD(It]/2/t;1GC=71,CX91+kOF/3,R?2`*3C0et:81+kF=1Gq-J
/1`?t]IZQaD(H,'<+U)]@V'@lF_r[#;BRnU3B&KL3&!6K/C0.q;eL,%5qFT=1bL^@/2B4F/ibdL
3&<NF/M]4:1-%?P1GgX6/C0/(;eL,%%16'GG%GJ@83p3,:b=[Y/70McF`K$?/70q_1+k=?/28k5
/ho7D2)[EF1H-p@1b^gF0e>(60f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBn
AU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qoF`K#W8TSo\ASc''E,ol9Df]?'
4!7L6G%GJ4D.R-nF!+J#Bm+'.F(HJ4EZeq:ATE'<BPD?s+CT.u+C\npBl7u7GA2/4+EV:.+DbV2
FCfJ8<+0Ai+EV:.+DbJ-F<GC2FED)7+DG^9FD,5.87c7NATo8*CiF&r@V'X6+q4lYBOtalBl5Im
;BR\N2Dcs?0f(gG/C0#*+@U<b/1iD)/2Jn<0e>4B/iYgL2E!6?/Mf(52)[3G1bgO4/C0#*/4FSn
/.DqcBQ[cmDCe=V+>ko70e>4B2`3KEcESK[Ea^Lb/28t81c-^@1bpj<1G1RE/2Aq7/hf:E1-%'?
2Dd$B2`3QP0e=k,cESogEa^L.$<1_JCM>=j;BRqW1H$d=0etI=1+^_V+@gHp/1iD)/2Ah41+Y4<
0J57A2E3WR/1i\:/iYgI2)dEE/1f)P/4X`'/.DqcBjkmlF^]/=85^Qb3AE3=1,^sH0eCVY+B2cl
/3tg=/2Ah<2_6pF/i5:;0fV0E1,1C91bppF1b:1/cF,9'@<F+1$<1_JDL#qI85^Qe3&WQD2DR*E
1FtI-6ul]e/M&J)2(g^A/29.>/iYjI0KD-E2E!0H3A<6C2(U:02_7@;@4Vip<,$2`E\'aL+>G]4
1bq!@3&!6M2_8;Y:N0tu?S#P82D-sL/2B%@/ho(>1-%6D/MT%61H@HR1H$d>0JPR18O6?20JFVE
@;TREG]-Z%Ebo9-/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29
DIIBnF"CZL:N0tu,!o^UB5D!eATMO!+E2@>E,Tf+Cc`b=Bl.R)+Dk[uDK?q2@<-.$ATMo8Bl5%[
ASu-hChY#.@;]_#@:s.&+CT)&F_#3(B-;;7+EV:.+EMX5EZeh&Bl7Q+Amo^&@<Z.*+DG^9FD,5.
A79LoDImm1+E(j7F)YPtAM,/9$<1_\Ch[uB=$]b]/MT.</6>,9:b=C[0e?ZS:j$_.?S#P80eb4=
2_6[=2D-dA2`NWP/1iS2/i>=:3B/oJ1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%Nn
G:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5UJ./5:&'De!9cDBNn=
DfBW9@;J"J<,$DiBlkJ3F!,R<AKYl!D.Oi.AftM)Cgh*j+DG^9FD,5.6$-pOF!,=<F`);0Bl7u7
De:+dDfTc+@rEtB8TZ(lARTIt+EV:.+C]A*A7ZltDBO%7AKX9U@<uX#BHV,"DJ+*#B4W2oDIal(
F<G:=+CT>4De!KiFCeu*GA2/4+CQC+ARTV$@WHC&ASrW"ART_'BkDL(+D5D/C`mG0+CT.1@;]Rh
ASuT4Ci<flC`mP*B4Ysk/e&.eBlmd-Bl5Im;BReR3%R!G0f(B,Kci[!A1U"t0JP@A3%Hg?1,LO=
/hf::1,LU<3B8lP1+Y7:/i57>1c73C1,(F?+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TRe
G].eEEbo9-/nna:/oPcC0/>492.^<4FD5Z2/C0#$6#L3a<,$G_GA1q;-t-q5D]ih5Dg-(A@<3Pc
ARoLm@3BK#+B2ooDfoK+.3N>G+CQC6ATW$1ASl!rF<G:8+Du+<FD,6+DBMYlEc5GtD]iJ+A0=lI
78lQL+BNK%Ch+YZATDL,@:s-o;e^>b/g*]!F*)>@Bk(RfCj@.;F<Gd9F!+n/+DG\3DfTr.DKI"?
DeX*2+E(j7@rH7,@:OC%@V'Y*AS#a%FE_XG@qg+#Ch\3(FD5Z2F!)l0E+*WuF(c\)DIakUEa`E+
+CT.u+EVgG+Cf>-FD5W(DKKqB-q/9!DfB81@;]Tu6"Y.O@ppf/@:jUmEZfI;AKWsSBHUerDKL#A
GqKO5<,ZMcCb/XR;c#&$1+Xt`+@U<b/70q^1G^aA/M]+=3@lm>/iPL92)6dD0fUjB3@la;1G1XA
3ArfU/2An63?UmZ<A?0]+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:
/oPcC0/>493FQlGEc6,4A1_\-D.Rc>?S"WdBe1H-Dea!&+DGm>FD,5.DIIBn+E(j7Df0,/De:,6
BOr;\@<l:!+Co%tFD5<-+ED%0@<?'k+EVNEEa`["/0K"UDfT]9/0JA=A0>JuEb-jI%16'QCh[`p
DCe=V+>ku60J#.;2E3EBcESKZASs%c/28t;3ArHI0JtO80eP7>/2Aq?/iYjL0KD$B/N,:83&<KN
1,pg9/C(LO6Y1-d%16'QDIIX$F_E<s;BReS0KC[A3&riO/1hu3@;RPI/1iD1/iYO90fUm?1GLXF
3Ai?H2D.!D2)d<K/2An62'>Y&D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`DIIBnAU&-;DfTZ)F"V08
FY7TQB.l"o0f<NQBln'-DCd@j6Xag_<,ZY_FD5l2+Eq78+EV:.+@1<qARciqDe'u/Afu2/AKXoo
DCuA*<,ZeeF_kK,/4`Y]2)-d93&*EQ/C)!Q:ig+t5qF]E1c7*?0KCgI/2St73@lpD/i,=D1c@6C
3A*$D2`ENO/1`?t^FW3&@k8&r<-;nqASs%i5u]F4/Mf:983p3,:b=I]/70Me<c0Hq/70q_1+k=>
/29+D/i#=C1,h*B1c-gF0f:aC1Ft:80f^@J5ufWn0Ha,!D.Q.\Dc^jtCh.T<BQS?8F#ks-GB\6`
DIIBnAU&-;DfTZ)F"V08FY7TQB.l"o0f`Z]E,ol?ARmB1@;TRs/70qq<c0H48TJNdBHV87DfBW9
@;IP=<-;nqASrW7@<3Q5BOr;pF`):DDe:,6BOr<"F`);4Ed(r4EbTH4+@^'`DJgS6@:LEIF_tf#
Bl%T.De:+`EbTT.+DbV%ASu$0+EqL;+Eq78+EVaHDIm?$Bl8$2+CQC+Dfor.+C]U=FD,5.C1Ugi
Dfp+DAmoCoGp$*sBQRcr@;KCd/g:`3<-<.o/4`/O1,CUC3@lmD0KD$B?Q`6XF=^cM?S",g0et:;
1bLdD3Ai]R/1i_7/ibXD3&<NF1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcA
D.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5g&$/0[E$@<uX(Bjkm%E,ol9
Df]?'4!7LFE+pG/F!,R<AKYl!D.Oi.Afu2/AKYi.F*&ODDfBi8Dfp+D8T&'QB4Yt!F`S[%AT)O(
AKYf'G%ki,+E)-?FD,5.ARTY%ATDZ2@rGdsF<GL6+B*3$FD)d_D.Ra%@ppo2@V'.iEb-A8BOr;_
DfTrBB6@d,AKYE%EbT].A0>T(+EV:.+>GcrBHUerDKL#AGqL9M$<2.e_kSbR6m+3<3&*6K/2f1?
1c-aj+@C0l/70q_1,:^H/N,F>0e>483B8WF3&WBG1bq!K3@la?1bLI;1,([I/2An63?UmZ<A?0]
+AQ?^AOUi^=)W+qA90;8FEDJC3\N.1GBYZW@;TReG].eEEbo9-/nna:/oPcC0/>493FQlGEc6,4
A1_\-D.Rc>?S"QbFY$?tEa`U'@<l:!+E2@>E,Tf+Cc`b=F`>6n+DGm>Df0,/De:,(Dfp(CE,oZ1
@qfmuAKYW(A9/l3Afu2/AKXKc@<,doBcoc]F)>i.Df0hCBl5&4DfBi8@<*Je@<,dhF^]Q(DBNP0
Chmj*Eb-A8BOQ!*BOu"!ARlp*BOr<-F`;A4D.Oi&De(!.O^W*8DIdl4FDi:3Eb/[$AKZ).AKXuj
Bm+'.F(Hs5$<2.gASH3:85^Qd0fV$A1H@BO2_<:++Ad3"/3tg@3&!9K/M].;3%Qg;3&<*?1,1C@
3&WHH2_6O91bLR<1c$mD/1`?uJLjW?E%DG*<GQ,RBIl\P+>Yu62(URC1c$j;cFG&gH!r6U/1iD/
/ibU:0f1^>3Ar]J0K:U80eP1;1,q!B/1`?t\L^9s@4Vip<GQDnDCe=H+>GQ*0ekU<2)d9N0e?ZS
6Y1-d?S#P82_HpG/29(A/i#.81,Um>/N#L?2_[$H0eb.60JPR18O6?20JFVE@;TREG]-Z%Ebo9-
/80-IE-"&n06_Va/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL6Y1-d
:hb#]@;0b"+A$Wj@;]Us+E2@>E,Tf+Cb?i1CM\-2+Dk[uDK?qCF!,CA+EqB>Bl5&8BOr;_Bln-%
Ec*"9@;]_#@:s-oDe:,6BOr<*AT)O(AKYo'+Acco@ps(lDBMMlCgh3lF"Rn/<Glqp@;KUcBe2eQ
+>l,91b:RE0K1[:cESKjATB=R/29"=1c$X92DR0A1+kI@/2B">/hf1A3B&iI2D-gA2)[3M/1`?t
Yq/gbE\%Y,<Glr"B6A*+FCd!o;BR_Q1c?m@1H76M/C/qk6VUu?/M&S70JPL<1,h'K/2Jn83@lm=
2(g^@3B&oQ/1iV9/ib^E3&<6>/1f,"/43-?/.DqdEcl.K844RU1GLgB0e>=C0K1sB?Q`9[ALq1>
?S"/h3B&KE3AW9A0fLmE3%QdB/i5LD1,q9F1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^
0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/5p1m/4jkjEG6P7
Ec5o8F(&lH+B<H)CERh0F!+n/+CT.tBk;1(+Cf,-Gp%$;+EV:.+B*E"ATAo%DIakV@:FLuDf08t
DBNG'G%kc,H=:o0Df0V=Bl5%fATMd/DffE)Bji-*BlnK+FCeu*@;Kk"B-:W#+CT.tBk;1(+Cf(n
DJj$%+E(j7FD,5.7<NQ_Eaa'$F!,L;G%G\:Bl5&1De*F"DCoC-Gp#\!@<!n/$<C_N@4XrI+?(u.
0e>=>1,^m=cESKcH#bGf/29+?2E<9D3&ENE0J5%8/2B.E/i#4>2`!<B1H7!G3&<HP3@l^4cESoo
H#bGF$<C_YBlmd*ALpAM+?2A;0J"q52D@'J/28t(6#L3a5qFcI1GL[91H@0H/2]%81+Y4=1+kOA
1,UpI/2K:=1,CgC3B&KE0JPF-:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>
Bjl-:DfTJD1,(F?ARoLsBl@l?0f1FIDIb:B7WNEa+EV:.+DbJ.Bl5%;,$&8qBlmd)+sJQ\FE2MG
BJ(E,BOr;p@VfIpBm+&1AoD^,+Dk[uDK?pE,'R^3Eb-A8BOu3q+DGm>FE2MGBHeWQ+q4l[Bl7Hm
D/!F#EbTbL85^Qe3AWEA2D[6F3%W@_+BE2s/1iD-1GCR>.kr_83%Qg;3&N6A3AiEH1c-pE2_6[;
/ibdL0f1mA/1f)S/66J*/.Dqf@<5k!/4`Y]1,h-N/2K.@2)$T,Zlj!mD(It]/20"<0JP(50f:sB
1G1O=/28k5/hf(82`*NG1,1CA3&39E2CpC1cEo,mASit-$<LY^DCe=V+>PW-0J"t<2DR6CcE\Q[
DepsV/2/q=0eb182)I3B1G1C;/3#R@2`!HS2E36>1GpdD2E3KI0J"b+cE\ugDeps6$<LebASs%i
;BR_Q3AW3B1c.$G/C(UF6VUu?6");u2_[3J/M]4>1b:@63&<*?0K1U<3B&oT0J"e22D-dG1GUX<
/1`?tZn+R=@4Vip=*8P(ASs%i;BRbO3%QpC1cR&3[NJC[ALp,U/2/e43&E3E2)-s>1bLI;/29(9
0KD$G2`!!:2)R!A1c73L3%QU3cF,9#BOr_($<U_RBk1ppF`LnA85^Qg1,Lp@3&3?G1b?qb0d'D)
D_+1_/29%?0f^gA3&!->1G1@8/2B(</ibgK2D[$</Mf@=0Jk^E3%um7/C(m_/5p%s/.DqgBkV'/
844RT2`!9F2CpjC3&NHB?Q`$fE\(QK?S")f0Jk=93%usF0JG=@2CpXB/i>LE2D@$?1,(FC+A"k!
0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?Ch.T>Bjl-:DfTJD1,(FC@;p1+
Dg#]&/T,!6ATKD0/51>0/5BVkC2%Qu+E2@>E,Tf+Cc`bABkV'#.-J=MjcYQO+DGm>FD,5.B5_<k
ATMo8De:,6BOr<-F`&=9DBO%7AKX?RBl7L'AKYi8FD,T/DeF><@;]Tu@;L"'+ED%4Eb0<'DKKqB
FD,5.ARTUqBk;@-+CT>5Ec5i6D.Ra/+CT.u+Co&,ASc:(ATDi7De:,%@;KLmA79M"+DG^9@;]Rh
ASuT46YL1O@4hur=ES%iB4WVb;BRhQ2)-X?3B&`L/C(jM6>pcn/M&V50fCj=1c@$F/2St63%Qg>
1bLIB2*!BH/2T7;0K;$J0K(I5/C(jY6>pcn%166LA0=]eF*(u6BlA#C85^Qg0K1j?2`WiW1+^_Y
+AZri/1iD-2DI0I/MK"<1+Y461,CI:1c-gB3&!-I1b:48/iG^F2)-d9/1f)S/5L4u/.DqhARlo[
EbTH4/4`Y]2D@!H/2oRH3AW53Zli.`BIk_d0fCaC1G(::1bpU;/iPR;1,Ld>2)mKN0ek421G1RG
1c$mC/1`?tZn,!lBIjT"=_V\_F`&a$;BRkV3&rNL2)m?H/C(UF<D@0Y/M&V81GU^93&WQM/2St8
2(UL@1G1@=1bgaD/3#O?2)mKN2DQg7/C(UR<D@0Y%169IDJ<Nm/4`Y]1c@<R/2f1:1-$o2[ie^c
E\'Lb/28n73B8ZF0JkI71G1XI/29+@/ibjK1cI<D/MJe82E!KS1Ft(.cF5?*BlYa6$<gk\Ea``7
85^Qb1,CX90fV$I1G$hX+@U<b/1iD,1Gq-G/MT%;0e>(43B&KH3A*0C2`!?G/1iS4/i>=B2).!?
/1f)Q/4FSn/.Dqi@<Q@"@<Q'185^Qe2)I!<2)dHO2_<7[+BE2s/1iD-0f:XD.ki\72CpX:2*!3B
2`E?I2`!EK2CpR82`<KO0fLX7/C(OP<bZS*%169P@;]^/85^Qd3A<6?1cR9K2D!1.0d'#4@4X\q
/M&_20ek461cI$H2E<WP3%QX91bLaE2E!6F/1`?uKeY,LH!r65$<h.Q@;IJc;BRtZ1b:@=0f_0D
cF+iaEbR'j@4X)g0f:pB0K:mL/2St=0J#%?/ibdK1c%$@/N>@B0f_0K0e=k,cF,8mEbR'6$<h@h
D.+td;BReP2)d'D1cREL/C(UF9P&,n/M&V20f1U81,(L=/2Ah82CpR@3%d'D2_[3O/2An32)6sH
0fU^8/C(UR9P&,n%169]@V'FgChI<sF^f&985^Qf2)?s<2_m9H1+^_U1*B8)@OsfR/28t=0KC^>
2D?p<1+kLC/2At9/iPLF2D[<D/MT.90JkLC2`E9=/C(LU/50be/.DqiF^ep"ASc$gCN<imBe2eQ
+>l);2_6mG1G^g<cEeWeBjrVZ/29"<2)Qs?1c.-B1G1[B/2B";/iYgF2)dKG/MT(72`NfT1H$d8
/C(RQ9PIre%169]@V'FgF(8llD..6p/4`Y]2)[EO/2oCE3&N84Z62hT@Os)^/M&Y02DHa<1-$sB
2).$F1b:4=/i,IB3AE?A/1f)P/50be/.Dr&De!3tBl@lrARfj<2D[0B2)$^<0JFV$2E<BE2_Zp>
0H_r(/i=b;AnPdcDJ=06@;\,!@:F@q%14pH/i,:;0JG1'/MT7<3&30A0JFV$0eP.&6#:"=DJ<N?
<,$A]DX.`=1Gpd?2)$^<0H_r$/iGR@0JG1'/MSk3+@0gVATDKn3`Ba'BcpkrC`l#Q@V'Ti$8aLj
2)$^<0JFV$0eP=;0JG17+>#<#0H`Z!A8cL/@6-\lA8cL/@1<Pq3%d0H0JG17+>#<(/i#:<0JG1'
/MSk3+@0mXDeriC9Qac]A75oS/Mf492E*<D0JFV,3%d'B0JG17+>YW(+@1$\ASuU(DIGRmF_,H/
F!*b_Eb0;$$8"4i0JG170JFV(1bLI90JG17+>GK&+@1'YASuR'Df-[hEt&I.1Gg^E1,(C90H_r%
1H7!E3&!$?0H_r-/i=b;F`VYF@;KXd3^I:fCgh$gAIStu1,COA0JG170H_r%1G^XC2_Zp>0H_r-
/i=b;F`VYF@;KXd3^IRr@q?c]E,oZ1B6+Lh/M]7;2)$^<0JFV$0f:a>0JG170JFV$0eb46+@1-k
FE1f+Bjj%hEbTT(@;]Wc$8"%k/i,180JG1'/MT(B/ho.90JG1'/MSq30H`Z(F*)G2Ch[<=6XakA
ATDg"%14[A1+k@B0JG17+>#<(0J5@>0JG17+>#T+2'>2-F*)G2Ch[<=6t(+[Bl4@e/Mf.70etF:
0JFV$0ekO<2`!-A0JFV$3%cm-6$76jEa`cu@6-kuASkjnFDPLt$8"(i/ibU>0JG1'/MT(@/i,18
0JG1'/NGF@+@1-kFE1f+Bjj%nDdm-qF:AR/1H-pC2)$^<0H_r%1c-gF2_Zp>0H_r%0J5%%6$76j
Ea`cu@6.+oCgq=*Ec,Ft$8"%g/ibjE0JG1'/MSt;/iYU?0JG1'/N>@:+@1-kFE1f+Bjj&!ATDm+
%14[C1G1OA0JG17+>#<*0eP1>0JG17+>#<%/heD6F`VYF@;KXd3`C<7DIn)&$8a[o0K:a?0JFV$
0f:R>2_Zp>0H_r%/heD6F`VYFBjj%mEaa8'$8a[o1,psA0JFV$0ek:;1,(C90H_r%/heD6F`VYF
Bjj%oDJjN)Eckl-%14pM/iYO=0JG1'/MT+82)R'A0JFV$0eP.&6$76jEbSrC9P%pIDJ=3=%14pO
/i,7:0JG1'/MT(71GCL:0JFV$0eP.&6$76jEbSrC9PJBj%14pN/ibU>0JG1'/MT%60JtO<0JFV$
0eP.&6$76jEbSrC;djKg@Wc^(%14pO/i#190JG1'/MT.91H.!A0JFV$0eP.&6$76jEbSrC<bZ,_
DIEt]1,U[<3&!$?0H`;5/i,:;0JG1'2(gR*6=FP9D..KH:183b@<E"d0f(F90JG170H`55/het5
0JG1'2(gR*6=FnD@:X:t%14sI/i#190JG1'/Mo(:1,(C90H_r%/heD7ASc!nF_s0*DKL)6Ec;Hp
2)$XB1GCL:0H_r(/i,@=0JG1'/MSk3+@9XUB5)L*3^Rk0F)to/Et&I60eP.90JG17+>#B%2_Zp>
0JFV$0eP.&6=jtGBm"8R7qHR[%14sH/iGL>0JG1'/N#.<3&!$?0H_r%/heD7ASc!nF_s05C$92@
%14sI/i,:;0JG1'/Mf"71,(C90H_r%/heD7ASc!nF_s0CAS#=kF_>>u%14mH/het50JG1'2Dm*@
0JG170H`2)0H`\nEc#r0@1<Pq0fCXA0JG170H`85/ho:=0JG1'1bLI)6>p[SG%kAG9OT&?@<r@i
/MT+82`EEE0JFV+2_I*L0JG17+>YW(+@:*WF(oGO6?6LUBl%Kl%14[B1+kR@0JG17+>bl,1,gm@
0JFV*/heD7Eaa9.CcYI.D]iS%+A-'[ASH1'%14gE/i>UB0JG1'/MSq9/ib[@0JG1'/N5:9+@BRS
@W,dk@6.4uDJsA7:h=NX%14sI/hf.:0JG1'0ekL;0K:a?0JFV./heD8@;]La@6-baChI0sGp#CH
%14pM/i,180JG1'2DZs@0JG170H`2)0H`_kDII'a3^[RhEboZ9FCfQ4GA\O"77dpq1c[0B0JG17
0H`55/het50JG1'1G1O-6Xak@A77MdDfT`,EZd\hDf9D6:.>["1c6mG0JG170H`83/iPI<0JG1'
1bLI)6Xak@A77MgEb/cmEbT$*Df-[m64F8Y1bLXF0JG17+>u#.2Dm0B0JFV+/heD8@;]La@6-qf
Ch[KiGT]a[%14sK/i,180JG1'2D?a<0JG170H`2)0H`_kDII'a3_++,F(HI\@<itj7L]\]1G1@8
0JG17+?2).0JG170JFV,/heD8@;]La@6.)#DId['+AY`A$8aXn0JG170JFV-1bLaA0JG17+>b])
+@BRT@:We-9lFoZFDl%>:-oBs1c6mC1,(C90H`;1/i>L?0JG1'2(gR*6Xak@A77MnDf0Z;ARTBt
;,n&41c6mB0JG170H`;3/iPI<0JG1'2(gR*6Xak@A77MpFECr8@3A?@%14pN/iYX@0JG1'2_cp?
2)$^<0H`5*0H`_kDII'a3`1$2@V'$l;,n&42)$X:0JG170H`)(2(gR:0JG17+>ti++@BRT@:We-
;IsKTDIFYd9+;4b2(g[=0JG17+>u,10JG170JFV+/heD8@;]La@6.=qBl8#88oJB\+AP64$8a[o
2)$^<0JFV,1+kR@0JG17+>YW-+@BRT@:We-;fj-SDeO#9F!+4I%14sJ/het50JG1'0ebO=0JG17
0JFV-/heD8@;]La@6.=qF),3+Df9M9;bIQ,2)$X<1,(C90H`83/i,C>0JG1'2(gR*6Xak@A77Mt
AT2`C8ShsZ+Al,J$8aXn1b^U;0JFV-1G1[A0JG17+>b])+@BRT@:We-;fuqoATDj+A7Zl[77dpq
1cR*A0JG170H`>8/het50JG1'2(gR*6Xak@A77MuBQ\3'ATAn[@<itk:(7Oe1G1RC0JG17+?);5
1H7'B0JFV,/heD8@;]La@6.A+Ec5i;D]hhN%14pP/ho4;0JG1'0etO;0K1[>0JFV//heD8@;]La
@6.FtDI[U-G%G\:6:21h1cR*A0JG170H`)*1G1@80JG17+?1u-+@BRT@:We-<bZ&cDfTQ#+@8F)
$8aLj0JG170JFV/1G1@80JG17+>kc*+@BRT@:We-=(uP_F)Q(A:JM?+1c[0K0JG170H`A7/ho.9
0JG1'2D-[+6Xak@A77N#Bl7g&E+NZ)9hl-)1,pmD0JG170H`)-/ho:=0JG1'0eP.&6Xak@Ed8d!
Et&I23A*!>0JG17+?2&-0JG170JFV,/heD8@<l]uDBMMl%14mH/hf7=0JG1'/MSt>/iYO=0JG1'
/N>@:+@BgVDIGS$@;[Z,BPD?s%14[C1G1O=0JG17+?(u,2E*<D0JFV+/heD8BPD9o3`BI)FD5/r
D[d%1/iGL>0JG1'2`*-@3&!$?0H`5*0H``$Ci=0"Bjj%hDeF!1@1<Q%/i#:<0JG1'2`33G0JG17
0H`5*0H``$Ci=0"Bjj%sARo@gCh[br$8OCi0etF:0JFV$3&3*C1,(C90H`5*0H``*@UV;g@<Q's
@1<Q"2(gUB0JG17+>#B*/i,F?0JG1'/M\q4+@CEnEclFa:2+3VF(o%l$8a^p0fLd?0JFV$0fL^>
2_Zp>0H_r%/heD8H=^T"Df]`5G%#0#@6-_q@<?4)CghKq%14sH/hf7=0JG1'/MT(71bpa=0JFV$
0eP.&6[E<RBQ%s.Dg#Q)Bjj&!Ea`Wi%14sO/hf.:0JG1'/NGFC2)$^<0H_r%/heD9ASu?nEbd^%
@;KCkEb>gg2)['A2D?g=0H_r%0J5+90JG17+>#<#0H`bpDJ`g&CH=aiEbKT:%14sM/iPO>0JG1'
/MT"52)d3C0JFV$0eP.&6tL7Q@<--E6Z6pTDJ3HkASqqa/M]7;0K:a?0JFV(0KCaA1GCL:0H`;,
0H`emF*(u6+A$V`$8OFj0K:a?0JFV$1GURC1GCL:0H_r&/heD:B6eH<3^Ih2@;ZM]1GCF82)$^<
0H_r'0eP4=0JG17+>#?$0H`esH#Rjd6Xa\LD[d%/2(gdH0JG17+>#B)/i5790JG1'/M\q4+@Tpg
E-+-7Fa.hF%14sI/ibU>0JG1'3%d$H0JG17+>>E%+A$TbCgh3l3^[h+CCLV.1G1I>0JG17+>ti-
2)$^<0H`&%0H`r-ASbdmA3*,$@Vfar%14sK/i#@>0JG1'3A*!C0JG17+>>E%+A$TbCgh3l3_*Up
G@>b+$8jRk2E*<D0JFV//iGL>0JG1'0J5%%8TJBY@;]U:9PJ?TEbT$!%14sJ/i#:<0JG1'2_Hg=
0JG17+>>E%+A$TbCgh3l3`fa3ATDC$Eb#Ud0f(F?2_Zp>0H`>8/ho:=0JG1'2D-[+7;O)F@;L*q
A8cKL;djPd;djKc@:X:s%15*J0JtO<0JFV$1H7!G0JG170H_r'/heD:FD,B,E+r`A6"FM?F!*bX
@:EXS$8"+j/het50JG1'2*!9C0JG170H`2)0H`hnChmiqDIak]Et&I.0fCX<0JG170H_r%2`WKE
0JG170H_r%1+k7'7VQUO+A$V`$8sRj0f(L;0JFV$1,U[<0JG170H_r&/heD;Bl7`qDIbe!AScF%
DJNqq$8sjr3A<-@0JFV$1,gg>3&!$?0H_r&/heD;Bl7`qDIbe"DIIR"%15!N/het50JG1'/M]19
1c$g>0JFV$1+k7'7VQaV@;]U::N^Jr%15!J/i>F=0JG1'/M]+72`39C0JFV$1+k7'7VQaV@;]U:
<+0W_ATD>k$8sRj1c6s@0JFV$1,:I;2)$^<0H_r&/heD;Bl7`qDIbe-F`M8?%15!L/ho%60JG1'
/M]%52D?g=0JFV$1+k7'7VQaV@;]U:<afEX@1<Q#2_HpH0JG17+>>E*1GCL:0H_r%/heD;Ea`iq
ANE+pB4Z+)%14pK/iYX@0JG1'0J54A0JG17+>#<#0H`i*@;]Rd3^Rb*A7]1lGRY!:3%d!H0JG17
+>b].0JG170H_r%/heD;Ea`iqANE.uATMr&$8jLi3AiKE0JFV$0ePFE0JG17+>#<#0H`i*@;]Rd
3^[=l@;0cl$8aaq2E*<D0JFV(/i>UB0JG1'/MSk3+@^B[DI[6=6YL%O@W-C0B+52)3A*<I0JG17
+>#<#0K:a?0JFV$0eP.&7WMpT@q@\hBk;7&AISu'2_HmB0JG17+>#H'0JbC:0JFV$0eP.&7WMpT
@q@\hBkhR(%14pL/ho=>0JG1'2(ggC0JG17+>#<#0H`i*@;]Rd3_+4%DJs!#AISu'3%d0F0JG17
+>#N)2`NKF0JFV$0eP.&7WMpT@q@\l@:s^oDIIYs$8aaq2)$^<0JFV$0J5(60JG17+>#<#0H`i*
@;]Rd3_X*-87?[^AISu'3%cm=0JG17+>#9"1,(C90JFV$0eP.&7WMpT@q@\pAKX]UDK?6o1c6mF
1GCL:0H_r%/i#:<0JG1'/MSk3+@^B[DI[6=9PJ?^B4Z,n$8aUm2`EEE0JFV$1bLaD0JG17+>#<#
0H`i*@;]Rd3_Xg;D@Hq01G1I;0JG17+>#H'1H.!A0JFV$0eP.&7WMpT@q@\q@<-F#Bl%Ts%14pP
/ho+80JG1'/N,493&!$?0H_r%/heD;Ea`iqANEOsFF"B'1cR*F2)$^<0H_r+/i5OA0JG1'/MSk3
+@^B[DI[6=9lFihBOtmp%14pO/iPI<0JG1'/N,4:0JG170H_r%/heD;Ea`iqANERpDI[r$$8a[o
1,CU<0JFV(/i>UB0JG1'/MSk3+@^B[DI[6=:18$^ATJ:f1c$aC0JG170H_r+/i#@>0JG1'/MSk3
+@^B[DI[6=:2+3L%14pO/iYdD0JG1'/M\q71GCL:0H_r%/heD;Ea`iqANEXrEbTS($8aaq1,Ua>
0JFV$1bLI<0JG17+>#<#0H`i*@;]Rd3`9O'D0$-n1cR*B0JG170H`)&2E*<D0JFV$0eP.&7WMpT
@q@]!ASuBsEt&I53A*-E0JG17+>#<#0K:a?0JFV$0eP.&7WMpT@q@]!DfoW/%14pO/i#==0JG1'
/N5:=1GCL:0H_r%/heD;Ea`iqANEcSCh7[0@<;qc1cR*F3&!$?0H_r+/iPXA0JG1'/MSk3+@^B[
DI[6=;fm%gF(0'1Eb>gg1c$aC0JG170H_r%/i5L@0JG1'/MSk3+@^B[DI[6=<,ZnqDfp,4%14pP
/hf(80JG1'/N5:B2)$^<0H_r%/heD;Ea`iqANEn,F)to0@W-C0B+52*0ePIG0JG17+>#T+3&NBD
0JFV$0eP.&7qH^X@;^?O6#:.ECh*t^2)6dA0JG170H_r%1G1L?0JG17+>#<#0H`ksEc#6&Gre9'
EboH-%14sH/iPR?0JG1'/N5::0JG170H_r%/heD<ATDWrDL"90Df0G%$8jUl0K:a?0JFV$3%d0E
0JG17+>#<#0H`ksEc#6&Gre94ASl!r%14sI/i>F=0JG1'/N5:=2)$^<0H_r%/heD<ATDWrDL"92
DfTr:F`(_!$8jOj0JtO<0JFV$0f(F@2)$^<0H_r%/heD<ATDWrDL"92Eb0<&ASqqa2)-^=1,(C9
0H_r*/iPaD0JG1'/MSk3+@g!`D..=-3^e+3F(K/uDfTG!$8jLi0eb:80JFV$3%d*K0JG17+>#<#
0H`ksEc#6&GreE8@;]jmF`MR5$8a^p0JG170JFV$2_I'K0JG17+>#<#0H`ksEc#6&GreE8ASGUr
Eb>gg2)?jB2)$^<0H_r%0J5%50JG17+>#<#0H`ksEc#6&GreK)D.7X.B+52*1+k@B0JG17+>#T+
2`!-A0JFV$0eP.&7qH^X@;^?O87?CRDg#]4%14pP/het50JG1'/N>@>0JG170H_r%/heD<ATDWr
DL"99@<-1*Ecl&,%14sH/i,7:0JG1'/NGF@0JG170H_r%/heD<ATDWrDL"99@<6L$C^g_/1bLR?
0JG17+>#<%/ho.90JG1'/MSk3+@g!`D..=-3_O0uC^g_/0eP7<0JG17+>#<'/i,:;0JG1'/MSk3
+@g!`D..=-3_X+!E-c52%14pO/ho.90JG1'/MSt42)m9D0JFV$0eP.&7qH^X@;^?O9m(>`BOu&j
$8aaq1c6s@0JFV$0ek:73&!$?0H_r%/heD<ATDWrDL"9<F`M&2@V'Rm%14sJ/i5790JG1'/MT%6
0K1[>0JFV$0eP.&7qH^X@;^?O:iCGsA79<a$8aaq0JP780JFV$0et@91,(C90H_r%/heD<ATDWr
DL"9@AS5RlF(094B+52*1bLL:0JG17+>#<'/ho4;0JG1'/MSk3+@g!`D..=-3`9m;FDkZ)%14pO
/iPaD0JG1'/NGF=0JG170H_r%/heD<ATDWrDL"9AFEM\IB45h&%14pP/iYO=0JG1'/NGFD2)$^<
0H_r%/heD<ATDWrDL"9EF`Me;F`M+($8XXo0JG170JFV$1,COA1GCL:0H_r&/heD<Eb/flANE,!
BOu(&%14pG/iGL>0JG1'/M](63B&WG0JFV$1+k7'7ri0P@q@]#BOu7+@;Kk"Bkq,d$8O@h1,Ua>
0JFV$0ekL;0fUj@0JFV$3%cm-88iBY+A6WjB+52)2_HsA0JG17+>#<./het50JG1'/MSk3+@pWm
B45h+3^Rt"@;oe!F:AR80eP1<0JG17+>PZ(3B&WG0JFV(/heD>@qBIbDIbe+AU/'+@<Q@#%14gF
/ibjE0JG1'/N5U@2)m9D0JFV$2(ga/8T&'Q@6-_`DJ*BoDfTCu$8FLm3AW?C0JFV$2_m!F2)$^<
0H_r)/i=bCDIdHi3^Rb%@UXNk$8O@h2)m9D0JFV$3&iNH2)$^<0H_r)/i=bCDIdHi3^[=l@s)m8
@1<Q!2D-sK0JG17+>#N0/iYX@0JG1'/N#.<+A$H]Bjj%p@;0\'EX`@11G1@@0JG17+>#Q,/i,18
0JG1'/N#.<+A$H]Bjj%s@:XCeEt&I33%d!G0JG17+>#N2/i#190JG1'/N#.<+A$H]Bjj%tATo7b
ASc$o%14gL/i>RA0JG1'/N5I<3B&WG0JFV$2(ga/8T&'Q@6.5'Df/tm$8".g0f(L;0JFV$0ebL<
2`39C0JFV$2_Hs18T&'WDImm'@6-ek@;B:lFC>Uc1GCF;1GCL:0H_r(3%csD0JG17+>#B%2'>J2
@;\+l@UWeUD@Hq/1bL[D0JG17+>#H)/ibdC0JG1'/Mf":+A$T^DE:X;D%-h.2(gdF0JG17+>#H*
/i5@<0JG1'/Mf":+A$T^DE:a.BQ@O!%14mI/i,:;0JG1'/Mo::1c$g>0JFV$1G1@(8TJ6Z3^R7f
BOkO^%14mH/iYU?0JG1'/Mf493B/]H0JFV$1+k7'8TSo\ASaCu@;0=^%14mG/iPaD0JG1'/Mf7:
1,:O;0JFV$1+k7'8TSo\ASaD"ATDp7@;KLl%14mH/hf7=0JG1'/Mf492`EEE0JFV$1+k7'8TSo\
ASaD,AS`JTG%l+/$8aIi0ek@90JFV$0fCXD2_Zp>0H_r%/heD>FCB!23^R7qBakD*3A*'B0JG17
+>#T+0f(L;0JFV$0eP.&8T\BWGre<$B5D9jEbPsi1c$aC3&!$?0H_r%0eP4=0JG17+>#<#0H`r/
@;L3M7Vm!`ASu!h%14pH/i5L@0JG1'/MT+82)R'A0JFV$0eP.&8T\BWGreE5B4kpe%14pK/i579
0JG1'/N>@C1GCL:0H_r%/heD>FCB!23_*b!Dda(^1c6mB2_Zp>0H_r-/i#+70JG1'/MSk3+A$Z`
CjA'9Bl%3q%14pG/iYX@0JG1'/MT(71,Ua>0JFV$0eP.&8T\BWGre]/E,9*,%14mN/ho.90JG1'
/MT%61H7'B0JFV$0eP.&8T\BWGrec1Ch7X(D[d%11G1UA0JG17+>#<%/i5790JG1'/MSk3+A$Z`
CjA'<Bld\l$8aRl0JtO<0JFV$0et@=2_Zp>0H_r%/heD>FCB!23`9[/Bl7Vo$8aIi3&iTG0JFV$
0et@=0JG170H_r%/heD>FCB!23`9m5AISu'0J51@0JG17+>#<,/i#:<0JG1'/MSk3+A$Z`CjA'@
@<,doFDhTq1c6m>2_Zp>0H_r+/iGXB0JG1'/MSk3+A$Z`CjA'@F`M26%14pL/iGR@0JG1'/MT%6
2`NKF0JFV$0eP.&8T\BWGreoFBk;@-AISu'2(g^A0JG17+>#<'/i,:;0JG1'/MSk3+A$Z`CjA'B
ASu3lAISu$3%cm=0JG17+?)530JG170JFV,/heD?@;TFe@pofR1Gpd=1GCL:0H_r%1GpdD2)$^<
0H_r-/heD?@;oXm3_Oa:FDhTq1Gg^B2_Zp>0H_r%1GpdB0JG170H_r-/heD?@;oXm3_sg*CLIYZ
1GpdD0JG170H_r%1H@'H2_Zp>0H_r-/heD?@;oXm3`L$5H#F-!/Mo(62_Zp>0H_r'3A*3K0JG17
+>#B%0Ha#"DL#YO9lFlX@<6Ku%14[A/i#C?0JG1'/Mf:;3&<6B0JFV$1G1@(94`!d@6..lBl\-$
BakD,2D-sK0JG17+>#?*/ho.90JG1'/Mf"5+A?3cG%kAG;JBcP%14mI/iYdD0JG1'/Mf7:1cI*B
0JFV$1+k7'9P%[ADJsDR6=jkOF`\'"0fCX<0JG170H`8//het50JG1'1bLI)9P%dZ@<,m$8TP=J
1c[0H1,(C90H_r*/ho.90JG1'/MSk3+A?p&ASkmpF`M+U9QbSkD.7F+Eb>gg1G1C<0JG17+>#<%
0ePC=0JG17+>#N)2'>V%CghU1Bjj%qF^])p+A?opE-611$8F.h1GCL:0H_r%0Jb=@1GCL:0H_r+
/i=bG@;K@tF(o&D;e^,^@;p.*AISu$1bLI90JG17+>tr,0JG170JFV+/heDB@<-I(DJ=*5AISu$
2D-sH0JG17+?;G73AW?C0JFV-/heDBAU%p!D`U0o@;p@*@rDe`0f^jC1,(C90H`A9/ho:=0JG1'
2D-[+9kAQ`@rFD&AU%p!D]hD]FEn<&1,pm?0JG170H`)/2D-[;0JG17+>GT'0Ha)(A9VI-+A$V`
$8jLi1G^^=0JFV$0ebL<1c$g>0JFV$2_Hd,9lFo^Des,r3^IS(@;[2SF_kK!%14pN/ibU>0JG1'
/MSq;/iYdD0JG1'/N5:9+AHclB5_U#@6.D)@:=$r6=F;E@<)ea1c$aC1GCL:0H_r+/i5=;0JG1'
/MSk3+AHcl@:O4:9lFokAKX?KEboY'$8XCh3&30A0JFV//het50JG1'0J5%%9lG&j@q/q.9jr'_
@;BFaBFP;)2(ggI0JG17+>kc21GCL:0H`&%0Ha).Ec5GtD`Uj+DJ*O$%14jL/iPI<0JG1'/N>U?
1GUX<0JFV$2(ga/:1\BQCcY3tFDYH(A9A=g2)6d?2)$^<0H_r(/ibU>0JG1'/MSk3+AQKiBOu4#
@;]Us3^IV(FCfK'@;QG\2)6d>1,(C90H_r)/ibdC0JG1'/MSk3+AQKiBOu4#@;]Us3^I^rCh.I&
Ec)<n2)$XB2)$^<0H_r)/iPI<0JG1'/MSk3+AQKiBOu4#@;]Us3_a$kF*)G:@q]rn$8jOj3&<6B
0JFV$2(gjI0JG17+>#<#0Ha,%FD,6+Cgh3lF#m'1C2INpASqqa2)-^D1,(C90H_r(/i5OA0JG1'
/MSk3+AQKiBOu4#@;]Us3`9m<FCfK'@;QG\2)6d<3&!$?0H_r(/i#@>0JG1'/MSk3+AQKiBOu4#
@;]Us3`Kd(+@opRF_)!h/MT+80JG170JFV$0fD!D0JG170JFV$0ek:7+AQKl+@p'QEbT&qEt&I.
1H$jG1,(C90H_r%2`*-G2)$^<0H_r%1+k7':1\Vl>%M,Y@;]U:6$6[QCgh3l%14[D1G1OB0JG17
+>#<,1+kID0JG17+>#<'/heDCATo8#ARTC`DIbdqBQ@g.FCT!,Earbl$8"(l/iYdD0JG1'/MT1<
/i>=:0JG1'/MT"50Ha,%G9C(#@;K@iA3*,$DIm?mD@Hq)1H-pF2_Zp>0H_r%2`33D0JG170H_r%
1+k7':1\Vl>%M,Y@;]U:87?@LCijT5%14[D2D-gB0JG17+>#<+3%d!E0JG17+>#<'/heDCATo8#
ARTC`DIbe"DK]T3@psCjBl%Sp$8"%o/i5OA0JG1'/MT1B/ibjE0JG1'/MT"50Ha,%G9C(#@;K@i
A3*IoE+rm(%14[D0eP790JG17+>#<,1G1FB0JG17+>#<'/heDCATo8#ARTC`DIbe'AScF+D@Hq)
1H@'A2)$^<0H_r%2`*-@2_Zp>0H_r%1+k7':1\Vl>%M,Y@;]U::1\Vl:i(DoDfp/8%14[D1bLRD
0JG17+>#<,0eP4;0JG17+>#<'/heDCATo8#ARTC`DIbe-Bl.:!FU\[01bgU<3&!$?0H_r%2`*-G
3&!$?0H_r%1+k7':1\Vl>%M,Y@;]U:=(Q2aBl7R*Df-!k2D-gD0JG17+>#B%1cI*B0JFV$0eP.&
:2+?PEbSrC9OVRPEt&I70J5.@0JG17+>#H'1G^^=0JFV$0eP.&:2b/s@<jn#ATDEpD@Hq23%d$D
0JG17+>#<,/i5=;0JG1'/MSk3+AQiqG@>bX:180dBkn.b2*!9L1GCL:0H_r%0J5:A0JG17+>#<#
0Ha,/Ed(r;3_sg5D[d%23%d3M0JG17+>#H'2`39C0JFV$0eP.&:2b/s@<jn4FCB?$B4Z)m$8sms
2_Zp>0JFV$0f^j?0JG170H_r%/heDCDfU&1GreoFDf'Rj%15!L/iGC;0JG1'/MSq31H7'B0JFV$
0eP.&:2b/s@<jn5Ec5i+BOtmp%14jI/iY^B0JG1'/N,O?0JbC:0JFV$2(gR*:gn-RF*(i.3_Nn%
@:Ntb%14mG/i>RA0JG1'/N5L=1H.!A0JFV$2(gR*:gn-RF*(i.3_WsqDfTCu$8""j/i#:<0JG1'
2)d-G2_Zp>0H`2)0Ha2#Ea`U'@<jn"F*2A1Bl@ku$8!tf/ho%60JG1'2`E?C2)$^<0H`5*0Ha2'
EcjE:Bl.8f$8FFk1bpa=0JFV$0etF82DQs?0JFV$3%cm-:hXQZBlJ$*DImlM6=FMLBl=Ff0f1L@
0JG170H_r%1,(=@3&!$?0H_r,/heDEBPD9sE,]N/ATKn,@;]dq@1<Pq1,U[<2_Zp>0H`)+0J5(6
0JG17+?1u-+Acco@ps(lDBMMl%14sL/i,F?0JG1'/MT4;2D[$@0JFV$0eP.&:iC/YDIbduA79@s
CCLV.0J5%:0JG17+>#<./ib[@0JG1'/MSk3+Acum@;]U:96+HVDg)Wt2)-^C1,(C90H_r%3A*-I
0JG17+>#<#0Ha21Cgh3l3_XI&H4:3=1+k=>0JG17+>#?'/het50JG1'/MSk3+Acum@;]U:=(-,j
@<W.f1H7!G1GCL:0H`A.0f(L;0JFV'/heDEDfTrBB45U;9PJQWDf-!k1bgU;2)$^<0H`>-2DQs?
0JFV'/heDEDfTrBB45U;;"SdMD[d%.3%cm=0JG17+>u,10JG170JFV+/heDJ;aEH@F_,T8D]hql
@rDe`1c?sD1GCL:0H_r&2D.!L0JG17+>#?$0Ha83D..<r@6-_`@psKh$8aRl1bpa=0JFV$1,^a>
1,(C90H_r&/heDGDf&p#Bjj%hF^o)nEb0<6%15!M/i>F=0JG1'/Mo.62E*<D0JFV$1G1@(;K[&%
Bjj%gEbf>sDJ*Ns-Za&4$8aFh1H.!A0JFV$1c[0J3&!$?0H_r'/heD6H=_,+@<lC0@;\+m@;Bup
$8aLj3&iTG0JFV$2`*-G2_Zp>0H_r*/heDGF`VV<@6-kuF`)M:%14sJ/i,180JG1'/MSq9/i#:<
0JG1'/N>@:+B!?'F(o&D8TJThFE;4,$8jLi0JG170JFV$1H$j@2)$^<0H_r'/heDGF`VV<@6.%p
@<*`2DfuQs2)$X>2_Zp>0H_r'0J51A0JG17+>#B%0HaA2Ea`["ANEIuATeLi1c[0J1GCL:0H_r&
1bLI90JG17+>#B%0Ha89F)u&(3_UoEDfuQs2)?jE2)$^<0H_r&2_HsA0JG17+>#B%0H`]-ASc:*
F`VV<@6.+sDKBS&$8j[n2`39C0JFV$1H-pD3&!$?0H_r'/heDGF`VV<@6.,$F(9-4%15!Q/ibmF
0JG1'/Mf180f(L;0JFV$1G1@(;K[&%Bjj%sF`M>-DKBS&$8aXn2)$^<0JFV$1GCF?2_Zp>0H_r'
/heDGF`VV<@6.1pATMp$%14sM/het50JG1'/N5I<1H.!A0JFV$2D-[+;K[&%Bjj%uD0'J%$8X[p
2E!6C0JFV$2E!0J2)$^<0H_r)/heDGF`VV<@6.=qD..I#@;]Tb$8aRl2D?g=0JFV$1G^X@1,(C9
0H_r'/heDGF`VV<@6.=uG%#H6DfBW2-OgD?1bLaC0JG17+>#B)/hf4<0JG1'/Mf"5+B!?'F(o&D
;f-GhASuR)%14pO/iY^B0JG1'/M].82E*<D0JFV$1G1@(;K[&%Bjj&$FCB'$F)59.%14sQ/ib[@
0JG1'/Mf(51bpa=0JFV$1G1@(;K[&%Bjj&$F<FCkFCfK6@Wc^(%14pH/i#@>0JG1'/N,UA1,:O;
0JFV$2D-[+;K[&%Bjj&%@<6*tASuT!$8aIi2_m'@0JFV$1c-gE0JG170H_r(/heD<AT)U%Bjj&%
@VKXmF(l'j2)['E0JG170H_r,2(gRB0JG17+>#N)0Ha89F)u&(3`L$7F))3l1cR*H2)$^<0H_r(
1bLX>0JG17+>#E&0Ha89F)u&(3`^08B45Fn@:TfS1c$a=2)$^<0H_r%1GLLA3&!$?0H_r%0J5%%
;K[&%Bjj&'CggjgG&MGDDefdh/MT(70JG170JFV(2_cp=0JG170H`))/heDH@;Tpk+A$V`$8OFj
2Dm0B0JFV$1c?sF2_Zp>0H_r'/heDH@<H*p+@1$V@VK736#n)GBmF,t%14gH/iGL>0JG1'0fL^A
2)$^<0H`&%0Ha;*DImHhCcXsmCLM5m$8"+f0JG170JFV$2)R!?0JG170H_r(/heDHAU.d!ASc0o
F!+%q%14[H/het50JG1'/MT+A/het50JG1'/MSq30Ha;4Ci=0/DBMMl%14[B3A*$A0JG17+>#?,
/i#4:0JG1'/M\q4+B*3$FD)d_Ao_Tq@6-_kDe3ctDf0Z.Bl4@e/Mf183AW?C0JFV$0fUdB2_Zp>
0H_r&/heDHDfp/8+@0U[Bk(R46XaqF+B39'D@Hq)1-$sH3&!$?0H_r'0eP.60JG17+>#?$0Ha;4
F`_:>6"Y.O@pqDdF`Lr"D@Hq)1G^X;0JG170H_r&2_I*E0JG17+>#?$0Ha;4F`_:>6"Y.O@pqDe
@<6N59Q+fZDf-!k/M]4:1,Ua>0JFV$1,pm?0JG170H_r&/heDHDfp/8+@0U[Bk(R48oJBODJj$,
@Wc^(%14[C1G1[H0JG17+>#?+/iGC;0JG1'/M\q4+B*3$FD)d_Ao_Tq@6.5'Ec`EmCh\3(@V#uU
/M]192`39C0JFV$1,pmA0JG170H_r&/heDHDfp/8+@0U[Bk(R4:i^,hDfTQ#%14mM/i>F=0JG1'
/MT">/het50JG1'/NGF;+B*3$FD)diDfTDt3`BU.F_hKo1bgU>1,(C90H_r&/ho:=0JG1'/MSk3
+B*5fBl5su@<,jhCi=3"%14pJ/i#:<0JG1'1+kRC0JG17+>#<#0Ha;5@;0U?6>:7FDda(^1H$jC
1GCL:0H`8+1GCL:0JFV$0eP.&;fH/ZDE:-nA8-?!$8XUn3&iTG0JFV+/iP^C0JG1'/MSk3+B*5f
Bl5t!DfTB,@UT]Q1H$j?2)$^<0H`5*1Gpj?0JFV$0eP.&;fH/ZDE::%@WGmnFCB2!$8aFh1bpa=
0JFV*/iPO>0JG1'/MSk3+B*5fBl5t+@:XCmA.8l%2D-pD0JG17+>b]-1,(C90H_r%/heDHE+*Hu
3_a%!@:s!X$8aOk1cI*B0JFV*/iYO=0JG1'/MSk3+B*5fBl5t1@;^0qDId=!%14mM/i5790JG1'
2(gmK0JG17+>#<#0Ha;5@;0U?;e:,dCi!Yl$8X[p1cR0C0JFV'/i5790JG1'/MSk3+B*5fBl5t4
@;KLm@qf?\$8FCj2)R'A0JFV$1GUR?3&!$?0H_r&/heDHF_"ou3_O-pEcc5BD%-h02_I$H0JG17
+>#<'/het50JG1'/MSk3+B*JqA7]X>7rNK\@W-:"%14sM/i>UB0JG1'/MT%60JG170JFV$0eP.&
;g2e`ASsP'@;KfS%14sQ/i,:;0JG1'/MT4;0K:a?0JFV$0eP.&;g2e`ASsP-FDkZ)BQ%^(%14sQ
/ib[@0JG1'/MT4;0f(L;0JFV$0eP.&;g2e`ASsP/E,]l,Cgdb[1cI$E1GCL:0H_r+/i>C<0JG1'
/MSk3+B*JuFF%M=Cgh3l3^R7kAISu'2_HsF0JG17+>#N)2D?g=0JFV$0eP.&;g2qtH=_,5@;]U:
6=FqHC^g_.2D.!I0JG17+>#N)1c$g>0JFV$0eP.&;g2qtH=_,5@;]U:6=k1T%14pM/i#190JG1'
/N,492)$^<0H_r%/heDHGA2/FATDTqDIbduASu(&@1<Q#2_Hd?0JG17+>#Q*1-%$B0JFV$0eP.&
;g2qtH=_,5@;]U:9QaiVEc,Ft$8a[o1H7'B0JFV$3%d'G0JG17+>#<#0Ha;<BlnZ4Ebo0%A3*ol
EbT#s%14jJ/hf7=0JG1'/MT"8/i>F=0JG1'/N>@:+B2c`G@>AM<$u*gE+N_m$8".g3&NBD0JFV$
1H@'D0JG170H_r'/heDI@;^C"DJ<N?6t(*YATJtm@;K@\D%-h-3A*3L0JG17+>#T./ho:=0JG1'
/N,48+B3&aATTt,BOPsj%14[B0J5%50JG17+>Gf4/het50JG1'0f(F9+B38sB42oSEt&I42D-sF
0JG17+>#<%/i#190JG1'/MSk3+B3K$Bldus3`L6>Bla^j1H@'J1,(C90H_r'1+kOB0JG17+>#?$
0Ha>;Ebf633^IY!@<,cc$8aIi0JbC:0JFV$1,pmH3&!$?0H_r&/heDIF`M8/GreN<FCB&rF_hKo
0J5%=0JG17+>#B)/i5OA0JG1'/Mf"5+B<&_DId0:7;d3Y@U`mX$8=(g1,(C90H_r'1+kFD0JG17
+>#B%0HaA.@;]Ua3_NmuE+*Qk%14sO/ho7?3AE311+k:83&WcN+>>E%+B;&q6"4DGA7]=i+B<;n
G%G]8BlnV0$8jXm2)m9D0JFV,/ib[@0JG1'0J5%%<D,A>ASbseF*%iu2)6dA0JG170H`)&3&<6B
0JFV'/heDJ90,CREc#N.B4t^j%14sH/iYX@0JG1'0J5(=0JG17+>>E%+B;&q6?6dQBQS01%14sI
/i5L@0JG1'1+kFD0JG17+>>E%+B;&q6?6d]FDkt)$8jOj2)$^<0JFV*/i#+70JG1'0J5%%<D,A?
@<,mmAnDJZ2)HpF3&!$?0H`,'3AN9B0JFV'/heDJ90,FKEboH2Ch4%_2)Hp?2_Zp>0H`2)1c6s@
0JFV'/heDJ90,IZF_>N!F"Bn(Ch4`-AfsfVD@Hq12(gmF0JG17+>YW*1GCL:0H`&%0Ha@g3^mRn
DIRa/B4q_]2)R!G2_Zp>0H`2)1GCL:0JFV'/heDJ90,RZ@<6("G7=m:0ePFC0JG17+>PQ)1,(C9
0H`&%0Ha@g3_+")F^o!(FCfJ%$8jRk0JtO<0JFV(/ho4;0JG1'0J5%%<D,AEE-$5;@qZ;Y2)?jE
1GCL:0H`)&2)d3C0JFV'/heDJ90,aXARoik$8jRk2E*<D0JFV(/ho4;0JG1'0J5%%<D,AHASGXc
F*(u6%14sK/i5790JG1'1+kRG0JG17+>>E%+B;&q9PJZ]Ec>r8C^g_/0eP=;0JG17+>>E&2_Zp>
0H`&%0Ha@g3_XI0A8c>p$8j[n0JG170JFV./i,7:0JG1'0J5%%<D,AHDf0*(DId=!Ed8*$2)?jA
2)$^<0H`,'1,Ua>0JFV'/heDJ90,dUDI[?kF*(u6%14sL/i>RA0JG1'0eP1>0JG17+>>E%+B;&q
9ke-KCh7ZsDfTc=B4q_]2)R!?0JG170H`)&2)$^<0JFV'/heDJ90,gZG@P'&FDPM?F`;8:/Q@"5
AISu(1+kI@0JG17+>#<#1,psA0JFV'/heDJ90,gdEd)5-BFP;+1+kRG0JG17+>GK'2_Zp>0H`&%
0Ha@g3_jU8FD5W*BOP`e$8jOj2`39C0JFV(/i#4:0JG1'0J5%%<D,AKG\1l7A.8l'0J5.@0JG17
+>b]*1GCL:0H`&%0Ha@g3`'X<D/XQ=BFP;+1G1L<0JG17+>GK*2)$^<0H`&%0Ha@g3`B^'AnGag
Ch*t^2)$XC1,(C90H`)&1H7'B0JFV'/heDJ90-!iF`_;*D/aT8D@Hq03A*'@0JG17+>PQ(1,(C9
0H`&%0Ha@g3`C,C87cUOATB=oATDj'Gmt*<0eP@?0JG17+>YW12)$^<0H`&%0Ha@g3`C62DKBAt
%14sK/ibjE0JG1'0eP.>0JG17+>>E%+B;&q=`8=r%14[C1bLdD0JG17+>l&00fLd?0JFV*/heDJ
Ea`U'@<jn.Df0Z2G%kJuD[d%02(gRB0JG17+>GQ./iGL>0JG1'2_Hd,<Du1E6#:"QEHPi5EHPh8
:/)0)2DHg=2_Zp>0H`),3A*9N0JG17+?;&.+B;?+3^IXnBQ%p"B4W2O9+;4a1G1UD0JG17+?221
1b^U;0JFV,/heDJ;aEH1FDPB'FC?:^5n+/W3A**A0JG17+?)222D[$@0JFV,/heDJ;aEH2@;L%"
D/XH++AG65$8aOk2DQs?0JFV(0fCX=1,(C90H`;,0Ha@o5rq>NBldi.8OO!p1bp[>2)$^<0H`;/
/hf4<0JG1'2(gR*<Du1E6>ppeDf-[l5n+/X1+kOG0JG17+?)843&`NF0JFV,/heDJ;aEH2F_55o
Ci:Fk=Ub]p0ePIB0JG17+?2;42D[$@0JFV-/heDJ;aEH3BPCsbB5\na9FV=b1+kLF0JG17+?;>4
3&!$?0JFV-/heDJ;aEH4@;KagF!+Fa%14mO/iPXA0JG1'0ebF:3B/]H0JFV./heDJ;aEH4ASu[&
EZd_F%14pI/i,:;0JG1'3&<0@2)$^<0H`5*0Ha@o5rqDFFE2;6F<F:L%14pH/iP^C0JG1'2_m!D
3&!$?0H`5*0Ha@o5rqPFEcbo3Eb$:[<"00i3A*6L0JG17+?;;31H.!A0JFV-/heDJ;aEH8Dfp,C
Df-[s=:GTn1bLI<0JG17+?2212)R'A0JFV,/heD@ASuBsF('887mRRk1b^O=1,(C90H`>5/ibU>
0JG1'2D-[+<Du1E9OVOEH"D)>AKXQ>%14pG/hf"60JG1'2`<9E1,(C90H`5*0Ha@o5rq\JDI[*r
FCfJ8:dGNt1H$j?2_Zp>0H`))2(gU@0JG17+?(o,+B;?+3_Wt'+BE&d@<3Pd<XfBl2(gjI0JG17
+>GQ./i,7:0JG1'2_Hd,<Du1E9Q+tp6#9tHDf[$r9aqFc1bLI>0JG17+>GT1/i#4:0JG1'3%cm-
<Du1E9Q+tp6#L=HCh7Z16U;.g1Gpd>2_Zp>0H`A0/het50JG1'2D-[+<Du1E9kA0\BPDN1<)*l0
1,U[C3&!$?0H`>//i#+70JG1'2(gR*<Du1E9ke$QBcol=%14pJ/hf.:0JG1'3&`HM1GCL:0H`8+
0Ha@o5rq_SCj0<1CLq'"8PBR#1c6m>0JG170H`A3/i#:<0JG1'2D-[+<Du1E9keK_ARTOrCh[r5
9hl-)1H$jC3&!$?0H`)*0ePIA0JG17+?1u-+B;?+3_aO1FCfK(Gp#I?%14mL/ho:=0JG1'3&WBK
1GCL:0H`8+0Ha@o5rqbLF(f`2Ci!Z*<)*l01b^O@1GCL:0H`;2/ho=>0JG1'2(gR*<Du1E:1\WX
Ebcdm8du+_3A*<N0JG17+?;,.0K1[>0JFV-/heDJ;aEH>ATo7mEbo;qDK?po5n+/X0J5:A0JG17
+?),00JG170JFV,/heDJ;aEH>ATo8"DfTV9:0A#52Dd$D0JG170H`).2(ga?0JG17+?;&.+B;?+
3_jU1AKX93%14mM/iYX@0JG1'0etL:1,Ua>0JFV//heDJ;aEH?@;B[fDIakW5n+/W2(g^E0JG17
+?;A52)R'A0JFV-/heDJ;aEH?CM[EmDf&o*6YUXf+AYW>$8aIi1,gm@0JFV02(gmJ0JG17+>ti+
+B;?+3_sU$BON#Y64F8Y2(g[B0JG17+>GW,/iGC;0JG1'3%cm-<Du1E:NC#ZDf-[bBlnVC:JqW/
1,pmD2)$^<0H`>0/i,@=0JG1'2(gR*<Du1E:NC8[DIdZ.7SF6u1Gg^=2_Zp>0H`))3%cpC0JG17
+?1u-+B;?+3`'7+@:Wqe@3@p'%14mF/i5@<0JG1'3&`HF0JG170H`5*0Ha@o5rqhRDKB5rDeri)
7mRRk1b^O@1,(C90H`>8/iGL>0JG1'2D-[+<Du1E:h=QcBji,U9FV=c0J5%50JG17+?)/10fLd?
0JFV-/heDJ;aEH@BPD9kA7]RrBPClt:dGNt1G^X@0JG170H`))1+k7<0JG17+?(o,+B;?+3`'L.
ASu4,+@00?$8aFh1c$g>0JFV/0J5%50JG17+>kc*+B;?+3`'O4FE:o6EbB&.:dGNt1c6mC1,(C9
0H`)*1+kIE0JG17+?1u-+B;?+3`'a8FDPB'A0=ZG%14mM/i>RA0JG1'2`E?G2)$^<0H`5*0Ha@o
5rqnX@q]^tDIakj5n+/W2_HjC0JG17+?);53B&WG0JFV,/heDJ;aEHBDddO%CLnVh5n+/W3%d'E
0JG17+>GW+/i>=:0JG1'3%cm-<Du1E;dj0V@;TRnFDi9h5n+/X0J5:A0JG17+>GT*/ibU>0JG1'
2_Hd,<Du1E;djKa+A?3ZAKX?SFEo!/<"00i3A*-D0JG17+?;D62)$^<0JFV-/heDJ;aEHC@;[2R
DKKf7Bl>+n=:GTn1+kLF0JG17+>GT0/hf4<0JG1'3%cm-<Du1E;djPd6tp4FD]hD5%14mM/iP^C
0JG1'0etL:1c$g>0JFV//heDJ;aEHC@;[2WEa`iqBldd&+@AF($8a[o2D?g=0JFV(1,:I<1GCL:
0H`>-0Ha@o5rqqU@<?U-AKY&?%14pN/iGXB0JG1'0ekU>1bpa=0JFV//heDJ;aEHCE,TN#DIjql
5n+/X1G1@=0JG17+?)220fLd?0JFV,/heDJ;aEHCH#d>'F`V+::0A#51GCF<1GCL:0H`>3/i,7:
0JG1'2(gR*<Du1E<+0TZ@;'(jF(Jo*7SF6u1,ggG2_Zp>0H`>1/iGL>0JG1'2(gR*<Du1E<+0W_
@3A$5%14mO/hf(80JG1'3AiEI3&!$?0H`8+0Ha@o5rqt`E+Nfn+A5WB$8XFi1,Ua>0JFV(0ek:7
1GCL:0H`;,0Ha@o5rqtf@rlR++@00?$8XRm0etF:0JFV02(gmJ0JG17+>ti++B;?+3`L6<F($1e
9+;4d0eP180JG17+>G]2/i#C?0JG1'3A*!.<Du1E<affTAU5Ib9+;4a3%d3F0JG17+?)530JY=9
0JFV,/heDJ;aEHG@<6*rDJ+'0DBM>7%14mK/iG[C0JG1'3B&QH1GCL:0H`8+0Ha@o5rr(]@q]Ru
@3A3A%14jI/iGR@0JG1'3&*$A0fC^>0H`5*0Ha@o5rr(G:`r5$%14mI/ib[@0JG1'3B/WK0JG17
0H`8+0Ha@o5rr(]@q]Ru@3A$JCi"/8<*0S:0eb4;3&!$?0H`83/ib^A0JG1'1bLX.<b6/[H?Ee8
@6-baEa`HdEt&I22D-[B0JG17+>#<%3%csA0JG17+>#N)0HaD1ATVctDE:0o+AQ?_B+52'0eP.8
0JG17+>#<%2(gjI0JG17+>#N)0HaD1ATVfuD)t3rDJs4u$8F4e2`39C0JFV$0ebL<2E*<D0JFV$
2_Hd,<bZ,eDIIBC;djBQDf.-oBQ%^*D@Hq-3%cm=0JG17+>u)00JG170JFV+/heDKBl[j#DBMMl
%14pI/iGXB0JG1'/MT4;0etF:0JFV$0eP.&=`n@qF)59.Bjj%jF^fB0G&D#0%14pJ/i,:;0JG1'
/MT1:3&<6B0JFV$0eP.&=`n@qF)59.Bjj%sDf^#/EX`@41G1XG0JG17+>#<-/i5@<0JG1'/MSk3
+B`i"Df]`'G%kAG;dj]TC1VR,%14pJ/i>C<0JG1'/MT.91cI*B0JFV$0eP.&=`n@qF)59.Bjj&$
E,961%14pL/iYO=0JG1'/MT+83B&WG0JFV$0eP.&=`n@qF)59.Bjj&+@:sUl@LWYr0f:R?1GCL:
0H_r&3%d!C0JG17+>#?$0HaP-D.73f3_X[;@;B9\$8""e/ho:=0JG1'/M]:<2_m'@0JFV$1+k7'
>%qh_@:FFl3^Rt*@<Z.*D[d%*0fUdG1,(C90H_r&3A*9K0JG17+>#?$0HaP5D.6p_G@`g4F_)[m
F_)!h3A<'>0JG170H`&%0JG170JFV'/heDCDfTr5+AcumAIStu3A<'>0JG170H`&%0JG170JFV'
/heDHDfp/8+AcumAISu'1bLRB2E!KJ+>u&/2).!I2_Z@2/heD8@;]La@6-_qBk1jfG@>T)EZe+U
%14sM/i5790JG1'/MSq31bpa=0JFV$0eP.&6tL7Q@<--E:Ln$SF(Gdf1c-gF2)$^<0H`80/iPLC
2E*<41bLI)6Xak@A77McARTanEaiHpCEQAN%14pM/ho%60JG1'2D?a<2E!HP0H`2)0H`_kDII'a
3`C<7DIn)9:/_T/1c$aD1G^gC0H`83/i#CB1G^^-1bLI)6Xak@A77N%@<-4'F`_:>:/_T/1c6mA
2E!HP0H`80/i#CB1G^^-1bLI)6Xak@A77MuEclD@+APiE$8aUm3&<?H1GBq01bLLB1G^g@+>b])
+@BRT@:We-6#C:HEcZ=F:/_T/1c6mD0fCpK0H`8//het50JG1'1bLI)6Xak@A77MbDKKT*Df091
BHU&K%14pL/iGC;0JG1'2Dd$H3&<?H0H`2)0H`_kDII'a3_"70A9f:m@<=+E:gnB[+AP64$8aUm
0K(gI2_Z@41bLX>0JG17+>b])+@BRT@:We-94`!_G%kc/AKX`H%14pL/i>UE1G^^-2DQmC2)$^<
0H`2)0H`_kDII'a3_j71+@g6VF(]E8+APiE$8aLj2E3KK1GBq20eP7<1G^g@+>b])+@BRT@:We-
7VQaQ@;I&^:(7Oe1G1[D1G^g@+?)843&NBD0JFV,/heD8@;]La@6.2*BOQ*n+AY`A$8aRl3AiKE
0JFV-1bLI<1G^g@+>b])+@BRT@:We-;fjW76ZR*ZGT]dkF"SS1;[j'g3A*9I1G^g@+>G`2/i5IE
2E*<40eb46+B;?+3_a%*DIFY\ARQ]P8IZ"`3%csE2E!KJ+?)&.2).!I2_Z@3/heDJ;aEHCFCf9)
@:iqcAKY#Q%14pK/i>=:0JG1'3%us@3&<?H0H`5*0H`_kDII'a3^[h%Ch[d"GAhD1+AY`A$8aRl
0K(gI2_Z@60J5=@1G^g@+>kc*+@BRT@:We-;flGgAn?%*+AY`A$8aOk1H70H1GBq13A*<H2E!KJ
+>kc*+@BRT@:We-=(-2^Eb'*4DBM_M%14pJ/iYaI2E*<42`WKI0fCpK0H`5*0H`_kDII'a3^dD"
Bk/>SF`)#(E$.qcF"SRE$8""n/het50JG1'2_ZjC0JG170H`2)0H`_rBl%?A9OVub6XahN@;]Lp
+AZHf/e&.E1G1F:0JG17+?2).1H70H1GBq//heD8@;]La@6-hnB5)6qBk;*k+AZHf/g*qb%14mF
/iGC;0JG1'0ebC93AiKE0JFV-/heDJ;aEHDAU%X)+B*AjEZe1eEccRL<*0S:2)6d=0JG170H`)(
2(gmH0JG17+>ti++@BRT@:We-;f$#RAoD^#+AZHf/g+(c%14mG/ibdC0JG1'0ekC82D?g=0JFV.
/heDJ;aEH;BlnG>:h='N+@00?$8XOl0fUsF1GBq+0ek:=2)$^<0H`;,0Ha@o5rq\XG@bT,+AZHf
+@00?$8jRk0f(UA1GBq+0ek:>0fCpK0H`;,0H`_kDII'a3^IRkATDm$+B*AjEZe1eEccR9$8XLk
1,C^B1GBq+0fCXC2)$^<0H`>-0Ha@o5rqnXG%G]8Bk1ct<)"K&Df0/>+@AF($8XIj1Gpj?0JFV(
0fCXD2E!HP0H`>-0Ha@o5rqhNCi=0!EZe.eF"SS&5n+/X3A*$@2E!KJ+>GT2/iPRB1G^^-3%cm-
6Xak@A77MnDfor>+A6W^@<E\Z6OaAS1-$sB2)$^<0H`;./iPRB1G^^-1bLI)6YL1MANE8&Ec5o.
@;[2d/g*r!Et&I52(g[B0JG17+?)/13&i]M1GBq//heD8@;]La@6.>(@<-H4;e'`bAKXcXF"Rn/
1c[0H2)$^<0H`)(3A*0D2E!KJ+>ti++@BRT@:We-;c?Uk+B(oB$8aUm0JPID2_Z@41G1[G2E!KJ
+>b])+@BRT@:We-:2b;a+@T^[F<F=W%14pK/iP[H2E*<42DZs@0JG170H`2)0H`_kDII'a3_aa<
EHQ21DdmX!F<F+`EX`@41bLO>0JG17+?)221c[HP2_Z@3/heD8@;]La@6.%qDJ+$4Df-[n:(7Oe
1G1ID0fCsE+?);53AN<I2_Z@3/heD8@;]La@6-qfD/!g.Df-[n:(7Oe1G1RA1G^g@+?);53A<-@
0JFV,/heD8@;]La@6-niDfTK%FDlA@+AY`A$8aRl1H7?M1GBq12D-gF1G^g@+>kc*+@BRT@:We-
8T&]_Eaa!6+AY`A$8aRl0f:aC1GBq12_HpC1G^g@+>kc*+@BRT@:We-6=jtLAThd(Ch4_b:(7Oe
1G1C91G^g@+?);50K1^E2_Z@3/heD8@;]La@6..t@:s"h@3A$JCi"/8:JM?+1c$a@1H%-M0H`>/
/i>CA0JG1'2(gR*6Xak@A77N#@<?($Ci=57:JM?+1bp[D2`!6G0H`>1/i57:2E*<42(gR*6Xak@
A77Mt@<-7"@3A?@%14pP/ib^I1G^^-0ek[@1H.9L1GBq2/heD8@;]La@6.%mCi=N8@3@m(%14sK
/iYgJ0JG1'0etL:2E*KI0JFV//heD8@;]La@6.5*Bl7El+@g!]EbAr+6:21h1c-gC0JG170H`82
/iPXA0JG1'1bLI)6Xak@A77MeBkLn#+APiE$8aRl0JbL@1GBq01bL^A2E!KJ+>b])+@BRT@:We-
9PJZ]Ec>r8C`lJO%14mJ/het50JG1'3&*$>1Gpj?0H`5*0Ha@o5rqAOCisT(Bji,_6OaAY2(ggH
0fCsE+?)842D[<K1GBq//heDJ;aEHB@;KLhB4rD_6OaAY3%csD1G^g@+?2522`3QN1GBq//heDJ
;aEH<Dfoc8G%kc/AKXWK%14mO/ho7=2E*<43&E6E2)[?O0H`5*0Ha@o5rqAIDI[BuDIIX$+AYN;
$8X[p3ArQF0JFV/1G1@80JG17+>kc*+B;?+3^[h%F_tT1F!+7L%14pG/i#@A1G^^-2`<9J3&NBD
0H`5*0Ha@o5rqPFEcPl8@Wc^(+Ab?5$8XXo1Gpj?0JFV/0eP@?1G^g@+>kc*+B;?+3^[RhEbo<.
FDl%>=&ob;1bp[A2)@$E0H`;1/iPXG2E*<42(gR*<Du1E6#:"=DL!@"=Ub]p0ePF@1G^g@+?)#-
1cI3H1GBq//heDJ;aEH@Ec6,8A7]XgAKXlB%14pK/iYO=0JG1'2E3<J2`NTL0H`5*0Ha@o5rq>@
DJ*m.+AG96$8aOk1,([D1GBq10eP=>3&<?E+>kc*+B;?+3^[h'@rHBu+APH:$8aOk2E!9J2_Z@5
0J5+<2E!KJ+>kc*+B;?+3`'a8FDPB'A0=T8%14pK/i#==0JG1'2_m!C2`<QQ0H`5*0Ha@o5rq_Y
DKKi/Ch[I$+BDGN$8XFi1-%<M1GBq30J5(>2)$^<+>ti++B;?+3_EgjCNFE3+AGcD$8XIj2)6mE
2_Z@62D-sC3&<?E+>ti++B;?+3^RP$D/!m#BOPa#5th^p1Gg^C1c@6N0H`A2/i#CG1G^^-2D-[+
<Du1E9PJTjCh4_eDe!Q*5t_Xo1H7!F1,_$L0H`A0/ho@G1G^^-2D-[+<Du1E;fjW79Q,&fF!+1U
%14mG/iPXI1G^^-3AN3C1c$pD0H`;,0Ha@o5rqGN+AcKfD]i"]%14pG/iYO=0JG1'2`E?I2E!HP
0H`8+0Ha@o5rq\RDI[U$DBM\C%14pM/i>XF1G^^-0ekF90JbR?0JFV./heDJ;aEH8ASbpq@3A9D
%14pK/i,CF1G^^-0eb:61GpmF2_Z@4/heDJ;aEH@Bk;=*AKXo>%14pM/iYOE1G^^-0eb:62`NTL
1GBq0/heDJ;aEH2Ble-"Earl-:.,Nu1H@'F1GCL:0H`))3A*9G1G^g@+?1u-+B;?+3`9O,D]heU
%14mJ/ho%>1G^^-0ekU>1,q6L1GBq2/heDJ;aEHC@;[2SATDZsEb&m%D]hD5%14mL/iPUH1G^^-
0ek[@2`EHL2_Z@6/heDJ;aEH6Eb0<0D]hD5%14mM/i,:C1G^^-0etI93&rcN1GBq2/heDJ;aEHC
@;[2[Df]J46U;.g1,1C;0K(gJ0H`)-2_I'I3&<?E+>GQ&0Ha@o5rqPTDJs?6Cipjk8IZ"b1bLaD
3&<?E+>G]3/iPLC2E*<43A*!.<Du1E7U^"O@UX.iF!*bA%14sP/i,192E*<40f(X=1bpa=0JFV0
/heDJ;aEH:F`(c!FW`tC%14sK/i>L?0JG1'0ekI:1cI*B0JFV./heD8@;]La@6-hfD/X<6Df-[`
64F8Y1bL[G3&i]J+>u#.3&3?N1GBq./heD8@;]La@6-\`@V'g-;JBZSAKXcXF"Rn/1c$aB1c@9N
2BX_/2D-dE2*!KL+?(o,+B;?+3_a1+Bk1pdD@Hq01bLUC0JG17+>GT)/iYUG1G^g02D-[+0JG1A
=_2DcDg-8EDf0+q$8""j/i,=?0JO\%0f(O:0JPRE0d&&./i=b*0JGOfCisc@%14dA0JG170JFV'
/het50JG1'0J5%%%16u]F(&EdAScHs?Z]XlA26(q/M.D=@<H[*DfRl]7P5fPF)Y].@;?;ZA7]gl
EbTK7Bl@lM+B3#gF!,1<+AP4$6!PdY+E(k(Bk(jcC`mS5Df-\:BOPsnF!,F1B4W\)$>X3uGAhM4
F#kFT@r,juF(HmFCisW(E\&>MDf9ME+E2"&F(KDD+EMI;@<*nAF*2@O+EVOD@;HA[FD5i5ANCr/
5uU&l/KdGmCij).<"00d/M.D=%14=&>>@I_5p.RN@<?4%DII?(6"P(TDII[0Bk)3,@;]Tu;fH/T
AKX9LD/!m%F*)G2FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6Dg!c_%13OO,9n=?Gp#RsARloPF)Y].
@;@D:7oMlE+Acl_DImouEd8d+H#n(=D0$gn@:F.q@<?F.Gmt)i$6pZaBleB7EbT#lC`lbeCis<1
+E(j76tL1V@3AMl.*e&V.3K',%14=)+@0OHE-,Z%+D,Y4D'3(-7VR$W+AHQdCh7L%Bm"886XakN
DBNk0+B*2p@<*JZ@r,juF(KDt+s:,p7<<EZDII<'@;]Tu9k@mYF'Mun%13OO<+ohcDfT<$FCAu.
E,Tf3FD5Z2F!,C5+EV:.+B*E#+CT.u+AHcmDBNt2EHPu9ARlomGp$[.Ch[j0AISucEb/cq@ruF'
DK@?O@<,p%@ps1`F_kK.ARlp+F(oN)+B2omEb0<6EbSru+@LKm@;T^g@;I&cBl.E(-r`S`%16QU
@psM$AKY]/+DGm>@3B]1BkD:(D'3q7D.Oi2@ps1b/g*]'G@br/E\&>WDfTZ)+EV=7AKZ;;DIml3
@;]TuA791gGmt*sBkCp!@<,p%@UX=hA0>f.+B<;nG%G]8@;I&cBl.E(-rj4q/g*`'+E):2ATAo8
D[d%`Df0`0Ec`F8@r,juF(HJ5Eb/cq@ruF'DK?q4Ec5e;<(%jND]i%Z/0K%JAKYMtAnGUpASu!h
+C\o(G@b?'+EV:.F(GdfFE_XGFD5T'+EM%$Ch7Z1D09oA+C\n)CMn'7DD!&2BOr<*@<,dnATVL(
+Co&"FC?b#+=PO"<%/r(F!,R<AISuTEbTW/D.Rg'@j#;rAnGUpASu!h/0JYE+EM+(Df0*,/0JD5
FE_;-DBO%7AKZ)=D]iJ03XlE*$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VfPPZ/bg
+B1`O/Ke%m%13OO:gnEe+Eh10F_,V:De:-;PZ/c8@;[2sAKYMpA9DBnA0>K)Df$V=BOr<"BleB7
EbT#lC`mb0@rHBuF"SS,D@Hql@<-I(@s)TrE\&>HF`(`1ARoj)De:,'@r,juF(HJ4@WQ+$G%#K,
Df0V=-t7+:BHVA7Cgh?,@;]TuCisW(E[`,TATD>k$?B]fDfTB"A0>T(+D"u%Cj@-lF`MD>ARTI-
+AHQ\A8Gg"7:C7ZATDZ2@;]Tu6YL1OATME*@;]skCi_-:$>j3hF`V&5BlJ08/0JA=A0>AjDJsE6
/g*`'+EML9FCcS5Afu2/ASH0-Eb0&qFD5o0Cj@.>Dg*=CEb/`pF(oQ1/.Dr.BOu6r+Cno&@3BT%
E,oN2ASuT4FD,5.Df0B:+D#_1A7]XgAKYT'EZfI;AKZ/)Cis;3De:-;PZ/cEEbTH4+EVNE0fC^>
%15Hk/g*`'+EV:.+Ceu#FEMV<ATJu+Des6.GA1r-+EV:.+DG_8Ec5K2@ruF'DBNk0+EV:.+EV12
ATM@"E+L.?@qfsn@1<Pu2D@-66U`FT+EV:8F`Uu/A9/l3Aftc$B4rE-F^]*#FEo!I@WQ+$G%#K,
Df0V=BOQ'q+C\nnDBNe)A7Zm%Afto4DIIPp$?'EaF_l/.FD5Z2F!,C5+EMX5EcWiU<+ohcDKTf*
ATAo%DIaku@q0Y%@:OR*De:,6BOu6r+EV=7Bl7R)+DG_'Eb/[#AISuYEc5e;FD,5.F(KN+DKKH$
DKKP7FD,]5F_>A1FD,5.FE_;6FD5<.BHUerDKL#AGq:(HAnGt%A8,po+Eh10F^\`qAISuW@<>p#
Bl5&8BOr;sATVL(D/!lrFD5Z2+E(j7cBM9\+@.,\ATV?pCh7-"@;]LiH#m\@+E(j7FD,6,AISu`
ARTY&Eb0*!DKKqBAnc@/ARlp-Bln#2@s)6p@j#i3Ch[cuF!,(5EZiYl<$5dnDf$UK2)$^,FDi9P
0f_*F+DGm+$?1#sF(K62ARlotDBMne@VfTu0d'nBA0>T(@r-9uATJu9BOr<-FCB&t@<,m$ATDg0
EZet4EZeq%@q[!.@;L't%14LXDfTl4F)Pq=@;]Tu;flSiBOu(&Df.*K1,(C=.4u&:%13OOIXZ_T
$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%16'C@VfTu0d&%j<affeATJu4Ag#B`<$3;++<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd9$:JHGBm+&u+D,Y4D'2A`F*)>@Bk(Rf+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZUARfY!
A9/k9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$8!h]/M/P+/M/P+/M/P+
/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P++>#/s/M/P+/M/P+/M/P+/M/P+/M/P+%166L
@<*J5+<VdL+<VdL+<VdL+<VdL+<\so<*UOg+<VdL+<VdL+<VdL+<VdL+<Ve*FCB&t@<,m$7<3Ee
Ea0%\+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<VdL+<VdL.!&s0Df0*,
.1HV9/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=/N#49+<VdL+<VdL+<VdL+<VdL+<VdL0fLgI0H_J\+<VdL+<VdL+<VdL
+<VdL1c$fp$8"(g0H_J\+<VdL+<VdL+<VdL+<VdL+>G`21GBpo+<VdL+<VdL+<VdL+<VdL+>Z#3
%14[C0JFUl+<VdL+<VdL+<VdL+<VdL+<WBq0K:a/+<VdL+<VdL+<VdL+<VdL+<WHu0F\@@1,(C)
+<VdL+<VdL+<VdL+<VdL+<Vd]1,h3I+<VdL+<VdL+<VdL+<VdL+<Vd_1GB7F/MSq5+<VdL+<VdL
+<VdL+<VdL+<VdL0ekRC0H_J\+<VdL+<VdL+<VdL+<VdL1-%#t$8<SF+<VdL+<VdL+<VdL+<VdL
+<VdL+>GQ-3%uHt+<VdL+<VdL+<VdL+<VdL+>Pi/%14gD0H_J\+<VdL+<VdL+<VdL+<VdL+<W[&
0JFUl+<VdL+<VdL+<VdL+<VdL+<WEr0F\@E0JFUl+<VdL+<VdL+<VdL+<VdL+<Vdd2Dd*1+<VdL
+<VdL+<VdL+<VdL+<Vd^0ea%D1GCL*+<VdL+<VdL+<VdL+<VdL+<VdL2`<WL+<VdL+<VdL+<VdL
+<VdL+<VdL0fUir$8aFj+<VdL+<VdL+<VdL+<VdL+<VdL+>u/40H_J\+<VdL+<VdL+<VdL+<VdL
+>Gc.%14sH0H_J\+<VdL+<VdL+<VdL+<VdL+<WO#0ea^m+<VdL+<VdL+<VdL+<VdL+<WBq0F\@I
0JFUl+<VdL+<VdL+<VdL+<VdL+<Vd`2`*32+<VdL+<VdL+<VdL+<VdL+<Vd]1,'.E2_Zp.+<VdL
+<VdL+<VdL+<VdL+<VdL1H7*C+<VdL+<VdL+<VdL+<VdL+<VdL0eb9j$90^n+<VdL+<VdL+<VdL
+<VdL+<VdL+>Pr80H_J\+<VdL+<VdL+<VdL+<VdL+?2%a$99do+<VdL+<VdL+<VdL+<VdL+<VdL
+>P]+0H_J\+<VdL+<VdL+<VdL+<VdL+?(t`$8F4g0H_J\+<VdL+<VdL+<VdL+<VdL+>G`40H_J\
+<VdL+<VdL+<VdL+<VdL+>l"c$8F7h0H_J\+<VdL+<VdL+<VdL+<VdL+>GQ10H_J\+<VdL+<VdL
+<VdL+<VdL+>bb]$8F:i0H_J\+<VdL+<VdL+<VdL+<VdL+?),2+<VdL+<VdL+<VdL+<VdL+<VdL
+>Y\\$8F=j0H_J\+<VdL+<VdL+<VdL+<VdL+>c)4+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8F@k
0H_J\+<VdL+<VdL+<VdL+<VdL+>Yc,+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FCl0H_J\+<VdL
+<VdL+<VdL+<VdL+>PW)+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FFm0H_J\+<VdL+<VdL+<VdL
+<VdL+>GW*+<VdL+<VdL+<VdL+<VdL+<VdL+>PV[$8FIn0H_J\+<VdL+<VdL+<VdL+<VdL+?:Pe
+<VdL+<VdL+<VdL+<VdL+<VdL+>jT80fLsD+<VdL+<VdL+<VdL+<VdL+<VdL0f'pp+<VdL+<VdL
+<VdL+<VdL+<VdL1(=RF3&!$/+<VdL+<VdL+<VdL+<VdL+<Vd]1a!n`+<VdL+<VdL+<VdL+<VdL
+<Vd]%14gL2)$-q+<VdL+<VdL+<VdL+<VdL+<WTc+<VdL+<VdL+<VdL+<VdL+<VdL+<XoO0b"IE
3A<-0+<VdL+<VdL+<VdL+<VdL+<VdY1E[e_+<VdL+<VdL+<VdL+<VdL+<Ve34>@9P0f_*F+<VdL
+<VdL+<VdL+<VdL+<VdL1-$I"+<VdL+<VdL+<VdL+<VdL+<VdL>Wa\m0b"IA/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
IXZ_T$4R>6DBNe7A7]e!+EV=7ATKCFFD,5.A7]joEc#N.@<?4%DBNk0+O63N+DGm>D.-sd+E_a>
DJ()#FDl#1@j#8tDe!R(+CT.u%17,aA8,s)Ddmd!Ectl5Bl@m1+E(j7EHP]2@<-E?+EMHDBlkJ3
F!+t2D/a<&FCf96+DG_(AT23uA7]Y#+E(j7FD,4p$>aj&@<*K%E+ig"ATDL+/g+,%@VfTu1*C4D
G%G_;FD,5.G%#30AKYo'+O63N+D#_-Ed8d>Bm+&1H"CE)F!,(8Df#pj0f_*K+EVNE1,(C>+=KNs
FE2;;Df'2u@;I&PCi*Tu@:LElDfQsU0JGC9+E1b%AKXW+.4u&:%13OOIXZ`p%14[=/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%d@:F%a+>P&k+Auc\ASuT4+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZY
@;L'tF!,C5+O63N+D,Y4D'0rD+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#6tp[Q
@rrh9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:L\BVEctl5
Bl@m1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#/M/P+/M/P+/M/P+
/M/P+/KcVs/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/O`
$<^qKEZcJI+<VdL+<VdL+<VfPPZ1m1+<VdL+<VdL+<VdL+<WNn=_2#^+@BgNDJ*Nc+<VdL6$?g[
@:s.V%144#+<VdL+<VdL+<VdL+<VdL.!&s0Df0*,.3K`U+<VdL+<W(RARfXrA901B+<VdL+<VdL
0eHO>@<*JXBOPdkAR#ZO+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<W(RARfXrA901/$8!h]/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P++>#/s
/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+%14gM2)R!?+<VdL+<VdL+<VdL.l/n40d%S]
+<VdL+<VdL+<Xo@+<VdL+<VdL+<VdL+<VdL>V-Bl0f_-G/heCj+<VdL+<VdL+<W0j1G1F*+<VdL
+<VdL+<VdL1+k:(+<VdL+<VdL+<VdL+<W?j1boLI0f_-L/heCj+<VdL+<VdL+<W0j2(gg1+<VdL
+<VdL+<VdL1+kF,+<VdL+<VdL+<VdL+<W?j2)#IH0f_0H/heCj+<VdL+<VdL+<W0k0J5+'+<VdL
+<VdL+<VdL1bLX.+<VdL+<VdL+<VdL+<W?j3=Q<M3B&fJ0H_J\+<VdL+<VdL+=f9+/i=ao+<VdL
+<VdL+<Vda/i+Um+<VdL+<VdL+<VdL+>GK&2@U!J3B/]F0H_J\+<VdL+<VdL+=f<'/i=ao+<VdL
+<VdL+<Vda/heCj+<VdL+<VdL+<VdL+>GK&0F\@D3B/lK0H_J\+<VdL+<VdL+=f<+/i+Um+<VdL
+<VdL+<Vd_/iXsr+<VdL+<VdL+<VdL+>>E,2@U!J3B8cG0H_J\+<VdL+<VdL+=f<-/ib$s+<VdL
+<VdL+<Vd^/iFgp+<VdL+<VdL+<VdL+>>E*1(=RF3B8rL0H_J\+<VdL+<VdL+=f?(/iXsr+<VdL
+<VdL+<Vd_/ib$s+<VdL+<VdL+<VdL+>>E,3"63M0JG150H_J\+<VdL+<VdL+=f?+/iXsr+<VdL
+<VdL+<Vd_/heCj+<VdL+<VdL+<VdL+>>E+0F\@E0JG@:0H_J\+<VdL+<VdL+=f?,/iOmq+<VdL
+<VdL+<Vd\/ib$s+<VdL+<VdL+<VdL+>>E&3"63H/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=IXZ`p%13OO<+ohc@<Q4&
@:s-o@;]t*@;I&rBOPdkAKYo'+O63N+Eq78+>>E.3?WBS@rH6q+D,Y4D'1Pn2DlV!D]gbp3%uro
$:o)ZAThX*/0K%JAKYE)ATD3lAKYE!DKTB(+DG_'Eb/[#AKZ2*F!,4?F*&NY/iGL.F(Jj"DIal%
Ec5e;0f_3N+EVN2$8O:h0J">TDIal.DJXS@0J5(>+EM+(Df0).Ao_g,+>PW)0HbIU+>PW)2(g"@
F`_bHAKYJr@;]^hF!+n/A0>u7ASu%"%16fe+O63N+Ceht+Du+>+C\n)E,oN#Bk)6rA0?)1FD)e,
ATDm$Bl8$<+EM77@q?d)BOu+&ATVWr@;I''De*EqF!,C5%172jAKYr*H#m\0@;I&r@<HX&F!+n3
AKYl/F<GL6+D>J%BHUl(Dfo]++E2@4@qg!uDf.0M7<iop@;p.$@<?4%DK?6oAo_g,+EV:.+EV%$
Ch4`5ASGdjFCeu*@X0)<BOr<&Df021E+O'(De'u4Eb0-!+D,Y4D'3q7A799s@WGmmBl7Q+De9Fc
FD,5.9lFrf+E(k(ATAo6ARTXuDII!jAKYQ*FD5T#FCfM9De:+B2E)b"ARfXrA9/l-DBL\g0eb.$
.lfC.F(Jj"DIdet$>FB#1,(R>/0HGu0JahmARfXrA9/l-DBL\h0JG%#@;]Tu.l9(<+EM+(Df0*,
+DG^9FD,5.H"CE)+>P]+0J3eA%15mRFE;/,AKZ).AKYr'EbTH&+E(j7Ddmd!Ectl5Bl@m1+=K*$
0H`\L73H\j+>PW)2'>7T.4cT`BOr<0@;L't+E(j7cBM9;$=dL^+C\n)AU&<;@;p.$@<?'k+D,Y4
D'3\,@<6R3ARlp,@;L'tF!,UHBl7Q+FD,5.Ci=3(/TbQED'3\,@;ZM]E+*cq@W-'s@j#l6ASu$>
%13OO%144#+<VdL+<VdL+<VdL+<\so<$4=H/M]"&.j-W'+=\LU?8<XEARfXrA9/1e+<VdL+<VdL
+<VdL+<VdLGA(Q.ANCqVF<E^h.!]B4E\0"*1,(.10eb9j$4R>.+EM+7Bk;?.De:+rE,TQ<DJsB+
@;I&tG]7\7F)u&6DKB)3BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_@psI:04\X1FCB91
Des\OBQS*-.3N;4G%D*i@V'+g+Co&(Bm+&u+D,Y4D'3q6ATME*A79Rg+EVNEF(oK1Ch[L,+EV:.
+D#_)Cis0.Bl@l3De:-;PZ/c;DfQt/DKuZuFD5T'+CoV8Bl7Q+FD,5.Bl8$(Ectl-+>#<.3B84(
D]gPd0JG15+B3#c+Bru+@qB\&@;0V$Gp$g=%1:CF<*^ncFEDJC3\N-t@r,juF(Ht:F(So7DIITp
/n]*G02k;L@<=@[F`(]#Ecb`(DKL.VBQS*-.3NPPATAo8BPDN1E+O'(De'u#@;[2sAKYQ*FD5T#
FCetl$>+<sD'3n0@<?U&EZf(6+EV:.+Dk[uF*2M7D.RU,F"SS)DfQt/A7TCrBl@ltC`mG0AoD^,
@<?4%DCcoOAS!n3$<oo0Cij).<$5UeA0=liBm+'.F(&l-<,$2\>psB.FDu:^0/$mHCh[j0AM.V:
An*H2@<5j0B5_rH;akA2CiD%<AScHs<%_j+D/:XR%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO=)W+qA0>u.
D.Oi9Df0--+CT;%+CSc%F^]*&Gp$R)F(Jl)Df-[bDf9Z,Bl7@$ARl5W<GlMoATDj#C`l\kD.Oh<
<E)=7/g*`-+DGm>@;[2rFDl#1@j#l-D.Oi2H#@,*Ec5i0H=^V0@;]Tu@:X+qF*(u(+EVN2$?L;t
Gp%<FFD,B++>>E.+EM+(Df0*,+E(j7@<6O2Df0K1Bk(RfCj@.6ATVL(D/!m!A0=liBm+'.F(&l-
<,$2\%14L`<%0FB:LdmCF(oQ1@;Kb*/0J@D>U!uq@;m?1ARfXrA6^<$BlbD*A7T7^+EVNE<E)=.
FDi:;AS#g'BlkJ3DBO"GDIX+_GA2/4+B;A`.!K?=@qZupBOPdkATJu)F_)\;D]j43EbSs(Bl@m1
+DG^97:C4YBNup++EDCB@<?4%DBNt.FCcmR%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO,9n=/AS,LoASu!h
Et&Hc$;GGZEbTT5DCco(/g+S?A0=fmAT2<oDKB`6/0ID7+AsgC+C$*]BleB7EbT#lC`lbeCis<1
+E(j7FD,5.7:C4YBNup+%15I=De!Q*7<3EeEZiYl<$5UeA0>u-AKX?KCh%U(@<?4%DBNk0+@TdV
BlJ-)F'Kn?+A+7/883-e/g*H$FE2;;/hA,GDeq$8$8XO^:gnBd+>YPk6$6g_F*&N[0JG=7+AQi-
+>GW*/0JnN+>Yc3/Mf1@+=K!!0Jk42%13OO;flSiBOu(&Df-[e/lEg#DIak\Dfol,ASrVb/jV*@
+=][!CghB-De:+_BleB7EbT#lC`l/VCh[j0AKX]UE-!K[%15I2D.7O"A7oHr<GlMo/l6S"F)rrb
+@BRS@WH0nB4WV:0f_3O/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$8O:h2]th'Earc*1,j)ZF(&EpDes]:
Df'2sCgUauE,oN2F(oQ1F'iNtEaN?gCij)mFC/lq1,gF#>>@I_5p.RN@<?4%DII?(6"P(TDII[0
Bk)3,@;]Tu;fH/TAKX9LD/!m%F*)G2FD5Z2.:"?8FEDI_0/%NnG:mcAF($\6Dg!c_%13OO/Kc/Y
>?aX:D.R!$BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22Ft[E:Ch[j0AM.Y<D/:Y,%13OO,9U2Z
@r,juF(HIqARZc\Blmol-tm^EE-"&n06;&J@<-F7F*(u1/oG*=@4l22Ft[E:Ch[j0ATKM<Df'&=
.1HUn$6pc<@X0(cEb/c(7<<EZDII<3+@f@"6Qf3A@;]Xu@<-W9;gEG+ASlK29OVCKEaa'.Ed8*$
%14=&:iC/qDJsB+@;I&TG]7\7F)u&6DK?q4DfQsgAScHs+B0I3cBM9W+:SYe$<q1cFDu:^0/$mH
Ch[j0AM.V:An*H2@<5j0B5_rH;akA2CiD%<AScHsFDu/7Gqq'-1bNH`D/<K+BQS?8F#ks-ARfOj
E-#SCB6.Zp/oG*=@4l22FtZc_BOu"!04\X1FCB91Des\S0JG=9BQS*-.1HUn$6pc<7VR$W+AHQd
Ch7L%Bm"886XakNDBNk0+B*2p@<*JZ@r,juF(KD8>['X<E+NoqCER&'A0=TXAT`'!>p'R`%16*V
Bl7Q+FD,5.cBM9NG%#30ATJu)ATDL.ARloqEc5e;FD,5.BPDO0DfTQ%@;I',ARfY!A0>;uA0>K)
Df$V-Bl[cpF:ARq@WQ+$G%#K,Df0V=.!&s23ZqX+@:F%a+>I.MBQS?8F#ks-ARfOjE-#SCB6.Zp
/oG*=@4l22FtZNX@psI:04\X1FCB8DBQS*-,BR@'0e"4S$=Rg_+BqfR@VfTu10l;AFEDJC3\N-t
@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=FCAW6.3L&j+CQC6ATDKrF!(o!
De:,2Des]:Df'2sC`m;6E,oN2F(oQ1F!,.)G%De*AS#a%@rc-hFCeu*FDi:CBl.g*BkDW5FD,5.
AThKuF^]B+Df-\9Ag#B`<$5dkEZee.Gp%3CD.Oi#F`M26B+52iBOr<#DKKH1G%#20/MT7G3?WE^
+=f6%0JG*g$4R>DAKYMpAnc-o+EV:.+Co%nBl.9p+F.O,EZeU2H!DO9@<3Q'Des6.GB5eS$4R=b
+<VdL+<VdL+<VeP+?^imARTU%.j-6WDf0Z1+>"]i/i>(20es1F%16'JBlbD0Bm+'/+C$+9>Tt;&
DfQtBBOr<'Bk1ajAKYo'+EV:.+Dl%7FD*3JGA(]#BHV#1+CSbiF`Lo4AKYQ%Dfo]+%16`^G%GP6
FD,5.E,oN"Ble!,DBNY2+EV:.+DYk5GA\OH@;L'tF!,C5+O63N/g+,,AKYT'Ci"$6Bl7Q+E,TQ<
DJsB+@;HA[AU&07ATMp,Df0V=@ps6t@V$[)F(Jl)@ps1`F_kK.AKZ).AKZ/)Cis;3De:-;PZ/bR
Bl5&7ARfXrA901BDg#]4+EV:.%172kD.Oi/ATDL'A0>B#G%G]*A0>?,+E(j7FD,5.>=N=MAKX]]
Ci![#DJ=61+@BRTDf-\9Aft#jCgh?,7:U.JE-#T33XlEJ0f_6S+EVNE.l/k50O6)?FEDJC3\N-t
@r,juF(Ht:F(So7DIITp/n]*G02k;YF^fDF2,-G:74r7qD/:XR%13OO6=jbIEb-A8BOr<3ARTU%
/N#49/0JG2Ch%U(@<?'A%13OO+<VdL+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+E_!G%144#+<VdL
+<VdL+<YlAATD?C+<YeL4Wl.u/MT4?0I\Y00JEqC%15F5FE_;-DBO49@<-E3/N#49+CT.u+=f<'
0J">jAKZ,:AKZ).AKYMlFC?;(Ec5e;>?#$?Ch4_D>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0
B5_rH9LWH"F>Y^^AScHsF=q6KD/:G=@:Cr?/0JMK@qBV$+EV:*F<G16EZfI;AKZ80@<*JB2)$^,
G@_n,BOPdkARl5WFD,5.G%#30AKW]d0f^p1FDi9V2_m'C/iOneDBNk<A7]d(FDi:1G&M)*+CQC'
Bldd&DKKT1F_PrC+EqOABHVD1AISucEb0E.Dfp+DAoD^,F_kJ/@<<W6BOQ!*AT2QtBJ(E,BOr<0
@;L't+D,P4+O63N+DGm>B5)O#DBND6+CP]dE,TQ<DJsB+@;I')Afu2/AKWmQBHUhsB6%Qp/0K.M
Bk(g!Eb031De+!#ATJu9BOr<0@;L'tF!,17+BqfR@VfTb$8Gg7/hSeU7:TbJ2(rKOCij*-/nf?D
Ca4%1@PK;SGA2/4+CT.1ATDg0EZf7<F<GC.EbAs(+EV:*DBLbYF(Jj"DIdfL%13OO+<VdL+<VdL
cBM9N4WlI52)mBE2BXRo0eb==/i5:*.NijV.j-W(/iPaG0eje#+E_!G+>"]n/ibdE0JtX/.Nik?
1CX[6+<VdL+<VdL+<VdY+>>E&2`WiS2)6:(+E_!I+=eQg/hf%90fLpD3AM^,+E_!J+=eQg/het>
0JbFA2)6m/.Nik?2BWG9+<VdL+<VdLGA(Q.ANCrV+?^im0/5.7%13OO6=k7_AS#a%H"CE)F!)tj
0JFVXDIak?0fC^>/0K.J+CSnkBl5&9F(HJ9BOr;s@<>p#Ao_g,+:SZ^<+06PAKW^5-tm^EE-"&n
04eX0BlJ-)/n]6;@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-/nf?DCa4%1@PK;SFDi:4ATDL.AKYD(
E,TQ<DJsB+@;I')Afu2/AKWmQBHUhsB6%Qp/e&-s$6UH6+<VdL+O63N+?^i%2)d?E1*A.k2)R9E
0JO\"+E\eW+?)#-1,CaG1*A%hF^?gG.j-Mu1GLmK3&)O*+E_!H%144#+<VdL+<VdL+<W6Y0J5=B
0JbOD1E\.iF^?mI/Kc`"0JG@<2)%$N3$9[nF^?pJ.j-Mu0JGIB2)d9E2_uR++E_!K%144#+<VdL
+<YlAATD?C+E\ei+=MLe0eb:8.5*D00F\?u$:8<GG@b?'+F.O,EcW?R0fC^>+CT.u+=f0*0JG%#
@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H0etF*/Kc`"3B/]P+=\LU+>"]i/hf";1GU(&+EUpF
+=eRV?8E]W+?)#13=Q<<+<VdL+<VeNBOu3q3ZoPe+?^im+>"]j2D?fo$4R>/ATW--ASrW9ARTV#
+=f0*0JFVXDIak?0fUj@/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4Wl^:3&;[-+>>E&2D?p0
.NigU/Kc`"0JG@E1,q-6.Nih>1*A(i0J5%50JP@>1H$@*+EUpG+>"^X?8NcX+>GT01b^U;%144#
+<VdL+<YlAATD?C+ES_h+F,(]+>Gf/0F\?u$:8<GG@b?'+F.O,EcW?R0fUj@+CT.u+=f0+2D?[)
@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H0f(F@1*A.k0J5.;1,LgH+=\LU+=eQg/het;3&WKH
+=\LU?8<WR+>>E%0JkL=0fC.(+EUpG+>"]i/het51H.-H2BXIlFC$dH%144#+<VdL+<VdL+<W0W
0J5%50JG4:0et[C+=\LU?8WiW+>>E%0JG170JPIG3?TdoFC$jJ.j-Mu0JG170JG170K;!K+=\LU
?8i<#+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3&!#q$4R>/ATW--ASrW9ARTV#+>Gi60HaeAA0<Te
0JG%#@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H2_I!D+=eQg/i>RD2]sRmF<E.X0J5+<0fLsH
+=\LU?8<WR+>>E%0fD!F2E!N;.Nih>1CX[6+<VdL+<VdL+<VdY0J5%50JkUF1H%!F+=\LU?8NcT
+EUpI+>4im1G^aE1^sd7+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc-2D>RI%15F5FE_;-DBO49@<-E3
0f^pA+CT.u+>Gl30J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i!1+kLG+=eQh/i5RF0ek[2
.NigU/Kc`"0JtjM3AWZ<.Nih>1*A(i0J5%52DI3M2BXIlFC$aG/Kc`"0JG183B&'1+EUpH%144#
+<VdL+<YlAATD?C+ES_h+F,(]+>Gl10F\?u$:8<GG@b?'+F.O,EcW?X3AN92@;]Tu0f_'F/0JG2
Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N4WlL7/i#+'.j-Mu3&EHP1FdJh/Kc`"0K1mE0JFV!+EUpF
+=eQg/het70KCpI+=\LU?8E#t+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3AN8t$4R>/ATW--ASrW9
ARTV#+>Gl50d'nBA0<Te2DHa*@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H1-$s@2]sUn0J519
2_&nl/Kf.A1+tC=1E\1jFC$aG0-E#-1cGjN+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3AiK"$4R>/
ATW--ASrW9ARTV#+>Gl70d'nBA0<Te3&W<1@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H1c6mB
2'=Cl0eP.<2_&nl/Kf.A1+tC@0H_qiFC$aG0-E2.3"63;+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc.
2`2$O%15F5FE_;-DBO49@<-E30f_3O+CT.u+>PW)2(Tk[@;KFrCghEs3XlE*$6UH6+<VdL+O63N
+?^i*1G1XF+=eQg/i,:?2'=@kF<E.X0J5%;0JbXE+=\LU?8<WR+>>E%0JPLA2`2^-+EUpG+=eQg
/het52Dm3K0f1"&+EUpH+:SZ#+<VdL+<VdL+<VdW+>>E%0JG191H.*I3B833+EUpI%144#+<VdL
+<YlAATD?C+ES_h+F,(]+>PW)0F\?u$:8<GG@b?'+F.O,EcW?Y0JG@,@;]Tu1,(R>/0JG2Ch%U(
@<?'A%13OO+<VdL+<VdLcBM9N4WlX</ib[0.j-Mu1GU^?2]sRmF<E(V0J5%52)R?R+=\LU?8;rs
+<VdL+<VdLGA(Q.ANCrU+?^im+>"]k0JG0i$4R>ABPDN1AU&07ATMp,Df-\3F!,")EbT].A0>K)
Df$V.F*),5@<?'k+Eh10F_,V:De:-;PZ/c>DBO%7AKZ80@<-E31,(F:%16N]A0<W]2)$X*<+ohc
G%#30AKYT'EZd+k0ea^u2E!0J+EM+(Df0*,.3N>G+C\c#ARlp%DBN@1Ch[cu@<-10%16ZkFE1f/
Derj(Bl@l3Ao_g,+>PW)2'@$_Bl7Q+0J5.A+EM+(Df0*,06q,;EZcc=G%G]&B4W2tEc5e;0f_6O
+EVN2$8O:h2(:.#<+ohcG%#30AKYT'EZd+k2)$.$3AVe!ARfXrA901BBlbD5Bl7KjEbp"DAU&<;
@;p.$@<?'k+D,Y4D%-h-0JP7(F`V87B-8l\2Du\!ARfXrA90DLARTU%-t.:1Ea`Tl+ECn4AKYT*
Df$UO3A<01FDi9W0JG10/e&-s$:8<GG@b?'+F.O,EcW?Y0JtO,@;]Tu1,1X?/0JG2Ch%U(@<?'A
%13OO+<VdL+<VdLcBM9N4Wl=30H_kg1GU(&+=JX`/MT4?0I\Y00JFq^1*A.k0J54@1,pC++=K!"
2)$.)+F,CF$4R>ABOr<&@<6N5FCfK0+DGm>Bl8$5De+!#ARlp*D]iV-Bl.R%@<?''FD,5.A8-*p
Df0Z2DKTZ8Gp$O;+>PW.0J3eA%15C5FCfJ81,1X?/0JG2Ch%U(@<?'A%13OO+<VdL+<VdLcBM9N
4Wl=30H_kg1GU(&+E_!G%144#+<VdL+<YlAATD?C+<YeL4Wl.u/MT4?0I\Y00JEqC%15C;C`mn0
Cis<1+E(j7cBM9N@UX=hA0>f.+AHcpEbTT5DBNA*A0=fmAT2<oDKB`6+C&,+0JG=g>p*QsF*2>2
+CP]dG%#30AKYT'EZfI;AKX]cDf/f-F!,O8@s)TrEZee#@qBIfEaa'(Df-\9AfrZ\2BZFK@rl3k
04T94?8=,U88i]`G%G\F%172jAKXE8:b=FV0JG.>1*CCUDIIQ.AT2<oD.Ra%F!,%2E,9H<ARlot
DBO%7AISuN6XakNDI"Z(FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;YF^fDF2,-G:74r7q
D/:XDF`V,8+CQC6Ch[NqFDQ4FA8,XfATD@"F<Ga8Cis;3De:+D1,U[D2)l$P@<,k!ARdB'H!FZ2
/g+,,F`T)V@3BW.@;Ka&@rHC.ARfgrDf-\&,%Fk%+Dl7BF<G%(+CSekARlp*D]j.8AKZ/)Cis<1
%16WWEbT].A0>K)Df$V=BOr<*Des]:Df'2sC`m;6E,oN2F(oQ1F!,(5EZiYl<$5X]AoD^$+EV:.
Gp$U*DBND"+E_a:A.8l[DBO%7AKY2E@;^"$>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH
;akYJ@WO1[9g_iJ/nf?DCaff#%144#+<VdL+<Y/:4Wl=1/het50JP=C1GU(&+=MLX/Kcc.2)Qgh
1(=R"$<(YV@q?d)BOr<0@;L'tF!,C5+O63N+D,P4+EV:.+DG_8ATDs&C`kGm2)QLuD]geh0Jsts
ATD?)A7]dqG%G1n$>FBgAT23uA7]Y#+E(j7@;^?5CisW(EZeq4BOu$lEbTSG+Du*?@rHC.ARfgr
Df-\3F!,@3ARo@_+D,P4+EV:2Et&IqATDL'A1e;u%16'JAKY3"DI[6uFCAm$FEo!CDBR5h<*^nc
FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[F`(]#Ecb`(DKL.VBQS*-.3NPPATAo8
BPDN1E+O'(De'u#@;ZM]@V$ZnF*),5@<?'k+D,Y4D'3n0@<?U&EZf(6+EV:.+Dk[uF*2M7D.RU,
F"Rn/%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%14=)+Auc_ATD@"@qB]j$4R>:DfTl4F)PqI+A=C1@;]Tu;flSi
BOu(&Df.*K7P5f]/hA,M,"QEhFDl26@ps0r<affeATJu4Afu2/AKXEMEcbu"-Z]_(6Yp[NCEQ&d
Ec5t@cBM9N@;]TuFD,5.6Xae@F_kK.Bl@l3De:+\@r,juF(KDt+tOj//g*]!F*'#W6$%-gDf.0Y
+BEDs/e&.D2'>_(Ec`E[/0I6$B6A9;+>PW)1b9bED_<.e1,(7%E,ZpU1,gd@1H$@(1,(C=.4u&:
%16$UAT2<oDKB`6+@[t]+CT.u+@pEnCh.*p+AFIS/hA+p6$-pOF!,C5+@p3fFDl26@ps0r7:U.J
E-#S59jr!^.P)#96Xah@EbT&sAKXujBm)+*Eb0<5/hA,4@;TIoBk1jf/0HZ-3&WAu$4R=o/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%13OO1,(C@+AZKh+>>S\$>t!.@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>XD.GC\:3CYeFD5Z2
+A$Gn7:U.JE-,f(@;I&[Df03%FEM,*+=PO"cDW07@;]Tu;JBcWF<Ekj@qBP!Bl@l3.*e&T5q*6M
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>3Ec5e;8muuf<+0Z^ATB/>+EqC+F(o`-+BrN$FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:
05boS@<?4%DK@I:-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"\sp%13OO6#:1P
EbTW/D'2er+@C'aE-686+B3#c+AR'$@<?4%DBMMg+A?]kB5)I1A7Zl3?t<)TBj`A!$4R>ABOr;u
Des6.GA1r-+CT)!DfTQ6BPel%Df'H9FCfM9FD,5.DKU&0FD5Z2+DG^9ARfOjE-,f(@;I'&Df03%
FEM,*/0JYE+Co%rEb/g'/0GB/AoD]4@3B2sG%GP6?qNgp+CT;'F_t]-F=n[Y+A$YtBlbD2F!+q#
F(Jl)Df-\>BOr;90f_3I+A"k!+B3#cDfU+GDe:+eF`_&6Bl@l3@;]Tu;IsB]@ruF'DD!CJ$4R>A
BPDN1G%#30AKY].+EV:.+Cf>1Eb/a&Bl@l3FDi:1E,]W=+EVNEFD,5.9gq?C+Eh10F_)\6Afu2/
AKYPoCh[j1Bk(Rf+:SZoDf03%FEM,*+EVNEDdmfsBl5&8BOr;c;H6..Ci=3(BlnK.ALnsJBln#2
@3BZ*AT)U#FD55nC`m\;ARfFqBl@l3De:-/YqRda0JO\YEap55ARd>%$4R>.DL!@HEbT0)DJsB'
FE2)*+D,b6@ruF'DK?pKF(oMC+Cf>2/0K%CDCcoAF<G"./h%ocF(Jl)Bl5&8BOr<*F(KK)D_5I;
A7[;7%16NbF*2>2+ECn$Bjkm%@<-"'D.RU,F!,UCCh7[/+E)@8ATE!/F(HJ.DIdHk@<?'k/g)8Z
8T#YmBPDN1@psFi/0K%JAKYT!DII?(%17,eF*2;@+DGm>@V'7kB-:]&DK]T3FCeu*Bl8$2+Co%r
Eb/g'+D,P4+Cf>-G%GQ*ASu!h/e&-s$@[GQILQW^AS*t4$:/`TEc5i6D/!KgC`l#[B5_g)FD,N4
+>"]kDIakYA8-."Df-[G0f_6R.3K',8nDFK+AHEYF`S!!:j$5"+BN8nCi*TuDCn1dChtXF8T&#j
%15[*6;AXW/NGXD1H@?F2DHd<%13OO;IsH$%15OKE,8s#@<?F.Gp$%.E,]W)D.RU,+EVNEFD,5.
6$%-gDf0K1Bk(Rf+@0g\@;]L`+=Js)3AN#m$?.^S0d(RV+E0%i1^sd`;aO5%0J,:@2)d3E/N,R?
2[p+CIXZ_T$4R=O$:ScBD.RU,Et&Hc$8F.U?qNgp#tJQEATD3q+A,$EDKTf*ATAo*DfQt5Bm+'*
+Cno&ALnsGBl.E(@;]TucBM9;$8O4V?rUM?<,$2\+D,%lFDl1BBl5%cF_kc#DBNG#DKL#ABk;?.
Eb/`rDf0,s+D,Y4D'2G+0JG150J">VDfTl0F)Z&8A8,po+EVNE8jj*q1G0eX6tL"1Dc1"S?m#bT
BPDN1BlbD*+Cf>-G%G]8Bl@l3Amo1kDfQtCF(Jl)FDi:3Df0`0Ec`F7AS6$pATJu.DKKe>%144#
+<Y68F_Q#-Ch7L++ECn$Bjkn#/g)9<AKYi4CijB1Cj@.6AS6$pATJu'Gp%3BBlbD/@:OCtEZfIB
+E(_2@;0U%%144#+<Yc>AKYQ(F_Q#-Ch7L++CT/#Ch4`#G]7\7F)to'+DG^9Ea`Km@;^-=+<XEt
F<G.<ATE&=E,ol0Ea`g%Bl7Q+%144#+<YK/DJ+*#B4W3!@<3Q'F`(]2Bl@m1+EVNE@rH7.ATDl8
@V'Y*AS#a%Ea`Km@;^-/@;]TuA7]CoAS#p8%14pE+CKD$#u5Vb@<?4%DBO"3EbT*++CSbiF_u8;
@<?F.+=LZ=@j#i(@rH6qF!,]M0eb:80I\U`$8jFY@!=>5#u+u>DBNM,Df02rFD5Z2+E(j7FD,5.
D/X?1+D,Y4D'3q6AKZ&:DCuA*2D-+[G;<P49k@aN+EMI;@<*K!DJsB#Cj@WB$9'R[@!=D7#u+u>
DBNb<DIIQ.@;^"#@;L3A%15'I+CKCM?jTMLDIIQ.@<-"'D.RU,+E(j7CghF"FEM,*/e&.J/g+PG
2.-_aDf03%FEM,*+E(j7@<5piDIdI!B-;)1A7Zm%Afto4DIIQ.DfT<$F<GL>+EV:.+D#&!BlJ0.
@iu3f+<VdL@<3Q.ARTY&Eb/c(Ao_g,+EV:.+Dk[uDBNM1F_P`3GT^p:+Cno&AM+E!0eb4&?t<)T
BgcNF?jTSNFCB9*Df-\3DBNM#Ch[j1Bk(Rf+Dbt6B5)I1A7ZlpG]7\7F)to'+DG^9A7]CoAS#p8
%13OO%17Q5ILQW,<$3;H+=KiM+>"]k1c7!F1c6^)0-E&/2)7#u$6W;'+?^iH.T?ia+B1->4Wm]R
<&+mi%144GAS4t\;IO)Y4WlO50f1UB3ANKM1Gq-P2`WZL+>4il3%tdK%145%0d&V%1-%9G3&NBG
2BXLm1c.'F2E*6C0ekLE.T@NB+>>E%0JPRB1bpO[1*A(i-r_uF0-Du/3A`ZO.1HV,G;14'+@KdR
<,YZCA1B!O0e!P=%145%1*A_&1Gq*D2)7*L1*A(i1Gq0Q3A*!C0JbO8<$3b80J5%50JPI>1Fc?Z
+>"]a<&5XM+>Y]*0JG10%145%1*A_&6tL"1Dc1"S.O]Kr.1HUn$6XOK+?^i%1Gg^E2DR9P+=eQk
2`EHO3%d0K2`!HR.T@N@+>>E%0K:sN2_lj^1*A(i-r_uF0-E,11,Ua7%145%1E\h'6tL"1Dc1"S
.O]Ks.1HUn$6XOL+?^i-1G1FA0f^s2.j-Z.1GUX>/hf"=2)@3A<$3b80J5%51H%3J2(DQ\+=eQ_
<&5XM+>Yc31,gm9%145%1a"q(6tL"1Dc1"S.O]Kt.1HUn$6XOM+?^i%1,U[<1c.'F+>"]j3AWKE
0f(^C2DH[\+=eQg/het70K1[F.TA/G.j-6>1E\=n1c6s@0JFpb$6XOM+?^i8AS4t\;IO)c.!INt
%13OO+<YkN4Wnf[DCB]d.4Q_t0fLpA1+H6G/Kcc,0f_6P.1HV,+Enqk+EnqY+EM77-o*8#G;LEm
+Eo[c/Kf6l.4H_p/MSk9.T@NB+>GZ,3&`8q$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2(9t(-nR20
2`)X/+>>E'.T@i+$6UI8+?^ik+=eRUBl5=S+=\LX2(:"'0J5+1<$3\61,(UA.1HV,+Enqk+EnqY
+EM77.!IEq.O[#.1,^7,+>YW,.T@i+$6UI8+?^ik+=eRUBl5>C1FXe%0J5(0<$3\62_d':%144#
G9B$kG9ACYF(oM?1+F\r1a":kG;UKp+EoOh+=eRY1+=\$0eP42<$3b82).$=%144#G9B$kG9ACY
F(oM?1*A%hG;LEm+Eo[l.OZl&/i5%W+>"]l3&W2p$6UI8+?^ik+=eRUBl5=S.O]Kt+=eRY2'=In
G;1Nh/Kf6m.4Q`$0fL4,+>>E*.T@i+$6UI8+?^ik+=eRUBl5=S.O]Kt+>"^[0e"4q+Eo[l.O[#,
3?Tgp0J5(0<%/7`+<YkN4Wnqk.j/nIDCB]b+=eRY2(:"'0J5(0<$3\62DZck$6UI8+?^ik+=eRU
Bl5>C2'=InG;CZt-nR,*0e--F/Kco1.1HV,+Enqk+EnqY+EM77-o*8r1+=\$0fL4,+>>E&.T@i+
$6UI8+?^ik+=eRUBl5=S.O]Kr+=eRY1a":kG;UKp+EoOh.4Q`"/hnhT+>"]j2CT(B+<YkN4Wnqk
/Kci'0e.6YDC@7i.!IKj.j0$n.3L,`G;CZW$6UI8+?^ik+>"]j2)m(,Bl5>C1E\7l1+IK&.1HV,
+Enqk+EnqY+>GW-.W]<A-o*8#G;LEm+Eo[l+>"^[1FWb?+<YkN4Wnqk.j,rm1FdH[DC@7iG;1NU
$6UI8+?^ik+>"]Y2*!.-Bl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6n.1HV,+Enqk+Enq[+<WNr.W]<A
-o)np+EoXb.j0$l+=eRY2(8tA+<YkN4Wnqk.j,rk3%Au`DC@7i.!IHi/Kf6l.4G]5+<YkN4Wnqk
.j,rk2C`c^DC@7i.!IKj/Kf6n.3L,`G;UfY$6UI8+?^ik+>"]Y1H6k*Bl5=S.O]Kq+=eRY1a":k
G;Ufu%144#G9B$kG9AI[+>Y`%F(oM?1+F\r1E\1jG;LEm+Eo[l.1HV,+Enqk+EnqY+<WF".W]<A
-o*8r1FWb?+<YkN4Wnqk.j,ri3@])aDC@7i.!IKj.j0$n+>"^[0e"4q+EoUj%144#G9B$kG9ACY
+>Pi)F(oM?1+IK).1HV,+Enqk+Enq[+<WEp.W]<A-o*8#G;LEo+EoOh.1HV,+Enqk+EnqY+<WEo
.W]<A-o*8r1a":kG;UKp+EoUj%144#G9B$kG9ACY+>Gc(F(oM?1+IK&+>"^[1E\1jG;UfY$6UI8
+?^ik+>"]Y0f:G%Bl5>C1*A(iG;UfY$6UI8+?^ik+>"]Y0f(;#Bl5>C1E\1jG;UKp+>PEj0e!P=
+<YkN4Wnqk/Kc/j1+I?ZDCB]d+>"^[1+<Y>+<YkN4Wnqk.j,rh0e.6YDC@7i.!IHi/Kf6o.4G]5
+<YkN4Wnqk/Kc/j0Ih-XDC@7i.!IKj.j0$j.3L,`G;UKp+EoUj%144#G9B$kG9AI[+<WWnF(oM?
1+F\r1a":kG;13j+Eo[l+=eRY1FWb?+<YkN4Wnqk.j,rW2_&l_DC@7i.!IKj.j0$n.3L,`G;:TV
$6UI8+?^ik+>"]Y+?(ckBl5>C1E\7l1+IK&+=eRY1+<Y>+<YkN4Wnqk/Kc/Y2_&l_DC@7i.!IKj
.j0$n.3L2bG;:TV$6UI8+?^ik+>"]Y+?(ckBl5=S.X*Ti.j-SsG;LEm+Eo[l%144#G9B$kG9ACY
+<WQlF(oM?1+IK&+=eRY1FWb?+<YkN4Wnqk.j,rW2C`c^DC@7i.!IHi.j0$m+=eRY2'=InG;1Nq
%144#G9B$kG9ACY+<WQlF(oM?1+F\r1a"@mG;1Nh.j0$l+=eRY2(8tA+<YkN4Wnqk/Kc/Y2C`c^
DC@7i.!IBg/Kf6n.3L,`G;UfY$6UI8+?^ik+>"]Y+>t]jBl5=S.X*Ti.j0$n.1HV,+Enqk+EnqY
+<Vda.W]<A.!IHi/Kf6m.1HV,+Enqk+Enq[+<Vda.W]<A-o*8#G;LEo+EoOh+=eRY2'=InG;:TV
$6UI8+?^ik+>"]Y+>kWiBl5>C2'=In1+IK&.1HV,+Enqk+Enq[+<Vda.W]<A-o*8#G;C?l+EoXk
+=eRY2(8tA+<YkN4Wnqk.j,rW1b*Q\DC@7i.!IHi/Kf6l.3L,`G;UfY$6UI8+?^ik+=eQW+>bQh
Bl5=S.O]Kt+>"^[0e"4q+EoR`.j0$n.1HV,+Enqk+EnqY+<Vd`.W]<A.!IHi/KceuG;L`X$6UI8
+?^ik+>"]Y+>bQhBl5>C1E\7lG;1NU$6UI8+?^ik+>"]Y+>bQhBl5>C1*A.k1+IK&.1HV,+Enqk
+Enq[+<Vd`.W]<A.!IBp%144#G9B$kG9ACY+<WHiF(oM?1+IK)+=eRY1FWb?+<YkN4Wnqk/Kc/Y
1FdH[DC@7i.!IKj.j0$n+>"^[1FXa^$6UI8+?^ik+>"]Y+>YKgBl5>C1E\7lG;13l+EoRi%144#
G9B$kG9AI[+<WHiF(oM?G;:9k+EoUj%144#G9B$kG9AI[+<WHiF(oM?1+F\r1a":kG;Ufl.j0$l
+>"^[1+<Y>+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IBg.j0$m+=eRY2(9Y"+EoR`/Kf6n.1HV,+Enqk
+Enq[+<Vd_.W]<A-o*8#G;LEm+Eo[l+=eQj.X*Zt%144#G9B$kG9AI[+<WHiF(oM?1+F\r0d%th
G;LEm+Eo[l+>"^[1+<Y>%144#A5I>]6tL!R4Wnqk0-E&/0JG170JG+5%144#IXZ``F`_&6Bl@lr
Bl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys=/2bnL;@<?4%DBMMg+AZH_BlS90FEo!)
Aft&dAKXEOCh[j1Bk&8;+A"k!+>Gl90Ha;*EbT*+%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$:]&SD'2GZGp$'pDJj$+-Z^DSAR]^pFCcS!
BQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m103ou>FEDJC3\N.(AT)O.DeF*!D/Eus
F"Us@D(fdLFCB9*Df0VL.4u&:%16'JAKYT'Ci"$6Bl7Q+@;KRpEbTW/D'3>,D/aW>ATJu9BOr<(
F`_&6Bl@l3Bl5&3@VfauF_PrC+E(j7FD,5.ARfOjE-,f(/0JYE+:SZgAS6$pATKCFAoD]4@3B2s
G%GP68jlWX+CT;'F_t]-F=n[Y+A$YtBlbD+@<6!j+E)-?FD,5.%14R>3B/]88O6?!<+oi]Ed8dG
AfsikFCB9*Df-\+DIakfARopnFD5Z2/h.;;%16'JBlbD?@;L't+DGm>FD,5.@rHC.ARfgrDf-\>
D]iJ-E,9eBFDi:DBOr;\76sZkG%#30AKYo'+EV:.+E(_*BlS90FEn<&FDi:?@WZ$mDBO%7AKXrM
<CJ$K@VfauF_PrC/0K.NFD)e*+EV:.DfTE2Bk(Rf+E2@4@qg!uDf-\9Ag"sq0J5%50d'nF@j#i(
@kJ2t%15CB+DG^9D/XK;+Cf>,E-686EZf=ADeF*!D/F!)B-;#!DJ+*#B4Z-8+EV:.+EVX<B5_[+
D.Rg0Bk&8tF`(]2Bl@m1%14M)Bl5IE@rHE>+EV%0/0JMG+CT(=.3N>B+EV:.+E2C5F_#DB@rGmh
+D>>,ALns4F)uJ@AKZ#%A8,Ii+CT;'F_t]-FE7luF`)#,F)rIBFD,6+GA2,0+DG_(Bk(RnARmD&
$4R>6DBO%7BlbD,@<6!2+EV:.+D,>*@;I',ATN!1F<G:=+Cf>-G%G]9ARlotDKKe>A7]CoAS#p*
AoD]4@rH7.ASu3nDI[61%13OO<-!+m+AZH_BlS90FEnul+AHEUDBM_aCh[m3BlnVC.j3-%cF")g
%17Q5ILQW^AS*t4$:/`TEc5i6D/!KgC`l#[B5_g)FD,N4+>"]kDIakYA8-."Df-[G0f_6R.1HVV
ARTI!9k@mYEt&IQF^csG=(uJeD..="/OF#bCb-]#DIY:.$;"/_:*;5B3A`NJ3ArHI0eG*h$4R>?
AS*t4$:T2YCgh3iFDl2F+B*E%E,9*&ASuT4FDi:DBOr;PF*)G@DJsB+@ps0r6#:CHDII#t-o!_B
1+<Y>E%s(%+EVNEE%s((%15[*6;AXW/NGUE2_[!=2E39I%17Q5ILQVn$:ScBD.RU,Et&Hc$8F.U
?qNgd<+$"uF*)G@DJsB+@ps0r8jje>F_tT!EZet4EZf"/G%GP6A79Rk06CoFAKWC#<%/7`1+j\W
<+$#3Bl.E(Amo1kDfQt7DBMPoCh[<q+Ceu#FEMV<ATKCF@rHC.ATMg/DIdI!B-;;7+A,%$<%K/4
ARfLoDIm?$Ao_g,+A+CC0JG+5%14mD+CITKB2ieI@:WaP<+oue+DGm>@3B&uDK]T3F(oQ1+D,%l
FDl1BF`V,)+EVNE@rH7.ATDl8A7]CoAS#p*Bl8$2+D#P8Bm*p$ASuT4%144#+ECn$Bjkn#/g)9<
AKYi4CijB1Cj@.6AS6$pATJu'Gp%3BBlbD/@:OCtEZfIB+E(_2@;0U%FD,5.AT;j,G%#2uDKI"A
@:X(\DK@E>$8a@X@!>ub:3CYeFD5Z2+EM+7Bk;?.@:NeiD09Z'FDl1BG%#E*@:F%a%14sF+CKCJ
?jTP=@;[3!Ci=3(@<?4%DBNk0+EV:.+Dl%8DBNP3Df$V=BOr<-F`&f@$8sLZ@!=A6#u+u>DBO"=
Cgh?,@;^"#@;L3A%15$H+CKCL?jTP=@;[3(F`(W.+CT/+D..7+/e&.I/g+PG1ggV`F`(W.+CT;'
F_t]-F<GL6+DbJ.BlnK.AM+E!3A)Es@!=J9#u#8TB5)I1A7Zm%AftN'@qBOgBl7Q+DJs&s+E(j7
CisW(EZf:@@VKp,Df-\>BOr:q$6UH6+D#&!BlJ0.@j#3$+Dk[uF*2M7A0>K)Df$V=BOr<'ARTI!
AT;j,DJsbBDe:,&@<?'5%14gD/g+P47<!<9AS5BW:3CYeFD5Z2+DG^9ARfOjE-,f(@;I'&Df03%
FEM,*+D#e:Eb0<5ARlotDBNJ$B6%QpF"Rn/%13OO:ig2jA8bsrA7ZlLChI[,Bln$*+B38%6Z6g\
F`_1;<+ohc:3CYeFD5Z2+A$Gn:L\-SEHPu;Gp%$;+EV:.+@TdVBlJ0.@grcWDfQt/DL!@;Bm+'*
+A,%$<$4JIB6A'&DKIK?$4R>kIXV_5+B0I+4Wl.F6r[,./Kcf*2)-sF2(9Y$+>Yo51,TLJ+B1*=
4Wm]H.Nh\"$6W;(+?^iH+=\L51(=R"$6V`JB2ieI@:UKD+>YW)1bgjJ1,_!G2)mTT3AWE50-Du/
0F\?u$6XOI+?^i8AS4t\;IO)c-o*eA/iY^B1H$@++>bo41,_'D0ekC>3%@lM+>"]i/het63AE?G
.TA/G.j.eI0/5FH1cI6?%145%1*A_&6tL"1Dc1"S.O[)12_HsC2`EK7.j-W*3B9)P0JtO?1b)HI
+<W6Y0J5%50JPI>1Fc?Z+>"^81G:O<0JG17.1HV,G;C@)+@KdR<,YZCA1Au^1Gg^E2DR9P+=eQk
2`EHO3%d0K2`!HR.T@N@+>>E%0K:sN2_lj^1*A(i<&60b2DR-D.1HV,G;LF*+@KdR<,YZCA1Auf
1G1FA0f^s2+=eQk3&<<D1+k782`3BN.T@NB+>>E%0JbUH1,UO\1*A(i<&60`1,gsI0I[G<+Eo[c
4Wm.(B2ieI@:Ui90etU=0JkUD1*A.k0f_$H/ho.?1,^j:<$3;+.j-Mu0JG792_[3@<&,RH+B1-M
1c6s@0JFpb$4R=bG9B$k@rHE:G;Ug!-oj%:1,U1)+?1u6.T@i+$6XO84Wnqk.j/>?F!rdn.!IKj
/Kf6l+=eRY2(9t(-oEq>2BXRo1G1C3<%/7`+Enqk+EnqY+Cf>2-o*8#G;LEm+Eo[l.4Q`+2`Dj2
+>>E*.T@i+$6XO84Wnqk.j/>?F!rdnG;Ug!-nm82.T@NB+?2A=.1HV,G9B$kG9ACY@rHE:G;:Ts
-oEh(/Kc`"0e--O%145%+?^ik+=eREDf[=N1*A(i1+F\r1a"@mG;13j+Eo[l.4Q`$1,L+*+>>E+
.T@i+$6XO84Wnqk.j/>?F!u5g+=eQi.O]Kt+=eRY2(9t(-o!J;+>"]i/hnhT.1HV,G9B$kG9ACY
@rHE:1+F\r1a"@mG;13j+Eo[l+>"^[1+=\$0J5.2<$3b83Ai5p$6XO84Wnqk.j-T$0IgRNF!rdn
G;LEm+Eo[l%145%+?^ik+>"]p0IgRNF!rdn.!IKj/Kf6l.3L,`G;UfY$6XO84Wnqk/Kco,.V!C<
-o*8#G;LEm+Eo[l+>"^[1FWb?+Enqk+Enq[+>Yf'@rHE:G;C?l+Eo[l%145%+?^ik+=eQi2C`3T
F!rdn.!IBg.j0$m+=eRY2(9Y"+EoUj%145%+?^ik+=eQj1+HdPF!u5i+>"^[1FWb?+Enqk+EnqY
+>Pl*@rHE:G;C?l+>PEj1a":kG;UfY$6XO84Wnqk/Kcf*.V!C<-o*8#G;LEo+EoUj+=eRY2(8tA
+Enqk+EnqY+>Gc(@rHE:1+F\r0d%thG;LEm+Eo[l.1HV,G9B$kG9ACY0f(:hDf[<^.O]Ks+=eRY
1a":kG;Ufu%145%+?^ik+>"]j1+HdPF!u5g+=eQi.O]Kt+>"^[0d%thG;Ufu%145%+?^ik+>"]j
0IgRNF!rdnG;LEm+Eo[c/Kf6n.1HV,G9B$kG9AI[3%AEVF!rdnG;13l+EoUa.j0$n.1HV,G9B$k
G9ACY2_&<UF!rdn.!IEh/Kf6l+=eRY1a":kG;Ufu%145%+?^ik+>"]p.V!C<.!IHr%145%+?^ik
+=eQp.V!C<.!IEh.j0$n.1HV,G9B$kG9ACY2_&<UF!u5g+=eRY2'=In1+IK&.1HV,G9B$kG9ACY
2C`3TF!u5i+>"^[1+<Y>+Enqk+EnqY+>kWYDf[<^.O]Kq+=eRY1asP!+EoUa.j0$n.1HV,G9B$k
G9ACY1FcmQF!u5g+=eQi.O]Kt+=eRY0d%thG;Ufu%145%+?^ik+>"]l.V!C<.!IEh.j-Ss.!IKj
.j0$n.4G]5+Enqk+EnqY+>YKWDf[<^.O]Kt+=eRY2(9Y"+EoRi%145%+?^ik+=eQj.V!C<-o*8#
G;13j+EoXk+=eRY2(8tA+Enqk+Enq[+>YKWDf[<^.O]Ks+=eRY1a":kG;UKp+EoOh.1HV,G9B$k
G9AI[1FcmQF!u5g+=eQi.O]Kt+>"^[0e"4q+Eo[l%145%+?^ik+=eQj.V!C<-o*8#G;13l+EoUj
+=eRY2(8tA+Enqk+EnqY+>YKWDf[<^.X*Ti.j0$n.1HV,G9B$kG9ACY1FcmQF!rdn.!IKj/Kf6l
.3L,`G;UKp+EoRi%145%+?^ik+=eQj.V!C<.!INk/KceuG;1NU$6XO84Wnqk.j-Vt@rHE:1+F\r
1E\1jG;L`k.j0$n.1HUn$6WkJE-"EYB-9>[G9AO]1H$p@0JG17%145,IXZ6VC3"$0ATMF)1,2Nj
/h1g\C3"$0ATMF)+EK+d+EM+9F`8IDBldj,ATT&6Ec5](@rs=4$4R>PDe!p1Eb0-1+=CW,F(H^.
$4R>;67sBsDdd0!-Y-Y-@4u\ACh\!&-OgCl$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGF
A0<QT,:@2BAU#=F.4ciYF`_[IF`_>6F!i(>$?'Gt@Us1_F'iWrDe*2t>9G^EDe't<-OgCl$>OKi
F'iWrDe*3<3Zr0UA7o7`C2[Wi4ZX]5EbTT+F(KG@%13OO;aFGQ8PMWU?YO7nA7$HB3ZpLF-Y@LC
F!hD(%14IsC2[W1+D58-Ed/]g3[]#j+D,8,+DGFt+Cnr&FE/`O%13OO:-pQUF(KG9F)?&=H$!V<
+E_a:EZf./H#k)[+ED%7FCB33+A*buD]j.1CLnW"AnGUaF:ARuD/XQ=E-67F-ZsKAE_BthF!,L7
F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrOBldj,ATUpnATCFTH#k>^+Eqj?FCcS0
E+*j%+=DVJDf00$B.nCKATDQtH#kTJAnNJ6%17/nDfp/@F`\a@De*KfBkhQs?S!QIE,ol3ARfg)
F(KH9E$l)%%16oi@:UKqDe*KfBkhQs?ZKk%ATMF)<HD_l94`Bi1,Vfn/g,:XATDQtH#kTJAnMP[
:-pQB$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq
01o)`03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-
B5)H@@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk
67sB'7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2
F!hD(:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2
D(fXJBkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J
;eTlWF=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$Hm
Cb&FtBkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$4R>31-73P;Is]RCLnVUF`MM6DKIsVDdd0!C2[Wq
?YO7nA7$H`+>G!ZFEAWQ@WcC$A7$]8C2[Wq?YO7nA7$H`+Cf5!@<*J<-OgDMFE21J7P[%[4&]^4
+@C9lEb0-14*#Bb-ZF*@EbTT+F(KG@+Bot,A0<73F`_[P+BosE+E(d5-RU$@+ED%5F_Pl-+=Cf5
DImisCbKOAA1%fn6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb-Y.@:E,]rA-OgDP1HR<Q;Isij
Bl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\4&TX"H"1Z%+A,Et4"+i^A8c?.
/0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!+>=637Pm1\4%*XhF_;gpF`'9O
@WHU/+=ANG$:Zp80fr?GF*&O'D/X3$4#A(#FEAX?De*KfBkhQs?O[?@BPD(#.n2EY0fr?GF*&O)
DJ=2S0d(LYF<G=:A7o7`C2[Wi/14e9F)Y].@;B4kD/X3$-OgDP2`i`U6uQRXD.RU,+@C9lEb0-1
4#%juFEAWQ@WcC$A7$]8C2[Wq?YO7nA7$l8?Y"(b-ZWpBATMF)?Z'e(AR]RrCL:dpH#@(I14'?N
,%G2#Ci^d]+Bo0q+F=G<+<Vk<ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W+uNsf0P!+O
1a4IX+<VdND.RftA79Rg,!$inI4P^J+<VkLDfp)1AKj/X>7)Jq+<VjQ+CK5(F(KE(FC64[G[YH.
Ch7ZmDB^V=+<VdL,$]"0/.*LB+<Vk-BPDN1DJsW.@W-1#+Co&#Df0W<Eaa'$F!,R<AKY2L+ED1;
ATMF)+EM%5BlJ0"-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$.!@:O(o04Ja9@P;S,
Bl5SEBldj,ATTP=C3(gV+<Y'4Bldj,ATV<&@rH4'F`_29+EV:.+ED1;ALnsGEa`j,BlkmK@;]Tu
F(KG9FD5T'F!,C5+DtV)ARlof8O6?!;flGgF'U2-FEDJC3\N.1GBYZR@<F2@Eb@$S/mN9</.*LB
+<Vk5DB^V=+<VdL,#iJ'Ecl7BFD,B0+Du+>AR]RrCERn@FWbODF*&O=DKBo.Cht5&+A*bkF`;VJ
ATAo/ATD["Cb?i/ARuuY@<-I(DBMkdF`M&6-Z^D77qm'9F^cJ6AT2R/Bln96H!Mh3FEDJC3\N.!
Bln$2@P2//D(fa7Ecc#5/TY?CEb08EC27C$DImW5+D,P4+DG_7FE2M6FD5Z2F"SXD+<Ve4$6UI>
/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag0e<YS+<VkB
A0O&W+uEmk2)-j?3?g!]+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6
+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=
,!$iN$6UH6+<VdN>](`:$6UH6+<VdNC,mn'/i#(p2DeicGVUprBl7I"GB5EIDf'?&EarflCbL!V
G:mWODe=*8@<,p3@rH3;1,(I>/MK"50ecQ\0fh$L3]/]H@r,RkB.Yhq/MJb802kP577KEp>](`:
$6UH6+<VdN1,(I>+>k8r2BX_1+?1K!3%d'G1L+fA/.*LB+<VdL,$]"0$6UH6+<Xqs+<VdLI0q)>
+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQU8g&:gEcYr5DBNA*A0>DkFCe]p+tO'D+<VdNF)>i<
FDuAE+?:T+0f1"#-X:O5/.*LB+<VkLD/XQ=E-67F2Bb+8+=AOADB^V=+<VdL,$]"0/.*LB+<Vk'
67sC%ATT&6DfTr.@VfTu@W-K6A9)+&Bl7Q+@q]:k@:OCjEcYK'+tO'D+<VdNE,Tc=@q]:kF$2Qg
3ZpF+3]A0/.k<,#.k<,#.sror>U!Mt>9I3VDB^V=+<VdL,&hI@FCSumEcW?W+poG8+C,<s+FPdJ
+<Z"<+<VdN@qBIm?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<iTt@Pfl#AMt_`$6UH6,&Ln5
@:Weg@3R`TH[RFP+<VdNF)Q2A@q?iF+Bo0q+<VdN,9n=&DKBo.Ci!O%Bl@l3>](`:$6UH6+<k'.
+tO'D+<VdN?uft&ATMF)?m'0)+Co2-FE2))F`_2*+CT=6@3A/b@:WneDD!&'F<G:=+DG_7FCB!%
ARlotDBO%7AKXSf@")NpA8c@,05=p*CNEl+AoDKrATBCG8TZ(b@;[2sAKY])F*(i,Ch7-"Ao_g,
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(oBOPCdF"&5UBln#L+poG8
+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp1/
$6UH6,&(R33ZoV$AMGnu1c]%i/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN>q?=*
+<VkLDfp)1AKj/X>7)Jq+<VkEDdd0!-ZEL(D..<0>](`:$6UH6+<jQI/g,4PDfp/@F`\a?DKBo.
Cht4AB5)I$F^dC@@;BFpC1K=b05=p*CNF/t@r$-5+AP6U+E_R3Df'?&DKI"CD]ib3F*(i,C`jiC
+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<k8P@5U&$
3&i*5$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNF)Q2A@q?iF+Bo0q+<VdN<+ohc?ts+[CNEl+-qZ()
@:O(o.3N&0A8c@,+CT;%+EM+1AftT%DKK<$DIm?$+BqH66m-,RDImisFCeug-tm^EE-"&n04Aa,
CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0.A#9+EM%5BlJ08/g*Sk@qZum
Bkh]s+EM%5BlJ/:BlbD*@q0FoE+*WuARlp-Bln#2?uTXg?m&uu@s)X"DKI"CBOQ!*A7]glEbSuo
F!,.7G9D!G+E_a:+DGpM+B*2qAKZ&(EbTK7F"AGMBkq9&?uft&ATMF)?m&luAKYDtF)N1?@:O(]
B4YTrGA2/4+CQBbF`;VJATAo2DffQ"Df9D6.!0-:F!,(/Ch5%<@;]Tu@3ArsA7f3lG%G]8Bl@l3
De:,6BOr<(DffQ"Df9DD+@^9i+D#e+D/a<&/0K%JAKYB$Bldj,ATV<&Anc'mF!+n3ANF(6+tO'D
+<VdN>](`:$6UH6+<hpN+<VeIBldj,ATTP=C3*Wt+tO'D+<VdN+<VdL+ED1;ATMF)/oY?5>](`:
$6UH6+<hpN+<VeIBldj,ATV9sDffQ"Df9DDBlJ?8@U*dp/.*LB+<VjN+<VdLEbTT+F(KH#DJsW.
@W-1#/oY?5>](`:$6UH6+<k'.+tO'D+<VdN<+oi`AKYE%AKYo5BOu3,F(96)E--.DBl5&$IUQbt
Df0VLC11UfF'p,!DIal,DfTD3GA1l0+C\n)@:Wn[A0>K)Df$V=Bl.E(FDi:DBl.E6+B38%Eb/j'
ATMN-FD,5.AoDKrATB=EEb/s+F*2%:FD,5.Bl8!6@;Ka&@rH4$@;]U.>](`:$6UH6+<k'.+tO'D
+<VdN8T#YZA7TCrBl@l3FDi:DBOu6r+D,>(ATJu9BOr<-F^es$Ch.*t+CKY,A7TUrF"_9:@r$-=
FCfN8A79Rg?m&rtDKK<$DK?q2@<>p#Anc'mF"SSCEbTT+F(KH$+D,>(ATJu.DBN>/ATMs(@<>pc
+CT;%3a?PH/.*LB+<Vk5DB^V=+<VdL+s8!N+<X!kBkM+$?W2&TEcYS^ATDKqBjkmd6#:CHDII$^
1,EcUE\]R+D.Hmh+tO'D+<VdN+<VdL+DG8,?Z':hARo.hFCB32?SX;j1+mZnFBi]-/.*LB+<VjN
+<VdL:18<[B45mrDf/o\FCB32/p)>[>](`:$6UH6+<hpN+<VdN$6UH6>m_\sI4P^J+F=G<+<Vk<
ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>YPU+<VdNBk/DK+<ig(1c[EP
2.Rm^$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hj
F*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL
,'7C;FC\g%@3?[8+<VdL+<VdL+<VdL+<WdWBlZB[+<VdL0K:XME,mNc1E\D.3\W?N2)AKT+tO'D
+<VdL+<k98@;]V#D/_+AC3(L?+<VdL+<VdL+<VdL+<Vd]1GUsJ+>Po.9jr&o1,C%.1-.6L3\iEp
DB^V=+<VdL+<Vk;Ea`irG\qCPE+EQ'+<VdL+<VdL+<VdL+<Vd]1,UgE1*A>3/PTYo/M]+)1,:mI
2**KI>](`:$6UH6+<VdNB5i*<FD5Q4/no'A+<VdL+<VdL+<VdL+<VdL+>Gf/2`W!81G(n3E\0%&
+>GQ20K2$K3F$GG/.*LB+<VdL,%kk>F`_>6F"VEBAfr3=+<VdL+<VdL+<VdL+>GZ/1GLj30f(CI
E,mNc1E\D+3\WKR1HA]X+tO'D+<VdL+<kN=H#@(DBkh]3+<VdL+<VdL+<VdL+<VdL+<VdL1c@?S
+>Po.9jr&o1,C%.1-.6L3\iEpDB^V=+<VdL+<VkBE-Z>1/oY?5+<VdL+<VdL+<VdL+<VdL+<VdL
3&WcT2BXb7/PTYo/M]+)1,:mI2**KI>](`:$6UH6+<VdND..<rAn?%*/no'A+<VdL+<VdL+<VdL
+<VdL+<WBp1-$I23%[F8E\0%&+>GZ50JGOA0jJT?/.*LB+<VdL,'%C=ATMF)/no'A+<VdL+<VdL
+<VdL+<VdL+<WKt1GUm30eb1R@<jF[1E\D,3\iHO0f!!O+tO'D+<VdL+<ki?F(KE(F=qNCAfr3=
+<VdL+<VdL+<VdL+<WEo3&WKL+>GQ%9jr<!1,C%-0fh'F3\`BpDB^V=+<VdL+<VkKBldj,ATV9s
DffQ"Df9DDBlJ?8@NZd9+<VdL1Gpj@1a"P4/O=>r/M]+)0etdH0KLmJ>](`:$6UH6+<VdNEbTT+
F(KH#DJsW.@W-1#/oY?5+<VdL+<VdL+?),61,0n,2_@=7E\0%&+>GW41b^sE3F$GG$6UH6+<Xqs
+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQU@:WneDBNP*Ch7ZmDB^V=+<VdL,%PD.
+=DVHA7TUrF"_9:@r$-5+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,&Lb/CLh@-DB^V=
+<VdNBk/DK+<iaQ@Q6(s2`2d1$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNF)Q2A@q?iF+Bo0q+<VdN
,9n=2F(oN)+CK5(F(KE(FC6:"+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB
+<kBAARfk)Bl@lr@rHL-F<Wag1b8tV+<VkBA0O&W,%b@r1GLdAAg/c5+<VdND.RftA79Rg,!$in
I4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE
?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN:-pQU-us$CATMF).3N>BFCfK)
@:NjkGAhM4.!$gu+>PW+1GC[@0PW<s0KCgD>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQU@UW_k?Z^3s@<it<:-pQUDIIBnA0=3I@X2d.DJ<Ns
+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBmD00-,De*:%+<Ve%67sBm
DfT]'F<G[DA79a+G%G]'F!,L7F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"4P:-pQUDIIBn
A0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)SJ
:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<Ve%67sBu
@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g,%?
G%>$,Ch[s4+<XEG/g,4NGp%0:Amo^o+?!R\+E(_1ATDs.DJ().BleA=De:,6De*:%-Z^DJ@<Q?t
@<?4%DBO"B@<-EoDB^V=+<VdL+<Vk'67sC$Bldj,ATT%;+<Ve%67sC$Bldi:+EVX4DKBN6/0K"F
F<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6+<VdN+<VdLAo2WsFDk\uGp%!5G$f?0
A79a+Ci<flFD5Z2?YF@pAKW[3DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sC(D.G[M0J5@<3&3Q<
1HQ^60Ha(uGp"jr1,C%-0fh!K3\WBqDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN
$6UH6+<kW?@:UK.IUQbtDf0VLC11UfF"_QJF(KE(F=q9BF!i(Q:-pQU@:WneDBO+6EcYr5DHq''
/.*LB+<Vk'67sBsDdd0!-ZWpBATMF)-Ql/N/g+\9Fs(s>EcYr5DHq''/.*LB+<Vk5DB^V=+<VdL
,'.U>F`_SFF<Dr+67sC(D.G[M-Qjr_/13,&E'-3)5&i\H+?hJ10IItk3$C=<.3MYc6um!_ATMF)
+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F
3Zp:2$6UH6,&(R33ZoVY11b#N2E!K</.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN
$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<
+<VdL+<ko=G]Y,j+Bo0q+<VdL+<iTa3Zp+]DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sa(De!3t
Bl@lrH"Cf.Dg-8EDf0,/FtG9gF(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<flFD5Z2
/mN9</.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQUD/X<#A3(hUCi<flFD5Z2?[64!Ci=N=FDl&.
+E_fuB5VX.AR'*s/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU+<YK=@psInDf/p-ASc1$GB7kE
DIjqE+<Xp,+tO'D+<VdL+<jQI/g)8Z:-pQUF`V,8+Dbt+@<?4%DBO.;FD)e,F`MM6DKI"3@<?'c
DB^V=+<VdL+<Vk'67sB'+DG8,?Z^3s@<itL+<VdL+<VdL+<VdL+C&e./.*LB+<VdL,#1HW>](`:
$6UH6+<VdN:-pQUA9hTo3ZoPSC`kkn+D,FmD.[<$Ci<flFD5Z2?[64!Ci=N=FDl&.+E_fuB5VX.
AR'*s/.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU+<XEG/g,:XATJu1De!3tBl@l3GA2/4+F.O7
Ci=N=FDl&.+Cno&AR'*s/.*LB+<VdL,#1HW+<VdTCi<flFD5Z2?[64!Ci=N=FDl&.+>>5eBjl-k
FDk\uGp"eGDB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g)8Z:-pQU@<,gkFE1f1Gp$X+FCfM9
AoD]4Ci<flFD5Z2>](`:$6UH6+<VdN:-pQU+<Y95FC0-.A79a+-o!Y81*A@q0f:R>1a$UQ@psIn
Df/p-ASc1$GB7kEDIjqE.3NM:G$f?0A79a+0HaV<+tO'D+<VdL+<jQI/g)8ZAo2WsFDk\uGp"MO
De!3tBl@lrH"Cf.Dg-8EDf0-8+>Gl41E\\#1,U[C2(9Y^@<Gq!De*:%+>@&<+tO'D+<VdL+<k'.
+tO'D+<VdL+<iQp0f'q0+?(EZDe!3tBl@lrH"Cf.Dg-8EDf0,/H!G52/.*LB+<VdL,!&tH+tO'D
+<VdL+<jEX9M%NF?ZKk%ATMF)?TgFmC3=?)EarNo+F.g74Y@k%>](`:$6UH6+<VdN>](`:$6UH6
+<VdN:-pQUCi=3(BlnK.ALns?@<?4*F_#&+GA2/4+EMX5DId0rA0>r-B5Vc5>](`:$6UH6+<VdN
:I7uR:I@EI8P`)gEbTT+F(KH#4ZX]m0ek@73&3EQ1*AD1/i5I?2)ecX+tO'D+<VdL+<jKT6U=[C
:JOYN9grE0Bldj,ATV9B3ZoeQASc1$GB7kEDIjqB+AZfa+@]dRFD,9/CaWJ*+tO'D+<VdL+<k'.
+tO'D+<VdL+<jfb6Vg0@;ajYmEbTT+F(KH#4ZX]D/heCj+AP6U+AGd6+EV=7AKZ;;DIm'j+tO'D
+<VdL+<jKN9hA;Y5t>:&Bldj,ATV9B3ZoP'/heCj+AP6U+EMX9Ci!O#+DkP"DJ=38A7]"`+tO'D
+<VdL+<jKN9hA;T:JtA'EbTT+F(KH#4ZX]?0H_J\+AP6U+Co%rEb/g'+CS_tG%De0DfTQ<Df/ft
+tO'D+<VdL+<j3>;G0te;dXQZF(KE(FC.0l+>=o\+<VdL+AP6U+Dkh1F`_29+C\noDfTD3@;]Tu
@:jUmEZfFGDKBB2+=Jp,BkM=%Eb-A7F`&X5DB^V=+<VdL+<Vk5DB^V=+<VdL+<VkRD.G_#<D5tM
:-26<;bTtS5u^EO:-2HT6Vg0@;ajYI9M%rM<)#YK4%r4?8Q85V;Hc.U:I@EI8P`)V5tsd06pX^D
<)QY"DB^V=+<VdL+<VjW>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'
67sC%ATT&'+Dbt+@<?4%DBLMR@:WmkH#IhG+E)IA+C]U=@r-($Bl7Q+@;]TuD/Ws!ApJ*.B-;#/
@psInDf-\@ATD7$>](`:$6UH6+<kW?@psInDf/p-ASc1$GB7kEDIk"!+<Ve4$6UI>/.*LBHO:l<
+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag2Co1X+<VkBA0O&W+u!U`
3&s!0@3R60+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"
3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6
+<VdN1,LdlDB^V=+<VdL+<Vk2ASc1$GB7kEDIjqB+AZfa+@]dRFD,9/Cg:j%/.*LB+<VdL+s8`c
2)SWV+tO'D+<VdL+<iQp+>bu]DB^V=+<VdL+<Vjd+>GPm0H`,-2D?gE0J5:A+?))/2)$jE0JGLE
1GLXB+C?iX0J5=?2`WW91c-gA2D@!I+>PW+1E\Ot0fCX>2'=e^DB^V=+<VdL+<VjY/M/P+/M/P+
/LrD)/M/P+/LrD)/M/J)/M/JXDB^V=+<VdL+<VkU94;^N+<VdL+FH^X+>kr021.2;+<Z%c+>\CM
DB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+/LrD)/M/J)/M/JXDB^V=+<VdL+<VkU6#pIWF`MVG
+FH^X+>kr30RPc8/iA#1+>nOODB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+/LrD)/M/J)/M/JX
DB^V=+<VdL+<VkU;gED#@3?[8+FH^X+>kr23.*MB/iA#1+?"UPDB^V=+<VdL+<VjY/M/P+/M/P+
/LrD)/M/P+/LrD)/M/J)/M/JXDB^V=+<VdL+<VkU=ES%iB4W2.+FH^X+>kr40mkr?/iA#1+?"UP
DB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+/LrD)/M/J)/M/JXDB^V=+<VdL+<VkU95%aN@UX(e
@=1UD+>kr43IEV<+<Z%c+?=gSDB^V=+<VdL+<VjY/M/P+/M/P+/LrD)/M/P+/LrD)/M/J)/M/JX
DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<kW?@psInDf/p-ASc1$GB7kE
DIjqE>](`:$6UH6+<i1)5uf%DDe!ZnD.Oi2;KEsj:gnB]F!j+3+DG8,?Z^3s@<itL>](`:$6UH6
+<k'.+tO'D+<VdNF)>i<FDuAE+<sHD<?ND,+<XEG/g,%SD.7's+E(j7EbTT/DJ(VDATW$.DJ((`
5uf%KFCB32>](`:$6UH6+<klDDfp/@F`\aBDe!ZnD.Oh4:-pQUCi<flFD5Z2>](`:$6UH6+<klD
Dfp/@F`\aI;KEs'+<VdL:-pQUF*2A@Bldi=F*2AAATV0p+tO'D+<VdN>](`:$6UH6+<jQI/g,">
B5VF*F_#&7+Co%r+CS_tG%De0DfTQ<Df.*KA9Ds/+Dkh1F`_29/0J\MCh[<q+Cno&ALntLPZ/c>
DBO"3@rH6qF"AGMDf03%FEM,*/0Jb;FD5i>A7[;7H"CE)/0JeJDKKP7A79a9A7R56<E)>3>](`:
$6UH6+<klDDfp/@F`\a9:gnB]F'NT,/.*LB+<Vk'67sC%FCB24DIIBn/0JJ7F(o9)@<?4%DCcoP
Ea`j,BlkJ+CijB5F_#&+A7]CoAS#p6+EVX4DKBN6+EV=7AKW`b+D>\9EcW@?Bl8'8ATM*o+tO'D
+<VdNF)>i<FDuAE+>k9g/g*_O<?_bm+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(
GA\TU$6UH6,&(R33ZoV'@prk,3Fk,o/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6
+<VdL,"-!a@;0OhA0>o,F(HJ&DIal2ATT&/DJ!g-D..O#Df-\3F!,FBDg#i*ARlomGp$L8Bldj,
ATV<4+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6ml
F`):F3Zp@4$6UH6,&(R33ZoV'@V%N-0JG7+/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D
,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$
D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<iQt2D?g@0J5:A+?))/1b^jF0f([G3&*0F3Ar!e0ekR=
1H.0O2)ZR61G1RB2E*QP+>PW+1E\Ir1,gg@2'=e^DB^V=+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU6#:1PCj[pa+>>E*+<W?j1-%'C1H79L
2DI$F3A`WP+<WQb2*$%hDB^V=+<VdL+<VkU+<VdL+FG;Z3&`HI+<W?j2E<HN1GgsE3AWZM2_m6L
+>Gbs1GsPbDB^V=+<VdL+<VkU+<VdL+FG;Z+>>E*+>>E%3AWHM0K(U>2_d<L2)R*H+<WE^0f48_
DB^V=+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL
+<VkU;JBcTCj[pa+<WB]+<W?j2)R-J3A<<I2DR9L3&*BM+>GYp0fFDaDB^V=+<VdL+<VkU+<VdL
+FG;Z+>Yu"+<W?j2`E]M2_d'E3B/cP2Dd3K+>Ghu1ba;^DB^V=+<VdL+<VkU+<VdL+FG;Z0J54*
0J5%52D@*M1cI<O2)@0J1,CaG+<W?\+?=gSDB^V=+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU;fHG\@=0bV+<WB]+>>E.0JP=A0K(dJ1,L[C
2)d?71,0n-3$<TRDB^V=+<VdL+<VkU+<VdL+FG;Z+>Ykt?SF)l2`WZK1c.3K1H%$H2D[04+>P&s
1a%0NDB^V=+<VdL+<VkU+<VdL+FG;Z0J54*+>>E(1H.*I3&NTN2E3ZQ0etI++?1Jd2B[BPDB^V=
+<VdL+<VjY/M/P+/LrD'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB]E1+<VdL>m_\s
+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jKG4ZX].?SO8n/i,FD3Ai];1c$aB1c@9O2'="a
:-pQU9kA?ZA8,Ii+C&e./.*LB+<Vk29gh-*+>PW+1E\Ir1,iHU+tO'D+<VdN<DPb=+<WQb+<VdL
+<VdL+<VdL+<VdL+<VdL+<XEG/g*ke<$51?6Qg;ZAohO*>](`:$6UH6+<k'.+tO'D+<VdN:-pQU
F*(i2+DtV)ALnrP0KjGjF(KDGF(KH7.4cTMCijB5F_#')/0K%KD.Rc2Ao_<iFD5Z2@;I&s@<jCH
FD5T'F!,.7F`MOS+Dkh1F`_29>](`:$6UH6+<i12F!+sh@<-4+-TsL5-s9844&o'<9L:0NEbTT+
F(KG9-UDQ]Depd_-W4YkAS`_U-W=tu@pp`iDB^V=+<VdL,'.U>F`_SFF<G'i@<-4+>](`:$6UH6
+<klDDfp/@F`\a(F!:r6+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6
,&(R33ZoV&@50\t1,<8^/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL,%,#"
FC0-.A79ak+D,P4D..O-+EV:.+ED%7F_l/@+E(j7G%#E*Dfp+D?se"oA79ak+Eh=:@WO.G$6UH6
>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+?1nZ
+<VdNBk/DK+<k?,@l\!Q3FX0`$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdL
HO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL
,'7C@F<Wag>7)Jq+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU
+<X3nD.OhA+AHEfBk1pdDBMVk@psInDf-[?HsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<Vdc+>Yr!
;futuBldi.+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL1,'gn2]u%ADKBB2+<VdLHsCP5/.*LB
+<VdL,((LU+<VdL+<VdL+<VdL+<WH_9jqZd9PJ>d+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL
+<Vd^0H`YjDg#\D88iNpHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<VdL+>tnr7!3Qd/PTqs+<Z&:
DB^V=+<VdL+<VkU+<VdL+<Vd^1c@$A1GCF?2'>M6Ch[<q+<VdLHsCP5/.*LB+<VdL,()=*/i57@
1bgdD2`NNI1c[H:cBM9N+<VdL+<VeS>](`:$6UH6+<VdNHlsOS+<Ve60ekR=1H.0O2)ZRNDf03%
FEM,*+FIF3+tO'D+<VdL+<l1U+<VdL+<Vd`1G1RB2E*QP+A?3cBlnK.AKW+C>](`:$6UH6+<VdN
HlsOS+<VdL+<VdL+<WEn1,C%UARTU%+<VdL+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL+<Vd_
+AHclFD)d>+<VeS>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+>Pl.1,U1B@<jJ9A0<!;+FIF3+tO'D
+<VdL+<l1U+<VdL+<VdL+<VdL+<Vdb+B;B.H6==Q+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/Lt(D+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)
/M/P+/M/P+.kN>)/M/P+/M/P+.pQs9/.*LB+<VdL,(*-oD.Oh4+<VdL+<VdLHphOeBkM<lFD5Z2
HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU>&SJ!@3?[8+<VdL+<Z&&;BReP
2)cX#+<Z%S2E*6B+<VdL+FG:S0H`2.+<VdL+FIF3+tO'D+<VdL+<l2$ASu'gDeri)+<VdL+FH^X
+>br31a!n`+FG:i0eP.&+<VdLHlsOd+>Ghu+<VdLHsCP5/.*LB+<VdL,()mpAStpi+<VdL+<VdL
Hq7-X1c@6I+<VdLHlt1(/i=ao+<VeS+<WB]1c6Bu+<VeS>](`:$6UH6+<VdNHpMR]DfT8q+<VdL
+<VeS85^Qe2`3N:+<VeS+>Pr02'="a+<Z%S+>Fur3?TFe+<Z&:DB^V=+<VdL+<VkU96+He+<VdL
+<VdL+<Z&&;BReT3&Vm%+<Z%S1,CO:+<VdL+FG:S1*@\q+<VdL+FIF3+tO'D+<VdL+<l20DfTl4
D.+P0+<VdL+FH^X+>c&52'="a+FG:g2(gR*+<VdLHlsOe+>GPm+<VdLHsCP5/.*LB+<VdL,()ar
EZd_XEc5c.+<VdLHq7-X1c[9J+<VdLHltC*/i=ao+<VeS+<WE^1,U0s+<VeS>](`:$6UH6+<VdN
Hras!A7]Ul@<?O(GT\,V85^Qe3AWE5+<VeS+>l)10H_J\+<Z%S+>P&q0d%S]+<Z&:DB^V=+<VdL
+<VkU;fHG\@3?[8+<VdL+<Z&&;BRhN2)ZR"+<Z%S1Gpd=+<VdL+FG:S1*AG2+<VdL+FIF3+tO'D
+<VdL+<l2-F`;#7Bk/>/+<VdL+FH^X+>ko12'="a+FG:i1bLX.+<VdLHlsOf+>P_q+<VdLHsCP5
/.*LB+<VdL,()[s@ruj6F`SZJ+<VdLHq7-X2)@'C+<VdLHlt=)/i=ao+<VeS+<WH_1c-<t+<VeS
>](`:$6UH6+<VdNHqAWmEZcJI+<VdL+<VeS85^Qf2)$p2+<VeS+?))/2'="a+<Z%S+>b2q1E[e_
+<Z&:DB^V=+<VdL+<VkU>'4:cDImWsASuX"Bcqdo;BRhS1GL!p+<Z%S1GCF8+<VdL+FG:S1a"M5
+<VdL+FIF3+tO'D+<VdL+<l2:F^ep"ATM?p@;TFhBm`HL+>l&:2'="a+FG:f2_Hd,+<VdLHlsOg
+>bqu+<VdLHsCP5/.*LB+<VdL,()[mE+ifm@ppK&+<VdLHq7-X2)dNO+<VdLHlt@(/heCj+<VeS
+<WNa+>Y,_+<VeS>](`:$6UH6+<VdNHrY',CLM$m@;-i,+<VeS85^Qf3&NN8+<VeS+>ko,2'="a
+<Z%S+>k8r1*@\^+<Z&:DB^V=+<VdL+<VkU6uujOF^efg+<VdL+<Z&&;BRhW2)??t+<Z%S1,CO?
+<VdL+FG:S2'=Y7+<VdL+FIF3+tO'D+<VdL+<l2!@rc!e+<VdL+<VdL+FH^X+>l/=1a!n`+FG:e
2D-j0+<VdLHlsOh+>Yhs+<VdLHsCP5/.*LB+<VdL,(*O)A0=]hBlA#7+<VdLHq7-X2D@!H+<VdL
Hlt7$/i=ao+<VeS+<WNa1bp0r+<VeS>](`:$6UH6+<VdNHpMRdBmF-/+<VdL+<VeS85^Qg0K:m3
+<VeS+>PW'2'="a+<Z%S+>k8u3?TFe+<Z&:DB^V=+<VdL+<VkU95eigAT2=$Ec6"A+<Z&&;BRkP
1cQU#+<Z%S2E3<C+<VdL+FG:S2'=b9+<VdL+FIF3+tO'D+<VdL+<l20Des64GT\+O+<VdL+FH^X
+>Pr;0H_J\+FG:j1bLX.+<VdLHlt1!+>GSn+<VdLHsCP5/.*LB+<VdL,(*@4Eb/s++<VdL+<VdL
Hq7-X1GLjH+<VdLHlt1"/heCj+<VeS+>PYo1G^-r+<VeS>](`:$6UH6+<VdNHpMRfBOPpl+<VdL
+<VeS85^Qd2`*K:+<VeS+>Yr/2'="a+<Z%S1,9t01E[e_+<Z&:DB^V=+<VdL+<VkU;IsK`CiseA
+<VdL+<Z&&;BRbU3&2U!+<Z%S2)m3B+<VdL+FG:e1E\J1+<VdL+FIF3+tO'D+<VdL+<l2!ChIHn
@UUB%+<VdL+FH^X+>bc02]s4c+FG:i2D-[++<VdLHlt1#+>bqu+<VdLHsCP5/.*LB+<VdL+tG5s
/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](_m+<VdL+C,<s
+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk?D00-,De*:%+=M&E@psInDf/oqDf'&.0I\,Y
@<Gq!De*:%+>=uH+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)
Bl@lr@rHL-F<Wag3@kL[+<VkBA0O&W,%EMd0kN4N2'ORY+<VdND.RftA79Rg,!$inI4P^J+<VkH
F`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X
,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lt(D+tO'D+<VdL+<l1U+@pEfAKWQI9kA?ZA8,Ii+A?]`@<?4%DBL'L>](`:$6UH6+<VdNHlsOS
+<VdL+<VdL+<WTc1H-FTF`)56F(HI:+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<Vd^0H_Js+B*E#
F(KG9+<VeS>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+<VdL+>Y-7@:q/cBl+t8+FIF3+tO'D+<VdL
+<l1U+<VdL+<VdL+<VdL+<WEn+@0ITG%E6rDfU/O>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+<VdL
2D?7AF`V=M9keJf+FIF3+tO'D+<VdL+<l1U+<VdL+<WEr2D?g@0J5:A+A-cmBjkm%+<VeS>](`:
$6UH6+<VdNHoEi61b^jF0f([G3&*0F3Ar#*PZ/bJ+<VdL+<Z&:DB^V=+<VdL+<VkU+<VdL+<Y#G
0fCX?2`3TQ2BY\3DJ*[*F_#&+HsCP5/.*LB+<VdL,((LU+<VdL+<WKs/iGOE2`ET:9OW$WFEM,*
+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL+>PW+1E]h3@<*J5+<VdLHsCP5/.*LB+<VdL,((LU
+<VdL+<VdL+<VdL+<WH_9lFokBHSE?+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL1,gg@2'>:q
GqNW<+<VdLHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<VdL+<WQb<E)>3+<VdL+<Z&:DB^V=+<VdL
+<VjY/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL+tG5s/M/P+/M/P+/M/P)
/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU:18!N+<VdL+<VdL
+FHRgF(o9)@<?4%DL>E(/O=2p/OX/_HrP,<1,LRRE_U7cHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+
/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU6tL7I@W-'k
+<VdL+FH^X+>br31a!n`+FG:i0eP.&+<VdLHlsOd+>Ghu+<VdLHsCP5/.*LB+<VdL,()mpAStpi
+<VdL+<VeS85^Qe2E!<5+<VeS+>Po/2'="a+<Z%S+>Fuq2'="a+<Z&:DB^V=+<VdL+<VkU;fHG\
@3?[8+<VdL+FH^X+>ki12BX+b+FG:f2(gR*+<VdLHlsOe+>ktu+<VdLHsCP5/.*LB+<VdL,()[s
@ruj6F`SZJ+<VeS85^Qf1Ggd.+<VeS+>u)02'="a+<Z%S+>Y,s1a!n`+<Z&:DB^V=+<VdL+<VkU
>'4:cDImWsASuX"Bm`HL+>l#40d%S]+FG:f0J5%%+<VdLHlsOg+>Gl!+<VdLHsCP5/.*LB+<VdL
,()[mE+ifm@ppK&+<VeS85^Qf2`WZ:+<VeS+?))/0H_J\+<Z%S+>k8a1E[e_+<Z&:DB^V=+<VdL
+<VkU:iC/dFa,#O+<VdL+FH^X+>Pr;0H_J\+FG:j1bLX.+<VdLHlt1!+>GSn+<VdLHsCP5/.*LB
+<VdL,()[mE+i[#A0<!;+<VeS85^Qd2`*K:+<VeS+>Yr/2'="a+<Z%S1,9t01E[e_+<Z&:DB^V=
+<VdL+<VkU;IsK`CiseA+<VdL+FH^X+>Z#;1*@\^+FG:h3%cm-+<VdLHlt1#+>Yhs+<VdLHsCP5
/.*LB+<VdL+tG5s/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/JX
DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<kE7FC0-.A79a+-u<g3@<?4%
DI7'qD.OhD.3NM:G$f?0A79a+0HpiH+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(
GA\TU$6UH6,&(R33ZoV%An!bVAM?(f/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6
+<VdL,#i5e+EMX5EcW@>BleB-A0>?,+CK5(F(KE(FC65$Df'&.Ao_g,+A"k!+DtV)ARlp)FCB32
/g)>F+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-
F<Wag0eb-c+<VdNBk/DK+<iZt0fEJr1Gp@-$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K
3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr
+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,4E.Y8O6?`:18!N/4=&jBkM<lFD5Z2/4`?//4*cjATD-Q
@;TR,:2MO`6rRGb/66UrB.QqH?V3(-0JG%GARf(>1,(C9/5L;#B5)67;f?f!@q@2_6nC]DDKBnN
7<EflDes?)H!a<bFCe]p+tO'D+<VdL+<j*\F)Pl;FDc"J=ALM+/6G\"2(W)W9R1M,?S#P80et@9
1Ft782D-pC2Dm0H/2K:=0KCsI2_lp>0JPR18O6?20JFVE@;TREG]-Z%Ebo9-/80-IE-"&n06_Va
/oG*7AS$+)GAhM<A90A;@<F2@Eb@$\0JPRrE,]i9G%G29DIIBnF"CZL9R1M,6[E<RBHU2aE-5W+
Bk&9)Ec5o8F(&lH6"4nRCisi;D]ib8+CQC)Bk)7!Df0!"+Dkh5@:OFrDfp+DF*1r5FCB&sAKY])
+EV:.+EM%,/S8]>DJs]0C`l\qG/L"oDIFZ*@3AufF)Pl;FDc">-r_fO/mN9</.*LB+<VdL,!f^I
D..H985^Qi3B&KD1H73M/C(a[+@U<b/3tg@1,V$I/Mo.93%Qg;3&iHG1bLXD2)?sA/1i\4/i,1<
2E*BB/1f)V0e>b6Be3M,+tO'D+<VdL+<j*]BOu4%@<*ni;BReT1+Y@A3&iJ7YolJUBe2P$/M&S.
1c6g>1bLU?3&NHI/1i_</i#4@2`3BB6#pCCBk&\FcESohEbR((BOr<(@;TQuG@>P8DfTQ)Bl7?q
Cj@-hEa`Ek@lbabU=cX$Yoq\sfnA%5fn\4b+NhF:J`42+BlY>)DCoa7BQ>4D-ZWpEATB/>+D#G$
-RgZQDB^V=+<VdL+<Vjo@q]RsA1U8L+>PZ3/2K7@0eCVZ+@BRY/3tg@0JkdE.lB7B3@ls=1c?m>
1+k=@2DR!C/2]@=3&*9F3&`B>/C(^U6Xb$e>U!coEcZ=F@;p1%Bk:ftFDi;I[ie%HF)u&6E+N`l
AKY])+EV:.+B*&aCi3['AKXfcATMcpDB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN
$6UH6+<jQI/g+tA@:X(iB-:\t@<,ddFCfK6+D,Y4D'2hX7P-SB6W7#.8O6?!F*(i2+Cno&@3B/r
Ch6jh+tO'D+<VdN3&!$/HS-F]ART*lC2dU'BHS[O@:WneDK@IG@:O(o06CcHFC\g%@4u>'F^K#p
D.R6bF*(i2F'g[V1,:J(G]Y;W$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D
+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>GT%$6UH6,&(R33ZoV(3&`ZS1LW-b/.*LB+<kZ6FCA]gFC?@S
+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@
F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<jQhD.R6#F*(i2F#l-73F$GG
/.*LB+<VdL+tG5s/M/P+/M/P)/M/P+/M/J)/M/P+/M/P)/M/P+/M/J)/M/P+.kN>)/M/J)/M/P+
/M/J)/M/P+/M/P)/M/P+/M/J)/M/P+.pQs9/.*LB+<VdL,()[cF)Pl;FDc#E6"=>?@<-`]@q]Fo
DIIR56"=SBEb'P`@rc!eHpM7_Fa/:"@s)6lDKC1kA8#C`ATD4,6"FY;Eaa>]A8#[nHsCP5/.*LB
+<VdL+tG5s/M/P+/M/P)/M/P+/M/J)/M/P+/M/P)/M/P+/M/J)/M/P+.kN>)/M/J)/M/P+/M/J)
/M/P+/M/P)/M/P+/M/J)/M/P+.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q
+<VdNCi<`mF*(i2F+,5e>](`:$6UH6+<klDDfp/@F`\`R:18!NA0>r8@<-EM-S-BF,!$r?5uh8e
@;TR\DB^V=+<VdL,'.U>F`_SFF<E:l+F>^`8O6?`:18!N+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm
?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<idT0P!.!2Dl[0$6UH6,&Ln5@:Weg@3R`TH[RFP
+<VdNF)Q2A@q?iF+Bo0q+<VdN6"FM?FD5Z2@;I'-FCB3205k<7ARfh'+Ceht+C\n)@:Wn[A0>?,
+D#(tFD5W*+EV:.+A"k!+D,>(AKYo3+C]V$DB^V=+<VdL,%PV+DJ()6BOr;uDes6.GA1r-/g+D:
+tO'D+<VdN>](`:$6UH6+<jQlG9Cg5C1UmsF!,@3ARlol+DtV)ALnsEBkM+$+CSbkDKBN1DBL?*
5q+?-@;]TuA7]7eBl7@$Bl@l3-q%WV.9pa7/.*LB+<Vk?DfQtBBOr;Y1,(C9/heDZE,T6"/g)>F
+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag
0et9e+<VdNBk/DK+<kAUA2#tt3+F-`$6UH6,&Ln5@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6
+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D
+<VdL,'7C@F<Wag>7)Jq+<VdL+u1u32_m3D/i=b/2BZ?c0eP.>1GUsN3B9)[3B9)[+>bi+1G^gC
+>Gl93$:""1,'h)>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lt(D+tO'D+<VdL+<l26ASuX3Hn]pj+>Fum/i>C=0et^F1,gmF2Dm<L1E\D-+>Y^!>](`:$6UH6
+<VdNHlsOS+<Z%SHlt=*+>>E-0fD$K1G_!N2DI*H2`EN80f^@42LJbI+tO'D+<VdL+<l1U+<VdL
Hm!ej/i=b*/ho(<1c[KS0JtdD0fD$M1E[eq+>c!(>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lt(D+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[FEarZ)3ZqW6
+<VdL,#1HW+Dk\$F`S[EB.b;e3@lm=0O/K>/.*LB+<Vk%69R@P?T0\l0K:jE+>bi+1G^gC+<XEG
/g*K!F*)><>](`:$6UH6+<jr_6p3RR0f_3Q+>Y,q0O/K>/.*LB+<Vk.:H^`]0O/K>/.*LB+<Vk'
67sBhA7Qg$@VTIaFE8RBDfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)/Keq>D.P7@Ea^LAA7]7UDB^V=
+<VdL,!f!k4Y@j*4?GSO<b6/kF!iCf-p0=@/iPR@1-$d74>AfJ1c-mH10e]@/.*LB+<Vjo:I72s
+=nil4s2783[[]i8mb>%D.Ohc6:tT_6!m5>0JG1':I7Z\6tKk88hr(S0IJ:l/1r&2:I8<(+tO'D
+<VdN6tL1V@8q;DG%G].A7]+gBldj,ATV9B3Zp:<>](`:$6UH6+<i16EcW@5:gnB]F!j+3+=LAe
6p"CE4%qt&4@)b0.3NYFF(KE(F<Dr3ASuX3-X:O5/.*LB+<Vj^+>>'PEaa$#+=BQgCij)bF&-sj
EbT&q?ZKk%ATMF)?RK)r+tO'D+<VdNF)>i<FDuAE+Ce5VEc#l&DB^V=+<VdL,'.U>F`_SFF<FV)
F!:r6+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV&0OZ_I
3FuVC/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL+sS<T9jqaRFCAm$Bl7Q+
@;]TuD/Ws!ApJ*.B-:T&Bldj,ATV<bDB^V=+<VdL,$]"0/.*LB+<VjoCht5%EbTT+F(KH$+Cf>#
ALns7De!p,ASuTuFD5Z2+CT.u+EV19F<GX7EbTK7F!+n3AKZ&9DfTE"+DG^9FD,5.8l%htA8,Oq
Bl@ltEd8d8Ap&3:?nNR$D]iP'@;]^h>](`:$6UH6+<ko@AKYK$A7Zm%EZfCFDBO%7AKZ)+F*&O7
@<6"$+F.mJ+Dtb%A0>u4+DG_7FCB!%+EV:.+A,Et+Co1rFD5Z2@<-'nF!+k&F`_\4+CT.u+CK>6
Bl%iu/g+D:+tO'D+<VdN>](`:$6UH6+<jg,AKXSmF!,F1@r#LcAKYhuDII0hEZfIB+DG_7FCB!%
+EV:.+A,Et+CSekDf0V=?tX%gATD3q05>E9?n<F.B4YslEa`c;C2[WnDe!p,ASuTt/g*_t+F.mJ
>](`:$6UH6+<kK-G%De1DKBo.Ci!Zn+CT)&+EV:.+CSekDf0V=8l%htBlbD*CiX)qA9f;9DBO4C
F`JUGH#n(=D(](2+tO'D+<VdN>](`:$6UH6+<j*`FCfJ8Bl8!6@;KaoDJ((a:IH=9D`V-@+tO'D
+<VdN>](`:$6UH6+<iNm+@L-lDJX6"A0>u-AKXT@6m-#_D/^V=@rc:&FE9KJDB^V=+<VdL,$]"0
/.*LB+<VjN+<Xm%FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;S,F*(u6
06MANCi_4CC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkA:@<6O%
E\DQWBl%iCBkh]<>](`:$6UH6+<hpN+C&e./.*LB+<VjN+<Xm%FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=04Ja9@P;S,F*(u604o?KF"V0AF'U2-FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=04Ja9@P;S,F*(u604o?KF"V0AF"(@3+tO'D+<VdN+<Ve3DB^V=+<VdL
+s8!N@;]TuE-67FFD,6&+DG^9@3As,FCf<.?m''"Ch.*t/mN9</.*LB+<VjN+<Xp,+tO'D+<VdN
+<Ve3DB^V=+<VdL+u1bn;flGgF<F1O6m,oUA0>AqARfKuAoD]4FD,5.E,oN2ASu!h+E(j7?tOP'
F'p,!DIaktF`_>6F'pV*DB^V=+<VdL,$]"0/.*LB+<VkWIXXmoDB^V=+<VdL,#1HW+EMX5Ec`Er
:IJH*+tO'D+<VdNCi<`m+=Cf5DImisCbKOAA1(W"+tO'D+<VdN-p'I;Ap&3:+E_d?Ci^sQ+D!/J
De(4C>](`:$6UH6+<l8`IU$b7/.*LB+<VjN+<Xp,+tO'D+<VdN1G0e".SjquGp$g5+C]82BHUi"
@ruF'DIIR"ATJu&Eb-A1Ble?0DJ()&D`T?t>](`:$6UH6+<k'.+tO'D+<VdNIXZ`<>](`:$6UH6
+<k]7G@VgDF`_>6F!i(Q:-pQU@rc-hFCfM9F`_>6F!,"-@ruF'DIIR2+DG^9-[p2ZATBG=De*Bm
@rucFF`_>6F!k41+tO'D+<VdNDIn$&+=CcDFE8fP+<XEG/g+YEART[lF!,(;FE8R=DBL<UF`V,7
05>E9A8,OqF"_-JFE8g7DB^V=+<VdL,(=ui>](`:$6UH6+<k'.+tO'D+<VdN1bKnEDdd0!FD,5.
A8,OqBl@ltEb0;Q>](`:$6UH6+<k'.+tO'D+<VdNIXZ`<>](`:$6UH6+<jQI/g+tK@:UL'FD5Q4
+D,>.F*(Z)+tO'D+<VdNDe't<F`_>6F!i)7+>Y-YA0<6I>](`:$6UH6+<iK_3\V[=C2dU'BHS[O
FCf<.06MANCi_4CC3(b-DB^V=+<VdL,#1HW+ED%&F_PZ&+ED%*ATD@"@qB^dDB^V=+<VdL+tt-P
Ci<d(-9`Q#/g,1GG&JKN-X:O5/.*LB+<Vk'67sC&@;BEsAnc:,F<G%,DIIR2+C\bhCNXT$DB^V=
+<VdL,&gt#CLeP8F`_>6F!k41+tO'D+<VdN>](`:$6UH6+<jQI/g+tK@:UKmF`_[IGA2/4+E_d?
Ci^_;DBNn,FD+os+tO'D+<VdNDe'tP3[\N^FE8RIFD5Q4-QlV91E^UH+=AOADB^V=+<VdL+tt0$
0H`JmE+*j%+=DV[ASlB>Ap&3:/no'A-X:O5/.*LB+<Vk'67sC$AR]drCh+Z/AS,LoASu!hF'NT,
/.*LB+<Vj^+D5M/@WNk[+FPjbEb0E4+=AOADB^V=+<VdL,#1HW+EV%-AKYT!EcZ=F@VK^gEd8d:
@:O(qE*R9)/.*LB+<VkI@:O(`+=CcDFE8g7DB^V=+<VdL,$]"0/.*LB+<Vk'67sBjCi=B++Co1r
FD5Z2@<-'nF'NT,/.*LB+<Vja+E(d5-RW/:+tO'D+<VdNIXZ_i$6UH6>m_\sI4P^J+F=G<+<Vk<
ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W,%WYf3+b$W@3R60+<VdND.RftA79Rg,!$in
I4P^J+<VkLDfp)1AKj/X>7)Jq+<Vk-BOr<,ATMr9De:,6BPDN1DJsW.@W-1#+=^f@F*2>2F"/;X
Dfm19@<Q3)Bl8!6@;KakA0>8lF`_\4+CT.u+CK>6Bl%iu/g+D:+tO'D+<VdN>](`:$6UH6+<jC!
+CT)-D]iJ0F*2>2F!+m6@UX=l@j#Q)Dg-#/A7oHrDe:+a:IHfX;e9M_FD,5.8l%ht9jqp^@;I&u
DfQt2ATV?pCi_46DB^V=+<VdL,#i5e+A,Et+AH9^F^])/BlbD-BleB:Bju4,ARlotDBO%7AKYAn
ASu("@;IT3De*Bs@s)X"DKK8/@:WneDBLMRF(JoD>](`:$6UH6+<k'.+tO'D+<VdN+<VdL+F[a0
A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EQcDB^V=+<VdL+s8!N+<Xp,+tO'D
+<VdN?tsUj/oY?5?m'0)+CT)-D]iJ3@;0Od@VfTuDf-\%<+ohc8l%ht:gn!J>psB.FDu:^0/$aO
@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM5JV$6UH6>m_\sI4P^J+F=G<
+<Vk<ASc0iFEqh:,!$hjD..I#A8c[0+tO'D+<VkBA0O&W,%`Q>Ai""1@Nm?1+<VdND.RftA79Rg
,!$inI4P^J+<VkLDfp)1AKj/X>7)Jq+<VjQ,9UB7Bldj,ATV<&FCfN8+EM[>FCe]p+tO'D+<VdN
>](`:$6UH6+<jNgDL!@4EbTT+F(KH$+EV19F<G(%F(KD8@<,p%Bl5&$Ap&3:?nNQlEc6)>F!,C5
+EV19F<G(%F(KD8@<,p%@ps1iARlogDB^V=+<VdL,'.m@FCfMG+B3#c+Cf>-FCf?3F!,C5+EV:.
+CK5(F(KE(FC654F_Pr/+DGmX+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4
+<VdNAU%crF`_>9DI6mlF`):F3Zp.5/.*LB+<kN1,!$hj3&NTR@:<\)+tO'D+<VkFATV?k@<>p%
3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4+tO'D+<VdL,&_UG
E-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<VjY/LrD)/M/P+/M/P+/M/P+
/M/P)/M/P+.kN>)/M/JXDB^V=+<VdL+<VkU0mmnYASu'i+=M8S061t[+>#d)Ap&3:I!'OFCiau/
DB^V=+<VdL+<VjY/LrD)/M/P+/M/P+/M/P+/M/P)/M/P+.kN>)/M/JXDB]E1+<VdL>m_\s+<Z(>
+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6+<jQI/g,(OASrW&F`_[I@;]TuF`_>6F!*%W@<6L4D.R6#
DfB9*+E_RDBl"o0DffQ"Df9D6ASu$`DB^V=+<VdL,&D1+A0<74ASu("@;IT3De(5#DB^V=+<VdL
,&_!74$"a$F`_[IF`_>6F!i)7+>Y-YA0<6I+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X
,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp.6/.*LB+<kN1,!$hj@5qaU3+4U"+tO'D+<VkF
ATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4+tO'D
+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<VjY/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lt(D+tO'D+<VdL+<l2RBldj,ATV9fFCB&B?ZU(&CLnV2+<VdL
+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdN
Hu`qBATMF)?Y+:tAStpl?ZU(&CLnV2+<VdL+<Z&:DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lt(D+tO'D+<VdL+<l2RBldj,ATV9rAS$"*?ZU(&CLnV2+<VdL+<VdLHsCP5
/.*LB+<VdL+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)
?Z':qF*(i2F'iKgF^K3,Deio,+<Z&:DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/Lt(D+tO'D+<VdL+<l2RBldj,ATV9s@<Q^6@<-ErF(&ZhEbSm%D/X3$HsCP5/.*LB+<VdL
+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHu`qBATMF)?ZKk%ATMF)
?ZU(&CLnV2+<VdL+<Z&:DB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lt(D
+tO'D+<VdL+<l2RBldj,ATV:$@;]soEaNm)Deio,+<VdL+<VdLHsCP5/.*LB+<VdL+tG5s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X
>7)Jq+<Vk'67sBsBleA=FCfN8+Cei$ATJu.DBL?JBldj,ATT@DF*22=AR'*s/.*LB+<VkLD/XQ=
E-67F/1r&n/g)qmB6%r6-ZWpBATMF)-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6
A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$2(T(W+<VkBA0O&W+uWmb@l#o!A0NQ3+<VdND.Rft
A79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL
+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN:-pQ_EbTT+F(KH#
EbTT+F(KH#F)>i2AKZ(H/KcH^Bldj,ATT@DF)>i2AKZ)+F*)IU>](`:$6UH6+<VdN:-pR<DB^V=
+<VdL+<Vk'67sBjEb/[$ARmhE1,(I>D..H?2dC5E/.*LB+<VdL,#1HW+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'
67sB91LY6C0JO\dDe!3tBl@l3DIIBn+CSekARo%`+tO'D+<VdL+<jQI/g)o*@;p6B1E^+:C3=T>
+D,P4+EM[CEbTT+06:]H+D,>(FCfK,DJ*3l+tO'D+<VdL+<jQI/g)o*@;p6B2]uO>C3=T>+D,P4
+EM[CEbTT+06:]H+C&e./.*LB+<VdL,$]"0/.*LB+<VdL,&D1+A0<7?Bldj,ATT;)DB^V=+<VdL
+<Vk5DB^V=+<VdL+<Vk'67sBtAS$"*+E1sG+?;G50eb:dDB^V=+<VdL+<Vk%69R@P?T0\l0K:jE
+>bi+1G^gC+<XEG/g*K!F*)><>](`:$6UH6+<VdN=\V:I3Zp.;3&i$:+>PWUDB^V=+<VdL+<Vk.
:H^`]0O/K>/.*LB+<VdL,#1HW+CSek+E(_(ARfh'+Du+>+DG^98O6?!DIIBnF!*%WDImBiF!*%W
DIIBn/0JtA/0JJ7@pEmq/.*LB+<VdL,!f!k4Y@j*4?GSO<b6/kF!iCf-p0=@/iPR@1-$d74>AfJ
1c-mH10e]@/.*LB+<VdL,!f!k4Y@j.-8%J)-p'I;:I7Z\:18!N+AY<r?W'0s8hr(S0Ha.X8matt
@p_h`0JG1..3L/o+@/di>](`:$6UH6+<VdN6tL1V@8q;DG%G].A7]+gBldj,ATV9B3Zp:<>](`:
$6UH6+<VdN-WY8/+Ce5VEc#kF4ZX]6=\V:G<DP\M69@:q:I6KQEbTT+F(KG9-WXerF`Sp8DB^V=
+<VdL+<Vj^+>>'PEaa$#+=BQgCij)bF&-sjEbT&q?ZKk%ATMF)?RK)r+tO'D+<VdL+<k'.+tO'D
+<VdL+<jQI/g,=GCis<1+CT;%+EqOABPD?,0ea_eBl8'8ATJu4Afu2/AKYi$AT`&:@W-1#+C&e.
/.*LB+<VdL,#1HW+ED%7F_l.B/KeqLF<G4:ART['@Wcc8B5_^!+D#G/F_>A1AoD]4A7]Ur+EqaE
CKta$/.*LB+<VdL,#)W[F`VD6DEU$'+=f*M+s8T_>p)$Z+>Fug>TtmF>p(jW+>Pes/0HZ-+>beq
/34n/+>l#]DB^V=+<VdL+<Vj_0H`P%4t\L99k@mYF)>W/+>"]d03f\D0d'aE2D?7.+=^V?0d'aE
?SWaN/mKST+?M>$HX%aL+BEN(+C&e./.*LB+<VdL,$]"0/.*LB+<VdL,"t<d3ZoPP0ekR=1H.0O
2)ZR61G1RB2E*QP+<Ve%67sBTATDKqBjkm%>](`:$6UH6+<VdN=\V:I3Zp131,C%/+>Pl\DB^V=
+<VdL+<Vk.:H^`]+>t>b+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+AGd6+B;B.+E(k(F(KGuDB^V=
+<VdL+<Vk5DB^V=+<VdL+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T6
+C&e./.*LB+<VdL+t$90+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%B6#:1PCaV:l;JBcT
CaV:l;fHG\@4,;t+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI/g*K$BkM+$+B*AjEcW@8DfQsU0JYF,
1E\G3+AHEfBk1pdDHq''/.*LB+<VdL,#1HW+D>k=E-"&n06_Va/n&R5@;]L`/n8g:04ApDEc5i6
D0[dDEbT0"F=hQU@<-EBH>.>.De*E43&<HL2D6g>1,CL91G(@@>](`:$6UH6+<VdN6?>:N+?MV3
6#:XOBlY=aASu'g+@^9d@;KUcF`\`lChI[&+@0gSAR](g@;[2cBkM!n+@BRVASc0k+@9XUCghF+
Bm;"1DB^V=+<VdL+<VjpF$2Q,6?=\>3[[7*FCf9$AT`'*+B)upBm"J>:i^JaH#IRC:iC/dFa,$,
AS6.%F`S[(E+rfj+@1$XFEMVHF!*bdFCB3$F!+LpB43/1>](`:$6UH6+<VdN>](`:$6UH6+<VdN
-W5".@o-TSD0%'f3ZohR9gh'C:HM6:.3NYFF(KE(F<Enk>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQUFE1f-F(o`;+DkP/@qZus@;0auGp%<BCht57Bldi=F(KH7+Co1uAn?!*2'@!Z+>GPmD/!m1
FCfMuDB^V=+<VdL+<VjpF&[0gDKBN64ZX]G+>Gi,0ea_0/28n&1,UU;2BXe5/29+,1+Y.>+>bf(
0fU:41FtRA3$:(5>](`:$6UH6+<VdN6??+H@;^.#F?MZ-6??+H@;^.#F<E+W0f^@30e>(6+>GT%
1,0n//2Aq&0ek471E\J1/2A>*1b:F*1c-a@+>l,03]J6=>](`:$6UH6+<VdN>](`:$6UH6+<VdN
:-pQUFE1f-F(o_=@;L%"FEM,*+Co%rEb/g'>](`:$6UH6+<VdN6?>G/F?MZ-2)QL93$9q6+?2;&
2DQC23$:1>+>koZDB^V=+<VdL+<VjpF$XVa4ZX]PF$XVa/2]4+1-$I70d&D3+>l,$1Gp:52'=V6
+?25`DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk-9i*u6+F?.S+u(3<F'NT,/.*LB+<VdL,!en%4ZX]6
-p04G/2/M"HR:p!<)$1<+=o,f6?>G/F<Fh++tO'D+<VdL+<jc_<'<8b-n%244#.p7.40Bg4s3g!
:amM</g*K%<,uDbF(o`$DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sBhCijB5F_#')+DkP/@q[!,
D]gbWA7]CoAS#+a+tO'D+<VdL+<iN_4Wlp@0-Di">TtmF5tk6_DB^V=+<VdL+<Vk5DB^V=+<VdL
+<Vk'67sC&Ea`j,BlkJ>Bl.F&+DkP/@q[!,D]gbWD/!m1FCcS/DBO.AEcZ=F@psFi>](`:$6UH6
+<VdN0d&V%4t\K2Hlsgq0H_T$?92FJ+C-*D+>G!c>TtmF<)Q[E+>"]o0H_T$?92FJ+C-*F+>Y-e
>TtmF<)Q\#DB^V=+<VdL+<Vk5DB^V=+<VdL+<VjU8O6?!:-ho.4ZX^%Ddd0tFCB32+>@&<+tO'D
+<VdL+<i4\/mKST+AP4'.6T^7HTGCU0d'4W<a9Md/.*LB+<VdL+t.dj>TtmF8O6?*4ZX^43a<j`
+A"k!>](`:$6UH6+<VdN-Ve)nEcW@5:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+AQ?g?W2&T
EaMRMD.Qsi+tO'D+<VdL+<i1)@<HU3+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%d5uh8e
@;TR\DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk'67sBkAS,@nCige)DB^V=+<VdL+<VjU9kA?ZA8,Ii
EcW@>:18!N+ELG%+Ce5VEc#kF4ZX^"@<Gq!De*:%+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI
/g+\5FCcS5Aft)iF`MUIF*(i2+E1b0FEo!>Bl7L&>](`:$6UH6+<VdNF\5%b3Zr0[Ch@]t@;I'/
=\V:I3Zp131,9t,0H`)1>](`:$6UH6+<VdN<D6Cj<BWAc0f(O:0JPRE0d'gY2(g[A1GCOgDB^V=
+<VdL+<VkN<E)=K3Zqci/i=bVDB^V=+<VdL+<VkN9MIfC4ZX]D/hgOJ+tO'D+<VdL+<kr%85E,e
4ZX]C>](`:$6UH6+<VdNF\Y4s76N[S-WOu*EciKV+EMX5EZf=0EccRLA8,pmE[P+0+tO'D+<VdL
+<kqr@<--H3Zp+]DB^V=+<VdL+<VjU<GZeuF`MOGCeeDUAKZ%lF!+sh@<-4+-TsL5.!8Ze6p#N`
6p"CB<DlgYF]DC.4*=4k5t="Z9LqrW>!$k%5tsd0F[TYYCFLB?@<Gq!De*:%+>@&<+tO'D+<VdL
+<i15Cisc@EcW@>:18!N+ELG%+Ce5VEc#kF4ZX]6F]hF,4*=.`4&nsS;H5f$<E)=IF\GLq7ltie
85E,e4*=:a9gq-d6t(+O.3NM:G$f?0A79a+0O/K>/.*LB+<VdL,$]"0/.*LB+<VdL+t$,oG&hXH
CeeDUAKZ%lF!+sh@<-4+-TsL=Ci<flFD5Z2?[64!Ci=N=FDl&.INU@*1G^.6+>Pf,2`3$,Bjl-k
FDk\uGp"eGDB^V=+<VdL+<VjU:18<dF!,9o@;TQuF&I'%@o-TSD0%'f3[ef_@psInDf/oqDf''7
+>Gl62BXq$0fUU)DII]qFDk\uGp"eGDB^V=+<VdL+<VjU:18<dF!,9o@;TQuF&I'%@o-TSD0%'f
3[ef_@psInDf/p)Cisc@INUC"1c$75+>PAgDII]qFDk\uGp"eGDB^V=+<VdL+<Vk5DB^V=+<VdL
+<Vj^+>>'PEaa$#+=BHN66K!6AT`'2Bl5%oEcW?s66KE*6m,K*+B!8'6?=89F&[0gDKBN6+@:-8
Cige!9i)ru9N3-6;H+c6@<Q[4+A$!aEcW@5:gnB]F!k41+tO'D+<VdL+<iK^0I14M@<6!&-p'I;
8O6?!:-ho..3L/a.!mRO+u(385uoEc+F>_G+u(335uh0-+tO'D+<VdL+<iK^0I14M@<6!&-ZrQd
6m-VE6m,K'<Dlg>F]DC.+E^@P5t<&?9LqrW=s-ONEbT&u@;^+,+B<6#EclDD+E^(\Ebce?:-hTC
+Dae]D.Oi2;KF3jDB^V=+<VdL+<Vk5DB^V=+<VdL+<VkLD/XQ=E-67F-W!*-;aj)83ZrHWF(KE(
FC0'&F(KE(FC0*+Deio3>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'
67sC%BQ&);FCfN8+Cei$AR'*s/.*LB+<Vj_+Co2-E$-NKBldj,ATV:"Bldj,ATV:#D/X3$-R&m?
+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$
2Co1X+<VkBA0O&W+u;/:AN2S)2Bj[Z+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q
+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB
+<VdNFCf]=,!$iN$6UH6+<VdN:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GC[@
2JOs%1GgsJ>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6
+<VdN:-pQU@UW_k?Z^3s@<it<:-pQUDIIBnA0=3I@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57
B-;;7A79agDB^V=+<VdL+<Vk'67sBmD00-,De*:%+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7
F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"4P:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VD
ATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)SJ:-pQUCi<`mF!,L;F(KE(F<GXH
@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<Ve%67sBu@;TRd+DtV2BkLjrBl@l3F*(i2
F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:
Amo^o+?!R\+E(_1ATDs.DJ().BleA=De:,6De*:%-Z^DJ@<Q?t@<?4%DBO"B@<-EoDB^V=+<VdL
+<Vk'67sC$Bldj,ATT%;+<Ve%67sC$Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:
$6UH6+<VdN>](`:$6UH6+<VdN+<VdLAo2WsFDk\uGp%!5G$f?0A79a+Ci<flFD5Z2?YF@pAKW[3
DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N6om@OEbTT+F(KH#@<>pq11,*>DeiohDB^V=+<VdL
+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JtRCC,%J"1c73sDB^V=+<VdL
+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'67sBi@:FLhFDk\u
Gp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL
+<jQI/g+bCFC0-.A79a++<XEG/g+bEEc#6,+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'
67sBp@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=
+<VdL+<Vk'67sBsDdd0tFCB32+<Ve%67sBsDdd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL
+<jQI/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+
FDk\uH!G52/.*LB+<VdL,#1HW+DtV2A79b"BleA=+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!Ecu/7
B-;#)F*&OCAfu26A79a2F!,@/G%kStFD5Z2+EMX5EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K
+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL
+<VjN+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3De!3tBl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.+tO'D
+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV9jF)Y].@;B4kD/X3$>](`:$6UH6+<VdN:-pQU-us$CATMF)
.3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GC[@2JOs%1GgsJ>](`:$6UH6+<VdN:-pQU/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQU@UW_k?Z^3s@<it<:-pQUDIIBnA0=3I
@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBmD00-,De*:%
+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"4P
:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`m
F*(i2F!)SJ:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%
+<Ve%67sBu@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL
+<jQI/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:Amo^o+?!R\+E(_1ATDs.DJ().BleA=De:,6De*:%
-Z^DJ@<Q?t@<?4%DBO"B@<-EoDB^V=+<VdL+<Vk'67sC$Bldj,ATT%;+<Ve%67sC$Bldi:+EVX4
DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6+<VdN+<VdLAo2WsFDk\u
Gp%!5G$f?0A79a+Ci<flFD5Z2?YF@pAKW[3DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N6om@O
EbTT+F(KH#D.R:$F'j!*DeiohDB^V=+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:
F"'-m1,(I>0JtRCC,%J"1c73sDB^V=+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/PZDB^V=+<VdL+<Vk'67sBi@:FLhFDk\uGp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;
F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+bCFC0-.A79a++<XEG/g+bEEc#6,+EVO4
@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!+EMX5
EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<Ve%67sBsDdd0t
+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&
B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+DtV2A79b"BleA=
+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!Ecu/7B-;#)F*&OCAfu26A79a2F!,@/G%kStFD5Z2+EMX5
EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4
Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<VjN+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3De!3t
Bl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL+<j6A<?Q<rF(KE(F<EkC9J9.:;H-1?;bpCm
80CHD9keJfAo_I&06;5DFE8Qf4Ztqk4^;kK/.*LB+<VdL,'%+9+Dk[uDE8nI0J5+>3ArlR1cRBN
3A<-C3&=fW+tO'D+<VdL+<k?1F*)G:@Wcd,Df-\+@WQI(F`_1;D/!m1FCcS*BkCsu>](`:$6UH6
+<VdN+>=o\0d%So+<WH_+>b2u+>t?$>](`:$6UH6+<VdN0ea_/2'=e;+>u)"1,g=7+>t>t>](`:
$6UH6+<VdNF*(i4F!+n#F)Pl;FCcS3Bl8'8AKYMtAnH*hDB^V=+<VdL+<VkL@;Tt"AKZ&.H=],[
+<VdL+<Vd^2DJHS+tO'D+<VdL+<kZ:DJ<s1D)rd^+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,&Lb5
Bl/!03ZoOf+<VdL+<VdL+<Vdc>](`:$6UH6+<VdN0lqFZEHP]1FD5Q&3ZoOf+<VdL+<WCDDB^V=
+<VdL+<Vj`DIal0F^]<4Bl%?A+<VdL+<VdL+>R2>+tO'D+<VdL+<iU^A0>l7@<-I(Ch5XM+<VdL
+<VdL1L+fA/.*LB+<VdL,%bP0F*&OADe*E?+<VdL+<VdL+<Vd]>](`:$6UH6+<VdNAnc:,F<G"0
FD5T1A7[eE+<VdL+<WUJDB^V=+<VdL+<VkFARTI;+<VdL+<VdL+<VdL1+k@:1,iHU+tO'D+<VdL
+<klKA0>DoG&B>`+<VdL+<Vd]/i,=D3F$GG/.*LB+<VdL,'.O2GA^u5F#kEd+<VdL+<W?j3&!0D
>](`:$6UH6+<VdNCNXZ>Df]W63ZoOf+<VdL+>YW/1Gh'rDB^V=+<VdL+<Vk)5uU]N6om@OEbTT+
F(KH#DII^0FCB32?Y*_i?ZU(&CLpag+tO'D+<VdL+<jQI/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28
Eb$S>.68S,0JYF<2)."(0etOA2)ecX+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M14F+tO'D+<VdL+<jQI/g+V3@X2=&De*:%+<XEG/g,%?D.R6#6=F>KCi=3*@;[3/FCB32
+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<+AP6U+D,P4D..N/
FDk\uGp%9AEaj)4Eb0<7Ciip"+tO'D+<VdL+<jQI/g+k:F^K6/A79a++<XEG/g,%?D.R6#8O6?!
F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+tK@:XG$@<-E3+<XEG/g+tK
@:XF%EbTT+F(KG9F*(i2+Cno&@9d[o/.*LB+<VdL,#1HW+DtV2?Z^3s@<it<+AP6U+DtV)ARlp$
@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUDII^!@<l['
F*&NI:-pQUF)-%DF(&ZhEbQXS?SEU@@WQ+$G%ki,+Dbb5F<GL6+EVO4@<j5A+DtV2BkLjrBl@l3
F*(i2F'NT,/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'
F!,C5+EMX5EcYK'+tO'D+<VdL+<k'.+tO'D+<VdL+<hpN+<Y95FC0-.A79a+DII]qFDk\uGp$pA
@psInDf/oqDf'&.0O/K>/.*LB+<VdL,$]"0/.*LB+<VdL,#_-;+ED1;ATMF)+@/[p02>;@<(JZ@
:K:@b+@pNIBl5&*Eb05DF*(i4F!*V/4Ztqk>](`:$6UH6+<VdNEaa/7BQ@s(DBNe-@;\+K?SF)d
1,(O=3&*<I1,_!G0K(X@>](`:$6UH6+<VdNA8-+,EbT!*FD5Z2+CS`#DesQ<AKYi(DKU&4+Co1u
Aoh3p+tO'D+<VdL+<hp^+>I,=+tO'D+<VdL+<iX%+>I,=+tO'D+<VdL+<klK@<?Q5@:F:rCisi2
+Dkh1F`_1;A8,XfF'NT,/.*LB+<VdL,'.10E,9).F(or33ZoOf+<VdL+<Vd`3F$GG/.*LB+<VdL
,&M%3Bl/!03ZoOf+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,&Lb5Bl/!03ZoOf+<VdL+<VdL+<VdL
0jJT?/.*LB+<VdL+u+.\+E;O4Ecc#3ANCqV+<VdL+<VdL?X.Im/.*LB+<VdL+u4%H+E;O4Ecc#3
ANCqV+<VdL+<VdL0O/K>/.*LB+<VdL+u=7M+E;O4Ecc#3ANCqV+<VdL+<VdL0jJT?/.*LB+<VdL
,%bP0F*&OADe*E?+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,%bP0F*&O5DKKT0De*E?+<VdL+<VdL
0jJT?/.*LB+<VdL,&Ln"DE8m_+<VdL+<VdL+<Vd\/hf%71gFoB/.*LB+<VdL,'.j:+Co&,DE8m_
+<VdL+<Vd\/ho1<3F$GG/.*LB+<VdL,'.O2GA^u5F#kEd+<VdL+<Vdb/iPaG3F$GG/.*LB+<VdL
,&;=AFDl57F#kEd+<VdL+<WL"/hf%73*^>F/.*LB+<VdL,#_-;+ED1;ATMF)+@/[p02>;@<(JZ@
:K:@b+@0gcBlnK.AKYT*AT9AEFCB94+?_kN4Ztr5DB^V=+<VdL+<VkK@<Wi-Ec#N.+Dk[uDE8mo
/hf"81,LgI3B&rU3AEKL2E+lY+tO'D+<VdL+<k?1F*)G:@Wcd,Df-\+@WQI(F`_1;@;L%"FEM,*
+Co1uAoh3p+tO'D+<VdL+<iK^0J5(&0J5+cDB^V=+<VdL+<Vje+<WEr+<WBu>](`:$6UH6+<VdN
F*(i4F!+n#F)Pl;FCcS'CijB5F_#&+A8,XfF'NT,/.*LB+<VdL,'.10E,9).F(or33ZoOf+<VdL
+<VdL+<VdL+<VdL+<Vd`3F$GG/.*LB+<VdL,&M%3Bl/!03ZoOf+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL0O/K>/.*LB+<VdL,&Lb5Bl/!03ZoOf+<VdL+<VdL+<VdL+<VdL+<VdL+<W?j10e]@/.*LB
+<VdL+u+.\+E;O4Ecc#3ANCqV+<VdL+<VdL+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL+u4%H+E;O4
Ecc#3ANCqV+<VdL+<VdL+<VdL+<VdL+<W?j0jJT?/.*LB+<VdL+u=7M+E;O4Ecc#3ANCqV+<VdL
+<VdL+<VdL+<VdL+<W?j10e]@/.*LB+<VdL,%bP0F*&OADe*E?+<VdL+<VdL+<VdL+<VdL+<VdL
+<W?j0jJT?/.*LB+<VdL,%bP0F*&O5DKKT0De*E?+<VdL+<VdL+<VdL+<VdL+<VdL0O/K>/.*LB
+<VdL,&Ln"DE8m_+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd\/ho+:1gFoB/.*LB+<VdL,'.j:+Co&,
DE8m_+<VdL+<W?j0K(mJ0JG170JG170JG170jJT?/.*LB+<VdL,'.O2GA^u5F#kEd+<VdL+<VdL
+<VdL+<VdL+<Y#F/i,1A2-b#C/.*LB+<VdL,&;=AFDl57F#kEd+<VdL+<VdL+<VdL+<VdL+<Vd^
/ho4>1gFoB/.*LB+<VdL,#CR(;aj)83ZrHWF(KE(FC/ooG&qb6EcYT/@:iqgBjYpuDeiohDB^V=
+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JtRCC,%J"1c73sDB^V=
+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'67sBi@:FLh
FDk\uGp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D
+<VdL+<jQI/g+bCFC0-.A79a++<XEG/g+bEEc#6,+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL
+<Vk'67sBp@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7A79ag
DB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<Ve%67sBsDdd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D
+<VdL+<jQI/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8
Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+DtV2A79b"BleA=+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!
Ecu/7B-;#)F*&OCAfu26A79a2F!,@/G%kStFD5Z2+EMX5EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(
F<D\K+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=
+<VdL+<VjN+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3De!3tBl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.
+tO'D+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV:"Bldj,ATV:#D/X3$>](`:$6UH6+<VdN:-pQU-us$C
ATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GC[@2JOs%1GgsJ>](`:$6UH6+<VdN:-pQU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQU@UW_k?Z^3s@<it<:-pQUDIIBn
A0=3I@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBmD00-,
De*:%+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\u
Gp"4P:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQU
Ci<`mF*(i2F!)SJ:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""
De*:%+<Ve%67sBu@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D
+<VdL+<jQI/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:Amo^o+?!R\+E(_1ATDs.DJ().BleA=De:,6
De*:%-Z^DJ@<Q?t@<?4%DBO"B@<-EoDB^V=+<VdL+<Vk'67sC$Bldj,ATT%;+<Ve%67sC$Bldi:
+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6+<VdN>](`:$6UH6+<VdN+<VdLAo2Ws
FDk\uGp%!5G$f?0A79a+Ci<flFD5Z2?YF@pAKW[3DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N
6om@OEbTT+F(KH#FCB')ATD.!D/X3$>](`:$6UH6+<VdN0jJT?$6UH6+<Xqs+<VdLI0q)>+C-N*
+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQUEcl7B@;Ka&FD,5.FCfN8+Cei$ATJu.DBO%7AKZ&:Blmo/
>](`:$6UH6+<jQI/g,4XE,]i/F)u&5B-:W!C`m20F<DuQD/XQ=E-67O+E)CEE-68-DB^V=+<VdL
,#1HW+@T^KBHVD.F*&OKBl%T.F(fK9+Ab@&;aj)83Zr-K+AYW_>](`:$6UH6+<iWbEccCG-ZWpB
ATMF)-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV'
@k]cLAnGX!/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)3ZqW6+<VdL+sS<T6?R!YA8,po
+CK5(F(KE(FC8?k+tO'D+<VdN>](`:$6UH6+<jcuATD?)@<,p%@3BH1D.7's+E(j7FCfN8+EM%5
BlJ08+DG^9?tOP'F'p,4BOQ!*@WcC$A0>;uA0>DsF*)G:@Wcd(+CK5(F(KE(FC6_+DB^V=+<VdL
,#i5eF(HJ8@rc:&FE8R5Eb-A8F`(c$+EVNED0[78DK]`7Df0E'DKI"1F`\aJBOuH3A8`T)Ci"68
FE1f3AKYZ)G9D!G>](`:$6UH6+<i:P@;BF(+CQC'BleB:Bju4,Bl@l3F(96)E-*]V$6UH6>m_\s
I4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>Gf+$6UH6
,&(R33ZoVY1H7BM11Xl=/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<
+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=
G]Y,j+Bo0q+<VdL+<jQI/h1=QBl%<eEbTT+F(KG9F=f'e@WcC$A0<:@Bldj,ATT@D@;]TuA8-+,
EbT!*FCd(0DB^V=+<VdL+<Vk'67uM\+tO'D+<VdL+<jQI/g+YEART[lA3(hg0JYG$@<+%^>](`:
$6UH6+<VdN:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<jQI/g)o*D..]E0Hae7A0>c.FCep"DegJ;D]iS)F*)G:
@Wcd(A0>JuCh7ZmDB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk<De!TlF)rIGD/a<0@p_Mf6"4tNCh,Od
3F=p1+=BH@6"4tNCh,Od3@>qR+Cf>$Eaa$#+?V#;5s\t&Bl%<?3B8HlDB^V=+<VdL+<Vk<DeX*1
ATDl8-Y[=6A1(W"+tO'D+<VdL+<k'.+tO'D+<VdL+<kl:Ec+$$+=D2DF(KE(F=1=2+tO'D+<VdL
+<k'.+tO'D+<VdL+<j!'HV[I,:..Z@4ZX]rBk/>?+<Xp,+tO'D+<VdL+<k'.+tO'D+<VdL+<jQI
/g+k?+=Lr@AU#XHBlbD/Bl\9:+Co1rFD5Z2@<-W9Df-\:@<?0*Bl7EsF_#&+BlmTt+tO'D+<VdL
+<kK1@:Wn_@m)jq-mr_GAU#RS3^,9F:JaJT6qK`p,:@2BAU#=F>](`:$6UH6+<VdN>](`:$6UH6
+<VdN4tq>%A0<rp+D>=pA7TCa/15%PFE8RIFD5Q4-QlV91E^UH+=AOADB^V=+<VdL+<Vk5DB^V=
+<VdL+<Vjl0RInYE,9H&+D58-+?MV3B4Z1,G]Y'@ATV0p+tO'D+<VdL+<i<f.kN>)/M/P+/M/J)
/M/P)/M/P+/Lt(D+tO'D+<VdL+<l1fHt-u2F(Jl)/O"PoF`_\PF`_>6F*q51+tO'D+<VdL+<i<f
.kN>)/M/P+/M/J)/M/P)/M/P+/Lt(D+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[FEarZ)3ZqW6
+<VdL,#1HW+EM47G9Ca2Bl5&6Bldj,ATT&3@;BFp>](`:$6UH6+<kcCEcbf)@<-E30O/K>/.*LB
+<Vk'67sBsART+`DJ()%BOPpi@ru:&F'NT,/.*LB+<VkLD/XQ=E-67F2)$^,HS-Eq+Co2-E$-N;
F_PZ&?ZKk%ATMF)-X:O5/.*LB+<Vja+E(d5-RU)F+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==
3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj2)7%!0junI+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klF
F`Lu',!$iN$6UH6+<i$T+@0g[+CoD.AKWQIFD,*#CNCV1DfQt>CghU'DJ(.#+<Ve4$6UI>$6WV*
$6UO0ATV?k@<>p%3ZrbV+<VkDATD["CiaQ,@j3rVHO:l<+<k?1F)Yr(H!bGtD.OnP+<jE%/.*LB
+<kW1DJ+*#B4W8J+<jE%/.*LB+<k]3D.OnP+<kQ9ATD["Ca'3/+FPdJ+<VkE@;]_#@:s.YBl7O$
,!$in$6UH6,%bP*ARB"nFCf?2Bl@l53ZoV!Bkh]5/.*LB+<kZ:D.Rg7E+L4S+<ko=G]YT2+tO'D
+<VkG@;TR"3ZoV=+poG8I0q*F/.*LDDIR3rEc#6,,!$i'/.*LDDIR3rEc#6,?YsLpDfR$_+>jLS
$?^0-Eck`!F`MM6DKK6,CO'u4F>>aQCO&ieAmo^o;e:&mBl7R)<b6;mBl@lP1G1?g9Q+f]BlnK.
AN_b#1GLR<3&r]O2E!HO2E!L*.ki^c9OW$WFEM,*4Y8EA2)@'F0JG170JG170JG1l.ki[b6#:XW
FEM,*4Z+iO1GCL:0JG170JG170JI&g0JWu-F_kc#DF@oTAN_e$1c@$A1GCO;1bgmH2E!L*.kijg
<,$2\>&S:i4ZP,P0JG170JG170JG170JI&g0JEi$@;KLmA79LA1($<iFDjQG<';rC6tL1V@8oBK
/ho@B3&NTS1cI0M2Dd-JALfGh$:/fVDa\/QFCA-30a^<_F)Yr(GscLgEb&*oF*(u14Yd@4Ble60
@<k4ODKKH19Q+f30ePCD1G^^C2E*NK2D[$D0kDjh1($E`F)Yr(Gsc.\FCfJd@<=Xg/i>=;3A`HH
1,1I>3&`cNALfGh$:JTLE,8s.:i^JhARfgrDf.]o$:JTLE,8s.7Sd&J2_HjA0Jt[I2E3EG3&!9I
1hA0k0a^<_F)Yr(Gt)UaE,]B!<b6;n4YR42Ble60@<k=YBlJ$&A4UWZBmMor$:ArVEb0-1:i^,W
ATMp,Df.]m$;bbS@qB_&Bl@lXE,T6"4YeWH2)-sF2)$^<0JG170JI&g0K'85F`_&6Bl@lP0a^3U
ATDg"FD5Z24YR4>Ec5o.EZe(pFD5Z24YR4:BkM+$+B3&lAN_aT;IsH\@:OCnDf.]m$:J<EAO^NY
;fm%C-".oB@NZt-/0H6A+@8F&<,$2\7W!6GFE0Mj8NJ.l3[I]I-#a2h5t#9o7W!611C?EaF?t4B
D0.os$;=lM9Q+f<D0.oq0a^?ZCh[j1Bk'hFFA-Uj7W!611C?W\CgggqBk'hFFA-Uj7W!611C@&l
Ch7*uARnSGC1Ums4[N^mBl6^UC1Ums$;Y,GARfgR6p3:V0f:mM3%Qck6Z6gYDf/<YD.Pk0F`M&-
Esb9CFCB!(B23Sd@V'RC,]Y#(F`7[T@<>poDeDgfD.7's4Y\f::j$^a6Xb(FCi<r]F_tT!E]lrk
+>Y`32$u]ZFCB!(B23Sd@V'RC844RY2`3?H$:A6D@;Kjp:3CD_ATBq45u/UX2`3?F2[Vo\FCB!(
B23Sd@V'RC6Z5@8/M]+)2E3HO$:A6D@;Kjp:3CD_ATBq$:dcEX1,C%/1H%3"6Xb(FCi<r]F_tT!
E]lrb:`qPS2`3N$<-`Fo4]>("<XM95A5?ZLARfgF;e9cV@ru9m:L\'M@rr&VASbpfFCeuY@VTIa
FA-U_CLq$>0FC?hD.QLPC1Ums4[ie"FD)"PDf'&^Cgh3mFA-U_CLq$>0FC?hD.QO[@;]Xu6tp^a
@;]Rd4Z"cH2D[3G1G^pE1,_*P3&G1u0Js2.Df'&^Cgh3mFA-+bBlnK.AN_V#/hf(91-%3O3A<<L
1,CaIAM#Sk$:o)PAPd2ODImo`Df03%FEM,*4Z4oI0f_3N3AEEL1Gh!I2)]"r0JEi'Des6.G=ZXh
APd2ODImoQ0a^imDg+`jEbTi<DET]]88iN_H>d\"FEq\64Yd@CBQ&)cDfTQ<Df/']Dg+>u$<(VV
G=ZXmBmO]86Xb"GBl7?q:iC&cFE9T"$:o)UBmO]86#:XWFEM,*4Z"cM1GLXE1,:XB0f^sJ3Ak@u
0JEi)DfTQ<Df/NcG]\(KAN`b!FCfB2+@C0XFCfJFE,K:q;eU)n6t(@WBkM+$4YR42@<l['B4uBc
CO&fJ69R"T1,(C90JG%3/iPI<0JG130J5==0JG17$<(VVG>N*aDImp24Y[:BBQ&)kCgh3mF@U@c
A90mf$<(VVG>N*aDImoUG\(qZ0FC`lDg,#o@;]Xu:18!NF$25b;eU)n:i'QXATUa^@<6"$4Y[:B
BQ&)kCgh3mFAm=&Amo1\F$25b;eU)n:i'QXATUjnEb8`iAO^6>FEMV8F$22a;eU)n:i'QXATU4[
D/XK7BOu3qF$25b;eU)n9keK`E_UIjDK@rp$<(VVG=>q\FD+BeDf/Ke@:X;#6YURNCh7ZN0FC`l
Dg+KgFCfK2Bk29J0FC`lDg+QeD.Rg14YR4ABQ&)n@<?'sCh\!&F$22a;eU)n9keK`E_pR\DImob
@;TRs4YR4ABQ&)kCgh3mFAHpdBlnDZ0FC`lDg+ooDf/?k@VKq*4YR4ABQ&)nASbpfFCeuY@VTIa
FAQCfBK\$V;eU)n;e9cV@ru9m:L\'M@rtLe@VKpI0FC`lDg+ut@VKp\ATDK[De*ER@<--pEcXAt
$;bPIDImoa@:r8JD/")bAU-En/i57<2DI*I1,CjG1,_'LALfGh$;bPIDImoa@:sIlAnba`FD5Z2
4Y\QC0JG170JG170JG170JI&g0JEi.Df9Mf@:sIlAnba`FD5Z24Y\QC0JG170JG170JG170JI&g
0JEi.@<-EfFEq\64YR4>Cgh3mFA?7]APu#b4Y\QC0JG170J"q20JG170JG%4/het50JG0f;eU)n
;flGgF$25b;eU)n;flGg:18!NF$25b;eU)n;flGg:i^JnATCOSD.RcO0a^imDg,-%@<+\CH"D"i
ATW$*EcXAt$<)%TE^Ob]DfSEeFCf?2BlnV`0f^ur;flGg;e'6PAN_b#0JG170JG170JG170JG1l
.kiXa;flGg:18!N6tL7WBlnV`3A*9G1cR?L2_d$B3A`HL1hA6m1($s%@<,(NB2!#VBllKp/hf7A
1Gq-M3AN<I3AEKRALfGg$<)%TE_TtT9PJ?XFA61gBl/!04ZP,T2D?mC1bgpK2`EHO2`#"q0JEi4
BQ&)_DfoN*AQ*\ZEcXAt$<)%TE_^%[APu#b4Y\QC0JG170J"q20JG170JG%4/het50JG0f;eU)n
6tKqK;epYS@VTIaFE9T"$<(VVG=6"RE)UOt8SqmKATL!g$<(VVG>2XiF(o3+:Msuo4YR4ABQ&)_
AS#gZCO&3f=(u2V7Sd&J0FC3ZAT1R`Gth^[9PJ?XF?MT92*!?E3&N]U1GUmI1H%1'.kiXa6tKqK
;epYQ@:r8JD/")d@<cL'F_s9UDIs5SBQ&)_AS#gZCO&Z`D.RcO0a^imDg+T\AT1R`Gu/O"E+O&b
@;TRs4Y[:3AS#gZCO&Z`D.Q+HDKBN6Gs+&<2E3WS1b^UC2`39L0f:h"/MJmd6tKqK;epYMDKKH-
F(o`A4Z+iG0JG170JG170JG170JI&i0JNo5BQ&)jE+NoSCisf@ATDiT0a^imDg+]fDdmj*@<+_O
F`VY9EcXAu$<(VVG=$=aB4uB^AR]du@:_SV$<(VVG=5k[CJJGMF_kJt4YR4ABQ&)kCgh3mFCB38
:1[mWCggm<0a^imDg+][CghR&ATL!h$:JH:E)UOt:18!N;Fa&:0eP.60JG17/28b20JG170J"q2
0JG170JEi4BQ&)hBl%R1=(-A;0a^WhChn;t@<kdnH#.%T1C?ijChn;t@<kF^FCf?2BlnV`1bLI@
0K1jF1c7-F2DQsC3+XZq0a^WhChn;t@<k=NA7]gF0a^WhChn;t@<k[XEcc#*Ch6+FCghR64Y[:B
BQ&)^Df0W<ASc0kFD5Z2F$25b;eU)n6Z6j`FCf9)@<?4%DKAct@:X(oBl@ltCcsHZ;eU)n6Z6j`
FCf9)@<?4%DKANjA7]e!4Y[:BBQ&)^Df0W<ASc0kFD5Z2F%pq%BPCsbCcsHZ;eU)n6Z6j`FCf9)
@<?4%DKA-_F`(_uEd9f%$<(VVG=-:dF*(u0CghF"Df/<YD.RcO0a^imDg+QeDKBo2Ci!O%Bl@lT
@Ua@hG%kB,Bl@m14YR4AASbpfF@0taF*(u0CghF"Df0VZ0a^9dDKBo2Ci!O%Bl@l\DKKH-F(o`A
4Z+iG0JG170JG170JG170JI&i0JNo<De*Qj@mb0PF*(u0CghF"Df0VlDJXS]0FC`lDg+KgFCfK,
F)>t]0FC`lDg+KgFCfK,F)=Z\D.RcO0FC0cDKBo2Ci!O%Bl@l_Bl7K[7m]?m/i>=:0JG130J54:
0JG17/2/\60JG170FC0cDKBo2Ci!O%Bl@la@;TRR7m]?m/i>=:0JG130J54:0JG17/2/\60JG17
0FC0cDKBo2Ci!O%Bl@l\D..'g;Fa&:0J54:0JG17/2/\60JG170J"n12)$^<0JEi$Df0W<ASc0k
FD5Z26>q!aA79M(;Fa&:0J5%50JG17/2/\60JG170J"q20JG170JEi"F*(u6Ble,bBl7K[7m]?n
/het50JG130J54:0JG17/2/\10JG170FC*eFCfK,F)=Z\D.QU869R%U0JG170JG%3/i>=:0JG13
0J5%50JG17$<(VVG=Q[fA3DUR7ri<S6Z6m`A5dbpFCf;P0a^imDg+Q[Ch7[0BjkgHEHP]3DfRup
$<(VVG=,qXATMs-@;JAPF^]B1E`?a_CNDWm$<(VVG=Q(X@:OCn@mtB[@<?F.4YR4ABQ&)`@r,ju
FD55J0a^imDg+W[Ch[j1Bk(+V@r$-K0FC`lDg+oeEbT&u@;\4^$<(VVG>2XhBk1pdDH(=[CNDWm
$<(VVG=,qXATMs-@;JbYCh7ZN0FC`lDg+][CgggqBk'tXCh7ZN0FC`lDg+W[Ch[j1Bk'tXCh7ZN
0FC`lDg+WiF_P`3GYMUeCLqO-4YR4ABQ&)nDesK:Bk(^K@<--pEcXAt$<(VVG?SQqBln#O0a^?h
F^]B1EbSru7ri<S;Fa&:0eP.60JG17/28b20JG170J"q20JG170JEi&@r,juFD55TEbT&^7m]?n
/het50JG130eP.60JG17/2/\10JG170FC<YCgggqBk'YRBk1+369R"T0JG170JG%4/het50JG13
0eP.60JG17$:o)UBmO]87ri<S;Fa&:0J5%50JG17/28b20JG170J"n10JG170JEi4BQ&)c;FG5-
B6%Et4YR46;FG5-B6%Et<HD_m6"4nRCisi2;Is?[4YR46;FG5-B6%Et;Is?[9P%gX4YSKB0JG17
0JG170JG170JI&g0JEi);FG5-B6%Et;Is?[<,Z_=0J5%50JG170JG170JG170P)ag0FC?K6tp(B
Ea`f_ARfg`Bk2=!4YSKB0JG170JG170JG170JI&g0JEi);FG5-B6%Et;Is?[87cLJBQQBk/het5
0JG170JG170JG17ALfGg$:n&_BjkXp@;Sh]DfB9.FEptO1($QM6tp(BEa`f]Ec5o.EccS04YR46
;FG5-B6%Et7ri<SCh[cuF$25b85_ii@:sUhD,OqXBl@l_@:EeaF$25b85_ii@:sUhD+o(hBl7j1
BlnVfCghC+4ZEdI@<Q3m;e:&mBl7R):18!N4UP+rG%G2_ATW$.DJ+#YATM@%BlJ0.Df.]F9jqpJ
B4XbF@V'@eA5$]YF?M;b9Q+ELFD5Z2:18!N4]Q<@iOPS'/PBMo@3ANaFlBm7@3A<RFD5Z2@;I&_
@<--7+AI!#Bln*4Ciq9O:/hR!Dfor.7:p.C@rucT0FC*_@VKCkFAm+#DIbm;;eU)n86&&DCj0<5
F$25b;eU)n6#LCR@<?4%DET]]6Z6dZE`7(*Ch5aa$:\rOFAl[XCh61UA7^!K1($oj@;JnWD.Pja
$<1_VAO^KSG?/F!Bjtmi4YR4BBl.ENCi=MhDId='4Yd@DBl.ENCi=MlF_l/6E,96"E]l-00JG17
0JG170JG170JG1l.kiXa<,$2\7Vm!e;e]l^;flGgFEMOc0FCcnD.Q1QDg+lnDfA!a4YSKB0JG17
0JG170JG170JI&g0JEi5Bl.ENCi=MkDf9SoD`od,0JG170JG170JG170JG1l.kiXa;e'`bAQ3qo
AN_b%0FC`gDfB8^Dfor><-`Fo4Z*RF@rH<t;Is9IDfp/"@<?'D1^[/kDfB8^Dff]3DGjnbAN_jW
;e'`bAO^TJF`V,7;IOZY4YmFD@rH<t7W2dZF(KAgDf]W7Bl@lP/MRT2@rH<t7W2dZF(KAgDf]W7
Bl@l`Bl6'f$<(GQE+MLW@s)j(E_p[qBln'-DG=Pa4Z4uJ0JEi4@rH<t;It#_EcXuS4YR4A@rH<t
;It#_EcYe\=$85E;e'`bAPtf_DI[TqATCaa@r"nPE`-Il4YR4A@rH<t6tKjsDI[TqATCaa@r"nP
E`-Il4YR4A@rH<t;0?GjGsuU\De*F"<,#iXF$22a;e'`bAOCBQD+RPiA7T^lF)sK!0J5%30J5'e
;e'`bAOCBQD,>.kFA?sq4Z"iK0FC`gDfB8dASu$XBl.EIDIcFZ@psInDf.]l$<(GQE+MsVG%F?c
B0@pU;e'`bAQ*/\BjkgSDfTqp@;TR=$<(GQE+M=F@qBV$;Is]`FCdgXDJj#qFD5Z24YR4A@rH<t
;Is]`FCdgXDJj#qFD5Z28Ph]`A9)7&F$0k/@rH<t;Is]`FCdgXDJj#qFD5Z2:iCAr4Z"iK0FC`g
DfB8a@<--pA3DUR;e'`bAPcfUCI*8\D09r64YSKB0JG170JG170JG170JI&g0JEi4@rH<t:gnB[
6#:XWFEM,*4YSKB0JG170JG170JG170JI&g0JEi4@rH<t6$79f6tLIO@rtXbGt)L20FC`gDfB8d
CO&B`:18!N4]?-A7VN3.@rH<t;epYU6qB[A6YpIJDKJ#q$<(GQE+Ms`Gu7(?FCfZ)Gs*l9/hen4
/hm]3@rH<t;epYU8Ph]`A9)7&F$2611+k@81^[/kDfB8dCO&cPATVctF)*oo2)R!A2)R!A2)R!?
$<(GQE+Ms`Gu7CHF)u;6Eaa$#4UP+tDfB8dCO&cU;b9A?$<(GQE+Ms`Gu7R_AO0g9ATMohDeX*2
4YR4A@rH<t;epYU;e9H]EbTW@4\fp5AI;@GDfB8T79";9@r#drB2W/[AN`t+A7]dm@;H9L@rH<t
6Uasp@:O(N5u2B7Gs*kh;e'`bAOAmbCh7faBl.R+9keK.0e`r5@rH<t6UapiATpg^D/")d@<apq
0FC`gDfB8T79!i7ATM@"E+Ma^A7]R?/MRT2@rH<t6Ua:WBkM=#ASuThH#R=X0FC`gDfB8T79=&2
B4XAFBkM=#ASuTQ0FC`gDfB8T772!6A63e[E(+YQ@VfUd4Y[:B@rH<t6UaO[@V'Rt@<?'LDII!j
ARmqX$<(GQE+MC*88i?V:iCDhFD5Z2;F*H#/i>RA2`WcP2_[*C2DR6NALfGg$<(GQE+MC*88i?V
:iCDhFD5Z26tKjk0eP=B0K2!M1H.!F0K([G2e=Kn0FC`gDfB8UEaa/kAScBqA3DUR;e'`bAOLQI
G=-ChF)u#'Bl\8X0FC`gDfB8UEaa/Z@<,mmDII?LBl[cpFD5Z2F$22a;e'`bAP?NAASah3<c^DY
$<(GQE+MFX@<YddASsnMF(9-+DIm="ARmqY$<(GQE+MLQASbmTDffE0Bl@lP0J5%50JG170JG17
0JG170P)ag0FC`gDfB8TDf9Z,;gEG+ASjRb$<'l%@<Q3\G@>H0ARmqY$<'l%@<Q3MBle60@<k4Y
DfTAeH#n(=D*9W];c?V'G%F'UF)Yr(Gt(S14ZP,K0JG170JG170JG170JI&g0JNo5;c@+JAOL6R
E,8s.6Y1.WATCIQF?M32/i>XK3&*6F0JP@@1c[NLALfGh$<'l%@<Q3MBle60@<k4ODKKH19Q+f3
1+kRD1b^mG1Gq-I0f:aC11_si0a^iX;dji\;eU)n:i'QXATU^g@VKq*4Y[:B;c@+JAQ*8\G>i'h
ARfgnA5?ZLARfgY@<?0G0FC`W;dji\;eU)n9lFrf:NBoYFE9T"$<'l%@<Q3YCgh3mFA61V9PJ?X
FA$1j4YeWD0JG170JG170JG170JI&g0JNo5;c@+JAQ*8\G=-:dF*(u0CghF"Df0VZ0FC`W;dji\
;eU)n6Z6j`FCf9)@<?4%DGFVWATL!g$<'l%@<Q3\BQ&)_AS#gZCO&]bC1UmsF$22a;c?V'G%FTc
Dg+T\AT1R`GtDj]B4Z-I0FC`W;dji\;eU)n;flGg:18!NF$22a;c?V'G%FTcDg,ArDJ=3+4YR4A
;c@+JAQ*8\G>2XhBk1pdDETZ\<,ZYgB4uC.6=k4[;f?\u4]6!,BQP@_F(8d!F(oQ1$;bPIDImp2
;f?\u4[WY"@;Kjp+AR&r@V'Qe9lFrfF&R!tF?N!"FCB!(B-9rlD.7's$:/`TATD^'A91[fEcaH>
F_tT!EZfI;ASrVc@;TQ_6Z6gQFE:B!EcaH>F_tT!EZfI;ASrVc@;TQ_;djcZCi!g-ATLdgEcaH@
Ec5o.EZe+cD.O&L@;TRd;flGgF&R!tF?NH@DfB9.+AQ?^AI:bEBkM+$ATMrlFCB32;f?\u4]Z9<
F^])/9jq[PBlnK.AI;1D@<,q#FAm9iEcY/tEcaH4BleB)DI[5b6uR3WCh6Oe@<-EfDfTq_6tKt=
F_l.B:NBuWEXGiUEbSrkCh6Oe@<-EfDfTq_6tKt=F_l.B:NBuWEXG3GAT1R`GuJX%F?NH@DfB9.
+AQ?^AI;.CF)u&,E`6msF?NZ=F*1o-+AH9WDJ=38A7Z*8@;KIuASc0]DfTq_6Xb(FCi<r/:3CD_
ATA,FDf0W<ASc0kFD5Z2F&R!tF?NH@DfB9.+AQ?^AI:_EFCfK,F)>tsDfTq_:3CD_ATAo8BOu'(
:18!N$;G)RAT)TfBQ&*+EcY/tEcaH@Ec5o.EZe+cD.O'"ASc1$GB7kEDIm0bF`MM6DKK6,CO'u4
F>>aQCO&ieAmo^o;e:&mBl7R)<b6;mBl@lP1G1?g9Q+f]BlnK.AN_V"/ho%>1,psA0JG170JG17
ALfGi$;=lMBlnK.AN_k&1c.*E1GC[D2)R6K2)R:'.ki[b6#:XWFEM,*4YeWH1H$p@0JG170JG17
0JI&g0Ja&.F_kc#DF@oTAN_e$1c@$A1GCaF0JG170JG1l.kijg<,$2\>&S:i4Y8QE0JG170JG17
0JG170JG1l.kiXa6XaeBDId0r4Yd@1F`_Oi;cGn6$:JHAFCA-32_HgF1H@?L0Jb^C0f1[F2.\9l
0a^3hFDjQYCij)b4Y[:3Ble60@<k4YDfTAeH#n(=D*9W]6tp^]CghTVASuU$E_LCh4Y\QF3&EBF
2`*<J1H@0D3&+tp0JWu'Ble60@<k4ODKKH19OW$+1+kC?3&<?N3B/`J2)[<L2.\9l0a^<_F)Yr(
Gu/O"C1UmsBl@lP1C?NaF)Yr(Gt(S14ZG&S1,L^@2`*NO1GCdF0f3Gl0JNo&Ble60@<k=YBlJ$&
A6*8^F?M;b6tp^]CghTYCh[j-ARn>MEbTh_0FC0iEcP`/FAR!h@qB_&Bl@lP0a^`tARf:mF(oQ1
7<!0TBK\+'1c7!F1c6s@0JG170JG1l.kijg:3CYeFD5Z24Y[:0@V'S#@<?4%DETZ\:i^JnATAnf
Dff]3DETZ\9PJ-QF<FOsD.Pjb$;tGIEa`I"Bl@lP0a^<WFCdpYFAm:%4XFMZ-"7uCA1SiL=Wg$u
$<1_VAO^NY;fm%C,tU-D9faS!+=1t6;F*]^@n(<W4YmF2Cihsh7W!611C?faFA-Uj7W!610ej#(
@r,juFD55Y@<>1]DFSJb4YmF8@;K@^FD55Y@<>1]DFSJb4YmFDASbpfFCeuY@VTIaF?Ms%B5)6Z
@VTIaF:(fQC1Ums8OP]s/29%60FC0cD/F3/:18!N4]?<6@po^3@<>poDeDgfD.7's4X=GY<bZR]
6Xb(FCi<r]F_tT!E]l<>+BE2s$:A6D@;Kjp:3CD_ATBq);BRhN2)Ye/@<>poDeDgfD.7's4\.s`
0ekRE2)kq1@<>poDeDgfD.7's4]=XB+>G`43ANAt6Xb(FCi<r]F_tT!E]l`W+>#<%+>Yo71($BW
FCB!(B23Sd@V'RC84cW#2Dm<M1^ZTYFCB!(B23Sd@V'RC6<-i)0f:Wl<-`Fo4]>("<XM95A5?ZL
ARfgF;e9cV@ru9m:L\'M@rr&VASbpfFCeuY@VTIaFA-U_CLq$>0a^HiD.QLPC1Ums4[ie"FD)"P
Df'&^Cgh3mFA-U_CLq$>0FC?hD.QO[@;]Xu6tp^a@;]Rd4Z"cH2D[3G1G^pE1,_*P3&G1u0Js2.
Df'&^Cgh3mFA-+bBlnK.AN_V#/hf(91-%3O3A<<L1,CaIAM#Sk$:o)PAPd2ODImo`Df03%FEM,*
4Z4oI0f_3N3AEEL1Gh!I2)]"r0JEi'Des6.G=ZXhAPd2ODImoQ0a^imDg+`jEbTi<DET]]88iN_
H>d\"FEq\64Yd@CBQ&)cDfTQ<Df/']Dg+>u$<(VVG=ZXmBmO]86Xb"GBl7?q:iC&cFE9T"$:o)U
BmO]86#:XWFEM,*4Y\QC0fLgA1,q$J1GCO;1,WVn0JNo*DfTQ<Df/NcG]\(KAN`b!FCfB2+@C0X
FCfJFE,K:q;eU)n6t(@WBkM+$4YR42@<l['B4uBcCO&fJ69R"T1,(C90JG%3/iPI<0JG130J5==
0JG17$<(VVG>N*aDImp24Y[:BBQ&)kCgh3mF@U@cA90mf$<(VVG>N*aDImoUG\(qZ0FC`lDg,#o
@;]Xu:18!NF$25b;eU)n:i'QXATUa^@<6"$4Y[:BBQ&)kCgh3mFAm=&Amo1\F$25b;eU)n:i'QX
ATUjnEb8`iAO^6>FEMV8F$22a;eU)n:i'QXATU4[D/XK7BOu3qF$25b;eU)n9keK`E_UIjDK@rp
$<(VVG=>q\FD+BeDf/Ke@:X;#6YURNCh7ZN0FC`lDg+KgFCfK2Bk29J0FC`lDg+QeD.Rg14YR4A
BQ&)n@<?'sCh\!&F$22a;eU)n9keK`E_pR\DImob@;TRs4YR4ABQ&)kCgh3mFAHpdBlnDZ0FC`l
Dg+ooDf/?k@VKq*4YR4ABQ&)nASbpfFCeuY@VTIaFAQCfBK\$V;eU)n;e9cV@ru9m:L\'M@rtLe
@VKpI0FC`lDg+ut@VKp\ATDK[De*ER@<--pEcXAt$;bPIDImoa@:r8JD/")bAU-En/i57<2DI*I
1,CjG1,_'LALfGh$;bPIDImoa@:sIlAnba`FD5Z24Y\QC0JG170JG170JG170JI&g0JEi.Df9Mf
@:sIlAnba`FD5Z24Y\QC0JG170JG170JG170JI&g0JEi.@<-EfFEq\64YR4>Cgh3mFA?7]APu#b
4Y\QC0JG170J"q20JG170JG%4/het50JG0f;eU)n;flGgF$25b;eU)n;flGg:18!NF$25b;eU)n
;flGg:i^JnATCOSD.RcO0a^imDg,-%@<+\CH"D"iATW$*EcXAt$<)%TE^Ob]DfSEeFCf?2BlnV`
0f^ur;flGg;e'6PAN_b#0JG170JG170JG170JG1l.kiXa;flGg:18!N6tL7WBlnV`3A*9G1cR?L
2_d$B3A`HL1hA6m1($s%@<,(NB2!#VBllKo/iPO@1c%$J2E!BO3&WTPALfGg$<)%TE_TtT9PJ?X
FA61gBl/!04ZP,T2D?mC1bgpK2`EHO2`#"q0JEi4BQ&)_DfoN*AQ*\ZEcXAt$<)%TE_^%[APu#b
4Y\QC0JG170J"q20JG170JG%4/het50JG0f;eU)n6tKqK;epYS@VTIaFE9T"$<(VVG=6"RE)UOt
8SqmKATL!g$<(VVG>2XiF(o3+:Msuo4YR4ABQ&)_AS#gZCO&3f=(u2V7Sd&J0FC3ZAT1R`Gth^[
9PJ?XF?MT91,:gD2D[9H3AEHO1,Ln#.kiXa6tKqK;epYQ@:r8JD/")d@<cL'F_s9UDIs5SBQ&)_
AS#gZCO&Z`D.RcO0a^imDg+T\AT1R`Gu/O"E+O&b@;TRs4Y[:3AS#gZCO&Z`D.Q+HDKBN6Gs+&<
2E3WS1b^UC2`39L0f:h"/MJmd6tKqK;epYMDKKH-F(o`A4Z+iG0JG170JG170JG170JI&i0JNo5
BQ&)jE+NoSCisf@ATDiT0a^imDg+]fDdmj*@<+_OF`VY9EcXAu$<(VVG=$=aB4uB^AR]du@:_SV
$<(VVG=5k[CJJGMF_kJt4YR4ABQ&)kCgh3mFCB38:1[mWCggm<0a^imDg+][CghR&ATL!h$:JH:
E)UOt:18!N;Fa&:0eP.60JG17/28b20JG170J"q20JG170JEi4BQ&)hBl%R1=(-A;0a^WhChn;t
@<kdnH#.%T1C?ijChn;t@<kF^FCf?2BlnV`1bLI@0K1jF1c7-F2DQsC3+XZq0a^WhChn;t@<k=N
A7]gF0a^WhChn;t@<k[XEcc#*Ch6+FCghR64Y[:BBQ&)^Df0W<ASc0kFD5Z2F$25b;eU)n6Z6j`
FCf9)@<?4%DKAct@:X(oBl@ltCcsHZ;eU)n6Z6j`FCf9)@<?4%DKANjA7]e!4Y[:BBQ&)^Df0W<
ASc0kFD5Z2F%pq%BPCsbCcsHZ;eU)n6Z6j`FCf9)@<?4%DKA-_F`(_uEd9f%$<(VVG=-:dF*(u0
CghF"Df/<YD.RcO0a^imDg+QeDKBo2Ci!O%Bl@lT@Ua@hG%kB,Bl@m14YR4AASbpfF@0taF*(u0
CghF"Df0VZ0a^9dDKBo2Ci!O%Bl@l\DKKH-F(o`A4Z+iG0JG170JG170JG170JI&i0JNo<De*Qj
@mb0PF*(u0CghF"Df0VlDJXS]0FC`lDg+KgFCfK,F)>t]0FC`lDg+KgFCfK,F)=Z\D.RcO0FC0c
DKBo2Ci!O%Bl@l_Bl7K[7m]?m/i>=:0JG130J54:0JG17/2/\60JG170FC0cDKBo2Ci!O%Bl@la
@;TRR7m]?m/i>=:0JG130J54:0JG17/2/\60JG170FC0cDKBo2Ci!O%Bl@l\D..'g;Fa&:0J54:
0JG17/2/\60JG170J"n12)$^<0JEi$Df0W<ASc0kFD5Z26>q!aA79M(;Fa&:0J5%50JG17/2/\6
0JG170J"q20JG170JEi"F*(u6Ble,bBl7K[7m]?n/het50JG130J54:0JG17/2/\10JG170FC*e
FCfK,F)=Z\D.QU869R%U0JG170JG%3/i>=:0JG130J5%50JG17$<(VVG=Q[fA3DUR7ri<S6Z6m`
A5dbpFCf;P0a^imDg+Q[Ch7[0BjkgHEHP]3DfRup$<(VVG=,qXATMs-@;JAPF^]B1E`?a_CNDWm
$<(VVG=Q(X@:OCn@mtB[@<?F.4YR4ABQ&)`@r,juFD55J0a^imDg+W[Ch[j1Bk(+V@r$-K0FC`l
Dg+oeEbT&u@;\4^$<(VVG>2XhBk1pdDH(=[CNDWm$<(VVG=,qXATMs-@;JbYCh7ZN0FC`lDg+][
CgggqBk'tXCh7ZN0FC`lDg+W[Ch[j1Bk'tXCh7ZN0FC`lDg+WiF_P`3GYMUeCLqO-4YR4ABQ&)n
DesK:Bk(^K@<--pEcXAt$<(VVG?SQqBln#O0a^?hF^]B1EbSru7ri<S;Fa&:0eP.60JG17/28b2
0JG170J"q20JG170JEi&@r,juFD55TEbT&^7m]?n/het50JG130eP.60JG17/2/\10JG170FC<Y
CgggqBk'YRBk1+369R"T0JG170JG%4/het50JG130eP.60JG17$:o)UBmO]87ri<S;Fa&:0J5%5
0JG17/28b20JG170J"n10JG170JEi4BQ&)c;FG5-B6%Et4YR46;FG5-B6%Et<HD_m6"4nRCisi2
;Is?[4YR46;FG5-B6%Et;Is?[9P%gX4YSKB0JG170JG170JG170JI&g0JEi);FG5-B6%Et;Is?[
<,Z_=0J5%50JG170JG170JG170P)ag0FC?K6tp(BEa`f_ARfg`Bk2=!4YSKB0JG170JG170JG17
0JI&g0JEi);FG5-B6%Et;Is?[87cLJBQQBk/het50JG170JG170JG17ALfGg$:n&_BjkXp@;Sh]
DfB9.FEptO1($QM6tp(BEa`f]Ec5o.EccS04YR46;FG5-B6%Et7ri<SCh[cuF$25b85_ii@:sUh
D,OqXBl@l_@:EeaF$25b85_ii@:sUhD+o(hBl7j1BlnVfCghC+4ZEdI@<Q3m;e:&mBl7R):18!N
4UP+rG%G2_ATW$.DJ+#YATM@%BlJ0.Df.]F9jqpJB4XbF@V'@eA5$]YF?M;b9Q+ELFD5Z2:18!N
4\om)+@]dRFD,9/Cb-\pCij):+BM\Q;f?erA4:*BARfh'4YR4/D.73jDKJfqF`(_Q$<(VVG=Y_%
6#:aRH#l,'$<(VVG<p+\D..O#Df.]m$:A`JDfScuH#.%T0a^BgDKJfe@;KLHDId='4Yd@BARTCS
Bl.EE0FCcnD.Q1QDg,5rF(o*"AN_^S<,$2\7Vm!e8T&'MGWdeh<,$2\7Vm!e9m(8oBlIm&ATBpg
/het50JG170JG170JG17ALfGg$<1_VAO^KSG>i3gDGtXcEccGC4YR4BBl.ENCi=MkDf9S\F?M<1
0JG170JG170JG170JG1l.kiXa<,$2\7Vm!e9Q+ig<,XoR/het50JG170JG170JG17ALfGg$<(GQ
E+N!oE+M0e0JEi4@rH<t9lG/lFB!O)AN_mX;e'`bAQ!)JA8cU4;IOZY4Z!LE@rH<t9lG,fDf/H]
FCdTl$<(GQE+MLW@s)j(E`-=fAN_gV;e'`bAO^TJF`V,7:iCDhFD5Z24Y8Aq;e'`bAO^TJF`V,7
:iCDhFD5Z29keK.0FC`gDfB8WDe!p2ATCUcF(o`1Df/9XGWdr=0JG0f;e'`bAQ!)_ATDie;`ufA
;e'`bAQ!)_ATDj'79;W+$<(GQE+Mp57;cURA7]d\Bk(pTATC[[G!.Md;e'`bAOL*>7;cURA7]d\
Bk(pTATC[[G!.Md;e'`bAPmS]Ed:)k@rGmhE`?a_CNDWm$<(GQE+MCTD/Dj@6"FMHATMoU0eb46
/hen4$<(GQE+MCTD/E*fEcb'!D*9^01GB/7@rH<t;e9iW<,$2\6#L4,De!3tBl@lP0FC`gDfB8d
@<Q3UDeD3e$<(GQE+MsZEbSru:iCAr:18!N4UP+tDfB8R@q0(hFAc[eDffPXDf0H(@ruF'DETZ\
;e'`bAQ!)VDffPXDf0H(@ruF'DFmYjA7T^lF)sJO;e'`bAQ!)VDffPXDf0H(@ruF'DGY7lF?MH7
1GB/7@rH<t:gnB[ARmqX$<(GQE+MjSEbdseBl/!7BK\%%0JG170JG170JG170JG1l.kiXa;e'`b
APcfUCI)cYBlnK.AN__"0JG170JG170JG170JG1l.kiXa;e'`bAO1H\Da\/YARfg\CO&B`4YR4A
@rH<t;epYJBhi)RAN`t-Gt)KT;e'`bAQ*Ai;+*rB:d]&5ASuTQ0FC`gDfB8dCO&cI@<?()@<k!j
0J5%30eP0f;e'`bAQ*Ai;+XSMA7T^lF)sK!/i#%8/i3o6@rH<t;epYU:1\Na@<63I1,UpA1,UpA
1,UpA0FC`gDfB8dCO&cR@<6L/BQ@O&AN^B!@rH<t;epYU;c?7U4UP+tDfB8dCO&cWF(IXI@qB_&
:iC&cF?M;b;e'`bAQ*Ai;,_%9F`M2<Gs+o@DIj/R@rH<t6Uasp@:O(eDJ)jUFCdU6Bk1dqARTB^
;e'`bAOAmcEa`Hn;F+)rCjA/u$<(GQE+MC*;f$#h9PJ?XFA6Ie4Y\Vt;e'`bAOAmbCh7faBl.R+
9jr903A:e=@rH<t6UascCh7ZtDfB8^De*Eq4Y8Aq;e'`bAOAmPCh[O"D.RU,<-`Fo4YR4A@rH<t
6Ub'fA7oI>Ch[O"D.RU,4YR4A@rH<t6Ua@\Eb&6l@;nYQ@:F%aA3DXS;e'`bAOAmWBjtXoDIIWu
7;cOCCh7-?0FC`gDfB8T77_?6APd;dBln'-DGib`0eP=B0K2!M1H.!F0K([G2e=Kn0FC`gDfB8T
77_?6APd;dBln'-DFA&G4Y\QH2_[0N2D[9G2)$pD3&bD!0JEi4@rH<t6ul^[<+Tld@:VMT$<(GQ
E+MFX@<Y(ZDf]u5@;0b'4YR4A@rH<t6ul^[6Xb"GBl7?q6tp[Q@ruF'DK@rp$<(GQE+M^O@V'@F
:KDO"0a^ihDfB8UEaa/nBOu'LBldd&DJj#qFCeuG0a^ihDfB8WBk;*k;K$YcFD5Z24YSKB0JG17
0JG170JG170JI&g0JEi4@rH<t6Z6m`A5dbpFCf;P0a^iX;dji\;g2YhE+NQC0a^iX;dji\6tp^]
CghTVDf9Z,;gEG+ASjRc$<'l%@<Q3MBle60@<k=<<]rGq0JG170JG170JG170JG1l.ki[b;c?V'
G%F'UF)Yr(Gsc.\FCfJd@<=Xa1+kFE3&iWL1,(F=2)I<Q0P)ag0a^iX;dji\6tp^]CghTVASuU$
E_LCh4YeWM1c-mG1c%!K1,1XB1GWMl0JNo5;c@+JAQ*8\G>N*aDImocEaia)F$25b;c?V'G%FTc
Dg,,kCh7*uARnSGC1Ums:gnHZ4YR4A;c@+JAQ*8\G>3!oDGP:^BlnDZ0a^iX;dji\:i'QXATUXT
B2!#VBlm!ZGs*o80JG170JG170JG170JG1l.ki[b;c?V'G%FTcDg+QeDKBo2Ci!O%Bl@m14YR4A
;c@+JAQ*8\G=-:dF*(u0CghF"Df/<YD.RcO0FC`W;dji\;eU)n6tKqK;epYS@VTIaFE9T!$<'l%
@<Q3\BQ&)_AS#gZCO&Kg@:s.m4YR4A;c@+JAQ*8\G>iTlE_^%[ATL!g$<'l%@<Q3\BQ&)uASu4(
BK\$V;c?V'G%FTcDg+oeEbT&u@;\4^$<1q]BkM+$F$aGZFAm*uF?NN9B4uB06$$OIDKBN1D@03V
@;]XuF&R!tF?N!"FCB!(B-9rlD.7's$;GGWDKA`pEcaH3@<>poDeC1fF_tT!EXG*RFCfK2Bk29`
DfTq_:3CD_ATAo8BOu'(:18!N$:A`KATVulDfTq_:3CD_ATAo8BOu'(:18!N$<(ATASc0sFCfMl
DfTq_:i^JnATAng@;TQ_:18!NA5dSYEcY/tEcaH@Ec5o.EZe+cD.O&@EbT0"FCfN8;flGgF&R!t
F?NZ=F*1o-+AH9WDJ=38A7Z*CARTUjF*(?&@<-EfDfTq_6tp^a@;]Rd$:JfT@VfUSFCB32;f?\u
4[`jn@<HC.+A[#gATA,Y@<-'j@VfUSFCB32;f?\u4[`jn@<HC.+A[#gATA,GAS#gZCO&isEcaH@
Ec5o.EZe+cD.O&KATMp,ATC^fEcaHFBleE*C`lG\B5VF*F_#%j6XaeAG@bT,;f?\u4[WY"@;Kjp
+AR&r@V'Qe6Z6j`FCf9)@<?4%DKA`pEcaH@Ec5o.EZe+cD.O&?F*(u6Ble-4;f?\u4\g-:@V'R&
FD,6'+AQ?^AI;.CFCfB2;eU)nATDijDfTq_:i^JnATAng@;TQ_                        ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3&)O11E\Fq1b^%20d&5.+>Pku1,'h02BX_0+>Pku0f:(00d&51+?)5%1,L+43$9q2+>bnt0ea_*
0d&2.+?1K!1*AD3+>PVn2)-4/2BXk96?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?
2d^E4BQS?8F#ks-GB\6`@;KdhDII$-@rH3;@<6O2Df0K1GqWWIBkM+$/TZ#BEcWm[BlIR#A7[DR
1H%'J0/>4:1G(::/M]7[@<Q?t@<?4%DI6=a@<-ErF)-&;BleB;CO%%D@:iqgBco;VDdmd!Ecu/7
B-;#)F*(/cG%kStFD5Z2?W2&TEcYT0G][h3G%kStFD5Z2+EMX5EcX8aBQS?8F#ks-ASs,EBkqF%
ARoL`/oPcC06_,GBeN.oF*(c-Am]V$@<-ErAoD]sDII^&B45mrDf/BI;cI+EBldj,ATUaE;cI+E
Bldj,ATT&6Df^"CE,ol,ATMp2Eaa&uDDGR1G[k<$?Z^O7@rH4'@<-("B-:c1@qBI!@<>pq1*C[W
+A*c"ATD6h@:FLuDf08tDI7:"Ec#6$?ZU<tEcYStF*9lY@X2d.DJ<Ns+EMX5EZf7.D.Rc2F(JoD
+D>k=E-"&n06_Va/nna:/oPcC05u&CCh[B4FD,6&ATKMB@;T^rB4#_%@<-EB,Ao>P@<Gpp@;TRd
?ZU<tEcYSC0JYCjFEhnMFCmKT@rlf9De:+fAnGaeBjkg#8O6?!6Xb(FCi<r/F(f,rF<G:8+A"k!
?ZU<tEaO$/EbfB,B.eFFF*JfZ+EM+*+Dbt6B-:`'@r-'n@<?4%DI6sbF[\Yt+=KZeEcbt;6Y1.W
ATD?m+B<;nG%G]8ALSa<De!3tBl@m1+D,>(AT2[)EbTT+F(KH7ATW'6+ED1;ATMF)+E2@>C1Ums
EbTT+F(KGnF(KAbAU/?>F(KB-AU/?;Bldj,ATV9sDffQ"Df9DuBlJ?8@VU%)H$!V<+Du+>AR]Rr
CER>-Cisf@Eaa'(DJ((?EbTT+F(KGB+EM%5BlJ0:Cisc@?Xn5!Eb0-1?ZU".F(KH7CO%%D@:iqg
Bco;VF_l2@FWbd?D.P7@Ci<flFD5Z2/0JVEEbTi<DBO"3FED57B6/?0Ci"$6F*)><ARAqiEcP`/
FC0*)H#mP=F)-%DF(&ZhEbQXS+F.O7Ci=N=FDl&.+EV=7ALns?De!3tBl@l?+D>\6BmO]8+EM+9
FD5W*Er                                                                   ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&p1a"V81210>?Z':hARo.hFCB32?SX;j11,-JFAupfF!,:5F*&OK@<3Q&G][t7@ru9m
+D,Y4D'0sCBOr;/8T&W]Ec,<-Bl@ltC`l#bFE2;;Df'2u@;H9NDJ=$,+=KfI<@K&3Blmp-3XQ4-
FEDJC3\N.1GBYZR@<F2@Eb@$4$>=O'E-"&n06_Va/nna:/oPcC05u&CCh[B4FD,6&ATKMB@;T^r
B4#_%@<-EB,Ao=F$;!N`+DkP$DKK<$DK?q/+EMLBART+jBOtas+E(j7,&_(*Bk(jcCa(!CFCB24
DIIBnF"SS9@<-(#F`Rn3@:F:#+DG^9+EV:2F!,OCEb/ZiF(f,rF<GF/Bl8$$Bl5&0BleB;+<YT7
+CT).ATDZsFCcS4@;TRs$>+<sD'3M+F*)>@Bk(Rf+EMX5EZek#FCB!(B6,[J=`8F*GA1l0+D,>*
A3(&)G%G]'@<?4#3XQ3jFDku,D0[6U+EqL-F=2,PCMn'7DBNk0+D>J1+D,&!Dfp+D@psIfCi<qn
883$^@<,jkF`SZW+EV:.+CT.tBk;1(+CT>5Ec5i6D.R`1DJsV>FD,5.F)YPtARfahAonAH@:FLu
Df08tDBM\mEc#6$+B*AjEcW?T+C\noDfTD37ri0PCER+qFCB!(B6+Ce$47+I$3            ~>
)
showpass 4 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' riseset CR DARKTRS DAYSECS IFACEWORDSriseset JULIAN LF LI'
zz=:zz,'MITHORZ LIMITMAG LOCATIONNAME NORISESET OBLIQUITYDMS2000 OBSLOCATIO'
zz=:zz,'N ROOTWORDSriseset STDALTITUDE UTCOFFSET VMDriseset afterstr alldif'
zz=:zz,'s apparRADEC apparsecs apparsidjd0 apply arccos arcsin arctan asser'
zz=:zz,'t atan2 baby_today babylonian_named_stars beforestr boxopen cold_ia'
zz=:zz,'u_named_stars cos cosd ctl darktransits ddfrdms deltaT0 deltaTdy df'
zz=:zz,'r dmfrhm dmsfrdd fmt_today gT0jd gT0ymd hmfrds iau_today intr3p jul'
zz=:zz,'frcal ljust loadstars localsun location_home location_uluru locatio'
zz=:zz,'n_yellowstone meanobliquityT0 meanobliquityT1 meanobliquityjd0 mean'
zz=:zz,'sid0 meansidjd0 nav_today navdaylist nnth0 npth0 nth0 nutation_long'
zz=:zz,'itude_dPsi parse_iau_named_stars parsebomcsv parsecsv parsetd read '
zz=:zz,'rfd riseset riseset_calc rjust round sin sind smoutput sunriseset1 '
zz=:zz,'tabit tlf today_calc utf8 zetzthT0''),<<;._1 '' risesetUtils J2000ymf'
zz=:zz,'d afterlaststr afterstr allwhitetrim antimode atan2b beforestr char'
zz=:zz,'sub dev dsfrhms dstat fdfrhms fuserows kurtosis location_far_north '
zz=:zz,'location_far_south mean meansidymd0 median midpt mode2 nutation_obl'
zz=:zz,'iquity_ecliptic_dEpsDeg ofreq portchars q1 q3 rjd skewness ssdev st'
zz=:zz,'ddev tabit tlf var winlcchars yyyymmfd''                            '
zz=:1178{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&u+>GQ.0d&2++>bi1EbTT+F(KGg67sa.Bldj,ATT&9/M/)TDf'H9FCcS8Bldi:+EVX4
DKBN6+CT.u+EM+9+EV=7ATJu4AfsZ2<?Q0fD.R6#F*(i2F"Rn/:-pQB$;No?+Eh=:@UX@mD)reR
DKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'@UW_k?Z^3s@<itI
+DtV)ARloM@:FLuDf08tDBO"B@<-E3EbTT/DJ(VDATW$.DJ()6De*:%%15is/g)9KD00-,De*:%
+<W6YAoD^,@<<W6De*:%+Eh=:@WNZ4ATN!1F:ARP67sB'Bjl-kFDk\uGp"4]+DtV)ARloT5uf%K
FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uGmt*U67sB'Ci<`mF*(i2F!)SW+Dbt)A9/l6Bldj,ATT&9
FCB24A79Rg%15is/g)9S@<Q""De*:%+<W6YDIIBnA0>buG%kStFD5Z2+EMX5EcW@DBle!+B.n=;
FED57B-;;7A79`m$;No?+<YQ1G%>$,Ch[s4+>"^WCO%%D@:iqgBco<@0Hb:CF(KB8Bl7Q+Ch[s4
+E(j7FDk\uGpdYUDII^&B45mrDf-\=FCB32%15is/g)9WBldj,ATT%;+<W6YEbTT+/0K%T@;^.#
F=\PUATT&:Bl.F&+E(j7F*(i2Et&IO67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU1,EcUE\]Wt-u!+4?Z^4(BkM+$.3NYBDIIBnA0<:7@<Gq!De*:%
.3K',:-pQU1,EcUE\]WtG%#E*Dfp+DCi<flFD5Z2+EM+9FD5W*+Eh=:@WNY?Ci<flFD5Z2?Zg1-
EcifR@:Wn[A.8l@67sB91MpQ@1GBq"DII]qFDk\uGpskEA7T7^%15is/g)o*@;p6@0d%lVD00-,
De*:%.3N&0A7]9\$;No?+>P`]E,mWj+=M,9G%>$,Ch[s4.3N&0A7]9\$;No?+>P`]E,mWl+=L]-
@X2=&De*:%.3N&0A7]9\$;No?+>P`]E,m]m+EM47G9CsLDK9H4AM8+9F<G[>D.Rc2@:Wn[A0<::
De!3lF*2@L%13OO@rGjn@<6K4-ZWpBATMF)-OgCl$7InX3\`?<+>Gbs:-pQUBPD*m+E2@8DKI"?
Eb/`pF(oQ1EbTT+F(KGnFD5Q4:-pQ_EbTT+F(KG9F=f'e@rH4'F`_1;EbTT+/0K%T@;^.#F<G"0
A0>r)F<G[>D.Rc2De:+`5uf%F@;TRd+EMX5EcWiB$;No?%15is/g,=KEaiI!Bl,mRBl8$(Eb8`i
AKZ28Eb$S>.67nF:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU+Dbt)A92j$EcW?T+Dbt)A9/l6
Bldj,ATT&9FCB24A79Rg%15is/g)9WBldj,ATT%;+>"^VBldi:+EVX4DKBN6/0K"FF<G[>D.Rc2
De:,5FCB32%15is/e&._67sBjEb/[$ARmhE1,(I>D..H=3=Q<j67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aCghC++=D2DF(KE(F=.M)                                            ~>
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
0ea_)+>P&u+>bl.20*DPATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
DJsB+@ps0r@;KRpEbTW/D0$-nFD,*)+Cf>,E-686+EV:.+ED1;ALnsGEa`j,BlkmK@;]TuF(KG9
FD5T'F!,C5+BqE'<@r)sD.R6`-tm^EE-"&n06_Va/nna:/oPcC0.@>;F*(i2F"SRE$4R>MEbTT+
F(KH$+DGm>A8-+,EbT!*FCeu*@<3Q"DBNA1G\Lu1@<-W98g%PQA8c?<+@1-pBl%ToEd8d9A7TUr
F!+n3AKVEhBQ%s6ARlotDBNn=Bm*p,AKXKWF@^O`+ED%4Df]W7DfTQ'F"SRX?uft&ATMF)?m&rf
DBND"+DG_7FCB!%ARlnm$>FB#FD,5.Ci<flC`l=mAoDKrATAo$IUQbtDf0VLC11UfF'p,7Bln#L
%13OOIXZ`p+F>4`C*7p6$>aWhA0<7=@:O._DC5l#%15is/g+b?Ch7Z1Ao_g,+D>k=E-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$.!@:O(o%16feF*(i,C`k*<Bln$2@QIt,CLqO$A2uY'C11Uf
F(eulCNCj4$4R>;67sBpDKBo.Ci!Zn+D,>(ATJ:fA8-',-[oK7A8c@,05=p*CNCj4$@[GQINT(,
%15mK@q?csDKBo.Ci!Zn+DGp?@ps6t@V$ZuDdd0fA0>;uA0>o8DBO.;FD*]E$4R>kIXZ_gHQXqU
+FO\+Ci<`m+=DVHA7TUrF"_9:@r$-=EbTT+F(KGGBkh]:%16oi@psInDf/p-ASc1$GB7kEDIjqE
%13OO:-pQU8O6?!F*(i2F!,L;F(oN)06:]HFD5W*+E)F7EZe.oA0=?MBln$#F_hKoAo2WsFDk\u
Gp$g0F^K6/A79a+0F\A<IXZ_g%13OO7W3;iD/XH++Co&*@;0P!+CS_tF`\aIATW$.DJ()7E%E,P
F`))2DJ(LC@;]Tu,%tCpCM@[!+s:96Bldj,ATV<&Eb/ioEX`@tD]j.8AKXTfE-ZP:EZf7<FCep"
DegJ"?uft&ATMF)?Z'e(AR]RrCG'=?H#@)!>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
@:O(oBOPCdF"_!=DdkA:@;0U4EbTT+F(KH#DJsW.@W-1#/no9MDIP%;DfQtBBOr<*A7cs-ATDj+
Df-\9Afu/'D.O.`>@;JcF(KE(FC/p(FCep"DegtEA7f4T-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,U@r$.!@:O(o04Ja9@P;S,Bl5SEBldj,ATV9sDffQ"Df9DDE+EQ0/g*K!FD)e8Afu2/
ATME*Anc'mF!+n3AKY])F*(i,Ch7-"GA2/4+CK5(F(KE(FC6^1$4R=O$=%Xp@WQ*jFD5Z2HX(Z(
G]\%LHZEhAATMF)I3;+!FCfK)@:Nks%13OOIXZ`p+F>4`C*7p6$6UI1@<-F#?YNqk?Z':hARo.h
FCB32+<VdL+AP6U+Cf>-G%G]9+A"k!+C]G&C`mh<+Cf>+F_u"=A8,OqBl@ltEd8cM+<VdL+<VdL
+<VdL+<Vd9$6UI$DerrkBjl-kDIIBnA7'D"@<-E3+<VdL+AP6U+A"k!+DtV)ARlp)FCB24Ch[s4
+EVNE@WZ*r+D>=pA7]d(FCAWpAKW*<+<VdL%17Q5IXV_5%13OO>]Y$sF(Jj'Bl@m9>]aP%FEDVO
EbTT+F(KHA+@0gVDfTQ6BPekeDffQ3I16Mm$4R>:@;^?5+CK5(F(KE(FC65"ChI[,Bln$*F!+n3
AKZ)'CLqB+Ao_g,+A-3RDBMYbAT`&AF!+q1DegIF6$%-gDf0K1Bk(Rf+@0gVDfTQ6BPhf?/e&.R
+AbHq+Cf>/Gp%$;+EV:2F!+q1DegJ0F!+n7@;0Od@VfTuBOu3q3XlE*$<q1cFDu:^0/%$J3&!*I
0K1V,F"UmA@q]S"AM.nAB.l"o055N>D0%@=F*)G@DJsB+@ps1^ChI[,Bln$*F)#8pDJ`rrF`T8t
3AE0m-tm^EE-"&n054iS0JYUA2_K5o/n&d1BPDX$/oPcC0/>47Blmp'F"^sCFE2;;Df'2u@;K@g
B5_g)FD,N4C1UgkD.R:$F"o[80eXsb$4R>NCiaM;BOu3q3XlE*$<q1cFDu:^0/%NnG:m<@@<uj0
/n8g:069?l4`b^cBlIO"DejD@EbIUT?SXPd1I4WE@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgD
F?N6-@;[SiAS$"*-?<[04_/M=@X2d(DIm0rEaN9oDei]7>psB.FDu:^0/%NnG:m<@@<uj0/n8g:
069?l4`b^cBlIO"DejD@EbIUT?SXPd1I4WE@;[SiAS$"*-?D=jASbq$@;]RdEa`j$-?NgDF?N6-
@;[SiAS$"*-?<[04_/M=@X2d(DIm0rEaN9oDei]7.1HUn$;P_c@<?4%DBNA(B5_g)FD,N4+CT;%
+D,Y4D'2GZGp$'pDJj$+-Z^DOBlmoI%13OO>A/,#E-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0
FD5Z2F"_6FA7^!<E+j2r-tm^EE-"&n05b?>E,ol0Ea`g%Bk)3:@rH3;DKU&0FD5Z2F"_6FA7^!<
E+j2>%13OO9jr'XA8c[0+Eh=:F(oQ1F!,C5+B2ceDImi9F!+n-B5_g)FD,N4+CT;%+EMXCEb/c(
Bl5&8BOr;Y:IH=5Ap&3:?m&lqA0>9&FD5Q4?m&uo@ruF'DIIR"ATJtG/M/)dAS!n3$4R=s/g+P>
F`_&6Bl@lrBl79oDf03%FEM,*?XuuSBjY^f?k!GP$8O4V?uC+/@<?4%DI7*q?Z0CiBlS90FEq53
Am]+ZCh[j1Bk(L\7<!<9AS5@eA7,iR%16fe3XlE*$<q1cFDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGAp&3:/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGAp&3:/no'A.1HUn$<q1cFDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGF`_>6F"V0AF'U2-FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=04Ja9@P;S,F*(u606MANCi_4CC3(g5$4R=O$:JHAFC?:k+=PO"<%/r(
F!+t2D/aW>ARlp+F(oN)+E278H#@P;Bjkg#AU&07ATMp,Df0V=@X0(bF)Y].@;?uoDIakaAS$"*
/0K"FANC8-%16<QFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!@<?I,Cj@ci
0JkCqFDYi"-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7KE%ba5Cij*-E,TQ<1,(C=
/nf?DCaff#%15BDD..I#A8c[0+Eh=:F(oQ1+E(j7FD,5.6tL1V@3AMl.*e&V.3N&8B5_g)FD,M6
BlbD2DBN>!F`_\4+EM+*3XlE*$8F.U?uBCo@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1?Y44s?Y!_a
FCANu?Ys=]%13OO<+ohcF*2A@Bldi.@;]TuF(KG9G%G]'+CK85DK9H4ATMF)0jl,<F!+m68g&:g
EcYr5DBNk0+CQBZ5uU?B+E2@>B6%Et+D,1nFEMV8A0;<gBl5&8BOr;\@<,jk+>Y,p3B8r>.RA,t
Ec5i6D/!KgC`l)`D/aW>Bl7Q5+Cf>+F_u"=De:+r;epY$@;]Tu<+TlWF(9--AR-]tFEDJC3\N.-
CO'?+A9;C!ATM@"E+LY?Eb@$S/e&.l<+ohc7WN'O+A?KYEaa!6>psB.FDu:^0/%NnG:muNAS,so
ASc'iEaa!6/n8g:0.A#\@;0V$@;0V#+CQC&DfBtEDe:,6BPDN1@<-I(@r,^!/Kf+GANC8-%16<Q
FEDJC3\N.1GBYZ]BOtdrAS#[l@WGmtGqNTFD(eh1DK9H4ALhhEDKBB2.q<7$Ci![#B4WAF@4QG5
ALht=DJj$+F"T%Q0JPIC2Dm6E2-hVDFEDJC3\N.1GBYZ]BOtdrAS#[l@WGmtGqNTFD(eh1DK9H4
ALhhEDKBB2.q<7$Ci![#B4WAF@4QG5ALht=DJj$+F"T%Q0JPIC2Dm6E2(8tA%16<QFEDJC3\N.-
CO'?+A9;C!ATM@"E+LY?Eb@%6@W-C2/Tl+fF)-%Q@;]U-FCf9"F(9--AM%V6A7^!=>psB.FDu:^
0/%B^H!tT$FCf9"F(9--AM.nAB.m\&Dfp.RF`T3WCO%L?DIb>@ASbq!@rH<t/ST*5AU#jW%13OO
9jqpb+E)@8ATAo-DKKH1ATMs-DJ((Y5uU?B+=^<*Gp$O5A0=i_Ch7ZtDfB8;+E2@>B6%EtF!+n3
AKYYtEb.9@$4R>HBQS?8F#ks-F)-&0DIdj#Ch7ZtDfB8?DfTJD@<6O2Df0K1GqF&JF)Q2A@qB^7
@UX=l@kDY?DeF*!D0%:@Ec5eHF)-%QFCf9"F(9--AM7=;BQS?8F#ks-F)-&0DIdj#Ch7ZtDfB8?
DfTJD@<6O2Df0K1GqF&JF)Q2A@qB^7@UX=l@kDY?DeF*!D0%:@Ec5eHF)-%QFCf9"F(9--AM5JA
$4R=O$<_:i+Ceht+Co2-E,8s.+EV:.+DkP-CLh@-DBNt2An?!oDI[6g+CS_tF`\aMBln#2FD,5.
8l%htAU&07ATMp,Df0VW%13OOIXZ`p+F>4`C*7p6$>aWhA0<74ASu("@;IT3De(4)$?'Gt4$"a$
F`_[IF`_>6F!hD(:-pQUA8-+(CghT3D..I#A8c[0+CoD#F_t]-FE7lu1a$=CF)W6`+FPk--o<8]
DJUaK/j:C*DKU&0FD5Z2?RIo_DIITp?RH9iIXZ`p+:SYe$;FrHGp$[C@;Tt"ATJu8BQ&*/DJ()*
Dg*=GD]j1DAKZ/)EbTH7F!+k2Bldj,ATV<&GAhM4F!+n3AKY])+EV:.+A,Et+CJf(FE:h4FCfN8
+EM[>FCcS&EbTT+F(KH$/e&.jDfm14@;[2uBle60@<iu(Cht59BOr<.ATMr9@psFiF!,[@FD)e=
BOr;Y:IH=:G]7\7F)u&6DK@iJ$4R>kIXZ_gHQXqU+FO\+1E^=NE$-NKBldj,ATT:B+<XEG/g,7I
F*&O7@<6"$+DG^9F*22=AIStU$8Wf8Ble59-ZWpBATMF)-QjO,67sBkBle60@<iu;ATMr9F*22=
AIStU$8`lGFEAWQEbTT+F(KG@+<Ve%67sC$F`&=1Cht59ATMs7+DG^9F*22=AISuqIXZ_T$4R=O
$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O$4R=O
$4R=O$3                                                                   ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' riseset riseset_atan2_smoke riseset_espenak_smoke riseset'
zz=:zz,'_meeus_smoke riseset_navstars_ecu_smoke riseset_navstars_safari_smo'
zz=:zz,'ke riseset_riseset_smoke riseset_tanner_smoke''                     '
zz=:180{.zz
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
1E\P#-p0UR/mg=U-QkfC;G0te;]nIo=]7aV;]nY$5sn(B:JsSZEbTT+F(KG98hr(S0R7MIA0=KE
9M%NF+A>@$8Q85V;Hb2:8PMcU9gM8l9M\#A<(Tk\:-hTC+AY<t8PrJZ<*;U`;]nk&9M&)]8Q8h\
9iEf$0JFVF6;pQR6U=[C:JN$1:JXqk:JsSZEbTT+F(KG9;cH.N9N4S_<CB7u<E)=]7Rg<F<$549
6um!_ATMF)+CT)&A8,Xs+CT5.@<,736q'Hc@;p0oEcYf%F!+n1E+*d.Bk1sh0HaeG@;[hC@<>pq
11DA8@:FLhFDk\uGp$R)@X2d.DJ<Ns?Z':hARo.hFCB32+Cf>+A7'%ZF^K#pD.R6bF*(i2F!,"%
Ebfc;@;^.#FE8R8A92@'BPhf5A7]S!@8np'A7]S!@8pc_+Co>$EbK;4A92@'BPhf5An5LoBPhf5
Ao2WsFDk\uGp$a!0PY,@B2gR1D.Fc&D.[g!F!,.5F(TH'A9/l,D0'<0A9/l-@<Gq!De*:%+DG8,
?Z^4(BkM+$+DG_8E\hYWCi<`mF*(i2F!,:;@ps1pF`&=<De!3tBl@lrAmo^eDJsQ;BHV,0@psIn
Df/oo@<,^rDfp/8+Dbt+@<?4%DI7'qD.Oi+De!3tBl@lrF_l2@FWbL=@psInDf/p-ASc1$GB7kE
DIjr-ARTIp@VfauF_PrC<%oG3ARTIp@VfauF_PrC<&#M4ARTIp@VfauF_PrCC1K"@D.R-nF(o/=
+Dk[uDKBN&C1K"@D.R-nF(o01D.G=CDII]qFDk\uGp%!5G%>$,Ch[s4+Du(=BJ:QHE-,bI+Du:7
0Hb7UFCB9*Df/ouDf03%FEM,*?XuuSBcq;9FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.@p`b8E-"EY
B-;/%EcYf!Bjl-kDIIBnA7'D"@<-E3E+*d.AR]Rp@rlf9EbTT+F(KG9EbTT+F(KH#@ps1`+ED1;
ATMF)?XmM\@p_u,<(0_.EbTT+F(KH#BOPsqA79RkF`M:@Eb],-F*2A@Bldj,ATTXLFCZM9De*9u
AKZ)5A79aj@ps1`+EVO4@<la/+F/6XH#7D1A0?20FF&%B<%o[K/1<VC4"akp+=A:@F_PZ&?ZKk%
ATMF)+C]J-Ch-mnBldj,ATV9iDdso1Bldj,ATV9fFCB&B?ZU(&CLnW/Bldj,ATV9jF)Y].@;B4k
D/X3$+ED1;ATMF)?Ys@cF`Uo2D/X3$+ED1;ATMF)?Z':qF*(i2F'iKgF^K3,Deio,EbTT+F(KH#
DII^0FCB32?ZTXf@<-'hF)>i2AKZ#-F(KE(FC0'&F(KE(FC0*+Deio,EbTT+F(KH#FCB')ATD.!
D/X3$-RgSp4?P\X?SNZN+ED1;ATMF)+ED1;ATMF)<HMqkF!iCf-p0%C-ZWpBATMF)-RgSp4?P\X
?SNZN+@:*_B4uBo;flGgF'hXQEbT&u@;]F<Ci*Tu@:NY"1MpQ@1,iQWA0=WUG%kStFD5Z2?W2&T
EcYT/CO'`1F*&O"@<Q?t@<?4%DI6=a@<-ErFEhmM:et"h?ZKk%ATMF)+B2-):L?_&@r$-V@:O(o
?Ys<r@<>pq11+U;@qBI`FEhmM@UW_kCi=3*@;]FiDfT]'CgV7*@<-Er@rlf9Bjl-kDIIBnA7'D"
@<-Er1,(I=?Z^O7+Dbt+@<?4%DI6sbFWbR1F(&EdAScHs?Z]XlA0>buF(&EpDes]:Df'2sCgUau
E,oN2F(oQ1F'iNtEaN?gCij)mFC/lq+Du=D@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>XD.Fc,F`_&6
Bl@lrBl79r@VfauF_PrC?Z0O`ARfOjE-,f(?XuTEF$sSP?Ys<rE,o]6Bldj,ATT&8Bldj,ATUpn
ATCFTH#k*KBldj,ATV9sDffQ"Df9DuBlJ?8@N]f0F`MV3@s)g4ASuTsF)-&BATT&?ASc1$GB7kE
DIm0bF`MM6DKK6,CO'u4F=/Lg-p07-2`)d80JYF<1bpj>2)$^@3&WZT0K(%/0JYF<1GUpB1c79Q
1GCOD3&Da50JYF<1GCgA1cRHM3&icN3AM^40JYF<1GUX:1c[NQ1Gh*G2E)a60JYF<1G^a<1H.6J
3B&cM1H6L40JYF<1GUpB2)6j@0f^pI1H?R50JYF<1GUpB1cI-F2E3NO0fU:20JYF<1b^X:2)RBO
3&EHM3&Vm70JYF<1GLd?1b^XD0KCjA2`2^50JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D
2)@$F1c?I30JYF<1GCgA1cRHM3&icN3AM^40JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G
0fCgG2DcO30JYF<1GCgA2)-d?1c70F1,^710JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUX:2)I$D
2)R-K3Ahp70JYF<1GLmB2E*WV2)6pH3B83;0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1GU^<1H.0N
1H%*M1cHO40JYF<1GU^<1c%$E0fUmA1H$@20JYF<1b^mA2)7!G2_m'D3&;[40JYF<1b^mA2)$jF
0etL=0eje+0JYF<1GCd@2)$dB2`<ZM3&;[40JYF<1bpj>1cI9I1,C[?2_lL20JYF<1GU^<2E*?M
0JPC>0fU:20JYF<1GLd?1c@'E1,q*M1bg+.0JYF<1GLg@1bq'F3AWZQ2E;m80JYF<1bpj>1c@0M
3&<9J0d&5*1,CU?1,U[D0K(pG2D?gB3?U(21,CU?0eb4:2E!EK3B&oP2'=Y.1,CU@0JP1:0JtO=
2)6jE3$9t11,CU?0KCaD3AiZQ0K(aH2]sk01,CU?0KCaD3AEBN2)6jG1*A>+1,CU?1,ggG1H7*F
2*!ZT2'=Y.1,CU?1,:I?2`W]O2)mHN1E\G,1,CU?1,U[D0K:d@2E*?H+>PW+1GCU?3A*-E3ArcU
2*!KK+>PW+1GCU?3%d$H2`EHH3B&c;1,(I>0JbI@/i5I@2)?s@1c$j/1,(I>0JbIA/i5:@0K1aI
1,h$41,(I>0JkOD/i,II2)%!D3A<H91,(I>0JkO@/i>OD1,q-H0K1j31,(I>0JkO@/i>L@3&39F
3B8o=1,(I>0JbIE/i5CA1c[BI2Dm?71,(I>0JbIE/i5:<1cR9K0fLg01,(I>0JbIE/i5@<2`!?P
2`EW;1,(I>0JbF@/i5C?2)-dC2D@'41,(I>0JbFA/i57=2_m3J2`<E61,(I>0JbF@/i5C=0f:gH
1cI?91,(I>0JbF;/i>XF0JbL@1c%$41,(I>0JbCC/iPL=0fCsL2DmB81,(I>0JbF;/iGC;0JGIF
2`*B71,(I>0JbL=/iYO=0fCpG3A`W:1,(I>0JkIA/i>LE3AE3A0ek[21,(I>0JbF;/i>IC2Dd9G
0f1".0JYF<1GLmB2_[0J1GU^G0Jjn-0JYF<1GLmB2_d!F0f1UB1H?R50JYF<1GLU:2E<ZQ1H@6G
2DZI20JYF<1GL[<2)@!G3&iTJ1,pC30JYF<1GC[=2Dm3K0fCpG1,^710JYF<1b^mA1H@BP0etXA
2DcO30JYF<1GUg?2)6sF2)%$G2`;d60JYF<1GUmA1c7*F2)70M1*A>+1,CU?1,pmB2E*EP0KD-M
+>PW+1GCU=3A*0D0JPIB3&<NM+>PW+1GCU=3A*3K3A`WM0JY@?+>PW+1GCX@1G1L@3&EEI1H%6M
+>PW+1GCU?0ePC>2)[?I2`EHL+>PW+1GCU>1bLUA3AWQI2DR*31,(I>0JbL=/iPdI3B8lO0K1g2
1,(I>0JbF?/i5@A0ek@?3Ai`<1,(I>0JbF@/i5IA0etL>2)dK;1,(I>0JbI>/iPaG1cI-J1cR65
1,(I>0JkO@/i>=:3&WHG1c-=10JYF<1GUpB1c79Q1GCOD3&Da50JYF<1b^mA2)?sG2D[<J3AVd5
0JYF<1GUX:1c[NQ1Gh*G2E)a60JYF<1G^a<1H.6J3B&cM1H6L40JYF<1GUpB2)6j@0f^pI1H?R5
0JYF<1GUpB1cI-F2E3NO0fU:20JYF<1b^X:2)RBO3&EHM3&Vm70JYF<1GLd?1b^XD0KCjA2`2^5
0JYF<1GUX:1c%!E0KCsG1c6C20JYF<1GUpB1cI*D2)@$F1c?I30JYF<2).$B1H7'B2`EHJ1,C%.
0JYF<1GUpB1H%*I2)[?L1c-=10JYF<1GUpB1cI6G0fCgG2DcO30JYF<2).$B1H7'J1,psH3&i$9
0JYF<1GUd>2)6pA2`!HL1,U100JYF<1GUa=1c73O0JbLD3B&'90JYF<1GLmB2E*WV2)6pH3B83;
0JYF<1GLmB2`!?I1,CmG0fU:20JYF<1bgd=1bgaG3&3EP2`W!90JYF<1GU^<1c%$E0fUmA1H$@2
0JYF<1bq!B1c$mA3ANNL0fC.00JYF<1b^mA2)I0M1c%'N1cZ[60JYF<1b^mA1cR?M2`<BI2)HF2
0JYF<2)-d;1bpgH2DR'F3&r*:0JYF<1GU^<2E*?M0JPC>0fU:20JYF<1GLjA2`3QQ1,(LA3?U(2
1,CU?0fL^A1-%$K1H@<N3?U(21,CU@1,CO>2DdBQ1GLgC+>PW+1GCU?2(gjB2E<KM0JG@E+>PW+
1GCU>0J51?2Dm9N2`NNL+>PW+1GCX@2_HpD0f1UE0K;'81,(I>0JbCC/iG^I2)d3I1cI?91,(I>
0JbCC/iG^E2)mHK0KCm21,(I>0JbIC/ib^I0f([I3Ar`;1,(I>0JbI>/iGXK1c.'L2)R041,(I>
0JbIA/iYOE0ebLE0f'q-0JYF<2).!A2)[9I1,(CB0esk,0JYF<1GUpB2)m<M0K:jK1*A>+1,CU?
1,LU@1GCL:0f1XB1E\G,1,CU?1-$sE1,(RE2_[-E3?U(21,CU@1,ggB0eb=>2`<NI2]sk01,CU@
1,CO?2E<NQ0f1dJ2]sk01,CU@1,CO?2E<NN0f(LC3$9t11,CU@1,CO?2)$a@2)I$F+>PW+1GCX@
1G1OE1-%?K1,UpE+>PW+1GCX@1G1OE1,^g?1,UmH+>PW+1GCU?0J51<2`*EL2`WWL+>PW+1GCU?
0J51<3&*9I1,_-81,(I>0JbFD/i>C?3B/lQ2`3B61,(I>0JbF;/i>XJ2E3NQ3B&f<1,(I>0JbF;
/i>XJ3B/fK1c%$41,(I>0JbF;/iGC?1GppG3&WZ;1,(I>0JtRC/i>OH0K1jI2_d971,(I>0JkIA
/iGFC3A`NM2)R<81,(I>0JbF;/i>IC2Dd9G0f1".0JYF<1GLmB2_[0J1GU^G0Jjn-0JYF<1GUX:
1c6sD1H%$H1H-F30JYF<1GL[<2)[EM2DHpC1c6C20JYF<1GL^=2)[EQ1G^d?1bp1/0JYF<1b^mA
1cR<O1c79L2DZI20JYF<1b^mA1H@BP0etXA2DcO30JYF<1b^X:2)dKT0JG:>3&Da50JYF<1b^X:
2)dNS3&3KS2DZI20JYF<1GUpB1H%0J3A<HR1a"P-1,CUA0fL^@3&!<I3&EHN2BXb/1,CU?0KCaD
2`W]Q1GCR=2'=Y.1,CU@1,CO>2)[HQ1,q-M1a"P-1,CU?1,1C?0f:jI0fM$G2BXb/1,CU?0f1L>
2D[?R0JG:@1a"P-1,CU@1,ggB1GUa@1c[?I1E\G,1,CU?0f1L>2D[6G2_d3I2BXb/1,CU?0f:R?
2`!9G1-%$E2BXb/1,CU?1,CO=3&EWP1GpmH3%6C,4>J$>,Vh&/1GCU=3A*0D1GCgK1b^^F+>PW+
1GCU=3A*-K2_d0M1c[<H+>PW+1GCU?1+k@B3&<EH1,gsJ+>PW+1GCU>3%d!I1,L[C0JtXG+>PW+
1GCU>1+kCA2DI0H0fM!51,(I>0JkI</ibjF3AWZP2E!Q<1,(I>0JkI?/iGOC2E3QN0d&5*1,CU?
1,ggG0ekRD2_d6L3?U(21,CU?0et@<2`*?K3&EBK1*A>+1,CUA0fCXA2DI$H0et[D2BXb/1,CUA
0fL^@3&3EM0K(gC1*A>+1,CU?1,pmC0JbLE1Gh*N0d&5*1,CU?1,CO>1,^jI0K1jE2'=Y.1,CU?
1,pmC0KD$M1Gh*N0d&5*1,CU@1,CO?3A`WP2E<NH2BXb/1,CU@1,CO?3Ai]L2_mBI2BXb/1,CU@
1,ggB1cI9N1H7<P3?U(21,CU?1,CO>1,_!F2E3BL1+=b&4>J$7,Vh&/1GCU=3%d'F0etLA2`*9I
+>PW+1GCU?3%d!G0JkdF0KCpF+>PW+1GCX@2_Hp@1,gpC1bh!K+>PW+1GCX@1G1OC1cRHQ2`!BN
.4cl01,(I>0JbF=/i5LH3AE<L0K(a<3AN3B1b^U@3&WZR3Ai`S3&3EBBeD.`0e"Y%4>J$63$^75
1,CU?1,ggC0K:dI2)dEN1E\G,1,CU@0K(O?1-%6I2E*HQ1E\G,1,CU?1,LUB0JbUF2)[<O3$9t1
1,CU?0KCaB3&iZQ3&`NJ1E\G,1,CU@1,(=;1bga@2)$a=3?U(21,CU?1,1C<1,1X@0JbOD1*A>+
1,CU@0K(O?2D['H1,h*M1E\G,1,CU?0Jb=>2Dm<F2`39D1*A>+1,CU@0JY7;0K:mJ0K(pJ+>PW+
1GCU>3%d$F2DHmF1b^[B+>PW+1GCU>1bL^@1GUa?0K(mF+>PW+1GCU>0eP@C0JG4?0ek[G+>PW+
1GCU>0eP@C3&EBG1,Cd11,(I>0JbF;/i57@1,1LB0f([01,(I>0JbF;/i57?1c@9P3AN?41,(I>
0JbL>/i5=>2`WlP0K:d01,(I>0JkI@/i5LF1,L^>2E*?51,(I>0JkI@/i5:A2E3NP0JG:*1,(I>
0JbIC/i>=B0f_*M2Dm951,(I>0JkIA/i5=D2DI*K1c[?71,(I>0JbIC/i5CD1,(XG2`N`=1,(I>
0JtRD/i,I@3&3HI2`Nc>1,(I>0JtR=/i5@<1c.$H3A`T91,(I>0JbI=/i5RH0f(XE2)@061,(I>
0JkIA/i5IB0fLjH2E*E71,(I>0JbC@/iPI@0JP@C1GLm41,(I>0JkI=/i57A1cI*H3A_j60JYF<
1GLjA1c70G0K:mC1,U100JYF<1GLd?1c7$F1,V!G3Ahp70JYF<1GLU:2E*<D0fLgA3Ahp70JYF<
1GLU:2E*TP1,:U@2'=Y.1,CU?1,LUA2Dd*H1,1OE3?U(21,CU?1,pmD2`!-C3&3<E1a"P-1,CUA
0fCXA2)%$E1,(XB1E\G,1,CU@0JtI>2`ENM2)7'H0d&5*1,CU@0JtI>0fM!M1cI*B1FXk'4>838
-p014/1<V7.4cl00I\P80E                                                    ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
