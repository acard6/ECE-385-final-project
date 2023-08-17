module block_shape(input [2:0] shape_num,
						 input [1:0] rotation,
						 output logic [9:0] shape_size_x, shape_size_y);
						 
	always_comb
	 begin
		shape_size_x = 10'b0;
		shape_size_y = 10'b0;
		
		if ((shape_num == 3'b001) && (rotation == 2'b00) || (rotation == 2'b10))
		//horizontal I-tetromino
		 begin
			shape_size_x = 10'd64;
			shape_size_y = 10'd16;
		 end
		 
		else if ((shape_num == 3'b001) && (rotation == 2'b01) || (rotation == 2'b11))
		//vertical I-tetromino
		 begin
			shape_size_x = 10'd16;
			shape_size_y = 10'd64;
		 end
		
		else if (shape_num == 3'b010) 
		// O-tetromino
		 begin
		 shape_size_x = 10'd32;
		 shape_size_y = 10'd32;
		 end
		 
		else if (shape_num == 3'b011)
		// J-tetromino
		 begin
			case (rotation)
				2'b00:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b01:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				2'b10:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b11:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				default: ;
			endcase
		 end
		 
		else if (shape_num == 3'b100)
		// L-tetromino
		 begin
			case (rotation)
				2'b00:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b01:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				2'b10:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b11:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				default: ;
			endcase
		 end
	 
		else if (shape_num == 3'b101)
		// S-tetromino
		 begin
			case (rotation)
				2'b00:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b01:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				2'b10:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b11:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				default: ;
			endcase
		 end
		 
		else if (shape_num == 3'b110)
		// T-tetromino
		 begin
			case (rotation)
				2'b00:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b01:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				2'b10:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b11:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				default: ;
			endcase
		 end
		 
		else if (shape_num == 3'b111)
		// Z-tetromino
		 begin
			case (rotation)
				2'b00:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b01:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end
				2'b10:
				 begin
					shape_size_x = 10'd48;
					shape_size_y = 10'd32;
				 end
				2'b11:
				 begin
					shape_size_x = 10'd32;
					shape_size_y = 10'd48;
				 end	
				default: ;
			endcase
		 end
	 end
endmodule 