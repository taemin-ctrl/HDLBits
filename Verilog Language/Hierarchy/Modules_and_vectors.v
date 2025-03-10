module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    // wire
    wire [7:0] q1, q2, q3;
    
    // instance
    my_dff8 inst1(.clk(clk), .d(d), .q(q1));
    my_dff8 inst2(.clk(clk), .d(q1), .q(q2));
    my_dff8 inst3(.clk(clk), .d(q2), .q(q3));
    
    // mux
    assign q = (sel == 2'b00) ? d : 
        (sel == 2'b01) ? q1:
        (sel == 2'b10) ? q2: q3;
endmodule
