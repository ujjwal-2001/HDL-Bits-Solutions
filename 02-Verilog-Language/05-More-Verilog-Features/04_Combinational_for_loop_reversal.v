module top_module( 
    input [99:0] in,
    output [99:0] out
);

always @(*) begin
    out = 0;
    for (int i = 0; i < 100; i = i + 1) begin
        out[99 - i] = in[i];
    end
end

endmodule