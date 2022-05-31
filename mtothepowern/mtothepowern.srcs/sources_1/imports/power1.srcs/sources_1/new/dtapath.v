`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2022 12:25:05 PM
// Design Name: 
// Module Name: dtapath
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
`define LoadAM   2'd0//load M to register a for start state 
`define LoadBN   2'd0
`define Loadp1   2'd0

`define  assignPAxP     2'd1
`define  assignBbmin1   2'd1
`define  AssignAtoA   2'd2
`define  AssignBtoB   2'd2
`define  AssignPtoP   2'd2

module dtapath(
    input clk,
    input [1:0] asel,
    input [1:0] bsel,
    input [1:0] psel,
    input [31:0] M,
    input [31:0] N,
    output reg z,
    output reg [31:0] outputproduct
    );
 reg [31:0] nextstateA,nextstateB,nextstateP;
 wire [31:0] currentstateA, currentstateB,currentstateP;   
  DFF #(32)  Astate(.clk(clk),.in(nextstateA) ,.out(currentstateA ) ) ;
  DFF #(32)  Bstate(.clk(clk),.in(nextstateB) ,.out(currentstateB ) ) ;  
  DFF #(32)  Pstate(.clk(clk),.in(nextstateP) ,.out(currentstateP ) ) ;
 ////NEXT STATE LOG?C  START////
  always@(*)
 begin
 case (asel)
 `LoadAM :
    begin
    nextstateA=M;
    end
 
 `AssignAtoA:
 begin
     nextstateA=currentstateA;
    
    end
 default:  nextstateA=32'b0;
 endcase//end case
 end//end always A
 
  always@(*)
 begin
 case (bsel)
 `LoadBN :
    begin
    nextstateB=N;
    end
 
 `assignBbmin1:
 begin
     nextstateB=currentstateB-1;
    
    end
    `AssignBtoB:
 begin
     nextstateB=currentstateB;
    
    end
 default:  nextstateB=32'b1;
 endcase//end case
 end//end always B
  always@(*)
 begin
 case (psel)
 `Loadp1 :
    begin
    nextstateP=1;
    end
 
 `assignPAxP:
 begin
     nextstateP=currentstateA*currentstateP;
    
    end
    `AssignPtoP:
 begin
     nextstateP=currentstateP;
    
    end
 default:  nextstateP=32'b0;
 endcase//end case
 end//end always P
  ////NEXT STATE LOG?C  FINISH////
   ////OUTPUT LOG?C  START////
   always @(*)
   begin
   outputproduct =currentstateP;
    if (currentstateB!=0)
         z=0;
         else
         z=1;
   end
   ////OUTPUT LOG?C  FINISH////
   
   
  
  
endmodule
