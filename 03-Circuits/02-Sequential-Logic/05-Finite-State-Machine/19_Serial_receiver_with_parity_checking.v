module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
	parameter A=0,D0=1,D1=2,D2=3,D3=4,D4=5,D5 =6,D6=7,D7=8,B=9,C=10,D=11,P=12;
    reg [3:0] ps,ns;
    
    always@(*)begin
        case(ps)
            A: ns = in? A:D0;
            D0: ns = D1;
            D1: ns = D2;
            D2: ns = D3;
            D3: ns = D4;
            D4: ns = D5;
            D5: ns = D6;
            D6: ns = D7;
            D7: ns = P;
            P: ns = (^{out_byte,in})? B:C;
            B: ns = in? D:C;
            C: ns = in? A:C;
            D: ns = in? A:D0;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin
            ps <= A;
            out_byte <= 8'hx;
        end
        else begin
            ps <= ns;
                
            if((ps != A) & (ps != B) & (ps != C) & (ps != D) & (ps != P))
                out_byte <= {in,out_byte[7:1]};
            else
                out_byte <= out_byte ;
            
        end
    end
    
    assign done = (ps==D);

endmodule
