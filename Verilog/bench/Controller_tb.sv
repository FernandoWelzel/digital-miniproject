//==============================================================================
//  Filename    : Controller_tb.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Testbench of Controller module 
//==============================================================================
module controller_bench ();

timeunit      1ns;
timeprecision 1ns;

bit rst;        
logic       ack_out;
logic       req_in;

// Controller
//inputs
Controller Con_b (
  .ack_out    ( ack_out ),   
  .req_in     ( req_in ),   
  .rst          ( rst     ),    // Reset

//outputs
  .req_out    (req_out),
  .ack_in     (ack_in),
  .ctrl_out  (ctrl_out)
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
        rst = 0;
        ack_out = 1;

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
