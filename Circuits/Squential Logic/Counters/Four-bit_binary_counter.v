module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    reg [3:0] cnt = 0;
    always @(posedge clk) begin
        if (reset)
            cnt <= 0;
        else begin
        	cnt <= cnt + 1'b1;
        end
    end
    assign q = cnt;
endmodule
