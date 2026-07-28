`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:01:15 PM
// Design Name: 
// Module Name: AdderMux_adder
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


module AdderMux_adder(

    input logic [15:0] Mux1,
    input logic [15:0] Mux2,
    output logic [15:0] adder_output);
    
    assign adder_output = Mux1+Mux2;
endmodule
