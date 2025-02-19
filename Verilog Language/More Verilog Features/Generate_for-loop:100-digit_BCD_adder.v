module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [99:0] cin2cout;
    
    genvar i;
    generate
        for (i=0; i < 100; i = i+1) begin : sol
            if (i==0)
            bcd_fadd inst(
                .a(a[4*i +3: 4*i]),
                .b(b[4*i +3 :4*i]),
                .cin(cin),
                .cout(cin2cout[i]),
                .sum(sum[4*i +3 : 4*i])
            ); 
            else if (i == 99)
                bcd_fadd inst(
                .a(a[4*i +3: 4*i]),
                .b(b[4*i +3 :4*i]),
                    .cin(cin2cout[i-1]),
                    .cout(cout),
                .sum(sum[4*i +3 : 4*i])
            ); 
            else
                bcd_fadd inst(
                    .a(a[4*i+3 : 4*i]),
                    .b(b[4*i+3: 4*i]),
                    .cin(cin2cout[i-1]),
                    .cout(cin2cout[i]),
                    .sum(sum[4*i+3:4*i])
            ); 
        end
    endgenerate
endmodule
