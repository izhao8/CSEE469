module zero (in, out);
	output out;

	input [63:0] in;

	wire [15:0] t0;
	wire [3:0] t1;

	generate
		genvar i;
		for (i = 0; i < 16; i = i + 1) begin
			or (t0[i], in[i*4], in[i*4+1], in[i*4+2], in[i*4+3]);
		end
	endgenerate
	
	generate
		genvar j;
		for (j = 0; j < 4; j = j + 1) begin
			or (t1[j], t0[j*4], t0[j*4+1], t0[j*4+2], t0[j*4+3]);
		end
	endgenerate

	nor (out, t1[0], t1[1], t1[2], t1[3]);
endmodule

module bitAND (A, B, out);
	output [63:0] out;

	input [63:0] A, B;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			and (out[i], A[i], B[i]);
		end
	endgenerate
endmodule

module bitOR (A, B, out);
	output [63:0] out;

	input [63:0] A, B;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			or (out[i], A[i], B[i]);
		end
	endgenerate
endmodule

module bitXOR (A, B, out);
	output [63:0] out;

	input [63:0] A, B;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			xor (out[i], A[i], B[i]);
		end
	endgenerate
endmodule

