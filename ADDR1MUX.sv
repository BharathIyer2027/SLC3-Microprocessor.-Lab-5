`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:36:18 PM
// Design Name: 
// Module Name: ADDR1MUX
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


module ADDR1MUX(
    input logic [15:0] sr1_out,
    input logic [15:0] pc,
    input logic select,
    output logic [15:0] addr1_out  
    );
    
   always_comb begin 
   unique case (select)
   1'b0 : addr1_out = pc;
   1'b1 : addr1_out = sr1_out;
     
   endcase
   end
    
    
    
endmodule
