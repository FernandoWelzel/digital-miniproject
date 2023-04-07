//==============================================================================
//  Filename    : muller_synt_2b.sv                                         
//  Designer    : Fernando WELZEL
//  Description : 2 Port Muller Gate using MAJ port
//==============================================================================
module muller_synt_2b (
  input  logic [1:0]  data_in,  // Input values
  output logic       data_out,  // Output value
  
  input  logic            rst   // Asyncronous posedge reset -> data_out = 0
);

// == Variable declaration ====================================================
logic data_in_imag_A, data_in_imag_B, data_in_imag_C;
logic data_out_imag_Q;

// == Instantiation ===========================================================
IMAJ30( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_in_imag_C), .Q(data_out_imag_Q));
delay #(.delay(1)) delay_muller (.data_in(data_out_imag_Q), .data_out(data_in_imag_C));

// == Variable connection =====================================================
assign data_out = data_out_imag_Q;

assign data_in_imag_A = data_in[0]&(~rst);
assign data_in_imag_B = data_in[1]&(~rst);

endmodule
