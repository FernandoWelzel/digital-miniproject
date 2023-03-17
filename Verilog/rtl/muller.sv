//==============================================================================
//  Filename    : muller.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametric muller gate (C element).
//==============================================================================
module muller #(
  parameter integer       size = 2,  // Size - Number of inputs
  )(
  input  logic   [size:0]  data_in,  // Input values
  input  logic            data_out,  // Output value
  input  logic                 rst   // Asyncronous posedge reset -> data_out = 0
);

// == Main Code ================================================================
always_ff @ ( data_in, posedge rst ) begin

    if ( rst ) data_out <= 0;
    else begin
        if ( data_in == 0 ) begin
            data_out <= 0;    
        end
        else ( & data_in ) begin
            data_out <= 1;
        end
        else begin
            data_out <= data_out;
        end
    end

end

endmodule
