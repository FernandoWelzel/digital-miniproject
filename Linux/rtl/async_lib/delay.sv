//==============================================================================
//  Filename    : delay.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametrizable delay for whatever number of inputs
//==============================================================================
module delay # (
  parameter integer delay = 1, // Delay set by block
  parameter integer  size = 1  // Size of input and output 
)(
  input  logic [size-1:0]  data_in,  // Input value
  output logic [size-1:0] data_out   // Output value
);

// == Instantiation with generate =============================================
generate
    genvar i;
    for( i = 0; i < size; i++ ) begin
        delay_1b #(.delay(delay)) delay_gen (.data_in(data_in[i]), .data_out(data_out[i]));
    end
endgenerate

endmodule
