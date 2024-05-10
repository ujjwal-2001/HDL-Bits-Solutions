module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    parameter S0 = 1'b0, S1 = 1'b1;
    reg ns;
    
    always@(*)begin
        case(state)
            S0: ns = (a&b)? S1:S0;
            S1: ns = (~a&~b)? S0:S1;
            default: ns = 1'bx;
        endcase
    end
    
    always@(posedge clk)begin
        state <= ns;
    end
    
    assign q = (~state &(a ^ b)) | (state & ~(a ^ b));

endmodule
