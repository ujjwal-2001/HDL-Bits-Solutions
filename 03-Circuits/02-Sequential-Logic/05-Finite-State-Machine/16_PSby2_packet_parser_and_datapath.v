module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
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
        if(reset)begin
            ps <= A;
            out_bytes <= 24'hxxx;
        end
    	else begin
            ps <= ns;
            out_bytes <= {out_bytes[15:0],in};
        end
    end
    
    // Output logic
    assign done = &ps;

endmodule
