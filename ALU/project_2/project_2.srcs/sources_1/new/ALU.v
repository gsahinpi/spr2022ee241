`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2022 02:32:18 PM
// Design Name: 
// Module Name: ALU
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
`define  ADD 5'b00000
`define  SUB 5'b00001
`define  MULL 5'b00010
`define  SHL 5'b00011
`define  SHR 5'b00100
`define  BAND 5'b00101
`define  BOR 5'b00110
`define  BXOR 5'b00111
`define  AND  5'b01000
`define  OR   5'b01001
`define  EQ   5'b01010
`define  NE   5'b01011
`define  GE   5'b01100
`define  LE   5'b01101
`define  GT   5'b01110
`define  LT   5'b01111
`define  NEG  5'b10000
`define  NOT  5'b10001
`define  BNOT 5'b10010
module ALU(a,b,f,s

    );
    input [15:0] a,b;
    input [4:0] f;
    output [15:0] s;
    reg [15:0] s;
    wire [15:0] x,y;
    assign x=a+16'h8000;
    assign y=b+16'h8000;
    always@(a or b or x or y or f)
      
    begin
    case (f)
    `ADD:s=a+b;
    `SUB : s=a-b;
    `MULL:s=a*b;
     `SHL : s=b<<a;
     `SHR: s=b>>a; 
     `BAND:s=b&a;
      `BOR :s=b|a;
      `BXOR:s=b^a;
       `AND:s=b&&a;  
       `OR  : s=a||b;
       `EQ  :s=(a==b); 
       `NE  : s=(a!=b);
       `GE  : s=y>=x;
       `LE  :s=y<=x;
       `GT :s=y>x;  
`LT:s=y<x;   
`NEG :s=-a; 
`BNOT :s=~a; 
`NOT :s=!a;
default: s=16'hxxxx;
endcase
    end
    
    
endmodule
