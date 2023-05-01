//==============================================================================
//  Filename    : network.sv                                              
//  Designer    : Fernando Welzel
//  Description : Final neural network configuration file - No parameters (All 
//                values hard coded).
//==============================================================================
module network_synth (
    input  logic   [3:0]  req_in, // Request from input neurons
    output logic   [3:0]  ack_in, // Acknoledge to input neurons
    
    output logic   [1:0] req_out, // Request to next neuron layer
    input  logic   [1:0] ack_out, // Acknoledge from next neuron layer

    input  logic             rst  // Reset
);

// == Import package as initial value ==========================================
import weights_pkg::*;
import thresholds_pkg::*;

// == Instantiation of network =================================================
network #(
    .w_size        ( 8 ),  // Size of weights in bits
    .neurons_in    ( 4 ),  // Number of neurons in the previous layer
    .neurons_hidden( 8 ),  // Number of hidden neurons
    .neurons_out   ( 2 ),  // Number of neurons in the next layer

    // Weights from all layers
    .weights_IH( weight_layer1 ),
    .weights_HO( weight_layer2 ),

    // Thresholds from all layers
    .thr_IH( thresholds_layer1 ),
    .thr_HO( thresholds_layer2 ),

    // Delay of each internal controller in 'ns'
    .delay_v( {1, 1} )    
) full_network (
    .req_in ( req_in  ),
    .ack_in ( ack_in  ),
    .req_out( req_out ),
    .ack_out( ack_out ),
    .rst    ( rst     )
);

endmodule
