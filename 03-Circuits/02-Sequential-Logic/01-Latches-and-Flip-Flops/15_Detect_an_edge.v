module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]ps, ns, out_temp;
    
    assign ns = in;
    assign out_temp = ~ps&in;
    
    always @ (posedge clk) begin
        ps <= ns;
        pedge <= out_temp;
    end

endmodule
