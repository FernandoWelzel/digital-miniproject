//==============================================================================
//  Filename    : read_rom_tb.sv                                              
//  Designer    : Fernando Welzel
//  Description : Test module to test if we can read the memory
//==============================================================================
module read_rom_tb ();

import "DPI-C" function string getenv(input string env_name);

// Parameters
parameter NEURON_IN  = 4;
parameter NEURON_OUT = 2;
parameter W_SIZE     = 8;
parameter string  ROM_FILE   = "C:/Users/ferna/OneDrive/Phelma/digital-miniproject/Verilog/bench/rom_data_tb.mem";

// Variable declarations
logic [NEURON_OUT*W_SIZE-1:0] memory [0:NEURON_IN-1];

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reading memory from file
initial begin
    $write("env = %s\n", {getenv("HOME"), "/FileName"});
    $readmemh(ROM_FILE, memory);
end

endmodule