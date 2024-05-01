module top_module ( input [1:0] A, input [1:0] B, output z ); 

    assign z = (A==B)? 1'b1 : 1'b0;

    // Alternative 01
    // assign z = (A[0]==B[0] && A[1]==B[1])? 1'b1 : 1'b0;

    // Alternative 02
    // assign z = (A[0]^B[0] == 0 && A[1]^B[1] == 0)? 1'b1 : 1'b0;

    // Alternative 03
    // assign z = (A[0]^B[0] | A[1]^B[1])? 1'b0 : 1'b1;

    // Alternative 04
    // always@(*)begin
    //     if(A[0]==B[0] && A[1]==B[1])
    //         z = 1'b1;
    //     else
    //         z = 1'b0;
    // end


endmodule
