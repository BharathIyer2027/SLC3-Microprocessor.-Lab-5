`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 09:38:56 PM
// Design Name: 
// Module Name: NZP
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


module NZP(
    input  logic        clk,
    input  logic        reset,
    input  logic        Ld_CC,          
    input  logic [15:0] bus,            
    output logic [2:0]  nzp_out         
);

     logic [2:0] nzp_from_bus;    
    
   
    always_comb begin 
     if(bus == 16'h0000) 
        nzp_from_bus = 3'b010;  //Z
        else if (bus[15])         
            nzp_from_bus = 3'b100;  //N
        else                      
            nzp_from_bus = 3'b001;  //P
    end
    
     always_ff @(posedge clk or posedge reset) begin
        if (reset)        
            nzp_out <= 3'b010;
        else if (Ld_CC)  
             nzp_out <= nzp_from_bus;
         end
    
   
    
    
endmodule
