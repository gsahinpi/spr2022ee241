`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:32:43 PM
// Design Name: 
// Module Name: adder4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] s
    );
    wire [3:0] c;
  fa d0(.a(a[0]),
     .b(b[0]),.cin(1'b0),.s(s[0]),
     .cout(c[0])
    ); 
  fa d1(.a(a[1]),
     .b(b[1]),.cin(c[0]),.s(s[1]),
     .cout(c[1])
    );   
     fa d2(.a(a[2]),
     .b(b[2]),.cin(c[1]),.s(s[2]),
     .cout(c[2])
    );   
     fa d3(.a(a[3]),
     .b(b[3]),.cin(c[2]),.s(s[3]),
     .cout(c[3])
    );   
endmodule
