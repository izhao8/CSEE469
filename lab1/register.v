`include "D_FF.v"

module register (in, out, en, clk, old);
	output [63:0] out;

	input [63:0] in, old;
	input en, clk;

	wire [63:0] hold;

	generate
		genvar i; 
		for (i = 0; i < 64; i = i + 1'b1) begin
			mux2to1 choose (.new(in[i]), .old(old[i]), .out(hold[i]), .en(en));
			D_FF set (.q(out[i]), .d(in[i]), .reset(1'b0), .clk(clk));
		end
	endgenerate

endmodule

module mux2to1 (new, old, out, en);
	output wire out;

	input new, old, en;

	wire A, B;

	assign A = en & new;
	assign B = ~en & old;
	assign out = A | B;

endmodule