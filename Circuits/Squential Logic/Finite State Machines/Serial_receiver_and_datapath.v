module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
	localparam idle = 0, start = 1, d1 = 2 ,d2 = 3, d3 = 4, d4 = 5, d5 = 6, d6 = 7, d7 = 8, d8 = 9, stop = 10, err = 11;
    
    reg [3:0] state, next;
    reg [7:0] r_out_byte;
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
    
    always @(posedge clk) begin
        case(state)
            idle: r_out_byte <= 0;
            start: r_out_byte[0] <= in;
            d1: r_out_byte[1] <= in;
            d2: r_out_byte[2] <= in;
            d3: r_out_byte[3] <= in;
            d4: r_out_byte[4] <= in;
            d5: r_out_byte[5] <= in;
            d6: r_out_byte[6] <= in;
            d7: r_out_byte[7] <= in;
        endcase
    end
    
    assign done = (state == stop);
    assign out_byte = (state == stop) ? r_out_byte : 8'b00000000;
endmodule
