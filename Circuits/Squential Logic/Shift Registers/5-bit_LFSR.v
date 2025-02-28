module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    reg [4:0] f;
    always @(posedge clk) begin
        if (reset) begin
        	f <= 1;
        end
        else begin
            f[0] <= q [1];
            f[1] <= q[2];
            f[2] <= q[3] ^ q[0];
            f[3] <= q[4];
            f[4] <= 0 ^ q[0];
        end
    end
    assign q = f;
endmodule
