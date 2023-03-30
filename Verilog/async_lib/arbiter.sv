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
integer num_layers  = ceil(log2(input_size)); // Calculate the number of layers to n inputs
integer arb_num = input_size;                 // Represents the number of arbiters in the current layer
integer flag;       // Flag to save that the current layer has an odd number of inputs

genvar i, j;        // Iterators

logic [num_layers-1:0] [input_size-1:0] req_layers; // Create a matrix of requests to interconnect the arbiters
logic [num_layers-1:0] [input_size-1:0] ack_layers; // Create a matrix of acknoledges to interconnect the arbiters
logic [num_layers-1:0] [input_size-1:0] sel_layers; // Create a matrix of selections to interconnect the arbiters

// == Instantiation =============================================================
// Iterates though layers creating and connecting arbiters
generate   
    for( i = 0; i < num_layers; i++ ) begin
        flag = arb_num%2;                  // Saves value for odd number of inputs
        arb_num = (arb_num - arb_num%2)/2; // Calculate the number of arbiters in the current layer

        // Iterates conecting arbiters to current position
        for ( j = 0; j < arb_num; j++ ) begin
            // Create all 2 bit arbiters in a layer and connect them to their respective request and acknoledge
            arbiter_2b arbiter_internal(
                .req_in({req_layers[i][2*j], req_layers[i][2*j+1]}),
                .ack_in({ack_layers[i][2*j], ack_layers[i][2*j+1]}),
                .req_out(req_layers[i+1][j]),
                .ack_out(ack_layers[i+1][j]),
                .sel(sel_layers[i+1][j])
            );
        end
        
        // If flag high - Connect last input to next layer
        if ( flag ) begin
            req_layers[i+1][arb_num] = req_layers[i][arb_num*2];
            ack_layers[i+1][arb_num] = ack_layers[i][arb_num*2];
        end

        // Creates layer selection according to selections in each layer
        mux #(
            .data_bits(1),
            .sel_bits(num_layers)
        ) mux_internal (
            .data_in(sel_layers[i+1][arb_num+flag:0]),
            .data_out(sel[i]),
            .sel(sel[num_layers:i+1])
        );
    end 
endgenerate

// == Block connection ==========================================================
// Connects first request and acknoledge layer to input
for( i = 0; i < input_size; i++ ) begin
    req_layers[0][i] = req_in[i];
    ack_layers[0][i] = ack_in[i];
end

endmodule
