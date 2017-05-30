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
                "Yankton" /)


formal_name = (/ "Fort Peck, MT",  \
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
                 "Yankton, SD" /)


                 formal_name    := (/ "Osage Nation, OK" /)

                 loc_string    := (/  "Osage_Nation"   /)
                 loc_lat       := (/   36.629958 /); deg north
                 loc_lon       := (/   -96.399489 /)+ 360.0 ; deg east
                 directory := loc_string



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




      logg  = "./" + directory(s) + "/" \
                       + filepref(s)         \
                       + rcp2(r)+".inventory.txt"

      pdffile = "./" + directory(s) + "/" \
                       + filepref(s) + ".Boxwhisker.Monthly"


      print("processing "+filename)
      print( "/usr/local/netcdf/bin/nccopy -4 -d 9 -u -s "+filename + " deleteme.nc4")
      system("/usr/local/netcdf/bin/nccopy -4 -d 9 -u -s "+filename + " deleteme.nc4")
      if (isfilepresent("deleteme.nc4")) then
         print("mv -v  deleteme.nc4 " + filename)
         system("mv -v  deleteme.nc4 " + filename)
      end if

      print("ncatted -a cesm_topo,global,d,,  "+filename + " deleteme.nc4")
      system("ncatted -a cesm_topo,global,d,,  "+filename + " deleteme.nc4")
      if (isfilepresent("deleteme.nc4")) then
         print("mv -v  deleteme.nc4 " + filename)
         system("mv -v  deleteme.nc4 " + filename)
      end if


      system("ncdump -h "+ filename + " >& "+logg)



   end do
   end do

end
