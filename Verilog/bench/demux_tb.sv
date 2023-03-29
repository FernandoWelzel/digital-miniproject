//==============================================================================
//  Filename    : demux_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench for demultiplexer
//==============================================================================
module demux_bench ();

timeunit      1ns;
timeprecision 1ns;

logic [2**2-1:0] [8-1:0] data_out;
logic            [8-1:0]  data_in;
logic            [2-1:0]      sel;

// Demux instantiation
demux #(
  .data_bits(8),
  .sel_bits(2)
) demux_1 (
  .data_in      ( data_in  ),  // Data input vector
  .data_out    ( data_out  ),  // Data output matrix
  .sel             (  sel  )   // Selection signal
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Apply stimulus
initial  forever
    begin
        data_in = { 8'h84 };
        sel = 2'b00;

        // Stimulus - Selecting output
	    #10 sel = 2'b01;
        #10 sel = 2'b10;
        #10 sel = 2'b11;
        #10;

        // Stop simulation
        $finish;
    end                                                                        

endmodule
