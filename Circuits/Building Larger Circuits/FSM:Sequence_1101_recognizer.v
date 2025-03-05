module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 =4;
    reg [2:0] state;
    reg [2:0] next_state;
    
    always @(posedge clk) begin
        if (reset) begin
            next_state <= 0;
        end
        
        else begin
            case(state)
            	s0: begin
                    if (data) next_state <= s1;
                	else next_state <= s0;
                end
                
                s1: begin
                    if (data) next_state <= s2;
                	else next_state <= s0;
                end
                
                s2: begin
                    if (!data) next_state <= s3;
                	else next_state <= s2;
                end
                
                s3: begin
                    if (data) next_state <= s4;
                	else next_state <= s0;
                end
                
            endcase
        end
    end
                 
                    always @(*) begin
                    	state = next_state;
                    end
    
    assign start_shifting = (state == s4);
endmodule
