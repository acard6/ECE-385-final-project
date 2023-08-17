module rotating (input logic 			Reset, Clk, 
					  input logic [7:0] 	keycode,
					  output logic[1:0] 	rotation);
		
	 enum logic[2:0] {rot_01,
							rot_02,
							rot_11,
							rot_12,
							rot_21,
							rot_22,
							rot_31,
							rot_32} state, next_state;
	 
	 logic [7:0] rotate = 8'h1a;
	 
	 always_ff @ (posedge Clk or posedge Reset) begin 
		 if (Reset)
			 state <= rot_01;
		 else
			 state <= next_state;
	 end 
	 
	 always_comb begin 
		 next_state = state;
		 unique case (state)
			 rot_01:
				 if (keycode == rotate)
					 next_state = rot_02;
			 rot_02:
				 if (keycode == 8'h0)
					 next_state = rot_11;
				
			 rot_11:
				 if (keycode == rotate)
					 next_state = rot_12;			 
			 rot_12:
				 if (keycode == 8'h0)
					 next_state = rot_21;	
				
			 rot_21:
				 if (keycode == rotate)
					 next_state = rot_22;			 
			 rot_22:
				 if (keycode == 8'h0)
					 next_state = rot_31;			 
			 
			 rot_31:
				 if (keycode == rotate)
					 next_state = rot_32;			 
			 rot_32:
				 if (keycode == 8'h0)
					 next_state = rot_01;
			 default: ;
		 endcase
					 
	 end 
	 
	 always_ff @ (posedge Clk or posedge Reset) begin 
		 rotation <= 2'b00;
		 case(state)
			 
			 rot_01:
				 rotation <= 2'b00;
			 
			 rot_11:
				 rotation <= 2'b01;
			 
			 rot_21:
				 rotation <= 2'b10;
			 
			 rot_31:
				 rotation <= 2'b11;
			 
			 default: ;
		 endcase
	 
	 end
	 
endmodule 