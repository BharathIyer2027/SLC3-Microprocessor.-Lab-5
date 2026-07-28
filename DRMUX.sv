`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:39:27 PM
// Design Name: 
// Module Name: DRMUX
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


module DRMUX(
    output logic [2:0] dr_in ,
    input logic [2:0] IR_top,//11-9
    input logic [2:0] ones,//111
    input logic  select);
    
   always_comb begin 
   unique case (select)
   1'b0 : dr_in = IR_top;
   1'b1 : dr_in = ones;
     
   endcase
   end
    
    
    
endmodule