module mux2to1(
    input d0,
    input d1,
    input sel,
    output out
);
    assign out = (sel)? d1:d0;
endmodule

module D_Flip_Flop(
    input clk,
    input d,
    output q
);
    always@(posedge clk)begin
        q<=d;
    end
endmodule

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire d;
    
    mux2to1 mux1(q_in, r_in,L,d);
    D_Flip_Flop dff1(clk,d,Q);

endmodule
