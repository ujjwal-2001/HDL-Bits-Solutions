module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A=1'b0,B=1'b1;
    reg ps,ns;
    reg [1:0] count1, count2 ;
    
    always@(*)begin
        case(ps)
            A: ns = s? B:A;
            B: ns = B;
            default: ns = A;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin
            ps <= A;
            count2 <= 2'd0;
            count1 <= 2'd0;
        end
        else begin 
            ps <= ns;
            
            if(ps == B)begin
                
                if(count1 == 2'd3)begin
                    count2 = 2'd0;
            		count1 = 2'd0;
                end
                
                count2 = w? count2+1:count2 ;
                count1 = count1+1;
               
            end
            
        end
    end
    
    assign z = ((count1 == 2'd3) & (count2 == 2'd2) );

endmodule
