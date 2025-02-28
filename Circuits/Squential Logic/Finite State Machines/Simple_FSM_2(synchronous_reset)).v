module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        state = next_state;
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if (reset) begin
            next_state <= OFF;
        end
        else begin
            case(state) 
            	ON: begin
                    if (k) next_state <= OFF;
                    else next_state <= ON;
                end
                
                OFF: begin
                    if (j) next_state <= ON;
                    else next_state <= OFF;
                end
            endcase
        end
    end

    // Output logic
    assign out = (state == ON);

endmodule
