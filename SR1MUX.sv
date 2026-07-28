`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:38:42 PM
// Design Name: 
// Module Name: SR1MUX
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


module SR1MUX(

    output logic [2:0] sr1_in ,
    input logic [2:0] IR_top,//11-9
    input logic [2:0] IR_bottom,//8-6
    input logic  select);
    
   always_comb begin 
   unique case (select)
   1'b0 : sr1_in = IR_top;
   1'b1 : sr1_in = IR_bottom;
     
   endcase
   end
    
    
    
endmodule
