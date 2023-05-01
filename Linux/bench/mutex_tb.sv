//==============================================================================
//  Filename    : mutex.sv                                              
//  Designer    : Fernando WELZEL
//  Description : Test bench for mutex
//==============================================================================
module mutex_bench ();

timeunit      1ns;
timeprecision 1ns;

logic x, y;
logic u, v;

// Mutex
mutex mutex_1 (
  .x ( x ),
  .y ( y ),
  .u ( u ),
  .v ( v )
);

mutex mutex_2 (
  .x ( x ),
  .y ( y )
);

mutex mutex_3 (
  .x ( x ),
  .y ( y )
);

mutex mutex_4 (
  .x ( x ),
  .y ( y )
);

// Monitor Results format
initial $timeformat ( -9, 1, " ns", 12 );

// Reset muller gate and apply stimulus on muller gate
initial  forever
    begin
        #10 x = 0; y = 0;
        #10 x = 1; y = 0;
        #10 x = 0; y = 0;
        #10 x = 0; y = 1;
        #10 x = 0; y = 0;
        #10 x = 1; y = 1;
        #10 x = 1; y = 0;
        #10 x = 0; y = 0;
    $finish;
    end                                                                        

endmodule
