module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always@(posedge clk)begin
        if(a)
            q <= 3'd4;
        else 
            q <= (q==3'd6)? 3'd0:q+1;
    end

endmodule
