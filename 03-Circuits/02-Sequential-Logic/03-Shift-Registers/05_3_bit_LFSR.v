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

module submod (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    wire d;
    
    mux2to1 mux1(q_in, r_in,L,d);
    D_Flip_Flop dff1(clk,d,Q);

endmodule

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire q;
    
    assign q = LEDR[2] ^ LEDR[1];
	
    submod i0(KEY[0],KEY[1],SW[0],LEDR[2],LEDR[0]),
    i1(KEY[0],KEY[1],SW[1],LEDR[0],LEDR[1]),
    i2(KEY[0],KEY[1],SW[2],q,LEDR[2]);

endmodule

// Alternative implementation of the 3-bit LFSR
    // always@(posedge KEY[0])begin
    //     LEDR[0] <= KEY[1]? SW[0] : LEDR[2];
    //     LEDR[1] <= KEY[1]? SW[1] : LEDR[0];
    //     LEDR[2] <= KEY[1]? SW[2] : LEDR[2]^LEDR[1];
    // end
