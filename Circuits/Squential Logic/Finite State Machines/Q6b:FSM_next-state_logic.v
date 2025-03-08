module top_module (
    input [3:1] y,
    input w,
    output Y2);

    reg [3:1] Y;
    
    always @(*) begin
        case(y)
            3'b000: begin
                if (w) Y = 3'b000;
                else Y = 3'b001;
            end
            3'b001: begin
                if (w) Y = 3'b011;
                else Y = 3'b010;
            end
            3'b010: begin
                if (w) Y = 3'b011;
                else Y = 3'b100;
            end
            3'b011: begin
                if (w) Y = 3'b000;
                else Y = 3'b101;
            end
            3'b100: begin
                if (w) Y = 3'b011;
                else Y = 3'b100;
            end
            3'b101: begin
                if (w) Y = 3'b011;
                else Y = 3'b010;
            end
        endcase
    end
    
    assign Y2 = Y[2];
endmodule
