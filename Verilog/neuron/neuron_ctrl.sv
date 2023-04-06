//==============================================================================
//  Filename    : neuron_ctrl.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Control block for spiking neuron.
//
//  Delay vector association (defined in ns)
//   * delay_v[0] --> Addition
//   * delay_v[1] --> Comparison threshold
//
//==============================================================================
module neuron_ctrl #(
  parameter integer delay_v [1:0] = {1, 1}  // Delay vector from each combinational block - See description
  )(
  input  logic         req_in, // Request from the previous neuron
  output logic         ack_in, // Acknowledge to the previous neuron

  output logic        req_out, // Request to the next neuron
  input  logic        ack_out, // Acknowledge to the next neuron

  output logic [4:0] ctrl_vec, // Control vector

  input  logic            rst  // Circuit asyncronous reset -> req_out = 0 
);

timeunit      1ns;
timeprecision 1ns;

// == Variables Declaration ====================================================
logic  req_in_ctrl_1, req_out_ctrl_1,  ack_in_ctrl_1, ack_out_ctrl_1;
logic  req_in_ctrl_2, req_out_ctrl_2,  ack_in_ctrl_2, ack_out_ctrl_2;
logic  req_in_ctrl_3, req_out_ctrl_3,  ack_in_ctrl_3, ack_out_ctrl_3;
logic  req_in_ctrl_4, req_out_ctrl_4,  ack_in_ctrl_4, ack_out_ctrl_4;
logic  req_in_ctrl_5, req_out_ctrl_5,  ack_in_ctrl_5, ack_out_ctrl_5;

logic  [1:0]  req_in_join,   ack_in_join;
logic        req_out_join,  ack_out_join;

logic         req_in_fork,   ack_in_fork;
logic  [1:0] req_out_fork,  ack_out_fork;

// == Blocks instantiation =====================================================
ctrl ctrl_2(.req_in(req_in_ctrl_2), .req_out(req_out_ctrl_2), .ack_in(ack_in_ctrl_2), .ack_out(ack_out_ctrl_2), .ctrl_out(ctrl_vec[1]), .rst(rst));
ctrl ctrl_3(.req_in(req_in_ctrl_3), .req_out(req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ack_out(ack_out_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(rst));
ctrl ctrl_4(.req_in(req_in_ctrl_4), .req_out(req_out_ctrl_4), .ack_in(ack_in_ctrl_4), .ack_out(ack_out_ctrl_4), .ctrl_out(ctrl_vec[3]), .rst(rst));
ctrl ctrl_5(.req_in(req_in_ctrl_5), .req_out(req_out_ctrl_5), .ack_in(ack_in_ctrl_5), .ack_out(ack_out_ctrl_5), .ctrl_out(ctrl_vec[4]), .rst(rst));

ctrl_rst_on ctrl_1(.req_in(req_in_ctrl_1), .req_out(req_out_ctrl_1), .ack_in(ack_in_ctrl_1), .ack_out(ack_out_ctrl_1), .ctrl_out(ctrl_vec[0]), .rst(rst));

join_param #(.size(2)) join_main(
  .req_in(req_in_join),
  .ack_in(ack_in_join),
  .req_out(req_out_join),
  .ack_out(ack_out_join),
  .rst(rst)
);

fork_param #(.size(2)) fork_main(
  .req_in(req_in_fork),
  .ack_in(ack_in_fork),
  .req_out(req_out_fork),
  .ack_out(ack_out_fork),
  .rst(rst)
);

// == Connecting with delay =================================================
always @(req_out_join) begin
  #(delay_v[0]) req_in_ctrl_3 <= req_out_join;
end

always @(req_out_ctrl_3) begin
  #(delay_v[1]) req_in_fork <= req_out_ctrl_3;
end

// == Connecting blocks =====================================================
assign req_in_ctrl_2 = req_in;
assign ack_in = ack_in_ctrl_2;

assign req_in_join = {req_out_ctrl_2, req_out_ctrl_1};
assign ack_out_ctrl_1 = ack_in_join[0];
assign ack_out_ctrl_2 = ack_in_join[1];
assign ack_out_join = ack_in_ctrl_3;

assign ack_out_ctrl_3 = ack_in_fork;
assign req_in_ctrl_4 = req_out_fork[0];
assign req_in_ctrl_5 = req_out_fork[1];
assign ack_out_fork = {ack_in_ctrl_5, ack_in_ctrl_4}; 

assign req_in_ctrl_1 = req_out_ctrl_4;
assign ack_out_ctrl_4 = ack_in_ctrl_1;

assign req_out = req_out_ctrl_5;
assign ack_out_ctrl_5 = ack_out;

endmodule
