//==============================================================================
//  Filename    : locker_param.sv                                              
//  Designer    : Luca SAUER DE ARAUJO
//  Description : Control of locker state for arbiter  
//==============================================================================

module locker_param #(
  parameter               size = 2   // Size - Number of inputs
  )(
    input logic [size-1:0] req_in,
    input logic [size-1:0] ack_out,
    input logic rst,

    output logic [size-1:0] req_out,
    output logic [size-1:0] ack_in
  );

// === Variable Declarations ===================================================
genvar i; // iteration variable
logic lock; 

generate
    for (i = 0 ; i < size ; i++ ) begin
        ctrl_locker locker_p (.ack_out(ack_out[i]), .req_in(req_in[i]), .lock(lock), .req_out(req_out[i]), .ack_in(ack_in[i]), .rst(rst));
    end
endgenerate

assign lock = {|req_out}; // OR of req_out to assure they are all zero

endmodule