#######################################################
##                                                     #
##  Encounter Command File                             #
##                                                     #
##  Owner: austriamicrosystems                         #
##  HIT-Kit: Digital                                   #
##  version: 07-Aug-2012                               #
##                                                     #
########################################################

proc amsHelp {} {
    print "#### Available Functions" 
    print "---#     - amsDbSetup....................... Setup Database - read Config"
    print "---#     - amsUserGrid...................... Sets the grid for the IO-Cells"
    print "---#     - amsGlobalConnect type............ connects global nets: "
    print "---#                                               type = core | both"
    print "---#     - amsAddEndCaps.................... place Caps"
    print "---#     - amsSetMMMC ....................... set MultiMode"
    print "---#     - amsSetAnalysisView cond conslist.. set Analysis Views"
    print "---#     - amsFillcore ...................... places core filler cells"
    print "---#     - amsFillperi ...................... places periphery filler cells"
    print "---#     - amsRoute router................... run routing with: "
    print "---#                                               router = nano|wroute|wroute2(using 2CPUs)"
    print "---#     - amsWrite postfix ................. writes GDS, Verilog NL, SPEF, DB"
    print "---#     - amsWriteSDF4View viewList......... write SDF for all analysis views in list"
    print "---#     - amsZoomTo x y .................... zooms to coordinates x y"
    print "#### " 
} 

proc addAMSHKMenu {} {
   # add AMSMenu if Encounter version is higher or equal to 10
   set encVer [string range [getVersion] 0 [expr [string first . [getVersion]]-1]]
   if {$encVer >= 10} {
     uiAdd amsHKMenu -type menu -label "Hit-Kit Utilities" -in main
     uiAdd expCommand -type command -label "Wroute..." -command [list ::Rda_Route::RouteStdCell::create] -in amsHKMenu
     print "### austriamicrosystems HitKit-Utilities Menu added";}
}

proc amsDbSetup {} {
   ##--- Load configuration file
   loadConfig c35_None.conf 0
   commitConfig
   setCTSMode -bottomPreferredLayer 2
   setMaxRouteLayer 3
}


proc amsUserGrid {} {
   ##--- Set user grids
   setPreference ConstraintUserXGrid 0.1
   setPreference ConstraintUserXOffset 0.1
   setPreference ConstraintUserYGrid 0.1
   setPreference ConstraintUserYOffset 0.1
   setPreference SnapAllCorners 1
   setPreference BlockSnapRule 2

   snapFPlanIO -usergrid
}

proc amsGlobalConnect type {
   ##--- Define global power connects
   switch $type {
      "core" {
               set globalNetsList {{vdd! vdd!} {gnd! gnd!}}
               ##--- Define global Power nets - make global connections
             }
      "both" {
               ##--- Define global Power nets - make global connections
               clearGlobalNets
               set globalNetsList {{vdd! vdd!} {gnd! gnd!}}
               set globalNetsList [lappend globalNetsList {vdd3r1! vdd3r1!} {vdd3r2! vdd3r2!} {vdd3o! vdd3o!} {gnd3r! gnd3r!} {gnd3o! gnd3o!}]
             }
     }
     clearGlobalNets
     foreach net $globalNetsList {
        set n [lindex $net 0]
        set p [lindex $net 1]
        globalNetConnect $n -type pgpin -pin $p -inst * -module {}
        print "---# GlobalConnect all $p pins to net $n"
     }
}

proc amsSetMMMC {} {
    global topcellname
    global consList

    print "---# Setup MMMC\n---#"
    create_rc_corner -name ams_rc_corner_typ \
            -cap_table {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/encounter/c35b4_thick-typical.capTable} \
            -preRoute_res {1.0} \
            -postRoute_res {1.0} \
            -preRoute_cap {1.0} \
            -postRoute_cap {1.0} \
            -postRoute_xcap {1.0} \
            -qx_tech_file {/softslin/AMS_410_ISR15/assura/c35b4/c35b4thickall/RCX-typical/qrcTechFile}
    print "---#   rc_corner        : ams_rc_corner_typ"
    create_rc_corner -name ams_rc_corner_wc \
            -cap_table {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/encounter/c35b4_thick-worst.capTable} \
            -preRoute_res {1.0} \
            -postRoute_res {1.0} \
            -preRoute_cap {1.0} \
            -postRoute_cap {1.0} \
            -postRoute_xcap {1.0} \
            -qx_tech_file {/softslin/AMS_410_ISR15/assura/c35b4/c35b4thickall/RCX-worst/qrcTechFile}
    print "---#   rc_corner        : ams_rc_corner_wc"
    create_rc_corner -name ams_rc_corner_bc \
            -cap_table {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/encounter/c35b4_thick-best.capTable} \
            -preRoute_res {1.0} \
            -postRoute_res {1.0} \
            -preRoute_cap {1.0} \
            -postRoute_cap {1.0} \
            -postRoute_xcap {1.0} \
            -qx_tech_file {/softslin/AMS_410_ISR15/assura/c35b4/c35b4thickall/RCX-best/qrcTechFile}
    print "---#   rc_corner        : ams_rc_corner_bc"

    create_library_set -name libs_min -timing { \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_CORELIB_BC.lib \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_IOLIB_BC.lib \
    }
    create_library_set -name libs_max -timing { \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_CORELIB_WC.lib \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_IOLIB_WC.lib \
    }
    create_library_set -name libs_typ -timing { \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_CORELIB_TYP.lib \
               /softslin/AMS_410_ISR15/liberty/c35_3.3V/c35_IOLIB_TYP.lib \
   }
   print "---#   lib-sets         : libs_min, libs_max, libs_typ"

   foreach cons $consList {
      set filename [format "CONSTRAINTS/%s_%s.sdc" $topcellname $cons]
      create_constraint_mode -name $cons -sdc_files $filename
   }
   print "---#   constraint-modes : $consList"

   create_delay_corner -name corner_min -library_set {libs_min} -opcond_library {c35_CORELIB_BC} -opcond {BEST-MIL} -rc_corner {ams_rc_corner_bc}
   create_delay_corner -name corner_max -library_set {libs_max} -opcond_library {c35_CORELIB_WC} -opcond {WORST-MIL} -rc_corner {ams_rc_corner_wc}
   create_delay_corner -name corner_typ -library_set {libs_typ} -opcond_library {c35_CORELIB_TYP} -opcond {TYPICAL} -rc_corner {ams_rc_corner_typ}
    print "---#   delay-corners    : corner_min, corner_max, corner_typ"

    print "---#   analysis-views   : "
    foreach cons $consList {
      foreach corner {"min" "max" "typ"} {
        set avname [format "%s_%s" $cons $corner]
        set cname [format "corner_%s" $corner]
        create_analysis_view -name $avname -constraint_mode $cons -delay_corner $cname 
	print "---#          #  Name: $avname  # Constraint-Mode: $cons # Corner: $cname"
      }
    }

    print "---#\n---# use following command to show analysis view definitions\n         report_analysis_view \n"
}


proc amsSetAnalysisView {cond consList} {
    
    switch $cond {
      "typ"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_typ" $cons]
                    set viewList [lappend viewList $avname]
                 }
                 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "minmax" { 
		 set maxviewList {}
		 set minviewList {}
                 foreach cons $consList {
		    set maxavname [format "%s_max" $cons]
                    set maxviewList [lappend maxviewList $maxavname]
		    set minavname [format "%s_min" $cons]
                    set minviewList [lappend minviewList $minavname]
                 }
                 set_analysis_view -setup $maxviewList -hold $minviewList
	       } 
      "min"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_min" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      "max"    { 
                 set viewList {}
                 foreach cons $consList {
		    set avname [format "%s_max" $cons]
                    set viewList [lappend viewList $avname]
                 }
		 set_analysis_view -setup $viewList -hold $viewList
	       } 
      }
}


proc amsAddEndCaps {} {
   ##-- add CAP cells
   addEndCap -preCap ENDCAPL -postCap ENDCAPR -prefix ENDCAP
}


proc amsFillcore {} {
   ##-- Add Core Filler cells
   addFiller -cell FILL25 FILL10 FILL5 FILL2 -prefix FILLER
   addFiller -cell FILLRT25 FILLRT10 FILLRT5 FILLRT2 FILLRT1 -prefix FILLERRT
}

proc amsFillperi {} {
   ##-- Add Peri Filler cells
   set fillerList {100_P 50_P 20_P 10_P 5_P 2_P 1_P 01_P}
   foreach fillcell $fillerList {
      addIoFiller -cell PERI_SPACER_$fillcell -prefix pfill
   }
}

proc amsRoute {{router wroute}} {
    switch $router {
      "nano" { 
               ##-- Run Routing
               ##-- Nano-Route
               setMaxRouteLayer 3
               routeDesign -globalDetail
             }
    "wroute" {
               ##-- WROUTE
             wroute -topLayerLimit 3
             }
    "wroute2" {
               ##-- WROUTE
             wroute -topLayerLimit 3 -multiCpu 2
             }
     }
}

proc amsSave postfix {
   global topcellname
   global dbdir
   set filename [format "%s/%s_%s.enc" $dbdir $topcellname $postfix]
   saveDesign $filename
}

proc amsWrite postfix {
   global topcellname
   ##-- Save Design
   amsSave $postfix
   ##-- Write DEF
   set filename [format "DEF/%s_%s.def" $topcellname $postfix]
   defOut -floorplan -netlist -routing $filename
   ##-- Write GDS2
   set filename [format "%s_%s_fe.gds" $topcellname $postfix]
   streamOut $filename -mapFile gds2.map -libName DesignLib -structureName $topcellname \
         -attachInstanceName 13 -attachNetName 13 -stripes 1 -units 1000 -mode ALL

   ##-- Verilog Netlist
   set filename [format "%s_%s.v" $topcellname $postfix]
   saveNetlist $filename
   ##-- Verilog Netlist with FILLCAP cells
   set filename [format "%s_%s_fillcap.v" $topcellname $postfix]
   saveNetlist $filename -excludeLeafCell -includePhysicalInst \
                         -excludeCellInst { FILLRT1 FILLRT2 FILLRT5 FILLRT10 FILLRT25 FILL1 ENDCAPL ENDCAPR ENDCAP \
                                            PERI_SPACER_100_P PERI_SPACER_50_P PERI_SPACER_20_P PERI_SPACER_10_P PERI_SPACER_5_P PERI_SPACER_2_P PERI_SPACER_1_P PERI_SPACER_01_P CORNERP \
                                          }

   ##-- Extract detail parasitics
   set filename [format "SDF/%s_%s.rcdb" $topcellname $postfix]
   setExtractRCMode -engine postRoute -effortLevel low
   extractRC
   set filename [format "SDF/%s_%s.spef" $topcellname $postfix]
   rcOut -spef $filename
   
   ##-- run QRC extraction
   setExtractRCMode -engine postRoute -effortLevel signoff
   extractRC 
   set filename [format "SDF/%s_%s_qrc.spef" $topcellname $postfix]
   rcOut -spef $filename

}


##--  write SDF for a specific analysis view
proc amsWriteSDF4View {viewList} {
   global topcellname

   set sdfver 2.1

   foreach view $viewList {
      set filename [format "SDF/%s_%s.sdf" $topcellname $view]
      print "---# Analysis View: $view\n"

      switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -view $view $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -view $view $filename
         ##-- additional for verilog XL: -splitrecrem
                }
      }
      print "---# Created SDF: $filename\n"
   }
}

##--  write SDF for a specific analysis view
proc amsWriteSDFbtw {minview typview maxview} {
   global topcellname

   set sdfver 2.1

   set filename [format "SDF/%s_all.sdf" $topcellname]

   switch $sdfver {
         "2.1"  { write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
                     -remashold -splitrecrem -splitsetuphold -force_calculation \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
                }
         "3.0"  { write_sdf -version 3.0 -prec 3 -edges check_edge \
                     -force_calculation -average_typ_delays \
                     -min_view $minview -typ_view $typview -max_view $maxview $filename
         ##-- additional for verilog XL: -splitrecrem
                }
   }
      print "---# Created SDF: $filename\n"
}

##-- Other usefule procedures

proc amsZoomTo {x y {factor 10}} {
   set llx [expr {$x - $factor}]
   set lly [expr {$y - $factor}]
   set urx [expr {$x + $factor}]
   set ury [expr {$y + $factor}]
   zoomBox $llx $lly $urx $ury
}
##-- End of First Encounter TCL command file

proc protoSDF {} {
    amsDbSetup
    amsSetMMMC
    amsSetAnalysisView minmax {func}
    floorplan -r 1.0 0.8 2 2 2 2
    setPlaceMode -fp true -timingDriven false -reorderScan false -doCongOpt false -modulePlan false
    placeDesign -noPrePlaceOpt
    trialRoute -maxRouteLayer 3 -floorplanMode
    extractRC
    amsWriteSDF4View {func_max func_min}
}


proc amsFloorplan {type util iodist {ratio 1.0}} {
  ##-- Initialize floorplan
  switch $type {
     "core" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
            }
     "peri" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
              ##--- Load corner io file to add corner cells (if necessary)
              loadIoFile corners.io
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist

              ##-- Snap IO cells to user grid
              snapFPlanIO -usergrid
            }
  }
  ##-- Place Macros 
  ##-- Create Placement Blockages
  ##createObstruct llx lly urx ury 
  ##-- Cut Rows under Macros, Halos and Blockages
  ##cutCoreRow
  fit
}

proc amsPowerRoute {{pownetsList {}}} {
   set offset 0.8
   set spacing 0.8
   # foreach power net in the specified list
   # route a ring
   foreach pownet $pownetsList {
      set name [lindex $pownet 0]
      set width [lindex $pownet 1]
      print "----$name $width $offset----"
      addRing \
                  -width_left   $width -spacing_left   $spacing -offset_left   $offset -layer_left   MET2 \
	          -width_top    $width -spacing_top    $spacing -offset_top    $offset -layer_top    MET1 \
	          -width_right  $width -spacing_right  $spacing -offset_right  $offset -layer_right  MET2 \
	          -width_bottom $width -spacing_bottom $spacing -offset_bottom $offset -layer_bottom MET1 \
	          -stacked_via_top_layer MET3 \
	          -stacked_via_bottom_layer MET1 \
	          -around core \
	          -jog_distance 0.7 \
	          -threshold 0.7 \
	          -nets $name
      set offset [ expr $offset + $spacing + $width]
   }
   # do followpin routing
   sroute -connect { blockPin padPin corePin floatingStripe }
}


proc amsTa {state} {

    global topcellname
    switch $state {
         "prePlace"  { timeDesign -prePlace -outDir timingReports -expandedViews }
         "preCTS"    { timeDesign -preCTS   -outDir timingReports -expandedViews }
         "postCTS"   { timeDesign -postCTS  -outDir timingReports -expandedViews
                       timeDesign -postCTS -hold -outDir timingReports -expandedViews
                     }
         "postRoute" { timeDesign -postRoute -outDir timingReports -expandedViews
                       timeDesign -postRoute -hold -outDir timingReports -expandedViews
                     }
         "signOff"   { timeDesign -signOff -outDir timingReports -expandedViews
                       timeDesign -signOff -hold -outDir timingReports -expandedViews
                     }
    }
}


proc amsPlace how {
   ##-- Placement
   switch $how {
      "ntd"   { 
                 setPlaceMode -timingdriven false -reorderScan false -congEffort medium \
                              -doCongOpt false -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "td"    { 
                 setPlaceMode -timingdriven true -reorderScan false -congEffort medium \
                              -doCongOpt false -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "opt"   {
                 setPlaceMode -timingdriven true -reorderScan false -congEffort high \
                              -doCongOpt -modulePlan false
                 placeDesign -inPlaceOpt -prePlaceOpt
              }
   }
   amsSave placed

}

proc amsCts {} {
   global topcellname
   set filename [format "CONSTRAINTS/%s.ctstch" $topcellname]
   ##-- Specify Clock tree
   specifyClockTree -file $filename

   ##-- delete existing buffers
   #deleteClockTree -clk  <clockroot>

   ##-- Run CTS
   set filename1 [format "%s_cts.guide" $topcellname]
   set filename2 [format "%s_cts.ctsrpt" $topcellname]
   ckSynthesis -rguide $filename1 -report $filename2

   amsSave clkplaced
}

proc amsIncrRoute {maxerror} {
  set fehler  1000
  set filename [getLogFileName]
  clearDrc
  set step 0
  set lastfehler 1000 
  while {$fehler > $maxerror} {
     if { $step < 4 } {
	       print "---# amsIncrRoute : start in incrFinal Mode ($step)"
        wroute -mode incrFinal -topLayerLimit 3
     } else {
	       print "---# amsIncrRoute : start in incrGlobalAndFinal Mode ($step)"
        wroute -mode incrGlobalAndFinal -topLayerLimit 3
	       set step 0
     }
     set chan [open $filename]
     while {[gets $chan line] >= 0} {
         if {[scan $line "Total number of violations           =        %d" f] == 1} {
            set fehler $f
         }
     }
     if {$fehler > $lastfehler} {
	       set step [expr $step + 1]
     } else {
        set step 0
        set lastfehler $fehler
	       amsSave routedIncr
     }
     close $chan
     if {$fehler > $maxerror} { 
        print "---# Still $fehler errors - starting wroute again"
     } else { 
        print "---# amsIncrRroute stopped with $fehler errors"
     }
  }
}

proc amsDefIn { defFile {rowtype "standard"} {l 2} {t 2} {r 2} {b 2} {addwidth 0} {addheight 0}} {
  
  global topcellname

  # open DEF File
  # find diearea
  set chan [open $defFile]
  while {[gets $chan line] >= 0} {
     # units for dividing coordinates
     if {[scan $line " UNITS DISTANCE MICRONS %d" u] == 1} {
            set units $u
	    print "---# DEF Units: $units"
     }
     # diearea 
     if {[scan $line " DIEAREA ( %f %f ) ( %f %f )" x1 y1 x2 y2] == 4} {
         set llx [expr ($x1 / $units)]
	 set lly [expr $y1 / $units]
	 set urx [expr $x2 / $units]
	 set ury [expr $y2 / $units]
	 print "---# DEF DieArea: $llx:$lly/$urx:$ury"
     }
  }
  close $chan
  # calculate core area for rows
  set llxc [expr $llx + $l]
  set llyc [expr $lly + $b]
  set urxc [expr $urx - $r]
  set uryc [expr $ury - $t]
  #floorPlan -b $llx $lly $urx $ury 
  floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                   $llx $lly $urx $ury \
                                   $llxc $llyc $urxc $uryc
  # load def file
  defIn $defFile


  # if the die size should be changed
  if {$addwidth != 0 || $addheight != 0} {
     print "---# Adding width: $addwidth"
     print "---# Adding height: $addheight"
     # write IO-File to get a pin locations file
     set filename [format "%s_save.io" $topcellname]
     saveIoFile -locations $filename

     # new die sizes
     set llx [expr $x1 / $units]
     set lly [expr $y1 / $units]
     set urx [expr ($x2 / $units) + $addwidth]
     set ury [expr ($y2 / $units) + $addheight]
     set llxc [expr $llx + $l]
     set llyc [expr $lly + $b]
     set urxc [expr $urx - $r]
     set uryc [expr $ury - $t]
     floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                 $llx $lly $urx $ury \
                                 $llxc $llyc $urxc $uryc
     # load pin positions
     loadIoFile $filename
 
  }

}

proc amsPortList {filename} {
  print "---# Write PinList to File: $filename"
  deselectAll
  selectIOPin *
  reportSelect
  deselectAll
  print "---# End Write PinList"
  print "---# Writing Ports to File now: $filename"

  set logFile [getLogFileName]


  set pins 0
  set chan [open $logFile]
  while {[gets $chan line] >= 0} {
     if {[regexp "<CMD" $line] != 1 &&[regexp "^---# Write PinList to File" $line] == 1} {
        set pins 1
        set ochan [open $filename w]
        set nrofpins 0
     }
     if {$pins == 1} {
       if {[scan $line " Name : %s " n] == 1} {
         set pinname $n
       }
       if {[scan $line " Layer : %s " l] == 1} {
         set pinlayer $l
       }
       if {[scan $line " Location : %f %f " x y] == 2} {
         set xCoord $x
         set yCoord $y
         puts $ochan "$pinname $pinlayer $xCoord $yCoord"
         incr nrofpins
       }
     }
     if {[regexp "<CMD" $line] != 1 && [regexp "^---# End Write PinList" $line] == 1} {
        set pins 0
        close $ochan
     }
  }
  print "---# $nrofpins Ports found"

}


proc amsStat projname {
   global topcellname

   set statdir [format "%s_%s_stat" $projname $topcellname]
   print "####"
   print "---# Creating Statistics in directory $statdir";
   system mkdir -p $statdir
   print "---#    Directory $statdir created";
   print "---#    running defStat.pl -> $statdir/$statdir.txt";
   defOut -floorplan -netlist -routing $statdir/$topcellname.def
   system defStatv2.pl -d $statdir/$topcellname.def \
                       -p $projname \
                       -t c35b4 \
                       /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef \
                       /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef \
		              ./LEF/*.lef > $statdir/$statdir.txt
   system mv bar.html $statdir
   print "---#    Creating Screen Dump $statdir/$topcellname.gif";
   fit
   dumpToGIF $statdir/$topcellname.gif
   print "---#    Creating Wire Statistics $statdir/$topcellname.wires";
   reportWire -detail $statdir/$topcellname.wires
   print "---# Finished";
   print "####"

}

  print "---# TCL Script amsSetup.tcl loaded"
##-- End of First Encounter TCL command file

