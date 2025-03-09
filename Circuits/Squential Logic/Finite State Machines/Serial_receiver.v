module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
	localparam idle = 0, start = 1, d1 = 2 ,d2 = 3, d3 = 4, d4 = 5, d5 = 6, d6 = 7, d7 = 8, d8 = 9, stop = 10, err = 11;
    
    reg [3:0] state, next;
    
    always @(posedge clk) begin
        if (reset) state <= idle;
        else state <= next;
    end
    
    always @(*) begin
        case(state)
        	idle: begin
                if (!in) next = start;
                else next = idle;
            end
            start: begin
                next = d1;
            end
            d1: begin
                next = d2;
            end
            d2: begin
                next = d3;
            end
            d3: begin
                next = d4;
            end
            d4: begin
                next = d5;
            end
            d5: begin
                next = d6;
            end
            d6: begin
                next = d7;
            end
            d7: begin
                next = d8;
            end
            d8: begin
                if (in) next = stop;
                else next = err;
            end
            stop: begin
                if (in) next = idle;
                else next = start;
            end
            err: begin
                if (in) next = idle;
                else next =err;
            end
        endcase
    end
    
    assign done = (state == stop);
endmodule
