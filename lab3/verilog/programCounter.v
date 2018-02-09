`timescale 1ns/10ps
`include "alu.v"

module programCounter(in, PCsrc, out, clk, reset);
	output reg [63:0] out;

	input [63:0] in;
	input clk, reset, PCsrc;

	wire [63:0] B, PC4, temp;
	wire C, of, neg, z;

	alu bcond (temp, in, 3'b010, B, C, of, neg, z);
	alu pc4 (temp, 64'd4, 3'b010, PC4, C, of, neg, z);

	always @(posedge clk) begin
		if (reset)
			out <= 0;
		else if (PCsrc)
			out <= B;
		else begin
			out <= PC4;
		end
	end
	assign temp = out;
endmodule