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
    input w, R, E, L,
    output Q
);
    wire w1;
    wire d;
    
    mux2to1 mux1(Q,w,E,w1),
    mux2(w1,R,L,d);
    
    D_Flip_Flop dff1(clk,d,Q);

endmodule
