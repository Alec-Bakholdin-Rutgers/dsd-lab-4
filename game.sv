module game(input logic clk, n, s, e, w, reset, pwin,
				output logic s6, win, s5, d, s4, s3, sw, s2, s1, s0, v); 
 
	room(clk, n, s, e, w, v, reset, pwin, s6, win, s5, d, s4, s3, sw, s2, s1, s0);
	sword(sw, reset, clk, pwin, v);
 
endmodule 
