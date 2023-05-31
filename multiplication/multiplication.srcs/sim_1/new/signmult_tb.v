`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2023 03:39:02 AM
// Design Name: 
// Module Name: signmult_tb
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


module signmult_tb();



 reg [3:0] a,b;

 wire [7:0] q;



signmult m1(q,a,b);



 initial

begin



 a = 4'b0000;

 b = 4'b0000;

 # 10 a = 4'b0110;

 # 10 b = 4'b0100;



 $display("a=%d b=%d q=%d\n", a, b, q);

 end



 endmodule