module top_module();
    reg [1:0] in = 0;
    wire out;
    
    andgate uut(.in(in), .out(out));
    
    initial begin
        #10;
        in[0] = 1;
        #10;
        in[1] = 1;
        in[0] = 0;
        #10;
        in[0] = 1;
    end
endmodule
