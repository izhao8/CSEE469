`timescale 1ns/10ps

module programCounter(in, PCsrc, out, clk, reset);
	output reg [63:0] out;

	input [63:0] in;
	input clk, reset, PCsrc;

	wire [63:0] B, PC4, temp;
	wire C, of, neg, z;

	alu bcond (temp, in, 4'b0010, B, C, of, neg, z, 6'd0);
	alu pc4 (temp, 64'd4, 4'b0010, PC4, C, of, neg, z, 6'd0);

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
