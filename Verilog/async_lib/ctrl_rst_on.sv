//==============================================================================
//  Filename    : ctrl_rst_on.sv                                         
//  Designer    : Dan Hayoun
//  Reviewer    : Fernando WELZEL 
//  Description : Control block used for asynchronous circuits - Resets with
//                req_out = 1
//==============================================================================
module ctrl_rst_on (
    input  logic  ack_out, // Acknowledge from next control block 
    input  logic   req_in, // Request from previous control block 

    output logic  req_out, // Request to next control block 
    output logic   ack_in, // Acknowledge to previous control block 
    output logic ctrl_out, // Control signal to register 

    input  logic      rst  // Circuit asyncronous reset -> req_out = 1 
);

// Variable declaration ========================================================
logic [1:0] muller_in;
logic       muller_out;

// Instantiation of MullerGate =================================================
muller_synt #(.rst_set(1)) muller_ctrl_rst_on (.data_in (muller_in), .data_out(muller_out), .rst (rst));

// == Main Code ================================================================
assign muller_in = {req_in, ~ack_out};                 // Concatenates the inputs into vector to muller gate
assign {ctrl_out, req_out, ack_in} = {3{muller_out}};  // Connects all outputs to muller_out

endmodule