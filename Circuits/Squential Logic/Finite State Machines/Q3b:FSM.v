module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [2:0] state, next;
    
    always @(posedge clk) begin
        if (reset) state <= 0;
        else state <= next;
    end
    
    always @(*) begin
        case(state)
        	3'b000: begin
                if (x) next = 3'b001;
                else next = 3'b000;
            end
            3'b001: begin
                if (x) next = 3'b100;
                else next = 3'b001;
            end
            3'b010: begin
                if (x) next = 3'b001;
                else next = 3'b010;
            end
            3'b011: begin
                if (x) next = 3'b010;
                else next = 3'b001;
            end
            3'b100: begin
                if (x) next = 3'b100;
                else next = 3'b011;
            end
        endcase
    end
    
    assign z = (state == 3'b011) | (state == 3'b100);
endmodule
