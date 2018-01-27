module mux2to1 (i1, i0, out, en);
	output wire out;

	input i0, i1, en;

	wire ren;
	wire [1:0] con;

	not (ren, en);

	and (con[0], en, i1);
	and (con[1], ren, i0);
	
	or (out, con[0], con[1]);
	
endmodule