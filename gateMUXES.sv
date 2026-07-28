`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 05:56:24 PM
// Design Name: 
// Module Name: gateMUXES
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


module gateMUXES(

    input logic [3:0] gate_select,
    input logic [15:0] ALU_in,
    input logic [15:0] MDR_in, 
    input logic [15:0] MARMUX_in,
    input logic [15:0] PC_in,
    output logic [15:0] gate_Out
    

    );
    
    always_comb begin 
    unique case(gate_select)
    4'b0001 : gate_Out = ALU_in;
    4'b0010 : gate_Out = MDR_in;
    4'b0100 : gate_Out = MARMUX_in;
    4'b1000 : gate_Out = PC_in;
    
    
    endcase
    end
endmodule
