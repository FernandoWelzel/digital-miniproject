// It will be quite hard to synchronise everything here are the main ideas :
// The requests coming from L_neurones will be treated by the memory, which will give us the queues both left and right in order to execute
//The memory returns as many L_request as the number of R_neurones connected to the L_neuron. It sends a request for the L_neuron and which R_neuron activates. For exmaple, if L_neurone is connected to 3 R_neurones, it sends 3 request one after the other with 3 times the position of the L_neuron and the 3 different positions of R_neurons 



module fsm(

input logic [log2((sizen-1)):0] L_layer_request; //memory gives us the L_neuron that asks for request
input logic [log2((sizem-1)):0] R_layer_request; //memory gives us the R_neuron that asks for request
input logic [(sizem-1)*(sizen-1):0] register_acknowledge; //will then be used for parallel activations

output logic [(sizem-1)*(sizen-1):0] register_activation; //I suppose that there is a layer of only registers, so that the fsm only sends requests to this layer to activate the correct coefficient on correct R_neurone 

)
logic [bigsize-1:0] L_queue=0;
logic [bigsize-1:0] R_queue=0;
int i;
register_activation = 0;
always_comb
begin
    register_activation[L_layer_request+(sizem-1)*R_layer_request] <= 1;
    if (register_acknowledge[L_layer_request+(sizem-1)*R_layer_request]==1) begin
        register_activation[L_layer_request+(sizem-1)*R_layer_request] <= 0;
        register_acknowledge[L_layer_request+(sizem-1)*R_layer_request] <= 0;
    end
end


endmodule





