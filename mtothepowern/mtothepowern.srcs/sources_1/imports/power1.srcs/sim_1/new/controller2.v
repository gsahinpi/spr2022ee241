`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 02:14:27 PM
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
`define SWIDTH 3 //width 
`define Start  2'b00//start state
`define Loop   2'b01//loop state
`define Done   2'b10 //done state
//datapath operations
`define LoadAM   2'd0//load M to register a for start state 
`define LoadBN   2'd0
`define Loadp1   2'd0

`define  assignPAxB     2'd1
`define  assignBbmin1   2'd1
`define  AssignAtoA   2'd2
`define  AssignBtoB   2'd2
`define  AssignPtoP   2'd2
module controller2(
    input clk,
    input [31:0] m,
    input [31:0] n,
    //input inz,
    output reg [31:0] result,
    output reg[1:0] wpselect,
    output reg[1:0] waselect,
    output reg[1:0] wbselect
    );
reg [2-1:0]nextstate ;//input to dff as in a tb declared reg
wire [2-1:0]currentstate;//output F whisc is reg in dff
DFF #(2)  state(.clk(clk),.in(nextstate) ,.out(currentstate ) ) ;
wire [31:0] dummyresult;
wire inz;
//added in final state after testing datapath
dtapath dp(
.clk(clk),
  .asel(waselect),
   .bsel(wbselect),
    . psel(wpselect),
   . M(m),
  .N(n),
   .z(inz),
    .outputproduct(dummyresult)
    );
//next state logic
        always @(*) 
        begin
            case (currentstate)
            `Start:
            begin
            nextstate=`Loop;
            end
            `Loop:
            begin
            nextstate=inz?`Done:`Loop;
            end 
            `Done:
            nextstate=`Done;
            
             default: nextstate= `Start;
            endcase
        end  //end alwys
//output logic 
always @(*)
begin
result=dummyresult;
    case (currentstate)
    `Start:
        begin
       waselect= `LoadAM;//load M to register a for start state 
       wbselect= `LoadBN;
       wpselect=`Loadp1;
        end
    `Loop:
        begin
       wpselect= `assignPAxB ;//assign AxB to P
       wbselect= `assignBbmin1 ;//assign B-1 to B
       waselect=`AssignAtoA;
        end 
    `Done:
        begin
        wpselect= `AssignPtoP ;//assign AxB to P
       wbselect= `AssignBtoB ;//assign B-1 to B
       waselect=`AssignAtoA;
        end
        default: 
        begin
        wpselect= 0 ;//assign PxA to P
        wbselect= 0 ;//assign B-1 to B
        waselect= 0;
        end
    endcase
end //end outputlogic
    
endmodule
