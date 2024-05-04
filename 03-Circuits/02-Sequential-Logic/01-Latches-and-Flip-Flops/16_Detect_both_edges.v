module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] ns,ps,out_temp;
    
    assign ns = in;
    assign out_temp = ps ^ in;
    
    always @ (posedge clk) begin
        ps <= ns;
        anyedge <= out_temp;
    end

endmodule
