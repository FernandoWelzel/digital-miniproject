//==============================================================================
//  Filename    : Join_param_tb.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Testbench of Join_param module 
//==============================================================================
module join_param_bench ();

timeunit      1ns;
timeprecision 1ns;

bit rst;        
logic       req_out;
logic       ack_out; //input
logic       [size-1:0] req_in; //input
logic       [size-1:0] ack_in;


// Controller
//inputs
Join_param#( .size(2)) J_p (
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
        ack_out = 1;

        // Reset
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus
        #10 ack_out = 1;
	    #10 req_in = 2'b00;
        #10 req_in = 2'b01;
        #10 req_in = 2'b10;
        #10 req_in = 2'b11;
        #10 req_in = 2'b00; //Ack_out = 1 we test if req_out stays at 1
        #10 ack_out = 0;

        // Reset
	#10 rst = 1;
        #10 rst = 0;
    end                                                                        

endmodule