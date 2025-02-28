module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF m1(.clk(KEY[0]), .w(LEDR[1]), .e(KEY[1]), .r(SW[0]), .l(KEY[2]), .q(LEDR[0]));
    MUXDFF m2(.clk(KEY[0]), .w(LEDR[2]), .e(KEY[1]), .r(SW[1]), .l(KEY[2]), .q(LEDR[1]));
    MUXDFF m3(.clk(KEY[0]), .w(LEDR[3]), .e(KEY[1]), .r(SW[2]), .l(KEY[2]), .q(LEDR[2]));
    MUXDFF m4(.clk(KEY[0]), .w(KEY[3]), .e(KEY[1]), .r(SW[3]), .l(KEY[2]), .q(LEDR[3]));
endmodule

module MUXDFF (
	input clk,
    input w, e,r,l,
    output q
);
	reg d;
    wire mux;
    always @(posedge clk) begin
 		d <= mux;
    end
    
    assign mux = l ? r : (e ? w : q);
    assign q = d;
endmodule
