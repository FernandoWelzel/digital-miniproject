//==============================================================================
//  Filename    : network.sv                                              
//  Designer    : Fernando Welzel
//  Description : Neural network with:
//                  * Layer in
//                  * Layer hidden
//                  * Layer out
//==============================================================================
module network #(
    parameter integer                w_size = 8,  // Size of weights in bits
    parameter integer            neurons_in = 4,  // Number of neurons in the previous layer
    parameter integer        neurons_hidden = 8,  // Number of hidden neurons
    parameter integer           neurons_out = 2,  // Number of neurons in the next layer

    parameter string rom_file12 = "./rom_data.mem", // Weight of neurons layer 1 to 2
    parameter string rom_file23 = "./rom_data.mem", // Weight of neurons layer 2 to 3

    parameter integer     delay_v [1:0] = {1, 1}  // Delay vector from each combinational block - See description    
)(
    input  logic     [neurons_in-1:0] req_in, // Request from input neurons
    output logic     [neurons_in-1:0] ack_in, // Acknoledge to input neurons
    
    output logic   [neurons_out-1:0] req_out, // Request to next neuron layer
    input  logic   [neurons_out-1:0] ack_out, // Acknoledge from next neuron layer

    input  logic                         rst  // Reset
);

// == Variable declaration ======================================================
logic     [neurons_hidden-1:0] req_hidden; // Request from hidden neurons
logic     [neurons_hidden-1:0] ack_hidden; // Acknoledge to hidden neurons

// == Instantiating modules =====================================================
layer #(
    .w_size(w_size),
    .neurons_in(neurons_in),
    .neurons_out(neurons_hidden),
    .rom_file(rom_file12)
) layer_input (
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_hidden),
    .ack_out(ack_hidden),
    .rst(rst)
);

layer #(
    .w_size(w_size),
    .neurons_in(neurons_hidden),
    .neurons_out(neurons_out),
    .rom_file(rom_file23)
) layer_hidden (
    .req_in(req_hidden),
    .ack_in(ack_hidden),
    .req_out(req_out),
    .ack_out(ack_out),
    .rst(rst)
);

endmodule