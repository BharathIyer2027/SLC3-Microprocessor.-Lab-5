`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:06:06 PM
// Design Name: 
// Module Name: ALU
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


module ALU(

    input logic [15:0] SR1_out,
    input logic [15:0] SR2_mux_out,
    input logic [1:0] ALUK,
    
    output logic [15:0] ALU_result);
    
    always_comb begin 
    unique case (ALUK)
    2'b00 : ALU_result = SR1_out + SR2_mux_out;
    2'b01 : ALU_result = SR1_out & SR2_mux_out;
    2'b10 : ALU_result = ~SR1_out;
    2'b11 : ALU_result = SR1_out;     
   endcase
   end
    
endmodule
