//==============================================================================
//  Filename    : fork_block.sv                                         
//  Designer    : Luca Sauer de Araujo
//  Reviewer    : Fernando WELZEL
//  Description : Fork element used to expand one request into two
//==============================================================================
module fork_block (
    input  logic    req_in,    // Main request
    output logic    ack_in,    // Main acknowledge

    output logic  req_out1,    // Request to controller 1
    input  logic  ack_out1,    // Acknowledge from controller 1

    output logic  req_out2,    // Request to controller 2
    input  logic  ack_out2,    // Acknowledge from controller 2

    input  logic       rst     // Circuit asyncronous reset -> ack_in = 0
);

// Instantiation of Muller Gate ================================================
muller #(.size(2)) muller_fork (.data_in[0](ack_out1), .data_in[1](ack_out2), .rst (rst), .data_out(ack_in));

// == Main Code ================================================================
assign req_out1 = req_in;
assign req_out2 = req_in;

endmodule

