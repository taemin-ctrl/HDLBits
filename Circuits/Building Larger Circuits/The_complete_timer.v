module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    localparam IDLE = 0, s1 = 1, s11 = 2, s110 = 3, s1101=4, shift1 = 5,shift2 =6, shift3 =7, WAIT= 8, DONE = 9;
    
    reg [3:0] state, next;
    reg [9:0] cnt_1000;
    reg [3:0] delay;

    always @(posedge clk) begin
        if (reset) begin
        	state <= IDLE;
        end
        else begin
        	state <= next;
        end
    end

    always @(*) begin
        case(state)
        	IDLE: begin
                if (data) next = s1;
                else next = IDLE;
            end
            s1: begin
                if (data) next = s11;
                else next = IDLE;
            end
            s11: begin
                if (data) next = s11;
                else next = s110;
            end
            s110: begin
                if (data) next = s1101;
                else next = IDLE;
            end
            s1101: begin
                next = shift1;
            end
            shift1: begin
                next = shift2;
            end
            shift2: begin
                next = shift3;
            end
            shift3: begin
                next = WAIT;
            end
            WAIT: begin
                if (delay == 0 & cnt_1000 == 999) next = DONE;
                else next = WAIT;
            end
            DONE: begin
                if (ack) next = IDLE;
                else next = DONE;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            delay <= 0;
            cnt_1000 <= 0;
        end
        else begin
            case(state)
                s1101: delay[3] <= data;
                shift1: delay[2] <= data;
                shift2: delay[1] <= data;
                shift3: delay[0] <= data;
                WAIT: begin
                    if (cnt_1000 >= 999) begin
                    	delay <= delay -1;
                        cnt_1000 <= 0;
                    end
                    else begin
                    	cnt_1000 <= cnt_1000 +1;
                    end
                end
                default: cnt_1000 <= 0;
            endcase
        end
    end
    
    assign count = delay;
    assign counting = (state == WAIT);
    assign done = (state == DONE);
endmodule
