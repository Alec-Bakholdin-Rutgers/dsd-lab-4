module sword (input logic sw, reset, clk, pwin,
					output logic v);
					
	d_ff((~reset & (sw | v | pwin)), clk, v);
	
endmodule
