module top_module (input x, input y, output z);
    // wires
    wire wire_or, wire_and;
    wire a1, a2, b1, b2;
    // instances
    A IA1(.x(x), .y(y), .z(a1));
    A IA2(.x(x), .y(y), .z(a2));
    B IB1(.x(x), .y(y), .z(b1));
    B IB2(.x(x), .y(y), .z(b2));
    
    // assign 
    assign wire_or = a1 | b1;
    assign wire_and = a2 & b2;
    assign z = wire_or ^ wire_and;
endmodule

module A (input x, input y, output z);
	assign z = (x ^ y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule
