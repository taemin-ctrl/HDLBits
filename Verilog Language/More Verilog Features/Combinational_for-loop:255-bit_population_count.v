module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    reg [7:0] cnt;
    integer i;
    
    always @(*) begin
        cnt = 0;
    	for (i=0; i < 255; i = i + 1) begin
            if (in[i]) begin
            	cnt = cnt + 1;
            end
        end
    end
    
    assign out = cnt;
endmodule
