module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (~b & ~c) | (~a & ~d) | (c & d & a) | (c & d & ~a & b);
endmodule
