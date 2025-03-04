module top_module ();
	reg clk = 0;
    reg reset = 0;
    reg  t = 0;
    wire q;
    
    tff uut(
        .clk(clk), .reset(reset), .t(t), .q(q)
    );
    
    always begin
        #5;
    	clk = ~clk;
    end
    
    initial begin
        #5
        reset = 1;
        #5;
        reset = 0;
        #5;
    	t = 1;
        #5;
        t = 0;
    end
endmodule
