module top_module (
    input clk,
    input j,
    input k,
    output Q); 
	
    reg q;
    
    always @(posedge clk) begin
        if (j & k) begin
            Q <= ~q;
            q <= ~q;
        end
        else if (j) begin
            Q <= 1;
            q <= 1;
        end
        else if (k) begin
            Q <= 0;
            q <= 0;
        end
        else
            Q <= q;
    end
endmodule
