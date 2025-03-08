module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, ERR = 7, FLG = 8, DIS = 9;
    reg [3:0] state, next;
    
    always @(posedge clk) begin
        if (reset) state <= s0;
        else state <= next;
    end
    
    always @(*) begin
        case(state)
        	s0: begin
                if (in) next = s1;
                else next = s0;
            end
            s1: begin
                if (in) next = s2;
                else next = s0;
            end
            s2: begin
                if (in) next = s3;
                else next = s0;
            end
            s3: begin
                if (in) next = s4;
                else next = s0;
            end
            s4: begin
                if (in) next = s5;
                else next = s0;
            end
            s5: begin
                if (in) next = s6;
                else next = DIS;
            end
            s6: begin
                if (in) next = ERR;
                else next = FLG;
            end
            ERR: begin
                if (in) next = ERR;
                else next = s0;
            end
            FLG: begin
                if (in) next = s1;
                else next = s0;
            end
            DIS: begin
                if (in) next = s1;
                else next = s0;
            end
        endcase
    end
    
    assign err = state == ERR;
    assign flag = state == FLG;
    assign disc = state == DIS;
endmodule
