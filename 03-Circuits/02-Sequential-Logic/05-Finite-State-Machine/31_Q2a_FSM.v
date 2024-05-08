module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter [1:0] A=2'd0,B=2'd1,C=2'd2,D=2'd3;
    reg [1:0] ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = r[1]? B: r[2]? C: r[3]? D : A;
            B: ns = r[1]? B:A;
            C: ns = r[2]? C:A;
            D: ns = r[3]? D:A;
            default: ns = 2'bxx;
        endcase
    end
    
    always@(posedge clk)begin
        if(resetn)
            ps <= ns;
        else
            ps <= A;
    end
    
    assign g = {(ps == D),(ps == C),(ps == B)};
        
endmodule
