module top_module( 
    input a,b,c,
    output w,x,y,z );
	assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
    // Alternative way to assign multiple signals
    // assign {w,x,y,z} = {a,b,b,c};
endmodule
