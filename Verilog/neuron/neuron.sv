//==============================================================================
//  Filename    : neuron.sv                                         
//  Designer    : Fernando WELZEL
//  Description : One input spiking neuron desing to be used in neural networks.
//
//  Delay vector association:
//   * delay[0] --> Weight multiplication
//   * delay[1] --> Addition
//   * delay[2] --> Comparison threshold
//
//==============================================================================
module neuron #(
  parameter integer               weight = 1,  // Weight to be applied to data_in
  parameter integer               thold  = 8,  // Threshold value
  parameter integer   delay [2:0] = {1, 1, 1}  // Delay from each combinational block - See description
  )  
  (
  input  logic    data_in, // Data from the previous neuron
  input  logic     req_in, // Request from the previous neuron
  output logic     ack_in, // Acknowledge to the previous neuron

  output logic   data_out, // Data to the next neuron
  output logic    req_out, // Request to the next neuron
  input logic     ack_out, // Acknowledge to the next neuron

  input logic         rst  // Circuit asyncronous reset -> req_out = 0 
);

// == Variables Declaration ====================================================
logic  req_in_ctrl_1, req_out_ctrl_1,  ack_in_ctrl_1, ack_out_ctrl_1;
logic  req_in_ctrl_2, req_out_ctrl_2,  ack_in_ctrl_2, ack_out_ctrl_2;
logic  req_in_ctrl_3, req_out_ctrl_3,  ack_in_ctrl_3, ack_out_ctrl_3;
logic  req_in_ctrl_4, req_out_ctrl_4,  ack_in_ctrl_4, ack_out_ctrl_4;
logic  req_in_ctrl_5, req_out_ctrl_5,  ack_in_ctrl_5, ack_out_ctrl_5;
logic  req_in_ctrl_6, req_out_ctrl_6,  ack_in_ctrl_6, ack_out_ctrl_6;

logic  ctrl_sig_1, ctrl_sig_2, ctrl_sig_3, ctrl_sig_4, ctrl_sig_5, ctrl_sig_6;

logic  [1:0]  req_in_join,   ack_in_join;
logic        req_out_join,  ack_out_join;

logic         req_in_fork,   ack_in_fork;
logic  [1:0] req_out_fork,  ack_out_fork;

// == Blocks instantiation =====================================================
ctrl ctrl_1(.req_in(req_in_ctrl_1), .req_out(req_out_ctrl_1), .ack_in(ack_in_ctrl_1), .ack_out(ack_out_ctrl_1), .ctrl(ctrl_sig_1), .rst(rst));
ctrl ctrl_3(.req_in(req_in_ctrl_3), .req_out(req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ack_out(ack_out_ctrl_3), .ctrl(ctrl_sig_3), .rst(rst));
ctrl ctrl_4(.req_in(req_in_ctrl_4), .req_out(req_out_ctrl_4), .ack_in(ack_in_ctrl_4), .ack_out(ack_out_ctrl_4), .ctrl(ctrl_sig_4), .rst(rst));
ctrl ctrl_5(.req_in(req_in_ctrl_5), .req_out(req_out_ctrl_5), .ack_in(ack_in_ctrl_5), .ack_out(ack_out_ctrl_5), .ctrl(ctrl_sig_5), .rst(rst));
ctrl ctrl_6(.req_in(req_in_ctrl_6), .req_out(req_out_ctrl_6), .ack_in(ack_in_ctrl_6), .ack_out(ack_out_ctrl_6), .ctrl(ctrl_sig_6), .rst(rst));

ctrl_rst_on ctrl_2(.req_in(req_in_ctrl_2), .req_out(req_out_ctrl_2), .ack_in(ack_in_ctrl_2), .ack_out(ack_out_ctrl_2), .ctrl(ctrl_sig_2), .rst(rst));

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
always @(req_out_ctrl_1) begin
  #(delay[0]) req_in_ctrl_3 <= req_out_ctrl_1;
end

always @(req_out_join) begin
  #(delay[1]) req_in_ctrl_4 <= req_out_join;
end

always @(req_out_ctrl_4) begin
  #(delay[2]) req_in_fork <= req_out_ctrl_4;
end

// == Connecting blocks =====================================================
assign req_in_ctrl_1 = req_in;
assign ack_in = ack_out_ctrl_1;

assign ack_out_ctrl_1 = ack_in_ctrl_3;

assign req_in_join = {req_out_ctrl_2, req_out_ctrl_3};
assign {ack_out_ctrl_2, req_out_ctrl_3} = ack_in_join;
assign ack_out_join = ack_in_ctrl_4;

assign ack_out_ctrl_4 = ack_in_fork;
assign {req_in_ctrl_5, req_in_ctrl_6} = req_out_fork;
assign ack_out_fork = {ack_in_ctrl_5, ack_in_ctrl_6}; 

assign req_in_ctrl_2 = req_out_ctrl_5;
assign ack_out_ctrl_5 = ack_in_ctrl_2;

assign req_out = req_out_ctrl_6;
assign ack_out_ctrl_6 = ack_out;

endmodule
