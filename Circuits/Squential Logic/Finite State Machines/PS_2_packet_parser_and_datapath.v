module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    localparam b1 = 0, b2 = 1, b3 = 2, d =3;
    reg [1:0] state, next;
    reg [23:0] rout;
    
    assign out_bytes = rout;
    
    // FSM from fsm_ps2
    always @(*) begin
    	state = next;
    end
    
    always @(posedge clk) begin
        if (reset) begin
        	next <= b1;
        end
        else begin
            case(state)
                b1: begin
                    if (in[3]) next <= b2;
                    else next <= b1;
                end
                b2: begin
                    next <= b3;
                end
                b3: begin
                    next <= d;
                end
                d: begin
                    if (in[3]) next <= b2;
                    else next <= b1;
                end
            endcase
        end
    end
    
    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
        if (reset) begin
        	rout <= 0;
        end
        else begin
            rout <= {rout[15:8],rout[7:0],in};
        end
    end
    
    assign done = (state == d);
endmodule
