`timescale 1ns / 1ps
module TestFlash ;
  reg clk, rst, in ;
  wire out ;

  Flash f(clk, rst, in, out) ;  

  // clock and display
  initial
    forever
      begin
        #5 clk = 0 ;
        $display("%b %b", in, out) ;
        #5 clk = 1 ;
      end

  // inputs
  initial begin
    #5 rst = 1 ; in = 0 ;
    #10 rst = 0 ;
    #10 in = 1 ;
    #10 in = 0 ;
    #320 in = 1 ;
    #10 in = 0 ;
    #320 $stop ;
  end
endmodule 
