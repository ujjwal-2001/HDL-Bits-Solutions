module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1; 
    wire[15:0] sum20, sum21;
    
    add16 adder1(.a(a[15:0]),.b(b[15:0]),.sum(sum[15:0]),.cin(1'b0),.cout(cout1)); 
    add16 adder20(.a(a[31:16]),.b(b[31:16]),.sum(sum20),.cin(1'b0)); 
    add16 adder21(.a(a[31:16]),.b(b[31:16]),.sum(sum21),.cin(1'b1)); 
    
    always@(*)begin
        case(cout1)
           1'b0: sum[31:16] = sum20;
           1'b1: sum[31:16] = sum21;
       endcase
    end
    
endmodule