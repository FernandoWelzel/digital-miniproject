//==============================================================================
//  Filename    : arbiter.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Parametrizable arbiter based on arbiter of 2 bits
//==============================================================================
module arbiter #(
  parameter integer input_size = 8 // Number of requests to be treated in the previous layer
  )(
  input     logic [input_size:0] req_in,  // Request input vector 
  output    logic [input_size:0] ack_in, // Acknoledge output vector  

  output    logic       req_out, // Request output vector 
  input     logic       ack_out, // Acknoledge input vector

  output    logic [ceil(log2(input_size)):0] sel  // Selection vector - Will serve as memory address
);

// == Variable declaration ======================================================
integer num_layers = ceil(log2(input_size));  // Variable for number of layers

genvar layer_size; // Represents the current layer size
genvar i, j;       // Iterators

logic [num_layers-1:0] [input_size-1:0] req_layers; // Create a matrix of requests to interconnect the arbiters
logic [num_layers-1:0] [input_size-1:0] ack_layers; // Create a matrix of acknoledges to interconnect the arbiters
logic [num_layers-1:0] [input_size-1:0] sel_layers; // Create a matrix of selections to interconnect the arbiters

// == Instantiation =============================================================
// Iterates though layers creating and connecting arbiters
generate
    genvar layer_size = input_size;

    for( i = 0; i < num_layers; i++ ) begin

        // Update of layer size
        layer_size = ((layer_size - layer_size%2)/2 + layer_size%2);

        // Iterates conecting arbiters to current position
        for ( j = 0; j < (layer_size - layer_size%2)/2; j++ ) begin
            // Create all 2 bit arbiters in a layer and connect them to their respective request and acknoledge
            arbiter_2b arbiter_internal(
                .req_in ({req_layers[i][2*j], req_layers[i][2*j+1]}),
                .ack_in ({ack_layers[i][2*j], ack_layers[i][2*j+1]}),
                .req_out(req_layers[i+1][j]),
                .ack_out(ack_layers[i+1][j]),
                .sel    (sel_layers[i+1][j])
            );
        end
        
        // If flag high - Connect last input to next layer
        assign req_layers[i+1][j] = layer_size%2 ? req_layers[i][j*2] : 0;
        assign ack_layers[i+1][j] = layer_size%2 ? ack_layers[i][j*2] : 0;

        // Creates layer selection according to selections in each layer
        mux #(
            .data_bits(1),
            .sel_bits(num_layers)
        ) mux_internal (
            .data_in(sel_layers[i+1][j+layer_size%2:0]),
            .data_out(sel[i]),
            .sel(sel[num_layers:i+1])
        );
    end
endgenerate

// == Block connection ==========================================================
// Connects first request and acknoledge layer to input
for( i = 0; i < input_size; i++ ) begin
    assign req_layers[0][i] = req_in[i];
    assign ack_layers[0][i] = ack_in[i];
end

endmodule
