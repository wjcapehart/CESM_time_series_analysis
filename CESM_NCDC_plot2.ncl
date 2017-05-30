
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


begin

   directory = "./"

   ncdcdata = "/accounts/wcapehar/Thornthwaite/NCL/ncdc_divisional_climate_zone_data_and_thornthwaite_mather_water_budgets_1895-2016.nc"


   staid  = (/    "Kalispel",      \
                  "Oneida",      \
                  "MesaGrande",      \
                  "TurtleMountain", \
                  "PineRidge",  \
                  "Taos"/)

   staid_label = (/ "Kalispel, WA",    \
                    "Oneida, WI",  \
                    "Mesa Grande Band (Mission), CA",  \
                    "Turtle Mountain, ND" , \
                    "Pine Ridge, SD",\
                    "Taos Pueblo, NM" /)


    ncdc_zone = (/ 4809, \
                   4703, \
                   0407, \
                   3203, \
                   3905, \
                   2902  /)  ;


   scenario = (/ ".b.e11.BRCP85C5CNBDRD.f09_g16", ".b.e11.BRCP45C5CNBDRD.f09_g16" /)
   scenarioname = (/ "RCP 8.5", "RCP 4.5" /)

   variable = (/ "temperature", "precip" /)

   n_scen = dimsizes(scenario)
   n_var  = dimsizes(variable)
   n_sta  = dimsizes(staid)


  mkres_85                  = True
  mkres_85@gsMarkerSizeF    = 0.0025
  mkres_85@gsMarkerOpacityF = 0.25   ; Make the markers translucent!
  mkres_85@gsMarkerIndex    =  16          ; dptr
  mkres_85@gsMarkerColor    = 18 ; "Pink"; (/ 1., 0. , 1. /)

  mkres_45                  = True
  mkres_45@gsMarkerSizeF    = 0.0025
  mkres_45@gsMarkerOpacityF = 0.25   ; Make the markers translucent!
  mkres_45@gsMarkerIndex    =  16          ; dptr
  mkres_45@gsMarkerColor    = 6; "Cyan"; "(/ 0., 1. , 1. /)


  mkres_nc                  = True
  mkres_nc@gsMarkerSizeF    = 0.0025
  ;mkres_nc@gsMarkerOpacityF = 0.25   ; Make the markers translucent!
  mkres_nc@gsMarkerIndex    =  16          ; dptr
  mkres_nc@gsMarkerColor    = 26; "(/ 0., 1. , 1. /)

  lnres_85                  = True
  lnres_85@gsLineThicknessF  = 2
  lnres_85@gsLineOpacityF    = 0.75   ; Make the markers translucent!
  lnres_85@gsLineDashPattern =  "SolidLine"         ; dptr
  lnres_85@gsLineColor       = "Red" ; "Pink"; (/ 1., 0. , 1. /)

  lnres_45                   = True
  lnres_45@gsLineThicknessF  = 2
  lnres_45@gsLineOpacityF    = 0.75   ; Make the markers translucent!
  lnres_45@gsLineDashPattern = "SolidLine"          ; dptr
  lnres_45@gsLineColor       = "Blue"; "Cyan"; "(/ 0., 1. , 1. /)

  lnres_nc                   = True
  lnres_nc@gsLineThicknessF  = 1
  ;lnres_nc@gsLineOpacityF    = 0.75   ; Make the markers translucent!
  lnres_nc@gsLineDashPattern = "SolidLine"          ; dptr
  lnres_nc@gsLineColor       = "Black"



;***********************************************
; legend resources
;***********************************************
  lgres                    = True
  lgres@lgLineColors     = (/ "Red", "Blue", "Black" /)
  lgres@lgMarkerColors     = (/ 18, 6, 26 /)
  lgres@lgMonoMarkerIndex    = True
  lgres@lgMarkerIndex    =  16          ; dptr
  lgres@lgMonoDashIndex   = True
  lgres@lgLineThicknessF   = 2  ; legend line thickness = contour line thickness
  lgres@lgItemType         = "MarkLines"        ; show lines only (default)
  lgres@lgLabelFontHeightF = .08            ; set the legend label font thickness
  lgres@vpWidthF           = 0.5           ; width of legend (NDC)
  lgres@vpHeightF          = 0.075            ; height of legend (NDC)
  lgres@lgPerimOn       = False       ; draw the box perimeter in orange
 ; lgres@lgPerimThicknessF  = 5.0            ; thicken the box perimeter

 amres = True
  amres@amParallelPosF   = -0.15		    ; move legend to the right
  amres@amOrthogonalPosF = -0.45             ; move the legend down

       fncdc = addfile(ncdcdata,"r")




   do i = 0, n_sta-1
       print("===========")


       time_ncdc0 = fncdc->caldate(:,:)
       temp_ncdc0 = fncdc->mean_monthly_temperature({ncdc_zone(i)},:,:)
       prec_ncdc0 = fncdc->total_monthly_precip({ncdc_zone(i)},:,:)

       lon_ncdc = fncdc->zone_central_longitude({ncdc_zone(i)})
       lat_ncdc = fncdc->zone_central_latitude({ncdc_zone(i)})

       print(" "+ncdc_zone(i)+" "+ \
                 fncdc->state_and_zone_string({ncdc_zone(i)})+ " "+ " " +lon_ncdc+"degE "+lat_ncdc+"degN")

       time_ncdc = ndtooned(time_ncdc0)
          time_ncdc@description =  "NCDC monthly time"
          time_ncdc@units       =  time_ncdc0@units
          time_ncdc!0           = "time_ncdc"
          time_ncdc&time_ncdc   =  time_ncdc

       temp_ncdc = ndtooned(temp_ncdc0) + 273.15
          temp_ncdc@units        = "K"
          temp_ncdc@description  = temp_ncdc0@description
          temp_ncdc!0            = "time_ncdc"
          temp_ncdc&time_ncdc    =  time_ncdc

       prec_ncdc = ndtooned(prec_ncdc0)
          prec_ncdc@units       = prec_ncdc0@units
          prec_ncdc@description = prec_ncdc0@description
          prec_ncdc!0           = "time_ncdc"
          prec_ncdc&time_ncdc   =  time_ncdc


      f85 = addfile(directory+staid(i)+scenario(0)+".nc", "r" )
      f45 = addfile(directory+staid(i)+scenario(1)+".nc", "r" )

      time_85 = f85->time_year
      time_45 = f45->time_year

         time_85!0 = "time_85"
         time_45!0 = "time_45"

         time_85&time_85 = time_85
         time_45&time_45 = time_45




      res85 = True
         res85@xyMonoLineColor = True
         res85@xyMonoMarkerColor = True
         res85@gsnDraw      = False     ; don't draw
         res85@gsnFrame     = False     ; don't advance frame
         res85@xyMarkerColor  = "Pink"    ; don't advance frame
         res85@xyLineColor    = "Pink"    ; don't advance frame
         res85@tiMainString = staid_label(i)  ; don't advance frame
         res85@xyMarkLineMode   = "Markers"                ; choose which have markers
         res85@xyMarkers          =  16                      ; choose type of marker
         res85@xyMarkerSizeF     = 0.001                     ; Marker size (default 0.01)
         res85@trXMinF  = min(time_85)                   ; min value on y-axis
         res85@trXMaxF  = max(time_85)                ; max value on y-axis
         res85@gsnMaximize  = True            ; max value on y-axis




      do v = 0,  n_var-1


         wks01 =  gsn_open_wks ("png","./CESM."+staid(i)+".01-yearRA."+variable(v))
          gsn_define_colormap(wks01,"default")

         var_85 = f85->$variable(v)$
         var_45 = f45->$variable(v)$
               print(staid(i) + " " + variable(v)+ " " + var_85@cell_methods)

         if (v .eq. 0) then
            var_ncdc = temp_ncdc
         end if

         if (v .eq. 1) then
            var_ncdc = prec_ncdc
         end if

        legend_labels = (/ "RCP 8.5 12-mo & 30-yr running monthly averages", \
                           "RCP 4.5 12-mo & 30-yr running monthly averages", \
                           "NCDC    12-mo & 30-yr running monthly averages"  /)



         var_85!1 = "time_85"
         var_45!1 = "time_45"

         var_85&time_85 = time_85
         var_45&time_45 = time_45

         nsnt_85 = dimsizes(var_85)
         nsnt_45 = dimsizes(var_45)

            rav85   = runave_Wrap(  var_85,12,0)
            rav45   = runave_Wrap(  var_45,12,0)
            ravncdc = runave_Wrap(var_ncdc,12,0)


            rav85_l   = runave_Wrap(var_85  ,30*12,0)
            rav45_l   = runave_Wrap(var_45  ,30*12,0)
            ravncdc_l = runave_Wrap(var_ncdc,30*12,0)

         if (var_85@cell_methods .ne. "time:sum") then




             legend_labels = (/ "RCP 8.5 12-mo & 30-yr running annual totals",   \
                                "RCP 4.5 12-mo & 30-yr running annual totals",   \
                                "NCDC    12-mo & 30-yr running annual totals" /)


            print("   - sum values")
            print("   "+var_45@long_name + "("+var_45@units+")")
            print("   "+var_85@long_name + "("+var_85@units+")")
            print("   "+var_ncdc@description + "("+var_ncdc@units+")")

         end if



         if (var_85@cell_methods .eq. "time:sum") then


            rav45(:,:)   = (/ rav45     *12 /)
            rav45_l(:,:) = (/ rav45_l   *12  /)
            rav85(:,:)   = (/ rav85     *12 /)
            rav85_l(:,:) = (/ rav85_l   *12 /)

            ravncdc(:)   = (/ ravncdc   *12 /)
            ravncdc_l(:) = (/ ravncdc_l *12 /)



             legend_labels = (/ "RCP 8.5 12-mo & 30-yr running annual totals",   \
                                "RCP 4.5 12-mo & 30-yr running annual totals",   \
                                "NCDC    12-mo & 30-yr running annual totals" /)


            print("   - sum values")
            print("   "+var_45@long_name + "("+var_45@units+")")
            print("   "+var_85@long_name + "("+var_85@units+")")
            print("   "+var_ncdc@description + "("+var_ncdc@units+")")

         end if






         rav85@long_name = var_85@long_name
         rav85@units     = var_85@units

         res85@gsnLeftString  =  var_85@long_name
         res85@gsnRightString =  var_85@units

         res85@trYMinF  = min((/  min(rav85), min(rav45)    /)) ; min value on y-axis
         res85@trYMaxF  = max((/  max(rav85), max(rav45)    /)) ; max value on y-axis





        plot  = gsn_csm_xy(wks01, (/ 0, 0 /), (/ 0,0  /), res85)


       ;  plot  = gsn_csm_xy(wks01, time_85, rav85, res85)

        do ens = 0, nsnt_85(0)-1
            gsn_polymarker(wks01,plot,time_85,rav85(ens,:),mkres_85)
        end do
        do ens = 0, nsnt_45(0)-1
            gsn_polymarker(wks01,plot,time_45,rav45(ens,:),mkres_45)
        end do


        do ens = 0, nsnt_85(0)-1
            gsn_polyline(wks01,plot,time_85,rav85_l(ens,:),lnres_85)
        end do
        do ens = 0, nsnt_45(0)-1
            gsn_polyline(wks01,plot,time_45,rav45_l(ens,:),lnres_45)
        end do

        gsn_polymarker(wks01, plot, time_ncdc, ravncdc,   mkres_nc)

        gsn_polymarker(wks01, plot, time_ncdc, ravncdc_l, lnres_nc)





  lbid = gsn_create_legend(wks01,3,legend_labels,lgres)         ; create legend
  annoid1 = gsn_add_annotation(plot,lbid,amres)   ; add legend to plot

   if (f85@longitude .lt. 180) then
      stat_lonstring =  sprintf("%7.2f E", f85@longitude)
   else
      stat_lonstring =  sprintf("%7.2f W", (-1.*(f85@longitude-360.)))
   end if


   if (f85@cesm_lon .lt. 180) then
      cesm_lonstring =  sprintf("%7.2f E", f85@latitude)
   else
      cesm_lonstring =  sprintf("%7.2f W", (-1.*(f85@cesm_lon-360.)))
   end if

   ncdc_lonstring =  sprintf("%7.2f W", (-1.*(lon_ncdc)))


   station_location_text = "Station Location:" + sprintf("%7.2f N", f85@latitude) + stat_lonstring
   cesm_location_text    = "CESM Location: "    + sprintf("%7.2f N", f85@cesm_lat) + cesm_lonstring
   ncdc_location_text    = "NCEI Location:  "    + sprintf("%7.2f N", lat_ncdc    ) + ncdc_lonstring

   stationll_res = True
      stationll_res@txJust = "BottomLeft"
      stationll_res@txFontHeightF = 0.015                    ; font smaller. default big

  gsn_text_ndc(wks01,station_location_text,   0.185,   0.765,stationll_res)

   cesmll_res = True
      cesmll_res@txJust = "TopLeft"
      cesmll_res@txFontHeightF = stationll_res@txFontHeightF                   ; font smaller. default big


  gsn_text_ndc(wks01,cesm_location_text,   0.185,   0.755,cesmll_res)
  gsn_text_ndc(wks01,ncdc_location_text,   0.185,   0.73,cesmll_res)

         draw(plot)
         frame(wks01)
        delete(wks01)


         delete(var_85)
         delete(var_45)
         delete(var_ncdc)
         delete(rav85)
         delete(rav45)
         delete(ravncdc)
         delete(rav85_l)
         delete(rav45_l)
         delete(ravncdc_l)

      end do



     delete(time_85)
     delete(time_45)
     delete(f85)
     delete(f45)


   end do


   delete(fncdc)

end
