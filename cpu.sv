//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//    Revised 12-29-2023
//    Revised 09-25-2024
//------------------------------------------------------------------------------

module cpu (
    input   logic        clk,
    input   logic        reset,

    input   logic        run_i,
    input   logic        continue_i,
    output  logic [15:0] hex_display_debug,
    output  logic [15:0] led_o,
   
    input   logic [15:0] mem_rdata,
    output  logic [15:0] mem_wdata,
    output  logic [15:0] mem_addr,
    output  logic        mem_mem_ena,
    output  logic        mem_wr_ena
);


// Internal connections, follow the datapath block diagram and add the additional needed signals
logic ld_mar; 
logic ld_mdr; 
logic ld_ir; 
logic ld_pc; 
logic ld_led;
logic MIO_EN;
logic ld_reg;
logic ld_cc;
logic ld_ben;
logic [15:0] mdr_in;

logic gALU;
logic gMDR;
logic gPC;
logic gMARMUX;

logic gate_pc;
logic gate_mdr;

//logic [1:0] pcmux;

logic [15:0] mar; 
logic [15:0] mdr;
logic [15:0] ir;
logic [15:0] pc;
logic [15:0] bus;
logic [15:0] addr_adder_out;
logic ben;
logic [1:0] pc_select;
logic addr_1_select;
logic [1:0] addr_2_select;
logic [15:0] pc_in;
logic [15:0] addr1_out;
logic [15:0] addr2_out;
logic [15:0] sr1_out;
logic sr1_select;
logic dr_select;
logic [2:0] sr1_in;
logic sr2_mux_select;
logic [15:0] sr2_out;
logic [15:0] sr2_mux_out;
logic [2:0] dr_in;
logic [15:0] ALU_result;
logic [1:0] ALUK;
logic [2:0] nzp_out;
logic [3:0] gate_select;
//logic ben;

assign mem_addr = mar;
assign mem_wdata = mdr;




    

// State machine, you need to fill in the code here as well
// .* auto-infers module input/output connections which have the same name
// This can help visually condense modules with large instantiations, 
// but can also lead to confusing code if used too commonly
control cpu_control (.*);


assign led_o = ir;
assign hex_display_debug = ir;

load_reg #(.DATA_WIDTH(16)) ir_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_ir),
    .data_i (bus),

    .data_q (ir)
);

load_reg #(.DATA_WIDTH(16)) pc_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_pc),
    .data_i(pc_in),
    .data_q(pc)
);

load_reg # (.DATA_WIDTH(16)) mar_reg(
    .clk(clk),
    .reset(reset),
    
    .load(ld_mar),
    .data_i(bus),
    .data_q (mar));

load_reg # (.DATA_WIDTH(16)) mdr_reg(
    .clk(clk),
    .reset(reset),
    
    .load(ld_mdr),
    .data_i(mdr_in),
    .data_q(mdr));
    
 pcmux PCMUX(
 
 .mux_out(pc_in),
 .pc_plus1 (pc+16'd1),
 .bus(bus),
 .select(pc_select),
 .addr_adder (addr_adder_out));
 
 ADDR1MUX addr_1_mux(
    .select(addr_1_select),
    .addr1_out(addr1_out),
    .sr1_out(sr1_out),
    .pc(pc));
 
 ADDR2MUX addr_2_mux(
    .select(addr_2_select),
    .zero (16'd0),
    .SEXT10(ir[10:0]),
    .SEXT8(ir[8:0]),
    .SEXT5(ir[5:0]),
    .addr2_out (addr2_out)   
    );
 
 SR1MUX sr_1_mux(
 
 .select(sr1_select),
 .sr1_in(sr1_in),
 .IR_top (ir[11:9]),
 .IR_bottom (ir[8:6]));
 
 
 
 DRMUX dr_mux(
 .select(dr_select),
 .IR_top (ir[11:9]),
 .ones (3'b111),
 .dr_in (dr_in)
 );
 
 SR2MUX sr_2_mux( 
 .select(ir[5]),
 .immediate(ir[4:0]),
 .sr2_out(sr2_out),
 .sr2_mux_out(sr2_mux_out));
 
 reg_file Register_file(
    .clk(clk),
    .reset(reset),
    .load(ld_reg),
    .sr2(ir[2:0]),
    .sr1(sr1_in),
    .bus(bus),
    .dr(dr_in),
    
    .SR1_out(sr1_out),
    .SR2_out(sr2_out));
 
 AdderMux_adder ADD(
 .Mux1 (addr1_out),
 .Mux2 (addr2_out),
 .adder_output(addr_adder_out));
 
 
 ALU reg_ops(
 .SR1_out(sr1_out),
 .SR2_mux_out(sr2_mux_out),
 .ALUK(ALUK ),
 .ALU_result (ALU_result));
  
 MIO_EN mio_en(
 .bus(bus),
 .select(MIO_EN),
 .rdata (mem_rdata),
 .MIO_out(mdr_in));
 
 
    
     NZP nzp(
     
     .clk(clk),
     .reset(reset),
     .Ld_CC(ld_cc),
     .bus(bus),
     .nzp_out(nzp_out));
     
     branch_enable branch_en(
     .clk(clk),
     .reset(reset),
     .ld_ben(ld_ben),
     .nzp_out(nzp_out),
     .ir_select(ir[11:9]),
     .ben(ben));

    gateMUXES mux(
    .gate_select(gate_select), 
    .ALU_in(ALU_result), 
    .MDR_in(mdr),
    .PC_in(pc),
    .MARMUX_in(addr_adder_out),
    .gate_Out(bus));
    
 
 
 
 
 
 
    
    


endmodule
