//==============================================================================
//  Filename    : cascade_architecture.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Architecture of arbiter with cascading MUTEX : n entries from the locker, sends one request at the end and arbiter who sends (coupled with the selector that reads who sends). Sends a request at the end.
//==============================================================================
module cascade_architecture #(
    parameter n=32 //number of entries
)(
input logic [n-1:0] entries;

output logic [2*n-3:0] selector_entries; // for the w_res module, that's its entries
output logic req //request at the end
  
);

// we're gonna initiate all intern values, then connect them together. But because we don't know how many arbiter_2b we have, we must initiate them in a for with all variable places already set up.
logic [n-1:0] all_req_out;
logic [2*n-3:0] all_req_in;
logic [2*n-3:0] all_ack_in;

logic [n-1:0] all_ack_out; 
logic [n-1:0] all_req_out;
logic [n-1:0] sel;

// Initialize
assign entries[0] = all_req_in[0];

generate
for(i=0;i<=n-2;i++) begin
    arbiter_2b arb(.req_in[0](all_req_in[2i]), .req_in[1](all_req_in[2i+1]), .ack_in[0](all_ack_in[2i]), .ack_in[1](all_ack_in[2i+1]), .req_out(all_req_out[i]), .ack_out(all_ack_out[i]), .sel(sel[i]));
    assign all_req_in[2i+1] = entries[i+1];  // unpair req_ins are neuron_inputs (the n entries)
    assign all_req_in[2i] = all_req_out[i]; // I use the req_out signal which is really useful here, you'll see why
    assign selector_entries[2i] = (all_req_out[i])*(~sel[i]); //just combinatory it works
    assign selector_entries[2i+1] = (all_req_out[i])*sel[i]; //same, this signal will be used by the selector
//all_req_in : OK
//all selector_entries : OK
//all mutex : OK
//
end
endgenerate

assign req = all_req_out[n-2];
assign all_ack_out[n-2] = req;

                                                                 

endmodule


// needs to reset all mutex outputs at 0
//needs a first req_in
//doesn't send any acknowledge back to the entries[i] that fires (but send one through the mutexes)
//does the acknowledge goes through correctly ?
// does it enable to reset the "arbiter" when ack comes all the way back ? (so that we can do another turn)
// IMPORTANT : the acknowledge for the entries[i] that fires needs to come back before the acknowledges go through the mutexes.