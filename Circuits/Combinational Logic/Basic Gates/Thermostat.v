module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = (mode == 1 & too_cold) ? 1:0;
    assign aircon = (mode == 0 & too_hot) ? 1:0;
    assign fan = heater | aircon | fan_on ? 1:0;
endmodule
