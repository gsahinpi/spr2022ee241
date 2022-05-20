`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2021 10:51:45 PM
// Design Name: 
// Module Name: testcontroller
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


module testcontroller;
//---------------------------------------------------------
 // inputs to the DUT are reg type
 reg tclk;

reg [31:0] tN;
 //--------------------------------------------------------
 // outputs from the DUT are wire type

 wire  [31:0] toutfact;

 // instantiate the Device Under Test (DUT)
 // using named instantiation
 controller DUTcontroller(.clk (tclk),.N(tN),.outfact(toutfact)

    );
 //----------------------------------------------------------
 // create a 50Mhz clock
 always
 #10 tclk = ~tclk; // every ten nanoseconds invert
 //-----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial 
 begin
 tN=32'd6;
 end
 
endmodule
