module top_module ( );
	reg clk = 0;
    
    always begin
        #5;
    	clk =~clk;
    end
    
    dut uut(.clk(clk));
endmodule
