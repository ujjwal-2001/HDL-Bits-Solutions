module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter [1:0] A=2'b00,B=2'b01,C=2'b10;
    reg [1:0] ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = x? B:A;
            B: ns = x? C:B;
            C: ns = x? C:B;
            default: ns = A;
        endcase
    end
    
    always@(posedge clk, posedge areset)begin
        if(areset)
            ps <= A;
        else
            ps <= ns;
    end
    
    assign z = ps[0];

endmodule
