module top_module (
    input [3:1] y,
    input w,
    output Y2);

    assign Y2 = ~y[2]&y[1] | y[3]&~y[2]&w | ~y[3]&y[2]&~y[1]&w;

    // ALTERNATIVE SOLUTION
    // parameter [2:0] A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4,F=3'd5;
    // reg [2:0] ns;
    
    // always@(*)begin
    //     case(y)
    //             A: ns = w? B:A;
    //             B: ns = w? C:D;
    //             C: ns = w? E:D;
    //             D: ns = w? F:A;
    //             E: ns = w? E:D;
    //             F: ns = w? C:D;
    //         default: ns = 3'bxxx;
    //     endcase
    // end 
    
    // assign Y2 = ns[1];

endmodule
