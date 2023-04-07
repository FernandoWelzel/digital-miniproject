//==============================================================================
//  Filename    : arbiter_2b_rev2.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Arbiter element with 2 bits of selection - SECOUND REVISION
//                Implements architecture from YAKOVLEV, PETROV, LAVAGNO 1994
//==============================================================================
module arbiter_2b_rev2 (
    input   logic  [1:0] req_in, // Request input vector 
    output  logic  [1:0] ack_in, // Acknoledge output vector  

    output  logic       req_out, // Request output vector 
    input   logic       ack_out, // Acknoledge input vector

    output  logic           sel  // Bit to represent which value is being selected
);

timeunit      1ns;
timeprecision 1ns;

// == Variable declaration ======================================================
// For explanaition of variable names refer to the paper cited: The character ' corresponds to _
logic R1, R2;
logic A1, A2;
logic G1, G2, G1_, G2_;
logic G, G_, G__, G___;
logic R; 

// == Instantiation =============================================================
mutex mutex_arbiter_2b(.x(R1), .y(R2), .u(A1), .v(A2));

// == Block connection ==========================================================
// Outside connections
assign {R2, R1} = req_in;
assign  req_out = R;
assign  ack_in  = {G2, G1};
assign  G       = ack_out;

// Internal logic
assign G1 = (G1&R) | (G1&A1) | (G2_&R&G__&A1);
assign G2 = (G2&R) | (G2&A2) | (G1_&R&G__&A2);

assign G1_  = ~G1;
assign G2_  = ~G2;
assign G_   = ~G;
assign G__  = ~G_;
assign G___ = ~G__;

assign R = (R1&G2_&G___) | (G___&G1_&R2) | (R1&G2_&R) | (G1_&R2&R) | (G___&R);

// General assignments
assign sel = A2;

endmodule
