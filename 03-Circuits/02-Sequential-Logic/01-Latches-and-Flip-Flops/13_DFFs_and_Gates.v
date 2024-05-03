module D_Flip_Flop(
    input clk,
    input d,
    output q,
    output q_bar
);
    assign q_bar = ~q;
    
    always@(posedge clk)begin
        q<=d;
    end
endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    
    wire d0,d1,d2;
    wire q0,q1,q2;
    wire q_bar0,q_bar1,q_bar2;
    
    assign d0 = x ^ q0;
    assign d1 = x & q_bar1;
    assign d2 = x | q_bar2;
    assign z = ~(q0|q1|q2);
    
    D_Flip_Flop dff0(clk,d0,q0,q_bar0),
    dff1(clk,d1,q1,q_bar1),
    dff2(clk,d2,q2,q_bar2);

endmodule
