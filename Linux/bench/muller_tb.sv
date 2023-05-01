//==============================================================================
//  Filename    : muller_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench of muller gate (C element)
//==============================================================================
module muller_bench ();

timeunit      1ns;
timeprecision 1ns;

bit rst;        
logic [1:0] data_in;
logic       data_out;

// Muller gate
muller #( .size(2) ) muller_1 (
  .data_in      ( data_in  ),   // Data input bus
  .data_out     ( data_out ),   // Data output value
  .rst          ( rst      )    // Reset
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
        rst = 0;
        data_in = 2'b00;

        // Reset
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus
	#10 data_in = 2'b00;
        #10 data_in = 2'b01;
        #10 data_in = 2'b10;
        #10 data_in = 2'b11;
        #10;

        // Reset
	#10 rst = 1;
        #10 rst = 0;
    end                                                                        

endmodule
