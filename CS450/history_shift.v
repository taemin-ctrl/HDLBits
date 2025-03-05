module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
    reg [31:0] his;
    
    assign predict_history = his;
 
    always @(posedge clk, posedge areset) begin
        if (areset) begin
        	his <= 0;
        end
        else begin
            if (train_mispredicted) begin
                his <= {train_history[30:0],train_taken};
            end
            else if (predict_valid) begin
                his <= {his[30:0], predict_taken};
            end
        end
    end
endmodule
