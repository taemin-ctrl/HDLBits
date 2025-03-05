module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    reg [3:0] cnt;
    
    always @(posedge clk) begin
        if (a) begin
        	cnt <= 4;
        end
        else begin
            if (cnt == 6) cnt <= 0;
            else cnt <= cnt + 1'b1;
        end
    end
    
    assign q = cnt;
endmodule
