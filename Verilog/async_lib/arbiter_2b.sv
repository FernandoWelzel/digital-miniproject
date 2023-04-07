//==============================================================================
//  Filename    : arbiter_2b.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Arbiter element with 2 bits of selection to be used in an arbiter
//                network - Based on mutex
//==============================================================================
module arbiter_2b (
    input   logic  [1:0] req_in, // Request input vector 
    output  logic  [1:0] ack_in, // Acknoledge output vector  

    output  logic       req_out, // Request output vector 
    input   logic       ack_out, // Acknoledge input vector

    output  logic           sel, // Bit to represent which value is being selected

    input   logic           rst  // Reset
);

// == Variable declaration ======================================================
logic mutex_out1, mutex_out2;
logic req_internal, ack_internal;

// == Instantiation =============================================================
mutex mutex_arbiter_2b(.x(req_in[0]), .y(req_in[1]), .u(mutex_out1), .v(mutex_out2));

// By default demux has output in 2 bits
demux demux_arbiter_2b(.data_in(ack_internal), .data_out({ack_in[1], ack_in[0]}), .sel(sel));

// Instantiation of controller - Used to ensure the 4 phase protocol
ctrl ctrl_arbiter_2b(.req_in(req_internal), .ack_in(ack_internal), .req_out(req_out), .ack_out(ack_out), .rst(rst));

// == Block connection ==========================================================
assign req_internal = mutex_out1 | mutex_out2;
assign sel = mutex_out2;

endmodule
