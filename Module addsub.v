module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    //wires
    wire [31:0] bxor;
    wire [15:0] sum1, sum2;
    wire cout2cin;
	// instance
    add16 inst1( .a(a[15:0]), .b(bxor[15:0]), .cin(sub), .sum(sum1), .cout(cout2cin) );
    add16 inst2( .a(a[31:16]), .b(bxor[31:16]), .cin(cout2cin), .sum(sum2), .cout() );
    
    // assign
    assign bxor = {32{sub}} ^ b;
    assign sum = {sum2,sum1};
endmodule
