module top_module(
    output zero
);// Module body starts after semicolon

// For Quartus synthesis, not assigning a value to a signal usually results in 0. 
assign zero = 1'b0; // Good practice to assign a value to a signal explicitly

endmodule
