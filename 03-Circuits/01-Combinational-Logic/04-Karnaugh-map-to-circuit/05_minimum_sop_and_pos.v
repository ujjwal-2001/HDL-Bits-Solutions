module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
	assign out_sop = ~a&~b&c&~d | c&d;
    assign out_pos = c & (~a|b) & (~c|d|~b);
endmodule
