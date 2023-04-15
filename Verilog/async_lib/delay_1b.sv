//==============================================================================
//  Filename    : delay_1b.sv                                         
//  Designer    : Fernando WELZEL
//  Description : 1 bit delay module with parametrizable delay
//==============================================================================
module delay_1b # (
  parameter integer delay = 1 // Delay set by block 
)(
  input  logic  data_in,  // Input value
  output logic data_out   // Output value
);

// == Set time format =========================================================
timeunit      1ns;
timeprecision 1ns;

// == Behavioral synthesis ====================================================
always @* begin
  #delay data_out <= data_in;
end

endmodule
