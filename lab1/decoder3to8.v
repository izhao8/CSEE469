module decoder3to8 (in, out, en);
	output wire [7:0] out;

	input en;
	input [2:0] in;

	assign out[0] = ~in[0] & ~in[1] & ~in[2] & en;
	assign out[1] = ~in[0] & ~in[1] & in[2] & en;
	assign out[2] = ~in[0] & in[1] & ~in[2] & en;
	assign out[3] = ~in[0] & in[1] & in[2] & en;
	assign out[4] = in[0] & ~in[1] & ~in[2] & en;
	assign out[5] = in[0] & ~in[1] & in[2] & en;
	assign out[6] = in[0] & in[1] & ~in[2] & en;
	assign out[7] = in[0] & in[1] & in[2] & en;
endmodule