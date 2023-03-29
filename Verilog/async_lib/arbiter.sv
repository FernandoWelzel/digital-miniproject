//==============================================================================
//  Filename    : arbiter.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Parametrizable arbiter based on arbiter of 2 bits
//==============================================================================
module arbiter #(
  parameter integer input_size = 8 // Number of requests to be treated in the previous layer
  )(
  input     logic [input_size:0] req_in,  // Request input vector 
  output    logic [input_size:0] ack_in, // Acknoledge output vector  

  output    logic       req_out, // Request output vector 
  input     logic       ack_out, // Acknoledge input vector
);

// == Variable declaration ======================================================
integer arb_layer_1 = (input_size + input_size%2);
integer num_layers  = ceil(log2(arb_layer_1));
integer i, j;

// == Instantiation =============================================================


// == Block connection ==========================================================

endmodule
