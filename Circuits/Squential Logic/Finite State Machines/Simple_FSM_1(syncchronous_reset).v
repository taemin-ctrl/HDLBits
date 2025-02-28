// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  

    // Fill in state name declarations
	localparam A = 0, B = 1;  
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            next_state <= B;
        end 
        
        else begin
            case (present_state)
                // Fill in state transition logic
                A: begin
                    if (!in) begin
                    	next_state <= B;
                    end
                    else begin
                    	next_state <= A;
                    end
                end
                
                B: begin
                	if (!in) begin
                    	next_state <= A;
                    end
                    else begin
                    	next_state <= B;
                    end
                end
            endcase
        end
    end
     
    always @(*)
        present_state = next_state;
    
    assign out = (present_state == 1);
endmodule
