module top_module (
    input clk,
    input reset,   
    output [3:1] ena,
    output [15:0] q);
    
    reg [15:0] cnt = 0;
    
    always @(posedge clk) begin
    if (reset) begin
        cnt <= 0;
    end
    else begin
        
        if (cnt[15:12] == 4'd9 && cnt[11:8] == 4'd9 && cnt[7:4] == 4'd9 && cnt[3:0] == 4'd9) begin
            cnt <= 0;
        end
        
        else if (cnt[11:8] == 4'd9 && cnt[7:4] == 4'd9 && cnt[3:0] == 4'd9) begin
            cnt[11:0] <= 0;
            cnt[15:12] <= cnt[15:12] + 1'b1; 
        
        else if (cnt[7:4] == 4'd9 && cnt[3:0] == 4'd9) begin
            cnt[7:0] <= 0;
            cnt[11:8] <= cnt[11:8] + 1'b1; 
        end
        
        else if (cnt[3:0] == 4'd9) begin
            cnt[3:0] <= 0;
            cnt[7:4] <= cnt[7:4] + 1'b1; 
        end
        	else begin
            	cnt[3:0] <= cnt[3:0] + 1'b1; 
        	end
    	end
	end
    
    assign ena[1] = (q[3:0]==4'd9)?1'b1:1'b0;
    assign ena[2] = (q[7:4]==4'd9 && q[3:0]==4'd9)?1'b1:1'b0;
    assign ena[3] = (q[11:8]==4'd9 && q[7:4]==4'd9 && q[3:0]==4'd9)?1'b1:1'b0;
    assign q = cnt;
endmodule
