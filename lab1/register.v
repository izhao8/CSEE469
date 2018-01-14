`include "D_FF.v"

module register (in, out, en, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk;

	generate
		genvar i;
		if (en) begin 
			for (i = 0; i < 64; i = i + 1'b1) begin
				D_FF hold (.q(out[i]), .d(.in[i]), .reset(1'b0), .clk(clk));
			end
		end
	endgenerate
endmodule