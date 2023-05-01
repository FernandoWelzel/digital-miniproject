
module mutex_0 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_90 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_90 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_90 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_80 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_90 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_80 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_89 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_89 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_89 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_79 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_89 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_59 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_79 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_138 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_118 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_138 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_137 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_117 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_137 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_0 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n2, n3;

  mutex_0 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_0 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_59 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_118 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_117 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U2 ( .A(req_in[0]), .B(u3_out), .C(req_in[1]), .D(u4_out), .Q(n1) );
  NOR20 U3 ( .A(n2), .B(ack_in[0]), .Q(u4_out) );
  CLKIN0 U4 ( .A(sel), .Q(n2) );
  NOR20 U5 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U6 ( .A(g1), .Q(n3) );
endmodule


module mutex_9 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR24 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_88 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_88 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_88 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_78 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_88 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_58 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_78 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_87 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_87 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_87 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_77 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_87 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_57 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_77 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_136 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_116 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_136 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_135 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_115 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_135 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_9 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n4, n5;

  NOR24 U2 ( .A(n5), .B(ack_in[0]), .Q(u4_out) );
  NOR24 U3 ( .A(n4), .B(ack_in[1]), .Q(u3_out) );
  mutex_9 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_58 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_57 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_116 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_115 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U4 ( .A(u3_out), .B(req_in[0]), .C(u4_out), .D(req_in[1]), .Q(n1) );
  CLKIN0 U5 ( .A(g1), .Q(n4) );
  CLKIN0 U6 ( .A(sel), .Q(n5) );
endmodule


module mutex_8 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_86 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_86 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_86 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_76 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_86 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_56 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_76 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_85 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_85 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_85 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_75 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_85 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_55 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_75 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_134 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_114 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_134 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_133 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_113 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_133 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_8 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n2, n4;

  NOR24 U3 ( .A(n4), .B(ack_in[1]), .Q(u3_out) );
  mutex_8 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_56 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_55 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_114 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_113 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U2 ( .A(req_in[1]), .B(u4_out), .C(u3_out), .D(req_in[0]), .Q(n1) );
  NOR20 U4 ( .A(n2), .B(ack_in[0]), .Q(u4_out) );
  CLKIN0 U5 ( .A(sel), .Q(n2) );
  CLKIN0 U6 ( .A(g1), .Q(n4) );
endmodule


module arbiter_cascade_input_size4 ( req_in, ack_in, req_out, ack_out, sel, 
        rst );
  input [3:0] req_in;
  output [3:0] ack_in;
  output [3:0] sel;
  input ack_out, rst;
  output req_out;
  wire   n1, n2;
  wire   [2:1] req_inter;
  wire   [2:1] ack_inter;
  wire   [1:0] sel_bits;

  arbiter_2b_rev3_0 \genblk1[0].arbiter_cascade_gen  ( .req_in(req_in[1:0]), 
        .ack_in(ack_in[1:0]), .req_out(req_inter[1]), .ack_out(ack_inter[1]), 
        .sel(sel_bits[0]), .rst(rst) );
  arbiter_2b_rev3_9 \genblk1[1].arbiter_cascade_gen  ( .req_in({req_in[2], 
        req_inter[1]}), .ack_in({ack_in[2], ack_inter[1]}), .req_out(
        req_inter[2]), .ack_out(ack_inter[2]), .sel(sel_bits[1]), .rst(rst) );
  arbiter_2b_rev3_8 \genblk1[2].arbiter_cascade_gen  ( .req_in({req_in[3], 
        req_inter[2]}), .ack_in({ack_in[3], ack_inter[2]}), .req_out(req_out), 
        .ack_out(ack_out), .sel(sel[3]), .rst(rst) );
  NOR20 U1 ( .A(sel[3]), .B(n1), .Q(sel[2]) );
  CLKIN0 U2 ( .A(sel_bits[1]), .Q(n1) );
  NOR30 U3 ( .A(n2), .B(sel_bits[1]), .C(sel[3]), .Q(sel[1]) );
  CLKIN0 U4 ( .A(sel_bits[0]), .Q(n2) );
  NOR30 U5 ( .A(sel[3]), .B(sel_bits[1]), .C(sel_bits[0]), .Q(sel[0]) );
endmodule


module delay_1b_delay10_0 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay10_0 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay10_0 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module delay_1b_delay1_98 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_98 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_98 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n1, n2, n3;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_98 delay_muller ( .data_in(n1), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n1) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_97 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_97 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_97 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_87 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_97 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_96 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_96 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_96 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_86 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_96 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_95 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_95 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_95 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_85 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_95 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_94 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_94 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_94 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_84 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_94 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_93 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_93 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_93 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_83 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_93 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module delay_1b_delay1_92 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_92 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_92 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_82 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_92 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size8 ( data_in, data_out, rst );
  input [7:0] data_in;
  input rst;
  output data_out;

  wire   [5:0] data_inter;

  muller_synt_2b_0_0 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in[1:0]), 
        .data_out(data_inter[0]), .rst(rst) );
  muller_synt_2b_0_87 \genblk1[2].genblk1.muller_gen  ( .data_in({data_in[2], 
        data_inter[0]}), .data_out(data_inter[1]), .rst(rst) );
  muller_synt_2b_0_86 \genblk1[3].genblk1.muller_gen  ( .data_in({data_in[3], 
        data_inter[1]}), .data_out(data_inter[2]), .rst(rst) );
  muller_synt_2b_0_85 \genblk1[4].genblk1.muller_gen  ( .data_in({data_in[4], 
        data_inter[2]}), .data_out(data_inter[3]), .rst(rst) );
  muller_synt_2b_0_84 \genblk1[5].genblk1.muller_gen  ( .data_in({data_in[5], 
        data_inter[3]}), .data_out(data_inter[4]), .rst(rst) );
  muller_synt_2b_0_83 \genblk1[6].genblk1.muller_gen  ( .data_in({data_in[6], 
        data_inter[4]}), .data_out(data_inter[5]), .rst(rst) );
  muller_synt_2b_0_82 \genblk1[7].genblk1.muller_gen  ( .data_in({data_in[7], 
        data_inter[5]}), .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size8 ( req_in, ack_in, req_out, ack_out, rst );
  output [7:0] req_out;
  input [7:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;
  assign req_out[2] = req_in;
  assign req_out[3] = req_in;
  assign req_out[4] = req_in;
  assign req_out[5] = req_in;
  assign req_out[6] = req_in;
  assign req_out[7] = req_in;

  muller_synt_size8 muller_fork ( .data_in(ack_out), .data_out(ack_in), .rst(
        rst) );
endmodule


module rom_layer_8_4_8 ( addr, data );
  input [3:0] addr;
  output [63:0] data;
  wire   \data[61] , \data[63] , n1;
  assign data[52] = data[37];
  assign data[58] = data[37];
  assign data[50] = data[36];
  assign data[51] = data[36];
  assign data[41] = data[34];
  assign data[57] = data[34];
  assign data[24] = data[21];
  assign data[56] = data[19];
  assign data[32] = data[12];
  assign data[48] = data[12];
  assign data[59] = data[12];
  assign data[53] = data[12];
  assign data[45] = data[12];
  assign data[11] = data[10];
  assign data[15] = data[10];
  assign data[27] = data[10];
  assign data[14] = data[10];
  assign data[13] = data[9];
  assign data[35] = data[9];
  assign data[20] = data[9];
  assign data[25] = data[1];
  assign data[43] = data[1];
  assign data[60] = data[1];
  assign data[42] = data[1];
  assign data[18] = data[0];
  assign data[33] = data[0];
  assign data[29] = data[0];
  assign data[4] = \data[61] ;
  assign data[16] = \data[61] ;
  assign data[49] = \data[61] ;
  assign data[61] = \data[61] ;
  assign data[3] = \data[63] ;
  assign data[6] = \data[63] ;
  assign data[7] = \data[63] ;
  assign data[8] = \data[63] ;
  assign data[17] = \data[63] ;
  assign data[22] = \data[63] ;
  assign data[23] = \data[63] ;
  assign data[28] = \data[63] ;
  assign data[30] = \data[63] ;
  assign data[31] = \data[63] ;
  assign data[38] = \data[63] ;
  assign data[39] = \data[63] ;
  assign data[40] = \data[63] ;
  assign data[44] = \data[63] ;
  assign data[46] = \data[63] ;
  assign data[47] = \data[63] ;
  assign data[54] = \data[63] ;
  assign data[55] = \data[63] ;
  assign data[62] = \data[63] ;
  assign data[63] = \data[63] ;

  LOGIC0 U3 ( .Q(\data[63] ) );
  LOGIC1 U4 ( .Q(\data[61] ) );
  CLKIN0 U5 ( .A(data[0]), .Q(data[9]) );
  NAND20 U6 ( .A(data[1]), .B(data[26]), .Q(data[37]) );
  CLKIN0 U7 ( .A(data[10]), .Q(data[26]) );
  CLKIN0 U8 ( .A(data[12]), .Q(data[21]) );
  CLKIN0 U9 ( .A(data[5]), .Q(data[1]) );
  NOR20 U10 ( .A(data[19]), .B(data[36]), .Q(data[5]) );
  NOR20 U11 ( .A(data[19]), .B(data[34]), .Q(data[12]) );
  NOR20 U12 ( .A(data[2]), .B(data[34]), .Q(data[10]) );
  CLKIN0 U13 ( .A(data[36]), .Q(data[34]) );
  NOR20 U14 ( .A(data[36]), .B(data[2]), .Q(data[0]) );
  CLKIN0 U15 ( .A(data[19]), .Q(data[2]) );
  NOR20 U16 ( .A(addr[3]), .B(addr[2]), .Q(data[19]) );
  AOI210 U17 ( .A(n1), .B(addr[1]), .C(addr[3]), .Q(data[36]) );
  CLKIN0 U18 ( .A(addr[2]), .Q(n1) );
endmodule


module delay_1b_delay1_70 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_70 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_70 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_60 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_70 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_40 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_60 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_0 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_40 muller_ctrl ( .data_in({req_in, n1}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
endmodule


module delay_1b_delay1_69 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_69 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_69 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_59 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_69 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_39 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_59 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_39 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_39 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_68 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_68 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_68 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_58 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_68 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_38 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_58 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_38 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_38 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_67 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_67 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_67 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_57 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_67 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_37 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_57 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_37 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_37 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_66 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_66 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_66 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n1, n2, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(n3), .B(n2), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n4) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n5) );
  delay_66 delay_muller ( .data_in(n1), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n1) );
  CLKIN0 U4 ( .A(n5), .Q(n3) );
  CLKIN0 U5 ( .A(n4), .Q(n2) );
endmodule


module muller_synt_rst_set1_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_0 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_0 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_0 muller_ctrl_rst_on ( .data_in({req_in, n1}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
endmodule


module delay_1b_delay1_65 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_65 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_65 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_56 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_65 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_20 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_56 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_0 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_20 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_64 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_64 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_64 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_55 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_64 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_19 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_55 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_10 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_19 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_132 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_0 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_132 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_131 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_19 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_131 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_0 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_0 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_39 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_38 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_37 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_0 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_0 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_10 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_0 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_19 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_0 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_39 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_38 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_37 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_0 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_0 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold63_data_bits8_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold63_data_bits8_0 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_0 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_39 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_38 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_37 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_0 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_0 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold63_data_bits8_0_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NOR21 U3 ( .A(data_out_register_3[7]), .B(n9), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  CLKIN0 U21 ( .A(data_out_register_3[6]), .Q(n9) );
endmodule


module delay_1b_delay1_0 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_0 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_0 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module neuron_62_8_0000000100000001_0 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n3, n2;
  wire   [4:0] ctrl_vec;

  NOR24 U1 ( .A(n2), .B(n1), .Q(req_out) );
  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_0 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold63_data_bits8_0 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_0 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U3 ( .A(data_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_63 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_63 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_63 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_54 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_63 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_36 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_54 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_36 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_36 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_62 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_62 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_62 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_53 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_62 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_35 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_53 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_35 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_35 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_61 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_61 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_61 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_52 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_61 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_34 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_52 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_34 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_34 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_60 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_60 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_60 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_51 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_60 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_33 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_51 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_33 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_33 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_59 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_59 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_59 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_9 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_59 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_9 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_9 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_9 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_9 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_58 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_58 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_58 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_50 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_58 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_18 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_50 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_9 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_18 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_57 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_57 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_57 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_49 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_57 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_17 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_49 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_9 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_17 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_130 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_18 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_130 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_129 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_17 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_129 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_9 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_36 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_35 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_34 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_33 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_9 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_9 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_9 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_18 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_17 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_36 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_35 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_34 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_33 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_9 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_9 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold58_data_bits8_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold58_data_bits8_0 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_36 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_35 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_34 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_33 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_9 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_9 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold58_data_bits8_0_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NOR21 U3 ( .A(data_out_register_3[7]), .B(n9), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  AOI310 U21 ( .A(data_out_register_3[5]), .B(data_out_register_3[4]), .C(n10), 
        .D(data_out_register_3[6]), .Q(n9) );
  NOR20 U22 ( .A(n11), .B(n12), .Q(n10) );
  CLKIN0 U23 ( .A(data_out_register_3[3]), .Q(n12) );
  AOI210 U24 ( .A(data_out_register_3[1]), .B(data_out_register_3[0]), .C(
        data_out_register_3[2]), .Q(n11) );
endmodule


module delay_1b_delay1_147 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_127 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_147 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_57_8_0000000100000001_0 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n3, n2;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_9 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold58_data_bits8_0 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_127 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_56 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_56 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_56 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_48 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_56 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_32 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_48 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_32 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_32 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_55 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_55 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_55 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_47 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_55 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_31 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_47 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_31 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_31 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_54 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_54 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_54 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_46 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_54 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_30 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_46 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_30 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_30 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_53 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_53 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_53 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_45 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_53 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_29 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_45 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_29 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_29 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_52 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_52 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_52 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_8 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_52 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_8 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_8 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_8 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_8 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_51 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_51 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_51 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_44 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_51 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_16 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_44 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_8 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_16 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_50 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_50 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_50 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_43 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_50 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_15 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_43 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_8 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_15 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_128 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_16 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_128 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_127 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_15 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_127 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_8 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_32 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_31 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_30 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_29 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_8 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_8 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_8 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_16 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_15 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_32 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_31 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_30 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_29 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_8 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_8 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold62_data_bits8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold62_data_bits8 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_32 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_31 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_30 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_29 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_8 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_8 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold62_data_bits8_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NOR21 U3 ( .A(data_out_register_3[7]), .B(n9), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  NOR20 U21 ( .A(n10), .B(data_out_register_3[6]), .Q(n9) );
  NOR20 U22 ( .A(n11), .B(n12), .Q(n10) );
  NAND30 U23 ( .A(data_out_register_3[4]), .B(data_out_register_3[3]), .C(
        data_out_register_3[5]), .Q(n12) );
  NAND30 U24 ( .A(data_out_register_3[1]), .B(data_out_register_3[0]), .C(
        data_out_register_3[2]), .Q(n11) );
endmodule


module delay_1b_delay1_146 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_126 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_146 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_61_8_0000000100000001 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n3, n2;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_8 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold62_data_bits8 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_126 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_49 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_49 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_49 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_42 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_49 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_28 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_42 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_28 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_28 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_48 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_48 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_48 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_41 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_48 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_27 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_41 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_27 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_27 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_47 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_47 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_47 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_40 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_47 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_26 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_40 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_26 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_26 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_46 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_46 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_46 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_39 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_46 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_25 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_39 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_25 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_25 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_45 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_45 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_45 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_7 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_45 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_7 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_7 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_7 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_7 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_44 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_44 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_44 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_38 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_44 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_14 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_38 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_7 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_14 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_43 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_43 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_43 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_37 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_43 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_13 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_37 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_7 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_13 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_126 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_14 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_126 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_125 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_13 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_125 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_7 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_28 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_27 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_26 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_25 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_7 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_7 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_7 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_14 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_13 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_28 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_27 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_26 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_25 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_7 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_7 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold59_data_bits8_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold59_data_bits8_0 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_28 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_27 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_26 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_25 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_7 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_7 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold59_data_bits8_0_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  AOI211 U3 ( .A(n9), .B(n10), .C(data_out_register_3[7]), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  NAND40 U21 ( .A(data_out_register_3[5]), .B(data_out_register_3[4]), .C(
        data_out_register_3[3]), .D(data_out_register_3[2]), .Q(n10) );
  CLKIN0 U22 ( .A(data_out_register_3[6]), .Q(n9) );
endmodule


module delay_1b_delay1_145 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_125 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_145 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_58_8_0000000100000001_0 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n3, n2;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_7 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold59_data_bits8_0 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_125 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_42 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_42 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_42 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_36 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_42 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_24 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_36 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_24 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_24 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_41 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_41 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_41 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_35 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_41 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_23 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_35 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_23 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_23 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_40 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_40 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_40 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_34 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_40 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_22 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_34 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_22 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_22 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_39 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_39 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_39 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_33 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_39 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_21 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_33 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_21 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_21 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_38 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_38 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_38 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_6 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_38 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_6 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_6 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_6 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_6 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_37 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_37 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_37 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_32 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_37 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_12 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_32 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_6 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_12 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_36 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_36 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_36 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_31 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_36 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_11 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_31 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_6 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_11 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_124 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_12 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_124 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_123 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_11 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_123 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_6 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_24 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_23 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_22 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_21 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_6 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_6 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_6 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_12 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_11 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_24 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_23 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_22 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_21 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_6 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_6 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold64_data_bits8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold64_data_bits8 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_24 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_23 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_22 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_21 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_6 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_6 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold64_data_bits8_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  AOI2111 U3 ( .A(n9), .B(n10), .C(n11), .D(data_out_register_3[7]), .Q(N20)
         );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  CLKIN0 U21 ( .A(data_out_register_3[6]), .Q(n11) );
  NOR30 U22 ( .A(data_out_register_3[3]), .B(data_out_register_3[5]), .C(
        data_out_register_3[4]), .Q(n10) );
  NOR30 U23 ( .A(data_out_register_3[0]), .B(data_out_register_3[2]), .C(
        data_out_register_3[1]), .Q(n9) );
endmodule


module delay_1b_delay1_144 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_124 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_144 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_63_8_0000000100000001 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n3, n2;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_6 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold64_data_bits8 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_124 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_35 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_35 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_35 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_30 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_35 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_20 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_30 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_20 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_20 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_34 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_34 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_34 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_29 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_34 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_19 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_29 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_19 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_19 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_33 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_33 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_33 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_28 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_33 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_18 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_28 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_18 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_18 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_32 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_32 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_32 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_27 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_32 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_17 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_27 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_17 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_17 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_31 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_31 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_31 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_5 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_31 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_5 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_5 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_5 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_5 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_30 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_30 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_30 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_26 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_30 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_10 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_26 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_5 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_10 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_29 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_29 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_29 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_25 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_29 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_9 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_25 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_5 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_9 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_122 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_10 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_122 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_121 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_9 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_121 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_5 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_20 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_19 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_18 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_17 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_5 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_5 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_5 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_10 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_9 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_20 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_19 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_18 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_17 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_5 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_5 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold63_data_bits8_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold63_data_bits8_1 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_20 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_19 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_18 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_17 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_5 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_5 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold63_data_bits8_1_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NOR21 U3 ( .A(data_out_register_3[7]), .B(n9), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  CLKIN0 U21 ( .A(data_out_register_3[6]), .Q(n9) );
endmodule


module delay_1b_delay1_143 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_123 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_143 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_62_8_0000000100000001_1 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n2, n4, n5;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n5), .C(n4), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_5 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold63_data_bits8_1 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_123 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n4) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n5) );
endmodule


module delay_1b_delay1_28 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_28 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_28 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_24 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_28 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_16 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_24 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_16 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_16 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_27 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_27 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_27 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_23 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_27 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_15 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_23 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_15 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_15 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_26 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_26 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_26 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_22 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_26 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_14 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_22 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_14 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_14 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_25 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_25 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_25 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_21 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_25 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_13 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_21 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_13 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_13 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_24 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_24 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_24 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_4 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_24 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_4 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_4 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_4 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_4 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_23 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_23 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_23 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_20 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_23 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_8 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_20 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_4 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_8 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_22 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_22 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_22 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_19 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_22 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_7 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_19 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_4 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_7 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_120 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_8 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_120 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_119 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_7 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_119 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_4 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_16 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_15 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_14 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_13 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_4 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_4 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_4 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_8 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_7 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_16 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_15 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_14 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_13 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_4 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_4 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold58_data_bits8_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold58_data_bits8_1 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_16 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_15 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_14 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_13 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_4 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_4 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold58_data_bits8_1_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NOR21 U3 ( .A(data_out_register_3[7]), .B(n9), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  AOI310 U21 ( .A(data_out_register_3[5]), .B(data_out_register_3[4]), .C(n10), 
        .D(data_out_register_3[6]), .Q(n9) );
  NOR20 U22 ( .A(n11), .B(n12), .Q(n10) );
  CLKIN0 U23 ( .A(data_out_register_3[3]), .Q(n12) );
  AOI210 U24 ( .A(data_out_register_3[1]), .B(data_out_register_3[0]), .C(
        data_out_register_3[2]), .Q(n11) );
endmodule


module delay_1b_delay1_142 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_122 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_142 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_57_8_0000000100000001_1 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n2, n4, n5;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n5), .C(n4), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_4 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold58_data_bits8_1 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_122 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n4) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n5) );
endmodule


module delay_1b_delay1_21 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_21 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_21 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_18 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_21 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[0]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_12 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_18 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_12 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_12 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_20 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_20 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_20 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_17 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_20 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_11 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_17 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_11 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_11 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_19 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_19 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_19 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_16 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_19 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_10 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_16 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_10 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_10 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_18 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_18 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_18 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_15 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_18 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_9 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_15 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_9 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_9 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_17 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_17 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_17 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_3 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_17 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_3 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_3 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_3 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_3 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_16 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_16 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_16 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_14 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_16 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_6 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_14 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_3 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_6 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_15 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_15 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_15 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_13 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_15 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_5 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_13 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_3 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_5 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_118 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_6 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_118 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_117 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_5 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_117 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_3 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_12 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_11 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_10 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), 
        .req_out(req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(
        ctrl_vec[3]), .rst(rst) );
  ctrl_9 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_3 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_3 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_3 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_6 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_5 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_12 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_11 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_10 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_9 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_3 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_3 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold59_data_bits8_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold59_data_bits8_1 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_12 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_11 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_10 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_9 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_3 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_3 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold59_data_bits8_1_DW01_add_0 r66 ( .A({data_out_register_1[7], 
        data_out_register_1}), .B({data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  AOI211 U3 ( .A(n9), .B(n10), .C(data_out_register_3[7]), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  NAND40 U21 ( .A(data_out_register_3[5]), .B(data_out_register_3[4]), .C(
        data_out_register_3[3]), .D(data_out_register_3[2]), .Q(n10) );
  CLKIN0 U22 ( .A(data_out_register_3[6]), .Q(n9) );
endmodule


module delay_1b_delay1_141 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_121 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_141 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_58_8_0000000100000001_1 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n2, n4, n5;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n5), .C(n4), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_3 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold59_data_bits8_1 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_121 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n4) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n5) );
endmodule


module layer_8_4_8_3a393e3f3a3d393e ( req_in, ack_in, req_out, ack_out, rst );
  input [3:0] req_in;
  output [3:0] ack_in;
  output [7:0] req_out;
  input [7:0] ack_out;
  input rst;
  wire   req_out_arbiter, req_in_fork, ack_in_fork, n1, n2;
  wire   [3:0] address_rom;
  wire   [7:0] req_out_fork;
  wire   [7:0] ack_out_fork;
  wire   [63:0] data_out_rom;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23;

  arbiter_cascade_input_size4 arbiter_cascade_layer ( .req_in(req_in), 
        .ack_in(ack_in), .req_out(req_out_arbiter), .ack_out(ack_in_fork), 
        .sel(address_rom), .rst(rst) );
  delay_delay10_0 delay_arbiter_to_fork ( .data_in(req_out_arbiter), 
        .data_out(req_in_fork) );
  fork_param_size8 fork_layer ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  rom_layer_8_4_8 memory_layer ( .addr(address_rom), .data({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, data_out_rom[60:56], SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, data_out_rom[53:50], SYNOPSYS_UNCONNECTED__5, 
        data_out_rom[48], SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        data_out_rom[45], SYNOPSYS_UNCONNECTED__8, data_out_rom[43:41], 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, data_out_rom[37:32], 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, data_out_rom[29], 
        SYNOPSYS_UNCONNECTED__14, data_out_rom[27:24], 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        data_out_rom[21:18], SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, data_out_rom[15:9], SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, data_out_rom[5], 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, data_out_rom[2:0]}) );
  neuron_62_8_0000000100000001_0 \genblk1[0].neuron_layer_generate  ( 
        .data_in({n2, n2, data_out_rom[5], n1, n2, data_out_rom[2:0]}), 
        .req_in(req_out_fork[0]), .ack_in(ack_out_fork[0]), .req_out(
        req_out[0]), .ack_out(ack_out[0]), .rst(rst) );
  neuron_57_8_0000000100000001_0 \genblk1[1].neuron_layer_generate  ( 
        .data_in({data_out_rom[15:9], n2}), .req_in(req_out_fork[1]), .ack_in(
        ack_out_fork[1]), .req_out(req_out[1]), .ack_out(ack_out[1]), .rst(rst) );
  neuron_61_8_0000000100000001 \genblk1[2].neuron_layer_generate  ( .data_in({
        n2, n2, data_out_rom[21:18], n2, n1}), .req_in(req_out_fork[2]), 
        .ack_in(ack_out_fork[2]), .req_out(req_out[2]), .ack_out(ack_out[2]), 
        .rst(rst) );
  neuron_58_8_0000000100000001_0 \genblk1[3].neuron_layer_generate  ( 
        .data_in({n2, n2, data_out_rom[29], n2, data_out_rom[27:24]}), 
        .req_in(req_out_fork[3]), .ack_in(ack_out_fork[3]), .req_out(
        req_out[3]), .ack_out(ack_out[3]), .rst(rst) );
  neuron_63_8_0000000100000001 \genblk1[4].neuron_layer_generate  ( .data_in({
        n2, n2, data_out_rom[37:32]}), .req_in(req_out_fork[4]), .ack_in(
        ack_out_fork[4]), .req_out(req_out[4]), .ack_out(ack_out[4]), .rst(rst) );
  neuron_62_8_0000000100000001_1 \genblk1[5].neuron_layer_generate  ( 
        .data_in({n2, n2, data_out_rom[45], n2, data_out_rom[43:41], n2}), 
        .req_in(req_out_fork[5]), .ack_in(ack_out_fork[5]), .req_out(
        req_out[5]), .ack_out(ack_out[5]), .rst(rst) );
  neuron_57_8_0000000100000001_1 \genblk1[6].neuron_layer_generate  ( 
        .data_in({n2, n2, data_out_rom[53:50], n1, data_out_rom[48]}), 
        .req_in(req_out_fork[6]), .ack_in(ack_out_fork[6]), .req_out(
        req_out[6]), .ack_out(ack_out[6]), .rst(rst) );
  neuron_58_8_0000000100000001_1 \genblk1[7].neuron_layer_generate  ( 
        .data_in({n2, n2, n1, data_out_rom[60:56]}), .req_in(req_out_fork[7]), 
        .ack_in(ack_out_fork[7]), .req_out(req_out[7]), .ack_out(ack_out[7]), 
        .rst(rst) );
  LOGIC1 U1 ( .Q(n1) );
  LOGIC0 U2 ( .Q(n2) );
endmodule


module mutex_7 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_84 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_84 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_84 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_74 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_84 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_54 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_74 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_83 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_83 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_83 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_73 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_83 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_53 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_73 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_116 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_112 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_116 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_115 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_111 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_115 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_7 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_7 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_54 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_53 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_112 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_111 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_6 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_82 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_82 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_82 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_72 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_82 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_52 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_72 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_81 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_81 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_81 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_71 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_81 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_51 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_71 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_114 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_110 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_114 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_113 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_109 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_113 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_6 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_6 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_52 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_51 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_110 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_109 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_5 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_80 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_80 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_80 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_70 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_80 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_50 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_70 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_79 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_79 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_79 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_69 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_79 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_49 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_69 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_112 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_108 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_112 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_111 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_107 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_111 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_5 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_5 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_50 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_49 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_108 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_107 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_4 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_78 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_78 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_78 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_68 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_78 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_48 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_68 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_77 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_77 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_77 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_67 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_77 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_47 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_67 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_110 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_106 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_110 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_109 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_105 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_109 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_4 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_4 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_48 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_47 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_106 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_105 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_3 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_76 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_76 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_76 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_66 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_76 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_46 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_66 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_75 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_75 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_75 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_65 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_75 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_45 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_65 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_108 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_104 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_108 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_107 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_103 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_107 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_3 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_3 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_46 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_45 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_104 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_103 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_2 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_74 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_74 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_74 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_64 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_74 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_44 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_64 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_73 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_73 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_73 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_63 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_73 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_43 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_63 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_106 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_102 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_106 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_105 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_101 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_105 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_2 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_2 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_44 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_43 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_102 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_101 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module mutex_1 ( x, y, u, v );
  input x, y;
  output u, v;
  wire   x, n1;
  assign u = x;

  NOR20 U3 ( .A(x), .B(n1), .Q(v) );
  CLKIN0 U4 ( .A(y), .Q(n1) );
endmodule


module delay_1b_delay1_72 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_72 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_72 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_62 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_72 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_42 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_62 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_71 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_71 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_71 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_61 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U2 ( .A(rst), .B(n4), .Q(data_in_imag_A) );
  delay_71 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_in[0]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U5 ( .A(data_in[1]), .Q(n2) );
endmodule


module muller_synt_41 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_61 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module delay_1b_delay1_104 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_100 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_104 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_103 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_99 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_103 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module arbiter_2b_rev3_1 ( req_in, ack_in, req_out, ack_out, sel, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out, sel;
  wire   r1, r2, g1, u3_out, u4_out, n1, n3, n4;

  NOR24 U2 ( .A(n4), .B(ack_in[0]), .Q(u4_out) );
  mutex_1 mutex_arbiter_2b ( .x(r1), .y(r2), .u(g1), .v(sel) );
  muller_synt_42 u5 ( .data_in({u3_out, ack_out}), .data_out(ack_in[0]), .rst(
        rst) );
  muller_synt_41 u6 ( .data_in({u4_out, ack_out}), .data_out(ack_in[1]), .rst(
        rst) );
  delay_100 delay_arbiter1 ( .data_in(req_in[0]), .data_out(r1) );
  delay_99 delay_arbiter2 ( .data_in(req_in[1]), .data_out(r2) );
  CLKIN0 U1 ( .A(n1), .Q(req_out) );
  AOI220 U3 ( .A(req_in[0]), .B(u3_out), .C(u4_out), .D(req_in[1]), .Q(n1) );
  NOR20 U4 ( .A(n3), .B(ack_in[1]), .Q(u3_out) );
  CLKIN0 U5 ( .A(g1), .Q(n3) );
  CLKIN0 U6 ( .A(sel), .Q(n4) );
endmodule


module arbiter_cascade_input_size8 ( req_in, ack_in, req_out, ack_out, sel, 
        rst );
  input [7:0] req_in;
  output [7:0] ack_in;
  output [7:0] sel;
  input ack_out, rst;
  output req_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [6:1] req_inter;
  wire   [6:1] ack_inter;
  wire   [5:0] sel_bits;

  arbiter_2b_rev3_7 \genblk1[0].arbiter_cascade_gen  ( .req_in(req_in[1:0]), 
        .ack_in(ack_in[1:0]), .req_out(req_inter[1]), .ack_out(ack_inter[1]), 
        .sel(sel_bits[0]), .rst(rst) );
  arbiter_2b_rev3_6 \genblk1[1].arbiter_cascade_gen  ( .req_in({req_in[2], 
        req_inter[1]}), .ack_in({ack_in[2], ack_inter[1]}), .req_out(
        req_inter[2]), .ack_out(ack_inter[2]), .sel(sel_bits[1]), .rst(rst) );
  arbiter_2b_rev3_5 \genblk1[2].arbiter_cascade_gen  ( .req_in({req_in[3], 
        req_inter[2]}), .ack_in({ack_in[3], ack_inter[2]}), .req_out(
        req_inter[3]), .ack_out(ack_inter[3]), .sel(sel_bits[2]), .rst(rst) );
  arbiter_2b_rev3_4 \genblk1[3].arbiter_cascade_gen  ( .req_in({req_in[4], 
        req_inter[3]}), .ack_in({ack_in[4], ack_inter[3]}), .req_out(
        req_inter[4]), .ack_out(ack_inter[4]), .sel(sel_bits[3]), .rst(rst) );
  arbiter_2b_rev3_3 \genblk1[4].arbiter_cascade_gen  ( .req_in({req_in[5], 
        req_inter[4]}), .ack_in({ack_in[5], ack_inter[4]}), .req_out(
        req_inter[5]), .ack_out(ack_inter[5]), .sel(sel_bits[4]), .rst(rst) );
  arbiter_2b_rev3_2 \genblk1[5].arbiter_cascade_gen  ( .req_in({req_in[6], 
        req_inter[5]}), .ack_in({ack_in[6], ack_inter[5]}), .req_out(
        req_inter[6]), .ack_out(ack_inter[6]), .sel(sel_bits[5]), .rst(rst) );
  arbiter_2b_rev3_1 \genblk1[6].arbiter_cascade_gen  ( .req_in({req_in[7], 
        req_inter[6]}), .ack_in({ack_in[7], ack_inter[6]}), .req_out(req_out), 
        .ack_out(ack_out), .sel(sel[7]), .rst(rst) );
  NOR20 U1 ( .A(sel[7]), .B(n1), .Q(sel[6]) );
  CLKIN0 U2 ( .A(sel_bits[5]), .Q(n1) );
  NOR20 U3 ( .A(n2), .B(n3), .Q(sel[5]) );
  NOR30 U4 ( .A(n4), .B(sel_bits[4]), .C(n2), .Q(sel[4]) );
  NOR40 U5 ( .A(sel_bits[4]), .B(sel_bits[3]), .C(n2), .D(n5), .Q(sel[3]) );
  CLKIN0 U6 ( .A(n6), .Q(n2) );
  NOR20 U7 ( .A(n7), .B(n8), .Q(sel[2]) );
  CLKIN0 U8 ( .A(sel_bits[1]), .Q(n8) );
  NOR30 U9 ( .A(n9), .B(sel_bits[1]), .C(n7), .Q(sel[1]) );
  CLKIN0 U10 ( .A(sel_bits[0]), .Q(n9) );
  NOR30 U11 ( .A(n7), .B(sel_bits[1]), .C(sel_bits[0]), .Q(sel[0]) );
  NAND40 U12 ( .A(n6), .B(n5), .C(n4), .D(n3), .Q(n7) );
  CLKIN0 U13 ( .A(sel_bits[4]), .Q(n3) );
  CLKIN0 U14 ( .A(sel_bits[3]), .Q(n4) );
  CLKIN0 U15 ( .A(sel_bits[2]), .Q(n5) );
  NOR20 U16 ( .A(sel[7]), .B(sel_bits[5]), .Q(n6) );
endmodule


module delay_1b_delay10_1 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay10_1 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay10_1 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module delay_1b_delay1_91 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_91 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_91 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_81 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_91 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_81 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_0 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_0 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module rom_layer_8_8_2 ( addr, data );
  input [7:0] addr;
  output [15:0] data;
  wire   N6, N7, N8, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21;

  NAND31 U3 ( .A(n15), .B(n16), .C(n17), .Q(N7) );
  NOR21 U4 ( .A(n8), .B(n12), .Q(data[4]) );
  INV3 U5 ( .A(n4), .Q(n12) );
  INV3 U6 ( .A(n2), .Q(data[13]) );
  INV0 U7 ( .A(N7), .Q(n8) );
  NOR20 U8 ( .A(N7), .B(n7), .Q(data[1]) );
  NOR20 U9 ( .A(N7), .B(n11), .Q(data[6]) );
  NOR20 U10 ( .A(N7), .B(n1), .Q(data[7]) );
  INV3 U11 ( .A(N8), .Q(n7) );
  NAND21 U12 ( .A(n11), .B(N8), .Q(n4) );
  NOR20 U13 ( .A(N8), .B(n10), .Q(data[5]) );
  IMUX20 U14 ( .A(n2), .B(n7), .S(N7), .Q(data[8]) );
  IMUX20 U15 ( .A(n11), .B(n4), .S(N7), .Q(data[9]) );
  NAND22 U16 ( .A(n7), .B(n11), .Q(n2) );
  NOR21 U17 ( .A(n9), .B(n8), .Q(data[10]) );
  XOR20 U18 ( .A(N7), .B(n9), .Q(data[12]) );
  NOR21 U19 ( .A(n7), .B(n10), .Q(data[3]) );
  IMUX20 U20 ( .A(N7), .B(N8), .S(N6), .Q(data[11]) );
  IMUX20 U21 ( .A(N7), .B(n7), .S(N6), .Q(data[14]) );
  NOR20 U22 ( .A(N6), .B(N7), .Q(data[15]) );
  INV0 U23 ( .A(N6), .Q(n11) );
  NAND20 U24 ( .A(N6), .B(N8), .Q(n1) );
  IMUX20 U25 ( .A(N6), .B(n1), .S(N7), .Q(data[0]) );
  IMUX20 U26 ( .A(data[13]), .B(n3), .S(N7), .Q(data[2]) );
  XOR20 U27 ( .A(N6), .B(N8), .Q(n3) );
  INV3 U28 ( .A(n6), .Q(n10) );
  NAND20 U29 ( .A(N6), .B(N7), .Q(n6) );
  INV3 U30 ( .A(n5), .Q(n9) );
  NAND20 U31 ( .A(N6), .B(n7), .Q(n5) );
  NAND40 U32 ( .A(n13), .B(n14), .C(n15), .D(n16), .Q(N8) );
  OAI2110 U33 ( .A(addr[2]), .B(addr[3]), .C(n13), .D(n14), .Q(n17) );
  CLKIN0 U34 ( .A(addr[4]), .Q(n13) );
  CLKIN0 U35 ( .A(addr[6]), .Q(n15) );
  OAI210 U36 ( .A(addr[6]), .B(n18), .C(n16), .Q(N6) );
  CLKIN0 U37 ( .A(addr[7]), .Q(n16) );
  CLKIN0 U38 ( .A(n19), .Q(n18) );
  OAI210 U39 ( .A(n20), .B(addr[4]), .C(n14), .Q(n19) );
  CLKIN0 U40 ( .A(addr[5]), .Q(n14) );
  AOI210 U41 ( .A(n21), .B(addr[1]), .C(addr[3]), .Q(n20) );
  CLKIN0 U42 ( .A(addr[2]), .Q(n21) );
endmodule


module delay_1b_delay1_14 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_14 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_14 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_12 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_14 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_8 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_12 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_8 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_8 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_13 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_13 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_13 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_11 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_13 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_7 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_11 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_7 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_7 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_12 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_12 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_12 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_10 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_12 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_6 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_10 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_6 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_6 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_11 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_11 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_11 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_9 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_11 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_5 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_9 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_5 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_5 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_10 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_10 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_10 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_2 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_10 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_2 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_2 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_2 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_2 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_9 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_9 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_9 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_8 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_9 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_4 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_8 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_2 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_4 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_8 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_8 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_8 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_7 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_8 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_3 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_7 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_2 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_3 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_102 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_4 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_102 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_101 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_3 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_101 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_2 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_8 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_7 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_6 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), .req_out(
        req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(ctrl_vec[3]), 
        .rst(rst) );
  ctrl_5 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_2 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_2 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_2 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_4 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_3 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_8 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_7 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_6 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_5 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_2 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_2 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold128_data_bits8_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold128_data_bits8_0 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_8 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_7 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_6 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_5 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_2 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_2 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold128_data_bits8_0_DW01_add_0 r66 ( .A({
        data_out_register_1[7], data_out_register_1}), .B({
        data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({
        N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NAND22 U3 ( .A(n9), .B(n10), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  NOR40 U21 ( .A(data_out_register_3[6]), .B(data_out_register_3[5]), .C(
        data_out_register_3[4]), .D(data_out_register_3[3]), .Q(n10) );
  NOR40 U22 ( .A(data_out_register_3[2]), .B(data_out_register_3[1]), .C(
        data_out_register_3[0]), .D(n11), .Q(n9) );
  CLKIN0 U23 ( .A(data_out_register_3[7]), .Q(n11) );
endmodule


module delay_1b_delay1_140 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_120 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_140 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_127_8_0000000100000001_0 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n1, n2, n3;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n1), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_2 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold128_data_bits8_0 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_120 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n1) );
endmodule


module delay_1b_delay1_7 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_7 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_7 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_6 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_7 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_4 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_6 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_4 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_4 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_6 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_6 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_6 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_5 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_6 delay_muller ( .data_in(n4), .data_out(data_out) );
  INV3 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_3 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_5 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_3 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_3 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_5 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_5 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_5 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_4 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_5 delay_muller ( .data_in(n5), .data_out(data_out) );
  INV3 U2 ( .A(data_out_imag_Q), .Q(n5) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n4) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_2 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_4 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_2 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_2 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_4 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_4 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_4 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_3 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_4 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_3 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_1 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_1 muller_ctrl ( .data_in({req_in, n2}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_3 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_3 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_3 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_1_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_out_imag_Q, n6, n7, n8, n9, n10;

  IMAJ31 IMAJ30_muller ( .A(n8), .B(n9), .C(data_out), .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(data_in[1]), .B(rst), .Q(n7) );
  NOR24 U2 ( .A(data_in[0]), .B(rst), .Q(n6) );
  delay_3 delay_muller ( .data_in(n10), .data_out(data_out) );
  INV3 U3 ( .A(data_out_imag_Q), .Q(n10) );
  CLKIN0 U4 ( .A(n6), .Q(n8) );
  CLKIN0 U5 ( .A(n7), .Q(n9) );
endmodule


module muller_synt_rst_set1_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1_1 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on_1 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n2;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1_1 muller_ctrl_rst_on ( .data_in({req_in, n2}), 
        .data_out(req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n2) );
endmodule


module delay_1b_delay1_2 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_2 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_2 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_2 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n3, n4, n5;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  NOR24 U1 ( .A(rst), .B(n4), .Q(data_in_imag_B) );
  delay_2 delay_muller ( .data_in(n5), .data_out(data_out) );
  CLKIN0 U2 ( .A(data_in[1]), .Q(n4) );
  CLKIN0 U3 ( .A(data_out_imag_Q), .Q(n5) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_2 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_2 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2_1 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_2 muller_join ( .data_in(req_in), .data_out(req_out), 
        .rst(rst) );
endmodule


module delay_1b_delay1_1 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_1 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_1 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module muller_synt_2b_0_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   data_in_imag_A, data_in_imag_B, data_out_imag_Q, n2, n3, n4;

  IMAJ31 IMAJ30_muller ( .A(data_in_imag_A), .B(data_in_imag_B), .C(data_out), 
        .Q(data_out_imag_Q) );
  delay_1 delay_muller ( .data_in(n4), .data_out(data_out) );
  CLKIN0 U1 ( .A(data_out_imag_Q), .Q(n4) );
  NOR20 U2 ( .A(rst), .B(n2), .Q(data_in_imag_B) );
  CLKIN0 U3 ( .A(data_in[1]), .Q(n2) );
  NOR20 U4 ( .A(rst), .B(n3), .Q(data_in_imag_A) );
  CLKIN0 U5 ( .A(data_in[0]), .Q(n3) );
endmodule


module muller_synt_size2_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_1 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2_1 ( req_in, ack_in, req_out, ack_out, rst );
  output [1:0] req_out;
  input [1:0] ack_out;
  input req_in, rst;
  output ack_in;
  wire   req_in;
  assign req_out[0] = req_in;
  assign req_out[1] = req_in;

  muller_synt_size2_1 muller_fork ( .data_in(ack_out), .data_out(ack_in), 
        .rst(rst) );
endmodule


module delay_1b_delay1_100 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_2 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_100 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module delay_1b_delay1_99 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_delay1_1 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_99 \genblk1[0].delay_gen  ( .data_in(data_in[0]), .data_out(
        data_out[0]) );
endmodule


module neuron_ctrl_0000000100000001_1 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_in_ctrl_3, req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4,
         ack_in_ctrl_1, req_out_join, req_in_fork, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_4 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_3 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_in_ctrl_3), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_2 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), .req_out(
        req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(ctrl_vec[3]), 
        .rst(rst) );
  ctrl_1 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on_1 ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2_1 join_main ( .req_out(req_out_join), .ack_out(
        ack_in_ctrl_3), .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst)
         );
  fork_param_size2_1 fork_main ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  delay_delay1_2 delay_neuron1 ( .data_in(req_out_join), .data_out(
        req_in_ctrl_3) );
  delay_delay1_1 delay_neuron2 ( .data_in(req_out_ctrl_3), .data_out(
        req_in_fork) );
endmodule


module register_size8_4 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_3 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_2 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size8_1 ( data_in, data_out, ctrl, rst );
  input [7:0] data_in;
  output [7:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[7]  ( .D(data_in[7]), .C(ctrl), .RN(n1), .Q(data_out[7])
         );
  DFC3 \data_out_reg[6]  ( .D(data_in[6]), .C(ctrl), .RN(n1), .Q(data_out[6])
         );
  DFC3 \data_out_reg[5]  ( .D(data_in[5]), .C(ctrl), .RN(n1), .Q(data_out[5])
         );
  DFC3 \data_out_reg[4]  ( .D(data_in[4]), .C(ctrl), .RN(n1), .Q(data_out[4])
         );
  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  INV3 U3 ( .A(rst), .Q(n1) );
endmodule


module register_1 ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits8_sel_bits1_1 ( .data_in({\data_in[1][7] , \data_in[1][6] , 
        \data_in[1][5] , \data_in[1][4] , \data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][7] , \data_in[0][6] , 
        \data_in[0][5] , \data_in[0][4] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [7:0] data_out;
  input [0:0] sel;
  input \data_in[1][7] , \data_in[1][6] , \data_in[1][5] , \data_in[1][4] ,
         \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][7] , \data_in[0][6] , \data_in[0][5] , \data_in[0][4] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][7] ), .B(\data_in[1][7] ), .S(sel[0]), .Q(
        data_out[7]) );
  MUX21 U3 ( .A(\data_in[0][6] ), .B(\data_in[1][6] ), .S(sel[0]), .Q(
        data_out[6]) );
  MUX21 U4 ( .A(\data_in[0][5] ), .B(\data_in[1][5] ), .S(sel[0]), .Q(
        data_out[5]) );
  MUX21 U5 ( .A(\data_in[0][4] ), .B(\data_in[1][4] ), .S(sel[0]), .Q(
        data_out[4]) );
  MUX21 U6 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U7 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U8 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U9 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold128_data_bits8_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  ADD32 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .S(SUM[8]) );
  ADD32 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADD32 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADD32 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADD32 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADD32 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADD32 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADD32 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  XOR21 U1 ( .A(A[0]), .B(B[0]), .Q(SUM[0]) );
  NOR21 U2 ( .A(n1), .B(n2), .Q(carry[1]) );
  INV3 U3 ( .A(A[0]), .Q(n2) );
  INV3 U4 ( .A(B[0]), .Q(n1) );
endmodule


module neuron_data_thold128_data_bits8_1 ( data_in, data_out, ctrl_vec, rst );
  input [7:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   \*Logic0* , N1, N2, N3, N4, N5, N6, N7, N8, N10, N20, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [7:0] data_out_register_1;
  wire   [7:0] data_out_register_2;
  wire   [7:0] data_in_register_3;
  wire   [7:0] data_out_register_3;
  wire   [7:0] data_out_register_4;
  wire   [7:0] data_out_mux_1;

  register_size8_4 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size8_3 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size8_2 register_3 ( .data_in(data_in_register_3), .data_out(
        data_out_register_3), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size8_1 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register_1 register_5 ( .data_in(N20), .data_out(data_out), .ctrl(
        ctrl_vec[4]), .rst(rst) );
  mux_data_bits8_sel_bits1_1 mux_1 ( .data_in({\*Logic0* , \*Logic0* , 
        \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , \*Logic0* , 
        data_out_register_3}), .data_out(data_out_mux_1), .sel(N20) );
  neuron_data_thold128_data_bits8_1_DW01_add_0 r66 ( .A({
        data_out_register_1[7], data_out_register_1}), .B({
        data_out_register_2[7], data_out_register_2}), .CI(\*Logic0* ), .SUM({
        N10, N8, N7, N6, N5, N4, N3, N2, N1}) );
  NAND22 U3 ( .A(n9), .B(n10), .Q(N20) );
  LOGIC0 U4 ( .Q(\*Logic0* ) );
  NOR20 U5 ( .A(N10), .B(n1), .Q(data_in_register_3[7]) );
  CLKIN0 U6 ( .A(N8), .Q(n1) );
  NOR20 U7 ( .A(N10), .B(n2), .Q(data_in_register_3[6]) );
  CLKIN0 U8 ( .A(N7), .Q(n2) );
  NOR20 U9 ( .A(N10), .B(n3), .Q(data_in_register_3[5]) );
  CLKIN0 U10 ( .A(N6), .Q(n3) );
  NOR20 U11 ( .A(N10), .B(n4), .Q(data_in_register_3[4]) );
  CLKIN0 U12 ( .A(N5), .Q(n4) );
  NOR20 U13 ( .A(N10), .B(n5), .Q(data_in_register_3[3]) );
  CLKIN0 U14 ( .A(N4), .Q(n5) );
  NOR20 U15 ( .A(N10), .B(n6), .Q(data_in_register_3[2]) );
  CLKIN0 U16 ( .A(N3), .Q(n6) );
  NOR20 U17 ( .A(N10), .B(n7), .Q(data_in_register_3[1]) );
  CLKIN0 U18 ( .A(N2), .Q(n7) );
  NOR20 U19 ( .A(N10), .B(n8), .Q(data_in_register_3[0]) );
  CLKIN0 U20 ( .A(N1), .Q(n8) );
  NOR40 U21 ( .A(data_out_register_3[6]), .B(data_out_register_3[5]), .C(
        data_out_register_3[4]), .D(data_out_register_3[3]), .Q(n10) );
  NOR40 U22 ( .A(data_out_register_3[2]), .B(data_out_register_3[1]), .C(
        data_out_register_3[0]), .D(n11), .Q(n9) );
  CLKIN0 U23 ( .A(data_out_register_3[7]), .Q(n11) );
endmodule


module delay_1b_delay1_139 ( data_in, data_out );
  input data_in;
  output data_out;
  wire   data_in;
  assign data_out = data_in;

endmodule


module delay_119 ( data_in, data_out );
  input [0:0] data_in;
  output [0:0] data_out;


  delay_1b_delay1_139 \genblk1[0].delay_gen  ( .data_in(data_in[0]), 
        .data_out(data_out[0]) );
endmodule


module neuron_127_8_0000000100000001_1 ( data_in, req_in, ack_in, req_out, 
        ack_out, rst );
  input [7:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, _0_net_, n2, n3, n4;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n4), .C(n3), .Q(_0_net_) );
  neuron_ctrl_0000000100000001_1 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold128_data_bits8_1 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  delay_119 delay_neuron ( .data_in(_0_net_), .data_out(ack_out_inter) );
  CLKIN0 U1 ( .A(n2), .Q(req_out) );
  NAND20 U3 ( .A(data_out_inter), .B(req_out_inter), .Q(n2) );
  CLKIN0 U4 ( .A(ack_out), .Q(n3) );
  CLKIN0 U5 ( .A(req_out_inter), .Q(n4) );
endmodule


module layer_8_8_2_7f7f ( req_in, ack_in, req_out, ack_out, rst );
  input [7:0] req_in;
  output [7:0] ack_in;
  output [1:0] req_out;
  input [1:0] ack_out;
  input rst;
  wire   req_out_arbiter, req_in_fork, ack_in_fork;
  wire   [7:0] address_rom;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;
  wire   [15:0] data_out_rom;

  arbiter_cascade_input_size8 arbiter_cascade_layer ( .req_in(req_in), 
        .ack_in(ack_in), .req_out(req_out_arbiter), .ack_out(ack_in_fork), 
        .sel(address_rom), .rst(rst) );
  delay_delay10_1 delay_arbiter_to_fork ( .data_in(req_out_arbiter), 
        .data_out(req_in_fork) );
  fork_param_size2_0 fork_layer ( .req_in(req_in_fork), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
  rom_layer_8_8_2 memory_layer ( .addr(address_rom), .data(data_out_rom) );
  neuron_127_8_0000000100000001_0 \genblk1[0].neuron_layer_generate  ( 
        .data_in(data_out_rom[7:0]), .req_in(req_out_fork[0]), .ack_in(
        ack_out_fork[0]), .req_out(req_out[0]), .ack_out(ack_out[0]), .rst(rst) );
  neuron_127_8_0000000100000001_1 \genblk1[1].neuron_layer_generate  ( 
        .data_in(data_out_rom[15:8]), .req_in(req_out_fork[1]), .ack_in(
        ack_out_fork[1]), .req_out(req_out[1]), .ack_out(ack_out[1]), .rst(rst) );
endmodule


module network_8_4_8_2_3a393e3f3a3d393e_0000000000007f7f_0000000100000001 ( 
        req_in, ack_in, req_out, ack_out, rst );
  input [3:0] req_in;
  output [3:0] ack_in;
  output [1:0] req_out;
  input [1:0] ack_out;
  input rst;

  wire   [7:0] req_hidden;
  wire   [7:0] ack_hidden;

  layer_8_4_8_3a393e3f3a3d393e layer_input ( .req_in(req_in), .ack_in(ack_in), 
        .req_out(req_hidden), .ack_out(ack_hidden), .rst(rst) );
  layer_8_8_2_7f7f layer_output ( .req_in(req_hidden), .ack_in(ack_hidden), 
        .req_out(req_out), .ack_out(ack_out), .rst(rst) );
endmodule


module network_synth ( req_in, ack_in, req_out, ack_out, rst );
  input [3:0] req_in;
  output [3:0] ack_in;
  output [1:0] req_out;
  input [1:0] ack_out;
  input rst;


  network_8_4_8_2_3a393e3f3a3d393e_0000000000007f7f_0000000100000001 full_network ( 
        .req_in(req_in), .ack_in(ack_in), .req_out(req_out), .ack_out(ack_out), 
        .rst(rst) );
endmodule

