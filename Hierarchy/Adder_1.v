module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	// wire
    wire [15:0] sum1, sum2;
    wire cout2cin;
    // instance
    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(cout2cin));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(cout2cin), .sum(sum2), .cout());
    
    assign sum = {sum2,sum1};
endmodule
