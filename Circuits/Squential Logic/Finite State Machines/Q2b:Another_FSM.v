module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    reg [3:0] state, next;
    localparam A = 0, F = 1, t0 = 2, s1 =3, s10 = 4, Y = 5, t1 = 6, t2= 7, fin =8;
    
    always @(posedge clk) begin
        if (!resetn) state <= 0;
        else state <= next;
    end
    
    always @(*) begin
        case(state)
            A: begin
                g = 0;
                if (resetn) next = F;
            end
            F: begin
               next = t0;  
            end
            t0: begin
                if (x) next= s1;
                else next =t0;
            end
            s1: begin
                if (~x) next = s10;
                else next = s1;
            end
            s10: begin
                if (x) next = t1;
                else next = t0;
            end
            t1: begin
                g = 1;
                if (y) next = Y;
                else next = t2;
            end
            t2: begin
                g = 1;
                if (y) next =Y;
                else next = fin;
            end
            fin: begin
                g = 0;
                if (~resetn) next = A;
                else next = fin;
            end
            Y: begin
                 g = 1;
                if (~resetn) next = A;
                else next = Y;
            end
        endcase
    end
    
    assign f = (state == F);
    
endmodule
