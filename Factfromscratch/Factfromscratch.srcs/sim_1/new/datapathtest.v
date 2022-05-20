`timescale 1ns / 1ps


module Datapathtest();
 //---------------------------------------------------------
 // inputs to the DUT are reg type
 reg [31:0] tN;
 reg [1:0] twasel;
 reg [1:0]twbsel;
reg  tclk ;
 /*(input wire done, wire in,wire clock,wire reset,
 output reg out,load,select
 */
 
 //--------------------------------------------------------
 // outputs from the DUT are wire type
 wire tz;
 wire [31:0]tAout,tBout;
 
 //---------------------------------------------------------
 // instantiate the Device Under Test (DUT)
Datapath  dut (.clk(tclk),.N(tN),.wasel(twasel),.wbsel(twbsel),. z(tz),.Aout(tAout),.Bout(tBout)  );
      
  //----------------------------------------------------------
 // create a 50Mhz clock
 always
 #10 tclk = ~tclk; // every ten nanoseconds invert
 //-----------------------------------------------------------
 initial
 begin
 $display($time, " << Starting the Simulation >>");
 tclk = 1'b0;
// at time 0
tN=32'd8;
#20 twasel=2'd2;
twbsel=2'd0;
#80 twasel=2'd1;
twbsel=2'd1;
#160 twasel=2'd0;
twbsel=2'd2;

end
 
 
 
 //--------------------------------------------------------------
 // This initial block runs concurrently with the other
 // blocks in the design and starts at time 0
 initial begin
 // $monitor will print whenever a signal changes
 // in the design
 $monitor($time, " tclk=%d, wasel=%d, wbsel=%d, z=%d"
 , tclk,twasel,twbsel,tz);
 end
 //--------------------------------------------------------------
 endmodule