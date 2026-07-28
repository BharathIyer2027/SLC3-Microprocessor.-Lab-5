`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 09:28:28 PM
// Design Name: 
// Module Name: branch_enable
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


module branch_enable(
    input logic clk,
    input logic reset,  
    input logic [2:0] nzp_out,
    input logic ld_ben,
    input logic [2:0] ir_select,
    output logic ben);
    
    always_ff @(posedge clk) begin
        if (reset)      ben <= 1'b0;
        else if (ld_ben) ben <= (ir_select[2] & nzp_out[2] |ir_select[1] & nzp_out[1]| ir_select[0] & nzp_out[0]);  
        else ben<=ben;
        
    end
endmodule
    

