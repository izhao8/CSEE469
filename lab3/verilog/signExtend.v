`timescale 1ns/10ps

module signExtend(in, out);
	input [31:0] in;

	output [63:0] out;

	assign out = {32'b0, in};

endmodule