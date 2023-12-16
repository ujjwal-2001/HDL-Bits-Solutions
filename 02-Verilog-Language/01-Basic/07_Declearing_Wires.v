`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire w,x,y,z;
    assign {w,x} = {a&b,c&d};
    assign out = w|x;
    assign out_n = ~out;
    // Alternative implementation
    // assign out = ((a&b)|(c&d));
    // assign out_n = ~out;
endmodule