module top_module(
    input clk,
    input in,
    input areset,
    output out); //
	
    reg [3:0] next_state, state;
    // Uding One-hot encoding
    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[0]&(~in) | state[2]&(~in);
    assign next_state[B] = in & (state[0] | state[1] | state[3]);
    assign next_state[C] = ~in & (state[1] | state[3]);
    assign next_state[D] = in & state[2];

    // Output logic: 
    assign out = state[D];
    
    // Transition
    always@(posedge clk, posedge areset)begin
        if(areset)
            state <= 4'b0001;
        else
            state <= next_state;
    end

endmodule
