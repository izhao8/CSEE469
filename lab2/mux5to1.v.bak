`include "mux2to1.v"

module mux5to1 (ADD, AND, XOR, OR, B, out, sel);
	output [63:0] out;

	input [63:0] ADD, AND, XOR, OR, B;
	input [2:0] sel;

	wire [2:0][63:0] t0;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			mux2to1 ANDtoOR (OR[i], AND[i], t0[0][i], sel[0]);
			mux2to1 XORsel (XOR[i], t0[0][i], t0[1][i], sel[1]);
			mux2to1 BtoADD (ADD[i], B[i], t0[2][i], sel[1]);
			mux2to1 final (t0[1][i], t0[2][i], out[i], sel[2]);
		end
	endgenerate

endmodule