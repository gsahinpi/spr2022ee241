`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2021 02:41:29 PM
// Design Name: 
// Module Name: traficlightcont
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


module traficlightcont(output  reg  [5:0]  out,
input Clock,RESET,carew 


    );
    
reg [1:0]currentstate,nextstate;   
parameter gns=2'b0,
          yns=2'b1,
          gew=2'b10,
          yew=2'b11;
 // memory
  always @(posedge Clock or negedge RESET ) 
      begin: statememory
          if (!RESET)
              begin
              currentstate<=2'b0;
              end
          else  // if (load) currentstate<=in
              begin
               currentstate<=nextstate;
              end//else   if (~done) currnet<=next-1
      end //statememor
//nextstate logic
always @(carew or currentstate ) 

begin
nextstate[1]=(~currentstate[1]& currentstate[0]) |( currentstate[1] & ~currentstate[0]) ;
nextstate[0]= (carew & ~currentstate[1] &  ~currentstate[0]) || (currentstate[1] & ~currentstate[0]);

end
//output logic
always @(currentstate )//is independent of output -> more fsm machine
         begin : outputlogic
    case (currentstate)
        gns:out=6'b100001;
        yns:out=6'b010001;
        gew:out=6'b001100;
        yew:out=6'b001010;
        default: out=6'b100001;
            
        
        endcase
        
        
          end   

             
          
endmodule
