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

// == Behaviour description =====================================================
always @* begin
    if( x & y ) begin
        u <= 1;
        v <= 0; 
    end
    else begin
        u <= x;
        v <= y;
    end
end

endmodule
