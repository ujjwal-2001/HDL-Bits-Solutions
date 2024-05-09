module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter [3:0] S=0,S1=1,S11=2,S110=3,B0=4,B1=5,B2=6,B3=7,COUNT=8,WAIT=9;
    reg [3:0] ps,ns;
    
    always@(*)begin
        case(ps)
            S: ns = data? S1:S;
            S1: ns = data? S11:S;
            S11: ns = data? S11:S110;
            S110: ns = data? B0:S;
            B0: ns = B1;
            B1: ns = B2;
            B2: ns = B3;
            B3: ns = COUNT;
            COUNT: ns = done_counting? WAIT:COUNT;
            WAIT: ns = ack? S:WAIT;
            default: ns = 4'bxxxx;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            ps <= S;
        else
            ps <= ns;
    end
    
    assign shift_ena = (ps == B0) | (ps == B1) | (ps == B2) | (ps == B3);
    assign counting = (ps == COUNT);
    assign done = (ps == WAIT);
    
endmodule