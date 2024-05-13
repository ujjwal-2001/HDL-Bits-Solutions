module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4;
    reg [2:0] ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = data? B:A;
            B: ns = data? C:A;
            C: ns = data? C:D;
            D: ns = data? E:A;
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
    
    assign start_shifting = ps[2];
        
endmodule
