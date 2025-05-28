module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
	localparam s1 = 0, s12 = 2'b01, s23 = 2'b10, s3 = 2'b11;
    reg [1:0] state, next;
    reg r_dfr;
    
    assign dfr = r_dfr;
    
    assign fr3 = state == s1;
    assign fr2 = state == s12 | state == s1;
    assign fr1 = state == s1 | state == s12 | state == s23;
    
    always @(*) begin
    	state = next;
    end
    
    always @(posedge clk) begin
        if (reset) begin
	    next <= 0;
            r_dfr <= 1;
        end
        else begin
            case(state)
            	s1: begin
                    if (s[1]) begin
                        r_dfr <= 0;
                    	next <= s12;
                    end
                end
                s12: begin
                    if (s[2:1] == 2'b11 ) begin
                        r_dfr <= 0;
                    	next <= s23;
                    end
                    else if (!s[1]) begin
                        r_dfr <= 1;
                    	next <= s1;
                    end
                end
                s23: begin
                    if (s[3:1] == 3'b111) begin
                    	r_dfr <= 0;
                        next <= s3;
                    end
                    else if (s[2:1] != 2'b11) begin
                        r_dfr <= 1;
                    	next <= s12;
                    end
                end
                s3: begin
                    if (!s[3]) begin
                    	next <= s23;
                        r_dfr <= 1;
                    end
                end
            endcase
        end
    end
endmodule
