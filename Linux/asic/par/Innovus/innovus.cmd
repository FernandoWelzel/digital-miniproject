#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Apr 26 18:42:47 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
print {---# TCL Script amsSetup.tcl loaded}
set init_layout_view {}
set init_verilog ./INPUT_DATA/filter_io.v
set init_mmmc_file ./view_definition.tcl
set init_lef_file {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/c35b4.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef}
set init_top_cell filter_io
set init_gnd_net {gnd! gnd3r! gnd3o!}
set init_pwr_net {vdd! vdd3r1! vdd3r2! vdd3o!}
set cts_cell_list {CLKIN0 CLKIN1 CLKIN2 CLKIN3 CLKIN4 CLKIN6 CLKIN8 CLKIN10 CLKIN12 CLKIN15 CLKBU2 CLKBU4 CLKBU6 CLKBU8 CLKBU12 CLKBU15}
set init_verilog {./network_netlist.v ./network_io.sv}
set init_layout_view {}
set init_verilog ./INPUT_DATA/filter_io.v
set init_mmmc_file ./view_definition.tcl
set init_lef_file {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/c35b4.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef}
set init_top_cell filter_io
set init_gnd_net {gnd! gnd3r! gnd3o!}
set init_pwr_net {vdd! vdd3r1! vdd3r2! vdd3o!}
set cts_cell_list {CLKIN0 CLKIN1 CLKIN2 CLKIN3 CLKIN4 CLKIN6 CLKIN8 CLKIN10 CLKIN12 CLKIN15 CLKBU2 CLKBU4 CLKBU6 CLKBU8 CLKBU12 CLKBU15}
set init_layout_view {}
set init_verilog ./INPUT_DATA/network_io.v
set init_mmmc_file ./view_definition.tcl
set init_lef_file {/softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/c35b4.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_ISR15/cds/HK_C35/LEF/c35b4/IOLIB_4M.lef}
set init_top_cell filter_io
set init_gnd_net {gnd! gnd3r! gnd3o!}
set init_pwr_net {vdd! vdd3r1! vdd3r2! vdd3o!}
set cts_cell_list {CLKIN0 CLKIN1 CLKIN2 CLKIN3 CLKIN4 CLKIN6 CLKIN8 CLKIN10 CLKIN12 CLKIN15 CLKBU2 CLKBU4 CLKBU6 CLKBU8 CLKBU12 CLKBU15}
