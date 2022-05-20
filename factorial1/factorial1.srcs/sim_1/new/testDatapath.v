`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2021 07:01:36 PM
// Design Name: 
// Module Name: testDatapath
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


module testDatapath;
//---------------------------------------------------------
 // inputs to the DUT are reg type
 reg tclk;
 reg [1:0]twasel;
 reg [1:0] twbsel;
 reg [31:0]tN;
 
 //--------------------------------------------------------
 // outputs from the DUT are wire type
 wire  tz;
 wire [31:0]tAval;
 wire [31:0]tBval;
 // instantiate the Device Under Test (DUT)
 // using named instantiation
  datapath2 DUT(.clk(tclk), .wasel(twasel),.wbsel(twbsel),.N(tN),.z(tz),.Aval(tAval),.Bval(tBval)

    );
 //----------------------------------------------------------
 // create a 50Mhz clock
 always
 #10 tclk = ~tclk; // every ten nanoseconds invert
 //-----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial
 begin
 $display($time, " << Starting the Simulation >>");
 tclk = 1'b0;
// at time 0
tN=32'd6;
twasel=2'd2;
twbsel=2'd0;
 $display($time, " clk=%b, z=%b, Aval=%b, Bval=%b"
 , tclk, tz, tAval,tBval);
 #20 twasel=2'd1;
 #80 twasel=2'd0;
     twbsel=2'd1; 
 #100 twbsel=2'd2 ;   
 
 end

 //--------------------------------------------------------------
 // This initial block runs concurrently with the other
 // blocks in the design and starts at time 0
 initial begin
 // $monitor will print whenever a signal changes
 // in the design
 $monitor($time, " clk=%b, z=%b, Aval=%b, Bval=%b"
  , tclk, tz, tAval,tBval);
 end
 //--------------------------------------------------------------


endmodule
