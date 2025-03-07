module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    localparam A=0, B=1, C=2, D=3;
    
    reg [1:0] state, next;
    
    always @(posedge clk) begin
        if (!resetn) begin
        	state <= A;
        end
        else begin
        	state <= next;
        end
    end
    
    always @(*) begin
        case(state)
        	A: begin
                if (r[1]) next = B;
                else if ((~r[1]) & r[2]) next = C;
                else if ((~r[1]) & (~r[2]) & (r[3])) next = D;
                else if ((~r[1]) & (~r[2]) & (~r[3])) next = A;
            end
            B: begin
                next = r[1] ? B : A;
            end
            C: begin
                next = r[2] ? C : A;
            end
            D: begin
                next = r[3] ? D : A;
            end
        endcase
    end
    
    assign g[1] = (state == B);
    assign g[2] = (state == C);
    assign g[3] = (state == D);
endmodule
