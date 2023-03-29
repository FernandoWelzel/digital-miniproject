//==============================================================================
//  Filename    : mutex.sv                                         
//  Designer    : Fernando WELZEL 
//  Description : Mutually exclusive block 
//==============================================================================
module mutex (
    input  logic  x, // Correlates to output u 
    input  logic  y, // Correlates to output y  

    output logic  u, // Correlates to input x 
    output logic  v  // Correlates to input y  
);

// == Variable declaration ======================================================
integer random_var = $urandom%2;

// == Behaviour description =====================================================
always_ff @* begin
    if( x & y ) begin
        u <= random_var ? 0 : 1;
        v <= random_var ? 1 : 0; 
    end
    else begin
        u <= x;
        v <= y;
    end
end

endmodule
