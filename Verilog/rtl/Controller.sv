//==============================================================================
//  Filename    : Controller                                         
//  Designer    : Luca Sauer de Araujo 
//  Description : Controller element used for asynchronous neuron.
//==============================================================================
module controller #(
    logic input ack_out,
    logic input req_in,
    logic input rst, 
    logic output req_out,
    logic output ack_in,
    logic output ctrl_out
);

// Instantiation of MullerGate =================================================
// Considering a and b the inputs of the Muller C-element and z its output
muller MG (.data_in[0] (req_in), .data_in[1] (ack_out), .rst (rst), .data_out(req_out));

// == Main Code ================================================================
begin 

assign ack_in = z;
assign ctl_out = z;

end 
endmodule
