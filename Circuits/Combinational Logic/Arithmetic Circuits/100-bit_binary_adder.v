module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	
    wire [98:0] cin2cout;
    
    genvar i;
    generate
        for (i=0; i<100; i = i+1) begin : sol
            if (i==0)
                adder inst(.a(a[i]), .b(b[i]), .cin(cin),.cout(cin2cout[0]), .sum(sum[i]));
            else if (i==99)
                adder inst(.a(a[i]), .b(b[i]), .cin(cin2cout[i-1]),.cout(cout), .sum(sum[i]));
            else
                adder inst(.a(a[i]), .b(b[i]), .cin(cin2cout[i-1]),.cout(cin2cout[i]), .sum(sum[i]));
        end
    endgenerate
endmodule
        
module adder(input a, b, cin, output cout, sum);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule   
