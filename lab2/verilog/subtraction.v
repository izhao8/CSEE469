module subtraction (A, B, out, neg, of, C);
	output [63:0] out;
	output neg, of, C;

	input [63:0] A, B;

	wire C0, B0;

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			assign C0 = B0;
			subtractor sub (A[i], B[i], C0, B0, out[i]);
		end
	endgenerate
	assign C = B0;
endmodule

module subtractor (A, B, Bi, Bo, S);
	output Bo, S;

	input A, B, Bi;

	wire rA, temp;
	wire [2:0] Bw;

	not (rA, A);

	xor (temp, A, B);
	xor (S, temp, Bi);

	and (Bw[0], rA, B);
	and (Bw[1], Bi, B);
	and (Bw[2], rA, Bi);

	or (Bo, Bw[0], Bw[1], Bw[2]);
endmodule