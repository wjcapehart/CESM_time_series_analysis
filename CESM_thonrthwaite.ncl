load "./thornthwaite_budget_1d.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


begin


   setfileoption("nc", "Format",        "NetCDF4")
   setfileoption("nc", "FileStructure", "Advanced")


directory = (/ "Fort_Peck",  \
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
                "Yankton",  \
                "Steamboat_Springs", \
                "SD01", \
                "SD02", \
                "SD03", \
                "SD04", \
                "SD05", \
                "SD06", \
                "SD07", \
                "SD08", \
                "SD09"  /)


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
"Steamboat Springs, CO",\
"Northwest SD", \
"North Central SD", \
"Northeast SD", \
"Black Hills SD", \
"Southwest SD", \
"Central SD", \
"East Central SD", \
"South Central SD", \
"Southeast SD"  /)





                 formal_name    := (/ "Osage Nation, OK" /)

                 loc_string    := (/  "Osage_Nation"   /)
                 directory    := (/  "Osage_Nation"   /)
                 loc_lat       := (/   36.629958 /); deg north
                 loc_lon       := (/   -96.399489 /)+ 360.0 ; deg east



   filepref  = directory


   rcp       = (/ ".b.e11.BRCP45C5CNBDRD.f09_g16.nc", \
                  ".b.e11.BRCP85C5CNBDRD.f09_g16.nc"  /)
  rcp2       = (/ ".b.e11.BRCP45C5CNBDRD.f09_g16", \
                  ".b.e11.BRCP85C5CNBDRD.f09_g16"  /)

   outdir_rcp = (/ "RCP_4.5", "RCP_8.5" /)

   n_loc = dimsizes(filepref)
   n_rcp = dimsizes(rcp)



   do s = 0, n_loc-1
   do r = 0, n_rcp-1

      filename  = "./" + directory(s) + "/" \
                       + filepref(s)        \
                       + rcp(r)

   print(filename)
   system("ls -altr " + filename)
if (isfilepresent(filename)) then

      filename4  = "./" + directory(s) + "/" \
                       + filepref(s)         \
                       + rcp(r)       + "4"
      system("mkdir -v ./" + directory(s) + "/" + outdir_rcp(r))
      system("mv -v ./" + directory(s) + "/*"+rcp2(r)+"*.pdf  ./" + directory(s) + "/" + outdir_rcp(r))


      if (True) then

         system("ncpdq -h -O -a time,ensemble_member "+filename + " " +filename4)


         system("ncatted -O -h -a long_name,time,c,c,'time' " + filename4)
         system("ncatted -O -h -a standard_name,time,c,c,'time' " + filename4)
         system("ncatted -O -h -a description,time,c,c,'time' " + filename4)

         system("ncatted -O -h -a long_name,time_year,c,c,'Time in Years' " + filename4)
         system("ncatted -O -h -a standard_name,time_year,c,c,'time' " + filename4)
         system("ncatted -O -h -a description,time_year,c,c,'Time in Years' " + filename4)

         system("ncatted -O -h -a long_name,ensemble_member,c,c,'Ensemble Member' " + filename4)
         system("ncatted -O -h -a description,ensemble_member,c,c,'Ensemble Member' " + filename4)

         system("ncatted  -O -h -a standard_name,levgrnd,c,c,'depth' " + filename4)
         system("ncatted  -O -h -a positive,levgrnd,c,c,'down' " + filename4)
         system("ncatted  -O -h -a description,levgrnd,c,c,'coordinate soil levels' " + filename4)
         system("ncrename -O -h -d levgrnd,soil_depth -v levgrnd,soil_depth " + filename4)

         system("ncatted  -O -h -a description,soil_layer_thickness,c,c,'Soil Layer Thickness' " + filename4)
         system("ncatted  -O -h -a long_name,soil_layer_thickness,c,c,'Soil Layer Thickness' " + filename4)
         system("ncatted  -O -h -a units,soil_layer_thickness,c,c,'m' " + filename4)
         system("ncrename -O -h -d ncl3,soil_depth  -v soil_layer_thickness,soil_layer_thickness2 " + filename4)
         system("ncrename -O -h -v soil_layer_thickness2,soil_layer_thickness " + filename4)

         system("ncatted -O -h -a standard_name,saturation_soil_water_content,c,c,'soil_porosity' " + filename4)
         system("ncatted -O -h -a description,saturation_soil_water_content,c,c,'saturated soil water content (porosity)' " + filename4)
         system("ncatted -O -h -a units,saturation_soil_water_content,c,c,'m3 m-3' " + filename4)

         system("ncatted -O -h -a standard_name,flds,c,c,'surface_net_downward_longwave_flux' " + filename4)
         system("ncatted -O -h -a description,flds,c,c,'Incident IR Radiation' " + filename4)

         system("ncatted -O -h -a standard_name,fsds,c,c,'surface_net_downward_shortwave_flux' " + filename4)
         system("ncatted -O -h -a description,fsds,c,c,'Incident Solar Radiation' " + filename4)

         system("ncatted -O -h -a standard_name,temperature,c,c,'air_temperature' " + filename4)
         system("ncatted -O -h -a long_name,temperature,c,c,'2-m Air Temperature' " + filename4)
         system("ncatted -O -h -a description,temperature,c,c,'2-m Air Temperature' " + filename4)

         system("ncatted -O -h -a standard_name,q2m,c,c,'specific_humidity' " + filename4)
         system("ncatted -O -h -a description,q2m,c,c,'2-m Mixing Ratio' " + filename4)
         system("ncatted -O -h -a long_name,q2m,c,c,'2-m Mixing Ratio' " + filename4)

         system("ncatted -O -h -a standard_name,precip,c,c,'precipitation_amount' " + filename4)
         system("ncatted -O -h -a description,precip,c,c,'Total Precip' " + filename4)

         system("ncatted -O -h -a standard_name,rain,c,c,'rainfall_amount' " + filename4)
         system("ncatted -O -h -a description,rain,c,c,'Liquid Precip' " + filename4)

         system("ncatted -O -h -a standard_name,snow,c,c,'snowfall_amount' " + filename4)
         system("ncatted -O -h -a description,snow,c,c,'Frozen Precip' " + filename4)

         system("ncatted -O -h -a standard_name,wind,c,c,'wind_speed' " + filename4)
         system("ncatted -O -h -a description,wind,c,c,'Wind Speed' " + filename4)

         system("ncatted -O -h -a standard_name,soilw,c,c,'moisture_content_of_soil_layer' " + filename4)
         system("ncatted -O -h -a description,soilw,c,c,'0-103-cm Soil Water' " + filename4)

         system("ncatted -O -h -a long_name,zwt,c,c,'Water Table Depth' " + filename4)
         system("ncatted -O -h -a description,zwt,c,c,'Water Table Depth' " + filename4)

         system("ncatted -O -h -a description,firearea,c,c,'Fire Area Burned' " + filename4)

         system("ncatted -O -h -a description,firelength,c,c,'Fire Season Length' " + filename4)



         f = addfile(filename4, "rw")



               soil_layer_thickness = f->soil_layer_thickness
               soil_layer_thickness!0 = "soil_depth"

               f->soil_layer_thickness2 = soil_layer_thickness


         delete(f)

      system("ncks -h -x -v soil_layer_thickness "+ filename4 + " temp.nc")
      system("mv -v  temp.nc " + filename4)
      system("ncrename -O -h -v soil_layer_thickness2,soil_layer_thickness " + filename4)



      end if

      print(" "+filename4)

      f = addfile(filename4, "rw")

      time            = f->time
      time_year       = f->time_year

      month              = toint(f->time)
      copy_VarMeta(time,month)
      month@long_name    = "Calendar Month"
      month@description  = "Calendar Month"
      month@units        = "month"

      year              = toint(f->time)
      copy_VarMeta(time,year)
      year@long_name    = "Calendar Year"
      year@description  = "Calendar Year"
      year@units        = "year"

      time_yyyymm              = toint(f->time)
      copy_VarMeta(time,time_yyyymm)
      time_yyyymm@long_name    = "Date as YYYYMM"
      time_yyyymm@description  = "Date as YYYYMM"
      delete(time_yyyymm@units)



      ensemble_member = f->ensemble_member
      temperature     = f->temperature
      precip          = f->precip




      n_ens = dimsizes(ensemble_member)
      nt    = dimsizes(time)

      ;; repair time!  (for calendar year no-leap!)
      mm   =    1
      yyyy = 1920

      time_attributes = toint(1)
      time_attributes@units = time@units
      time_attributes@calendar = time@calendar

      do t= 0, nt-1
         month(t) = mm
         year(t)  = yyyy
         end_day  = days_in_month(year(t),month(t))
         time(t)  = (/ todouble(cd_inv_calendar(year(t),month(t),end_day,00,00,00,time@units,time_attributes)) /)
         mm = mm+1
         if (mm .gt. 12) then
            mm   =    1
            yyyy = yyyy + 1
         end if
      end do

      time_yyyymm(:) = (/ toint(cd_calendar(time,-1)) /)
      time_year(:)   = (/ cd_calendar(time,4) /)

      drought_index_run_period = (/ 1, 2, 3, 6, 12, 24, 48 /)
      drought_index_run_period!0 = "drought_index_run_period"
      drought_index_run_period&drought_index_run_period = drought_index_run_period
      drought_index_run_period@long_name   = "Drought Run Period"
      drought_index_run_period@description = "Drought Run Period"
      drought_index_run_period@units       = "months"

      n_indexlag = dimsizes(drought_index_run_period)

      baseline_storage = 150. ; mm

      tm_evaporation                 = precip
        tm_evaporation(:,:)          =  0.0
        tm_evaporation@description   = "TM Evaporation"
        tm_evaporation@long_name     = "TM Evaporation"
        tm_evaporation@standard_name = "water_evaporation_amount"
        tm_evaporation@units         = "kg m-2"
        tm_evaporation@comment1      = "Thornthwaite, C.W., and Mather, J.R., 1957, Instructions and tables for computing potential evapotranspiration and the water balance: Centerton, N.J., Laboratory of Climatology, Publications in Climatology, v. 10, no. 3, p. 185–311."

      tm_surplus               = tm_evaporation
        tm_surplus@description = "TM Surplus"
        tm_surplus@long_name   = "TM Surplus"
        delete(tm_surplus@standard_name)

      tm_potevap                 = tm_evaporation
        tm_potevap@description   = "TM Potential Evaporation"
        tm_potevap@long_name     = "TM Potential Evaporation"
        tm_potevap@standard_name = "water_potential_evaporation_amount"

      tm_recharge                 = tm_evaporation
        tm_recharge@description   = "TM Recharge"
        tm_recharge@long_name     = "TM Recharge"
        delete(tm_recharge@standard_name)

      tm_storage_change                 = tm_evaporation
        tm_storage_change@description   = "TM Monthly Storage Change"
        tm_storage_change@long_name     = "TM Monthly Storage Change"
        tm_storage_change@units         = "kg m-2 month-1"
        delete(tm_storage_change@standard_name)

      tm_storage                 = tm_evaporation
        tm_storage(0,:)          = baseline_storage
        tm_storage               = tm_storage@_FillValue
        tm_storage@description   = "TM_Storage"
        tm_storage@long_name     = "TM_Storage"
        delete(tm_storage@standard_name)

      tm_deficit                 = tm_evaporation
        tm_deficit@description   = "TM Deficit"
        tm_deficit@long_name     = "TM Deficit"
        delete(tm_deficit@standard_name)



      standard_precipitation_index = new((/ nt, n_ens, n_indexlag /), float)
        standard_precipitation_index!0  = "time"
        standard_precipitation_index!1  = "ensemble_member"
        standard_precipitation_index!2  = "drought_index_run_period"
        standard_precipitation_index&time            = time
        standard_precipitation_index&ensemble_member = ensemble_member
        standard_precipitation_index&drought_index_run_period = drought_index_run_period
        standard_precipitation_index = (/ standard_precipitation_index@_FillValue /)
        standard_precipitation_index@description = "Standardized Precipitation Index"
        standard_precipitation_index@long_name   = "Standardized Precipitation Index"
        standard_precipitation_index@units       = ""
        delete(standard_precipitation_index@standard_name)
        standard_precipitation_index@comment1    = "McKee, T. B., N. J. Doeskin, and J. Kleist, 1993. The Relationship of Drought Frequency and Duration to Time Scales. Proc. 8th Conf. on Applied Climatology, January 17–22, 1993, American Meteorological Society, Boston, Massachusetts, pp. 179–184."
        standard_precipitation_index@comment2    = "Using Pearson type III distribution"

      res_spi = True
      res_spi@opt = 3

      do i = 0, n_indexlag-1
        standard_precipitation_index(:,:,i) = (/ dim_spi_n(precip,drought_index_run_period(i),res_spi,0)  /)
      end do


      do e = 0, n_ens-1

         pcp1d  = ndtooned(precip(:,e))
         tmp1d  = ndtooned(temperature(:,e)-273.15)
         sto1d  = ndtooned(tm_storage(:,e))
         dsto1d = ndtooned(tm_storage_change(:,e))
         def1d  = ndtooned(tm_deficit(:,e))
         rec1d  = ndtooned(tm_recharge(:,e))
         sur1d  = ndtooned(tm_surplus(:,e))
         evp1d  = ndtooned(tm_evaporation(:,e))
         pe1d   = ndtooned(tm_potevap(:,e))
         lat0d  = temperature@lat

         thornthwaite_budget_1d(lat0d,            \  ; degrees_north
                                baseline_storage, \  ; kg m-1
                                tmp1d,            \  ; degC
                                pcp1d,            \  ; kg m-1
                                pe1d,             \  ; kg m-1
                                evp1d,            \  ; kg m-1
                                sto1d,            \  ; kg m-1
                                dsto1d,           \  ; kg m-1
                                def1d,            \  ; kg m-1
                                rec1d,            \  ; kg m-1
                                sur1d             )  ; kg m-1



         precip(:,e)            = (/ pcp1d  /)
         temperature(:,e)       = (/ tmp1d  /)
         tm_storage(:,e)        = (/ sto1d  /)
         tm_storage_change(:,e) = (/ dsto1d /)
         tm_deficit(:,e)        = (/ def1d  /)
         tm_recharge(:,e)       = (/ rec1d  /)
         tm_surplus(:,e)        = (/ sur1d  /)
         tm_evaporation(:,e)    = (/ evp1d  /)
         tm_potevap(:,e)        = (/ pe1d   /)

      end do




      f->time              = time
      f->time_year         = time_year
      f->time_YYYYMM       = time_yyyymm
      f->year              = year
      f->month             = month

      f->tm_potevap        = tm_potevap
      f->tm_evaporation    = tm_evaporation
      f->tm_surplus        = tm_surplus
      f->tm_recharge       = tm_recharge
      f->tm_storage        = tm_storage
      f->tm_storage_change = tm_storage_change
      f->tm_deficit        = tm_deficit

      f->standard_precipitation_index = standard_precipitation_index

      delete(f)

      delete(time)
      delete(month)
      delete(year)
      delete(time_year)
      delete(time_yyyymm)
      delete(ensemble_member)
      delete(temperature)
      delete(precip)
      delete(standard_precipitation_index)

      delete(pcp1d)
      delete(tmp1d)
      delete(sto1d)
      delete(dsto1d)
      delete(def1d)
      delete(rec1d)
      delete(sur1d)
      delete(evp1d)
      delete(pe1d)

      delete(tm_potevap)
      delete(tm_evaporation)
      delete(tm_surplus)
      delete(tm_recharge)
      delete(tm_storage)
      delete(tm_storage_change)
      delete(tm_deficit)

      system("ncatted -O -h -a long_name,temperature,m,c,'2-m Air Temperature' " + filename4)
      system("ncatted -O -h -a description,temperature,m,c,'2-m Air Temperature' " + filename4)
      system("ncatted -O -h -a station_id,global,m,c,'"+formal_name(s)+"' " + filename4)
      system("ncatted -O -h -a location,global,m,c,'"+formal_name(s)+"' " + filename4)


      system("ncks -h --mk_rec_dmn time " + filename4 + " temp.nc")
      system("mv -v temp.nc " + filename4)

end if

   end do
   end do

end
