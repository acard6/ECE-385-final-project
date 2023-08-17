//a key buffer for key press and gives each useable key a name 
//so that only those keys are used as a constant name

module keywait(input Clk, Reset,
					input logic [7:0] keycode,
					output logic [2:0] key);
					
	 enum logic[3:0] {idle,
							key_A1, 
							key_A2, 
							key_S1, 
							key_S2, 
							key_D1, 
							key_D2,
							key_space1,
							key_space2} state, next_state;
	 
	 always_ff @ (posedge Clk or posedge Reset) begin
		 if (Reset)
			 state <= idle;
		 else
			 state <= next_state;
	 end
		
	 always_comb begin
		 next_state = state;
		 unique case(state)
			 idle:
			  begin
			 	 if (keycode == 8'h04) //A
					 next_state = key_A1;
				 
				 else if (keycode == 8'h07) //D
					 next_state = key_D1;
			  
				 else if (keycode == 8'h16) //S
					 next_state = key_S1;
					
				 else if (keycode == 8'h2c)
					 next_state = key_space1;
			  end
			 
			 key_A1:
				 next_state = key_A2;
			 key_A2:
			 begin
			 	 if (keycode == 8'h0)
					 next_state = idle;
			 end
			 
			 key_D1:
				 next_state = key_D2;
			 key_D2:
			 begin
			 	 if (keycode == 8'h0)
					 next_state = idle;
			 end
			 
			 key_S1:
				 next_state = key_S2;
			 key_S2:
			 begin
			 	 if (keycode == 8'h0)
					 next_state = idle;
			 end
			 
			 key_space1:
				 next_state = key_space2;
			 key_space2:
			 begin
				 if (keycode == 8'h0)
					 next_state = idle;
			 end
			 
			 default: ;
		 endcase
	 
	 end
	 
	 always_comb
	  begin
		 key = 3'b00;
		 
		 unique case (state)
			 key_A1:
				 key = 3'd1;
			
			 key_D1:
				 key = 3'd2;
			
			 key_S1:
				 key = 3'd3;
			
			 key_space1:
				 key = 3'd4;
			 default: ;
		 endcase
	  end

endmodule 