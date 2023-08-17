//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  block(input Reset, frame_clk, shape_reset, game_reset, stop_x_left, stop_x_right,
					input [1:0] state, 
					input [2:0] keypress,
					input [13:0] Score,
					input [9:0] shape_size_x, shape_size_y,
               output [9:0]  shape_x, shape_y,
					output touching);
    
    logic [9:0] Block_X_Pos, Block_Y_Pos;
	 logic [9:0] Block_X_Motion;
	 logic [9:0] Block_Y_Motion;
	 
    parameter [9:0] Block_X_Min= 250;      // Leftmost point on the X axis
    parameter [9:0] Block_X_Max= 410;     // Rightmost point on the X axis
    parameter [9:0] Block_Y_Min= 100;       // Topmost point on the Y axis
    parameter [9:0] Block_Y_Max= 420;     // Bottommost point on the Y axis
    parameter [9:0] x_start = 298;
    parameter [9:0] y_start = 100;
    parameter [9:0] Block_X_Step = 16;  // Step size on the X axis
    parameter [9:0] Block_Y_Step = 16;	// Step size on the Y axis             
	logic [27:0] counter_y, speed_y;
	logic [27:0] counter_x;
	logic act_once_x, act_once_y, accel, accel_spac;
	 
	always_ff @ (posedge Reset or posedge frame_clk)
	begin // Move Decisions
		if (Reset)  // Asynchronous Reset
		 begin 
			Block_X_Motion <= 0;
			Block_Y_Motion <= Block_Y_Step;
			Block_X_Pos <= x_start;
			Block_Y_Pos <= y_start;
			counter_y <= 0;
			counter_x <= 0;
			accel <= 0;
			accel_spac <= 0;
			act_once_x <= 0;
			act_once_y <= 0;
		 end
			
		else
			begin
				if (game_reset)
				 begin
					Block_X_Motion <= 0;
					Block_Y_Motion <= Block_Y_Step;
					Block_X_Pos <= x_start;
					Block_Y_Pos <= y_start;
					act_once_x <= 0;
					act_once_y <= 0;
					counter_x <= 0;
					counter_y <= 0;
					accel <= 0;
					accel_spac <= 0;
				 end
			
				if (state == 2'd2)
				 begin
					if (Score >= 14'd25)
					 begin
						speed_y <= 28'h04fffff;
					 end
					else if (Score >= 14'd20)
					 begin
						speed_y <= 28'h06fffff;
					 end
					else if (Score >= 14'd15)
					 begin
						speed_y <= 28'h08fffff;
					 end
					else if (Score >= 14'd10)
					 begin
						speed_y <= 28'h09fffff;
					 end
					else if (Score >= 14'd5)
					 begin
						speed_y <= 28'h0Afffff;
					 end
					else
						speed_y <= 28'h1ffffff;
					if (touching||shape_reset)
					 begin
						Block_X_Motion <= 0;
						Block_Y_Motion <= Block_Y_Step;
						Block_X_Pos <= x_start;
						Block_Y_Pos <= y_start;
						act_once_x <= 0;
						act_once_y <= 0;
						counter_x <= 0;
						counter_y <= 0;
						accel <= 0;
				 end
						
						//Logic of stop_x_left and stop_x_right
						//If stop_x_left is on, then keypress is useless.

						//Command On Key Press
						if  ((keypress == 3'd1) && ((Block_X_Pos) > (Block_X_Min)) && (~act_once_x)) //'a' 
							begin
							if  (~stop_x_left)
								begin
								Block_X_Motion <= (~ (Block_X_Step) + 1'b1);
								end
							act_once_x <= 1'b1;
							end
						
						else if ((keypress == 3'd2) && ((Block_X_Pos + shape_size_x) < Block_X_Max) && (~act_once_x)) //'d'
							begin
							if (~stop_x_right)
								begin
									Block_X_Motion <= Block_X_Step;
								end
							act_once_x <= 1'b1;
							end
						
						else if ((keypress == 3'd3) && ((Block_Y_Pos + shape_size_y) < Block_Y_Max) && (~act_once_y)) //'s'
							begin
							accel <= 1'b1;
							act_once_y <= 1'b1;
							end
								
						else if ((keypress == 3'd4) && ~(accel_spac)) // 'SPACE BAR'
							accel_spac <= 1'b1;
								
						// X MOTION BOUNDARIES
						// Pixel Map Side Collision Check
						else if (((Block_X_Pos + shape_size_x) >= Block_X_Max) && (~act_once_x) && (Block_X_Motion > 0))  // Block is at the right edge, Stop. 
								begin
								act_once_x <= 1'b1;
								Block_X_Motion <= 10'd0;
								end
						else if ((Block_X_Pos <= Block_X_Min) && (~act_once_x) && (Block_X_Motion < 0)) // Block is at the left edge, Stop. 
							  begin
							  act_once_x <= 1'b1;
							  Block_X_Motion <= 10'd0;
							  end
						
						else if ((~act_once_x)&&(~keypress)&&(Block_X_Motion))
							begin
							Block_X_Motion <= 0;
							end						
							
					
						// Y MOTION BOUNDARIES
						if ((Block_Y_Pos) <= (Block_Y_Min))  // Block is at Top Edge, move down
							  Block_Y_Motion <=  Block_Y_Step;
							  
						else if ((Block_Y_Pos + shape_size_y) >= Block_Y_Max + Block_Y_Step)  // Block is at the bottom edge, Stop.
							  begin
							  Block_Y_Motion <= 10'd0;
							  Block_X_Motion <= 10'd0;
							  end
	
						//Update Movement Y DIRECTION
						if ((counter_y == 28'h00fffff) && (accel_spac))
							begin
							if (~shape_reset)
									Block_Y_Pos <= (Block_Y_Pos + Block_Y_Motion);
							else
								begin
									counter_y <= 0;
									accel_spac <= 0;
								end
							end
						
						else if ((counter_y == 28'h03fffff) && (accel))
							begin
							Block_Y_Pos <= (Block_Y_Pos + Block_Y_Motion);
							counter_y <= 0;
							act_once_y <= 0;
							accel <= 0;
							end
						
						else if (counter_y == speed_y)
							begin
							Block_Y_Pos <= (Block_Y_Pos + Block_Y_Motion);
							counter_y <= 0;
							end
						else
							counter_y <= counter_y + 1;

						//Update Movement X DIRECTION
						if (Block_X_Pos + shape_size_x > Block_X_Max)
							begin
							Block_X_Pos <= (Block_X_Max - shape_size_x);
							end
						
						else if ((counter_x == 28'h00fffff) && (act_once_x))
							begin
							Block_X_Pos <= (Block_X_Pos + Block_X_Motion);
							act_once_x <= 0;
							counter_x <= 0;
							end
						
						else if (act_once_x)
							counter_x <= counter_x + 1;
							
						
						//touched ground Check
						if (Block_Y_Motion == 10'd0)
							begin
							touching <= 1'b1;
							accel_spac <= 1'b0;
							end
						else
							touching <= 1'b0;
					end
				end
end

	assign shape_x = Block_X_Pos;
	assign shape_y = Block_Y_Pos;

	 
/**
    assign Ball_Size = 10'd10;  // assigns the value 10 as a 10-digit binary number, ie "0000001010"
	 
	 logic [1:0] screen;
	 assign screen = 2'b00;
	 
	 if (keycode == 8'h28)
		 assign screen = ~screen;
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion 	<= Ball_Y_Step;
				Ball_X_Motion 	<= 10'd0;
				Ball_Y_Pos 		<= Ball_Y_Center;
				Ball_X_Pos 		<= Ball_X_Center;
        end
		  
		  //the screen is set to the play stage
		  else 
				if (reset_game)
				begin
					Ball_X_Motion 	<= 10'0;
					Ball_Y_Motion 	<= Ball_Y_Step;
					Ball_X_Pos 		<= Ball_X_Center;
					Ball_Y_Pos 		<= Ball_Y_Center;
				end
				 if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, stops
				  begin
					  Ball_Y_Motion <= 0;//(~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					  Ball_Y_Pos <= Ball_Y_Pos - 1'b1;
				  end
				 else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the Right edge, stops
				  begin
					  Ball_X_Motion <= 0;//(~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  Ball_X_Pos <= Ball_X_Pos - 1'b1;
				  end
				 else if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min )  // Ball is at the Left edge, stops
				  begin
					  Ball_X_Motion <= 0;//Ball_X_Step;
					  Ball_X_Pos <= Ball_X_Pos + 1'b1;
				  end
				 else 
					  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
				 
				 case (keycode)
					8'h04 : begin
								Ball_X_Motion <= -1;//A
								Ball_Y_Motion<= 0;
							  end
					8'h07 : begin
					        Ball_X_Motion <= 1;//D
							  Ball_Y_Motion <= 0;
							  end
					8'h16 : begin
					        Ball_Y_Motion <= 1;//S
							  Ball_X_Motion <= 0;
							 end
					8'h1A : begin
					        Ball_Y_Motion <= -1;//W
							  Ball_X_Motion <= 0;
							 end	  
					8'h08	: begin
							  Ball_Y_Motion <= 0;//E pauses in place
							  Ball_X_Motion <= 0;
							 end	 
					default: ;
			   endcase
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
		end 
    end	 //end of always_ff

    assign BallX = Ball_X_Pos;
    assign BallY = Ball_Y_Pos;
    assign BallS = Ball_Size;
*/

endmodule
