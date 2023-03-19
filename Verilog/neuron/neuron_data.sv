//==============================================================================
//  Filename    : neuron_data.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Spiking Neuron data-flow -> Control given by neuron_ctrl
//==============================================================================
module neuron_data #(
  parameter integer    weight = 1,  // Weight to be applied to data_in
  parameter integer     thold = 8,  // Threshold value
  parameter integer data_bits = 4   // Internal data resolution         
  )(
  input  logic        data_in, // Data from previous neuron
  output logic       data_out, // Data to next neuron

  input  logic [5:0] ctrl_vec, // Control vector comming from neuron_ctrl
  
  input  logic            rst  // Circuit asyncronous reset -> data_out = 0 
);

timeunit      1ns;
timeprecision 1ns;

// == Variables Declaration ====================================================
logic  data_in_register_1, data_out_register_1;
logic  [data_bits-1:0] data_in_register_2, data_out_register_2;
logic  [data_bits-1:0] data_in_register_3, data_out_register_3;
logic  [data_bits-1:0] data_in_register_4, data_out_register_4;
logic  [data_bits-1:0] data_in_register_5, data_out_register_5;
logic  data_in_register_6, data_out_register_6;

logic  [1:0] [data_bits-1:0]  data_in_mux_1;
logic        [data_bits-1:0] data_out_mux_1;
logic                             sel_mux_1;

logic  [1:0] [data_bits-1:0]  data_in_mux_2;
logic        [data_bits-1:0] data_out_mux_2;
logic                             sel_mux_2;


logic  [data_bits-1:0] data_in_1_comp, data_in_2_comp;
logic                                   data_out_comp;


// == Blocks instantiation =====================================================
register  #(.size(1))         register_1( .data_in(data_in_register_1), .data_out(data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
register  #(.size(data_bits)) register_2( .data_in(data_in_register_2), .data_out(data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) ); 
register  #(.size(data_bits)) register_3( .data_in(data_in_register_3), .data_out(data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) ); 
register  #(.size(data_bits)) register_4( .data_in(data_in_register_4), .data_out(data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) ); 
register  #(.size(data_bits)) register_5( .data_in(data_in_register_5), .data_out(data_out_register_5), .ctrl(ctrl_vec[4]), .rst(rst) ); 
register  #(.size(1))         register_6( .data_in(data_in_register_6), .data_out(data_out_register_6), .ctrl(ctrl_vec[5]), .rst(rst) ); 

mux #(
    .data_bits(data_bits),
    .sel_bits(1)
) mux_1 (
    .data_in(data_in_mux_1),
    .data_out(data_out_mux_1),
    .sel(sel_mux_1)
);

mux #(
    .data_bits(data_bits),
    .sel_bits(1)
) mux_2 (
    .data_in(data_in_mux_2),
    .data_out(data_out_mux_2),
    .sel(sel_mux_2)
);


// == Connecting blocks =====================================================
assign data_in_register_1 = data_in;
assign sel_mux_1 = data_out_register_1;

assign data_in_mux_1 = { weight, {data_bits{1'b0}} };

assign data_in_register_3 = data_out_mux_1;

assign data_in_register_4 = data_out_register_2 + data_out_register_3;

assign data_in_1_comp = data_out_register_4;
assign data_in_2_comp = thold;

assign data_out_comp = ( data_in_1_comp > data_in_2_comp ) ? 1 : 0;

assign data_in_mux_2 = { {data_bits{1'b0}}, data_out_register_4 };
assign sel_mux_2 = data_out_comp;

assign data_in_register_5 = data_out_mux_2;
assign data_in_register_6 = data_out_comp;

assign data_in_register_2 = data_out_register_5;
assign data_out = data_in_register_6;

endmodule
