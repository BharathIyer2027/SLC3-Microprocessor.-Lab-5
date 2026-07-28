`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 01:40:44 PM
// Design Name: 
// Module Name: SR2MUX
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


module SR2MUX(


    input logic [15:0] sr2_out,
    input logic [4:0] immediate,
    input logic select,
    output logic [15:0] sr2_mux_out);
    
    logic [15:0] post_immediate;
    
    
     assign post_immediate = {{11{immediate[4]}},immediate};
    
    
   always_comb begin 
   unique case (select)
   1'b0 : sr2_mux_out = sr2_out;
   1'b1 : sr2_mux_out = post_immediate;
   endcase
   end
     
    
    
endmodule
