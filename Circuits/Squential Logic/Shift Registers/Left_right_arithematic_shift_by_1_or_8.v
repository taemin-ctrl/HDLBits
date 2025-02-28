module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @(posedge clk) begin
        if (load) begin
        	q <= data;
        end
        else begin
            if (ena) begin
                case(amount)
                    2'b00: q <= (q << 1);
                    2'b01: q <= (q << 8);
                    2'b10: q <= {q[63],q[63:1]};
                    2'b11: if (q[63]) q <= {q[63],7'b1111111 ,q[63:8]}; else q <= (q >> 8);
                endcase
            end
        end
    end
endmodule 
