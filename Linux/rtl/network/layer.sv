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
// == Import package as initial value ==========================================
import weights_pkg::*;
import thresholds_pkg::*;

// == Module declaration =======================================================
module layer #(
    parameter integer                w_size = 8,  // Size of weights in bits
    parameter integer            neurons_in = 4,  // Number of neurons in the previous layer
    parameter integer           neurons_out = 8,  // Number of neurons in the next layer

    // ROM array of values     - To be load from external file
    parameter bit [neurons_in-1:0][neurons_out*w_size-1:0] rom_mem = weight_layer1,
    
    // Neuron threshold values - To be load from external file
    parameter bit            [neurons_out-1:0][w_size-1:0] thr_val = thresholds_layer1,

    parameter integer    delay_v [1:0] = {1, 1}   // Delay vector from each combinational block - See description    
)(
    input  logic     [neurons_in-1:0] req_in, // Request from input neurons
    output logic     [neurons_in-1:0] ack_in, // Acknoledge to input neurons
    
    output logic   [neurons_out-1:0] req_out, // Request to next neuron layer
    input  logic   [neurons_out-1:0] ack_out, // Acknoledge from next neuron layer

    input  logic                         rst  // Reset
);

// == Variable declaration ======================================================
logic                    req_in_fork,  ack_in_fork;
logic [neurons_out-1:0] req_out_fork, ack_out_fork;

logic            req_out_arbiter,  ack_out_arbiter;

logic         [neurons_in-1:0]  address_rom; // In One-Hot
logic [neurons_out*w_size-1:0] data_out_rom;

// == Instantiating modules =====================================================
arbiter_cascade #(
    .input_size(neurons_in)
) arbiter_cascade_layer(
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_out_arbiter),
    .ack_out(ack_out_arbiter),
    .sel(address_rom),
    .rst(rst)
);

delay#(.delay(10)) delay_arbiter_to_fork(.data_in(req_out_arbiter), .data_out(req_in_fork));

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
    .rom_mem(rom_mem)
) memory_layer(
    .addr(address_rom),
    .data(data_out_rom)
);

// Creating neurons in the end of this layer and connecting them to the fork
generate
    genvar i;
    for(i = 0; i < neurons_out; i++) begin
        neuron #(
            .thold(integer'(thr_val[i])),
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

// == Connecting wires =====================================================
assign ack_out_arbiter = ack_in_fork;

endmodule
