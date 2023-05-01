//==============================================================================
//  Filename    : delay_1b.sv                                         
//  Designer    : Fernando WELZEL
//  Description : 1 bit delay module with parametrizable delay
//==============================================================================
module delay_1b # (
  parameter integer   delay =  1, // Delay set by block
  parameter INVERTER_PER_NS = 10  // Inverter number per delay ns
)(
  input  logic  data_in,  // Input value
  output logic data_out   // Output value
);

// == Variable declaration ====================================================
logic [INVERTER_PER_NS*delay-1:0] internal_wires;

// == Connecting with delays ==================================================
generate
    genvar i;
    for(i = 0; i < INVERTER_PER_NS*delay; i++) begin
        if(i == 0) begin
            assign internal_wires[i] = ~data_in; 
        end
	else begin
	    assign internal_wires[i] = ~internal_wires[i-1]; 	
	end
    end
endgenerate

assign data_out = internal_wires[INVERTER_PER_NS*delay-1];

endmodule
