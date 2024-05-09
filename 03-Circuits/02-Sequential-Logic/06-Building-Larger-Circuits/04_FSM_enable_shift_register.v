module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4;
    reg [2:0] ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = B;
            B: ns = C;
            C: ns = D;
            D: ns = E;
            E: ns = E;
            default: ns = 3'bxxx;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            ps <= A;
        else
            ps <= ns;
    end
    
    assign shift_ena = ~ps[2];
    
endmodule
