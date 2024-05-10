`timescale 1ps / 1fs

module top_module ( );
    
    reg clk;
    
    dut i(clk);
    
    always begin
        #5 clk = ~clk;
	end
    
    initial begin
        clk = 0;
    end

endmodule
