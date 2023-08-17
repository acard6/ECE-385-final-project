// Does the two checks for updating PixelMap: either Load, or Clear. Inputs into FSM to decide Next_State
module Check_Pixel_Map(input Clk,
							  input [19:0][9:0][3:0] PixelMap,
							  // to check clear
							  output line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, line14, line15, line16, line17, line18, line19,
							  output NeedsClear,
							  // to check load
							  input [9:0] shape_x, shape_y,
							  input [2:0] shape_num, 
							  input [1:0] shape_rot,
							  input touchdown,
							  output NeedsLoad,
							  // Block movement edge case (stop x movement)
							  output stop_x_left,
							  output stop_x_right,
							  // End Game
							  output endgame);				  
							  
/*** CHECK CLEAR ***/	  
// (0 is top of screen, 19 is bottom of screen)
// 20 AND gates to check if any level needs to be cleared
always_comb
begin
	NeedsClear = 1'b0;
	line0 = 1'b0;
	line1 = 1'b0;
	line2 = 1'b0;
	line3 = 1'b0;
	line4 = 1'b0;
	line5 = 1'b0;
	line6 = 1'b0;
	line7 = 1'b0;
	line8 = 1'b0;
	line9 = 1'b0;
	line10 = 1'b0;
	line11 = 1'b0;
	line12 = 1'b0;
	line13 = 1'b0;
	line14 = 1'b0;
	line15 = 1'b0;
	line16 = 1'b0;
	line17 = 1'b0;
	line18 = 1'b0;
	line19 = 1'b0;	
	
	// Check line19
	if ((PixelMap[19][0] > 0) && (PixelMap[19][1] > 0) && (PixelMap[19][2] > 0) && (PixelMap[19][3] > 0) && (PixelMap[19][4] > 0) && (PixelMap[19][5] > 0)
			 && (PixelMap[19][6] > 0) && (PixelMap[19][7] > 0) && (PixelMap[19][8] > 0) && (PixelMap[19][9] > 0)) begin
		line19 = 1'b1;
		NeedsClear = 1'b1;
	end		

	// Check line18
	if ((PixelMap[18][0] > 0) && (PixelMap[18][1] > 0) && (PixelMap[18][2] > 0) && (PixelMap[18][3] > 0) && (PixelMap[18][4] > 0) && (PixelMap[18][5] > 0)
			 && (PixelMap[18][6] > 0) && (PixelMap[18][7] > 0) && (PixelMap[18][8] > 0) && (PixelMap[18][9] > 0)) begin
		line18 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line17
	if ((PixelMap[17][0] > 0) && (PixelMap[17][1] > 0) && (PixelMap[17][2] > 0) && (PixelMap[17][3] > 0) && (PixelMap[17][4] > 0) && (PixelMap[17][5] > 0)
			 && (PixelMap[17][6] > 0) && (PixelMap[17][7] > 0) && (PixelMap[17][8] > 0) && (PixelMap[17][9] > 0)) begin
		line17 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line16
	if ((PixelMap[16][0] > 0) && (PixelMap[16][1] > 0) && (PixelMap[16][2] > 0) && (PixelMap[16][3] > 0) && (PixelMap[16][4] > 0) && (PixelMap[16][5] > 0)
			 && (PixelMap[16][6] > 0) && (PixelMap[16][7] > 0) && (PixelMap[16][8] > 0) && (PixelMap[16][9] > 0)) begin
		line16 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line15
	if ((PixelMap[15][0] > 0) && (PixelMap[15][1] > 0) && (PixelMap[15][2] > 0) && (PixelMap[15][3] > 0) && (PixelMap[15][4] > 0) && (PixelMap[15][5] > 0)
			 && (PixelMap[15][6] > 0) && (PixelMap[15][7] > 0) && (PixelMap[15][8] > 0) && (PixelMap[15][9] > 0)) begin
		line15 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line14
	if ((PixelMap[14][0] > 0) && (PixelMap[14][1] > 0) && (PixelMap[14][2] > 0) && (PixelMap[14][3] > 0) && (PixelMap[14][4] > 0) && (PixelMap[14][5] > 0)
			 && (PixelMap[14][6] > 0) && (PixelMap[14][7] > 0) && (PixelMap[14][8] > 0) && (PixelMap[14][9] > 0)) begin
		line14 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line13
	if ((PixelMap[13][0] > 0) && (PixelMap[13][1] > 0) && (PixelMap[13][2] > 0) && (PixelMap[13][3] > 0) && (PixelMap[13][4] > 0) && (PixelMap[13][5] > 0)
			 && (PixelMap[13][6] > 0) && (PixelMap[13][7] > 0) && (PixelMap[13][8] > 0) && (PixelMap[13][9] > 0)) begin
		line13 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line12
	if ((PixelMap[12][0] > 0) && (PixelMap[12][1] > 0) && (PixelMap[12][2] > 0) && (PixelMap[12][3] > 0) && (PixelMap[12][4] > 0) && (PixelMap[12][5] > 0)
			 && (PixelMap[12][6] > 0) && (PixelMap[12][7] > 0) && (PixelMap[12][8] > 0) && (PixelMap[12][9] > 0)) begin
		line12 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line11
	if ((PixelMap[11][0] > 0) && (PixelMap[11][1] > 0) && (PixelMap[11][2] > 0) && (PixelMap[11][3] > 0) && (PixelMap[11][4] > 0) && (PixelMap[11][5] > 0)
			 && (PixelMap[11][6] > 0) && (PixelMap[11][7] > 0) && (PixelMap[11][8] > 0) && (PixelMap[11][9] > 0)) begin
		line11 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line10
	if ((PixelMap[10][0] > 0) && (PixelMap[10][1] > 0) && (PixelMap[10][2] > 0) && (PixelMap[10][3] > 0) && (PixelMap[10][4] > 0) && (PixelMap[10][5] > 0)
			 && (PixelMap[10][6] > 0) && (PixelMap[10][7] > 0) && (PixelMap[10][8] > 0) && (PixelMap[10][9] > 0)) begin
		line10 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line9
	if ((PixelMap[9][0] > 0) && (PixelMap[9][1] > 0) && (PixelMap[9][2] > 0) && (PixelMap[9][3] > 0) && (PixelMap[9][4] > 0) && (PixelMap[9][5] > 0)
			 && (PixelMap[9][6] > 0) && (PixelMap[9][7] > 0) && (PixelMap[9][8] > 0) && (PixelMap[9][9] > 0)) begin
		line9 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line8
	if ((PixelMap[8][0] > 0) && (PixelMap[8][1] > 0) && (PixelMap[8][2] > 0) && (PixelMap[8][3] > 0) && (PixelMap[8][4] > 0) && (PixelMap[8][5] > 0)
			 && (PixelMap[8][6] > 0) && (PixelMap[8][7] > 0) && (PixelMap[8][8] > 0) && (PixelMap[8][9] > 0)) begin
		line8 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line7
	if ((PixelMap[7][0] > 0) && (PixelMap[7][1] > 0) && (PixelMap[7][2] > 0) && (PixelMap[7][3] > 0) && (PixelMap[7][4] > 0) && (PixelMap[7][5] > 0)
			 && (PixelMap[7][6] > 0) && (PixelMap[7][7] > 0) && (PixelMap[7][8] > 0) && (PixelMap[7][9] > 0)) begin
		line7 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line6
	if ((PixelMap[6][0] > 0) && (PixelMap[6][1] > 0) && (PixelMap[6][2] > 0) && (PixelMap[6][3] > 0) && (PixelMap[6][4] > 0) && (PixelMap[6][5] > 0)
			 && (PixelMap[6][6] > 0) && (PixelMap[6][7] > 0) && (PixelMap[6][8] > 0) && (PixelMap[6][9] > 0)) begin
		line6 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line5
	if ((PixelMap[5][0] > 0) && (PixelMap[5][1] > 0) && (PixelMap[5][2] > 0) && (PixelMap[5][3] > 0) && (PixelMap[5][4] > 0) && (PixelMap[5][5] > 0)
			 && (PixelMap[5][6] > 0) && (PixelMap[5][7] > 0) && (PixelMap[5][8] > 0) && (PixelMap[5][9] > 0)) begin
		line5 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line4
	if ((PixelMap[4][0] > 0) && (PixelMap[4][1] > 0) && (PixelMap[4][2] > 0) && (PixelMap[4][3] > 0) && (PixelMap[4][4] > 0) && (PixelMap[4][5] > 0)
			 && (PixelMap[4][6] > 0) && (PixelMap[4][7] > 0) && (PixelMap[4][8] > 0) && (PixelMap[4][9] > 0)) begin
		line4 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line3
	if ((PixelMap[3][0] > 0) && (PixelMap[3][1] > 0) && (PixelMap[3][2] > 0) && (PixelMap[3][3] > 0) && (PixelMap[3][4] > 0) && (PixelMap[3][5] > 0)
			 && (PixelMap[3][6] > 0) && (PixelMap[3][7] > 0) && (PixelMap[3][8] > 0) && (PixelMap[3][9] > 0)) begin
		line3 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line2
	if ((PixelMap[2][0] > 0) && (PixelMap[2][1] > 0) && (PixelMap[2][2] > 0) && (PixelMap[2][3] > 0) && (PixelMap[2][4] > 0) && (PixelMap[2][5] > 0)
			 && (PixelMap[2][6] > 0) && (PixelMap[2][7] > 0) && (PixelMap[2][8] > 0) && (PixelMap[2][9] > 0)) begin
		line2 = 1'b1;
		NeedsClear = 1'b1;
	end
		
	// Check line1
	if ((PixelMap[1][0] > 0) && (PixelMap[1][1] > 0) && (PixelMap[1][2] > 0) && (PixelMap[1][3] > 0) && (PixelMap[1][4] > 0) && (PixelMap[1][5] > 0)
			 && (PixelMap[1][6] > 0) && (PixelMap[1][7] > 0) && (PixelMap[1][8] > 0) && (PixelMap[1][9] > 0)) begin
		line1 = 1'b1;
		NeedsClear = 1'b1;
	end

	// Check line0
	if ((PixelMap[0][0] > 0) && (PixelMap[0][1] > 0) && (PixelMap[0][2] > 0) && (PixelMap[0][3] > 0) && (PixelMap[0][4] > 0) && (PixelMap[0][5] > 0)
			 && (PixelMap[0][6] > 0) && (PixelMap[0][7] > 0) && (PixelMap[0][8] > 0) && (PixelMap[0][9] > 0)) begin
		line0 = 1'b1;
		NeedsClear = 1'b1;
	end
end

/*** CHECK LOAD *** *** CHECK BLOCK: STOP X MOVEMENT ***/
// scale down the shape_x and shape_y to the smaller version
logic [9:0] scaled_x, scaled_y, offset_x, offset_y;
logic [4:0] be = 16;
logic [9:0] shape_x_board = 250;
logic [9:0] shape_y_board = 100;	

always_ff @ (posedge Clk)
begin
	NeedsLoad <= 1'b0;
//	stop_x_left <= 1'b0;
//	stop_x_right <= 1'b0;

	offset_x <= (shape_x - shape_x_board);
	offset_y <= (shape_y - shape_y_board);
	scaled_x <= (offset_x - (offset_x%be))/be;
	scaled_y <= (offset_y - (offset_y%be))/be;
	
	if (touchdown) begin
		NeedsLoad <= 1'b1;
	end
		
	else 
	begin
		case(shape_num)
			// I BLOCK
			3'd1 : begin
						if (shape_rot == 2'd0 || shape_rot == 2'd2) 
						begin // I_block_h: 1x4.. one higher than leftmost block???
							if ((PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+3] > 0))
								NeedsLoad <= 1'b1;
							if (PixelMap[scaled_y-1][scaled_x-1] > 0)
								stop_x_left <= 1'b1;
							if (PixelMap[scaled_y-1][scaled_x+4] >0)
								stop_x_right <= 1'b1;
								
							if (PixelMap[scaled_y-1][scaled_x-1] == 0)
								stop_x_left <= 1'b0;
							if (PixelMap[scaled_y-1][scaled_x+4] == 0)
								stop_x_right <= 1'b0;
						end
						
						else 
						begin // I_block_v: 4x1.. ref coord = 2nd from top
							if (PixelMap[scaled_y+3][scaled_x] > 0)
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x-1] > 0) || (PixelMap[scaled_y+2][scaled_x-1] > 0)) 
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0))
								stop_x_right <= 1'b1;		
		
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x-1] == 0) && (PixelMap[scaled_y+2][scaled_x-1] == 0)) 
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+1] == 0) && (PixelMap[scaled_y][scaled_x+1] == 0) && (PixelMap[scaled_y+1][scaled_x+1] == 0) && (PixelMap[scaled_y+2][scaled_x+1] == 0))
								stop_x_right <= 1'b0;
						end
					end
					
			// O BLOCK.. ref coord = bottom left
			3'd2 : begin
						if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0))
							NeedsLoad <= 1'b1;
						if ((PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y-1][scaled_x-1] > 0))
							stop_x_left <= 1'b1;
						if ((PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y-1][scaled_x+2] > 0))
							stop_x_right <= 1'b1;	
	
						if ((PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y-1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
						if ((PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y-1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
					end
					
			// J BLOCK
			3'd3 : begin
						if (shape_rot == 2'd0) // J_block_0: ref coord = bottom left
							begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y-1][scaled_x+1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x+3] > 0) || (PixelMap[scaled_y-1][scaled_x+3] > 0))
								stop_x_right <= 1'b1;	
	
							if ((PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y-1][scaled_x+1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y][scaled_x+3] == 0) && (PixelMap[scaled_y-1][scaled_x+3] == 0))
								stop_x_right <= 1'b0;	
						end
						
						else if (shape_rot == 2'd1) // J_block_1: ref coord = 2nd from bottom
						begin
							if ((PixelMap[scaled_y+2][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0))
								stop_x_right <= 1'b1;						
						
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+1] == 0) && (PixelMap[scaled_y+1][scaled_x+1] == 0))
								stop_x_right <= 1'b0;	
						end
						
						else if (shape_rot == 2'd2) // J_block_2: ref coord = one down from leftmost (not part of the shape)
						begin
							if ((PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+3] > 0) || (PixelMap[scaled_y][scaled_x+3] > 0))
								stop_x_right <= 1'b1;	
	
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+3] > 0) && (PixelMap[scaled_y][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else begin	// J_block_3: ref coord = one left from middle block (middle block = one down from topmost).. not part of the shape
							if ((PixelMap[scaled_y+2][scaled_x] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y+1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y-1][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								stop_x_right <= 1'b1;			
	
							if ((PixelMap[scaled_y+1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x] == 0) && (PixelMap[scaled_y-1][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
			
					end
									
	
			// L_BLOCK
			3'd4 : begin
						if (shape_rot == 2'd0) // L_block_0: ref coord = leftmost
							begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x-1] > 0)  || (PixelMap[scaled_y-1][scaled_x+1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x+3] > 0) || (PixelMap[scaled_y-1][scaled_x+3] > 0))
								stop_x_right <= 1'b1;		
		
							if ((PixelMap[scaled_y][scaled_x-1] == 0)  && (PixelMap[scaled_y-1][scaled_x+1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y][scaled_x+3] == 0) && (PixelMap[scaled_y-1][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if (shape_rot == 2'd1) // L_block_1: ref coord = one down from topmost
						begin
							if ((PixelMap[scaled_y+2][scaled_x] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+1] == 0) && (PixelMap[scaled_y][scaled_x+1] == 0) && (PixelMap[scaled_y+1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if (shape_rot == 2'd2) // L_block_2: ref coord = leftmost bottom
						begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x+1] > 0) || (PixelMap[scaled_y-1][scaled_x+3] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y][scaled_x+1] == 0) && (PixelMap[scaled_y-1][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else begin	// L_block_3: ref coord = one down from top left (not part of shape)
							if ((PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x+1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x] == 0) && (PixelMap[scaled_y][scaled_x+1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
			
					end
				
			
			// S_BLOCK
			3'd5 : begin
						if ((shape_rot == 2'd0) || (shape_rot == 2'd2)) // S_block_0: ref coord = bottom left
							begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y-1][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y-1][scaled_x+3] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y-1][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y-1][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if ((shape_rot == 2'd1) || (shape_rot == 2'd3)) // S_block_1: ref coord = left middle
						begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								stop_x_right <= 1'b1;

							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+1] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
					 end
					 		
			// Z_BLOCK
			3'd7 : begin
						if (shape_rot == 2'd0 || shape_rot == 2'd2) // Z_block_0: ref coord = second from bottom left
						begin
							if ((PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+3] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if (shape_rot == 2'd1 || shape_rot == 2'd3) // Z_block_1: ref coord = one below top leftmost (not part of shape)
						begin
							if ((PixelMap[scaled_y+2][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0))
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+1] == 0))
								stop_x_right <= 1'b0;
						end
					 end

			
			// T_BLOCK
			3'd6 : begin
						if (shape_rot == 2'd0) // T_block_0 (upright piece): ref coord = bottom left
							begin
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0)) 
								NeedsLoad <= 1'b1;		
							if ((PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y-1][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+3] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y-1][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+3] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if (shape_rot == 2'd1) // T_block_1 (nose facing right): ref coord = center 
						begin
							if ((PixelMap[scaled_y+2][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x-1] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x-1] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+1] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+1] == 0))
								stop_x_right <= 1'b0;
						end
						
						else if (shape_rot == 2'd2) // T_block_2 (nose facing down): ref coord = bottom left (not part of shape)
						begin
							if ((PixelMap[scaled_y][scaled_x] > 0) || (PixelMap[scaled_y+1][scaled_x+1] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x-1] > 0) || (PixelMap[scaled_y][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+3] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x-1] == 0) && (PixelMap[scaled_y][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+3] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
						
						else begin	// T_block_3 (nose facing left): ref coord = nose
							if ((PixelMap[scaled_y+1][scaled_x] > 0) || (PixelMap[scaled_y+2][scaled_x+1] > 0)) 
								NeedsLoad <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x] > 0) || (PixelMap[scaled_y][scaled_x-1] > 0) || (PixelMap[scaled_y+1][scaled_x] > 0))
								stop_x_left <= 1'b1;
							if ((PixelMap[scaled_y-1][scaled_x+2] > 0) || (PixelMap[scaled_y][scaled_x+2] > 0) || (PixelMap[scaled_y+1][scaled_x+2] > 0))
								stop_x_right <= 1'b1;
								
							if ((PixelMap[scaled_y-1][scaled_x] == 0) && (PixelMap[scaled_y][scaled_x-1] == 0) && (PixelMap[scaled_y+1][scaled_x] == 0))
								stop_x_left <= 1'b0;
							if ((PixelMap[scaled_y-1][scaled_x+2] == 0) && (PixelMap[scaled_y][scaled_x+2] == 0) && (PixelMap[scaled_y+1][scaled_x+2] == 0))
								stop_x_right <= 1'b0;
						end
			
					end
									
			default : ;
		endcase
	end

end

///*** CHECK BLOCK: STOP X MOVEMENT ***/
//logic [9:0] rescaled_y, rescaled_x, reoffset_x, reoffset_y;
//always_comb
//begin
//	stop_x_left = 1'b0;
//	stop_x_right = 1'b0;
//
//	reoffset_x = (shape_x - shape_x_board);
//	reoffset_y = (shape_y - shape_y_board);
//	rescaled_x = (reoffset_x - (reoffset_x%be))/be;
//	rescaled_y = (reoffset_y - (reoffset_y%be))/be;
//
//	case(shape_num)
//		// I BLOCK
//		3'd1 : begin
//					if (shape_rot == 2'd0 || shape_rot == 2'd2) 
//					begin // I_block_h: 1x4.. one higher than leftmost block???
//						if (PixelMap[rescaled_y-1][rescaled_x-1] > 0)
//							stop_x_left = 1'b1;
//						if (PixelMap[rescaled_y-1][rescaled_x+4] >0)
//							stop_x_right = 1'b1;
//					end
//					
//					else 
//					begin // I_block_v: 4x1.. ref coord = 2nd from top
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x-1] > 0) || (PixelMap[rescaled_y+2][rescaled_x-1] > 0)) 
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+1] > 0) || (PixelMap[rescaled_y][rescaled_x+1] > 0) || (PixelMap[rescaled_y+1][rescaled_x+1] > 0) || (PixelMap[rescaled_y+2][rescaled_x+1] > 0))
//							stop_x_right = 1'b1;
//					end
//				end
//				
//		// O BLOCK.. ref coord = bottom left
//		3'd2 : begin
//					if ((PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y-1][rescaled_x-1] > 0))
//						stop_x_left = 1'b1;
//					if ((PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y-1][rescaled_x+2] > 0))
//						stop_x_right = 1'b1;
//				end
//				
//		// J BLOCK
//		3'd3 : begin
//					if (shape_rot == 2'd0) // J_block_0: ref coord = bottom left
//						begin
//						if ((PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y-1][rescaled_x+1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y][rescaled_x+3] > 0) || (PixelMap[rescaled_y-1][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd1) // J_block_1: ref coord = 2nd from bottom
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+1] > 0) || (PixelMap[rescaled_y+1][rescaled_x+1] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd2) // J_block_2: ref coord = one down from leftmost (not part of the shape)
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+3] > 0) || (PixelMap[rescaled_y][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else begin	// J_block_3: ref coord = one left from middle block (middle block = one down from topmost).. not part of the shape
//						if ((PixelMap[rescaled_y+1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x] > 0) || (PixelMap[rescaled_y-1][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end
//		
//				end
//
//		// L_BLOCK
//		3'd4 : begin
//					if (shape_rot == 2'd0) // L_block_0: ref coord = leftmost
//						begin
//						if ((PixelMap[rescaled_y][rescaled_x-1] > 0)  || (PixelMap[rescaled_y-1][rescaled_x+1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y][rescaled_x+3] > 0) || (PixelMap[rescaled_y-1][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd1) // L_block_1: ref coord = one down from topmost
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+1] > 0) || (PixelMap[rescaled_y][rescaled_x+1] > 0) || (PixelMap[rescaled_y+1][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd2) // L_block_2: ref coord = leftmost bottom
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y][rescaled_x+1] > 0) || (PixelMap[rescaled_y-1][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else begin	// L_block_3: ref coord = one down from top left (not part of shape)
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x] > 0) || (PixelMap[rescaled_y][rescaled_x+1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end 
//		
//				end
//		
//		// S_BLOCK
//		3'd5 : begin
//					if ((shape_rot == 2'd0) || (shape_rot == 2'd2)) // S_block_0: ref coord = bottom left
//						begin
//						if ((PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y-1][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y-1][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if ((shape_rot == 2'd1) || (shape_rot == 2'd3)) // S_block_1: ref coord = left middle
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+1] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end
//				 end
//		
//		// Z_BLOCK
//		3'd7 : begin
//					if (shape_rot == 2'd0 || shape_rot == 2'd2) // Z_block_0: ref coord = one below top leftmost (not part of shape) 
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd1 || shape_rot == 2'd3) // Z_block_1: ref coord = second from bottom left
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+1] > 0))
//							stop_x_right = 1'b1;
//					end
//				 end
//		
//		// T_BLOCK
//		3'd6 : begin
//					if (shape_rot == 2'd0) // T_block_0 (upright piece): ref coord = bottom left
//						begin
//						if ((PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y-1][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+3] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd1) // T_block_1 (nose facing right): ref coord = center 
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x-1] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+1] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+1] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else if (shape_rot == 2'd2) // T_block_2 (nose facing down): ref coord = bottom left (not part of shape)
//					begin
//						if ((PixelMap[rescaled_y-1][rescaled_x-1] > 0) || (PixelMap[rescaled_y][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+3] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end
//					
//					else begin	// T_block_3 (nose facing left): ref coord = nose
//						if ((PixelMap[rescaled_y-1][rescaled_x] > 0) || (PixelMap[rescaled_y][rescaled_x-1] > 0) || (PixelMap[rescaled_y+1][rescaled_x] > 0))
//							stop_x_left = 1'b1;
//						if ((PixelMap[rescaled_y-1][rescaled_x+2] > 0) || (PixelMap[rescaled_y][rescaled_x+2] > 0) || (PixelMap[rescaled_y+1][rescaled_x+2] > 0))
//							stop_x_right = 1'b1;
//					end
//		
//				end
//				
//		default : ;
//	endcase
//
//end



/*** CHECK ENDGAME ***/
// if any pixel in the topmost line is filled, then end the game
//always_ff @ (posedge Clk)
always_comb
begin
	endgame = 1'b0;
	if ((PixelMap[0][0] > 0) || (PixelMap[0][1] > 0) || (PixelMap[0][2] > 0) || (PixelMap[0][3] > 0) || (PixelMap[0][4] > 0) || (PixelMap[0][5] > 0)
			 || (PixelMap[0][6] > 0) || (PixelMap[0][7] > 0) || (PixelMap[0][8] > 0) || (PixelMap[0][9] > 0)) begin
		endgame = 1'b1;
	end
end

endmodule
