module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	
    wire [2:0] cin2cout;
    genvar i;
    generate
        for(i=0; i < 4; i = i + 1) begin :sol
            if(i==0) 
                FA inst(.a(x[i]), .b(y[i]), .cin(0), .sum(sum[i]), .cout(cin2cout[i]));
            else if (i == 3)
                FA inst(.a(x[i]), .b(y[i]), .cin(cin2cout[i-1]), .sum(sum[i]), .cout(cin2cout[sum[4]]));
            else
                FA inst(.a(x[i]), .b(y[i]), .cin(cin2cout[i-1]), .sum(sum[i]), .cout(cin2cout[i]));
        end
    endgenerate
endmodule

module FA(
    input a, b, cin,
    output sum, cout);
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin); 
endmodule
