`timescale 1ns/10ps

module adder (i0, i1, Ci, Co, S);
	output S, Co;

	input i0, i1, Ci;

	wire temp0;
	wire [1:0] temp1;

	xor #50 (temp0, i1, i0);
	xor #50 (S, temp0, Ci);

	and #50 (temp1[0], Ci, temp0);
	and #50 (temp1[1], i0, i1);

	or #50 (Co, temp1[0], temp1[1]);
endmodule