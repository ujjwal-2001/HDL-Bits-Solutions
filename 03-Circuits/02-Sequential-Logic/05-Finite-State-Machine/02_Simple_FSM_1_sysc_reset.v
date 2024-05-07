// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;
    
    initial out = 0;

    // Fill in state name declarations
	parameter A=0,B=1;
    reg present_state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        next_state = present_state~^in;
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset)
            present_state <= B;
        else 
            present_state <= next_state;
    end

    // Output logic
    assign out = present_state;

endmodule
