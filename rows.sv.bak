// Individual Register Unit for each row
module Row_Reg (input Clk, Reset, LoadAll, LoadRow,
					 input [9:0][3:0] PixelMapIn,
					 input [9:0][3:0] RowIn,
					 output [9:0][3:0] Out);
					 
always_ff @ (posedge Clk or posedge Reset)
begin

	if (Reset)
		Out <= '{default:4'b0};
		
	else if (LoadAll)
		Out <= PixelMapIn;
		
	else if (LoadRow)
		Out <= RowIn;
		
	else 
		Out <= Out;

end				 
endmodule
