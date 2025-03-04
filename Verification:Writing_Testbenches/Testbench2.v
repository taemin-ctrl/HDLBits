module top_module();
	reg clk =0;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 q(
        .clk(clk), .in(in), .s(s), .out(out)
    );
    
    always begin
    	#5;
        clk = ~clk;
    end
    
    initial begin
    	s = 2;
        in = 0;
        #10;
        s = 6;
        #10; 
        s = 2;
        in = 1;
        #10;
        in = 0;
        s = 7;
        #10;
        s = 0;
        in =1;
        #30;
        in = 0;
    end
endmodule
