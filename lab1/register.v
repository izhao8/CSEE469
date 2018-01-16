`include "D_FF.v"

module register (in, out, en, clk);
	output [63:0] out;

	input [63:0] in;
	input en, clk;

	wire [63:0] temp, old;

	assign old = out;
	generate
		genvar i; 
		for (i = 0; i < 64; i = i + 1'b1) begin
			mux2to1 choose (.new(in[i]), .old(old[i]), .out(temp[i]), .en(en));
			D_FF set (.q(out[i]), .d(temp[i]), .reset(1'b0), .clk(clk));
		end
	endgenerate
endmodule

module mux2to1 (new, old, out, en);
	output wire out;

	input new, old, en;

	assign out = (en & new) | (~en & old);

endmodule
