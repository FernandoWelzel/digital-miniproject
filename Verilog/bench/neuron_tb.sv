//==============================================================================
//  Filename    : neuron_tb.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Testbench for asyncronous neuron
//==============================================================================
module neuron_bench ();

timeunit      1ns;
timeprecision 1ns;

// Parameters
parameter DATA_SIZE  =  10;
parameter THRESHOLD  = 512;
parameter DELAY_1 = 1;
parameter DELAY_2 = 1;

// Variable declaration 
logic [DATA_SIZE-1:0] data_in;
logic         req_in,  ack_in;
logic         req_out, ack_out;

bit rst;        

// Neuron instantiation
neuron #(
  .thold(THRESHOLD),
  .data_bits(DATA_SIZE),
  .delay_v( '{ DELAY_2, DELAY_1 } ) // Delay for each computation part - See description neuron
) neuron_1 (
  .data_in      ( data_in  ),  // Data input bit
  .req_in       (  req_in  ),  // Request input bit
  .ack_in       (  ack_in  ),  // Acknowledge input bit
  
  .req_out     (  req_out  ),  // Request output bit
  .ack_out     (  ack_out  ),  // Acknowledge output bit

  .rst          (     rst  )   // Reset
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

// Reset neuron apply stimulus
initial forever begin
  // Initial conditions
  rst = 0;
  data_in = 0;
  req_in = 0;
  ack_out = 0;

  // Reset
  #10 rst = 1;
  #10 rst = 0;

  // Stimulus - Random requests
  repeat (20) begin
    #1 data_in = $urandom; // Generates random weight
    #1  req_in = 1;        // Generates request
    #20;                   // Enough time to request be totaly processed
  end
end                                                                        

endmodule
