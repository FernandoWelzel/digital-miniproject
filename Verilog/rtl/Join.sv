
module Join_block(

input logic ack_in1;
input logic ack_in2;
input logic req_in1;
input logic req_in2;
input logic rst;

output logic ack_out;
output logic req_out_j
);
Muller Muller_Gate_0(.req_in(ack_in1),.ack_out(~req_in2),.req_out(req_out_j));

assign ack_out = ack_in1 | ack_in2;





endmodule





