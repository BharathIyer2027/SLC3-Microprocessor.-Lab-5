`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:11:19 PM
// Design Name: 
// Module Name: pcmux
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


module pcmux (
    input  logic [15:0] pc_plus1,      // PC + 1
    input  logic [15:0] bus,           // system bus
    input  logic [15:0] addr_adder,    // address adder output
    input  logic [1:0]  select,           // 00:pc+1, 01:bus, 10:addr
    output logic [15:0] mux_out
);
    
    
    
   always_comb begin 
   unique case (select)
   2'b00 : mux_out = pc_plus1;
   2'b01 : mux_out = bus;
   2'b10: mux_out = addr_adder;
   
   endcase
   end
    
    
    
endmodule
