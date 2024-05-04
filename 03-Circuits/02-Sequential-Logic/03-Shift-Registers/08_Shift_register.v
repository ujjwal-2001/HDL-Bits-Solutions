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

module MUXDFF (
    input clk,
    input R,
    input E,
    input L,
    input w,
    output Q
);
    wire w1;
    wire d;
    
    mux2to1 mux1(Q,w,E,w1),
    mux2(w1,R,L,d);
    
    D_Flip_Flop dff1(clk,d,Q);

endmodule

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    
    MUXDFF i0(KEY[0],SW[0],KEY[1],KEY[2],LEDR[1],LEDR[0]),
    i1(KEY[0],SW[1],KEY[1],KEY[2],LEDR[2],LEDR[1]),
    i2(KEY[0],SW[2],KEY[1],KEY[2],LEDR[3],LEDR[2]),
    i3(KEY[0],SW[3],KEY[1],KEY[2],KEY[3],LEDR[3]);

endmodule