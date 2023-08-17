/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 254 //80*30 characters / 4 characters per register
//`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//logic [16:0] LOCAL_REG[8];


//put other local variables here
//logic [31:0	] control;
logic [3:0	] FGD_R, FGD_G, FGD_B, BKG_R, BKG_G, BKG_B;
logic [11:0	] FGD, BKG;
logic [7:0	] data3, data2, data1, data0;
logic [9:0	] addr;

assign addr = {drawY[9:4],4'h0} + {drawY[9:4],2'h0} +drawX[9:5];
/**
assign control = LOCAL_REG[`CTRL_REG];
assign FGD_R = control[24:21];
assign FGD_G = control[20:17];
assign FGD_B = control[16:13];
assign BKG_R = control[	12:9];
assign BKG_G = control[	 8:5];
assign BKG_B = control[	 4:1];
assign FGD = {FGD_R, FGD_G, FGD_B};
assign BKG = {BKG_R, BKG_G, BKG_B};
*/
logic blank, sync, pixel_clk;	// signals for VGA controller
logic [9:0] drawX, drawY;		// VGA controller usage
logic [3:0] Red, Green, Blue;	// color output of color_mapper

//Declare submodules..e.g. VGA controller, ROMS, etc
//ram ram0(.byteena_a(AVL_BYTE_EN), .clock(CLK), .data(AVL_WRITEDATA), .rdaddress(AVL_ADDR), 
//			.wraddress(AVL_ADDR), .wren(AVL_WRITE & AVL_CS), .q(AVL_READDATA));

vga_controller VGA( .Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixel_clk), 
						  .blank(blank), .sync(sync), .DrawX(drawX), .DrawY(drawY));   
	 
color_mapper RGB( .DrawX(drawX), .DrawY(drawY), .Data(AVL_READDATA), .FGD(FGD), 
						.ADDR(addr), .BKG(BKG), .Red(Red), .Green(Green), .Blue(Blue));
   

// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff

//this is used for using registers for VRAM

always_ff @(posedge CLK) begin	
	if (RESET)begin
		for (int i=0; i<`NUM_REGS; i=i+1) 
			LOCAL_REG[i] <= 32'h0;
	end
		
	else if (AVL_WRITE && AVL_CS)
		LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];	
	
end

always_comb begin
	AVL_READDATA = (AVL_READ && AVL_CS) ? LOCAL_REG[AVL_ADDR] : 32'd0;
end


//handle drawing (may either be combinational or sequential - or both).

always_ff @(posedge pixel_clk)
	if (~blank) begin
		red <= 4'h0;
		blue <= 4'h0;
		green <= 4'h0;
	end
	
	else begin
		red <= Red;
		blue <= Blue;
		green <= Green;
	end
	
endmodule
