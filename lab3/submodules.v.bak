`timescale 1ns/10ps

module signExtend(in, out);
	input [31:0] in;

	output [63:0] out;

	assign out = {{32{in[31]}},in};
endmodule

module lsl (in, out);
	input [63:0] in;

	output [63:0] out;

	assign out = in << 2;
endmodule