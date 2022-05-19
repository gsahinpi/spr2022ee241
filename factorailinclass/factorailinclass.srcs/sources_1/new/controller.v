`timescale 1ns / 1ps

`define Start 2'b00
`define loop   2'b01
`define done   2'b10

`define waselassign1   2'd2
`define wbselassignN   2'd0
`define waselassignmulti 2'd1
`define wbselassignsubt 2'd1
`define waselassignA 2'd0
`define wbselassignB 2'd2
module controller(input clk,input [31:0]N );
wire [1:0] mystateval;

reg [1:0] mystatenext;
reg  [1:0]wasel;
reg [1:0]wbbsel;
wire z;
wire [31:0] factorial;
wire [31:0] bout;

  DFF #(2) Astate(clk, mystatenext, mystateval) ;
   Datapath d(.clk(clk),.N(N),.wasel(wasel),
,.wbsel(wbsel),.z(z), .Aout(factoraial),. Bout(Bout )  );
  
  //nextstate logi
  
endmodule
