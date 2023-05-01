//==============================================================================
//  Filename    : rom_layer.sv                                              
//  Designer    : Fernando Welzel
//  Description : ROM memory for layer interconnection - One-hot encoded
//==============================================================================
// == Import package as initial value ==========================================
import weights_pkg::*;

// == Module declaration =======================================================
module rom_layer #(
    parameter integer                w_size = 8, // Size of weights in bits
    parameter integer            neurons_in = 4, // Number of neurons in the previous layer
    parameter integer           neurons_out = 8, // Number of neurons in the next layer

    // ROM array of values - To be load from external file
    parameter bit [neurons_in-1:0][neurons_out*w_size-1:0] rom_mem = weight_layer1
)(
    input  logic          [neurons_in-1:0] addr, // Address One-hot - Neuron selected in the previous layer
    
    output logic  [neurons_out*w_size-1:0] data // Data - Data vector for the next neurons
);

// == Variable declaration ======================================================
logic [$clog2(neurons_in)-1:0] addr_one_hot;

// == Convert address ===========================================================
always_comb begin
    addr_one_hot = 0;
    for (integer i = 0; i < neurons_in; i++) begin
        if(addr[i] == 1'b1) begin
            addr_one_hot = unsigned'(i); 
        end
    end
end

// == Memory operations =========================================================
// Connecting memory to output
always_comb begin
    data <= rom_mem[addr_one_hot];
end

endmodule
