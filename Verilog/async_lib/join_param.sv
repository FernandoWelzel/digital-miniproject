//==============================================================================
//  Filename    : join_param.sv                                        
//  Reviewer    : Fernando WELZEL
//  Description : Parametric join element used to reduce several requests into one
//==============================================================================
module join_param #(
    parameter               size = 2     // Size - Number of inputs
    )(
    output logic             req_out,    // Main request
    input  logic             ack_out,    // Main acknowledge

    input  logic   [size-1:0] req_in,    // Request input vector
    output logic   [size-1:0] ack_in,    // Acknowledge input vector

    input  logic                 rst     // Circuit asyncronous reset -> request = 0
);

// Instantiation of Muller Gate ================================================
muller_synt #(.size(size)) muller_join (.data_in(req_in), .data_out(req_out), .rst (rst));

// == Main Code ================================================================
assign ack_in = {size{ack_out}}; // Repeat operator - Connects all input vector to ack_out

endmodule