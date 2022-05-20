`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2021 06:24:17 PM
// Design Name: 
// Module Name: datapath
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


module datapath(input clk, input  [1:0] wasel,input  [1:0] wbsel, input [31:0] N, 
output  z, output  [31:0]   factorial

    );
  parameter n=32 ; 
 wire [32-1:0] Aval;
  wire [32-1:0] Bval;
  reg  [n-1:0] next_A,next_B ;
  DFF #(n) A_register(clk, next_A,  Aval) ;
  DFF #(n) B_register(clk, next_B,  Bval) ;
//next state logic for reg A
 always@(*) begin
   case (wasel)
        0:next_A=Aval;
        1:next_A=Aval*Bval;
        2:next_A=32'd1;
        default: next_A=32'd0;
   endcase
  end  
   
    always@(*) begin
   case (wbsel)
        0:next_B=N;
        1:next_B=Bval-1;
        2:next_B=Bval;
        default: next_B=32'd0;
   endcase
  end
  //output logic 
  assign z=  ~(|Bval) ? 1 : 0 ;
 assign factorial=next_A;
endmodule
