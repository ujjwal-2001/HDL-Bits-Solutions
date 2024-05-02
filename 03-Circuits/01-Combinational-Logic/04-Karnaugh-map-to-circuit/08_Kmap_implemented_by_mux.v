module mux2to1(
	input d1,
    input d0,
    input s,
    output out
);
    assign out = s? d1:d0;
    
endmodule

module mux4to1(
    input d3,
    input d2,
    input d1,
    input d0,
    input s1,
    input s0,
    output out
);
    wire w1,w2;
    
    mux2to1 i1(d3,d2,s0,w1), i2(d1,d0,s0,w2), i3(w1,w2,s1,out);
    
endmodule

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    
    assign mux_in[1] = 1'b0;
    mux4to1 i1(1,1,1,0,c,d,mux_in[0]),
    i3(0,1,0,1,c,d,mux_in[2]),
    i4(1,0,0,0,c,d,mux_in[3]);
    
endmodule