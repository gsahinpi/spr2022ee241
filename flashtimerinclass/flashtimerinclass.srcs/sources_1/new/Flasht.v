`timescale 1ns / 1ps
`define SWIDTH 3
`define S_OFF 3'b000
`define S_A   3'b001
`define S_B   3'b010
`define S_C   3'b011
`define S_D   3'b100
`define S_E   3'b101
module Flash(clk, rst, in, out) ;
  input clk, rst, in ; // in triggers start of flash sequence
  output out ;	       // out drives LED
  reg  out ;                       // output
  wire [`SWIDTH-1:0] state, next ; // current state
  reg  [`SWIDTH-1:0] next1  ;      // next state without reset
  reg  tload, tsel ;               // timer inputs
  wire done ;                      // timer output

  // instantiate state register
  DFF #(`SWIDTH) state_reg(clk, next, state) ;

  // instantiate timer
  Timer1 timer(clk, rst, tload, tsel, done) ;

  always @(*) begin
    case(state) 
      `S_OFF: {out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, in ? `S_A : `S_OFF } ;
      `S_A:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b0, done ? `S_B : `S_A } ;
      `S_B:   {out, tload, tsel, next1} = 
              {1'b0, done, 1'b1, done ? `S_C : `S_B } ;
      `S_C:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b0, done ? `S_D : `S_C } ;
      `S_D:   {out, tload, tsel, next1} = 
              {1'b0, done, 1'b1, done ? `S_E : `S_D } ;
      `S_E:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b1, done ? `S_OFF : `S_E } ;
      default:{out, tload, tsel, next1} = 
              {1'b1, done, 1'b1, done ? `S_OFF : `S_E } ;
    endcase
  end

  assign next = rst ? `S_OFF : next1 ;
endmodule  
