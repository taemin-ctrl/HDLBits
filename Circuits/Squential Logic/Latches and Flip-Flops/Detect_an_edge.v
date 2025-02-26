module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] prev = 0;
    always @(posedge clk) begin
  		pedge <= (~prev & in);  
        prev <= in;  
    end
endmodule
