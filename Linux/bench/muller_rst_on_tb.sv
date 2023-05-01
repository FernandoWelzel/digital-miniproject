//==============================================================================
//  Filename    : muller_rst_on_tb.sv                                              
//  Designer    : Luca Sauer de Araujo
//  Description : Testbench of muller gate with reset on
//==============================================================================
module muller_rst_on_bench ();

timeunit      1ns;
timeprecision 1ns;

bit rst;        
logic [1:0] data_in;
logic       data_out;

// Muller gate
muller_synt #( .rst_set(1) ) muller_rst_on_1 (
  .data_in      ( data_in  ),   // Data input bus
  .data_out     ( data_out ),   // Data output value
  .rst          ( rst      )    // Reset
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus (with reset on) on muller gate
initial  forever
    begin
        rst = 0;
        data_in = 2'b00;

        // Initial Reset
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus
	    #10 data_in = 2'b00;
        #10 data_in = 2'b01;
        #10 rst = 1;
        #10 data_in = 2'b10; // data out should be copied
        #10 rst = 0;
        #10 data_in = 2'b11; // data out should be copied
        #10;

    end                                                                        

endmodule
