//==============================================================================
//  Filename    : arbiter_cascade_2b_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Arbiter in cascade architecture test bench - 2 bits
//==============================================================================
module arbiter_cascade_2b_bench ();

timeunit      1ns;
timeprecision 1ns;

logic [1:0] req_in;
logic [1:0] ack_in;
logic      req_out;
logic      ack_out;
logic [1:0]    sel;

logic          rst;

// Arbiter instantiation
arbiter_cascade #(
    .input_size(2)
) arbiter_2b_1 (
    .req_in     (  req_in  ),  // Request vector from previous block
    .ack_in     (  ack_in  ),  // Acknoledge vector to previous block
    .req_out    ( req_out  ),  // Request given to next block
    .ack_out    ( ack_out  ),  // Acknoledge from next block
    .sel        (     sel  ),  // Selected request
    .rst        (     rst  )
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Apply stimulus
initial  forever
    begin
        // Initial values
        req_in  = 0;
        ack_out = 0;

        // Reseting system
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus - Request to next block
	    #10 req_in  = 2'b01; // Sending just one request
        #10 ack_out = 1;     // Acknolodge request
        #10
        $finish;
    end                                                                        

endmodule
