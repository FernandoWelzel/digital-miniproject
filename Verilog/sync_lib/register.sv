//==============================================================================
//  Filename    : register.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametric register - Data change on posedge clock
//==============================================================================
module register #(
    parameter integer        size = 2  // Size - Number of inputs and outputs
    )(
    input  logic [size-1:0]  data_in, // Input vector 
    output logic [size-1:0] data_out, // Output vector

    input  logic                 clk, // Control signal - Clock

    input  logic                 rst  // Circuit asyncronous reset -> data_out = {0} 
);

// Behaviour definition ========================================================
always_ff @(posedge rst) begin
    data_out <= {size{1'b0}};
end

always_ff @(posedge clk) begin
    data_out <= data_in;
end

endmodule
