`include "D_FF.v"
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
			mux2to1 choose (.in(in[i]), .old(old[i]), .out(temp[i]), .en(en));
			D_FF set (.q(out[i]), .d(temp[i]), .reset(1'b0), .clk(clk));
		end
	endgenerate
endmodule

module mux2to1 (in, old, out, en);
	output wire out;

	input in, old, en;

	wire ren;
	wire [1:0] con;

	not #50 ren0 (ren, en);

	and #50 con0 (con[0], en, in);
	and #50 con1 (con[1], ren, old);
	
	or #50 out0 (out, con[0], con[1]);
	
	//assign out = (en & new) | (~en & old);

endmodule
