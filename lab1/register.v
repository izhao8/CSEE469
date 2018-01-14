`include "D_FF.v"

module register (in, out, en, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk;

	in(en) begin
		generate
			genvar i;
			for (i = 0; i < 64; i = i + 1) begin
				D_FF hold (.q(out[i]), .d(.in[i]), .reset(0), .clk(clk));
			end
		endgenerate
	end
endmodule