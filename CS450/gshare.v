module top_module(
    input clk, 
    input areset, 

    input  predict_valid, 
    input  [6:0] predict_pc, 
    output predict_taken, 
    output [6:0] predict_history,

    input train_valid, 
    input train_taken, 
    input train_mispredicted, 
    input [6:0] train_history, 
    input [6:0] train_pc 
);

    reg [1:0] pht[127:0];  
    reg [6:0] ghr;
    
    integer i;
    
    assign predict_history = ghr;
    assign predict_taken = pht[predict_pc ^ predict_history][1]; // 1: taken, 0: not taken
    
   
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            
            for (i = 0; i < 128; i = i + 1) begin
                pht[i] <= 2'b01;  /
            end
            ghr <= 7'b0000000;  
        end 
        else begin
            if (train_valid && train_mispredicted) ghr <= {train_history[6:0], train_taken};
            else if (predict_valid) ghr <= {ghr[6:0], predict_taken};
                
                if (train_taken) begin
                    if (pht[train_history ^ train_pc] != 2'b11) pht[train_history ^ train_pc] <= pht[train_history ^ train_pc] + 1;
                end 
            else begin
                    if (pht[train_history ^ train_pc] != 2'b00) 
                        pht[train_history ^ train_pc] <= pht[train_history ^ train_pc] - 1;
                end
            end
    end

endmodule
