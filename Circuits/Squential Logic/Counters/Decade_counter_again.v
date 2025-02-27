module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    reg [3:0] cnt = 1;
    
    always @(posedge clk) begin
        if (reset) begin
        	cnt <= 1;
        end
        else if (cnt == 4'd10)begin
        	cnt <= 1;
        end
        else begin
        	cnt <= cnt + 1'b1;
        end
    end
    assign q = cnt;
endmodule
