`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 07:40:40 PM
// Design Name: 
// Module Name: SLC3_5_2_tb
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


module SLC3_5_2_tb();

      logic		clk; 
	  logic 		reset;

	  logic 		run_i; 
	  logic 		continue_i;
	  logic [15:0] sw_i;

	 logic [15:0] led_o;
	 logic [7:0]  hex_seg_left;
	 logic [3:0]  hex_grid_left;
	 logic [7:0]  hex_seg_right;
	 logic [3:0]  hex_grid_right;
	 //logic [15:0] pc;

    

   initial begin: CLOCK_INITIALIZATION
    clk = 1'b1;
   end 
   
   always begin: CLOCK_GENERATION
        #1 clk = ~clk;
        end
        
      
     processor_top tb(.*);

    initial begin
    reset <= 0;
    continue_i<=0;
    run_i <= 0;
    reset<=1;
    #20;
    reset<=0;
              sw_i <= 16'h005A; #20; run_i <=1; #15; run_i <=0; #150;
    sw_i <= 16'h0003; #15; continue_i <=1; #15; continue_i <=0; #200; // show unsorted
    sw_i <= 16'h0002; #15; continue_i <=1; #15; continue_i <=0; #200; // sort
    sw_i <= 16'h0003; #15; continue_i <=1; #15; continue_i <=0; #200; // show sorted
    $finish();


;


   
    end
    
endmodule
