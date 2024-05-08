module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter [2:0] A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg [2:0] ns, ps;
    
    always@(*)begin
        case(ps)
            A: ns = x? B:A;
            B: ns = x? E:B;
            C: ns = x? B:C;
            D: ns = x? C:B;
            E: ns = x? E:D;
            default: ns = 3'bxxx;
        endcase
    end
    
    always@(posedge clk)begin 
        if(reset)
            ps <= A;
        else
            ps <=ns;
    end
    
    assign z = (ps==D) | (ps==E);

endmodule
