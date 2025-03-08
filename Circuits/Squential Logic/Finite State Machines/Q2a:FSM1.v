module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);

    localparam A = 0, B =1, C= 2, D = 3, E = 4, F =5;
    reg [2:0] state, next;
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
        
    always @(*) begin
        case(state)
        	A: begin
                if (w) next = B;
                else next = A;
            end
            B: begin
                if (w) next = C;
                else next = D;
            end
            C: begin
                if (w) next = E;
                else next = D;
            end
            D: begin
                if (w) next = F;
                else next = A;
            end
            E: begin
                if (w) next = E;
                else next = D;
            end
            F: begin
                if (w) next = C;
                else next = D;
            end
        endcase
    end
    
    assign z = (state == E) | (state == F);
endmodule
