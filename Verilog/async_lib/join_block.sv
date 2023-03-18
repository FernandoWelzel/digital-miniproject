//==============================================================================
//  Filename    : join_block.sv                                        
//  Designer    : Dan Hayoun
//  Reviewer    : Fernando WELZEL
//  Description : Join element used to reduce two requests into one
//==============================================================================
module join_block (
    input  logic    req_out,    // Main request
    output logic    ack_out,    // Main acknowledge

    output logic   req_in1,     // Request to controller 1
    input  logic   ack_in1,     // Acknowledge from controller 1

    output logic   req_in2,     // Request to controller 2
    input  logic   ack_in2,     // Acknowledge from controller 2

    input  logic       rst      // Circuit asyncronous reset -> request = 0
);

// Instantiation of Muller Gate ================================================
muller #(.size(2)) muller_join (.data_in[0](req_in1), .data_in[1](req_in2), .rst (rst), .data_out(req_out));

// == Main Code ================================================================
assign ack_in1  = ack_out;
assign ack_in2  = ack_out;

endmodule