module top_module (
    input [7:0] in,
    output reg [2:0] pos );

    always@(*)begin
        casez(in)
            8'bzzzz_zzz1: pos = 3'b000;
            8'bzzzz_zz10: pos = 3'b001;
            8'bzzzz_z100: pos = 3'b010;
            8'bzzzz_1000: pos = 3'b011;
            8'bzzz1_0000: pos = 3'b100;
            8'bzz10_0000: pos = 3'b101;
            8'bz100_0000: pos = 3'b110;
            8'b1000_0000: pos = 3'b111;
            default: pos = 3'b000;
        endcase
    end

endmodule
