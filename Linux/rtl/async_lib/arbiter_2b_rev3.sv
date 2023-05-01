//==============================================================================
//  Filename    : arbiter_2b_rev3.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Arbiter element with 2 bits of selection - Revision 3 - NAQVI & STEININGER
//==============================================================================
module arbiter_2b_rev3 (
    input   logic  [1:0] req_in, // Request input vector 
    output  logic  [1:0] ack_in, // Acknoledge output vector  

    output  logic       req_out, // Request output vector 
    input   logic       ack_out, // Acknoledge input vector

    output  logic           sel, // Bit to represent which value is being selected
    
    input   logic           rst  // Reset
);

// == Variable declaration ======================================================
logic r1, r2;
logic g1, g2;
logic u0_out, u1_out, u2_out, u3_out, u4_out, u5_out, u6_out;

// == Instantiation =============================================================
mutex mutex_arbiter_2b(.x(r1), .y(r2), .u(g1), .v(g2));

muller_synt u5(.data_in({u3_out, ack_out}), .data_out(u5_out), .rst(rst));
muller_synt u6(.data_in({u4_out, ack_out}), .data_out(u6_out), .rst(rst));

// == Block connection ==========================================================
// Connections inside the block
assign u0_out = ~(req_in[0]&g1&(~u6_out));
assign u1_out = ~(req_in[1]&g2&(~u5_out));
assign u2_out = ~(u0_out&u1_out);
assign u3_out = g1&(~u6_out);
assign u4_out = g2&(~u5_out);

// Outside connections
delay delay_arbiter1(.data_in(req_in[0]), .data_out(r1));
delay delay_arbiter2(.data_in(req_in[1]), .data_out(r2));
assign req_out = u2_out;
assign ack_in  = {u6_out, u5_out};

// Logical connections
assign sel = g2;

endmodule
