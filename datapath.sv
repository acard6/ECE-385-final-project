module datapath(input Clk, Reset, game_reset, frame_clk,
					input [2:0] shape_num, keypress, 
					input [1:0] rotation, state,
					input [9:0] shape_size_x, shape_size_y,
					output [9:0] shape_x, shape_y, 
					output [19:0][9:0][3:0] PixelMapOut,
					output shape_reset,
					output touching,
					output [13:0] theScore,
					output game_over,
					output stopxleft, stopxright);

// Internal logic to connect module instances
logic ResetShape, NeedsClear, NeedsLoad, touchdown, LoadRealReg, stop_x_left, stop_x_right, endgame; //MoveBlock
logic LoadAll, Load0, Load1, Load2, Load3, Load4, Load5, Load6, Load7, Load8, Load9, Load10, Load11, Load12, Load13, Load14, Load15, Load16, Load17, Load18, Load19;
logic line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17, line18, line19;
logic [9:0] shape_x_h, shape_y_h, Block_X_Pos, Block_Y_Pos;
logic [1:0] Mux_Select;
logic [19:0][9:0][3:0] load_map_h, clear_map_h, clear_map_out, temppixmap_in, p_mux_out, pixmap_to_load;
logic [4:0] CheckClear;
logic [13:0] Score;

logic [19:0][9:0][3:0] PixelMap;
assign PixelMapOut = PixelMap; // Output from realpixmap
assign shape_reset = ResetShape;
assign touching = touchdown;
assign game_over = endgame;
assign stopxleft = stop_x_left;
assign stopxright = stop_x_right;
assign theScore = Score;

// Outputs for Color_Mapper
assign shape_x = shape_x_h;
assign shape_y = shape_y_h;


	// Internal Register to hold PixelMap
	Pixel_Map_Reg realpixmap(.Clk,
									 .Reset,
									 .game_reset,
									 .PRegIn(p_mux_out),
									 .LoadReg(LoadRealReg),
									 .PRegOut(PixelMap));

	// Dynamic block				 
	block block_inst( .Reset,
							.frame_clk(Clk),
							.game_reset,
							.Score,
							.state,
							.keypress,
							.stop_x_left,
							.stop_x_right,
							.touching(touchdown),
							.shape_reset,				
							.shape_size_x,
							.shape_size_y,
							.shape_x(shape_x_h),	// Outputs to both Load_Pixel_Map and Color_Mapper
							.shape_y(shape_y_h));

	// loads appropriately into pixel_map depending on Block.sv
	Load_Pixel_Map loadmap0(.Clk,							
									.Reset,							
									.game_reset,
									.PixelMapIn(PixelMap),		// From PMapReg
									.PixelMapOut(load_map_h),	// to mux for internal PixelMap
									.shape_x(shape_x_h),
									.shape_y(shape_y_h),
									.*);								// Inputs from Block.sv

	// Checks if fsm needs to go to load stage and clear stage. Provides individual logic if each line needs to be cleared.
	Check_Pixel_Map checkmap0(.*);

	frame_buffer temppixmap(.PixelMapOut(clear_map_h), .*);

	// FSM: if any of the lines are all full, go to Clear after Load. else, swap between Block and Load
	Datapath_state_machine dsm0(.*);

	// Mux to choose inputs to PixelMap		
	PixelMapMux pmmux0(.Reset,
							 .a(load_map_h),
							 .b(clear_map_h),
							 .c(PixelMap),
							 .sel(Mux_Select),
							 .out(p_mux_out));

endmodule
