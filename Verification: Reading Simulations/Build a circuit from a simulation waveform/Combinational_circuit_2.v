module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//
    
    wire [2:0] cnt;
    
    assign cnt = a+ b +c +d;
    assign q = cnt ==0 | cnt == 2 | cnt == 4; // Fix me

endmodule
