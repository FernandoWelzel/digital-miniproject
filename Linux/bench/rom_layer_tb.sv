//==============================================================================
//  Filename    : rom_layer_tb.sv                                              
//  Designer    : Fernando Welzel
//  Description : Test bench for the ROM between layers
//==============================================================================
module rom_layer_tb ();

timeunit      1ns;
timeprecision 1ns;

// Parameters
parameter NEURON_IN  = 8;
parameter NEURON_OUT = 2;
parameter W_SIZE     = 8;

// Variable declarations
logic [NEURON_OUT*W_SIZE-1:0] data;
logic         [NEURON_IN-1:0] addr;

// Importing package with values
import weights_pkg::*;

// Instantiation
rom_layer #(
    .w_size(W_SIZE),
    .neurons_in(NEURON_IN),
    .neurons_out(NEURON_OUT),
    .rom_mem(weight_layer2)
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
        #10 addr = 8'b00000000;
        #10 addr = 8'b00000001;
        #10 addr = 8'b00000010;
        #10 addr = 8'b00000100;
        #10 addr = 8'b00001000;
        #10 addr = 8'b00010000;
        #10 addr = 8'b00100000;
        #10 addr = 8'b01000000;
        #10 addr = 8'b10000000;
    end                                                                        

endmodule
