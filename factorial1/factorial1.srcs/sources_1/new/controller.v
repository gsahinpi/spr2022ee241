`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2021 10:08:13 PM
// Design Name: 
// Module Name: controller
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

`define SWIDTH 3
`define Start  2'b000
`define Loop   2'b001
`define Done   2'b010
`define Loada1   2'd2
`define LoadbN   2'd0
`define  Multiplya   2'd1
`define  Subtract1   2'd1
`define  AssignAtoA   2'd0
`define  AssignBtoB   2'd2

module controller(input clk, input [31:0]N,output reg [31:0] outfact

    );
  reg [1:0]wasel;
  reg [1:0]wbsel;
 reg [1:0]next ;
 wire  z;
 wire [1:0]nextval;  
 DFF #(2) state(clk,next ,nextval  ) ; 
 datapath data(clk,wasel,wbsel,N,z,fact);
 
 always @(*)
  
    begin
    outfact=fact;
    case (nextval)
    `Start:
        begin
          next=`Loop;
          wasel=`Loada1;
          wbsel=`LoadbN;
         
         end 
          
    
    `Loop:
            begin
          next=z?`Done:`Loop;
          wasel=`Multiplya;
          wbsel=`Subtract1; 
         
            end
    
    
    `Done: 
           begin
            next=`Done;
            wasel=`AssignAtoA;
            wbsel=`AssignBtoB;
           
            end 
     default: next= `Start;      
    endcase  
    
    end

      
    
    
endmodule
