module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
	parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4,F=3'd5;
    reg [2:0] ns,ps;
    
    always@(*)begin
        case(ps)
            A: ns = w? B:A;
            B: ns = w? C:D;
            C: ns = w? E:D;
            D: ns = w? F:A;
            E: ns = w? E:D;
            F: ns = w? C:D;
            default: ns = 3'bxxx;
        endcase
    end  
    
    always@(posedge clk)begin
        if(reset)
            ps <= A;
        else
            ps <= ns;
    end
    
    assign z = (ps == E) | (ps == F);

endmodule
