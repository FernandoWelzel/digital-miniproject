//==============================================================================
//  Filename    : mux_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench for multiplexer
//==============================================================================
module mux_bench ();

timeunit      1ns;
timeprecision 1ns;

logic [2**2-1:0] [8-1:0]  data_in;
logic            [8-1:0] data_out;
logic            [2-1:0]      sel;

// Mux instantiation
mux #(
  .data_bits(8),
  .sel_bits(2)
) mux_1 (
  .data_in      ( data_in  ),  // Data input matrix
  .data_out    ( data_out  ),  // Data output vector
  .sel             (  sel  )   // Selection signal
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset neuron apply stimulus
initial  forever
    begin
        data_in = { 8'hFF, 8'hF0, 8'h00, 8'h88 };
        sel = 2'b00;

        // Stimulus
	    #10 sel = 2'b01;
        #10 sel = 2'b10;
        #10 sel = 2'b11;
        #10;

        // Stop simulation
        $finish;
    end                                                                        

endmodule
