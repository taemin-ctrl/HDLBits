module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	// wires
    wire and1, and2;
    wire or2out;
    // assign
    assign and1 = a & b;
    assign and2 = c & d;
    
    assign or2out = and1 | and2;
    
    assign out = or2out;
    assign out_n = ~or2out;
endmodule
