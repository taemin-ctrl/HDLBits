module top_module (
    input [15:0] a,        
    input [15:0] b,        
    input cin,             
    output [15:0] sum,     
    output cout            
);
    wire [3:0] cin2cout;

    bcd_fadd u0 (
        .a(a[3:0]),          
        .b(b[3:0]),          
        .cin(cin),           
        .cout(cin2cout[0]),  
        .sum(sum[3:0])       
    );

    bcd_fadd u1 (
        .a(a[7:4]),          
        .b(b[7:4]),          
        .cin(cin2cout[0]),   
        .cout(cin2cout[1]),  
        .sum(sum[7:4])       
    );

    bcd_fadd u2 (
        .a(a[11:8]),         
        .b(b[11:8]),         
        .cin(cin2cout[1]),   
        .cout(cin2cout[2]),  
        .sum(sum[11:8])      
    );

    bcd_fadd u3 (
        .a(a[15:12]),        
        .b(b[15:12]),        
        .cin(cin2cout[2]),   
        .cout(cout),         
        .sum(sum[15:12])     
    );

endmodule
