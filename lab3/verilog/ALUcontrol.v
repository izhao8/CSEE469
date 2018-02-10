`timescale 1ns/10ps

module ALUcontrol(instruct, Op, out);
	output [3:0] out;

	input [10:0] instruct;
	input [1:0] Op;

	wire [7:0] F;

	assign F = instruct[10:5];

	wire [1:0] t0;
	wire nOp;

	not (nOp, Op[0]);

	//Operation 0
	or  (t0[0], F[3], F[0]);
	and  (out[0], Op[1], t0[0]);

	//Operation 1
	nor  (out[1], Op[1], F[2]);

	//operation 2
	and  (t0[1], F[1], Op[1]);
	or  (out[2], Op[0], t0[1]);

	//Operation 3
	and (out[3], Op[0], nOp);
endmodule