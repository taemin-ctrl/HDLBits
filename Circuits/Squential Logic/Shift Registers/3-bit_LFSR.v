module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg [2:0] q;
    
    always @(posedge KEY[0]) begin
        if (KEY[1]) begin
            q <= SW;
        end
        else begin
            q[0] <= q[2];
            q[1] <= q[0];
            q[2] <= q[1] ^ q[2];
        end
    end
    
    assign LEDR = q; 
endmodule
