`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2021 01:16:09 PM
// Design Name: 
// Module Name: DFF
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


module DFF(clk, in, out) ;
  parameter n = 1;  // width
  input clk ;
  input  [n-1:0] in ;
  output [n-1:0] out ;
  reg    [n-1:0] out ;

  always @(posedge clk)
    out = in ;
endmodule
