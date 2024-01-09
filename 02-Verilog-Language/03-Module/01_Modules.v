module top_module ( input a, input b, output out );
    mod_a i1(.in1(a), .in2(b), .out(out));
    // Alternative way to instantiate a module
    // mod_a i1(a, b, out);
endmodule
