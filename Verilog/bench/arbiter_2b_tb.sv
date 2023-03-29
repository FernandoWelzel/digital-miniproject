//==============================================================================
//  Filename    : arbiter_2b.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench for 2 bit selection arbiter
//==============================================================================
module arbiter_2b_bench ();

timeunit      1ns;
timeprecision 1ns;

logic [1:0] req_in;
logic [1:0] ack_in;
logic      req_out;
logic      ack_out;
logic          sel;

// Demux instantiation
arbiter_2b arbiter_2b_1 (
  .req_in      ( req_in  ),  // Request vector from previous block
  .ack_in      ( ack_in  ),  // Acknoledge vector to previous block
  .req_out   (  req_out  ),  // Request given to next block
  .ack_out     ( ack_out ),  // Acknoledge from next block
  .sel             ( sel )   // Selected request
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Apply stimulus
initial  forever
    begin
        req_in  = 2'b00;
        ack_out = 1'b0;

        // Stimulus - Request to next block
	    #10 req_in  = 2'b11; // Both requests arive at the same time
        #10 ack_out = 1'b1;  // After one request is selected - Send acknoledge
        #10
        // Deactivates request that was acknoledged
        if ( ack_in[0] ) req_in  = 2'b10;
        else             req_in  = 2'b01;
            ack_out = 1'b0;  // Resets acknoledge 
        #10 ack_out = 1'b1;  // Send acknoledge to the last request
        #10 req_in  = 2'b00; // Reset both requests to zero 

        // Stop simulation
        $finish;
    end                                                                        

endmodule
