module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter [3:0] NONE=0,ONE=1,TWO=2,THREE=3,FOUR=4,FIVE=5,SIX=6,ERROR=7,DISCARD=8,FLAG=9;
    reg [3:0] ps,ns;
    
    always@(*)begin
        case(ps)
            NONE: ns = in?ONE:NONE;
            ONE: ns = in?TWO:NONE;
            TWO: ns = in?THREE:NONE;
            THREE: ns = in?FOUR:NONE;
            FOUR: ns = in?FIVE:NONE;
            FIVE: ns = in?SIX:DISCARD;
            SIX: ns = in?ERROR:FLAG;
            ERROR: ns = in?ERROR:NONE;
            DISCARD: ns = in?ONE:NONE;
            FLAG: ns = in?ONE:NONE;
        endcase
    end
    
    always@(posedge clk)begin 
        if(reset)
            ps <= NONE;
        else
            ps <= ns;
    end
       
    assign disc = (ps==DISCARD);
    assign flag = (ps==FLAG);
    assign err = (ps==ERROR);

endmodule
