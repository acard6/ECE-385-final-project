// Module to control Block and Pixelmap
module Datapath_state_machine(input logic Clk, Reset, NeedsClear, NeedsLoad, reset_game,
										input logic line0, line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11, line12, line13, 
														line14, line15, line16, line17, line18, line19,
										output logic [1:0] Mux_Select,
										output logic [13:0] Score,
										//output logic MoveBlock,
										output logic LoadRealReg, LoadAll, Load0, Load1, Load2, Load3, Load4, Load5, Load6, Load7, Load8, Load9, Load10, Load11, Load12, 
														 Load13, Load14, Load15, Load16, Load17, Load18, Load19, ResetShape);

// if any of the lines are all full, go to ActivateClear after ActivateLoad. else, swap between Block and Load
	enum logic [7:0] {State_Block, State_Load, State_Reset, //State_Block_Decision, State_Block_Movement, 
							State_Clear_Prep, State_Clear_0, State_Clear_1, State_Clear_2, State_Clear_3, State_Clear_4, State_Clear_5, 
							State_Clear_6, State_Clear_7, State_Clear_8, State_Clear_9, State_Clear_10, State_Clear_11, State_Clear_12, State_Clear_13, State_Clear_14, 
							State_Clear_15, State_Clear_16, State_Clear_17, State_Clear_18, State_Clear_19,
							State_Clear_0_1, State_Clear_1_1, State_Clear_1_2, State_Clear_2_1, State_Clear_2_2, State_Clear_2_3, 
							State_Clear_3_1, State_Clear_3_2, State_Clear_3_3, State_Clear_3_4, State_Clear_4_1, State_Clear_4_2, State_Clear_4_3, State_Clear_4_4, 
							State_Clear_4_5, State_Clear_5_1, State_Clear_5_2, State_Clear_5_3, State_Clear_5_4, State_Clear_5_5, State_Clear_5_6, 
							State_Clear_6_1, State_Clear_6_2, State_Clear_6_3, State_Clear_6_4, State_Clear_6_5, State_Clear_6_6, State_Clear_6_7, 
							State_Clear_7_1, State_Clear_7_2, State_Clear_7_3, State_Clear_7_4, State_Clear_7_5, State_Clear_7_6, State_Clear_7_7, State_Clear_7_8, 
							State_Clear_8_1, State_Clear_8_2, State_Clear_8_3, State_Clear_8_4, State_Clear_8_5, State_Clear_8_6, State_Clear_8_7, State_Clear_8_8, 
							State_Clear_8_9, State_Clear_9_1, State_Clear_9_2, State_Clear_9_3, State_Clear_9_4, State_Clear_9_5, State_Clear_9_6, State_Clear_9_7, 
							State_Clear_9_8, State_Clear_9_9, State_Clear_9_10, State_Clear_10_1, State_Clear_10_2, State_Clear_10_3, State_Clear_10_4, State_Clear_10_5, 
							State_Clear_10_6, State_Clear_10_7, State_Clear_10_8, State_Clear_10_9, State_Clear_10_10, State_Clear_10_11, State_Clear_11_1, 
							State_Clear_11_2, State_Clear_11_3, State_Clear_11_4, State_Clear_11_5, State_Clear_11_6, State_Clear_11_7, State_Clear_11_8, 
							State_Clear_11_9, State_Clear_11_10, State_Clear_11_11, State_Clear_11_12, State_Clear_12_1, State_Clear_12_2, State_Clear_12_3, 
							State_Clear_12_4, State_Clear_12_5, State_Clear_12_6, State_Clear_12_7, State_Clear_12_8, State_Clear_12_9, State_Clear_12_10, 
							State_Clear_12_11, State_Clear_12_12, State_Clear_12_13, State_Clear_13_1, State_Clear_13_2, State_Clear_13_3, State_Clear_13_4, 
							State_Clear_13_5, State_Clear_13_6, State_Clear_13_7, State_Clear_13_8, State_Clear_13_9, State_Clear_13_10, State_Clear_13_11, 
							State_Clear_13_12, State_Clear_13_13, State_Clear_13_14, State_Clear_14_1, State_Clear_14_2, State_Clear_14_3, State_Clear_14_4, 
							State_Clear_14_5, State_Clear_14_6, State_Clear_14_7, State_Clear_14_8, State_Clear_14_9, State_Clear_14_10, State_Clear_14_11, 
							State_Clear_14_12, State_Clear_14_13, State_Clear_14_14, State_Clear_14_15, State_Clear_15_1, State_Clear_15_2, State_Clear_15_3, 
							State_Clear_15_4, State_Clear_15_5, State_Clear_15_6, State_Clear_15_7, State_Clear_15_8, State_Clear_15_9, State_Clear_15_10, 
							State_Clear_15_11, State_Clear_15_12, State_Clear_15_13, State_Clear_15_14, State_Clear_15_15, State_Clear_15_16, State_Clear_16_1, 
							State_Clear_16_2, State_Clear_16_3, State_Clear_16_4, State_Clear_16_5, State_Clear_16_6, State_Clear_16_7, State_Clear_16_8, 
							State_Clear_16_9, State_Clear_16_10, State_Clear_16_11, State_Clear_16_12, State_Clear_16_13, State_Clear_16_14, State_Clear_16_15, 
							State_Clear_16_16, State_Clear_16_17, State_Clear_17_1, State_Clear_17_2, State_Clear_17_3, State_Clear_17_4, State_Clear_17_5, 
							State_Clear_17_6, State_Clear_17_7, State_Clear_17_8, State_Clear_17_9, State_Clear_17_10, State_Clear_17_11, State_Clear_17_12, 
							State_Clear_17_13, State_Clear_17_14, State_Clear_17_15, State_Clear_17_16, State_Clear_17_17, State_Clear_17_18, State_Clear_18_1, 
							State_Clear_18_2, State_Clear_18_3, State_Clear_18_4, State_Clear_18_5, State_Clear_18_6, State_Clear_18_7, State_Clear_18_8, 
							State_Clear_18_9, State_Clear_18_10, State_Clear_18_11, State_Clear_18_12, State_Clear_18_13, State_Clear_18_14, State_Clear_18_15, 
							State_Clear_18_16, State_Clear_18_17, State_Clear_18_18, State_Clear_18_19, State_Clear_19_1, State_Clear_19_2, State_Clear_19_3, 
							State_Clear_19_4, State_Clear_19_5, State_Clear_19_6, State_Clear_19_7, State_Clear_19_8, State_Clear_19_9, State_Clear_19_10, 
							State_Clear_19_11, State_Clear_19_12, State_Clear_19_13, State_Clear_19_14, State_Clear_19_15, State_Clear_19_16, State_Clear_19_17, 
							State_Clear_19_18, State_Clear_19_19, State_Clear_19_20, 						
							State_Reload} State, Next_State;

	logic [13:0] theScore;	
	assign Score = theScore;
							
	always_ff @ (posedge Clk or posedge Reset or posedge reset_game)
    begin  //Begin Initialization Procedure
		if (Reset||reset_game)
			begin
				State <= State_Block;
				theScore <= 14'b0;
			end
		else
			begin
				State <= Next_State;
				
				case(State) // Increment theScore if the States are any of the clear lines
					State_Clear_0_1: theScore <= theScore + 1'd1; 
					State_Clear_1_1: theScore <= theScore + 1'd1;
					State_Clear_2_1: theScore <= theScore + 1'd1; 
					State_Clear_3_1: theScore <= theScore + 1'd1;
					State_Clear_4_1: theScore <= theScore + 1'd1;
					State_Clear_5_1: theScore <= theScore + 1'd1;
					State_Clear_6_1: theScore <= theScore + 1'd1;
					State_Clear_7_1: theScore <= theScore + 1'd1;
					State_Clear_8_1: theScore <= theScore + 1'd1;
					State_Clear_9_1: theScore <= theScore + 1'd1;
					State_Clear_10_1: theScore <= theScore + 1'd1;
					State_Clear_11_1: theScore <= theScore + 1'd1;
					State_Clear_12_1: theScore <= theScore + 1'd1;
					State_Clear_13_1: theScore <= theScore + 1'd1;
					State_Clear_14_1: theScore <= theScore + 1'd1;
					State_Clear_15_1: theScore <= theScore + 1'd1;
					State_Clear_16_1: theScore <= theScore + 1'd1;
					State_Clear_17_1: theScore <= theScore + 1'd1;
					State_Clear_18_1: theScore <= theScore + 1'd1;
					State_Clear_19_1: theScore <= theScore + 1'd1;
				endcase
			end
	 end	
	
	
	always_comb
    begin // Transitions
    Next_State = State;
   
        unique case (State)
				// Does nothing until there are blocks to be loaded
				State_Block:
					begin
						if (NeedsLoad)
							Next_State <= State_Load;
						else 
							Next_State <= State_Block; //State_Block_Decision;
					end
				
//				State_Block_Decision:
//					Next_State <= State_Block_Movement;
//					
//				State_Block_Movement:
//					Next_State <= State_Block;

				// Loads current Block into PixelMap
				State_Load:
					Next_State <= State_Reset;
					
				// Reset Block after Load & Checks for Clear
				State_Reset:
					begin
						if (NeedsClear)
							Next_State <= State_Clear_Prep;
						else
							Next_State <= State_Block;
					end
			
				// Prepare for Clear Stages by Putting current PixelMap into TempPixelMap register
				State_Clear_Prep:
					Next_State <= State_Clear_0;
					
				// Check each line and clear if have to. In each state, if line# is 1, then shift the corresponding # of rows in TempPixelMap
				// line0
				State_Clear_0:
					begin
						if (line0)
							Next_State <= State_Clear_0_1;
						else
							Next_State <= State_Clear_1;
					end
				
				State_Clear_0_1:
					Next_State <= State_Clear_1;	// shifts all_zeros into row0
				
				// line1
				State_Clear_1:
					begin
						if (line1)
							Next_State <= State_Clear_1_1;
						else
							Next_State <= State_Clear_2;
					end
				
				State_Clear_1_1:
					Next_State <= State_Clear_1_2; // shifts row0 into row1
				
				State_Clear_1_2:
					Next_State <= State_Clear_2;	// shifts all_zeros into row0

				// line2
				State_Clear_2:
					begin
						if (line2)
							Next_State <= State_Clear_2_1;
						else
							Next_State <= State_Clear_3;
					end
				
				State_Clear_2_1:
					Next_State <= State_Clear_2_2; // shifts row1 into row2
					
				State_Clear_2_2:
					Next_State <= State_Clear_2_3; // shifts row0 into row1
					
				State_Clear_2_3:
					Next_State <= State_Clear_3;	// shifts all_zeros into row0
					
				// line3
				State_Clear_3:
					begin
						if (line3)
							Next_State <= State_Clear_3_1;
						else
							Next_State <= State_Clear_4;
					end
				
				State_Clear_3_1:
					Next_State <= State_Clear_3_2; // shifts row2 into row3
					
				State_Clear_3_2:
					Next_State <= State_Clear_3_3; // shifts row1 into row2
					
				State_Clear_3_3:
					Next_State <= State_Clear_3_4; // shifts row0 into row1
					
				State_Clear_3_4:
					Next_State <= State_Clear_4;	// shifts all_zeros into row0					
					
				// line4
				State_Clear_4:
					begin
						if (line4)
							Next_State <= State_Clear_4_1;
						else
							Next_State <= State_Clear_5;
					end
				
				State_Clear_4_1:
					Next_State <= State_Clear_4_2;
					
				State_Clear_4_2:
					Next_State <= State_Clear_4_3;
					
				State_Clear_4_3:
					Next_State <= State_Clear_4_4;
					
				State_Clear_4_4:
					Next_State <= State_Clear_4_5;				
					
				State_Clear_4_5:
					Next_State <= State_Clear_5;
					
				// line5
				State_Clear_5:
					begin
						if (line5)
							Next_State <= State_Clear_5_1;
						else
							Next_State <= State_Clear_6;
					end
				
				State_Clear_5_1:
					Next_State <= State_Clear_5_2;
					
				State_Clear_5_2:
					Next_State <= State_Clear_5_3;
					
				State_Clear_5_3:
					Next_State <= State_Clear_5_4;
					
				State_Clear_5_4:
					Next_State <= State_Clear_5_5;				
					
				State_Clear_5_5:
					Next_State <= State_Clear_5_6;
					
				State_Clear_5_6:
					Next_State <= State_Clear_6;
					
				// line6
				State_Clear_6:
					begin
						if (line6)
							Next_State <= State_Clear_6_1;
						else
							Next_State <= State_Clear_7;
					end
				
				State_Clear_6_1:
					Next_State <= State_Clear_6_2;
					
				State_Clear_6_2:
					Next_State <= State_Clear_6_3;
					
				State_Clear_6_3:
					Next_State <= State_Clear_6_4;
					
				State_Clear_6_4:
					Next_State <= State_Clear_6_5;				
					
				State_Clear_6_5:
					Next_State <= State_Clear_6_6;
					
				State_Clear_6_6:
					Next_State <= State_Clear_6_7;
				
				State_Clear_6_7:
					Next_State <= State_Clear_7;
					
				// line7
				State_Clear_7:
					begin
						if (line7)
							Next_State <= State_Clear_7_1;
						else
							Next_State <= State_Clear_8;
					end
				
				State_Clear_7_1:
					Next_State <= State_Clear_7_2;
					
				State_Clear_7_2:
					Next_State <= State_Clear_7_3;
					
				State_Clear_7_3:
					Next_State <= State_Clear_7_4;
					
				State_Clear_7_4:
					Next_State <= State_Clear_7_5;				
					
				State_Clear_7_5:
					Next_State <= State_Clear_7_6;
					
				State_Clear_7_6:
					Next_State <= State_Clear_7_7;
				
				State_Clear_7_7:
					Next_State <= State_Clear_7_8;
					
				State_Clear_7_8:
					Next_State <= State_Clear_8;

				// line8
				State_Clear_8:
					begin
						if (line8)
							Next_State <= State_Clear_8_1;
						else
							Next_State <= State_Clear_9;
					end
				
				State_Clear_8_1:
					Next_State <= State_Clear_8_2;
					
				State_Clear_8_2:
					Next_State <= State_Clear_8_3;
					
				State_Clear_8_3:
					Next_State <= State_Clear_8_4;
					
				State_Clear_8_4:
					Next_State <= State_Clear_8_5;				
					
				State_Clear_8_5:
					Next_State <= State_Clear_8_6;
					
				State_Clear_8_6:
					Next_State <= State_Clear_8_7;
				
				State_Clear_8_7:
					Next_State <= State_Clear_8_8;
					
				State_Clear_8_8:
					Next_State <= State_Clear_8_9;
				
				State_Clear_8_9:
					Next_State <= State_Clear_9;

				// line9
				State_Clear_9:
					begin
						if (line9)
							Next_State <= State_Clear_9_1;
						else
							Next_State <= State_Clear_10;
					end
				
				State_Clear_9_1:
					Next_State <= State_Clear_9_2;
					
				State_Clear_9_2:
					Next_State <= State_Clear_9_3;
					
				State_Clear_9_3:
					Next_State <= State_Clear_9_4;
					
				State_Clear_9_4:
					Next_State <= State_Clear_9_5;				
					
				State_Clear_9_5:
					Next_State <= State_Clear_9_6;
					
				State_Clear_9_6:
					Next_State <= State_Clear_9_7;
				
				State_Clear_9_7:
					Next_State <= State_Clear_9_8;
					
				State_Clear_9_8:
					Next_State <= State_Clear_9_9;
				
				State_Clear_9_9:
					Next_State <= State_Clear_9_10;
				
				State_Clear_9_10:
					Next_State <= State_Clear_10;

				// line10
				State_Clear_10:
					begin
						if (line10)
							Next_State <= State_Clear_10_1;
						else
							Next_State <= State_Clear_11;
					end
				
				State_Clear_10_1:
					Next_State <= State_Clear_10_2;
					
				State_Clear_10_2:
					Next_State <= State_Clear_10_3;
					
				State_Clear_10_3:
					Next_State <= State_Clear_10_4;
					
				State_Clear_10_4:
					Next_State <= State_Clear_10_5;				
					
				State_Clear_10_5:
					Next_State <= State_Clear_10_6;
					
				State_Clear_10_6:
					Next_State <= State_Clear_10_7;
				
				State_Clear_10_7:
					Next_State <= State_Clear_10_8;
					
				State_Clear_10_8:
					Next_State <= State_Clear_10_9;
				
				State_Clear_10_9:
					Next_State <= State_Clear_10_10;
					
				State_Clear_10_10:
					Next_State <= State_Clear_10_11;
					
				State_Clear_10_11:
					Next_State <= State_Clear_11;
					
				// line11
				State_Clear_11:
					begin
						if (line11)
							Next_State <= State_Clear_11_1;
						else
							Next_State <= State_Clear_12;
					end
				
				State_Clear_11_1:
					Next_State <= State_Clear_11_2;
					
				State_Clear_11_2:
					Next_State <= State_Clear_11_3;
					
				State_Clear_11_3:
					Next_State <= State_Clear_11_4;
					
				State_Clear_11_4:
					Next_State <= State_Clear_11_5;				
					
				State_Clear_11_5:
					Next_State <= State_Clear_11_6;
					
				State_Clear_11_6:
					Next_State <= State_Clear_11_7;
				
				State_Clear_11_7:
					Next_State <= State_Clear_11_8;
					
				State_Clear_11_8:
					Next_State <= State_Clear_11_9;
				
				State_Clear_11_9:
					Next_State <= State_Clear_11_10;
					
				State_Clear_11_10:
					Next_State <= State_Clear_11_11;
				
				State_Clear_11_11:
					Next_State <= State_Clear_11_12;
				
				State_Clear_11_12:
					Next_State <= State_Clear_12;
					
				// line12
				State_Clear_12:
					begin
						if (line12)
							Next_State <= State_Clear_12_1;
						else
							Next_State <= State_Clear_13;
					end
				
				State_Clear_12_1:
					Next_State <= State_Clear_12_2;
					
				State_Clear_12_2:
					Next_State <= State_Clear_12_3;
					
				State_Clear_12_3:
					Next_State <= State_Clear_12_4;
					
				State_Clear_12_4:
					Next_State <= State_Clear_12_5;				
					
				State_Clear_12_5:
					Next_State <= State_Clear_12_6;
					
				State_Clear_12_6:
					Next_State <= State_Clear_12_7;
				
				State_Clear_12_7:
					Next_State <= State_Clear_12_8;
					
				State_Clear_12_8:
					Next_State <= State_Clear_12_9;
				
				State_Clear_12_9:
					Next_State <= State_Clear_12_10;
					
				State_Clear_12_10:
					Next_State <= State_Clear_12_11;
				
				State_Clear_12_11:
					Next_State <= State_Clear_12_12;
				
				State_Clear_12_12:
					Next_State <= State_Clear_12_13;
					
				State_Clear_12_13:
					Next_State <= State_Clear_13;
					
				// line13
				State_Clear_13:
					begin
						if (line13)
							Next_State <= State_Clear_13_1;
						else
							Next_State <= State_Clear_14;
					end
				
				State_Clear_13_1:
					Next_State <= State_Clear_13_2;
					
				State_Clear_13_2:
					Next_State <= State_Clear_13_3;
					
				State_Clear_13_3:
					Next_State <= State_Clear_13_4;
					
				State_Clear_13_4:
					Next_State <= State_Clear_13_5;				
					
				State_Clear_13_5:
					Next_State <= State_Clear_13_6;
					
				State_Clear_13_6:
					Next_State <= State_Clear_13_7;
				
				State_Clear_13_7:
					Next_State <= State_Clear_13_8;
					
				State_Clear_13_8:
					Next_State <= State_Clear_13_9;
				
				State_Clear_13_9:
					Next_State <= State_Clear_13_10;
					
				State_Clear_13_10:
					Next_State <= State_Clear_13_11;
				
				State_Clear_13_11:
					Next_State <= State_Clear_13_12;
				
				State_Clear_13_12:
					Next_State <= State_Clear_13_13;
					
				State_Clear_13_13:
					Next_State <= State_Clear_13_14;
					
				State_Clear_13_14:
					Next_State <= State_Clear_14;
					
				// line14
				State_Clear_14:
					begin
						if (line14)
							Next_State <= State_Clear_14_1;
						else
							Next_State <= State_Clear_15;
					end
				
				State_Clear_14_1:
					Next_State <= State_Clear_14_2;
					
				State_Clear_14_2:
					Next_State <= State_Clear_14_3;
					
				State_Clear_14_3:
					Next_State <= State_Clear_14_4;
					
				State_Clear_14_4:
					Next_State <= State_Clear_14_5;				
					
				State_Clear_14_5:
					Next_State <= State_Clear_14_6;
					
				State_Clear_14_6:
					Next_State <= State_Clear_14_7;
				
				State_Clear_14_7:
					Next_State <= State_Clear_14_8;
					
				State_Clear_14_8:
					Next_State <= State_Clear_14_9;
				
				State_Clear_14_9:
					Next_State <= State_Clear_14_10;
					
				State_Clear_14_10:
					Next_State <= State_Clear_14_11;
				
				State_Clear_14_11:
					Next_State <= State_Clear_14_12;
				
				State_Clear_14_12:
					Next_State <= State_Clear_14_13;
					
				State_Clear_14_13:
					Next_State <= State_Clear_14_14;
					
				State_Clear_14_14:
					Next_State <= State_Clear_14_15;
					
				State_Clear_14_15:
					Next_State <= State_Clear_15;
					
				// line15
				State_Clear_15:
					begin
						if (line15)
							Next_State <= State_Clear_15_1;
						else
							Next_State <= State_Clear_16;
					end
				
				State_Clear_15_1:
					Next_State <= State_Clear_15_2;
					
				State_Clear_15_2:
					Next_State <= State_Clear_15_3;
					
				State_Clear_15_3:
					Next_State <= State_Clear_15_4;
					
				State_Clear_15_4:
					Next_State <= State_Clear_15_5;				
					
				State_Clear_15_5:
					Next_State <= State_Clear_15_6;
					
				State_Clear_15_6:
					Next_State <= State_Clear_15_7;
				
				State_Clear_15_7:
					Next_State <= State_Clear_15_8;
					
				State_Clear_15_8:
					Next_State <= State_Clear_15_9;
				
				State_Clear_15_9:
					Next_State <= State_Clear_15_10;
					
				State_Clear_15_10:
					Next_State <= State_Clear_15_11;
				
				State_Clear_15_11:
					Next_State <= State_Clear_15_12;
				
				State_Clear_15_12:
					Next_State <= State_Clear_15_13;
					
				State_Clear_15_13:
					Next_State <= State_Clear_15_14;
					
				State_Clear_15_14:
					Next_State <= State_Clear_15_15;
					
				State_Clear_15_15:
					Next_State <= State_Clear_15_16;
					
				State_Clear_15_16:
					Next_State <= State_Clear_16;
					
				// line16
				State_Clear_16:
					begin
						if (line16)
							Next_State <= State_Clear_16_1;
						else
							Next_State <= State_Clear_17;
					end
				
				State_Clear_16_1:
					Next_State <= State_Clear_16_2;
					
				State_Clear_16_2:
					Next_State <= State_Clear_16_3;
					
				State_Clear_16_3:
					Next_State <= State_Clear_16_4;
					
				State_Clear_16_4:
					Next_State <= State_Clear_16_5;				
					
				State_Clear_16_5:
					Next_State <= State_Clear_16_6;
					
				State_Clear_16_6:
					Next_State <= State_Clear_16_7;
				
				State_Clear_16_7:
					Next_State <= State_Clear_16_8;
					
				State_Clear_16_8:
					Next_State <= State_Clear_16_9;
				
				State_Clear_16_9:
					Next_State <= State_Clear_16_10;
					
				State_Clear_16_10:
					Next_State <= State_Clear_16_11;
				
				State_Clear_16_11:
					Next_State <= State_Clear_16_12;
				
				State_Clear_16_12:
					Next_State <= State_Clear_16_13;
					
				State_Clear_16_13:
					Next_State <= State_Clear_16_14;
					
				State_Clear_16_14:
					Next_State <= State_Clear_16_15;
					
				State_Clear_16_15:
					Next_State <= State_Clear_16_16;
					
				State_Clear_16_16:
					Next_State <= State_Clear_16_17;
					
				State_Clear_16_17:
					Next_State <= State_Clear_17;
					
				// line17
				State_Clear_17:
					begin
						if (line17)
							Next_State <= State_Clear_17_1;
						else
							Next_State <= State_Clear_18;
					end
				
				State_Clear_17_1:
					Next_State <= State_Clear_17_2;
					
				State_Clear_17_2:
					Next_State <= State_Clear_17_3;
					
				State_Clear_17_3:
					Next_State <= State_Clear_17_4;
					
				State_Clear_17_4:
					Next_State <= State_Clear_17_5;				
					
				State_Clear_17_5:
					Next_State <= State_Clear_17_6;
					
				State_Clear_17_6:
					Next_State <= State_Clear_17_7;
				
				State_Clear_17_7:
					Next_State <= State_Clear_17_8;
					
				State_Clear_17_8:
					Next_State <= State_Clear_17_9;
				
				State_Clear_17_9:
					Next_State <= State_Clear_17_10;
					
				State_Clear_17_10:
					Next_State <= State_Clear_17_11;
				
				State_Clear_17_11:
					Next_State <= State_Clear_17_12;
				
				State_Clear_17_12:
					Next_State <= State_Clear_17_13;
					
				State_Clear_17_13:
					Next_State <= State_Clear_17_14;
					
				State_Clear_17_14:
					Next_State <= State_Clear_17_15;
					
				State_Clear_17_15:
					Next_State <= State_Clear_17_16;
					
				State_Clear_17_16:
					Next_State <= State_Clear_17_17;
					
				State_Clear_17_17:
					Next_State <= State_Clear_17_18;
					
				State_Clear_17_18:
					Next_State <= State_Clear_18;
					
				// line18
				State_Clear_18:
					begin
						if (line18)
							Next_State <= State_Clear_18_1;
						else
							Next_State <= State_Clear_19;
					end
				
				State_Clear_18_1:
					Next_State <= State_Clear_18_2;
					
				State_Clear_18_2:
					Next_State <= State_Clear_18_3;
					
				State_Clear_18_3:
					Next_State <= State_Clear_18_4;
					
				State_Clear_18_4:
					Next_State <= State_Clear_18_5;				
					
				State_Clear_18_5:
					Next_State <= State_Clear_18_6;
					
				State_Clear_18_6:
					Next_State <= State_Clear_18_7;
				
				State_Clear_18_7:
					Next_State <= State_Clear_18_8;
					
				State_Clear_18_8:
					Next_State <= State_Clear_18_9;
				
				State_Clear_18_9:
					Next_State <= State_Clear_18_10;
					
				State_Clear_18_10:
					Next_State <= State_Clear_18_11;
				
				State_Clear_18_11:
					Next_State <= State_Clear_18_12;
				
				State_Clear_18_12:
					Next_State <= State_Clear_18_13;
					
				State_Clear_18_13:
					Next_State <= State_Clear_18_14;
					
				State_Clear_18_14:
					Next_State <= State_Clear_18_15;
					
				State_Clear_18_15:
					Next_State <= State_Clear_18_16;
					
				State_Clear_18_16:
					Next_State <= State_Clear_18_17;
					
				State_Clear_18_17:
					Next_State <= State_Clear_18_18;
					
				State_Clear_18_18:
					Next_State <= State_Clear_18_19;
					
				State_Clear_18_19:
					Next_State <= State_Clear_19;
				
				// line19
				State_Clear_19:
					begin
						if (line19)
							Next_State <= State_Clear_19_1;
						else
							Next_State <= State_Reload;
					end
				
				State_Clear_19_1:
					Next_State <= State_Clear_19_2;
					
				State_Clear_19_2:
					Next_State <= State_Clear_19_3;
					
				State_Clear_19_3:
					Next_State <= State_Clear_19_4;
					
				State_Clear_19_4:
					Next_State <= State_Clear_19_5;				
					
				State_Clear_19_5:
					Next_State <= State_Clear_19_6;
					
				State_Clear_19_6:
					Next_State <= State_Clear_19_7;
				
				State_Clear_19_7:
					Next_State <= State_Clear_19_8;
					
				State_Clear_19_8:
					Next_State <= State_Clear_19_9;
				
				State_Clear_19_9:
					Next_State <= State_Clear_19_10;
					
				State_Clear_19_10:
					Next_State <= State_Clear_19_11;
				
				State_Clear_19_11:
					Next_State <= State_Clear_19_12;
				
				State_Clear_19_12:
					Next_State <= State_Clear_19_13;
					
				State_Clear_19_13:
					Next_State <= State_Clear_19_14;
					
				State_Clear_19_14:
					Next_State <= State_Clear_19_15;
					
				State_Clear_19_15:
					Next_State <= State_Clear_19_16;
					
				State_Clear_19_16:
					Next_State <= State_Clear_19_17;
					
				State_Clear_19_17:
					Next_State <= State_Clear_19_18;
					
				State_Clear_19_18:
					Next_State <= State_Clear_19_19;
					
				State_Clear_19_19:
					Next_State <= State_Clear_19_20;
					
				State_Clear_19_20:
					Next_State <= State_Reload;

				// Loads in the updated PixelMap
				State_Reload:
					Next_State <= State_Block;
					
			default : ;
		endcase
	end
	
	//always_ff @ (posedge Clk or posedge Reset)
	always_comb
		begin
		//Default Zeros
//		MoveBlock = 1'b0;
		Mux_Select = 2'd0; // Keep PixelMap
		// Load
		LoadRealReg = 1'b0;
		ResetShape = 1'b0;
		// Clear
		LoadAll = 1'b0;
		Load0 = 1'b0;
		Load1 = 1'b0;
		Load2 = 1'b0;
		Load3 = 1'b0;
		Load4 = 1'b0;
		Load5 = 1'b0;
		Load6 = 1'b0;
		Load7 = 1'b0;
		Load8 = 1'b0;
		Load9 = 1'b0;
		Load10 = 1'b0;
		Load11 = 1'b0;
		Load12 = 1'b0;
		Load13 = 1'b0;
		Load14 = 1'b0;
		Load15 = 1'b0;
		Load16 = 1'b0;
		Load17 = 1'b0;
		Load18 = 1'b0;
		Load19 = 1'b0;
			
			case(State)
//					State_Block_Movement:
//						begin
//						MoveBlock = 1'b1;
//						end

					State_Load:
						begin
						Mux_Select = 2'd1;
						LoadRealReg = 1'b1;
						end
						
					State_Reset:
						ResetShape = 1'b1;
						
					// Needs to first put current PixelMap into TempPixelMap
					State_Clear_Prep:
						LoadAll = 1'b1;
						
					// Clear Stages
					// line0
					State_Clear_0_1:
						Load0 = 1'b1;	// shifts all_zeros into row0
					
					// line1
					State_Clear_1_1:
						Load1 = 1'b1; // shifts row0 into row1
					
					State_Clear_1_2:
						Load0 = 1'b1;	// shifts all_zeros into row0
	
					// line2
					State_Clear_2_1:
						Load2 = 1'b1; // shifts row1 into row2
						
					State_Clear_2_2:
						Load1 = 1'b1; // shifts row0 into row1
						
					State_Clear_2_3:
						Load0 = 1'b1;	// shifts all_zeros into row0
						
					// line3
					State_Clear_3_1:
						Load3 = 1'b1; // shifts row2 into row3
						
					State_Clear_3_2:
						Load2 = 1'b1; // shifts row1 into row2
						
					State_Clear_3_3:
						Load1 = 1'b1; // shifts row0 into row1
						
					State_Clear_3_4:
						Load0 = 1'b1;	// shifts all_zeros into row0					
						
					// line4
					State_Clear_4_1:
						Load4 = 1'b1;
						
					State_Clear_4_2:
						Load3 = 1'b1;
						
					State_Clear_4_3:
						Load2 = 1'b1;
						
					State_Clear_4_4:
						Load1 = 1'b1;				
						
					State_Clear_4_5:
						Load0 = 1'b1;
						
					// line5
					State_Clear_5_1:
						Load5 = 1'b1;
						
					State_Clear_5_2:
						Load4 = 1'b1;
						
					State_Clear_5_3:
						Load3 = 1'b1;
						
					State_Clear_5_4:
						Load2 = 1'b1;				
						
					State_Clear_5_5:
						Load1 = 1'b1;
						
					State_Clear_5_6:
						Load0 = 1'b1;
						
					// line6
					State_Clear_6_1:
						Load6 = 1'b1;
						
					State_Clear_6_2:
						Load5 = 1'b1;
						
					State_Clear_6_3:
						Load4 = 1'b1;
						
					State_Clear_6_4:
						Load3 = 1'b1;				
						
					State_Clear_6_5:
						Load2 = 1'b1;
						
					State_Clear_6_6:
						Load1 = 1'b1;
					
					State_Clear_6_7:
						Load0 = 1'b1;
						
					// line7
					State_Clear_7_1:
						Load7 = 1'b1;
						
					State_Clear_7_2:
						Load6 = 1'b1;
						
					State_Clear_7_3:
						Load5 = 1'b1;
						
					State_Clear_7_4:
						Load4 = 1'b1;				
						
					State_Clear_7_5:
						Load3 = 1'b1;
						
					State_Clear_7_6:
						Load2 = 1'b1;
					
					State_Clear_7_7:
						Load1 = 1'b1;
						
					State_Clear_7_8:
						Load0 = 1'b1;
	
					// line8
					State_Clear_8_1:
						Load8 = 1'b1;
						
					State_Clear_8_2:
						Load7 = 1'b1;
						
					State_Clear_8_3:
						Load6 = 1'b1;
						
					State_Clear_8_4:
						Load5 = 1'b1;				
						
					State_Clear_8_5:
						Load4 = 1'b1;
						
					State_Clear_8_6:
						Load3 = 1'b1;
					
					State_Clear_8_7:
						Load2 = 1'b1;
						
					State_Clear_8_8:
						Load1 = 1'b1;
					
					State_Clear_8_9:
						Load0 = 1'b1;
	
					// line9
					State_Clear_9_1:
						Load9 = 1'b1;
						
					State_Clear_9_2:
						Load8 = 1'b1;
						
					State_Clear_9_3:
						Load7 = 1'b1;
						
					State_Clear_9_4:
						Load6 = 1'b1;				
						
					State_Clear_9_5:
						Load5 = 1'b1;
						
					State_Clear_9_6:
						Load4 = 1'b1;
					
					State_Clear_9_7:
						Load3 = 1'b1;
						
					State_Clear_9_8:
						Load2 = 1'b1;
					
					State_Clear_9_9:
						Load1 = 1'b1;
					
					State_Clear_9_10:
						Load0 = 1'b1;
	
					// line10
					State_Clear_10_1:
						Load10 = 1'b1;
						
					State_Clear_10_2:
						Load9 = 1'b1;
						
					State_Clear_10_3:
						Load8 = 1'b1;
						
					State_Clear_10_4:
						Load7 = 1'b1;				
						
					State_Clear_10_5:
						Load6 = 1'b1;
						
					State_Clear_10_6:
						Load5 = 1'b1;
					
					State_Clear_10_7:
						Load4 = 1'b1;
						
					State_Clear_10_8:
						Load3 = 1'b1;
					
					State_Clear_10_9:
						Load2 = 1'b1;
						
					State_Clear_10_10:
						Load1 = 1'b1;
						
					State_Clear_10_11:
						Load0 = 1'b1;
						
					// line11
					State_Clear_11_1:
						Load11 = 1'b1;
						
					State_Clear_11_2:
						Load10 = 1'b1;
						
					State_Clear_11_3:
						Load9 = 1'b1;
						
					State_Clear_11_4:
						Load8 = 1'b1;
						
					State_Clear_11_5:
						Load7 = 1'b1;
						
					State_Clear_11_6:
						Load6 = 1'b1;
					
					State_Clear_11_7:
						Load5 = 1'b1;
						
					State_Clear_11_8:
						Load4 = 1'b1;
					
					State_Clear_11_9:
						Load3 = 1'b1;
						
					State_Clear_11_10:
						Load2 = 1'b1;
					
					State_Clear_11_11:
						Load1 = 1'b1;
					
					State_Clear_11_12:
						Load0 = 1'b1;
						
					// line12
					State_Clear_12_1:
						Load12 = 1'b1;
						
					State_Clear_12_2:
						Load11 = 1'b1;
						
					State_Clear_12_3:
						Load10 = 1'b1;
						
					State_Clear_12_4:
						Load9 = 1'b1;
						
					State_Clear_12_5:
						Load8 = 1'b1;
						
					State_Clear_12_6:
						Load7 = 1'b1;
					
					State_Clear_12_7:
						Load6 = 1'b1;
						
					State_Clear_12_8:
						Load5 = 1'b1;
					
					State_Clear_12_9:
						Load4 = 1'b1;
						
					State_Clear_12_10:
						Load3 = 1'b1;
					
					State_Clear_12_11:
						Load2 = 1'b1;
					
					State_Clear_12_12:
						Load1 = 1'b1;
						
					State_Clear_12_13:
						Load0 = 1'b1;
						
					// line13
					State_Clear_13_1:
						Load13 = 1'b1;
						
					State_Clear_13_2:
						Load12 = 1'b1;
						
					State_Clear_13_3:
						Load11 = 1'b1;
						
					State_Clear_13_4:
						Load10 = 1'b1;	
						
					State_Clear_13_5:
						Load9 = 1'b1;
						
					State_Clear_13_6:
						Load8 = 1'b1;
					
					State_Clear_13_7:
						Load7 = 1'b1;
						
					State_Clear_13_8:
						Load6 = 1'b1;
					
					State_Clear_13_9:
						Load5 = 1'b1;
						
					State_Clear_13_10:
						Load4 = 1'b1;
					
					State_Clear_13_11:
						Load3 = 1'b1;
					
					State_Clear_13_12:
						Load2 = 1'b1;
						
					State_Clear_13_13:
						Load1 = 1'b1;
						
					State_Clear_13_14:
						Load0 = 1'b1;
						
					// line14
					State_Clear_14_1:
						Load14 = 1'b1;
						
					State_Clear_14_2:
						Load13 = 1'b1;
						
					State_Clear_14_3:
						Load12 = 1'b1;
						
					State_Clear_14_4:
						Load11 = 1'b1;				
						
					State_Clear_14_5:
						Load10 = 1'b1;
						
					State_Clear_14_6:
						Load9 = 1'b1;
					
					State_Clear_14_7:
						Load8 = 1'b1;
						
					State_Clear_14_8:
						Load7 = 1'b1;
					
					State_Clear_14_9:
						Load6 = 1'b1;
						
					State_Clear_14_10:
						Load5 = 1'b1;
					
					State_Clear_14_11:
						Load4 = 1'b1;
					
					State_Clear_14_12:
						Load3 = 1'b1;
						
					State_Clear_14_13:
						Load2 = 1'b1;
						
					State_Clear_14_14:
						Load1 = 1'b1;
						
					State_Clear_14_15:
						Load0 = 1'b1;
						
					// line15
					State_Clear_15_1:
						Load15 = 1'b1;
						
					State_Clear_15_2:
						Load14 = 1'b1;
						
					State_Clear_15_3:
						Load13 = 1'b1;
						
					State_Clear_15_4:
						Load12 = 1'b1;		
						
					State_Clear_15_5:
						Load11 = 1'b1;
						
					State_Clear_15_6:
						Load10 = 1'b1;
					
					State_Clear_15_7:
						Load9 = 1'b1;
						
					State_Clear_15_8:
						Load8 = 1'b1;
					
					State_Clear_15_9:
						Load7 = 1'b1;
						
					State_Clear_15_10:
						Load6 = 1'b1;
					
					State_Clear_15_11:
						Load5 = 1'b1;
					
					State_Clear_15_12:
						Load4 = 1'b1;
						
					State_Clear_15_13:
						Load3 = 1'b1;
						
					State_Clear_15_14:
						Load2 = 1'b1;
						
					State_Clear_15_15:
						Load1 = 1'b1;
						
					State_Clear_15_16:
						Load0 = 1'b1;
						
					// line16
					State_Clear_16_1:
						Load16 = 1'b1;
						
					State_Clear_16_2:
						Load15 = 1'b1;
						
					State_Clear_16_3:
						Load14 = 1'b1;
						
					State_Clear_16_4:
						Load13 = 1'b1;			
						
					State_Clear_16_5:
						Load12 = 1'b1;
						
					State_Clear_16_6:
						Load11 = 1'b1;
					
					State_Clear_16_7:
						Load10 = 1'b1;
						
					State_Clear_16_8:
						Load9 = 1'b1;
					
					State_Clear_16_9:
						Load8 = 1'b1;
						
					State_Clear_16_10:
						Load7 = 1'b1;
					
					State_Clear_16_11:
						Load6 = 1'b1;
					
					State_Clear_16_12:
						Load5 = 1'b1;
						
					State_Clear_16_13:
						Load4 = 1'b1;
						
					State_Clear_16_14:
						Load3 = 1'b1;
						
					State_Clear_16_15:
						Load2 = 1'b1;
						
					State_Clear_16_16:
						Load1 = 1'b1;
						
					State_Clear_16_17:
						Load0 = 1'b1;
						
					// line17
					State_Clear_17_1:
						Load17 = 1'b1;
						
					State_Clear_17_2:
						Load16 = 1'b1;
						
					State_Clear_17_3:
						Load15 = 1'b1;
						
					State_Clear_17_4:
						Load14 = 1'b1;		
						
					State_Clear_17_5:
						Load13 = 1'b1;
						
					State_Clear_17_6:
						Load12 = 1'b1;
					
					State_Clear_17_7:
						Load11 = 1'b1;
						
					State_Clear_17_8:
						Load10 = 1'b1;
					
					State_Clear_17_9:
						Load9 = 1'b1;
						
					State_Clear_17_10:
						Load8 = 1'b1;
					
					State_Clear_17_11:
						Load7 = 1'b1;
					
					State_Clear_17_12:
						Load6 = 1'b1;
						
					State_Clear_17_13:
						Load5 = 1'b1;
						
					State_Clear_17_14:
						Load4 = 1'b1;
						
					State_Clear_17_15:
						Load3 = 1'b1;
						
					State_Clear_17_16:
						Load2 = 1'b1;
						
					State_Clear_17_17:
						Load1 = 1'b1;
						
					State_Clear_17_18:
						Load0 = 1'b1;
						
					// line18
					State_Clear_18_1:
						Load18 = 1'b1;
						
					State_Clear_18_2:
						Load17 = 1'b1;
						
					State_Clear_18_3:
						Load16 = 1'b1;
						
					State_Clear_18_4:
						Load15 = 1'b1;			
						
					State_Clear_18_5:
						Load14 = 1'b1;
						
					State_Clear_18_6:
						Load13 = 1'b1;
					
					State_Clear_18_7:
						Load12 = 1'b1;
						
					State_Clear_18_8:
						Load11 = 1'b1;
					
					State_Clear_18_9:
						Load10 = 1'b1;
						
					State_Clear_18_10:
						Load9 = 1'b1;
					
					State_Clear_18_11:
						Load8 = 1'b1;
					
					State_Clear_18_12:
						Load7 = 1'b1;
						
					State_Clear_18_13:
						Load6 = 1'b1;
						
					State_Clear_18_14:
						Load5 = 1'b1;
						
					State_Clear_18_15:
						Load4 = 1'b1;
						
					State_Clear_18_16:
						Load3 = 1'b1;
						
					State_Clear_18_17:
						Load2 = 1'b1;
						
					State_Clear_18_18:
						Load1 = 1'b1;
						
					State_Clear_18_19:
						Load0 = 1'b1;
					
					// line19
					State_Clear_19_1:
						Load19 = 1'b1;
						
					State_Clear_19_2:
						Load18 = 1'b1;
						
					State_Clear_19_3:
						Load17 = 1'b1;
						
					State_Clear_19_4:
						Load16 = 1'b1;
						
					State_Clear_19_5:
						Load15 = 1'b1;
						
					State_Clear_19_6:
						Load14 = 1'b1;
					
					State_Clear_19_7:
						Load13 = 1'b1;
						
					State_Clear_19_8:
						Load12 = 1'b1;
					
					State_Clear_19_9:
						Load11 = 1'b1;
						
					State_Clear_19_10:
						Load10 = 1'b1;
					
					State_Clear_19_11:
						Load9 = 1'b1;
					
					State_Clear_19_12:
						Load8 = 1'b1;
						
					State_Clear_19_13:
						Load7 = 1'b1;
						
					State_Clear_19_14:
						Load6 = 1'b1;
						
					State_Clear_19_15:
						Load5 = 1'b1;
						
					State_Clear_19_16:
						Load4 = 1'b1;
						
					State_Clear_19_17:
						Load3 = 1'b1;
						
					State_Clear_19_18:
						Load2 = 1'b1;
						
					State_Clear_19_19:
						Load1 = 1'b1;
						
					State_Clear_19_20:
						Load0 = 1'b1;
					// end Clear Stages - TempPixelMap now fully updated
			
					State_Reload:
						begin
						Mux_Select = 2'd2;
						LoadRealReg = 1'b1;	// Load back into RealPixelMap
						end
						
				default : ;
			endcase
		end	
	
endmodule
