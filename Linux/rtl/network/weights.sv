//==============================================================================
//  Filename    : weights.sv                                         
//  Designer    : Fernando WELZEL
//  Description : The weights for the neurons
//==============================================================================
package weights_pkg;

localparam [3:0][63:0] weight_layer1  = 
  { 64'h342231052c021226,
    64'h16321106192c2f38,
    64'h13002d27060e0233,
    64'h12ee390b380c1e35 }; // Two's complement of 11 is ee

localparam [7:0][15:0] weight_layer2  = 
  { 16'h5515, // Two's complement of 16 is e9 
    16'h1708,
    16'h42ce, // Two's complement of 31 is ce
    16'hc80f, // Two's complement of 37 is c8
    16'h0810, 
    16'h3434,
    16'h1a64,
    16'he921 }; // Two's complement of 16 is e9


endpackage