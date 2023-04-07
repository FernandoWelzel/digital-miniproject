//==============================================================================
//  Filename    : rom_layer_tb.sv                                              
//  Designer    : Fernando Welzel
//  Description : Test bench for the ROM between layers
//==============================================================================
module rom_layer_tb ();

timeunit      1ns;
timeprecision 1ns;

// Parameters
parameter NEURON_IN  = 4;
parameter NEURON_OUT = 2;
parameter W_SIZE     = 8;
parameter string  ROM_FILE   = "C:/Users/ferna/OneDrive/Phelma/digital-miniproject/Verilog/bench/rom_data_tb.mem";

// Variable declarations
logic [NEURON_OUT*W_SIZE-1:0] data;
logic         [NEURON_IN-1:0] addr;

// Instantiation
rom_layer #(
    .w_size(W_SIZE),
    .neurons_in(NEURON_IN),
    .neurons_out(NEURON_OUT),
    .rom_file(ROM_FILE)
) rom_layer_1 (
    .addr(addr),
    .data(data)
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset ctrl and apply stimulus (with reset on) on muller gate
initial  forever
    begin
        // Looking at data
        #10 addr = 4'b0000;
        #10 addr = 4'b0001;
        #10 addr = 4'b0010;
        #10 addr = 4'b0100;
        #10 addr = 4'b1000;
    end                                                                        

endmodule
