module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] ps, ns;

    // State transition logic (combinational)
    always@(*)begin
        case(ps)
            A: ns = in[3] ? B : A;
            B: ns = C;
            C: ns = D;
            D: ns = in[3] ? B : A;
        endcase
    end
    
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset)
            ps <= A;
    	else
            ps <= ns;
    end
    
    // Output logic
    assign done = &ps;
    
endmodule
