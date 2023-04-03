//==============================================================================
//  Filename    : fork_param_tb.sv                                              
//  Designer    : Dan HAYOUN
//  Description : Testbench of fork_param module 
//==============================================================================
module w_res_bench ();

      
logic [7:0] w_res_entry; //input
logic [4:0] w_res; //output

  


// Controller
//inputs
w_res#( .n(5)) F_p (
  .w_res_entry ( w_res_entry ),   
  .w_res ( w_res )
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  
    begin
        //testing only one that fires (i suppose everything else works)
        w_res_entry = 8'b01010101; // fires 0

        #10 w_res_entry = 8'b01010110; //1
        #10 w_res_entry = 8'b01100000; //5
        //Now with multipl entries, deciding who passes at the end

        #10 w_res_entry = 8'b10011000; //7 and 3 fire, 7 wins
        #10 w_res_entry = 8'b01100110; //5 and 1 fire, 5 wins
    
    end                                                                        

endmodule
