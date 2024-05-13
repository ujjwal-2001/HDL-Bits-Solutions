module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] counter;
    
    always@(posedge clk)begin
        if(load)
    		counter <= data;
        else 
            counter <= (counter == 0)? 0:counter - 1;
    end
        
    assign tc = ~|counter;

endmodule
