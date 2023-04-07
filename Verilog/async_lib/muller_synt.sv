//==============================================================================
//  Filename    : muller_synt.sv                                         
//  Designer    : Fernando WELZEL
//  Description : Parametric muller gate (C element).
//==============================================================================
module muller_synt #(
  parameter               size = 2   // Size - Number of inputs
  )(
  input  logic [size-1:0]  data_in,  // Input values
  output logic            data_out,  // Output value

  input  logic                 rst   // Asyncronous posedge reset -> data_out = 0
);

// == Variable declaration ====================================================
logic [size-1:0] data_inter; // Intermediary data vector 

// == Instantiation using generate ============================================
generate
    genvar i;
    for( i = 1; i < size; i++ ) begin
        if( i == 1 ) begin
            muller_synt_2b muller_gen(.data_in(data_in[1:0]), .data_out(data_inter[i-1]), .rst(rst)); 
        end
        else begin
            muller_synt_2b muller_gen(.data_in({data_in[i], data_inter[i-2]}), .data_out(data_inter[i-1]), .rst(rst));     
        end
    end
endgenerate

// == Block connection =======================================================
assign data_out = data_inter[size-1];

endmodule
