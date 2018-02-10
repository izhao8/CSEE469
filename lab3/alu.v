`timescale 1ns/10ps

module alu (A, B, cntrol, result, negative, zero, overflow, carry_out);
	input [63:0] A, B;
	input [3:0] cntrol;

	output negative, zero, overflow, carry_out;
	output [63:0] result;

	wire [63:0] tB, ADD, AND, XOR, OR, MUL_L, MUL_H, LSL, LSR;
	wire t0, c, of, ncntrl;

	bitAND ANDbit (A, B, AND);
	bitOR ORbit (A, B, OR);
	bitXOR XORbit (A, B, XOR);
	mult multiply (A, B, 1, MUL_L, MUL_H);
	shifter lsl (A, 0, 6'd2, LSL);
	shifter lsr (A, 1, 6'd2, LSR);

	arithmetic ADDorSUB (A, B, ADD, of, c, cntrol[0]); 
	mux5to1 choose (ADD, AND, XOR, OR, B, MUL_L, LSL, LSR, result, cntrol);

	not #50 (ncntrl, cntrol[2]);
	and #50 (t0, ncntrl, cntrol[1]);
	
	mux2to1 carry (c, 1'b0, carry_out, t0);
	mux2to1 flow (of, 1'b0, overflow, t0);
	
	zero check (result, zero);
	assign negative = result[63];
endmodule