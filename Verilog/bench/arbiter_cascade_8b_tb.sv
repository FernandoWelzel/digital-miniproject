//==============================================================================
//  Filename    : arbiter_cascade_8b_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Arbiter in cascade architecture test bench - 8 bits
//==============================================================================
module arbiter_cascade_8b_bench ();

timeunit      1ns;
timeprecision 1ns;

logic [7:0] req_in;
logic [7:0] ack_in;
logic      req_out;
logic      ack_out;
logic [7:0]    sel;

logic          rst;

// Arbiter instantiation
arbiter_cascade #(
    .input_size(8)
) arbiter_8b_1 (
    .req_in     (  req_in  ),  // Request vector from previous block
    .ack_in     (  ack_in  ),  // Acknoledge vector to previous block
    .req_out    ( req_out  ),  // Request given to next block
    .ack_out    ( ack_out  ),  // Acknoledge from next block
    .sel        (     sel  ),  // Selected request
    .rst        (     rst  )
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reseting req_in after ack_in is send
always @(ack_in) begin
    #1 req_in <= req_in - ack_in;
end

// Sending ack_out back when req_out is send, and reseting it to zero
always @(req_out) begin
    #1 ack_out <= req_out;
end

// Apply stimulus
initial  forever
    begin
        // Initial values
        req_in  = 0;
        ack_out = 0;

        // Reseting system
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus - Random requests
	    repeat (100) begin
            req_in = $urandom;  // Generates random requests that arive at the same time
            #10                 // Requests get partial processed after that
            req_in = req_in | $urandom; // Adding requests to the pile 
            #90;                        // Time for all requests to be processed
        end
    end                                                                        

endmodule
