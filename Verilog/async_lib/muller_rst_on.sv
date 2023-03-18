//==============================================================================
//  Filename    : muller_rst_on.sv                                         
//  Designer    : Luca Sauer de Araujo
//  Reviewer    : Fernando WELZEL
//  Description : Parametric RESET-ON muller gate (C element). This element will
//                store a high value after reset.
//==============================================================================
module muller_rst_on #(
  parameter               size = 2   // Size - Number of inputs
  )(
  input  logic [size-1:0]  data_in,  // Input values
  input  logic                 rst,  // Asyncronous posedge reset -> data_out = 1
  output logic            data_out   // Output value
);

// == Main Code ================================================================
always_ff @* begin

    if ( rst ) data_out <= 1;
    else begin
        if ( data_in == 0 ) begin
            data_out <= 0;    
        end
        // If all bits in data_in are 1 -> Changes data_out to 1
        else if ( &data_in ) begin
            data_out <= 1;
        end
        else begin
            data_out <= data_out;
        end
    end

end

endmodule
