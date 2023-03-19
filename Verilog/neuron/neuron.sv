//==============================================================================
//  Filename    : neuron.sv                                         
//  Designer    : Fernando WELZEL
//  Description : One input spiking neuron desing to be used in neural networks.
//
//  Delay vector association (defined in ns)
//   * delay_v[0] --> Weight multiplication
//   * delay_v[1] --> Addition
//   * delay_v[2] --> Comparison threshold
//
//==============================================================================
module neuron #(
  parameter integer               weight = 1,  // Weight to be applied to data_in
  parameter integer               thold  = 8,  // Threshold value
  parameter integer            data_bits = 4,  // Internal data resolution  
  parameter integer delay_v [2:0] = {1, 1, 1}  // Delay vector from each combinational block - See description
  )  
  (
  input  logic    data_in, // Data from the previous neuron
  input  logic     req_in, // Request from the previous neuron
  output logic     ack_in, // Acknowledge to the previous neuron

  output logic   data_out, // Data to the next neuron
  output logic    req_out, // Request to the next neuron
  input  logic    ack_out, // Acknowledge to the next neuron

  input  logic        rst  // Circuit asyncronous reset -> req_out = 0 
);

timeunit      1ns;
timeprecision 1ns;

// == Variables Declaration ====================================================
logic [5:0] ctrl_vec;

// == Blocks instantiation =====================================================
neuron_ctrl #(
    .delay_v(delay_v)
) neuron_main_ctrl (
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_out),
    .ack_out(ack_out),
    .ctrl_vec(ctrl_vec),
    .rst(rst)
);

neuron_data #(
    .weight(weight),
    .thold(thold),
    .data_bits(data_bits)
) neuron_main_data (
    .data_in(data_in),
    .data_out(data_out),
    .ctrl_vec(ctrl_vec),
    .rst(rst)
);

endmodule
