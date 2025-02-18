module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	// wires
    wire tri_and1, tri_and2;
    wire two_and1, two_and2;
    
    // assign
    assign tri_and1 = p1a & p1c & p1b;
    assign tri_and2 = p1f & p1e & p1d;
    
    assign two_and1 = p2a & p2b;
    assign two_and2 = p2c & p2d;
    
    assign p1y = tri_and1 | tri_and2;
    assign p2y = two_and1 | two_and2; 

endmodule
