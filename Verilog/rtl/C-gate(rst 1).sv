module Muller_Gate_1(
input logic req_in;
input logic ack_out;
input logic rst;

output logic req_out
);
logic req_out_m;

assign req_out = req_in*(~ack_out) + (req_in + ~ack_out)*req_out_m


always_ff@(req_out,rst)
begin
    if (rst) 
    begin
        req_out <= b'1;
        req_out_m <= b'0;
    else req_out_m <= req_out;

end
end

endmodule