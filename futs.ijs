NB. sha256:fe78a0e0ee2d00e80d836be213077295f8fb7d0892acc16f0eeb801ed28068c8
NB. JOD dictionary dump: 23 Apr 2023 14:59:48
NB. Generated with JOD version; 1.0.25; 14; 04 Apr 2023 09:24:10
NB. J version: j9.4.2/j64avx2/windows/commercial/www.jsoftware.com/2023-04-10T01:19:53/clang-15-0-7/SLEEF=1
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

VMDriseset=:'0.9.8';2;'23 Apr 2023 14:26:39'

riseset_hashdateurl=:<;._1 '|fdc92777d8ff711f48c666b63e7a3d3547b49fffdca8efe85a0b01f4cd4ab53c|23 Apr 2023 14:26:39|https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs'

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
NB. monad:  (bt ; clLoc ; flParms) =. baby_today uuIgnore

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) baby_today y
:
NB. star data
({."1 IAU)=. {:"1 IAU [ 'IAU NAV'=. loadstars 0
bs=. babylonian_named_stars 0 

NB. !(*)=. IAU_Name Designation
'Rs lName cParms'=. x today_calc }. 0 {"1 bs
NB. include Designation names
Rs=. 1 0 2 3 {"1 Rs ,.~ (IAU_Name i. 0 {"1 Rs){Designation
Rs;lName;cParms
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
NB. dyad:  pl =. itHrmn darktransits ilYmd_drk
NB.
NB.   'Riseset Location cParms'=. (location_yellowstone~ 1935 7 6) nav_today 0
NB.   (>{:"1 Riseset) darktransits (3 {. 6!:0''),60   

NB. sunrise and set in day minutes 
srs=. _2 ]\ ,sunriseset1 (|.OBSLOCATION),UTCOFFSET,1 |. 3 {. y

if.     99 1 -: 0{srs do. 0 #~ #x  NB. sun is always up 
elseif. 99 0 -: 0{srs do. 1 #~ #x  NB. sun is always down
elseif. do.

  NB. transit times in day minutes and before/after set minutes
  rs=. dmfrhm x [ bam=. {: y

  NB. transits occurring when sufficently dark
  (rs < 0 >. sr - bam) +. rs > 1440 <. ss + bam [ 'sr ss'=. dmfrhm srs
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

'Rs lName cParms'=. y

NB. calc parameters
hdr=. <;._1' Location Mag-Lim Above-Horz Dusk-Min Julian ΔT Longitude Latitude Year Month Day.dd UTCz'  
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
NB. monad:  (bt ; clLoc ; flParms) =. iau_today uuIgnore
NB.
NB.   iau_today 0
NB.
NB. dyad:  (bt ; clLoc ; flParms) =. blYmd_LB_U0_LMAG_LHORZ_LOC iau_today uuIgnore
NB.
NB.   'Riseset Location cParms'=. (location_yellowstone~ 1935 7 6) iau_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) iau_today y
:
NB. date, julian, location, UTC timezone, magnitude, horizon, location, dusk mins
'YMD JD LB UO LMAG LHORZ LOCNAME DARK'=. x

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
NB. monad:  (bt ; clLoc ; flParms) =. nav_today uuIgnore
NB.
NB.   nav_today 0
NB.
NB. dyad:  (bt ; clLoc ; flParms) =. blYmd_LB_U0_LMAG_LHORZ_LOC nav_today uuIgnore
NB.
NB.   'Riseset Location cParms'=. (location_yellowstone~ 1935 7 6) nav_today 0

jd=. julfrcal ymd=. 3 {. 6!:0 ''
(ymd;jd;OBSLOCATION;UTCOFFSET;LIMITMAG;LIMITHORZ;LOCATIONNAME;DARKTRS) nav_today y
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

rjd=:9.9999999999999998e_13&round

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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
NB.   'Riseset cParms'=. (location_uluru 0) today_calc stars

NB. date, julian, location, UTC timezone, magnitude, horizon, dusk minutes
'YMD JD LB UO LMAG LHORZ LOCNAME DARK'=. x

'Rsiau cParms'=. (YMD;UO;LB) riseset y

NB. retain rising setting - circumpolar NIMP
Rsiau=. Rsiau #~ -. ; 1 {"1 Rsiau

NB. name ,. transit altitude, hour minutes 
ahm=. 1&{&.> 2 {"1 Rsiau
Rsiau=. (0 {"1 Rsiau) ,. (0 {&.> ahm) ,. (<2 3){&.> ahm

NB. retain above local horizon
Rsiau=. Rsiau #~ LHORZ < 0&{&> 1 {"1 Rsiau

if. 0<DARK do.
  NB. retain stars transiting when dark 
  Rsiau=. Rsiau #~ (>{:"1 Rsiau) darktransits (>0{x),DARK
end.

NB. sort by transit time
(LOCNAME;LMAG,LHORZ,DARK,cParms) ;~ Rsiau {~ /: >2 {"1 Rsiau
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
1H@662_cF1+?(E"2BXq$0f:(.2]sq3+?:Q'0d&@s0f^@:+>Pbr3$9q8+>GVo1H-F21*AJ5+>Gbs
2`2^40d&>0+>Gbs1bg+-0d&D1+?:Q"3?U%1+>Po!2]t"<+>GPm1c-=8+?2%t0eje03?U1%2)$.2
+>u5&0ea_,1E\G.+>bks1,'h,2]sh1+>c#"3$:.<+?(Du3?U:(2)ZR8+>l#!2]t%9+?(E#0H`@u
1,U13+?);'2BXq5+>t?#1E\Y"2`)X9+?)"t3?U+9+>GSn1GL"1+>Yu"3?U(5+>Ghu1bp1.3$:%5
+>GYp1Gg4/1a"S1+>PVn1b^%,2'=_5+>G_r1cQU42BXk3+?1K#3$9q0+>tqs0eje.0H`@u1c$7/
0H`53+>k9"1E\Ot2DQC3+>c)$1,C%20d&80+>u"u1,0n.0H`))+>bnt2]sn4+>GVo1G^..3?U.=
+>Y,q1E\D,+>l)#2BXe3+>GPm1H$@7+>c#"3$:%8+?1K$0LS3)92nefD/!m1FCfM9@V'.iEb-A%
DIakuAoqU)+EM[CF(KG9-nmeuB5VX.AKZ&:DCIt>=]7aV;fcM[Df0*,+E1n4+Cno+8Oc!579<8_
6rS,?F(KE(FD5W7ATDBk@q?d,DfTB0+=KfN5sn(B:JsSZEbTT+F(KGB+D5_5F`9r.0JG2+D.[<i
E,T6"+A+CC0JG+5+F.O,E\&>MDf0Z1/0JPF@:OCnDf0!"+Cno+3Zp172)-sF2'>%)C3=?)EarNo
+A+CC0JIchAn4M69M%NF@s)g4ASuT48p+ra@;[2u@<?'S8PMcU85E,eBQ%p*H>d[DCh[a#F<G:8
+Co%rEb/g'9M%rM<)#YKCh[a#FD5W*+DkP"DJ=38A7\G16U=[C:JOYN9gqfcD.PA2ATM@%BlJ0.
Df-\9Afu#$F(KB8ATAo0De!3tBl@lb6;0sJ<Cp.m6qpTgE,]i9G\M#'FCcS5@VfauF_PrC+E(j7
FD,5.ARfOjE-,f(+DG^9A7]CoAS#p6+Dkh1F`_29/0K"F@rH6qF&,+r8PrJZ<*;U`;_g$\0O\p>
Ec62:D..Nt+D#M1@qZuW1,(C9+E(_*BlS90FEo!IAfu2/AKYPoCh[j1Bk&8rAS6$pATKCFD/!m1
FCfME+EM+(Df0*,:I7uR:I@EI8P`*"@WQ+$G%G\:CghF"FEM,*+Dbt6B5)I1A7[;7G@bi;+Dbt6
B5)I1A7]g)DImHhFD5o0;GU(f=&2^^;fZSnATMF)Ec5l<+EqaEA9/kA;GU(f=&2^^;fZSnATMF)
.3N8DDfp"A+<VdL+B)6-5tk6L<)l=TF*(i.A79Lh+CT).BlnK.AKZ&9@<-E3/KePAD/a'(F('0%
F!,(5EZf%6EbTi<DBNA0D/XK7BOu3u@j#f'Ao_<iFD5Z2<E)=]7Rg<F<)lmb+EV=7AKZ;;DIjr/
AnH*qF<G:8+D>\9EcY8U6um!_ATMF)G%G]8Bl@l?+DkP&AKYK$F`):D@;]TuA79Rk@;KajBkDEp
Cht5?ATD]?+D,>.F*&rUF(Jj"DIb:@/hSb!DKKP7A8,XfATD@"@qB^(De:,0CcW\ICi!WrAof(Z
/ho%)0eb:iE,]6+;F*]>6XaqQ@<,psF<FII+CT.u+@JXc+D,P4+D#M1@qZu5GUXbIEc5e;8hr(S
0O\p>@<-F#@rl^&@rH6qF!+t2EcP`$FD5Z2+CT5.@<,psF<GX=A7]dm@;I'.Bl.E(/KenAAT`&:
E+^dG3&Da0+=PO"E-#_9.Ni5>F!tU=F"&Ok0f<BYE+*d.Bk1sh0O\p>@<,psF<F(oAS#b'Bk(g!
F(o/rEb/Zq+>"^LD0%`\@;p0oEcYr*C1K"@C3=?)EarNo+FH3m1,(I>+>Fup/35LG3ADX3+?1u2
@<>pq11>35FCB'"ASuT4De:+?=Wf"5==GA)DfQtBGAeU4EbBN3ASuU2+DG^9A7]CoAS#pkFCB&B
@UX(pATDZsFCcS'FCB&B+Eh=:@N[6F@<,k"@;]^hDKI">AfrL(+=/.U.3N>B+Co%rEb/g'+>"^W
ARuu4@<>pq1+?[@@X2=&De*:%DIIBnA0=3I@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57B-;;7
A79am@:FLuDf08tDI79iD.R6bF*(i2F(o/rDKKT)Bk:ft6=F>KCi=3*@;[3/FCB32+CT5.Ec61F
0f:X=+@8Fa@rH0o?YNqk?Z':hARo.hFCB32@rH7.ATDl88O6?!@WZ*r+EVNE@rH1+D/LJ,Bk)7!
Df0!(H":?(CNOT*DKBN6F)>?,CER\0Ch7*uBl7Q+FE1f-F(o`;+C\noDfTD3@;]Tu@:jUmEZfFG
DKBB2A7TanEbK<2A7]7bD..6'F(Jj"DIdf2Ao_g,+D>\9EcWcSD/!m//0K"F@ribE+DG_:+=Lo?
F(TH'A901\+Co#(Ao_R%F!*7]0esk+0ePI?A7]S!@8npkH#@&-Bk(Rf+EV=7AK]9_<$5mm+EM+(
Df0*,A7]S!@8pc_A7]S!@3Ej[<$5^_@qfdgC`n"7@<+COA7]S!@8pc_+>PW+1E\Ir0esk&/g)l/
2)ud61*A;+A8Pq!BPh9gGp$s<DKU&4F!,(8Df$V1Dfp(CD/!m1FCcS:Bl.EB+Co>$EbK;42BXk3
+=oPr1,'h,3Fm2CEbK<2A7]7bD..6'F(Jj"DIdf2Ao_g,+D>\9EcWcSD/!m//0K"F@ribE+DG_:
+=Lo?F(TH'F"'-mA92@'BPhf51E\D-+>GT'3A>&UAo_R%F(TH$@ruF'DII?(A79a+Ao_g,+D>V5
3Zp+/3&!6G2'>%)An5LoBPhf50f^@30d&/^D00-,De*:%AoD^,@<<W6De*:%+Eh=:@WNZ4ATN!1
FD"Q,C1Lps@:OCnDf0!"+Ceu#FEMV<ATJu+Ec5e;AT2QtBHTo&0JG1'9k@mYF!,F7/g*,03Zr'7
0PY,@C3=?)EarNo+>Gl62]sh/+>b]10kXH>H#7)(Ea`I"Bl@ltC`m5!DKL#ABk;?.Ao_g,+D#M1
@qZuW1,(C9+AHEYF`S[EB.b;d1HHXk<%rT7A0<Te2)cX40H`2)3&,)`Ao_F'BQ&$6F"AGNBl8'8
ATJu+Ec5e;A7]7bD..6'F(Jj"DIdfL+D>V(Eb'56A92@'BPhf51,'h+2]sq5/i#4rD0'<0A7Ta(
BQ&$6F"AGNBl7uC+EM+(F!,(8Df$V-ARfFk@;I'-ARci7+F,(l+?2890JGO1A7TanEbK<2+D>V5
Ao_EmF!*Cs0f(F=2/$iJAo_F'BQ&$6F"AGNBl7uC+EM+(F!,(8Df$V-ARfFk@;I'-ARci7+F,(l
+?2890JGO1A92@'BPhf5BPhg&Eb'562_m*D/i5G"@<Gq!De*:%DIIBnA0=H0<?Q@)@<-E3EbTT/
DJ(VDATW$.DJ()6De*:%Bjl-kFDl&2B4uC)@;TRd+A"k!+EMX5EcW@HBldutCh4`2Df09%BQRs+
FE00VBl8$(Ec>r5@<?''FD,]+AKZ/)Cis<1+>"^QAS$"*+E1s91,Wld@:XG$@<-F*Ddd0t+ED1;
ATMF)+EMX5EZen$FCB!(@psInDf/oo@<,^mDfTr5F(KG9E+*cqD.Rg#EcW@8DfQt4@<*K.DfTr5
+EV19F<GC<@psInDf0B0@psInDf/oo@<,^rDfp/8F(KG9E+*cqD.Rg#EcW@8DfQt4@<*K3Dfp/8
+EV19F<GC<@psInDf0B0@psInDf/oqDf'',ATT&6@<,dnATVL(F!,(5EZcQ>Df'&0+Dbt+@<?4%
DJX6$@<?4%DI7O&F`MVGATT&6@<,dnATVL(F!,(5EZe@uF`MUICi<flFD5Z2Ci<flFD5Z2?[64!
Ci=N=FDl&.F(KG9E+*cqD.Rg#EcW@8DfQsrCh+YX@;0gsAp%o4Ci<flFD5Z2D.R-nDdmNsEHPu;
GuQJ7ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"?/<?Q!n+Co%rEb/g'D.R-nDdmNsEHPu;
GuQM8ARTI!DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j"HRF),3)+DG^9A7]CoAS#q"ARTIp@Vfau
F_PrCC1K#8ARTI!DdmNsEHPu;Gp$[.Ch[j1Bk&8tDfQsmF_kc#DBNIuFCcRCGpskHAS6$pATM^"
@;^.#A2%k3@;[3/Bk1dqARTBtFD5T'+CT@77ri0PDKff)BHUo*EZe=(.!R0`8jjdMGq!TA@;^.#
A85X/D.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4C3=?,@;[2u@<itDGpskMDBNJ$
B6%QpF)>JsDKBN&H#7(GD.R-n+EM7-ATD?jC`mh6D.OhuF<F(oAS#b'Bk(g!AoD]4=\V:,Bl5&(
AS6$pATM`tG$f?0A79b$@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<la!
G%>$,Ch[s4F)-%DF(&ZhEbQXS?SEU@@WQ+$G%ki,+Dbb5F<GL6+EVO4@<j5A+DtV2BkLjrBl@l3
F*(i2F)Gl;BJ==BEc#6$BmO>5DImHhFD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7ANCrODKKPG+>#<+
2`E]P0eP4>1,1OB2K!JUBJ==BEc#6$BmO>5E,Tf3FD5o0+Co%rEb/f)F(o/rEb/Zq+EV=7ANCrO
E-,bI+>Gc52`NTJ/i#=?0etXFDKKPGDJsQ4@;KY(AKYMpB6%Qp+EM7-ATD?jC`mh6D.PaNDKKPG
+C?o^2)R662`EZS2f<b[@<?4%DI73uDJ*[*F_#&jA5I>]DKU&0FD5Z2+DG^9ARfOjE-,f(@;I'&
Df03%FEM,*+DG^9A7]CoAS#p*-o!_A0Hb(<FWbd>AT)U7.;j9M@<?4%DI7<kCh[m3BlnW-ARfOj
E-,f(?XuTEF$sSPDKU&0FD5Z2+DG^9DdmNsEHPu;Gp%$;+EV:.+D#&!BlJ0.@j#;nB6%R)F!)kc
3B/]8Bjl-,F(KB+ATK;>@<-F#?YNqk?Z':hARo.hFCB328O6?!DIIBnA0>r8@<*K,BleA=FDi:2
FCT,0BOtU_ATAo8@:F%aE+*d.AR]Rp@rlg4@<-F#F!,UIAiLoCF*8[<Bl%@%+EqOABHV54FD5Z2
@;I&Q:JDsK@<-.(Bldj,ATVs,F(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-F0Bldj,ATV9h
@;KFoBldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32EbTT+F(KH#BOPsqA79RkF`M;=Bldj,
ATT&-Ec6)>+EM%5BlJ/:BOPsq/0JDEBl%<&A79Rk/0JS>FD,f++E_^@Eb]-*Dfor.+DQ%8Bjkm%
A79a+DKTf*ATDj7DK9H4ATMF)0k5-=E-686F!,OHDBNt6F(HJ&DIal2ATT&:Bl.F&+>"^WARuus
Ec6)>+CoD#F_t]-FCB9*Df0Z8A79Rk@rH7.ATDl8.!0B<@<la/.3NeBCis<1+EVNEA79RkF*)>2
@<l3i@;KFk@;TRd+=MLa+EMX5EcW@DBle!+B.n=;FED57B-;;7A79b*De*:%DJs$'DK]T3F<G+&
FCfM9FDi:4@<iu5F_tT!EcWcS@rH7.ATDj'+=M>MA79Rk.=$2aH#7D1A9h`pEZf4;DKKP7Ao_<i
FD5Z2@;I&s@<iu;Bl.E(Eb031ATMF#FCB9*Df0l4FF&%B<%qm&De!H'@:X+qF*)81DKI"CATDX/
+D,P4+A+CC0JFVI5p/Qa6Qg)\+Co%rEb/g'                                       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`;d=+>P&o1E\G31,C%-2]sh40Jjn,3?U%82DZI20d&840fL403?U.51,U102BXb31bpa-1-$I:
1bgm21,0n,3B/`91,'h-1H%4%F_PZ&?ZKk%ATMF):-pQ_@WcC$A7'@kF(KE(F<GZW/KeMFBl%<&
-us$CATMF).3N&:A0>DsF*)G:@Wcd(/e&._67r]S:-pQU@rc-hFCeuD+>PW+1MpQ@0KBRL:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@r,RpF!,RAE,9H&?U6tD@WcC$A2uY1?TgFm-UC$a@WcC$A2uY1-QlV9@rGq!@<6!&
4=<E\6"4tNCh,Od3@>7C@rH(!F(KB6+=Cl<De(4)$4R>`@rcHM3ZoejBldj,ATT:/$4R>+0RHSl
78?6B6TmIQA8,Qs0H_JI$4R>;67sBpAfrL9D.Rr@+DGm>Anc:,F<G+.@ruF'DIIR2+E)-?E+*j%
+DG_'Cis9"+DGp,$>=!ZA7TCa4ZX]6-Y[F/GUG((4u%C[:dn,I8OFpO-Y[F/GT\@C$4R>+0RI_K
+?MV,BOtU_A8,O)-Y@LCF!,UIBl%i<+BosE+E(d5-RT?1%159QHZX+DCi<f+B4Z0-4$"a%ATW$=
F<G4-FDYP2B4Z0oH$!U?@:jUmEbo0*FE;PE+ED%%A0?):Blmo/F(fK9E+*g/+EM4)1,Us4@:jUm
EcZ>C+C\noDfTE1FE/L=DJs_AC2Rs6E,Tf>+EV=7ATMs%D/^Uu9gg?[F(96./12Pf/9><ADCd/B
BOPsqA79RkF`M:G%13OO:-pQUBl8!'Ec`sTAT2Ho@q?clF_PZ&+EV=7AKZ&9@;Ts+Df-\:Df^"C
E,ol,ATMp2EX`@>0RG0f@j#Z!FsfF6+AG-h;GUY.C2[Wi+D58-+=Bu];cI*O/9><AD@Hq:0RHM[
6W-]e@;9^k?Qa<1F<DtoC2Rs6E,Tf>+?M>$HQ[39Ft"OhI3<E;G!.l//8es@%13OO:-pQUF`:l"
FCcRq9gfEtG&:bQ3ZoV!-WWr0-S0=KEc)<n@WcC$A7Te!4ZX^-Bl.F&FCB$*+=ANG$7I9&9gg?[
F(96..6T^7-np!kD.G(H-p0474u%D-D.G(H4CWGICh.'uD%-h90RInYE,9H&+E2IF+=C2a6mjO,
@rcH0%13OOF)>i<FDuAE+=CW@Bl%<oDJ()8ATDj+Df-[L4s247+tb6D9gg?[F(96.%13OO:-pQU
B4Z0-BPDO0DfU+GA8bt#D.RU,%15is/g)QUBleB5A1T*8D.G"C4ZX][5snOG?X[\fA7$HiBle59
-tm=9FDYPO3Zoe@8Q/Sa;H[?S/9><ADCI+a?Ys=$%13OO:-pQUB4YslEaa'$+Dbt)A0>r'EbTK7
%17,c+Bos9Eap5/F(ZV-Bl%?.4ZX^&Ci^_?@rcGr$4R>;67sBnASu("@<?''@rH4'@;]dtDBLMR
@rH7,@;0V#+EqaEA9/l9F(Jl)FDi:DATMr9D..-r+D5_5F`7csEap4r+=D2>+Dl141*C1CCh5@L
4ZX^&Ci^_?@rcH<-WP8&Ci^s5$4R>;67sC'E+EC!AKYYpF(c!iB4t^pBK\C!+tdqHEc*EU?YEkh
BOkOnAT`$0-OgD2F(96./14e<@<6*m@<?('Ebm*P4ZX]6.!''11,Us4Eb/Zi+D,>(ALT]MF_PZ&
A9;Z;+=Jod0e%MnB4t^pBFP;40RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79RkF`M:G+:SYe$;No?
+E_X6@<?''A8-+,EbT!*FD5Z2+D,>(ATJ:f-o2u,+>>5eAnc'm%16f]/g*_T=%Q.0A8a(0$6UI4
D/XQ=E-67F-Z`^>ARlotDBOC#5sn:D83oU9;^W"]%144#A85O_CNF#L/g+nJ@<?0*-[nZR6VC?K
5sn:D0..29+<Y`8E]l#tA85O_CNF#;F(96./13&aC3(a3$6UHd67sB/FDj]G;cFl[ART*lGpsk[
EbTW,+EM%5%13OO+<XEG/g,7SA8`T$De!p,ASuT!$6UI%C11UfF(?D+ATVd"+=C,a6r./^@:O(o
87?"DF'icp-OgD*+:SZ#+AP6U+Cf>/Gp$O:F)PQ&@<?'k+D,>(ATJ:f+<W%"DIIBn+@L-WC*u.s
+=MRh+=nX^3[l1*HUL[r<(LA';cI+28l%in@VQ>Z+<YB1/g*Q"@;TQu/NP"%Ap&3:-Qlr</e&.1
+<Ve%67sBsDe!3l+=LiEFE8lRA8bt#D.RU,+Co2,ARfh#Ed8*$+<VdLA8bsg4Y@j$/g)N0:IAJ:
/4=DcC+L`>-OgD*+<VdTEb/Zi+CoD#A1T*KBldj,ATTPDA7d2<+Eqj?FCcS*C11UfF(?gLEbTT+
F(KGGE+EQ.%144#ASu$2%144#C34<3A3DOfC2dU'BHS[OFCf<.>UKsf+<W(QART*lC34<3A1T*K
Bldj,ATV9sDffQ"Df9DDBlJ?8@OETIGB.D>AKYMu@:O(oA1T*KBldj,ATV9sDffQ"Df9DDBlJ?8
@ODTl+<W(QART*lC34<3A1T*KBldj,ATV9sDffQ"Df9DDE+EQ..3NhTBlmo/A85O_CNF#;-ZWpB
ATMF)?Z'e(AR]RrCG'R:Ag\#p%144#A9;C(FC[Ne+DPk(FD)dEIS)mn92eAI6VC?2FCfN8A79Rg
0..29+<Y3:ATMs(+D58-FEhmM-Y["3?Z':hARo.hFCB32?SX;j11,-JF=.M)+<Y3:ATMs(+D58-
FEhmM-Ve)nBkLjrBl@lr;flGgF'j$6F=.M)+<Y3:ATMs(+D58-D.Fb:6?6dQBQRT[FCB32?VP*P
Bk1pdDI5\GD..<j@p^uID..H?2d^E4-OgD*+CoS*F*(q8B4Z0oH$!U?-XpLnH#.D:BjkmdDJsQ4
@;K:lFCB32?Xn/#-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+EMC<F`_SFF<GX7E]l#t-Vd6-:c]_?
@<Q3)Bl5&B8jPg;;b02A92d2I$6UHd67sC%@ra^b+DPk(FD)dEIP5>JF>%B;@r$.!@:O(o0./;l
@rcH<-SB+JF!hD(+<XEG/g)QaDb*Z&<$5deCh5%<GB.D>AKZ&(EX`@eCia0%AhIV4/e&.1+>G!C
+EM47GApu3F!)i@BleB:Bju4,ARlp%DBN"P:+oUB8Q[*RDJXSG+ED%8F`M@P%16ZaA1e;u%16f]
/g+b;G\M5@+EM%5+CoCC+:SZ#+>G!C+=M8A@:UL+.3NhTBlmo/F(fK9E+*g/+EM%5%16Z_F(Hs5
$6UHG+Bot0BQ&*6@<6K4-Z*R=F(oN)+Co2-FE2))F`_>9DBO"1EbTK7+>#c)4*+nP%16ZaA1e;u
.1HUn$=e!aF`MM6DKI"CD/a<0@p_Mf6"4tNCh,Od3F<4&4tq>%A0?:Q+AYg&:..Z@+BosE+E(d5
-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eGF_PZ&3B9*,Et&IcF_PZ&
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
$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#D.R:$F'j!*Deio3EbTT+F(KH#DII^0FCB32?Y*_i
?ZU(&CLp7-/h1mUF(KE(FC/ooG&qb6EcYT!@s)."D/X3$+<YbX/KePAD/`p(ATJtBEbTT+F(KGB
+<Y0&Ch%N/+EVN2$;No?+E2.*DImouEbTZ5+E2@>B6%EtF"Rn/:-pQB$;No?+B3#gF!)TIATMr9
+Cf>,E+*cuF!)SREbTT+F(KGB+<YcH@;^.#F<D]JBl.F&+<YcE+<VeIATN!1FE7lu:-pQU@rH4'
F`_2*+C]U=FD,5.E,8s#ATV@$Bm"88E,ol0Ea`g++=KZeEcbt;6Y1.WATD?m+B<;nG%G]8AISuA
67sBW6RaVs$;No?%15is/g,4HANCrIFEDI_0/%NnG:mcOG$ut2F*)G@/n8g:0+A7`67r]S:-pQU
:/=hX3ZoPeEa`j,BlkJ>Bl.F&+<Y*5AKYi.Eb-A%@q0Y%@<?''+D,P4+<Y0:EcP`/F<GO6EbTH&
Et&IO67sC&BOPd$E+*g0+<W'e3AWNA+E)9C+D,b<F`M%9+=K!!1c$R'E+O'(De*oA+B3#cF(HI:
E,ol0Ea`g+%15is/g,1GEHPu9AKW*<F`:l"FD5W*+<Ve<G%G]>+<Ve=ATo7>+Co%n@:Wqj+<YcE
+<VeIAS,XoAKW*<FD,4p$;No?+CT5.Ec62:D..O#Df0VK%15is/e&._67sBjEb/[$ARmhE1,(I>
D..H@0b"Ib67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB91LY6C0JXbfBl8'8AKYMtAnGUpASu!hF!,"-F*)G:@Wcd,Df-\+
A7T7^%15is/g)o*@;p6B1E^+:C3=T>+D,P4+EM[C061cJAKZ&*F<E.X6pX^D<)QX;4WlF$AoD]4
FCfN8Bl7Pm$4R=O$>aWhA0<7?Bldj,ATT:/$>aWhA0<7?Bldj,ATUpoBl%i<%13OOE,Tc=@q]:k
F!*.G$4R>;67sC&ATMr9F`_>6Et&IuD/!m/4ZX^4HRg`n0d'aE2D?7.+=\Qi+<YrXI16NP6WHZt
9keKd4ZX^4HQk'b-T`\&@V'.iEb0<6E[!4\-[[9g@:jUmEbo0*FE;PE+u(3G+>P'f/g+F]/mg@V
FDPP3-mqGN<@q0j/P'nVBl6![+CSl(ATDj6EZfWV+>#2g6W/>\%13OO:-pQUF)>i<FDuAE+=D&F
Ecbu+Ec*"5ASl.&E+ig'AKYr#F*&Nf4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4XU[G:2!I4F*'Q+
+Dbt+@<?4%DI7[#Ci"$6F*)><AUYaV3AWN82]t!f$;P82@<6NgATL!q+AQTH@<6N5DII]qFDk\u
Gp"dM$;No?+EMC<F`_SFF<G14FC0-.A79a+:2!I4F*(;kEt&Hc$4R>;67sC(@;L'tF!,R9A8,t)
F)6+EDdmfsBl7Km+C]U=@r,jhCM@[!+E)-?Df0,/F*(i2+CSl(ATA4e:-pQU@;^"*BOu3,Bl5&8
BOr;_6Qefb<?N\Y@<-I'+@B^XFCfK(A0=liBm+'.F(HdCE,ol0Ea`eo$;P8'6WHrkF*'Q++>=p!
+>=63.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@GufCi"$6F*)><AKWQI
:MaPa7U^"QBP)C'+A?]`@<?4%DBL'L%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BY_&B.Zek
D'0rDHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL0ea_9@W-F$/P'f#H@-//HlsOS+<VdL+<VdL
+<VdL+>Pc/2`WiX/iPX18p+ra@;[21+<Z%@$@Es=+<VdL+<Vdd/hf:>3&30B2`*9H2`*BJ+O63N
+<VdL+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL?SO8h/iYUF3AM^NDf03%FEM,*+FFV*HlsOS+<VdL
+<VdL+<VdL+<Vd`1bLUC0Jtd39OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL0f_$I
+B`8aEZcJI+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2]th5DKKP7+<VdLHjpF1+<VdL
+<VdL+<VdL+<VdL+<VdL+<WQp1,U1B@<jJ9A0<!;+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL
+<WQb<E)>3+<VdL+<Z%@$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;
/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i5:18!N+<VdL
+<VdL+<Z&"ATMQuDIIX$Df0r%E\0RnF=fmlB7*[!/M].789.F=DL<Qq6WG^;E\0h&9keK,%14U;
/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i5;IOWTChR6i
F_)[<+<Z&&;BRkT2)ZR"+<Z%S2)m3B+<VdL+FG:S0H_Jn+<VdL+FG:c+>Fu]+?L#>HqRmjF!*bk
F*)G2Ch[s<85^Qg3&`i?+<VeS+>GT'0H_J\+<Z%S+>=oq0H_J\+<Z%S0H`5,+<W`T$@GlcB42o*
+<VdL+<VdLHq7-X2_Zp?+<VdLHltC*/i=ao+<VeS+<WB]+>k8a+<VeS+>Fup+<Vdg%17JXF`(u/
+<VdL+<VdL+FH^X+?)#10d%S]+FG:d3A*!.+<VdLHlsOd+>PYo+<VdLHlt-d1,0mo3t2OE6#:XO
BlY==+<VdL+<Z&&;BRnU2)cX#+<Z%S2)Hp>+<VdL+FG:S1*A;1+<VdL+FG:e+>Get+?L#>HphO`
ARZc)+<VdL+<VeS85^Qh3ANE6+<VeS+?2A62'="a+<Z%S+>Y,_3?TFe+<Z%S1E\V!+<W`T$@G9[
BkAJ1+<VdL+<VdLHq7-X3&<6J+<VdLHlt:(/heCj+<VeS+<WK`0ea^m+<VeS+>b2q0H_K"%17JP
Df&p!BOQ%*+<VdL+FH^X+?2;83$9=d+FG:d2(ga/+<VdLHlsOh+>P_q+<VdLHlt9h1,C$q3t2OE
9jr'X@:C?%+<VdL+<Z&&;BRqX3&)Nu+<Z%S2D?a@+<VdL+FG:S2'=\0+<VdL+FG:h+>Y_p+?L#>
HpMRfBOu3mFF#&P+<VeS85^Qb2'="a+<VeS+?),02'="a+<Z%S+>t>u1a!n`+<Z%S2BXe7+<W`T
$@G6UE+icj+<VdL+<VdLHq7-X0fV-8+<VdLHlt1'/heCj+<VeS+<WTc+?:Pe+<VeS+?(Dt1E[f%
%17JR@;TFh+<VdL+<VdL+FH^X+>tr5+<VdL+FG:i3%d'2+<VdLHlsOk+>Ybq+<VdLHltBk1H$?u
3t2OE9kA3X@<*J5+<VdL+<Z&&;BRtS0d%S]+<Z%S1c[0G+<VdL+FG:S3?U(9+<VdL+FG:l+>Y_p
+?L#>HpMRZAR](g@;[21+<VeS85^Qb1c737+<VeS+>tu-0H_J\+<Z%S0ejdn0d%S]+<Z%S0eje-
+<W`T$@G`cB4Ym%+<VdL+<VdLHq7-X0fLgC+<VdLHlt4(/i=ao+<VeS+>GSn1b^$p+<VeS+>GSn
1c$79%17JM@;odoCgeG/+<VdL+FH^X+>Gf/3$9=d+FG:k3%d'2+<VdLHlt-u+>bbp+<VdLHlt-u
+>bqu3t2OE6=jtL@<?O(GT\+O+<Z&&;BR\Q3A;Qu+<Z%S2)6d<+<VdL+FG:d0d&>-+<VdL+FG:d
0d&>0+?L#>Hpqjh@<?0*+<VdL+<VeS85^Qb2`WT8+<VeS+?),00H_J\+<Z%S0eje.0H_J\+<Z%S
0eje.1a"k&-p_Ze@<?0*Bl5%^6WGQE$@G-UDJ<oqD'0rD+<VdLHq7-X0f^pD+<VdLHlt7&/i=ao
+<VeS+>GVo+>Fu]+<VeS+>GVo1a!o&%17JLATVL"B4Z4,AKW*<+FH^X+>PW/0d%S]+FG:h1G1@(
+<VdLHlt.!+>PVn+<VdLHlt.!+>P_q3t2OE;e^8dF`SZJ+<VdL+<Z&&;BR_O3ADX!+<Z%S1-$s@
+<VdL+FG:d1E\D++<VdL+FG:d1E\D.+?L#>HpM:V@<,d!+<VdL+<VeS85^Qc2DI06+<VeS+>Gc,
2'="a+<Z%S0f'q-1a!n`+<Z%S0f'q-2]t1)-p_BPEa^))DBMA8<@J@aHr+j%@sN!1+<VdL+<VeS
85^Qc3A`N7+<VeS+>kl+0H_J\+<Z%S0f1!q1a!n`+<Z%S0f1"3+<W`T$@GZgCi"6=+<VdL+<VdL
Hq7-X1-%?K+<VdLHlt@(/i=ao+<VeS+>G\q+?:Pe+<VeS+>G\q0f'q6%17JKCiF&rEb$:8+<VdL
+FH^X+>Yr53$9=d+FG:f2_Hd,+<VdLHlt.$+>kns+<VdLHlt.$+>l#!3t2OE;IsK`CiseA+<VdL
+<Z&&;BRbU3&2U!+<Z%S2)m3B+<VdL+FG:d2BXe2+<VdL+FG:d2BXe6+?L#>HphO`AR]Ro@3?[8
+<VeS85^Qe2)@'3+<VeS+>to+2'="a+<Z%S0fU:11E[e_+<Z%S0fU:12BY'j$@G?XAStpi+<VdL
+<VdLHq7-X1c@6I+<VdLHlt1(/i=ao+<VeS+>Ghu1b^$p+<VeS+>Ghu1c$79%17J]E+rfj+<VdL
+<VdL+FH^X+>ki12BX+b+FG:f1bLX.+<VdLHlt.(+>c)$+<VdLHlt.(+>kns3t2OE6#pIWF`MVG
+<VdL+<Z&&;BRhQ1b^$p+<Z%S2Dm*@+<VdL+FG:e0H`/3+<VdL+FG:e0H`2-+?L#>Hs1Z%ASu'q
B4Yt'@VHs485^Qf2)?s0+<VeS+>Y](0H_J\+<Z%S1,0n+1a!n`+<Z%S1,0n+3$:9l$@G-UE+ifm
@ppK&+<VdLHq7-X2)dNO+<VdLHlt@'/i=ao+<VeS+>PYo2)l^$+<VeS+>P\p0JO\3%17JKDKK<-
ATJt:+<VdL+FH^X+>tr11a!n`+FG:d3A*!.+<VdLHlt1"+>kns+<VdLHlt1"+>l&"3t2OE;dj-L
CEO`B+<VdL+<Z&&;BRkR2`Mp&+<Z%S1GCF8+<VdL+FG:e1E\J0+<VdL+FG:e1E\J4+?L#>.1HUn
$:R<^:gnEe89.F=DK@s%+@SXt89.F=DK?pqBLP9g:gnEe%13OO:-pQUA8-*pEb02uDI[r7D/!m1
FCfM9/Kd/:+>k9YBl7u$$>sBq@rPjtF?MZ-.!0<?DK?ph6WHrkF*'rn9keKd.3L2bFDY`0F!*Xh
1E_#g0d&Y6HVS6N@<6NgATJ:f2'>(D+?hD2+FJ';F(9/tF*%iu:-pQUF)>i<FDuAE+=BTF<?Q<r
F(KE(F<GO2F*&OABl8'8AKYMtAnGUpASu!hF!hD(:-pQUF)>i<FDuAE+CoP8@<<W0A927"@<6N"
$4R>;67sC%D/XQ=E-67F-Z3jCFD,6+DBNV(D/"'1BOu3q+CfP7Eb0-1+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk-OgDXBL?o_E]lH+Ci<flFD5Z2?[64!Ci=N=FDl&.INUC"1,C%/+>Pkb$;P8%F`MM#
ATL!q+AQT;F`MLFDII]qFDk\uGp"dM$;No?+EMC<F`_SFF<G14FC0-.A79a+:2!";EcP&hEt&Hc
$;P8'6WHKrEcO<(+>=p!+>=63.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^
$@GufCi"$6F*)><AKWQI:MaPa7U^"QBP)C'+A?]`@<?4%DBL'L%17J*+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL2BY_&B.ZekD'0rDHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL0ea_9@W-F$/P'f#
H@-//HlsOS+<VdL+<VdL+<VdL+>Pc30JG::/iPX18p+ra@;[21+<Z%@$@Es=+<VdL+<Vdc1G1L<
2`*6F2)dKL1,M!L+O63N+<VdL+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL?SO8h/iYUF3AM^NDf03%
FEM,*+FFV*HlsOS+<VdL+<VdL+<VdL+<Vd`1bLUC0Jtd39OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL
+<VdL+<VdL+<VdL1,(I>+B`8aEZcJI+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL1E]D1
DKKP7+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+>Pl.1,U1B@<jJ9A0<!;+FFV*HlsOS+<VdL
+<VdL+<VdL+<VdL+<VdL+<WQb<E)>3+<VdL+<Z%@$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P)%14U;/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+
/M/P+.h)i5:18!N+<VdL+<VdL+<Z&"ATMQuDIIX$Df0r%E\0RnF=fmlB7*[!/M].789.F=DL<Qq
6WG^;E\0h&9keK,%14U;/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+
/M/P+.h)i56tL7I@W-'k+<VdL+<Z&&;BReR1Gg3s+<Z%S2D?a;+<VdL+FG:S0H`52+<VdL+FG:c
+>l#<%17JQBk;0jBHSE?+<VdL+FH^X+>bu71*@\^+FG:e3%cm-+<VdLHlsOd+>P\p+<VdLHlt-d
1,1j"$@GckBk(Qo+<VdL+<VdLHq7-X2)$mG+<VdLHlt4%/i=ao+<VeS+<WE^1GU'q+<VeS+>P&q
0KT^NHpMd_FEMVHF!)SJ+<VeS85^Qf1Ggd.+<VeS+>u&/2'="a+<Z%S+>Y,q1*@\^+<Z%S1E\G-
3t2OE>'4:cDImWsASuX"Bcqdo;BRhS1GL!p+<Z%S1-$sE+<VdL+FG:S1E\P6+<VdL+FG:f+>l&=
%17JKCiF'!@q/pi+<VdL+FH^X+>l)<1E[e_+FG:j1+k7'+<VdLHlsOg+>beq+<VdLHlt6g1b_!#
$@G-WFCB3$F!)SJ+<VdLHq7-X2DI!E+<VdLHlt.(/heCj+<VeS+<WNa1H$?u+<VeS+>k8t1cl-R
HrFH_Bknh6+<VdL+<VeS85^Qg1H.99+<VeS+>Y](0H_J\+<Z%S+>t>s2BX+b+<Z%S2BX_33t2OE
;IOWTChR6iF_)[<+<Z&&;BRkT2)ZR"+<Z%S2)m3B+<VdL+FG:S2BXh2+<VdL+FG:i+>Z#>%17JU
@<HW66$76jEa`cuF*pMV+>u2<3?TFe+FG:d0eP.&+<VdLHlsOj+>Y\o+<VdLHlt?j1-%E*$@Glc
B42o*+<VdL+<VdLHq7-X2_Zp?+<VdLHltC*/i=ao+<VeS+<WTc1bp0r+<VeS+?(E"0fogOHqng%
CM=n6+<VdL+<VeS85^Qh0etI++<VeS+>Gl/2'="a+<Z%S+?1Jd0d%S]+<Z%S3$9n:%17JKCij*"
EZcJI+<VdL+FH^X+?)/82]s4c+FG:h1bLX.+<VdLHlsOk+>l&"+<VdLHltBk2)RH)$@G6QDIm9"
+<VdL+<VdLHq7-X2`WWM+<VdLHltC//heCj+<VeS+<WZe1c?I!+<VeS+?:Q$2*26SHpqpeAfr3=
+<VdL+<VeS85^Qi1GCd2+<VeS+>l#/2'="a+<Z%S0ea_,3?TFe+<Z%S0ea_,3'.QVHq&$k@;KUc
F`\`K+<VeS85^Qi2_m?8+<VeS+>Gc,0H_J\+<Z%S0esjo1E[e_+<Z%S0esk+3t2OE9jr'X@:C?%
+<VdL+<Z&&;BRqX3&)Nu+<Z%S2DHg<+<VdL+FG:d1*A;*+<VdL+FG:d1*AP<%17JKCiF'!Eaa'9
+<VdL+FH^X+>G_r+<VdL+FG:j2(gR*+<VdLHlt."+>GYp+<VdLHlt."+>GW5%17JNBlI`r@3?[8
+<VdL+FH^X+>Gi8+<VdL+FG:e2_Hs1+<VdLHlt."+>c&#+<VdLHlt."+>c#=%17JR@;TFh+<VdL
+<VdL+FH^X+>tr5+<VdL+FG:i3A*!.+<VdLHlt.$+>GVo+<VdLHlt.$+>GQ3%17JWASu9lEZcJI
+<VdL+FH^X+?;/2+<VdL+FG:g3A*03+<VdLHlt.%+<WQb+<VdLHlt.%+>l4i$@G-UA7]4YEa`i.
+<VdLHq7-X0f1aH+<VdLHlt=&/heCj+<VeS+>Get1b^$p+<VeS+>Get1H@N+$@G`cB4Ym%+<VdL
+<VdLHq7-X0fLgC+<VdLHlt4(/i=ao+<VeS+>Ghu0fU9u+<VeS+>Ghu0fM0'$@G3LE+Nj%@3?[8
+<VdLHq7-X0fLdG+<VdLHltC./i=ao+<VeS+>Ghu1,0mo+<VeS+>Ghu0f_<)$@G0OCi!O%EbTb@
+<VdLHq7-X0fM*H+<VdLHlt:%/heCj+<VeS+>Ghu1-$I"+<VeS+>Ghu1,q?)$@G9YDIIX#+<VdL
+<VdLHq7-X0fM*I+<VdLHlt@)/heCj+<VeS+>Ghu1GBpo+<VeS+>Ghu1-%E*$@G-UDJ<oqD'0rD
+<VdLHq7-X0f^pD+<VdLHlt7&/i=ao+<VeS+>Ghu1b^$p+<VeS+>Ghu1H@N+$@G0OFCf9$AT`'*
+<VdLHq7-X1,(U@+<VdLHlt:&/heCj+<VeS+>Ghu2)ud%+<VeS+>Ghu2)mZ,$@GcdEbTZ;+<VdL
+<VdLHq7-X1,M!G+<VdLHlt1)/heCj+<VeS+>Gl!1cZ[$+<VeS+>Gl!1cRQ+$@G-MBOPpi+<VdL
+<VdLHq7-X1,^jH+<VdLHlt.%/i=ao+<VeS+>PVn+>P&^+<VeS+>PVn0fogOHr+j%@sN!1+<VdL
+<VeS85^Qc3A`N7+<VeS+>ki*2'="a+<Z%S1,'h-1E[e_+<Z%S1,'h-1-5pPHr+`tCistF+<VdL
+<VeS85^Qc3B8c9+<VeS+?))/2'="a+<Z%S1,'h-3?TFe+<Z%S1,'h-3'.QVHpMRfBOPpl+<VdL
+<VeS85^Qd2`*K:+<VeS+>Yr/0H_J\+<Z%S1,9t.0d%S]+<Z%S1,9t.0KT^NHr=NgF_l2A+<VdL
+<VeS85^Qd3B/c:+<VeS+>l)12'="a+<Z%S1,C%-0d%S]+<Z%S1,C%-0KT^N.1HUn$:R<^6ZmEi
89.F=DK@s%+<X*?<Ch.)Bl7u7:2!'`<C:nLEX`@nA926jF`KW++=M>KBl7u7771'BF`MLnE_U7c
F"&4`+EVI7DK?pa+>Y-e+u(3(0RHQ.6ZmEi;IsnY$4R>;67sBkBldd)AT2'q@sK26Bl8'8ATJtG
+?V\-1*CFJDK?6o1*AbA+?hD2+FJ';F(8^&EX`@N67sC%D/XQ=E-67F-UgC&+ED1;ATMF)+CfP7
Eb0-1+Dkh1F`_1;A8,XfATD@"@qB^/%15is/g,4PDfp/@F`\a:F*(i4+Dt_2@q0Y%%13OO:-pQU
F)>i<FDuAE+=D&FEcbu+Ec*"5ASl.&E+ig'AKYT-FEMV8+<Wg14Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4XU[G:2!+>F?MZ-Ci<flFD5Z2?[64!Ci=N=FDl&.INUC"1c$75+>OB5:2!+>FAc[k4ZX]\BL[,d
+DtV2?Z^3s@<itL%15is/g,4PDfp/@F`\a<D00-,De*:%+AQT>F`^MmEt&Hc$;P8'6WHTuF?MZ-
0H`D!0F\@>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hs(#sCi=N=FDl&.
+>"^3Ch+YX@;0gsAp%o49Q+ELFD5Z2+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdb+AH9W
/PKkq+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd]0H`YjDg#\D88iNpHjpF1+<VdL+<VdL
+<VdL+<VdL1,LmJ1c$m>2`2^MF_kc#DBL&E+FFV*HlsOS+<VdL+<WX&/i>IA3&`WQ1,q!D2)$s3
cBM9N+<VdL+<VeS%17J*+<VdL+<VdL+<VdL+<Ve60ek@73&3EQ1*B8/DJ*[*F_#&+HjpF1+<VdL
+<VdL+<VdL+<VdL+<WKt/i5I?2)cXO@<?4*F_#&++FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<Vd^
0JkR.=_2#^+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdc+AHclFD)d>+<VeS%17J*
+<VdL+<VdL+<VdL+<VdL+<VdL+>PQ)2'>:qGqNW<+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+>t?B<'tsS+<VdL+FFV*.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^
$7d\[/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JX@;TQu
+<VdL+<VdL+FHRgF(o9)@<?4%DL>E(/O=2p/OX/_HrP,<1,LRRE_U7cHltjF<@q0j/P'nVBl6!A
$7d\[/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17J\@<5jn
BOPOrAKW*<+FH^X+>u)72BX+b+FG:h3%cm-+<VdLHlsOc+>Gl!+<VdLHlt*c0f1s$$@GKTF`SZk
F`VYF@;KY!Hq7-X2E3WU+<VdLHlt-u/heCj+<VeS+<WB]+?:Pe+<VeS+>Fup3t2OE<b5oP+<VdL
+<VdL+<Z&&;BRnP0JO[m+<Z%S3&E6F+<VdL+FG:S0d&5++<VdL+FG:d+>G`8%17JXF`(u/+<VdL
+<VdL+FH^X+?)#10d%S]+FG:d3A*03+<VdLHlsOd+>bbp+<VdLHlt-d1Gh0&$@G-UFCAm(+<VdL
+<VdLHq7-X2`3HO+<VdLHlt:'/i=ao+<VeS+<WE^1Gp9t+<VeS+>P&p3BIZWHphO`ARZc)+<VdL
+<VeS85^Qh3ANE6+<VeS+?2A60H_J\+<Z%S+>Y,q2'="a+<Z%S1E\G,3t2OE7;cgO+<VdL+<VdL
+<Z&&;BRqT0K:0t+<Z%S2)R!D+<VdL+FG:S1a"P5+<VdL+FG:g+>P]6%17JPDf&p!BOQ%*+<VdL
+FH^X+?2;83$9=d+FG:d2D-[++<VdLHlsOh+>bhr+<VdLHlt9h1Gq6'$@GQVEbf)m+<VdL+<VdL
Hq7-X3&`fO+<VdLHlt=%/heCj+<VeS+<WNa1cZ[$+<VeS+>k8u1-5pPHpMRfBOu3mFF#&P+<VeS
85^Qb2'="a+<VeS+?)/10H_J\+<Z%S+>t?"1*@\^+<Z%S2BXk23t2OE6tpURA76T'+<VdL+<Z&&
;BR\R3$9=d+<Z%S1,pm?+<VdL+FG:S2]sk7+<VdL+FG:j+>Pf9%17JR@;TFh+<VdL+<VdL+FH^X
+>tr5+<VdL+FG:i3A*!.+<VdLHlsOk+>kkr+<VdLHltBk1cRQ+$@GQZDJN[$+<VdL+<VdLHq7-X
3AE62+<VdLHlt:#/heCj+<VeS+<WZe1c?I!+<VeS+?:Q$1HQ$QHpMRZAR](g@;[21+<VeS85^Qb
1c737+<VeS+>tu-0H_J\+<Z%S0eje*3?TFe+<Z%S0eje*2`hHUHr=ZkAS`J3+<VdL+<VeS85^Qb
2_d*2+<VeS+>Yr/2'="a+<Z%S0eje.2]s4c+<Z%S0eje.2*26SHp_=]ASc0k+<VdL+<VeS85^Qb
2_[36+<VeS+?2>52'="a+<Z%S0esjo0d%S]+<Z%S0eje.2`hHUHpVC\CghF+Bm:aC+<VeS85^Qb
2`WQ7+<VeS+>ko,0H_J\+<Z%S0esjo3$9=d+<Z%S0esk03t2OE7;QjMFD)d>+<VdL+<Z&&;BR\Q
3ADX!+<Z%S2`*-@+<VdL+FG:d1*A;*+<VdL+FG:d1*AM;%17JKCi3s'@;R,0+<VdL+FH^X+>Gl1
1E[e_+FG:g1bLX.+<VdLHlt.!+>Gl!+<VdLHlt.!+>Gf:%17JLATVL"B4Z4,AKW*<+FH^X+>PW/
0d%S]+FG:h1G1@(+<VdLHlt.!+>Yu"+<VdLHlt.!+>Yo;%17J]Bl[p1F!)SJ+<VdL+FH^X+>Pc6
0d%S]+FG:e3A*!.+<VdLHlt."+>Pku+<VdLHlt."+>Pi:%17JKA8#Cl@3?[8+<VdL+FH^X+>Pi0
3$9=d+FG:d2D-j0+<VdLHlt."+>beq+<VdLHlt."+>Z#>%17JZEc5H5Df-[?+<VdL+FH^X+>Pr6
1E[e_+FG:h0J54*+<VdLHlt.#+>P\p+<VdLHlt.#+>PW4%17JZDes64GT\+O+<VdL+FH^X+>Pr;
0H_J\+FG:j1G1O-+<VdLHlt.#+>Po!+<VdLHlt.#+>Pi:%17JKCiF&rEb$:8+<VdL+FH^X+>Yr5
3$9=d+FG:f2D-j0+<VdLHlt.%+>GPm+<VdLHlt.%+?2Fl$@G`_B6A$5F!)SJ+<VdLHq7-X1H@EM
+<VdLHlt:*/i=ao+<VeS+>Gbs2)-3r+<VeS+>Gbs1cRQ+$@G6QDIm9qCgeG/+<VdLHq7-X1c7'G
+<VdLHlt=$/heCj+<VeS+>Ghu1GL!p+<VeS+>Ghu1-%E*$@G?XAStpi+<VdL+<VdLHq7-X1c@6I
+<VdLHlt1(/heCj+<VeS+>Ghu2)l^$+<VeS+>Ghu2)RH)$@GckBk(Qo+<VdL+<VdLHq7-X2)$mG
+<VdLHlt4%/heCj+<VeS+>PVn+?(Dc+<VeS+>PVn1cl-RHpMd_FEMVHF!)SJ+<VeS85^Qf1Ggd.
+<VeS+>u&/2'="a+<Z%S1,'h.2]s4c+<Z%S1,'h.2*26SHs1Z%ASu'qB4Yt'@VHs485^Qf2)?s0
+<VeS+>Pr02'="a+<Z%S1,0n-1*@\^+<Z%S1,0n-0KT^NHpMRfBOt[`@3?[8+<VeS85^Qf2`WZ:
+<VeS+?)&.0H_J\+<Z%S1,9t,2'="a+<Z%S1,9t,1cl-RHpMXl@<,q#+<VdL+<VeS85^Qg0f(X/
+<VeS+>Gl/0H_J\+<Z%S1,C%-0d%S]+<Z%S1,C%43t2OE;dj-LCEO`B+<VdL+<Z&&;BRkR2`Mp&
+<Z%S1GCF8+<VdL+FG:e1E\P1+<VdL+FG:e1E\M73t2NG%13OO771'EF`^/p9keKd4ZX]S6WHZt
9keKd+AQT=6WHTuF:ARpA926mF`]c-+=M>KBl7u7771'EF`^/p9keKd.3L2bFDY`0F!*Xh1E_#g
0d&Y6HVS6DF`^MmEt&IO67sBkBldd)AT2'q@sK26Bl8'8ATJtG+?V\-2]usODK?6o2]t:F+?hD2
+FJ';F(8g)F:ARP67sC%D/XQ=E-67F-UgC&+ED1;ATMF)+D,b<F`M%9D/!m1FCcS*BkCsgEb0,u
ATK4.$;No?+EMC<F`_SFF<G+8FCB86DIdfuAp&2)$4R>;67sC%D/XQ=E-67F-UgC&+ED1;ATMF)
+AP^1<(J-&E_U7c+D,Y*EA)BT@<?Q54Ztqk4Ztqk4Ztqk4Ztqk-OgDX67sBkF(9'$DEU$'Hu<J9
@q0Y%/8f!>@qKk*/8f!>@rPjtF:ARP67sC%D/XQ=E-67F5&Y%RAT8i'F(9'$D@HqJ67sC%D/XQ=
E-67FA92j$F<G+8@r5pt%13OO:-pQUF)>i<FDuAE+=D5KF`_;.Ec*"5ASl.&E+ig'AKYr#F*&Nf
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4XU[G;eT!9F*'Q++Dbt+@<?4%DI7O&F`MVR+>Gl42'=h#
2@U!lBM`,YFAc[k4ZX]aBM`,YF<GI0G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp$%!
:gnEe;IsnY$4R>@BLP9g:gnEe4ZX]>+?CW!%14U;/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/I^$@GiiF`MUI/Kf+V@<*K0@<-I8+Co2(ATAneDe!3tBl@l3+FFV*HlsOS+<VdL+<VdL
+<VdL+<VdL+<VdL2BY_&B.ZekD'0rDHjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vda+@0ITG%E6r
DfU/O%17J*+<VdL+<WEr1,h3Q3A*$?1bgmH2E!K:8p+ra@;[21+<Z%@$@Es=+<VdL+?1u-3A<EJ
0JPLC1,LpH2)?B#PZ/bJ+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL+>GZ,/hf"?1bg+HDf03%FEM,*
+FFV*HlsOS+<VdL+<VdL+<VdL?SXJk1GgmA0d'.uFD5i>A7Zl+HjpF1+<VdL+<VdL+<VdL+<VdL
+<VdL0f_$I+B`8aEZcJI+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<WTc9lFokBHSE?+<Z%@
$@Es=+<VdL+>kc00JkLB2E!HO2E!HO2E)aH@<jJ9A0<!;+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL
+C@,]2'>mu6[Bjt+<VdLHjpE5/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;
/M/P+/M/P+/M/P+/M/J)/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;Hqn*eAKW*<
+<VdL+<VdLHphOeBkM<lFD5Z2HrP,<6#:Wp6tL"Y<,sQG1bD7=9keKm+@SXt/Q?aB89.F=DEA:7
.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JU@<HW6
6$76jEa`cuF!,j$;BRkW2`W!'+<Z%S3&*$>+<VdL+FG:S0H`)-+<VdL+FG:c+>Gl<%17J`AS5Eo
+<VdL+<VdL+<Z&&;BRnP0JO[m+<Z%S1,^a=+<VdL+FG:S0H`/*+<VdL+FG:c+>Yc7%17JXF`(u/
+<VdL+<VdL+<Z&&;BRnQ1,0mo+<Z%S3&rTF+<VdL+FG:S0H`21+<VdL+FG:c+>ki7%17JKCij*"
EZcJI+<VdL+<Z&&;BRnU2)cX#+<Z%S2)['@+<VdL+FG:S0d&;/+<VdL+FG:d+>bu<%17JZART(e
@r!20+<VdL+<Z&&;BRnW3A;Qu+<Z%S2)m3G+<VdL+FG:S1*A;/+<VdL+FG:e+>PZ5%17JNASu'g
+<VdL+<VdL+<Z&&;BRnY1,L*r+<Z%S0f^jD+<VdL+FG:S1*AA0+<VdL+FG:e+>Yo;%17JODJ<]*
+<VdL+<VdL+<Z&&;BRqT0K:0t+<Z%S2)R!?+<VdL+FG:S1E\J3+<VdL+FG:f+>Z#>%17JKCi3Zq
EZcJI+<VdL+<Z&&;BRqU1,U0s+<Z%S2E3<C+<VdL+FG:S1E\P8+<VdL+FG:g+>Z(g$@G<]D..6o
@<HZ7+<VdL+FH^X+?2;83$9=d+FG:k2(ga/+<VdLHlsOg+>c)$+<VdLHlt6g2)76&$@GQVEbf)m
+<VdL+<VdL+FH^X+?2;>0d%S]+FG:h0J5%%+<VdLHlsOg+>l&"+<VdLHlt6g2*!`-$@G-UE+ig'
@<?f<+<VdL+FH^X+>G_r+<VdL+FG:f2D-[++<VdLHlsOh+>l/%+<VdLHlt<i1HQ$QHpMXc@::9$
+<VdL+<VdLHq7-X3B83)+<VdLHlt@'/i=ao+<VeS+<WQb0fL3t+<VeS+>t>t0fogOHrFNgARo4i
+<VdL+<VdLHq7-X0fD!6+<VdLHlsOk/i=ao+<VeS+<WQb1GL!p+<VeS+>t>u2*26SHph[fBOkNo
+<VdL+<VdLHq7-X0fV-8+<VdLHltC)/heCj+<VeS+<WQb1Gp9t+<VeS+>t>u3'.QVHpM7UATDZs
EZcJI+<VdLHq7-X1cI04+<VdLHlt:+/heCj+<VeS+<WTc1-$I"+<VeS+?(E!1-5pPHq7[_@;I&/
+<VdL+<VdLHq7-X2DI-5+<VdLHlt7#/i=ao+<VeS+<WTc2)l^$+<VeS+?1Ju3t2OE6"=>?@<*J5
+<VdL+<VeS85^Qi3B&''+<VeS+?)/10H_J\+<Z%S+?1K$0H_J\+<Z%S3$:(63t2OE9kA3X@<*J5
+<VdL+<VeS85^Qj0ejdn+<VeS+>tr,0H_J\+<Z%S+?1K$1E[e_+<Z%S3$:(:3t2OE9keW[@;?u.
+<VdL+<VeS85^Qb0JPL/+<VeS+>G`+0H_J\+<Z%S+?:Q!1E[e_+<Z%S3?U%93t2OE6#:(C@UX:c
DBL&E+<VeS85^Qb1c737+<VeS+>c&12'="a+<Z%S0ea_*2BX+b+<Z%S0ea_*3BIZWHr=ZkAS`J3
+<VdL+<VdLHq7-X0fLgC+<VdLHlt@(/heCj+<VeS+>GSn+>k8a+<VeS+>GSn3'.QVHp_=]ASc0k
+<VdL+<VdLHq7-X0fLdG+<VdLHlt.'/i=ao+<VeS+>GSn+>k8a+<VeS+>GSn0ebZu$@G0OCi!O%
EbTb@+<VdL+FH^X+>Gf80H_J\+FG:h3%d'2+<VdLHlt-u+>G_r+<VdLHlt-u+>Gl<%17JOCi3['
BHSE?+<VdL+<Z&&;BR\Q3ADX!+<Z%S1H$j>+<VdL+FG:d0d&2/+<VdL+FG:d0d&5*3t2OE6#:FQ
Cgh0'+<VdL+<VeS85^Qb3A<63+<VeS+>u,10H_J\+<Z%S0eje+2BX+b+<Z%S0eje,0KT^NHpVCd
ASc!jF`V+:+<VdLHq7-X1,(U@+<VdLHlt:*/i=ao+<VeS+>GSn1c6Bu+<VeS+>GSn1c[W,$@G3L
DJsK:F!)SJ+<VdL+FH^X+>P`.2BX+b+FG:i1+kF,+<VdLHlt.!+>Gbs+<VdLHlt.!+>Gf:%17J]
Bl[p1F!)SJ+<VdL+<Z&&;BR_O3ADX!+<Z%S3&*$C+<VdL+FG:d1*AA1+<VdL+FG:d1*AA43t2OE
6"FY;Ea^(5+<VdL+<VeS85^Qc2DI06+<VeS+?2832'="a+<Z%S0esk.3?TFe+<Z%S0esk/1-5pP
Hr+j%@sN!1+<VdL+<VdLHq7-X1-%0I+<VdLHlt:,/i=ao+<VeS+>GYp1-$I"+<VeS+>GYp1GV$$
$@GZgCi"6=+<VdL+<VdL+FH^X+>Pr;0H_J\+FG:f2D-j0+<VdLHlt."+>Yhs+<VdLHlt."+>Yu=
%17JKG%kl8+<VdL+<VdL+<Z&&;BRbO0K1*s+<Z%S2)['@+<VdL+FG:d1a"M0+<VdL+FG:d1a"M1
3t2OE;fub^Bl"n7+<VdL+<VeS85^Qd2D[04+<VeS+?)&.0H_J\+<Z%S0f1"13$9=d+<Z%S0f:(.
3t2OE6#:LR@<,m$+<VdL+<VeS85^Qd2`*K:+<VeS+?))/0H_J\+<Z%S0f:(.2]s4c+<Z%S0f:(/
0KT^NHr=NgF_l2A+<VdL+<VdLHq7-X1H@EM+<VdLHlt:%/i=ao+<VeS+>G_r2)l^$+<VeS+>Gbs
0fogOHphO`AR]Ro@3?[8+<VdLHq7-X1c7'G+<VdLHlt7+/i=ao+<VeS+>Get1H6L"+<VeS+>Get
1bh'$$@G?XAStpi+<VdL+<VdL+FH^X+>bu71*@\^+FG:k1+k7'+<VdLHlt.'+<WNa+<VdLHlt.'
+?2Fl$@G-LEclUL+<VdL+<VdL+FH^X+>c#50H_J\+FG:h1+kF,+<VdLHlt.'+>G_r+<VdLHlt.'
+>Gl<%17JQ@:O>#GT\+O+<VdL+<Z&&;BReT2DZHu+<Z%S2)m3G+<VdL+FG:d3$9t1+<VdL+FG:d
3$9t43t2OE6#:7RFD)d>+<VdL+<VeS85^Qe3A<<5+<VeS+<WWr2'="a+<Z%S0fU:41E[e_+<Z%S
0fU:42EM?THrFuu@ppK&+<VdL+<VdLHq7-X2)$mG+<VdLHlt@*/i=ao+<VeS+>Gl!0f1!q+<VeS
+>Gl!0fM0'$@G-UCLLpf+<VdL+<VdL+FH^X+>kl60d%S]+FG:d2(gR*+<VdLHlt.(+>Yr!+<VdL
Hlt.(+>bc6%17JR@:Wee+<VdL+<VdL+<Z&&;BRhP2E)a$+<Z%S2)R!D+<VdL+FG:d3?U16+<VdL
+FG:d3?U1;3t2OE9kA3XASuT4+<VdL+<VeS85^Qf1,q69+<VeS+?);52'="a+<Z%S0f^@62'="a
+<Z%S0f^@63BIZWHpMd_FEMVHF!)SJ+<VdLHq7-X2)@'C+<VdLHlt7'/heCj+<VeS+>PVn+>k8a
+<VeS+>PVn3'.QVHr=ZkBl"nbASuTuF`MVGHq7-X2)I0N+<VdLHlt:(/heCj+<VeS+>PVn1,g<u
+<VeS+>PVn1GV$76#:LR@3@pKDKK<0EbPsiHs1Z%ASu'qB4Yt'@VHr-Hq7-X2)R0E+<VdLHltC&
/i=ao+<VeS+>PVn1H?R#+<VeS+>PVn1c%3&$@G-UE+ifm@ppK&+<VdL+FH^X+>l)<1E[e_+FG:f
2_Hs1+<VdLHlt1!+>Pbr+<VdLHlt1!+>Pi:%17JKDKK<-ATJt:+<VdL+<Z&&;BRkP1Gg3s+<Z%S
3&iNJ+<VdL+FG:e1*A;1+<VdL+FG:e1*A>,3t2OE;dj-LCEO`B+<VdL+<VeS85^Qg1H.99+<VeS
+?2&-2'="a+<Z%S1,9t03$9=d+<Z%S1,C%.3t2OE;eTT^CgeG/+<VdL+<VeS85^Qg2)7*5+<VeS
+?)842'="a+<Z%S1,C%.0d%S]+<Z%S1,C%.2*26SHr=Bo@;KUcB6@c.+<VdLHq7-X2Dm?M+<VdL
Hlt:%/heCj+<VeS+>P_q1,C$q+<VeS+>P_q1,_3'$@G9YFCB'$DBL&E+<VdL+FH^X+>u/42'="a
+FG:d1G1@(+<VdLHlt1#+>bu!+<VdLHlt1#+>c&>+@UB\D/!ks$7QDk%17/F6WHrkF*'rn9keKd
4ZX]S6WHZt9keKd+B)rB6WHrkF*%iuF(B?%E+*g04ZX]6FDY`0F!,Nm6WHrkF*'rn9keKd.3L2b
FDY`0F!*Xh1E_#g0d&Y6HW+TS@<6NgATJ:f:-pQUA8-*pEb02uDI[r7D/!m1FCfM9/Kd/:+>t?Z
Bl7u$$8s"j3ZpU=0-GX`A927"@<6N"$4R>;67sC%D/XQ=E-67F-UgC&+ED1;ATMF)+E1b1F<GF7
DKU&4+Co1uAn?!oDI[7!+B)'9<(JAG$;No?+EMC<F`_SFF<G+8FCB86F(B?%E+*g0%13OO:-pQU
F)>i<FDuAE+=D5KF`_;.Ec*"5ASl.&E+ig'AKYK*EcP`/F<E_04Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4XU[G;eSO@EcO<(+Dbt+@<?4%DI7O&F`MVR+>PW+1E\Ir1,fXL;eSO@EcP&hF$2Q,;eSO@EcN:?
@<Q""De*:%+>=63:-pQUF)>i<FDuAE+D,J4?Z^3s@<itoBL?o_E`-Ii%13OO;eSTe<C:nLE]lH+
0H`D!0F\@>/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J_Cisc@+>"^WFCB24
E+*d/Gp$X3DImi29Q+ELFD5Z2+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+>t?:@:q/cBl+t8
+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2'>1oDg#\D88iNpHjpF1+<VdL+<Vd^1c@$A1GCF9
0JkLB2E!HP+A-cmBjkm%+<VeS%17J*+<VdL+<WU!/i57@1bgdD2`NNI1c[H:cBM9N+<VdL+<VeS
%17J*+<VdL+<VdL+<VdL+<WBp0eP.73A`H59Q+f]BlnK.AKZ@0$@Es=+<VdL+<VdL+<VdL+C?l]
/i,=?0JO\D@<?4*F_#&++FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+>PW+1E]h3@<*J5+<VdLHjpF1
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd_+AHclFD)d>+<VeS%17J*+<VdL+<WEt/iGC?0fCpJ2E!HO
2E!K:6t(?nA7Qf*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<Y#O/i=bO<'tsS+<VdL+FFV*.kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)h9/M/P+/M/P+/M/P+/M/P)/M/P+/M/P+
/M/P)/M/P+/M/P+/M/J)/M/P+/M/P+/M/I^$@GTWD.Oh4+<VdL+<VdL+FHRgF(o9)@<?4%DL>E(
/O=2p/OX/_HrP,<1,LRRE_U7cHltjF<@q0j/P'nVBl6!A$7d\[/M/P+/M/P+/M/P+/LrD)/M/P+
/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i56tL7I@W-'k+<VdL+<VeS85^Qe2)@'3+<VeS
+>ki*0H_J\+<Z%S+>=on0d%S]+<Z%S0H`,)3t2OE7qlOP@;$c++<VdL+<VeS85^Qe2E!<5+<VeS
+?2,/2'="a+<Z%S+>=op3$9=d+<Z%S0H`213t2OE6"=qXGT\+O+<VdL+<VeS85^Qe2`!-1+<VeS
+>ko,0H_J\+<Z%S+>=oq3?TFe+<Z%S0H`533t2OE7q#nJFa,#O+<VdL+<VeS85^Qe2`<H7+<VeS
+>l,20H_J\+<Z%S+>Fu]1E[e_+<Z%S0d&55%17JKCh[g0BHSE?+<VdL+<Z&&;BReV0Jssq+<Z%S
+?;&.+<VdL+FG:S0d&50+<VdL+FG:d+>Pf9%17J]E+rfj+<VdL+<VdL+<Z&&;BRhN2)ZR"+<Z%S
2`<9B+<VdL+FG:S0d&>4+<VdL+FG:d+>l&=%17JKChmHnA0<!;+<VdL+<Z&&;BRhO3ADX!+<Z%S
0f:R@+<VdL+FG:S1*A;3+<VdL+FG:e+>Gi;%17JR@:Wee+<VdL+<VdL+<Z&&;BRhP2E)a$+<Z%S
2)R!?+<VdL+FG:S1*AA2+<VdL+FG:e+>Yi9%17JWASu9pDKI!D+<VdL+<Z&&;BRhP3&i$'+<Z%S
2`WKE+<VdL+FG:S1*AA4+<VdL+FG:e+>Yr<%17JKEas36EclFG+<VdL+<Z&&;BRhQ1b^$p+<Z%S
1c6mC+<VdL+FG:S1*AD4+<VdL+FG:e+>bu<%17J\BkM-r+A69`FCB<4F`Vq$;BRhR2)ud%+<Z%S
2)HpC+<VdL+FG:S1E\D-+<VdL+FG:f+>GQ3%17JdF^ep"ASc!jDKTE&+<Z&&;BRhS1GL!p+<Z%S
3&*$>+<VdL+FG:S1E\G.+<VdL+FG:f+>PZ5%17JKCiF'!@q/pi+<VdL+<Z&&;BRhU3AVd#+<Z%S
1H7!@+<VdL+FG:S1a!o!+<VdL+FG:g+>l4i$@G-WFCB3$F!)SJ+<VdL+FH^X+>tr11a!n`+FG:k
3A*!.+<VdLHlsOh+<WB]+<VdLHlt6g2*!`-$@Gc\@VKU#+<VdL+<VdL+FH^X+>u#73$9=d+FG:k
0J54*+<VdLHlsOh+>bhr+<VdLHlt9h1b_!#$@Gcc@<HBp+<VdL+<VdL+FH^X+>u)42]s4c+FG:j
3%cm-+<VdLHlsOi+<WNa+<VdLHlt<i1HQ$QHr=Bo@;KUcB6@c.+<VdLHq7-X2Dm?M+<VdLHlt:%
/heCj+<VeS+<WQb+>t>b+<VeS+>t?"3t2OE7;R'SDJ<u2+<VdL+<VeS85^Qg2_[*3+<VeS+>GZ)
0H_J\+<Z%S+>t>t2]s4c+<Z%S2BXb53t2OE94;sa+@1-kFE1f+BlbDE85^Qg3&`i?+<VeS+?2).
0H_J\+<Z%S+>t?"2'="a+<Z%S2BXk63t2OE<b5oP+<VdL+<VdL+<VeS85^Qh0JG4(+<VeS+>Pi-
0H_J\+<Z%S+?(Dc2]s4c+<Z%S2]t%@%17JXF`(u/+<VdL+<VdL+<Z&&;BRnQ1,0mo+<Z%S3&rTF
+<VdL+FG:S2]sk6+<VdL+FG:j+>Pf9%17JKCij*"EZcJI+<VdL+<Z&&;BRnU2)cX#+<Z%S2)R!D
+<VdL+FG:S3$9t2+<VdL+FG:k+>PW4%17JZART(e@r!20+<VdL+<Z&&;BRnW3A;Qu+<Z%S2)m3G
+<VdL+FG:S3$:(;+<VdL+FG:k+>l#<%17JNASu'g+<VdL+<VdL+<Z&&;BRnY1,L*r+<Z%S0f^jD
+<VdL+FG:S3?U%3+<VdL+FG:l+>GT4%17JODJ<]*+<VdL+<VdL+<Z&&;BRqT0K:0t+<Z%S2)HpC
+<VdL+FG:d0H`),+<VdL+FG:d0H`)+3t2OE6#:FIBlY==+<VdL+<VeS85^Qi1bpp2+<VeS+>u23
2'="a+<Z%S0ea_+3?TFe+<Z%S0ea_+2`hHUHq&$k@;KUcF`\`K+<VdLHq7-X3&`TP+<VdLHltC,
/heCj+<VeS+>GSn1,pC!+<VeS+>GSn1,h9($@GQVEbf)m+<VdL+<VdL+FH^X+?2;>0d%S]+FG:g
3A*03+<VdLHlt-u+>Ykt+<VdLHlt-u+>Yi9%17JKCiF'!Eaa'9+<VdL+<Z&&;BR\O+<VdL+<Z%S
1GpdB+<VdL+FG:d1*AA4+<VdL+FG:d1*AA33t2OE6#LIH@3?[8+<VdL+<VeS85^Qj3?TFe+<VeS
+?))/0H_J\+<Z%S0esk/2BX+b+<Z%S0esk/2*26SHrFNgARo4i+<VdL+<VdLHq7-X0fD!6+<VdL
HlsOk/heCj+<VeS+>GYp0ea^m+<VeS+>GYp3BIZWHph[fBOkNo+<VdL+<VdLHq7-X0fV-8+<VdL
HltC(/i=ao+<VeS+>GYp0f'pp+<VeS+>GYp0etg"$@G-LBOu4%@<*J5+<VdL+FH^X+>c#4+<VdL
+FG:h3%cm-+<VdLHlt.#+<WTc+<VdLHlt.#+>u:j$@GBQD..6'+<VdL+<VdL+FH^X+>tr5+<VdL
+FG:g0eP.&+<VdLHlt.#+>Yr!+<VdLHlt.#+>Yo;%17JK@ps4_EZcJI+<VdL+<Z&&;BRqZ2]s4c
+<Z%S2`33A+<VdL+FG:d2'=Y5+<VdL+FG:d2'=Y53t2OE9kA3X@<*J5+<VdL+<VeS85^Qj0ejdn
+<VeS+>to+2'="a+<Z%S0f:(01*@\^+<Z%S0f:(00fogOHqe<qAmoHt+<VdL+<VdLHq7-X0eb=@
+<VdLHlt.#/i=ao+<VeS+>G_r2)HEu+<VeS+>G_r2)@<'$@G-UA7]4YEa`i.+<VdL+FH^X+>G]1
2]s4c+FG:g3%cm-+<VdLHlt.&+<WNa+<VdLHlt.&+>c.h$@G`cB4Ym%+<VdL+<VdL+FH^X+>Gf0
1E[e_+FG:j1G1@(+<VdLHlt.&+>bnt+<VdLHlt.&+>bi8%17JM@;odoCgeG/+<VdL+<Z&&;BR\Q
0K:0t+<Z%S0fUdC+<VdL+FG:d2]sq8+<VdL+FG:d2]sq73t2OE6=jtL@<?O(GT\+O+<VeS85^Qb
2`WQ7+<VeS+>l,22'="a+<Z%S0fL441a!n`+<Z%S0fL441HQ$QHpqjh@<?0*+<VdL+<VdLHq7-X
0fM*I+<VdLHlt4'/heCj+<VeS+>Get2)ZR"+<VeS+>Get2)IB($@G-UDJ<oqD'0rD+<VdL+FH^X
+>Gl11E[e_+FG:i2D-[++<VdLHlt.'+<WNa+<VdLHlt.'+>c.h$@G0OFCf9$AT`'*+<VdL+FH^X
+>PW/0d%S]+FG:h2_Hd,+<VdLHlt.'+>Pbr+<VdLHlt.'+>P`7%17JM@;^"&F`SZJ+<VdL+<Z&&
;BR_N1,^6t+<Z%S2DQmB+<VdL+FG:d3$:(6+<VdL+FG:d3$:(63t2OE;e^8dF`SZJ+<VdL+<VeS
85^Qc1c[95+<VeS+?2).2'="a+<Z%S0f^@21a!n`+<Z%S0f^@21HQ$QHpM:V@<,d!+<VdL+<VdL
Hq7-X1,^jH+<VdLHltC,/i=ao+<VeS+>Gl!1,g<u+<VeS+>Gl!1,_3'$@GZjDe"'2DBL&E+<VdL
+FH^X+>Pr61E[e_+FG:h3A*03+<VdLHlt0u+<WWd+<VdLHlt0u+?)@k$@GZgCi"6=+<VdL+<VdL
+FH^X+>Pr;0H_J\+FG:f2D-j0+<VdLHlt0u+>G\q+<VdLHlt0u+>GZ6%17JKG%kl8+<VdL+<VdL
+<Z&&;BRbO0K1*s+<Z%S2)['@+<VdL+FG:e0H`5,+<VdL+FG:e0H`5,3t2OE;fub^Bl"n7+<VdL
+<VeS85^Qd2D[04+<VeS+?)&.0H_J\+<Z%S1,0n-2BX+b+<Z%S1,0n-2*26SHpMRfBOPpl+<VdL
+<VdLHq7-X1H.-M+<VdLHlt@(/i=ao+<VeS+>PYo2)ZR"+<VeS+>PYo2)RH)$@G`_B6A$5F!)SJ
+<VdL+FH^X+>Z#;1*@\^+FG:h1G1@(+<VdLHlt1"+>Yr!+<VdLHlt1"+>Yl:%14Nn$4R>`771'B
F`MLnE_U7cF$2Q,771'GE_U7cF!+Cp771'BF`ML3$?Ka!@q0Y%E]lH+.!0<?DK?qA771'BF`MLn
E_U7cF"&4`+EVI7DK?pa+>Y-e+u(3(0RH`36ZmEi;IsnY$;No?+Co2-@rc."@;]S#+Dkh1F`_29
+>"]u3Zp1#D/!m/%14j54usfM/h\>pF(B?%@s)g4%13OO:-pQUF)>i<FDuAE+=D5KF`_;.Ec*"5
ASl.&E+ig'AKYT-FEMV8+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4XU[G;eSXCF?MZ-Ci<flFD5Z2
?Zg1-EclgR1,(O@+?(Du%16$I7WifNATL!q+B)rCF`\aD@<Q""De*:%+>=63%16$I771'EF`]c-
+>=p!+>=63.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5<GZeuFW`7YF*(i2
+E1b0FEo!>Bl7L&+A?]`@<?4%DBL'L%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb9jqZd9PJ>d
+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL+>k9-@W-F$/P'f#H@-//HlsOS+<VdL1,LmJ1c$m>
0ebF=2E!HO2]t_8Ch[<q+<VdLHjpF1+<VdL+<Vdd2_HsE1H7<L3&3HJ1,UaE+O63N+<VdL+<VdL
HjpF1+<VdL+<VdL+<VdL+<Vd]1GLL90f_'F+A?]kB5)I1A7Zm2%17J*+<VdL+<VdL+<VdL+<Y#H
2(g[A1GCO+9OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<WEn1c$7WARTU%+<VdL+FFV*
HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL2]th5DKKP7+<VdLHjpF1+<VdL+<Vd]/iGC?0fCpJ2E!HO
2E!HP+@KX`/nAK8+<VeS%17J*+<VdL+<VdL+<VdL+<VdL+<Ve63A*03<E)>3+<VdL+<Z%@$7d\[
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN>)/M/P+/M/P+/M/P+.kN>)/M/P+
/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)%17JX@;TQu+<VdL+<VdL+<Z&"ATMQuDIIX$Df0r%
E\0RnF=fmlB7*[!/M].789.F=DL<Qq6WG^;E\0h&9keK,%14U;/M/P+/M/P+/M/P+/M/J)/M/P+
/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lq8;Hpqjn@;]ds+<VdL+<VdLHq7-X2E*<I+<VdL
Hlt."/heCj+<VeS+<W?\+>k8a+<VeS+>=op3t2OE94;sa+@1-kFE1f+BlbDE85^Qg3&`i?+<VeS
+?2).0H_J\+<Z%S+>=oo2'="a+<Z%S0H`/,3t2OE<b5oP+<VdL+<VdL+<VeS85^Qh0JG4(+<VeS
+>Pi-0H_J\+<Z%S+>=op2BX+b+<Z%S0H`203t2OE:3CGiBcnN@+<VdL+<VeS85^Qh0etI++<VeS
+?2A60H_J\+<Z%S+>Fu]2BX+b+<Z%S0d&86%17JKCij*"EZcJI+<VdL+<Z&&;BRnU2)cX#+<Z%S
2)R!D+<VdL+FG:S1*@\n+<VdL+FG:d+>l,?%17JZART(e@r!20+<VdL+<Z&&;BRnW3A;Qu+<Z%S
2*!9C+<VdL+FG:S1*AA2+<VdL+FG:e+>Yf8%17JNASu'g+<VdL+<VdL+<Z&&;BRnY1,L*r+<Z%S
0f^j?+<VdL+FG:S1*AG.+<VdL+FG:e+>c)?%17JODJ<]*+<VdL+<VdL+<Z&&;BRqT0K:0t+<Z%S
2)HpC+<VdL+FG:S1E\P2+<VdL+FG:f+>kl8%17JKCi3ZqEZcJI+<VdL+<Z&&;BRqU1,U0s+<Z%S
2E3<H+<VdL+FG:S1a"M4+<VdL+FG:g+>G`8%17JPDf&p!BOQ%*+<VdL+<Z&&;BRqX1,pC!+<Z%S
3&WBC+<VdL+FG:S2'=##+<VdL+FG:h+>l4i$@GQVEbf)m+<VdL+<VdL+FH^X+?2;>0d%S]+FG:g
3A*!.+<VdLHlsOh+>G\q+<VdLHlt9h0etg"$@G-UE+ig'@<?f<+<VdL+FH^X+>G_r+<VdL+FG:f
2(ga/+<VdLHlsOi+>Get+<VdLHlt<i0f;$%$@G-WCLLWo+<VdL+<VdL+FH^X+?;G)+<VdL+FG:j
1G1O-+<VdLHlsOi+>Ykt+<VdLHlt<i1G_*%$@Gc^BOt^_EZcJI+<VdL+FH^X+>Gc6+<VdL+FG:S
3%cm-+<VdLHlsOi+>khq+<VdLHlt<i1cIK*$@G6UE+icj+<VdL+<VdL+FH^X+>Gi8+<VdL+FG:k
1+kF,+<VdLHlsOi+>kns+<VdLHlt<i2)%*$$@G-LBOu4%@<*J5+<VdL+FH^X+>c#4+<VdL+FG:h
3%d'2+<VdLHlsOj+>bu!+<VdLHlt?j1c.9'$@GBQD..6'+<VdL+<VdL+FH^X+>tr5+<VdL+FG:g
0eP.&+<VdLHlsOk+>Gbs+<VdLHltBk0f1s$$@G-L@;TFn+<VdL+<VdL+FH^X+?2A?+<VdL+FG:j
2(gR*+<VdLHlsOl+<WQb+<VdLHltEl2*26SHqe0iCLM6++<VdL+<VdLHq7-X3AE62+<VdLHlt=$
/i=ao+<VeS+<WZe0ejdn+<VeS+?:Q)3t2OE9keW[@;?u.+<VdL+<VeS85^Qb0JPL/+<VeS+>G]*
2'="a+<Z%S+?:Q#1a!n`+<Z%S3?U+43t2OE6#:(C@UX:cDBL&E+<VeS85^Qb1c737+<VeS+>c&1
0H_J\+<Z%S0ea_,1a!n`+<Z%S0ea_,1-5pPHr=ZkAS`J3+<VdL+<VdLHq7-X0fLgC+<VdLHlt@(
/heCj+<VeS+>GSn1,C$q+<VeS+>GSn1,(d!$@G3LE+Nj%@3?[8+<VdL+FH^X+>Gf/3$9=d+FG:d
3%d'2+<VdLHlt-u+>Pht+<VdLHlt-u+>P`7%17JLASc0kFE2)?+<VdL+<Z&&;BR\Q3A;Qu+<Z%S
2)m3G+<VdL+FG:d0d&8.+<VdL+FG:d0d&8,3t2OE7;QjMFD)d>+<VdL+<VeS85^Qb2`WT8+<VeS
+>Yo.0H_J\+<Z%S0eje,2'="a+<Z%S0eje,1-5pPHpMRdBl%3p+<VdL+<VdLHq7-X0f^pD+<VdL
Hlt=*/heCj+<VeS+>GSn1c-<t+<VeS+>GSn1bq-%$@G0OFCf9$AT`'*+<VdL+FH^X+>PW/0d%S]
+FG:h2_Hd,+<VdLHlt.!+<WH_+<VdLHlt.!+>Gqe$@G3LDJsK:F!)SJ+<VdL+FH^X+>P`.2BX+b
+FG:i1+kF,+<VdLHlt.!+>Y_p+<VdLHlt.!+>Y]5%17J]Bl[p1F!)SJ+<VdL+<Z&&;BR_O3ADX!
+<Z%S3&*$C+<VdL+FG:d1*AG1+<VdL+FG:d1*AG/3t2OE6"FY;Ea^(5+<VdL+<VeS85^Qc2DI06
+<VeS+?2832'="a+<Z%S0f'pp2BX+b+<Z%S0f'q/3t2OE:i^JaH#IRC+<VdL+<VeS85^Qc3A`N7
+<VeS+>l/32'="a+<Z%S0f'q/2]s4c+<Z%S0f'q/2*26SHr+`tCistF+<VdL+<VdLHq7-X1-%?K
+<VdLHlt4'/i=ao+<VeS+>GYp2)??t+<VeS+>GYp2).0%$@G-_BlA#7+<VdL+<VdL+FH^X+>Yf-
2]s4c+FG:h2(ga/+<VdLHlt.#+>Pr"+<VdLHlt.#+>Po<%17J]F_G2tC`jiC+<VdL+<Z&&;BRbR
1Gg3s+<Z%S2_cpB+<VdL+FG:d2'=V2+<VdL+FG:d2'=V03t2OE6#:LR@<,m$+<VdL+<VeS85^Qd
2`*K:+<VeS+?))/2'="a+<Z%S0f:(02'="a+<Z%S0f:(01HQ$QHr=NgF_l2A+<VdL+<VdLHq7-X
1H@EM+<VdLHlt:&/heCj+<VeS+>Gbs0fC-s+<VeS+>Gbs0f(m#$@G6QDIm9qCgeG/+<VdL+FH^X
+>br31a!n`+FG:h0J54*+<VdLHlt.&+>l&"+<VdLHlt.&+>ku;%17JQBk;0jBHSE?+<VdL+<Z&&
;BReS2DQBt+<Z%S3&3*D+<VdL+FG:d3$9t4+<VdL+FG:d3$9t23t2OE6"=qXGT\+O+<VdL+<VeS
85^Qe2`!-1+<VeS+>ko,0H_J\+<Z%S0fU:31a!n`+<Z%S0fU:30fogOHq.UTEclUL+<VdL+<VdL
Hq7-X1cI<K+<VdLHlt:+/heCj+<VeS+>Ghu1H6L"+<VeS+>Ghu1H%<($@G-UBlA*,+<VdL+<VdL
+FH^X+>c)42'="a+FG:S3A*!.+<VdLHlt.(+<WB]+<VdLHlt.'+>l/@%17J]E+rfj+<VdL+<VdL
+<Z&&;BRhN2)ZR"+<Z%S2`<9B+<VdL+FG:d3?U+5+<VdL+FG:d3?U+33t2OE6#:=FBk/>/+<VdL
+<VeS85^Qf0f^s2+<VeS+>G`+2'="a+<Z%S0f^@61a!n`+<Z%S0f^@61-5pPHq7[V@<*J5+<VdL
+<VdLHq7-X2)7'K+<VdLHlt:(/heCj+<VeS+>PVn0ejdn+<VeS+>PVn3'.QVHqe0iCLqC*+<VdL
+<VdLHq7-X2)7-N+<VdLHlt@-/i=ao+<VeS+>PVn0f1!q+<VeS+>PVn0eka!$@G-[@ruj6F`SZJ
+<VdL+FH^X+>kr30H_J\+FG:g2(ga/+<VdLHlt0u+>P\p+<VdLHlt0u+>PW4%17J\BkM-r+A69`
FCB<4F`Vq$;BRhR2)ud%+<Z%S2)HpC+<VdL+FG:e0H`22+<VdL+FG:e0H`2/3t2OE>'4:cDImWs
ASuX"BcnOG85^Qf2)?s0+<VeS+?2).0H_J\+<Z%S1,'h.3$9=d+<Z%S1,'h.2*26SHpMRfBOt[`
@3?[8+<VdLHq7-X2)dNO+<VdLHlt4)/heCj+<VeS+>PYo1bg*q+<VeS+>PYo1H@N+$@G-WFCB3$
F!)SJ+<VdL+FH^X+>tr11a!n`+FG:k3%d'2+<VdLHlt1"+>Ynu+<VdLHlt1"+>Yf8%17J]@:Eqd
+<VdL+<VdL+<Z&&;BRkR2`Mp&+<Z%S3%usB+<VdL+FG:e1E\D2+<VdL+FG:e1E\D/3t2OE;eTT^
CgeG/+<VdL+<VeS85^Qg2)7*5+<VeS+?)840H_J\+<Z%S1,C%00H_J\+<Z%S1,C%/2`hHUHr=Bo
@;KUcB6@c.+<VdLHq7-X2Dm?M+<VdLHlt:%/heCj+<VeS+>P_q1bg*q+<VeS+>P_q1H@N+$7QDk
%17/F6WHTuF@^FHBl7uT3ZpjY<Ch.)Bl7u7;eSTe<CV+Q%17/eF(8g)F?MZ-.!0<?DK?qA771'E
F`^/p9keKd.3L2bFDY`0F!*Xh1E_#g0d&Y6HW+TIF`^MmEt&IO67sBkBldd)AT2'q@sK26Bl8'8
ATJtG+?V\-1*CFJDK?6o:-pQU1*AbA+?hD2+FJ6@F(8g)F:AQd$4R>`D/XQ=E-67F-UgC&+ED1;
ATMF)+@/[p02>;@<(JZ@:K:@b+@pNIBl5&*Eb05DF*(i4F!*V/4Ztqk-OgDnF(9'$DEU$'DIdfu
@s)fCDIdfuAp&2HDIdfuE+*g0/9>?C@rPjtF=_KDF(8^&EcN^PA926mF`\'"F)>i<FDuAE+=D2<
G9Ca6@;\+K-S-H&+Dk[uDBNJ2@r5pt%17/nDfp/@F`\`RA8-+,EbT!*FD5Z2+CS`#DesQ<AKYi(
DKU&4+Co1uAof=/$?L'&F`_SFF<GpWGp%GX0n(5u3Zp,'H$t)`5&Y%RAT8i?A926tBl4@eF)>i<
FDuAE+=D5P@<?Q5@:F:rCisi2+Dkh1F`_1;A8,XfF!hD(F)>i<FDuAE+CoP8@<<W>A926tBl4@e
%14d30I14M@<6!&-Ve>O@<6N5:2!";EcN9tBL[,d+AQTH@<6NgATJthBL?o_E`-Ii+AQT>F`^Mm
F!*n=<Ch.)Bl7u7FDY`0F!hD(0H`%pATD4#AKW?qBLP9g:gnEe+@SXt:gnEe89.F=DK?ph6WHKr
EcO]k9keKd+AQT=6WHKrEcN9k6WHTuF@^FHBl7u7:2!'`<CV+Q-OgD:+>>'PEaa$#+=D5!6WHrk
F*'rn9keKd+EKt=<C:nLE_(4FBl7u7F%&Gr7WifDE_U7cF!hD(0H`%pATD4#AKW@!BM`,YF<FLq
6ZmEi+B)rCF`\a)BM`,YFAc[k+B)r@F`MM#ATJtmBL[,d;Isnl;eSTe<D[+FF<FLq771'BF`MLF
;eSTe<CV+Q-OgD:+>>'PEaa$#+=D&;F(8^&EZf71F(8g)F<GI3F(9/tF*&OGA927"@<6N5F(B?%
@s)g4+EM(7@qKk*-OgD:+>>'PEaa$#+=C]@@r5pt-QjO,67sBkBldd)AT2'q@sK26Bl8'8ATJ:f
%17;nDJWfmBOPq&+>=63%17/nDfp/@F`\`R:dJ#Y7790t+ED1;ATMF)?Z':qF*(i2F'iKgF^K3,
Deio3%17,iF(KE(FC/ooG&qb6EcYT/@:iqgBjYpuDeioZ67sa.Bldj,ATV9s@<Q^6@<-ErF(&Zh
EbSm%D/X3$+<YbX/KePAD/`p(ATJtBEbTT+F(KGB+<Y0&Ch%N/+EVN2$;No?+E2.*DImouEbTZ5
+E2@>B6%EtF"Rn/:-pQB$;No?+B3#gF!)TIATMr9+Cf>,E+*cuF!)SREbTT+F(KGB+<YcH@;^.#
F<D]JBl.F&+CT.u+CT).BlnK.ATJu9D]g/FEb0<7Cij_-$;No?+Cf>,E-686A0>?,+EV:.+E2.*
DImouEbTZ5+E2@>B6%EtF!)l0CO%%$@:iqgBcp5mD]gqe/e&._67r]S:-pQUF(JoD+D>k=E-"&n
06_Va/otfRF(&ZhEbSs'FE2;;Df'bP@rH3;%15is/e&._67sBjEb/[$ARmhE1,(I>@;mnW%15is
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+%15is/g)o*@;p6B1E^+:C3=T>+D,P4+EM[C061cJAKZ&*F<Et;;G0te;]n4G0HatGEZfI8
F*%iu%16oi@:UK.EbTT+F(KG@%16oi@:UK.EbTT+F(KGnFD5Q4-OgCl$?0p(FCSumEcW?W%13OO
:-pQUFCfN8+E_d?Ci^$mFDY`0F$2Q,H[@7r+u(3G+>tnr0d%qi0d%TaI=2P3;bL7aE_U7c6#:Xa
4ZX^4HQZZR2Dum+/g)N'+=A:ABOPq&F^cI@Hm^7LAoqU)CghC,F*)FH0d'aE1*Cut+C.&]?SWaG
Ch=e<-W<Z@/Q?aB89.F=DEB3g@:jUmEcZ>C+F,CY/M8/5;LNs&$<'T#;flGgF$2Q,H[B1;Cj0Q,
FCfQ7Bl,1L4s2s30d%ik-RN;6AoD^$F*)FH0d'aE0mkSt0d'aE1*Cut+C.&]?SWaGCh=e<-W<Z@
/Q?aB89.F=DEB3g@:jUmEcZ>C+B)rP93FW)EcNTO/M8/5;LNs&$4R>;67sC(@;L'tF!,R9A8,t)
F)6+EDdmfsBl7Km+C]U=@r,jhCM@[!+E)-?Df0,/F*(i2+CSl(ATA4e:-pQU@;^"*BOu3,Bl5&8
BOr;\@:LEYCO%%$@:iqgBcp5mD]gq\E,ol0Ea`eo$4R>;67sC%D/XQ=E-67F-Z3jCFD,6+DBNV(
D/"'1BOu3q+CfP7Eb0-1+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk-OgDXBL?o_E]lH+Ci<flFD5Z2
?[64!Ci=N=FDl&.INUC"1,C%/+>Pkb$;P8%F`MM#ATL!q+AQT;F`MLFDII]qFDk\uGp"dM$;No?
+EMC<F`_SFF<G14FC0-.A79a+:2!";EcP&hEt&Hc$;P8593FW)EcO<(+>=p!+>=63.kN>)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@GufCi"$6F*)><AKWQI:MaPa7U^"QBP)C'
+A?]`@<?4%DBL'L%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL2BY_&B.ZekD'0rDHjpF1+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL0ea_9@W-F$/P'f#H@-//HlsOS+<VdL+<VdL+<VdL+>Pc30JG::
/iPX18p+ra@;[21+<Z%@$@Es=+<VdL+<Vdc1G1L<2`*6F2)dKL1,M!L+O63N+<VdL+<VdLHjpF1
+<VdL+<VdL+<VdL+<VdL?SO8h/iYUF3AM^NDf03%FEM,*+FFV*HlsOS+<VdL+<VdL+<VdL+<Vd`
1bLUC0Jtd39OW$WFEM,*+<Z%@$@Es=+<VdL+<VdL+<VdL+<VdL+<VdL1,(I>+B`8aEZcJI+<VeS
%17J*+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL1E]D1DKKP7+<VdLHjpF1+<VdL+<VdL+<VdL+<VdL
+<VdL+>Pl.1,U1B@<jJ9A0<!;+FFV*HlsOS+<VdL+<VdL+<VdL+<VdL+<VdL+<WQb<E)>3+<VdL
+<Z%@$7d\[/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;/M/P+/M/P+/M/P+
/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i5:18!N+<VdL+<VdL+<Z&"ATMQu
DIIX$Df0r%E\0RnF=fmlB7*[!/M].789.F=DL<R*93EiGE\0h&9keK,%14U;/M/P+/M/P+/M/P+
/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+.h)i56tL7I@W-'k+<VdL+<Z&&;BReR
1Gg3s+<Z%S2D?a;+<VdL+FG:S0H`52+<VdL+FG:c+>l#<+>=oq2EN$>0KT^NHq.m^DII3$+<VdL
+<VeS85^Qe2E!<5+<VeS+>Po/0H_J\+<Z%S+>Fuo1*@\^+<Z%S0d&5+4!67#1,:p61,q?)$@Gck
Bk(Qo+<VdL+<VdLHq7-X2)$mG+<VdLHlt4%/i=ao+<VeS+<WE^1GU'q+<VeS+>P&q0KUC4+>Yc7
+>Yi,1HQ$QHpMd_FEMVHF!)SJ+<VeS85^Qf1Ggd.+<VeS+>u&/2'="a+<Z%S+>Y,q1*@\^+<Z%S
1E\G-4!6=%1,:p62Dd$E3t2OE>'4:cDImWsASuX"Bcqdo;BRhS1GL!p+<Z%S1-$sE+<VdL+FG:S
1E\P6+<VdL+FG:f+>l&=+>Y,t2`i-;3A*-M%17JKCiF'!@q/pi+<VdL+FH^X+>l)<1E[e_+FG:j
1+k7'+<VdLHlsOg+>beq+<VdLHlt6g1b_!61a"V04!6I;/i#Kt$@G-WFCB3$F!)SJ+<VdLHq7-X
2DI!E+<VdLHlt.(/heCj+<VeS+<WNa1H$?u+<VeS+>k8t1clg;+>Yo;+>Gl/0fogOHrFH_Bknh6
+<VdL+<VeS85^Qg1H.99+<VeS+>Y](0H_J\+<Z%S+>t>s2BX+b+<Z%S2BX_34!6F(0fD*91-$sH
3t2OE;IOWTChR6iF_)[<+<Z&&;BRkT2)ZR"+<Z%S2)m3B+<VdL+FG:S2BXh2+<VdL+FG:i+>Z#>
+>t?!0fpL83%cpI%17JU@<HW66$76jEa`cuF*pMV+>u2<3?TFe+FG:d0eP.&+<VdLHlsOj+>Y\o
+<VdLHlt?j1-%E=2]sn14!674/i#Kt$@GlcB42o*+<VdL+<VdLHq7-X2_Zp?+<VdLHltC*/i=ao
+<VeS+<WTc1bp0r+<VeS+?(E"0fpL:+>bi8+?2211HQ$QHqng%CM=n6+<VdL+<VeS85^Qh0etI+
+<VeS+>Gl/2'="a+<Z%S+?1Jd0d%S]+<Z%S3$9n:+<WWd0fpL#0f^jB3t2OE6#:XOBlY==+<VdL
+<Z&&;BRnU2)cX#+<Z%S2)HpC+<VdL+FG:S3$:(:+<VdL+FG:k+>l#<+?1K$2EN$=1bLXI%17JN
ASu'g+<VdL+<VdL+FH^X+?);91a!n`+FG:k3A*!.+<VdLHlsOl+>bu!+<VdLHltEl1c7?;3?U.:
4!6LC/hoEs$@G9[BkAJ1+<VdL+<VdLHq7-X3&<6J+<VdLHlt:(/i=ao+<VeS+>GPm1cZ[$+<VeS
+>GPm1cRQ>0ea_,3BJ?@2(gaJ%17JPDf&p!BOQ%*+<VdL+FH^X+?2;83$9=d+FG:d2D-[++<VdL
Hlt.!+<WH_+<VdLHlt.!+>Gr#0esk,4!679/hoEs$@GQVEbf)m+<VdL+<VdLHq7-X3&`fO+<VdL
Hlt=%/heCj+<VeS+>GVo0ea^m+<VeS+>GVo3'/6;1*A;*4!6F8/ic!&$@G-UE+ig'@<?f<+<VdL
Hq7-X0f:'r+<VdLHlt@*/heCj+<VeS+>GYp0f'pp+<VeS+>GYp0etg50f'q,1HQ^<1bLaL%17JN
BlI`r@3?[8+<VdL+FH^X+>Gi8+<VdL+FG:e2_Hs1+<VdLHlt."+>c&#+<VdLHlt."+>c#=+>GYp
1cRQ>1,ggE3t2OE87?@DC`jiC+<VdL+<Z&&;BRkP2]s4c+<Z%S2E<BD+<VdL+FG:d2'=V/+<VdL
+FG:d2'=V-4!678+>GW5+>u540fogOHqe0iCLM6++<VdL+<VeS85^Qj0ejdn+<VeS+>c)22'="a
+<Z%S0fC-s2BX+b+<Z%S0fC.34!679+>u;(1c[0I3t2OE6#:(C@UX:cDBL&E+<Z&&;BR\N2)cX#
+<Z%S2DQm=+<VdL+FG:d2]sq2+<VdL+FG:d2]sn:4!67:+>bc6+>tu-0fogOHr=ZkAS`J3+<VdL
+<VeS85^Qb2_d*2+<VeS+>Yr/2'="a+<Z%S0fU:13$9=d+<Z%S0fU:12`i-:3$9q84!6=</i5X!
$@G3LE+Nj%@3?[8+<VdLHq7-X0fLdG+<VdLHltC./i=ao+<VeS+>Ghu1,0mo+<VeS+>Ghu0f_<<
0fU:20fpL;3%d$L%17JLASc0kFE2)?+<VdL+FH^X+>Gf80H_J\+FG:h1+k7'+<VdLHlt.'+>Pr"
+<VdLHlt.'+>Po<+>Ghu1-%E=2)-^D3t2OE7;QjMFD)d>+<VdL+<Z&&;BR\Q3ADX!+<Z%S2`*-@
+<VdL+FG:d3$:"2+<VdL+FG:d3$9t:4!67;+>Y]5+?),01-5pPHpMRdBl%3p+<VdL+<VeS85^Qb
3A<63+<VeS+>bo-2'="a+<Z%S0fU:40H_J\+<Z%S0fU:33BJ?<3$:%34!6@:/i5X!$@G0OFCf9$
AT`'*+<VdLHq7-X1,(U@+<VdLHlt:&/heCj+<VeS+>Ghu2)ud%+<VeS+>Ghu2)mZ?0fU:53BJ?@
1G1@C%17J]Bl[p1F!)SJ+<VdL+FH^X+>Pc60d%S]+FG:e3A*!.+<VdLHlt.(+>c)$+<VdLHlt.(
+>c&>+>Gl!1c[W?1,pmG3t2OE6"FY;Ea^(5+<VdL+<Z&&;BR_Q0fU9u+<Z%S0fCXA+<VdL+FG:e
0H_Jn+<VdL+FG:e0H`)3+<WEn+>Q#$0fCXB3t2OE:i^JaH#IRC+<VdL+<Z&&;BR_T1c$6s+<Z%S
2)$X?+<VdL+FG:e0H`2.+<VdL+FG:e0H`2-4!6:4+>bl9+>ki*2`hHUHr+`tCistF+<VdL+<VeS
85^Qc3B8c9+<VeS+?))/2'="a+<Z%S1,'h-3?TFe+<Z%S1,'h-3'/6<0H`244!6I</i>^"$@G-U
E+i[#A0<!;+<VdLHq7-X1H.-M+<VdLHlt4(/heCj+<VeS+>P\p1GL!p+<VeS+>P\p1GCm51,9t.
0fpL62D-sN%17J\AS6.%F`SZJ+<VdL+FH^X+>Z#;1*@\^+FG:h2_Hs1+<VdLHlt1#+>GSn+<VdL
Hlt1#+>GQ3+>P_q0eka42)d-E3t2NG%13OO;bL7\F`MLnE_U7cF$2Q,+B(p989.F=DF&)\F!+4k
;bL7\F`ML3$>r:"<G6DiBl7uT3Zp+!0d(fe0d'Cf=[R=PE_(4FBl7u$$>rd8=_MhmBl7uT3Zp1#
1E_#g0d'Cf=[R=PE_(4FBl7u$$>rd8=^c,gF$2Q,1a%,h0d'Cf=[R=PE_(4FBl7u$$<'T#6ZmEi
6#:Xa4ZX]L+>P'd+u(3(+>=pb+AQT;F`MM#ATJ:fDIdfu@s)fT3ZohmD/!m/+Dt+N=_MhmBl7u@
+>"^XD/!m/+?go(+F>:e+?hK+:2!";EcP&hEt&IoA79:r@s)fT3Zq?o=[R=PE^=M`F!*%WDGs22
@;L%,%13OO:-pQUA8-*pEb02uDI[r7D/!m1FCfM9/Kd/:+>G!UBl7u$$8EYe3ZpU=0-GX[A926j
F`Iou:-pQUA8-*pEb02uDI[r7@;L%"FEM,*%14dA1*AbA+?hD2+FJ';@;L$qF`Iou%15is/g,4P
Dfp/@F`\`R;bL79EbTT+F(KG9:/=be80CHD9keJfAo_I&06;5DFE8Qf4Ztqk4Ztqk4Ztqk4ZtqU
%15is/g+\G@r5pt4ZX^5DIdfu@s)f$$;No?+EMC<F`_SFF<EbcAo_I&+CoP'D/!ks$;No?+EMC<
F`_SFF<Dtn3[[X9DKU&4F!*bbFD5i>A7]g0.3L0&+?Ui'+CoP8@<<\J+FJ';F(8^&EZcno+Dt^u
Cij00EX`?b$4R>;67sC%D/XQ=E-67F-Za3KFD,6+DBNV(D/"'1BOu3q+CfP7Eb0-1+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk-OgD]BL?o_E]lH+Ci<flFD5Z2?Zg1-EclgR1,(I>+>Y,q2[p*mBL?o_
E`-Ii4ZX]aBL?o_EZf7.G$f?0A79a+0F\@a67sC%D/XQ=E-67FAo2WsFDk\uGp$%!6ZmEi;IsnY
$4R=O$;No?+E).6Gp%0HD.Oi2Dfp/8ATDZ2F*(i2F!*%WFD,5.@:NeiEa`I'+EM+*D0$h>F_Pr/
+:SZQ67sBhA7]b'@<?''AoD]4D0[7CF`MG>F(KDF%16$I;bL7\F`MLc3Zp+!3Zp*c$7d\[/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;HrY!*EciKV+EMX5EZf=0EccRLA8,pmEZe%o
@psInDf-[?HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL+<Vdb+AH9W/PKkq+<VeS%17J*+<VdL+<VdL
+<VdL+<VdL+<VdL+<WNa6"4bUAM$GkEdE*B$@Es=+<VdL+>Pc30JG::/ho%:0fCpJ2E)aNF_kc#
DBL&E+FFV*HlsOS+<VdL2`!'C0K1gC1Gq*N0etRG2B^;0<$3;++<VdL+FFV*HlsOS+<VdL+<VdL
+<VdL0f(O:0JPRE0d'/.DJ*[*F_#&+HjpF1+<VdL+<VdL+<VdL+<Ve61,U[?1c$g?+A?3cBlnK.
AKW+C%17J*+<VdL+<VdL+<VdL+<VdL+<Vd^0JYF,=_2#^+<VdL+<Z%@$@Es=+<VdL+<VdL+<VdL
+<VdL+<VdL+>Y-7Df0Z1+<VdL+FFV*HlsOS+<VdL1,^aC0JkLB2E!HO2E!HO2]tLsGqNW<+<VdL
HjpF1+<VdL+<VdL+<VdL+<VdL+<VdL?TB_r+B;B.H6==Q+<VeS%14U;/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/I^$7d\[/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+
.kN>)/M/P+/M/P+.h)i5:18!N+<VdL+<VdL+<VeS6tLFRB5V."Bl@m:<,sQVCih6sAS6BiE\0%'
/P'nVBl8;@;bL7F<,sQ]E_U7c3t2NI/M/P+/M/P+/M/P+/M/P)/M/P+/M/P+/M/P)/M/P+/M/P+
/M/J)/M/P+/M/P+/M/I^$@G6QDIm9qCgeG/+<VdL+FH^X+>br31a!n`+FG:h0J5%%+<VdLHlsOc
+>PYo+<VdLHlt*c1,(d40H`,*4!6C7/i#Kt$@G?XAStpi+<VdL+<VdL+FH^X+>bu71*@\^+FG:k
1+kF,+<VdLHlsOc+>c&#+<VdLHlt*c1c@E<0H`234!6L</i,Qu$@G-LEclUL+<VdL+<VdL+FH^X
+>c#50H_J\+FG:h1+k7'+<VdLHlsOc+>l/%+<VdLHlt*c2)dT>0H`554!6C9/hoEs$@G?P@rc^:
+<VdL+<VdL+FH^X+>c#81E[e_+FG:h3%cm-+<VdLHlsOd+<WH_+<VdLHlt-d1-6U$0d&86+>l,2
0fogOHpMR_DffY8+<VdL+<VdLHq7-X1c[6I+<VdLHlsOl/heCj+<VeS+<WB]1,^6t+<VeS+>Fuo
2*2p8+>Pi:+?1u63t2OE;fHG\@3?[8+<VdL+<VeS85^Qf0Jta2+<VeS+?)220H_J\+<Z%S+>Fur
2]s4c+<Z%S0d&>34!67#2)dT>2`33J3t2OE6#:=FBk/>/+<VdL+<VeS85^Qf0f^s2+<VeS+>G`+
2'="a+<Z%S+>P&o3?TFe+<Z%S1*A;24!6:$0f_<<0f:R@3t2OE87?%;EZcJI+<VdL+<VeS85^Qf
1,_'6+<VeS+>l#/0H_J\+<Z%S+>P&q2BX+b+<Z%S1*AA04!6:$1H%<;2)HpG3t2OE9kA3XASuT4
+<VdL+<VeS85^Qf1,q69+<VeS+?);50H_J\+<Z%S+>P&q3$9=d+<Z%S1*AA34!6:$1H7H=2`NEM
3t2OE6#pIWF`MVG+<VdL+<VeS85^Qf1Ggd.+<VeS+>br.2'="a+<Z%S+>P&r2]s4c+<Z%S1*AD3
4!6:$1cIK=1c6mD3t2OE;JBcXC`lA^DKK<0EclGN85^Qf1c799+<VeS+>ku.2'="a+<Z%S+>Y,p
1*@\^+<Z%S1E\D+4!6=%0etg52)HpB3t2OE6#LIH@3?[8+<VdL+<VeS85^Qj3?TFe+<VeS+?))/
0H_J\+<Z%S0esk/2BX+b+<Z%S0esk/2*2p81*AG44!6I</i#Kt$@GcpBOPUk+<VdL+<VdL+FH^X
+>Yo31a!n`+FG:j1+k7'+<VdLHlt1!+>Ynu+<VdLHlt1!+>Yl:+>PYo1H%<;2_cpE3t2OE6#:LR
@<,m$+<VdL+<VeS85^Qd2`*K:+<VeS+?))/2'="a+<Z%S1,0n/2BX+b+<Z%S1,0n/2*2p90d&>3
4!6I</i5X!$@G`_B6A$5F!)SJ+<VdL+FH^X+>Z#;1*@\^+FG:h1G1@(+<VdLHlt1"+>Yr!+<VdL
Hlt1"+>Yl:+>P\p1H.B<2)6dD3t2NG%13OO;bL7\F`MLnE_U7cF$2Q,+B(p989.F=DF&)\F!+Cp
;bL7\F`ML3$?JX'<G6DiBl7uT3Zp+!0d(fe0d'Cf=[R=PE_(4FBl7u$$?K-==_MhmBl7uT3Zp1#
1E_#g0d'Cf=[R=PE_(4FBl7u$$?K-==^c,gF$2Q,1a%,h0d'Cf=[R=PE_(4FBl7u$$<'T#6ZmEi
6#:Xa4ZX]L+>P'd+u(3(+>=pb+B)r@F`MM#ATJ:fF*(i2D..L$4ZX]60Hb]d0d&Y&0Hb]b;eSO@
EcP&hF"&5C/g+(c=]9ENEcW@%BN%Q,6ZmEi%13OOF(B?%@s)fT3ZohmD/!m/+ELIS=_MhmBl7u@
+>"^WFCB3,@<63,,9V)FBl7u74s2X(HQk0e4tq=^BL?o_E`-Ii%17/e@;L$qF`KW++=M;Q@<-3n
F))mC+B(p96ZmEi6#:Xa.3L2bF&P_7@;L%,%13OO:-pQUA8-*pEb02uDI[r7D/!m1FCfM9/Kd/:
+>G!UBl7u$$8EYe3ZpU=0-GX`A926jF`Iou:-pQUA8-*pEb02uDI[r7@;L%"FEM,*%14dA1*AbA
+?hD2+FJ6@@;L$qF`Iou%13OOF)>i<FDuAE+=C)\=Wha!F(KE(F<EkC9J9.:;H-1?;bpCm80CHD
9keJfAo_I&06;5DFE8Qf4Ztqk4XU[GA926tBl6'p+Dt_2@q0Y%/9>?C@q0Y%%17/nDfp/@F`\`R
Eaa/7BQ@s(DBNe-@;\+K-S-H&+Dk[uDBNJ2@r5pt%17/nDfp/@F`\`RA8-+,EbT!*FD5Z2+CS`#
DesQ<AKYi(DKU&4+Co1uAof=/$?L'&F`_SFF<GpWGp%GX0n(5u3Zp,'H$t)`5&Y%RAT8i?A926t
Bl4@eF)>i<FDuAE+=D5P@<?Q5@:F:rCisi2+Dkh1F`_1;A8,XfF!hD(F)>i<FDuAE+CoP8@<<W>
A926tBl4@e%17/nDfp/@F`\`R;bL79EbTT+F(KG95tjs*:/=be82!n;<E)L36#:XWFEM,*+D,Y*
EA)BT@<?Q54Ztqk4Zt/%$=n3fD/!lN3Zp+/0d(LTF`(_4DId0lFCTH6/9>?1Cij00EX`@sD/XQ=
E-67F-ZWX>+D>e4Bl5&1ARTI;+=A]a3Zr9N@;[2uF(9'$D@HqoD/XQ=E-67F-Y-q4FE2))F`_>9
DBN@sF)Pl;FCcS'CijB5F_#&+A8,XfF!hD(F)>i<FDuAE+FAH\+F>:eINU:)+>A.fI=35%De=$$
E?KX>F(9'$D@HqoD/XQ=E-67F-ZaB<FE8R5@WQI(F`_1;@;L%"FEM,*+Co1uAof=/$?L'&F`_SF
F<G+8FCB86Ht7;.D/!ks$4R=r+>>'PEaa$#+=Bot6ZmEi+<VdL+<VdL:2!";EcP&hF!)SJ+<XEm
;bL7\F`MLF+<VdL;bL7\F`MLgCij_@+<XTU=[R=PE_(4FBl7u>+:SZ3+>>'PEaa$#+=C)\=\*R-
Bl64QFE8QI;bL7lFCB32+<VdL+<XTr6ZmEi+<VdL+<VdL;eSO@EcP&hF!)SJ+<XTr;bL7\F`MLM
+<VdL+:SZ3+>>'PEaa$#+=C]@@r5pt+<VdL+<VdLDFHomBQ@s(DK?pC+<YQ#93G\>FE8QI+<VdL
DGs22BQ@s(DK?pC+<YQ4@;L$qF`JiP+<VdL+:SZ3+>>'PEaa$#+=D&;F(8^&EZcJI+<VdLF%&Gr
BQ@s(DK?pC+<Y`(93G\>FE8QI+<VdLF&P_7BQ@s(DK?pC+<Y`9@;L$qF`JiP+<VdL+:SZ3+>>'P
Eaa$#+=D5@F(8^&EZcJI+<VdLF*(i2D..L$+<VdL+<YcCBl7u>%13OOGA1r2@q01\EcW?W%13OO
F)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV9s@<Q^6@<-ErF(&ZhEbSm%D/X3$-OgE'Bldj,ATV:"
Bldj,ATV:#D/X3$:-pQ_EbTT+F(KH#EbTT+F(KH#F)>i2AKZ(H/KcH^Bldj,ATT@DF)>i2AKZ)+
F*)IU%15is/e&._67sBjEb/[$ARmhE1,(I>D..H?2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91LY6C0JO\dDe!3t
Bl@l3DIIBn+CSekARl5W:-pQU1,E?XE\]En@:X+qF*&O:DfQtAF`)56F(I"GATT&,Bl%m&EbTE(
%13OOCi<`m+=D2DF(KE(F=.M)%15is/g,"BAT`&:E+^dG3B8WF0JEqC9L:m'+C@&^/hf7@1E\M0
/i,:>1E[f867sBIDf^#=D@HqU9gh-*+>Gl93$:""1,'.E<DPb=+>=63:-pQU@:WmkDdmHm@ruc7
DJsV>Bl5%b5uf%F@;TRs+>"^RAS#Cn+>"^R@;TR,+ECmA+Co%n%15Bs69QqD-p0RP-WXerF`SoZ
/1<V;0ePC@0eta</3GXH/i5C=3AM$N5u0g1/g)\l/j:C+4$"`b6:tT[@;TQu:I7Z\;F+Y^1,(C9
+AY<r?USI8?V3(-0JFk'+=o,f5u0fV$:JHAFCA-i:Ng;iBk1d^EbTT+F(KH#4ZX]C2@U!@<cW7(
@o-TSD0%'f3ZohR9gh'C:HM6:4$5f)67F$tBldj,ATT%B<b6/kF!hD(0H`%pATD4#AKW?gAScHs
<-(iYATDKqARBIlF(KE(FC-C)$4R>;67sC(@;L'tF!+n3AKZ22FD,B++>GPmD/!m1FCfM9De:,6
BOr<'AS$"*+C]8-CEO&n:-pQUEb0<7CigdO+Du+>+D5_+@<<W$F`\a=Df9//ASuF/B4rE"DfQt2
ASl?.GAhM;%15g@AT`'2Bl6'p+<W0f+s8T_>p)$Z+>Fug+u(3G+>GVo1,U1*+>Gl!1bg+(3Zp1#
2)PgM0ea_6+?hD2Hqe0`F`VD6DBLMR.k`(h0d'aE2D?7.+=\Qi+C-*s1*Cor+u(3%1*Cof0d'M;
F!(o!%15cq4ZX].?SO8n/i,FD3Ai];1c$aB1c@9O2'="a:-pQU9kA?ZA8,Ii+:SZ\9gh-*+>PW+
1E\Ir1,fXL<DPb=+<WQb+<VdL+<VdL+<VdL+<VdL+<VdL+<XEG/g*ke<$51?6Qg;ZAohO*%13OO
-W5".@o-TSD0%'f3ZohR9gh'C:HM6:.3NYFF(KE(F<DqsChI[&-Qij*-W5".@o-TSD0%'f3ZohR
9gh'C:HM6:.3NYFF(KE(F<DqsChI[&-T`\RBkM!n-T`\SE+rfj-OgCl$;No?+@:*_B4uB0;flGg
F!,(5EZd+k1,C%/+>Pku9kA?ZA8,Ii%15is/g+hLFDu:^0/%NnG:m<?D..<j@kM80D(f==FE2;;
Df'bQ@WH0qBQPhIFCB3207%>O@rGmh0/taG1c@!B0JYF90Jb:92[p*\F$2Q,4$"`TCij*"EZdb]
DIm9"7W3-PChR7"F<EkcB5_T/6#:(C@UX:cDBMhkB4Ym%6XaqFCi!N&6=jtL@<?O(GUEq-6?>:N
+@:-#4$"`UATVL"B4Z4,AKXocEbTZ;+Ad)s@sN!1+AcumCistF;IsK`CiseA;fHG\@3@jV@ruj6
F`SZkDKK<-ATJtpAS5F!+:SYe$7A_m+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%]Et&Hc
$;No?+EVX4DKBN6F!,=.FCSu,AmoCoCj@.IASc0*EbTT+06:]HF!,"-AnGUp+>k9`D]gbg+Dkh1
F`_29%15FC<,uDbF(o_Z3ZpF*0fU^=0H`>+0esk,2(UI?+>Yl+0fU:2/29+,1bgO93$:%6/35LF
+>kk_$:8f5Ea`j,BllL!+@:-KEa`j,BlkIK+>Gl!1,1=80H`))/2Aq&2(UL;+>GT%1,C%/1b:C)
2)Hj?+>bo+2'=b9/35a51^sd$$;No?+EVX4DKBN6+CT).BlnK.AKYMpB6%QpEt&ICF$XVa4ZX]C
2'=k<+>Gbs3&_s<1*AA4+?2;&2)5UJ6?>G/F?MZ-6?>G/F=]:*+>Pr"2)-441a"Y8+>Ykt2DlU3
3?U:=%13OO<)$1P3Zrc1+u(3<Et&IB9N4/9+=JX#0fpp?.40Bg4s3g!:amM</g*K%6#:Wc%16'4
<'<8b-n%244#.p7.40Bg4s3g!:amM</g*K%<,uDbF(o_*$4R>;67sBhCijB5F_#')+DkP/@q[!,
D]gbWA7]CoARu;X0d&V%4t\K2/MA;&+@/\#%13OO:-pQUFE1f-F(o_=FD5T'F!,=.FCSu,FDi9V
+Dkh1F`_1;Bl5&;DfTo@+Cei$AISu$+?^i2/h\>p+=K-%+<rpR3aXTa>p(gD0d(fe0d'Fn<%/qA
+>tnr,<B-l?SN[/+>P&q+F>:e+B26<%13OO-V6U(+AP4'-TsL5Ci<`mF*(i2F!*.G$7L6R+u(38
5uoEt3Zrc1+u(385unF%.!mQj0d'%R<@L'l+F?-n0d'%R<=K9_:18<dF!+sh@<-4+-TsL5-s984
4&o'<9L:0NEbTT+F(KG9:18<Q;flGg?VY$HAISto8RZa^F!+sh@<-4+-TsL5-s9844&o'<9L:0N
EbTT+F(KG98O6?`:18!N%13OO:-pQUA7]@]F_l.B%14IWATDKqBjkn"F!,9o@;TQu@o-TSD0%'f
3Zr-FF^K6/A79a+0F\?u$;No?+Cno&AKYo'+B<6#EciLGFCB24E+*d/Gp$X3DImht$?\s/4ZX^#
F_kZ1@ps0rF]hF,4ZX]@0JYC+0ea_)3=Q<q9N=tj4ZX]?1GLL90f_'F+C?l]/i,=?0JO"DF]DC.
4ZX]m3A*03%175O9gM943Zp=50F\A39LqrW>!4nh2%9n8:-hTC4ZX]5<GZeuFW`7YF*(i2+E1b0
FEo!>Bl7L&-OgE*6t(+O4ZX]>%14I_Cisc@EcW@>:18!N+Ce5VEc#kF4ZX]6F]hF,4*=.`4&nsS
;H5f$<E)=IF\GLq7ltie85E,e4*=:a9gq-d6t(+O.3N>5F^K6/A79a+0F\@:<GZeuF`MOGCeeDU
AKYJZ@<-4+-TsL5.!8Ze6p#N`6p"CB<DlgYF]DC.4*=4k5t="Z9LqrW>!$k%5tsd0F[TYYCFLBD
@<Q""De*:%+>=63%14IX@<Q[4+Dae]D.Oi":gnB]F!j+3-u<g3@<?4%DI7[#Ci"$6F*)><AUYaV
3AWH63?U(7/iPX:+DG8,?Z^3s@<itL%14IX@<Q[4+Dae]D.Oi":gnB]F!j+3-u<g3@<?4%DI7'q
D.S/=0f_*L+?(Dt3%5tf@<Q""De*:%+>=63-Ve)nEcW@>:18!N+Ce5VEc#kF4ZY!-De!3tBl@lr
F_l2@FabGg0JkR.2]sk)+DtV2?Z^3s@<itL%13OO0H`%pATD4#AKW?d:I60uAS$"*D/!l1<cW7(
9L9k)9gg+(:EWPV+@:,l6??+H@;^.#F<Enk6#:Wc<)$135tk6#<)Q[<:18<dF!+%_F`MOG@o-TS
D0%'6$8<SV,\;")F(HIB4$"`\5uf%&5uo?^+=nW`HS-Ks+AP4'.4cTg/g<"m8O6>c$8<SV,\;")
F(HIAF]hF,+E^:E+B;*8;H4i^<E)=.F\GLq7j)qJ85E,e+AHEfBk1pdDK9e@<GZeuF`MOGF\Y4s
73HDA@;TR'%13OOF)>i<FDuAE+=BuO;c?+Q3]\C(Bldj,ATV:"Bldj,ATV:#D/X3$-ZWpBATMF)
?Z]^oDImiqF)>i2APPQE.WT6EATMF)?Z]^oDImiqF)>i2AKZ(H/Kf+ODeio,FCfN8F!,(5EZe=i
DJj$++Eh=:@WO.2$;No?%15is/g+hLFDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@H?
$;No?%15is/g,=KEaiI!Bl,mRF(Jo*Bl5%AAp&3:.1HVZ67r]S:-pQU+<XEG/g)tnA8-+(+FPjb
1a$=HC`k*CF`_&6Bl@lr-OgDX67sB'+Du=D@<?4%DI7*q?YjXuB5)I1A7]+Y:ig>XD.F(_:-pQU
+<YQEFCB9*Df/orDI7<kCh[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.F(_:-pQB$;No?+CT>4
F_t]23Zr'UDfp"A-us$CATMF).3N>G+Dbt)A7]9\$;No?%15is/g+YEART[lA3(hg0JYG$@<+(X
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OOCi<`m+=D2DF(KE(F=.M)%15is/g+hAB4rE,EbTE5+E2@4@qg!uDf-!k-oiG3
0ek+"0fBIJ%15is/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g+YBD/`p(AKX`jFCB9*Df-[hDBMAXCh[j1Bk(Rf+A?]kB5)I1
A7Zm*D]j43Cis<1%15is/g+YBD/aW>ARlolF<G7=FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS
@<?4%DK@IFDId='/oYKC%13OO:-pQU<+ohc@:NeiEa`I'+E(j7FD,5.@ps1`F_kK.Bl@l3A7]7k
ARTXkF!,R<AKYT-Ecbu+EZee7@<i:h:-pQUH#IgJB4Z0-Ao_g,+EV:.+A+CC0JFV\E,T6"+EqL5
@q[!!F!,[?Gp$[;De!I%+CT;%+ED%7ATS@g:-pQUAThX*Gp$^5Aor;@H"CE)F!,CA+EMHD@;]Tu
DIn#7@;KRpEbTW/D0$h9Bkq9&FD,B0+E)./+CT;%%15is/g+SCAKZ#)B4YslEaa'$A0>K)Df$V<
Derj&+EMgLFCf;3@qBIfF*),)C`mS+@q]:gBk)3:%13OO:-pQUFCfN8+Cno&ATJtJ+B;AM$@-K!
4ZX]@0JYF,1E\D-+=nWi3Aif>0esk+0d&"i1,1RB+>GVo0f(@'0fUj@+>P&o+=oPr0f_$I+?(E$
%13OO:-pQUF(f9"F<G+&FCfM9AoD^6@<,m$@;]TuF(KG9FD5T'+EVNE1,*B&0f<f/1GNqn<E'D7
An5RlF$2Q,An5LoBPhf5BPhfR3Zp13+>G_r1GK=GH#7(I4ZX^-De*9uALKbq0eb:8,CUk_D.G(G
FDk\uH#@OCH#7($$@-K!1-IZ@H#7(I+=eQ_,C+-:1+==j+=oQ-+>>?YA8#h$%13OO8jmba3Zp17
2D?g>2(g`q$8O:j1E\Ir0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>A.fD.F(_DKU%a
3Zqc`/het72`!-B2_[05:-pQUA7]B_$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah6k'Ju
67sBhB6%QpF!,RC+?(ERARfFk@;Kuo$9^$b-SR/3-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO8jmba
3Zp171H%6J1G1No$8FOu3?U%3+>GSn/NP"/H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kHZH#7($
$>t!.4ZX]m0J5%50JY@<1bgsD%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q:-pQU
@:sUlATJu9D]gt]A7]7bD..7%%156O+=Aiq2^]^r3$C=<.3KaNF`\`W3Zr<_@grbS$;*^.4ZX]@
2)$a>3B/WK%14jF1Gp:01*A;-+>#Vs14+:`A.8l<7!'P7+A,$b3Zr0[Ch@]t@;I&AH[0I=%16uq
F?MZ-?SF)d0JP@A3B&iS0b"J-F^mQq+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$;No?+CSo'
AS#p*FDi9Z+Co%nBl.9pEt&I>0-DVr/i>"!-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,CjK
2)7*C2%9mI3&!$/1*A:o/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\H#7($$>t!.4ZX]m
0J5%51,1IB3&!6L%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m
3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc/2`WiX/i=(F0f_$I+?(E$+>#Vs1jaLbA.8l<7!'P7
+A,$b3Zr0[Ch@]t@;I&CH[0I=%16uqF?MZ-0J5%51c7-I0JtO?%16uq@m)jqDKU&0FD5Z2?YjXu
B5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>;67sBuDf-[O+B;A`
FD5T'F!+1cGp"gm+>PW)2BX_13]&WR1,9tP<"01,7!(RQ+>Pc21H76N/hf4=2`NQL0K1gB2[p*d
6p3RRC3=?)EarNo+>PW)2BXk.0d%thAn5LoBPhf50f'q/1E\G.%156O-SR/5-Qjfs+Z_A-+A,%D
+=oPr8jj*qDKU%a3Zqc`/het52)-sE3AE<!$>sur4ZX^'F`_&6Bl@lrCi=3(BlnK.ARAtEF(lah
6k'Jd0-DVr/iG("-o`A21+==gDKU%D/34nkF^kjf%15]qF?MZ-1,LmC1,1I81GgpC0K;!O2DR9N
%14L;H[0I=1+==t3Zp131,C%5/2At'.j/G7BPhf"$;*]L3Zr0[Ch@]t@;I&?H[0I=1(=RR0./G+
3@>pt3$C=<.3M5NF<E+q+A,$2$>t!.4ZX]m0J5%51,1OB0K(pJ%16uq@m)jqDKU&0FD5Z2?YjXu
B5)I1A7]+Y:ig=n8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc02`N`M
/i,=@0ebRG3ArWQ2@U!A0me1_A25SV/NP"/3ArW82_6^@+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r
0me1_A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-?SF)d0JbOG1H.!B1CX\/F^mQq
+Du=D@<?4%DI73uDJ*[*F_#&jA5I>]+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQEF<E+q+Du=3%13OO
8jmba3Zp180JY@:2_HmC1bg[D2`WcO3Aq<R-o--pD.GCN+>#Vs1,1RE+>tc1+=eRHA8#h$%15]q
4ZX^#F_kZ1@ps0r14+:`A24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uqF?MZ-0J5%51,CpN
1H@3L%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541+=K2m3\i-,+Du=D
+=oPrDKTFu$4R>77!(RQ+>P`33A`NK/i,=@0ebRG3ArWQ2@U!A1OFCaA25SV/NP"/3&!*12_6^C
+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r1OFCaA24T$4YJ0:/ib:%-o`A21+=><7!'P&3Zq$_%16uq
F?MZ-0J5%50fCsL2`3BF%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n8jj*q4YIp*0J541
+=K2m3\i-,+Du=D+=oPrDKTFu$4R>77!(RQ+>Pc/3&NWP/i,=@0ebRG3ArWQ2@U!A1jaLbA25SV
/NP"/3AWT:1+Y.6+=eRHA8#h$%15]q4ZX^#F_kZ1@ps0r1jaLbA24T$4YJ0:/ib:%-o`A21+=><
7!'P&3Zq$_%16uqF?MZ-0J5%52).$J0JkO?%16uq@m)jqDKU&0FD5Z2?YjXuB5)I1A7]+Y:ig=n
8jj*q4YIp*0J572+=K2m3\i-,+Du=D+=oPrDKTFu$4R=O$;No?+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+Cf>,E+*cu+AR'$
@<?4%DBMMg+AZH_BlS90FEo!)Aft&dAKXEOCh[j1Bk&9-D]j43Cis<1%15is/g+YBD/aW>ARlol
F<G7=FDu:^0/%3SDfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@IFDId='/oYKC%13OO8jmba3Zp17
2D?g>2(g`q$8O:j1E\Ir0esk'3Zp,'H#7($$;*^.+?^i>6p3RRC3=?)EarNo+>A.fD.F(_DJs*.
4ZX]>/het71,(O@1-%?T3$:s_/g+\9B+52cDe3EA3Zr<_FCB9*Df/p#@VfauF_PrC?Y*_`BlJ0.
@p`b8E-"EYB-9f7%15is/g+S8Eb/g'+EVNE1*C+=@qfdgCi^$m4YIp*0J5+.+=K2m3\i-,+Du+/
F<E+q+Du+/@grbS$;*^.4ZX]@1c%$M0f(F>%14gM2)ud61*A;++>#Vs0me1_A.8l<7!'P7+A,$b
3Zr0[Ch@]t@;I&@H[0I=%16ukATU'r+C?fT0JG7@1,:gJ1GpmA%16ukARdka+Du=D@<?4%DI7<k
Ch[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2$9^$b-SR/1-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V
%15]qF?MZ-1,Ua?0f_3G2%9mJ0f([00esk+1E\81+>S:hD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r
14+:`A.8l`De4#R3Zp+/0JG7<0f_*L2Dm0C%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOj
E-,f(?XuTEF$sSP+A,$2$9^$b-SR//-Qjfs+Z_A-+<YQ?ATT%G3Zr<YARc/V%15]qF?MZ-1,CjK
2)7*C2%9mI3&!$/1*A:o/NP"1H[0I=%15]qF<E^h8jkg'+DQ%8Ao_BiC`kN\H#7($$>scnF?MZ-
0J5%51,1[E1cR3M2DbjMDJs)r4ZX^'F`_&6Bl@lrDdmNsEHPu;H!b,mCh[j1Bk(L\7<!<9AS3,X
6k'Jd0-DVr/i+jt-o`A21+==gDJs*.+=oPrDJs)r%13OO8jmba3Zp171,h3Q3A*/u$8FOs2'=h#
2BXS4+>eFjD.F(_8jmbD4Wm?b4ZX^#F_kZ1@ps0r1jaLbA.8l`De4#R3Zp+/0JG1?2`*6J3&30J
%16ukARdka+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+A,$2$9^$b-SR/0-Qjfs
+Z_A-+<YQ?ATT%G3Zr<YARc/V%14d30I14M@<6!&-[BQ>+F.g71*C1>BPhf5BPhf58jmbD8jje>
F`\aDF^lP3De4#5DJs)r-OgCl$?L'&F`_SFF<Dr-5uU]N6om@OEbTT+F(KH#FCB')ATD.!D/X3$
-N                                                                        ~>
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
0fV!40fU:3+>bbp1*A>23A;R21a"Or0fV$I1a"P-+>P&r1c[H:0esk,+?)#2+>Ghu1*AJ50H`)-
+>P&s1c7061,g=2+>Pi60H`,-+>P&t2`!BI+>GVo1*A>+2`WZ:0f:(/+?)5:3?U.6+>P&s3B/r?
1-$I4+>c#;3?U.8+>P&q2_mB90ea_*+>ki3+>G_r1*AS70d&5,+>P&q2)R9L+>PVn1*AJ72)6:0
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
1GCX@1MSX$1,^pK$;No?+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sBi@:FLhFDk\u
Gp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<i:h:-pQUAo2Ws
FDk\uGp"4P:-pQUAoD^,@<<W6De*:%+Eh=:@WNZ4ATN!1F:ARP67sBp@<Gq!De*:%+<Ve%67sBu
@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7A79`m$;No?+Dbt)A92j$EcW?G+AP6U+Dbt)
A9/l6Bldj,ATT&9FCB24A79Rg%15is/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&B45mrDf-\=
FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uGmt*U67sBu@<Q0iH#.29F<D]$67sC%CO%%D@:iqgBco<@
0Hb:CF(KB8Bl7Q+Ch[s4+E(j7FDk\uGpdYUDII^&B45mrDf-\=FCB32%15is/g,1KF(KE(F<D\K
+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-Du$4R=b+<Ve=D00-,De*:%+DtV2
?Z^3s@<iu3De!3tBl@lrBQ%a!+>=63.1HUn$;No?+EMC<F`_SFF<Dr+67sC(D.G[M-Qjr_/13,&
E'-3)5&i\H+?hJ10IItk3$C=<.3MYc6um!_ATMF)%13OO@rGk"EcP`/F<Dr?@<6!-%16T`Bl8!'
Ec`EH-ZWpBATMF)-OgD^:IIuc8mu4FF%B_LCNEj"A26(e>?rXl@:O(oC2[X!DeF!1Bl82KE,K;;
+Br5g@:O(oBOPCdF'p+=;e9cV@ru9m+A+4V@:O(o.3MSc6r.):BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05=p*CNF/t@r$-7%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`-$;b;OA8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,AoD]4?qOj;CNE$T@r$-n
/e&.eBOr;q@<6!&1H$@G<CoS$CLqc6BlbD<FCAWpAKYo7ATAo8BOr<&BkCpuBl.E(De:,#+EV%5
CG$&'6?7!gF(HJ9BOr<,AThd/Bl@l3BPDO0DfU+GDe:,6BPDN1Anc'm+EVNEEb0E.ATo8,BOPdk
ATKI5$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dSD0RdQ@Php\EbfQ8EA`#ZFEh>/Aor!$?Tqj?
6Z6j`Bk1dq+CSekBl7Q+F*2@CEbTT++CT.u+EM+9+Cehr@s)TrFD5Z2F!,RC+CK5(F(KE(FC655
D]iY+Cij6/%144#+EMX5EcW@FD]ie;F*&OHBQ%s'+ED1;Bl7Q+@;]TuF(KH8Bl7Q+GA(Q*+DGpF
F!,"%Ebd3KBeEsL+Cf,/Bl#=CDII[0Bk(Rf/0JABFE2;;Df'2sC`m82F))n,DIal#@<ZTA%144#
+=KWR:.69\0JYFmE,m]i.1HUn$=I(LDIb>@De*cl?k!HOFCB&B?Y+IlASb^qG]Y\u=UA1:=YEk`
=>*e`5u^-F-s83*.1%1a<'a87-s8*'.3]'B5u^-F1+66U=XbO$5u^-F-s/-*.1HV<#quZ16qLE4
0Hg`I6qLE40Hg`I6qLE40Hg`I6qLE40Hg`I6qLE40Hg`I6qLE40Hgl4/MRPd#q[k</MRP`1c5Ro
1GoIj1c5Rk1c5^L0aTEd#q[k</MRP`1c5Rk1c5Ro1GoIj1c5^L/MRP`0aTQ@0aTZo#q[kf2$kih
1GoIq2%9mI#r)`@#r)`C2$l)s#rFLG1c5^L0F9Hn#quZ16qLE40Hg`V#rs[G0F8sl8QIJu+Unc5
#r+@F0J5%:3&iZL2)7/u0fKCp/i,CD1c@$G2DYY!2D-mD1GpsK1GfCo/i,CD1c@$G2DYY!2D-mD
1GpsK1GfOJ1'oZn#r!td1,T@t#raIk1,Ua?2D[0M#rj[m3&`ZS3&<HM#raIk1,Ua?2D[0M#rj[m
3&`ZS3&<HM%14lt0f97k/i!_j#r+.e1GCgL1GUdG#ragr2E<HF2E*KL#r+.e1GCgL1GUdG#ragr
2E<HF2E*KL%14ou0f01j/i#CD2_d-E3&V(!/i<qi2(gmG2)@6M3=.W$/hf.>2D?sB#r+:i3A`TL
3Aif'2`*-@2)I3F1bfFH2$kun#r!tf3&ENJ2)@3L#r4+k#r44f0JbXF0ek@<#rXaq3ArWL3&ioW
#r44f0JbXF0ek@<#rXaq3ArWL3&ioW%15!"0es%h/i<qj#r4Ck2)[<G2)-gF#rXRl1c$sK1cRHM
#r4Ck2)[<G2)-gF#rXRl1c$sK1cRHM%15$#0eitg/iGLD1H%$I1H#Oo/i>RB1bq$J2_bUp1+kCB
0ek[D1-#Xu2_HsC3&iTN2_bUp1+kCB0ek[D1-#Xu2_HsC3&iTN2_baK3!h;n#r!tk#r+%f2$l&u
/iGRI3&!<I2$l,p/i,=<0f^sI2$l&u/iGRI3&!<I2$l,p/i,=<0f^sI2%9mQ#rr;H#r)`C2$l)s
#rFLG1c5^L0e`nn#r+%f2$krh3!hGs/i,=<0f^sI2$l&u/iGRI3&!<I2$l,p/i,=<0f^sI2$l&u
/iGRI3&!<I2%9mI0aTcF0eP=B0f1XF2)d5r0J57>2D[6I2D[5t2)d-F1,q6I2`EGt1GUR>2_d$I
1,:ir2)d-F1,q6I2`EGt1GUR>2_d$I1,:j!$8F:B2@2,F0J53h2DZsB1Gh*K3&iZ"1,^aB2Dm0G
0ekWo2DZsB1Gh*K3&iZ"1,^aB2Dm0G0ekWs$8F=C2$l#j2@2&i1H73L0f:aH2$l0#/ibgF1cRHT
2[M5o/hf(?2)-g>1C5s!/ibgF1cRHT2[M5o/hf(?2)-g>1CX[G1^PuF1G1Nk0J5+?2)d6H1,q/u
2`*-@2)I3F1bf:k2(gmG2)@6M3=.W$/hf.>2D?sB#r+:i3A`TL3Aif+$8FCE1C5oF0J5*e2`NEJ
3A<-F2`3At0ek::0KD-L1,Lor2`NEJ3A<-F2`3At0ek::0KD-L1,Lp!$8FFF1'ooH0J5(82$l5t
/iYdH3B/fQ2$l2o0etU?0fCgE3=.Z#/iYdH3B/fQ2$l2o0etU?0fCgE3=Q<M2[M2F0fKCm/hf.B
3&39I1-#Y#2D-mD1GpsK1GfCo/i,CD1c@$G2DYY!2D-mD1GpsK1GfCo/i,CD1c@$G2DYdL0fTIn
#pVi0<\H-M#quZ16qLE40Hg`V#rs[G0F\@C#q[nf#quZ16qLE40Hg`V#q\.k#r+Cn#pVi0<\H-M
%14[A#q[ne#r!tc1cI<I3A<9L#r44A1+kL@2D['A3B8o&/NGR=2_m9I0ebUJ#q[kj2_HjE1H%3Q
#rjjr1,h!I3&rZI%14[B#q[nd#r!td#r++?2(ggB0JtjH0f(`p/NG[@2_d!D3AWBH#q[kj1bLOC
3A`EJ3=.Z%/i#CH1b^gI2@U!F1C5Wf3=.Al0f:mL3A`ZN2[MAp1G^gC1G^gC1C6#n3B&]O1,_$F
2$kip3%d3M1,^mG2DGLi0fLg>0JYRC2`!8s3&*$>1,h!J1G_$#$8"(@/MT3k0J5+91,:U?1,:Tk
1bLWl0et@=1,q6I2`EGt/MSq7/i>CD3&!9M#q[ki2_HpG0ek[D1C6!!/i5LA0f_!E3=Q<I2$kih
2[M/j1-%0G0fM!I2[M8m1^Plp/i,II2)I!C1C5Wf0K(O>3&riQ0Ja"e0fCg?2DHmB2*!T%2`!'E
0ebFA3Arf*$8".B/MT-i0J5.?2$l#j2E!HO2E!HO2[M5n/i>LE0JkXB1'oNe0eb4;2)[-F2)5Ii
0f:sD1c.!K2)I9!2E<BH1c%-L1cIB'$8"1C/MT*h0J51?2E!HO2E!K#1+k:<1,q-M0f1Zm1,U[<
0fD!O1Gh&t/MSt;/hf"<3&rcP#q[kh1bLdJ1GLRA2$l/t/ibmI0ebLC1(=RB3!h/k1^Pig2)d6H
1,q-M0aTQe2`1ms3A*6I1cRHL1C5Wf0f^jF1c.0O0f'+f0f:X;1,UpD0fV)u2D?a=2)R*C3&_9R
/NF+h0f'+i/iG^F1GCaG3ALmq/i5CA1c.$G1c,Lp1bL[H2)-sE2)>Oj0etR<2E<WL2)@)r/MT(>
/i,1<3&ENN#rORm1GCXF1c@0L%14[A0F9<c1'oWe3&<?H1G^gC1C5cg1'o`s/iYOB2)d6D3=.8l
1-$sH0Jt^H0eitd0f1R:0f_'I1,q9#2)$X;3A`QJ3&r]&$8!te#q[kd#r)`@#rFLG/MT%=#q[kf
2$l)s%14[A1'oNe0F9Hd1'oWe3&<?H1G^gC1C5om/ho@C1bq$N0aTEd1b^O:3A`QJ3&q9s0etaA
3&!3I2_d#n1H@'I0Jt^H0ebTs$8!tg#q\.D0eP:>1c.$G1c.#q0J57D1,CUC2E<N!2)R!B0JkaG
2Dd?!/MT(>/i,1<3&ENN#q[ke1bL[H2)-sE2$l&q/iG^I0f:aE1CX[C0f01g3!h;l2`1mq/i>RB
1bq$J2_bUs0J5+<2)-gF2[M&j2)$X<2)R*C3&_-q0ek[@2`*?N3&*2q1-$sG1c.0O0f'7G/MT*h
/N3tk/ho1<3&NWL1c#Fl/i5IE2E!HO2E(q#1bLdJ1GLRA2)5Ii0f:d?3B/fL0K(cp/MSt;/hf"<
3&rcP#r4@j0JPIF3AWKO%14[A2@1rn#r4+k2E!HO2E!HP#r!tf2`1n"3A*-F1H@<L2`M*q0f:sD
1c.!K2)I9!/MSt6/i>LE0JkXB#r41e2)R9G1c7$D%14[A2[M&n#r=1j#r!te3A`HF2`<KO#raXm
2DHmB2*!QR#q[ki1G1R?0JkXI2[M&j0K(O>3&riQ0Ja"i2D-dF3AiWI1G]II/MT3k/Mmbj/i<qh
/i#1;1,:U?1,9.p2_HpG0ek[D1-#Xm0fCsC1cI-D3ANAs/MSq7/i>CD3&!9M#r+1f2)7-N0K1pF
%14[A3=.8n#rXCl1G^gC1G^gC#r!td2)dKT1cI3L#rjXl0JYRC2`!6M#q[kj0eP.82`!BK1^P`o
3%d3M1,^mG2DGLt/ibjG2DR0K0f9CI/M]!d/M[Ve0F9Ec0aTfr/i#CH1b^gI2@1ri2`*-B3&rfL
2E;'q3AiEJ0ebIF1GL]m2(ggB0JtjH0f(`t$8""f#q[k<1,0(h/hf+@2DI3G1cPe$2_HjE1H%3Q
0JNkc0fM$D1,h!I3&q9s3AN3G1,^pC0KD-"1+kL@2D['A3B8o*$8""g#quZ16qLE40Hg`V#pVi0
<\H-M#r+Cn#q\.k#queq0F9<c3!h8F,=G+(0/+OU0F9<k0F9Hn0F8sl8QIJu+Unc5#q[kj#q[h`
0JtgL1,CdC3=.8l2[M&l/i,CD1c@$G2DYXk3&WBI1G^mE3AWJu0fM!C2D[-H1H@5t/N>X@2D[-H
1H@6J%14is/MT-i/MJe31,T@i3!h/q/ho+=0JPIA1cYjo3&3*G2`*NS1H%)s0fLj?3&`ZS3&<K"
/N>L<3&`ZS3&<HM%14lt/MT*h/MJe4#q\"@/MSt41GCgL1GUdG#q\(q/iG^D0K(jI1C5co3%d*L
0JGCD2$kin3%d*L0JGCD2)>[K1^P`g1^P`f/i#CD2_d-E3&V'p1G1Nk/MT+83A`TL3Aif'/N5L=
0Jt[F0JkKj0fCj@0Jt[F0JkKj/N5L=0Jt[F0JkKn$8i,A0f'+f0J5.@1c@'G1H75u/M\q:#q[ne
/hf(?2)-g>1C5Wk3%d3L1,LsM3B%7!2)m3K2DR*K3=.8q3%d3L1,LsM3B%BS2@1ri1'oNd/i<qe
1'oNf2D-jF2)$mB0fTIk2DZsB1Gh*K3&iZ"0f:a>1c$sK1cRH$/N,C;1c$sK1cRHM%15$#/MSsd
/MJe81H%$I1H%$I#q[ka2)d6H1,q-M0aTEf1+kCB0ek[D1-#Xm2)d-F1,q6I2`EGt0f1gA2)7-N
0K1os/N#I>2)7-N0K1pF%15'$/MSpc/MJe:#q[ka1,T@i1H7!F2*!WM3&3>t/N#781Ggd?3AEHM
#r+7k/i,=<0f^sI#q\"h/i,=<0f^sI2%9mQ#q\.D/MRP`0aTEg2$kik2$kun2$kik2%9mI0F9<j
#q[ka1,T@i0J5<k/N#781Ggd?3AEHM#q[qm/iGRI3&!<I2$kum3%d*H3B/]P1C5Wh3%d*H3B/]P
1,TLJ0eitd2[M&j/i>RB1bq$J2_bUj0J57>2D[6I2D[5t/N#I>2)7-N0K1pF#q[qg/i5LA0f_!E
3=.Dq1+kCB0ek[D1C5Wh1+kCB0ek[D1-#dN0es%e2@1rj#q[h`2$kim1G1L?1c[BP3&1dl1,^aB
2Dm0G0ekWo0ekR=2)[<G2)-im/M]4:2)[<G2)-gF%14gG#q\"@/M\q:#q[h`1H73L0f:aH2$kim
3%d3L1,LsM3B%6r1,1C81H.0G0ebBi0ekC80JbXF0eitd1,1C81H.0G0ebBm$8F@D/Mmbc1G1Nk
/MJe43&NWL1bq$K#q\(m/hf.>2D?sB#q[kh/ibaG1H@<Q#r++k/ibaG1H@<Q#q[kh/ibaG1H@<Q
%14gI#q[q>/N!hd0J5*e/N5XA2E<HF2E*KL#q[kd/i,1A3AWEI2[M2m0eP793B8lN2$kih0eP79
3B8lN1cGjN0fB=i1'oNl#q[h`0etTm/N>L<3&`ZS3&<HM#q\(g0etU?0fCgE3=.])/ho+=0JPIA
2$kin/ho+=0JPIA1cZ!P0fKCj0aTEd2[M&i/hf.B3&39I1-#Xm3&WBI1G^mE3AWJu/Mf"82E!BM
0K(gF#rsdo1H%-J2D@$I#q[qc1H%-J2D@$I1CX[G3!h8F,=G+(0/+OU0F8sl8QIJu+UKh/3A:an
%14cq0fTIn#pVi0<\H-M#quZG0F9E>,=G+(0/+OY$8!t=0fKCj0J5%:3&iZL2)7/u/MT0j/Mf"8
2E!BM0K(gF#rsdo1H%-J2D@$I#q[qc1H%-J2D@$I1C5Wm2D-mD1GpsK1GfOJ/M[Ve2@1rh/ho+=
#q\+C/N5::1,Ua?2D[0M#rsps0etU?0fCgF#q\(g0etU?0fCgE3=.8s1+kOF1c[NO2DkpN/Md\f
2$kig/i!_b2$kih0eP793B8lN1cG^q0JP190KD-L1,T@i0ek::0KD-L1,Lor/N5XA2E<HF2E*KL
%14[D#r+7C/MJe43&NWL1bq$K#q[qc2$kih2(gmG2)@6M3=.Do2(gmG2)@6M3=.8l2(gmG2)@6M
3=.8r1bLI>1c@$E0b"IA2$kun#q[h`1H73L0f:aH2$kii/iF"f1,1C81H.0G0ebBi0ekC80JbXF
0eitd1,1C81H.0G0ebBi/N,R@3ArWL3&ioW%14[F#r+1A/MJe7#q[n=/M]4:2)[<G2)-gF#r+.m
/i>OE0JtR?#q[nj/i>OE0JtR>3!h/p1G1L?1c[BP3&1pM/N3tj0aTEc/iGLD1H%$I1H#Ok0eP=B
0f1XF2)d5r/Mf.71cI-D3AN?M#r+1j/i5LA0f_!F#q[qg/i5LA0f_!E3=.8p2_HsC3&iTN2_baK
/N=%k0F9<b/iX.h0eP4=#q[qm/iGRI3&!<I2$kum3%d*H3B/]P1C5Wh3%d*H3B/]P1,T@i2)-^>
1b^XE0fLs!$8"7E3=.8l#q[k</Mo<k0f(Zn/Mo<k/Mo<o$8!td#ri5C0eP4=#q[h`3!h/o0eP7=
0JPRB2`1mr1bgU=1b^XE0fKCj2)-^>1b^XE0fLrr/Mf@=2DmKS0K:gF%14[A0aTcF/MSk82_d-E
3&NWL#q[h`2D[6I2D[6I2@1rm2_HsC3&iTN2_bUn1cI$E1,q6I2`D$p2)d-F1,q6I2`EGt/Mf.7
1cI-D3AN?M%14[A1'oiF/M[Va0J53h/N,C;1c$sK1cRHM#r+:n/i5@@3A`]T#q\%k/i5@@3A`]T
1'oNf2D-jF2)$mB0fTUL/MT$f2$kii/iF"f0J5.@1c@'G1H75u/N,R@3ArWL3&ioW#r+:s/ibgF
1cRK%/N,R@3ArWL3&ioW#q[ne/hf(?2)-g>1CX[C0f01n#q[qc2$kig/i#CD2_d-E3&V'p2`*-@
2)I3F1bf:k2Dd$?2)I3F1bf:g2`*-@2)I3F1bf:g0f:RD1c7'L2)u*Q/MT*h1C5Wj#q[h`1'oNk
3%d*L0JGCD2)>On2E3<I3A<-F2`1mn2`NEJ3A<-F2`3At/MSt41GCgL1GUdG%14[A2@2,F/N=%g
0J5(82$kio1+kOF1c[NO2Dkdq2_m!F2`*NS1H,Ul3&3*G2`*NS1H%)s/N5::1,Ua?2D[0M%14[A
2[M2F/MT0j/MJe22)mQN1GppJ#q\+p/iGLA2)@6K1^Plq2D-mD1GpsK1C5Wm2D-mD1GpsK1GfCi
1G1IA2Dd<G2E!?#$8!tl#quZ16qLE40Hg`V#pVi0<\H-M#r+Cn#q\.k#queq@UW_kCi=3*@;]Fi
DfT]'CgV7*@<-Er@rlfK2Xe8m84cW/85_!V@;TR,FE1f-F)59,Bl@l?Bk1dmF=^0e9M?ug9kAET
6t(1G%15$J3B&KG1H-jZ_jX7A93"k4`M(2C+@K4-+Du<RDKRL0BOr;qEbT0"FCfN8+EMX5EZf:4
+EV:.+Auo_@W--,De:,6BOr;UBlds!F"CmE@3ABf@k9/^,"u]lF<G(6ART[lA0>>iF(Jl)Df-\3
A7]Y#BkD'h@<?4%DK?q0Gp#ChAU%X$A7]d(8oJTYF!)lLDIjr0@;odu/0K"P+Ceu'FCAm$Cj@.@
Dfd+DBOr;uBl7?q+EMX5FCcS5Afu2/AKYE%F=ACC$91%"1FtC@1Fu8<RS4hq7nFiBTu3QH;aEnr
iOGmf:+T@XAKYT*Df0Y>F*(i2+E(j7FD,5.BOtU_+E(j7FD,5.883*UA0=TTDCf7.FC?:XEbT*,
BlbgV/6$:sF!+t$DBLSTF(fK7Ch+YtAKYQ/FCf?#ARl5W3B/uT/2f4A/5=$N9H_6HEZi>p_kA2O
5t<'V\>iP(/6$:o+ED%%EZfFF@<*K/Afu2/AKYYt@:UL!Afu2/AKXNXEb/c(9jqoj@;Kmr@3@jV
Be1edA79RoDJ()+DBL]PA0>PoCh=f.Afu2/AKWQZF*&OABl%TsDJj02D%-h,2`EEG/28k;2(VJ>
RS5;-_jX7M<+ohc6?6d]FDPM>ATV?'<+0oiBe1ed%14jF1bpd:0f1aH/89/JCh5=T/6$:o+A-'d
+E(j7FD,5.6?R*\/7E@6BON#_@<HU)/1`=]$8OLr2)-X:3AE3=`Lp4/+@f!n8Q$\MTu3QH<D:<!
/6$:o+EMIDFD,6+DBRqhVBBeh+EV:.+@BgNEbTH6/:(lL@3ANXFY#'p%14jJ1bq$A0fM*I/5oPH
+@f!n8Q$\MTu3QH;b8N>BOr<(DfTr5ATDZ2iddmKDe:,6BOr;RBOPpqDfdO>ATV?'<+0o#/1_5;
1-%6M2(UL<0fCRW_jX7A8Ol>p_kD)n`M(2C+N:$c/TAV0F<F:D`LneW6,fKJ<+ohcAo_g-F<GXH
@<*K/Afu2/AKXrrBl5;>+D,1rF=_!F@3A'OD(I4h%14mF1Ggm=1,:gI/5=$N9H_6HEZi>p_kA3l
Tk,fp_l\#'9gQak/PSOMTIa&UAKZ#)@<*K3FCB24De:,6BOr;cGA1qBF!,(+ATTJ?FWa1cD(I4h
%14mG2E3EB1,La@/58FLTIil(`Ln?mTu3QH;b9eO/6$:o+B3Q!DC9KJF*(i2+Dtb!EZfI;AKXob
AT2<oEb$_6@;R,WASitL/.DqB2E3QJ/2B1F0e?$b`LneW6,fK>8Ol?'<+ohcAo_g-F<FP,Bl5&7
FCB2@@;Kmr@3A'OD(I4h%14mM3&3BC1-%?K/58FLTIil(`Ln?kTlM\`BOr<,ARTU%<-N%o+EMX5
E\([2FC?:^ASitL/.DqC0f^pJ/2K(?2CqS?RS4hq7nFiBTu3QH5tjs<+N:%lTcd9*/6$:o+D,Y4
DKI"BFCB24De:,6BOr;REa`E"FDi:DBOr<(DfTr5/7ip3+@C$V/1`=]$8aIs1,:C:1Gq*B9uEDn
+A#'p+N:%lTccWp9L0f?Tu3QH<D:<!/6$:o+D,Y4DKI"BFCB24De:,6BOr;REa`E"FDi:DBOr<-
Dfp/8/9GQ:FC?:ZDIY4K/.DqC1,psG/2K+>3@mnBRS4jATlM9pTu3QH5tjs<+N:%lTcd9*/6$:o
+ED%%EZfFF@<*K/Afu2/AKX?\@:C@$D]j.8AKYl/EcbtGB45X"6Z-Bb/1_5;1bq'G0e>+;2DHaW
_jX7A_kD)n`M(2C+@/[p5p4.?_kA2Q9Z*8L<+ohcEb/["+EMX5EZf:4+EV:.+@C0X@N]c2+EV:.
+EMIDFD*49AScHs+@C$V/1`=]$8a\%0K:U>3&`WE;aEnr5qGuKAKYYt@:UL!Afu2/AKXZ\Df.+;
E-!-qAT'+N/.DqC3ArcU/2K:G1+Z+!7mTg"<+ohc95/9V/7E@6BON#WAT'+N/.DqD0fCdD/2T(;
1Fu8<RS4i'<DjsYTu3QH1a#H/RDkgA_kD)n9N=SK9Is.VAKZ&2@;Ka&F*(i2+EqL5@q[!!F!*:^
@s)6pFE8R6AS>dqA0>u-AKXW[DJ(M@BQ#"eAT'+N/.DqD1cRES/2T.?3@mZl`Ln>H<DFZ&/6$:o
+B!?!E$0(2+EV:.+A?KfDCfmCATV?'9P&,n/1_5;2)dHO2_6dC1b^IN8Q$\MTu3QH5qGuKAKZ#)
@<*K&Df9_?De:,6BOr;[Bl@l?@V'Xi+BE2s/1`=]$8sV!1bgO<3&3?B6q'd<+N:%lTccos8K^;c
;b9_8<+ohc;e^,^Ch4`1FCB24Bl5&*Ec5i;+E(j7FD,5.7Wi`lDg*aF@;R,fBlYaU/.DqE2)I6K
/2]+=2Cqcm1a'c2_kA2=6;pHN/6$:o+C]A*B4uB0F*(i2+E(j7FD,5.7Wi`lDg*a@CiF&r+BE2s
/1`=]$9'^u0Jb7;2)?p;;T"Jh+N:%lTcd?/_jN&TBOr<-Dfp/8ATDZ2E+*d/+E(j7FD,5.;e'6P
ATKD2CiF&r+A?KY/1`=]$9'e#3&N6E2E3QF;T"Jh+N:%lTcd9*/6$:o+Du+<FD,6+DBNn,Ec`FB
Afu2/AKXo]@;KLr/7N14@3A6X@Os&]%15$R1b^X82*!NM/5=$N9H[&0;H6%?+N:%lTcd9"7j(=>
ND_?-5sd,%BOr<'Bk1ajAKZ&9@<*K/Afu2/AKYYt@:UL!Afu2/AKXo]DfTf2Df.+:AScHs+B)cg
/1`=]$9'q(1,(7:3B/iH9uEDn+Cu\7Tu3QH;aEnr8&L<a/Q>#&/6$:o+E_XBATAo7FCB24De:,6
BOr<"ART*lDe:,6BOr;b@rHC,Bl@l?@V'Xi+B)cg/1`=]$90^u2DZmB0f(X;;b8es.!0-6+D5V'
.3M;uF(m16CiF&r+B)cg/1`=]$90k&2_Zd@1c7'?9uEDn+A5^4+N:%lTcd!";D]N8TkS<c:dHX3
BOr;qEbT0"F<GXH@<*K/DBO%7AKZ)/E$0(2+AcKUBl%j!B.%aC@<-C,G:[iLATV?':N0tu/1_5;
0eb:;1c6gC2`EWG;b8*+_go_!/6$:o+@pEkDBNk0+EV:.+@g?YF=fsrF(d+6ATV?'6Xapb/1_5;
0ebLG3&N6H1,h0D9uEDn+A#'p+N:%lTcd96iOGmf;BS\"`Lnb]BOr;uEc5i;+EMX5EZf:4+EV:.
+@g?YF=h*=F(d+;@;R,S@;mbK/.Dq@0K1jH2CpgD1,:CT_jX7A_kD)n`M(2C+B);!\>iP,+AG/@
TIa&UAKZ#)@<*K3FCB24De:,6BOr;VDdd`>Anc="/7`=.FC?:Z@;mbK/.Dr#@<Gpp@;TRd?ZU<t
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
@OqrqCi<flFD5Z2?Y*_i1,^pF/i>=:0JG1'/N,UA0fLd?0JFV$1bLX.6"XbC@;]e#FCB&J94;:P
C^g_.0eP7<0JG17+>#<./iYU?0JG1'/MSk3+@0gQ@;]df3`Kg6@;bB?$8XOl1,Ua>0JFV$0J57@
0JG17+>#<#0H`YtB4Z*t@6.>$A8*/qAS`JT@U`ni%14pI/i>=:0JG1'/MSk80JG170H_r%/heD6
DId[+Ea_!pDId[+Ea]Ca/N>@B1GCL:0H_r%1G1F?0JG17+>#<#0H`Z!B5_Tp3_X[)DId/b$8"%j
/iGXB0JG1'2)m3G0JG170H`/(0H`Z%B4Yt&Bl7??6?QjWDf[$eBl[d+%14[H/het50JG1'0f1L:
0JG170H`)&0H`Z&@qBP!Bl@l38TP=J/Mf493AN9B0JFV$0f(dA2)m9D0JFV$3A*036$76jEa`cu
@6-\bASbdhA7Z2W/M]+72_Zp>0JFV$0f(U<3&`NF0JFV$3A*036$76jEa`cu@6-\jBk(]s;fHbk
DJ+#"$8""l/i>=:0JG1'/MT+=/het50JG1'/MSq30H`Z(F*)G2Ch[<=6?6d]@UX.c%14[C2(g[=
0JG17+>#<)3A*$B0JG17+>#<%/heD6F`VYF@;KXd3^[=n@V'S#@1<Pq0et@;3&!$?0H_r%1GCFA
0JG170H_r-/i=b;F`VYF@;KXd3^dCsGA1q($8"%h/ho+80JG1'/MSt;/iPR?0JG1'/N>@:+@1-k
FE1f+Bjj%lEb0)rDKK]+%14[D1+kR@0JG17+>#<)2_Hm?0JG17+>#T+2'>2-F*)G2Ch[<=88hsG
Ec_`t/Mf=<1c6s@0JFV$0f1^>3B&WG0JFV$0eb46+@1-kFE1f+Bjj%sASbgoF`MA2%14[C0ePIF
0JG17+>#<&2(gjD0JG17+>#Q*0H`Z(F*)G2Ch[<=:h=ZhBFP;#1G^X@1b^U;0H_r%2)-^<2_Zp>
0H_r%0J5%%6$76jEa`cu@6.>4A8Yt(%14pN/hf7=0JG1'/MT+81H.!A0JFV$0eP.&6$76jEbSrC
7ri$a%14pN/i#C?0JG1'/MSt41bpa=0JFV$0eP.&6$76jEbSrC8T&Ee@WHU$CCLV-2D-sC0JG17
+>#<*/i>L?0JG1'/MSk3+@1-kFE2)(3_X+!@W#n%H4:3<3%d!B0JG17+>#<)/i,180JG1'/MSk3
+@1-kFE2)(3_X7*H4:3<2_I*E0JG17+>#<(/hf.:0JG1'/MSk3+@1-kFE2)(3`BI'H=D#;B+52)
3%csA0JG17+>#<+/i,F?0JG1'/MSk3+@1-kFE2)(3`]s+DJikl$8OIk0K:a?0JFV.2_HmB0JG17
+>kc*+@9LM@;TFo3_j+)F('2#$8F=h0JG170JFV,3A*!>0JG17+>kc*+@9LW@UWecEt&I60eP4:
0JG17+>#E&1bpa=0JFV$0eP.&6=jtGBm"8R6#LdgATD`!$8jLi3&<6B0JFV$1bLRA0JG17+>#<#
0H`\nChII)D)t"(F`VV8Ci^$m2)-^;1GCL:0H_r'/iPI<0JG1'/MSk3+@9XUB5)L*3_*b!F:AR7
0J57>0JG17+>#H'2)m9D0JFV$0eP.&6=jtGBm"8R9PN^'AISu(0eP7<0JG17+>#B%1,:O;0JFV$
0eP.&6=jtGBm"8R>%M8SEcl#-AISu&1+k770JG17+>u)00JG170JFV+/heD7ATDX1A75oS/MT.9
2)$^<0JFV-3%cpE0JG17+>b])+@:!_Bm+3!3_Ws):gnYZ$8!ti/iP^C0JG1'1cI$I2_Zp>0H`/(
0H`]&@<6.!3^RjqF(oH)@1<Pq1,:IB0JG170H`2./i#@>0JG1'1G1@(6?6L\Bl#h.Bl>,)AKXTR
DImO&D[d%.0eP=C0JG17+>#<%1bLdD0JG17+>#N)0H`_kD.7EoBjj&!BPqa*+AcWeBFP;+0eP.;
0JG17+>GT-/hf7=0JG1'2_Hd,6Xak@A77Md@;KRbEd8cn9FV=c2D-d>0JG17+>u#.1,(C90JFV+
/heD8@;]La@6-bh@<-1&FED)9Dg-(A:dmqb$8aaq0JG170JFV,3A*!>0JG17+>YW-+@BRT@:We-
6Z7!_ATAn[Ec5l3+APB8$8aUm3A<-@0JFV-2D-pB0JG17+>b])+@BRT@:We-7WN'NATDKpFDl%>
:-oBs1c-gB3&!$?0H`80/iGR@0JG1'1bLI)6Xak@A77Mi@;KXi@<`ni;[j'k1G1I;0JG17+>to+
0eb:80JFV+/heD8@;]La@6-nsDf]J46=G-^:.>["1c$a<0JG170H`>0/het50JG1'2(gR*6Xak@
A77MmDf0*(DBM_M%14pM/het50JG1'2Dd$G0JG170H`2)0H`_kDII'a3_aO1@ruX,+AP64$8aUm
2)6j>0JFV.1G1OB0JG17+>kc*+@BRT@:We-9lFokEb/Zq+Al,J$8aUm1b^U;0JFV.2(ggA0JG17
+>kc*+@BRT@:We-:NU\eG@;Ui:(7Oe2_I'G0JG17+?)#-1,Ua>0JFV,/heD8@;]La@6.8.AR]4\
+Al,J$8jLi0JG170JFV(0JtI:0JG170H`8+0H`_kDII'a3`9O%Bl7?%;bIQ,1c6mA0JG170H`83
/het50JG1'1bLI)6Xak@A77Mt@;0V$+A-QcDBM\@%14pN/i>=:0JG1'2)6dE0JG170H`/(2'>7p
DII'a3`C,C8oJB\-Z^D*7L]\^1+k770JG17+>GQ//het50JG1'2D-[+6Xak@A77Mt@<63mFDl)8
+B(oB$8jLi1,:O;0JFV-2D-dD0JG17+>kc*+@BRT@:We-;e9oi/P0biF!+=[%14pM/i5790JG1'
2DZsG0JG170H`2)0H`_kDII'a3`C0<D.Ra/Bk1ct:dmqb$8a^p0JG170JFV/3A*!>0JG17+>kc*
+@BRT@:We-<+pDlA7]d(6=G-^:JM?+1c$aB2)$^<0H`;7/i,I@0JG1'2(gR*6Xak@A77MuDfTc6
FDi9t:(7Oe3A*$D0JG17+>GW-/hf4<0JG1'3%cm-6Xak@A77N"@;]RnF`q>:+@8F)$8a^p0JG17
0JFV(1,CO:0JG170H`>-0H`_kDII'a3`]s)FDl26@3@m(%14pI/het50JG1'3&<0@0JG170H`5*
0H`_kDII'a3`g$5A92[0+AY`A$8aaq3A<-@0JFV02_Hg@0JG17+>ti++@BRT@:We-=(uPiBlIWr
+AGT?$8ORn2)$^<0JFV(2(gUB0JG17+>GK&+@BRT@<-W98TP=J0f^j?0JG170H`>//het50JG1'
2(gR*6Xb7W@;[2ZEt&I41+k7?0JG17+>#<&3%d0E0JG17+>#Q*0H`_rBl7??:18#l@q]RoB+52"
1G^X@0JG170H`;./iGXB0JG1'1bLI)6YL1MANEauDKKT$B5\4d1bL[B0JG17+?),00K:a?0JFV,
/heD8Des?/@VK736>pLTFC>Uc2D-aB0JG17+?)/12D?g=0JFV,/heD8Des?/@VK739k@jHCi!g'
%14jH/ho+80JG1'/N>L<1bpa=0JFV,/heD8F^ec?87?[MDIEt]1Gpd>2_Zp>0H_r'1G1IB0JG17
+>#?$0H``.E,p)B3_jC!Df]W$%14pO/ho:=0JG1'/MT1:0fLd?0JFV$0eP.&6[E<RBQ%s.Dg#Q)
Bjj%hEaa'(F)59.@1<Q$0J5%=0JG17+>#<)/i5=;0JG1'/MSk3+@CHd@q]e%Ci=K*CM@3<:i]uX
@1<Q$2_HdA0JG17+>#T+3&NBD0JFV$0eP.&6tL7Q@<--E6"+S=DfTJ"$8j^o0fC^>0JFV$0eb48
1,(C90H_r%/heD9ASu?nEbd^%@<-%(Et&I62(ggC0JG17+>#<'/i>RA0JG1'/MSk3+@KdYD..I#
3^[h)ASu0iB4Yri$8""l/hf7=0JG1'0ebU?1G^^=0JFV./heD:@<6O%EZdqp%14jI/hf7=0JG1'
/Mf.73AW?C0JFV$1+k7'7;$mbF?2^/G@>@u$8X@g0JtO<0JFV$1GLL;2)$^<0H_r&/heD:B6eH<
3^[=iEc2Bo1,U[B3&!$?0H_r'1+kC;0JG17+>#?$0H`esH#Rjd9QbSuEX`@50ePI?0JG17+?1u1
2_Zp>0H`&%0H`r-ASbdmA3*(rEbc*k2)?j@1GCL:0H`8+1,Ua>0JFV'/heD>Eb0&qDIbdrF^f0$
D@Hq11G1FA0JG17+?;&.2)$^<0H`&%0H`r-ASbdmA3*4hCj0<5%14sJ/iGXB0JG1'3%d*F0JG17
+>>E%+A$TbCgh3l3_X7)ATDKpCCLV.1+k=>0JG17+?(o-0JG170H`&%0H`r-ASbdmA3*e#FCfK)
DfT@t$8F=h2E*<D0JFV/3A*$F0JG17+>ti++@U)h;djKc@:X:s3`BI)+B)]bG%"p"EX`@9/hf.:
0JG1'/Mf@=2_Zp>0JFV$1G1@(7<E3WDfBE!3^I:eBlbC_@UW_S%14[E1+k770JG17+>l/30JG17
0JFV+/heD;@;K^q@;]Tu8TP=J/MT.90JG170JFV$0fM*F0JG170JFV$0et@8+@^'[Bcoug%15!I
/ho.90JG1'/M]190JG170JFV$1+k7'7VQaV@;]U:87cUYBl7^#%15!Q/ibU>0JG1'/M]7;0K:a?
0JFV$1+k7'7VQaV@;]U:8T%sWBakD-2(gR:0JG17+>#?+/i5@<0JG1'/M\q4+@^'_Cgh3l3_sm7
FU\[90eP=>0JG17+>#?)/iPXA0JG1'/M\q4+@^'_Cgh3l3`KO)E+O'$%15!I/i5F>0JG1'/M](6
1,Ua>0JFV$1+k7'7VQaV@;]U:<-<4sFU\[91G1C90JG17+>#?'/iGC;0JG1'/M\q4+@^'_Cgh3l
3`]ZtF(#Lb1cI$D3&!$?0H`&%2)?p?0JFV$0eP.&7WMpT@q@\eDJ*O$Et&I51bLaD0JG17+>>E*
2_Zp>0H_r%/heD;Ea`iqANE.rEb&`iFa+?&1cR*D3&!$?0H`2)2)$^<0JFV$0eP.&7WMpT@q@\f
Eb0<6%14sH/ibdC0JG1'/MSk;2_Zp>0H_r%/heD;Ea`iqANE1eCgh%!%14pP/iGXB0JG1'0eP=C
0JG17+>#<#0H`i*@;]Rd3^[RlEais0Eb>gg1c[0K1,(C90H_r%/hf7=0JG1'/MSk3+@^B[DI[6=
6tp4OE+KIc1cI$C1GCL:0H_r)/hf(80JG1'/MSk3+@^B[DI[6=6tpCSD@Hq02(gUC0JG17+>kc1
1,(C90H_r%/heD;Ea`iqANE>%ASuEqCh4%_1cR*I0eb:80H_r+/iPaD0JG1'/MSk3+@^B[DI[6=
87?.RAStq!%14pP/i>=:0JG1'/MJe30JG170H_r%/heD;Ea`iqANELr+@opaEb,[e1cR*A0JG17
0H_r$/i#+70JG1'/MSk3+@^B[DI[6=9P#>@@;^,q$8aUm3&<6B0JFV$0eP4=0JG17+>#<#0H`i*
@;]Rd3_X7)DeEX&%14pL/iP^C0JG1'/Mo(>1GCL:0H_r%/heD;Ea`iqANEM1Df-!k1c$a?0JG17
0H_r)/i,F?0JG1'/MSk3+@^B[DI[6=9jr'`ASGssAISu'3A*$A0JG17+>#K(0fUj@0JFV$0eP.&
7WMpT@q@\qATW5-$8a^p2)R'A0JFV$2_HpH0JG17+>#<#0H`i*@;]Rd3_aO/F(f-!D%-h/3%d-D
0JG17+>#K(1,(C90JFV$0eP.&7WMpT@q@\r@;]S#%14pN/i#4:0JG1'0eP=C0JG17+>#<#0H`i*
@;]Rd3_j+$FCfM&$8aOk2_Zp>0JFV$2_HjE0JG17+>#<#0H`i*@;]Rd3_jC!AISu'3%d0L0JG17
+>#?$1G^^=0JFV$0eP.&7WMpT@q@\t@<-('%14pP/i#:<0JG1'/Mo(61GCL:0H_r%/heD;Ea`iq
ANE_#Bl.o#$8a^p0eb:80JFV(/iGXB0JG1'/MSk3+@^B[DI[6=;Is``ATJ:f1c[0F1GCL:0H_r%
/hf7=0JG1'/MSk3+@^B[DI[6=;K$\hD@Hq03%csE0JG17+>#N)1c$g>0JFV$0eP.&7WMpT@q@]"
l"jpPFCB8#$8a^p2)m9D0JFV$2_I$H0JG17+>#<#0H`i*@;]Rd3`C-@@<5mrF`M+($8aOk2_Zp>
0JFV$0eP:A0JG17+>#<#0H`i*@;]Rd3`L$?Ci=H;AISu'3A*!A0JG17+>#N)3AiKE0JFV$0eP.&
7WMpT@q@]&Ble?,D.7F+Eb>gg2)-^D3&!$?0H_r-/iY^B0JG1'/MSk3+@g!`D..=-3^IRoASbld
$8jRk2)$^<0JFV$0f(F=1GCL:0H_r%/heD<ATDWrDL"90ATDU$D@Hq10J5:?0JG17+>#N)0eb:8
0JFV$0eP.&7qH^X@;^?O6>paZ%14sK/hf7=0JG1'/N>@B0JG170H_r%/heD<ATDWrDL"90Eb0*!
D@Hq10eP=>0JG17+>#N)1c6s@0JFV$0eP.&7qH^X@;^?O6uR*fD09`,%14sI/hf.:0JG1'/MT%6
2`39C0JFV$0eP.&7qH^X@;^?O6ulj[A7]Wf$8jOj1,:O;0JFV$2D-pJ0JG17+>#<#0H`ksEc#6&
Gre?9F)to/A8cL#%14sH/ho%60JG1'/N>@@3&!$?0H_r%/heD<ATDWrDL"94Ea`j$Ap&-9%14pO
/het50JG1'/N5:A2_Zp>0H_r%/heD<ATDWrDL"94Eb/roF`M+($8jUl2)R'A0JFV$0eb460JG17
0H_r%/heD<ATDWrDL"96@;TIrEb>gg2)6d?3&!$?0H_r-/iPR?0JG1'/MSk3+@g!`D..=-3_3[s
DJs]0EX`@43A*!>0JG17+>#Q*1b^U;0JFV$0eP.&7qH^X@;^?O94;jWF)lD:AISu(0J5.:0JG17
+>#T+2)$^<0JFV$0eP.&7qH^X@;^?O94;m_AS_e_2)HpA1GCL:0H_r%0J5(90JG17+>#<#0H`ks
Ec#6&GreT4AS_e_2)-^>1GCL:0H_r%1+k@=0JG17+>#<#0H`ksEc#6&GreW1BlJB4B+52)3%cpA
0JG17+>#<&/i>UB0JG1'/MSk3+@g!`D..=-3_aa7@q]Fk%14pP/i5F>0JG1'/MSt40K:a?0JFV$
0eP.&7qH^X@;^?O:3CSgDIR0tB+52*1+kC;0JG17+>#<(/hf4<0JG1'/MSk3+@g!`D..=-3`'a:
F(A]r%14pP/hf"60JG1'/MT"50etF:0JFV$0eP.&7qH^X@;^?O;IsKPDKB90Eb>gg2)Hp?0JG17
0H_r%1+k:=0JG17+>#<#0H`ksEc#6&GreiAF*)>1CCLV-3%d-L0JG17+>#T+1,(C90JFV$0eP.&
7qH^X@;^?O;fm/(FD#$&F:AR63A*9F0JG17+>#T+3AiKE0JFV$0eP.&7qH^X@;^?O=*8P0@Wc^(
%14mN/het50JG1'/M]+72`!-A0JFV$1+k7'7ri0P@q@\eFD,6'Et&I50J57>0JG17+>#?(/ibjE
0JG1'/M\q4+@gH`ARf:4<+oiaF(&m'DJ<lp%14jG/i#:<0JG1'/MSt:/ho=>0JG1'/N>@:+@pEg
B-9icDJ'Cc1cI$E0JG170H_r%3A*!>0JG17+>#<#0H`o/DJ*BuGre97A79FgF*%iu2DHg=2)$^<
0H`,*/ibjE0JG1'0eP.&8Rl=J@;]U:;It,hC12:"CCLV*1+kRG0JG17+>#N2/i>UB0JG1'/N#.<
+A$H]Bjj%h@;]^dCi=?*%14gL/ib^A0JG1'/N5F;3&NBD0JFV$2(ga/8T&'Q@6-_nD.6q!%14jG
/i>UB0JG1'/N>^B1Gpj?0JFV$2(ga/8T&'Q@6-baCh%U0FC>Uc1,^aE3&!$?0H_r+2(gjE0JG17
+>#H'2'>J.A8,I58muFQF`Iou0f(F93&!$?0H_r,0J5.80JG17+>#H'2'>J.A8,I59jqRQ@<2kb
1,pmB2_Zp>0H_r+2_Hj@0JG17+>#H'2'>J.A8,I5:1\Vl6tL1JBakD(3%d'I0JG17+>#N./ibjE
0JG1'/N#.<+A$H]Bjj&!Df9N%%14[F/ho.90JG1'/MSq;/iPXA0JG1'/N5:>+A$H]Df0--Bjj%j
C11mdEcb_!$8X@g1G^^=0JFV$1cR*C2)$^<0H_r'/i=bCEa`iH6"485@;ZM]1Gg^B2)$^<0H_r)
0J5@C0JG17+>#B%2'>J2@;\,'F_qQp1GpdC2D?g=0H_r)0eP:=0JG17+>#B%2'>J2@;\,*AS?*m
D@Hq/1G1I>0JG17+>#E,/i5@<0JG1'/Mf"5+A$T^EB6EpB4tgaA.8l%1+kOA0JG17+>#B+/ibmF
0JG1'/M\q4+A$Wp@:a7987?4E@1<Q"0ePCE0JG17+>#B,/i#190JG1'/M\q4+A$Wp@:a798nE$c
F(&lrD%-h.1+k7?0JG17+>#B+/iP^C0JG1'/M\q4+A$Wp@:a79<+Tkg6$?sc%14pH/ho(70JG1'
/MT.93&`NF0JFV$0eP.&8T\BWGre9#EbPsi1H@'C1,(C90H_r-/ho.90JG1'/MSk3+A$Z`CjA'/
@:sCj@<-&k$8aOk2`NKF0JFV$0ek:92)$^<0H_r%/heD>FCB!23_!q(Eb0,uAISu'0eP:A0JG17
+>#<*/i>L?0JG1'/MSk3+A$Z`CjA'2DeE]s@1<Q#1bLU=0JG17+>#Q*3AW?C0JFV$0eP.&8T\BW
GreH,DJrqm$8aUm1cI*B0JFV$3A*'@0JG17+>#<#0H`r/@;L3M9keEPD@Hq00J5=@0JG17+>#<)
/i#:<0JG1'/MSk3+A$Z`CjA':@;p$oEt&I43%cpA0JG17+>#<(/i,I@0JG1'/MSk3+A$Z`CjA'<
@;KLqD/Tjj1c$aC1,(C90H_r%0J5190JG17+>#<#0H`r/@;L3M:hauZ%14pK/hf.:0JG1'/MT"5
2)d3C0JFV$0eP.&8T\BWGrei;D/!m%%14pH/iYgE0JG1'/MT"52)$^<0JFV$0eP.&8T\BWGreiA
D.O.`1b^O=2_Zp>0H_r%2_HjC0JG17+>#<#0H`r/@;L3M<+0fUDKKe+$8aUm0K1[>0JFV$2_I!I
0JG17+>#<#0H`r/@;L3M<-<4qD@Hq02(gdE0JG17+>#<(/iPaD0JG1'/MSk3+A$Z`CjA'@EbT*+
FCbmg1c6mB1GCL:0H_r%1+k@=0JG17+>#<#0H`r/@;L3M<b6/_@q?)V0fUd>0JG170H`;5/het5
0JG1'2(gR*8muRFBk(Q\$8XOl0JbC:0JFV$0f([>2`39C0JFV$3A*!.8mu[IDE:F9Dffn,$8XLk
2E*<D0JFV$0f([>2)$^<0JFV$3A*!.8mu[IDE:R7@;B9\$8XOl2_Zp>0JFV$0f(gB2`EEE0JFV$
3A*!.8mu[IDE:a8CO'h-$8"(e0K1[>0JFV$1H@'G2_Zp>0H_r'/heD@ASud%3_aO0@UX>!@1<Pq
0eP4@0JG17+>#B-/iYX@0JG1'/Mf"5+A69`H!ra/@;0b#@VH8Y2)['H3&!$?0H_r&1bLL=0JG17
+>#B%0Ha%tFEVA,3`9[)@1<Q"1G1XG0JG17+>#B,/i5L@0JG1'/M\q4+A??U@;^"$3^RClEclI5
$8FFk0JG170JFV-1+k770JG17+>b])+A??XG@>N&+A$V`$8aaq2DQs?0JFV$2D-^?0JG17+>#<#
0Ha&3G\(`$Dfp)53_X[@ASkmpF`M+($8X:h1GCL:0H_r%0JP1=0JG170H_r+/i=bG@;K@tF(o&D
96FZZ@3A6dD/aW<%14gB1G^^=0JFV$0ebC93&<6B0JFV$2_Hs19jqjHH#m\.3`Ba1B45atEb,[e
0f1L:0JG170H`8./het50JG1'1bLI)9jr'aBl7X)F_)!h0fCXD2)$^<0H`A9/ib^A0JG1'2D-[+
9kAQ`@rFCo@ps>!Ch%Am$8FOn1bpa=0JFV03A*$F0JG17+>ti++AHElBk)'B9kAQ`@rEJWBlnV0
$8ORn0JG170JFV(2`<9B0JG170H`))/heDBBk2ErGp#\"%14sH/i,:;0JG1'/MSq;/i5@<0JG1'
/N5:9+AHclB5_U#@6-\jFCB&06?R*QB+52)2_I*E0JG17+>#<%2D-sJ0JG17+>#N)0Ha).DJ*m(
Bjj&&Cggai+@9LFFCB2!$8aOk2`!-A0JFV$2_HpB0JG17+>#<#0Ha).DII$n3_aO1FCcR^@<-1&
%14mG/iYU?0JG1'3%cm=0JG17+>>E%+AHcpDe!9c3_a%'Ea``p@qZ;Y1GpdD3&!$?0H`5*3&<6B
0JFV'/heDBDfTc+@rFD-@;]^hEX`@22_I$C0JG17+>#Q1/i,7:0JG1'/N#.<+AQKe@;Itt@<??p
DIdl!$8jRk1Gpj?0JFV$1bLdB0JG17+>#<#0Ha,%FD,6+Cgh3lF#lU(F*(u6A79<a$8jRk1,:O;
0JFV$2(gmH0JG17+>#<#0Ha,%FD,6+Cgh3lF#lU+ASbmqDfT_)$8jLi3&NBD0JFV$2(ggA0JG17
+>#<#0Ha,%FD,6+Cgh3lF#m$(@<6O2Bk(gu%14sI/iYX@0JG1'/N#.?2_Zp>0H_r%/heDCATVTs
Ebo0%A90e,BkhKrB4Yri$8jOj3AN9B0JFV$1bLUE0JG17+>#<#0Ha,%FD,6+Cgh3lF#m3;FED)7
A79<a$8jRk0K:a?0JFV$1bLOB0JG17+>#<#0Ha,%FD,6+Cgh3lF#m96AKXNPB6@bp$8!ti/het5
0JG1'/MT.C/het50JG1'/MSt40Ha,%G9BFf@WH0nATJ:f/Mf:;3AN9B0JFV$0fLpA2`39C0JFV$
0et@8+AQKl+Bi>bCgh3l3^ImuCM[EsA.8kt1c$aA2)$^<0H_r%2_m!D2_Zp>0H_r%1+k7':1\Vl
>%M,Y@;]U:6YLLSF*(o*F`Lu*%14[D2(gjI0JG17+>#<,0J54:0JG17+>#<'/heDCATo8#ARTC`
DIbdrF`(c$Bl4@e/Mf=<2`EEE0JFV$0fLsB1GCL:0JFV$0et@8+AQKl+Bi>bCgh3l3_3[rBl%m0
D@Hq)1c?sC1GCL:0H_r%2E3<F2)$^<0H_r%1+k7':1\Vl>%M,Y@;]U:8T&]_EarNuB5)0u%14[C
3A*-J0JG17+>#<,2D.!K0JG17+>#<'/heDCATo8#ARTC`DIbe'@;oplEX`@-1bgU=0JG170H_r%
2`!'A3&!$?0H_r%1+k7':1\Vl>%M,Y@;]U::1\6_Df-!k/MfC>0JtO<0JFV$0fLpA0K1[>0JFV$
0et@8+AQKl+Bi>bCgh3l3_j71+Acm"D/XQ=BFP;#1c-g@3&!$?0H_r%2_cp?1GCL:0H_r%1+k7'
:1\Vl>%M,Y@;]U:<,$2XEchfu/Mo171,psA0JFV$0fLpA2`NKF0JFV$0et@8+AQKl+Bi>bCgh3l
3`fm/Ch[d"FDl%+$8sLn2)$^<0H_r'/i5L@0JG1'/MSk3+AQW`ATDKn3_WspDfZ?p2D?a>3&!$?
0H_r)/i,:;0JG1'/MSk3+AQiqG@>bX6=k1MASqqa2E3<G1GCL:0H_r%2_HpB0JG17+>#<#0Ha,/
Ed(r;3_j+(G%k_$$8jgr3AW?C0JFV$0eb4=2)$^<0H_r%/heDCDfU&1Gre`BCi9ai2)m3K2_Zp>
0H_r)/iPXA0JG1'/MSk3+AQiqG@>bX;flGk@:s.l%15!R/iPI<0JG1'/MT7<0JG170JFV$0eP.&
:2b/s@<jn5Ec5f9p^IQg1G1R>0JG17+>#<%/i,I@0JG1'/MSk3+AQiqG@>bX<,unpA8#OgD%-h-
1bLaF0JG17+>#K1/hf(80JG1'/N#.7+AcK^BleB)DE:F!Ea`HkBakD*0eP=B0JG17+>#N//i,F?
0JG1'/N#.7+AcK^BleB)DE:I"BQ%p&%14[B2(gXA0JG17+>l)12E*<D0JFV+/heDE@<,dhF^]PV
6$%0d@qfk!%14[A1+k:80JG17+?)530JtO<0JFV,/heDEATDoS9PJ?P%14gJ/i5=;0JG1'/MT"7
/iGI=0JG1'/N>@:+Ac`cCh[j-Bl7L'3^R7fF_Pb'$8F@i2D?g=0JFV$0etF83B/]H0JFV$3%cm-
:hXQZBlJ$*DImlM9jqpRCgdb[/M]190K1[>0JFV(1GCF90JG170H`>-0Ha2+FCS`nEc*!kEt&I6
1bLRC0JG17+>#<-/iGL>0JG1'/MSk3+Acum@;]U:7q?%GF))3l2)$X:2)$^<0H_r%3A*<I0JG17
+>#<#0Ha21Cgh3l3_OL%CN"D+$8jOj3&30A0JFV$0f^jC2_Zp>0H_r%/heDEDerj"A3*D&A9n[l
2)6d>2)$^<0H_r&0eP.60JG17+>#<#0Ha21Cgh3l3`fa1F('8%$8XXo2`!-A0JFV0/ho.90JG1'
0J5%%:iCArF_>-!3_X7/@W-,n$8aIi0f:X=0JFV//iGI=0JG1'0J5%%:iCArF_>-!3`,HhFDhTq
0fUd>0JG170H`83/het50JG1'1bLI)<Du1E:j$>iFDi:"Bk)&j$8aXn2)?p?0JFV$1,^aF3&!$?
0H_r&/heDGDf&p#Bjj%h@:N_g%14pK/i5=;0JG1'/M]4:0etF:0JFV$1+k7';K$D\DJ<N?6?QdO
@<,q#F:AR81bLXA0JG17+>#E(/iGXB0JG1'/Mf"5+B!?'F(o&D6#paS@;]^hCaX:>%14pG/i,F?
0JG1'/MoI?3&iTG0JFV$1G1@(6$d*_@UXOmH=:\P6=FYP%14pI/iYgE0JG1'/N5L=2`EEE0JFV$
2D-[+;K[&%Bjj%lEcl8GAISu(1+k@:0JG17+>#<%1bLO@0JG17+>#Q*0Ha89F)u&(3_=@-F`_\?
%14sH/het50JG1'/Mf:;1,Ua>0JFV$1G1@(;K[&%Bjj%qBOPp/CN"A*$8jLi1cI*B0JFV$1GCF<
3&!$?0H_r'/heDJCN<itDIkk%Bk;Gs$8aaq3&<6B0JFV$1,LU;0JG170H_r'/heDGF`VV<@6.(0
G&MO5$8jUl3&NBD0JFV$1,ggC0JG170H_r'/heD7H"Cf1EclGEBjj%sBl8!-%14sM/iPXA0JG1'
/Mf=<2)m9D0JFV$1G1@(;K[&%Bjj%sDf]E,G7=m;3%d3N0JG17+>#B*/ho.90JG1'/Mf"5+B!?'
F(o&D9m(Jn@;^.%%14pM/i>=:0JG1'/Mf(52`EEE0JFV$1G1@(;K[&%Bjj%uA7]h'@1<Q$2(gR:
0JG17+>#N./i,F?0JG1'/N,48+B!?'F(o&D:Mk/g%14mO/iGUA0JG1'/N,L>3AiKE0JFV$2(gR*
;K[&%Bjj&$@;TFnCLM*k%14pK/iGC;0JG1'/Mf182)6j>0JFV$1G1@(;K[&%Bjj&$AThL'FDl,:
CaTZ!2)HpF1,(C90H_r'1+k7>0JG17+>#B%0Ha89F)u&(3`Bm6Ch7L*CCLV-3%d0J0JG17+>#?*
/iGXB0JG1'/Mf"5+B!?'F(o&D;flGcBle*!Fq"d93A*<I0JG17+>#B'/i5=;0JG1'/Mf"5+B!?'
F(o&D;fj-YATVL(F(094B+52)0eP4?0JG17+>#K3/i#190JG1'/N,48+B!?'F(o&D<+0i]CLqC*
%14pH/iPO>0JG1'/Mo::3&!$?0JFV$1bLI)7qHUZB5(d8<+9QXBldtt$8j^o2)$^<0JFV$3&N<B
3&!$?0H_r+/heDGF`VV<@6.A+D0'J%$8a^p2`39C0JFV$1c-gB0JG170H_r(/heDGF`VV<@6.G-
ChI0hEa`Jf$8aOk0f:X=0JFV$0f(O:3&iTG0JFV$0eb46+B!?'F(o&D<bu2TBm+E9FDkq($8!th
/het50JG1'0fLg>0JG170JFV(0eP.&;djN]@3A-_%14jI/iGR@0JG1'/Mo@<2`EEE0JFV$1G1@(
;djfZBco]^@:EqZ3^Id/;JCDbA.8l#1bL[B0JG17+>Gf-1c6s@0JFV'/heDHASu'l@;Itm@;B:l
%14[E/het50JG1'/N#C<0JG170JFV$1bLI);e:5aBOu!rATJtcEt&I.3%cm=0JG17+>#<*2_Hd<
0JG17+>#<%/heDHDes?/Df-[hEt&I.1-$sA1,(C90H_r&2D-a@0JG17+>#?$0Ha;4F`_:>6"Y.O
@pqDbCi<m%AoDR/ASH#k$8"%i/ib^A0JG1'/MT4;1cI*B0JFV$1+k7';f?f#BHTTQEbT#l3^[=p
AKXrjGA[is/M]==3&iTG0JFV$1GLL90JG170H_r&/heDHDfp/8+@0U[Bk(R47!3NZ@;ZM]/Mf18
0JG170JFV$1,ggG0JG170H_r&/heDHDfp/8+@0U[Bk(R47:C7Z+A?]kA8c>p$8""k/i#:<0JG1'
/M]:<0JG170JFV$1+k7';f?f#BHTTQEbT#l3_F=(@;]soF(094B+52"1G^XD2_Zp>0H_r&2(gd@
0JG17+>#?$0Ha;4F`_:>6"Y.O@pqDpDfTqB7;Q[a@:EdW$8""j/iPXA0JG1'/M]:<1,(C90JFV$
1+k7';f?f#BHTTQEbT#l3`'j.FDl26@1<Q"2_HsD0JG17+>#<'2_Hd<0JG17+>#T+0Ha;4F`_:>
95ei^@6.=uDfok*$8aIi1bpa=0JFV$1+k:?0JG17+>#<#0Ha;5@;0U?6=FnEASc:&@1<Q#1G1F?
0JG17+>PQ01GCL:0H_r%/heDHE+*Hu3^ROs@W,Za$8XRm2)?p?0JFV-/i,180JG1'/MSk3+B*5f
Bl5t!@:X(u%14mM/iYgE0JG1'1bL^G0JG17+>#<#0Ha;5@;0U?6Z7!UDdm,a$8XRm0f:X=0JFV,
/i,@=0JG1'/MSk3+B*5fBl5t%Bju*kCij*+%14pG/i5=;0JG1'1G1UA0JG17+>#<#0Ha;5@;0U?
9jqRQBk.Y[1H$jE1,(C90H`2)1bpa=0JFV$0eP.&;fH/ZDE:L#Cggsb%14pJ/i5L@0JG1'1G1X@
0JG17+>#<#0Ha;5@;0U?;djQc@;]UeEX`@32_Hp@0JG17+>kc33&!$?0H_r%/heDHE+*Hu3`BU5
Bl%Ts%14mO/i5OA0JG1'0J5190JG17+>#<#0Ha;5@;0U?<affUDI[Bh%14gI/i>L?0JG1'/Mf.7
2)m9D0JFV$1+k7';fuVZDE:F(@<-I.F_qQp2)d-H2)$^<0H_r%1+k770JG17+>#<#0Ha;<ARo@i
3_++1AR]RuB+52*2(gaG0JG17+>#<(/het50JG1'/MSk3+B*JqA7]X>9jqjTp'h?d3A**D0JG17
+>#<-/hf7=0JG1'/MSk3+B*JqA7]X>;flqfCM7X&D%-h03A*<I0JG17+>#<-/ho.90JG1'/MSk3
+B*JqA7]X><H)nu@;K?]$8a[o2)?p?0JFV$2_HsC0JG17+>#<#0Ha;<BlnZ4Ebo0%A3*%cCh4%_
1cI$E2)$^<0H_r+/iGC;0JG1'/MSk3+B*JuFF%M=Cgh3l3^R7rAS_e_1c?sH2)$^<0H_r+/i5@<
0JG1'/MSk3+B*JuFF%M=Cgh3l3^RCuD@Hq02D-a?0JG17+>#K(0f:X=0JFV$0eP.&;g2qtH=_,5
@;]U:7qHRLG$tge1cI$@1GCL:0H_r,/i#F@0JG1'/MSk3+B*JuFF%M=Cgh3l3_X[+ATD["%14pN
/i,I@0JG1'/N>@?2)$^<0H_r%/heDHGA2/FATDTqDIbe3r,QL]BFP;(2(gRB0JG17+>#<'0eP=>
0JG17+>#Q*0Ha>'Bm4!'3`IJ8BlIWt%14[F/iY^B0JG1'/MfC>1GCL:0JFV$1G1@(<+0Zj@;]df
3^dCs+D#U:;djKN@;QG\1-$sF3&!$?0H_r-0eP1>0JG17+>#K(0Ha>/@V'XB9P@jU@1<Pq1,(=7
0JG170H`)/2(gR:0JG17+>GZ)0Ha>5DJ*B#8TP=J1H$jF1GCL:0H_r%0J5+90JG17+>#<#0Ha>;
DJ=0+@6.A1DJ=/$$8X[p3AN9B0JFV$1GURB1GCL:0H_r&/heDIF`M8/Gre6/CLM6l%14pH/hf(8
0JG1'/M]:<3B/]H0JFV$1+k7'<-<4sAU-=.F*(i.@WcJr$8=(d3&!$?0H_r'1+kCC0JG17+>#B%
0HaA.@;]Ua3^mq.AR]+[%14dA1GUX<0JFV$1GUR?3&!$?0H_r'/heDJB45[g@6.%iD/`p"@1<Q$
2_HgC1H@0D+>PQ(0K:sN0H`&%0Ha@g3^I4dEb&`mDBMqsBm+'.F(o`A%14sL/i>UB0JG1'2(gmE
0JG17+>>E%+B;&q6=jtF@<6N"$8jRk2)$^<0JFV(/iYX@0JG1'0J5%%<D,A>Bl\')DJ*WkD%-h0
0J5=@0JG17+>>E&2_Zp>0H`&%0Ha@g3^Rk$B4uC*D@Hq10eP:A0JG17+>PQ,3&!$?0H`&%0Ha@g
3^Rk$F*)>:%14sI/i>=:0JG1'1G1F:0JG17+>>E%+B;&q6Xb"GBkCrd$8jXm3&iTG0JFV)/ib[@
0JG1'0J5%%<D,A?@<-0uF)5Cs$8jXm0fLd?0JFV+/i5F>0JG1'0J5%%<D,A@Dfo]/@<3tkF)5D1
De:+d@;ZM]2)R!H1GCL:0H`/(1,CU<0JFV'/heDJ90,LPBl7C&EbB%p$8j[n3&`NF0JFV+/i,18
0JG1'0J5%%<D,ACCghBtDg)Wt2)-^C2)$^<0H`,'1,:O;0JFV'/heDJ90,RZDfoQ$F*(u6%14sJ
/hf.:0JG1'0eP1<0JG17+>>E%+B;&q8T8`pBk(fc$8jUl3&<6B0JFV(/i>RA0JG1'0J5%%<D,AH
AS#Cn%14sJ/iGXB0JG1'0eP1<0JG17+>>E%+B;&q9P%pJATMs)EX`@51G1L<0JG17+>PQ02_Zp>
0H`&%0Ha@g3_X72ATDa.Deoji2)-^@0JG170H`&%0fLd?0JFV'/heDJ90,abDId['%14sM/het5
0JG1'2_HmA0JG17+>>E%+B;&q9Q+fZDf0)sEcQF7$8jUl1c6s@0JFV)/i#:<0JG1'0J5%%<D,AI
@;]RgATMs)EX`@51bLXE0JG17+>GK'2_Zp>0H`&%0Ha@g3_a=!A8Ggu@W-:*F_>@s$8j[n0JG17
0JFV(/i>=:0JG1'0J5%%<D,AJATqWmF*)50/Tl#NDCnh5DIj7a2)6dB1GCL:0H_r%/i#C?0JG1'
0J5%%<D,AJDfU&9@qZ;Y2)6dE2_Zp>0H`)&0fLd?0JFV'/heDJ90,gdFED57B4t^j%14sI/iPXA
0JG1'0eP4;0JG17+>>E%+B;&q:O$JiEb#Ud2)$X=3&!$?0H`2)0f(L;0JFV'/heDJ90,mcH#7JB
FD)*j2)?jA0JG170H`)&1c6s@0JFV'/heDJ90-!bAS,OgASbld$8jLi3AN9B0JFV(/i,I@0JG1'
0J5%%<D,AODfp/8@;Tt*Df-!k1c[0D0JG170H`,'0etF:0JFV'/heDJ90-!n+@p'[Bk;<98nE$a
AU+^l2)-^A1GCL:0H`/(3AiKE0JFV'/heDJ90-!q@;^-t@1<Q$1G1[H0JG17+>GK&3&!$?0H`&%
0Ha@g3a$BACCLV&1Gg^E1,(C90H`52/ho:=0JG1'1G1@(<H;M\F^]PV9lFokBm+3$AT&"b1Gpd=
3&!$?0H`)(2D-mD0JG17+?(o,+B;?+3^IRkF`DP8EcH55+APW?$8sUk0fLd?0JFV(1c[0J3&!$?
0H`A.0Ha@o5rq;L@q]e$@:s-o5t_Xo1G^XB2)$^<0H`>3/i5790JG1'2(gR*<Du1E6$-pODKK;0
7mRRk1H@'D0JG170H`;4/iGL>0JG1'2(gR*<Du1E6=F\PBl.d/AKX]8%14pJ/iGI=0JG1'0ekR=
0etF:0JFV./heDJ;aEH2DeX9(+A"s1$8aLj1Gpj?0JFV.0eP.=0JG17+>kc*+B;?+3^Rb+FDl%>
9gK3q1bp[C3&!$?0H`;6/iYdD0JG1'2(gR*<Du1E6?QmP@;Kj):0A#51bgUC1GCL:0H`>6/iGL>
0JG1'2D-[+<Du1E6YL1D@:sL$8PBR#1GURA3&!$?0H`A6/iYO=0JG1'2D-[+<Du1E6t'nJ@<3Pj
=:GTn3A*6J0JG17+>GQ,/ibmF0JG1'2_Hd,<Du1E6tL7ZATAn\:CRXf1+k@=0JG17+?2/00JtO<
0JFV,/heDJ;aEH4ATVs2BlkIl8IZ"`0ePCD0JG17+?)&.2E3BE0JFV,/heDJ;aEH8@<-I%DfTA2
6W=L%1-$sG2_Zp>0H`A5/i,F?0JG1'2D-[+<Du1E88iWlFDl%><*0S:1Gg^<1GCL:0H`>3/i>L?
0JG1'2(gR*94`!YATM:(+@e^,$8aFh1bpa=0JFV/2D.!D0JG17+>ti++B;?+3_WsoAU.j/FCcRd
:(7Oe0J5%60JG17+?)221GUX<0JFV,/heDJ;aEH<@;]R`F*(u6+Ab?5$8XRm0fLd?0JFV(0f:R<
2)$^<0H`;,0Ha@o5rq\JF!+LpB45j(:0%f21GpdE2_Zp>0H`)(2D-d@0JG17+?(o,+B;?+3_XI5
+@0gPD/XJ<:/)0)1Gg^<2)$^<0H`))3%csB0JG17+?1u-+B;?+3_XI5+@0mXASbq!+@AF($8XOl
0fLd?0JFV00J5%50JG17+>ti++B;?+3_a1&E+is,+B2)F$8OIk2`NKF0JFV/0J5+70JG17+>kc*
+B;?+3_a<sD.t+^9FV=c1G1@=0JG17+?2;43AW?C0JFV-/heDJ;aEH=Bl&!%F_bQ"+A#69$8aUm
0JG170JFV01G1F?0JG17+>ti++B;?+3_a=+DIm6qDes-/+AGT?$8XRm2)m9D0JFV(1,1CA1,(C9
0H`>-0Ha@o5rq_YDKKH1AU,Cc5n+/W2D-^C0JG17+?2833&<6B0JFV-/heDJ;aEH>@<6+*Bl%Ts
+B2)F$8aFh2`!-A0JFV.1bLLB0JG17+>kc*+B;?+3_j71@<--+:.bs&1-$sI2_Zp>0H`A0/hf4<
0JG1'2D-[+<Du1E:1\Vl:NC8_@;^-/9L0*p1b^O@2)$^<0H`;2/het50JG1'2(gR*<Du1E:1\Vl
=`8=r+AQ&K$8s^n2)$^<0JFV(2Dm*E0JG170H`A.0Ha@o5rqbZD.OhU9+;4a2_I'G0JG17+>GW,
/i#:<0JG1'3%cm-<Du1E:LS$T@;]Tu6U;.g1GpdA2_Zp>0H`A7/i>L?0JG1'2D-[+<Du1E:MXcT
BQ%`r+@BjbGp#mU%14pH/i#@>0JG1'3AiEL2_Zp>0H`8+0Ha@o5rqeY@;''l:-oBs1c6mA2)$^<
0H`)*1+kI=0JG17+?1u-+B;?+3_sd-B5_Z16YUXf+AYlE$8ORn2)R'A0JFV/0eP7>0JG17+>kc*
+B;?+3_sd4@;]Uo+@]$6$8XLk0fLd?0JFV(0fUd?2)$^<0H`>-0Ha@o5rqhNF(&TjDIFYT5n+/W
0J51<0JG17+?2;41,(C90JFV,/heDJ;aEH@ASuQt@rH0l+@e^,$8aFh2_m'@0JFV/3A*3G0JG17
+>ti++B;?+3`'C+EbSr)8PBR#1b^O90JG170H`;3/ho:=0JG1'2D-[+<Du1E:hXQZ@:WqcE+iro
+Ab?5$8XIj2)$^<0JFV(0et@82)$^<0H`;,0Ha@o5rqhUDe3g#GT]:U%14pG/i5@<0JG1'3%us=
0JG170H`5*0Ha@o5rqhVFEDS5F`M,.+Ab?5$8aUm2)6j>0JFV(1,:I?3&!$?0H`>-0Ha@o5rqh\
Ecc,+DIakc;@Nsh2_HsH0JG17+?)531c6s@0JFV,/heDJ;aEHBBk(gnDf0).<^@0%1H-pA2)$^<
0H`;7/ibjE0JG1'2(gR*<Du1E;K#u]Deio,<^@0%1H7!E1GCL:0H`)*0eP=;0JG17+?1u-+B;?+
3`BHsEa`frDKKe>6U;.g1b^O@2)$^<0H`))0ePI?0JG17+?(o,+B;?+3`BI'F<F7cCLnVUBlnVC
<E'D71-$sD1,(C90H`A8/i>=:0JG1'2D-[+<Du1E;djPd6#Ld_DJ=#3<*0S:1GURA3&!$?0H`))
2_HdC0JG17+?1u-+B;?+3`BI)+@KpTB5\n[5n+/W2_I$J0JG17+>GW,/i5@<0JG1'3%cm-<Du1E
;djPd7WMpT@qg!oD]hD5%14pN/iGC;0JG1'0etL:1G^^=0JFV//heDJ;aEHCART\&Ch4_j5n+/X
2_I!I0JG17+>GT0/i5=;0JG1'3%cm-<Du1E;fHYj@;]X!=$[9&1c$a<2)$^<0H`;4/ho:=0JG1'
2(gR*<Du1E;gECl@s)j(+AQ&K$8X@g1c$g>0JFV/1bLR>0JG17+>kc*+B;?+3`KO(Cgh!cF)to(
+@]$6$8OOm3B&WG0JFV/1+kI@0JG17+>kc*+B;?+3`KO)E+'kY9FV=b3A*!A0JG17+?;;32E3BE
0JFV-/heDJ;aEHDDfB9'@3A3A%14mH/i#:<0JG1'0ekC80JbC:0JFV./heDJ;aEHDF^oK2DBM5K
%14mL/ho+80JG1'3AiEL2_Zp>0H`8+0Ha@o5rqtfCia#-:J2-(2DHg=0eb:80H`),2D-aE0JG17
+?;&.+B;?+3`][*A7^'05t_Xo1H7!I0JG170H`;5/hf%70JG1'2(gR*<Du1E=(-/`Bl7R*Df-[c
6OaAY2(gdH0JG17+?;A51G^^=0JFV-/heDJ;aEHGBk(gjFC?:b;[j'h1bL[D0JG17+?2).1GLdA
0JFV,/heDJ;aEHG;c"T+9FV=b1G1[C0JG17+?;D62)$^<0JFV-/heDJ;aEHGBk(gjFC?:]@;Kb$
+B2GP$8F4e2)m9D0JFV-2D.!G0JG17+>b].+BE&kAU8K1Cgf@l@<,dd@<2kb0fCX<2_Zp>0H_r%
0K:[?1,(C90H_r+/heDKBk;C'@;\+o@3A<RDJ'Cc1,1C81,(C90H_r%0JtIB2_Zp>0H_r+/heDK
Bk;C(@;S%r@;^!t%14gD/iPXA0JG1'/MSq;/iGXB0JG1'/N5:9+BE2fFDbN(3`BI$B5_Z>6YLCS
Df-!k0fUd>0JG170H`82/het50JG1'1bLI)<bZSeBl5%bEt&I51+kID0JG17+>#<-/ho+80JG1'
/MSk3+B`i"Df]`'G%kAG7!2sZDg$#4CCLV-1G1I>0JG17+>#<,/iYX@0JG1'/MSk3+B`i"Df]`'
G%kAG9lG)p@<)ea1c$aD2_Zp>0H_r%3%d$D0JG17+>#<#0HaM@B5_j-@<Q?n3`BI-@;9@sD[d%1
1G1O?0JG17+>#<+/i5L@0JG1'/MSk3+B`i"Df]`'G%kAG;fHPeF:AR62(gjB0JG17+>#<*/ibjE
0JG1'/MSk3+B`i"Df]`'G%kAG>%)&aARZ)U/MT+81c$g>0JFV$1,pmB1GCL:0H_r&/heDO@;TIf
@6.))F(&im%14[B0J5(=0JG17+>#?./iPO>0JG1'/M\q4+BiJr@UW_iANE/#CghNrH#F-!/MT4;
3AN9B0JFV$1-$sH2)$^<0H_r&/heDOBl.<f@WuBE;0?Fm;0?FZ$99dm0JG170JFV'/het50JG1'
0J5%%:2b/pBHU,iCh4%_/NGL;0JG170JFV'/het50JG1'0J5%%;f?f#BHU,iCh4%_1c-g@2E!HP
0H`81/i>@A2E*<41bLI)6Xak@A77McEbT&sATqR)ATAng;[j'k2(g^>0JG17+>#<%/i5=;0JG1'
/MSk3+@KdYD..I#3_s9tDKB@u$8aRl3AiKE0JFV-1G1U@2E!KJ+>b])+@BRT@:We-6=jSKATD6g
DJL@i;[j'j2D-^<0JG17+>to+0fCpJ2_Z@2/heD8@;]La@6.>4A8Yt(+APiE$8aOk3&<?H1GBq0
2D-aE1G^g@+>b])+@BRT@:We-=^c>fDfp/8+APiE$8aUm1H%-L2_Z@41G1FB1G^g@+>b])+@BRT
@:We-<-!,%D]heR%14pL/iYXC1G^^-2Dd$@3&<?H0H`2)0H`_kDII'a3^IUrATDj6+APiE$8aUm
2DI*J2_Z@41+k770JG17+>b])+@BRT@:We-6#LdYB5_[%F(c[k;[j'j2(gd@0JG17+>u&/3B/fN
1GBq./heD8@;]La@6-l#DIe#8:185s+AcKeCEQA=%14pL/hf1A2E*<42Dd$D0JG170H`2)0H`_k
DII'a3_O%%FEVA7Ch4_a;[j'j2(gaG1G^g@+>tu-2Dm0B0JFV+/heD8@;]La@6..pG9BCl@<6("
G9BXZ%14pI/iG[F1G^^-3&*$A1G^gC0H`2)0H`_kDII'a3_!h$B45U!:JM?+1c$aE1G^gC0H`;6
/iY^B0JG1'2(gR*6Xak@A77MpF(f!+@3A?@%14pK/ibdC0JG1'2Dd$?1G^gC0H`2)0H`_kDII'a
3`C,Q+@C0fBm:ar@WO.E:/_T/0f^jG1G^gC0H`)-2(g^D2E!KJ+>GQ&0Ha@o5rq_KF`(V194_NS
84a6t1cR*C2E!HP0H`;0/i>@A2E*<42(gR*<Du1E;flSeCggpaDIjqk<"00k1bLX>0JG17+?2&-
1H70H1GBq//heD8@;]La@6-boCi!g'B6S94A0=ZC%14pK/hf1A2E*<43%usE1G^gC0H`5*0H`_k
DII'a3`C-/Eb8m(F<F@S%14pJ/i,IC1G^^-2`WKN0fCpK0H`5*0H`_kDII'a3`fa3ATD="GA\O!
:(7Oe1G1XF2E!KJ+?);51bgmH2_Z@3/heD8@;]La@6-ebG%kJ07!3B`@;m>b@WO.E%14[B3A*!>
0JG17+?(u,2_Zp>0JFV+/heD8BPD9o3_Wt'+@BRSE+*WmF!+7fF"Rn/1c$a>0JG170H`>0/i,IC
1G^^-2(gR*6Xak@A77MfChII"AnbgmA0=ZWF"SS2:(7Od0J57;0JG17+>GQ+/ibdC0JG1'2D-[+
<Du1E<+U;_F!+D'@<*Je@<-I8+B2GP$8jRk0eb:80JFV(0JtIC2)$^<0H`8+0H`_kDII'a3`Bj+
@:jFuA0=ZWF"SS69+;4a0ePID0JG17+>GT*/iGC;0JG1'2_Hd,<Du1E95/Ki+AcWXCEPoH%14mK
/ho=A1G^^-0ekC82Dm0B0JFV./heDJ;aEH<Dg,c/C`lM_F!*bP%14sJ/ho.<1G^^-0ekC82_d3K
2_Z@5/heD8@;]La@6-\j@V'S%@3AKj@<*Je@<-I8%14mJ/i#4=1G^^-0ekR=2`39C0JFV//heDJ
;aEHBBm+'.F(o/r+B2&X6Z6jS/g*MI%14mI/i,@=0JG1'0ekR=3&WZQ2_Z@6/heDJ;aEH@@;Kk!
@<*Jd@WO.E6U;.g1c[0C0fCpK0H`))3A*6H1G^g@+?1u-+@BRT@:We-9lG/lF<F4p@UXC%6:21h
/M]==1,Ua>0JFV.0J5:?1G^g@+>b])+@BgVCh5XrF`MD>ARTI!;_B1g@WMtc1c6mA2)$^<0H`;3
/iYgH1G^^-2(gR*6Xak@A77MtD..I,+B)cgE+L.f@WO.2$8aaq2Dm0B0JFV(0KCaC0fCpK0H`8+
0H`_kDII'a3`AsU:`r\0%14pL/hf"<2E*<42DZsG2E!HP0H`2)0H`_kDII'a3_jU:@3A!IF*&O"
;[j'j1bL^F2E!KJ+>u#.1,(C90JFV+/heD8@;]La@6.,*F)c>@A8bpqBlkIg@WDnb1c-g?1GCL:
0H`;4/i5RH2E*<42(gR*6Xak@A77MlBl7R)FDl%>:JM?+1c$a?3AEEN0H`;7/ib[A2E*<42(gR*
6Xak@A77Mi@;T^pFDl%>:JM?+1c$aB1G^gC0H`;7/ibU>0JG1'2(gR*6Xak@A77MhAT)U%ATVj7
DBM_M%14pK/i,IH1G^^-2`<9F2`!6G0H`5*0H`_kDII'a3_=44ATD4"Gp#mX%14pK/ho4>1G^^-
2`E?G1G^gC0H`5*0H`_kDII'a3^RCoCh7d(Ci!Z*:JM?+1c$a=0JbL@0H`;7/hf4=2E*<42(gR*
6Xak@A77MoBjkX_Ea^([@;Kb$+AY`A$8aOk1c%$J2_Z@60J54<2)$^<+>kc*+@BRT@:We-=(-2^
EboZ4+AY`A$8aLj3B&`M1GBq21+kC;0fCsE+>kc*+@BRT@:We-;dj]aBji,[:(7Oe3A*<J3&<?E
+>GT2/i,FG1G^^-3%cm-6Xak@A77MlASc:/DIFYS6OaA[1G1XH2)$^<+>GW,/iGXG0JG1'3%cm-
6Xak@A77MqEbTE$AKXKSDfTK%+@8F)$8aRl2D?g=0JFV-2(ggF0JG17+>b])+@BRT@:We-6tp:C
Gp#j\%14pK/hf(;1G^^-2Dd$F0fCpK0H`2)0H`_kDII'a3_X72ATDa.DepOk;[j'i1bLI90JG17
+?2).0JbR?0JFV,/heDJ;aEH3DesQ5@VK6n;aV!$1GpdD2_d3L0H`;6/iGLF1G^^-2(gR*<Du1E
;IOBQBkM*%:.#Ht1H7!B2)@$E0H`>4/iPXI1G^^-2(gR*<Du1E9Q,&fF*;86Ch4_^=Ub]o3A*$E
0fCsE+?2211c70L2_Z@3/heDJ;aEH3Bl7EpDJim)Bcp2B%14mO/ibgD0JG1'3&<0@0JG170H`5*
0Ha@o5rqAOCisT(F`S[$8.>n_0J5+>1G^g@+?)223&icL0JFV,/heDJ;aEH8@<-C&F(094B-:#:
%14mN/i,@=0JG1'3&*$D1G^gC0H`5*0Ha@o5rqAH@<-0qF*)><+BMSQ$8aLj2Dm9H1GBq11G1UD
2E!KJ+>kc*+B;?+3^IRk@;^?5:0A#51bgUB1,C^B0H`;//i5LC1G^^-2(gR*<Du1E:i^JtBk1dm
@q?c\8IZ"`1bLaA0JG17+>u232`E]P1GBq//heDJ;aEH2@;]^rEZe(F%14pJ/i#+?1G^^-2_cpB
1H70H0H`5*0Ha@o5rqAODI[U*A0=W<%14pJ/iGUB2E*<42_Zj>2)[?O0H`5*0Ha@o5rqh\Ecc,+
DIaka71BS\1bLOA0JG17+?)&.2)dEO2_Z@3/heDJ;aEH=Df0Z9ASc'lEZeC^%14mH/i#FH1G^^-
3A<'?3&NBD0H`8+0Ha@o5rqVH@r$.(DBMYP%14mI/i>C=2E*<43&WBK0K:jE0H`8+0Ha@o5rq>H
Ec#N.B4t^j+@/[1$8XLk2`*EN2_Z@71+k=A3&<?E+>ti++B;?+3_X70FDPM2;K$&\+@/X0$8XXo
2DR0K2_Z@70J5(?3&<?E+>ti++B;?+3`C,Q+A?]rBlbCk;[j'i0ePCB3&<?E+?;201GgmD1GBq1
/heDJ;aEH5C`lP_F)N1#=:GTo0J5==0JG17+?)532E!HO2_Z@4/heDJ;aEH<Bl7F!Ci1@j71BS\
2D-jI1G^g@+>GT+/hf(=0JG1'2_Hd,<Du1E87cUKDIFY^<"00k1bLRB3&<?E+>GQ(/i,@>2E*<4
2D-[+<Du1E:haK]Eb-@l6k'J[2D-sC3&<?E+>GQ(/iPaG1G^^-2D-[+<Du1E6>:LX@<,jn+AP<6
$8X[p2)?p?0JFV(0f^jG0f(UA0H`>-0Ha@o5rqnTDJpXm<XfBl1bLL:3&<?E+>GT0/i#CG1G^^-
3%cm-<Du1E;djPd6=k1T@<,mmDJpXb5n+/W2D-pF3&<?E+>GT2/iP^D2E*<43%cm-<Du1E7WN']
DJpXb5n+/W2_HmB3&<?E+>GW+/iYjI1G^^-3%cm-<Du1E;djPd8oJc^+@AF($8O=g1GC^F2_Z@/
2)d-I2)mBJ0H`)(/heDJ;aEH8Df0K0F_l1C84a6t2Dd$G1H70H0H`),2_I$D2E!KJ+?;&.+B;?+
3_!OlEaiHpCNCUa9+;4c3%d!@0fCsE+>GZ//i5=;0JG1'3A*!.<Du1E8p,#_@<E\Y9+;4c1G1OB
0JG17+>GT,/i5L@0JG1'2_Hd,6Xak@A77MfA8Q7&FDl%>5sc"f1c-gC3&ilR0H`80/iYUD3&<62
1bLI)6Xak@A77Mb@U`no+AuoaB4W2]@WO.2$8aOk2Dd<N2Du[40fCX?2`3TP1E\V/0Ha@o5rq_O
EbT&u@;ZM]1c-gA2D?g=0H`))0J5=?3&<?H+>ti++>>K'3a$$1Ci=N=FDl&.%14[B2(g[A1GCO+
/MT%9/hf"?1bg+)3A*030JG1A<GZeuFU\[3/het50JG1'0J5%50JG17+>>E%+:SZq@<5jaA7]S!
@:++`D.GC\/M/O`$=S(!BQ%oP+@[t+7<<EZDII;i$=m^h@rc:&FD5Z23ZqC8BlbD2F!+4D;aFY9
F!,C5Anbah@;I''Df9M9E+i[$ATJu5@:s.(%16l^H$=1IA90dSARfOjE-#SA+Dc1<@<*nAD/X?1
/0JnF@<6"$/0K"PCgh?8+EM[C/0K%QFCAtp$?U!(Ch5XM:-hfE+>"^(AScHs+B/dW/M/O`$4R=e
+BqT,;aDNS:186YDf0!"+@0RZDf0!+FD56++CT.u+B*5f@q?cKA8Q$uBleB:@<?4%DCJj>BQS?8
3\N.1GBYZW@<5j0B5_rH.1HUn$6pc<@X0(cEb/c(7<<EZDII<3+@f@"6Qf3A@;]Xu@<-W9;gEG+
ASlK29OVCKEaa'.Ed8*$%14=&883-eDfTQ%@;I&e@;L'tF!,C5+@KdWFC?:k+=PO"<%/q!$4R=e
,9T9_@;p="A0>K)Df$V%,"?9iAKX]]Ci![#DJ=61+@BRTDf-\9Aft#jCgh?,7:U.JE-#T3>Tt:q
>=EUPAStpl+CT.u+AHEYF`Uen+:SYe$<1\M+E):0Blmd"+E27?Bln'-DK?q=Afu2/AKXooDBNA*
A0=TbDf-\<AT;j,Eb/c(@X0)-@r,juF(GdfE,oN#Bk)7!Df0VI+CT;%+Cehr@s)TrFCeu*F`V87
B-:/bEcP`4FE2)(C`l,kDIIBr@ps0r<,$2\+=L2W.1HVnARf.kF(HJ.F<G:=+CQC8DJ<^$Ebuq@
Bl.E(F(8WpAM,)rDg,c9ATB=EGAhM<A0>u.D.Oi9Df0--+CT.u+CnnpCj?HsCh[Km+CT;%+C\c#
ARlp%DBMqsBm+'.F(&l-<,$2\+=L5h.4u`7DBNk<A7]d(FDhTq@rH7.ATDl8ARfOjE-#S5E,oN#
Bk)7!Df0V=Ao_g,+B1`OFDi:%<%K/6BOr;sBkCsgEb0,uAKYGnFE_;-DBO%7ATMDl$?UK1+EV=7
AKZ&(@;KLr+Dl7BF<G%(+DYk5GA]#U<+ohcE+*cqD.Rg#EZen(Cij);<$3U7PZ0(SBlbD=BOqV[
@<-((BPh=&Bk&8rBkCsgEb0,uALns<DBO"3@rH6qF"AGCATW--ASrW4BOr<.GAeU4F#ja;%144#
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdLcBM9N4Wm]l+>"^9<"00D$;b/PF<Ga8Cis<1
+E(j7cBM9N@ps6t@V$ZmARopnARloqEc5e;FD,5.BPDO0DfTQ%@;I',ARfY!A90@G8T"tEE+*d/
Bk):%@<*nABQ\3'Eb/d&+E(j7ARfOjE-#S5Ddmd!Ectl5Bl@m1+=L];FD)e<Derj&+CT.u+Dc1<
@<*e>G@bf+%17,e@rHBuARlotDBNM!Ebp"D7<NWhE+NHq/0IZ$A7TLf+@T^[FCfK1+CT.u+@BgV
DImm#+CT/*@;L!9%16r\DKU#1EbTK7F"AGBDIal"@;^"$F"SS,DBO">Blmo/De:,6BOtmu+ED%0
@<?4,AScW7Ci=M?E,oN"Ble!,DCc5(FD,6,AKYMlFC?;4AT2[$F(K62+EV:.+E).6Gp$[ABk1dm
@q?cpDfQtBBOr<0@;L't+E(j7cBM9NE,oZ2EZfIB+>Gc.0F\@V74o]SDBO%7AKYJoDKL#ABk;?.
AoDL%Dg,o5B-;;0AKY])FE2;1F^oN-Df-\9Afu2/AKZ)+Ch7ZtDfB81-t?t3@pofR0fC^G+@ARH
/0K%JDfp,0DIdf2De:,*BkM*%EHP]+BlnVCDdmd!Ectl5Bl@m1+D>2,AKYGnASrW-@:WplDe:,.
F`(W.%17#`@s)U0@<?4%DK?q=Afu/:@<-EA+B3#c+Du==@V'R&@;]Tu@:NeiEa`I'+E(j7FD,6,
AKZ)/D/!m#F!,17@rc-hF(GdfAo_g,+EV:.+EM+;ASuU$ASuU'+EV:;Dfo]++EV:.+EVg=DKKT(
FD)e,ASuU4Ed92Y@:j+iEb&m%B-;A+Cis/qCh4%_A79Rg+DG^9FD,5.A7]joEc#N.@<?4%DBNk0
+O63N/g*G&A7]jkBl%?k+CT.rCjC)9F!,C5+EV:.F(GdfD.R-sF`M&1ASuU2+D,>0FCeu*GA2/4
+CfP'Bk&9,E,96+ATJu+DfQuGPZ/c;Ec5e;/N#49+EVNE.ks%A0Hb(N%17&pATMF#FCeu*Bl5%m
@:F%a+>G!IDIal(DI[L*A7]g)FD,5.F*(i.A79Lh+D#S6DfQt4DfQt3@:NsnG%#30AIStp9lG&m
Ble31+CT.u+B*AnE+ig#F)PqI+>PW)1at$d$4R=O$@[GQ%14[=/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%d@:F%a+>Fuj
+BDoeF_,V:De:-;PZ/bJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15L7EbT].A0>K)Df$UfBleB7
EbT#lC`jiC+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#;Is?VEb'56+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL%14[=/M/P+/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+
/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/P+/M/P+/I`%iARTU%+<VdL+<VdL+<VdL+<VdL+<VfP
PZ1m1+<VdL+<VdL+<VdL+<VdL+<VdL;flGcA79Lh+@U<kDfT(l$6UH6+<VdL+<VdL+<VdL+<VdL
+<VdL+=M;B@rH6qF"&4S+<VdL+<VdL+<VdL+=M;B@rH6qF"%P*/M/P+/M/P+/M/P+/M/P+/M/P+
/M/Os/M/P+/M/P+/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$8"+h0H_J\
+<VdL+<VdL+<VdL+<VdL+>Gf03A;Qu+<VdL+<VdL+<VdL+<VdL+>bl.%14[D0JFUl+<VdL+<VdL
+<VdL+<VdL+<WBr2)?p/+<VdL+<VdL+<VdL+<VdL+<WI#0F\@@1GCL*+<VdL+<VdL+<VdL+<VdL
+<Vd]1b^mC+<VdL+<VdL+<VdL+<VdL+<Vd_2D>RI/M]"6+<VdL+<VdL+<VdL+<VdL+<VdL0et[J
0H_J\+<VdL+<VdL+<VdL+<VdL1G^]o$8!td0H_J\+<VdL+<VdL+<VdL+<VdL+>GT/1b^$p+<VdL
+<VdL+<VdL+<VdL+>Pr2%14d3+<VdL+<VdL+<VdL+<VdL+<VdL+<WBm2)m94+<VdL+<VdL+<VdL
+<VdL+<WEt0F\@D0JFUl+<VdL+<VdL+<VdL+<VdL+<Vde2D?g-+<VdL+<VdL+<VdL+<VdL+<Vd^
1b]@G1,(C)+<VdL+<VdL+<VdL+<VdL+<VdL3&WTI+<VdL+<VdL+<VdL+<VdL+<VdL1,1Hl$8X@i
+<VdL+<VdL+<VdL+<VdL+<VdL+?)2<0H_J\+<VdL+<VdL+<VdL+<VdL+>Gi0%14pG0H_J\+<VdL
+<VdL+<VdL+<VdL+<WR$0JFUl+<VdL+<VdL+<VdL+<VdL+<WBs0F\@H0JFUl+<VdL+<VdL+<VdL
+<VdL+<Vda2_d!/+<VdL+<VdL+<VdL+<VdL+<Vd]1b]@G2D?g-+<VdL+<VdL+<VdL+<VdL+<VdL
1cI6F+<VdL+<VdL+<VdL+<VdL+<VdL0etEl$9'Xm+<VdL+<VdL+<VdL+<VdL+<VdL+>Yu30H_J\
+<VdL+<VdL+<VdL+<VdL+>GQ(%15'K0H_J\+<VdL+<VdL+<VdL+<VdL+<WF"2D?6r+<VdL+<VdL
+<VdL+<VdL+<WWt%15*L0H_J\+<VdL+<VdL+<VdL+<VdL+<WEp0JFUl+<VdL+<VdL+<VdL+<VdL
+<WTs%14gD0JFUl+<VdL+<VdL+<VdL+<VdL+<WBr2_Z?s+<VdL+<VdL+<VdL+<VdL+<WO!%14gE
0JFUl+<VdL+<VdL+<VdL+<VdL+<WBm3A;Qu+<VdL+<VdL+<VdL+<VdL+<WKp%14gF0JFUl+<VdL
+<VdL+<VdL+<VdL+<WU"0H_J\+<VdL+<VdL+<VdL+<VdL+<WHo%14gG0JFUl+<VdL+<VdL+<VdL
+<VdL+<WL$0H_J\+<VdL+<VdL+<VdL+<VdL+<WEn%14gH0JFUl+<VdL+<VdL+<VdL+<VdL+<WHq
0H_J\+<VdL+<VdL+<VdL+<VdL+<WEn%14gI0JFUl+<VdL+<VdL+<VdL+<VdL+<WEn0H_J\+<VdL
+<VdL+<VdL+<VdL+<WEn%14gJ0JFUl+<VdL+<VdL+<VdL+<VdL+<WBo0H_J\+<VdL+<VdL+<VdL
+<VdL+<WEn%14gK0JFUl+<VdL+<VdL+<VdL+<VdL+<WZe+<VdL+<VdL+<VdL+<VdL+<VdL+<WNN
$8FIs0H_J\+<VdL+<VdL+<VdL+<VdL+>GYp+<VdL+<VdL+<VdL+<VdL+<VdL+>OB50fUj@+<VdL
+<VdL+<VdL+<VdL+<VdL0f1!q+<VdL+<VdL+<VdL+<VdL+<VdL0b"IE3&NB4+<VdL+<VdL+<VdL
+<VdL+<Vdc+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve34>@9P0f^pA+<VdL+<VdL+<VdL+<VdL+<VdL
/MeLl+<VdL+<VdL+<VdL+<VdL+<VdL>Wa_M$8FOu0H_J\+<VdL+<VdL+<VdL+<VdL+>Pr"+<VdL
+<VdL+<VdL+<VdL+<VdL+C%#_/hmeB/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$@[GQ%13OO8T#YfDe*F"DBO%8D.Rc>
+EV:.+Co&*ATDX%DIIX$Df-\9Ag#B`<$5mr+DkOtAKZ,:Bl7Q+@<?F)Bk&8qCi<g!F!+n/A.8ld
@:X(j+E(_1ATDs&FD5Z2F!,C5+E;O4F('*1/0K"P+DGp?BlbD,Df'H0ATVL"Gp$g=A7]^kDId<r
F<GL6+EV:.%16ooDIIQ.AT2<oD.Ra%F"SS7@:F%a+>P'PBm+'/+EV:.+Eh10F_)\6Ag#B`<$5aq
ATE&=AncF"+F.O,EcW@8Ec5e($8FOu2'@!Z+>PW)2'=;5F*)G@DJsB+@ps0r6#:CHDII#tAoD]4
1,(C?/0Jn?B4W2Y3@QQi$4R=O$@[GQILQW9/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=<+06PAKW`N/Kdr&@qBP"+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#<affeATJu4Ag#B`<$5dnDf$U>+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$:JTKARfg)+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;Y,PATDs&FD5Z2F!)SJ+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$8!h]/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+
+>#/s/M/P+/M/P+/M/P+/M/(s/M/P+/M/P+/M/P+/M/P+%166L@<*J5+<VdL+<VdL+<VdLcBM:5
+<VdL+<VdL+<VdL+<Vda/QlXnEZd__@;]^h>Tb.3+@10^Ea`Tl>R_#_+<VdL+<VdL+<VdL+<VdL
+=M;B@rH6qF"&4S+<VdL+<VdTF(Jj"DIdf;+<VdL+<VdL+>GHNARTU%6YKnGB4Y<W$6UH6+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdTF(Jj"DIdf;%14[=
/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+/M/P+/M/P+/KcVs/M/P+/M/P+/M/P+/M/Os/M/P+/M/P+
/M/P+/M/P+/I`%A3AiZH0H_J\+<VdL+<VdL+=f6&/hnIk+<VdL+<VdL+<Ve3/Kc/Y+<VdL+<VdL
+<VdL+C$K-$8FP!0J5%%+<VdL+<VdL+<VdW1G^X=+<VdL+<VdL+<VdL+>PQ(+<VdL+<VdL+<VdL
+<Vd\/i5<m$8FP!2(gR*+<VdL+<VdL+<VdW1GpdD+<VdL+<VdL+<VdL+>PQ,+<VdL+<VdL+<VdL
+<Vd\/i><l$8FP"0J5%%+<VdL+<VdL+<VdW1b^O;+<VdL+<VdL+<VdL+>b].+<VdL+<VdL+<VdL
+<Vd\/ia@J0f_0M/heCj+<VdL+<VdL+<W0k2(ga/+<VdL+<VdL+<VdL2(g[-+<VdL+<VdL+<VdL
+<WBk0K'@I0f_3I/heCj+<VdL+<VdL+<W0l0J54*+<VdL+<VdL+<VdL2(gR*+<VdL+<VdL+<VdL
+<WBk0JEqC0f_3N/heCj+<VdL+<VdL+<W0l1bLR,+<VdL+<VdL+<VdL1G1X0+<VdL+<VdL+<VdL
+<W?j2`;*P0f_6J/heCj+<VdL+<VdL+<W0l2D.!4+<VdL+<VdL+<VdL1+kI-+<VdL+<VdL+<VdL
+<W?j2)5UJ0f_6O/heCj+<VdL+<VdL+<W0m0J5=-+<VdL+<VdL+<VdL1G1[1+<VdL+<VdL+<VdL
+<W?j2`M6R1,(C9/heCj+<VdL+<VdL+<W0m1G1X0+<VdL+<VdL+<VdL1G1@(+<VdL+<VdL+<VdL
+<W?j2D>RI1,(C>/heCj+<VdL+<VdL+<W0m1bL^0+<VdL+<VdL+<VdL0J5@.+<VdL+<VdL+<VdL
+<W?j0fTUL/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$@[GQILQVn$<1\M+CTG)Ea`Tl+CT/*F^])/@q]:gB4W3(Ag#B`
<$6BnF!*.h3B84'ARfXrA0>K)Df$UO3Ar`;FDi9V3B/]F%15XEG@br/E\&>TBOr;pG%G]&B4W2o
DJjT*C`mG0@rc-hF(HJ<@<3Q+F`VXI0J57>+EM+(Df0).Ao_g,+>Gl92'@!Z%14jE0JG%#@;]Tu
Df0B:+>>E&3$<9R@rH6q+D,Y4D'1Sf0JFVkD]geh0JtI*7WifqEb-A'BOPdkATJu&DIal3Eb0-!
Et&IjDBR5h<$5[ZDBNh8F<G%(+E2@4A8,OqARlp-Bln#2@qB\&@;0V$Gp%0BDI[6#FD,6(Eb0?,
@ps0rD/WrrCi^_;Ado)hBOr<*BR+Z5@ps0r@psM$ATJu&Eb-A2Dfd+?Aftc$B4rE!DJsZ1BHV87
ARfFqBl@lA+@UNsEa`p*CghF"Df0V*$>+<sD'3q6AKZ)'@VfTuG@bK$BQRfr+C]U=FD,5.Ci=3(
+E1n4Bl@N)FE1r1A0>K)Df$V=Bk1Xg+C]A"CM@[!+E(j$$?Trm+AHcmDBNk0An?!*Eb/[#Df/um
Ch4`#F*),5@<?(%+E(j7.lK=/F(Jj"DIdf2Bl5%K0JP74+=fH.+EM+(Df0*,%16fe+>PW.0J"=s
1,(L,F(Jj"DIdf2Bl5%K0eb:4+CT.u+=f9*1*CXL@rH6qF!,17+EV:.+F.O,EZd+m0JG*g$4R><
F`_\=A7Zm*BOr<*ATDL'A0>f&+E(_1ATDs&FD5Z2F!)kg0JFV96U`,>D]geh0Jst?74Bc1FD,5.
G%#30AKYo'+O63N%16TRDBND"+D#e>Ea`p*CghEsA0>K)Df$V6ARTY&Eb/c(G%#30ATJu:F(oN)
+EV:.+Dbt6B.\4:Ebuq9ARTHc$?0Eo@:F.kBk&9-Eb0-!3XlE*$4R=b+<VdL+<VdL+<VdL+<VfP
PZ/bg+>#?&+=eQj1*A%hFC$^FF(Jj"DIdet$6UH6+<VdL+<VdL+<VdL+EqL1Eb.9S+ES_h+=MMH
@<*qS3&30:0/5.7%13OO5p15[EbT*++E(j7>B"LsH#@P;Bjkg#AU&07ATMp,Df0W%-tm^EE-"&n
04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47:TbJ2(rKOCij*-E,TQ</nf?DCagK?@<Q2k$=[RXDBNJ$
EbT].A0>K)Df$V=BOu6r+Cno&@3BZ1+EM76E,96#Gp%3BAKYQ-@;L'pFD5Z2+E(j7cBM9NAoD]4
@;^?"$?U!!AKYN+EbTE(+EV:.+DG_8ATDs&C`k;a3B9)BFDi9P1GCL:/g+,,AKY3"DI[6uFCAm$
FEo!CD@HruPZ1p:BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_@psI:06M/BATDm$Bl8$<
/nf?DCagKFG%G\:FD,B0+E1n4Bl@N)@ps6t@V$ZnF*),5@<?'k%16]fDf$V<@psJ$ATAo-DBO%7
AKYi$@<6R3ASl!rFE9&W7W3;i@:Wn_FD5Z2@;I'#DJ!g-D..O#Df.*KF(JoD%16<-AScHs+B0Il
DIakiDJ=9*EcYZ*+B3&lAR-]tFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;QASc<=A7]S!
@8njmFDYhC/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$<M.dCh+Z1Bl.E(H>d\4F!+n3AKYDkFEM#.Cj@.4
@<6!j+E)-?6Z6m`A8,piFCetl$<:tXG%G]8@;I&cBl.E(-rj56.4u`7F<G:=+CT.1@<?F)Bk&9-
Bl.E(F*VY5BQA$/BmO?$+CT.u+CSeqF`VY9A0>u4%17/u@<iu>Bln$&DBLVc3?WBS@rH6qF!,C5
+CT>5Ec5i6D/!KgCi"A>A7]joEc#N.ARlo`DJ=9*EcYZ*+B3&lAIStp<E(D"+AZKW@<6.$DII?t
Gq:(H+C$+,ARTO#F(Jj"DIcur+DGm>@:Wn[A0>u4+B;B.+EVNECLq'r+DGp?Bl5&7H#@+$$?p3+
BHU;S+=MGIBk(g!@q]:gB4Z-,A9DH+FDi:F@<-'jFD5Z2F!,17+@T^ZFD+o,F!,LAFCB9*Df-\<
@<?'0/e&-s$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$6pc<;IsHOEb0,uATJ:f%15gJEcPl8Df.*K9J.GrDIakg
FCfE)ASuR-DCco"/g+%E/0J1A883-eDfTQ%@;I&e@;L'tF!,C5+EV:.+@T^ZFD+o,Et&IDCi<g!
+@U<kDfQuGPZ/c6DIal3BOr;R@;KFrCghF"Df-\9AfsNPCh[j0ATM*#/0IP;+@p3fF=n\%F*)G@
DD!I_<c;e,%14mK+AcKeF<E@j+@1-_F`VXI1,(C=/0I]+/g)l(0J">cE$-ql2_?gA2BXD'0JG=4
/e&-s$<)%XE+ig#F)Pq=7P7R]@;]Tu88iWeA7]X$9eJ^a/0HE.FDPB,+E(j7883-eDfTQ%@;I&T
@r,juF(HIg@;p9;/.DqR@;TIoBk1jf+B<;nFtQU3ATMoF/0I;gD.7O"A7oI)+>Gl92D,FG%14[=
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%14jE0K1+K@<,jk+>Pln@<5jaE,TQ<DJsB+@;K:^G]7\7F)u&6DKB/sDfT2q
AScHs?Z]XlA26(g+BqT,;aDNS:186YDf0!"+@0RZDf0!+FD56++CT.u+B*5f@q?cKA8Q$uBleB:
@<?4%DCJj>BQS?83\N.1GBYZW@<5j0B5_rH.1HUn$8!AC+Br&@Df'&k-tm^EE-"&n04eX0BlJ-)
/n]6;@kMY-F($\6Dg!dF@r,juF(Ht;FDYhC>n%,M$6pZt7:U.JE-#S5=(Ph`;e^>b>psB.FDu:^
0/%BbCgh@*H#n(=D(]^7F($\6Dg!dF@r,juF(KDGBQ%a!0.@>;%14=)+C]U=7WN'N+@U?jAStpl
/0IG]7RJ:pCgh3mFCB38+B*Q,FCf<1+A?3QDfT9.DfU+4$4R=e+AcumH#@P;Bjkg#7<iclATMp,
Df0V=AoD]46tL1V@3AMl.*e&V.3K',%16<QFEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;Q
ASc<=A7]S!@<?I,Cj@ci0JkCqFDYi"-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d47;-7K
E%ba5Cij*-E,TQ<1,(C=/nf?DCaff#%14=)+@^'gAKX]]Ci![#DJ=61+@BRTDf-\9Aft#jCgh?,
7:U.JE-#T3+C&,>F)Y].@;?uoDIakaAS$"*>[8H]$4R>BF(oN)+EV:.+O63N+Eh10F_,V:A7]dq
G%G2,Ao_g,+EV:.+D>J1FDl26@ps0rEb/a!Eb$;$DIal%Ec5e;A8-'q@rr.eDdmd!Ectl5Bl@m1
+=M;BANCr<<+06PAKW^5-tm^EE-"&n04eX0BlJ-)/n]6;@kMY-F($\6Dg!d-7:TbJ2(rKOCij*-
/nf?DCa4%1@PK;S%16N]A0>)U@:F%a+>R4NBQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZNX
@psI:04\X1FCB8DBQS*-,BR@'1+==p/0J@DF(KB+ATJt'$?'N!E,TQ<DJsB+@;I&tG]7\7F)u&6
DK?q6@<Q3)@V'+g+CfG'@<?'k+EVNEF(oK1Ch[L,+EV:.+D#_)Cis0.Bl@l3De:-;PZ/c;DfQt/
DL!@HBl.E(A9Dp,DJ'CcFD,5.Bl8$(Ectl-+>#<.3B84(D]gPd0JG15%13OO=(NLbAS,XoAKZ).
AKYMp@qfdgC`n"7@<*Jq,'dE;+CT=6AoDL%Dg-7`%13OO+<VdL+<VdL+<VdLGp#6mH"CE)+=eQ_
D/X<6BHSlL0J5430/53k$4R>ABPDN1B5)O#F!+^3H!DO9AoD]4FD,5.D/!NkCh4`-Afu2/AKYi.
DKKPC+EqL5@q[!!F!+n$@s)g#FCcS+DJsZ1BFP;]Bm+'*+EV:.+E2@4@qg!uDf-\3DBO%7AKYc+
Dg-(AG%#30ATJu4Ag#B`<%]:mBOr;uDes6.GA1r-+E278H#@P;Bjkfe$>"I$Eb0<5Bl@m1+Ceht
+C\n)F`V,)+Cehr@s)TrFCcS:BOr<0@;L't+E(j7cBM9N-u!QAF(Jj"DIdf;+E)F7EZfI;AISug
Bl.E(E+O'(De'u#Dg#]4ARlomGp%$;+EV:.+Bq<LG%DdjBl%TsDJj02D'22SDJsD8De:+jDerj&
+@TdVBlJ-)F#ja;/MT7G3?WE^+=f6%0JHc\BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_
E-5W20/ZHk;ai<PFDYhC/e&-s$:8<9DfTD3FD,5.H"CE)+>#H)0J">V@;KFrCghEs3XlE*$6UH6
+<VdL+<VdL+O63N+?^i!1,'h$+>Ybq.Nik?1(=R5+<VdL+<VdL+<VeNBOu3q3ZoPf+?^hqGqCa1
1,(.10eb9j$4R>/ATW--ASrW9ARTV#+>#H)0HaeAA0<B[0JG%#G@_n>F(HJ9BOr;s@<>p#Ao_g,
+BqfR@VfTu0jQ2@FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02+fE@<=@[A7]S!@<=,8FDYh=
FCAW5.4cTQG[k<(F<G[=@<<W(DfQtBBOr<3ARTU%/N#49+EqB>@q]:gB4YT_$?Trm+Eh10F_)[M
2_d<H+EVNE0fLjA1G1U/Bl5&3Eb&a%+EVNE@<QR'A0>;'A8-*pDf0Z2DKTZ8Gp%<FFD)e=BOqV[
E,oN5BlA-8+D,P4D09Z'+CT@7FD,*)+D#M1@q[J;<+ohcG%#30AKYT'EZiYl<$5mr+D5D3ASrW"
Gp$N)$?0p"H#@P;Bjkg#De:,6BOr;EFD)e-AS6$pALnsJBPCsi+ED%4Ec5K2@qB^(FD,5.G%#30
ATJu.DBN._@:F%a%14gq-n[,*;ak2)F>Y^^AScHsF=q6KD/:G=@:Cr?+EqOABHU`$+D#S6DfQt<
Dfd+<@<-!lEZfI;@;[2E+EM+(Df0*,3XlE*$6UH6+<VdL+O63N+?^i%0JtgG/iFh(+>GQ)1bLU>
+=\LV+=eQj1G1UG1GLU,.Nik?1*A.k2(gmH1,(RA+=\LV?8E#t+<VdL+<VdL+<VdL/Kc`"0fM*P
1c7$2.Nik?1a":k0J5%71,1^E0f_!3.Nik?2'=Cl0J5%53A<6D2Dm6E+=\LV?8`o8$6UH6+<VdL
+EqL1Eb.9SFW`giGqUm+0F\?u$:8<GG@b?'+F.O,EcW?R2)$^,@;]Tu.krq90J">jAKYDo@;0U%
F`V+:FD,5.A79Rg+D,Y4D'08p>?#$?Ch4_D>psB.FDu:^0/$mHCh[j0AM.V:An*H2@<5j0B5_rH
9LWH"F>Y^^AScHsF=q6KD/:G=@:Cr?+EVNEA7]dqG%De)+E278H#@P;Bjkg#De:,6BOr;EFD)e-
AS6$pAM+E!%144#+<VdL+<\so<$4=H0f:mH/i"P$+>l#7/hf"&.NijV.j-c*/i#4>2_lL*+E_!G
+=eQg/i,4B2`NN7.Nik?1CX[6+<VdL+<VdL+<VdY+>>E-2)$gC2DZI*+E_!I+>"]i/het:0JtOE
3B/-2+E_!J+=eQg/het=1Gq*H0K1d1.Nik?2@U!9+<VdL+<VeNBOu3q3ZrPf4Wl.u/MSq50I\Y0
0JEqC%15F5FE_;-DBO49@<-E3.krq90HaeAA0<BW2_Zp:+Cehr@s)TrFCdKB$4R=b+<VdL+<VfP
PZ/bg+>GW*+>"]i/ibmF3$9[nF<E.X0J5%62)@!1.Nih>1*A(iFC$aG0-E2.1-#dN+<VdL+<VdL
GA(Q.ANCqVF<E^hGp"[]0fC^>%13OO6=k7_AS#a%H"CE)F!)tf2_Zp.@;]Tu.ks";0J">V@;KFr
CghEs3XlE*$6UH6+<VdL+O63N+?^i,/iYX0.j-Mu0fC^A+=\LU+>"]i/het:3ANQO+=\LU?8<WR
+>>E%0JG4;1G^p3.Nih>1E\7lFC$dH0-Du(2`*3B0F\@3+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc,
0JEqC%15F5FE_;-DBO49@<-E3.ks";0HaeAA0<BW3&WHA+Cehr@s)TrFCdKB$4R=b+<VdL+<VfP
PZ/bg+>GZ)2_lL-+>>E(1GUdD2]sRmF<E(V0J5%52E3TL1*A%hFC$^F.j-Mu0JG=<0ekR/.Nih>
1E\7l0J5%50JbXE1H$@*+EUpH+:SZ#+<VdL+<VdL+<VdW+>>E%0JG181,1OC1*A%hFC$gI/Kc`"
0JG170JG4>3B833+EUpJ+=eQg/het50JG170JGIF2'=@kFC$m8$6UH6+<VdL+EqL1Eb.9SF<E^h
Gp"[]0fUj@%13OO6=k7_AS#a%H"CE)F!*1s2D?7^DIakE3A<-<+Cehr@s)TrFCdKB$4R=b+<VdL
+<VfPPZ/bg+?(o21*A(i0J54A1H-F++ES_X+>>E'2).$I1a"7jFC$^F.j-Mu0JPIF0K(gK+=\LU
?8E#t+<VdL+<VdL+<VdL/MJe20JG=?2`!?I1a"7jFC$dH.j/q?2'=Op1,C^@2`(sN+<VdL+<VdL
GA(Q.ANCrU+?^im+>"]j3&WH"$4R>/ATW--ASrW9ARTV#+>Gl10HaeAA0<Te1,(7%@ps1`F_kK.
ANC8-%144#+<VdL+<\so<$4=H/M\q;3?Tgp0eP:C1bg^F+=\LU+>"]i/hf.C3&rcT+=\LU?8<WR
+>>E%0K(XG2Du[-+EUpG+>"]i/het50f_08.Nih>1^sd7+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcc.
0JEqC%15F5FE_;-DBO49@<-E30f_!C+CT.u+>Gl50e=GW@;KFrCghEs3XlE*$6UH6+<VdL+O63N
+?^i&0eP48+=eQg/iY[E3AW.,+>"]i/hf4B0eb:(.Nih>1*A(i0J5%51,(^E2BXIlFC$a4$6UH6
+<VdL+EqL1Eb.9SF<E^hGp"[]0f_!C%13OO6=k7_AS#a%H"CE)F!*1t1bg+]DIakE3ArTC+Cehr
@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>Pr00K1+)+>>E)0K1J'+>"^X?8=/h1G^.(+EUpG+>4im
2)I6$$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]0f_*F%13OO6=k7_AS#a%H"CE)F!*1t2DH=_DIakE
3B/oJ+Cehr@s)TrFCdKB$4R=b+<VdL+<VfPPZ/bg+>br.1c6C++>GK&2E*+-+>"^X?8=/h2D?7*
+EUpG+>4ir0fTUL+<VdL+<VdLGA(Q.ANCrU+?^im+>"]j3B&f)$4R>/ATW--ASrW9ARTV#+>Gl9
2BZFGA0<W]0JtC(@ps1`F_kK.ANC8-%144#+<VdL+<\so<$4=H2DZsF2BXLm0J5.;1c6C*+ES_X
+>>E%2D?pG1a"7jFC$^F.j-Mu0JG4?1,h'5.Nih>1E\1j0J5%50K(dC3&*64.Nih>1a!57+<VdL
+<VdL+<VdL.j-Mu0JG171,CjF2*!Z>.Nih>2%9m8+<VdL+<VeNBOu3q3ZrMe4Wo"m/Kcf&0JEqC
%15F5FE_;-DBO49@<-E31,(C>+CT.u+>PW.0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i*
1+kRB+=eQg/i,7<0fL4)+ES_V+>>E%0Jt^I3?TdoFC$^3$6UH6+<VdL+EqL1Eb.9SF<E^hGp"[]
1,(C9%13OO<+oue+D#e:Eb0<5Bl@l3BlbD-ATDL.ARloqEc5e;ATMs-D..NtA0?&(Cis<1+E(j7
cBM9NBl5&8BOr<3ARTV#+>PW*0F\@tDIakF0JtO:+B3#c+Eh10F_)\-DfQsU0JP7(-oNt93?WBS
@rH6qF"&5GF!+q#F(Jl)Df-\++Dbb0ARTUqGmt*lG][t7E,TQ$FD5Z2+D,Y4D'1Sf0JstqF(oN)
+>>E(3?WBS@rH6qF"_fM@<*J=@<Q4&@:s-oAo_g,+>Gl:2'@!Z%14jE0Jt:3+B3#c+Eh10F_)\-
DfQsU0JtO,-oj(+F(Jj"DIdf;+DGm>Ch[cu@<-10+D#e>Ea`p*CghEsA0>K)Df#pj1,(F:+E_a>
DJ((G/iGU1F(Jj"DIdfAH"CE)+=LZAATD3lAKZ#%FCcS,Ec5e;0f^pB+EVNE1,(C9.4u&:%15F5
FE_;-DBO49@<-E31,(R>+CT.u+>PZ/0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i!1,'h$
+>Ybq.Ng,fGqCa11,(.10eb:1?8<WT+>>E*2DR67.Ng,p0f:X-/Kf<f%13OO<+ohcCghC,+EV18
D'3P6+DG_8Ec5K2@qB0nFDi:5Ch[a#DIIWu+EV:.+Co2-@rH7,Bl8'-FEo!;F<E=m2)$Wl$4R>.
AoqU)+>PZ/0J">V@;KFrCghEs3XlE*$6UH6+<VdL+O63N+?^i!1,'h$+>Ybq.Nik?1(=R5+<VdL
+<VeNBOu3q3ZoPf+?^hqGqCa11,(.10eb9j$4R>.Cht5;@;L'tF!,C5+O63N+C\c#ARlp%DBMYl
EcPl8Df-\+DIakgFCfE)ASuR-DBN1g1,(C=>[8I\F)uJ@AKYCj$?fioF_)\-DfQtBBOr;\Df9Mu
-Z^DOARfk!@<*K!@q0(dATD4$Bl@l3De:+D1,^7`Eas0%@kV>;>[B0<+@pEpAThX*/.Dr.BOr;T
9Md;r0JG163&2UmF`(W.+D#M*ASl"!BlbD.D/a<0H"CM/Bl5&8BOqV[>=2h:Df/i/BQS?8F#ks-
ARfOjE-#SCB6.Zp/oG*=@4l22FtZc_E-5W20/ZHk;ai<PFDYhC+E_a:F!+m6F)5Q'BQS'9+Co1u
An?!oDKI"E@;L't+E(j7/M]193&NZ)$=RsbF(Ji7@sM<c1+j\KBQ\AI+CQC6D..6s+Cf>1Eb/a&
Bl@l3>U!Z_+s:`FF*&O6AKYDlA7]9oFDi:DBOr<0@;L'tEt&IeATDL.ARloqEc5e;FD,5.E,TQ<
DJsB+@;I&tG]7\7F)u&6DK?q4DfQuGPZ/c7AS,k$AKZ).AU,D.@;[2sAKZ,:ARl5WBl5&8BOr;j
6XakNDI"Z(FEDJC3\N-t@r,juF(Ht:F(So7DIITp/n]*G02k;YF^fDF2,-G:74r7qD/:X1$4R=b
+<VdL+<Ve:+?^i!0J5%50JG4:3AWE5.Ng-b+>"]j3AiZC?8;rs%16$JDI[6#FD,5.G%#30ATJu4
Ag#B`<$5dkEZfI;AKY])FCfK9@;I&@3AiZ:FDi9W0JG@,G@bf++Co&(Bm+&u%16feA7]^kDId<r
F<GL6+CT/5+Dc1<@<*K%E+ig"ATDL+/0JhK+Cf>1Eb/a&Bl@l3BlbD7AS#C`A0>K&EZfI;Bla^j
E+O'(De(I0$4R>ABOr;jF`(]#Ecb`(DKL.HBl5'=PZ1p:BQS?8F#ks-ARfOjE-#SCB6.Zp/oG*=
@4l22FtZNX@psI:06M/BATDm$Bl8$</nf?DCagKFG%G\:FD,B0+E1n4Bl@N)@ps6a$=[QhATMs-
D..NtA0>K)Df$V<@psJ$ATAo-DBO%7AKYi$@<6R3ASl!rFE9&D$4R=o/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R=e
,9TlqAn?!oDI[7!%13OO9lG&mBle31/0IV=+CT.u+B*AnE+ig#F)PqI+@[t+;D'LC>Tu^QF*)>@
Bk(Rf+BDoeF_,V:De:,6BOr;T@<-I'>UOS%$:AWJ@r!2UEcQ)=+O63N+CT.u+EV:.+@BRR@s)Tr
FD5Z2+E(j77:U.JE-#T3>Tt^A8hM5WBleAK+@1'jEc5hJ/0Iu3Cb?/(1Gp:O@<-H41FsY7F_>i<
F<E=m0Jk=':2_a-0etF6+E29B1GUm@1G^p3-o*J11at$d$4R>@FCfE)ASuR-DBMD$;BTCcA0=E]
F_kT"DBMY+5qX]2.RA/m@<3Q0AfsWYF*)>@Bk(Rf+@TdVBlJ-)+AH9`F"/^M$:A6=@WH0nB4W2c
DJ=8H:i^,gF"T!d6Xah@EbT&sALnrY3B/oL%13OO/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$8O:h2]tn+F<E7n%16uq
FCB9*Df/orDI73uDJ*[*F_#&jA5I>]?Ys=/2bnL;@<?4%DBMMg+@TdVBlJ0.@ps0r9Q+f]BlnK.
AKWDHPg63V+CT.u+AuodBQP@_F(8d!F(oQ1+=PO";F)`@$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO7WNEa+A-'f+B2ceDImi9
F!,[<@WQ7*AKY2jFEDJC3\N.(AT)O.DeF*!D/EusF"Us@D(fdLFCB9*Df0VL>psB.FDu:^0/%3S
DfB`8B6%EtD/!L$/n8g:05boS@<?4%DK@H[/e&-s$:/K@DfTQ6BPekkD]hDcD/aW>AKXrcAKX`j
FCB9*Df-[hDBMVkDJ*[*F_#&+-t$R^F(o#2%13OO<+ohcAoDL%Dg,o5B-:W!B5_g)FD,M6@rH4'
F`_29+EV:.+Du=D@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(BlnK.ALns<DBNJ$B6%QpF"AFC$>+3s
+CQC*Bm+'*+CIf0?m&luB6A'&DKIKR+<X6t+DGm>BlbD+@<6!j+E)-?FD,5..PWqC0H`qQ<?P7S
AT)U7+E(j7:3CYeFD5Z2+CT.u+Auc]F^oN-Df.0W%13OO<+oue+Eh10F_)\0F!,R<AKYK$EcP`$
FD5Z2+EVNE@;p1%Gp%3I+EV:.+AG9j:*=^gCis;3De:,6BOr;t@r,juFD55nC`j/oCi=3(BlnK.
AKZ)5+E(_2@;0U%FD,5.<)Q^b+Dbt6B5)I1A7[;7GA2/4+CQC7BOu+&ATVWr@;I'*Eb/`pF(oQ1
+E(j7_QbdI0JG4(@<,j#F(Ji6%13OO6#LrjFE2).Df0K1ATVs,@j#B+DI[d&Df0V=.!'*?/0JG@
F"AGU@;[V=ATT&'Cb@.ZF`V,)+DG^9FD,5.E-#T5A8a&0De*E1+:SZdF)uJ@AKZ#%A8,Ii+CT;'
F_t]-FE8RIDJWm*F!,CCBOu4.Bldi.Bl7Hq@psIjA1euI+A$GnFD,B0+Cei$ALnsGBOr;uBl7?q
+:SZuATN!1F<G:=+C\nrDJ()%Df0`0Ecbl'+DG_8D]iS%B6%QpF!,(5EZek1DK]T/Bk;0lAM+E!
%17Q5IXV_5;IsH$%15CBFE2;;Df'2u@;I&PChI[,Bln$*F!*%W12^VF7:^+SBl@l3-o!_B3%5sZ
$;+l<DBMYbAT`&'$;bkS/g+50Ci!rsDJh$mASc06+A$H\/e&.Z;aO5%0J,:A1G_$L/N,=80b"I!
$;tGI3XlEbG]7J-DIIX*Ed8d+F`;;9ASl!rF<G[D+EV:.+@1'jEc5i6D/!KgC`l#[D..<j@j!0S
3B8iD%17&/0ejemD]j!R0f0=H8Q.rN+>>B-1Gq*F1+bCD/N4+GIXZ`p%13OO%15O?ASl!rFE7lu
%14gB+CIf0?jT>7DImisC`l><+Du==@V'R&AoD]4B5)O#DBNIuFCd!GFD5T'+CT.u+O63N%14jC
+CJ/V#ukVUAKYSn@ruX0+DG^98p+ra@;[2tASuU4EbT*++ED%'CN"*%A0>K)Df$Uh1,(C9/heh!
@rHC.ATMg/DIdI!B-;;7+A,$2$8X:W?pnR=<,YZCA7-Md<+oue+DGm>@3B&uDK]T3F(oQ1+D,%l
FDl1BF`V,)+EVNE@rH7.ATDl8A7]CoAS#p*Bl8$2+:SZ#+<Ve<EHPu=@;KLmF<GU4A8,IiF"SRX
=(NLkF_l/6E,9eBA7]CoAS#p*@X0)<BPDN1Amo1kDfQtBD]it-FCAm$+:SZ#+<VeKBOr;tEHPu=
@;KLmF<G"0B5D-%AU&07ATMp(A0>T(+ECn$Bjkn#/g)93Dfd+5G%G]>+E2@>B6%EtD/!m#+:SZ#
+<VeC@;]_#@:s-oBOPs)Ap&!$FD5Z2F!,RC+Cf>-G%G]9+C\o(G@b?'+ECn$Bjkn#+CT.u+Co%r
Eb/g'/e&.E/g+PG?jTSNFCB9*Df-\=ATDKrF!+n$@s)X2CghF(EZcc=Eap55ARfXrA9/l<+>GQ(
0JFq.%14sF+CKCJ?jTP=@;[3!Ci=3(@<?4%DBNk0+EV:.+Dl%8DBNP3Df$V=BOr<-F`&f@$8sLZ
@!=A6#u+u>DBO"=Cgh?,@;^"#@;L3A%15$H+CKCL?jTP=@;[3(F`(W.+CT/+D..7+/e&.I/g+PG
1ggV`F`(W.+CT;'F_t]-F<GL6+DbJ.BlnK.AM+E!3A)F^G;Wb79Q+f]BlnK.AKYo'+CT>$ASu$m
DJ()0De*E%De:,.F`(W.+E):0BlkJ9DBO%7AKYPoCh[j1Bk&7p$6UH6+CT=6D.R-sF`M&(+D,Y4
D'3q6AKYi$@;[3!EHPu5Dg3CCAftVmFCd'6$8F4e+CJ_VF(n$RB4)$@F`_&6Bl@l3Bl5&)@r,ju
FD55nC`mP4DJ*[*F_#&+AU&07ATMp(A0>T(+Co%rEb/g'/e&-s$4R>kIXV_5+B0I+4Wl.F6m+'(
1,LjC2)I0>+>4in2Dm6I%144W1*A_&<%:iV$6W;(+?^iH.TA/4$4R=b6tL"1Dc1"S+?^i'/ho1;
2*!EM2)@*L3B&rS1*A4m0fUir$4R=bG;14'+>Pr9/iY^B1H$@++>bo41,_'D0ekC>3%@lM/Kc`"
0JG4A0f1X8<&,RH+=L2F+>4il3&rfS1ark@+EoO_4Wm.(B2ieI@:Ui9G;1NU$4R=bG;::(+>Yl6
/i>CC2_lL++>Yl83B8]G2)$gC.T@NB+>>E%0JG4>0Jb1X1*A.k-r_uF0-E&)0JG17.1HV,G;::(
+@KdR<,YZCA1B!O1+<Y>%145%1E\h'0f(X=3ArWQ3$9^o1cI?J3B/WN2E*EP3%@lM.j-Mu0JGIE
3B&]C<&,RH+=L2F+>4ip2DR-D.1HV,G;C@)+@KdR<,YZCA1B!O1FWb?%145%1a"q(3AW9C2_d<I
+=eQk3&<<D1+k782`3BN.T@NB+>>E%0JbUH1,UO\1*A(i-r_uF0-E&+2_m<G.1HV,G;LF*+@KdR
<,YZCA1B!O1ark@%145%2'>%)0etU=0JkUD1*A.k0f_$H/ho.?1,^j:<$3\60J5%51,(X@3%@l_
+=eQ_<&5XM+>br00JG10%145%2'>%)6tL"1Dc1"S.O]Ku.1HUn$6UI8+?^igBl5>C2(:"'/MT1@
/i"nU+>"]j2_d<Q2CT(B+<YkN4Wnqk.j/nIDC@7i.!IKj.j0$n+>"^[0e"P$-nR/+2C_ZK/Kcc(
0fV*@%144#G9B$kG9ACYF(oM?1+F\r1a":kG;Ufu.OZl(1,h$4/Kc`"1+H6P%144#G9B$kG9ACY
F(oM?1*A%hG;Ug!-nm8/.T@N@+>PW/1+<Y>+<YkN4Wnqk.j/nIDCB]a.4Q`#1bps3/Kci%1b)HR
%144#G9B$kG9ACYF(oM?G;CZt-nm8..T@N@+?)#1.1HV,+Enqk+EnqY+EM77-o*8#G;LEm+Eo[c
/Kf6l.3L,`G;:Ts-o!>0.T@NB+>kl4.1HV,+Enqk+EnqY+EM77-o)np+EoXb.j0$n.4Q_t0J513
<$3b81H79A%144#G9B$kG9ACYF(oM?1+F\r1a":kG;UKp+EoOh+>"^[1+=\$1,1^1/Kc`"2(DQS
%144#G9B$kG9ACYF(oM?1+F\r1a"@mG;1Nh.j0$n.4Q`#1-$I-+>>E&.T@i+$6UI8+?^ik+=eRU
Bl5>C1E\1jG;Ug!-nm8..T@N@+>u#)%144#G9B$kG9ACYF(oM?G;UKp+EoUj.OZl&/hnhT+>"]n
3%5:D+<YkN4Wnqk.j/nIDC@7iG;:Ts-o!Y'/Kc`"0e--O%144#G9B$kG9ACYF(oM?1+F\r1*A(i
G;LEm+Eo[c/Kf6l.4H_p0J5(0<$3b80fCHi$6UI8+?^ik+>"]l0JP%uBl5=S.O]Kt+=eRY2(9Xu
+EoUj%144#G9B$kG9AI[0f:p?F(oM?G;C?n+>PEj0e!P=+<YkN4Wnqk.j-Q%1FdH[DC@7i.!IKj
.j0$n.3L2bG;CZW$6UI8+?^ik+=eQW2DZh(Bl5=S.X*Tr%144#G9B$kG9AI[+>l//F(oM?1+F\r
0d%thG;LEm+Eo[l+>"^[1FWb?+<YkN4Wnqk/Kc/n0e.6YDC@7_.Nipl+=eRY1E\1jG;UfY$6UI8
+?^ik+=eQW1cQt+Bl5=S.O]Ks+>"^[0e"O\$6UI8+?^ik+=eQW1c?h)Bl5=S.O]Kt+>"^[1FXFs
+Eo[l%144#G9B$kG9AI[+>Yu,F(oM?1+F\r0d%thG;LEm+Eo[l.1HV,+Enqk+Enq[+<WHp.W]<A
-o*8#G;C?l+EoXb.j0$n.4G]5+<YkN4Wnqk.j,ri3@])aDC@7iG;CZW$6UI8+?^ik+=eQW1-$h*
Bl5=S.O]Kt+=eRY2'=InG;1Nh.j0$l.1HV,+Enqk+EnqY+<WEt.W]<A-o*8r1ark@+<YkN4Wnqk
/Kc/k1+I?ZDC@7i.!IKj/Kf6l.4G]5+<YkN4Wnqk.j,ri0e.6YDC@7iG;LEm+Eo[c/Kf6n.1HV,
+Enqk+EnqY+<WBs.W]<A-o*8r0d&%jG;C?l+Eo[l%144#G9B$kG9AI[+>G`'F(oM?G;:9k+Eo[l
%144#G9B$kG9AI[+>GZ%F(oM?G;C?l+Eo[c/KceuG;1NU$6UI8+?^ik+>"]Y0et5"Bl5>C2'=In
G;:TV$6UI8+?^ik+=eQW0ek/!Bl5=S.O]Ks+>"^[1asj_$6UI8+?^ik+>"]Y0eb(uBl5=S.O]Kt
+=eRY0e"4q+Eo[c/Kf6n.1HV,+Enqk+Enq[+<Vdd.W]<A-o*8#G;LEm+EoO_.j0$n.3L,`G;CZW
$6UI8+?^ik+=eQW+?(ckBl5=S.O]Kt+=eRY2(9Xu+EoRi%144#G9B$kG9AI[+<WTmF(oM?G;C?n
+>PEj0d%thG;:TV$6UI8+?^ik+>"]Y+?(ckBl5=S.O]Kt+=eRY2(9Y"+EoRi%144#G9B$kG9AI[
+<WTmF(oM?1+IK&+=eQi.X*]l.j0$n.1HV,+Enqk+EnqY+<Vdb.W]<A-o*8r0d%thG;CZW$6UI8
+?^ik+=eQW+>t]jBl5=S.O]Ks+=eRY1a":kG;UKp+EoOh.1HV,+Enqk+EnqY+<Vdb.W]<A-o*8#
G;LEo+EoOh+=eRY1E\1jG;UfY$6UI8+?^ik+>"]Y+>t]jBl5=S.O]Kq+>"^[1FXFs+Eo[l%144#
G9B$kG9AI[+<WQlF(oM?1+IK&+=eRY2(8tA+<YkN4Wnqk.j,rW2(EZ]DCB]b+>"^[1+<Y>+<YkN
4Wnqk/Kc/Y2(EZ]DC@7i.!IKj/Kf6l.3L,`G;UKp+EoRi%144#G9B$kG9AI[+<WNkF(oM?G;UKp
+>PEj0e!P=+<YkN4Wnqk/Kc/Y2(EZ]DC@7i.!IHi.j0$m.3L,`G;UfY$6UI8+?^ik+=eQW+>bQh
Bl5=S.O]Ks+>"^[0e"4q+Eo[l%144#G9B$kG9ACY+<WKjF(oM?1+F\r1a"@mG;1Nh.j0$k+=eRY
2(8tA+<YkN4Wnqk.j,rW1b*Q\DCB]b+>"]k.X*]u%144#G9B$kG9AI[+<WKjF(oM?G;C?n+EoOh
%144#G9B$kG9AI[+<WKjF(oM?G;:9m+>PEj0e!P=+<YkN4Wnqk/Kc/Y1b*Q\DCB]`.1HV,+Enqk
+EnqY+<Vd_.W]<A-o*8r1a":kG;CZW$6UI8+?^ik+>"]Y+>YKgBl5=S.O]Kt+=eRY2'=InG;CZs
%144#G9B$kG9AI[+<WHiF(oM?G;C?n+EoO_/Kf6m.1HV,+Enqk+Enq[+<Vd_.W]<A.!IEh.j0$l
.1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;LEm+Eo[l+=eRY1E\7lG;:TV$6UI8+?^ik+>"]Y+>YKg
Bl5=S.O]Kq+=eRY1a":kG;Ufl/Kf6m+>"^[1FWb?+<YkN4Wnqk/Kc/Y1FdH[DC@7i.!IKj.j0$n
.3L,`1FdT).1HV,+Enqk+Enq[+<Vd_.W]<A-o*8#G;13j+EoXb.j0$n.3L2bG;:TV$4R=b+Cn;i
BgcNF+?^ik+>4in2D?g=0JG150F\@3+F\cgDKU&0FD5Z2?YOCbDdmNsEHPu;H!bK%?Y*_`BlJ0.
@p`b8E-"EYB4#Ld1,hsNFCB9*Df-[hDBM_aCh[m3BlnVC:M(_KBOr;T@r,juFD55-/KdVN<?O"V
3%uIRATDKrEt&I>4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]%15RFDf$Uh@<itp@;]soE[PoNG@b6)Blmo/>A/,#E-"&n05b?>E,ol0Ea`g%Bk)3:
@rH3;DKU&0FD5Z2F"^fIBQS?8F#ks-DIma*Ec5T2@;Tjq@rj84Df%.FF`_&6Bl@m10.AL_$4R>A
BOr;uDes6.GA1r-+CT)!DfTQ6BPel%Df'H9FCfM9FD,5.DKU&0FD5Z2+DG^9DdmNsEHPu;Gp%$;
+EV:.+D#&!BlJ0.@k8a:DBKAqA7]CoAS#p6+D,P4+CQC*Bm+'*+A,%$<$5UiB6A'&DKIKR+<X6t
+DGm>@UX=hA0>f.+EV:.+:SZ-0f_3I+A"k!+B3#cDfU+GDe:+eF`_&6Bl@l3@;]Tu;IsB]@ruF'
DD!CJ$4R>ABPDN1G%#30AKY].+EV:.+Cf>1Eb/a&Bl@l3FDi:1E,]W=+EVNEFD,5.9gq?C+Eh10
F_)\6Afu2/AKYo#Ch[m3BlnV0$?U2/DdmfsBl5&8BOr;c;H6..DdmNsEHPu;Gq:(^Bln#2@3BZ*
AT)U#FD55nC`m\;ARfFqBl@l3De:-/YqRda0JO\YEap55ARd>%$4R>.F!,17+Dl%<F<G(3D/aW>
ATAo4Ec5T2@;TjqDJ().@;]_#@:s.m/0K%JAKZ)8BkM@%Df''-EbT#+Ap&!$FD5Z2Et&I)F(oMC
+Cf>2/0K%CDCcoAF<G"./h%oWDBO%7AKYr5AT_O%/Rr^0AKYYtEb-dE@<6L4D.Oi1@:X(\DBNA.
B6A'&DKKq/$?^6&ATMo8DffZ(Ed)5=AKY])A8,O^FCeu8%13OO8T#YmBPDN1@psFi/0K%JAKYT!
DII?(Eb0<7Cige6F!+t2DK]T3FCeu*Bl8$2+Co%rEb/g'+D,P4+Cf>-G%GQ*ASu!h/e&-s$<2%g
AKXcXCh[m3BlnVC4WmI1@;[2`@VfauF_PrC+=eS[Pg6ZG$4R>kIXV_5;IsH$%15CBFE2;;Df'2u
@;I&PChI[,Bln$*F!*%W12^VF7:^+SBl@l3-o!_B3%5:D8nDFK+AHEYF`S!!:j$5"+BN8nCi*Tu
DCn1dChtXF8T&#j%15[*6;AXW/NGXD1H@?F2DHd<%13OO;IsH$%15OKE,8s#@<?F.Gp$%.E,]W)
D.RU,+EVNEFD,5.6$%-gDf0K1Bk(Rf+@0g\@;]L`+=Js)3AN#m$?.^S0d(RV+E0%i1^sd`;aO5%
0J,:@2)d3E/N,R?2[p+CIXV_5%15O?ASl!rFE7lu%14gB+CIf0<)d636$%-gDf0K1Bk(Rf+A,$E
DKTf*ATAo*DfQt5Bm+'*+Cno&AM8.>D.Oh<<)b:U$8O4V?rUM?<,$2\+D,%lFDl1BBl5%cF_kc#
DBNG#DKL#ABk;?:+Cf>1Eb0<2Df0*"DJ()6D]hY?<)bCkEb/`rDf0,s+D,Y4D'2G+0JG150F\@F
/g+OiAS4t\;IO*D#ukSPF!,1<+CQC&Df0`0EcYr5DBNP"@ruX0+E_a:A0>u4+Cf>-G%G]9+Co%r
Eb/g'+DG_8D]iV2F_Q#-Ch7L++:SZ#+<Y]5A8,IiF"SRX=(NLkF_l/6E,9eBA7]CoAS#p*@X0)<
BPDN1Amo1kDfQtBD]it-FCAm$+EV:.+D#P8Bm*p$ASuT4Ea`Km@;^-=%14pE+CKD$#u5Vb@<?4%
DBO"3EbT*++CSbiF_u8;@<?F.+Eh16BjkIeAISu(/g+PG0jk;^ARTI!ASc:&B45mrDf-\9Afu2/
AKYi.Df-\0Ec5e;FD,5.F*2@Q%15!G+CKCK?jTP=@;[3/Derj&+CT/+D..7+/e&.H/g+PG1LLM`
ARTI!CisW(EZee.Df&p!GqKO53%c=]G;N\69Qb5]EZee2B6A'&DKI">AftnuFD5i>A7[A&$99^]
+CKCN?jTMFDJ*[*F_#&+De:,#F(8d!A8,po+Du+.AKYo'+Dc1<@<*K/Eaia)+E)-?FD,5.%144#
+<Y6*Ch[j1Bk&8oF!,=2@<6R3ARloqEc5e;FD,5.D.R-n+D#P8Bl7j6+E(j7A79Rk/e&.B0J4JU
A4:HY6tL"=#u5Vb@<?4%DBNY2+D#&!BlJ0.@ps0rCi=3(BlnK.AKYQ/E,oN2F(Jl)Bl5&(AS6$p
ATKI5$4R=O$;beTF_#E#De*E%6#:1PEbTW/D'2er+@C'aE-686+B3#c+AR'$@<?4%DBMMg+AZH_
BlS90FEo!IAfu2/AKXEOCh[j1Bk%SZAoD]4@;^?5B5)O#DBMP><)au+EbBN3ASuTB%13OOIXZ_T
$6W:j+?^hq8jlWX+>"]k1c7!F1c6^)0-E&/2)7#u$6W;'+?^iH+=\L5%144W1E\h'<$3Y5<&+mi
%144GAS4t\;IO)Y4WlO50f1UB3ANKM1Gq-P2`WZL+>4il3%tdK%145%0d&V%6tL"1Dc1"S.O[&4
2_I'I0JbU0.j-Z*2)7'K/ho(81cQsa+<W6Y0J5%50f^sF1+H6Y+=eR61G:IB3A`ZO.1HV,G;::(
+@KdR<,YZCA1Au`2)d-F1,h-I+=eQj2*!ZW/hf.:1GgR\+<VdY+>>E%0JG4>0Jb1X1*A.k<&60`
0JG170I[G<+EoUa4Wm.(B2ieI@:Ui90f(X=3ArWQ3$9^o1cI?J3B/WN2E*EP3%@lM.j-Mu0JGIE
3B&]C<&,RH+B1-M2)[3I0I[G<+EoXb4Wm.(B2ieI@:Ui93AW9C2_d<I+<W0W1cR9H0JY770fLsG
3%@lM/Kc`"0JG:@3&3?@<&,RH+B1-M1GUmE2_ZZi$6XOM+?^i8AS4t\;IO)c-o!J7/hf+=2)6:+
+>Gl41bLL=2DR0F.T@N5+=eQg/het70K1[F.TA/G.j.eI0/PO?0JG10%13OO+Enqk+Cf>2.!INt
.O[;40JYL..j-f(3@[uW%145%+?^ik+=eREDf[<^.O]Kt+>"^[0d%thG;Ufu.O[/51H$@-+>YW)
.T@i+$6XO84Wnqk.j/>?F!rdn.!IKj.j0$n.4H_p3B&l>/Kc`"2(DQS%145%+?^ik+=eREDf[<^
.X*a!.OZu'2(DQJ/Kd#52(8tA+Enqk+EnqY+Cf>2.!IEq.O[/2+>"]i/hnhT.1HV,G9B$kG9ACY
@rHE:G;:9k+>PDpG;LEo+EoO_.j0$n.4H_p1,:[//Kc`"2C_ZT%145%+?^ik+=eREDf[=N1E\1j
1+F\r1a":kG;Ufu.O[#,3?Tmr0J5(0<%/7`+Enqk+EnqY+Cf>2-o*8#G;LEo+EoO_.j0$n.3L2b
G;:Ts-nm80.T@NB+?;;.%145%+?^ik+=eQi0JFtdDf[<^.X*]l.j0$n.1HV,G9B$kG9AI[2_Z^k
Df[<^.O]Kt+>"^[0e"4q+Eo[l%145%+?^ik+>"]n1FcmQF!rdn.!IKj.j0$n.3L2bG;CZW$6XO8
4Wnqk/Kci*.V!C<.!IHi.j0$n.1HV,G9B$kG9ACY1,^UlDf[<^.O]Kq+=eRY1a":kG;Ufl/Kf6n
.1HV,G9B$kG9ACY1GUFiDf[=N2'=InG;CZW$6XO84Wnqk.j-T+.V!C<.!IHi.j-SsG;LEm+Eo[l
%145%+?^ik+>"]k1b*!RF!rdn.!IKj/Kf6n.3L,`G;UfY$6XO84Wnqk.j-Q).V!C<-o*8#G;13j
+EoXb.j0$n.4G]5+Enqk+EnqY+>GZ%@rHE:1+F\r1E\1jG;LEm+Eo[l.1HV,G9B$kG9AI[0et4g
Df[=N1E\1j1+F\r1a"@mG;13j+Eo[l.1HV,G9B$kG9AI[0eb(eDf[<^.X*]l.j0$n+>"^[1FWb?
+Enqk+Enq[+?1i\Df[<^.X*Ti/Kf6n+=eRY2(8tA+Enqk+EnqY+?(c[Df[<^.O]Kr+>"^[0d%th
G;LEm+Eo[l.1HV,G9B$kG9AI[2_&<UF!u5g.1HV,G9B$kG9ACY3@\NWF!u5f+=eRY2(8tA+Enqk
+EnqY+?(c[Df[=N1E\1jG;UKp+>PEj0e!P=+Enqk+EnqY+>t]ZDf[=N2'=InG;:TV$6XO84Wnqk
.j-]!@rHE:1+F\r0d%thG;L`k/Kf6n+=eRY2(8tA+Enqk+EnqY+>YKWDf[=N1E\1j1+F\r1a":k
G;13j+Eo[l.1HV,G9B$kG9AI[1FcmQF!u5f+=eQi.O]Kt+=eRY2(9s`$6XO84Wnqk.j-Vt@rHE:
1+F\r1a":kG;Ufl/Kf6m.1HV,G9B$kG9ACY1FcmQF!rdn.!IBg.j0$m.3L,`G;UfY$6XO84Wnqk
/Kci!@rHE:1+F\r1E\1jG;LEm+Eo[c/Kf6l.4G]5+Enqk+Enq[+>YKWDf[=N1E\1j1+F\r1a"@m
G;1Nh.j0$n.1HV,G9B$kG9ACY1FcmQF!rdn.!IBg/Kf6n.3L,`G;UfY$6XO84Wnqk.j-Vt@rHE:
1+IK&+=eRY2(8tA+Enqk+EnqY+>YKWDf[<^.O]Kt+>"^[0e"4q+Eo[c/Kf6m.1HV,G9B$kG9ACY
1FcmQF!u5i+>"]k.X*Tr%145%+?^ik+=eQj.V!C<-o*8#G;C?l+EoXk+=eRY2(8tA%144g7<!<9
AS3,K+Enq]+>Yo00JG170F\@3IXZ`bEb]W/F(KE(F>>RG67sa,Eb]W/F(KE(F<GWV/Kf+GFEMOF
EbTT+F(KG9E,ol3ARfg7%13OO@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUCi<`m+=C].FC?hDEGT?2
AL@oo%16QTBk)3kBkhQs?TgFm4$"c<-Y[F/GUG((4u%CpBk/>?.3g3SD.Rr7-RgSoAp&3:+E_d?
Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%16igA92*lC2[Wi4ZX^#De*KfBkhQs?TgFm
-ZWpBATMF)-OgCl$<'5k77g3B=C5cWDe*2t4ZX]I3[\N^FE8f=$4R=iBkhQs-Qm&5FE2UK4$"a2
F!,(-EZf(.@j#;kF*)FM+:SYe$;No?+EM+9+EMCBE-ZP:EZfLGATAo/AU/>>/Kf(FF*(i2F<F0u
FDi:D@;BEsAS,Oc@rr.eF)>i<FDuAE+=D;QATCFTH#k*KATMF)-OgD2FDj]G;cFl$+F?-l/0HYi
E+rft+>b3RATT%BEbTT+F(KGnF(KAbAU/>E.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L
@qK@$+:S[!D/XQ=E-67FC2[Wq?YO7nA7$l8+E2@>C1Ums+EM+9F`8];$4R>YDdd0!C2[Wq?YO7n
A7'@kF(KE(FB*BnE_BthF##UJ67sC'F(KB-AU/>L@qK?_$;No?%15is/g+)(AKZ22CM=o1@:s-o
GB\6`C3+<*FE_/6AM.J2D(fXJBkqE97s/NVATKLlDf00$B.lkSF>$X8ATCFTH#jE%:-pQU@;L"'
3Zr*XFDs8o05>QHAor6*Eb-k5Df%.?Bln0*F*''TFD58s/n\m?04Ja9@P;S,F*(u605P?304J@2
AM81IATDQtH#kTJE,Z6n:-pQB$;No?+@UN`D/a<&F#ja;:-pQU+@\.K0fr*DDImm5AS#glE]\)U
@:UK.IUQbtDf0VLB45XgF"_BEDImm5AS#glE\DQLG@W=?C3(a3$;No?+<X$nEbm6s4"r`dCi=B9
@<-WT@WHC2F(J]n?RKN/FDs8o06_Va/o#HGAor6*Eb-k5Df%.BGA1i,033"$@:F@q@<-WH7r3*b
F('*7-OgDX67r]S:-pQU,"$HmCb%t5+q4lS67sB)6Zd?b.oU+qAooOm2BiS;:-pQU,#`/hAooOm
2BiS;:-pQU,"=L8%15is/g)?*FE21J7Q2M#$;No?+<j0pEbm7)BPD(#.n2HA%15is/g)?:BPD(#
.n2HA%13OO7P[%[4&TX,@;BEs6ZmEiASuTOCi<`m+DPh*B4#@fDe*2t>9GXCEccCG-Xq44Ch-m#
/8B*6B4#@fDe*2t>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=Ma+=D,KC3"$0ATMF)
-QlV9De't<Ap&3:-QlV91E^UH+=ANZ>9IrtEHPu9AKW@5ASu("@;IT3De(4)$:AoUCb&FtBkDH;
7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:F=.M)7Pd+\4&TX0F_Pl-+A,Et4*"nPF_Pl-+=Cf5DImis
CbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#AKXT@6ouf3De*d(+=nXMDe*cuAgniW%16$IBkDH;7Pd+\
4%`::+@p'[E'%fQA8#OjE$-hD$:Zj60KV[6@Wc<+;KZk=A7BS%DBL;S%15Q_4#&frATMr9;f-Gg
ANM^kEccCGC2[Wq?YO7nA7#cQ;eTlWF=Tg=4#&frATMr9<GlMm4#%juFEAX?De*KfBkhQs?S!R3
ATMg%DII<fF)>i2AL@oo7Q3C`4%+!sF_t]-F<EqnEcP`/F?;3"EccCG-Xq44Ch-m#/8B*6B4#@f
De*3+-XUD&@jc;2F(KE(FC/p(FCep"Dei]oE-Z>11GX:a+<k<,Ci"/:3ZqW6+<Z"<+<VdN@qBIm
?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<i[T1,*5t@Pf8[$6UH6,&Ln5@:Weg@3R`TH[RFP
+<VdNF)Q2A@q?iF+Bo0q+<VdN,9UB7Bldj,ATV<&7<i6XE,9*,>](`:$6UH6+<k'.+tO'D+<VdN
<+oue+Du+>AR]RrCER/!D/X<5FE1f3ATJu9BOr;j8g&.gF(KE(F<GX7EbTK7>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(oBOPCdF"_!=DdkA:@;0U4EbTT+F(KGGBkh]</g)9EEbTT+
F(KH$+Cf>,E-686F!,R<AKZ#-F(HmFFE1f-F(o_I+CT.u+EM+9+EV=7ATJu4Aftu"D.R6#>=h+\
+B*AjEcYM7BQS?8F#ks-GB\6`Bjl-:DfTJD.5"kC+tO'D+<VdN>](`:$6UH6+<jd'+EDUB+EV:2
F!,@=FCep"DegJ@Dfm1>F`VXIBl8!6@;Ka&@3A/bC3=K@FCfJ8CLqO(AS`tA;e9M_9jr'aBl5%l
@<HU%E[PoN>=WCL89JAaEb03.F(o`7Ed:q=BQS?8F#ks-B5)I$F^ct5Df%.E@<-I(DCop<F`M&6
05>96Ec,H).3N5@EZf(6F*)GF@ruF'DK@ES$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj
@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>GDS+<VdNBk/DK+<iXS3&NEG0KC=.$6UH6,&Ln5
@:Weg@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6
+<VkHF`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,$]"0/.*LB+<VdL
,&0+j1bLO:C,RnWG'GbqGA1r*Dg-7U@rH4$ATD9p@;IT@GBYZSF)PZ4G@>N'/n8g:0/>4:1G(:;
/MSqY0JPUC3BB#R04Sg,DJ(OU2(^L62_S*'77B[/0jJT?/.*LB+<VdL+u1i-1E\Ls1,C%-1a"Y6
+>Z#12DI!mDB^V=+<VdL+<Vk5DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu',!$iN$6UH6
+<jQI/g*b/G%G]8Bl@l3@;]TuA79Rk>](`:$6UH6+<klDDfp/@F`\`d+Z_>7+=AOADB^V=+<VdL
,'.U>F`_SFF<EIb3\V[(-X:O5/.*LB+<Vk5DB^V=+<VdL,#1HW+EM+9+E27>FCAWpAKYH#GT^O;
@<ZF'B-:\t@<,ddFCfK6>](`:$6UH6+<kcCEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LOdI
?Q`Pq?!M7k/.*LB+<VkIDfTr0BOPq&+>=uH+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`
@<--oDg-(C/.*LB+<kN1,!$hj1G`Js1H8r(+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu'
,!$iN$6UH6+<i$T+A$HlFCB!%@<?4%DBN2%+tO'D+<VdN>](`:$6UH6+<k36Bldj,ATV<&BlbD-
BleB:Bju4,ARlolF!+m68g%PQA8c?<+A$YtBlbD2DKBo.Ci!Zn+DG^9FD,5.8g%Mj@:WneDK@IG
@:O(o?m''"Ch.*t/g*`-+Ceht+C\n)Bl8!6@;KakA0>K)Df$V$7qm'9F^eW)BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05=p*CNF/t@r$-7+EqOABK@=E+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#
H#R==3ZoVVDe*E'/.*LB+<kBAARfk)Bl@lr@rHL-F<Wag1+WbT+<VkBA0O&W+u*X`0fLpL@j3H2
+<VdND.RftA79Rg,!$inI4P^J+<VkHF`_SFFE8We+Br,&$6UH6,'.[FEarZ)3ZqW6+<VdL,&D1+
A0<7=@:O._DC8\,+tO'D+<VdN:-pQUF)>i<FDuAE+DG_7FCB!%+=Cf9FD,f+3auN5ATDNr3B8a-
@:O(oBOPCdF!i)*67sC'DI[U%D.RU,+EVNEBl8!6@;Ka&+<Vj8+<Ve4$6UI>/.*LBHO:l<+<k<,
Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj@PqRO3AWWS+tO'D+<VkFATV?k@<>p%3Zrct
/.*LB+<klFF`Lu',!$iN$6UH6+<jcuAKYAq@:O(o?m$ji/SJR&CNCpI@:WneDK?q/Eb-A7ASbs$
@rH7,@;0UjA0<"!8l%htB4YslEaa'$A6gTsFEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].
CbBXHB.n@?AM%Y8A1_b/B4W_F+A*bt@rc:&FE9&W7:B\>+CJnuF'p,3@rc:&F<G:=+CSbiDf'H%
DJ<Zm+EqOABHU]%A7f3lA8bt#D.RU,+EV:*F<G+*F(96)@V'U'BQ&);FDi:EF(HJ.F=n\7Df'&.
F(96)E--.P+Dbb-AKYB$Bldj,ATV<&@<,p%@;L"'+E1b!CLLjeA0?)1FD)e*+A-cqH$!V<+Du+>
AR]RrCEP$IBPDN1Anc'm.3N&:A0>;'?uTXg?m'W(EcYr5DBNk0+EV:.+Du+>AR]RrCG$`!DfQt3
G[YH.Ch5.?FD,5.?uft&ATMF)?m'&qCh7Z1@<,p?>](`:$6UH6+<k'.+tO'D+<VdN+<VdL+ED1;
ATMF)/no'A>](`:$6UH6+<hpN+<VeIBldj,ATTPDA7f(a+tO'D+<VdN+<VdL+ED1;ATMF)?Z'e(
AR]RrCG'=?H#@(rDB^V=+<VdL+s8!N+<Y]=F(KE(FC/p(FCep"DegtEA7f(a+tO'D+<VdN>](`:
$6UH6+<jcuATD?)@<,p%DffZ(EZfF5EbTK7F!,17+CKY,A7TUrF"_9:@r$-n+CT.u+Dl%;AKZ22
Cht5'AKYDlA7]9oAo_g,+EV=7AKZ)5+EV=7AM,*)D]j(3Ao_I(BHVD1AKYT'Ch.*t/0JtEBle?<
AKZ).AKY])F*(i,C`m5+D/E^!A1h,)+tO'D+<VdN>](`:$6UH6+<jBp+CSekBln'-DBO%>+EV:.
F(HJ+Bl%@%+EV:.+EM[7AoDKrATAo$IUQbtDf0VLC11UfF"_WHF*(r$FCAQ"@rH7,@;0V#+Cno&
@3B/rCh7Z?+CK5(F(KE(FC65'Bl%@%+DG^9@!#t$FC\g%@:13dEb.::DB^V=+<VdL,$]"0/.*LB
+<VjN+<VdL6?6dQBQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2_JrX>](`:$6UH6+<hpN
+<Ve@@<Gpp@;TRd?ZU<tEcYSC0JYC9FEhn4DB^V=+<VdL+s8!N+<XEfG%kStFD5Z2?W2&TEcWjT
G][2.+tO'D+<VdN+<VdL+<h.8+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6
,%Z"1@s)m-Df/olDfor>,!$i&/.*LB+<kN1,!$hj3Ar]S2)dC'+tO'D+<VkFATV?k@<>p%3Zrct
/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4+tO'D+<VdL,&_UGE-680
FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<VkMATMs(@<>p#+<VdL+<VdL+<VdL
+<VdL4Ci/H4s1sj+<W?t/O=>r/M]+)0f(jE1HIBL>](`:$6UH6+<VdN@WGmpA9_s1/no'A+<VdL
+<VdL+<VdL+<VdL+>GZ-3Ahp73%[j5E\0%&+>P]51c7<L0jJT?/.*LB+<VdL,%>S$DIe!/E%Z*?
Afr3=+<VdL+<VdL+<VdL+>GW/1,Ug01,pj[@<*qT1E\G.3]&]T1,3$O+tO'D+<VdL+<kH;G]e+B
Ci_4CC3(L?+<VdL+<VdL+<VdL+<Vd]2_[0N+>GZ(6#^ir1,C%-0KLmH3\rd$DB^V=+<VdL+<Vk@
E-QMIBl%iCE+EQ'+<VdL+<VdL+<VdL+<Vd]1GgmB3$9q3/O=>r/M]+)0ebXB2```T>](`:$6UH6
+<VdNBlJ?8@P2A0F!)SJ+<VdL+<VdL+<VdL+<VdL+<WL!3B83;3%[j5E\0%&+>P]51c7<L0jJT?
/.*LB+<VdL,&)"ADIP5;A7cr,+<VdL+<VdL+<VdL+<VdL+<WX%3Arc<1,pj[@<*qT1E\G.3]&]T
1,3$O+tO'D+<VdL+<kZ2DJ<]oF*'$KC3(L?+<VdL+<VdL+<VdL+<VdL0f(RF+>>c,6#^ir1,C%-
1HI3D3\W9nDB^V=+<VdL+<VkKBldj,ATTP=C3(L?+<VdL+<VdL+<VdL+<VdL1H@ES1*A;-/O=>r
/M]+)0ebXB2```T>](`:$6UH6+<VdNEbTT+F(KGGE+EQ'+<VdL+<VdL+<VdL+<VdL1,(C>1,9t,
1G(n3E\0%&+>GQ20K2$K3F$GG/.*LB+<VdL,'%C=ATMF)?Z'e(AR]RrCG'=?H#@(6+<VdL+<WHo
2`!E90f(CIE,mNc1E\D+3\WKR1HA]X+tO'D+<VdL+<ki?F(KE(FC/p(FCep"DegtEA7cr,+<VdL
+<Vdc0JkXG+>GZ(6#^ir1,C%-0KLmH3\rd$DB]E1+<VdL>m_\s+<Z(>+<Ve4/.*LB+<klFF`Lu'
,!$iN$6UH6+<jQI/g+S5A8c?.Anc'mF'NT,/.*LB+<Vk=BlY=DIUQbtDf0VLC11UfF!i.=+<Ve4
$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj2dp/T0ekUE+tO'D
+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<i$T+B<JsDJ()"EbTT+F(KH$+poG8
+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3Zp71
$6UH6,&(R33ZoVYA7RJN2DA_e/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6
+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL
+<ko=G]Y,j+Bo0q+<VdL+<jQI/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28Eb$S>.68S,0JYF<1bpk%
0f1XD1HA]X+tO'D+<VdL+<jQI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M14F+tO'D+<VdL
+<jQI/g+V3@X2=&De*:%+<XEG/g,%?D.R6#6=F>KCi=3*@;[3/FCB32+ED1;Bl7Q:F(KH8Bl7Q+
FDk\uH!G52/.*LB+<VdL,#1HW+D,J4?Z^3s@<it<+AP6U+D,P4D..N/FDk\uGp%9AEaj)4Eb0<7
Ciip"+tO'D+<VdL+<jQI/g+k:F^K6/A79a++<XEG/g,%?D.R6#8O6?!F*(i2F!,L;F(oN)06:]H
FD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+tK@:XG$@<-E3+<XEG/g+tK@:XF%EbTT+F(KG9F*(i2
+Cno&@9d[o/.*LB+<VdL,#1HW+DtV2?Z^3s@<it<+AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B@<-E3
EbTT/DJ(VDATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUDII^!@<l['F*&NI:-pQUF)-%DF(&Zh
EbQXS?SEU@@WQ+$G%ki,+Dbb5F<GL6+EVO4@<j5A+DtV2BkLjrBl@l3F*(i2F'NT,/.*LB+<VdL
,#1HW+ED1;ATMF)+<VdL+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcYK'+tO'D
+<VdL+<k'.+tO'D+<VdL+<hpN+<Y95FC0-.A79a+DII]qFDk\uGp$pA@psInDf/oqDf'&.0O/K>
/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+EhU43Zp+/3A*9Q+>Q#$1,C%=E,m'V0JYF,0f1pH2EEWS
>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sBsDdd0!-[oK7A8c@,
05=p*CND.LBldj,ATTP=C3(aF+AP6U+CSekDf-\@ATDj+Df/ft+tO'D+<VdNCi<`m+=D2DF(KE(
F=/2+67sBkATf2>ATDj+Df/ft+tO'D+<VdN>](`:$6UH6+<klDDfp/@F`\`R:-pQUG&:bN+=A9_
+=nlo/9!^5+?jd-4!6^@/2/Fo-o`A21+=>H9gj#9F(KE(F<V&7+<Xqs+<Z(`$6UI<$6UH6,%G2#
CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i(/.*LB+<kN1,!$hjAhmq/0K(gJ
+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klK
A8cU4+tO'D+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<Vja
+?CW!>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQ_Ci<flFD5Z2?[64!Ci=N=FDl&.+Ef=g+EM+9
+E1b0@;TRtATDi7AoD]4:MaPa7U^"QBP)C'+Dbt+@<?4%DD#13+tO'D+<VdL+<jQI/mN9</.*LB
+<VdL,#1HW+Dl%7@:VDA+Dbt+@<?4%DI7[#Ci"$6F*)><AKZ,<8S;pZEb/Kn+tO'D+<VdL+<jQI
/mN9</.*LB+<VdL,#1HW+<VeCDe!3tBl@lrH"Cf.Dg-8EDf0,/0H_KCDB^V=+<VdL+<Vk'67sB'
+AP6U+E_a:F!,:;@psInDf-\ABln#2@s)g4ASuT4A79Rk>](`:$6UH6+<VdN:-pQU+<YB,F^K6/
A79a+0H_J\+<VdL+<VdL+<Xp,+tO'D+<VdL+<jQI/mN9</.*LB+<VdL,#1HW+Cob+A3(hU@Vd/M
/g+bB=`%b]+Dbt+@<?4%DI7[#Ci"$6F*)><AKZ,<8S;pZEb/Kn+tO'D+<VdL+<jQI/mN9</.*LB
+<VdL,#1HW+<Ve%67sC'F(KD8Ci<flFD5Z2+EqOABHVS3Ci"$6F*)><AKYMlFCe]p+tO'D+<VdL
+<jQI/g)8Z-u<g3@<?4%DI7[#Ci"$6F*)><AKWZU+DG8,?Z^3s@<itL>](`:$6UH6+<VdN:-pR<
DB^V=+<VdL+<Vk'67sB'+AP6U+CT;"BlnB(Ed8d<@<?(%+D,P4+Dbt+@<?4%DHq''/.*LB+<VdL
,#1HW+<Ve=D00-,De*:%+=Js'0esk-+>G`+1Gg4jDe!3tBl@lrH"Cf.Dg-8EDf0,/0I\,^@<Q""
De*:%+>=pCDB^V=+<VdL+<Vk'67sB'+D,J4?Z^3s@<itDCi<flFD5Z2?[64!Ci=N=FDl&.INU@*
1G^.6+>Pf,2`3$,Bjl-kFDk\uGp"eGDB^V=+<VdL+<Vk5DB^V=+<VdL+<Vj`0JP@+2'=h#Ci<fl
FD5Z2?[64!Ci=N=FDl&.+F.40+tO'D+<VdL+<ijODB^V=+<VdL+<Vk#<D5tM:1&$UF(KE(FC.0l
+DQ%8Ao_BiC`n"?A3DOfG[,,1/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+Dbt6B5)I1A7[;7CghF"
FEM,*+EqOABHVA<@;]UaEb$;6BkM=)+C&e./.*LB+<VdL,#:O(9M\#A<(Tk\?ZKk%ATMF)?TgFm
?SO8h/iYUF3AM^61bLUC0JtdoDB^V=+<VdL+<Vk%:I@EI8P`)V5tsdTEbTT+F(KH#4ZX]5=_2Dc
Dg-8EDf0,//Kdi*A0=?MBln$#F_iF1DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk.<'sGN7T2`T?ZKk%
ATMF)?TgFm2D-[++<XEG/g*ke<$69sD.Oi9Df0,kDB^V=+<VdL+<Vk%8PMcU9gM9VEbTT+F(KH#
4ZX].2D-[++<XEG/g,4WASc0kEZf4-B5VF*F_#&gDB^V=+<VdL+<Vk%8PMcU85E,e?ZKk%ATMF)
?TgFm0ea^m+<XEG/g+\9B6%QpF!+n#Dg#\7BQ%p*H>d\+DB^V=+<VdL+<Vjr5uL?T;H$qCBldj,
ATV9B3Zp+!+<VdL+<XEG/g,"FDKU&4F!+q'AoD^$+CT.u+CSl(ATAo7F`)83F<Dtc4_\PHDfTD3
F*2@L>](`:$6UH6+<VdN>](`:$6UH6+<VdNH#7(R8l\PV5u'L;6;pQR6U=[C:JNuO<'sGN7T2`T
4%r4?8Q8DM7lsC99hA;T:Jt@X9M\#A<(Tk\:-hTC4%)A492nef>](`:$6UH6+<VdN.9pa7$6UH6
+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQUF(KG9@3BB)@psInDf-[L+CSek
+F.mJEZf:EDBND6+Cf5+DJ=!$+CT.u+Dl%-BkDX)DJ().De!3tBl@l3G%G]'F'NT,/.*LB+<VkE
De!3tBl@lrH"Cf.Dg-8EDf0,1$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D
+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>tbX+<VdNBk/DK+<iLO0fV0RA76Z5$6UH6,&Ln5@:Weg@3R`T
H[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SF
FC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL+u1u2>](`:$6UH6+<VdN.kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU=_2DcDg-8EDf0,/
/Kdi*A0=?MBln$#F_lF`+>GPm0H`,-2D?gB2_I$H+?))/1c7-N0fV!I1GLXB0Jst[0ek@73&3EQ
1*AD1/i5I?2)cX50JYF,1a"P0/i#:,2LJbI+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL+tG5s/M/P+/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+
.pQs9/.*LB+<VdL,(*4*EcPl2@3?[8+<Z&&;BReU1,XG91a!og0H`+nHsCP5/.*LB+<VdL+tG5s
/M/P+/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9/.*LB+<VdL,(*'m+B*E%ATD6g+<Z&&;BReU
1cB_@3?TGl0H`4qHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9
/.*LB+<VdL,()arEZd_XEc5c.+<Z&&;BReV0f=><1G1P40H`).HsCP5/.*LB+<VdL+tG5s/M/P+
/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9/.*LB+<VdL,(*+!DImWmF`q19+<Z&&;BReV0edu3
3?TGl0H`).HsCP5/.*LB+<VdL+tG5s/M/P+/M/P+/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9/.*LB
+<VdL,(*F*DId<qBjl+(Bm>"r;BReV1GX>82D-k70H`,+HsCP5/.*LB+<VdL+tG5s/M/P+/M/P+
/M/J)/M/P+/M/J)/M/P)/M/P+.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q
+<VdNCi<flFD5Z2?[64!Ci=N=FDl&.+>@&<+tO'D+<VdN-V6U(+Dbt+DIIBn+Ce5VEc#kF4ZX^"
@<Gq!De*:%+>@&<+tO'D+<VdN>](`:$6UH6+<jQI/g,%SD.7's+E(j7EbTT/DJ(VDATW$.DJ((`
5uf%KFCB32>](`:$6UH6+<klDDfp/@F`\`N8O6?]DB^V=+<VdL,#1HW+Dbb/BlkJ7@:sIlFEM,*
/0JA1Dg#\7BQ%p*H>d[P+DQ%8Bjkm%A79Rk/0N6&<$5mm+EM+(Df0*,/0JbIDJ*[*F_#&7+DbJ.
BlnK.ALnsLARTU1+Dl%7FD)e-@<jJ9A6a!r/.*LB+<VkLD/XQ=E-67FCi<g$@;TR;@o-TSD0&s"
+tO'D+<VdN:-pQUF*(i2+DtV)ALns7ATMQuDIIX$Df.*KFE1f-F(o_=@;L%"FEM,*+Co%rEb/g'
/0K%T@;^.#F<G[>D.OhF1a$IMF`MOGD/!m1FCfMuDB^V=+<VdL,'.U>F`_SFF<EF`HS-F45uf*9
+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj1h0s(3&tM0
+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<j3bFCAm"ARlp(Bldi.@;]Tu
F(KG9Bl7O$Ec#6,Bl@l3BlbD9Ec6,8A7]9o@X0)(EbTT+F(KH$/g:WF+<Xqs+<Z(`$6UI<$6UH6
,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i*/.*LB+<kN1,!$hj1h(#U
@5'Aj+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`HFDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP
+<klKA8cU4+tO'D+<VdL,&_UGE-680FEqh:,!$hjF*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL
+<Vj`1c@$A1GCF?2'=h6/i57@1bgdD2`NNI1c[H:?SO8n/i,FD3Ai];1c$aB1c@9O2'=Y.1,C%/
+>Pl.1,U14>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)
>](`:$6UH6+<VdNHpMR]DeseTHlt*q2'="q/i#FA0Jb[H1c@'F1c[BN2BX,#+>l0,>](`:$6UH6
+<VdNHlsOS+<Z%SHoO&;2'="q/iG^D3&<BK1-%-N0fLjF2]sh5+>Ym&>](`:$6UH6+<VdNHlsOS
+<Z%SHlt*q2'=S*0KCpF2_[-D0fLgI1c7-F2BX+t+>G^#>](`:$6UH6+<VdN.kN>)/M/J).kN>)
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHr=ZkASc`JHlsOd+<Vd\/i>LA
2`WQL1c@*L1cR3L2'=V0+>Gd%>](`:$6UH6+<VdNHlsOS+<Z%SHlt4)+<Vd\/iP^K0K1^A1c[NN
2E!BJ2]sh7+>bd">](`:$6UH6+<VdNHlsOS+<Z%SHn[01+>>E%0K(UE3&EQP2`3BM1bpjD2]s4s
+<W[l>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:
$6UH6+<VdNHrFuu@psa=HlsOd+<W?j3A<0C2_[-I3&3<E2DmEM+>PYo1H6M)>](`:$6UH6+<VdN
HlsOS+<Z%SHlt4&+C?fT3&`iR0f1^I1G^pF2)[6I+<WE^2)HG'>](`:$6UH6+<VdNHlsOS+<Z%S
Hn[01+<W?j1G^sG2)mHO1c@<Q1bga?+<WWd+>t?i>](`:$6UH6+<VdN.kN>)/M/J).kN>)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X
>7)Jq+<Vk%69R@P+C?iX2D-dE2*!NP+>bl,2Dd<N2`2^#+AP6U+AHEfBk1pdDBN2%+tO'D+<VdN
=\V:I3Zp131,C%/+>Pl\DB^V=+<VdL,#qE%3ZoP'+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sBT
;cFl><'qdHAnH*qFBi]-/.*LB+<Vk5DB^V=+<VdL,#1HW+EMX5EZf7.D.P7@-nmf)Bldj,06:]H
F"&X_@;L%"FEM,*F"AGUBl.F&+D,Y&@ruF'DII?(A79a7+EV=7ATJu-Dfp)A/0JeDDKU&4F'NT,
/.*LB+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?B4Ym,4"!sG
Bk(R!>](`:$6UH6+<klDDfp/@F`\a9:gnB]F'NT,/.*LB+<VkLD/XQ=E-67F;KF#h+<Ve4$6UI>
/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1,!$hj1LW!s1bpgp+tO'D+<VkF
ATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<k3*D00-,De*:%?m''"Ec#6,F!,R<AKZ#)
F*2;@F!,C5+Eh16BlA-8+CJPuDe*:%?m'W(Eaj)B+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4
AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9DI6mlF`):F3ZpC5$6UH6,&(R33ZoVWA7IW/0f`\e/.*LB
+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G
/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<i<f/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHlsP&Df'&./Kdc!EbT&u@;[2]De!3t
Bl@l3+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL+<Vd_+AH9W/PKkq+<VeS>](`:$6UH6+<VdN
HlsOS+<VdL+<VdL+<VdL1,'h:@W-F$/P'f#H@/t8+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL+<WQr
+@L?nCFr7pDBL'L>](`:$6UH6+<VdNHlsOS+<VdL1,LmC0JbC82`2^MF_kc#DBL&E+FIF3+tO'D
+<VdL+<l1l1G1L<2`*6F2)dKL1,M!L+O63N+<VdL+<VdLHsCP5/.*LB+<VdL,((LU+<VdL?SO8n
/i,FD3Ai];9Q+f]BlnK.AKZA*DB^V=+<VdL+<VkU+<VdL+<VdL1c$aB1c@9O2'>S$FD5i>A7Zl+
HsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<Vd^0JYF,=_2#^+<VdL+<Z&:DB^V=+<VdL+<VkU+<VdL
+<VdL+<VdL+<VdL1E]D1DKKP7+<VdLHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<WEu/i#:,6t(?n
A7Qf*+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL+<VdL+<VdL2BZ"!6[Bjt+<VdLHsCP5/.*LB+<VdL
+tG5s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VjY/M/P+/M/P+/M/P+/M/J)
/M/P+/M/P+/M/J)/M/P+/M/P+/LrD)/M/P+/M/P+/Lt(D+tO'D+<VdL+<l2.@;TQu+<VdL+<VdL
+FHRgF(o9)@<?4%DL>E(/O=2p/OX/_HrP,<1,LRRE_U7cHsCP5/.*LB+<VdL+tG5s/M/P+/M/P+
/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHs1H0D.+P0
+<VdL+<VeS85^Qe1Gq*6+<VeS+>u/20H_J\+<Z%S+>=op1E[e_+<Z&:DB^V=+<VdL+<VkU6tL7I
@W-'k+<VdL+<Z&&;BReR1Gg3s+<Z%S2DHg<+<VdL+FG:S0d&21+<VdL+FIF3+tO'D+<VdL+<l2'
Bk;0jBHSE?+<VdL+FH^X+>bu71*@\^+FG:e3%d'2+<VdLHlsOd+>bqu+<VdLHsCP5/.*LB+<VdL
,()[mB5_g!@NZd9+<VdLHq7-X1cI9N+<VdLHlt1)/i=ao+<VeS+<WB]2)ud%+<VeS>](`:$6UH6
+<VdNHqSKgH6==Q+<VdL+<VeS85^Qe2`N]<+<VeS+>P`*0H_J\+<Z%S+>P&^1E[e_+<Z&:DB^V=
+<VdL+<VkU:iCApBl.9$+<VdL+<Z&&;BReU1,U0s+<Z%S1c6m>+<VdL+FG:S1*A;*+<VdL+FIF3
+tO'D+<VdL+<l2#DfQsf@<-:&BcnN@+FH^X+>c)52'="a+FG:k1bLX.+<VdLHlsOe+>Pes+<VdL
HsCP5/.*LB+<VdL,(*F*DId<qBjl+(Bm:aCHq7-X1c[?I+<VdLHlt:*/heCj+<VeS+<WE^1GL!p
+<VeS>](`:$6UH6+<VdNHrFuu@ppK&+<VdL+<VeS85^Qf0Jta2+<VeS+>Yl-0H_J\+<Z%S+>P&s
1a!n`+<Z&:DB^V=+<VdL+<VkU9m(DgEbT&,+<VdL+<Z&&;BRhP1Gp9t+<Z%S2Dd$D+<VdL+FG:S
1E\G/+<VdL+FIF3+tO'D+<VdL+<l2!Eas36EclFG+<VdL+FH^X+>kr30H_J\+FG:i2(ga/+<VdL
HlsOf+>bnt+<VdLHsCP5/.*LB+<VdL,()t.@<*J5+<VdL+<VdLHq7-X2)R'G+<VdLHlt@(/i=ao
+<VeS+<WK`0f'pp+<VeS>](`:$6UH6+<VdNHs1Z%ASu'qB4Yt'@VHs485^Qf2)?s0+<VeS+>Y](
0H_J\+<Z%S+>b2q3?TFe+<Z&:DB^V=+<VdL+<VkU>'4:cDImm!BOPadCh\8f;BRhT3&Mg$+<Z%S
1H-p?+<VdL+FG:S1a"V4+<VdL+FIF3+tO'D+<VdL+<l2!CiF'!@q/pi+<VdL+FH^X+>l)<1E[e_
+FG:j1G1@(+<VdLHlsOh+<WH_+<VdLHsCP5/.*LB+<VdL,(*C.F_bE%BOPTt+<VdLHq7-X2)mHM
+<VdLHlt:%/i=ao+<VeS+<WNa0esjo+<VeS>](`:$6UH6+<VdNHpi$cBQ[cn@3?[8+<VeS85^Qf
3AiT8+<VeS+>P`*2'="a+<Z%S+>k8s3?TFe+<Z&:DB^V=+<VdL+<VkU6"=qD@NZd9+<VdL+<Z&&
;BRhW3&Da#+<Z%S1,^aB+<VdL+FG:S2'=\3+<VdL+FIF3+tO'D+<VdL+<l29ARlo[EbTH4+<VdL
+FH^X+>to22BX+b+FG:g1+kF,+<VdLHlsOh+>bhr+<VdLHsCP5/.*LB+<VdL,()[mDJ=B)F<D\K
+<VdLHq7-X2D@*I+<VdLHlt0u/i=ao+<VeS+<WNa1cZ[$+<VeS>](`:$6UH6+<VdNHqSBuDImd#
DfTc;+<VeS85^Qg0f1j4+<VeS+>u230H_J\+<Z%S+>k9!3$9=d+<Z&:DB^V=+<VdL+<VkU:iC/d
Fa,#O+<VdL+<Z&&;BR_T3A;Qu+<Z%S2`*-E+<VdL+FG:e0d&2*+<VdL+FIF3+tO'D+<VdL+<l24
F`M&-F!)SJ+<VdL+FH^X+>Y`32'="a+FG:e1+k7'+<VdLHlt1!+>Yer+<VdLHsCP5/.*LB+<VdL
,()[mE+i[#A0<!;+<VdLHq7-X1H.-M+<VdLHlt4(/i=ao+<VeS+>P\p2)??t+<VeS>](`:$6UH6
+<VdNHr=NgF_l2A+<VdL+<VeS85^Qd3B/c:+<VeS+>l,20H_J\+<Z%S1,C%/1a!n`+<Z&:DB^V=
+<VdL+<VkU6#:1JAR]'j+<VdL+<Z&&;BReM2)cX#+<Z%S2E!0A+<VdL+FG:e1E\M3+<VdL+FIF3
+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/LrD)/M/P+/M/P+/LrD)/M/P+/M/P+.kN>)/M/P+/M/P+
.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdNAo2WsFDk\uGp"MODe!3t
Bl@lrBQ%a!+>>5eBjl-kFDk\uGp"db$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh
+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+?:t[+<VdNBk/DK+<k;R1,3As@Po>\$6UH6,&Ln5@:Weg
@3R`TH[RFP+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkH
F`_SFFC0-8E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL+tG5s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU+<X3nD.OhA+AHEfBk1pdDBMVk@psInDf-[?HsCP5
/.*LB+<VdL,((LU+<VdL+<VdL+<VdL+<WH_9jqZd9PJ>d+<Z&:DB^V=+<VdL+<VkU+<VdL+<VdL
+<VdL+<Vd^0H`YjDg#\D88iNpHsCP5/.*LB+<VdL,((LU+<VdL+<VdL+<VdL+>tnr7!3Qd/PTqs
+<Z&:DB^V=+<VdL+<VkU+<VdL+<Vd^1c@$A1GCF?2'>M6Ch[<q+<VdLHsCP5/.*LB+<VdL,()=*
/i57@1bgdD2`NNI1c[H:cBM9N+<VdL+<VeS>](`:$6UH6+<VdNHlsOS+<Ve60ekR=1H.0O2)ZRN
Df03%FEM,*+FIF3+tO'D+<VdL+<l1U+<VdL+<Vd`1G1RB2E*QP+A?3cBlnK.AKW+C>](`:$6UH6
+<VdNHlsOS+<VdL+<VdL+<WEn1,C%UARTU%+<VdL+FIF3+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL
+<Vd_+AHclFD)d>+<VeS>](`:$6UH6+<VdNHlsOS+<VdL+<VdL+>Pl.1,U1B@<jJ9A0<!;+FIF3
+tO'D+<VdL+<l1U+<VdL+<VdL+<VdL+<Vdb+B;B.H6==Q+<VeS>](`:$6UH6+<VdN.kN>)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lt(D+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+
.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHqn*eAKW*<+<VdL+<Z&"ATMQuDIIX$
Df0r%E\0RnF=fmlB7*[!/M].789.F=DL>],+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+.kN>)/M/P+
/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](`:$6UH6+<VdNHphO`AR]Ro@3?[8+<Z&&;BReR
1Gg3s+<Z%S2DHg<+<VdL+FG:S0d&21+<VdL+FIF3+tO'D+<VdL+<l2'Bk;0jBHSE?+<VdLHq7-X
1c@6I+<VdLHlt1(/i=ao+<VeS+<WB]1c6Bu+<VeS>](`:$6UH6+<VdNHrFuu@ppK&+<VdL+<Z&&
;BRhN2)ZR"+<Z%S1Gpd=+<VdL+FG:S1*AG2+<VdL+FIF3+tO'D+<VdL+<l2!Eas36EclFG+<VdL
Hq7-X2)@'C+<VdLHlt=)/i=ao+<VeS+<WH_1c-<t+<VeS>](`:$6UH6+<VdNHs1Z%ASu'qB4Yt'
@VL3\;BRhS1GL!p+<Z%S1GCF8+<VdL+FG:S1a"M5+<VdL+FIF3+tO'D+<VdL+<l2!CiF'!@q/pi
+<VdLHq7-X2)dNO+<VdLHlt@(/heCj+<VeS+<WNa+>Y,_+<VeS>](`:$6UH6+<VdNHr+`tCistF
+<VdL+<Z&&;BR_T3A;Qu+<Z%S2`*-E+<VdL+FG:e0d&2*+<VdL+FIF3+tO'D+<VdL+<l2!CiF&r
Eb$:8+<VdLHq7-X1H.-M+<VdLHlt4(/i=ao+<VeS+>P\p2)??t+<VeS>](`:$6UH6+<VdNHr=Ng
F_l2A+<VdL+<Z&&;BRbU3&2U!+<Z%S2)m3B+<VdL+FG:e1E\J1+<VdL+FIF3+tO'D+<VdL+<i<f
/M/P+/M/P+/M/P+.kN>)/M/P+/M/P+.kN>)/M/P+/M/P)/M/P+/M/P+/M/P)>](_m+<VdL+C,<s
+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk?D00-,De*:%+=M&E@psInDf/oqDf'&.0I\,^
@<Q""De*:%+>=uH+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoV`@<--oDg-(C/.*LB+<kN1
,!$hj11juU1M&7"+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<klFF`Lu',!$iN$6UH6+<jcuAKZ&9
@<-E3Ch[s4ARlomGp$L8Bldj,ATV<&@rH3q+D,Y4D'2D9<?Q0fD.R6#F*(i2F"SRZ$6UH6>m_\s
I4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>GQ$$6UH6
,&(R33ZoV(0ekRq1,Cd3/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<
+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=
G]Y,j+Bo0q+<VdL+<p9d^I^^k?VY$HALp5\F(o9)@<?4%DCe=M:b4qAH"D#':18!N/5C%5=%#to
8h="[@:q,h6!m5>0JG136tKk88hr(S0J$"?BkM-t/5pJ0EarZ38OP*sDf0W</4FZ+D/X6/B6diZ
DffPqDB^V=+<VdL+<Vjo@WQI(F`_M>/6G\"2(Vj*/N#(d+A@&u/70r8/28n40f(@80fCXC0fCmC
2CpXE/hf:B2)d9A1,(FC+A"k!0eb:(:18!N7<i`PDfTZ)F"D!HFDu:^0/%NnG:mcAD.R:'Dg-,?
Ch.T>Bjl-:DfTJD1,(FC@;p1+Dg#]&/T,!6ATKD0/51>,/44_p@qZu_AT2d$Ch[B%E,ol9Df]?'
4$d=sDesQ<DJpY3F!+m6AnbasBl@ltC`mS/Ea`I#Ci=H;+EM[7F*(i.@q?csDBO%7AKZ&(Be<q2
+Du+@AS`JgDg'$lEc,;.DIFYr@WQI(F`_M>+=L2A/hUCH+tO'D+<VdL+<j*]@;TFn/4`Y]3&roK
0f(dG2_<7a0d&o*Be2P$0JYLF1G(F;0fU^>/iYgA1c-gB2Dm9F0e=n50J5.81c@9J/1`?t\1oO'
EbR(0DB^V=+<VdL+<Vjo@q]FoDIIQ:85^Qe2_lpC2)mQHcESK\EbR'j/1iD,/i5F:1,LU?1,q-H
1Ft+82_HjA2E*KL/4";b@VK='/C(LO7<3)n<+ohcDIIBn+Eq78+E):7B5)6lCi"A>6#pCCBk'1H
fV7$$fWcROVqHaVL=q@7Yoq3'`.?mYQ>(@^@;[Z7@;'[(-ms%LG%G\AF!,%3A1&fY>](`:$6UH6
+<VdN6"=SBEb$^l;BR_L3@lsG1,1?*[ie%HF"BU.0JG=D0e5+?1c[*C/i5I;0et@:2`<EG1FtCB
/iYRC0fV*C/1f)U/43ie/6jB2Bl\9:+CT5.Ch[Hk+EVNEcF4o`@<6L(DfB9%@:^QqDBO%7AKXoe
@;KgiFCcRkCh7[+>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sBs
ART+`DJ()%BOPpi@ru:&F!,(8Df$Us<(8H!+@B(.+A"k!+EMX5EZen$FC?;(Bl%?cDB^V=+<VdL
+uh81+F>^`Eb/Zi+DPk(FD)dEIUQbtDf0VLC11UfF"_WHF*(r$FC?h:@<Gpp@;TRd?ZU<tEcYSC
0JYC9FEhmT+poG8+C,<s+FPdJ+<Z"<+<VdN@qBIm?Z^R4AKj/X,%GP%AKiZ4+<VdNAU%crF`_>9
DI6mlF`):F3Zp.3/.*LB+<kN1,!$hj2)mNO3AY)$+tO'D+<VkFATV?k@<>p%3Zrct/.*LB+<k`H
FDuAEF!<Xf>7)Jq+<Z"<+<VdL+<k]3D.OnP+<klKA8cU4+tO'D+<VdL,&_UGE-680FEqh:,!$hj
F*)G6@;R2>$6UH6+<VkMAU&;@3ZqW6+<VdL+<Vk'@;TRd+EMX5EcX8u1c\fY+tO'D+<VdL+<i<f
/M/P+/M/P+.kN>)/M/P)/M/P+/M/P+.kN>)/M/P)/M/P+/LrD)/M/P)/M/P+/M/P)/M/P+/M/P+
.kN>)/M/P)/M/P+/Lt(D+tO'D+<VdL+<l2!@WQI(F`_M>HpM7ND..I46"=S>Ec,<+HpM7UBl[a3
6"=qD@XLIOEclVS6">%HASuR:6"FY;An?!kHpM:V@<,e(6"FYCCj]K*+tO'D+<VdL+<i<f/M/P+
/M/P+.kN>)/M/P)/M/P+/M/P+.kN>)/M/P)/M/P+/LrD)/M/P)/M/P+/M/P)/M/P+/M/P+.kN>)
/M/P)/M/P+/Lt(D+poG8+<Ve4$6UH6+FOS>+<Xr@$6UH6,'.[FEarZ)3ZqW6+<VdL,&D1+A92j$
EcZ[P10e]@/.*LB+<VkLD/XQ=E-67F-Ve)eARlp)FCB323[ZI$>Tu3R8O6?`:18!N>](`:$6UH6
+<klDDfp/@F`\`\0Hb]p+A"k!?VY$HAKhI(+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<kZ2
Ebf3(GA\TU$6UH6,&(R33ZoV+@k_FQ1H%*7/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,'.[FEarZ)
3ZqW6+<VdL,!faMBln'-DII?(F*(i2F"_H@C1UmsF!+t$DBND"+CSekARlomGp$[/Bln',B-;;0
AKXQ1<?PmfCh4`-EZeh:>](`:$6UH6+<k?7Bl7Q+FD,5.AoDL%Dg,o5B.b<3DB^V=+<VdL,$]"0
/.*LB+<Vk'ATo88@VTIaFE8RBAS#Bp@3BGrD.P7@EbT0"F<G"%ASuR'Df-[G;F)`_+CT.u+Co%n
Ch[cqFD5Z2+=KWh@jtZ#+tO'D+<VdNAoD]4FD,5.8hr(S0J5%%AT2QtBJ(DO$6UH6>m_\sI4P^J
+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>GW&$6UH6,&(R3
3ZoVX2e4U%0fWYe/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL
,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j
+Bo0q+<VdL+<iQt1cI0H0J54*2)ZRa2_cp=3&<<M3B9)[3B9)[3?U.6/i,:>1E\D43&i$:+>PVn
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
Df/olDfor>,!$i$1FrkU+<VkBA0O&W+uhG<3+66+2Bj[Z+<VdND.RftA79Rg,!$inI4P^J+<VkH
F`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE?Z^R4AKj/X
,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN.kN8'/M/P+/M/P+/M/P+/M/P+.kN>)/LrD)
/M/P)>](`:$6UH6+<VdNHng"eE+NouA0<:@G;!uT.3L3+HtIMCF*r+PBl%j<>](`:$6UH6+<VdN
.kN8'/M/P+/M/P+/M/P+/M/P+.kN>)/LrD)/M/P)>](_m+<VdL+C,<s+<VeT$6UH6>q?=*+<VkL
Dfp)1AKj/X>7)Jq+<Vk'67sC!E+No0Ap&3:+CT.u+E_d?Ci^^N+CT>4F_t]#+E)41DBO(>FD5P6
DJsW.@W-1#+D#G$>](`:$6UH6+<kW?@:UK.B4YslEa`c;C2[W1>](`:$6UH6+<k`7+?MV3Ap&3:
+E_d?Ci^sH>9G^EDe't<-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6A7Zr9$6UH6
,%Z"1@s)m-Df/olDfor>,!$i$1b8tV+<VkBA0O&W,%3H@2`P5%1a4IX+<VdND.RftA79Rg,!$in
I4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL+<k`HFDuAE
?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/JXDB^V=+<VdL+<VkUEbTT+F(KH#@<>pq11,*>Deio,+<VdL+<VdL+FIF3+tO'D
+<VdL+<i<f/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC/U#
E+NoqCL;."Deio,+<VdL+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/JXDB^V=+<VdL+<VkUEbTT+F(KH#D.R:$F'j!*Deio,+<VdL+<VdL+FIF3+tO'D+<VdL+<i<f
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC/ooG&qb6EcYT!
@s)."D/X3$+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=
+<VdL+<VkUEbTT+F(KH#DII^0FCB32?ZTXf@<-'hF)>i2AUIa#+tO'D+<VdL+<i<f/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+.pQs9/.*LB+<VdL,(+EFF(KE(FC0'&F(KE(FC0*+Deio,+<VdL
+<VeS>](`:$6UH6+<VdN.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/JXDB^V=+<VdL+<VkU
EbTT+F(KH#FCB')ATD.!D/X3$+<VdL+<VdL+FIF3+tO'D+<VdL+<i<f/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+.pQs9$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQU
Ch[s4+EV19F<G(%F(KD8Bl5%AEbTT+F(KGB+EM[>FCe]p+tO'D+<VdNF)>i<FDuAE+=o,fI4cWu
+D5_6+=D2DF(KE(F=/7>+<Ve4$6UI>/.*LBHO:l<+<k<,Ci!I#H#R==3ZoVVDe*E'/.*LB+<kBA
ARfk)Bl@lr@rHL-F<Wag0f:Kh+<VdNBk/DK+<i^Q0k3!q2In!_$6UH6,&Ln5@:Weg@3R`TH[RFP
+<VdNDfp/@F`_[K3ZqW6+<VdLHO:l<+<VdNDIIBn,!$hjF*(r2F`\fY$6UH6+<VkHF`_SFFC0-8
E+L4S+<klKEb/Zr+tO'D+<VdL,'7C@F<Wag>7)Jq+<VdL,#1HW.WT6EATMF)?ZKk%ATMF)?ZU(&
CLnW1/M/(nEbTT+F(KGB+EMC<CLnW1ATMs7/mN9</.*LB+<VdL,#1HW>](`:$6UH6+<VdN:-pQU
@rc-hFCeuD+>PW+1MpQ@1,iHU+tO'D+<VdL+<jQI/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN:-pQU1,E?XE\K3j
Ci<flFD5Z2+DtV)AKYDlA7]:VDB^V=+<VdL+<Vk'67sB91LY6C1,C%]A867.F<G16EZfFGDK9H4
AM8+9F<G10Cij6/Bl7QgDB^V=+<VdL+<Vk5DB^V=+<VdL+<VkEDdd0!-ZWpBATMF)-X:O5/.*LB
+<VdL,$]"0/.*LB+<VdL,#1HW+Dk\$F`S[EB.b;e3@lm=0O/K>/.*LB+<VdL,"t<d3Zqcg0eP.>
1G^.11+k@=1G^-r:-pQU6>ppeDf/ft+tO'D+<VdL+<jr_6p3RR0f_3Q+>Y,q0O/K>/.*LB+<VdL
,#qE%3Zp+]DB^V=+<VdL+<Vk'67sBhA7Qg$@VTIaFE8RBDfd+9DBMM:<?Q0fD.Rc2/KeqBARoj)
/Keq>D.P7@Ea^LAA7]7UDB^V=+<VdL+<Vjo:I72s+=K?63[[s>DKU"J.4cl01bgUA1GLXF.4dS9
3%d$E0KCmnDB^V=+<VdL+<Vjo:I72s+=nil4s2783[[]i8mb>%D.Ohc6:tT_6!m5>0JG1':I7Z\
6tKk88hr(S0IJ:l/1r&2:I8<(+tO'D+<VdL+<j3bCij)bF&-sjEbT&q?ZKk%ATMF)?TgFm2)\]W
+tO'D+<VdL+<i16EcW@5:gnB]F!j+3+=LAe6p"CE4%qt&4@)b0.3NYFF(KE(F<Dr3ASuX3-X:O5
/.*LB+<VdL+tt,n,\;")F(HIA6tL1V@8q;DG%G].A7]+gBldj,ATV9,>](`:$6UH6+<VdN>](`:
$6UH6+<VdN:-pQUG%#30ATJu&Eb-A;Bln$&DBLYf+Dkh1F`_29+E(j7FD,5.D.R:$F!+q1DegJ#
DB^V=+<VdL+<Vk'67sC$ATN!1F<E.XDJsV>B6%QlF<G%8F<G47De'u%DJsZ1BHUo*EZen(D/UP@
DfTVuDB^V=+<VdL+<Vk&AS$"*D/!lN3ZoOq03f\D0d'aE2D?7.+=^V?0d'aE0esk,2'=Fm0f^@5
0d&#.+>P&s2-b#C/.*LB+<VdL+u(bo4s3$A076K*AT`'2Bl5%F+=f*M+s8T_>p)$Z+>Fug>TtmF
>p*K0+F>_G+u(3%1*CpK+u(3@EcW@.DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk%69R@P+C?iX2D-dE
2*!NP+>bl,2Dd<N2`2^#+AP6U+AHEfBk1pdDBN2%+tO'D+<VdL+<jr_6p3RR1,(I>+>Y,q2dC5E
/.*LB+<VdL,#qE%3ZoP'+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sBT;cFl><'qdHAnH*qFBi]-
/.*LB+<VdL,$]"0/.*LB+<VdL+t$90+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%B6#:1P
CaU?1DB^V=+<VdL+<VjU;KEsj:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+=BHkB5_T64"!p?
B4Ym,4"!sGBk(R!>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQU6?6dQBQP@qFCB32+D,P4+>PW+
1E\Ir1,g=MATDKqBjkmaDB^V=+<VdL+<Vk'67sBoFEDJC3\N.1GBYZJCi*Tu@:Lp"Df%.9F*)G@
DJsB;04Js9B4uB=F*(i2F"_iRE+<fsAM6#!2Dd<F1,(I>/MJt41,iHU+tO'D+<VdL+<j-n4ZX]I
3[[40FCAm(+@KdYARZcODf&p!BOQ%*+@0gVDepO^Ch.*d@<,do+AuodAS`JV@;odoCgeGQASc0k
FE2)?-X:O5/.*LB+<VdL,!p?63Zpb1/3>m?6=k7MChI=%F(HImBl[p1F!+;"De"'2DBMboCi"6=
+Auc`F_l2A+B*5n@ppKGEas36EclFG6#LdQEb0;7<b5oP-QlZ3+tO'D+<VdL+<k'.+tO'D+<VdL
+<i12F!+sh@<-4+-TsL5-s9844&o'<9L:0NEbTT+F(KG96??CL+tO'D+<VdL+<k'.+tO'D+<VdL
+<jQI/g,7V@;^.#FE8RA@<?!m+D,%rEbp"DG@bT,+ED1;AM8+9FE8R8BkCsgEZd4^FDi9V0Hb4H
DKU&4F'NT,/.*LB+<VdL,!p?MEa`j,BllL!+?:Q!3%Qd<+?1o,1*A>0/29%*1Gp^<3$9t-0fU:4
0e>%=+>bl*3\`T:2)/?R+tO'D+<VdL+<j-n<,uDbF(o_Z3Zpb1<,uDbF(o_=/0HZ-+>PZ&1,'h*
0e>(7+>k]*0d&2*/2B"(1GgX<+>ku,1E\M2/2\P-3%R*M+>d>@+tO'D+<VdL+<k'.+tO'D+<VdL
+<jQI/g,7V@;^.#F<G".FD5i>A7ZloAS6$pATM*o+tO'D+<VdL+<j-n6#:X+3Zp:;+?2>'0fC.6
2]t"6+>Yu"3&_s;10e]@/.*LB+<VdL,!p?:Cihg$+@:-8Cih3c1E\G5+>kkr2`)X73$:"7+>u)"
0f^@92-b#C/.*LB+<VdL,$]"0/.*LB+<VdL,#h954ZX^43a<j`+B!8cDB^V=+<VdL+<Vjo9N4/9
+=JX#0fpp?.40Bg4s3g!:amM</g*K%6#:Wc>](`:$6UH6+<VdN<)Q[Y3Zoh!4>AoQ+>YGnHR:p!
<)$1<+=o,f6??+H@;^.#FBi]-/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+CT).BlnK.ATJu2@<?!m
+EVNE0d("<B6%Qp>](`:$6UH6+<VdN0d&V%4t\K2/MC?Q0d&bU<*X;b/.*LB+<VdL,$]"0/.*LB
+<VdL,#1HW+EVX4DKBN6+EV=7ATJu2@<?!m+EVNE0d(=IDKU&4+DG^9GAhMCF<G(%F(JTo+tO'D
+<VdL+<iN_4Wlp@0-GWb-oNb%,<B-l?SN[/+>=om+F@?;0d'Fn<%/qA+>tnr,<B-l?SN[/+>P&q
+F@?;0d'Fn<*X;b/.*LB+<VdL,$]"0/.*LB+<VdL+t#rJ<?P%&<[U$k+Dbt)A92j$EcW?W>](`:
$6UH6+<VdN.!mRO+u(385uoEt3Zrc1>TtmF:-hocDB^V=+<VdL+<VjVHS/PI0d'%R<@L'l+F?.S
+u(335uh0-+tO'D+<VdL+<i1.@<Q[4+Ce5VEc#kF4ZX]6=\V:G<DP\M67F$tBldj,ATT%i@<Q!V
FCB2s:18!N>](`:$6UH6+<VdN-V7`hEcW@5:gnB]F!j+3+=LAe6p"CE4%qsi+ED1;ATMF)+A"k!
?VY$HAR'*s/.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+Co%q@<HC.+C&e./.*LB+<VdL+t$)rEbT&u
@;^+,+Dae]D.Oi":gnB]F!j+3+DG8,?Z^3s@<itL>](`:$6UH6+<VdN>](`:$6UH6+<VdN:-pQU
A79Rk+E(j7<GZeuFWbaI@<*K0@<-I8+Co2(ATD$n+tO'D+<VdL+<kr#6p3RRC3=?)EarNo+E^g]
6p3RR1,(I=+>GPm0f`KV+tO'D+<VdL+<jfZ<Dlg[3Zp.50eP.73A`H5?SXJk1GgmA0jJT?/.*LB
+<VdL,'?mb6TmIQ?TB_r+C&e./.*LB+<VdL,'?RR5t=(!+>ti+>](`:$6UH6+<VdNF\G>%;Hc4E
+>mDA+tO'D+<VdL+<kr'5tsd23ZoeMCisc@+>"^WFCB24E+*d/Gp$X3DImi9>](`:$6UH6+<VdN
F[TYYCHX^$0O/K>/.*LB+<VdL+t$B,F`MVFF!,9o@;TQu@o-TSD0%'f3Zohn=\V:GF\5%`<D6Cj
<BG>'<'r`i9MIfC4*=4f:Jt@XF\Y4s76>W[@<--4+DG8,?Z^3s@<itL>](`:$6UH6+<VdN-WOu*
EclDD+Dae]D.Oi":gnB]F!j+3+=MA89gh'c8jka@9N=tj4*=P&6T]Ea9gM92F\G>%;Hc/):-hTC
4*<r"Ebd*HDII]qFDk\uGp"eGDB^V=+<VdL+<Vk5DB^V=+<VdL+<VjU:18<dF!,9o@;TQu@o-TS
D0%'f3[ef_@psInDf/p-ASc1$GB7kEDIn8>0f_$G+?:Q"2(ggF.3N>5F^K6/A79a+0O/K>/.*LB
+<VdL+t$,oG&hXHCeeDUAKYJZ@<-4+-TsL=Ci<flFD5Z2?YF@pAUYaV3Ai];2]sh7.3NM:G$f?0
A79a+0O/K>/.*LB+<VdL+t$,oG&hXHCeeDUAKYJZ@<-4+-TsL=Ci<flFD5Z2?Zg1-EclgR1,(O@
+?(Du.3NM:G$f?0A79a+0O/K>/.*LB+<VdL,$]"0/.*LB+<VdL+tt,n,\;")F(HIA5u0fi9k@mY
F)>W/+BEN(+A>*E=\V:,<DO`8F!*ej+@:-KEa`j,BlkIaF$XVa+B2'3+@/\#+B26<+AQ?gEcW?p
@<HU3+Ce5VEc#kF>](`:$6UH6+<VdN0H`%pATD4#AKWB_3[[Kb<?P%&<[T==/0H?f/mKST+AP4'
.4cTg/mKST+A"k!>](`:$6UH6+<VdN0H`%pATD4#AKW@C=\V:,F\5%E<D6Cj<?QEa<'qdN9MIfC
+E^@K:Jt@=9kA?ZA8,IiEcW@'Cisc@EcW@G:-hTC+Dae]D.P)"DB^V=+<VdL+<Vk5DB^V=+<VdL
+<VkLD/XQ=E-67F-W!*-;aj)83ZrHWF(KE(FC0'&F(KE(FC0*+Deio3>](_m+<VdL+C,<s+<VeT
$6UH6>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sC%BQ&);FCfN8+Cei$AR'*s/.*LB+<Vj_+Co2-
E$-NKBldj,ATV:"Bldj,ATV:#D/X3$-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0E+L4S+<k<6
A7Zr9$6UH6,%Z"1@s)m-Df/olDfor>,!$i$2Co1X+<VkBA0O&W+u;/:AN2S)2Bj[Z+<VdND.Rft
A79Rg,!$inI4P^J+<VkHF`_SFFE8We+Bo0q+<VeR$6UH6+<VkG@;TR"3ZoVfFC]<4F<W7C+<VdL
+<k`HFDuAE?Z^R4AKj/X,'.jHARTF"/.*LB+<VdNFCf]=,!$iN$6UH6+<VdN:-pQU-us$CATMF)
.3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GCX@1MSX$1,^pK>](`:$6UH6+<VdN:-pQU/M/P+/M/P+
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
EbTT+F(KH#@<>pq11,*>DeiohDB^V=+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:
F"'-m1,(I>0JkO@C,%P#2D[?uDB^V=+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/PZDB^V=+<VdL+<Vk'67sBi@:FLhFDk\uGp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;
F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+bCFC0-.A79a++<XEG/g+bEEc#6,+EVO4
@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!+EMX5
EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<Ve%67sBsDdd0t
+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&
B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+DtV2A79b"BleA=
+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!Ecu/7B-;#)F*&OCAfu26A79a2F!,@/G%kStFD5Z2+EMX5
EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4
Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<VjN+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3De!3t
Bl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV9jF)Y].@;B4k
D/X3$>](`:$6UH6+<VdN:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GCX@1MSX$
1,^pK>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6+<VdN
:-pQU@UW_k?Z^3s@<it<:-pQUDIIBnA0=3I@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57B-;;7
A79agDB^V=+<VdL+<Vk'67sBmD00-,De*:%+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7F*2;@
>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"4P:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VDATW$.
DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)SJ:-pQUCi<`mF!,L;F(KE(F<GXH@<*K$
@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<Ve%67sBu@;TRd+DtV2BkLjrBl@l3F*(i2F!,L;
F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:Amo^o
+?!R\+E(_1ATDs.DJ().BleA=De:,6De*:%-Z^DJ@<Q?t@<?4%DBO"B@<-EoDB^V=+<VdL+<Vk'
67sC$Bldj,ATT%;+<Ve%67sC$Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:$6UH6
+<VdN>](`:$6UH6+<VdN+<VdLAo2WsFDk\uGp%!5G$f?0A79a+Ci<flFD5Z2?YF@pAKW[3DB^V=
+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N6om@OEbTT+F(KH#D.R:$F'j!*DeiohDB^V=+<VdL+<Vk'
67sB/EbTT+F(KGB+DG_8ATDBk@q?d,DfTA:F"'-m1,(I>0JkO@C,%P#2D[?uDB^V=+<VdL+<Vk'
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/PZDB^V=+<VdL+<Vk'67sBi@:FLhFDk\uGp"5)
67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI
/g+bCFC0-.A79a++<XEG/g+bEEc#6,+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp
@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL
+<Vk'67sBsDdd0tFCB32+<Ve%67sBsDdd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI
/g,%?G$f?0A79a++<XEG/g,%?D.R6#DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\u
H!G52/.*LB+<VdL,#1HW+DtV2A79b"BleA=+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!Ecu/7B-;#)
F*&OCAfu26A79a2F!,@/G%kStFD5Z2+EMX5EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K+<XEG
/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<VjN
+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3De!3tBl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL
+<j6A<?Q<rF(KE(F<EkC9J9.:;H-1?;bpCm80CHD9keJfAo_I&06;5DFE8Qf4Ztqk4^;kK/.*LB
+<VdL,'%+9+Dk[uDE8nI0J5+>3ArlR1cRBN3A<-C3&=fW+tO'D+<VdL+<k?1F*)G:@Wcd,Df-\+
@WQI(F`_1;D/!m1FCcS*BkCsu>](`:$6UH6+<VdN+>=o\0d%So+<WH_+>b2u+>t?$>](`:$6UH6
+<VdN0ea_/2'=e;+>u)"1,g=7+>t>t>](`:$6UH6+<VdNF*(i4F!+n#F)Pl;FCcS3Bl8'8AKYMt
AnH*hDB^V=+<VdL+<VkL@;Tt"AKZ&.H=],[+<VdL+<Vd^2DJHS+tO'D+<VdL+<kZ:DJ<s1D)rd^
+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,&Lb5Bl/!03ZoOf+<VdL+<VdL+<Vdc>](`:$6UH6+<VdN
0lqFZEHP]1FD5Q&3ZoOf+<VdL+<WCDDB^V=+<VdL+<Vj`DIal0F^]<4Bl%?A+<VdL+<VdL+>R2>
+tO'D+<VdL+<iU^A0>l7@<-I(Ch5XM+<VdL+<VdL1L+fA/.*LB+<VdL,%bP0F*&OADe*E?+<VdL
+<VdL+<Vd]>](`:$6UH6+<VdNAnc:,F<G"0FD5T1A7[eE+<VdL+<WUJDB^V=+<VdL+<VkFARTI;
+<VdL+<VdL+<VdL1+k@:1,iHU+tO'D+<VdL+<klKA0>DoG&B>`+<VdL+<Vd]/i,=D3F$GG/.*LB
+<VdL,'.O2GA^u5F#kEd+<VdL+<W?j3&!0D>](`:$6UH6+<VdNCNXZ>Df]W63ZoOf+<VdL+>YW/
1Gh'rDB^V=+<VdL+<Vk)5uU]N6om@OEbTT+F(KH#DII^0FCB32?Y*_i?ZU(&CLpag+tO'D+<VdL
+<jQI/g)Q_Bldj,ATT@DBl8$(Eb8`iAKZ28Eb$S>.68S,0JYF<1bpk%0f1XD1HA]X+tO'D+<VdL
+<jQI/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<jQI/g+V3@X2=&De*:%
+<XEG/g,%?D.R6#6=F>KCi=3*@;[3/FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL
,#1HW+D,J4?Z^3s@<it<+AP6U+D,P4D..N/FDk\uGp%9AEaj)4Eb0<7Ciip"+tO'D+<VdL+<jQI
/g+k:F^K6/A79a++<XEG/g,%?D.R6#8O6?!F*(i2F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D
+<VdL+<jQI/g+tK@:XG$@<-E3+<XEG/g+tK@:XF%EbTT+F(KG9F*(i2+Cno&@9d[o/.*LB+<VdL
,#1HW+DtV2?Z^3s@<it<+AP6U+DtV)ARlp$@<Q?t@<?4%DBO"B@<-E3EbTT/DJ(VDATW$.DJ()6
De*:%>](`:$6UH6+<VdN:-pQUDII^!@<l['F*&NI:-pQUF)-%DF(&ZhEbQXS?SEU@@WQ+$G%ki,
+Dbb5F<GL6+EVO4@<j5A+DtV2BkLjrBl@l3F*(i2F'NT,/.*LB+<VdL,#1HW+ED1;ATMF)+<VdL
+AP6U+ED1;ALnsGEa`j,BlkmKF(KG9FD5T'F!,C5+EMX5EcYK'+tO'D+<VdL+<k'.+tO'D+<VdL
+<hpN+<Y95FC0-.A79a+DII]qFDk\uGp$pA@psInDf/oqDf'&.0O/K>/.*LB+<VdL,$]"0/.*LB
+<VdL,#_-;+ED1;ATMF)+@/[p02>;@<(JZ@:K:@b+@pNIBl5&*Eb05DF*(i4F!*V/4Ztqk>](`:
$6UH6+<VdNEaa/7BQ@s(DBNe-@;\+K?SF)d1,(O=3&*<I1,_!G0K(X@>](`:$6UH6+<VdNA8-+,
EbT!*FD5Z2+CS`#DesQ<AKYi(DKU&4+Co1uAoh3p+tO'D+<VdL+<hp^+>I,=+tO'D+<VdL+<iX%
+>I,=+tO'D+<VdL+<klK@<?Q5@:F:rCisi2+Dkh1F`_1;A8,XfF'NT,/.*LB+<VdL,'.10E,9).
F(or33ZoOf+<VdL+<Vd`3F$GG/.*LB+<VdL,&M%3Bl/!03ZoOf+<VdL+<VdL+<VdL0O/K>/.*LB
+<VdL,&Lb5Bl/!03ZoOf+<VdL+<VdL+<VdL0jJT?/.*LB+<VdL+u+.\+E;O4Ecc#3ANCqV+<VdL
+<VdL?X.Im/.*LB+<VdL+u4%H+E;O4Ecc#3ANCqV+<VdL+<VdL0O/K>/.*LB+<VdL+u=7M+E;O4
Ecc#3ANCqV+<VdL+<VdL0jJT?/.*LB+<VdL,%bP0F*&OADe*E?+<VdL+<VdL+<VdL0O/K>/.*LB
+<VdL,%bP0F*&O5DKKT0De*E?+<VdL+<VdL0jJT?/.*LB+<VdL,&Ln"DE8m_+<VdL+<VdL+<Vd\
/hf%71gFoB/.*LB+<VdL,'.j:+Co&,DE8m_+<VdL+<Vd\/ho1<3F$GG/.*LB+<VdL,'.O2GA^u5
F#kEd+<VdL+<Vdb/iPaG3F$GG/.*LB+<VdL,&;=AFDl57F#kEd+<VdL+<WL"/hf%73*^>F/.*LB
+<VdL,#_-;+ED1;ATMF)+@/[p02>;@<(JZ@:K:@b+@0gcBlnK.AKYT*AT9AEFCB94+?_kN4Ztr5
DB^V=+<VdL+<VkK@<Wi-Ec#N.+Dk[uDE8mo/hf"81,LgI3B&rU3AEKL2E+lY+tO'D+<VdL+<k?1
F*)G:@Wcd,Df-\+@WQI(F`_1;@;L%"FEM,*+Co1uAoh3p+tO'D+<VdL+<iK^0J5(&0J5+cDB^V=
+<VdL+<Vje+<WEr+<WBu>](`:$6UH6+<VdNF*(i4F!+n#F)Pl;FCcS'CijB5F_#&+A8,XfF'NT,
/.*LB+<VdL,'.10E,9).F(or33ZoOf+<VdL+<VdL+<VdL+<VdL+<Vd`3F$GG/.*LB+<VdL,&M%3
Bl/!03ZoOf+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,&Lb5Bl/!03ZoOf+<VdL
+<VdL+<VdL+<VdL+<VdL+<W?j10e]@/.*LB+<VdL+u+.\+E;O4Ecc#3ANCqV+<VdL+<VdL+<VdL
+<VdL+<VdL0O/K>/.*LB+<VdL+u4%H+E;O4Ecc#3ANCqV+<VdL+<VdL+<VdL+<VdL+<W?j0jJT?
/.*LB+<VdL+u=7M+E;O4Ecc#3ANCqV+<VdL+<VdL+<VdL+<VdL+<W?j10e]@/.*LB+<VdL,%bP0
F*&OADe*E?+<VdL+<VdL+<VdL+<VdL+<VdL+<W?j0jJT?/.*LB+<VdL,%bP0F*&O5DKKT0De*E?
+<VdL+<VdL+<VdL+<VdL+<VdL0O/K>/.*LB+<VdL,&Ln"DE8m_+<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd\/ho+:1gFoB/.*LB+<VdL,'.j:+Co&,DE8m_+<VdL+<W?j0K(mJ0JG170JG170JG170jJT?
/.*LB+<VdL,'.O2GA^u5F#kEd+<VdL+<VdL+<VdL+<VdL+<Y#F/i,1A2-b#C/.*LB+<VdL,&;=A
FDl57F#kEd+<VdL+<VdL+<VdL+<VdL+<Vd^/ho4>1gFoB/.*LB+<VdL,#CR(;aj)83ZrHWF(KE(
FC/ooG&qb6EcYT/@:iqgBjYpuDeiohDB^V=+<VdL+<Vk'67sB/EbTT+F(KGB+DG_8ATDBk@q?d,
DfTA:F"'-m1,(I>0JkO@C,%P#2D[?uDB^V=+<VdL+<Vk'67sB4/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/PZDB^V=+<VdL+<Vk'67sBi@:FLhFDk\uGp"5)67sBu@;TRd+@9LGH#.D:Bjkm%F*(i2
F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g+bCFC0-.A79a++<XEG/g+bEEc#6,
+EVO4@<iu=ATD7$+ED%7F_l/)DB^V=+<VdL+<Vk'67sBp@<Gq!De*:%+<Ve%67sBu@;TRd+A"k!
+EMX5EcW@DBle!+B.n=;FED57B-;;7A79agDB^V=+<VdL+<Vk'67sBsDdd0tFCB32+<Ve%67sBs
Ddd0t+ED1;ATMF)+EMX5EZen$FCAEl+tO'D+<VdL+<jQI/g,%?G$f?0A79a++<XEG/g,%?D.R6#
DII^&B45mrDf-\=FCB32+ED1;Bl7Q:F(KH8Bl7Q+FDk\uH!G52/.*LB+<VdL,#1HW+DtV2A79b"
BleA=+AP6U+EM=D+ELt'@<-')2IA-\Ddmd!Ecu/7B-;#)F*&OCAfu26A79a2F!,@/G%kStFD5Z2
+EMX5EcYK'+tO'D+<VdL+<jQI/g,1KF(KE(F<D\K+<XEG/g,1KF(HmFFE1f-F(o_I+EM+9+EV=7
ATJu4Afu/:@<-EoDB^V=+<VdL+<Vk5DB^V=+<VdL+<VjN+<Ve=D00-,De*:%+DtV2?Z^3s@<iu3
De!3tBl@lrBQ%a!+>@&<+tO'D+<VdL+<k'.+tO'D+<VdL+<jWJ;c?+Q3]\C(Bldj,ATV:"Bldj,
ATV:#D/X3$>](`:$6UH6+<VdN:-pQU-us$CATMF).3N>BFCfK)@:NjkGAhM4.!$gu+>PW+1GCX@
1MSX$1,^pK>](`:$6UH6+<VdN:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+>](`:$6UH6
+<VdN:-pQU@UW_k?Z^3s@<it<:-pQUDIIBnA0=3I@X2d.DJ<Ns+EMX5EcW@DBle!+B.n=;FED57
B-;;7A79agDB^V=+<VdL+<Vk'67sBmD00-,De*:%+<Ve%67sBmDfT]'F<G[DA79a+G%G]'F!,L7
F*2;@>](`:$6UH6+<VdN:-pQUBjl-kFDk\uGp"4P:-pQUDIIBnA0=H0<?Q@)@<-E3EbTT/DJ(VD
ATW$.DJ()6De*:%>](`:$6UH6+<VdN:-pQUCi<`mF*(i2F!)SJ:-pQUCi<`mF!,L;F(KE(F<GXH
@<*K$@<>p_DB^V=+<VdL+<Vk'67sBu@<Q""De*:%+<Ve%67sBu@;TRd+DtV2BkLjrBl@l3F*(i2
F!,L;F(oN)06:]HFD5W*+EVO4@<l*q+tO'D+<VdL+<jQI/g,%?G%>$,Ch[s4+<XEG/g,4NGp%0:
Amo^o+?!R\+E(_1ATDs.DJ().BleA=De:,6De*:%-Z^DJ@<Q?t@<?4%DBO"B@<-EoDB^V=+<VdL
+<Vk'67sC$Bldj,ATT%;+<Ve%67sC$Bldi:+EVX4DKBN6/0K"FF<G[>D.Rc2De:,5FCB32>](`:
$6UH6+<VdN>](`:$6UH6+<VdN+<VdLAo2WsFDk\uGp%!5G$f?0A79a+Ci<flFD5Z2?YF@pAKW[3
DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vk)5uU]N6om@OEbTT+F(KH#FCB')ATD.!D/X3$>](`:$6UH6
+<VdN0jJT?$6UH6+<Xqs+<VdLI0q)>+C-N*+<VdNF)Q2A@q?iF+Bo0q+<VdN:-pQUEcl7B@;Ka&
FD,5.FCfN8+Cei$ATJu.DBO%7AKZ&:Blmo/>](`:$6UH6+<jQI/g,4XE,]i/F)u&5B-:W!C`m20
F<DuQD/XQ=E-67O+E)CEE-68-DB^V=+<VdL,#1HW+@T^KBHVD.F*&OKBl%T.F(fK9+Ab@&;aj)8
3Zr-K+AYW_>](`:$6UH6+<iWbEccCG-ZWpBATMF)-R&m?+<Xqs+<Z(`$6UI<$6UH6,%G2#CgV:0
E+L4S+<kZ2Ebf3(GA\TU$6UH6,&(R33ZoV'@k]cLAnGX!/.*LB+<kZ6FCA]gFC?@S+FAMf$6UH6
,'.[FEarZ)3ZqW6+<VdL+sS<T6?R!YA8,po+CK5(F(KE(FC8?k+tO'D+<VdN>](`:$6UH6+<jcu
ATD?)@<,p%@3BH1D.7's+E(j7FCfN8+EM%5BlJ08+DG^9?tOP'F'p,4BOQ!*@WcC$A0>;uA0>Ds
F*)G:@Wcd(+CK5(F(KE(FC6_+DB^V=+<VdL,#i5eF(HJ8@rc:&FE8R5Eb-A8F`(c$+EVNED0[78
DK]`7Df0E'DKI"1F`\aJBOuH3A8`T)Ci"68FE1f3AKYZ)G9D!G>](`:$6UH6+<i:P@;BF(+CQC'
BleB:Bju4,Bl@l3F(96)E-*]V$6UH6>m_\sI4P^J+F=G<+<Vk<ASc0iFEqh:,!$hj@rGmh+tO'D
+<Vk>G\(B-FD5Z2?Xn"sDKI'`+>Gf+$6UH6,&(R33ZoVY1H7BM11Xl=/.*LB+<kZ6FCA]gFC?@S
+FAMf$6UH6,&_UGE-68D,!$iN$6UH6+F=G<+<VdL,&Uh+AKj/X,'.j:Dfp.G/.*LB+<VdNDfp/@
F`^u4H#R==3ZoVfFE1r$D'CM<+<VdL+<ko=G]Y,j+Bo0q+<VdL+<jQI/h1=QBl%<eEbTT+F(KG9
F=f'e@WcC$A0<:@Bldj,ATT@D@;]TuA8-+,EbT!*FCd(0DB^V=+<VdL+<Vk'67uM\+tO'D+<VdL
+<jQI/g+YEART[lA3(hg0JYG$@<+%^>](`:$6UH6+<VdN:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M14F+tO'D+<VdL+<k'.+tO'D
+<VdL+<k<6@r,RpF!,RAE,9H&?U6tD@WcC$A2uY1?TgFm-UC$a@WcC$A2uY1-QlV9@rGq!@<6!&
4=<E\6"4tNCh,Od3@A'L+tO'D+<VdL+<k<6Bl8!'Ec`EOBkhQs-X:O5/.*LB+<VdL,$]"0/.*LB
+<VdL,'.77DEU$'-ZWpBATMF)-X:O5/.*LB+<VdL,$]"0/.*LB+<VdL,!I]-:JaJT6qKa/3ZqsI
A0<QK+C&e./.*LB+<VdL,$]"0/.*LB+<VdL,#1HW+DGF1-u!O0GUXbLF!,(/EcZ=FA8,OqBl@lt
Ed8dGDBNn,FD)e2DI[L*A7ZltFBi]-/.*LB+<VdL,%tOrA7TCa4ZX]6-Y[F/GUG((4u%C[:dn,I
8OFpO-Y[F/GT\A=DB^V=+<VdL+<Vk5DB^V=+<VdL+<Vjl0RI_K+?MV,BOtU_A8,O)-Y@LCF!,UI
Bl%i<+BosE+E(d5-RW/:+tO'D+<VdL+<k'.+tO'D+<VdL+<j!'HZX+DCi<f+B4Z0-4$"a%ATW$=
F<G4-FDYP2B4Z0oH$!U?@:jUmEbo0*FE;PE+ED%%A0?):Blmo/F(fK9E+*g/+EM4)>](`:$6UH6
+<VdN.kN8'/M/P+/M/P+.kN>)/LrD)/M/P)>](`:$6UH6+<VdNHng"YCi=B+A0<HfHtIMCF*r+P
Bl%j<>](`:$6UH6+<VdN.kN8'/M/P+/M/P+.kN>)/LrD)/M/P)>](_m+<VdL+C,<s+<VeT$6UH6
>q?=*+<VkLDfp)1AKj/X>7)Jq+<Vk'67sC%BQ&);D..-r+ED1;ATMF)+DkP&ATD$n+tO'D+<VdN
E,Tc=@q]:kF!*/ADB^V=+<VdL,#1HW+DbUtA8,po+Cf(nEa`I"ATDisDB^V=+<VdL,'.U>F`_SF
F<EFp0Hb]p+>G!LBle59-Xq44Ch-mnBldj,ATT;)DB^V=+<VdL+u:?[A0<6I+poG8+C,<s+FPdJ
+<Z"<+<VdN@qBIm?Z^R4AKj/X,&Lb/CLh@-DB^V=+<VdNBk/DK+<iZu2.J@L1gqRZ$6UH6,&Ln5
@:Weg@3R`TH[RFP+<VdNF)Q2A@q?iF+Bo0q+<VdN,9n<sCht5)Df0,//Kf.K@;]k%+D,P4+E2.*
H"h//+poG8+C,<s+FOS>>q?=*,&Ln5@:Weg@3R`THO:l<,&:b1DImX*E+NN'3ZrbV+<VdNA8-+(
CghTrDIIBn,!$hj8g5en+<VdNCgh3oF^\oo,!$hj8g5en+<VdNDIIBn,!$hjC27C$DImW.$6UI>
/.*LB,&C\*B6@WqARB.hAoAkS+F=G<+<Vk?Bl%?fAU&<.DKBN1DB_+a+tdSEF!<.B+<VdND/!iu
FEqh:,!$hjFCf]=01mE>$6UH6,&Uh+AKj/X,"a$d+<Z(>+FPdJ+<k]4AoD^,@<<\S+>bVV+<k]4
AoD^,@<>jnBl7j0,!$i($@N8(Cisc@?Xn5!Eb0-1?ZU".F(KGK2H+C:;dj9HEbSH`FED57B6.*b
EcYr5DETd.0FCKlDJ*[*F_#&H0eP7:0JPOI0fCpJ2E!HO2e=Kn1($]`FD5i>A7[nU1+kF?1c$g>
0JG170JG170P)ag0a^3_FD5i>A7[n]/iYX@0JG170JG170JG17ALfGi$;,GWBjkmI@<?'D1+kCA
0JG::0ebF=2E!HO2e=Kn2@<DtD.QmhDIksk/i>=:0JG170JG170JG17ALfGg$:A6<ASu$eE]l/b
6$79f6rR&J0a^<[Cij)b4Z=uJ3AWWP2E<TQ1-%6L0fW_p0JNo#F`_OiAScHs<';rC6tp^]CghTV
Df9Z,;gEG+ASjRc$:JTLE,8s.6Y1.WATCI_DET^,2`ENK0K(gJ2DI*G0JkLq.ki^c6tp^]CghTV
ASuU$E_Kn`4Yn]J0JPRE0f(R>0JkaJ2_eko0JNo&Ble60@<k[iDe`inFD5Z24YmF5Ble60@<k=<
<]rAo1,CUA1c[HR0ekXA2`!:%.ki[b6tp^]CghTYCh[j-ARnhQEcaGu$:JTLE,8s.7VldXE+NQN
DfTQ<4YR41F`MM6DKJ]qARf:mF(oQ14Y[:?Eb/`lF)u&6DFJM_@q\"\/i5F?2)I0E0JG170JG17
ALfGm$;P_c@<?4%DET]]6"4DGEaa'(Df.]l$;bb]E+O&49lG,fDf.]l$;>/HBQP@rBl.EE0a^fi
Ao_<iFD5Z24Y[:3@<?'MD0/]uE]k^W+=1J>-"JPL-!;?W6OHe,D.Q1RFAm:%4XEZ\,u$EH;]mB*
$;s/XARe2HF?MDe6#:X/H:Dan4YmF=@<>1]DFSJb4Y\Yu7:U.JE-,f(9OW$:Df/$]F?MDe7q$4B
@ruEp9OW$:Df/$]F?MDe;e9cV@ru9m:L\'M@rsk#AS5^p:L\'M@rr&R@VTIaF@ek`1+Y.;2`WiK
0a^9dD/F3/:18!N4]HQEASH2m6Xb(FCi<r]F_tT!E]k[g+Ad3"$:A6D@;Kjp:3CD_ATBpg2'>_<
E!es@FCB!(B23Sd@V'RC85^Qd0fV#t6Xb(FCi<r]F_tT!E]lr]+>u/91,B8)@<>poDeDgfD.7's
4]=XB+>Gf41,1]p6Xb(FCi<r]F_tT!E]ld.6m+':1E\S81,oV.@<>poDeDgfD.7's4[W%6+>#?)
+>Yf33!r#]FCB!(B23Sd@V'RC84cW#1H@BO2[WN0E+M129mB\G7;cX3@VTIaF?NQ6Ch7*uARnSG
C1Ums$<(MPARfgnA5?ZLARfgUDe!QoA3DUR88i?V:L\'M@rsk&@<-I'$:o)PAPd2ODImo`De!Qo
A3DUR88i?V:i'QXATU=SF*(i.@q@e[/i#=@2)6sD2DR$G3&rrTAM#Sn$:o)PAPd2ODImo`@<?4*
F_#&H/M\q41GLXF2)mTM2)d9H1c],!0JWu+Df'&^Cgh3mFA-UjB5)I1A7[n^/ho(@3&N]N2Dm9I
2Dm?MALfGg$:\rMCi=MgDf'&^Cgh3mF?M>c;eU)n88iN_H>d[a0a^HiEbTi<DGtY&Ch5ab$<(VV
G=ZXmBmO]87r3*f4YR4ABQ&)cDfTQ<Df.pNEb&m%@;JbYBl8$64Y[:7DfTQ<Df.jWFD5i>A7[n\
/iPR@1,q$E1GggH0fV0NALfGg$:o)UBmO]8<+U;rF`M%V9kAEXDfQsfEaa'$E\;<KB*qRNDg+TX
H#.2-BQQBk$:J<JCh[NqFAlt#;Fa&:0J5+70JG17/2/\80JG170J"n13&!$?0JEi4BQ&)kCgh3m
FE9T"$<(VVG>N*aDImo[EbT'*4YR4ABQ&)kCgh3mF?t._F$22a;eU)n:i'QXATU[UD.RcO0a^im
Dg,#o@;]Xu:hX9YATL!h$<(VVG>N*aDImogF`M)&@qB^E0a^imDg,#o@;]Xu;g!+m@:Nk<ART\'
Eb0;T0FC`lDg,#o@;]Xu6$-s^F)Yf(Eb0;T0a^imDg+oiDJsPiDf9N74YR4ABQ&)`@<-I'9lFrf
;eTTMDg+Q_EarosF$22a;eU)n6$%-ZEc5Z&F$22a;eU)n6Z6gQFE9T!$<(VVG>hplASc0sFCfMV
0FC`lDg+oiDJsPlCgh3mFA?7]ATL!g$<(VVG>N*aDImocEaia)F$22a;eU)n9lFrf:NBoYFE9T!
$<(VVG>i'hARfgnA5?ZLARfgY@<?0G0FC`lDg,,kCh7*uARnSGC1Ums:NBoYF?M;b;eU)n:NBoY
FAQOhBhiSWAPHTRCLqO-4YR4>Cgh3mFA61V9PJ?XFA$1j4Y\QG0JbUA2Dm6G2`*9J2`>4t0JNo2
Cgh3mFA61VDJ<]s@psInDf.]m/het50JG170JG170JG17ALfGg$;GGWDG=PPDJ<]s@psInDf.]m
/het50JG170JG170JG17ALfGg$;FrLF&R1+Ch5a`$;bPIDImob@;TRR7m]?n/het50JG130eP.6
0JG17/28b20JG170FC`lDg,-%@<-EP0a^imDg,-%@<,+OD.RcO0a^imDg,-%@<,1bDfB9.:18!N
F$25b;eU)n;flGg6=G.NE_L%dFCfK64YR4AFCB2WDes?48T&W]DKBN6Gs*lB1($s%@<,:V@;KL<
0eP.60JG170JG170JG170P)ag0FCa#@<,+OD.Q+HDKBN6Gs+/?3&*6L2)I6H0etaG0fLq#/MJpe
;flGg9jq[.Bl.R+4Z"cF3&EEK3&WcP0fD$H3&tP#0JEi4FCB2a@:r8JD/")d@<cL'F_s9%/ibgD
1,LgB2`N`T0f_0KALfGg$<(VVG=6@l@VfUSFCB324YR4AFCB2b@;TRR7m]?n/het50JG130eP.6
0JG17/28b20JG170FC`lDg+T\AT1R`Gu%maARfh'4Y[:BBQ&)_AS#gZCO&Kg@:s.m4YR4ABQ&)h
ATMp,ATCRaCjA/t$<(VVG=6"RE)UOt6$-1BA7\5+<]r,D6tKqK;epYQ@:r8JD/")T3%d'K0JGID
3B/fM2`<HM2e=Kn0FC3ZAT1R`Gth^[9PJ?XFA61gBl/!04_\eG$<(VVG=6"RE)UOt:18!NF$25b
;eU)n6tKqK;epYTEc5o.E_^%[ATL!h$:JH:E)UOt:18!N6tL7WBlnV`2D-mI2`EQI0K;!K0KCjF
2.\?n0a^<[AT1R`GtDmqASuR'FEp#,/het50JG170JG170JG17AM#Sj$<(VVG>E0hDF85_F*(u6
F$25b;eU)n7r3*QF_kK,6YpmdFCfK64Y[:BBQ&)]EbT0"FA?CVF_kJt4Y[:BBQ&)_@<--YAR]du
@:_SU$<(VVG>N*aDImouEd:Dk@WcKqAN_aT;eU)n7q$4BG\L`14Y[:3AS#gZCO&Z`D.QU869R%U
0JG170JG%4/het50JG130eP.60JG17$<(VVG>2dfCO&uiGs*kh9keEZGunF";fm;$AN_gV9keEZ
GunF"8T&W]DKBN6Gs*u:0K1[E2)@'H2).!E0Jkb#/MJmd9keEZGunF"7U]h=F$25b9keEZGunF"
:gnBdBk(sj7q$4BG^2G,$<(VVG=-:dF*(u0CghF"Df0VZ0a^imDg+QeDKBo2Ci!O%Bl@m1<,uDX
Bln'-DII?E0FC`lDg+QeDKBo2Ci!O%Bl@m19lFQREc+#p$<(VVG=-:dF*(u0CghF"Df0VjH$!_6
@ps1:0FC`lDg+QeDKBo2Ci!O%Bl@m16>q!aA79M(4YR4ABQ&)^Df0W<ASc0kFD5Z2:18!NF$25b
;eU)n6Z6j`FCf9)@<?4%DF%`@Eb0E.@<?4%DK@rp$<(MPARfgLDf0W<ASc0kFD5Z2F$25b6Z6j`
FCf9)@<?4%DFn_fASuR'FEp#,/het50JG170JG170JG17AM#Sj$<h@YBjkL=Df0W<ASc0kFD5Z2
F&-[iGs*hg;eU)n6$%-ZEbTT3F$22a;eU)n6$%-ZEbTT3:18!NF$22a6Z6j`FCf9)@<?4%DG4b^
APu#b4YSKG0JG170J"n12)$^<0JG%3/i>=:0JG0f6Z6j`FCf9)@<?4%DGFVWAPu#b4YSKG0JG17
0J"n12)$^<0JG%3/i>=:0JG0f6Z6j`FCf9)@<?4%DFn\RB4Xt269R"T2)$^<0JG%3/i>=:0JG13
0J54:0JG17$:A`LF*(u0CghF"Df.m[F`(_uEd:PQ69R"T0JG170JG%3/i>=:0JG130eP.60JG17
$:/`TATDL+D+nY]APu#b4Y\QC0JG170J"n12)$^<0JG%3/het50JG0f6$%-ZEbTT3:18!N;Fa&:
0eP.60JG17/2/\60JG170J"n10JG170JEi4BQ&)bEbT&I0FC<jBk0SLDfTAeH#n(=D*9T\;eU)n
6Y1(FF*),)Cdi>d@<?F.4YR4ABQ&)^ASbq!FD50"7<*HYFDl2!Bk(q"4YR4ABQ&)b@;K@^FD55R
EHP]3DfRup$<(VVG=?"XBlJ0.@m)OR;eU)n7:U.JE-,f(<,#iXF$22a;eU)n9kA?ZA8,Ii4YR4A
BQ&)hATDKqBjkmYBk(q"4YR4ABQ&)^ASbq!FD50":iC/]F$22a;eU)n7q$4B@ruEp:iC/]F$22a
;eU)n7:U.JE-,f(:iC/]F$22a;eU)n7<*HaDJsbo@<--pEcXAt$<(VVG>iErF*),+APHTRCLqO-
4YR4ABQ&)uASu4(BK\'W7<*HYFDl26@;JGSBk1+369R%U0JG170JG%4/het50JG130eP.60JG17
$:SH@BlJ0.@n1QRA5Yoa4Y\QC0JG170J"q20JG170JG%3/het50JG0f7q$4B@ruEp7ri<S;Fa&:
0J5%50JG17/28b20JG170J"q20JG170JEi)DfTQ<Df/'cBk1+369R"T0JG170JG%4/het50JG13
0J5%50JG17$<(VVG=YV"BjkXp@;S.]$:n&_BjkXp@;T"cATL.HF)Pl;FCe?]@rsjf$:n&_BjkXp
@;SnR@rtCUAop0i/het50JG170JG170JG17ALfGg$:n&_BjkXp@;SnR@rt[gE'5m-0JG170JG17
0JG170JG1l.kiXa85_ii@:sUhD,OqTFB<0eFD*fk/het50JG170JG170JG17ALfGg$:n&_BjkXp
@;SnR@rt7QBkM+$4YSKB0JG170JG170JG170JI&g0JEi);FG5-B6%Et:i^JnATDm<=?SDH85_ii
@:sUhD,>7kE+O'3H!*9a$:n&_BjkXp@;SMTBk2$oDImlP0a^HL6tp(BEa`f_AS5^qDG4JJAScEN
0a^HL6tp(BEa`fYF_ti1Df]W7GscCVF)sK($<(AVARn_NFED57B6-gVD.Pj;;dji\A5d&]FD5W*
F$sS\@rc:&FD5Z24UOnlDII0h9OVCACh7-NBleAZ0FCKl@psInDf/<YD.Pk1Cj"^IT62_Y@<>p#
<,-R7\Z]Ea:186YDf0!"+AcKeCFgT&F`_>>C3=?8/0I\e$<(kcDIc1JAn>IoF$22a6#C(FASuTg
Dfor.4UP,$Dg+`P6pYX5@<loW0a^imDg+KbBl.:#Bl@lP0a^9dCi=>mFEq\64Y[:5Df0Yq@ps1b
8T&'MGWdeh;Is9Q<,$2\4YR4BBl.ENCi=MuBldutCh5a`$<1_VAO^KSG=c[_AU$?n$<1_VAO^KS
G>33rFD5]1Bk;<J0eP.60JG170JG170JG170P)ag0FCcnD.Q1QDg,,oB5UXi@<-I4E'5l^<,$2\
7Vm!e9Q+ig6$,7D/het50JG170JG170JG17ALfGg$<1_VAO^KSG>)pnE)^a=0J5%50JG170JG17
0JG170P)ag0FC`gDfB8eH#R=X0eb9g;e'`bAPI)cDKJj'E+M0i$<(GQE+MpY@:X;!FAcOhAN_jW
;e'`bAPI)bBl@le@<?'D1^[/kDfB8WDe!p2ATC[WFCdTk$<(GQE+MLW@s)j(E_p[qBln'-DETR+
$<(GQE+MLW@s)j(E_p[qBln'-DG=h_4YR4A@rH<t7W2dZF(KAgDf]W7Bl@l`@<apn0JG17$<(GQ
E+MpYG%G]8:/a;0$<(GQE+MpYG%G]8AOTZ`0FC`gDfB8c5t,[$De*F"<,#iX:h=ZFATg3j$<(GQ
E+MFK@mt9FDe*F"<,#iX:h=ZFATg3j$<(GQE+MmhATE&bDI[TqATCaa@r$-K0FC`gDfB8TDf'>_
:dJW&Eb0<54Y\WC0J5%30a^ihDfB8TDf'>fDfTqpF_s8u0JbBi;e'`bAQ*/XA5m8[AO13E9Q+EL
FD5Z24YR4A@rH<t;dji\9Q+Q,0FC`gDfB8dATDKnCf#%jFA?7]AN^B!@rH<t6"=D9E-+uhD/XN-
6Z6j[ARfgrDf.]l$<(GQE+MpYD/XN-6Z6j[ARfgrDf/-C6"FMHATMoU$<(GQE+MpYD/XN-6Z6j[
ARfgrDf/BiEcaH$0JbBi;e'`bAPcfUCLq$>0FC`gDfB8a@<--LH>.5=FD*fk/het50JG170JG17
0JG17ALfGg$<(GQE+MjSEbdsWFD5i>A7[nX/het50JG170JG170JG17ALfGg$<(GQE+M=XFDjQY
FCes(;epYJBg"-W;e'`bAQ*Ai7VPV+D.Pk/CO&B`$<(GQE+Ms`Gu6t#6Vp-dBk;1(4YR4A@rH<t
;epYU7q$LNG@>b[0eb46/hnt5$<(GQE+Ms`Gu7.06"FMHATMoU0eP461G1Kk;e'`bAQ*Ai;,1\E
D..L$4YelP/i#:A/i#:A/hdW2@rH<t;epYU:gnEdE+j9#F(IKA;e'`bAQ*Ai;,^Cb6p1lU@rH<t
;epYU<HD_;@q0(kF&6dhDKJ#q$<(GQE+Ms`Gu7LO@s)g+FEp#EDf0+n;e'`bAOAmcEa`HnBl7Q]
@<?'D;e]cREb/Zq$<(GQE+MC*<,uDWCJmGoDJXS]0a^ihDfB8T78n#6G>)^fBlm'`DET^.$<(GQ
E+MC*;f$#h9PJ?XFA61g4ZP2';e'`bAOAmcASbq!@rH<t9lFQRCcs@)$<(GQE+MC*6#:7JDJ`s&
FB!O)AN_^S;e'`bAOAmfARoFb6#:7JDJ`s&F?M;b;e'`bAOAmRDfTAiEa`oUDII!jARmqY$<(GQ
E+MC*882OEEc,<-AOUKF@VfUd4YR4A@rH<t6UaOaD.QO^F(o`1Df/H=4Y\QH2_[0N2D[9G2)$pD
3&bD!0JEi4@rH<t6UaOaD.QO^F(o`1Df.sS@m)P!2)d3J3ArZP0JtOB1,q4(.kiXa;e'`bAOLQI
G>r-iEa`KA0FC`gDfB8UEaa/ZEc6#?BOPUqF$22a;e'`bAOLQIG=,eZA8,piCd_uXARfgrDf0VZ
0FC`gDfB8]@:Eea7Sd'+4Y[:B@rH<t6ul^[=(l/_6tp^PDf0H(@ru9m4Y[:B@rH<t7VQFMA5[>f
@<?4%DET[+0JG170JG170JG170JG1l.kiXa;e'`bAOCBSEb&*oF*(u14Y[:B;c@+JAQ*e]E,]B!
4Y[:B;c@+JAOL6RE,8s.6Z6m`A5dbpFCf;P1($rY;dji\6tp^]CghTY:KBV=/het50JG170JG17
0JG17ALfGh$<'l%@<Q3MBle60@<k4ODKKH19OW$+/M\q93B/uQ1bpa>1Gq!L3&"no0JNo5;c@+J
AOL6RE,8s.6Y1.WATCI_DETa-3A`QH3&EEK3&33G1G^dt.ki[b;c?V'G%FTcDg,#o@;]Xu:NBoY
FE9T"$<'l%@<Q3\BQ&)nASbpfFCeuY@VTIaFAQCfBK\$V;c?V'G%FTcDg+ooDf/?k@VKq*4Y[:B
;c@+JAPd2ODImoa@:r8JD/")bAU-Eo/het50JG170JG170JG17ALfGh$<'l%@<Q3\BQ&)^Df0W<
ASc0kFD5Z2F$22a;c?V'G%FTcDg+QeDKBo2Ci!O%Bl@la@;TRs4YR4A;c@+JAQ*8\G=6"RE)UOt
:L\'M@rucT0FC`W;dji\;eU)n6tKqK;epYMD..'gF$22a;c?V'G%FTcDg,-%@<,+OD.RcO0FC`W
;dji\;eU)n>%MScFD*fk$<'l%@<Q3\BQ&)hATDKqBjkmB0FCctDJ<`sFE9c[F*(?!EcaHBBkM+$
+@1'YASuR'Df,nYCgh3mFE:B!EcaH3@<>poDeC1fF_tT!EXGNZDf0VpDfTq_6Xb(FCi<r/:3CD_
ATA,DF*(u6DeWa';f?\u4\g-:@V'R&FD,6'+AQ?^AI:eCD.Rg1;f?\u4\g-:@V'R&FD,6'+AQ?^
AI;@EFCf9)Blmp-;f?\u4]$0;E+O&4:18!N$;P#HARn_]@<-EfDfTq_:i^JnATAng@;TQ_6?6dQ
BQRg,FAm9iEcY/tEcaHFBleE*C`lG\B5VF*F_#%j:1[jSATMrlFCB32;f?\u4[a"*FCB&sAI:hD
F^f/u;flGgF&R!tF?N$'AmoguF<FA"A7]cg<ag#_@:F%a;flGgF&R!tF?N$'AmoguF<FA"A7]cg
6tKqK;epYWDfTq_:i^JnATAng@;TQ_9kABeBk;<`DfTq_<bZVt@;I&\@:sIlFEM,*$:A6<A9VU$
Cf>7mF?N!"FCB!(B-9rlD.7's$:A`LF*(u0CghF"Df0VpDfTq_:i^JnATAng@;TQ_6$%-ZEbTT3
F&R!tF?NBAD.7's+EV:.DBM\_D.O&KATVL%E`6XiG@bf9;f?\u4]$0;E+O&4:18!N$@-3!Ci=N=
FDl&.?Xn5!Eb0-1?ZU".F(KGK2H+C:;dj9HEbSH`FED57B6.*bEcYr5DETd.0FCKlDJ*[*F_#&H
/MSk40K:gI0JG170JG170JI&g0JWu/@<?4*F_#&H1bLUA2D?p@2)R6K2)R6K2J"Bm0a^3_FD5i>
A7[nZ/i5@B0JG170JG170JG17ALfGj$;,GWBjkmI@<?'D1+kCA0JG::2`39C0JG170P)ag2@<Dt
D.QmhDIks_2D-[;0JG170JG170JG170P)ag0FC0UCh7Kp@<+Ld$:/fVDa[N'4YR42AScHs<'</m
0f_$M2D[$C3A<0E1H.1&.ki[b6$79f6tL1V@8oBE$:JTLE,8s.6Z6m`A5dbpFCf;P1($E`F)Yr(
Gsc.\FCfJdDf.]m/i,ID1,1^E1GpsK0ebRAALfGi$:JTLE,8s.6Y1.WATCIQF?MB31c.0J1H@HT
0ekOD2)R7&.ki[b6tp^]CghTcEc5](@ruF'DETc_6tp^]CghTY:KBV</ib[D0et[E3A`NG3&E?H
ALfGh$:JTLE,8s.7VldXE+NQ\ATDlU0FC3^F)Yr(Gt)UaE,]B!88iN_H9Eqh6ZmEiASuTdEb/`l
F)u&6DET]]:i^,WATMp,Df/!_De!HD1+kC@0f:dF0JG170JG170P)ag2@<3%FCB9*Df.]m$:/-4
EcPT1Bl@lP0FCWsDfB9.+AHcrBl@lP0FCKfB4uB0<,$2\4Y[:AAS,sk@ruF'DET]]6t(1K7W!6G
FE0Mj@3?k*+=1PL+=1/56:2)ZBl.END0/]uE]k^?3[IK],uYp4E!fK/6tKjtD0.os$:/KM6$c";
F?MDe9OW$:Df/$]F?M?5$:SH@BlJ0.@n^<Q9Q+f<D0.os$:eN@@:OCn@n^<Q9Q+f<D0.os$<(MP
ARfgnA5?ZLARfgF6=jeDDGO_VARffh:L\'M@rt:14YeQC2CpNh6Z6gYDf/<YD.Pk/E+rfj$:A6D
@;Kjp:3CD_ATBpZ@3ATbEXG0BFCB!(B23Sd@V'RC2E)aZBlXPJ@<>poDeDgfD.7's4\/Hn2)$mG
$:A6D@;Kjp:3CD_ATBq)6m+3=2E!EP$:A6D@;Kjp:3CD_ATBq45u/UX2)dNN1C?KXFCB!(B23Sd
@V'RC6:;qJ0ea_+2E*Au6Xb(FCi<r]F_tT!E]lrb:`qYR1cI5u6Xb(FCi<r]F_tT!E]l`h:`qJM
0FCd)E+M129mB\G7;cX3@VTIaF?NQ6Ch7*uARnSGC1Ums$<(MPARfgnA5?ZLARfgUDe!QoA3DXS
88i?V:L\'M@rsk&@<-I'$:o)PAPd2ODImo`De!QoA3DUR88i?V:i'QXATU=SF*(i.@q@e[/i#=@
2)6sD2DR$G3&rrTAM#Sn$:o)PAPd2ODImo`@<?4*F_#&H/M\q41GLXF2)mTM2)d9H1c],!0JWu+
Df'&^Cgh3mFA-UjB5)I1A7[n^/ho(@3&N]N2Dm9I2Dm?MALfGg$:\rMCi=MgDf'&^Cgh3mF?M>c
;eU)n88iN_H>d[a0a^HiEbTi<DGtY&Ch5ab$<(VVG=ZXmBmO]87r3*f4YR4ABQ&)cDfTQ<Df.pN
Eb&m%@;JbYBl8$64Y[:7DfTQ<Df.jWFD5i>A7[nY/hf"=0ekFC1,h!C0eb@?ALfGh$:o)UBmO]8
<+U;rF`M%V9kAEXDfQsfEaa'$E\;<KB*qRNDg+TXH#.2-BQQBk$:J<JCh[NqFAlt#;Fa&:0J5+7
0JG17/2/\80JG170J"n13&!$?0JEi4BQ&)kCgh3mFE9T"$<(VVG>N*aDImo[EbT'*4YR4ABQ&)k
Cgh3mF?t._F$22a;eU)n:i'QXATU[UD.RcO0a^imDg,#o@;]Xu:hX9YATL!h$<(VVG>N*aDImog
F`M)&@qB^E0a^imDg,#o@;]Xu;g!+m@:Nk<ART\'Eb0;T0FC`lDg,#o@;]Xu6$-s^F)Yf(Eb0;T
0a^imDg+oiDJsPiDf9N74YR4ABQ&)`@<-I'9lFrf;eTTMDg+Q_EarosF$22a;eU)n6$%-ZEc5Z&
F$22a;eU)n6Z6gQFE9T!$<(VVG>hplASc0sFCfMV0FC`lDg+oiDJsPlCgh3mFA?7]ATL!g$<(VV
G>N*aDImocEaia)F$22a;eU)n9lFrf:NBoYFE9T!$<(VVG>i'hARfgnA5?ZLARfgY@<?0G0FC`l
Dg,,kCh7*uARnSGC1Ums:NBoYF?M;b;eU)n:NBoYFAQOhBhiSWAPHTRCLqO-4YR4>Cgh3mFA61V
9PJ?XFA$1j4Y\QG0JbUA2Dm6G2`*9J2`>4t0JNo2Cgh3mFA61VDJ<]s@psInDf.]m/het50JG17
0JG170JG17ALfGg$;GGWDG=PPDJ<]s@psInDf.]m/het50JG170JG170JG17ALfGg$;FrLF&R1+
Ch5a`$;bPIDImob@;TRR7m]?n/het50JG130eP.60JG17/28b20JG170FC`lDg,-%@<-EP0a^im
Dg,-%@<,+OD.RcO0a^imDg,-%@<,1bDfB9.:18!NF$25b;eU)n;flGg6=G.NE_L%dFCfK64YR4A
FCB2WDes?48T&W]DKBN6Gs*lB1($s%@<,:V@;KL<0eP.60JG170JG170JG170P)ag0FCa#@<,+O
D.Q+HDKBN6Gs+/?3&*6L2)I6H0etaG0fLq#/MJpe;flGg9jq[.Bl.R+4Yn]L1,:[B2E!HO1cRHQ
1cJtr0JEi4FCB2a@:r8JD/")d@<cL'F_s9%/ibgD1,LgB2`N`T0f_0KALfGg$<(VVG=6@l@VfUS
FCB324YR4AFCB2b@;TRR7m]?n/het50JG130eP.60JG17/28b20JG170FC`lDg+T\AT1R`Gu%ma
ARfh'4Y[:BBQ&)_AS#gZCO&Kg@:s.m4YR4ABQ&)hATMp,ATCRaCjA/t$<(VVG=6"RE)UOt6$-1B
A7\5+<]r,D6tKqK;epYQ@:r8JD/")T3%csA3&*<I2_d<I2`EKK2J"Bm0FC3ZAT1R`Gth^[9PJ?X
FA61gBl/!04_\eG$<(VVG=6"RE)UOt:18!NF$25b;eU)n6tKqK;epYTEc5o.E_^%[ATL!h$:JH:
E)UOt:18!N6tL7WBlnV`2D-mI2`EQI0K;!K0KCjF2.\?n0a^<[AT1R`GtDmqASuR'FEp#,/het5
0JG170JG170JG17AM#Sj$<(VVG>E0hDF85_F*(u6F$25b;eU)n7r3*QF_kK,6YpmdFCfK64Y[:B
BQ&)]EbT0"FA?CVF_kJt4Y[:BBQ&)_@<--YAR]du@:_SU$<(VVG>N*aDImouEd:Dk@WcKqAN_aT
;eU)n7q$4BG\L`14Y[:3AS#gZCO&Z`D.QU869R%U0JG170JG%4/het50JG130eP.60JG17$<(VV
G>2dfCO&uiGs*kh9keEZGunF";fm;$AN_gV9keEZGunF"8T&W]DKBN6Gs*u:0K1[E2)@'H2).!E
0Jkb#/MJmd9keEZGunF"7U]h=F$25b9keEZGunF":gnBdBk(sj7q$4BG^2G,$<(VVG=-:dF*(u0
CghF"Df0VZ0a^imDg+QeDKBo2Ci!O%Bl@m1<,uDXBln'-DII?E0FC`lDg+QeDKBo2Ci!O%Bl@m1
9lFQREc+#p$<(VVG=-:dF*(u0CghF"Df0VjH$!_6@ps1:0FC`lDg+QeDKBo2Ci!O%Bl@m16>q!a
A79M(4YR4ABQ&)^Df0W<ASc0kFD5Z2:18!NF$25b;eU)n6Z6j`FCf9)@<?4%DF%`@Eb0E.@<?4%
DK@rp$<(MPARfgLDf0W<ASc0kFD5Z2F$25b6Z6j`FCf9)@<?4%DFn_fASuR'FEp#,/het50JG17
0JG170JG17AM#Sj$<h@YBjkL=Df0W<ASc0kFD5Z2F&-[iGs*hg;eU)n6$%-ZEbTT3F$22a;eU)n
6$%-ZEbTT3:18!NF$22a6Z6j`FCf9)@<?4%DG4b^APu#b4YSKG0JG170J"n12)$^<0JG%3/i>=:
0JG0f6Z6j`FCf9)@<?4%DGFVWAPu#b4YSKG0JG170J"n12)$^<0JG%3/i>=:0JG0f6Z6j`FCf9)
@<?4%DFn\RB4Xt269R"T2)$^<0JG%3/i>=:0JG130J54:0JG17$:A`LF*(u0CghF"Df.m[F`(_u
Ed:PQ69R"T0JG170JG%3/i>=:0JG130eP.60JG17$:/`TATDL+D+nY]APu#b4Y\QC0JG170J"n1
2)$^<0JG%3/het50JG0f6$%-ZEbTT3:18!N;Fa&:0eP.60JG17/2/\60JG170J"n10JG170JEi4
BQ&)bEbT&I0FC<jBk0SLDfTAeH#n(=D*9T\;eU)n6Y1(FF*),)Cdi>d@<?F.4YR4ABQ&)^ASbq!
FD50"7<*HYFDl2!Bk(q"4YR4ABQ&)b@;K@^FD55REHP]3DfRup$<(VVG=?"XBlJ0.@m)OR;eU)n
7:U.JE-,f(<,#iXF$22a;eU)n9kA?ZA8,Ii4YR4ABQ&)hATDKqBjkmYBk(q"4YR4ABQ&)^ASbq!
FD50":iC/]F$22a;eU)n7q$4B@ruEp:iC/]F$22a;eU)n7:U.JE-,f(:iC/]F$22a;eU)n7<*Ha
DJsbo@<--pEcXAt$<(VVG>iErF*),+APHTRCLqO-4YR4ABQ&)uASu4(BK\'W7<*HYFDl26@;JGS
Bk1+369R%U0JG170JG%4/het50JG130eP.60JG17$:SH@BlJ0.@n1QRA5Yoa4Y\QC0JG170J"q2
0JG170JG%3/het50JG0f7q$4B@ruEp7ri<S;Fa&:0J5%50JG17/28b20JG170J"q20JG170JEi)
DfTQ<Df/'cBk1+369R"T0JG170JG%4/het50JG130J5%50JG17$<(VVG=YV"BjkXp@;S.]$:n&_
BjkXp@;T"cATL.HF)Pl;FCe?]@rsjf$:n&_BjkXp@;SnR@rtCUAop0i/het50JG170JG170JG17
ALfGg$:n&_BjkXp@;SnR@rt[gE'5m-0JG170JG170JG170JG1l.kiXa85_ii@:sUhD,OqTFB<0e
FD*fk/het50JG170JG170JG17ALfGg$:n&_BjkXp@;SnR@rt7QBkM+$4YSKB0JG170JG170JG17
0JI&g0JEi);FG5-B6%Et:i^JnATDm<=?SDH85_ii@:sUhD,>7kE+O'3H!*9a$:n&_BjkXp@;SMT
Bk2$oDImlP0a^HL6tp(BEa`f_AS5^qDG4JJAScEN0a^HL6tp(BEa`fYF_ti1Df]W7GscCVF)sK(
$<(AVARn_NFED57B6-gVD.Pj;;dji\A5d&]FD5W*F$sS\@rc:&FD5Z24UOnlDII0h9OVCACh7-N
BleAZ0FCKl@psInDf/<YD.Pk+Ch+YX@;0gsAp%o@+@0gc@4WO&=UJ)GF`(_YAnGUaFE9T!$:/N<
Bk;1(;f?erA3C8uBQ&)c<CB,hG@>c<4Y[:BBQ&)\DJ<rrFD5Z24Y[:2Des?4;fm;$AN_aT7W30d
;e'6PAP$cMAU$?n$;tGDCfG+cAN_^S<,$2\7Vm!e<bZVh@VfU=0FCcnD.Q1QDg+cjA7^!K1($up
D.Q1QDg+ouCijB1Ch[I$4Y\QC0JG170JG170JG170JI&g0JEi5Bl.ENCi=MrBkM<^FCB33F`9Jt
$<1_VAO^KSG>)pnE'\S/0J5%50JG170JG170JG170P)ag0FCcnD.Q1QDg+lnDfAZo4YSKB0JG17
0JG170JG170JI&g0JEi4@rH<t<-`Fo4Y\WE$<(GQE+Ma^F`);#H#R=X2%!8lDfB8cART+fF`^Mi
FCdTl$<(GQE+Ma^FD5Z2;IOZY4Z!LE@rH<t7W2dZF(KAi@<?'D1C@&jDfB8WDe!p2ATCUcF(o`1
Df.]i0a^ihDfB8WDe!p2ATCUcF(o`1Df/9`DETZ\;e'`bAO^TJF`V,7:iCDhFD5Z29jr902D?g=
0FC`gDfB8cAThX*F&#Xs0FC`gDfB8cAThX*F(IdA4YR4A@rH<t;F*`h@rGmhE`?a_CJ\S_;It#7
0FC`gDfB8UARe/H@rGmhE`?a_CJ\S_;It#70FC`gDfB8bF_,T=7;cURA7]d\Bk(q"4YR4A@rH<t
6Z6gY8Ph]`A9)7&F$263/hen3/hm]3@rH<t6Z6gY:iCAr:3CD:1b^^>$<(GQE+MsZDIc^\D.Q"N
A5$oO@<?4%DETZ\;e'`bAQ*#\AP@#T4YR4A@rH<t;e9u`@;JbYEcb&bD.Pj;;e'`bAO0g9AT2`h
ASl@-AOCBRDIm="Bl@lP0FC`gDfB8cASl@-AOCBRDIm="Bl@l\:dJW&Eb0<54UP+tDfB8cASl@-
AOCBRDIm="Bl@lcDfTq_1b^^>$<(GQE+MjSEbf5s4YR4A@rH<t:gnB[6$d6^F`_:[0J5%50JG17
0JG170JG170P)ag0FC`gDfB8a@<--LCijB5F_#&H0J5%50JG170JG170JG170P)ag0FC`gDfB8R
F`_OiATVKnFAlt#7VP">$<(GQE+Ms`Gt)LC@;TR=;epYJBaRdKDfB8dCO&cF84-3@Ch[HuF?M;b
;e'`bAQ*Ai;+G&:ATqR.4Y\WC0J5(40a^ihDfB8dCO&cK:dJW&Eb0<54Y\QE/i,+:$<(GQE+Ms`
Gu7=JFDYH-CHXF12(gXA2(gXA2(gQi;e'`bAQ*Ai;,C\BF)Yf5@<6!C$<(GQE+Ms`Gu7L=8OP]K
;e'`bAQ*Ai;,q[K6"=D9F)t/rBl8#U0FC`gDfB8dCO&cUARfk'BlnV`:2b#]$<(GQE+MC*<,uDW
CM@[!;IOZY4]?'*ATD?jC^O*NDfB8T79";9@r"t.:Msuo4Y[:B@rH<t6UapiATpg^D/")dBl6'g
0FC`gDfB8T78n#6G>)^fBlm'XGWe&@$<(GQE+MC*<+TlWF(9--API)RASaL]0a^ihDfB8T76ta(
B5VQtDKJj'E+M0d$<(GQE+MC*=(PoTAO1-HB5VQtDKJ#q$<(GQE+MC*6Z7!U=)q_g7;cOCCh7-?
0a^ihDfB8T77_-%ATDZsFCdmY@:F%aA3DUR;e'`bAOAmWDf'&^Df]W7Bl@le5s6qT2)d3J3ArZP
0JtOB1,q4(.kiXa;e'`bAOAmWDf'&^Df]W7Bl@lWARdkX/i>RA2`WcP2_[*C2DR6NALfGg$<(GQ
E+MFX@<Y[^CiWrp4YR4A@rH<t6ul^[6ZR*dF(eurEcXAt$<(GQE+MFX@<Y(IEb&m%@;J>GEb/a&
Bl@m14YR4A@rH<t9OVCACdq3$F$25b;e'`bAOLQIG?8HhDFA2[@rH7&ARfgnA3DXS;e'`bAO^BF
Ch-F^FCB9*Df.]l/het50JG170JG170JG17ALfGg$<(GQE+MCTDfTAeH#n(=D*9T\;c?V'G%FTr
@;p0sA3DXS;c?V'G%F'UF)Yr(GscLgEb&*oF*(u14Yd@C;c@+JAOL6RE,8s.7Sd&J3A*!>0JG17
0JG170JG170P)ag0a^iX;dji\6tp^]CghTVASuU$E_Kn`4Y8EA2*!WU0f1X>0f([D3B/^(.ki[b
;c?V'G%F'UF)Yr(Gsc.\FCfJdDf.]n/ibaF0K:mF2)m?G2)@$DALfGh$<'l%@<Q3\BQ&)kCgh3m
FAHpdBlnDZ0a^iX;dji\;eU)n;e9cV@ru9m:L\'M@rtOUFD*fk$<'l%@<Q3\BQ&)hDf9MhEaia)
F$25b;c?V'G%FKd@;]Xu9jq[.Bl.R+94`B31+k770JG170JG170JG170P)ag0a^iX;dji\;eU)n
6Z6j`FCf9)@<?4%DK@rp$<'l%@<Q3\BQ&)^Df0W<ASc0kFD5Z2:18!NF$22a;c?V'G%FTcDg+T\
AT1R`Gu%maARfh'4YR4A;c@+JAQ*8\G=6"RE)UOt8SqmKATL!g$<'l%@<Q3\BQ&)nFCB2b@;TRs
4YR4A;c@+JAQ*8\G?SQqBln#O0FC`W;dji\;eU)n9kA?ZA8,Ii4YR4BDf09%BQS;^ATMrlDfTq_
;JBcWF<Ekj@qBP!Bl@kr:i'QXATVulDfTq_6Xb(FCi<r/:3CD_ATA,PDf9N7;f?\u4[WY"@;Kjp
+AR&r@V'Qe6$%-ZEc5Z&F&R!tF?NBAD.7's+EV:.DBM\_D.O&ADf''-F&R!tF?NBAD.7's+EV:.
DBM\_D.O&Q@<?'sCh\!&F&R!tF?NH@DfB9.+AQ?^AI;1@D.R6VFCB32;f?\u4]$0;E+O&4:18!N
$:8cIB4uBuF*(?&@<-EfDfTq_<bZVt@;I&\@:sIlFEM,*$;P/@Eb0<6;flGgF&R!tF?N$+F*(i.
@q?!8DfoN*AQ*\ZEcY/tEcaH4AS,@nCigdqEb&a%$<CSUBjkIeAQ*\ZEcY/tEcaH4AS,@nCigdq
Eb&a%$:JH:E)UOt;f?\u4]$0;E+O&4:18!N$;G)QF(o3+;f?\u4]Z9<F^])/9jq[PBlnK.AI:e5
Ch.a$Ci!$gEcaH3@<>poDeC1fF_tT!EXG0PDKBo2Ci!O%Bl@m1;f?\u4]$0;E+O&4:18!N$:/`T
ATDL+D0&WoEcaH>F_tT!EZfI;ASrVc@;TQ_9kAEXDfSciDg,c5F&R!tF?NH@DfB9.+AQ?^AI8 ~>
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
zz=:zz,'frcal ljust loadstars location_home location_uluru location_yellows'
zz=:zz,'tone meanobliquityT0 meanobliquityT1 meanobliquityjd0 meansid0 mean'
zz=:zz,'sidjd0 nav_today navdaylist nnth0 npth0 nth0 nutation_longitude_dPs'
zz=:zz,'i parse_iau_named_stars parsebomcsv parsecsv parsetd read rfd rises'
zz=:zz,'et riseset_calc rjust round sin sind smoutput sunriseset1 tabit tlf'
zz=:zz,' today_calc utf8 zetzthT0''),<<;._1 '' risesetUtils J2000ymfd afterla'
zz=:zz,'ststr afterstr allwhitetrim antimode atan2b beforestr charsub dev d'
zz=:zz,'sfrhms dstat fdfrhms fuserows kurtosis location_far_north location_'
zz=:zz,'far_south mean meansidymd0 median midpt mode2 nutation_obliquity_ec'
zz=:zz,'liptic_dEpsDeg ofreq portchars q1 q3 rjd skewness ssdev stddev tabi'
zz=:zz,'t tlf var winlcchars yyyymmfd''                                     '
zz=:1169{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&u+>GQ(3$9q2+>bi1EbTT+F(KGg67sa.Bldj,ATT&9/M/)TDf'H9FCcS8Bldi:+EVX4
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
@X2=&De*:%.3N&0A7]9\$4R>PDe!TlF)rHOEbTT+F(KG@%13OO-oiG30ek+"0fC.L67sBoBkM*%
E,oZ1F<GOCARfFqBl@m0Bldj,ATUpoBl%ic67sa.Bldj,ATT&:/M/)TDf'H9FCcS8Bldi:+EVX4
DKBN6+CT.u+EM+9+EV=7ATJu4AfsZ2<?Q0fD.R6#F*(i2F"Rn/:-pQB$;No?+Eh=:@UX@mD)reR
DKKH1Amo1\+EqaEA12LJ3XlEk67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'Ci<`mF*(i2F!*%W
Ci<`mF!,L;F(KE(F<GXH@<*K$@<>oe$;No?+<Y]=F(KE(F<D\K/Kf(JF(HmFFE1f-F(o_I+EM+9
+EV=7ATJu4Afu/:@<-Du$;No?%15is/g+YEART[lA3(hg0JYG$@<+%^%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGjn@<6K4-ZWpBATMF)-OgC                                   ~>
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
0ea_)+>P&u+>Yi50QLlKATMF)?uft&ATMF)?m'0)+CQC&Des6$@ruF'DBNk0+C\c#Bk&8oF*)G@
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
FCANu?Ys=]%13OO%166VFWb1&DBNJ(F)Yr(Gp%3BAKYhuEbf3(GA\ODAS,LoASu!hA0>;iDfp.E
GA2/4+EV:.+A,Et+D#e:Eb0<5Bl@m13XlE*$@[GQINWt[/nuMW%16oi@:UK.B4YslEa`c;C2[W1
%17#a+?MV3Ap&3:+E_d?Ci^s5$;No?+Co2-E,8s.+DkP-CLh@-DBNJ.@s)X"DKKq/$8`l9Ble59
4!8r(5U\H9A8Z34-8%J)-Z4'K@<?4%DI4bQ-Z3@6@:(Ak$@[GQINT(,%15g<DL!@9G[YH.Ch7Z1
F(fK9Bl7Q+BQ&);FDi:EF(HJ;@<-(#F`S[5EbTT+F(KH$+EqaEA9/l%Eb-A-DBO%7AKXT@6m,lL
F`_\4+EV19F<GXIBlmo/?uft&ATMF)?nMlq=`8F*@ps6tA8-+(CghT3@;Ka&FD,5.FCfN8+Cei$
ATJu<Bln#2FD,5.8l%htAU&07ATMp,Df0VW%13OOIXZ`p+F>4`C*7p6$8Wf;Ec<-KEbTT+F(KG@
+<Ve%67sC&ATMr9@psFiF!,17+EM[>FCbmg%14m6A8-+(+=D2DF(KE(F=/1R:-pQUA8-+(CghT3
FCfN8+EM[>FCbmg%14p7EccCG-ZWpBATMF)-QjNS:-pQUEcl7B@;Ka&FCfN8F!,17+EM[>FCbmg
IXZ`p%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13OO%13                                                             ~>
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
?Z^4(BkM+$+DG_8E\hYWCi<`mF*(i2F!,:;@psInDf/oo@<,^mDfTr5+Dbt+@<?4%DI7!aEaNm+
F`_:>Ci<flFD5Z2?YF@pAKYf-@psInDf/p)Cisc@+Dbt+@<?4%DI7[#Ci"$6F*)><AKYi$@;^!m
Ch[m3BlnW"0Hb4D@;^!mCh[m3BlnW"0d(=E@;^!mCh[m3BlnW8A2#-CARTItBk/n?D.R-nF(o0"
A2#-CARTItBk2L+A2#-D@<Q""De*:%+DtV2A79b"BleA=DJjQ00Hb7PFD*?NDKKPG+Du=D@<?4%
DI73uDJ*[*F_#&jA5I>]+Du=D@<?4%DI7<kCh[m3BlnW-ARfOjE-,f(?XuTEF$sSP+E1b0F(J]m
@<Gpp@;TRd?ZU<tEcW@B@<-F#@W-*nF*8[HBldj,ATT&8Bldj,ATV9h@;KErEbTT+F(KH#@ps1`
?VXBr78k=LBldj,ATV9m@<6*m@<?('Eblk=C1JH.F`)56F(KE(F>4n[A0>u4A79Rk+EVO4@<l3i
@;KErFDk\uH#@OCH$O[\D/Elq+F7U@H?<h"0IJ;#-p0UR/mg=U-Qll@Bl%<eEbTT+F(KG9@WcC$
A7'@kF(KE(FC/Qs@j#f+F(KE(FC/Hu@;[i-F)>i2AKZ#-F(KE(FC/U#E+NoqCL;."Deio,EbTT+
F(KH#D.R:$F'j!*Deio,EbTT+F(KH#DII^0FCB32?Y*_i?ZU(&CLnW/Bldj,ATV9s@<Q^6@<-Er
F(&ZhEbSm%D/X3$+ED1;ATMF)?ZKk%ATMF)?ZU(&CLnW/Bldj,ATV:$@;]soEaNm)Deio3.4cl0
4?G0&0d%hdEbTT+F(KG9EbTT+F(KGnFD5Q4-RgSp4=iTBEbTT+F(KG@.4cl04?G0&0d%hd6?6dQ
BQRT[FCB32?VP*PBk1pdDI5\GD..<j@p^uID..H?2d^E4+AQ?gBkLjrBl@lr;flGgF'j!(H#.29
F<F=eG%kStFD5Z2?W2&TEcYT0G]Y'):K(5"EbTT+F(KG9<)5nX?V4a:CNE$T@r$-mD.FbtFCB&B
?Y+IlASb^qG]Y';@:FLuDf08tDI7:"Ec#6$?ZU<tEcYStF*8[?@<Gpp@;TRd?ZU<tEcYSC0JYCj
FEhmMCi<flFD5Z2?Y*_i+DtV/@:*PVCij)mFC/lq+DtV/@:*tlCjBo:D/!Ep?Y+J$Eb0<5Bl@m1
?Y44s?Y!_aFCANu?Ys<rDKU&0FD5Z2?YOCbCi=3(BlnK.ARAtEF(nuuA0>c4FCB9*Df/orDI7<k
Ch[m3BlnW-De<?f@r,juFD55lA4:HY6tL"<D.Fc.Eb]W/F(KE(F<GU<F(KE(FB*BnE_BthF!,L;
F(KE(FC/p(FCep"Dei]oE-Z>1+E_LCEck`!F`MM6DKK6,CO'u4F<Gj?Ci"$6F*)><ARAqiEcP`/
FC0*)H#mP=-RgSp4>J$<1F+_01,CU@1,CO?0JG=C2E!QL2BXb/1,CU?1,pmC2*!WP0JPRI1a"P-
1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,(=;3B/lP1c[6J2]sk01,CU?1GLL<2`EKP2`*9G3$9t1
1,CU?1,pmD1,(I<3A<EK3?U(21,CU?1,pmC2_d*H3&ENJ3$9t11,CU@0JP1;2*!NR1c.*M2BXb/
1,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?1,(=;1GppA3A`NK2'=Y.1,CU?1,pmC2_[!E1G^jE2BXb/
1,CU?0KCaB3&iZQ3&NHO1*A>+1,CU?1,pmB2Dm<K2E!BK1a"P-1,CU?1,pmC2`*6D2D[6L1a"P-
1,CU?0KCaC0eb@>2)[-D2BXb/1,CU?1,LU@1,:RC1H@3G2'=Y.1,CU?1,(=<1bgdD2)7-O2'=Y.
1,CU?0f^jE2`WlU1,:gL3?U(21,CU?0f^jF1H%!D1H70F3$9t11,CU?1,:I<2`3QN2DmHN2]sk0
1,CU?1,:I=1H$sB3&**C2BXb/1,CU@0K:[B1,LjI1,(OE1E\G,1,CU@0K:[B0Jk[B1,:R=0d&5*
1,CU?0K:[B0JYID2E<HN1E\G,1,CU@1,CO>2`3?G1GU[D1*A>+1,CU?1,:I?2_d9G0f1X?3$9t1
1,CU?0fCX@2DI!C3&ETO0d&5*1,CU?0fL^A1-%$K1H@<N3?U(21,CU@1,CO>2DdBQ1GLgC+>PW+
1GCU?2(gjB2E<KM0JG@E+>PW+1GCU>0J51?2Dm9N2`NNL+>PW+1GCX>0eP::2)$aB1,(XH+>PW+
1GCU=3A*3M2)R<H2Dd?O+>PW+1GCU=3A*3M0f:pJ1,(^D+>PW+1GCU?2_I*H3&*3H3B8uT+>PW+
1GCU?1+kID3A`QM3&NQL+>PW+1GCU?2(gjB3&**F2_d*21,(I>0JbIE/i5@E2E!QQ3A`K61,(I>
0JbID/i5LG2_d'J2`)X40JYF<1GUd>1c@'G1GLR?1GL"-0JYF<1GUg?1bgmB2_mBK2`)X40JYF<
1bpj>2)[9H3&NHF2`2^50JYF<1bpj>2)R*J1,C[G3A_j60JYF<1GUsC1c.$G3A`HK2)QL30JYF<
1GUsC1bgaB3&<EH2_cF10JYF<1GUsC1c$gE1H%6P2`;d60JYF<1GLa>1c-sF0ebLD0K1+00JYF<
1GLd?1b^aF1,LmJ2DQC10JYF<1GLa>1c-m@2)R9K2`Dj70JYF<1GLR92*!HH1G^gD1H$@20JYF<
1GCgA2_d!@2E*QQ2)ZR40JYF<1GLR92D?g=0K;!M1c6C20JYF<1G^^;3&!$@2E!?O1c?I30JYF<
1b^g?2)R9P0eb:90f^@30JYF<1GLR92)I0K1c7!B1a"P-1,CU?0f^jF0K1jF1,:jD1a"P-1,CU?
0f^jF0ebO@1bgjD3?U(21,CU?0ek:=3Ar`N3AWBJ1E\G,1,CU?0f(F>1GUjJ3&!-D3$9t11,CU?
0JtI@2).'F2E!?H2BXb/1,CU@0K:[@3B&iN1,^jF1a"P-1,CU?1,U[A1,CdF0KCmI2BXb/1,CU?
1,ggB2)I'G1-%6J+>PW+1GCU?3%d!F2`!HJ3B8o=1,(I>0JbCC/i>@;0fCjJ1H7051,(I>0JbCC
/iGXK1c@-D1,1X/1,(I>0JkO@/i5CE1c$pD2E<T:1,(I>0JbI=/iPLB2E!9K2_d351,(I>0JbF?
/i5CF1H$pF1,L+/0JYF<1G^^;2`W]T3AWHF2`)X40JYF<1GL^=1c%!D0ebLG2)cX50JYF<1GLa>
1c@*D1,:UB2`Mp80JYF<1GU^<2`NTM2_d6J3&2U30JYF<1bpj>2)$^D2D?mC1a"P-1,CU?1,pmC
2*!WP0JPRI1a"P-1,CU@0K:[B1GLgH1H7-M1E\G,1,CU?1,(=;3B/lP1c[6J2]sk01,CU?1GLL<
2`EKP2`*9G3$9t11,CU?1,pmD1,(I<3A<EK3?U(21,CU?1,pmC2_d*H3&ENJ3$9t11,CU@0JP1;
2*!NR1c.*M2BXb/1,CU?0fCX@0JPO@3AE3H2'=Y.1,CU?1,(=;1GppA3A`NK2'=Y.1,CU?1,pmC
2_[!E1G^jE2BXb/1,CU@1,CO?2`!EI0K1mI+>PW+1GCU?3%d!F2)I0K2Dd6I+>PW+1GCU?3%d$H
1bg^C1H%-J+>PW+1GCX@1G1R>0fV!J1H.9L+>PW+1GCU?1bLX@1,1^D3AN?I+>PW+1GCU?1G1LA
2`NKI1H.<Q+>PW+1GCU>3A*3K3B8rP1,q9S+>PW+1GCU>3A*6H2DR$D3&<9K+>PW+1GCX?1G1L=
1-%<L2`N`V+>PW+1GCU?1+kC>2DHpG0ebCA+>PW+1GCX@1G1O@0JbF<1,1XF+>PW+1GCX>3%d'F
2)mEK2`W]T+>PW+1GCX>3%d$I2)R<N0f1aE+>PW+1GCX@1G1O@0f:aA2Dm<I+>PW+1GCU?1+kID
0fUjA1bpdF+>PW+1GCU>3%d-I3&WNG1Gq081,(I>0JbFB/i5=D0KCpL2)[H;1,(I>0JkO@/i5IC
3&i]K2_cF10JYF<1GUg?3&!6N0fC^>2)ud70JYF<1GLR91c@6L1H@BR0f:(/0JYF<1bpj>2)@*I
3B/oP1c6C20JYF<1GCgA2E<WP2_[-H2`Dj70JYF<1GCgA2E<KL3&NHF3AM^40JYF<1GUmA3AWWL
1Gq0Q2DlU40JYF<1GU^<2E*WQ1c76M2)?@10JYF<1GUg?3&!<H0K(jE1E\G,1,CU@1,CO?1-%9J
1b^U>1*A>+1,CU?1,pmD3&*BH3&<QM+>PW+1GCU?1bLXA0JG181bpmD+>PW+1GCU?3A*0E0JtdJ
0K(XG+>PW+1GCX@1G1OC3ANTL1c@<P+>PW+1GCX@1G1OC3ANKI1GCdJ+>PW+1GCX@1G1OB0JP@@
1bgj11,(I>0JkO@/i>UD3B8cK2)R-31,(I>0JkO@/i>UD2D?g?2)I361,(I>0JbI</i5@C1c@0L
3ANB51,(I>0JbI</i5@D0f:dC2E;m80JYF<1GLmB2)6sJ3&NNO2)?@10JYF<1GLR92*!TR3&ETT
2`2^50JYF<1GLR92*!TU3&<6F1H$@20JYF<1GLR92D?sD2)7'L2Du[50JYF<1bpj>2)$mA0JYRC
1G^./0JYF<1b^g?2DI-N1c%$I2)cX50JYF<1GLR92)I0K1c7!B1a"P-1,CU?0f^jF0K1jF1,:jD
1a"P-1,CU?1,(=;2)$jC2D[3H2]sk01,CU?0f(F>2E3KN0ekLA2'=Y.1,CU?0f1L?2E3WO1GUX@
1*A>+1,CU@0K:[A3&ETO2*!HN1E\G,1,CU@0K:[@3B&iN1,^jF1a"P-1,CU@0JP1;2`NfO0JbOF
1a"P-1,CU@0JP1;2`WfV1-%?Q1E\G,1,CU?1,pmB2E*EP0KD-M+>PW+1GCX@1G1R>0fV!K0ebFC
+>PW+1GCU=3A*3K3A`WM0JY@?+>PW+1GCX@1G1LA2E<ZN3&NWO+>PW+1GCU?0ePC>2)[?I2`EHL
+>PW+1GCU>1bLUC1H@HL0JbUD+>PW+1GCX@1G1O@1cR<K1,(F;+>PW+1GCU>1bLUC1H$sH0fCjH
+>PW+1GCU>2(g^E1GgjB3A<6I+>PW+1GCU?1G1IC1c[BK2).'M.4cl01*AS&1,(I>0JbCC/i>@>
0KD*L0Jb[21,(I>0JbCC/i5RI0f:sJ3AN?41,(I>0JbI>/i,IH1GpmB2_m?81,(I>0JbFC/i,LC
1b^gA2)@371,(I>0JbF=/i5IE0fUpC2`;d60JYF<1b^X:3B&ZQ1H@9M2E;m80JYF<1b^a=2Dd6K
3&NNI+>PW+1GCU?2_I*F0fCmJ0fM!N+>PW+1GCU>1+kCB1c.'L1bpsE+>PW+1GCX@0J51=2`NNG
0fLm21,(I>0JbID/i>UK1c79N2D@*51,(I>0JbID/i57<1H70I3B&Z81,(I>0JbI?/i5=A0f^pH
2)7$31,(I>0JbID/i57B2E*EK3B&Z81,(I>0JkO@/i>XG2E!HR1,(U/1,(I>0JkO@/i>XH2DI-G
3A<?61,(I>0JkO@/i>XF2D?mG3&!<71,(I>0JbI?/i5=A2)7'L0K1a9/1<V9+>P2t0JYF<1GCd@
2)I$C1,V!I1,U100JYF<1GUpB1H.!E3AN9K1G^./0JYF<1bpj>2)RBM1bgmG1bp1/0JYF<1bpj>
2)[9N3&W]O2`<*9-p07=1,CU?0et@<2`NfP1H7'H1b1RA/i#7;0JtgJ2E*WR2`E]O2_&Mo1*A;#
/1<V9+>Gi$1,(I>0JbIC/i>=B0f_*M2Dm951,(I>0JkIA/i5=D2DI*K1c[?71,(I>0JbI@/iPI?
2E!EN2)mQ<1,(I>0JbCC/i5OI1,q6P0JkR.1,(I>0JkO=/i5C>1,:^@0ebU11,(I>0JbI=/i5=<
2)-d@1c@*31,(I>0JkIA/i5IB0fLjH2E*E71,(I>0JbC=/iGUF1b^jG0JP=*1,(I>0JkI=/i57A
1cI*H3A_j60JYF<1GLjA1c70G0K:mC1,U100JYF<1GL^=2_[$C1GCL@3&)O20JYF<1GLU:2E*<D
0fLgA3Ahp70JYF<1GLU:2E*TP1,:U@2'=Y.1,CU?0eb4:0K1aA0fLgC2'=Y.1,CU?0eb4:0K(aG
2`NfQ1*A>+1,CU?1GLL=1,CjL3A<-H0d&5*1,CU@0JtI>2`<EJ0ebLE0d&5*1,CU@0JtI>0fM!M
1cI*B1E\G,1,CU?1,ggC0K:dI2)dEN1E\G,1,CU@0K(O?1-%6I2E*HQ1E\G,1,CU?1,ggB1cI0D
2`EZT2]sk01,CU@1,CO@0JPOD2D[9O1E\G,1,CU@1,CO?3ANKO0K(gC2'=Y.1,CU?1,1C<3ArTJ
1c@3I2]sk01,CU@0K(O?2D['H1,h*M1E\G,1,CU?0K(OB0JkI<1H70F3?U(21,CU@0JY7;0K:mJ
0K(pJ+>PW+1GCU>3%d$F2DHmF1b^[B+>PW+1GCU>2D-gD1,LaD2_mBN+>PW+1GCU>0eP@C0JG4?
0ek[G+>PW+1GCU>0eP@C3&EBG1,Cd11,(I>0JbI@/iGUE0K1aA1-%?;1,(I>0JbID/i>RD0JYUC
1b^a/1,(I>0JkO@/iGIA2`<NM1b^m31,(I>0JkI@/i5LG1Gq$F2Dd-21,(I>0JkI@/i5:A2E3NP
0JG:3/1<V7.4cl00I\P$4>838-p014/3GT                                        ~>
)
cocurrent 'base'  NB.{*JOD*}
puttstamps_ijod_=: (((1;'upgrade JOD')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<'putallts__MK__JODobj') NB.{*JOD*}
showpass puttstamps ".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
