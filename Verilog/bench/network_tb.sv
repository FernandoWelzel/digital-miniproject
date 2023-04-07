//==============================================================================
//  Filename    : network_tb.sv                                              
//  Designer    : Fernando Welzel
//  Description : Test bench for neuron with one hidden layer
//==============================================================================
module network_tb ();

timeunit      1ns;
timeprecision 1ns;

// Parameters
parameter NEURON_IN         = 4;
parameter NEURON_HIDDEN     = 8;
parameter NEURON_OUT        = 2;
parameter W_SIZE            = 8;
parameter string  ROM_FILE1 = "C:/Users/ferna/OneDrive/Phelma/digital-miniproject/Verilog/bench/network_data1_tb.mem";
parameter string  ROM_FILE2 = "C:/Users/ferna/OneDrive/Phelma/digital-miniproject/Verilog/bench/network_data2_tb.mem";

// Variable declaration 
logic         [NEURON_IN-1:0] req_in; // Request from input neurons
logic         [NEURON_IN-1:0] ack_in; // Acknoledge to input neurons

logic       [NEURON_OUT-1:0] req_out; // Request to next neuron layer
logic       [NEURON_OUT-1:0] ack_out; // Acknoledge from next neuron layer

logic                            rst; // Reset

integer                            i; // Iterator
logic [NEURON_OUT-1:0] [7:0] counter; // Counter for number of spikes in the output

// Instantiation
network #(
    .w_size(W_SIZE),
    .neurons_in(NEURON_IN),
    .neurons_hidden(NEURON_HIDDEN),
    .neurons_out(NEURON_OUT),
    .rom_file12(ROM_FILE1),
    .rom_file23(ROM_FILE2)
) network_1 (
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
    // STUPID update of the counter
    case (req_out)
        2'b01: begin
            counter[0]++;
        end
        2'b10: begin
           counter[1]++;
        end 
        2'b11: begin
           counter[0]++;
           counter[1]++;
        end 
    endcase
    #1 ack_out <= req_out;
end

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset ctrl and apply stimulus (with reset on) on muller gate
initial  forever
    begin
        // Initial values
        req_in  = 0;
        ack_out = 0;
        counter = 0;

        // Reseting system
        #10 rst = 1;
        #10 rst = 0;

        // Stimulus - Random requests
        i = 0;
	    repeat (100) begin
            req_in[i] = req_in[i] | 1'b1; // Gerates request from 0 to max
            #20;                          // Requests get processed after that

            // Counter implementation
            i++;
            if(i > NEURON_IN - 1) begin
                i = 0;
            end
        end
    end                                                                        

endmodule
