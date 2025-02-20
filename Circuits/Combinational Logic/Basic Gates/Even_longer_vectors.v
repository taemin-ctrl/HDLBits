module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
	
    genvar i;
    generate
        for (i=0; i<99; i = i + 1) begin : sol
            assign out_both[i] = in[i+1] & in[i];
            assign out_any[i+1]= in[i+1] | in[i];
            assign out_different[i]= in[i+1] ^ in[i];
        end
    endgenerate
    assign out_different[99] = in[99] ^ in[0]; 
endmodule
