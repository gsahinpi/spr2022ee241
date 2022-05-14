`timescale 1ns / 1ps

`define T_WIDTH 3
`define T_ON 3'd5
`define T_OFF 3'd3
module Timer1(clk, rst, tload, tsel, done) ;
  parameter n=`T_WIDTH ;
  input clk, rst, tload, tsel ;
  output done ;
  wire [n-1:0] count ; 
  reg  [n-1:0] next_count ;

  // state register
  DFF #(n) state(clk, next_count, count) ;

  // signal done
  assign done = ~(|count) ;// 000 

  // next count logic
  always@(*) begin
    casex({rst, tload, tsel, done})
      4'b1xxx: next_count = `T_WIDTH'b0 ;
      4'b011x: next_count = `T_ON ;
      4'b010x: next_count = `T_OFF ;
      4'b00x0: next_count = count - 1'b1 ;
      4'b00x1: next_count = count ;
      default: next_count = count ;
    endcase
  end
endmodule 
