module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter [1:0] A=2'b00,B=2'b01,C=2'b10;
    reg [1:0] ps,ns;
    wire rs;
    
    always@(*)begin
        case(ps)
            A: ns = x? B:A;
            B: ns = x? B:C;
            C: ns = x? B:A;
            default: ns = 2'bxx;
        endcase
    end
    
    always @(posedge clk or negedge aresetn) begin
        if (~aresetn) ps <= A;
		else ps <= ns;
	end
    
    assign z = ps[1] & x;

endmodule
