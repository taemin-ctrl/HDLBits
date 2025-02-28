module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        state = next_state;
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset) begin
        	next_state <= B;
        end
        
        else begin
            case(state)
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

    // Output logic
    assign out = (state == B);

endmodule
