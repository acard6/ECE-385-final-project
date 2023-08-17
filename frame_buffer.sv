module frame_buffer (input Clk, Reset, LoadAll,
									input Load0, Load1, Load2, Load3, Load4, Load5, Load6, Load7, Load8, Load9, Load10, Load11, Load12, Load13, Load14, Load15,
											Load16, Load17, Load18, Load19,
									input [19:0][9:0][3:0] PixelMap,
									output [19:0][9:0][3:0] PixelMapOut);

logic [9:0][3:0] Row0, Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9, Row10, Row11, Row12, Row13, Row14, Row15, Row16, Row17, Row18, Row19;			
assign PixelMapOut = '{{Row19}, {Row18}, {Row17}, {Row16}, {Row15}, {Row14}, {Row13}, {Row12}, {Row11}, {Row10}, {Row9}, {Row8}, {Row7}, {Row6}, 
								{Row5}, {Row4}, {Row3}, {Row2}, {Row1}, {Row0}};

logic [9:0][3:0] all_zeros;
assign all_zeros = '{default:4'b0};
			
	Row_Reg row0 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load0),
					  .PixelMapIn(PixelMap[0]),	// Loads the appropriate row of [19:0][9:0][3:0] PixelMap
					  .RowIn(all_zeros),				// Row to Load in if Clear is called (all zeros for topmost row)
					  .Out(Row0));						// Current values of this row
					  
	Row_Reg row1 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load1),
					  .PixelMapIn(PixelMap[1]),
					  .RowIn(Row0),						// Loads in the Previous Row (shift down)
					  .Out(Row1));	

	Row_Reg row2 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load2),
					  .PixelMapIn(PixelMap[2]),
					  .RowIn(Row1),
					  .Out(Row2));  
					  
	Row_Reg row3 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load3),
					  .PixelMapIn(PixelMap[3]),
					  .RowIn(Row2),
					  .Out(Row3));  
					  
	Row_Reg row4 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load4),
					  .PixelMapIn(PixelMap[4]),
					  .RowIn(Row3),
					  .Out(Row4));  
					  
	Row_Reg row5 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load5),
					  .PixelMapIn(PixelMap[5]),
					  .RowIn(Row4),
					  .Out(Row5));  
					  
	Row_Reg row6 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load6),
					  .PixelMapIn(PixelMap[6]),
					  .RowIn(Row5),
					  .Out(Row6));  
					  
	Row_Reg row7 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load7),
					  .PixelMapIn(PixelMap[7]),
					  .RowIn(Row6),
					  .Out(Row7));  
					  
	Row_Reg row8 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load8),
					  .PixelMapIn(PixelMap[8]),
					  .RowIn(Row7),
					  .Out(Row8));  
					  
	Row_Reg row9 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load9),
					  .PixelMapIn(PixelMap[9]),
					  .RowIn(Row8),
					  .Out(Row9));  
					  
	Row_Reg row10 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load10),
					  .PixelMapIn(PixelMap[10]),
					  .RowIn(Row9),
					  .Out(Row10));  
					  
	Row_Reg row11 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load11),
					  .PixelMapIn(PixelMap[11]),
					  .RowIn(Row10),
					  .Out(Row11));  
					  
	Row_Reg row12 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load12),
					  .PixelMapIn(PixelMap[12]),
					  .RowIn(Row11),
					  .Out(Row12));  
					  
	Row_Reg row13 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load13),
					  .PixelMapIn(PixelMap[13]),
					  .RowIn(Row12),
					  .Out(Row13));  
					  
	Row_Reg row14 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load14),
					  .PixelMapIn(PixelMap[14]),
					  .RowIn(Row13),
					  .Out(Row14));  
					  
	Row_Reg row15 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load15),
					  .PixelMapIn(PixelMap[15]),
					  .RowIn(Row14),
					  .Out(Row15));  
					  
	Row_Reg row16 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load16),
					  .PixelMapIn(PixelMap[16]),
					  .RowIn(Row15),
					  .Out(Row16));  
					  
	Row_Reg row17 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load17),
					  .PixelMapIn(PixelMap[17]),
					  .RowIn(Row16),
					  .Out(Row17));  
					  
	Row_Reg row18 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load18),
					  .PixelMapIn(PixelMap[18]),
					  .RowIn(Row17),
					  .Out(Row18));  
					  
	Row_Reg row19 (.Clk,
					  .Reset,
					  .LoadAll,
					  .LoadRow(Load19),
					  .PixelMapIn(PixelMap[19]),
					  .RowIn(Row18),
					  .Out(Row19));  
					  

endmodule
