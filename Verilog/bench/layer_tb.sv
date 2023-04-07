//==============================================================================
//  Filename    : layer_tb.sv                                              
//  Designer    : Fernando Welzel
//  Description : Test bench for one neuron layer
//==============================================================================
module layer_tb ();

timeunit      1ns;
timeprecision 1ns;

// Parameters
parameter NEURON_IN  = 4;
parameter NEURON_OUT = 2;
parameter W_SIZE     = 8;
parameter string  ROM_FILE   = "C:/Users/ferna/OneDrive/Phelma/digital-miniproject/Verilog/bench/layer_data_tb.mem";

// Variable declaration 
logic     [NEURON_IN-1:0] req_in; // Request from input neurons
logic     [NEURON_IN-1:0] ack_in; // Acknoledge to input neurons

logic   [NEURON_OUT-1:0] req_out; // Request to next neuron layer
logic   [NEURON_OUT-1:0] ack_out; // Acknoledge from next neuron layer

logic                        rst; // Reset

// Instantiation
layer #(
    .w_size(W_SIZE),
    .neurons_in(NEURON_IN),
    .neurons_out(NEURON_OUT),
    .rom_file(ROM_FILE)
) layer_1 (
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_out),
    .ack_out(ack_out),
    .rst(rst)
);

// Reseting req_in after ack_in is send
always @(ack_in) begin
    #1 req_in <= req_in - ack_in;
end

// Sending ack_out back when req_out is send, and reseting it to zero
always @(req_out) begin
    #10 ack_out <= req_out;
end

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset ctrl and apply stimulus (with reset on) on muller gate
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
            #10;                // Requests get partial processed after that
            req_in = req_in | $urandom; // Adding requests to the pile 
            #90;                        // Time for all requests to be processed
        end
    end                                                                        

endmodule
