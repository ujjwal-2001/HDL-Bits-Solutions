module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    always@(posedge clk, posedge areset)begin
        q <= (areset)?8'h0:d;
    end

endmodule
