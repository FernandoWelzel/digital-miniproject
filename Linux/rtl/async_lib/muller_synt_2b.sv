//==============================================================================
//  Filename    : muller_synt_2b.sv                                         
//  Designer    : Fernando WELZEL
//  Description : 2 Port Muller Gate using MAJ port
//==============================================================================
module muller_synt_2b #(
  parameter bit   rst_set = 0   // If rst_set == 1 => Resets storing a 1 in data_out
)(
  input  logic [1:0]  data_in,  // Input values
  output logic       data_out,  // Output value
  
  input  logic            rst   // Asyncronous posedge reset
);

// == Variable declaration ====================================================
logic data_in_imag_A, data_in_imag_B, data_in_imag_C;
logic data_out_imag_Q, data_out_imag_Q_inv;

// == Instantiation ===========================================================
IMAJ30 IMAJ30_muller(.A(data_in_imag_A), .B(data_in_imag_B), .C(data_in_imag_C), .Q(data_out_imag_Q));
delay  delay_muller (.data_in(~data_out_imag_Q), .data_out(data_out_imag_Q_inv));

// == Variable connection =====================================================
generate
  if(rst_set == 1) begin
    assign data_in_imag_A = data_in[0]|(rst);
    assign data_in_imag_B = data_in[1]|(rst);
  end
  else begin
    assign data_in_imag_A = data_in[0]&(~rst);
    assign data_in_imag_B = data_in[1]&(~rst);
  end
endgenerate

assign data_in_imag_C = data_out_imag_Q_inv;
assign data_out = data_out_imag_Q_inv;

endmodule
