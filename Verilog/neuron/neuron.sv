//==============================================================================
//  Filename    : neuron.sv                                         
//  Designer    : Fernando WELZEL
//  Description : One input spiking neuron desing to be used in neural networks.
//
//  Delay vector association (defined in ns)
//   * delay_v[0] --> Addition
//   * delay_v[1] --> Comparison threshold
//
//==============================================================================
module neuron #(
  parameter integer               thold  = 8,  // Threshold value
  parameter integer            data_bits = 4,  // Internal data resolution  
  parameter integer    delay_v [1:0] = {1, 1}  // Delay vector from each combinational block - See description
  )  
  (
  input  logic [data_bits-1:0] data_in, // Data from the previous neuron
  input  logic                  req_in, // Request from the previous neuron
  output logic                  ack_in, // Acknowledge to the previous neuron

  output logic                 req_out, // Request to the next neuron
  input  logic                 ack_out, // Acknowledge to the next neuron

  input  logic                     rst  // Circuit asyncronous reset -> req_out = 0 
);

timeunit      1ns;
timeprecision 1ns;

// == Variables Declaration ====================================================
logic [4:0] ctrl_vec;
logic data_out_inter, req_out_inter, ack_out_inter; // Intermidiary variables to pass/dont-pass policy

// == Modules instantiation ====================================================
neuron_ctrl #(
    .delay_v(delay_v)
) neuron_main_ctrl (
    .req_in(req_in),
    .ack_in(ack_in),
    .req_out(req_out_inter),
    .ack_out(ack_out_inter),
    .ctrl_vec(ctrl_vec),
    .rst(rst)
);

neuron_data #(
    .thold(thold),
    .data_bits(data_bits)
) neuron_main_data (
    .data_in(data_in),
    .data_out(data_out_inter),
    .ctrl_vec(ctrl_vec),
    .rst(rst)
);

// == Blocks connections =====================================================
// Implements pass/dont-pass policy -> I gave it this name, this name doesn't exist in the literature
assign req_out = data_out_inter & req_out_inter;
always @* #1 ack_out_inter = (~data_out_inter & req_out_inter) | ack_out; // Small delay for system stability

endmodule
