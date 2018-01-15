module multiplex (in, out, read);
	output [63:0] out;

	input [4:0] read;
	input [31:0][63:0] in;

	assign out = in[read];

endmodule