module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    reg [3:0] cnt = 0;
    always @(posedge clk) begin
        if(reset) begin
         	cnt <= 0;
        end
        else if (cnt == 4'd9 & slowena) begin
        	cnt <= 0;
        end
        else if (slowena) begin
        	cnt <= cnt +1'b1;
       	end
    end
    assign q = cnt;
endmodule
