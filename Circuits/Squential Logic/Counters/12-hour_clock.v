module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

    reg [3:0] cnt_s1 = 0;  
    reg [3:0] cnt_s0 = 0;  
    reg [3:0] cnt_m1 = 0;  
    reg [3:0] cnt_m0 = 0;  
    reg [3:0] cnt_h1 = 0;  
    reg [3:0] cnt_h0 = 0;  
    
    reg pm_flag = 0;        

    always @(posedge clk) begin
        if (reset) begin
            cnt_s1 <= 0;
            cnt_s0 <= 0;
            cnt_m1 <= 0;
            cnt_m0 <= 0;
            cnt_h1 <= 1;
            cnt_h0 <= 2;
            pm_flag <= 0;
        end
        else if (ena) begin
            if (cnt_s0 == 9) begin
                cnt_s0 <= 0;
                if (cnt_s1 == 5) begin
                    cnt_s1 <= 0;
                end else begin
                    cnt_s1 <= cnt_s1 + 1;
                end
            end else begin
                cnt_s0 <= cnt_s0 + 1;
            end

            if (cnt_s0 == 9 && cnt_s1 == 5) begin
                if (cnt_m0 == 9) begin
                    cnt_m0 <= 0;
                    if (cnt_m1 == 5) begin
                        cnt_m1 <= 0;
                    end else begin
                        cnt_m1 <= cnt_m1 + 1;
                    end
                end else begin
                    cnt_m0 <= cnt_m0 + 1;
                end
            end

            if (cnt_m0 == 9 && cnt_m1 == 5 && cnt_s0 == 9 && cnt_s1 == 5) begin
                if (cnt_h1 == 1 && cnt_h0 == 2) begin
                	cnt_h1 <= 0;
                    cnt_h0 <= 1;
                end
                else if (cnt_h0 == 9) begin
                	cnt_h0 <= 0;
                    cnt_h1 <= cnt_h1 + 1'b1;
                end
                else begin
                	cnt_h0 <= cnt_h0 + 1'b1;
                end
                if (cnt_h1 == 1 && cnt_h0 == 1) begin
                	pm_flag = ~pm_flag;
                end
            end
        end
    end

    // Outputs
    assign hh = {cnt_h1, cnt_h0};
    assign mm = {cnt_m1, cnt_m0};
    assign ss = {cnt_s1, cnt_s0};
    assign pm = pm_flag;

endmodule
