//==============================================================================
//  Filename    : Controller                                         
//  Designer    : Luca Sauer de Araujo 
//  Description : Controller element used for asynchronous neuron.
//==============================================================================
module MG_rst_on (
    input logic a,
    input logic b,
    input logic rst,
    output logic z
);

// Definition of variables
wire w1, w2, w3, w4, w5;
logic z = 0;

always_ff @ (posedge rst, a, b) begin 
    if (rst == 1)
    begin
        w1 = 1;
        w2 = 0;
        w3 = 0;
        w4 = 0;
    end
    else
    begin
        w3 = w1 & ~w2;
        w4 = w1 | ^w2;
        w5 = w4 & z;
        z = w3 | w5;
    end
end


endmodule
