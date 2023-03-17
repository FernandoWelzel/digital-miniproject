module ctrl_rst (
    input logic req_in;
    input logic ack_out;
    input logic rst;

    output logic req_out;
    output logic ack_in;
    output logic ctrl_out


);

Muller MG_rst_on(a.(req_in),b.(ack_out),rst.(rst),data_out.(req_out));
assign ack_in = req_out;
assign crtl_out = req_out;


endmodule