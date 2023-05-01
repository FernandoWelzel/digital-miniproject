
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


module muller_synt_2b_0_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   n1, n2;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n1) );
  delay_0 delay_muller ( .data_in(n2), .data_out(data_out) );
  NOR20 U1 ( .A(rst), .B(n1), .Q(n2) );
endmodule


module muller_synt_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_0 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_0 ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_0 muller_ctrl ( .data_in({req_in, n1}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
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
  wire   n3, n4;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n4) );
  delay_6 delay_muller ( .data_in(n3), .data_out(data_out) );
  NOR21 U1 ( .A(rst), .B(n4), .Q(n3) );
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
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_3 muller_ctrl ( .data_in({req_in, n1}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
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
  wire   n3, n4;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n4) );
  delay_4 delay_muller ( .data_in(n3), .data_out(data_out) );
  NOR20 U1 ( .A(rst), .B(n4), .Q(n3) );
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
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_1 muller_ctrl ( .data_in({req_in, n1}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
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


module muller_synt_2b_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;
  wire   n3, n4, n1, n2;

  AOI2112 U1 ( .A(data_in[0]), .B(data_in[1]), .C(n2), .D(rst), .Q(n3) );
  OAI212 U2 ( .A(data_in[0]), .B(data_in[1]), .C(data_out), .Q(n4) );
  delay_3 delay_muller ( .data_in(n1), .data_out(data_out) );
  CLKIN0 U3 ( .A(n4), .Q(n2) );
  CLKIN0 U4 ( .A(n3), .Q(n1) );
endmodule


module muller_synt_rst_set1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_1 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module ctrl_rst_on ( ack_out, req_in, req_out, ack_in, ctrl_out, rst );
  input ack_out, req_in, rst;
  output req_out, ack_in, ctrl_out;
  wire   req_out, n1;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_rst_set1 muller_ctrl_rst_on ( .data_in({req_in, n1}), .data_out(
        req_out), .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n1) );
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
  wire   n3, n4;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n4) );
  delay_2 delay_muller ( .data_in(n3), .data_out(data_out) );
  NOR20 U1 ( .A(rst), .B(n4), .Q(n3) );
endmodule


module muller_synt_size2_0 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_2 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module join_param_size2 ( req_out, ack_out, req_in, ack_in, rst );
  input [1:0] req_in;
  output [1:0] ack_in;
  input ack_out, rst;
  output req_out;
  wire   ack_out;
  assign ack_in[0] = ack_out;
  assign ack_in[1] = ack_out;

  muller_synt_size2_0 muller_join ( .data_in(req_in), .data_out(req_out), 
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
  wire   n3, n4;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n4) );
  delay_1 delay_muller ( .data_in(n3), .data_out(data_out) );
  NOR20 U1 ( .A(rst), .B(n4), .Q(n3) );
endmodule


module muller_synt_size2_1 ( data_in, data_out, rst );
  input [1:0] data_in;
  input rst;
  output data_out;


  muller_synt_2b_0_1 \genblk1[1].genblk1.muller_gen  ( .data_in(data_in), 
        .data_out(data_out), .rst(rst) );
endmodule


module fork_param_size2 ( req_in, ack_in, req_out, ack_out, rst );
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
  wire   n3, n4;

  IMAJ31 U2 ( .A(data_out), .B(data_in[0]), .C(data_in[1]), .Q(n4) );
  delay_5 delay_muller ( .data_in(n3), .data_out(data_out) );
  NOR21 U1 ( .A(rst), .B(n4), .Q(n3) );
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
  wire   req_out, n3;
  assign ctrl_out = req_out;
  assign ack_in = req_out;

  muller_synt_2 muller_ctrl ( .data_in({req_in, n3}), .data_out(req_out), 
        .rst(rst) );
  CLKIN0 U1 ( .A(ack_out), .Q(n3) );
endmodule


module neuron_ctrl_0000000100000001 ( req_in, ack_in, req_out, ack_out, 
        ctrl_vec, rst );
  output [4:0] ctrl_vec;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_ctrl_3, ack_in_ctrl_3, req_out_ctrl_4, ack_in_ctrl_1,
         req_out_join, ack_in_fork;
  wire   [1:0] req_in_join;
  wire   [1:0] ack_in_join;
  wire   [1:0] req_out_fork;
  wire   [1:0] ack_out_fork;

  ctrl_0 ctrl_2 ( .ack_out(ack_in_join[1]), .req_in(req_in), .req_out(
        req_in_join[1]), .ack_in(ack_in), .ctrl_out(ctrl_vec[1]), .rst(rst) );
  ctrl_3 ctrl_3 ( .ack_out(ack_in_fork), .req_in(req_out_join), .req_out(
        req_out_ctrl_3), .ack_in(ack_in_ctrl_3), .ctrl_out(ctrl_vec[2]), .rst(
        rst) );
  ctrl_2 ctrl_4 ( .ack_out(ack_in_ctrl_1), .req_in(req_out_fork[0]), .req_out(
        req_out_ctrl_4), .ack_in(ack_out_fork[0]), .ctrl_out(ctrl_vec[3]), 
        .rst(rst) );
  ctrl_1 ctrl_5 ( .ack_out(ack_out), .req_in(req_out_fork[1]), .req_out(
        req_out), .ack_in(ack_out_fork[1]), .ctrl_out(ctrl_vec[4]), .rst(rst)
         );
  ctrl_rst_on ctrl_1 ( .ack_out(ack_in_join[0]), .req_in(req_out_ctrl_4), 
        .req_out(req_in_join[0]), .ack_in(ack_in_ctrl_1), .ctrl_out(
        ctrl_vec[0]), .rst(rst) );
  join_param_size2 join_main ( .req_out(req_out_join), .ack_out(ack_in_ctrl_3), 
        .req_in(req_in_join), .ack_in(ack_in_join), .rst(rst) );
  fork_param_size2 fork_main ( .req_in(req_out_ctrl_3), .ack_in(ack_in_fork), 
        .req_out(req_out_fork), .ack_out(ack_out_fork), .rst(rst) );
endmodule


module register_size4_0 ( data_in, data_out, ctrl, rst );
  input [3:0] data_in;
  output [3:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size4_2 ( data_in, data_out, ctrl, rst );
  input [3:0] data_in;
  output [3:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size5 ( data_in, data_out, ctrl, rst );
  input [4:0] data_in;
  output [4:0] data_out;
  input ctrl, rst;
  wire   n1;

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
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module register_size4_1 ( data_in, data_out, ctrl, rst );
  input [3:0] data_in;
  output [3:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[3]  ( .D(data_in[3]), .C(ctrl), .RN(n1), .Q(data_out[3])
         );
  DFC3 \data_out_reg[2]  ( .D(data_in[2]), .C(ctrl), .RN(n1), .Q(data_out[2])
         );
  DFC3 \data_out_reg[1]  ( .D(data_in[1]), .C(ctrl), .RN(n1), .Q(data_out[1])
         );
  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module register ( data_in, data_out, ctrl, rst );
  input [0:0] data_in;
  output [0:0] data_out;
  input ctrl, rst;
  wire   n1;

  DFC3 \data_out_reg[0]  ( .D(data_in[0]), .C(ctrl), .RN(n1), .Q(data_out[0])
         );
  CLKIN0 U3 ( .A(rst), .Q(n1) );
endmodule


module mux_data_bits4_sel_bits1 ( .data_in({\data_in[1][3] , \data_in[1][2] , 
        \data_in[1][1] , \data_in[1][0] , \data_in[0][3] , \data_in[0][2] , 
        \data_in[0][1] , \data_in[0][0] }), data_out, sel );
  output [3:0] data_out;
  input [0:0] sel;
  input \data_in[1][3] , \data_in[1][2] , \data_in[1][1] , \data_in[1][0] ,
         \data_in[0][3] , \data_in[0][2] , \data_in[0][1] , \data_in[0][0] ;


  MUX21 U2 ( .A(\data_in[0][3] ), .B(\data_in[1][3] ), .S(sel[0]), .Q(
        data_out[3]) );
  MUX21 U3 ( .A(\data_in[0][2] ), .B(\data_in[1][2] ), .S(sel[0]), .Q(
        data_out[2]) );
  MUX21 U4 ( .A(\data_in[0][1] ), .B(\data_in[1][1] ), .S(sel[0]), .Q(
        data_out[1]) );
  MUX21 U5 ( .A(\data_in[0][0] ), .B(\data_in[1][0] ), .S(sel[0]), .Q(
        data_out[0]) );
endmodule


module neuron_data_thold8_data_bits4 ( data_in, data_out, ctrl_vec, rst );
  input [3:0] data_in;
  input [4:0] ctrl_vec;
  input rst;
  output data_out;
  wire   n5, n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [3:0] data_out_register_1;
  wire   [3:0] data_out_register_2;
  wire   [4:0] data_in_register_3;
  wire   [4:0] data_out_register_3;
  wire   [3:0] data_out_register_4;
  wire   [3:0] data_out_mux_1;
  wire   SYNOPSYS_UNCONNECTED__0;

  register_size4_0 register_1 ( .data_in(data_out_register_4), .data_out(
        data_out_register_1), .ctrl(ctrl_vec[0]), .rst(rst) );
  register_size4_2 register_2 ( .data_in(data_in), .data_out(
        data_out_register_2), .ctrl(ctrl_vec[1]), .rst(rst) );
  register_size5 register_3 ( .data_in(data_in_register_3), .data_out({
        SYNOPSYS_UNCONNECTED__0, data_out_register_3[3:0]}), .ctrl(ctrl_vec[2]), .rst(rst) );
  register_size4_1 register_4 ( .data_in(data_out_mux_1), .data_out(
        data_out_register_4), .ctrl(ctrl_vec[3]), .rst(rst) );
  register register_5 ( .data_in(data_out), .ctrl(ctrl_vec[4]), .rst(rst) );
  mux_data_bits4_sel_bits1 mux_1 ( .data_in({n5, n5, n5, n5, 
        data_out_register_3[3:0]}), .data_out(data_out_mux_1), .sel(data_out)
         );
  LOGIC0 U3 ( .Q(n5) );
  CLKIN0 U4 ( .A(n12), .Q(data_out) );
  OAI310 U5 ( .A(data_out_register_3[0]), .B(data_out_register_3[2]), .C(
        data_out_register_3[1]), .D(data_out_register_3[3]), .Q(n12) );
  OAI220 U6 ( .A(n13), .B(n14), .C(n15), .D(n16), .Q(data_in_register_3[4]) );
  CLKIN0 U7 ( .A(n17), .Q(n15) );
  NAND20 U8 ( .A(n14), .B(n13), .Q(n17) );
  XNR30 U9 ( .A(n16), .B(n14), .C(n13), .Q(data_in_register_3[3]) );
  IMAJ30 U10 ( .A(data_out_register_2[2]), .B(data_out_register_1[2]), .C(n18), 
        .Q(n13) );
  CLKIN0 U11 ( .A(data_out_register_1[3]), .Q(n14) );
  CLKIN0 U12 ( .A(data_out_register_2[3]), .Q(n16) );
  XOR30 U13 ( .A(data_out_register_2[2]), .B(data_out_register_1[2]), .C(n18), 
        .Q(data_in_register_3[2]) );
  MAJ31 U14 ( .A(data_out_register_2[1]), .B(data_out_register_1[1]), .C(n19), 
        .Q(n18) );
  CLKIN0 U15 ( .A(n20), .Q(n19) );
  XNR30 U16 ( .A(data_out_register_1[1]), .B(data_out_register_2[1]), .C(n20), 
        .Q(data_in_register_3[1]) );
  NAND20 U17 ( .A(data_out_register_2[0]), .B(data_out_register_1[0]), .Q(n20)
         );
  XOR20 U18 ( .A(data_out_register_1[0]), .B(data_out_register_2[0]), .Q(
        data_in_register_3[0]) );
endmodule


module neuron ( data_in, req_in, ack_in, req_out, ack_out, rst );
  input [3:0] data_in;
  input req_in, ack_out, rst;
  output ack_in, req_out;
  wire   req_out_inter, ack_out_inter, data_out_inter, n7, n8, n10;
  wire   [4:0] ctrl_vec;

  OAI212 U2 ( .A(data_out_inter), .B(n7), .C(n8), .Q(ack_out_inter) );
  neuron_ctrl_0000000100000001 neuron_main_ctrl ( .req_in(req_in), .ack_in(
        ack_in), .req_out(req_out_inter), .ack_out(ack_out_inter), .ctrl_vec(
        ctrl_vec), .rst(rst) );
  neuron_data_thold8_data_bits4 neuron_main_data ( .data_in(data_in), 
        .data_out(data_out_inter), .ctrl_vec(ctrl_vec), .rst(rst) );
  CLKIN0 U10 ( .A(n10), .Q(req_out) );
  NAND20 U11 ( .A(data_out_inter), .B(req_out_inter), .Q(n10) );
  CLKIN0 U12 ( .A(ack_out), .Q(n8) );
  CLKIN0 U13 ( .A(req_out_inter), .Q(n7) );
endmodule

