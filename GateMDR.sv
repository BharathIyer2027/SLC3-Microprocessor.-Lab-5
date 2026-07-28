`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 09:54:41 PM
// Design Name: 
// Module Name: GateMDR
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


module GateMDR(
    input logic [15:0] in,
    output logic [15:0] out,
    input logic select);
    
    always_comb begin
    if(select)
    begin
    out = in;
    end 
    end

    
endmodule
