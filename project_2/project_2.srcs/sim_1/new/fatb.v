`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:18:47 PM
// Design Name: 
// Module Name: fatb
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


module fatb;
reg  ta,b, tcin;
wire ts,tcout;
fa myadder(.a(ta),
     .b(b),.cin(tcin),.s(ts),
     .cout(tcout)
    );
    initial
    begin
  ta=0;b=0;tcin =0;
  #10 ta=0;b=0;tcin =0;
  #10 ta=0;b=0;tcin =1;
  #10 ta=0;b=1;tcin =0;
  #10 ta=0;b=1;tcin =1;
  #10 ta=1;b=0;tcin =0;
    end

endmodule
