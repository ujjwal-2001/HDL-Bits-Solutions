module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire[31:0] b_xor;
    wire cout1;
    
    assign b_xor = b^{32{sub}};
    
    add16 adder1(.a(a[15:0]),.b(b_xor[15:0]),.sum(sum[15:0]),.cin(sub),.cout(cout1)); 
    add16 adder2(.a(a[31:16]),.b(b_xor[31:16]),.sum(sum[31:16]),.cin(cout1)); 

endmodule
