`timescale 1ns/10ps
module mux2to1 (i1, i0, out, en);
	output wire out;

	input i0, i1, en;

	wire ren;
	wire [1:0] con;

	not #50 (ren, en);

	and #50 (con[0], en, i1);
	and #50 (con[1], ren, i0);
	
	or #50 (out, con[0], con[1]);
	
endmodule