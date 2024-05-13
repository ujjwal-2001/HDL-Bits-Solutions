module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    parameter [1:0] SNT=0,WNT=1,WT=2,ST=3;
    reg [1:0] next_state;
    
    always@(*)begin
        case(state)
            SNT: next_state = (train_valid & train_taken)? WNT:SNT;
            WNT: next_state = (train_valid & train_taken)? WT:(train_valid & ~train_taken)? SNT:WNT;
            WT: next_state = (train_valid & train_taken)? ST:(train_valid & ~train_taken)? WNT:WT;
            ST: next_state = (train_valid & ~train_taken)? WT:ST;
            default: next_state = 2'bxx;
        endcase
    end
    
    always@(posedge clk, posedge areset)begin
        if(areset)
            state <= WNT;
        else
            state <= next_state;
    end

endmodule
