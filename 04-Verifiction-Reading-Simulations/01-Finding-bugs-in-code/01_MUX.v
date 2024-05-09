module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  ); // Output needs to be of 8 bits

    assign out = sel? a:b; // The output should be assigned to a or b based on the value of sel

endmodule
