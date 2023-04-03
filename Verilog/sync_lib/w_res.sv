//==============================================================================
//  Filename    : wires.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Decodification of request signals for the arbiter  
//==============================================================================

module wires #(
    parameter n = 32
)(
input logic [2*n-2:0] wires_entry,          // Inputs of OR gates 
output logic [n-1:0] wires                  // Outputs with the decodification
);

genvar i;                                   // Variable used for the loop
logic [n-1:0] pair_wires;                   // Sort of a bus

for (i=n-1;     i > 0;        i--) begin
    if (i == n-1) begin                     // Last wire
        assign wires[i] = wires_entry[(2*i) - 1];       // Definition of initial condition   
        assign pair_wires[i] = wires_entry[(2*i) - 2];  // Definition of initial condition
    end
    else begin
       assign  wires[i] = wires_entry[(2*i)-1]*pair_wires[i+1];
       assign  pair_wires[i] = wires_entry[(2*i)-2]*pair_wires[i+1];
    end
end
assign wires[0] = wires_entry[0]*pair_wires[1]; // Final definition of wires

endmodule