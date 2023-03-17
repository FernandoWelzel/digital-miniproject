//==============================================================================
//  Filename    : Fork                                         
//  Designer    : Luca Sauer de Araujo 
//  Description : Fork element used to split one signal into several
//==============================================================================
module  fork_neuron #(
    logic input ack_out1,
    logic input ack_out2,
    logic input req_in,
    logic input rst,
    logic output ack_in,
    logic output req_out1,
    logic output req_out2,
);

// Instantiation of MullerGate =================================================
// Considering a and b the inputs of the Muller C-element and z its output
muller #(.size(2)) MG (.data_in[0](ack_out1), .data_in[1](ack_out2), .rst (rst), .data_out (ack_in));

// == Main Code ================================================================
begin 

assign req_out1 = req_in;
assign req_out2 = req_in;
assign ack_in = z;

end 
endmodule

