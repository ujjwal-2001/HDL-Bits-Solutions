module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = ~c&a&~b | a&c&d | ~a&b&c | ~a&~b&~d | ~a&~b&~c | ~a&~c&~d; 
    
endmodule
