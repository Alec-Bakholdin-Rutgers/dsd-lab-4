module room (input logic clk, n, s, e, w, v, reset, pwin, 
	output logic s6, win, s5, d, s4, s3, sw, s2, s1, s0); 
	
	integer dir;
	
	assign dir = {n, s, e, w};
	integer north = 4'b1000;
	integer south = 4'b0100;
	integer east = 4'b0010;
	integer west = 4'b0001;
	
	
	d_ff(~(s1 | s2 | s3 | s4 | s5 | s6) & (reset | (s1 & (dir == west)) | (s0 & !(dir == east))), clk, s0);
	d_ff(~reset & ~pwin & ((s0 & (dir == east)) | (s2 & (dir == north) | (s1 & (dir != west) & (dir != south)))), clk, s1);
	d_ff(~reset & ~pwin & ((s1 & (dir == south)) | (s3 & (dir == east)) | (s2 & (dir != north) & (dir != west) & (dir != south + east))), clk, s2);
	d_ff(~reset	& ~pwin & ((s2 & (dir == west)) | (s3 & (dir != east))), clk, s3);
	d_ff(~reset & ~pwin & s2 & (dir == south + east), clk, s4);
	d_ff(pwin | (~reset & ((s4 & v) | s5)), clk, s5);
	d_ff(plose | (~reset & ((s4 & ~v) | s6)), clk, s6);
	
	assign sw = s3;
	assign win = s5;
	assign d = s6;

	
endmodule
