module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // wires
    wire [7:0] ab, bc;
    
    // assign
    assign ab = a > b ? b : a;
    assign bc = ab > c ? c : ab;
    assign min = bc > d ? d : bc; 
	
endmodule
