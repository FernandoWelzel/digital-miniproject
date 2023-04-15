//==============================================================================
//  Filename    : fork_param.sv                                        
//  Designer    : Fernando WELZEL
//  Description : Parametric fork element used to expand one request into several
//==============================================================================
module fork_param #(
    parameter               size = 2     // Size - Number of inputs
    )(
    input  logic              req_in,    // Main request
    output logic              ack_in,    // Main acknowledge

    output logic  [size-1:0] req_out,    // Request output vector
    input  logic  [size-1:0] ack_out,    // Acknowledge output vector

    input  logic                 rst     // Circuit asyncronous reset -> ack_in = 0
);

// Instantiation of Muller Gate ================================================
muller_synt #(.size(size)) muller_fork (.data_in(ack_out), .data_out(ack_in), .rst (rst));

// == Main Code ================================================================
assign req_out = {size{req_in}}; // Repeat operator - Connects all output vector to req_in

endmodule

