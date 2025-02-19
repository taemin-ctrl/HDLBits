module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    generate
        for (i =0; i <100; i = i +1) begin :sol
            if (i == 0)
            adder inst(
                .a(a[i]),
                .b(b[i]),
                .cin(cin),
                .cout(cout[i]),
                .sum(sum[i])
            );
            else 
                adder inst(
                .a(a[i]),
                .b(b[i]),
                    .cin(cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate
endmodule

module adder(input a, b, cin,
             output cout, sum);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
