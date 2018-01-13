`include "D_FF.v"

module register (in, out, en, reset, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk, reset;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			D_FF hold (.q(in[i]), .d(out[i]), .reset(reset), .clk(clk));
		end
	endgenerate

endmodule