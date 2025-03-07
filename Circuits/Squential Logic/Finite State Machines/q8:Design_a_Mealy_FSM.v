module top_module (
	input clk,
	input aresetn,
	input x,
	output reg z
);

	localparam S=0, S1=1, S10=2;
	reg[1:0] state, next;		
	
	always@(posedge clk, negedge aresetn)
		if (!aresetn)
			state <= S;
		else
			state <= next;

	always@(*) begin
		case (state)
			S: next = x ? S1 : S;
			S1: next = x ? S1 : S10;
			S10: next = x ? S1 : S;
		endcase
	end
	
    always@(*) begin
		case (state)
			S: z = 0;
			S1: z = 0;
			S10: z = x;	
		endcase
	end
	
endmodule
