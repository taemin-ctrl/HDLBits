module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);

    reg [1:0] cnt = 1;
    assign state = cnt;
    
    always @(posedge clk, posedge areset) begin
    
        if (areset) begin
        	cnt <= 1;
        end
        else begin
            case(cnt)
                2'b00: begin
                	if (train_valid & train_taken) cnt <= cnt + 1'b1;
                    else cnt <= cnt;
                end
                2'b01: begin
                    if (train_valid & train_taken) cnt <= cnt + 1'b1;
                    else if (train_valid & ~train_taken) cnt <= cnt - 1'b1;
                    else cnt <= cnt;
                end
                2'b10: begin
                    if (train_valid & train_taken) cnt <= cnt + 1'b1;
                    else if (train_valid & ~train_taken) cnt <= cnt - 1'b1;
                    else cnt <= cnt;
                end
                2'b11: begin
                    if (train_valid & ~train_taken) cnt <= cnt - 1'b1;
                    else cnt <= cnt;
                end
            endcase
        end
    end
endmodule
