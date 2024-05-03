module top_module (
    input d, 
    input ena,
    output q);
    
    always@(*)begin
        q <= (ena)? d: q;
    end

endmodule
