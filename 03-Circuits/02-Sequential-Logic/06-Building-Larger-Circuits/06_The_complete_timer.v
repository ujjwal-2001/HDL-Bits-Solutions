module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	
    parameter [3:0] S=0,S1=1,S11=2,S110=3,B0=4,B1=5,B2=6,B3=7,COUNT=8,WAIT=9;
    reg [3:0] ps,ns;
    reg [9:0] counter;
    
    always@(*)begin
        case(ps)
            S: 		ns = data? S1:S;
            S1: 	ns = data? S11:S;
            S11: 	ns = data? S11:S110;
            S110: 	ns = data? B0:S;
            B0: 	ns = B1;
            B1: 	ns = B2;
            B2: 	ns = B3;
            B3: 	ns = COUNT;
            COUNT: 	ns = (count == 0 & counter == 999)? WAIT:COUNT;
            WAIT: 	ns = ack? S:WAIT;
            default: ns = 4'bxxxx;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)
            ps <= S;
        else
            ps <= ns;
    end
    
    always @(posedge clk) begin
        case (ps) 
			B0: count[3] <= data;
			B1: count[2] <= data;
			B2: count[1] <= data;
			B3: count[0] <= data;
			COUNT: begin
				if (count >= 0) begin
                    if (counter < 999) 
						counter <= counter + 1'b1;
					else begin
						count <= count - 1'b1;
						counter <= 0;
					end
				end
			end
			default : counter <= 0;
		endcase
	end
    
    assign counting = (ps == COUNT);
    assign done = (ps == WAIT);
    
endmodule
