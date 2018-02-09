`timescale 1ns/10ps

module ALUcontrol(instruct, Op, out);
	
	input [10:0] instruct;
	input [1:0] Op;

	output [2:0] out;

	wire [5:0] F;

	assign F = instruct[10:5];

	wire [1:0] t0;

	//Operation 0
	or #50 (t0[0], F[3], F[0]);
	and #50 (out[0], Op[1], t0[0]);

	//Operation 1
	nor #50 (out[1], Op[1], F[2]);

	//operation 2
	and #50 (t0[1], F[1], Op[1]);
	or #50 (out[2], Op[0], t0[1]);


endmodule