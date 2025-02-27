module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] pre = 0;
    
    always @(posedge clk) begin
        pre <= in; 
        
        if (reset) begin
        	out <= 0;
        end
        
        else begin
            out <= out  | (pre & ~in);   
        end

    end
endmodule
