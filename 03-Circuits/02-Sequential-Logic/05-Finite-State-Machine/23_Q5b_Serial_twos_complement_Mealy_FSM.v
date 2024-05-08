module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=1'b0,B=1'b1;
    reg ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = x? B:A;
            B: ns = B;
            default: ns = A;
        endcase
    end
    
    always@(posedge clk, posedge areset)begin
        if(areset)
            ps <= A;
        else
            ps <= ns;
    end
    
    assign z = ps^x;


endmodule
