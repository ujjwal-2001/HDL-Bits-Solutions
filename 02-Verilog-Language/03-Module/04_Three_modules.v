module top_module ( input clk, input d, output q );
    
    wire d1, d2;

    my_dff dff1(.clk(clk),.d(d),.q(d1));
    my_dff dff2(.clk(clk),.d(d1),.q(d2));
    my_dff dff3(.clk(clk),.d(d2),.q(q));

endmodule
