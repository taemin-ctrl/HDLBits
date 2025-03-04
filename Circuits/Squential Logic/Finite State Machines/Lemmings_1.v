module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    localparam LEFT =0, RIGHT = 1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        state = next_state;
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) begin
        	next_state <= 0;
        end
        else begin
            case(state)
                0: begin
                    if (bump_left) next_state <= 1;
                    else next_state <= 0;
                end
                1: begin
                    if (bump_right) next_state <= 0;
                    else next_state <= 1;
                end
            endcase
        end
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
