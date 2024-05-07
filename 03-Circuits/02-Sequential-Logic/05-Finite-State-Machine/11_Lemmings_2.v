module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=0, RIGHT=1, FALLING_R=2, FALLING_L=3;
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: next_state = (ground)?(bump_left)? RIGHT:LEFT:FALLING_L;
            RIGHT: next_state = (ground)?(bump_right)? LEFT:RIGHT:FALLING_R;
            FALLING_R: next_state = (ground)? RIGHT: FALLING_R;
            FALLING_L: next_state = (ground)? LEFT: FALLING_L;
            default: next_state = 2'bxx;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALLING_R) | (state == FALLING_L);

endmodule
