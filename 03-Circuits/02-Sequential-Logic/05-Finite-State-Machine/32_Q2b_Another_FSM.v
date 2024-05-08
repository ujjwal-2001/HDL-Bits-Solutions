module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter [3:0] A=4'd0,B=4'd1,C=4'd2,D=4'd3,E=4'd4,F=4'd5,G=4'd6,H=4'd7,I=4'd8,J=4'd9;
    reg [3:0] ns,ps;
    
    always@(*)begin
        case(ps)
            A: ns = B;
            B: ns = J;
            C: ns = x? C:D;
            D: ns = x? E:I;
            E: ns = y? G:F;
            F: ns = y? G:H;
            G: ns = G;
            H: ns = H;
            I: ns = x? C:I;
            J: ns = x? C:I;
            default: ns = 4'bxxxx;
        endcase
    end
    
    always@(posedge clk)begin
        if(resetn)
            ps <= ns;
        else
            ps <= A;
    end
    
    assign f = (ps == B);
    assign g = (ps == E) | (ps == F) | (ps == G);
    

endmodule
