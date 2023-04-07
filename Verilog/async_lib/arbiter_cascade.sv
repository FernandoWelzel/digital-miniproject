//==============================================================================
//  Filename    : arbiter_cascade.sv                                              
//  Designer    : Fernando Welzel
//  Description : Cascade arbiter architecture
//==============================================================================
module arbiter_cascade #(
    parameter integer       input_size = 32 // Number of requests
)(
    input  logic    [input_size-1:0] req_in, // Request vector input
    output logic    [input_size-1:0] ack_in, // Acknoledge vector input
    
    output logic                    req_out, // Request output
    input  logic                    ack_out, // Acknoledge output

    output logic    [input_size-1:0]    sel, // Vector that says which input is selected in ONE-HOT encoding

    input  logic                        rst  // Reset
);

// == Variable declaration ======================================================
logic [input_size-1:0] req_inter; // Intermidiare requests between arbiters
logic [input_size-1:0] ack_inter; // Intermidiare acknoledge between arbiters

logic [input_size-2:0]  sel_bits; // Bits of selection from all arbiters 

// == Instantiation using generate ==============================================
generate
    genvar i;
    // Generate input_size-1 arbiters of 2 bits and connect them all together
    for( i = 0; i < input_size-1; i++ ) begin
        // Instanting all arbiters of two ports
        arbiter_2b_rev3 arbiter_cascade_gen(
            .req_in ({req_in[i+1], req_inter[i]}),
            .ack_in ({ack_in[i+1], ack_inter[i]}), 
            .req_out(req_inter[i+1]),
            .ack_out(ack_inter[i+1]),
            .sel    (sel_bits[i]),
            .rst    (rst)
        );

        if ( i+1 > input_size-2 ) begin           
            // Last case
            assign sel[i+1] = sel_bits[i]; 
        end
        else begin           
            // General case
            assign sel[i+1] = sel_bits[i] & ~(|sel_bits[input_size-2:i+1]); 
        end
    end 
endgenerate

// Connection of first selection
generate
    if ( input_size <= 2 ) begin
        // If input is small first bit will only be inverse of first bit
        assign sel[0] = ~sel_bits[0];
    end
    else begin
        // For other cases check next bits
        assign sel[0] = ~sel_bits[0] & ~(|sel_bits[input_size-2:1]);
    end
endgenerate

// == Block connection ==========================================================
assign req_inter[0] = req_in[0];
assign ack_in[0]    = ack_inter[0];

assign req_out                 = req_inter[input_size-1];
assign ack_inter[input_size-1] = ack_out;

endmodule