`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2021 02:24:39 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input clk,input [31:0]N,input [1:0]wasel
,input [1:0]wbsel,output z, output[31:0] Aout,output[31:0] Bout   );
wire [31:0] Aval;
wire [31:0] Bval;
reg [31:0] Anext;
reg [31:0] Bnext;

  DFF #(32) Astate(clk, Anext, Aval) ;
  DFF #(32) Bstate(clk, Bnext, Bval) ;
  ///next state logic
 always@(*)
 begin
 case (wasel)
 0:
    begin
    Anext=Aval;
    end
 
 1: begin
     Anext=Aval*Bval;
    
    end
 2:
 begin
     Anext=32'b1;
    
    end
 default: Anext=32'b0;
 endcase//end case
 
 
 end//end always A
  
  
always@(*)
 begin
 case (wbsel)
 0:
    begin
    Bnext=N;
    end
 
 1: begin
     Bnext=Bval-1;
    
    end
 2:
 begin
     Bnext=Bval;
    
    end
 default: Bnext=32'b0;
 endcase//end case
 
 
 end//endalways B
    
  
 //outputlogic

 assign z=~(|Bval); 
  
 assign Aout=Anext;
 assign Bout=Bnext; 
  
  
  
  
  
  
  
  
  
  
endmodule
