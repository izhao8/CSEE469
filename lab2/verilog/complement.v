`include "mux2to1.v"

module complement (in, out, en);
	output [63:0] out;

	input [63:0] in;
	input en;

	wire [63:0] temp;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			not (temp[i], in[i]);
			mux2to1 sel (temp[i], in[i], out[i], en);
		end
	endgenerate

endmodule
