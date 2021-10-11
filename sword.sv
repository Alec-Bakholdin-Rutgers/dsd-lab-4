module sword (input logic sw, reset, clk,
					output logic v);
					
	d_ff(~reset & (sw | v), clk, v);
	
endmodule
