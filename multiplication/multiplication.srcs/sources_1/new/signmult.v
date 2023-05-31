`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2023 03:34:10 AM
// Design Name: 
// Module Name: signmult
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


module signmult (

 q, // Multiplication Output

 a, // Number a

 b // Number b



 );



input [3:0] a; // 4 bit input

 input [3:0] b; // 4 bit input

 output [7:0] q; // 8 bit output

 reg [7:0] q;



 always @ (a or b)

 begin

 q <= a*b;

 end

 endmodule


