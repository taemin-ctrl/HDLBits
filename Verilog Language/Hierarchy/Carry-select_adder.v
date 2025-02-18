module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    // wires
    wire [15:0] sum1, sum2, sum3, xsum;
    wire sel;
    // instances
    add16 inst1( .a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(sel) );
    add16 inst2( .a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum2), .cout() );
    add16 inst3( .a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum3), .cout() );
    
    // mux
    assign xsum = sel ? sum3 : sum2;
    // assign
    assign sum ={xsum,sum1};
endmodule
