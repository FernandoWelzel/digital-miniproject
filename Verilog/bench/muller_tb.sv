//==============================================================================
//  Filename    : muller_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench of muller gate (C element)
//==============================================================================
module muller_bench ();

timeunit      1ns;
timeprecision 1ns;

bit rst;        

logic [2:0] data_in, data_out;

// Muller gate
muller muller_1 #( parameter size = 2 ) (
  .data_in      ( data_in  ),   // Data input bus
  .data_out     ( data_out ),   // Data output value
  .rst          ( rst      ),   // Reset
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
        rst = 0;
        data_in = 2b'00;

        // Reset
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus
        #10 data_in = 2b'01;
        #10 data_in = 2b'10;
        #10 data_in = 2b'11;
    end                                                                        

endmodule
