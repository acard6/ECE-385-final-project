module random_piece( input Clk, Reset, shape_reset, game_over, touching, 
							output [2:0] shape_num, next_shape, next_shape2);
	
	logic [99:0][3:0] pieces;
	logic [9:0] pointer = 10'b0;
	logic activate;
	logic [9:0] plimit = 10'd101;
	logic [9:0] counter;
	logic [9:0] snext = 10'd1;
	logic [9:0] snext2 = 10'd2;
	logic [9:0] curr = 10'd0;

	assign shape_num = pieces[pointer];
	assign next_shape = pieces[snext];
	assign next_shape2 = pieces[snext2];
	
	always_comb
	 begin
		 pieces = '{0,7,7,1,5,4,7,5,1,1,
						3,3,6,1,3,5,6,3,4,4,
						4,3,3,5,5,1,3,4,5,1,
						6,6,7,5,4,2,3,1,5,5,
						6,2,6,5,6,5,6,3,2,6,
						1,3,7,4,7,5,4,6,5,7,
						4,3,1,6,6,7,2,1,7,7,
						6,3,4,3,1,7,3,1,3,5,
						1,2,3,3,4,7,6,1,6,5,
						7,4,2,2,4,1,2,3,1,7};
	 end


	always_ff @ (posedge Clk or posedge Reset)
	 begin
		if(Reset)
		 begin
			counter <= 10'b0;
			activate <= 1'b0;
		 end
		 
		else if (game_over)
		 begin
			counter <= 10'b0;
			activate <= 1'b0;
		 end
	 
		else if (activate)
		 begin
			if (counter == 10'd20)
			 begin
				activate <= 1'b1;
				counter <= 10'd0;
				curr <= curr + 1'b1;
				pointer <= curr + 1'b0;
				snext <= curr + 1'b1;
				snext2 <= curr + 2'b10;
				
				if (curr >= plimit)
					curr <= curr - plimit;
				
				if (snext >= plimit)
					snext <= snext - plimit;
					
				if (snext2 >= plimit)
					snext2 <= snext2 - plimit;
			 end
			else
				counter <= counter + 1'b1;
		 end

		else if (touching || shape_reset)
			activate <= 1'b1;
	 
	 end

endmodule 