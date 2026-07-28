`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 09:41:06 PM
// Design Name: 
// Module Name: MIO_EN
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


module MIO_EN(
    input logic [15:0] bus,
    input logic [15:0] rdata,
    input logic select,
    output logic [15:0] MIO_out);
    
    
   always_comb begin 
   unique case (select)
   1'b0 : MIO_out = bus;
   1'b1 : MIO_out = rdata;
     
   endcase
   end
endmodule
