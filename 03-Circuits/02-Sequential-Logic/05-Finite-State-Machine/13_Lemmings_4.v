module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT=0, RIGHT=1, FALLING_R=2, FALLING_L=3, DIGGING_R=4, DIGGING_L=5, SPLATTER=6;
    reg [2:0] state, next_state;
    reg [6:0] count;
    
    always @(*) begin
        // State transition logic
        case(state)
            LEFT: next_state = (ground)? (dig)? DIGGING_L:(bump_left)? RIGHT:LEFT:FALLING_L;
            RIGHT: next_state = (ground)? (dig)? DIGGING_R:(bump_right)? LEFT:RIGHT:FALLING_R;
            FALLING_R: next_state = (ground)? (count > 7'd19)? SPLATTER:RIGHT: FALLING_R;
            FALLING_L: next_state = (ground)? (count > 7'd19)? SPLATTER:LEFT: FALLING_L;
            DIGGING_R: next_state = (ground)? DIGGING_R:FALLING_R;
            DIGGING_L: next_state = (ground)? DIGGING_L:FALLING_L;
            SPLATTER: next_state = SPLATTER;
            default: next_state = 2'bxxx;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= LEFT;
            count <= 7'd0;
        end
        else begin
            if(state == FALLING_R || state == FALLING_L)
                count <= count +1;
            else 
                count <= 7'd0;
            
            state <= next_state;
        end
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = ((state == FALLING_R) | (state == FALLING_L));
    assign digging = ((state == DIGGING_R) | (state == DIGGING_L));

endmodule
