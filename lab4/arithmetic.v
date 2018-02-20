`timescale 1ns/10ps

module arithmetic (A, B, out, of, C, sub);
	output [63:0] out;
	output of, C;

	input [63:0] A, B;
	input sub;

	wire [64:0] C0;
	wire [63:0] Btemp;
	
	xor (C0[0], sub, 1'b0);

	generate
		genvar i;
		for (i = 0; i < 64; i = i + 1) begin : arith
			xor (Btemp[i], sub, B[i]);
			adder add (A[i], Btemp[i], C0[i], C0[i + 1], out[i]);
		end
	endgenerate

	xor #50 (C, C0[64], sub);
	xor #50 (of, C0[63], C0[64]);

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