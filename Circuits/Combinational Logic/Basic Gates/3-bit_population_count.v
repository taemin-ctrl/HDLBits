module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    reg [1:0] cnt;
    integer i;
    
    always @ (*) begin
    	cnt = 0;
        for (i=0; i <3; i = i + 1) begin
            if (in[i])
                cnt = cnt + 1'b1;
        end
    end
    
    assign  out = cnt;
endmodule
