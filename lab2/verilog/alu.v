`include "complement.v"
`include "arithmetic.v"
`include "mux5to1.v"
`include "gateLogic.v"
`include "mux2to1.v"

module alu (A, B, cntrol, result, negative, zero, overflow, carry_out);
	input [63:0] A, B;
	input [2:0] cntrol;

	output negative, zero, overflow, carry_out;
	output [63:0] result;

	wire [63:0] tB, ADD, AND, XOR, OR;
	wire t0, c, of;

	// assign AND = A & B;
	// assign XOR = A ^ B;
	// assign OR = A | B;

	bitAND ANDbit (A, B, AND);
	bitOR ORbit (A, B, OR);
	bitXOR XORbit (A, B, XOR);

	complement forSub (B, tB, contrl[0]);
	arithmetic ADDorSUB (A, tB, ADD, of, c, cntrol[0]); 
	mux5to1 choose (ADD, AND, XOR, OR, B, result, cntrol);

	and (t0, cntrol[0], cntrol[1]);
	mux2to1 carry (c, 1'b0, carry_out, t0);
	mux2to1 flow (of, 1'b0, overflow, t0);
	zero check (result, zero);
	assign negative = result[63];
endmodule