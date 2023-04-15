//==============================================================================
//  Filename    : locker_ctrl.sv                                              
//  Designer    : Luca SAUER DE ARAUJO
//  Description : Control of locker state for arbiter  
//==============================================================================

module ctrl_locker (
    input  logic  ack_out, // Acknowledge from next control block 
    input  logic  req_in, // Request from previous control block 
    input  logic  lock, 

    output logic  req_out, // Request to next control block 
    output logic  ack_in, // Acknowledge to previous control block 

    input  logic  rst  // Circuit asyncronous reset -> req_out = 0 
);

// Variable declaration ========================================================
logic [1:0] muller_in;
logic       muller_out;
// logic       ack_out;


// Instantiation of MullerGate =================================================
muller_synt locker_ctrl (.data_in (muller_in), .data_out(muller_out), .rst (rst));

// == Main Code ================================================================

// assign muller_in = {req_in, (req_out | lock)};     // Concatenates the inputs into vector to muller gate
assign req_out = {muller_out};          // Connects all outputs to muller_out
assign ack_in = {req_out | lock};
assign muller_in = {req_in, ~ack_out};

// req_in makes req_out HIGH
// req_out high makes ack_out and lock HIGH
// muller in must be 00 to req_out to be LOW
// req_out LOW will make lock LOW
// IMPOSSIBLE to turn lock LOW because req_out remains HIGH 

endmodule
