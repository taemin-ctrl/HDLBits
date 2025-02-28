module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] r;
    
    always @(posedge clk) begin
        if (!resetn) begin
        	r <= 0;
        end
        else begin
            r[0] <= in;
            r[1] <= r[0];
            r[2] <= r[1];
            r[3] <= r[2];
        end
    end
    assign out = r[3];
endmodule
