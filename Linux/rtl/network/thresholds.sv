//==============================================================================
//  Filename    : thresholds.sv                                         
//  Designer    : Fernando WELZEL
//  Description : The thresholds for the neurons
//==============================================================================
package thresholds_pkg;

localparam [7:0] [7:0] thresholds_layer1  = 
  { 8'h3e,
    8'h39,
    8'h3d,
    8'h3a,
    8'h3f,
    8'h3e,
    8'h39,
    8'h3a };

localparam [7:0] [7:0] thresholds_layer2  = 
  { 8'h7f,
    8'h7f };

endpackage