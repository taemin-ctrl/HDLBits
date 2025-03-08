module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    localparam A =0, B =1, C =2;
    reg [1:0] state, next;
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= 0;
        else state <= next;
    end
    
    always @(*) begin
        case(state)
        	A: begin
                if (x) next = B;
                else next = A;
            end
            B: begin
                if (x) next = C;
                else next = B;
            end
            C: begin
                if (x) next = C;
                else next = B;
            end
        endcase
    end
    
    assign z =(state == B);
endmodule
