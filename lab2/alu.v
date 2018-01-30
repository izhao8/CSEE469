//All testbenching and simulations were done using GTKwave and iVerilog.
//Refer to the verilog folder for testbench modules

`timescale 1ns/10ps
module alu (A, B, cntrl, result, negative, zero, overflow, carry_out);
	input [63:0] A, B;
	input [2:0] cntrl;

	output negative, zero, overflow, carry_out;
	output [63:0] result;

	wire [63:0] tB, ADD, AND, XOR, OR;
	wire t0, c, of;

	bitAND ANDbit (A, B, AND);
	bitOR ORbit (A, B, OR);
	bitXOR XORbit (A, B, XOR);

	//complement forSub (B, tB, cntrl[0]);
	arithmetic ADDorSUB (A, B, ADD, of, c, cntrl[0]); 
	mux5to1 choose (ADD, AND, XOR, OR, B, result, cntrl);

	and #50 (t0, cntrl[0], cntrl[1]);
	mux2to1 carry (c, 1'b0, carry_out, t0);
	mux2to1 flow (of, 1'b0, overflow, t0);
	zero check (result, zero);
	assign negative = result[63];
endmodule