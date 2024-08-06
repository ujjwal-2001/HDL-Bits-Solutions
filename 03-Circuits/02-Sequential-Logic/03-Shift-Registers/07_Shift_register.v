module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] q;
    
    assign out = q[0];
	
    always@(posedge clk)begin
        if(!resetn)
            q <= 4'd0;
        else
            q <= {in,q[3:1]};
    end

    // Alternative implementation
    // reg q0,q1,q2;
    
    // always@(posedge clk)begin
    //     if(!resetn)
    //     {out,q0,q1,q2} <= 4'h0;
    //     else begin
    //         q0 <= in;
    //         q1 <= q0;
    //         q2 <= q1;
    //         out <= q2;
    //     end
    // end
    
endmodule
