module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    reg [2:0] Y;
    
    always @(*) begin
        case(y)
        	3'b000: begin
                if (x) Y = 3'b001;
                else Y = 3'b000;
            end
            3'b001: begin
                if (x) Y = 3'b100;
                else Y = 3'b001;
            end
            3'b010: begin
                if (x) Y = 3'b001;
                else Y = 3'b010;
            end
            3'b011: begin
                if (x) Y = 3'b010;
                else Y = 3'b001;
            end
            3'b100: begin
                if (x) Y = 3'b100;
                else Y = 3'b011;
            end
        endcase
    end
    
    assign Y0 = Y[0];
    assign z = (y == 3'b011) | (y == 3'b100);
endmodule
