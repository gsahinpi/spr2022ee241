`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 03:37:42 PM
// Design Name: 
// Module Name: controllertest
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


module controller2test;
//---------------------------------------------------------
 // inputs to the DUT are reg type
    reg  [31:0] inputm,inputn;
   
    reg tclk;
 /*(input wire done, wire in,wire clock,wire reset,
 output reg out,load,select
 */
 
 //--------------------------------------------------------
 // outputs from the DUT are wire type

 wire  [31:0] outputresult;
 wire [1:0] outwpselect,outwaselect, outwbselect;
 
 //---------------------------------------------------------
 // instantiate the Device Under Test (DUT)
controller2 dut(.clk(tclk),
 . m(inputm),.n(inputn),
   .result(outputresult),
 .wpselect(outwpselect),
    .waselect(outwaselect),
    .wbselect(outwbselect)
    );

      
  //----------------------------------------------------------
 // create a  clock
 always
 #5 tclk = ~tclk; // every ten nanoseconds invert
 //-----------------------------------------------------------
initial
 begin
 $display($time, " << Starting the Simulation >>");
 tclk = 1'b0;
// at time 0
//inputz=0;
inputm=32'd3;
inputn=32'd4;


end
endmodule


