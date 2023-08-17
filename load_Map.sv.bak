module Load_Pixel_Map (input Clk, Reset,reset_game, //ActivateLoad,
						// Input from Datapath PixelMap
						input [19:0][9:0][3:0] PixelMapIn,
						// Inputs from Block.sv
                  input [9:0] shape_x, shape_y, 		// Bottom right coord of shape
						input [2:0] shape_num, 
						input [1:0] shape_rot,	// What shape it is
						input touchdown,
						// Outputs to Block.sv
						//output ResetShape,
						// Output to Color_Mapper.sv
						output [19:0][9:0][3:0] PixelMapOut
						); 
							 

logic [19:0][9:0][3:0] PixelMap; // scale down of 320x160 --> 20x10


// scale down the shape_x and shape_y to the smaller version
logic [9:0] scaled_x, scaled_y, offset_x, offset_y;
logic [4:0] be = 16;
logic [9:0] shape_x_board = 250;
logic [9:0] shape_y_board = 100;
//logic [9:0] shape_size_x_board = 160;
//logic [9:0] shape_size_y_board = 320;

/**** Check the map ****/
always_ff @ (posedge Clk)
//always_comb
begin
	//ResetShape <= 1'b0;
	offset_x <= (shape_x - shape_x_board);
	offset_y <= (shape_y - shape_y_board);
	scaled_x <= (offset_x - (offset_x%be))/be;
	scaled_y <= (offset_y - (offset_y%be))/be;
	PixelMap <= PixelMapIn;
	
	if (Reset||reset_game) begin
		PixelMap <= '{default:4'b0}; // fill it all with zeros	
	end

	// Check and load map
//	if (ActivateLoad)
	
//	begin
		case(shape_num)
			// I BLOCK
			3'd1 : begin
						if (shape_rot == 2'd0 || shape_rot == 2'd2) 
						begin // I_block_h: 1x4
								PixelMap[scaled_y-1][scaled_x] <= 4'd1;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd1;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd1;
								PixelMap[scaled_y-1][scaled_x+3] <= 4'd1;
						end
						
						else 
						begin // I_block_v: 4x1.. ref coord = 2nd from top
								PixelMap[scaled_y][scaled_x] <= 4'd1;
								PixelMap[scaled_y-1][scaled_x] <= 4'd1;
								PixelMap[scaled_y+1][scaled_x] <= 4'd1;
								PixelMap[scaled_y+2][scaled_x] <= 4'd1;
						end
					end
					
			// O BLOCK.. ref coord = bottom left
			3'd2 : begin
							PixelMap[scaled_y][scaled_x] <= 4'd2;
							PixelMap[scaled_y-1][scaled_x] <= 4'd2;
							PixelMap[scaled_y][scaled_x+1] <= 4'd2;
							PixelMap[scaled_y-1][scaled_x+1] <= 4'd2;
					 end
					
			// J BLOCK
			3'd3 : begin
						if (shape_rot == 2'd0) // J_block_0: ref coord = bottom left
							begin
								PixelMap[scaled_y][scaled_x] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x] <= 4'd3;
								PixelMap[scaled_y][scaled_x+1] <= 4'd3;
								PixelMap[scaled_y][scaled_x+2] <= 4'd3;
							end
						
						else if (shape_rot == 2'd1) // J_block_1: ref coord = 2nd from bottom
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd3;
								PixelMap[scaled_y+1][scaled_x] <= 4'd3;
						end
						
						else if (shape_rot == 2'd2) // J_block_2: ref coord = one down from leftmost (not part of the shape)
						begin
								PixelMap[scaled_y-1][scaled_x] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd3;
								PixelMap[scaled_y][scaled_x+2] <= 4'd3;
						end
						
						else begin	// J_block_3: ref coord = one left from middle block (middle block = one down from topmost).. not part of the shape
								PixelMap[scaled_y+1][scaled_x] <= 4'd3;
								PixelMap[scaled_y+1][scaled_x+1] <= 4'd3;
								PixelMap[scaled_y][scaled_x+1] <= 4'd3;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd3;
						end
			
					end
	
			// L_BLOCK
			3'd4 : begin
						if (shape_rot == 2'd0) // L_block_0: ref coord = leftmost
							begin
								PixelMap[scaled_y][scaled_x] <= 4'd4;
								PixelMap[scaled_y][scaled_x+1] <= 4'd4;
								PixelMap[scaled_y][scaled_x+2] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd4;
							end
						
						else if (shape_rot == 2'd1) // L_block_1: ref coord = one down from topmost
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x] <= 4'd4;
								PixelMap[scaled_y+1][scaled_x] <= 4'd4;
								PixelMap[scaled_y+1][scaled_x+1] <= 4'd4;
						end
						
						else if (shape_rot == 2'd2) // L_block_2: ref coord = leftmost bottom
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd4;
						end
						
						else 
						begin	// L_block_3: ref coord = one down from top left (not part of shape)
								PixelMap[scaled_y-1][scaled_x] <= 4'd4;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd4;
								PixelMap[scaled_y][scaled_x+1] <= 4'd4;
								PixelMap[scaled_y+1][scaled_x+1] <= 4'd4;
						end
			
					end
			
			// S_BLOCK
			3'd5 : begin
						if ((shape_rot == 2'd0) || (shape_rot == 2'd2)) // S_block_0: ref coord = bottom left
							begin
								PixelMap[scaled_y][scaled_x] <= 4'd5;
								PixelMap[scaled_y][scaled_x+1] <= 4'd5;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd5;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd5;
							end
						
						else if ((shape_rot == 2'd1) || (shape_rot == 2'd3)) // S_block_1: ref coord = right from middle
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd5;
								PixelMap[scaled_y-1][scaled_x] <= 4'd5;
								PixelMap[scaled_y][scaled_x+1] <= 4'd5;
								PixelMap[scaled_y+1][scaled_x+1] <= 4'd5;
						end
					 end
			
			// Z_BLOCK
			3'd7 : begin
						if (shape_rot == 2'd0 || shape_rot == 2'd2) // Z_block_0: ref coord = second from bottom left
						begin
								PixelMap[scaled_y-1][scaled_x] <= 4'd6;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd6;
								PixelMap[scaled_y][scaled_x+1] <= 4'd6;
								PixelMap[scaled_y][scaled_x+2] <= 4'd6;
						end
						
						else if (shape_rot == 2'd1 || shape_rot == 2'd3) // Z_block_1: ref coord = one below top leftmost (not part of shape)
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd6;
								PixelMap[scaled_y+1][scaled_x] <= 4'd6;
								PixelMap[scaled_y][scaled_x+1] <= 4'd6;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd6;			
						end
					 end
			
			// T_BLOCK
			3'd6 : begin
						if (shape_rot == 2'd0) // T_block_0 (upright piece): ref coord = bottom left
							begin
								PixelMap[scaled_y][scaled_x] <= 4'd8;
								PixelMap[scaled_y][scaled_x+1] <= 4'd8;
								PixelMap[scaled_y][scaled_x+2] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd8;	
							end
						
						else if (shape_rot == 2'd1) // T_block_1 (nose facing right): ref coord = center 
						begin
								PixelMap[scaled_y][scaled_x] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x] <= 4'd8;
								PixelMap[scaled_y+1][scaled_x] <= 4'd8;
								PixelMap[scaled_y][scaled_x+1] <= 4'd8;
						end
						
						else if (shape_rot == 2'd2) // T_block_2 (nose facing down): ref coord = bottom left (not part of shape)
						begin
								PixelMap[scaled_y][scaled_x+1] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x+2] <= 4'd8;				
						end
						
						else begin	// T_block_3 (nose facing left): ref coord = nose
								PixelMap[scaled_y][scaled_x] <= 4'd8;
								PixelMap[scaled_y][scaled_x+1] <= 4'd8;
								PixelMap[scaled_y-1][scaled_x+1] <= 4'd8;
								PixelMap[scaled_y+1][scaled_x+1] <= 4'd8;
						end
			
					end
					
			default : ;
		endcase

//	end
end

// Output the pixel map pixels to ColorMapper
assign PixelMapOut = PixelMap;

endmodule


