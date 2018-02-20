`timescale 1ns/10ps

module register (in, out, en, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk;

	wire [63:0] temp, old;

	assign old = out;
	generate
		genvar i; 
		for (i = 0; i < 64; i = i + 1'b1) begin : set
			mux2to1 choose (in[i], old[i], temp[i], en);
			D_FF set (.q(out[i]), .d(temp[i]), .reset(1'b0), .clk(clk));
		end
	endgenerate
endmodule

