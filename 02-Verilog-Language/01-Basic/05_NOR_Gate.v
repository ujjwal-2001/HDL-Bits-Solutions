module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a|b);
    // Alternative implementation
    // assign out = !(a || b);
endmodule