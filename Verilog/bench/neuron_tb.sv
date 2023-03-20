//==============================================================================
//  Filename    : neuron_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench for asyncronous neuron
//==============================================================================
module neuron_bench ();

timeunit      1ns;
timeprecision 1ns;

logic  data_in,  req_in,  ack_in;
logic data_out, req_out, ack_out;

bit rst;        

// Neuron instantiation
neuron #(
  .weight(4),
  .thold(8),
  .data_bits(4),
  .delay_v( '{ 1, 2, 3 } ) // Delay for each computation part - See description neuron
) neuron_1 (
  .data_in      ( data_in  ),  // Data input bit
  .req_in       (  req_in  ),  // Request input bit
  .ack_in       (  ack_in  ),  // Acknowledge input bit
  
  .data_out    ( data_out  ),  // Data output bit
  .req_out     (  req_out  ),  // Request output bit
  .ack_out     (  ack_out  ),  // Acknowledge output bit

  .rst          (     rst  )   // Reset
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset neuron apply stimulus
initial  forever
    begin
        rst = 0;
        data_in = 0;
        req_in = 0;
        ack_out = 0;

        // Reset
        #10 rst = 1;
        #10 rst = 0;

        // Request 1
	    #10 data_in = 1;
        #10 req_in = 1;
        #10 req_in = 0; ack_out = 1;
        #10 ack_out = 0;
        #50;

        // Request 2
	    #10 data_in = 1;
        #10 req_in = 1;
        #10 req_in = 0; 
        #10 ack_out = 1;
        #10 data_in = 0; ack_out = 0;
        #50;

        // Request 3
	    #10 data_in = 1;
        #10 req_in = 1;
        #10 req_in = 0; 
        #10 ack_out = 1;
        #10 data_in = 0; ack_out = 0;
        #50;

        // Stop simulation
        $finish;
    end                                                                        

endmodule
