//==============================================================================
//  Filename    : mux.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametric multiplexer - Combinational block
//==============================================================================
module mux #(
    parameter integer   data_bits = 1,  // Number of bits from each data bus
    parameter integer    sel_bits = 1   // Number of selection bits
    )(
    input  logic [2**sel_bits-1:0] [data_bits-1:0] data_in,  // Input matrix 
    output logic                   [data_bits-1:0] data_out, // Output vector

    input  logic                    [sel_bits-1:0]      sel  // Selection signal
);

// Behaviour definition ========================================================
always_comb begin
    data_out = 0;
    for ( int i = 0; i < 2**sel_bits; i++ ) begin
        if ( sel == unsigned'(i) ) begin
            data_out = data_in[i];
        end
    end
end

endmodule
