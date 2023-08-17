//FSM for determining the screen is doing

module screen (input logic Clk, Reset, game_over,
					input logic [7:0]keycode,
					output logic game_reset,
					output logic [1:0] screen_state);
	 
	 enum logic[1:0] { idle,
							 play,
							 ended} state, next_state;
	 
	always_ff @ (posedge Clk)
	 begin
		 if (Reset) 
			 state <= idle;
		 else 
			 state <= next_state;
	 end 
	 
	always_comb
	 begin
		 next_state = state;
		 
		 
		 unique case(state)
			 idle:
				 if(keycode == 8'h28)
					 next_state = play;
			 play:
				 if (game_over)
					 next_state = ended;
			 
			 ended: 
				 if (keycode == 8'h28)
					 next_state = play;
				 
			 default: ;
		 endcase
	 end 
	 
	 always_ff @ (posedge Clk or posedge Reset)
	  begin
		 unique case(state)
			idle:
			 begin
				 game_reset <= 0;
				 screen_state <= 2'b01;
			 end
			 
			play:
			 begin
				 game_reset <= 0;
				 screen_state <= 2'b10;
			 end
			 
			ended:
			 begin
				 screen_state = 2'b11;
				 if (keycode == 8'h28)
					game_reset <= 1;
			 end
			 default: ;
			
		 endcase
	  
	  end
endmodule 