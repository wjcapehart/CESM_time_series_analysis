
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin


       setfileoption("nc", "Format",           "NetCDF4" )
       setfileoption("nc", "FileStructure",   "Advanced" )
       setfileoption("nc", "CompressionLevel",         5 )


rcp =  "RCP85"


loc_string = (/ "Fort_Peck",  \
"Blackfeet",  \
"Cherokee_Nation",  \
"Cheyenne_River",  \
"Cheyenne_Arapaho",  \
"Rocky_Boys",  \
"Flathead",  \
"Yakama",  \
"Umatilla",  \
"Crow_Creek",  \
"Crow",  \
"Flandreau",  \
"Fort_Belknap",  \
"Ho_Chunk",  \
"Iowa",  \
"Jicarilla_Apache",  \
"Kalispel",  \
"Lower_Brule",  \
"Mesa_Grande",  \
"Leech_Lake",  \
"Modoc",  \
"Ruby",  \
"Stevens_Village",  \
"Nez_Perce",  \
"Northern_Cheyenne",  \
"Pine_Ridge",  \
"Omaha",  \
"Oneida",  \
"Pit_River",  \
"Ponca",  \
"Potawatomi",  \
"Prairie_Island",  \
"Cochiti_Pueblo",  \
"Nambe_Pueblo",  \
"Picuris_Pueblo",  \
"Pojoaque_Pueblo",  \
"San_Juan_Pueblo",  \
"Sandia_Pueblo",  \
"Taos_Pueblo",  \
"Tesuque_Pueblo",  \
"Quapaw",  \
"Rosebud",  \
"Round_Valley",  \
"Sac_And_Fox",  \
"Salt_River",  \
"Santee",  \
"Seneca_Cayuga",  \
"Shakopee_Mdewakanton",  \
"Fort_Hall",  \
"Lake_Traverse",  \
"Southern_Ute",  \
"Spirit_Lake",  \
"Standing_Rock",  \
"Stillaguamish",  \
"Fort_Berthold",  \
"Turtle_Mountain",  \
"Uintah_And_Ouray",  \
"Old_Harbor",  \
"Wind_River",  \
"Winnebago",  \
"Yankton", \
"Osage_Nation" /)


formal_name    = (/ "Fort Peck, MT",  \
"Blackfeet, MT",  \
"Cherokee Nation, OK",  \
"Cheyenne River, SD",  \
"Cheyenne Arapaho, OK",  \
"Rocky Boys, MT",  \
"Flathead, MT",  \
"Yakama, WA",  \
"Umatilla, OR",  \
"Crow Creek, SD",  \
"Crow, MT",  \
"Flandreau, SD",  \
"Fort Belknap, MT",  \
"Ho-Chunk, WI",  \
"Iowa, OK",  \
"Jicarilla Apache, NM",  \
"Kalispel, WA",  \
"Lower Brule, SD",  \
"Mesa Grande, CA",  \
"Leech Lake, MN",  \
"Modoc, OK",  \
"Ruby, AK",  \
"Stevens Village, AK",  \
"Nez Perce, ID",  \
"Northern Cheyenne, MN",  \
"Pine Ridge, SD",  \
"Omaha, NE",  \
"Oneida, WI",  \
"Pit River, CA",  \
"Ponca, NE",  \
"Potawatomi, KA",  \
"Prairie Island, MN",  \
"Cochiti Pueblo, NM",  \
"Nambe Pueblo, NM",  \
"Picuris Pueblo, NM",  \
"Pojoaque Pueblo, NM",  \
"San Juan Pueblo, NM",  \
"Sandia Pueblo, NM",  \
"Taos Pueblo, NM",  \
"Tesuque Pueblo, NM",  \
"Quapaw, OK",  \
"Rosebud, SD",  \
"Round Valley, CA",  \
"Sac And Fox, IA",  \
"Salt River, AZ",  \
"Santee, NE",  \
"Seneca-Cayuga, OK",  \
"Shakopee Mdewakanton, MN",  \
"Fort Hall, ID",  \
"Lake Traverse, SD",  \
"Southern Ute, CO",  \
"Spirit Lake, ND",  \
"Standing Rock, ND",  \
"Stillaguamish, WA",  \
"Fort Berthold, ND",  \
"Turtle Mountain, ND",  \
"Uintah And Ouray, UT",  \
"Old Harbor, AK",  \
"Wind River, WY",  \
"Winnebago, NE",  \
"Yankton, SD", \
"Osage Nation, OK" /)



loc_lat = (/ 48.363611333,  \
48.658770694,  \
35.911610782,  \
45.078120785,  \
35.741241784,  \
48.271900787,  \
47.499556162,  \
46.239811983,  \
45.585941568,  \
44.128349636,  \
45.37947787,  \
44.074129916,  \
48.204310115,  \
43.497914779,  \
35.893415425,  \
36.552375698,  \
48.366237834,  \
44.088747754,  \
33.151630409,  \
47.358162717,  \
36.867691528,  \
64.738854053,  \
66.005923339,  \
46.307569449,  \
45.535383413,  \
43.352418048,  \
42.102804761,  \
44.486669629,  \
41.586564536,  \
42.713763461,  \
39.339930348,  \
44.667515702,  \
35.617226121,  \
35.875747426,  \
36.200625067,  \
35.893828026,  \
36.053262984,  \
35.244269866,  \
36.460565153,  \
35.802729562,  \
36.952507627,  \
43.19319917,  \
39.85194116,  \
41.968720801,  \
33.520741882,  \
42.724640431,  \
36.702833288,  \
44.736793749,  \
42.968096178,  \
45.619924417,  \
37.10854105,  \
47.907847998,  \
45.708346649,  \
48.214405958,  \
47.743352163,  \
48.59230487,  \
39.948256233,  \
57.201979515,  \
43.279762382,  \
42.225366699,  \
43.110190799,  \
 36.629958 /)


loc_lon       = (/ -105.538924658,  \
-112.872285912,  \
-94.968941269,  \
-101.230131465,  \
-98.582106956,  \
-109.823317451,  \
-114.279771026,  \
-120.82472128,  \
-118.569848158,  \
-99.473103563,  \
-107.750842745,  \
-96.573404763,  \
-108.611906544,  \
-89.651594283,  \
-97.015307859,  \
-107.074534256,  \
-117.274569323,  \
-99.766572149,  \
-116.758187413,  \
-94.255829938,  \
-94.870622535,  \
-155.489405469,  \
-149.093403148,  \
-116.407362868,  \
-106.686250347,  \
-102.089046487,  \
-96.508546846,  \
-88.205641135,  \
-120.481521406,  \
-98.084005538,  \
-95.840279709,  \
-92.712601313,  \
-106.319760199,  \
-105.934742273,  \
-105.709507816,  \
-106.026354166,  \
-106.07203189,  \
-106.545764885,  \
-105.509185477,  \
-105.973421285,  \
-94.79599027,  \
-100.717749633,  \
-123.307554486,  \
-92.639157521,  \
-111.795588365,  \
-97.830999314,  \
-94.677944384,  \
-93.471939543,  \
-112.364458312,  \
-97.086276728,  \
-107.64474838,  \
-98.880691633,  \
-101.199925665,  \
-122.185907351,  \
-102.278327374,  \
-106.899225683,  \
-110.03108688,  \
-153.306087047,  \
-108.815597023,  \
-96.598593205,  \
-98.376292766, \
-96.399489  /) + 360.0 ; deg east

formal_name    := (/ "Darwin, NT, AUS",            \
                     "Papeete, Tahiti, PYF",       \
                     "Ponta Delgada, Azores, PRT", \
                     "Reykjavík, ISL", \
                     "SD01",  \
                     "SD02",  \
                     "SD03",  \
                     "SD04",  \
                     "SD05",  \
                     "SD06",  \
                     "SD07",  \
                     "SD08",  \
                     "SD09"  \
                      /)

loc_string    := (/  "YPDN",  \
                     "NTAA",  \
                     "LPPD",  \
                     "BIKF",   \
                     "SD01",  \
                     "SD02",  \
                     "SD03",  \
                     "SD04",  \
                     "SD05",  \
                     "SD06",  \
                     "SD07",  \
                     "SD08",  \
                     "SD09"  \
            /)

loc_lat       := (/   -12.415779, \
                      -17.556666, \
                       37.741184, \
                       63.985000,  \
                       45.25406, \
                       45.47139, \
                       45.45994, \
                       43.92326, \
                       43.73841, \
                       44.34274, \
                       44.50063, \
                       43.35578, \
                       43.41789 \
                       /); deg north

loc_lon       := (/   130.879865, \
                      210.38861,  \
                      334.30213,  \
                      337.39445, \
                      257.2413,    \
                      259.719, \
                      262.1566, \
                      256.3355, \
                      257.5146, \
                      259.7704, \
                      262.2293, \
                      259.618, \
                      262.2756  \
                         /) ; deg east

loc_lat@units = "degrees_north"
loc_lon@units = "degrees_east"
depestlayer    = 7
loc_lon = where(loc_lon .lt.0, loc_lon+360.0 , loc_lon)
dir   =  "/projects/ECEP/CESM_Ensembles/CESM_LES_MES_ORIGINAL_OUTPUT/"


do statid = 0, dimsizes(loc_string)-1

system("mkdir  ./"+loc_string(statid))




   if (rcp  .eq.  "RCP85") then

      time               = new( 1032+900+240, double)
      time@units         = "days since 1920-01-01 00:00:00"
      time@calendar      = "noleap"
      time@bounds        = "time_bounds"
      time!0             = "time"

      n_ens = 30
      nens = n_ens

      nt00 = (/    0,       1032,     900+1032 /)
      nt01 = (/ 1032, 1032 + 900, 1032+900+240 /) - 1
      nt   = (/ 1032,        900 ,         240 /)

      part1 = (/ "b.e11.B20TRC5CNBDRD.f09_g16.",  \
                 "b.e11.BRCP85C5CNBDRD.f09_g16.", \
                 "b.e11.BRCP85C5CNBDRD.f09_g16." /)

      part2 = sprinti("%0.3i", ispan(1,n_ens,1))

      part3 = ".clm2.h0."

      part5 = (/ ".192001-200512.nc",  \
                 ".200601-208012.nc",  \
                 ".208101-210012.nc"  /)

      full_record = "CONUS_1920-2100"


      time_of_last_month = "66065"; RCP8.5

      scratchfile = "./deleteme85.nc"


   else

      time               = new( 1032+900, double)
      time@units         = "days since 1920-01-01 00:00:00"
      time@calendar      = "noleap"
      time@bounds        = "time_bounds"
      time!0             = "time"

      n_ens = 15
      nens = n_ens

      nt00 = (/    0,        1032 /)
      nt01 = (/ 1032, 1032 +  900 /) - 1
      nt   = (/ 1032,         900 /)

      part1 = (/ "b.e11.B20TRC5CNBDRD.f09_g16.",  \
                 "b.e11.BRCP45C5CNBDRD.f09_g16." /)

      part2 = sprinti("%0.3i", ispan(1,n_ens,1))

      part3 = ".clm2.h0."

      part5 = (/ ".192001-200512.nc",  \
                 ".200601-208012.nc"  /)

      full_record = "CONUS_1920-2080"

      time_of_last_month = "58765"; RCP4.5

      scratchfile = "./deleteme45.nc"

   end if


   ensemble_member = ispan(1,nens,1)
   ensemble_member!0 = "ensemble_member"
   ensemble_member&ensemble_member= ispan(1,nens,1)




tf = 0
ef = 1
vf = 0



n_timefiles = dimsizes(nt00)


do tf = 0,n_timefiles-1

    filename = dir + "/"+"TSA"+"/"+part1(tf)+"002"+".clm2.h0."+"TSA"+part5(tf)


    f = addfile(filename,"r")
    time_file = f->time


    date_t_on_o = cd_convert(time_file,time@units)
    date_t_on_o@calendar      = "noleap"
    print(" "+filename)
  ;  printVarSummary(date_t_on_o)
  ;  printVarSummary( time(nt00(tf):nt01(tf))  )
  ;  print(  nt00(tf)+" " + nt01(tf) )
    time(nt00(tf):nt01(tf)) = (/ date_t_on_o /)

     zsoil_string = sprinti("0-%0.2i-cm",floattointeger(f->ZSOI(depestlayer,{loc_lat(statid)},{loc_lon(statid)})*100))
     thetas = f->WATSAT(0:depestlayer,{loc_lat(statid)},{loc_lon(statid)})
     dzsoil = f->ZSOI(0:depestlayer,{loc_lat(statid)},{loc_lon(statid)})*100

     cesm_area = f->area({loc_lat(statid)},{loc_lon(statid)})
     cesm_lon = f->lon({loc_lon(statid)})
     cesm_lat = f->lat({loc_lat(statid)})
     cesm_topo = f->topo({loc_lat(statid)},{loc_lon(statid)})


          cesm_topo!0           = "ncl_scalar"
          cesm_topo@description = "cesm elevation"
          cesm_topo@long_name  = "cesm elevation"
          cesm_topo@standard_name  = "height"
          cesm_topo@units  = "m"


     cesm_lon!0           = "ncl_scalar"
     cesm_lon@description = "cesm longitude"
     cesm_lon@long_name  = "cesm longitude"
     cesm_lon@standard_name  = "longitude"
     cesm_lon@units  = "degrees_east"

     cesm_lat!0           = "ncl_scalar"
     cesm_lat@description = "cesm latitude"
     cesm_lat@long_name  = "cesm latitude"
     cesm_lat@standard_name  = "latitude"
     cesm_lat@units  = "degrees_north"

     station_name=formal_name(statid)
     station_name!0           = "ncl_scalar"
     station_name@long_name   = "station name"
     station_name@description = "station name"
     station_name@cf_role     = "timeseries_id"



     print(cesm_lat)
     print(cesm_lon)
     print(cesm_topo)
     print(cesm_area)
     print(thetas)

    delete(time_file)
    delete(date_t_on_o)
    delete(f)


end do

time@calendar      = "noleap"

time = (/ time -1 /)
time&time = time
printVarSummary(time)

delta_t = tofloat(time)

delta_t(1:dimsizes(delta_t)-1) = (/ (delta_t(1:dimsizes(delta_t)-1) - delta_t(0:dimsizes(delta_t)-2) )  /) * 86400.0
delta_t@units = "s"
delta_t@long_name = "time of period"



;;;;;;;;;;;;;;;;;;;  fix the first file ;;;;;;;;;;;;;;;;

    filename = "/projects/ECEP/CESM_Ensembles/CESM_LES_MES_ORIGINAL_OUTPUT/TSA/b.e11.B20TRC5CNBDRD.f09_g16.001.clm2.h0.TSA.185001-200512.nc"

    print(" ens01 "+filename)

    f = addfile(filename,"r")
    time_ens1 = f->time
    time_ens1(:) =  time_ens1(:) -1
    time_ens1!0 = "time_ens1"

    date_t_on_o = cd_convert(time_ens1,time@units)


    time_ens1 = (/ dble2flt(date_t_on_o) /)
    time_ens1&time_ens1 = time_ens1
    printVarSummary(time_ens1)

    delete(date_t_on_o)
    delete(f)

    filename = "/projects/ECEP/CESM_Ensembles/CESM_LES_MES_ORIGINAL_OUTPUT/TSA/b.e11.B20TRC5CNBDRD.f09_g16.002.clm2.h0.TSA.192001-200512.nc"


     print(" ens02 "+filename)
    f = addfile(filename,"r")
    time_ens2 = f->time
    time_ens2(:) =  time_ens2(:) -1
    time_ens2!0 = "time_ens2"

    date_t_on_o = cd_convert(time_ens2,time@units)


    time_ens2 = (/ dble2flt(date_t_on_o) /)
    time_ens2&time_ens2 = time_ens2
    printVarSummary(time_ens2)

    delete(date_t_on_o)
    delete(f)
 tens_1_on_2_a = ind(time_ens1.eq.30)
 tens_1_on_2_b = ind(time_ens1.eq.31411)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


time@calendar      = "noleap"

date_info = cd_calendar(time,-5)
    time@calendar      = "noleap"

time_year = cd_convert(time, "years since 0000-01-01 00:00:00")
    time_year@calendar      = "noleap"
    time_year!0 = "time"
    time_year&time = time
    print(time_year)
;;;delete(time_year@units)
temperature = new( (/ n_ens, dimsizes(time)  /), float)
temperature@long_name = "2-m Air Temperature"
temperature@units     = "K"
temperature@lon       = loc_lon(statid)
temperature@lat       = loc_lat(statid)
temperature@station_id = loc_string(statid)
temperature@cell_methods = "time:mean"
temperature!1 = "time"
temperature!0 = "ensemble_member"
temperature@coordinates   = "time lat lon" ;

wind = temperature
wind@long_name = "Wind Speed"
wind@units     = "m s-1"
wind@coordinates   = "time lat lon" ;

rain = temperature
rain@long_name = "Liquid Precip"
rain@units     = "kg m-2"
rain@cell_methods = "time:sum"
rain@coordinates   = "time lat lon" ;

snow = temperature
snow@long_name = "Frozen Precip"
snow@units     = "kg m-2"
snow@cell_methods = "time:sum"
snow@coordinates   = "time lat lon" ;


precip = rain
precip@long_name = "Total Precip"
precip@units     = "kg m-2"
precip@cell_methods = "time:sum"
precip@coordinates   = "time lat lon" ;


flds = temperature
flds@long_name = "Incident IR Radiation"
flds@units     = "MJ m-2"
flds@cell_methods = "time:sum"
flds@coordinates   = "time lat lon" ;


fsds = temperature
fsds@long_name = "Incident Solar Radiation"
fsds@units     = "MJ m-2"
fsds@cell_methods = "time:sum"
fsds@coordinates   = "time lat lon" ;


q2m = temperature
q2m@long_name = "2-m Mixing Ratio"
q2m@units     = "kg kg-1"
q2m@coordinates   = "time lat lon" ;



zwt = temperature
zwt@long_name = " Water Table Depth"
zwt@units     = "m"
zwt@coordinates   = "time lat lon" ;

soilw = temperature
soilw@long_name = zsoil_string+" Soil Water"
soilw@units     = "kg m-2"
soilw@coordinates   = "time lat lon" ;


firelength = temperature
firelength@long_name = "Fire Season Length"
firelength@units     = "days"
firelength@coordinates   = "time lat lon" ;

firearea = temperature
firearea@long_name = "Fire Area Burned"
firearea@units     = "grid fraction"
firearea@coordinates   = "time lat lon" ;


mslp = temperature
mslp@long_name = "Mean Sea Level Pressure"
mslp@units     = "Pa"
mslp@coordinates   = "time lat lon" ;


soil_evap = temperature
soil_evap@long_name = "Soil Evaporation"
soil_evap@units     = "kg m-3 s-1"
soil_evap@coordinates   = "time lat lon" ;


veg_evap = temperature
veg_evap@long_name = "Canopy Evaporation"
veg_evap@units     = "kg m-3 s-1"
veg_evap@coordinates   = "time lat lon" ;


veg_trans = temperature
veg_trans@long_name = "Canopy Transpiration"
veg_trans@units     = "kg m-3 s-1"
veg_trans@coordinates   = "time lat lon" ;


tref_mean = temperature
tref_mean@long_name = "Mean CAM Ref Temperature"
tref_mean@units     = "K"
tref_mean@coordinates   = "time lat lon" ;


tref_max = temperature
tref_max@long_name = "Mean Max CAM Ref Temperature"
tref_max@units     = "K"
tref_max@coordinates   = "time lat lon" ;


tref_min = temperature
tref_min@long_name = "Mean Min CAM Ref Temperature"
tref_min@units     = "K"
tref_min@coordinates   = "time lat lon" ;



print("openwks")
wksT =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"TSA")
wksW =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"WIND")
wksR =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"RAIN")
wksS =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"SNOW")


wksFSDS =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"FSDS")
wksFLDS =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"FLDS")
wksZWT =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"ZWT")
wksSOILW =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"SOILLIQ")
wksFIRESEAONL =  gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"FIRESEASONL")
wksANN_FAREA_BURNED = gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"ANN_FAREA_BURNED")
wksQ2M = gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"Q2M")
wksPREC = gsn_open_wks ("pdf","./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"PREC")
print("doneopenwks")

tplots = new( n_ens, graphic)
wplots = tplots
rplots = tplots
splots = tplots
precplots = tplots

fldsplots = tplots
fsdsplots = tplots
zwtplots = tplots
soilwplots = tplots
firelengthplots = tplots
fireareaplots = tplots
q2mplots = tplots

do ef = 0, n_ens-1
do tf = 0,n_timefiles-1

    string_year = part5(tf)
    longone = False

    if ((part2(ef) .eq. "001").and.(tf .eq. 0)) then
        string_year = ".185001-200512.nc"
        longone = True
    else
        string_year = part5(tf)
        longone = False
    end if




    filename = dir + "/"+"FLDS"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"FLDS"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->FLDS(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    flds(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    flds@cesm_lon := tsa@lon
    flds@cesm_lat := tsa@lat


    filename = dir + "/"+"Q2M"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"Q2M"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->Q2M(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    q2m(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    q2m@cesm_lon := tsa@lon
    q2m@cesm_lat := tsa@lat



    filename = dir + "/"+"FSDS"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"FSDS"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->FSDS(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
        fsds(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    fsds@cesm_lon := tsa@lon
    fsds@cesm_lat := tsa@lat


    filename = dir + "/"+"SOILLIQ"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"SOILLIQ"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
         delete(tsa)
     delete(tsa0)

    tsa = f->SOILLIQ(:,0:depestlayer,{loc_lat(statid)},{loc_lon(statid)})
    tsa2 = dim_sum(tsa)
     tsa2 = dim_sum(tsa)
   if (longone) then
       tsa0 = tsa2(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa2
    end if
    soilw(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    soilw@cesm_lon := tsa@lon
    soilw@cesm_lat := tsa@lat
     delete(tsa)
     delete(tsa2)
     delete(tsa0)



    filename = dir + "/"+"TSA"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"TSA"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->TSA(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    temperature(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    temperature@cesm_lon := tsa@lon
    temperature@cesm_lat := tsa@lat


    filename = dir + "/"+"WIND"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"WIND"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->WIND(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    wind(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    wind@cesm_lon := tsa@lon
    wind@cesm_lat := tsa@lat

    filename = dir + "/"+"RAIN"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"RAIN"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->RAIN(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    rain(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    rain@cesm_lon := tsa@lon
    rain@cesm_lat := tsa@lat



    filename = dir + "/"+"ANN_FAREA_BURNED"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"ANN_FAREA_BURNED"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->ANN_FAREA_BURNED(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    firearea(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    rain@cesm_lon := tsa@lon
    rain@cesm_lat := tsa@lat
    delete(tsa0)
    delete(tsa)


    filename = dir + "/"+"ZWT"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"ZWT"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->ZWT(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    zwt(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    zwt@cesm_lon := tsa@lon
    zwt@cesm_lat := tsa@lat



    filename = dir + "/"+"SNOW"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"SNOW"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->SNOW(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    snow(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    snow@cesm_lon := tsa@lon
    snow@cesm_lat := tsa@lat



    print(" " + precip@long_name)
    precip(ef,nt00(tf):nt01(tf)) = (/ rain(ef,nt00(tf):nt01(tf)) + snow(ef,nt00(tf):nt01(tf)) /)
    precip@cesm_lon := tsa@lon
    precip@cesm_lat := tsa@lat
    delete(tsa0)
    delete(tsa)

    filename = dir + "/"+"FIRESEASONL"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"FIRESEASONL"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->FIRESEASONL(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    firelength(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    firelength@cesm_lon := tsa@lon
    firelength@cesm_lat := tsa@lat
    delete(tsa0)
    delete(tsa)
;

    filename = dir + "/"+"PSL"+"/"+part1(tf)+part2(ef)+".cam.h0."+"PSL"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->PSL(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    mslp(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    mslp@cesm_lon := tsa@lon
    mslp@cesm_lat := tsa@lat

;


    filename = dir + "/"+"QSOIL"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"QSOIL"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->QSOIL(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    soil_evap(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    soil_evap@cesm_lon := tsa@lon
    soil_evap@cesm_lat := tsa@lat
    delete(tsa0)
    delete(tsa)
;

    filename = dir + "/"+"QVEGE"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"QVEGE"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->QVEGE(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    veg_evap(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    veg_evap@cesm_lon := tsa@lon
    veg_evap@cesm_lat := tsa@lat
    delete(tsa0)
    delete(tsa)
;

    filename = dir + "/"+"QVEGT"+"/"+part1(tf)+part2(ef)+".clm2.h0."+"QVEGT"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->QVEGT(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    veg_trans(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    veg_trans@cesm_lon := tsa@lon
    veg_trans@cesm_lat := tsa@lat


    delete(tsa0)
    delete(tsa)



;


    filename = dir + "/"+"TREFHTMN"+"/"+part1(tf)+part2(ef)+".cam.h0."+"TREFHTMN"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->TREFHTMN(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    veg_trans(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    veg_trans@cesm_lon := tsa@lon
    veg_trans@cesm_lat := tsa@lat


    delete(tsa0)
    delete(tsa)

;

    filename = dir + "/"+"TREFHTMX"+"/"+part1(tf)+part2(ef)+".cam.h0."+"TREFHTMX"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->TREFHTMX(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    veg_trans(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    veg_trans@cesm_lon := tsa@lon
    veg_trans@cesm_lat := tsa@lat


    delete(tsa0)
    delete(tsa)

;

    filename = dir + "/"+"TREFHT"+"/"+part1(tf)+part2(ef)+".cam.h0."+"TREFHT"+string_year
    print(" "+filename)
    f = addfile(filename,"r")
    tsa = f->TREFHT(:,{loc_lat(statid)},{loc_lon(statid)})
    print(" " + tsa@long_name)
    if (longone) then
       tsa0 = tsa(tens_1_on_2_a:tens_1_on_2_b)
    else
       tsa0 = tsa
    end if
    veg_trans(ef,nt00(tf):nt01(tf)) = (/ tsa0 /)
    veg_trans@cesm_lon := tsa@lon
    veg_trans@cesm_lat := tsa@lat


    delete(tsa0)
    delete(tsa)

end do


rain(ef,:) = (/ rain(ef,:) * delta_t  /)
snow(ef,:) = (/ snow(ef,:) * delta_t /)
flds(ef,:) = (/ flds(ef,:) * delta_t/ 1e6  /)
fsds(ef,:) = (/ fsds(ef,:) * delta_t/ 1e6  /)
precip(ef,:) = (/ precip(ef,:) * delta_t  /)

;;  firearea(ef,:) = (/ firearea(ef,:) * cesm_area /)

   resMM = True
  resMM@gsnDraw  = False                          ; don't draw
  resMM@gsnFrame = False                          ; don't advance frame
  resMM@xyLineColor = "Red"                          ; don't advance frame

   resMM2 = True
  resMM2@gsnDraw  = False                          ; don't draw
  resMM2@gsnFrame = False                          ; don't advance frame
  resMM2@xyLineColor = "Blue"                          ; don't advance frame


  resT = True
  resT@gsnDraw  = False                          ; don't draw
  resT@gsnFrame = False                          ; don't advance frame
  resT@tiMainString = "Ensemble Member "+part2(ef)
  resT@trXMinF  = min(time_year)                   ; min value on y-axis
  resT@trXMaxF  = max(time_year)                ; max value on y-axis
  resT@gsnLeftString = "2-m Temperature"
  resT@gsnRightString = "K"
  resT@gsnMaximize = True
  resT@tiXAxisOn = False
  resT@tiYAxisOn = False
  resT@xyLineColor = "Grey"


    print("plotting Temperature")

  tplots(ef) = gsn_csm_xy (wksT,time_year,temperature(ef,:),resT)        ; create plot
  rav = runave(temperature(ef,:),12,0)
  overplot =gsn_xy(wksT,time_year,rav, resMM)
  overlay(tplots(ef),overplot)
  rav = runave(temperature(ef,:),30*12,0)
  overplot =gsn_xy(wksT,time_year,rav, resMM2)
  overlay(tplots(ef),overplot)

  print("plotting Incident Solar ")



  resFSDS= resT
  resFSDS@gsnLeftString = "Incident Solar Rad"
  resFSDS@gsnRightString = "MJ m-2"
  fsdsplots(ef) = gsn_csm_xy (wksFSDS,time_year,fsds(ef,:),resFSDS)        ; create plot
  rav = runave(fsds(ef,:),12,0)
  overplot =gsn_xy(wksFSDS,time_year,rav, resMM)
  overlay(fsdsplots(ef),overplot)
  rav = runave(fsds(ef,:),30*12,0)
  overplot =gsn_xy(wksFSDS,time_year,rav, resMM2)
  overlay(fsdsplots(ef),overplot)


  print("plotting Incident IR ")


  resFLDS = resT
  resFLDS@gsnLeftString = "Incident IR Rad"
  resFLDS@gsnRightString = "MJ m-2"
  fldsplots(ef) = gsn_csm_xy (wksFLDS,time_year,flds(ef,:),resFLDS)        ; create plot
  rav = runave(flds(ef,:),12,0)
  overplot =gsn_xy(wksFLDS,time_year,rav, resMM)
  overlay(fldsplots(ef),overplot)
  rav = runave(flds(ef,:),30*12,0)
  overplot =gsn_xy(wksFLDS,time_year,rav, resMM2)
  overlay(fldsplots(ef),overplot)




  print("plotting Wind ")

  resW = resT
  resW@gsnLeftString = "10-m Wind Speed"
  resW@gsnRightString = "m s-1"
  wplots(ef) = gsn_csm_xy (wksW,time_year,wind(ef,:),resW)        ; create plot
  rav = runave(wind(ef,:),12,0)
  overplot =gsn_xy(wksW,time_year,rav, resMM)
  overlay(wplots(ef),overplot)
  rav = runave(wind(ef,:),30*12,0)
  overplot =gsn_xy(wksW,time_year,rav, resMM2)
  overlay(wplots(ef),overplot)


  print("plotting Liquid Precip")


  resR = resT
  resR@gsnLeftString = "Liquid Precip"
  resR@gsnRightString = "kg m-2"
  rplots(ef) = gsn_csm_xy (wksR,time_year,rain(ef,:),resR)        ; create plot
  rav = runave(rain(ef,:),12,0)
  overplot =gsn_xy(wksR,time_year,rav, resMM)
  overlay(rplots(ef),overplot)
  rav = runave(rain(ef,:),30*12,0)
  overplot =gsn_xy(wksR,time_year,rav, resMM2)
  overlay(rplots(ef),overplot)


  print("plotting Frozen Precip")

  resS = resT
  resS@gsnLeftString = "Frozen Precip"
  resS@gsnRightString = "kg m-2"
  splots(ef) = gsn_csm_xy (wksS,time_year,snow(ef,:),resS)        ; create plot
  rav = runave(snow(ef,:),12,0)
  overplot =gsn_xy(wksS,time_year,rav, resMM)
  overlay(splots(ef),overplot)
  rav = runave(snow(ef,:),30*12,0)
  overplot =gsn_xy(wksS,time_year,rav, resMM2)
  overlay(splots(ef),overplot)


  print("plotting Total Precip")

  resPREC = resT
  resPREC@gsnLeftString = "Total Precip"
  resPREC@gsnRightString = "kg m-2"
  precplots(ef) = gsn_csm_xy (wksPREC,time_year,precip(ef,:),resPREC)        ; create plot
  rav = runave(precip(ef,:),12,0)
  overplot =gsn_xy(wksPREC,time_year,rav, resMM)
  overlay(precplots(ef),overplot)
  rav = runave(precip(ef,:),30*12,0)
  overplot =gsn_xy(wksPREC,time_year,rav, resMM2)
  overlay(precplots(ef),overplot)


  print("plotting Water Table")

  resZWT = resT
  resZWT@gsnLeftString = "Water Table Depth"
  resZWT@gsnRightString = "m"
  zwtplots(ef) = gsn_csm_xy (wksZWT,time_year,zwt(ef,:),resZWT)        ; create plot
  rav = runave(zwt(ef,:),12,0)
  overplot =gsn_xy(wksZWT,time_year,rav, resMM)
  overlay(zwtplots(ef),overplot)
  rav = runave(zwt(ef,:),30*12,0)
  overplot =gsn_xy(wksZWT,time_year,rav, resMM2)
  overlay(zwtplots(ef),overplot)


  print("plotting Soil Liquid @ "+soilw@long_name)
  resSOILLIQ = resT
  resSOILLIQ@gsnLeftString = soilw@long_name
  resSOILLIQ@gsnRightString = "kg m-2"
  soilwplots(ef) = gsn_csm_xy (wksSOILW,time_year,soilw(ef,:),resSOILLIQ)        ; create plot
  rav = runave(soilw(ef,:),12,0)
  overplot =gsn_xy(wksSOILW,time_year,rav, resMM)
  overlay(soilwplots(ef),overplot)
  rav = runave(soilw(ef,:),30*12,0)
  overplot =gsn_xy(wksSOILW,time_year,rav, resMM2)
  overlay(soilwplots(ef),overplot)


  print("plotting Fire Season Lenght")

  resFIRESEAONL = resT
  resFIRESEAONL@gsnLeftString = "Fire Season Length"
  resFIRESEAONL@gsnRightString = "day"
  firelengthplots(ef) = gsn_csm_xy (wksFIRESEAONL,time_year,firelength(ef,:),resFIRESEAONL)        ; create plot
  rav = runave(firelength(ef,:),12,0)
  overplot =gsn_xy(wksFIRESEAONL,time_year,rav, resMM)
  overlay(firelengthplots(ef),overplot)
  rav = runave(firelength(ef,:),30*12,0)
  overplot =gsn_xy(wksFIRESEAONL,time_year,rav, resMM2)
  overlay(firelengthplots(ef),overplot)


 print("plotting Fire Area ")

  resANN_FAREA_BURNED = resT
  resANN_FAREA_BURNED@gsnLeftString = "Fire Area Burned"
  resANN_FAREA_BURNED@gsnRightString = "km2"
  fireareaplots(ef) = gsn_csm_xy(wksANN_FAREA_BURNED,time_year,( (/ firearea(ef,:) * cesm_area /) ),resANN_FAREA_BURNED)        ; create plot
  rav = runave(( (/ firearea(ef,:) * cesm_area /) ),12,0)
  overplot =gsn_xy(wksANN_FAREA_BURNED,time_year,rav, resMM)
  overlay(fireareaplots(ef),overplot)
  rav = runave(( (/ firearea(ef,:) * cesm_area /) ),30*12,0)
  overplot =gsn_xy(wksANN_FAREA_BURNED,time_year,rav, resMM2)
  overlay(fireareaplots(ef),overplot)



 print("plotting Q2M")

  resQ2M = resT
  resQ2M@gsnLeftString = "Specific Humidity"
  resQ2M@gsnRightString = "kg kg-1"
  q2mplots(ef) = gsn_csm_xy (wksQ2M,time_year,q2m(ef,:),resQ2M)        ; create plot
  rav = runave(q2m(ef,:),12,0)
  overplot =gsn_xy(wksQ2M,time_year,rav, resMM)
  overlay(q2mplots(ef),overplot)
  rav = runave(q2m(ef,:),30*12,0)
  overplot =gsn_xy(wksQ2M,time_year,rav, resMM2)
  overlay(q2mplots(ef),overplot)



end do
  ppp = 6

  resP=True
  resP@txString   = loc_string(statid) + " " + part1(1)
  resP@gsnPanelCenter = False
  resP@gsnMaximize = True
  do k = 0, n_ens-1,ppp
  gsn_panel(wksT,tplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksW,wplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksS,splots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksR,rplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot

  gsn_panel(wksFSDS,  fsdsplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksFLDS,  fldsplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksZWT,    zwtplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksSOILW,soilwplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot

  gsn_panel(wksFIRESEAONL,    firelengthplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksANN_FAREA_BURNED,fireareaplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot

  gsn_panel(wksQ2M,  q2mplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot
  gsn_panel(wksPREC,precplots(k:min((/ k+ppp-1,n_ens-1 /))),(/3,2/),resP)             ; now draw as one plot

end do

delete(wksT)
delete(wksW)
delete(wksS)
delete(wksR)
delete(wksFLDS)
delete(wksFSDS)
delete(wksZWT)
delete(wksSOILW)
delete(wksFIRESEAONL)
delete(wksANN_FAREA_BURNED)
delete(wksQ2M)
delete(wksPREC)

distance = gc_latlon(loc_lat(statid),loc_lon(statid),cesm_lat,cesm_lon,1,4)

  system("rm -frv "+"./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"nc")
  fout =    addfile("./"+loc_string(statid)+"/"+loc_string(statid)+"."+part1(1)+"nc", "c")

  fout@location                          = loc_string(statid)
  fout@longitude                         = loc_lon(statid)
  fout@latitude                          = loc_lat(statid)
  fout@scenariocode_20th                 = part1(0)
  fout@scenariocode_future               = part1(1)
  fout@cesm_area                         = cesm_area
  fout@cesm_topo                         = cesm_topo
  fout@cesm_lon                          = cesm_lon
  fout@cesm_lat                          = cesm_lat
  fout@station_id                        = loc_string(statid)
  fout@great_circle_distance_error_in_km = distance
  fout->lon                              = cesm_lon
  fout->lat                              = cesm_lat
  fout->station_name                     = station_name
  fout->alt                              = cesm_topo

  fout->time                          = time
  fout->time_year                     = time_year
  fout->ensemble_member               = ensemble_member
  fout->saturation_soil_water_content = thetas
  fout->soil_layer_thickness          = dzsoil

  fout->flds         = flds
  fout->fsds         = fsds
  fout->temperature  = temperature
  fout->q2m          = q2m
  fout->wind         = wind
  fout->precip       = precip
  fout->rain         = rain
  fout->snow         = snow

  fout->soilw        = soilw
  fout->zwt          = zwt

  fout->firelength   = firelength
  fout->firearea     = firearea

  fout->mslp         = mslp
  fout->soil_evap    = soil_evap
  fout->veg_evap     = veg_evap
  fout->veg_trans    = veg_trans
  fout->tref_mean    = tref_mean
  fout->tref_max     = tref_max
  fout->tref_min     = tref_min

  delete(fout)


end do
end
