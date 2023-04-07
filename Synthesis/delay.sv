module delay(
    input logic A;
    output logic B;
)
parameter int n;
initial $timeformat ( -9, 1, " ns", 12 );
always@(A)
begin
    #n
    B<= A;
end


endmodule