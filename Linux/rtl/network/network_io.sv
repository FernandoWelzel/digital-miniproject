//==============================================================================
//  Filename    : network_io.sv                                       
//  Designer    : Luca SAUER DE ARAUJO 
//  Description : Interface connections with "outside" world - File used for the process of the neural network placemente and rooting
//==============================================================================

`include "./network_netlist.v" // file generated with design_vision -> netlist

module network_io (
// inputs for the network with 4 neurons at input layer
    input logic req_in[3:0],      
    input logic ack_out[3:0],
    input logic rst,

// outputs for the network with 2 neurons at output layer
    output logic ack_in[1:0], 
    output logic req_out[1:0],

// Wires to make the connection
    wire [3:0] req_in_P,
    wire [3:0] ack_out_P,
    wire [1:0] ack_in_P,
    wire [1:0] req_out_P,
    wire rst_P
);

// Instantiation 
network_netlist net_op (.req_in ( req_in[3:0] ), .ack_in ( ack_in[1:0] ), .req_out ( req_out[1:0] ), .ack_out ( ack_out[3:0] ), .rst( rst )); 

// Instantiation with blocks cointained on the library for the connection 

// INPUTS ==============================================
//               req_in
ITP io_req_in3 ( .PAD ( req_in[3] ), .Y (req_in_P[3] ) );
ITP io_req_in2 ( .PAD ( req_in[2] ), .Y (req_in_P[2] ) );
ITP io_req_in1 ( .PAD ( req_in[1] ), .Y (req_in_P[1] ) );
ITP io_req_in0 ( .PAD ( req_in[0] ), .Y (req_in_P[0] ) );

//               ack_out
ITP io_ack_out3 ( .PAD ( ack_out[3] ), .Y ( ack_out_P[3] ) );
ITP io_ack_out2 ( .PAD ( ack_out[2] ), .Y ( ack_out_P[2] ) );
ITP io_ack_out1 ( .PAD ( ack_out[1] ), .Y ( ack_out_P[1] ) );
ITP io_ack_out0 ( .PAD ( ack_out[0] ), .Y ( ack_out_P[0] ) );
//               rst
ITP io_rst ( .PAD ( rst ), .Y ( rst_P ) );

// OUTPUTS ==============================================
//               ack_in
BU12SP io_ack_in1 ( .A( ack_in_P[1] ), .PAD( ack_in[1] ) );
BU12SP io_ack_in0 ( .A( ack_in_P[0] ), .PAD( ack_in[0] ) );
//               req_out
BU12SP io_req_out1 ( .A( req_out_P[1] ), .PAD( req_out[1] ) );
BU12SP io_req_out0 ( .A( req_out_P[0] ), .PAD( req_out[0] ) );

endmodule