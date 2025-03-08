module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    localparam A = 0, B =1, C= 2, D = 3, E = 4, F =5;
    reg [2:0] state, next;
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
        
    always @(*) begin
        case(state)
        	A: begin
                if (w) next = A;
                else next = B;
            end
            B: begin
                if (w) next = D;
                else next = C;
            end
            C: begin
                if (w) next = D;
                else next = E;
            end
            D: begin
                if (w) next = A;
                else next = F;
            end
            E: begin
                if (w) next = D;
                else next = E;
            end
            F: begin
                if (w) next = D;
                else next = C;
            end
        endcase
    end
    
    assign z = (state == E) | (state == F);
    
endmodule
