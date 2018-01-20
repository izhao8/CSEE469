module arithmetic (A, B, out, of, C, sub);
	output [63:0] out;
	output of, C;

	input [63:0] A, B;
	input sub;

	wire [64:0] C0;
	
	xor (C0[0], sub, o);

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin
			adder add (A[i], B[i], C0[i], C0[i + 1], out[i]);
		end
	endgenerate

	xor (of, C0[63], C0[64]);
	xor (C, C0[64], sub);

endmodule

module adder (A, B, Ci, Co, S);
	output S, Co;

	input A, B, Ci;

	wire temp0;
	wire [1:0] temp1;

	xor (temp0, A, B);
	xor (S, temp0, Ci);

	and (temp1[0], Ci, temp0);
	and (temp1[1], A, B);

	or (Co, temp1[0], temp1[1]);
endmodule