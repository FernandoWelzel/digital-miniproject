//==============================================================================
//  Filename    : ctrl_tb.sv                                              
//  Designer    : Luca Sauer de Araujo
//  Description : Testbench of ctrl module 
//==============================================================================
// Creating module
module ctrl_tb ();

timeunit      1ns;
timeprecision 1ns;

// Variable declarations
bit rst;        
logic       ack_out;
logic       req_in;
logic       req_out;
logic       ack_in;
logic       ctrl_out;

// Controller
ctrl ctrl_b (
//inputs
  .ack_out     ( ack_out ),   
  .req_in      ( req_in ),   
  .rst         ( rst     ),    // Reset

//outputs
  .req_out    (req_out),
  .ack_in     (ack_in),
  .ctrl_out   (ctrl_out)
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset ctrl and apply stimulus (with reset on) on muller gate
initial  forever
    begin
        rst = 0;
        ack_out = 1; // should be copying the input

        // Reset
        #10 rst = 1; // nothing should happen
        #10 rst = 0;

        // Stimulus
        #10 req_in = 1;
	      #10 ack_out = 0;
        #10 ack_out = 1; // ctrl_out should remains the same
        #10 req_in = 0; // ctrl_out should be LOW

        // Reset
	      #10 rst = 1;
        #10 rst = 0;
    end                                                                        

endmodule
