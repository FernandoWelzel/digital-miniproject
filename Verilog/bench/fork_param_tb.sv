//==============================================================================
//  Filename    : fork_param_tb.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Testbench of fork_param module 
//==============================================================================
module fork_param_bench ();

timeunit      1ns;
timeprecision 1ns;
      
logic       req_in; //input
logic       ack_in; //output

logic       [size-1:0] req_out; //output
logic       [size-1:0] ack_out; //input

bit rst;  


// Controller
//inputs
fork_param#( .size(2)) F_p (
  .req_out    ( req_out ),   
  .ack_out    ( ack_out ), 
  .req_in     (req_in),
  .ack_in     (ack_in),  
  .rst        ( rst     )    // Reset
)

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
        rst = 0;
        req_in = 0;

        // Reset
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus
	    #10 req_in = 0;
        #10 req_in = 1;
        #10 ack_out = 2'b00;
        #10 ack_out = 2'b01;
        #10 ack_out = 2'b10; //Ack_out = 1 we test if req_out stays at 1
        #10 ack_out = 2'b11;
        #10 ack_out = 2'b10;
        #10 ack_out = 2'b01;
        #10 ack_out = 2'b00; //We test all values of ack_out, on both rising and down (beginning zat rising and beginning at down).


        // Reset
	#10 rst = 1;
        #10 rst = 0;
    end                                                                        

endmodule