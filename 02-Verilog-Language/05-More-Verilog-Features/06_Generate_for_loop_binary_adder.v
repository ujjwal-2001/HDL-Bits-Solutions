module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    FA FA_inst_initial(
                .a(a[0]),
                .b(b[0]),
                .cin(cin),
                .cout(cout[0]),
                .sum(sum[0])
            );

    genvar i;
    generate
        for (i=1; i<100; i=i+1)begin: FA_GEN
            FA FA_inst(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate

endmodule

module FA(
    input a, b, cin,
    output cout, sum
);
    assign cout = a & b | a & cin | b & cin;
    assign sum = a ^ b ^ cin;

endmodule