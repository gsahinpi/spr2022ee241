`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:30:18 PM
// Design Name: 
// Module Name: timer1tb
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


module traffictest;
 //---------------------------------------------------------
 // inputs to the DUT are reg type
 reg tdone;
 reg tcarew, clk, treset;
 /*(input wire done, wire in,wire clock,wire reset,
 output reg out,load,select
 */
 
 //--------------------------------------------------------
 // outputs from the DUT are wire type
 wire  [5:0] tout ;
 
 //---------------------------------------------------------
 // instantiate the Device Under Test (DUT)
 // using named instantiation
traficlightcont dut(.out(tout),.Clock(clk),.RESET(treset),.carew(tcarew));
      
  //----------------------------------------------------------
 // create a  clock
 always
 #10 clk = ~clk; // every ten nanoseconds invert
 //-----------------------------------------------------------
 // initial blocks are sequential and start at time 0
 initial
 begin
 $display($time, " << Starting the Simulation >>");
 clk = 1'b0;
// at time 0
 treset = 0;
// reset is active
 //select = 1'b1;


// enabled
 #20 treset = 1'b1;
// at time 20 release reset
 $display($time, " << Coming out of reset >>");
 @(negedge clk); // wait till the negedge of
// clk_50 then continue
tcarew = 1'b1;
 @(negedge clk);
 $display($time, " << Turning ON   >>");
 tcarew = 1'b0;
 //wait (outdone == 1'b1); // wait until the count
// equals 1 then continue
// $display($time, " << count = %d - Turning OFF the count enable >>",
//outdone);
//select = 1'b0;

//@(negedge clk);
 //load = 1'b1;
 //@(negedge clk);
 //load = 1'b0;
 //wait (outdone == 1'b1);
 //#40;
// let the simulation run for 40ns
// the counter shouldn't count

 $display($time, " << Simulation Complete >>");
 #800 $stop;
// stop the simulation
 
    
    end
 //--------------------------------------------------------------
 // This initial block runs concurrently with the other
 // blocks in the design and starts at time 0
 initial begin
 // $monitor will print whenever a signal changes
 // in the design
 $monitor($time, " clk=%b, rst=%b, in=%b, out=%b"
 , clk, treset, tcarew, tout);
 end
 //--------------------------------------------------------------




endmodule
