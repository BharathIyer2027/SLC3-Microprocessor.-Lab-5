`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:38:02 PM
// Design Name: 
// Module Name: ADDR2MUX
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


module ADDR2MUX(
    input logic [10:0] SEXT10,
    input logic [8:0] SEXT8,
    input logic [5:0] SEXT5,
    input logic [15:0] zero,
    input logic [1:0] select,
    output logic [15:0] addr2_out  
    );
    logic [15:0] post_SEXT5;
    logic [15:0] post_SEXT8;
    logic [15:0] post_SEXT10;
    
    assign post_SEXT5 = {{10{SEXT5[5]}},SEXT5};
    assign post_SEXT8 = {{7{SEXT8[8]}},SEXT8};
    assign post_SEXT10 = {{5{SEXT10[10]}},SEXT10};
   
    always_comb begin   
   unique case (select)   
   2'b00 : addr2_out = zero;
   2'b01 : addr2_out = post_SEXT5;
   2'b10 : addr2_out = post_SEXT8;
   2'b11 : addr2_out = post_SEXT10;
     
   endcase
   end
    
 endmodule   