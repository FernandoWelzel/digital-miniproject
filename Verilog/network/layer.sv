//==============================================================================
//  Filename    : layer.sv                                              
//  Designer    : Fernando Welzel
//  Description : Fully interconnected neuron layer
//
//                Basic architecture:
//                  * Requests come from the input neurons
//                  * Requests are selected using an arbiter in cascade technology
//                  * Output request from arbiter is feed into an fork and address
//                    passed to memory
//                  * Memory sends data to neurons and all neurons receive the re-
//                    quest at the same time
//                  * Neurons process request and send acknoledge back 
//
//==============================================================================
module layer #(
    parameter integer                w_size = 8,  // Size of weights in bits
    parameter integer            neurons_in = 4,  // Number of neurons in the previous layer
    parameter integer           neurons_out = 4,  // Number of neurons in the next layer

    parameter string rom_file = "./rom_data.mem", // Name of the file containing the weights of our neurons

    parameter integer    delay_v [1:0] = {1, 1}   // Delay vector from each combinational block - See description    
)(
    input  logic     [neurons_in-1:0] req_in, // Request from input neurons
    output logic     [neurons_in-1:0] ack_in, // Acknoledge to input neurons
    
    output logic   [neurons_out-1:0] req_out, // Request to next neuron layer
    input  logic   [neurons_out-1:0] ack_out, // Acknoledge from next neuron layer

    input  logic                         rst  // Reset
);

// == Variable declaration ======================================================
logic                   req_in_fork,  ack_in_fork;
logic [neurons_out-1:0] req_out_fork, ack_out_fork;

logic         [neurons_in-1:0]  address_rom; // In One-Hot
logic [neurons_out*w_size-1:0] data_out_rom;

// == Instantiating modules =====================================================
arbiter_cascade #(
    .input_size(neurons_in)
) arbiter_cascade_layer(
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_in_fork),
    .ack_out(ack_in_fork),
    .sel(address_rom),
    .rst(rst)
);

fork_param #(
    .size(neurons_out)
) fork_layer (
    .req_in(req_in_fork),
    .ack_in(ack_in_fork),
    .req_out(req_out_fork),
    .ack_out(ack_out_fork),
    .rst(rst)
);

// Creating layer central memory. This memory sends to all neurons
rom_layer #(
    .w_size(w_size),
    .neurons_in(neurons_in),
    .neurons_out(neurons_out),
    .rom_file(rom_file)
) memory_layer(
    .addr(address_rom),
    .data(data_out_rom)
);

// Creating neurons in the end of this layer and connecting them to the fork
generate
    genvar i;
    for(i = 0; i < neurons_out; i++) begin
        neuron #(
            .thold(2**(w_size-1)), // For the moment, threshold set to half the maximum weight
            .data_bits(w_size),
            .delay_v(delay_v)
        ) neuron_layer_generate(
            // Selects the part of the data from the rom that is important for this neurons
            .data_in(data_out_rom[w_size*(i+1)-1:w_size*i]),
            .req_in(req_out_fork[i]),
            .ack_in(ack_out_fork[i]),
            .req_out(req_out[i]),
            .ack_out(ack_out[i]),
            .rst(rst)
        );
    end
endgenerate

endmodule