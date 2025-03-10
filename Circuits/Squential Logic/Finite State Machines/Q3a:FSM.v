module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
	parameter A = 0, B = 1;

 	reg state, next;
    reg [1:0] sum, cnt;

    always @(*) begin
  		case(state)
   			A : begin 
                if (s) next = B;
                else next = A;
            end
   			B : begin 
                next = B;
            end
  		endcase
 	end

 	always @(posedge clk) begin
  		if (reset) begin
   			state <= A;
            sum = 0;
            cnt = 0;
  		end
  		else begin 
      		state <= next;
        
            if (state==B) begin
                cnt=cnt+1;
                
                if (cnt==3) begin
                    sum = 0;
                    cnt = 0;
                end
                if(w==1) sum <= sum+1;
            end
    	end
 	end    

    assign z = ((sum == 2) & (cnt == 3) );
endmodule
