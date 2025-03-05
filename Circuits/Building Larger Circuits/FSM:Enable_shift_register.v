module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [1:0] cnt;
    reg shift;
    
    always @(posedge clk) begin
        if (reset) begin
        	cnt <= 0;
            shift <= 1;
        end
        else begin
            if (cnt >= 3) begin
            	cnt <= cnt;
                shift <= 0;
            end
            else begin
                shift <= 1;
            	cnt <= cnt +1'b1;
            end
        end
    end
    
    assign shift_ena = shift;
endmodule
