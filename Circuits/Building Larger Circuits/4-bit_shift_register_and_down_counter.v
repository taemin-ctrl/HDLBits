module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
	
    reg [3:0] cnt;
    
    always @(posedge clk) begin
        if (shift_ena & data) begin
            cnt <= {cnt[2:0], data};
        end
        
        else if (shift_ena) begin
            cnt <= cnt << 1;
        end
        
        if (count_ena) begin
        	cnt <= cnt - 1;
        end
    end
    
    assign q = cnt;
endmodule
