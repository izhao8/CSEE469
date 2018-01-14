`include "D_FF.v"

module register (in, out, en, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk;

	generate
		genvar i; 
		for (i = 0; i < 64; i = i + 1'b1) begin
			D_FF set (.q(out[i]), .d(in[i]), .reset(en), .clk(clk));
		end
	endgenerate

endmodule