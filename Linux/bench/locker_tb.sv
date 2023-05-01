//==============================================================================
//  Filename    : locker_tb.sv                                              
//  Designer    : Luca SAUER DE ARAUJO
//  Description : Testbench of locker 
//==============================================================================
module locker_bench ();

timeunit      1ns;
timeprecision 1ns;
      
// Inputs      
logic       [1:0] req_in;
logic       [1:0] ack_out;
bit rst;  

// Outputs
logic       [1:0] ack_in;
logic       [1:0] req_out;

// Locker
locker_param #( .size(2)) locker_bench (
  .req_in     ( req_in  ),
  .ack_out    ( ack_out ), 
  .rst        ( rst     ),  

  .req_out    ( req_out ),
  .ack_in     ( ack_in  )
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
// Inputs      
// logic       [1:0] req_in;
// logic             lock;
// logic       [1:0] ack_out;      
      rst = 0;
      #10 rst = 1;
      #10 rst = 0;
      #10 ack_out = 2'b00;  // ack_out is inverted in the ctrl_locker
      #10 req_in = 2'b11;   // req_in arrives and req_out is HIGH
                            // ack_in should become HIGH as well
      #10 ack_out = 2'b11;  // acknowlodge comes from next neuron 
      #10 req_in = 2'b00;   // this should set lock, ack_in and req_out to 0
      
      #10 ack_out = 2'b00;
      #10 req_in = 2'b10;   // new req_in arrives -> req_out should receive this value
      #10 ack_out = 2'b10;  // ack_out of the req_out
      #10 req_in = 2'b00;

      #10 ack_out = 2'b00;
      #10 req_in = 2'b01;
      #10 ack_out = 2'b01;
      #10 req_in = 2'b00;
    

    end                                                                        

endmodule