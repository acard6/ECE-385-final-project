module Score_Board (input Reset,
						 input[13:0] Score,
						 output [4:0] thousands,
						 output [4:0] hundreds,
						 output [4:0] tens,
						 output [4:0] ones);
						 
logic [4:0] ten = 10;
logic [6:0] hundred = 100;
logic [9:0] thousand = 1000;
						 
always_comb
begin
	thousands = 5'b0;
	hundreds = 5'b0;
	tens = 5'b0;
	ones = 5'b0;
	
	if (Reset)
		begin
		thousands <= 5'b0;
		hundreds <= 5'b0;
		tens <= 5'b0;
		ones <= 5'b0;
		end

	else
		begin
		ones <= Score%ten;
		tens <= (Score/ten)%ten;
		hundreds <= (Score/hundred)%ten;
		thousands <= (Score/thousand)%thousand;
		end
						 
end						 
endmodule 