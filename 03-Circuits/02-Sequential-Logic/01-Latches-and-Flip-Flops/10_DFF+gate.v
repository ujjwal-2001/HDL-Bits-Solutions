module top_module (
    input clk,
    input in, 
    output out);
    
    wire d;
    
    assign d = out^in;
    
    always@(posedge clk)begin
        out <= d;
    end

endmodule
