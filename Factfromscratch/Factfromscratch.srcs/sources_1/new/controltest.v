`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 09:54:12 PM
// Design Name: 
// Module Name: controltest
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

module controltest;
//---------------------------------------------------------
 // inputs to the DUT are reg type
 reg [31:0] tN;
 
reg  tclk ;
 /*(input wire done, wire in,wire clock,wire reset,
 output reg out,load,select
 */
 
 //--------------------------------------------------------
 // outputs from the DUT are wire type

 wire [31:0] fact,tBout;
 
 //---------------------------------------------------------
 // instantiate the Device Under Test (DUT)
controller  dut(.clk(tclk),.N(tN),.outfact(fact),.bdebug(tBout));

      
  //----------------------------------------------------------
 // create a  clock
 always
 #10 tclk = ~tclk; // every ten nanoseconds invert
 //-----------------------------------------------------------
initial
 begin
 $display($time, " << Starting the Simulation >>");
 tclk = 1'b0;
// at time 0
tN=32'd4;


end
endmodule
