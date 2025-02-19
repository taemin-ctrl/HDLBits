module top_module (input x, input y, output z);
    A(x,y,z);
endmodule

module A(input x, input y, output z);
	assign z = (x ^ y) & x;
endmodule
