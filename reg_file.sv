`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 03:08:29 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(

    input logic clk,
    input logic reset,
    input logic load,
    input logic [2:0] sr2,
    input logic [2:0] sr1,
    input logic [15:0] bus,
    input logic [2:0] dr,
    
    output logic [15:0] SR1_out,
    output logic [15:0] SR2_out);
    
    logic [15:0] R[8];
    
  always_ff @(posedge clk) begin
       if(load)
       begin
       unique case (dr)
       3'b000 : R[0] <=bus;
       3'b001 : R[1] <= bus;
       3'b010 : R[2] <= bus;
       3'b011 : R[3] <=bus;
       3'b100 : R[4] <= bus;
       3'b101 : R[5] <= bus;
       3'b110 : R[6] <=bus;
       3'b111 :  R[7] <=bus;
       
     
    endcase
        end else if(reset) begin 
             R[0] <=8'b00000000;
             R[1] <= 8'b00000000;
             R[2] <= 8'b00000000;
             R[3] <=8'b00000000;
             R[4] <= 8'b00000000;
             R[5] <= 8'b00000000;
             R[6] <=8'b00000000;
             R[7] <=8'b00000000;
               
        
      //end else begin
       // R[7:0] <=R[7:0];
   end
   end
   
     always_comb begin
        unique case (sr1)
          3'b000: SR1_out = R[0];
          3'b001: SR1_out = R[1];
          3'b010: SR1_out = R[2];
          3'b011: SR1_out = R[3];
          3'b100: SR1_out = R[4];
          3'b101: SR1_out = R[5];
          3'b110: SR1_out = R[6];
          3'b111: SR1_out = R[7];
          default: SR1_out = 16'h0000;
        endcase
    end

    always_comb begin
        unique case (sr2)
          3'b000: SR2_out = R[0];
          3'b001: SR2_out = R[1];
          3'b010: SR2_out = R[2];
          3'b011: SR2_out = R[3];
          3'b100: SR2_out = R[4];
          3'b101: SR2_out = R[5];
          3'b110: SR2_out = R[6];
          3'b111: SR2_out = R[7];
          default: SR2_out = 16'h0000;
        endcase
    end
    
    
    
   
endmodule
