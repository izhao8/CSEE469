`timescale 1ns/10ps
`include "register.v"
`include "alu.v"

module programCounter(in, PCsrc, out, clk, reset);
	output [63:0] out;

	input [63:0] in;
	input clk, reset, PCsrc;

	wire [63:0] B, PC4, temp;

	alu bcond (temp, in, 3'b010, B);
	alu pc4 (temp, 64'd4, 3'b010, PC4);

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			mux2to1 sel (B[i], PC4[i], out[i], PCsrc);
		end
	endgenerate

	assign temp = out;

endmodule