`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:45:04 PM
// Design Name: 
// Module Name: full4tb
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


module full4tb;
reg [3:0] a,b;
wire [3:0]s;
adder4 dut(
    .a(a),
  .b(b),
    .s(s)
    );
   initial
   begin
   a=4'd0; b=4'd0;
   #10 a=4'd8; b=4'd7;
   #10  a=4'd8; b=4'd8;
   #10 a=4'd9; b=4'd9;
   end
endmodule
