//==============================================================================
//  Filename    : IMAJ30.sv                                         
//  Designer    : AMS 
//  Description : AMS' design of inverted majority gate
//==============================================================================
module IMAJ30 (A,B,C,Q);

// == Set time format =========================================================
timeunit      1ns;
timeprecision 1ns;
// ============================================================================

output Q;
input A,B,C;

and (g_1_out,B,A);
and (g_2_out,C,B);
and (g_3_out,C,A);
nor (Q,g_1_out,g_2_out,g_3_out);

`ifdef functional
`else
specify
 (A => Q) = (0,0);
 (B => Q) = (0,0);
 (C => Q) = (0,0);
endspecify
`endif

endmodule


