//==============================================================================
//  Filename    : Neuron                                         
//  Designer    : Fernando WELZEL ENGELS
//  Description : Parametric spiking neuron desing to be used in neural networks.
//==============================================================================
module neuron #(
  parameter integer                        n_size = 32,   // Number size - Number of bits of the input numbers
  parameter integer                        b_size = 32,   // Bus size - Number of inputs of our neuron
  parameter integer       o_size = 2*n_size + b_size/2 // Size of output number 
  )(
  input  logic        [b_size-1:0][n_size-1:0] data_in, // Input values
  input  logic        [b_size-1:0][n_size-1:0] weights, // Weights to be applied to the numbers
  output logic    [2*n_size + b_size/2 - 1:0] data_out  // Output value  
);

// == Variables Declaration ====================================================
logic [b_size-1:0][2*n_size-1:0] mult_line;
integer i;

// == Main Code ================================================================
always @ ( data_in ) begin
  
  for( i = 0, data_out = 0; i < b_size; i = i + 1 ) begin
    mult_line[i] = data_in[i]*weights[i];
    data_out = data_out + mult_line[i];
  end

  end

endmodule
