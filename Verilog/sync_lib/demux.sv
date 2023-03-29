//==============================================================================
//  Filename    : demux.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametric demultiplexer - Combinational block
//==============================================================================
module demux #(
    parameter integer   data_bits = 1,  // Number of bits from each data bus
    parameter integer    sel_bits = 1   // Number of selection bits
    )(
    input  logic                   [data_bits-1:0] data_in,  // Input vector 
    output logic [2**sel_bits-1:0] [data_bits-1:0] data_out, // Output matrix

    input  logic                    [sel_bits-1:0]      sel  // Selection signal
);

// Behaviour definition ========================================================
always_comb begin
    // Initializes values of data_out to zero
    data_out = 0;

    for ( int i = 0; i < 2**sel_bits; i++ ) begin
        if ( sel == i ) begin
            data_out[i] = data_in;
        end
    end
end

endmodule
