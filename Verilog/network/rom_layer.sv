//==============================================================================
//  Filename    : rom_layer.sv                                              
//  Designer    : Fernando Welzel
//  Description : ROM memory for layer interconnection - One-hot encoded
//==============================================================================
module rom_layer #(
    parameter integer                w_size = 8, // Size of weights in bits
    parameter integer            neurons_in = 4, // Number of neurons in the previous layer
    parameter integer           neurons_out = 4, // Number of neurons in the next layer

    parameter string rom_file = "./rom_data.mem" // Name of the file containing the weights of our neurons
)(
    input  logic                 [neurons_in-1:0] addr, // Address One-hot - Neuron selected in the previous layer
    
    output logic         [neurons_out*w_size-1:0] data  // Data - Data vector for the next neurons
);

// == Variable declaration ======================================================
logic        [neurons_out*w_size-1:0] memory [0:neurons_in-1];
logic [$ceil($clog2(neurons_in))-1:0] addr_new;

// == Convert address ===========================================================
always_comb begin
    addr_new = 0;
    for (int i = 0; i < neurons_in; i++) begin
        if(addr[i] == 1'b1) begin
            addr_new = i; 
        end
    end
end

// == Memory operations =========================================================
// Initializing memory values to zero
initial begin
    for (int i = 0; i < neurons_in; i++) begin
        memory[i] = {neurons_out*w_size{1'b0}};
    end
end

// Reading memory from file
initial begin
    $readmemh(rom_file, memory);
end

// Connecting memory to output
always_comb begin
    data <= memory[addr_new];
end

endmodule