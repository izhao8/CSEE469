`timescale 1ns/10ps

module signExtend #(parameter width=32) (in, out);
	input [width-1:0] in;

	output [63:0] out;
	

	assign out = $signed(in);
endmodule

module lsl (in, out);
	input [63:0] in;

	output [63:0] out;

	assign out = in << 2;
endmodule

module signExtend0 #(parameter width=32) (in, out);
	input [width-1:0] in;

	output [63:0] out;
	

	assign out = $unsigned(in);
endmodule